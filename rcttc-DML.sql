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
       
    
insert into ticket (customer_id, performance_id, seat_name) 
	select distinct c.customer_id, p.performance_id, rd.seat
	 from rcttc_data rd
     inner join customer c on rd.customer_first = c.first_name
    inner join performance p on rd.ticket_price = p.price and rd.date = p.show_date;
  
    select * from ticket;
    
    
		-- updates 
       
set sql_safe_updates = 0;

-- first update
select s.title, p.show_date, p.price, p.performance_id
	from performance p
	inner join shows s on p.show_id = s.show_id
 where p.show_date =  '2021-03-01';
 
 update performance 
 set price = 22.25
    where performance_id = 5;
 
	
 -- second update    
 select c.first_name, c.last_name, t.seat_name, p.performance_id, p.show_date, p.price, ticket_id
 from ticket t
 inner join customer c on t.customer_id = c.customer_id
 inner join performance p on t.performance_id = p.performance_id
 where p.performance_id = 5
order by t.seat_name;
  
 update ticket
 set seat_name = 'A4' 
 where ticket_id = 94;
 
update ticket 
set seat_name ='A2' 
where ticket_id = 101;

update ticket 
set seat_name ='C2' 
where ticket_id = 100;
 
update ticket 
set seat_name ='B4' 
where ticket_id = 98;
 
 select * from ticket where performance_id = 5;
 
 
-- third update 
select * from customer where phone = '801-514-8648';
  
update customer 
set phone = '1-801-EAT-CAKE'
where customer_id = 48;
select * from customer where customer_id = 48;


-- deletes
 
 select c.first_name, c.last_name, t.customer_id, p.performance_id, ticket_id
 from ticket t
 inner join customer c on t.customer_id = c.customer_id
 inner join performance p on t.performance_id = p.performance_id
 where p.theater_id =1;
 
delete from ticket where ticket_id =25;
delete from ticket where ticket_id =26;
delete from ticket where ticket_id =29;
delete from ticket where ticket_id =41;
delete from ticket where ticket_id =50;
delete from ticket where ticket_id =51;
delete from ticket where ticket_id =59;
delete from ticket where ticket_id =67;
delete from ticket where ticket_id =68;
 

select * from customer where first_name = 'liv';
delete from ticket where customer_id = 65; 
delete from customer where customer_id = 65; 
select * from customer;

set sql_safe_updates = 1;
