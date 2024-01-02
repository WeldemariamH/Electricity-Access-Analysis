USE electricity;

-- Dropping unnecessary columns
ALTER TABLE `energy_source (2)`
Drop column `latitude`,
Drop column `longitude`,
Drop column `electricity access`,
Drop column `clean fuels for cooking Access`,
Drop column `Primary energy consumption per capita (kWh/person)`,
Drop column `Financial flows to developing countries (US $)`,
Drop column `Energy intensity level of primary energy (MJ/$2017 PPP GDP)`,
Drop column `Value_co2_emissions_kt_by_country`,
Drop column `Renewables (% equivalent primary energy)`,
Drop column `gdp_per_capita`;

-- dealing with empty and null cells by inserting zero value
SELECT* FROM `energy_source (2)`;
UPDATE `energy_source (2)`
SET `Renewable-electricity-generating-capacity-per-capita`= IFNULL(`Renewable-electricity-generating-capacity-per-capita`,0),
`Renewable energy share in the total final energy consumption (%)`= IFNULL(`Renewable energy share in the total final energy consumption (%)`,0),
`Electricity from fossil fuels (TWh)`= IFNULL(`Electricity from fossil fuels (TWh)`,0),
`Electricity from nuclear (TWh)`= IFNULL(`Electricity from nuclear (TWh)`,0),
`Electricity from renewables (TWh)`= IFNULL(`Electricity from renewables (TWh)`,0),
`Low-carbon electricity (% electricity)`= IFNULL(`Low-carbon electricity (% electricity)`,0),
`gdp_growth`= IFNULL(`gdp_growth`,0);


-- Creating table which shows average of 5 consecutive years for each column instead of having value for each year to facillitate the analysis
CREATE TABLE `Averages_of_Energy_Sources` AS
SELECT
  Entity AS Country,
  CASE
    WHEN Year BETWEEN 2000 AND 2004 THEN '2000-2004'
    WHEN Year BETWEEN 2005 AND 2009 THEN '2005-2009'
    WHEN Year BETWEEN 2010 AND 2014 THEN '2010-2014'
    WHEN Year BETWEEN 2015 AND 2020 THEN '2015-2020'
  END AS Year,
  ROUND(AVG(`Renewable-electricity-generating-capacity-per-capita`), 1) AS Avg_Renewable_Electricity_Generating_Capacity,
  ROUND(AVG(`Renewable energy share in the total final energy consumption (%)`), 1) AS Avg_Renewable_Energy_Share,
  ROUND(AVG(`Electricity from fossil fuels (TWh)`), 1) AS Avg_Electricity_From_Fossil_Fuels,
  ROUND(AVG(`Electricity from nuclear (TWh)`), 1) AS Avg_Electricity_From_Nuclear,
  ROUND(AVG(`Electricity from renewables (TWh)`), 1) AS Avg_Electricity_From_Renewables,
  ROUND(AVG(`Low-carbon electricity (% electricity)`), 1) AS Avg_Low_Carbon_Electricity,
  ROUND(AVG(`gdp_growth`), 1) AS Avg_GDP_Growth
FROM `energy_source (2)`
GROUP BY Entity, 
         CASE
            WHEN Year BETWEEN 2000 AND 2004 THEN '2000-2004'
            WHEN Year BETWEEN 2005 AND 2009 THEN '2005-2009'
            WHEN Year BETWEEN 2010 AND 2014 THEN '2010-2014'
            WHEN Year BETWEEN 2015 AND 2020 THEN '2015-2020'
          END;
          
  
-- Creating table that shows the difference on average of those energy source of years 2015-2020 and 2000-2024 which are the first 5 and the last 5 years of the time frame under analysis to make the analysis more representative 
SELECT * FROM `Averages_of_Energy_Sources`;
CREATE TABLE `Difference_across_the_years` AS
SELECT
  Country,
  MAX(CASE WHEN Year = '2015-2020' THEN Avg_Renewable_Electricity_Generating_Capacity END) -
  MAX(CASE WHEN Year = '2000-2004' THEN Avg_Renewable_Electricity_Generating_Capacity END) AS Diff_Renewable_Electricity_Generating_Capacity,
  MAX(CASE WHEN Year = '2015-2020' THEN Avg_Renewable_Energy_Share END) -
  MAX(CASE WHEN Year = '2000-2004' THEN Avg_Renewable_Energy_Share END) AS Diff_Renewable_Energy_Share,
  MAX(CASE WHEN Year = '2015-2020' THEN Avg_Electricity_From_Fossil_Fuels END) -
  MAX(CASE WHEN Year = '2000-2004' THEN Avg_Electricity_From_Fossil_Fuels END) AS Diff_Electricity_From_Fossil_Fuels,
  MAX(CASE WHEN Year = '2015-2020' THEN Avg_Electricity_From_Nuclear END) -
  MAX(CASE WHEN Year = '2000-2004' THEN Avg_Electricity_From_Nuclear END) AS Diff_Electricity_From_Nuclear,
  MAX(CASE WHEN Year = '2015-2020' THEN Avg_Electricity_From_Renewables END) -
  MAX(CASE WHEN Year = '2000-2004' THEN Avg_Electricity_From_Renewables END) AS Diff_Electricity_From_Renewables,
  MAX(CASE WHEN Year = '2015-2020' THEN Avg_Low_Carbon_Electricity END) -
  MAX(CASE WHEN Year = '2000-2004' THEN Avg_Low_Carbon_Electricity END) AS Diff_Low_Carbon_Electricity,
  MAX(CASE WHEN Year = '2015-2020' THEN Avg_GDP_Growth END) -
  MAX(CASE WHEN Year = '2000-2004' THEN Avg_GDP_Growth END) AS Diff_GDP_Growth
FROM Averages_of_Energy_Sources 
GROUP BY Country;
SELECT * FROM Difference_across_the_years;

-- Creating table to see the top 20 nations with the change in renewable share usage for electricity across the two decades
CREATE TABLE `Top_20_Diff_Renewable_Share_Difference_in_percentile` AS
SELECT country, `Diff_Renewable_Energy_Share`
FROM `Difference_across_the_years`
ORDER BY `Diff_Renewable_Energy_Share` DESC
LIMIT 20;

--  Creating table to see the top 20 nations with the change in renewable energy usage for electricity across the two decades
CREATE TABLE `Top_20_Diff_Electricity_From_Renewables_in_TWh` AS
SELECT country, `Diff_Electricity_From_Renewables`
FROM `Difference_across_the_years`
ORDER BY `Diff_Electricity_From_Renewables` DESC
LIMIT 20;

-- Creating table to see the top 20 nations with the change in low carbon usage for electricity across the two decades
CREATE TABLE `Top_20_Diff_Low_Carbon_Electricity_in_percentile_of electricity` AS
SELECT country, `Diff_Low_Carbon_Electricity`
FROM `Difference_across_the_years`
ORDER BY `Diff_Low_Carbon_Electricity` DESC
LIMIT 20;

-- Creating table to see the top 20 nations with the positive change in GDP growth across the two decades
CREATE TABLE `Top_20_Diff_in_GDP_Growth` AS
SELECT country, `Diff_GDP_Growth`
FROM `Difference_across_the_years`
ORDER BY `Diff_GDP_Growth` DESC
LIMIT 20;





