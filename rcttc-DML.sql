use rcttc_schema;

insert into customer (first_name, last_name, phone, email_address, physical_address)
    select distinct 
        customer_first, customer_last, customer_phone, customer_email, customer_address
	from rcttc_data;     
    
select * from customer;    

insert into theater (theater_address, phone, theater_name, email)
	select distinct
		theater_address, theater_phone, theater, theater_email
        from rcttc_data;
        
select * from theater;

insert into shows (title)
	select distinct
		`show`
        from rcttc_data;
        
insert into shows (show_id, title)
			values (10, 'High School Musical'),
				   (11, 'Wen'),
                   (12, 'Ocean');
select * from shows;

insert into performance (show_id, show_date, price, theater_id)
select distinct s.show_id, rd.`date`, rd.ticket_price, t.theater_id
	from rcttc_data rd
    inner join shows s on rd.`show` = s.title
    inner join theater t on rd.theater = t.theater_name;
    
    select * from performance;
    
-- insert into ticket (customer_id, performance_id, seat_name)   
  select distinct c.customer_id, p.performance_id, rd.seat
	 from rcttc_data rd
      inner join customer c on rd.customer_first = c.first_name
   inner join performance p on rd.`date` = p.show_date;
       
    
insert into ticket (customer_id, performance_id, seat_name) 
	select distinct c.customer_id, p.performance_id, rd.seat
	 from rcttc_data rd
     inner join customer c on rd.customer_first = c.first_name
    inner join performance p on rd.ticket_price = p.price and rd.date = p.show_date;
   --  where performance_id = 5;
    
    select * from ticket;
    
    
		-- updates 
       
       set sql_safe_updates = 0;
select s.title, p.show_date, p.price, p.performance_id
	from performance p
	inner join shows s on p.show_id = s.show_id
 where p.show_date =  '2021-03-01';
 
 update performance 
 set price = 22.25
    where performance_id = 5;
 
	
     -- something is wrong. seat numbers don't match ticket numbers
 select c.first_name, c.last_name, t.seat_name, p.performance_id, p.show_date, p.price, ticket_id
 from ticket t
 inner join customer c on t.customer_id = c.customer_id
 inner join performance p on t.performance_id = p.performance_id
 where p.performance_id = 5
  order by t.seat_name;
 
 select * from performance where performance_id = 5;
 
select * from customer where phone = '801-514-8648';
  
update customer 
set phone = '1-801-EAT-CAKE'
where customer_id = 48;
select * from customer where customer_id = 48;


-- deletes
	
    -- first delete not complete
select th.theater_name, p.performance_id, t.ticket_id, t.customer_id
from ticket;

select * from rcttc_data where theater = '10 pin';

select t.ticket_id, t.customer_id, p.performance_id, p.theater_id 
 from ticket t
 inner join performance p on t.performance_id = p.performance_id
 where p.theater_id =1;

select * from customer where first_name = 'liv';
delete from ticket where customer_id = 65; 
delete from customer where customer_id = 65; 
select * from customer;

set sql_safe_updates = 1;
