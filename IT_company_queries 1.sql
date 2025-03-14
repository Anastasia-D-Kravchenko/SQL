--List all projects:
SELECT * FROM Projects;

--List all tasks for Project Gamma:
SELECT * FROM Tasks WHERE ProjectID = 0;

--List all team members with an hourly rate greater than 60:
SELECT * FROM TeamMembers WHERE HourlyRate > 60;

--List all tasks assigned to David, including project details:
SELECT t.TaskName, t.DueDate, p.ProjectName
FROM Tasks t
         JOIN Projects p ON t.ProjectID = p.ProjectID
WHERE t.AssignedTo = 'David';

--List all team members working on Project Delta, along with their tasks:
SELECT tm.TeamMemberName, t.TaskName
FROM TeamMembers tm
         JOIN Tasks t ON tm.ProjectID = t.ProjectID
WHERE tm.ProjectID = 1;

--Calculate the total hours spent on Project Epsilon:
SELECT SUM(HoursSpent) AS TotalHours
FROM TimeTracking tt
         JOIN Tasks t ON tt.TaskID = t.TaskID
WHERE t.ProjectID = 2;

--Find the team member who has spent the most hours on Project Zeta:
SELECT tm.TeamMemberName, SUM(tt.HoursSpent) AS TotalHours
FROM TimeTracking tt
    JOIN TeamMembers tm ON tt.TeamMemberID = tm.TeamMemberID
    JOIN Tasks t ON tt.TaskID = t.TaskID
WHERE t.ProjectID = 3
GROUP BY tm.TeamMemberName
ORDER BY TotalHours DESC
FETCH FIRST 1 ROW ONLY;

--List all projects that are currently in progress:
SELECT * FROM Projects WHERE ProjectStatus = 'In Progress';


--Find the average hourly rate of team members working on Project Iota:
SELECT AVG(HourlyRate) AS AverageHourlyRate
FROM TeamMembers
WHERE ProjectID = 6;