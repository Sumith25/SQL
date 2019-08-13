/*create table employees
(
employee_id number(6) constraint emp_employee_id primary key,
first_name varchar2(20),
last_name varchar2(20),
email varchar2(25) constraint emp_email_nn not null constraint emp_email_uk unique,
phone varchar2(10),
hire_date date constraint emp_hire_date_nn not null,
job_id varchar2(10) constraint emp_job_nn not null,
salary number(8,3) constraint emp_salary_ck check(salary>1000),
commission_pct number(2,2),
manager_id number(6) constraint emp_manager_fk references employees (employee_id),
department_id number(4) constraint emp_dept_fk references dept (dept_no)
);*/
insert into employees values(001,'Sumith','Rajpoot','aduag@fad.com','465646336',sysdate,'1730','91000',0,NULL,001);

/*create table people 
(
person_id integer not null primary key,
given_name varchar2(100) not null,
family_name varchar2(100) not null,
title varchar2(20),
birth_date date
);*/