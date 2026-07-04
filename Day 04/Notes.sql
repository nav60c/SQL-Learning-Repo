/*
-------------------
Day 04 Notes
-------------------


Left Join
│
├─ Returns all rows from the Left table.
├─ Returns only the matching rows from the Right table.
├─ If no match exists in the Right table,
│  NULL values are returned for the Right table columns.
│
├─ Venn Diagram
│
│          A               B
│      ┌─────────┐     ┌─────────┐
│      │█████████│█████│         │
│      │█████████│█████│         │
│      │█████████│█████│         │
│      └─────────┘     └─────────┘
│
│      Result = Entire Left Table (A)
│             + Matching Rows from Right Table (B)
│
├─ Data Source
│   ├─ Primary Data Source   → Left Table (A)
│   └─ Secondary Data Source → Right Table (B)
│
├─ Syntax
│
│   SELECT *
│   FROM A
│   LEFT JOIN B
│      ON A.Key = B.Key;
│
├─ Key Notes
│   ├─ Returns every row from the Left table.
│   ├─ Matching rows are returned from the Right table.
│   ├─ Non-matching Right table columns contain NULL.
│   └─ LEFT JOIN and LEFT OUTER JOIN are equivalent.
│
└─ Important Note
    ├─ The order of the tables is important.
    ├─ The first table becomes the Left table.
    └─ Swapping the tables changes the result.

---------------------------------------------------------------------------
Right Join
│
├─ Returns all rows from the Right table.
├─ Returns only the matching rows from the Left table.
├─ If no match exists in the Left table,
│  NULL values are returned for the Left table columns.
│
├─ Venn Diagram
│
│          A               B
│      ┌─────────┐     ┌─────────┐
│      │         │█████│█████████│
│      │         │█████│█████████│
│      │         │█████│█████████│
│      └─────────┘     └─────────┘
│
│      Result = Entire Right Table (B)
│             + Matching Rows from Left Table (A)
│
├─ Data Source
│   ├─ Primary Data Source   → Right Table (B)
│   └─ Secondary Data Source → Left Table (A)
│
├─ Syntax
│
│   SELECT *
│   FROM A
│   RIGHT JOIN B
│      ON A.Key = B.Key;
│
├─ Key Notes
│   ├─ Returns every row from the Right table.
│   ├─ Matching rows are returned from the Left table.
│   ├─ Non-matching Left table columns contain NULL.
│   └─ RIGHT JOIN and RIGHT OUTER JOIN are equivalent.
│
└─ Important Note
    ├─ The order of the tables is important.
    ├─ The second table becomes the Right table.
    └─ Swapping the tables changes the result.

---------------------------------------------------------------------------
Alternative to RIGHT JOIN (Using LEFT JOIN)
│
├─ A RIGHT JOIN can always be rewritten as a LEFT JOIN.
├─ Simply swap the order of the tables.
├─ The result remains exactly the same.
│
├─ RIGHT JOIN
│
│   SELECT *
│   FROM A
│   RIGHT JOIN B
│      ON A.Key = B.Key;
│
├─ Equivalent LEFT JOIN
│
│   SELECT *
│   FROM B
│   LEFT JOIN A
│      ON A.Key = B.Key;
│
├─ Why Developers Prefer LEFT JOIN
│
│   ├─ More common in real-world projects.
│   ├─ Easier to read and understand.
│   ├─ Keeps the primary table on the left.
│   ├─ Provides a consistent coding style.
│   └─ Avoids mixing LEFT JOIN and RIGHT JOIN in queries.
│
└─Key Notes
    ├─ RIGHT JOIN and LEFT JOIN are functionally equivalent.
    ├─ Swap the table order to convert RIGHT JOIN to LEFT JOIN.
    ├─ The returned result set does not change.
    └─ Most developers use LEFT JOIN by convention.

---------------------------------------------------------------------------
Full Join
│
├─ Returns all rows from both tables.
├─ Returns the matching rows between both tables.
├─ If no match exists,
│  NULL values are returned for the missing table columns.
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
│      Result = Entire Table A
│             + Entire Table B
│
├─ Data Source
│   ├─ Primary Data Source   → Both Tables
│   └─ Secondary Data Source → None
│
├─ Syntax
│
│   SELECT *
│   FROM A
│   FULL JOIN B
│      ON A.Key = B.Key;
│
├─ Key Notes
│   ├─ Returns every row from both tables.
│   ├─ Matching rows are combined into one result.
│   ├─ Non-matching rows from either table contain NULL
│   │  values for the missing table columns.
│   └─ FULL JOIN and FULL OUTER JOIN are equivalent.
│
└─ Important Note
    ├─ The order of the tables does not affect the result.
    └─ A FULL JOIN B = B FULL JOIN A

---------------------------------------------------------------------------
Left Anti Join
│
├─ Returns rows from the Left table that have
│  no matching row in the Right table.
├─ Matching rows are excluded.
├─ Commonly used to find missing or unmatched records.
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
│      ░ = Excluded (Matching Rows)
│
│      Result = Left Table Only
│             (Excluding the Matching Rows)
│
├─ Data Source
│   └─ Primary Data Source → Left Table (A)
│
├─ Syntax
│
│   SELECT *
│   FROM A
│   LEFT JOIN B
│      ON A.Key = B.Key
│   WHERE B.Key IS NULL;
│
├─ Key Notes
│   ├─ Returns only unmatched rows from the Left table.
│   ├─ Matching rows are filtered out.
│   ├─ Uses LEFT JOIN with a WHERE clause.
│   └─ SQL has no dedicated LEFT ANTI JOIN keyword.
│
└─ Important Note
    ├─ The order of the tables is important.
    ├─ The first table becomes the Left table.
    └─ Swapping the tables changes the result.

---------------------------------------------------------------------------
Right Anti Join
│
├─ Returns rows from the Right table that have
│  no matching row in the Left table.
├─ Matching rows are excluded.
├─ Commonly used to find missing or unmatched records.
│
├─ Venn Diagram
│
│          A               B
│      ┌─────────┐     ┌─────────┐
│      │         │     │█████████│
│      │         │░░░░░│█████████│
│      │         │     │█████████│
│      └─────────┘     └─────────┘
│
│      █ = Returned
│      ░ = Excluded (Matching Rows)
│
│      Result = Right Table Only
│             (Excluding the Matching Rows)
│
├─ Data Source
│   └─ Primary Data Source → Right Table (B)
│
├─ Syntax
│
│   SELECT *
│   FROM A
│   RIGHT JOIN B
│      ON A.Key = B.Key
│   WHERE A.Key IS NULL;
│
├─ Key Notes
│   ├─ Returns only unmatched rows from the Right table.
│   ├─ Matching rows are filtered out.
│   ├─ Uses RIGHT JOIN with a WHERE clause.
│   └─ SQL has no dedicated RIGHT ANTI JOIN keyword.
│
└─ Important Note
    ├─ The order of the tables is important.
    ├─ The second table becomes the Right table.
    └─ Swapping the tables changes the result.

---------------------------------------------------------------------------
Full Anti Join
│
├─ Returns rows that have no matching row
│  in either table.
├─ Matching rows are excluded.
├─ Returns unmatched rows from both tables.
├─ Commonly used to find differences between two tables.
│
├─ Venn Diagram
│
│          A               B
│      ┌─────────┐     ┌─────────┐
│      │█████████│     │█████████│
│      │█████████│░░░░░│█████████│
│      │█████████│     │█████████│
│      └─────────┘     └─────────┘
│
│      █ = Returned
│      ░ = Excluded (Matching Rows)
│
│      Result = Unmatched Rows
│             from Both Tables
│
├─ Data Source
│   └─ Primary Data Source → Both Tables
│
├─ Syntax
│
│   SELECT *
│   FROM A
│   FULL JOIN B
│      ON A.Key = B.Key
│   WHERE A.Key IS NULL
│      OR B.Key IS NULL;
│
├─ Key Notes
│   ├─ Returns unmatched rows from both tables.
│   ├─ Matching rows are filtered out.
│   ├─ Uses FULL JOIN with a WHERE clause.
│   └─ SQL has no dedicated FULL ANTI JOIN keyword.
│
└─ Important Note
    ├─ The order of the tables does not affect the result.
    └─ A FULL JOIN B = B FULL JOIN A

---------------------------------------------------------------------------
Cross Join
│
├─ Returns every possible combination of rows from both tables.
├─ Each row from the Left table is combined with every row from the Right table.
├─ Does not require a matching column or join condition.
│
├─ Venn Diagram
│
│      A               B
│  ┌─────────┐     ┌─────────┐
│  │█████████│     │█████████│
│  │█████████│  ×  │█████████│
│  │█████████│     │█████████│
│  └─────────┘     └─────────┘
│
│  Result = Cartesian Product
│
│
├─ Relationship Diagram
│
│   ┌───────────┐      ×      ┌───────────┐
│   │  Table A  │             │  Table B  │
│   ├───────────┤             ├───────────┤
│   │ ● A1      │             │ ● B1      │
│   │ ● A2      │             │ ● B2      │
│   └───────────┘             │ ● B3      │
│                             └───────────┘
│
│   A1 → B1, B2, B3
│   A2 → B1, B2, B3
│
│   Result = Every Possible Combination
│   Total Rows = Rows in A × Rows in B
│
├─ Data Source
│   └─ Primary Data Source → Both Tables
│
├─ Syntax
│
│   SELECT *
│   FROM A
│   CROSS JOIN B;
│
├─ Key Notes
│   ├─ No ON clause is required.
│   ├─ Every row from A is paired with every row from B.
│   ├─ Produces the Cartesian Product.
│   └─ Result Size = (Rows in A) × (Rows in B)
│
└─ Important Note
    ├─ The order of the tables does not affect the number of rows returned.
    └─ CROSS JOIN can generate very large result sets.


---------------------------------------------------------------------------
Choosing the Right JOIN
│
├─ Choosing the correct JOIN depends on
│  which rows you want in the final result.
│
├─ Decision Tree
│
│              What rows do you need?
│
│        ┌───────────────┼──────────────────────┐
│        │               │                      │
│        ▼               ▼                      ▼
│  Only Matching      All Rows           Only Unmatching
│        │               │                      │
│        │        ┌──────┴──────┐         ┌─────┴─────┐
│        │        │             │         │           │
│        ▼        ▼             ▼         ▼           ▼
│  INNER JOIN  One Side    Both Sides  One Side  Both Sides
│                 │             │         │           │
│                 ▼             ▼         ▼           ▼
│            LEFT JOIN     FULL JOIN   LEFT ANTI   FULL ANTI
│                                        JOIN        JOIN
│
├─ When to Use
│
├─ [INNER JOIN]
│   └─ Use when only matching records are required.
│
├─ [LEFT JOIN]
│   ├─ Use when one table is the Master Table.
│   ├─ Every row from the Master Table must be returned.
│   └─ Matching rows are retrieved from the other table.
│
├─ [FULL JOIN]
│   ├─ Use when both tables are equally important.
│   ├─ Return every row from both tables.
│   └─ Include both matched and unmatched rows.
│
├─ [LEFT ANTI JOIN]
│   ├─ Use when one table is the Master Table.
│   ├─ Find rows missing from the other table.
│   └─ Return only unmatched rows from the Master Table.
│
└─ [FULL ANTI JOIN]
    ├─ Use when both tables are equally important.
    ├─ Find differences between both tables.
    └─ Return unmatched rows from both tables.

---------------------------------------------------------------------------
Joining Multiple Tables
│
├─ SQL allows joining two or more tables in a single query.
├─ Multiple JOINs are used to retrieve related data from several tables.
├─ Each JOIN combines one additional table with the current result set.
│
├─ JOIN Types
│
├─ [INNER JOIN]
│   ├─ Returns only rows that match in all joined tables.
│   └─ Best when matching data is required from every table.
│
├─ [LEFT JOIN]
│   ├─ The first table is the Master Table.
│   ├─ Returns every row from the Master Table.
│   └─ Matching rows are returned from the remaining tables.
│
├─ [FULL JOIN]
│   ├─ Returns every row from every table.
│   ├─ Matching rows are combined.
│   └─ Unmatched rows contain NULL values.
│
├─ *WHERE Clause
│   ├─ Filters the result after all JOINs have been completed.
│   ├─ Used to return only the rows required in the final output.
│   └─ Does not determine how tables are joined.
│
├─ Key Notes
│   ├─ Multiple JOINs can be combined in a single query.
│   ├─ Different JOIN types can be mixed in the same query.
│   ├─ Each JOIN uses its own ON condition.
│   └─ The JOIN type and WHERE clause together determine the final result.
│
└─ Important Note
    ├─ INNER JOIN requires matching rows in all tables.
    ├─ LEFT JOIN preserves the Master Table.
    ├─ FULL JOIN preserves all tables.
    └─ Use WHERE to return only the required records.

---------------------------------------------------------------------------
Entity Relationship Diagram (ERD)
│
├─ An ER Diagram is a visual representation of the relationships between database tables.
├─ It helps understand how tables are connected.
├─ ER Diagrams make writing JOIN queries easier, especially with multiple tables.
│
├─ Why Use an ER Diagram?
│
├─ [Understand Relationships]
│   ├─ Shows how tables are related.
│   └─ Identifies Primary Key and Foreign Key relationships.
│
├─ [Simplify JOINs]
│   ├─ Makes complex JOIN queries easier.
│   └─ Helps determine the correct JOIN path.
│
├─ [Database Navigation]
│   ├─ Shows which tables can be joined.
│   └─ Helps locate the required data.
│
├─ Components
│
├─ Tables (Entities)
├─ Columns (Attributes)
├─ Primary Keys (PK)
├─ Foreign Keys (FK)
├─ Relationships
│   ├─ One-to-One (1:1)
│   ├─ One-to-Many (1:M)
│   └─ Many-to-Many (M:N)
│
├─ Key Notes
│   ├─ Most databases provide an ER Diagram.
│   ├─ Always study the ER Diagram before writing complex JOIN queries.
│   ├─ Tables are joined using PK–FK relationships.
│   └─ Understanding the ER Diagram makes writing SQL much easier.
│
└─ Important Note
    └─ An ER Diagram does not store data. It only describes how tables
       are related.

---------------------------------------------------------------------------

*/
