-- Fullfill Specific Tables --

-- Units table
INSERT INTO units (Unit_name, Faction_id, Unit_type, Nb_fig, M, CT, CC, S, T, W, A, I, Cdt, OC, Svg, Invul_svg,
                   Keywords, Aptitude_name, Aptitude_desc, U_Pts)
VALUES
    ('CHAPLAIN GRIMALDUS', 1, 'Infantry', 1, '6"', '2+', '2+', 4, 4, 5, 4, 4, '6+', 1, '3+', '4++',
     'INFANTRY, CHARACTER, PRIMARIS, PRIEST, MASTER OF SANCTITY, CHAPLAIN, GRIMALDUS',
     ARRAY['Litanies of the Devout','Unmatched Zeal'],
     ARRAY['While Chaplain Grimaldus is leading a unit, each time a model in that unit makes a melee attack, you can re-roll the Hit roll.',
        'Friendly Black Templars units within 6" of Chaplain Grimaldus have the Zealot special rule.'],
     150)
;

-- Units Rules tables
INSERT INTO units_rules (unit_id, Rule_id)
VALUES
    (1, 1),
    (1, 2)
;

-- Units Psy tables
INSERT INTO units_psy (unit_id, domains_id)
VALUES
    (1, 1),
    (1, 2)
;

-- Units Rules tables
INSERT INTO units_weapons (unit_id, weapon_id)
VALUES
    (1, 1),
    (1, 2)
;

