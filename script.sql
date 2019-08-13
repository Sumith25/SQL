--select * from employees;

/*select employee_id,city,department_name
from employees e
join departments d
on d.department_id = e.department_id
join location l
on d.location_id = l.location_id;*/

/*select e.last_name,e.department_id,d.department_name
from employees e full outer join departments d
on (e.department_id = d.department_id);*/

/*select employee_id,last_name,d.department_id,d.department_name,d.manager_id from employees e full outer 
join departments d on e.department_id = d.department_id;*/

--select last_name,salary from employees where salary>(select salary from employees where last_name = 'Abel');


select * from employees where salary = (select max(salary) from employees);