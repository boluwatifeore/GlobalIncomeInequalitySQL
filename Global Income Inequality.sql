
SELECT 
	*
FROM
	GlobalIncomeProject..global_income_inequality


-- What is the pattern in income inequality over the years?

SELECT
	Year,
	AVG(Gini_Index) AS AverageGiniIndex
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY
	Year
ORDER BY
	Year


-- What is the income inequality across different income groups?

SELECT
	Income_Group,
	AVG(Gini_Index) AS AverageGiniIndex,
	AVG(Average_Income_USD) AS AverageIncome
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY
	Income_Group
ORDER BY
	AverageIncome DESC


-- What countries have the hughest share of income in year 2023?

SELECT
	Country,
	Year,
	Top_10_Income_Share
FROM 
	GlobalIncomeProject..global_income_inequality
WHERE
	Year = '2023'
ORDER BY
	Top_10_Income_Share DESC


-- How has the Gini index of Nigeria changed over the years?

SELECT 
	Year, 
	Gini_Index
FROM 
	GlobalIncomeProject..global_income_inequality
WHERE 
	Country = 'Nigeria'
ORDER BY 
	Year


-- What is the average income share of the bottom 10% of the population across years?

SELECT 
	Year, 
	AVG(Bottom_10_Income_Share) AS AverageBottom10Share
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY 
	Year
ORDER BY 
	Year


-- Which countries have the highest Gini index values over the entire period of years?

SELECT
	Country,
	MAX(Gini_Index) AS HighestGiniIndex
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY
	Country
ORDER BY
	HighestGiniIndex DESC


-- Which countries have the lowest Gini index values over the entire period?

SELECT
	Country,
	MIN(Gini_Index) AS LowestGiniIndex
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY
	Country
ORDER BY
	LowestGiniIndex DESC


-- What countries have an average Gini index above 0.4?

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


-- Which income group classification has the highest average Gini index?

SELECT
	Income_Group,
	AVG(Gini_Index) AS AverageGiniIndex
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY
	Income_Group
ORDER BY
	AverageGiniIndex DESC


-- What years was the difference between the top 10% and bottom 10% income shares greater than 40%?

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


-- What is the average Gini index and average income for each country's region?

SELECT CASE
           WHEN Country IN ('USA', 'Canada', 'Mexico') THEN 'North America'
           WHEN Country IN ('Brazil') THEN 'South America'
		   WHEN Country IN ('France', 'Germany', 'Russia', 'United Kingdom') THEN 'Europe'
           WHEN Country IN ('Nigeria', 'South Africa') THEN 'Africa'
		   WHEN Country IN ('China', 'India', 'Japan', 'Saudi Arabia') THEN 'Asia'
           WHEN Country IN ('Australlia') THEN 'Oceania'
           ELSE 'Other'
       END AS Region,
       AVG(Gini_Index) AS Avg_Gini,
       AVG(Average_Income_USD) AS AverageIncome
FROM 
	GlobalIncomeProject..global_income_inequality
GROUP BY 
	CASE
           WHEN Country IN ('USA', 'Canada', 'Mexico') THEN 'North America'
           WHEN Country IN ('Brazil') THEN 'South America'
		   WHEN Country IN ('France', 'Germany', 'Russia', 'United Kingdom') THEN 'Europe'
           WHEN Country IN ('Nigeria', 'South Africa') THEN 'Africa'
		   WHEN Country IN ('China', 'India', 'Japan', 'Saudi Arabia') THEN 'Asia'
           WHEN Country IN ('Australlia') THEN 'Oceania'
           ELSE 'Other'
       END 
ORDER BY
	AverageIncome DESC







