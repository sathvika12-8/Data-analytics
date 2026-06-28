USE learning_sets ;

-- 1. Show the list of ALL students who enrolled in python or SQL course
SELECT * FROM python_students 
UNION
SELECT * FROM sql_students ;

-- 2. Show the list of ALL students from Python and SOL course including duplicates 
SELECT * FROM  python_students
UNION ALL
SELECT * FROM sql_students ;

-- 3.Find students Both python & SQL students
SELECT * FROM python_students
INTERSECT
SELECT * FROM sql_students ;

-- 4.Find students who enrolled in python but NOT in SQL
SELECT * FROM python_students
EXCEPT
SELECT * FROM sql_students ;

-- 5.Find students who enrolled in SQL OR Data Science but remove duplicates.
SELECT * FROM sql_students
UNION 
SELECT * FROM data_science_students ;

-- 6.Find students who are enrolled in ALL THREE courses
SELECT * FROM python_students
INTERSECT 
SELECT * FROM sql_students
INTERSECT
SELECT * FROM data_science_students ;