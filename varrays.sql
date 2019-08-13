/*
DECLARE 
   type namesarray IS VARRAY(5) OF VARCHAR2(10); 
   type grades IS VARRAY(5) OF INTEGER; 
   names namesarray; 
   marks grades; 
   total integer; 
BEGIN 
   names := namesarray('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz'); 
   marks:= grades(98, 97, 78, 87, 92); 
   total := names.count; 
   dbms_output.put_line('Total '|| total || ' Students'); 
   FOR i in 1 .. total LOOP 
      dbms_output.put_line('Student: ' || names(i) || ' 
      Marks: ' || marks(i)); 
   END LOOP; 
END; 
/

*/
--displaying array values
/*
declare cursor c1 is select * from dept_desg;
begin
for x in c1
loop
dbms_output.put_line('department:' || x.d_name);
for i in 1..x.desg.count
loop
dbms_output.put_line(x.desg(i).desg_name);
end loop;
end loop;
end;
*/
--updating array values
/*
declare 
desigs desg_va := desg_va(desg_ty('Manager'),desg_ty('Ast. Manager'),desg_ty('Sr. mngr'),desg_ty('jr. Mngr'),
desg_ty('trainee'));
begin
update dept_desg 
set desg = desigs where d_name = 'Production';
end;
*/

--NESTED TABLES

--CREATING NESTED TABLES
/*
CREATE TYPE emp1_ty AS OBJECT
(EMP_NUM NUMBER(4),
EMP_NAME VARCHAR2(30));
*/
--CREATE TYPE EMP_NT AS TABLE OF emp1_ty;
/*
CREATE TABLE DEPTS 
(DEPT_NO NUMBER(2),D_NAME VARCHAR2(15),EMPS EMP_NT)
NESTED TABLE EMPS STORE as EMPS_NT_TAB;
*/
--INSERTING INTO NESTED TABLE

--INSERT INTO DEPTS VALUES(10,'RESEARCH',EMP_NT(emp1_ty(1000,'Arhun'),emp1_ty(1001,'Arjun'),emp1_ty(1002,'Arkun')));

/* --QUERYING NESTED TABLE WE ARE SUPPOSED TO USE THE CLAUSE

SELECT NT.EMP_NUM,NT.EMP_NAME FROM THE (SELECT EMPS FROM DEPTS) NT;

*/
SELECT * FROM THE(SELECT EMPS FROM DEPTS WHERE DEPT_NO = 10) NT;
