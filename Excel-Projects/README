# 🏦 Banking Analytics Project – SQL, Power BI & Tableau

An end-to-end **Banking Data Analysis** project completed as part of a Data Analyst internship. It analyses loan portfolio performance, client behaviour, repayment trends, risk exposure, and credit/debit transaction activity using **MySQL, Power BI, Tableau, and Excel**.

---

## 📁 Repository Structure

```
├── Bank_Analyst_P1379_-2.xlsx      # Cleaned/raw banking dataset (Excel)
├── Banking_Data_SQL.sql            # SQL queries for all KPIs
├── bank_analyst_1379.pbix          # Power BI dashboard
├── Banking_Dashbord_tableau.twbx   # Tableau dashboard (packaged workbook)
└── README.md
```

---

## 🎯 Project Objectives

- Track **client growth, retention and activity**
- Measure **loan disbursement, funding and loan growth**
- Monitor **repayment performance and interest income**
- Identify **default and delinquency risk** by age, state, purpose and grade
- Compare **branch and product performance**
- Analyse **credit vs. debit transaction behaviour**

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **MySQL** | Data querying and KPI calculation |
| **Power BI** | Interactive dashboard and DAX measures |
| **Tableau** | Visual dashboard and storytelling |
| **Excel** | Data source, cleaning and validation |

---

## 🗂️ Datasets

1. **`banking_data`** – Loan-level data (Client ID, Account ID, Loan Amount, Funded Amount, Disbursement Date, Loan Status, Grade, Interest Rate, Credit Score, Branch, State, Purpose, Default/Delinquent flags, Repayment Behavior, etc.)
2. **`debit_and_credit banking_data`** – Transaction-level data (Account Number, Transaction Type, Amount, Balance, Transaction Date, Branch, Bank Name)

---

## 📊 KPIs & SQL Analysis

### 1️⃣ Client Metrics
- Total Clients
- Active Clients
- New Clients (month-wise, based on first disbursement)
- Client Retention Rate (clients with more than one loan)

### 2️⃣ Loan Metrics
- Total Loan Amount Disbursed
- Total Funded Amount
- Average Loan Size
- Loan Growth % (month-over-month using `LAG()` window function)

### 3️⃣ Repayment & Revenue
- Total Repayments Collected
- Principal Recovery Rate
- Total Interest Income
- On-Time Repayment %

### 4️⃣ Risk Metrics
- Default Rate
- Delinquency Rate
- Age-wise Risk Analysis
- Geographical (State-wise) Risk Profile
- Loan Purpose Analysis
- Grade vs. Risk Pricing (credit score, interest rate, default rate)

### 5️⃣ Branch & Product Performance
- Loan Distribution by Branch
- Branch Performance Category Split
- Product-wise Loan Volume
- Product Profitability (interest income)

### 6️⃣ Credit & Debit Transactions
- Total Credit Amount / Total Debit Amount
- Credit-to-Debit Ratio
- Net Transaction Amount
- Account Activity Ratio
- Monthly Transaction Count
- Transaction Amount by Branch
- Transaction Volume by Bank

---

## 💡 SQL Concepts Used

- Aggregate functions: `SUM`, `COUNT`, `AVG`, `MIN`
- Conditional aggregation with `CASE WHEN`
- CTEs (`WITH`)
- Window functions (`LAG() OVER`)
- Date functions: `STR_TO_DATE`, `DATE_FORMAT`
- `GROUP BY`, `ORDER BY`, `DISTINCT`

---

## 📈 Dashboards

### Power BI (`bank_analyst_1379.pbix`)
Interactive dashboard with KPI cards, trend charts, branch/product comparisons, and risk analysis visuals with slicers.

### Tableau (`Banking_Dashbord_tableau.twbx`)
Visual dashboard presenting loan performance, risk distribution and transaction insights.

> 📸 *Add dashboard screenshots here:*
> `![Power BI Dashboard](images/powerbi_dashboard.png)`
> `![Tableau Dashboard](images/tableau_dashboard.png)`

---

## 🔍 Key Insights

> *Replace with your actual findings from the dashboards, for example:*
- Which branches and states contribute the highest loan volume
- Which loan grades and purposes show the highest default rates
- Client retention percentage and on-time repayment trends
- Credit-to-debit ratio and net cash flow position

---

## ▶️ How to Use

1. Import the Excel data into MySQL as tables `banking_data` and `debit_and_credit banking_data`.
2. Run `Banking_Data_SQL.sql` to get all KPI results.
3. Open `bank_analyst_1379.pbix` in **Power BI Desktop**.
4. Open `Banking_Dashbord_tableau.twbx` in **Tableau Desktop** or Tableau Public.

---

## 👤 Author

Abhishek Patil
Data Analyst Intern
🔗 [LinkedIn]:https://www.linkedin.com/in/abhishek-patil2000 | 📧 abhishekpatil7275@gmail.com

---

⭐ If you found this project useful, please star the repository!
