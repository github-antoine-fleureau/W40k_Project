-- Active: 1710930161670@@127.0.0.1@5432@postgres

-- Table creation --

-- Special Rules table
CREATE TABLE special_rules (
    Rule_id SERIAL PRIMARY KEY,
    Rule_name VARCHAR(100) NOT NULL,
	Rule_desc TEXT NOT NULL
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
    group_faction_id INT NOT NULL REFERENCES group_factions(Group_faction_id),
    group_faction_name VARCHAR(100) NOT NULL
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
    Unit_name VARCHAR(100) NOT NULL,
    Faction_id INT NOT NULL REFERENCES factions(Faction_id),
    Unit_type VARCHAR(50),
	Nb_fig INT NOT NULL,
	M VARCHAR(10) NOT NULL,
	BS VARCHAR(10) NOT NULL,
	WS VARCHAR(10) NOT NULL,
	S INT NOT NULL,
	T INT NOT NULL,
	W INT NOT NULL,
	A INT NOT NULL,
	I INT NOT NULL,
	Ld VARCHAR(10) NOT NULL,
	OC INT NOT NULL,
	Sv VARCHAR(10) NOT NULL,
	Invul_sv VARCHAR(10),
	Keywords VARCHAR(100) NOT NULL,
	Aptitude_name VARCHAR(100)[],
	Aptitude_desc TEXT[],
    U_Pts INT
);

-- Units Rules tables
CREATE TABLE units_rules (
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
	Rule_id INT NOT NULL REFERENCES special_rules(Rule_id)
);

-- Units Psy tables
CREATE TABLE units_psy (
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
    Domains_id INT NOT NULL REFERENCES psychic_powers_domains(Domains_id)
);

-- Weapons table
CREATE TABLE weapons (
    Weapon_id SERIAL PRIMARY KEY,
    group_faction_id INT NOT NULL REFERENCES group_factions(group_faction_id),
    Weapon_name VARCHAR(100) NOT NULL,
    Weapon_type VARCHAR(50) NOT NULL,
    Range VARCHAR(10) NOT NULL,
	A VARCHAR(10) NOT NULL,
	S VARCHAR(10) NOT NULL,
	AP VARCHAR(10) NOT NULL,
    D VARCHAR(10) NOT NULL,
    W_Pts INT
);

-- Weapon Rules tables
CREATE TABLE weapons_rules (
    Weapon_id INT NOT NULL REFERENCES weapons(Weapon_id),
	Rule_id INT NOT NULL REFERENCES special_rules(Rule_id)
);

-- Units Weapons tables
CREATE TABLE units_weapons (
    Unit_id INT NOT NULL REFERENCES units(Unit_id),
	Weapon_id INT NOT NULL REFERENCES Weapons(weapon_id)
);
