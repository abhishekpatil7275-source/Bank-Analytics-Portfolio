/* Bank Data */

/* 1 Total Clients */
SELECT COUNT(DISTINCT `Client id`) AS total_clients
FROM banking_data;

/* 2 Active Clients */
SELECT COUNT(DISTINCT `Client id`) AS active_clients 
FROM banking_data 
WHERE `Loan Status` = 'Active';

/* 3 New Clients */
WITH FirstDisbursement AS (
    SELECT `Client id`, MIN(STR_TO_DATE(`Disbursement Date`, '%Y-%m-%d %H:%i:%s')) AS first_date
    FROM banking_data
    GROUP BY `Client id`
)
SELECT DATE_FORMAT(first_date, '%Y-%m') AS month_year, COUNT(`Client id`) AS new_clients
FROM FirstDisbursement
GROUP BY month_year;

/* 4 Client Retention Rate */
WITH ClientLoanCounts AS (
    SELECT `Client id`, COUNT(`Account ID`) AS total_loans
    FROM banking_data
    GROUP BY `Client id`
)
SELECT 
    ROUND((COUNT(CASE WHEN total_loans > 1 THEN 1 END) * 100.0 / COUNT(*)), 1) AS retention_rate_pct
FROM ClientLoanCounts;

/* 5 Total Loan Amount Disbursed */
SELECT SUM(`Loan Amount`) AS total_disbursed_amount 
FROM banking_data;

/* 6 Total Funded Amount */
SELECT SUM(`Funded Amount`) AS total_funded_amount 
FROM banking_data;

/* 7 Average Loan Size */
SELECT ROUND(AVG(`Loan Amount`), 2) AS avg_loan_size 
FROM banking_data; 

/* 8 Loan Growth % */
WITH MonthlyLoans AS (
    SELECT 
        DATE_FORMAT(STR_TO_DATE(`Disbursement Date`, '%Y-%m-%d %H:%i:%s'), '%Y-%m') AS month_year,
        SUM(`Loan Amount`) AS current_period_amount
    FROM banking_data
    GROUP BY month_year
)
SELECT 
    month_year,
    current_period_amount,
    LAG(current_period_amount, 1) OVER (ORDER BY month_year) AS previous_period_amount,
    ROUND(((current_period_amount - LAG(current_period_amount, 1) OVER (ORDER BY month_year)) / LAG(current_period_amount, 1) OVER (ORDER BY month_year)) * 100, 2) AS loan_growth_pct
FROM MonthlyLoans;


/* 9 Total Repayments Collected */
SELECT SUM(`Total Pymnt`) AS total_repayments_collected 
FROM banking_data;

/* 10 Principal Recovery Rate */
SELECT ROUND((SUM(`Total Rec Prncp`) / SUM(`Loan Amount`)) * 100, 2) AS principal_recovery_rate_pct 
FROM banking_data;

/* 11 Interest Income */
SELECT ROUND(SUM(`Total Rrec int`), 2) AS total_interest_income 
FROM banking_data;

