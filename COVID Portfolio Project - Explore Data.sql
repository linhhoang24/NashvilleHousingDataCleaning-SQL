-- Select Data that we are going to be using

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1, 2


-- Looking at Total Cases vs Total Deaths
-- Showing likelihood of dying if you contract covid in your country

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM CovidDeaths
WHERE Location like 'Vietnam'
ORDER BY 1, 2

-- Looking at Total Cases vs Population
-- Showing what percentage pf population got Covid
SELECT Location, date, population, total_cases, (total_cases/population)*100 as CasePercentage
FROM CovidDeaths
--WHERE Location like 'Vietnam'
ORDER BY 1, 2

-- Looking at Countries with Highest Infection Rate compared to Population
SELECT Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as CasePercentage
FROM CovidDeaths
GROUP BY Location, population
ORDER BY CasePercentage DESC

-- Showing the Country with Highest Death Count per Population
SELECT Location, MAX(CAST(total_deaths as int)) as TotalDeathCount
FROM CovidDeaths
WHERE continent is not null
GROUP BY Location
ORDER BY TotalDeathCount DESC

-- CONTINENT

-- Showing the Continent with Highest Death Count per Population
SELECT continent, MAX(CAST(total_deaths as int)) as TotalDeathCount
FROM CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount DESC

Select * from CovidDeaths

-- GLOBAL
SELECT SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) as total_deaths, SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM CovidDeaths
-- Where lccation like '
WHERE continent is not null
-- GROUP BY date
ORDER BY 1, 2

-- TOTAL POPULATION VS VACCINATIONS
-- Use CTE
WITH PopVsVac 
AS
(SELECT Dea.continent, Dea.location, Dea.date, Dea.population, Vac.new_vaccinations, SUM(CAST(Vac.new_vaccinations as bigint)) OVER (Partition by Dea.location Order by Dea.location, Dea.date) as RollingPeopleVaccinated
FROM CovidDeaths as Dea
JOIN CovidVaccinations as Vac
	ON Dea.location = Vac.location
	AND Dea.date = Vac.date
WHERE Dea.continent is not null)


SELECT *, (RollingPeopleVaccinated/population)*100
FROM PopVsVac

-- Create a view to store data for later visualizations
CREATE VIEW VW_PercentPopulationVaccinated
AS
SELECT Dea.continent, Dea.location, Dea.date, Dea.population, Vac.new_vaccinations, SUM(CAST(Vac.new_vaccinations as bigint)) OVER (Partition by Dea.location Order by Dea.location, Dea.date) as RollingPeopleVaccinated
FROM CovidDeaths as Dea
JOIN CovidVaccinations as Vac
	ON Dea.location = Vac.location
	AND Dea.date = Vac.date
WHERE Dea.continent is not null

SELECT *
FROM VW_PercentPopulationVaccinated