-- Weapons table
INSERT INTO weapons (group_faction_id, Weapon_name, Weapon_type, Range, A, S, PA, D, W_Pts)
VALUES
    (1, 'Bolt Pistol', 'Pistol', '12"', '1', '4', '0', '1', 0),
    (1, 'Boltgun', 'Rapid Fire 1', '24"', '2', '4', '0', '1', 0),
    (1, 'Boltgun (Dragonfire Bolt)', 'Rapid Fire 1', '24"', '2', '4', '0', '1', 0),
    (1, 'Boltgun (Hellfire Round)', 'Rapid Fire 1', '24"', '2', '1', '-1', '1', 0),
    (1, 'Boltgun (Kraken Bolt)', 'Rapid Fire 1', '30"', '2', '4', '0', '1', 0),
    (1, 'Boltgun (Vengeance Round)', 'Rapid Fire 1', '18"', '2', '4', '-3', '1', 0),
    (1, 'Twin boltgun', 'Rapid Fire 1', '24"', '2', '4', '0', '1', 5),
    (1, 'Hurricane boltgun', 'Rapid Fire 6', '24"', '6', '4', '0', '1', 15),
    (1, 'Twin hurricane boltgun', 'Rapid Fire 6', '24"', '6', '4', '0', '1', 20),
    (1, 'Heavy bolter', 'Heavy', '36"', '3', '5', '-1', '2', 10),
    (1, 'Twin heavy bolter', 'Heavy', '36"', '3', '5', '-1', '2', 15),
    (1, 'Grav-pistol', 'Pistol', '12"', '1', '4', '-1', '1', 5),
    (1, 'Grav-gun', 'Salvo 2/3', '18"', '2', '5', '-1', '2', 10),
    (1, 'Combi-grav (Boltgun)', 'Rapid Fire 1', '24"', '2', '4', '0', '1', 0),
    (1, 'Combi-grav (Grav-gun)', 'Salvo 2/3', '18"', '2', '5', '-1', '2', 10),
    (1, 'Grav-cannon', 'Salvo 3/5', '30"', '4', '5', '-1', '2', 15),
    (1, 'Flamer', 'Assault', 'Template', '1', '4', '0', '1', 10),
    (1, 'Combi-flamer (Boltgun)', 'Rapid Fire 1', '24"', '2', '4', '0', '1', 0),
    (1, 'Combi-flamer (Flamer)', 'Assault', 'Template', '1', '4', '0', '1', 10),
    (1, 'Heavy flamer', 'Assault', 'Template', '1', '5', '-1', '1', 10),
    (1, 'Twin heavy flamer', 'Assault', 'Template', '1', '5', '-1', '2', 20),
    (1, 'Meltagun', 'Assault', '12"', '1', '9', '-4', 'D6', 10),
    (1, 'Combi-melta (Boltgun)', 'Rapid Fire 1', '24"', '2', '4', '0', '1', 0),
    (1, 'Combi-melta (Meltagun)', 'Assault', '12"', '1', '9', '-4', 'D6', 10),
    (1, 'Multi-melta', 'Heavy', '18"', '2', '9', '-4', 'D6', 20),
    (1, 'Twin multi-melta', 'Heavy', '18"', '2', '9', '-4', 'D6', 25),
    (1, 'Plasma pistol (Standard)', 'Pistol', '12"', '1', '7', '-2', '1', 5),
    (1, 'Plasma pistol (Supercharge)', 'Pistol', '12"', '1', '8', '-3', '2', 5),
    (1, 'Plasma gun standard', 'Rapid Fire 1', '24"', '1', '7', '-2', '1', 10),
    (1, 'Plasma gun supercharge', 'Rapid Fire 1', '24"', '1', '8', '-3', '2', 5),
    (1, 'Combi-plasma (Boltgun)', 'Rapid Fire 1', '24"', '2', '4', '0', '1', 0),
    (1, 'Combi-plasma (Plasma gun standard)', 'Rapid Fire 1', '24"', '1', '7', '-2', '1', 10),
    (1, 'Combi-plasma (Plasma gun supercharge)', 'Rapid Fire 1', '24"', '1', '8', '-3', '2', 5),
    (1, 'Plasma cannon (Standard)', 'Heavy', '36"', '1', '7', '-2', '1', 10),
    (1, 'Plasma cannon (Supercharge)', 'Heavy', '36"', '1', '8', '-3', '2', 10),
    (1, 'Twin plasma cannon (Standard)', 'Heavy', '36"', '1', '7', '-2', '1', 15),
    (1, 'Twin plasma cannon (Supercharge)', 'Heavy', '36"', '1', '8', '-3', '2', 15),
    (1, 'Heavy plasma cannon (Standard)', 'Heavy', '36"', 'D3', '7', '-2', '1', 15),
    (1, 'Heavy plasma cannon (Supercharge)', 'Heavy', '36"', 'D3', '8', '-3', '2', 15),
    (1, 'Twin heavy plasma cannon (Standard)', 'Heavy', '36"', 'D3', '7', '-2', '1', 20),
    (1, 'Twin heavy plasma cannon (Supercharge)', 'Heavy', '36"', 'D3', '8', '-3', '2', 20),
    (1, 'Storm bolter', 'Rapid Fire 2', '24"', '2', '4', '0', '1', 0),
    (1, 'Predator autocannon', 'Heavy, Rapid Fire 2', '48"', '4', '9', '-1', '3', 30),
    (1, 'Predator twin lascannon', 'Heavy', '48"', '1', '14', '-3', 'D6+1', 30),
    (1, 'Lascannon', 'Heavy', '48"', '1', '12', '-3', 'D6+1', 20),
    (1, 'Twin lascannon', 'Heavy', '48"', '1', '12', '-3', 'D6+1', 25),
    (1, 'Assault cannon', 'Heavy', '24"', '6', '6', '0', '1', 15),
    (1, 'Twin assault cannon', 'Heavy', '24"', '6', '6', '0', '1', 20),
    (1, 'Missile launcher (frag)', 'Heavy', '48"', '1', '4', '0', '1', 10),
    (1, 'Missile launcher (krak)', 'Heavy', '48"', '1', '9', '-2', 'D6', 10),
    (1, 'Typhoon missile launcher (frag)', 'Heavy', '48"', '2', '4', '0', '1', 10),
    (1, 'Typhoon missile launcher (krak)', 'Heavy', '48"', '2', '9', '-2', 'D6', 10),
    (1, 'Stormstrike missile launcher', 'Heavy', '48"', '1', '8', '-4', 'D6', 20),
    (1, 'Skyhammer missile launcher', 'Heavy', '60"', '3', '7', '-1', 'D3', 20),
    (1, 'Deathwind launcher', 'Heavy', '12"', '1', '12', '0', 'D6+1', 10),
    (1, 'Infernus', 'Assault', '18"', '2', '8', '-5', 'D6', 0),
    (1, 'The Spear of Telesto', 'Assault', '12"', '1', '7', '-5', 'D3+3', 0),

    (1, 'Close combat weapon', 'Melee', 'Melee', 'User', 'User', '0', '1', 0),
    (1, 'Combat knife', 'Melee', 'Melee', 'User', 'User', '0', '1', 0),
    (1, 'Astartes chainsword', 'Melee', 'Melee', 'User', 'User', '0', '2', 0),
    (1, 'Power axe', 'Melee', 'Melee', 'User', '+2', '-2', '1', 10),
    (1, 'Power maul', 'Melee', 'Melee', 'User', '+3', '-1', '1', 10),
    (1, 'Power sword', 'Melee', 'Melee', 'User', '+1', '-3', '1', 10),
    (1, 'Relic blade', 'Melee','Melee', '+1', '+1', '-2', '2', 10),
    (1, 'Lightning claw', 'Melee', 'Melee', 'User', '+1', '-2', '2', 5),
    (1, 'Power fist', 'Melee', 'Melee', '-1', 'x2', '-2', '2', 15),
    (1, 'Twin lightning claw', 'Melee', 'Melee', 'User', '+1', '-2', '2', 10),
    (1, 'Chainfist', 'Melee', 'Melee', '-1', 'x2', '-2', '2', 20),
    (1, 'Thunder hammer', 'Melee', 'Melee', '-1', 'x2', '-2', '3', 20),
    (1, 'Dreadnought combat weapon', 'Melee', 'Melee', 'User', 'x2', '-2', '3', 20),
    (1, 'Armour tracks', 'Melee', 'Melee', 'User', 'User', '0', '1', 0),
    (1, 'Armoured hull', 'Melee', 'Melee', 'User', 'User', '0', '1', 0),
    (1, 'The Spear of Telesto (Strike)', 'Melee', 'Melee', 'User', 'User', '-4', 'D3+1', 0),
    (1, 'The Spear of Telesto (Sweep)', 'Melee', 'Melee', 'x2', '-1', '-3', 'D3', 0),
    (1, 'Moonsilver', 'Melee', 'Melee', 'User', 'User', '-3', '2', 0)
;


-- Weapon Rules tables
INSERT INTO weapons_rules (weapon_id, rule_id)
VALUES
    (1, 1),
    (1, 2)
;