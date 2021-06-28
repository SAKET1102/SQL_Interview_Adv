Q. Team table has two columns namely Id and Teamname and it contains 4 teamsname.

ID  team_name
1	India
2	Australia
3	England
4	Newzealand

Ans: Write a SQL which will fetch total schdule of matched between each team vs Opposite team. 

id	matches
1	India vs Australia
1	India vs England
1	India vs Newzealand
2	Australia vs England
2	Australia vs Newzealand
3	England vs Newzealand

USE students;

create table team_tbl
(
id int,
team_name varchar(15)
);

insert into team_tbl values
(1,'India'),
(2,'Australia'),
(3,'England'),
(4,'Newzealand');

select T1.id,concat(T1.team_name,' vs ', T2.team_name) as matches from
(
select id,team_name from team_tbl
) as T1
inner join 
(
select id,team_name from team_tbl
) as T2
on T1.id < T2.id
order by T1.id;

