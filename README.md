# 📊 Laptop Data Analysis using SQL

## 🔹 Project Overview
This project focuses on **data cleaning and exploratory data analysis (EDA)** of a laptop dataset using SQL.  
The objective is to transform raw data into a structured format and analyze how different features impact laptop pricing.

---

## 🎯 Problem Statement
The dataset contains:
- Missing values  
- Inconsistent formats (e.g., RAM, Weight)  
- Unstructured columns (CPU, GPU, Memory)  

### ✅ Objectives:
- Clean and preprocess the dataset  
- Perform SQL-based analysis  
- Understand factors affecting laptop prices  

---

## 📁 Dataset Description

| Column | Description |
|--------|------------|
| Company | Laptop brand |
| TypeName | Laptop type |
| Inches | Screen size |
| CPU | Processor details |
| RAM | RAM size |
| Memory | Storage details |
| GPU | Graphics |
| OpSys | Operating system |
| Weight | Laptop weight |
| Price | Price |

---

## 🧹 Data Cleaning & Transformation

- Removed missing and inconsistent values  
- Converted data types (Price, RAM, Weight)  
- Extracted:
  - CPU brand and speed  
  - GPU brand  
- Created new features:
  - `ppi` (Pixels Per Inch)  
  - `screen_size` (small, medium, large)  
  - `memory_type` (SSD, HDD, Hybrid, Flash)  
- Standardized categorical values  

---

## 📊 Exploratory Data Analysis (EDA)

### 🔸 Statistical Analysis
- Count, Min, Max, Average, Standard Deviation  
- Quartile calculation using `NTILE()`

### 🔸 Missing Value Handling
- Identified null values  
- Replaced missing prices with average value  

### 🔸 Feature Engineering
- Calculated PPI using resolution and screen size  
- Categorized screen size  
- Created CPU performance categories  

### 🔸 Analytical Queries
- Company vs Average Price  
- CPU Speed Category vs Price  
- Touchscreen vs Price  
- Correlation between Price and CPU Speed  

---

## 📊 Data Visualizations

### 🏢 Company vs Average Price
![Company vs Price](https://github.com/aditya-241/laptop-sql-data-analysis/blob/main/images/company_avg_price.jpg)

**Insight:**  
Razer has the highest average price, indicating premium positioning in the gaming segment. Brands like LG and MSI also fall into higher price ranges, while Dell and Toshiba are more mid-range focused.

---

### 💻 CPU Brand Distribution
![CPU Distribution](https://github.com/aditya-241/laptop-sql-data-analysis/blob/main/images/cpu_distribution.jpg)

**Insight:**  
Intel overwhelmingly dominates the dataset, accounting for the vast majority of laptops, while AMD has a much smaller share and other brands are nearly negligible.

---

### 📦 Storage Type Distribution
![Storage Distribution](https://github.com/aditya-241/laptop-sql-data-analysis/blob/main/images/storage_distribution.jpg)

**Insight:**  
SSD is the most commonly used storage type, indicating a shift toward faster and more efficient storage solutions, while HDD still maintains a noticeable presence.

---

### 📈 Price vs PPI
![Price vs PPI](https://github.com/aditya-241/laptop-sql-data-analysis/blob/main/images/price_vs_ppi.jpg)

**Insight:**  
There is a positive relationship between PPI and price, indicating that laptops with better display quality tend to be more expensive. However, the spread suggests other factors also influence pricing.

---

### 📊 Price Distribution
![Price Distribution](https://github.com/aditya-241/laptop-sql-data-analysis/blob/main/images/price_distribution.jpg)

**Insight:**  
Most laptops are concentrated in the ₹25K–₹75K range, with the highest number in the ₹25K–₹50K segment. Premium laptops (>₹100K) are less common.

---

## 📌 Key Insights
- Mid-range laptops dominate the market  
- Premium brands have significantly higher pricing  
- Intel processors dominate the laptop market  
- SSD is the preferred storage type  
- Higher display quality (PPI) is associated with higher prices  
- Pricing is influenced by multiple factors beyond a single feature  

---

## 🛠️ Tools & Technologies
- SQL (MySQL)  
- Excel (for visualization)  
- Git & GitHub  

---
