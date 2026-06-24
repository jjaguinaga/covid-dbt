SELECT condition, icd10_codes, SUM(covid_19_deaths) AS total_deaths
FROM {{ ref('stg_texas_covid_2021')}}
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10