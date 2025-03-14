-- Task 1
SELECT e.ename, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- Task 2
SELECT e.ename, d.dname
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno;

-- Task 3
SELECT e.ename, d.dname
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
ORDER BY e.ename;

-- Task 4
-- From EMP table
SELECT deptno FROM emp;
-- From DEPT table
SELECT deptno FROM dept;
-- From EMP table + DISTINCT
SELECT DISTINCT deptno FROM emp;

-- Task 5
SELECT e.ename, d.loc, d.dname
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE e.sal > 1500;

-- Task 6
SELECT e.ename
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE d.loc = 'DALLAS';

-- Task 7
SELECT * FROM emp;
INSERT INTO emp
VALUES (7839, 'KING', 'PRESIDENT', NULL, '1982-10-17', 5000, NULL, 10);
SELECT * FROM emp;

-- Task 8
SELECT * FROM emp;
UPDATE emp
SET sal = 3000
WHERE empno = 7902;
SELECT * FROM emp;

-- Task 9
SELECT * FROM emp;
DELETE FROM emp
WHERE empno = 7839;
SELECT * FROM emp;

-- Task 10
CREATE TABLE students (
   sid INT PRIMARY KEY,
   sname VARCHAR(50),
   major VARCHAR(50)
);
CREATE TABLE courses (
   cid INT PRIMARY KEY,
   cname VARCHAR(50),
   credits INT
);

-- Task 11
CREATE TABLE enrollments (
   sid INT,
   cid INT,
   grade CHAR(2),
   PRIMARY KEY (sid, cid),
   FOREIGN KEY (sid) REFERENCES students(sid),
   FOREIGN KEY (cid) REFERENCES courses(cid)
);

-- Task 12
INSERT INTO students VALUES (1, 'Alice', 'Computer Science');
INSERT INTO courses VALUES (101, 'Database Systems', 3);
INSERT INTO enrollments VALUES (1, 101, 'A');

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

SELECT s.sname, c.cname, e.grade
FROM students s
INNER JOIN enrollments e ON s.sid = e.sid
INNER JOIN courses c ON e.cid = c.cid;

-- Task 13
DROP TABLE enrollments;