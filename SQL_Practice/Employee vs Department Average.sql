--============================================================================================
-- Topic    : Employee vs Department Average
-- Date     : 31/10/2025
--============================================================================================
---─────────────────────────────────────────────-─────────────────────────────────────────────
--Question:
--Table   : employees(emp_id, dept_id, salary)
--Show employees earning more than the average salary of their department, and how much higher they are
---─────────────────────────────────────────────-─────────────────────────────────────────────

--getting the dept average salary
;with dept_avg_salary as
    (select dept_id,avg(salary) avg_salary
    from #employees
    group by dept_id)

--selecting employees earning more than avg dept salary
select e.*,(e.salary-d.avg_salary) AmtHigherThanAverage from #employees e
join dept_avg_salary d on e.dept_id=d.dept_id 
where e.salary>d.avg_salary


/* 
---─────────────────────────────────────────────-─────────────────────────────────────────────
Notes:
---─────────────────────────────────────────────-─────────────────────────────────────────────
•can be implemented using window function
AVG(salary) over (partition by dept_id)
---─────────────────────────────────────────────-─────────────────────────────────────────────
Sample data:
---─────────────────────────────────────────────-─────────────────────────────────────────────

-- Drop table if it already exists
IF OBJECT_ID('tempdb..#employees') IS NOT NULL 
    DROP TABLE #employees;

-- Create sample table
CREATE TABLE #employees (
    emp_id INT,
    dept_id INT,
    salary DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO #employees (emp_id, dept_id, salary)
VALUES
(1, 10, 50000),
(2, 10, 60000),
(3, 10, 55000),
(4, 20, 70000),
(5, 20, 65000),
(6, 30, 40000),
(7, 30, 42000);

*/
