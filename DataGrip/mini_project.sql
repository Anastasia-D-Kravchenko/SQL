-- Create the database

CREATE DATABASE mini;

-- Create the tables

CREATE TABLE Projects (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(50),
StartDate DATE,
EndDate DATE,
ProjectManager VARCHAR(50),
ProjectStatus VARCHAR(20),
Budget DECIMAL(10,2),
ClientName VARCHAR(50),
ClientContact VARCHAR(50)
);

CREATE TABLE Tasks (
TaskID INT PRIMARY KEY,
TaskName VARCHAR(50),
TaskDescription VARCHAR(200),
DueDate DATE,
Priority INT,
AssignedTo VARCHAR(50),
ProjectID INT,
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

CREATE TABLE TeamMembers (
 TeamMemberID INT PRIMARY KEY,
 TeamMemberName VARCHAR(50),
 TeamMemberRole VARCHAR(50),
 SkillSet VARCHAR(100),
 HourlyRate DECIMAL(10,2),
 ProjectID INT,
 FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

CREATE TABLE TimeTracking (
 TimeTrackingID INT PRIMARY KEY,
 TeamMemberID INT,
 TaskID INT,
 "Date" DATE,
 HoursSpent DECIMAL(10,2),
 FOREIGN KEY (TeamMemberID) REFERENCES TeamMembers(TeamMemberID),
 FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID)
);

-- Create the content

INSERT INTO Projects VALUES (
  0,
  'Project Gamma',
  TO_DATE('2023-11-01', 'YYYY-MM-DD'),
  TO_DATE('2024-03-31', 'YYYY-MM-DD'),
  'Michael Johnson',
  'Completed',
  120000.0,
  'Tech Innovations',
  'michael.johnson@techinnovations.com'
  );
INSERT INTO Projects VALUES (
  1,
  'Project Delta',
  TO_DATE('2024-02-10', 'YYYY-MM-DD'),
  TO_DATE('2024-08-10', 'YYYY-MM-DD'),
  'Emily Brown',
  'In Progress',
  95000.0,
  'Zenith Industries',
  'emily.brown@zenithindustries.com'
  );
INSERT INTO Projects VALUES (
  2,
  'Project Epsilon',
  TO_DATE('2023-12-01', 'YYYY-MM-DD'),
  TO_DATE('2024-05-31', 'YYYY-MM-DD'),
  'David Lee',
  'Planned',
  75000.0,
  'Quantum Leap',
  'david.lee@quantumleap.com'
  );
INSERT INTO Projects VALUES (
  3,
  'Project Zeta',
  TO_DATE('2024-03-01', 'YYYY-MM-DD'),
  TO_DATE('2024-09-30', 'YYYY-MM-DD'),
  'Sarah Kim',
  'In Progress',
  110000.0,
  'Nova Systems',
  'sarah.kim@novasystems.com'
  );
INSERT INTO Projects VALUES (
  4,
  'Project Eta',
  TO_DATE('2023-12-15', 'YYYY-MM-DD'),
  TO_DATE('2024-06-15', 'YYYY-MM-DD'),
  'Thomas Chen',
  'Completed',
  130000.0,
  'Apex Solutions',
  'thomas.chen@apexsolutions.com'
  );
INSERT INTO Projects VALUES (
  5,
  'Project Theta',
  TO_DATE('2024-04-01', 'YYYY-MM-DD'),
  TO_DATE('2024-10-31', 'YYYY-MM-DD'),
  'Olivia Wong',
  'Planned',
  85000.0,
  'Stellar Enterprises',
  'olivia.wong@stellarenterprises.com'
  );
INSERT INTO Projects VALUES (
  6,
  'Project Iota',
  TO_DATE('2023-11-15', 'YYYY-MM-DD'),
  TO_DATE('2024-04-15', 'YYYY-MM-DD'),
  'Benjamin Harris',
  'In Progress',
  90000.0,
  'Zenith Tech',
  'benjamin.harris@zenithtech.com'
  );
INSERT INTO Projects VALUES (
  7,
  'Project Kappa',
  TO_DATE('2024-02-20', 'YYYY-MM-DD'),
  TO_DATE('2024-09-20', 'YYYY-MM-DD'),
  'Chloe Patel',
  'Planned',
  105000.0,
  'Nova Innovations',
  'chloe.patel@novainnovations.com'
  );

-------------------------------------------
SELECT * FROM Projects;
-------------------------------------------

INSERT INTO Tasks VALUES (
   104,
   'Task D',
   'Write unit tests for module A',
   TO_DATE('2024-12-13', 'YYYY-MM-DD'),
   2,
   'David',
   0
  );

INSERT INTO Tasks VALUES (
   105,
   'Task E',
   'Deploy new version to production',
   TO_DATE('2025-01-20', 'YYYY-MM-DD'),
   4,
   'Emily',
   1
  );

INSERT INTO Tasks VALUES (
   106,
   'Task F',
   'Optimize database queries',
   TO_DATE('2024-06-05', 'YYYY-MM-DD'),
   3,
   'Frank',
   2
  );

INSERT INTO Tasks VALUES (
   107,
   'Task G',
   'Integrate with third-party API',
   TO_DATE('2024-07-18', 'YYYY-MM-DD'),
   1,
   'Grace',
   3
  );

INSERT INTO Tasks VALUES (
   108,
   'Task H',
   'Fix security vulnerability',
   TO_DATE('2024-08-01', 'YYYY-MM-DD'),
   5,
   'Henry',
   4
  );

INSERT INTO Tasks VALUES (
   109,
   'Task I',
   'Create user documentation',
   TO_DATE('2024-09-10', 'YYYY-MM-DD'),
   2,
   'Ivy',
   5
  );

INSERT INTO Tasks VALUES (
   110,
   'Task J',
   'Implement new feature request',
   TO_DATE('2024-10-25', 'YYYY-MM-DD'),
   3,
   'Jack',
   6
  );

INSERT INTO Tasks VALUES (
   111,
   'Task K',
   'Refactor legacy code',
   TO_DATE('2024-11-15', 'YYYY-MM-DD'),
   4,
   'Kate',
   7
  );

-------------------------------------------
SELECT * FROM Tasks;
-------------------------------------------


INSERT INTO TeamMembers VALUES (
 204,
 'David',
 'Database Administrator',
 'SQL, Oracle',
 55.00,
 3
 );

INSERT INTO TeamMembers VALUES (
 205,
 'Emily',
 'Project Manager',
 'Agile, Scrum',
 70.00,
 4
 );

INSERT INTO TeamMembers VALUES (
 206,
 'Frank',
 'DevOps Engineer',
 'Docker, Kubernetes',
 65.00,
 5
 );

INSERT INTO TeamMembers VALUES (
 207,
 'Grace',
 'Business Analyst',
 'Requirements, Analysis',
 60.00,
 6
 );

INSERT INTO TeamMembers VALUES (
 208,
 'Henry',
 'Security Analyst',
 'Cybersecurity, Penetration Testing',
 75.00,
 1
 );

INSERT INTO TeamMembers VALUES (
 211,
 'Kate',
 'Product Owner',
 'Product Management, Agile',
 75.00,
 0
 );

INSERT INTO TeamMembers VALUES (
 212,
 'Kyle',
 'Technical Writer',
 'Documentation, Content Creation',
 50.00,
 1
 );

-------------------------------------------
SELECT * FROM TeamMembers;
-------------------------------------------


INSERT INTO TimeTracking VALUES (
  304,
  204,
  104,
  TO_DATE('2024-03-15', 'YYYY-MM-DD'),
  7.0
  );

INSERT INTO TimeTracking VALUES (
  305,
  205,
  105,
  TO_DATE('2024-04-22', 'YYYY-MM-DD'),
  8.5
  );

INSERT INTO TimeTracking VALUES (
  306,
  206,
  106,
  TO_DATE('2024-05-10', 'YYYY-MM-DD'),
  6.25
  );

INSERT INTO TimeTracking VALUES (
  307,
  207,
  107,
  TO_DATE('2024-06-25', 'YYYY-MM-DD'),
  5.75
  );

INSERT INTO TimeTracking VALUES (
  308,
  208,
  108,
  TO_DATE('2024-07-12', 'YYYY-MM-DD'),
  4.5
  );

INSERT INTO TimeTracking VALUES (
  311,
  211,
  111,
  TO_DATE('2024-10-18', 'YYYY-MM-DD'),
  8.0
  );

-------------------------------------------
SELECT * FROM TimeTracking;
-------------------------------------------
