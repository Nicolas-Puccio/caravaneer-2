package IsoEngine
{
   import Data.*;
   import Interface.*;
   import com.gskinner.utils.Rndm;
   import flash.display.*;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.media.SoundTransform;
   import flash.net.*;
   import flash.system.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public class GameData
   {      
      public static var foodAveragePrice:*;
      
      public static var upperBodyClothingAveragePrice:*;
      
      public static var lowerBodyClothingAveragePrice:*;
      
      public static var shoesAveragePrice:*;
      
      public static var hatAveragePrice:*;
      
      public static var currentGame:*;
      
      public static var chargers:*;
      
      public static var localStorageError:*;
      
      internal static var processedObjects:*;
      
      internal static var undeletableObjects:*;
      
      internal static var processedObjectsNames:*;
      
      public static var TravelModeMusic:Class = §Caravaneer2-192KBps_mp3$f86c7687a93d4e5946e77b1fd9a8131b-1416848272§;
      
      public static const magicMode:* = false;
      
      public static const healAnimalPrice:* = 20;
      
      public static const healPersonPrice:* = 40;
      
      public static const repairCartPrice:* = 25;
      
      public static const repairCarPrice:* = 70;
      
      public static const mapModeTimeMultiplier:* = 4;
      
      public static const startIndustryMultiplier:* = 3;
      
      public static const eyeSurgeryPrice:* = 10000;
      
      public static const armSurgeryPrice:* = 6000;
      
      public static const legSurgeryPrice:* = 8000;
      
      public static const peopleCycleLength:* = 360;
      
      public static const transportCycleLength:* = 360;
      
      public static const caravanCycleLength:* = 360;
      
      public static const townCycleLength:* = 720;
      
      public static const rehireVolunteerMorale:* = 50;
      
      public static const rehireMercenaryMorale:* = 30;
      
      public static const hirePrisonerMorale:* = 30;
      
      public static const hireSlaveMorale:* = 40;
      
      public static const downsizeIndustriesRate:* = 0.35;
      
      public static const sellIndustriesRate:* = 0.55;
      
      public static const medsDosage:* = [0,5,10,20,50];
      
      public static var averageSlavePrice:* = 5000;
      
      public static var averageGDPperCapita:* = 400;
      
      public static var soundFXOn:* = true;
      
      public static var musicOn:* = true;
      
      public static const priceAmplification:* = 1;
      
      public static const minPricePercentage:* = 0.8;
      
      public static const itemCategories:* = ["food","upperBodyClothing","lowerBodyClothing","shoes","hat"];
      
      public static const itemCategoryNames:* = {
         "food":15,
         "upperBodyClothing":1413,
         "lowerBodyClothing":1414,
         "shoes":1306,
         "hat":1003
      };
      
      public static const huntingItems:* = [{
         "item":45,
         "amount":0.15
      },{
         "item":71,
         "amount":0.25
      },{
         "item":73,
         "amount":0.25
      },{
         "item":75,
         "amount":0.35
      }];
      
      public static const huntingEggs:* = [{
         "item":72,
         "amount":0.5
      },{
         "item":74,
         "amount":0.5
      }];
      
      public static const workersPercentage:* = 0.85;
      
      public static var workshopRecipes:* = [{//-0
         "outcome":61,
         "outcomeAmount":1,
         "requiredMaterials":[{
            "type":65,
            "amount":1
         },{
            "type":64,
            "amount":0.8
         },{
            "type":79,
            "amount":0.1
         },{
            "type":94,
            "amount":0.1
         }],
         "requiredTools":[],
         "requiredSkills":[{
            "skill":"mechanic",
            "min":30
         }],
         "perDay":15
      },{//-1
         "outcome":103,
         "outcomeAmount":1,
         "requiredMaterials":[{
            "type":94,
            "amount":0.5
         },{
            "type":63,
            "amount":20
         },{
            "type":93,
            "amount":0.1
         },{
            "type":104,
            "amount":0.3
         }],
         "requiredTools":[],
         "requiredSkills":[{
            "skill":"doctor",
            "min":100
         }],
         "perDay":5
      },{//-2
         "outcome":109,
         "outcomeAmount":1,
         "requiredMaterials":[{
            "type":94,
            "amount":2
         }],
         "requiredTools":[],
         "requiredSkills":[{
            "skill":"mechanic",
            "min":90
         }],
         "perDay":5
      },{//-3
         "outcome":94,
         "outcomeAmount":2,
         "requiredMaterials":[{
            "type":109,
            "amount":1
         }],
         "requiredTools":[],
         "requiredSkills":[],
         "perDay":50
      },{//-4
         "outcome":94,
         "outcomeAmount":2,
         "requiredMaterials":[{
            "type":110,
            "amount":1
         },{
            "type":185,
            "amount":0.03
         },{
            "type":1,
            "amount":4
         }],
         "requiredTools":[],
         "requiredSkills":[{
            "skill":"mechanic",
            "min":30
         }],
         "perDay":5
      },{//-5
         "outcome":94,
         "outcomeAmount":2,
         "requiredMaterials":[{
            "type":111,
            "amount":1
         },{
            "type":185,
            "amount":0.05
         },{
            "type":1,
            "amount":4
         }],
         "requiredTools":[],
         "requiredSkills":[{
            "skill":"mechanic",
            "min":35
         }],
         "perDay":2
      }];
      
      public static const reputationNames:* = [null,2180,2181,2182,2183,2184,2185,2186,4289];
      
      public static var missionDescriptions:* = [null,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213,2214,2515,2629,2634,3078,3079,3080,3158,3233,3238,3353,3457,3524,4135,4387,4674,4748,4807,4917,4942,5229,5266,5403,5769,6113,6335,6543,6544,6545,6642,6654,6658,6659,6663,6667,6670,6673,6730];
      
      public static const languages:* = [{
         "ind":1,
         "name":"English US / International",
         "enabled":true
      },{
         "ind":2,
         "name":"English UK",
         "enabled":false
      },{
         "ind":3,
         "name":"Spanish (Iberian)",
         "enabled":true
      },{
         "ind":4,
         "name":"Spanish (Latin American)",
         "enabled":true
      },{
         "ind":5,
         "name":"French",
         "enabled":false
      },{
         "ind":6,
         "name":"Portuguese (European)",
         "enabled":false
      },{
         "ind":7,
         "name":"Portuguese (Brazilian)",
         "enabled":true
      },{
         "ind":31,
         "name":"Italian",
         "enabled":false
      },{
         "ind":8,
         "name":"German",
         "enabled":true
      },{
         "ind":24,
         "name":"Swedish",
         "enabled":false
      },{
         "ind":16,
         "name":"Danish",
         "enabled":false
      },{
         "ind":22,
         "name":"Norwegian",
         "enabled":false
      },{
         "ind":9,
         "name":"Icelandic",
         "enabled":false
      },{
         "ind":17,
         "name":"Finnish",
         "enabled":false
      },{
         "ind":34,
         "name":"Estonian",
         "enabled":false
      },{
         "ind":23,
         "name":"Lithuanian",
         "enabled":false
      },{
         "ind":25,
         "name":"Latvian",
         "enabled":false
      },{
         "ind":13,
         "name":"Dutch",
         "enabled":true
      },{
         "ind":10,
         "name":"Romanian",
         "enabled":true
      },{
         "ind":14,
         "name":"Russian",
         "enabled":false
      },{
         "ind":11,
         "name":"Polish",
         "enabled":true
      },{
         "ind":45,
         "name":"Czech",
         "enabled":false
      },{
         "ind":35,
         "name":"Serbian",
         "enabled":false
      },{
         "ind":36,
         "name":"Croatian",
         "enabled":false
      },{
         "ind":33,
         "name":"Hungarian",
         "enabled":false
      },{
         "ind":12,
         "name":"Turkish",
         "enabled":false
      },{
         "ind":21,
         "name":"Greek",
         "enabled":false
      },{
         "ind":18,
         "name":"Chinese (Simplified)",
         "enabled":false
      },{
         "ind":19,
         "name":"Chinese (Traditional)",
         "enabled":true
      },{
         "ind":30,
         "name":"Japanese",
         "enabled":false
      },{
         "ind":20,
         "name":"Korean",
         "enabled":false
      },{
         "ind":27,
         "name":"Vietnamese",
         "enabled":false
      },{
         "ind":28,
         "name":"Filipino (Tagalog)",
         "enabled":false
      },{
         "ind":44,
         "name":"Thai",
         "enabled":false
      },{
         "ind":15,
         "name":"Bahasa (Malay)",
         "enabled":true
      },{
         "ind":32,
         "name":"Bahasa (Indonesian)",
         "enabled":false
      },{
         "ind":42,
         "name":"Basque",
         "enabled":false
      },{
         "ind":43,
         "name":"Catalan",
         "enabled":false
      },{
         "ind":29,
         "name":"Esperanto",
         "enabled":false
      },{
         "ind":26,
         "name":"Latin",
         "enabled":false
      },{
         "ind":37,
         "name":"Singlish",
         "enabled":false
      },{
         "ind":38,
         "name":"Pirate English",
         "enabled":false
      },{
         "ind":39,
         "name":"1337",
         "enabled":false
      },{
         "ind":40,
         "name":"SWAG",
         "enabled":false
      },{
         "ind":41,
         "name":"Hillbilly / Redneck",
         "enabled":false
      }];
      
      public static const variablesToSave:* = ["seed","gameSpeed","doubleSpeed","tripleSpeed","difficulty","autoSave","adultContent","autoCenter","showGrid","walkAnimationSpeed","interactWithFriendlyCaravans","advancedTrading","pauseOnExitTown","Time","Squares","factionRelations","revealedFactions","mapCenterX","mapCenterY","mapScale","routeStart","routeEnd","globalPrices","storyMode","globalCounter","monthlyCounter","build","producedToday","sextantExperience","lastSextantPos","lastSextantOffset","lastSextantMeasurement","windDirection","windStrength","missingRoutes","updatingEconomy","itemsToUpdate","knownPrices","warnedAboutAdvancedTrading","distributeBatteries","transportAsPassengers","showTutorial","displayedTutorials","initiatedDLC","removedDLC","canBreakEconomy","customTowns"];
      
      public var customTowns:* = []

      public static const staticsToSave:* = ["foodAveragePrice","upperBodyClothingAveragePrice","lowerBodyClothingAveragePrice","shoesAveragePrice","hatAveragePrice","averageGDPperCapita","soundFXOn","musicOn"];
      
      public var seed:*;
      
      public var gameSpeed:* = 1;
      
      public var doubleSpeed:* = 2;
      
      public var tripleSpeed:* = 3;
      
      public var difficulty:* = 2;
      
      public var adultContent:* = false;
      
      public var autoCenter:* = false;
      
      public var showGrid:* = true;
      
      public var walkAnimationSpeed:* = 2;
      
      public var interactWithFriendlyCaravans:* = true;
      
      public var advancedTrading:* = false;
      
      public var pauseOnExitTown:* = false;
      
      public var autoSave:* = false;
      
      public var distributeBatteries:* = true;
      
      public var transportAsPassengers:* = false;
      
      public var showTutorial:* = false;
      
      public var displayedTutorials:*;
      
      public var initiatedDLC:*;
      
      public var removedDLC:*;
      
      public var canBreakEconomy:* = true;
      
      public const LOIS_SETTINGS:* = {
         "specialPortrait":2,
         "name":Texts.fetch(1833),
         "gender":2,
         "age":24,
         "physical":4,
         "agility":8,
         "accuracy":6,
         "intelligence":7,
         "portraitShoulders":1,
         "portraitShirt":1,
         "sleevesType":5,
         "portraitHair":2,
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
            "r":180,
            "g":180,
            "b":180,
            "bc":1
         },
         "pantsColor":{
            "r":0,
            "g":0,
            "b":0,
            "bc":1
         },
         "shoesColor":{
            "r":20,
            "g":10,
            "b":0,
            "bc":1
         },
         "hasRightBracelet":false,
         "hasLeftBracelet":false,
         "crossbowExperience":5000,
         "swordsExperience":10000,
         "painExperience":2000,
         "closeBattleExperience":13000,
         "rangedWeaponsExperience":7000,
         "generalBattleExperience":20000
      };
      
      public var Time:* = 2509568400;
      
      public var Caravans:*;
      
      public var waterNeed:* = 0;
      
      public var foodNeed:* = 0;
      
      public var Towns:*;
      
      public var Squares:*;
      
      public var mode:* = 0;
      
      public var factionRelations:*;
      
      public var revealedFactions:*;
      
      public var Story:*;
      
      public var mapCenterX:* = 1668;
      
      public var mapCenterY:* = 1735;
      
      public var mapScale:* = 1;
      
      public var routeStart:* = null;
      
      public var routeEnd:* = null;
      
      public var storyMode:* = false;
      
      public var globalCounter:* = 0;
      
      public var monthlyCounter:* = 0;
      
      public var globalPrices:*;
      
      public var build:*;
      
      public var producedToday:*;
      
      public var sextantExperience:* = 0;
      
      public var lastSextantPos:*;
      
      public var lastSextantOffset:*;
      
      public var lastSextantMeasurement:*;
      
      public var windDirection:* = 0;
      
      public var windStrength:* = 0;
      
      public var missingRoutes:*;
      
      public var updatingEconomy:* = false;
      
      public var itemsToUpdate:*;
      
      public var knownPrices:*;
      
      public var warnedAboutAdvancedTrading:* = false;
      
      public var currentScreenContainer:*;
      
      public var screenNode:*;
      
      public var parent:*;
      
      public var keepDialogues:*;
      
      public var lastCaravanMenuCategory:* = 2;
      
      public var lastTownCategory:* = 1;
      
      public var cameFromMode:*;
      
      public var mapMode:*;
      
      public var navigationMode:*;
      
      public var caravanMenu:*;
      
      public var skipPause:* = false;
      
      public var waitBox:*;
      
      public var waitBoxText:*;
      
      public var batteriesToRemove:*;
      
      public var tutorialOn:* = false;
      
      public var tutorialSprite:*;
      
      public var onTutorialProceed:*;
      
      public var tutorialGrid:*;
      
      public var tutorialMask:*;
      
      public var saveButtonReminder:*;
      
      public var travelModeMusic:*;
      
      public var travelModeMusicControl:*;
      
      public var musicPlaying:*;
      
      public var okButton:*;
      
      public var displayDLCIncompatibilityWarning:* = false;
      
      private var storeLoadObj:*;
      
      private var storeLoadPeople:*;
      
      private var storeLoadTransport:*;
      
      public const squareSize:* = 500;
      
      internal var suspendedTownMode:*;
      
      public function GameData(param1:*, param2:*, param3:* = null, param4:* = false, param5:* = 1, param6:* = null)
      {
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc8_:* = undefined;
         var _loc11_:* = undefined;
         displayedTutorials = [];
         initiatedDLC = [];
         removedDLC = [];
         Caravans = [];
         Towns = [];
         Squares = [];
         producedToday = [];
         lastSextantPos = [];
         missingRoutes = [];
         itemsToUpdate = [];
         knownPrices = [];
         super();
         travelModeMusicControl = new SoundTransform();
         okButton = new Sprite();
         okButton.graphics.beginFill(12632256);
         okButton.graphics.lineStyle(1,0);
         okButton.graphics.drawRect(0,0,140,20);
         okButton.graphics.endFill();
         okButton.addChild(new EngineText(Texts.fetch(6838).toUpperCase(),0,14,"center",5,0,130,20));
         okButton.mouseChildren = false;
         okButton.buttonMode = true;
         okButton.addEventListener("click",tutorialProceed,false,0,false);
         tutorialGrid = new Sprite();
         tutorialMask = new Sprite();
         tutorialGrid.blendMode = "layer";
         tutorialMask.blendMode = "erase";
         var _loc16_:* = new Bitmap(new BitmapData(880,495,true,0));
         _loc14_ = 0;
         while(_loc14_ < 880)
         {
            _loc15_ = 0;
            while(_loc15_ < 495)
            {
               if(MathFunctions.XOR(_loc14_ % 4 < 2,_loc15_ % 4 < 2))
               {
                  _loc16_.bitmapData.setPixel32(_loc14_,_loc15_,4278190080);
               }
               _loc15_++;
            }
            _loc14_++;
         }
         tutorialGrid.addChild(_loc16_);
         tutorialGrid.addChild(tutorialMask);
         chargers = [];
         for(_loc11_ in Item.Goods)
         {
            if(Item.Goods[_loc11_] is Object && Item.Goods[_loc11_].batteryCharge > 0)
            {
               chargers.push(Item.itemNumFromCatSubCat(1,_loc11_));
            }
         }
         currentGame = this;
         for(_loc11_ in workshopRecipes)
         {
            producedToday[_loc11_] = 0;
         }
         globalCounter = Time % 86400 - 54000;
         if(globalCounter < 0)
         {
            globalCounter += 86400;
         }
         difficulty = param5;
         _loc7_ = param3 == null;
         storyMode = param4;
         Story = new Caravaneer2MainStory();
         Story.finishedTheGame = true
         screenNode = param1;
         parent = param2;
         build = parent.build;
         var _loc10_:* = new ContextMenu();
         _loc10_.hideBuiltInItems();
         param1.addEventListener("menuSelect",contextMenuSelect,false,0,false);
         param1.contextMenu = _loc10_;
         if(_loc7_)
         {
            Caravans[0] = new Caravan();
            Caravans[0] = new Caravan();
            mapCenterX = Caravans[0].x = Presets.StartPosition.x;
            mapCenterY = Caravans[0].y = Presets.StartPosition.y;
            Caravans[0].direction = Presets.StartPosition.direction;
            Caravans[0].moving = Presets.StartPosition.moving;
            if(param6 == null)
            {
               Caravans[0].addPerson(new Character({
                  "age":30,
                  "gender":1,
                  "eyeSockets":1
               }));
            }
            else
            {
               Caravans[0].addPerson(param6);
            }
            Caravans[0].People[0].category = 1;
            Caravans[0].People[0].neverPanic = true;
            Caravans[0].People[0].weight = Caravans[0].People[0].idealWeight;
            Caravans[0].category = 0;
            for(_loc11_ in Presets.Towns)
            {
               Towns[_loc11_] = new Town(_loc11_,this);
               setSquareValue(Math.floor(Presets.Towns[_loc11_].x / 500),Math.floor(Presets.Towns[_loc11_].y / 500),"town",_loc11_);
               if(difficulty == 1)
               {
                  for(_loc12_ in Towns[_loc11_].people)
                  {
                     Towns[_loc11_].people[_loc12_].salaryCoefficient *= 0.7;
                  }
               }
            }
            for(_loc11_ in Presets.RandomGroups)
            {
               setGroupProbabilitiesArea(Presets.RandomGroups[_loc11_].x,Presets.RandomGroups[_loc11_].y,Presets.RandomGroups[_loc11_].type,Presets.RandomGroups[_loc11_].intensity,Presets.RandomGroups[_loc11_].radius);
            }
            Towns[15].stock = [];
            Towns[15].addToStock(1,250);
            Towns[15].addToStock(66,3);
            Towns[15].addToStock(67,2);
            Towns[15].addToStock(68,1);
            Towns[15].GDPperCapita = 6.3;
            //-Towns[15].playersStorage.push(new TransportUnit(13));//-umi alpha to bunker
            Towns[15].addToStock(2,1,Towns[15].playersStorage);
            Towns[15].addToStock(42,1,Towns[15].playersStorage);
            Towns[15].addToStock(229,1,Towns[15].playersStorage);
            Towns[21].addToStock(105,1,Towns[21].playersStorage);
            Towns[21].addToStock(106,1,Towns[21].playersStorage);
            Towns[21].addToStock(29,45,Towns[21].playersStorage);
            Towns[21].addToStock(80,1,Towns[21].playersStorage);
            Towns[21].addToStock(65,10,Towns[21].playersStorage);
            Towns[21].addToStock(1,8,Towns[21].playersStorage);
            Towns[21].addToStock(71,1.3,Towns[21].playersStorage);
            Towns[21].addToStock(73,0.8,Towns[21].playersStorage);
            Towns[21].addToStock(75,3,Towns[21].playersStorage);
            factionRelations = Presets.FactionRelations;
            revealedFactions = [];
            Towns[19].addToStock(99,30);
            Towns[19].addToStock(100,30);
            Towns[19].addToStock(101,30);
            Towns[19].addToStock(102,30);
            Towns[19].addToStock(95,200);
            Towns[18].addToStock(87,300);
            Towns[19].addToStock(95,100);
            globalPrices = [];
            for(_loc11_ in Industry.Types)
            {
               for(_loc12_ in Industry.Types[_loc11_].consumption)
               {
                  globalPrices[Industry.Types[_loc11_].consumption[_loc12_].item] = 0;
               }
               for(_loc12_ in Industry.Types[_loc11_].production)
               {
                  globalPrices[Industry.Types[_loc11_].production[_loc12_].item] = 0;
               }
            }
            globalPrices[174] = 0;
            updateEconomy();
            for(_loc11_ in Towns)
            {
               for(_loc12_ in Towns[_loc11_].locations)
               {
                  if(Presets.Towns[_loc11_].locations[_loc12_].category == 1)
                  {
                     _loc9_ = 0;
                     _loc8_ = 0;
                     for(_loc13_ in Towns[_loc11_].locations[_loc12_].stock)
                     {
                        _loc9_ = globalItemPrice(Towns[_loc11_].locations[_loc12_].stock[_loc13_].type) * Towns[_loc11_].locations[_loc12_].stock[_loc13_].amount;
                        _loc8_++;
                     }
                     for(_loc13_ in Towns[_loc11_].locations[_loc12_].slaves)
                     {
                        _loc9_ += Towns[_loc11_].locations[_loc12_].slaves[_loc13_].price;
                        _loc8_++;
                     }
                     for(_loc13_ in Towns[_loc11_].locations[_loc12_].transport)
                     {
                        _loc9_ += Towns[_loc11_].locations[_loc12_].transport[_loc13_].price;
                        _loc8_++;
                     }
                     if(_loc8_ > 0)
                     {
                        Towns[_loc11_].locations[_loc12_].money += _loc9_;
                     }
                  }
               }
            }
            Towns[34].active = false;
            Towns[68].active = false;
         }
         if(param3 != null && !(param3 is Number))
         {
            load(param3);
         }
         if(param3 == null || param3 != null && !(param3 is Number))
         {
            finishInitialization(_loc7_);
         }
      }
      
      public static function nullifyNext(param1:*, param2:* = 0, param3:* = "") : *
      {
         var _loc9_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc5_:XMLList = null;
         processedObjects.push(param1);
         if(param1 is Array)
         {
            _loc8_ = param1.length;
         }
         else if(getQualifiedClassName(param1) != "Object")
         {
            _loc5_ = describeType(param1)..variable;
            _loc8_ = _loc5_.length();
         }
         var _loc4_:* = [];
         if(getQualifiedClassName(param1) == "Object")
         {
            for(_loc6_ in param1)
            {
               _loc4_.push(_loc6_);
            }
         }
         else
         {
            _loc6_ = 0;
            while(_loc6_ < _loc8_)
            {
               if(param1 is Array)
               {
                  _loc4_.push(_loc6_);
               }
               else
               {
                  _loc4_.push(_loc5_[_loc6_].@name);
               }
               _loc6_++;
            }
         }
         for(_loc6_ in _loc4_)
         {
            _loc9_ = _loc4_[_loc6_];
            if(param1.hasOwnProperty(_loc9_))
            {
               if(param1[_loc9_] is Object && !(param1[_loc9_] is Number) && !(param1[_loc9_] is String) && !(param1[_loc9_] is Boolean) && _loc9_ != "GD" && _loc9_ != "nearbyCaravans" && _loc9_ != "recentlyInteractedCaravans" && _loc9_ != "recentlyInteractedTowns" && _loc9_ != "friends" && _loc9_ != "enemies" && _loc9_ != "battleField" && _loc9_ != "CharactersMap" && _loc9_ != "ObstaclesMap" && _loc9_ != "characterPointer" && _loc9_ != "caravan" && _loc9_ != "portraitImage" && _loc9_ != "savedPortrait")
               {
                  if(processedObjects.indexOf(param1[_loc9_]) == -1)
                  {
                     nullifyNext(param1[_loc9_],param2 + 1,param3 + _loc9_ + ".");
                  }
                  if(param1[_loc9_] is DisplayObjectContainer)
                  {
                     _loc7_ = 0;
                     while(_loc7_ < param1[_loc9_].numChildren)
                     {
                        if(processedObjects.indexOf(param1[_loc9_].getChildAt(_loc7_)) == -1)
                        {
                           nullifyNext(param1[_loc9_].getChildAt(_loc7_),param2 + 1,param3 + _loc9_ + ".");
                        }
                        _loc7_++;
                     }
                  }
               }
               if(param1[_loc9_] is GameData)
               {
                  trace("GAME DATA!!!!!!!!!!!!!!! " + param3 + _loc9_);
               }
               if((param1[_loc9_] is DisplayObject || param1[_loc9_] is DisplayObjectContainer || param1[_loc9_] is BitmapData) && undeletableObjects.indexOf(param1[_loc9_]) == -1)
               {
               }
            }
         }
      }
      
      public static function nullifyObject(param1:*, param2:* = null) : *
      {
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         processedObjects = [];
         undeletableObjects = [];
         if(param2 != null)
         {
            for(_loc4_ in param2.Caravans[0].People)
            {
               if(param2.Caravans[0].People[_loc4_].savedPortrait is Bitmap)
               {
                  undeletableObjects.push(param2.Caravans[0].People[_loc4_].savedPortrait);
                  undeletableObjects.push(param2.Caravans[0].People[_loc4_].savedPortrait.bitmapData);
               }
            }
            undeletableObjects.push(param2);
            undeletableObjects.push(param2.mapMode);
            undeletableObjects.push(param2.navigationMode);
            undeletableObjects.push(param2.caravanMenu);
            for(_loc4_ in param2.Caravans)
            {
               undeletableObjects.push(param2.Caravans[_loc4_]);
               if(param2.Caravans[_loc4_].mapSymbol is Sprite)
               {
                  undeletableObjects.push(param2.Caravans[_loc4_].mapSymbol);
                  undeletableObjects.push(param2.Caravans[_loc4_].mapSymbolText1);
                  undeletableObjects.push(param2.Caravans[_loc4_].mapSymbolText2);
                  undeletableObjects.push(param2.Caravans[_loc4_].mapSymbolRotatingPart);
                  undeletableObjects.push(param2.Caravans[_loc4_].mapSymbolParent);
               }
            }
         }
         nullifyNext(param1);
         processedObjects = [];
         undeletableObjects = [];
      }
      
      public static function staticMakeDate(param1:*) : *
      {
         var _loc2_:* = {};
         var _loc4_:* = param1;
         var _loc3_:int = 31622400;
         var _loc6_:* = 2678400;
         var _loc5_:* = [undefined,31,28,31,30,31,30,31,31,30,31,30,31];
         _loc2_.Year = 1;
         while(_loc4_ >= _loc3_)
         {
            _loc4_ -= _loc3_;
            _loc2_.Year++;
            if(_loc2_.Year % 4 == 0)
            {
               _loc3_ = 31622400;
            }
            else
            {
               _loc3_ = 31536000;
            }
         }
         if(_loc2_.Year % 4 == 0)
         {
            _loc5_[2] = 29;
         }
         _loc2_.Month = 1;
         while(_loc4_ >= _loc6_)
         {
            _loc2_.Month++;
            _loc4_ -= _loc6_;
            _loc6_ = _loc5_[_loc2_.Month] * 86400;
         }
         _loc2_.Day = 1;
         while(_loc4_ >= 86400)
         {
            _loc2_.Day++;
            _loc4_ -= 86400;
         }
         _loc2_.Hour = 0;
         while(_loc4_ >= 3600)
         {
            _loc2_.Hour++;
            _loc4_ -= 3600;
         }
         _loc2_.Minute = 0;
         while(_loc4_ >= 60)
         {
            _loc2_.Minute++;
            _loc4_ -= 60;
         }
         _loc2_.Second = _loc4_;
         if(_loc2_.Day >= 10)
         {
            _loc2_.Day2d = _loc2_.Day;
         }
         else
         {
            _loc2_.Day2d = "0" + _loc2_.Day;
         }
         if(_loc2_.Year >= 10)
         {
            _loc2_.Year2d = _loc2_.Year % 100;
         }
         else
         {
            _loc2_.Year2d = "0" + _loc2_.Year;
         }
         if(_loc2_.Hour >= 10)
         {
            _loc2_.Hour2d = _loc2_.Hour;
         }
         else
         {
            _loc2_.Hour2d = "0" + _loc2_.Hour;
         }
         if(_loc2_.Minute >= 10)
         {
            _loc2_.Minute2d = _loc2_.Minute;
         }
         else
         {
            _loc2_.Minute2d = "0" + _loc2_.Minute;
         }
         if(_loc2_.Hour < 12)
         {
            _loc2_.AmPm = "AM";
         }
         else
         {
            _loc2_.AmPm = "PM";
         }
         _loc2_.MonthName = Texts.fetch(36 + _loc2_.Month);
         _loc2_.ShortMonthName = _loc2_.MonthName.substr(0,3).toUpperCase();
         return _loc2_;
      }
      
      public static function addItemToArray(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         for(_loc4_ in param1)
         {
            if(param1[_loc4_].item == param2.item)
            {
               param1[_loc4_].amount += param2.amount;
               _loc3_ = true;
               break;
            }
         }
         if(!_loc3_)
         {
            param1.push({
               "item":param2.item,
               "amount":param2.amount
            });
         }
      }
      
      public static function addArrayToArray(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         for(_loc3_ in param2)
         {
            addItemToArray(param1,param2[_loc3_]);
         }
      }
      
      public static function calculateConsumptionProduction(param1:*, param2:*, param3:* = 1) : *
      {
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc5_:* = undefined;
         var _loc16_:* = undefined;
         var _loc11_:* = undefined;
         var _loc18_:* = undefined;
         var _loc6_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc4_:* = {};
         var _loc17_:* = [];
         for(_loc11_ in param1)
         {
            _loc5_ = param1[_loc11_].consumption;
            if(_loc5_ is Array)
            {
               for(_loc12_ in _loc5_)
               {
                  if(param1[_loc11_] is Item)
                  {
                     addItemToArray(_loc17_,{
                        "item":_loc5_[_loc12_].item,
                        "amount":_loc5_[_loc12_].amount * param1[_loc11_].inUse
                     });
                  }
                  else
                  {
                     addItemToArray(_loc17_,_loc5_[_loc12_]);
                  }
               }
            }
         }
         for(_loc11_ in _loc17_)
         {
            _loc17_[_loc11_].amount *= param3;
         }
         for(_loc11_ in _loc17_)
         {
            _loc17_[_loc11_].canConsume = 0;
            _loc17_[_loc11_].actualAmount = 0;
            for(_loc12_ in param2)
            {
               if(param2[_loc12_].type == _loc17_[_loc11_].item)
               {
                  if(param2[_loc12_].amount >= _loc17_[_loc11_].amount)
                  {
                     _loc17_[_loc11_].canConsume = 1;
                     _loc17_[_loc11_].actualAmount = _loc17_[_loc11_].amount;
                  }
                  else
                  {
                     _loc17_[_loc11_].canConsume = param2[_loc12_].amount / _loc17_[_loc11_].amount;
                     _loc17_[_loc11_].actualAmount = param2[_loc12_].amount;
                  }
                  break;
               }
            }
         }
         var _loc15_:* = [];
         for(_loc11_ in param1)
         {
            if(param1[_loc11_].consumption.length > 0 || param1[_loc11_].production.length > 0 || param1[_loc11_].electricityConsumption > 0 || param1[_loc11_].electricityProduction > 0)
            {
               _loc15_[_loc11_] = {
                  "ref":param1[_loc11_],
                  "productionRate":1
               };
            }
         }
         for(_loc11_ in _loc15_)
         {
            _loc5_ = _loc15_[_loc11_].ref.consumption;
            for(_loc12_ in _loc5_)
            {
               for(_loc13_ in _loc17_)
               {
                  if(_loc17_[_loc13_].item == _loc5_[_loc12_].item)
                  {
                     if(_loc17_[_loc13_].canConsume < _loc15_[_loc11_].productionRate)
                     {
                        _loc15_[_loc11_].productionRate = _loc17_[_loc13_].canConsume;
                     }
                     break;
                  }
               }
            }
         }
         _loc18_ = [];
         for(_loc11_ in _loc15_)
         {
            if(_loc15_[_loc11_].ref.electricityProduction > 0)
            {
               _loc6_ = _loc15_[_loc11_].ref.electricityProduction;
               if(_loc15_[_loc11_].ref is Item)
               {
                  _loc6_ *= _loc15_[_loc11_].ref.inUse;
               }
               _loc18_.push({
                  "amount":_loc6_,
                  "from":0,
                  "to":_loc15_[_loc11_].productionRate
               });
            }
         }
         var _loc14_:* = new Array({
            "amount":0,
            "from":0,
            "to":1
         });
         for(_loc11_ in _loc18_)
         {
            _loc12_ = 0;
            while(_loc12_ < _loc14_.length)
            {
               if(_loc18_[_loc11_].from <= _loc14_[_loc12_].from && _loc18_[_loc11_].to >= _loc14_[_loc12_].to)
               {
                  _loc9_ = [{
                     "from":_loc14_[_loc12_].from,
                     "to":_loc14_[_loc12_].to,
                     "amount":_loc14_[_loc12_].amount + _loc18_[_loc11_].amount
                  }];
               }
               if(_loc18_[_loc11_].from > _loc14_[_loc12_].from && _loc18_[_loc11_].to >= _loc14_[_loc12_].to)
               {
                  _loc9_ = [{
                     "from":_loc14_[_loc12_].from,
                     "to":_loc18_[_loc11_].from,
                     "amount":_loc14_[_loc12_].amount
                  },{
                     "from":_loc18_[_loc11_].from,
                     "to":_loc14_[_loc12_].to,
                     "amount":_loc18_[_loc11_].amount + _loc14_[_loc12_].amount
                  }];
               }
               if(_loc18_[_loc11_].from <= _loc14_[_loc12_].from && _loc18_[_loc11_].to < _loc14_[_loc12_].to)
               {
                  _loc9_ = [{
                     "from":_loc14_[_loc12_].from,
                     "to":_loc18_[_loc11_].to,
                     "amount":_loc14_[_loc12_].amount + _loc18_[_loc11_].amount
                  },{
                     "from":_loc18_[_loc11_].to,
                     "to":_loc14_[_loc12_].to,
                     "amount":_loc14_[_loc12_].amount
                  }];
               }
               if(_loc18_[_loc11_].from > _loc14_[_loc12_].from && _loc18_[_loc11_].to < _loc14_[_loc12_].to)
               {
                  _loc9_ = [{
                     "from":_loc14_[_loc12_].from,
                     "to":_loc18_[_loc11_].from,
                     "amount":_loc14_[_loc12_].amount
                  },{
                     "from":_loc18_[_loc12_].from,
                     "to":_loc18_[_loc11_].to,
                     "amount":_loc14_[_loc12_].amount + _loc18_[_loc11_].amount
                  },{
                     "from":_loc18_[_loc11_].to,
                     "to":_loc14_[_loc12_].to,
                     "amount":_loc18_[_loc11_].amount + _loc14_[_loc12_].amount
                  }];
               }
               if(_loc18_[_loc11_].from <= _loc14_[_loc12_].from && _loc18_[_loc11_].to <= _loc14_[_loc12_].from || _loc18_[_loc11_].from >= _loc14_[_loc12_].to && _loc18_[_loc11_].to >= _loc14_[_loc12_].to)
               {
                  _loc9_ = null;
               }
               if(_loc9_ != null)
               {
                  _loc10_ = _loc14_.splice(0,_loc12_);
                  _loc14_.shift();
                  _loc14_ = _loc9_.concat(_loc14_);
                  _loc14_ = _loc10_.concat(_loc14_);
               }
               _loc12_++;
            }
         }
         var _loc8_:* = 0;
         for(_loc11_ in _loc15_)
         {
            if(_loc15_[_loc11_].ref.electricityConsumption > 0)
            {
               _loc6_ = _loc15_[_loc11_].ref.electricityConsumption;
               if(_loc15_[_loc11_].ref is Item)
               {
                  _loc6_ *= _loc15_[_loc11_].ref.inUse;
               }
               _loc8_ += _loc6_;
            }
         }
         var _loc7_:* = 0;
         for(_loc11_ in _loc14_)
         {
            if(_loc8_ <= _loc14_[_loc11_].amount)
            {
               _loc7_ += _loc14_[_loc11_].to - _loc14_[_loc11_].from;
            }
         }
         for(_loc11_ in _loc15_)
         {
            if(_loc15_[_loc11_].ref.electricityConsumption > 0)
            {
               if(_loc15_[_loc11_].productionRate > _loc7_)
               {
                  _loc15_[_loc11_].productionRate = _loc7_;
               }
            }
         }
         _loc4_.consumption = [];
         //_loc4_.consumptionUI = [];
         _loc4_.production = [];
         //_loc4_.productionUI = [];
         _loc4_.deficit = [];
         for(_loc11_ in _loc15_) // _loc15_ seems to be industries that can produce
         {
            if(_loc15_[_loc11_].productionRate > 0)
            {
               _loc16_ = _loc15_[_loc11_].ref.production;
               for(_loc12_ in _loc16_)
               {
                  _loc6_ = _loc16_[_loc12_].amount * _loc15_[_loc11_].productionRate;
                  if(_loc15_[_loc11_].ref is Item)
                  {
                     _loc6_ *= _loc15_[_loc11_].ref.inUse;
                  }
                  addItemToArray(_loc4_.production,{
                     "item":_loc16_[_loc12_].item,
                     "amount":_loc6_ * param3
                  });
                  /*addItemToArray(_loc4_.productionUI,{
                     "item":_loc16_[_loc12_].item,
                     "amount":_loc6_ * param3
                  });*/
               }
               _loc5_ = _loc15_[_loc11_].ref.consumption;
               for(_loc12_ in _loc5_)
               {
                  _loc6_ = _loc5_[_loc12_].amount * _loc15_[_loc11_].productionRate;
                  if(_loc15_[_loc11_].ref is Item)
                  {
                     _loc6_ *= _loc15_[_loc11_].ref.inUse;
                  }
                  addItemToArray(_loc4_.consumption,{
                     "item":_loc5_[_loc12_].item,
                     "amount":_loc6_ * param3
                  });
                  /*addItemToArray(_loc4_.consumptionUI,{
                     "item":_loc5_[_loc12_].item,
                     "amount":_loc6_ * param3
                  });*/
               }
            }
            if(_loc15_[_loc11_].productionRate < 1)
            {
               _loc4_.deficit.push({
                  "producer":_loc15_[_loc11_].ref,
                  "deficit":1 - _loc15_[_loc11_].productionRate
               });
            }
         }

         //+-clean up
         for (_loc11_ in _loc15_)
         {
            var industry:* = _loc15_[_loc11_];

            // Only process industries that are not already producing
            if (industry.productionRate == 0)
            {
               var industryRef:* = industry.ref;
               var canProduce:Boolean = true;

               //- check have all consumption items
               for each (var consumption:* in industryRef.consumption)
               {
                     var requiredItem:* = consumption.item;
                     var requiredAmount:* = consumption.amount * param3;
                     var foundItem:Boolean = false;

                     for (_loc12_ in _loc4_.production)
                     {
                        var availableProduction:* = _loc4_.production[_loc12_];

                        if (availableProduction.item == requiredItem)
                        {
                           foundItem = true;
                           if (availableProduction.amount < requiredAmount)
                           {
                              canProduce = false;
                           }
                           break;
                        }
                     }

                     //-don't have an item
                     if (!foundItem || !canProduce)
                     {
                        break;
                     }
               }

               // --------------------------------------------------
               // 2. Consume all required inputs
               // --------------------------------------------------
               //-consume consumptions, kinda breaks the RECENT DATA UI
               //+-would like to fix UI
               if (canProduce)
               {
                  for each (consumption in industryRef.consumption)
                  {
                     requiredItem = consumption.item;
                     requiredAmount = consumption.amount * param3;

                     for (_loc12_ in _loc4_.production) //-remove production of the consumed good
                     {
                        availableProduction = _loc4_.production[_loc12_];
                        if (availableProduction.item == requiredItem)
                        {
                           availableProduction.amount -= requiredAmount;
                           /*addItemToArray(_loc4_.consumptionUI,{
                              "item": availableProduction.item,
                              "amount": requiredAmount
                           });*/
                           break;
                        }
                     }
                  }

                  //-add production
                  for each (var production:* in industryRef.production)
                  {
                     addItemToArray(_loc4_.production, {
                        "item": production.item,
                        "amount": production.amount * param3
                     });
                     /*addItemToArray(_loc4_.productionUI, {
                        "item": production.item,
                        "amount": production.amount * param3
                     });*/
                  }
               }
            }
         }



         return _loc4_;
      }
      
      public static function belongToTheSameCategory(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         for(_loc3_ in itemCategories)
         {
            if(param1[itemCategories[_loc3_]] && param2[itemCategories[_loc3_]])
            {
               return true;
            }
         }
         return false;
      }
      
      public static function code(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(!(param1 is String))
         {
            return param1;
         }
         var _loc2_:* = "";
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = param1.charCodeAt(_loc4_) + Presets.uc[_loc4_ % Presets.uc.length];
            _loc2_ += String.fromCharCode(_loc3_);
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function makeLineFit(param1:*, param2:* = null) : *
      {
         if(param2 == null)
         {
            param2 = param1.width;
         }
         if(param1.textWidth + 5 > param2)
         {
            param1.width = param1.textWidth + 5;
            param1.scaleX = param2 / (param1.textWidth + 5);
         }
      }
      
      public static function netStatusError(param1:*) : *
      {
         var storageSize:*;
         var localStorageText:*;
         var closeButton:*;
         var closeButtonText:*;
         var event:* = param1;
         switch(event.info.code)
         {
            case "SharedObject.Flush.Success":
               trace("Usflush succeeded");
               break;
            case "SharedObject.Flush.Failed":
               if(currentGame is GameData && currentGame.parent is Caravaneer2)
               {
                  storageSize = "";
                  if(currentGame.parent.savedData.size < 1048576)
                  {
                     storageSize = Math.ceil(currentGame.parent.savedData.size / 1024) + " KB";
                  }
                  else
                  {
                     storageSize = Math.ceil(currentGame.parent.savedData.size / 104857.6) / 10 + " MB";
                  }
                  localStorageError = new Sprite();
                  localStorageError.graphics.beginFill(0,0.5);
                  localStorageError.graphics.drawRect(0,0,880,495);
                  localStorageText = new EngineText(Texts.fetch(6894).replace("@amount@",storageSize),0,14,"center",260,238,360,1000,true,true);
                  localStorageText.height = localStorageText.textHeight + 5;
                  localStorageText.y = 227 - localStorageText.textHeight / 2;
                  localStorageError.graphics.beginFill(14736080);
                  localStorageError.graphics.lineStyle(0.5,0);
                  localStorageError.graphics.drawRect(240,207 - localStorageText.textHeight / 2,400,localStorageText.textHeight + 80);
                  localStorageError.graphics.endFill();
                  localStorageError.graphics.drawRect(245,212 - localStorageText.textHeight / 2,390,localStorageText.textHeight + 70);
                  localStorageError.addChild(localStorageText);
                  closeButton = new Sprite();
                  closeButton.graphics.beginFill(14736080);
                  closeButton.graphics.lineStyle(0.5,0);
                  closeButton.graphics.drawRect(0,0,150,20);
                  closeButtonText = new EngineText(Texts.fetch(1181).toUpperCase(),0,14,"center",10,0,130,20);
                  closeButton.addChild(closeButtonText);
                  closeButton.buttonMode = true;
                  closeButton.mouseChildren = false;
                  closeButton.x = 365;
                  closeButton.y = 247 + localStorageText.textHeight / 2;
                  closeButton.addEventListener("click",function():*
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXClick().play();
                     }
                     currentGame.parent.removeChild(localStorageError);
                  },false,0,false);
                  localStorageError.addChild(closeButton);
                  currentGame.parent.addChild(localStorageError);
               }
         }
      }
      
      public function contextMenuSelect(param1:*) : *
      {
         trace("menu selected");
      }
      
      public function finishInitialization(param1:* = false) : *
      {
         var _loc2_:* = undefined;
         mapMode = new MapMode(this);
         caravanMenu = new CaravanMenu(this,lastCaravanMenuCategory);
         navigationMode = new NavigationScreen(this);
         waitBox = new Sprite();
         waitBox.graphics.beginFill(14736080);
         waitBox.graphics.lineStyle(0.5,0);
         waitBox.graphics.drawRect(240,213,400,70);
         waitBox.graphics.endFill();
         waitBox.graphics.drawRect(245,218,390,60);
         waitBoxText = new EngineText("Please wait",0,14,"center",260,238,360,20);
         waitBox.addChild(waitBoxText);
         mapMode.visible = false;
         caravanMenu.visible = false;
         navigationMode.visible = false;
         waitBox.visible = false;
         screenNode.addChild(mapMode);
         screenNode.addChild(caravanMenu);
         screenNode.addChild(navigationMode);
         screenNode.addChild(waitBox);
         if(param1)
         {
            mapMode.forceTownUpdate = true;
            for(_loc2_ in Presets.caravanRoutes)
            {
               if(Presets.caravanRoutes[_loc2_].onInit)
               {
                  missingRoutes.push(_loc2_);
               }
            }
         }
      }
      
      public function getFactionRelations(param1:*, param2:* = 0, param3:* = false) : *
      {
         if(!param3)
         {
            checkRevealedFactions(param1,param2);
         }
         if(param1 == param2 || param1 == undefined || param2 == undefined)
         {
            return 0;
         }
         if(param1 > param2)
         {
            return factionRelations[param1][param2];
         }
         return factionRelations[param2][param1];
      }
      
      public function setFactionRelations(param1:*, param2:*, param3:*) : *
      {
         if(param1 != param2)
         {
            if(param1 > param2)
            {
               factionRelations[param1][param2] = param3;
            }
            else
            {
               factionRelations[param2][param1] = param3;
            }
         }
      }
      
      public function affectFactionRelations(param1:*, param2:*, param3:* = 0) : *
      {
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         checkRevealedFactions(param2,param3);
         setFactionRelations(param2,param3,getFactionRelations(param2,param3) + param1);
         for(_loc6_ in factionRelations)
         {
            if(_loc6_ != param2 && _loc6_ != param3)
            {
               _loc4_ = false;
               for(_loc7_ in Presets.doNotAffectRelations)
               {
                  if(_loc6_ == Presets.doNotAffectRelations[_loc7_].to && (param2 == Presets.doNotAffectRelations[_loc7_].from || param3 == Presets.doNotAffectRelations[_loc7_].from))
                  {
                     _loc4_ = true;
                     break;
                  }
               }
               if(!_loc4_)
               {
                  _loc8_ = getFactionRelations(param2,_loc6_,true);
                  _loc5_ = getFactionRelations(param3,_loc6_,true);
                  if(_loc8_ != 0)
                  {
                     setFactionRelations(param3,_loc6_,_loc5_ + param1 * _loc8_ / 100);
                  }
                  if(_loc5_ != 0)
                  {
                     setFactionRelations(param2,_loc6_,_loc8_ + param1 * _loc5_ / 100);
                  }
               }
            }
         }
      }
      
      public function checkRevealedFactions(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         if(param1 == 0 || param2 == 0)
         {
            if(param1 == 0)
            {
               _loc3_ = param2;
            }
            if(param2 == 0)
            {
               _loc3_ = param1;
            }
            revealedFactions[_loc3_] = true;
         }
      }
      
      public function setSquareValue(param1:*, param2:*, param3:*, param4:*, param5:* = null) : *
      {
         if(!(Squares[param1] is Array))
         {
            Squares[param1] = [];
         }
         if(!(Squares[param1][param2] is Object))
         {
            Squares[param1][param2] = {
               "Towns":[],
               "GroupProbabilities":[],
               "Caravans":[]
            };
         }
         switch(param3)
         {
            case "town":
               Squares[param1][param2].Towns.push(param4);
               break;
            case "group":
               Squares[param1][param2].GroupProbabilities[param4] = param5;
               break;
            case "addcaravan":
               Squares[param1][param2].Caravans.push(param4);
               break;
            case "removecaravan":
               Squares[param1][param2].Caravans.splice(Squares[param1][param2].Caravans.indexOf(param4),1);
         }
      }
      
      public function setGroupProbabilitiesArea(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         var _loc6_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc8_:* = undefined;
         var _loc7_:* = undefined;
         _loc7_ = 0 - param5;
         while(_loc7_ <= param5)
         {
            _loc6_ = 0 - param5;
            while(_loc6_ <= param5)
            {
               _loc9_ = MathFunctions.CalcDistance(0,0,_loc7_,_loc6_);
               if(_loc9_ <= param5)
               {
                  _loc10_ = param4 * (1 - _loc9_ / param5);
                  _loc8_ = getSquareGroupProbabilities(param1 + _loc7_,param2 + _loc6_)[param3];
                  if(_loc8_ > 0)
                  {
                     setSquareValue(param1 + _loc7_,param2 + _loc6_,"group",param3,(1 - _loc8_) * _loc10_ + _loc8_);
                  }
                  else
                  {
                     setSquareValue(param1 + _loc7_,param2 + _loc6_,"group",param3,_loc10_);
                  }
               }
               _loc6_++;
            }
            _loc7_++;
         }
      }
      
      public function getSquareTowns(param1:*, param2:*) : *
      {
         if(Squares[param1] is Array && Squares[param1][param2] is Object)
         {
            return Squares[param1][param2].Towns;
         }
         return [];
      }
      
      public function getSquareGroupProbabilities(param1:*, param2:*) : *
      {
         if(Squares[param1] is Array && Squares[param1][param2] is Object)
         {
            return Squares[param1][param2].GroupProbabilities;
         }
         return [];
      }
      
      public function eliminateAllRandomGroups(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc2_ in Squares)
         {
            if(Squares[_loc2_] is Object)
            {
               for(_loc3_ in Squares[_loc2_])
               {
                  Squares[_loc2_][_loc3_].GroupProbabilities[param1] = 0;
               }
            }
         }
      }
      
      public function getSquareCaravans(param1:*, param2:*) : *
      {
         if(Squares[param1] is Array && Squares[param1][param2] is Object)
         {
            return Squares[param1][param2].Caravans;
         }
         return [];
      }
      
      public function equipRandomCaravan(param1:*, param2:* = null, param3:* = null) : *
      {
         var _loc9_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc18_:* = undefined;
         var _loc8_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc5_:* = undefined;
         var _loc17_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc12_:* = undefined;
         var _loc14_:* = undefined;
         var _loc6_:* = 1;
         if(param3 != null)
         {
            Rndm.pointer = param3;
         }
         param1.randomPointer = Rndm.pointer;
         if(param2 != null)
         {
            param1.fixedPeopleNum = param2;
         }
         if(difficulty == 2)
         {
            _loc6_ = 1.3;
         }
         if(param2 != null)
         {
            _loc10_ = param2;
         }
         else
         {
            _loc10_ = Math.max(1,Math.round(Presets.CaravanTypes[param1.type].averagePeopleNum * (0.5 + Rndm.random() * 1) * _loc6_));
         }
         if(Presets.CaravanTypes[param1.type].peopleLevel == undefined)
         {
            _loc7_ = 1;
         }
         else
         {
            _loc7_ = Presets.CaravanTypes[param1.type].peopleLevel;
         }
         if(Presets.CaravanTypes[param1.type].peopleExperience == undefined)
         {
            _loc18_ = 1;
         }
         else
         {
            _loc18_ = Presets.CaravanTypes[param1.type].peopleExperience;
         }
         if(difficulty == 1)
         {
            _loc7_ *= 0.8;
            _loc18_ *= 0.8;
         }
         _loc8_ = 1;
         while(_loc8_ <= _loc10_)
         {
            _loc4_ = {};
            if(param1.type == 6)
            {
               _loc4_.portraitShirt = 0;
            }
            if(Presets.CaravanTypes[param1.type].faction == 2)
            {
               if(Rndm.random() < 0.5)
               {
                  _loc4_.portraitShirt = 0;
               }
               if(Rndm.random() < 0.4)
               {
                  _loc4_.portraitHair = 17;
               }
               _loc4_.gender = 1;
            }
            if(Presets.CaravanTypes[param1.type].faction == 7)
            {
               _loc4_.gender = 1;
               _loc4_.shirtColor = {
                  "r":200,
                  "g":200,
                  "b":200,
                  "bc":1
               };
               _loc11_ = Math.round(100 + Rndm.random() * 100);
               _loc4_.pantsColor = {
                  "r":_loc11_,
                  "g":_loc11_,
                  "b":_loc11_,
                  "bc":1
               };
               _loc4_.sleevesType = 3;
            }
            if(Presets.CaravanTypes[param1.type].faction == 8)
            {
               _loc4_.shirtColor = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               _loc4_.portraitShirt = 1;
            }
            if(param1.type == 16)
            {
               _loc4_.shirtColor = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               _loc4_.gender = 1;
               _loc4_.portraitShirt = 1;
               _loc4_.sleevesType = 5;
               _loc4_.agility = 8 + Math.round(Rndm.random() * 2);
               _loc4_.physical = 4 + Math.round(Rndm.random() * 3);
               _loc5_ = 24 - _loc4_.agility - _loc4_.physical;
               _loc4_.accuracy = Math.round(_loc5_ * 0.7);
               _loc4_.intelligence = Math.max(Math.round(_loc5_ * 0.3),2);
               _loc4_.swordsExperience = 5000 + Rndm.random() * 5000;
               _loc4_.crossbowExperience = 5000 + Rndm.random() * 5000;
            }
            if(param1.type == 18)
            {
               _loc4_.portraitShirt = 1;
               _loc4_.shirtColor = {
                  "r":255,
                  "g":255,
                  "b":255,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":255,
                  "g":255,
                  "b":255,
                  "bc":1
               };
            }
            if(param1.type == 19)
            {
               _loc4_.shirtColor = {
                  "r":90,
                  "g":90,
                  "b":90,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":90,
                  "g":90,
                  "b":90,
                  "bc":1
               };
               _loc4_.portraitShirt = 1;
               _loc4_.sleevesType = 5;
            }
            if(param1.type == 20)
            {
               _loc4_.shirtColor = {
                  "r":80,
                  "g":60,
                  "b":20,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":80,
                  "g":60,
                  "b":20,
                  "bc":1
               };
               _loc4_.portraitShirt = 1;
               _loc4_.sleevesType = 5;
            }
            if(param1.type == 21)
            {
               _loc4_.shirtColor = {
                  "r":15,
                  "g":15,
                  "b":15,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":15,
                  "g":15,
                  "b":15,
                  "bc":1
               };
               _loc4_.portraitShirt = 1;
               _loc4_.sleevesType = 5;
            }
            if(param1.type == 29)
            {
               _loc4_.shirtColor = {
                  "r":150,
                  "g":140,
                  "b":130,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":150,
                  "g":140,
                  "b":130,
                  "bc":1
               };
               _loc4_.physical = 8 + Rndm.integer(0,2);
               _loc4_.portraitShirt = 1;
               _loc4_.sleevesType = 5;
            }
            if(param1.type == 30)
            {
               _loc4_.shirtColor = {
                  "r":20,
                  "g":30,
                  "b":64,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":20,
                  "g":30,
                  "b":64,
                  "bc":1
               };
               _loc4_.physical = 8 + Rndm.integer(0,2);
               _loc4_.portraitShirt = 1;
               _loc4_.sleevesType = 5;
            }
            if(param1.type == 33)
            {
               _loc4_.shirtColor = {
                  "r":20,
                  "g":80,
                  "b":30,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":20,
                  "g":80,
                  "b":30,
                  "bc":1
               };
               _loc4_.hairColor = {
                  "r":20,
                  "g":80,
                  "b":30,
                  "bc":1
               };
            }
            if(param1.type == 34)
            {
               _loc4_.shirtColor = {
                  "r":255,
                  "g":255,
                  "b":255,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":20,
                  "g":20,
                  "b":20,
                  "bc":1
               };
               _loc4_.hairColor = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               _loc4_.physical = 10;
            }
            if(param1.type == 35)
            {
               if(Rndm.random() < 0.5)
               {
                  _loc4_.portraitHair = 17;
               }
               else
               {
                  _loc4_.portraitHair = 19;
               }
            }
            if(param1.type == 36)
            {
               _loc4_.shirtColor = {
                  "r":255,
                  "g":255,
                  "b":255,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":60,
                  "g":60,
                  "b":60,
                  "bc":1
               };
               _loc4_.hairColor = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               _loc4_.accuracy = 8 + Math.round(Rndm.random() * 2);
            }
            if(param1.type == 37)
            {
               _loc4_.shirtColor = randomBrightColor();
               _loc4_.pantsColor = randomBrightColor();
               _loc4_.pantsColor.r = Math.round(_loc4_.pantsColor.r / 2);
               _loc4_.pantsColor.g = Math.round(_loc4_.pantsColor.g / 2);
               _loc4_.pantsColor.b = Math.round(_loc4_.pantsColor.b / 2);
               _loc4_.physical = 8 + Math.round(Rndm.random() * 2);
            }
            if(param1.type == 38)
            {
               _loc4_.shirtColor = {
                  "r":80,
                  "g":60,
                  "b":30,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":80,
                  "g":60,
                  "b":30,
                  "bc":1
               };
               _loc4_.portraitShirt = 1;
               _loc4_.sleevesType = 5;
               _loc4_.physical = 8 + Math.round(Rndm.random() * 2);
            }
            if(param1.type == 39)
            {
               _loc4_.shirtColor = {
                  "r":120,
                  "g":120,
                  "b":120,
                  "bc":1
               };
               _loc4_.pantsColor = {
                  "r":120,
                  "g":120,
                  "b":120,
                  "bc":1
               };
               _loc4_.portraitShirt = 1;
               _loc4_.sleevesType = 5;
               _loc4_.physical = 8 + Math.round(Rndm.random() * 2);
            }
            _loc4_.levelModifier = _loc7_;
            _loc4_.experienceModifier = _loc18_;
            _loc4_.keepTheSeed = true;
            param1.addPerson(new Character(_loc4_));
            _loc8_++;
         }
         var _loc13_:* = Math.round(Presets.CaravanTypes[param1.type].totalWeaponsPercentage * _loc10_);
         _loc8_ = 1;
         while(_loc8_ <= _loc13_)
         {
            _loc17_ = MathFunctions.probabilityRandom(Presets.CaravanTypes[param1.type].weapons,"probability");
            if(_loc17_ !== false)
            {
               param1.addCargo(Presets.CaravanTypes[param1.type].weapons[_loc17_].item,1);
            }
            _loc8_++;
         }
         for(_loc8_ in Presets.CaravanTypes[param1.type].equipment)
         {
            _loc15_ = Math.round(Presets.CaravanTypes[param1.type].equipment[_loc8_].amount * (0.8 + Rndm.random() * 0.4) * _loc10_);
            param1.addCargo(Presets.CaravanTypes[param1.type].equipment[_loc8_].item,_loc15_);
         }
         _loc8_ = 0;
         while(_loc8_ < param1.Cargo.length)
         {
            if(param1.Cargo[_loc8_].category == 3)
            {
               _loc16_ = false;
               for(_loc9_ in param1.Cargo)
               {
                  if(param1.Cargo[_loc9_].category == 2 && param1.Cargo[_loc9_].itemData.ammo == param1.Cargo[_loc8_].itemData.type)
                  {
                     _loc16_ = true;
                     break;
                  }
               }
               if(!_loc16_)
               {
                  param1.Cargo.splice(_loc8_,1);
                  _loc8_--;
               }
            }
            _loc8_++;
         }
         if(Presets.CaravanTypes[param1.type].transport is Array)
         {
            for(_loc8_ in Presets.CaravanTypes[param1.type].transport)
            {
               if(Presets.CaravanTypes[param1.type].transport[_loc8_].exactPerPerson)
               {
                  _loc12_ = Math.round(Presets.CaravanTypes[param1.type].transport[_loc8_].amount * _loc10_);
               }
               else
               {
                  _loc12_ = Math.round(Presets.CaravanTypes[param1.type].transport[_loc8_].amount * (0.8 + Rndm.random() * 0.4));
               }
               if(_loc12_ > 0)
               {
                  _loc9_ = 1;
                  while(_loc9_ <= _loc12_)
                  {
                     param1.Transport.push(new TransportUnit(Presets.CaravanTypes[param1.type].transport[_loc8_].type,true));
                     param1.Transport[param1.Transport.length - 1].age = Math.round(param1.Transport[param1.Transport.length - 1].maxAge * (0.3 + Rndm.random() * 0.3));
                     _loc9_++;
                  }
               }
            }
         }
         if(Presets.CaravanTypes[param1.type].transportSlaves > 0)
         {
            _loc14_ = Math.round(Rndm.random() * Presets.CaravanTypes[param1.type].transportSlaves * 2);
            _loc8_ = 1;
            while(_loc8_ <= _loc14_)
            {
               param1.addPerson(new Character({"category":4}));
               _loc8_++;
            }
         }
         param1.money = Math.round(Presets.CaravanTypes[param1.type].money * (0.8 + Rndm.random() * 0.4));
         param1.distributeWeapons();
         param1.distributeAmmo();
         param1.distributeArmor();
         param1.distributeLiquidsContainers();
         param1.distributeTransport(true,true);
         param1.distributeDrivers();
         if(param1.type == 30 || param1.type == 32 || param1.type == 35)
         {
            param1.distributePassengers();
         }
      }
      
      public function randomBrightColor() : *
      {
         var _loc1_:* = Rndm.random();
         if(_loc1_ > 0.85)
         {
            return {
               "r":180,
               "g":40,
               "b":40,
               "bc":1
            };
         }
         if(_loc1_ > 0.7)
         {
            return {
               "r":128,
               "g":180,
               "b":60,
               "bc":1
            };
         }
         if(_loc1_ > 0.55)
         {
            return {
               "r":40,
               "g":120,
               "b":120,
               "bc":1
            };
         }
         if(_loc1_ > 0.4)
         {
            return {
               "r":40,
               "g":40,
               "b":120,
               "bc":1
            };
         }
         if(_loc1_ > 0.25)
         {
            return {
               "r":120,
               "g":40,
               "b":120,
               "bc":1
            };
         }
         if(_loc1_ > 0.1)
         {
            return {
               "r":180,
               "g":180,
               "b":40,
               "bc":1
            };
         }
         return {
            "r":128,
            "g":96,
            "b":40,
            "bc":1
         };
      }
      
      public function getBattleVars() : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc7_:* = undefined;
         var _loc3_:* = undefined;
         var _loc8_:* = undefined;
         if(mode != 2)
         {
            return "not in the battle mode";
         }
         var _loc1_:* = "";
         var _loc2_:XMLList = describeType(currentScreenContainer.BF)..variable;
         var _loc6_:* = _loc2_.length();
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc8_ = _loc2_[_loc4_].@name;
            _loc1_ += _loc8_ + ": " + currentScreenContainer.BF[_loc8_] + "\n";
            _loc4_++;
         }
         _loc1_ += "\n--------------------------------------\n\n";
         _loc1_ += "nowActing=" + currentScreenContainer.BF.nowActing;
         for(_loc3_ in currentScreenContainer.BF.ActList)
         {
            _loc2_ = describeType(currentScreenContainer.BF.ActList[_loc3_])..variable;
            _loc6_ = _loc2_.length();
            _loc1_ += "\n\n------------ActList[" + _loc3_ + "]------------------------\n\n";
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               _loc8_ = _loc2_[_loc4_].@name;
               if(_loc8_ != "AICue")
               {
                  _loc1_ += "ActList[" + _loc3_ + "]." + _loc8_ + ": " + currentScreenContainer.BF.ActList[_loc3_][_loc8_] + "\n";
               }
               _loc4_++;
            }
            _loc1_ += "****AICue:\n";
            for(_loc5_ in currentScreenContainer.BF.ActList[_loc3_].AICue)
            {
               _loc1_ += _loc5_ + ": [";
               for(_loc7_ in currentScreenContainer.BF.ActList[_loc3_].AICue[_loc5_])
               {
                  _loc1_ += _loc7_ + ": " + currentScreenContainer.BF.ActList[_loc3_].AICue[_loc5_][_loc7_] + ", ";
               }
               _loc1_ += "]\n";
            }
         }
         return _loc1_;
      }
      
      public function gatherInfo(param1:*, param2:*, param3:* = null, param4:* = "") : *
      {
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         if(param3 is Array && param3 != null)
         {
            _loc5_ = param3;
         }
         else
         {
            _loc5_ = param1;
         }
         for(_loc6_ in _loc5_)
         {
            if(param3 is Array)
            {
               _loc7_ = param3[_loc6_];
            }
            else
            {
               _loc7_ = _loc6_;
            }
            if(param1[_loc7_] !== undefined)
            {
               if((param1[_loc7_] is Object || param1[_loc7_] is Array) && !(param1[_loc7_] is Number) && !(param1[_loc7_] is String) && !(param1[_loc7_] is Boolean))
               {
                  if(param1[_loc7_] is Array && _loc7_ != "liquidsContainers")
                  {
                     param2[_loc7_] = [];
                  }
                  else
                  {
                     param2[_loc7_] = {};
                  }
                  gatherInfo(param1[_loc7_],param2[_loc7_],null,param4 + _loc7_ + ".");
               }
               else
               {
                  param2[_loc7_] = param1[_loc7_];
               }
            }
         }
      }
      
      public function generateSave() : *
      {
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc3_:* = undefined;
         var _loc9_:* = undefined;
         var _loc4_:* = undefined;
         var _loc1_:* = undefined;
         var _loc5_:* = {};
         var _loc10_:* = [];
         var _loc7_:* = [];
         gatherInfo(this,_loc5_,variablesToSave,"Game Data > ");
         for(_loc3_ in _loc5_.Squares)
         {
            for(_loc6_ in _loc5_.Squares[_loc3_])
            {
               _loc5_.Squares[_loc3_][_loc6_].Caravans = null;
               _loc5_.Squares[_loc3_][_loc6_].Towns = null;
            }
         }
         _loc5_.Story = {};
         _loc5_.storyClass = getQualifiedClassName(Story);
         var _loc2_:XMLList = describeType(Story)..variable;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length())
         {
            _loc9_ = false;
            if(getQualifiedClassName(Story[_loc2_[_loc3_].@name]) == "Object")
            {
               _loc5_.Story[_loc2_[_loc3_].@name] = {};
               _loc9_ = true;
            }
            if(getQualifiedClassName(Story[_loc2_[_loc3_].@name]) == "Array")
            {
               _loc5_.Story[_loc2_[_loc3_].@name] = [];
               _loc9_ = true;
            }
            if(_loc9_)
            {
               gatherInfo(Story[_loc2_[_loc3_].@name],_loc5_.Story[_loc2_[_loc3_].@name],null,"Story  > ");
            }
            else
            {
               _loc5_.Story[_loc2_[_loc3_].@name] = Story[_loc2_[_loc3_].@name];
            }
            _loc3_++;
         }
         _loc5_.Caravans = [];
         for(_loc3_ in Caravans)
         {
            _loc5_.Caravans[_loc3_] = {};
            gatherInfo(Caravans[_loc3_],_loc5_.Caravans[_loc3_],Caravan.variablesToSave,"Caravan " + _loc3_ + " info > ");
            if(Caravans[_loc3_].randomPointer != null)
            {
               _loc5_.Caravans[_loc3_].randomPointer = Caravans[_loc3_].randomPointer;
               if(Caravans[_loc3_].fixedPeopleNum != null)
               {
                  _loc5_.Caravans[_loc3_].fixedPeopleNum = Caravans[_loc3_].fixedPeopleNum;
               }
            }
            else
            {
               _loc5_.Caravans[_loc3_].People = [];
               for(_loc6_ in Caravans[_loc3_].People)
               {
                  _loc10_.push(Caravans[_loc3_].People[_loc6_]);
                  _loc5_.Caravans[_loc3_].People.push(_loc10_.length - 1);
               }
               _loc5_.Caravans[_loc3_].Transport = [];
               for(_loc6_ in Caravans[_loc3_].Transport)
               {
                  _loc7_.push(Caravans[_loc3_].Transport[_loc6_]);
                  _loc5_.Caravans[_loc3_].Transport.push(_loc7_.length - 1);
               }
               _loc5_.Caravans[_loc3_].Cargo = [];
               for(_loc6_ in Caravans[_loc3_].Cargo)
               {
                  _loc5_.Caravans[_loc3_].Cargo[_loc6_] = {
                     "type":Caravans[_loc3_].Cargo[_loc6_].type,
                     "amount":Caravans[_loc3_].Cargo[_loc6_].amount,
                     "inUse":Caravans[_loc3_].Cargo[_loc6_].inUse,
                     "averagePrice":Caravans[_loc3_].Cargo[_loc6_].averagePrice
                  };
               }
            }
         }
         for(_loc3_ in Caravans)
         {
            _loc5_.Caravans[_loc3_].recentlyInteractedCaravans = [];
            for(_loc6_ in Caravans[_loc3_].recentlyInteractedCaravans)
            {
               for(_loc8_ in Caravans)
               {
                  if(Caravans[_loc8_] == Caravans[_loc3_].recentlyInteractedCaravans[_loc6_])
                  {
                     _loc5_.Caravans[_loc3_].recentlyInteractedCaravans[_loc6_] = _loc8_;
                     break;
                  }
               }
            }
         }
         _loc5_.Towns = [];
         for(_loc3_ in Towns)
         {
            _loc5_.Towns[_loc3_] = {};
            gatherInfo(Towns[_loc3_],_loc5_.Towns[_loc3_],Town.variablesToSave,"Town info > ");
            _loc5_.Towns[_loc3_].people = [];
            for(_loc6_ in Towns[_loc3_].people)
            {
               _loc10_.push(Towns[_loc3_].people[_loc6_]);
               _loc5_.Towns[_loc3_].people[_loc6_] = _loc10_.length - 1;
            }
            _loc5_.Towns[_loc3_].locations = [];
            for(_loc6_ in Towns[_loc3_].locations)
            {
               _loc5_.Towns[_loc3_].locations[_loc6_] = {};
               _loc4_ = [];
               for(_loc8_ in Towns[_loc3_].locations[_loc6_])
               {
                  if(_loc8_ != "stock" && _loc8_ != "slaves" && _loc8_ != "transport" && _loc8_ != "people")
                  {
                     _loc4_.push(_loc8_);
                  }
               }
               gatherInfo(Towns[_loc3_].locations[_loc6_],_loc5_.Towns[_loc3_].locations[_loc6_],_loc4_,"Town location info > ");
               if(Towns[_loc3_].locations[_loc6_].people is Array)
               {
                  _loc5_.Towns[_loc3_].locations[_loc6_].people = [];
                  _loc8_ = 0;
                  while(_loc8_ < Towns[_loc3_].locations[_loc6_].people.length)
                  {
                     _loc10_.push(Towns[_loc3_].locations[_loc6_].people[_loc8_]);
                     _loc5_.Towns[_loc3_].locations[_loc6_].people[_loc8_] = _loc10_.length - 1;
                     _loc8_++;
                  }
               }
               _loc5_.Towns[_loc3_].locations[_loc6_].stock = [];
               for(_loc8_ in Towns[_loc3_].locations[_loc6_].stock)
               {
                  _loc5_.Towns[_loc3_].locations[_loc6_].stock[_loc8_] = {
                     "type":Towns[_loc3_].locations[_loc6_].stock[_loc8_].type,
                     "amount":Towns[_loc3_].locations[_loc6_].stock[_loc8_].amount
                  };
               }
               _loc5_.Towns[_loc3_].locations[_loc6_].slaves = [];
               for(_loc8_ in Towns[_loc3_].locations[_loc6_].slaves)
               {
                  _loc10_.push(Towns[_loc3_].locations[_loc6_].slaves[_loc8_]);
                  _loc5_.Towns[_loc3_].locations[_loc6_].slaves[_loc8_] = _loc10_.length - 1;
               }
               _loc5_.Towns[_loc3_].locations[_loc6_].transport = [];
               for(_loc8_ in Towns[_loc3_].locations[_loc6_].transport)
               {
                  _loc7_.push(Towns[_loc3_].locations[_loc6_].transport[_loc8_]);
                  _loc5_.Towns[_loc3_].locations[_loc6_].transport[_loc8_] = _loc7_.length - 1;
               }
            }
            _loc5_.Towns[_loc3_].industries = [];
            for(_loc6_ in Towns[_loc3_].industries)
            {
               _loc5_.Towns[_loc3_].industries[_loc6_] = {};
               gatherInfo(Towns[_loc3_].industries[_loc6_],_loc5_.Towns[_loc3_].industries[_loc6_],Industry.variablesToSave,"Industry info > ");
            }
            _loc5_.Towns[_loc3_].playersIndustries = [];
            for(_loc6_ in Towns[_loc3_].playersIndustries)
            {
               _loc5_.Towns[_loc3_].playersIndustries[_loc6_] = {};
               gatherInfo(Towns[_loc3_].playersIndustries[_loc6_],_loc5_.Towns[_loc3_].playersIndustries[_loc6_],Industry.variablesToSave,"Player\'s industry info > ");
            }
            _loc5_.Towns[_loc3_].stock = [];
            for(_loc6_ in Towns[_loc3_].stock)
            {
               _loc5_.Towns[_loc3_].stock[_loc6_] = {
                  "type":Towns[_loc3_].stock[_loc6_].type,
                  "amount":Towns[_loc3_].stock[_loc6_].amount
               };
            }
            _loc5_.Towns[_loc3_].playersStorage = [];
            for(_loc6_ in Towns[_loc3_].playersStorage)
            {
               if(Towns[_loc3_].playersStorage[_loc6_] is TransportUnit)
               {
                  _loc5_.Towns[_loc3_].playersStorage[_loc6_] = {
                     "kind":2,
                     "vehicle":_loc7_.push(Towns[_loc3_].playersStorage[_loc6_]) - 1
                  };
               }
               else
               {
                  _loc5_.Towns[_loc3_].playersStorage[_loc6_] = {
                     "kind":1,
                     "type":Towns[_loc3_].playersStorage[_loc6_].type,
                     "amount":Towns[_loc3_].playersStorage[_loc6_].amount
                  };
               }
            }
         }
         _loc5_.People = [];
         for(_loc3_ in _loc10_)
         {
            _loc5_.People[_loc3_] = {};
            if(_loc10_[_loc3_].randomPointer != null)
            {
               _loc5_.People[_loc3_].randomPointer = _loc10_[_loc3_].randomPointer;
            }
            else
            {
               gatherInfo(_loc10_[_loc3_],_loc5_.People[_loc3_],Character.variablesToSave,"Character Info > ");
            }
            _loc5_.People[_loc3_].equipment = [];
            for(_loc6_ in _loc10_[_loc3_].equipment)
            {
               _loc5_.People[_loc3_].equipment[_loc6_] = {
                  "type":_loc10_[_loc3_].equipment[_loc6_].type,
                  "amount":_loc10_[_loc3_].equipment[_loc6_].amount,
                  "inUse":_loc10_[_loc3_].equipment[_loc6_].inUse
               };
            }
            _loc5_.People[_loc3_].loadedAmmo = [];
            for(_loc6_ in _loc10_[_loc3_].loadedAmmo)
            {
               if(_loc10_[_loc3_].loadedAmmo[_loc6_] is Item)
               {
                  _loc5_.People[_loc3_].loadedAmmo[_loc6_] = {
                     "type":_loc10_[_loc3_].loadedAmmo[_loc6_].type,
                     "amount":_loc10_[_loc3_].loadedAmmo[_loc6_].amount,
                     "inUse":_loc10_[_loc3_].loadedAmmo[_loc6_].inUse
                  };
               }
               else
               {
                  _loc5_.People[_loc3_].loadedAmmo[_loc6_] = null;
               }
            }
            if(_loc10_[_loc3_].passengerIn is TransportUnit)
            {
               for(_loc6_ in _loc7_)
               {
                  if(_loc10_[_loc3_].passengerIn == _loc7_[_loc6_])
                  {
                     _loc5_.People[_loc3_].passengerIn = _loc6_;
                     break;
                  }
               }
            }
         }
         _loc5_.Transport = [];
         for(_loc3_ in _loc7_)
         {
            _loc5_.Transport[_loc3_] = {};
            if(_loc7_[_loc3_].randomPointer != null)
            {
               _loc5_.Transport[_loc3_].randomPointer = _loc7_[_loc3_].randomPointer;
               _loc5_.Transport[_loc3_].type = _loc7_[_loc3_].type;
            }
            else
            {
               gatherInfo(_loc7_[_loc3_],_loc5_.Transport[_loc3_],TransportUnit.variablesToSave,"Transport Info > ");
            }
            if(_loc7_[_loc3_].attachedTo is TransportUnit)
            {
               for(_loc6_ in _loc7_)
               {
                  if(_loc7_[_loc6_] == _loc7_[_loc3_].attachedTo)
                  {
                     _loc5_.Transport[_loc3_].attachedTo = _loc6_;
                     break;
                  }
               }
            }
            if(_loc7_[_loc3_].cart is TransportUnit)
            {
               for(_loc6_ in _loc7_)
               {
                  if(_loc7_[_loc6_] == _loc7_[_loc3_].cart)
                  {
                     _loc5_.Transport[_loc3_].cart = _loc6_;
                     break;
                  }
               }
            }
            _loc5_.Transport[_loc3_].Passengers = [];
            for(_loc6_ in _loc7_[_loc3_].Passengers)
            {
               if(_loc7_[_loc3_].Passengers[_loc6_] is TransportUnit)
               {
                  for(_loc8_ in _loc7_)
                  {
                     if(_loc7_[_loc8_] == _loc7_[_loc3_].Passengers[_loc6_])
                     {
                        _loc5_.Transport[_loc3_].Passengers[_loc6_] = {
                           "type":1,
                           "index":_loc8_
                        };
                        break;
                     }
                  }
               }
               else
               {
                  for(_loc8_ in _loc10_)
                  {
                     if(_loc10_[_loc8_] == _loc7_[_loc3_].Passengers[_loc6_])
                     {
                        _loc5_.Transport[_loc3_].Passengers[_loc6_] = {
                           "type":2,
                           "index":_loc8_
                        };
                        break;
                     }
                  }
               }
            }
            if(_loc7_[_loc3_].passengerIn is TransportUnit)
            {
               for(_loc6_ in _loc7_)
               {
                  if(_loc7_[_loc6_] == _loc7_[_loc3_].passengerIn)
                  {
                     _loc5_.Transport[_loc3_].passengerIn = _loc6_;
                     break;
                  }
               }
            }
            if(_loc7_[_loc3_].mother is TransportUnit)
            {
               for(_loc6_ in _loc7_)
               {
                  if(_loc7_[_loc6_] == _loc7_[_loc3_].mother)
                  {
                     _loc5_.Transport[_loc3_].mother = _loc6_;
                     break;
                  }
               }
            }
         }
         for(_loc3_ in staticsToSave)
         {
            _loc5_[staticsToSave[_loc3_]] = GameData[staticsToSave[_loc3_]];
         }
         _loc5_.build = parent.build;
         _loc1_ = new ByteArray();
         _loc1_.writeObject(_loc5_);
         _loc1_.compress("zlib");
         trace("object length after compression: " + _loc1_.length);
         return _loc1_;
      }
      
      public function load(param1:*, param2:* = null) : *
      {
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc8_:* = undefined;
         var _loc14_:* = undefined;
         var _loc12_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc15_:* = undefined;
         var _loc3_:* = undefined;
         var _loc17_:* = undefined;
         var _loc9_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         _loc11_ = undefined;
         var _loc18_:* = undefined;
         if(param2 == null || param2 == 0)
         {
            _loc5_ = new ByteArray();
            _loc5_.writeBytes(param1,0,param1);
            _loc5_.uncompress("zlib");
            _loc4_ = _loc5_.readObject();
            _loc14_ = [];
            _loc12_ = [];
         }
         else
         {
            _loc4_ = storeLoadObj;
            _loc14_ = storeLoadPeople;
            _loc12_ = storeLoadTransport;
         }
         if(param2 == 0)
         {
            storeLoadObj = _loc4_;
            storeLoadPeople = _loc14_;
            storeLoadTransport = _loc12_;
         }
         if(param2 == 1 || param2 == null)
         {
            var _loc16_:* = [];
            for(_loc8_ in _loc4_.initiatedDLC)
            {
               if(_loc4_.initiatedDLC[_loc8_] && (_loc4_.removedDLC == undefined || !_loc4_.removedDLC[_loc8_]))
               {
                  _loc15_ = false;
                  for(_loc10_ in parent.loadedDLC)
                  {
                     if(parent.loadedDLC[_loc10_].id == _loc8_)
                     {
                        _loc15_ = true;
                        break;
                     }
                  }
                  if(!_loc15_)
                  {
                     _loc16_.push(_loc8_);
                  }
               }
            }
            if(_loc16_.length > 0)
            {
               displayDLCIncompatibilityWarning = true;
               for(_loc8_ in _loc4_.Towns)
               {
                  if(!(Presets.town_presets[0][_loc8_] is Object))
                  {
                     delete _loc4_.Towns[_loc8_];
                  }
               }
               for(_loc8_ in _loc4_.People)
               {
                  if(_loc4_.People[_loc8_].equipment is Array)
                  {
                     _loc10_ = 0;
                     while(_loc10_ < _loc4_.People[_loc8_].equipment.length)
                     {
                        if(!(Item.Items[_loc4_.People[_loc8_].equipment[_loc10_].type] is Object))
                        {
                           _loc4_.People[_loc8_].equipment.splice(_loc10_,1);
                           _loc10_--;
                        }
                        _loc10_++;
                     }
                  }
               }
               for(_loc8_ in _loc4_.Caravans)
               {
                  if(_loc4_.Caravans[_loc8_].Cargo is Array)
                  {
                     _loc10_ = 0;
                     while(_loc10_ < _loc4_.Caravans[_loc8_].Cargo.length)
                     {
                        if(!(Item.Items[_loc4_.Caravans[_loc8_].Cargo[_loc10_].type] is Object))
                        {
                           _loc4_.Caravans[_loc8_].Cargo.splice(_loc10_,1);
                           _loc10_--;
                        }
                        _loc10_++;
                     }
                  }
               }
               for(_loc8_ in _loc4_.Towns)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc4_.Towns[_loc8_].stock.length)
                  {
                     if(!(Item.Items[_loc4_.Towns[_loc8_].stock[_loc10_].type] is Object))
                     {
                        _loc4_.Towns[_loc8_].stock.splice(_loc10_,1);
                        _loc10_--;
                     }
                     _loc10_++;
                  }
                  _loc10_ = 0;
                  while(_loc10_ < _loc4_.Towns[_loc8_].playersStorage.length)
                  {
                     if(!(Item.Items[_loc4_.Towns[_loc8_].playersStorage[_loc10_].type] is Object))
                     {
                        _loc4_.Towns[_loc8_].playersStorage.splice(_loc10_,1);
                        _loc10_--;
                     }
                     _loc10_++;
                  }
                  for(_loc10_ in _loc4_.Towns[_loc8_].locations)
                  {
                     if(_loc4_.Towns[_loc8_].locations[_loc10_].stock is Array)
                     {
                        _loc11_ = 0;
                        while(_loc11_ < _loc4_.Towns[_loc8_].locations[_loc10_].stock.length)
                        {
                           if(!(Item.Items[_loc4_.Towns[_loc8_].locations[_loc10_].stock[_loc11_].type] is Object))
                           {
                              _loc4_.Towns[_loc8_].locations[_loc10_].stock.splice(_loc11_,1);
                              _loc11_--;
                           }
                           _loc11_++;
                        }
                     }
                     if(_loc4_.Towns[_loc8_].locations[_loc10_].assortment is Array)
                     {
                        _loc11_ = 0;
                        while(_loc11_ < _loc4_.Towns[_loc8_].locations[_loc10_].assortment.length)
                        {
                           if(!(Item.Items[_loc4_.Towns[_loc8_].locations[_loc10_].assortment[_loc11_].item] is Object))
                           {
                              _loc4_.Towns[_loc8_].locations[_loc10_].assortment.splice(_loc11_,1);
                              _loc11_--;
                           }
                           _loc11_++;
                        }
                     }
                  }
               }
               for(_loc8_ in _loc4_.People)
               {
                  for(_loc10_ in _loc4_.People[_loc8_].weapons)
                  {
                     if(!(WeaponsData.Weapons[_loc4_.People[_loc8_].weapons[_loc10_]] is Object))
                     {
                        _loc4_.People[_loc8_].weapons[_loc10_] = 0;
                     }
                  }
               }
               _loc8_ = 0;
               while(_loc8_ < _loc4_.Story.acceptedQuests.length)
               {
                  if(GameData.missionDescriptions[_loc4_.Story.acceptedQuests[_loc8_]] == undefined)
                  {
                     _loc4_.Story.acceptedQuests.splice(_loc8_,1);
                     _loc8_--;
                  }
                  _loc8_++;
               }
               _loc8_ = 0;
               while(_loc8_ < _loc4_.Story.failedQuests.length)
               {
                  if(GameData.missionDescriptions[_loc4_.Story.failedQuests[_loc8_]] == undefined)
                  {
                     _loc4_.Story.failedQuests.splice(_loc8_,1);
                     _loc8_--;
                  }
                  _loc8_++;
               }
               _loc8_ = 0;
               while(_loc8_ < _loc4_.Story.completedQuests.length)
               {
                  if(GameData.missionDescriptions[_loc4_.Story.completedQuests[_loc8_]] == undefined)
                  {
                     _loc4_.Story.completedQuests.splice(_loc8_,1);
                     _loc8_--;
                  }
                  _loc8_++;
               }
            }
            gatherInfo(_loc4_,this,variablesToSave,"Game Data > ");
            for(_loc8_ in _loc16_)
            {
               removedDLC[_loc16_[_loc8_]] = true;
            }
            if(_loc4_.seed == undefined)
            {
               seed = Rndm.seed = Math.random() * 16777215;
            }
            else
            {
               Rndm.seed = _loc4_.seed;
            }
            if(_loc4_.customTowns == undefined)//-no custom towns in save? could be from old build
            {
               customTowns = []
            }
            else //-restore customTowns from save
            {
               customTowns = _loc4_.customTowns
            }
            if(_loc4_.storyClass != undefined)
            {
               _loc3_ = getDefinitionByName(_loc4_.storyClass) as Class;
               Story = new _loc3_();
            }
            delete _loc4_.Story.cannibal;
            gatherInfo(_loc4_.Story,Story,null,"Story > ");
            for(_loc8_ in Squares)
            {
               for(_loc10_ in Squares[_loc8_])
               {
                  if(Squares[_loc8_][_loc10_] is Object)
                  {
                     Squares[_loc8_][_loc10_].Caravans = [];
                     Squares[_loc8_][_loc10_].Towns = [];
                  }
                  else
                  {
                     delete Squares[_loc8_][_loc10_];
                  }
               }
            }
         }
         if(param2 == 2 || param2 == null)
         {
            for(_loc8_ in _loc4_.Transport)
            {
               if(_loc4_.Transport[_loc8_].randomPointer != null)
               {
                  _loc12_[_loc8_] = new TransportUnit(_loc4_.Transport[_loc8_].type,false,_loc4_.Transport[_loc8_].randomPointer);
               }
               else
               {
                  _loc12_[_loc8_] = new TransportUnit(_loc4_.Transport[_loc8_].type);
                  gatherInfo(_loc4_.Transport[_loc8_],_loc12_[_loc8_],TransportUnit.variablesToSave,"Transport Info > ");
               }
            }
            for(_loc8_ in _loc4_.Transport)
            {
               if(_loc4_.Transport[_loc8_].attachedTo != undefined)
               {
                  _loc12_[_loc8_].attachedTo = _loc12_[_loc4_.Transport[_loc8_].attachedTo];
               }
               if(_loc4_.Transport[_loc8_].cart != undefined)
               {
                  _loc12_[_loc8_].cart = _loc12_[_loc4_.Transport[_loc8_].cart];
               }
               if(_loc4_.Transport[_loc8_].passengerIn != undefined)
               {
                  _loc12_[_loc8_].passengerIn = _loc12_[_loc4_.Transport[_loc8_].passengerIn];
               }
               if(_loc4_.Transport[_loc8_].mother != undefined)
               {
                  _loc12_[_loc8_].mother = _loc12_[_loc4_.Transport[_loc8_].mother];
               }
            }
            for(_loc8_ in _loc4_.People)
            {
               if(_loc4_.People[_loc8_].randomPointer != null)
               {
                  _loc14_[_loc8_] = new Character({"setPointer":_loc4_.People[_loc8_].randomPointer});
               }
               else
               {
                  _loc14_[_loc8_] = new Character({"disableRandom":true});
               }
               gatherInfo(_loc4_.People[_loc8_],_loc14_[_loc8_],Character.variablesToSave,"Character Info > ");
               _loc14_[_loc8_].equipment = [];
               for(_loc10_ in _loc4_.People[_loc8_].equipment)
               {
                  _loc14_[_loc8_].equipment[_loc10_] = new Item(_loc4_.People[_loc8_].equipment[_loc10_].type,_loc4_.People[_loc8_].equipment[_loc10_].amount);
                  _loc14_[_loc8_].equipment[_loc10_].inUse = _loc4_.People[_loc8_].equipment[_loc10_].inUse;
               }
               _loc14_[_loc8_].loadedAmmo = [];
               for(_loc10_ in _loc4_.People[_loc8_].loadedAmmo)
               {
                  if(_loc4_.People[_loc8_].loadedAmmo[_loc10_] != null)
                  {
                     _loc14_[_loc8_].loadedAmmo[_loc10_] = new Item(_loc4_.People[_loc8_].loadedAmmo[_loc10_].type,_loc4_.People[_loc8_].loadedAmmo[_loc10_].amount);
                     _loc14_[_loc8_].loadedAmmo[_loc10_].inUse = _loc4_.People[_loc8_].loadedAmmo[_loc10_].inUse;
                  }
                  else
                  {
                     _loc14_[_loc8_].loadedAmmo[_loc10_] = null;
                  }
               }
               if(_loc4_.People[_loc8_].passengerIn != undefined)
               {
                  _loc14_[_loc8_].passengerIn = _loc12_[_loc4_.People[_loc8_].passengerIn];
               }
            }
            for(_loc8_ in _loc4_.Transport)
            {
               _loc12_[_loc8_].Passengers = [];
               for(_loc10_ in _loc4_.Transport[_loc8_].Passengers)
               {
                  if(_loc4_.Transport[_loc8_].Passengers[_loc10_].type == 1)
                  {
                     _loc12_[_loc8_].Passengers[_loc10_] = _loc12_[_loc4_.Transport[_loc8_].Passengers[_loc10_].index];
                  }
                  else
                  {
                     _loc12_[_loc8_].Passengers[_loc10_] = _loc14_[_loc4_.Transport[_loc8_].Passengers[_loc10_].index];
                  }
               }
            }
         }
         if(param2 == 3 || param2 == null)
         {
            Caravans = [];
            _loc17_ = false;
            for(_loc8_ in _loc4_.Caravans)
            {
               Caravans[_loc8_] = new Caravan(_loc4_.Caravans[_loc8_].type);
               gatherInfo(_loc4_.Caravans[_loc8_],Caravans[_loc8_],Caravan.variablesToSave,"Caravan info > ");
               if(_loc4_.Caravans[_loc8_].aggressive == undefined)
               {
                  Caravans[_loc8_].aggressive = _loc4_.Caravans[_loc8_].agressive;
               }
               if(_loc4_.Caravans[_loc8_].randomPointer != null)
               {
                  if(_loc4_.Caravans[_loc8_].fixedPeopleNum == undefined)
                  {
                     equipRandomCaravan(Caravans[_loc8_],null,_loc4_.Caravans[_loc8_].randomPointer);
                  }
                  else
                  {
                     equipRandomCaravan(Caravans[_loc8_],_loc4_.Caravans[_loc8_].fixedPeopleNum,_loc4_.Caravans[_loc8_].randomPointer);
                  }
               }
               else
               {
                  _loc17_ = false;
                  Caravans[_loc8_].People = [];
                  for(_loc10_ in _loc4_.Caravans[_loc8_].People)
                  {
                     Caravans[_loc8_].People[_loc10_] = _loc14_[_loc4_.Caravans[_loc8_].People[_loc10_]];
                     Caravans[_loc8_].People[_loc10_].group = Caravans[_loc8_].People[_loc10_].caravan = Caravans[_loc8_];
                     if(Caravans[_loc8_].People[_loc10_].randomPointer != null)
                     {
                        _loc17_ = true;
                     }
                  }
                  Caravans[_loc8_].Transport = [];
                  for(_loc10_ in _loc4_.Caravans[_loc8_].Transport)
                  {
                     Caravans[_loc8_].Transport[_loc10_] = _loc12_[_loc4_.Caravans[_loc8_].Transport[_loc10_]];
                  }
                  Caravans[_loc8_].Cargo = [];
                  for(_loc10_ in _loc4_.Caravans[_loc8_].Cargo)
                  {
                     Caravans[_loc8_].Cargo[_loc10_] = new Item(_loc4_.Caravans[_loc8_].Cargo[_loc10_].type,_loc4_.Caravans[_loc8_].Cargo[_loc10_].amount);
                     Caravans[_loc8_].Cargo[_loc10_].inUse = _loc4_.Caravans[_loc8_].Cargo[_loc10_].inUse;
                     Caravans[_loc8_].Cargo[_loc10_].averagePrice = _loc4_.Caravans[_loc8_].Cargo[_loc10_].averagePrice;
                  }
                  if(_loc17_)
                  {
                     for(_loc10_ in Caravans[_loc8_].Cargo)
                     {
                        Caravans[_loc8_].Cargo[_loc10_].inUse = 0;
                     }
                     for(_loc10_ in Caravans[_loc8_].People)
                     {
                        Caravans[_loc8_].People[_loc10_].equipment = [];
                        Caravans[_loc8_].People[_loc10_].Headgear = 0;
                        Caravans[_loc8_].People[_loc10_].Jacket = 0;
                        Caravans[_loc8_].People[_loc10_].weapons = [0,0];
                        Caravans[_loc8_].People[_loc10_].attachments = [[],[]];
                        Caravans[_loc8_].People[_loc10_].grenadeAmounts = [0,0];
                        Caravans[_loc8_].People[_loc10_].loadedAmmo = [null,null];
                        Caravans[_loc8_].People[_loc10_].selectedAmmo = [null,null];
                     }
                     Caravans[_loc8_].distributeWeapons();
                     Caravans[_loc8_].distributeAmmo();
                     Caravans[_loc8_].distributeArmor();
                  }
               }
               Caravans[_loc8_].staticMode = true;
               Caravans[_loc8_].update();
            }
            for(_loc8_ in _loc4_.Caravans)
            {
               Caravans[_loc8_].recentlyInteractedCaravans = [];
               for(_loc10_ in _loc4_.Caravans[_loc8_].recentlyInteractedCaravans)
               {
                  Caravans[_loc8_].recentlyInteractedCaravans[_loc10_] = Caravans[_loc4_.Caravans[_loc8_].recentlyInteractedCaravans[_loc10_]];
               }
            }
         }
         if(param2 == 4 || param2 == null)
         {
            Towns = [];
            //-reset to base locations
            Presets.Towns.splice(85, Presets.Towns.length - 85);
            
            if(customTowns == undefined)//+-sanity check, i think i can remove this
               customTowns = []

            //-get customtown data from save
            //then add that data to presets
            var customTownIndex:* = 0;
            for(customTownIndex in customTowns)
            {
               var customTownAlt:* = customTowns[customTownIndex]
               parent.setLocation(customTownAlt.index, customTownAlt.data)
            }

            for(_loc8_ in Presets.Towns)
            {
               Towns[_loc8_] = new Town(_loc8_,this);
            }
            for(_loc8_ in _loc4_.Towns)
            {
               if(!(Presets.Towns[_loc8_].resetBeforeBuild != undefined && (Presets.Towns[_loc8_].resetBeforeBuild > _loc4_.build || _loc4_.build == undefined)))
               {
                  Towns[_loc8_] = new Town(_loc4_.Towns[_loc8_].type,this);
                  gatherInfo(_loc4_.Towns[_loc8_],Towns[_loc8_],Town.variablesToSave,"Town info > ");
                  Towns[_loc8_].people = [];
                     for(_loc10_ in _loc4_.Towns[_loc8_].people)
                     {
                        Towns[_loc8_].people[_loc10_] = _loc14_[_loc4_.Towns[_loc8_].people[_loc10_]];
                     }
                     for(_loc10_ in _loc4_.Towns[_loc8_].locations)
                     {
                        Towns[_loc8_].locations[_loc10_] = {};
                        _loc9_ = [];
                        for(_loc11_ in _loc4_.Towns[_loc8_].locations[_loc10_])
                        {
                           if(_loc11_ != "stock" && _loc11_ != "slaves" && _loc11_ != "transport")
                           {
                              _loc9_.push(_loc11_);
                           }
                        }
                        gatherInfo(_loc4_.Towns[_loc8_].locations[_loc10_],Towns[_loc8_].locations[_loc10_],_loc9_,"Town location info > ");
                        if(_loc4_.Towns[_loc8_].locations[_loc10_].people is Array)
                        {
                           Towns[_loc8_].locations[_loc10_].people = [];
                           for(_loc11_ in _loc4_.Towns[_loc8_].locations[_loc10_].people)
                           {
                              Towns[_loc8_].locations[_loc10_].people[_loc11_] = _loc14_[_loc4_.Towns[_loc8_].locations[_loc10_].people[_loc11_]];
                           }
                        }
                        Towns[_loc8_].locations[_loc10_].stock = [];
                        for(_loc11_ in _loc4_.Towns[_loc8_].locations[_loc10_].stock)
                        {
                           Towns[_loc8_].locations[_loc10_].stock[_loc11_] = new Item(_loc4_.Towns[_loc8_].locations[_loc10_].stock[_loc11_].type,_loc4_.Towns[_loc8_].locations[_loc10_].stock[_loc11_].amount);
                        }
                        Towns[_loc8_].locations[_loc10_].slaves = [];
                        for(_loc11_ in _loc4_.Towns[_loc8_].locations[_loc10_].slaves)
                        {
                           Towns[_loc8_].locations[_loc10_].slaves[_loc11_] = _loc14_[_loc4_.Towns[_loc8_].locations[_loc10_].slaves[_loc11_]];
                        }
                        Towns[_loc8_].locations[_loc10_].transport = [];
                        for(_loc11_ in _loc4_.Towns[_loc8_].locations[_loc10_].transport)
                        {
                           Towns[_loc8_].locations[_loc10_].transport[_loc11_] = _loc12_[_loc4_.Towns[_loc8_].locations[_loc10_].transport[_loc11_]];
                        }
                     }
                     Towns[_loc8_].industries = [];
                     for(_loc10_ in _loc4_.Towns[_loc8_].industries)
                     {
                        Towns[_loc8_].industries[_loc10_] = new Industry(_loc4_.Towns[_loc8_].industries[_loc10_].type,_loc4_.Towns[_loc8_].industries[_loc10_].employees,Towns[_loc8_]);
                        gatherInfo(_loc4_.Towns[_loc8_].industries[_loc10_],Towns[_loc8_].industries[_loc10_],Industry.variablesToSave,"Industry info > ");
                     }
                     Towns[_loc8_].playersIndustries = [];
                     for(_loc10_ in _loc4_.Towns[_loc8_].playersIndustries)
                     {
                        Towns[_loc8_].playersIndustries[_loc10_] = new Industry(_loc4_.Towns[_loc8_].playersIndustries[_loc10_].type,_loc4_.Towns[_loc8_].playersIndustries[_loc10_].employees,Towns[_loc8_]);
                        gatherInfo(_loc4_.Towns[_loc8_].playersIndustries[_loc10_],Towns[_loc8_].playersIndustries[_loc10_],Industry.variablesToSave,"Industry info > ");
                     }
                     Towns[_loc8_].stock = [];
                     for(_loc10_ in _loc4_.Towns[_loc8_].stock)
                     {
                        Towns[_loc8_].stock[_loc10_] = new Item(_loc4_.Towns[_loc8_].stock[_loc10_].type,_loc4_.Towns[_loc8_].stock[_loc10_].amount);
                        if(Towns[_loc8_].stock[_loc10_].amount <= 0)
                        {
                           Towns[_loc8_].stock[_loc10_].amount = 0;
                        }
                     }
                     Towns[_loc8_].playersStorage = [];
                     for(_loc10_ in _loc4_.Towns[_loc8_].playersStorage)
                     {
                        if(_loc4_.Towns[_loc8_].playersStorage[_loc10_].kind == 2)
                        {
                           Towns[_loc8_].playersStorage[_loc10_] = _loc12_[_loc4_.Towns[_loc8_].playersStorage[_loc10_].vehicle];
                        }
                        else
                        {
                           Towns[_loc8_].playersStorage[_loc10_] = new Item(_loc4_.Towns[_loc8_].playersStorage[_loc10_].type,_loc4_.Towns[_loc8_].playersStorage[_loc10_].amount);
                        }
                     }
                  }
            }
         }
         if(param2 == 5 || param2 == null)
         {
            for(_loc8_ in staticsToSave)
            {
               GameData[staticsToSave[_loc8_]] = _loc4_[staticsToSave[_loc8_]];
            }
            if(_loc4_.Towns[23] != undefined)
            {
               Towns[23].locations[0].visible = _loc4_.Towns[23].locations[0].visible;
               Towns[23].discovered = _loc4_.Towns[23].discovered;
            }
            if(_loc4_.Towns[24] != undefined)
            {
               Towns[24].locations[0].visible = _loc4_.Towns[24].locations[0].visible;
               Towns[24].discovered = _loc4_.Towns[24].discovered;
            }
            for(_loc8_ in Presets.Towns)
            {
               setSquareValue(Math.floor(Presets.Towns[_loc8_].x / 500),Math.floor(Presets.Towns[_loc8_].y / 500),"town",_loc8_);
            }
            if(foodAveragePrice == undefined)
            {
               _loc6_ = 0;
               var _loc13_:* = 0;
               for(_loc8_ in Item.Goods)
               {
                  if(Item.Goods[_loc8_] is Object && Item.Goods[_loc8_].food)
                  {
                     _loc6_ += globalItemPrice(Item.itemNumFromCatSubCat(1,_loc8_));
                     _loc13_ += Item.Goods[_loc8_].calories;
                  }
               }
               foodAveragePrice = _loc6_ / _loc13_;
            }
            for(_loc10_ in itemCategories)
            {
               if(itemCategories[_loc10_] != "food" && GameData[itemCategories[_loc10_] + "AveragePrice"] == undefined)
               {
                  _loc6_ = 0;
                  _loc7_ = 0;
                  for(_loc8_ in Item.Items)
                  {
                     if(_loc8_ != 0 && Item.getDataFromType(_loc8_)[itemCategories[_loc10_]])
                     {
                        _loc6_ += globalItemPrice(_loc8_);
                        _loc7_++;
                     }
                  }
                  GameData[itemCategories[_loc10_] + "AveragePrice"] = _loc6_ / _loc7_;
               }
            }
            if(GameData.averageGDPperCapita == undefined)
            {
               GameData.averageGDPperCapita = 400;
            }
            for(_loc8_ in Presets.FactionRelations)
            {
               if(factionRelations[_loc8_] == undefined)
               {
                  factionRelations[_loc8_] = Presets.FactionRelations[_loc8_];
               }
            }
            for(_loc8_ in workshopRecipes)
            {
               if(producedToday[_loc8_] == undefined)
               {
                  producedToday[_loc8_] = 0;
               }
            }
            if(Story.boltsToBring < 0)
            {
               Story.boltsToBring = 0;
            }
            if(_loc4_.Towns[34] == undefined)
            {
               Towns[34].active = false;
            }
            if(monthlyCounter == undefined)
            {
               monthlyCounter = 0;
            }
            for(_loc8_ in Towns)
            {
               _loc10_ = 0;
               while(_loc10_ < Towns[_loc8_].industries.length)
               {
                  if(Towns[_loc8_].industries[_loc10_].employees == 0)
                  {
                     Towns[_loc8_].industries.splice(_loc10_,1);
                     _loc10_--;
                  }
                  _loc10_++;
               }
            }
            for(_loc8_ in Caravans)//+- crash custom caravan
            {
               if(Caravans[_loc8_].category == 5)
               {
                  directCaravanToTown(Caravans[_loc8_],Presets.caravanRoutes[Caravans[_loc8_].route].points[Caravans[_loc8_].routePoint].town);
               }
            }
            for(_loc11_ in Caravans)
            {
               for(_loc8_ in Caravans[_loc11_].groupSettings)
               {
                  if(Caravans[_loc11_].groupSettings[_loc8_] is Object)
                  {
                     for(_loc10_ in Item.Goods)
                     {
                        if(Item.Goods[_loc10_] is Object && Item.Goods[_loc10_].food)
                        {
                           if(Caravans[_loc11_].groupSettings[_loc8_].foodstuffs[_loc10_] == undefined)
                           {
                              Caravans[_loc11_].groupSettings[_loc8_].foodstuffs[_loc10_] = 10;
                           }
                        }
                     }
                  }
               }
            }
            for(_loc8_ in reputationNames)
            {
               if(Story.specificReputations[_loc8_] == undefined)
               {
                  Story.specificReputations[_loc8_] = 0;
               }
            }
            for(_loc8_ in Industry.Types)
            {
               for(_loc10_ in Industry.Types[_loc8_].consumption)
               {
                  if(globalPrices[Industry.Types[_loc8_].consumption[_loc10_].item] == undefined)
                  {
                     globalPrices[Industry.Types[_loc8_].consumption[_loc10_].item] = Item.getDataFromType(Industry.Types[_loc8_].consumption[_loc10_].item).price;
                  }
               }
               for(_loc10_ in Industry.Types[_loc8_].production)
               {
                  if(globalPrices[Industry.Types[_loc8_].production[_loc10_].item] == undefined)
                  {
                     globalPrices[Industry.Types[_loc8_].production[_loc10_].item] = Item.getDataFromType(Industry.Types[_loc8_].production[_loc10_].item).price;
                  }
               }
            }
            displayedTutorials[34] = true;
            if(globalPrices[174] == undefined)
            {
               globalPrices[174] = Item.getDataFromType(174).price;
            }
            if(Story.laMissionInProgress == 2)
            {
               Towns[32].locations[4].visible = true;
            }
            if(Story.laMissionInProgress == 3 && Story.startedWorkingwithNora && !Story.mikazePoliceDefeated && !Story.allRebelsAreDead && !Story.rebelsReturned)
            {
               _loc18_ = true;
               for(_loc8_ in Caravans)
               {
                  if(Caravans[_loc8_].active && Caravans[_loc8_].specialPurpose == 13)
                  {
                     _loc18_ = false;
                     break;
                  }
               }
               if(_loc18_)
               {
                  executeMajorEvent(64);
               }
            }
            if(_loc4_.build <= 110)
            {
               Towns[37].locations[10].visible = false;
               Towns[12].locations[7].name = 5878;
               revealedFactions = [];
               _loc8_ = 1;
               while(_loc8_ < Presets.factionNames.length)
               {
                  revealedFactions[_loc8_] = true;
                  _loc8_++;
               }
               if(Story.askedPimAboutAlmanac)
               {
                  Story.lookingForNauticalAlmanac = false;
               }
            }
            if(_loc4_.build <= 118)
            {
               Story.knowWhatHappenedToEmiliasBaby = true;
            }
            if(_loc4_.build <= 157)
            {
               mode = 0;
            }
            Towns[2].locations[1].visible = false;
            for(_loc8_ in Story.acceptedQuests)
            {
               if(Story.acceptedQuests[_loc8_] == 24)
               {
                  Story.jacobsQuestInProgress = true;
                  Story.dialogueDefaults[26] = 1138;
                  break;
               }
            }
            if(_loc4_.build < 127)
            {
               if(Story.federationStartedDefehse && !Story.federationCapturedQubba && !Story.qubbaCapturedTheFederation)
               {
                  executeMajorEvent(80,true);
               }
            }
            if(_loc4_.build < 128)
            {
               for(_loc8_ in Presets.caravanRoutes)
               {
                  if(Presets.caravanRoutes[_loc8_].onInit)
                  {
                     missingRoutes.push(_loc8_);
                  }
               }
            }
            if(_loc4_.build < 147)
            {
               missingRoutes.push(28);
               if(Story.doneWithTheWinchester)
               {
                  missingRoutes.push(29);
               }
            }
            if(_loc4_.build < 144)
            {
               for(_loc8_ in Caravans)
               {
                  if(_loc8_ != 0 && Caravans[_loc8_].totalCargo > Caravans[_loc8_].maxCargo)
                  {
                     Caravans[_loc8_].moving = true;
                  }
               }
            }
            if(_loc4_.build < 152)
            {
               if(Story.mikazePoliceDefeated)
               {
                  for(_loc8_ in Caravans)
                  {
                     if(Caravans[_loc8_].specialPurpose == 9)
                     {
                        Caravans[_loc8_].guardPosition = null;
                        Caravans[_loc8_].moving = true;
                     }
                  }
               }
            }
            if(_loc4_.build < 156)
            {
               Caravans[0].People[0].updateBattlefieldAppearence();
            }
            if(_loc4_.build < 161)
            {
               for(_loc8_ in Caravans)
               {
                  Caravans[_loc8_].deflected = true;
               }
               for(_loc8_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc8_].specialPurpose == 8)
                  {
                     for(_loc10_ in Caravans[0].People[_loc8_].equipment)
                     {
                        Caravans[0].People[_loc8_].equipment[_loc10_].inUse = 0;
                     }
                  }
               }
            }
            if(_loc4_.build < 177)
            {
               if(Story.dialogueDefaults[15] == 641 && Story.broughtSpencerRiceToKivi)
               {
                  Story.dialogueDefaults[15] = 604;
               }
            }
            if(_loc4_.build < 178)
            {
               for(_loc8_ in Towns[7].industries)
               {
                  if(Towns[7].industries[_loc8_].type == 18)
                  {
                     Towns[7].industries[_loc8_].forSale = true;
                     break;
                  }
               }
            }
            storeLoadObj = null;
            storeLoadPeople = null;
            storeLoadTransport = null;
         }
      }
      
      public function initMusic(param1:* = null) : *
      {
         travelModeMusic = new TravelModeMusic().play(0,0,travelModeMusicControl);
         if(!travelModeMusic)
         {
            GameData.musicOn = false;
            return;
         }
         travelModeMusic.addEventListener("soundComplete",initMusic,false,0,false);
      }
      
      public function setMode(param1:*, param2:* = null, param3:* = null, param4:* = null, param5:* = null, param6:* = null) : *
      {
         var j:*;
         var k:*;
         var l:*;
         var addNew:*;
         var removeOld:*;
         var itemData:*;
         var totalBatteries:*;
         var personsBatteries:*;
         var i:*;
         var nc:*;
         var allKilled:*;
         var allKiviDead:*;
         var maxBatteries:*;
         var all:*;
         var descriptionText:*;
         var retButt:*;
         var retButtText:*;
         var FG:*;
         var maskedBmp:*;
         var alphas:*;
         var clearBmp:*;
         var erase:*;
         var introScr:*;
         var introText:*;
         var proceedButton:*;
         var proceedButtonText:*;
         var _loc8_:int;
         var _loc9_:*;
         var m:* = param1;
         var allies:* = param2;
         var opponents:* = param3;
         var neutral:* = param4;
         var settings:* = param5;
         var obstacles:* = param6;
         var skipAutoSave:* = false;
         if(mode == 2)
         {
            System.pauseForGCIfCollectionImminent(1);
            System.gc();
         }
         if(m == 1)
         {
            if(gameSpeed > 0 && !pauseOnExitTown && mapMode.dialoguesOpen.length == 0)
            {
               mapMode.musicFadeIn = true;
            }
            travelModeMusicControl.volume = 0;
            if(!musicPlaying)
            {
               initMusic();
               musicPlaying = true;
            }
         }
         if(m == 1)
         {
            displayTutorial(0,true);
         }
         if(m == 1 && (mode == 4 || mode == 7))
         {
            displayTutorial(1,true);
         }
         if(mode == 1)
         {
            mapMode.musicFadeOut = true;
         }
         if(storyMode && Story is Caravaneer2MainStory)
         {
            if(m == 1 && (mode == 4 || mode == 7))
            {
               if(Story is Caravaneer2MainStory)
               {
                  if(!Story.exitedBunker && Caravans[0].overTown == 15)
                  {
                     nc = Caravans.push(new Caravan(6,mapMode.mapSymbols)) - 1;
                     Caravans[nc].x = Presets.Towns[15].x;
                     Caravans[nc].y = Presets.Towns[15].y - 300;
                     equipRandomCaravan(Caravans[nc],2);
                     Caravans[nc].direction = 3.141592653589793;
                     Story.exitedBunker = true;
                  }
                  if(!Story.metFafnirInZonderhoop && Caravans[0].overTown == 59 && Story.drekarLeft && !Story.drekarDefeated && Story.talkedWithRichardWeaver && (Story.dialogueDefaults[8] == 516 || Story.dialogueDefaults[8] == 517))
                  {
                     Story.metFafnirInZonderhoop = true;
                     mapMode.openDialogue(29);
                     skipAutoSave = true;
                  }
                  if(Story.dialogueDefaults[1] == 164)
                  {
                     Story.dialogueDefaults[1] = 471;
                  }
                  if(Story.dialogueDefaults[2] == 240)
                  {
                     Story.dialogueDefaults[2] = 482;
                  }
                  if(Caravans[0] is Caravan && Caravans[0].overTown == 20 && Story.accompanyedByThum)
                  {
                     completeQuest(3);
                  }
                  if(Story.foundOutAboutTheBunker && !Story.decidedWhatToDoWithTheBaby)
                  {
                     Story.decidedWhatToDoWithTheBaby = true;
                     mapMode.openDialogue(22);
                  }
               }
            }
            if(mode == 2)
            {
               if(Story.reginsMenDefeated && !Story.loisWariorsLeft)
               {
                  executeMajorEvent(72);
               }
            }
            if(m == 2)
            {
               for(i in opponents)
               {
                  if(!opponents[i].aggressive)
                  {
                     affectSpecificReputation(5,-2);
                  }
                  if(opponents[i].category == 5)
                  {
                     missingRoutes.push(opponents[i].route);
                     opponents[i].category = 1;
                  }
                  if(opponents[i].specialPurpose == 1 || opponents[i].specialPurpose == 3)
                  {
                     Story.youHelpedDefeatDrekar = true;
                  }
                  if((opponents[i].specialPurpose == 1 || opponents[i].specialPurpose == 3 || getFactionRelations(0,2) < -10) && Story.fafnirIsMadAtYou)
                  {
                     _loc8_ = 9;
                     _loc9_ = Story.characterRelations[_loc8_] - 20;
                     Story.characterRelations[_loc8_] = _loc9_;
                     Story.dialogueDefaults[9] = 500;
                     Story.fafnirIsMadAtYou = true;
                     Story.characterRelations[9] -= 30;
                     Story.bailedByFafnir = false;
                  }
                  if(opponents[i].specialPurpose == 1)
                  {
                     if(Towns[20].population > 60)
                     {
                        executeMajorEvent(3);
                     }
                     else
                     {
                        Story.fafnirSentToKillLois = false;
                     }
                  }
                  if(opponents[i].specialPurpose == 3)
                  {
                     allKilled = true;
                     opponents[i].specialPurpose = undefined;
                     for(j in Caravans)
                     {
                        if(Caravans[j].active && Caravans[j].specialPurpose == 3)
                        {
                           allKilled = false;
                           break;
                        }
                     }
                     if(allKilled && !Story.drekarDefeated && !Story.drekarReturned)
                     {
                        executeMajorEvent(8);
                     }
                  }
                  if(opponents[i].specialPurpose == 2)
                  {
                     executeMajorEvent(4);
                     Story.youAttackedLois = true;
                  }
                  if(opponents[i].type == 1 || opponents[i].type == 8)
                  {
                     if(getFactionRelations(0,1) < -20)
                     {
                        Story.dialogueDefaults[7] = 726;
                        failQuest(5);
                        failQuest(6);
                        failQuest(7);
                     }
                  }
                  if(opponents[i].specialPurpose == 6)
                  {
                     executeMajorEvent(23);
                     Story.youAttackedNarizians = true;
                     affectSpecificReputation(5,-15);
                     affectSpecificReputation(2,-10);
                     setFactionRelations(12,8,-50);
                  }
                  if(opponents[i].specialPurpose == 9 && !Story.mikazeRebelsDefeted)
                  {
                     allKilled = true;
                     opponents[i].specialPurpose = null;
                     for(j in Caravans)
                     {
                        if(Caravans[j].active && Caravans[j].specialPurpose == 9)
                        {
                           allKilled = false;
                           break;
                        }
                     }
                     if(allKilled)
                     {
                        if(Story.laMissionInProgress == 3)
                        {
                           executeMajorEvent(63);
                        }
                        else
                        {
                           executeMajorEvent(45);
                        }
                     }
                  }
                  if(opponents[i].specialPurpose == 13)
                  {
                     allKilled = true;
                     opponents[i].specialPurpose = null;
                     for(j in Caravans)
                     {
                        if(Caravans[j].active && Caravans[j].specialPurpose == 13)
                        {
                           allKilled = false;
                           break;
                        }
                     }
                     if(allKilled && !Story.mikazePoliceDefeated)
                     {
                        executeMajorEvent(64);
                     }
                  }
                  if(opponents[i].type == 20 && Story.needToProvokeOzbet && !Story.provokedOzbet)
                  {
                     executeMajorEvent(46);
                  }
                  if(opponents[i].specialPurpose == 10 && !Story.ozbetDefeated && !Story.ozbetDefendersReturned)
                  {
                     allKilled = true;
                     opponents[i].specialPurpose = null;
                     for(j in Caravans)
                     {
                        if(Caravans[j].active && Caravans[j].specialPurpose == 10)
                        {
                           allKilled = false;
                           break;
                        }
                     }
                     if(allKilled)
                     {
                        executeMajorEvent(49);
                     }
                  }
                  if(opponents[i].specialPurpose == 11 && !Story.janubiDefeated && !Story.janubiTroopsReturned)
                  {
                     allKilled = true;
                     opponents[i].specialPurpose = null;
                     for(j in Caravans)
                     {
                        if(Caravans[j].active && Caravans[j].specialPurpose == 11)
                        {
                           allKilled = false;
                           break;
                        }
                     }
                     if(allKilled)
                     {
                        executeMajorEvent(50);
                     }
                  }
                  if(opponents[i].specialPurpose == 12)
                  {
                     Story.wfmMissionFailed = true;
                  }
                  if(Story.wfmMissionInProgress == 6 && opponents[i].type >= 14 && opponents[i].type <= 17)
                  {
                     Story.janubiBanditsToKill--;
                  }
                  if(opponents[i].specialPurpose == 15 && !Story.reginDestroyedPullid)
                  {
                     executeMajorEvent(70);
                  }
                  if(opponents[i].specialPurpose == 16)
                  {
                     Towns[59].locations[5].visible = false;
                  }
                  if(opponents[i].specialPurpose == 17 || opponents[i].specialPurpose == 18)
                  {
                     opponents[i].specialPurpose = null;
                     executeMajorEvent(80);
                  }
                  if(opponents[i].specialPurpose == 19)
                  {
                     executeMajorEvent(97);
                  }
                  if(opponents[i].specialPurpose == 22)
                  {
                     executeMajorEvent(105,opponents[i]);
                  }
                  if(opponents[i].specialPurpose == 5)
                  {
                     allKiviDead = true;
                     for(j in Caravans)
                     {
                        if(Caravans[j].active && Caravans[j].specialPurpose == 5 && Caravans[j] != opponents[i])
                        {
                           allKiviDead = false;
                           break;
                        }
                     }
                     if(!Story.kiviReturned && allKiviDead && !Story.kiviAreDestroyed)
                     {
                        executeMajorEvent(19);
                     }
                  }
               }
            }
         }
         if(m == 2)
         {
            for(i in opponents)
            {
               if(!opponents[i].aggressive)
               {
                  affectSpecificReputation(5,-1);
               }
            }
         }
         if(m == 2)
         {
            batteriesToRemove = [];
            all = opponents.concat(allies);
            for(i in all)
            {
               totalBatteries = 0;
               for(j in all[i].People)
               {
                  personsBatteries = 0;
                  maxBatteries = 0;
                  for(k in all[i].People[j].attachments)
                  {
                     for(l in all[i].People[j].attachments[k])
                     {
                        if(all[i].People[j].attachments[k][l] > 0)
                        {
                           itemData = Item.getDataFromType(Item.itemNumFromCatSubCat(4,all[i].People[j].attachments[k][l]));
                           if(itemData.batteries > 0)
                           {
                              personsBatteries += itemData.batteries;
                           }
                        }
                     }
                  }
                  for(k in all[i].People[j].equipment)
                  {
                     if(all[i].People[j].equipment[k].type == 219)
                     {
                        maxBatteries = all[i].People[j].equipment[k].amount;
                        break;
                     }
                  }
                  personsBatteries = Math.min(personsBatteries,maxBatteries);
                  totalBatteries += personsBatteries;
                  if(personsBatteries > 0)
                  {
                     batteriesToRemove.push({
                        "from":all[i].People[j],
                        "amount":personsBatteries
                     });
                  }
               }
               if(totalBatteries > 0)
               {
                  batteriesToRemove.push({
                     "from":all[i],
                     "amount":totalBatteries
                  });
               }
            }
         }
         if(mode == 2)
         {
            for(i in batteriesToRemove)
            {
               if(batteriesToRemove[i].from is Character)
               {
                  batteriesToRemove[i].from.reduceItemFromEquipment(219,batteriesToRemove[i].amount,false,true);
               }
               if(batteriesToRemove[i].from is Caravan)
               {
                  batteriesToRemove[i].from.reduceCargo(219,batteriesToRemove[i].amount);
                  batteriesToRemove[i].from.addCargo(218,batteriesToRemove[i].amount);
               }
            }
            batteriesToRemove = [];
         }
         if(autoSave && m == 1 && (mode == 4 || mode == 7) && !skipAutoSave)
         {
            waitBox.visible = true;
            waitBoxText.text = Texts.fetch(6800) + ". " + Texts.fetch(770) + ".";
            mapMode.saveNow = true;
         }
         if(m == 1 && pauseOnExitTown)
         {
            if(gameSpeed != 0)
            {
               mapMode.prevSpeed = gameSpeed;
            }
            gameSpeed = 0;
            mapMode.setSpeedButtons(4);
         }
         if(m == 1 && skipPause && gameSpeed == 0)
         {
            if(mapMode.prevSpeed > 0)
            {
               gameSpeed = mapMode.prevSpeed;
            }
            else
            {
               gameSpeed = 1;
            }
            if(gameSpeed == 1)
            {
               mapMode.setSpeedButtons(1);
            }
            if(gameSpeed == doubleSpeed)
            {
               mapMode.setSpeedButtons(2);
            }
            if(gameSpeed == tripleSpeed)
            {
               mapMode.setSpeedButtons(3);
            }
            skipPause = false;
         }
         addNew = m != 1 && m != 3 && m != 5;
         removeOld = mode != 1 && mode != 3 && mode != 5;
         if(mode == 4 && (m == 3 || m == 5 || m == 7))
         {
            removeOld = false;
            suspendedTownMode = currentScreenContainer;
         }
         if(m != 1)
         {
            mapMode.stopped = true;
         }
         if(m != 3)
         {
            caravanMenu.stopped = true;
         }
         if(m != 5)
         {
            navigationMode.stopped = true;
         }
         if(currentScreenContainer is Object)
         {
            if(removeOld)
            {
               if(currentScreenContainer.hasOwnProperty("remove"))
               {
                  currentScreenContainer.remove();
               }
               i = 0;
               while(i < currentScreenContainer.numChildren)
               {
                  currentScreenContainer.removeChild(currentScreenContainer.getChildAt(i));
                  i++;
               }
               screenNode.removeChild(currentScreenContainer);
            }
            else
            {
               currentScreenContainer.visible = false;
            }
         }
         if(mode == 2)
         {
            for(i in Caravans)
            {
               for(j in Caravans[i].People)
               {
                  with(Caravans[i].People[j])
                  {
                     
                     enemies = friends = maxScore = targetX = targetY = remainingAP = destX = destY = theVictim = selectedSquare = minimumRange = maximumRange = optimalRange = minAPMode = maxAccuracyMode = maxDamageMode = availableAmmo = availableAP = dangerMap = walkToX = walkToY = shotSequence = onlyWalk = grenadeSpots = null;
                     squaresToProcess = new Array();
                  }
               }
            }
         }
         cameFromMode = mode;
         if(m == 1)
         {
            for(i in Caravans)
            {
               Caravans[i].staticMode = true;
               Caravans[i].update();
            }
            if(displayDLCIncompatibilityWarning)
            {
               mapMode.openDialogue(49);
               displayDLCIncompatibilityWarning = false;
            }
         }
         else
         {
            for(i in Caravans)
            {
               Caravans[i].staticMode = false;
            }
         }
         mode = m;
         switch(m)
         {
            case 1:
               currentScreenContainer = mapMode;
               mapMode.stopped = false;
               mapMode.justInitiated = true;
               if(mapMode.stage is Stage)
               {
                  mapMode.stage.focus = mapMode.stage;
               }
               mapMode.mousePressed = false;
               break;
            case 2:
               currentScreenContainer = new BattleMode(this,allies,opponents,neutral,settings,obstacles);
               break;
            case 3:
               currentScreenContainer = caravanMenu;
               caravanMenu.stopped = false;
               if(allies != null)
               {
                  caravanMenu.unsetCat();
                  caravanMenu.categoryButtonShining[caravanMenu.category].visible = false;
                  caravanMenu.categoryButtonBodies[caravanMenu.category].mouseEnabled = true;
                  caravanMenu.categoryButtonShining[allies].visible = true;
                  caravanMenu.categoryButtonBodies[allies].mouseEnabled = false;
                  caravanMenu.category = allies;
               }
               caravanMenu.setCat();
               caravanMenu.settingsWindow.update();
               displayTutorial(9);
               break;
            case 4:
               if(suspendedTownMode is TownMode)
               {
                  addNew = false;
                  currentScreenContainer = suspendedTownMode;
                  currentScreenContainer.setScreen(currentScreenContainer.currScreen);
                  suspendedTownMode = null;
                  currentScreenContainer.stopped = false;
                  currentScreenContainer.updateBottomLine();
                  currentScreenContainer.setScreen();
               }
               else
               {
                  if(allies == null)
                  {
                     allies = Caravans[0].overTown;
                  }
                  if(opponents == null)
                  {
                     opponents = lastTownCategory;
                  }
                  currentScreenContainer = new TownMode(this,allies,opponents);
               }
               break;
            case 5:
               currentScreenContainer = navigationMode;
               navigationMode.stopped = false;
               navigationMode.updateInfoText();
               navigationMode.setFocus();
               navigationMode.updateMap();
               displayTutorial(24);
               break;
            case 6:
               currentScreenContainer = new Sprite();
               currentScreenContainer.graphics.beginFill(0);
               currentScreenContainer.graphics.drawRect(0,0,880,495);
               currentScreenContainer.addChild(new EngineText(Texts.fetch(6799).toUpperCase(),16777215,36,"center",0,150,880,50));
               if(allies is Number)
               {
                  descriptionText = Texts.fetch(allies,Caravans[0].People[0].gender);
               }
               else
               {
                  descriptionText = allies;
               }
               currentScreenContainer.addChild(new EngineText(descriptionText,16777215,14,"center",80,200,740,200,true,true));
               retButt = new Sprite();
               retButt.graphics.beginFill(16777215);
               retButt.graphics.drawRect(0,0,200,30);
               retButtText = new EngineText("OK",0,16,"center",10,4,180,20);
               retButt.addChild(retButtText);
               retButt.x = 340;
               retButt.y = 400;
               retButt.buttonMode = true;
               retButt.mouseChildren = false;
               retButt.addEventListener("click",function(param1:* = null):*
               {
                  if(GameData.soundFXOn)
                  {
                     new SFXClick().play();
                  }
                  exitGame();
               },false,0,false);
               currentScreenContainer.addChild(retButt);
               break;
            case 7:
               if(Story.characterFactions[allies] != undefined)
               {
                  revealedFactions[Story.characterFactions[allies]] = true;
               }
               currentScreenContainer = new DialogueScreen(allies,this);
               break;
            case 8:
               currentScreenContainer = new CharacterSetupScreen(this);
               break;
            case 9:
               currentScreenContainer = new Sprite();
               FG = new Sprite();
               maskedBmp = new ImportedBitmap("InterfaceForeground.png");
               maskedBmp.transform.colorTransform = new ColorTransform(0.1,0.075,0.05);
               FG.addChild(maskedBmp);
               FG.blendMode = "layer";
               alphas = new Sprite();
               alphas.blendMode = "alpha";
               clearBmp = new Sprite();
               clearBmp.graphics.beginFill(0,0.01);
               clearBmp.graphics.drawRect(0,0,880,495);
               alphas.addChild(clearBmp);
               FG.addChild(alphas);
               erase = new Sprite();
               erase.blendMode = "erase";
               FG.addChild(erase);
               erase.mouseEnabled = false;
               erase.mouseChildren = false;
               introScr = new Sprite();
               currentScreenContainer.addChild(new ImportedBitmap("StoryStartBG.jpg"));
               introText = new EngineText(Texts.fetch(1608,Caravans[0].People[0].gender),0,16,"center",30,40,820,400,true,true);
               introScr.addChild(introText);
               introText.y = 220 - introText.textHeight / 2;
               proceedButton = new Sprite();
               proceedButton.graphics.beginFill(0);
               proceedButton.graphics.drawRect(0,0,200,30);
               proceedButton.x = 340;
               proceedButton.y = 450;
               proceedButton.buttonMode = true;
               proceedButton.addEventListener("click",function():*
               {
                  if(GameData.soundFXOn)
                  {
                     new SFXClick().play();
                  }
                  setMode(1);
               },false,0,false);
               introScr.addChild(proceedButton);
               proceedButtonText = new EngineText(Texts.fetch(6838).toUpperCase(),16777215,16,"center",340,454,200,22);
               erase.addChild(proceedButtonText);
               currentScreenContainer.addChild(FG);
               alphas.addChild(introScr);
         }
         if(m > 0)
         {
            if(addNew)
            {
               screenNode.addChildAt(currentScreenContainer,screenNode.getChildIndex(waitBox));
            }
            else
            {
               currentScreenContainer.visible = true;
            }
         }
         for(i in parent.loadedDLC)
         {
            if(parent.loadedDLC[i].hasOwnProperty("onSetMode"))
            {
               parent.loadedDLC[i].onSetMode(m);
            }
         }
      }
      
      public function exitGame() : *
      {
         setMode(0);
         parent.setScreen(2);
      }
      
      public function makeDate(param1:* = null) : *
      {
         if(param1 == null)
         {
            param1 = Time;
         }
         return staticMakeDate(param1);
      }
      
      public function updateEconomy(param1:* = false) : *
      {
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         _loc4_ = undefined;
         if(!param1)
         {
            for(_loc6_ in Towns)
            {
               Towns[_loc6_].prices = [];
            }
            for(_loc6_ in globalPrices)
            {
               if(globalPrices[_loc6_] != undefined)
               {
                  globalPrices[_loc6_] = -1;
               }
            }
            for(_loc6_ in globalPrices)
            {
               if(globalPrices[_loc6_] == -1)
               {
                  calculatePriceForItem(_loc6_);
               }
            }
         }
         var _loc3_:* = 0;
         var _loc9_:int = 0;
         var _loc2_:* = 0;
         var _loc10_:* = 0;
         for(_loc6_ in Item.Goods)
         {
            if(Item.Goods[_loc6_] is Object && Item.Goods[_loc6_].food)
            {
               _loc2_ += globalItemPrice(Item.itemNumFromCatSubCat(1,_loc6_)) / Item.Goods[_loc6_].weight / (Item.Goods[_loc6_].calories / Item.Goods[_loc6_].weight);
               _loc10_++;
            }
         }
         foodAveragePrice = _loc2_ / _loc10_;
         for(_loc7_ in itemCategories)
         {
            if(itemCategories[_loc7_] != "food")
            {
               _loc3_ = 0;
               _loc4_ = 0;
               for(_loc6_ in Item.Items)
               {
                  if(_loc6_ != 0 && Item.getDataFromType(_loc6_)[itemCategories[_loc7_]])
                  {
                     _loc3_ += globalItemPrice(_loc6_);
                     _loc4_++;
                  }
               }
               GameData[itemCategories[_loc7_] + "AveragePrice"] = _loc3_ / _loc4_;
            }
         }
         var _loc5_:* = 0;
         _loc4_ = 0;
         for(_loc6_ in Towns)
         {
            if(!Presets.Towns[_loc6_].storyOnly && Towns[_loc6_].population > 0 && Towns[_loc6_].GDPperCapita != null)
            {
               _loc5_ += Towns[_loc6_].GDPperCapita;
               _loc4_++;
            }
         }
         if(_loc4_ > 0)
         {
            averageGDPperCapita = _loc5_ / _loc4_;
         }
         trace("average GDP per capita: " + averageGDPperCapita);
      }
      
      public function calculatePriceForItem(param1:*) : *
      {
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc15_:* = undefined;
         var _loc5_:* = undefined;
         var _loc20_:* = undefined;
         var _loc12_:* = undefined;
         var _loc21_:* = undefined;
         var _loc4_:* = undefined;
         var _loc11_:* = undefined;
         var _loc18_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         var _loc8_:* = undefined;
         var _loc13_:* = undefined;
         var _loc19_:* = undefined;
         _loc12_ = undefined;
         var _loc6_:* = undefined;
         var _loc16_:* = undefined;
         var _loc14_:* = undefined;
         var _loc22_:* = [];
         var _loc17_:* = [];
         var _loc7_:* = itemsToUpdate.indexOf(param1);
         if(_loc7_ > -1)
         {
            itemsToUpdate.splice(_loc7_,1);
         }
         for(_loc8_ in GameData.itemCategories)
         {
            if(Item.getDataFromType(param1)[GameData.itemCategories[_loc8_]])
            {
               _loc13_ = GameData.itemCategories[_loc8_];
               break;
            }
         }
         for(_loc8_ in Towns)
         {
            _loc19_ = Towns[_loc8_].getConsumptionProduction();
            if(_loc13_ != undefined)
            {
               if(_loc19_.categoryProducts[_loc13_] == undefined)
               {
                  _loc17_[_loc8_] = 0;
               }
               else
               {
                  _loc17_[_loc8_] = _loc19_.categoryProducts[_loc13_].production - _loc19_.categoryProducts[_loc13_].consumption;
               }
            }
            else
            {
               _loc17_[_loc8_] = 0;
               for(_loc9_ in _loc19_.productsList)
               {
                  if(_loc19_.productsList[_loc9_].item == param1)
                  {
                     _loc17_[_loc8_] = _loc19_.productsList[_loc9_].production - _loc19_.productsList[_loc9_].consumption;
                     break;
                  }
               }
            }
            if(_loc17_[_loc8_] > 0)
            {
               _loc15_ = Towns[_loc8_].industries.concat(Towns[_loc8_].playersIndustries);
               for(_loc9_ in _loc15_)
               {
                  _loc5_ = Industry.Types[_loc15_[_loc9_].type].production;
                  for(_loc10_ in _loc5_)
                  {
                     if(_loc5_[_loc10_].item == param1 && _loc15_[_loc9_].employees > 0)
                     {
                        _loc22_.push({
                           "town":Towns[_loc8_],
                           "townNum":_loc8_,
                           "industry":_loc15_[_loc9_],
                           "amount":_loc5_[_loc10_].amount
                        });
                     }
                  }
               }
            }
         }
         if(_loc22_.length == 0)
         {
            for(_loc8_ in Towns)
            {
               Towns[_loc8_].prices[param1] = Item.getDataFromType(param1).price;
            }
            globalPrices[param1] = Item.getDataFromType(param1).price;
            return;
         }
         _loc11_ = [];
         for(_loc8_ in Towns)
         {
            _loc11_[_loc8_] = [];
         }
         for(_loc8_ in _loc22_)
         {
            _loc5_ = Industry.Types[_loc22_[_loc8_].industry.type].consumption;
            _loc20_ = 0;
            for(_loc9_ in _loc5_)
            {
               if(_loc22_[_loc8_].town.prices[_loc5_[_loc9_].item] == undefined || itemsToUpdate.indexOf(_loc5_[_loc9_].item) != -1)
               {
                  calculatePriceForItem(_loc5_[_loc9_].item);
               }
               _loc20_ += _loc22_[_loc8_].town.prices[_loc5_[_loc9_].item] * _loc5_[_loc9_].amount * (1 + _loc22_[_loc8_].town.tax);
            }
            _loc20_ += _loc22_[_loc8_].industry.totalExpenses / _loc22_[_loc8_].industry.employees;
            _loc5_ = Industry.Types[_loc22_[_loc8_].industry.type].production;
            if(_loc5_.length == 1)
            {
               _loc21_ = _loc20_;
            }
            else
            {
               _loc4_ = 0;
               for(_loc9_ in _loc5_)
               {
                  _loc4_ += Item.getDataFromType(_loc5_[_loc9_].item).price;
               }
               _loc21_ = _loc20_ * Item.getDataFromType(param1).price / _loc4_;
            }
            _loc21_ /= _loc22_[_loc8_].amount;
            _loc21_ *= 3;
            _loc11_[_loc22_[_loc8_].townNum].push({
               "price":_loc21_,
               "amount":_loc22_[_loc8_].amount
            });
         }
         globalPrices[param1] = 0;
         _loc2_ = 0;
         for(_loc8_ in _loc11_)
         {
            if(_loc11_[_loc8_].length > 0)
            {
               _loc20_ = 0;
               _loc12_ = 0;
               for(_loc9_ in _loc11_[_loc8_])
               {
                  _loc20_ += _loc11_[_loc8_][_loc9_].price * _loc11_[_loc8_][_loc9_].amount;
                  _loc12_ += _loc11_[_loc8_][_loc9_].amount;
               }
               Towns[_loc8_].prices[param1] = _loc20_ / _loc12_;
               globalPrices[param1] += Towns[_loc8_].prices[param1];
               _loc2_++;
            }
         }
         var _loc24_:* = param1;
         var _loc23_:* = globalPrices[_loc24_] / _loc2_;
         globalPrices[_loc24_] = _loc23_;
         for(_loc8_ in _loc11_)
         {
            if(_loc11_[_loc8_].length == 0)
            {
               _loc16_ = [];
               for(_loc9_ in _loc11_)
               {
                  if(_loc11_[_loc9_].length > 0)
                  {
                     _loc18_ = Towns[_loc9_].prices[param1] + Math.pow(MathFunctions.CalcDistance(Presets.Towns[_loc8_].x,Presets.Towns[_loc8_].y,Presets.Towns[_loc9_].x,Presets.Towns[_loc9_].y),0.8) * Item.getDataFromType(param1).weight * 0.1;
                     _loc16_.push({
                        "price":_loc18_,
                        "amount":_loc17_[_loc9_],
                        "town":_loc9_
                     });
                  }
               }
               _loc16_.sortOn("price",16);
               _loc12_ = 0;
               _loc6_ = 0;
               if(_loc17_[_loc8_] < 0)
               {
                  _loc14_ = 0 - _loc17_[_loc8_];
               }
               else
               {
                  _loc14_ = 1;
               }
               _loc9_ = 0;
               while(_loc9_ < _loc16_.length)
               {
                  if(_loc14_ <= _loc16_[_loc9_].amount)
                  {
                     _loc12_ += _loc14_;
                     _loc6_ += _loc14_ * _loc16_[_loc9_].price;
                     break;
                  }
                  _loc12_ += _loc16_[_loc9_].amount;
                  _loc6_ += _loc16_[_loc9_].amount * _loc16_[_loc9_].price;
                  _loc14_ -= _loc16_[_loc9_].amount;
                  _loc9_++;
               }
               if(_loc12_ <= 0)
               {
                  Towns[_loc8_].prices[param1] = Item.getDataFromType(param1).price;
               }
               else
               {
                  Towns[_loc8_].prices[param1] = _loc6_ / _loc12_;
               }
            }
         }
      }
      
      public function globalItemPrice(param1:*) : *
      {
         if(globalPrices[param1] == undefined)
         {
            return Item.getDataFromType(param1).price;
         }
         return globalPrices[param1];
      }
      
      public function newHistoricalPoint(param1:*, param2:* = null) : *
      {
         if(param2 == null)
         {
            param2 = Time;
         }
         param1.historicalData.unshift({"time":param2});
         param1.historicalData[0].production = [];
         param1.historicalData[0].consumption = [];
         param1.historicalData[0].playersProduction = [];
         param1.historicalData[0].playersConsumption = [];
      }
      
      public function getTheoricalItemProductionOrConsumption(param1:*, param2:*, param3:* = true) : *
      {
         var _loc11_:* = undefined;
         var _loc9_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc10_:* = undefined;
         var _loc5_:* = undefined;
         var _loc12_:* = undefined;
         var _loc4_:* = 0;
         _loc7_ = Item.getDataFromType(param2);
         if(_loc7_.food && !param3)
         {
            if(param1 is Caravan)
            {
               return param1.totalFoodConsumption();
            }
         }
         if(param1 is Town)
         {
            _loc12_ = param1.getConsumptionProduction();
            _loc6_ = _loc12_.productsList;
            _loc5_ = false;
            for(_loc10_ in _loc6_)
            {
               if(_loc6_[_loc10_].item == param2)
               {
                  if(param3)
                  {
                     if(_loc7_.food)
                     {
                        _loc4_ += _loc6_[_loc10_].production * _loc7_.calories;
                     }
                     else
                     {
                        _loc4_ += _loc6_[_loc10_].production;
                     }
                  }
                  else if(_loc7_.food)
                  {
                     _loc4_ += _loc6_[_loc10_].consumption * _loc7_.calories;
                  }
                  else
                  {
                     _loc4_ += _loc6_[_loc10_].consumption;
                  }
               }
            }
            for(_loc10_ in _loc12_.categoryProducts)
            {
               if(_loc7_[_loc10_])
               {
                  if(param3)
                  {
                     _loc4_ += _loc12_.categoryProducts[_loc10_].production;
                  }
                  else
                  {
                     _loc4_ += _loc12_.categoryProducts[_loc10_].consumption;
                  }
               }
            }
         }
         if(param1 is Caravan)
         {
            _loc6_ = param1.Transport.concat(param1.Cargo);
            for(_loc10_ in _loc6_)
            {
               if(param3)
               {
                  _loc9_ = _loc6_[_loc10_].production;
               }
               else
               {
                  _loc9_ = _loc6_[_loc10_].consumption;
               }
               for(_loc11_ in _loc9_)
               {
                  _loc8_ = Item.getDataFromType(_loc9_[_loc11_].item);
                  if(_loc9_[_loc11_].item == param2 || belongToTheSameCategory(_loc7_,_loc8_))
                  {
                     if(_loc8_.food)
                     {
                        _loc4_ += _loc9_[_loc11_].amount * _loc8_.calories;
                     }
                     else
                     {
                        _loc4_ += _loc9_[_loc11_].amount;
                     }
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function getActualItemProduction(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         _loc4_ = Item.getDataFromType(param2);
         if(param1.historicalData[0] is Object)
         {
            if(param1.historicalData[1] is Object)
            {
               _loc6_ = param1.historicalData[0].time - param1.historicalData[1].time;
            }
            if(_loc6_ <= 0 || _loc6_ == undefined)
            {
               if(param1 is Town)
               {
                  _loc6_ = 720 * 60;
               }
               if(param1 is Caravan)
               {
                  _loc6_ = 360 * 60;
               }
            }
            _loc3_ = 0;
            for(_loc7_ in param1.historicalData[0].production)
            {
               _loc5_ = Item.getDataFromType(param1.historicalData[0].production[_loc7_].item);
               if(param1.historicalData[0].production[_loc7_].item == param2 || belongToTheSameCategory(_loc4_,_loc5_))
               {
                  if(_loc5_.food)
                  {
                     _loc3_ += param1.historicalData[0].production[_loc7_].amount * _loc5_.calories;
                  }
                  else
                  {
                     _loc3_ += param1.historicalData[0].production[_loc7_].amount;
                  }
               }
            }
            return _loc3_ * (86400 / _loc6_);
         }
         return getTheoricalItemProductionOrConsumption(param1,param2,true);
      }
      
      public function calculatePrice(param1:*, param2:*, param3:*, param4:* = true, param5:* = null) : *
      {
         return commonPriceFunction(param1,param2,param3,param4,true,param5);
      }
      
      public function commonPriceFunction(param1:*, param2:*, param3:*, param4:*, param5:* = true, param6:* = null) : *
      {
         var _loc11_:* = undefined;
         var _loc8_:* = undefined;
         var _loc20_:* = undefined;
         var _loc15_:* = undefined;
         var _loc23_:* = undefined;
         var _loc14_:* = undefined;
         var _loc21_:* = undefined;
         var _loc7_:* = undefined;
         var _loc18_:* = undefined;
         var _loc16_:* = undefined;
         var _loc13_:* = undefined;
         var _loc22_:* = undefined;
         var _loc12_:* = undefined;
         var _loc9_:* = undefined;
         if(param1 is Town)
         {
            _loc23_ = param1.getItemBasePrice(param2);
         }
         if(param1 is Caravan)
         {
            _loc20_ = 100000000000000000000;
            for(_loc11_ in Towns)
            {
               _loc8_ = MathFunctions.CalcDistance(param1.x,param1.y,Presets.Towns[_loc11_].x,Presets.Towns[_loc11_].y);
               if(_loc8_ < _loc20_)
               {
                  _loc20_ = _loc8_;
                  _loc15_ = Towns[_loc11_];
               }
            }
            _loc23_ = _loc15_.getItemBasePrice(param2);
         }
         var _loc17_:* = Item.getDataFromType(param2);
         if(param6 is Object)
         {
            _loc21_ = 0;
            _loc14_ = 0;
            if(param6.assortment is Array)
            {
               for(_loc11_ in param6.assortment)
               {
                  if(param6.assortment[_loc11_].item == param2)
                  {
                     _loc14_ += param6.assortment[_loc11_].amount;
                  }
               }
            }
         }
         else
         {
            _loc21_ = getActualItemProduction(param1,param2);
            _loc14_ = getTheoricalItemProductionOrConsumption(param1,param2,false);
         }
         if(_loc17_.food)
         {
            _loc21_ /= _loc17_.calories;
            _loc14_ /= _loc17_.calories;
         }
         if(_loc21_ == 0)
         {
            _loc21_ = 1e-13;
         }
         _loc14_ = Math.max(_loc14_,0);
         if(param1 is Town)
         {
            _loc13_ = param1.stock;
         }
         if(param1 is Caravan)
         {
            _loc13_ = param1.Cargo;
         }
         if(param6 is Object)
         {
            _loc13_ = param6.stock;
         }
         _loc16_ = 0;
         for(_loc11_ in _loc13_)
         {
            if(_loc13_[_loc11_].type == param2)
            {
               _loc16_ += _loc13_[_loc11_].amount;
            }
            else if(belongToTheSameCategory(_loc17_,_loc13_[_loc11_].itemData))
            {
               if(_loc17_.food)
               {
                  _loc16_ += _loc13_[_loc11_].amount * _loc13_[_loc11_].itemData.calories / _loc17_.calories;
               }
               else
               {
                  _loc16_ += _loc13_[_loc11_].amount;
               }
            }
         }
         if(param4)
         {
            _loc18_ = _loc16_ - param3;
         }
         else
         {
            _loc18_ = _loc16_ + param3;
         }
         if(param5 && _loc18_ < 0)
         {
            _loc16_ -= _loc18_;
            _loc18_ = 0;
         }
         if(_loc18_ <= 0)
         {
            _loc18_ = 1e-13;
         }
         if(_loc16_ <= 0)
         {
            _loc16_ = 1e-13;
         }
         var _loc19_:* = _loc23_;
         var _loc10_:* = 1;
         if(param2 == 1)
         {
            _loc10_ = 8;
         }
         for(_loc11_ in itemCategories)
         {
            if(_loc17_[itemCategories[_loc11_]])
            {
               _loc22_ = GameData[itemCategories[_loc11_] + "AveragePrice"];
               if(_loc17_.food)
               {
                  _loc22_ *= _loc17_.calories;
               }
               if(param1 is Town)
               {
                  _loc12_ = _loc19_ / _loc22_ * param1.wealthFactor - 1;
               }
               else
               {
                  _loc12_ = _loc19_ / _loc22_ - 1;
               }
               if(_loc12_ > 0)
               {
                  _loc12_ *= 5;
               }
               if(_loc12_ >= 0)
               {
                  _loc12_ += 1;
               }
               if(_loc12_ < 0)
               {
                  _loc12_ = 1 / (0 - _loc12_);
               }
               _loc10_ /= Math.max(1,_loc12_);
               break;
            }
         }
         if(param2 == 174 && param1 == Towns[46])
         {
            _loc14_ = 5;
         }
         if(param5)
         {
            _loc7_ = priceEquation(_loc16_,_loc18_,_loc19_,_loc14_,_loc21_,_loc10_);
            if(param4 && _loc21_ > 0.0001 && _loc7_ / param3 < _loc19_ * 0.9)
            {
               _loc7_ = _loc19_ * 0.9 * param3;
            }
            if(!param4 && _loc14_ < 0.0001)
            {
               if(param6 is Object)
               {
                  if(Item.Items[param2].category == 2 || Item.Items[param2].category == 3 || Item.Items[param2].category == 4 || Item.Items[param2].category == 5)
                  {
                     _loc7_ *= 1.2;
                  }
                  else
                  {
                     _loc7_ *= 0.6;
                  }
               }
               else
               {
                  if(Item.Items[param2].category == 1 && !_loc17_.liquidsContainer && !_loc17_.device && !_loc17_.firstAidKit)
                  {
                     _loc7_ *= 0.02;
                  }
                  else
                  {
                     _loc7_ *= 0.01;
                  }
                  if(_loc7_ > _loc23_ * 0.1 * param3)
                  {
                     _loc7_ = _loc23_ * 0.1 * param3;
                  }
               }
            }
            if(!param4 && param6 is Object)
            {
               if(difficulty == 1)
               {
                  _loc7_ *= 0.2;
               }
               else
               {
                  _loc7_ *= 0.05;
               }
            }
            if(!param4 && _loc7_ / param3 > _loc19_ * 1.5)
            {
               _loc7_ = _loc19_ * 1.5 * param3;
            }
            if(param6 is Object && _loc7_ / param3 > _loc19_ * 1.1)
            {
               _loc7_ = _loc19_ * 1.1 * param3;
            }
            if(param1 is Town)
            {
               if(param4)
               {
                  _loc7_ *= 1 + param1.tax;
               }
               else
               {
                  _loc7_ *= 1 / (1 + param1.tax);
               }
            }
            if(param6 is Object)
            {
               if(param4)
               {
                  _loc7_ *= 1 + param6.margin;
               }
               else
               {
                  _loc7_ *= 1 / (1 + param6.margin);
               }
            }
            if(param1 is Caravan)
            {
               if(param4)
               {
                  _loc7_ *= 20;
               }
            }
         }
         else
         {
            _loc9_ = param3;
            if(param1 is Town)
            {
               if(param4)
               {
                  _loc9_ *= 1 / (1 + param1.tax);
               }
               else
               {
                  _loc9_ *= 1 + param1.tax;
               }
            }
            if(param6 is Object)
            {
               if(param4)
               {
                  _loc9_ *= 1 / (1 + param6.margin);
               }
               else
               {
                  _loc9_ *= 1 + param6.margin;
               }
            }
            if(param1 is Caravan)
            {
               if(param4)
               {
                  _loc9_ /= 20;
               }
            }
            if(!param4 && _loc14_ < 0.0001)
            {
               if(param6 is Object)
               {
                  if(Item.Items[param2].category == 2 || Item.Items[param2].category == 3 || Item.Items[param2].category == 4 || Item.Items[param2].category == 5)
                  {
                     _loc9_ /= 1.8;
                  }
                  else
                  {
                     _loc9_ /= 1.2;
                  }
               }
               else if(Item.Items[param2].category == 1 && !_loc17_.liquidsContainer && !_loc17_.device && !_loc17_.firstAidKit)
               {
                  _loc9_ /= 0.02;
               }
               else
               {
                  _loc9_ /= 0.01;
               }
            }
            _loc7_ = reversePriceEquation(_loc16_,Math.max(_loc9_,0),_loc19_,_loc14_,_loc21_,_loc10_,!param4);
            if(param6 is Object && _loc7_ * (_loc19_ * 1.1) < _loc9_)
            {
               _loc7_ = _loc9_ / (_loc19_ * 1.1);
            }
            if(!param4 && _loc7_ * (_loc19_ * 1.5) < _loc9_)
            {
               _loc7_ = _loc9_ / (_loc19_ * 1.5);
            }
            if(!param4 && param6 is Object)
            {
               if(difficulty == 1)
               {
                  _loc7_ /= 0.2;
               }
               else
               {
                  _loc7_ /= 0.05;
               }
            }
            if(!param4 && _loc14_ < 0.0001 && !(param6 is Object))
            {
               if(_loc7_ * (_loc23_ * 0.1 * param3) > _loc9_)
               {
                  _loc7_ = _loc9_ / (_loc23_ * 0.1 * param3);
               }
            }
            if(param4 && _loc21_ > 0.0001 && _loc7_ * (_loc19_ * 0.9) > _loc9_)
            {
               _loc7_ = _loc9_ / (_loc19_ * 0.9);
            }
         }
         return Math.round(_loc7_ * 10000000000) / 10000000000;
      }
      
      public function itemAmountFromPrice(param1:*, param2:*, param3:*, param4:* = true, param5:* = null) : *
      {
         return commonPriceFunction(param1,param2,param3,param4,false,param5);
      }
      
      public function priceEquation(param1:*, param2:*, param3:*, param4:*, param5:*, param6:* = 1) : *
      {
         var _loc7_:* = undefined;
         if(param1 > param2)
         {
            _loc7_ = param2;
            param2 = param1;
            param1 = _loc7_;
         }
         return oneIntegral(param2,param3,param4,param5,param6) - oneIntegral(param1,param3,param4,param5,param6);
      }
      
      public function oneIntegral(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         return 0.8 * param2 * param1 + 1 * param2 * param5 * (param1 + 10 * param4 * param1) / ((1 + 10 * param4) * Math.sqrt((param1 + 10 * param4 * param1) / (2 + 20 * param3)));
      }
      
      public function reversePriceEquation(param1:*, param2:*, param3:*, param4:*, param5:*, param6:*, param7:* = false) : *
      {
         var _loc11_:* = undefined;
         var _loc10_:* = oneIntegral(param1,param3,param4,param5,param6);
         var _loc8_:* = 0.8 * param3 * (1 + 10 * param5);
         var _loc9_:* = 1 * param3 * param6 * Math.sqrt((1 + 10 * param5) * (2 + 20 * param4));
         if(param7)
         {
            _loc11_ = (_loc10_ + param2) * (1 + 10 * param5);
         }
         else
         {
            _loc11_ = Math.max(_loc10_ - param2,0) * (1 + 10 * param5);
         }
         var _loc12_:* = (0 - Math.sqrt(Math.abs(4 * _loc8_ * Math.pow(_loc9_,2) * _loc11_ + Math.pow(_loc9_,4))) + 2 * _loc8_ * _loc11_ + Math.pow(_loc9_,2)) / (2 * Math.pow(_loc8_,2));
         if(param7)
         {
            return Math.abs(_loc12_ - param1);
         }
         return Math.abs(param1 - _loc12_);
      }
      
      public function reversePriceEquationIncrease(param1:*, param2:*, param3:*, param4:*, param5:*, param6:* = 0.1, param7:* = 10) : *
      {
         var _loc12_:* = undefined;
         var _loc8_:* = 0;
         if(param5 < 0.1)
         {
            param5 = 0.1;
         }
         if(param4 < 0.1)
         {
            param4 = 0.1;
         }
         var _loc11_:* = Math.pow(param4,2) / (param6 * param5);
         var _loc9_:* = Math.pow(param4,2) / (param7 * param5);
         if(param1 > _loc11_)
         {
            return param2 / ((_loc12_ - param1) * param3 * Math.pow(param4,2) / (param5 * _loc11_));
         }
         if(_loc12_ < _loc9_)
         {
            return param2 / ((_loc12_ - param1) * param3 * Math.pow(param4,2) / (param5 * _loc9_));
         }
         if(param1 < _loc9_)
         {
            _loc8_ += (_loc9_ - param1) * param3 * Math.pow(param4,2) / (param5 * _loc9_);
            param1 = _loc9_;
         }
         _loc12_ = Math.exp(Math.log(param1) + param5 * param2 / (param3 * Math.pow(param4,2)));
         if(_loc12_ > _loc11_)
         {
            _loc8_ += param3 * Math.pow(param4,2) * Math.log(_loc11_) / param5 - param3 * Math.pow(param4,2) * Math.log(param1) / param5;
         }
         var _loc10_:* = param2 - _loc8_;
         return _loc11_ + _loc10_ / (param3 * Math.pow(param4,2) / (param5 * _loc11_));
      }
      
      public function affectSpecificReputation(param1:*, param2:*) : *
      {
         if(Story.specificReputations[param1] == undefined)
         {
            Story.specificReputations[param1] = param2;
         }
         else
         {
            var _loc3_:* = param1;
            var _loc4_:* = Story.specificReputations[_loc3_] + param2;
            Story.specificReputations[_loc3_] = _loc4_;
         }
      }
      
      public function directCaravanToNearestTown(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = 100000000000000000000;
         var _loc2_:Boolean = false;
         if(param1 is Caravan)
         {
            for(_loc4_ in Caravans)
            {
               if(Caravans[_loc4_] == param1)
               {
                  param1 = _loc4_;
                  _loc2_ = true;
                  break;
               }
            }
            if(!_loc2_)
            {
               return false;
            }
         }
         for(_loc4_ in Towns)
         {
            if(Towns[_loc4_].active && !Towns[_loc4_].constantPopulation)
            {
               _loc3_ = Math.abs(Presets.Towns[_loc4_].x - Caravans[param1].x) + Math.abs(Presets.Towns[_loc4_].y - Caravans[param1].y);
               if(_loc3_ < _loc5_)
               {
                  _loc5_ = _loc3_;
                  Caravans[param1].nowGoingToTown = _loc4_;
               }
               directCaravanToTown(Caravans[param1],Caravans[param1].nowGoingToTown);
            }
         }
      }
      
      public function directCaravanToTown(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         param1.nowGoingToTown = param2;
         param1.direction = MathFunctions.CalcRevYAngle(param1.x,param1.y,Presets.Towns[param2].x,Presets.Towns[param2].y);
         if(param1.category == 5)
         {
            _loc3_ = MathFunctions.CalcDistance(param1.x,param1.y,Presets.Towns[param2].x,Presets.Towns[param2].y);
            param1.stepsLeft = Math.floor(_loc3_ / param1.mapSpeed);
            param1.moveX = (Presets.Towns[param2].x - param1.x) / param1.stepsLeft;
            param1.moveY = (Presets.Towns[param2].y - param1.y) / param1.stepsLeft;
         }
         param1.lastFlicker = 100000000000000000000;
         param1.guardPosition = null;
         param1.moving = true;
      }
      
      public function setLocationsVisibility() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         if(!storyMode)
         {
            for(_loc1_ in Towns)
            {
               if(Presets.Towns[_loc1_].storyOnly)
               {
                  Towns[_loc1_].active = false;
               }
            }
         }
         for(_loc1_ in Towns)
         {
            for(_loc2_ in Towns[_loc1_].locations)
            {
               if(Presets.Towns[_loc1_].locations[_loc2_].category == 3 && !storyMode)
               {
                  Towns[_loc1_].locations[_loc2_].visible = false;
               }
            }
         }
      }
      
      public function executeMajorEvent(param1:*, param2:* = null) : *
      {
         var _loc25_:* = undefined;
         var _loc24_:* = undefined;
         var _loc31_:* = undefined;
         var _loc28_:* = undefined;
         var _loc23_:* = undefined;
         _loc28_ = undefined;
         var _loc32_:* = undefined;
         _loc28_ = undefined;
         var _loc21_:* = undefined;
         var _loc16_:* = undefined;
         _loc31_ = undefined;
         _loc28_ = undefined;
         _loc23_ = undefined;
         _loc28_ = undefined;
         _loc21_ = undefined;
         _loc16_ = undefined;
         _loc21_ = undefined;
         _loc31_ = undefined;
         _loc28_ = undefined;
         _loc23_ = undefined;
         _loc28_ = undefined;
         var _loc29_:* = undefined;
         var _loc10_:* = undefined;
         _loc29_ = undefined;
         _loc29_ = undefined;
         _loc28_ = undefined;
         var _loc33_:* = undefined;
         var _loc19_:* = undefined;
         _loc28_ = undefined;
         var _loc8_:* = undefined;
         _loc28_ = undefined;
         var _loc14_:* = undefined;
         var _loc27_:* = undefined;
         var _loc15_:* = undefined;
         var _loc30_:* = undefined;
         _loc30_ = undefined;
         _loc15_ = undefined;
         _loc15_ = undefined;
         _loc14_ = undefined;
         _loc8_ = undefined;
         var _loc4_:* = undefined;
         var _loc26_:* = undefined;
         _loc14_ = undefined;
         _loc14_ = undefined;
         _loc28_ = undefined;
         var _loc6_:* = undefined;
         var _loc11_:* = undefined;
         var _loc5_:* = undefined;
         var _loc17_:* = undefined;
         var _loc12_:* = undefined;
         _loc28_ = undefined;
         _loc28_ = undefined;
         var _loc18_:* = undefined;
         var _loc20_:* = undefined;
         var _loc7_:* = undefined;
         _loc28_ = undefined;
         _loc18_ = undefined;
         _loc7_ = undefined;
         _loc5_ = undefined;
         var _loc13_:* = undefined;
         _loc5_ = undefined;
         var _loc9_:* = undefined;
         var _loc22_:* = undefined;
         _loc28_ = undefined;
         _loc18_ = undefined;
         _loc20_ = undefined;
         _loc7_ = undefined;
         _loc13_ = undefined;
         _loc13_ = undefined;
         switch(param1)
         {
            case 1:
               Story.drekarAttackingLintu = true;
               Story.drekarReturned = false;
               Story.specificReputations[2] -= 10;
               _loc31_ = MathFunctions.CalcRevYAngle(Presets.Towns[20].x,Presets.Towns[20].y,Presets.Towns[17].x,Presets.Towns[17].y);
               param1 = Math.min(Math.floor((Towns[20].population - 15) / 15),6);
               _loc23_ = 3.141592653589793 / 2 / param1;
               _loc24_ = 1;
               while(_loc24_ <= param1)
               {
                  _loc28_ = Caravans.push(new Caravan(7,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[20].x;
                  Caravans[_loc28_].y = Presets.Towns[20].y;
                  equipRandomCaravan(Caravans[_loc28_],15);
                  Caravans[_loc28_].direction = _loc31_ - 3.141592653589793 / 4 + (_loc24_ - 1) * _loc23_;
                  Towns[20].population -= Caravans[_loc28_].People.length;
                  Towns[20].unemployed -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].addCargo(80,10);
                  Caravans[_loc28_].addCargo(1,50);
                  Caravans[_loc28_].addCargo(83,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 3;
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               Story.drekarAttackTime = Time;
               setFactionRelations(1,2,-30);
               if(getFactionRelations(0,2) < 0)
               {
                  setFactionRelations(0,2,0);
               }
               break;
            case 2:
               Story.fafnirStartsKukulAssassination = true;
               Story.kukulAssassinationTime = Time + 172800;
               Story.specificReputations[2] -= 5;
               break;
            case 3:
               _loc28_ = Caravans.push(new Caravan(7,mapMode.mapSymbols)) - 1;
               Caravans[_loc28_].x = Presets.Towns[20].x;
               Caravans[_loc28_].y = Presets.Towns[20].y;
               Caravans[_loc28_].category = 4;
               Caravans[_loc28_].specialPurpose = 1;
               equipRandomCaravan(Caravans[_loc28_]);
               Towns[20].population -= Caravans[_loc28_].People.length;
               Towns[20].unemployed -= Caravans[_loc28_].People.length;
               directCaravanToTown(Caravans[_loc28_],22);
               Caravans[_loc28_].addCargo(76,50);
               Caravans[_loc28_].addCargo(65,20);
               Caravans[_loc28_].addCargo(1,20);
               Caravans[_loc28_].staticMode = true;
               Caravans[_loc28_].update();
               affectFactionRelations(10,0,2);
               break;
            case 4:
               var _loc34_:* = 8;
               var _loc35_:* = Story.characterRelations[_loc34_] - 100;
               Story.characterRelations[_loc34_] = _loc35_;
               Story.dialogueDefaults[8] = 498;
               affectFactionRelations(-50,0,3);
               Story.specificReputations[5] -= 10;
               Story.specificReputations[4] += 1;
               Towns[22].locations[0].visible = false;
               Story.loisIsDead = true;
               failQuest(9);
               break;
            case 5:
               Towns[22].locations[0].visible = false;
               _loc32_ = new Caravan(3,mapMode.mapSymbols);
               _loc32_.x = Presets.Towns[22].x;
               _loc32_.y = Presets.Towns[22].y;
               _loc24_ = 1;
               while(_loc24_ <= 11)
               {
                  _loc32_.addPerson(new Character({"gender":2}));
                  _loc24_++;
               }
               _loc32_.addCargo(8,5);
               _loc32_.addCargo(25,8);
               _loc32_.addCargo(39,50);
               _loc32_.addCargo(9,5);
               _loc32_.distributeWeapons();
               _loc32_.distributeAmmo();
               _loc32_.addPerson(new Character(LOIS_SETTINGS));
               _loc32_.name = Texts.fetch(2233);
               _loc32_.addCargo(20,1);
               _loc32_.People[_loc32_.People.length - 1].addItemToEquipment(new Item(20,1));
               _loc32_.People[_loc32_.People.length - 1].weapons[0] = 19;
               _loc32_.addCargo(92,1);
               _loc32_.People[_loc32_.People.length - 1].addItemToEquipment(new Item(92,1));
               _loc32_.People[_loc32_.People.length - 1].Jacket = 14;
               _loc32_.People[_loc32_.People.length - 1].specialPurpose = 2;
               _loc32_.addCargo(65,10);
               _loc32_.addCargo(80,30);
               _loc32_.addCargo(1,210);
               _loc32_.addCargo(83,_loc32_.maxCargo - _loc32_.totalCargo);
               _loc32_.fearless = true;
               directCaravanToTown(_loc32_,20);
               Story.loisStartedAttack = true;
               _loc32_.specialPurpose = 2;
               _loc32_.category = 4;
               Caravans.push(_loc32_);
               _loc32_.staticMode = true;
               _loc32_.update();
               failQuest(9);
               break;
            case 6:
               if(Story.requieDonkeyFromApis)
               {
                  _loc35_ = 5;
                  _loc34_ = Story.specificReputations[_loc35_] - 5;
                  Story.specificReputations[_loc35_] = _loc34_;
               }
               Caravans[0].money += 50000;
               for(_loc24_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 2)
                  {
                     Caravans[0].removePerson(Caravans[0].People[_loc24_]);
                  }
               }
               if(Story.requieDonkeyFromApis)
               {
                  Caravans[0].addTransport(new TransportUnit(1));
               }
               break;
            case 7:
               Story.drekarStartedDefense = true;
               Story.drekarReturned = false;
               _loc21_ = Math.min(Math.floor((Towns[20].population - 15) / 15),5);
               _loc16_ = 3.141592653589793 * 2 / _loc21_;
               _loc24_ = 1;
               while(_loc24_ <= _loc21_)
               {
                  _loc28_ = Caravans.push(new Caravan(7,mapMode.mapSymbols)) - 1;
                  equipRandomCaravan(Caravans[_loc28_],15);
                  Caravans[_loc28_].x = Presets.Towns[20].x;
                  Caravans[_loc28_].y = Presets.Towns[20].y;
                  Caravans[_loc28_].direction = (_loc24_ - 1) * _loc16_;
                  Caravans[_loc28_].specialPurpose = 3;
                  Caravans[_loc28_].guardPosition = {
                     "x":Presets.Towns[20].x + Math.sin((_loc24_ - 1) * _loc16_) * 100,
                     "y":Presets.Towns[20].y - Math.cos((_loc24_ - 1) * _loc16_) * 100
                  };
                  Towns[20].population -= Caravans[_loc28_].People.length;
                  Towns[20].unemployed -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].addCargo(80,10);
                  Caravans[_loc28_].addCargo(1,50);
                  Caravans[_loc28_].addCargo(83,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               Towns[20].locations[1].visible = false;
               break;
            case 8:
               Story.drekarDefeated = true;
               if(!Story.drekarLeft)
               {
                  for(_loc24_ in Caravans)
                  {
                     if(Caravans[_loc24_].specialPurpose == 2 || Caravans[_loc24_].specialPurpose == 4 || Caravans[_loc24_].specialPurpose == 5)
                     {
                        if(Caravans[_loc24_].specialPurpose == 2)
                        {
                           directCaravanToTown(Caravans[_loc24_],18);
                        }
                        if(Caravans[_loc24_].specialPurpose == 4)
                        {
                           directCaravanToTown(Caravans[_loc24_],17);
                        }
                        if(Caravans[_loc24_].specialPurpose == 5)
                        {
                           directCaravanToTown(Caravans[_loc24_],19);
                        }
                        for(_loc25_ in Caravans[_loc24_].People)
                        {
                           Caravans[_loc24_].People[_loc25_].HP = Caravans[_loc24_].People[_loc25_].maxHP;
                        }
                        Caravans[_loc24_].addCargo(1,140);
                        if(Caravans[_loc24_].specialPurpose == 2)
                        {
                           Caravans[_loc24_].category = 4;
                        }
                        else
                        {
                           Caravans[_loc24_].category = 3;
                        }
                        Caravans[_loc24_].concentrated = true;
                        Caravans[_loc24_].moving = true;
                     }
                  }
                  Towns[20].locations[0].visible = false;
                  Towns[20].population = 0;
                  Towns[20].industries = [];
                  Towns[20].locations[2].visible = true;
                  Towns[20].playersStorageSpace = 270;
                  Towns[20].addToStock(107,1,Towns[20].playersStorage);
                  Towns[20].addToStock(13,1,Towns[20].playersStorage);
                  Towns[20].addToStock(25,2,Towns[20].playersStorage);
                  Towns[20].addToStock(39,23,Towns[20].playersStorage);
                  Towns[20].playersStorage.push(new TransportUnit(3));
                  mapMode.openDialogue(14);
                  failQuest(3);
                  failQuest(5);
                  failQuest(7);
                  failQuest(8);
                  failQuest(9);
                  failQuest(10);
                  failQuest(13);
                  failQuest(14);
                  Story.dialogueDefaults[3] = 296;
                  if(Story.youHelpedDefeatDrekar)
                  {
                     affectFactionRelations(-50,0,2);
                     Story.characterRelations[8] += 20;
                     Story.characterRelations[10] += 10;
                     if(Caravans[0].People[0].gender == 2)
                     {
                        var _loc37_:int = 10;
                        var _loc36_:* = Story.characterRelations[_loc37_] + 20;
                        Story.characterRelations[_loc37_] = _loc36_;
                     }
                     affectSpecificReputation(5,20);
                  }
                  if(Story.dialogueDefaults[8] != 506 && Story.dialogueDefaults[8] != 498)
                  {
                     if(Story.loisIsDead)
                     {
                        Story.dialogueDefaults[8] = 517;
                     }
                     else
                     {
                        Story.dialogueDefaults[8] = 516;
                     }
                  }
                  if(Story.kiviStartedAttack)
                  {
                     Story.dialogueDefaults[16] = 719;
                  }
                  else if(Story.broughtSpencerRiceToKivi)
                  {
                     Story.dialogueDefaults[16] = 718;
                  }
                  else
                  {
                     Story.dialogueDefaults[16] = 605;
                  }
                  Towns[19].locations[3].visible = false;
                  if(Story.loisStartedAttack)
                  {
                     Story.dialogueDefaults[10] = 507;
                  }
                  else if(!Story.loisIsDead)
                  {
                     Story.dialogueDefaults[10] = 710;
                     Towns[22].locations[0].visible = false;
                     if(Story.metLois)
                     {
                        Towns[18].locations[3].visible = true;
                     }
                     Towns[18].population += 12;
                     Towns[18].unemployed += 12;
                  }
                  if(Story.lintuStartedDefense)
                  {
                     if(Story.youHelpedDefeatDrekar)
                     {
                        Story.dialogueDefaults[7] = 534;
                     }
                     else
                     {
                        Story.dialogueDefaults[7] = 533;
                        affectFactionRelations(-20,0,1);
                     }
                  }
                  else if(Story.agreedToFindAnAllyForLintu)
                  {
                     Story.dialogueDefaults[7] = 1169;
                  }
                  else
                  {
                     Story.dialogueDefaults[7] = 1171;
                  }
                  eliminateAllRandomGroups(2);
               }
               break;
            case 9:
               Story.kukulIsDead = true;
               Towns[17].locations[0].visible = false;
               failQuest(5);
               failQuest(6);
               failQuest(7);
               Story.specificReputations[2] -= 10;
               affectFactionRelations(20,0,2);
               Story.dialogueDefaults[10] = 527;
               break;
            case 10:
               Story.kukulIsMissing = true;
               Towns[17].locations[0].visible = false;
               failQuest(5);
               failQuest(6);
               failQuest(7);
               Story.specificReputations[2] += 2;
               Story.characterRelations[7] += 10;
               Story.fafnirStartsKukulAssassination = false;
               Story.dialogueDefaults[10] = 527;
               break;
            case 11:
               affectFactionRelations(20,1,3);
               affectFactionRelations(20,0,3);
               failQuest(9);
               Story.loisAttacksWithLintu = true;
               executeMajorEvent(5);
               break;
            case 12:
               Story.lintuStartedAttack = true;
               Story.lintuReturned = false;
               _loc31_ = MathFunctions.CalcRevYAngle(Presets.Towns[17].x,Presets.Towns[17].y,Presets.Towns[20].x,Presets.Towns[20].y);
               param1 = Math.min(Math.floor((Towns[17].population - 19) / 12),6);
               _loc23_ = 3.141592653589793 / 2 / param1;
               _loc24_ = 1;
               while(_loc24_ <= param1)
               {
                  _loc28_ = Caravans.push(new Caravan(8,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[17].x;
                  Caravans[_loc28_].y = Presets.Towns[17].y;
                  equipRandomCaravan(Caravans[_loc28_],12);
                  Caravans[_loc28_].direction = _loc31_ - 3.141592653589793 / 4 + (_loc24_ - 1) * _loc23_;
                  Towns[17].population -= Caravans[_loc28_].People.length;
                  Towns[17].unemployed -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].addCargo(80,10);
                  Caravans[_loc28_].addCargo(1,50);
                  Caravans[_loc28_].addCargo(83,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 4;
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               Story.lintuAttackTime = Time;
               setFactionRelations(1,2,-30);
               setFactionRelations(1,3,20);
               break;
            case 13:
               Story.lintuAreDestroyed = true;
               for(_loc24_ in Towns[17].locations)
               {
                  Towns[17].locations[_loc24_].visible = false;
               }
               Towns[17].people = [];
               Towns[17].industries = [];
               Towns[17].population = 0;
               failQuest(5);
               failQuest(6);
               failQuest(7);
               if(!Story.kukulIsMissing)
               {
                  Story.kukulIsDead = true;
               }
               if(Story.loisStartedAttack && !Story.loisReturned && Story.loisIsDead || !Story.loisAttacksWithLintu)
               {
                  for(_loc24_ in Caravans)
                  {
                     if(Caravans[_loc24_].specialPurpose == 3)
                     {
                        Caravans[_loc24_].guardPosition = null;
                        Caravans[_loc24_].moving = true;
                        directCaravanToTown(Caravans[_loc24_],20);
                     }
                  }
               }
               eliminateAllRandomGroups(1);
               break;
            case 14:
               Story.lintuStartedDefense = true;
               Story.lintuReturned = false;
               _loc21_ = Math.min(Math.floor((Towns[17].population - 19) / 12),6);
               _loc16_ = 3.141592653589793 * 2 / _loc21_;
               _loc24_ = 1;
               while(_loc24_ <= _loc21_)
               {
                  _loc28_ = Caravans.push(new Caravan(8,mapMode.mapSymbols)) - 1;
                  equipRandomCaravan(Caravans[_loc28_],12);
                  Caravans[_loc28_].x = Presets.Towns[17].x;
                  Caravans[_loc28_].y = Presets.Towns[17].y;
                  Caravans[_loc28_].direction = (_loc24_ - 1) * _loc16_;
                  Caravans[_loc28_].specialPurpose = 4;
                  Caravans[_loc28_].guardPosition = {
                     "x":Presets.Towns[17].x + Math.sin((_loc24_ - 1) * _loc16_) * 70,
                     "y":Presets.Towns[17].y - Math.cos((_loc24_ - 1) * _loc16_) * 70
                  };
                  Towns[17].population -= Caravans[_loc28_].People.length;
                  Towns[17].unemployed -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].addCargo(80,10);
                  Caravans[_loc28_].addCargo(1,50);
                  Caravans[_loc28_].addCargo(83,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  for(_loc25_ in Caravans[_loc28_].People)
                  {
                     Caravans[_loc28_].People[_loc25_].morale = 20;
                  }
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               break;
            case 15:
               Towns[24].locations[0].visible = false;
               Caravans[0].addPerson(new Character({
                  "name":Texts.fetch(2518),
                  "specialPortrait":3,
                  "category":10,
                  "gender":1,
                  "age":53,
                  "physical":3,
                  "agility":4,
                  "accuracy":5,
                  "intelligence":10,
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
                  "portraitWhiskers":0,
                  "portraitShirt":1,
                  "portraitNecklace":0,
                  "sleevesType":5,
                  "skinColor":{
                     "r":180,
                     "g":150,
                     "b":140,
                     "bc":1
                  },
                  "hairColor":{
                     "r":80,
                     "g":75,
                     "b":70,
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
                     "g":140,
                     "b":130,
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
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "r":20,
                     "g":10,
                     "b":0,
                     "bc":1
                  },
                  "doctorExperience":25000,
                  "veterinaryExperience":17000,
                  "mechanicExperience":10,
                  "travelExperience":5000,
                  "experienceModifier":0.1
               }));
               Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 3;
               break;
            case 16:
               Story.drekarLeft = true;
               if(Story.agreedToFindAnAllyForLintu)
               {
                  Story.dialogueDefaults[7] = 1169;
               }
               else
               {
                  Story.dialogueDefaults[7] = 1171;
               }
               _loc21_ = Math.floor(Towns[20].population / 12) - 1;
               _loc24_ = 1;
               while(_loc24_ <= _loc21_)
               {
                  _loc28_ = Caravans.push(new Caravan(7,mapMode.mapSymbols)) - 1;
                  equipRandomCaravan(Caravans[_loc28_]);
                  Caravans[_loc28_].x = Presets.Towns[20].x;
                  Caravans[_loc28_].y = Presets.Towns[20].y;
                  Caravans[_loc28_].direction = (_loc24_ - 1) * _loc16_;
                  Caravans[_loc28_].specialPurpose = 3;
                  directCaravanToTown(Caravans[_loc28_],5);
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].addCargo(113,10);
                  Caravans[_loc28_].addCargo(1,200);
                  Caravans[_loc28_].addCargo(83,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].category = 3;
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               Towns[20].active = false;
               Story.dialogueDefaults[16] = 698;
               Story.dialogueDefaults[10] = 705;
               Story.dialogueDefaults[15] = 716;
               failQuest(3);
               failQuest(5);
               failQuest(7);
               failQuest(10);
               failQuest(14);
               eliminateAllRandomGroups(2);
               break;
            case 17:
               Story.kiviStartedAttack = true;
               affectFactionRelations(-50,2,4);
               affectFactionRelations(30,0,4);
               Story.characterRelations[9] -= 50;
               _loc31_ = MathFunctions.CalcRevYAngle(Presets.Towns[19].x,Presets.Towns[19].y,Presets.Towns[20].x,Presets.Towns[20].y);
               param1 = Math.min(Math.floor(Towns[19].population / 18),5);
               _loc23_ = 3.141592653589793 / 2 / param1;
               _loc24_ = 1;
               while(_loc24_ <= param1)
               {
                  _loc28_ = Caravans.push(new Caravan(4,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[19].x;
                  Caravans[_loc28_].y = Presets.Towns[19].y;
                  equipRandomCaravan(Caravans[_loc28_],18);
                  Caravans[_loc28_].direction = _loc31_ - 3.141592653589793 / 4 + (_loc24_ - 1) * _loc23_;
                  Towns[19].population -= Caravans[_loc28_].People.length;
                  Towns[19].unemployed -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].addCargo(80,Caravans[_loc28_].People.length);
                  Caravans[_loc28_].addCargo(1,Caravans[_loc28_].People.length * 5);
                  Caravans[_loc28_].addCargo(83,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 5;
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               Story.kiviAttackTime = Time;
               Towns[19].locations[1].visible = false;
               Towns[19].locations[2].visible = false;
               Towns[19].locations[4].visible = false;
               Story.dialogueDefaults[15] = 714;
               break;
            case 18:
               Towns[19].locations[4].visible = false;
               for(_loc24_ in Towns[19].locations[5].people)
               {
                  if(Towns[19].locations[5].people[_loc24_].specialPurpose == 3)
                  {
                     Caravans[0].addPerson(Towns[19].locations[5].people[_loc24_]);
                     Towns[19].locations[5].people[_loc24_].category = 1;
                     Towns[19].locations[5].people[_loc24_].morale = 50 + Story.specificReputations[5] * 2;
                     Towns[19].locations[5].people.splice(_loc24_,1);
                  }
               }
               break;
            case 19:
               Story.kiviAreDestroyed = true;
               Towns[19].industries = [];
               Towns[19].population = 0;
               for(_loc24_ in Towns[19].locations)
               {
                  Towns[19].locations[_loc24_].visible = false;
               }
               for(_loc24_ in Caravans)
               {
                  if(Caravans[_loc24_].specialPurpose == 3)
                  {
                     Caravans[_loc24_].guardPosition = null;
                     Caravans[_loc24_].moving = true;
                     directCaravanToTown(Caravans[_loc24_],20);
                  }
               }
               break;
            case 20:
               Towns[19].locations[1].visible = true;
               Towns[19].locations[2].visible = true;
               Towns[19].locations[4].visible = true;
               break;
            case 21:
               Story.dialogueDefaults[13] = 828;
               Towns[33].locations[1].visible = false;
               affectSpecificReputation(2,-5);
               affectSpecificReputation(5,-5);
               break;
            case 22:
               Towns[25].locations[4].visible = false;
               _loc29_ = createNariziansSquad();
               directCaravanToTown(_loc29_,27);
               Story.nariziansAreMarchingToOrth = true;
               setFactionRelations(12,8,0);
               break;
            case 23:
               Story.allNariziansKilled = true;
               Story.nariziansLeft = false;
               if(!Story.solvedSolanumsMission)
               {
                  Story.dialogueDefaults[20] = 963;
                  completeQuest(21);
                  failQuest(22);
                  failQuest(23);
               }
               break;
            case 24:
               completeQuest(19);
               Story.dialogueDefaults[17] = 966;
               _loc10_ = getFactionRelations(8,0);
               affectFactionRelations(50,10);
               setFactionRelations(8,0,_loc10_);
               affectFactionRelations(40,10,11);
               Towns[23].locations[0].visible = false;
               Story.solvedSolanumsMission = true;
               Story.countdownToAbolishSlavery = true;
               Story.abolishSlaveryTime = Time + 604800;
               break;
            case 25:
               Story.allNariziansKilled = true;
               Story.dialogueDefaults[20] = 978;
               completeQuest(21);
               failQuest(22);
               failQuest(23);
               setFactionRelations(12,8,-50);
               affectSpecificReputation(4,-3);
               if(Story.receivedMoneyFromSapoboi)
               {
                  executeMajorEvent(31);
               }
               break;
            case 26:
               completeQuest(23);
               Caravans[0].money -= Math.min(Caravans[0].money,1000000);
               affectSpecificReputation(5,20);
               setFactionRelations(0,12,70);
               Story.nariziansArePreparingToLeave = true;
               Story.nariziansLeaveTime = Time + 172800;
               Story.acceptedBuildSettlementMisiion = false;
               Story.nariziansDestination = 3;
               break;
            case 27:
               completeQuest(21);
               Towns[25].locations[4].visible = false;
               Story.dialogueDefaults[20] = 989;
               _loc29_ = createNariziansSquad();
               _loc24_ = 1;
               while(_loc24_ <= 7)
               {
                  _loc29_.addTransport(new TransportUnit(1));
                  _loc24_++;
               }
               _loc24_ = 1;
               while(_loc24_ <= 7)
               {
                  _loc29_.addTransport(new TransportUnit(2));
                  _loc24_++;
               }
               _loc29_.distributeTransport();
               _loc29_.addCargo(112,80);
               _loc29_.addCargo(1,800);
               _loc29_.addCargo(75,200);
               _loc29_.addCargo(65,3);
               _loc29_.addCargo(79,3);
               _loc29_.addCargo(62,100);
               _loc29_.update();
               directCaravanToTown(_loc29_,34);
               _loc29_.moving = true;
               Story.nariziansLeft = true;
               if(Story.sapoboiIsMadAtYou)
               {
                  executeMajorEvent(33);
                  Story.dialogueDefaults[22] = 1030;
               }
               if(Story.receivedMoneyFromSapoboi)
               {
                  Story.dialogueDefaults[22] = 1030;
               }
               break;
            case 28:
               Story.buildingNarizianSettlement = true;
               Story.settlementCompleteTime = Time + 604800;
               break;
            case 29:
               Towns[34].active = true;
               if(Story.receivedMoneyFromSapoboi)
               {
                  navigationMode.mapTowns[34].text.text = mapMode.townNameTexts[34].text = Towns[34].altName = "Sapoboi";
               }
               else
               {
                  navigationMode.mapTowns[34].text.text = mapMode.townNameTexts[34].text = Towns[34].altName = Caravans[0].People[0].name;
               }
               for(_loc24_ in Caravans)
               {
                  if(Caravans[_loc24_].specialPurpose == 6)
                  {
                     Towns[34].population = Caravans[_loc24_].People.length;
                     Caravans[_loc24_].specialPurpose = null;
                     Caravans[_loc24_].active = false;
                  }
               }
               Story.dialogueDefaults[21] = 990;
               break;
            case 30:
               _loc24_ = 23;
               while(_loc24_ <= 32)
               {
                  Towns[_loc24_].abolishSlavery();
                  _loc24_++;
               }
               failQuest(15);
               failQuest(18);
               Story.janubiSlaveryAbolished = true;
               break;
            case 31:
               Story.sapoboiIsMadAtYou = true;
               Story.dialogueDefaults[22] = 1037;
               affectSpecificReputation(2,-20);
               affectSpecificReputation(5,-5);
               Story.characterRelations[22] -= 30;
               affectFactionRelations(-50,8);
               break;
            case 32:
               if(Story.receivedMoneyFromSapoboi)
               {
                  executeMajorEvent(31);
               }
               completeQuest(21);
               completeQuest(22);
               Towns[25].locations[4].visible = false;
               Story.dialogueDefaults[20] = 989;
               _loc29_ = createNariziansSquad();
               _loc24_ = 1;
               while(_loc24_ <= 3)
               {
                  _loc29_.addTransport(new TransportUnit(1));
                  _loc24_++;
               }
               _loc24_ = 1;
               while(_loc24_ <= 3)
               {
                  _loc29_.addTransport(new TransportUnit(2));
                  _loc24_++;
               }
               _loc29_.distributeTransport();
               _loc29_.addCargo(112,40);
               _loc29_.addCargo(1,400);
               _loc29_.addCargo(75,100);
               _loc29_.addCargo(65,3);
               _loc29_.addCargo(79,3);
               _loc29_.addCargo(62,50);
               _loc29_.update();
               if(Story.nariziansDestination == 1)
               {
                  directCaravanToTown(_loc29_,17);
               }
               if(Story.nariziansDestination == 2)
               {
                  directCaravanToTown(_loc29_,18);
               }
               _loc29_.moving = true;
               Story.nariziansLeft = true;
               Story.nariziansWentNorth = true;
               Story.acceptedFindTribeMission = false;
               break;
            case 33:
               Story.sapoboiIsMadAtYou = false;
               Story.dialogueDefaults[22] = 1019;
               affectSpecificReputation(2,15);
               affectSpecificReputation(5,5);
               Story.characterRelations[22] += 20;
               affectFactionRelations(50,8);
               break;
            case 34:
               if(Story.receivedMoneyFromSapoboi)
               {
                  executeMajorEvent(31);
               }
               break;
            case 35:
               Story.dialogueDefaults[7] = 1048;
               setFactionRelations(12,8,0);
               affectFactionRelations(40,12);
               affectFactionRelations(10,1);
               Story.nariziansCameToLintu = Time;
               break;
            case 36:
               Story.dialogueDefaults[10] = 1070;
               setFactionRelations(12,8,0);
               affectFactionRelations(40,12);
               Story.nariziansCameToPullid = Time;
               break;
            case 37:
               Towns[33].locations[1].visible = false;
               Towns[33].locations[0].visible = true;
               Towns[33].playersStorageSpace = 1000;
               Towns[33].addToStock(28,2,Towns[33].playersStorage);
               Towns[33].addToStock(61,5,Towns[33].playersStorage);
               Towns[33].addToStock(24,1,Towns[33].playersStorage);
               Towns[33].addToStock(30,35,Towns[33].playersStorage);
               Towns[33].addToStock(32,18,Towns[33].playersStorage);
               completeQuest(18);
               failQuest(16);
               failQuest(17);
               failQuest(19);
               Story.kevinIsDead = true;
               Story.characterRelations[17] = -100;
               affectFactionRelations(-70,10);
               _loc28_ = Caravans.push(new Caravan(13,mapMode.mapSymbols)) - 1;
               Caravans[_loc28_].x = Presets.Towns[33].x;
               Caravans[_loc28_].y = Presets.Towns[33].y;
               Caravans[_loc28_].addPerson(new Character({
                  "name":Texts.fetch(2949),
                  "specialPortrait":5,
                  "gender":1,
                  "age":20,
                  "physical":4,
                  "agility":10,
                  "accuracy":6,
                  "intelligence":5,
                  "portraitShoulders":1,
                  "portraitHair":8,
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
                  "sleevesType":5,
                  "skinColor":{
                     "r":180,
                     "g":160,
                     "b":50,
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
                     "r":40,
                     "g":40,
                     "b":40,
                     "bc":1
                  },
                  "pantsColor":{
                     "r":20,
                     "g":20,
                     "b":20,
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
                  },
                  "rangedWeaponsExperience":10000,
                  "rifleExperience":10000
               }));
               Caravans[_loc28_].People[0].specialPurpose = 4;
               if(difficulty == 1)
               {
                  for(_loc24_ in Caravans[_loc28_].People)
                  {
                     Caravans[_loc28_].People[_loc24_].baseAgility -= 1;
                     Caravans[_loc28_].People[_loc24_].baseAccuracy -= 1;
                  }
               }
               Caravans[_loc28_].addCargo(54,1);
               Caravans[_loc28_].addCargo(2,1);
               Caravans[_loc28_].addCargo(120,1);
               Caravans[_loc28_].addCargo(121,60);
               Caravans[_loc28_].distributeWeapons();
               Caravans[_loc28_].distributeAmmo();
               Caravans[_loc28_].distributeArmor();
               _loc33_ = [{
                  "type":33,
                  "x":43,
                  "y":13
               },{
                  "type":34,
                  "x":48,
                  "y":9
               },{
                  "type":31,
                  "x":32,
                  "y":30
               },{
                  "type":3,
                  "x":10,
                  "y":3
               },{
                  "type":16,
                  "x":15,
                  "y":8
               },{
                  "type":23,
                  "x":53,
                  "y":8
               },{
                  "type":5,
                  "x":60,
                  "y":2
               },{
                  "type":9,
                  "x":65,
                  "y":5
               },{
                  "type":17,
                  "x":8,
                  "y":15
               },{
                  "type":5,
                  "x":13,
                  "y":12
               },{
                  "type":30,
                  "x":18,
                  "y":19
               },{
                  "type":2,
                  "x":40,
                  "y":16
               },{
                  "type":5,
                  "x":50,
                  "y":13
               },{
                  "type":11,
                  "x":62,
                  "y":16
               },{
                  "type":7,
                  "x":66,
                  "y":11
               },{
                  "type":6,
                  "x":2,
                  "y":22
               },{
                  "type":9,
                  "x":17,
                  "y":28
               },{
                  "type":12,
                  "x":20,
                  "y":23
               },{
                  "type":10,
                  "x":23,
                  "y":21
               },{
                  "type":20,
                  "x":28,
                  "y":25
               },{
                  "type":4,
                  "x":35,
                  "y":27
               },{
                  "type":7,
                  "x":44,
                  "y":22
               },{
                  "type":15,
                  "x":58,
                  "y":24
               },{
                  "type":18,
                  "x":64,
                  "y":26
               },{
                  "type":27,
                  "x":4,
                  "y":33
               },{
                  "type":16,
                  "x":18,
                  "y":31
               },{
                  "type":5,
                  "x":26,
                  "y":37
               },{
                  "type":5,
                  "x":23,
                  "y":39
               },{
                  "type":8,
                  "x":45,
                  "y":30
               },{
                  "type":19,
                  "x":52,
                  "y":36
               },{
                  "type":21,
                  "x":56,
                  "y":32
               },{
                  "type":6,
                  "x":68,
                  "y":38
               },{
                  "type":7,
                  "x":8,
                  "y":46
               },{
                  "type":3,
                  "x":25,
                  "y":43
               },{
                  "type":2,
                  "x":29,
                  "y":48
               },{
                  "type":25,
                  "x":23,
                  "y":41
               },{
                  "type":11,
                  "x":38,
                  "y":43
               },{
                  "type":10,
                  "x":42,
                  "y":45
               },{
                  "type":4,
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
                  "type":17,
                  "x":5,
                  "y":52
               },{
                  "type":24,
                  "x":17,
                  "y":57
               },{
                  "type":6,
                  "x":28,
                  "y":55
               },{
                  "type":3,
                  "x":28,
                  "y":59
               },{
                  "type":7,
                  "x":36,
                  "y":54
               },{
                  "type":13,
                  "x":48,
                  "y":52
               },{
                  "type":18,
                  "x":59,
                  "y":56
               },{
                  "type":5,
                  "x":64,
                  "y":53
               },{
                  "type":3,
                  "x":68,
                  "y":50
               },{
                  "type":16,
                  "x":6,
                  "y":68
               },{
                  "type":4,
                  "x":13,
                  "y":61
               },{
                  "type":3,
                  "x":19,
                  "y":65
               },{
                  "type":11,
                  "x":22,
                  "y":63
               },{
                  "type":3,
                  "x":31,
                  "y":69
               },{
                  "type":18,
                  "x":40,
                  "y":61
               },{
                  "type":21,
                  "x":48,
                  "y":64
               },{
                  "type":5,
                  "x":53,
                  "y":67
               },{
                  "type":2,
                  "x":60,
                  "y":65
               }];
               setMode(2,[Caravans[0]],[Caravans[_loc28_]],null,{
                  "fieldWidth":70,
                  "fieldHeight":70,
                  "groupLocations":[{
                     "x":35,
                     "y":25
                  },{
                     "x":35,
                     "y":14
                  }]
               },_loc33_);
               cameFromMode = 4;
               break;
            case 38:
               Towns[22].locations[0].visible = false;
               Story.loisIsDead = true;
               if(Story.youAcceptedFarnirsJob && Story.dialogueDefaults[9] == 327 && !Story.firstZoneResolved)
               {
                  Story.dialogueDefaults[9] = 1119;
               }
               failQuest(9);
               break;
            case 39:
               for(_loc24_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 4)
                  {
                     Caravans[0].removePerson(_loc24_);
                     break;
                  }
               }
               affectSpecificReputation(5,-10);
               break;
            case 40:
               Caravans[0].addPerson(new Character({
                  "name":Texts.fetch(1911),
                  "specialPurpose":5,
                  "category":1,
                  "specialPortrait":6,
                  "gender":1,
                  "age":45,
                  "physical":4,
                  "agility":6,
                  "accuracy":7,
                  "intelligence":7,
                  "portraitShoulders":1,
                  "portraitHair":1,
                  "portraitHead":3,
                  "portraitMouth":4,
                  "portraitNose":3,
                  "portraitEyebrows":3,
                  "portraitEyes":3,
                  "portraitEars":2,
                  "portraitBeard":0,
                  "portraitMoustache":0,
                  "portraitWhiskers":0,
                  "portraitShirt":1,
                  "portraitNecklace":0,
                  "sleevesType":5,
                  "skinColor":{
                     "r":219,
                     "g":174,
                     "b":167,
                     "bc":1
                  },
                  "hairColor":{
                     "r":161,
                     "g":106,
                     "b":82,
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
                     "r":113,
                     "g":93,
                     "b":75,
                     "bc":1
                  },
                  "pantsColor":{
                     "r":113,
                     "g":93,
                     "b":75,
                     "bc":1
                  },
                  "shoesColor":{
                     "r":20,
                     "g":10,
                     "b":0,
                     "bc":1
                  },
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "r":20,
                     "g":10,
                     "b":0,
                     "bc":1
                  },
                  "generalBattleExperience":5000,
                  "rangedWeaponsExperience":2000,
                  "rifleExperience":1500,
                  "pistolExperience":2000,
                  "firstAidExperience":1000,
                  "huntingExperience":3000,
                  "travelExperience":5000
               }));
               break;
            case 41:
               Towns[15].industries = [];
               Towns[15].stock = [];
               Towns[15].population = 0;
               Towns[15].unemployed = 0;
               _loc24_ = 2;
               while(_loc24_ <= 4)
               {
                  Towns[15].locations[_loc24_].visible = false;
                  _loc24_++;
               }
               break;
            case 42:
               _loc19_ = createMikazeOilMainCharacters();
               for(_loc24_ in _loc19_)
               {
                  _loc19_[_loc24_].category = 10;
                  _loc19_[_loc24_].specialPurpose = 6;
                  Caravans[0].addPerson(_loc19_[_loc24_]);
               }
               Towns[40].locations[4].visible = false;
               break;
            case 43:
               _loc24_ = 1;
               while(_loc24_ <= 2)
               {
                  _loc28_ = Caravans.push(new Caravan(19,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[36].x;
                  Caravans[_loc28_].y = Presets.Towns[36].y;
                  equipRandomCaravan(Caravans[_loc28_]);
                  directCaravanToTown(Caravans[_loc28_],40);
                  Towns[36].population -= Caravans[_loc28_].People.length;
                  Towns[36].unemployed -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].addCargo(167,10);
                  Caravans[_loc28_].addCargo(1,100);
                  Caravans[_loc28_].addCargo(75,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 8;
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               break;
            case 44:
               Towns[40].locations[4].visible = false;
               if(Story.laMissionInProgress == 3)
               {
                  _loc14_ = 3;
               }
               else
               {
                  _loc14_ = 5;
               }
               _loc24_ = 1;
               while(_loc24_ <= _loc14_)
               {
                  _loc28_ = Caravans.push(new Caravan(21,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[40].x;
                  Caravans[_loc28_].y = Presets.Towns[40].y;
                  if(_loc24_ == 3 || Story.laMissionInProgress == 3)
                  {
                     if(_loc24_ == 3)
                     {
                        _loc8_ = createMikazeOilMainCharacters();
                        for(_loc25_ in _loc8_)
                        {
                           Caravans[_loc28_].addPerson(_loc8_[_loc25_]);
                        }
                        _loc25_ = 1;
                        while(_loc25_ <= 7)
                        {
                           Caravans[_loc28_].addPerson(new Character());
                           _loc25_++;
                        }
                     }
                     else
                     {
                        _loc25_ = 1;
                        while(_loc25_ <= 10)
                        {
                           Caravans[_loc28_].addPerson(new Character());
                           _loc25_++;
                        }
                     }
                     Caravans[_loc28_].keepDistance = true;
                     Caravans[_loc28_].name = Texts.fetch(4919);
                     Caravans[_loc28_].addCargo(22,Math.round(Caravans[_loc28_].People.length / 3));
                     Caravans[_loc28_].addCargo(32,Caravans[_loc28_].People.length * 2);
                     Caravans[_loc28_].addCargo(61,Caravans[_loc28_].People.length * 5);
                     Caravans[_loc28_].distributeWeapons();
                     Caravans[_loc28_].distributeAmmo();
                  }
                  else
                  {
                     equipRandomCaravan(Caravans[_loc28_]);
                  }
                  Towns[40].population -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].addCargo(167,10);
                  Caravans[_loc28_].addCargo(1,100);
                  Caravans[_loc28_].addCargo(75,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 9;
                  Caravans[_loc28_].guardPosition = {
                     "x":Presets.Towns[40].x - (_loc14_ - 1) / 2 * 100 + (_loc24_ - 1) * 100,
                     "y":Presets.Towns[40].y - 100
                  };
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               break;
            case 45:
               for(_loc24_ in Caravans)
               {
                  if(Caravans[_loc24_].specialPurpose == 8)
                  {
                     Caravans[_loc24_].category = 3;
                     Caravans[_loc24_].guardPosition = null;
                     Caravans[_loc24_].moving = true;
                     directCaravanToTown(Caravans[_loc24_],40);
                  }
               }
               mapMode.openDialogue(23);
               Story.dialogueDefaults[24] = 1421;
               Story.mikazeRebelsDefeted = true;
               break;
            case 46:
               Story.provokedOzbet = true;
               Story.releasingOzbetDefenders = true;
               Story.nextBunchTime = Time + 28800;
               Story.currentOzbetDefendersBunch = 0;
               Story.dialogueDefaults[24] = 1431;
               completeQuest(30);
               break;
            case 47:
               Story.nextBunchTime = Time + 28800;
               Story.currentOzbetDefendersBunch++;
               if(Story.currentOzbetDefendersBunch >= 2)
               {
                  Story.releasingOzbetDefenders = false;
               }
               _loc24_ = 1;
               while(_loc24_ <= 3)
               {
                  _loc28_ = Caravans.push(new Caravan(22,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[37].x;
                  Caravans[_loc28_].y = Presets.Towns[37].y;
                  equipRandomCaravan(Caravans[_loc28_]);
                  Caravans[_loc28_].direction = 3.141592653589793 - 1 + _loc24_ / 2;
                  Towns[37].population -= Caravans[_loc28_].People.length;
                  Towns[37].unemployed -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].addCargo(167,10);
                  Caravans[_loc28_].addCargo(1,100);
                  Caravans[_loc28_].addCargo(75,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 10;
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].guardPosition = {
                     "x":Presets.Towns[36].x - 400 + _loc24_ * 200,
                     "y":Presets.Towns[36].y - 400 + Story.currentOzbetDefendersBunch * 200
                  };
                  Caravans[_loc28_].concentrated = true;
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               break;
            case 48:
               Story.janubiStartedDefense = true;
               _loc24_ = 1;
               while(_loc24_ <= 6)
               {
                  if(_loc24_ % 2 == 0)
                  {
                     _loc27_ = 36;
                  }
                  else
                  {
                     _loc27_ = 38;
                  }
                  _loc28_ = Caravans.push(new Caravan(23,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[_loc27_].x;
                  Caravans[_loc28_].y = Presets.Towns[_loc27_].y;
                  equipRandomCaravan(Caravans[_loc28_]);
                  Caravans[_loc28_].direction = 3.141592653589793 - 1 + _loc24_ / 2;
                  if(_loc27_ == 38)
                  {
                     Caravans[_loc28_].direction = 1.6769908169872414 + _loc24_ / 4;
                  }
                  else
                  {
                     Caravans[_loc28_].direction = -2.25 + _loc24_ / 4;
                  }
                  Towns[_loc27_].population -= Caravans[_loc28_].People.length;
                  Towns[_loc27_].unemployed -= Caravans[_loc28_].People.length;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].addCargo(167,10);
                  Caravans[_loc28_].addCargo(1,100);
                  Caravans[_loc28_].addCargo(75,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 11;
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].guardPosition = {
                     "x":Presets.Towns[36].x + Math.sin(_loc24_ * 1.047) * 200,
                     "y":Presets.Towns[36].y - Math.cos(_loc24_ * 1.047) * 200
                  };
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               break;
            case 49:
               Story.ozbetDefeated = true;
               for(_loc24_ in Caravans)
               {
                  if(Caravans[_loc24_].specialPurpose == 11)
                  {
                     Caravans[_loc24_].category = 3;
                     Caravans[_loc24_].guardPosition = null;
                     Caravans[_loc24_].moving = true;
                     directCaravanToTown(Caravans[_loc24_],36);
                  }
               }
               mapMode.openDialogue(24);
               Story.dialogueDefaults[24] = 1432;
               Story.dialogueDefaults[27] = 1436;
               Towns[37].bannedGoods = [];
               Towns[37].specialPrices = [];
               Towns[37].entranceControl = false;
               Towns[37].faction = 13;
               Towns[37].allowsSlaves = true;
               Towns[37].locations[0].visible = false;
               Towns[45].bannedGoods = [];
               Towns[45].specialPrices = [];
               Towns[45].entranceControl = false;
               Towns[45].faction = 13;
               Towns[45].allowsSlaves = true;
               eliminateAllRandomGroups(20);
               break;
            case 50:
               Story.janubiDefeated = true;
               for(_loc24_ in Caravans)
               {
                  if(Caravans[_loc24_].specialPurpose == 10)
                  {
                     Caravans[_loc24_].category = 3;
                     Caravans[_loc24_].guardPosition = null;
                     Caravans[_loc24_].moving = true;
                     directCaravanToTown(Caravans[_loc24_],37);
                  }
               }
               mapMode.openDialogue(25);
               Towns[36].locations[0].visible = false;
               Towns[36].locations[2].visible = false;
               for(_loc24_ in Item.Goods[74].towns)
               {
                  Towns[Item.Goods[74].towns[_loc24_]].abolishSlavery();
                  Towns[Item.Goods[74].towns[_loc24_]].bannedGoods = [165,104];
                  Towns[Item.Goods[74].towns[_loc24_]].specialPrices = {
                     "165":20,
                     "104":10
                  };
                  Towns[Item.Goods[74].towns[_loc24_]].faction = 14;
                  for(_loc25_ in Towns[Item.Goods[74].towns[_loc24_]].industries)
                  {
                     if(Towns[Item.Goods[74].towns[_loc24_]].industries[_loc25_].type == 21)
                     {
                        Towns[Item.Goods[74].towns[_loc24_]].industries.splice(_loc25_,1);
                        break;
                     }
                  }
                  for(_loc25_ in Towns[Item.Goods[74].towns[_loc24_]].playersIndustries)
                  {
                     if(Towns[Item.Goods[74].towns[_loc24_]].playersIndustries[_loc25_].type == 21)
                     {
                        Towns[Item.Goods[74].towns[_loc24_]].playersIndustries.splice(_loc25_,1);
                        break;
                     }
                  }
                  for(_loc25_ in Towns[Item.Goods[74].towns[_loc24_]].stock)
                  {
                     if(Towns[Item.Goods[74].towns[_loc24_]].stock[_loc25_].type == 104)
                     {
                        Towns[Item.Goods[74].towns[_loc24_]].stock.splice(_loc25_,1);
                        break;
                     }
                  }
               }
               eliminateAllRandomGroups(19);
               break;
            case 51:
               Story.nextBunchTime = Time + 28800;
               _loc28_ = Caravans.push(new Caravan(24,mapMode.mapSymbols)) - 1;
               Caravans[_loc28_].x = Presets.Towns[36].x;
               Caravans[_loc28_].y = Presets.Towns[36].y;
               equipRandomCaravan(Caravans[_loc28_]);
               Caravans[_loc28_].direction = 3.141592653589793 - 1 + _loc24_ / 2;
               Caravans[_loc28_].fearless = true;
               Caravans[_loc28_].addCargo(168,Caravans[_loc28_].People.length);
               Caravans[_loc28_].addCargo(1,Caravans[_loc28_].People.length * 20);
               Caravans[_loc28_].addCargo(75,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
               Caravans[_loc28_].category = 4;
               Caravans[_loc28_].specialPurpose = 12;
               directCaravanToTown(Caravans[_loc28_],Story.escortWFMCaravanTo);
               Caravans[_loc28_].staticMode = true;
               Caravans[_loc28_].update();
               break;
            case 52:
               Story.newSerinoSlavesNum = MathFunctions.random(10,20);
               _loc24_ = 1;
               while(_loc24_ <= Story.newSerinoSlavesNum)
               {
                  Caravans[0].addPerson(new Character({"category":4}));
                  Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 7;
                  _loc24_++;
               }
               Caravans[0].addCargo(112,Story.newSerinoSlavesNum);
               Caravans[0].addCargo(1,Story.newSerinoSlavesNum * 10);
               Caravans[0].addCargo(45,Story.newSerinoSlavesNum * 5);
               Story.wfmMissionDone = true;
               break;
            case 53:
               Caravans[0].cannibal = true;
               for(_loc24_ in Caravans[0].groupSettings)
               {
                  Caravans[0].groupSettings[_loc24_].foodstuffs[82] = 10;
               }
               screenNode.removeChild(caravanMenu);
               caravanMenu.remove();
               caravanMenu = new CaravanMenu(this,lastCaravanMenuCategory);
               screenNode.addChild(caravanMenu);
               caravanMenu.visible = false;
               break;
            case 54:
               Story.sapoboiKilled = true;
               Towns[29].locations[4].visible = false;
               mapMode.openDialogue(26);
               break;
            case 55:
               _loc15_ = [];
               _loc15_.push(new Character({
                  "skinColor":{
                     "b":124,
                     "r":172,
                     "bc":0.9345576966181398,
                     "g":137
                  },
                  "hairColor":{
                     "b":13,
                     "r":45,
                     "bc":0.9431674182415009,
                     "g":21
                  },
                  "shirtColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "pantsColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "shoesColor":{
                     "b":1,
                     "r":2,
                     "bc":1,
                     "g":2
                  },
                  "lipsColor":{
                     "b":118,
                     "r":166,
                     "bc":0.8719247856177389,
                     "g":130
                  },
                  "beardColor":{
                     "b":13,
                     "r":45,
                     "bc":0.9431674182415009,
                     "g":21
                  },
                  "eyebrowsColor":{
                     "b":0,
                     "r":0,
                     "bc":0.8488506764173508,
                     "g":0
                  },
                  "eyesColor":{
                     "b":12,
                     "r":32,
                     "bc":0.9890143209137023,
                     "g":12
                  },
                  "eyeSocketsColor":{
                     "b":130,
                     "r":172,
                     "bc":0.909381915256381,
                     "g":140
                  },
                  "bristleColor":{
                     "b":101,
                     "r":109,
                     "bc":0.9345576966181398,
                     "g":103
                  },
                  "name":Texts.fetch(5287),
                  "gender":1,
                  "physical":4,
                  "agility":5,
                  "accuracy":6,
                  "intelligence":5,
                  "idealWeight":78.7295937333256,
                  "_HP":100.14571129012673,
                  "sleevesType":4,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":17,
                     "r":43,
                     "bc":1,
                     "g":22
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":8,
                  "portraitNose":11,
                  "portraitMouth":5,
                  "portraitEyes":4,
                  "portraitHair":22,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":10,
                  "portraitEars":5,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":3,
                  "portraitNecklace":0
               }));
               _loc15_.push(new Character({
                  "skinColor":{
                     "b":147,
                     "r":195,
                     "bc":1.0845209592022003,
                     "g":162
                  },
                  "hairColor":{
                     "b":50,
                     "r":82,
                     "bc":1,
                     "g":60
                  },
                  "shirtColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "pantsColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "shoesColor":{
                     "b":22,
                     "r":53,
                     "bc":1,
                     "g":39
                  },
                  "lipsColor":{
                     "b":133,
                     "r":189,
                     "bc":0.9342708834446967,
                     "g":148
                  },
                  "beardColor":{
                     "b":23,
                     "r":51,
                     "bc":0.8691480593755841,
                     "g":32
                  },
                  "eyebrowsColor":{
                     "b":7,
                     "r":23,
                     "bc":0.7822332534380257,
                     "g":12
                  },
                  "eyesColor":{
                     "b":117,
                     "r":96,
                     "bc":1.1606772592291237,
                     "g":104
                  },
                  "eyeSocketsColor":{
                     "b":137,
                     "r":187,
                     "bc":1.048637076932937,
                     "g":148
                  },
                  "bristleColor":{
                     "b":134,
                     "r":134,
                     "bc":1.0845209592022003,
                     "g":134
                  },
                  "name":Texts.fetch(5288),
                  "gender":1,
                  "physical":3,
                  "agility":5,
                  "accuracy":8,
                  "intelligence":3,
                  "idealWeight":62.850532673764974,
                  "_HP":80,
                  "sleevesType":5,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":12,
                     "r":30,
                     "bc":1,
                     "g":28
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":3,
                  "portraitNose":6,
                  "portraitMouth":2,
                  "portraitEyes":2,
                  "portraitHair":6,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":8,
                  "portraitEars":3,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":2,
                  "portraitShirt":3,
                  "portraitNecklace":0
               }));
               Caravans[0].addCargo(22,2,true);
               Caravans[0].addCargo(20,2,true);
               Caravans[0].addCargo(32,100,true);
               for(_loc24_ in _loc15_)
               {
                  _loc15_[_loc24_].specialPurpose = 8;
                  _loc15_[_loc24_].category = 5;
                  _loc15_[_loc24_].addItemToEquipment(new Item(22,1),false);
                  _loc15_[_loc24_].addItemToEquipment(new Item(20,1),false);
                  _loc15_[_loc24_].addItemToEquipment(new Item(32,50),false);
                  _loc15_[_loc24_].weapons = [21,19];
                  Caravans[0].addPerson(_loc15_[_loc24_]);
               }
               break;
            case 56:
               _loc30_ = new Character({
                  "skinColor":{
                     "b":82,
                     "r":117,
                     "bc":1,
                     "g":91
                  },
                  "hairColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "shirtColor":{
                     "b":77,
                     "r":83,
                     "bc":0.9069592413492501,
                     "g":84
                  },
                  "pantsColor":{
                     "b":140,
                     "r":152,
                     "bc":1.1621730697806925,
                     "g":165
                  },
                  "shoesColor":{
                     "b":5,
                     "r":7,
                     "bc":1,
                     "g":6
                  },
                  "lipsColor":{
                     "b":93,
                     "r":146,
                     "bc":0.8898587375879288,
                     "g":106
                  },
                  "beardColor":{
                     "b":5,
                     "r":25,
                     "bc":0.9403709205798805,
                     "g":9
                  },
                  "eyebrowsColor":{
                     "b":0,
                     "r":0,
                     "bc":0.8463338285218924,
                     "g":0
                  },
                  "eyesColor":{
                     "b":12,
                     "r":39,
                     "bc":0.8257024730555713,
                     "g":21
                  },
                  "eyeSocketsColor":{
                     "b":108,
                     "r":154,
                     "bc":0.9035109925083816,
                     "g":120
                  },
                  "bristleColor":{
                     "b":73,
                     "r":91,
                     "bc":1,
                     "g":78
                  },
                  "name":Texts.fetch(5289),
                  "gender":1,
                  "physical":3,
                  "agility":2,
                  "accuracy":4,
                  "intelligence":6,
                  "idealWeight":74.97509329393506,
                  "_HP":160,
                  "sleevesType":1,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":4,
                  "portraitNose":4,
                  "portraitMouth":6,
                  "portraitEyes":7,
                  "portraitHair":12,
                  "portraitWrinkles":0,
                  "portraitBeard":14,
                  "portraitEyebrows":4,
                  "portraitEars":7,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":4,
                  "portraitShirt":2,
                  "portraitNecklace":0
               });
               _loc30_.specialPurpose = 9;
               _loc30_.category = 10;
               Caravans[0].addPerson(_loc30_);
               Story.eliahsManDead = false;
               break;
            case 57:
               _loc30_ = new Character({
                  "skinColor":{
                     "b":85,
                     "r":132,
                     "bc":1,
                     "g":102
                  },
                  "hairColor":{
                     "b":19,
                     "r":244,
                     "bc":1,
                     "g":19
                  },
                  "shirtColor":{
                     "b":45,
                     "r":42,
                     "bc":0.8535595254972578,
                     "g":45
                  },
                  "pantsColor":{
                     "b":111,
                     "r":121,
                     "bc":1.2728846580721438,
                     "g":137
                  },
                  "shoesColor":{
                     "b":20,
                     "r":38,
                     "bc":1,
                     "g":31
                  },
                  "lipsColor":{
                     "b":61,
                     "r":79,
                     "bc":1,
                     "g":63
                  },
                  "beardColor":{
                     "b":0,
                     "r":228,
                     "bc":1,
                     "g":0
                  },
                  "eyebrowsColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "eyesColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "eyeSocketsColor":{
                     "b":71,
                     "r":105,
                     "bc":1,
                     "g":79
                  },
                  "bristleColor":{
                     "b":52,
                     "r":55,
                     "bc":1,
                     "g":53
                  },
                  "name":"Scratch",
                  "gender":1,
                  "physical":3,
                  "agility":4,
                  "accuracy":6,
                  "intelligence":7,
                  "idealWeight":62.11335583589971,
                  "_HP":100,
                  "sleevesType":2,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":5,
                     "r":40,
                     "bc":1,
                     "g":10
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":6,
                  "portraitNose":12,
                  "portraitMouth":7,
                  "portraitEyes":4,
                  "portraitHair":29,
                  "portraitWrinkles":0,
                  "portraitBeard":19,
                  "portraitEyebrows":6,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":2,
                  "portraitShirt":4,
                  "portraitNecklace":0
               });
               _loc30_.specialPurpose = 9;
               _loc30_.category = 10;
               Caravans[0].addPerson(_loc30_);
               Story.eliahsManDead = false;
               break;
            case 58:
               _loc15_ = [];
               Story.bringingWorkers = true;
               _loc24_ = 0;
               while(_loc24_ <= 15)
               {
                  _loc15_[_loc24_] = new Character();
                  _loc15_[_loc24_].specialPurpose = 10;
                  _loc15_[_loc24_].category = 10;
                  Caravans[0].addPerson(_loc15_[_loc24_]);
                  _loc24_++;
               }
               break;
            case 59:
               Story.doneWithTheWinchester = true;
               Towns[47].industries.push(new Industry(9,50,Towns[47]));
               Towns[47].industries.push(new Industry(36,Towns[47].population,Towns[47]));
               for(_loc24_ in Towns[47].industries)
               {
                  Towns[47].industries[_loc24_].forSale = false;
               }
               Towns[47].constantPopulation = false;
               Towns[47].locations[0].visible = true;
               navigationMode.mapTowns[47].text.text = mapMode.townNameTexts[47].text = Towns[47].altName = Texts.fetch(5332);
               Towns[45].bannedGoods = [104];
               Towns[45].specialPrices = {
                  "104":15,
                  "95":0.6
               };
               Towns[45].industries.push(new Industry(37,20,Towns[45]));
               Towns[45].industries[Towns[45].industries.length - 1].forSale = false;
               Towns[45].population += 20;
               missingRoutes.push(29);
               break;
            case 60:
               _loc15_ = [];
               Story.bringingWorkers = true;
               _loc24_ = 0;
               while(_loc24_ <= Math.max(16 - Towns[47].population,1))
               {
                  _loc15_[_loc24_] = new Character();
                  _loc15_[_loc24_].specialPurpose = 10;
                  _loc15_[_loc24_].category = 10;
                  Caravans[0].addPerson(_loc15_[_loc24_]);
                  _loc24_++;
               }
               break;
            case 61:
               executeMajorEvent(44);
               executeMajorEvent(62);
               if(getFactionRelations(0,13) > 0)
               {
                  setFactionRelations(0,13,0);
               }
               affectFactionRelations(-20,13,0);
               break;
            case 62:
               _loc14_ = 3;
               _loc24_ = 1;
               while(_loc24_ <= _loc14_)
               {
                  _loc28_ = Caravans.push(new Caravan(19,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[40].x - (_loc14_ - 1) / 2 * 100 + (_loc24_ - 1) * 100;
                  Caravans[_loc28_].y = Presets.Towns[40].y - 500;
                  if(difficulty == 1)
                  {
                     equipRandomCaravan(Caravans[_loc28_],10);
                  }
                  else
                  {
                     equipRandomCaravan(Caravans[_loc28_],12);
                  }
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].addCargo(167,10);
                  Caravans[_loc28_].addCargo(1,100);
                  Caravans[_loc28_].addCargo(75,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 13;
                  Caravans[_loc28_].guardPosition = {
                     "x":Presets.Towns[40].x - (_loc14_ - 1) / 2 * 100 + (_loc24_ - 1) * 100,
                     "y":Presets.Towns[40].y - 100
                  };
                  Caravans[_loc28_].guardPosition.looseGuard = true;
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               break;
            case 63:
               if(!Story.rebelsReturned)
               {
                  Story.allRebelsAreDead = true;
                  Story.dialogueDefaults[25] = 1623;
               }
               break;
            case 64:
               Story.mikazePoliceDefeated = true;
               Towns[40].faction = Towns[41].faction = 10;
               if(!Story.allRebelsAreDead)
               {
                  for(_loc24_ in Caravans)
                  {
                     if(Caravans[_loc24_].specialPurpose == 9)
                     {
                        Caravans[_loc24_].guardPosition = null;
                        Caravans[_loc24_].moving = true;
                        directCaravanToTown(Caravans[_loc24_],40);
                        Caravans[_loc24_].concentrated = true;
                     }
                  }
                  Story.dialogueDefaults[25] = 1622;
               }
               break;
            case 65:
               _loc8_ = createMikazeOilMainCharacters();
               _loc8_[0].category = 1;
               Caravans[0].addPerson(_loc8_[0]);
               Towns[40].locations[4].visible = false;
               break;
            case 66:
               _loc28_ = Caravans.push(new Caravan(21,mapMode.mapSymbols)) - 1;
               Caravans[_loc28_].x = Presets.Towns[37].x;
               Caravans[_loc28_].y = Presets.Towns[37].y;
               equipRandomCaravan(Caravans[_loc28_],25);
               Caravans[_loc28_].direction = 0;
               Caravans[_loc28_].fearless = true;
               Caravans[_loc28_].concentrated = true;
               Caravans[_loc28_].addCargo(168,Caravans[_loc28_].People.length);
               Caravans[_loc28_].addCargo(1,Caravans[_loc28_].People.length * 20);
               Caravans[_loc28_].addCargo(75,Caravans[_loc28_].maxCargo - Caravans[_loc28_].totalCargo);
               Caravans[_loc28_].category = 4;
               Caravans[_loc28_].specialPurpose = 14;
               directCaravanToTown(Caravans[_loc28_],5);
               Caravans[_loc28_].staticMode = true;
               Caravans[_loc28_].update();
               break;
            case 67:
               Caravans[0].addPerson(new Character({
                  "category":1,
                  "skinColor":{
                     "b":146,
                     "r":190,
                     "bc":1,
                     "g":160
                  },
                  "hairColor":{
                     "b":24,
                     "r":67,
                     "bc":1,
                     "g":47
                  },
                  "shirtColor":{
                     "b":148,
                     "r":146,
                     "bc":0.9015097346156836,
                     "g":153
                  },
                  "pantsColor":{
                     "b":127,
                     "r":126,
                     "bc":1.3957115788944066,
                     "g":127
                  },
                  "shoesColor":{
                     "b":17,
                     "r":48,
                     "bc":1,
                     "g":28
                  },
                  "lipsColor":{
                     "b":89,
                     "r":141,
                     "bc":0.9122238107956946,
                     "g":102
                  },
                  "beardColor":{
                     "b":16,
                     "r":46,
                     "bc":1,
                     "g":33
                  },
                  "eyebrowsColor":{
                     "b":5,
                     "r":22,
                     "bc":0.8396348001994194,
                     "g":14
                  },
                  "eyesColor":{
                     "b":125,
                     "r":100,
                     "bc":1.1997927263379098,
                     "g":112
                  },
                  "eyeSocketsColor":{
                     "b":105,
                     "r":149,
                     "bc":1.0417007537558676,
                     "g":113
                  },
                  "bristleColor":{
                     "b":146,
                     "r":190,
                     "bc":1,
                     "g":160
                  },
                  "name":Texts.fetch(5995),
                  "gender":1,
                  "physical":5,
                  "agility":7,
                  "accuracy":4,
                  "intelligence":4,
                  "idealWeight":62.32200323371217,
                  "_HP":100,
                  "sleevesType":0,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":0,
                     "r":33,
                     "bc":1,
                     "g":1
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":3,
                  "portraitMouth":3,
                  "portraitEyes":2,
                  "portraitHair":25,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":8,
                  "portraitEars":1,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":7,
                  "portraitShirt":3,
                  "portraitNecklace":1
               }));
               Caravans[0].addPerson(new Character({
                  "category":1,
                  "skinColor":{
                     "b":113,
                     "r":172,
                     "bc":1,
                     "g":134
                  },
                  "hairColor":{
                     "b":22,
                     "r":54,
                     "bc":1,
                     "g":39
                  },
                  "shirtColor":{
                     "b":33,
                     "r":33,
                     "bc":0.9070907698944212,
                     "g":35
                  },
                  "pantsColor":{
                     "b":128,
                     "r":142,
                     "bc":1.3768662062939256,
                     "g":142
                  },
                  "shoesColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "lipsColor":{
                     "b":117,
                     "r":172,
                     "bc":1.046740566380322,
                     "g":133
                  },
                  "beardColor":{
                     "b":40,
                     "r":98,
                     "bc":0.8155075124464929,
                     "g":72
                  },
                  "eyebrowsColor":{
                     "b":1,
                     "r":6,
                     "bc":1,
                     "g":4
                  },
                  "eyesColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "eyeSocketsColor":{
                     "b":115,
                     "r":172,
                     "bc":1.0277337712235748,
                     "g":131
                  },
                  "bristleColor":{
                     "b":111,
                     "r":146,
                     "bc":1,
                     "g":124
                  },
                  "name":Texts.fetch(5996),
                  "gender":1,
                  "physical":3,
                  "agility":6,
                  "accuracy":6,
                  "intelligence":4,
                  "idealWeight":72.0200393232517,
                  "_HP":80,
                  "sleevesType":5,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":0,
                     "r":10,
                     "bc":1,
                     "g":8
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":11,
                  "portraitMouth":4,
                  "portraitEyes":2,
                  "portraitHair":22,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":8,
                  "portraitEars":7,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":3,
                  "portraitNecklace":1
               }));
               break;
            case 68:
               Towns[18].locations[2].visible = false;
               Towns[18].locations[3].visible = false;
               Towns[22].locations[0].visible = false;
               Caravans[0].addPerson(new Character(LOIS_SETTINGS));
               Caravans[0].People[Caravans[0].People.length - 1].category = 1;
               Caravans[0].People[Caravans[0].People.length - 1].morale = Math.min(Story.characterRelations[10] * 3,100);
               Story.loisLeft = true;
               break;
            case 69:
               Towns[37].locations[10].visible = false;
               Caravans[0].addPerson(new Character({
                  "specialPortrait":8,
                  "category":1,
                  "rangedWeaponsExperience":3000,
                  "rifleExperience":2000,
                  "skinColor":{
                     "b":152,
                     "r":221,
                     "bc":1,
                     "g":173
                  },
                  "hairColor":{
                     "b":27,
                     "r":119,
                     "bc":1,
                     "g":49
                  },
                  "shirtColor":{
                     "b":100,
                     "r":120,
                     "bc":0.8576075953431428,
                     "g":140
                  },
                  "pantsColor":{
                     "b":140,
                     "r":128,
                     "bc":1.4046471829060465,
                     "g":127
                  },
                  "shoesColor":{
                     "b":13,
                     "r":25,
                     "bc":1,
                     "g":24
                  },
                  "lipsColor":{
                     "b":0,
                     "r":129,
                     "bc":1,
                     "g":0
                  },
                  "beardColor":{
                     "b":33,
                     "r":119,
                     "bc":0.9259612013585866,
                     "g":34
                  },
                  "eyebrowsColor":{
                     "b":8,
                     "r":52,
                     "bc":0.9,
                     "g":13
                  },
                  "eyesColor":{
                     "b":127,
                     "r":87,
                     "bc":1,
                     "g":117
                  },
                  "eyeSocketsColor":{
                     "b":86,
                     "r":143,
                     "bc":1.0377191591076553,
                     "g":97
                  },
                  "bristleColor":{
                     "b":68,
                     "r":68,
                     "bc":1,
                     "g":68
                  },
                  "name":"Sigurd",
                  "gender":1,
                  "physical":4,
                  "agility":3,
                  "accuracy":10,
                  "intelligence":7,
                  "idealWeight":64.4215129991062,
                  "_HP":80,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":5,
                     "r":15,
                     "bc":1,
                     "g":12
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":9,
                  "portraitMouth":4,
                  "portraitEyes":2,
                  "portraitHair":1,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":4,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":1,
                  "sleevesType":4,
                  "portraitNecklace":0
               }));
               Caravans[0].People[Caravans[0].People.length - 1].morale = Math.min(Story.characterRelations[15] * 3,100);
               break;
            case 70:
               Story.reginsMenDefeated = true;
               Story.specificReputations[6] += 5;
               Story.dialogueDefaults[8] = 1874;
               Story.characterRelations[8] += 20;
               if(!Story.loisIsDead)
               {
                  var _loc48_:int = 10;
                  var _loc51_:* = Story.characterRelations[_loc48_] + 25;
                  Story.characterRelations[_loc48_] = _loc51_;
               }
               Story.dialogueDefaults[10] = 1882;
               completeQuest(35);
               affectFactionRelations(50,3);
               Story.sigurdSaidHeWouldLeave = undefined;
               Story.dialogueDefaults[34] = 1863;
               break;
            case 71:
               Caravans[0].addCargo(18,1,true);
               Caravans[0].addCargo(19,1,true);
               Caravans[0].addCargo(92,2,true);
               Caravans[0].addCargo(108,1,true);
               Caravans[0].addCargo(39,100,true);
               Caravans[0].addPerson(new Character({
                  "category":5,
                  "closeBattleExperience":10000,
                  "swordsExperience":8000,
                  "dodgeExperience":5000,
                  "painExperience":3000,
                  "skinColor":{
                     "b":181,
                     "r":235,
                     "bc":1,
                     "g":203
                  },
                  "hairColor":{
                     "b":175,
                     "r":255,
                     "bc":1,
                     "g":238
                  },
                  "shirtColor":{
                     "b":30,
                     "r":25,
                     "bc":0.9846181074157357,
                     "g":30
                  },
                  "pantsColor":{
                     "b":150,
                     "r":115,
                     "bc":1.1790153696201742,
                     "g":135
                  },
                  "shoesColor":{
                     "b":2,
                     "r":5,
                     "bc":1,
                     "g":3
                  },
                  "lipsColor":{
                     "b":88,
                     "r":149,
                     "bc":1,
                     "g":99
                  },
                  "beardColor":{
                     "b":31,
                     "r":108,
                     "bc":1,
                     "g":41
                  },
                  "eyebrowsColor":{
                     "b":110,
                     "r":178,
                     "bc":1,
                     "g":173
                  },
                  "eyesColor":{
                     "b":125,
                     "r":123,
                     "bc":1.1354682511650025,
                     "g":131
                  },
                  "eyeSocketsColor":{
                     "b":161,
                     "r":204,
                     "bc":1.0176836936734617,
                     "g":174
                  },
                  "bristleColor":{
                     "b":181,
                     "r":235,
                     "bc":1,
                     "g":203
                  },
                  "name":Texts.fetch(6154),
                  "gender":2,
                  "physical":4,
                  "agility":6,
                  "accuracy":6,
                  "intelligence":4,
                  "idealWeight":61.21476715616882,
                  "_HP":80,
                  "sleevesType":3,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":7,
                     "r":30,
                     "bc":1,
                     "g":26
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":12,
                  "portraitMouth":1,
                  "portraitEyes":3,
                  "portraitHair":2,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":5,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":1
               }));
               Caravans[0].People[Caravans[0].People.length - 1].addItemToEquipment(new Item(18,1));
               Caravans[0].People[Caravans[0].People.length - 1].addItemToEquipment(new Item(92,1));
               Caravans[0].People[Caravans[0].People.length - 1].weapons[0] = 17;
               Caravans[0].People[Caravans[0].People.length - 1].Jacket = 14;
               Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 12;
               Caravans[0].addPerson(new Character({
                  "category":5,
                  "closeBattleExperience":15000,
                  "swordsExperience":12000,
                  "dodgeExperience":3000,
                  "painExperience":10000,
                  "skinColor":{
                     "b":116,
                     "r":163,
                     "bc":1.0867971538566052,
                     "g":130
                  },
                  "hairColor":{
                     "b":205,
                     "r":255,
                     "bc":1,
                     "g":230
                  },
                  "shirtColor":{
                     "b":49,
                     "r":51,
                     "bc":0.8595516368746758,
                     "g":48
                  },
                  "pantsColor":{
                     "b":2,
                     "r":2,
                     "bc":1.0206587438005954,
                     "g":2
                  },
                  "shoesColor":{
                     "b":26,
                     "r":66,
                     "bc":1,
                     "g":55
                  },
                  "lipsColor":{
                     "b":106,
                     "r":163,
                     "bc":0.9352005580440164,
                     "g":117
                  },
                  "beardColor":{
                     "b":170,
                     "r":211,
                     "bc":1.0853219713084399,
                     "g":191
                  },
                  "eyebrowsColor":{
                     "b":97,
                     "r":143,
                     "bc":0.9767897741775959,
                     "g":120
                  },
                  "eyesColor":{
                     "b":37,
                     "r":71,
                     "bc":1,
                     "g":50
                  },
                  "eyeSocketsColor":{
                     "b":106,
                     "r":160,
                     "bc":0.9227892293594777,
                     "g":118
                  },
                  "bristleColor":{
                     "b":116,
                     "r":163,
                     "bc":1.0867971538566052,
                     "g":130
                  },
                  "name":Texts.fetch(6155),
                  "gender":2,
                  "physical":9,
                  "agility":3,
                  "accuracy":5,
                  "intelligence":3,
                  "idealWeight":69.33560373261571,
                  "_HP":59.88835084027525,
                  "sleevesType":5,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":4,
                     "r":15,
                     "bc":1,
                     "g":6
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":12,
                  "portraitMouth":8,
                  "portraitEyes":1,
                  "portraitHair":6,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":5,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":2,
                  "portraitNecklace":0
               }));
               Caravans[0].People[Caravans[0].People.length - 1].addItemToEquipment(new Item(19,1));
               Caravans[0].People[Caravans[0].People.length - 1].addItemToEquipment(new Item(92,1));
               Caravans[0].People[Caravans[0].People.length - 1].weapons[0] = 18;
               Caravans[0].People[Caravans[0].People.length - 1].Jacket = 14;
               Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 12;
               Caravans[0].addPerson(new Character({
                  "category":5,
                  "rangedWeaponsExperience":10000,
                  "crossbowExperience":8000,
                  "skinColor":{
                     "b":147,
                     "r":195,
                     "bc":0.9516526467166841,
                     "g":159
                  },
                  "hairColor":{
                     "b":93,
                     "r":234,
                     "bc":1,
                     "g":149
                  },
                  "shirtColor":{
                     "b":203,
                     "r":204,
                     "bc":0.8816780204884709,
                     "g":195
                  },
                  "pantsColor":{
                     "b":71,
                     "r":63,
                     "bc":1.0588369169272482,
                     "g":64
                  },
                  "shoesColor":{
                     "b":23,
                     "r":71,
                     "bc":1,
                     "g":24
                  },
                  "lipsColor":{
                     "b":131,
                     "r":187,
                     "bc":0.8793523706495762,
                     "g":143
                  },
                  "beardColor":{
                     "b":180,
                     "r":226,
                     "bc":1.1187596541829408,
                     "g":208
                  },
                  "eyebrowsColor":{
                     "b":107,
                     "r":154,
                     "bc":1,
                     "g":128
                  },
                  "eyesColor":{
                     "b":122,
                     "r":116,
                     "bc":1.1653261967934667,
                     "g":144
                  },
                  "eyeSocketsColor":{
                     "b":143,
                     "r":189,
                     "bc":1.02970981746912,
                     "g":147
                  },
                  "bristleColor":{
                     "b":147,
                     "r":195,
                     "bc":0.9516526467166841,
                     "g":159
                  },
                  "name":Texts.fetch(6156),
                  "gender":2,
                  "physical":3,
                  "agility":7,
                  "accuracy":9,
                  "intelligence":3,
                  "idealWeight":65.03878255747259,
                  "_HP":80,
                  "sleevesType":5,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":9,
                     "r":35,
                     "bc":1,
                     "g":25
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":2,
                  "portraitMouth":8,
                  "portraitEyes":3,
                  "portraitHair":2,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":7,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":1,
                  "portraitNecklace":0
               }));
               Caravans[0].People[Caravans[0].People.length - 1].addItemToEquipment(new Item(108,1));
               Caravans[0].People[Caravans[0].People.length - 1].addItemToEquipment(new Item(39,100));
               Caravans[0].People[Caravans[0].People.length - 1].weapons[0] = 29;
               Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 12;
               Towns[18].population -= 3;
               Towns[18].unemployed -= 3;
               break;
            case 72:
               Story.loisWariorsLeft = true;
               _loc4_ = [];
               for(_loc24_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 12)
                  {
                     _loc4_.push(Caravans[0].People[_loc24_]);
                  }
               }
               if(_loc4_.length > 0)
               {
                  _loc28_ = Caravans.push(new Caravan(3,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Caravans[0].x;
                  Caravans[_loc28_].y = Caravans[0].y;
                  for(_loc24_ in _loc4_)
                  {
                     Caravans[0].removePerson(_loc4_[_loc24_],true);
                     Caravans[_loc28_].addPerson(_loc4_[_loc24_]);
                     for(_loc25_ in _loc4_[_loc24_].equipment)
                     {
                        Caravans[_loc28_].addCargo(_loc4_[_loc24_].equipment[_loc25_].type,_loc4_[_loc24_].equipment[_loc25_].amount,true);
                     }
                  }
                  Caravans[_loc28_].category = 3;
                  Caravans[_loc28_].name = Texts.fetch(2233);
                  Caravans[_loc28_].addCargo(168,Caravans[_loc28_].People.length);
                  Caravans[_loc28_].addCargo(1,Caravans[_loc28_].People.length * 20);
                  Caravans[_loc28_].addCargo(75,10);
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  directCaravanToTown(Caravans[_loc28_],18);
               }
               break;
            case 73:
               Towns[18].locations[5].visible = true;
               Towns[18].playersStorageSpace = 2500;
               Towns[18].addToStock(205,14000,Towns[18].playersStorage);
               Towns[18].addToStock(205,14000);
               break;
            case 74:
               Towns[18].locations[5].visible = true;
               Towns[18].playersStorageSpace = 2500;
               Caravans[0].money -= Story.warehousePrice;
               Story.youOwnPullidWarehouse = true;
               break;
            case 75:
               _loc26_ = [];
               for(_loc24_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 13)
                  {
                     _loc26_.push(Caravans[0].People[_loc24_]);
                     Caravans[0].People[_loc24_].category = 1;
                  }
               }
               if(_loc26_.length > 0)
               {
                  Story.fafnirsMenAreWithYou = false;
                  _loc28_ = Caravans.push(new Caravan(2,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Towns[18].x;
                  Caravans[_loc28_].y = Towns[18].y;
                  for(_loc24_ in _loc26_)
                  {
                     Caravans[0].removePerson(_loc26_[_loc24_]);
                     Caravans[_loc28_].addPerson(_loc26_[_loc24_]);
                  }
                  Caravans[_loc28_].addTransport(new TransportUnit(1));
                  Caravans[_loc28_].addTransport(new TransportUnit(1));
                  Caravans[_loc28_].addTransport(new TransportUnit(1));
                  Caravans[_loc28_].addTransport(new TransportUnit(11));
                  Caravans[_loc28_].addTransport(new TransportUnit(11));
                  Caravans[_loc28_].addTransport(new TransportUnit(11));
                  Caravans[_loc28_].distributeTransport();
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].aggressive = false;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].specialPurpose = 16;
                  Caravans[_loc28_].name = Texts.fetch(6360);
                  Caravans[_loc28_].addCargo(168,5);
                  Caravans[_loc28_].addCargo(1,100);
                  Caravans[_loc28_].addCargo(75,Caravans[_loc28_].People.length * 2);
                  Caravans[_loc28_].addCargo(62,30);
                  Caravans[_loc28_].addCargo(205,28000);
                  Caravans[_loc28_].addCargo(146,Caravans[_loc28_].People.length);
                  Caravans[_loc28_].addCargo(148,Caravans[_loc28_].People.length * 50);
                  Caravans[_loc28_].distributeWeapons();
                  Caravans[_loc28_].distributeAmmo();
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  directCaravanToTown(Caravans[_loc28_],59);
               }
               break;
            case 76:
               Caravans[0].addPerson(new Character({
                  "category":10,
                  "skinColor":{
                     "b":162,
                     "r":234,
                     "bc":1,
                     "g":187
                  },
                  "hairColor":{
                     "b":244,
                     "r":253,
                     "bc":1,
                     "g":249
                  },
                  "shirtColor":{
                     "b":92,
                     "r":94,
                     "bc":0.8649220047518611,
                     "g":93
                  },
                  "pantsColor":{
                     "b":8,
                     "r":10,
                     "bc":1.3713285801932216,
                     "g":7
                  },
                  "shoesColor":{
                     "b":4,
                     "r":10,
                     "bc":1,
                     "g":10
                  },
                  "lipsColor":{
                     "b":98,
                     "r":146,
                     "bc":0.8998871345072984,
                     "g":111
                  },
                  "beardColor":{
                     "b":227,
                     "r":243,
                     "bc":1,
                     "g":238
                  },
                  "eyebrowsColor":{
                     "b":236,
                     "r":236,
                     "bc":1,
                     "g":236
                  },
                  "eyesColor":{
                     "b":63,
                     "r":94,
                     "bc":1,
                     "g":80
                  },
                  "eyeSocketsColor":{
                     "b":188,
                     "r":255,
                     "bc":1,
                     "g":214
                  },
                  "bristleColor":{
                     "b":161,
                     "r":234,
                     "bc":1,
                     "g":186
                  },
                  "name":Texts.fetch(6348),
                  "gender":1,
                  "physical":3,
                  "agility":3,
                  "accuracy":7,
                  "intelligence":7,
                  "idealWeight":66.71032501198351,
                  "_HP":80,
                  "sleevesType":5,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":0,
                     "r":15,
                     "bc":1,
                     "g":12
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":3,
                  "portraitNose":11,
                  "portraitMouth":4,
                  "portraitEyes":7,
                  "portraitHair":1,
                  "portraitWrinkles":3,
                  "portraitBeard":9,
                  "portraitEyebrows":3,
                  "portraitEars":7,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":3,
                  "portraitMoustache":10,
                  "portraitShirt":1,
                  "portraitNecklace":0
               }));
               Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 13;
               Caravans[0].addPerson(new Character({
                  "category":10,
                  "skinColor":{
                     "b":175,
                     "r":222,
                     "bc":0.9401474502868951,
                     "g":194
                  },
                  "hairColor":{
                     "b":255,
                     "r":255,
                     "bc":1,
                     "g":255
                  },
                  "shirtColor":{
                     "b":76,
                     "r":81,
                     "bc":0.8288791874423623,
                     "g":84
                  },
                  "pantsColor":{
                     "b":59,
                     "r":67,
                     "bc":1.2941187056712806,
                     "g":71
                  },
                  "shoesColor":{
                     "b":23,
                     "r":76,
                     "bc":1,
                     "g":38
                  },
                  "lipsColor":{
                     "b":159,
                     "r":219,
                     "bc":1.014292172435671,
                     "g":180
                  },
                  "beardColor":{
                     "b":255,
                     "r":255,
                     "bc":1,
                     "g":255
                  },
                  "eyebrowsColor":{
                     "b":87,
                     "r":87,
                     "bc":1,
                     "g":87
                  },
                  "eyesColor":{
                     "b":24,
                     "r":49,
                     "bc":1,
                     "g":35
                  },
                  "eyeSocketsColor":{
                     "b":177,
                     "r":219,
                     "bc":0.934261410869658,
                     "g":190
                  },
                  "bristleColor":{
                     "b":155,
                     "r":157,
                     "bc":0.9401474502868951,
                     "g":156
                  },
                  "name":Texts.fetch(6349),
                  "gender":1,
                  "physical":3,
                  "agility":8,
                  "accuracy":4,
                  "intelligence":4,
                  "idealWeight":63.487178560346365,
                  "_HP":60,
                  "sleevesType":2,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":16,
                     "r":45,
                     "bc":1,
                     "g":39
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":8,
                  "portraitNose":1,
                  "portraitMouth":4,
                  "portraitEyes":7,
                  "portraitHair":29,
                  "portraitWrinkles":5,
                  "portraitBeard":3,
                  "portraitEyebrows":8,
                  "portraitEars":2,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":3,
                  "portraitMoustache":4,
                  "portraitShirt":2,
                  "portraitNecklace":0
               }));
               Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 13;
               Story.fafnirsMenAreWithYou = true;
               break;
            case 77:
               Towns[5].locations[7].visible = false;
               Story.federationAttackStarted = true;
               setFactionRelations(17,18,-100);
               affectFactionRelations(50,18,0);
               if(Story.piratesWillBecomeHostile || Story.piratesWillAttack)
               {
                  affectFactionRelations(-50,20,17);
                  setFactionRelations(0,20,Math.max(0,getFactionRelations(0,20)));
               }
               _loc14_ = 4;
               _loc24_ = 1;
               while(_loc24_ <= _loc14_)
               {
                  _loc28_ = Caravans.push(new Caravan(29,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[5].x;
                  Caravans[_loc28_].y = Presets.Towns[5].y;
                  equipRandomCaravan(Caravans[_loc28_],35);
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].concentrated = true;
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 17;
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].guardPosition = {
                     "x":Presets.Towns[5].x - (_loc14_ - 1) / 2 * 100 + (_loc24_ - 1) * 100,
                     "y":Presets.Towns[5].y - 100
                  };
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               if(Story.liberationArmyReinforcementArrived)
               {
                  _loc28_ = Caravans.push(new Caravan(21,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[5].x;
                  Caravans[_loc28_].y = Presets.Towns[5].y;
                  equipRandomCaravan(Caravans[_loc28_],Story.liberationArmyReinforcementMen);
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].concentrated = true;
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 17;
                  directCaravanToTown(Caravans[_loc28_],53);
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
               }
               else
               {
                  for(_loc24_ in Caravans)
                  {
                     if(Caravans[_loc24_].specialPurpose == 14)
                     {
                        Caravans[_loc24_].specialPurpose = 17;
                        Caravans[_loc24_].guardPosition = null;
                        Caravans[_loc24_].moving = true;
                        directCaravanToTown(Caravans[_loc24_],53);
                        break;
                     }
                  }
               }
               Story.qubbaAttackPhase = 1;
               break;
            case 78:
               Story.federationStartedDefehse = true;
               _loc14_ = 5;
               if(difficulty == 2)
               {
                  _loc14_ = 6;
               }
               _loc24_ = 1;
               while(_loc24_ <= _loc14_)
               {
                  _loc28_ = Caravans.push(new Caravan(30,mapMode.mapSymbols)) - 1;
                  Caravans[_loc28_].x = Presets.Towns[53].x;
                  Caravans[_loc28_].y = Presets.Towns[53].y;
                  equipRandomCaravan(Caravans[_loc28_],32);
                  Caravans[_loc28_].keepDistance = true;
                  Caravans[_loc28_].fearless = true;
                  Caravans[_loc28_].category = 4;
                  Caravans[_loc28_].specialPurpose = 18;
                  Caravans[_loc28_].guardPosition = {
                     "x":Presets.Towns[53].x - (_loc14_ - 1) / 2 * 100 + (_loc24_ - 1) * 100,
                     "y":Presets.Towns[53].y + 100
                  };
                  Caravans[_loc28_].staticMode = true;
                  Caravans[_loc28_].update();
                  _loc24_++;
               }
               for(_loc24_ in Caravans)
               {
                  if(Caravans[_loc24_].specialPurpose == 17 && Caravans[_loc24_].type == 26)
                  {
                     Caravans[_loc24_].guardPosition = null;
                     Caravans[_loc24_].moving = true;
                     directCaravanToTown(Caravans[_loc24_],53);
                     Caravans[_loc24_].aggressive = true;
                     Caravans[_loc24_].concentrated = false;
                  }
               }
               break;
            case 79:
               Story.piratesReleased = true;
               _loc28_ = Caravans.push(new Caravan(26,mapMode.mapSymbols)) - 1;
               Caravans[_loc28_].x = Presets.Towns[69].x;
               Caravans[_loc28_].y = Presets.Towns[69].y;
               equipRandomCaravan(Caravans[_loc28_],25);
               Caravans[_loc28_].fearless = true;
               Caravans[_loc28_].concentrated = true;
               Caravans[_loc28_].name = Texts.fetch(6376);
               Caravans[_loc28_].category = 4;
               Caravans[_loc28_].specialPurpose = 17;
               Caravans[_loc28_].guardPosition = {
                  "x":Presets.Towns[53].x,
                  "y":Presets.Towns[53].y + 250
               };
               Caravans[_loc28_].staticMode = true;
               Caravans[_loc28_].update();
               break;
            case 80:
               _loc6_ = true;
               var _loc3_:Boolean = true;
               for(_loc24_ in Caravans)
               {
                  if(Caravans[_loc24_].active)
                  {
                     if(Caravans[_loc24_].specialPurpose == 17)
                     {
                        _loc6_ = false;
                     }
                     if(Caravans[_loc24_].specialPurpose == 18)
                     {
                        _loc3_ = false;
                     }
                     if(!_loc6_ && !_loc3_)
                     {
                        break;
                     }
                  }
               }
               if(_loc6_ && !_loc3_ && !Story.sentFederationTroopsToQubba)
               {
                  for(_loc24_ in Caravans)
                  {
                     if(Caravans[_loc24_].active)
                     {
                        if(Caravans[_loc24_].specialPurpose == 18)
                        {
                           Caravans[_loc24_].guardPosition = null;
                           Caravans[_loc24_].moving = true;
                           directCaravanToTown(Caravans[_loc24_],5);
                           Caravans[_loc24_].concentrated = true;
                        }
                     }
                  }
                  Story.sentFederationTroopsToQubba = true;
               }
               if(_loc6_ && _loc3_ && !Story.federationCapturedQubba && !Story.qubbaCapturedTheFederation)
               {
                  Story.bothSidesDestroyed = true;
                  Towns[5].locations[7].visible = true;
                  Story.dialogueDefaults[32] = 2019;
               }
               if(!_loc6_ && _loc3_ && (!Story.sentQubbaTroopsToAusz || param2))
               {
                  for(_loc24_ in Caravans)
                  {
                     if(Caravans[_loc24_].active)
                     {
                        if(Caravans[_loc24_].specialPurpose == 17)
                        {
                           Caravans[_loc24_].guardPosition = null;
                           Caravans[_loc24_].moving = true;
                           Caravans[_loc24_].concentrated = true;
                           directCaravanToTown(Caravans[_loc24_],53);
                        }
                     }
                  }
                  Story.sentQubbaTroopsToAusz = true;
               }
               break;
            case 81:
               Story.qubbaCapturedTheFederation = true;
               eliminateAllRandomGroups(39);
               mapMode.openDialogue(30);
               for(_loc24_ in Item.Goods[103].towns)
               {
                  Towns[Item.Goods[103].towns[_loc24_]].abolishSlavery();
                  Towns[Item.Goods[103].towns[_loc24_]].faction = 18;
               }
               Story.dialogueDefaults[25] = 2062;
               Story.dialogueDefaults[32] = 1985;
               Towns[5].locations[7].visible = true;
               affectFactionRelations(50,18,0);
               break;
            case 82:
               failQuest(25);
               Story.federationCapturedQubba = true;
               eliminateAllRandomGroups(38);
               for(_loc24_ in Item.Goods[102].towns)
               {
                  Towns[Item.Goods[102].towns[_loc24_]].allowsSlaves = true;
                  Towns[Item.Goods[102].towns[_loc24_]].faction = 17;
               }
               Towns[37].locations[0].visible = false;
               if(!param2)
               {
                  mapMode.openDialogue(31);
               }
               break;
            case 83:
               executeMajorEvent(86,true);
               Towns[53].locations[9].visible = false;
               break;
            case 84:
               executeMajorEvent(86,false);
               Towns[53].locations[9].visible = false;
               break;
            case 85:
               executeMajorEvent(86,true);
               Towns[53].locations[9].visible = false;
               Caravans[0].People[Caravans[0].People.length - 1].category = 3;
               break;
            case 86:
               _loc11_ = [];
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":163,
                     "r":210,
                     "bc":0.9336971458047628,
                     "g":182
                  },
                  "hairColor":{
                     "b":187,
                     "r":228,
                     "bc":1,
                     "g":234
                  },
                  "shirtColor":{
                     "b":191,
                     "r":191,
                     "bc":0.9464482951909304,
                     "g":191
                  },
                  "pantsColor":{
                     "b":136,
                     "r":140,
                     "bc":1.288302049972117,
                     "g":100
                  },
                  "shoesColor":{
                     "b":42,
                     "r":63,
                     "bc":1,
                     "g":60
                  },
                  "lipsColor":{
                     "b":106,
                     "r":148,
                     "bc":1,
                     "g":115
                  },
                  "beardColor":{
                     "b":26,
                     "r":54,
                     "bc":0.9239800325594842,
                     "g":31
                  },
                  "eyebrowsColor":{
                     "b":0,
                     "r":0,
                     "bc":1,
                     "g":0
                  },
                  "eyesColor":{
                     "b":114,
                     "r":98,
                     "bc":1.0752958831377328,
                     "g":97
                  },
                  "eyeSocketsColor":{
                     "b":146,
                     "r":210,
                     "bc":0.9944177591241896,
                     "g":162
                  },
                  "bristleColor":{
                     "b":163,
                     "r":210,
                     "bc":0.9336971458047628,
                     "g":182
                  },
                  "name":"Sofia",
                  "gender":2,
                  "physical":3,
                  "agility":4,
                  "accuracy":7,
                  "intelligence":5,
                  "idealWeight":67.03379040583968,
                  "_HP":80,
                  "sleevesType":1,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":0,
                     "r":5,
                     "bc":1,
                     "g":1
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":11,
                  "portraitMouth":8,
                  "portraitEyes":3,
                  "portraitHair":4,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":2,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":1,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":167,
                     "r":220,
                     "bc":1,
                     "g":179
                  },
                  "hairColor":{
                     "b":186,
                     "r":221,
                     "bc":1.1366876021027565,
                     "g":204
                  },
                  "shirtColor":{
                     "b":226,
                     "r":218,
                     "bc":0.9217401359230281,
                     "g":217
                  },
                  "pantsColor":{
                     "b":126,
                     "r":157,
                     "bc":1.0460164018440992,
                     "g":175
                  },
                  "shoesColor":{
                     "b":7,
                     "r":20,
                     "bc":1,
                     "g":14
                  },
                  "lipsColor":{
                     "b":135,
                     "r":194,
                     "bc":0.868957943841815,
                     "g":152
                  },
                  "beardColor":{
                     "b":190,
                     "r":220,
                     "bc":1.1096706439740955,
                     "g":203
                  },
                  "eyebrowsColor":{
                     "b":142,
                     "r":185,
                     "bc":1.0230188418924808,
                     "g":164
                  },
                  "eyesColor":{
                     "b":2,
                     "r":7,
                     "bc":0.8998204909265042,
                     "g":5
                  },
                  "eyeSocketsColor":{
                     "b":124,
                     "r":188,
                     "bc":1.0495877583511173,
                     "g":143
                  },
                  "bristleColor":{
                     "b":67,
                     "r":67,
                     "bc":1,
                     "g":67
                  },
                  "name":"Kim",
                  "gender":1,
                  "physical":8,
                  "agility":2,
                  "accuracy":4,
                  "intelligence":6,
                  "idealWeight":87.04425486922264,
                  "_HP":160,
                  "sleevesType":2,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":10,
                     "r":28,
                     "bc":1,
                     "g":16
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":3,
                  "portraitNose":5,
                  "portraitMouth":5,
                  "portraitEyes":8,
                  "portraitHair":18,
                  "portraitWrinkles":3,
                  "portraitBeard":0,
                  "portraitEyebrows":4,
                  "portraitEars":3,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":9,
                  "portraitShirt":1,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":161,
                     "r":223,
                     "bc":1,
                     "g":181
                  },
                  "hairColor":{
                     "b":59,
                     "r":93,
                     "bc":1,
                     "g":67
                  },
                  "shirtColor":{
                     "b":214,
                     "r":214,
                     "bc":0.8023943271487952,
                     "g":214
                  },
                  "pantsColor":{
                     "b":118,
                     "r":119,
                     "bc":1.2441384738776833,
                     "g":119
                  },
                  "shoesColor":{
                     "b":15,
                     "r":33,
                     "bc":1,
                     "g":21
                  },
                  "lipsColor":{
                     "b":116,
                     "r":166,
                     "bc":1.0223668289370835,
                     "g":128
                  },
                  "beardColor":{
                     "b":9,
                     "r":39,
                     "bc":0.8980525192804635,
                     "g":16
                  },
                  "eyebrowsColor":{
                     "b":65,
                     "r":96,
                     "bc":1,
                     "g":65
                  },
                  "eyesColor":{
                     "b":4,
                     "r":12,
                     "bc":0.8390958946198226,
                     "g":4
                  },
                  "eyeSocketsColor":{
                     "b":124,
                     "r":172,
                     "bc":1.063785391487181,
                     "g":140
                  },
                  "bristleColor":{
                     "b":162,
                     "r":197,
                     "bc":1,
                     "g":173
                  },
                  "name":"Dag",
                  "gender":1,
                  "physical":5,
                  "agility":4,
                  "accuracy":6,
                  "intelligence":5,
                  "idealWeight":70.43782916292548,
                  "_HP":120,
                  "sleevesType":4,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":1,
                     "r":5,
                     "bc":1,
                     "g":3
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":6,
                  "portraitNose":1,
                  "portraitMouth":7,
                  "portraitEyes":2,
                  "portraitHair":22,
                  "portraitWrinkles":3,
                  "portraitBeard":0,
                  "portraitEyebrows":3,
                  "portraitEars":7,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":164,
                     "r":205,
                     "bc":1,
                     "g":174
                  },
                  "hairColor":{
                     "b":165,
                     "r":209,
                     "bc":1.0975087635219096,
                     "g":193
                  },
                  "shirtColor":{
                     "b":232,
                     "r":239,
                     "bc":0.8758264102973045,
                     "g":237
                  },
                  "pantsColor":{
                     "b":71,
                     "r":65,
                     "bc":1.2984426969196647,
                     "g":66
                  },
                  "shoesColor":{
                     "b":9,
                     "r":20,
                     "bc":1,
                     "g":17
                  },
                  "lipsColor":{
                     "b":129,
                     "r":184,
                     "bc":1.0299413992092012,
                     "g":148
                  },
                  "beardColor":{
                     "b":151,
                     "r":198,
                     "bc":1,
                     "g":177
                  },
                  "eyebrowsColor":{
                     "b":126,
                     "r":172,
                     "bc":0.9877578871697187,
                     "g":155
                  },
                  "eyesColor":{
                     "b":81,
                     "r":81,
                     "bc":1,
                     "g":81
                  },
                  "eyeSocketsColor":{
                     "b":144,
                     "r":192,
                     "bc":0.9617689390666783,
                     "g":163
                  },
                  "bristleColor":{
                     "b":77,
                     "r":77,
                     "bc":1,
                     "g":77
                  },
                  "name":"Rafael",
                  "gender":1,
                  "physical":5,
                  "agility":5,
                  "accuracy":5,
                  "intelligence":5,
                  "idealWeight":65.76039220904931,
                  "_HP":100,
                  "sleevesType":0,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":16,
                     "r":40,
                     "bc":1,
                     "g":33
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":8,
                  "portraitNose":6,
                  "portraitMouth":4,
                  "portraitEyes":8,
                  "portraitHair":29,
                  "portraitWrinkles":0,
                  "portraitBeard":16,
                  "portraitEyebrows":3,
                  "portraitEars":2,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":2,
                  "portraitShirt":0,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":148,
                     "r":206,
                     "bc":1,
                     "g":164
                  },
                  "hairColor":{
                     "b":108,
                     "r":200,
                     "bc":1,
                     "g":165
                  },
                  "shirtColor":{
                     "b":221,
                     "r":219,
                     "bc":0.9187458383850754,
                     "g":215
                  },
                  "pantsColor":{
                     "b":76,
                     "r":102,
                     "bc":1.4053368691820651,
                     "g":98
                  },
                  "shoesColor":{
                     "b":2,
                     "r":5,
                     "bc":1,
                     "g":4
                  },
                  "lipsColor":{
                     "b":65,
                     "r":127,
                     "bc":1,
                     "g":68
                  },
                  "beardColor":{
                     "b":19,
                     "r":41,
                     "bc":0.9833727549761534,
                     "g":24
                  },
                  "eyebrowsColor":{
                     "b":40,
                     "r":122,
                     "bc":1,
                     "g":95
                  },
                  "eyesColor":{
                     "b":1,
                     "r":4,
                     "bc":0.8792036132887007,
                     "g":2
                  },
                  "eyeSocketsColor":{
                     "b":92,
                     "r":151,
                     "bc":0.8268455441109837,
                     "g":136
                  },
                  "bristleColor":{
                     "b":148,
                     "r":206,
                     "bc":1,
                     "g":164
                  },
                  "name":"Puk",
                  "gender":2,
                  "physical":5,
                  "agility":5,
                  "accuracy":5,
                  "intelligence":5,
                  "idealWeight":59.535928037948906,
                  "_HP":100,
                  "sleevesType":4,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":0,
                     "r":5,
                     "bc":1,
                     "g":4
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":11,
                  "portraitMouth":1,
                  "portraitEyes":3,
                  "portraitHair":2,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":7,
                  "portraitEars":3,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":2,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":166,
                     "r":239,
                     "bc":1,
                     "g":195
                  },
                  "hairColor":{
                     "b":21,
                     "r":58,
                     "bc":0.9412909155711532,
                     "g":30
                  },
                  "shirtColor":{
                     "b":84,
                     "r":82,
                     "bc":0.8457739109173418,
                     "g":82
                  },
                  "pantsColor":{
                     "b":138,
                     "r":145,
                     "bc":1.0620961945969611,
                     "g":141
                  },
                  "shoesColor":{
                     "b":23,
                     "r":35,
                     "bc":1,
                     "g":23
                  },
                  "lipsColor":{
                     "b":36,
                     "r":144,
                     "bc":1,
                     "g":72
                  },
                  "beardColor":{
                     "b":17,
                     "r":47,
                     "bc":0.8775280561298132,
                     "g":25
                  },
                  "eyebrowsColor":{
                     "b":7,
                     "r":23,
                     "bc":0.8471618240140378,
                     "g":10
                  },
                  "eyesColor":{
                     "b":98,
                     "r":89,
                     "bc":1,
                     "g":100
                  },
                  "eyeSocketsColor":{
                     "b":106,
                     "r":146,
                     "bc":0.9025562000460923,
                     "g":116
                  },
                  "bristleColor":{
                     "b":166,
                     "r":239,
                     "bc":1,
                     "g":195
                  },
                  "name":"Sarah",
                  "gender":2,
                  "physical":3,
                  "agility":5,
                  "accuracy":6,
                  "intelligence":6,
                  "idealWeight":66.85724626854062,
                  "_HP":80,
                  "sleevesType":1,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":0,
                     "r":5,
                     "bc":1,
                     "g":2
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":11,
                  "portraitMouth":8,
                  "portraitEyes":1,
                  "portraitHair":1,
                  "portraitWrinkles":9,
                  "portraitBeard":0,
                  "portraitEyebrows":5,
                  "portraitEars":5,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":1
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":124,
                     "r":172,
                     "bc":1.0402884227223694,
                     "g":139
                  },
                  "hairColor":{
                     "b":65,
                     "r":106,
                     "bc":1,
                     "g":78
                  },
                  "shirtColor":{
                     "b":121,
                     "r":119,
                     "bc":0.9198731400072575,
                     "g":122
                  },
                  "pantsColor":{
                     "b":158,
                     "r":158,
                     "bc":1.2689836227800697,
                     "g":158
                  },
                  "shoesColor":{
                     "b":19,
                     "r":28,
                     "bc":1,
                     "g":19
                  },
                  "lipsColor":{
                     "b":56,
                     "r":167,
                     "bc":1,
                     "g":83
                  },
                  "beardColor":{
                     "b":6,
                     "r":28,
                     "bc":0.919842070993036,
                     "g":13
                  },
                  "eyebrowsColor":{
                     "b":60,
                     "r":100,
                     "bc":1,
                     "g":60
                  },
                  "eyesColor":{
                     "b":96,
                     "r":87,
                     "bc":1,
                     "g":94
                  },
                  "eyeSocketsColor":{
                     "b":111,
                     "r":166,
                     "bc":0.9589639940299094,
                     "g":119
                  },
                  "bristleColor":{
                     "b":102,
                     "r":102,
                     "bc":1.0402884227223694,
                     "g":102
                  },
                  "name":"Lars",
                  "gender":1,
                  "physical":5,
                  "agility":5,
                  "accuracy":5,
                  "intelligence":5,
                  "idealWeight":74.89097997080535,
                  "_HP":100,
                  "sleevesType":4,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":2,
                     "r":40,
                     "bc":1,
                     "g":10
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":3,
                  "portraitNose":11,
                  "portraitMouth":4,
                  "portraitEyes":1,
                  "portraitHair":29,
                  "portraitWrinkles":4,
                  "portraitBeard":0,
                  "portraitEyebrows":3,
                  "portraitEars":1,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":3,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":131,
                     "r":194,
                     "bc":1,
                     "g":149
                  },
                  "hairColor":{
                     "b":78,
                     "r":175,
                     "bc":1,
                     "g":114
                  },
                  "shirtColor":{
                     "b":82,
                     "r":78,
                     "bc":0.8795777662657202,
                     "g":86
                  },
                  "pantsColor":{
                     "b":153,
                     "r":151,
                     "bc":1.2362547104712576,
                     "g":136
                  },
                  "shoesColor":{
                     "b":1,
                     "r":2,
                     "bc":1,
                     "g":1
                  },
                  "lipsColor":{
                     "b":59,
                     "r":131,
                     "bc":1,
                     "g":78
                  },
                  "beardColor":{
                     "b":17,
                     "r":38,
                     "bc":0.9881512069143356,
                     "g":22
                  },
                  "eyebrowsColor":{
                     "b":52,
                     "r":118,
                     "bc":1,
                     "g":69
                  },
                  "eyesColor":{
                     "b":4,
                     "r":17,
                     "bc":0.9929988559335471,
                     "g":7
                  },
                  "eyeSocketsColor":{
                     "b":78,
                     "r":131,
                     "bc":1.0072275752201676,
                     "g":86
                  },
                  "bristleColor":{
                     "b":125,
                     "r":143,
                     "bc":1,
                     "g":130
                  },
                  "name":"Emil",
                  "gender":1,
                  "physical":3,
                  "agility":3,
                  "accuracy":9,
                  "intelligence":5,
                  "idealWeight":65.26236646762118,
                  "_HP":60,
                  "sleevesType":1,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":4,
                     "r":10,
                     "bc":1,
                     "g":5
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":3,
                  "portraitMouth":7,
                  "portraitEyes":8,
                  "portraitHair":29,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":1,
                  "portraitEars":5,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":121,
                     "r":169,
                     "bc":1.022281157132238,
                     "g":137
                  },
                  "hairColor":{
                     "b":189,
                     "r":228,
                     "bc":1.1827186047099532,
                     "g":214
                  },
                  "shirtColor":{
                     "b":188,
                     "r":186,
                     "bc":0.8314289378002286,
                     "g":184
                  },
                  "pantsColor":{
                     "b":170,
                     "r":162,
                     "bc":1.471736135194078,
                     "g":170
                  },
                  "shoesColor":{
                     "b":13,
                     "r":20,
                     "bc":1,
                     "g":18
                  },
                  "lipsColor":{
                     "b":114,
                     "r":166,
                     "bc":1.0274849344044923,
                     "g":127
                  },
                  "beardColor":{
                     "b":186,
                     "r":228,
                     "bc":1.19190494986251,
                     "g":216
                  },
                  "eyebrowsColor":{
                     "b":128,
                     "r":169,
                     "bc":1.0644467442389578,
                     "g":154
                  },
                  "eyesColor":{
                     "b":138,
                     "r":122,
                     "bc":1.080959630291909,
                     "g":126
                  },
                  "eyeSocketsColor":{
                     "b":121,
                     "r":169,
                     "bc":1.022281157132238,
                     "g":137
                  },
                  "bristleColor":{
                     "b":96,
                     "r":96,
                     "bc":1.022281157132238,
                     "g":96
                  },
                  "name":"Daniel",
                  "gender":1,
                  "physical":4,
                  "agility":8,
                  "accuracy":3,
                  "intelligence":5,
                  "idealWeight":67.69062438979745,
                  "_HP":80,
                  "sleevesType":5,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":4,
                     "r":43,
                     "bc":1,
                     "g":9
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":3,
                  "portraitNose":7,
                  "portraitMouth":7,
                  "portraitEyes":8,
                  "portraitHair":29,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":6,
                  "portraitEars":3,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":135,
                     "r":183,
                     "bc":1.0096018614247442,
                     "g":151
                  },
                  "hairColor":{
                     "b":159,
                     "r":204,
                     "bc":1,
                     "g":191
                  },
                  "shirtColor":{
                     "b":89,
                     "r":99,
                     "bc":0.9584052775986494,
                     "g":94
                  },
                  "pantsColor":{
                     "b":106,
                     "r":110,
                     "bc":1.186944596003741,
                     "g":112
                  },
                  "shoesColor":{
                     "b":10,
                     "r":17,
                     "bc":1,
                     "g":12
                  },
                  "lipsColor":{
                     "b":82,
                     "r":154,
                     "bc":1,
                     "g":103
                  },
                  "beardColor":{
                     "b":118,
                     "r":156,
                     "bc":0.9859105486422777,
                     "g":145
                  },
                  "eyebrowsColor":{
                     "b":78,
                     "r":117,
                     "bc":0.9255657611321657,
                     "g":106
                  },
                  "eyesColor":{
                     "b":124,
                     "r":114,
                     "bc":1.1896607394330203,
                     "g":124
                  },
                  "eyeSocketsColor":{
                     "b":117,
                     "r":177,
                     "bc":0.9185771073214709,
                     "g":129
                  },
                  "bristleColor":{
                     "b":135,
                     "r":183,
                     "bc":1.0096018614247442,
                     "g":151
                  },
                  "name":"Anette",
                  "gender":2,
                  "physical":5,
                  "agility":6,
                  "accuracy":7,
                  "intelligence":2,
                  "idealWeight":59.77609930187464,
                  "_HP":60,
                  "sleevesType":3,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":2,
                     "r":17,
                     "bc":1,
                     "g":5
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":6,
                  "portraitMouth":8,
                  "portraitEyes":3,
                  "portraitHair":6,
                  "portraitWrinkles":7,
                  "portraitBeard":0,
                  "portraitEyebrows":5,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":2,
                  "portraitNecklace":1
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":115,
                     "r":177,
                     "bc":1,
                     "g":131
                  },
                  "hairColor":{
                     "b":10,
                     "r":22,
                     "bc":0.8374979897402227,
                     "g":14
                  },
                  "shirtColor":{
                     "b":112,
                     "r":105,
                     "bc":0.811507441662252,
                     "g":103
                  },
                  "pantsColor":{
                     "b":19,
                     "r":19,
                     "bc":1.4448821123223752,
                     "g":28
                  },
                  "shoesColor":{
                     "b":4,
                     "r":12,
                     "bc":1,
                     "g":7
                  },
                  "lipsColor":{
                     "b":50,
                     "r":188,
                     "bc":1,
                     "g":50
                  },
                  "beardColor":{
                     "b":10,
                     "r":22,
                     "bc":0.8374979897402227,
                     "g":14
                  },
                  "eyebrowsColor":{
                     "b":0,
                     "r":0,
                     "bc":0.7537481907662005,
                     "g":0
                  },
                  "eyesColor":{
                     "b":30,
                     "r":28,
                     "bc":1,
                     "g":29
                  },
                  "eyeSocketsColor":{
                     "b":137,
                     "r":185,
                     "bc":0.956824712548405,
                     "g":156
                  },
                  "bristleColor":{
                     "b":95,
                     "r":100,
                     "bc":1,
                     "g":96
                  },
                  "name":"Said",
                  "gender":1,
                  "physical":4,
                  "agility":6,
                  "accuracy":7,
                  "intelligence":3,
                  "idealWeight":72.87171059194952,
                  "_HP":120,
                  "sleevesType":4,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":14,
                     "r":30,
                     "bc":1,
                     "g":22
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":8,
                  "portraitNose":11,
                  "portraitMouth":4,
                  "portraitEyes":6,
                  "portraitHair":21,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":3,
                  "portraitEars":4,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":1,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":178,
                     "r":244,
                     "bc":1,
                     "g":196
                  },
                  "hairColor":{
                     "b":174,
                     "r":215,
                     "bc":1.196146211400628,
                     "g":198
                  },
                  "shirtColor":{
                     "b":118,
                     "r":116,
                     "bc":0.8587330236099661,
                     "g":127
                  },
                  "pantsColor":{
                     "b":119,
                     "r":147,
                     "bc":1.159147325437516,
                     "g":137
                  },
                  "shoesColor":{
                     "b":10,
                     "r":17,
                     "bc":1,
                     "g":17
                  },
                  "lipsColor":{
                     "b":59,
                     "r":136,
                     "bc":1,
                     "g":62
                  },
                  "beardColor":{
                     "b":174,
                     "r":215,
                     "bc":1.196146211400628,
                     "g":198
                  },
                  "eyebrowsColor":{
                     "b":124,
                     "r":180,
                     "bc":1.0765315902605652,
                     "g":157
                  },
                  "eyesColor":{
                     "b":128,
                     "r":104,
                     "bc":1.1105326563119888,
                     "g":102
                  },
                  "eyeSocketsColor":{
                     "b":102,
                     "r":170,
                     "bc":1,
                     "g":102
                  },
                  "bristleColor":{
                     "b":178,
                     "r":244,
                     "bc":1,
                     "g":196
                  },
                  "name":"Kristina",
                  "gender":2,
                  "physical":7,
                  "agility":4,
                  "accuracy":6,
                  "intelligence":3,
                  "idealWeight":72.95471528917551,
                  "_HP":140,
                  "sleevesType":5,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":19,
                     "r":43,
                     "bc":1,
                     "g":25
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":12,
                  "portraitMouth":1,
                  "portraitEyes":1,
                  "portraitHair":14,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":7,
                  "portraitEars":4,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":1
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":165,
                     "r":230,
                     "bc":1,
                     "g":188
                  },
                  "hairColor":{
                     "b":23,
                     "r":47,
                     "bc":0.9862083774060011,
                     "g":31
                  },
                  "shirtColor":{
                     "b":247,
                     "r":247,
                     "bc":0.9230763990432025,
                     "g":249
                  },
                  "pantsColor":{
                     "b":112,
                     "r":96,
                     "bc":1.1766271679662168,
                     "g":88
                  },
                  "shoesColor":{
                     "b":19,
                     "r":66,
                     "bc":1,
                     "g":64
                  },
                  "lipsColor":{
                     "b":67,
                     "r":127,
                     "bc":1,
                     "g":83
                  },
                  "beardColor":{
                     "b":22,
                     "r":43,
                     "bc":0.938832537457347,
                     "g":28
                  },
                  "eyebrowsColor":{
                     "b":0,
                     "r":0,
                     "bc":0.887587539665401,
                     "g":0
                  },
                  "eyesColor":{
                     "b":6,
                     "r":29,
                     "bc":0.8791642839089037,
                     "g":7
                  },
                  "eyeSocketsColor":{
                     "b":85,
                     "r":127,
                     "bc":1.0213953933678568,
                     "g":100
                  },
                  "bristleColor":{
                     "b":165,
                     "r":230,
                     "bc":1,
                     "g":188
                  },
                  "name":"Lotte",
                  "gender":2,
                  "physical":3,
                  "agility":5,
                  "accuracy":6,
                  "intelligence":6,
                  "idealWeight":70.78223361261189,
                  "_HP":60,
                  "sleevesType":4,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":2,
                     "r":30,
                     "bc":1,
                     "g":26
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":6,
                  "portraitMouth":8,
                  "portraitEyes":3,
                  "portraitHair":2,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":7,
                  "portraitEars":5,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":164,
                     "r":228,
                     "bc":1,
                     "g":181
                  },
                  "hairColor":{
                     "b":4,
                     "r":14,
                     "bc":0.9098345478065313,
                     "g":6
                  },
                  "shirtColor":{
                     "b":159,
                     "r":173,
                     "bc":0.8318450691178442,
                     "g":163
                  },
                  "pantsColor":{
                     "b":12,
                     "r":12,
                     "bc":1.0942115269135684,
                     "g":11
                  },
                  "shoesColor":{
                     "b":39,
                     "r":56,
                     "bc":1,
                     "g":40
                  },
                  "lipsColor":{
                     "b":66,
                     "r":151,
                     "bc":1,
                     "g":82
                  },
                  "beardColor":{
                     "b":3,
                     "r":12,
                     "bc":0.8934208628721536,
                     "g":5
                  },
                  "eyebrowsColor":{
                     "b":0,
                     "r":0,
                     "bc":0.8188510930258782,
                     "g":0
                  },
                  "eyesColor":{
                     "b":3,
                     "r":12,
                     "bc":0.9594436219893396,
                     "g":7
                  },
                  "eyeSocketsColor":{
                     "b":113,
                     "r":166,
                     "bc":0.9376251208595932,
                     "g":123
                  },
                  "bristleColor":{
                     "b":166,
                     "r":202,
                     "bc":1,
                     "g":176
                  },
                  "name":"Henrik",
                  "gender":1,
                  "physical":3,
                  "agility":4,
                  "accuracy":5,
                  "intelligence":8,
                  "idealWeight":72.22565648145974,
                  "_HP":100,
                  "sleevesType":0,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":18,
                     "r":51,
                     "bc":1,
                     "g":25
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":6,
                  "portraitNose":4,
                  "portraitMouth":3,
                  "portraitEyes":4,
                  "portraitHair":14,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":4,
                  "portraitEars":4,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":4,
                  "portraitShirt":0,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":178,
                     "r":224,
                     "bc":1.0190519511699676,
                     "g":196
                  },
                  "hairColor":{
                     "b":86,
                     "r":131,
                     "bc":1,
                     "g":112
                  },
                  "shirtColor":{
                     "b":102,
                     "r":88,
                     "bc":0.8825994816608728,
                     "g":89
                  },
                  "pantsColor":{
                     "b":133,
                     "r":128,
                     "bc":1.016614402178675,
                     "g":135
                  },
                  "shoesColor":{
                     "b":1,
                     "r":2,
                     "bc":1,
                     "g":1
                  },
                  "lipsColor":{
                     "b":139,
                     "r":206,
                     "bc":0.886570711620152,
                     "g":150
                  },
                  "beardColor":{
                     "b":111,
                     "r":19,
                     "bc":1,
                     "g":31
                  },
                  "eyebrowsColor":{
                     "b":30,
                     "r":58,
                     "bc":1,
                     "g":30
                  },
                  "eyesColor":{
                     "b":2,
                     "r":12,
                     "bc":0.8844589918851853,
                     "g":2
                  },
                  "eyeSocketsColor":{
                     "b":152,
                     "r":216,
                     "bc":0.8889318657107651,
                     "g":171
                  },
                  "bristleColor":{
                     "b":178,
                     "r":224,
                     "bc":1.0190519511699676,
                     "g":196
                  },
                  "name":"Vickie",
                  "gender":2,
                  "physical":3,
                  "agility":2,
                  "accuracy":8,
                  "intelligence":6,
                  "idealWeight":58.13628574833274,
                  "_HP":80,
                  "sleevesType":4,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":0,
                     "r":5,
                     "bc":1,
                     "g":0
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":2,
                  "portraitMouth":8,
                  "portraitEyes":1,
                  "portraitHair":2,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":5,
                  "portraitEars":1,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":1
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":164,
                     "r":211,
                     "bc":0.9305517312139273,
                     "g":182
                  },
                  "hairColor":{
                     "b":86,
                     "r":122,
                     "bc":1,
                     "g":101
                  },
                  "shirtColor":{
                     "b":53,
                     "r":51,
                     "bc":0.8723497438244522,
                     "g":53
                  },
                  "pantsColor":{
                     "b":98,
                     "r":104,
                     "bc":1.374141656793654,
                     "g":97
                  },
                  "shoesColor":{
                     "b":20,
                     "r":35,
                     "bc":1,
                     "g":30
                  },
                  "lipsColor":{
                     "b":83,
                     "r":158,
                     "bc":1,
                     "g":108
                  },
                  "beardColor":{
                     "b":124,
                     "r":181,
                     "bc":0.9576042232103646,
                     "g":148
                  },
                  "eyebrowsColor":{
                     "b":73,
                     "r":122,
                     "bc":0.8287872197292746,
                     "g":94
                  },
                  "eyesColor":{
                     "b":146,
                     "r":138,
                     "bc":1,
                     "g":147
                  },
                  "eyeSocketsColor":{
                     "b":151,
                     "r":208,
                     "bc":0.9112136485986412,
                     "g":163
                  },
                  "bristleColor":{
                     "b":164,
                     "r":211,
                     "bc":0.9305517312139273,
                     "g":182
                  },
                  "name":"Julia",
                  "gender":2,
                  "physical":5,
                  "agility":5,
                  "accuracy":5,
                  "intelligence":5,
                  "idealWeight":65.906602807343,
                  "_HP":80,
                  "sleevesType":1,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":9,
                     "r":20,
                     "bc":1,
                     "g":15
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":2,
                  "portraitMouth":8,
                  "portraitEyes":3,
                  "portraitHair":6,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":5,
                  "portraitEars":7,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":3,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":124,
                     "r":178,
                     "bc":1,
                     "g":139
                  },
                  "hairColor":{
                     "b":184,
                     "r":223,
                     "bc":1.1506517220288515,
                     "g":207
                  },
                  "shirtColor":{
                     "b":145,
                     "r":144,
                     "bc":0.9099871464073659,
                     "g":150
                  },
                  "pantsColor":{
                     "b":36,
                     "r":38,
                     "bc":1.0135388588532805,
                     "g":40
                  },
                  "shoesColor":{
                     "b":19,
                     "r":33,
                     "bc":1,
                     "g":33
                  },
                  "lipsColor":{
                     "b":96,
                     "r":149,
                     "bc":1.039474143832922,
                     "g":107
                  },
                  "beardColor":{
                     "b":184,
                     "r":223,
                     "bc":1.1506517220288515,
                     "g":207
                  },
                  "eyebrowsColor":{
                     "b":122,
                     "r":158,
                     "bc":1.0355865498259664,
                     "g":143
                  },
                  "eyesColor":{
                     "b":120,
                     "r":120,
                     "bc":1,
                     "g":129
                  },
                  "eyeSocketsColor":{
                     "b":104,
                     "r":149,
                     "bc":1.0645175809040666,
                     "g":116
                  },
                  "bristleColor":{
                     "b":114,
                     "r":126,
                     "bc":1,
                     "g":117
                  },
                  "name":"Johan",
                  "gender":1,
                  "physical":5,
                  "agility":6,
                  "accuracy":5,
                  "intelligence":4,
                  "idealWeight":74.0700554214418,
                  "_HP":120,
                  "sleevesType":2,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":2,
                     "r":15,
                     "bc":1,
                     "g":4
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":8,
                  "portraitNose":3,
                  "portraitMouth":5,
                  "portraitEyes":8,
                  "portraitHair":0,
                  "portraitWrinkles":2,
                  "portraitBeard":1,
                  "portraitEyebrows":3,
                  "portraitEars":6,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":13,
                  "portraitShirt":3,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":177,
                     "r":227,
                     "bc":1,
                     "g":189
                  },
                  "hairColor":{
                     "b":80,
                     "r":139,
                     "bc":1,
                     "g":96
                  },
                  "shirtColor":{
                     "b":229,
                     "r":232,
                     "bc":0.9063568618148565,
                     "g":230
                  },
                  "pantsColor":{
                     "b":88,
                     "r":124,
                     "bc":1.0995440690312535,
                     "g":93
                  },
                  "shoesColor":{
                     "b":16,
                     "r":40,
                     "bc":1,
                     "g":37
                  },
                  "lipsColor":{
                     "b":75,
                     "r":149,
                     "bc":1,
                     "g":75
                  },
                  "beardColor":{
                     "b":176,
                     "r":215,
                     "bc":1.13494657240808,
                     "g":197
                  },
                  "eyebrowsColor":{
                     "b":64,
                     "r":93,
                     "bc":1,
                     "g":80
                  },
                  "eyesColor":{
                     "b":63,
                     "r":106,
                     "bc":1,
                     "g":82
                  },
                  "eyeSocketsColor":{
                     "b":167,
                     "r":214,
                     "bc":1.0617840035818518,
                     "g":185
                  },
                  "bristleColor":{
                     "b":177,
                     "r":227,
                     "bc":1,
                     "g":189
                  },
                  "name":"Lotte",
                  "gender":2,
                  "physical":5,
                  "agility":4,
                  "accuracy":3,
                  "intelligence":7,
                  "idealWeight":65.1231076894328,
                  "_HP":80,
                  "sleevesType":5,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":0,
                     "r":17,
                     "bc":1,
                     "g":6
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":12,
                  "portraitMouth":1,
                  "portraitEyes":1,
                  "portraitHair":2,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":7,
                  "portraitEars":5,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":4,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":161,
                     "r":224,
                     "bc":1,
                     "g":182
                  },
                  "hairColor":{
                     "b":178,
                     "r":218,
                     "bc":1,
                     "g":208
                  },
                  "shirtColor":{
                     "b":55,
                     "r":56,
                     "bc":0.8324257734231651,
                     "g":54
                  },
                  "pantsColor":{
                     "b":2,
                     "r":2,
                     "bc":1.0826742718927562,
                     "g":2
                  },
                  "shoesColor":{
                     "b":13,
                     "r":25,
                     "bc":1,
                     "g":25
                  },
                  "lipsColor":{
                     "b":107,
                     "r":165,
                     "bc":0.87558090435341,
                     "g":122
                  },
                  "beardColor":{
                     "b":123,
                     "r":157,
                     "bc":1.0643347511999308,
                     "g":147
                  },
                  "eyebrowsColor":{
                     "b":83,
                     "r":110,
                     "bc":0.9834126079827546,
                     "g":104
                  },
                  "eyesColor":{
                     "b":112,
                     "r":104,
                     "bc":1.1235335149802268,
                     "g":119
                  },
                  "eyeSocketsColor":{
                     "b":146,
                     "r":211,
                     "bc":1,
                     "g":175
                  },
                  "bristleColor":{
                     "b":159,
                     "r":173,
                     "bc":1,
                     "g":163
                  },
                  "name":"Christian",
                  "gender":1,
                  "physical":5,
                  "agility":3,
                  "accuracy":6,
                  "intelligence":5,
                  "idealWeight":66.43580353586003,
                  "_HP":80,
                  "sleevesType":1,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":2,
                     "r":28,
                     "bc":1,
                     "g":8
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":3,
                  "portraitNose":11,
                  "portraitMouth":3,
                  "portraitEyes":9,
                  "portraitHair":29,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":3,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":2,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":162,
                     "r":206,
                     "bc":1,
                     "g":172
                  },
                  "hairColor":{
                     "b":102,
                     "r":178,
                     "bc":1,
                     "g":118
                  },
                  "shirtColor":{
                     "b":186,
                     "r":171,
                     "bc":0.8428538386709988,
                     "g":181
                  },
                  "pantsColor":{
                     "b":95,
                     "r":96,
                     "bc":1.0276385601609945,
                     "g":96
                  },
                  "shoesColor":{
                     "b":23,
                     "r":53,
                     "bc":1,
                     "g":26
                  },
                  "lipsColor":{
                     "b":99,
                     "r":151,
                     "bc":0.8897686189971864,
                     "g":113
                  },
                  "beardColor":{
                     "b":77,
                     "r":158,
                     "bc":1,
                     "g":95
                  },
                  "eyebrowsColor":{
                     "b":95,
                     "r":140,
                     "bc":1,
                     "g":95
                  },
                  "eyesColor":{
                     "b":115,
                     "r":115,
                     "bc":1,
                     "g":115
                  },
                  "eyeSocketsColor":{
                     "b":158,
                     "r":241,
                     "bc":1,
                     "g":175
                  },
                  "bristleColor":{
                     "b":104,
                     "r":104,
                     "bc":1,
                     "g":104
                  },
                  "name":"Magnus",
                  "gender":1,
                  "physical":9,
                  "agility":3,
                  "accuracy":3,
                  "intelligence":5,
                  "idealWeight":75.27413394628093,
                  "_HP":180,
                  "sleevesType":1,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":10,
                     "r":25,
                     "bc":1,
                     "g":24
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":8,
                  "portraitNose":1,
                  "portraitMouth":4,
                  "portraitEyes":8,
                  "portraitHair":6,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":10,
                  "portraitEars":4,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":3,
                  "portraitMoustache":13,
                  "portraitShirt":3,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":128,
                     "r":187,
                     "bc":1,
                     "g":150
                  },
                  "hairColor":{
                     "b":44,
                     "r":87,
                     "bc":1,
                     "g":66
                  },
                  "shirtColor":{
                     "b":182,
                     "r":178,
                     "bc":0.9926390699110925,
                     "g":183
                  },
                  "pantsColor":{
                     "b":124,
                     "r":124,
                     "bc":1.0057787401601672,
                     "g":123
                  },
                  "shoesColor":{
                     "b":21,
                     "r":66,
                     "bc":1,
                     "g":52
                  },
                  "lipsColor":{
                     "b":81,
                     "r":131,
                     "bc":0.9445740514434874,
                     "g":96
                  },
                  "beardColor":{
                     "b":70,
                     "r":131,
                     "bc":1,
                     "g":103
                  },
                  "eyebrowsColor":{
                     "b":38,
                     "r":92,
                     "bc":1.0389317115582526,
                     "g":65
                  },
                  "eyesColor":{
                     "b":113,
                     "r":104,
                     "bc":1,
                     "g":117
                  },
                  "eyeSocketsColor":{
                     "b":121,
                     "r":204,
                     "bc":1,
                     "g":145
                  },
                  "bristleColor":{
                     "b":120,
                     "r":136,
                     "bc":1,
                     "g":126
                  },
                  "name":"Kristian",
                  "gender":1,
                  "physical":3,
                  "agility":7,
                  "accuracy":6,
                  "intelligence":4,
                  "idealWeight":65.80658494029194,
                  "_HP":80,
                  "sleevesType":0,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":4,
                     "r":10,
                     "bc":1,
                     "g":10
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":2,
                  "portraitNose":9,
                  "portraitMouth":7,
                  "portraitEyes":7,
                  "portraitHair":7,
                  "portraitWrinkles":0,
                  "portraitBeard":7,
                  "portraitEyebrows":8,
                  "portraitEars":2,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":4,
                  "portraitShirt":0,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":136,
                     "r":209,
                     "bc":1,
                     "g":167
                  },
                  "hairColor":{
                     "b":93,
                     "r":154,
                     "bc":0.9159862130880356,
                     "g":121
                  },
                  "shirtColor":{
                     "b":94,
                     "r":94,
                     "bc":0.9555903438478709,
                     "g":89
                  },
                  "pantsColor":{
                     "b":163,
                     "r":153,
                     "bc":1.4563332605175674,
                     "g":154
                  },
                  "shoesColor":{
                     "b":42,
                     "r":71,
                     "bc":1,
                     "g":51
                  },
                  "lipsColor":{
                     "b":76,
                     "r":127,
                     "bc":1,
                     "g":83
                  },
                  "beardColor":{
                     "b":93,
                     "r":154,
                     "bc":0.9159862130880356,
                     "g":121
                  },
                  "eyebrowsColor":{
                     "b":47,
                     "r":90,
                     "bc":0.824387591779232,
                     "g":67
                  },
                  "eyesColor":{
                     "b":82,
                     "r":74,
                     "bc":1,
                     "g":83
                  },
                  "eyeSocketsColor":{
                     "b":74,
                     "r":118,
                     "bc":1.0295108578167855,
                     "g":87
                  },
                  "bristleColor":{
                     "b":136,
                     "r":209,
                     "bc":1,
                     "g":167
                  },
                  "name":"Ellen",
                  "gender":2,
                  "physical":4,
                  "agility":5,
                  "accuracy":5,
                  "intelligence":6,
                  "idealWeight":77.57222814578563,
                  "_HP":100,
                  "sleevesType":0,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":false,
                  "braceletColor":{
                     "b":4,
                     "r":22,
                     "bc":1,
                     "g":20
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":12,
                  "portraitMouth":8,
                  "portraitEyes":3,
                  "portraitHair":2,
                  "portraitWrinkles":7,
                  "portraitBeard":0,
                  "portraitEyebrows":5,
                  "portraitEars":6,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":3,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "skinColor":{
                     "b":161,
                     "r":214,
                     "bc":1,
                     "g":183
                  },
                  "hairColor":{
                     "b":92,
                     "r":170,
                     "bc":1,
                     "g":129
                  },
                  "shirtColor":{
                     "b":76,
                     "r":68,
                     "bc":0.8066651600413025,
                     "g":75
                  },
                  "pantsColor":{
                     "b":19,
                     "r":20,
                     "bc":1.1230504617560655,
                     "g":18
                  },
                  "shoesColor":{
                     "b":18,
                     "r":58,
                     "bc":1,
                     "g":44
                  },
                  "lipsColor":{
                     "b":131,
                     "r":189,
                     "bc":0.9960561665706337,
                     "g":147
                  },
                  "beardColor":{
                     "b":66,
                     "r":134,
                     "bc":0.8948916248045862,
                     "g":100
                  },
                  "eyebrowsColor":{
                     "b":29,
                     "r":66,
                     "bc":0.8464627280272544,
                     "g":47
                  },
                  "eyesColor":{
                     "b":116,
                     "r":116,
                     "bc":1,
                     "g":116
                  },
                  "eyeSocketsColor":{
                     "b":127,
                     "r":192,
                     "bc":1.0285474910400807,
                     "g":139
                  },
                  "bristleColor":{
                     "b":155,
                     "r":163,
                     "bc":1,
                     "g":158
                  },
                  "name":"Fredrik",
                  "gender":1,
                  "physical":7,
                  "agility":3,
                  "accuracy":4,
                  "intelligence":6,
                  "idealWeight":78.80596028501168,
                  "_HP":140,
                  "sleevesType":3,
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":22,
                     "r":45,
                     "bc":1,
                     "g":39
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":6,
                  "portraitNose":6,
                  "portraitMouth":7,
                  "portraitEyes":2,
                  "portraitHair":8,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":3,
                  "portraitEars":1,
                  "portraitEyeSockets":1,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":3,
                  "portraitNecklace":0
               }));
               _loc11_.push(new Character({
                  "specialPortrait":10,
                  "skinColor":{
                     "b":171,
                     "r":214,
                     "bc":1,
                     "g":178
                  },
                  "hairColor":{
                     "b":130,
                     "r":166,
                     "bc":1,
                     "g":137
                  },
                  "shirtColor":{
                     "b":67,
                     "r":64,
                     "bc":0.9468652250245214,
                     "g":73
                  },
                  "pantsColor":{
                     "b":52,
                     "r":56,
                     "bc":1.1113663685973734,
                     "g":53
                  },
                  "shoesColor":{
                     "b":7,
                     "r":20,
                     "bc":1,
                     "g":20
                  },
                  "lipsColor":{
                     "b":129,
                     "r":187,
                     "bc":0.9603119953535497,
                     "g":140
                  },
                  "beardColor":{
                     "b":178,
                     "r":215,
                     "bc":1.1357406890951096,
                     "g":200
                  },
                  "eyebrowsColor":{
                     "b":106,
                     "r":145,
                     "bc":0.9861760960612446,
                     "g":129
                  },
                  "eyesColor":{
                     "b":105,
                     "r":101,
                     "bc":1.1522861891426146,
                     "g":106
                  },
                  "eyeSocketsColor":{
                     "b":147,
                     "r":195,
                     "bc":0.9976626673713327,
                     "g":160
                  },
                  "bristleColor":{
                     "b":171,
                     "r":214,
                     "bc":1,
                     "g":178
                  },
                  "name":Texts.fetch(498),
                  "gender":2,
                  "physical":3,
                  "agility":6,
                  "accuracy":6,
                  "intelligence":5,
                  "idealWeight":63.5943272896111,
                  "_HP":100,
                  "sleevesType":0,
                  "hasRightBracelet":true,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "b":0,
                     "r":5,
                     "bc":1,
                     "g":1
                  },
                  "age":30,
                  "portraitShoulders":1,
                  "portraitHead":1,
                  "portraitNose":12,
                  "portraitMouth":8,
                  "portraitEyes":1,
                  "portraitHair":2,
                  "portraitWrinkles":0,
                  "portraitBeard":0,
                  "portraitEyebrows":7,
                  "portraitEars":2,
                  "portraitEyeSockets":0,
                  "portraitWhiskers":0,
                  "portraitMoustache":0,
                  "portraitShirt":0,
                  "portraitNecklace":0
               }));
               if(param2)
               {
                  _loc11_.push(new Character({
                     "specialPortrait":9,
                     "skinColor":{
                        "b":204,
                        "r":255,
                        "bc":1,
                        "g":212
                     },
                     "hairColor":{
                        "b":73,
                        "r":117,
                        "bc":1,
                        "g":84
                     },
                     "shirtColor":{
                        "b":186,
                        "r":167,
                        "bc":0.9937418113462627,
                        "g":179
                     },
                     "pantsColor":{
                        "b":118,
                        "r":132,
                        "bc":1.4337362358346581,
                        "g":124
                     },
                     "shoesColor":{
                        "b":38,
                        "r":58,
                        "bc":1,
                        "g":45
                     },
                     "lipsColor":{
                        "b":122,
                        "r":172,
                        "bc":0.9677485978230834,
                        "g":134
                     },
                     "beardColor":{
                        "b":9,
                        "r":36,
                        "bc":0.8394523177295924,
                        "g":16
                     },
                     "eyebrowsColor":{
                        "b":51,
                        "r":98,
                        "bc":1,
                        "g":51
                     },
                     "eyesColor":{
                        "b":6,
                        "r":18,
                        "bc":0.9755609817802906,
                        "g":9
                     },
                     "eyeSocketsColor":{
                        "b":153,
                        "r":216,
                        "bc":1,
                        "g":153
                     },
                     "bristleColor":{
                        "b":127,
                        "r":127,
                        "bc":1,
                        "g":127
                     },
                     "name":Texts.fetch(497),
                     "gender":1,
                     "physical":4,
                     "agility":5,
                     "accuracy":6,
                     "intelligence":5,
                     "idealWeight":64.06977964937687,
                     "_HP":80,
                     "sleevesType":1,
                     "hasRightBracelet":false,
                     "hasLeftBracelet":true,
                     "braceletColor":{
                        "b":0,
                        "r":0,
                        "bc":1,
                        "g":0
                     },
                     "age":30,
                     "portraitShoulders":1,
                     "portraitHead":3,
                     "portraitNose":7,
                     "portraitMouth":6,
                     "portraitEyes":8,
                     "portraitHair":6,
                     "portraitWrinkles":0,
                     "portraitBeard":0,
                     "portraitEyebrows":10,
                     "portraitEars":3,
                     "portraitEyeSockets":1,
                     "portraitWhiskers":0,
                     "portraitMoustache":0,
                     "portraitShirt":2,
                     "portraitNecklace":0
                  }));
               }
               for(_loc24_ in _loc11_)
               {
                  _loc11_[_loc24_].category = 10;
                  _loc11_[_loc24_].sleevesType = 5;
                  _loc11_[_loc24_].shirtColor = {
                     "r":250,
                     "g":240,
                     "b":200,
                     "bc":1
                  };
                  _loc11_[_loc24_].pantsColor = {
                     "r":250,
                     "g":240,
                     "b":200,
                     "bc":1
                  };
                  _loc11_[_loc24_].portraitShirt = 1;
                  _loc11_[_loc24_].oldFaction = 0;
                  if(param2 && _loc24_ == _loc11_.length - 1)
                  {
                     _loc11_[_loc24_].specialPurpose = 15;
                  }
                  else
                  {
                     _loc11_[_loc24_].specialPurpose = 14;
                  }
                  Caravans[0].addPerson(_loc11_[_loc24_]);
               }
               break;
            case 87:
               Story.madeQubbaInactive = true;
               Story.federationAttackStarted = true;
               Story.federationCapturedQubba = true;
               eliminateAllRandomGroups(38);
               Towns[5].active = false;
               mapMode.openDialogue(32);
               executeMajorEvent(82,true);
               break;
            case 88:
               Story.tookYourPeopleToBunker = true;
               Story.takingYourMenToBunker = false;
               _loc5_ = 0;
               _loc24_ = 0;
               while(_loc24_ < Caravans[0].People.length)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 14 || Caravans[0].People[_loc24_].specialPurpose == 15)
                  {
                     Towns[15].population++;
                     _loc5_++;
                     if(Caravans[0].People[_loc24_].specialPurpose == 15)
                     {
                        Towns[15].locations[3].visible = true;
                        Story.dialogueDefaults[1] = 2023;
                     }
                     Caravans[0].removePerson(_loc24_);
                     _loc24_--;
                  }
                  _loc24_++;
               }
               if(_loc5_ > 0)
               {
                  Towns[15].industries.push(new Industry(9,21,Towns[15]));
                  completeQuest(38);
               }
               else
               {
                  failQuest(38);
               }
               if(_loc5_ >= 2)
               {
                  Towns[15].industries.push(new Industry(24,Math.round(_loc5_ / 2),Towns[15]));
               }
               for(_loc24_ in Towns[15].industries)
               {
                  Towns[15].industries[_loc24_].forSale = false;
               }
               Story.bunkerExtinctionPhase = 1;
               break;
            case 89:
               Story.tookYourPeopleToQubba = true;
               Story.takingYourMenToQubba = false;
               _loc24_ = 0;
               while(_loc24_ < Caravans[0].People.length)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 14)
                  {
                     Towns[5].population++;
                     Caravans[0].removePerson(_loc24_);
                     _loc24_--;
                  }
                  _loc24_++;
               }
               break;
            case 90:
               _loc17_ = Texts.fetch(6678,Caravans[0].People[0].gender) + " ";
               if(Caravans[0].People[0].intelligence < 4)
               {
                  _loc17_ += Texts.fetch(6679,Caravans[0].People[0].gender);
               }
               else if(Story.specificReputations[2] < 5)
               {
                  _loc17_ += Texts.fetch(6680,Caravans[0].People[0].gender);
               }
               else if(!(Story.specificReputations[1] > 1 || getFactionRelations(0,18) > 600))
               {
                  _loc17_ += Texts.fetch(6681,Caravans[0].People[0].gender);
               }
               else if(Caravans[0].People[0].intelligence < 6 || getFactionRelations(0,18) < 500)
               {
                  _loc17_ += Texts.fetch(6682,Caravans[0].People[0].gender);
               }
               else
               {
                  _loc17_ += Texts.fetch(6683,Caravans[0].People[0].gender);
               }
               setMode(6,_loc17_);
               break;
            case 91:
               _loc12_ = [];
               for(_loc24_ in Item.Goods[102].towns)
               {
                  if(Item.Goods[102].towns[_loc24_] != 5)
                  {
                     _loc12_.push(Item.Goods[102].towns[_loc24_]);
                  }
               }
               for(_loc24_ in Item.Goods[103].towns)
               {
                  if(param2 != 6 || Item.Goods[102].towns[_loc24_] != 5)
                  {
                     _loc12_.push(Item.Goods[103].towns[_loc24_]);
                  }
               }
               Story.qgMissionStage = 1;
               Story.qgMissionStartTime = Time;
               Story.qgMissionCompleted = false;
               Story.qgMissionFailed = false;
               switch(param2)
               {
                  case 1:
                     Story.qgMissionTown1 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     do
                     {
                        Story.qgMissionTown2 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     }
                     while(Story.qgMissionTown2 == Story.qgMissionTown1);
                     Story.qgMissionAmount = MathFunctions.random(5,10);
                     acceptQuest(40);
                     break;
                  case 2:
                     Story.qgMissionTown1 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     Caravans[0].addPerson(new Character({
                        "category":10,
                        "doctorExperience":100000
                     }));
                     Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 17;
                     acceptQuest(41);
                     break;
                  case 3:
                     Story.qgMissionTown1 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     _loc28_ = Caravans.push(new Caravan(31,mapMode.mapSymbols)) - 1;
                     Caravans[_loc28_].x = Presets.Towns[Story.qgMissionTown1].x;
                     Caravans[_loc28_].y = Presets.Towns[Story.qgMissionTown1].y;
                     equipRandomCaravan(Caravans[_loc28_]);
                     Caravans[_loc28_].category = 4;
                     Caravans[_loc28_].specialPurpose = 19;
                     Caravans[_loc28_].guardPosition = {
                        "x":Presets.Towns[Story.qgMissionTown1].x,
                        "y":Presets.Towns[Story.qgMissionTown1].y + 250
                     };
                     Caravans[_loc28_].looseGuard = true;
                     Caravans[_loc28_].staticMode = true;
                     Caravans[_loc28_].update();
                     acceptQuest(42);
                     break;
                  case 4:
                     Story.qgMissionTown1 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     do
                     {
                        Story.qgMissionTown2 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     }
                     while(Story.qgMissionTown2 == Story.qgMissionTown1);
                     Story.qgMissionAmount = MathFunctions.random(15,25);
                     _loc28_ = Caravans.push(new Caravan(29,mapMode.mapSymbols)) - 1;
                     _loc18_ = MathFunctions.CalcAngle(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[Story.qgMissionTown2].x,Towns[Story.qgMissionTown2].y);
                     _loc20_ = MathFunctions.CalcDistance(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[Story.qgMissionTown2].x,Towns[Story.qgMissionTown2].y);
                     _loc7_ = _loc20_ * Math.random();
                     if(_loc7_ < 30)
                     {
                        _loc7_ = 30;
                     }
                     if(_loc7_ > _loc20_ - 30)
                     {
                        _loc7_ = _loc20_ - 30;
                     }
                     Caravans[_loc28_].x = Presets.Towns[Story.qgMissionTown1].x + Math.sin(_loc18_) * _loc7_;
                     Caravans[_loc28_].y = Presets.Towns[Story.qgMissionTown1].y + Math.cos(_loc18_) * _loc7_;
                     Caravans[_loc28_].name = Texts.fetch(6662);
                     equipRandomCaravan(Caravans[_loc28_],Story.qgMissionAmount);
                     Caravans[_loc28_].category = 4;
                     Caravans[_loc28_].specialPurpose = 20;
                     Caravans[_loc28_].moving = false;
                     for(_loc24_ in Caravans[_loc28_].People)
                     {
                        Caravans[_loc28_].People[_loc24_].health = Caravans[_loc28_].People[_loc24_].maxHealth * (0.1 + Math.random() * 0.8);
                     }
                     Caravans[_loc28_].staticMode = true;
                     Caravans[_loc28_].update();
                     acceptQuest(43);
                     break;
                  case 5:
                     Story.qgMissionAmount = MathFunctions.random(1000,4000);
                     Caravans[0].addCargo(63,Story.qgMissionAmount);
                     Story.qgMissionTown1 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     acceptQuest(44);
                     break;
                  case 6:
                     Story.qgMissionAmount = MathFunctions.random(60,100);
                     Caravans[0].addCargo(197,Story.qgMissionAmount);
                     Story.qgMissionTown1 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     Story.qgMissionCashReward = 1000 + Story.qgMissionAmount * MathFunctions.CalcDistance(Towns[5].x,Towns[5].y,Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y * 0.002);
                     acceptQuest(45);
                     break;
                  case 7:
                     Story.qgMissionTown1 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     acceptQuest(46);
                     break;
                  case 8:
                     Story.qgMissionTown1 = _loc12_[MathFunctions.random(0,_loc12_.length - 1)];
                     _loc28_ = Caravans.push(new Caravan(31,mapMode.mapSymbols)) - 1;
                     _loc18_ = Math.random() * MathFunctions.dblPI;
                     _loc7_ = 200 + Math.random() * 100;
                     Caravans[_loc28_].x = Presets.Towns[Story.qgMissionTown1].x + Math.sin(_loc18_) * _loc7_;
                     Caravans[_loc28_].y = Presets.Towns[Story.qgMissionTown1].y + Math.cos(_loc18_) * _loc7_;
                     equipRandomCaravan(Caravans[_loc28_]);
                     Caravans[_loc28_].name = Texts.fetch(6675);
                     Caravans[_loc28_].category = 4;
                     Caravans[_loc28_].specialPurpose = 22;
                     Caravans[_loc28_].moving = false;
                     Caravans[_loc28_].aggressive = false;
                     Caravans[_loc28_].staticMode = true;
                     Caravans[_loc28_].update();
                     acceptQuest(47);
               }
               break;
            case 92:
               mapMode.openDialogue(33);
               Story.qgMissionStage = 2;
               _loc24_ = 1;
               while(_loc24_ <= Story.qgMissionAmount)
               {
                  Caravans[0].addPerson(new Character({"category":10}));
                  Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 16;
                  _loc24_++;
               }
               Towns[Story.qgMissionTown1].population -= Story.qgMissionAmount;
               break;
            case 93:
               Story.qgMissionStage = 3;
               _loc5_ = 0;
               _loc24_ = 1;
               while(_loc24_ < Caravans[0].People.length)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 16)
                  {
                     Caravans[0].removePerson(_loc24_);
                     _loc24_--;
                     _loc5_++;
                  }
                  _loc24_++;
               }
               if(_loc5_ > 0)
               {
                  mapMode.openDialogue(34,_loc5_);
                  Story.qgMissionCompleted = true;
                  Story.qgMissionSuccessRate = _loc5_ / Story.qgMissionAmount;
                  Towns[Story.qgMissionTown2].population += _loc5_;
               }
               else
               {
                  Story.qgMissionFailed = true;
                  mapMode.enterTown(Caravans[0].overTown);
               }
               break;
            case 94:
               switch(Story.qgMissionInProgress)
               {
                  case 1:
                     completeQuest(40);
                     affectFactionRelations(Math.round(20 * Story.qgMissionSuccessRate),18);
                     Story.qgMissionCashReward = 10000 + Math.round(20000 * Story.qgMissionSuccessRate);
                     break;
                  case 2:
                     completeQuest(41);
                     affectFactionRelations(Math.round(30 * Story.qgMissionSuccessRate),18);
                     Story.qgMissionCashReward = 10000 + Math.round(MathFunctions.CalcDistance(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[5].x,Towns[5].y) * 0.5 * Story.qgMissionSuccessRate);
                     break;
                  case 3:
                     completeQuest(42);
                     affectFactionRelations(Math.round(40 * Story.qgMissionSuccessRate),18);
                     Story.qgMissionCashReward = 20000 + Math.round(30000 * Story.qgMissionSuccessRate);
                     affectSpecificReputation(6,5);
                     break;
                  case 4:
                     completeQuest(43);
                     affectFactionRelations(Math.round(80 * Story.qgMissionSuccessRate),18);
                     Story.qgMissionCashReward = 20000 + Math.round(80000 * Story.qgMissionSuccessRate);
                     affectSpecificReputation(5,10);
                     affectSpecificReputation(2,5);
                     break;
                  case 5:
                     completeQuest(44);
                     affectFactionRelations(Math.round(30 * Story.qgMissionSuccessRate),18);
                     Story.qgMissionCashReward = 5000 + Math.round(10000 * Story.qgMissionSuccessRate);
                     affectSpecificReputation(5,2);
                     break;
                  case 6:
                     completeQuest(45);
                     affectFactionRelations(10,18);
                     break;
                  case 7:
                     completeQuest(46);
                     affectFactionRelations(30,18);
                     Story.qgMissionCashReward = 40000 + Math.round(MathFunctions.CalcDistance(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[5].x,Towns[5].y));
                     affectSpecificReputation(6,5);
                     affectSpecificReputation(8,-1);
                     break;
                  case 8:
                     completeQuest(47);
                     affectFactionRelations(40,18);
                     Story.qgMissionCashReward = 50000 + Math.round(MathFunctions.CalcDistance(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[5].x,Towns[5].y));
                     affectSpecificReputation(5,10);
                     affectSpecificReputation(6,10);
               }
               Caravans[0].money += Story.qgMissionCashReward;
               Story.qgMissionInProgress = 0;
               break;
            case 95:
               switch(Story.qgMissionInProgress)
               {
                  case 1:
                     failQuest(40);
                     affectFactionRelations(-30,18);
                     affectSpecificReputation(2,-1);
                     affectSpecificReputation(6,-10);
                     break;
                  case 2:
                     failQuest(41);
                     affectFactionRelations(-20,18);
                     affectSpecificReputation(2,-1);
                     affectSpecificReputation(6,-5);
                     break;
                  case 4:
                     failQuest(43);
                     affectFactionRelations(-5,18);
                     affectSpecificReputation(6,-1);
                     break;
                  case 7:
                     failQuest(46);
                     affectFactionRelations(-5,18);
                     affectSpecificReputation(6,-1);
               }
               Story.qgMissionInProgress = 0;
               break;
            case 96:
               _loc13_ = false;
               Story.qgMissionStage = 2;
               for(_loc24_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 17)
                  {
                     Caravans[0].removePerson(_loc24_);
                     _loc13_ = true;
                     break;
                  }
               }
               if(_loc13_)
               {
                  Towns[Story.qgMissionTown1].population++;
                  mapMode.openDialogue(35);
                  Story.qgMissionCompleted = true;
                  Story.qgMissionSuccessRate = MathFunctions.CalcDistance(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[5].x,Towns[5].y) * 50 / (Time - Story.qgMissionStartTime);
               }
               else
               {
                  Story.qgMissionFailed = true;
                  mapMode.enterTown(Caravans[0].overTown);
               }
               break;
            case 97:
               Story.qgMissionCompleted = true;
               Story.qgMissionSuccessRate = (MathFunctions.CalcDistance(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[5].x,Towns[5].y) * 50 + 86400) / (Time - Story.qgMissionStartTime);
               break;
            case 98:
               Story.qgMissionStage = 2;
               for(_loc24_ in param2.People)
               {
                  param2.removeEquipment(param2.People[_loc24_]);
                  param2.People[_loc24_].category = 10;
                  param2.People[_loc24_].specialPurpose = 18;
                  Caravans[0].addPerson(param2.People[_loc24_]);
               }
               mapMode.openDialogue(36);
               param2.specialPurpose = null;
               param2.active = false;
               break;
            case 99:
               Story.qgMissionStage = 3;
               _loc5_ = 0;
               _loc24_ = 1;
               while(_loc24_ < Caravans[0].People.length)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 18)
                  {
                     Caravans[0].removePerson(_loc24_);
                     _loc24_--;
                     _loc5_++;
                  }
                  _loc24_++;
               }
               if(_loc5_ > 0)
               {
                  Towns[Caravans[0].overTown].population += _loc5_;
                  Story.qgMissionSuccessRate = _loc5_ / Story.qgMissionAmount;
                  Story.qgMissionCompleted = true;
               }
               else
               {
                  Story.qgMissionFailed = true;
               }
               break;
            case 100:
               Story.qgMissionFailed = true;
               Story.qgMissionStage = 3;
               mapMode.openDialogue(37);
               break;
            case 101:
               _loc9_ = Caravans[0].findCargo(63);
               if(_loc9_ is Item)
               {
                  if(_loc9_.amount >= Story.qgMissionAmount)
                  {
                     Story.qgMissionStage = 2;
                     Story.qgMissionCompleted = true;
                     Story.qgMissionSuccessRate = MathFunctions.CalcDistance(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[5].x,Towns[5].y) * 50 / (Time - Story.qgMissionStartTime);
                     mapMode.openDialogue(38,Story.qgMissionAmount);
                     Caravans[0].reduceCargo(63,Story.qgMissionAmount);
                  }
                  else
                  {
                     mapMode.openDialogue(39,_loc9_.amount);
                     Story.qgMissionAmount -= _loc9_.amount;
                     Caravans[0].reduceCargo(63,_loc9_.amount);
                  }
               }
               else
               {
                  mapMode.enterTown(Caravans[0].overTown);
               }
               break;
            case 102:
               _loc22_ = Caravans[0].findCargo(197);
               if(_loc22_ is Item)
               {
                  if(_loc22_.amount >= Story.qgMissionAmount)
                  {
                     Story.qgMissionStage = 2;
                     Story.qgMissionCompleted = true;
                     mapMode.openDialogue(40,Story.qgMissionAmount);
                     Caravans[0].reduceCargo(197,Story.qgMissionAmount);
                  }
                  else
                  {
                     mapMode.openDialogue(41,_loc22_.amount);
                     Story.qgMissionAmount -= _loc22_.amount;
                     Caravans[0].reduceCargo(197,_loc22_.amount);
                  }
               }
               else
               {
                  mapMode.enterTown(Caravans[0].overTown);
               }
               break;
            case 103:
               Story.qgMissionStage = 2;
               Caravans[0].addPerson(new Character({
                  "category":10,
                  "gender":1
               }));
               Caravans[0].People[Caravans[0].People.length - 1].specialPurpose = 19;
               _loc28_ = Caravans.push(new Caravan(32,mapMode.mapSymbols)) - 1;
               _loc18_ = MathFunctions.CalcAngle(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[5].x,Towns[5].y);
               _loc20_ = MathFunctions.CalcDistance(Towns[Story.qgMissionTown1].x,Towns[Story.qgMissionTown1].y,Towns[5].x,Towns[5].y);
               _loc7_ = _loc20_ * Math.random();
               if(_loc7_ < 300)
               {
                  _loc7_ = 300;
               }
               if(_loc7_ > _loc20_ - 30)
               {
                  _loc7_ = _loc20_ - 30;
               }
               Caravans[_loc28_].x = Presets.Towns[Story.qgMissionTown1].x + Math.sin(_loc18_) * _loc7_;
               Caravans[_loc28_].y = Presets.Towns[Story.qgMissionTown1].y + Math.cos(_loc18_) * _loc7_;
               equipRandomCaravan(Caravans[_loc28_]);
               Caravans[_loc28_].category = 4;
               Caravans[_loc28_].specialPurpose = 21;
               Caravans[_loc28_].fearless = true;
               Caravans[_loc28_].staticMode = true;
               Caravans[_loc28_].update();
               mapMode.openDialogue(43);
               break;
            case 104:
               _loc13_ = false;
               for(_loc24_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 19)
                  {
                     Caravans[0].removePerson(_loc24_);
                     _loc13_ = true;
                     break;
                  }
               }
               if(_loc13_)
               {
                  Towns[5].population++;
                  mapMode.openDialogue(42);
                  Story.qgMissionCompleted = true;
                  for(_loc24_ in Caravans)
                  {
                     if(Caravans[_loc24_].specialPurpose == 21)
                     {
                        Caravans[_loc24_].category = 3;
                        directCaravanToNearestTown(Caravans[_loc24_]);
                        break;
                     }
                  }
               }
               else
               {
                  Story.qgMissionFailed = true;
                  mapMode.enterTown(Caravans[0].overTown);
               }
               break;
            case 105:
               Story.qgMissionStage = 2;
               param2.addPerson(new Character({"category":3}));
               param2.People[param2.People.length - 1].specialPurpose = 20;
               param2.specialPurpose = null;
               break;
            case 106:
               Story.qgMissionStage = 3;
               _loc13_ = false;
               for(_loc24_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc24_].specialPurpose == 20)
                  {
                     Caravans[0].removePerson(_loc24_);
                     _loc13_ = true;
                     break;
                  }
               }
               if(_loc13_)
               {
                  Towns[Caravans[0].overTown].population++;
                  mapMode.openDialogue(44);
                  Story.qgMissionCompleted = true;
               }
               else
               {
                  Story.qgMissionFailed = true;
                  mapMode.enterTown(Caravans[0].overTown);
               }
               break;
            case 107:
               Caravans[0].addTransport(new TransportUnit(13));
               Caravans[0].addCargo(169,3);
               Caravans[0].addCargo(64,974);
               Caravans[0].addCargo(208,1);
               Caravans[0].addCargo(206,1);
               acceptQuest(48);
               Towns[5].locations[8].visible = true;
               break;
            case 108:
               Story.bombSet = true;
               Story.bombSetAt = Time;
               Caravans[0].reduceCargo(208,1);
               break;
            case 109:
               Story.bombExploded = true;
               mapMode.openDialogue(47);
               completeQuest(48);
               Story.dialogueDefaults[31] = 2082;
               executeMajorEvent(82,true);
               affectFactionRelations(-300,17,18);
               affectFactionRelations(300,17);
               Towns[5].active = false;
               for(_loc24_ in Caravans)
               {
                  if(Caravans[_loc24_].active && Caravans[_loc24_].category == 5)
                  {
                     for(_loc25_ in Presets.caravanRoutes[Caravans[_loc24_].route].points)
                     {
                        if(Presets.caravanRoutes[Caravans[_loc24_].route].points[_loc25_].town == 5)
                        {
                           Caravans[_loc24_].category = 3;
                           directCaravanToNearestTown(_loc24_);
                           break;
                        }
                     }
                  }
               }
         }
      }
      
      private function createMikazeOilMainCharacters() : *
      {
         var _loc1_:* = [];
         _loc1_.push(new Character({
            "name":Texts.fetch(4804),
            "specialPortrait":7,
            "gender":2,
            "age":26,
            "physical":6,
            "agility":8,
            "accuracy":7,
            "intelligence":7,
            "mechanicExperience":10000,
            "portraitShoulders":1,
            "portraitHair":15,
            "portraitHead":3,
            "portraitMouth":4,
            "portraitNose":3,
            "portraitEyebrows":3,
            "portraitEyes":3,
            "portraitEars":2,
            "portraitBeard":0,
            "portraitMoustache":0,
            "portraitWhiskers":0,
            "portraitShirt":1,
            "portraitNecklace":0,
            "sleevesType":5,
            "skinColor":{
               "r":142,
               "g":87,
               "b":70,
               "bc":1
            },
            "hairColor":{
               "r":25,
               "g":26,
               "b":25,
               "bc":1
            },
            "eyesColor":{
               "r":20,
               "g":15,
               "b":0,
               "bc":1
            },
            "eyebrowsColor":{
               "r":25,
               "g":26,
               "b":25,
               "bc":1
            },
            "lipsColor":{
               "r":155,
               "g":84,
               "b":89,
               "bc":1
            },
            "shirtColor":{
               "r":191,
               "g":104,
               "b":49,
               "bc":1
            },
            "pantsColor":{
               "r":191,
               "g":104,
               "b":49,
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
         _loc1_[_loc1_.length - 1].specialPurpose = 11;
         _loc1_.push(new Character({
            "name":Texts.fetch(4857),
            "gender":1,
            "age":46,
            "physical":4,
            "agility":4,
            "accuracy":3,
            "intelligence":8,
            "portraitShoulders":1,
            "portraitHair":8,
            "portraitHead":3,
            "portraitMouth":2,
            "portraitNose":8,
            "portraitEyebrows":3,
            "portraitEyes":4,
            "portraitEars":2,
            "portraitBeard":6,
            "portraitMoustache":7,
            "portraitWhiskers":0,
            "portraitShirt":1,
            "portraitNecklace":0,
            "sleevesType":5,
            "skinColor":{
               "r":206,
               "g":160,
               "b":150,
               "bc":1
            },
            "hairColor":{
               "r":135,
               "g":95,
               "b":61,
               "bc":1
            },
            "beardColor":{
               "r":135,
               "g":95,
               "b":61,
               "bc":1
            },
            "eyesColor":{
               "r":20,
               "g":15,
               "b":0,
               "bc":1
            },
            "eyebrowsColor":{
               "r":135,
               "g":95,
               "b":61,
               "bc":1
            },
            "lipsColor":{
               "r":206,
               "g":131,
               "b":141,
               "bc":1
            },
            "shirtColor":{
               "r":150,
               "g":150,
               "b":150,
               "bc":1
            },
            "pantsColor":{
               "r":40,
               "g":30,
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
         _loc1_.push(new Character({
            "name":Texts.fetch(4858),
            "gender":1,
            "age":52,
            "physical":3,
            "agility":5,
            "accuracy":6,
            "intelligence":9,
            "portraitShoulders":1,
            "portraitHair":8,
            "portraitHead":5,
            "portraitMouth":3,
            "portraitNose":1,
            "portraitEyebrows":8,
            "portraitEyes":2,
            "portraitEars":1,
            "portraitBeard":0,
            "portraitMoustache":0,
            "portraitWhiskers":1,
            "portraitShirt":2,
            "portraitNecklace":0,
            "sleevesType":5,
            "skinColor":{
               "r":212,
               "g":182,
               "b":173,
               "bc":1
            },
            "hairColor":{
               "r":180,
               "g":180,
               "b":180,
               "bc":1
            },
            "beardColor":{
               "r":135,
               "g":95,
               "b":61,
               "bc":1
            },
            "eyesColor":{
               "r":20,
               "g":15,
               "b":0,
               "bc":1
            },
            "eyebrowsColor":{
               "r":180,
               "g":180,
               "b":180,
               "bc":1
            },
            "lipsColor":{
               "r":206,
               "g":131,
               "b":141,
               "bc":1
            },
            "shirtColor":{
               "r":190,
               "g":190,
               "b":190,
               "bc":1
            },
            "pantsColor":{
               "r":40,
               "g":30,
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
         _loc1_.push(new Character({
            "name":Texts.fetch(4859),
            "gender":1,
            "age":57,
            "physical":2,
            "agility":4,
            "accuracy":2,
            "intelligence":8,
            "portraitShoulders":1,
            "portraitHair":29,
            "portraitHead":7,
            "portraitMouth":4,
            "portraitNose":4,
            "portraitEyebrows":1,
            "portraitEyes":9,
            "portraitEars":1,
            "portraitBeard":0,
            "portraitMoustache":9,
            "portraitWhiskers":0,
            "portraitShirt":3,
            "portraitNecklace":0,
            "sleevesType":5,
            "skinColor":{
               "r":198,
               "g":172,
               "b":153,
               "bc":1
            },
            "hairColor":{
               "r":220,
               "g":220,
               "b":220,
               "bc":1
            },
            "beardColor":{
               "r":220,
               "g":220,
               "b":220,
               "bc":1
            },
            "eyesColor":{
               "r":20,
               "g":15,
               "b":0,
               "bc":1
            },
            "eyebrowsColor":{
               "r":120,
               "g":110,
               "b":100,
               "bc":1
            },
            "lipsColor":{
               "r":206,
               "g":131,
               "b":141,
               "bc":1
            },
            "shirtColor":{
               "r":230,
               "g":230,
               "b":230,
               "bc":1
            },
            "pantsColor":{
               "r":40,
               "g":30,
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
         _loc1_.push(new Character({
            "name":Texts.fetch(4860),
            "gender":1,
            "age":36,
            "physical":5,
            "agility":7,
            "accuracy":4,
            "intelligence":6,
            "portraitShoulders":1,
            "portraitHair":22,
            "portraitHead":4,
            "portraitMouth":2,
            "portraitNose":7,
            "portraitEyebrows":10,
            "portraitEyes":7,
            "portraitEars":2,
            "portraitBeard":0,
            "portraitMoustache":0,
            "portraitWhiskers":0,
            "portraitShirt":4,
            "portraitNecklace":0,
            "sleevesType":5,
            "skinColor":{
               "r":187,
               "g":160,
               "b":142,
               "bc":1
            },
            "hairColor":{
               "r":10,
               "g":10,
               "b":10,
               "bc":1
            },
            "beardColor":{
               "r":10,
               "g":10,
               "b":10,
               "bc":1
            },
            "eyesColor":{
               "r":20,
               "g":15,
               "b":0,
               "bc":1
            },
            "eyebrowsColor":{
               "r":10,
               "g":10,
               "b":10,
               "bc":1
            },
            "lipsColor":{
               "r":138,
               "g":86,
               "b":90,
               "bc":1
            },
            "shirtColor":{
               "r":250,
               "g":210,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":40,
               "g":30,
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
         return _loc1_;
      }
      
      private function createNariziansSquad() : *
      {
         var _loc1_:* = new Caravan(3,mapMode.mapSymbols);
         _loc1_.x = Presets.Towns[25].x;
         _loc1_.y = Presets.Towns[25].y;
         _loc1_.addPerson(new Character({
            "specialPortrait":4,
            "name":Texts.fetch(3372),
            "gender":1,
            "age":52,
            "physical":5,
            "agility":4,
            "accuracy":4,
            "intelligence":7,
            "portraitShoulders":1,
            "portraitShirt":1,
            "sleevesType":5,
            "portraitMoustache":2,
            "portraitBeard":0,
            "portraitHair":18,
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
               "r":131,
               "g":121,
               "b":94,
               "bc":1
            },
            "pantsColor":{
               "r":131,
               "g":121,
               "b":94,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":25560
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3549),
            "gender":1,
            "age":42,
            "physical":7,
            "agility":6,
            "accuracy":4,
            "intelligence":4,
            "portraitShoulders":1,
            "portraitShirt":3,
            "sleevesType":1,
            "portraitHair":12,
            "portraitMoustache":0,
            "portraitBeard":0,
            "skinColor":{
               "r":180,
               "g":140,
               "b":120,
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
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":19320
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3550),
            "gender":1,
            "age":31,
            "physical":8,
            "agility":7,
            "accuracy":3,
            "intelligence":3,
            "portraitShoulders":1,
            "portraitShirt":1,
            "sleevesType":0,
            "portraitHair":3,
            "portraitMoustache":3,
            "portraitBeard":0,
            "skinColor":{
               "r":200,
               "g":160,
               "b":140,
               "bc":1
            },
            "hairColor":{
               "r":60,
               "g":50,
               "b":40,
               "bc":1
            },
            "eyesColor":{
               "r":20,
               "g":15,
               "b":0,
               "bc":1
            },
            "eyebrowsColor":{
               "r":50,
               "g":40,
               "b":30,
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
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":12450
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3551),
            "gender":1,
            "age":25,
            "physical":7,
            "agility":8,
            "accuracy":5,
            "intelligence":5,
            "portraitShoulders":1,
            "portraitShirt":2,
            "sleevesType":3,
            "portraitHair":7,
            "portraitMoustache":5,
            "portraitBeard":0,
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
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":15340
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3552),
            "gender":1,
            "age":28,
            "physical":6,
            "agility":7,
            "accuracy":6,
            "intelligence":6,
            "portraitShoulders":1,
            "portraitShirt":3,
            "sleevesType":2,
            "portraitHair":2,
            "portraitMoustache":0,
            "portraitBeard":0,
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
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":10500
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3553),
            "gender":1,
            "age":41,
            "physical":4,
            "agility":6,
            "accuracy":3,
            "intelligence":4,
            "portraitShoulders":1,
            "portraitShirt":2,
            "sleevesType":4,
            "portraitHair":0,
            "portraitMoustache":0,
            "portraitBeard":0,
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
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":17320
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3554),
            "gender":1,
            "age":38,
            "physical":8,
            "agility":5,
            "accuracy":5,
            "intelligence":5,
            "portraitShoulders":1,
            "portraitShirt":1,
            "sleevesType":5,
            "portraitHair":13,
            "portraitMoustache":7,
            "portraitBeard":0,
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
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":12560
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3555),
            "gender":1,
            "age":32,
            "physical":3,
            "agility":4,
            "accuracy":7,
            "intelligence":3,
            "portraitShoulders":1,
            "portraitShirt":3,
            "sleevesType":2,
            "portraitHair":20,
            "portraitMoustache":12,
            "portraitBeard":0,
            "skinColor":{
               "r":200,
               "g":180,
               "b":150,
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
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":14220
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3556),
            "gender":1,
            "age":33,
            "physical":5,
            "agility":6,
            "accuracy":8,
            "intelligence":5,
            "portraitShoulders":1,
            "portraitShirt":2,
            "sleevesType":1,
            "portraitHair":15,
            "portraitMoustache":6,
            "portraitBeard":0,
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
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":9650
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3557),
            "gender":1,
            "age":26,
            "physical":4,
            "agility":8,
            "accuracy":3,
            "intelligence":2,
            "portraitShoulders":1,
            "portraitShirt":3,
            "sleevesType":5,
            "portraitHair":8,
            "portraitMoustache":4,
            "portraitBeard":0,
            "skinColor":{
               "r":160,
               "g":120,
               "b":100,
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
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":13400
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3558),
            "gender":1,
            "age":19,
            "physical":7,
            "agility":3,
            "accuracy":2,
            "intelligence":1,
            "portraitShoulders":1,
            "portraitShirt":1,
            "sleevesType":4,
            "portraitHair":3,
            "portraitMoustache":1,
            "portraitBeard":0,
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
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":17500
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3559),
            "gender":1,
            "age":40,
            "physical":6,
            "agility":6,
            "accuracy":7,
            "intelligence":6,
            "portraitShoulders":1,
            "portraitShirt":2,
            "sleevesType":4,
            "portraitHair":1,
            "portraitMoustache":0,
            "portraitBeard":0,
            "skinColor":{
               "r":180,
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
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":9900
         }));
         _loc1_.addPerson(new Character({
            "name":Texts.fetch(3560),
            "gender":1,
            "age":31,
            "physical":4,
            "agility":9,
            "accuracy":6,
            "intelligence":5,
            "portraitShoulders":1,
            "portraitShirt":1,
            "sleevesType":1,
            "portraitHair":9,
            "portraitMoustache":2,
            "portraitBeard":0,
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
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "pantsColor":{
               "r":200,
               "g":200,
               "b":200,
               "bc":1
            },
            "shoesColor":{
               "r":20,
               "g":10,
               "b":0,
               "bc":1
            },
            "hasRightBracelet":false,
            "hasLeftBracelet":false,
            "unarmedExperience":11340
         }));
         _loc1_.distributeWeapons();
         _loc1_.distributeAmmo();
         _loc1_.name = Texts.fetch(3548);
         _loc1_.addCargo(65,10);
         _loc1_.addCargo(80,30);
         _loc1_.addCargo(1,210);
         _loc1_.addCargo(83,_loc1_.maxCargo - _loc1_.totalCargo);
         _loc1_.fearless = true;
         _loc1_.category = 4;
         _loc1_.specialPurpose = 6;
         Caravans.push(_loc1_);
         _loc1_.staticMode = true;
         _loc1_.update();
         return _loc1_;
      }
      
      public function acceptQuest(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         switch(param1)
         {
            case 1:
               Story.mainMissionAccepted = true;
               Caravans[0].addCargo(21,1);
               Caravans[0].addCargo(29,30);
               if(difficulty == 1)
               {
                  Caravans[0].money += 600;
               }
               else
               {
                  Caravans[0].money += 200;
               }
               Towns[16].discovered = true;
               Caravans[0].distributeWeapons();
               Caravans[0].distributeAmmo();
               break;
            case 2:
               Story.acceptedEmiliasQuest = true;
               break;
            case 3:
               _loc3_ = Caravans[0].addPerson(new Character({
                  "name":Texts.fetch(1978),
                  "category":5,
                  "gender":1,
                  "age":28,
                  "physical":4,
                  "agility":4,
                  "accuracy":7,
                  "intelligence":5,
                  "portraitShoulders":1,
                  "portraitHair":18,
                  "portraitHead":4,
                  "portraitMouth":5,
                  "portraitNose":6,
                  "portraitEyebrows":5,
                  "portraitEyes":4,
                  "portraitEars":1,
                  "portraitBeard":7,
                  "portraitMoustache":2,
                  "portraitWhiskers":1,
                  "portraitShirt":2,
                  "portraitNecklace":0,
                  "sleevesType":1,
                  "skinColor":{
                     "r":180,
                     "g":140,
                     "b":120,
                     "bc":1
                  },
                  "hairColor":{
                     "r":40,
                     "g":35,
                     "b":30,
                     "bc":1
                  },
                  "eyesColor":{
                     "r":20,
                     "g":55,
                     "b":70,
                     "bc":1
                  },
                  "eyebrowsColor":{
                     "r":20,
                     "g":15,
                     "b":0,
                     "bc":1
                  },
                  "lipsColor":{
                     "r":100,
                     "g":45,
                     "b":40,
                     "bc":1
                  },
                  "shirtColor":{
                     "r":150,
                     "g":100,
                     "b":100,
                     "bc":1
                  },
                  "pantsColor":{
                     "r":20,
                     "g":20,
                     "b":20,
                     "bc":1
                  },
                  "shoesColor":{
                     "r":0,
                     "g":0,
                     "b":0,
                     "bc":1
                  },
                  "hasRightBracelet":false,
                  "hasLeftBracelet":true,
                  "braceletColor":{
                     "r":20,
                     "g":100,
                     "b":30,
                     "bc":1
                  },
                  "beardColor":{
                     "r":150,
                     "g":145,
                     "b":135,
                     "bc":1
                  }
               }));
               Story.accompanyedByThum = true;
               Story.kukulSendsYouToDrekar = true;
               Caravans[0].addCargo(20,1,true);
               Caravans[0].People[_loc3_].addItemToEquipment(new Item(20,1));
               Caravans[0].People[_loc3_].weapons[0] = 19;
               Caravans[0].People[_loc3_].specialPurpose = 1;
               Towns[17].population--;
               Towns[17].unemployed--;
               Story.thumJoinTime = Time;
               break;
            case 4:
               Story.agreedToMeetLois = true;
               Story.meetLoisTime = Time + 43200;
               break;
            case 5:
               Story.KukulsPriceForContact = Math.max(10 - Story.characterRelations[7],2) * 5;
               Story.askedKukulToTalkWithDrekar = true;
               break;
            case 6:
               Story.gotInfoAboutBookFromKukul = true;
               break;
            case 7:
               break;
            case 8:
               affectFactionRelations(10,0,3);
               break;
            case 9:
               affectFactionRelations(20,0,3);
               break;
            case 10:
               if(getFactionRelations(2,0) < 0)
               {
                  setFactionRelations(2,0,0);
               }
               break;
            case 11:
               break;
            case 12:
               Story.acceptedSigurdsJob = true;
               Towns[24].discovered = true;
               Towns[24].locations[0].visible = true;
               completeQuest(9);
               break;
            case 13:
               affectFactionRelations(30,0,4);
               completeQuest(12);
               Story.dialogueDefaults[15] = 653;
               Story.broughtSpencerRiceToKivi = true;
               Towns[19].locations[4].visible = true;
               Story.dialogueDefaults[16] = 667;
               for(_loc2_ in Caravans[0].People)
               {
                  if(Caravans[0].People[_loc2_].specialPurpose == 3)
                  {
                     Towns[19].locations[5].people.push(Caravans[0].People[_loc2_]);
                     Caravans[0].removePerson(_loc2_);
                     break;
                  }
               }
               break;
            case 14:
               break;
            case 15:
               Story.acceptedCalvinsMission = true;
               break;
            case 16:
               Story.heardAboutKevinsOrganization = true;
               Story.acceptedKevinsLetterQuest = true;
               Story.characterRelations[17] += 5;
               Caravans[0].addCargo(118,1);
               break;
            case 17:
               var _loc4_:int = 17;
               var _loc5_:* = Story.characterRelations[_loc4_] + 5;
               Story.characterRelations[_loc4_] = _loc5_;
               break;
            case 18:
               Story.acceptedMenaceKevinQuest = true;
               break;
            case 19:
               Story.acceptedConvincePriestMission = true;
               break;
            case 20:
               Story.needToGiveAStatement = true;
               break;
            case 21:
               Story.acceptedNariziansMission = true;
               break;
            case 22:
               Story.acceptedFindTribeMission = true;
               break;
            case 23:
               Story.acceptedBuildSettlementMisiion = true;
               break;
            case 24:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
               break;
            case 36:
               affectFactionRelations(20,2,0);
               Story.characterRelations[9] += 20;
               break;
            case 37:
            case 38:
            case 39:
            case 40:
            case 41:
            case 42:
            case 43:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
         }
         Story.acceptedQuests.unshift(param1);
      }
      
      public function completeQuest(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc2_:* = Story.acceptedQuests.indexOf(param1);
         if(_loc2_ != -1)
         {
            Story.acceptedQuests.splice(_loc2_,1);
            if(param1 < 40 || param1 > 47)
            {
               Story.completedQuests.unshift(param1);
            }
         }
         switch(param1)
         {
            case 1:
               break;
            case 2:
               Story.acceptedEmiliasQuest = false;
               Story.knowWhatHappenedToEmiliasBaby = true;
               break;
            case 3:
               if(Story.accompanyedByThum)
               {
                  for(_loc4_ in Caravans[0].People)
                  {
                     if(Caravans[0].People[_loc4_].specialPurpose == 1)
                     {
                        _loc3_ = _loc4_;
                        break;
                     }
                  }
                  if(_loc3_ != undefined)
                  {
                     _loc5_ = new Caravan(1,mapMode.mapSymbols);
                     _loc5_.name = Texts.fetch(1978);
                     _loc5_.addPerson(Caravans[0].People[_loc3_]);
                     _loc5_.x = Presets.Towns[20].x;
                     _loc5_.y = Presets.Towns[20].y;
                     _loc5_.category = 2;
                     Caravans[0].removePerson(Caravans[0].People[_loc3_],true);
                     _loc5_.addCargo(20,1,true);
                     Caravans.push(_loc5_);
                     directCaravanToTown(_loc5_,17);
                     _loc5_.staticMode = true;
                     _loc5_.update();
                  }
                  Story.accompanyedByThum = false;
                  setFactionRelations(0,2,0);
               }
               break;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
               break;
            case 10:
               affectFactionRelations(30,2,0);
               break;
            case 16:
               var _loc7_:* = 17;
               var _loc6_:* = Story.characterRelations[_loc7_] + 3;
               Story.characterRelations[_loc7_] = _loc6_;
               affectFactionRelations(10,10);
               Caravans[0].reduceCargo(118,1);
               break;
            case 20:
               _loc6_ = 17;
               _loc7_ = Story.characterRelations[_loc6_] - 50;
               Story.characterRelations[_loc6_] = _loc7_;
               affectFactionRelations(-70,10);
               affectSpecificReputation(2,-20);
               Story.dialogueDefaults[13] = 863;
               break;
            case 22:
               Story.tribeFound = true;
               break;
            case 25:
               break;
            case 36:
               affectFactionRelations(20,2,0);
               Story.characterRelations[9] += 20;
               Story.completedWarehouseMission = true;
               break;
            case 38:
               mapMode.openDialogue(48);
               break;
            case 39:
               mapMode.openDialogue(48);
         }
      }
      
      public function failQuest(param1:*) : *
      {
         var _loc2_:* = Story.acceptedQuests.indexOf(param1);
         if(_loc2_ != -1)
         {
            Story.acceptedQuests.splice(_loc2_,1);
            if(param1 < 40 || param1 > 47)
            {
               Story.failedQuests.unshift(param1);
            }
         }
         var _loc3_:* = param1;
         if(2 === _loc3_)
         {
            Story.acceptedEmiliasQuest = false;
         }
      }
      
      public function enslaveAPerson(param1:* = null) : *
      {
         if(Story.specificReputations[7] < 0)
         {
            Story.specificReputations[7] = 5;
         }
         else
         {
            affectSpecificReputation(7,5);
         }
         if(param1 != null)
         {
            param1.enslavedAt = Time;
         }
      }
      
      public function freeASlave(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(param1 is Character && param1.enslavedAt != undefined && Time - param1.enslavedAt < 10800)
         {
            affectSpecificReputation(7,-7);
         }
         else
         {
            affectSpecificReputation(7,-1);
         }
         if(Story.specificReputations[7] <= 0)
         {
            for(_loc2_ in Caravans[0].People)
            {
               if(Caravans[0].People[_loc2_] != param1 && Caravans[0].People[_loc2_].category == 4)
               {
                  Story.specificReputations[7] = 1;
                  break;
               }
            }
         }
      }
      
      public function printGlobalEconomy() : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:* = undefined;
         var _loc1_:* = [];
         var _loc3_:* = [];
         var _loc7_:int = 38;
         for(_loc4_ in Towns)
         {
            if(_loc4_ == _loc7_)
            {
               trace("-------------------------------");
               trace("------" + Towns[_loc4_].name + "------");
               trace("--- population: " + Towns[_loc4_].population + " ---");
               trace("-------------------------------");
            }
            _loc8_ = Towns[_loc4_].getConsumptionProduction();
            for(_loc5_ in _loc8_.productsList)
            {
               if(_loc4_ == _loc7_)
               {
                  trace(new Item(_loc8_.productsList[_loc5_].item,1).name + " prod: " + _loc8_.productsList[_loc5_].production + " cons: " + _loc8_.productsList[_loc5_].consumption + " percentage: " + MathFunctions.NumberFormat(_loc8_.productsList[_loc5_].production / _loc8_.productsList[_loc5_].consumption * 100,1,true) + "%");
               }
               _loc2_ = false;
               for(_loc6_ in _loc1_)
               {
                  if(_loc1_[_loc6_].item == _loc8_.productsList[_loc5_].item)
                  {
                     _loc1_[_loc6_].production += _loc8_.productsList[_loc5_].production;
                     _loc1_[_loc6_].consumption += _loc8_.productsList[_loc5_].consumption;
                     _loc2_ = true;
                     break;
                  }
               }
               if(!_loc2_)
               {
                  _loc1_.push({
                     "item":_loc8_.productsList[_loc5_].item,
                     "production":_loc8_.productsList[_loc5_].production,
                     "consumption":_loc8_.productsList[_loc5_].consumption
                  });
               }
            }
            for(_loc5_ in _loc8_.categoryProducts)
            {
               if(_loc4_ == _loc7_)
               {
                  trace("category " + _loc5_ + " prod: " + _loc8_.categoryProducts[_loc5_].production + " cons: " + _loc8_.categoryProducts[_loc5_].consumption + " percentage: " + MathFunctions.NumberFormat(_loc8_.categoryProducts[_loc5_].production / _loc8_.categoryProducts[_loc5_].consumption * 100,1,true) + "%");
               }
               if(_loc3_[_loc5_] == undefined)
               {
                  _loc3_[_loc5_] = {
                     "production":_loc8_.categoryProducts[_loc5_].production,
                     "consumption":_loc8_.categoryProducts[_loc5_].consumption
                  };
               }
               else
               {
                  _loc3_[_loc5_].production += _loc8_.categoryProducts[_loc5_].production;
                  _loc3_[_loc5_].consumption += _loc8_.categoryProducts[_loc5_].consumption;
               }
            }
            if(_loc4_ == _loc7_)
            {
               trace("-------------------------------------");
               trace("unemployed: " + Towns[_loc4_].unemployed + " -----------");
               trace("-------------------------------------");
            }
         }
         for(_loc4_ in _loc1_)
         {
            trace(new Item(_loc1_[_loc4_].item,1).name + " production: " + _loc1_[_loc4_].production + " consumption: " + _loc1_[_loc4_].consumption + " percentage: " + MathFunctions.NumberFormat(_loc1_[_loc4_].production / _loc1_[_loc4_].consumption * 100,1,true) + "%");
         }
         for(_loc4_ in _loc3_)
         {
            trace("category " + Texts.fetch(itemCategoryNames[_loc4_]) + " production: " + _loc3_[_loc4_].production + " consumption: " + _loc3_[_loc4_].consumption + " percentage: " + MathFunctions.NumberFormat(_loc3_[_loc4_].production / _loc3_[_loc4_].consumption * 100,1,true) + "%");
         }
      }
      
      public function printTownsEconomy() : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc1_:* = undefined;
         for(_loc1_ in Towns)
         {
            trace("-------------------------------");
            trace("------" + Towns[_loc1_].name + "------");
            trace("--- population: " + Towns[_loc1_].population + " ---");
            trace("-------------------------------");
            _loc4_ = Towns[_loc1_].getConsumptionProduction();
            for(_loc2_ in _loc4_.productsList)
            {
               trace(new Item(_loc4_.productsList[_loc2_].item,1).name + " prod: " + _loc4_.productsList[_loc2_].production + " cons: " + _loc4_.productsList[_loc2_].consumption + " balance: " + Math.round(_loc4_.productsList[_loc2_].production - _loc4_.productsList[_loc2_].consumption) + " percentage: " + MathFunctions.NumberFormat(_loc4_.productsList[_loc2_].production / _loc4_.productsList[_loc2_].consumption * 100,1,true) + "%");
            }
            for(_loc2_ in _loc4_.categoryProducts)
            {
               trace("category " + _loc2_ + " prod: " + _loc4_.categoryProducts[_loc2_].production + " cons: " + _loc4_.categoryProducts[_loc2_].consumption + " balance: " + Math.round(_loc4_.categoryProducts[_loc2_].production - _loc4_.categoryProducts[_loc2_].consumption) + " percentage: " + MathFunctions.NumberFormat(_loc4_.categoryProducts[_loc2_].production / _loc4_.categoryProducts[_loc2_].consumption * 100,1,true) + "%");
            }
            trace("-------------------------------------");
            trace("unemployed: " + Towns[_loc1_].unemployed + " -----------");
            trace("-------------------------------------");
         }
      }
      
      public function createCaravanOnRoute(paramIndex:*) : *//-called from MapMode
      {
         var customLoadout:* = Presets.caravanRoutes[paramIndex].customLoadout//- new var in route
         var customLoadoutIndex:* //for the loops

         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var characterVar :* = undefined;
         if(mapMode is MapMode)
         {
            _loc3_ = Caravans.push(new Caravan(40,mapMode.mapSymbols)) - 1;
         }
         else
         {
            _loc3_ = Caravans.push(new Caravan(40)) - 1;
         }
         Caravans[_loc3_].x = Presets.Towns[Presets.caravanRoutes[paramIndex].points[0].town].x;
         Caravans[_loc3_].y = Presets.Towns[Presets.caravanRoutes[paramIndex].points[0].town].y;
         Caravans[_loc3_].category = 5;

         if(Presets.caravanRoutes[paramIndex].customMoney !== undefined)
            Caravans[_loc3_].money = Presets.caravanRoutes[paramIndex].customMoney;
         else
            Caravans[_loc3_].money = Presets.caravanRoutes[paramIndex].size * 100000;

         _loc4_ = 1;
         while(_loc4_ <= Presets.caravanRoutes[paramIndex].size)
         {
            characterVar = new Character({
               "experienceModifier":3,
               "savePointer":true
            })
            //- it is kinda weird that caravan members can spawn with such bad stats, so i make sure they have at least 5 in these
            if(characterVar.basePhysical < 4)
               characterVar.basePhysical = 4
            if(characterVar.baseAgility < 4)
               characterVar.baseAgility = 4
            Caravans[_loc3_].addPerson(characterVar);

            if(customLoadout && customLoadout.transport){
               for(customLoadoutIndex in customLoadout.transport)
               {
                  Caravans[_loc3_].addTransport(new TransportUnit(customLoadout.transport[customLoadoutIndex].id, true));
               }
            }
            else{
               //adds a camel + cart
               Caravans[_loc3_].addTransport(new TransportUnit(9,true));
               Caravans[_loc3_].addTransport(new TransportUnit(10,true));
            }
            _loc4_++;
         }
         if(customLoadout && customLoadout.cargo){
            for(customLoadoutIndex in customLoadout.cargo)
            {
               Caravans[_loc3_].addCargo(customLoadout.cargo[customLoadoutIndex].id, Presets.caravanRoutes[paramIndex].size * customLoadout.cargo[customLoadoutIndex].mult);
            }
         } else {
            Caravans[_loc3_].addCargo(120,Presets.caravanRoutes[paramIndex].size);//rifle
            Caravans[_loc3_].addCargo(121,Presets.caravanRoutes[paramIndex].size * 40);//ammo
            Caravans[_loc3_].addCargo(200,Presets.caravanRoutes[paramIndex].size);//some armor it seems
            Caravans[_loc3_].addCargo(168,4);//water container
            var _loc2_:* = Math.round(Presets.caravanRoutes[paramIndex].size / 4);
            Caravans[_loc3_].addCargo(169,_loc2_);//bigger water container
         }
         
         for(_loc4_ in Presets.caravanRoutes[paramIndex].extraEquipment)
         {
            Caravans[_loc3_].addCargo(Presets.caravanRoutes[paramIndex].extraEquipment[_loc4_].type,Presets.caravanRoutes[paramIndex].extraEquipment[_loc4_].amount);
         }
         Caravans[_loc3_].fearless = true;
         Caravans[_loc3_].distributeWeapons();
         Caravans[_loc3_].distributeArmor();
         Caravans[_loc3_].distributeAmmo();
         Caravans[_loc3_].distributeTransport();
         Caravans[_loc3_].route = paramIndex;
         arriveAtRoutePoint(Caravans[_loc3_]);
         Caravans[_loc3_].staticMode = true;
         Caravans[_loc3_].update();
      }
      
      public function arriveAtRoutePoint(param1:*) : *
      {
         var _loc7_:* = undefined;
         var sellCargo:* = undefined;//-is either Cargo or false
         var _loc4_:* = undefined;
         var _loc12_:* = undefined;
         var _loc5_:* = undefined;
         var _loc10_:* = undefined;
         var _loc6_:* = undefined;
         var _loc9_:* = undefined;
         param1.staticMode = false;
         var caravanRoute:* = Presets.caravanRoutes[param1.route]
         var points:* = caravanRoute.points
         var currentPoint:* = points[param1.routePoint]
         var currentTown:* = Towns[currentPoint.town]
         for(_loc6_ in currentPoint.sell)
         {
            if(currentPoint.sell[_loc6_].item is Number)
            {
               sellCargo = param1.findCargo(currentPoint.sell[_loc6_].item);
               if(sellCargo)
               {
                  _loc4_ = sellCargo.amount * currentPoint.sell[_loc6_].amount / 100;
                  if(!sellCargo.divisible)
                  {
                     _loc4_ = Math.round(_loc4_);
                     if(_loc4_ < 1)
                     {
                        _loc4_ = 1;
                     }
                  }
                  _loc12_ = calculatePrice(currentTown,currentPoint.sell[_loc6_].item,_loc4_,false,null);
                  currentTown.addToStock(currentPoint.sell[_loc6_].item,_loc4_);
                  param1.reduceCargo(currentPoint.sell[_loc6_].item,_loc4_);
                  currentTown.money -= _loc12_;
                  param1.money += _loc12_;
               }
            }
            else
            {
               for(_loc7_ in param1.Cargo)
               {
                  if(param1.Cargo[_loc7_].itemData[currentPoint.sell[_loc6_].item])
                  {
                     _loc4_ = param1.Cargo[_loc7_].amount * currentPoint.sell[_loc6_].amount / 100;
                     if(!param1.Cargo[_loc7_].divisible)
                     {
                        _loc4_ = Math.round(_loc4_);
                        if(_loc4_ < 1)
                        {
                           _loc4_ = 1;
                        }
                     }
                     _loc12_ = calculatePrice(currentTown,param1.Cargo[_loc7_].type,_loc4_,false,null);
                     currentTown.addToStock(param1.Cargo[_loc7_].type,_loc4_);
                     _loc10_ = _loc4_ >= param1.Cargo[_loc7_].amount;
                     param1.reduceCargo(param1.Cargo[_loc7_].type,_loc4_);
                     if(_loc10_)
                     {
                        _loc7_--;
                     }
                     currentTown.money -= _loc12_;
                     param1.money += _loc12_;
                  }
               }
            }
         }
         consumeFromLastPoint(param1);
         var waterRefillAmount = 50 * param1.People.length
         var foodRefillAmount = 20000 * param1.People.length
         var forageRefillAmount = 20 * param1.People.length
         if(caravanRoute.customRefill)
         {
            if(caravanRoute.customRefill.water !== undefined)
               waterRefillAmount = caravanRoute.customRefill.water
            if(caravanRoute.customRefill.food !== undefined)
               foodRefillAmount = caravanRoute.customRefill.food
            if(caravanRoute.customRefill.forage !== undefined)
               forageRefillAmount = caravanRoute.customRefill.forage
         }
         refillSupply(param1,1,waterRefillAmount,currentTown);
         if(forageRefillAmount>0)
            refillSupply(param1,62,forageRefillAmount,currentTown);
         refillSupply(param1,"food",foodRefillAmount,currentTown);
         var _loc8_:* = 0;
         var _loc13_:* = [];
         for(_loc6_ in currentPoint.buy)
         {
            _loc8_ += currentPoint.buy[_loc6_].amount;
         }
         var _loc2_:* = param1.maxCargo - param1.totalCargo;
         var _loc3_:* = _loc2_ / _loc8_;
         for(_loc6_ in currentPoint.buy)
         {
            _loc9_ = _loc3_ * currentPoint.buy[_loc6_].amount;
            _loc5_ = 0;
            for(_loc7_ in currentTown.stock)
            {
               if(currentTown.stock[_loc7_].type == currentPoint.buy[_loc6_].item || currentPoint.buy[_loc6_].item is String && Item.getDataFromType(currentTown.stock[_loc7_].type)[currentPoint.buy[_loc6_].item])
               {
                  if(_loc5_ + currentTown.stock[_loc7_].totalWeight <= _loc9_)
                  {
                     _loc5_ += currentTown.stock[_loc7_].totalWeight;
                     _loc13_.push({
                        "item":currentTown.stock[_loc7_].type,
                        "amount":currentTown.stock[_loc7_].amount
                     });
                  }
                  else
                  {
                     _loc4_ = Math.floor((_loc9_ - _loc5_) / currentTown.stock[_loc7_].weightPerUnit);
                     _loc13_.push({
                        "item":currentTown.stock[_loc7_].type,
                        "amount":_loc4_
                     });
                     _loc5_ += _loc4_ * currentTown.stock[_loc7_].weightPerUnit;
                  }
               }
            }
         }
         for(_loc6_ in _loc13_)
         {
            if(Item.getDataFromType(_loc13_[_loc6_].item).liquid)
            {
               _loc13_[_loc6_].amount = Math.min(_loc13_[_loc6_].amount,param1.maxLiquidAmount(_loc13_[_loc6_].item));
            }
            if(_loc13_[_loc6_].amount > 0)
            {
               _loc12_ = calculatePrice(currentTown,_loc13_[_loc6_].item,_loc13_[_loc6_].amount,true,null);
               param1.addCargo(_loc13_[_loc6_].item,_loc13_[_loc6_].amount);
               currentTown.removeFromStock(_loc13_[_loc6_].item,_loc13_[_loc6_].amount);
               param1.money -= _loc12_;
               currentTown.money += _loc12_;
            }
         }
         if(param1.money > 0)
         {
            Math.min(currentTown.money += param1.money / 10,param1.People.length * 10000);
         }
         param1.staticMode = true;
         param1.update();
         param1.routePoint++;
         if(param1.routePoint >= points.length)
         {
            param1.routePoint = 0;
         }
         while(!currentTown.active)
         {
            param1.routePoint++;
            if(param1.routePoint >= points.length)
            {
               param1.routePoint = 0;
            }
         }
         directCaravanToTown(param1,points[param1.routePoint].town);
         param1.moving = true;
      }
      
      public function consumeFromLastPoint(param1:*) : *
      {
         var _loc6_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         if(param1.lastConsumption != undefined)
         {
            _loc3_ = Time - param1.lastConsumption;
            _loc7_ = param1.getConsumptionProduction();
            for(_loc5_ in _loc7_.consumption)
            {
               param1.reduceCargo(_loc7_.consumption[_loc5_].item,_loc7_.consumption[_loc5_].amount * _loc3_ / 86400);
            }
            _loc4_ = _loc7_.foodConsumption * _loc3_ / 86400;
            for(_loc5_ in param1.Cargo)
            {
               if(param1.Cargo[_loc5_].itemData.food)
               {
                  _loc6_ = param1.Cargo[_loc5_].amount * param1.Cargo[_loc5_].itemData.calories;
                  if(_loc6_ > _loc4_)
                  {
                     _loc2_ = _loc4_ / param1.Cargo[_loc5_].itemData.calories;
                     if(!param1.Cargo[_loc5_].divisible)
                     {
                        _loc2_ = Math.ceil(_loc2_);
                     }
                     param1.reduceCargo(param1.Cargo[_loc5_].type,_loc2_);
                     break;
                  }
                  param1.reduceCargo(param1.Cargo[_loc5_].type,param1.Cargo[_loc5_].amount);
                  _loc4_ -= _loc6_;
                  _loc5_--;
               }
            }
         }
         param1.lastConsumption = Time;
      }
      
      public function refillSupply(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc5_:* = 0;
         if(param2 is Number)
         {
            for(_loc9_ in param1.Cargo)
            {
               if(param1.Cargo[_loc9_].type == param2)
               {
                  _loc5_ = param1.Cargo[_loc9_].amount;
                  break;
               }
            }
         }
         else
         {
            for(_loc9_ in param1.Cargo)
            {
               if(param1.Cargo[_loc9_].itemData[param2])
               {
                  if(param2 == "food")
                  {
                     _loc5_ += param1.Cargo[_loc9_].amount * param1.Cargo[_loc9_].itemData.calories;
                  }
                  else
                  {
                     _loc5_ += param1.Cargo[_loc9_].amount;
                  }
               }
            }
         }
         var _loc10_:* = param3 - _loc5_;
         if(_loc10_ > 0)
         {
            if(param2 is Number)
            {
               for(_loc9_ in param4.stock)
               {
                  if(param4.stock[_loc9_].type == param2)
                  {
                     _loc6_ = Math.min(_loc10_,param4.stock[_loc9_].amount);
                     _loc8_ = calculatePrice(param4,param4.stock[_loc9_].type,_loc6_,true,null);
                     trace("buying supply " + param4.stock[_loc9_].type + " x " + _loc6_ + " for " + _loc8_);
                     param1.addCargo(param4.stock[_loc9_].type,_loc6_);
                     param4.removeFromStock(param4.stock[_loc9_].type,_loc6_);
                     param1.money -= _loc8_;
                     param4.money += _loc8_;
                     break;
                  }
               }
            }
            else
            {
               for(_loc9_ in param4.stock)
               {
                  if(param4.stock[_loc9_].itemData[param2])
                  {
                     if(param2 == "food")
                     {
                        _loc6_ = Math.min(_loc10_ / param4.stock[_loc9_].itemData.calories,param4.stock[_loc9_].amount);
                     }
                     else
                     {
                        _loc6_ = Math.min(_loc10_,param4.stock[_loc9_].amount);
                     }
                     if(!param4.stock[_loc9_].divisible)
                     {
                        _loc6_ = Math.ceil(_loc6_);
                     }
                     _loc8_ = calculatePrice(param4,param4.stock[_loc9_].type,_loc6_,true,null);
                     trace("buying supply " + param4.stock[_loc9_].type + " x " + _loc6_ + " for " + _loc8_);
                     if(param2 == "food")
                     {
                        _loc10_ -= _loc6_ * param4.stock[_loc9_].itemData.calories;
                     }
                     else
                     {
                        _loc10_ -= _loc6_;
                     }
                     _loc7_ = param4.stock[_loc9_].amount <= _loc6_;
                     param1.addCargo(param4.stock[_loc9_].type,_loc6_);
                     param4.removeFromStock(param4.stock[_loc9_].type,_loc6_);
                     if(_loc7_)
                     {
                        _loc9_--;
                     }
                     param1.money -= _loc8_;
                     param4.money += _loc8_;
                     if(_loc10_ <= 0)
                     {
                        break;
                     }
                  }
               }
            }
         }
      }
      
      public function addKnownPrice(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         var _loc10_:* = undefined;
         var _loc8_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc11_:* = undefined;
         var _loc9_:* = undefined;
         for(_loc9_ in Towns)
         {
            if(Towns[_loc9_] == param2)
            {
               for(_loc10_ in Towns[_loc9_].locations)
               {
                  if(Towns[_loc9_].locations[_loc10_] == param3)
                  {
                     _loc6_ = _loc10_;
                     break;
                  }
               }
               _loc8_ = _loc9_;
               break;
            }
         }
         if(_loc8_ == undefined || _loc6_ == undefined)
         {
            trace("some weird shit happened");
            return;
         }
         _loc7_ = false;
         for(_loc9_ in knownPrices)
         {
            if(knownPrices[_loc9_].item == param1 && knownPrices[_loc9_].town == _loc8_ && knownPrices[_loc9_].location == _loc6_)
            {
               _loc11_ = _loc9_;
               _loc7_ = true;
               break;
            }
         }
         if(!_loc7_)
         {
            _loc11_ = knownPrices.push({
               "item":param1,
               "town":_loc8_,
               "location":_loc6_,
               "buyTime":0,
               "sellTime":0
            }) - 1;
         }
         if(param5 && Time >= knownPrices[_loc11_].buyTime)
         {
            knownPrices[_loc11_].buyTime = Time;
            knownPrices[_loc11_].buyPrice = param4;
         }
         if(!param5 && Time >= knownPrices[_loc11_].sellTime)
         {
            knownPrices[_loc11_].sellTime = Time;
            knownPrices[_loc11_].sellPrice = param4;
         }
      }
      
      internal function displayTutorial(param1:*, param2:* = false) : *
      {
         var mat:*;
         var num:* = param1;
         var forceMusicMute:* = param2;
         if(!showTutorial && num != 34 || displayedTutorials[num])
         {
            return;
         }
         displayedTutorials[num] = true;
         tutorialOn = true;
         if(mode == 1 || forceMusicMute)
         {
            mapMode.musicFadeOut = true;
         }
         tutorialSprite = new Sprite();
         switch(num)
         {
            case 0:
               tutorialSprite.addChild(generateTutorialGrid([305,224,345,264]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6839,Caravans[0].People[0].gender),600,"bottom",25,174));
               tutorialSprite.addChildAt(generateTutorialArrow(325,174,325,214),1);
               onTutorialProceed = null;
               break;
            case 1:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6840,Caravans[0].People[0].gender),600,"middle",25,247.5));
               onTutorialProceed = function():*
               {
                  displayTutorial(2);
               };
               break;
            case 2:
               tutorialSprite.addChild(generateTutorialGrid([680,30,770,90]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6841,Caravans[0].People[0].gender),400,"top",220,45));
               tutorialSprite.addChildAt(generateTutorialArrow(600,60,670,60),1);
               onTutorialProceed = function():*
               {
                  displayTutorial(3);
               };
               break;
            case 3:
               tutorialSprite.addChild(generateTutorialGrid([690,90,860,240]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6842,Caravans[0].People[0].gender),400,"middle",220,170));
               tutorialSprite.addChildAt(generateTutorialArrow(600,170,680,170),1);
               onTutorialProceed = function():*
               {
                  displayTutorial(4);
               };
               break;
            case 4:
               tutorialSprite.addChild(generateTutorialGrid([670,240,875,265]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6843,Caravans[0].People[0].gender),400,"middle",220,247.5));
               tutorialSprite.addChildAt(generateTutorialArrow(600,247.5,660,247.5),1);
               onTutorialProceed = function():*
               {
                  displayTutorial(5);
               };
               break;
            case 5:
               tutorialSprite.addChild(generateTutorialGrid([680,265,873,365]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6844,Caravans[0].People[0].gender),400,"middle",220,315));
               tutorialSprite.addChildAt(generateTutorialArrow(600,315,670,315),1);
               onTutorialProceed = function():*
               {
                  displayTutorial(6);
               };
               break;
            case 6:
               tutorialSprite.addChild(generateTutorialGrid([675,420,840,495]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6845,Caravans[0].People[0].gender),400,"bottom",220,472.5));
               tutorialSprite.addChildAt(generateTutorialArrow(600,457.5,665,457.5),1);
               onTutorialProceed = null;
               break;
            case 7:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6847,Caravans[0].People[0].gender),600,"middle",30,247.5));
               onTutorialProceed = null;
               break;
            case 8:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6848,Caravans[0].People[0].gender),600,"middle",30,247.5));
               onTutorialProceed = null;
               break;
            case 9:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6846,Caravans[0].People[0].gender),600,"middle",30,247.5));
               onTutorialProceed = null;
               break;
            case 10:
               tutorialSprite.addChild(generateTutorialGrid([[10,0,110,495],[550,0,650,495]]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6849,Caravans[0].People[0].gender),340,"middle",160,247.5));
               tutorialSprite.addChildAt(generateTutorialArrow(160,247.5,120,247.5),1);
               tutorialSprite.addChildAt(generateTutorialArrow(500,247.5,540,247.5),1);
               onTutorialProceed = null;
               break;
            case 11:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6850,Caravans[0].People[0].gender),600,"middle",30,247.5));
               onTutorialProceed = null;
               break;
            case 12:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6856,Caravans[0].People[0].gender),600,"middle",30,247.5));
               onTutorialProceed = null;
               break;
            case 13:
               tutorialSprite.addChild(generateTutorialGrid([[10,0,110,495],[550,0,650,495]]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6857,Caravans[0].People[0].gender),340,"middle",160,247.5));
               tutorialSprite.addChildAt(generateTutorialArrow(160,247.5,120,247.5),1);
               tutorialSprite.addChildAt(generateTutorialArrow(500,247.5,540,247.5),1);
               onTutorialProceed = null;
               break;
            case 14:
               tutorialSprite.addChild(generateTutorialGrid([[10,0,110,495],[550,0,650,495]]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6858,Caravans[0].People[0].gender),340,"middle",160,247.5));
               tutorialSprite.addChildAt(generateTutorialArrow(160,247.5,120,247.5),1);
               tutorialSprite.addChildAt(generateTutorialArrow(500,247.5,540,247.5),1);
               onTutorialProceed = null;
               break;
            case 15:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6851,Caravans[0].People[0].gender),600,"middle",30,247.5));
               onTutorialProceed = function():*
               {
                  displayTutorial(17);
               };
               break;
            case 16:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6853,Caravans[0].People[0].gender),600,"middle",30,247.5));
               onTutorialProceed = null;
               break;
            case 17:
               tutorialSprite.addChild(generateTutorialGrid([550,10,650,75]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6852,Caravans[0].People[0].gender),480,"top",20,27.5));
               tutorialSprite.addChildAt(generateTutorialArrow(470,42.5,540,42.5),1);
               onTutorialProceed = null;
               break;
            case 18:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6859,Caravans[0].People[0].gender),600,"middle",140,247.5));
               onTutorialProceed = function():*
               {
                  displayTutorial(19);
               };
               break;
            case 19:
               tutorialSprite.addChild(generateTutorialGrid([160,350,710,425]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6860,Caravans[0].People[0].gender),600,"bottom",140,290));
               tutorialSprite.addChildAt(generateTutorialArrow(440,290,440,340),1);
               onTutorialProceed = null;
               break;
            case 20:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6861,Caravans[0].People[0].gender),600,"middle",140,247.5));
               onTutorialProceed = null;
               break;
            case 21:
               tutorialSprite.addChild(generateTutorialGrid([[5,45,215,80],[435,45,645,80]]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6862,Caravans[0].People[0].gender),460,"top",95,140));
               tutorialSprite.addChildAt(generateTutorialArrow(110,150,110,90),1);
               tutorialSprite.addChildAt(generateTutorialArrow(540,150,540,90),1);
               onTutorialProceed = null;
               break;
            case 22:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6863,Caravans[0].People[0].gender),560,"middle",45,247.5));
               onTutorialProceed = null;
               break;
            case 23:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6864,Caravans[0].People[0].gender),560,"middle",45,247.5));
               onTutorialProceed = null;
               break;
            case 24:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6865,Caravans[0].People[0].gender),567,"middle",35,247.5));
               onTutorialProceed = null;
               break;
            case 25:
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6866,Caravans[0].People[0].gender),600,"middle",140,247.5));
               onTutorialProceed = null;
               break;
            case 26:
               currentScreenContainer.BF.paused = true;
               currentScreenContainer.BI.stopped = true;
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6867,Caravans[0].People[0].gender),600,"middle",20,222.5));
               onTutorialProceed = function():*
               {
                  currentScreenContainer.BF.paused = false;
                  currentScreenContainer.BI.stopped = false;
                  displayTutorial(27);
               };
               break;
            case 27:
               currentScreenContainer.BF.paused = true;
               currentScreenContainer.BI.stopped = true;
               tutorialSprite.addChild(generateTutorialGrid([640,0,880,120]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6868,Caravans[0].People[0].gender),560,"top",20,45));
               tutorialSprite.addChildAt(generateTutorialArrow(570,60,630,60),1);
               onTutorialProceed = function():*
               {
                  currentScreenContainer.BF.paused = false;
                  currentScreenContainer.BI.stopped = false;
                  displayTutorial(28);
               };
               break;
            case 28:
               currentScreenContainer.BF.paused = true;
               currentScreenContainer.BI.stopped = true;
               tutorialSprite.addChild(generateTutorialGrid([640,120,880,315]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6869,Caravans[0].People[0].gender),560,"middle",20,167.2));
               tutorialSprite.addChildAt(generateTutorialArrow(570,167.2,630,167.2),1);
               onTutorialProceed = function():*
               {
                  currentScreenContainer.BF.paused = false;
                  currentScreenContainer.BI.stopped = false;
                  displayTutorial(29);
               };
               break;
            case 29:
               currentScreenContainer.BF.paused = true;
               currentScreenContainer.BI.stopped = true;
               tutorialSprite.addChild(generateTutorialGrid([640,315,880,495]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6870,Caravans[0].People[0].gender),560,"bottom",20,430));
               tutorialSprite.addChildAt(generateTutorialArrow(570,405,630,405),1);
               onTutorialProceed = function():*
               {
                  currentScreenContainer.BF.paused = false;
                  currentScreenContainer.BI.stopped = false;
                  displayTutorial(30);
               };
               break;
            case 30:
               currentScreenContainer.BF.paused = true;
               currentScreenContainer.BI.stopped = true;
               tutorialSprite.addChild(generateTutorialGrid([0,445,305,495]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6871,Caravans[0].People[0].gender),600,"bottom",20,385));
               tutorialSprite.addChildAt(generateTutorialArrow(152.5,385,152.5,435),1);
               onTutorialProceed = function():*
               {
                  currentScreenContainer.BF.paused = false;
                  currentScreenContainer.BI.stopped = false;
                  displayTutorial(31);
               };
               break;
            case 31:
               currentScreenContainer.BF.paused = true;
               currentScreenContainer.BI.stopped = true;
               tutorialSprite.addChild(generateTutorialGrid([305,445,580,495]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6872,Caravans[0].People[0].gender),600,"bottom",20,385));
               tutorialSprite.addChildAt(generateTutorialArrow(442.5,385,442.5,435),1);
               onTutorialProceed = function():*
               {
                  currentScreenContainer.BF.paused = false;
                  currentScreenContainer.BI.stopped = false;
                  displayTutorial(32);
               };
               break;
            case 32:
               currentScreenContainer.BF.paused = true;
               currentScreenContainer.BI.stopped = true;
               tutorialSprite.addChild(generateTutorialGrid([580,445,640,495]));
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6873,Caravans[0].People[0].gender),500,"bottom",360,385));
               tutorialSprite.addChildAt(generateTutorialArrow(610,385,610,435),1);
               onTutorialProceed = function():*
               {
                  currentScreenContainer.BF.paused = false;
                  currentScreenContainer.BI.stopped = false;
                  displayTutorial(33);
               };
               break;
            case 33:
               currentScreenContainer.BF.paused = true;
               currentScreenContainer.BI.stopped = true;
               tutorialSprite.addChild(generateTutorialGrid());
               tutorialSprite.addChild(generateTutorialWindow(Texts.fetch(6874,Caravans[0].People[0].gender),600,"middle",20,222.5));
               onTutorialProceed = function():*
               {
                  currentScreenContainer.BF.paused = false;
                  currentScreenContainer.BI.stopped = false;
               };
               break;
            case 34:
               tutorialSprite.addChild(generateTutorialGrid([678,420,715,495]));
               saveButtonReminder = {};
               saveButtonReminder.disp = new Sprite();
               saveButtonReminder.bg = new Sprite();
               mat = new Matrix();
               mat.createGradientBox(400,100,3.141592653589793 * 1.5);
               saveButtonReminder.bg.graphics.beginGradientFill("linear",[10485760,8388608],[1,1],[0,255],mat);
               saveButtonReminder.bg.graphics.lineStyle(2,1052688);
               saveButtonReminder.bg.graphics.moveTo(380,0);
               saveButtonReminder.bg.graphics.curveTo(400,0,400,20);
               saveButtonReminder.bg.graphics.lineTo(400,100);
               saveButtonReminder.bg.graphics.curveTo(400,120,380,120);
               saveButtonReminder.bg.graphics.lineTo(20,120);
               saveButtonReminder.bg.graphics.curveTo(0,120,0,100);
               saveButtonReminder.bg.graphics.lineTo(0,20);
               saveButtonReminder.bg.graphics.curveTo(0,0,20,0);
               saveButtonReminder.bg.graphics.endFill();
               saveButtonReminder.disp.addChild(saveButtonReminder.bg);
               saveButtonReminder.message = new EngineText(Texts.fetch(7029,Caravans[0].People[0].gender).toUpperCase(),16777215,16,"center",10,18,380,30);
               saveButtonReminder.disp.addChild(saveButtonReminder.message);
               saveButtonReminder.mKayButton = new Sprite();
               saveButtonReminder.mKayButton.graphics.beginFill(1052688);
               saveButtonReminder.mKayButton.graphics.moveTo(190,0);
               saveButtonReminder.mKayButton.graphics.curveTo(200,0,200,10);
               saveButtonReminder.mKayButton.graphics.lineTo(200,20);
               saveButtonReminder.mKayButton.graphics.curveTo(200,30,190,30);
               saveButtonReminder.mKayButton.graphics.lineTo(10,30);
               saveButtonReminder.mKayButton.graphics.curveTo(0,30,0,20);
               saveButtonReminder.mKayButton.graphics.lineTo(0,10);
               saveButtonReminder.mKayButton.graphics.curveTo(0,0,10,0);
               saveButtonReminder.mKayButton.graphics.endFill();
               saveButtonReminder.mKayButton.addChild(new EngineText(Texts.fetch(7030,Caravans[0].People[0].gender).toUpperCase(),16777215,16,"center",5,4,190,22));
               saveButtonReminder.mKayButton.buttonMode = true;
               saveButtonReminder.mKayButton.mouseChildren = false;
               saveButtonReminder.mKayButton.x = 100;
               saveButtonReminder.mKayButton.y = 70;
               saveButtonReminder.disp.addChild(saveButtonReminder.mKayButton);
               saveButtonReminder.frame = 0;
               saveButtonReminder.disp.addEventListener("enterFrame",saveButtonReminderEF);
               saveButtonReminder.disp.filters = [new GlowFilter(2097152,1,20,30,1,1,true),new GlowFilter(16777164,1,20,20,0.5)];
               onTutorialProceed = function():*
               {
                  saveButtonReminder.disp.removeEventListener("enterFrame",saveButtonReminderEF);
               };
               saveButtonReminder.mKayButton.addEventListener("click",tutorialProceed);
               saveButtonReminder.arrow = new Sprite();
               mat.createGradientBox(80,60,3.141592653589793 * 1.5);
               saveButtonReminder.arrow.graphics.beginGradientFill("linear",[10485760,8388608],[1,1],[255,0],mat);
               saveButtonReminder.arrow.graphics.lineStyle(2,1052688);
               saveButtonReminder.arrow.graphics.moveTo(-20,0);
               saveButtonReminder.arrow.graphics.curveTo(-20,-20,0,-20);
               saveButtonReminder.arrow.graphics.curveTo(20,-20,20,0);
               saveButtonReminder.arrow.graphics.lineTo(20,20);
               saveButtonReminder.arrow.graphics.lineTo(40,20);
               saveButtonReminder.arrow.graphics.lineTo(0,60);
               saveButtonReminder.arrow.graphics.lineTo(-40,20);
               saveButtonReminder.arrow.graphics.lineTo(-20,20);
               saveButtonReminder.arrow.graphics.endFill();
               saveButtonReminder.arrow.rotation = -45;
               saveButtonReminder.arrow.x = 420;
               saveButtonReminder.arrow.y = 140;
               saveButtonReminder.disp.addChild(saveButtonReminder.arrow);
               saveButtonReminder.disp.x = 222;
               saveButtonReminder.disp.y = 280;
               tutorialSprite.addChild(saveButtonReminder.disp);
         }
         screenNode.addChild(tutorialSprite);
      }
      
      internal function saveButtonReminderEF(param1:* = null) : *
      {
         saveButtonReminder.frame++;
         if(saveButtonReminder.frame > 20)
         {
            saveButtonReminder.frame = 0;
         }
         if(saveButtonReminder.frame < 10)
         {
            saveButtonReminder.bg.scaleX = 1 + saveButtonReminder.frame / 900;
            saveButtonReminder.bg.scaleY = 1 + saveButtonReminder.frame / 400;
            saveButtonReminder.arrow.x = 410 + saveButtonReminder.frame;
            saveButtonReminder.arrow.y = 130 + saveButtonReminder.frame;
            saveButtonReminder.arrow.scaleY = 1 + saveButtonReminder.frame / 150;
         }
         else
         {
            saveButtonReminder.bg.scaleX = 1 + (20 - saveButtonReminder.frame) / 900;
            saveButtonReminder.bg.scaleY = 1 + (20 - saveButtonReminder.frame) / 400;
            saveButtonReminder.arrow.x = 410 + (20 - saveButtonReminder.frame);
            saveButtonReminder.arrow.y = 130 + (20 - saveButtonReminder.frame);
            saveButtonReminder.arrow.scaleY = 1 + (20 - saveButtonReminder.frame) / 150;
         }
         saveButtonReminder.bg.x = 200 - saveButtonReminder.bg.scaleX * 200;
         saveButtonReminder.bg.y = 60 - saveButtonReminder.bg.scaleY * 60;
      }
      
      internal function generateTutorialArrow(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc6_:* = MathFunctions.CalcDistance(param1,param2,param3,param4);
         var _loc7_:* = MathFunctions.CalcRevYAngle(param1,param2,param3,param4);
         var _loc5_:* = new Sprite();
         _loc5_.graphics.beginFill(16777215);
         _loc5_.graphics.moveTo(-15,0);
         _loc5_.graphics.lineTo(-15,0 - _loc6_ + 30);
         _loc5_.graphics.lineTo(-30,0 - _loc6_ + 30);
         _loc5_.graphics.lineTo(0,0 - _loc6_);
         _loc5_.graphics.lineTo(30,0 - _loc6_ + 30);
         _loc5_.graphics.lineTo(15,0 - _loc6_ + 30);
         _loc5_.graphics.lineTo(15,0);
         _loc5_.graphics.endFill();
         _loc5_.x = param1;
         _loc5_.y = param2;
         _loc5_.rotation = _loc7_ * MathFunctions.Rad2Deg;
         return _loc5_;
      }
      
      internal function generateTutorialWindow(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         var _loc6_:* = new Sprite();
         var _loc7_:* = new EngineText(param1,0,13,"left",20,20,param2 - 40,495,true,true);
         _loc7_.height = _loc7_.textHeight + 5;
         var _loc10_:* = _loc7_.height + 80;
         _loc6_.graphics.beginFill(16777215);
         _loc6_.graphics.moveTo(0,10);
         _loc6_.graphics.curveTo(0,0,10,0);
         _loc6_.graphics.lineTo(param2 - 10,0);
         _loc6_.graphics.curveTo(param2,0,param2,10);
         _loc6_.graphics.lineTo(param2,_loc10_ - 10);
         _loc6_.graphics.curveTo(param2,_loc10_,param2 - 10,_loc10_);
         _loc6_.graphics.lineTo(10,_loc10_);
         _loc6_.graphics.curveTo(0,_loc10_,0,_loc10_ - 10);
         _loc6_.graphics.endFill();
         _loc6_.addChild(_loc7_);
         var _loc8_:* = new Switch(5,showTutorial,switchShowTutorial,switchShowTutorial,null,null,15,15,false,null,0);
         _loc8_.x = 20;
         _loc8_.y = _loc10_ - 37.5;
         _loc6_.addChild(_loc8_);
         var _loc9_:* = new EngineText(Texts.fetch(6837).toUpperCase(),0,13,"left",45,_loc10_ - 39.5,150,20);
         _loc6_.addChild(_loc9_);
         okButton.x = param2 - 160;
         okButton.y = _loc10_ - 40;
         _loc6_.addChild(okButton);
         _loc6_.x = param4;
         if(param3 == "bottom")
         {
            _loc6_.y = param5 - _loc10_;
         }
         else if(param3 == "middle")
         {
            _loc6_.y = param5 - _loc10_ / 2;
         }
         else
         {
            _loc6_.y = param5;
         }
         return _loc6_;
      }
      
      internal function switchShowTutorial() : *
      {
         showTutorial = !showTutorial;
      }
      
      internal function tutorialProceed(param1:* = null) : *
      {
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         if(mode == 1)
         {
            mapMode.musicFadeIn = true;
         }
         screenNode.removeChild(tutorialSprite);
         tutorialOn = false;
         if(onTutorialProceed is Function)
         {
            onTutorialProceed();
         }
      }
      
      internal function generateTutorialGrid(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         if(param1 != null && !(param1[0] is Array))
         {
            param1 = [param1];
         }
         tutorialMask.graphics.clear();
         tutorialMask.graphics.beginFill(255);
         if(param1 != null)
         {
            for(_loc4_ in param1)
            {
               tutorialMask.graphics.drawRect(param1[_loc4_][0],param1[_loc4_][1],param1[_loc4_][2] - param1[_loc4_][0],param1[_loc4_][3] - param1[_loc4_][1]);
            }
         }
         return tutorialGrid;
      }
      
      public function get soundFXControl() : *
      {
         return GameData.soundFXOn;
      }
      
      public function set soundFXControl(param1:*) : *
      {
         GameData.soundFXOn = param1;
      }
      
      public function get musicControl() : *
      {
         return GameData.musicOn;
      }
      
      public function set musicControl(param1:*) : *
      {
         GameData.musicOn = param1;
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         while(currentScreenContainer.numChildren > 0)
         {
            currentScreenContainer.removeChildAt(0);
         }
         screenNode.removeEventListener("menuSelect",contextMenuSelect);
         okButton.removeEventListener("click",tutorialProceed);
         if(navigationMode is NavigationScreen)
         {
            navigationMode.remove();
         }
         navigationMode = null;
         if(suspendedTownMode is TownMode)
         {
            suspendedTownMode.remove();
         }
         suspendedTownMode = null;
         if(caravanMenu is CaravanMenu)
         {
            caravanMenu.remove();
         }
         caravanMenu = null;
         if(currentScreenContainer != mapMode && currentScreenContainer.hasOwnProperty("remove"))
         {
            currentScreenContainer.remove();
         }
         if(mapMode is MapMode)
         {
            mapMode.remove();
         }
         mapMode = null;
         currentScreenContainer = null;
         if(travelModeMusic)
         {
            travelModeMusic.stop();
            travelModeMusic.removeEventListener("soundComplete",initMusic);
            musicPlaying = false;
            travelModeMusic = null;
         }
         GameData.currentGame = null;
         GameData.chargers = null;
         GameData.localStorageError = null;
         GameData.processedObjects = null;
         GameData.undeletableObjects = null;
         GameData.processedObjectsNames = null;
         DialogueScreen.lastStoryCreated = null;
         if(parent is Sprite)
         {
            parent.GD = null;
         }
         for(_loc1_ in Towns)
         {
            if(Towns[_loc1_] is Town)
            {
               Towns[_loc1_].remove();
               Towns[_loc1_] = null;
            }
         }
         for(_loc1_ in Caravans)
         {
            if(Caravans[_loc1_] is Caravan)
            {
               Caravans[_loc1_].remove();
               Caravans[_loc1_] = null;
            }
         }
         parent = null;
         screenNode = null;
         Caravans = null;
         Towns = null;
         Squares = null;
         factionRelations = null;
         revealedFactions = null;
         Story = null;
         routeStart = null;
         routeEnd = null;
         globalPrices = null;
         producedToday = null;
         lastSextantPos = null;
         missingRoutes = null;
         itemsToUpdate = null;
         knownPrices = null;
         currentScreenContainer = null;
         keepDialogues = null;
         waitBox = null;
         waitBoxText = null;
         batteriesToRemove = null;
         tutorialSprite = null;
         onTutorialProceed = null;
         tutorialGrid = null;
         tutorialMask = null;
         travelModeMusicControl = null;
         okButton = null;
         System.pauseForGCIfCollectionImminent(1);
         System.gc();
      }

      //- i think this was for the industry UI, should refactor
      public function pucciogetsellprice(param1:* = null, param2:* = null) : *
      {
         if(param1 == null || param2 == null)
         {
            return "";
         }
         var _locpuccio1_:* = 0;
         for(_locpuccio2_ in param1)
         {
            _locpuccio1_ += calculatePrice(Towns[param2],param1[_locpuccio2_].item,param1[_locpuccio2_].amount,false,null);
         }
         return " ($" + Math.round(_locpuccio1_) + ")";
      }
      
      public function pucciogetbuyprice(param1:* = null, param2:* = null) : *
      {
         if(param1 == null || param2 == null)
         {
            return "";
         }
         var _locpuccio1_:* = 0;
         for(_locpuccio2_ in param1)
         {
            _locpuccio1_ += calculatePrice(Towns[param2],param1[_locpuccio2_].item,param1[_locpuccio2_].amount,true,null);
         }
         return " ($" + Math.round(_locpuccio1_) + ")";
      }

      //- force forage expansion if consumption > production
      public function PuccioReSelectExpansion(possibleExpansions:*, selectedExpansion:*) : *
      {
         var forageProduction:* = 0;
         forageConsumption = 50;//-would kinda like to set to 100 to begin with to give it some margin
         puccioForageIndustryIndex = 0;
         result = selectedExpansion;
         for(j in possibleExpansions)
         {
            //locating forage industry and set production
            if(possibleExpansions[j].industry.production[0].item == 62)//could use id insted fo checking prod
            {
               forageProduction = possibleExpansions[j].industry.production[0].amount;
               puccioForageIndustryIndex = j;
            }
            //checking how much forage we consume
            for(k in possibleExpansions[j].industry.consumption)
            {
               if(possibleExpansions[j].industry.consumption[k].item == 62)
               {
                  forageConsumption += possibleExpansions[j].industry.consumption[k].amount;
               }
            }
         }
         //if we consume more than we produce, force upgrade to be Forage
         if(forageProduction != 0 && forageConsumption > forageProduction)
         {
            result = puccioForageIndustryIndex;
         }
         return result;
      }

      public function Config(key:*): Boolean {
         if(parent.puccioConfig[key] !== undefined && parent.puccioConfig[key] == true)
         {
            return true;
         }
         return false;
      }
   }
}

