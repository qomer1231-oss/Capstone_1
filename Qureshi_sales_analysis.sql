-- Ohio --
SHOW DATABASES;

USE sample_sales;
SHOW TABLES;

SELECT COUNT(*)
FROM store_sales;

DESCRIBE management;
-- What is the total revenue overall for sales in the assigned territory, plus the start date and end date
-- that tell you what period the data covers? 
DESCRIBE online_sales;

SELECT COUNT(*)
from online_sales
WHERE ShiptoState = 'Ohio';

SELECT SUM(SalesTotal) AS total_revenue, MIN(Date) AS start_date, MAX(date) AS end_date
from online_sales
WHERE ShiptoState = 'Ohio';

DESCRIBE online_sales;

-- What is the revenue breakdown by year and month for the sales territory?
SELECT SUM(SalesTotal) AS total_revenue, YEAR(Date) AS Year, MONTH(date) AS Month
from online_sales
WHERE ShiptoState = 'Ohio'
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY YEAR(Date) ASC, MONTH(Date) ASC;

-- Provide a comparison of total revenue for the specific sales territory and the region it belongs to.
DESCRIBE management;


