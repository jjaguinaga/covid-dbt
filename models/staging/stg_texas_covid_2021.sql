{{ config(materialized='view')}}

with source as (
   SELECT start_date AS start,
   end_date AS end,
   condition_group,
   condition,
   icd10_codes,
   age_group,
   covid_19_deaths,
   number_of_mentions
   FROM texas_covid
)
SELECT * FROM source