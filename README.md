## Electricity-Access-Analysis
This project focuses on analyzing electricity access data from two World Bank datasets and a Kaggle dataset. The goal is to identify the top 5 nations with significant progress in increasing population percentage with electricity access from 2000-2020 and explore trends in electricity access globally as well. Additionally, the analysis includes visualizations of the sources of electricity and GDP growth for these top nations.
# Datasets
World Bank Dataset 1: Contains information on countries' percentage of population with access to electricity.
World Bank Dataset 2:Contains information about countries population.
Kaggle Dataset:  Provides details on countries' sources of electricity.
# Data Cleaning and Preprocessing
The datasets underwent thorough cleaning and preprocessing in MySQL. Steps included:
- Removal of unnecessary columns.
- Selection of data from the years 2000 to 2020.
- Handling of null and empty values.
- Changing columns name
- Rounding numeric values
# Tables and Data Manipulation
Several tables were created from the cleaned datasets, including those focusing on sources of electricity, and GDP growth. Data manipulations ensured relevance for further analysis.
# Power BI Visualizations
Power BI visualizations were crafted to present insights effectively:
Top 5 Nations Analysis
- Identification of the top 5 nations with more than 5 million populations showing the highest progress in increasing population percentage with electricity access from  2000 to 2020.
- Line charts illustrating sources of electricity (low-carbon, renewable, fossil fuel) and GDP growth for these nations from 2000 to 2020.
Global Change Analysis
- Visualizations depicting global changes in the percentage of the population with electricity access across the two decades.
- Analysis of the top 3 nations in low-carbon and renewable electricity from 2000 to 2020.
# GitHub Repository Structure
- `Raw data/`: Contains the raw datasets.
- `Cleaned data/`: Contains the cleaned datasets.
- `MySQL Script/`:Includes MySQL scripts for data cleaning and preprocessing.
- `Powerbi Dashboard/: Holds the Power BI project file.
- `Visualizations/: Stores screenshots or exported visualizations.
# How to Use
To reproduce the analysis, follow these steps:
1.Execute the MySQL scripts in MySQL Script/ for data cleaning.
2.Import the cleaned datasets into Power BI.
3.Open the Power BI project in Powerbi Dashboard/ to explore visualizations.
# Acknowledgements
- Thanks to the World Bank and Kaggle for providing the datasets.
- Power BI for visualization capabilities.
