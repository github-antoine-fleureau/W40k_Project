-- Factions tables
-- Group Factions table
INSERT INTO group_factions (group_faction_name)
VALUES
    ('IMPERIUM'),
    ('CHAOS'),
    ('AELDARI'),
    ('NECRONS'),
    ('ORKS')
;
-- Factions table
INSERT INTO factions (Faction_name, Faction_keywords, group_faction_id)
VALUES
    ('Adeptus Astartes - Black Templars', 'IMPERIUM, ADEPTUS ASTARTES, BLACK TEMPLARS', 1),
    ('Adeptus Astartes - Salamanders', 'IMPERIUM, ADEPTUS ASTARTES, SALAMANDERS', 1),
    ('Adeptus Astartes - Blood Angels', 'IMPERIUM, ADEPTUS ASTARTES, BLOOD ANGELS', 1),
    ('Adeptus Astartes - Night Hawks', 'IMPERIUM, ADEPTUS ASTARTES, NIGHT HAWKS', 1),
    ('Adeptus Astartes - Deathwatch', 'IMPERIUM, ADEPTUS ASTARTES, DEATHWATCH', 1),
    ('Adepta Sororitas - Order of Our Martyred Lady', 'IMPERIUM, ADEPTUS MINISTORUM, ADEPTA SORORITAS, ORDER OF OUR MARTYRED LADY', 1),
    ('Agents of the Imperium', 'IMPERIUM, AGENTS OF THE IMPERIUM', 1),
    ('Adeptus Mechanicus - Cult of Mars', 'IMPERIUM, ADEPTUS MECHANICUS, CULT MECHANICUS, MARS', 1),
    ('Imperial Knights - House Taranis', 'IMPERIUM, IMPERIAL KNIGHTS, QUESTOR MECHANICUS, HOUSE TARANIS', 1),
    ('Chaos Daemons', 'CHAOS, LEGIONES DAEMONICA', 2),
    ('Heretic Astartes - Night Lords', 'CHAOS, HERETIC ASTARTES, TRAITORIS ASTARTES, NIGHT LORDS', 2),
    ('Heretic Astartes - Death Guard', 'CHAOS, HERETIC ASTARTES, TRAITORIS ASTARTES, NURGLE, DEATH GUARD', 2),
    ('Heretic Astartes - Thousand Sons', 'CHAOS, HERETIC ASTARTES, TRAITORIS ASTARTES, TZEENTCH, THOUSAND SONS', 2),
    ('Heretic Astartes - World Eaters', 'CHAOS, HERETIC ASTARTES, TRAITORIS ASTARTES, KHORNE, WORLD EATERS', 2),
    ('Craftworld - Biel-Tan', 'AELDARI, ASURYANI, BIEL-TAN', 3),
    ('Drukhari', 'AELDARI, DRUKHARI', 3),
    ('Necrons - Dynasty Mephrit', 'NECRONS, MEPHRIT', 4),
    ('Orks - Clan Snakebites', 'ORKS, SNAKEBITES', 5)
