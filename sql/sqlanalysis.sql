-- =========================================
-- BANKING FRAUD ANALYSIS
-- =========================================

-- 1. Total Transactions & Fraud %
SELECT 
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100 * SUM(is_fraud) / COUNT(*),2) AS fraud_percentage
FROM transactions;

-- 2. High Value Transactions (>50000)
SELECT *
FROM transactions
WHERE amount > 50000;

-- 3. Fraud by Location
SELECT 
    location,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_count
FROM transactions
GROUP BY location
ORDER BY fraud_count DESC;

-- 4. Fraud by Device
SELECT 
    device_type,
    COUNT(*) AS total,
    SUM(is_fraud) AS fraud_cases
FROM transactions
GROUP BY device_type
ORDER BY fraud_cases DESC;

-- 5. Customer Risk Ranking (Window Function)
SELECT 
    customer_id,
    total_amount,
    RANK() OVER (ORDER BY total_amount DESC) AS risk_rank
FROM (
    SELECT 
        customer_id,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY customer_id
) t;

-- 6. Transaction Gap Analysis (LAG)
SELECT 
    customer_id,
    transaction_date,
    amount,
    LAG(transaction_date) OVER (
        PARTITION BY customer_id 
        ORDER BY transaction_date
    ) AS prev_transaction
FROM transactions;

-- 7. Rapid Transactions (within same day)
SELECT 
    customer_id,
    DATE(transaction_date) AS txn_date,
    COUNT(*) AS txn_count
FROM transactions
GROUP BY customer_id, DATE(transaction_date)
HAVING txn_count > 1;

-- 8. Suspicious High Fraud Customers
SELECT 
    customer_id,
    SUM(is_fraud) AS fraud_count
FROM transactions
GROUP BY customer_id
HAVING fraud_count > 1;