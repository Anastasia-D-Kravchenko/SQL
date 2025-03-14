-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-03 12:24:44.272

-- tables
-- Table: BorderWithContient
CREATE TABLE BorderWithContient (
    Sea_Id integer  NOT NULL,
    Continent_Id integer  NOT NULL,
    CONSTRAINT BorderWithContient_pk PRIMARY KEY (Sea_Id,Continent_Id)
) ;

-- Table: City
CREATE TABLE City (
    Id integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    Country_Id integer  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (Id)
) ;

-- Table: Continent
CREATE TABLE Continent (
    Id integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    CONSTRAINT Continent_pk PRIMARY KEY (Id)
) ;

-- Table: Country
CREATE TABLE Country (
    Id integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (Id)
) ;

-- Table: CountryContinent
CREATE TABLE CountryContinent (
    Continents_Id integer  NOT NULL,
    Country_Id integer  NOT NULL,
    CONSTRAINT CountryContinent_pk PRIMARY KEY (Continents_Id,Country_Id)
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
    CONSTRAINT OfficialLanguage_pk PRIMARY KEY (Country_Id,Language_Id)
) ;

-- Table: Sea
CREATE TABLE Sea (
    Id integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    CONSTRAINT Sea_pk PRIMARY KEY (Id)
) ;

-- Table: SeeBorder
CREATE TABLE SeeBorder (
    Country_Id integer  NOT NULL,
    Sea_Id integer  NOT NULL,
    SeaLength number(6,2)  NOT NULL,
    CONSTRAINT SeeBorder_pk PRIMARY KEY (Country_Id,Sea_Id)
) ;

-- foreign keys
-- Reference: BorderWithContient_Continent (table: BorderWithContient)
ALTER TABLE BorderWithContient ADD CONSTRAINT BorderWithContient_Continent
    FOREIGN KEY (Continent_Id)
    REFERENCES Continent (Id);

-- Reference: BorderWithContient_Sea (table: BorderWithContient)
ALTER TABLE BorderWithContient ADD CONSTRAINT BorderWithContient_Sea
    FOREIGN KEY (Sea_Id)
    REFERENCES Sea (Id);

-- Reference: BorderWith_Country (table: SeeBorder)
ALTER TABLE SeeBorder ADD CONSTRAINT BorderWith_Country
    FOREIGN KEY (Country_Id)
    REFERENCES Country (Id);

-- Reference: BorderWith_Sea (table: SeeBorder)
ALTER TABLE SeeBorder ADD CONSTRAINT BorderWith_Sea
    FOREIGN KEY (Sea_Id)
    REFERENCES Sea (Id);

-- Reference: City_Country (table: City)
ALTER TABLE City ADD CONSTRAINT City_Country
    FOREIGN KEY (Country_Id)
    REFERENCES Country (Id);

-- Reference: LiesIn_Continents (table: CountryContinent)
ALTER TABLE CountryContinent ADD CONSTRAINT LiesIn_Continents
    FOREIGN KEY (Continents_Id)
    REFERENCES Continent (Id);

-- Reference: LiesIn_Country (table: CountryContinent)
ALTER TABLE CountryContinent ADD CONSTRAINT LiesIn_Country
    FOREIGN KEY (Country_Id)
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

