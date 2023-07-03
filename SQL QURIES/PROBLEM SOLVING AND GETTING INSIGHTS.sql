###Q1 What is the average sold price of properties based on their grade?
#######order it by average descending rounding of to 2 decimal

SELECT grade,round(AVG(soldprice),2) as Average_cost 
from sales 
group by 1
order by 2 desc

###Q2 Which owner city  has the highest total property value?
###top 3 neighborhood

select owner_city,concat('$',' ',sum(soldprice)) as highest_total_property_value,count(*) as total_no_of_home_borught
from sales 
group by 1 
order by sum(soldprice) desc
limit 3


###Q3  How many properties have a vacant possession condition?

select property_addr as adress,owner1 as onwer,owner_city,owner_state,grade as type_of_room,condition
from sales
where condition = 'Vacant_Possession'
order by 1,5


###Q4  What is the distribution of property grades across different years?

SELECT EXTRACT(YEAR FROM year_built) AS year, grade, COUNT(*) AS count
FROM sales
GROUP BY EXTRACT(YEAR FROM year_built), grade
ORDER BY year, grade;


###Q5  Which property has the highest improvement value? top 3

select property_addr,cert_improvement_value as improvement_value
from sales
where cert_improvement_value is not null
order by 2 desc
limit 3

###Q6 Calculate the total land value and improvement value for grade and its condition.

select grade,condition,round(sum(shape_area),2) as total_land_area,sum(cert_improvement_value) as total_improvement_area
from sales
where grade is not null and condition is not null
group by 1,2
order by 1,2


###Q7   Identify the top 5 owners with the most properties.

select owner1 as owner,owner_street,owner_city,owner_state, count(property_addr) as no_of_properties
from sales
group by 1,2,3,4
order by 5 desc
limit 5


###Q8 How many properties were sold in each year?

select extract(year from conveyancedate) as year, count(property_addr) as count_of_porperty
from sales
group by 1
order by 1


###Q9 Calculate the average acreage of properties based on their condition.

select grade,condition, concat(round(avg(legal_acrea_in_acres),2),' ','acres') as average_acreage_of_properties
from sales
where grade is not null and condition is not null
group by 1,2
order by 1,2



###Q10 Determine the percentage of properties with each grade and it's condition

SELECT grade, condition ,
ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM sales), 2) AS percentage
FROM sales
where grade is not null and condition is not null
GROUP BY 1,2
order by 3 desc


###Q11 Write a query to find the properties with the highest total certified value (cert_land_value + cert_improvement_value) and display the property address along with the total value.

SELECT property_addr,max(cert_total_value) as highest_total_certified_value, grade,condition
from sales
where property_addr is not null and  cert_total_value is not null
group by 1,3,4
order by 2 desc
limit 5


###Q12 Calculate the average sold price per grade category (grade) and display the average price for each grade.

select grade,condition,round(avg(soldprice),1) as avg_price
from sales
where grade is not null 
group by 1,2
order by 3 desc


###Q13 Find the top 3 owners (owner1 or owner2) who own the most properties, and display their names along with the count of properties owned.

select concat(owner1,owner2) as owner, count(*) as properties_owned
from sales
group by 1
order by 2 desc
limit 3


###Q14 Calculate the percentage of properties that were sold with vacant possession (condition = 'Vacant_Possession') out of the total number of properties sold.

SELECT
   round( ((COUNT(*) FILTER (WHERE condition = 'Vacant_Possession') * 100.0) / COUNT(*)),2) AS Percentage_Vacant_Possession
FROM
    sales
WHERE
    condition IS NOT NULL;

 
###Q15 median sold price
SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY soldprice) AS median_sold_price
FROM sales;


###Q16 property distribution according to grade
select grade, count(*) 
from sales
where grade is not null
group by 1
order by 2 desc

###Q17 price distribution according to grade
select grade, concat('$',' ',sum(soldprice)) 
from sales
where grade is not null
group by 1
order by sum(soldprice) desc


###Q18 condition vs soldprice
select condition, concat('$',' ',sum(soldprice)),count(*) as no-of_home_sold
from sales
where condition is not null
group by 1
order by sum(soldprice) desc

###Q19 sum of  selling price per month

SELECT TO_CHAR(conveyancedate, 'MonthYYYY') AS month_year, sum(soldprice) AS sum_of)soldprice
FROM sales
GROUP BY month_year




select * from sales
