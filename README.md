# Caravaneer 2 - Modded

This repository contains a modified version of [Caravaneer 2](https://store.steampowered.com/app/1500820/Caravaneer_2/)


## Changes

1. **Caravan Members Don't Die**: Caravan members are now immortal and won't die in combat. Mission companions can still die and missions can be failed, main character can still die as well.

2. **Post-Combat Health**: After combat, all caravan members start with at least 10% HP, ensuring good walking speed.

3. **Reduced Warpower**: Each caravan member now contributes less warpower, making your caravan more likely to be attacked, especially if equipped with cheap weapons.

4. **Auto Distribute Ammo & Attack**: Using this button will enable AI control of caravan members. You can only manually control your character.

5. **Increased Starting Stats**: Main character now has 80 stat points to distribute at the start, with each stat capped at 20 points.

6. **Extra UMi Alpha**: Start the game with a free UMi Alpha in the bunker storage, plus the storage got bigger to accomodate the vehicle.


## Installation

1. Download the `caravaneer2.swf` file from the repository. (current release not includes changes 5 and 6)
2. Replace the existing `caravaneer2.swf` file in the game's folder with the downloaded file.
3. Run the game as usual using the `.exe` file or through Steam.
4. Create a new character named Puccio (Only needed for changes 1, 2, and 3)


## Files Changed

1. battlemode ~line 261
2. caravan ~line 1266
3. caravanencountermenu ~line 72, and 97
4. charactersetupscreen ~line 93, 378, 392, 406, and 420
5. tradewindow ~line 96
6. Presets ~line 8268
7. GameData ~line 790


# Broken Files

These files will break the compilation if they are changed

1. BattleField (pathfinding will break)
2. MapMode (game will crash during desert travel)


# Things i was not able to change

1. Let mercenaries be controlled manually without changing the name, the BattleField file would not recompile if editted
2. Edit some game tick functions, like adding more mercenaries for hire to towns, editting MapMode crashes the game
