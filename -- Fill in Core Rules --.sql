-- Core rules Table
INSERT INTO core_rules_1 (phase_rule, phase_desc)
VALUES
    ('Command Phase',
    '
    - Both players gain 1CP.
    - Resolve any other rules that occur in the Command phase.
    - Take a Battle-shock test for each unit from your army on the battlefield that is Below Half-strength.
        Roll 2D6: if the result is greater than or equal to the unit’s Leadership, the test is passed. Otherwise, the unit is Battle-shocked until the start of your next Command phase.
        Battle-shocked units have an OC of 0 and their controlling player cannot use Stratagems to affect them.
        Battle-shocked units must take Desperate Escape tests if they Fall Back.
    - Progress to the Movement phase.
    '),

    ('Movement Phase',
    '
    - Select a unit in your army to move.
        When a unit moves it can either make a Normal Move, Advance or Remain Stationary.
        Units that are within Engagement Range of any enemy models can only either Fall Back or Remain Stationary.
    - Normal Move: Models move up to M". Cannot move within Engagement Range of any enemy models.
    - Advance: Models move up to 1.5xM". Cannot move within Engagement Range of enemy models. Units that Advance cannot shoot or charge this turn.
    - Remain Stationary: Models cannot move this phase.
    - Fall Back Move: Models move up to M".
        Units that Fall Back cannot shoot or declare a charge in the same turn. Models can move over enemy models when Falling Back, but you must take Desperate Escape tests for them before they do so (excluding models With the Jump, Jetbike or Jet Pack Type).
        If a Battle-shocked unit is selected to Fall Back, take a Desperate Escape test for every model in that unit.
          Desperate Escape Test: Roll one D6. On a 1-2, one model from that unit is destroyed.
    - Moving Into Difficult Terrain:
        If a unit starts its move outside difficult terrain, the player must declare if he wants his unit to try to enter difficult terrain as part of their move. If he chooses not to, the unit moves as normal but may not enter difficult terrain. If he chooses for a unit to do so, the unit must take a Difficult Terrain test.
        To take a Difficult Terrain test, roll 2D6 and select the highest result, this is the maximum distance, in inches, that any of the models in the unit may move. Even if the distance rolled is too short for any of the models to reach the difficult terrain, the unit is still slowed down as described above.
        You should also note that, if you take the Difficult Terrain test, you are not compelled to move the models.
    - Moving Within Difficult Terrain:
        If any models in a unit start their move in difficult terrain, they are affected by the terrain and must take a Difficult Terrain test.
        No models in the unit can move more than the distance indicated by the test, even if they are not in difficult terrain.
    - Dangerous terrain follows all the rules for difficult terrain.
        In addition, each model must take a Dangerous Terrain test as soon as it enters, leaves or moves within dangerous terrain.
        To take a Dangerous Terrain test, roll a D6. On a result of a 1, that model suffers a Wound. The model may take an armour or invulnerable save, but not a cover save, against this Wound.
        Once a model has taken a Dangerous Terrain test for a particular scenery model, it does not test for that terrain again in the same phase. However, if the model moves into a different area of dangerous terrain, this must be tested for as normal.
    - Models can move freely over terrain features 2" or less in height. Models cannot move through terrain features taller than 2", but can climb up and down them.
    - A unit can embark within a friendly Transport if all of its models end a Normal, Advance or Fall Back move within 3" of that Transport.
      A unit cannot embark and disembark in the same phase.
      Units that start your Movement phase embarked within a Transport can disembark this phase, provided their Transport has not Advanced or Fallen Back. If a unit disembarks before its Transport moves, it can act normally. If a unit disembarks after its Transport moves, it cannot move or charge this turn, but can otherwise act normally. Disembarking units must be set up wholly within 3" of their Transport and not within Engagement Range of any enemy models (or the unit cannot disembark).
      Units that disembark this turn count as having moved.
    - If a Transport is destroyed, any embarked units must disembark. Roll one D6 for each model that disembarks: for each 1, that model’s unit suffers 1 mortal wound.
      Until the start of its controlling player’s next Command phase, the disembarking unit is Battle-shocked. Until the end of the turn, the disembarking unit counts as
      having made a Normal move, and cannot declare a charge.
        Units disembarking a destroyed Transport that cannot be set up wholly within 3" of it must perform an Emergency Disembarkation:
        Must be set up wholly within 6" of it instead of wholly within 3". Suffer 1 mortal wound for each roll of 1-3, instead of each roll of 1. Any disembarking model that cannot be set up is destroyed.
    - Select another unit in your army to move.
    - Once all your units have moved, progress to the Reinforcements step.

    - Reinforcement unit: Unit that starts the battle in a location other than the battlefield. Set up your Reinforcement units, one at a time, as described by the rules that let them start the battle in locations other than the battlefield. Reinforcement units cannot make a Normal Move, an Advance, Fall Back or Remain Stationary this turn. Reinforcement units always count as having moved this turn. Any Reinforcement unit not set up on the battlefield by the end of the battle counts as destroyed.
    - Once all your Reinforcement units have been set up, progress to the Psychic phase.
    '),

    ('Psychic Phase',
    '
    - Select a Psyker in your army to manifest its psychic powers.
    - All Psykers know Smite.
    - Select psychic power.
    - Attempt to manifest the psychic power by taking a Psychic test.The opponent can attempt to deny the psychic power by taking a Deny the Witch test.
      If successfully manifested, resolve the psychic power’s effects.
    - Select another psychic power.
    - Psychic test:
      Passed if 2D6 equals or exceeds psychic power’s warp charge. If double 1 or double 6 rolled, Psyker suffers Perils of the Warp.
      Deny the Witch: Passed if 2D6 exceeds result of the opposing Psyker’s Psychic test. Only one attempt can be made to deny each psychic power.

        The target unit contains one or more models with:	                               Modifier
    
        The Psyker, Psychic Pilot or Brotherhood of Psykers/Sorcerers special rule	        +1
        A Mastery Level higher than the Psyker manifesting the power	                      +1
        The Adamantium Will special rule	                                                  +1
    
    - Perils of the Warp:
        If a unit suffers Perils of the Warp, roll a D6 and consult the Perils of the Warp table below. If the unit has the Brotherhood of Psykers/Sorcerers special rule, the effects of the Perils of the Warp result apply a randomly determined model in the unit who has the Brotherhood of Psykers/Sorcerers special rule. Note that suffering Perils of the Warp does not necessarily mean that a psychic power fails to manifest. Assuming that the Psychic test was successful and any Deny the Witch test failed, the psychic power still manifests, regardless of whether or not the Psyker in question suffers a Wound or is slain by Perils of the Warp.

    D6	Result
    1	Dragged into the Warp: The Psyker must take a Leadership test. If the test is passed, the Psyker suffers 1 Mortal Wound. If the test is failed, the Psyker is removed as a casualty and his unit suffers D6 S6/AP1/D1 hits. For Wound allocation purposes, assume the attack is coming from the Psyker that suffered Perils of the Warp.
    2	Mental Purge: The Psyker suffers 1 Mortal Wound. In addition, the psychic power attempted to manifest by the Psyker is immediately lost, and cannot be used by the Psyker for the rest of the battle.
    3	Power Drain: The Psyker suffers 1 Mortal Wound. In addition, all new psychic test passed during the current Psychic Phase are worsed by 1.
    4	Psychic Backlash: The Psyker suffers 1 Mortal Wound. 
    5	Empyric Feedback: The Psyker must take a Leadership test. If the test is failed, the Psyker suffers 1 Mortal Wound.
    6	Warp Surge: The Psyker must take a Leadership test. If the test is failed, the Psyker suffers 1 Mortal Wound. If the test is passed, the Psyker gains a 3++/3++ Invul save as well as the Fleshbane, Armourbane and Smash special rules, until the start of the next friendly Psychic phase.
    
    - Psychic Hoods:
        Each time a unit (or model) is targeted by an enemy psychic power and is within 12" of a friendly model with a psychic hood, the wearer of the hood can attempt to Deny the Witch in their stead, as if he were in the target unit. If the Deny the Witch attempt is failed, the psychic power is resolved as normal, but effects only the initial target, not the wearer of the hood. If a model with a psychic hood is embarked in a vehicle or building, he can only use the hood to nullify powers targeting the vehicle or building he is embarked within.
    
    - Types of Psychic Powers:
        - Blessing: Blessings grant extra abilities to the Psyker’s allies, such as Characteristic boosts or additional special rules. Blessings target one or more friendly units and, unless otherwise stated, last until the start of the Psyker’s next Psychic phase. Blessings can affect units that are locked in close combat and can affect the Psyker himself. The benefit of any one particular blessing can only be gained once per unit per turn, but benefits from different blessings are cumulative. Unless otherwise stated, blessings cannot modify Characteristics above 10 or below 1 (or below 2,in the case of Leadership).

        - Conjuration: Conjuration powers can summon units across great distances, call new allies to the fray, or even create them from the raw stuff of the Warp. Each conjuration power specifies the type and number of models to be conjured. Unless stated otherwise, the new unit cannot take any additional options or upgrades. If you do not have enough models to place the entire unit on the board, place as many as you can, the excess are destroyed. When the power is resolved, the new unit then arrives via Deep Strike, within the power’s maximum range; the new unit is under your control and is treated as having arrived from Reserves for all rules purposes.
          If the new unit suffers a Deep Strike mishap and ends up in Ongoing Reserves, it can Deep Strike anywhere on the board when it enters play.
          If the new unit is a Psyker, the new unit cannot attempt to manifest conjuration powers on the same turn it was itself conjured. If the new unit has any random powers/abilities that would normally need to be generated before the start of the game, generate them at this time. Unless otherwise noted, conjured units are scoring units. Conjuring Daemons: If a conjuration power creates a unit from Codex: Chaos Daemons and that unit’s Army List Entry includes the option to take an Icon of Chaos, an Instrument of Chaos and/or the option to upgrade one model to a Character, you may take any of these options for free provided you have the appropriate model available. Unless stated otherwise, the unit cannot take any further upgrades or options.

        - Malediction: Maledictions weaken the Psyker’s enemies by reducing their Characteristics or inflicting special rules that penalise their abilities. Maledictions target one or more enemy units and, unless otherwise stated, last until the start of the Psyker’s next Psychic phase. Maledictions can affect units that are locked in close combat. Note that bonuses and penalties from different maledictions are always cumulative, but cannot, unless otherwise stated, take Characteristics above 10 or below 1 (or below 2, in the case of Leadership).

        - Witchfire: Witchfire powers are shooting attacks. Indeed, they are often referred to as psychic shooting attacks, and many have profiles similar to ranged weapons.
          Just like when shooting a weapon, a Psyker must be able to see the target unit (or target point) and cannot be locked in combat if he wishes to manifest a witchfire power. Similarly, a witchfire power must roll To Hit, unless it is has the Blast special rule, in which case it scatters as described in the Blast special rule, or it is a Template weapon, which hit automatically. Psykers can make Snap Shots in the Psychic phase with witchfire powers in the same way as with other shooting weapons. Saves can be taken against Wounds from witchfire in the same way as for any other shooting attack, and hits are allocated to the closest target models to the Psyker. Unlike firing a shooting weapon though, a Psyker can manifest several different witchfire powers during the same phase (assuming he has enough Warp Charge) and each can target a different unit if you so choose. Manifesting witchfire powers does not prevent the Psyker (or his unit) from firing weapons in the following Shooting phase, nor does it prevent the Psyker’s unit from Running, Turbo-boosting or moving Flat Out. A Psyker who manifests a witchfire power can target a different unit with his other ranged weapons in the Shooting phase. Witchfire powers cannot be used to make Overwatch attacks.
          There are several different sub-types of witchfire, each applying slightly different targeting restrictions. If the witchfire does not list a sub-type, or simply describes itself as a psychic shooting attack, use the rules given above to resolve it. If it has one of the following subtypes, use the rules for that sub-type.
            - Beam: To use a witchfire power with the beam sub-type, target a point within the power’s range and trace a line (about 1mm thick) between the chosen point and the centre of the Psyker’s base, this line cannot be drawn over any unit that is locked in combat. All units under the line (friend and foe) are hit, with the exception of Zooming Flyers, Swooping Flying Monsters and the Psyker himself. Each unit hit by the attack takes a number of hits equal to the number of models from that unit that are under the line. Only one unit that has a model under the line can attempt to Deny the Witch.
            - Focussed Witchfire: Some witchfire powers can pick out models in an enemy unit, these are called focussed witchfire powers. They follow all the normal rules for witchfire, but you can choose the specific model in the target unit that you want the power to affect. When the Psychic test is taken for focussed witchfire, pay close attention to the number of Warp Charge points harnessed. If the total number of Warp Charge points harnessed exceeds the Warp Charge cost required to manifest the psychic power, the power is resolved against the model you chose. If the cost to manifest the power is met, but not exceeded, resolve the power against the closest model in the target unit instead.
            - Nova: A nova power automatically targets and hits all enemy units within the psychic power’s maximum range, regardless of line of sight, being locked in combat, intervening models/terrain and so on. Otherwise, a nova is treated like a shooting attack, and indeed will have a profile like a ranged weapon. Only one unit that is within the power’s maximum range can attempt to Deny the Witch.
    
    - Select another Psyker in your army to manifest its psychic powers.
    - Once all your Psykers have manifested psychic powers, progress to the Shooting phase.
    '),

    ('Shooting Phase',
    '
    - Before a unit shoots, select the targets for all of its ranged weapons.
      Each model of the firing unit can only shoot on models that are in his own line of sight and within range of the weapon being used.
      Models with more than one ranged weapon can shoot them at the same or different targets, but models cannot split attacks from the same weapon across more than one target.
      Models in the same unit can shoot at the same or different targets.
    - When a unit shoots, select targets then resolve attacks with any or all ranged weapons that models in that unit are equipped with.
      If a unit targets multiple units, all attacks against one unit must be resolved before resolving attacks against the next.
      Units cannot shoot while they are within Engagement Range of any enemy units (unless shooting with a Pistol). Units cannot shoot at targets within Engagement Range of any friendly units.
      Monsters and Vehicles can shoot, and be shot at, even while they are within Engagement Range of enemy units. Each time a ranged attack is made by or against such a unit, subtract 1 from that attack’s Hit roll (unless shooting with a Pistol).
      Monsters and Vehicles can target other units, but cannot resolve these attacks while any enemy models remain within their Engagement Range.
      Subtract 1 from hit rolls made when Monsters and Vehicles shoot Heavy weapons while any enemy units remain within their Engagement Range.
      Hit Roll (Ranged Attack): A hit is scored if the D6 result equals or exceeds that attack’s BS.
      Hit Roll (Melee Attack): A hit is scored if the D6 result equals or exceeds that attack’s WS.
      Critical Hit: Unmodified Hit roll of 6. Always successful.
      An unmodified Hit roll of 1 always fails.

        WOUND ROLL:
        ATTACK’S STRENGTH VS TARGET’S TOUGHNESS	                      D6 RESULT REQUIRED
        Strength is TWICE (or more than twice) the Toughness.                2+
        Strength is GREATER than the Toughness.	                             3+
        Strength is EQUAL to the Toughness.	                                 4+
        Strength is LESS than the Toughness.	                               5+
        Strength is HALF (or less than half) the Toughness.	                 6+

      Critical Wound: Unmodified Wound roll of 6. Always successful.
      An unmodified Wound roll of 1 always fails.
      If a model in the target unit has already lost any wounds or had other attacks allocated to it this phase, the attack must be allocated to that model.
    - Saving throw: Roll one D6 and modify by the attack’s AP. If result less than the Sv of the selected model, the saving throw is failed and it suffers damage.
      Otherwise attack is saved.
    - Invulnerable Save: Never modified by an attack’s AP.
    - Determining Cover Saves: If, when you come to allocate a Wound, the target model’s body (see line of sight) is at least 25% obscured from the point of view of at least one firer, Wounds allocated to that model receive a cover save. Unless specifically stated otherwise, all cover provides a 5+ save. Some types of terrain provide better or worse cover saves; when this is the case the cover save provided will be stated in the rules for the terrain.
      The controlling player can choose to use either a model’s invulnerable save, Cover Save or its Save Characteristic.
    - Each mortal wound inflicted on a unit causes one model in that unit to lose one wound.
      No saving throws can be made against mortal wounds.
      Mortal wounds inflicted by attacks always apply after any normal damage, even if that damage was saved.
    - Inflict damage: The selected model loses a number of wounds equal to the attack’s D.
      If a model is destroyed by an attack, any excess damage inflicted by that attack is lost.
    - Once all your Units have shooted, progress to the Charging phase.
    '),

    ('Charging Phase',
    '
    - Select a unit from your army to charge with. Charge with that unit. Declare targets of the charge (must be within 12"). Charge roll = 2D6". If insufficient to move charging unit into Engagement Range of all targets, charge fails. If charge successful, models make their charge move. Cannot make a charge move within Engagement Range of any unit that was not the target of the charge.
      Charging Through Difficult Terrain: Models are slowed when charging through difficult terrain. If, when charging, one or more models have to move through difficult terrain in order to reach the enemy by the shortest possible route, the entire unit subtracts 2 from its total when determining its charge range. If at least one model in the charging unit moved through difficult terrain as part of its charge move, all of the unit’s models must attack at Initiative step 1, regardless of other Initiative modifiers, even if the charging unit is not slowed by difficult terrain. Remember that charging models must engage as many enemies in the target unit as possible.
      Charging Through Dangerous Terrain: In addition to the penalties for charging through difficult terrain, if any model in a charging unit goes through dangerous terrain, that model must immediately take a Dangerous Terrain test. If a model has a rule that states it is not slowed when charging through difficult terrain, it is not slowed by charging through dangerous terrain either, but it must still take a Dangerous Terrain test.
      Charging Units That Have Gone to Ground: If all of the enemy units charged have Gone to Ground, the Initiative penalty for charging through difficult terrain does not apply, and the unit charging through difficult terrain fights at its normal Initiative.
    - Failed Charge: If the initial charger is found to be further than its charge range from the enemy, the charge fails and no models are moved.
    - Overwatch: Before charge roll made, all charge targets that can fire Overwatch can do so. Can never fire Overwatch while enemy units are in Engagement Range. When firing Overwatch, shoot with unit, but attacks only hit on unmodified 6s.
    - Select another unit from your army to charge with.
    - Once all your units have charged, progress to the Heroic Interventions step.
      Select one Character unit to perform a Heroic Intervention. Cannot perform a Heroic Intervention if any enemy units are in Engagement Range. Must be an enemy unit within 3" horizontal and 5" vertical to perform a Heroic Intervention. Select another Character unit to perform a Heroic Intervention.
      Heroic Intervention: Move up to 3". Must end closer to the closest enemy model.
    - Once all your Character units have performed Heroic Interventions, progress to the Fight phase.
    '),

    ('Fighting Phase',
    '
    - In close combat, both players’ models fight. Attacks in close combat work like shots in shooting.
    - Initiative Steps: A model’s Initiative determines when he attacks in close combat. Work your way through the Initiative values of the models in the combat, starting with the highest and ending with the lowest. This means that each combat will have ten Initiative steps, starting at Initiative 10 and working down to Initiative 1. You’ll rarely have models fighting at all of the Initiative steps, so just skip any that don’t apply. Models make their attacks when their Initiative step is reached, assuming they haven’t already been killed by a model with a higher Initiative! If both sides have models with the same Initiative, their attacks are made simultaneously. Note that certain situations, abilities and weapons can modify a model’s Initiative.
    - Pile-in Move: Up to 3". Every model that moves must end closer to the closest enemy model, and in base-to-base contact with an enemy model if possible. The unit must end in Unit Coherency and within Engagement Range of at least one enemy unit (or no models can Pile In).
    - Each engaged model makes a number of attacks (A) as indicated on its Characteristics profile, plus the following bonus attacks:
        +1 Charge Bonus: Engaged models that charged this turn get +1 Attack this turn. Models in units that made a disordered charge do not get this bonus.
        +1 Two Weapons: Engaged models with two single-handed weapons (often a Melee weapon and/or pistol in each hand) get +1 Attack. Models with more than two weapons gain no additional benefit; you only get one extra Attack, even if you have four arms and a sword in each.
      Other Bonuses: Models may have other special rules and wargear that confer extra Attacks.
    - Consolidation Move: Up to 3". Every model that moves must end closer to the closest enemy model, and in base-to-base contact with an enemy model if possible. The unit must end in Unit Coherency and within Engagement Range of at least one enemy unit if possible. If the above is not possible, each model can move towards the closest objective marker, but this must result in the unit being within range of it and in Unit Coherency. If the above is also not possible, no models can Consolidate.
    '),

    ('Morale Phase',
    '
    - Players alternate taking Morale tests for units from their army that have suffered casualties this turn.
    - Morale test = D6 + number of models destroyed this turn. Unmodified roll of 1 always a success (no models flee). If Morale test exceeds unit’s Ld, one model flees and other models must take Combat Attrition tests.
      Combat Attrition tests: Roll one D6 for each remaining model in unit; for each 1, one additional model flees. Subtract 1 from Combat Attrition tests if unit is below Half-strength.
    - If one player has no more units left to take Morale tests, their opponent then takes Morale tests for their remaining units, one at a time.
    - Once all units have taken Morale tests, progress to the Unit Coherency Checks step.
    - Remove models from units in your army that are not in unit coherency.
    - Once all out of coherency models have been removed (if any), the Morale phase ends. The player’s turn then ends and, unless the battle ends, the next player’s turn begins.
    ')
;