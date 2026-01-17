USE Cars24;

-- Initial Data Extraction
SELECT
	Manufacturer,
    Varient,
    Details,
    [India_Locations] AS Location,
    Model,
    [Distance_Travelled] AS Distance_km,
    [Fuel_Type] AS Fuel,
    [Engine_Capacity] AS Engine_cc,
    Transmission,
    [Price_INR] AS Price_Raw
FROM [Dataset_Used Cars];

-- Handle Invalid & Non-Numeric Price Values
SELECT *
	,TRY_CAST(Price_Raw AS INT) AS Price_INR
FROM (
	SELECT Manufacturer
		,Varient
		,Details
		,[India_Locations] AS Location
		,Model
		,[Distance_Travelled] AS Distance_km
		,[Fuel_Type] AS Fuel
		,[Engine_Capacity] AS Engine_cc
		,Transmission
		,[Price_INR] AS Price_Raw
	FROM [Dataset_Used Cars]
	) AS RawData
WHERE TRY_CAST(Price_Raw AS INT) IS NOT NULL;

-- Remove Incomplete or Missing Records
SELECT Manufacturer
	,Varient
	,COALESCE(Details, 'Not Specified') AS Details
	,Location
	,Model
	,Distance_km
	,Fuel
	,Engine_cc
	,Transmission
	,Price_INR
FROM (
	SELECT Manufacturer
		,Varient
		,Details
		,[India_Locations] AS Location
		,Model
		,[Distance_Travelled] AS Distance_km
		,[Fuel_Type] AS Fuel
		,[Engine_Capacity] AS Engine_cc
		,Transmission
		,TRY_CAST([Price_INR] AS INT) AS Price_INR
	FROM [Dataset_Used Cars]
	) AS PriceCleaned
WHERE Price_INR IS NOT NULL
	AND Model IS NOT NULL
	AND Distance_km IS NOT NULL;

-- Remove Unrealistic or Extreme Outliers
WITH Cleaned
AS (
	SELECT Manufacturer
		,Varient
		,COALESCE(Details, 'Not Specified') AS Details
		,[India_Locations] AS Location
		,Model
		,[Distance_Travelled] AS Distance_km
		,[Fuel_Type] AS Fuel
		,[Engine_Capacity] AS Engine_cc
		,Transmission
		,TRY_CAST([Price_INR] AS INT) AS Price_INR
	FROM [Dataset_Used Cars]
	WHERE [Price_INR] IS NOT NULL
		AND Model BETWEEN 1980 AND 2023
		AND [Distance_Travelled] BETWEEN 0 AND 1000000
	)
SELECT TOP 100 *
FROM Cleaned
WHERE Price_INR IS NOT NULL
	AND Distance_km BETWEEN 0 AND 1000000
	AND Model BETWEEN 1980 AND 2023;

-- Derived Columns
WITH Cleaned AS (
    SELECT
        COALESCE(Manufacturer, 'Unknown') AS Manufacturer,
        COALESCE(Varient, 'Unknown') AS Variant,
        COALESCE(Details, 'Not Specified') AS Details,
        COALESCE([India_Locations], 'Unknown') AS Location,
        Model,
        CASE 
            WHEN [Distance_Travelled] BETWEEN 0 AND 1000000 
            THEN [Distance_Travelled] 
            ELSE NULL 
        END AS Distance_km,
        COALESCE([Fuel_Type], 'Unknown') AS Fuel,
        NULLIF([Engine_Capacity], 0) AS Engine_cc,
        COALESCE(Transmission, 'Unknown') AS Transmission,
        TRY_CAST([Price_INR] AS INT) AS Price_INR
    FROM [Dataset_Used Cars]
    WHERE
        TRY_CAST([Price_INR] AS INT) IS NOT NULL
        AND Model IS NOT NULL
)
SELECT
    *,
    2026 - Model AS Car_Age,
    CASE
        WHEN Price_INR < 500000 THEN 'Low'
        WHEN Price_INR BETWEEN 500000 AND 1500000 THEN 'Medium'
        ELSE 'High'
    END AS Price_Category
FROM Cleaned;
