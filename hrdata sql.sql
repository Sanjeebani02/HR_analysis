1. Employee count-
select sum(employee_count) as EMP_count from hrdata;
/*where department='Sales';*/
/*where education_field='Medical';*/

2. Attrition count-
select (sum(employee_count)-sum(active_employee)) as attrition_count from hrdata;
/*where education_field='Marketing';*/


3. Attrition Rate-
select ((select count(attrition) from hrdata where attrition='Yes')/sum(employee_count))*100 as attrition_rate from hrdata;

4. Active Employees-
select count(active_employee) as Active_employees  from hrdata where active_employee=1 and education_field='Medical';

5.Average age-
select round(avg(age)) as Avg_age from hrdata;

6. Attrition by Gender-
select gender, count(attrition) from hrdata as Attrition_by_gender where attrition='Yes'
group by gender
order by count(attrition)  desc;

7. Department wise Attrition-
select department, count(attrition),
round((count(attrition)/(select count(attrition) from hrdata where attrition='Yes'))*100, 2)
from hrdata as Department_wise_Attrition where attrition='Yes'
group by department;

8. Number of employees by age group-
select age_band, sum(employee_count) from hrdata
group by age_band;


9. Education field wise Attrition-
select education_field, count(attrition) from hrdata where attrition='Yes'
group by education_field; 

10. Attrition rate by gender for different age groups-
select age_band,gender, count(attrition), 
round((count(attrition)/(select count(attrition) from hrdata where attrition='Yes'))*100, 2) 
from hrdata where attrition='Yes'
group by age_band,gender
order by age_band,gender; 


