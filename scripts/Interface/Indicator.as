package Interface
{
   import flash.display.*;
   
   public class Indicator extends Sprite
   {
      
      public var Digits:*;
      
      private var DigitSegments:*;
      
      public function Indicator(param1:* = 3, param2:* = true, param3:* = null, param4:* = null, param5:* = null, param6:* = null, param7:* = 15)
      {
         var _loc10_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         DigitSegments = [[1,2,3,5,6,7],[3,6],[1,3,4,5,7],[1,3,4,6,7],[2,3,4,6],[1,2,4,6,7],[1,2,4,5,6,7],[1,3,6],[1,2,3,4,5,6,7],[1,2,3,4,6,7]];
         super();
         Digits = [];
         _loc9_ = 0;
         while(_loc9_ < param1)
         {
            Digits[_loc9_] = {};
            Digits[_loc9_].Display = new Sprite();
            Digits[_loc9_].Segments = [];
            if(param2)
            {
               Digits[_loc9_].BG = new Bitmap(new IndicatorBase());
               Digits[_loc9_].Segments[1] = new Bitmap(new IndicatorSegment1());
               Digits[_loc9_].Segments[2] = new Bitmap(new IndicatorSegment2());
               Digits[_loc9_].Segments[3] = new Bitmap(new IndicatorSegment3());
               Digits[_loc9_].Segments[4] = new Bitmap(new IndicatorSegment4());
               Digits[_loc9_].Segments[5] = new Bitmap(new IndicatorSegment5());
               Digits[_loc9_].Segments[6] = new Bitmap(new IndicatorSegment6());
               Digits[_loc9_].Segments[7] = new Bitmap(new IndicatorSegment7());
               Digits[_loc9_].Segments[8] = new Bitmap(new IndicatorSegment8());
            }
            else
            {
               if(param4 != null)
               {
                  Digits[_loc9_].BG = new Sprite();
               }
               _loc10_ = 1;
               while(_loc10_ <= 8)
               {
                  if(param4 != null)
                  {
                     drawSegment(Digits[_loc9_].BG.graphics,_loc10_,param4);
                  }
                  Digits[_loc9_].Segments[_loc10_] = new Sprite();
                  drawSegment(Digits[_loc9_].Segments[_loc10_].graphics,_loc10_,param3);
                  _loc10_++;
               }
               Digits[_loc9_].Display.scaleX = param5 / 100;
               Digits[_loc9_].Display.scaleY = param6 / 200;
            }
            if(param4 != null)
            {
               Digits[_loc9_].Display.addChild(Digits[_loc9_].BG);
            }
            _loc10_ = 1;
            while(_loc10_ <= 8)
            {
               Digits[_loc9_].Segments[_loc10_].visible = false;
               Digits[_loc9_].Display.addChild(Digits[_loc9_].Segments[_loc10_]);
               _loc10_++;
            }
            Digits[_loc9_].Display.x = (param1 - 1) * param7 - _loc9_ * param7;
            addChild(Digits[_loc9_].Display);
            _loc9_++;
         }
      }
      
      private function drawSegment(param1:*, param2:*, param3:*) : *
      {
         param1.beginFill(param3);
         var _loc5_:int = 20;
         var _loc4_:int = 7;
         switch(param2)
         {
            case 1:
               param1.moveTo(_loc4_,0);
               param1.lineTo(100 - _loc4_,0);
               param1.lineTo(100 - _loc4_ - _loc5_,_loc5_);
               param1.lineTo(_loc5_ + _loc4_,_loc5_);
               break;
            case 2:
               param1.moveTo(0,_loc4_);
               param1.lineTo(0,100 - _loc4_);
               param1.lineTo(_loc5_,100 - _loc5_ - _loc4_);
               param1.lineTo(_loc5_,_loc5_ + _loc4_);
               break;
            case 3:
               param1.moveTo(100,_loc4_);
               param1.lineTo(100,100 - _loc4_);
               param1.lineTo(100 - _loc5_,100 - _loc5_ - _loc4_);
               param1.lineTo(100 - _loc5_,_loc5_ + _loc4_);
               break;
            case 4:
               param1.moveTo(_loc4_,100);
               param1.lineTo(_loc5_ + _loc4_,100 - _loc5_ / 2);
               param1.lineTo(100 - _loc5_ - _loc4_,100 - _loc5_ / 2);
               param1.lineTo(100 - _loc4_,100);
               param1.lineTo(100 - _loc5_ - _loc4_,100 + _loc5_ / 2);
               param1.lineTo(_loc5_ + _loc4_,100 + _loc5_ / 2);
               break;
            case 5:
               param1.moveTo(0,100 + _loc4_);
               param1.lineTo(0,200 - _loc4_);
               param1.lineTo(_loc5_,200 - _loc5_ - _loc4_);
               param1.lineTo(_loc5_,100 + _loc5_ / 2 + _loc4_);
               break;
            case 6:
               param1.moveTo(100,100 + _loc4_);
               param1.lineTo(100,200 - _loc4_);
               param1.lineTo(100 - _loc5_,200 - _loc5_ - _loc4_);
               param1.lineTo(100 - _loc5_,100 + _loc5_ / 2 + _loc4_);
               break;
            case 7:
               param1.moveTo(_loc4_,200);
               param1.lineTo(100 - _loc4_,200);
               param1.lineTo(100 - _loc5_ - _loc4_,200 - _loc5_);
               param1.lineTo(_loc5_ + _loc4_,200 - _loc5_);
               break;
            case 8:
               param1.moveTo(110,210);
               param1.lineTo(110 + _loc5_ * 2,210);
               param1.lineTo(110 + _loc5_ * 2,210 - _loc5_ * 3);
         }
         param1.endFill();
      }
      
      public function setValue(param1:*, param2:* = 0, param3:* = false) : *
      {
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         var _loc5_:String = Math.round(param1 * Math.pow(10,param2)).toString();
         while(_loc5_.length < param2 + 1)
         {
            _loc5_ = "0" + _loc5_;
         }
         var _loc4_:* = param2;
         if(param3)
         {
            while(_loc5_.length > 1 && _loc5_.charAt(_loc5_.length - 1) == "0" && _loc4_ > 0)
            {
               _loc5_ = _loc5_.substring(0,_loc5_.length - 1);
               _loc4_--;
            }
         }
         if(param3 && _loc5_.length > Digits.length)
         {
            _loc6_ = _loc5_.length - param2;
            if(_loc6_ < Digits.length)
            {
               _loc5_ = _loc5_.substr(0,Digits.length);
               _loc4_ = Digits.length - _loc6_;
            }
            else
            {
               _loc5_ = _loc5_.substr(0,_loc6_);
               _loc4_ = 0;
            }
         }
         _loc7_ = 0;
         while(_loc7_ < Digits.length)
         {
            _loc8_ = 1;
            while(_loc8_ <= 7)
            {
               Digits[_loc7_].Segments[_loc8_].visible = false;
               _loc8_++;
            }
            _loc9_ = Number(_loc5_.charAt(_loc5_.length - _loc7_ - 1));
            if(_loc7_ < _loc5_.length && !isNaN(_loc9_))
            {
               _loc8_ = 0;
               while(_loc8_ < DigitSegments[_loc9_].length)
               {
                  Digits[_loc7_].Segments[DigitSegments[_loc5_.charAt(_loc5_.length - _loc7_ - 1)][_loc8_]].visible = true;
                  _loc8_++;
               }
            }
            Digits[_loc7_].Segments[8].visible = _loc7_ != 0 && _loc4_ == _loc7_;
            _loc7_++;
         }
      }
   }
}

