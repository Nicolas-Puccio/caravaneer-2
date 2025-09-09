# Caravaneer 2 - Modded

This repository contains a modified version of [Caravaneer 2](https://store.steampowered.com/app/1500820/Caravaneer_2/)


## Changes

1. **Caravan Members Don't Die**: Caravan members are now immortal and won't die in combat. Mission companions can still die and missions can be failed, main character can still die as well.

2. **Post-Combat Health**: After combat, all caravan members start with at least 10% HP, ensuring good walking speed.

3. **Reduced Warpower**: Each caravan member now contributes less warpower, making your caravan more likely to be attacked, especially if equipped with cheap weapons.

4. **Auto Distribute Ammo & Attack**: Using this button will enable AI control of caravan members. You can only manually control your character.

5. **Increased Starting Stats**: Main character now has 80 stat points to distribute at the start, with each stat capped at 20 points.

6. **Extra UMi Alpha**: Start the game with a free UMi Alpha in the bunker storage, plus the storage got bigger to accomodate the vehicle.

7. **Faster Walk Animation**: Walk animations during battle are twice as fast.

8. **More info on Trade Window**: Trade window also displays water/food needed.



## Installation

1. Download the `caravaneer2.swf` file from the repository.
2. Replace the existing `caravaneer2.swf` file in the game's folder with the downloaded file.
3. Run the game as usual using the `.exe` file or through Steam.
4. Create a new character named Puccio (Only needed for changes 1, 2, and 3)


## Files Changed

1. BattleMode		~line 232, and 261
2. Caravan		~line 1266
3. CaravanEncounterMenu	~line 72, and 97
4. CharacterSetupScreen	~line 93, 378, 392, 406, and 420
5. NavigationScreen	~line 788
6. TradeWindow		~line 96, and 525
7. Presets		~line 8268
8. GameData		~line 544, and 790
9. Images		819_TitleScreen.jpg


# Broken Files

These files will break the compilation if they are changed

1. BattleField (pathfinding will break)
2. MapMode (game will crash during desert travel)


# Things i was not able to change

1. Let mercenaries be controlled by the AI without changing the name, the BattleField file would not recompile if editted
2. Edit some game tick functions, like adding more mercenaries for hire to towns, editting MapMode crashes the game
3. reorganize trade window UI to have more items on screen, don't know how to
