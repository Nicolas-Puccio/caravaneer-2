package IsoEngine
{
   public class OtherFunctions
   {
      
      public function OtherFunctions()
      {
         super();
      }
      
      public static function fullReplace(param1:*, param2:*, param3:*) : *
      {
         while(param1.indexOf(param2) >= 0)
         {
            param1 = param1.replace(param2,param3);
         }
         return param1;
      }
      
      public static function breakToLines(param1:*, param2:*) : *
      {
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc8_:* = undefined;
         var _loc3_:Array = [];
         var _loc6_:* = param1.split(" ");
         var _loc5_:* = 0;
         _loc3_[0] = "";
         _loc8_ = 0;
         while(_loc8_ < _loc6_.length)
         {
            if(_loc3_[_loc5_].length + _loc6_[_loc8_].length + 1 > param2)
            {
               if(_loc6_[_loc8_].length > 0)
               {
                  _loc7_ = _loc6_[_loc8_];
                  _loc4_ = _loc6_.splice(0,_loc8_);
                  _loc6_[0] = _loc7_.substring(param2,_loc7_.length);
                  _loc6_.unshift(_loc7_.substring(0,param2));
                  _loc6_ = _loc4_.concat(_loc6_);
                  if(_loc3_[_loc5_].length > 0)
                  {
                     _loc5_++;
                     _loc3_[_loc5_] = "";
                  }
               }
               else
               {
                  _loc5_++;
                  _loc3_[_loc5_] = "";
               }
            }
            if(_loc3_[_loc5_].length > 0)
            {
               var _loc10_:* = _loc5_;
               var _loc11_:* = _loc3_[_loc10_] + " ";
               _loc3_[_loc10_] = _loc11_;
            }
            _loc11_ = _loc5_;
            _loc10_ = _loc3_[_loc11_] + _loc6_[_loc8_];
            _loc3_[_loc11_] = _loc10_;
            _loc8_++;
         }
         return _loc3_;
      }
   }
}

