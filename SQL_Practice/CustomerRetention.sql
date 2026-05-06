--============================================================================================
-- Topic    : Customer Retention Cohorts
-- Date     : 31/10/2025
--============================================================================================
---─────────────────────────────────────────────-─────────────────────────────────────────────
--Question:
--Table   : orders(customer_id, order_date)
--For each month, find how many customers were new, and how many from the previous month returned to order again. 
---─────────────────────────────────────────────-─────────────────────────────────────────────

WITH ordered AS (
    SELECT 
        customer_id,
        order_date,
        DATENAME(MONTH, order_date) AS month_name,
        --LAG(order_date) looks at the previous row for the same customer_id (based on the ORDER BY order_date) and 
        --pulls that previous order’s date into the current row.
        LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order_date 
    FROM orders
)
SELECT
    month_name,
    COUNT(CASE WHEN prev_order_date IS NULL THEN 1 END) AS new_customers,
    COUNT(CASE WHEN prev_order_date IS NOT NULL THEN 1 END) AS returning_customers
FROM ordered
GROUP BY month_name
ORDER BY MIN(order_date);


/* =====================================================
---Notes:
-----------------------------------------------------
• LAG() is a window function that lets me access data from the previous row within the same result set — without using a self join. 
For example, if I’m analyzing customer orders, LAG(order_date) gives me the last order date for that customer so I can compare it with 
the current one. If there’s no previous record, it returns NULL   
===================================================== */

