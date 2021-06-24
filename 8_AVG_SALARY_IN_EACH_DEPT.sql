--INPUT TBALE 
QS -- EMPLOYEE table has four columns emp_id, emp_name, salary and dept_id
emp_id	emp_name	salary	dept_id
1001	mark		60000	2
1002	antony		40000	2
1003	andrew		15000	1
1004	peter		35000	1
1005	john		55000	1
1006	albert		25000	3
1007	donald		35000	3

--Write a SQL Query to find all the employees who earn more than average salary in their corresponponding department. 
--OUTPUT TABLE

dept_id		emp_id		emp_name	salary
1			1005		john		55000
2			1001		mark		60000
3			1007		donald		35000



USE students;

create table EMPL_AVG_SALARY
(
emp_id int,
emp_name varchar(15),
salary int,
dept_id int
);

insert into EMPL_AVG_SALARY values
(1001,'mark',60000,2),
(1002,'antony',40000,2),
(1003,'andrew',15000,1),
(1004,'peter',35000,1),
(1005,'john',55000,1),
(1006,'albert',25000,3),
(1007,'donald',35000,3);

select * from EMPL_AVG_SALARY;

--------------FIRST FIND AVG SALARY FOR EACH DEPARTMENT------------------
select avg(salary) ,dept_id from EMPL_AVG_SALARY
group by dept_id;

-------------------THEN DO INNER JOIN--------------------------------
select A.dept_id,A.emp_id,A.emp_name,A.salary from EMPL_AVG_SALARY A
inner join 
(select avg(salary) As AVG_SALARY ,dept_id from EMPL_AVG_SALARY
group by dept_id) B
on A.dept_id = B.dept_id
where A.salary > B.AVG_SALARY;

-------------------USING SUB_QUERY------------------------------------

select A.dept_id,A.emp_id,A.emp_name,A.salary from EMPL_AVG_SALARY A
where A.salary > (select avg(salary) As AVG_SALARY  from EMPL_AVG_SALARY B where A.dept_id = B.dept_id);

