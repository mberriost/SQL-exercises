/*
IBM is working on a new feature to analyze user purchasing behavior for all Fridays in the first quarter of the year. 
For each Friday separately, calculate the average amount users have spent per order. 
The output should contain the week number of that Friday and average amount spent.
*/

-- My solution:
select EXTRACT('week' FROM date) AS week_number, AVG(amount_spent) as avg_amount_spent from user_purchases
where day_name = 'Friday'
group by date
order by date

-- another way to do it(same result):
select DATE_PART('week', date) AS week_number, AVG(amount_spent) as avg_amount_spent from user_purchases
where day_name = 'Friday'
group by date
order by date