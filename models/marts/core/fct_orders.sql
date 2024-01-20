WITH payments AS (

  SELECT * FROM {{ ref('stg_payments') }}

),

customers AS (
 
  SELECT order_id, customer_id FROM {{ ref('stg_orders') }}
  
),

customers_and_payments AS (
  SELECT 
      customers.customer_id, 
      customers.order_id, 
      payments.amount
  FROM customers
  FULL JOIN payments ON customers.order_id = payments.order_id
)

SELECT *
FROM customers_and_payments

