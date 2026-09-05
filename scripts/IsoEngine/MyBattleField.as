package IsoEngine
{
    //-new class
    public class MyBattleField extends BattleField
    {

        public function MyBattleField(scrW:* = 800, scrH:* = 600, gW:* = 100, gH:* = 100, setObstacles:* = null, setDifficulty:* = 1, setAutoCenter:* = false, setWalkAnimationSpeed:* = 2, setShowGrid:* = true, marksCol:* = 16777215, sW:* = 32, sH:* = 32, ang:* = 45, vC:* = 0.574)
        {
            super(scrW, scrH, gW, gH, setObstacles, setDifficulty, setAutoCenter, setWalkAnimationSpeed, setShowGrid, marksCol, sW, sH, ang, vC);
        }
        
        override public function addCharacter(char:Character, x:*, y:*, dir:*) : *
        {
            if(char.category != 4) {//-not spawn prisoners, i guess not needed anymore //+-
                super.addCharacter(char, x, y, dir);
            }

            return;
        }


        //-not consume ammo from cargo
        override public function useCurrentAmmo(char:*, amount:*) : *
        {
            if(GameData.currentGame.Config("infinite ammo"))
            {
                return;
            }
            super.useCurrentAmmo(char, amount);
        }


        //-not spawn transport
        override internal function placeTransport(theTransport:*,xPos:*,yPos:*):*
        {
            return;
        }


        override public function addGroup(group:*, groupType:* = 2, location:* = 0, vehicles:* = null, index:* = null) : *
        {
            var _loc25_:* = undefined;
            var _loc22_:* = undefined;
            var _loc15_:* = undefined;
            var _loc21_:* = undefined;
            var _loc32_:* = undefined;
            var _loc30_:* = undefined;
            var finalX:* = undefined;
            var finalY:* = undefined;
            var distanceFromCenter:* = undefined;
            var side:* = undefined;
            var edgePosition:* = undefined;
            var finalDir:* = undefined;
            trace("1");
            if(location is Number)
            {
                if(location == 0 || location == 2)
                {
                    _loc21_ = Math.round(gridWidth / 2 - group.People.length);
                }
                else
                {
                    _loc21_ = Math.round(gridHeight / 2 - group.People.length);
                }
            }
            trace("2");
            if(index == null)
            {
                _loc25_ = Groups.push([]) - 1;
            }
            else
            {
                if(!(Groups[index] is Array))
                {
                    Groups[index] = [];
                }
                _loc25_ = index;
            }
            trace("3");
            GroupCaravans[_loc25_] = group;
            GroupBands[_loc25_] = groupType;

            for(_loc22_ in group.People)
            {
                trace("4");
                _loc15_ = Groups[_loc25_].push(group.People[_loc22_]) - 1;
                if(group.People[_loc22_].category > 2 && group.People[_loc22_].category != 5)
                {
                    group.People[_loc22_].band = 3;
                }
                else
                {
                    group.People[_loc22_].band = groupType;
                }
                if(_loc25_ == 0)
                {
                    yourPeople = Number(yourPeople) + 1;
                }
                else if(group.People[_loc22_].band == 1)
                {
                    allies = Number(allies) + 1;
                }
                else if(group.People[_loc22_].band == 2)
                {
                    enemies = Number(enemies) + 1;
                }
                Groups[_loc25_][_loc15_].group = _loc25_;
                if(location is Number)
                {
                    if(location == 0)
                    {
                        _loc32_ = _loc21_ + _loc22_ * 2;
                        _loc30_ = 4;
                    }
                    if(location == 1)
                    {
                        _loc32_ = gridWidth - 5;
                        _loc30_ = _loc21_ + _loc22_ * 2;
                    }
                    if(location == 2)
                    {
                        _loc32_ = _loc21_ + _loc22_ * 2;
                        _loc30_ = gridHeight - 5;
                    }
                    if(location == 3)
                    {
                        _loc32_ = 4;
                        _loc30_ = _loc21_ + _loc22_ * 2;
                    }
                }
                else
                {
                    _loc32_ = Math.round(location.x);
                    _loc30_ = Math.round(location.y);
                }
                distanceFromCenter = 1;
                edgePosition = 0;
                side = 0;
                finalX = _loc32_;
                finalY = _loc30_;
                var tryToSpawnInRow:* = GameData.currentGame.Config("spawn characters in a row during combat")
                while(surroundingsBlocked(finalX,finalY))
                {
                    if(side == 0)
                    {
                        finalX = _loc32_ + edgePosition;
                        finalY = _loc30_ - distanceFromCenter;
                    }
                    if(side == 1)
                    {
                        finalX = _loc32_ + distanceFromCenter;
                        finalY = _loc30_ + edgePosition;
                    }
                    if(side == 2)
                    {
                        finalX = _loc32_ - edgePosition;
                        finalY = _loc30_ + distanceFromCenter;
                    }
                    if(side == 3)
                    {
                        finalX = _loc32_ - distanceFromCenter;
                        finalY = _loc30_ - edgePosition;
                    }

                    if(tryToSpawnInRow)//-lazy way to do this
                    {
                        if(_loc32_ < 10 || _loc32_ > gridHeight - 10)//-10 so it only affects if near edge, kinda breaks otherwise
                        {
                            finalX = _loc32_ <= 1 ? 1 : _loc32_ - 1;
                        }
                        if(_loc30_ < 10 || _loc30_ > gridHeight - 10)
                        {
                            finalY = _loc30_ <= 1 ? 1 : _loc30_ - 1;
                        }
                    }


                    edgePosition++;
                    if(edgePosition > distanceFromCenter)
                    {
                        side++;
                        if(side > 3)
                        {
                            distanceFromCenter++;
                            if(distanceFromCenter >= gridWidth && distanceFromCenter >= gridHeight)
                            {
                                tryToSpawnInRow = false;
                                distanceFromCenter = 1;
                                edgePosition = 0;
                                finalX = _loc32_;
                                finalY = _loc30_;
                            }
                            side = 0;
                        }
                        edgePosition = 0 - distanceFromCenter + 1;
                    }
                }
                var _loc7_:* = finalX - gridWidth / 2;
                var _loc9_:* = finalY - gridHeight / 2;
                if(Math.abs(_loc7_) > Math.abs(_loc9_))
                {
                    finalDir = _loc7_ > 0 ? 3 : 1;
                }
                else
                {
                    finalDir = _loc9_ > 0 ? 0 : 2
                }

                //-do not spawn prisoners
                if(Groups[_loc25_][_loc15_].category != 4)
                {
                    trace("addCharacter | group: " + Groups[_loc25_][_loc15_] +    " | finalX: " + finalX +    " | finalY: " + finalY +    " | finalDir: " + finalDir);
                    addCharacter(Groups[_loc25_][_loc15_], finalX, finalY, finalDir);
                    ActList.push(Groups[_loc25_][_loc15_]);

                    /*if(Groups[_loc25_][_loc15_] == GameData.currentGame.Caravans[0].People[0])
                    {
                        centerViewOn(finalX,finalY,false);
                        //-overided by Init's call, maybe i can override centerViewOn and disable the call if "true"
                    }*/
                }
            }
            
            trace("5");
            ActList.sortOn("maxAP",18);
        }

        //+- must add mod config
        override public function nextTurn() : *
        {
            if(!GameData.currentGame.Config("optimize battle AI"))
            {
                super.nextTurn();
                return;
            }
            trace("optimization called");

            var _loc17_:* = undefined;
            var _loc16_:* = undefined;
            var _loc12_:* = undefined;
            var _loc13_:* = undefined;
            var _loc23_:* = undefined;
            var _loc11_:* = undefined;
            var _loc7_:* = undefined;
            var _loc2_:* = undefined;
            var _loc22_:* = undefined;
            var _loc3_:* = undefined;
            var _loc5_:* = undefined;
            var _loc10_:* = undefined;
            var _loc1_:* = undefined;
            var _loc15_:* = undefined;
            var _loc8_:* = undefined;
            var _loc9_:* = undefined;
            var _loc14_:Boolean = false;
            var _loc25_:* = 0;
            var _loc18_:* = 0;
            centerOnEnemyIndex = 0;

            if(nowActing >= 0 && !ActList[nowActing].dead)
            {
                if(ActList[nowActing].burning >= 0.2) //+-should test if burning works
                {
                    Hit(ActList[nowActing],Math.round(ActList[nowActing].burning * 3 * (1 - ActList[nowActing].fireResistance / 100)),null,null,false,3);
                    ActList[nowActing].battleMorale -= ActList[nowActing].burning * 10;
                    ActList[nowActing].burning *= 0.8;
                    if(ActList[nowActing].burning < 0.2)
                    {
                        ActList[nowActing].burning = 0;
                    }
                    if(ActList[nowActing].burning <= 0 && ActList[nowActing].flameSoundChannel)
                    {
                        ActList[nowActing].flameSoundChannel.stop();
                    }
                }
                if(ActList[nowActing].bleeding >= 0.5 && ActList[nowActing].HP > 0) //+-should test if bleeding works
                {
                    Hit(ActList[nowActing],Math.round(ActList[nowActing].bleeding),null,null,false,2);
                    ActList[nowActing].battleMorale -= ActList[nowActing].bleeding * 0.3;
                    ActList[nowActing].bleeding *= 0.99;
                }
            }
            for(_loc16_ in ActList)
            {
                if(!ActList[_loc16_].dead && ActList[_loc16_].battleMorale > 8 && ActList[_loc16_].maxAP > 0)
                {
                    if(ActList[_loc16_].band == 1)
                    {
                        _loc25_++;
                    }
                    if(ActList[_loc16_].band == 2)
                    {
                        _loc18_++;
                    }
                }
                if(!ActList[_loc16_].dead && ActList[_loc16_].HP > 0 && ActList[_loc16_].band == 2)
                {
                    _loc14_ = true;
                }
            }
            if(_loc25_ == 0)
            {
                trace("loses because allies=0");
                loseTheGame();
                return;
            }
            if(_loc18_ == 0 && _loc14_ && GroupCaravans[0].People[0].HP > 0)
            {
                trace("*************** ALL ENEMIES HAVE PANICKED");
                onAllPanicked();
            }
            prevSolX = prevSolY = undefined;
            var _loc24_:Boolean = false;
            while(true)
            {
                nowActing = Number(nowActing) + 1;
                if(nowActing >= ActList.length)
                {
                    nowActing = 0;
                    if(_loc24_)
                    {
                        break;
                    }
                    _loc24_ = true;
                    turnCounter = Number(turnCounter) + 1;
                }
                ActList[nowActing].controlled = ActList[nowActing].group == 0 && ActList[nowActing].battleMorale > 8 && ActList[nowActing].category < 3;
                if(ActList[nowActing] is Character && !ActList[nowActing].dead && ActList[nowActing].HP > 0 && ActList[nowActing].maxAP > 0 && (ActList[nowActing].maxAP >= ActList[nowActing].walkAP || ActList[nowActing].controlled))
                {
                    if(ActList[nowActing].battleMorale <= 8)
                    {
                        generateMessage(ActList[nowActing],"panic");
                    }
                    ActList[nowActing].AICue = [];
                    ActList[nowActing].AP = ActList[nowActing].maxAP;
                    phase = 0;
                    healingMode = false;
                    if(!ActList[nowActing].controlled)
                    {
                        ActList[nowActing].enemies = [];
                        ActList[nowActing].friends = [];
                        ActList[nowActing].onlyWalk = false;
                        if(!ActList[nowActing].currentWeaponIsUsable)
                        {
                            switchWeapon();
                            if(!ActList[nowActing].currentWeaponIsUsable)
                            {
                                dropWeapon();
                            }
                        }
                        for(_loc16_ in ActList)
                        {
                            if(!ActList[_loc16_].dead)
                            {
                                if(ActList[_loc16_].band != 3 && ActList[_loc16_].band != ActList[nowActing].band && ActList[_loc16_].battleMorale > 8)
                                {
                                    ActList[nowActing].enemies.push(ActList[_loc16_]);
                                }
                                if(_loc16_ != nowActing && ActList[_loc16_].band == ActList[nowActing].band)
                                {
                                    ActList[nowActing].friends.push(ActList[_loc16_]);
                                }
                            }
                        }
                        if(ActList[nowActing].enemies.length == 0)
                        {
                            for(_loc16_ in ActList)
                            {
                                if(!ActList[_loc16_].dead)
                                {
                                    if(ActList[_loc16_].band != 3 && ActList[_loc16_].band != ActList[nowActing].band)
                                    {
                                        ActList[nowActing].enemies.push(ActList[_loc16_]);
                                    }
                                }
                            }
                        }
                        if(ActList[nowActing].enemies.length == 0)
                        {
                            nextTurn();
                            return;
                        }
                        if(ActList[nowActing].battleMorale <= 8 || ActList[nowActing].band == 3)
                        {
                            ActList[nowActing].runningAway = true;
                            if(dangerScoreReduction(ActList[nowActing],{
                                "x":ActList[nowActing].squareX,
                                "y":ActList[nowActing].squareY
                            }) <= 30)
                            {
                                ActList[nowActing].AICue = [{"action":0}];
                                nextTurn();
                                return false;
                            }
                            ActList[nowActing].selectedSquare = null;
                            ActList[nowActing].maxScore = -100000000000000000000;
                            //-limit to 5 squares
                            ActList[nowActing].squaresToProcess = generatePossibleSquares(ActList[nowActing].squareX,ActList[nowActing].squareY,Math.min(5, Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP)));
                        }
                        else
                        {
                            ActList[nowActing].runningAway = false;
                            _loc12_ = [];
                            _loc16_ = 0;
                            while(_loc16_ < gridWidth)
                            {
                                _loc12_[_loc16_] = [];
                                _loc16_++;
                            }
                            switch(ActList[nowActing].currentWeaponType.category)
                            {
                                case 0:
                                case 1:
                                var _loc26_:* = 100000000000000000000;
                                var _loc6_:* = null;
                                var _loc19_:int = 0;
                                trace("enemy count: " + ActList[nowActing].enemies.length)
                                for(_loc16_ in ActList[nowActing].enemies)
                                {
                                    var enemy : * = ActList[nowActing].enemies[_loc16_]
                                    if(Math.abs(enemy.squareX - ActList[nowActing].squareX) + Math.abs(enemy.squareY - ActList[nowActing].squareY) == 1)
                                    {
                                        _loc6_ = enemy;
                                        ActList[nowActing].destX = ActList[nowActing].squareX;
                                        ActList[nowActing].destY = ActList[nowActing].squareY;
                                        ActList[nowActing].theVictim = enemy;
                                        break;
                                    }
                                    
                                    //- loop refactored, still don't know what was wrong before
                                    var directions : Array = [[0,-1],[1,0],[0,1],[-1,0]];//-i think no need but thought the structure was weird
                                    for(_loc17_ in directions)
                                    {
                                        var dirX:int = directions[_loc17_][0];
                                        var dirY:int = directions[_loc17_][1];

                                        _loc11_ = enemy.squareX + dirX;
                                        _loc13_ = enemy.squareY + dirY;

                                        if(_loc11_ < 0 || _loc11_ >= gridWidth || _loc13_ < 0 || _loc13_ >= gridHeight)
                                        {
                                            trace("enemy out of grid?");
                                            continue;
                                        }

                                        if(ASMap.Map[_loc11_][_loc13_] > 0)
                                        {
                                            trace("something in this grid?");
                                            continue;
                                        }

                                        _loc23_ = ASMap.findPath(ActList[nowActing].squareX,ActList[nowActing].squareY,_loc11_,_loc13_);

                                        if(_loc23_ is Array)
                                        {
                                            if(_loc23_.length < _loc26_)
                                            {
                                                _loc26_ = _loc23_.length;
                                                ActList[nowActing].destX = _loc11_;
                                                ActList[nowActing].destY = _loc13_;
                                                ActList[nowActing].theVictim = enemy;
                                            }
                                        }
                                    }
                                    //-
                                    
                                }
                                if(_loc6_ == null)
                                {
                                    trace("no loc6");
                                    if(_loc26_ * ActList[nowActing].walkAP <= ActList[nowActing].AP - ActList[nowActing].weaponModeAP())
                                    {
                                        trace("not only walk")
                                        ActList[nowActing].AICue = [{
                                            "action":1,
                                            "x":ActList[nowActing].destX,
                                            "y":ActList[nowActing].destY
                                        }];
                                        ActList[nowActing].remainingAP = ActList[nowActing].AP - _loc26_ * ActList[nowActing].walkAP;
                                    }
                                    else
                                    {
                                        ActList[nowActing].onlyWalk = true;
                                        trace("only walk");
                                        ActList[nowActing].squaresToProcess = generatePossibleSquares(ActList[nowActing].squareX,ActList[nowActing].squareY,Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP));
                                        ActList[nowActing].maxScore = -100000000000000000000;
                                        ActList[nowActing].remainingAP = 0;
                                    }
                                }
                                else
                                {
                                    trace("no aicue");
                                    ActList[nowActing].AICue = [];
                                    ActList[nowActing].remainingAP = ActList[nowActing].AP;
                                }
                                break;
                                case 2:
                                case 3:
                                case 4:
                                switch(_loc7_ = WeaponsData.detectWeaponSkill(ActList[nowActing].currentWeaponData))
                                {
                                    case "pistol":
                                    case "rifle":
                                    case "machinegun":
                                    case "smg":
                                    case "crossbow":
                                        ActList[nowActing].minimumRange = 0;
                                        ActList[nowActing].maximumRange = Math.round((10 + ActList[nowActing][_loc7_ + "Skill"] / 15) * ActList[nowActing].currentWeaponData.accuracy * (1 + ActList[nowActing].attachmentsEffects(ActList[nowActing].currSlot).accuracy) / 2.5);
                                        ActList[nowActing].optimalRange = Math.round((5 + ActList[nowActing][_loc7_ + "Skill"] / 30) * ActList[nowActing].currentWeaponData.accuracy * (1 + ActList[nowActing].attachmentsEffects(ActList[nowActing].currSlot).accuracy) / 2.5);
                                        break;
                                    case "shotgun":
                                        ActList[nowActing].minimumRange = 0;
                                        ActList[nowActing].maximumRange = Math.round(5 + ActList[nowActing][_loc7_ + "Skill"] / 5);
                                        ActList[nowActing].optimalRange = Math.round(3 + ActList[nowActing][_loc7_ + "Skill"] / 10);
                                        break;
                                    case "flamethrower":
                                        ActList[nowActing].minimumRange = 0;
                                        ActList[nowActing].maximumRange = ActList[nowActing].currentWeaponData.range;
                                        ActList[nowActing].optimalRange = Math.round(ActList[nowActing].currentWeaponData.range / 2);
                                        break;
                                    case "rocketLauncher":
                                        ActList[nowActing].minimumRange = 5;
                                        ActList[nowActing].maximumRange = Math.round((10 + ActList[nowActing][_loc7_ + "Skill"] / 15) * ActList[nowActing].currentWeaponData.accuracy / 2);
                                        ActList[nowActing].optimalRange = Math.round((5 + ActList[nowActing][_loc7_ + "Skill"] / 30) * ActList[nowActing].currentWeaponData.accuracy / 2);
                                }
                                //-limit squaresToProcess to max 5
                                //-ai optimization, no need to move if current position is good enough
                                var enemyIndex : * = undefined;
                                var enemiesInRange : * = 0; //not using it now
                                var lowestChance : * = 1; //not using it
                                var highestChance : * = 0;
                                for (enemyIndex in ActList[nowActing].enemies)
                                {
                                    var chance : * = calculateHitChance(ActList[nowActing], ActList[nowActing].enemies[enemyIndex])
                                    if(chance < lowestChance)
                                        lowestChance = chance;
                                    if(chance > highestChance)
                                        highestChance = chance;
                                    if(chance > 0.25)
                                        enemiesInRange++
                                }
                                var squaresToProcessLength : * = Math.min(5, Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP)) //-this is default capped to 5
                                if(highestChance > 0.5)
                                {
                                    squaresToProcessLength = Math.max(0, Math.min(5, Math.floor((1 - highestChance) * 10)));//steps down for every 10%
                                }

                                ActList[nowActing].squaresToProcess = generatePossibleSquares(ActList[nowActing].squareX,ActList[nowActing].squareY, squaresToProcessLength);
                                ActList[nowActing].maxScore = -100000000000000000000;
                                _loc22_ = 100000000000000000000;
                                var _loc20_:* = -100000000000000000000;
                                var _loc4_:Number = -100000000000000000000;
                                for(_loc16_ in ActList[nowActing].currentWeaponType.modes)
                                {
                                    if(ActList[nowActing].weaponModeAP(_loc16_) < _loc22_)
                                    {
                                        _loc22_ = ActList[nowActing].weaponModeAP(_loc16_);
                                        ActList[nowActing].minAPMode = _loc16_;
                                    }
                                    if(ActList[nowActing].currentWeaponType.modes[_loc16_].accuracy > _loc20_)
                                    {
                                        _loc20_ = ActList[nowActing].currentWeaponType.modes[_loc16_].accuracy;
                                        ActList[nowActing].maxAccuracyMode = _loc16_;
                                    }
                                    _loc2_ = 1;
                                    if(ActList[nowActing].currentWeaponType.modes[_loc16_].damageMultiplier > 0)
                                    {
                                        _loc2_ *= ActList[nowActing].currentWeaponType.modes[_loc16_].damageMultiplier;
                                    }
                                    if(ActList[nowActing].currentWeaponType.modes[_loc16_].burst > 1)
                                    {
                                        _loc2_ *= ActList[nowActing].currentWeaponType.modes[_loc16_].burst;
                                    }
                                    _loc2_ /= ActList[nowActing].weaponModeAP(_loc16_);
                                    _loc2_ *= ActList[nowActing].currentWeaponType.modes[_loc16_].accuracy;
                                    if(_loc2_ > _loc4_)
                                    {
                                        _loc4_ = _loc2_;
                                        ActList[nowActing].maxDamageMode = _loc16_;
                                    }
                                }
                                ActList[nowActing].availableAmmo = ActList[nowActing].currentAmmo.amount;
                                if(ActList[nowActing].availableAmmo <= 0 && ActList[nowActing].AP >= ActList[nowActing].currentWeaponReloadAP)
                                {
                                    reload();
                                }
                                ActList[nowActing].availableAP = ActList[nowActing].AP;
                                ActList[nowActing].walkToX = null;
                                ActList[nowActing].walkToY = null;
                                ActList[nowActing].dangerMap = [];
                                _loc16_ = 0;
                                while(_loc16_ < gridWidth)
                                {
                                    ActList[nowActing].dangerMap[_loc16_] = [];
                                    _loc16_++;
                                }
                                break;
                                case 5:
                                var _loc21_:Number = Math.round(ActList[nowActing].currentWeaponData.explosiveness * 5 / Math.min(squareWidth,squareHeight));
                                ActList[nowActing].minimumRange = _loc21_;
                                ActList[nowActing].maximumRange = ActList[nowActing].maxThrowDistance(initialGrenadeHeight,grenadeAngle);
                                ActList[nowActing].optimalRange = Math.round(ActList[nowActing].maximumRange / 2);
                                ActList[nowActing].maxScore = -100000000000000000000;
                                ActList[nowActing].walkToX = null;
                                ActList[nowActing].walkToY = null;
                                //-limit to 5
                                ActList[nowActing].squaresToProcess = generatePossibleSquares(ActList[nowActing].squareX,ActList[nowActing].squareY,Math.min(5, Math.floor((ActList[nowActing].maxAP - ActList[nowActing].weaponModeAP()) / ActList[nowActing].walkAP)));
                                ActList[nowActing].dangerMap = [];
                                _loc16_ = 0;
                                while(_loc16_ < gridWidth)
                                {
                                    ActList[nowActing].dangerMap[_loc16_] = [];
                                    _loc16_++;
                                }
                                for(_loc16_ in ActList)
                                {
                                    if(ActList[_loc16_].HP > 0)
                                    {
                                        if(ActList[nowActing].IFF(ActList[_loc16_]))
                                        {
                                            _loc8_ = -30;
                                        }
                                        if(ActList[nowActing].band != ActList[_loc16_].band && ActList[_loc16_].band != 3)
                                        {
                                            _loc8_ = 10;
                                        }
                                        _loc1_ = ActList[_loc16_].squareX - _loc21_;
                                        while(_loc1_ <= ActList[_loc16_].squareX + _loc21_)
                                        {
                                            _loc15_ = ActList[_loc16_].squareY - _loc21_;
                                            while(_loc15_ <= ActList[_loc16_].squareY + _loc21_)
                                            {
                                            if(_loc1_ >= 0 && _loc1_ < gridWidth && _loc15_ >= 0 && _loc15_ < gridHeight)
                                            {
                                                _loc5_ = MathFunctions.CalcDistance(_loc1_,_loc15_,ActList[_loc16_].squareX,ActList[_loc16_].squareY);
                                                if(_loc5_ <= _loc21_)
                                                {
                                                    _loc10_ = _loc8_ * (1 - _loc5_ / _loc21_);
                                                    if(ActList[nowActing].dangerMap[_loc1_][_loc15_] == undefined)
                                                    {
                                                        ActList[nowActing].dangerMap[_loc1_][_loc15_] = _loc10_;
                                                    }
                                                    else
                                                    {
                                                        var _loc27_:Number = _loc15_;
                                                        var _loc30_:Number = ActList[nowActing].dangerMap[_loc1_][_loc27_] + _loc10_;
                                                        ActList[nowActing].dangerMap[_loc1_][_loc27_] = _loc30_;
                                                    }
                                                }
                                            }
                                            _loc15_++;
                                            }
                                            _loc1_++;
                                        }
                                    }
                                }
                                ActList[nowActing].grenadeSpots = [];
                                _loc1_ = 0;
                                while(_loc1_ < gridWidth)
                                {
                                    _loc15_ = 0;
                                    while(_loc15_ < gridHeight)
                                    {
                                        if(ActList[nowActing].dangerMap[_loc1_][_loc15_] >= _loc21_)
                                        {
                                            ActList[nowActing].grenadeSpots.push({
                                            "x":_loc1_,
                                            "y":_loc15_,
                                            "score":ActList[nowActing].dangerMap[_loc1_][_loc15_]
                                            });
                                        }
                                        _loc15_++;
                                    }
                                    _loc1_++;
                                }
                                _loc9_ = -100000000000000000000;
                                _loc16_ = 0;
                                while(_loc16_ < ActList[nowActing].grenadeSpots.length)
                                {
                                    if(ActList[nowActing].grenadeSpots[_loc16_].score > _loc9_)
                                    {
                                        _loc9_ = ActList[nowActing].grenadeSpots[_loc16_].score;
                                    }
                                    _loc16_++;
                                }
                                _loc3_ = _loc9_ * 0.8;
                                _loc16_ = 0;
                                while(_loc16_ < ActList[nowActing].grenadeSpots.length)
                                {
                                    if(ActList[nowActing].grenadeSpots[_loc16_].score < _loc3_)
                                    {
                                        ActList[nowActing].grenadeSpots.splice(_loc16_,1);
                                        _loc16_--;
                                    }
                                    _loc16_++;
                                }
                                ActList[nowActing].grenadeSpots.sortOn("score",18);
                                ActList[nowActing].dangerMap = [];
                                _loc16_ = 0;
                                while(_loc16_ < gridWidth)
                                {
                                    ActList[nowActing].dangerMap[_loc16_] = [];
                                    _loc16_++;
                                }
                            }
                        }
                    }
                    updateInterface();
                    interfaceOnOff(false);
                    return;
                }
            }
            loseTheGame();
            return false;
        }
    }
}

