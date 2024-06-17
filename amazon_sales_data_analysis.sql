select * from amazon;
ALTER TABLE amazon
ADD COLUMN timeofday VARCHAR(20);

UPDATE amazon
SET timeofday = CASE
    WHEN time between "06:01:00" and "12:00:00" < 12 THEN 'Morning'
    WHEN time between "12:01:00" and "17:00:00" < 18 THEN 'Afternoon'
    ELSE 'Evening'
END;

#1 QUESTION
 # what is the count of distinct cities in the dataset
select count(distinct(City)) as count_of_city from amazon;
-- selecting the count of distinct cities in the dataset---

#2 QUESTION
# For each branch, what is the corresponding city?
select Branch,City from amazon group by Branch,City;
 
#3 QUESTION 
#What is the count of distinct product lines in the dataset?
select count(distinct'Product line') as count_of_productline from amazon;
 
 
 #4 QUESTION 
 #Which payment method occurs most frequently?
 select Payment,count(*) as frequent_payment from amazon group by Payment order by frequent_payment desc limit 1;
 
  #5 QUESTION 
  #Which product line has the highest sales?
  select 'Product line',SUM(Total)  as maximum from amazon group by 'Product line' order by maximum desc limit 1;
  
   #5 QUESTION 
  #How much revenue is generated each month?
  select monthname(Date),sum(Total) as revenue from amazon group by monthname(Date);
  
  #6 QUESTION 
 -- #In which month did the cost of goods sold reach its peak?
  select monthname(Date), sum(cogs) as total_cogs from amazon group by
  monthname(Date) order by total_cogs desc limit 1;
  
    #7 QUESTION 
   # Which product line generated the highest revenue?
   select 'Product line',sum(Total) as revenue from amazon group by 'Product line' order by revenue desc limit 1;
   
   #8 QUESTION 
  # Which product line generated the highest revenue?
  select 'Product line' ,sum(Total) as revenue from amazon group by
  'Product line' order by revenue desc limit 1;
  
#9 QUESTION 
#In which city was the highest revenue recorded?
select City,sum(Total) as revenue from amazon group by City order by revenue desc limit 1;

#10 QUESTION 
#Which product line incurred the highest Value Added Tax?
select 'Product line',sum('Tax 5%') as high from amazon group by 'Product line' order by high desc limit 1;

#11 QUESTION 
#For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
select 
'Product line' ,sum(total) as total_sales CASE
when if total_sales > (select avg(total) from amazon) then "Good" 
	    else "bad" 
   end as status from amazon group by 'Product line';
   
#12 QUESTION
  #Identify the branch that exceeded the average number of products sold. 
  select Branch,sum(Quantity) as total_sold from amazon group by Branch
  having total_sold > avg(Quantity);
  
#13 QUESTION
  #Which product line is most frequently associated with each gender?
  select Gender,'Product line',count(*) as frequency from amazon group by gender,'Product line'
  order by gender, frequency desc;
  
#14 QUESTION
   #Calculate the average rating for each product line.
   select avg(rating),'Product line' from amazon group by 'Product line';
   
#15 QUESTION
#Count the sales occurrences for each time of day on every weekday.
select dayname(DATE),timeofday(Time),count('Invoice ID') as count_of_sale from amazon where 
dayname(DATE) not in('saturday','sunday') group by dayname(DATE),timeofday(Time) order by count_of_sale,dayname(DATE) desc;

#16 QUESTION
#Identify the customer type contributing the highest revenue.
select 'Customer type',sum(Total) as revenue from amazon group by 'customer type' order by revenue desc limit 1;

#17 QUESTION
#Determine the city with the highest VAT percentage.
select city,sum('Tax 5%') as most_tax from amazon group by city order by most_tax desc limit 1;

#18 QUESTION
#Identify the customer type with the highest VAT payments.
select 'customer type',sum('tax 5%') as most_vat from amazon group by 'customer type' order by most_vat desc limit 1;

#19 QUESTION
#What is the count of distinct customer types in the dataset?
select distinct('customer type'),count(*) as count from amazon group by 'customer type' order by count desc;

#20 QUESTION
#What is the count of distinct payment methods in the dataset?
select distinct(payment),count(*) as count from amazon group by payment order by count desc;

#21 QUESTION
#Which customer type occurs most frequently?
select 'customer type',count(*) as count from amazon group by 'customer type' order by count desc limit 1;

#22 QUESTION
#Identify the customer type with the highest purchase frequency.
select 'customer type',count(*) as purchase_freq from amazon group by 'customer type' order by purchase_freq desc limit 1;

#23 QUESTION
#Determine the predominant gender among customers.
select distinct 'gender', count(*) as count from amazon group by gender order by count desc limit 1;

#24 QUESTION
#Examine the distribution of genders within each branch
select distinct(branch),gender,count(*) as count from amazon group by branch,gender order by count desc;

#25 QUESTION
#Identify the time of day when customers provide the most ratings.
select TimeOfDay(Time),count(rating) as freq from amazon group by TimeOfDay(Time) order by freq desc;

#26 QUESTION
#Determine the time of day with the highest customer ratings for each branch.
select distinct(branch), timeofday,count(raitng) as freq from amazon group by branch order by freq desc;

#27 QUESTION
#Identify the day of the week with the highest average ratings.
select dayname(Date),count(rating) as freq from amazon group by dayname(date) order by freq desc;

#28 QUESTION
#Determine the day of the week with the highest average ratings for each branch.
select branch,dayname(date), avg(rating) as freq from amazon group by branch order by freq desc;




   
   


  
  
  





  
  
 
 
  
 