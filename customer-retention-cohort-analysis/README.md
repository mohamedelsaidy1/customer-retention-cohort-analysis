# 📊 Customer Retention & Cohort Analysis  
**Online Retail Dataset**

## 📌 Project Overview
This project analyzes **customer purchasing behavior** for an online retail business using **cohort analysis** to measure customer retention, identify repeat purchase patterns, and understand long-term customer value trends.

The analysis focuses on how customer retention evolves over time after the first purchase and highlights critical drop-off points that impact business growth.

---

## 🎯 Project Objectives
- Measure **customer retention rate** over time  
- Identify **repeat purchase patterns**  
- Analyze **customer lifetime behavior** using cohorts  
- Provide **business insights** to improve customer engagement and retention  

---

## 🗂️ Dataset
- **Source:** Online Retail Dataset (Kaggle)  
- **Time Period:** 2010 – 2011  
- **Key Columns Used:**
  - `CustomerID`
  - `InvoiceDate`
  - `Quantity`
  - `UnitPrice`
  - Calculated `Revenue`

---

## 🧹 Data Cleaning & Preparation
- Removed records with:
  - Null `CustomerID`
  - Negative or zero `Quantity`
  - Zero or negative `UnitPrice`
- Created:
  - `OrderMonth` (monthly granularity)
  - `Revenue = Quantity × UnitPrice`

---

## 🧠 Cohort Analysis Methodology

### 1️⃣ Cohort Definition
- **CohortMonth:** The month of a customer’s **first purchase**
- Customers are grouped based on their first transaction month

### 2️⃣ Cohort Index
- Measures the number of months since the first purchase  
```
CohortIndex = Months between OrderMonth and CohortMonth
```

### 3️⃣ Retention Metrics
- `CustomersCount`: Number of active customers per cohort and month  
- `RetentionRate`:
```
RetentionRate = Customers in Month N / Customers in Month 0
```

---

## 🛠️ Tools & Technologies
- **SQL Server**
  - CTEs
  - Date functions
  - Aggregations
- **Power BI**
  - Data modeling
  - Matrix visual
  - Conditional formatting (Heatmap)
  - Cohort retention visualization

---

## 📈 Key Insights

### 🔹 Sharp Drop After First Month
Most cohorts start at **100% retention**, followed by a sharp decline in month 1.  
➡️ Indicates strong acquisition but weak post-purchase engagement.

### 🔹 Retention Stabilizes After Month 3
Customers who remain after 2–3 months show more stable behavior.  
➡️ These customers represent **high-value, loyal segments**.

### 🔹 Variation Across Cohorts
Some cohorts outperform others consistently.  
➡️ Suggests seasonality or campaign impact.

### 🔹 Weak Long-Term Retention
Retention drops below **25%** after 6 months for most cohorts.  
➡️ Business is more transaction-focused than relationship-focused.

---

## 📊 Visualization
- **Cohort Retention Heatmap**
  - Rows: CohortMonth
  - Columns: CohortIndex
  - Values: Average Retention Rate
  - Color scale from high (green) to low (red)

---

## 📌 Business Recommendations
- Improve post-purchase communication
- Introduce loyalty programs
- Focus on high-retention cohorts
- Use cohort analysis for strategic decisions

---

## 🚀 Conclusion
Cohort analysis provides deeper insights into customer behavior beyond traditional KPIs, enabling sustainable, data-driven growth decisions.

---

## 👤 Author
**Mohamed Elsaidy**  
Junior Data Analyst | SQL | Excel | Power BI
