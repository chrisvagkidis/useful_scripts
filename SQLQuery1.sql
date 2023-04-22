-- create database
create database happy;

create database dummydatabase;

-- remove database
drop database dummydatabase;

-- use database
use happy;

-- create a table
create table employee(
e_id int not null, -- id, essentially indexing
e_name varchar(20), -- employee name (character, maximum 20 chars)
e_salary int, -- employee salary (integer)
e_age int, -- employee age 
e_gender varchar(20),
e_dept varchar(20), -- employee department
primary key(e_id) -- set the primary key
);


-- delete a table from database
drop table employee;

-- insert data into table
insert into employee values(
1, 'Sam', 95000, 45, 'Male', 'Operations'
);

insert into employee values(
2, 'Bob', 80000, 21, 'Male', 'Support'
);

insert into employee values(
3, 'Anne', 125000, 25, 'Female', 'Analytics'
);

insert into employee values(
4, 'Julia', 73000, 30, 'Female', 'Analytics'
);

insert into employee values(
5, 'Matt', 159000, 33, 'Male', 'Sales'
);

insert into employee values(
6, 'Jeff', 112000, 27, 'Male', 'Operations'
);


-- ---------------------------------------------------------------------

-- "select" data from a table
-- works like this:
-- select <<column_name>> from <<table_name>>
select e_name from employee;

-- select multiple data from a table at once
select e_name, e_gender, e_salary from employee;

-- extract all data from a table
select * from employee;

-- select "Distinct" from a table
-- used to select only distinct values
-- from a table
select distinct e_gender from employee;
-- should return only two values: Male, Female


-- "where" clause syntax
-- filters records from a table
-- select female employees
select * from employee where e_gender = 'Female';

-- select employees that are younger than 30
select * from employee where e_age < 30;

-- select employees that earn more than 100000
select * from employee where e_salary > 100000;


-- -------------- OPERATORS IN SQL ------------------------ 

-- "and" operator
-- select employees that are male and earn more than 100000
select * from employee where e_gender = 'Male' and e_salary > 100000;

-- select employees that work at 'Operations' and earn more than 100000
select * from employee where e_dept = 'Operations' and e_salary > 100000;

-- "or" operator
-- select employees that work either in 'Operations' or 'Analytics'
select * from employee where e_dept = 'Operations' or e_dept = 'Analytics';

-- select employees that earn more than 100000 or are older than 30
select * from employee where e_salary > 100000 or e_age > 30;

-- "not" operator
-- select employees that are NOT female
select * from employee where not e_gender = 'Female';

-- select employees that are Male and are NOT earning more than 100000
select * from employee where e_gender = 'Male' and not e_salary > 100000;

-- "like" operator
-- used to extract records with a particular pattern
-- used in combination with with card characters:
-- % -> represents zero, one or multiple characters
-- _ -> represents a single character
-- wild cards need to be in ''

-- select employees whose name start with 'J'
select * from employee where e_name  like 'J%';

-- select employees who are in their thirties
select * from employee where e_age like '3_';

-- select employees whose name start with 'J' and are female
select * from employee where e_name  like 'J%' and e_gender = 'Female';

-- "between" operator
-- used to extract values withing a given range
-- select employees who are between 20 and 25 years old
select * from employee where e_age between 20 and 25;

-- select employees whose salary is between 90000 and 120000
select * from employee where e_salary between 90000 and 120000;

-- "in" operator
-- used to specify discrete values
-- select employees whose id is either 2 or 4
select * from employee where e_id in (2, 4);
-- should return only e_id = 3 and e_id = 4
-- between operator would return 2, 3, 4:
select * from employee where e_id between 2 and 4;

-- select employees whose age is 21 or 45
select * from employee where e_age in (21, 45);
-- this will return only employees who are 21 or 45
-- between operator would return employees who are aged between 21 and 45:
select * from employee where e_age between 21 and 45;

-- ------------------ FUNCTIONS IN SQL -----------------------------

-- MIN() function 
-- gives the minimum value from a column
-- select the minimum age from the table
select min(e_age) from employee;

-- select minimum salary from the table
select min(e_salary) from employee;

-- MAX() function
-- gives the maximum value from a column
-- select the maximum age from the table
select max(e_age) from employee;

-- select the maxium salary from the table
select max(e_salary) from employee;


