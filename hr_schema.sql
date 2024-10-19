-- Create the HR database
CREATE DATABASE IF NOT EXISTS hr_schema;

-- Use the HR database
USE hr_schema;

-- Drop tables if they already exist (for re-running the script)
DROP TABLE IF EXISTS training;
DROP TABLE IF EXISTS benefits;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS jobs;

-- Create table for storing job roles
CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    min_salary DECIMAL(10, 2),
    max_salary DECIMAL(10, 2)
);

-- Create table for storing department information (no foreign key to employees yet)
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT
);

-- Create table for storing employee information
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary DECIMAL(10, 2),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

-- Create table for storing employee benefits
CREATE TABLE benefits (
    benefit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    benefit_type VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Create table for storing employee training records
CREATE TABLE training (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    training_program VARCHAR(100) NOT NULL,
    training_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data into departments
INSERT INTO departments (department_name, manager_id) VALUES
('Human Resources', NULL),
('Development', NULL),
('Sales', NULL);

-- Insert sample data into jobs
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES
('Software Engineer', 60000, 120000),
('HR Manager', 50000, 100000),
('Sales Representative', 40000, 80000);

-- Insert sample data into employees
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-01-15', 1, 90000, NULL, 2),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321', '2023-02-20', 2, 75000, NULL, 1),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-555-5555', '2023-03-25', 3, 50000, 1, 3);

-- Insert sample data into benefits
INSERT INTO benefits (employee_id, benefit_type, start_date, end_date) VALUES
(1, 'Health Insurance', '2023-01-15', '2024-01-15'),
(2, 'Retirement Plan', '2023-02-20', '2024-02-20');

-- Insert sample data into training
INSERT INTO training (employee_id, training_program, training_date) VALUES
(1, 'Java Development', '2023-04-01'),
(2, 'People Management', '2023-05-15');
