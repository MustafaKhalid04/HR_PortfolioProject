SELECT * FROM HR_Portfolio_Project.employee_attrition;

-- Now checking how many employees satisfy the above conditions
SELECT COUNT(*) 
From HR_Portfolio_Project.employee_attrition;

-- Write a query to find the details of employees under Employee attrition having 5+ years of experience inbetween the age of 27-35

SELECT * 
From HR_Portfolio_Project.employee_attrition
WHERE age between 27 and 35
and TotalWorkingYears >= 5;

-- Now checking how many employees satisfy the above conditions
SELECT COUNT(*) 
From HR_Portfolio_Project.employee_attrition
WHERE age between 27 and 35
and TotalWorkingYears >= 5;

-- Write a query to find the details of employees having maximum and minimum salary and working in different departments, who recieved less than 13% salary hike

SELECT Department,
Max(MonthlyIncome),
Min(MonthlyIncome)
From HR_Portfolio_Project.employee_attrition
WHERE PercentSalaryHike < 13
GROUP BY Department;


-- Calculate the average montly income of all employees who have more than 3 years experience with an educational background in medical

SELECT Avg(MonthlyIncome)
From HR_Portfolio_Project.employee_attrition
WHERE YearsAtCompany > 3 and EducationField = 'Medical';


-- Identify the number of male and female employees, who are married but havn't received promotion in the last 2 years

SELECT Gender, COUNT(EmployeeNumber)
From HR_Portfolio_Project.employee_attrition
WHERE MaritalStatus = 'Married' and YearsSinceLastPromotion =2 and Attrition ='Yes'
GROUP BY Gender;


-- Find out the number of employees with max performance rating but no promotion for 4 years and above

SELECT *
From HR_Portfolio_Project.employee_attrition
WHERE PerformanceRating = (SELECT MAX(PerformanceRating))
AND YearsSinceLastPromotion >=4;


-- Find out who has maximum and minimum percentage of Salary hike, how many years at the company and their performance rating

SELECT YearsAtCompany, PerformanceRating, YearsSinceLastPromotion,
Max(PercentSalaryHike),
Min(PercentSalaryHike)
From HR_Portfolio_Project.employee_attrition
GROUP BY YearsAtCompany, PerformanceRating, YearsSinceLastPromotion
ORDER BY max(PercentSalaryHike) desc, min(PercentSalaryHike) asc;


-- Find out employees working overtime but giving minimum percentage of Salary hike, more than 5 years experience with the company
-- (Gives an insight how many people are leaving, being with the company for 5 years or more but not getting nice increament)

SELECT *
From HR_Portfolio_Project.employee_attrition
WHERE Overtime = 'Yes'
AND PercentSalaryHike = (SELECT min(PercentSalaryHike) FROM HR_Portfolio_Project.employee_attrition)
AND YearsAtCompany > 5
AND Attrition = 'YES';



-- Find out employees working overtime and given Max percentage of Salary hike, less than 5 years experience with the company

SELECT *
From HR_Portfolio_Project.employee_attrition
WHERE Overtime = 'Yes'
AND PercentSalaryHike = (SELECT max(PercentSalaryHike) FROM HR_Portfolio_Project.employee_attrition)
AND YearsAtCompany < 5;

-- Find out employees who have not done overtime and given Max percentage of Salary hike, less than 5 years experience with the company

SELECT *
From HR_Portfolio_Project.employee_attrition
WHERE Overtime = 'no'
AND PercentSalaryHike = (SELECT max(PercentSalaryHike) FROM HR_Portfolio_Project.employee_attrition)
AND YearsAtCompany < 5;

