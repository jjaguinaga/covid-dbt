WITH death_ratio AS (
	SELECT condition, SUM(covid_19_deaths) AS total_deaths, SUM(number_of_mentions) AS number_of_mentions
	FROM {{ ref('stg_texas_covid_2021')}}
	GROUP BY 1
	)
SELECT condition, ROUND(((dr.number_of_mentions / dr.total_deaths))::numeric, 2) AS ratio
FROM death_ratio AS dr
ORDER BY ratio DESC