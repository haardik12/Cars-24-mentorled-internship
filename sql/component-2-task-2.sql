-- use the database 
USE Cars24;

-- Preview Sample Records
SELECT TOP 10 * FROM [Dataset_Used Cars ];

-- Retrieve Information About Table Structure (Schema)
SELECT 
	COLUMN_NAME,
	DATA_TYPE,
	CHARACTER_MAXIMUM_LENGTH
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Dataset_Used Cars '

-- Fuel Type Analysis
SELECT Fuel_Type, COUNT(*) AS car_count
	FROM [Dataset_Used Cars]
	GROUP BY Fuel_Type;

-- Average price of cars by transmission
SELECT Transmission,
	AVG(TRY_CAST(Price_INR AS FLOAT)) AS avg_price
	FROM [Dataset_Used Cars]
	GROUP BY Transmission;

-- Brand analysis
SELECT Manufacturer, COUNT(*) AS total_listings
	FROM [Dataset_Used Cars]
	GROUP BY Manufacturer
	ORDER BY total_listings DESC;

-- Price Trend by Manufacturing Year
SELECT Model AS manufacturing_year,
	AVG(TRY_CAST(Price_INR AS FLOAT)) AS avg_price
	FROM [Dataset_Used Cars]
	GROUP BY Model
	ORDER BY manufacturing_year;

-- Most frequent listing locations
SELECT India_Locations, COUNT(*) AS total_cars
	FROM [Dataset_Used Cars]
	GROUP BY India_Locations
	ORDER BY total_cars DESC;





	
















