-- Types Table
INSERT INTO types (types_name, types_desc)
VALUES
    ('Infantry',
    'Infantries are the most common and dependable units in Warhammer 40,000. As the bulk of the rules are concerned with them, there are no additional rules to present here.
    '),
    ('Bike',
    'Bikes have several special rules: they cannot Go to Ground or be Pinned, treat difficult terrain as dangerous, move 3D6" when Falling Back, and have the Hammer of Wrath, Jink, Relentless, and Very Bulky abilities. They cannot Run but can Turbo-boost instead, adding 12" to their Movement Characteristic, but cannot shoot, charge, or take other actions until their next turn after Turbo-boosting.
    '),
    ('Jetbike',
    'Jetbikes have special rules: they cannot Go to Ground or be Pinned, are not slowed by difficult terrain, can move over other models and terrain, but must test for Dangerous Terrain if they start or end their move in it. They move 3D6" when Falling Back and have Hammer of Wrath, Jink, Relentless, and Very Bulky abilities. They cannot Run but can Turbo-boost instead, adding 24" to their Movement Characteristic, but cannot shoot, charge, or take other actions until their next turn after Turbo-boosting.
    '),
    ('Artillery',
    'If all crew models are killed, the guns are removed. Additional models added to the crew can operate the guns. Independent Characters cannot operate the guns. Artillery units need at least one crewman per gun to move. Crewmen within 2" of a gun in the Shooting phase can fire it, while others can fire side arms. Guns require line of sight to the target from both the gun model and firing crewman. Wounds are allocated to the crew first. Artillery units cannot charge. In combat, only engaged crew models can fight back. Abandoned guns without crewmen are removed when the unit Falls Back. If forced to Fall Back from close combat, the unit is automatically destroyed if the enemy can make a Sweeping Run.
    '),
    ('Jump',
    'Jump units can use their jump packs once per turn in either the Movement or Assault phase. They cannot use them in both phases in the same turn. If not using jump packs, they move normally. The entire unit must use the same form of movement. Jump units move up to 2 times their Movement Characteristic when using jump packs in the Movement phase and can reroll charge distance and gain the Hammer of Wrath rule when using jump packs to charge. Their Fall-Back moves are always 3D6". They also have the Bulky and Deep Strike special rules.
    '),
    ('Jet Pack',
    'Jet Pack units have the option to move as normal or use their jet packs. When using jet packs, they can move over models and terrain freely but must test for Dangerous Terrain if starting or ending in difficult terrain. They cannot end their move on other models unless its impassable terrain treated as dangerous. In the Assault phase, they can move up to 2D6" if not charging, even after shooting or running. They also have the Bulky, Deep Strike, and Relentless special rules.
    '),
    ('Beast',
    'Beasts are not slowed by difficult terrain (even when charging) and automatically pass Dangerous Terrain tests. Beasts make Fall Back moves just like Infantry, except that they move 3D6". Beasts have the Fleet special rule.
    '),
    ('Cavalry',
    'Cavalries are not slowed down by difficult terrain (even when charging). However, Cavalry models treat all difficult terrain as dangerous terrain instead. Cavalries are not slowed down by difficult terrain (even when charging). However, Cavalry models treat all difficult terrain as dangerous terrain instead. Cavalries have the Fleet and Hammer of Wrath special rules.
    '),
    ('Monster',
    'Monsters may never Go to Ground, voluntarily or otherwise. Monsters have the Fear, Hammer of Wrath, Move Through Cover, Relentless and Smash special rules.
    '),
    ('Vehicle',
    '
    - Measuring Distances: As vehicle models do not usually have bases, the normal rule of measuring distances to or from a base cannot be used. Instead, for distances involving a vehicle, measure to and from their hull, ignore gun barrels, dozer blades, antennas, banners and other decorative elements. There is, however, the notable exception of a vehicle’s weaponry. When firing a vehicle’s weapons, ranges are measured from the muzzle of the firing weapon, whilst line of sight is determined from the weapon’s mounting point and along its barrel.
    - Movement Phase: Vehicles pivot around their center-point to turn, without moving. This maneuver does not count as movement, making the vehicle Stationary if it only pivots. Immobilized Vehicles cannot pivot. They cannot move over friendly models, like other units.
            Stationary: A vehicle that remains Stationary will be able to bring its full firepower to bear on the enemy.
            Combat Speed: A vehicle that travels up to Movement Characteristics is said to be moving at Combat Speed.
            Cruising Speed: A vehicle that travels up to 1,5 times its Movement Characteristics (round in superior) is said to be moving at Cruising Speed.
            Vehicles have a Pivot Value of 2" (Except for Flyers, which have a Pivot Value of 6"), reducing its Movement Characteristic as they change direction when moving. Note that the distance it can move is only reduced once for that move, regardless of how many times it pivots during that move.
        Difficult and Dangerous Terrain: Vehicles ignore slowdowns in broken terrain but treat it as dangerous. Failing a Dangerous Terrain test costs them a Hull Point and causes an Immobilized result.
    - Psychic Phase: Even Vehicles can harbor powerful connections to the Warp. Vehicles with the Psychic Pilot special rule manifest their psychic powers during the Psychic phase, as normal.
    - Shooting Phase: Vehicles with Relentless rule can fire weapons based on their movement:
            Stationary: All weapons at full accuracy.
            Combat Speed: All weapons at full accuracy, except Heavy weapon which Snap Shots.
            Cruising Speed: Only Snap Shots allowed.
        Ordnance Weapons: Vehicles can move and fire Ordnance weapons, but when they do, their other weapons can only make Snap Shots that turn. Even at Cruising Speed, Vehicles can Snap Shoot Ordnance, but cannot fire other Ordnance weapons unless it is a Snapshot.
        Line of Sight: When firing a vehicle’s weapons, check line of sight from each weapon’s mounting and along its barrel. If the target unit is in partial cover from some of the vehicle’s weapons, calculate cover saves for each firing weapon separately. Ensure the target is within the weapon’s arc of sight, even for Barrage weapons.
        Moving Flat Out: A vehicle can opt to move Flat Out instead of shooting, moving up to its Movement Characteristic plus 6". This movement triggers Dangerous Terrain tests. However, a Tank cannot move Flat Out if it performed a Tank Shock in the same turn.
        Shooting at Vehicles: When targeting a vehicle, a unit must have line of sight to its hull or turret. Roll To Hit and, If manifested, roll to penetrate the vehicle’s Armor Value. Shots are resolved against the facing from which they come; determine this by drawing two lines through the vehicle’s corners.
        Blast Weapons: When using a Blast weapon against a vehicle, place the marker over any part of the vehicle’s hull and roll for scatter. Each blast hitting the vehicle targets the Armor Value facing the firer, regardless of the marker’s position.
        Template Weapons: If a vehicle, or its base, is even partially under a template, it is hit on the Armor Value facing the firer.
        Glancing Hits: If a glancing hit was scored, the vehicle loses 1 Hull Point for each D inflicted.
        Penetrating Hits: Critical Wound performed penetrating hits. If a penetrating hit was scored, the vehicle not only loses 1 Hull Point for each D inflicted, but also suffers additional damage.
            Resolving a Damage: After deducting Hull Points, roll a D6 for each penetrating hit, substract the actual remaining Hull Points of the Vehicle from the result, and consult the Vehicle Damage table, applying modifiers from high AP weapons. All modifiers are cumulative.
            Vehicle Damage Table:
                1-3: Crew Shaken. The vehicle can only fire Snap Shots until the end of its next turn.
                4: Crew Stunned. The vehicle can only fire Snap Shots until the end of its next turn. If the vehicle is a Zooming Flyer, it must move 20" and cannot turn at all in its next Movement phase. If the vehicle is not a Zooming Flyer, it cannot move or pivot until the end of its next turn.
                5: Weapon Destroyed. One of the vehicle’s weapons (facing the firer) is destroyed (including any combi-, built in, out of ammunition weapons or upgrades that are weapons. If a vehicle has no weapons left, treat this result as an Immobilized result instead.
                6: Immobilized. If the vehicle is a Chariot, count this result as a Crew Stunned result instead. If the vehicle is a Zooming Flyer, roll a further D6: on a 1 or 2, that Flyer will immediately Crash and Burn! on a 3+ the Flyer counts this result as Crew Stunned instead. Other Vehicles are Immobilized. An Immobilized vehicle cannot move. It may not even pivot, but its turrets may continue to rotate to select targets, and other weapons retain their normal arcs of fire. Any Immobilized results suffered by an already Immobilized vehicle instead remove an additional Hull Point.
                7+: Explodes! The vehicle is destroyed. If the vehicle is a Zooming Flyer, it will immediately Crash and Burn! otherwise nearby units are impacted by the deadly demise special rule listed in the Vehicle profile. The vehicle is then removed from the battlefield.
            High AP Weapons: AP-4 weapons add +1 to the Vehicle Damage table roll for penetrating hits, while AP-5 weapons add +2.
            Vehicle Damage Results and Hull Points: If a rule inflicts Crew Shaken, Crew Stunned, Weapon Destroyed, or Immobilized on a vehicle without mentioning losing a Hull Point or taking damage, apply the corresponding result from the Vehicle Damage chart without losing any Hull Points.
            Wrecked Vehicles: A vehicle reduced to 0 Hull Points becomes a Wreck. If it was a Flyer in Zoom mode, it undergoes a Crash and Burn! as per the Vehicle Damage table. Otherwise, it remains in place as difficult terrain, like Citadel scenery.
            Crash and Burn! Centre the large blast marker over the Flyer, it then scatters 2D6". Any units under the blast marker’s final position are impacted by the deadly demise special rule listed in the Vehicle profile. The Flyer is then removed from the battlefield.
        Cover/Obscured Targets: 
            For a vehicle to be in cover, at least 25% of its facing must be obscured from the firer’s perspective.
            Being inside terrain does not automatically provide cover; the 25% rule applies.
            Vehicles cannot Go to Ground.
            Obscured Vehicles take cover saves against hits that cause damage, like non-vehicle models.
        If a unit cannot see one facing but can see another, it can still shoot, with the target gaining a +1 to its cover save.
    - Assault Phase:
        Assaulting with a Vehicle: Vehicles cannot charge. Note that Walkers and Chariots are exceptions to this.
        Assaulting a Vehicle:
            Charging a Vehicle: A unit can charge a vehicle in their Charge Phase. The charge move is conducted the same as for charging other enemy units.
            Vehicles and Overwatch: Unless specified otherwise, Vehicles cannot make Overwatch fire.
        Fighting the Assault: Vehicle fight using their Melee Weapons.
            In close combat, all hits are resolved against the vehicle’s rear Armor, to represent the chance of attacking a vulnerable spot.
        Assault Results: In combat against Vehicles, there is no Pile In or locking in combat. Calculate assault results normally, regarding the number of Hull Points lost. If the vehicle loses, nothing changes. If it wins, the enemy may have to Fall Back on a failed Morale check, but there is no Consolidation or Sweeping Run. nothing happens.
        Successive Turns: If a vehicle stays stationary after surviving an assault, enemy models in base contact are not locked in combat and can be shot during the Shooting phase. If the vehicle pivots, move these models aside and then back into contact afterward. During the Assault phase, units with models in contact can attack the vehicle again.
    - Vehicles, Leadership and Morale: Vehicles are considered steadfast, never taking Morale checks or Leadership tests. Any occasional setbacks are represented by Crew Shaken and Crew Stunned results on the Vehicle Damage table.
    ')
;