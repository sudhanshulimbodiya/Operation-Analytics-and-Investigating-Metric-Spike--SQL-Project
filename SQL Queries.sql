-----------------Exploratory Data Analysis (EDA)--------------------
--Case Study 1: Job Data Analysis--

-- A.Jobs Reviewed Over Time: Write an SQL query to calculate the number of jobs reviewed per hour for each day in November 2020.
SELECT ds as review_day, 
		count(job_id) as jobs, 
		SUM(time_spent) as total_time,
        ROUND(count(job_id)/(sum(time_spent)/3600),2) as jobs_per_hour 
FROM job_data
WHERE ds BETWEEN '2020-11-01' AND '2020-11-30'
GROUP BY review_day
ORDER BY review_day ASC;

-- B.Throughput Analysis: Write an SQL query to calculate the 7-day rolling average of throughput. Additionally, explain whether you prefer using the daily metric or the 7-day rolling average for throughput, and why.
WITH daily_throughput AS (
    SELECT DATE(ds) AS day,
		COUNT(*) AS total_events,
        SUM(time_spent) AS total_time,
        ROUND(COUNT(*) * 1.0 / NULLIF(SUM(time_spent), 0), 6) AS throughput
    FROM job_data
    GROUP BY DATE(ds)
)
SELECT day,
    throughput,
    ROUND(AVG(throughput) OVER (ORDER BY day ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 6) AS rolling_7d_throughput
FROM daily_throughput
ORDER BY day;

-- C.Language Share Analysis: Write an SQL query to calculate the percentage share of each language over the last 30 days.
SELECT language, ROUND(100.0 * COUNT(*) /total, 2) AS percentage_share, sub.total
FROM job_data
CROSS JOIN (SELECT COUNT(*) AS total FROM job_data) AS sub	
GROUP BY language, sub.total
ORDER BY percentage_share DESC;

-- D.Duplicate Rows Detection: Write an SQL query to display duplicate rows from the job_data table.
SELECT job_id, count(*) as dup_rows
FROM job_data
GROUP BY job_id
HAVING count(*) > 1;

--Case Study 2: Investigating Metric Spike--

-- A.Weekly User Engagement: Write an SQL query to calculate the weekly user engagement.
SELECT EXTRACT(week FROM occured_at) as week, 
	count(distinct user_id) as active_users
FROM events
WHERE event_type = 'engagement'
GROUP BY week 
ORDER by week;

-- B.User Growth Analysis: Write an SQL query to calculate the user growth for the product.
SELECT EXTRACT(year FROM created_at) as year, EXTRACT(month FROM created_at) as month,
	COUNT(user_id) as new_users, 
    SUM(COUNT(user_id)) OVER(order by EXTRACT(year FROM created_at), EXTRACT(month FROM created_at)) as cumu_users
    FROM users
    GROUP BY month, year
    ORDER BY year;

-- C.Weekly Retention Analysis: Write an SQL query to calculate the weekly retention of users based on their sign-up cohort.
WITH temp as(
	SELECT DISTINCT user_id,
    EXTRACT(week FROM occured_at) as signup_week
    FROM events
    WHERE event_type = 'signup_flow' 
    and event_name = 'complete_signup' 
    and EXTRACT(week FROM occured_at) = 18),

temp2 as(
	SELECT DISTiNCT user_id,
    EXTRACT(week FROM occured_at) as engagement_week
    FROM events
    WHERE event_type = 'engagement')
    
SELECT COUNT(user_id) as total_engaged_users,
SUM(CASE WHEN retention_week > 8 THEN 1 ELSE 0 END) AS retained_users
FROM (SELECT a.user_id, a.signup_week, b.engagement_week, (b.engagement_week - a.signup_week) as retention_week
FROM temp a
LEFT JOIN temp2 b
ON a.user_id = b.user_id
ORDER BY a.user_id) sub;

-- D.Weekly Engagement Per Device: Write an SQL query to calculate the weekly engagement per device.
SELECT CONCAT(EXTRACT(year FROM occured_at),'-', EXTRACT(week FROM occured_at)) as week_number, device,
	COUNT(DISTINCT user_id) as active_users
FROM events
WHERE event_type = 'engagement'
GROUP BY device, week_number
ORDER BY week_number;

-- E.Email Engagement Analysis: Write an SQL query to calculate the email engagement metrics.
SELECT
	ROUND(100*SUM(CASE WHEN action = 'email_open' then 1 ELSE 0 END)/
	SUM(CASE WHEN action in ('sent_weekly_digest', 'sent_reengagement_email') THEN 1 ELSE 0 END),2) AS open_rate,
    ROUND(100*SUM(CASE WHEN action = 'email_clickthrough' then 1 ELSE 0 END)/
	SUM(CASE WHEN action in ('sent_weekly_digest', 'sent_reengagement_email') THEN 1 ELSE 0 END),2) AS CTR_rate
FROM emailevents;
