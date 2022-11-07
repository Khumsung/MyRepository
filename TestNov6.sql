create schema ZORBA_SQL_EXAM;
create table employes (emp_id int(6), emp_name varchar(23), job_name varchar(20), manager_id int(6),hiring_date datetime,salary decimal(6) ,commission int (7), dept_id int(6));
insert into employes (emp_id, emp_name, job_name, manager_id, hiring_date, salary, commission, dept_id) values
  (68319, 'KAYLING', 'PRESIDENT', null,  '1991-11-18', 6000.00, null,  1001),
  (66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01' , 2750.00, null, 3001),
  (67832, 'CLARE','MANAGER', 68319, '1991-06-09', 2550.00, null, 1001),
  (65646,  'JONAS','MANAGER', 68319,  '1991-04-02',  2957.00,  null,  2001),
  (67858,  'SCARLET','ANALYST',65646, '1997-04-19',  3100.00,  null,2001),
  (69062,  'FRANK','ANALYST',65646,  '1991-12-03',  3100.00,  null, 2001),
  (63679,  'SANDRINE', 'CLERK',69062, '1990-12-18',   900.00,  null, 2001),
  (64989,  'ADELYN',  'SALESMAN',66928,'1991-02-20',  1700.00, 400.00, 3001),
  (65271,  'WADE', 'SALESMAN', 66928,'1991-02-22',  1350.00, 600.00,  3001),
  (66564,  'MADDEN', 'SALESMAN', 66928, '1991-09-28',  1350.00, 1500.00, 3001),
  (68454, 'TUCKER','SALESMAN', 66928, '1991-09-08',  1600.00,  0.00,3001),
  (68736,  'ADNRES','CLERK',  67858, '1997-05-23',  1200.00,  null, 2001),
  (69000, 'JULIUS', 'CLERK', 66928,'1991-12-03',  1050.00,   null,3001),
  (69324,  'MARKER', 'CLERK',  67832,'1992-01-23',  1400.00,  null, 1001);
  
  create table salary_grade (grade int(3) primary key,min_sal int(20),max_sal int(20));
  insert into salary_grade values
  (1,800,1300),
  (2,1301,1500),
  (3,1501,2100),
  (4,2101,3100),
  (5,3101,9999);
  select * from employes where salary > (select salary from employes where emp_name = 'JONAS');
  /*6. Write a SQL query to find those employees who work as same designation of FRANK. Return complete information about the employees. (Use Sub Query)*/
select * from employes 
where job_name in (select job_name from employes where emp_name='frank');
/*7. Write a SQL query to find those employees of department ID 2001 and whose designation is same as of the designation of department ID 1001. Return complete information about the employees.*/

select * from employes
where dept_id =2001 and job_name in(select job_name from employes where dept_id=1001);
/*8. Write a SQL query to find those employees who are senior to ADELYN. Return complete information about the employees.*/
select * from employes
where hiring_date>'1991-02-20';




  