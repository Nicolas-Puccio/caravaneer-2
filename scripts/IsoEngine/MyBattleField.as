package IsoEngine
{
    //-new class
    public class MyBattleField extends BattleField
    {

        public function MyBattleField(param1:* = 800, param2:* = 600, param3:* = 100, param4:* = 100, param5:* = null, param6:* = 1, param7:* = true, param8:* = 1, param9:* = true, param10:* = 16777215, param11:* = 32, param12:* = 32, param13:* = 45, param14:* = 0.574)
        {
            super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
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
                    try
                    {
                        addCharacter(Groups[_loc25_][_loc15_], finalX, finalY, finalDir);
                    }
                    catch(e:Error)
                    {    
                        addMessage(2, "ERROR: DISABLE SPAWN CHARACTERS IN A ROW DURING COMBAT");
                        trace("dang it");
                    }    
                    ActList.push(Groups[_loc25_][_loc15_]);
                }
            }
            
            trace("5");
            ActList.sortOn("maxAP",18);
        }
    }
}

