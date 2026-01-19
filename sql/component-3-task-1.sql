USE Cars24;

-- Count Occurrences of Each Car Make–Model Combination
SELECT
    Manufacturer,
    Variant,
    COUNT(*) AS Listing_Count
FROM [Dataset_Used Cars_cleaned]
WHERE
    Manufacturer IS NOT NULL
    AND Variant IS NOT NULL
GROUP BY Manufacturer, Variant;

-- Identify most popular models
SELECT TOP 20
    Manufacturer,
    Variant,
    COUNT(*) AS Listing_Count
FROM [Dataset_Used Cars_cleaned]
WHERE
    Manufacturer IS NOT NULL
    AND Variant IS NOT NULL
GROUP BY Manufacturer, Variant
ORDER BY Listing_Count DESC;
