# Caravaneer 2 - Modded

This repository contains a modified version of [Caravaneer 2](https://store.steampowered.com/app/1500820/Caravaneer_2/), and a folder structure that allows for a quick BULK IMPORT using JPEXS, it is recommended to edit the code on a separate IDE like VS CODE rather than inside JPEXS



## Changes

1. **Caravan members don't die**: Caravan members are now immortal and won't die in combat. Mission companions can still die and missions can be failed, main character can die as well.

2. **Post-combat health**: After combat, all caravan members heal to at least 10% HP, ensuring good walking speed after fights.

3. **AI battles**: Can choose between fully automated battles, or only automate your mercenaries.

4. **Increased starting stats**: Main character now has 80 stat points to distribute during character creation, with each stat capped at 20 points.

5. **Extra UMi alpha**: Start the game with a free UMi Alpha in the bunker storage, plus the storage got bigger to accomodate the vehicle.

6. **Less entities during fights**: Slaves and transport are removed from the fight, to improve performance, and make the battles faster.

7. **More mercenaries available in towns**: Added +1 to the amount of mercenary in a town, making it easier to find recruits in low population towns.

8. **Smaller battle fields**: halved how much battle field size scales with weapon skill, and reduced min size when using melee weapons.

9. **Fix starving towns due to forage deficit**: Some towns did not expand forage industry properly which caused a deficit in food production and expensive food prices.

10. **Fix town industries not expanding**: towns need less unemployed people to start upgrading industries other than water.

11. **Fix chained industries**: Industries will produce if consumption is satisfied by another industry, regardless of storage space.

12. **Enabled Crowdfunder DLC**: DLC with weapon that shoots money ([Install Instructions](#Installation)).

13. **More industries available on towns**: Forage and breeding industries available to be started at all towns.

14. **CanBreakEconomy = true**: Base game only allows such option once the game is completed, set true by default.



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
	- "Your industries" tab displayes unemployed requirement for town industries

- Navigation Screen
	- Auto invert when selecting GO.

- Silos and Kevin's house moved slightly off the main road.

- Animals spawn not too young and not too old

- Disabled fullscreen (scaling is broken and looks ugly)



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
   - new character is only needed for the extra UMI ALPHA to spawn in the bunker
   - Name it **Puccio** for change #1.



## Instructions

Water/Food need is only updated when the navigation screen is opened, it won't automatically update if more members are recruited/dismissed.
Trade window displays ID of items.

In order to enable visual indicators need to create a "puccio.txt" with the "ID-Price" format, example .txt in the files section above.
In order to put undesired items at the bottom of trade window need to add the IDs to the end of "puccio.txt" file



## Bugs

1. Game freeze for a few seconds if AI is unable to find a path to the target, when this happen the default behaviour is to flee.



## Work in progress

1. Industry QOL UI changes (expenses total)
2. Ability to improve water well (did wells get fixed with the food/forage update in v10?)
3. Spawn characters in straight line rather than grid, code fails with large groups
4. Takeall shortcut in trade widnow does not work in middle section, breaks both
5. Verify if escorts work properly, like spencer and the dude from lintu.
6. New caravan relationship seems not to be reseting when starting a new game, have to close game completely


## Ideas

1. New bandit types
2. Make extra towns (succeeded adding static towns, but not generating them while playing)
3. Visual indicator if buy/sell price of a good is high/low in the current trade (partially done)
4. Add config.txt to enable/disable any feature



## Files with errors
BATTLEFIELD (enemy pathfinding breaks)
