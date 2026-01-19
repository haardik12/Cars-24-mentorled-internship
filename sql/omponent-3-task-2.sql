USE Cars24;

-- Average, Minimum & Maximum Prices by Manufacturing Year
SELECT
    Model AS Manufacturing_Year,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR,
    MIN(Price_INR) AS Min_Price_INR,
    MAX(Price_INR) AS Max_Price_INR
FROM [Dataset_Used Cars_cleaned]
WHERE
    Model IS NOT NULL
    AND Price_INR IS NOT NULL
GROUP BY Model
ORDER BY Manufacturing_Year;

-- Regional Average, Min, Max Price Variation Analysis
SELECT
    Location,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR,
    MIN(Price_INR) AS Min_Price_INR,
    MAX(Price_INR) AS Max_Price_INR
FROM [Dataset_Used Cars_cleaned]
WHERE
    Location IS NOT NULL
    AND Price_INR IS NOT NULL
GROUP BY Location
ORDER BY Avg_Price_INR DESC;

-- Average Price & count by Fuel Type
SELECT
    Fuel,
    COUNT(*) AS Total_Listings,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR
FROM [Dataset_Used Cars_cleaned]
WHERE
    Fuel IS NOT NULL
    AND Price_INR IS NOT NULL
GROUP BY Fuel
ORDER BY Total_Listings DESC;

-- Average Price by Transmission Type
SELECT
    Transmission,
    COUNT(*) AS Total_Listings,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR
FROM [Dataset_Used Cars_cleaned]
WHERE
    Transmission IS NOT NULL
    AND Price_INR IS NOT NULL
GROUP BY Transmission
ORDER BY Avg_Price_INR DESC;

-- Average Price by Car Age
SELECT
    Car_Age,
    COUNT(*) AS Total_Listings,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR
FROM [Dataset_Used Cars_cleaned]
WHERE
    Car_Age IS NOT NULL
    AND Price_INR IS NOT NULL
GROUP BY Car_Age
ORDER BY Car_Age;

-- Average Price by Manufacturer
SELECT
    Manufacturer,
    COUNT(*) AS Total_Listings,
    AVG(CAST(Price_INR AS DECIMAL(18,2))) AS Avg_Price_INR
FROM [Dataset_Used Cars_cleaned]
WHERE
    Manufacturer IS NOT NULL
    AND Price_INR IS NOT NULL
GROUP BY Manufacturer
ORDER BY Avg_Price_INR DESC;
