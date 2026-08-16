package IsoEngine
{
   import Data.*;
   
   public class Town
   {
      
      public static const variablesToSave:* = ["cycleCounter","type","population","incompleteProduction","electricityPrice","money","playersStorageSpace","playersIncompleteProduction","playersMoney","unemployed","prices","tax","allowsSlaves","historicalData","GDPperCapita","active","discovered","altName","illegalActions","_bannedGoods","_specialPrices","_faction","_entranceControl","_constantPopulation"];
      
      public var cycleCounter:*;
      
      public var type:*;
      
      public var locations:*;
      
      public var people:*;
      
      public var population:*;
      
      public var industries:*;
      
      public var stock:*;
      
      public var incompleteProduction:*;
      
      public var electricityPrice:*;
      
      public var money:*;
      
      public var playersIndustries:*;
      
      public var playersStorage:*;
      
      public var playersStorageSpace:*;
      
      public var playersIncompleteProduction:*;
      
      public var playersMoney:*;
      
      public var unemployed:*;
      
      public var prices:*;
      
      public var tax:*;
      
      public var allowsSlaves:*;
      
      public var illegalActions:*;
      
      public var _constantPopulation:*;
      
      public var historicalData:*;
      
      public var GDPperCapita:* = null;
      
      public var active:* = true;
      
      public var discovered:* = false;
      
      public var altName:*;
      
      public var GD:*;
      
      public var _bannedGoods:*;
      
      public var _specialPrices:*;
      
      public var _faction:*;
      
      public var _entranceControl:*;
      
      public function Town(param1:* = undefined, param2:* = null)
      {
         var _loc8_:* = undefined;
         var _loc12_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc5_:* = undefined;
         var _loc10_:* = undefined;
         var _loc13_:* = undefined;
         var _loc6_:* = undefined;
         super();
         GD = param2;
         playersIndustries = [];
         playersStorage = [];
         playersIncompleteProduction = [];
         playersStorageSpace = 0;
         playersMoney = 0;
         illegalActions = [];
         historicalData = [];
         prices = [];
         cycleCounter = MathFunctions.random(0,720 - 1);
         stock = [];
         incompleteProduction = [];
         people = [];
         if(param1 != undefined)
         {
            type = param1;
         }
         tax = Presets.Towns[type].tax;
         population = Presets.Towns[type].population;
         allowsSlaves = Presets.Towns[type].allowsSlaves;
         money = Math.round(population * Math.random() * 10000);
         if(Presets.Towns[type].defaultStorage > 0)
         {
            playersStorageSpace = Presets.Towns[type].defaultStorage;
         }
         electricityPrice = Presets.Towns[type].electricityPrice;
         locations = [];
         for(_loc7_ in Presets.Towns[type].locations)
         {
            locations[_loc7_] = {
               "visible":Presets.Towns[type].locations[_loc7_].visible,
               "name":Presets.Towns[type].locations[_loc7_].name
            };
            locations[_loc7_].stock = [];
            locations[_loc7_].slaves = [];
            locations[_loc7_].transport = [];
            locations[_loc7_].assortment = [];
            locations[_loc7_].transportAssortment = [];
            locations[_loc7_].slavesAmount = 0;
            locations[_loc7_].money = MathFunctions.random(1000,10000);
            if(Presets.Towns[type].locations[_loc7_].assortment is Array)
            {
               for(_loc8_ in Presets.Towns[type].locations[_loc7_].assortment)
               {
                  locations[_loc7_].assortment[_loc8_] = {
                     "item":Presets.Towns[type].locations[_loc7_].assortment[_loc8_].item,
                     "amount":Presets.Towns[type].locations[_loc7_].assortment[_loc8_].amount
                  };
                  locations[_loc7_].money += Item.getDataFromType(locations[_loc7_].assortment[_loc8_].item).price;
                  _loc5_ = Presets.Towns[type].locations[_loc7_].assortment[_loc8_].amount * (0.8 + Math.random() * 0.4);
                  _loc10_ = new Item(Presets.Towns[type].locations[_loc7_].assortment[_loc8_].item,1);
                  if(!_loc10_.divisible)
                  {
                     _loc5_ = Math.round(_loc5_);
                  }
                  if(_loc5_ > 0)
                  {
                     addToStock(locations[_loc7_].assortment[_loc8_].item,_loc5_,locations[_loc7_].stock);
                  }
               }
            }
            if(Presets.Towns[type].locations[_loc7_].transportAssortment is Array)
            {
               for(_loc8_ in Presets.Towns[type].locations[_loc7_].transportAssortment)
               {
                  locations[_loc7_].transportAssortment[_loc8_] = {
                     "type":Presets.Towns[type].locations[_loc7_].transportAssortment[_loc8_].type,
                     "amount":Presets.Towns[type].locations[_loc7_].transportAssortment[_loc8_].amount
                  };
                  _loc9_ = 1;
                  while(_loc9_ <= locations[_loc7_].transportAssortment[_loc8_].amount)
                  {
                     locations[_loc7_].transport.push(new TransportUnit(locations[_loc7_].transportAssortment[_loc8_].type)) - 1;
                     locations[_loc7_].money += locations[_loc7_].transport[locations[_loc7_].transport.length - 1].price;
                     _loc9_++;
                  }
               }
            }
            if(Presets.Towns[type].locations[_loc7_].slavesAmount > 0)
            {
               locations[_loc7_].slavesAmount = Presets.Towns[type].locations[_loc7_].slavesAmount;
            }
            _loc13_ = Math.round(locations[_loc7_].slavesAmount * Math.random());
            _loc8_ = 1;
            while(_loc8_ <= _loc13_)
            {
               locations[_loc7_].slaves.push(new Character({"category":4}));
               locations[_loc7_].money += locations[_loc7_].slaves[locations[_loc7_].slaves.length - 1].price;
               _loc8_++;
            }
            if(Presets.Towns[type].locations[_loc7_].margin != undefined)
            {
               locations[_loc7_].margin = Presets.Towns[type].locations[_loc7_].margin;
            }
            else
            {
               locations[_loc7_].margin = 0;
            }
            if(Presets.Towns[type].locations[_loc7_].relPrice != undefined)
            {
               locations[_loc7_].relPrice = Presets.Towns[type].locations[_loc7_].relPrice;
            }
            else
            {
               locations[_loc7_].relPrice = 1;
            }
            if(Presets.Towns[type].locations[_loc7_].surgeries is Array)
            {
               locations[_loc7_].surgeries = Presets.Towns[type].locations[_loc7_].surgeries;
            }
            if(Presets.Towns[type].locations[_loc7_].category == 3)
            {
               locations[_loc7_].character = Presets.Towns[type].locations[_loc7_].character;
            }
            if(Presets.Towns[type].locations[_loc7_].category == 4)
            {
               locations[_loc7_].people = [];
            }
         }
         industries = [];
         var _loc11_:* = 0;
         for(_loc7_ in Presets.Towns[type].industries)
         {
            industries[_loc7_] = new Industry(Presets.Towns[type].industries[_loc7_].type,Presets.Towns[type].industries[_loc7_].volume,this);
            if(!Industry.Types[industries[_loc7_].type].replaceEmployeesBySize)
            {
               _loc11_ += Presets.Towns[type].industries[_loc7_].volume;
            }
            industries[_loc7_].forSale = Presets.Towns[type].industries[_loc7_].forSale;
            _loc12_ = industries[_loc7_].production;
            for(_loc8_ in _loc12_)
            {
               if(_loc12_[_loc8_].item == 97)
               {
                  money += Math.round(_loc12_[_loc8_].amount * Math.random() * 1);
               }
               else
               {
                  addToStock(_loc12_[_loc8_].item,Math.round(_loc12_[_loc8_].amount * Math.random() * 1));
               }
            }
            _loc4_ = industries[_loc7_].consumption;
            for(_loc8_ in _loc4_)
            {
               addToStock(_loc4_[_loc8_].item,Math.round(_loc4_[_loc8_].amount * Math.random() * 1));
            }
         }
         unemployed = Math.max(Math.round(population * 0.85 - _loc11_),0);
         var _loc3_:Object = {};
         if(!Presets.Towns[type].noPeopleToHire)
         {
            _loc6_ = Math.max(Math.round(unemployed / 2),Presets.Towns[type].obligatoryPeople.length);
            for(_loc7_ in Presets.Towns[type].obligatoryPeople)
            {
               people.push(new Character(Presets.Towns[type].obligatoryPeople[_loc7_]));
               if(Presets.Towns[type].obligatoryPeople[_loc7_].faction == undefined)
               {
                  people[people.length - 1].faction = faction;
               }
               people[people.length - 1].dontRemoveFromTown = true;
               _loc6_--;
            }
            _loc7_ = 1;
            while(_loc7_ <= _loc6_)
            {
               if(type == 52)
               {
                  _loc3_ = {"swordsExperience":MathFunctions.random(1000,10000)};
               }
               if(Presets.Towns[type].salaryCoefficient != undefined)
               {
                  _loc3_.salaryCoefficient = Presets.Towns[type].salaryCoefficient * (0.6 + Math.random() * 0.8);
               }
               if(Presets.Towns[type].maxAttributes != undefined)
               {
                  _loc3_.levelModifier = 0.8 + Math.random() * (Presets.Towns[type].maxAttributes - 0.8);
               }
               if(Presets.Towns[type].maxExperience != undefined)
               {
                  _loc3_.experienceModifier = 0.8 + Math.random() * (Presets.Towns[type].maxExperience - 0.8);
               }
               if(faction != undefined && Math.random() < 0.7)
               {
                  _loc3_.faction = faction;
               }
               else
               {
                  _loc3_.faction = MathFunctions.random(1,Presets.FactionRelations.length - 1);
               }
               people.push(new Character(_loc3_));
               _loc7_++;
            }
         }
      }
      
      public function get name() : *
      {
         if(altName != undefined)
         {
            return altName;
         }
         return Texts.fetch(Presets.Towns[type].name);
      }
      
      public function get x() : *
      {
         return Presets.Towns[type].x;
      }
      
      public function get y() : *
      {
         return Presets.Towns[type].y;
      }
      
      public function get constantPopulation() : *
      {
         if(_constantPopulation != undefined)
         {
            return _constantPopulation;
         }
         return Presets.Towns[type].constantPopulation;
      }
      
      public function set constantPopulation(param1:*) : *
      {
         _constantPopulation = param1;
      }
      
      public function get possibleIndustries() : *
      {
         if(Presets.Towns[type].possibleIndustries is Array)
         {
            return Presets.Towns[type].possibleIndustries;
         }
         return [];
      }
      
      public function addToStock(param1:*, param2:*, param3:* = null) : *
      {
         var _loc5_:* = undefined;
         var _loc4_:Boolean = false;
         if(param3 == null)
         {
            param3 = stock;
         }
         for(_loc5_ in param3)
         {
            if(param3[_loc5_].type == param1)
            {
               param3[_loc5_].amount += param2;
               _loc4_ = true;
               break;
            }
         }
         if(!_loc4_)
         {
            param3.push(new Item(param1,param2));
         }
      }
      
      public function removeFromStock(param1:*, param2:*, param3:* = null) : *
      {
         var _loc4_:* = undefined;
         if(param3 == null)
         {
            param3 = stock;
         }
         for(_loc4_ in param3)
         {
            if(param3[_loc4_].type == param1)
            {
               param3[_loc4_].amount -= param2;
               if(param3[_loc4_]._amount < 0.05)
               {
                  param3.splice(_loc4_,1);
               }
               break;
            }
         }
      }
      
      public function get occupiedPlayersStorageSpace() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = 0;
         for(_loc1_ in playersStorage)
         {
            if(playersStorage[_loc1_] is Item)
            {
               _loc2_ += playersStorage[_loc1_].weightPerUnit * playersStorage[_loc1_].amount;
            }
            else
            {
               _loc2_ += playersStorage[_loc1_].weight;
            }
         }
         return _loc2_;
      }
      
      public function get bannedGoods() : *
      {
         if(_bannedGoods is Array)
         {
            return _bannedGoods;
         }
         if(Presets.Towns[type].bannedGoods is Array)
         {
            return Presets.Towns[type].bannedGoods;
         }
         return [];
      }
      
      public function set bannedGoods(param1:*) : *
      {
         _bannedGoods = param1;
      }
      
      public function get faction() : *
      {
         if(_faction != undefined)
         {
            return _faction;
         }
         return Presets.Towns[type].faction;
      }
      
      public function set faction(param1:*) : *
      {
         _faction = param1;
      }
      
      public function get entranceControl() : *
      {
         if(_entranceControl != undefined)
         {
            return _entranceControl;
         }
         return Presets.Towns[type].entranceControl;
      }
      
      public function set entranceControl(param1:*) : *
      {
         _entranceControl = param1;
      }
      
      public function get storagePrice() : *
      {
         return Presets.Towns[type].storagePrice * wealthFactor;
      }
      
      public function get noticeability() : *
      {
         return Presets.Towns[type].noticeability;
      }
      
      public function get wealthFactor() : *
      {
         return Math.min(Math.max(GDPperCapita / 300,0.5),2.5);
      }
      
      public function get specialPrices() : *
      {
         if(_specialPrices != undefined)
         {
            return _specialPrices;
         }
         if(Presets.Towns[type].specialPrices != undefined)
         {
            return Presets.Towns[type].specialPrices;
         }
         return {};
      }
      
      public function set specialPrices(param1:*) : *
      {
         _specialPrices = param1;
      }
      
      public function getItemBasePrice(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         if(prices[param1] == undefined)
         {
            _loc2_ = Item.getDataFromType(param1).price;
         }
         else
         {
            _loc2_ = prices[param1];
         }
         if(specialPrices[param1] != undefined)
         {
            _loc2_ *= specialPrices[param1];
         }
         return _loc2_;
      }
      
      public function get perfectFoodPrice() : *
      {
         return GameData.foodAveragePrice * wealthFactor;
      }
      
      public function get totalFoodConsumption() : *
      {
         return population * (1500 + 200 * Math.pow(wealthFactor,0.5));
      }
      
      public function get foodConsumption() : *
      {
         return totalFoodConsumption;
      }
      
      public function get totalWaterConsumption() : *
      {
         return population * 2;
      }
      
      public function get upperBodyClothingConsumption() : *
      {
         if(type >= 17 && type <= 20)
         {
            return population * 0.02 * wealthFactor;
         }
         return population * 0.05 * wealthFactor;
      }
      
      public function get lowerBodyClothingConsumption() : *
      {
         return population * 0.03 * wealthFactor;
      }
      
      public function get shoesConsumption() : *
      {
         return population * 0.007 * wealthFactor;
      }
      
      public function get hatConsumption() : *
      {
         return population * 0.002 * Math.pow(wealthFactor,2);
      }
      
      public function generatePopulationConsumption(param1:* = 1) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:Array = [];
         _loc4_ = population * 0.2 * wealthFactor;
         if(wealthFactor < 0.6)
         {
            _loc4_ *= (0.7 - wealthFactor) * 10;
         }
         if(_loc4_ > 0)
         {
            _loc2_.push({
               "item":63,
               "amount":_loc4_
            });
         }
         if(type == 69)
         {
            _loc2_.push({
               "item":104,
               "amount":population * wealthFactor * 0.8
            });
         }
         else if(wealthFactor > 0.2 && population > 0)
         {
            _loc2_.push({
               "item":104,
               "amount":population * wealthFactor * 0.2
            });
         }
         if(type == 44)
         {
            _loc2_.push({
               "item":165,
               "amount":population * wealthFactor * 0.1
            });
         }
         else
         {
            _loc2_.push({
               "item":165,
               "amount":population * wealthFactor * 0.007
            });
         }
         _loc2_.push({
            "item":64,
            "amount":population * wealthFactor * 0.25
         });
         _loc2_.push({
            "item":79,
            "amount":population * wealthFactor * 0.025
         });
         _loc2_.push({
            "item":184,
            "amount":population * Math.pow(wealthFactor,1.5) * 0.016
         });
         _loc2_.push({
            "item":185,
            "amount":population * Math.pow(wealthFactor,2) * 0.001
         });
         _loc2_.push({
            "item":187,
            "amount":population * wealthFactor * 0.1
         });
         _loc2_.push({
            "item":188,
            "amount":population * Math.pow(wealthFactor,2) * 0.0025
         });
         _loc2_.push({
            "item":190,
            "amount":Math.pow(population,2) * wealthFactor * 0.00001
         });
         _loc2_.push({
            "item":197,
            "amount":population * wealthFactor * 0.06
         });
         if(population > 500 && wealthFactor > 1)
         {
            _loc2_.push({
               "item":205,
               "amount":population * 0.04 * wealthFactor
            });
         }
         for(var _loc3_ in _loc2_)
         {
            _loc2_[_loc3_].amount *= param1;
         }
         return _loc2_;
      }
      
      public function getConsumptionProduction(param1:* = null) : *
      {
         var _loc8_:* = undefined;
         var _loc11_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc12_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc16_:* = undefined;
         var _loc3_:Array = [];
         var _loc14_:* = 0;
         var _loc5_:Array = [];
         var _loc15_:Array = [];
         if(param1 == null)
         {
            param1 = [];
         }
         for(_loc8_ in industries)
         {
            _loc10_ = false;
            for(_loc11_ in param1)
            {
               if(param1[_loc11_] == industries[_loc8_])
               {
                  _loc10_ = true;
                  break;
               }
            }
            if(!_loc10_)
            {
               _loc9_ = industries[_loc8_].consumption;
               for(_loc7_ in _loc9_)
               {
                  _loc12_ = false;
                  if(Item.getDataFromType(_loc9_[_loc7_].item).food)
                  {
                     _loc5_.push({
                        "item":_loc9_[_loc7_].item,
                        "amount":_loc9_[_loc7_].amount
                     });
                  }
                  if(!_loc12_)
                  {
                     _loc16_ = false;
                     for(_loc11_ in _loc3_)
                     {
                        if(_loc3_[_loc11_].item == _loc9_[_loc7_].item)
                        {
                           _loc3_[_loc11_].consumption += _loc9_[_loc7_].amount;
                           _loc16_ = true;
                        }
                     }
                     if(!_loc16_)
                     {
                        _loc3_.push({
                           "item":_loc9_[_loc7_].item,
                           "production":0,
                           "consumption":_loc9_[_loc7_].amount
                        });
                     }
                  }
               }
            }
         }
         for(_loc8_ in industries)
         {
            _loc10_ = false;
            for(_loc11_ in param1)
            {
               if(param1[_loc11_] == industries[_loc8_])
               {
                  _loc10_ = true;
                  break;
               }
            }
            if(!_loc10_)
            {
               _loc6_ = industries[_loc8_].production;
               for(_loc7_ in _loc6_)
               {
                  if(Item.getDataFromType(_loc6_[_loc7_].item).food)
                  {
                     _loc14_ += Item.getDataFromType(_loc6_[_loc7_].item).waterPercentage * _loc6_[_loc7_].amount;
                  }
                  _loc2_ = undefined;
                  if(Item.getDataFromType(_loc6_[_loc7_].item).food)
                  {
                     for(_loc11_ in _loc5_)
                     {
                        if(_loc5_[_loc11_].item == _loc6_[_loc7_].item)
                        {
                           _loc6_[_loc7_].amount -= _loc5_[_loc11_].amount;
                           _loc2_ = _loc5_[_loc11_].amount;
                        }
                     }
                  }
                  _loc12_ = false;
                  for(_loc11_ in GameData.itemCategories)
                  {
                     if(Item.getDataFromType(_loc6_[_loc7_].item)[GameData.itemCategories[_loc11_]])
                     {
                        if(GameData.itemCategories[_loc11_] == "food")
                        {
                           _loc4_ = _loc6_[_loc7_].amount * Item.getDataFromType(_loc6_[_loc7_].item).calories;
                        }
                        else
                        {
                           _loc4_ = _loc6_[_loc7_].amount;
                        }
                        if(_loc15_[GameData.itemCategories[_loc11_]] is Object)
                        {
                           _loc15_[GameData.itemCategories[_loc11_]].production += _loc4_;
                        }
                        else
                        {
                           _loc15_[GameData.itemCategories[_loc11_]] = {
                              "production":_loc4_,
                              "consumption":0
                           };
                        }
                        _loc12_ = true;
                        break;
                     }
                  }
                  if(!_loc12_ || _loc2_ != undefined)
                  {
                     if(_loc2_ != undefined)
                     {
                        _loc6_[_loc7_].amount = _loc2_;
                     }
                     _loc16_ = false;
                     for(_loc11_ in _loc3_)
                     {
                        if(_loc3_[_loc11_].item == _loc6_[_loc7_].item)
                        {
                           _loc3_[_loc11_].production += _loc6_[_loc7_].amount;
                           _loc16_ = true;
                        }
                     }
                     if(!_loc16_)
                     {
                        _loc3_.push({
                           "item":_loc6_[_loc7_].item,
                           "production":_loc6_[_loc7_].amount,
                           "consumption":0
                        });
                     }
                  }
               }
            }
         }
         for(_loc7_ in GameData.itemCategories)
         {
            if(this[GameData.itemCategories[_loc7_] + "Consumption"] > 0)
            {
               if(_loc15_[GameData.itemCategories[_loc7_]] is Object)
               {
                  _loc15_[GameData.itemCategories[_loc7_]].consumption += this[GameData.itemCategories[_loc7_] + "Consumption"];
               }
               else
               {
                  _loc15_[GameData.itemCategories[_loc7_]] = {
                     "consumption":this[GameData.itemCategories[_loc7_] + "Consumption"],
                     "production":0
                  };
               }
            }
         }
         var _loc13_:* = generatePopulationConsumption();
         for(_loc7_ in _loc13_)
         {
            _loc16_ = false;
            for(_loc8_ in _loc3_)
            {
               if(_loc3_[_loc8_].item == _loc13_[_loc7_].item)
               {
                  _loc3_[_loc8_].consumption += _loc13_[_loc7_].amount;
                  _loc16_ = true;
                  break;
               }
            }
            if(!_loc16_)
            {
               _loc3_.push({
                  "item":_loc13_[_loc7_].item,
                  "production":0,
                  "consumption":_loc13_[_loc7_].amount
               });
            }
         }
         for(_loc8_ in _loc3_)
         {
            if(_loc3_[_loc8_].item == 1)
            {
               _loc3_[_loc8_].consumption += totalWaterConsumption;
               _loc16_ = true;
               break;
            }
         }
         if(!_loc16_)
         {
            _loc3_.push({
               "item":1,
               "production":0,
               "consumption":totalWaterConsumption
            });
         }
         return {
            "productsList":_loc3_,
            "categoryProducts":_loc15_
         };
      }
      
      public function get slavePrices() : *
      {
         if(Presets.Towns[type].slavePrices != undefined)
         {
            return Presets.Towns[type].slavePrices;
         }
         return 1;
      }
      
      public function abolishSlavery() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         trace("slavery in " + name + " is abolished");
         allowsSlaves = false;
         for(_loc1_ in locations)
         {
            if(locations[_loc1_].slaves.length > 0)
            {
               for(_loc2_ in locations[_loc1_].slaves)
               {
                  locations[_loc1_].slaves[_loc2_].category = 2;
                  people.push(locations[_loc1_].slaves[_loc2_]);
               }
               population += locations[_loc1_].slaves.length;
               unemployed += locations[_loc1_].slaves.length;
               trace(locations[_loc1_].slaves.length + " slaves pass to the civil population");
               locations[_loc1_].slaves = [];
            }
         }
      }
      
      public function remove() : *
      {
         GD = null;
      }
   }
}

