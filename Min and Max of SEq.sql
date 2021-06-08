use students;

create table EMP
(
"GROUP" varchar(10),
"Sequence" INT
);

insert into EMP values('A',1);
insert into EMP values('A',2);
insert into EMP values('A',3);
insert into EMP values('A',5);
insert into EMP values('A',6);
insert into EMP values('A',8);
insert into EMP values('A',9);
insert into EMP values('B',11);
insert into EMP values('C',1);
insert into EMP values('C',2);
insert into EMP values('C',3);

select * from EMP;

select "GROUP",
"sequence",ROW_NUMBER() over(partition by "GROUP" order by "Sequence") as ROW_NUM ,
"sequence" - ROW_NUMBER() over(partition by "GROUP" order by "Sequence") as SPLIT  from EMP;

select "GROUP",
min("sequence") as min_SEQ,
max("sequence") as max_seq
from 
(
select "GROUP",
"sequence",
"sequence" - ROW_NUMBER() over(partition by "GROUP" order by "Sequence") as SPLIT  
from EMP
) A
group by "GROUP", SPLIT
order by "GROUP";


