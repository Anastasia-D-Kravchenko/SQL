-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-14 12:09:17.849

-- tables
-- Table: City
CREATE TABLE City (
    Id integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    IdCountry integer  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (Id)
) ;

-- Table: Continent
CREATE TABLE Continent (
    Id integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    IdCountry integer  NOT NULL,
    CONSTRAINT Continent_pk PRIMARY KEY (Id)
) ;

-- Table: Country
CREATE TABLE Country (
    Id integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (Id)
) ;

-- Table: Language
CREATE TABLE Language (
    Id integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    CONSTRAINT Language_pk PRIMARY KEY (Id)
) ;

-- Table: OfficialLanguage
CREATE TABLE OfficialLanguage (
    Country_Id integer  NOT NULL,
    Language_Id integer  NOT NULL,
    PercentageSpeakers integer  NOT NULL,
    CONSTRAINT OfficialLanguage_pk PRIMARY KEY (Country_Id,Language_Id)
) ;

-- foreign keys
-- Reference: City_Country (table: City)
ALTER TABLE City ADD CONSTRAINT City_Country
    FOREIGN KEY (IdCountry)
    REFERENCES Country (Id);

-- Reference: Continent_Country (table: Continent)
ALTER TABLE Continent ADD CONSTRAINT Continent_Country
    FOREIGN KEY (IdCountry)
    REFERENCES Country (Id);

-- Reference: OfficialLanguage_Country (table: OfficialLanguage)
ALTER TABLE OfficialLanguage ADD CONSTRAINT OfficialLanguage_Country
    FOREIGN KEY (Country_Id)
    REFERENCES Country (Id);

-- Reference: OfficialLanguage_Language (table: OfficialLanguage)
ALTER TABLE OfficialLanguage ADD CONSTRAINT OfficialLanguage_Language
    FOREIGN KEY (Language_Id)
    REFERENCES Language (Id);

-- End of file.

