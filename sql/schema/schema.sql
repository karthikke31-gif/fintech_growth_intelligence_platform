CREATE TABLE dim_users (
    user_id INT PRIMARY KEY,
    signup_date DATE,
    city VARCHAR(50),
    age INT,
    acquisition_channel VARCHAR(50),
    device_type VARCHAR(20),
    kyc_status VARCHAR(20)
);

CREATE TABLE fact_transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    amount NUMERIC(12,2),
    transaction_date DATE,
    transaction_status VARCHAR(20)
);

CREATE TABLE fact_payments (
    payment_id INT PRIMARY KEY,
    transaction_id INT,
    bank_id INT,
    payment_method_id INT,
    status VARCHAR(20)
);

CREATE TABLE fact_events (
    event_id INT PRIMARY KEY,
    user_id INT,
    event_name VARCHAR(100),
    session_id INT
);

CREATE TABLE fact_experiments (
    experiment_id INT PRIMARY KEY,
    user_id INT,
    variant VARCHAR(20),
    conversion_flag INT
);


