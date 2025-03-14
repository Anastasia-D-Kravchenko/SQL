-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-02-05 16:34:07.746

-- tables
-- Table: Car
CREATE TABLE Car (
    plateNumber char(4)  NOT NULL,
    brand varchar2(20)  NOT NULL,
    CONSTRAINT Car_pk PRIMARY KEY (plateNumber)
) ;

-- Table: Client
CREATE TABLE Client (
    Human_PESEL char(11)  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY (Human_PESEL)
) ;

-- Table: Group
CREATE TABLE "Group" (
    PESEL char(11)  NOT NULL,
    idService integer  NOT NULL,
    plateNumber char(4)  NOT NULL,
    CONSTRAINT Group_pk PRIMARY KEY (PESEL,idService,plateNumber)
) ;

-- Table: Human
CREATE TABLE Human (
    PESEL char(11)  NOT NULL,
    Name varchar2(20)  NOT NULL,
    Surname varchar2(20)  NOT NULL,
    CONSTRAINT Human_pk PRIMARY KEY (PESEL)
) ;

-- Table: Owner
CREATE TABLE Owner (
    PESEL char(11)  NOT NULL,
    plateNumber char(4)  NOT NULL,
    CONSTRAINT Owner_pk PRIMARY KEY (PESEL,plateNumber)
) ;

-- Table: Service
CREATE TABLE Service (
    Id integer  NOT NULL,
    description varchar2(100)  NOT NULL,
    "date" date  NOT NULL,
    plateNumber char(4)  NOT NULL,
    CONSTRAINT Service_pk PRIMARY KEY (Id,plateNumber)
) ;

-- Table: Worker
CREATE TABLE Worker (
    Human_PESEL char(11)  NOT NULL,
    Salary varchar2(6)  NOT NULL,
    employmentDate date  NOT NULL,
    dismissalDate date  NULL,
    CONSTRAINT Worker_pk PRIMARY KEY (Human_PESEL)
) ;

-- foreign keys
-- Reference: Client_Human (table: Client)
ALTER TABLE Client ADD CONSTRAINT Client_Human
    FOREIGN KEY (Human_PESEL)
    REFERENCES Human (PESEL);

-- Reference: Group_Service (table: Group)
ALTER TABLE "Group" ADD CONSTRAINT Group_Service
    FOREIGN KEY (idService,plateNumber)
    REFERENCES Service (Id,plateNumber);

-- Reference: Group_Worker (table: Group)
ALTER TABLE "Group" ADD CONSTRAINT Group_Worker
    FOREIGN KEY (PESEL)
    REFERENCES Worker (Human_PESEL);

-- Reference: Owner_Car (table: Owner)
ALTER TABLE Owner ADD CONSTRAINT Owner_Car
    FOREIGN KEY (plateNumber)
    REFERENCES Car (plateNumber);

-- Reference: Owner_Client (table: Owner)
ALTER TABLE Owner ADD CONSTRAINT Owner_Client
    FOREIGN KEY (PESEL)
    REFERENCES Client (Human_PESEL);

-- Reference: Service_Car (table: Service)
ALTER TABLE Service ADD CONSTRAINT Service_Car
    FOREIGN KEY (plateNumber)
    REFERENCES Car (plateNumber);

-- Reference: Worker_Human (table: Worker)
ALTER TABLE Worker ADD CONSTRAINT Worker_Human
    FOREIGN KEY (Human_PESEL)
    REFERENCES Human (PESEL);

-- End of file.

