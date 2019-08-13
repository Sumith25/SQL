/*
declare 
var1 number(2) := &a;
var2 number(2) := &b;
var3 number(2) := &c;

begin 

if var1>var2 and var1>var3 then 
dbms_output.put_line('The max is ' || var1);

elsif var2>var1 and var2>var3 then
dbms_output.put_line('The max is ' || var2);

elsif var3>var1 and var3>var2 then
dbms_output.put_line('The max is ' || var3);

end if;

end;

*/
/*
select first_name,
( case department_id 
when 10 then 'Accounts'
when 20 then 'Research'
when 30 then 'Sales'
when 40 then 'Operations'
else 'Unassigned'
) as department
from employees;
*/

--for loop
/*
declare ncode number(5);

begin 
for ncode in 111..120
	loop
	insert into employee (emp_code,emp_name) values (ncode,'Somebody' || ncode);
	end loop;
end;
*/

--reverse for loop

/*
declare ncode number(5);

begin 
for ncode in reverse 121..130
	loop
	insert into employee (emp_code,emp_name) values (ncode,'Somebody' || ncode);
	end loop;
end;
*/
-- table datatype
/*
declare 
	nsal employees.salary%type;

begin 
select salary into nsal
from employees where employee_id = 111;
if nsal <8000 then
	update employees set salary = salary+101 where employee_id = 111;
end if;
*/
-- rowtype composite datatype
/*
declare 
nrecord employees%rowtype;

begin 
select * into nrecord
from employees where employee_id = 111;
if nrecord.salary < 8000 then update employees
set salary = salary +101 where employee_id = 111;
end if;
dbms_output.put_line(nrecord.first_name);
end;
*/