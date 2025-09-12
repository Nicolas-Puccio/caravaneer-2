# Caravaneer 2 - Modded

This repository contains a modified version of [Caravaneer 2](https://store.steampowered.com/app/1500820/Caravaneer_2/)



## Changes

1. **Caravan members don't die**: Caravan members are now immortal and won't die in combat. Mission companions can still die and missions can be failed, main character can die as well.

2. **Post-combat health**: After combat, all caravan members heal to at least 10% HP, ensuring good walking speed after fights.

3. **Reduced warpower**: Each caravan member now contributes less warpower, making your caravan more likely to be attacked, especially if equipped with cheap weapons.

4. **Auto distribute ammo & attack**: Using this button will enable AI control of caravan members. You can only manually control your main character.

5. **Increased starting stats**: Main character now has 80 stat points to distribute during character creation, with each stat capped at 20 points.

6. **Extra UMi alpha**: Start the game with a free UMi Alpha in the bunker storage, plus the storage got bigger to accomodate the vehicle.

7. **Faster walk animation**: Walk animations during battle are twice as fast.

8. **More info on trade window**: Trade window also displays water/food needed. (currently not considering water from food source)

9. **No slaves during fights**: Slaves are removed from the fight, to improve performance, and make the battles faster.

10. **More mercenaries available in towns**: Added +1 to the amount of mercenary in a town, making it easier to find recruits in low population towns.

11. **Smaller battle fields**: halved how much battle field size scales with weapon skill.


## Installation

1. Download the `caravaneer2.swf` file from the repository.
2. Replace the existing `caravaneer2.swf` file in the game's folder with the downloaded file.
3. Run the game as usual, using the `.exe` file or through Steam.
4. Create a new character named Puccio (Only needed for changes 1, 2, and 3. I am working on removing this requirement)



## Instructions

START BATTLE: using this button goes the default fight where you control all members
AUTO DISTRIBUTE & FIGHT/ATTACK: using this button will make your mercenaries be controlled by the AI

water/food need is only updated when the navigation screen is opened, it won't automatically update if more members are recruited/dismissed



## Files changed

1. BattleField				~line 1544					P-code only
2. BattleMode				~line 200, 232, and 261
3. Caravan				~line 1266
4. CaravanEncounterMenu			~line 72, and 97
5. CharacterSetupScreen			~line 93, 378, 392, 406, and 420
6. MapMode				~line 5624					P-code only
7. NavigationScreen			~line 788
8. TradeWindow				~line 96, and 525
9. Presets				~line 8268
10. GameData				~line 544, and 790
11. Images				819_TitleScreen.jpg


## Bugs

1. Game freeze for a few seconds if AI is unable to find a path to the target, when this happen the default behaviour is to flee.



## Work in progress

1. Fix "randomize attributes" button in character setup screen
2. Include water from food sources in "water need" calculation
3. Allow starting new breeding industries in currently not allowed towns
4. Industry QOL UI changes
5. Ability to improve water well



##Ideas

1. New bandit types
2. Make extra caravans while playing
3. Make extra towns while playing
4. Fix broken economy in Drekar camp