CREATE TABLE IMA(
    IMA_status VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    CONSTRAINT PK_IMA PRIMARY KEY (IMA_status)
);

CREATE TABLE hardness(
    hardness_score NUMBER NOT NULL,
    description VARCHAR(50),
    CONSTRAINT PK_hardness PRIMARY KEY (hardness_score),
    CONSTRAINT CHECK_hardness CHECK (hardness_score BETWEEN 0 and 10) --CHECK CONTRAINT 2
);

CREATE TABLE family_group(
    family VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    CONSTRAINT PK_family_group PRIMARY KEY (family)
);

CREATE TABLE local_info(
    region VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    climate_type VARCHAR(100) NOT NULL,
    local_language VARCHAR(100),
    CONSTRAINT PK_local_info PRIMARY KEY (region, country)
);

CREATE TABLE info(
    id VARCHAR(4) NOT NULL,
    name VARCHAR(100) NOT NULL,
    chemical_formula VARCHAR(100),
    IMA_status VARCHAR(50),
    IMA_approval_date DATE, --YYYY-MM-DD
    color VARCHAR(50),
    diaphaneity VARCHAR(50),
    hardness_score NUMBER,
    luster VARCHAR(50),
    family VARCHAR(50),
    CONSTRAINT PK_info PRIMARY KEY (id, name),
    CONSTRAINT FK_info_IMA FOREIGN KEY (IMA_status) REFERENCES IMA(IMA_status),
    CONSTRAINT FK_info_hardness FOREIGN KEY (hardness_score) REFERENCES hardness(hardness_score),
    CONSTRAINT FK_info_family FOREIGN KEY (family) REFERENCES family_group(family)
);

CREATE TABLE composition(
    info_id VARCHAR(4) NOT NULL,
    name VARCHAR(100) NOT NULL,
    element VARCHAR(100) NOT NULL,
    percent NUMBER,
    CONSTRAINT PK_composition PRIMARY KEY (name, element),
    CONSTRAINT FK_composition FOREIGN KEY (name, info_id) REFERENCEs info(name, id),
    CONSTRAINT CHECK_composition CHECK (percent BETWEEN 0 and 100) --CHECK CONTRAINT 1
);

CREATE TABLE location(
    info_id VARCHAR(4) NOT NULL,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    status VARCHAR(50),
    CONSTRAINT PK_location PRIMARY KEY (name, region, country),
    CONSTRAINT FK_location_info FOREIGN KEY (name, info_id) REFERENCES info(name, id),
    CONSTRAINT FK_location_local FOREIGN KEY (region, country) REFERENCES local_info(region, country)
);
