
Select *
from [Portfolio Project 1]..CovidDeaths
order by 3,4

--Select *
--from [Portfolio Project 1]..Covidvaccination
--order by 3,4

--Selecting the data we are going to be using

select location, date, total_cases,new_cases,total_deaths,population
from [Portfolio Project 1]..CovidDeaths
order by 1,2

--Looking at Total cases vs Total Deaths in India
select location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from [Portfolio Project 1]..CovidDeaths
where location like '%India%'
order by 1,2

--Looking at Total Cases vs Population in India
select location, date, total_cases,population, (total_cases/population)*100 as AffectedPopulation
from [Portfolio Project 1]..CovidDeaths
where location like '%India%'
order by 1,2

--Comparing the Countries with Highest Infection rate compared to Population
select location, Max (total_cases) as HighestInfectionCount,population, Max(total_cases/population)*100 as MaxAffectedPopulation
from [Portfolio Project 1]..CovidDeaths
Group by location, population
order by MaxAffectedPopulation desc

--Comparing the Continents with Highest Death rate compared to Population
select location, Max (cast(total_deaths as int)) as HighestDeathRate
from [Portfolio Project 1]..CovidDeaths
Where continent is null
Group by location
order by HighestDeathRate desc

--Global Numbers
select date, SUM(new_cases) as TotalCases,SUM(cast(new_deaths as int)) as TotalDeaths, (sum(cast(new_deaths as int))/sum(new_cases))*100 as DeathPercentage
from [Portfolio Project 1]..CovidDeaths
where continent is not null
Group by date
order by 1,2



--Total Population vs Total Vaccination

Select De.continent, De.location, De.date, Va.new_vaccinations, Sum(convert (int, Va.new_vaccinations)) over (Partition by De.location order by De.location, De.date) as CumlativeVaccinatedPeople
From [Portfolio Project 1]..CovidDeaths De
Join [Portfolio Project 1]..Covidvaccination Va
on De.location = Va.location
and De.date = Va.date
where De.continent is not null
order by 1,2,3


--Use CTE
With PopvsVAC (Continent, Location, Date, population, New_vaccinations, CumulativeVaccinatedPeople)
as 
(
    Select De.continent, De.location, De.date, De.population, Va.new_vaccinations, 
           Sum(convert(int, Va.new_vaccinations)) over (Partition by De.location order by De.location, De.date) as CumulativeVaccinatedPeople
    From [Portfolio Project 1]..CovidDeaths De
    Join [Portfolio Project 1]..Covidvaccination Va
    on De.location = Va.location
    and De.date = Va.date
    where De.continent is not null
)
Select *, (CumulativeVaccinatedPeople/population)*100 as VaccinationPercentage
from PopvsVAC


--Creating View to store data for later Viualisation
--1. Total Population vs Total Vaccination
Create View TotalPopulationVaccinated as
    Select De.continent, De.location, De.date, De.population, Va.new_vaccinations, 
           Sum(convert(int, Va.new_vaccinations)) over (Partition by De.location order by De.location, De.date) as CumulativeVaccinatedPeople
    From [Portfolio Project 1]..CovidDeaths De
    Join [Portfolio Project 1]..Covidvaccination Va
    on De.location = Va.location
    and De.date = Va.date
    where De.continent is not null

--2. Comparing the Continents with Highest Death rate compared to Population
Create View HighestDeathRate as
Select location, Max (cast(total_deaths as int)) as HighestDeathRate
from [Portfolio Project 1]..CovidDeaths
Where continent is null
Group by location