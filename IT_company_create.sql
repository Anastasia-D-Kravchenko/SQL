-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-01-20 15:25:56.28

-- tables
-- Table: Projects
CREATE TABLE Projects (
    ProjectID int  NOT NULL,
    ProjectName varchar2(50)  NOT NULL,
    StartDate date  NOT NULL,
    EndDate date  NOT NULL,
    ProjectManager int  NOT NULL,
    ProjectStatus varchar2(20)  NOT NULL,
    Budget decimal(10,2)  NOT NULL,
    ClientName varchar2(50)  NOT NULL,
    ClientContact varchar2(50)  NOT NULL,
    CONSTRAINT Projects_pk PRIMARY KEY (ProjectID)
) ;

-- Table: Tasks
CREATE TABLE Tasks (
    TaskID int  NOT NULL,
    TaskName varchar2(50)  NOT NULL,
    TaskDescription varchar2(200)  NOT NULL,
    DueDate date  NOT NULL,
    Priority int  NOT NULL,
    AssignedTo int  NOT NULL,
    ProjectID int  NOT NULL,
    CONSTRAINT Tasks_pk PRIMARY KEY (TaskID)
) ;

-- Table: TeamMembers
CREATE TABLE TeamMembers (
    TeamMemberID int  NOT NULL,
    TeamMemberName varchar2(50)  NOT NULL,
    TeamMemberRole varchar2(50)  NOT NULL,
    SkillSet varchar2(100)  NOT NULL,
    HourlyRate decimal(10,2)  NOT NULL,
    ProjectID int  NOT NULL,
    CONSTRAINT TeamMembers_pk PRIMARY KEY (TeamMemberID)
) ;

-- Table: TimeTracking
CREATE TABLE TimeTracking (
    TeamMemberID int  NOT NULL,
    TaskID int  NOT NULL,
    "Date" date  NOT NULL,
    HoursSpent decimal(10,2)  NOT NULL,
    CONSTRAINT TimeTracking_pk PRIMARY KEY (TeamMemberID,TaskID)
) ;

-- foreign keys
-- Reference: FK_0 (table: Tasks)
ALTER TABLE Tasks ADD CONSTRAINT FK_0
    FOREIGN KEY (ProjectID)
    REFERENCES Projects (ProjectID);

-- Reference: FK_1 (table: TeamMembers)
ALTER TABLE TeamMembers ADD CONSTRAINT FK_1
    FOREIGN KEY (ProjectID)
    REFERENCES Projects (ProjectID);

-- Reference: FK_2 (table: TimeTracking)
ALTER TABLE TimeTracking ADD CONSTRAINT FK_2
    FOREIGN KEY (TeamMemberID)
    REFERENCES TeamMembers (TeamMemberID);

-- Reference: FK_3 (table: TimeTracking)
ALTER TABLE TimeTracking ADD CONSTRAINT FK_3
    FOREIGN KEY (TaskID)
    REFERENCES Tasks (TaskID);

-- Reference: Projects_TeamMembers (table: Projects)
ALTER TABLE Projects ADD CONSTRAINT Projects_TeamMembers
    FOREIGN KEY (ProjectManager)
    REFERENCES TeamMembers (TeamMemberID);

-- Reference: Tasks_TeamMembers (table: Tasks)
ALTER TABLE Tasks ADD CONSTRAINT Tasks_TeamMembers
    FOREIGN KEY (AssignedTo)
    REFERENCES TeamMembers (TeamMemberID);

-- End of file.

