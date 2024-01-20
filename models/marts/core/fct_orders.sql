WITH payments AS (

  SELECT 
        order_id,
        SUM(IF(status = 'success', amount, 0)) AS amount 

  FROM {{ ref('stg_payments') }}
  GROUP BY 1

),

orders AS (
 
  SELECT 
        order_id, 
        customer_id,
        order_date

  FROM {{ ref('stg_orders') }}
  
),

orders_and_payments AS (
  SELECT 
      orders.customer_id, 
      orders.order_id, 
      orders.order_date, 
      payments.amount

  FROM orders
  FULL JOIN payments ON orders.order_id = payments.order_id
)

SELECT *
FROM orders_and_payments