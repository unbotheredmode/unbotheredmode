# Hi, I'm Pavithra 👋

**Cloud Data Engineer** — building production-grade healthcare data platforms on Snowflake, dbt, and Databricks.

3.7 years at Accenture designing and operating US Healthcare Insurance data pipelines — claims adjudication, member enrollment, provider data, and policy lifecycle — across Azure, GCP, and PostgreSQL.

---

## 🏗️ What I Build

- **Healthcare data lakehouses** — medallion architecture, FHIR R4 ingestion, PHI governance
- **Snowflake platforms** — dynamic data masking, row access policies, Streams + Tasks, Snowpark Python
- **dbt pipelines** — SCD Type 2 snapshots, incremental models, automated data quality tests
- **Azure ETL pipelines** — ADF, SSIS, incremental loads, reconciliation frameworks for claims and member data
- **Cloud database migrations** — Azure SQL → PostgreSQL on GCP Cloud SQL, schema redesign + Python ETL

---

## 🛠️ Tech Stack

**Cloud & Warehouses**
`Snowflake` `Azure Data Factory` `GCP Cloud SQL` `ADLS Gen2` `Databricks`

**Transformation & Orchestration**
`dbt` `Snowpark Python` `PySpark` `Delta Lake` `Airflow`

**Languages & Databases**
`T-SQL` `PL/pgSQL` `Python` `SQL Server` `PostgreSQL`

**BI & Observability**
`Power BI (PL-300)` `DAX` `Streamlit` `SSRS`

**Domain**
`US Healthcare Insurance` `Claims Adjudication` `Member Enrollment` `Provider Data` `HIPAA / PHI / PII`

---

## 🚀 Featured Projects

### 🏥 Concord — Payer Interoperability & Prior Authorization Data Platform
> Snowflake + dbt · FHIR R4 · Medallion Architecture · PHI Governance

Production-shaped healthcare data platform modeling a health payer's claims and prior authorization pipeline.

- Ingested **3,400 synthetic FHIR R4 records** as Snowflake VARIANT via staged COPY INTO
- Built **8 dbt models** across staging → marts with **15 automated data quality tests**
- Designed star schema: incremental `fct_claims`, SCD Type 2 `dim_member` snapshot, `dim_provider`, `dim_date`, `pa_metrics_mart`
- Implemented **PHI governance** — dynamic data masking (DOB, zip) + row access policies scoped by line of business
- Built **Streamlit-in-Snowflake** observability dashboard with pipeline health, PA metrics, claims financial summary
- Cost-disciplined: XS warehouses with AUTO_SUSPEND=60 — **$8 of $400 trial credit** used across full platform

**→ [View Repository](https://github.com/unbotheredmode/concord-payer-interop)**

---

### 🏗️ Healthcare Claims Lakehouse *(in progress)*
> Databricks · PySpark · Delta Lake · Airflow · Medallion Architecture

Provider-side claims processing lakehouse on Databricks Community Edition.

- Bronze layer: FHIR R4 API ingestion (HAPI public server) + 50K synthetic claims, Delta Lake append-only with dead-letter pattern
- Silver layer: PySpark transformations, claims/members/providers separation, SCD Type 2
- Gold layer: denial rate metrics, provider performance, member utilization trends
- Airflow DAG orchestrating end-to-end pipeline

**→ Repository coming soon**

---

## 📜 Certifications

- 🏅 **Microsoft Certified: Power BI Data Analyst Associate (PL-300)**
- 🏅 **Accenture P3+ (Expert)** — SQL Server Internal Benchmarking
- 📚 **Snowflake SnowPro Core** — in progress

---

## 📊 GitHub Stats

![Pavithra's GitHub Stats](https://github-readme-stats.vercel.app/api?username=unbotheredmode&show_icons=true&theme=dark&hide_border=true&count_private=true)

![Top Languages](https://github-readme-stats.vercel.app/api/top-langs/?username=unbotheredmode&layout=compact&theme=dark&hide_border=true)

---

## 📬 Let's Connect

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Pavithra%20Pandithurai-0077B5?style=flat&logo=linkedin)](https://linkedin.com/in/pavithra-pandithurai)
[![Email](https://img.shields.io/badge/Email-pavithrapandithurai%40gmail.com-D14836?style=flat&logo=gmail&logoColor=white)](mailto:pavithrapandithurai@gmail.com)

---

*Currently serving notice at Accenture — open to Cloud Data Engineer roles in Chennai, Bangalore, or Remote.*
