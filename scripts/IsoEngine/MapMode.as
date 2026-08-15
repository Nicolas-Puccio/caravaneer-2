package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.*;
   import flash.events.Event;
   import flash.system.*;
   import flash.text.*;
   
   public class MapMode extends Sprite
   {
      
      public var GD:*;
      
      public var screen:*;
      
      public var dialoguesOpen:* = [];
      
      public var openDialoguesData:* = [];
      
      private var eventsToExecute:* = [];
      
      public var counters:*;
      
      public var indicators:*;
      
      public var radarSymbols:*;
      
      public var flippers:*;
      
      public var buttons:*;
      
      public var switches:*;
      
      public var clockParts:*;
      
      public var groundBG:*;
      
      public var groundMask:*;
      
      public var movingStuff:*;
      
      public var bulbs:*;
      
      public var infoText:*;
      
      public var pausedText:*;
      
      public var infoTextFade:*;
      
      public var date:*;
      
      public var windSymbol:*;
      
      public var windArrow:*;
      
      public var windArrowMask:*;
      
      public var windSpeedText:*;
      
      public var mouseLookDir:*;
      
      public var mouseStatus:* = 0;
      
      public var prevMouseStatus:* = 0;
      
      public var mouseInside:* = true;
      
      public var mousePressed:* = false;
      
      public var showInfoText:* = false;
      
      public var cursorText:* = "";
      
      public var townSymbols:*;
      
      public var townNameTexts:*;
      
      public var mapSymbols:*;
      
      public var optionsMenu:*;
      
      public var prevSpeed:*;
      
      public var electricityConsumption:*;
      
      public var electricityProduction:*;
      
      public var cartProblem:*;
      
      public var driverProblem:*;
      
      public var mercenaryToPayTo:*;
      
      public var justInitiated:* = true;
      
      public var lastClick:* = 0;
      
      public var forceTownUpdate:* = false;
      
      public var saveNow:* = false;
      
      public var waitedOneFrame:* = false;
      
      public var stopped:* = false;
      
      public var _musicFadeIn:*;
      
      public var _musicFadeOut:*;
      
      public var resetRecentlyInteracted:*;
      
      private function attackFunction(param1:*, param2:*, param3:*, param4:*):*
      {
         var youAttacked:* = param1;
         var group:* = param2;
         var settings:* = param3;
         var obstacles:* = param4;
         if(GD.getFactionRelations(0,Presets.CaravanTypes[group.type].faction) >= 0)
         {
            openDialogue(5);
            dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(1386).toUpperCase());
            dialoguesOpen[dialoguesOpen.length - 1].altVar = {
               "group":group,
               "settings":settings,
               "obstacles":obstacles
            };
            dialoguesOpen[dialoguesOpen.length - 1].onApprove = function():*
            {
               if(group.faction > 0)
               {
                  GD.affectFactionRelations(-30,group.faction,0);
               }
               GD.affectSpecificReputation(2,-1);
               GD.setMode(2,[GD.Caravans[0]],[group],null,settings,obstacles);
               closeAllDialogues();
            };
         }
         else
         {
            if(group.faction != undefined)
            {
               if(youAttacked)
               {
                  GD.affectFactionRelations(-2,group.faction,0);
               }
               else
               {
                  GD.affectFactionRelations(-0.5,group.faction,0);
               }
            }
            closeDialogue();
            GD.setMode(2,[GD.Caravans[0]],[group],null,settings,obstacles);
         }
      }
      internal var stopWatchTime:*;
      
      public function MapMode(param1:*)
      {
         super();
         addEventListener("enterFrame",enterFrame,false,0,false);
         addEventListener("mouseMove",mMove,false,0,false);
         addEventListener("mouseDown",click,false,0,false);
         addEventListener("mouseUp",mUp,false,0,false);
         addEventListener("mouseLeave",mOut,false,0,false);
         GD = param1;
         init();
         addEventListener("addedToStage",setFocus,false,0,false);
         addEventListener("removedFromStage",removedFromStage,false,0,false);
      }
      
      public function setFocus(param1:* = null) : *
      {
         stage.stageFocusRect = false;
         stage.addEventListener("keyDown",keyPressed,false,0,false);
         stage.focus = stage;
      }
      
      public function removedFromStage(param1:* = null) : *
      {
         stage.removeEventListener("keyDown",keyPressed);
      }
      
      public function keyPressed(param1:*) : *
      {
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         if(!visible || stopped)
         {
            return false;
         }
         if(GD.tutorialOn)
         {
            return false;
         }
         if(dialoguesOpen.length > 0)
         {
            return false;
         }
         switch(param1.keyCode)
         {
            case 49:
               if(GameData.soundFXOn && GD.gameSpeed != 1)
               {
                  new SFXTapeButton().play();
               }
               if(GD.gameSpeed == 0)
               {
                  musicFadeIn = true;
               }
               GD.gameSpeed = 1;
               setSpeedButtons(1);
               break;
            case 50:
               if(GameData.soundFXOn && GD.gameSpeed != GD.doubleSpeed)
               {
                  new SFXTapeButton().play();
               }
               GD.gameSpeed = GD.doubleSpeed;
               setSpeedButtons(2);
               if(GD.gameSpeed == 0)
               {
                  musicFadeIn = true;
               }
               break;
            case 51:
               if(GameData.soundFXOn && GD.gameSpeed != GD.tripleSpeed)
               {
                  new SFXTapeButton().play();
               }
               GD.gameSpeed = GD.tripleSpeed;
               setSpeedButtons(3);
               if(GD.gameSpeed == 0)
               {
                  musicFadeIn = true;
               }
               break;
            case 52:
            case 48:
               if(GameData.soundFXOn && GD.gameSpeed != 4)
               {
                  new SFXTapeButton().play();
               }
               if(GD.gameSpeed != 0)
               {
                  prevSpeed = GD.gameSpeed;
                  musicFadeOut = true;
               }
               GD.gameSpeed = 0;
               setSpeedButtons(4);
               break;
            case 32:
               if(GameData.soundFXOn)
               {
                  new SFXTapeButton().play();
               }
               if(GD.gameSpeed == 0)
               {
                  if(prevSpeed > 0)
                  {
                     GD.gameSpeed = prevSpeed;
                  }
                  else
                  {
                     GD.gameSpeed = 1;
                  }
                  if(GD.gameSpeed == 1)
                  {
                     setSpeedButtons(1);
                  }
                  if(GD.gameSpeed == GD.doubleSpeed)
                  {
                     setSpeedButtons(2);
                  }
                  if(GD.gameSpeed == GD.tripleSpeed)
                  {
                     setSpeedButtons(3);
                  }
                  musicFadeIn = true;
               }
               else
               {
                  if(GD.gameSpeed != 0)
                  {
                     prevSpeed = GD.gameSpeed;
                  }
                  musicFadeOut = true;
                  GD.gameSpeed = 0;
                  setSpeedButtons(4);
               }
               break;
            case 67:
               GD.setMode(3);
               stopped = true;
               break;
            case 77:
               GD.Caravans[0].moving = !GD.Caravans[0].moving;
               break;
            case 78:
               GD.cameFromMode = 1;
               GD.setMode(5);
               stopped = true;
               break;
            case 83:
               openDialogue(7);
               mouseStatus = 0;
               break;
            case 27:
               openDialogue(1);
               break;
            case 90:
               _loc5_ = ["skinColor","hairColor","shirtColor","pantsColor","shoesColor","lipsColor","beardColor","eyebrowsColor","eyesColor","eyeSocketsColor","bristleColor","name","gender","physical","agility","accuracy","intelligence","idealWeight","_HP","sleevesType","hasRightBracelet","hasLeftBracelet","braceletColor","age","portraitShoulders","portraitHead","portraitNose","portraitMouth","portraitEyes","portraitHair","portraitWrinkles","portraitBeard","portraitEyebrows","portraitEars","portraitEyeSockets","portraitWhiskers","portraitMoustache","portraitShirt","portraitNecklace"];
               var _loc2_:String = "{";
               _loc3_ = 0;
               while(_loc3_ < _loc5_.length)
               {
                  _loc2_ += _loc5_[_loc3_] + ":";
                  if(GD.Caravans[0].People[0][_loc5_[_loc3_]] is String)
                  {
                     _loc2_ += "\"" + GD.Caravans[0].People[0][_loc5_[_loc3_]] + "\"";
                  }
                  else if(GD.Caravans[0].People[0][_loc5_[_loc3_]] is Object && !(GD.Caravans[0].People[0][_loc5_[_loc3_]] is Number) && !(GD.Caravans[0].People[0][_loc5_[_loc3_]] is Boolean))
                  {
                     _loc2_ += "{";
                     for(_loc4_ in GD.Caravans[0].People[0][_loc5_[_loc3_]])
                     {
                        _loc2_ += _loc4_ + ":" + GD.Caravans[0].People[0][_loc5_[_loc3_]][_loc4_];
                        _loc2_ += ", ";
                     }
                     _loc2_ = _loc2_.substring(0,_loc2_.length - 2);
                     _loc2_ += "}";
                  }
                  else
                  {
                     _loc2_ += GD.Caravans[0].People[0][_loc5_[_loc3_]];
                  }
                  if(_loc3_ < _loc5_.length - 1)
                  {
                     _loc2_ += ", ";
                  }
                  _loc3_++;
               }
               _loc2_ += "}";
               trace(_loc2_);
               break;
            case 88:
               GD.printGlobalEconomy();
               break;
            case 89:
               GD.printTownsEconomy();
         }
      }
      
      public function mMove(param1:*) : *
      {
         if(stopped)
         {
            return;
         }
         mouseInside = true;
      }
      
      public function click(param1:*) : *
      {
         if(stopped)
         {
            return;
         }
         mousePressed = true;
         var _loc2_:Date = new Date();
         var _loc3_:Number = _loc2_ - lastClick;
         if(dialoguesOpen.length == 0)
         {
            if(mouseStatus == 1)
            {
               if(GameData.soundFXOn)
               {
                  new SFXClick().play();
               }
               GD.Caravans[0].direction = mouseLookDir;
               GD.Caravans[0].moving = true;
            }
            if(mouseStatus == 2)
            {
               if(!(_loc3_ < 300 && GD.Caravans[0].overTown == null))
               {
                  if(GD.Caravans[0].overTown == null)
                  {
                     GD.Caravans[0].moving = !GD.Caravans[0].moving;
                  }
                  else
                  {
                     enterTown(GD.Caravans[0].overTown);
                  }
               }
            }
            if(mouseStatus == 25)
            {
               if(GameData.soundFXOn)
               {
                  new SFXTapeButton().play();
               }
               openDialogue(1);
            }
            if(mouseStatus == 26 && GD.gameSpeed != 1)
            {
               if(GameData.soundFXOn)
               {
                  new SFXTapeButton().play();
               }
               if(GD.gameSpeed == 0)
               {
                  musicFadeIn = true;
               }
               GD.gameSpeed = 1;
               setSpeedButtons(1);
            }
            if(mouseStatus == 27 && GD.gameSpeed != GD.doubleSpeed)
            {
               if(GameData.soundFXOn)
               {
                  new SFXTapeButton().play();
               }
               if(GD.gameSpeed == 0)
               {
                  musicFadeIn = true;
               }
               GD.gameSpeed = GD.doubleSpeed;
               setSpeedButtons(2);
            }
            if(mouseStatus == 28 && GD.gameSpeed != GD.tripleSpeed)
            {
               if(GameData.soundFXOn)
               {
                  new SFXTapeButton().play();
               }
               if(GD.gameSpeed == 0)
               {
                  musicFadeIn = true;
               }
               GD.gameSpeed = GD.tripleSpeed;
               setSpeedButtons(3);
            }
            if(mouseStatus == 29 && GD.gameSpeed != 0)
            {
               if(GameData.soundFXOn)
               {
                  new SFXTapeButton().play();
               }
               if(GD.gameSpeed != 0)
               {
                  musicFadeOut = true;
               }
               if(GD.gameSpeed != 0)
               {
                  prevSpeed = GD.gameSpeed;
               }
               GD.gameSpeed = 0;
               setSpeedButtons(4);
            }
         }
         lastClick = _loc2_;
      }
      
      public function mUp(param1:*) : *
      {
         if(stopped)
         {
            return;
         }
         mousePressed = false;
         if(mouseStatus == 30)
         {
            if(GameData.soundFXOn)
            {
               new SFXSlideButton().play();
            }
            GD.setMode(3);
            stopped = true;
         }
         if(mouseStatus == 31)
         {
            if(GameData.soundFXOn)
            {
               new SFXSlideButton().play();
            }
            GD.cameFromMode = 1;
            GD.setMode(5);
            stopped = true;
         }
         if(mouseStatus == 32)
         {
            if(GameData.soundFXOn)
            {
               new SFXSlideButton().play();
            }
            openDialogue(7);
            mouseStatus = 0;
         }
      }
      
      public function mOut(param1:Event) : *
      {
         if(stopped)
         {
            return;
         }
         mouseInside = false;
      }
      
      public function enterFrame(param1:Event) : *
      {
         var flushStatus:*;
         var i:*;
         var j:*;
         var x:*;
         var y:*;
         var count:*;
         var prob:*;
         var ind:*;
         var pseudoJ:*;
         var pseudoI:*;
         var vehicles:*;
         var availableFuel:*;
         var cargoFound:*;
         var fuelConsumption:*;
         var distanceCovered:*;
         var t:*;
         var consumptionProduction:*;
         var currSquareCaravans:*;
         var betweenCaravans:*;
         var caravansToTowns:*;
         var currSquareTowns:*;
         var to:*;
         var denyEntrance:*;
         var nc:*;
         var obstaclesToPass:*;
         var rnd:*;
         var peopleNum:*;
         var spencerWithYou:*;
         var behavior:*;
         var theOtherCaravan:*;
         var windShift:*;
         var attackers:*;
         var target:*;
         var directAngle:*;
         var beta:*;
         var gamma:*;
         var currentSlice:*;
         var biggestSliceInd:*;
         var biggestSliceSize:*;
         var nextPoint:*;
         var victims:*;
         var min:*;
         var max:*;
         var escaping:*;
         var attacking:*;
         var dist:*;
         var consProd:*;
         var waterConsumption:*;
         var maxAmount:*;
         var transferAmount:*;
         var amountInStock:*;
         var moneySum:*;
         var escortCounter:*;
         var ang:*;
         var destX:*;
         var destY:*;
         var distToDest:*;
         var distToPos:*;
         var distToZero:*;
         var pos:*;
         var maxIntelligence:*;
         var angle:*;
         var k:*;
         var l:*;
         var m:*;
         var neededAmount:*;
         var damage:*;
         var amount:*;
         var actualAmount:*;
         var amountRel:*;
         var itemInd:*;
         var totalCalories:*;
         var BMR:*;
         var GDA:*;
         var waterReceived:*;
         var waterNeeded:*;
         var waterInCaravan:*;
         var waterActuallyConsumed:*;
         var priceToCalories:*;
         var useMeds:*;
         var caloriesToAdd:*;
         var newAnimal:*;
         var foodstuffs:*;
         var collectingSkill:*;
         var spread:*;
         var text:*;
         var skip:*;
         var distToTarget:*;
         var huntingSkill:*;
         var ThumInd:*;
         var newGroup:*;
         var distToDrekar:*;
         var distFromLois:*;
         var distFromYou:*;
         var distToLintu:*;
         var distToMikaze:*;
         var batteriesNum:*;
         var batteriesItem:*;
         var batteriesToCharge:*;
         var fullyCharged:*;
         var workingChargers:*;
         var lowMoralePrice:*;
         var highMoralePrice:*;
         var relFoodPrice:*;
         var prevMorale:*;
         var lossDivider:*;
         var recoverDivider:*;
         var lowWeightDivider:*;
         var hungerDivider:*;
         var thirstDivider:*;
         var totalHealed:*;
         var sortArray:*;
         var totalHeal:*;
         var totalRepair:*;
         var distFromIdeal:*;
         var weightRel:*;
         var theresAMale:*;
         var totalCargoSave:*;
         var maxCargoSave:*;
         var overweight:*;
         var thereAreCars:*;
         var totalFuelConsumption:*;
         var foodToThrow:*;
         var foodArray:*;
         var throwing:*;
         var freeItems:*;
         var toUnuse:*;
         var unusing:*;
         var forageConsumption:*;
         var availableFood:*;
         var cargoArr:*;
         var redistributeEquipment:*;
         var restingProduction:*;
         var townConsProd:*;
         var foodProduction:*;
         var remainingFoodConsumption:*;
         var remainingWaterConsumption:*;
         var allFood:*;
         var smallestDifference:*;
         var oneChunk:*;
         var consumeThisInUnits:*;
         var consumeThisInKCal:*;
         var found:*;
         var savedProduction:*;
         var savedConsumption:*;
         var amountToBuy:*;
         var moneyRequired:*;
         var spaceRequired:*;
         var producedProducts:*;
         var needToSell:*;
         var consumptionStock:*;
         var totalSpaceRequired:*;
         var totalMoneyRequired:*;
         var testItem:*;
         var thingsToSell:*;
         var totalToBuyMoney:*;
         var totalAmount:*;
         var totalToBuySpace:*;
         var thingsToBuy:*;
         var moneyRel:*;
         var finalRel:*;
         var storeAmount:*;
         var occupiedStorage:*;
         var sellAmount:*;
         var totalExpenses:*;
         var addAmount:*;
         var maxSell:*;
         var sellRest:*;
         var sellSet:*;
         var sellNow:*;
         var price:*;
         var canBuy:*;
         var maxBuy:*;
         var buyAmount:*;
         var assortmentToStock:*;
         var measures:*;
         var summaryGDPperCapita:*;
         var wealthFactor:*;
         var changeChance:*;
         var possibleWorkers:*;
         var currentlyEmployed:*;
         var allIndustries:*;
         var industryToReduce:*;
         var idealNumber:*;
         var toReduce:*;
         var canBeRemoved:*;
         var removeNow:*;
         var toAdd:*;
         var newPerson:*;
         var settings:*;
         var useless:*;
         var uselessStuff:*;
         var currItem:*;
         var possibleExpansions:*;
         var prod:*;
         var n:*;
         var moneyComp:*;
         var multiplier:*;
         var balances:*;
         var foundCategory:*;
         var categoryBalances:*;
         var itemData:*;
         var cons:*;
         var selectedExpansion:*;
         var bestScore:*;
         var theMoney:*;
         var possibleOptions:*;
         var howMuch:*;
         var cutHistoryTo:*;
         var hasBeenCaught:*;
         var chanceToBeCaught:*;
         var groupProbabilities:*;
         var scanY:*;
         var possibleTowns:*;
         var scanX:*;
         var speedMultiplier:*;
         var difficultyMultiplier:*;
         var d:*;
         var inclination:*;
         var sidesDir:*;
         var sin:*;
         var cos:*;
         var total:*;
         var allStopped:*;
         var currDist:*;
         var distToAusz:*;
         var water:*;
         var food:*;
         var meds:*;
         var hasVehicles:*;
         var hasAnimals:*;
         var forage:*;
         var fuel:*;
         var totalCargo:*;
         var maxCargo:*;
         var woundedPeople:*;
         var mechanicalProblems:*;
         var woundedAnimals:*;
         var distanceFromCenter:*;
         var clickToStopNum:*;
         var clickToGoNum:*;
         var e:Event = param1;
         if(saveNow)
         {
            saveNow = false;
            waitedOneFrame = true;
         }
         else if(waitedOneFrame)
         {
            GD.parent.savedData.data.saves[0] = {
               "name":"[" + Texts.fetch(1445) + "]",
               "time":new Date(),
               "save":GD.generateSave()
            };
            try
            {
               flushStatus = GD.parent.savedData.flush();
            }
            catch(error:Error)
            {
               trace("Error...Could not write SharedObject to disk\n");
            }
            waitedOneFrame = false;
            GD.waitBox.visible = false;
         }
         if(GD.travelModeMusic && GameData.musicOn)
         {
            if(musicFadeIn)
            {
               GD.travelModeMusicControl.volume += 0.01;
               if(GD.travelModeMusicControl.volume >= 0.6)
               {
                  GD.travelModeMusicControl.volume = 0.6;
                  musicFadeIn = false;
               }
               GD.travelModeMusic.soundTransform = GD.travelModeMusicControl;
            }
            if(musicFadeOut)
            {
               GD.travelModeMusicControl.volume -= 0.02;
               if(GD.travelModeMusicControl.volume <= 0)
               {
                  GD.travelModeMusicControl.volume = 0;
                  musicFadeOut = false;
               }
               GD.travelModeMusic.soundTransform = GD.travelModeMusicControl;
            }
         }
         if(stopped || GD.tutorialOn)
         {
            return;
         }
         if(!GD.Caravans[0].active || GD.Caravans.length == 0)
         {
            GD.setMode(6,2723);
            return;
         }
         if(dialoguesOpen.length > 0)
         {
            return false;
         }
         showInfoText = false;
         betweenCaravans = [];
         caravansToTowns = [];
         pausedText.visible = GD.gameSpeed == 0;
         if(GD.gameSpeed > 0 || justInitiated)
         {
            for(i in GD.Caravans)
            {
               if(GD.Caravans[i].category != 5)
               {
                  distanceCovered = GD.gameSpeed * 4 / 60 * GD.Caravans[i].speed;
                  if(i == 0)
                  {
                     cartProblem = false;
                  }
                  GD.Caravans[i].distanceMultiplier = 1;
                  if(GD.Caravans[i].moving || i == 0 && justInitiated)
                  {
                     if(GD.Caravans[i].hasUnattachedCarts)
                     {
                        GD.Caravans[i].distributeTransport(false);
                        if(GD.Caravans[i].hasUnattachedCarts)
                        {
                           if(i == 0)
                           {
                              GD.Caravans[i].moving = false;
                              cartProblem = true;
                              openDialogue(4);
                              dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(1256).toUpperCase());
                           }
                           else
                           {
                              for(j in GD.Caravans[i].Transport)
                              {
                                 if(GD.Caravans[i].Transport[j].category == 2)
                                 {
                                    GD.Caravans[i].removeTransport(GD.Caravans[i].Transport[j]);
                                    break;
                                 }
                              }
                           }
                        }
                     }
                  }
                  if(i == 0)
                  {
                     driverProblem = false;
                  }
                  if(GD.Caravans[i].moving || i == 0 && justInitiated)
                  {
                     if(GD.Caravans[i].hasVehiclesWithoutDrivers)
                     {
                        GD.Caravans[i].distributeDrivers();
                        if(GD.Caravans[i].hasVehiclesWithoutDrivers)
                        {
                           GD.Caravans[i].moving = false;
                           if(i == 0)
                           {
                              driverProblem = true;
                              openDialogue(4);
                              dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(1257).toUpperCase());
                           }
                        }
                     }
                  }
                  if(GD.Caravans[i].moving)
                  {
                     vehicles = [];
                     for(j in GD.Caravans[i].Transport)
                     {
                        if(GD.Caravans[i].Transport[j].category == 3 && !GD.Caravans[i].Transport[j].windPowered && !(GD.Caravans[i].Transport.passengerIn is TransportUnit))
                        {
                           vehicles.push(GD.Caravans[i].Transport[j]);
                        }
                        if((GD.Caravans[i].Transport[j].category == 2 || GD.Caravans[i].Transport[j].category == 3) && !(GD.Caravans[i].Transport.passengerIn is TransportUnit))
                        {
                           GD.Caravans[i].Transport[j].health -= distanceCovered / 500 * Math.random();
                        }
                     }
                     cargoFound = GD.Caravans[i].findCargo(64);
                     if(cargoFound === false)
                     {
                        availableFuel = 0;
                     }
                     else
                     {
                        availableFuel = cargoFound.amount;
                     }
                     if(vehicles.length > 0 && availableFuel == 0)
                     {
                        GD.Caravans[i].moving = false;
                        if(i == 0)
                        {
                           openDialogue(4);
                           dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(1258).toUpperCase());
                        }
                     }
                     fuelConsumption = 0;
                     if(vehicles.length > 0 && availableFuel > 0)
                     {
                        for(j in vehicles)
                        {
                           fuelConsumption += vehicles[j].fuelConsumption * distanceCovered / 100;
                        }
                        if(fuelConsumption > availableFuel)
                        {
                           GD.Caravans[i].distanceMultiplier = availableFuel / fuelConsumption;
                        }
                     }
                  }
               }
            }
         }
         bulbs[11].visible = cartProblem || driverProblem;
         resetRecentlyInteracted = false;
         if(GD.gameSpeed == 0 && justInitiated)
         {
            to = 1;
         }
         else
         {
            to = GD.gameSpeed;
         }
         t = 1;
         while(t <= to)
         {
            betweenCaravans = [];
            caravansToTowns = [];
            for(i in GD.Caravans)
            {
               if(GD.Caravans[i].active && GD.Caravans[i].category != 5)
               {
                  if(GD.Caravans[i].moving && GD.gameSpeed > 0 && !(GD.keepDialogues is Array))
                  {
                     GD.Caravans[i].x += Math.sin(GD.Caravans[i].direction) * GD.Caravans[i].mapSpeed * GD.Caravans[i].distanceMultiplier;
                     GD.Caravans[i].y -= Math.cos(GD.Caravans[i].direction) * GD.Caravans[i].mapSpeed * GD.Caravans[i].distanceMultiplier;
                  }
                  GD.Caravans[i].squareX = Math.floor(GD.Caravans[i].x / GD.squareSize);
                  GD.Caravans[i].squareY = Math.floor(GD.Caravans[i].y / GD.squareSize);
                  if(GD.Caravans[i].prevSquareX != GD.Caravans[i].squareX || GD.Caravans[i].prevSquareY != GD.Caravans[i].squareY)
                  {
                     if(GD.Caravans[i].prevSquareX != undefined && GD.Caravans[i].prevSquareX != undefined)
                     {
                        GD.setSquareValue(GD.Caravans[i].prevSquareX,GD.Caravans[i].prevSquareY,"removecaravan",GD.Caravans[i]);
                     }
                     GD.setSquareValue(GD.Caravans[i].squareX,GD.Caravans[i].squareY,"addcaravan",GD.Caravans[i]);
                     GD.Caravans[i].prevSquareX = GD.Caravans[i].squareX;
                     GD.Caravans[i].prevSquareY = GD.Caravans[i].squareY;
                  }
               }
            }
            for(i in GD.Caravans)
            {
               if(GD.Caravans[i].active && GD.Caravans[i].category != 5)
               {
                  GD.Caravans[i].nearbyCaravans = [];
                  GD.Caravans[i].nearbyTowns = [];
                  x = GD.Caravans[i].squareX - 1;
                  while(x <= GD.Caravans[i].squareX + 1)
                  {
                     y = GD.Caravans[i].squareY - 1;
                     while(y <= GD.Caravans[i].squareY + 1)
                     {
                        currSquareCaravans = GD.getSquareCaravans(x,y);
                        currSquareTowns = GD.getSquareTowns(x,y);
                        GD.Caravans[i].nearbyCaravans = GD.Caravans[i].nearbyCaravans.concat(currSquareCaravans);
                        GD.Caravans[i].nearbyTowns = GD.Caravans[i].nearbyTowns.concat(currSquareTowns);
                        y = Number(y) + 1;
                     }
                     x = Number(x) + 1;
                  }
                  GD.Caravans[i].nearbyCaravans.splice(GD.Caravans[i].nearbyCaravans.indexOf(GD.Caravans[i]),1);
               }
            }
            for(i in GD.Caravans)
            {
               if(GD.Caravans[i].active && GD.Caravans[i].category != 5)
               {
                  if(!(betweenCaravans[i] is Array))
                  {
                     betweenCaravans[i] = [];
                  }
                  for(j in GD.Caravans[i].nearbyCaravans)
                  {
                     if(betweenCaravans[i][j] == undefined)
                     {
                        betweenCaravans[i][j] = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[i].nearbyCaravans[j].x,GD.Caravans[i].nearbyCaravans[j].y);
                     }
                     pseudoJ = GD.Caravans.indexOf(GD.Caravans[i].nearbyCaravans[j]);
                     pseudoI = GD.Caravans[pseudoJ].nearbyCaravans.indexOf(GD.Caravans[i]);
                     if(!(betweenCaravans[pseudoJ] is Array))
                     {
                        betweenCaravans[pseudoJ] = [];
                     }
                     betweenCaravans[pseudoJ][pseudoI] = betweenCaravans[i][j];
                  }
                  if(!(caravansToTowns[i] is Array))
                  {
                     caravansToTowns[i] = [];
                  }
                  GD.Caravans[i].overTown = null;
                  for(j in GD.Caravans[i].nearbyTowns)
                  {
                     if(GD.Towns[GD.Caravans[i].nearbyTowns[j]].active || GD.Caravans[i].specialPurpose == 6 && GD.Caravans[i].nearbyTowns[j] == 34)
                     {
                        if(caravansToTowns[i][j] == null)
                        {
                           caravansToTowns[i][j] = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,Presets.Towns[GD.Caravans[i].nearbyTowns[j]].x,Presets.Towns[GD.Caravans[i].nearbyTowns[j]].y);
                        }
                        if(caravansToTowns[i][j] < 25)
                        {
                           GD.Caravans[i].overTown = GD.Caravans[i].nearbyTowns[j];
                           if(GD.Caravans[i].recentlyInteractedTowns.indexOf(GD.Caravans[i].nearbyTowns[j]) == -1)
                           {
                              if(i != 0 && GD.Caravans[i].overTown != null && GD.Caravans[i].category != 3)
                              {
                                 GD.Caravans[i].addCargo(1,40);
                              }
                              if(GD.Caravans[i].specialPurpose == 6 && GD.Caravans[i].nearbyTowns[j] == 34)
                              {
                                 eventsToExecute.push(28);
                                 GD.Caravans[i].moving = false;
                              }
                              if(GD.Caravans[i].specialPurpose == 6 && GD.Caravans[i].nearbyTowns[j] == 17)
                              {
                                 GD.Towns[17].population += GD.Caravans[i].People.length;
                                 GD.Towns[17].unemployed += GD.Caravans[i].People.length;
                                 GD.Caravans[i].specialPurpose = undefined;
                                 GD.Caravans[i].active = false;
                                 eventsToExecute.push(35);
                              }
                              if(GD.Caravans[i].specialPurpose == 6 && GD.Caravans[i].nearbyTowns[j] == 18)
                              {
                                 GD.Towns[18].population += GD.Caravans[i].People.length;
                                 GD.Towns[18].unemployed += GD.Caravans[i].People.length;
                                 GD.Caravans[i].specialPurpose = undefined;
                                 GD.Caravans[i].active = false;
                                 eventsToExecute.push(36);
                              }
                              if(!GD.Towns[GD.Caravans[i].overTown].constantPopulation)
                              {
                                 k = 0;
                                 while(k < GD.Caravans[i].People.length)
                                 {
                                    if(GD.Caravans[i].People[k].category == 7)
                                    {
                                       GD.Caravans[i].People[k].salary = GD.Caravans[i].People[k].minSalary;
                                       GD.Towns[GD.Caravans[i].overTown].people.push(GD.Caravans[i].People[k]);
                                    }
                                    if(GD.Caravans[i].People[k].category >= 6 && GD.Caravans[i].People[k].category <= 9)
                                    {
                                       if(GD.Caravans[i].People[k].category != 7)
                                       {
                                          GD.Towns[GD.Caravans[i].overTown].unemployed++;
                                       }
                                       GD.Caravans[i].People[k].category = 2;
                                       GD.Towns[GD.Caravans[i].overTown].population++;
                                       GD.Caravans[i].removePerson(GD.Caravans[i].People[k]);
                                       k = Number(k) - 1;
                                    }
                                    k = Number(k) + 1;
                                 }
                              }
                              GD.Caravans[i].recentlyInteractedTowns.push(GD.Caravans[i].nearbyTowns[j]);
                              if(i == 0)
                              {
                                 denyEntrance = false;
                                 for(k in GD.parent.loadedDLC)
                                 {
                                    if(GD.parent.loadedDLC[k].hasOwnProperty("onOverTown"))
                                    {
                                       denyEntrance |= GD.parent.loadedDLC[k].onOverTown(GD.Caravans[i].nearbyTowns[j]);
                                    }
                                 }
                                 if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 15 && !GD.Story.enteredBunkerForTheFirstTime)
                                 {
                                    GD.Story.enteredBunkerForTheFirstTime = true;
                                    openDialogue(8);
                                 }
                                 else
                                 {
                                    if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 21 && !GD.Story.killedRoversAtSigurdsHut)
                                    {
                                       GD.Story.killedRoversAtSigurdsHut = true;
                                       GD.Story.specificReputations[6] += 10;
                                       nc = GD.Caravans.push(new Caravan(6,mapSymbols)) - 1;
                                       GD.Caravans[nc].x = Presets.Towns[21].x;
                                       GD.Caravans[nc].y = Presets.Towns[21].y;
                                       GD.Caravans[nc].addPerson(new Character({
                                          "name":Texts.fetch(1981),
                                          "gender":1,
                                          "age":23,
                                          "physical":7,
                                          "agility":4,
                                          "accuracy":6,
                                          "intelligence":2,
                                          "portraitShoulders":1,
                                          "portraitHair":22,
                                          "portraitHead":3,
                                          "portraitMouth":4,
                                          "portraitNose":3,
                                          "portraitEyebrows":3,
                                          "portraitEyes":3,
                                          "portraitEars":2,
                                          "portraitBeard":0,
                                          "portraitMoustache":0,
                                          "portraitWhiskers":2,
                                          "portraitShirt":1,
                                          "portraitNecklace":0,
                                          "sleevesType":0,
                                          "skinColor":{
                                             "r":200,
                                             "g":160,
                                             "b":140,
                                             "bc":1
                                          },
                                          "hairColor":{
                                             "r":20,
                                             "g":15,
                                             "b":0,
                                             "bc":1
                                          },
                                          "eyesColor":{
                                             "r":20,
                                             "g":15,
                                             "b":0,
                                             "bc":1
                                          },
                                          "eyebrowsColor":{
                                             "r":20,
                                             "g":15,
                                             "b":0,
                                             "bc":1
                                          },
                                          "lipsColor":{
                                             "r":150,
                                             "g":60,
                                             "b":40,
                                             "bc":1
                                          },
                                          "shirtColor":{
                                             "r":150,
                                             "g":180,
                                             "b":160,
                                             "bc":1
                                          },
                                          "pantsColor":{
                                             "r":20,
                                             "g":40,
                                             "b":80,
                                             "bc":1
                                          },
                                          "shoesColor":{
                                             "r":20,
                                             "g":10,
                                             "b":0,
                                             "bc":1
                                          },
                                          "hasRightBracelet":true,
                                          "hasLeftBracelet":false,
                                          "braceletColor":{
                                             "r":20,
                                             "g":10,
                                             "b":0,
                                             "bc":1
                                          }
                                       }));
                                       GD.Caravans[nc].addPerson(new Character({
                                          "name":Texts.fetch(1982),
                                          "gender":2,
                                          "age":22,
                                          "physical":3,
                                          "agility":7,
                                          "accuracy":6,
                                          "intelligence":5,
                                          "portraitShoulders":1,
                                          "portraitHair":14,
                                          "portraitHead":2,
                                          "portraitMouth":1,
                                          "portraitNose":2,
                                          "portraitEyebrows":2,
                                          "portraitEyes":5,
                                          "portraitEars":1,
                                          "portraitBeard":0,
                                          "portraitMoustache":0,
                                          "portraitWhiskers":0,
                                          "portraitShirt":4,
                                          "portraitNecklace":0,
                                          "sleevesType":1,
                                          "skinColor":{
                                             "r":200,
                                             "g":180,
                                             "b":170,
                                             "bc":1.2
                                          },
                                          "hairColor":{
                                             "r":150,
                                             "g":140,
                                             "b":130,
                                             "bc":1
                                          },
                                          "eyesColor":{
                                             "r":200,
                                             "g":220,
                                             "b":225,
                                             "bc":1
                                          },
                                          "eyebrowsColor":{
                                             "r":140,
                                             "g":130,
                                             "b":120,
                                             "bc":1
                                          },
                                          "lipsColor":{
                                             "r":150,
                                             "g":60,
                                             "b":40,
                                             "bc":1
                                          },
                                          "shirtColor":{
                                             "r":140,
                                             "g":140,
                                             "b":180,
                                             "bc":1
                                          },
                                          "pantsColor":{
                                             "r":50,
                                             "g":60,
                                             "b":80,
                                             "bc":1
                                          },
                                          "shoesColor":{
                                             "r":20,
                                             "g":10,
                                             "b":0,
                                             "bc":1
                                          },
                                          "hasRightBracelet":false,
                                          "hasLeftBracelet":false
                                       }));
                                       if(GD.difficulty == 2)
                                       {
                                          GD.Caravans[nc].addPerson(new Character({
                                             "name":Texts.fetch(1983),
                                             "gender":1,
                                             "age":24,
                                             "physical":6,
                                             "agility":4,
                                             "accuracy":7,
                                             "intelligence":3,
                                             "portraitShoulders":1,
                                             "portraitHair":22,
                                             "portraitHead":4,
                                             "portraitMouth":6,
                                             "portraitNose":5,
                                             "portraitEyebrows":10,
                                             "portraitEyes":8,
                                             "portraitEars":2,
                                             "portraitBeard":0,
                                             "portraitMoustache":0,
                                             "portraitWhiskers":2,
                                             "portraitShirt":1,
                                             "portraitNecklace":0,
                                             "sleevesType":2,
                                             "skinColor":{
                                                "r":200,
                                                "g":180,
                                                "b":170,
                                                "bc":1
                                             },
                                             "hairColor":{
                                                "r":20,
                                                "g":15,
                                                "b":0,
                                                "bc":1
                                             },
                                             "eyesColor":{
                                                "r":20,
                                                "g":15,
                                                "b":0,
                                                "bc":1
                                             },
                                             "eyebrowsColor":{
                                                "r":20,
                                                "g":15,
                                                "b":0,
                                                "bc":1
                                             },
                                             "lipsColor":{
                                                "r":150,
                                                "g":60,
                                                "b":40,
                                                "bc":1
                                             },
                                             "shirtColor":{
                                                "r":200,
                                                "g":195,
                                                "b":190,
                                                "bc":1
                                             },
                                             "pantsColor":{
                                                "r":20,
                                                "g":15,
                                                "b":10,
                                                "bc":1
                                             },
                                             "shoesColor":{
                                                "r":20,
                                                "g":10,
                                                "b":0,
                                                "bc":1
                                             },
                                             "hasRightBracelet":false,
                                             "hasLeftBracelet":false
                                          }));
                                       }
                                       if(GD.difficulty == 1)
                                       {
                                          for(k in GD.Caravans[nc].People)
                                          {
                                             GD.Caravans[nc].People[k].basePhysical--;
                                             GD.Caravans[nc].People[k].baseAgility -= 2;
                                             GD.Caravans[nc].People[k].baseAccuracy -= 2;
                                          }
                                       }
                                       GD.Caravans[nc].addCargo(21,1);
                                       if(GD.difficulty == 2)
                                       {
                                          GD.Caravans[nc].addCargo(29,15);
                                       }
                                       else
                                       {
                                          GD.Caravans[nc].addCargo(29,3);
                                       }
                                       GD.Caravans[nc].addCargo(6,1);
                                       GD.Caravans[nc].addCargo(3,1);
                                       GD.Caravans[nc].addCargo(2,1);
                                       GD.Caravans[nc].distributeWeapons();
                                       GD.Caravans[nc].distributeAmmo();
                                       obstaclesToPass = [{
                                          "type":32,
                                          "x":36,
                                          "y":40
                                       },{
                                          "type":2,
                                          "x":10,
                                          "y":3
                                       },{
                                          "type":8,
                                          "x":15,
                                          "y":8
                                       },{
                                          "type":3,
                                          "x":23,
                                          "y":6
                                       },{
                                          "type":20,
                                          "x":28,
                                          "y":10
                                       },{
                                          "type":13,
                                          "x":36,
                                          "y":7
                                       },{
                                          "type":4,
                                          "x":44,
                                          "y":2
                                       },{
                                          "type":7,
                                          "x":53,
                                          "y":8
                                       },{
                                          "type":17,
                                          "x":60,
                                          "y":2
                                       },{
                                          "type":8,
                                          "x":65,
                                          "y":5
                                       },{
                                          "type":6,
                                          "x":8,
                                          "y":15
                                       },{
                                          "type":28,
                                          "x":13,
                                          "y":12
                                       },{
                                          "type":21,
                                          "x":18,
                                          "y":19
                                       },{
                                          "type":25,
                                          "x":23,
                                          "y":15
                                       },{
                                          "type":12,
                                          "x":33,
                                          "y":12
                                       },{
                                          "type":7,
                                          "x":40,
                                          "y":16
                                       },{
                                          "type":24,
                                          "x":48,
                                          "y":13
                                       },{
                                          "type":5,
                                          "x":62,
                                          "y":16
                                       },{
                                          "type":29,
                                          "x":66,
                                          "y":11
                                       },{
                                          "type":14,
                                          "x":2,
                                          "y":22
                                       },{
                                          "type":13,
                                          "x":17,
                                          "y":28
                                       },{
                                          "type":6,
                                          "x":20,
                                          "y":23
                                       },{
                                          "type":23,
                                          "x":23,
                                          "y":21
                                       },{
                                          "type":11,
                                          "x":28,
                                          "y":25
                                       },{
                                          "type":17,
                                          "x":35,
                                          "y":27
                                       },{
                                          "type":20,
                                          "x":44,
                                          "y":22
                                       },{
                                          "type":4,
                                          "x":58,
                                          "y":24
                                       },{
                                          "type":15,
                                          "x":64,
                                          "y":26
                                       },{
                                          "type":18,
                                          "x":4,
                                          "y":33
                                       },{
                                          "type":17,
                                          "x":18,
                                          "y":31
                                       },{
                                          "type":8,
                                          "x":26,
                                          "y":37
                                       },{
                                          "type":12,
                                          "x":23,
                                          "y":39
                                       },{
                                          "type":3,
                                          "x":45,
                                          "y":30
                                       },{
                                          "type":15,
                                          "x":52,
                                          "y":36
                                       },{
                                          "type":9,
                                          "x":56,
                                          "y":32
                                       },{
                                          "type":14,
                                          "x":68,
                                          "y":38
                                       },{
                                          "type":20,
                                          "x":8,
                                          "y":46
                                       },{
                                          "type":12,
                                          "x":25,
                                          "y":43
                                       },{
                                          "type":12,
                                          "x":29,
                                          "y":48
                                       },{
                                          "type":17,
                                          "x":23,
                                          "y":41
                                       },{
                                          "type":6,
                                          "x":38,
                                          "y":43
                                       },{
                                          "type":19,
                                          "x":42,
                                          "y":45
                                       },{
                                          "type":15,
                                          "x":49,
                                          "y":44
                                       },{
                                          "type":17,
                                          "x":53,
                                          "y":40
                                       },{
                                          "type":10,
                                          "x":60,
                                          "y":43
                                       },{
                                          "type":7,
                                          "x":5,
                                          "y":52
                                       },{
                                          "type":13,
                                          "x":17,
                                          "y":57
                                       },{
                                          "type":21,
                                          "x":28,
                                          "y":55
                                       },{
                                          "type":6,
                                          "x":28,
                                          "y":59
                                       },{
                                          "type":4,
                                          "x":36,
                                          "y":54
                                       },{
                                          "type":30,
                                          "x":48,
                                          "y":52
                                       },{
                                          "type":19,
                                          "x":59,
                                          "y":56
                                       },{
                                          "type":23,
                                          "x":64,
                                          "y":53
                                       },{
                                          "type":7,
                                          "x":68,
                                          "y":50
                                       },{
                                          "type":6,
                                          "x":6,
                                          "y":68
                                       },{
                                          "type":22,
                                          "x":13,
                                          "y":61
                                       },{
                                          "type":13,
                                          "x":19,
                                          "y":65
                                       },{
                                          "type":7,
                                          "x":22,
                                          "y":63
                                       },{
                                          "type":14,
                                          "x":31,
                                          "y":69
                                       },{
                                          "type":23,
                                          "x":40,
                                          "y":61
                                       },{
                                          "type":22,
                                          "x":48,
                                          "y":64
                                       },{
                                          "type":13,
                                          "x":53,
                                          "y":67
                                       },{
                                          "type":20,
                                          "x":60,
                                          "y":65
                                       }];
                                       openDialogue(9,GD.Caravans[nc],{
                                          "fieldWidth":70,
                                          "fieldHeight":70,
                                          "groupLocations":[null,{
                                             "x":34,
                                             "y":34
                                          }]
                                       },obstaclesToPass);
                                       resetRecentlyInteracted = true;
                                       return false;
                                    }
                                    if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 46 && GD.Story.needToAttackCannibals && !GD.Story.defeatedTheCannibals)
                                    {
                                       GD.Story.defeatedTheCannibals = true;
                                       GD.Story.specificReputations[6] += 10;
                                       nc = GD.Caravans.push(new Caravan(6,mapSymbols)) - 1;
                                       GD.Caravans[nc].name = Texts.fetch(4767);
                                       GD.Caravans[nc].x = Presets.Towns[46].x;
                                       GD.Caravans[nc].y = Presets.Towns[46].y;
                                       GD.Towns[46].locations[0].visible = true;
                                       peopleNum = 15;
                                       if(GD.difficulty == 2)
                                       {
                                          peopleNum = 18;
                                       }
                                       i = 1;
                                       while(i <= peopleNum)
                                       {
                                          GD.Caravans[nc].addPerson(new Character({
                                             "portraitShirt":0,
                                             "hasLeftbracelet":true,
                                             "hasRightBracelet":true
                                          }));
                                          rnd = Math.random();
                                          if(rnd > 0.75)
                                          {
                                             GD.Caravans[nc].addCargo(10,1);
                                          }
                                          else if(rnd > 0.5)
                                          {
                                             GD.Caravans[nc].addCargo(11,1);
                                          }
                                          else if(rnd > 0.25)
                                          {
                                             GD.Caravans[nc].addCargo(8,1);
                                          }
                                          else
                                          {
                                             GD.Caravans[nc].addCargo(15,1);
                                          }
                                          i = Number(i) + 1;
                                       }
                                       if(GD.difficulty == 1)
                                       {
                                          for(k in GD.Caravans[nc].People)
                                          {
                                             GD.Caravans[nc].People[k].basePhysical--;
                                             GD.Caravans[nc].People[k].baseAgility -= 1;
                                             GD.Caravans[nc].People[k].baseAccuracy -= 1;
                                          }
                                       }
                                       GD.Caravans[nc].distributeWeapons();
                                       GD.Caravans[nc].addPerson(new Character({
                                          "name":Texts.fetch(4775),
                                          "gender":1,
                                          "age":35,
                                          "physical":4,
                                          "agility":6,
                                          "accuracy":8,
                                          "intelligence":5,
                                          "portraitShoulders":1,
                                          "portraitHair":29,
                                          "portraitHead":4,
                                          "portraitMouth":7,
                                          "portraitNose":6,
                                          "portraitEyebrows":3,
                                          "portraitEyes":6,
                                          "portraitEars":2,
                                          "portraitBeard":0,
                                          "portraitMoustache":7,
                                          "portraitWhiskers":0,
                                          "portraitShirt":1,
                                          "portraitNecklace":0,
                                          "sleevesType":5,
                                          "skinColor":{
                                             "r":240,
                                             "g":200,
                                             "b":180,
                                             "bc":1
                                          },
                                          "hairColor":{
                                             "r":80,
                                             "g":70,
                                             "b":60,
                                             "bc":1
                                          },
                                          "eyesColor":{
                                             "r":20,
                                             "g":15,
                                             "b":0,
                                             "bc":1
                                          },
                                          "eyebrowsColor":{
                                             "r":20,
                                             "g":15,
                                             "b":0,
                                             "bc":1
                                          },
                                          "lipsColor":{
                                             "r":150,
                                             "g":90,
                                             "b":80,
                                             "bc":1
                                          },
                                          "shirtColor":{
                                             "r":250,
                                             "g":245,
                                             "b":240,
                                             "bc":1
                                          },
                                          "pantsColor":{
                                             "r":120,
                                             "g":120,
                                             "b":120,
                                             "bc":1
                                          },
                                          "shoesColor":{
                                             "r":20,
                                             "g":10,
                                             "b":0,
                                             "bc":1
                                          },
                                          "hasRightBracelet":false,
                                          "hasLeftBracelet":false
                                       }));
                                       GD.Caravans[nc].addCargo(55,1);
                                       GD.Caravans[nc].People[GD.Caravans[nc].People.length - 1].addItemToEquipment(new Item(55,1),true);
                                       GD.Caravans[nc].People[GD.Caravans[nc].People.length - 1].Jacket = 8;
                                       GD.Caravans[nc].addCargo(21,1);
                                       GD.Caravans[nc].addCargo(29,30);
                                       GD.Caravans[nc].People[GD.Caravans[nc].People.length - 1].addItemToEquipment(new Item(21,1),true);
                                       GD.Caravans[nc].People[GD.Caravans[nc].People.length - 1].addItemToEquipment(new Item(29,30),true);
                                       GD.Caravans[nc].People[GD.Caravans[nc].People.length - 1].weapons[0] = 20;
                                       GD.Caravans[nc].distributeAmmo();
                                       obstaclesToPass = [{
                                          "type":35,
                                          "x":38,
                                          "y":23
                                       },{
                                          "type":35,
                                          "x":49,
                                          "y":27
                                       },{
                                          "type":35,
                                          "x":53,
                                          "y":38
                                       },{
                                          "type":35,
                                          "x":49,
                                          "y":49
                                       },{
                                          "type":35,
                                          "x":38,
                                          "y":53
                                       },{
                                          "type":35,
                                          "x":27,
                                          "y":49
                                       },{
                                          "type":35,
                                          "x":23,
                                          "y":38
                                       },{
                                          "type":35,
                                          "x":27,
                                          "y":27
                                       },{
                                          "type":36,
                                          "x":35,
                                          "y":35
                                       },{
                                          "type":7,
                                          "x":10,
                                          "y":3
                                       },{
                                          "type":12,
                                          "x":15,
                                          "y":8
                                       },{
                                          "type":9,
                                          "x":23,
                                          "y":6
                                       },{
                                          "type":15,
                                          "x":28,
                                          "y":10
                                       },{
                                          "type":13,
                                          "x":36,
                                          "y":7
                                       },{
                                          "type":11,
                                          "x":44,
                                          "y":2
                                       },{
                                          "type":12,
                                          "x":53,
                                          "y":8
                                       },{
                                          "type":19,
                                          "x":60,
                                          "y":2
                                       },{
                                          "type":7,
                                          "x":65,
                                          "y":5
                                       },{
                                          "type":12,
                                          "x":8,
                                          "y":15
                                       },{
                                          "type":23,
                                          "x":13,
                                          "y":12
                                       },{
                                          "type":13,
                                          "x":18,
                                          "y":19
                                       },{
                                          "type":22,
                                          "x":23,
                                          "y":15
                                       },{
                                          "type":20,
                                          "x":33,
                                          "y":12
                                       },{
                                          "type":17,
                                          "x":40,
                                          "y":16
                                       },{
                                          "type":15,
                                          "x":48,
                                          "y":13
                                       },{
                                          "type":8,
                                          "x":62,
                                          "y":16
                                       },{
                                          "type":3,
                                          "x":66,
                                          "y":11
                                       },{
                                          "type":10,
                                          "x":2,
                                          "y":22
                                       },{
                                          "type":5,
                                          "x":17,
                                          "y":28
                                       },{
                                          "type":2,
                                          "x":20,
                                          "y":23
                                       },{
                                          "type":16,
                                          "x":23,
                                          "y":21
                                       },{
                                          "type":7,
                                          "x":28,
                                          "y":25
                                       },{
                                          "type":11,
                                          "x":35,
                                          "y":27
                                       },{
                                          "type":22,
                                          "x":44,
                                          "y":22
                                       },{
                                          "type":2,
                                          "x":58,
                                          "y":24
                                       },{
                                          "type":9,
                                          "x":64,
                                          "y":26
                                       },{
                                          "type":15,
                                          "x":4,
                                          "y":33
                                       },{
                                          "type":18,
                                          "x":18,
                                          "y":31
                                       },{
                                          "type":20,
                                          "x":26,
                                          "y":37
                                       },{
                                          "type":8,
                                          "x":23,
                                          "y":39
                                       },{
                                          "type":6,
                                          "x":45,
                                          "y":30
                                       },{
                                          "type":8,
                                          "x":52,
                                          "y":36
                                       },{
                                          "type":8,
                                          "x":56,
                                          "y":32
                                       },{
                                          "type":20,
                                          "x":68,
                                          "y":38
                                       },{
                                          "type":8,
                                          "x":8,
                                          "y":46
                                       },{
                                          "type":17,
                                          "x":25,
                                          "y":43
                                       },{
                                          "type":11,
                                          "x":29,
                                          "y":48
                                       },{
                                          "type":19,
                                          "x":23,
                                          "y":41
                                       },{
                                          "type":9,
                                          "x":38,
                                          "y":43
                                       },{
                                          "type":12,
                                          "x":42,
                                          "y":45
                                       },{
                                          "type":21,
                                          "x":49,
                                          "y":44
                                       },{
                                          "type":2,
                                          "x":53,
                                          "y":40
                                       },{
                                          "type":8,
                                          "x":60,
                                          "y":43
                                       },{
                                          "type":5,
                                          "x":5,
                                          "y":52
                                       },{
                                          "type":11,
                                          "x":17,
                                          "y":57
                                       },{
                                          "type":7,
                                          "x":28,
                                          "y":55
                                       },{
                                          "type":21,
                                          "x":28,
                                          "y":59
                                       },{
                                          "type":17,
                                          "x":38,
                                          "y":56
                                       },{
                                          "type":11,
                                          "x":48,
                                          "y":52
                                       },{
                                          "type":16,
                                          "x":59,
                                          "y":56
                                       },{
                                          "type":21,
                                          "x":64,
                                          "y":53
                                       },{
                                          "type":14,
                                          "x":68,
                                          "y":50
                                       },{
                                          "type":19,
                                          "x":6,
                                          "y":68
                                       },{
                                          "type":4,
                                          "x":13,
                                          "y":61
                                       },{
                                          "type":16,
                                          "x":19,
                                          "y":65
                                       },{
                                          "type":13,
                                          "x":22,
                                          "y":63
                                       },{
                                          "type":9,
                                          "x":31,
                                          "y":69
                                       },{
                                          "type":18,
                                          "x":40,
                                          "y":61
                                       },{
                                          "type":2,
                                          "x":48,
                                          "y":64
                                       },{
                                          "type":5,
                                          "x":53,
                                          "y":67
                                       },{
                                          "type":4,
                                          "x":60,
                                          "y":65
                                       }];
                                       GD.Towns[46].addToStock(1,75,GD.Towns[46].playersStorage);
                                       GD.Towns[46].addToStock(173,1,GD.Towns[46].playersStorage);
                                       GD.Towns[46].addToStock(174,123,GD.Towns[46].playersStorage);
                                       openDialogue(9,GD.Caravans[nc],{
                                          "fieldWidth":70,
                                          "fieldHeight":70,
                                          "groupLocations":[null,{
                                             "x":34,
                                             "y":34
                                          }]
                                       },obstaclesToPass);
                                       resetRecentlyInteracted = true;
                                       return false;
                                    }
                                    if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 47 && GD.Story.needToAttckWinchester && !GD.Story.killedWinchester)
                                    {
                                       GD.eliminateAllRandomGroups(18);
                                       GD.Story.killedWinchester = true;
                                       GD.Story.specificReputations[6] += 10;
                                       nc = GD.Caravans.push(new Caravan(18,mapSymbols)) - 1;
                                       GD.Caravans[nc].x = Presets.Towns[47].x;
                                       GD.Caravans[nc].y = Presets.Towns[47].y;
                                       peopleNum = 9;
                                       if(GD.difficulty == 2)
                                       {
                                          peopleNum = 10;
                                       }
                                       i = 1;
                                       while(i <= peopleNum)
                                       {
                                          GD.Caravans[nc].addPerson(new Character({
                                             "portraitShirt":1,
                                             "shirtColor":{
                                                "r":255,
                                                "g":255,
                                                "b":255,
                                                "bc":1
                                             },
                                             "pantsColor":{
                                                "r":255,
                                                "g":255,
                                                "b":255,
                                                "bc":1
                                             }
                                          }));
                                          i = Number(i) + 1;
                                       }
                                       if(GD.difficulty == 1)
                                       {
                                          for(k in GD.Caravans[nc].People)
                                          {
                                             GD.Caravans[nc].People[k].basePhysical--;
                                             GD.Caravans[nc].People[k].baseAgility -= 2;
                                             GD.Caravans[nc].People[k].baseAccuracy -= 2;
                                          }
                                       }
                                       GD.Caravans[nc].addCargo(153,peopleNum);
                                       GD.Caravans[nc].addCargo(141,Math.round(peopleNum * 0.8));
                                       GD.Caravans[nc].addCargo(143,Math.round(peopleNum * 0.4));
                                       GD.Caravans[nc].addCargo(35,peopleNum * 8);
                                       GD.Caravans[nc].addCargo(144,peopleNum * 4);
                                       GD.Caravans[nc].distributeWeapons();
                                       GD.Caravans[nc].distributeAmmo();
                                       GD.Caravans[nc].distributeArmor();
                                       obstaclesToPass = [{
                                          "type":33,
                                          "x":41,
                                          "y":23
                                       },{
                                          "type":32,
                                          "x":78,
                                          "y":31
                                       },{
                                          "type":33,
                                          "x":57,
                                          "y":34
                                       },{
                                          "type":32,
                                          "x":12,
                                          "y":45
                                       },{
                                          "type":32,
                                          "x":35,
                                          "y":56
                                       },{
                                          "type":32,
                                          "x":68,
                                          "y":55
                                       },{
                                          "type":33,
                                          "x":95,
                                          "y":59
                                       },{
                                          "type":33,
                                          "x":57,
                                          "y":67
                                       },{
                                          "type":33,
                                          "x":37,
                                          "y":81
                                       },{
                                          "type":12,
                                          "x":4,
                                          "y":5
                                       },{
                                          "type":25,
                                          "x":37,
                                          "y":7
                                       },{
                                          "type":28,
                                          "x":51,
                                          "y":3
                                       },{
                                          "type":2,
                                          "x":15,
                                          "y":15
                                       },{
                                          "type":21,
                                          "x":34,
                                          "y":12
                                       },{
                                          "type":19,
                                          "x":43,
                                          "y":17
                                       },{
                                          "type":27,
                                          "x":65,
                                          "y":22
                                       },{
                                          "type":31,
                                          "x":8,
                                          "y":25
                                       },{
                                          "type":6,
                                          "x":59,
                                          "y":24
                                       },{
                                          "type":23,
                                          "x":25,
                                          "y":35
                                       },{
                                          "type":4,
                                          "x":92,
                                          "y":7
                                       },{
                                          "type":8,
                                          "x":85,
                                          "y":43
                                       },{
                                          "type":27,
                                          "x":6,
                                          "y":56
                                       },{
                                          "type":28,
                                          "x":12,
                                          "y":63
                                       },{
                                          "type":5,
                                          "x":3,
                                          "y":65
                                       },{
                                          "type":22,
                                          "x":63,
                                          "y":64
                                       },{
                                          "type":7,
                                          "x":75,
                                          "y":68
                                       },{
                                          "type":11,
                                          "x":47,
                                          "y":74
                                       },{
                                          "type":31,
                                          "x":58,
                                          "y":72
                                       },{
                                          "type":25,
                                          "x":63,
                                          "y":74
                                       },{
                                          "type":6,
                                          "x":77,
                                          "y":79
                                       },{
                                          "type":23,
                                          "x":85,
                                          "y":71
                                       },{
                                          "type":19,
                                          "x":94,
                                          "y":76
                                       },{
                                          "type":9,
                                          "x":25,
                                          "y":89
                                       },{
                                          "type":29,
                                          "x":31,
                                          "y":97
                                       },{
                                          "type":25,
                                          "x":82,
                                          "y":93
                                       },{
                                          "type":4,
                                          "x":94,
                                          "y":98
                                       }];
                                       openDialogue(9,GD.Caravans[nc],{
                                          "fieldWidth":100,
                                          "fieldHeight":100,
                                          "groupLocations":[null,{
                                             "x":49,
                                             "y":49
                                          }]
                                       },obstaclesToPass);
                                       resetRecentlyInteracted = true;
                                       return false;
                                    }
                                    if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 68 && GD.Story.heardAboutReginsPlan && !GD.Story.reginsMenDefeated)
                                    {
                                       GD.executeMajorEvent(70);
                                       nc = GD.Caravans.push(new Caravan(25,mapSymbols)) - 1;
                                       GD.Caravans[nc].x = Presets.Towns[68].x;
                                       GD.Caravans[nc].y = Presets.Towns[68].y;
                                       peopleNum = Math.round(GD.Story.reginsMenCount);
                                       GD.equipRandomCaravan(GD.Caravans[nc],peopleNum);
                                       obstaclesToPass = [{
                                          "type":37,
                                          "x":54,
                                          "y":51
                                       },{
                                          "type":37,
                                          "x":68,
                                          "y":51
                                       },{
                                          "type":37,
                                          "x":40,
                                          "y":51
                                       },{
                                          "type":37,
                                          "x":54,
                                          "y":61
                                       },{
                                          "type":37,
                                          "x":54,
                                          "y":41
                                       },{
                                          "type":12,
                                          "x":4,
                                          "y":5
                                       },{
                                          "type":25,
                                          "x":37,
                                          "y":7
                                       },{
                                          "type":28,
                                          "x":51,
                                          "y":3
                                       },{
                                          "type":2,
                                          "x":15,
                                          "y":15
                                       },{
                                          "type":21,
                                          "x":34,
                                          "y":12
                                       },{
                                          "type":19,
                                          "x":43,
                                          "y":17
                                       },{
                                          "type":27,
                                          "x":65,
                                          "y":22
                                       },{
                                          "type":31,
                                          "x":8,
                                          "y":25
                                       },{
                                          "type":6,
                                          "x":59,
                                          "y":24
                                       },{
                                          "type":23,
                                          "x":25,
                                          "y":35
                                       },{
                                          "type":4,
                                          "x":92,
                                          "y":7
                                       },{
                                          "type":8,
                                          "x":85,
                                          "y":43
                                       },{
                                          "type":27,
                                          "x":6,
                                          "y":56
                                       },{
                                          "type":28,
                                          "x":12,
                                          "y":63
                                       },{
                                          "type":5,
                                          "x":3,
                                          "y":65
                                       },{
                                          "type":22,
                                          "x":63,
                                          "y":64
                                       },{
                                          "type":7,
                                          "x":75,
                                          "y":68
                                       },{
                                          "type":11,
                                          "x":47,
                                          "y":74
                                       },{
                                          "type":31,
                                          "x":58,
                                          "y":72
                                       },{
                                          "type":25,
                                          "x":63,
                                          "y":74
                                       },{
                                          "type":6,
                                          "x":77,
                                          "y":79
                                       },{
                                          "type":23,
                                          "x":85,
                                          "y":71
                                       },{
                                          "type":19,
                                          "x":94,
                                          "y":76
                                       },{
                                          "type":9,
                                          "x":25,
                                          "y":89
                                       },{
                                          "type":29,
                                          "x":31,
                                          "y":97
                                       },{
                                          "type":25,
                                          "x":82,
                                          "y":93
                                       },{
                                          "type":4,
                                          "x":94,
                                          "y":98
                                       }];
                                       openDialogue(9,GD.Caravans[nc],{
                                          "fieldWidth":100,
                                          "fieldHeight":100,
                                          "groupLocations":[null,{
                                             "x":49,
                                             "y":49
                                          }]
                                       },obstaclesToPass);
                                       resetRecentlyInteracted = true;
                                       return false;
                                    }
                                    if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 18 && GD.Story.fafnirsMenAreWithYou)
                                    {
                                       eventsToExecute.push(75);
                                       enterTown(GD.Caravans[i].nearbyTowns[j]);
                                    }
                                    else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 22 && GD.Story.discoveredLoisLocation && !GD.Story.enteredSaxaulTreeBefore && !GD.Story.loisIsDead && !GD.Story.drekarDefeated)
                                    {
                                       GD.Story.enteredSaxaulTreeBefore = true;
                                       openDialogue(10);
                                    }
                                    else
                                    {
                                       if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 20 && GD.Story.fafnirIsMadAtYou)
                                       {
                                          GD.setMode(7,9);
                                          return;
                                       }
                                       if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 19)
                                       {
                                          spencerWithYou = false;
                                          for(k in GD.Caravans[0].People)
                                          {
                                             if(GD.Caravans[0].People[k].specialPurpose == 3)
                                             {
                                                spencerWithYou = true;
                                                break;
                                             }
                                          }
                                          if(spencerWithYou && GD.Story.dialogueDefaults[15] && !GD.Story.broughtSpencerRiceToKivi)
                                          {
                                             GD.Story.dialogueDefaults[15] = 641;
                                          }
                                          enterTown(GD.Caravans[i].nearbyTowns[j]);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 15 && GD.Story.freedOlaf && !GD.Story.foundOutAboutTheBunker)
                                       {
                                          GD.Story.foundOutAboutTheBunker = true;
                                          eventsToExecute.push(41);
                                          openDialogue(21);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 37 && GD.Story.laMissionInProgress == 1 && GD.Story.killedWinchester)
                                       {
                                          k = 0;
                                          while(k < GD.Caravans[0].People.length)
                                          {
                                             if(GD.Caravans[0].People[k].specialPurpose == 8)
                                             {
                                                GD.Caravans[0].removePerson(k,true);
                                                k = Number(k) - 1;
                                             }
                                             k = Number(k) + 1;
                                          }
                                          enterTown(GD.Caravans[i].nearbyTowns[j]);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 47 && GD.Story.laMissionInProgress == 1 && GD.Story.killedWinchester && !GD.Story.doneWithTheWinchester)
                                       {
                                          if(!GD.Story.broughtEliahsManToWinchester)
                                          {
                                             k = 0;
                                             while(k < GD.Caravans[0].People.length)
                                             {
                                                if(GD.Caravans[0].People[k].specialPurpose == 9)
                                                {
                                                   GD.Caravans[0].removePerson(k,true);
                                                   k = Number(k) - 1;
                                                   GD.Towns[47].population++;
                                                   GD.Story.broughtEliahsManToWinchester = true;
                                                }
                                                k = Number(k) + 1;
                                             }
                                          }
                                          if(GD.Story.bringingWorkers)
                                          {
                                             k = 0;
                                             while(k < GD.Caravans[0].People.length)
                                             {
                                                if(GD.Caravans[0].People[k].specialPurpose == 10)
                                                {
                                                   GD.Caravans[0].removePerson(k,true);
                                                   k = Number(k) - 1;
                                                   GD.Towns[47].population++;
                                                }
                                                k = Number(k) + 1;
                                             }
                                             if(GD.Towns[47].population < 16)
                                             {
                                                if(GD.Story.failedToBringWorkers)
                                                {
                                                   GD.Story.failedToBringWorkersForTheSecondTime = true;
                                                }
                                                else
                                                {
                                                   GD.Story.failedToBringWorkers = true;
                                                }
                                             }
                                             if(GD.Story.broughtEliahsManToWinchester && (GD.Towns[47].population >= 16 || GD.Story.failedToBringWorkersForTheSecondTime))
                                             {
                                                eventsToExecute.push(59);
                                             }
                                             GD.Story.bringingWorkers = false;
                                          }
                                          enterTown(GD.Caravans[i].nearbyTowns[j]);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 43 && GD.Story.youAreAcceptedToLiberationArmy && !GD.Story.lipasMetYou)
                                       {
                                          GD.Story.lipasMetYou = true;
                                          GD.Story.dialogueDefaults[28] = 1671;
                                          openDialogue(27);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Caravans[i].nearbyTowns[j] == 15 && GD.Story.takingYourMenToBunker && !GD.Story.tookYourPeopleToBunker)
                                       {
                                          eventsToExecute.push(88);
                                          enterTown(GD.Caravans[i].nearbyTowns[j]);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 1 && GD.Caravans[i].nearbyTowns[j] == GD.Story.qgMissionTown1 && GD.Story.qgMissionStage == 1)
                                       {
                                          eventsToExecute.push(92);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 1 && GD.Caravans[i].nearbyTowns[j] == GD.Story.qgMissionTown2 && GD.Story.qgMissionStage == 2)
                                       {
                                          eventsToExecute.push(93);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 2 && GD.Caravans[i].nearbyTowns[j] == GD.Story.qgMissionTown1 && GD.Story.qgMissionStage == 1)
                                       {
                                          eventsToExecute.push(96);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 4 && GD.Story.qgMissionStage == 2)
                                       {
                                          eventsToExecute.push(99);
                                          enterTown(GD.Caravans[i].nearbyTowns[j]);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 5 && GD.Caravans[i].nearbyTowns[j] == GD.Story.qgMissionTown1 && GD.Story.qgMissionStage == 1)
                                       {
                                          eventsToExecute.push(101);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 6 && GD.Caravans[i].nearbyTowns[j] == GD.Story.qgMissionTown1 && GD.Story.qgMissionStage == 1)
                                       {
                                          eventsToExecute.push(102);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 7 && GD.Caravans[i].nearbyTowns[j] == GD.Story.qgMissionTown1 && GD.Story.qgMissionStage == 1)
                                       {
                                          eventsToExecute.push(103);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 7 && GD.Caravans[i].nearbyTowns[j] == 5 && GD.Story.qgMissionStage == 2)
                                       {
                                          eventsToExecute.push(104);
                                       }
                                       else if(GD.storyMode && GD.Story is Caravaneer2MainStory && GD.Story.qgMissionInProgress == 8 && GD.Story.qgMissionStage == 2)
                                       {
                                          eventsToExecute.push(106);
                                       }
                                       else if(!denyEntrance)
                                       {
                                          enterTown(GD.Caravans[i].nearbyTowns[j]);
                                          return;
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
                  for(j in GD.Caravans[i].nearbyCaravans)
                  {
                     if(betweenCaravans[i][j] <= 16)
                     {
                        if(GD.Caravans[i].recentlyInteractedCaravans.indexOf(GD.Caravans[i].nearbyCaravans[j]) == -1)
                        {
                           if(i != 0 && GD.Caravans[i].nearbyCaravans[j] != GD.Caravans[0] && (checkBehavior(GD.Caravans[i],GD.Caravans[i].nearbyCaravans[j],betweenCaravans[i][j]) > 0 || checkBehavior(GD.Caravans[i].nearbyCaravans[j],GD.Caravans[i],betweenCaravans[i][j]) > 0))
                           {
                              simulateBattle(GD.Caravans[i],GD.Caravans[i].nearbyCaravans[j]);
                           }
                           if((i == 0 || GD.Caravans[i].nearbyCaravans[j] == GD.Caravans[0]) && GD.Caravans[0].overTown == null && GD.Caravans[i].nearbyCaravans[j].overTown == null)
                           {
                              if(i == 0)
                              {
                                 theOtherCaravan = GD.Caravans[i].nearbyCaravans[j];
                              }
                              else
                              {
                                 theOtherCaravan = GD.Caravans[i];
                              }
                              if(theOtherCaravan.specialPurpose == 20)
                              {
                                 GD.executeMajorEvent(98,theOtherCaravan);
                              }
                              else
                              {
                                 GD.consumeFromLastPoint(theOtherCaravan);
                                 if(checkBehavior(theOtherCaravan,GD.Caravans[0],betweenCaravans[i][j]) > 0)
                                 {
                                    openDialogue(2,theOtherCaravan);
                                 }
                                 else if(GD.interactWithFriendlyCaravans)
                                 {
                                    openDialogue(3,theOtherCaravan);
                                 }
                              }
                           }
                           if(!((i == 0 || GD.Caravans[i].nearbyCaravans[j] == GD.Caravans[0]) && (GD.Caravans[0].overTown != null || GD.Caravans[i].nearbyCaravans[j].overTown != null)))
                           {
                              GD.Caravans[i].recentlyInteractedCaravans.push(GD.Caravans[i].nearbyCaravans[j]);
                              GD.Caravans[i].nearbyCaravans[j].recentlyInteractedCaravans.push(GD.Caravans[i]);
                           }
                        }
                     }
                  }
               }
            }
            if(Math.random() < 0.002)
            {
               GD.windDirection = Math.random() * 3.141592653589793 * 2;
               windShift = Math.sqrt(Math.random());
               if(Math.random() < 0.75)
               {
                  GD.windStrength = 20 - windShift * 20;
               }
               else
               {
                  GD.windStrength = 20 + windShift * 40;
               }
            }
            t = Number(t) + 1;
         }
         if(resetRecentlyInteracted)
         {
            GD.Caravans[0].recentlyInteractedTowns = [];
         }
         if(GD.gameSpeed > 0 || justInitiated)
         {
            GD.Time += 60 * GD.gameSpeed * 4;
            windSymbol.visible = GD.Caravans[0].hasWindPowered;
            if(windSymbol.visible)
            {
               windArrowMask.y = 13 - Math.min(GD.windStrength / 60 * 26,30);
               windArrow.rotation = GD.windDirection * MathFunctions.Rad2Deg;
               windSpeedText.text = Texts.fetch(6).toUpperCase() + ": " + Math.round(GD.windStrength * 10) / 10 + " " + Texts.fetch(10);
            }
            if(GD.updatingEconomy)
            {
               if(GD.itemsToUpdate.length == 0)
               {
                  GD.updateEconomy(true);
                  GD.updatingEconomy = false;
               }
               else
               {
                  GD.calculatePriceForItem(GD.itemsToUpdate.shift());
               }
            }
            if(GD.storyMode && GD.Story is Caravaneer2MainStory)
            {
               if(GD.Story.releasingOzbetDefenders && GD.Time >= GD.Story.nextBunchTime)
               {
                  eventsToExecute.push(47);
               }
               if(GD.Story.bombSet && !GD.Story.bombExploded && GD.Time - GD.Story.bombSetAt > 43200)
               {
                  eventsToExecute.push(109);
               }
            }
            for(t in townSymbols)
            {
               townSymbols[t].visible = false;
            }
            for(i in GD.Caravans)
            {
               if(GD.Caravans[i].mapSymbol is Sprite)
               {
                  GD.Caravans[i].mapSymbol.visible = false;
               }
            }
            for(j in GD.Caravans[0].nearbyTowns)
            {
               if(GD.Towns[GD.Caravans[0].nearbyTowns[j]].active)
               {
                  if(caravansToTowns[0][j] <= GD.Towns[GD.Caravans[0].nearbyTowns[j]].noticeability * GD.Caravans[0].sight)
                  {
                     GD.Towns[GD.Caravans[0].nearbyTowns[j]].discovered = true;
                     townSymbols[GD.Caravans[0].nearbyTowns[j]].visible = true;
                     townSymbols[GD.Caravans[0].nearbyTowns[j]].x = Presets.Towns[GD.Caravans[0].nearbyTowns[j]].x - GD.Caravans[0].x + 325;
                     townSymbols[GD.Caravans[0].nearbyTowns[j]].y = Presets.Towns[GD.Caravans[0].nearbyTowns[j]].y - GD.Caravans[0].y + 248;
                  }
               }
            }
            for(i in GD.Caravans)
            {
               if(GD.Caravans[i].active && GD.Caravans[i].category == 5)
               {
                  if(GD.Caravans[i].moving && GD.gameSpeed > 0 && !(GD.keepDialogues is Array))
                  {
                     GD.Caravans[i].x += GD.Caravans[i].moveX * GD.gameSpeed;
                     GD.Caravans[i].y += GD.Caravans[i].moveY * GD.gameSpeed;
                     GD.Caravans[i].stepsLeft -= GD.gameSpeed;
                  }
                  GD.Caravans[i].squareX = Math.floor(GD.Caravans[i].x / GD.squareSize);
                  GD.Caravans[i].squareY = Math.floor(GD.Caravans[i].y / GD.squareSize);
                  if(GD.Caravans[i].stepsLeft <= 0)
                  {
                     GD.arriveAtRoutePoint(GD.Caravans[i]);
                  }
                  GD.Caravans[i].nearbyCaravans = [];
                  if(Math.abs(GD.Caravans[i].squareX - GD.Caravans[0].squareX) <= 2 && Math.abs(GD.Caravans[i].squareY - GD.Caravans[0].squareY) <= 2)
                  {
                     GD.Caravans[0].nearbyCaravans.push(GD.Caravans[i]);
                     GD.Caravans[i].nearbyCaravans.push(GD.Caravans[0]);
                     if(!(betweenCaravans[i] is Array))
                     {
                        betweenCaravans[i] = [];
                     }
                     if(!(betweenCaravans[0] is Array))
                     {
                        betweenCaravans[0] = [];
                     }
                     betweenCaravans[i][0] = betweenCaravans[0][GD.Caravans[0].nearbyCaravans.length - 1] = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[0].x,GD.Caravans[0].y);
                     if(betweenCaravans[i][0] <= 16 && GD.Caravans[0].overTown == null && GD.Caravans[i].overTown == null && GD.Caravans[i].recentlyInteractedCaravans.indexOf(GD.Caravans[0]) == -1 && GD.Caravans[0].recentlyInteractedCaravans.indexOf(GD.Caravans[1]) == -1)
                     {
                        GD.consumeFromLastPoint(GD.Caravans[i]);
                        if(checkBehavior(GD.Caravans[i],GD.Caravans[0],betweenCaravans[i][0]) > 0)
                        {
                           openDialogue(2,GD.Caravans[i]);
                        }
                        else if(GD.interactWithFriendlyCaravans)
                        {
                           openDialogue(3,GD.Caravans[i]);
                        }
                        GD.Caravans[i].recentlyInteractedCaravans.push(GD.Caravans[0]);
                        GD.Caravans[0].recentlyInteractedCaravans.push(GD.Caravans[i]);
                     }
                  }
               }
            }
            for(i in GD.Caravans)
            {
               if(GD.Caravans[i].active && betweenCaravans[i] is Array)
               {
                  victims = [];
                  attackers = [];
                  for(j in GD.Caravans[i].nearbyCaravans)
                  {
                     if(betweenCaravans[i][j] <= GD.Caravans[i].nearbyCaravans[j].noticeability * GD.Caravans[i].sight)
                     {
                        if(i == 0 && GD.Caravans[i].nearbyCaravans[j].mapSymbol is Sprite)
                        {
                           GD.Caravans[i].nearbyCaravans[j].mapSymbol.visible = true;
                           if(GD.Caravans[i].nearbyCaravans[j].category == 5)
                           {
                              GD.revealedFactions[23] = true;
                           }
                           if(GD.difficulty == 1 || GD.Caravans[i].nearbyCaravans[j].identified || betweenCaravans[i][j] <= GD.Caravans[i].sight * 140)
                           {
                              GD.Caravans[i].nearbyCaravans[j].mapSymbolText1.text = GD.Caravans[i].nearbyCaravans[j].name;
                              GD.Caravans[i].nearbyCaravans[j].identified = true;
                           }
                           else
                           {
                              GD.Caravans[i].nearbyCaravans[j].mapSymbolText1.text = Texts.fetch(771);
                           }
                           if(GD.difficulty == 1 || GD.Caravans[i].nearbyCaravans[j].menCountPhase == 3 || betweenCaravans[i][j] <= GD.Caravans[i].sight * 100)
                           {
                              GD.Caravans[i].nearbyCaravans[j].mapSymbolText2.text = "(" + manOrMen(GD.Caravans[i].nearbyCaravans[j].People.length) + ")";
                              GD.Caravans[i].nearbyCaravans[j].menCountPhase = 3;
                           }
                           else if(GD.Caravans[i].nearbyCaravans[j].menCountPhase == 2 || betweenCaravans[i][j] <= GD.Caravans[i].sight * 150)
                           {
                              min = Math.floor(GD.Caravans[i].nearbyCaravans[j].People.length / 3) * 3;
                              max = min + 3;
                              min = Math.max(1,min);
                              GD.Caravans[i].nearbyCaravans[j].mapSymbolText2.text = "(" + min + "-" + manOrMen(max) + ")";
                              GD.Caravans[i].nearbyCaravans[j].menCountPhase = 2;
                           }
                           else if(GD.Caravans[i].nearbyCaravans[j].menCountPhase == 1 || betweenCaravans[i][j] <= GD.Caravans[i].sight * 190)
                           {
                              if(GD.Caravans[i].nearbyCaravans[j].People.length > 12)
                              {
                                 GD.Caravans[i].nearbyCaravans[j].mapSymbolText2.text = "(" + Texts.fetch(774) + ")";
                              }
                              else if(GD.Caravans[i].nearbyCaravans[j].People.length > 6)
                              {
                                 GD.Caravans[i].nearbyCaravans[j].mapSymbolText2.text = "(" + Texts.fetch(775) + ")";
                              }
                              else
                              {
                                 GD.Caravans[i].nearbyCaravans[j].mapSymbolText2.text = "(" + Texts.fetch(776) + ")";
                              }
                              GD.Caravans[i].nearbyCaravans[j].menCountPhase = 1;
                           }
                           else
                           {
                              GD.Caravans[i].nearbyCaravans[j].mapSymbolText2.text = "(" + Texts.fetch(777) + ")";
                           }
                        }
                        if(i != 0 && GD.Caravans[i].nearbyCaravans[j].overTown == null && GD.Caravans[i].category != 5)
                        {
                           behavior = checkBehavior(GD.Caravans[i],GD.Caravans[i].nearbyCaravans[j],betweenCaravans[i][j]);
                           if(behavior > 0 && !GD.Caravans[i].concentrated)
                           {
                              victims.push({
                                 "caravan":GD.Caravans[i].nearbyCaravans[j],
                                 "strength":behavior
                              });
                           }
                           if(behavior < 0 && GD.Caravans[i].overTown == null && !GD.Caravans[i].nearbyCaravans[j].concentrated)
                           {
                              attackers.push({
                                 "caravan":GD.Caravans[i].nearbyCaravans[j],
                                 "strength":behavior,
                                 "angle":MathFunctions.CalcRevYAngle(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[i].nearbyCaravans[j].x,GD.Caravans[i].nearbyCaravans[j].y)
                              });
                           }
                        }
                     }
                  }
                  attacking = false;
                  escaping = false;
                  if(victims.length > 0 && attackers.length == 0)
                  {
                     victims.sortOn("strength",18);
                     while(victims.length > 0)
                     {
                        target = victims.shift().caravan;
                        directAngle = MathFunctions.CalcRevYAngle(GD.Caravans[i].x,GD.Caravans[i].y,target.x,target.y);
                        if(!target.moving)
                        {
                           GD.Caravans[i].direction = directAngle;
                           break;
                        }
                        beta = MathFunctions.AngleDifference(target.direction,directAngle);
                        if(Math.abs(beta) > 3.141592653589793 / 2 || target.speed <= GD.Caravans[i].speed)
                        {
                           gamma = Math.asin(target.speed / GD.Caravans[i].speed * Math.sin(beta));
                           if(!isNaN(gamma))
                           {
                              GD.Caravans[i].direction = directAngle - gamma;
                              break;
                           }
                        }
                        else if(victims.length == 0 && target.speed / GD.Caravans[i].speed < 1.5)
                        {
                           GD.Caravans[i].direction = directAngle;
                           break;
                        }
                     }
                     GD.Caravans[i].moving = true;
                     attacking = true;
                     GD.Caravans[i].deflected = true;
                  }
                  if(attackers.length > 0)
                  {
                     attackers.sortOn("angle",18);
                     biggestSliceSize = 0;
                     for(j in attackers)
                     {
                        if(j < attackers.length - 1)
                        {
                           nextPoint = attackers[j + 1].angle;
                        }
                        else
                        {
                           nextPoint = attackers[0].angle + MathFunctions.dblPI;
                        }
                        currentSlice = nextPoint - attackers[j].angle;
                        if(currentSlice > biggestSliceSize)
                        {
                           biggestSliceSize = currentSlice;
                           biggestSliceInd = j;
                        }
                     }
                     GD.Caravans[i].direction = attackers[biggestSliceInd].angle + biggestSliceSize / 2;
                     GD.Caravans[i].moving = true;
                     escaping = true;
                     GD.Caravans[i].deflected = true;
                     GD.Caravans[i].moving = true;
                  }
                  if(i != 0 && !attacking && !escaping && GD.Caravans[i].category != 5)
                  {
                     if(GD.Caravans[i].nowGoingToTown != null && GD.Caravans[i].deflected)
                     {
                        if(GD.Caravans[i].category == 2)
                        {
                           GD.directCaravanToNearestTown(i);
                        }
                        else
                        {
                           GD.directCaravanToTown(GD.Caravans[i],GD.Caravans[i].nowGoingToTown);
                        }
                     }
                     if(GD.Caravans[i].guardPosition is Object)
                     {
                        dist = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[i].guardPosition.x,GD.Caravans[i].guardPosition.y);
                        if(GD.Caravans[i].looseGuard)
                        {
                           if(dist > 300 + GD.Caravans[i].mapSpeed * GD.gameSpeed)
                           {
                              GD.Caravans[i].direction = MathFunctions.CalcRevYAngle(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[i].guardPosition.x,GD.Caravans[i].guardPosition.y);
                           }
                           else if(Math.random() < 0.01)
                           {
                              GD.Caravans[i].direction = Math.random() * MathFunctions.dblPI;
                           }
                        }
                        else if(dist > GD.Caravans[i].mapSpeed * GD.gameSpeed)
                        {
                           GD.Caravans[i].direction = MathFunctions.CalcRevYAngle(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[i].guardPosition.x,GD.Caravans[i].guardPosition.y);
                           GD.Caravans[i].moving = true;
                        }
                        else
                        {
                           GD.Caravans[i].moving = false;
                        }
                     }
                     else if(!GD.Caravans[i].concentrated && GD.Caravans[i].aggressive && (GD.Caravans[i].specialPurpose == 2 || GD.Caravans[i].specialPurpose == 3 || GD.Caravans[i].specialPurpose == 4 || GD.Caravans[i].specialPurpose == 5 || GD.Caravans[i].specialPurpose == 8 || GD.Caravans[i].specialPurpose == 9 || GD.Caravans[i].specialPurpose == 10 || GD.Caravans[i].specialPurpose == 11 || GD.Caravans[i].specialPurpose == 13 || GD.Caravans[i].specialPurpose == 17 || GD.Caravans[i].specialPurpose == 18 || GD.Caravans[i].specialPurpose == 21))
                     {
                        for(j in GD.Caravans)
                        {
                           if(GD.Caravans[j].active)
                           {
                              if((GD.Caravans[i].specialPurpose == 2 || GD.Caravans[i].specialPurpose == 4 || GD.Caravans[i].specialPurpose == 5) && GD.Caravans[j].specialPurpose == 3 || (GD.Caravans[j].specialPurpose == 2 || GD.Caravans[j].specialPurpose == 4 || GD.Caravans[j].specialPurpose == 5) && GD.Caravans[i].specialPurpose == 3 || GD.Caravans[i].specialPurpose == 8 && GD.Caravans[j].specialPurpose == 9 || GD.Caravans[i].specialPurpose == 9 && GD.Caravans[j].specialPurpose == 8 || GD.Caravans[i].specialPurpose == 9 && j == 0 && GD.Story.startedSuppressRebelionOperation || GD.Caravans[i].specialPurpose == 10 && GD.Caravans[j].specialPurpose == 11 || GD.Caravans[i].specialPurpose == 11 && GD.Caravans[j].specialPurpose == 10 || (GD.Caravans[i].specialPurpose == 9 && GD.Caravans[j].specialPurpose == 13 || GD.Caravans[i].specialPurpose == 13 && (GD.Caravans[j].specialPurpose == 9 || j == 0)) || (GD.Caravans[i].specialPurpose == 17 && GD.Caravans[j].specialPurpose == 18 || GD.Caravans[i].specialPurpose == 18 && (GD
                              .Caravans[j].specialPurpose == 17 || j == 0)) || GD.Caravans[i].specialPurpose == 21 && j == 0)
                              {
                                 GD.Caravans[i].direction = MathFunctions.CalcRevYAngle(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[j].x,GD.Caravans[j].y);
                                 GD.Caravans[i].deflected = true;
                                 GD.Caravans[i].lastFlicker = Infinity;
                                 break;
                              }
                           }
                        }
                     }
                  }
                  if(GD.Caravans[i].keepDistance)
                  {
                     for(j in GD.Caravans[i].nearbyCaravans)
                     {
                        if(GD.Caravans[i].nearbyCaravans[j].keepDistance && GD.Caravans[i].specialPurpose == GD.Caravans[i].nearbyCaravans[j].specialPurpose)
                        {
                           if(betweenCaravans[i][j] < 30)
                           {
                              GD.Caravans[i].direction = MathFunctions.CalcAngle(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[i].nearbyCaravans[j].x,GD.Caravans[i].nearbyCaravans[j].y) + 3.141592653589793;
                              GD.Caravans[i].x += Math.sin(GD.Caravans[i].direction);
                              GD.Caravans[i].y += Math.cos(GD.Caravans[i].direction);
                              GD.Caravans[i].deflected = true;
                           }
                        }
                     }
                  }
                  if(i != 0 && GD.Caravans[i].category != 5 && GD.Caravans[i].nowGoingToTown != null && GD.Caravans[i].overTown == GD.Caravans[i].nowGoingToTown)
                  {
                     consProd = GD.Caravans[i].getConsumptionProduction();
                     waterConsumption = 0;
                     for(j in consProd.consumption)
                     {
                        if(consProd.consumption[j].item == 1)
                        {
                           waterConsumption = consProd.consumption[j].amount;
                           break;
                        }
                     }
                     maxAmount = GD.itemAmountFromPrice(GD.Towns[GD.Caravans[i].overTown],1,GD.Caravans[i].money,true);
                     transferAmount = Math.min(maxAmount,waterConsumption * 10 - GD.Caravans[i].water);
                     transferAmount = Math.max(transferAmount,0);
                     transferAmount = Math.min(transferAmount,GD.Caravans[i].maxLiquidAmount(1));
                     transferAmount = Math.min(transferAmount,Math.max(GD.Caravans[i].maxCargo - GD.Caravans[i].totalCargo,0));
                     amountInStock = 0;
                     for(j in GD.Towns[GD.Caravans[i].overTown].stock)
                     {
                        if(GD.Towns[GD.Caravans[i].overTown].stock[j].type == 1)
                        {
                           amountInStock = GD.Towns[GD.Caravans[i].overTown].stock[j].amount;
                           break;
                        }
                     }
                     transferAmount = Math.min(transferAmount,amountInStock);
                     if(transferAmount > 0)
                     {
                        moneySum = GD.calculatePrice(GD.Towns[GD.Caravans[i].overTown],1,transferAmount,true);
                        GD.Caravans[i].money -= moneySum;
                        GD.Towns[GD.Caravans[i].overTown].money += moneySum;
                        GD.Caravans[i].addCargo(1,transferAmount);
                        GD.Towns[GD.Caravans[i].overTown].removeFromStock(1,transferAmount);
                        GD.Caravans[i].update();
                     }
                     GD.Caravans[i].nowGoingToTown = null;
                     if(GD.Caravans[i].category == 4)
                     {
                        for(j in GD.parent.loadedDLC)
                        {
                           if(GD.parent.loadedDLC[j].hasOwnProperty("onMissionCaravanEntersTown"))
                           {
                              GD.parent.loadedDLC[j].onMissionCaravanEntersTown(GD.Caravans[i]);
                           }
                        }
                        switch(GD.Caravans[i].specialPurpose)
                        {
                           case 1:
                              if(!GD.Story.loisStartedAttack)
                              {
                                 eventsToExecute.push(4);
                                 openDialogue(13);
                              }
                              GD.directCaravanToTown(GD.Caravans[i],20);
                              GD.Caravans[i].category = 3;
                              break;
                           case 2:
                              if(GD.Caravans[i].overTown == 18)
                              {
                                 GD.Towns[18].locations[3].visible = true;
                                 GD.Story.dialogueDefaults[10] = 507;
                                 GD.Story.loisReturned = true;
                                 GD.Towns[GD.Caravans[i].overTown].population += GD.Caravans[i].People.length;
                                 GD.Towns[GD.Caravans[i].overTown].unemployed += GD.Caravans[i].People.length;
                                 GD.Caravans[i].active = false;
                                 GD.Caravans[i].specialPurpose = undefined;
                              }
                              if(GD.Caravans[i].overTown == 20)
                              {
                                 GD.directCaravanToTown(GD.Caravans[i],18);
                              }
                              break;
                           case 3:
                              if(GD.Caravans[i].overTown == 20)
                              {
                                 GD.Towns[20].locations[1].visible = true;
                                 GD.Story.drekarReturned = true;
                                 GD.Towns[GD.Caravans[i].overTown].population += GD.Caravans[i].People.length;
                                 GD.Towns[GD.Caravans[i].overTown].unemployed += GD.Caravans[i].People.length;
                                 GD.Caravans[i].active = false;
                                 GD.Caravans[i].specialPurpose = undefined;
                              }
                              break;
                           case 6:
                              if(GD.Caravans[i].overTown == 27)
                              {
                                 openDialogue(16);
                                 eventsToExecute.push(25);
                                 GD.Caravans[i].active = false;
                                 GD.Caravans[i].specialPurpose = undefined;
                              }
                              break;
                           case 12:
                              GD.Caravans[i].active = false;
                              GD.Caravans[i].specialPurpose = undefined;
                              GD.Story.wfmMissionDone = true;
                              if(GD.Story.escortWFMCaravanTo == 37 || GD.Story.escortWFMCaravanTo == 23)
                              {
                                 if(GD.Story.escortWFMCaravanTo == 37)
                                 {
                                    j = 1;
                                 }
                                 if(GD.Story.escortWFMCaravanTo == 23)
                                 {
                                    j = 1;
                                 }
                                 k = 0;
                                 while(k < GD.Caravans[i].People.length)
                                 {
                                    if(GD.Caravans[i].People[k].category == 4)
                                    {
                                       GD.Towns[GD.Caravans[i].overTown].locations[j].slaves.push(GD.Caravans[i].People[k]);
                                       GD.Caravans[i].removePerson(GD.Caravans[i].People[k]);
                                    }
                                    k = Number(k) + 1;
                                 }
                              }
                              break;
                           case 9:
                              GD.Towns[40].population += GD.Caravans[i].People.length;
                              GD.Story.rebelsReturned = true;
                              for(j in GD.Caravans[i].People)
                              {
                                 if(GD.Caravans[i].People[j].specialPurpose == 11)
                                 {
                                    GD.Towns[40].locations[4].visible = true;
                                    GD.Story.dialogueDefaults[29] = 1606;
                                 }
                              }
                              GD.Caravans[i].active = false;
                              GD.Caravans[i].specialPurpose = undefined;
                              break;
                           case 14:
                              if(GD.Caravans[i].overTown == 5)
                              {
                                 GD.Story.liberationArmyReinforcementArrived = true;
                                 GD.Story.liberationArmyReinforcementMen = GD.Caravans[i].People.length;
                                 GD.Caravans[i].active = false;
                                 GD.Caravans[i].specialPurpose = undefined;
                              }
                              break;
                           case 15:
                              if(GD.Caravans[i].overTown == 18)
                              {
                                 GD.directCaravanToTown(GD.Caravans[i],23);
                                 GD.Story.reginDestroyedPullid = true;
                                 GD.Towns[18].population = 0;
                                 for(j in GD.Towns[18].locations)
                                 {
                                    GD.Towns[18].locations[j].visible = false;
                                 }
                                 GD.Towns[18].industries = [];
                                 GD.Towns[18].playersIndustries = [];
                                 GD.Towns[18].unemployed = 0;
                                 GD.Towns[18].constantPopulation = true;
                                 eventsToExecute.push(72);
                                 GD.failQuest(35);
                                 openDialogue(28);
                                 GD.Caravans[i].addCargo(64,GD.Caravans[i].People.length * 20);
                                 GD.Story.dialogueDefaults[34] = 1863;
                              }
                              if(GD.Caravans[i].overTown == 23)
                              {
                                 GD.Caravans[i].active = false;
                                 GD.Caravans[i].specialPurpose = undefined;
                                 GD.Towns[23].population += GD.Caravans[i].People.length;
                              }
                              break;
                           case 16:
                              if(GD.Caravans[i].overTown == 59)
                              {
                                 GD.Story.dialogueDefaults[35] = 1958;
                                 GD.Caravans[i].active = false;
                                 GD.Caravans[i].specialPurpose = undefined;
                              }
                              break;
                           case 17:
                              if(GD.Caravans[i].overTown == 53)
                              {
                                 if(!GD.Story.qubbaCapturedTheFederation)
                                 {
                                    eventsToExecute.push(81);
                                 }
                                 GD.Caravans[i].active = false;
                                 GD.Caravans[i].specialPurpose = undefined;
                              }
                              break;
                           case 18:
                              if(GD.Caravans[i].overTown == 5)
                              {
                                 if(!GD.Story.federationCapturedQubba)
                                 {
                                    eventsToExecute.push(82);
                                 }
                                 GD.Caravans[i].active = false;
                                 GD.Caravans[i].specialPurpose = undefined;
                              }
                        }
                     }
                     if(GD.Caravans[i].category == 2 || GD.Caravans[i].category == 3 || GD.Caravans[i].type == 41)
                     {
                        if(GD.Caravans[i].specialPurpose == 4)
                        {
                           GD.Story.lintuReturned = true;
                        }
                        if(GD.Caravans[i].specialPurpose == 5)
                        {
                           if(!GD.Story.kiviReturned)
                           {
                              eventsToExecute.push(20);
                           }
                           GD.Story.kiviReturned = true;
                        }
                        if(GD.Caravans[i].specialPurpose == 10)
                        {
                           GD.Story.ozbetDefendersReturned = true;
                        }
                        if(GD.Caravans[i].specialPurpose == 11)
                        {
                           GD.Story.janubiTroopsReturned = true;
                        }
                        GD.Caravans[i].specialPurpose = undefined;
                        if(GD.Caravans[i].category == 2 || GD.Caravans[i].category == 3)
                        {
                           GD.Towns[GD.Caravans[i].overTown].population += GD.Caravans[i].People.length;
                           GD.Towns[GD.Caravans[i].overTown].unemployed += GD.Caravans[i].People.length;
                        }
                        GD.Caravans[i].active = false;
                     }
                  }
                  if(GD.gameSpeed > 0 && !(GD.keepDialogues is Array))
                  {
                     if(i != 0 && Math.abs(MathFunctions.AngleDifference(GD.Caravans[i].direction,GD.Caravans[i].prevDir)) > 0.1)
                     {
                        if(GD.Caravans[i].lastFlicker > 25)
                        {
                           GD.Caravans[i].lastFlicker = 0;
                        }
                        else
                        {
                           GD.Caravans[i].direction = GD.Caravans[i].prevDir;
                           GD.Caravans[i].deflected = true;
                        }
                     }
                     GD.Caravans[i].lastFlicker += GD.gameSpeed;
                     GD.Caravans[i].prevDir = GD.Caravans[i].direction;
                  }
               }
            }
            escortCounter = 0;
            for(i in GD.Caravans)
            {
               if(GD.Caravans[i].active)
               {
                  if(GD.Story is Caravaneer2MainStory && GD.Story.startedSuppressRebelionOperation && GD.Caravans[i].specialPurpose == 8 && !GD.Story.gotCloseToMikaze)
                  {
                     if(escortCounter == 0)
                     {
                        ang = 3.141592653589793 / 2;
                     }
                     else
                     {
                        ang = -1.5707963267948966;
                     }
                     destX = GD.Caravans[0].x + 50 * Math.sin(GD.Caravans[0].direction + ang);
                     destY = GD.Caravans[0].y - 50 * Math.cos(GD.Caravans[0].direction + ang);
                     distToDest = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,destX,destY);
                     GD.Caravans[i].moving = distToDest > GD.Caravans[i].mapSpeed;
                     if(GD.Caravans[i].moving)
                     {
                        GD.Caravans[i].direction = MathFunctions.CalcRevYAngle(GD.Caravans[i].x,GD.Caravans[i].y,destX,destY);
                     }
                     escortCounter = Number(escortCounter) + 1;
                  }
                  if(GD.Story is Caravaneer2MainStory && GD.Caravans[i].specialPurpose == 10 && !GD.Story.janubiStartedDefense && GD.Caravans[i].guardPosition != null)
                  {
                     distToPos = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[i].guardPosition.x,GD.Caravans[i].guardPosition.y);
                     if(distToPos > 500)
                     {
                        GD.Caravans[i].direction = MathFunctions.CalcRevYAngle(GD.Caravans[i].x,GD.Caravans[i].y,GD.Caravans[i].guardPosition.x,GD.Caravans[i].guardPosition.y);
                     }
                     else if(!GD.Story.janubiStartedDefense)
                     {
                        eventsToExecute.push(48);
                        for(j in GD.Caravans)
                        {
                           if(GD.Caravans[j].specialPurpose == 10)
                           {
                              GD.Caravans[j].guardPosition = null;
                              GD.Caravans[j].concentrated = false;
                           }
                        }
                     }
                  }
                  if(GD.Caravans[i].mapSymbol is Sprite && GD.Caravans[i].mapSymbol.visible)
                  {
                     GD.Caravans[i].mapSymbol.x = GD.Caravans[i].x;
                     GD.Caravans[i].mapSymbol.y = GD.Caravans[i].y;
                     GD.Caravans[i].mapSymbolRotatingPart.rotation = GD.Caravans[i].direction * MathFunctions.Rad2Deg;
                  }
                  for(j in GD.Caravans[i].recentlyInteractedCaravans)
                  {
                     ind = GD.Caravans[i].nearbyCaravans.indexOf(GD.Caravans[i].recentlyInteractedCaravans[j]);
                     if(ind == -1 || betweenCaravans[i][ind] > 16)
                     {
                        GD.Caravans[i].recentlyInteractedCaravans.splice(j,1);
                        j = Number(j) - 1;
                     }
                  }
                  for(j in GD.Caravans[i].recentlyInteractedTowns)
                  {
                     ind = GD.Caravans[i].nearbyTowns.indexOf(GD.Caravans[i].recentlyInteractedTowns[j]);
                     if(ind == -1 || caravansToTowns[i][ind] > 25)
                     {
                        GD.Caravans[i].recentlyInteractedTowns.splice(j,1);
                     }
                  }
               }
            }
            for(j in GD.Caravans)
            {
               GD.Caravans[j].inNearby = false;
            }
            for(j in GD.Caravans[0].nearbyCaravans)
            {
               GD.Caravans[0].nearbyCaravans[j].inNearby = true;
            }
            for(j in GD.Caravans)
            {
               if(GD.Caravans[j].category != 5 && (!GD.Caravans[j].inNearby && GD.Caravans[j].category == 1 || GD.Caravans[j].specialPurpose == 12))
               {
                  distToZero = MathFunctions.CalcDistance(GD.Caravans[0].x,GD.Caravans[0].y,GD.Caravans[j].x,GD.Caravans[j].y);
                  if(distToZero > 400)
                  {
                     GD.Caravans[j].active = false;
                  }
               }
            }
            for(j in GD.Caravans[0].nearbyCaravans)
            {
               if(betweenCaravans[0][j] > 400)
               {
                  GD.Caravans[0].nearbyCaravans[j].identified = false;
                  GD.Caravans[0].nearbyCaravans[j].menCountPhase = 0;
                  if(GD.Caravans[0].nearbyCaravans[j].category == 1)
                  {
                     GD.Caravans[0].nearbyCaravans[j].active = false;
                  }
               }
            }
            for(i in GD.Caravans)
            {
               if(!GD.Caravans[i].active)
               {
                  if(i == 0)
                  {
                     GD.setMode(6,2723);
                     return;
                  }
                  storyOnDestroyed(GD.Caravans[i]);
                  destroyCaravan(GD.Caravans[i]);
                  i = Number(i) - 1;
               }
            }
            while(eventsToExecute.length > 0)
            {
               GD.executeMajorEvent(eventsToExecute.shift());
            }
            if(GD.gameSpeed > 0 || justInitiated)
            {
               GD.globalCounter += 60 * GD.gameSpeed * 4;
               while(GD.globalCounter >= 86400)
               {
                  GD.globalCounter -= 86400;
                  for(i in GameData.workshopRecipes)
                  {
                     GD.producedToday[i] = 0;
                  }
                  if(GD.missingRoutes.length > 0 && Math.random() < 0.2)
                  {
                     pos = MathFunctions.random(0,GD.missingRoutes.length - 1);
                     GD.createCaravanOnRoute(GD.missingRoutes[pos]);
                     GD.missingRoutes.splice(pos,1);
                  }
                  if(GD.storyMode && GD.Story is Caravaneer2MainStory)
                  {
                     if(GD.Story.calvinIsDecrypting && GD.Time >= GD.Story.calvinsDecryptionReady)
                     {
                        GD.Story.calvinIsDecrypting = false;
                        GD.executeMajorEvent(21);
                     }
                     if(GD.Story.nariziansArePreparingToLeave && GD.Time >= GD.Story.nariziansLeaveTime)
                     {
                        GD.Story.nariziansArePreparingToLeave = false;
                        if(GD.Story.nariziansDestination == 1 || GD.Story.nariziansDestination == 2)
                        {
                           GD.executeMajorEvent(32);
                        }
                        else
                        {
                           GD.executeMajorEvent(27);
                        }
                     }
                     if(GD.Story.buildingNarizianSettlement && GD.Time >= GD.Story.settlementCompleteTime)
                     {
                        GD.Story.buildingNarizianSettlement = false;
                        GD.executeMajorEvent(29);
                     }
                     if(GD.Story.countdownToAbolishSlavery && GD.Time >= GD.Story.abolishSlaveryTime)
                     {
                        GD.Story.countdownToAbolishSlavery = false;
                        GD.executeMajorEvent(30);
                     }
                     GD.Towns[46].removeFromStock(174,5,GD.Towns[46].locations[1].stock);
                     if(GD.Towns[46].locations[1].money < 200000)
                     {
                        GD.Towns[46].locations[1].money += 1000;
                     }
                     if(GD.Story.toldSolanumAboutSapoboi && !GD.Story.sapoboiKilled && GD.Time > GD.Story.solanumHeardAboutSapoboiAt + 172800)
                     {
                        GD.executeMajorEvent(54);
                     }
                     if(GD.Story.johnSheppardDied && GD.Towns[12].locations[8].visible && GD.Time - GD.Story.sheppardDiedAt > 432000)
                     {
                        GD.Towns[12].locations[8].visible = false;
                     }
                     if(GD.Towns[37].locations[10].visible && GD.Story.sigurdSaidHeWouldLeave != undefined && GD.Time - GD.Story.sigurdSaidHeWouldLeave > 604800)
                     {
                        GD.Towns[37].locations[10].visible = false;
                     }
                     if(GD.Story.heardAboutReginsPlan && !GD.Story.reginsMenDefeated && GD.Towns[68].active)
                     {
                        GD.Story.reginsMenCount += 0.2;
                        if(GD.Time - GD.Story.heardAboutReginsPlanAt > 2592000)
                        {
                           nc = GD.Caravans.push(new Caravan(25,GD.mapMode.mapSymbols)) - 1;
                           GD.Caravans[nc].x = GD.Towns[68].x;
                           GD.Caravans[nc].y = GD.Towns[68].y;
                           GD.equipRandomCaravan(GD.Caravans[nc],Math.round(GD.Story.reginsMenCount));
                           GD.Caravans[nc].category = 4;
                           GD.Caravans[nc].specialPurpose = 15;
                           GD.Caravans[nc].addCargo(168,GD.Caravans[nc].People.length * 3);
                           GD.Caravans[nc].addCargo(1,GD.Caravans[nc].People.length * 20);
                           GD.Caravans[nc].addCargo(64,GD.Caravans[nc].People.length * 58);
                           GD.Caravans[nc].addCargo(75,GD.Caravans[nc].People.length * 3);
                           GD.directCaravanToTown(GD.Caravans[nc],18);
                           GD.Towns[68].active = false;
                        }
                     }
                     if(GD.Story.apisIsInvegatingWalls && GD.Time - GD.Story.apisStartedWarehouseInvestigation > 259200)
                     {
                        GD.Story.apisIsInvegatingWalls = false;
                        GD.Story.dialogueDefaults[8] = 1946;
                        GD.Towns[18].addToStock(205,27000);
                        GD.Towns[59].locations[5].visible = false;
                        GD.failQuest(36);
                     }
                     if(GD.Story.askedFafnirAboutTheFederation && !GD.Story.piratesWillBecomeHostile && !GD.Story.piratesWillAttack && GD.Time - GD.Story.fafnirStartedTalkingWithPiratesAt < 1209600)
                     {
                        if(GD.Story.specificReputations[2] > 5 && GD.getFactionRelations(0,20) >= -40)
                        {
                           GD.Story.piratesWillAttack = true;
                        }
                        else
                        {
                           GD.Story.piratesWillBecomeHostile = true;
                        }
                        GD.affectFactionRelations(30,0,20);
                     }
                     if(GD.Story.weaverAgreesToAttackTheFederation && (!GD.Story.federationAttackStarted || GD.Story.bothSidesDestroyed) && !GD.Story.madeQubbaInactive && GD.Time - GD.Story.qubbaDestructionCountdownStartedAt > 32536000)
                     {
                        GD.executeMajorEvent(87);
                     }
                     if(GD.Story.bunkerExtinctionPhase == 1)
                     {
                        GD.Story.bunkerExtinctionPhase = 2;
                     }
                     if(GD.Story.bunkerExtinctionPhase == 3 && GD.Time - GD.Story.bunkerExtinctionCounter > 1209600)
                     {
                        GD.Story.bunkerExtinctionPhase = 4;
                     }
                     if(GD.Story.bunkerExtinctionPhase == 5 && GD.Time - GD.Story.bunkerExtinctionCounter > 604800)
                     {
                        GD.Story.bunkerExtinctionPhase = 6;
                        GD.Towns[15].population--;
                     }
                     if(GD.Story.bunkerExtinctionPhase == 6 && Math.random() < 0.5)
                     {
                        GD.Towns[15].population--;
                        if(GD.Towns[15].population < 10 && Math.random() < 0.5 || GD.Towns[15].population == 0)
                        {
                           GD.Towns[15].locations[3].visible = false;
                        }
                        for(i in GD.Towns[15].industries)
                        {
                           if(GD.Towns[15].industries[i].type == 24)
                           {
                              GD.Towns[15].industries[i].employees--;
                              if(GD.Towns[15].industries[i].employees <= 0)
                              {
                                 GD.Towns[15].industries.splice(i,1);
                              }
                              break;
                           }
                        }
                        if(GD.Towns[15].population == 0)
                        {
                           GD.Towns[15].industries = [];
                           GD.Story.bunkerExtinctionPhase = 7;
                        }
                     }
                  }
                  GD.monthlyCounter++;
                  if(GD.monthlyCounter >= 30)
                  {
                     GD.itemsToUpdate = [];
                     i = 0;
                     while(i < GD.globalPrices.length)
                     {
                        if(GD.globalPrices[i] != undefined)
                        {
                           GD.itemsToUpdate.push(i);
                        }
                        i = Number(i) + 1;
                     }
                     GD.updatingEconomy = true;
                     GD.monthlyCounter = 0;
                  }
                  GD.lastSextantPos = [];
                  if(GD.Caravans[0].findCargo(172) && GD.Caravans[0].findCargo(191))
                  {
                     GD.sextantExperience++;
                     maxIntelligence = 0;
                     for(i in GD.Caravans[0].People)
                     {
                        maxIntelligence = Math.max(maxIntelligence,GD.Caravans[0].People[i].intelligence);
                     }
                     GD.lastSextantOffset = 10000 / (maxIntelligence + Math.pow(GD.sextantExperience,0.5));
                     angle = Math.random() * 3.141592653589793 * 2;
                     dist = GD.lastSextantOffset * Math.random();
                     GD.lastSextantPos = [GD.Caravans[0].x + dist * Math.sin(angle),GD.Caravans[0].y + dist * Math.cos(angle)];
                     GD.lastSextantMeasurement = GD.Time;
                  }
                  if(GD.difficulty == 1)
                  {
                     GD.Towns[19].addToStock(99 + MathFunctions.random(0,3),1);
                     GD.Towns[17].money += 1000;
                     GD.Towns[18].money += 1000;
                     GD.Towns[19].money += 1000;
                  }
               }
            }
            if(GD.gameSpeed > 0 && !(GD.keepDialogues is Array))
            {
               i = 0;
               distanceCovered = GD.gameSpeed * 4 / 60 * GD.Caravans[i].speed * GD.Caravans[i].distanceMultiplier;
               for(j in GD.Caravans[i].Transport)
               {
                  if(GD.Caravans[i].Transport[j].category == 2 || GD.Caravans[i].Transport[j].category == 3)
                  {
                     if(GD.Caravans[i].moving && !(GD.Caravans[i].Transport[j].passengerIn is TransportUnit))
                     {
                        GD.Caravans[i].Transport[j].lubricantLevel -= GD.Caravans[i].Transport[j].maxLubricant * 0.00002 * (GD.Caravans[i].Transport[j].maxHealth / GD.Caravans[i].Transport[j].health) * Math.random() * GD.gameSpeed * 4 + GD.Caravans[i].Transport[j].maxLubricant * 0.00002 * (GD.Caravans[i].Transport[j].maxHealth / GD.Caravans[i].Transport[j].health) * Math.random() * distanceCovered;
                        if(GD.Caravans[i].Transport[j].lubricantLevel < 0)
                        {
                           GD.Caravans[i].Transport[j].lubricantLevel = 0;
                        }
                        if(!GD.Caravans[i].Transport[j].windPowered)
                        {
                           GD.Caravans[i].Transport[j].waterLevel -= GD.Caravans[i].Transport[j].maxWater * 0.00002 * (GD.Caravans[i].Transport[j].maxHealth / GD.Caravans[i].Transport[j].health) * Math.random() * GD.gameSpeed * 4 + GD.Caravans[i].Transport[j].maxWater * 0.00002 * (GD.Caravans[i].Transport[j].maxHealth / GD.Caravans[i].Transport[j].health) * Math.random() * distanceCovered;
                           if(GD.Caravans[i].Transport[j].waterLevel < 0)
                           {
                              GD.Caravans[i].Transport[j].waterLevel = 0;
                           }
                        }
                        damage = distanceCovered * 0.01;
                        if(GD.Caravans[i].Transport[j].lubricantLevel < GD.Caravans[i].Transport[j].maxLubricant * 0.1)
                        {
                           damage *= 1.5;
                        }
                        if(GD.Caravans[i].Transport[j].lubricantLevel <= 0)
                        {
                           damage *= 2;
                        }
                        if(!GD.Caravans[i].Transport[j].windPowered && GD.Caravans[i].Transport[j].waterLevel <= 0)
                        {
                           damage *= 2;
                        }
                        GD.Caravans[i].Transport[j].health -= damage;
                        if(GD.Caravans[i].Transport[j].category == 3)
                        {
                           GD.Caravans[i].reduceCargo(64,distanceCovered * GD.Caravans[i].Transport[j].fuelConsumption / 100);
                           if(GD.Caravans[i].historicalData[0] is Object)
                           {
                              GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                 "item":64,
                                 "amount":distanceCovered * GD.Caravans[i].Transport[j].fuelConsumption / 100
                              });
                           }
                        }
                     }
                  }
               }
               for(i in GD.Caravans)
               {
                  if(GD.Caravans[i].active && GD.Caravans[i].category != 5)
                  {
                     GD.Caravans[i].needsUpdate = false;
                     GD.Caravans[i].cycleCounter += GD.gameSpeed * 4;
                     while(GD.Caravans[i].cycleCounter >= 360)
                     {
                        if(GD.storyMode && GD.Story is Caravaneer2MainStory)
                        {
                           if(i == 0 && GD.Story.accompanyedByThum)
                           {
                              if(!GD.Story.thumDisplayedMessage && GD.Time - GD.Story.thumJoinTime > 604800)
                              {
                                 openDialogue(11);
                                 GD.Story.thumDisplayedMessage = true;
                              }
                              if(GD.Time - GD.Story.thumJoinTime > 777600)
                              {
                                 for(j in GD.Caravans[0].People)
                                 {
                                    if(GD.Caravans[0].People[j].specialPurpose == 1)
                                    {
                                       ThumInd = j;
                                       break;
                                    }
                                 }
                                 if(ThumInd != undefined)
                                 {
                                    newGroup = new Caravan(1,GD.mapMode.mapSymbols);
                                    newGroup.name = Texts.fetch(1978);
                                    newGroup.addPerson(GD.Caravans[0].People[ThumInd]);
                                    newGroup.x = GD.Caravans[0].x;
                                    newGroup.y = GD.Caravans[0].y;
                                    newGroup.addCargo(20,1,true);
                                    GD.Caravans[0].recentlyInteractedCaravans.push(newGroup);
                                    newGroup.recentlyInteractedCaravans.push(GD.Caravans[0]);
                                    newGroup.category = 2;
                                    GD.Caravans[0].removePerson(GD.Caravans[0].People[ThumInd],true);
                                    GD.Caravans.push(newGroup);
                                    GD.directCaravanToTown(newGroup,17);
                                    newGroup.staticMode = true;
                                    newGroup.update();
                                 }
                                 openDialogue(12);
                                 GD.Story.accompanyedByThum = false;
                              }
                           }
                           if((GD.Caravans[i].specialPurpose == 2 || GD.Caravans[i].specialPurpose == 5) && !GD.Story.drekarStartedDefense)
                           {
                              distToDrekar = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,Presets.Towns[20].x,Presets.Towns[20].y);
                              if(distToDrekar < 500)
                              {
                                 GD.executeMajorEvent(7);
                              }
                           }
                           if(GD.Caravans[i].specialPurpose == 2 && distToDrekar < 1200 && GD.Story.loisAttacksWithLintu && !GD.Story.lintuStartedAttack)
                           {
                              GD.executeMajorEvent(12);
                           }
                           if(GD.Caravans[i].specialPurpose == 2 && GD.Story.loisMovesCarefuly && !GD.Story.drekarDefeated)
                           {
                              distFromLois = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,Presets.Towns[20].x,Presets.Towns[20].y);
                              distFromYou = MathFunctions.CalcDistance(GD.Caravans[0].x,GD.Caravans[0].y,Presets.Towns[20].x,Presets.Towns[20].y);
                              GD.Caravans[i].moving = distFromLois >= distFromYou;
                           }
                           if(GD.Caravans[i].specialPurpose == 3 && GD.Story.drekarAttackingLintu && !GD.Story.lintuStartedDefense)
                           {
                              distToLintu = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,Presets.Towns[17].x,Presets.Towns[17].y);
                              if(distToLintu < 500)
                              {
                                 GD.executeMajorEvent(14);
                              }
                           }
                           if(GD.Caravans[i].specialPurpose == 4 && GD.Story.lintuStartedAttack && GD.Time - GD.Story.lintuAttackTime > 18000)
                           {
                              GD.directCaravanToTown(GD.Caravans[i],20);
                           }
                           if(GD.Caravans[i].specialPurpose == 5 && GD.Story.kiviStartedAttack && GD.Time - GD.Story.kiviAttackTime > 18000)
                           {
                              GD.directCaravanToTown(GD.Caravans[i],20);
                           }
                           if(GD.Caravans[i].specialPurpose == 3 && GD.Story.drekarAttackingLintu && GD.Time - GD.Story.drekarAttackTime > 18000)
                           {
                              GD.directCaravanToTown(GD.Caravans[i],17);
                           }
                           if(GD.Story.drekarDefeated && (GD.Caravans[i].specialPurpose == 2 || GD.Caravans[i].specialPurpose == 4 || GD.Caravans[i].specialPurpose == 5))
                           {
                              if(GD.Caravans[i].specialPurpose == 2)
                              {
                                 GD.directCaravanToTown(GD.Caravans[i],18);
                              }
                              if(GD.Caravans[i].specialPurpose == 4)
                              {
                                 GD.directCaravanToTown(GD.Caravans[i],17);
                              }
                              if(GD.Caravans[i].specialPurpose == 5)
                              {
                                 GD.directCaravanToTown(GD.Caravans[i],19);
                              }
                           }
                           if(GD.Story.startedSuppressRebelionOperation && !GD.Story.gotCloseToMikaze && (GD.Caravans[i].specialPurpose == 8 || i == 0))
                           {
                              distToMikaze = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,Presets.Towns[40].x,Presets.Towns[40].y);
                              if(distToMikaze < 500)
                              {
                                 GD.executeMajorEvent(44);
                                 GD.Story.gotCloseToMikaze = true;
                              }
                           }
                        }
                        if(i == 0 || GD.Caravans[i].specialPurpose == 20)
                        {
                           GD.newHistoricalPoint(GD.Caravans[i],GD.Time - (Math.floor(GD.Caravans[i].cycleCounter / 360) - 1) * 360);
                           if(i != 0 && GD.Caravans[i].historicalData.length > 3)
                           {
                              GD.Caravans[i].historicalData = GD.Caravans[i].historicalData.splice(0,3);
                           }
                           batteriesNum = 0;
                           batteriesItem = GD.Caravans[i].findCargo(218);
                           if(batteriesItem)
                           {
                              batteriesNum = batteriesItem.amount;
                           }
                           if(GD.Caravans[i].chargingBatteries.length > batteriesNum)
                           {
                              GD.Caravans[i].chargingBatteries = GD.Caravans[i].chargingBatteries.splice(0,batteriesNum);
                           }
                           while(GD.Caravans[i].chargingBatteries.length < batteriesNum)
                           {
                              GD.Caravans[i].chargingBatteries.push(0);
                           }
                           batteriesToCharge = 0;
                           fullyCharged = 0;
                           for(j in GameData.chargers)
                           {
                              workingChargers = GD.Caravans[i].devicesWorking(GameData.chargers[j]);
                              if(workingChargers > 0)
                              {
                                 batteriesToCharge += Item.getDataFromType(GameData.chargers[j]).batteryCharge * workingChargers;
                              }
                           }
                           j = 0;
                           while(j < Math.min(batteriesToCharge,GD.Caravans[i].chargingBatteries.length))
                           {
                              var _loc14_:* = j;
                              var _loc13_:Number = GD.Caravans[i].chargingBatteries[_loc14_] + 360;
                              GD.Caravans[i].chargingBatteries[_loc14_] = _loc13_;
                              if(GD.Caravans[i].chargingBatteries[j] >= 1440)
                              {
                                 fullyCharged = Number(fullyCharged) + 1;
                                 GD.Caravans[i].chargingBatteries.shift();
                                 j = Number(j) - 1;
                                 batteriesToCharge = Number(batteriesToCharge) - 1;
                              }
                              j = Number(j) + 1;
                           }
                           if(fullyCharged > 0)
                           {
                              GD.Caravans[i].reduceCargo(218,fullyCharged);
                              GD.Caravans[i].addCargo(219,fullyCharged);
                           }
                           consumptionProduction = GameData.calculateConsumptionProduction(GD.Caravans[i].Cargo,GD.Caravans[i].Cargo,360 / 1440);
                           GameData.addArrayToArray(GD.Caravans[i].historicalData[0].production,consumptionProduction.production);
                           GameData.addArrayToArray(GD.Caravans[i].historicalData[0].consumption,consumptionProduction.consumption);
                           for(j in consumptionProduction.consumption)
                           {
                              GD.Caravans[j].reduceCargo(consumptionProduction.consumption[j].item,consumptionProduction.consumption[j].amount);
                           }
                           for(j in consumptionProduction.production)
                           {
                              GD.Caravans[i].addCargo(consumptionProduction.production[j].item,consumptionProduction.production[j].amount);
                           }
                           if(GD.Caravans[i].collectForage)
                           {
                              collectingSkill = GD.Caravans[i].collectingSkill;
                              prob = collectingSkill * 360 * 0.5 / 1440 / Math.max(GD.Caravans[i].zoneForageDevastation,1);
                              if(GD.Caravans[i].moving)
                              {
                                 prob /= Math.max(GD.Caravans[i].speed,1);
                              }
                              count = MathFunctions.ProbabilityRandom(prob);
                              while(count > 0)
                              {
                                 amount = collectingSkill * 360 / 1440 * 0.1 / Math.max(GD.Caravans[i].zoneForageDevastation,1) * Math.random();
                                 GD.Caravans[i].addCargo(62,amount);
                                 if(GD.Caravans[i].historicalData.length > 0)
                                 {
                                    GameData.addItemToArray(GD.Caravans[i].historicalData[0].production,{
                                       "item":62,
                                       "amount":amount
                                    });
                                 }
                                 GD.Caravans[i].zoneForageDevastation += amount;
                                 count = Number(count) - 1;
                              }
                              if(i == 0)
                              {
                                 GD.Caravans[i].distributeExperience("collectingSkill","collectingExperience",1);
                              }
                           }
                           if(GD.Caravans[i].hunt && GD.Caravans[i].overTown == null)
                           {
                              huntingSkill = GD.Caravans[i].huntingSkill;
                              if(!GD.Caravans[i].collectForage)
                              {
                                 collectingSkill = GD.Caravans[i].collectingSkill;
                              }
                              prob = huntingSkill * 360 * 0.5 / 1440 / Math.max(GD.Caravans[i].zonePreyDevastation,1);
                              if(GD.Caravans[i].moving)
                              {
                                 prob /= Math.max(GD.Caravans[i].speed,1);
                              }
                              count = Math.min(MathFunctions.ProbabilityRandom(prob),5);
                              while(count > 0)
                              {
                                 spread = Math.random();
                                 for(j in GameData.huntingItems)
                                 {
                                    if(spread < GameData.huntingItems[j].amount)
                                    {
                                       amount = Math.min(Math.pow(0.05 * huntingSkill * 360 / 1440 / Math.max(GD.Caravans[i].zonePreyDevastation,1) * Math.random(),0.5),3 / Item.getDataFromType(GameData.huntingItems[j].item).weight * 360 / 1440);
                                       amount *= Math.random();
                                       GD.Caravans[i].addCargo(GameData.huntingItems[j].item,amount);
                                       if(GD.Caravans[i].historicalData.length > 0)
                                       {
                                          GameData.addItemToArray(GD.Caravans[i].historicalData[0].production,{
                                             "item":GameData.huntingItems[j].item,
                                             "amount":amount
                                          });
                                       }
                                       GD.Caravans[i].zonePreyDevastation += amount / 2;
                                       break;
                                    }
                                    spread -= GameData.huntingItems[j].amount;
                                 }
                                 count = Number(count) - 1;
                              }
                              prob = 0.0005 * huntingSkill * collectingSkill * 360 / 1440 / Math.max(GD.Caravans[i].zonePreyDevastation,1);
                              if(GD.Caravans[i].moving)
                              {
                                 prob /= Math.max(GD.Caravans[i].speed,1);
                              }
                              count = Math.min(MathFunctions.ProbabilityRandom(prob),2);
                              while(count > 0)
                              {
                                 spread = Math.random();
                                 for(j in GameData.huntingEggs)
                                 {
                                    if(spread < GameData.huntingEggs[j].amount)
                                    {
                                       amount = Math.min(Math.pow(0.1 * huntingSkill + collectingSkill * 0.1 * 360 / 1440 / Math.max(GD.Caravans[i].zonePreyDevastation,1) * Math.random(),0.3),1.5);
                                       amount = Math.round(amount * Math.random());
                                       if(amount > 0)
                                       {
                                          GD.Caravans[i].addCargo(GameData.huntingEggs[j].item,amount);
                                          if(GD.Caravans[i].historicalData.length > 0)
                                          {
                                             GameData.addItemToArray(GD.Caravans[i].historicalData[0].production,{
                                                "item":GameData.huntingEggs[j].item,
                                                "amount":amount
                                             });
                                          }
                                          GD.Caravans[i].zonePreyDevastation += amount;
                                       }
                                       break;
                                    }
                                    spread -= GameData.huntingEggs[j].amount;
                                 }
                                 count = Number(count) - 1;
                              }
                              if(i == 0)
                              {
                                 GD.Caravans[i].distributeExperience("huntingSkill","huntingExperience",1);
                              }
                           }
                           if(GD.Caravans[i].moving)
                           {
                              if(GD.Caravans[i].zoneForageDevastation > 0)
                              {
                                 GD.Caravans[i].zoneForageDevastation -= 0.0025;
                              }
                              if(GD.Caravans[i].zonePreyDevastation > 0)
                              {
                                 GD.Caravans[i].zonePreyDevastation -= 0.0025;
                              }
                           }
                           GD.Caravans[i].needsUpdate = true;
                        }
                        GD.Caravans[i].cycleCounter -= 360;
                     }
                     if(i == 0 || GD.Caravans[i].specialPurpose == 20)
                     {
                        j = 0;
                        while(j < GD.Caravans[i].People.length)
                        {
                           GD.Caravans[i].People[j].cycleCounter += GD.gameSpeed * 4;
                           while(GD.Caravans[i].People[j].cycleCounter >= 360)
                           {
                              skip = false;
                              GD.Caravans[i].needsUpdate = true;
                              if(GD.Caravans[i].People[j].category == 2)
                              {
                                 if(GD.Caravans[i].People[j].payDay <= GD.Time)
                                 {
                                    if(GD.Caravans[i].money >= GD.Caravans[i].People[j].minSalary)
                                    {
                                       if(GD.Caravans[i].People[j].autoPay)
                                       {
                                          payMercenary(GD.Caravans[i].People[j],GD.Caravans[i]);
                                       }
                                       else if(i == 0)
                                       {
                                          if(dialoguesOpen.length == 0)
                                          {
                                             openDialogue(5);
                                             mercenaryToPayTo = GD.Caravans[i].People[j];
                                             dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(1289,GD.Caravans[i].People[j].gender).replace("@name@",GD.Caravans[i].People[j].name).replace("@money@",GD.Caravans[i].People[j].salary + "€").toUpperCase());
                                             dialoguesOpen[dialoguesOpen.length - 1].onApprove = function():*
                                             {
                                                payMercenary(mercenaryToPayTo,GD.Caravans[0]);
                                                closeDialogue();
                                             };
                                             dialoguesOpen[dialoguesOpen.length - 1].onCancel = function():*
                                             {
                                                dismissPerson(mercenaryToPayTo,GD.Caravans[0]);
                                                dialoguesOpen[dialoguesOpen.length - 1].onCancel = new Function();
                                                closeDialogue();
                                             };
                                          }
                                       }
                                       else
                                       {
                                          dismissPerson(GD.Caravans[i].People[j],GD.Caravans[i]);
                                       }
                                    }
                                    else if(i == 0)
                                    {
                                       text = Texts.fetch(1274,GD.Caravans[i].People[j].gender).replace("@name@",GD.Caravans[i].People[j].name).toUpperCase();
                                       if(GD.Caravans[0].overTown == null)
                                       {
                                          text += "\n\n" + Texts.fetch(1275,GD.Caravans[i].People[j].gender).replace("@name@",GD.Caravans[i].People[j].name).toUpperCase();
                                          GD.Caravans[i].People[j].category = 7;
                                       }
                                       else
                                       {
                                          text += "\n\n" + Texts.fetch(1276,GD.Caravans[i].People[j].gender).replace("@name@",GD.Caravans[i].People[j].name).toUpperCase();
                                          GD.Towns[GD.Caravans[0].overTown].people.push(GD.Caravans[i].People[j]);
                                          GD.Caravans[i].People[j].salary = GD.Caravans[i].People[j].minSalary;
                                          GD.Caravans[0].removePerson(GD.Caravans[i].People[j]);
                                          j = Number(j) - 1;
                                          skip = true;
                                       }
                                       openDialogue(4);
                                       dialoguesOpen[dialoguesOpen.length - 1].setText(text);
                                    }
                                 }
                              }
                              if(!skip)
                              {
                                 GDA = GD.Caravans[i].People[j].GDA * 360 / 1440;
                                 BMR = GD.Caravans[i].People[j].BMR * 360 / 1440;
                                 prevMorale = GD.Caravans[i].People[j].morale;
                                 foodstuffs = GD.Caravans[i].getConsumedFoodstuffs(GD.Caravans[i].People[j],360 / 1440);
                                 totalCalories = 0;
                                 waterReceived = 0;
                                 for(k in foodstuffs)
                                 {
                                    if(foodstuffs[k].amount > 0)
                                    {
                                       totalCalories += Item.Goods[foodstuffs[k].item].calories * foodstuffs[k].amount;
                                       waterReceived += Item.Goods[foodstuffs[k].item].waterPercentage * foodstuffs[k].amount * Item.Goods[foodstuffs[k].item].weight;
                                       GD.Caravans[i].People[j].morale += Item.Goods[foodstuffs[k].item].taste * 0.01 * foodstuffs[k].amount * Item.Goods[foodstuffs[k].item].calories / GDA;
                                       GD.Caravans[i].reduceCargo(foodstuffs[k].itemType,foodstuffs[k].amount);
                                       if(GD.Caravans[i].historicalData[0] is Object)
                                       {
                                          GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                             "item":foodstuffs[k].itemType,
                                             "amount":foodstuffs[k].amount
                                          });
                                       }
                                    }
                                 }
                                 if(totalCalories < GDA)
                                 {
                                    GD.Caravans[i].People[j].hunger += GDA - totalCalories;
                                 }
                                 else if(GD.Caravans[i].People[j].hunger > 0)
                                 {
                                    GD.Caravans[i].People[j].hunger -= totalCalories - GDA + 10;
                                    GD.Caravans[i].People[j].hunger /= 2;
                                 }
                                 GD.Caravans[i].People[j].hunger *= 0.975;
                                 if(GD.Caravans[i].People[j].hunger < 0)
                                 {
                                    GD.Caravans[i].People[j].hunger = 0;
                                 }
                                 if(GD.difficulty == 1)
                                 {
                                    recoverDivider = 500;
                                    lossDivider = 3000;
                                 }
                                 else
                                 {
                                    recoverDivider = 1000;
                                    lossDivider = 1500;
                                 }
                                 if(totalCalories < BMR && GD.Caravans[i].People[j].weight < GD.Caravans[i].People[j].idealWeight)
                                 {
                                    GD.Caravans[i].People[j].weight += (totalCalories - BMR) / lossDivider;
                                 }
                                 else
                                 {
                                    GD.Caravans[i].People[j].weight += (totalCalories - BMR) / recoverDivider;
                                 }
                                 if(GD.difficulty == 1)
                                 {
                                    hungerDivider = 30000;
                                    lowWeightDivider = 400;
                                 }
                                 else
                                 {
                                    hungerDivider = 15000;
                                    lowWeightDivider = 200;
                                 }
                                 if(true || i != 0)
                                 {
                                    if(GD.Caravans[i].People[j].hunger > 0)
                                    {
                                       GD.Caravans[i].People[j].HP -= GD.Caravans[i].People[j].hunger / hungerDivider;
                                    }
                                    if(GD.Caravans[i].People[j].weight < GD.Caravans[i].People[j].idealWeight * 0.6)
                                    {
                                       GD.Caravans[i].People[j].HP -= (GD.Caravans[i].People[j].idealWeight * 0.6 - GD.Caravans[i].People[j].weight) / lowWeightDivider;
                                    }
                                 }
                                 waterNeeded = GD.Caravans[i].People[j].waterConsumption * 360 / 1440 - waterReceived;
                                 waterInCaravan = GD.Caravans[i].water;
                                 waterActuallyConsumed = Math.max(Math.min(GD.Caravans[i].People[j].waterConsumption * GD.Caravans[i].groupSettings[GD.Caravans[i].getSettingsGroup(GD.Caravans[i].People[j].category)].waterRations / 100 * 360 / 1440 - waterReceived,waterInCaravan),0);
                                 if(waterNeeded > waterActuallyConsumed)
                                 {
                                    GD.Caravans[i].People[j].thirst += (waterNeeded - waterActuallyConsumed) * 100;
                                 }
                                 else if(GD.Caravans[i].People[j].thirst > 0)
                                 {
                                    GD.Caravans[i].People[j].thirst -= 10 + (waterActuallyConsumed - waterNeeded) * 100;
                                    if(GD.Caravans[i].People[j].thirst < 0)
                                    {
                                       GD.Caravans[i].People[j].thirst = 0;
                                    }
                                    GD.Caravans[i].People[j].thirst *= 0.5;
                                 }
                                 else
                                 {
                                    GD.Caravans[i].People[j].thirst -= (waterActuallyConsumed - waterNeeded) * 5;
                                 }
                                 GD.Caravans[i].People[j].thirst *= 0.975;
                                 GD.Caravans[i].reduceCargo(1,waterActuallyConsumed);
                                 if(GD.Caravans[i].historicalData[0] is Object)
                                 {
                                    GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                       "item":1,
                                       "amount":waterActuallyConsumed
                                    });
                                 }
                                 if(GD.Caravans[i].People[j].thirst > 0)
                                 {
                                    if(GD.difficulty == 1)
                                    {
                                       thirstDivider = 140;
                                    }
                                    else
                                    {
                                       thirstDivider = 70;
                                    }
                                    if(true || i != 0)
                                    {
                                       GD.Caravans[i].People[j].HP -= GD.Caravans[i].People[j].thirst / thirstDivider;
                                    }
                                 }
                                 if(totalCalories > BMR)
                                 {
                                    GD.Caravans[i].People[j].morale += Math.pow(Math.abs(totalCalories - BMR),0.5) / 100;
                                 }
                                 else
                                 {
                                    GD.Caravans[i].People[j].morale -= Math.pow(Math.abs(totalCalories - BMR),0.5) / 100;
                                 }
                                 GD.Caravans[i].People[j].morale -= GD.Caravans[i].People[j].hunger / 10000;
                                 if(GD.Caravans[i].People[j].thirst > 0)
                                 {
                                    GD.Caravans[i].People[j].morale -= Math.pow(GD.Caravans[i].People[j].thirst,0.5) / 20;
                                 }
                                 else
                                 {
                                    GD.Caravans[i].People[j].morale += Math.pow(Math.abs(GD.Caravans[i].People[j].thirst),0.3) / 20;
                                 }
                                 GD.Caravans[i].People[j].morale -= (GD.Caravans[i].People[j].morale - 50) / 100;
                                 if(GD.Caravans[i].People[j].morale < 0)
                                 {
                                    GD.Caravans[i].People[j].morale = 0;
                                 }
                                 switch(GD.Caravans[i].People[j].wounded)
                                 {
                                    case 1:
                                       GD.Caravans[i].People[j].morale -= 0.0001;
                                       break;
                                    case 2:
                                       GD.Caravans[i].People[j].morale -= 0.0002;
                                       break;
                                    case 3:
                                       GD.Caravans[i].People[j].morale -= 0.001;
                                       break;
                                    case 4:
                                       GD.Caravans[i].People[j].morale -= 0.005;
                                 }
                                 totalHealed = 0;
                                 if(GD.Caravans[i].People[j].wounded > 0)
                                 {
                                    totalHealed += GD.Caravans[i].People[j].wounded * 2 * 360 / 1440;
                                    switch(GD.Caravans[i].People[j].wounded && (true || i != 0))
                                    {
                                       case 1:
                                          GD.Caravans[i].People[j].HP += GD.Caravans[i].People[j].maxHP / 1000 + 0.01;
                                          break;
                                       case 2:
                                          break;
                                       case 3:
                                          GD.Caravans[i].People[j].HP -= 0.1;
                                          if(!(GD.Caravans[i].People[j].passengerIn is TransportUnit))
                                          {
                                             GD.Caravans[i].People[j].HP -= 0.05;
                                          }
                                          break;
                                       case 4:
                                          GD.Caravans[i].People[j].HP -= 0.2;
                                          if(!(GD.Caravans[i].People[j].passengerIn is TransportUnit))
                                          {
                                             GD.Caravans[i].People[j].HP -= 0.1;
                                          }
                                    }
                                    useMeds = GameData.medsDosage[GD.Caravans[i].groupSettings[GD.Caravans[i].getSettingsGroup(GD.Caravans[i].People[j].category)].medicineUse[GD.Caravans[i].People[j].wounded]] * 360 / 1440;
                                    useMeds = Math.min(useMeds,GD.Caravans[i].meds);
                                    GD.Caravans[i].People[j].HP += useMeds / 40;
                                    GD.Caravans[i].reduceCargo(63,useMeds);
                                    if(GD.Caravans[i].historicalData[0] is Object)
                                    {
                                       GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                          "item":63,
                                          "amount":useMeds
                                       });
                                    }
                                    GD.Caravans[i].People[j].HP += GD.Caravans[i].doctorSkill / 2000 * GD.Caravans[i].People[j].wounded;
                                 }
                                 if(i == 0)
                                 {
                                    GD.Caravans[i].distributeExperience("doctorSkill","doctorExperience",totalHealed);
                                 }
                                 GD.Caravans[i].People[j].travelExperience += 0.1;
                                 if(GD.Caravans[i].People[j].HP > GD.Caravans[i].People[j].maxHP)
                                 {
                                    GD.Caravans[i].People[j].HP = GD.Caravans[i].People[j].maxHP;
                                 }
                                 GD.Caravans[i].People[j].cycleCounter -= 360;
                              }
                           }
                           j = Number(j) + 1;
                        }
                        j = 0;
                        while(j < GD.Caravans[i].People.length)
                        {
                           if(GD.Caravans[i].People[j].HP <= 0)
                           {
                              if(i == 0)
                              {
                                 if(j == 0)
                                 {
                                    GD.setMode(6,2723);
                                    stopped = true;
                                    return false;
                                 }
                                 openDialogue(4);
                                 dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(881,GD.Caravans[i].People[j].gender).replace("@name@",GD.Caravans[i].People[j].name).toUpperCase());
                                 if(GD.Caravans[i].People[j].specialPurpose == 1)
                                 {
                                    GD.Story.accompanyedByThum = false;
                                 }
                                 if(GD.Caravans[i].People[j].specialPurpose == 2)
                                 {
                                    GD.executeMajorEvent(38);
                                 }
                                 if(GD.Caravans[i].People[j].specialPurpose == 3)
                                 {
                                    GD.Story.spencerRiceIsDead = true;
                                 }
                                 if(GD.Caravans[i].People[j].specialPurpose == 9)
                                 {
                                    GD.Story.eliahsManDead = true;
                                 }
                                 if(GD.Caravans[i].People[j].specialPurpose == 11)
                                 {
                                    GD.Story.noraIsDead = true;
                                 }
                              }
                              GD.Caravans[i].removePerson(j);
                              j = Number(j) - 1;
                           }
                           j = Number(j) + 1;
                        }
                        if(GD.Caravans[i].People.length == 0)
                        {
                           GD.Caravans[i].active = false;
                        }
                        if(i == 0)
                        {
                           if(GD.Caravans[0].People[0].morale < 80)
                           {
                              GD.Caravans[0].People[0].morale += (80 - GD.Caravans[0].People[0].morale) / 100;
                           }
                           sortArray = [];
                           for(j in GD.Caravans[i].People)
                           {
                              sortArray.push(GD.Caravans[i].People[j]);
                           }
                           sortArray.sortOn("intelligence",18);
                           j = 0;
                           while(j < sortArray.length - 1)
                           {
                              k = j + 1;
                              while(k < sortArray.length)
                              {
                                 sortArray[k].morale += (sortArray[j].intelligence - sortArray[k].intelligence) * (sortArray[j].morale - sortArray[k].morale) / 1000;
                                 k = Number(k) + 1;
                              }
                              j = Number(j) + 1;
                           }
                        }
                        totalHeal = 0;
                        totalRepair = 0;
                        for(j in GD.Caravans[i].Transport)
                        {
                           GD.Caravans[i].Transport[j].cycleCounter += GD.gameSpeed * 4;
                           while(GD.Caravans[i].Transport[j].cycleCounter >= 360)
                           {
                              if(GD.Caravans[i].Transport[j].category == 1)
                              {
                                 for(k in GD.Caravans[i].Transport[j].production)
                                 {
                                    if((GD.Caravans[i].milk || GD.Caravans[i].Transport[j].production[k].item != TransportUnit.Types[GD.Caravans[i].Transport[j].type].milk.item) && (GD.Caravans[i].shear || GD.Caravans[i].Transport[j].production[k].item != 87))
                                    {
                                       GD.Caravans[i].addCargo(GD.Caravans[i].Transport[j].production[k].item,GD.Caravans[i].Transport[j].production[k].amount * 360 / 1440);
                                       if(GD.Caravans[i].historicalData.length > 0)
                                       {
                                          GameData.addItemToArray(GD.Caravans[i].historicalData[0].production,{
                                             "item":GD.Caravans[i].Transport[j].production[k].item,
                                             "amount":GD.Caravans[i].Transport[j].production[k].amount
                                          });
                                       }
                                    }
                                 }
                                 for(k in GD.Caravans[i].Transport[j].consumption)
                                 {
                                    amount = GD.Caravans[i].Transport[j].consumption[k].amount * 360 / 1440;
                                    if(GD.Caravans[i].Transport[j].consumption[k].item == TransportUnit.Types[GD.Caravans[i].Transport[j].type].milk.item && !GD.Caravans[i].milk)
                                    {
                                       if(GD.Caravans[i].Transport[j].mother is TransportUnit)
                                       {
                                          for(l in GD.Caravans[i].Transport)
                                          {
                                             if(GD.Caravans[i].Transport[l] == GD.Caravans[i].Transport[j].mother)
                                             {
                                                for(m in GD.Caravans[i].Transport[l].production)
                                                {
                                                   if(GD.Caravans[i].Transport[l].production[m].item == TransportUnit.Types[GD.Caravans[i].Transport[j].type].milk.item)
                                                   {
                                                      amount -= GD.Caravans[i].Transport[l].production[m].amount;
                                                      amount = Math.max(amount,0);
                                                   }
                                                }
                                                break;
                                             }
                                          }
                                       }
                                    }
                                    if(amount > 0)
                                    {
                                       itemInd = GD.Caravans[i].findCargo(GD.Caravans[i].Transport[j].consumption[k].item);
                                       if(itemInd === false)
                                       {
                                          actualAmount = 0;
                                       }
                                       else
                                       {
                                          actualAmount = Math.min(amount,itemInd.amount);
                                       }
                                       if(actualAmount < amount)
                                       {
                                          amountRel = actualAmount / amount;
                                          if(GD.Caravans[i].Transport[j].consumption[k].item == 62)
                                          {
                                             GD.Caravans[i].Transport[j].hunger += (1 - amountRel) * 3;
                                          }
                                          if(GD.Caravans[i].Transport[j].consumption[k].item == 1)
                                          {
                                             GD.Caravans[i].Transport[j].thirst += (1 - amountRel) * 3;
                                          }
                                          if(GD.Caravans[i].Transport[j].consumption[k].item == TransportUnit.Types[GD.Caravans[i].Transport[j].type].milk.item)
                                          {
                                             caloriesToAdd = Item.getDataFromType(GD.Caravans[i].Transport[j].consumption[k].item).calories * (amount - actualAmount);
                                             for(l in GD.Caravans[i].Cargo)
                                             {
                                                if(GD.Caravans[i].Cargo[l].itemData.milk && GD.Caravans[i].Cargo[l].type != GD.Caravans[i].Transport[j].consumption[k].item)
                                                {
                                                   neededAmount = caloriesToAdd / GD.Caravans[i].Cargo[l].itemData.calories;
                                                   if(neededAmount <= GD.Caravans[i].Cargo[l].amount)
                                                   {
                                                      if(GD.Caravans[i].historicalData.length > 0)
                                                      {
                                                         GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                                            "item":GD.Caravans[i].Cargo[l].type,
                                                            "amount":neededAmount
                                                         });
                                                      }
                                                      GD.Caravans[i].reduceCargo(GD.Caravans[i].Cargo[l].type,neededAmount);
                                                      caloriesToAdd = 0;
                                                      break;
                                                   }
                                                   caloriesToAdd -= GD.Caravans[i].Cargo[l].amount * GD.Caravans[i].Cargo[l].itemData.calories;
                                                   if(GD.Caravans[i].historicalData.length > 0)
                                                   {
                                                      GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                                         "item":GD.Caravans[i].Cargo[l].type,
                                                         "amount":GD.Caravans[i].Cargo[l].amount
                                                      });
                                                   }
                                                   GD.Caravans[i].reduceCargo(GD.Caravans[i].Cargo[l].type,GD.Caravans[i].Cargo[l].amount);
                                                   l = Number(l) - 1;
                                                }
                                             }
                                             if(caloriesToAdd > 0)
                                             {
                                                amountRel = 1 - caloriesToAdd / (amount * Item.getDataFromType(GD.Caravans[i].Transport[j].consumption[k].item).calories);
                                                GD.Caravans[i].Transport[j].hunger += (1 - amountRel) * 2;
                                                GD.Caravans[i].Transport[j].thirst += (1 - amountRel) * 2 / GD.Caravans[i].Transport[j].droughtTolerance;
                                             }
                                             else
                                             {
                                                if(GD.Caravans[i].Transport[j].hunger > 0)
                                                {
                                                   GD.Caravans[i].Transport[j].hunger -= GD.Caravans[i].Transport[j].hunger / 4 + 10;
                                                   if(GD.Caravans[i].Transport[j].hunger < 0)
                                                   {
                                                      GD.Caravans[i].Transport[j].hunger = 0;
                                                   }
                                                }
                                                if(GD.Caravans[i].Transport[j].thirst > 0)
                                                {
                                                   GD.Caravans[i].Transport[j].thirst -= GD.Caravans[i].Transport[j].thirst / 4 + 10;
                                                   if(GD.Caravans[i].Transport[j].thirst < 0)
                                                   {
                                                      GD.Caravans[i].Transport[j].thirst = 0;
                                                   }
                                                }
                                             }
                                          }
                                       }
                                       else
                                       {
                                          if(GD.Caravans[i].Transport[j].consumption[k].item == 62 && GD.Caravans[i].Transport[j].hunger > 0)
                                          {
                                             GD.Caravans[i].Transport[j].hunger -= GD.Caravans[i].Transport[j].hunger / 4 + 10;
                                             if(GD.Caravans[i].Transport[j].hunger < 0)
                                             {
                                                GD.Caravans[i].Transport[j].hunger = 0;
                                             }
                                          }
                                          if(GD.Caravans[i].Transport[j].consumption[k].item == 1 && GD.Caravans[i].Transport[j].thirst > 0)
                                          {
                                             GD.Caravans[i].Transport[j].thirst -= GD.Caravans[i].Transport[j].thirst / 4 + 10;
                                             if(GD.Caravans[i].Transport[j].thirst < 0)
                                             {
                                                GD.Caravans[i].Transport[j].thirst = 0;
                                             }
                                          }
                                          if(GD.Caravans[i].Transport[j].consumption[k].item == TransportUnit.Types[GD.Caravans[i].Transport[j].type].milk.item)
                                          {
                                             if(GD.Caravans[i].Transport[j].hunger > 0)
                                             {
                                                GD.Caravans[i].Transport[j].hunger -= GD.Caravans[i].Transport[j].hunger / 4 + 10;
                                                if(GD.Caravans[i].Transport[j].hunger < 0)
                                                {
                                                   GD.Caravans[i].Transport[j].hunger = 0;
                                                }
                                             }
                                             if(GD.Caravans[i].Transport[j].thirst > 0)
                                             {
                                                GD.Caravans[i].Transport[j].thirst -= GD.Caravans[i].Transport[j].thirst / 4 + 10;
                                                if(GD.Caravans[i].Transport[j].thirst < 0)
                                                {
                                                   GD.Caravans[i].Transport[j].thirst = 0;
                                                }
                                             }
                                          }
                                       }
                                       GD.Caravans[i].reduceCargo(GD.Caravans[i].Transport[j].consumption[k].item,actualAmount);
                                       if(GD.Caravans[i].historicalData[0] is Object)
                                       {
                                          GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                             "item":GD.Caravans[i].Transport[j].consumption[k].item,
                                             "amount":actualAmount
                                          });
                                       }
                                    }
                                    else
                                    {
                                       if(GD.Caravans[i].Transport[j].consumption[k].item == 62 && GD.Caravans[i].Transport[j].hunger > 0)
                                       {
                                          GD.Caravans[i].Transport[j].hunger -= GD.Caravans[i].Transport[j].hunger / 4 + 10;
                                          if(GD.Caravans[i].Transport[j].hunger < 0)
                                          {
                                             GD.Caravans[i].Transport[j].hunger = 0;
                                          }
                                       }
                                       if(GD.Caravans[i].Transport[j].consumption[k].item == 1 && GD.Caravans[i].Transport[j].thirst > 0)
                                       {
                                          GD.Caravans[i].Transport[j].thirst -= GD.Caravans[i].Transport[j].thirst / 4 + 10;
                                          if(GD.Caravans[i].Transport[j].thirst < 0)
                                          {
                                             GD.Caravans[i].Transport[j].thirst = 0;
                                          }
                                       }
                                       if(GD.Caravans[i].Transport[j].consumption[k].item == TransportUnit.Types[GD.Caravans[i].Transport[j].type].milk.item)
                                       {
                                          if(GD.Caravans[i].Transport[j].hunger > 0)
                                          {
                                             GD.Caravans[i].Transport[j].hunger -= GD.Caravans[i].Transport[j].hunger / 4 + 10;
                                             if(GD.Caravans[i].Transport[j].hunger < 0)
                                             {
                                                GD.Caravans[i].Transport[j].hunger = 0;
                                             }
                                          }
                                          if(GD.Caravans[i].Transport[j].thirst > 0)
                                          {
                                             GD.Caravans[i].Transport[j].thirst -= GD.Caravans[i].Transport[j].thirst / 4 + 10;
                                             if(GD.Caravans[i].Transport[j].thirst < 0)
                                             {
                                                GD.Caravans[i].Transport[j].thirst = 0;
                                             }
                                          }
                                       }
                                    }
                                 }
                                 GD.Caravans[i].Transport[j].hunger *= 0.985;
                                 GD.Caravans[i].Transport[j].thirst *= 0.995;
                                 if(GD.Caravans[i].Transport[j].hunger > 0)
                                 {
                                    if(i == 0)
                                    {
                                       trace(GD.Caravans[i].Transport[j].name + "\'s hunger is " + GD.Caravans[i].Transport[j].hunger + " and it\'s losing " + Math.pow(GD.Caravans[i].Transport[j].hunger,2) / 1000 + " over it.");
                                    }
                                    GD.Caravans[i].Transport[j].health -= Math.pow(GD.Caravans[i].Transport[j].hunger,2) / 1000;
                                 }
                                 if(GD.Caravans[i].Transport[j].weight < GD.Caravans[i].Transport[j].idealWeight * 0.7)
                                 {
                                    if(i == 0)
                                    {
                                       trace(GD.Caravans[i].Transport[j].name + " is severly underweight: " + GD.Caravans[i].Transport[j].weight + "/" + GD.Caravans[i].Transport[j].idealWeight + " and is losing " + GD.Caravans[i].Transport[j].idealWeight * 0.1 / GD.Caravans[i].Transport[j].weight * 2 + " over it");
                                    }
                                    GD.Caravans[i].Transport[j].health -= GD.Caravans[i].Transport[j].idealWeight * 0.1 / GD.Caravans[i].Transport[j].weight * 2;
                                 }
                                 if(GD.Caravans[i].Transport[j].thirst > 0)
                                 {
                                    if(i == 0)
                                    {
                                       trace(GD.Caravans[i].Transport[j].name + "\'s thirst is " + GD.Caravans[i].Transport[j].thirst + " and it\'s losing " + Math.pow(GD.Caravans[i].Transport[j].thirst,2) / 100 / GD.Caravans[i].Transport[j].droughtTolerance + " over it.");
                                    }
                                    GD.Caravans[i].Transport[j].health -= Math.pow(GD.Caravans[i].Transport[j].thirst,2) / 100 / GD.Caravans[i].Transport[j].droughtTolerance;
                                 }
                                 distFromIdeal = GD.Caravans[i].Transport[j].idealWeight - GD.Caravans[i].Transport[j].weight;
                                 GD.Caravans[i].Transport[j].weight += distFromIdeal * 360 / 1440 / 300;
                                 if(GD.Caravans[i].Transport[j].hunger > 0)
                                 {
                                    GD.Caravans[i].Transport[j].weight -= GD.Caravans[i].Transport[j].hunger / 100;
                                 }
                                 if(GD.Caravans[i].Transport[j].health < GD.Caravans[i].Transport[j].maxHealth)
                                 {
                                    totalHeal = Number(totalHeal) + 1;
                                    GD.Caravans[i].Transport[j].health += GD.Caravans[i].veterinarySkill / 1500;
                                    if(GD.Caravans[i].Transport[j].health > GD.Caravans[i].Transport[j].maxHealth)
                                    {
                                       GD.Caravans[i].Transport[j].health = GD.Caravans[i].Transport[j].maxHealth;
                                    }
                                 }
                                 weightRel = GD.Caravans[i].Transport[j].weight / GD.Caravans[i].Transport[j].idealWeight;
                                 GD.Caravans[i].Transport[j].age += 360 / 1440;
                                 GD.Caravans[i].Transport[j].weight = GD.Caravans[i].Transport[j].idealWeight * weightRel;
                                 if(GD.Caravans[i].Transport[j].age >= GD.Caravans[i].Transport[j].maxAge)
                                 {
                                    GD.Caravans[i].Transport[j].health = 0;
                                 }
                                 if(GD.Caravans[i].Transport[j].gender == 2 && GD.Caravans[i].Transport[j].agePeriod == 3 && !GD.Caravans[i].Transport[j].pregnant && GD.Caravans[i].Transport[j].remainingLactation <= GD.Caravans[i].Transport[j].lactation * 0.9)
                                 {
                                    theresAMale = false;
                                    for(k in GD.Caravans[i].Transport)
                                    {
                                       if(GD.Caravans[i].Transport[k].type == GD.Caravans[i].Transport[j].type && GD.Caravans[i].Transport[k].gender == 1 && GD.Caravans[i].Transport[k].agePeriod == 3)
                                       {
                                          theresAMale = true;
                                          break;
                                       }
                                    }
                                    if(theresAMale)
                                    {
                                       count = MathFunctions.ProbabilityRandom(360 / 1440 / (TransportUnit.Types[GD.Caravans[i].Transport[k].type].lifespan * 30 / 1000));
                                       while(count > 0)
                                       {
                                          GD.Caravans[i].Transport[j].pregnant = true;
                                          GD.Caravans[i].Transport[j].remainingPregnancy = TransportUnit.Types[GD.Caravans[i].Transport[k].type].gestation * (0.9 + Math.random() * 0.2);
                                          GD.Caravans[i].Transport[j].pregnantWith = Math.round(GD.Caravans[i].Transport[j].averageKids * (0.5 + Math.random()));
                                          if(GD.Caravans[i].Transport[j].pregnantWith < 1)
                                          {
                                             GD.Caravans[i].Transport[j].pregnantWith = 1;
                                          }
                                          count = Number(count) - 1;
                                       }
                                    }
                                 }
                                 if(GD.Caravans[i].Transport[j].pregnant)
                                 {
                                    GD.Caravans[i].Transport[j].remainingPregnancy -= 360 / 1440;
                                    if(GD.Caravans[i].Transport[j].remainingPregnancy <= 0)
                                    {
                                       if(GD.Caravans[i].Transport[j].pregnantWith <= 0)
                                       {
                                          GD.Caravans[i].Transport[j].pregnantWith = Math.round(GD.Caravans[i].Transport[j].averageKids);
                                       }
                                       GD.Caravans[i].Transport[j].pregnant = false;
                                       GD.Caravans[i].Transport[j].remainingLactation = TransportUnit.Types[GD.Caravans[i].Transport[k].type].lactation * (0.9 + Math.random() * 0.2);
                                       k = 1;
                                       while(k <= GD.Caravans[i].Transport[j].pregnantWith)
                                       {
                                          newAnimal = new TransportUnit(GD.Caravans[i].Transport[j].type);
                                          newAnimal.age = 0;
                                          newAnimal.weight = newAnimal.idealWeight * (0.8 + Math.random() * 0.4);
                                          newAnimal.mother = GD.Caravans[i].Transport[j];
                                          GD.Caravans[i].addTransport(newAnimal);
                                          k = Number(k) + 1;
                                       }
                                       openDialogue(4);
                                       if(GD.Caravans[i].Transport[j].pregnantWith == 1)
                                       {
                                          dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(1260).replace("@animal@",newAnimal.name).toUpperCase());
                                       }
                                       else
                                       {
                                          dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(3508).replace("@animalname@",GD.Caravans[i].Transport[j].name).replace("@number@",GD.Caravans[i].Transport[j].pregnantWith).toUpperCase());
                                       }
                                    }
                                 }
                                 if(GD.Caravans[i].Transport[j].remainingLactation > 0)
                                 {
                                    GD.Caravans[i].Transport[j].remainingLactation -= 360 / 1440;
                                    if(GD.Caravans[i].Transport[j].remainingLactation < 0)
                                    {
                                       GD.Caravans[i].Transport[j].remainingLactation = 0;
                                    }
                                 }
                              }
                              if(GD.Caravans[i].Transport[j].category == 2 || GD.Caravans[i].Transport[j].category == 3)
                              {
                                 if(GD.Caravans[i].Transport[j].health < GD.Caravans[i].Transport[j].maxHealth)
                                 {
                                    GD.Caravans[i].Transport[j].health += GD.Caravans[i].mechanicSkill / 1000;
                                    GD.Caravans[i].Transport[j].health += GD.Caravans[i].mechanicSkill / 1000;
                                    totalRepair = Number(totalRepair) + 1;
                                    if(GD.Caravans[i].Transport[j].health > GD.Caravans[i].Transport[j].maxHealth)
                                    {
                                       GD.Caravans[i].Transport[j].health = GD.Caravans[i].Transport[j].maxHealth;
                                    }
                                 }
                                 if(GD.Caravans[i].autoFillLubricant && GD.Caravans[i].Transport[j].lubricantLevel < GD.Caravans[i].Transport[j].maxLubricant)
                                 {
                                    actualAmount = GD.Caravans[i].Transport[j].maxLubricant - GD.Caravans[i].Transport[j].lubricantLevel;
                                    itemInd = GD.Caravans[i].findCargo(79);
                                    if(itemInd === false)
                                    {
                                       amount = 0;
                                    }
                                    else
                                    {
                                       amount = itemInd.amount;
                                    }
                                    actualAmount = Math.min(actualAmount,amount);
                                    GD.Caravans[i].Transport[j].lubricantLevel += actualAmount;
                                    GD.Caravans[i].reduceCargo(79,actualAmount);
                                    if(GD.Caravans[i].historicalData.length > 0)
                                    {
                                       GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                          "item":79,
                                          "amount":actualAmount
                                       });
                                    }
                                 }
                                 if(GD.Caravans[i].Transport[j].category == 3 && GD.Caravans[i].autoFillWater && GD.Caravans[i].Transport[j].waterLevel < GD.Caravans[i].Transport[j].maxWater)
                                 {
                                    actualAmount = GD.Caravans[i].Transport[j].maxWater - GD.Caravans[i].Transport[j].waterLevel;
                                    itemInd = GD.Caravans[i].findCargo(1);
                                    if(itemInd === false)
                                    {
                                       amount = 0;
                                    }
                                    else
                                    {
                                       amount = itemInd.amount;
                                    }
                                    actualAmount = Math.min(actualAmount,amount);
                                    GD.Caravans[i].Transport[j].waterLevel += actualAmount;
                                    GD.Caravans[i].reduceCargo(1,actualAmount);
                                    if(GD.Caravans[i].historicalData.length > 0)
                                    {
                                       GameData.addItemToArray(GD.Caravans[i].historicalData[0].consumption,{
                                          "item":1,
                                          "amount":actualAmount
                                       });
                                    }
                                 }
                              }
                              if(Math.random() < 0.001)
                              {
                                 GD.Caravans[i].Transport[j].health -= GD.Caravans[i].Transport[j].maxHealth * 0.05 * Math.random();
                              }
                              GD.Caravans[i].Transport[j].cycleCounter -= 360;
                           }
                           GD.Caravans[i].Transport[j].normalizePassengers();
                        }
                        if(i == 0)
                        {
                           GD.Caravans[i].distributeExperience("veterinarySkill","veterinaryExperience",totalHeal * 1 * 360 / 1440);
                        }
                        if(i == 0)
                        {
                           GD.Caravans[i].distributeExperience("mechanicSkill","mechanicExperience",totalRepair * 0.2 * 360 / 1440);
                        }
                        j = 0;
                        while(j < GD.Caravans[i].Transport.length)
                        {
                           if(GD.Caravans[i].Transport[j].health <= 0)
                           {
                              if(i == 0)
                              {
                                 openDialogue(4);
                                 if(GD.Caravans[i].Transport[j].category == 1)
                                 {
                                    dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(881,GD.Caravans[i].Transport[j].gender).replace("@name@",GD.Caravans[i].Transport[j].name).toUpperCase());
                                 }
                                 else
                                 {
                                    dialoguesOpen[dialoguesOpen.length - 1].setText(Texts.fetch(1259).replace("@transport@",GD.Caravans[i].Transport[j].name).toUpperCase());
                                 }
                              }
                              GD.Caravans[i].removeTransport(GD.Caravans[i].Transport[j]);
                              j = Number(j) - 1;
                           }
                           j = Number(j) + 1;
                        }
                        if(GD.Caravans[i].staticMode && GD.Caravans[i].needsUpdate)
                        {
                           if(i != 0)
                           {
                           }
                           GD.Caravans[i].update();
                        }
                        if(i != 0)
                        {
                           totalCargoSave = GD.Caravans[i].totalCargo;
                           maxCargoSave = GD.Caravans[i].maxCargo;
                           overweight = totalCargoSave - maxCargoSave;
                           if(overweight > 1)
                           {
                              availableFood = 0;
                              foodArray = [];
                              trace(GD.Caravans[i].name + " is overloaded by " + overweight);
                              cargoArr = [];
                              for(j in GD.Caravans[i].Cargo)
                              {
                                 cargoArr.push({
                                    "item":GD.Caravans[i].Cargo[j],
                                    "pricePerKG":GD.globalItemPrice(GD.Caravans[i].Cargo[j].type) / GD.Caravans[i].Cargo[j].weightPerUnit
                                 });
                                 if(GD.Caravans[i].Cargo[j].type == 1)
                                 {
                                    cargoArr[cargoArr.length - 1].canThrow = GD.Caravans[i].Cargo[j].amount - GD.Caravans[i].totalWaterConsumption() * 10;
                                 }
                                 else if(GD.Caravans[i].Cargo[j].itemData.food)
                                 {
                                    availableFood += GD.Caravans[i].Cargo[j].amount * GD.Caravans[i].Cargo[j].itemData.calories;
                                    foodArray.push({
                                       "item":GD.Caravans[i].Cargo[j],
                                       "index":cargoArr.length - 1,
                                       "price":GD.globalItemPrice(GD.Caravans[i].Cargo[j].type) / GD.Caravans[i].Cargo[j].itemData.calories
                                    });
                                 }
                                 else if(GD.Caravans[i].Cargo[j].itemData.liquidsContainer)
                                 {
                                    cargoArr[cargoArr.length - 1].canThrow = GD.Caravans[i].Cargo[j].amount - GD.Caravans[i].Cargo[j].inUse;
                                 }
                                 else if(GD.Caravans[i].Cargo[j].type == 62)
                                 {
                                    forageConsumption = 0;
                                    for(k in GD.Caravans[i].Transport)
                                    {
                                       if(GD.Caravans[i].Transport[k].category == 1 && GD.Caravans[i].Transport[k].forageConsumption > 0)
                                       {
                                          forageConsumption += GD.Caravans[i].Transport[k].forageConsumption;
                                       }
                                    }
                                    cargoArr[cargoArr.length - 1].canThrow = GD.Caravans[i].Cargo[j].amount - forageConsumption * 10;
                                 }
                                 else if(GD.Caravans[i].Cargo[j].type == 64)
                                 {
                                    thereAreCars = false;
                                    for(k in GD.Caravans[i].Transport)
                                    {
                                       if(GD.Caravans[i].Transport[k].category == 3)
                                       {
                                          thereAreCars = true;
                                          break;
                                       }
                                    }
                                    if(thereAreCars)
                                    {
                                       cargoArr[cargoArr.length - 1].canThrow = 0;
                                    }
                                    else
                                    {
                                       totalFuelConsumption = 0;
                                       for(k in GD.Caravans[i].Cargo)
                                       {
                                          for(l in GD.Caravans[i].Cargo[k].consumption)
                                          {
                                             if(GD.Caravans[i].Cargo[k].consumption[l].item == 64)
                                             {
                                                totalFuelConsumption += GD.Caravans[i].Cargo[k].consumption[l].amount;
                                             }
                                          }
                                       }
                                       cargoArr[cargoArr.length - 1].canThrow = GD.Caravans[i].Cargo[j].amount - totalFuelConsumption * 10;
                                    }
                                 }
                                 else
                                 {
                                    cargoArr[cargoArr.length - 1].canThrow = GD.Caravans[i].Cargo[j].amount - GD.Caravans[i].Cargo[j].inUse;
                                 }
                              }
                              foodToThrow = availableFood - GD.Caravans[i].totalFoodConsumption();
                              trace("food to throw: " + foodToThrow);
                              if(foodToThrow > 0)
                              {
                                 foodArray.sortOn("price",16);
                                 j = 0;
                                 while(j < foodArray.length)
                                 {
                                    throwing = Math.min(foodArray[j].item.amount * foodArray[j].item.itemData.calories,foodToThrow);
                                    cargoArr[foodArray[j].index].canThrow = throwing / foodArray[j].item.itemData.calories;
                                    foodToThrow -= throwing;
                                    j = Number(j) + 1;
                                 }
                              }
                              else
                              {
                                 for(j in foodArray)
                                 {
                                    cargoArr[foodArray[j].index].canThrow = foodToThrow / 500 * foodArray[j].price / GameData.foodAveragePrice;
                                 }
                              }
                              for(j in cargoArr)
                              {
                                 cargoArr[j].throwScore = cargoArr[j].canThrow * cargoArr[j].item.weightPerUnit - cargoArr[j].pricePerKG / 100;
                                 if(cargoArr[j].item.category == 3 && cargoArr[j].item.inUse > 0)
                                 {
                                    cargoArr[j].throwScore -= 100;
                                 }
                              }
                              cargoArr.sortOn("throwScore",18);
                              count = 0;
                              redistributeEquipment = false;
                              while(overweight > 1)
                              {
                                 for(j in cargoArr)
                                 {
                                    throwing = Math.min(Math.min(Math.max(cargoArr[j].canThrow,1),cargoArr[j].item.amount),overweight / cargoArr[j].item.weightPerUnit);
                                    if(!cargoArr[j].item.itemData.divisible)
                                    {
                                       throwing = Math.min(Math.ceil(throwing),cargoArr[j].item.amount);
                                    }
                                    freeItems = cargoArr[j].item.amount - cargoArr[j].item.inUse;
                                    if(freeItems < throwing)
                                    {
                                       toUnuse = throwing - freeItems;
                                       if(cargoArr[j].item.category == 2 || cargoArr[j].item.category == 3 || cargoArr[j].item.category == 4 || cargoArr[j].item.category == 5)
                                       {
                                          redistributeEquipment = true;
                                       }
                                       else
                                       {
                                          cargoArr[j].item.inUse -= toUnuse;
                                       }
                                    }
                                    GD.Caravans[i].reduceCargo(cargoArr[j].item.type,throwing);
                                    overweight -= throwing * cargoArr[j].item.weightPerUnit;
                                    if(overweight <= 0)
                                    {
                                       break;
                                    }
                                 }
                                 count = Number(count) + 1;
                                 if(count > 100)
                                 {
                                    break;
                                 }
                              }
                              GD.Caravans[i].distributeLiquidsContainers(true);
                              GD.Caravans[i].update();
                              if(redistributeEquipment)
                              {
                                 GD.Caravans[i].distributeWeapons();
                                 GD.Caravans[i].distributeAmmo();
                                 GD.Caravans[i].distributeArmor();
                              }
                           }
                        }
                     }
                  }
               }
               for(i in GD.Towns)
               {
                  if(GD.Towns[i].active)
                  {
                     GD.Towns[i].cycleCounter += GD.gameSpeed * 4;
                     if(forceTownUpdate)
                     {
                        GD.Towns[i].cycleCounter += 720;
                     }
                     while(GD.Towns[i].cycleCounter >= 720)
                     {
                        GD.Towns[i].money += GD.Towns[i].population * 2;
                        if(GD.storyMode && GD.Story is Caravaneer2MainStory)
                        {
                           if(i == 17)
                           {
                              if(GD.Story.fafnirStartsKukulAssassination && !GD.Story.kukulIsDead && GD.Time >= GD.Story.kukulAssassinationTime)
                              {
                                 openDialogue(15);
                                 GD.executeMajorEvent(9);
                              }
                           }
                           if(i == 20)
                           {
                              if(GD.Story.negotiationsOver && !GD.Story.drekarLeft && !GD.Story.kiviStartedAttack && GD.Time - GD.Story.negotiationEndTime > 259200)
                              {
                                 GD.executeMajorEvent(16);
                              }
                           }
                        }
                        GD.newHistoricalPoint(GD.Towns[i],GD.Time - (Math.floor(GD.Towns[i].cycleCounter / 720) - 1) * 720 - GD.Towns[i].cycleCounter % 720);
                        consumptionProduction = GameData.calculateConsumptionProduction(GD.Towns[i].industries,GD.Towns[i].stock,720 / 1440);
                        townConsProd = {
                           "consumption":consumptionProduction.consumption,
                           "production":consumptionProduction.production
                        };
                        GameData.addArrayToArray(GD.Towns[i].historicalData[0].production,consumptionProduction.production);
                        GameData.addArrayToArray(GD.Towns[i].historicalData[0].consumption,consumptionProduction.consumption);
                        for(j in consumptionProduction.consumption)
                        {
                           GD.Towns[i].removeFromStock(consumptionProduction.consumption[j].item,consumptionProduction.consumption[j].amount);
                        }
                        for(j in GD.Towns[i].incompleteProduction)
                        {
                           GameData.addItemToArray(consumptionProduction.production,GD.Towns[i].incompleteProduction[j]);
                        }
                        GD.Towns[i].incompleteProduction = [];
                        foodProduction = 0;
                        for(j in consumptionProduction.production)
                        {
                           restingProduction = consumptionProduction.production[j].amount - Math.floor(consumptionProduction.production[j].amount);
                           if(restingProduction > 0)
                           {
                              GameData.addItemToArray(GD.Towns[i].incompleteProduction,{
                                 "item":consumptionProduction.production[j].item,
                                 "amount":restingProduction
                              });
                           }
                           if(consumptionProduction.production[j].amount >= 1)
                           {
                              if(consumptionProduction.production[j].item == 97)
                              {
                                 GD.Towns[i].money += Math.floor(consumptionProduction.production[j].amount);
                              }
                              else
                              {
                                 GD.Towns[i].addToStock(consumptionProduction.production[j].item,Math.floor(consumptionProduction.production[j].amount));
                              }
                           }
                           if(Item.getDataFromType(consumptionProduction.production[j].item).food)
                           {
                              foodProduction += Item.getDataFromType(consumptionProduction.production[j].item).calories * Math.floor(consumptionProduction.production[j].amount);
                           }
                        }
                        remainingFoodConsumption = GD.Towns[i].totalFoodConsumption * 720 / 1440;
                        remainingWaterConsumption = GD.Towns[i].totalWaterConsumption * 720 / 1440;
                        GameData.addItemToArray(townConsProd.consumption,{
                           "item":1,
                           "amount":remainingWaterConsumption
                        });
                        allFood = [];
                        for(j in GD.Towns[i].stock)
                        {
                           if(GD.Towns[i].stock[j].itemData.food)
                           {
                              allFood.push({
                                 "item":GD.Towns[i].stock[j].type,
                                 "amount":GD.Towns[i].stock[j].amount,
                                 "price":GD.calculatePrice(GD.Towns[i],GD.Towns[i].stock[j].type,1,true) / GD.Towns[i].stock[j].itemData.calories
                              });
                           }
                        }
                        smallestDifference = Infinity;
                        for(j in allFood)
                        {
                           allFood[j].differenceFromPerfect = allFood[j].price - GD.Towns[i].perfectFoodPrice;
                           if(allFood[j].differenceFromPerfect > 0)
                           {
                              allFood[j].differenceFromPerfect *= 5;
                           }
                           allFood[j].differenceFromPerfect = Math.abs(allFood[j].differenceFromPerfect);
                           smallestDifference = Math.min(smallestDifference,allFood[j].differenceFromPerfect);
                        }
                        for(j in allFood)
                        {
                           allFood[j].differenceFromPerfect /= Math.max(smallestDifference,0.00001);
                        }
                        oneChunk = remainingFoodConsumption / allFood.length;
                        while(allFood.length > 0 && remainingFoodConsumption > 0)
                        {
                           j = 0;
                           while(j < allFood.length)
                           {
                              if(allFood.length == 1)
                              {
                                 consumeThisInKCal = remainingFoodConsumption;
                              }
                              else
                              {
                                 consumeThisInKCal = Math.min(oneChunk * (1 / Math.max(Math.min(allFood[j].differenceFromPerfect,10),0.01)) * (0.5 + Math.random()),remainingFoodConsumption);
                              }
                              consumeThisInUnits = consumeThisInKCal / Item.getDataFromType(allFood[j].item).calories;
                              consumeThisInUnits = Math.min(consumeThisInUnits,allFood[j].amount);
                              consumeThisInKCal = consumeThisInUnits * Item.getDataFromType(allFood[j].item).calories;
                              remainingFoodConsumption -= consumeThisInKCal;
                              allFood[j].amount -= consumeThisInUnits;
                              GD.Towns[i].removeFromStock(allFood[j].item,consumeThisInUnits);
                              if(GD.Towns[i].historicalData.length > 0)
                              {
                                 GameData.addItemToArray(GD.Towns[i].historicalData[0].consumption,{
                                    "item":allFood[j].item,
                                    "amount":consumeThisInUnits
                                 });
                              }
                              remainingWaterConsumption -= consumeThisInUnits * Item.getDataFromType(allFood[j].item).waterPercentage;
                              if(allFood[j].amount <= 0)
                              {
                                 allFood.splice(j,1);
                                 j = Number(j) - 1;
                              }
                              if(remainingFoodConsumption <= 0)
                              {
                                 break;
                              }
                              j = Number(j) + 1;
                           }
                        }
                        GD.Towns[i].removeFromStock(1,remainingWaterConsumption);
                        if(GD.Towns[i].historicalData.length > 0)
                        {
                           GameData.addItemToArray(GD.Towns[i].historicalData[0].consumption,{
                              "item":1,
                              "amount":remainingWaterConsumption
                           });
                        }
                        for(j in GameData.itemCategories)
                        {
                           if(GameData.itemCategories[j] != "food")
                           {
                              distributeGoodsCategory(GameData.itemCategories[j],GD.Towns[i]);
                           }
                        }
                        consumptionProduction = GD.Towns[i].generatePopulationConsumption(720 / 1440);
                        GameData.addArrayToArray(townConsProd.consumption,consumptionProduction);
                        j = 0;
                        while(j < consumptionProduction.length)
                        {
                           found = false;
                           for(k in GD.Towns[i].stock)
                           {
                              if(GD.Towns[i].stock[k].type == consumptionProduction[j].item)
                              {
                                 consumptionProduction[j].amount = Math.min(consumptionProduction[j].amount,GD.Towns[i].stock[k].amount);
                                 found = true;
                                 break;
                              }
                           }
                           if(consumptionProduction[j].amount > 0 && found)
                           {
                              GD.Towns[i].removeFromStock(consumptionProduction[j].item,consumptionProduction[j].amount);
                           }
                           else
                           {
                              consumptionProduction.splice(j,1);
                              j = Number(j) - 1;
                           }
                           j = Number(j) + 1;
                        }
                        if(consumptionProduction.length > 0)
                        {
                           GameData.addArrayToArray(GD.Towns[i].historicalData[0].consumption,consumptionProduction);
                        }
                        consumptionStock = [];
                        for(j in GD.Towns[i].playersIndustries)
                        {
                           savedConsumption = GD.Towns[i].playersIndustries[j].consumption;
                           for(k in savedConsumption)
                           {
                              savedConsumption[k].amount *= 720 / 1440;
                              GameData.addItemToArray(consumptionStock,savedConsumption[k]);
                           }
                        }
                        for(j in consumptionStock)
                        {
                           consumptionStock[j].available = 0;
                           for(k in GD.Towns[i].playersStorage)
                           {
                              if(GD.Towns[i].playersStorage[k].type == consumptionStock[j].item)
                              {
                                 consumptionStock[j].available = GD.Towns[i].playersStorage[k].amount;
                              }
                           }
                        }
                        producedProducts = [];
                        for(k in GD.Towns[i].playersIndustries)
                        {
                           savedProduction = GD.Towns[i].playersIndustries[k].production;
                           for(l in savedProduction)
                           {
                              savedProduction[l].amount *= 720 / 1440;
                              GameData.addItemToArray(producedProducts,savedProduction[l]);
                           }
                        }
                        k = 0;
                        while(k < producedProducts.length)
                        {
                           l = 0;
                           while(l < consumptionStock.length)
                           {
                              if(consumptionStock[l].item == producedProducts[k].item)
                              {
                                 if(consumptionStock[l].amount >= producedProducts[k].amount)
                                 {
                                    consumptionStock[l].amount -= producedProducts[k].amount;
                                    producedProducts.splice(k,1);
                                    k = Number(k) - 1;
                                 }
                                 else
                                 {
                                    producedProducts[k].amount -= consumptionStock[l].amount;
                                    consumptionStock.splice(l,1);
                                    l = Number(l) - 1;
                                 }
                                 break;
                              }
                              l = Number(l) + 1;
                           }
                           k = Number(k) + 1;
                        }
                        for(j in producedProducts)
                        {
                           producedProducts[j].relativePrice = GD.calculatePrice(GD.Towns[i],producedProducts[j].item,1,false) / GD.globalItemPrice(producedProducts[j].item);
                        }
                        producedProducts.sortOn("relativePrice",18);
                        totalMoneyRequired = 0;
                        totalSpaceRequired = 0;
                        for(j in consumptionStock)
                        {
                           if(consumptionStock[j].amount > consumptionStock[j].available)
                           {
                              amountToBuy = 0;
                              for(k in GD.Towns[i].stock)
                              {
                                 if(GD.Towns[i].stock[k].type == consumptionStock[j].item)
                                 {
                                    amountToBuy = Math.min(consumptionStock[j].amount - consumptionStock[j].available,GD.Towns[i].stock[k].amount);
                                    break;
                                 }
                              }
                              consumptionStock[j].canBuy = amountToBuy;
                              if(amountToBuy > 0)
                              {
                                 moneyRequired = GD.calculatePrice(GD.Towns[i],consumptionStock[j].item,amountToBuy,true);
                                 spaceRequired = Item.getDataFromType(consumptionStock[j].item).weight * amountToBuy;
                                 spaceRequired -= GD.Towns[i].playersStorageSpace - GD.Towns[i].occupiedPlayersStorageSpace;
                                 moneyRequired -= GD.Towns[i].playersMoney;
                                 if(moneyRequired > 0)
                                 {
                                    totalMoneyRequired += moneyRequired;
                                 }
                                 if(spaceRequired > 0)
                                 {
                                    totalSpaceRequired += spaceRequired;
                                 }
                              }
                           }
                        }
                        moneyRequired = totalMoneyRequired;
                        spaceRequired = totalSpaceRequired;
                        thingsToSell = [];
                        for(k in GD.Towns[i].playersStorage)
                        {
                           found = false;
                           for(l in consumptionStock)
                           {
                              testItem = new Item(consumptionStock[l].item,1);
                              if(GD.Towns[i].playersStorage[k].type == consumptionStock[l].item)
                              {
                                 if(consumptionStock[l].available > consumptionStock[l].amount && (consumptionStock[l].available - consumptionStock[l].amount > 1 || testItem.divisible))
                                 {
                                    amount = consumptionStock[l].available - consumptionStock[l].amount;
                                    if(!testItem.divisible)
                                    {
                                       amount = Math.floor(amount);
                                    }
                                    thingsToSell.push({
                                       "item":consumptionStock[l].item,
                                       "amount":amount
                                    });
                                 }
                                 found = true;
                                 break;
                              }
                           }
                           if(!found)
                           {
                              for(l in producedProducts)
                              {
                                 testItem = new Item(producedProducts[l].item,1);
                                 if(GD.Towns[i].playersStorage[k].type == producedProducts[l].item && (producedProducts[l].amount > 1 || testItem.divisible))
                                 {
                                    amount = producedProducts[l].amount;
                                    if(!testItem.divisible)
                                    {
                                       amount = Math.floor(amount);
                                    }
                                    thingsToSell.unshift({
                                       "item":producedProducts[l].item,
                                       "amount":amount
                                    });
                                    break;
                                 }
                              }
                           }
                        }
                        if(moneyRequired > 0)
                        {
                           j = 0;
                           while(j < thingsToSell.length)
                           {
                              needToSell = Math.ceil(GD.itemAmountFromPrice(GD.Towns[i],thingsToSell[j].item,moneyRequired,false));
                              needToSell = Math.min(needToSell,thingsToSell[j].amount);
                              moneyRequired -= sellToTown(GD.Towns[i],thingsToSell[j].item,needToSell);
                              spaceRequired -= Item.getDataFromType(thingsToSell[j].item).weight * needToSell;
                              if(moneyRequired <= 0)
                              {
                                 break;
                              }
                              j = Number(j) + 1;
                           }
                        }
                        totalToBuySpace = 0;
                        totalToBuyMoney = 0;
                        totalAmount = 0;
                        thingsToBuy = [];
                        for(j in consumptionStock)
                        {
                           totalAmount += consumptionStock[j].amount;
                        }
                        for(j in consumptionStock)
                        {
                           if(consumptionStock[j].amount > consumptionStock[j].available)
                           {
                              thingsToBuy.push({
                                 "item":consumptionStock[j].item,
                                 "amount":Math.min(Math.max(consumptionStock[j].amount - consumptionStock[j].available,0),consumptionStock[j].canBuy)
                              });
                           }
                        }
                        totalToBuySpace = 0;
                        for(j in thingsToBuy)
                        {
                           totalToBuySpace += Item.getDataFromType(thingsToBuy[j].item).weight * thingsToBuy[j].amount;
                           totalToBuyMoney += GD.calculatePrice(GD.Towns[i],thingsToBuy[j].item,thingsToBuy[j].amount,true);
                        }
                        moneyRel = GD.Towns[i].playersMoney / totalToBuyMoney;
                        finalRel = Math.min(moneyRel,1);
                        for(j in thingsToBuy)
                        {
                           amountToBuy = thingsToBuy[j].amount * finalRel;
                           amountToBuy = Math.min(amountToBuy,GD.itemAmountFromPrice(GD.Towns[i],thingsToBuy[j].item,GD.Towns[i].playersMoney,true));
                           amountToBuy = Math.max(amountToBuy,0);
                           if(amountToBuy > 0)
                           {
                              buyFromTown(GD.Towns[i],thingsToBuy[j].item,amountToBuy);
                           }
                        }
                        consumptionProduction = GameData.calculateConsumptionProduction(GD.Towns[i].playersIndustries,GD.Towns[i].playersStorage,720 / 1440);
                        GameData.addArrayToArray(GD.Towns[i].historicalData[0].playersProduction,consumptionProduction.production);
                        GameData.addArrayToArray(GD.Towns[i].historicalData[0].playersConsumption,consumptionProduction.consumption);
                        for(j in consumptionProduction.consumption)
                        {
                           GD.Towns[i].removeFromStock(consumptionProduction.consumption[j].item,consumptionProduction.consumption[j].amount,GD.Towns[i].playersStorage);
                        }
                        for(j in GD.Towns[i].playersIncompleteProduction)
                        {
                           GameData.addItemToArray(consumptionProduction.production,GD.Towns[i].playersIncompleteProduction[j]);
                        }
                        GD.Towns[i].playersIncompleteProduction = [];
                        for(j in consumptionProduction.production)
                        {
                           restingProduction = consumptionProduction.production[j].amount - Math.floor(consumptionProduction.production[j].amount);
                           if(restingProduction > 0)
                           {
                              GameData.addItemToArray(GD.Towns[i].playersIncompleteProduction,{
                                 "item":consumptionProduction.production[j].item,
                                 "amount":restingProduction
                              });
                           }
                           if(consumptionProduction.production[j].amount >= 1)
                           {
                              totalAmount = Math.floor(consumptionProduction.production[j].amount);
                              occupiedStorage = GD.Towns[i].occupiedPlayersStorageSpace;
                              if(occupiedStorage + totalAmount * Item.getDataFromType(consumptionProduction.production[j].item).weight > GD.Towns[i].playersStorageSpace)
                              {
                                 storeAmount = Math.floor(Math.max(GD.Towns[i].playersStorageSpace - occupiedStorage,0) / Item.getDataFromType(consumptionProduction.production[j].item).weight);
                                 sellAmount = totalAmount - storeAmount;
                              }
                              else
                              {
                                 storeAmount = totalAmount;
                                 sellAmount = 0;
                              }
                              if(consumptionProduction.production[j].item == 97)
                              {
                                 GD.Towns[i].playersMoney += storeAmount;
                              }
                              else
                              {
                                 GD.Towns[i].addToStock(consumptionProduction.production[j].item,storeAmount,GD.Towns[i].playersStorage);
                              }
                              if(sellAmount > 0)
                              {
                                 sellToTown(GD.Towns[i],consumptionProduction.production[j].item,sellAmount);
                              }
                           }
                        }
                        totalExpenses = 0;
                        for(j in GD.Towns[i].playersIndustries)
                        {
                           totalExpenses += GD.Towns[i].playersIndustries[j].totalExpenses * 720 / 1440;
                        }
                        if(totalExpenses > 0)
                        {
                           GD.Towns[i].playersMoney -= totalExpenses;
                           if(GD.Towns[i].playersMoney < 0)
                           {
                              moneyRequired = 0 - GD.Towns[i].playersMoney;
                              for(k in producedProducts)
                              {
                                 for(l in GD.Towns[i].playersStorage)
                                 {
                                    if(GD.Towns[i].playersStorage[l].type == producedProducts[k].item)
                                    {
                                       needToSell = Math.ceil(GD.itemAmountFromPrice(GD.Towns[i],producedProducts[k].item,moneyRequired,false));
                                       needToSell = Math.min(needToSell,GD.Towns[i].playersStorage[l].amount);
                                       moneyRequired -= sellToTown(GD.Towns[i],producedProducts[k].item,needToSell);
                                       if(moneyRequired < 0)
                                       {
                                          break;
                                       }
                                    }
                                 }
                                 if(moneyRequired <= 0)
                                 {
                                    break;
                                 }
                              }
                           }
                        }
                        for(j in GD.Towns[i].locations)
                        {
                           if(Presets.Towns[i].locations[j] is Object && Presets.Towns[i].locations[j].category == 1 && Presets.Towns[i].locations[j].subCategory < 5)
                           {
                              assortmentToStock = [];
                              for(k in GD.Towns[i].locations[j].assortment)
                              {
                                 assortmentToStock.push({
                                    "category":1,
                                    "item":GD.Towns[i].locations[j].assortment[k].item,
                                    "assortment":GD.Towns[i].locations[j].assortment[k].amount,
                                    "stock":0
                                 });
                              }
                              for(k in GD.Towns[i].locations[j].transportAssortment)
                              {
                                 assortmentToStock.push({
                                    "category":2,
                                    "item":GD.Towns[i].locations[j].transportAssortment[k].type,
                                    "assortment":GD.Towns[i].locations[j].transportAssortment[k].amount,
                                    "stock":0
                                 });
                              }
                              if(GD.Towns[i].locations[j].slaves.length > 0 || GD.Towns[i].locations[j].slavesAmount > 0)
                              {
                                 assortmentToStock.push({
                                    "category":3,
                                    "assortment":GD.Towns[i].locations[j].slavesAmount,
                                    "stock":GD.Towns[i].locations[j].slaves.length
                                 });
                              }
                              if(Presets.Towns[i].locations[j].subCategory != 1)
                              {
                                 for(k in GD.Towns[i].locations[j].stock)
                                 {
                                    found = false;
                                    for(l in assortmentToStock)
                                    {
                                       if(assortmentToStock[l].category == 1 && assortmentToStock[l].item == GD.Towns[i].locations[j].stock[k].type)
                                       {
                                          assortmentToStock[l].stock += GD.Towns[i].locations[j].stock[k].amount;
                                          found = true;
                                          break;
                                       }
                                    }
                                    if(!found)
                                    {
                                       assortmentToStock.push({
                                          "category":1,
                                          "item":GD.Towns[i].locations[j].stock[k].type,
                                          "assortment":0,
                                          "stock":GD.Towns[i].locations[j].stock[k].amount
                                       });
                                    }
                                 }
                              }
                              for(k in GD.Towns[i].locations[j].transport)
                              {
                                 found = false;
                                 for(l in assortmentToStock)
                                 {
                                    if(assortmentToStock[l].category == 2 && assortmentToStock[l].item == GD.Towns[i].locations[j].transport[k].type)
                                    {
                                       assortmentToStock[l].stock++;
                                       found = true;
                                       break;
                                    }
                                 }
                                 if(!found)
                                 {
                                    assortmentToStock.push({
                                       "category":2,
                                       "item":GD.Towns[i].locations[j].transport[k].type,
                                       "assortment":0,
                                       "stock":1
                                    });
                                 }
                              }
                              for(k in assortmentToStock)
                              {
                                 if(assortmentToStock[k].assortment == 0)
                                 {
                                    maxSell = Math.max(assortmentToStock[k].stock,0.5) * 720 / 1440 / 2;
                                 }
                                 else
                                 {
                                    maxSell = Math.max(assortmentToStock[k].assortment,0.5) * 720 / 1440 / 2;
                                 }
                                 sellRest = maxSell - Math.floor(maxSell);
                                 sellAmount = Math.round(Math.random() * maxSell);
                                 if(Math.random() < sellRest)
                                 {
                                    sellAmount = Number(sellAmount) + 1;
                                 }
                                 sellAmount = Math.min(sellAmount,assortmentToStock[k].stock);
                                 if(sellAmount > 0)
                                 {
                                    assortmentToStock[k].stock -= sellAmount;
                                    price = 0;
                                    switch(assortmentToStock[k].category)
                                    {
                                       case 1:
                                          l = 0;
                                          while(l < GD.Towns[i].locations[j].stock.length)
                                          {
                                             if(GD.Towns[i].locations[j].stock[l].type == assortmentToStock[k].item)
                                             {
                                                price = GD.Towns[i].locations[j].stock[l].itemData.price * sellAmount;
                                                GD.Towns[i].locations[j].stock[l].amount -= sellAmount;
                                                if(GD.Towns[i].locations[j].stock[l].amount <= 0)
                                                {
                                                   GD.Towns[i].locations[j].stock.splice(l,1);
                                                   l = Number(l) - 1;
                                                }
                                             }
                                             l = Number(l) + 1;
                                          }
                                          break;
                                       case 2:
                                          sellSet = [];
                                          for(l in GD.Towns[i].locations[j].transport)
                                          {
                                             if(GD.Towns[i].locations[j].transport[l].type == assortmentToStock[k].item)
                                             {
                                                sellSet.push(l);
                                             }
                                          }
                                          l = 1;
                                          while(l <= sellAmount)
                                          {
                                             sellNow = MathFunctions.random(0,sellSet.length - 1);
                                             for(m in sellSet)
                                             {
                                                if(sellSet[m] > sellSet[sellNow])
                                                {
                                                   sellSet[m]--;
                                                }
                                             }
                                             price += GD.Towns[i].locations[j].transport[sellSet[sellNow]].price;
                                             GD.Towns[i].locations[j].transport.splice(sellSet[sellNow],1);
                                             sellSet.splice(sellNow,1);
                                             l = Number(l) + 1;
                                          }
                                          break;
                                       case 3:
                                          l = 1;
                                          while(l <= sellAmount)
                                          {
                                             sellNow = MathFunctions.random(0,GD.Towns[i].locations[j].slaves.length - 1);
                                             price += GD.Towns[i].locations[j].slaves[sellNow].price * GD.Towns[i].slavePrices;
                                             if(i == 36)
                                             {
                                                trace(price + " + " + GD.Towns[i].locations[j].slaves[sellNow].price);
                                             }
                                             GD.Towns[i].locations[j].slaves.splice(sellNow,1);
                                             l = Number(l) + 1;
                                          }
                                    }
                                    if(Presets.Towns[i].locations[j].subCategory == 1)
                                    {
                                       GD.Towns[i].money += price * (1 + GD.Towns[i].locations[j].margin);
                                    }
                                    else
                                    {
                                       GD.Towns[i].locations[j].money += price * (1 + GD.Towns[i].locations[j].margin);
                                    }
                                    GD.Towns[i].money += price * GD.Towns[i].tax;
                                 }
                              }
                              for(k in assortmentToStock)
                              {
                                 canBuy = assortmentToStock[k].assortment - assortmentToStock[k].stock;
                                 maxBuy = Math.min((canBuy + assortmentToStock[k].assortment * 0.1) * 720 / 1440,assortmentToStock[k].assortment * 720 / 1440 / 2);
                                 if(maxBuy > 0)
                                 {
                                    price = 0;
                                    buyAmount = Math.round(maxBuy * Math.random());
                                    if(Math.random() < maxBuy - Math.floor(maxBuy))
                                    {
                                       buyAmount = Number(buyAmount) + 1;
                                    }
                                    if(buyAmount > 0)
                                    {
                                       switch(assortmentToStock[k].category)
                                       {
                                          case 1:
                                             found = false;
                                             for(l in GD.Towns[i].locations[j].stock)
                                             {
                                                if(GD.Towns[i].locations[j].stock[l].type == assortmentToStock[k].item)
                                                {
                                                   GD.Towns[i].locations[j].stock[l].amount += buyAmount;
                                                   price = GD.Towns[i].locations[j].stock[l].itemData.price * buyAmount;
                                                   found = true;
                                                   break;
                                                }
                                             }
                                             if(!found)
                                             {
                                                GD.Towns[i].locations[j].stock.push(new Item(assortmentToStock[k].item,buyAmount));
                                                price += Item.getDataFromType(assortmentToStock[k].item).price * buyAmount;
                                             }
                                             break;
                                          case 2:
                                             l = 1;
                                             while(l <= buyAmount)
                                             {
                                                GD.Towns[i].locations[j].transport.push(new TransportUnit(assortmentToStock[k].item));
                                                price += GD.Towns[i].locations[j].transport[GD.Towns[i].locations[j].transport.length - 1].price;
                                                l = Number(l) + 1;
                                             }
                                             break;
                                          case 3:
                                             l = 1;
                                             while(l <= buyAmount)
                                             {
                                                GD.Towns[i].locations[j].slaves.push(new Character({"category":4}));
                                                price += GD.Towns[i].locations[j].slaves[GD.Towns[i].locations[j].slaves.length - 1].price * GD.Towns[i].slavePrices;
                                                l = Number(l) + 1;
                                             }
                                       }
                                       if(Presets.Towns[i].locations[j].subCategory == 1)
                                       {
                                          GD.Towns[i].money -= price * (1 / (1 + GD.Towns[i].locations[j].margin));
                                       }
                                       else
                                       {
                                          GD.Towns[i].locations[j].money -= price * (1 / (1 + GD.Towns[i].locations[j].margin));
                                       }
                                       GD.Towns[i].money += price * (1 / (1 + GD.Towns[i].locations[j].margin)) * GD.Towns[i].tax;
                                    }
                                 }
                              }
                              if(GD.Towns[i].locations[j].money < 0)
                              {
                                 GD.Towns[i].locations[j].money = 0;
                              }
                           }
                        }
                        GD.Towns[i].historicalData[0].population = GD.Towns[i].population;
                        GD.Towns[i].historicalData[0].GDP = 0;
                        for(j in GD.Towns[i].historicalData[0].production)
                        {
                           GD.Towns[i].historicalData[0].GDP += GD.globalItemPrice(GD.Towns[i].historicalData[0].production[j].item) * GD.Towns[i].historicalData[0].production[j].amount;
                        }
                        for(j in GD.Towns[i].historicalData[0].playersProduction)
                        {
                           GD.Towns[i].historicalData[0].GDP += GD.globalItemPrice(GD.Towns[i].historicalData[0].playersProduction[j].item) * GD.Towns[i].historicalData[0].playersProduction[j].amount;
                        }
                        GD.Towns[i].historicalData[0].GDP *= 2;
                        measures = Math.min(14,GD.Towns[i].historicalData.length);
                        summaryGDPperCapita = 0;
                        j = 0;
                        while(j < measures)
                        {
                           if(GD.Towns[i].historicalData[j].population > 0)
                           {
                              summaryGDPperCapita += GD.Towns[i].historicalData[j].GDP / GD.Towns[i].historicalData[j].population;
                           }
                           j = Number(j) + 1;
                        }
                        GD.Towns[i].GDPperCapita = summaryGDPperCapita / measures;
                        wealthFactor = GD.Towns[i].wealthFactor;
                        if(!GD.Towns[i].constantPopulation)
                        {
                           if(wealthFactor > 0.8)
                           {
                              changeChance = Math.min(wealthFactor,10) * 720 / 1440;
                              j = 1;
                              while(j <= changeChance)
                              {
                                 if(Math.random() < 0.001)
                                 {
                                    GD.Towns[i].population++;
                                 }
                                 j = Number(j) + 1;
                              }
                           }
                           else if(wealthFactor < 0.8)
                           {
                              changeChance = 1 / Math.max(wealthFactor + 0.2,0.1) * 720 / 1440;
                              j = 1;
                              while(j <= changeChance)
                              {
                                 if(GD.Towns[i].population > 1 && Math.random() < 0.001)
                                 {
                                    GD.Towns[i].population--;
                                 }
                                 j = Number(j) + 1;
                              }
                           }
                        }
                        possibleWorkers = GD.Towns[i].population * 0.85;
                        currentlyEmployed = 0;
                        for(j in GD.Towns[i].industries)
                        {
                           if(!Industry.Types[GD.Towns[i].industries[j].type].replaceEmployeesBySize)
                           {
                              currentlyEmployed += GD.Towns[i].industries[j].employees;
                           }
                        }
                        for(j in GD.Towns[i].playersIndustries)
                        {
                           if(!Industry.Types[GD.Towns[i].playersIndustries[j].type].replaceEmployeesBySize)
                           {
                              currentlyEmployed += GD.Towns[i].playersIndustries[j].employees;
                           }
                        }
                        if(currentlyEmployed + GD.Towns[i].unemployed < possibleWorkers)
                        {
                           if(Math.pow(Math.random(),2) > 1 / (possibleWorkers - (currentlyEmployed + GD.Towns[i].unemployed)))
                           {
                              GD.Towns[i].unemployed++;
                           }
                        }
                        if(currentlyEmployed + GD.Towns[i].unemployed > possibleWorkers)
                        {
                           if(GD.Towns[i].unemployed > 0 && Math.pow(Math.random(),2) > 1 / (currentlyEmployed + GD.Towns[i].unemployed - possibleWorkers))
                           {
                              GD.Towns[i].unemployed--;
                           }
                        }
                        if(Math.random() < 0.05)
                        {
                           GD.Towns[i].unemployed++;
                        }
                        if(Math.random() < 0.05)
                        {
                           GD.Towns[i].unemployed--;
                        }
                        if(GD.Towns[i].unemployed + currentlyEmployed > GD.Towns[i].population)
                        {
                           GD.Towns[i].unemployed = GD.Towns[i].population - currentlyEmployed;
                        }
                        if(currentlyEmployed > GD.Towns[i].population * 0.9 && GD.Towns[i].unemployed <= 0 && !Presets.Towns[i].stableEmployment)
                        {
                           allIndustries = [];
                           for(j in GD.Towns[i].industries)
                           {
                              if(GD.Towns[i].industries[j].employees > 0)
                              {
                                 allIndustries.push(GD.Towns[i].industries[j]);
                              }
                           }
                           if(allIndustries.length > 0)
                           {
                              industryToReduce = MathFunctions.random(0,allIndustries.length - 1);
                              allIndustries[industryToReduce].employees--;
                              if(allIndustries[industryToReduce].employees <= 0)
                              {
                                 for(j in GD.Towns[i].industries)
                                 {
                                    if(GD.Towns[i].industries[j] == industryToReduce)
                                    {
                                       GD.Towns[i].industries.splice(j,1);
                                       break;
                                    }
                                 }
                              }
                           }
                        }
                        if(!Presets.Towns[i].noPeopleToHire)
                        {
                           idealNumber = GD.Towns[i].unemployed / 2;
                           toReduce = idealNumber * 0.1 * Math.random() * 720 / 1440;
                           if(Math.random() < toReduce - Math.floor(toReduce))
                           {
                              toReduce = Math.ceil(toReduce);
                           }
                           else
                           {
                              toReduce = Math.floor(toReduce);
                           }
                           if(toReduce > 0)
                           {
                              canBeRemoved = [];
                              for(j in GD.Towns[i].people)
                              {
                                 if(!GD.Towns[i].people[j].dontRemoveFromTown)
                                 {
                                    canBeRemoved.push(GD.Towns[i].people[j]);
                                 }
                              }
                              toReduce = Math.min(toReduce,canBeRemoved.length);
                              j = 1;
                              while(j <= toReduce)
                              {
                                 removeNow = MathFunctions.random(0,canBeRemoved.length - 1);
                                 for(k in GD.Towns[i].people)
                                 {
                                    if(GD.Towns[i].people[k] == canBeRemoved[removeNow])
                                    {
                                       GD.Towns[i].people.splice(k,1);
                                       break;
                                    }
                                 }
                                 canBeRemoved.splice(removeNow,1);
                                 j = Number(j) + 1;
                              }
                           }
                           toAdd = Math.random() * Math.max(idealNumber - GD.Towns[i].people.length,0) * 0.5 * 720 / 1440;
                           if(Math.random() < toAdd - Math.floor(toAdd))
                           {
                              toAdd = Math.ceil(toAdd);
                           }
                           else
                           {
                              toAdd = Math.floor(toAdd);
                           }
                           settings = {"category":2};
                           j = 1;
                           while(j <= toAdd)
                           {
                              if(i == 52)
                              {
                                 settings.swordsExperience = MathFunctions.random(1000,10000);
                              }
                              if(Presets.Towns[i].salaryCoefficient != undefined)
                              {
                                 settings.salaryCoefficient = Presets.Towns[i].salaryCoefficient * (0.6 + Math.random() * 0.8) * Math.max(GD.Towns[i].wealthFactor,0.5);
                              }
                              if(GD.difficulty == 1)
                              {
                                 settings.salaryCoefficient *= 0.7;
                              }
                              if(Presets.Towns[i].maxAttributes != undefined)
                              {
                                 settings.levelModifier = 0.8 + Math.random() * (Presets.Towns[i].maxAttributes - 0.8);
                              }
                              if(Presets.Towns[i].maxExperience != undefined)
                              {
                                 settings.experienceModifier = 0.8 + Math.random() * (Presets.Towns[i].maxExperience - 0.8);
                              }
                              if(GD.Towns[i].faction != undefined && Math.random() < 0.7)
                              {
                                 settings.faction = GD.Towns[i].faction;
                              }
                              else
                              {
                                 settings.faction = MathFunctions.random(1,Presets.FactionRelations.length - 1);
                              }
                              newPerson = new Character(settings);
                              GD.Towns[i].people.unshift(newPerson);
                              j = Number(j) + 1;
                           }
                        }
                        if(Math.random() < 0.1)
                        {
                           uselessStuff = [];
                           for(j in GD.Towns[i].stock)
                           {
                              useless = true;
                              if(i != 18 || GD.Towns[i].stock[j].type != 205)
                              {
                                 for(k in GameData.itemCategories)
                                 {
                                    if(GD.Towns[i].stock[j].itemData[GameData.itemCategories[k]] && GD.Towns[i][GameData.itemCategories[k] + "Consumption"] > 0)
                                    {
                                       useless = false;
                                       break;
                                    }
                                 }
                                 if(useless)
                                 {
                                    for(k in townConsProd.production)
                                    {
                                       if(townConsProd.production[k].item == GD.Towns[i].stock[j].type)
                                       {
                                          useless = false;
                                          break;
                                       }
                                    }
                                 }
                                 if(useless)
                                 {
                                    for(k in townConsProd.consumption)
                                    {
                                       if(townConsProd.consumption[k].item == GD.Towns[i].stock[j].type)
                                       {
                                          useless = false;
                                          break;
                                       }
                                    }
                                 }
                                 if(useless)
                                 {
                                    trace(GD.Towns[i].stock[j] + " is useless");
                                    uselessStuff.push(GD.Towns[i].stock[j]);
                                 }
                              }
                           }
                           if(uselessStuff.length > 0)
                           {
                              j = 1;
                              while(j <= Math.round(2.5))
                              {
                                 currItem = MathFunctions.random(0,uselessStuff.length - 1);
                                 sellAmount = Math.max(Math.round(uselessStuff[currItem].amount * Math.random()),1);
                                 trace("selling " + uselessStuff[currItem].name + " x " + sellAmount + " for " + GD.calculatePrice(GD.Towns[i],uselessStuff[currItem].type,sellAmount,true));
                                 GD.Towns[i].money += GD.calculatePrice(GD.Towns[i],uselessStuff[currItem].type,sellAmount,true);
                                 uselessStuff[currItem].amount -= sellAmount;
                                 if(uselessStuff[currItem].amount <= 0)
                                 {
                                    uselessStuff.splice(sellAmount,1);
                                 }
                                 if(uselessStuff.length == 0)
                                 {
                                    break;
                                 }
                                 j = Number(j) + 1;
                              }
                              j = 0;
                              while(j < GD.Towns[i].stock.length)
                              {
                                 if(GD.Towns[i].stock[j].amount <= 0)
                                 {
                                    GD.Towns[i].stock.splice(j,1);
                                    j = Number(j) - 1;
                                 }
                                 j = Number(j) + 1;
                              }
                           }
                        }
                        possibleExpansions = [];
                        moneyComp = 0;
                        balances = [];
                        categoryBalances = [];
                        for(j in GD.Towns[i].industries)
                        {
                           moneyComp = Math.max(moneyComp,GD.Towns[i].industries[j].pricePerUnit * 0.5 + GD.Towns[i].GDPperCapita);
                        }
                        for(j in GameData.itemCategories)
                        {
                           categoryBalances[GameData.itemCategories[j]] = 0;
                        }
                        for(j in townConsProd.production)
                        {
                           itemData = Item.getDataFromType(townConsProd.production[j].item);
                           foundCategory = false;
                           for(k in GameData.itemCategories)
                           {
                              if(itemData[GameData.itemCategories[k]])
                              {
                                 foundCategory = true;
                                 if(GameData.itemCategories[k] == "food")
                                 {
                                    multiplier = itemData.calories;
                                 }
                                 else
                                 {
                                    multiplier = 1;
                                 }
                                 var _loc6_:* = GameData.itemCategories[k];
                                 var _loc22_:Number = categoryBalances[_loc6_] + townConsProd.production[j].amount * multiplier;
                                 categoryBalances[_loc6_] = _loc22_;
                              }
                           }
                           if(!foundCategory)
                           {
                              balances.push({
                                 "item":townConsProd.production[j].item,
                                 "amount":townConsProd.production[j].amount
                              });
                           }
                        }
                        for(j in townConsProd.consumption)
                        {
                           itemData = Item.getDataFromType(townConsProd.consumption[j].item);
                           foundCategory = false;
                           for(k in GameData.itemCategories)
                           {
                              if(itemData[GameData.itemCategories[k]])
                              {
                                 foundCategory = true;
                                 if(GameData.itemCategories[k] == "food")
                                 {
                                    multiplier = itemData.calories;
                                 }
                                 else
                                 {
                                    multiplier = 1;
                                 }
                                 var _loc21_:* = GameData.itemCategories[k];
                                 var _loc7_:Number = categoryBalances[_loc21_] - townConsProd.production[j].amount * multiplier;
                                 categoryBalances[_loc21_] = _loc7_;
                              }
                           }
                           if(!foundCategory)
                           {
                              found = false;
                              for(k in balances)
                              {
                                 if(balances[k].item == townConsProd.consumption[j].item)
                                 {
                                    balances[k].amount -= townConsProd.consumption[j].amount;
                                    found = true;
                                    break;
                                 }
                              }
                              if(!found)
                              {
                                 balances.push({
                                    "item":townConsProd.consumption[j].item,
                                    "amount":0 - townConsProd.consumption[j].amount
                                 });
                              }
                           }
                        }
                        for(j in categoryBalances)
                        {
                           categoryBalances[j] -= GD.Towns[i][j + "Consumption"] * 720 / 1440;
                        }
                        if(!Presets.Towns[i].stableEmployment && GD.Towns[i].money > moneyComp)
                        {
                           for(j in GD.Towns[i].industries)
                           {
                              if(GD.Towns[i].unemployed >= 1 && GD.Towns[i].unemployed > GD.Towns[i].population * 0.05 || Industry.Types[GD.Towns[i].industries[j].type].replaceEmployeesBySize)
                              {
                                 n = possibleExpansions.push({
                                    "industry":GD.Towns[i].industries[j],
                                    "score":0
                                 }) - 1;
                                 cons = GD.Towns[i].industries[j].consumption;
                                 for(k in cons)
                                 {
                                    itemData = Item.getDataFromType(cons[k].item);
                                    foundCategory = false;
                                    for(l in GameData.itemCategories)
                                    {
                                       if(itemData[GameData.itemCategories[l]])
                                       {
                                          foundCategory = true;
                                          if(GameData.itemCategories[l] == "food")
                                          {
                                             multiplier = 1 / itemData.calories;
                                          }
                                          else
                                          {
                                             multiplier = 1;
                                          }
                                          possibleExpansions[n].score += categoryBalances[GameData.itemCategories[l]] * multiplier * 0.1;
                                       }
                                    }
                                    if(!foundCategory)
                                    {
                                       multiplier = 1;
                                       if(itemData.food)
                                       {
                                          multiplier = 0.001;
                                       }
                                       if(cons[k].item == 1)
                                       {
                                          multiplier = 2;
                                       }
                                       for(l in balances)
                                       {
                                          if(balances[l].item == cons[k].item)
                                          {
                                             possibleExpansions[n].score += balances[l].amount * multiplier * 0.1;
                                             break;
                                          }
                                       }
                                    }
                                 }
                                 prod = GD.Towns[i].industries[j].production;
                                 for(k in prod)
                                 {
                                    itemData = Item.getDataFromType(prod[k].item);
                                    foundCategory = false;
                                    for(l in GameData.itemCategories)
                                    {
                                       if(itemData[GameData.itemCategories[l]])
                                       {
                                          foundCategory = true;
                                          if(GameData.itemCategories[l] == "food")
                                          {
                                             multiplier = 1 / itemData.calories;
                                          }
                                          else
                                          {
                                             multiplier = 1;
                                          }
                                          possibleExpansions[n].score -= categoryBalances[GameData.itemCategories[l]] * multiplier;
                                       }
                                    }
                                    if(!foundCategory)
                                    {
                                       multiplier = 1;
                                       if(Item.getDataFromType(prod[k].item).food)
                                       {
                                          multiplier = 0.001;
                                       }
                                       if(prod[k].item == 1)
                                       {
                                          multiplier = 2;
                                       }
                                       for(l in balances)
                                       {
                                          if(balances[l].item == prod[k].item)
                                          {
                                             possibleExpansions[n].score -= balances[l].amount * multiplier;
                                             break;
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                           bestScore = 0;
                           selectedExpansion = null;
                           if(GD.Towns[i].money > GD.Towns[i].GDPperCapita * 5)
                           {
                              bestScore = -Infinity;
                           }
                           for(j in possibleExpansions)
                           {
                              if(possibleExpansions[j].score > bestScore)
                              {
                                 selectedExpansion = j;
                                 bestScore = possibleExpansions[j].score;
                              }
                           }
                           if(selectedExpansion != null)
                           {
                              possibleExpansions[selectedExpansion].industry.employees++;
                              theMoney = possibleExpansions[selectedExpansion].industry.pricePerUnit * 0.5;
                              GD.Towns[i].money -= theMoney;
                              while(theMoney > 0)
                              {
                                 possibleOptions = [];
                                 if(theMoney < 10)
                                 {
                                    howMuch = theMoney;
                                 }
                                 else
                                 {
                                    howMuch = theMoney * Math.random();
                                 }
                                 if(Math.random() < 0.8)
                                 {
                                    for(j in Presets.Towns[i].locations)
                                    {
                                       if(Presets.Towns[i].locations[j].category == 1 && Presets.Towns[i].locations[j].subCategory >= 2 && Presets.Towns[i].locations[j].subCategory <= 4)
                                       {
                                          possibleOptions.push(GD.Towns[i].locations[j]);
                                       }
                                    }
                                 }
                                 else
                                 {
                                    for(j in GD.Towns)
                                    {
                                       if(!Presets.Towns[j].storyOnly)
                                       {
                                          possibleOptions.push(GD.Towns[j]);
                                       }
                                    }
                                 }
                                 if(possibleOptions.length > 0)
                                 {
                                    ind = MathFunctions.random(0,possibleOptions.length - 1);
                                    possibleOptions[ind].money += howMuch;
                                 }
                                 theMoney -= howMuch;
                              }
                              if(!Industry.Types[possibleExpansions[selectedExpansion].industry.type].replaceEmployeesBySize)
                              {
                                 GD.Towns[i].unemployed--;
                              }
                           }
                        }
                        cutHistoryTo = 60;
                        while(GD.Towns[i].historicalData.length > cutHistoryTo)
                        {
                           GD.Towns[i].historicalData.pop();
                        }
                        GD.Towns[i].cycleCounter -= 720;
                        if(GD.Towns[i].money < 0)
                        {
                           GD.Towns[i].money = 0;
                        }
                        if(GD.Towns[i].unemployed < 0)
                        {
                           GD.Towns[i].unemployed = 0;
                        }
                        if(GD.Towns[i].unemployed > GD.Towns[i].population)
                        {
                           GD.Towns[i].unemployed = GD.Towns[i].population;
                        }
                        if(GD.Towns[i].illegalActions.length > 0)
                        {
                           hasBeenCaught = false;
                           j = 0;
                           while(j < GD.Towns[i].illegalActions.length)
                           {
                              chanceToBeCaught = Math.sin(GD.Towns[i].illegalActions[j].amount / GD.Towns[i].illegalActions[j].smugglingSkill * 3.141592653589793 - 3.141592653589793 / 2) / 100 + 0.01;
                              if(GD.Towns[i].illegalActions[j].action == 2)
                              {
                                 chanceToBeCaught *= 1.5;
                              }
                              if(Math.random() < chanceToBeCaught)
                              {
                                 hasBeenCaught = true;
                                 if(GD.Towns[i].faction > 0)
                                 {
                                    GD.affectFactionRelations(0 - Math.round(Math.pow(GD.Towns[i].illegalActions[j].amount,0.5) * 2),GD.Towns[i].faction,0);
                                 }
                                 GD.affectSpecificReputation(8,Math.round(Math.pow(GD.Towns[i].illegalActions[j].amount,0.5) * 1));
                                 openDialogue(19,GD.Towns[i].name);
                              }
                              if(hasBeenCaught || Math.random() < 0.1)
                              {
                                 GD.Towns[i].illegalActions.splice(j,1);
                                 j = Number(j) - 1;
                              }
                              j = Number(j) + 1;
                           }
                        }
                     }
                  }
               }
               groupProbabilities = GD.getSquareGroupProbabilities(GD.Caravans[0].squareX,GD.Caravans[0].squareY);
               for(t in groupProbabilities)
               {
                  if(groupProbabilities[t] > 0)
                  {
                     speedMultiplier = 0.9;
                     if(GD.Caravans[0].moving)
                     {
                        speedMultiplier += GD.Caravans[0].speed / 40;
                     }
                     difficultyMultiplier = 1;
                     if(GD.difficulty == 2)
                     {
                        difficultyMultiplier = 1.1;
                     }
                     count = MathFunctions.ProbabilityRandom(groupProbabilities[t] / 25 * GD.gameSpeed * speedMultiplier * difficultyMultiplier * 4);
                     while(count > 0)
                     {
                        nc = GD.Caravans.push(new Caravan(t,mapSymbols)) - 1;
                        GD.equipRandomCaravan(GD.Caravans[nc]);
                        for(i in GD.Caravans[nc].People)
                        {
                           if(GD.Caravans[nc].People[i].category < 3)
                           {
                              GD.Caravans[nc].People[i].faction = Presets.CaravanTypes[t].faction;
                           }
                           else
                           {
                              GD.Caravans[nc].People[i].faction = MathFunctions.random(1,Presets.FactionRelations.length - 1);
                           }
                        }
                        if(GD.Caravans[0].moving)
                        {
                           inclination = GD.Caravans[0].speed / GD.Caravans[nc].speed;
                           sidesDir = [];
                           sin = Math.abs(Math.sin(GD.Caravans[0].direction));
                           cos = Math.abs(Math.cos(GD.Caravans[0].direction));
                           if(GD.Caravans[0].direction > 0 && GD.Caravans[0].direction <= 3.141592653589793)
                           {
                              sidesDir[1] = sin;
                              sidesDir[3] = 0;
                           }
                           else
                           {
                              sidesDir[1] = 0;
                              sidesDir[3] = sin;
                           }
                           if(GD.Caravans[0].direction > MathFunctions.halfPI && GD.Caravans[0].direction <= 3.141592653589793 * 1.5)
                           {
                              sidesDir[2] = cos;
                              sidesDir[0] = 0;
                           }
                           else
                           {
                              sidesDir[2] = 0;
                              sidesDir[0] = cos;
                           }
                           for(i in sidesDir)
                           {
                              sidesDir[i] = Math.max(1 - inclination,0) + sidesDir[i] * inclination;
                           }
                           total = 0;
                           for(i in sidesDir)
                           {
                              total += sidesDir[i];
                           }
                           for(i in sidesDir)
                           {
                              sidesDir[i] /= total;
                           }
                           d = MathFunctions.probabilityRandom(sidesDir);
                        }
                        else
                        {
                           d = MathFunctions.random(0,3);
                        }
                        switch(d)
                        {
                           case 0:
                              GD.Caravans[nc].x = GD.Caravans[0].x - 325 + Math.random() * 670;
                              GD.Caravans[nc].y = GD.Caravans[0].y - 257;
                              break;
                           case 1:
                              GD.Caravans[nc].x = GD.Caravans[0].x + 340;
                              GD.Caravans[nc].y = GD.Caravans[0].y - 248 + Math.random() * 495;
                              break;
                           case 2:
                              GD.Caravans[nc].x = GD.Caravans[0].x - 325 + Math.random() * 670;
                              GD.Caravans[nc].y = GD.Caravans[0].y + 257;
                              break;
                           case 3:
                              GD.Caravans[nc].x = GD.Caravans[0].x - 340;
                              GD.Caravans[nc].y = GD.Caravans[0].y - 248 + Math.random() * 495;
                        }
                        if(t == 41)
                        {
                           possibleTowns = [];
                           scanX = GD.Caravans[0].squareX - 3;
                           while(scanX <= GD.Caravans[0].squareX + 3)
                           {
                              scanY = GD.Caravans[0].squareY - 3;
                              while(scanY <= GD.Caravans[0].squareY + 3)
                              {
                                 possibleTowns = possibleTowns.concat(GD.getSquareTowns(scanX,scanY));
                                 scanY = Number(scanY) + 1;
                              }
                              scanX = Number(scanX) + 1;
                           }
                           i = 0;
                           while(i < possibleTowns.length)
                           {
                              if(!GD.Towns[possibleTowns[i]].active || GD.Towns[possibleTowns[i]].constantPopulation || Presets.Towns[possibleTowns[i]].storyOnly)
                              {
                                 possibleTowns.splice(i,1);
                                 i = Number(i) - 1;
                              }
                              i = Number(i) + 1;
                           }
                           if(possibleTowns.length == 0)
                           {
                              GD.directCaravanToNearestTown(GD.Caravans[nc]);
                           }
                           else
                           {
                              if(possibleTowns.length > 1 && Math.random() < 0.5)
                              {
                                 pos = MathFunctions.random(0,possibleTowns.length - 1);
                                 GD.Caravans[nc].x = Presets.Towns[possibleTowns[pos]].x;
                                 GD.Caravans[nc].y = Presets.Towns[possibleTowns[pos]].y;
                                 possibleTowns.splice(pos,1);
                              }
                              GD.directCaravanToTown(GD.Caravans[nc],possibleTowns[MathFunctions.random(0,possibleTowns.length - 1)]);
                           }
                        }
                        else
                        {
                           GD.Caravans[nc].direction = GD.Caravans[0].direction - MathFunctions.halfPI + Math.random() * 3.141592653589793;
                           if(GD.Caravans[nc].direction < 0)
                           {
                              GD.Caravans[nc].direction += MathFunctions.dblPI;
                           }
                           if(GD.Caravans[nc].direction > MathFunctions.dblPI)
                           {
                              GD.Caravans[nc].direction -= MathFunctions.dblPI;
                           }
                        }
                        GD.Caravans[nc].category = 1;
                        GD.Caravans[nc].hunt = false;
                        GD.Caravans[nc].staticMode = true;
                        GD.Caravans[nc].update();
                        count = Number(count) - 1;
                     }
                  }
               }
               if(GD.Story.qubbaAttackPhase > 0)
               {
                  switch(GD.Story.qubbaAttackPhase)
                  {
                     case 1:
                        allStopped = true;
                        for(i in GD.Caravans)
                        {
                           if(GD.Caravans[i].specialPurpose == 17 && GD.Caravans[i].type == 29 && GD.Caravans[i].moving)
                           {
                              allStopped = false;
                              break;
                           }
                        }
                        if(allStopped)
                        {
                           for(i in GD.Caravans)
                           {
                              if(GD.Caravans[i].specialPurpose == 17 && GD.Caravans[i].type == 29)
                              {
                                 GD.Caravans[i].guardPosition = {
                                    "x":Presets.Towns[53].x - (Presets.Towns[5].x - GD.Caravans[i].x),
                                    "y":Presets.Towns[53].y + 100
                                 };
                                 GD.Caravans[i].moving = true;
                              }
                           }
                           GD.Story.qubbaAttackPhase = 2;
                           if(GD.Story.piratesWillAttack && !GD.Story.piratesReleased)
                           {
                              GD.executeMajorEvent(79);
                           }
                        }
                        break;
                     case 2:
                        distToAusz = Infinity;
                        if(!GD.Story.federationStartedDefehse || GD.Story.piratesWillAttack && !GD.Story.piratesReleased)
                        {
                           for(i in GD.Caravans)
                           {
                              if(GD.Caravans[i].specialPurpose == 17)
                              {
                                 currDist = MathFunctions.CalcDistance(GD.Caravans[i].x,GD.Caravans[i].y,Presets.Towns[53].x,Presets.Towns[53].y);
                                 if(currDist < distToAusz)
                                 {
                                    distToAusz = currDist;
                                 }
                              }
                           }
                        }
                        if(!GD.Story.federationStartedDefehse && distToAusz < 200)
                        {
                           GD.executeMajorEvent(78);
                        }
                  }
               }
            }
            mapSymbols.x = 0 - GD.Caravans[0].x + 325;
            mapSymbols.y = 0 - GD.Caravans[0].y + 248;
            date = GD.makeDate(GD.Time);
            clockParts[0].rotation = clockParts[3].rotation = date.Minute * 6;
            clockParts[1].rotation = clockParts[4].rotation = (date.Hour % 12 + date.Minute / 60) / 12 * 360;
            consumptionProduction = GD.Caravans[0].getConsumptionProduction(true);
            electricityConsumption = consumptionProduction.electricityConsumption;
            electricityProduction = consumptionProduction.electricityProduction;
            water = GD.Caravans[0].water;
            counters[1].setCounter(water);
            bulbs[1].visible = water <= 0;
            food = GD.Caravans[0].food;
            counters[2].setCounter(food);
            bulbs[2].visible = food <= 0;
            meds = GD.Caravans[0].meds;
            bulbs[3].visible = GD.Caravans[0].totalMedicineConsumption() > 0 && meds <= 0;
            counters[3].setCounter(meds);
            hasAnimals = false;
            hasVehicles = false;
            forage = GD.Caravans[0].forage;
            for(i in GD.Caravans[0].Transport)
            {
               if(GD.Caravans[0].Transport[i].category == 1)
               {
                  hasAnimals = true;
                  break;
               }
            }
            bulbs[4].visible = forage <= 0 && hasAnimals;
            counters[4].setCounter(forage);
            fuel = GD.Caravans[0].fuel;
            for(i in GD.Caravans[0].Transport)
            {
               if(GD.Caravans[0].Transport[i].category == 3)
               {
                  hasVehicles = true;
                  break;
               }
            }
            bulbs[5].visible = fuel <= 0 && hasVehicles;
            counters[5].setCounter(fuel);
            bulbs[6].visible = consumptionProduction.electricityProduction < consumptionProduction.electricityConsumption;
            counters[6].setCounter(Math.max(consumptionProduction.electricityProduction - consumptionProduction.electricityConsumption,0));
            counters[7].setCounter(GD.Caravans[0].money);
            totalCargo = GD.Caravans[0].totalCargo;
            maxCargo = GD.Caravans[0].maxCargo;
            bulbs[12].visible = totalCargo > maxCargo;
            indicators[1].setValue(totalCargo / 1000,3,true);
            indicators[2].setValue(maxCargo / 1000,3,true);
            woundedPeople = false;
            for(i in GD.Caravans[0].People)
            {
               if(GD.Caravans[0].People[i].wounded >= 4)
               {
                  woundedPeople = true;
                  break;
               }
            }
            bulbs[8].visible = woundedPeople;
            woundedAnimals = false;
            mechanicalProblems = false;
            for(i in GD.Caravans[0].Transport)
            {
               if(GD.Caravans[0].Transport[i].category == 1 && GD.Caravans[0].Transport[i].health < GD.Caravans[0].Transport[i].maxHealth * 0.1)
               {
                  woundedAnimals = true;
                  break;
               }
            }
            for(i in GD.Caravans[0].Transport)
            {
               if((GD.Caravans[0].Transport[i].category == 2 || GD.Caravans[0].Transport[i].category == 3) && GD.Caravans[0].Transport[i].health < GD.Caravans[0].Transport[i].maxHealth * 0.1)
               {
                  mechanicalProblems = true;
                  break;
               }
            }
            bulbs[9].visible = woundedAnimals;
            bulbs[10].visible = mechanicalProblems;
            setFlipper(flippers[0],date.Day2d);
            setFlipper(flippers[1],date.ShortMonthName);
            setFlipper(flippers[2],date.Year2d);
            setFlipper(flippers[3],date.AmPm);
            if(GD.Caravans[0].x > 0)
            {
               groundBG.x = 0 - GD.Caravans[0].x % 1402;
            }
            else
            {
               groundBG.x = 0 - GD.Caravans[0].x % 1402 - 1402;
            }
            if(GD.Caravans[0].y > 0)
            {
               groundBG.y = 0 - GD.Caravans[0].y % 1108;
            }
            else
            {
               groundBG.y = 0 - GD.Caravans[0].y % 1108 - 1108;
            }
         }
         radarSymbols[1].rotation = GD.Caravans[0].direction * MathFunctions.Rad2Deg;
         if(mouseX < 650 && mouseX >= 0 && mouseY >= 0 && mouseY < 495)
         {
            distanceFromCenter = MathFunctions.CalcDistance(325,248,mouseX,495 - mouseY);
            if(distanceFromCenter > 14)
            {
               mouseStatus = 1;
               mouseLookDir = MathFunctions.CalcRevYAngle(325,248,mouseX,mouseY);
               radarSymbols[2].rotation = mouseLookDir * MathFunctions.Rad2Deg;
               radarSymbols[3].rotation = radarSymbols[2].rotation;
            }
            else
            {
               mouseStatus = 2;
            }
         }
         else
         {
            mouseStatus = 0;
            if(mouseX > 690 && mouseY > 95 && mouseX <= 860 && mouseY <= 115)
            {
               mouseStatus = 10;
            }
            if(mouseX > 690 && mouseY > 115 && mouseX <= 860 && mouseY <= 135)
            {
               mouseStatus = 11;
            }
            if(mouseX > 690 && mouseY > 135 && mouseX <= 860 && mouseY <= 155)
            {
               mouseStatus = 12;
            }
            if(mouseX > 690 && mouseY > 155 && mouseX <= 860 && mouseY <= 175)
            {
               mouseStatus = 13;
            }
            if(mouseX > 690 && mouseY > 175 && mouseX <= 860 && mouseY <= 195)
            {
               mouseStatus = 14;
            }
            if(mouseX > 690 && mouseY > 195 && mouseX <= 860 && mouseY <= 215)
            {
               mouseStatus = 15;
            }
            if(mouseX > 690 && mouseY > 215 && mouseX <= 860 && mouseY <= 235)
            {
               mouseStatus = 16;
            }
            if(mouseX > 675 && mouseY > 245 && mouseX <= 715 && mouseY <= 265)
            {
               mouseStatus = 17;
            }
            if(mouseX > 730 && mouseY > 245 && mouseX <= 770 && mouseY <= 265)
            {
               mouseStatus = 18;
            }
            if(mouseX > 785 && mouseY > 245 && mouseX <= 820 && mouseY <= 265)
            {
               mouseStatus = 19;
            }
            if(mouseX > 840 && mouseY > 245 && mouseX <= 870 && mouseY <= 265)
            {
               mouseStatus = 20;
            }
            if(mouseX > 685 && mouseY > 295 && mouseX <= 870 && mouseY <= 320)
            {
               mouseStatus = 21;
            }
            if(mouseX > 685 && mouseY > 320 && mouseX <= 870 && mouseY <= 350)
            {
               mouseStatus = 22;
            }
            if(mouseX > 680 && mouseY > 270 && mouseX <= 740 && mouseY <= 290)
            {
               mouseStatus = 23;
            }
            if(mouseX > 680 && mouseY > 380 && mouseX <= 840 && mouseY <= 420)
            {
               mouseStatus = 24;
            }
            if(mouseX > 675 && mouseY > 445 && mouseX <= 710 && mouseY <= 495)
            {
               mouseStatus = 25;
            }
            if(mouseX > 710 && mouseY > 445 && mouseX <= 741 && mouseY <= 495)
            {
               mouseStatus = 26;
            }
            if(mouseX > 741 && mouseY > 445 && mouseX <= 771 && mouseY <= 495)
            {
               mouseStatus = 27;
            }
            if(mouseX > 771 && mouseY > 445 && mouseX <= 800 && mouseY <= 495)
            {
               mouseStatus = 28;
            }
            if(mouseX > 800 && mouseY > 445 && mouseX <= 830 && mouseY <= 495)
            {
               mouseStatus = 29;
            }
            if(mouseX > 686 && mouseY > 46 && mouseX <= 701 && mouseY <= 81)
            {
               mouseStatus = 30;
            }
            if(mouseX > 714 && mouseY > 46 && mouseX <= 729 && mouseY <= 81)
            {
               mouseStatus = 31;
            }
            if(mouseX > 742 && mouseY > 46 && mouseX <= 757 && mouseY <= 81)
            {
               mouseStatus = 32;
            }
         }
         radarSymbols[2].visible = mouseStatus == 1 && mouseInside;
         radarSymbols[3].visible = mouseStatus == 1 && mouseInside && mousePressed;
         if(mouseStatus == 1)
         {
            cursorText = Texts.fetch(1) + ": " + MathFunctions.NumberFormat(MathFunctions.Rad2Deg * mouseLookDir,1) + "º\n" + Texts.fetch(2);
         }
         if(mouseStatus == 2)
         {
            cursorText = Texts.fetch(3) + "\n";
            clickToStopNum = 8;
            clickToGoNum = 9;
            if(GD.Caravans[0].overTown != null)
            {
               clickToStopNum = 1671;
               clickToGoNum = 1672;
            }
            if(GD.Caravans[0].moving)
            {
               cursorText += Texts.fetch(4) + "\n" + Texts.fetch(6) + ": " + Math.round(GD.Caravans[0].speed * 10) / 10 + " " + Texts.fetch(10) + "\n" + Texts.fetch(7) + ": " + MathFunctions.NumberFormat(MathFunctions.Rad2Deg * GD.Caravans[0].direction,1,true) + "º\n" + Texts.fetch(clickToStopNum);
            }
            else
            {
               cursorText += Texts.fetch(5) + "\n" + Texts.fetch(7) + ": " + MathFunctions.NumberFormat(MathFunctions.Rad2Deg * GD.Caravans[0].direction,1,true) + "º\n" + Texts.fetch(clickToGoNum);
            }
            if(GD.Caravans[0].overTown != null)
            {
               cursorText += "\n" + Texts.fetch(1381).replace("@town@",GD.Towns[GD.Caravans[0].overTown].name);
               cursorText += "\n" + Texts.fetch(1673);
            }
         }
         if(mouseStatus == 10)
         {
            cursorText = Texts.fetch(14) + ": " + MathFunctions.NumberFormat(GD.Caravans[0].water,1) + " " + Texts.fetch(11);
         }
         if(mouseStatus == 11)
         {
            cursorText = Texts.fetch(15) + ": " + MathFunctions.NumberFormat(GD.Caravans[0].food,0) + " " + Texts.fetch(939);
         }
         if(mouseStatus == 12)
         {
            cursorText = Texts.fetch(16) + ": " + MathFunctions.NumberFormat(GD.Caravans[0].meds,1) + " " + Texts.fetch(13);
         }
         if(mouseStatus == 13)
         {
            cursorText = Texts.fetch(17) + ": " + MathFunctions.NumberFormat(GD.Caravans[0].forage,1) + " " + Texts.fetch(12);
         }
         if(mouseStatus == 14)
         {
            cursorText = Texts.fetch(18) + ": " + MathFunctions.NumberFormat(GD.Caravans[0].fuel,1) + " " + Texts.fetch(11);
         }
         if(mouseStatus == 15)
         {
            cursorText = Texts.fetch(19) + ": " + MathFunctions.NumberFormat(Math.max(electricityProduction - electricityConsumption,0),0) + " " + Texts.fetch(940);
         }
         if(mouseStatus == 16)
         {
            cursorText = Texts.fetch(20) + ": " + MathFunctions.NumberFormat(GD.Caravans[0].money,2) + " €";
         }
         if(mouseStatus == 17)
         {
            cursorText = Texts.fetch(1255);
         }
         if(mouseStatus == 18)
         {
            cursorText = Texts.fetch(22);
         }
         if(mouseStatus == 19)
         {
            cursorText = Texts.fetch(23);
         }
         if(mouseStatus == 20)
         {
            cursorText = Texts.fetch(24);
         }
         if(mouseStatus == 21)
         {
            cursorText = Texts.fetch(25) + ": " + MathFunctions.NumberFormat(GD.Caravans[0].totalCargo,1) + " " + Texts.fetch(12);
         }
         if(mouseStatus == 22)
         {
            cursorText = Texts.fetch(26) + ": " + MathFunctions.NumberFormat(GD.Caravans[0].maxCargo,1) + " " + Texts.fetch(12);
         }
         if(mouseStatus == 23)
         {
            cursorText = Texts.fetch(27);
         }
         if(mouseStatus == 24)
         {
            cursorText = date.Day2d + "-" + Texts.fetch(36 + date.Month).substr(0,3) + "-" + date.Year2d + "  " + date.Hour2d + ":" + date.Minute2d;
         }
         if(mouseStatus == 25)
         {
            cursorText = Texts.fetch(28);
         }
         if(mouseStatus == 26)
         {
            cursorText = Texts.fetch(29) + ": " + Texts.fetch(30);
         }
         if(mouseStatus == 27)
         {
            cursorText = Texts.fetch(29) + ": " + Texts.fetch(31);
         }
         if(mouseStatus == 28)
         {
            cursorText = Texts.fetch(29) + ": " + Texts.fetch(32);
         }
         if(mouseStatus == 29)
         {
            cursorText = Texts.fetch(33);
         }
         if(mouseStatus == 30)
         {
            cursorText = Texts.fetch(34);
         }
         if(mouseStatus == 31)
         {
            cursorText = Texts.fetch(1265);
         }
         if(mouseStatus == 32)
         {
            cursorText = Texts.fetch(36);
         }
         if(mouseStatus == 30 && mousePressed)
         {
            if(switches[0].currentFrame < 5)
            {
               switches[0].nextFrame();
            }
         }
         else if(switches[0].currentFrame > 1)
         {
            switches[0].prevFrame();
         }
         if(mouseStatus == 31 && mousePressed)
         {
            if(switches[1].currentFrame < 5)
            {
               switches[1].nextFrame();
            }
         }
         else if(switches[1].currentFrame > 1)
         {
            switches[1].prevFrame();
         }
         if(mouseStatus == 32 && mousePressed)
         {
            if(switches[2].currentFrame < 5)
            {
               switches[2].nextFrame();
            }
         }
         else if(switches[2].currentFrame > 1)
         {
            switches[2].prevFrame();
         }
         showInfoText = mouseStatus > 0 && mouseInside;
         screen.useHandCursor = mouseStatus == 2 || mouseStatus == 26 && GD.gameSpeed != 1 || mouseStatus == 27 && GD.gameSpeed != GD.doubleSpeed || mouseStatus == 28 && GD.gameSpeed != GD.tripleSpeed || mouseStatus == 29 && GD.gameSpeed != 0 || mouseStatus == 25 && dialoguesOpen.length == 0 || mouseStatus == 30 || mouseStatus == 31 || mouseStatus == 32;
         if(showInfoText)
         {
            infoTextFade = 1;
         }
         if(!showInfoText)
         {
            infoTextFade = -1;
         }
         if(infoTextFade == 1)
         {
            infoText.visible = true;
            infoText.alpha += 0.15;
            if(infoText.alpha >= 1.3)
            {
               infoTextFade = 0;
               infoText.alpha = 1.3;
               infoTextFade = 0;
            }
         }
         if(infoTextFade == -1)
         {
            infoText.alpha -= 0.15;
            if(infoText.alpha <= 0)
            {
               infoText.alpha = 0;
               infoText.visible = false;
               infoTextFade = 0;
            }
         }
         if(infoText.visible)
         {
            infoText.text = cursorText;
         }
         if(justInitiated)
         {
            justInitiated = false;
            if(GD.keepDialogues is Array)
            {
               i = 0;
               while(i < GD.keepDialogues.length)
               {
                  openDialogue(GD.keepDialogues[i].num,GD.keepDialogues[i].altVar);
                  i = Number(i) + 1;
               }
               GD.keepDialogues = null;
            }
         }
         forceTownUpdate = false;
      }
      
      private function dblClk(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(mouseX < 650 && mouseX >= 0 && mouseY >= 0 && mouseY < 495)
         {
            _loc2_ = MathFunctions.CalcDistance(325,248,mouseX,495 - mouseY);
            if(_loc2_ <= 14)
            {
               GD.setMode(3);
               stopped = true;
            }
         }
      }
      
      public function payMercenary(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         param1.payDay += 604800;
         _loc3_ = Math.min(param1.salary,param2.money);
         param2.money -= _loc3_;
         if(_loc3_ > param1.minSalary)
         {
            param1.morale += Math.pow(_loc3_ - param1.minSalary,0.5);
         }
      }
      
      public function init() : *
      {
         var _loc8_:* = undefined;
         var _loc13_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc10_:* = undefined;
         var _loc14_:* = undefined;
         radarSymbols = [];
         var _loc1_:int = 8222317;
         var _loc12_:Sprite = new Sprite();
         _loc12_.graphics.lineStyle(2,_loc1_,0.8);
         _loc12_.graphics.beginFill(_loc1_,0.2);
         _loc12_.graphics.drawCircle(14,14,12);
         _loc12_.graphics.endFill();
         _loc8_ = 0;
         while(_loc8_ < 16)
         {
            _loc3_ = _loc8_ * 3.141592653589793 / 8;
            if(_loc8_ % 4 == 0)
            {
               _loc13_ = 7;
               _loc12_.graphics.lineStyle(2,_loc1_,0.6);
            }
            else if(_loc8_ % 2 == 0)
            {
               _loc12_.graphics.lineStyle(1,_loc1_,0.6);
               _loc13_ = 8;
            }
            else
            {
               _loc12_.graphics.lineStyle(1,_loc1_,0.5);
               _loc13_ = 9;
            }
            _loc12_.graphics.moveTo(14 + Math.sin(_loc3_) * 12,14 + Math.cos(_loc3_) * 12);
            _loc12_.graphics.lineTo(14 + Math.sin(_loc3_) * _loc13_,14 + Math.cos(_loc3_) * _loc13_);
            _loc8_++;
         }
         var _loc7_:BitmapData = new BitmapData(28,28,true,0);
         _loc7_.draw(_loc12_);
         radarSymbols[0] = new Bitmap(_loc7_);
         radarSymbols[0].x = 311;
         radarSymbols[0].y = 234;
         _loc12_.graphics.clear();
         _loc12_.graphics.lineStyle(2,_loc1_,0.9);
         _loc12_.graphics.moveTo(14,5);
         _loc12_.graphics.lineTo(9,21);
         _loc12_.graphics.lineTo(14,16);
         _loc12_.graphics.lineTo(19,21);
         _loc12_.graphics.lineTo(14,5);
         _loc7_ = new BitmapData(28,28,true,0);
         _loc7_.draw(_loc12_);
         var _loc15_:Bitmap = new Bitmap(_loc7_);
         _loc15_.smoothing = true;
         radarSymbols[1] = new Sprite();
         _loc15_.x = -14;
         _loc15_.y = -14;
         radarSymbols[1].addChild(_loc15_);
         radarSymbols[1].x = 325;
         radarSymbols[1].y = 248;
         _loc12_.graphics.clear();
         _loc12_.graphics.lineStyle(2,_loc1_,0.9);
         _loc12_.graphics.beginFill(_loc1_,0.3);
         _loc12_.graphics.moveTo(6,2);
         _loc12_.graphics.lineTo(2,7);
         _loc12_.graphics.lineTo(10,7);
         _loc12_.graphics.lineTo(6,2);
         _loc12_.graphics.endFill();
         _loc7_ = new BitmapData(12,9,true,0);
         _loc7_.draw(_loc12_);
         _loc15_ = new Bitmap(_loc7_);
         _loc15_.smoothing = true;
         radarSymbols[2] = new Sprite();
         _loc15_.x = -6;
         _loc15_.y = -23;
         radarSymbols[2].addChild(_loc15_);
         radarSymbols[2].x = 325;
         radarSymbols[2].y = 248;
         _loc12_.graphics.clear();
         _loc12_.graphics.beginFill(_loc1_,0.9);
         _loc12_.graphics.moveTo(6,2);
         _loc12_.graphics.lineTo(2,7);
         _loc12_.graphics.lineTo(10,7);
         _loc12_.graphics.lineTo(6,2);
         _loc12_.graphics.endFill();
         _loc7_ = new BitmapData(12,9,true,0);
         _loc7_.draw(_loc12_);
         _loc15_ = new Bitmap(_loc7_);
         _loc15_.smoothing = true;
         radarSymbols[3] = new Sprite();
         _loc15_.x = -6;
         _loc15_.y = -23;
         radarSymbols[3].addChild(_loc15_);
         radarSymbols[3].x = 325;
         radarSymbols[3].y = 248;
         clockParts = [];
         _loc12_.graphics.clear();
         _loc12_.graphics.beginFill(197378);
         _loc12_.graphics.moveTo(2,14);
         _loc12_.graphics.lineTo(2.5,2);
         _loc12_.graphics.lineTo(3.5,2);
         _loc12_.graphics.lineTo(4,14);
         _loc12_.graphics.endFill();
         _loc7_ = new BitmapData(6,16,true,0);
         _loc7_.draw(_loc12_);
         _loc15_ = new Bitmap(_loc7_);
         _loc15_.smoothing = true;
         clockParts[0] = new Sprite();
         _loc15_.x = -3;
         _loc15_.y = -14;
         clockParts[0].addChild(_loc15_);
         clockParts[0].x = 794;
         clockParts[0].y = 401;
         _loc12_.graphics.clear();
         _loc12_.graphics.beginFill(197378);
         _loc12_.graphics.moveTo(2,11);
         _loc12_.graphics.lineTo(2.5,2);
         _loc12_.graphics.lineTo(3.5,2);
         _loc12_.graphics.lineTo(4,11);
         _loc12_.graphics.endFill();
         _loc7_ = new BitmapData(6,13,true,0);
         _loc7_.draw(_loc12_);
         _loc15_ = new Bitmap(_loc7_);
         _loc15_.smoothing = true;
         clockParts[1] = new Sprite();
         _loc15_.x = -3;
         _loc15_.y = -11;
         clockParts[1].addChild(_loc15_);
         clockParts[1].x = 794;
         clockParts[1].y = 401;
         _loc12_.graphics.clear();
         _loc12_.graphics.beginFill(197378);
         _loc12_.graphics.drawCircle(3,3,2);
         _loc12_.graphics.endFill();
         _loc7_ = new BitmapData(6,13,true,0);
         _loc7_.draw(_loc12_);
         clockParts[2] = new Bitmap(_loc7_);
         clockParts[2].x = 791;
         clockParts[2].y = 398;
         _loc12_.graphics.clear();
         _loc12_.graphics.beginFill(8486753);
         _loc12_.graphics.moveTo(2,14);
         _loc12_.graphics.lineTo(2.5,2);
         _loc12_.graphics.lineTo(3.5,2);
         _loc12_.graphics.lineTo(4,14);
         _loc12_.graphics.endFill();
         _loc7_ = new BitmapData(6,16,true,0);
         _loc7_.draw(_loc12_);
         _loc15_ = new Bitmap(_loc7_);
         _loc15_.smoothing = true;
         clockParts[3] = new Sprite();
         _loc15_.x = -3;
         _loc15_.y = -14;
         clockParts[3].addChild(_loc15_);
         clockParts[3].x = 793;
         clockParts[3].y = 400;
         _loc12_.graphics.clear();
         _loc12_.graphics.beginFill(8486753);
         _loc12_.graphics.moveTo(2,11);
         _loc12_.graphics.lineTo(2.5,2);
         _loc12_.graphics.lineTo(3.5,2);
         _loc12_.graphics.lineTo(4,11);
         _loc12_.graphics.endFill();
         _loc7_ = new BitmapData(6,13,true,0);
         _loc7_.draw(_loc12_);
         _loc15_ = new Bitmap(_loc7_);
         _loc15_.smoothing = true;
         clockParts[4] = new Sprite();
         _loc15_.x = -3;
         _loc15_.y = -11;
         clockParts[4].addChild(_loc15_);
         clockParts[4].x = 793;
         clockParts[4].y = 400;
         _loc12_.graphics.clear();
         _loc12_.graphics.beginFill(8486753);
         _loc12_.graphics.drawCircle(3,3,2);
         _loc12_.graphics.endFill();
         _loc7_ = new BitmapData(6,13,true,0);
         _loc7_.draw(_loc12_);
         clockParts[5] = new Bitmap(_loc7_);
         clockParts[5].x = 790;
         clockParts[5].y = 397;
         flippers = [];
         flippers[0] = new Flipper2signs();
         flippers[0].x = 680;
         flippers[0].y = 386;
         flippers[1] = new Flipper3signs();
         flippers[1].x = 713;
         flippers[1].y = 386;
         flippers[2] = new Flipper2signs();
         flippers[2].x = 745;
         flippers[2].y = 386;
         flippers[3] = new Flipper2signs();
         flippers[3].x = 809;
         flippers[3].y = 386;
         buttons = [];
         buttons[0] = new Bitmap(new MapModeButt1Pressed());
         _loc8_ = 1;
         while(_loc8_ <= 3)
         {
            buttons[_loc8_] = new Bitmap(new MapModeButt2Pressed());
            _loc8_++;
         }
         buttons[4] = new Bitmap(new MapModeButt5Pressed());
         _loc8_ = 0;
         while(_loc8_ < 5)
         {
            buttons[_loc8_].y = 445;
            buttons[_loc8_].visible = false;
            _loc8_++;
         }
         buttons[0].x = 675;
         buttons[1].x = 710;
         buttons[2].x = 741;
         buttons[3].x = 771;
         buttons[4].x = 800;
         switches = [];
         _loc8_ = 0;
         while(_loc8_ < 3)
         {
            switches[_loc8_] = new MapModeSwitch();
            switches[_loc8_].gotoAndStop(0);
            switches[_loc8_].y = 46;
            _loc8_++;
         }
         switches[0].x = 686;
         switches[1].x = 714;
         switches[2].x = 742;
         infoText = new EngineText("",3420257,12,"left",15,15);
         pausedText = new EngineText("-= " + Texts.fetch(1423).toUpperCase() + " =-",3420257,16,"center",15,420,625,20);
         pausedText.visible = false;
         counters = [];
         _loc8_ = 1;
         while(_loc8_ <= 7)
         {
            counters[_loc8_] = new Counter(12);
            counters[_loc8_].x = 711;
            _loc8_++;
         }
         counters[1].y = 100;
         counters[2].y = 120;
         counters[3].y = 140;
         counters[4].y = 161;
         counters[5].y = 181;
         counters[6].y = 202;
         counters[7].y = 222;
         indicators = [];
         _loc8_ = 1;
         while(_loc8_ <= 2)
         {
            indicators[_loc8_] = new Indicator(9,true,null,16777215);
            indicators[_loc8_].x = 711;
            _loc8_++;
         }
         indicators[1].y = 298;
         indicators[2].y = 328;
         if(screen is Sprite)
         {
            removeChild(screen);
         }
         screen = new Sprite();
         groundBG = new Sprite();
         var _loc11_:Array = [];
         _loc8_ = 1;
         while(_loc8_ <= 4)
         {
            _loc11_[_loc8_] = new Bitmap(new MapBG());
            groundBG.addChild(_loc11_[_loc8_]);
            _loc8_++;
         }
         _loc11_[2].x = 1402;
         _loc11_[3].y = 1108;
         _loc11_[4].x = 1402;
         _loc11_[4].y = 1108;
         groundMask = new Sprite();
         groundMask.graphics.beginFill(16777215);
         groundMask.graphics.moveTo(0,0);
         groundMask.graphics.lineTo(670,0);
         groundMask.graphics.lineTo(670,495);
         groundMask.graphics.lineTo(0,495);
         groundMask.graphics.endFill();
         screen.addChild(groundMask);
         movingStuff = new Sprite();
         movingStuff.addChild(groundBG);
         screen.addChild(movingStuff);
         movingStuff.mask = groundMask;
         townSymbols = [];
         townNameTexts = [];
         for(_loc8_ in Presets.Towns)
         {
            townSymbols[_loc8_] = new Sprite();
            townSymbols[_loc8_].graphics.lineStyle(2,0,0.3);
            townSymbols[_loc8_].graphics.drawCircle(0,0,18);
            townSymbols[_loc8_].graphics.beginFill(0,0.2);
            townSymbols[_loc8_].graphics.drawCircle(0,0,8);
            townNameTexts[_loc8_] = new EngineText(GD.Towns[_loc8_].name,4735032,12,"center",-100,18,200,20);
            townSymbols[_loc8_].addChild(townNameTexts[_loc8_]);
            townSymbols[_loc8_].visible = false;
            movingStuff.addChild(townSymbols[_loc8_]);
         }
         mapSymbols = new Sprite();
         movingStuff.addChild(mapSymbols);
         for(_loc8_ in GD.Caravans)
         {
            if(GD.Caravans[_loc8_].mapSymbol is Sprite)
            {
               mapSymbols.addChild(GD.Caravans[_loc8_].mapSymbol);
               GD.Caravans[_loc8_].mapSymbolParent = mapSymbols;
            }
         }
         _loc8_ = 0;
         while(_loc8_ <= 3)
         {
            screen.addChild(radarSymbols[_loc8_]);
            _loc8_++;
         }
         radarSymbols[3].visible = false;
         windSymbol = new Sprite();
         windSymbol.x = 590;
         windSymbol.y = 430;
         windSymbol.graphics.lineStyle(2,_loc1_);
         windSymbol.graphics.drawCircle(0,0,25);
         _loc8_ = 0;
         while(_loc8_ < 16)
         {
            _loc14_ = MathFunctions.dblPI / 16 * _loc8_;
            if(_loc8_ % 4 == 0)
            {
               windSymbol.graphics.lineStyle(2,_loc1_);
               _loc4_ = 20;
               _loc10_ = 30;
            }
            else
            {
               windSymbol.graphics.lineStyle(1,_loc1_);
               _loc4_ = 22;
               _loc10_ = 25;
            }
            windSymbol.graphics.moveTo(Math.sin(_loc14_) * _loc4_,0 - Math.cos(_loc14_) * _loc4_);
            windSymbol.graphics.lineTo(Math.sin(_loc14_) * _loc10_,0 - Math.cos(_loc14_) * _loc10_);
            _loc8_++;
         }
         windSymbol.mouseEnabled = false;
         windSymbol.mouseChildren = false;
         windArrow = new Sprite();
         windArrow.graphics.lineStyle(2,_loc1_);
         windArrow.graphics.moveTo(0,-15);
         windArrow.graphics.lineTo(10,-5);
         windArrow.graphics.lineTo(5,-5);
         windArrow.graphics.lineTo(5,15);
         windArrow.graphics.lineTo(-5,15);
         windArrow.graphics.lineTo(-5,-5);
         windArrow.graphics.lineTo(-10,-5);
         windArrow.graphics.lineTo(0,-15);
         windSymbol.addChild(windArrow);
         var _loc5_:Sprite = new Sprite();
         _loc5_.graphics.beginFill(_loc1_);
         _loc5_.graphics.moveTo(0,-13);
         _loc5_.graphics.lineTo(6,-7);
         _loc5_.graphics.lineTo(3,-7);
         _loc5_.graphics.lineTo(3,13);
         _loc5_.graphics.lineTo(-3,13);
         _loc5_.graphics.lineTo(-3,-7);
         _loc5_.graphics.lineTo(-6,-7);
         _loc5_.graphics.endFill();
         windArrow.addChild(_loc5_);
         windArrowMask = new Sprite();
         windArrowMask.graphics.beginFill(16711680);
         windArrowMask.graphics.drawRect(-10,0,20,30);
         _loc5_.mask = windArrowMask;
         windArrow.addChild(windArrowMask);
         var _loc16_:EngineText = new EngineText(Texts.fetch(6378).toUpperCase(),_loc1_,9,"center",-50,-45,100,15);
         windSymbol.addChild(_loc16_);
         windSpeedText = new EngineText(Texts.fetch(6378).toUpperCase(),_loc1_,9,"center",-50,30,100,15);
         windSymbol.addChild(windSpeedText);
         windSymbol.visible = false;
         screen.addChild(windSymbol);
         var _loc2_:Bitmap = new Bitmap(new MapModeOverBackground());
         screen.addChild(_loc2_);
         var _loc9_:Bitmap = new Bitmap(new MapModeBase());
         _loc9_.x = 650;
         screen.addChild(_loc9_);
         _loc8_ = 1;
         while(_loc8_ <= 7)
         {
            screen.addChild(counters[_loc8_]);
            _loc8_++;
         }
         _loc8_ = 1;
         while(_loc8_ <= 2)
         {
            screen.addChild(indicators[_loc8_]);
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < clockParts.length)
         {
            screen.addChild(clockParts[_loc8_]);
            _loc8_++;
         }
         var _loc6_:Bitmap = new Bitmap(new MapModeGlass());
         _loc6_.x = 650;
         screen.addChild(_loc6_);
         _loc8_ = 0;
         while(_loc8_ <= 3)
         {
            screen.addChild(flippers[_loc8_]);
            _loc8_++;
         }
         date = GD.makeDate(GD.Time);
         setFlipper(flippers[0],date.Day2d,true);
         setFlipper(flippers[1],date.ShortMonthName,true);
         setFlipper(flippers[2],date.Year2d,true);
         setFlipper(flippers[3],date.AmPm,true);
         _loc8_ = 0;
         while(_loc8_ < 5)
         {
            screen.addChild(buttons[_loc8_]);
            _loc8_++;
         }
         if(GD.gameSpeed == 1)
         {
            setSpeedButtons(1);
         }
         if(GD.gameSpeed == GD.doubleSpeed)
         {
            setSpeedButtons(2);
         }
         if(GD.gameSpeed == GD.tripleSpeed)
         {
            setSpeedButtons(3);
         }
         if(GD.gameSpeed == 0)
         {
            setSpeedButtons(4);
         }
         _loc8_ = 0;
         while(_loc8_ < 3)
         {
            screen.addChild(switches[_loc8_]);
            _loc8_++;
         }
         screen.addChild(infoText);
         screen.addChild(pausedText);
         infoText.alpha = 0;
         infoText.visible = false;
         mMove(0);
         bulbs = [];
         _loc8_ = 1;
         while(_loc8_ <= 12)
         {
            bulbs[_loc8_] = new ImportedBitmap("BulbLightRedOn.png");
            if(_loc8_ <= 7)
            {
               bulbs[_loc8_].x = 843;
               bulbs[_loc8_].y = 95 + (_loc8_ - 1) * 20.5;
            }
            else if(_loc8_ < 12)
            {
               bulbs[_loc8_].x = 674 + (_loc8_ - 8) * 56.5;
               bulbs[_loc8_].y = 244;
            }
            else
            {
               bulbs[_loc8_].x = 680;
               bulbs[_loc8_].y = 270;
            }
            bulbs[_loc8_].visible = false;
            screen.addChild(bulbs[_loc8_]);
            _loc8_++;
         }
         screen.mouseChildren = false;
         screen.buttonMode = true;
         screen.useHandCursor = false;
         addChild(screen);
         optionsMenu = new OptionsMenu(GD);
         optionsMenu.visible = false;
         addChild(optionsMenu);
      }
      
      public function setSpeedButtons(param1:*) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            buttons[_loc2_].visible = _loc2_ == param1;
            _loc2_++;
         }
      }
      
      public function setFlipper(param1:*, param2:*, param3:* = false) : *
      {
         if(param3)
         {
            param1.OldUpper.TF.text = param2;
            param1.OldLower.TF.text = param2;
         }
         else if(param2 != param1.currVal)
         {
            param1.NewUpper.TF.text = param2;
            param1.NewLower.TF.text = param2;
            param1.play();
         }
         param1.currVal = param2;
      }
      
      internal function dismissPerson(param1:*, param2:*) : *
      {
         param1.salary = param1.minSalary;
         if(param2.overTown != null)
         {
            if(param1.category == 2)
            {
               GD.Towns[param2.overTown].people.push(param1);
            }
            param2.removePerson(param1);
         }
         else
         {
            if(param1.category == 1)
            {
               param1.category = 6;
            }
            if(param1.category == 2)
            {
               param1.category = 7;
            }
            if(param1.category == 3)
            {
               param1.category = 8;
            }
            if(param1.category == 4)
            {
               param1.category = 9;
            }
         }
      }
      
      internal function destroyCaravan(param1:*) : *
      {
         param1.destroy();
         GD.Caravans.splice(GD.Caravans.indexOf(param1),1);
         GD.setSquareValue(param1.squareX,param1.squareY,"removecaravan",param1);
      }
      
      public function openDialogue(param1:*, param2:* = null, param3:* = null, param4:* = null) : *
      {
         var menuOptions:*;
         var currDialogue:*;
         var partnerPortrait:*;
         var portraitWrap:*;
         var portraitInside:*;
         var num:* = param1;
         var altVar:* = param2;
         var altVar2:* = param3;
         var altVar3:* = param4;
         musicFadeOut = true;
         screen.useHandCursor = false;
         switch(num)
         {
            case 1:
               currDialogue = optionsMenu;
               break;
            case 2:
               System.pauseForGCIfCollectionImminent(1);
               System.gc();
               currDialogue = new CaravanEncounterMenu(1,["go to battle","auto distribute ammo and go to battle","caravan menu","exit game"],altVar,GD,attackFunction);
               break;
            case 3:
               System.pauseForGCIfCollectionImminent(1);
               System.gc();
               menuOptions = [];
               if(GD.getFactionRelations(0,Presets.CaravanTypes[altVar.type].faction) >= -2)
               {
                  menuOptions.push("trade");
               }
               menuOptions.push("attack");
               menuOptions.push("auto distribute ammo and attack");
               menuOptions.push("caravan menu");
               menuOptions.push("cancel");
               currDialogue = new CaravanEncounterMenu(2,menuOptions,altVar,GD,attackFunction);
               currDialogue.mustAttack = false;
               break;
            case 4:
               currDialogue = new YesNoDialogue(true,75);
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 5:
               currDialogue = new YesNoDialogue();
               break;
            case 6:
               currDialogue = new TradeWindow(GD);
               partnerPortrait = new Sprite();
               portraitWrap = new Sprite();
               portraitInside = altVar.People[0].getPortrait();
               portraitWrap.addChild(portraitInside);
               portraitWrap.x = -125;
               portraitWrap.y = -125;
               partnerPortrait.addChild(portraitWrap);
               partnerPortrait.scaleX = partnerPortrait.scaleY = 0.24;
               GD.Caravans[0].staticMode = false;
               altVar.staticMode = false;
               currDialogue.setPartner(altVar,partnerPortrait);
               currDialogue.onExit = function():*
               {
                  closeDialogue();
               };
               break;
            case 7:
               currDialogue = new SettingsWindow(GD);
               currDialogue.onClose = function():*
               {
                  closeDialogue();
               };
               break;
            case 8:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(1609,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(15);
                  GD.setMode(7,1);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 9:
               currDialogue = new CaravanEncounterMenu(1,["go to battle","auto distribute ammo and go to battle","caravan menu","exit game"],altVar,GD,attackFunction,altVar2,altVar3);
               break;
            case 10:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(2138,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(22);
                  GD.setMode(7,10);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 11:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(2219,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 12:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(2220,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 13:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(2227,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 14:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(2251,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 15:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(2301,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 16:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(3593,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 17:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(altVar);
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  if(GD.pauseOnExitTown)
                  {
                     GD.gameSpeed = 0;
                     setSpeedButtons(4);
                  }
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 18:
               currDialogue = new YesNoDialogue(false);
               currDialogue.setText(altVar);
               currDialogue.onCancel = function():*
               {
                  closeDialogue();
               };
               currDialogue.onApprove = function():*
               {
                  doSmuggle(altVar2,altVar3);
                  doEnter(altVar2);
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 19:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(4290,GD.Caravans[0].People[0].gender).replace("@townname@",altVar).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 20:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(4291,GD.Caravans[0].People[0].gender).replace("@townname@",altVar).toUpperCase() + "\n\n" + Texts.fetch(6796).toUpperCase() + ": " + Texts.fetch(Presets.factionNames[altVar2]).toUpperCase() + "\n" + Texts.fetch(6797).toUpperCase() + ": " + Math.round(GD.getFactionRelations(altVar2,0)));
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 21:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(4463,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  var _loc1_:* = undefined;
                  closeDialogue();
                  enterTown(15);
                  var _loc2_:Boolean = false;
                  for(_loc1_ in GD.Caravans[0].People)
                  {
                     if(GD.Caravans[0].People[_loc1_].specialPurpose == 5)
                     {
                        _loc2_ = true;
                        break;
                     }
                  }
                  if(_loc2_)
                  {
                     GD.Story.dialogueDefaults[11] = 1220;
                     GD.setMode(7,11);
                     GD.completeQuest(1);
                  }
                  else
                  {
                     GD.failQuest(1);
                     GD.failQuest(2);
                  }
                  GD.acceptQuest(25);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 22:
               currDialogue = new YesNoDialogue(false);
               currDialogue.setText(Texts.fetch(4464,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.approveButton.buttonText.text = Texts.fetch(4465).toUpperCase();
               currDialogue.cancelButton.buttonText.text = Texts.fetch(4466).toUpperCase();
               currDialogue.onApprove = function():*
               {
                  var _loc1_:int = 5;
                  var _loc2_:Number = GD.Story.specificReputations[_loc1_] + 5;
                  GD.Story.specificReputations[_loc1_] = _loc2_;
                  GD.Story.buriedTheBaby = true;
                  GD.failQuest(24);
                  closeDialogue();
               };
               currDialogue.onCancel = function():*
               {
                  GD.Caravans[0].addCargo(171,1);
                  closeDialogue();
               };
               break;
            case 23:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(4925,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 24:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(4944,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 25:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(4945,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 26:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(5167,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 27:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(5565,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(43);
                  GD.setMode(7,28);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 28:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6159,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 29:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6244,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  GD.setMode(7,35);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 30:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6538,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 31:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6539,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 32:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6540,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  var _loc1_:* = undefined;
                  closeDialogue();
                  if(MathFunctions.CalcDistance(GD.Caravans[0].x,GD.Caravans[0].y,Presets.Towns[5].x,Presets.Towns[5].y) < 100)
                  {
                     GD.setMode(6,6541);
                     return;
                  }
                  for(_loc1_ in GD.Caravans)
                  {
                     if(MathFunctions.CalcDistance(GD.Caravans[_loc1_].x,GD.Caravans[_loc1_].y,Presets.Towns[5].x,Presets.Towns[5].y) < 100)
                     {
                        GD.Caravans[_loc1_].active = false;
                     }
                  }
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 33:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6643,GD.Caravans[0].People[0].gender).replace("@number@",GD.Story.qgMissionAmount).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 34:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6644,GD.Caravans[0].People[0].gender).replace("@number@",altVar).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 35:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6655,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 36:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6661,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 37:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6660,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 38:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6664,GD.Caravans[0].People[0].gender).replace("@grams@",altVar + " " + Texts.fetch(13)).toUpperCase() + " " + Texts.fetch(6666).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 39:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6664,GD.Caravans[0].People[0].gender).replace("@grams@",altVar + " " + Texts.fetch(13)).toUpperCase() + " " + Texts.fetch(6665).replace("@grams@",GD.Story.qgMissionAmount - altVar + " " + Texts.fetch(13)).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 40:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6668,GD.Caravans[0].People[0].gender).replace("@kilograms@",altVar + " " + Texts.fetch(12)).toUpperCase() + " " + Texts.fetch(6666).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 41:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6668,GD.Caravans[0].People[0].gender).replace("@kilograms@",altVar + " " + Texts.fetch(12)).toUpperCase() + " " + Texts.fetch(6669).replace("@kilograms@",GD.Story.qgMissionAmount - altVar + " " + Texts.fetch(12)).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 42:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6671,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 43:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6672,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 44:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6674,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
                  enterTown(GD.Caravans[0].overTown);
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 45:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6676,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 46:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6677,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 47:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6736,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  var _loc1_:* = undefined;
                  closeDialogue();
                  if(MathFunctions.CalcDistance(GD.Caravans[0].x,GD.Caravans[0].y,Presets.Towns[5].x,Presets.Towns[5].y) < 100)
                  {
                     GD.setMode(6,6541);
                     return;
                  }
                  for(_loc1_ in GD.Caravans)
                  {
                     if(MathFunctions.CalcDistance(GD.Caravans[_loc1_].x,GD.Caravans[_loc1_].y,Presets.Towns[5].x,Presets.Towns[5].y) < 100)
                     {
                        GD.Caravans[_loc1_].active = false;
                     }
                  }
               };
               currDialogue.dontRemoveFunctions = true;
               break;
            case 48:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6898,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
               GD.Story.finishedTheGame = true;
               break;
            case 49:
               currDialogue = new YesNoDialogue(true);
               currDialogue.setText(Texts.fetch(6913,GD.Caravans[0].People[0].gender).toUpperCase());
               currDialogue.onApprove = function():*
               {
                  closeDialogue();
               };
               currDialogue.dontRemoveFunctions = true;
         }
         currDialogue.visible = true;
         dialoguesOpen.push(currDialogue);
         openDialoguesData.push({
            "num":num,
            "altVar":altVar
         });
         if(!(currDialogue is OptionsMenu))
         {
            addChild(dialoguesOpen[dialoguesOpen.length - 1]);
         }
         screen.useHandCursor = false;
         currDialogue = null;
      }
      
      public function closeDialogue() : *
      {
         var _loc1_:* = openDialoguesData.pop();
         var _loc2_:* = dialoguesOpen.pop();
         if(dialoguesOpen.length == 0 && GD.mode == 1 && GD.gameSpeed > 0)
         {
            musicFadeIn = true;
         }
         if(_loc2_ is CaravanEncounterMenu || _loc2_ is YesNoDialogue || _loc2_ is SettingsWindow)
         {
            _loc2_.remove();
         }
         if(_loc2_ is TradeWindow)
         {
            _loc2_.remove();
            GD.Caravans[0].staticMode = true;
            GD.Caravans[0].update();
            _loc1_.altVar.staticMode = true;
            _loc1_.altVar.update();
         }
         if(_loc2_ is OptionsMenu)
         {
            _loc2_.visible = false;
         }
         else
         {
            removeChild(_loc2_);
         }
         if(_loc1_.num == 3)
         {
            GD.Caravans[0].update();
            if(_loc1_.altVar is Caravan)
            {
               _loc1_.altVar.update();
            }
         }
         if(dialoguesOpen.length == 0)
         {
            stage.focus = stage;
         }
      }
      
      public function closeAllDialogues() : *
      {
         while(dialoguesOpen.length > 0)
         {
            closeDialogue();
         }
      }
      
      public function checkBehavior(param1:*, param2:*, param3:* = null) : *
      {
         var _loc4_:* = undefined;
         if(GD.Story is Caravaneer2MainStory && param1.faction == 2 && GD.Story.accompanyedByThum)
         {
            return 0;
         }
         var _loc6_:* = GD.getFactionRelations(Presets.CaravanTypes[param1.type].faction,Presets.CaravanTypes[param2.type].faction);
         if(_loc6_ > -3)
         {
            return 0;
         }
         if(param1.fearless)
         {
            _loc4_ = Infinity;
         }
         else
         {
            _loc4_ = param1.visualWarPower;
         }
         var _loc5_:Number = _loc4_ / param2.visualWarPower * param1.morale / 50;
         if(param3 == null)
         {
            param3 = MathFunctions.CalcDistance(param1.x,param1.y,param2.x,param2.y);
         }
         if(param1.aggressive && _loc5_ > 0.5 && _loc6_ * _loc5_ < -10)
         {
            return 0 - _loc6_ * _loc5_ / param3 * (1 / param2.speed);
         }
         if(param2.aggressive && _loc6_ * (1 / _loc5_) < -10 && _loc5_ < 0.7)
         {
            return 1 / _loc6_ * (1 / _loc5_) * (1 / param3) * param2.speed;
         }
         return 0;
      }
      
      public function simulateBattle(param1:*, param2:*) : *
      {
         var _loc9_:* = undefined;
         var _loc7_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc10_:* = undefined;
         var _loc8_:Number = param1.actualWarPower * 0.8 + Math.random() * param1.actualWarPower * 0.4;
         var _loc5_:Number = param2.actualWarPower * 0.8 + Math.random() * param2.actualWarPower * 0.4;
         if(_loc8_ > _loc5_)
         {
            _loc4_ = param1;
            _loc9_ = param2;
            _loc3_ = _loc8_ / _loc5_;
         }
         else
         {
            _loc4_ = param2;
            _loc9_ = param1;
            _loc3_ = _loc5_ / _loc8_;
         }
         _loc9_.active = false;
         trace("forces: " + _loc8_ + " " + _loc5_);
         var _loc6_:Number = 1 / Math.max(_loc3_,1);
         _loc4_.randomPointer = null;
         for(_loc7_ in _loc4_.People)
         {
            _loc4_.People[_loc7_].randomPointer = null;
            if(_loc4_.People[_loc7_].specialPurpose <= 0 && Math.random() < _loc6_)
            {
               _loc10_ = Math.round(_loc4_.People[_loc7_].maxHP * Math.pow(_loc6_,2) * Math.pow(Math.random(),4) * 3);
               _loc4_.People[_loc7_].HP -= _loc10_;
            }
         }
         _loc7_ = 0;
         while(_loc7_ < _loc4_.People.length)
         {
            if(_loc4_.People[_loc7_].HP <= 0)
            {
               if(_loc4_.People[_loc7_].specialPurpose == 1)
               {
                  GD.Story.accompanyedByThum = false;
               }
               if(_loc4_.People[_loc7_].specialPurpose == 2)
               {
                  GD.executeMajorEvent(38);
               }
               if(_loc4_.People[_loc7_].specialPurpose == 3)
               {
                  GD.Story.spencerRiceIsDead = true;
               }
               if(_loc4_.People[_loc7_].specialPurpose == 9)
               {
                  GD.Story.eliahsManDead = true;
               }
               if(_loc4_.People[_loc7_].specialPurpose == 11)
               {
                  GD.Story.noraIsDead = true;
               }
               _loc4_.removePerson(_loc4_.People[_loc7_]);
               _loc7_--;
            }
            _loc7_++;
         }
         if(_loc4_.People.length == 0)
         {
            _loc4_.active = false;
         }
         _loc4_.update();
      }
      
      private function manOrMen(param1:*) : *
      {
         if(param1 == 1)
         {
            return Texts.fetch(772);
         }
         if(Texts.language == 14 && param1 < 5)
         {
            return param1 + " человека";
         }
         return Texts.fetch(773).replace("@number@",param1);
      }
      
      private function stopWatch() : *
      {
         var _loc2_:Date = new Date();
         var _loc1_:Number = _loc2_ - stopWatchTime;
         stopWatchTime = _loc2_;
         return _loc1_;
      }
      
      public function enterTown(param1:*) : *
      {
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         _loc4_ = undefined;
         var _loc3_:* = undefined;
         var _loc7_:* = undefined;
         if(GD.Towns[param1].faction != undefined)
         {
            GD.revealedFactions[GD.Towns[param1].faction] = true;
         }
         if(GD.Towns[param1].entranceControl && GD.Towns[param1].faction != undefined && GD.getFactionRelations(GD.Towns[param1].faction,0) < -10)
         {
            openDialogue(20,GD.Towns[param1].name,GD.Towns[param1].faction);
         }
         else
         {
            var _loc6_:Array = [];
            var _loc8_:* = GD.Towns[param1].bannedGoods;
            var _loc2_:* = 0;
            for(_loc4_ in _loc8_)
            {
               for(_loc5_ in GD.Caravans[0].Cargo)
               {
                  if(GD.Caravans[0].Cargo[_loc5_].type == _loc8_[_loc4_])
                  {
                     _loc2_ += GD.Caravans[0].Cargo[_loc5_].amount * GD.Caravans[0].Cargo[_loc5_].weightPerUnit;
                     _loc6_.push(GD.Caravans[0].Cargo[_loc5_]);
                  }
               }
            }
            if(_loc6_.length > 0)
            {
               _loc3_ = GD.Caravans[0].maxSmuggle / Math.max(1 + GD.Story.specificReputations[8] / 50,1);
               GD.Caravans[0].moving = false;
               _loc7_ = Texts.fetch(4284,GD.Caravans[0].People[0].gender).toUpperCase() + ":\n\n";
               for(_loc4_ in _loc6_)
               {
                  _loc7_ += _loc6_[_loc4_].name.toUpperCase() + " (" + MathFunctions.NumberFormat(_loc6_[_loc4_].totalWeight,1,true) + " " + Texts.fetch(12).toUpperCase() + ")\n";
               }
               _loc7_ += "\n" + Texts.fetch(4285,GD.Caravans[0].People[0].gender).replace("@weight@",MathFunctions.NumberFormat(_loc3_,1,true) + " " + Texts.fetch(12).toUpperCase()).toUpperCase() + "\n\n";
               if(_loc2_ - _loc3_ >= 0.05)
               {
                  _loc7_ += Texts.fetch(4286,GD.Caravans[0].People[0].gender).replace("@weight@",MathFunctions.NumberFormat(_loc2_ - _loc3_,1,true) + " " + Texts.fetch(12)).toUpperCase() + "\n\n";
                  openDialogue(17,_loc7_);
               }
               else
               {
                  _loc7_ += Texts.fetch(4287,GD.Caravans[0].People[0].gender).toUpperCase() + "\n\n" + Texts.fetch(4288,GD.Caravans[0].People[0].gender).toUpperCase();
                  openDialogue(18,_loc7_,param1,_loc2_);
               }
            }
            else
            {
               doEnter(param1);
            }
         }
      }
      
      private function doEnter(param1:*) : *
      {
         GD.Caravans[0].x = Presets.Towns[param1].x;
         GD.Caravans[0].y = Presets.Towns[param1].y;
         GD.Caravans[0].moving = false;
         GD.Towns[18].locations[2].visible = GD.storyMode && param1 == 18 && GD.Story.agreedToMeetLois && !GD.Story.metLois && GD.Time >= GD.Story.meetLoisTime - 3600 && GD.Time <= GD.Story.meetLoisTime + 7200;
         GD.setMode(4,param1,1);
         stopped = true;
      }
      
      private function doSmuggle(param1:*, param2:*) : *
      {
         GD.Towns[param1].illegalActions.push({
            "action":1,
            "amount":param2,
            "smugglingSkill":GD.Caravans[0].smugglingSkill
         });
         GD.Caravans[0].distributeExperience("smugglingSkill","smugglingExperience",param2);
      }
      
      private function sellToTown(param1:*, param2:*, param3:*) : *
      {
         var _loc5_:Item = new Item(param2,1);
         if(!_loc5_.divisible)
         {
            param3 = Math.floor(param3);
         }
         var _loc4_:* = GD.calculatePrice(param1,param2,param3,false);
         param1.money -= _loc4_;
         param1.playersMoney += _loc4_;
         param1.removeFromStock(param2,param3,param1.playersStorage);
         param1.addToStock(param2,param3);
         return _loc4_;
      }
      
      private function buyFromTown(param1:*, param2:*, param3:*) : *
      {
         var _loc5_:Item = new Item(param2,1);
         if(!_loc5_.divisible)
         {
            param3 = Math.floor(param3);
         }
         var _loc4_:* = GD.calculatePrice(param1,param2,param3,true);
         param1.money += _loc4_;
         param1.playersMoney -= _loc4_;
         param1.removeFromStock(param2,param3);
         param1.addToStock(param2,param3,param1.playersStorage);
      }
      
      private function distributeGoodsCategory(param1:*, param2:*, param3:* = true) : *
      {
         var _loc7_:* = undefined;
         var _loc11_:* = undefined;
         var _loc9_:* = undefined;
         var _loc8_:Array = [];
         for(_loc7_ in param2.stock)
         {
            if(param2.stock[_loc7_].itemData[param1])
            {
               _loc8_.push({
                  "item":param2.stock[_loc7_],
                  "price":GD.calculatePrice(param2,param2.stock[_loc7_].type,1,true),
                  "amount":param2.stock[_loc7_].amount
               });
            }
         }
         var _loc4_:* = 0;
         for(_loc7_ in _loc8_)
         {
            _loc8_[_loc7_].fromPerfect = _loc8_[_loc7_].price - GameData[param1 + "AveragePrice"] * param2.wealthFactor;
            if(_loc8_[_loc7_].fromPerfect > 0)
            {
               _loc8_[_loc7_].fromPerfect *= 5;
            }
            _loc8_[_loc7_].fromPerfect = Math.abs(_loc8_[_loc7_].fromPerfect);
            _loc4_ = Math.max(_loc4_,_loc8_[_loc7_].fromPerfect);
         }
         var _loc12_:Boolean = true;
         for(_loc7_ in _loc8_)
         {
            if(_loc8_[_loc7_].fromPerfect != _loc4_)
            {
               _loc12_ = false;
            }
            _loc8_[_loc7_].fromPerfect /= _loc4_;
         }
         if(_loc12_)
         {
            for(_loc7_ in _loc8_)
            {
               _loc8_[_loc7_].fromPerfect = 0;
            }
         }
         if(_loc8_.length == 0)
         {
            return;
         }
         var _loc6_:* = param2[param1 + "Consumption"];
         var _loc10_:Number = _loc6_ / _loc8_.length;
         if(param3)
         {
            _loc10_ = Math.min(Math.max(_loc10_,1),_loc6_);
         }
         var _loc5_:Number = _loc6_ * GameData[param1 + "AveragePrice"] * param2.wealthFactor * 1.1;
         while(_loc6_ > 0 && _loc8_.length > 0)
         {
            _loc11_ = false;
            _loc7_ = 0;
            while(_loc7_ < _loc8_.length)
            {
               if(_loc8_.length == 1)
               {
                  _loc9_ = _loc6_;
                  if(param3)
                  {
                     _loc9_ = Math.ceil(_loc9_);
                  }
               }
               else
               {
                  _loc9_ = _loc10_ * Math.random() * (1 - _loc8_[_loc7_].fromPerfect);
                  if(param3)
                  {
                     _loc9_ = Math.round(_loc9_);
                  }
               }
               _loc9_ = Math.min(_loc9_,_loc8_[_loc7_].amount);
               _loc9_ = Math.min(_loc9_,Math.floor(_loc5_ / _loc8_[_loc7_].price));
               if(_loc9_ > 0)
               {
                  param2.removeFromStock(_loc8_[_loc7_].item.type,_loc9_);
                  if(param2.historicalData.length > 0)
                  {
                     GameData.addItemToArray(param2.historicalData[0].consumption,{
                        "item":_loc8_[_loc7_].item.type,
                        "amount":_loc9_
                     });
                  }
                  _loc6_ -= _loc9_;
                  _loc8_[_loc7_].amount -= _loc9_;
                  _loc5_ -= _loc9_ * _loc8_[_loc7_].price;
               }
               if(_loc8_[_loc7_].amount <= 0 || _loc5_ < _loc8_[_loc7_].price)
               {
                  _loc8_.splice(_loc7_,1);
                  _loc7_--;
               }
               _loc7_++;
            }
            if(!_loc11_)
            {
               break;
            }
         }
      }
      
      public function storyOnDestroyed(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         var _loc3_:* = undefined;
         var _loc7_:* = undefined;
         _loc7_ = undefined;
         _loc7_ = undefined;
         _loc7_ = undefined;
         _loc7_ = undefined;
         if(param1.specialPurpose == 2)
         {
            GD.executeMajorEvent(38);
            if(!GD.Story.loisAttacksWithLintu)
            {
               _loc3_ = true;
            }
            else
            {
               _loc3_ = true;
               for(_loc6_ in GD.Caravans)
               {
                  if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 4)
                  {
                     _loc3_ = false;
                     break;
                  }
               }
            }
         }
         if(param1.specialPurpose == 4)
         {
            _loc3_ = true;
            for(_loc6_ in GD.Caravans)
            {
               if(GD.Caravans[_loc6_].active && (GD.Caravans[_loc6_].specialPurpose == 4 && GD.Caravans[_loc6_] != param1 || GD.Caravans[_loc6_].specialPurpose == 2))
               {
                  _loc3_ = false;
                  break;
               }
            }
            _loc2_ = true;
            for(_loc6_ in GD.Caravans)
            {
               if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 4 && GD.Caravans[_loc6_] != param1)
               {
                  _loc2_ = false;
                  break;
               }
            }
            if(!GD.Story.lintuReturned && _loc2_ && !GD.Story.lintuAreDestroyed)
            {
               GD.executeMajorEvent(13);
            }
         }
         if(param1.specialPurpose == 5)
         {
            _loc5_ = true;
            for(_loc6_ in GD.Caravans)
            {
               if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 5 && GD.Caravans[_loc6_] != param1)
               {
                  _loc5_ = false;
                  break;
               }
            }
            if(!GD.Story.kiviReturned && _loc5_ && !GD.Story.kiviAreDestroyed)
            {
               GD.executeMajorEvent(19);
            }
         }
         if(param1.specialPurpose == 4 || param1.specialPurpose == 2 || param1.specialPurpose == 5)
         {
            if((GD.Story.drekarStartedDefense || GD.Story.drekarAttackingLintu) && _loc3_)
            {
               for(_loc6_ in GD.Caravans)
               {
                  if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 3)
                  {
                     GD.directCaravanToTown(GD.Caravans[_loc6_],20);
                     GD.Caravans[_loc6_].guardPosition = null;
                     GD.Caravans[_loc6_].moving = true;
                  }
               }
               GD.Story.drekarStartedDefense = GD.Story.drekarAttackingLintu = false;
            }
         }
         if(param1.specialPurpose == 3)
         {
            _loc7_ = true;
            for(_loc6_ in GD.Caravans)
            {
               if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 3)
               {
                  _loc7_ = false;
                  break;
               }
            }
            if(_loc7_ && !GD.Story.drekarDefeated && !GD.Story.drekarReturned)
            {
               GD.executeMajorEvent(8);
            }
         }
         if(param1.specialPurpose == 6)
         {
            GD.executeMajorEvent(23);
         }
         if(param1.specialPurpose == 9 && !GD.Story.mikazeRebelsDefeted)
         {
            _loc7_ = true;
            for(_loc6_ in GD.Caravans)
            {
               if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 9)
               {
                  _loc7_ = false;
                  break;
               }
            }
            if(_loc7_)
            {
               if(GD.Story.laMissionInProgress == 3)
               {
                  GD.executeMajorEvent(63);
               }
               else
               {
                  GD.executeMajorEvent(45);
               }
            }
         }
         if(param1.specialPurpose == 13)
         {
            _loc7_ = true;
            for(_loc6_ in GD.Caravans)
            {
               if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 13)
               {
                  _loc7_ = false;
                  break;
               }
            }
            if(_loc7_ && !GD.Story.mikazePoliceDefeated)
            {
               GD.executeMajorEvent(64);
            }
         }
         if(param1.specialPurpose == 10 && !GD.Story.ozbetDefeated && !GD.Story.ozbetDefendersReturned)
         {
            _loc7_ = true;
            for(_loc6_ in GD.Caravans)
            {
               if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 10)
               {
                  _loc7_ = false;
                  break;
               }
            }
            if(_loc7_)
            {
               GD.executeMajorEvent(49);
            }
         }
         if(param1.specialPurpose == 11 && !GD.Story.janubiDefeated && !GD.Story.janubiTroopsReturned)
         {
            _loc7_ = true;
            for(_loc6_ in GD.Caravans)
            {
               if(GD.Caravans[_loc6_].active && GD.Caravans[_loc6_].specialPurpose == 11)
               {
                  _loc7_ = false;
                  break;
               }
            }
            if(_loc7_)
            {
               GD.executeMajorEvent(50);
            }
         }
         if(param1.specialPurpose == 12)
         {
            GD.Story.wfmMissionFailed = true;
         }
         if(param1.specialPurpose == 16)
         {
            GD.failQuest(36);
            GD.Story.dialogueDefaults[35] = 1960;
         }
         if(param1.specialPurpose == 17 || param1.specialPurpose == 18)
         {
            GD.executeMajorEvent(80);
         }
         if(param1.specialPurpose == 19)
         {
            openDialogue(45);
            GD.executeMajorEvent(97);
         }
         if(param1.specialPurpose == 20)
         {
            GD.executeMajorEvent(100);
         }
         if(param1.specialPurpose == 22)
         {
            openDialogue(46);
            GD.Story.qgMissionFailed = true;
         }
      }
      
      public function get musicFadeIn() : *
      {
         return _musicFadeIn;
      }
      
      public function set musicFadeIn(param1:*) : *
      {
         _musicFadeIn = param1;
         if(param1)
         {
            musicFadeOut = false;
         }
      }
      
      public function get musicFadeOut() : *
      {
         return _musicFadeOut;
      }
      
      public function set musicFadeOut(param1:*) : *
      {
         _musicFadeOut = param1;
         if(param1)
         {
            musicFadeIn = false;
         }
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         removeEventListener("enterFrame",enterFrame);
         removeEventListener("addedToStage",setFocus);
         removeEventListener("mouseMove",mMove);
         removeEventListener("mouseDown",click);
         removeEventListener("mouseUp",mUp);
         removeEventListener("mouseLeave",mOut);
         removeEventListener("doubleClick",dblClk);
         if(stage)
         {
            stage.removeEventListener("keyDown",keyPressed);
         }
         for(_loc1_ in flippers)
         {
            while(flippers[_loc1_].numChildren > 0)
            {
               flippers[_loc1_].removeChildAt(0);
            }
            flippers[_loc1_] = null;
         }
         for(_loc1_ in GD.Caravans)
         {
            if(GD.Caravans[_loc1_].mapSymbol is Sprite)
            {
               if(mapSymbols.contains(GD.Caravans[_loc1_].mapSymbol))
               {
                  mapSymbols.removeChild(GD.Caravans[_loc1_].mapSymbol);
               }
               GD.Caravans[_loc1_].mapSymbolParent = null;
            }
         }
         for(_loc1_ in counters)
         {
            counters[_loc1_].remove();
            counters[_loc1_] = null;
         }
         for(_loc1_ in switches)
         {
         }
         optionsMenu.remove();
         optionsMenu = null;
         screen.buttonMode = false;
         GD = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         while(screen.numChildren > 0)
         {
            screen.removeChildAt(0);
         }
         screen = null;
      }
   }
}

