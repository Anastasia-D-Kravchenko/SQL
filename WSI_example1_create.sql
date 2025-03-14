-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-14 12:09:18.895

-- tables
-- Table: Human
CREATE TABLE Human (
    PESEL char(11)  NOT NULL,
    Name varchar2(20)  NOT NULL,
    Surname varchar2(20)  NOT NULL,
    CONSTRAINT Human_pk PRIMARY KEY (PESEL)
) ;

-- Table: Owner
CREATE TABLE Owner (
    Human_PESEL char(11)  NOT NULL,
    CONSTRAINT Owner_pk PRIMARY KEY (Human_PESEL)
) ;

-- Table: Owns
CREATE TABLE Owns (
    Pet integer  NOT NULL,
    Owner char(11)  NOT NULL,
    CONSTRAINT Owns_pk PRIMARY KEY (Pet,Owner)
) ;

-- Table: Pet
CREATE TABLE Pet (
    Id integer  NOT NULL,
    Name varchar2(20)  NOT NULL,
    Father integer  NULL,
    Mother integer  NULL,
    Vet char(11)  NULL,
    CONSTRAINT Pet_pk PRIMARY KEY (Id)
) ;

-- Table: Vet
CREATE TABLE Vet (
    Human_PESEL char(11)  NOT NULL,
    CONSTRAINT Vet_pk PRIMARY KEY (Human_PESEL)
) ;

-- foreign keys
-- Reference: Owner_Human (table: Owner)
ALTER TABLE Owner ADD CONSTRAINT Owner_Human
    FOREIGN KEY (Human_PESEL)
    REFERENCES Human (PESEL);

-- Reference: Owns_Owner (table: Owns)
ALTER TABLE Owns ADD CONSTRAINT Owns_Owner
    FOREIGN KEY (Owner)
    REFERENCES Owner (Human_PESEL);

-- Reference: Owns_Pet (table: Owns)
ALTER TABLE Owns ADD CONSTRAINT Owns_Pet
    FOREIGN KEY (Pet)
    REFERENCES Pet (Id);

-- Reference: Pet_Father (table: Pet)
ALTER TABLE Pet ADD CONSTRAINT Pet_Father
    FOREIGN KEY (Father)
    REFERENCES Pet (Id);

-- Reference: Pet_Mother (table: Pet)
ALTER TABLE Pet ADD CONSTRAINT Pet_Mother
    FOREIGN KEY (Mother)
    REFERENCES Pet (Id);

-- Reference: Pet_Vet (table: Pet)
ALTER TABLE Pet ADD CONSTRAINT Pet_Vet
    FOREIGN KEY (Vet)
    REFERENCES Vet (Human_PESEL);

-- Reference: Vet_Human (table: Vet)
ALTER TABLE Vet ADD CONSTRAINT Vet_Human
    FOREIGN KEY (Human_PESEL)
    REFERENCES Human (PESEL);

-- End of file.

