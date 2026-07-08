/*
------------------------------------------------------------ 
					NULL FUNCTIONS
------------------------------------------------------------

NULL
│
├─ NULL means → Nothing / Unknown / Missing Value
│
├─ NULL is NOT
│  ├─ 0 (Zero)
│  ├─ Empty String ('')
│  ├─ Blank Space (' ')
│  └─ Equal to another NULL
│
└─ Used when data is missing or unknown.


       NULL --------------------> 40

       Replace NULL with a value

      Methods
      │
      ├─ ISNULL()
      └─ COALESCE()


      40 --------------------> NULL

      Convert a value into NULL

      Method
      │
      └─ NULLIF()


Checking NULL Values
│
├─ IS NULL
│  └─ Checks whether a value is NULL.
│
└─ IS NOT NULL
   └─ Checks whether a value is NOT NULL.

NOTE:
│
├─ IS NULL & IS NOT NULL return Boolean values.
├─ Result → TRUE / FALSE
└─ They are NOT the same as ISNULL().


------------------------------------------------------------
ISNULL()
|
└─ Replaces a NULL value with a specified value.

Syntax

ISNULL(value, replacement_value)

------------------------------------------------------------
COALESCE()
│
└─ Returns the first NON-NULL value from a list.

Syntax

COALESCE(value1, value2, value3, ...)

------------------------------------------------------------
ISNULL() vs COALESCE()


ISNULL()
│
├─ Accepts only 2 arguments.
├─ SQL Server specific.
├─ Used mainly for replacing NULL.
└─ Faster for simple replacement.

COALESCE()
│
├─ Accepts multiple arguments.
├─ ANSI SQL Standard.
├─ Returns the first NON-NULL value.
└─ More flexible.

------------------------------------------------------------
NULLIF()
│
└─ Compares two values.
   If both values are equal → Returns NULL
   Otherwise → Returns the first value.

Syntax
NULLIF(value1, value2)

------------------------------------------------------------
UseCases - Handling NULLS 












===========================================
WINDOW FUNCTIONS - OVER()
===========================================

What is OVER()?
---------------
OVER() tells SQL:
"Which rows should I use for this calculation,
WITHOUT reducing the number of rows returned?"

It converts an aggregate function (AVG, SUM, COUNT, etc.)
into a WINDOW FUNCTION.

----------------------------------------------------------
WITHOUT OVER() --> Aggregate Function
----------------------------------------------------------

SELECT AVG(Score)
FROM sales.Customers;

Output:
+-----------+
| AVG(Score)|
+-----------+
|    75     |
+-----------+

✔ Returns only ONE row because AVG() combines all rows.

----------------------------------------------------------
Why does this give an error?
----------------------------------------------------------

SELECT
    CustomerID,
    AVG(Score)
FROM sales.Customers;

❌ Error

Reason:
CustomerID has many different values,
but AVG() returns only ONE value.

SQL doesn't know which CustomerID to display.

Solution:
1. Use GROUP BY
OR
2. Use OVER()

----------------------------------------------------------
WITH OVER() --> Window Function
----------------------------------------------------------

SELECT
    CustomerID,
    AVG(Score) OVER() AS AvgScore
FROM sales.Customers;

Output

+------------+----------+
|CustomerID  | AvgScore |
+------------+----------+
|1           |    75    |
|2           |    75    |
|3           |    75    |
|4           |    75    |
+------------+----------+

✔ Number of rows stays the SAME.
✔ Average is repeated on every row.

----------------------------------------------------------
What does "Window" mean?
----------------------------------------------------------

Window = The set of rows SQL looks at
to perform the calculation.

Think of it as SQL asking:

"For THIS row...
which rows should I use to calculate AVG()?"

OVER() answers that question.

----------------------------------------------------------
Easy Way to Remember
----------------------------------------------------------

Aggregate Function
------------------
- Combines rows
- Returns fewer rows
- Often uses GROUP BY

Window Function
---------------
- Keeps every row
- Calculates across a window of rows
- Uses OVER()

----------------------------------------------------------
Shortcut to Remember
----------------------------------------------------------

Without OVER()
= Collapse rows.

With OVER()
= Keep rows + Calculate.
*/