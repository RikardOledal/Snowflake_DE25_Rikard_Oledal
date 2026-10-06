import subprocess
from pathlib import Path

if __name__ == "__main__":
    # Get the current working directory
    dashboard_path = Path(__file__).parent / "dashboard.py"

    # Execute the dashboard script
    subprocess.run(f"streamlit run {dashboard_path}", shell=True)