-- COUNT() function
-- returns the number of rows that match a specific criteria
-- used as follows:
-- select count(*) from table_name where [condition]
-- count the number of male employees:
select count(*) from employee where e_gender = 'Male';

-- count the number of people who are older or equal to 30:
select count(*) from employee where e_age >= 30;

-- SUM() function
-- gives the total sum of a numeric column
-- find the summary of the salaries of the table
select sum(e_salary) from employee;

-- AVG() function
-- gives the avarage value of a numeric column
-- find average salary
select avg(e_salary) from employee;

-- find average age
select avg(e_age) from employee;


-- ---------------------------------------------------------
-- --------------- String Functions in SQL -----------------


-- LTRIM() function
-- removes blank space from the left
select '       spartaaaa';

select ltrim('     spartaaaa');

-- LOWER()
-- converts characters to lower case
select lower('THIS IS A TEST MESSAGE');

-- UPPER() 
-- converts characters to upper case
select upper('this is a test message');

-- REVERSE()
-- reverses all characters in the string
select reverse('This is a test message');

-- SUBSTRING()
-- gives a part of the string
-- works like this:
-- select substring('full string', start indexing, how many characters we want)
-- for example if we want to print only the
-- "test message" we do the following:
select substring('This is a test message', 11, 12);
-- 't' in 'test' is the 11th character
-- 12 characters -> 'test message'


-- -------------------------------------------------------
-- ----------------- CLAUSES in SQL ----------------------

-- ORDER BY clause
-- sorts table with respect the selected column
-- can be either ascending or descending 
-- default is ascending
-- example: order by salary
select * from employee order by e_salary;
-- could also be:
select * from employee order by e_salary asc;
-- "asc" is not really needed, as it is default

-- order by salary, but descending order:
select * from employee order by e_salary desc;

-- select specific columns to show
-- order by age
select e_id, e_name, e_age from employee order by e_age;


-- TOP clause
-- shows only a handful of results (from the top)
-- select TOP x from table_name
-- x -> number of results we want to see
-- example: see the first 3 results:
select top 3 * from employee;

-- select 3 employees and order them by age:
select top 3 * from employee order by e_age;

-- GROUP BY statement
-- used to get aggregate result with respect to a group
-- syntax:
-- select column_list from table_name where [condition] group by colname(s) order by colname(s)
-- or if we don't the "where" clause or the "order by" clause
-- select column list from table_name group by colname(s)

-- example: average salary with respect to the gender:
select avg(e_salary), e_gender from employee group by e_gender;

-- example: get the average with respect to the department and order it by the descending age
select avg(e_age), e_dept from employee group by e_dept order by avg(e_age) desc;

-- example: get the average age in respect to the gender and sort it by age ascending
select avg(e_age), e_gender from employee group by e_gender order by avg(e_age);


-- HAVING clause
-- used in combination with GROUP BY to impose conditions on groups
-- syntax:
-- select column_name(s) from table_name where [condition] group by column_name(s) having [condition] order by column_name(s)
-- example: group by the departments and show only those who have average salary higher than 100000
select e_dept, avg(e_salary) as avg_salary 
from employee
group by e_dept
having avg(e_salary) > 100000;
-- keyword "as" -> names the average salary column column


-- ------------------------------------------------------------------
-- ------------------ STATEMENTS in SQL -----------------------------

-- UPDATE statement
-- used to modify excesting records in a table
-- syntax:
-- update table_name set col1=val1, col2=val2
-- option: add where clause at the end to specify conditions
-- change Sam's age to 42 (it was 45)
update employee set e_age = 42 where e_name = 'Sam';

select * from employee;

-- change department of Female employees from "Analytics" to "Tech"
update employee set e_dept = 'Tech' where e_gender = 'Female';

select * from employee;

-- change all salaries to be equal
update employee set e_salary = 50000;

select * from employee;


-- DELETE statement
-- used to delete excisting records in a table
-- syntax:
-- delete from table_name (where -> optional)
-- delete the employee who is 33 years old
delete from employee where e_age = 33;

select * from employee;

-- delete employee whose name is Sam
delete from employee where e_name = 'Sam';

select * from employee;

-- TRUNCATE statement
-- deletes all the data inside the table
-- syntax:
-- truncate table table_name
truncate table employee;

select * from employee;





