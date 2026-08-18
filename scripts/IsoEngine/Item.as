package IsoEngine
{
   import Data.*;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   
   public class Item
   {
      //categories
      //1 = good
      //2 = weapon
      //3 = ammo
      //4 = attachment
      //5 = armor
      public static var Items:* = [{//-0 idk
         "category":0,
         "subCategory":0
      },{//-1
         "category":1,
         "subCategory":1
      },{//-2
         "category":2,
         "subCategory":1
      },{//-3
         "category":2,
         "subCategory":2
      },{//-4
         "category":2,
         "subCategory":3
      },{//-5
         "category":2,
         "subCategory":4
      },{//-6
         "category":2,
         "subCategory":5
      },{//-7
         "category":2,
         "subCategory":6
      },{//-8
         "category":2,
         "subCategory":7
      },{//-9
         "category":2,
         "subCategory":8
      },{//-10 hatchet
         "category":2,
         "subCategory":9
      },{//-1
         "category":2,
         "subCategory":10
      },{//-1
         "category":2,
         "subCategory":11
      },{//-1
         "category":2,
         "subCategory":12
      },{//-1
         "category":2,
         "subCategory":13
      },{//-1
         "category":2,
         "subCategory":14
      },{//-1
         "category":2,
         "subCategory":15
      },{//-1
         "category":2,
         "subCategory":16
      },{//-1
         "category":2,
         "subCategory":17
      },{//-1
         "category":2,
         "subCategory":18
      },{//-2
         "category":2,
         "subCategory":19
      },{//-2
         "category":2,
         "subCategory":20
      },{//-2
         "category":2,
         "subCategory":21
      },{//-2
         "category":2,
         "subCategory":22
      },{//-2
         "category":2,
         "subCategory":23
      },{//-2
         "category":2,
         "subCategory":24
      },{//-2
         "category":2,
         "subCategory":25
      },{//-2
         "category":2,
         "subCategory":26
      },{//-2
         "category":2,
         "subCategory":27
      },{//-2
         "category":3,
         "subCategory":1
      },{//-3
         "category":3,
         "subCategory":2
      },{//-3
         "category":3,
         "subCategory":3
      },{//-3
         "category":3,
         "subCategory":4
      },{//-3
         "category":3,
         "subCategory":5
      },{//-3
         "category":3,
         "subCategory":6
      },{//-3
         "category":3,
         "subCategory":7
      },{//-3
         "category":3,
         "subCategory":8
      },{//-3
         "category":3,
         "subCategory":9
      },{//-3
         "category":3,
         "subCategory":10
      },{//-3
         "category":3,
         "subCategory":11
      },{//-40
         "category":3,
         "subCategory":12
      },{//-41
         "category":3,
         "subCategory":13
      },{//-42
         "category":1,
         "subCategory":2
      },{//-43
         "category":1,
         "subCategory":3
      },{//-44
         "category":1,
         "subCategory":4
      },{//-45 insects
         "category":1,
         "subCategory":15
      },{//-46
         "category":1,
         "subCategory":6
      },{//-47
         "category":4,
         "subCategory":1
      },{//-48
         "category":5,
         "subCategory":1
      },{//-49
         "category":5,
         "subCategory":2
      },{//-5
         "category":5,
         "subCategory":3
      },{//-5
         "category":5,
         "subCategory":4
      },{//-5
         "category":5,
         "subCategory":5
      },{//-5
         "category":5,
         "subCategory":6
      },{//-5
         "category":5,
         "subCategory":7
      },{//-5
         "category":5,
         "subCategory":8
      },{//-5
         "category":5,
         "subCategory":9
      },{//-5
         "category":5,
         "subCategory":10
      },{//-5
         "category":5,
         "subCategory":11
      },{//-5
         "category":5,
         "subCategory":12
      },{//-60
         "category":5,
         "subCategory":13
      },{//-61
         "category":2,
         "subCategory":28
      },{//-62 forage
         "category":1,
         "subCategory":7
      },{//-6
         "category":1,
         "subCategory":8
      },{//-6
         "category":1,
         "subCategory":9
      },{//-6
         "category":1,
         "subCategory":10
      },{//-6
         "category":1,
         "subCategory":11
      },{//-6
         "category":1,
         "subCategory":12
      },{//-6
         "category":1,
         "subCategory":13
      },{//-6
         "category":1,
         "subCategory":14
      },{//-7
         "category":1,
         "subCategory":5
      },{//-7
         "category":1,
         "subCategory":16
      },{//-7
         "category":1,
         "subCategory":17
      },{//-7
         "category":1,
         "subCategory":18
      },{//-7
         "category":1,
         "subCategory":19
      },{//-7
         "category":1,
         "subCategory":20
      },{//-7
         "category":1,
         "subCategory":21
      },{//-7
         "category":1,
         "subCategory":22
      },{//-7
         "category":1,
         "subCategory":23
      },{//-7
         "category":1,
         "subCategory":24
      },{//-8
         "category":1,
         "subCategory":25
      },{//-8
         "category":1,
         "subCategory":26
      },{//-8
         "category":1,
         "subCategory":27
      },{//-8
         "category":1,
         "subCategory":28
      },{//-8
         "category":1,
         "subCategory":29
      },{//-8
         "category":1,
         "subCategory":30
      },{//-8
         "category":1,
         "subCategory":31
      },{//-87? wool???
         "category":1,
         "subCategory":32
      },{//-88
         "category":1,
         "subCategory":33
      },{//-89
         "category":1,
         "subCategory":34
      },{//-9
         "category":1,
         "subCategory":35
      },{//-9
         "category":1,
         "subCategory":36
      },{//-9
         "category":5,
         "subCategory":14
      },{//-9
         "category":1,
         "subCategory":37
      },{//-9
         "category":1,
         "subCategory":38
      },{//-9
         "category":1,
         "subCategory":39
      },{//-9
         "category":1,
         "subCategory":40
      },{//-9
         "category":1,
         "subCategory":41
      },{//-9
         "category":1,
         "subCategory":42
      },{//-9
         "category":5,
         "subCategory":15
      },{//-10
         "category":5,
         "subCategory":16
      },{//-10
         "category":5,
         "subCategory":17
      },{//-10
         "category":5,
         "subCategory":18
      },{//-10
         "category":1,
         "subCategory":43
      },{//-10
         "category":1,
         "subCategory":44
      },{//-10
         "category":1,
         "subCategory":45
      },{//-10
         "category":1,
         "subCategory":46
      },{//-10
         "category":1,
         "subCategory":47
      },{//-10
         "category":2,
         "subCategory":29
      },{//-10
         "category":5,
         "subCategory":19
      },{//-11
         "category":5,
         "subCategory":20
      },{//-11
         "category":5,
         "subCategory":21
      },{//-11
         "category":1,
         "subCategory":48
      },{//-11
         "category":1,
         "subCategory":49
      },{//-11
         "category":1,
         "subCategory":50
      },{//-11
         "category":1,
         "subCategory":51
      },{//-11
         "category":1,
         "subCategory":52
      },{//-11
         "category":1,
         "subCategory":53
      },{//-11
         "category":1,
         "subCategory":54
      },{//-11
         "category":1,
         "subCategory":55
      },{//-120
         "category":2,
         "subCategory":30
      },{//-121
         "category":3,
         "subCategory":14
      },{//-122
         "category":3,
         "subCategory":15
      },{//-123
         "category":2,
         "subCategory":31
      },{//-124
         "category":2,
         "subCategory":32
      },{//-125
         "category":2,
         "subCategory":33
      },{//-126
         "category":3,
         "subCategory":16
      },{//-127
         "category":3,
         "subCategory":17
      },{//-128
         "category":2,
         "subCategory":34
      },{//-129
         "category":3,
         "subCategory":18
      },{//-130
         "category":3,
         "subCategory":19
      },{//-131
         "category":3,
         "subCategory":20
      },{//-132
         "category":1,
         "subCategory":56
      },{//-133
         "category":1,
         "subCategory":57
      },{//-134
         "category":1,
         "subCategory":58
      },{//-135
         "category":1,
         "subCategory":59
      },{//-136
         "category":1,
         "subCategory":60
      },{//-137
         "category":2,
         "subCategory":35
      },{//-138
         "category":2,
         "subCategory":36
      },{//-139
         "category":2,
         "subCategory":37
      },{//-140
         "category":1,
         "subCategory":61
      },{//-14
         "category":2,
         "subCategory":38
      },{//-14
         "category":2,
         "subCategory":39
      },{//-14
         "category":2,
         "subCategory":40
      },{//-14
         "category":3,
         "subCategory":21
      },{//-14
         "category":3,
         "subCategory":22
      },{//-14
         "category":2,
         "subCategory":41
      },{//-14
         "category":3,
         "subCategory":23
      },{//-14
         "category":3,
         "subCategory":24
      },{//-14
         "category":2,
         "subCategory":42
      },{//-15
         "category":3,
         "subCategory":25
      },{
         "category":3,
         "subCategory":26
      },{
         "category":5,
         "subCategory":22
      },{
         "category":5,
         "subCategory":23
      },{
         "category":1,
         "subCategory":62
      },{
         "category":1,
         "subCategory":63
      },{
         "category":1,
         "subCategory":64
      },{
         "category":1,
         "subCategory":65
      },{
         "category":1,
         "subCategory":66
      },{
         "category":1,
         "subCategory":67
      },{//-16
         "category":1,
         "subCategory":68
      },{
         "category":1,
         "subCategory":69
      },{
         "category":1,
         "subCategory":70
      },{
         "category":1,
         "subCategory":71
      },{
         "category":1,
         "subCategory":72
      },{
         "category":1,
         "subCategory":73
      },{
         "category":1,
         "subCategory":74
      },{//-167
         "category":1,
         "subCategory":75
      },{//-168
         "category":1,
         "subCategory":76
      },{//-169
         "category":1,
         "subCategory":77
      },{//-170
         "category":1,
         "subCategory":78
      },{
         "category":1,
         "subCategory":79
      },{
         "category":1,
         "subCategory":80
      },{
         "category":1,
         "subCategory":81
      },{
         "category":1,
         "subCategory":82
      },{
         "category":1,
         "subCategory":83
      },{
         "category":1,
         "subCategory":84
      },{
         "category":1,
         "subCategory":85
      },{
         "category":2,
         "subCategory":43
      },{
         "category":3,
         "subCategory":27
      },{//-18
         "category":3,
         "subCategory":28
      },{
         "category":2,
         "subCategory":44
      },{
         "category":3,
         "subCategory":29
      },{
         "category":3,
         "subCategory":30
      },{
         "category":1,
         "subCategory":86
      },{
         "category":1,
         "subCategory":87
      },{
         "category":1,
         "subCategory":88
      },{
         "category":1,
         "subCategory":89
      },{
         "category":1,
         "subCategory":90
      },{
         "category":1,
         "subCategory":91
      },{//-190
         "category":1,
         "subCategory":92
      },{
         "category":1,
         "subCategory":93
      },{
         "category":1,
         "subCategory":94
      },{
         "category":4,
         "subCategory":2
      },{
         "category":1,
         "subCategory":95
      },{
         "category":1,
         "subCategory":96
      },{
         "category":1,
         "subCategory":97
      },{
         "category":1,
         "subCategory":98
      },{
         "category":1,
         "subCategory":99
      },{
         "category":1,
         "subCategory":100
      },{//-200
         "category":5,
         "subCategory":24
      },{
         "category":5,
         "subCategory":25
      },{
         "category":5,
         "subCategory":26
      },{
         "category":2,
         "subCategory":45
      },{
         "category":3,
         "subCategory":31
      },{
         "category":1,
         "subCategory":101
      },{
         "category":1,
         "subCategory":102
      },{
         "category":1,
         "subCategory":103
      },{
         "category":1,
         "subCategory":104
      },{
         "category":2,
         "subCategory":46
      },{
         "category":3,
         "subCategory":32
      },{
         "category":3,
         "subCategory":33
      },{
         "category":5,
         "subCategory":27
      },{
         "category":2,
         "subCategory":47
      },{
         "category":4,
         "subCategory":3
      },{
         "category":4,
         "subCategory":4
      },{
         "category":4,
         "subCategory":5
      },{
         "category":1,
         "subCategory":105
      },{
         "category":1,
         "subCategory":106
      },{
         "category":1,
         "subCategory":107
      },{
         "category":4,
         "subCategory":6
      },{
         "category":1,
         "subCategory":108
      },{
         "category":1,
         "subCategory":109
      },{
         "category":1,
         "subCategory":110
      },{
         "category":1,
         "subCategory":111
      },{
         "category":1,
         "subCategory":112
      },{
         "category":1,
         "subCategory":113
      },{
         "category":1,
         "subCategory":114
      },{
         "category":1,
         "subCategory":115
      },{
         "category":1,
         "subCategory":116
      }];
      
      public static var Goods:* = [undefined,{//-1 water
         "name":14,
         "unit":"L",
         "weight":1,
         "liquid":true,
         "divisible":true,
         "price":1
      },{//-2
         "name":1054,
         "unit":"",
         "weight":0.75,
         "price":500,
         "firstAidKit":true,
         "divisible":false,
         "heal":5
      },{//-3
         "name":1055,
         "unit":"",
         "weight":2,
         "price":2000,
         "firstAidKit":true,
         "divisible":false,
         "heal":15
      },{//-4
         "name":1056,
         "unit":"",
         "weight":5,
         "price":4500,
         "firstAidKit":true,
         "divisible":false,
         "heal":50
      },{//-5
         "name":1145,
         "unit":"Kg",
         "weight":1,
         "price":30,
         "food":true,
         "taste":2,
         "divisible":true,
         "calories":810,
         "waterPercentage":0.8
      },{//-6
         "name":1057,
         "unit":"",
         "weight":0.02,
         "divisible":false,
         "price":10000
      },{//-7 forage
         "name":17,
         "unit":"Kg",
         "weight":1,
         "divisible":true,
         "price":3,
         "market":true
      },{//-8
         "name":16,
         "unit":"g",
         "weight":0.001,
         "divisible":true,
         "price":50,
         "market":true
      },{//-9
         "name":18,
         "unit":"L",
         "weight":0.8,
         "liquid":true,
         "divisible":true,
         "price":50,
         "market":true
      },{//-10
         "name":1210,
         "unit":"",
         "weight":0.35,
         "price":25,
         "liquidsContainer":true,
         "divisible":false,
         "volume":1
      },{//-11
         "name":1140,
         "unit":"Kg",
         "weight":1,
         "price":30,
         "food":true,
         "taste":1,
         "calories":310,
         "divisible":true,
         "waterPercentage":0.3
      },{//-12
         "name":1142,
         "unit":"Kg",
         "weight":1,
         "price":20,
         "food":true,
         "taste":4,
         "calories":220,
         "divisible":true,
         "waterPercentage":0.5
      },{//-13
         "name":1143,
         "unit":"Kg",
         "weight":1,
         "price":50,
         "food":true,
         "taste":0,
         "calories":770,
         "divisible":true,
         "waterPercentage":0.4
      },{//-14
         "name":1144,
         "unit":"Kg",
         "weight":1,
         "price":30,
         "food":true,
         "taste":0,
         "calories":520,
         "divisible":true,
         "waterPercentage":0.7
      },{//-15 insects
         "name":1058,
         "unit":"Kg",
         "weight":1,
         "price":30,
         "food":true,
         "taste":-3,
         "calories":1210,
         "divisible":true,
         "waterPercentage":0.4
      },{//-16
         "name":1147,
         "unit":"Kg",
         "weight":1,
         "price":85,
         "food":true,
         "taste":2,
         "calories":950,
         "divisible":true,
         "waterPercentage":0.4
      },{//-17
         "name":1148,
         "unit":"",
         "weight":0.01,
         "price":5,
         "food":true,
         "taste":5,
         "calories":14,
         "divisible":false,
         "waterPercentage":0.4
      },{//-18
         "name":1149,
         "unit":"Kg",
         "weight":1,
         "price":90,
         "food":true,
         "taste":2,
         "calories":930,
         "divisible":true,
         "waterPercentage":0.4
      },{//-19
         "name":1150,
         "unit":"",
         "weight":0.022,
         "price":4,
         "food":true,
         "taste":6,
         "calories":31,
         "divisible":false,
         "waterPercentage":0.3
      },{//-20
         "name":1151,
         "unit":"Kg",
         "weight":1,
         "price":80,
         "food":true,
         "taste":-1,
         "calories":1650,
         "divisible":true,
         "waterPercentage":0.4
      },{//-21
         "name":1165,
         "unit":"Kg",
         "weight":1,
         "price":40,
         "food":true,
         "taste":0,
         "calories":1750,
         "divisible":true,
         "waterPercentage":0.4
      },{//-22
         "name":1172,
         "unit":"L",
         "weight":1,
         "price":20,
         "food":true,
         "taste":0,
         "calories":440,
         "milk":true,
         "liquid":true,
         "divisible":true,
         "waterPercentage":0.89
      },{//-23
         "name":1174,
         "unit":"m²",
         "weight":1.8,
         "price":8,
         "divisible":true,
         "food":false,
         "market":true
      },{//-24
         "name":1177,
         "unit":"L",
         "weight":0.9,
         "price":35,
         "divisible":true,
         "liquid":true,
         "market":true
      },{//-25
         "name":1211,
         "unit":"",
         "weight":1.5,
         "price":220,
         "divisible":false,
         "liquidsContainer":true,
         "volume":5
      },{//-26
         "name":1238,
         "unit":"",
         "weight":95,
         "price":320000,
         "device":true,
         "consumption":[{
            "item":64,
            "amount":7.2
         }],
         "production":[],
         "divisible":false,
         "electricityProduction":1000
      },{//-27
         "name":1245,
         "unit":"",
         "weight":8,
         "price":650000,
         "device":true,
         "consumption":[],
         "production":[],
         "electricityConsumption":550,
         "divisible":false,
         "doctorImprove":0.7
      },{//-28
         "name":1253,
         "unit":"Kg",
         "weight":1,
         "price":40,
         "food":true,
         "taste":5,
         "calories":1750,
         "divisible":true,
         "waterPercentage":0.4
      },{//-29
         "name":1254,
         "unit":"L",
         "weight":1,
         "price":30,
         "food":true,
         "taste":3,
         "calories":600,
         "milk":true,
         "liquid":true,
         "divisible":true,
         "waterPercentage":0.89
      },{//-30
         "name":1300,
         "unit":"Kg",
         "weight":1,
         "price":45,
         "food":true,
         "taste":6,
         "calories":1830,
         "divisible":true,
         "waterPercentage":0.4
      },{//-31
         "name":1301,
         "unit":"L",
         "weight":1,
         "price":20,
         "food":true,
         "taste":1,
         "calories":950,
         "milk":true,
         "liquid":true,
         "divisible":true,
         "waterPercentage":0.89
      },{//-32 wool
         "name":1302,
         "unit":"Kg",
         "weight":1,
         "price":2,
         "divisible":true,
         "food":false,
         "market":true
      },{//-3
         "name":1303,
         "unit":"Kg",
         "weight":1,
         "price":50,
         "food":true,
         "taste":7,
         "calories":1740,
         "divisible":true,
         "waterPercentage":0.4
      },{//-3
         "name":1304,
         "unit":"L",
         "weight":1,
         "price":18,
         "food":true,
         "taste":2,
         "calories":660,
         "milk":true,
         "liquid":true,
         "divisible":true,
         "waterPercentage":0.89
      },{//-3
         "name":1305,
         "unit":"m²",
         "weight":1.5,
         "price":100,
         "divisible":true,
         "food":false,
         "market":true
      },{//-3
         "name":1306,
         "unit":"",
         "weight":0.8,
         "price":150,
         "shoes":true,
         "divisible":false,
         "food":false,
         "market":true
      },{//-3
         "name":1334,
         "unit":"Kg",
         "weight":1,
         "price":10,
         "divisible":true,
         "food":false,
         "market":true
      },{//-3
         "name":1335,
         "unit":"m²",
         "weight":0.13,
         "price":50,
         "divisible":true,
         "food":false,
         "market":true
      },{//-3
         "name":1336,
         "unit":"Kg",
         "weight":1,
         "price":5,
         "divisible":true,
         "food":false,
         "market":true
      },{//-4
         "name":1341,
         "unit":"",
         "weight":0.4,
         "price":80,
         "divisible":false,
         "lowerBodyClothing":true,
         "food":false,
         "market":true
      },{//-4
         "name":20,
         "unit":"",
         "weight":0,
         "price":1,
         "divisible":true,
         "food":false
      },{//-4
         "name":1429,
         "unit":"",
         "weight":0.9,
         "price":30,
         "divisible":true,
         "food":false,
         "liquid":true,
         "market":true
      },{//-4
         "name":1569,
         "unit":"",
         "weight":1.8,
         "price":200,
         "firstAidKit":true,
         "divisible":false,
         "heal":5
      },{//-4
         "name":1570,
         "unit":"",
         "weight":0.9,
         "price":50,
         "liquid":true,
         "divisible":true,
         "market":true
      },{//-4
         "name":2077,
         "unit":"",
         "weight":0.3,
         "price":0.01,
         "divisible":false,
         "book":true,
         "texts":[{
            "text":2077,
            "align":"center"
         },{
            "text":2076,
            "align":"left"
         },{
            "text":2075,
            "align":"left"
         },{
            "text":2074,
            "align":"left"
         },{
            "text":2073,
            "align":"left"
         },{
            "text":2072,
            "align":"center"
         },{
            "text":2071,
            "align":"left"
         },{
            "text":2070,
            "align":"left"
         },{
            "text":2069,
            "align":"left"
         },{
            "text":2068,
            "align":"left"
         },{
            "text":2067,
            "align":"left"
         }]
      },{//-4
         "name":1985,
         "unit":"",
         "weight":0.3,
         "price":0.01,
         "divisible":false,
         "book":true,
         "texts":[{
            "text":2821,
            "align":"center"
         },{
            "text":2820,
            "align":"left"
         },{
            "text":2819,
            "align":"left"
         },{
            "text":2818,
            "align":"left"
         },{
            "text":2817,
            "align":"left"
         },{
            "text":2816,
            "align":"left"
         },{
            "text":2815,
            "align":"left"
         }]
      },{//-4
         "name":2285,
         "unit":"",
         "weight":0.01,
         "price":0.01,
         "divisible":false,
         "book":true,
         "texts":[{
            "text":2286,
            "align":"left"
         }]
      },{//-4
         "name":2873,
         "unit":"",
         "weight":2.5,
         "price":420,
         "divisible":false,
         "liquidsContainer":true,
         "volume":10
      },{//-4
         "name":2874,
         "unit":"",
         "weight":4.5,
         "price":800,
         "divisible":false,
         "liquidsContainer":true,
         "volume":20
      },{//-5
         "name":2884,
         "unit":"",
         "weight":0.2,
         "price":50,
         "divisible":false,
         "upperBodyClothing":true,
         "food":false,
         "market":true
      },{//-5
         "name":2895,
         "unit":"Kg",
         "weight":1,
         "price":100,
         "food":true,
         "taste":9,
         "calories":3640,
         "milk":false,
         "liquid":false,
         "divisible":true,
         "waterPercentage":0.45
      },{//-5
         "name":2897,
         "unit":"Kg",
         "weight":1,
         "price":90,
         "food":true,
         "taste":10,
         "calories":3200,
         "milk":false,
         "liquid":false,
         "divisible":true,
         "waterPercentage":0.35
      },{//-5
         "name":2899,
         "unit":"Kg",
         "weight":1,
         "price":80,
         "food":true,
         "taste":9,
         "calories":3560,
         "milk":false,
         "liquid":false,
         "divisible":true,
         "waterPercentage":0.2
      },{//-5
         "name":3157,
         "unit":"",
         "weight":0.01,
         "price":0.01,
         "divisible":false,
         "book":false
      },{//-5
         "name":3652,
         "unit":"",
         "weight":0.3,
         "price":0.01,
         "divisible":false,
         "book":true,
         "texts":[{
            "text":3651,
            "align":"left"
         },{
            "text":3650,
            "align":"left"
         },{
            "text":3649,
            "align":"left"
         },{
            "text":3648,
            "align":"left"
         },{
            "text":3647,
            "align":"left"
         },{
            "text":3646,
            "align":"left"
         },{
            "text":3645,
            "align":"left"
         },{
            "text":3644,
            "align":"left"
         },{
            "text":3643,
            "align":"left"
         },{
            "text":3642,
            "align":"left"
         },{
            "text":3641,
            "align":"left"
         },{
            "text":3640,
            "align":"left"
         },{
            "text":3639,
            "align":"left"
         },{
            "text":3638,
            "align":"left"
         }]
      },{//-5
         "name":4207,
         "unit":"L",
         "weight":1,
         "price":20,
         "food":true,
         "taste":1,
         "calories":440,
         "milk":true,
         "liquid":true,
         "divisible":true,
         "waterPercentage":0.9
      },{//-5
         "name":4208,
         "unit":"Kg",
         "weight":1,
         "price":30,
         "food":true,
         "taste":2,
         "calories":1330,
         "divisible":true,
         "waterPercentage":0.4
      },{//-5
         "name":4212,
         "unit":"L",
         "weight":1,
         "price":15,
         "food":true,
         "taste":0,
         "calories":600,
         "milk":true,
         "liquid":true,
         "divisible":true,
         "waterPercentage":0.9
      },{//-5
         "name":4213,
         "unit":"Kg",
         "weight":1,
         "price":30,
         "food":true,
         "taste":1,
         "calories":980,
         "divisible":true,
         "waterPercentage":0.45
      },{//-6
         "name":4218,
         "unit":"",
         "weight":0.02,
         "price":800,
         "food":false,
         "divisible":false,
         "map":true,
         "towns":[23,24,25,26,27,28,29,30,31,32]
      },{//-6
         "name":4226,
         "unit":"",
         "weight":0.2,
         "price":15000,
         "food":false,
         "divisible":false,
         "sightAmplifier":true,
         "amplification":1.2,
         "huntingImprove":0.1
      },{//-6
         "name":4240,
         "unit":"",
         "weight":0.02,
         "price":15000,
         "divisible":false,
         "doctorImprove":0.2,
         "veterinaryImprove":0.2
      },{//-6
         "name":4242,
         "unit":"",
         "weight":0.05,
         "price":25000,
         "divisible":false,
         "doctorImprove":0.15,
         "veterinaryImprove":0.15,
         "mechanicImprove":0.05
      },{//-6
         "name":4243,
         "unit":"",
         "weight":0.1,
         "price":60000,
         "divisible":false,
         "doctorImprove":0.25,
         "veterinaryImprove":0.15
      },{//-6
         "name":4244,
         "unit":"",
         "weight":0.005,
         "price":10000,
         "divisible":false,
         "doctorImprove":0.15,
         "veterinaryImprove":0.1
      },{//-6
         "name":4245,
         "unit":"",
         "weight":0.1,
         "price":30000,
         "divisible":false,
         "veterinaryImprove":0.2
      },{//-6
         "name":4246,
         "unit":"",
         "weight":0.05,
         "price":10000,
         "divisible":false,
         "mechanicImprove":0.2
      },{//-6
         "name":4247,
         "unit":"",
         "weight":0.1,
         "price":100000,
         "divisible":false,
         "doctorImprove":0.15
      },{//-6
         "name":4248,
         "unit":"",
         "weight":0.25,
         "price":20000,
         "divisible":false,
         "mechanicImprove":0.15,
         "veterinaryImprove":0.05
      },{//-7
         "name":4249,
         "unit":"",
         "weight":0.15,
         "price":30000,
         "divisible":false,
         "mechanicImprove":0.25
      },{//-7
         "name":4250,
         "unit":"",
         "weight":0.03,
         "price":25000,
         "divisible":false,
         "doctorImprove":0.2,
         "veterinaryImprove":0.1
      },{//-7
         "name":4251,
         "unit":"",
         "weight":0.05,
         "price":30000,
         "divisible":false,
         "doctorImprove":0.03,
         "veterinaryImprove":0.25
      },{//-7
         "name":4265,
         "unit":"",
         "weight":1,
         "price":30000,
         "divisible":true,
         "market":true
      },{//-7
         "name":4266,
         "unit":"",
         "weight":0.02,
         "price":1500,
         "food":false,
         "divisible":false,
         "map":true,
         "pictureFrom":60,
         "towns":[35,36,37,38,39,40,41,42,43,44,45,49,50,51]
      },{//-7
         "name":4273,
         "unit":"",
         "weight":0.6,
         "price":2800,
         "divisible":false,
         "liquidsContainer":true,
         "volume":10
      },{//-76
         "name":4274,
         "unit":"",
         "weight":1,
         "price":5000,
         "divisible":false,
         "liquidsContainer":true,
         "volume":20
      },{//-77
         "name":4275,
         "unit":"",
         "weight":21,
         "price":20000,
         "divisible":false,
         "liquidsContainer":true,
         "volume":208
      },{//-78
         "name":4276,
         "unit":"",
         "weight":8,
         "price":90000,
         "divisible":false,
         "liquidsContainer":true,
         "volume":208
      },{//-79
         "name":4386,
         "unit":"",
         "weight":5.3,
         "price":0.01,
         "divisible":false
      },{//-80
         "name":4672,
         "description":4673,
         "unit":"",
         "weight":1.4,
         "price":5,
         "divisible":false
      },{
         "name":4776,
         "unit":"",
         "weight":0.01,
         "price":0.01,
         "description":4966,
         "divisible":false,
         "book":false
      },{
         "name":4777,
         "unit":"Kg",
         "weight":1,
         "price":0.01,
         "taste":5,
         "calories":1800,
         "divisible":true,
         "waterPercentage":0.4
      },{
         "name":4965,
         "unit":"",
         "weight":12,
         "price":3,
         "description":4967,
         "divisible":false,
         "book":false
      },{
         "name":4998,
         "unit":"",
         "weight":0.3,
         "price":0.01,
         "divisible":false,
         "book":true,
         "texts":[{
            "text":4997,
            "align":"center"
         },{
            "text":4996,
            "align":"left"
         },{
            "text":4995,
            "align":"left"
         },{
            "text":4994,
            "align":"left"
         },{
            "text":4993,
            "align":"left"
         },{
            "text":4992,
            "align":"left"
         }]
      },{
         "name":5000,
         "unit":"",
         "weight":0.15,
         "price":0.01,
         "divisible":false,
         "book":false
      },{
         "name":5638,
         "unit":"Kg",
         "weight":1,
         "price":150,
         "divisible":true,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5639,
         "unit":"Kg",
         "weight":1,
         "price":350,
         "divisible":true,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5640,
         "unit":"Kg",
         "weight":1,
         "price":5,
         "divisible":true,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5641,
         "unit":"",
         "weight":0.02,
         "price":50,
         "divisible":false,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5643,
         "unit":"Kg",
         "weight":1,
         "price":550,
         "divisible":true,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5656,
         "unit":"",
         "weight":0.02,
         "price":1500,
         "food":false,
         "divisible":false,
         "map":true,
         "pictureFrom":60,
         "towns":[53]
      },{
         "name":5678,
         "unit":"m2",
         "weight":0.08,
         "price":150,
         "divisible":true,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5709,
         "description":5710,
         "unit":"",
         "weight":0.2,
         "price":50,
         "divisible":false
      },{
         "name":5711,
         "description":5712,
         "unit":"",
         "weight":0.15,
         "price":10,
         "divisible":false
      },{
         "name":5767,
         "description":5768,
         "unit":"",
         "weight":18.5,
         "price":100,
         "divisible":false
      },{
         "name":5770,
         "unit":"Kg",
         "weight":1,
         "price":150,
         "divisible":true,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5771,
         "unit":"Kg",
         "weight":1,
         "price":350,
         "divisible":true,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5772,
         "unit":"Kg",
         "weight":1,
         "price":550,
         "divisible":true,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":5786,
         "unit":"",
         "weight":1.6,
         "price":158600,
         "device":true,
         "consumption":[],
         "production":[],
         "electricityConsumption":240,
         "divisible":false,
         "food":false,
         "liquid":false
      },{
         "name":5884,
         "description":5885,
         "unit":"",
         "weight":0.03,
         "price":0,
         "divisible":false
      },{
         "name":6225,
         "unit":"g",
         "weight":0.001,
         "price":400,
         "divisible":false,
         "food":false,
         "liquid":false,
         "market":true
      },{
         "name":6640,
         "unit":"",
         "weight":0.02,
         "price":800,
         "food":false,
         "divisible":false,
         "map":true,
         "pictureFrom":60,
         "towns":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,54,55,56,57,58,59,62]
      },{
         "name":5656,
         "unit":"",
         "weight":0.02,
         "price":800,
         "food":false,
         "divisible":false,
         "map":true,
         "pictureFrom":60,
         "towns":[53,60,61,63,64,65,66,67,70,71,72,73,74,75,76,77,78,79,80,81,82]
      },{
         "name":6728,
         "description":6729,
         "unit":"",
         "weight":198,
         "price":200,
         "divisible":false
      },{
         "name":6819,
         "unit":"",
         "weight":0.2,
         "price":200000,
         "device":true,
         "consumption":[],
         "production":[],
         "electricityConsumption":150,
         "divisible":false,
         "description":6824,
         "batteryCharge":4
      },{
         "name":6820,
         "unit":"",
         "weight":0.05,
         "price":7500,
         "divisible":false
      },{
         "name":6821,
         "unit":"",
         "weight":0.05,
         "price":10000,
         "divisible":false
      },{
         "name":6828,
         "unit":"",
         "weight":12,
         "price":450000,
         "device":true,
         "consumption":[],
         "production":[],
         "divisible":false,
         "electricityProduction":120
      },{
         "name":6829,
         "unit":"",
         "weight":0.8,
         "price":250000,
         "device":true,
         "consumption":[],
         "production":[],
         "electricityConsumption":150,
         "divisible":false,
         "doctorImprove":0.4
      },{
         "name":6830,
         "unit":"",
         "weight":7.5,
         "price":750000,
         "device":true,
         "consumption":[],
         "production":[],
         "electricityConsumption":850,
         "divisible":false,
         "doctorImprove":0.8
      },{
         "name":6831,
         "unit":"",
         "weight":2.3,
         "price":650000,
         "device":true,
         "consumption":[],
         "production":[],
         "electricityConsumption":350,
         "divisible":false,
         "doctorImprove":0.5,
         "veterinaryImprove":0.4
      },{
         "name":6832,
         "unit":"",
         "weight":19.8,
         "price":1800000,
         "device":true,
         "consumption":[],
         "production":[],
         "electricityConsumption":950,
         "divisible":false,
         "sightAmplifier":true,
         "amplification":5
      },{
         "name":6833,
         "unit":"",
         "weight":0.05,
         "price":120000,
         "divisible":false,
         "doctorImprove":0.15,
         "veterinaryImprove":0.1
      },{
         "name":6834,
         "unit":"",
         "weight":0.8,
         "price":350000,
         "divisible":false,
         "sightAmplifier":true,
         "amplification":1.8,
         "huntingImprove":0.2
      },{
         "name":6835,
         "unit":"",
         "weight":12,
         "price":1200000,
         "device":true,
         "consumption":[],
         "production":[],
         "electricityConsumption":5500,
         "divisible":false,
         "mechanicImprove":1
      },{
         "name":6899,
         "unit":"",
         "weight":0.02,
         "price":200,
         "food":false,
         "divisible":false,
         "map":true,
         "pictureFrom":60,
         "towns":[16,17,18,19,20]
      }];
      
      public static var Armor:* = [undefined,{
         "name":1059,
         "type":1,
         "armor":2,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":128,
            "g":20,
            "b":20,
            "bc":1
         },
         "price":100,
         "upperBodyClothing":true,
         "weight":0.4,
         "changeBody":[4,6]
      },{
         "name":1060,
         "type":1,
         "armor":2,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":128,
            "g":64,
            "b":30,
            "bc":1
         },
         "price":100,
         "upperBodyClothing":true,
         "weight":0.4,
         "changeBody":[4,6]
      },{
         "name":1061,
         "type":1,
         "armor":2,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":164,
            "g":172,
            "b":96,
            "bc":1
         },
         "price":100,
         "upperBodyClothing":true,
         "weight":0.4,
         "changeBody":[4,6]
      },{
         "name":1062,
         "type":1,
         "armor":2,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":96,
            "g":128,
            "b":64,
            "bc":1
         },
         "price":100,
         "upperBodyClothing":true,
         "weight":0.4,
         "changeBody":[4,6]
      },{
         "name":1063,
         "type":1,
         "armor":2,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":96,
            "g":128,
            "b":148,
            "bc":1
         },
         "price":100,
         "upperBodyClothing":true,
         "weight":0.4,
         "changeBody":[4,6]
      },{
         "name":1064,
         "type":1,
         "armor":2,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":96,
            "g":64,
            "b":110,
            "bc":1
         },
         "price":100,
         "upperBodyClothing":true,
         "weight":0.4,
         "changeBody":[4,6]
      },{
         "name":1065,
         "type":1,
         "armor":3,
         "explosionResistance":1,
         "fireResistance":2,
         "color":{
            "r":36,
            "g":32,
            "b":24,
            "bc":1
         },
         "price":200,
         "upperBodyClothing":true,
         "weight":0.7,
         "changeBody":[4,6]
      },{
         "name":1066,
         "type":1,
         "armor":2,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":100,
            "g":100,
            "b":100,
            "bc":1
         },
         "price":100,
         "upperBodyClothing":true,
         "weight":0.4,
         "changeBody":[4,6]
      },{
         "name":1067,
         "type":1,
         "armor":1,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":0,
            "g":0,
            "b":0,
            "bc":1
         },
         "price":100,
         "upperBodyClothing":true,
         "weight":0.4,
         "changeBody":[4,6]
      },{
         "name":1068,
         "type":2,
         "armor":1,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":100,
            "g":100,
            "b":100,
            "bc":1
         },
         "hat":true,
         "price":40,
         "weight":0.2,
         "changeHead":6
      },{
         "name":1069,
         "type":2,
         "armor":1,
         "explosionResistance":0,
         "fireResistance":0,
         "color":{
            "r":0,
            "g":0,
            "b":0,
            "bc":1
         },
         "hat":true,
         "price":40,
         "weight":0.2,
         "changeHead":6
      },{
         "name":1070,
         "type":2,
         "armor":1,
         "explosionResistance":0,
         "fireResistance":0,
         "color":{
            "r":48,
            "g":36,
            "b":30,
            "bc":1.8
         },
         "hat":true,
         "price":40,
         "weight":0.2,
         "changeHead":6
      },{
         "name":1071,
         "type":2,
         "armor":1,
         "explosionResistance":0,
         "fireResistance":0,
         "color":{
            "r":200,
            "g":190,
            "b":180,
            "bc":1.1
         },
         "hat":true,
         "price":40,
         "weight":0.2,
         "changeHead":6
      },{
         "name":1307,
         "type":1,
         "armor":6,
         "explosionResistance":5,
         "fireResistance":8,
         "color":{
            "r":36,
            "g":32,
            "b":24,
            "bc":1
         },
         "price":250,
         "upperBodyClothing":true,
         "weight":2,
         "changeForearm":3,
         "changeTopArm":1,
         "changeBody":[4,6]
      },{
         "name":1449,
         "type":1,
         "armor":4,
         "explosionResistance":1,
         "fireResistance":2,
         "color":{
            "r":100,
            "g":120,
            "b":150,
            "bc":0.7
         },
         "price":50,
         "upperBodyClothing":true,
         "weight":1.2,
         "changeForearm":3,
         "changeTopArm":1,
         "changeBody":[4,6]
      },{
         "name":1450,
         "type":1,
         "armor":4,
         "explosionResistance":1,
         "fireResistance":2,
         "color":{
            "r":230,
            "g":210,
            "b":200,
            "bc":1.1
         },
         "price":50,
         "upperBodyClothing":true,
         "weight":1.2,
         "changeForearm":3,
         "changeTopArm":1,
         "changeBody":[4,6]
      },{
         "name":1451,
         "type":1,
         "armor":4,
         "explosionResistance":1,
         "fireResistance":2,
         "color":{
            "r":96,
            "g":128,
            "b":64,
            "bc":1
         },
         "price":50,
         "upperBodyClothing":true,
         "weight":1.2,
         "changeForearm":3,
         "changeTopArm":1,
         "changeBody":[4,6]
      },{
         "name":1452,
         "type":1,
         "armor":4,
         "explosionResistance":1,
         "fireResistance":2,
         "color":{
            "r":130,
            "g":70,
            "b":30,
            "bc":1.1
         },
         "price":50,
         "upperBodyClothing":true,
         "weight":1.2,
         "changeForearm":3,
         "changeTopArm":1,
         "changeBody":[4,6]
      },{
         "name":2851,
         "type":2,
         "armor":1,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":210,
            "g":210,
            "b":210,
            "bc":1
         },
         "hat":true,
         "price":20,
         "weight":0.26,
         "changeHead":7,
         "changeBackHair":0,
         "changeBeard":0
      },{
         "name":2852,
         "type":2,
         "armor":1,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":60,
            "g":90,
            "b":140,
            "bc":1
         },
         "hat":true,
         "price":20,
         "weight":0.26,
         "changeHead":7,
         "changeBackHair":0,
         "changeBeard":0
      },{
         "name":2853,
         "type":2,
         "armor":1,
         "explosionResistance":0,
         "fireResistance":1,
         "color":{
            "r":0,
            "g":0,
            "b":0,
            "bc":1
         },
         "hat":true,
         "price":20,
         "weight":0.26,
         "changeHead":7,
         "changeBackHair":0,
         "changeBeard":0
      },{
         "name":4238,
         "type":1,
         "armor":18,
         "explosionResistance":15,
         "fireResistance":5,
         "color":{
            "r":100,
            "g":90,
            "b":80,
            "bc":1
         },
         "price":55000,
         "weight":12,
         "changeBody":7
      },{
         "name":4239,
         "type":2,
         "armor":8,
         "explosionResistance":8,
         "fireResistance":5,
         "color":{
            "r":100,
            "g":90,
            "b":80,
            "bc":1
         },
         "price":23000,
         "weight":4,
         "changeHead":8
      },{
         "name":6055,
         "type":1,
         "armor":20,
         "explosionResistance":12,
         "fireResistance":8,
         "color":{
            "r":209,
            "g":191,
            "b":163,
            "bc":1
         },
         "price":115000,
         "weight":6,
         "changeBody":8
      },{
         "name":6056,
         "type":2,
         "armor":7,
         "explosionResistance":7,
         "fireResistance":4,
         "color":{
            "r":179,
            "g":163,
            "b":121,
            "bc":1
         },
         "price":58000,
         "weight":1.5,
         "changeHead":9
      },{
         "name":6057,
         "type":2,
         "armor":10,
         "explosionResistance":12,
         "fireResistance":7,
         "color":{
            "r":30,
            "g":30,
            "b":30,
            "bc":1
         },
         "price":69000,
         "weight":1.5,
         "changeHead":10,
         "changeBeard":0
      },{
         "name":6781,
         "type":2,
         "armor":5,
         "explosionResistance":2,
         "fireResistance":2,
         "color":{
            "r":92,
            "g":83,
            "b":71,
            "bc":1
         },
         "price":11000,
         "weight":1.2,
         "changeHead":11
      }];
      
      public var type:*;
      
      public var _amount:*;
      
      public var inUse:* = 0;
      
      public var averagePrice:*;
      
      public var originallyBelongedTo:*;
      
      public function Item(param1:*, param2:* = 0)
      {
         super();
         type = param1;
         amount = param2;
      }
      
      public static function getDataFromType(param1:*) : *
      {
         switch(Items[param1].category)
         {
            case 1:
               return Goods[Items[param1].subCategory];
            case 2:
               return WeaponsData.Weapons[Items[param1].subCategory];
            case 3:
               return WeaponsData.Ammo[Items[param1].subCategory];
            case 4:
               return WeaponsData.Attachments[Items[param1].subCategory];
            case 5:
               return Armor[Items[param1].subCategory];
            default:
               return;
         }
      }
      
      public static function itemNumFromCatSubCat(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         for(_loc3_ in Items)
         {
            if(Items[_loc3_].category == param1 && Items[_loc3_].subCategory == param2)
            {
               return _loc3_;
            }
         }
      }
      
      public function get amount() : *
      {
         if(!divisible)
         {
            return Math.round(_amount);
         }
         if(_amount > 0 && _amount < 0.05)
         {
            return 0.1;
         }
         return Math.round(_amount * 10) / 10;
      }
      
      public function set amount(param1:*) : *
      {
         _amount = param1;
      }
      
      public function get category() : *
      {
         return Items[type].category;
      }
      
      public function get subCategory() : *
      {
         return Items[type].subCategory;
      }
      
      public function get itemData() : *
      {
         return getDataFromType(type);
      }
      
      public function get weaponType() : *
      {
         if(category == 2)
         {
            return WeaponsData.WeaponTypes[itemData.type];
         }
         return false;
      }
      
      public function get name() : *
      {
         if(category == 3)
         {
            return Texts.fetch(WeaponsData.Calibers[itemData.type].name) + " " + Texts.fetch(itemData.variation);
         }
         if(itemData.additionalNameText > 0)
         {
            return Texts.fetch(itemData.name) + " - " + Texts.fetch(itemData.additionalNameText);
         }
         return Texts.fetch(itemData.name);
      }
      
      public function get weightPerUnit() : *
      {
         if(category == 3)
         {
            return (itemData.projectileMass + WeaponsData.Calibers[itemData.type].caseAndPropellantWeight) / 1000;
         }
         return itemData.weight;
      }
      
      public function get filterCategory() : *
      {
         var _loc1_:* = undefined;
         if(category == 2)
         {
            _loc1_ = 0;
         }
         else if(category == 3)
         {
            _loc1_ = 1;
         }
         else if(category == 4)
         {
            _loc1_ = 2;
         }
         else if(category == 5)
         {
            _loc1_ = 3;
         }
         else if(category == 1)
         {
            if(itemData.food)
            {
               _loc1_ = 4;
            }
            else if(itemData.device)
            {
               _loc1_ = 5;
            }
            else if(itemData.firstAidKit)
            {
               _loc1_ = 6;
            }
            else if(itemData.liquid)
            {
               _loc1_ = 7;
            }
            else if(itemData.liquidsContainer)
            {
               _loc1_ = 8;
            }
            else
            {
               _loc1_ = 9;
            }
         }
         return _loc1_;
      }
      
      public function get description() : *
      {
         if(itemData.description != undefined)
         {
            return Texts.fetch(itemData.description);
         }
      }
      
      public function get totalWeight() : *
      {
         return weightPerUnit * amount;
      }
      
      public function get shotgunAmmo() : *
      {
         if(category == 3)
         {
            return WeaponsData.Calibers[itemData.type].shotgun;
         }
      }
      
      public function get bulletDiameter() : *
      {
         if(category == 3)
         {
            if(shotgunAmmo)
            {
               return itemData.bulletDiameter;
            }
            return WeaponsData.Calibers[itemData.type].bulletDiameter;
         }
      }
      
      public function get SD() : *
      {
         if(category == 3)
         {
            return itemData.projectileMass * 1.422 / Math.pow(bulletDiameter,2);
         }
      }
      
      public function get BC() : *
      {
         if(category == 3)
         {
            return itemData.FF * SD;
         }
      }
      
      public function get velocityLoss() : *
      {
         if(category == 3)
         {
            return (1 / (BC * 25) - 0.02) / 100;
         }
      }
      
      public function get divisible() : *
      {
         if(category == 1)
         {
            return itemData.divisible;
         }
         return false;
      }
      
      public function get picture() : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc1_:* = undefined;
         var _loc9_:* = undefined;
         _loc9_ = undefined;
         _loc7_ = undefined;
         var _loc8_:* = undefined;
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         var _loc6_:* = undefined;
         if(category == 1)
         {
            if(itemData.pictureFrom != undefined && subCategory != 17)
            {
               _loc1_ = new ImportedBitmap("itemIcon" + itemData.pictureFrom + ".png");
               _loc1_.smoothing = true;
            }
            else if(subCategory == 16 || subCategory == 17 || subCategory == 18 || subCategory == 19 || subCategory == 20 || subCategory == 21 || subCategory == 28 || subCategory == 30 || subCategory == 33 || subCategory == 57 || subCategory == 59 || subCategory == 82 || subCategory == 51 || subCategory == 52 || subCategory == 53)
            {
               switch(subCategory)
               {
                  case 16:
                  case 17:
                     _loc9_ = new IndustrySymbolLizardBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 18:
                  case 19:
                     _loc9_ = new IndustrySymbolSnakeBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 20:
                     _loc9_ = new IndustrySymbolJerboaBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 21:
                     _loc9_ = new filtericonanimals();
                     _loc9_.scaleX = _loc9_.scaleY = 1.75;
                     break;
                  case 28:
                  case 51:
                     _loc9_ = new IndustrySymbolGoatBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 30:
                  case 52:
                     _loc9_ = new IndustrySymbolSheepBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 33:
                  case 53:
                     _loc9_ = new IndustrySymbolCattleBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 57:
                     _loc9_ = new filtericonhorse();
                     _loc9_.scaleX = _loc9_.scaleY = 1.75;
                     break;
                  case 59:
                     _loc9_ = new filtericoncamel();
                     _loc9_.scaleX = _loc9_.scaleY = 1.75;
                     break;
                  case 82:
                     _loc9_ = new filtericonperson();
                     _loc9_.scaleX = _loc9_.scaleY = 1.75;
               }
               _loc9_.transform.colorTransform = new ColorTransform(0,0,0,1,255,255,255,0);
               _loc1_ = new Sprite();
               _loc9_.x = 125;
               _loc9_.y = 50;
               _loc9_.alpha = 0.5;
               _loc1_.addChild(_loc9_);
               if(subCategory == 17 || subCategory == 19)
               {
                  _loc1_.addChild(new ImportedBitmap("itemIcon17.png"));
               }
               else if(subCategory == 51 || subCategory == 52 || subCategory == 53)
               {
                  _loc1_.addChild(new ImportedBitmap("itemIcon51.png"));
               }
               else
               {
                  _loc1_.addChild(new ImportedBitmap("meat.png"));
               }
            }
            else if(subCategory == 22 || subCategory == 29 || subCategory == 31 || subCategory == 34 || subCategory == 56 || subCategory == 58)
            {
               switch(subCategory)
               {
                  case 22:
                     _loc9_ = new filtericonanimals();
                     _loc9_.scaleX = _loc9_.scaleY = 1.75;
                     break;
                  case 29:
                     _loc9_ = new IndustrySymbolGoatBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 31:
                     _loc9_ = new IndustrySymbolSheepBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 34:
                     _loc9_ = new IndustrySymbolCattleBreeding();
                     _loc9_.scaleX = _loc9_.scaleY = 0.7;
                     break;
                  case 56:
                     _loc9_ = new filtericonhorse();
                     _loc9_.scaleX = _loc9_.scaleY = 1.75;
                     break;
                  case 58:
                     _loc9_ = new filtericoncamel();
                     _loc9_.scaleX = _loc9_.scaleY = 1.75;
               }
               _loc9_.transform.colorTransform = new ColorTransform(0,0,0,1,20,15,0,0);
               _loc1_ = new Sprite();
               _loc9_.x = 125;
               _loc9_.y = 140;
               _loc9_.alpha = 0.9;
               _loc1_.addChild(new ImportedBitmap("milk.png"));
               _loc1_.addChild(_loc9_);
            }
            else if(subCategory == 107 || subCategory == 106)
            {
               _loc1_ = new Sprite();
               _loc1_.addChild(new ImportedBitmap("itemIcon106.png"));
               _loc9_ = new Sprite();
               if(subCategory == 106)
               {
                  _loc9_.graphics.lineStyle(1,11534336,0.8);
               }
               else
               {
                  _loc9_.graphics.lineStyle(1,5062143,0.8);
               }
               _loc9_.graphics.moveTo(-20,-10);
               _loc9_.graphics.lineTo(20,-10);
               _loc9_.graphics.lineTo(20,-5);
               _loc9_.graphics.lineTo(25,-5);
               _loc9_.graphics.lineTo(25,5);
               _loc9_.graphics.lineTo(20,5);
               _loc9_.graphics.lineTo(20,10);
               _loc9_.graphics.lineTo(-20,10);
               _loc9_.graphics.lineTo(-20,-10);
               if(subCategory == 107)
               {
                  _loc9_.graphics.beginFill(5062143,0.8);
                  _loc9_.graphics.drawRect(-15,-5,30,10);
               }
               _loc9_.x = 30;
               _loc9_.y = 220;
               _loc1_.addChild(_loc9_);
            }
            else if(ApplicationDomain.currentDomain.hasDefinition("itemIcon" + subCategory + ".png"))
            {
               _loc1_ = new ImportedBitmap("itemIcon" + subCategory + ".png");
               _loc1_.smoothing = true;
            }
            else
            {
               _loc1_ = new Sprite();
               _loc1_.addChild(new EngineText(name.toUpperCase(),16777215,30,"center",10,70,230,40));
               _loc1_.addChild(new EngineText("This temporary version of the game does not contain graphics for this item",16777215,14,"center",20,120,210,100,true,true));
            }
         }
         else if(category == 2)
         {
            if(itemData.pictureFrom > 0)
            {
               _loc1_ = WeaponsData.getWeaponIcon(itemData.pictureFrom);
            }
            else
            {
               _loc1_ = WeaponsData.getWeaponIcon(subCategory);
            }
            _loc1_.smoothing = true;
         }
         else if(category == 3)
         {
            _loc7_ = new ImportedBitmap("ammoIcon" + itemData.type + ".png");
            _loc3_ = new EngineText(Texts.fetch(WeaponsData.Calibers[itemData.type].name,undefined,10).toUpperCase(),2630688,36,"center",13,13,224,40);
            _loc4_ = new EngineText(Texts.fetch(itemData.variation,undefined,5).toUpperCase(),2630688,36,"left",15,197,230,30);
            _loc7_.smoothing = true;
            _loc1_ = new Sprite();
            _loc1_.addChild(_loc3_);
            _loc1_.addChild(_loc7_);
            _loc1_.addChild(_loc4_);
         }
         else if(category == 4)
         {
            _loc1_ = new ImportedBitmap("attachmentIcon" + subCategory + ".png");
            _loc1_.smoothing = true;
         }
         else if(category == 5)
         {
            if(subCategory < 7 || subCategory >= 8 && subCategory <= 13 || subCategory >= 15 && subCategory <= 18 || subCategory >= 19 && subCategory <= 21)
            {
               if(subCategory <= 9)
               {
                  _loc7_ = new ImportedBitmap("armorIcon1.png").bitmapData;
               }
               else if(subCategory >= 8 && subCategory <= 13)
               {
                  _loc7_ = new ImportedBitmap("armorIcon10.png").bitmapData;
               }
               else if(subCategory >= 15 && subCategory <= 18)
               {
                  _loc7_ = new ImportedBitmap("armorIcon15.png").bitmapData;
               }
               else if(subCategory >= 19 && subCategory <= 21)
               {
                  _loc7_ = new ImportedBitmap("armorIcon19.png").bitmapData;
               }
               _loc8_ = [];
               _loc5_ = 700;
               _loc2_ = Item.Armor[subCategory].color;
               _loc8_ = _loc8_.concat([_loc2_.r / _loc5_ * _loc2_.bc + 0.1,_loc2_.r * _loc2_.bc / _loc5_ + 0.1,_loc2_.r * _loc2_.bc / _loc5_ + 0.1,0,0]);
               _loc8_ = _loc8_.concat([_loc2_.g / _loc5_ * _loc2_.bc + 0.1,_loc2_.g / _loc5_ * _loc2_.bc + 0.1,_loc2_.g / _loc5_ * _loc2_.bc + 0.1,0,0]);
               _loc8_ = _loc8_.concat([_loc2_.b / _loc5_ * _loc2_.bc + 0.1,_loc2_.b / _loc5_ + 0.1,_loc2_.b / _loc5_ * _loc2_.bc + 0.1,0,0]);
               _loc8_ = _loc8_.concat([0,0,0,1,0]);
               _loc6_ = new ColorMatrixFilter(_loc8_);
               _loc7_.applyFilter(_loc7_,new Rectangle(0,0,250,250),new Point(0,0),_loc6_);
               _loc1_ = new Bitmap(_loc7_);
            }
            else
            {
               _loc1_ = new ImportedBitmap("armorIcon" + subCategory + ".png");
            }
            _loc1_.smoothing = true;
         }
         else
         {
            _loc1_ = new Sprite();
            _loc3_ = new EngineText(name.toUpperCase(),16777215,40,"center",0,105,250,40);
            _loc1_.addChild(_loc3_);
         }
         return _loc1_;
      }
      
      public function getWeaponModeName(param1:*) : *
      {
         var _loc2_:* = Texts.fetch(weaponType.modes[param1].name);
         if(weaponType.modes[param1].burst > 0)
         {
            _loc2_ += " x" + weaponType.modes[param1].burst;
         }
         return _loc2_;
      }
      
      public function get consumption() : *
      {
         if(itemData.consumption is Array)
         {
            return itemData.consumption;
         }
         return [];
      }
      
      public function get production() : *
      {
         if(itemData.production is Array)
         {
            return itemData.production;
         }
         return [];
      }
      
      public function get electricityProduction() : *
      {
         if(itemData.electricityProduction > 0)
         {
            return itemData.electricityProduction;
         }
         return 0;
      }
      
      public function get electricityConsumption() : *
      {
         if(itemData.electricityConsumption > 0)
         {
            return itemData.electricityConsumption;
         }
         return 0;
      }
      
      public function get tool() : *
      {
         return itemData.doctorImprove > 0 || itemData.veterinaryImprove > 0 || itemData.mechanicImprove > 0 || itemData.huntingImprove > 0 || itemData.collectingImprove > 0 || itemData.sightAmplifier;
      }
      
      public function getInfoPairs(param1:* = false) : *
      {
         var _loc5_:* = undefined;
         var _loc7_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         _loc2_.push({
            "name":name.toUpperCase(),
            "key":"name"
         });
         _loc2_[1] = {
            "name":"",
            "key":"blank"
         };
         _loc2_[2] = {
            "name":Texts.fetch(996).toUpperCase() + ": " + Math.round(weightPerUnit * 1000) / 1000,
            "key":"weight"
         };
         switch(category)
         {
            case 1:
               if(itemData.firstAidKit)
               {
                  _loc2_[1] = {
                     "name":Texts.fetch(197).toUpperCase(),
                     "key":"type"
                  };
                  _loc2_.push({
                     "name":Texts.fetch(1018).toUpperCase(),
                     "value":itemData.heal,
                     "key":"firtAidHeal"
                  });
               }
               if(itemData.food)
               {
                  _loc2_[1] = {
                     "name":Texts.fetch(15).toUpperCase(),
                     "key":"type"
                  };
                  _loc2_.push({
                     "name":Texts.fetch(1196).toUpperCase(),
                     "value":Math.round(itemData.calories / 10),
                     "key":"energy"
                  });
                  _loc2_.push({
                     "name":Texts.fetch(1247).toUpperCase(),
                     "value":Math.round(itemData.waterPercentage * 100) + "%",
                     "key":"waterPercentage"
                  });
                  _loc2_.push({
                     "name":Texts.fetch(3769).toUpperCase(),
                     "value":(itemData.taste > 0 ? "+" + itemData.taste : itemData.taste),
                     "key":"taste"
                  });
               }
               if(itemData.liquidsContainer)
               {
                  _loc2_[1] = {
                     "name":Texts.fetch(1198).toUpperCase(),
                     "key":"type"
                  };
                  _loc2_.push({
                     "name":Texts.fetch(1219).toUpperCase(),
                     "value":Math.round(itemData.volume * 1000) / 1000 + Texts.fetch(11),
                     "key":"volume"
                  });
               }
               if(itemData.device)
               {
                  _loc4_ = "";
                  if(itemData.consumption.length > 0 || itemData.electricityConsumption > 0)
                  {
                     _loc2_.push({
                        "name":Texts.fetch(1242).toUpperCase(),
                        "key":"consumptionTitle"
                     });
                     if(!param1)
                     {
                        _loc2_.push({
                           "name":"(" + Texts.fetch(1240).toUpperCase() + ")",
                           "key":"consumptionTitlePart2"
                        });
                     }
                     for(_loc5_ in itemData.consumption)
                     {
                        if(!param1)
                        {
                           _loc4_ = Math.round(itemData.consumption[_loc5_].amount * inUse * 1000) / 1000 + "/";
                        }
                        _loc2_.push({
                           "name":Texts.fetch(Item.getDataFromType(itemData.consumption[_loc5_].item).name).toUpperCase(),
                           "value":_loc4_ + Math.round(itemData.consumption[_loc5_].amount * 1000) / 1000,
                           "key":"consumptionItem" + _loc5_
                        });
                     }
                     if(itemData.electricityConsumption > 0)
                     {
                        if(!param1)
                        {
                           _loc4_ = itemData.electricityConsumption * inUse + "/";
                        }
                        _loc2_.push({
                           "name":Texts.fetch(19).toUpperCase(),
                           "value":_loc4_ + itemData.electricityConsumption + Texts.fetch(940),
                           "key":"consumptionItem" + _loc5_
                        });
                     }
                  }
                  if(itemData.production.length > 0 || itemData.electricityProduction > 0)
                  {
                     _loc2_[1] = {
                        "name":Texts.fetch(1199).toUpperCase(),
                        "key":"type"
                     };
                     _loc2_.push({
                        "name":Texts.fetch(1241).toUpperCase(),
                        "key":"productionTitle"
                     });
                     if(!param1)
                     {
                        _loc2_.push({
                           "name":"(" + Texts.fetch(1240).toUpperCase() + ")",
                           "key":"productionTitlePart2"
                        });
                     }
                     for(_loc5_ in itemData.production)
                     {
                        if(!param1)
                        {
                           _loc4_ = Math.round(itemData.production[_loc5_].amount * inUse * 1000) / 1000 + "/";
                        }
                        _loc2_.push({
                           "name":Texts.fetch(Item.getDataFromType(itemData.production[_loc5_].item)).name.toUpperCase(),
                           "value":_loc4_ + Math.round(itemData.production[_loc5_].amount * 1000) / 1000,
                           "key":"productionItem" + _loc5_
                        });
                     }
                     if(itemData.electricityProduction > 0)
                     {
                        if(!param1)
                        {
                           _loc4_ = itemData.electricityProduction * inUse + "/";
                        }
                        _loc2_.push({
                           "name":Texts.fetch(19).toUpperCase(),
                           "value":_loc4_ + itemData.electricityProduction + Texts.fetch(940),
                           "key":"productionItem" + _loc5_
                        });
                     }
                  }
               }
               if(itemData.sightAmplifier)
               {
                  _loc2_.push({
                     "name":Texts.fetch(937).toUpperCase(),
                     "value":Math.round(itemData.amplification * 100) + " %",
                     "key":"volume"
                  });
               }
               break;
            case 2:
               _loc2_[1] = {
                  "name":Texts.fetch(weaponType.name).toUpperCase(),
                  "key":"type"
               };
               if(weaponType.category == 2 || weaponType.category == 3 || weaponType.category == 4)
               {
                  _loc2_.push({
                     "name":Texts.fetch(298).toUpperCase(),
                     "value":Texts.fetch(WeaponsData.Calibers[itemData.ammo].name).toUpperCase(),
                     "key":"ammo"
                  });
                  _loc2_.push({
                     "name":Texts.fetch(299).toUpperCase(),
                     "value":itemData.ammoCapacity,
                     "key":"ammoCapacity"
                  });
                  _loc2_.push({
                     "name":Texts.fetch(300).toUpperCase(),
                     "value":itemData.accuracy,
                     "key":"accuracy"
                  });
               }
               if(weaponType.category == 2)
               {
                  _loc2_.push({
                     "name":Texts.fetch(301).toUpperCase(),
                     "value":Math.round((itemData.muzzleVelocityChange + 1) * 100),
                     "key":"muzzleVwlocity"
                  });
               }
               if(weaponType.category == 3)
               {
                  _loc2_.push({
                     "name":Texts.fetch(302).toUpperCase(),
                     "value":itemData.arrowSpeed,
                     "key":"projectileSpeed"
                  });
               }
               if(weaponType.category == 1)
               {
                  _loc2_.push({
                     "name":Texts.fetch(303).toUpperCase(),
                     "value":itemData.baseDamage,
                     "key":"damage"
                  });
                  _loc2_.push({
                     "name":Texts.fetch(304).toUpperCase(),
                     "value":itemData.armorNeutralization,
                     "key":"armorNeutralization"
                  });
                  _loc2_.push({
                     "name":Texts.fetch(305).toUpperCase(),
                     "value":Math.round(itemData.openWoundCoeficient * 1000),
                     "key":"openWoundInfliction"
                  });
               }
               if(weaponType.category == 5)
               {
                  _loc2_.push({
                     "name":Texts.fetch(306).toUpperCase(),
                     "value":itemData.explosiveness,
                     "key":"explosiveness"
                  });
                  _loc2_.push({
                     "name":Texts.fetch(307).toUpperCase(),
                     "value":itemData.antiPersonnel,
                     "key":"antiPersonnel"
                  });
               }
               _loc2_.push({
                  "name":Texts.fetch(1005).toUpperCase() + ":",
                  "key":"modesTitle"
               });
               for(_loc5_ in weaponType.modes)
               {
                  _loc2_.push({
                     "name":getWeaponModeName(_loc5_).toUpperCase(),
                     "value":weaponType.modes[_loc5_].AP + " " + Texts.fetch(1095).toUpperCase(),
                     "key":"mode" + _loc5_
                  });
               }
               if(weaponType.reloadAP > 0)
               {
                  _loc2_.push({
                     "name":Texts.fetch(195).toUpperCase(),
                     "value":weaponType.reloadAP + " " + Texts.fetch(1095).toUpperCase(),
                     "key":"reload"
                  });
               }
               break;
            case 3:
               _loc2_[1] = {
                  "name":Texts.fetch(298).toUpperCase(),
                  "key":"type"
               };
               if(!itemData.flamethrower && !itemData.explosive)
               {
                  if(WeaponsData.Calibers[itemData.type].arrow)
                  {
                     _loc6_ = itemData.projectileMass * Math.pow(50,2) / 2000;
                  }
                  else
                  {
                     _loc6_ = itemData.projectileMass * Math.pow(itemData.muzzleVelocity * 0.7,2) / 2000;
                  }
                  _loc3_ = (1 - 1 / (1 + Math.exp(0.03 * _loc6_ - 3))) * Math.pow(_loc6_,0.125) * (0.5 + _loc6_ / 2000 * Math.exp(-_loc6_ / 2000) / 2) * bulletDiameter * itemData.softTargetDamage * 2;
                  if(itemData.pallets > 0)
                  {
                     _loc3_ *= itemData.pallets;
                  }
                  _loc2_.push({
                     "name":Texts.fetch(1012).toUpperCase(),
                     "value":Math.round(_loc3_),
                     "key":"approximateDamage"
                  });
               }
               if(itemData.explosiveness > 0)
               {
                  _loc2_.push({
                     "name":Texts.fetch(306).toUpperCase(),
                     "value":itemData.explosiveness,
                     "key":"explosiveness"
                  });
               }
               if(itemData.antiPersonnel > 0)
               {
                  _loc2_.push({
                     "name":Texts.fetch(307).toUpperCase(),
                     "value":itemData.antiPersonnel,
                     "key":"antiPersonnel"
                  });
               }
               if(itemData.projectileMass > 0)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1006).toUpperCase(),
                     "value":itemData.projectileMass,
                     "key":"projectileMass"
                  });
               }
               if(itemData.muzzleVelocity > 0)
               {
                  _loc2_.push({
                     "name":Texts.fetch(301).toUpperCase(),
                     "value":itemData.muzzleVelocity,
                     "key":"muzzleVelocity"
                  });
               }
               if(itemData.armorPiercing != undefined)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1007).toUpperCase(),
                     "value":itemData.armorPiercing,
                     "key":"armorPiercing"
                  });
               }
               if(itemData.softTargetDamage != undefined)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1008).toUpperCase(),
                     "value":itemData.softTargetDamage,
                     "key":"softTargetDamage"
                  });
               }
               if(itemData.FF > 0)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1011).toUpperCase(),
                     "value":itemData.FF,
                     "key":"FF"
                  });
               }
               if(itemData.pallets != undefined)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1009).toUpperCase(),
                     "value":itemData.pallets,
                     "key":"pallets"
                  });
               }
               if(itemData.bulletDiameter != undefined)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1010).toUpperCase(),
                     "value":itemData.bulletDiameter,
                     "key":"palletDiamater"
                  });
               }
               else if(WeaponsData.Calibers[itemData.type].bulletDiameter != undefined)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1013).toUpperCase(),
                     "value":WeaponsData.Calibers[itemData.type].bulletDiameter,
                     "key":"bulletDiameter"
                  });
               }
               break;
            case 4:
               _loc2_[1] = {
                  "name":Texts.fetch(1072).toUpperCase(),
                  "key":"type"
               };
               _loc7_ = _loc2_.push({
                  "name":Texts.fetch(1001).toUpperCase(),
                  "key":"valid"
               }) - 1;
               _loc2_[_loc7_].value = "";
               _loc5_ = 0;
               while(_loc5_ < itemData.applicable.length)
               {
                  switch(itemData.applicable[_loc5_])
                  {
                     case "rifle":
                        _loc2_[_loc7_].value += Texts.fetch(973).toUpperCase();
                        break;
                     case "crossbow":
                        _loc2_[_loc7_].value += Texts.fetch(971).toUpperCase();
                        break;
                     case "pistol":
                        _loc2_[_loc7_].value += Texts.fetch(972).toUpperCase();
                        break;
                     case "machinegun":
                        _loc2_[_loc7_].value += Texts.fetch(974).toUpperCase();
                        break;
                     case "smg":
                        _loc2_[_loc7_].value += Texts.fetch(975).toUpperCase();
                        break;
                     case "shotgun":
                        _loc2_[_loc7_].value += Texts.fetch(986).toUpperCase();
                        break;
                     case "rocketLauncher":
                        _loc2_[_loc7_].value += Texts.fetch(976).toUpperCase();
                        break;
                     case "flamethrower":
                        _loc2_[_loc7_].value += Texts.fetch(977).toUpperCase();
                  }
                  if(_loc5_ < itemData.applicable.length - 1)
                  {
                     _loc2_[_loc7_].value += ", ";
                  }
                  _loc5_++;
               }
               if(itemData.affectAccuracy != undefined)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1016).toUpperCase(),
                     "value":itemData.affectAccuracy,
                     "key":"affectAccuracy"
                  });
               }
               if(itemData.affectAP != undefined)
               {
                  _loc2_.push({
                     "name":Texts.fetch(1017).toUpperCase(),
                     "value":0 - itemData.affectAP,
                     "key":"affectAP"
                  });
               }
               break;
            case 5:
               if(itemData.type == 1)
               {
                  _loc2_[1] = {
                     "name":Texts.fetch(1002).toUpperCase(),
                     "key":"type"
                  };
               }
               if(itemData.type == 2)
               {
                  _loc2_[1] = {
                     "name":Texts.fetch(1003).toUpperCase(),
                     "key":"type"
                  };
               }
               _loc2_.push({
                  "name":Texts.fetch(1004).toUpperCase(),
                  "value":itemData.armor,
                  "key":"physicalProtection"
               });
               _loc2_.push({
                  "name":Texts.fetch(1014).toUpperCase(),
                  "value":itemData.fireResistance,
                  "key":"fireProtection"
               });
               _loc2_.push({
                  "name":Texts.fetch(1015).toUpperCase(),
                  "value":itemData.explosionResistance,
                  "key":"explosionProtection"
               });
         }
         if(category == 1 || category == 2)
         {
            if(itemData.doctorImprove is Number || itemData.veterinaryImprove is Number || itemData.mechanicImprove is Number || itemData.huntingImprove is Number || itemData.collectingImprove is Number)
            {
               _loc2_.push({
                  "name":Texts.fetch(4241).toUpperCase() + ":",
                  "key":"improveTitle"
               });
            }
            if(itemData.doctorImprove is Number)
            {
               _loc2_.push({
                  "name":Texts.fetch(932).toUpperCase(),
                  "value":Math.round(itemData.doctorImprove * 100),
                  "key":"doctorImprove"
               });
            }
            if(itemData.veterinaryImprove is Number)
            {
               _loc2_.push({
                  "name":Texts.fetch(933).toUpperCase(),
                  "value":Math.round(itemData.veterinaryImprove * 100),
                  "key":"veterinaryImprove"
               });
            }
            if(itemData.mechanicImprove is Number)
            {
               _loc2_.push({
                  "name":Texts.fetch(934).toUpperCase(),
                  "value":Math.round(itemData.mechanicImprove * 100),
                  "key":"mechanicImprove"
               });
            }
            if(itemData.huntingImprove is Number)
            {
               _loc2_.push({
                  "name":Texts.fetch(935).toUpperCase(),
                  "value":Math.round(itemData.huntingImprove * 100),
                  "key":"huntingImprove"
               });
            }
            if(itemData.collectingImprove is Number)
            {
               _loc2_.push({
                  "name":Texts.fetch(936).toUpperCase(),
                  "value":Math.round(itemData.collectingImprove * 100),
                  "key":"collectingImprove"
               });
            }
         }
         if(itemData.batteries > 0)
         {
            _loc2_.push({
               "name":Texts.fetch(6823).toUpperCase(),
               "value":itemData.batteries,
               "key":"batteries"
            });
         }
         if(itemData.description is Number)
         {
            _loc2_.push({
               "name":description,
               "key":"description",
               "multiline":true
            });
         }
         return _loc2_;
      }
   }
}

