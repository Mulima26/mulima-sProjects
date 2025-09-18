create database business;

create table employee(
EmpId int primary key NOT NULL,
EmpName VARCHAR(25)NOT NULL,
PhoneNumber Varchar(10)
);
INSERT INTO employee (EmpId,EmpName,PhoneNumber)
values('1','Joseph Phiri','0978850213'),
       ('2','Jonny Tumi','0955850213'),
	   ('3','Betty Alice','0978850111'),
	   ('4','Josephine Roberts','0976650213')

create table project(
projectID int primary key not null,
projectName varchar(100) not null,
EmpId int,
Foreign key(EmpId) references Employee(EmpId) );

insert into project(projectID,projectName,EmpId)
values('01','Fishing','2'),
      ('02','Weeding','1'),
	  ('03','Planting','4'),
	  ('04','Harvesting','3')

Select*from employee;
select*from project;

Select 
project.projectName,
project.projectID,
employee.EmpName,
employee.EmpId
from project
INNER JOIN employee on 
project.EmpId= employee.EmpId;

Select 
project.projectID,
employee.EmpName,
employee.empId,
employee.phoneNumber
from project
right join employee on 
project.empId= employee.empId;

Select 
project.projectID,
employee.EmpName,
employee.empId,
employee.phoneNumber
from project
left join employee on 
project.empId= employee.empId;

Select 
project.projectID,
employee.EmpName,
employee.empId,
employee.phoneNumber
from project
full join employee on 
project.empId= employee.empId;