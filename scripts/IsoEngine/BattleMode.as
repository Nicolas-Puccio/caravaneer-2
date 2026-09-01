package IsoEngine
{
   import Data.Texts;
   import Interface.*;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.ui.Mouse;
   
   public class BattleMode extends Sprite
   {
      
      public var BF:*;
      
      public var BI:*;
      
      public var GD:*;
      
      private var askedWhenPanicked:* = false;
      
      private var lootArray:*;
      
      private var slaves:*;
      
      private var askedAtTurn:*;
      
      public var panicDialogue:*;
      
      public var slavesDialogue:*;
      
      public var battleOptions:*;
      
      private var lootingFromGroups:*;
      
      private var tradeWindow:*;
      
      internal var allyWarPower:* = 0;
      
      internal var enemyWarPower:* = 0;
      
      internal var previousInterfaceState:*;
      
      public function BattleMode(param1:*, param2:*, param3:*, param4:* = null, param5:* = null, param6:* = null)
      {
         var j:*;
         var k:*;
         var l:*;
         var i:*;
         var fieldHeight:*;
         var fieldWidth:*;
         var weaponData:*;
         var weaponType:*;
         var weaponSkillName:*;
         var hasAmmo:*;
         var compRange:*;
         var maxRange:*;
         var allGroups:*;
         var totalY:*;
         var middlePoint:*;
         var startSide:*;
         var side:*;
         var totalX:*;
         var shiftY:*;
         var sides:*;
         var varCo:*;
         var shiftX:*;
         var blackBG:*;
         var _GD:* = param1;
         var allies:* = param2;
         var opponents:* = param3;
         var neutral:* = param4;
         var settings:* = param5;
         var obstacles:* = param6;
         super();
         GD = _GD;
         maxRange = 0;
         if(settings == null)
         {
            settings = {};
         }
         allGroups = [];
         for(i in allies)
         {
            allGroups.push({
               "group":allies[i],
               "type":1
            });
            allyWarPower += allies[i].actualWarPower;
         }
         for(i in opponents)
         {
            allGroups.push({
               "group":opponents[i],
               "type":2
            });
            enemyWarPower += opponents[i].actualWarPower;
         }
         for(i in neutral)
         {
            allGroups.push({
               "group":neutral[i],
               "type":3
            });
         }
         for(i in allGroups)
         {
            for(j in allGroups[i].group.People)
            {
               if(allGroups[i].type == 1)
               {
                  allGroups[i].group.People[j].battleMorale = allGroups[i].group.People[j].morale * Math.pow(allyWarPower / enemyWarPower,0.3);
               }
               if(allGroups[i].type == 2)
               {
                  allGroups[i].group.People[j].battleMorale = allGroups[i].group.People[j].morale * Math.pow(enemyWarPower / allyWarPower,0.3);
               }
               if(allGroups[i].type == 3)
               {
                  allGroups[i].group.People[j].battleMorale = allGroups[i].group.People[j].morale;
               }
            }
         }
         if(settings.maxRange == undefined)
         {
            for(i in allGroups)
            {
               for(j in allGroups[i].group.People)
               {
                  for(k in allGroups[i].group.People[j].weapons)
                  {
                     if(allGroups[i].group.People[j].weapons[k] != null)
                     {
                        weaponData = WeaponsData.Weapons[allGroups[i].group.People[j].weapons[k]];
                        weaponType = WeaponsData.WeaponTypes[weaponData.type];
                        weaponSkillName = WeaponsData.detectWeaponSkill(weaponData);
                        if(weaponType.category == 2 || weaponType.category == 3 || weaponType.category == 4)
                        {
                           hasAmmo = false;
                           for(l in allGroups[i].group.People[j].equipment)
                           {
                              if(allGroups[i].group.People[j].equipment[l].itemData.type == weaponData.ammo)
                              {
                                 hasAmmo = true;
                                 break;
                              }
                           }
                        }
                        if(weaponType.category == 0 || weaponType.category == 1 || weaponType.category == 5 || hasAmmo)
                        {
                           switch(weaponType.category)
                           {
                              case 0:
                              case 1:
                                 compRange = 15;
                                 break;
                              case 2:
                                 switch(weaponType.subCategory)
                                 {
                                    case 1:
                                       compRange = 50;
                                       break;
                                    case 2:
                                       compRange = 80;
                                       break;
                                    case 3:
                                       compRange = 50;
                                       break;
                                    case 4:
                                       compRange = 40;
                                       break;
                                    case 5:
                                       compRange = 40;
                                 }
                                 break;
                              case 3:
                                 switch(weaponType.subCategory)
                                 {
                                    case 1:
                                       if(weaponData.type == 23)
                                       {
                                          compRange = 40;
                                       }
                                       else
                                       {
                                          compRange = 70;
                                       }
                                       break;
                                    case 2:
                                       compRange = 60;
                                 }
                                 break;
                              case 4:
                                 compRange = 30;
                                 break;
                              case 5:
                                 compRange = Math.round(allGroups[i].group.People[j].maxThrowDistance(1.8,3.141592653589793 / 4)) + 10;
                           }
                           if(weaponType.category == 2 || weaponType.category == 3 || weaponType.category == 4)//-ranged
                           {
                              //-reduces how much a weapon skill affects the battlefield size
                              var compRangeRatio:* = GD.Config("smaller battlefields") ? 400 : 200;
                              compRange = Math.round(compRange * 0.5 + compRange * allGroups[i].group.People[j][weaponSkillName + "Skill"] / compRangeRatio);
                           }
                           if(compRange > maxRange)
                           {
                              maxRange = compRange;
                           }
                        }
                     }
                  }
               }
            }
         }
         else
         {
            maxRange = settings.maxRange;
         }
         var fieldMinRange = GD.Config("smaller battlefields") ? 30 : 50;
         if(settings.fieldWidth == undefined)
         {
            //-slightly reduces minimum size
            fieldWidth = Math.max(maxRange, fieldMinRange);
         }
         else
         {
            fieldWidth = settings.fieldWidth;
         }
         if(settings.fieldHeight == undefined)
         {
            //-slightly reduces minimum size
            fieldHeight = Math.max(maxRange, fieldMinRange);
         }
         else
         {
            fieldHeight = settings.fieldHeight;
         }

         BF = new MyBattleField(640,445,fieldWidth,fieldHeight,obstacles,GD.difficulty,GD.autoCenter,GD.walkAnimationSpeed,GD.showGrid);
         BF.onWin = function():*
         {
            var _loc7_:* = undefined;
            var _loc8_:* = undefined;
            var _loc4_:* = undefined;
            var _loc5_:* = undefined;
            var _loc1_:* = undefined;
            var _loc6_:* = undefined;
            var _loc10_:* = undefined;
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            Mouse.show();
            for(_loc5_ in BF.cursors)
            {
               BF.cursors[_loc5_].visible = false;
            }
            slaves = [];
            if(enemyWarPower / allyWarPower > 1.5)
            {
               var _loc12_:int = 6;
               var _loc11_:* = GD.Story.specificReputations[_loc12_] + enemyWarPower / allyWarPower * 0.1;
               GD.Story.specificReputations[_loc12_] = _loc11_;
            }
            BF.paused = true;
            BF.interfaceOnOff(false);
            lootArray = [];
            var _loc9_:* = 0;
            for(_loc5_ in BF.ActList)
            {
               if(BF.ActList[_loc5_].flameSoundChannel)
               {
                  BF.ActList[_loc5_].flameSoundChannel.stop();
               }
               if(BF.ActList[_loc5_].dead || BF.ActList[_loc5_].health <= 0)
               {
                  if(BF.ActList[_loc5_].specialPurpose == 1)
                  {
                     GD.Story.accompanyedByThum = false;
                  }
                  if(BF.ActList[_loc5_].specialPurpose == 2)
                  {
                     GD.Story.loisIsDead = true;
                  }
                  if(BF.ActList[_loc5_].specialPurpose == 3)
                  {
                     GD.Story.spencerRiceIsDead = true;
                  }
                  if(BF.ActList[_loc5_].specialPurpose == 9)
                  {
                     GD.Story.eliahsManDead = true;
                  }
                  if(GD.Caravans[0].cannibal)
                  {
                     _loc9_ += BF.ActList[_loc5_].meatAmount;
                  }
                  if(BF.ActList[_loc5_].caravan.People[0] == GD.Caravans[0].People[0] && BF.ActList[_loc5_].specialPurpose == 0 && GD.Config("revive dead mercenaries"))
                  {
                     //-ress dead members
                     BF.ActList[_loc5_].HP = BF.ActList[_loc5_].maxHealth / 5;
                     BF.ActList[_loc5_].dead = false;
                  }
                  else
                  {
                     BF.ActList[_loc5_].caravan.removePerson(BF.ActList[_loc5_]);
                  }
                  if(BF.ActList[_loc5_] == GD.Caravans[0].People[0])
                  {
                     GD.setMode(6,2724);
                  }
               }
               else
               {
                  //-heal non dead members
                  if(BF.ActList[_loc5_].caravan.People[0] == GD.Caravans[0].People[0] && BF.ActList[_loc5_].HP < BF.ActList[_loc5_].maxHealth / 5 && GD.Config("heal after battle"))
                  {
                     BF.ActList[_loc5_].HP = BF.ActList[_loc5_].maxHealth / 5;
                  }
                  for(_loc7_ in BF.ActList[_loc5_].weapons)
                  {
                     BF.ActList[_loc5_].unloadWeapon(_loc7_);
                  }
               }
               BF.ActList[_loc5_].battleMorale = BF.ActList[_loc5_].morale;
               BF.ActList[_loc5_].bleeding = 0;
               BF.ActList[_loc5_].burning = 0;
               BF.ActList[_loc5_].bloodDrops = [];
               BF.ActList[_loc5_].randomPointer = null;
            }
            if(GD.Caravans[0].cannibal && _loc9_ > 0)
            {
               lootArray.push(new Item(174,_loc9_));
            }
            lootingFromGroups = [];
            for(_loc5_ in BF.GroupCaravans)
            {
               BF.GroupCaravans[_loc5_].randomPointer = null;
               _loc7_ = 0;
               while(_loc7_ < BF.GroupCaravans[_loc5_].Transport.length)
               {
                  BF.GroupCaravans[_loc5_].Transport[_loc7_].randomPointer = null;
                  _loc7_++;
               }
               if(BF.GroupBands[_loc5_] == 2)
               {
                  lootingFromGroups.push(BF.GroupCaravans[_loc5_]);
                  _loc7_ = 0;
                  while(_loc7_ < BF.GroupCaravans[_loc5_].People.length)
                  {
                     BF.GroupCaravans[_loc5_].People[_loc7_].morale = Math.round(BF.GroupCaravans[_loc5_].People[_loc7_].morale * 0.6);
                     BF.GroupCaravans[_loc5_].People[_loc7_].battleMorale = BF.GroupCaravans[_loc5_].People[_loc7_].morale;
                     BF.GroupCaravans[_loc5_].People[_loc7_].weapons = [0,0];
                     BF.GroupCaravans[_loc5_].People[_loc7_].attachments = [[],[]];
                     BF.GroupCaravans[_loc5_].People[_loc7_].loadedAmmo = [null,null];
                     BF.GroupCaravans[_loc5_].People[_loc7_].grenadeAmounts = [0,0];
                     BF.GroupCaravans[_loc5_].People[_loc7_].Jacket = 0;
                     BF.GroupCaravans[_loc5_].People[_loc7_].Headgear = 0;
                     BF.GroupCaravans[_loc5_].People[_loc7_].equipment = [];
                     BF.GroupCaravans[_loc5_].People[_loc7_].passengerIn = null;
                     if(BF.GroupCaravans[_loc5_].People[_loc7_].health > 0)
                     {
                        if(BF.GroupCaravans[_loc5_].People[_loc7_].specialPurpose == 20)
                        {
                           BF.GroupCaravans[_loc5_].People[_loc7_].category = 10;
                           GD.Caravans[0].addPerson(BF.GroupCaravans[_loc5_].People[_loc7_]);
                           BF.GroupCaravans[_loc5_].removePerson(BF.GroupCaravans[_loc5_].People[_loc7_]);
                           _loc7_--;
                        }
                        else if(BF.GroupCaravans[_loc5_].People[_loc7_].category == 4)
                        {
                           BF.GroupCaravans[_loc5_].People[_loc7_].faction = BF.GroupCaravans[_loc5_].faction;
                           slaves.push(BF.GroupCaravans[_loc5_].People[_loc7_]);
                           BF.GroupCaravans[_loc5_].removePerson(BF.GroupCaravans[_loc5_].People[_loc7_]);
                           _loc7_--;
                        }
                     }
                     _loc7_++;
                  }
                  for(_loc7_ in BF.GroupCaravans[_loc5_].Cargo)
                  {
                     lootArray.push(new Item(BF.GroupCaravans[_loc5_].Cargo[_loc7_].type,BF.GroupCaravans[_loc5_].Cargo[_loc7_].amount));
                     lootArray[lootArray.length - 1].originallyBelongedTo = BF.GroupCaravans[_loc5_];
                  }
                  _loc7_ = 0;
                  while(_loc7_ < BF.GroupCaravans[_loc5_].Transport.length)
                  {
                     if(BF.GroupCaravans[_loc5_].Transport[_loc7_].health > 0)
                     {
                        BF.GroupCaravans[_loc5_].Transport[_loc7_].cart = null;
                        BF.GroupCaravans[_loc5_].Transport[_loc7_].attachedTo = null;
                        BF.GroupCaravans[_loc5_].Transport[_loc7_].passengerIn = null;
                        BF.GroupCaravans[_loc5_].Transport[_loc7_].Passengers = [];
                        lootArray.push(BF.GroupCaravans[_loc5_].Transport[_loc7_]);
                        lootArray[lootArray.length - 1].originallyBelongedTo = BF.GroupCaravans[_loc5_];
                        BF.GroupCaravans[_loc5_].removeTransport(BF.GroupCaravans[_loc5_].Transport[_loc7_]);
                        _loc7_--;
                     }
                     _loc7_++;
                  }
                  BF.GroupCaravans[_loc5_].Cargo = [];
                  if(BF.GroupCaravans[_loc5_].money > 0)
                  {
                     lootArray.push(new Item(97,BF.GroupCaravans[_loc5_].money));
                     BF.GroupCaravans[_loc5_].money = 0;
                     lootArray[lootArray.length - 1].originallyBelongedTo = BF.GroupCaravans[_loc5_];
                  }
                  GD.mapMode.storyOnDestroyed(BF.GroupCaravans[_loc5_]);
                  BF.GroupCaravans[_loc5_].aggressive = false;
                  BF.GroupCaravans[_loc5_].specialPurpose = undefined;
                  if(BF.GroupCaravans[_loc5_].People.length > 0)
                  {
                     GD.directCaravanToNearestTown(BF.GroupCaravans[_loc5_]);
                  }
                  BF.GroupCaravans[_loc5_].category = 2;
               }
               if(BF.GroupBands[_loc5_] == 1)
               {
                  _loc7_ = 0;
                  while(_loc7_ < BF.GroupCaravans[_loc5_].People.length)
                  {
                     BF.GroupCaravans[_loc5_].People[_loc7_].morale += Math.round((100 - BF.GroupCaravans[_loc5_].People[_loc7_].morale) * 0.05 * enemyWarPower / allyWarPower);
                     BF.GroupCaravans[_loc5_].People[_loc7_].battleMorale = 50;
                     _loc7_++;
                  }
               }
               _loc7_ = 0;
               while(_loc7_ < BF.GroupCaravans[_loc5_].Transport.length)
               {
                  if(BF.GroupCaravans[_loc5_].Transport[_loc7_].health <= 0)
                  {
                     if(BF.GroupCaravans[_loc5_].Transport[_loc7_].category == 1)
                     {
                        _loc4_ = false;
                        for(_loc8_ in lootArray)
                        {
                           if(lootArray[_loc8_].type == BF.GroupCaravans[_loc5_].Transport[_loc7_].meat)
                           {
                              lootArray[_loc8_].amount += BF.GroupCaravans[_loc5_].Transport[_loc7_].meatAmount;
                              _loc4_ = true;
                              break;
                           }
                        }
                        if(!_loc4_)
                        {
                           lootArray.push(new Item(BF.GroupCaravans[_loc5_].Transport[_loc7_].meat,BF.GroupCaravans[_loc5_].Transport[_loc7_].meatAmount));
                        }
                     }
                     BF.GroupCaravans[_loc5_].removeTransport(BF.GroupCaravans[_loc5_].Transport[_loc7_]);
                     _loc7_--;
                  }
                  _loc7_++;
               }
               if(BF.GroupCaravans[_loc5_].People.length == 0)
               {
                  BF.GroupCaravans[_loc5_].active = false;
                  if(BF.GroupCaravans[_loc5_] == GD.Caravans[0])
                  {
                     GD.setMode(6,2724);
                  }
                  GD.mapMode.destroyCaravan(BF.GroupCaravans[_loc5_]);
               }
            }
            _loc2_ = 0;
            while(_loc2_ < BF.gridWidth)
            {
               _loc1_ = 0;
               while(_loc1_ < BF.gridHeight)
               {
                  if(BF.DroppedWeapons[_loc2_][_loc1_] is Array)
                  {
                     for(_loc5_ in BF.DroppedWeapons[_loc2_][_loc1_])
                     {
                        _loc6_ = BF.DroppedWeapons[_loc2_][_loc1_][_loc5_];
                        _loc10_ = Item.itemNumFromCatSubCat(2,_loc6_.type);
                        lootArray.push(new Item(_loc10_,1));
                        if(WeaponsData.WeaponTypes[WeaponsData.Weapons[_loc6_.type].type].category != 5)
                        {
                           if(_loc6_.ammoType > 0 && _loc6_.ammoAmount > 0)
                           {
                              _loc10_ = _loc6_.ammoType;
                              lootArray.push(new Item(_loc10_,_loc6_.ammoAmount));
                           }
                        }
                        for(_loc7_ in _loc6_.attachments)
                        {
                           if(_loc6_.attachments[_loc7_] > 0)
                           {
                              _loc10_ = Item.itemNumFromCatSubCat(4,_loc6_.attachments[_loc7_]);
                              lootArray.push(new Item(_loc10_,1));
                           }
                        }
                     }
                  }
                  _loc1_++;
               }
               _loc2_++;
            }
            for(_loc5_ in BF.DroppedBolts)
            {
               lootArray.push(new Item(BF.DroppedBolts[_loc5_].type,BF.DroppedBolts[_loc5_].amount));
            }
            _loc5_ = 0;
            while(_loc5_ < lootArray.length)
            {
               _loc7_ = _loc5_ + 1;
               while(_loc7_ < lootArray.length)
               {
                  if(lootArray[_loc5_] is Item && lootArray[_loc7_] is Item && lootArray[_loc5_].type == lootArray[_loc7_].type)
                  {
                     lootArray[_loc5_].amount += lootArray[_loc7_].amount;
                     lootArray.splice(_loc7_,1);
                     _loc7_--;
                  }
                  _loc7_++;
               }
               _loc5_++;
            }
            if(slaves.length > 0)
            {
               slavesDialogue = {};
               slavesDialogue.disp = new Sprite();
               slavesDialogue.BG = new Sprite();
               slavesDialogue.BG.graphics.beginFill(0,0.5);
               slavesDialogue.BG.graphics.drawRect(0,0,BF.screenWidth,BF.screenHeight);
               slavesDialogue.disp.addChild(slavesDialogue.BG);
               _loc3_ = Texts.fetch(1391).replace("@number@",slaves.length).toUpperCase();
               if(GD.Story.specificReputations[7] <= 0)
               {
                  _loc3_ += "\n\n" + Texts.fetch(3772).toUpperCase();
               }
               slavesDialogue.txt = new EngineText(_loc3_,8947848,14,"center",20,20,200,495,true,true);
               slavesDialogue.txt.height = slavesDialogue.textHeight + 10;
               slavesDialogue.D = new Dialogue(240,slavesDialogue.txt.textHeight + 140);
               slavesDialogue.D.x = BF.x + BF.screenWidth / 2 - slavesDialogue.D.dialogueWidth / 2;
               slavesDialogue.D.y = BF.x + BF.screenHeight / 2 - slavesDialogue.D.dialogueHeight / 2;
               slavesDialogue.disp.addChild(slavesDialogue.D);
               slavesDialogue.D.addToMask(slavesDialogue.txt);
               slavesDialogue.butt1 = new Button(2,enslave,Texts.fetch(1392).toUpperCase());
               slavesDialogue.butt1.x = 17;
               slavesDialogue.butt1.y = slavesDialogue.txt.textHeight + 37;
               slavesDialogue.D.addChild(slavesDialogue.butt1);
               slavesDialogue.butt2 = new Button(2,leave,Texts.fetch(1393).toUpperCase());
               slavesDialogue.butt2.x = 17;
               slavesDialogue.butt2.y = slavesDialogue.txt.textHeight + 67;
               slavesDialogue.D.addChild(slavesDialogue.butt2);
               slavesDialogue.butt3 = new Button(2,escort,Texts.fetch(1394).toUpperCase());
               slavesDialogue.butt3.x = 17;
               slavesDialogue.butt3.y = slavesDialogue.txt.textHeight + 97;
               slavesDialogue.D.addChild(slavesDialogue.butt3);
               addChild(slavesDialogue.disp);
            }
            else
            {
               loot();
            }
         };
         BF.onLose = function():*
         {
            trace("********************************* G A M E   O V E R *******************************************");
            GD.setMode(6,2724);
         };
         BF.onAllPanicked = function():*
         {
            var _loc1_:* = undefined;
            if(!askedWhenPanicked || askedAtTurn != undefined && BF.turnCounter - askedAtTurn >= 5)
            {
               askedAtTurn = BF.turnCounter;
               BF.paused = true;
               BF.interfaceOnOff(false);
               panicDialogue = {};
               panicDialogue.disp = new Sprite();
               panicDialogue.BG = new Sprite();
               panicDialogue.BG.graphics.beginFill(0,0.5);
               panicDialogue.BG.graphics.drawRect(0,0,BF.screenWidth,BF.screenHeight);
               panicDialogue.disp.addChild(panicDialogue.BG);
               panicDialogue.txt = new EngineText(Texts.fetch(1387).toUpperCase(),8947848,14,"center",20,20,200,495,true,true);
               panicDialogue.txt.height = panicDialogue.textHeight + 10;
               panicDialogue.D = new Dialogue(240,panicDialogue.txt.textHeight + 140);
               panicDialogue.D.x = BF.x + BF.screenWidth / 2 - panicDialogue.D.dialogueWidth / 2;
               panicDialogue.D.y = BF.x + BF.screenHeight / 2 - panicDialogue.D.dialogueHeight / 2;
               panicDialogue.disp.addChild(panicDialogue.D);
               panicDialogue.D.addToMask(panicDialogue.txt);
               panicDialogue.butt1 = new Button(2,imprison,Texts.fetch(1388).toUpperCase());
               panicDialogue.butt1.x = 17;
               panicDialogue.butt1.y = panicDialogue.txt.textHeight + 37;
               panicDialogue.D.addChild(panicDialogue.butt1);
               panicDialogue.butt2 = new Button(2,letGo,Texts.fetch(1389).toUpperCase());
               panicDialogue.butt2.x = 17;
               panicDialogue.butt2.y = panicDialogue.txt.textHeight + 67;
               panicDialogue.D.addChild(panicDialogue.butt2);
               panicDialogue.butt3 = new Button(2,keepKilling,Texts.fetch(1390).toUpperCase());
               panicDialogue.butt3.x = 17;
               panicDialogue.butt3.y = panicDialogue.txt.textHeight + 97;
               panicDialogue.D.addChild(panicDialogue.butt3);
               addChild(panicDialogue.disp);
               askedWhenPanicked = true;
               Mouse.show();
               for(_loc1_ in BF.cursors)
               {
                  BF.cursors[_loc1_].visible = false;
               }
            }
         };
         totalX = 0;
         totalY = 0;
         for(i in allGroups)
         {
            totalX += allGroups[i].group.x;
            totalY += allGroups[i].group.y;
         }
         middlePoint = {
            "x":totalX / allGroups.length,
            "y":totalY / allGroups.length
         };
         sides = [];
         i = 0;
         while(i <= 3)
         {
            sides[i] = [];
            i++;
         }
         i = 0;
         while(i <= 3)
         {
            sides[i] = 0;
            i++;
         }
         for(i in allGroups)
         {
            if(settings.groupLocations is Array && settings.groupLocations[i] is Object)
            {
               allGroups[i].location = {
                  "x":settings.groupLocations[i].x,
                  "y":settings.groupLocations[i].y
               };
            }
            else
            {
               shiftX = allGroups[i].group.x - middlePoint.x;
               shiftY = allGroups[i].group.y - middlePoint.y;
               if(Math.abs(shiftX) > Math.abs(shiftY))
               {
                  if(shiftX > 0)
                  {
                     side = 1;
                  }
                  else
                  {
                     side = 3;
                  }
               }
               else if(shiftY > 0)
               {
                  side = 2;
               }
               else
               {
                  side = 0;
               }
               allGroups[i].side = side;
               allGroups[i].sideIndex = sides[i];
               sides[i]++;
            }
         }
         for(i in allGroups)
         {
            var copyGroup = allGroups[i]//-bad name

            if(copyGroup.side != undefined)
            {
               switch(copyGroup.side)
               {
                  case 0:
                     BF.addGroup(copyGroup.group,copyGroup.type,{
                        "x":Math.round(fieldWidth / sides[i] * (copyGroup.sideIndex + 0.5)),
                        "y":Math.round(Math.max(fieldHeight / 2 - maxRange / 2,0))
                     });
                     break;
                  case 1:
                     BF.addGroup(copyGroup.group,copyGroup.type,{
                        "x":Math.min(fieldWidth / 2 + maxRange / 2 - 1,fieldWidth - 1),
                        "y":Math.round(fieldHeight / sides[i] * (copyGroup.sideIndex + 0.5))
                     });
                     break;
                  case 2:
                     BF.addGroup(copyGroup.group,copyGroup.type,{
                        "x":Math.round(fieldWidth / sides[i] * (copyGroup.sideIndex + 0.5)),
                        "y":Math.round(Math.min(fieldHeight / 2 + maxRange / 2 - 1,fieldHeight - 1))
                     });
                     break;
                  case 3:
                     BF.addGroup(copyGroup.group,copyGroup.type,{
                        "x":Math.round(Math.max(fieldWidth / 2 - maxRange / 2,0)),
                        "y":Math.round(fieldHeight / sides[i] * (copyGroup.sideIndex + 0.5))
                     });
               }
            }
            if(copyGroup.location != undefined)
            {
               BF.addGroup(copyGroup.group,copyGroup.type,{
                  "x":Math.max(1,Math.min(copyGroup.location.x,fieldWidth - 2)),
                  "y":Math.max(1,Math.min(copyGroup.location.y,fieldWidth - 2))
               });
            }
         }
         BI = new BattleInterface(BF);
         BI.turnOnOff(false);
         BF.onMessage = BI.addMessage;
         BI.onClickPortrait = function():*
         {
            BF.centerViewOn(BF.ActList[BF.nowActing].x,BF.ActList[BF.nowActing].y);
         };
         BF.onInterfaceUpdate = function(param1:*):*
         {
            var xx:*;
            var yy:*;
            var startX:*;
            var startY:*;
            var i:*;
            var dotsToDisplay:*;
            var lastHPBar:*;
            var lastMoraleBar:*;
            var data:* = param1;
            if(data.playersTurn)
            {
               BI.reloadAP = data.reloadAP;
               BI.weaponDescription = data.weaponDescription;
               BI.Name.text = data.name.toUpperCase();
               BI.WeaponName.text = data.weaponName.toUpperCase();
               BI.WeaponType.text = Texts.fetch(WeaponsData.WeaponTypes[data.weaponType].name).toUpperCase();
               BI.LoadedAmmoAmount.setCounter(data.loadedAmmoAmount);
               if(BI.portraitImage is Bitmap)
               {
                  BI.portraitHolder.removeChild(BI.portraitImage);
               }
               BI.portraitImage = data.portrait;
               BI.portraitHolder.addChild(BI.portraitImage);
               if(BI.weaponIconImage is Bitmap)
               {
                  BI.weaponIconHolder.removeChild(BI.weaponIconImage);
               }
               BI.weaponIconImage = WeaponsData.getWeaponIcon(data.weaponInd);
               BI.weaponIconImage.x = 3.75;
               BI.weaponIconImage.y = 3.75;
               BI.weaponIconImage.scaleX = 0.25;
               BI.weaponIconImage.scaleY = 0.25;
               BI.weaponIconHolder.addChild(BI.weaponIconImage);
               if(data.hasLoadedAmmo)
               {
                  BI.weaponIconAmmo.visible = true;
                  BI.weaponIconAmmo.bitmapData = new BitmapData(70,70,true,0);
                  dotsToDisplay = Math.min(data.loadedAmmoAmount,165);
                  i = 0;
                  while(i < dotsToDisplay)
                  {
                     startX = 5 + i % 15 * 4;
                     startY = 5 + Math.floor(i / 15) * 4;
                     xx = startX;
                     while(xx <= startX + 1)
                     {
                        yy = startY;
                        while(yy <= startY + 1)
                        {
                           BI.weaponIconAmmo.bitmapData.setPixel32(xx,yy,4291413247);
                           yy++;
                        }
                        xx++;
                     }
                     i++;
                  }
                  if(dotsToDisplay < data.loadedAmmoAmount)
                  {
                     xx = 5;
                     while(xx <= 14)
                     {
                        yy = 57;
                        while(yy <= 58)
                        {
                           BI.weaponIconAmmo.bitmapData.setPixel32(xx,yy,4291413247);
                           yy++;
                        }
                        xx++;
                     }
                     yy = 53;
                     while(yy <= 62)
                     {
                        xx = 9;
                        while(xx <= 10)
                        {
                           BI.weaponIconAmmo.bitmapData.setPixel32(xx,yy,4291413247);
                           xx++;
                        }
                        yy++;
                     }
                  }
               }
               else
               {
                  BI.weaponIconAmmo.visible = false;
               }
               BI.weaponIconAimedShot.visible = data.aimedShot;
               BI.weaponIconHeadShot.visible = data.headShot;
               BI.weaponIconBurstText.visible = BI.weaponIconBurstSymbol.visible = data.burst > 1;
               if(BI.weaponIconBurstText.visible)
               {
                  BI.weaponIconBurstText.text = data.burst;
               }
               BI.weaponIconParallelShots.visible = data.parallelShots > 1;
               BI.weaponIconScope.visible = data.hasScope;
               BI.weaponIconLaser.visible = data.hasLaser;
               if(data.hasScope)
               {
                  BI.weaponIconLaser.x = 675;
               }
               else
               {
                  BI.weaponIconLaser.x = 655;
               }
               if(data.loadedAmmoName.length > 0)
               {
                  BI.LoadedAmmoName.text = data.loadedAmmoName.toUpperCase();
               }
               else
               {
                  BI.LoadedAmmoName.text = Texts.fetch(193);
               }
               BI.WeaponModeName.text = data.weaponModeName.toUpperCase() + " (" + data.weaponModeAP + " " + Texts.fetch(1095).toUpperCase() + ")";
               if(data.selectedAmmoName.length > 0)
               {
                  BI.ReloadAmmoName.text = data.selectedAmmoName.toUpperCase();
               }
               else
               {
                  BI.ReloadAmmoName.text = Texts.fetch(193);
               }
               BI.ReloadAmmoAmount.setCounter(data.selectedAmmoAmount);
               if(data.hasFirstAid)
               {
                  BI.FirstAidName.text = data.firstAidName.toUpperCase();
                  BI.firstAidText.text = Texts.fetch(211,1,8).toUpperCase();
                  BI.healAP = data.healAP;
               }
               else
               {
                  BI.FirstAidName.text = Texts.fetch(193);
                  BI.firstAidText.text = Texts.fetch(193);
                  BI.healAP = null;
               }
               BI.FirstAidAmount.setCounter(data.firstAidAmount);
               if(data.pickUpWeaponName.length > 0)
               {
                  BI.PickUpItem.text = data.pickUpWeaponName.toUpperCase();
                  BI.pickUpText.text = Texts.fetch(196,1,8).toUpperCase();
                  BI.pickUpAP = data.pickUpAP;
               }
               else
               {
                  BI.PickUpItem.text = Texts.fetch(193);
                  BI.pickUpText.text = Texts.fetch(193);
                  BI.pickUpAP = null;
               }
               BI.HPIndicator.setValue(data.HP,0,false);
               BI.MoraleIndicator.setValue(data.morale,0,false);
               lastHPBar = Math.floor(data.HP / data.maxHP * 20);
               lastMoraleBar = Math.floor(data.morale / 5);
               i = 0;
               while(i < 20)
               {
                  BI.HPBars[i].visible = i < lastHPBar;
                  BI.MoraleBars[i].visible = i < lastMoraleBar;
                  i++;
               }
               BI.APIndicator.setValue(data.AP,0,false);
               i = 0;
               while(i < 20)
               {
                  BI.APDots[i].visible = i < data.AP;
                  i++;
               }
               BI.APOverflow.visible = data.AP > 20;
               BI.bleedingSign.visible = data.bleeding > 0.5;
               BI.burningSign.visible = data.burning > 0;
               BI.overloadSign.visible = data.overloaded;
               BI.eyeDamageSign.visible = data.eyeDamage;
               BI.armDamageSign.visible = data.armDamage;
               BI.legDamageSign.visible = data.legDamage;
               BI.criticallyWoundedSign.visible = data.HP / data.maxHP < 0.25;
               BI.characterPointer = data.characterPointer;
               if(data.reloadAP > 0)
               {
                  BI.reloadText.text = Texts.fetch(195,1,8).toUpperCase();
               }
               else
               {
                  BI.reloadText.text = Texts.fetch(193);
               }
               BI.healingLight.visible = data.healingMode;
               BI.yourGroup.text = data.yourPeople;
               BI.allies.text = data.allies;
               BI.enemies.text = data.enemies;
               BI.HP = data.HP;
               BI.morale = data.morale;
               BI.AP = data.AP;
               BF.interfaceOnOff = function(param1:*):*
               {
                  if(param1)
                  {
                     GD.displayTutorial(26);
                  }
                  BI.turnOnOff(param1);
               };
            }
         };
         blackBG = new Sprite();
         blackBG.graphics.beginFill(0);
         blackBG.graphics.drawRect(0,0,880,495);
         blackBG.graphics.endFill();
         addChild(blackBG);
         addChild(BF);
         addChild(BI);
         battleOptions = new BattleOptionsWindow(GD,BF);
         battleOptions.visible = false;
         addChild(battleOptions);
         BI.onOpenOptions = function():*
         {
            previousInterfaceState = !BI.disabledScreen.visible;
            BF.paused = true;
            BI.turnOnOff(false);
            Mouse.show();
            battleOptions.visible = true;
         };
         battleOptions.onClose = function():*
         {
            BI.turnOnOff(previousInterfaceState);
            BF.paused = false;
         };
         BF.paused = false;
      }
      
      private function imprison() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in BF.ActList)
         {
            if(!BF.ActList[_loc1_].dead && BF.ActList[_loc1_].health > 0 && BF.ActList[_loc1_].band == 2 && BF.ActList[_loc1_].category != 4 && BF.ActList[_loc1_].category != 9)
            {
               BF.ActList[_loc1_].oldFaction = BF.ActList[_loc1_].caravan.faction;
               BF.ActList[_loc1_].caravan.removePerson(BF.ActList[_loc1_]);
               BF.ActList[_loc1_].category = 3;
               if(BF.ActList[_loc1_].oldFaction != undefined)
               {
                  BF.ActList[_loc1_].morale = Math.max(Math.min(30 + GD.getFactionRelations(BF.ActList[_loc1_].oldFaction,0),100),1);
               }
               else
               {
                  BF.ActList[_loc1_].morale = MathFunctions.random(20,40);
               }
               BF.ActList[_loc1_].faction = 0;
               GD.Caravans[0].addPerson(BF.ActList[_loc1_]);
            }
         }
         removeChild(panicDialogue.disp);
         BF.onWin();
      }
      
      private function letGo() : *
      {
         removeChild(panicDialogue.disp);
         BF.onWin();
         GD.affectSpecificReputation(5,1);
      }
      
      private function keepKilling() : *
      {
         removeChild(panicDialogue.disp);
         GD.affectSpecificReputation(5,-1);
         BF.paused = false;
         BF.interfaceOnOff(BF.inControl());
         stage.focus = BF;
      }
      
      private function enslave() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc2_ in slaves)
         {
            slaves[_loc2_].faction = 0;
            GD.Caravans[0].addPerson(slaves[_loc2_]);
            if(slaves[_loc2_].oldFaction != undefined)
            {
               slaves[_loc2_].morale = Math.max(Math.min(20 - GD.getFactionRelations(_loc1_,0),100),5);
            }
            else
            {
               slaves[_loc2_].morale = Math.round(5 + Math.random() * 10);
            }
            GD.enslaveAPerson();
         }
         removeChild(slavesDialogue.disp);
         loot();
      }
      
      private function leave() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = new Caravan(5,GD.mapMode.mapSymbols);
         for(_loc2_ in slaves)
         {
            slaves[_loc2_].category = 1;
            _loc1_.addPerson(slaves[_loc2_]);
            GD.freeASlave(slaves[_loc2_]);
         }
         _loc1_.x = GD.Caravans[0].x;
         _loc1_.y = GD.Caravans[0].y;
         GD.Caravans.push(_loc1_);
         GD.directCaravanToNearestTown(_loc1_);
         GD.Caravans[0].recentlyInteractedCaravans.push(_loc1_);
         _loc1_.recentlyInteractedCaravans.push(GD.Caravans[0]);
         removeChild(slavesDialogue.disp);
         loot();
      }
      
      private function escort() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in slaves)
         {
            slaves[_loc1_].category = 9;
            slaves[_loc1_].faction = 0;
            GD.Caravans[0].addPerson(slaves[_loc1_]);
            slaves[_loc1_].morale = MathFunctions.random(30,70);
            GD.affectSpecificReputation(5,2);
            GD.freeASlave(slaves[_loc1_]);
         }
         removeChild(slavesDialogue.disp);
         loot();
      }
      
      private function loot() : *
      {
         if(BI is BattleInterface)
         {
            BI.stopped = true;
            BI.remove();
            BI = null;
         }
         if(BF is BattleField)
         {
            BF.paused = true;
            BF.remove();
            BF = null;
         }
         tradeWindow = new TradeWindow(GD);
         tradeWindow.setPartner(lootArray,new Sprite(),null,null,true,[],Texts.fetch(1395).toUpperCase(),null,false,Texts.fetch(4169).toUpperCase());
         tradeWindow.onExit = function():*
         {
            var _loc5_:* = undefined;
            var _loc2_:* = undefined;
            var _loc4_:* = undefined;
            var _loc6_:* = undefined;
            var _loc3_:* = [];
            var _loc1_:* = [];
            for(_loc4_ in lootArray)
            {
               if(lootArray[_loc4_].originallyBelongedTo is Caravan)
               {
                  if(lootArray[_loc4_] is Item)
                  {
                     lootArray[_loc4_].originallyBelongedTo.addCargo(lootArray[_loc4_].type,lootArray[_loc4_].amount);
                  }
                  if(lootArray[_loc4_] is TransportUnit)
                  {
                     lootArray[_loc4_].originallyBelongedTo.addTransport(lootArray[_loc4_]);
                  }
                  _loc2_ = false;
                  for(_loc5_ in _loc3_)
                  {
                     if(_loc3_[_loc5_] == lootArray[_loc4_].originallyBelongedTo)
                     {
                        _loc2_ = true;
                        break;
                     }
                  }
                  if(!_loc2_)
                  {
                     _loc3_.push(lootArray[_loc4_].originallyBelongedTo);
                  }
                  lootArray[_loc4_].originallyBelongedTo = null;
               }
               else
               {
                  _loc1_.push(lootArray[_loc4_]);
               }
            }
            if(lootingFromGroups.length > 0)
            {
               for(_loc4_ in _loc1_)
               {
                  _loc6_ = Math.random() * (lootingFromGroups.length - 1);
                  if(_loc1_[_loc4_] is Item)
                  {
                     lootingFromGroups[_loc6_].addCargo(_loc1_[_loc4_].type,_loc1_[_loc4_].amount);
                  }
                  if(_loc1_[_loc4_] is TransportUnit)
                  {
                     lootingFromGroups[_loc6_].addTransport(_loc1_[_loc4_]);
                  }
               }
            }
            for(_loc4_ in _loc3_)
            {
               _loc3_[_loc4_].distributeWeapons();
               _loc3_[_loc4_].distributeAmmo();
               _loc3_[_loc4_].distributeArmor();
               _loc3_[_loc4_].distributeLiquidsContainers();
               _loc3_[_loc4_].distributeTransport();
               _loc3_[_loc4_].distributeDrivers();
            }
            GD.setMode(GD.cameFromMode);
         };
         tradeWindow.takeMoney();
         addChild(tradeWindow);
      }
      
      public function remove() : *
      {
         if(BI is BattleInterface)
         {
            BI.stopped = true;
            BI.remove();
            BI = null;
         }
         if(BF is BattleField)
         {
            BF.paused = true;
            BF.remove();
            BF = null;
         }
         if(battleOptions is BattleOptionsWindow)
         {
            battleOptions.remove();
         }
         battleOptions = null;
         if(tradeWindow is TradeWindow)
         {
            tradeWindow.remove();
         }
         tradeWindow = null;
         if(panicDialogue)
         {
            panicDialogue.butt1.remove();
            panicDialogue.butt1 = null;
            panicDialogue.butt2.remove();
            panicDialogue.butt2 = null;
            panicDialogue.butt3.remove();
            panicDialogue.butt3 = null;
            while(panicDialogue.numChildren > 0)
            {
               panicDialogue.removeChildAt(0);
            }
         }
         panicDialogue = null;
         if(slavesDialogue)
         {
            slavesDialogue.butt1.remove();
            slavesDialogue.butt1 = null;
            slavesDialogue.butt2.remove();
            slavesDialogue.butt2 = null;
            slavesDialogue.butt3.remove();
            slavesDialogue.butt3 = null;
            while(slavesDialogue.numChildren > 0)
            {
               slavesDialogue.removeChildAt(0);
            }
         }
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         slavesDialogue = null;
         lootingFromGroups = null;
         if(stage)
         {
            stage.focus = stage;
         }
         GD = null;
      }
   }
}

