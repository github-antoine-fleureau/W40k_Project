-- Special rules Table
INSERT INTO special_rules (Rule_name, Rule_desc)
VALUES
    ('Absorbed Warp Charge',
    '
    - When firing with this weapon, first add up the combined mastery levels of all Psyker units, friend or foe, that are within 12" of the firer (though Psyker units that are embarked within Transports do not count), and pick up that many dice. You can then add up to 3 more dice to this hand by removing them from your own Warp Charge pool. The total number of dice in your hand is the number of shots the weapon now fires.
    '),
    ('Acute Senses',
    '
    - If a unit contains at least one model with this special rule, and that unit arrives on a random table edge (due to Outflank, or other special rules), then you can choose which table edge they arrive from.
    '),
    ('Adamantium Will',
    '
    - A unit that contains at least one model with this special rule receives a +1 bonus to Deny the Witch tests.
    '),
    ('And They Shall Know No Fear',
    '
    - A unit that contains at least one model with this special rule automatically passes Fear and Regroup tests. When it Regroups, the unit does not make the 3" Regroup move, but can instead move, shoot (or Run) and declare charges normally in that turn. Furthermore, if a unit containing one or more models with this special rule is caught by a Sweeping Advance, they are not destroyed, but remain locked in combat instead.
    '),
    ('Anti',
    '
    - This rule is always presented as Anti-X where X identifies a specific type of unit. A unit that contains at least one model with this special rule re-rolls failed To Hit and To Wound rolls if attacking the Anti-Type ennemy. This applies both to shooting and close combat attacks.
    '),
    ('Armourbane',
    '
    - If a model has this special rule, or is attacking with a Melee weapon that has this special rule, it rolls an additional D6 to determinte tha Damage Characteristics inflicted to a Vehicle in close combat. If a model makes a shooting attack with a weapon that has this special rule, it rolls an additional D6 to determinte tha Damage Characteristics inflicted to a Vehicle. In either case, this special rule has no effect against non-Vehicle models.
    '),
    ('Assault',
    '
    - If a unit that Run this turn contains any models equipped with Assault weapons, it is still eligible to shoot in this turn’s Shooting phase. When such a unit is selected to shoot, you can only resolve attacks using Assault weapons its models are equipped with. A model carrying an Assault weapon can still charge into close combat in the Assault phase.
    '),
    ('Assault Vehicle',
    '
    - Passengers disembarking from Access Points on a Vehicle with this special rule can charge on the turn they do so (even in a turn that the Vehicle was destroyed, or in the following turn).
    '),
    ('Barrage',
    '
    - All Barrage weapons use blast markers and consequently use the rules for Blast weapons, as indicated by their profile, with the following exceptions:
        - Barrage weapons can fire indirectly. This means they can fire at a target that they do not have line of sight to, as long as the target is beyond their minimum range (if applicable). When firing indirectly, the CT of the firer is not subtracted from the scatter distance; unless a Hit! is rolled on the scatter dice, the blast marker always scatters a full 2D6". If a Barrage weapon has line of sight to its target it can fire directly, even if the target is within its minimum range.
            To determine whether a unit wounded by a Barrage weapon is allowed a cover save, and when determining Wound allocation, always assume the shot is coming from the centre of the blast marker, instead of from the firing model. Hits against Vehicles are always resolved against their side armour.
        - Multiple Barrages: If a unit fires more than one shot with the Barrage special rule, they fire together, as follows:
            The Barrage weapon closest to the target unit fires first. Place the blast marker over the target, then roll for scatter as described earlier.
            Once the first marker is placed, roll a scatter dice for each other Barrage weapon shot fired by the unit. If an arrow is rolled, place the marker in the direction indicated so that it is next to and touching the edge of the first marker placed (see diagram above).
            If a Hit! is rolled, the firing player places the marker so that it touches any part of any marker in the group that has already been placed. Note that it is perfectly fine if some markers are placed overlapping one another (including being directly over the top of a previous marker).
            Once all of the markers are in place, add up the number of hits and roll To Wound for these hits. To determine Wound allocation and cover saves, always assume the shot is coming from the centre of the first blast marker that was placed in the Multiple Barrage.
        - Apocalyptic Barrage: An Apocalyptic Barrage follows all of the rules for a Barrage weapon, but uses the clover-shaped apocalyptic barrage marker. Before the marker is placed, the attacker is allowed to rotate the marker about its centre to maximise the number of models that could potentially be hit. Place the marker and roll for scatter in the same way you would for a Blast. If the marker scatters, be careful to maintain the same orientation as you move it.
            Once the final position of the marker has been determined, roll a number of dice equal to the number of attacks on the weapon’s profile. So, for example, with a weapon with the type ‘Heavy 4, Apocalyptic Barrage’, you would roll four dice. Each dice roll corresponds to a ‘strike’ on one of the circles on the apocalyptic barrage marker. For example, each roll of a 2 indicates a strike on circle number 2. Resolve the strikes as for a Multiple Barrage, as if each were a Barrage attack that had landed on that circle and hit all the models underneath it. To determine Wound allocation and cover saves, always assume the shot is coming from the centre of the entire apocalyptic barrage marker.
    '),
    ('Bio-cataclysm',
    '
    - If a non-Vehicle model is slain as a result of this weapon, centre the large blast marker over that model before removing the model as a casualty. Each Figurines under the marker suffer a S5/AP-2/D1 hits. These hits have the Ignores Cover special rule.
    '),
    ('Bladestorm',
    '
    - When firing a weapon with this special rule, a Critical Wound is resolved at AP-4
    '),
    ('Blade Whip',
    '
    - Models fighting with a razorflail re-roll all failed To Hit rolls in close combat.
    '),
    ('Blast',
    '
    - When firing a Blast weapon, models do not roll To Hit. Instead, just pick one enemy model visible to the firer and place the 3" blast marker with its hole entirely over the base of the target model (see diagram), or its hull if the target is a Vehicle. The hole at the centre of the marker must be within the weapon’s maximum range. You cannot place the blast marker so that the base or hull of any friendly model is even partially under it.
        Roll for the blast marker to scatter and subtract 7 minus the firer’s CT from the distance (if any) that it scatters, to a minimum of 0". Note that it is possible, and absolutely fine, for a shot to scatter beyond the weapon’s maximum or minimum range and line of sight. In these cases, hits are worked out as normal and can hit and wound units out of range and line of sight (or even your own units, or models locked in combat). If the shot scatters so that the hole in the centre of the marker is beyond the table’s edge, the shot is a complete miss and is discarded.
        Once the final position of the blast marker has been determined, take a good look at it from above, each unit suffers one hit for each of their models which is fully or partially beneath the blast marker, even if those models are not within the firer’s line of sight.
        Once the number of hits inflicted on the unit has been worked out, roll To Wound and save as normal. Remember that any Wounds inflicted by weapons with the Blast special rule must be allocated to the closest model in the target unit even if it is out of sight of any models from the attacking unit.
    - Multiple Blasts: If a unit is firing more than one shot with the Blast special rule, scatter each shot, one at a time, as described above and determine how many hits are scored with each individual blast marker. After the last shot, add up the total number of hits scored and roll all of the To Wound rolls as normal.
    - Blast Weapons and Re-rolls: If a model has the ability to re-roll its rolls To Hit and chooses to do so after firing a Blast weapon, the player must re-roll both the scatter dice and the 2D6.
    - Blast Weapons and Snap Shots: Blast weapons cannot be fired as Snap Shots.
    - Large Blast: Large Blast weapons use the 5" blast marker, but otherwise obey all the rules for Blast weapons.
    - Massive Blast: Massive Blast weapons use the 7" blast marker, but otherwise obey all the rules for Blast weapons.
    - Apocalyptic Blast: Apocalyptic Blast: Apocalyptic Blast weapons use the 10 " blast marker, but otherwise obey all the rules for Blast weapons.
    - Apocalyptic Mega Blast (5"/7"/10"): Apocalyptic Mega-blast weapons use the apocalyptic blast marker. They obey the rules for Blast weapons, with the following exceptions:
        Apocalyptic Mega-blast weapons have three S Values and three AP values. Correspondingly, the apocalyptic blast marker is divided into three zones, one for each S and AP value. The S and AP of any hits depends on the zone where the target model is located. The first S and AP value are used for the inner zone, the second S and AP value are used for the middle zone, and the third S and AP value are used for the outer zone. Always use the best S and AP if a model straddles two or more zones. If a unit has models in several zones, work out the hits inflicted for each zone separately. Note that there will be a different Wound pool for each zone.
    '),
    ('Blind',
    '- Any unit hit by one or more models or weapons with this special rule must take an Initiative test at the end of the current phase. If the test is passed, all is well. If the Initiative test is failed, all models in the unit are reduced to WS and CT 6+ until the end of their next turn. Should the attacking unit hit themselves, we assume they are prepared and they automatically pass the test.
    '),
    ('Bombs',
    '
    - Bombs are weapon types unique to Flyers and Flyer Monsters. All Bombs have the One Use Only special rule. Unlike other weapons, Bombs must be used in the Movement phase of their turn, in a special kind of attack called a Bombing Run. A model can only drop one Bomb in its Movement phase. If a model drops a Bomb, it counts as having already fired one weapon in its ensuing Shooting phase and may not move Flat Out.
    '),
    ('Brotherhood of Psykers/Sorcerers',
    '
    - A unit containing at least one model with this special rule is a Psyker unit, if no Mastery Level is shown, then that unit has a Mastery Level of 1. Rules for manifesting psychic powers can be found in the Psychic phase section. The unit follows all the normal rules for Psykers, with the following clarifications:
      When manifesting a psychic power, this unit measures range and line of sight from, and uses the Characteristics profile (if required) of, any one model in the unit that has the Brotherhood of Psykers/Sorcerers special rule (controlling player’s choice).
      If this unit suffers Perils of the Warp, or is hit by an attack that specifically targets Psykers, the hits are Randomly Allocated amongst models with the Brotherhood of Psykers/Sorcerers special rule. If a model with this special rule gains or loses a psychic power, all other models with this special rule in their unit also gain or lose that power.'),
    ('Bulky',
    '
    - Bulky models count as two models for the purposes of Transport Capacity.
    - Very Bulky: Very Bulky models instead count as three models.
    - Extremely Bulky: Extremely Bulky models instead count as five models.
    '),
    ('Burst Pistol',
    '
    - A weapon with this special rule fires five shots when fired, but is otherwise treated as a Pistol.
    '),
    ('Chariot',
    '
    - Characters Riding Chariots: A Character on a Chariot is called the rider. The rider cannot disembark or be targeted separately from the Chariot. If either the rider or the Chariot is destroyed, the entire model is removed. If the rider has a special rule to return, the Chariot returns with one Hull Point. Chariots move as standard Vehicles.
    - Shooting with & at Chariots: The rider can shoot his weapons as if stationary, even if the Chariot moved. Hits against a Chariot unit are allocated to the rider or Chariot by the controlling player. Blast hits always target the Chariot. Precision Shots are allocated by the firer. Resolve hits against the Chariot’s Armor Values based on the firing model’s position.
    - Assaults: Chariots charge like Bikes, needing to avoid difficult terrain. In close combat, they fight like Infantry. Attacks in close combat are directed at either the rider or the Chariot, not split between them. Grenades can only target the Chariot. Hits against the Chariot use its front Armor. The rider can issue or accept challenges but cannot perform a Glorious Intervention.
    - Crew & Beasts: Chariots with crew or beasts cannot be targeted separately. Attacks against a riderless Chariot hit the Vehicle. Riderless Chariots count Immobilized results as Crew Stunned. They suffer a glancing hit if they fail a Dangerous Terrain test. They have D6 Hammer of Wrath attacks. The rider has Fearless and Relentless. It can fire Overwatch if charged but not Chariot-mounted weapons.
    '),
    ('Colossal',
    '
    - A model fighting with this weapon Piles in and fights at Initiative step 1.
    '),
    ('Concussive',
    '- A model that suffers one or more unsaved Wounds from a weapon with this special rule is reduced to Initiative 1 until the end of the following Assault phase.
    '),
    ('Counter-Attack',
    '
    - If a unit contains at least one model with this special rule, and that unit is charged, every model with the Counter-attack special rule in the unit gets +1 Attack until the end of the phase.
      If, when charged, the unit was already locked in combat, the Counter-attack special rule has no effect.
    '),
    ('Crawling Fire',
    '
    - The firer may move the Blast marker up to 2" in any direction so long as this would cover more models than initialy placed.
    '),
    ('Crusader',
    '
    - A unit with this rule rolls an extra dice for Run moves and picks the highest result. It also adds D3 to its Sweeping Run totals (roll each time).
    '),
    ('Daemon',
    '
    - Models with the Daemon special rule have a 5++/5++ invulnerable save (unless it has a better one), and also have the Fear special rule.
    '),
    ('Decapiting Blow',
    '
    - Any To Wound rolls of 6 made with this weapon have the Instant Death special rule.
    '),
    ('Deep Strike',
    '
    - In order for a unit to be able to Deep Strike, all models in the unit must have the Deep Strike special rule and the unit must start the game in Reserve. When placing the unit in Reserve, you must tell your opponent that it will be arriving by Deep Strike (sometimes called Deep Strike Reserve). Some units must arrive by Deep Strike, they always begin the game in Reserve and always arrive by Deep Strike.
        Roll for the arrival of all Deep Striking units as specified in the rules for Reserves and then deploy them as follows:
            First, place one model from the unit anywhere on the table, in the position where you would like it to arrive, and roll for scatter to determine the model’s final position. If a Vehicle scatters when arriving via Deep Strike, do not change its facing.
            Next, the unit’s remaining models are arranged around the first one. Models must be placed in base contact with the first model and begin to form a circle around it. When the first circle is complete, a further concentric circle must be placed with each model touching the circle inside it. Each circle must include as many models as will fit.
        Models deploying via Deep Strike treat all difficult terrain as dangerous terrain.
        In the Movement phase during which they arrive, Deep Striking units may not move any further, other than to disembark from a Deep Striking Transport Vehicle if they are in one.
        In that turn’s Shooting phase, these units can only fire snap shots. Vehicles, except for Walkers, count as having moved at Combat Speed (even Immobilised Vehicles). This can affect the number of weapons they can fire with their full CT.
        In that turn’s Assault phase, these units can charge but they count as charging across difficult terrain.
    - Deep Strike and Transports
        Units do not confer the Deep Strike special rule onto a Transport Vehicle they are embarked inside. A Transport Vehicle with Deep Strike may Deep Strike regardless of whether its passengers have Deep Strike or not.
    - Deep Strike Mishaps: If any of the models in a Deep Striking unit cannot be deployed, because at least one model would land partially or fully off the table, in impassable terrain, on top of a friendly model, or on top of or within 1" of an enemy model, something has gone wrong. The controlling player must roll on the Deep Strike Mishap table (below) and apply the results. If the unfortunate unit is also a Transport, the Deep Strike Mishap result applies to both the unit and anything embarked within it.
         D6     Effect
         1      Terrible Accident! The entire unit is destroyed!
        2-3     Misplaced. Your opponent may deploy the unit anywhere on the table (excluding impassable terrain, but including difficult terrain, which of course counts as dangerous for Deep Striking units), in a valid Deep Strike formation, but without rolling for scatter. Units embarked on a misplaced Transport can disembark during their Movement phase as normal.
        4-6     Delayed. The unit is placed in Ongoing Reserves.
    '),
    ('Deflagrate',
    '
    - After resolved this weapon attacks, count the number of unsaved Wounds caused on the target unit. Immediately resolve a number of additional automatic S6/AP-1/D1 hits on the same unit equal to the number of unsaved Wounds. Models in the target unit must still be in range in order for these additional hits to take effect. Any further Wounds caused as a result of this special rule do not cause any further hits.
    '),
    ('Destroyers',
    '
    - If a weapon has a D instead of a S value in its profile, it is a Destroyer weapon. To resolve a Destroyer weapon’s attack, roll To Hit as you would for a standard attack. If the attack hits, roll on the table below instead of rolling To Wound. Most Destroyer Weapons have AP1 or AP2, so armour saves are not typically allowed. Cover saves and invulnerable saves can be taken against hits from a Destroyer weapon as normal, unless a Devastating Hit or Deathblow result is rolled. For the purposes of determining if a Destroyer hit has the Instant Death special rule, assume it has S20.
        
         D6	Vehicle
         1	Lucky Escape: The model is unharmed.
        2-5	Solid Hit: The model suffers D3 Wounds in addition to any Damage Characteristic.
         6	Devastating Hit: The model suffers D6+6 Mortal Wounds in addition to any Damage Characteristic.
        
         D6	Non-Vehicle
         1	Lucky Escape: The model is unharmed.
        2-5	Seriously Wounded: The model suffers D3 Mortal Wounds in addition to any Damage Characteristic.
         6	Deathblow: The model suffers D6+6 Mortal Wounds in addition to any Damage Characteristic.
    '),
    ('Devastating Wound',
    '
    - Each time an attack is made with such a weapon, unmodified 6+ To Wounds inflict Mortal Wounds instead of classical wounds.
    '),
    ('Distort Scythe',
    '
    - When rolling on the Destroyer Weapon Attack table for a weapon that has this special rule, subtract 1 from the result of the D6 roll (to a minimum of 1). Furthermore, a weapon with this special rule is assumed to have S15 for the necessaries rule.
    '),
    ('Dragon’s Breath',
    '
    - When attacking using the Wall of Death special rule (see the Template rules), a weapon with this special rule inflicts D6 Hits instead of D3.
    '),
    ('Earthshatter',
    '
    - While attacking with this weapon, you can choose to forfeit his usual close combat attacks in order to place a Blast (3") Template anywhere in base-to-base contact that does not cover any friendly models. All models under the Template suffer a single automatic S8/AP-3/D3 Hit with the Strikedown special rule.
    '),
    ('Entropic Strike',
    '
    - If a model has this special rule, or is attacking with a Melee weapon that has this special rule, a To Wound roll of a 6 count as having AP-4.
    '),
    ('Eternal Warrior',
    '
    - If a model with this special rule suffers an unsaved Wound from an attack that inflicts Instant Death, it only reduces its Wounds by 1, instead of automatically reducing its Wounds to 0.
    '),
    ('Extra Attacks',
    '
    - Each time the bearer of such a weapon fights, it gains 1 attack with that weapon in addition to any other bonus.
    '),
    ('Fast',
    '
    - Fast Vehicles can move at Combat Speed and fire as if Stationary. Those at Cruising Speed can fire two weapons at full WS, others only make Snap Shots.
    '),
    ('Fatal Precision',
    '
    - Attacks with this special rule gain the Precision strikes and Devastating Wounds special rules on 4+.
    '),
    ('Fear',
    '
    - At the start of each Fight sub-phase, a unit in base contact with one or more enemy models that cause Fear must take a Leadership test (called a Fear test) before any blows are struck. If the test is failed all models in the unit have their WS reduced to 6+ for the remainder of that Fight sub-phase. Note that a model that causes Fear is not itself immune to Fear, and will still need to take a Fear test if it is base contact with any enemy models that cause Fear.
    '),
    ('Fearless',
    '
    - Units containing one or more models with the Fearless special rule automatically pass Pinning, Fear, Regroup tests and Morale checks, but cannot Go to Ground and cannot choose to fail a Morale check due to the Our Weapons Are Useless rule. If a unit has Gone to Ground and then gains the Fearless special rule, all the effects of Go to Ground are immediately cancelled.
    '),
    ('Feel no Pain',
    '
    - When a model with this special rule suffers an unsaved Wound, it can make a special Feel no Pain roll to avoid being wounded (this is not a saving throw and so can be used against attacks that state that ‘no saves of any kind are allowed’, for example those inflicted by Perils of the Warp).
        Feel no Pain saves may not be taken against Destroyer attacks or against unsaved Wounds that have the Instant Death special rule.
        Roll a D6 each time an unsaved Wound is suffered. On a 5+, the unsaved Wound is discounted.
        If a unit has the Feel no Pain special rule with a number in brackets afterwards then the number in brackets is the D6 result needed to discount the Wound. A model’s Feel no Pain roll can never be improved beyond 2+.
    '),
    ('Fight First',
    '
    - Units with this ability that are eligible to fight do so in the Fights First step (as having Initiative 10), provided every model in the unit has this ability.
    '),
    ('Fleet',
    '
    - A unit composed entirely of models with this special rule can re-roll one or more of the dice when determining Run moves and charge ranges (such as a single D6 from a charge range roll, for example).
    '),
    ('Fleshbane',
    '
    - If a model has this special rule, or is attacking with a Melee weapon that has this special rule, they always Wound on a 2+ in close combat.
        Similarly, if a model makes a shooting attack with a weapon that has this special rule, they always Wound on a 2+.
        In either case, this special rule has no effect against Vehicles.
      '),
    ('Flyer',
    '
    - Flyers must begin the game as Reserves.
        Measuring: Flyers use Flying bases, but distances are measured to and from the hull, except for weapons and Fire Points. The base is used for embarking/disembarking and in close combat. Models can move beneath Flyers.
        Evade: All Flyers have the Jink special rule.
        Zoom: Flyers typically use a special move called Zoom. They must move at least their minimum Movement each turn while zooming. Zooming Flyers ignore intervening units and terrain. They do not take Dangerous Terrain tests and can choose to use the Sky fire rule in the Shooting phase.
        Tank Shock and Ramming: Zooming Flyers cannot Tank Shock or Ram, nor can they be Tank Shocked or Rammed.
        Hard To Hit: Shots resolved at a Zooming Flyer can only be resolved as Snap Shots (unless the model or weapon has the Sky fire special rule). Template and Blast weapons, and any other attacks that don’t roll To Hit, cannot hit Zooming Flyers.
        Charging: Zooming Flyers cannot be charged and cannot charge.
        Repairing: Certain models can repair Vehicle damage, including on Zooming Flyers, but only if they are embarked inside a Transport Flyer when attempting repairs.
        Leaving Combat Airspace: If a Flyer making a Zoom move leaves the board, intentionally or not, it enters Ongoing Reserves. Upon returning from Ongoing Reserves, the Flyer must Zoom back onto the board, even if it has the Hover type. A Flyer cannot leave the board on the same turn it enters play from Reserves.
        Hover: Flyers with the Hover type can choose to Hover instead of Zooming. Hovering allows Flyers to ignore the Pivot Value when moving. Flyers must declare their movement type before moving each turn. If part of a squadron, all Vehicles must choose the same movement type. Hovering Flyers cannot switch to Zoom mode if Immobilized.
    '),
    ('Force',
    '
    -Any Psyker that has one or more weapons with this special rule knows the Force psychic power in addition to any other powers they know:
        Force, Blessing, 5, If manifested, then until the start of your next Psychic phase, all of the Psykers’ weapons that have the Force special rule gain the Instant Death special rule.
    '),
    ('Furious Charge',
    '
    -In a turn in which a model with this special rule charges into combat, it adds +1 to its S Characteristic until the end of the Assault phase. A model that has made a disordered charge that turn receives no benefit from Furious Charge.
    '),
    ('Gets Hot',
    '
    - When firing a weapon that Gets Hot, roll To Hit as normal. For each To Hit roll of 1, the firing model immediately suffers a Wound (armour or invulnerable saves can be taken). A Character cannot make a Look Out, Sir attempt to avoid a Wound caused by the Gets Hot special rule. A Vehicle instead rolls a D6 for each roll of a 1 to hit. On a roll of a 1, 2 or 3 it suffers a glancing hit.
        Gets Hot and Weapons that do not roll To Hit: Weapons that do not roll To Hit (such as Blast weapons) must roll a D6 for each shot immediately before firing. On a 2+, the shot is resolved as normal. For each roll of a 1, the weapon Gets Hot; that shot is not fired and the firing model immediately suffers a single Wound (armour saves or invulnerable saves can be taken), this Wound cannot be allocated to any other model in the unit. A Character cannot make a Look Out, Sir attempt to avoid a Wound caused by the Gets Hot special rule. A Vehicle instead suffers a glancing hit on a further roll of a 1, 2 or 3.
        Gets Hot and Re-rolls: If a model has the ability to re-roll its rolls To Hit, a Wound is only suffered if the To Hit re-roll is a 1; it may also re-roll Gets Hot results of 1 for weapons that do not roll To Hit.
    '),
    ('Graviton',
    '
    - The roll needed To Wound when firing a weapon with this special rule is always equal to the armour save of the target, to a minimum of 6+.'),
    ('Grenades', '
    - Assault/Frag Grenades:
        Shooting: When a unit armed with assault/frag grenades makes a shooting attack, one model can choose to throw a grenade, using the following profile: Range6"/S3/PA-2 D/1; Assault, Blast
        Assault: Models equipped with assault/frag grenades don’t suffer the penalty to their Initiative for charging enemies through difficult terrain but fight at their normal Initiative in the ensuing combat.
    - Plasma Grenades:
        Shooting: When a unit armed with plasma grenades makes a shooting attack, one model can choose to throw a grenade, using the following profile: Range6"/S4/PA/-4/D1; Assault, Blast
        Assault: Models equipped with plasma grenades do not suffer the penalty to their Initiative for charging enemies through difficult terrain but fight at their normal Initiative in the ensuing combat.
    - Defensive Grenades:
        Shooting: When a unit armed with defensive grenades makes a shooting attack, one model can choose to throw a grenade, using the following profile: Range6"/S1/PA0/D1; Assault, Blast, Blind
        Assault: Models charging a unit that includes any models equipped with defensive grenades do not gain bonus Attacks from charging. However, if the charged unit was already locked in combat from a previous turn, or has Gone to Ground, these grenades have no effect, and the attackers gain bonus Attacks as normal.
    - Haywire Grenades:
        Shooting: When a unit armed with haywire grenades makes a shooting attack, one model can choose to throw a grenade, using the following profile: Range6"/S2/PA0/D1; Assault, Haywire
        Assault: Unless used in assaults against Vehicles, Haywire Grenades have no effect. When used in assault against Vehicles, haywire grenades have the following profile: RangeMelee/S2/PA0/D1; Haywire
    - Krak Grenades:
        Shooting: When a unit armed with krak grenades makes a shooting attack, one model can choose to throw a grenade, using the following profile: Range6"/S6/PA-4/D1; Assault
        Assault: Unless used in assaults against Vehicles, gun emplacements or Monsters, krak grenades have no effect. When they are used in assaults against Vehicles or Monsters, krak grenades have the following profile: RangeMelee/S6/PA-4/D1;
    - Melta Bombs:
        Shooting: Melta bombs are cumbersome devices. Melta bombs cannot be used to make a shooting attack.
        Assault: Unless used in assaults against Vehicles, gun emplacements or Monsters, melta bombs have no effect. When used in assaults against Vehicles or Monsters, melta bombs have the following profile: RangeMelee/S8/PA-5/D1; Armourbane, Unwieldy
    '),
    ('Hammer of Wrath (HoW)',
    '
    - If a model with this special rule ends its charge move in base or hull contact with an enemy model, it makes one additional Attack that hits automatically and is resolved at the model’s unmodified S with AP-. This Attack does not benefit from any of the model’s special rules (such as Furious Charge, Rending etc.). This Attack is resolved during the Fight sub-phase at the Initiative 10 step, but does not grant the model an additional Pile In move. If a model with this special rule charges a Walker, the hit is resolved against the Front Armour Facing unless the Walker is Immobilised, in which case it is resolved against the Armour Value of the facing the charging model is touching. If a model with this special rule charges a Vehicle, the hit is resolved against the Armour Value of the facing the charging model is touching. If a model with this special rule charges a Vehicle that is a Transport or a Chariot, the hit is resolved against the Vehicle, not the occupants or the rider.
        Hammer of Wrath (for Chariots): If a Chariot ends its charge move in base or hull contact with one or more enemy models, it makes D6 additional attacks that hit automatically and are resolved at S6 AP- (unless otherwise stated). These attacks do not benefit from any of the Chariot’s (or rider’s) special rules (such as Furious Charge, Rending etc.). These attacks are resolved during the Fight sub-phase at the Initiative 10 step, but does not grant the Chariot an additional Pile In move at the Initiative 10 step. If a Chariot charges a Vehicle that is a Transport or Chariot, the Hammer of Wrath hits are resolved against the Vehicle, not the occupants or rider.
    '),
    ('Hatred',
    '
    - This rule is often presented as Hatred (X) where X identifies a specific type of foe. If the special rule does not specify a type of foe, then the unit has Hatred against everyone. This can refer to a Faction, or a specific unit. A model striking a hated foe in close combat re-rolls all failed To Hit rolls.
    '),
    ('Haywire',
    '
    - When a weapon with this special rule hits a Vehicle, roll a D6 to determine the effect rather than rolling to wound normally:
            D6      Result
            1       No effect
            2-5     D3 Mortal Wounds
            6       D3+3 Mortal Wounds
    '),
    ('Hazardous',
    '
    - After a unit completes its attacks, roll a D6 for each Hazardous weapon used. On a roll of 1, a model equipped with that weapon is destroyed, unless it is a Character, Monster, or Vehicle, in which case it suffers D3 mortal wounds.
    '),
    ('Heavy',
    '
    - Each time an attack is made with such a weapon, if the attacking model unit Remained Stationary this turn, add 1 to that attacks Hit roll.
    '),
    ('Heavyweights',
    '
    - Heavyweights Vehicles can never move faster than Combat Speed. Heavyweights Vehicles are always treated as having remained Stationary.
    '),
    ('Hellstorm Weapons',
    '
    - Hellstorm weapons have the word "Hellstorm" instead of a range on their weapon profile. Hellstorm weapons use the hell storm template, but otherwise obey the rules for other Template weapons.
    '),
    ('Hit & Run',
    '
    - A unit that contains at least one model with this special rule that is locked in combat can choose to leave close combat at the end of any Assault phase. If the unit wishes to do so, it must take an Initiative test.
        If the test is failed, nothing happens and the models remain locked in the fight.
        If the test is passed, choose a direction, then roll 3D6. As long as the distance rolled, in inches, is sufficient to allow the entire unit to move over 1" away from all of the enemy units they are locked in combat with, the unit breaks away from combat and must immediately move a number of inches in the chosen direction equal to the 3D6 result, ignoring the models they were locked in combat with. No Sweeping Advance rolls are made. Enemy units that are no longer locked in combat immediately Consolidate D6".
        A Hit & Run move is not slowed by difficult terrain, but takes Dangerous Terrain tests as normal. It may not be used to move into base or hull contact with enemy units, and models instead stop 1" away. If there are units with this rule on both sides who wish to disengage, roll-off to determine who goes first and then alternate disengaging them. If the last of these ends up no longer in combat, it Consolidates instead.
    '),
    ('Ignores Cover',
    '
    - Cover saves cannot be taken against Wounds, glancing hits or penetrating hits caused by weapons with the Ignores Cover special rule.
    '),
    ('Impact',
    '
    - When Firing with the Frag Canon in Solid shell mode, if the target unit is within 12", this weapon’s S is increased to 9, its AP is increased to -4, its Damages is improved to 2, and the weapon profile gain the Devastating Wounds special rule.
    '),
    ('Impale',
    '
    - A model fighting with an a weapon with this special rule re-rolls all To Wound rolls of a 1 when fighting in close combat.
    '),
    ('Independent Character',
    '
    - Independent Characters can join other units. They cannot, however, join units that contain Vehicles or Monsters. They can join other Independent Characters, though, to form a powerful multi-Character unit!
        Joining and Leaving a Unit: An Independent Character can begin the game already with a unit, either by being deployed in unit coherency with it or, if the unit is in Reserve, by you informing your opponent of which unit it has joined. In order to join a unit, an Independent Character simply has to move so that he is within the 2" unit coherency distance of a friendly unit at the end of their Movement phase. If the Independent Character is within 2" of more than one unit at the end of its Movement phase, the player must declare which unit it is joining. If an Independent Character does not intend to (or cannot) join a unit, it must (where possible) remain more than 2" away from it at the end of the Movement phase. This is to make clear whether they have joined a unit or not. Note that, after an Independent Character joins a unit, that unit can move no further that Movement phase. An Independent Character can leave a unit during the Movement phase by moving out of unit coherency with it. He cannot join or leave during any other phase, once shots are fired or charges are declared, it is too late to join in or duck out! An Independent Character cannot leave a unit while either he or the unit is in Reserves, locked in combat, Falling Back or has Gone to Ground. He cannot join a unit that is in Reserves, locked in combat or Falling Back. If an Independent Character joins a unit, and all other models in that unit are killed, he again becomes a unit of one model at the start of the following phase. While an Independent Character is part of a unit, he counts as part of the unit for all rules purposes, though he still follows the rules for Characters.
        Look Out, Sir: Independent Characters pass Look Out, Sir rolls on a 2+.
        Heroic Morale: A unit that contains one or more Independent Characters does not need a double 1 to Regroup if reduced to below 25% of its starting numbers, but instead tests as if it had at least 25% remaining.
        Special Rules: When an Independent Character joins a unit, it might have different special rules from those of the unit. Unless specified in the rule itself (as in the Stubborn special rule), the unit’s special rules are not conferred upon the Independent Character, and the Independent Character’s special rules are not conferred upon the unit. Special rules that are conferred to the unit only apply for as long as the Independent Character is with them.
        Independent Characters and Infiltrate: An Independent Character without the Infiltrate special rule cannot join a unit of Infiltrators during deployment, and vice versa.
        Independent Characters and Ongoing Effects: Sometimes, a unit that an Independent Character has joined will be the target of a beneficial or harmful effect, such as those bestowed by the Blind special rule, for example. If the Character leaves the unit, both he and the unit continue to be affected by the effect, so you’ll need to mark the Character accordingly. Conversely, if an Independent Character joins a unit after that unit has been the target of an ongoing effect (or joins a unit after himself having been the target of an ongoing effect) benefits and penalties from that effect are not shared.
        Challenge:
            Issuing a Challenge: Challenges are issued at the start of the Fight Phase, before any attacks. Only one challenge per combat can be issued, with the side whose turn it is having the first chance. If they decline, the other side can issue a challenge. Once a challenge is made and accepted, no further challenges can be issued until it is resolved. If there are no enemy Character’s present, a challenge cannot be issued. Characters unable to fight or not engaged with an enemy cannot issue challenges.
            Accepting a Challenge: If your opponent has issued a challenge, you can now accept it (nominate a Character in one of your units locked in the combat to be the challenge).
            Refusing a Challenge: If you refuse the challenge, your opponent selects one of your eligible Characters. The chosen model cannot attack this turn, and its Leadership does not benefit the unit for the rest of the phase.
            Heroic Stand: A unit that consists only of a single Character cannot refuse a challenge. He’s got nowhere to hide.
            Fighting a Challenge: During a challenge, the two Characters move into base contact with each other without risking Difficult or Dangerous Terrain tests. They stay in base contact for the duration of the challenge, always using their opponent’s Toughness for To Hit and To Wound rolls. Wounds caused during the challenge must be allocated to the opponent and cannot be shifted using the Look Out, Sir rule.
            Combatant Slain: In a challenge, any excess Wounds inflicted by the victor are lost if the opponent is slain. Additionally, the challenge remains ongoing until the end of the phase for the purposes of Outside Forces, even if one combatant is slain.
            Outside Forces: In a challenge, other models can only allocate Wounds to the models involved after all other enemy models in the combat have been removed, even if those involved are the closest.
            Assault Result: Unsaved Wounds caused in a challenge count towards the assault result, alongside any unsaved Wounds caused by the rest of the Characters’ units.
            Round Two: If both fighters survive and the combat continues, they will keep battling in the next round. However, if a Character with And They Shall Know No Fear is caught in a Sweeping Run, the challenge ends. Although new challenges cannot be issued until the ongoing one ends, another Character might step in with a Glorious Intervention.
            Glorious Intervention: Characters can perform a Glorious Intervention at the start of their own Fight Phase, if a friendly Character in the same combat is entering subsequent rounds of a challenge. They cannot do this in the first round of a challenge or during the enemy turn. Also, Characters unable to fight or strike blows cannot perform Glorious Interventions. To succeed, the intervening Character must pass an Initiative test. If manifested, they take the place of the friendly Character in the challenge. The displaced Character fights normally, while the intervening Character fights the challenge. They both move into base contact as if accepting the challenge anew.
    '),
    ('Indirect Fire',
    '
    - Attacks with Indirect Fire weapons can target units even if no models are visible to the attacker. However, subtract 1 from the Hit roll and the target always benefits from Cover against such attacks.
    '),
    ('Infiltrate',
    '
    - You may choose to deploy units that contain at least one model with this special rule last, after all other units (friend and foe) have been deployed. If both players have such units and choose to do so, the players roll-off and the winner decides who goes first, then alternate deploying these units.
        Units that Infiltrate in this way can be set up anywhere on the table that is more than 12" from any enemy unit, as long as no deployed enemy unit can draw line of sight to them. This includes in a building, as long as the building is more than 12" from any enemy unit. Alternatively, they can be set up anywhere on the table more than 18" from any enemy unit, even in plain sight.
        If a unit with Infiltrate deploys inside a Dedicated Transport, the same rules apply when setting up their Transport as long as the Transport has the Infiltrate special rule.
        A unit that deploys using these rules cannot charge in their first turn.
        Having Infiltrate also confers the Outflank special rule to units of Infiltrators that are kept as Reserves.
        Infiltrate and Scout: If a unit has both the Infiltrate and Scout special rule, that unit can deploy as per the Infiltrate special rule and then redeploy as per the Scout special rule.
    '),
    ('Instant Death',
    '
    - If a model suffers an unsaved Wound from an attack with this special rule, it is reduced to 0 Wounds and is removed as a casualty.
    '),
    ('Interceptor',
    '
    - At the end of the enemy Movement phase, a weapon with the Interceptor special rule can be fired at any one unit that has arrived from Reserve within its range and line of sight. If this rule is used, the weapon cannot be fired in the next turn, but the firing model can shoot a different weapon if it has one.
    '),
    ('It Will Not Die',
    '
    - At the end of each of your turns, roll a D6 for each of your models with this special rule that has less than its starting number of Wounds or Hull Points, but has not been removed as a casualty or destroyed. On a roll of 5+, that model regains a Wound, or Hull Point, lost earlier in the game.
    '),
    ('Jink',
    '
    - When a unit with any models with the Jink special rule is selected as a target for a shooting attack, you may declare that it will Jink. The decision must be made before any To Hit rolls have been made. If the unit Jinks, all models in the unit with this special rule gain a 4+ cover save until the start of their next Movement phase, but they can only fire Snap Shots until the end of their next turn.
    '),
    ('Lance',
    '
    - Weapons with the Lance special rule count Vehicle Armor Values that are higher than 13 as 13. Each time an attack is made with such a weapon, if the bearer made a Charge move this turn, add 1 to that attack’s Wound roll. Lances have +2 in S on a turn in which a model charges.
    '),
    ('Lethal hit',
    '
    - Each time an attack is made with such a weapon, a Critical Hit gives +1 to Wound rolls.
    '),
    ('Lethal Precision',
    '
    - Attacks with this special rule gain the Precision Strike or Precision Shot on 4+ and Devastating Wounds special rule.
    '),
    ('Line of Effect',
    '
    - While firing with this weapon, draw a line 1mm wide and 18" long, from this unit in any direction, to determine the area of effect. All units crossed by the line suffer a number of hits equal to the number of models in the unit the line crosses
    '),
    ('Lingering Death',
    '
    - When a weapon with this special rule is used, after the attack is resolved leave the Blast marker in play for the rest of the game. This area is now treated as Dangerous Terrain for any models except Vehicle not Open-topped.
    '),
    ('Lightning Reflexes',
    '
    - A model with this special rule has a 4++/6++ invulnerable save. In addition, they do not suffer the penalty to their Initiative for charging enemies through difficult terrain.
    '),
    ('Lone Operative',
    '
    - Unless part of an Attached unit, an Independent Character with this rule can only be selected as the target of a ranged attack if it is the closest ennemy or if the attacking model is within 12".
    '),
    ('Luminagen',
    '
    - A unit that suffers one or more unsaved Wounds, glancing or penetrating hits caused by a weapon with this special rule counts its cover saves as being 2 point worse than normal until the end of the phase. Furthermore, units can re-roll the dice to determine their charge range against the afflicted unit until the end of the turn.
    '),
    ('Master-crafted',
    '
    - Weapons with the Master-crafted special rule allow the bearer to re-roll one failed roll To Hit per turn with that weapon.
    '),
    ('Melee',
    '
    - Melee weapons can only be used during the Fight Phase
    '),
    ('Melta',
    '
    - Ranged weapons with this special rule roll an additional D6 to determinte tha Damage Characteristics inflicted to a Vehicle at half range or less.
        If a weapon has both the Melta and Blast special rules, measure the distance to the centre of the blast marker after it has scattered. If this is half the weapon’s range or less, all hits caused by the blast marker roll an addition D6 to determinte tha Damage Characteristics inflicted to a Vehicle.
    '),
    ('Missile Lock',
    '
    - A model with this special rule re-rolls failed To Hit rolls when shooting any weapon that has the One Use Only special rule. If a model with this special rule is shooting a weapon that has both the One Use Only and Blast special rules, that shot will instead scatter D6" rather than 2D6".
    '),
    ('Molecular Realignment Field',
    '
    - Successful invulnerable saving throws made against Wounds inflicted by a weapon with this rule must be re-rolled.
    '),
    ('Monofilament',
    '
    - When rolling To Wound for a weapon that has this special rule, use the target’s Initiative instead of its Toughness. In addition, if a 6 is rolled To Wound when attacking with a weapon that has this special rule, the Wound is resolved at AP-3 unless the weapon is AP-4.
    '),
    ('Monster Hunter',
    '
    - A unit that contains at least one model with this special rule re-rolls all failed To Wound rolls against Monsters.
    '),
    ('Moonsilver',
    '
    - Any wound caused against a model with the Daemon or Psyker special rules is instead counted as two wounds. Wounds caused in excess of the models remaining Wounds do not spill over to other models.
    '),
    ('Move Through Cover',
    '
    - A unit that contains at least one model with this special rule rolls an extra D6 when rolling to move through difficult terrain and is not slowed by charging through difficult terrain. In most circumstances, this will mean that, when moving, the unit rolls 3D6 and picks the highest roll. Furthermore, a model with the Move Through Cover special rule automatically passes Dangerous Terrain tests.
    '),
    ('Murderous Strike',
    '
    - Attacks with this special rule cause Instant Death on a Critical Wound.
    '),
    ('Neural Shock',
    '
    - Hits caused by this weapon always wound on a 4+. This special rule has no effects on Vehicles.
    '),
    ('Night Fighting',
    '
    - If a mission has the Night Fighting special rule, either player can declare that they wish to fight the battle at night. If either player does so, roll a D6 before deployment: on a roll of 4+, the Night Fighting special rule is in effect during the game. While the Night Fighting mission special rule is in effect, all units have the Stealth special rule.
    '),
    ('Night Vision',
    '
    - A unit that contains at least one model with this special rule ignores the effects of Night Fighting.
    '),
    ('One Use Only',
    '
    - A weapon or ability with this special rule can only be used once during the course of a battle.
    '),
    ('Oppen-topped',
    '
    - If a Vehicle is Open-topped, add 1 to any rolls made on the Vehicle Damage table (this is cumulative with other modifiers).
        Open-topped Transports: Open-topped Vehicles do not have specific Access Points. Instead, all the Vehicle is an Access Point (regardless of any base they may have).
        Passengers Shooting from Open-topped Transport: Open-topped Transports do not have specific Fire Points. Instead, all passengers in an Open-topped Transport can fire, measuring range and line of sight from any point on the hull of the Vehicle.
        Passengers Charging from Open-topped Transport: Acting as an ideal attack platform, all Open-topped Transports have the Assault Vehicle special rule.
    '),
    ('Ordnance',
    '
    - When shooting, a model with an Ordnance weapon fires the number of times indicated in its profile after its type. Non-Vehicle models carrying Ordnance weapons cannot fire them if they moved in the preceding Movement phase. Ordnance weapons cannot make Snap Shots. After firing an Ordnance weapon, a non-Vehicle model cannot shoot other weapons that phase or charge in the ensuing Assault phase. When rolling for Penetrating Hits, roll two dice instead of one and pick the highest result for Ordnance weapons.
    '),
    ('Outflank',
    '
    - During deployment, players can declare that any unit that contains at least one model with this special rule is attempting to Outflank the enemy. This means they are making a wide sweeping move to get behind enemy lines or come at the foe from an unexpected direction.
        When an Outflanking unit arrives from Reserves, but not Ongoing Reserve, the controlling player rolls a D6: on a 1-2, the unit comes in from the table edge to the left of their controlling player’s own table edge; on a 3-4, they come on from the right; on a 5-6, the player can choose left or right. Models move onto the table as described for other Reserves.
        If such a unit deploys inside a Dedicated Transport, they may Outflank along with their Transport.
    '),
    ('Pinning',
    '
    - If a non-Vehicle unit suffers one or more unsaved Wounds from a weapon with the Pinning special rule, it must take a Leadership test once the firing unit has finished its shooting attacks for that phase. This is called a Pinning test.
        If the unit fails the test, it is Pinned and must immediately Go to Ground. As the unit has already taken its saves, Going to Ground does not protect it against the fire of the Pinning weapon that caused the test.
        As long as the test is passed, a unit can be called upon to take multiple Pinning tests in a single turn, but only once for each unit shooting at them. If a unit has already Gone to Ground, no further Pinning tests are taken.
        If the special rules of a unit specify that the unit can never be Pinned, the unit automatically passes Pinning tests. Such units can still Go to Ground voluntarily if they wish.
    '),
    ('Pistol',
    '
    - Units with Pistols can shoot in the Shooting phase even if within Engagement Range of enemies. They can only use their Pistols and target one ennemy unit they are in Engagement Range of. A model with Pistols can choose to shoot them or its other ranged weapons, not both.
    '),
    ('Poisoned',
    '
    - If a model has the Poisoned special rule, or is attacking with a weapon that has the Poisoned special rule, it always wounds on a fixed number (generally shown in brackets), unless a lower result would be required, when attacking in close combat. In addition, if the S of the wielder (or the Poisoned weapon) is higher than the Toughness of the victim, the wielder must re-roll failed rolls To Wound in close combat.
        If no number is shown in brackets, the rule is Poisoned (4+).
        Unless otherwise stated, Poisoned weapons are treated as having a S of 1. The Poisoned special rule has no effect against Vehicles.
    '),
    ('Power of the Machine Spirit',
    '
    - In a turn in which the Vehicle does not use smoke launchers, the Vehicle can fire one more weapon at its full CT than normally permitted. In addition, this weapon can be fired at a different target unit to any other weapons, subject to the normal rules for shooting.
    '),
    ('Precision Shots',
    '
    - If a model with this special rule, or attacking with a weapon with this special rule, rolls a 6 To Hit with a shooting attack, that shot is a ‘Precision Shot’.
        Wounds from Precision Shots are allocated against a model (or models) of your choice in the target unit, as long as it is in range and line of sight of the firer, rather than following the normal rules for Wound allocation. A Character that has a Precision Shot Wound allocated to it can still make a Look Out, Sir roll.
        Note that Snap Shots and shots from weapons that scatter, or do not roll To Hit, can never be Precision Shots.
        '),
    ('Precision Strikes',
    '
    - If a model with this special rule, or attacking with a weapon with this special rule, rolls a 6 To Hit with a melee attack, that hit is a ‘Precision Strike’.
        Wounds from Precision Strikes are allocated against an engaged model (or models) of your choice in the unit you are attacking, rather than following the normal rules for Wound allocation. If a Precision Strike Wound is allocated to a Character, they can still make their Look Out, Sir roll.
    '),
    ('Preferred ennemy',
    '
    - This rule is often presented as Preferred Enemy (X) where X identifies a specific type of foe. If the special rule does not specify a type of foe, then everyone is a Preferred Enemy of the unit. A unit that contains at least one model with this special rule re-rolls failed To Hit and To Wound rolls of 1 if attacking its Preferred Enemy. This applies both to shooting and close combat attacks.
    '),
    ('Primary',
    '
    - A model using a Primary weapon shoots its designated number of times, even after moving. It can shoot and then charge into close combat.
    '),
    ('Psychic',
    '
    - Some weapons and abilities can only be used by Psykers. Such weapons and abilities are tagged with the word ‘Psychic’. If a Psychic weapon or ability causes any unit to suffer one or more wounds, each of those wounds is considered to have been inflicted by a Psychic Attack.
    '),
    ('Psychic Pilot',
    '
    - A Vehicle with this special rule is a Psyker. This rule is typically presented with a Mastery Level, shown in brackets, if no Mastery Level is shown then that Vehicle has a Mastery Level of 1. Rules for generating and manifesting psychic powers can be found in the Psychic phase section. The unit follows all the normal rules for manifesting psychic powers.
    '),
    ('Psyker',
    '
    - A model with this special rule is a Psyker. This rule is typically presented with a Mastery Level, if no Mastery Level is shown then that the unit has a Mastery Level of 1.
    '),
    ('Psy-Shock',
    '
    - Any Psyker that takes an unsaved Wound from a weapon with this rule suffers the Perils of the Warp in addition to any other effects.
    '),
    ('Pulverise',
    '
    - If a Critical Wound is rolled for an attack with a weapon with this rule, the attack has the Instant Death special rule.
    '),
    ('Rage',
    '
    - In a turn in which a model with this special rule charges into combat, it gains +2 Attacks for charging, rather than +1. A model that has made a disordered charge that turn receives no benefit from Rage.
    '),
    ('Rampage',
    '
    - At the start of any Fight sub-phase, models with the Rampage special rule gain +D3 attacks if the combat they are in contains more enemy models than friendly models, count all models locked in the combat, not just those models that are engaged. Roll once to determine the number of bonus Attacks all Rampaging models involved in that combat receive that phase. A model that has made a disordered charge that turn receives no benefit from Rampage.
    '),
    ('Rapid Fire',
    '
    - Each time such a weapon targets a unit within half that weapon’s range, the Attacks Characteristic of that weapon is increased by the number in the profile of the weapon. Models that shoot with Rapid Fire weapons in the Shooting phase cannot charge in the ensuing Assault phase.
    '),
    ('Reaping Blow',
    '
    - Model using a weapon with this special rule fight at -1 Initiative in Fight phase. In addition, if the wielder is in base with more than one ennemy model at the Initiative step in wich he fight, he gain +1 Melee Weapon Attack.
    '),
    ('Relentless',
    '
    - Relentless models can shoot with Heavy, Salvo or Ordnance weapons, counting as stationary, even if they moved in the previous Movement phase. They are also allowed to charge in the same turn they fire Heavy, Ordnance, Rapid Fire or Salvo weapons.
    '),
    ('Rending',
    '
    - If a model has the Rending special rule, or is attacking with a weapon that has the Rending special rule, for each Critical Wound, the target automatically suffers a Mortal Wound in addition to any Damage Characteristic.
    '),
    ('Ritual Pair',
    '
    - A model fighting with a shardnet and impaler always gains the +1 bonus Attack for fighting with more than one Melee weapon. A model fighting with a shardnet and impaler re-rolls all To Hit and To Wound rolls of 1 in close combat.
    '),
    ('Salvo',
    '
    - Salvo weapons have two numbers on their profile separated by a /. When a model with a Salvo weapon moves and fires at a target up to half its maximum range away, it uses the first number of shots. If the model remains stationary, it can shoot up to the weapon’s maximum range, using the second number of shots. However, models using Salvo weapons in the Shooting phase cannot charge in the subsequent Assault phase.
    '),
    ('Scout',
    '
    - After both sides have deployed (including Infiltrators), but before the first player begins his first turn, a unit containing at least one model with this special rule can choose to redeploy. If the unit is Infantry, Artillery, Walker or Monster, each model can redeploy anywhere entirely within 6" of its current position. If it is any other unit type, each model can instead redeploy anywhere entirely within 12" of its current position. During this redeployment, Scouts can move outside the owning player’s deployment zone, but must remain more than 12" away from any enemy unit. A unit that makes a Scout redeployment cannot charge in the first game turn. A unit cannot embark or disembark as part of a Scout redeployment.
        If both sides have Scouts, roll-off; the winner decides who redeploys first. Then alternate redeploying Scout units.
        If a unit with this special rule is deployed inside a Dedicated Transport, it confers the Scout special rule to the Transport (though a disembarkation cannot be performed as part of the redeployment). Note that a Transport with this special rule does not lose it if a unit without this special rule is embarked upon it. Having Scout also confers the Outflank special rule to units of Scouts that are kept as Reserves.
        Infiltrate and Scout: If a unit has both the Infiltrate and Scout special rule, that unit can deploy as per the Infiltrate special rule and then redeploy as per the Scout special rule.
    '),
    ('Searchlight',
    '
    - Vehicles equipped with searchlights can illuminate targets during Night Fighting. After firing, they can choose to illuminate a target and themselves. The illumination lasts until the end of the next turn, negating Night Fighting for the affected units.
    '),
    ('Shred',
    '
    - If a model has the Shred special rule, or is attacking with a weapon that has the Shred special rule, it re-rolls failed To Wound rolls.
    '),
    ('Shrouded',
    '
    - A unit that contains at least one model with this special rule counts its cover save as being 2 points better than normal. Note that this means a model with the Shrouded special rule always has a cover save of at least 5+, even if it’s in the open.
        Cover save bonuses from the Shrouded and Stealth special rules are cumulative (to a maximum of a 2+ cover save).
    '),
    ('Skilled Rider',
    '
    - A unit that contains at least one model with this special rule automatically passes Dangerous Terrain tests, and receives +1 to its Jink cover saves (other cover saves are unaffected).
    '),
    ('Skimmer',
    '
    - Skimmers have Flying bases under their hulls, but distances are still measured to and from their hulls. The base is ignored except during charges or rams, when models may contact either the hull or base.
        Skimmers can move over models and terrain without penalty but must take Dangerous Terrain tests if starting or ending in such terrain. If forced to end over models, move to avoid contact. Fast Skimmers add 6" to its Cruising Speed. Skimmers, unless Heavy or Immobilized, have the Jink rule.
    '),
    ('Skyburst',
    '
    - This shooting attack does not need line of sight. If the unit consists of at least six models with a grenade pack, the attack has the Large Blast special rule instead of the Blast special rule.
    '),
    ('Sky fire',
    '
    - A model with this special rule, or that is firing a weapon with this special rule, fires using its normal CT when shooting at Flyers Vehicles, Flying Monsters and Skimmers, but it can only fire Snap Shots against other targets.
    '),
    ('Slow and Purposeful',
    '
    - A unit that contains at least one model with this special rule cannot Run, Turbo-boost, perform Sweeping Advances or fire Overwatch. However, they can shoot with Heavy, Salvo and Ordnance weapons, counting as stationary even if they moved in the previous Movement phase. They are also allowed to charge in the same turn they fire Heavy, Ordnance, Rapid Fire or Salvo weapons.
    '),
    ('Smash',
    '
    - All of the close combat attacks, except Hammer of Wrath attacks, of a model with this special rule are resolved at AP-4 (unless it’s attacking with an AP-5 weapon). Additionally, when it makes its close combat attacks, it can choose instead to make a single Smash Attack. If it does so, roll To Hit as normal, but resolve the Attack at double the model’s Strength.
    '),
    ('Smoke Launcher',
    '
    - Vehicles equipped with smoke launchers can activate them once per game instead of shooting. They cannot fire weapons afterward but gain a 5+ cover save in the next ennemy Shooting phase. The smoke disperses after the ennemys Shooting phase.
    '),
    ('Snatched',
    '
    - When fighting in a challenge, this weapon has the Instant Death special rule.
    '),
    ('Sniper',
    '
    - If a weapon has the Sniper special rule, or is fired by a model with the Sniper special rule, and make a Critical Hit, that shot is a ‘Precision Shot’.
        If a weapon has the Sniper special rule, or is fired by a model with the Sniper special rule, its shooting attacks makes Critical Wound on 4+. In addition, any To Wound roll of a 6 is resolved at AP-4.
    '),
    ('Soul Blaze',
    '
    - If a unit suffers one or more unsaved Wounds from an attack with this special rule, it is set ablaze and continues to burn, mark it with a coin or counter as a reminder.
        At the end of each turn, roll a D6 for each unit with a Soul Blaze counter on it. On a 3 or less, the flames die out and the unit is no longer ablaze, remove your reminder counter. On a 4+, the unit takes D3/S4/AP-1/D1 hits with the Ignores Cover special rule. These Wounds are Randomly Allocated. A unit cannot have more than one Soul Blaze counter on it at a time.
    '),
    ('Soulfright',
    '
    - At the end of the Shooting phase, a unit that has suffered one or more hits from a weapon with this special rule in that phase must make a Leadership test. The unit suffers a single additional Mortal Wound for each point this test is failed by. Wounds cannot be allocated to models with the Fearless or And They Shall Know No Fear special rules (any excess Wounds are lost).
    '),
    ('Soul-leech',
    '
    - Each time the bearer inflicts an unsaved Wound with this weapon it immediately regains one Wound lost previously in the battle.
    '),
    ('Specialist',
    '
    - A model fighting with this weapon does not receive +1 Attack for fighting with two weapons unless it is armed with two or more Melee weapons with the Specialist rule.
    '),
    ('Squadron',
    '
    - Squadrons are treated like normal units, with a few exceptions and clarifications as described below.
        Squadrons in the Movement Phase: Vehicles in a squadron maintain unit coherency by staying within 4"" horizontally of each other, allowing them to move at different speeds while staying connected.
        Squadrons in the Shooting Phase: Like other units, Vehicles in squadrons can see and shoot through members of their own squadron, just as if they were not there.
        Shooting at Squadrons: Hits on a squadron of Vehicles are resolved one at a time against the closest model in the squadron to the firing unit, like resolving wounds on a regular unit.
        Squadrons in the Assault Phase: Hits on a squadron in close combat are resolved one at a time, starting with models in base contact and moving outward, like resolving hits on a regular unit.
        Damaging Squadrons: Hits on Vehicle squadrons are allocated individually to the closest model, resolving them one by one until all hits are resolved.
        Abandoning Squadron-mates: If a member of a Vehicle squadron is immobilized, the rest of the squadron can leave it behind by moving out of unit coherency. The immobilized model(s) then function as a separate unit for all rules and victory conditions. This is not possible if a squadron member is only crew stunned, as it is assumed the others rally to its defense until it recovers.
    '),
    ('Stealth',
    '
    - A unit that contains at least one model with this special rule counts its cover saves as being 1 point better than normal. Note that this means that a model with the Stealth special rule always has a cover save of at least 6+, even if it is in the open. This rule is often presented as Stealth (X) where X indicates a specific type of terrain, such as Stealth (Woods) or Stealth (Ruins). If this is the case, the unit only gains the benefit whilst it is in terrain of the specified type.
        Cover save bonuses from the Shrouded and Stealth special rules are cumulative (to a maximum of a 2+ cover save).
    '),
    ('Strafing Run',
    '
    - When shooting Assault, Heavy, Rapid Fire or Salvo weapons at Artillery, Beasts, Bikes, Cavalry, Infantry, Monsters and Vehicles without the Flyer or Skimmer type, this Vehicle has +1 CT.
    '),
    ('Strike down',
    '
    - Any non-Vehicle model that suffers one or more unsaved Wounds or passes one or more saving throws against an attack with the Strikedown special rule moves as if it is in difficult terrain until the end of its next turn. It is a good idea to mark affected models with counters or coins so that you remember.
    '),
    ('Stubborn',
    '
    - When a unit that contains at least one model with this special rule takes Morale checks or Pinning tests, they ignore any negative Leadership modifiers. If a unit is both Fearless and Stubborn, it uses the rules for Fearless instead.
    '),
    ('Sunder',
    '
    Attacks with this special rule may re-roll failed To Woound rolls against Vehicles and Monsters.
    '),
    ('Supersonic',
    '
    - A Supersonic Vehicle that moves at Cruising Speed add 12" to their movement Characteristic.
    '),
    ('Super-Heavy',
    '
    - Super-heavy Vehicles cannot Jink. When shooting, they are treated as stationary. Ordnance weapons do not affect their other firing. Crew effects like Shaken or Immobilized are ignored. They still lose Hull Points from hits as normal. 
        When a Super-heavy Vehicle loses its last Hull Point, it explodes catastrophically. Remove the model and place the mega-blast marker over its location. Roll on the Catastrophic Damage table to determine the number of Mortal Wounds inflicted on units covered by the marker.
        Catastrophic Damage table:
             1       Explosion: D6+3 Mortal Wounds
            2-3      Devastating Explosion: D6+6 Mortal Wounds
            4-6      Titanic Explosion!: 2D6+6 Mortal Wounds
        Special Rules: Super-heavy Vehicles have the following special rules: Fear, Move Through Cover.
        Transports: For each unit inside a Super-heavy Vehicle that suffers Catastrophic Damage, roll one D6 for each disembarking model. On a roll of 1-3, that model’s unit suffers D3 mortal wounds. Survivors are placed where the Vehicle was, ensuring unit coherency. Any unplaceable models are removed as casualties. The unit then takes a Pinning test and counts as Battle-shocked.
        Invincible Behemoth: Any attack that says that the target model is destroyed, Wrecked, Explodes! or is otherwise removed from play inflicts D3 Hull Points of damage on a Super-heavy Vehicle instead. In addition, any attacks or special abilities that permanently lower the Armor Values of a target Vehicle do not affect a Super-heavy Vehicle. Note that attacks or abilities that count the Armor Value as being lower, but do not actually change it, work normally.
        Thunder blitz: Super-heavy Vehicles may Tank Shock or Ram. When they do so, roll once on the Thunder blitz table immediately before taking the Morale check for the unit being Tank Shocked, or immediately before rolling for Damages when performing a Ram. Do not roll on the Thunder blitz table when Tank Shocking a Titanic model, or when Ramming a Super-heavy Vehicle or Super-heavy Walker. Instead, simply carry out the Tank Shock or Ram as normal.
        Thunder blitz table:
             1       No Effect: Carry on with the remainder of the Tank Shock as normal / Carry on with the remainder of the Ram as normal.
            2-5      Kerr-runch: The unit being Tank Shocked suffers D6 S6 AP4 hits. Then, carry on with the Tank Shock as normal / Kerr-smash: The Super-heavy Vehicle roll 2D6 instead of 1 for the Ram. Then, carry on with the Ram as normal.
             6       Overrun: The unit being Tank Shocked suffers 2D6 S10 AP2 hits. Then, carry on with the Tank Shock as normal / Flipped: The Vehicle being rammed scatters D6"" and then suffers an Explodes! result from the Vehicle Damage table.
        '),
    ('Super-Heavy Walker',
    '
    - Super-heavy Walkers are Super-heavy Vehicles and use the Super-heavy Vehicle rules for Shooting, Vehicle Damage, Catastrophic Damage and Transports.
        Moving: If moving into or within difficult terrain, double the result of the highest dice roll when making a Difficult Terrain test - this is the maximum distance in inches that the model can move. Apart from this, they obey the movement rules for Walkers. In addition, Super-heavy Walkers cannot fire Overwatch.
        When a Super-heavy Vehicle loses its last Hull Point, it follows the rules for Catastrophic Damage.
        Special Rules: All Super-heavy Walkers have the following special rules: Fear, Hammer of Wrath, Invincible Behemoth, Move Through Cover, Relentless, Smash, Strike down.
        Stomp:  Super-heavy Walkers in combat can unleash a Stomp attack, which adds D3 Stomps to their normal attacks during the Fight Phase at Initiative 1. Each Stomp targets units partially under a blast marker placed near the Walker, with subsequent Stomps moving forward from the previous marker. Roll on the Stomp table for each unit affected to determine the outcome.
             1      No Effect: The unit being stomped gets out of the way of its lumbering attacker. The attack has no effect / No Effect: The unit being stomped gets out of the way of its lumbering attacker. The attack has no effect.
            2-5     Kerr-runch: Each model from the unit being stomped that is even partially under the blast marker suffers a S6 AP4 hit / Kerr-smash: One Vehicle in the unit being stomped that is at least partially under the blast marker (stomping model’s choice) suffers a penetrating hit.
             6      Overrun: Each model from the unit being stomped that is even partially under the blast marker is removed as a casualty / Flipped: One Vehicle in the unit being stomped that is at least partially under the blast marker (stomping model’s choice) scatters D6"" and then suffers an Explodes! result.
        Buildings, Flyers, certain Monsters, and Super-heavy Vehicles, Walkers, and Flyers are immune to Stomp attacks. No need to roll on the Stomp table for these units if they are under the blast marker.
        '),
    ('Super-Heavy Flyer',
    '
    - Super-heavy Flyers follow the rules for Super-heavy Vehicles, including Shooting, Vehicle Damage, Catastrophic Damage, and Transports.
        Super-heavy Flyers do not use Crash and Burn! rules. Instead, they suffer Catastrophic Damage when they lose all their Hull Points, resolved like a Super-heavy Vehicle.
        Special Rules: All Super-heavy Flyers have the following special rules: Fear, Invincible Behemoth.
    '),
    ('Sustained Hit',
    '
    - Each time an attack is made with such a weapon, an unmodified 6 To Hit inflicts a number of additional Hit corresponding to the number indicated on its profile.
    '),
    ('Swarms',
    '
    - If, when allocating Wounds to a unit with the Swarms special rule, two or more models could be chosen as the closest enemy, the closest enemy is always the model with the least number of Wounds. If a model with the Swarm special rule suffers an unsaved Wound from a Blast (any size) or Template weapon, each unsaved Wound is multiplied to two unsaved Wounds unless that Wound has the Instant Death special rule. However, a unit entirely composed of models with the Swarm special rule is not slowed by difficult terrain, but must test for Dangerous Terrain as normal.
    '),
    ('Tanks',
    '
    - When moving a Vehicle with the Tank type, the player can declare that it is going to attempt to Tank Shock or Ram instead of moving normally.
        Tank Shock: To Tank Shock, pivot the Vehicle to face the direction of movement and declare the speed chosen, up to its maximum speed. Move straight ahead until contact with an enemy or the declared distance. Tank Shocks cannot target units in combat. If a unit is reached, it must take a Morale check and may Fall Back if it fails. The Tank keeps moving, potentially affecting more units. If it would hit a friendly model, enemy Vehicle, impassable terrain, or board edge, it stops 1" away. Models under its path must be moved aside or are removed as casualties.
        Units Already Falling Back: If a unit that is Falling Back is Tank Shocked, the unit automatically fails its Morale check. This also applies if a unit Falls Back from a Tank Shock and the Tank’s remaining move brings it into contact with them a second time.
        Tank Shock from Reserve: A Tank that moves onto the battlefield from Reserve may attempt a Tank Shock. This must be declared before the Tank moves onto the board.
        Tank Shock Restrictions: After a Tank Shock, the Vehicle cannot move. No embarking or disembarking from a Transport that Tank Shocks that turn, and vice versa. Flyers cannot Tank Shock, even if they are also Tanks.
        Death or Glory: If a unit stands its ground against a Tank Shock, one model can attempt a Death or Glory attack. The attack automatically hits the Tank’s front Armor, and cover saves are not allowed. If manifested, the Tank stops or explodes, but if not, the Tank continues its move, crushing the model attempting the attack. Artillery units can also attempt this with either a crewman or a gun model, risking both if unsuccessful.
        Ramming: Ramming is like a desperate Tank Shock where the Tank moves at full speed towards one enemy Vehicle. This prevents shooting anything but Snap Shots that turn, making it suitable for Vehicles with no armament or those already Shaken. Ramming follows Tank Shock rules, but when the Ramming Tank hits an enemy Vehicle, each Vehicle suffers a hit based on its Armor, Mass, and Excessive mass. Both players roll a D6 for determining the Damages inflcted.
        Ramming Restrictions: A Vehicle making a Ram maneuver is subject to the same restrictions as a Tank Shock.
    '),
    ('Tank Hunters',
    '
    - A unit that contains at least one model with this special rule re rolls failed To Wound rolls against Vehicles (both with shooting and in close combat) and inflicted +D3 Damages with their weapon against Vehicles.
    '),
    ('Template',
    '
    - Template weapons use a template instead of a numerical range. Place the template so it covers as many ennemy models as possible without touching friendly models. Against Vehicles, position the template to cover the Vehicle without touching friendly models, hitting the facing determined by the firers position. The firer is not hit by their own template weapon.
        Special Rules: Template weapons possess the Ignores Cover, Wall of Death, and No Escape special rules, with wounds allocated as usual. They cannot make Snap Shots.
        Multiple Templates: When a unit fires multiple shots with Template weapons, resolve each shot individually to determine the number of hits. Then, roll To Wound as usual.
        Wall of Death: Template weapons can fire Overwatch, automatically inflicting D3 hits on the charging unit at their normal Sand AP value. There is no need to measure the templates length; it is assumed the ennemy charged into range.
        No Escape: Template weapons hitting an Open topped Vehicle with an embarked unit cause D6 hits to that unit, resolved at the weapons S and AP. Hits are Randomly Allocated.
    '),
    ('Transport',
    'Transports have the (Huge) Transport Capacity X determining the type and maximum number of friendly models they can carry. Units can start the battle embarked within a Transport model, declared before setting it up.
        Unshakable Nerve: Units embarked upon Transports have the Fearless special rule while they are embarked.
        Fire Deck: When this Transport fires, select a weapon from up to X embarked models; the Transport is equipped with those weapons. Models firing from a Vehicle moving at Combat Speed count as having moved. Those from a Vehicle moving at Cruising Speed can only make Snap Shots. No shooting if the Vehicle uses smoke launchers, and vice versa.
        Access Points: Each Vehicle with passenger capacity has Access Points, like doors or hatches, where passengers enter and exit (including Flying bases).
        Embarking and Disembarking: Units can embark on or disembark from a friendly Transport if all their models end a move within 3" of it. Disembarking units must be wholly within 3" of their Transport and not within Engagement Range of enemies. If a unit disembarks before its Transport moves, it can act normally. If after, it cannot move or charge but can act otherwise.
        Independent Characters & Transports: If an Independent Character and a unit are both in a Vehicle, they are automatically joined. Either can join the other by embarking or disembarking together. They can later separate by disembarking individually or together, if they end up more than 2" apart.
        Transports and Assaults: Passengers in a Transport can use Overwatch when the Vehicle is assaulted. If the Transport is destroyed, any wounds to passengers do not count for assault results, and survivors are not locked in combat.
        Psychic Powers and Transports: Psykers on a Transport can only use witchfire powers if a Fire Point has line of sight to the target. They cannot use other powers or target units embarked on Transports.
        Effects of Damage on Passengers:
        When a Vehicle suffers Crew Shaken, Crew Stunned, Weapon Destroyed, or Immobilized results, embarked units must pass a Leadership test. Failure means they can only make Snap Shots next turn.
        If the Vehicle is Wrecked, passengers must disembark within 3"" and take a Pinning test.
        If it Explodes! roll a D6 for each disembarking model; on a 1, they suffer 1 mortal wound. Survivors are placed nearby and take a Pinning test.
        For Zooming Flyers, the rules are the same except a roll of 1-3 causes a mortal wound.
        If a Transport is destroyed by shooting, shooters can charge its disembarked passengers.
    '),
    ('Twin-linked',
    '
    - Twin-linked weapons re-rolls all failed To Hit rolls.
        Twin-linked Blast Weapons: If the scatter dice does not roll a hit, you can choose to re-roll the dice with a Twin-linked Blast weapon. If you choose to do so, you must re-roll both the 2D6 and the scatter dice.
        Twin-linked Template Weapons: Twin-linked Template weapons are fired just like a single weapon, but must re-roll failed To Wound rolls and armour penetration rolls.
    '),
    ('Two Handed',
    '
    - A model attacking with this weapon never receives +1A for fighting with two Melee weapons.
    '),
    ('Unwieldy',
    '
    - A model attacking with this weapon Piles In and fights at Initiative step 1, unless it is a Monster or a Walker.
    '),
    ('Vector Dancer',
    '
    - A model with this special rule can make an additional pivot on the spot of up to 90° at the end of its move. A model that uses this extra pivot cannot move Flat Out in the following Shooting phase.
    '),
    ('Vector Strike',
    '
    - When Swooping or Zooming, this model may savage its prey. At the end of the Movement phase, nominate one enemy unit not locked in combat that the model has moved over that turn. That unit takes 1 hit (if the unit is an enemy Flyer in Zoom mode it instead takes D3 hits). Unless stated otherwise, Vector Strike hits are resolved at the model’s unmodified S and AP-4, using Random Allocation. These hits have the Ignores Cover special rule. These hits do not benefit from any of the model’s special rules, such as Furious Charge, Poisoned, Rending etc. Against Vehicles, these hits are resolved against the target’s side armour.
        A model that made a Vector Strike in its Movement phase counts as having already fired one weapon in its following Shooting phase.
    '),
    ('Vortex',
    '
    - A weapon with this special rule is a Destroyer weapon and uses a blast marker of some type (e.g. blast, large blast, massive blast, etc). Place the appropriate marker, roll for scatter and apply damage. For determining Wound allocation, always assume the shot is coming from the centre of the marker, in the same manner as a Barrage weapon.
        The marker for a Vortex weapon is not removed from play after damage has been resolved. Leave it in play on the tabletop. The marker is impassable terrain as long as it remains in play.
        At the beginning of every subsequent player turn, the marker scatters 2D6" (use the little arrow if you roll a Hit!). If a double is rolled, the marker is removed from play instead. Any unit under the marker’s new location is hit. Apply damage as described above.
    '),
    ('Walker',
    '
    - Measure ranges and distances to/from a Walker’s base or hull. Weapons of a Walker are measured differently.
        Moving Walkers: Walkers move like Infantry, handling difficult terrain similarly. They are Immobilized if they fail a Dangerous Terrain test. Walkers have facings, affecting their firing arcs and Armor Value when attacked. They can Run, foregoing shooting and charging, except when Stunned or Immobilized.
        Firing Walkers: Walker weapons can swivel up to 45° horizontally and vertically. Measure ranges from the weapon and line of sight from its mounting point. They can fire Overwatch and at units outside their weapon arc unless immobilized. Determine Armor Value based on the body’s position relative to the firing model.
        Fighting Walkers: Walker’s assault and are assaulted like Infantry models in close combat. They fight like Infantry but may not gain additional Attacks for each Melee weapon they wield. Shaken damage does not affect their close combat abilities. They can make Sweeping Runs, Pile In moves, and Consolidations unless Stunned or Immobilized. When rammed by a Tank, resolve the collision as with Vehicles. All Walkers have the Hammer of Wrath special rule.
    '),
    ('Warp Mutation',
    '
    - If the bearer slays an enemy Character or Monster, roll a D6: on the roll of a 2+ the victim is transformed into a Chaos Spawn under the control of the Daemon player. Place a new Chaos Spawn model (under your control), anywhere within 6" of the victim that is more than 1" from any unit (friend or foe) and impassable terrain. Once you have placed the Chaos Spawn remove the victim as a casualty.
    '),
    ('Wrath of Angels',
    '
    - For every Critical Wound made with this weapon, that unit suffers an additional wound using the same weapon profile.
    '),
    ('Zealot',
    '
    - A unit containing one or more models with the Zealot special rule automatically passes Pinning, Fear and Regroup tests and Morale checks, but cannot Go to Ground and cannot choose to fail a Morale check due to the Our Weapons Are Useless rule. If a unit gains the Zealot special rule when it has Gone to Ground, all the effects of Go to Ground are immediately cancelled.
        In addition, units containing one or more models with the Zealot special rule re-roll all failed To Hit rolls at close combat.
    ')
;