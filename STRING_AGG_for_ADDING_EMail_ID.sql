use students;

create table EMP_Details
(
EMP_ID int,
GENDER varchar(10),
EMAIL_ID varchar(150),
DEPT_ID int
);

insert into EMP_Details values 
(1001,'M','YYYY@gmaix.com',104),
(1002,'M','ZZZ@gmaix.com',103),
(1003,'F','AAAAA@gmaix.com',102),
(1004,'F','PP@gmaix.com',104),
(1005,'M','CCCCC@gmaix.com',101),
(1006,'M','DDDDDD@gmaix.com',100),
(1007,'F','E@gmaix.com',102),
(1008,'F','SS@yahu.com',100),
(1009,'F','YYYYYY@gmaix.com',104);

select * from EMP_Details;

select DEPT_ID,STRING_AGG(EMAIL_ID,';') as email_list from EMP_Details group by DEPT_ID;

---Inorder to arrange that email id in ascending order ---

select DEPT_ID,STRING_AGG(EMAIL_ID,';') within group (order by EMAIL_ID) email_list from EMP_Details group by DEPT_ID;