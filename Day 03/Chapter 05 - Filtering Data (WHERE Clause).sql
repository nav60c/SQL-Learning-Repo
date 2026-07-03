/*
==============================================================
          Chapter 5 : Filtering Data (WHERE Clause)
==============================================================

Overview
│
├─ Filtering means retrieving only the rows that satisfy a
│  specified condition.
├─ Instead of returning every record, SQL evaluates each row
│  against the given condition.
└─ Rows that meet the condition are returned; others are ignored.

Why Use Filtering?
│
├─ Find specific records.
├─ Reduce unnecessary data.
├─ Improve query readability.
└─ Retrieve meaningful results for analysis.

Syntax
│
└─ SELECT column_name(s)
   FROM table_name
   WHERE condition;

Condition Types
│
├─ [Comparison Operators]
│   ├─ =      Equal to
│   ├─ <>     Not equal to
│   ├─ !=     Not equal to (SQL Server)
│   ├─ >      Greater than
│   ├─ <      Less than
│   ├─ >=     Greater than or equal to
│   └─ <=     Less than or equal to
│
├─ [Logical Operators]
│   ├─ AND
│   ├─ OR
│   └─ NOT
│
├─ [Range Operators]
│   └─ BETWEEN
│
├─ [Membership Operators]
│   └─ IN
│
└─[Search Operators]
    └─ LIKE

 

Key Notes
│
├─ WHERE filters rows before the results are displayed.
├─ It can be used with SELECT, UPDATE and DELETE statements.
├─ Aggregate functions cannot be used in WHERE.
└─ Use HAVING to filter aggregated results.


--------------------------------------------------------------
               Comparison Operators (=, <>, >, <, >=, <=)
--------------------------------------------------------------
Overview
│
├─ Comparison operators compare two values.
├─ They evaluate a condition for each row.
└─ The result is either TRUE, FALSE, or UNKNOWN (NULL).

Purpose
│
└─ Used with the WHERE clause to filter records based on a
   specified condition.

Operators
│
├─ [=] Equal To
│   ├─ Returns rows where both values are equal.
│   └─ Commonly used to find an exact match.
│
├─ [<>] Not Equal To
│   ├─ Returns rows where values are different.
│   └─ != is also supported in SQL Server.
│
├─ [>] Greater Than
│   ├─ Returns rows with values greater than the specified value.
│   └─ Excludes the specified value.
│
├─ [<] Less Than
│   ├─ Returns rows with values less than the specified value.
│   └─ Excludes the specified value.
│
├─ [>=] Greater Than or Equal To
│   ├─ Includes the specified value.
│   └─ Returns values greater than or equal to it.
│
└─ [<=] Less Than or Equal To
    ├─ Includes the specified value.
    └─ Returns values less than or equal to it.

Key Notes
│
├─ Mostly used with the WHERE clause.
├─ Can compare numbers, text, and dates.
├─ Text values must be enclosed in single quotes (' ').
└─ Numeric values are written without quotes.


--------------------------------------------------------------                 
                 Logical Operators (AND, OR, NOT)
--------------------------------------------------------------               

Overview
│
├─ Logical operators combine or modify one or more conditions.
├─ They determine how multiple conditions are evaluated.
└─ Commonly used with the WHERE clause.

Purpose
│
└─ Used to create more flexible and precise filtering conditions.

Operators
│
├─ [AND]
│   ├─ Returns TRUE only if all conditions are TRUE.
│   └─ Every specified condition must be satisfied.
│
├─ [OR]
│   ├─ Returns TRUE if at least one condition is TRUE.
│   └─ Only one matching condition is enough.
│
└─ [NOT]
    ├─ Reverses the result of a condition.
    └─ TRUE becomes FALSE, and FALSE becomes TRUE.

Evaluation Order
│
├─ Parentheses ( )
├─ NOT
├─ AND
└─ OR

Key Notes
│
├─ Parentheses improve readability and control evaluation order.
├─ AND narrows the result set.
├─ OR broadens the result set.
├─ NOT excludes rows that satisfy a condition.
└─ Logical operators can be combined with comparison, range,
   membership, and search operators.



--------------------------------------------------------------
                   Range Operator (BETWEEN)
--------------------------------------------------------------

Overview
│
├─ The BETWEEN operator checks whether a value falls within a specified range.
├─ It is commonly used to filter numbers, dates, and text.
└─ The boundary values are included in the result.

Purpose
│
└─ Used to retrieve rows whose values lie between two
   specified values.

Operator
│
└─ [BETWEEN]
    ├─ Returns rows within the specified range.
    ├─ Includes both the starting and ending values.
    └─ Equivalent to:
       value >= lower_limit AND value <= upper_limit

Syntax
│
└─ WHERE column_name BETWEEN value1 AND value2

Key Notes
│
├─ Both boundary values are included.
├─ Works with numeric, date, and text data.
├─ The lower value should be written first, followed by the higher value.
├─ Can be combined with AND, OR, and NOT.
└─ Use NOT BETWEEN to retrieve values outside the range.

Remember
│
├─ BETWEEN is inclusive.
└─ NOT BETWEEN excludes the specified range.



--------------------------------------------------------------
               Membership Operators (IN, NOT IN)
--------------------------------------------------------------

Overview
│
├─ Membership operators check whether a value exists in a list
│  of specified values.
├─ They provide a simpler alternative to multiple OR conditions.
└─ Commonly used with the WHERE clause.

Purpose
│
└─ Used to filter rows whose values match one or more values
   from a specified list.

Operators
│
├─ [IN]
│   ├─ Returns rows where the value exists in the given list.
│   ├─ Accepts multiple values enclosed in parentheses.
│   └─ Replaces multiple OR conditions.
│
└─ [NOT IN]
    ├─ Returns rows where the value does not exist in the list.
    ├─ Excludes all specified values.
    └─ Opposite of the IN operator.

Remember
│
├─ IN = multiple possible values.
├─ NOT IN = exclude listed values.
└─ IN can also work with subqueries.

Syntax
│
├─ WHERE column_name IN (value1, value2, value3, ...)
│
└─ WHERE column_name NOT IN (value1, value2, value3, ...)

Key Notes
│
├─ Values inside the list are separated by commas.
├─ Text values must be enclosed in single quotes (' ').
├─ Works with numbers, text, and dates.
├─ Makes queries shorter and easier to read than using
│  multiple OR conditions.
└─ Can be combined with AND, OR, and NOT.

Remember
│
├─ IN → Matches any value in the list.
└─ NOT IN → Excludes all values in the list.



--------------------------------------------------------------
                 Search Operator (LIKE)
--------------------------------------------------------------

Overview
│
├─ The LIKE operator is used to search for a specific pattern
│  within text values.
├─ It performs pattern matching instead of an exact match.
└─ Commonly used with the WHERE clause.

Purpose
│
└─ Used to retrieve rows whose text values match a specified
   pattern.

Operator
│
└─ [LIKE]
    ├─ Searches for a pattern in a character string.
    ├─ Uses wildcard characters to define the pattern.
    └─ Supports flexible text searching.

Wildcards
│
├─ [%] Percent (%)
│   ├─ Represents zero, one, or multiple characters.
│   └─ Used for partial text matching.
│
└─ [_] Underscore (_)
    ├─ Represents exactly one character.
    └─ Used when a fixed character position is required.

Syntax
│
└─ WHERE column_name LIKE 'pattern'

Key Notes
│
├─ LIKE is mainly used with text (VARCHAR, CHAR, TEXT).
├─ Wildcards can appear at the beginning, middle, or end
│  of the pattern.
├─ Pattern values must be enclosed in single quotes (' ').
├─ Can be combined with AND, OR, and NOT.
└─ Use NOT LIKE to exclude matching patterns.

Remember
│
├─ % → Zero or more characters.
├─ _ → Exactly one character.
└─ NOT LIKE → Excludes matching patterns.


*/

