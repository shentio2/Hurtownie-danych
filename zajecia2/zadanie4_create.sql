-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-19 15:19:25.922

-- tables
-- Table: DimClient
CREATE TABLE DimClient (
    id int  NOT NULL,
    name text  NOT NULL,
    NIP text  NOT NULL,
    address text  NOT NULL,
    CONSTRAINT DimClient_pk PRIMARY KEY (id)
);

-- Table: DimFruit
CREATE TABLE DimFruit (
    id int  NOT NULL,
    price float  NOT NULL,
    DimFruitCategory_id int  NOT NULL,
    CONSTRAINT DimFruit_pk PRIMARY KEY (id)
);

-- Table: DimFruitCategory
CREATE TABLE DimFruitCategory (
    id int  NOT NULL,
    category_name text  NOT NULL,
    CONSTRAINT DimFruitCategory_pk PRIMARY KEY (id)
);

-- Table: DimPlace
CREATE TABLE DimPlace (
    id int  NOT NULL,
    lattitude float  NOT NULL,
    longitude float  NOT NULL,
    CONSTRAINT DimPlace_pk PRIMARY KEY (id)
);

-- Table: DimTime
CREATE TABLE DimTime (
    id int  NOT NULL,
    hour int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    CONSTRAINT DimTime_pk PRIMARY KEY (id)
);

-- Table: FactSales
CREATE TABLE FactSales (
    id int  NOT NULL,
    amount int  NOT NULL,
    price int  NOT NULL,
    DimFruit_id int  NOT NULL,
    DimPlace_id int  NOT NULL,
    DimClient_id int  NOT NULL,
    DimTime_id int  NOT NULL,
    CONSTRAINT FactSales_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: DimFruit_DimFruitCategory (table: DimFruit)
ALTER TABLE DimFruit ADD CONSTRAINT DimFruit_DimFruitCategory
    FOREIGN KEY (DimFruitCategory_id)
    REFERENCES DimFruitCategory (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSales_DimClient (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimClient
    FOREIGN KEY (DimClient_id)
    REFERENCES DimClient (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSales_DimFruit (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimFruit
    FOREIGN KEY (DimFruit_id)
    REFERENCES DimFruit (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSales_DimPlace (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimPlace
    FOREIGN KEY (DimPlace_id)
    REFERENCES DimPlace (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSales_DimTime (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimTime
    FOREIGN KEY (DimTime_id)
    REFERENCES DimTime (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

