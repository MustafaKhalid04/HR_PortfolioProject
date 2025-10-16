# 🧑‍💼 HR Portfolio Project — Employee Attrition Analysis using SQL & Tableau

## 📊 Project Overview
This HR analytics project focuses on understanding **employee attrition, performance, salary hikes, and work-life patterns** using structured SQL queries and interactive Tableau visualizations.

The primary goal is to help HR teams identify trends behind attrition, improve employee retention, and create data-driven policies for compensation, promotions, and workload balance.

---

## 🗂️ Dataset Information
**Dataset Name:** `employee_attrition`  
**Database Schema:** `HR_Portfolio_Project`

**Key Columns:**
- `EmployeeNumber`, `EmployeeName`
- `Age`, `Gender`, `MaritalStatus`
- `Department`, `EducationField`
- `TotalWorkingYears`, `YearsAtCompany`, `YearsSinceLastPromotion`
- `MonthlyIncome`, `PercentSalaryHike`
- `OverTime`, `PerformanceRating`, `Attrition`

**Data Source:** HR Analytics dataset (similar to IBM HR dataset)

---

## 🧠 Objectives
1. Identify employees most likely to leave the organization.
2. Analyze salary hikes, promotions, and overtime correlation with attrition.
3. Evaluate performance vs. reward fairness across departments.
4. Provide actionable insights through Tableau visual dashboards.

---

## 🧩 Step 1: SQL Exploration & Analysis

All queries were executed in the schema `HR_Portfolio_Project`.

