use students;

drop table temprature_16_june;

create table temprature_16_june
(
date_set date,
city varchar(10),
temperature float
);

insert into temprature_16_june values
('2021-04-01','A',24.2),
('2021-04-02','A',25.4),
('2021-04-03','A',24.1),
('2021-04-04','A',26.4),
('2021-04-05','A',27.5),
('2021-04-01','B',25.2),
('2021-04-02','B',25.9),
('2021-04-03','B',27.2),
('2021-04-04','B',26.1),
('2021-04-05','B',28.2);

select * from temprature_16_june;

select date_set,city,temperature,next_temp,COALESCE((next_temp- temperature),0) as temp_diff from
(
select date_set,city,temperature,lead(temperature) over (partition by city order by city) as next_temp
from temprature_16_june
) A;


