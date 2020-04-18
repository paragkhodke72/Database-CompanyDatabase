/* 
Parag Khodke
pkhod1@unh.newhaven.edu%
CSCI 6622, Spring 2019
Section  2
Instructor: prof.Sheehan
Database-Course Project.
------------------------------------------------------------------------------------------------------------
Each items in the category has unique ID so we should know the Item ID while retriving the data from database
*/

-- Query A) 
use pkhod1_project;
select item_id ,item_type,item_name
from items
order by items.item_type ASC , items.item_name ASC;

-- Query B) 
use pkhod1_project;
select customer_name as C_name_pen_moreThan100
from customer,orders
where customer.customer_id = orders.customer_id
and order_id in
(
	select order_id from orderline
	where item_id = 0
	and quantity>100
);

-- Query C) 
use pkhod1_project;
select customer_name as C_name_bought_EnvelopesAndLabels
from customer,orders
where orders.customer_id = customer.customer_id
and order_id in (
					select order_id
					from orderline		
					where item_id in ('555','666')
					group by order_id
					having count(*)=2
				 );

/*   --  OR  we can use following queries also to retrive data
use project;
select customer_name as C_name_bought_EnvelopesAndLabels
from customer,orders
where orders.customer_id = customer.customer_id
and order_id in (
					select order_id
					from orderline
					where item_id = 555 )
and order_id in
(
	select order_id from orderline where item_id = 666
);
*/

-- Query D) 
use pkhod1_project;
select customer_name as C_Name_only_bough_copyParers
from customer,orders
where customer.customer_id = orders.customer_id
and order_id = any (
					select order_id
					from orderline
					where item_id  =  333 
					and order_id in ( select order_id 
									  from orderline 
									  group by order_id 
									  having count(*)< 2
								   ) 
				);
-- Query E) using inner join and 'AND'  
use pkhod1_project;
create view view2 as 
select customer_name,orders.order_id,sum(items.cost * orderline.quantity) as Total
from  customer inner join orders on customer.customer_id = orders.customer_id
inner join orderline on orders.order_id = orderline.order_id
inner join items on  items.item_id = orderline.item_id
group by order_id;

select customer_name, max(Total) as Grestest_Spend_SingleOrder
from view2
group by customer_name
order by Grestest_Spend_SingleOrder desc
limit 1;

drop view view2;

 /* OR we can use following queries also to retrive data from database
-- using WHERE and AND
use project;
create view view1 as 
select customer_name,orders.order_id,sum(items.cost * orderline.quantity) as Total
from  customer,orders,orderline,items
where customer.customer_id = orders.customer_id
and orders.order_id = orderline.order_id
and items.item_id = orderline.item_id
group by order_id;

select customer_name, max(Total) as asd
from view1
group by customer_name
order by asd desc
limit 1;

drop view view1;
*/

-- Query F) 
use pkhod1_project ;
create view vie as 
select customer.customer_id, customer_name,orders.order_id, items.item_type, sum(items.cost * orderline.quantity) as Total_most_Spend_in_category
from  customer inner join orders on customer.customer_id = orders.customer_id
inner join orderline on orders.order_id = orderline.order_id
inner join items on  items.item_id = orderline.item_id
group by item_type, customer_name,orders.order_id,customer.customer_id;

select temp.item_type, temp.customer_name, temp.Total_most_Spend_in_category
from vie as temp
INNER JOIN 
(
	SELECT item_type, MAX(Total_most_Spend_in_category) as price
	from vie
	group by item_type
) as vie2
ON vie2.item_type = temp.item_type AND vie2.price = temp.Total_most_Spend_in_category;

drop view vie;

-- Query G) 
use pkhod1_project ;
select customer.customer_name as Cname_bought_both_stapler_paperClips, zip
from customer, orders, orderline, items
where customer.customer_id = orders.customer_id
and orders.order_id = orderline.order_id
and orderline.item_id = items.item_id 
and customer.zip = 06460
and orderline.item_id in ('777','888')
group by customer_name;


-- Query H)  
use pkhod1_project ;
select customer_name,customer.zip, sum(items.cost * orderline.quantity) as Total_spend_more_than_500
from  customer,orders,orderline,items
where customer.customer_id = orders.customer_id
and orders.order_id = orderline.order_id
and items.item_id = orderline.item_id
group by orders.order_id
having Total_spend_more_than_500 >500;


-- Query I)  
use pkhod1_project ;
select customer.state, sum(orderline.quantity * items.cost) as Total_Amount_Spend_in_this_State
from  customer inner join orders on customer.customer_id = orders.customer_id
inner join orderline on orders.order_id = orderline.order_id
inner join items on  items.item_id = orderline.item_id
group by customer.state
order by Total_amount_spend_in_this_State desc;


-- Query J) 
use pkhod1_project ;
select  zip, state, count( orderline.order_id ) as Largest_orders_placed_in_ThisZip 
from  customer inner join orders on customer.customer_id = orders.customer_id
inner join orderline on orders.order_id = orderline.order_id
inner join items on  items.item_id = orderline.item_id
group by zip,state
order by Largest_orders_placed_in_ThisZip  desc
limit 1;

