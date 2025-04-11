-- Customers that have spend more than $50
select 
c.customer_last_name as last_name,
c.customer_first_name as first_name,
ROUND(SUM(quantity * cost_to_customer_per_qty), 2) as total_spend
from customer_purchases cp
join customer c on cp.customer_id = c.customer_id
group by first_name, last_name
having total_spend > 50
order by last_name, first_name;
