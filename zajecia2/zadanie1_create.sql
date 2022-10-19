-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-19 14:55:28.526

-- tables
-- Table: DimClient
CREATE TABLE DimClient (
    id int  NOT NULL,
    name text  NOT NULL,
    last_name text  NOT NULL,
    phone text  NOT NULL,
    address text  NOT NULL,
    CONSTRAINT DimClient_pk PRIMARY KEY (id)
);

-- Table: DimDate
CREATE TABLE DimDate (
    id int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    year int  NOT NULL,
    week_day int  NOT NULL,
    CONSTRAINT DimDate_pk PRIMARY KEY (id)
);

-- Table: DimProduct
CREATE TABLE DimProduct (
    id int  NOT NULL,
    ISBN text  NOT NULL,
    title text  NOT NULL,
    author text  NOT NULL,
    n_pages int  NOT NULL,
    DimPublisher_id int  NOT NULL,
    CONSTRAINT DimProduct_pk PRIMARY KEY (id)
);

-- Table: DimPublisher
CREATE TABLE DimPublisher (
    id int  NOT NULL,
    name text  NOT NULL,
    address text  NOT NULL,
    CONSTRAINT DimPublisher_pk PRIMARY KEY (id)
);

-- Table: DimShipper
CREATE TABLE DimShipper (
    id int  NOT NULL,
    NIP text  NOT NULL,
    address text  NOT NULL,
    name text  NOT NULL,
    CONSTRAINT DimShipper_pk PRIMARY KEY (id)
);

-- Table: FactSales
CREATE TABLE FactSales (
    id int  NOT NULL,
    DimShipper_id int  NOT NULL,
    DimDate_id int  NOT NULL,
    DimClient_id int  NOT NULL,
    DimProduct_id int  NOT NULL,
    CONSTRAINT FactSales_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: DimProduct_DimPublisher (table: DimProduct)
ALTER TABLE DimProduct ADD CONSTRAINT DimProduct_DimPublisher
    FOREIGN KEY (DimPublisher_id)
    REFERENCES DimPublisher (id)  
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

-- Reference: FactSales_DimDate (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimDate
    FOREIGN KEY (DimDate_id)
    REFERENCES DimDate (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSales_DimProduct (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimProduct
    FOREIGN KEY (DimProduct_id)
    REFERENCES DimProduct (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSales_DimShipper (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimShipper
    FOREIGN KEY (DimShipper_id)
    REFERENCES DimShipper (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

