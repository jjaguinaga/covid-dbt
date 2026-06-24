SELECT age_group,
ROUND((SUM(covid_19_deaths) * 100.0 / SUM(SUM(covid_19_deaths)) OVER ())::numeric, 2) AS pct_of_deaths
FROM {{ ref('stg_texas_covid_2021')}}
GROUP BY 1
ORDER BY 2 DESC