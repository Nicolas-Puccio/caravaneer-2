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

8. **Less entities during fights**: Slaves and transport are removed from the fight, to improve performance, and make the battles faster.

9. **More mercenaries available in towns**: Added +1 to the amount of mercenary in a town, making it easier to find recruits in low population towns.

10. **Smaller battle fields**: halved how much battle field size scales with weapon skill, and reduced min size when using melee weapons.

11. **Fix starving towns**: Some towns did not expand forage industry properly which caused a deficit in food production and expensive food prices.

12. **Partial fix chained industries**: Leather vest and yarn jackets will produce if consumption is satisfied by another industry, regardless of storage space.



### Quality of Life

- Trade Window
	- Right clic on side scrolls will quickly take all items.
	- Add display of water/food needed, considering water % from food.
	- Auto select amount of water/food required for travel.
	- Reduced size of item image to fit more items on the side scrolls.
	- Visual indicator of high sell price, can be set on [the prices file](#Instructions).
	- Displays item's ID for using in prices file and modding.

- Industries UI
	- Add estimation of consumption expences, and profit.

- Navigation Screen
	- Auto invert when selecting GO.

- Silos and Kevin's house moved slightly off the main road.



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

1. BattleField				~line 1402, and 1544				P-code only
2. BattleMode				~line 200, 232, 261, and 661
3. Caravan				~line 1266
4. CaravanEncounterMenu			~line 72, and 97
5. CharacterSetupScreen			~line 92, 377, and 509
6. List					~line 792
7. MapMode				~line 5624, and 5985				P-code only
8. NavigationScreen			~line 788
9. TownMode				~line 619, 691, 815, 836, 1015, and 1036
10. TradeWindow				~line 96, 356, 460 ,525, 802, 884, 1924, and 2017
11. Presets				~line 8269, 8277, and 10705
12. GameData				~line 544, 790, 1364, and 14544
13. Images				819_TitleScreen.jpg



## Bugs

1. Game freeze for a few seconds if AI is unable to find a path to the target, when this happen the default behaviour is to flee.



## Work in progress

1. Allow starting new breeding industries in currently not allowed towns
2. Industry QOL UI changes (expenses total)
3. Ability to improve water well (did wells get fixed with the food/forage update in v10?)
4. spawn characters in straight line rather than grid, code fails with large groups
5. takeall shortcut in trade widnow does not work in middle section, breaks both
6. fix how the loop runs in industry optimization



## Ideas

1. New bandit types
2. Make extra caravans while playing
3. Make extra towns while playing
4. Visual indicator if buy/sell price of a good is high/low in the current trade (partially done)
5. add config.txt to enable/disable any feature