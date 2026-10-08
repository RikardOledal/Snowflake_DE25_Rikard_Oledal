from pathlib import Path
import dlt
import dagster as dg
from dagster_dlt import DagsterDltResource, dlt_assets
from dagster_dbt import DbtCliResource, DbtProject, dbt_assets

import sys
current_dir = Path(__file__).resolve().parent
target_dir = (current_dir / "../data_extract_load").resolve()
sys.path.insert(0, str(target_dir))

from load_job_ads import jobads_source

dlt_resource = DagsterDltResource()

@dlt_assets(
    dlt_source=jobads_source(),
    dlt_pipeline=dlt.pipeline(
        pipeline_name="jobsearch",
        destination="snowflake",
        dataset_name="staging",
    )
)

def dlt_load(context: dg.AssetExecutionContext, dlt:DagsterDltResource):
    yield from dlt.run(context=context)

dbt_project_dir = Path(__file__).parents[1] / "data_transformation"

profiles_dir = Path.home() / ".dbt"

dbt_project = DbtProject(project_dir=dbt_project_dir, profiles_dir=profiles_dir)

dbt_resource = DbtCliResource(project_dir=dbt_project)

dbt_project.prepare_if_dev()

@dbt_assets(manifest= dbt_project.manifest_path)
def dbt_models(context: dg.AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()

job_dlt = dg.define_asset_job(
    "job_dlt", selection=dg.AssetSelection.keys("dlt_jobads_source_jobads_resource")
)

job_dbt = dg.define_asset_job(
    "job_dbt", selection=dg.AssetSelection.key_prefixes("warehouse", "marts")
)

schedule_dlt = dg.ScheduleDefinition(
    job=job_dlt,
    cron_schedule="15 13 * * *"
)

@dg.asset_sensor(
    asset_key=dg.AssetKey("dlt_jobads_source_jobads_resource"),
    job_name="job_dbt"
)
def dlt_load_sensor():
    yield dg.RunRequest()

defs =dg.Definitions(
    assets=[dlt_load, dbt_models],
    resources={
        "dlt": dlt_resource,
        "dbt": dbt_resource},
    jobs=[job_dlt, job_dbt],
    schedules=[schedule_dlt],
    sensors=[dlt_load_sensor]
)