;
-- Factions Aptitudes table
INSERT INTO faction_aptitudes (Faction_id, Faction_aptitude_name, Faction_aptitude_desc)
VALUES
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Black Templars'), 'Oath of the Moment', 'At the start of your Command phase, select one unit from your opponent’s army. Until the start of your next Command phase, each time a model from your army with this ability makes an attack that targets that ennemy unit, you can re-roll the Hit roll and you can re-roll the Wound roll.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Black Templars'), 'Righteous Zeal', 'If a Black Templars unit suffers one or more casualties in the Shooting phase or as a result of Overwatch, all models in that unit gain the Counter-attack and Rage special rules until the end of the turn.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Black Templars'), 'Templar Vows', 'At the start of the first battle round, select one of the four Templar Vows below to be active for ADEPTUS ASTARTES - Black Templars, except Vehicles, units from your army until the end of the battle.
    — SUFFER NOT THE UNCLEAN TO LIVE Melee weapons equipped by models in this unit have the Lethal Hits special rules.
    — UPHOLD THE HONOUR OF THE EMPEROR Models in this unit have the Feel no Pain 6+ ability and a Leadership Characteristic of 5+.
    — ABHOR THE WITCH, DESTROY THE WITCH Models in this unit have a 4+ invulnerable save against Psychic Attacks and melee weapons equipped by models in this unit have the Anti-Psyker special rule.
    — ACCEPT ANY CHALLENGE, NO MATTER THE ODDS Melee weapons equipped by models in this unit have the Sustained Hit 1 special rule.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Black Templars'), 'Zealous Litanies', 'At the start of the battle round, you can select one of the Litanies listed below. If you do, until the end of the battle round, that Litany is active and its effects apply to all ADEPTUS ASTARTES - Black Templars units, except Vehicles, from your army.
    — CHORUS OF RELENTLESS HATE Add 2" to the Move Characteristic of models in this unit and add 1 to Advance rolls made for it.
    — RITE OF PERFERVID WRATH Add 1 to the Strength Characteristic of melee weapons equipped by models in this unit.
    — CHANT OF DEATHLESS DEVOTION Models in this unit have a 5+ invulnerable save against ranged attacks.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Salamanders'), 'Oath of the Moment', 'At the start of your Command phase, select one unit from your opponent’s army. Until the start of your next Command phase, each time a model from your army with this ability makes an attack that targets that ennemy unit, you can re-roll the Hit roll and you can re-roll the Wound roll.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Salamanders'), 'Sof Will', 'All units with this special rule automatically pass any Fear test they have to make, and can re-roll a single D6 when taking Morale or Pinning checks that they have failed.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Salamanders'), 'Nocturne Born', 'All units from Adeptus Astartes - Salamanders army do not add their Initiative Score when making Sweeping Run rolls, and reduce any Run and Charge distances by -1” (to a minimum of 1”).'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Salamanders'), 'The Covenant of Fire', 'Units from this army have the following rules:
    — OBSIDIAN FORGED Models in this unit have a 5+ invulnerable save against melta, volkite, plasma and flamer weapons, and melta bombs.
    — VENERATION OF WRATH All melta, volkite, plasma and flamer weapons, and melta bombs equipped by models in this unit have Master-crafted special rule and models in this units can re-roll failed To Wound rolls.
    — IMPLACABLE Models in this unit gain the Move Throught Cover specail rule.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Blood Angels'), 'Oath of the Moment', 'At the start of your Command phase, select one unit from your opponent’s army. Until the start of your next Command phase, each time a model from your army with this ability makes an attack that targets that ennemy unit, you can re-roll the Hit roll and you can re-roll the Wound roll.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Blood Angels'), 'Encarmine Fury', 'All units from Adeptus Astartes - Blood Angels army gain +1 to their To Wound roll in Fighting phase.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Blood Angels'), 'Without Remorse, Without Relent', 'All units from Adeptus Astartes - Blood Angels army must always make Sweeping Run if they are able to , and may not volountarily Go to Ground.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Blood Angels'), 'The Day of Sorrows', 'Units from this army have the following rules:
    — RESOLUTE DEFENCE Models in this unit cannot be Pinned and are Fearless when within 3" of any controlled objective.
    — AURA OF WRATH Ennemy unit which suffers a MLorale Check as a result of losing a fight agains this unit suffers an additionnal -1 Leadership Characteristic penalty when taking the test. Units immune to Fear are immune to this aptitude.
    — BY BLOOD SWARN Remainning models in this unit gain the Feel no Pain (5+) specail rule when reduce to 50% or less of its starting models.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Deathwatch'), 'Oath of the Moment', 'At the start of your Command phase, select one unit from your opponent’s army. Until the start of your next Command phase, each time a model from your army with this ability makes an attack that targets that ennemy unit, you can re-roll the Hit roll and you can re-roll the Wound roll.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Deathwatch'), 'Kill Team', 'Deathwatch units are organised in Kill Team. Before the battle, those Kill Team can be split in as many units that there are differents figurines type in the unit, but each figurines of an unit must have the same Characteristics and special rules. Each unit create this way can be deployed at differents place and/or keep in reserve as classical units. The Kill Team still count as a unique unit for any kind of test affecting a unit.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Deathwatch'), 'Mission Tatics', 'At the start of your Command phase, you can select one of the Mission Tactics listed below. Until the start of your next Command phase, that Mission Tactic is active and its effects apply to all units from your army with this ability.
    — FUROR TACTICS While this Mission Tactic is active, weapons equipped by Deathwatch units from your army have the Sustained hits 1 special rule.
    — MALLEUS TACTICS While this Mission Tactic is active, weapons equipped by Deathwatch units from your army have the Lethal hits special rule.
    — PURGATUS TACTICS While this Mission Tactic is active, each time an Deathwatch unit from your army makes an attack, if a Critical Hit is scored, that attack has the Precision Shot or Precision Strike special rule, depending on the type of weapon used.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Night Hawks'), 'Oath of the Moment', 'At the start of your Command phase, select one unit from your opponent’s army. Until the start of your next Command phase, each time a model from your army with this ability makes an attack that targets that ennemy unit, you can re-roll the Hit roll and you can re-roll the Wound roll.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Night Hawks'), 'By Wing & Talon', 'Infantry (except for Terminators or Jump Infantry) gain the Fleet and Infiltrate special rule.
    Jump Infantry, Bikes/Jetbikes and Terminator armoured Infantry gain the Furious Charge special rule.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Astartes - Night Hawks'), 'Decapitation Strike', 'Units from this army have the following rules:
    — SHADOW MASTErs  Each time a ranged attack targets an ADEPTUS ASTARTES unit from your army, unless the attacking model is within 12", subtract 1 from the Hit roll and the target has the Benefit of Cover against that attack.
    — FOR WHOM THE BELL TOLLS All Infanterie units in this detachment gain the Preferred Ennemy (Independent Characters) special rule.
    — PREDATORY STRIKE The controlling player may re-roll the dice to see who goes first/deploys first.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Agents of the Imperium'), 'Assigned Agents', 'If every model in your army has the Imperium keyword, you can include Agents of the Imperium units in your army even if they do not have the Faction keyword you selected in the Select Army Faction step.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Agents of the Imperium'), 'Root out Heresy', 'Ranged weapons equipped by Agents of the Imperium models from your army have the IGNORES COvER ability.
    Each time an Agents of the Imperium model from your army makes an attack that targets a CHAOS unit containing 5 or more models, that attack has the SUSTAINED HITS 1 ability.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adepta Sororitas - Order of Our Martyred Lady'), 'Acts of Faith', 'At the start of your Command phase, you gain 1 Miracle dice.
    Each time you gain a Miracle dice, roll one D6. The number you roll is the value of that Miracle dice, and cannot be changed or re-rolled, unless a rule specifically states otherwise.
    Before making a dice roll for a model or unit from your army with the Acts of Faith ability, if you have one or more Miracle dice, that unit can perform an Act of Faith by selecting one of those to substitute that dice roll (this counts as an unmodified dice roll).
    Each Miracle dice can only be used in this way once. You can use Fate dice for any of the following types of dice roll: Run roll / Battle-shock test / Charge roll / Damage roll / Hit roll / Saving throw / Wound roll'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Mechanicus - Cult of Mars'), 'Doctrina Imperatives', 'At the start of the battle round, you can select one of the Doctrina Imperatives below. Until the end of the battle round, that Doctrina Imperative is active for your army, and all units from your army gain the ability.
    Protector Imperative: Ranged weapons equipped by models in this unit have the Heavy special rule. Each time a ranged attack targets this unit, if this unit is within your deployment zone, worsen the AP Characteristic of that attack by 1.
    Conqueror Imperative: Ranged weapons equipped by models in this unit have the Assault special rule. Each time a model in this unit makes a ranged attack, if the target of that attack is within your opponent’s deployment zone, improve the AP Characteristic of that attack by 1.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Mechanicus - Cult of Mars'), 'Panegyric Procession', 'This unit do not suffer the penalty for moving and firing Heavy weapons. Increase the SCharacteristic of Heavy weapons models in the affected unit are equipped with by 1.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Adeptus Mechanicus - Cult of Mars'), 'Canticles of the Omnissiah', 'At the start of the battle round, you can select one of the following Canticle. If you do so, until the end of the battle round, that Canticle is active for your army.
    — SHROUDPSALM This unit counts as receiving the benefits of Light Cover.
    — CHANT OF THE REMORSELESS FIST Each time a model in this unit make a melee attack, add 1 to the SCharacteristic of that attack.
    — INCANTATION OF THE IRON SOUL Each time a Combat Attrition test is taken for this unit, ignore any or all modifiers.
    — BENEDICTION OF THE OMNISSIAH Each time this unit is selected to shoot, when resolving its attacks you can re-roll one dice roll.
    — INVOCATION OF MACHINE VENGEANCE Each time an Run or charge roll is made for this unit, roll one additional D6 and discard the lowest result.
    — LITANY OF THE ELECTROMANCER Each time a melee attack is made against this unit, subtract 1 from that attack’s hit roll.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Imperial Knights - House Taranis'), 'Code Chivalric', 'All unit from your army start with 1 Honour Point and gain one each time the Pledge is completed. The Honoured Ability is active when the unit has 1 or more Honour Point. When the Troth is completed, you lose 1 Honour Point, and you lose the Honoured Ability when you have less than 1 Honour Point. Choose one of the following Code Chivalric:
    Protect Those in Need:
    Pledge: A unit performed a Heroic Intervention or charge against an ennemy unit within engagement range of another friendly unit.
    Troth: A unit failed a Heroic Intervention or do not charge an ennemy unit within engagement range of another friendly unit.
    Honoured Ability: Gain the Furious charge special rule.
    Defend the Realm:
    Pledge: Control more objectives than the opponent.
    Troth: Control less objectives than the opponent.
    Honoured Ability: At the start of your Command phase, you gain 1 additional Command point.
    Refuse No Challenge:
    Pledge: You destroyed 2 or more ennemy units during the battle round.
    Troth: One of your unit fall back during the battle round.
    Honoured Ability: You can re-roll Run and charge rolls made for this model.
    Lay Low The Tyrants:
    Pledge: You destroyed 1 or more  Character, Monster or Vehicle during the battle round.
    Troth: Less than 2 ennemy units have been destroyed by units from your army during that battle round.
    Honoured Ability: You can re-roll one hit roll or one wound roll each battle round.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Imperial Knights - House Taranis'), 'Sacristan Pledge', 'Add 1 to the Wounds Characteristic to this Model (if this model is Titanic, add 2 to its Wounds Characteristic instead). At the start of each of your Command phases, this model regains 1 lost wound.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Imperial Knights - House Taranis'), '"House Taranis', 'Each time a model with this tradition loses a wound, unless that wound was lost as the result of a mortal wound, roll one D6: on a 6, that wound is not lost.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Imperial Knights - House Taranis'), 'Agents of the Adeptus Mechanicus', 'All Vehicles in this Detachment have the It Will Not Die special rule. In addition, all Vehicles in the Detachment that are within 6" of an HQ choice from this Detachment at the start of the turn have the Power of the Machine Spirit special rule until the start of your next turn.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Chaos Daemons'), 'Daemonic Instability', 'Units with this special rule automatically pass Fear, Pinning and Morale tests (and cannot choose to fail any of these tests). When a unit loses an assault, it must take a Daemonic Instability test (Leadership test) at the Check Morale phase. For each point the unit fails its Daemonic Instability test by, it suffers one additional Mortal Wound. Note that a failed Daemonic Instability test does not cause a Daemon unit to fall back - once any casualties have been removed, the unit remains locked in combat. If the dice roll is a double 1 or double 6, the Daemons’ presence fluctuates:
    Double 1 - Reality Blinks: All Wounds suffered by the unit during this phase are restored. Any models from this unit that were removed as casualties during this phase immediately return to play in coherency with a model in their unit that has not itself returned to play through Reality Blinks this phase.
    Double 6 - Banished!: Remove the entire unit from play as casualties. ennemy units that were locked in combat with only the banished unit immediately consolidate.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Chaos Daemons'), 'Shadow of Chaos', 'Your deployment zone is always within your army’s Shadow of Chaos. At the start of any phase, if you control at least half of the objective markers within No Man’s Land, until the end of that phase, No Man’s Land is within your army’s Shadow of Chaos. At the start of any phase, if you control at least half of the objective markers within your opponent’s deployment zone, until the end of that phase, your opponent’s deployment zone is within your army’s Shadow of Chaos.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Chaos Daemons'), 'Daemonic Manifestation', 'While a unit from your army is within your army’s Shadow of Chaos, each time that unit takes a Daemonic Instability test , add 1 to that test and, if that test is passed, up to D3 destroyed models can be returned to that unit, except if it is a Character unit, it regains D3 Wounds instead.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Chaos Daemons'), 'Daemonic Terror', 'While an ennemy unit is within your army’s Shadow of Chaos, each time that unit takes a Battle-shock test, subtract 1 from that test and, if that test is failed, that ennemy unit suffers D3 mortal wounds.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Chaos Daemons'), 'Daemonic Incursion', 'Units from this army have the following rules:
    — WARP RIFTS Each time a unit from your army is set up on the battlefield using the Deep Strike ability, if it is set up wholly within your army’s Shadow of Chaos, it can be set up anywhere that is more than 6" horizontally away from all ennemy models, instead of more than 9".
    — THE WARP UNLEASHED You can choose to re-roll any Daemonic Instability tests for units from this Detachment.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Night Lords'), 'A Talent for Murder', 'If a unit or units from the Night Lords outnumber one or more ennemy units during any Initiative Step in which they fight, they gain +1 To Hit and To Wound. Bulky models counts as two and Very Bulky models counts as three for this rule.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Night Lords'), 'Nostraman Blood', 'All models with this special rule fall back +1" further than normal. If they fail a Pinning Test, they may fall back instead of being pinned.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Night Lords'), 'From the Shadows', 'All models with this special rule have a cover save of 5+ on the first game turn, even in open ground. This rule combine with any other rule related to cover save, but do not add to it.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Night Lords'), 'Dark Pact', 'Each time a unit with this ability is selected to shoot or fight, it can make a Dark Pact. If it does, the equipped weapon gains the Lethal Hit or Sustained Hits 1 special rule (players choice). Each time a unit makes a Dark Pact, after it has resolved its attacks, it must take a Leadership test; if that test is failed, that unit suffers D3 mortal wounds.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Night Lords'), 'Terror Assault', 'Units from this army have the following rules:
    — TERROR DESCENDS (AURA) In the Battle-shock step of your opponent’s Command phase, if an enemy unit that is below its Starting Strength is within 12" of one or more NIGHT LORDS units from your army, that enemy unit must take a Battle-shock test.
    — TERROR TACTICS Units with this trait have the following ability: ‘Terror Tactics (Aura): While an ennemy unit is within 9" of this unit, subtract 2 from the Leadership Characteristic of models in that unit and subtract 1 from Combat Attrition tests taken for that unit. Each time a model with this trait makes an attack with a melee weapon, if that attack targets a unit that was below Half-Swhen the attacking unit was selected to fight, or if that attack targets a unit that has a Leadership Characteristic of 5 or less, add 1 to that attack’s wound roll.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Death Guard'), 'Intractable', 'When making a Swooping Run tests, models with this special rulereduce the score they role by -1.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Death Guard'), 'Remorseless', 'All models with this special rule are immune to Fear and automatically pass any Pinning Test they need to make.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Death Guard'), 'Sons of Barbarus', 'All models with this special rule may re-roll failed Dangerous Terrain tests, and gain the Feel no Pain (4+) special rule against any wounds inflicted with the Fleshbane or Poison special rule.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Death Guard'), 'Nurgles Gift (Aura)', 'While an ennemy unit is within Contagion Range of this unit, subtract 1 from the Toughness Characteristic of models in that ennemy unit. Contagion Range changes over the course of the battle, as below:
    - 1st Battle round: Contagion Range = 3"
    - 2nd Battle round: Contagion Range = 6"
    - 3rd Battle round Onwards: Contagion Range = 9"'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Death Guard'), 'The Reaping', 'Units from this army have the following rules:
    — SPREAD OF SICKNESS: If you control an objective marker at the end of your Command phase and a Death Guard unit from your army is within range of that objective marker, that objective marker is said to be Infected and remains under your control even if you have no models within range of it, until your opponent controls it at the start or end of any turn. In addition, while an objective marker is Infected and under your control, it has the Nurgle’s Gift ability as if it were a unit from your army (so ennemy units within Contagion Range of it will have their Toughness Characteristic modified).'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Thousand Sons'), 'Cult Arcana', 'All unit in this army should have one of the following Cult Arcana. Add 1 to the Psychic test for power from the Discipline associated.
    Arcana           Discipline            Effect
    Pavoni           Biomancy              Quickblood: The unit adds +I to its Run and Sweeping Run distances.
    Raptora          Telekinesis           Kine Shields:  The unit gains a 6+ invulnerable save, or increases it by 1, to a maximum of 3+.
    Corvidae         Divination            Precognitive Strike:  The unit re-roll To Hit rolls of a 1 if it remained stationary.
    Athanean         Telepathy             Mental Fortitude: The unit is immune to Fear and have the Adamantium Will special rule.
    Pyrae            Pyromancy             Ashen Blow: The unit gains the HoW special rule, or inflicts a second attacks of this type when it charges.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Thousand Sons'), 'Signs & Portents', 'If any unit within this army suffers wounds as a result of a Perils of the Warp test, every units of this army must immediately take a Pinning test. If all of the Independent Character units in this army have been slain, all surviving units suffer a -I Leadership Characteristic penalty for the rest of the game and can no longer make Sweeping Runs.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - Thousand Sons'), 'The Axis of Dissolution and The Guard of the Crimson King', 'Units from this army have the following rules:
    — ASTRAL WARFARE: When generating Warp Charge, the controlling player may roll an additional D6 and select the highest of the two results.
    — WREATHED IN LIGHTNING, THEY REND THE VEIL: When Terminator Unit arrive via Deep Strike, they gain the Fear special rule if they did not already possess it and may re-roll failed invulnerable saves of a 1 until their controlling player’’s next turn
    — THE ALAMBIC OF ADAMANT: Unit form this Detachment automatically pass any Morale checks or Pinning tests they are called on to make if they are within 6" of an objective when the test is taken.
    — THE CAUSTIC OF GRACE: Unit form this Detachment may fire Overwatch on 5+ instead of 6+.
    — THE TRANSITION OF VITRIOL: Unit form this Detachment may re-roll failed To Hit and To Wound rolls against ennemy models which are Falling Back.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - World Eaters'), 'Incarnate Violence', 'All models with this special rule may re-roll To Wound rolls of a 1 on any turn in which they charge unless they made an Disordered charge. Character with this special rule also  gain +1 WS when fighting in Challenge.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - World Eaters'), 'Bloodlust', 'Units with this special rule consolidate toward the nearest ennemy unit they can harm. If this unit needs a Morale check after losing, roll a D6 before falling back; on a 4+, they stay. After the first assault, the unit gains the Rage special rule for the battles duration.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - World Eaters'), 'Blood Madness', 'When a unit with this special rule is affected by the Rage special rule, it must always make a Sweeping Runs if able and cannot Go to Ground or choose to fail a Morale check.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - World Eaters'), 'Blessing of Khorne', 'At the start of each battle round, roll eight D6, and use those to activate up to two Blessings of Khorne but you can only activate each once. Any unused dice are then discarded. Once activated, it applies to all units from your army until the end of the battle round.
    RAGE-FUELLED INVIGORATION  Any Double                 Add 2" to the Move Characteristic of models in this unit.
    WRATHFUL DEVOTION          Any Double                 Models in this unit have the Feel no Pain 6+ ability, or add 1 to their FnP rolls.
    MARTIAL EXCELLENCE         Double 3+                  Melee weapons equipped by models gain the Sustained Hits 1 special rule.
    TOTAL CARNAGE              Double 4+ or Any triple    Each time a model in this unit is destroyed by a melee attack, if that model has not fought this phase, roll one D6: on a 4+ he can fight last, and is then removed.
    WARP BLADES                Double 5+ or Any Triple    Melee weapons equipped by models in this unit have the Lethal Hits ability.
    UNBRIDLED BLOODLUST        Double 6 or Triple 4+      This unit is eligible to declare a charge in a turn in which it Run.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Heretic Astartes - World Eaters'), 'Berserker Assault', 'Units from this army have the following rules:
    — BERSERKER CHARGE Units with this trait gain the Hatred Special rule while outside of their own deployement zone.
    — UNSTOPPABLE WAVE Units with this trait must re-roll failed Pinning tests and must re-roll their Run roll results of 1.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Craftworld - Biel-Tan'), 'Stands of Fate', 'At the start of the battle, make a Strands of Fate roll by rolling twelve D6. You can re-roll all of these dice, but if you do, roll one less D6, until you are satisfied with the results rolled (or until you only have a single D6 remaining). These results cannot be changed or re-rolled further, unless a rule specifically states otherwise.
    Once per phase, before making a dice roll for a model or unit from your army with the this ability, you can use one of those Fate dice by selecting one of those to substitute that dice roll (this counts as an unmodified dice roll).
    Each Fate dice can only be used in this way once. You can use Fate dice for any of the following types of dice roll: Run roll / Battle-shock test / Charge roll / Damage roll / Hit roll / Saving throw / Wound roll'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Craftworld - Biel-Tan'), 'Battle Focus', 'Units from this army have the following rules:
    — This unit is eligible to shoot in a turn in which it Run, but if it does so, then until the end of the phase, models in this unit cannot make attacks with Heavy weapons they are equipped with, and when resolving those attacks, this unit is treated as having Remained Stationary.
    — In your Shooting phase, after this unit has finished making its attacks, unless it Fell Back or Run this turn, this unit can move. Roll one D6: each model in this unit can make a Normal Move of up to a distance in inches equal to the result, as if it were your Movement phase. A unit that makes a Battle Focus move cannot embark within a Transport model with that move, and until the end of the turn, such a unit is not eligible to declare a charge. A unit cannot make a Battle Focus move if it arrived as Reinforcements this turn, and a unit cannot make more than one Battle Focus move per turn.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Craftworld - Biel-Tan'), 'Ancient Doom', 'A model with this special rule has the Hatred special rule against Daemons of Slaanesh or models with the Mark of Slaanesh. Furthermore, when making Fear tests, a unit containing at least one model with this special rule suffers a -1 penalty to its Leadership if it is engaged in combat with a unit that contains at least one model with the Mark of Slaanesh or the Daemon of Slaanesh special rule. Moreover, you must add 1 to Morale tests for this unit if it is within 3" of any Slaanesh units.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Craftworld - Biel-Tan'), 'Shepherds of the Dead', 'Each time an ASURYANI PSYKER model from your army is destroyed by an enemy unit, that enemy unit gains a Vengeful Dead token. Each time a WRAITH CONSTRUCT model from your army makes an attack that targets a unit with one or more Vengeful Dead tokens, add 1 to the Hit roll and add 1 to the Wound roll.
    ASURYANI PSYKER models from your army have the following ability:
    Spirit Guides (Aura): While a WRAITHBLADES, WRAITHGUARD or WRAITHLORD unit from your army is within 12" of this model, that unit has the Battle Focus ability.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Craftworld - Biel-Tan'), 'Martial Grace', 'At the start of the battle round, you receive 1 additional Battle Focus token.
    —Each time a unit from your army performs the Swift as the Wind Agile Manoeuvre, until the end of the phase, add an additional 1" to the Move Characteristic of models in that unit.
    — Each time a unit from your army performs an Agile Manoeuvre that involves rolling a D6, add 1 to the result.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Craftworld - Biel-Tan'), 'Defend at All Costs', 'Each time a DIRE AVENGER, GUARDIAN, SUPPORT WEAPON or WAR WALKER model from your army makes an attack, if that model’s unit and/or the target unit are within range of one or more objective markers, add 1 to the Hit roll.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Craftworld - Biel-Tan'), 'Path of the Warrior', 'Each time an ASPECT WARRIORS or AVATAR OF KHAINE unit from your army is selected to shoot or fight, select one of the following abilities for it to gain until the end of the phase:
    — Each time a model in this unit makes an attack, re-roll a Hit roll of 1.
    — Each time a model in this unit makes an attack, re-roll a Wound roll of 1.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Drukhari'), 'Power from Pain', 'Each time one of your unit makes fail a Battle-shock test, makes passed under half wound or destroy an ennemy unit, or becomes under half wounds, it gains 1 Pain token.
    1  Pain token     Feel no Pain (6+)
    2  Pain tokens    Feel no Pain
    3  Pain tokens    Feel no Pain, Fear
    4  Pain tokens    Feel no Pain, Fear, Furious Charge
    5  Pain tokens    Feel no Pain, Fear, Furious Charge, Fearless
    6  Pain tokens    Feel no Pain, Fear, Furious Charge, Fearless, Rage
    7+ Pain tokens    Feel no Pain, Fear, Furious Charge, Fearless, Rage, Rampage'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Drukhari'), 'The Serpent’s Kiss', 'Re-roll wound rolls of 1 made for melee weapons and poisoned weapons used by models from this detachment.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Drukhari'), 'The Speed of the Kill', 'Units from this detachment can charge in the same turn in which they Run, and you can re-roll failed charge rolls for those units.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Drukhari'), 'Distillers of Fear', 'Models in ennemy units must subtract 1 from their Leadership Characteristic for each unit from this detachment that is within 6" (to a maximum of -3).'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Necrons - Dynasty Mephrit'), 'Reanimation Protocols', 'At the end of your Command phase, each unit from your army with this ability activates its Reanimation Protocols and reanimates D3 wounds. Moreover, roll a D6 each time the model suffers an unsaved Wound, subtracting 1 from the result if the hit that inflicted the Wound had the Instant Death special rule. On a 5+, discount the unsaved Wound and treat it as having been saved. Certain special rules and wargear items can provide modifiers to this dice roll; these are cumulative, but the required dice roll can never be improved to be better than 4+. If a unit has both the Reanimation Protocols and Feel no Pain special rules, you can choose to use one special rule or the other to attempt to avoid the Wound, but not both. Choose which of the two special rules you will use each time a model suffers an unsaved Wound.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Necrons - Dynasty Mephrit'), 'Uncanny Artificers', 'Units from this army have the following rules:
    — Each time a model with this code would lose a wound as the result of a mortal wound, roll one D6; on a 5+ that wound is not lost.
    — Each time you make Reanimation Protocol rolls for this unit, you can re-roll one of the dice.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Orks - Clan Snakebites'), 'Waaagh!', 'Units from this army have the following rules:
    Call Da Waaagh!: Once per battle, at the start of the turn, you can call a Waaagh! If you do, until the start of the next battle round:
    — Orks units from your army are eligible to declare a charge in a turn in which they Run.
    — Add 1 to the Sand Attacks Characteristics of melee weapons equipped by Orks models from your army.
    — Orks models from your army have a 5++ invulnerable save.
    Get Stuck In!: The turn next to the Call Da Waaagh! turn, until the start of the next battle round:
    — Add 1 to the Sand Attacks Characteristics of melee weapons equipped by Orks models from your army.
    — Orks models from your army have a 6++ invulnerable save.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Orks - Clan Snakebites'), 'Mob Rule', 'When using the Leadership Characteristic of this unit, you can use either its own Leadership Characteristic, or you can choose for the Characteristic to be equal to either the number of models in the unit or the number of models in another friendly unit within 6".'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Orks - Clan Snakebites'), '’Ere We Go!', 'This unit can re-roll a single dice when determining its charge range.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Orks - Clan Snakebites'), 'Get Stuck In', 'Melee weapons equipped by Orks models from your army have the Sustained Hits 1 special rule.'),
    ((SELECT Faction_id FROM factions WHERE Faction_name = 'Orks - Clan Snakebites'), 'Taktiks', 'A unit with this kultur gains the benefit of cover, even while they are not entirely on or in a terrain feature, if the ennemy model making the attack is at least 18" away. In addition, units with this kultur can shoot or charge (but not both) even if they Fell Back in the same turn. If such a unit is embarked, it can only do so if the Transport that Fell Back also has this kul')
;
