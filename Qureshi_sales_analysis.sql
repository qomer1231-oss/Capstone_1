-- Ohio online sales --
-- Repair review: original student queries retained. Review and explain all work before submission.
-- Learning Note: SalesTotal is DECIMAL; keep SUM numeric and format currency in Excel.
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

-- What is the revenue breakdown by year and month for the sales territory?
SELECT
    SUM(SalesTotal) AS total_revenue,
    YEAR(Date) AS Year,
    MONTH(date) AS Month
from online_sales
WHERE ShiptoState = 'Ohio'
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY YEAR(Date) ASC, MONTH(Date) ASC;

-- Provide a comparison of total revenue for the specific sales territory and the region it belongs to.
DESCRIBE management;

SELECT
    (SELECT SUM(SalesTotal)
     FROM online_sales
     WHERE ShiptoState = 'Ohio') AS ohio_revenue,

    -- Learning Note: management lists Colorado and Online Sales under West.
    -- It does not map Ohio directly. This comparison assumes the assigned Ohio
    -- online territory belongs to that Online Sales unit; confirm with the instructor.
    -- Do not join sales directly to management: Online Sales appears twice.
    -- This is Ohio online revenue versus a mixed-channel West benchmark.
    -- Calculate West revenue using Colorado store sales plus all online sales.
    (
        SELECT SUM(ss.Sale_Amount)
        FROM store_sales AS ss
        JOIN store_locations AS sl
            ON ss.Store_ID = sl.StoreId
        WHERE sl.State = 'Colorado'
    )
    +
    (
        SELECT SUM(SalesTotal)
        FROM online_sales
    ) AS west_revenue;

-- What is the number of transactions per month and average transaction amount by product
-- category for the sales territory?

SELECT
    YEAR(online_sales.Date) AS Year,
    MONTH(online_sales.Date) AS Month,
    inventory_categories.Category,
    COUNT(*) AS Total_Transactions,
    ROUND(AVG(online_sales.SalesTotal), 2) AS Average_Sale
FROM sample_sales.online_sales
JOIN sample_sales.products
    ON online_sales.ProdNum = products.ProdNum
JOIN sample_sales.inventory_categories
    ON products.Categoryid = inventory_categories.Categoryid
WHERE online_sales.ShiptoState = 'Ohio'
GROUP BY
    YEAR(online_sales.Date),
    MONTH(online_sales.Date),
    inventory_categories.Category
ORDER BY Year, Month, inventory_categories.Category;

-- Learning Note: The following is an all-online-state revenue benchmark.
-- The database does not identify which states belong to each online manager.
-- If the assigned territory is Ohio alone, this ranks Ohio against other states;
-- confirm the intended multi-state scope for Question 5 before submission.
-- Can you provide a ranking of in-store sales performance by each store in the sales territory, or a
-- ranking of online sales performance by state within an online sales territory?

SELECT
    online_sales.ShiptoState AS State,
    SUM(online_sales.SalesTotal) AS Total_Revenue
FROM sample_sales.online_sales
GROUP BY
    online_sales.ShiptoState
ORDER BY Total_Revenue DESC;

-- What is your recommendation for where to focus sales attention in the next quarter?

-- Based on the analysis, I highly recommend focusing sales attention towards Technology & Accessories
-- as it has the largest full-period transaction count among categories in the supplied Ohio data. For example,
-- in July 2024, Technology & Accessories recorded 78 transactions with average sales of $2,458.71,
-- which suggests investigating targeted promotions and availability for this category.
-- Learning Note: These historical results do not guarantee future revenue. Verify
-- full-period category totals, margins and seasonal coverage before finalizing this recommendation.


-- Preserved student exploration from the Git index before repair.
-- Learning Note: These are supporting product lookups and contributions, not extra assignment requirements.
SELECT
    products.ProdNum,
    products.Product,
    inventory_categories.Category
FROM sample_sales.products
JOIN sample_sales.inventory_categories
    ON products.Categoryid = inventory_categories.Categoryid
ORDER BY
    inventory_categories.Category,
    products.Product;

SELECT
    products.ProdNum,
    products.Product,
    SUM(online_sales.SalesTotal) AS Product_Revenue,
    ROUND(
        SUM(online_sales.SalesTotal) * 100.0 /
        (
            SELECT SUM(online_sales.SalesTotal)
            FROM sample_sales.online_sales
            WHERE online_sales.ShiptoState = 'Ohio'
        ),
        2
    ) AS Percent_of_Ohio_Sales
FROM sample_sales.online_sales
JOIN sample_sales.products
    ON online_sales.ProdNum = products.ProdNum
WHERE online_sales.ShiptoState = 'Ohio'
GROUP BY
    products.ProdNum,
    products.Product
ORDER BY Product_Revenue DESC;
