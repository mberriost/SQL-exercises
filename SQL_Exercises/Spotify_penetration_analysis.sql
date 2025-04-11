/*
Market penetration is an important metric for understanding Spotify's performance and growth potential in different regions.
You are part of the analytics team at Spotify and are tasked with calculating the active user penetration rate in specific countries.


For this task, 'active_users' are defined based on the  following criterias:


last_active_date: The user must have interacted with Spotify within the last 30 days.
•    sessions: The user must have engaged with Spotify for at least 5 sessions.
•    listening_hours: The user must have spent at least 10 hours listening on Spotify.


Based on the condition above, calculate the active 'user_penetration_rate' by using the following formula.


•    Active User Penetration Rate = (Number of Active Spotify Users in the Country / Total users in the Country)


Total Population of the country is based on both active and non-active users.
​
The output should contain 'country' and 'active_user_penetration_rate' rounded to 2 decimals.


Let's assume the current_day is 2024-01-31.
*/

-- my solution:
WITH total_users_country as (select country,
COUNT(country) as total_users_per_country
from penetration_analysis
group by country),

number_active_users as (
select country, COUNT(country)
from penetration_analysis
where last_active_date between '2024-01-01'::date and '2024-01-30'::date 
AND sessions >= 5 AND listening_hours >= 10
group by country)

select 
pa.country,
total_users_per_country
from penetration_analysis pa
join total_users_country tu on pa.country = tu.country
