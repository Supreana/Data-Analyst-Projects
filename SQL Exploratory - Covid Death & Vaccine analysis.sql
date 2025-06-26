create database Portflio_Project;

select * from coviddeaths_1
order by 3,4;

select * from covidvaccinations
order by 3,4;

select location, date, total_cases, new_cases, total_deaths, population
from coviddeaths_1
order by 1,2;

-- Total Death percentage by location per population
select location, date, population, total_cases, (total_cases/population) * 100 as Death_Percentage
from coviddeaths_1
where location like '%states%'
order by 1,2;

-- Countries with Highest number of cases

select location, population, max(total_cases) as HighestInfectedPopulation, 
max((total_cases/population)) * 100 as PercentPopulationInfected
from coviddeaths_1
-- where location like '%states%'
group by location, population
order by PercentPopulationInfected desc;

-- Countries with Highest number of deaths

select location, max(cast(total_deaths as signed)) as TotalDeathsCount
from coviddeaths_1
where continent is not null
group by location
order by TotalDeathsCount desc;

-- Break down by continent

select location, max(cast(total_deaths as signed)) as TotalDeathsCount
from coviddeaths_1
where continent is null
group by location
order by TotalDeathsCount desc;

update coviddeaths_1
set continent = NULL
where continent = '';

-- Global Numbers

select date, sum(new_cases) as total_cases, sum(cast(new_deaths as signed)) as total_deaths, 
sum(cast(new_deaths as signed))/sum(new_cases) * 100 as Death_Percentage
from coviddeaths_1
where continent is not null
group by date
order by total_deaths desc;

-- Total count of cases and deaths

select sum(new_cases) as total_cases, sum(cast(new_deaths as signed)) as total_deaths, 
sum(cast(new_deaths as signed))/sum(new_cases) * 100 as Death_Percentage
from coviddeaths_1
where continent is not null
order by total_deaths desc;

-- Updating blanks with null values for covidvaccinations

update covidvaccinations
set new_tests = null, total_tests = null, total_tests_per_thousand = null, new_tests_per_thousand = null,
new_tests_smoothed = null, new_tests_smoothed_per_thousand = null, positive_rate = null, tests_per_case = null,
tests_units = null, total_vaccinations = null, people_vaccinated = null, people_fully_vaccinated = null,
new_vaccinations = null, new_vaccinations_smoothed = null, total_vaccinations_per_hundred = null, 
people_vaccinated_per_hundred = null, people_fully_vaccinated_per_hundred = null, 
new_vaccinations_smoothed_per_million = null, female_smokers = null, male_smokers = null 
where new_tests = '' and total_tests = '' and total_tests_per_thousand = '' and new_tests_per_thousand = '' and
new_tests_smoothed = '' and new_tests_smoothed_per_thousand = '' and positive_rate = '' and 
tests_per_case = '' and tests_units = '' and total_vaccinations = '' and people_vaccinated = '' 
and people_fully_vaccinated = '' and new_vaccinations = '' and new_vaccinations_smoothed = '' 
and total_vaccinations_per_hundred = '' and people_vaccinated_per_hundred = '' 
and people_fully_vaccinated_per_hundred = '' and new_vaccinations_smoothed_per_million = '' and 
female_smokers = '' and  male_smokers = '';

-- Updating blanks with null for coviddeaths_1

update coviddeaths_1
set new_cases_smoothed = null, total_deaths = null, new_deaths = null, new_deaths_smoothed = null,
new_cases_smoothed_per_million = null, total_deaths_per_million = null, new_deaths_per_million = null, 
new_deaths_smoothed_per_million = null, reproduction_rate = null, icu_patients = null, 
icu_patients_per_million = null, hosp_patients = null, hosp_patients_per_million = null, 
weekly_icu_admissions = null, weekly_icu_admissions_per_million = null, weekly_hosp_admissions_per_million = null
where new_cases_smoothed = '' and total_deaths = '' and new_deaths = '' and new_deaths_smoothed = '' and
new_cases_smoothed_per_million = '' and total_deaths_per_million = '' and new_deaths_per_million = '' and
new_deaths_smoothed_per_million = '' and reproduction_rate = '' and icu_patients = '' and 
icu_patients_per_million = '' and hosp_patients = '' and hosp_patients_per_million = '' and
weekly_icu_admissions = '' and weekly_icu_admissions_per_million = '' and 
weekly_hosp_admissions_per_million = '';

-- Looking at Total Population vs Vaccinations using CTE

with PopVsVac (Continent, Location, Date, Population, New_vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(vac.new_vaccinations, signed)) over (partition by dea.location order by dea.location, dea.date) 
as RollingPeopleVaccinated 
from coviddeaths_1 dea
join covidvaccinations vac on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
-- order by 2,3
)
select *, (RollingPeopleVaccinated/population) * 100
from PopVsVac;

-- Temp Table 

create table PercentPopulationVaccinated
(
Continent nvarchar (255),
Location nvarchar (255),
date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
);

insert into PercentPopulationVaccinated 
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(vac.new_vaccinations, signed)) over (partition by dea.location order by dea.location, dea.date) 
as RollingPeopleVaccinated 
from coviddeaths_1 dea
join covidvaccinations vac on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3;

select * 
from PecentPeopleVaccinated;

-- Creating view to store data to view later

Create view PercentPeopleVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(vac.new_vaccinations, signed)) over (partition by dea.location order by dea.location, dea.date) 
as RollingPeopleVaccinated 
from coviddeaths_1 dea
join covidvaccinations vac on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3;














