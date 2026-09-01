# Caravaneer 2 - Modded

This repository contains a modified version of [Caravaneer 2](https://store.steampowered.com/app/1500820/Caravaneer_2/), and a folder structure that allows for a quick BULK IMPORT using JPEXS, it is recommended to edit the code on a separate IDE like VS CODE rather than inside JPEXS



## Changes

1. **Caravan members don't die**: Caravan members are now immortal and won't die in combat. Mission companions can still die and missions can be failed, main character can die as well.

2. **Post-combat health**: After combat, all caravan members heal to at least 10% HP, ensuring good walking speed after fights.

3. **AI battles**: Can choose between fully automated battles, or only automate your mercenaries.

4. **Increased starting stats**: Main character now has 80 stat points to distribute during character creation, with each stat capped at 20 points.

5. **UMi alpha for sale**: Buy more UMI Alphas at Qubba's transport shop.

6. **Less entities during fights**: Slaves and transport are removed from the fight, to improve performance, and make the battles faster.

7. **More and better mercenaries available in towns**: Added +1 to the amount of mercenary in a town, mercenaries won't spawn with agi/str below 4.

8. **Smaller battle fields**: halved how much battle field size scales with weapon skill, and reduced min size when using melee weapons.

9. **Fix starving towns due to forage deficit**: Some towns did not expand forage industry properly which caused a deficit in food production and expensive food prices.

10. **Fix town industries not expanding**: towns need less unemployed people to start upgrading industries other than water.

11. **Fix chained industries**: Industries will produce if consumption is satisfied by another industry, regardless of storage space.

12. **Enabled Crowdfunder DLC**: DLC with weapon that shoots money ([Install Instructions](#Installation)).

13. **More industries available on towns**: Forage and breeding industries available to be started at all towns.

14. **CanBreakEconomy = true**: Base game only allows such option once the game is completed, set true by default.

15. **Create new towns**: Work in progress (press the RED BUTTON while on the map mode).

16. **Mod Menu**: Easily enable and disable features.

17. **Expand water industry**: Allows you to expand all natural resource industries.

18. **Infinite ammo**: Infinite ammo during combat.


### Quality of Life

- Trade Window
	- Right clic on side scrolls will quickly take all items.
	- Add display of water/food needed, considering water % from food.
	- Auto select amount of water/food required for travel.
	- Reduced size of item image to fit more items on the side scrolls.
	- Visual indicator of high sell price, can be set on [the prices file](#Instructions).
	- Displays item's ID for using in prices file and modding.
	- Displays partner's money.
	- Move undesired items to the bottom of the trade window.

- Industries UI
	- Add estimation of consumption expences, and profit.
	- "Your industries" tab displays unemployed requirement for town industries growth.

- Town UI
	- Displays town money.

- Navigation Screen
	- Auto invert when selecting GO.

- Silos and Kevin's house moved slightly off the main road.

- Animals spawn not too young and not too old.

- Disabled fullscreen (scaling is broken and looks ugly).

- Set walk speed to fast and center screen to disabled by default.

- Cheat start with a testing character, call it "PuccioTest".


## Installation

1. Download the files
   - Download `caravaneer2.swf` from the repository.
   - *(Optional)* Download `Crowdfunder.swf` to enable the DLC with a new weapon.

2. Replace or add the files
   - Replace the existing `caravaneer2.swf` in the game folder with the new one.
   - *(Optional)* Add `Crowdfunder.swf` in the same folder.

3. Enable the features you want in the new menu option.



## Instructions

Water/Food need is only updated when the navigation screen is opened, it won't automatically update if more members are recruited/dismissed.

In order to enable visual indicators need to create a "prices.txt" with the "ID-Price" format, example .txt in the files section above.
In order to put undesired items at the bottom of trade window need to add the IDs to the end of "prices.txt" file.



## Bugs

1. Game freeze for a few seconds if AI is unable to find a path to the target, when this happen the default behaviour is to flee.



## Work in progress

1. Industry QOL UI changes (expenses total).
2. finish mod menu. (less entities, more mercenaries, fix starving town, fix town industry not expanding, fix chained industries, more industries, expand water, see caravan cargo)
3. Spawn characters in straight line rather than grid, code fails with large groups.
4. Takeall shortcut in trade window does not work in middle section, breaks both.
5. Verify if escorts work properly, like spencer and the dude from lintu..
6. New caravan relationship seems not to be reseting when starting a new game, have to close game completely.


## Ideas

1. New bandit types.
2. Visual indicator if buy/sell price of a good is high/low in the current trade (partially done).



## Files with errors
BATTLEFIELD (enemy pathfinding breaks)


## Log
%appdata%\Macromedia\Flash Player\Logs