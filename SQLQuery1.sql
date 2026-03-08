create database Bank_Marketing
use Bank_Marketing

--1 display table 
select * from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]

--2 number of rows
SELECT COUNT(*) AS total_rows
FROM [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]

--3 display top 5 rows in table
select top 5 * from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]

--4 display values of target column 
select y , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by y
order by y

--5 display values of job column 
select job , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by job
order by count(*) desc

--6 display values of marital_status column
select marital , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by marital
order by count(*) desc

--7 display values of education column
select education , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by education
order by count(*) desc

--8 display values of credit_in_default column
select [default] , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by [default]
order by count(*) desc

--9 display values of housing_loan column
select housing , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by housing
order by count(*) desc

--10 display values of loan column
select loan , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by loan
order by count(*) desc

--11 display values of contact column
select contact , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by contact
order by count(*) desc

--12 display values of month column
select month , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by month
order by count(*) desc

--13 display value_counts of column 'day_of_week'
select day_of_week , count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by day_of_week
order by day_of_week

--14 Overall Subscription Rate
select y,count(*) as count,CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(10,2)) AS Percentage from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by y

--15 number of Subscription Rate by Age Group 
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age BETWEEN 51 AND 60 THEN '51-60'
        WHEN age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '71-100'
    END AS age_group,
    COUNT(*) AS total_count
FROM [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
GROUP BY 
    CASE 
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age BETWEEN 51 AND 60 THEN '51-60'
        WHEN age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '71-100'
    END
ORDER BY age_group;

--16 succes subscribtion by each age_group
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age BETWEEN 51 AND 60 THEN '51-60'
        WHEN age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '71-100'
    END AS age_group,
    SUM(CASE WHEN [y] = '1' THEN 1 ELSE 0 END) AS Subscribed_Yes,
    SUM(CASE WHEN [y] = '0' THEN 1 ELSE 0 END) AS Subscribed_No
FROM [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
GROUP BY 
    CASE 
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age BETWEEN 51 AND 60 THEN '51-60'
        WHEN age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '71-100'
    END
ORDER BY age_group;

--17 total_success_subscribtion by each job
select job , count(y) as total_success_subscribtion from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
where y ='True'
group by job
order by total_success_subscribtion desc

--18 min , max age for each job
select job , min(age) as min_age ,max(age) as min_age from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by job
order by job

--19 total subscribtion by each education level
select education , y ,count(*) as total_subscribtion from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by education,y
order by education,y

--20 total subscribtion by each marital_status
select marital , y ,count(*) as total_subscribtion from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by marital,y
order by marital,y

--21 total subscribtion by each Contact Method
select contact , y ,count(*) as total_subscribtion from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by contact,y
order by contact,y

--22 total subscribtion by each month
select month , y ,count(*) as total_subscribtion from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by month,y
order by month,y

--23 total subscribtion by each day
select day_of_week , y ,count(*) as total_subscribtion from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by day_of_week,y
order by day_of_week,y

--24 Campaign Efficiency by total subscribtion
select y,sum(campaign) as total_campaign from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by y

--25 Previous Campaign Success Rate Impact by subscribtion
select poutcome,y,count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by poutcome,y
order by poutcome,y

 --26  display value_counts of column 'previous_contacts_count'
select previous,count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by previous
order by previous

--27 total subscribtion by loan
select loan , y ,count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by loan,y
order by loan

--28 total subscribtion by housing_loan
select housing , y ,count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by housing,y
order by housing

--29 total subscribtion by credit_in_default
select [default] , y ,count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by [default],y
order by [default]

--30 total subscribtion by contact
select contact , y ,count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by contact,y
order by contact

--31 High-Value Customer Segment KPI : Identify customer segment with highest conversion probability¶
select job,education,y,count(*) from [bank-direct-marketing-campaigns - bank-direct-marketing-campaigns]
group by job,education,y
order by job,education