create schema  ‘SQL_EXAM_21_11_22’;
create table Physician (employees_id int(6) primary key, name varchar (50), position varchar (30));
insert into Physician (employees_id ,name ,position ) values 
(1,'John Dorian','Staff Internist'),
(2,'Elliot Reid ','	Attending Physician'),
(3,'Christopher Turk','	Surgical Attending Physician'),
(4,'Percival Cox','Senior Attending Physician'),
(5,'Bob Kelso','Head Chief of Medicine'),
(6,  '	Todd Quinlan','	Surgical Attending Physician'),
(7	,'John Wen	','Surgical Attending Physician'),
(8,'Keith Dudemeister','MD Resident'),
(9,	'Molly Clock','Attending Psychiatrist');



create table  Department (department_id int (20) primary key, name varchar(40), head  int(5),foreign key( head ) references  Physician (employees_id));
 insert into Department ( department_id,name,head)values
 (1,'General Medicine'	,4),
( 2	,'Surgery ',7),
(3	,'Psychiatry',9);

create table Affiliated_with (physician  int (3),department int(3),primaryaffiliation varchar(7),
foreign key(physician) references physician(employees_id),foreign key(department)
 references department(department_id));

insert into Affiliated_with(physician,department,primaryaffiliation) values
(1, 1 ,'t'),
(2 ,1 ,'t'),
(3, 1, 'f'),
(3, 2 ,'t'),
(4 ,1, 't'),
(5 ,1 ,'t'),
(6 ,2 ,'t'),
(7 ,1 ,'t'),
(7, 2, 't'),
(8 ,1 ,'t');

create table patient(patient_id int(30) primary key, 
name varchar(30), address varchar(30), phone int(30), insurance_id int(20), physician_id int,foreign key(physician_id) references Physician(employees_id));

insert into patient(patient_id , name, address, phone ,insurance_id ,physician_id ) values
(100000001, 'John Smith',  '42 Foobar Lane' ,555-0256 ,68476213 ,1),
(100000002, 'Grace Ritchie' ,'37 Snafu Drive' ,555-0512 ,36546321 ,2),
(100000003, 'Random J. Patient' ,'101 Omgbbq Street' ,555-1204 ,65465421 ,2),
(100000004 ,'Dennis Doe' ,'1100 Foobaz Avenue' ,555-2048 ,68421879 ,3);
create table appointment (appointment_id int(10)primary key, patient int(30),
physician int(6),start_date_time date,end_date_time date,  foreign key (patient)
references patient(patient_id), foreign key (physician)references physician(employees_id));

insert into appointment values 
(13216584,100000001,1,'2008-04-24 10:00','2008-04-24 11:00'),
(26548913,100000002,2,'2008-04-24 10:00','2008-04-24 11:00'),
(36549879,100000001,1,'2008-04-25 10:00','2008-04-25 11:00'),
(46846589,100000004,4,'2008-04-25 10:00','2008-04-25 11:00'),
(59871321,100000004,null,'2008-04-26 10:00','2008-04-26 11:00'),
(69879231,100000003,2,'2008-04-26 11:00','2008-04-26 12:00'),
(76983231,100000001,3,'2008-04-26 12:00','2008-04-26 13:00'),
(86213939,100000004,9,'2008-04-27 10:00','2008-04-27 11:00'),
(93216548,100000002,2,'2008-04-27 10:00','2008-04-27 11:00');
/*2write a sql query to find the patient with their physican by whom they
recieved prelimatry treatment.return patient name as patient,address as address and
p physician name as physiant  */

select patient.name as patient,patient.address as address,physician.name as physician 
from patient patient 
inner join physician physician on  patient.physician_id=physician.employees_id;
/*3write sql query to identyfy the patient and the number  of physcian with whom they
have schedule appointment ,return patient name as patient,number 
of physician  as apponitment for no pf physician*/

select patient.name as "patient",count(a.patient) as" appointment for no.of physician"
from appointment a
join patient patient  on a.patient-patient.patient_id
group by patient.name
having count(a.patient)>=1;
/*4.write sql to locate the patients who attented the appointment on  25 april at 10 am
return name of patient,physician name as "name of physician",schedule date
and time to meet the physician*/

select pa.name,py.name as "name of physician",a.start_date_time 
from ((physician py
inner join patient pa on pa.physician_id=py.employees_id )
inner join appointment a on pa.patient_id=a.patient) 
where a.start_date_time ='2008-04-25';

/*- 5.  write a SQL query to identify those patients who do not require any physician assistance.
 Return Name of the patient as "Name of the patient", 
-Name of the Physician as "Name of the physician" and scheduled appointment date time.*/

select pa.name as Patient, a.start_date_time as Scheduled_appointment_date_time from patient pa
join appointment a on a.patient=pa.patient_id 
where a.physician is null;



/*6 6.  write a SQL query to identify those patients whose primary care is provided by a physician who is not the head of any department. 
-- Return Patient name as "Patient", Physician Name as "Primary care Physician*/
 


select pa.name as Patient,  ph.name as Primary_Care_physician
 from patient pa
join physician ph on ph.employees_id = pa.physician_id
where pa.physician_id not in (select head from department);

/*7.  write a SQL query to identify the physicians who are the department heads.Return
 Department name as “Department” and Physician name as “Physician” */
 


select d.name as Department, ph.name as physician 
from department d, physician ph
where d.head = ph.employees_id;

/*-- 8.  write a SQL query to count the number of patients who scheduled an 
appointment with at least one physician - Return count as "Number of patients taken at least one appointment".
*/

select count(distinct patient) from appointment where physician is not null;

/* 9.  write a SQL query to identify the physician and the department with which he or she is affiliated. 
-- Return Physician name as "Physician", and department name as "Department".
*/
select p.name as physician,d.name from department d ,physician p
where d.department_id =p.employees_id;



/*10.  write a SQL query to find those physicians who are yet to be affiliated. 
Return Physician name as "Physician", Position, and department as "Department".
*/


