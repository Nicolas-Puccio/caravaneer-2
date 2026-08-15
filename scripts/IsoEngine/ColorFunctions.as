package IsoEngine
{
   public class ColorFunctions
   {
      
      public function ColorFunctions()
      {
         super();
      }
      
      public static function hsv2rgb(param1:*, param2:*, param3:*) : *
      {
         var _loc7_:* = undefined;
         var _loc11_:* = undefined;
         var _loc10_:* = undefined;
         var _loc9_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc5_:* = undefined;
         if(param3 <= 0)
         {
            return {
               "r":0,
               "g":0,
               "b":0
            };
         }
         param1 %= 360;
         param2 /= 100;
         param3 /= 100;
         param1 /= 60;
         _loc10_ = Math.floor(param1);
         _loc9_ = param1 - _loc10_;
         _loc4_ = param3 * (1 - param2);
         _loc6_ = param3 * (1 - param2 * _loc9_);
         _loc8_ = param3 * (1 - param2 * (1 - _loc9_));
         if(_loc10_ == 0)
         {
            _loc5_ = param3;
            _loc7_ = _loc8_;
            _loc11_ = _loc4_;
         }
         else if(_loc10_ == 1)
         {
            _loc5_ = _loc6_;
            _loc7_ = param3;
            _loc11_ = _loc4_;
         }
         else if(_loc10_ == 2)
         {
            _loc5_ = _loc4_;
            _loc7_ = param3;
            _loc11_ = _loc8_;
         }
         else if(_loc10_ == 3)
         {
            _loc5_ = _loc4_;
            _loc7_ = _loc6_;
            _loc11_ = param3;
         }
         else if(_loc10_ == 4)
         {
            _loc5_ = _loc8_;
            _loc7_ = _loc4_;
            _loc11_ = param3;
         }
         else if(_loc10_ == 5)
         {
            _loc5_ = param3;
            _loc7_ = _loc4_;
            _loc11_ = _loc6_;
         }
         _loc5_ = Math.floor(_loc5_ * 255);
         _loc7_ = Math.floor(_loc7_ * 255);
         _loc11_ = Math.floor(_loc11_ * 255);
         return {
            "r":_loc5_,
            "g":_loc7_,
            "b":_loc11_
         };
      }
      
      public static function rgb2hsv(param1:*, param2:*, param3:*) : *
      {
         var _loc6_:Object = {};
         if(param1 == 0 && param2 == 0 && param3 == 0)
         {
            return {
               "h":0,
               "s":0,
               "v":0
            };
         }
         param1 /= 255;
         param2 /= 255;
         param3 /= 255;
         var _loc5_:Number = Math.max(param1,param2,param3);
         var _loc4_:Number = Math.min(param1,param2,param3);
         switch(_loc5_)
         {
            case param1:
               _loc6_.h = 60 * (param2 - param3) / (_loc5_ - _loc4_);
               break;
            case param2:
               _loc6_.h = 60 * (param3 - param1) / (_loc5_ - _loc4_) + 120;
               break;
            case param3:
               _loc6_.h = 60 * (param1 - param2) / (_loc5_ - _loc4_) + 240;
         }
         if(isNaN(_loc6_.h))
         {
            _loc6_.h = 0;
         }
         if(_loc6_.h < 0)
         {
            _loc6_.h += 360;
         }
         _loc6_.s = (_loc5_ - _loc4_) / _loc5_ * 100;
         _loc6_.v = _loc5_ * 100;
         return _loc6_;
      }
      
      public static function num2rgb(param1:*) : *
      {
         var _loc2_:Object = {};
         _loc2_.r = param1 >> 16 & 0xFF;
         _loc2_.g = param1 >> 8 & 0xFF;
         _loc2_.b = param1 & 0xFF;
         return _loc2_;
      }
      
      public static function rgb2num(param1:*, param2:*, param3:*) : *
      {
         return (Math.min(Math.round(param1),255) << 16) + (Math.min(Math.round(param2),255) << 8) + Math.min(Math.round(param3),255);
      }
      
      public static function visualBrightness(param1:*, param2:*, param3:*) : *
      {
         return Math.sqrt(0.241 * param1 * param1 + 0.691 * param2 * param2 + 0.068 * param3 * param3);
      }
   }
}

