/*

Set Operators
│
├─ Overview
│   ├─ A SET Operator combines the results of two or more
│   │  SELECT statements into a single result set.
│   │
│   ├─ Unlike JOINs,
│   │   ├─ JOIN → Combines Columns (Horizontal)
│   │   └─ SET Operator → Combines Rows (Vertical)
│   │
│   └─ Each SELECT statement is executed separately,
│      then the SET Operator merges the results.
│
├─ General Syntax
│
│   SELECT Column1, Column2, ...
│   FROM Table1
│
│   SET_OPERATOR
│
│   SELECT Column1, Column2, ...
│   FROM Table2;
│
├─ Types of SET Operators
│   ├─ UNION
│   ├─ UNION ALL
│   ├─ INTERSECT
│   └─ EXCEPT
│
├─ Rules of SET Operators
│   │
│   ├─ Rule 1 : SQL Clauses
│   │   ├─ WHERE can be used inside each SELECT statement.
│   │   ├─ JOIN can be used inside each SELECT statement.
│   │   ├─ GROUP BY can be used inside each SELECT statement.
│   │   ├─ HAVING can be used inside each SELECT statement.
│   │   └─ ORDER BY
│   │       ├─ Allowed only once.
│   │       ├─ Must appear at the end of the final query.
│   │       └─ Cannot be written after every SELECT statement.
│   │
│   ├─ Rule 2 : Same Number of Columns
│   │   ├─ Every SELECT statement must return the same number of columns.
│   │   └─ Otherwise, SQL returns an error.
│   │
│   ├─ Rule 3 : Compatible Data Types
│   │   ├─ Corresponding columns must have compatible data types.
│   │   └─ Otherwise, SQL returns an error.
│   │
│   ├─ Rule 4 : Same Order of Columns
│   │   ├─ Columns must appear in the same order in every SELECT statement.
│   │   └─ Matching is done by column position.
│   │
│   ├─ Rule 5 : First Query Controls Column Names
│   │   ├─ The final result uses the column names (or aliases) from the first SELECT statement.
│   │   └─ Aliases in later SELECT statements are ignored.
│   │
│   └─ Rule 6 : Select the Correct Columns
│       ├─ SQL checks only syntax and compatibility.
│       ├─ Incorrect column mapping can produce incorrect results without any SQL error.
│       └─ Always ensure corresponding columns represent the same information.
│
└─ Key Notes
    ├─ SET Operators combine rows, not columns.
    ├─ Each SELECT statement is executed independently.
    ├─ Every SELECT statement must return the same number of columns.
    ├─ Corresponding columns must have compatible data types.
    ├─ Columns must appear in the same order.
    ├─ Column names come from the first SELECT statement.
    └─ ORDER BY is allowed only once at the end of the complete query.


-----------------------------------------------------------------------------------------------
UNION
 │
 ├─ Overview
 │   ├─ Combines the results of two or more SELECT statements.
 │   ├─ Returns all distinct rows from both queries.
 │   └─ Automatically removes duplicate rows.
 │
 ├─ Venn Diagram
 │
 │          A               B 
 │      ┌─────────┐     ┌─────────┐
 │      │█████████│█████│█████████│
 │      │█████████│█████│█████████│
 │      │█████████│█████│█████████│
 │      └─────────┘     └─────────┘
 │
 │      Result = All Distinct Rows
 │
 ├─ Syntax
 │
 │   SELECT Column1, Column2
 │   FROM Table1
 │
 │   UNION
 │
 │   SELECT Column1, Column2
 │   FROM Table2;
 │
 ├─ Key Notes
 │   ├─ Duplicate rows are removed automatically.
 │   ├─ Returns one combined result set.
 │   ├─ Table Order → Not Important.
 │   └─ A UNION B = B UNION A
 │
 └─ Important Note
       └─ Duplicate checking makes UNION slower than UNION ALL.


-----------------------------------------------------------------------------------------------
UNION ALL
 │
 ├─ Overview
 │   ├─ Combines the results of two or more SELECT statements.
 │   ├─ Returns every row from both queries.
 │   └─ Duplicate rows are preserved.
 │
 ├─ Venn Diagram
 │
 │          A             B
 │      ┌─────────┐  ┌─────────┐
 │      │█████████│  │█████████│
 │      │█████████│  │█████████│
 │      │█████████│  │█████████│
 │      └─────────┘  └─────────┘
 │
 │      Result = All Rows
 │      (Duplicates Preserved)
 │
 ├─ Syntax
 │
 │   SELECT Column1, Column2
 │   FROM Table1
 │
 │   UNION ALL
 │
 │   SELECT Column1, Column2
 │   FROM Table2;
 │
 ├─ Key Notes
 │   ├─ Duplicate rows are not removed.
 │   ├─ Returns one combined result set.
 │   ├─ Table Order → Not Important.
 │   └─ A UNION ALL B = B UNION ALL A
 │
 └─ Important Note
       └─ Every row from both queries is returned.


-----------------------------------------------------------------------------------------------
INTERSECT
 │
 ├─ Overview
 │   ├─ Returns only the rows that exist
 │   │  in both queries.
 │   └─ Duplicate rows are removed.
 │
 ├─ Venn Diagram
 │
 │          A               B
 │      ┌─────────┐     ┌─────────┐
 │      │         │█████│         │
 │      │         │█████│         │
 │      │         │█████│         │
 │      └─────────┘     └─────────┘
 │
 │      Result = Common Rows Only
 │
 ├─ Syntax
 │
 │   SELECT Column1, Column2
 │   FROM Table1
 │
 │   INTERSECT
 │
 │   SELECT Column1, Column2
 │   FROM Table2;
 │
 ├─ Key Notes
 │   ├─ Returns only matching rows.
 │   ├─ Duplicate rows are removed.
 │   ├─ Table Order → Not Important.
 │   └─ A INTERSECT B = B INTERSECT A
 │
 └─ Important Note
       └─ Only rows present in both queries are returned.

-----------------------------------------------------------------------------------------------
EXCEPT
 │
 ├─ Overview
 │   ├─ Returns all distinct rows from the
 │   │  first query that do not exist
 │   │  in the second query.
 │   └─ Duplicate rows are removed.
 │
 ├─ Venn Diagram
 │
 │          A               B
 │      ┌─────────┐     ┌─────────┐
 │      │█████████│     │         │
 │      │█████████│░░░░░│         │
 │      │█████████│     │         │
 │      └─────────┘     └─────────┘
 │
 │      █ = Returned
 │      ░ = Excluded (Common Rows)
 │
 │      Result = Rows in A Not Found in B
 │
 ├─ Syntax
 │
 │   SELECT Column1, Column2
 │   FROM Table1
 │
 │   EXCEPT
 │
 │   SELECT Column1, Column2
 │   FROM Table2;
 │
 ├─ Key Notes
 │   ├─ Returns rows from the first query only.
 │   ├─ Duplicate rows are removed.
 │   ├─ Table Order → Important.
 │   └─ A EXCEPT B ≠ B EXCEPT A
 │
 └─ Important Note
      └─ Swapping the queries changes the result.


-----------------------------------------------------------------------------------------------
Choosing the Right SET Operator
├─ UNION
│   ├─ Removes duplicate rows.
│   ├─ Slightly slower because duplicates must be removed.
│   └─ Use when duplicate rows should not appear in the final result.
│
├─ UNION ALL
│   ├─ Keeps duplicate rows.
│   ├─ Generally faster than UNION.
│   ├─ Use when you're confident there are no duplicate rows.
│   ├─ Useful for finding duplicate rows.
│   └─ Useful for data quality analysis.
│
├─ INTERSECT
│   └─ Use when only common rows
│      are required.
│
└─ EXCEPT
    └─ Use when finding rows that exist
│       in one query but not another.
│
├─ Common Use Cases
│   ├─ Combine similar tables into one result.
│   ├─ Merge yearly partitioned tables
│   │  (Orders2022, Orders2023, Orders2024...).
│   ├─ Combine Customers, Employees,
│   │  Suppliers, Students into one Person list.
│   ├─ Prepare data before reporting or analysis.
│   ├─ Consolidate archived and current data.
│   ├─ Compare two datasets for differences.
│   └─ Perform data validation and quality checks.
│
└─ Key Notes
    ├─ SET Operators combine rows, not columns.
    ├─ Every SELECT statement executes independently.
    ├─ All SET Operators follow the same rules.
    ├─ UNION, INTERSECT and EXCEPT remove duplicates.
    ├─ UNION ALL preserves duplicates.
    ├─ EXCEPT is the only SET Operator where
    │  the order of queries affects the result.
    └─ ORDER BY is allowed only once at the end of the complete query.


-----------------------------------------------------------------------------------------------
Delta Detection
├─ Overview
│   ├─ Delta means the difference (change)
│   │  between two batches of data.
│   ├─ Commonly used in Data Engineering.
│   └─ Helps identify new records before
│      loading data into a Data Warehouse.
│
├─ Data Flow
│
│   Source System ───► Data Pipeline ───► Data Warehouse
│
├─ Why Use Delta Detection?
│   ├─ Load only newly generated records.
│   ├─ Avoid inserting duplicate records.
│   ├─ Reduce processing time.
│   └─ Improve ETL / ELT performance.
│
├─ One Approach Using EXCEPT
│   ├─ Compare today's source data
│   │  with the existing Data Warehouse.
│   ├─ EXCEPT returns only the new rows.
│   └─ Insert those rows into the
│      Data Warehouse.
│
├─ Example Workflow
│
│   Day 1
│
│   Source System ----------------------------► Data Warehouse
│   A, B, C, D (new uers)                       A, B, C, D (users)
│
│
│   Day 2
│
│   Source System -------- (EXCEPT) ----------► Data Warehouse
│   A, B, C, D, E, F                            A, B, C, D (alredy existed users)
│   (new users with old user                    E, F (new users)
│    who login today)    
│                      
│
│
└─ Key Notes
    ├─ EXCEPT identifies newly added rows.
    ├─ Only unmatched rows are returned.
    ├─ Existing rows are ignored.
    └─ Commonly used in ETL and ELT pipelines.

-----------------------------------------------------------------------------------------------
Data Completeness Check
├─ Overview
│   ├─ Verifies that all records were
│   │  successfully migrated.
│   ├─ Detects missing or unexpected data.
│   └─ Commonly used after data migration,
│      replication and ETL processes.
│
├─ Data Migration
│
│   Database A ───────────────► Database B
│
├─ Verify Missing Records
│
│   Table from                                 Table from
│   Database A    --------► EXCEPT --------►   Database B
│                                        
│   Result = Empty
│
│   ✔ Every record from Database A
│     exists in Database B.
│
├─ Verify Unexpected Records
│
│   Table from                                 Table from
│   Database B    --------► EXCEPT --------►   Database A
│
│   Result = Empty
│
│   ✔ No additional records exist
│     in Database B.
│
└─ Key Notes
    ├─ An empty result indicates both datasets are identical.
    ├─ Returned rows indicate data discrepancies.
    ├─ A EXCEPT B finds records missing from Database B.
    └─ B EXCEPT A finds extra records present in Database B.


-----------------------------------------------------------------------------------------------
SUMMARY

Set Operators
│
├─ Types
│   ├─ UNION
│   ├─ UNION ALL
│   ├─ INTERSECT
│   └─ EXCEPT
│
├─ Rules
│   ├─ Same Number of Columns
│   ├─ Compatible Data Types
│   ├─ Same Order of Columns
│   ├─ First Query Controls Column Names
│   ├─ SQL Clauses
│   └─ ORDER BY
│
├─ Choosing the Right SET Operator
│   ├─ UNION
│   ├─ UNION ALL
│   ├─ INTERSECT
│   └─ EXCEPT
│
└─ Real-World Use Cases
    ├─ Combining Similar Information
    │   ├─ UNION
    │   └─ UNION ALL
    │
    ├─ Delta Detection
    │   └─ EXCEPT
    │
    └─ Data Completeness Check
        └─ EXCEPT


===============================================================================================
                            CHAPTER 07: Row Level Functions
===============================================================================================
Overview
│
├─ SQL Functions
│   ├─ Single-Row Functions
│   │   ├─ String Functions
│   │   │   ├─ CONCAT
│   │   │   ├─ UPPER / LOWER
│   │   │   ├─ TRIM
│   │   │   ├─ REPLACE
│   │   │   ├─ LEN
│   │   │   ├─ LEFT
│   │   │   ├─ RIGHT
│   │   │   └─ SUBSTRING
│   │   │
│   │   ├─ Number Functions
│   │   │   ├─ ROUND
│   │   │   └─ ABS
│   │   │
│   │   ├─ Date & Time Functions
│   │   │
│   │   └─ NULL Handling Functions
│   │       ├─ ISNULL
│   │       ├─ NULLIF
│   │       ├─ COALESCE
│   │       ├─ CASE WHEN
│   │       └─ IS NULL / IS NOT NULL
│   │
│   └─ Multi-Row Functions
│       ├─ Aggregate Functions
│       └─ Window Functions (Analytical Functions)
│
├─ Nested Functions
│
└─ CASE Expression

===============================================================================================
Functions
├─ Overview
│   ├─ A function is a built-in SQL object that performs a specific 
│   │  operation on one or more values.
│   ├─ It processes the input value(s) and returns a single output value.
│   └─ Functions help simplify SQL queries by performing common tasks.
│
├─ Why Do We Need Functions?
│   ├─ Reduce repetitive SQL code.
│   ├─ Perform calculations.
│   ├─ Manipulate text.
│   ├─ Work with dates and times.
│   ├─ Handle NULL values.
│   └─ Improve query readability.
│
├─ General Syntax
│
│   FUNCTION_NAME(argument1, argument2, ...)
│
├─ Where Can Functions Be Used?
│   ├─ SELECT
│   ├─ WHERE
│   ├─ ORDER BY
│   ├─ GROUP BY
│   ├─ HAVING
│   └─ JOIN conditions
│
└─ Key Notes
    ├─ SQL provides many built-in functions.
    ├─ Different functions are designed for different purposes.
    ├─ A function accepts input value(s) called arguments or parameters.
    └─ Every function returns a value.

-----------------------------------------------------------------------------------------------
Function Categories
├─ SQL Functions
│   │
│   ├─ Single-Row Functions
│   │   │
│   │   └─ Categories
│   │       ├─ String Functions
│   │       ├─ Number Functions
│   │       ├─ Date & Time Functions
│   │       └─ NULL Handling Functions
│   │
│   └─ Multi-Row Functions
│       │
│       └─ Categories
│           ├─ Aggregate Functions
│           └─ Window Functions (Analytical Functions)
│
├─ Nested Functions
│   ├─ One function can be used inside another function.
│   └─ The inner function executes first, followed by the outer function.
│
├─ Data Engineering vs Data Analysis
│   │
│   ├─ Data Engineer
│   │   ├─ Primarily uses Single-Row Functions.
│   │   ├─ Cleans and transforms raw data.
│   │   ├─ Standardizes values.
│   │   ├─ Handles NULL values.
│   │   └─ Prepares data for analysis.
│   │
│   └─ Data Analyst
│       ├─ Primarily uses Multi-Row Functions.
│       ├─ Summarizes prepared data.
│       ├─ Creates reports and KPIs.
│       ├─ Performs business analysis.
│       └─ Finds trends and insights.
│
└─ Key Notes
    ├─ Data preparation comes before analysis.
    ├─ Single-Row Functions prepare the data.
    ├─ Multi-Row Functions analyze the data.
    ├─ Clean data produces more accurate analysis.
    └─ Both function types are commonly used together.

-----------------------------------------------------------------------------------------------
String Functions
├─ Overview
│   ├─ String functions are used to manipulate, calculate and extract text data.
│   ├─ They operate on character and string values.
│   └─ Commonly used for data cleaning and formatting.
│
├─ Categories
│   ├─ String Manipulation
│   │   ├─ CONCAT
│   │   ├─ UPPER
│   │   ├─ LOWER
│   │   ├─ TRIM
│   │   └─ REPLACE
│   │
│   ├─ String Calculation
│   │   └─ LEN
│   │
│   └─ String Extraction
│       ├─ LEFT
│       ├─ RIGHT
│       └─ SUBSTRING
│
└─ Key Notes
    ├─ String functions return a string
    │  or numeric value depending on the function.
    └─ Commonly used for cleaning and preparing text data.

-----------------------------------------------------------------------------------------------
CONCAT
├─ Overview
│   └─ Combines two or more strings into one string.
│
├─ Syntax
│
│   CONCAT(string1, string2, ...)
│
├─ Key Notes
│   ├─ Accepts multiple string values.
│   ├─ Returns a single combined string.
│   └─ Commonly used to create full names,
│      addresses and formatted text.
│
└─ Important Note
    └─ Strings are combined in the order
       they are passed to the function.

-----------------------------------------------------------------------------------------------
UPPER
├─ Overview
│   └─ Converts all characters to uppercase.
│
├─ Syntax
│
│   UPPER(string)
│
├─ Key Notes
│   ├─ Affects alphabetic characters only.
│   ├─ Numbers and symbols remain unchanged.
│   └─ Returns the converted string.
│
└─ Important Note
    └─ The original data is not modified.

-----------------------------------------------------------------------------------------------
LOWER
├─ Overview
│   └─ Converts all characters to lowercase.
│
├─ Syntax
│
│   LOWER(string)
│
├─ Key Notes
│   ├─ Affects alphabetic characters only.
│   ├─ Numbers and symbols remain unchanged.
│   └─ Returns the converted string.
│
└─ Important Note
    └─ The original data is not modified.

-----------------------------------------------------------------------------------------------
TRIM
├─ Overview
│   └─ Removes leading and trailing spaces from a string.
│
├─ Syntax
│
│   TRIM(string)
│
├─ Key Notes
│   ├─ Removes spaces from both ends.
│   ├─ Does not remove spaces between words.
│   └─ Returns the trimmed string.
│
└─ Important Note
    └─ Useful for cleaning imported data.

-----------------------------------------------------------------------------------------------

*/







