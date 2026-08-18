package IsoEngine
{
   import Data.Texts;
   import flash.display.Sprite;
   
   public class Industry
   {
      
      public static const variablesToSave:* = ["type","employees","forSale","maxSize"];
      
      public static const Types:* = [{},{//-1 insect farming
         "name":1291,
         "consumption":[{
            "item":62,
            "amount":1
         },{
            "item":1,
            "amount":10
         }],
         "production":[{
            "item":45,
            "amount":5
         }],
         "electricityConsumption":0,
         "averageSalary":5,
         "fixedExpenses":5,
         "storagePerUnit":10,
         "price":250000
      },{//-2 sheep breeding
         "name":1308,
         "consumption":[{
            "item":62,
            "amount":56
         },{
            "item":1,
            "amount":32
         }],
         "production":[{
            "item":85,
            "amount":1.4
         },{
            "item":86,
            "amount":4.3
         },{
            "item":87,
            "amount":1.8
         },{
            "item":78,
            "amount":0.5
         },{
            "item":186,
            "amount":0.3
         }],
         "electricityConsumption":2,
         "averageSalary":22,
         "fixedExpenses":20,
         "storagePerUnit":20,
         "price":400000
      },{//-3 forage cultivation
         "name":1309,
         "consumption":[{
            "item":1,
            "amount":22
         }],
         "production":[{
            "item":62,
            "amount":72
         }],
         "electricityConsumption":0,
         "averageSalary":20,
         "fixedExpenses":20,
         "storagePerUnit":150,
         "price":500000
      },{//-4 goat breeding
         "name":1310,
         "consumption":[{
            "item":62,
            "amount":88
         },{
            "item":1,
            "amount":48
         }],
         "production":[{
            "item":83,
            "amount":2.2
         },{
            "item":84,
            "amount":9.7
         },{
            "item":87,
            "amount":0.7
         },{
            "item":78,
            "amount":0.7
         },{
            "item":186,
            "amount":0.1
         }],
         "electricityConsumption":2,
         "averageSalary":24,
         "fixedExpenses":20,
         "storagePerUnit":30,
         "price":400000
      },{//-5 cattle breeding
         "name":1311,
         "consumption":[{
            "item":62,
            "amount":184
         },{
            "item":1,
            "amount":120
         }],
         "production":[{
            "item":88,
            "amount":3.2
         },{
            "item":89,
            "amount":18.4
         },{
            "item":78,
            "amount":1.5
         },{
            "item":186,
            "amount":0.8
         }],
         "electricityConsumption":2.5,
         "averageSalary":30,
         "fixedExpenses":20,
         "storagePerUnit":50,
         "price":600000
      },{//-6 leather Production
         "name":1312,
         "consumption":[{
            "item":78,
            "amount":7
         },{
            "item":1,
            "amount":1
         }],
         "production":[{
            "item":90,
            "amount":4
         }],
         "electricityConsumption":10,
         "averageSalary":36,
         "fixedExpenses":20,
         "storagePerUnit":20,
         "price":300000
      },{//-7 shoes production
         "name":1313,
         "consumption":[{
            "item":90,
            "amount":1
         }],
         "production":[{
            "item":91,
            "amount":3
         }],
         "electricityConsumption":5,
         "averageSalary":38,
         "fixedExpenses":20,
         "storagePerUnit":15,
         "price":300000
      },{//-8 leather jackets production
         "name":1314,
         "consumption":[{
            "item":90,
            "amount":3
         }],
         "production":[{
            "item":92,
            "amount":1
         }],
         "electricityConsumption":10,
         "averageSalary":20,
         "fixedExpenses":10,
         "storagePerUnit":20,
         "price":400000
      },{//-9 water well
         "name":1290,
         "consumption":[],
         "production":[{
            "item":1,
            "amount":20
         }],
         "electricityConsumption":10,
         "averageSalary":0,
         "fixedExpenses":20,
         "storagePerUnit":40,
         "price":2500000,
         "replaceEmployeesBySize":true,
         "cantDownsize":true,
         "naturalResource":true
      },{//-10 cotton cultivation
         "name":1337,
         "consumption":[{
            "item":1,
            "amount":5
         }],
         "production":[{
            "item":93,
            "amount":3
         }],
         "electricityConsumption":0,
         "averageSalary":20,
         "fixedExpenses":50,
         "storagePerUnit":50,
         "price":250000
      },{//-11 cotton processing
         "name":1338,
         "consumption":[{
            "item":93,
            "amount":7.5
         }],
         "production":[{
            "item":94,
            "amount":6.7
         }],
         "electricityConsumption":10,
         "averageSalary":10,
         "fixedExpenses":5,
         "storagePerUnit":80,
         "price":500000
      },{//-12 wool processing
         "name":1339,
         "consumption":[{
            "item":87,
            "amount":7
         }],
         "production":[{
            "item":95,
            "amount":2.7
         }],
         "electricityConsumption":5,
         "averageSalary":24,
         "fixedExpenses":20,
         "storagePerUnit":20,
         "price":350000
      },{//-13 vest production
         "name":1340,
         "consumption":[{
            "item":94,
            "amount":2
         }],
         "production":[{
            "item":48,
            "amount":0.33
         },{
            "item":49,
            "amount":0.33
         },{
            "item":50,
            "amount":0.33
         },{
            "item":51,
            "amount":0.33
         },{
            "item":52,
            "amount":0.33
         },{
            "item":53,
            "amount":0.33
         }],
         "electricityConsumption":50,
         "averageSalary":28,
         "fixedExpenses":70,
         "storagePerUnit":20,
         "price":375000
      },{//-14 hats production
         "name":1342,
         "consumption":[{
            "item":95,
            "amount":1.5
         }],
         "production":[{
            "item":58,
            "amount":0.66
         },{
            "item":59,
            "amount":0.66
         },{
            "item":60,
            "amount":0.66
         }],
         "electricityConsumption":50,
         "averageSalary":32,
         "fixedExpenses":80,
         "storagePerUnit":20,
         "price":375000
      },{//-15 trousers production
         "name":1343,
         "consumption":[{
            "item":94,
            "amount":3
         }],
         "production":[{
            "item":96,
            "amount":1
         }],
         "electricityConsumption":50,
         "averageSalary":34,
         "fixedExpenses":80,
         "storagePerUnit":10,
         "price":400000
      },{//-16 leather vest production
         "name":1428,
         "consumption":[{
            "item":90,
            "amount":4
         }],
         "production":[{
            "item":54,
            "amount":2
         }],
         "electricityConsumption":10,
         "averageSalary":33,
         "fixedExpenses":35,
         "storagePerUnit":30,
         "price":350000
      },{//-17 oil drilling
         "name":1430,
         "consumption":[],
         "production":[{
            "item":98,
            "amount":20
         }],
         "electricityConsumption":50,
         "averageSalary":90,
         "fixedExpenses":200,
         "storagePerUnit":40,
         "price":1250000,
         "naturalResource":true
      },{//-18 oil refinery
         "name":1431,
         "consumption":[{
            "item":98,
            "amount":10
         }],
         "production":[{
            "item":64,
            "amount":5
         },{
            "item":79,
            "amount":0.4
         }],
         "electricityConsumption":60,
         "averageSalary":85,
         "fixedExpenses":520,
         "storagePerUnit":20,
         "price":2750000
      },{//-19 jackets production
         "name":1447,
         "consumption":[{
            "item":95,
            "amount":16
         }],
         "production":[{
            "item":99,
            "amount":1.5
         },{
            "item":100,
            "amount":1.5
         },{
            "item":101,
            "amount":1.5
         },{
            "item":102,
            "amount":1.5
         }],
         "electricityConsumption":8,
         "averageSalary":10,
         "fixedExpenses":2,
         "storagePerUnit":20,
         "price":300000
      },{//-20 pharmaceutics
         "name":1448,
         "consumption":[{
            "item":1,
            "amount":5
         }],
         "production":[{
            "item":63,
            "amount":8
         }],
         "electricityConsumption":30,
         "averageSalary":140,
         "fixedExpenses":350,
         "storagePerUnit":10,
         "price":1750000
      },{//-21 alcohol distillery
         "name":1571,
         "consumption":[{
            "item":62,
            "amount":10
         },{
            "item":1,
            "amount":20
         }],
         "production":[{
            "item":104,
            "amount":7
         }],
         "electricityConsumption":100,
         "averageSalary":30,
         "fixedExpenses":25,
         "storagePerUnit":20,
         "price":750000
      },{//-22 robbery
         "name":1636,
         "consumption":[],
         "production":[{
            "item":97,
            "amount":185
         }],
         "electricityConsumption":0,
         "averageSalary":70,
         "fixedExpenses":20,
         "storagePerUnit":0,
         "price":375000,
         "naturalResource":true
      },{//-23 bean cultivation
         "name":1639,
         "consumption":[{
            "item":1,
            "amount":3
         }],
         "production":[{
            "item":66,
            "amount":3.5
         }],
         "electricityConsumption":10,
         "averageSalary":20,
         "fixedExpenses":5,
         "storagePerUnit":20,
         "price":250000
      },{//-24 mushroom cultivation
         "name":1640,
         "consumption":[{
            "item":1,
            "amount":5
         }],
         "production":[{
            "item":67,
            "amount":5.5
         }],
         "electricityConsumption":10,
         "averageSalary":20,
         "fixedExpenses":6,
         "storagePerUnit":20,
         "price":275000
      },{//-25 potato cultivation
         "name":1641,
         "consumption":[{
            "item":1,
            "amount":3
         }],
         "production":[{
            "item":68,
            "amount":6
         }],
         "electricityConsumption":10,
         "averageSalary":20,
         "fixedExpenses":2,
         "storagePerUnit":30,
         "price":200000
      },{//-26 carrot cultivation
         "name":1642,
         "consumption":[{
            "item":1,
            "amount":3
         }],
         "production":[{
            "item":69,
            "amount":5
         }],
         "electricityConsumption":10,
         "averageSalary":20,
         "fixedExpenses":3,
         "storagePerUnit":20,
         "price":200000
      },{//-27 pea cultivation
         "name":1643,
         "consumption":[{
            "item":1,
            "amount":3
         }],
         "production":[{
            "item":70,
            "amount":3.4
         }],
         "electricityConsumption":10,
         "averageSalary":20,
         "fixedExpenses":3,
         "storagePerUnit":20,
         "price":250000
      },{//-28 tagelmust production
         "name":2865,
         "consumption":[{
            "item":94,
            "amount":12
         }],
         "production":[{
            "item":109,
            "amount":3
         },{
            "item":110,
            "amount":3
         },{
            "item":111,
            "amount":3
         }],
         "electricityConsumption":0,
         "averageSalary":5,
         "fixedExpenses":0,
         "storagePerUnit":40,
         "price":250000
      },{//-29 shirts production
         "name":2885,
         "consumption":[{
            "item":94,
            "amount":6
         }],
         "production":[{
            "item":114,
            "amount":3
         }],
         "electricityConsumption":50,
         "averageSalary":12,
         "fixedExpenses":5,
         "storagePerUnit":20,
         "price":350000
      },{//-30
         "name":2896,
         "consumption":[{
            "item":84,
            "amount":10
         }],
         "production":[{
            "item":115,
            "amount":1
         }],
         "electricityConsumption":0,
         "averageSalary":35,
         "fixedExpenses":30,
         "storagePerUnit":10,
         "price":425000
      },{//-31
         "name":2898,
         "consumption":[{
            "item":86,
            "amount":9
         }],
         "production":[{
            "item":116,
            "amount":1
         }],
         "electricityConsumption":0,
         "averageSalary":35,
         "fixedExpenses":30,
         "storagePerUnit":10,
         "price":450000
      },{//-32
         "name":2900,
         "consumption":[{
            "item":89,
            "amount":11
         }],
         "production":[{
            "item":117,
            "amount":1
         }],
         "electricityConsumption":0,
         "averageSalary":35,
         "fixedExpenses":30,
         "storagePerUnit":10,
         "price":400000
      },{//-33 jerboa breeding
         "name":2901,
         "consumption":[{
            "item":62,
            "amount":2
         },{
            "item":1,
            "amount":5
         }],
         "production":[{
            "item":75,
            "amount":2
         }],
         "electricityConsumption":5,
         "averageSalary":20,
         "fixedExpenses":50,
         "storagePerUnit":10,
         "price":300000
      },{//-34
         "name":2902,
         "consumption":[{
            "item":45,
            "amount":1
         },{
            "item":1,
            "amount":1
         }],
         "production":[{
            "item":71,
            "amount":1.5
         },{
            "item":72,
            "amount":2
         }],
         "electricityConsumption":0,
         "averageSalary":20,
         "fixedExpenses":25,
         "storagePerUnit":10,
         "price":350000
      },{//-35
         "name":2903,
         "consumption":[{
            "item":75,
            "amount":1
         },{
            "item":1,
            "amount":1.2
         }],
         "production":[{
            "item":73,
            "amount":1.2
         },{
            "item":74,
            "amount":2
         }],
         "electricityConsumption":0,
         "averageSalary":30,
         "fixedExpenses":25,
         "storagePerUnit":10,
         "price":400000
      },{//-36
         "name":4263,
         "consumption":[{
            "item":1,
            "amount":20
         }],
         "production":[{
            "item":165,
            "amount":5
         }],
         "electricityConsumption":0,
         "averageSalary":25,
         "fixedExpenses":10,
         "storagePerUnit":20,
         "price":500000
      },{//-37
         "name":4264,
         "consumption":[{
            "item":165,
            "amount":10
         }],
         "production":[{
            "item":94,
            "amount":12
         }],
         "electricityConsumption":10,
         "averageSalary":20,
         "fixedExpenses":10,
         "storagePerUnit":80,
         "price":625000
      },{//-38
         "name":5644,
         "consumption":[],
         "production":[{
            "item":184,
            "amount":1.25
         }],
         "electricityConsumption":10,
         "averageSalary":60,
         "fixedExpenses":20,
         "storagePerUnit":30,
         "price":1400000,
         "naturalResource":true
      },{//-39
         "name":5645,
         "consumption":[{
            "item":184,
            "amount":1.8
         },{
            "item":1,
            "amount":8
         }],
         "production":[{
            "item":185,
            "amount":1.1
         }],
         "electricityConsumption":100,
         "averageSalary":25,
         "fixedExpenses":15,
         "storagePerUnit":40,
         "price":1125000
      },{//-40
         "name":5646,
         "consumption":[{
            "item":186,
            "amount":0.5
         },{
            "item":185,
            "amount":0.07
         },{
            "item":1,
            "amount":0.2
         }],
         "production":[{
            "item":188,
            "amount":0.5
         }],
         "electricityConsumption":40,
         "averageSalary":35,
         "fixedExpenses":15,
         "storagePerUnit":35,
         "price":1250000
      },{//-41
         "name":5647,
         "consumption":[{
            "item":186,
            "amount":1
         },{
            "item":93,
            "amount":0.1
         }],
         "production":[{
            "item":187,
            "amount":30
         }],
         "electricityConsumption":10,
         "averageSalary":25,
         "fixedExpenses":30,
         "storagePerUnit":20,
         "price":1125000
      },{//-42
         "name":5648,
         "consumption":[{
            "item":186,
            "amount":3
         }],
         "production":[{
            "item":79,
            "amount":2
         }],
         "electricityConsumption":40,
         "averageSalary":25,
         "fixedExpenses":30,
         "storagePerUnit":20,
         "price":875000
      },{//-43
         "name":5679,
         "consumption":[{
            "item":93,
            "amount":0.2
         },{
            "item":1,
            "amount":2
         }],
         "production":[{
            "item":190,
            "amount":0.6
         }],
         "electricityConsumption":45,
         "averageSalary":50,
         "fixedExpenses":50,
         "storagePerUnit":10,
         "price":2375000
      },{//-44
         "name":5773,
         "consumption":[],
         "production":[{
            "item":195,
            "amount":17
         }],
         "electricityConsumption":15,
         "averageSalary":80,
         "fixedExpenses":10,
         "storagePerUnit":80,
         "price":1900000,
         "naturalResource":true
      },{//-45
         "name":5774,
         "consumption":[{
            "item":195,
            "amount":30
         }],
         "production":[{
            "item":196,
            "amount":3
         }],
         "electricityConsumption":25,
         "averageSalary":45,
         "fixedExpenses":70,
         "storagePerUnit":100,
         "price":2200000
      },{//-46
         "name":5775,
         "consumption":[{
            "item":196,
            "amount":4
         }],
         "production":[{
            "item":197,
            "amount":8
         }],
         "electricityConsumption":25,
         "averageSalary":40,
         "fixedExpenses":150,
         "storagePerUnit":10,
         "price":1900000
      }];
      
      public var type:*;
      
      public var employees:*;
      
      public var town:*;
      
      public var forSale:* = true;
      
      public var essential:* = false;
      
      public var maxSize:*;
      
      public var electricityProduction:* = 0;
      
      public var electricityConsumption:* = 0;
      
      public function Industry(param1:*, param2:*, param3:* = null)
      {
         super();
         type = param1;
         town = param3;
         employees = param2;
      }
      
      public function get naturalResource() : *
      {
         return Types[type].naturalResource;
      }
      
      public function get cantDownsize() : *
      {
         return Types[type].cantDownsize;
      }
      
      public function get storagePerUnit() : *
      {
         return Types[type].storagePerUnit;
      }
      
      public function get production() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:Array = [];
         for(_loc2_ in Types[type].production)
         {
            _loc1_.push({
               "item":Types[type].production[_loc2_].item,
               "amount":Types[type].production[_loc2_].amount * employees
            });
         }
         return _loc1_;
      }
      
      public function get consumption() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:Array = [];
         for(_loc2_ in Types[type].consumption)
         {
            _loc1_.push({
               "item":Types[type].consumption[_loc2_].item,
               "amount":Types[type].consumption[_loc2_].amount * employees
            });
         }
         return _loc1_;
      }
      
      public function get name() : *
      {
         return Texts.fetch(Types[type].name);
      }
      
      public function get pricePerUnit() : *
      {
         var _loc1_:* = 1;
         if(town is Town && town.GD is GameData && town.GD.difficulty == 1)
         {
            _loc1_ = 0.5;
         }
         return Types[type].price * (0.8 + town.wealthFactor * 0.2) * _loc1_;
      }
      
      public function get price() : *
      {
         var _loc1_:int = 1;
         if(essential)
         {
            _loc1_ = 3;
         }
         return pricePerUnit * employees * _loc1_;
      }
      
      public function get employeeSalary() : *
      {
         return Types[type].averageSalary * (0.8 + town.wealthFactor * 0.2);
      }
      
      public function get totalExpenses() : *
      {
         return (Types[type].electricityConsumption * town.electricityPrice + employeeSalary) * employees + Types[type].fixedExpenses;
      }
      
      public function get picture() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         switch(type)
         {
            case 1:
               return new IndustrySymbolInsectFarming();
            case 2:
               return new IndustrySymbolSheepBreeding();
            case 3:
               return new IndustrySymbolForageCultivation();
            case 4:
               return new IndustrySymbolGoatBreeding();
            case 5:
               return new IndustrySymbolCattleBreeding();
            case 6:
               return new IndustrySymbolLeatherProduction();
            case 7:
               return new IndustrySymbolShoesProduction();
            case 8:
               return new IndustrySymbolLeatherJacketProduction();
            case 9:
               _loc1_ = new Sprite();
               _loc2_ = new filtericonwater();
               _loc2_.scaleX = _loc2_.scaleY = 1.8;
               _loc1_.addChild(_loc2_);
               return _loc1_;
            case 10:
               return new IndustrySymbolCottonCultivation();
            case 11:
               return new IndustrySymbolCottonProcessing();
            case 12:
               return new IndustrySymbolWoolProcessing();
            case 13:
               return new IndustrySymbolVestsProduction();
            case 14:
               return new IndustrySymbolHatsProduction();
            case 15:
               return new IndustrySymbolTrousersProduction();
            case 16:
               return new IndustrySymbolLeatherVestsProduction();
            case 17:
               return new IndustrySymbolOilDrilling();
            case 18:
               return new IndustrySymbolOilRefinery();
            case 19:
               return new IndustrySymbolJacketsProduction();
            case 20:
               return new IndustrySymbolPharmaceutics();
            case 21:
               return new IndustrySymbolAlcoholDistillery();
            case 22:
               return new IndustrySymbolRobbery();
            case 23:
               return new IndustrySymbolBeansCultivation();
            case 24:
               return new IndustrySymbolMushroomsCultivation();
            case 25:
               return new IndustrySymbolPotatoesCultivation();
            case 26:
               return new IndustrySymbolCarrotsCultivation();
            case 27:
               return new IndustrySymbolPeasCultivation();
            case 28:
               return new IndustrySymbolTagelmust();
            case 29:
               return new IndustrySymbolShirtsProduction();
            case 30:
               return new IndustrySymbolGoatCheeseProduction();
            case 31:
               return new IndustrySymbolSheepCheeseProduction();
            case 32:
               return new IndustrySymbolCowCheeseProduction();
            case 33:
               return new IndustrySymbolJerboaBreeding();
            case 34:
               return new IndustrySymbolLizardBreeding();
            case 35:
               return new IndustrySymbolSnakeBreeding();
            case 36:
               return new IndustrySymbolCannabisCultivation();
            case 37:
               return new IndustrySymbolHempTextileProduction();
            case 38:
               return new IndustrySymbolSaltMining();
            case 39:
               return new IndustrySymbolLyeProduction();
            case 40:
               return new IndustrySymbolSoapProduction();
            case 41:
               return new IndustrySymbolCandlesProduction();
            case 42:
               return new IndustrySymbolTallowLubricantProduction();
            case 43:
               return new IndustrySymbolPaperProduction();
            case 44:
               return new IndustrySymbolLimestoneMining();
            case 45:
               return new IndustrySymbolLimeKiln();
            case 46:
               return new IndustrySymbolCementProduction();
            default:
               return new Sprite();
         }
      }
   }
}

