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
