# Caravaneer 2 - Modded

This repository contains a modified version of [Caravaneer 2](https://store.steampowered.com/app/1500820/Caravaneer_2/)



## Changes

1. **Caravan members don't die**: Caravan members are now immortal and won't die in combat. Mission companions can still die and missions can be failed, main character can die as well.

2. **Post-combat health**: After combat, all caravan members heal to at least 10% HP, ensuring good walking speed after fights.

3. **Reduced warpower**: Each caravan member now contributes less warpower, making your caravan more likely to be attacked, especially if equipped with cheap weapons.

4. **Auto distribute ammo & attack**: Using this button will enable AI control of caravan members, and maybe main character([See Instructions](#Instructions)).

5. **Increased starting stats**: Main character now has 80 stat points to distribute during character creation, with each stat capped at 20 points.

6. **Extra UMi alpha**: Start the game with a free UMi Alpha in the bunker storage, plus the storage got bigger to accomodate the vehicle.

7. **Faster walk animation**: Walk animations during battle are twice as fast.

8. **More info on trade window**: Trade window displays water/food needed, and also auto-selects amount required. More items fit in the side scrolls.

9. **Visual indicator of high price in trade window**: Item images will change color if the price is above a custom set value.

10. **No slaves during fights**: Slaves are removed from the fight, to improve performance, and make the battles faster.

11. **More mercenaries available in towns**: Added +1 to the amount of mercenary in a town, making it easier to find recruits in low population towns.

12. **Smaller battle fields**: halved how much battle field size scales with weapon skill.

13. **Town moved out of the way**: Silos and Kevin's house were moved slightly off the main road.



## Installation

1. Download the `caravaneer2.swf` file from the repository.
2. Replace the existing `caravaneer2.swf` file in the game's folder with the downloaded file.
3. Run the game as usual, using the `.exe` file or through Steam.
4. Create a new character named Puccio (Only needed for changes 1, 2, and 3. I am working on removing this requirement).



## Instructions

START BATTLE: using this button goes the default fight where you control all members.

AUTO DISTRIBUTE & FIGHT/ATTACK: using this button will make your mercenaries be controlled by the AI.

MAIN CHARACTER AI: only enabled if the second weapon slot of your main character is empty.


Water/Food need is only updated when the navigation screen is opened, it won't automatically update if more members are recruited/dismissed.
Trade window displays ID of items.

In order to enable visual indicators need to create a "puccio.txt" with the "ID-Price" format, example .txt in the files section above. 



## Files changed

1. BattleField				~line 1544					P-code only
2. BattleMode				~line 200, 232, and 261
3. Caravan				~line 1266
4. CaravanEncounterMenu			~line 72, and 97
5. CharacterSetupScreen			~line 92, 377, and 509
6. MapMode				~line 5624					P-code only
7. NavigationScreen			~line 788
8. TradeWindow				~line 96, 356, 460 ,525, 884, 1924,and 2017
9. Presets				~line 8269, 8277, and 10705
10. GameData				~line 544, 790, and 14544
11. Images				819_TitleScreen.jpg



## Bugs

1. Game freeze for a few seconds if AI is unable to find a path to the target, when this happen the default behaviour is to flee.



## Work in progress

1. Allow starting new breeding industries in currently not allowed towns
2. Industry QOL UI changes (profit/cost estimate, expenses total)
3. Ability to improve water well



## Ideas

1. New bandit types
2. Make extra caravans while playing
3. Make extra towns while playing
4. Fix broken economy in Drekar camp
5. Visual indicator if buy/sell price of a good is high/low in the current trade (partially done)
6. add config.txt to enable/disable any feature