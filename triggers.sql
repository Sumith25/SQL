/*
create or replace trigger secure_emp
before insert on employees 
begin
if (to_char(sysdate,'DY') in ('sat','sun')) or (to_char(sysdate,'HH24:MI') not between '8:00' and '15:00') 
then raise_application_error(-2500,'you may insert into employees table only during buisness hours.');
end if;
end;
*/
/*
CREATE OR REPLACE TRIGGER secure_emp1 BEFORE
INSERT OR UPDATE OR DELETE ON employees BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
   (TO_CHAR(SYSDATE,'HH24') 
       NOT BETWEEN '08' AND '15') THEN
   IF DELETING THEN RAISE_APPLICATION_ERROR(
    -20502,'You may delete from EMPLOYEES table'||
           'only during business hours.');
   ELSIF INSERTING THEN RAISE_APPLICATION_ERROR(
    -20500,'You may insert into EMPLOYEES table'|| 
           'only during business hours.');
   ELSIF UPDATING('SALARY') THEN
    RAISE_APPLICATION_ERROR(-20503, 'You may '|| 'update SALARY only during business hours.');
   ELSE RAISE_APPLICATION_ERROR(-20504,'You may'||
     ' update EMPLOYEES table only during'||
     ' normal hours.');
   END IF;
 END IF;
END;
*/

CREATE OR REPLACE TRIGGER Print_salary_changes
  BEFORE DELETE OR INSERT OR UPDATE ON employees
  FOR EACH ROW
WHEN (new.employee_id > 0)
DECLARE
    sal_diff number;
BEGIN
    sal_diff  := :new.salary  - :old.salary;
    dbms_output.put('Old salary: ' || :old.salary);
    dbms_output.put('  New salary: ' || :new.salary);
    dbms_output.put_line('  Difference ' || sal_diff);
END;
