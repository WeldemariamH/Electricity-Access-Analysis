USE `electrification_data`;

-- Dropping unwanted columns 
ALTER TABLE `world bank - data`
DROP COLUMN `MyUnknownColumn`,
DROP COLUMN `MyUnknownColumn_[0]`,
DROP COLUMN `MyUnknownColumn_[1]`,
DROP COLUMN `MyUnknownColumn_[2]`,
DROP COLUMN `MyUnknownColumn_[3]`,
DROP COLUMN `MyUnknownColumn_[4]`,
DROP COLUMN `MyUnknownColumn_[5]`,
DROP COLUMN `MyUnknownColumn_[6]`,
DROP COLUMN `MyUnknownColumn_[7]`,
DROP COLUMN `MyUnknownColumn_[8]`,
DROP COLUMN `MyUnknownColumn_[9]`,
DROP COLUMN `MyUnknownColumn_[10]`,
DROP COLUMN `MyUnknownColumn_[11]`,
DROP COLUMN `MyUnknownColumn_[12]`,
DROP COLUMN `MyUnknownColumn_[13]`,
DROP COLUMN `MyUnknownColumn_[14]`,
DROP COLUMN `MyUnknownColumn_[15]`,
DROP COLUMN `MyUnknownColumn_[16]`,
DROP COLUMN `MyUnknownColumn_[17]`,
DROP COLUMN `MyUnknownColumn_[18]`,
DROP COLUMN `MyUnknownColumn_[19]`,
DROP COLUMN `MyUnknownColumn_[20]`,
DROP COLUMN `MyUnknownColumn_[21]`,
DROP COLUMN `MyUnknownColumn_[22]`,
DROP COLUMN `MyUnknownColumn_[23]`,
DROP COLUMN `MyUnknownColumn_[24]`,
DROP COLUMN `MyUnknownColumn_[25]`,
DROP COLUMN `MyUnknownColumn_[26]`,
DROP COLUMN `MyUnknownColumn_[27]`,
DROP COLUMN `MyUnknownColumn_[28]`,
DROP COLUMN `MyUnknownColumn_[29]`,
DROP COLUMN `MyUnknownColumn_[30]`,
DROP COLUMN `MyUnknownColumn_[31]`,
DROP COLUMN `MyUnknownColumn_[32]`,
DROP COLUMN `MyUnknownColumn_[33]`,
DROP COLUMN `MyUnknownColumn_[34]`,
DROP COLUMN `MyUnknownColumn_[35]`,
DROP COLUMN `MyUnknownColumn_[36]`,
DROP COLUMN `MyUnknownColumn_[37]`,
DROP COLUMN `MyUnknownColumn_[38]`,
DROP COLUMN `MyUnknownColumn_[39]`,
DROP COLUMN `MyUnknownColumn_[40]`,
DROP COLUMN `MyUnknownColumn_[62]`,
DROP COLUMN `MyUnknownColumn_[63]`;

SELECT * FROM `world bank - data`;

-- changing columns name
ALTER TABLE `world bank - data`
RENAME COLUMN `Data Source`TO `Country`,
RENAME COLUMN `World Development Indicators`TO `Country Code`,
RENAME COLUMN `MyUnknownColumn_[41]` TO `year_2000`,
RENAME COLUMN `MyUnknownColumn_[42]` TO `year_2001`,
RENAME COLUMN `MyUnknownColumn_[43]` TO `year_2002`,
RENAME COLUMN `MyUnknownColumn_[44]` TO `year_2003`,
RENAME COLUMN `MyUnknownColumn_[45]` TO `year_2004`,
RENAME COLUMN `MyUnknownColumn_[46]` TO `year_2005`,
RENAME COLUMN `MyUnknownColumn_[47]` TO `year_2006`,
RENAME COLUMN `MyUnknownColumn_[48]` TO `year_2007`,
RENAME COLUMN `MyUnknownColumn_[49]` TO `year_2008`,
RENAME COLUMN `MyUnknownColumn_[50]` TO `year_2009`,
RENAME COLUMN `MyUnknownColumn_[51]` TO `year_2010`,
RENAME COLUMN `MyUnknownColumn_[52]` TO `year_2011`,
RENAME COLUMN `MyUnknownColumn_[53]` TO `year_2012`,
RENAME COLUMN `MyUnknownColumn_[54]` TO `year_2013`,
RENAME COLUMN `MyUnknownColumn_[55]` TO `year_2014`,
RENAME COLUMN `MyUnknownColumn_[56]` TO `year_2015`,
RENAME COLUMN `MyUnknownColumn_[57]` TO `year_2016`,
RENAME COLUMN `MyUnknownColumn_[58]` TO `year_2017`,
RENAME COLUMN `MyUnknownColumn_[59]` TO `year_2018`,
RENAME COLUMN `MyUnknownColumn_[60]` TO `year_2019`,
RENAME COLUMN `MyUnknownColumn_[61]` TO `year_2020`;

-- Removing the first 4 not valueable Raws
SELECT * FROM `world bank - data`
LIMIT 4,270;

-- Delete rows from Table1 where the country is not present in Table2
DELETE FROM `world bank - data`
WHERE Country NOT IN (SELECT Country FROM electricity.difference_across_the_years);

-- Rounding Decimal points 
UPDATE `world bank - data`
SET `year_2000`= Round(`year_2000`),
`year_2001`= Round(`year_2001`),
`year_2002`= Round(`year_2002`),
`year_2003`= Round(`year_2003`),
`year_2004`= Round(`year_2004`),
`year_2005`= Round(`year_2005`),
`year_2006`= Round(`year_2006`),
`year_2007`= Round(`year_2007`),
`year_2008`= Round(`year_2008`),
`year_2009`= Round(`year_2009`),
`year_2010`= Round(`year_2010`),
`year_2011`= Round(`year_2011`),
`year_2012`= Round(`year_2012`),
`year_2013`= Round(`year_2013`),
`year_2014`= Round(`year_2014`),
`year_2015`= Round(`year_2015`),
`year_2016`= Round(`year_2016`),
`year_2017`= Round(`year_2017`),
`year_2018`= Round(`year_2018`),
`year_2019`= Round(`year_2019`),
`year_2020`= Round(`year_2020`);


-- Renaming the table with descriptive name
RENAME TABLE `world bank - data` TO `electricity_data`;
SELECT * FROM `electricity_data`;
