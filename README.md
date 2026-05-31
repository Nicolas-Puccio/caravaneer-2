# Caravaneer 2 - Modded

This repository contains a modified version of [Caravaneer 2](https://store.steampowered.com/app/1500820/Caravaneer_2/)



## Changes

1. **Caravan members don't die**: Caravan members are now immortal and won't die in combat. Mission companions can still die and missions can be failed, main character can die as well.

2. **Post-combat health**: After combat, all caravan members heal to at least 10% HP, ensuring good walking speed after fights.

3. **Reduced warpower**: Each caravan member now contributes less warpower, making your caravan more likely to be attacked, especially if equipped with cheap weapons.

4. **AI battles**: Can choose between fully automated battles, or only automate your mercenaries.

5. **Increased starting stats**: Main character now has 80 stat points to distribute during character creation, with each stat capped at 20 points.

6. **Extra UMi alpha**: Start the game with a free UMi Alpha in the bunker storage, plus the storage got bigger to accomodate the vehicle.

7. **Faster walk animation**: Walk animations during battle are twice as fast.

8. **Less entities during fights**: Slaves and transport are removed from the fight, to improve performance, and make the battles faster.

9. **More mercenaries available in towns**: Added +1 to the amount of mercenary in a town, making it easier to find recruits in low population towns.

10. **Smaller battle fields**: halved how much battle field size scales with weapon skill, and reduced min size when using melee weapons.

11. **Fix starving towns due to forage deficit**: Some towns did not expand forage industry properly which caused a deficit in food production and expensive food prices.

12. **Partial fix chained industries**: Leather vest and yarn jackets will produce if consumption is satisfied by another industry, regardless of storage space.

13. **Enabled Crowdfunder DLC**: DLC with weapon that shoots money ([Install Instructions](#Installation)).



### Quality of Life

- Trade Window
	- Right clic on side scrolls will quickly take all items.
	- Add display of water/food needed, considering water % from food.
	- Auto select amount of water/food required for travel.
	- Reduced size of item image to fit more items on the side scrolls.
	- Visual indicator of high sell price, can be set on [the prices file](#Instructions).
	- Displays item's ID for using in prices file and modding.
	- Move undesired items to the bottom of the trade window.

- Industries UI
	- Add estimation of consumption expences, and profit.

- Navigation Screen
	- Auto invert when selecting GO.

- Silos and Kevin's house moved slightly off the main road.



## Installation

1. Download the files  
   - Download `caravaneer2.swf` from the repository.  
   - *(Optional)* Download `Crowdfunder.swf` to enable the DLC with a new weapon.

2. Replace or add the files  
   - Replace the existing `caravaneer2.swf` in the game folder with the new one.  
   - *(Optional)* Add `Crowdfunder.swf` in the same folder.

3. Run the game  
   - Start it with the `.exe` file or through Steam.

4. Create a new character  
   - Name it **Puccio** (only required for changes 1, 2, and 3; I’m working on removing this requirement).



## Instructions

Water/Food need is only updated when the navigation screen is opened, it won't automatically update if more members are recruited/dismissed.
Trade window displays ID of items.

In order to enable visual indicators need to create a "puccio.txt" with the "ID-Price" format, example .txt in the files section above.
In order to put undesired items at the bottom of trade window need to add the IDs to the end of "puccio.txt" file



## Files changed

| File                  | Line(s)                                       | Notes        |
|-----------------------|-----------------------------------------------|--------------|
| BattleField           | 1402, 1544                                    | P-code only  |
| BattleMode            | 200, 232, 261, 661                            |              |
| Caravan               | 1266                                          |              |
| Caravaneer2           | 1270                                          |              |
| CaravanEncounterMenu  | 72, 97                                        |              |
| CharacterSetupScreen  | 92, 377, 509                                  |              |
| List                  | 580, 780, 792                                 |              |
| MapMode               | 5624, 5985                                    | P-code only  |
| NavigationScreen      | 788                                           |              |
| TownMode              | 619, 691, 815, 836, 1015, 1036                |              |
| TradeWindow           | 96, 356, 460, 525, 802, 884, 1943, 2036       |              |
| Presets               | 8269, 8277, 10705                             |              |
| GameData              | 544, 790, 1364, 14544                         |              |
| Images                | 819_TitleScreen.jpg                           |              |



## Bugs

1. Game freeze for a few seconds if AI is unable to find a path to the target, when this happen the default behaviour is to flee.



## Work in progress

1. Allow starting new breeding industries in currently not allowed towns
2. Industry QOL UI changes (expenses total)
3. Ability to improve water well (did wells get fixed with the food/forage update in v10?)
4. Spawn characters in straight line rather than grid, code fails with large groups
5. Takeall shortcut in trade widnow does not work in middle section, breaks both
6. Fix how the loop runs in industry optimization(currently only one industry is processed)
7. Orth still runs out of food, how to fix without affecting all towns?
8. Verify if escorts work properly, like spencer and the dude from lintu.


## Ideas

1. New bandit types
2. Make extra caravans while playing
3. Make extra towns (succeeded adding static towns, but not generating them while playing)
4. Visual indicator if buy/sell price of a good is high/low in the current trade (partially done)
5. Add config.txt to enable/disable any feature