

-- A) 
use project;
select item_id ,item_type,item_name
from items
order by items.item_type ASC , items.item_name ASC;

-- B) 
use project;
select customer_name as C_name_pen_moreThan100
from customer,orders
where customer.customer_id = orders.customer_id
and order_id in
(
select order_id from orderline
where item_id = 0
and quantity>100
);

-- C) done  using  Item_ID
use project;
select customer_name as C_name_bought_EnvelopesAndLabels
from customer,orders
where orders.customer_id = customer.customer_id
and order_id in (
select order_id
from orderline
where item_id in ('555','666')
group by order_id
having count(*)=2);
/* --  using item_name
use project;
select distinct customer_name as C_name_bought_EnvelopesAndLabels
from customer c,orders o,orderline ol ,items i
where o.customer_id = c.customer_id
and o.order_id = ol.order_id
and ol.item_id = i.item_id 
and i.item_name in ('envelopes','labels');
*/

-- D) 
use project;
select customer_name
from customer,orders
where customer.customer_id = orders.customer_id
and order_id = any (select order_id
				from orderline
				where item_id  =  333 
				and order_id in   (	select order_id 
									from orderline 
									group by order_id 
									having count(*)< 2
								   ) 
				);
                
-- E) -- using inner join
use project;
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
;
