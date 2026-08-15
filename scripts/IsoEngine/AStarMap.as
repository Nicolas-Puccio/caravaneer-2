package IsoEngine
{
   public class AStarMap
   {
      
      public var Map:*;
      
      private var cells:*;
      
      public var width:*;
      
      public var height:*;
      
      public function AStarMap(param1:*, param2:*)
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         super();
         width = param1;
         height = param2;
         Map = [];
         _loc5_ = 0;
         while(_loc5_ < width)
         {
            Map[_loc5_] = [];
            _loc5_++;
         }
         cells = [];
         _loc3_ = 0;
         while(_loc3_ < width)
         {
            cells[_loc3_] = [];
            _loc4_ = 0;
            while(_loc4_ < height)
            {
               cells[_loc3_][_loc4_] = {
                  "x":_loc3_,
                  "y":_loc4_
               };
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function setCell(param1:*, param2:*, param3:*) : *
      {
         Map[param1][param2] = param3;
      }
      
      public function findPath(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc6_:* = undefined;
         var _loc10_:* = undefined;
         var _loc9_:* = undefined;
         var _loc8_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc5_:* = undefined;
         var _loc11_:Array = [[0,-1],[1,0],[0,1],[-1,0]];
         _loc14_ = 0;
         while(_loc14_ < width)
         {
            _loc15_ = 0;
            while(_loc15_ < height)
            {
               cells[_loc14_][_loc15_].closed = false;
               _loc15_++;
            }
            _loc14_++;
         }
         cells[param1][param2].gScore = 0;
         cells[param1][param2].fScore = Math.abs(param3 - param1) + Math.abs(param4 - param2);
         var _loc7_:Array = new Array(cells[param1][param2]);
         while(_loc7_.length > 0)
         {
            _loc13_ = _loc7_.shift();
            if(_loc13_.x == param3 && _loc13_.y == param4)
            {
               return traceBack(_loc13_,param1,param2);
            }
            _loc13_.closed = true;
            for(_loc5_ in _loc11_)
            {
               _loc9_ = _loc13_.x + _loc11_[_loc5_][0];
               _loc8_ = _loc13_.y + _loc11_[_loc5_][1];
               if(_loc9_ >= 0 && _loc9_ < width && _loc8_ >= 0 && _loc8_ < height && !Map[_loc9_][_loc8_] > 0 && !cells[_loc9_][_loc8_].closed)
               {
                  _loc12_ = _loc13_.gScore + 1;
                  _loc10_ = _loc7_.indexOf(cells[_loc9_][_loc8_]);
                  if(_loc10_ == -1 || _loc12_ < cells[_loc9_][_loc8_].gScore)
                  {
                     if(_loc10_ != -1)
                     {
                        _loc7_.splice(_loc10_,1);
                     }
                     cells[_loc9_][_loc8_].cameFrom = _loc13_;
                     cells[_loc9_][_loc8_].gScore = _loc12_;
                     cells[_loc9_][_loc8_].fScore = _loc12_ + (Math.abs(param3 - cells[_loc9_][_loc8_].x) + Math.abs(param4 - cells[_loc9_][_loc8_].y));
                     if(_loc7_.length == 0 || cells[_loc9_][_loc8_].fScore <= _loc7_[0].fScore)
                     {
                        _loc7_.unshift(cells[_loc9_][_loc8_]);
                     }
                     else if(cells[_loc9_][_loc8_].fScore >= _loc7_[_loc7_.length - 1].fScore)
                     {
                        _loc7_.push(cells[_loc9_][_loc8_]);
                     }
                     else
                     {
                        _loc6_ = 1;
                        while(_loc6_ < _loc7_.length)
                        {
                           if(cells[_loc9_][_loc8_].fScore >= _loc7_[_loc6_ - 1].fScore && cells[_loc9_][_loc8_].fScore <= _loc7_[_loc6_].fScore)
                           {
                              _loc7_.splice(_loc6_,0,cells[_loc9_][_loc8_]);
                              break;
                           }
                           _loc6_++;
                        }
                     }
                  }
               }
            }
         }
         return false;
      }
      
      private function traceBack(param1:*, param2:*, param3:*) : *
      {
         var _loc4_:Array = [];
         var _loc5_:* = param1;
         while(_loc5_.x != param2 || _loc5_.y != param3)
         {
            _loc4_.unshift({
               "x":_loc5_.x,
               "y":_loc5_.y
            });
            _loc5_ = _loc5_.cameFrom;
         }
         return _loc4_;
      }
   }
}

