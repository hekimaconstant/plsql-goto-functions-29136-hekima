# Assignment III: PL/SQL Control Structures and Stored Functions Reflection

## 1. GOTO Control Flow vs. Structured Logic
Using `GOTO` statements allowed for direct branching, but it quickly highlighted why label-based jumping is discouraged in modern software development.

* **Maintainability & Readability:** In `A1_number_classifier.sql` and `A2_salary_review.sql`, using `GOTO` required managing explicit execution paths with labels (`<<pos_label>>`, `<<process_end>>`). The control flow became fragmented even in small scripts. Rewriting the logic in `A4_rewrite_no_goto.sql` using standard `IF-ELSIF-ELSE` blocks simplified the structure, removed jump labels, and made code execution intuitive from top to bottom.
* **PL/SQL Scope Restrictions:** In `A3_illegal_goto.sql`, attempting to jump directly into a nested `IF` block triggered compiler error `PLS-00375`. Oracle enforces strict rules preventing jumps into nested blocks, `IF` statements, or loop iterations from the outside, emphasizing that structured conditionals provide far better safety.

## 2. Stored Functions vs. Anonymous Blocks
Transitioning from local PL/SQL blocks to schema-level stored functions (`CREATE OR REPLACE FUNCTION`) provided key architectural advantages:

* **Schema Persistence & Reusability:** Anonymous blocks execute once in memory and disappear. Creating permanent stored functions in `02_functions/` stored compiled byte code directly in the Oracle data dictionary, making them available across different client sessions and scripts.
* **Direct Integration in SQL:** Stored functions like `fn_annual_salary`, `fn_years_of_service`, `fn_calculate_tax`, and `fn_dept_name` can be called natively inside `SELECT` projections (`03_tests/B5_functions_in_select.sql`). This offloads calculations from the application layer into the database engine while keeping standard SQL queries clean.

## 3. Data Integrity & Validation Patterns
Developing `C1_fn_validate_payroll` illustrated how to design defensive PL/SQL logic for data processing:

* **Multi-Layer Rules:** A valid employee record requires checking multiple data points sequentially: non-null and positive salary values, assigned department IDs, and foreign key existence in the `departments` table.
* **Exception Safety:** Unhandled errors during function execution can abort entire batch queries. Wrapping lookup logic in `BEGIN ... EXCEPTION` blocks (e.g., catching `NO_DATA_FOUND`) allows the function to return clean error descriptors rather than crashing client applications.

## 4. Environment & Tooling Observations
During script execution in SQL Developer, two operational behaviors stood out:

1. **Handling Client-Side Substitution Variables:** In SQL Developer, special characters like the ampersand (`&`) in string literals trigger unwanted variable substitution prompts during script execution. Adjusting string literals (e.g., using `'Finance and Accounting'`) or managing interactive inserts directly ensures clean batch execution without script halts.
2. **PL/SQL Block Termination:** SQL Developer requires a terminating forward slash (`/`) on a new line following any PL/SQL block or `CREATE FUNCTION` statement to trigger compilation. Without the slash, statements remain uncompiled in the execution buffer.