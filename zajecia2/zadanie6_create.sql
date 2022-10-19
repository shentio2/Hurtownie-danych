-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-19 15:43:11.921

-- tables
-- Table: DimDate
CREATE TABLE DimDate (
    id int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    year int  NOT NULL,
    CONSTRAINT DimDate_pk PRIMARY KEY (id)
);

-- Table: DimProductBrand
CREATE TABLE DimProductBrand (
    id int  NOT NULL,
    name int  NOT NULL,
    address Text  NOT NULL,
    CONSTRAINT DimProductBrand_pk PRIMARY KEY (id)
);

-- Table: DimProducts
CREATE TABLE DimProducts (
    id int  NOT NULL,
    name Text  NOT NULL,
    DimProductBrand_id int  NOT NULL,
    valid_from int  NOT NULL,
    valid_to int  NOT NULL,
    CONSTRAINT DimProducts_pk PRIMARY KEY (id)
);

-- Table: DimWarehouse
CREATE TABLE DimWarehouse (
    id int  NOT NULL,
    address Text  NOT NULL,
    country Text  NOT NULL,
    CONSTRAINT DimWarehouse_pk PRIMARY KEY (id)
);

-- Table: FactFMCG
CREATE TABLE FactFMCG (
    id int  NOT NULL,
    amount int  NOT NULL,
    DimWarehouse_id int  NOT NULL,
    DimDate_id int  NOT NULL,
    DimProducts_id int  NOT NULL,
    CONSTRAINT FactFMCG_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: DimProducts_DimDate (table: DimProducts)
ALTER TABLE DimProducts ADD CONSTRAINT DimProducts_DimDate
    FOREIGN KEY (valid_from, valid_to)
    REFERENCES DimDate (id, id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: DimProducts_DimProductBrand (table: DimProducts)
ALTER TABLE DimProducts ADD CONSTRAINT DimProducts_DimProductBrand
    FOREIGN KEY (DimProductBrand_id)
    REFERENCES DimProductBrand (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactFMCG_DimDate (table: FactFMCG)
ALTER TABLE FactFMCG ADD CONSTRAINT FactFMCG_DimDate
    FOREIGN KEY (DimDate_id)
    REFERENCES DimDate (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactFMCG_DimProducts (table: FactFMCG)
ALTER TABLE FactFMCG ADD CONSTRAINT FactFMCG_DimProducts
    FOREIGN KEY (DimProducts_id)
    REFERENCES DimProducts (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactFMCG_DimWarehouse (table: FactFMCG)
ALTER TABLE FactFMCG ADD CONSTRAINT FactFMCG_DimWarehouse
    FOREIGN KEY (DimWarehouse_id)
    REFERENCES DimWarehouse (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

