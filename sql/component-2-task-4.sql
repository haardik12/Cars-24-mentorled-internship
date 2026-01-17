-- use the database 
USE Cars24;

-- Average Price by Manufacturer
SELECT
    Manufacturer,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR
FROM [Dataset_Used Cars_cleaned]
GROUP BY Manufacturer
ORDER BY Avg_Price_INR DESC;

-- Average Price by Manufacturer & Variant
SELECT
    Manufacturer,
    Variant,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR
FROM [Dataset_Used Cars_Cleaned]
GROUP BY Manufacturer, Variant
ORDER BY Avg_Price_INR DESC;

-- Count of Cars by Manufacture Year
SELECT
    Model AS Manufacture_Year,
    COUNT(*) AS Number_of_Cars
FROM [Dataset_Used Cars_Cleaned]
GROUP BY Model
ORDER BY Model;

-- Maximum Distance Travelled by Manufacturer
SELECT 
    Manufacturer,
    MAX(Distance_km) AS Max_Distance_Travelled
FROM [Dataset_Used Cars_Cleaned]
GROUP BY Manufacturer
ORDER BY Max_Distance_Travelled DESC;

-- Fuel Type Distribution
SELECT
    Fuel,
    COUNT(*) AS Car_Count
FROM [Dataset_Used Cars_Cleaned]
GROUP BY Fuel
ORDER BY Car_Count DESC;

-- Average Price by Location
SELECT
    Location,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR
FROM [Dataset_Used Cars_Cleaned]
GROUP BY Location
ORDER BY Avg_Price_INR DESC;

-- Price Category Distribution
SELECT
    Price_Category,
    COUNT(*) AS Car_Count
FROM [Dataset_Used Cars_Cleaned]
GROUP BY Price_Category;