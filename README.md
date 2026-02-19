# Operation-Analytics-and-Investigating-Metric-Spike--SQL-Project
## Project Description 
This project “Operation Analytics and Investigating Metric Spike” focused on analyzing and providing insights to company over its end to end operations so that it helps in making future decision. It involves using SQL to analyze the different aspects of Operational Analytics in investigating metric spikes. It also involves different tasks for detailed review about customer retention and sales such as Weekly Retention Analysis, Weekly User Engagement, Email Engagement Analysis and others.

## Purpose of the Project
The purpose of this project is to analyze operational data to identify performance gaps and improvement opportunities.
It focuses on investigating metric spikes and sudden changes in key business indicators.
The goal is to use advanced SQL to deliver actionable insights that support data-driven decision-making across teams.

## About Data 
This project data was obtained from Trainity - Operation Analytics and Investigating Metric Spike and it consist 2 case studies, Case Study 1 to analyze workflow performance and operational efficiency, and case study 2 Case Study 2 to analyze user behavior, email interactions, and platform engagement trends.

Case Study 1: Job_data
| Column     | Description                                  | Data Type |
| ---------- | -------------------------------------------- | --------- |
| ds         | Date of the job event                        | DATE      |
| job_id     | Unique identifier of the job                 | INT       |
| actor_id   | Unique identifier of the user performing job | INT       |
| event      | Type of job event                            | VARCHAR   |
| language   | Language used in the job                     | VARCHAR   |
| time_spent | Time spent on the job (in seconds)           | INT       |
| org        | Organization identifier                      | VARCHAR   |

Case Study 2: Users
| Column       | Description                        | Data Type |
| ------------ | ---------------------------------- | --------- |
| user_id      | Unique identifier of the user      | INT       |
| created_at   | User account creation date         | DATETIME  |
| company_id   | Company identifier                 | INT       |
| language     | User's preferred language          | VARCHAR   |
| activated_at | Account activation date            | DATETIME  |
| state        | Current status of the user account | VARCHAR   |

Events
| Column      | Description                           | Data Type |
| ----------- | ------------------------------------- | --------- |
| user_id     | Unique identifier of the user         | INT       |
| occurred_at | Timestamp of the event                | DATETIME  |
| event_type  | Category of the event                 | VARCHAR   |
| event_name  | Specific name of the event            | VARCHAR   |
| location    | Location where event occurred         | VARCHAR   |
| device      | Device used by the user               | VARCHAR   |
| user_type   | Type of user (active, inactive, etc.) | VARCHAR   |

Email_Events
| Column      | Description                                | Data Type |
| ----------- | ------------------------------------------ | --------- |
| user_id     | Unique identifier of the user              | INT       |
| occurred_at | Timestamp of the email event               | DATETIME  |
| action      | Email action (sent, opened, clicked, etc.) | VARCHAR   |
| user_type   | Type of user interaction                   | VARCHAR   |


## Approach Used
1. Data Preparation

1.Created database and imported all CSV files (job_data, users, events, email_events).
2.Converted date columns into proper date formats for time-based analysis.
3.Checked for duplicates, inconsistencies, and ensured data integrity.

2. SQL-Based Metric Analysis

Case Study 1 – Job Data Analysis
1.Calculated jobs reviewed per hour for daily performance tracking.
2.Computed 7-day rolling average of throughput to smooth short-term fluctuations.
3.Analyzed language share distribution over the last 30 days.
4.Identified duplicate records for data validation.

Case Study 2 – Metric Spike Investigation
1.Measured weekly active users for engagement tracking.
2.Analyzed user growth trends over time.
3.Performed cohort-based weekly retention analysis.
4.Evaluated weekly engagement by device type.
5.Calculated email engagement metrics (sent, opened, clicked).

3. Insight Generation
1.Interpreted trends and anomalies in key metrics.
2.Compared short-term vs rolling averages to explain metric spikes.
3.Delivered actionable insights to support operational and product decisions.

## Questions to Answer
Case Study 1: Job Data Analysis

A.Jobs Reviewed Over Time:

Your Task: Write an SQL query to calculate the number of jobs reviewed per hour for each day in November 2020.

B.Throughput Analysis:

Your Task: Write an SQL query to calculate the 7-day rolling average of throughput. Additionally, explain whether you prefer using the daily metric or the 7-day rolling average for throughput, and why.

C.Language Share Analysis:

Your Task: Write an SQL query to calculate the percentage share of each language over the last 30 days.

D.Duplicate Rows Detection:

Your Task: Write an SQL query to display duplicate rows from the job_data table.

Case Study 2: Investigating Metric Spike

A.Weekly User Engagement:

Your Task: Write an SQL query to calculate the weekly user engagement.

B.User Growth Analysis:

Your Task: Write an SQL query to calculate the user growth for the product.

C.Weekly Retention Analysis:

Your Task: Write an SQL query to calculate the weekly retention of users based on their sign-up cohort.

D.Weekly Engagement Per Device:

Your Task: Write an SQL query to calculate the weekly engagement per device.

E.Email Engagement Analysis:

Your Task: Write an SQL query to calculate the email engagement metrics.