### 🔹 1. View the dataset
```sql
SELECT * FROM HR_Portfolio_Project.employee_attrition;

🔹 2. Count total employees
SELECT COUNT(*) FROM HR_Portfolio_Project.employee_attrition;

Purpose: Check dataset size — total employees in the organization.

.

🔹 3. Mid-career employees (Age 27–35, ≥5 years experience)
SELECT *
FROM HR_Portfolio_Project.employee_attrition
WHERE age BETWEEN 27 AND 35
  AND TotalWorkingYears >= 5;


Insight: Identifies experienced professionals in their prime career phase — critical for retention.

🔹 4. Salary range (min/max) by department for <13% hike
SELECT Department,
       MAX(MonthlyIncome),
       MIN(MonthlyIncome)
FROM HR_Portfolio_Project.employee_attrition
WHERE PercentSalaryHike < 13
GROUP BY Department;


Insight: Highlights departments where salary increments are minimal — potential dissatisfaction zones.

🔹 5. Average income (Medical field, >3 years at company)
SELECT AVG(MonthlyIncome)
FROM HR_Portfolio_Project.employee_attrition
WHERE YearsAtCompany > 3
  AND EducationField = 'Medical';


Insight: Checks compensation fairness across education backgrounds.

🔹 6. Married employees not promoted in last 2 years
SELECT Gender, COUNT(EmployeeNumber)
FROM HR_Portfolio_Project.employee_attrition
WHERE MaritalStatus = 'Married'
  AND YearsSinceLastPromotion = 2
  AND Attrition = 'Yes'
GROUP BY Gender;


Insight: Reveals potential link between promotion delay and attrition among married employees.

🔹 7. High performers without promotion (≥4 years)
SELECT *
FROM HR_Portfolio_Project.employee_attrition
WHERE PerformanceRating = (SELECT MAX(PerformanceRating))
  AND YearsSinceLastPromotion >= 4;


Insight: Identifies under-recognized top performers — high retention risk.

🔹 8. Max & Min % Salary Hike by Tenure and Performance
SELECT YearsAtCompany, PerformanceRating, YearsSinceLastPromotion,
       MAX(PercentSalaryHike), MIN(PercentSalaryHike)
FROM HR_Portfolio_Project.employee_attrition
GROUP BY YearsAtCompany, PerformanceRating, YearsSinceLastPromotion
ORDER BY MAX(PercentSalaryHike) DESC, MIN(PercentSalaryHike) ASC;


Insight: Compares reward structure across different experience and performance groups.

🔹 9. Overtime workers (min hike, >5 years, left company)
SELECT *
FROM HR_Portfolio_Project.employee_attrition
WHERE Overtime = 'Yes'
  AND PercentSalaryHike = (SELECT MIN(PercentSalaryHike) FROM HR_Portfolio_Project.employee_attrition)
  AND YearsAtCompany > 5
  AND Attrition = 'Yes';


Insight: Long-serving employees with overtime but minimal raises — key indicator of burnout-driven attrition.

🔹 10. Overtime workers (max hike, <5 years)
SELECT *
FROM HR_Portfolio_Project.employee_attrition
WHERE Overtime = 'Yes'
  AND PercentSalaryHike = (SELECT MAX(PercentSalaryHike) FROM HR_Portfolio_Project.employee_attrition)
  AND YearsAtCompany < 5;


Insight: Early-career employees rewarded well — indicates strong performance or strategic retention.

🔹 11. Non-overtime employees (max hike, <5 years)
SELECT *
FROM HR_Portfolio_Project.employee_attrition
WHERE Overtime = 'No'
  AND PercentSalaryHike = (SELECT MAX(PercentSalaryHike) FROM HR_Portfolio_Project.employee_attrition)
  AND YearsAtCompany < 5;


Insight: Reveals whether overtime affects pay growth or if raises are merit-based.

🧮 Step 2: Data Cleaning Summary

Removed duplicates and missing values.

Standardized categorical values (Yes/No, Male/Female, etc.).

Converted numeric columns (MonthlyIncome, PercentSalaryHike, YearsAtCompany) to appropriate data types.

Created calculated columns for Tableau:

AttritionFlag → 1 if Attrition = 'Yes', else 0.

AgeGroup → Binned into categories (e.g., 18–25, 26–35, etc.).

TenureGroup → Grouped by years of service.

📈 Step 3: Tableau Dashboard Development
✅ Visuals Created:

KPIs: Total Employees, Attrition Count, Attrition Rate, Average Age, Average Salary

Attrition by Gender – Bar chart showing gender-wise attrition rate

Attrition by Department – Departmental attrition and headcount distribution

Age Group vs Attrition – Age-based attrition trends

Job Satisfaction & Attrition – Heatmap for satisfaction vs attrition

Education Field vs Attrition – Compare attrition across education backgrounds

Salary Analysis – Box plots of monthly income by department

Promotion Delay vs Performance – Identify top performers without promotions

Overtime & Salary Hike Correlation – Explore workload vs compensation trend

🎨 Dashboard Features:

Interactive filters: Department, Gender, Age Group, Attrition Status

Highlight actions & tooltips for employee details

Clean layout with KPI cards on top and insights below

Published on Tableau Public (optional: link your Tableau dashboard here)

🧾 Key Insights

Promotion delays strongly correlate with attrition among top performers.

Departments with <13% hikes have higher turnover risk.

Overtime + low salary hike combination is a key burnout signal.

Younger employees (<35) form the largest attrition group — focus retention efforts here.

🛠️ Tools & Technologies
Tool	Purpose
SQL (MySQL / Postgres)	Data extraction, cleaning, and analysis
Tableau	Visualization and dashboard creation
Excel / CSV	Data preprocessing and export
GitHub	Project documentation and portfolio hosting
📂 Folder Structure
HR-Portfolio-Attrition/
├── data/
│   ├── HR_Data.csv
│   ├── hr_data_clean.csv
├── sql/
│   ├── queries.sql
│   ├── analysis_queries.sql
├── tableau/
│   └── HR_Attrition_Dashboard.twbx
├── images/
│   └── dashboard_preview.png
├── README.md

📤 How to Reproduce

Import dataset into your SQL environment.

Run the SQL queries in sql/ folder sequentially.

Export query results as .csv files.

Load them into Tableau for dashboard creation.

Publish final dashboard on Tableau Public and link it here.

📎 References

IBM HR Analytics Dataset (for structure reference)

Tableau Public Gallery — HR Analytics Dashboards

🏁 Conclusion

This project demonstrates how SQL and Tableau together can deliver actionable HR insights.
From understanding employee satisfaction to pinpointing attrition drivers, this analysis helps organizations design smarter, evidence-based retention strategies.
