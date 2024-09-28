# Global-Income-Inequality

## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Project Goals and Objectives](#project-goals-and-objectives)
- [Tools Used](#tools-used)
- [Data Analysis](#data-analysis)
- [Findings](#findings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)


## Project Overview

This project main focus was to explore and analyze global income inequality trends from the year 2000 to 2023 across 15 countries. The analysis explores important areas such as the
Gini index, average income levels, and income distribution across various population groups. The primary aim is to understand how income inequality has evolved over time and how it 
varies across countries and income groups, providing valuable insights for economic analysis.

### Data Sources

The dataset used for this project was gotten from Kaggle, including factors such as;

1. Gini Index (2000–2023) for 30 countries
2. Population estimates per country
3. Average income in USD per country and year
4. Top 10% and bottom 10% income shares
5. Country income group classifications (Low Income, Lower Middle Income, Upper Middle Income, High Income)

### Project Goals and Objectives

The actual goal of this project is to analyze income inequality across various countries and regions and examine its changes over time. This project's specific objectives include:

1. Identifying patterns in income inequality from 2000 to 2023.
2. Understanding how income inequality varies by income group and region.
3. Examining which countries have the highest and lowest Gini index values.
4. Exploring differences in income shares between the top and bottom 10% of the population.
5. Providing recommendations for addressing income inequality based on the analysis.

### Tools Used

1. Microsoft Excel: This was used for data cleaning.
2. SQL Server Management Studio (SSMS): This was used for data exploration, querying, and conducting analysis on the student mental health Global Income Inequality dataset.

### Data Analysis

The analysis involved executing several SQL queries to provide insight into important questions related to global income inequality. Some of these questions include:

1. What is the pattern of income inequality over the years?
2. How does income inequality vary by income group?
3. Which countries have the highest and lowest Gini index values?
4. How has the Gini index changed in Nigeria?
5. What are the differences in income share between the top 10% and bottom 10% populations?

```SQL
SELECT 
	Country, 
	AVG(Gini_Index) AS AverageGini
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY 
	Country
HAVING 
	AVG(Gini_Index) > 0.4
ORDER BY 
	AverageGini DESC
```

```SQL
SELECT 
	Year, 
	AVG(Top_10_Income_Share - Bottom_10_Income_Share) AS DifferenceofIncomeShare
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY 
	Year
HAVING 
	AVG(Top_10_Income_Share - Bottom_10_Income_Share) > 40
ORDER BY 
	Year
```

### Findings

I came up with the some findings after analysis and a few of these findings include;

1. The Gini index shows changes over the years, with certain increase in inequality during periods such as 2004, 2007, and 2023 and despite some periods of improvement, income inequality
   remains significant in many regions.
  
2. Upper-middle-income and low-income countries showcase higher average Gini index values, which demonstrates greater income difference in these groups. Lower-middle-income countries
   showcase relatively lower inequality compared to other groups.

3. Countries like Germany, the United States, and Australia demonstrate some of the highest income accumulation within the top 10% of their populations.

4. Nigeria's Gini Index showed visible changes, with peaks in 2004, 2013, and 2020. This suggests varying levels of inequality across different years, influenced by economic
   and political factors.

5. Countries like Japan, Germany, and Saudi Arabia consistently show high levels of inequality, with Gini index values above 0.6 in some years.

### Recommendations

Based on the insights gained in this project, I provide the following recommendations;

1. Countries with low income should ensure to focus on improving education, job creation, and infrastructure to enhance long-term income growth and reduce differences.

2. Countries with high Gini index values should employ progressive taxation, wealth redistribution, and social welfare programs to reduce inequality.

3. Countries with high inequality should bring about social programs such as unemployment benefits, public healthcare, and affordable housing.

4. Countries with extreme wealth accumulation among the top 10% should promote tax reforms and anti-trust regulations to ensure a fairer income distribution.

5. There should be regular tracking of income inequality trends to examine the effectiveness of policy interventions and adjust them when need be.

### Limitations

1. This dataset includes data from only 15 countries worldwide, which may not represent the full global picture of income inequality.

2. The analysis is limited to the years 2000–2023, and extending the timeframe could provide more insights into long-term patterns.

3. External economic situation, such as the COVID-19 pandemic, may have influenced income inequality incertain years, but these factors were not left out in this analysis.
