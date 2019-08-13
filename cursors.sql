--implicit cursor
/*
begin
update employees set salary = salary + 100
where department_id= 700;
dbms_output.put_line(SQL%ROWCOUNT || 'rows updated');
if SQL%NOTFOUND
then
dbms_output.put_line ('Unable to update department with id = 700');
end if;
end;
*/
/*
DECLARE
  CURSOR emp_cursor IS 
   SELECT employee_id, last_name FROM employees
   WHERE  department_id =50;
  empno employees.employee_id%TYPE;
  lname employees.last_name%TYPE;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO empno, lname;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( empno ||' '||lname);    
  END LOOP;
  CLOSE emp_cursor;
END;
/
 */
/*
--for loop cursors
SET SERVEROUTPUT ON
DECLARE
  CURSOR emp_cursor IS 
   SELECT employee_id, last_name , department_id FROM employees
   WHERE department_id =30; 
BEGIN
   FOR emp_record IN emp_cursor 
    LOOP
     DBMS_OUTPUT.PUT_LINE( emp_record.employee_id     ||' ' ||emp_record.last_name || ' ' || emp_record.department_id);   
    END LOOP; 
END;
/
*/
/*
DECLARE
  empno	employees.employee_id%TYPE;
  ename	employees.last_name%TYPE;
  CURSOR emp_cursor IS SELECT employee_id, 
  last_name FROM employees order by empno;
BEGIN
  OPEN emp_cursor;
  LOOP
   FETCH emp_cursor INTO empno, ename;
   EXIT WHEN emp_cursor%ROWCOUNT > 10 OR  
                   emp_cursor%NOTFOUND;        
   DBMS_OUTPUT.PUT_LINE(TO_CHAR(empno) 
                       ||' '|| ename);
  END LOOP;
  CLOSE emp_cursor;
END ;
/
*/
--parametrized cursor
/*
declare
CURSOR employee_cur(dept_desc varchar2)
IS
SELECT first_name,salary,department_id FROM employees
WHERE department_id= dept_desc;
emp_rec employee_cur%rowtype;
begin
open employee_cur(&dept_desc);
fetch employee_cur into emp_rec;
DBMS_OUTPUT.PUT_LINE(emp_rec.first_name|| ' ' ||emp_rec.salary|| ' ' ||emp_rec.department_id);
end;
*/

--exception handling 
/*
declare 
lname varchar2(15);
begin 
select last_name into lname from employees where first_name = 'John';
dbms_output.put_line('John''s last names is :' || lname);
/*
exception 
when too_many_rows then 
dbms_output.put_line(' your select statement retreived multiple rows. consider using a cursors.');
*/
end;
*/
/*
DECLARE
 insert_excep EXCEPTION;
 PRAGMA EXCEPTION_INIT    (insert_excep, -01400);
BEGIN
 INSERT INTO departments  (department_id, department_name) VALUES (280, NULL);
EXCEPTION
 WHEN insert_excep THEN
 DBMS_OUTPUT.PUT_LINE('INSERT OPERATION FAILED');
 DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
*/

-- user defined exceptions
/*
declare
name varchar2(30);
begin
SELECT first_name into name FROM employees WHERE employee_id = &emp_code;
dbms_output.put_line(name);
exception
when no_data_found then
dbms_output.put_line ('Such employee does not exists');
when others then
dbms_output.put_line (SQLERRM || ' '||SQLCODE);
dbms_output.put_line ('Some other error');
end;
*/
--user defined exception2
/*
declare
current_sal number;
emp_id number;
sal_null exception;
begin
emp_id:=&empno;
SELECT salary into current_sal FROM employees
WHERE employee_id=emp_id;
if current_sal is null then
raise sal_null;
else
update employees set salary = current_sal+1000
WHERE employee_id = emp_id;
end if;
exception
when sal_null then
dbms_output.put_line('Salary is missing');
end;

*/
/*
declare 
a number;
b number;
c number;
dzero exception;
begin 
a:=&a;
b:=&b;
if b=0 then 
raise dzero;
else
c:=a/b;
dbms_output.put_line('Result = ' || c);
end if;
exception 
when dzero then 
dbms_output.put_line('Divide by zero error');
end;
*/

-- divide by zero 2
/*
DECLARE
   stock_price NUMBER := 9.73;
   net_earnings NUMBER := 0;
   pe_ratio NUMBER;
BEGIN
-- Calculation might cause division-by-zero error.
   pe_ratio := stock_price / net_earnings;
   dbms_output.put_line('Price/earnings ratio = ' || pe_ratio);

EXCEPTION  -- exception handlers begin

-- Only one of the WHEN blocks is executed.

   WHEN ZERO_DIVIDE THEN  -- handles 'division by zero' error
      dbms_output.put_line('Company must have had zero earnings.');
      pe_ratio := null;

   WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Some other kind of error occurred.');
      pe_ratio := null;

END;  -- exception handlers and block end here
/
*/