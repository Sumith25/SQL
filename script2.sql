/*
declare v_date timestamp(9) := systimestamp;
begin
dbms_output.put_line(v_date);
end; 
*/

--select * from employees;
/*
declare 
v_date timestamp(2) with time zone := systimestamp;
begin 
dbms_output.put_line('Display Time with Timezone');
dbms_output.put_line('The System Date and Time is :' || v_date);
end;
*/

/* 
declare 
v_date timestamp(9) with local time zone := systimestamp;
begin 
dbms_output.put_line(v_date);
end;
*/

/*
declare 
var_salary number(6);
var_emp_id number(6) := 110;
begin
select salary
into var_salary
from employees
where employee_id = var_emp_id;
dbms_output.put_line(var_salary);
dbms_output.put_line('The employee ' || var_emp_id || ' has salary ' || var_salary);
end;
*/
/*
declare 
var1 number(4):=&a;
var2 number(4):=&b;
var3 number(4);
begin
var3 := var1+var2;
dbms_output.put_line('The sum is ' || var3);
end;
*/

declare 
var1 number(2) := &a;
var2 number(2) := &b;
var3 number(2) := &c;

begin 

if var1>var2 and var1>var3 then 
begin 
dbms_output.put_line('The max is ' || var1);
endif;

elsif var2>var1 and var2>var3 then
begin
dbms_output.put_line('The max is ' || var2);
endif;

elsif var3>var1 and var3>var2 then
begin
dbms_output.put_line('The max is ' || var3);
endif;

end;





 
