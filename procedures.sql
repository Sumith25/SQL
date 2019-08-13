--procedure 1
/*
create or replace procedure raise_salary
(id in employees.employee_id%type , percent in number)
is begin 
update employees set salary = salary * (1 + percent/100) where employee_id = id;
end raise_salary;
*/
/*
create or replace procedure emp_job (id in employees.employee_id%type)
is 
j_id varchar2(10);
begin
select job_id into j_id from employees where employee_id = id ;
dbms_output.put_line(id || ' is working as ' || j_id);
end emp_job;
*/

/*
create or replace procedure query_emp
(id in employees.employee_id%type,
name out employees.last_name%type,
salary out employees.salary%type) is 
begin 
select last_name,salary into name , salary from employees
where employee_id = id;
end query_emp;
*/
/*
create or replace procedure format_phone
(phone in out varchar2) is
begin 
phone := '(' || substr(phone,1,3) || ')' || substr(phone,4,3) || '-' || substr(phone,7);
end format_phone;
*/

/*

create or replace procedure add_dept
(name in departments.department_name%type := 'Unknown',
loc in departments.location_id%type default 1700) is 
begin 
insert into departments (department_id,department_name,location_id) values (department_seq.NEXTVAL,name,loc);
end add_dept;
*/
/*
create or replace function get_sal
(id employees.employee_id%type) return number is 
sal employees.salary%type := 0;
begin
select salary into sal from employees where employee_id = id;
return sal;
end get_sal;
/
*/
--github code to calculate tax
/*
CREATE OR REPLACE FUNCTION tax(value IN NUMBER)
 RETURN NUMBER IS
BEGIN
   RETURN (value * 0.08);
END tax;
/
SELECT employee_id, last_name, salary, tax(salary)
FROM   employees
WHERE  department_id = 100;
*/