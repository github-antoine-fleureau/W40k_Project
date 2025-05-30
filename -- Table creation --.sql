-- Core Rules table
CREATE TABLE core_rules (
    Phase_id SERIAL PRIMARY KEY,
    Phase_rule VARCHAR(100) NOT NULL,
    Phase_desc TEXT NOT NULL
);

-- Special Rules table
CREATE TABLE special_rules (
    Rule_id SERIAL PRIMARY KEY,
    Rule_name VARCHAR(100) NOT NULL,
    Rule_desc TEXT NOT NULL
);

-- Types table
CREATE TABLE types (
    Types_id SERIAL PRIMARY KEY,
    Types_name VARCHAR(15) NOT NULL,
    Types_desc TEXT NOT NULL
);

-- Psychic Powers Domains table
CREATE TABLE psychic_powers_domains (
    Domains_id SERIAL PRIMARY KEY,
    Domains VARCHAR(100) NOT NULL
);

-- Psychic Powers table
CREATE TABLE psychic_powers (
    Powers_id SERIAL PRIMARY KEY,
    Domains_id INT NOT NULL REFERENCES psychic_powers_domains(Domains_id),
    Powers_name VARCHAR(100) NOT NULL,
    Powers_type VARCHAR(100) NOT NULL,
    Powers_cost INT NOT NULL,
    Powers_desc TEXT NOT NULL
);

-- Group Factions table
CREATE TABLE group_factions (
    Group_faction_id SERIAL PRIMARY KEY,
    Group_faction_name VARCHAR(100) NOT NULL
);

-- Factions table
CREATE TABLE factions (
    Faction_id SERIAL PRIMARY KEY,
    Faction_name VARCHAR(100) NOT NULL,
    Faction_keywords VARCHAR(100) NOT NULL,
    group_faction_id INT NOT NULL REFERENCES group_factions(Group_faction_id)
);

-- Factions Aptitudes table
CREATE TABLE faction_aptitudes (
    Aptitude_id SERIAL PRIMARY KEY,
    Faction_id INT NOT NULL REFERENCES factions(Faction_id),
    Faction_aptitude_name VARCHAR(100) NOT NULL,
    Faction_aptitude_desc TEXT NOT NULL
);

-- Units table
CREATE TABLE units (
    Unit_id SERIAL PRIMARY KEY,
    Unit_name VARCHAR(200) NOT NULL,
    Attribut VARCHAR(150),
    group_faction_id INT NOT NULL REFERENCES group_factions(Group_faction_id),
    Faction_id INT NOT NULL REFERENCES factions(Faction_id),
    Unit_type VARCHAR(50),
    Nb_fig INT NOT NULL,
    Movement VARCHAR(10) NOT NULL,
    Cruising_Speed VARCHAR(10),
    Hover VARCHAR(10),
    BS VARCHAR(5),
    WS VARCHAR(5),
    S INT NOT NULL,
    T INT,
    Front INT,
    Side INT,
    Rear INT,
    HP INT NOT NULL,
    A INT NOT NULL,
    I INT NOT NULL,
    Ld VARCHAR(5) NOT NULL,
    OC INT NOT NULL,
    Sv VARCHAR(5),
    Invul_sv VARCHAR(10),
    Weapons TEXT,
    Aptitudes TEXT NOT NULL,
    domains TEXT,
    Special_rules TEXT NOT NULL,
    U_Pts INT
);

-- Units Aptitudes table
CREATE TABLE units_aptitudes (
    Aptitude_id SERIAL PRIMARY KEY,
    Aptitude_name VARCHAR(100) NOT NULL,
    Aptitude_desc TEXT NOT NULL
);

-- Weapons table
CREATE TABLE weapons (
    Weapon_id SERIAL PRIMARY KEY,
    group_faction_id INT NOT NULL REFERENCES group_factions(Group_faction_id),
    Weapon_name VARCHAR(100) NOT NULL,
    Weapon_type VARCHAR(150) NOT NULL,
    RANGE VARCHAR(10),
    A VARCHAR(10) NOT NULL,
    S VARCHAR(10) NOT NULL,
    AP VARCHAR(10) NOT NULL,
    D VARCHAR(10) NOT NULL,
    W_Pts INT
);

-- Link Tables creation
-- Units Type table
CREATE TABLE units_type (
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
    Types_id INT NOT NULL REFERENCES types(Types_id)
);

-- Units Rules table
CREATE TABLE units_rules (
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
    Rule_id INT NOT NULL REFERENCES special_rules(Rule_id)
);

-- Units Aptitudes Link table
CREATE TABLE units_aptitudes_link (
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
    Aptitude_id INT NOT NULL REFERENCES units_aptitudes(Aptitude_id)
);

-- Units Faction_Aptitudes Link table
    CREATE TABLE units_faction_aptitudes_link ( 
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
    aptitudes TEXT NOT NULL
);

-- Units Psy table
CREATE TABLE units_psy (
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
    Domains_id INT NOT NULL REFERENCES psychic_powers_domains(Domains_id)
);

-- Weapon Rules table
CREATE TABLE weapons_rules (
    Weapon_id INT NOT NULL REFERENCES weapons(Weapon_id),
    Rule_id INT NOT NULL REFERENCES special_rules(Rule_id)
);

-- Units Weapons table
CREATE TABLE units_weapons (
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
    Weapon_id INT NOT NULL REFERENCES weapons(Weapon_id)
);
