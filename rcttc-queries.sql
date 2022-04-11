use rcttc_schema;

-- Find all performances in the last quarter of 2021 (Oct. 1, 2021 - Dec. 31 2021).
select * from performance 
where show_date between '2021-10-01' and '2022-01-01';

-- List customers without duplication.
 select first_name, last_name, customer_id
 from customer; 
 
-- Find all customers without a `.com` email address.
select * from customer 
where not email_address like '%.com' ;

-- Find the three cheapest shows.
select 
	  s.title,
      p.show_id,
      min(p.price) min_price
from performance p 
inner join shows s on p.show_id= s.show_id 
 group by p.show_id
 limit 3

-- List customers and the show they're attending with no duplication.

-- List customer, show, theater, and seat number in one query.
-- Find customers without an address.
-- Recreate the spreadsheet data with a single query.
-- Count total tickets purchased per customer.
-- Calculate the total revenue per show based on tickets sold.
-- Calculate the total revenue per theater based on tickets sold.
-- Who is the biggest supporter of RCTTC? Who spent the most in 2021?