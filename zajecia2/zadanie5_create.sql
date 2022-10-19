-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-19 15:30:34.784

-- tables
-- Table: DimRating
CREATE TABLE DimRating (
    id int  NOT NULL,
    rating int  NOT NULL,
    DimRatingDate_id int  NOT NULL,
    CONSTRAINT DimRating_pk PRIMARY KEY (id)
);

-- Table: DimRatingDate
CREATE TABLE DimRatingDate (
    id int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    year int  NOT NULL,
    CONSTRAINT DimRatingDate_pk PRIMARY KEY (id)
);

-- Table: FactEmployee
CREATE TABLE FactEmployee (
    id int  NOT NULL,
    PESEL text  NOT NULL,
    address text  NOT NULL,
    salary float  NOT NULL,
    DimRating_id int  NOT NULL,
    CONSTRAINT FactEmployee_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: DimRating_DimRatingDate (table: DimRating)
ALTER TABLE DimRating ADD CONSTRAINT DimRating_DimRatingDate
    FOREIGN KEY (DimRatingDate_id)
    REFERENCES DimRatingDate (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactEmployee_DimRating (table: FactEmployee)
ALTER TABLE FactEmployee ADD CONSTRAINT FactEmployee_DimRating
    FOREIGN KEY (DimRating_id)
    REFERENCES DimRating (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