/* 12 Default Rate */
SELECT ROUND((SUM(CASE WHEN `Is Default Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS default_rate_pct 
FROM banking_data;

/* 13 Delinquency Rate */
SELECT ROUND((SUM(CASE WHEN `Is Delinquent Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS delinquency_rate_pct 
FROM banking_data;

/* 14 On-Time Repayment % */
SELECT ROUND((SUM(CASE WHEN `Repayment Behavior` = 'On-Time' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS on_time_repayment_pct 
FROM banking_data;

/* 15 Loan Distribution by Branch */
SELECT `Branch Name_x` AS branch_name, SUM(`Loan Amount`) AS total_loan_amount 
FROM banking_data 
GROUP BY `Branch Name_x` 
ORDER BY total_loan_amount DESC;

/* 16 Branch Performance Category Split */
SELECT `Branch Performance Category`, COUNT(*) AS total_loans, SUM(`Loan Amount`) AS total_loan_amount 
FROM banking_data 
GROUP BY `Branch Performance Category`;

/* 17 Product-wise Loan Volume */
SELECT `Product Id`, SUM(`Loan Amount`) AS total_loan_volume 
FROM banking_data 
GROUP BY `Product Id` 
ORDER BY total_loan_volume DESC;

/* 18 Product Profitability */
SELECT `Product Id`, ROUND(SUM(`Total Rrec int`), 2) AS total_interest_income 
FROM banking_data 
GROUP BY `Product Id` 
ORDER BY total_interest_income DESC;

/* 19 Demographics & Age Risk */
SELECT 
    `Age` AS age_group,
    COUNT(`Account ID`) AS total_loans,
    SUM(`Loan Amount`) AS total_disbursed,
    ROUND((SUM(CASE WHEN `Is Default Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS default_rate_pct
FROM banking_data
GROUP BY `Age`
ORDER BY default_rate_pct DESC;

/* 20 Geographical Risk Profile */
SELECT 
    `State Name` AS state_name,
    COUNT(`Account ID`) AS total_loans,
    SUM(`Loan Amount`) AS total_disbursed,
    ROUND((SUM(CASE WHEN `Is Default Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS default_rate_pct,
    ROUND((SUM(CASE WHEN `Is Delinquent Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS delinquency_rate_pct
FROM banking_data
GROUP BY `State Name`
ORDER BY total_disbursed DESC;

/* 21 Loan Purpose Analysis */
SELECT 
    `Purpose Category` AS purpose,
    COUNT(`Account ID`) AS total_loans,
    SUM(`Loan Amount`) AS total_disbursed,
    ROUND((SUM(CASE WHEN `Is Default Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS default_rate_pct,
    ROUND(AVG(`Int Rate`) * 100, 2) AS avg_interest_rate_pct
FROM banking_data
GROUP BY `Purpose Category`
ORDER BY total_disbursed desc;


/* 22 Grade vs Risk Pricing */
SELECT 
    `Grade` AS loan_grade,
    COUNT(`Account ID`) AS total_loans,
    SUM(`Loan Amount`) AS total_disbursed,
    ROUND(AVG(`Credit Score`), 0) AS avg_credit_score,
    ROUND(AVG(`Int Rate`) * 100, 2) AS avg_interest_rate_pct,
    ROUND((SUM(CASE WHEN `Is Default Loan` = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS default_rate_pct
FROM banking_data
GROUP BY `Grade`
ORDER BY loan_grade ASC;



/* Credit and Debit */

/* Total Credit Amount */
SELECT SUM(`Amount`) AS Total_Credit_Amount
FROM `debit_and_credit banking_data`
WHERE `Transaction Type` = 'Credit';

/* Total Debit Amount */
SELECT SUM(`Amount`) AS Total_Debit_Amount
FROM `debit_and_credit banking_data`
WHERE `Transaction Type` = 'Debit';

/* Credit to Debit Ratio */
SELECT 
  SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) / 
  SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END) AS Credit_To_Debit_Ratio
FROM `debit_and_credit banking_data`;

/* Net Transaction Amount */
SELECT 
  SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) - 
  SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END) AS Net_Transaction_Amount
FROM `debit_and_credit banking_data`;

/* Account Activity Ratio */
SELECT `Account Number`, 
       (COUNT(*) / AVG(`Balance`)) AS Account_Activity_Ratio
FROM `debit_and_credit banking_data`
GROUP BY `Account Number`;

/* Transactions per Day/Week/Month */
SELECT DATE_FORMAT(`Transaction Date`, '%Y-%m') AS Transaction_Month, 
       COUNT(*) AS Total_Transactions
FROM `debit_and_credit banking_data`
GROUP BY Transaction_Month
ORDER BY Transaction_Month;

/* Total Transaction Amount by Branch */
SELECT `Branch`, SUM(`Amount`) AS Total_Transaction_Amount
FROM `debit_and_credit banking_data`
GROUP BY `Branch`
ORDER BY Total_Transaction_Amount DESC;


/* Transaction Volume by Bank */
SELECT `Bank Name`, COUNT(*) AS Transaction_Volume
FROM `debit_and_credit banking_data`
GROUP BY `Bank Name`
ORDER BY Transaction_Volume DESC;




