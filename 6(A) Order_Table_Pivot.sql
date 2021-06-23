/****** Script for SelectTopNRows command from SSMS  ******/

(6(A))

select A.order_day,A.total,B.product_id from 
(
(select order_day,max(quantity*price) as total from order_tabl 
group by order_day ) A
inner join
(select order_day,product_id,(quantity*price) as total from order_tabl) B
on A.order_day = B.order_day and A.total = B.total
);

----------------------------------------------------------------------------------
6(b)

select product_id,
SUM(ISNULL(SALES1,0)) as total_sales_01,
SUM(ISNULL(SALES2,0)) as total_sales_02
from
(
select product_id,
case when order_day = '2015-05-01' then total end as 'SALES1',
case when order_day = '2015-05-02' then total end as 'SALES2'
from
(
select order_day,product_id,sum(quantity*price) as total from order_tabl
group by order_day,product_id)A
) B
group by product_id;


----------------------
6(C)
select order_day,product_id --count(*) 
from order_tabl
group by order_day,product_id
having count(*) > 1;