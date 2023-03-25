


SELECT employeeID, first_name, last_name, base_salary * round(datediff(current_date(),from_date)/365 * 1.04) as current_salary from employee
    join role on employee.roleID = role.roleID
    ORDER by current_salary;
    
SELECT employeeID, first_name, last_name, round(datediff(current_date(),from_date)/365) as years_worked from employee
    ORDER by years_worked;
   
SELECT COUNT(employeeID), title from employee
    join role on employee.roleID = role.roleID
    GROUP BY title;
    
SELECT sum(base_salary * round(datediff(current_date(),from_date)/365 * 1.04)) from employee
    join role on employee.roleID = role.roleID;