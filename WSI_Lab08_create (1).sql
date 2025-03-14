-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-14 12:09:18.8

-- tables
-- Table: Match
CREATE TABLE Match (
    Id integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    "Date" date  NOT NULL,
    County varchar2(30)  NOT NULL,
    City varchar2(30)  NOT NULL,
    IdTeam1 integer  NOT NULL,
    IdTeam2 integer  NOT NULL,
    CONSTRAINT Match_pk PRIMARY KEY (Id)
) ;

-- Table: Player
CREATE TABLE Player (
    Id integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Surname varchar2(30)  NOT NULL,
    Team_Id integer  NOT NULL,
    CONSTRAINT Player_pk PRIMARY KEY (Id)
) ;

-- Table: PlayerMatch
CREATE TABLE PlayerMatch (
    Match_Id integer  NOT NULL,
    Player_Id integer  NOT NULL,
    RedCard integer  NOT NULL,
    CONSTRAINT PlayerMatch_pk PRIMARY KEY (Match_Id,Player_Id)
) ;

-- Table: Team
CREATE TABLE Team (
    Id integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    CONSTRAINT Team_pk PRIMARY KEY (Id)
) ;

-- foreign keys
-- Reference: Match_Team1 (table: Match)
ALTER TABLE Match ADD CONSTRAINT Match_Team1
    FOREIGN KEY (IdTeam1)
    REFERENCES Team (Id);

-- Reference: Match_Team2 (table: Match)
ALTER TABLE Match ADD CONSTRAINT Match_Team2
    FOREIGN KEY (IdTeam2)
    REFERENCES Team (Id);

-- Reference: PlayerMatch_Match (table: PlayerMatch)
ALTER TABLE PlayerMatch ADD CONSTRAINT PlayerMatch_Match
    FOREIGN KEY (Match_Id)
    REFERENCES Match (Id);

-- Reference: PlayerMatch_Player (table: PlayerMatch)
ALTER TABLE PlayerMatch ADD CONSTRAINT PlayerMatch_Player
    FOREIGN KEY (Player_Id)
    REFERENCES Player (Id);

-- Reference: Player_Team (table: Player)
ALTER TABLE Player ADD CONSTRAINT Player_Team
    FOREIGN KEY (Team_Id)
    REFERENCES Team (Id);

-- End of file.

