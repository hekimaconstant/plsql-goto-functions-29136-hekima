CREATE TABLE departments (
    department_id   NUMBER PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL
);


CREATE TABLE employees (
    employee_id   NUMBER PRIMARY KEY,
    first_name    VARCHAR2(50) NOT NULL,
    last_name     VARCHAR2(50) NOT NULL,
    salary        NUMBER(12, 2) NOT NULL,
    hire_date     DATE NOT NULL,
    department_id NUMBER,
    CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) 
        REFERENCES departments(department_id)
);


INSERT INTO departments (department_id, department_name) VALUES (10, 'Software Engineering');
INSERT INTO departments (department_id, department_name) VALUES (20, 'Human Resources');
INSERT INTO departments (department_id, department_name) VALUES (30, 'Finance and Accounting');
INSERT INTO departments (department_id, department_name) VALUES (40, 'Database Administration');


INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (101, 'Jean-Luc', 'Habimana', 450000, TO_DATE('2021-03-15', 'YYYY-MM-DD'), 10);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (102, 'Divine', 'Mutoni', 850000, TO_DATE('2018-06-01', 'YYYY-MM-DD'), 30);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (103, 'Robert', 'Mugisha', 1250000, TO_DATE('2015-01-10', 'YYYY-MM-DD'), 40);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (104, 'Grace', 'Uwase', 600000, TO_DATE('2023-09-20', 'YYYY-MM-DD'), 20);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (105, 'Patrick', 'Nshimiyimana', 350000, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 10);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (106, 'Kevine', 'Umutoniwase', 1100000, TO_DATE('2019-11-05', 'YYYY-MM-DD'), 40);


COMMIT;