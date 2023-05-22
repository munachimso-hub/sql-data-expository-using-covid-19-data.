--loking at the selected columns
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM [portfolio project]..CovidDeaths$
ORDER BY 3, 4

--looking at the total cases vs death rate
SELECT location, date, total_cases, total_deaths,
(total_deaths/total_cases)*100 as Deathpercentage
FROM [portfolio project]..CovidDeaths$


--looking at total cases vs population
SELECT location, date, total_cases, population,
(total_cases/population)*100 as percentagepopulationaffected
FROM [portfolio project]..CovidDeaths$
WHERE location like '%state%'
order by 1, 2


--looking at the countries with the highest infection rate compared to population
SELECT location, population, MAX(total_cases) AS HighestInfectionCount,
MAX(total_cases/population)*100 AS percentage_population_infected
FROM [portfolio project]..CovidDeaths$
GROUP BY location, population
ORDER BY percentage_population_infected DESC

--showing countries with the higjhest death count per population. converted total deaths from varchar to int
SELECT location, population, MAX(cast(total_deaths AS INT)) AS TotalDeathCount
FROM [portfolio project]..CovidDeaths$
GROUP BY location, population
ORDER BY TotalDeathCount DESC

--Breaking things down by continents
SELECT continent, MAX(cast(total_deaths AS INT)) AS TotalDeathCount
FROM [portfolio project]..CovidDeaths$
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount DESC