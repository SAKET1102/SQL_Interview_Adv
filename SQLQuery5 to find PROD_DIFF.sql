use students;

create table order_tabl
(
order_day date,
order_id varchar(10),
product_id varchar(10),
quantity int,
price int
);

insert into order_tabl values
('2015-05-01','ORDR1','PROD1',5,5),
('2015-05-01','ORDR2','PROD2',2,10),
('2015-05-01','ORDR3','PROD3',10,25),
('2015-05-01','ORDR4','PROD1',20,5),
('2015-05-02','ORDR5','PROD3',5,25),
('2015-05-02','ORDR6','PROD4',6,20),
('2015-05-02','ORDR7','PROD1',2,5),
('2015-05-02','ORDR8','PROD5',1,50),
('2015-05-02','ORDR9','PROD6',2,50),
('2015-05-02','ORDR10','PROD2',4,10);

--ANS:: 1

select product_id,count(product_id) as PROD_CNT,count(distinct order_day) as ORD_CNT 
from order_tabl 
group by product_id
having count(distinct order_day) > 1;

--ANS1----using SubQuery
select * from order_tabl where order_day = '2015-05-02'
and product_id not in (select distinct product_id from order_tabl where order_day = '2015-05-01') ;

--Using Join--
select A.product_id,B.product_id from 
(
(
select product_id from order_tabl where order_day = '2015-05-02'
) A
LEFT JOIN
(
select product_id from order_tabl where order_day = '2015-05-01'
) B
on A.product_id = B.product_id
)
where B.product_id is  null;

select * from order_tabl;