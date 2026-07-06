/*
-----------------------------------------------------------------------------------------------
REPLACE
├─ Overview
│   └─ Replaces specific character(s) or text with new character(s) or text.
│
├─ Syntax
│
│   REPLACE(value, old_value, new_value)
│
└─ Key Notes
    ├─ Replaces all matching occurrences.
    ├─ Can replace a single character or an entire word.
    ├─ To remove characters, use an empty string ('') as the replacement.
    └─ Returns the modified string.

-----------------------------------------------------------------------------------------------
LEN
├─ Overview
│   └─ Counts the number of characters in a string.
│
├─ Syntax
│
│   LEN(value)
│
└─ Key Notes
    ├─ Returns the length of the string.
    ├─ Commonly used for validation and dynamic SQL logic.
    └─ Returns a numeric value.

-----------------------------------------------------------------------------------------------
String Extraction

LEFT
├─ Overview
│   └─ Extracts a specific number of characters from the beginning of a string.
│
├─ Syntax
│
│   LEFT(value, number_of_characters)
│
└─ Key Notes
    ├─ Starts from the left.
    ├─ Returns the extracted string.
    └─ Often used with TRIM() to clean data before extraction.

-----------------------------------------------------------------------------------------------
RIGHT
├─ Overview
│   └─ Extracts a specific number of characters from the end of a string.
│
├─ Syntax
│
│   RIGHT(value, number_of_characters)
│
└─ Key Notes
    ├─ Starts from the right.
    ├─ Returns the extracted string.
    └─ Often used with TRIM() to clean data before extraction.

-----------------------------------------------------------------------------------------------
SUBSTRING
├─ Overview
│   └─ Extracts part of a string from a specified position.
│
├─ Syntax
│
│   SUBSTRING(value, start, length)
│
└─ Key Notes
    ├─ start = Starting position.
    ├─ length = Number of characters to extract.
    ├─ Returns the extracted string.
    └─ Can be combined with LEN() to create dynamic extraction logic.


-----------------------------------------------------------------------------------------------
                                    NUMBER FUNCTION
-----------------------------------------------------------------------------------------------

ROUND
├─ Overview
│   └─ Rounds a number to the specified decimal place or place value.
│
├─ Syntax
│
│   ROUND(number, decimal_places)
│
├─ Key Notes
│   ├─ The digit after the rounding position decides whether to round up or not.
│   ├─ If the next digit is 5 or greater → Rounds up.
│   ├─ If the next digit is less than 5 → No round up.
│   ├─ Positive value → Rounds decimal places.
│   ├─ 0 → Rounds to the nearest whole number.
│   ├─ Negative value → Rounds to the nearest multiple of 10, 100, 1000...
│   └─ Returns the rounded number.
│
└─ Important Note
    ├─ The second argument determines where the number is rounded.
    ├─ Positive values round to the right of the decimal point.
    ├─ 0 rounds to the nearest whole number.
    ├─ Negative values round to the nearest multiple of 10, 100, 1000...
	├─ When using negative values, SQL Server may throw an Arithmetic Overflow
	│  if the rounded result cannot fit in the original numeric data type.
    └─ Use CAST() or CONVERT() to a larger DECIMAL or FLOAT if needed.



          Example (SQL Server)

          SELECT
            ROUND(3.14567, -1);      -- 0

          SELECT
             ROUND(7.5167, -1);       -- Arithmetic overflow error

         Reason:
         7.5167 is treated as NUMERIC(5,4).
         Rounding to -1 gives 10.0000, but NUMERIC(5,4)
         cannot store two digits before the decimal point.

         Solution: Use of CAST (later topic)
             SELECT
               ROUND(CAST(7.5167 AS DECIMAL(10,4)), -1);   -- 10.0000

-----------------------------------------------------------------------------------------------
ABS
├─ Overview
│   └─ Returns the absolute (positive) value of a number.
│
├─ Syntax
│
│   ABS(number)
│
├─ Key Notes
│   ├─ Removes the negative (-) sign from a number.
│   ├─ Positive numbers remain unchanged.
│   ├─ Zero remains unchanged.
│   └─ Returns a positive value.
│
└─ Important Note
    └─ Commonly used to calculate the distance or difference
       between two numbers without considering the sign.

-----------------------------------------------------------------------------------------------
                             DATE & TIME FUNCTION
-----------------------------------------------------------------------------------------------
Date & Time Functions
├─ Overview
│   ├─ Date & Time functions are used to retrieve, calculate,
│   │  manipulate and format date/time values.
│   ├─ They help work with dates and times in SQL queries.
│   └─ Commonly used for filtering, reporting and data analysis.
│
├─ Categories
│   ├─ Extraction
│   │   ├─ DAY
│   │   ├─ MONTH
│   │   ├─ YEAR
│   │   ├─ DATEPART
│   │   ├─ DATENAME
│   │   ├─ DATETRUNC
│   │   └─ EOMONTH
│   │
│   ├─ Formatting & Casting 
│   │   ├─ FORMAT
│   │   ├─ CONVERT
│   │   └─ CAST
│   │
│   ├─ Calculation 
│   │   ├─ DATEADD
│   │   └─ DATEDIFF
│   │
│   └─ Validation
│       └─ ISDATE
│
├─ Date & Time Structure
│   ├─ Date
│   │   └─ Stores only the date.
│   │
│   ├─ Time
│   │   └─ Stores only the time.
│   │
│   └─ Date + Time
│       ├─ Stores both date and time together.
│       ├─ Commonly called a Timestamp in many databases.
│       └─ In SQL Server, it is called DATETIME.
│
├─ Date & Time Values
│   ├─ SQL provides three common sources of date/time values:
│   │
│   ├─ Stored Date Values
│   │   └─ Dates already stored inside database tables.
│   │
│   ├─ Hardcoded Date Values
│   │   └─ Date strings written directly inside SQL queries.
│   │
│   └─ System Date & Time
│       └─ Retrieved using GETDATE().
│
├─ GETDATE()
│   ├─ Returns the current system date and time.
│   ├─ Takes no arguments.
│   ├─ Returns a DATETIME value.
│   └─ Value is generated at the moment the query executes.
│
└─ Key Notes
    ├─ Date & Time functions return date, time or DATETIME values.
    ├─ Dates can be compared, filtered and calculated.
    ├─ GETDATE() returns the current system date and time.
    └─ Different functions are designed for different date/time operations.

----------------------
Extraction Functions
----------------------
├─ Overview
│   └─ Used to extract specific parts of a date or time value.
│
├─ Functions
│   ├─ DAY
│   ├─ MONTH
│   ├─ YEAR
│   ├─ DATEPART
│   ├─ DATENAME
│   ├─ DATETRUNC
│   └─ EOMONTH
│
└─ Key Notes
    ├─ Extraction functions return a specific part of a date/time value.
    ├─ Most extraction functions return numeric values.
    └─ Commonly used for filtering, grouping and reporting.

-----------------------------------------------------------------------------------------------
DAY
├─ Overview
│   └─ Returns the day from a date.
│
├─ Syntax
│
│   DAY(date)
│
└─ Key Notes
    ├─ Returns a numeric value (1–31).
    ├─ Extracts only the day portion.
    └─ Returns an integer.

-----------------------------------------------------------------------------------------------
MONTH
├─ Overview
│   └─ Returns the month from a date.
│
├─ Syntax
│
│   MONTH(date)
│
└─ Key Notes
    ├─ Returns a numeric value (1–12).
    ├─ Extracts only the month portion.
    └─ Returns an integer.

-----------------------------------------------------------------------------------------------
YEAR
├─ Overview
│   └─ Returns the year from a date.
│
├─ Syntax
│
│   YEAR(date)
│
└─ Key Notes
    ├─ Returns the year portion of the date.
    ├─ Returns a four-digit year.
    └─ Returns an integer.

-----------------------------------------------------------------------------------------------
DATEPART
├─ Overview
│   └─ Returns a specific part of a date or time as a numeric value.
│
├─ Syntax
│
│   DATEPART(part, date)
│
├─ Common Date Parts
│   ├─ YEAR      (yy, yyyy)
│   ├─ QUARTER   (qq, q)
│   ├─ MONTH     (mm, m)
│   ├─ DAYOFYEAR (dy, y)
│   ├─ DAY       (dd, d)
│   ├─ WEEK      (wk, ww)
│   ├─ WEEKDAY   (dw)
│   ├─ HOUR      (hh)
│   ├─ MINUTE    (mi, n)
│   ├─ SECOND    (ss, s)
│   └─ MILLISECOND (ms)
│
├─ Key Notes
│   ├─ Returns the requested date/time part as an integer.
│   ├─ Supports both full names and abbreviations.
│   ├─ Can extract both date and time parts.
│   └─ More flexible than DAY(), MONTH() and YEAR().
│
└─ Important Note
    └─ Use DAY(), MONTH() and YEAR() for simple extraction.
       Use DATEPART() when you need other parts like
       Quarter, Week, Weekday, Hour or Minute.

-----------------------------------------------------------------------------------------------
DATENAME
├─ Overview
│   └─ Returns the name of a specific part of a date or time.
│
├─ Syntax
│
│   DATENAME(part, date)
│
├─ Common Date Parts
│   ├─ YEAR      (yy, yyyy)
│   ├─ QUARTER   (qq, q)
│   ├─ MONTH     (mm, m)
│   ├─ DAY       (dd, d)
│   ├─ WEEK      (wk, ww)
│   ├─ WEEKDAY   (dw)
│   ├─ HOUR      (hh)
│   ├─ MINUTE    (mi, n)
│   ├─ SECOND    (ss, s)
│   └─ MILLISECOND (ms)
│
├─ Key Notes
│   ├─ Returns the requested date/time part as text.
│   ├─ Supports both full names and abbreviations.
│   ├─ Can extract both date and time parts.
│   └─ Commonly used to display readable date information.
│
└─ Important Note
    └─ Unlike DATEPART(), DATENAME() returns text instead
       of a numeric value.

-----------------------------------------------------------------------------------------------
DATETRUNC
├─ Overview
│   └─ Truncates a date or time to a specified date part.
│
├─ Syntax
│
│   DATETRUNC(part, date)
│
├─ Common Date Parts
│   ├─ YEAR      (yy, yyyy)
│   ├─ QUARTER   (qq, q)
│   ├─ MONTH     (mm, m)
│   ├─ DAY       (dd, d)
│   ├─ WEEK      (wk, ww)
│   ├─ WEEKDAY   (dw)
│   ├─ HOUR      (hh)
│   ├─ MINUTE    (mi, n)
│   ├─ SECOND    (ss, s)
│   └─ MILLISECOND (ms)
│
├─ Key Notes
│   ├─ Returns the beginning of the specified date part.
│   ├─ Lower date/time parts are reset to zero or their starting value.
│   ├─ Commonly used for grouping and date calculations.
│   └─ Returns a date/time value.
│
└─ Important Note
    ├─ Unlike DATEPART() and DATENAME(), DATETRUNC()
    │  returns a complete date/time value, not a single
    │  date part.
	│
	├─ MINUTE
    │     YYYY-MM-DD HH:MM:00
    │                    ↑
    │                 Seconds reset to 00.
    │
    ├─ HOUR
    │     YYYY-MM-DD HH:00:00
    │                 ↑     ↑
    │          Minutes and seconds reset.
    │
    ├─ DAY
    │     YYYY-MM-DD 00:00:00
    │                ↑  ↑  ↑
    │         Whole Time resets to 00:00:00.
    │
    ├─ MONTH
    │     YYYY-MM-01 00:00:00
    │             ↑
    │      Day resets to 01 (not 00),
    │      because dates start from 01.
    │
    └─ YEAR
          YYYY-01-01 00:00:00
               ↑  ↑
        Month and day reset to 01,
        while time resets to 00:00:00.

-----------------------------------------------------------------------------------------------
Why DATETRUNC() is Important for Data Analysis
├─ Problem
│   ├─ Date & time values are often unique.
│   ├─ Grouping by the full DATETIME creates too many groups.
│   └─ Makes it difficult to summarize data.
│
├─ Solution
│   ├─ DATETRUNC() removes unnecessary date/time precision.
│   ├─ Allows data to be grouped at different levels.
│   └─ Produces meaningful summaries for reporting.
│
├─ Common Aggregation Levels
│   ├─ Minute Level
│   ├─ Hour Level
│   ├─ Day Level
│   ├─ Month Level
│   ├─ Quarter Level
│   └─ Year Level
│
└─ Important Note
    ├─ DATETRUNC() is commonly used with GROUP BY.
    ├─ It helps aggregate data by Month, Quarter or Year.
    ├─ Widely used in dashboards, reports and trend analysis. 
	└─ COUNT(*) is an aggregate function that counts the number 
	   of rows in each group (later Topic)

-----------------------------------------------------------------------------------------------
EOMONTH
├─ Overview
│   └─ Returns the last day of the month for a given date.
│
├─ Syntax
│
│   EOMONTH(date)
│
├─ Parameters
│   └─ date
│      └─ The input date.
│
├─ Key Notes
│   ├─ Returns a DATE value.
│   ├─ By default, returns the last day of the current month.
│   ├─ Positive values move to future months.
│   ├─ Negative values move to previous months.
│   └─ Commonly used in monthly reports and date calculations.
│
└─ Important Note
    └─ EOMONTH() always returns the last calendar day
       of the specified month, regardless of whether
       the month has 28, 29, 30 or 31 days.

-----------------------------------------------------------------------------------------------
Finding the First Day of a Month
├─ Problem
│   ├─ SQL Server has EOMONTH() to return the last day of a month.
│   └─ There is no built-in function to directly return the first day.
│
├─ Solution
│   └─ Use DATETRUNC(MONTH, date).
│
├─ Syntax
│
│   DATETRUNC(MONTH, date)
│
├─ Key Notes
│   ├─ Truncates the date to the beginning of the month.
│   ├─ Returns the first day of the month.
│   ├─ Time is reset to 00:00:00.
│   ├─ Returns a DATETIME value.
│   └─ Use CAST(... AS DATE) to remove the time portion.
│
└─ Important Note
    ├─ EOMONTH() → Returns the last day of the month.
    └─ DATETRUNC(MONTH, date) → Returns the first day of the month.

-----------------------------------------------------------------------------------------------


*/