package IsoEngine
{
   import com.gskinner.utils.Rndm;
   import flash.geom.Point;
   
   public class MathFunctions
   {
      
      public static var halfPI:* = 1.5707963267948966;
      
      public static var dblPI:* = 6.283185307179586;
      
      public static var Rad2Deg:* = 360 / dblPI;
      
      public function MathFunctions()
      {
         super();
      }
      
      public static function CalcAngle(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc5_:Number = Math.atan2(param3 - param1,param4 - param2);
         if(_loc5_ < 0)
         {
            _loc5_ = 3.141592653589793 * 2 + _loc5_;
         }
         return _loc5_;
      }
      
      public static function CalcRevYAngle(param1:*, param2:*, param3:*, param4:*) : *
      {
         return CalcAngle(param1,param4,param3,param2);
      }
      
      public static function TriangleSSS(param1:*, param2:*, param3:*) : *
      {
         var _loc4_:Object = {};
         _loc4_.C = Math.acos((Math.pow(param1,2) + Math.pow(param2,2) - Math.pow(param3,2)) / (2 * param1 * param2));
         _loc4_.A = Math.asin(param1 * Math.sin(_loc4_.C) / param3);
         _loc4_.B = 3.141592653589793 - _loc4_.A - _loc4_.C;
         return _loc4_;
      }
      
      public static function PointInTriangle(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc5_:* = getOrientationResult(param2.x,param2.y,param3.x,param3.y,param1.x,param1.y);
         var _loc6_:* = getOrientationResult(param3.x,param3.y,param4.x,param4.y,param1.x,param1.y);
         var _loc7_:* = getOrientationResult(param4.x,param4.y,param2.x,param2.y,param1.x,param1.y);
         return _loc5_ == _loc6_ && _loc6_ == _loc7_;
      }
      
      private static function getOrientationResult(param1:*, param2:*, param3:*, param4:*, param5:*, param6:*) : *
      {
         var _loc7_:Number = (param3 - param1) * (param6 - param2) - (param5 - param1) * (param4 - param2);
         if(_loc7_ > 0)
         {
            return 1;
         }
         if(_loc7_ < 0)
         {
            return -1;
         }
         return 0;
      }
      
      public static function CalcDistance(param1:*, param2:*, param3:*, param4:*) : *
      {
         return new Point(param3 - param1,param4 - param2).length;
      }
      
      public static function AngleFallsBetween(param1:*, param2:*, param3:*) : *
      {
         while(param1 > dblPI)
         {
            param1 -= dblPI;
         }
         while(param1 < 0)
         {
            param1 += dblPI;
         }
         while(param2 > dblPI)
         {
            param2 -= dblPI;
         }
         while(param2 < 0)
         {
            param2 += dblPI;
         }
         while(param3 > dblPI)
         {
            param3 -= dblPI;
         }
         while(param3 < 0)
         {
            param3 += dblPI;
         }
         if(param2 < param3 && param1 >= param2 && param1 <= param3)
         {
            return true;
         }
         if(param2 > param3 && (param1 <= param3 || param1 >= param2))
         {
            return true;
         }
         return false;
      }
      
      public static function NumberFormat(param1:*, param2:* = 2, param3:* = false) : *
      {
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc8_:String = Math.abs(Math.round(Math.pow(10,param2) * param1)).toString();
         if(param2 > 0)
         {
            while(_loc8_.length < param2 + 1)
            {
               _loc8_ = "0" + _loc8_;
            }
            _loc4_ = _loc8_.substr(0,_loc8_.length - param2);
            _loc7_ = _loc8_.substr(_loc8_.length - param2,param2);
         }
         else
         {
            _loc4_ = _loc8_;
         }
         _loc8_ = "";
         _loc6_ = 1;
         while(_loc6_ <= _loc4_.length)
         {
            _loc8_ = _loc4_.charAt(_loc4_.length - _loc6_) + _loc8_;
            if(_loc6_ % 3 == 0 && _loc6_ < _loc4_.length)
            {
               _loc8_ = "," + _loc8_;
            }
            _loc6_++;
         }
         if(param2 > 0)
         {
            _loc8_ = _loc8_ + "." + _loc7_;
         }
         if(param3 && param2 > 0)
         {
            _loc5_ = 0;
            while(_loc8_.charAt(_loc8_.length - 1) == "0" && _loc5_ <= param2)
            {
               _loc8_ = _loc8_.substring(0,_loc8_.length - 1);
               _loc5_++;
            }
            if(_loc8_.charAt(_loc8_.length - 1) == ".")
            {
               _loc8_ = _loc8_.substring(0,_loc8_.length - 1);
            }
         }
         if(param1 < 0)
         {
            _loc8_ = "-" + _loc8_;
         }
         return _loc8_;
      }
      
      public static function AngleDifference(param1:*, param2:*, param3:* = false) : *
      {
         if(param3)
         {
            param1 /= Rad2Deg;
            param2 /= Rad2Deg;
         }
         var _loc4_:Number = param2 - param1;
         while(_loc4_ > 3.141592653589793)
         {
            _loc4_ -= dblPI;
         }
         while(_loc4_ < 0 - 3.141592653589793)
         {
            _loc4_ += dblPI;
         }
         if(param3)
         {
            _loc4_ *= Rad2Deg;
         }
         return _loc4_;
      }
      
      public static function LineHitsLine(param1:*, param2:*) : *
      {
         var _loc3_:Object = {};
         if(param1.a == param2.a)
         {
            _loc3_.x = Infinity;
            _loc3_.y = Infinity;
         }
         else
         {
            if(param1.x == undefined && param2.x == undefined)
            {
               if(param1.a != 0 && param2.a != 0)
               {
                  _loc3_.x = (param2.b - param1.b) / (param1.a - param2.a);
                  _loc3_.y = param2.a * _loc3_.x + param2.b;
               }
               if(param1.a == 0)
               {
                  _loc3_.y = param1.b;
                  _loc3_.x = (param2.b - _loc3_.y) / (0 - param2.a);
               }
               if(param2.a == 0)
               {
                  _loc3_.y = param2.b;
                  _loc3_.x = (_loc3_.y - param1.b) / param1.a;
               }
            }
            if(param1.x != undefined)
            {
               _loc3_.x = param1.x;
               _loc3_.y = param2.a * _loc3_.x + param2.b;
            }
            if(param2.x != undefined)
            {
               _loc3_.x = param2.x;
               _loc3_.y = param1.a * _loc3_.x + param1.b;
            }
         }
         return _loc3_;
      }
      
      public static function co2ab(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc5_:Object = {};
         if(param1 == param3)
         {
            _loc5_.x = param1;
         }
         else
         {
            _loc5_.a = (param4 - param2) / (param3 - param1);
            _loc5_.b = param2 - param1 * _loc5_.a;
         }
         return _loc5_;
      }
      
      public static function ang2ab(param1:*, param2:*, param3:*) : *
      {
         var _loc4_:Object = {};
         if(param3 == 0 || param3 == 3.141592653589793)
         {
            _loc4_.x = param1;
         }
         else
         {
            _loc4_.a = 1 / Math.tan(param3);
            _loc4_.b = param2 - param1 * _loc4_.a;
         }
         return _loc4_;
      }
      
      public static function LineHitsSegment(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         var _loc6_:* = undefined;
         var _loc7_:* = LineHitsLine(param1,co2ab(param2,param3,param4,param5));
         _loc7_.x = Math.round(_loc7_.x * 1000000000) / 1000000000;
         _loc7_.y = Math.round(_loc7_.y * 1000000000) / 1000000000;
         _loc6_ = _loc7_.x >= Math.min(param2,param4) && _loc7_.x <= Math.max(param2,param4) && _loc7_.y >= Math.min(param3,param5) && _loc7_.y <= Math.max(param3,param5);
         if(!_loc6_)
         {
            _loc7_ = null;
         }
         return _loc7_;
      }
      
      public static function SegmentHitsSegment(param1:*, param2:*, param3:*, param4:*, param5:*, param6:*, param7:*, param8:*) : *
      {
         var _loc9_:* = undefined;
         var _loc11_:* = undefined;
         var _loc10_:* = LineHitsLine(co2ab(param1,param2,param3,param4),co2ab(param5,param6,param7,param8));
         _loc10_.x = Math.round(_loc10_.x * 1000000000) / 1000000000;
         _loc10_.y = Math.round(_loc10_.y * 1000000000) / 1000000000;
         _loc11_ = _loc10_.x >= Math.min(param1,param3) && _loc10_.x <= Math.max(param1,param3) && _loc10_.y >= Math.min(param2,param4) && _loc10_.y <= Math.max(param2,param4);
         _loc9_ = _loc10_.x >= Math.min(param5,param7) && _loc10_.x <= Math.max(param5,param7) && _loc10_.y >= Math.min(param6,param8) && _loc10_.y <= Math.max(param6,param8);
         if(!_loc11_ || !_loc9_)
         {
            _loc10_ = null;
         }
         return _loc10_;
      }
      
      public static function CalcDistance3D(param1:*, param2:*, param3:* = 0, param4:* = 0, param5:* = 0, param6:* = 0) : *
      {
         var _loc7_:* = undefined;
         if(param1.hasOwnProperty("x") && param2.hasOwnProperty("x"))
         {
            param4 = param2.x;
            param5 = param2.y;
            param6 = param2.z;
            param3 = param1.z;
            param2 = param1.y;
            param1 = param1.x;
         }
         _loc7_ = CalcDistance(param1,param2,param4,param5);
         return Math.sqrt(Math.pow(_loc7_,2) + Math.pow(param6 - param3,2));
      }
      
      public static function isBetween(param1:*, param2:*, param3:*, param4:* = ">=<", param5:* = 0) : *
      {
         var _loc6_:* = undefined;
         var _loc8_:Number = Math.min(param2,param3);
         var _loc7_:Number = Math.max(param2,param3);
         if(param5 != 0)
         {
            _loc8_ -= param5;
            _loc7_ += param5;
         }
         _loc6_ = param1 > _loc8_ && param1 < _loc7_;
         if(!_loc6_ && (param1 == _loc8_ || param1 == _loc7_))
         {
            _loc6_ = true;
         }
         return _loc6_;
      }
      
      public static function random(param1:*, param2:*, param3:* = true) : *
      {
         var _loc4_:* = undefined;
         if(param3)
         {
            _loc4_ = Math.floor(param1 + Math.random() * (param2 - param1 + 1));
         }
         else
         {
            _loc4_ = param1 + Math.random() * (param2 - param1);
         }
         return _loc4_;
      }
      
      public static function XOR(param1:*, param2:*) : *
      {
         return param1 && !param2 || !param1 && param2;
      }
      
      public static function probabilityRandom(param1:*, param2:* = null) : *
      {
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = 0;
         _loc4_ = Rndm.random();
         for(_loc6_ in param1)
         {
            if(param2 == null)
            {
               _loc3_ = param1[_loc6_];
            }
            else
            {
               _loc3_ = param1[_loc6_][param2];
            }
            if(!isNaN(_loc3_))
            {
               _loc5_ += _loc3_;
            }
            if(_loc5_ >= _loc4_)
            {
               return _loc6_;
            }
         }
         return false;
      }
      
      public static function ProbabilityRandom(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = 0;
         var _loc3_:* = param1;
         while(_loc3_ > 0)
         {
            _loc4_ = Math.random();
            if(_loc4_ > _loc3_)
            {
               return _loc2_;
            }
            _loc2_++;
            _loc3_ -= _loc4_;
         }
      }
      
      public static function MultiplyProbability(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(param2 == 0)
         {
            return 0;
         }
         _loc3_ = param1;
         _loc4_ = 2;
         while(_loc4_ <= param2)
         {
            _loc3_ += (1 - _loc3_) * param1;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function addProbabilities(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = 0;
         for(_loc3_ in param1)
         {
            if(!isNaN(param1[_loc3_]))
            {
               _loc2_ += (1 - _loc2_) * param1[_loc3_];
            }
         }
         return _loc2_;
      }
      
      public static function arrayToPercentage(param1:*, param2:* = null) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:* = 0;
         for(_loc4_ in param1)
         {
            if(param2 == null)
            {
               _loc3_ += param1[_loc4_];
            }
            else
            {
               _loc3_ += param1[_loc4_][param2];
            }
         }
         for(_loc4_ in param1)
         {
            if(param2 == null)
            {
               var _loc6_:* = _loc4_;
               var _loc5_:* = param1[_loc6_] / _loc3_;
               param1[_loc6_] = _loc5_;
            }
            else
            {
               _loc5_ = param2;
               _loc6_ = param1[_loc4_][_loc5_] / _loc3_;
               param1[_loc4_][_loc5_] = _loc6_;
            }
         }
      }
      
      public static function oneOfArray(param1:*) : *
      {
         return param1[Rndm.integer(0,param1.length - 1)];
      }
   }
}

