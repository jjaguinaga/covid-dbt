SELECT condition_group, SUM(covid_19_deaths) AS total_deaths
FROM {{ ref('stg_texas_covid_2021')}}
GROUP BY 1
ORDER BY 2 DESC