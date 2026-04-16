select * from users;

select count(distinct user_id) from users
where date between '2023-11-07' and '2023-11-15';

select user_id, sum(view_adverts) as total_view from users 
group by user_id
order by total_view desc
limit 1;

select date, avg(view_adverts) as avg_adverts from users
group by date
having count(distinct user_id) > 500
order by avg_adverts desc
limit 1;

select user_id, datediff(max(date), min(date)) as LT_days
from users 
group by user_id
order by LT_days desc;

select user_id, avg(view_adverts) as avg_daily_views 
from users
group by user_id
having count(distinct date) >= 5
order by avg_daily_views desc
limit 1;

create database mini_project;

create table T_TAB1 (
id int unique,
goods_type varchar(100),
quantity int,
amount int,
seller_name varchar(100)
);

insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (1, 'mobile phone', 2, 400000, 'MIKE');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (2, 'keyboard', 1, 10000, 'MIKE');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (3, 'mobile phone', 1, 50000, 'JANE');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (4, 'monitor', 1, 110000, 'JOE');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (5, 'monitor', 2, 80000, 'JANE');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (6, 'mobile phone', 1, 130000, 'JOE');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (7, 'mobile phone', 1, 60000, 'ANNA');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (8, 'printer', 2, 90000, 'ANNA');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (9, 'keyboard', 2, 10000, 'ANNA');
insert into T_TAB1 (id, goods_type, quantity, amount, seller_name) values (10, 'printer', 1, 80000, 'MIKE');

select * from T_TAB1;

create table T_TAB2 (
id int unique,
name varchar(100),
salary int,
age int
);

insert into T_TAB2 (id, name, salary, age) value (1, 'ANNA', 110000, 27);
insert into T_TAB2 (id, name, salary, age) value (2, 'JANE', 80000, 25);
insert into T_TAB2 (id, name, salary, age) value (3, 'MIKE', 120000, 25);
insert into T_TAB2 (id, name, salary, age) value (4, 'JOE', 70000, 24);
insert into T_TAB2 (id, name, salary, age) value (5, 'RITA', 120000, 29);

select * from T_TAB2;

select distinct(goods_type) from T_TAB1; # 4 entries returned

select sum(amount) from T_TAB1
where goods_type = 'mobile phone'; #640000

select name from T_TAB2
where salary > 100000; # three employees

select min(age), max(age), max(salary), min(salary) from T_TAB2;

select goods_type, avg(quantity) from T_TAB1
where goods_type in ('keyboard', 'printer')
group by goods_type;

select sum(amount), seller_name from T_TAB1
group by seller_name; #sales amount for each employee

select name, goods_type, quantity, amount, salary, age from T_TAB1 t1
join T_TAB2 t2 on t1.seller_name = t2.name
where name = 'MIKE';

select name from T_TAB2
where name not in (
select seller_name
from T_TAB1
where seller_name is not null
); # only one worker

select name, salary from T_TAB2
where age < 26; # three employees returned

select * from T_TAB1 t1
join T_TAB2 t2 on t1.seller_name = t2.name
where t2.name = 'RITA'; #this querry will return NO rows

