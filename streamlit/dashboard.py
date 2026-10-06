import streamlit as st
from connect_data_warehouse import query_job_listing

def layout():
    df = query_job_listing()
    st.title("Data Engineering Job ads")
    st.write("This is a dashboard that shows the latest data engineering job ads from Arbetsförmedlingens API.")

    st.markdown("## Vacancies")
    cols =st.columns(3)

    with cols[0]:
        st.metric(label="Total Vacancies", value=df["VACANCIES"].sum())

    with cols[1]:
        st.metric(
            label="Fast och rörlig lön",
            value=df.query("SALARY_TYPE == 'Fast och rörlig lön'")['VACANCIES'].sum()
        )

    st.dataframe(df)

if __name__ == "__main__":
    layout()