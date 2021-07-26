-- A look at Covid numbers in South America 
-- Comparison between South America and other continents
SELECT
  location,
  population,
  MAX(total_cases) AS total_cases,
  MAX(total_deaths) AS total_deaths,
  (MAX(total_deaths)/MAX(total_cases)) * 100 AS death_percentage
FROM
  my-project-marcus1.covid_dataset.covid_deaths
WHERE
  continent IS NULL
  AND population IS NOT NULL
  AND location <> 'European Union'
GROUP BY
  location,
  population
ORDER BY
  2 DESC 
  
  
  -- South America and other continents with dates
SELECT
  location,
  population,
  date,
  MAX(total_cases) AS total_cases,
  MAX(total_deaths) AS total_deaths,
  (MAX(total_deaths)/MAX(total_cases)) * 100 AS death_percentage
FROM
  my-project-marcus1.covid_dataset.covid_deaths
WHERE
  continent IS NULL
  AND population IS NOT NULL
  AND location <> 'European Union'
  AND location <> 'World'
GROUP BY
  location,
  population,
  date
ORDER BY
  1,
  3 
  
  
--Vaccination in South America and other continents
SELECT
  DISTINCT(deaths.location),
  deaths.population,
  MAX(vax.people_vaccinated) AS people_vaccinated,
  MAX(vax.people_fully_vaccinated) AS people_fully_vaccinated,
  MAX(vax.people_fully_vaccinated/deaths.population) * 100 AS percent_people_fully_vaccinated
FROM
  my-project-marcus1.covid_dataset.covid_deaths AS deaths
JOIN
  my-project-marcus1.covid_dataset.covid_vax AS vax
ON
  deaths.location = vax.location
  AND deaths.date = vax.date
WHERE
  deaths.continent IS NULL
  AND deaths.population IS NOT NULL
  AND deaths.location <> 'European Union'
GROUP BY
  1,
  2
ORDER BY
  2 DESC 
  
  
--Vaccination in South America and other continents with dates
SELECT
  DISTINCT(deaths.location),
  deaths.population,
  deaths.date,
  MAX(vax.people_vaccinated) AS people_vaccinated,
  MAX(vax.people_fully_vaccinated) AS people_fully_vaccinated,
  MAX(vax.people_fully_vaccinated/deaths.population) * 100 AS percent_people_fully_vaccinated
FROM
  my-project-marcus1.covid_dataset.covid_deaths AS deaths
JOIN
  my-project-marcus1.covid_dataset.covid_vax AS vax
ON
  deaths.location = vax.location
  AND deaths.date = vax.date
WHERE
  deaths.continent IS NULL
  AND deaths.population IS NOT NULL
  AND deaths.location <> 'European Union'
GROUP BY
  1,
  2,
  3
ORDER BY
  1,
  3 
  
  
-- Looking at Deaths, Vaccinations, and Tests in relation to GDP per Capita and HDI   
-- Death Numbers
SELECT
  DISTINCT(deaths.location),
  MAX(deaths.total_deaths) AS total_deaths,
  vax.human_development_index,
  vax.gdp_per_capita
FROM
  my-project-marcus1.covid_dataset.covid_deaths AS deaths
JOIN
  my-project-marcus1.covid_dataset.covid_vax AS vax
ON
  deaths.location = vax.location
  AND deaths.date = vax.date
WHERE
  deaths.continent = 'South America'
GROUP BY
  1,
  3,
  4
ORDER BY
  2 DESC 
  
  
-- Vaccination Numbers
SELECT
  DISTINCT(deaths.location),
  deaths.population,
  MAX(vax.people_vaccinated) AS people_vaccinated,
  MAX(vax.people_fully_vaccinated) AS people_fully_vaccinated,
  MAX(vax.people_fully_vaccinated/deaths.population) * 100 AS percent_people_fully_vaccinated,
  vax.human_development_index,
  vax.gdp_per_capita
FROM
  my-project-marcus1.covid_dataset.covid_deaths AS deaths
JOIN
  my-project-marcus1.covid_dataset.covid_vax AS vax
ON
  deaths.location = vax.location
  AND deaths.date = vax.date
WHERE
  deaths.continent = 'South America'
GROUP BY
  1,
  2,
  6,
  7
ORDER BY
  2 DESC 
  
  
-- Test Numbers
SELECT
  DISTINCT(deaths.location),
  deaths.population,
  MAX(deaths.total_cases) AS total_cases,
  MAX(vax.total_tests) AS total_tests,
  MAX(vax.total_tests_per_thousand) AS tests_per_thousand,
  vax.human_development_index,
  vax.gdp_per_capita
FROM
  my-project-marcus1.covid_dataset.covid_deaths AS deaths
JOIN
  my-project-marcus1.covid_dataset.covid_vax AS vax
ON
  deaths.location = vax.location
  AND deaths.date = vax.date
WHERE
  deaths.continent = 'South America'
GROUP BY
  1,
  2,
  6,
  7
ORDER BY
  2 DESC 


--Case numbers in relation to population density
SELECT
  DISTINCT(deaths.location),
  deaths.population,
  MAX(deaths.total_cases) AS total_cases,
  vax.population_density
FROM
  my-project-marcus1.covid_dataset.covid_deaths AS deaths
JOIN
  my-project-marcus1.covid_dataset.covid_vax AS vax
ON
  deaths.location = vax.location
  AND deaths.date = vax.date
WHERE
  deaths.continent = 'South America'
GROUP BY
  1,
  2,
  4
ORDER BY
  3 DESC 


--Deaths numbers in relation to median age
SELECT
  DISTINCT(deaths.location),
  deaths.population,
  MAX(deaths.total_deaths) AS total_deaths,
  vax.median_age
FROM
  my-project-marcus1.covid_dataset.covid_deaths AS deaths
JOIN
  my-project-marcus1.covid_dataset.covid_vax AS vax
ON
  deaths.location = vax.location
  AND deaths.date = vax.date
WHERE
  deaths.continent = 'South America'
GROUP BY
  1,
  2,
  4
ORDER BY
  3 DESC 
  
  
  -- Data source: https://ourworldindata.org/covid-deaths 
  -- Data from 2020/01/01 ~ 2021/07/20
