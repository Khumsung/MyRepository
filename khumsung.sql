CREATE SCHEMA zorba_sql_exam;
Create Schema Department;
CREATE TABLE Department (dept_id int(6) primary key,dept_name varchar(20),
dep_location varchar (20));
create table employees (emp_id int (20) primary key,emp_name varchar(30),job_name varchar(30),
hire_date int(10),salary decimal(30),dep_id int(20));
INSERT INTO Department values(1001,'finance','sydney');
INSERT INTO Department values(2001,'audit','melbourne');
INSERT INTO Department values(3001,'marketing','perth');
INSERT INTO Department values(4001,'production', 'birsbane');
insert INTO employees value(68319, 'kayling','president',1991-11-18,6000.00,1001);
insert INTO employees value(66928,'blaze','manager',1991-05-01,2750.00,3001);
INSERT INTO employees value(67832,'clare','manager',1991-06-09,2550.00,1001);
INSERT INTO employees value(65646,'jones','manager',1991-04-02,2957.00,2001);
INSERT INTO employees value(67858,'scarlet','analyst',1997-04-19,3100.00,2001);
alter table Department add dept_name varchar(20) not null;
alter table employees add job_name varchar(30) not null;

alter table Department add location varchar(30), add constraint check_dep_name location in ('sydney','melbourne', 'perth','birsbane');
 



