


CREATE sql security invoker view `employees sorted by pay` as
SELECT employeeID, first_name, last_name, 
    base_salary * round(datediff(current_date(),from_date)/365 * 1.04) 
    as current_salary from employee
        join role on employee.roleID = role.roleID
        ORDER by current_salary;

CREATE sql security invoker view `employees sorted by number of years worked` as
SELECT employeeID, first_name, last_name, 
    round(datediff(current_date(),from_date)/365) 
    as years_worked from employee
        ORDER by years_worked;

CREATE sql security invoker view `employee numbers for each role` as
SELECT COUNT(employeeID), title from employee
    join role on employee.roleID = role.roleID
    GROUP BY title;
   
CREATE sql security invoker view `total payroll` as
SELECT sum(base_salary * round(datediff(current_date(),from_date)/365 * 1.04)) 
    from employee
        join role on employee.roleID = role.roleID;