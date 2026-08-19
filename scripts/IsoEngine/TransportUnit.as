package IsoEngine//-not original, fix infinity
{
   import Data.Texts;
   import com.gskinner.utils.Rndm;
   
   public class TransportUnit
   {
      
      public static var Types:* = [undefined,{//-1 donkey
         "category":1,
         "name":890,
         "speed":5,
         "noticeability":30,
         "width":1,
         "height":2,
         "imageWidth":100,
         "imageHeight":100,
         "canDragCarts":true,
         "zHeight":1.5,
         "elevation":3,
         "armor":0,
         "fireResistance":0,
         "explosionResistance":0,
         "maxHealth":150,
         "capacity":50,
         "weight":160,
         "passengers":1,
         "forageConsumption":3,
         "waterConsumption":6,
         "milkConsumption":0.9,
         "price":15000,
         "passengerSpaces":5,
         "meat":76,
         "skinAmount":2.3,
         "droughtTolerance":1,
         "lifespan":360,
         "gestation":360,
         "lactation":120,
         "averageKids":1,
         "maturity":720,
         "produces":[],
         "milk":{
            "item":77,
            "amount":1
         },
         "segments":[{
            "x":0.4,
            "y":0.5
         },{
            "x":0.5,
            "y":0.4
         },{
            "x":0.6,
            "y":0.5
         },{
            "x":0.5,
            "y":0.6,
            "end":true
         },{
            "x":0.3,
            "y":-0.5
         },{
            "x":0.5,
            "y":-0.9
         },{
            "x":0.8,
            "y":-0.5
         },{
            "x":0.5,
            "y":-0.4
         }]
      },{ //-2 small cart
         "category":2,
         "name":891,
         "noticeability":30,
         "width":1,
         "height":1,
         "imageWidth":100,
         "imageHeight":100,
         "zHeight":0.9,
         "elevation":2,
         "armor":5,
         "fireResistance":50,
         "explosionResistance":5,
         "maxHealth":200,
         "capacity":150,
         "weight":40,
         "multiplication":3,
         "passengers":1,
         "passengerSpaces":4,
         "maxLubricant":0.5,
         "price":7000,
         "segments":[{
            "x":0.1,
            "y":1
         },{
            "x":0.1,
            "y":0.4
         },{
            "x":0.9,
            "y":0.4
         },{
            "x":0.9,
            "y":1
         }]
      },{
         "category":3,
         "name":1154,
         "speed":22,
         "noticeability":50,
         "width":1,
         "height":3,
         "imageWidth":150,
         "imageHeight":150,
         "zHeight":1.4,
         "elevation":3,
         "armor":10,
         "fireResistance":50,
         "explosionResistance":5,
         "maxHealth":200,
         "capacity":600,
         "weight":245,
         "passengers":1,
         "passengerSpaces":10,
         "fuelConsumption":7,
         "maxLubricant":1.3,
         "maxWater":1,
         "fuelTank":20,
         "price":500000,
         "segments":[{
            "x":0.3,
            "y":0.6
         },{
            "x":0.5,
            "y":0.4
         },{
            "x":0.7,
            "y":0.6
         },{
            "x":0.5,
            "y":0.8
         }]
      },{
         "category":1,
         "name":2863,
         "speed":3.5,
         "noticeability":20,
         "width":1,
         "height":2,
         "imageWidth":100,
         "imageHeight":100,
         "canDragCarts":false,
         "zHeight":1,
         "elevation":2,
         "armor":0,
         "fireResistance":0,
         "explosionResistance":0,
         "maxHealth":70,
         "capacity":0,
         "weight":90,
         "passengers":0,
         "forageConsumption":2.5,
         "waterConsumption":5,
         "milkConsumption":1.3,
         "price":4000,
         "passengerSpaces":4,
         "meat":85,
         "skinAmount":1.5,
         "droughtTolerance":0.8,
         "lifespan":132,
         "gestation":152,
         "lactation":100,
         "averageKids":1.3,
         "maturity":210,
         "produces":[{
            "item":87,
            "amount":0.5
         }],
         "milk":{
            "item":86,
            "amount":2
         },
         "segments":[{
            "x":0.4,
            "y":0.5
         },{
            "x":0.5,
            "y":0.4
         },{
            "x":0.6,
            "y":0.5
         },{
            "x":0.5,
            "y":0.6,
            "end":true
         },{
            "x":0.3,
            "y":-0.5
         },{
            "x":0.5,
            "y":-0.9
         },{
            "x":0.8,
            "y":-0.5
         },{
            "x":0.5,
            "y":-0.4
         }]
      },{
         "category":1,
         "name":2872,
         "speed":4,
         "noticeability":20,
         "width":1,
         "height":2,
         "imageWidth":100,
         "imageHeight":100,
         "canDragCarts":false,
         "zHeight":1,
         "elevation":2,
         "armor":0,
         "fireResistance":0,
         "explosionResistance":0,
         "maxHealth":60,
         "capacity":0,
         "weight":80,
         "passengers":0,
         "forageConsumption":2.2,
         "waterConsumption":4,
         "milkConsumption":1.9,
         "price":3600,
         "passengerSpaces":3,
         "meat":83,
         "skinAmount":1.1,
         "droughtTolerance":1,
         "lifespan":192,
         "gestation":150,
         "lactation":100,
         "averageKids":2,
         "maturity":210,
         "produces":[{
            "item":87,
            "amount":0.05
         }],
         "milk":{
            "item":84,
            "amount":2
         },
         "segments":[{
            "x":0.4,
            "y":0.5
         },{
            "x":0.5,
            "y":0.4
         },{
            "x":0.6,
            "y":0.5
         },{
            "x":0.5,
            "y":0.6,
            "end":true
         },{
            "x":0.3,
            "y":-0.5
         },{
            "x":0.5,
            "y":-0.9
         },{
            "x":0.8,
            "y":-0.5
         },{
            "x":0.5,
            "y":-0.4
         }]
      },{
         "category":1,
         "name":2880,
         "speed":3,
         "noticeability":40,
         "width":1,
         "height":2,
         "imageWidth":100,
         "imageHeight":100,
         "canDragCarts":true,
         "zHeight":1.5,
         "elevation":3,
         "armor":0,
         "fireResistance":0,
         "explosionResistance":0,
         "maxHealth":250,
         "capacity":80,
         "weight":500,
         "passengers":1,
         "forageConsumption":6,
         "waterConsumption":10,
         "milkConsumption":3,
         "price":40000,
         "passengerSpaces":6,
         "meat":88,
         "skinAmount":5,
         "droughtTolerance":0.8,
         "lifespan":180,
         "gestation":274,
         "lactation":120,
         "averageKids":1,
         "maturity":720,
         "produces":[],
         "milk":{
            "item":89,
            "amount":6
         },
         "segments":[{
            "x":0.5,
            "y":1
         },{
            "x":0.2,
            "y":0
         },{
            "x":0.2,
            "y":-1
         },{
            "x":0.8,
            "y":-1
         },{
            "x":0.8,
            "y":0
         }]
      },{
         "category":1,
         "name":4206,
         "speed":12,
         "noticeability":30,
         "width":1,
         "height":3,
         "imageWidth":150,
         "imageHeight":150,
         "canDragCarts":true,
         "zHeight":1.8,
         "elevation":3,
         "armor":0,
         "fireResistance":0,
         "explosionResistance":0,
         "maxHealth":150,
         "capacity":110,
         "weight":500,
         "passengers":1,
         "forageConsumption":5,
         "waterConsumption":10,
         "milkConsumption":2,
         "price":80000,
         "passengerSpaces":8,
         "meat":133,
         "skinAmount":5,
         "droughtTolerance":0.9,
         "lifespan":336,
         "gestation":340,
         "lactation":120,
         "averageKids":1,
         "maturity":540,
         "produces":[],
         "milk":{
            "item":132,
            "amount":2
         },
         "segments":[{
            "x":0.5,
            "y":1
         },{
            "x":0.2,
            "y":0
         },{
            "x":0.2,
            "y":-1.5
         },{
            "x":0.8,
            "y":-1.5
         },{
            "x":0.8,
            "y":0
         }]
      },{
         "category":2,
         "name":4209,
         "noticeability":40,
         "width":1,
         "height":2,
         "imageWidth":100,
         "imageHeight":100,
         "zHeight":1.1,
         "elevation":2,
         "armor":1,
         "fireResistance":50,
         "explosionResistance":5,
         "maxHealth":250,
         "capacity":300,
         "weight":65,
         "multiplication":3,
         "passengers":2,
         "passengerSpaces":6,
         "maxLubricant":1,
         "price":35000,
         "segments":[{
            "x":0,
            "y":1
         },{
            "x":0,
            "y":-0.5
         },{
            "x":1,
            "y":-0.5
         },{
            "x":1,
            "y":1
         }]
      },{
         "category":1,
         "name":4211,
         "speed":6,
         "noticeability":40,
         "width":1,
         "height":3,
         "imageWidth":200,
         "imageHeight":200,
         "canDragCarts":true,
         "zHeight":2.1,
         "elevation":3,
         "armor":0,
         "fireResistance":0,
         "explosionResistance":0,
         "maxHealth":200,
         "capacity":190,
         "weight":600,
         "passengers":1,
         "forageConsumption":5,
         "waterConsumption":6,
         "milkConsumption":2,
         "price":75000,
         "passengerSpaces":10,
         "meat":135,
         "skinAmount":5,
         "droughtTolerance":1.7,
         "lifespan":540,
         "gestation":410,
         "lactation":120,
         "averageKids":1,
         "maturity":540,
         "produces":[{
            "item":87,
            "amount":0.1
         }],
         "milk":{
            "item":134,
            "amount":3
         },
         "segments":[{
            "x":0.5,
            "y":0
         },{
            "x":0.2,
            "y":-0.7
         },{
            "x":0.5,
            "y":-1.4
         },{
            "x":0.8,
            "y":-0.7
         }]
      },{
         "category":2,
         "name":4214,
         "noticeability":50,
         "width":1,
         "height":2,
         "imageWidth":120,
         "imageHeight":120,
         "zHeight":1.2,
         "elevation":2,
         "armor":5,
         "fireResistance":50,
         "explosionResistance":5,
         "maxHealth":270,
         "capacity":450,
         "weight":85,
         "multiplication":3,
         "passengers":3,
         "passengerSpaces":8,
         "maxLubricant":1,
         "price":45000,
         "segments":[{
            "x":0,
            "y":1
         },{
            "x":0,
            "y":-1
         },{
            "x":1,
            "y":-1
         },{
            "x":1,
            "y":1
         }]
      },{
         "category":2,
         "name":4215,
         "noticeability":30,
         "width":1,
         "height":1,
         "imageWidth":100,
         "imageHeight":100,
         "zHeight":1,
         "elevation":2,
         "armor":0,
         "fireResistance":5,
         "explosionResistance":10,
         "maxHealth":200,
         "capacity":200,
         "weight":20,
         "multiplication":3.5,
         "passengers":1,
         "passengerSpaces":4,
         "maxLubricant":0.5,
         "price":25000,
         "segments":[{
            "x":0,
            "y":1
         },{
            "x":0,
            "y":0
         },{
            "x":1,
            "y":0
         },{
            "x":1,
            "y":1
         }]
      },{
         "category":2,
         "name":4219,
         "noticeability":60,
         "width":1,
         "height":3,
         "imageWidth":180,
         "imageHeight":180,
         "zHeight":1.5,
         "elevation":3,
         "armor":30,
         "fireResistance":40,
         "explosionResistance":40,
         "maxHealth":300,
         "capacity":1000,
         "weight":150,
         "multiplication":3,
         "passengers":6,
         "passengerSpaces":16,
         "maxLubricant":2,
         "price":90000,
         "segments":[{
            "x":0,
            "y":1
         },{
            "x":0,
            "y":-2
         },{
            "x":1,
            "y":-2
         },{
            "x":1,
            "y":1
         }]
      },{
         "category":3,
         "name":6058,
         "speed":16,
         "noticeability":250,
         "width":6,
         "height":12,
         "imageWidth":700,
         "imageHeight":700,
         "zHeight":4,
         "elevation":3,
         "armor":60,
         "fireResistance":80,
         "explosionResistance":50,
         "maxHealth":2000,
         "capacity":12000,
         "weight":4500,
         "passengers":32,
         "passengerSpaces":90,
         "fuelConsumption":43,
         "maxLubricant":8,
         "maxWater":10,
         "fuelTank":350,
         "price":8000000,
         "segments":[{
            "x":0,
            "y":1
         },{
            "x":0,
            "y":-11
         },{
            "x":6,
            "y":-11
         },{
            "x":6,
            "y":1
         }],
         "yCorrection":-40
      },{
         "category":3,
         "name":6377,
         "speed":0.7,
         "noticeability":80,
         "width":1,
         "height":4,
         "imageWidth":350,
         "imageHeight":350,
         "zHeight":1,
         "elevation":3,
         "armor":20,
         "fireResistance":10,
         "explosionResistance":5,
         "maxHealth":100,
         "capacity":270,
         "weight":120,
         "passengers":1,
         "passengerSpaces":10,
         "fuelConsumption":0,
         "maxLubricant":2,
         "maxWater":0,
         "fuelTank":0,
         "price":350000,
         "segments":[{
            "x":-0.5,
            "y":-1
         },{
            "x":-0.6,
            "y":-1.5
         },{
            "x":-0.5,
            "y":-2
         },{
            "x":-0.4,
            "y":-1.5
         }],
         "yCorrection":0,
         "windPowered":true
      },{
         "category":3,
         "name":6827,
         "speed":19,
         "noticeability":80,
         "width":3,
         "height":6,
         "imageWidth":400,
         "imageHeight":400,
         "zHeight":2,
         "elevation":3,
         "armor":30,
         "fireResistance":60,
         "explosionResistance":20,
         "maxHealth":400,
         "capacity":1600,
         "weight":750,
         "passengers":3,
         "passengerSpaces":15,
         "fuelConsumption":10,
         "maxLubricant":3,
         "maxWater":5,
         "fuelTank":60,
         "price":2000000,
         "segments":[{
            "x":0.5,
            "y":1
         },{
            "x":-1.5,
            "y":1
         },{
            "x":-1.5,
            "y":-3
         },{
            "x":0.5,
            "y":-3
         }],
         "yCorrection":-30
      }];
      
      public static const variablesToSave:* = ["type","_health","_maxHealth","gender","age","pregnant","remainingPregnancy","maxAge","weight","_idealWeight","remainingLactation","lubricantLevel","waterLevel","givenName","cycleCounter","hunger","thirst","pregnantWith"];
      
      public var type:*;
      
      public var direction:* = 0;
      
      public var frame:*;
      
      public var prevFrame:*;
      
      public var x:*;
      
      public var y:*;
      
      public var squareX:*;
      
      public var squareY:*;
      
      public var ownContainer:*;
      
      public var Shadow:*;
      
      public var attachedTo:*;
      
      public var cart:*;
      
      public var lastHitDamage:* = 0;
      
      public var FTBurstTotal:* = 0;
      
      public var _health:*;
      
      public var _maxHealth:*;
      
      public var gender:*;
      
      public var age:*;
      
      public var pregnant:* = false;
      
      public var remainingPregnancy:* = 0;
      
      public var maxAge:*;
      
      public var weight:*;
      
      public var _idealWeight:*;
      
      public var remainingLactation:* = 0;
      
      public var lubricantLevel:*;
      
      public var waterLevel:*;
      
      public var givenName:*;
      
      public var Passengers:*;
      
      public var passengerIn:*;
      
      public var cycleCounter:*;
      
      public var mother:*;
      
      public var hunger:* = 0;
      
      public var thirst:* = 0;
      
      public var pregnantWith:*;
      
      public var randomPointer:* = null;
      
      public var originallyBelongedTo:*;
      
      public var hitInThisTurn:* = false;
      
      public function TransportUnit(param1:* = 0, param2:* = false, param3:* = null)
      {
         super();
         if(param2)
         {
            randomPointer = Rndm.pointer;
         }
         if(param3 != null)
         {
            randomPointer = Rndm.pointer = param3;
         }
         cycleCounter = Rndm.integer(0,59);
         type = param1;
         if(Types[type].category == 1)//-category 1 = animal
         {
            gender = Rndm.integer(1,2);
            maxAge = Types[type].lifespan * 30 * (0.8 + Rndm.random() * 0.4);
            //some caravans were spawning with baby animals or too old ones
            age = Math.round(maxAge * (0.1 + Rndm.random() / 2));//-reduced maxRange, 0 - 100 -> 10 - 60
            idealWeight = Types[type].weight * (0.8 + Rndm.random() * 0.4);
            maxHealth = Math.round(Types[type].maxHealth * (_idealWeight / Types[type].weight));
            if(gender == 1)
            {
               _idealWeight *= 1.05;
            }
            else
            {
               _idealWeight *= 0.95;
            }
            weight = idealWeight;
         }
         else
         {
            maxHealth = Types[type].maxHealth;
            weight = Types[type].weight;
            lubricantLevel = maxLubricant;
            waterLevel = maxWater;
         }
         health = maxHealth * (0.75 + Rndm.random() * 0.25);//-transport spawns with more health 50 - 100 -> 75 - 100
         pregnant = false;
         Passengers = [];
      }
      
      public function get fuelTank() : *
      {
         return Types[type].fuelTank;
      }
      
      public function get weightPerUnit() : *
      {
         return weight;
      }
      
      public function get totalWeight() : *
      {
         return weight;
      }
      
      public function get canDragCarts() : *
      {
         if(category == 1)
         {
            return Types[type].canDragCarts;
         }
         return false;
      }
      
      public function get maxLubricant() : *
      {
         return Types[type].maxLubricant;
      }
      
      public function get maxWater() : *
      {
         return Types[type].maxWater;
      }
      
      public function get windPowered() : *
      {
         return Types[type].windPowered;
      }
      
      public function get noticeability() : *
      {
         return Types[type].noticeability;
      }
      
      public function get agePeriod() : *
      {
         if(age < Types[type].lactation)
         {
            return 1;
         }
         if(age < Types[type].maturity)
         {
            return 2;
         }
         if(age < maxAge * 0.8)
         {
            return 3;
         }
         return 4;
      }
      
      public function get lactation() : *
      {
         return Types[type].lactation;
      }
      
      public function get averageKids() : *
      {
         if(Types[type].averageKids == undefined)
         {
            return 1;
         }
         return Types[type].averageKids;
      }
      
      public function get meat() : *
      {
         return Types[type].meat;
      }
      
      public function get meatAmount() : *
      {
         return weight * 0.35;
      }
      
      public function get skinAmount() : *
      {
         return Types[type].skinAmount * idealWeight / Types[type].weight;
      }
      
      public function get produces() : *
      {
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:Array = [];
         if(Types[type].produces is Array)
         {
            _loc2_ = _loc2_.concat(Types[type].produces);
         }
         if(gender == 2 && Types[type].milk is Object && agePeriod > 2)
         {
            _loc3_ = 1;
            if(remainingLactation > 0)
            {
               _loc3_ = 2;
            }
            if(pregnant)
            {
               _loc3_ *= 1 + 0.3 * (1 - remainingPregnancy / Types[type].gestation);
            }
            _loc3_ *= weight / Types[type].weight;
            if(age > maxAge * 0.7)
            {
               _loc3_ *= Math.max(1 - (age - maxAge * 0.7) / maxAge * 5,0);
            }
            if(hunger > 0)
            {
               _loc3_ *= 1 - Math.min(hunger / 50,1);
            }
            if(thirst > 0)
            {
               _loc3_ *= 1 - Math.min(thirst / 30,1);
            }
            if(_loc3_ > 0.01)
            {
               _loc2_.push({
                  "item":Types[type].milk.item,
                  "amount":Types[type].milk.amount * _loc3_
               });
            }
         }
         _loc1_ = [];
         for(_loc4_ in _loc2_)
         {
            _loc1_[_loc4_] = {
               "item":_loc2_[_loc4_].item,
               "amount":_loc2_[_loc4_].amount
            };
         }
         return _loc1_;
      }
      
      public function get electricityProduction() : *
      {
         return 0;
      }
      
      public function get electricityConsumption() : *
      {
         return 0;
      }
      
      public function get production() : *
      {
         return produces;
      }
      
      public function get consumption() : *
      {
         var _loc1_:Array = [];
         if(forageConsumption > 0)
         {
            _loc1_.push({
               "item":62,
               "amount":forageConsumption
            });
         }
         if(milkConsumption > 0)
         {
            _loc1_.push({
               "item":Types[type].milk.item,
               "amount":milkConsumption
            });
         }
         if(waterConsumption > 0)
         {
            _loc1_.push({
               "item":1,
               "amount":waterConsumption
            });
         }
         return _loc1_;
      }
      
      public function get health() : *
      {
         if(_health > maxHealth)
         {
            _health = maxHealth;
         }
         return _health;
      }
      
      public function set health(param1:*) : *
      {
         _health = param1;
      }
      
      public function get HP() : *
      {
         return health;
      }
      
      public function get maxHealth() : *
      {
         if(agePeriod < 3)
         {
            return _maxHealth * Math.max(age / Types[type].maturity,0.1);
         }
         return _maxHealth;
      }
      
      public function set maxHealth(param1:*) : *
      {
         _maxHealth = param1;
      }
      
      public function get idealWeight() : *
      {
         if(agePeriod < 3)
         {
            return Math.round(Math.max(_idealWeight / 10,_idealWeight * age / Types[type].maturity));
         }
         return _idealWeight;
      }
      
      public function set idealWeight(param1:*) : *
      {
         _idealWeight = param1;
      }
      
      public function get fuelConsumption() : *
      {
         return Types[type].fuelConsumption;
      }
      
      public function get capacity() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(category == 1)
         {
            if(agePeriod == 1)
            {
               _loc1_ = 0;
            }
            else
            {
               _loc1_ = Types[type].capacity * maxHealth / Types[type].maxHealth;
               _loc1_ *= weight / idealWeight;
               if(agePeriod > 3)
               {
                  _loc1_ *= 1 - (age - maxAge * 0.8) / (maxAge * 0.2);
               }
            }
         }
         else
         {
            _loc1_ = Types[type].capacity;
         }
         if(category == 2 || category == 3)
         {
            _loc2_ = health / maxHealth;
            if(_loc2_ < 0.3)
            {
               _loc1_ *= _loc2_ * 3;
            }
         }
         return _loc1_;
      }
      
      public function get speed() : *
      {
         return Types[type].speed;
      }
      
      public function get droughtTolerance() : *
      {
         return Types[type].droughtTolerance;
      }
      
      public function get price() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = Types[type].price;
         if(category == 1)
         {
            _loc1_ *= weight / Types[type].weight;
            if(gender == 1)
            {
               _loc1_ *= 0.9;
            }
            else
            {
               _loc1_ *= 1.1;
            }
            if(age > maxAge * 0.7)
            {
               _loc1_ *= 1 - (age - maxAge * 0.7) / (maxAge - maxAge * 0.7);
            }
            if(agePeriod == 1)
            {
               _loc1_ *= age / Types[type].lactation;
            }
            if(agePeriod == 2)
            {
               _loc1_ *= 1 + (Types[type].maturity - age) / (Types[type].maturity - Types[type].lactation) * 0.5;
            }
         }
         if(category == 1)
         {
            _loc1_ -= (maxHealth - health) * 20;
         }
         if(category == 2)
         {
            _loc1_ -= (maxHealth - health) * 25;
         }
         if(category == 3)
         {
            _loc1_ -= (maxHealth - health) * 70;
         }
         if(category == 1)
         {
            _loc2_ = new Item(meat,1);
            _loc1_ = Math.max(_loc1_,_loc2_.itemData.price * meatAmount + skinAmount * Item.Goods[23].price);
         }
         return Math.round(Math.max(_loc1_,0));
      }
      
      public function get forageConsumption() : *
      {
         if(agePeriod == 1)
         {
            return 0;
         }
         return Types[type].forageConsumption * idealWeight / Types[type].weight;
      }
      
      public function get waterConsumption() : *
      {
         if(agePeriod == 1)
         {
            return 0;
         }
         return Types[type].waterConsumption * idealWeight / Types[type].weight;
      }
      
      public function get milkConsumption() : *
      {
         if(agePeriod > 1)
         {
            return 0;
         }
         return Types[type].milkConsumption * idealWeight / Types[type].weight;
      }
      
      public function get maxPassengers() : *
      {
         return Types[type].passengers;
      }
      
      public function get maxPassengersWithCart() : *
      {
         if(cart is TransportUnit)
         {
            return cart.maxPassengers;
         }
         return maxPassengers;
      }
      
      public function get passengerSpacesOccupied() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = 0;
         for(_loc2_ in Passengers)
         {
            _loc1_ += Passengers[_loc2_].passengerSpaces;
         }
         return _loc1_;
      }
      
      public function removeAllPassengers() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in Passengers)
         {
            Passengers[_loc1_].passengerIn = null;
         }
         Passengers = [];
      }
      
      public function get passengersWeight() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = 0;
         for(_loc2_ in Passengers)
         {
            _loc1_ += Passengers[_loc2_].weight;
         }
         return _loc1_;
      }
      
      public function get passengerSpaces() : *
      {
         if(category == 1)
         {
            return Math.max(Math.round(Types[type].passengerSpaces * weight / Types[type].weight),1);
         }
         return Types[type].passengerSpaces;
      }
      
      public function normalizePassengers() : *
      {
         var _loc1_:Array = [];
         while(Passengers.length > 0 && (passengersWeight > capacityWithCart || passengerSpacesOccupied > maxPassengersWithCart))
         {
            _loc1_.push(Passengers[Passengers.length - 1]);
            Passengers[Passengers.length - 1].removeFromPassengers();
            if(Passengers.length <= 0)
            {
               break;
            }
         }
         return _loc1_;
      }
      
      public function get multiplication() : *
      {
         var _loc1_:* = Types[type].multiplication;
         var _loc2_:Number = health / maxHealth;
         if(_loc2_ < 0.2)
         {
            _loc1_ *= _loc2_ + 0.8;
         }
         return _loc1_;
      }
      
      public function removePassenger(param1:*) : *
      {
         Passengers.splice(Passengers.indexOf(param1),1);
         param1.passengerIn = null;
      }
      
      public function removeFromPassengers() : *
      {
         if(passengerIn is TransportUnit)
         {
            passengerIn.removePassenger(this);
         }
      }
      
      public function get capacityWithCart() : *
      {
         if(category == 2)
         {
            return 0;
         }
         if(cart is TransportUnit)
         {
            return Math.min(capacity * cart.multiplication - cart.weight,cart.capacity);
         }
         return capacity;
      }
      
      public function get category() : *
      {
         return Types[type].category;
      }
      
      public function get width() : *
      {
         if(direction == 1 || direction == 3)
         {
            return Types[type].height;
         }
         return Types[type].width;
      }
      
      public function get height() : *
      {
         if(direction == 1 || direction == 3)
         {
            return Types[type].width;
         }
         return Types[type].height;
      }
      
      public function get widthWithCart() : *
      {
         var _loc1_:* = width;
         if((direction == 1 || direction == 3) && cart is TransportUnit)
         {
            _loc1_ += cart.width;
         }
         return _loc1_;
      }
      
      public function get heightWithCart() : *
      {
         var _loc1_:* = height;
         if((direction == 0 || direction == 2) && cart is TransportUnit)
         {
            _loc1_ += cart.height;
         }
         return _loc1_;
      }
      
      public function get imageWidth() : *
      {
         return Types[type].imageWidth;
      }
      
      public function get imageHeight() : *
      {
         return Types[type].imageHeight;
      }
      
      public function get elevation() : *
      {
         return Types[type].elevation;
      }
      
      public function get zHeight() : *
      {
         return Types[type].zHeight;
      }
      
      public function get armor() : *
      {
         return Types[type].armor;
      }
      
      public function get fireResistance() : *
      {
         return Types[type].fireResistance;
      }
      
      public function get explosionResistance() : *
      {
         return Types[type].explosionResistance;
      }
      
      public function get picture() : *
      {
         var _loc1_:ImportedBitmap = new ImportedBitmap("transportIcon" + type + ".png");
         _loc1_.smoothing = true;
         return _loc1_;
      }
      
      public function get name() : *
      {
         if(givenName is String)
         {
            return givenName;
         }
         return Texts.fetch(Types[type].name);
      }
      
      public function get dead() : *
      {
         return health <= 0;
      }
      
      public function get segments() : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc1_:* = [];
         switch(direction)
         {
            case 0:
               _loc1_ = Types[type].segments;
               break;
            case 1:
               for(_loc3_ in Types[type].segments)
               {
                  _loc1_[_loc3_] = {
                     "x":1 - Types[type].segments[_loc3_].y - width + 1,
                     "y":Types[type].segments[_loc3_].x,
                     "end":Types[type].segments[_loc3_].end
                  };
               }
               break;
            case 2:
               for(_loc3_ in Types[type].segments)
               {
                  _loc1_[_loc3_] = {
                     "x":1 - Types[type].segments[_loc3_].x,
                     "y":1 - Types[type].segments[_loc3_].y - height + 1,
                     "end":Types[type].segments[_loc3_].end
                  };
               }
               break;
            case 3:
               for(_loc3_ in Types[type].segments)
               {
                  _loc1_[_loc3_] = {
                     "x":Types[type].segments[_loc3_].y,
                     "y":1 - Types[type].segments[_loc3_].x,
                     "end":Types[type].segments[_loc3_].end
                  };
               }
         }
         if(direction == 3)
         {
            for(_loc3_ in Types[type].segments)
            {
               _loc2_ = Types[type].segments[_loc3_];
               Types[type].segments[_loc3_] = Types[type].segments[Types[type].segments.length - 1 - _loc3_];
               Types[type].segments[Types[type].segments.length - 1 - _loc3_] = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function getInfoPairs(param1:* = false) : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         if(category == 1)
         {
            _loc2_.push({
               "name":Texts.fetch(50).toUpperCase(),
               "value":Math.round(health) + "/" + Math.round(maxHealth),
               "key":"health"
            });
         }
         else
         {
            _loc2_.push({
               "name":Texts.fetch(1153).toUpperCase(),
               "value":Math.round(health) + "/" + Math.round(maxHealth),
               "key":"health"
            });
         }
         if(category == 1)
         {
            _loc2_.push({
               "name":Texts.fetch(1527).toUpperCase(),
               "key":"gender"
            });
            if(gender == 1)
            {
               _loc2_[_loc2_.length - 1].value = Texts.fetch(2875).toUpperCase();
            }
            else
            {
               _loc2_[_loc2_.length - 1].value = Texts.fetch(2876).toUpperCase();
            }
            _loc4_ = Math.floor(age / 30);
            if(_loc4_ < 12)
            {
               _loc6_ = _loc4_ + " " + Texts.fetch(1167).toUpperCase();
            }
            else
            {
               _loc6_ = Math.floor(_loc4_ / 12) + " " + Texts.abbreviation(1168).toUpperCase() + " " + _loc4_ % 12 + " " + Texts.abbreviation(1167).toUpperCase();
            }
            _loc2_.push({
               "name":Texts.fetch(1166).toUpperCase(),
               "value":_loc6_,
               "key":"age"
            });
            _loc2_.push({
               "name":Texts.fetch(996).toUpperCase(),
               "value":MathFunctions.NumberFormat(weight,0) + " " + Texts.fetch(12),
               "key":"weight"
            });
         }
         _loc2_.push({
            "name":Texts.fetch(1155).toUpperCase(),
            "value":Math.round(capacity),
            "key":"maxLoad"
         });
         _loc2_.push({
            "name":Texts.fetch(899).toUpperCase(),
            "value":maxPassengers,
            "key":"passengers"
         });
         if(category != 2)
         {
            if(windPowered)
            {
               _loc2_.push({
                  "name":Texts.fetch(6).toUpperCase(),
                  "value":MathFunctions.NumberFormat(speed * 100,0,true) + "%",
                  "key":"speed"
               });
            }
            else
            {
               _loc2_.push({
                  "name":Texts.fetch(6).toUpperCase(),
                  "value":MathFunctions.NumberFormat(speed,1,true),
                  "key":"speed"
               });
            }
         }
         if(category == 1)
         {
            if(agePeriod == 1)
            {
               _loc2_.push({
                  "name":Texts.fetch(1173).toUpperCase(),
                  "value":MathFunctions.NumberFormat(milkConsumption,1,true),
                  "key":"milkConsumption"
               });
            }
            else
            {
               _loc2_.push({
                  "name":Texts.fetch(1156).toUpperCase(),
                  "value":MathFunctions.NumberFormat(forageConsumption,1,true),
                  "key":"forageConsumption"
               });
               _loc2_.push({
                  "name":Texts.fetch(1137).toUpperCase(),
                  "value":MathFunctions.NumberFormat(waterConsumption,1,true),
                  "key":"waterConsumption"
               });
            }
            _loc3_ = production;
            if(_loc3_.length > 0)
            {
               _loc2_.push({
                  "name":Texts.fetch(1241).toUpperCase(),
                  "key":"productionTitle"
               });
               for(_loc5_ in _loc3_)
               {
                  _loc2_.push({
                     "name":new Item(_loc3_[_loc5_].item,1).name.toUpperCase(),
                     "value":MathFunctions.NumberFormat(_loc3_[_loc5_].amount,1,true),
                     "key":"production" + _loc5_
                  });
               }
            }
         }
         if(category == 2)
         {
            _loc2_.push({
               "name":Texts.fetch(1161).toUpperCase(),
               "value":multiplication,
               "key":"capacityMultiplier"
            });
            _loc2_.push({
               "name":Texts.fetch(996).toUpperCase(),
               "value":MathFunctions.NumberFormat(weight,0) + " " + Texts.fetch(12),
               "key":"weight"
            });
         }
         if(category == 3)
         {
            if(windPowered)
            {
               _loc2_.push({
                  "name":Texts.fetch(6379).toUpperCase(),
                  "key":"windPowered"
               });
            }
            else
            {
               _loc2_.push({
                  "name":Texts.fetch(1162).toUpperCase(),
                  "value":MathFunctions.NumberFormat(fuelConsumption,2,true),
                  "key":"fuelConsumption"
               });
               _loc2_.push({
                  "name":Texts.fetch(1237).toUpperCase(),
                  "value":MathFunctions.NumberFormat(fuelTank,2,true),
                  "key":"fuelTankCapacity"
               });
            }
         }
         return _loc2_;
      }
      
      public function get yCorrection() : *
      {
         if(Types[type].yCorrection != undefined)
         {
            return Types[type].yCorrection;
         }
         return 0;
      }
      
      internal function remove() : *
      {
         ownContainer = null;
         Shadow = null;
         attachedTo = null;
         cart = null;
         Passengers = null;
         passengerIn = null;
         mother = null;
         pregnantWith = null;
         originallyBelongedTo = null;
      }
   }
}

