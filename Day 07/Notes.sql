/*

Data filtering
----------------------
Notes
├─ Filtering with numeric values is generally faster than filtering with strings.
├─ Numbers require less comparison work than text.
├─ Integer columns are usually indexed more efficiently.
└─ Always filter using the correct data type whenever possible.


FUNCTION COMPARISON
----------------------
Quick Comparison

DAY()       → Extract Day
MONTH()     → Extract Month
YEAR()      → Extract Year
DATEPART()  → Extract any numeric date/time part
DATENAME()  → Extract any date/time part as text
DATETRUNC() → Return beginning of a period
EOMONTH()   → Return end of a month


DATE FORMATS
----------------------

Overview
├─ Dates can be written in different formats.
└─ SQL Server accepts several standard formats.

Date Structure

Date
├─ Year
├─ Month
└─ Day

Time
├─ Hour
├─ Minute
├─ Second
└─ Millisecond

Common Formats

ISO 8601
├─ YYYY-MM-DD
└─ Example
      2026-07-08

USA Format
├─ MM/DD/YYYY
└─ Example
      07/08/2026

European Format
├─ DD/MM/YYYY
└─ Example
      08/07/2026

Default SQL Server DATETIME
YYYY-MM-DD HH:MM:SS.mmm

Example
2026-07-08 10:45:30.123

Note
├─ ISO 8601 is the safest format.
└─ Avoid ambiguous formats like 07/08/2026 because country settings may interpret them differently.


FORMATTING & CASTING
----------------------
Overview
├─ Formatting changes how data looks.
└─ It does not change the actual stored value.

FORMAT()

Overview
├─ Formats date, time or numeric values.
└─ Returns formatted text.

Syntax

FORMAT(value, format)

Example

FORMAT(GETDATE(),'dd/MM/yyyy')

Key Notes
├─ Returns NVARCHAR.
├─ Mainly used for displaying data.
└─ Slower than CONVERT().


CONVERT()
----------------------

Overview
├─ Converts data from one type to another.
├─ Can also format dates.
└─ Faster than FORMAT().

Syntax

CONVERT(data_type, value, style)

Example

CONVERT(VARCHAR(10), GETDATE(), 103)

Key Notes
├─ Used for conversion and formatting.
├─ Style number controls output format.
└─ Commonly used in SQL Server.


CAST()
----------------------

Overview
├─ Changes one data type into another.
└─ Does not format output.

Syntax

CAST(value AS datatype)

Example

CAST('2026-07-08' AS DATE)

Key Notes
├─ ANSI SQL Standard.
├─ Used only for datatype conversion.
└─ Preferred when formatting is not required.


FORMAT vs CONVERT vs CAST
---------------------------

FORMAT()
├─ Changes appearance
├─ Best for display
└─ Slowest

CONVERT()
├─ Converts datatype
├─ Can format dates
└─ Faster than FORMAT()

CAST()
├─ Converts datatype only
├─ ANSI Standard
└─ Simplest conversion method


DATE CALCULATION
----------------------

DATEADD()

Overview
├─ Adds or subtracts a time interval.
└─ Returns a new date.

Syntax

DATEADD(part, number, date)

Example

DATEADD(DAY, 10, GETDATE())

Key Notes
├─ Positive number → Add
├─ Negative number → Subtract
└─ Does not modify original data.


DATEDIFF()
----------------------

Overview
├─ Finds the difference between two dates.
└─ Returns an integer.

Syntax

DATEDIFF(part, start_date, end_date)

Example

DATEDIFF(DAY,'2026-07-01','2026-07-08')

Output

7

Common Parts
├─ DAY
├─ MONTH
├─ YEAR
├─ HOUR
├─ MINUTE
└─ SECOND


LAG()
----------------------

Overview
├─ LAG() returns the value from the previous row.
├─ It allows comparison between the current row and previous row.
└─ Works with OVER().

Syntax

LAG(column) OVER(ORDER BY column)

Example

Sales

100
150
120
180

Query

SELECT Sales,
       LAG(Sales) OVER(ORDER BY Sales) AS PreviousSales
FROM SalesTable;

Result

Sales    PreviousSales
100      NULL
120      100
150      120
180      150

Why do we use LAG()?

├─ Compare current value with previous value.
├─ Find increase or decrease.
├─ Calculate daily/monthly growth.
├─ Find previous salary or previous order.
└─ Time-series analysis.

Without LAG()
├─ Self Join
├─ Complex Query
└─ More difficult to read

With LAG()
├─ Simple
├─ Cleaner
└─ Easier to maintain


VALIDATION
----------------------

ISDATE()

Overview
├─ Checks whether a value is a valid date.
└─ Returns 1 or 0.

Syntax

ISDATE(value)

Example

ISDATE('2026-07-08')
→ 1

ISDATE('31-Feb-2026')
→ 0

Key Notes
├─ 1 → Valid date
├─ 0 → Invalid date
└─ Commonly used before converting text into DATE or DATETIME.


*/