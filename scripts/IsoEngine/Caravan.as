package IsoEngine
{
   import Data.Presets;
   import Data.Texts;
   import flash.display.*;
   
   public class Caravan
   {
      
      public static const skillsList:* = [{
         "name":932,
         "varName":"doctorSkill",
         "multiplier":1
      },{
         "name":933,
         "varName":"veterinarySkill",
         "multiplier":1
      },{
         "name":934,
         "varName":"mechanicSkill",
         "multiplier":1
      },{
         "name":935,
         "varName":"huntingSkill",
         "multiplier":1
      },{
         "name":936,
         "varName":"collectingSkill",
         "multiplier":1
      },{
         "name":937,
         "varName":"sight",
         "multiplier":100
      },{
         "name":938,
         "varName":"smugglingSkill",
         "multiplier":1
      }];
      
      public static const variablesToSave:* = ["direction","moving","x","y","active","category","type","aggressive","name","identified","menCountPhase","slavers","money","cycleCounter","collectForage","hunt","milk","shear","autoFillLubricant","autoFillWater","groupSettings","liquidsContainers","zoneForageDevastation","zonePreyDevastation","historicalData","recentlyInteractedTowns","nowGoingToTown","specialPurpose","guardPosition","looseGuard","fearless","deflected","cannibal","route","routePoint","lastConsumption","chargingBatteries","keepDistance","concentrated"];
      
      public var direction:* = 0;
      
      public var moving:* = true;
      
      public var x:* = 0;
      
      public var y:* = 0;
      
      public var active:* = true;
      
      public var category:*;
      
      public var type:*;
      
      public var aggressive:*;
      
      public var concentrated:* = false;
      
      public var name:*;
      
      public var identified:* = false;
      
      public var menCountPhase:* = 0;
      
      public var slavers:*;
      
      public var People:*;
      
      public var Cargo:*;
      
      public var Transport:*;
      
      public var money:* = 0;
      
      public var cycleCounter:*;
      
      public var collectForage:* = false;
      
      public var hunt:* = true;
      
      public var milk:* = true;
      
      public var shear:* = true;
      
      public var autoFillLubricant:* = true;
      
      public var autoFillWater:* = true;
      
      public var groupSettings:*;
      
      public var liquidsContainers:*;
      
      public var zoneForageDevastation:* = 0;
      
      public var zonePreyDevastation:* = 0;
      
      public var route:*;
      
      public var routePoint:* = 0;
      
      public var lastConsumption:*;
      
      public var chargingBatteries:*;
      
      public var historicalData:*;
      
      public var nowGoingToTown:* = null;
      
      public var originalDirection:*;
      
      public var specialPurpose:*;
      
      public var guardPosition:*;
      
      public var looseGuard:* = false;
      
      public var fearless:*;
      
      public var deflected:* = false;
      
      public var cannibal:*;
      
      public var keepDistance:* = false;
      
      public var randomPointer:* = null;
      
      public var fixedPeopleNum:* = null;
      
      public var squareX:*;
      
      public var squareY:*;
      
      public var prevSquareX:*;
      
      public var prevSquareY:*;
      
      public var distanceMultiplier:* = 1;
      
      public var inNearby:*;
      
      public var mapSymbol:*;
      
      public var mapSymbolRotatingPart:*;
      
      public var mapSymbolText1:*;
      
      public var mapSymbolText2:*;
      
      public var mapSymbolParent:*;
      
      public var nearbyCaravans:*;
      
      public var nearbyTowns:*;
      
      public var lastFlicker:* = 100000000000000000000;
      
      public var prevDir:* = 0;
      
      public var staticMode:* = false;
      
      public var overTown:*;
      
      public var moveX:*;
      
      public var moveY:*;
      
      public var stepsLeft:*;
      
      public var staticModeSpeed:*;
      
      public var staticModeSight:*;
      
      public var staticModeNoticeability:*;
      
      public var staticModeMorale:*;
      
      public var staticModeWater:*;
      
      public var staticModeFood:*;
      
      public var staticModeForage:*;
      
      public var staticModeMeds:*;
      
      public var staticModeVisualWarPower:*;
      
      public var staticModeActualWarPower:*;
      
      public var staticModeDoctorSkill:*;
      
      public var staticModeVeterinarySkill:*;
      
      public var staticModeMechanicSkill:*;
      
      public var staticModeHuntingSkill:*;
      
      public var staticModeCollectingSkill:*;
      
      public var staticModeSmugglingSkill:*;
      
      public var staticModeTotalCargo:*;
      
      public var staticModeMaxCargo:*;
      
      public var staticModeFighters:*;
      
      public var staticModeElectricOverload:*;
      
      public var staticModeHasWindPowered:*;
      
      public var staticModeMinWindPoweredSpeed:*;
      
      public var needsUpdate:* = false;
      
      public var recentlyInteractedCaravans:*;
      
      public var recentlyInteractedTowns:*;
      
      public var GD:*;
      
      public var staticModeAllWindPowered:*;
      
      public function Caravan(paramType:* = 0, param2:* = null, param3:* = null)
      {
         //type 5 = main?
         var _loc11_:* = undefined;
         var _loc10_:* = undefined;
         var _loc8_:* = undefined;
         var _loc7_:* = undefined;
         var _loc4_:* = undefined;
         var _loc9_:* = undefined;
         var _loc5_:* = undefined;
         chargingBatteries = [];
         recentlyInteractedCaravans = [];
         recentlyInteractedTowns = [];
         super();
         if(param3 == null)
         {
            GD = GameData.currentGame;
         }
         else
         {
            GD = param3;
         }
         lastConsumption = GD.Time;
         People = [];
         Cargo = [];
         Transport = [];
         historicalData = [];
         cycleCounter = MathFunctions.random(0,360 - 1);
         groupSettings = [];
         liquidsContainers = {};
         groupSettings[1] = {
            "sameAsAnother":false,
            "anotherGroup":2
         };
         _loc10_ = 2;
         while(_loc10_ <= 3)
         {
            groupSettings[_loc10_] = {
               "sameAsAnother":true,
               "anotherGroup":1
            };
            _loc10_++;
         }
         groupSettings[4] = {
            "sameAsAnother":true,
            "anotherGroup":3
         };
         _loc10_ = 5;
         while(_loc10_ <= 6)
         {
            groupSettings[_loc10_] = {
               "sameAsAnother":true,
               "anotherGroup":1
            };
            _loc10_++;
         }
         _loc10_ = 7;
         while(_loc10_ <= 10)
         {
            groupSettings[_loc10_] = {
               "sameAsAnother":true,
               "anotherGroup":6
            };
            _loc10_++;
         }
         var _loc6_:int = 0;
         for(_loc10_ in groupSettings)
         {
            groupSettings[_loc10_].medicineUse = [];
            groupSettings[_loc10_].medicineUse[0] = 0;
            _loc11_ = 1;
            while(_loc11_ <= 4)
            {
               groupSettings[_loc10_].medicineUse[_loc11_] = _loc11_ - 1;
               _loc11_++;
            }
            groupSettings[_loc10_].foodRations = 100;
            groupSettings[_loc10_].waterRations = 100;
            groupSettings[_loc10_].foodstuffs = [];
            for(_loc11_ in Item.Goods)
            {
               if(Item.Goods[_loc11_] is Object && Item.Goods[_loc11_].food)
               {
                  groupSettings[_loc10_].foodstuffs[_loc11_] = 10;
               }
            }
         }
         type = paramType;
         aggressive = Presets.CaravanTypes[type].aggressive;
         name = Texts.fetch(Presets.CaravanTypes[type].name);
         slavers = Presets.CaravanTypes[type].slavers;
         if(paramType != 0)
         {
            mapSymbol = new Sprite();
            mapSymbolRotatingPart = new Sprite();
            mapSymbolRotatingPart.graphics.lineStyle(3,0,0.3);
            _loc5_ = 9;
            _loc10_ = 0.5;
            while(_loc10_ <= 5.783185307179586)
            {
               if(_loc10_ == 0.5)
               {
                  mapSymbolRotatingPart.graphics.moveTo(Math.sin(_loc10_) * _loc5_,0 - Math.cos(_loc10_) * _loc5_);
               }
               else
               {
                  mapSymbolRotatingPart.graphics.lineTo(Math.sin(_loc10_) * _loc5_,0 - Math.cos(_loc10_) * _loc5_);
               }
               _loc10_ += 0.1;
            }
            mapSymbolRotatingPart.graphics.moveTo(0,0);
            mapSymbolRotatingPart.graphics.lineTo(0,0 - _loc5_ * 1.5);
            mapSymbol.addChild(mapSymbolRotatingPart);
            mapSymbol.visible = false;
            mapSymbolText1 = new EngineText("",4473408,10,"center",-100,12,200,15);
            mapSymbolText2 = new EngineText("",4473408,8,"center",-100,22,200,15);
            mapSymbol.addChild(mapSymbolText1);
            mapSymbol.addChild(mapSymbolText2);
            if(param2 != null)
            {
               param2.addChild(mapSymbol);
               mapSymbolParent = param2;
            }
         }
      }
      
      public function devicesWorking(param1:*) : *
      {
         var _loc6_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:Item = new Item(param1,1);
         if(_loc5_.electricityConsumption > 0 && electricOverload)
         {
            return 0;
         }
         _loc2_ = false;
         for(_loc4_ in _loc5_.consumption)
         {
            _loc3_ = false;
            for(_loc6_ in Cargo)
            {
               if(Cargo[_loc6_].type == _loc5_.consumption[_loc4_].item)
               {
                  _loc3_ = true;
                  break;
               }
            }
            if(!_loc3_)
            {
               _loc2_ = true;
               break;
            }
         }
         if(_loc2_)
         {
            return 0;
         }
         for(_loc4_ in Cargo)
         {
            if(Cargo[_loc4_].type == param1)
            {
               return Cargo[_loc4_].inUse;
            }
         }
      }
      
      public function get electricOverload() : *
      {
         if(staticMode)
         {
            return staticModeElectricOverload;
         }
         var _loc1_:* = getConsumptionProduction();
         return _loc1_.electricityConsumption > _loc1_.electricityProduction;
      }
      
      public function get noticeability() : *
      {
         var _loc2_:* = undefined;
         if(staticMode)
         {
            if(moving)
            {
               return staticModeNoticeability;
            }
            return staticModeNoticeability / 2;
         }
         var _loc1_:* = 100;
         _loc1_ += totalCargo;
         for(_loc2_ in People)
         {
            _loc1_ += People[_loc2_].noticeability;
         }
         for(_loc2_ in Transport)
         {
            _loc1_ += Transport[_loc2_].noticeability;
         }
         _loc1_ = Math.pow(_loc1_,0.33) * 20;
         if(!moving)
         {
            _loc1_ /= 2;
         }
         return _loc1_;
      }
      
      public function findCargo(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = 100000000000000000000;
         _loc3_ = 0;
         while(_loc3_ < Cargo.length)
         {
            if(Cargo[_loc3_].type == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != 100000000000000000000)
         {
            return Cargo[_loc2_];
         }
         return false;
      }
      
      public function get morale() : *
      {
         var _loc2_:* = undefined;
         if(staticMode)
         {
            return staticModeMorale;
         }
         var _loc3_:* = 0;
         var _loc1_:* = 0;
         for(_loc2_ in People)
         {
            if(People[_loc2_].category == 1 || People[_loc2_].category == 2)
            {
               _loc3_ += People[_loc2_].morale;
               _loc1_++;
            }
         }
         return _loc3_ / _loc1_;
      }
      
      public function addLiquidsContainer(param1:*, param2:*, param3:*) : *
      {
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         if(param2 <= 0)
         {
            return false;
         }
         if(liquidsContainers[param3] is Array)
         {
            _loc5_ = null;
            for(_loc4_ in liquidsContainers[param3])
            {
               if(liquidsContainers[param3][_loc4_].type == param1)
               {
                  _loc5_ = _loc4_;
                  break;
               }
            }
            if(_loc5_ == null)
            {
               liquidsContainers[param3].push({
                  "type":param1,
                  "amount":param2
               });
            }
            else
            {
               liquidsContainers[param3][_loc4_].amount += param2;
            }
         }
         else
         {
            liquidsContainers[param3] = [{
               "type":param1,
               "amount":param2
            }];
         }
      }
      
      public function reduceLiquidsContainers(param1:*, param2:*) : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:Array = [];
         _loc6_[0] = liquidsContainers[-1];
         _loc6_[1] = liquidsContainers[0];
         for(_loc4_ in liquidsContainers)
         {
            if(_loc4_ != -1 && _loc4_ != 0 && liquidsContainers[_loc4_] is Array)
            {
               _loc6_.push(liquidsContainers[_loc4_]);
            }
         }
         _loc4_ = 0;
         while(_loc4_ < _loc6_.length)
         {
            if(_loc6_[_loc4_] is Array)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc6_[_loc4_].length)
               {
                  if(_loc6_[_loc4_][_loc5_].type == param1)
                  {
                     _loc3_ = Math.min(_loc6_[_loc4_][_loc5_].amount,param2);
                     param2 -= _loc3_;
                     _loc6_[_loc4_][_loc5_].amount -= _loc3_;
                     if(_loc4_ != 0 && _loc6_[_loc4_][_loc5_].amount <= 0)
                     {
                        _loc6_[_loc4_].splice(_loc5_,1);
                        _loc5_--;
                     }
                     if(param2 <= 0)
                     {
                        break;
                     }
                  }
                  if(param2 <= 0)
                  {
                     break;
                  }
                  _loc5_++;
               }
            }
            _loc4_++;
         }
      }
      
      public function maxLiquidAmountBeforeDistribution(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = 0;
         var _loc5_:* = 0;
         if(liquidsContainers[param1] is Array)
         {
            for(_loc4_ in liquidsContainers[param1])
            {
               _loc2_ += Item.getDataFromType(liquidsContainers[param1][_loc4_].type).volume * liquidsContainers[param1][_loc4_].amount;
            }
         }
         if(param1 == 64)
         {
            for(_loc4_ in Transport)
            {
               if(Transport[_loc4_].category == 3)
               {
                  _loc2_ += Transport[_loc4_].fuelTank;
               }
            }
         }
         var _loc3_:* = findCargo(param1);
         if(_loc3_ != false)
         {
            _loc5_ = _loc3_.amount;
         }
         return _loc2_ - _loc5_;
      }
      
      public function maxLiquidAmount(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = 0;
         var _loc3_:* = maxLiquidAmountBeforeDistribution(param1);
         _loc2_ = 0;
         if(liquidsContainers[0] is Array)
         {
            for(_loc4_ in liquidsContainers[0])
            {
               _loc2_ += Item.getDataFromType(liquidsContainers[0][_loc4_].type).volume * liquidsContainers[0][_loc4_].amount;
            }
         }
         return _loc2_ + _loc3_;
      }
      
      public function distributeLiquidsContainers(param1:* = false) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in Cargo)
         {
            if(Cargo[_loc2_].itemData.liquid)
            {
               arrangeLiquidsContainers(Cargo[_loc2_].type,param1);
            }
         }
      }
      
      public function arrangeLiquidsContainers(param1:*, param2:* = false) : *
      {
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         var _loc10_:* = undefined;
         var _loc8_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = maxLiquidAmountBeforeDistribution(param1);
         var _loc9_:Array = [];
         _loc11_ = 0 - _loc3_;
         if(_loc3_ < 0 && liquidsContainers[0] is Array && liquidsContainers[0].length > 0)
         {
            _loc5_ = 0 - _loc3_;
            for(_loc6_ in liquidsContainers[0])
            {
               _loc9_[_loc6_] = {
                  "type":liquidsContainers[0][_loc6_].type,
                  "amount":liquidsContainers[0][_loc6_].amount,
                  "volume":Item.getDataFromType(liquidsContainers[0][_loc6_].type).volume
               };
            }
            for(_loc6_ in _loc9_)
            {
               _loc9_[_loc6_].volumeToWeight = _loc9_[_loc6_].volume / Item.getDataFromType(_loc9_[_loc6_].type).weight;
            }
            while(_loc5_ > 0 && _loc9_.length > 0)
            {
               _loc8_ = null;
               _loc10_ = -100000000000000000000;
               for(_loc6_ in _loc9_)
               {
                  _loc12_ = _loc9_[_loc6_].volumeToWeight / 10 - Math.abs(_loc9_[_loc6_].volume - _loc5_);
                  if(_loc12_ > _loc10_)
                  {
                     _loc10_ = _loc12_;
                     _loc8_ = _loc6_;
                  }
               }
               if(_loc8_ != null)
               {
                  moveLiquidsContainer(_loc9_[_loc8_].type,1,0,param1);
                  _loc5_ -= _loc9_[_loc8_].volume;
                  _loc9_[_loc8_].amount--;
                  if(_loc9_[_loc8_].amount <= 0)
                  {
                     _loc9_.splice(_loc8_,1);
                  }
               }
            }
            _loc11_ = _loc5_;
         }
         if(param2 && _loc11_ > 0)
         {
            reduceCargo(param1,_loc11_);
            return;
         }
         if(_loc3_ > 0)
         {
            _loc5_ = _loc3_;
            for(_loc6_ in liquidsContainers[param1])
            {
               _loc4_ = Item.getDataFromType(liquidsContainers[param1][_loc6_].type).volume;
               if(_loc4_ <= _loc5_)
               {
                  _loc9_.push({
                     "type":liquidsContainers[param1][_loc6_].type,
                     "amount":liquidsContainers[param1][_loc6_].amount,
                     "volume":_loc4_
                  });
               }
            }
            while(_loc9_.length > 0)
            {
               for(_loc6_ in _loc9_)
               {
                  if(_loc9_[_loc6_].volume > _loc5_)
                  {
                     _loc9_.splice(_loc6_,1);
                     _loc6_--;
                  }
                  else
                  {
                     _loc9_[_loc6_].score = Item.getDataFromType(_loc9_[_loc6_].type).weight / _loc9_[_loc6_].volume * 100 - (_loc5_ - _loc9_[_loc6_].volume) * 5;
                  }
               }
               if(_loc9_.length > 0)
               {
                  _loc10_ = -100000000000000000000;
                  _loc8_ = null;
                  for(_loc6_ in _loc9_)
                  {
                     if(_loc9_[_loc6_].score > _loc10_)
                     {
                        _loc10_ = _loc9_[_loc6_].score;
                        _loc8_ = _loc6_;
                     }
                  }
                  if(_loc8_ != null)
                  {
                     moveLiquidsContainer(_loc9_[_loc8_].type,1,param1,0);
                     _loc5_ -= _loc9_[_loc8_].volume;
                     _loc9_[_loc8_].amount--;
                     if(_loc9_[_loc8_].amount <= 0)
                     {
                        _loc9_.splice(_loc8_,1);
                     }
                  }
               }
            }
         }
      }
      
      public function moveLiquidsContainer(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         if(liquidsContainers[param3] is Array)
         {
            for(_loc6_ in liquidsContainers[param3])
            {
               if(liquidsContainers[param3][_loc6_].type == param1)
               {
                  _loc5_ = Math.min(liquidsContainers[param3][_loc6_].amount,param2);
                  addLiquidsContainer(param1,_loc5_,param4);
                  liquidsContainers[param3][_loc6_].amount -= _loc5_;
                  if(liquidsContainers[param3][_loc6_].amount <= 0)
                  {
                     liquidsContainers[param3].splice(_loc6_,1);
                  }
                  if(param3 <= 0 || param4 <= 0)
                  {
                     for(_loc7_ in Cargo)
                     {
                        if(Cargo[_loc7_].type == param1)
                        {
                           if(param3 <= 0 && param4 > 0)
                           {
                              Cargo[_loc7_].inUse += _loc5_;
                           }
                           if(param3 > 0 && param4 <= 0)
                           {
                              Cargo[_loc7_].inUse -= _loc5_;
                           }
                        }
                     }
                  }
                  break;
               }
            }
         }
      }
      
      public function get faction() : *
      {
         return Presets.CaravanTypes[type].faction;
      }
      
      public function addCargo(param1:*, param2:*, param3:* = false, param4:* = false) : *
      {
         var _loc9_:* = undefined;
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc8_:* = undefined;
         var _loc6_:* = undefined;
         if(param2 <= 0)
         {
            return;
         }
         if(param2 > 0)
         {
            _loc5_ = findCargo(param1);
            _loc8_ = Item.getDataFromType(param1);
            if(_loc8_.liquidsContainer)
            {
               _loc7_ = false;
               if(liquidsContainers[-1] is Array)
               {
                  for(_loc9_ in liquidsContainers[-1])
                  {
                     if(liquidsContainers[-1][_loc9_].type == param1)
                     {
                        _loc7_ = true;
                        break;
                     }
                  }
               }
               if(_loc7_)
               {
                  addLiquidsContainer(param1,param2,-1);
               }
               else
               {
                  addLiquidsContainer(param1,param2,0);
               }
            }
            if(_loc8_.liquid && !param4)
            {
               param2 = Math.min(param2,maxLiquidAmount(param1));
            }
            if(param2 > 0)
            {
               if(_loc5_ === false)
               {
                  Cargo.push(new Item(param1,param2));
                  _loc6_ = Cargo[Cargo.length - 1];
                  if(param3)
                  {
                     _loc6_.inUse += param2;
                  }
               }
               else
               {
                  _loc6_ = _loc5_;
                  _loc5_._amount += param2;
                  if(param3)
                  {
                     _loc5_.inUse += param2;
                  }
               }
               if(_loc8_.liquid)
               {
                  arrangeLiquidsContainers(param1);
               }
               if(_loc8_.device && !param3)
               {
                  _loc6_.inUse += param2;
               }
            }
         }
      }
      
      public function reduceCargo(param1:*, param2:*, param3:* = false) : *
      {
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         if(param2 <= 0)
         {
            return;
         }
         _loc5_ = 0;
         while(_loc5_ < Cargo.length)
         {
            if(Cargo[_loc5_].type == param1 && Cargo[_loc5_].amount > 0)
            {
               Cargo[_loc5_]._amount -= param2;
               _loc4_ = Cargo[_loc5_].itemData.liquid;
               _loc6_ = Cargo[_loc5_].itemData.liquidsContainer;
               if(param3)
               {
                  Cargo[_loc5_].inUse -= param2;
               }
               if(Cargo[_loc5_].inUse > Cargo[_loc5_].amount)
               {
                  Cargo[_loc5_].inUse = Cargo[_loc5_].amount;
               }
               if(Cargo[_loc5_]._amount < 0.05)
               {
                  Cargo.splice(_loc5_,1);
                  _loc5_--;
               }
               if(_loc4_)
               {
                  arrangeLiquidsContainers(param1);
               }
               if(_loc6_)
               {
                  reduceLiquidsContainers(param1,param2);
               }
               break;
            }
            _loc5_++;
         }
      }
      
      public function getConsumptionProduction(param1:* = false) : *
      {
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc11_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc10_:* = undefined;
         var _loc5_:* = undefined;
         var _loc16_:* = undefined;
         var _loc6_:* = undefined;
         var _loc14_:* = 0;
         var _loc12_:* = 0;
         var _loc2_:Array = [];
         for(_loc7_ in Cargo)
         {
            if(Cargo[_loc7_].inUse > 0 && (Cargo[_loc7_].consumption.length > 0 || Cargo[_loc7_].production.length > 0 || Cargo[_loc7_].electricityProduction > 0 || Cargo[_loc7_].electricityConsumption > 0))
            {
               _loc4_ = false;
               for(_loc8_ in Cargo[_loc7_].consumption)
               {
                  _loc11_ = false;
                  for(_loc9_ in Cargo)
                  {
                     if(Cargo[_loc9_].type == Cargo[_loc7_].consumption[_loc8_].item && Cargo[_loc9_].amount > 0)
                     {
                        _loc11_ = true;
                        break;
                     }
                  }
                  if(!_loc11_)
                  {
                     _loc4_ = true;
                     break;
                  }
               }
               if(!_loc4_)
               {
                  if(Cargo[_loc7_].electricityProduction > 0)
                  {
                     _loc14_ += Cargo[_loc7_].electricityProduction * Cargo[_loc7_].inUse;
                  }
                  if(Cargo[_loc7_].electricityConsumption > 0)
                  {
                     _loc12_ += Cargo[_loc7_].electricityConsumption * Cargo[_loc7_].inUse;
                  }
                  _loc2_.push(Cargo[_loc7_]);
               }
            }
         }
         var _loc3_:Object = {};
         _loc3_.electricityProduction = _loc14_;
         _loc3_.electricityConsumption = _loc12_;
         if(param1)
         {
            return _loc3_;
         }
         if(_loc12_ > _loc14_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc2_.length)
            {
               if(_loc2_[_loc7_].electricityConsumption > 0)
               {
                  _loc2_.splice(_loc7_,1);
                  _loc7_--;
               }
               _loc7_++;
            }
         }
         _loc3_.production = [];
         _loc3_.consumption = [];
         for(_loc7_ in _loc2_)
         {
            for(_loc8_ in _loc2_[_loc7_].production)
            {
               GameData.addItemToArray(_loc3_.production,{
                  "item":_loc2_[_loc7_].production[_loc8_].item,
                  "amount":_loc2_[_loc7_].production[_loc8_].amount * _loc2_[_loc7_].inUse
               });
            }
            for(_loc8_ in _loc2_[_loc7_].consumption)
            {
               GameData.addItemToArray(_loc3_.consumption,{
                  "item":_loc2_[_loc7_].consumption[_loc8_].item,
                  "amount":_loc2_[_loc7_].consumption[_loc8_].amount * _loc2_[_loc7_].inUse
               });
            }
         }
         _loc3_.foodConsumption = 0;
         _loc3_.fuelPer100Km = 0;
         for(_loc7_ in Transport)
         {
            for(_loc8_ in Transport[_loc7_].consumption)
            {
               _loc5_ = Transport[_loc7_].consumption[_loc8_].amount;
               if(Transport[_loc7_].consumption[_loc8_].item == TransportUnit.Types[Transport[_loc7_].type].milk.item && !milk)
               {
                  if(Transport[_loc7_].mother is TransportUnit)
                  {
                     for(_loc9_ in Transport)
                     {
                        if(Transport[_loc9_] == Transport[_loc7_].mother)
                        {
                           for(_loc10_ in Transport[_loc9_].production)
                           {
                              if(Transport[_loc9_].production[_loc10_].item == TransportUnit.Types[Transport[_loc7_].type].milk.item)
                              {
                                 _loc5_ -= Transport[_loc9_].production[_loc10_].amount;
                                 _loc5_ = Math.max(_loc5_,0);
                              }
                           }
                           break;
                        }
                     }
                  }
               }
               if(_loc5_ > 0)
               {
                  if(Item.getDataFromType(Transport[_loc7_].consumption[_loc8_].item).food)
                  {
                     _loc3_.foodConsumption += Item.getDataFromType(Transport[_loc7_].consumption[_loc8_].item).calories * _loc5_;
                  }
                  GameData.addItemToArray(_loc3_.consumption,{
                     "item":Transport[_loc7_].consumption[_loc8_].item,
                     "amount":_loc5_
                  });
               }
            }
            for(_loc8_ in Transport[_loc7_].production)
            {
               if(Transport[_loc7_].production[_loc8_].item != TransportUnit.Types[Transport[_loc7_].type].milk.item || milk)
               {
                  GameData.addItemToArray(_loc3_.production,Transport[_loc7_].production[_loc8_]);
               }
            }
            if(Transport[_loc7_].category == 3 && !(Transport[_loc7_].passengerIn is TransportUnit))
            {
               _loc3_.fuelPer100Km += Transport[_loc7_].fuelConsumption;
            }
         }
         var _loc15_:* = 0;
         for(_loc7_ in People)
         {
            _loc16_ = getSettingsGroup(People[_loc7_].category);
            _loc3_.foodConsumption += People[_loc7_].GDA * groupSettings[_loc16_].foodRations / 100;
            _loc15_ += People[_loc7_].waterConsumption * groupSettings[_loc16_].waterRations / 100;
         }
         var _loc13_:* = totalMedicineConsumption();
         GameData.addItemToArray(_loc3_.consumption,{
            "item":1,
            "amount":_loc15_
         });
         GameData.addItemToArray(_loc3_.consumption,{
            "item":63,
            "amount":_loc13_
         });
         _loc3_.foodProduction = 0;
         _loc3_.waterInFood = 0;
         for(_loc7_ in _loc3_.production)
         {
            _loc6_ = Item.getDataFromType(_loc3_.production[_loc7_].item);
            if(_loc6_.food)
            {
               _loc3_.foodProduction += _loc3_.production[_loc7_].amount * _loc6_.calories;
               _loc3_.waterInFood += _loc3_.production[_loc7_].amount * _loc6_.waterPercentage * _loc6_.weight;
            }
         }
         return _loc3_;
      }
      
      public function addPerson(param1:*) : *
      {
         if(category == 0)
         {
            param1.wasInPlayersCaravan = true;
         }
         var _loc2_:Number = People.push(param1) - 1;
         param1.caravan = this;
         return _loc2_;
      }
      
      public function removePerson(param1:*, param2:* = false) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         if(param1 is Number)
         {
            _loc5_ = param1;
         }
         if(param1 is Character)
         {
            for(_loc3_ in People)
            {
               if(People[_loc3_] == param1)
               {
                  _loc5_ = _loc3_;
                  break;
               }
            }
         }
         if(_loc5_ != null)
         {
            if(param2)
            {
               for(_loc3_ in People[_loc5_].equipment)
               {
                  reduceCargo(People[_loc5_].equipment[_loc3_].type,People[_loc5_].equipment[_loc3_].amount,true);
               }
            }
            else
            {
               removeEquipment(People[_loc5_]);
            }
            if(People[_loc5_].passengerIn is TransportUnit)
            {
               for(_loc3_ in People[_loc5_].passengerIn.Passengers)
               {
                  if(People[_loc5_].passengerIn.Passengers[_loc3_] == People[_loc5_])
                  {
                     People[_loc5_].passengerIn.Passengers.splice(_loc3_,1);
                     break;
                  }
               }
            }
            People[_loc5_].passengerIn = null;
            People.splice(_loc5_,1);
         }
      }
      
      public function removeEquipment(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc2_ in param1.equipment)
         {
            for(_loc3_ in Cargo)
            {
               if(Cargo[_loc3_].type == param1.equipment[_loc2_].type)
               {
                  Cargo[_loc3_].inUse -= param1.equipment[_loc2_].amount;
                  break;
               }
            }
         }
         param1.equipment = [];
         param1.weapons = [0,0];
         param1.grenadeAmounts = [0,0];
         param1.Jacket = 0;
         param1.Headgear = 0;
         param1.attachments = [[],[]];
      }
      
      public function get water() : *
      {
         if(staticMode)
         {
            return staticModeWater;
         }
         var _loc1_:* = findCargo(1);
         if(_loc1_ == false)
         {
            return 0;
         }
         return _loc1_.amount;
      }
      
      public function get food() : *
      {
         var _loc2_:* = undefined;
         if(staticMode)
         {
            return staticModeFood;
         }
         var _loc1_:* = 0;
         for(_loc2_ in Cargo)
         {
            if(Cargo[_loc2_].category == 1 && (Item.Goods[Cargo[_loc2_].subCategory].food || Cargo[_loc2_].type == 174 && cannibal))
            {
               _loc1_ += Cargo[_loc2_].amount * Item.Goods[Cargo[_loc2_].subCategory].calories;
            }
         }
         return _loc1_;
      }
      
      public function get forage() : *
      {
         if(staticMode)
         {
            return staticModeForage;
         }
         var _loc1_:* = findCargo(62);
         if(_loc1_ == false)
         {
            return 0;
         }
         return _loc1_.amount;
      }
      
      public function get meds() : *
      {
         if(staticMode)
         {
            return staticModeMeds;
         }
         var _loc1_:* = findCargo(63);
         if(_loc1_ == false)
         {
            return 0;
         }
         return _loc1_.amount;
      }
      
      public function get fuel() : *
      {
         var _loc1_:* = findCargo(64);
         if(_loc1_ == false)
         {
            return 0;
         }
         return _loc1_.amount;
      }
      
      public function get electricity() : *
      {
         return 1;
      }
      
      public function get sight() : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(staticMode)
         {
            return staticModeSight;
         }
         var _loc1_:* = -100000000000000000000;
         var _loc4_:* = 1;
         for(_loc3_ in People)
         {
            _loc2_ = People[_loc3_].sight;
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         for(_loc3_ in Cargo)
         {
            if(Cargo[_loc3_].itemData.sightAmplifier && Cargo[_loc3_].itemData.amplification > _loc4_ && (!Cargo[_loc3_].itemData.device || devicesWorking(Cargo[_loc3_].type) > 0))
            {
               _loc4_ = Cargo[_loc3_].itemData.amplification;
            }
         }
         return _loc1_ * _loc4_ / 100;
      }
      
      public function get visualWarPower() : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(staticMode)
         {
            return staticModeVisualWarPower;
         }
         var _loc1_:* = 0;
         for(_loc3_ in People)
         {
            if(People[_loc3_].category < 3 || People[_loc3_].category == 5)
            {
               _loc1_ += 100;
               for(_loc4_ in People[_loc3_].weapons)
               {
                  if(People[_loc3_].weapons[_loc4_] > 0)
                  {
                     _loc2_ = 1;
                     if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc3_].weapons[_loc4_]].type].category == 5)
                     {
                        _loc2_ = 5;
                     }
                     _loc1_ += Math.sqrt(WeaponsData.Weapons[People[_loc3_].weapons[_loc4_]].price * _loc2_ / (_loc4_ + 1));
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function get actualWarPower() : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(staticMode)
         {
            return staticModeActualWarPower;
         }
         var _loc1_:* = 0;
         _loc1_ = visualWarPower;
         for(_loc3_ in People)
         {
            if(People[_loc3_].category < 3 || People[_loc3_].category == 5)
            {
               _loc1_ += 100;
               _loc1_ += People[_loc3_].physical;
               _loc1_ += People[_loc3_].accuracy;
               _loc1_ += People[_loc3_].maxAP;
               _loc1_ += Math.pow(People[_loc3_].generalBattleExperience,0.5);
               for(_loc4_ in People[_loc3_].weapons)
               {
                  if(People[_loc3_].weapons[_loc4_] > 0)
                  {
                     _loc2_ = 1;
                     if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc3_].weapons[_loc4_]].type].category == 5)
                     {
                        _loc2_ = 5;
                     }
                     _loc1_ += Math.sqrt(WeaponsData.Weapons[People[_loc3_].weapons[_loc4_]].price * _loc2_ / (_loc4_ + 1));
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function get allWindPowered() : *
      {
         var _loc1_:* = undefined;
         if(staticMode)
         {
            return staticModeAllWindPowered;
         }
         for(_loc1_ in People)
         {
            if(!(People[_loc1_].passengerIn is TransportUnit))
            {
               return false;
            }
         }
         for(_loc1_ in Transport)
         {
            if(!(Transport[_loc1_].passengerIn is TransportUnit) && !Transport[_loc1_].windPowered)
            {
               return false;
            }
         }
         return true;
      }
      
      public function get speedWithoutWindPowered() : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc7_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         if(staticMode)
         {
            return staticModeSpeed;
         }
         var _loc1_:* = 100000000000000000000;
         for(_loc5_ in People)
         {
            if(!(People[_loc5_].passengerIn is TransportUnit) && People[_loc5_].speed < _loc1_)
            {
               _loc1_ = People[_loc5_].speed;
            }
         }
         for(_loc5_ in Transport)
         {
            if(!(Transport[_loc5_].passengerIn is TransportUnit) && !Transport[_loc5_].windPowered && Transport[_loc5_].speed < _loc1_)
            {
               _loc1_ = Transport[_loc5_].speed;
            }
         }
         if(_loc1_ == 100000000000000000000)
         {
            _loc1_ = 0;
         }
         if(hunt)
         {
            _loc1_ *= 0.95;
         }
         if(collectForage)
         {
            _loc1_ *= 0.95;
         }
         if(category == 0)
         {
            _loc7_ = totalCargo;
            _loc3_ = maxCargo;
            _loc4_ = passengersWeight;
            _loc2_ = (_loc7_ + passengersWeight) / Math.max(_loc3_ + _loc4_,0);
            if(_loc2_ > 1.2)
            {
               _loc1_ = 0;
               moving = false;
            }
            else if(_loc2_ > 1)
            {
               _loc1_ *= 1 - (_loc2_ - 1) / 0.2;
            }
         }
         return _loc1_;
      }
      
      public function get fighters() : *
      {
         var _loc2_:* = undefined;
         if(staticMode)
         {
            return staticModeFighters;
         }
         var _loc1_:* = 0;
         for(_loc2_ in People)
         {
            if(People[_loc2_].category == 1 || People[_loc2_].category == 2 || People[_loc2_].category == 5)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get mapSpeed() : *
      {
         return speed / 12 * 4;
      }
      
      public function get speed() : *
      {
         var _loc2_:* = undefined;
         if(!allWindPowered)
         {
            _loc2_ = speedWithoutWindPowered;
         }
         if(!hasWindPowered)
         {
            return _loc2_;
         }
         var _loc1_:Number = Math.abs(MathFunctions.AngleDifference(direction,GD.windDirection));
         var _loc3_:* = GD.windStrength * (4 - Math.abs(1.5 - _loc1_)) / 3;
         _loc3_ *= 0.7 + Math.abs(_loc1_ - 1.507) * 0.3;
         if(_loc1_ > 2.3)
         {
            _loc3_ = 0;
         }
         else if(_loc1_ > 2)
         {
            _loc3_ *= 1 / ((_loc1_ - 1.8) * 5);
         }
         if(_loc1_ > 1.5)
         {
            _loc3_ *= 1 / ((_loc1_ + 0.5) / 2);
         }
         if(allWindPowered)
         {
            return _loc3_ * minWindPoweredSpeed;
         }
         return Math.min(_loc2_,_loc3_ * minWindPoweredSpeed);
      }
      
      public function get hasWindPowered() : *
      {
         var _loc1_:* = undefined;
         if(staticMode)
         {
            return staticModeHasWindPowered;
         }
         for(_loc1_ in Transport)
         {
            if(Transport[_loc1_].windPowered && !(Transport[_loc1_].passengerIn is TransportUnit))
            {
               return true;
            }
         }
         return false;
      }
      
      public function get minWindPoweredSpeed() : *
      {
         var _loc1_:* = undefined;
         if(staticMode)
         {
            return staticModeMinWindPoweredSpeed;
         }
         var _loc2_:* = 100000000000000000000;
         for(_loc1_ in Transport)
         {
            if(Transport[_loc1_].windPowered && !(Transport[_loc1_].passengerIn is TransportUnit) && Transport[_loc1_].speed < _loc2_)
            {
               _loc2_ = Transport[_loc1_].speed;
            }
         }
         return _loc2_;
      }
      
      public function get doctorSkill() : *
      {
         if(staticMode)
         {
            return staticModeDoctorSkill;
         }
         return commonRecoverSkillEquation("doctor");
      }
      
      public function commonRecoverSkillEquation(param1:*) : *
      {
         var _loc8_:* = undefined;
         var _loc5_:* = undefined;
         var _loc7_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:Array = [];
         var _loc4_:Array = [];
         for(_loc7_ in People)
         {
            if(People[_loc7_].category == 1 || People[_loc7_].category == 2 || People[_loc7_].category == 5)
            {
               _loc6_.push(People[_loc7_][param1 + "Skill"]);
            }
         }
         for(_loc7_ in Cargo)
         {
            if(Cargo[_loc7_].itemData[param1 + "Improve"] > 0)
            {
               if(Cargo[_loc7_].itemData.device)
               {
                  _loc5_ = devicesWorking(Cargo[_loc7_].type);
               }
               else
               {
                  _loc5_ = Cargo[_loc7_].amount;
               }
               _loc5_ = Math.min(_loc5_,_loc6_.length);
               _loc4_.push({
                  "amount":_loc5_,
                  "improvement":Cargo[_loc7_].itemData[param1 + "Improve"]
               });
            }
         }
         _loc6_.sort(18);
         var _loc2_:* = 0;
         for(_loc7_ in _loc6_)
         {
            _loc3_ = 0;
            for(_loc8_ in _loc4_)
            {
               if(_loc4_[_loc8_].amount > _loc7_)
               {
                  _loc3_ += _loc4_[_loc8_].improvement;
               }
            }
            _loc2_ += _loc6_[_loc7_] * (1 + _loc3_) / (_loc7_ + 1);
         }
         return _loc2_;
      }
      
      public function get veterinarySkill() : *
      {
         if(staticMode)
         {
            return staticModeVeterinarySkill;
         }
         return commonRecoverSkillEquation("veterinary");
      }
      
      public function get mechanicSkill() : *
      {
         if(staticMode)
         {
            return staticModeMechanicSkill;
         }
         return commonRecoverSkillEquation("mechanic");
      }
      
      public function get huntingSkill() : *
      {
         if(staticMode)
         {
            return staticModeHuntingSkill;
         }
         return commonRecoverSkillEquation("hunting");
      }
      
      public function get collectingSkill() : *
      {
         var _loc3_:* = undefined;
         if(staticMode)
         {
            return staticModeCollectingSkill;
         }
         var _loc1_:* = commonRecoverSkillEquation("collecting");
         var _loc2_:* = 0;
         for(_loc3_ in Transport)
         {
            if(Transport[_loc3_].category == 1)
            {
               _loc2_ += 1000;
            }
         }
         return _loc1_ + Math.pow(_loc2_,0.5);
      }
      
      public function get smugglingSkill() : *
      {
         if(staticMode)
         {
            return staticModeSmugglingSkill;
         }
         return typicalCollectiveSkillFormula("smugglingSkill");
      }
      
      private function typicalCollectiveSkillFormula(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:Array = [];
         for(_loc4_ in People)
         {
            if(People[_loc4_].category == 1 || People[_loc4_].category == 2 || People[_loc4_].category == 5)
            {
               _loc2_.push(People[_loc4_][param1]);
            }
         }
         _loc2_.sort(18);
         var _loc3_:* = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ += _loc2_[_loc4_] / (_loc4_ + 1);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function get maxSmuggle() : *
      {
         var _loc2_:* = smugglingSkill;
         return Math.min(maxCargo * _loc2_ * 0.0005,_loc2_);
      }
      
      public function get totalCargo() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(staticMode && type != 0)
         {
            return staticModeTotalCargo;
         }
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ < Cargo.length)
         {
            _loc1_ += Cargo[_loc2_].totalWeight;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get maxCargo() : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         if(staticMode)
         {
            return staticModeMaxCargo;
         }
         var _loc1_:* = 0;
         for(_loc2_ in People)
         {
            if(!(People[_loc2_].passengerIn is TransportUnit) && People[_loc2_].category < 6 && People[_loc2_].category != 3)
            {
               _loc1_ += People[_loc2_].capacity;
            }
         }
         for(_loc2_ in Transport)
         {
            if(Transport[_loc2_].category != 2 && !(Transport[_loc2_].passengerIn is TransportUnit))
            {
               if(Transport[_loc2_].cart is TransportUnit)
               {
                  _loc3_ = Math.min(Transport[_loc2_].capacity * Transport[_loc2_].cart.multiplication - Transport[_loc2_].cart.weight,Transport[_loc2_].cart.capacity);
               }
               else
               {
                  _loc3_ = Transport[_loc2_].capacity;
               }
               _loc3_ -= Transport[_loc2_].passengersWeight;
               _loc1_ += _loc3_;
            }
         }
         return _loc1_;
      }
      
      public function distributeWeapons() : *
      {
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc13_:* = undefined;
         var _loc15_:* = undefined;
         var _loc19_:* = undefined;
         var _loc6_:* = undefined;
         var _loc1_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc3_:* = undefined;
         var _loc7_:* = undefined;
         var _loc20_:* = undefined;
         var _loc23_:* = undefined;
         var _loc9_:* = undefined;
         var _loc2_:* = undefined;
         var _loc8_:* = undefined;
         var _loc16_:* = undefined;
         var _loc21_:* = undefined;
         var _loc12_:Array = [];
         var _loc14_:* = 1;
         for(_loc9_ in People)
         {
            if(People[_loc9_].category < 3)
            {
               for(_loc10_ in People[_loc9_].weapons)
               {
                  if(People[_loc9_].weapons[_loc10_] > 0)
                  {
                     if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc9_].weapons[_loc10_]].type].category == 5)
                     {
                        People[_loc9_].unequip(Item.itemNumFromCatSubCat(2,People[_loc9_].weapons[_loc10_]),People[_loc9_].grenadeAmounts[_loc10_]);
                     }
                     else
                     {
                        People[_loc9_].unequip(Item.itemNumFromCatSubCat(2,People[_loc9_].weapons[_loc10_]),1);
                     }
                  }
               }
               People[_loc9_].grenadeAmounts = [0,0];
               People[_loc9_].attachments = [[],[]];
               People[_loc9_].weapons = [0,0];
               _loc10_ = 0;
               while(_loc10_ < People[_loc9_].equipment.length)
               {
                  if(People[_loc9_].equipment[_loc10_].category == 4)
                  {
                     People[_loc9_].unequip(People[_loc9_].equipment[_loc10_].type,People[_loc9_].equipment[_loc10_].amount);
                     _loc10_--;
                  }
                  _loc10_++;
               }
            }
         }
         for(_loc9_ in Cargo)
         {
            if(Cargo[_loc9_].category == 2)
            {
               if(Cargo[_loc9_].weaponType.category == 2 || Cargo[_loc9_].weaponType.category == 3 || Cargo[_loc9_].weaponType.category == 4 || Cargo[_loc9_].weaponType.category == 5)
               {
                  if(Cargo[_loc9_].weaponType.category == 5)
                  {
                     _loc17_ = Cargo[_loc9_].amount - Cargo[_loc9_].inUse;
                     _loc18_ = 3;
                     _loc7_ = Cargo[_loc9_].weightPerUnit;
                  }
                  else
                  {
                     if(Cargo[_loc9_].weaponType.category == 3)
                     {
                        if(Cargo[_loc9_].weaponType.subCategory == 1)
                        {
                           _loc18_ = 5;
                        }
                        else
                        {
                           _loc18_ = 3;
                        }
                     }
                     if(Cargo[_loc9_].weaponType.category == 4)
                     {
                        _loc18_ = 30;
                     }
                     if(Cargo[_loc9_].weaponType.category == 2)
                     {
                        switch(Cargo[_loc9_].weaponType.subCategory)
                        {
                           case 1:
                              _loc18_ = 5;
                              break;
                           case 2:
                              if(Cargo[_loc9_].itemData.type == 15)
                              {
                                 _loc18_ = 5;
                              }
                              else
                              {
                                 _loc18_ = 3;
                              }
                              break;
                           case 3:
                              _loc18_ = 30;
                              break;
                           case 4:
                              _loc18_ = 10;
                              break;
                           case 5:
                              _loc18_ = 3;
                        }
                     }
                     if(Cargo[_loc9_].itemData.ammo != 17)
                     {
                        _loc17_ = 0;
                        _loc20_ = 0;
                        for(_loc10_ in Cargo)
                        {
                           if(Cargo[_loc10_].category == 3 && Cargo[_loc10_].itemData.type == Cargo[_loc9_].itemData.ammo)
                           {
                              _loc23_ = 0;
                              for(_loc11_ in People)
                              {
                                 if(People[_loc11_].category > 2)
                                 {
                                    for(_loc13_ in People[_loc11_].equipment)
                                    {
                                       if(People[_loc11_].equipment[_loc13_].itemData.type == Cargo[_loc9_].itemData.ammo)
                                       {
                                          _loc23_ += People[_loc11_].equipment[_loc13_].amount;
                                       }
                                    }
                                 }
                              }
                              _loc17_ += Cargo[_loc10_].amount - _loc23_;
                              _loc20_ += Cargo[_loc10_].weightPerUnit * (Cargo[_loc10_].amount - _loc23_);
                           }
                        }
                        _loc7_ = _loc20_ / _loc17_;
                     }
                  }
                  if(Cargo[_loc9_].itemData.ammo == 17)
                  {
                     _loc3_ = money;
                     _loc7_ = 0;
                     _loc14_ = 2;
                  }
                  else if(_loc17_ == 0)
                  {
                     _loc3_ = 0;
                  }
                  else
                  {
                     if(_loc17_ < _loc18_ * (Cargo[_loc9_].amount - Cargo[_loc9_].inUse))
                     {
                        _loc3_ = Math.floor(_loc17_ / _loc18_);
                     }
                     else
                     {
                        _loc3_ = Cargo[_loc9_].amount - Cargo[_loc9_].inUse;
                     }
                     if(_loc3_ == 0 && _loc17_ >= _loc18_ / 3)
                     {
                        _loc3_ = 1;
                     }
                     if(_loc3_ > 0 && _loc18_ > 0)
                     {
                        _loc14_ = Math.min(_loc17_ / _loc3_ / _loc18_,2);
                     }
                     if(_loc3_ == 1 && _loc17_ < _loc18_)
                     {
                        _loc18_ = _loc17_;
                     }
                     if(Cargo[_loc9_].weaponType.category == 5)
                     {
                        _loc14_ *= 7;
                     }
                  }
               }
               else
               {
                  _loc3_ = Cargo[_loc9_].amount - Cargo[_loc9_].inUse;
                  _loc18_ = 0;
                  _loc7_ = 0;
                  _loc14_ = 2;
               }
               _loc10_ = 1;
               while(_loc10_ <= _loc3_)
               {
                  _loc15_ = _loc12_.push({
                     "weapon":Cargo[_loc9_].subCategory,
                     "item":Cargo[_loc9_].type,
                     "cargoReference":Cargo[_loc9_],
                     "price":Cargo[_loc9_].itemData.price * _loc14_,
                     "pretenders":[],
                     "minWeight":Cargo[_loc9_].weightPerUnit + _loc7_ * _loc18_
                  }) - 1;
                  for(_loc11_ in People)
                  {
                     if(People[_loc11_] is Character && (People[_loc11_].category == 1 || People[_loc11_].category == 2) && People[_loc11_].availableCapacity >= _loc12_[_loc15_].minWeight)
                     {
                        if(Cargo[_loc9_].weaponType.category == 1)
                        {
                           _loc19_ = People[_loc11_].meleeDamage(Cargo[_loc9_].itemData) * People[_loc11_].meleeHitChance(Cargo[_loc9_].itemData);
                        }
                        else
                        {
                           _loc19_ = People[_loc11_][WeaponsData.detectWeaponSkill(WeaponsData.Weapons[Cargo[_loc9_].subCategory]) + "Skill"];
                        }
                        _loc12_[_loc15_].pretenders.push({
                           "person":People[_loc11_],
                           "score":_loc19_ * People[_loc11_].maxAP + People[_loc11_].maxHP,
                           "receivedPrimary":false,
                           "receivedSecondary":false
                        });
                     }
                  }
                  _loc10_++;
               }
            }
         }
         _loc12_.sortOn("price",18);
         _loc9_ = 0;
         while(_loc9_ < _loc12_.length)
         {
            _loc6_ = -100000000000000000000;
            _loc1_ = undefined;
            for(_loc10_ in _loc12_[_loc9_].pretenders)
            {
               if(!_loc12_[_loc9_].pretenders[_loc10_].receivedPrimary && _loc12_[_loc9_].minWeight <= _loc12_[_loc9_].pretenders[_loc10_].person.availableCapacity && _loc12_[_loc9_].pretenders[_loc10_].score > _loc6_)
               {
                  _loc6_ = _loc12_[_loc9_].pretenders[_loc10_].score;
                  _loc1_ = _loc10_;
               }
            }
            if(_loc1_ != undefined)
            {
               if(_loc12_[_loc9_].pretenders[_loc1_].person.availableCapacity >= new Item(_loc12_[_loc9_].item,1).weightPerUnit)
               {
                  _loc12_[_loc9_].pretenders[_loc1_].person.addItemToEquipment(new Item(_loc12_[_loc9_].item,1));
                  _loc12_[_loc9_].pretenders[_loc1_].person.weapons = [_loc12_[_loc9_].weapon,0];
                  if(_loc12_[_loc9_].cargoReference.weaponType.category == 5)
                  {
                     _loc12_[_loc9_].pretenders[_loc1_].person.grenadeAmounts[0] = 1;
                  }
                  _loc12_[_loc9_].cargoReference.inUse++;
                  for(_loc10_ in _loc12_)
                  {
                     for(_loc11_ in _loc12_[_loc10_].pretenders)
                     {
                        if(_loc12_[_loc10_].pretenders[_loc11_].person == _loc12_[_loc9_].pretenders[_loc1_].person)
                        {
                           _loc12_[_loc10_].pretenders[_loc11_].receivedPrimary = true;
                           _loc12_[_loc10_].pretenders[_loc11_].weightReserved = _loc12_[_loc9_].minWeight - WeaponsData.Weapons[_loc12_[_loc9_].weapon].weight;
                           break;
                        }
                     }
                  }
                  _loc12_.splice(_loc9_,1);
                  _loc9_--;
               }
            }
            _loc9_++;
         }
         for(_loc9_ in _loc12_)
         {
            _loc2_ = WeaponsData.Weapons[_loc12_[_loc9_].weapon];
            for(_loc10_ in _loc12_[_loc9_].pretenders)
            {
               _loc8_ = WeaponsData.Weapons[_loc12_[_loc9_].pretenders[_loc10_].person.weapons[0]];
               if(weaponKind(_loc8_) != weaponKind(_loc2_))
               {
                  _loc12_[_loc9_].pretenders[_loc10_].score += 100;
               }
               else if(WeaponsData.WeaponTypes[_loc8_.type].category == 1 && WeaponsData.WeaponTypes[_loc2_.type].category == 1)
               {
                  _loc12_[_loc9_].pretenders[_loc10_].score -= 100;
                  if(_loc8_.type == _loc2_.type)
                  {
                     _loc12_[_loc9_].pretenders[_loc10_].score = -100000000000000000000;
                  }
               }
               if(Math.abs(_loc8_.weight + _loc12_[_loc9_].pretenders[_loc10_].weightReserved - _loc12_[_loc9_].minWeight) > 5)
               {
                  _loc12_[_loc9_].pretenders[_loc10_].score += 50;
               }
               if(_loc12_[_loc9_].pretenders[_loc10_].person.weapons[0] == _loc12_[_loc9_].weapon)
               {
                  _loc12_[_loc9_].pretenders[_loc10_].score = -100000000000000000000;
               }
            }
         }
         _loc9_ = 0;
         while(_loc9_ < _loc12_.length)
         {
            _loc6_ = -100000000000000000000;
            _loc1_ = undefined;
            for(_loc10_ in _loc12_[_loc9_].pretenders)
            {
               if(!_loc12_[_loc9_].pretenders[_loc10_].receivedSecondary && _loc12_[_loc9_].minWeight + _loc12_[_loc9_].pretenders[_loc10_].weightReserved <= _loc12_[_loc9_].pretenders[_loc10_].person.availableCapacity && _loc12_[_loc9_].pretenders[_loc10_].score > _loc6_)
               {
                  _loc6_ = _loc12_[_loc9_].pretenders[_loc10_].score;
                  _loc1_ = _loc10_;
               }
            }
            if(_loc1_ != undefined && _loc12_[_loc9_].pretenders[_loc1_].person.availableCapacity >= new Item(_loc12_[_loc9_].item,1).weightPerUnit && _loc12_[_loc9_].pretenders[_loc1_].person.availableCapacity >= _loc12_[_loc9_].minWeight)
            {
               _loc12_[_loc9_].pretenders[_loc1_].person.addItemToEquipment(new Item(_loc12_[_loc9_].item,1));
               _loc12_[_loc9_].pretenders[_loc1_].person.weapons[1] = _loc12_[_loc9_].weapon;
               if(_loc12_[_loc9_].cargoReference.weaponType.category == 5)
               {
                  _loc12_[_loc9_].pretenders[_loc1_].person.grenadeAmounts[1] = 1;
               }
               _loc12_[_loc9_].cargoReference.inUse++;
               for(_loc10_ in _loc12_)
               {
                  for(_loc11_ in _loc12_[_loc10_].pretenders)
                  {
                     if(_loc12_[_loc10_].pretenders[_loc11_].person == _loc12_[_loc9_].pretenders[_loc1_].person)
                     {
                        _loc12_[_loc10_].pretenders[_loc11_].receivedSecondary = true;
                        break;
                     }
                  }
               }
               _loc12_.splice(_loc9_,1);
               _loc9_--;
            }
            _loc9_++;
         }
         var _loc5_:Array = [];
         for(_loc9_ in Cargo)
         {
            if(Cargo[_loc9_].category == 4)
            {
               _loc15_ = _loc5_.push({
                  "attachment":Cargo[_loc9_].subCategory,
                  "item":Cargo[_loc9_],
                  "pretenders":[]
               }) - 1;
               for(_loc10_ in Cargo[_loc9_].itemData.applicable)
               {
                  for(_loc11_ in People)
                  {
                     for(_loc13_ in People[_loc11_].weapons)
                     {
                        _loc16_ = WeaponsData.detectWeaponSkill(WeaponsData.Weapons[People[_loc11_].weapons[_loc13_]]);
                        if(Cargo[_loc9_].itemData.applicable[_loc10_] == _loc16_)
                        {
                           _loc5_[_loc15_].pretenders.push({
                              "charRef":People[_loc11_],
                              "slot":_loc13_,
                              "score":People[_loc11_][_loc16_ + "Skill"] * People[_loc11_].maxAP
                           });
                        }
                     }
                  }
               }
               _loc5_[_loc15_].pretenders.sortOn("score",18);
            }
         }
         _loc5_.sortOn("price",18);
         var _loc22_:int = 2;
         var _loc4_:* = 0;
         _loc9_ = 0;
         while(_loc9_ < _loc5_.length)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc5_[_loc9_].pretenders.length)
            {
               if(_loc5_[_loc9_].pretenders[_loc10_].charRef.attachments[_loc5_[_loc9_].pretenders[_loc10_].slot].length == _loc4_)
               {
                  _loc21_ = true;
                  for(_loc13_ in _loc5_[_loc9_].pretenders[_loc10_].charRef.attachments)
                  {
                     for(_loc11_ in _loc5_[_loc9_].pretenders[_loc10_].charRef.attachments[_loc13_])
                     {
                        if(WeaponsData.Attachments[_loc5_[_loc9_].pretenders[_loc10_].charRef.attachments[_loc13_][_loc11_]].type == _loc5_[_loc9_].item.itemData.type)
                        {
                           _loc21_ = false;
                           break;
                        }
                     }
                  }
                  if(_loc21_ && _loc5_[_loc9_].item.weightPerUnit <= _loc5_[_loc9_].pretenders[_loc10_].charRef.availableCapacity)
                  {
                     _loc5_[_loc9_].pretenders[_loc10_].charRef.attachments[_loc5_[_loc9_].pretenders[_loc10_].slot].push(_loc5_[_loc9_].attachment);
                     _loc5_[_loc9_].pretenders[_loc10_].charRef.addItemToEquipment(new Item(_loc5_[_loc9_].item.type,1));
                     _loc5_[_loc9_].item.inUse++;
                     if(_loc5_[_loc9_].item.amount - _loc5_[_loc9_].item.inUse <= 0)
                     {
                        break;
                     }
                  }
               }
               _loc10_++;
            }
            _loc4_ = 100000000000000000000;
            for(_loc11_ in People)
            {
               for(_loc13_ in People[_loc11_].attachments)
               {
                  if(People[_loc11_].attachments[_loc13_].length < _loc4_)
                  {
                     _loc4_ = People[_loc11_].attachments[_loc13_].length;
                  }
               }
            }
            if(_loc4_ >= 2)
            {
               break;
            }
            _loc9_++;
         }
      }
      
      private function weaponKind(param1:*) : *
      {
         switch(WeaponsData.WeaponTypes[param1.type].category)
         {
            case 1:
               return 1;
            case 2:
               return 2;
            case 3:
               if(WeaponsData.WeaponTypes[param1.type].subCategory == 1)
               {
                  return 2;
               }
               return 3;
               break;
            case 4:
               return 4;
            case 5:
               return 3;
            default:
               return;
         }
      }
      
      public function distributeAmmo() : *
      {
         var _loc9_:* = undefined;
         var _loc11_:* = undefined;
         var _loc15_:* = undefined;
         var _loc8_:* = undefined;
         var _loc18_:* = undefined;
         var _loc14_:* = undefined;
         var _loc13_:* = undefined;
         var _loc16_:* = undefined;
         var _loc6_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc8_ in People)
         {
            if(People[_loc8_].category < 3)
            {
               _loc9_ = 0;
               while(_loc9_ < People[_loc8_].equipment.length)
               {
                  if(People[_loc8_].equipment[_loc9_].category == 3)
                  {
                     People[_loc8_].unequip(People[_loc8_].equipment[_loc9_].type,People[_loc8_].equipment[_loc9_].amount);
                     _loc9_--;
                  }
                  _loc9_++;
               }
            }
         }
         var _loc17_:Array = [];
         var _loc5_:Array = [];
         var _loc12_:Array = [];
         var _loc3_:Array = [];
         var _loc10_:Array = [];
         var _loc7_:Array = [];
         var _loc4_:Array = [];
         for(_loc8_ in People)
         {
            if(People[_loc8_].category < 3)
            {
               for(_loc9_ in People[_loc8_].weapons)
               {
                  if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].category >= 2 && WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].category <= 5)
                  {
                     if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].category == 5)
                     {
                        _loc15_ = 3;
                     }
                     if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].category == 3)
                     {
                        if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].subCategory == 1)
                        {
                           _loc15_ = 5;
                        }
                        else
                        {
                           _loc15_ = 3;
                        }
                     }
                     if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].category == 4)
                     {
                        _loc15_ = 30;
                     }
                     if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].category == 2)
                     {
                        switch(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].subCategory)
                        {
                           case 1:
                              _loc15_ = 5;
                              break;
                           case 2:
                              if(WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type == 15)
                              {
                                 _loc15_ = 5;
                              }
                              else
                              {
                                 _loc15_ = 3;
                              }
                              break;
                           case 3:
                              _loc15_ = 30;
                              break;
                           case 4:
                              _loc15_ = 10;
                              break;
                           case 5:
                              _loc15_ = 3;
                        }
                     }
                     _loc15_ *= People[_loc8_].maxAP;
                     if(WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].category == 5)
                     {
                        if(_loc10_[People[_loc8_].weapons[_loc9_]] == undefined)
                        {
                           _loc10_[People[_loc8_].weapons[_loc9_]] = 0;
                        }
                        var _loc19_:* = People[_loc8_].weapons[_loc9_];
                        var _loc20_:* = _loc10_[_loc19_] + _loc15_;
                        _loc10_[_loc19_] = _loc20_;
                     }
                     else
                     {
                        if(_loc3_[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].ammo] == undefined)
                        {
                           _loc3_[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].ammo] = 0;
                        }
                        _loc20_ = WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].ammo;
                        _loc19_ = _loc3_[_loc20_] + _loc15_;
                        _loc3_[_loc20_] = _loc19_;
                     }
                     _loc17_.push({
                        "weapon":People[_loc8_].weapons[_loc9_],
                        "owner":People[_loc8_],
                        "ammo":WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].ammo,
                        "slot":_loc9_,
                        "grenade":WeaponsData.WeaponTypes[WeaponsData.Weapons[People[_loc8_].weapons[_loc9_]].type].category == 5,
                        "relPart":_loc15_,
                        "ammoReceived":0
                     });
                  }
               }
            }
         }
         for(_loc8_ in Cargo)
         {
            if(Cargo[_loc8_].category == 3)
            {
               if(!(_loc5_[WeaponsData.Ammo[Cargo[_loc8_].subCategory].type] is Array))
               {
                  _loc5_[WeaponsData.Ammo[Cargo[_loc8_].subCategory].type] = [];
               }
               _loc9_ = 1;
               while(_loc9_ <= Cargo[_loc8_].amount - Cargo[_loc8_].inUse)
               {
                  _loc5_[WeaponsData.Ammo[Cargo[_loc8_].subCategory].type].push({
                     "item":new Item(Cargo[_loc8_].type,1),
                     "cargoRef":Cargo[_loc8_]
                  });
                  _loc9_++;
               }
            }
            if(Cargo[_loc8_].category == 2 && Cargo[_loc8_].weaponType.category == 5)
            {
               if(!(_loc12_[Cargo[_loc8_].subCategory] is Array))
               {
                  _loc12_[Cargo[_loc8_].subCategory] = [];
               }
               _loc9_ = 1;
               while(_loc9_ <= Cargo[_loc8_].amount - Cargo[_loc8_].inUse)
               {
                  _loc12_[Cargo[_loc8_].subCategory].push({
                     "item":new Item(Cargo[_loc8_].type,1),
                     "cargoRef":Cargo[_loc8_]
                  });
                  _loc9_++;
               }
            }
         }
         for(_loc8_ in _loc5_)
         {
            _loc7_[_loc8_] = _loc5_[_loc8_].length / _loc3_[_loc8_];
         }
         for(_loc8_ in _loc12_)
         {
            _loc4_[_loc8_] = _loc12_[_loc8_].length / _loc10_[_loc8_];
         }
         for(_loc8_ in _loc17_)
         {
            if(_loc17_[_loc8_].grenade)
            {
               _loc17_[_loc8_].desiredAmount = _loc17_[_loc8_].relPart * _loc4_[_loc17_[_loc8_].weapon];
            }
            else
            {
               _loc17_[_loc8_].desiredAmount = _loc17_[_loc8_].relPart * _loc7_[WeaponsData.Weapons[_loc17_[_loc8_].weapon].ammo];
            }
         }
         var _loc1_:Boolean = false;
         while(_loc17_.length > 0)
         {
            _loc1_ = true;
            for(_loc8_ in _loc17_)
            {
               if(_loc17_[_loc8_].ammoReceived < _loc17_[_loc8_].desiredAmount)
               {
                  _loc1_ = false;
                  break;
               }
            }
            _loc8_ = 0;
            while(_loc8_ < _loc17_.length)
            {
               if(_loc17_[_loc8_].grenade)
               {
                  _loc18_ = _loc12_[_loc17_[_loc8_].weapon];
               }
               else
               {
                  _loc18_ = _loc5_[_loc17_[_loc8_].ammo];
               }
               if(_loc18_ is Array && _loc18_.length > 0)
               {
                  if(_loc17_[_loc8_].ammoReceived < _loc17_[_loc8_].desiredAmount || _loc1_)
                  {
                     _loc14_ = null;
                     _loc9_ = 0;
                     while(_loc9_ < _loc18_.length)
                     {
                        if(_loc18_[_loc9_].item.weightPerUnit <= _loc17_[_loc8_].owner.availableCapacity && _loc18_[_loc9_].cargoRef.inUse < _loc18_[_loc9_].cargoRef.amount)
                        {
                           _loc14_ = _loc18_.splice(_loc9_,1);
                           break;
                        }
                        _loc9_++;
                     }
                     if(_loc14_ == null)
                     {
                        _loc17_.splice(_loc8_,1);
                        _loc8_--;
                     }
                     else
                     {
                        _loc14_ = _loc14_[0];
                        _loc17_[_loc8_].owner.addItemToEquipment(new Item(_loc14_.item.type,1));
                        _loc14_.cargoRef.inUse++;
                        if(_loc17_[_loc8_].grenade)
                        {
                           _loc17_[_loc8_].owner.grenadeAmounts[_loc17_[_loc8_].slot]++;
                        }
                        _loc17_[_loc8_].ammoReceived++;
                     }
                  }
               }
               else
               {
                  _loc17_.splice(_loc8_,1);
                  _loc8_--;
               }
               _loc8_++;
            }
         }
         if(GD.distributeBatteries)
         {
            for(_loc8_ in People)
            {
               for(_loc9_ in People[_loc8_].equipment)
               {
                  if(People[_loc8_].equipment[_loc9_].type == 219)
                  {
                     People[_loc8_].reduceItemFromEquipment(219,People[_loc8_].equipment[_loc9_].amount,false,true);
                     break;
                  }
               }
            }
            _loc16_ = [];
            for(_loc8_ in People)
            {
               for(_loc9_ in People[_loc8_].attachments)
               {
                  for(_loc11_ in People[_loc8_].attachments[_loc9_])
                  {
                     if(People[_loc8_].attachments[_loc9_][_loc11_] > 0)
                     {
                        _loc13_ = Item.getDataFromType(Item.itemNumFromCatSubCat(4,People[_loc8_].attachments[_loc9_][_loc11_]));
                        if(_loc13_.batteries > 0)
                        {
                           _loc16_.push({
                              "person":People[_loc8_],
                              "amount":_loc13_.batteries,
                              "score":People[_loc8_].price,
                              "index":_loc9_ * 2 + _loc11_
                           });
                        }
                     }
                  }
               }
            }
            _loc16_.sortOn(["score","index"],[18,16]);
            _loc13_ = findCargo(219);
            if(_loc13_)
            {
               _loc2_ = _loc13_.amount;
               _loc8_ = 0;
               while(_loc8_ < _loc16_.length)
               {
                  if(_loc2_ >= _loc16_[_loc8_].amount)
                  {
                     _loc6_ = Math.min(_loc16_[_loc8_].amount,_loc2_);
                     _loc16_[_loc8_].person.addItemToEquipment(new Item(219,_loc6_));
                     _loc13_.inUse += _loc6_;
                     _loc2_ -= _loc6_;
                  }
                  if(_loc2_ <= 0)
                  {
                     break;
                  }
                  _loc8_++;
               }
            }
         }
      }
      
      public function distributeArmor() : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:Array = [];
         var _loc1_:Array = [];
         for(_loc3_ in People)
         {
            if(People[_loc3_].category <= 2)
            {
               People[_loc3_].Jacket = 0;
               People[_loc3_].Headgear = 0;
               _loc5_ = 0;
               while(_loc5_ < People[_loc3_].equipment.length)
               {
                  if(People[_loc3_].equipment[_loc5_].category == 5)
                  {
                     People[_loc3_].unequip(People[_loc3_].equipment[_loc5_].type,People[_loc3_].equipment[_loc5_].amount);
                     _loc5_--;
                  }
                  _loc5_++;
               }
            }
         }
         for(_loc3_ in Cargo)
         {
            if(Cargo[_loc3_].category == 5)
            {
               _loc5_ = 1;
               while(_loc5_ <= Cargo[_loc3_].amount - Cargo[_loc3_].inUse)
               {
                  _loc2_.push({
                     "itemRef":Cargo[_loc3_],
                     "armor":Cargo[_loc3_].itemData.armor
                  });
                  _loc5_++;
               }
            }
         }
         _loc2_.sortOn("armor",18);
         for(_loc3_ in People)
         {
            if(People[_loc3_].category == 1 || People[_loc3_].category == 2)
            {
               _loc1_.push({
                  "person":People[_loc3_],
                  "need":1 / People[_loc3_].HP * (People[_loc3_].AP * Math.pow(People[_loc3_].generalBattleExperience,0.5)) / 100,
                  "hasOne":false
               });
            }
         }
         _loc1_.sortOn("need",18);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length && _loc2_.length > 0)
         {
            if(_loc2_[0].itemRef.weightPerUnit <= _loc1_[_loc3_].person.availableCapacity)
            {
               _loc6_ = _loc2_.shift();
               _loc1_[_loc3_].person.addItemToEquipment(new Item(_loc6_.itemRef.type,1));
               if(_loc6_.itemRef.itemData.type == 1)
               {
                  _loc1_[_loc3_].person.Jacket = _loc6_.itemRef.subCategory;
               }
               else
               {
                  _loc1_[_loc3_].person.Headgear = _loc6_.itemRef.subCategory;
               }
               _loc6_.itemRef.inUse++;
               _loc1_[_loc3_].need -= _loc6_.itemRef.itemData.armor;
            }
            _loc3_++;
         }
         if(_loc2_.length > 0)
         {
            _loc1_.sortOn("need",18);
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length && _loc2_.length > 0)
            {
               if(!_loc1_[_loc3_].person.Jacket > 0 && !_loc1_[_loc3_].person.Headgear > 0)
               {
                  _loc6_ = _loc2_.shift();
               }
               else
               {
                  if(_loc1_[_loc3_].person.Jacket > 0)
                  {
                     _loc4_ = 2;
                  }
                  else
                  {
                     _loc4_ = 1;
                  }
                  _loc6_ = null;
                  _loc5_ = 0;
                  while(_loc5_ < _loc2_.length)
                  {
                     if(_loc2_[_loc5_].itemRef.itemData.type == _loc4_)
                     {
                        _loc6_ = _loc2_.splice(_loc5_,1)[0];
                        break;
                     }
                     _loc5_++;
                  }
               }
               if(_loc6_ != null && _loc6_.itemRef.weightPerUnit <= _loc1_[_loc3_].person.availableCapacity)
               {
                  _loc1_[_loc3_].person.addItemToEquipment(new Item(_loc6_.itemRef.type,1));
                  if(_loc6_.itemRef.itemData.type == 1)
                  {
                     _loc1_[_loc3_].person.Jacket = _loc6_.itemRef.subCategory;
                  }
                  else
                  {
                     _loc1_[_loc3_].person.Headgear = _loc6_.itemRef.subCategory;
                  }
                  _loc6_.itemRef.inUse++;
               }
               _loc3_++;
            }
         }
      }
      
      public function get hasUnattachedCarts() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in Transport)
         {
            if(Transport[_loc1_].category == 2 && !(Transport[_loc1_].passengerIn is TransportUnit) && !(Transport[_loc1_].attachedTo is TransportUnit))
            {
               return true;
            }
         }
         return false;
      }
      
      public function distributeTransport(param1:* = true, param2:* = false) : *
      {
         var _loc7_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         _loc7_ = [];
         _loc4_ = [];
         for(_loc6_ in Transport)
         {
            if(param1)
            {
               Transport[_loc6_].cart = null;
               Transport[_loc6_].attachedTo = null;
            }
            if(Transport[_loc6_].cart == null && Transport[_loc6_].attachedTo == null)
            {
               if(Transport[_loc6_].category == 1 && Transport[_loc6_].canDragCarts && !(Transport[_loc6_].passengerIn is TransportUnit))
               {
                  _loc7_.push(Transport[_loc6_]);
               }
               if(Transport[_loc6_].category == 2 && !(Transport[_loc6_].passengerIn is TransportUnit))
               {
                  _loc4_.push(Transport[_loc6_]);
               }
            }
         }
         _loc7_.sortOn("capacity",18);
         _loc4_.sortOn(["capacity","multiplication","weight"],[18,18,18]);
         while(_loc7_.length > 0 && _loc4_.length > 0)
         {
            _loc5_ = _loc4_.shift();
            if(_loc7_[0].capacity * _loc5_.multiplication - _loc5_.weight > 0)
            {
               _loc3_ = _loc7_.shift();
               _loc3_.cart = _loc5_;
               _loc5_.attachedTo = _loc3_;
            }
         }
         if(!param2)
         {
            update();
         }
      }
      
      public function getPeopleByGroup(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         if(!(param1 is Array))
         {
            param1 = [param1];
         }
         for(_loc3_ in People)
         {
            for(_loc4_ in param1)
            {
               if(param1[_loc4_] == People[_loc3_].category)
               {
                  _loc2_.push(People[_loc3_]);
                  break;
               }
            }
         }
         return _loc2_;
      }
      
      public function getSettingsGroup(param1:*) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = param1;
         while(groupSettings[_loc2_].sameAsAnother)
         {
            _loc2_ = groupSettings[_loc2_].anotherGroup;
         }
         return _loc2_;
      }
      
      public function getConsumedFoodstuffs(param1:* = null, param2:* = null) : *
      {
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc3_:* = undefined;
         var _loc19_:* = undefined;
         var _loc7_:* = undefined;
         var _loc16_:* = undefined;
         var _loc14_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc17_:* = undefined;
         var _loc10_:* = undefined;
         var _loc20_:* = undefined;
         var _loc9_:* = undefined;
         var _loc15_:* = undefined;
         var _loc18_:* = undefined;
         var _loc21_:* = undefined;
         if(param1 is Number)
         {
            _loc9_ = param1;
            _loc20_ = param1;
         }
         else if(param1 is Character)
         {
            _loc9_ = param1.category;
            _loc20_ = param1.category;
         }
         else
         {
            _loc9_ = 1;
            _loc20_ = groupSettings.length - 1;
         }
         _loc8_ = [];
         _loc10_ = _loc9_;
         while(_loc10_ <= _loc20_)
         {
            _loc19_ = getSettingsGroup(_loc10_);
            if(param1 is Character)
            {
               _loc7_ = param1.GDA * groupSettings[_loc19_].foodRations / 100;
            }
            else
            {
               _loc3_ = getPeopleByGroup(_loc10_);
               _loc7_ = 0;
               if(_loc3_.length > 0)
               {
                  for(_loc12_ in _loc3_)
                  {
                     _loc7_ += _loc3_[_loc12_].GDA;
                  }
                  _loc7_ *= groupSettings[_loc19_].foodRations / 100;
               }
            }
            _loc16_ = [];
            for(_loc12_ in groupSettings[_loc19_].foodstuffs)
            {
               if(groupSettings[_loc19_].foodstuffs[_loc12_] > 0)
               {
                  for(_loc13_ in Cargo)
                  {
                     if(Cargo[_loc13_].category == 1 && Cargo[_loc13_].subCategory == _loc12_)
                     {
                        _loc16_.push({
                           "type":_loc12_,
                           "itemType":Cargo[_loc13_].type,
                           "relParts":groupSettings[_loc19_].foodstuffs[_loc12_],
                           "amount":Cargo[_loc13_].amount,
                           "calories":Cargo[_loc13_].itemData.calories
                        });
                        break;
                     }
                  }
               }
            }
            _loc14_ = 0;
            for(_loc12_ in _loc16_)
            {
               _loc14_ += _loc16_[_loc12_].relParts;
            }
            _loc6_ = _loc7_ / _loc14_;
            for(_loc12_ in _loc16_)
            {
               _loc16_[_loc12_].needInCalories = _loc16_[_loc12_].relParts * _loc6_;
               if(param2 != null)
               {
                  _loc16_[_loc12_].needInCalories *= param2;
               }
               _loc17_ = false;
               for(_loc13_ in _loc8_)
               {
                  if(_loc8_[_loc13_].type == _loc16_[_loc12_].type)
                  {
                     _loc8_[_loc13_].needInCalories += _loc16_[_loc12_].needInCalories;
                     _loc17_ = true;
                  }
               }
               if(!_loc17_)
               {
                  _loc8_.push({
                     "type":_loc16_[_loc12_].type,
                     "itemType":_loc16_[_loc12_].itemType,
                     "amount":_loc16_[_loc12_].amount,
                     "calories":_loc16_[_loc12_].calories,
                     "needInCalories":_loc16_[_loc12_].needInCalories
                  });
               }
            }
            _loc10_++;
         }
         var _loc11_:* = 0;
         var _loc22_:* = 0;
         for(_loc10_ in _loc8_)
         {
            _loc8_[_loc10_].needInUnits = _loc8_[_loc10_].needInCalories / _loc8_[_loc10_].calories;
            _loc11_ += _loc8_[_loc10_].needInCalories;
            _loc22_ += _loc8_[_loc10_].calories * _loc8_[_loc10_].amount;
         }
         var _loc4_:Array = [];
         if(_loc11_ >= _loc22_)
         {
            for(_loc10_ in _loc8_)
            {
               _loc4_.push({
                  "item":_loc8_[_loc10_].type,
                  "amount":_loc8_[_loc10_].amount,
                  "itemType":_loc8_[_loc10_].itemType
               });
            }
         }
         else
         {
            _loc15_ = 0;
            var _loc5_:* = 0;
            for(_loc10_ in _loc8_)
            {
               if(_loc8_[_loc10_].needInUnits > _loc8_[_loc10_].amount)
               {
                  _loc15_ += _loc8_[_loc10_].needInCalories - _loc8_[_loc10_].amount * _loc8_[_loc10_].calories;
                  _loc8_[_loc10_].needInUnits = _loc8_[_loc10_].amount;
                  _loc8_[_loc10_].empty = true;
               }
               else
               {
                  _loc8_[_loc10_].empty = false;
                  _loc5_++;
               }
            }
            while(_loc15_ > 0.000001)
            {
               _loc21_ = _loc15_ / _loc5_;
               for(_loc10_ in _loc8_)
               {
                  if(!_loc8_[_loc10_].empty)
                  {
                     _loc18_ = _loc8_[_loc10_].amount * _loc8_[_loc10_].calories - _loc8_[_loc10_].needInCalories;
                     if(_loc18_ < _loc21_)
                     {
                        _loc21_ = _loc18_;
                     }
                  }
               }
               for(_loc10_ in _loc8_)
               {
                  if(!_loc8_[_loc10_].empty)
                  {
                     _loc8_[_loc10_].needInCalories += _loc21_;
                     _loc8_[_loc10_].needInUnits += _loc21_ / _loc8_[_loc10_].calories;
                     _loc15_ -= _loc21_;
                     if(_loc8_[_loc10_].amount * _loc8_[_loc10_].calories <= _loc8_[_loc10_].needInCalories)
                     {
                        _loc8_[_loc10_].empty = true;
                        _loc5_--;
                     }
                  }
               }
            }
            for(_loc10_ in _loc8_)
            {
               if(!Item.getDataFromType(_loc8_[_loc10_].itemType).divisible)
               {
                  _loc8_[_loc10_].needInUnits = Math.round(_loc8_[_loc10_].needInUnits);
               }
               _loc4_.push({
                  "item":_loc8_[_loc10_].type,
                  "amount":_loc8_[_loc10_].needInUnits,
                  "itemType":_loc8_[_loc10_].itemType
               });
            }
         }
         return _loc4_;
      }
      
      public function totalFoodConsumption(param1:* = null) : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = 0;
         for(_loc4_ in People)
         {
            _loc6_ = false;
            if(param1 == null)
            {
               _loc6_ = true;
            }
            else if(param1 is Number)
            {
               _loc6_ = param1 == People[_loc4_].category;
            }
            else if(param1 is Array)
            {
               for(_loc5_ in param1)
               {
                  if(param1[_loc5_] == People[_loc4_].category)
                  {
                     _loc6_ = true;
                     break;
                  }
               }
            }
            if(_loc6_)
            {
               _loc3_ = getSettingsGroup(People[_loc4_].category);
               _loc2_ += People[_loc4_].GDA * groupSettings[_loc3_].foodRations / 100;
            }
         }
         return _loc2_;
      }
      
      public function totalWaterConsumption(param1:* = null) : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = 0;
         for(_loc4_ in People)
         {
            _loc6_ = false;
            if(param1 == null)
            {
               _loc6_ = true;
            }
            else if(param1 is Number)
            {
               _loc6_ = param1 == People[_loc4_].category;
            }
            else if(param1 is Array)
            {
               for(_loc5_ in param1)
               {
                  if(param1[_loc5_] == People[_loc4_].category)
                  {
                     _loc6_ = true;
                     break;
                  }
               }
            }
            if(_loc6_)
            {
               _loc3_ = getSettingsGroup(People[_loc4_].category);
               _loc2_ += People[_loc4_].waterConsumption * groupSettings[_loc3_].waterRations / 100;
            }
         }
         return _loc2_;
      }
      
      public function totalMedicineConsumption(param1:* = null) : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = 0;
         for(_loc4_ in People)
         {
            _loc6_ = false;
            if(param1 == null)
            {
               _loc6_ = true;
            }
            else if(param1 is Number)
            {
               _loc6_ = param1 == People[_loc4_].category;
            }
            else if(param1 is Array)
            {
               for(_loc5_ in param1)
               {
                  if(param1[_loc5_] == People[_loc4_].category)
                  {
                     _loc6_ = true;
                     break;
                  }
               }
            }
            if(_loc6_)
            {
               _loc3_ = getSettingsGroup(People[_loc4_].category);
               _loc2_ += GameData.medsDosage[groupSettings[_loc3_].medicineUse[People[_loc4_].wounded]];
            }
         }
         return _loc2_;
      }
      
      public function addTransport(param1:*) : *
      {
         if(param1 is Number)
         {
            param1 = new TransportUnit(param1);
         }
         Transport.push(param1) - 1;
         if(param1.category == 3)
         {
            arrangeLiquidsContainers(64);
         }
      }
      
      public function removeTransport(param1:*, param2:* = false) : *
      {
         var _loc3_:* = undefined;
         if(!param2)
         {
            if(param1.cart is TransportUnit)
            {
               param1.cart.attachedTo = null;
            }
            if(param1.attachedTo is TransportUnit)
            {
               param1.attachedTo.cart = null;
               param1.attachedTo.normalizePassengers();
            }
            if(param1.mother is TransportUnit)
            {
               param1.mother = null;
            }
            for(_loc3_ in Transport)
            {
               if(Transport[_loc3_].mother == param1)
               {
                  Transport[_loc3_].mother = null;
               }
            }
            param1.removeAllPassengers();
            param1.cart = null;
            param1.attachedTo = null;
            if(param1.passengerIn is TransportUnit)
            {
               for(_loc3_ in param1.passengerIn.Passengers)
               {
                  if(param1.passengerIn.Passengers[_loc3_] == param1)
                  {
                     param1.passengerIn.Passengers.splice(_loc3_,1);
                     break;
                  }
               }
            }
            param1.passengerIn = null;
         }
         for(_loc3_ in Transport)
         {
            if(Transport[_loc3_] == param1)
            {
               Transport.splice(_loc3_,1);
               break;
            }
         }
      }
      
      public function fillLubricant(param1:* = null) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc4_ in Transport)
         {
            if(Transport[_loc4_] == param1 || param1 == null && Transport[_loc4_].type > 1)
            {
               if(Transport[_loc4_].lubricantLevel < Transport[_loc4_].maxLubricant)
               {
                  _loc2_ = findCargo(79);
                  if(_loc2_ is Item)
                  {
                     _loc3_ = Math.min(Transport[_loc4_].maxLubricant - Transport[_loc4_].lubricantLevel,_loc2_.amount);
                     Transport[_loc4_].lubricantLevel += _loc3_;
                     reduceCargo(79,_loc3_);
                  }
               }
               break;
            }
         }
      }
      
      public function fillWater(param1:* = null) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc4_ in Transport)
         {
            if(Transport[_loc4_] == param1 || param1 == null && Transport[_loc4_].type == 3)
            {
               if(Transport[_loc4_].waterLevel < Transport[_loc4_].maxWater)
               {
                  _loc2_ = findCargo(1);
                  if(_loc2_ is Item)
                  {
                     _loc3_ = Math.min(Transport[_loc4_].maxWater - Transport[_loc4_].waterLevel,_loc2_.amount);
                     Transport[_loc4_].waterLevel += _loc3_;
                     reduceCargo(1,_loc3_);
                  }
               }
               break;
            }
         }
      }
      
      public function distributePassengers(param1:* = true, param2:* = false) : *
      {
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc13_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc15_:* = undefined;
         var _loc7_:* = undefined;
         var _loc12_:* = undefined;
         if(param1)
         {
            removeAllPassengers();
         }
         distributeDrivers();
         var _loc11_:Array = [];
         var _loc14_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:* = 0;
         for(_loc7_ in Transport)
         {
            if(Transport[_loc7_].category != 2)
            {
               _loc14_.push({
                  "ref":Transport[_loc7_],
                  "score":Transport[_loc7_].capacity - Transport[_loc7_].passengersWeight + (Transport[_loc7_].maxPassengersWithCart - Transport[_loc7_].passengerSpacesOccupied) * 100 + Transport[_loc7_].speed
               });
            }
         }
         if(GD.transportAsPassengers)
         {
            for(_loc7_ in Transport)
            {
               if(!(Transport[_loc7_].passengerIn is TransportUnit))
               {
                  if(Transport[_loc7_].category == 2)
                  {
                     _loc4_.push({"ref":Transport[_loc7_]});
                  }
                  else
                  {
                     _loc11_.push({"ref":Transport[_loc7_]});
                  }
                  if(Transport[_loc7_].canDragCarts)
                  {
                     _loc5_++;
                  }
               }
            }
         }
         for(_loc7_ in People)
         {
            if(!(People[_loc7_].passengerIn is TransportUnit))
            {
               _loc11_.push({"ref":People[_loc7_]});
            }
         }
         for(_loc7_ in _loc11_)
         {
            _loc11_[_loc7_].score = passengerScoreFormula(_loc11_[_loc7_].ref);
         }
         if(GD.transportAsPassengers)
         {
            if(_loc5_ >= _loc4_.length)
            {
               _loc4_ = [];
            }
            else
            {
               for(_loc7_ in _loc4_)
               {
                  _loc4_[_loc7_].score = _loc4_[_loc7_].ref.multiplication * 100 - _loc4_[_loc7_].ref.weight;
               }
            }
         }
         _loc14_.sortOn("score",18);
         _loc11_.sortOn("score",18);
         if(_loc5_ < _loc4_.length)
         {
            _loc4_.sortOn("score",18);
            _loc7_ = _loc4_.length - 1;
            while(_loc7_ >= 0)
            {
               if(!(_loc4_[_loc7_].ref.attachedTo is TransportUnit))
               {
                  _loc11_.unshift({
                     "ref":_loc4_[_loc7_].ref,
                     "score":100000000000000000000
                  });
                  _loc4_.splice(_loc7_,1);
                  if(_loc5_ == 0)
                  {
                     break;
                  }
               }
               _loc7_--;
            }
            _loc7_ = _loc5_;
            while(_loc7_ < _loc4_.length)
            {
               _loc11_.unshift({"ref":_loc4_[_loc7_].ref});
               _loc7_++;
            }
         }
         _loc13_ = 100000000000000000000;
         for(_loc7_ in _loc11_)
         {
            if(_loc11_[_loc7_].ref.weight < _loc13_)
            {
               _loc13_ = _loc11_[_loc7_].ref.weight;
            }
         }
         for(_loc7_ in _loc14_)
         {
            _loc3_ = _loc14_[_loc7_].ref.capacityWithCart - _loc14_[_loc7_].ref.passengersWeight;
            _loc6_ = _loc14_[_loc7_].ref.maxPassengersWithCart - _loc14_[_loc7_].ref.passengerSpacesOccupied;
            _loc15_ = Math.min(Math.floor(_loc3_ / _loc13_),_loc6_);
            _loc8_ = 1;
            while(_loc8_ <= _loc15_)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc11_.length)
               {
                  if(_loc11_[_loc9_].ref.weight <= _loc3_ && _loc11_[_loc9_].ref.passengerSpaces <= _loc6_ && (_loc11_[_loc9_].ref.speed == undefined || _loc11_[_loc9_].ref.speed < _loc14_[_loc7_].ref.speed))
                  {
                     _loc12_ = false;
                     if(_loc11_[_loc9_].ref is TransportUnit && _loc11_[_loc9_].ref.Passengers.length > 0)
                     {
                        for(_loc10_ in _loc11_[_loc9_].ref.Passengers)
                        {
                           _loc11_[_loc9_].ref.Passengers[_loc10_].passengerIn = null;
                           _loc11_.push(_loc11_[_loc9_].ref.Passengers[_loc10_]);
                        }
                        _loc11_[_loc9_].ref.Passengers = [];
                        _loc12_ = true;
                     }
                     _loc14_[_loc7_].ref.Passengers.push(_loc11_[_loc9_].ref);
                     _loc11_[_loc9_].ref.passengerIn = _loc14_[_loc7_].ref;
                     _loc3_ -= _loc11_[_loc9_].ref.weight;
                     _loc6_ -= _loc11_[_loc9_].ref.passengerSpaces;
                     _loc11_.splice(_loc9_,1);
                     _loc9_--;
                     if(_loc12_)
                     {
                        _loc11_.sortOn("score",18);
                        _loc9_ = 0;
                     }
                     if(_loc6_ <= 0 || _loc3_ < _loc13_)
                     {
                        break;
                     }
                  }
                  _loc9_++;
               }
               if(_loc6_ <= 0 || _loc3_ < _loc13_)
               {
                  break;
               }
               _loc8_++;
            }
         }
         if(!param2)
         {
            update();
         }
      }
      
      public function distributeExperience(param1:*, param2:*, param3:*) : *
      {
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         _loc4_ = [];
         for(_loc5_ in People)
         {
            if(People[_loc5_].category != 4)
            {
               _loc4_.push({
                  "person":People[_loc5_],
                  "skill":People[_loc5_][param1]
               });
            }
         }
         _loc4_.sortOn("skill",18);
         for(_loc6_ in _loc4_)
         {
            if(_loc4_[_loc6_].person.category == 3)
            {
               var _loc8_:* = param2;
               var _loc7_:* = _loc4_[_loc6_].person[_loc8_] + param3 / (_loc6_ + 1) * _loc4_[_loc6_].person.learningCapacity * 0.2;
               _loc4_[_loc6_].person[_loc8_] = _loc7_;
            }
            else
            {
               _loc7_ = param2;
               _loc8_ = _loc4_[_loc6_].person[_loc7_] + param3 / (_loc6_ + 1) * _loc4_[_loc6_].person.learningCapacity;
               _loc4_[_loc6_].person[_loc7_] = _loc8_;
            }
         }
      }
      
      public function get animals() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = 0;
         for(_loc2_ in Transport)
         {
            if(Transport[_loc2_].category == 1)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get hasVehiclesWithoutDrivers() : *
      {
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc2_ in Transport)
         {
            if(Transport[_loc2_].category == 3 && !(Transport[_loc2_].passengerIn is TransportUnit))
            {
               _loc1_ = false;
               for(_loc3_ in Transport[_loc2_].Passengers)
               {
                  if(Transport[_loc2_].Passengers[_loc3_] is Character)
                  {
                     _loc1_ = true;
                     break;
                  }
               }
               if(!_loc1_)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function distributeDrivers() : *
      {
         var _loc4_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc3_:* = undefined;
         var _loc7_:* = undefined;
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         for(_loc8_ in Transport)
         {
            if(Transport[_loc8_].category == 3 && !(Transport[_loc8_].passengerIn is TransportUnit))
            {
               _loc4_ = false;
               for(_loc9_ in Transport[_loc8_].Passengers)
               {
                  if(Transport[_loc8_].Passengers[_loc9_] is Character)
                  {
                     _loc4_ = true;
                     break;
                  }
               }
               if(!_loc4_)
               {
                  _loc2_.push(Transport[_loc8_]);
               }
            }
         }
         if(_loc2_.length > 0)
         {
            for(_loc8_ in People)
            {
               if(People[_loc8_].passengerIn is TransportUnit)
               {
                  _loc5_.push({
                     "ref":People[_loc8_],
                     "score":1000 / People[_loc8_].weight
                  });
               }
               else
               {
                  _loc6_.push({
                     "ref":People[_loc8_],
                     "score":passengerScoreFormula(People[_loc8_])
                  });
               }
            }
            _loc5_.sortOn("score",18);
            _loc6_.sortOn("score",18);
            _loc1_ = _loc5_.concat(_loc6_);
            _loc8_ = 0;
            while(_loc8_ < _loc2_.length)
            {
               _loc4_ = false;
               _loc3_ = _loc2_[_loc8_].capacityWithCart - _loc2_[_loc8_].passengersWeight;
               _loc7_ = _loc2_[_loc8_].maxPassengersWithCart - _loc2_[_loc8_].passengerSpacesOccupied;
               if(_loc1_.length == 0)
               {
                  return false;
               }
               _loc9_ = 0;
               while(_loc9_ < _loc1_.length)
               {
                  if(_loc1_[_loc9_].ref.weight <= _loc3_ && _loc1_[_loc9_].ref.passengerSpaces <= _loc7_)
                  {
                     _loc4_ = true;
                     _loc1_[_loc9_].ref.removeFromPassengers();
                     _loc2_[_loc8_].Passengers.push(_loc1_[_loc9_].ref);
                     _loc1_[_loc9_].ref.passengerIn = _loc2_[_loc8_];
                     _loc1_.splice(_loc9_,1);
                     break;
                  }
                  _loc9_++;
               }
               if(!_loc4_)
               {
                  _loc2_[_loc8_].Passengers.unshift(_loc1_[0].ref);
                  _loc1_[0].ref.passengerIn = _loc2_[_loc8_];
                  _loc1_.shift();
                  _loc2_[_loc8_].normalizePassengers();
               }
               _loc8_++;
            }
         }
         return true;
      }
      
      private function passengerScoreFormula(param1:*) : *
      {
         var _loc2_:Number = 1000 / param1.speed - param1.capacity - param1.passengerSpaces * 10 - param1.weight;
         if(param1 is Character)
         {
            _loc2_ += param1.wounded * 10;
         }
         return _loc2_;
      }
      
      public function removeAllPassengers() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in People)
         {
            People[_loc1_].passengerIn = null;
         }
         for(_loc1_ in Transport)
         {
            Transport[_loc1_].passengerIn = null;
            Transport[_loc1_].Passengers = [];
         }
      }
      
      public function destroy() : *
      {
         var _loc1_:* = undefined;
         if(mapSymbolParent is DisplayObject && mapSymbolParent.contains(mapSymbol))
         {
            mapSymbolParent.removeChild(mapSymbol);
         }
         active = false;
      }
      
      public function get passengersWeight() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = 0;
         for(_loc2_ in Transport)
         {
            if(Transport[_loc2_].passengerIn is TransportUnit)
            {
               _loc1_ += Transport[_loc2_].weight;
            }
         }
         for(_loc2_ in People)
         {
            if(People[_loc2_].passengerIn is TransportUnit)
            {
               _loc1_ += People[_loc2_].weight;
            }
         }
         return _loc1_;
      }
      
      public function update() : *
      {
         if(staticMode)
         {
            staticMode = false;
            staticModeSpeed = speed;
            staticModeSight = sight;
            staticModeNoticeability = noticeability;
            if(!moving)
            {
               staticModeNoticeability *= 2;
            }
            staticModeMorale = morale;
            staticModeWater = water;
            staticModeFood = food;
            staticModeForage = forage;
            staticModeMeds = meds;
            staticModeVisualWarPower = visualWarPower;
            staticModeActualWarPower = actualWarPower;
            staticModeDoctorSkill = doctorSkill;
            staticModeVeterinarySkill = veterinarySkill;
            staticModeMechanicSkill = mechanicSkill;
            staticModeHuntingSkill = huntingSkill;
            staticModeCollectingSkill = collectingSkill;
            staticModeSmugglingSkill = smugglingSkill;
            staticModeTotalCargo = totalCargo;
            staticModeMaxCargo = maxCargo;
            staticModeFighters = fighters;
            staticModeElectricOverload = electricOverload;
            staticModeHasWindPowered = hasWindPowered;
            if(staticModeHasWindPowered)
            {
               staticModeMinWindPoweredSpeed = minWindPoweredSpeed;
               staticModeAllWindPowered = allWindPowered;
            }
            staticMode = true;
         }
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         mapSymbol = null;
         mapSymbolRotatingPart = null;
         mapSymbolText1 = null;
         mapSymbolText2 = null;
         mapSymbolParent = null;
         nearbyCaravans = null;
         nearbyTowns = null;
         for(_loc1_ in People)
         {
            if(People[_loc1_] is Character)
            {
               People[_loc1_].remove();
               People[_loc1_] = null;
            }
         }
         for(_loc1_ in Transport)
         {
            if(Transport[_loc1_] is TransportUnit)
            {
               Transport[_loc1_].remove();
               Transport[_loc1_] = null;
            }
         }
         for(_loc1_ in Cargo)
         {
            Cargo[_loc1_] = null;
         }
         People = null;
         Cargo = null;
         Transport = null;
      }
   }
}

