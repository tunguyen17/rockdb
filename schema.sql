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
    CONSTRAINT FK_info FOREIGN KEY (IMA_status) REFERENCE IMA,
    CONSTRAINT FK_info FOREIGN KEY (hardness_score) REFERENCE hardness
    CONSTRAINT FK_info FOREIGN KEY (family) REFERENCE family_group
);


CREATE TABLE composition(
    name VARCHAR(100) NOT NULL,
    element VARCHAR(100) NOT NULL,
    percent NUMBER,
    CONSTRAINT PK_composition PRIMARY KEY (name, element),
    CONSTRAINT FK_composition FOREIGN KEY (name) REFERENCE info
    CONSTRAINT CHECK_composition (percent BETWEEN 0 and 100) --CHECK CONTRAINT 1
);

CREATE TABLE location(
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    status VARCHAR(50),
    CONSTRAINT PK_location PRIMARY KEY (name, region, country),
    CONSTRAINT FK_location FOREIGN KEY (name) REFERENCE info,
    CONSTRAINT FK_location FOREIGN KEY (region, country) REFERENCE local_info
);

CREATE TABLE local_info(
    region VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    climate_type VARCHAR(100) NOT NULL,
    local_language VARCHAR(100),
    CONSTRAINT PK_local_info PRIMARY KEY (region, country)
);

CREATE TABLE IMA(
    IMA_status VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    CONSTRAINT PK_IMA PRIMARY KEY (IMA_status)
);

CREATE TABLE family_group(
    family VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    CONSTRAINT PK_family_group PRIMARY KEY (family)
);

CREATE TABLE hardness(
    hardness_score NUMBER NOT NULL,
    description VARCHAR(50),
    CONSTRAINT PK_hardness PRIMARY KEY (hardness_score)
    CONSTRAINT CHECK_hardness (hardness_score BETWEEN 0 and 10) --CHECK CONTRAINT 2
);
