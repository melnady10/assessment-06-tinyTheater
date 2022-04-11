drop database if exists rcttc_schema;
create database rcttc_schema;
use rcttc_schema;

create table customer (
				customer_id int primary key auto_increment,
                first_name varchar (25) not null,
                last_name varchar (25) not null,
                phone varchar (25) not null,
                email_address varchar (50) not null,
                physical_address varchar (100) not null
                );
                
                
create table theater (
				theater_id int primary key auto_increment,
                theater_address varchar (100) not null,
                phone varchar (25) not null,
                theater_name varchar (50) not null,
                email varchar (50) not null
                );
                
create table shows (
                show_id int primary key auto_increment,
                title varchar (100) not null
                );
                
create table performance (
				performance_id int primary key auto_increment,
                price decimal (4,2) not null,
                show_date date not null,
                show_id int not null,
                theater_id int not null,
                
                constraint fk_performance_show_id
					foreign key (show_id)
					references shows(show_id),
                constraint fk_performance_theater_id
					foreign key (theater_id)
                    references theater (theater_id)
				);
                    
                
                
create table ticket (
				ticket_id int primary key auto_increment,
                seat_name varchar(10) not null,
                customer_id int not null,
                performance_id int not null,
                
                constraint fk_ticket_customer_id
					foreign key (customer_id)
                    references customer (customer_id),
                constraint fk_ticket_performance_id
					foreign key (performance_id)
                    references performance (performance_id)
				);
                
