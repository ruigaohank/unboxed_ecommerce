  -- Q1. What are the quarterly sales trends (order count, revenue, and average order value) for Macbooks sold in North America across all years?

WITH quarterly_trends AS (
  SELECT DATE_TRUNC(orders.purchase_ts, quarter) AS purchase_quarter,
    COUNT(orders.id) AS order_count,
    AVG(orders.usd_price) AS aov,
    SUM(orders.usd_price) AS revenue
  FROM core.orders
  LEFT JOIN (
    SELECT DISTINCT id,
      country_code
    FROM core.customers ) AS unique_customers
  ON orders.customer_id = unique_customers.id
  LEFT JOIN core.geo_lookup
  ON unique_customers.country_code = geo_lookup.country
  WHERE LOWER(orders.product_name) LIKE '%macbook%'
    AND geo_lookup.region = 'NA'
  GROUP BY 1
  ORDER BY 1 DESC)

SELECT AVG(order_count) AS avg_order_count,
  AVG(aov) AS avg_aov,
  AVG(revenue) AS avg_revenue
FROM quarterly_trends;


  -- Q2. For products purchased in 2022 on the website, or products purchased on mobile in any year, which region has the average highest time to deliver?

SELECT geo_lookup.region,
  AVG(DATE_DIFF(order_status.delivery_ts, order_status.purchase_ts, day)) AS avg_days_to_deliver,
FROM core.orders
LEFT JOIN core.order_status
ON orders.id = order_status.order_id
LEFT JOIN (
  SELECT DISTINCT id,
    country_code
  FROM core.customers ) AS unique_customers
ON orders.customer_id = unique_customers.id
INNER JOIN core.geo_lookup
ON unique_customers.country_code = geo_lookup.country
WHERE (orders.purchase_platform = 'website'
    AND EXTRACT(year FROM orders.purchase_ts) = 2022)
  OR (orders.purchase_platform = 'mobile')
GROUP BY 1
ORDER BY 2 DESC;


  -- Q3. Are there certain products that are getting refunded more frequently than others?

  -- first check the different product names
SELECT DISTINCT product_name
FROM core.orders;

SELECT CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END  -- to get cleaned product name
		AS product_name_clean,
  SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) 
		AS refund_count,
  ROUND(AVG(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END)*100, 2) 
		AS refund_rate
FROM core.orders
LEFT JOIN core.order_status
ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 2 DESC;


  -- Q4. Within each region, what is the most popular product?

  -- assume 'most popular' means most number of orders placed

WITH order_counts AS (
  SELECT region,
    CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END
    	AS product_name_clean,
    COUNT(orders.id) AS order_count
  FROM core.orders
  LEFT JOIN (
    SELECT DISTINCT id AS customer_id,
      country_code
    FROM core.customers) AS unique_customers
  ON orders.customer_id = unique_customers.customer_id
  INNER JOIN core.geo_lookup
  ON unique_customers.country_code = geo_lookup.country
  GROUP BY 1, 2)

SELECT *
FROM order_counts 
QUALIFY RANK() OVER (PARTITION BY region ORDER BY order_count DESC) = 1;


  -- Q5. Which marketing channel has the highest average signup rate for the loyalty program? How does this compare to the channel that has the highest number of loyalty program participants?

  -- signup rate is defined as an average of % loyalty signup over time
  -- highest number of loyalty program participants is defined as total count of loyalty customers

  -- Part 1: Marketing channel with the highest average signup rate for the loyalty program

  -- check the distinct marketing channels
SELECT DISTINCT marketing_channel
FROM core.customers;

WITH yearly_loyalty_rates AS (
  SELECT marketing_channel,
    DATE_TRUNC(created_on, year) AS account_creation_year,
    AVG(loyalty_program)*100 AS percent_loyalty
  FROM `core.customers`
  WHERE marketing_channel IN ('email', 'direct', 'affiliate', 'social media') -- filter out missing values and unknown channel
  GROUP BY 1, 2
  ORDER BY 1, 2)

SELECT marketing_channel,
  AVG(percent_loyalty) AS avg_loyalty_rate
FROM yearly_loyalty_rates
GROUP BY 1 
QUALIFY RANK() OVER (ORDER BY avg_loyalty_rate DESC) = 1;


  -- Part 2: Compare to channel with the highest number of loyalty customers
SELECT marketing_channel,
  SUM(loyalty_program) AS loyalty_customer_count
FROM core.customers
WHERE marketing_channel IN ('email', 'direct', 'affiliate', 'social media') -- filter out missing values and unknown channel
GROUP BY 1 
QUALIFY RANK() OVER (ORDER BY loyalty_customer_count DESC) = 1;
