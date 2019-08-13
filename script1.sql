--begin
--	update employees set salary = salary+111 where department_id = &deptval;
--end;
--declare nsal number(6);
--begin
--select salary into nsal from employees where employee_id = 208;
--if nsal<8000 then
--update employees set salary = salary + 101 where employee_id = 208;
--end if;
--end; 



declare v_date timestamp(9) := systimestamp;
begin
dbms_output.put_line(v_date);
end;