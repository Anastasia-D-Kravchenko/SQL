-- Task 1
SELECT Ename, Mgr, Deptno
FROM Emp;

-- Task 2
SELECT *
FROM Emp;

-- Task 3
SELECT Ename, 12 * Sal AS Annual_Salary
FROM Emp;

-- Task 4
SELECT Ename, 12 * (Sal + 250) AS Annual_Salary_With_Raise
FROM Emp;

-- Task 5
SELECT Deptno
FROM Emp;

-- Task 6
SELECT DISTINCT Deptno
FROM Emp;

-- Task 7
SELECT *
FROM Emp
ORDER BY Ename;

-- Task 8
SELECT *
FROM Emp
ORDER BY Hiredate DESC;

-- Task 9
SELECT Ename, Empno, Job, Deptno
FROM Emp
WHERE Job = 'CLERK';

-- Task 10
SELECT Deptno, Dname
FROM Dept
WHERE Deptno > 20;

-- Task 11
SELECT *
FROM Emp
WHERE Comm > Sal;

-- Task 12
SELECT *
FROM Emp
WHERE Sal BETWEEN 1000 AND 2000;

-- Task 13
SELECT *
FROM Emp
WHERE Ename LIKE 'S%';

-- Task 14
SELECT *
FROM Emp
WHERE Job = 'CLERK' AND (Sal < 1000 OR Sal > 2000);

-- Task 15
SELECT *
FROM Emp
WHERE (Job = 'MANAGER' AND Sal > 1500) OR Job = 'SALESMAN';

-- Task 16
SELECT *
FROM Emp
WHERE (Job = 'MANAGER') OR (Job = 'CLERK' AND Deptno = 10);

-- Task 17
SELECT Deptno, Dname
FROM Dept
ORDER BY Deptno;