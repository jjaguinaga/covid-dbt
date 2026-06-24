# covid-dbt

**dbt transformation layer for the [covid-conditions-etl](https://github.com/jjaguinaga/covid-conditions-etl) pipeline.**

This project takes the raw CDC COVID conditions data loaded into PostgreSQL by the ETL pipeline and transforms it into clean, analytics-ready views using dbt. Instead of writing `CREATE TABLE` and `INSERT INTO` manually, dbt lets you write simple SELECT queries and handles building the database objects automatically making it easy to iterate, test, and maintain transformations quickly.

---

## How It Connects

This project sits on top of `covid-conditions-etl`. Run the ETL pipeline first to load data into PostgreSQL, then run this dbt project to build the analytics layer on top of it.

```
covid-conditions-etl (Extract → Transform → Load)
        ↓
covid-dbt (dbt models → analytics-ready views)
```

---

## Models

### Staging
| Model | Description |
|---|---|
| `stg_texas_covid_2021` | Cleans and standardizes the raw `texas_covid` table — renames columns and casts data types |

### Marts
| Model | Description |
|---|---|
| `top_conditions_by_deaths` | Top 10 conditions by total COVID-19 deaths in Texas 2021 |
| `age_group_pct_deaths` | Percentage of total COVID-19 deaths by age group using window functions |
| `condition_group_deaths` | Total deaths grouped by broad condition category (respiratory, circulatory, etc.) |
| `condition_mention_ratio` | Ratio of death certificate mentions to COVID-19 deaths per condition using CTEs |

---

## Data Tests

dbt tests run automatically to validate data quality:

- `condition` — not null
- `age_group` — not null  
- `covid_19_deaths` — not null

---

## Tech Stack

| Tool | Purpose |
|---|---|
| dbt (dbt-postgres) | Transformation and testing |
| PostgreSQL | Target database |
| SQL | Model logic |

---

## How to Run

1. First run the ETL pipeline: [covid-conditions-etl](https://github.com/jjaguinaga/covid-conditions-etl)

2. Install dbt:
```bash
pip install dbt-postgres
```

3. Configure your profile in `~/.dbt/profiles.yml` pointing to your local PostgreSQL `tx_covid_2021` database

4. Run all models:
```bash
dbt run
```

5. Run data quality tests:
```bash
dbt test
```

---

## Data Source

[Conditions Contributing to COVID-19 Deaths, by State and Age, Provisional 2020-2023](https://data.cdc.gov/National-Center-for-Health-Statistics/Conditions-Contributing-to-COVID-19-Deaths-by-Stat/hk9y-quqm/about_data)
