
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);


INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 SELECT * FROM WORKER;
 /*
7. Write an SQL query to fetch the list of employees with the same salary.*/

SELECT salary
FROM worker 
WHERE Salary IN (
    SELECT Salary
    FROM worker
    GROUP BY Salary
    HAVING COUNT(*) > 1
)
/*8. Write an SQL query to show all departments along with the number of people in there.*/
select  department,COUNT(*)
  FROM worker
  GROUP BY department;
  /* Write an SQL query to fetch departments along with the total salaries paid for each of them.*/
  select department,sum(salary)
  from worker
  group by department;
  /*10. Write an SQL query to print worker name (First name) with the bonus amount and affected_from date.*/
SELECT 
    w.FIRST_NAME, b.BONUS_AMOUNT, t.affected_from
FROM
    worker w
        INNER JOIN
    bonus b ON w.worker_id = b.worker_ref_id
        INNER JOIN
    title t ON w.WORKER_ID = t.worker_ref_id;
    /*11. Write a SQL query to fetch all the worker information who neither been provided bonus nor having business title.*/
select * from worker 
where WORKER_ID not in(SELECT w.worker_id FROM worker w 
inner JOIN bonus b ON w.worker_id = b.worker_ref_id 
inner JOIN title t ON w.WORKER_ID = t.worker_ref_id);
/*12. Write a SQL query to fetch all the records of worker (name, salary) whose bonus date is more than affected from date.*/
SELECT w.FIRST_NAME,  w.SALARY FROM worker w 
inner JOIN bonus b ON w.worker_id = b.worker_ref_id 
inner JOIN title t ON w.WORKER_ID = t.worker_ref_id
 where b.BONUS_DATE > t.AFFECTED_FROM;