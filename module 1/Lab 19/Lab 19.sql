use olist;
select price from order_items
WHERE Price = (SELECT MAX(Price) FROM order_items)
      OR Price = (SELECT MIN(Price) FROM order_items);
	
SELECT Price FROM order_items ORDER BY Price ASC limit 1; 
SELECT Price FROM order_items ORDER BY Price desc limit 1; 

select shipping_limit_date from order_items
where shipping_limit_date = (SELECT MAX(shipping_limit_date) FROM order_items)
OR shipping_limit_date = (SELECT MIN(shipping_limit_date) FROM order_items);

select min(shipping_limit_date) from order_items;
select max(shipping_limit_date) from order_items;

select customer_state, count(customer_id) as number from customers
order by number desc limit 1;

select customer_city, count(customer_id) as number from customers
order by number desc limit 1;

Select count(DISTINCT business_segment)
from closed_deals
where business_segment is not null;

select business_segment from closed_deals
group by business_segment;

select business_segment, sum(declared_monthly_revenue) from closed_deals
group by business_segment order by sum(declared_monthly_revenue) desc limit 3;

select sum(distinct review_score) from order_reviews;

-- In the `order_reviews` table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.

ALTER TABLE order_reviews
ADD review_category varchar(255);

SELECT * FROM order_reviews;

SET SQL_SAFE_UPDATES = 0;

UPDATE order_reviews
SET review_category = "VERY BAD"
WHERE review_score = 1;

UPDATE order_reviews
SET review_category = "BAD"
WHERE review_score = 2;

UPDATE order_reviews
SET review_category = "AVERAGE"
WHERE review_score = 3;

UPDATE order_reviews
SET review_category = "GOOD"
WHERE review_score = 4;

UPDATE order_reviews
SET review_category = "VERY GOOD"
WHERE review_score = 5;

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM order_reviews;

SELECT review_category, review_score, Count(review_id) FROM order_reviews
GROUP BY review_category, review_score
ORDER BY Count(review_id) DESC;

 -- From the `order_reviews` table, find the review value occurring most frequently and how many times it occurs.

SELECT review_score, Count(review_score) FROM order_reviews
GROUP BY review_score
ORDER BY Count(review_id) DESC limit 1;