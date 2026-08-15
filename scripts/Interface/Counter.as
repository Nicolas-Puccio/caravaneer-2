package Interface
{
   import IsoEngine.EngineText;
   import flash.display.*;
   
   public class Counter extends Sprite
   {
      
      private static var counterBMP:*;
      
      internal const scrollShift:* = 0.5;
      
      internal var Digits:*;
      
      internal const OverlayShades:*;
      
      internal const LeftShades:*;
      
      internal const RightAlphas:*;
      
      public function Counter(param1:* = 3)
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc5_:* = undefined;
         Digits = [];
         OverlayShades = [{
            "color":0,
            "alpha":150
         },{
            "color":0,
            "alpha":100
         },{
            "color":0,
            "alpha":50
         },{
            "color":16777215,
            "alpha":10
         },{
            "color":16777215,
            "alpha":20
         },{
            "color":16777215,
            "alpha":10
         },{
            "color":0,
            "alpha":30
         },{
            "color":0,
            "alpha":60
         },{
            "color":0,
            "alpha":90
         },{
            "color":0,
            "alpha":120
         },{
            "color":0,
            "alpha":150
         }];
         LeftShades = [{
            "color":0,
            "alpha":150
         },{
            "color":0,
            "alpha":75
         },{
            "color":0,
            "alpha":0
         },{
            "color":16777215,
            "alpha":30
         },{
            "color":16777215,
            "alpha":60
         },{
            "color":16777215,
            "alpha":45
         },{
            "color":16777215,
            "alpha":30
         },{
            "color":16777215,
            "alpha":15
         },{
            "color":0,
            "alpha":50
         },{
            "color":0,
            "alpha":100
         },{
            "color":0,
            "alpha":150
         }];
         RightAlphas = [150,130,110,90,70,50,70,90,110,130,150];
         super();
         var _loc7_:Array = [];
         var _loc6_:* = -10;
         if(!(Counter.counterBMP is BitmapData))
         {
            initiateCounter();
         }
         _loc5_ = 0;
         while(_loc5_ < param1)
         {
            if(_loc5_ > 0)
            {
               _loc6_ -= 10;
               if(_loc5_ % 3 == 0)
               {
                  _loc6_ -= 2;
               }
            }
            _loc7_[_loc5_] = _loc6_;
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < param1)
         {
            _loc7_[_loc5_] = 0 - _loc6_ + _loc7_[_loc5_];
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < param1)
         {
            Digits[_loc5_] = {};
            Digits[_loc5_].BM = new Bitmap(counterBMP);
            Digits[_loc5_].Display = new Sprite();
            Digits[_loc5_].Display.addChild(Digits[_loc5_].BM);
            Digits[_loc5_].Overlay = new BitmapData(10,11,true,0);
            Digits[_loc5_].Val = 0;
            Digits[_loc5_].currPos = 0;
            _loc4_ = 0;
            while(_loc4_ < 11)
            {
               _loc2_ = OverlayShades[_loc4_].alpha << 24 | OverlayShades[_loc4_].color;
               Digits[_loc5_].Overlay.setPixel32(0,_loc4_,LeftShades[_loc4_].alpha << 24 | LeftShades[_loc4_].color);
               Digits[_loc5_].Overlay.setPixel32(9,_loc4_,RightAlphas[_loc4_] << 24);
               _loc3_ = 1;
               while(_loc3_ < 9)
               {
                  Digits[_loc5_].Overlay.setPixel32(_loc3_,_loc4_,_loc2_);
                  _loc3_++;
               }
               _loc4_++;
            }
            Digits[_loc5_].Display.addChild(new Bitmap(Digits[_loc5_].Overlay));
            Digits[_loc5_].Display.x = _loc7_[_loc5_];
            Digits[_loc5_].Mask = new Sprite();
            Digits[_loc5_].Mask.graphics.beginFill(16777215);
            Digits[_loc5_].Mask.graphics.moveTo(0,0);
            Digits[_loc5_].Mask.graphics.lineTo(10,0);
            Digits[_loc5_].Mask.graphics.lineTo(10,11);
            Digits[_loc5_].Mask.graphics.lineTo(0,11);
            Digits[_loc5_].Mask.graphics.endFill();
            Digits[_loc5_].Mask.x = _loc7_[_loc5_];
            addChild(Digits[_loc5_].Mask);
            Digits[_loc5_].Display.mask = Digits[_loc5_].Mask;
            addChild(Digits[_loc5_].Display);
            Digits[_loc5_].trans = 0;
            _loc5_++;
         }
         addEventListener("enterFrame",EF,false,0,false);
      }
      
      public static function initiateCounter() : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc2_:* = undefined;
         var _loc7_:Sprite = new Sprite();
         var _loc4_:Bitmap = new Bitmap(new BitmapData(10,154,false,0));
         var _loc1_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < 10)
         {
            _loc5_ = 0;
            while(_loc5_ < 154)
            {
               _loc2_ = Math.random() * 20 + 70;
               _loc4_.bitmapData.setPixel(_loc3_,_loc5_,Math.round(_loc2_) << 16 | Math.round(_loc2_ * 0.8961) << 8 | Math.round(_loc2_ * 0.72727));
               _loc5_++;
            }
            _loc3_++;
         }
         _loc7_.addChild(_loc4_);
         _loc6_ = 0;
         while(_loc6_ <= 10)
         {
            _loc1_[_loc6_] = new EngineText(_loc6_ % 10,16775651,10,"center",0,14 * _loc6_ - 2);
            _loc7_.addChild(_loc1_[_loc6_]);
            _loc6_++;
         }
         counterBMP = new BitmapData(10,154,false,0);
         counterBMP.draw(_loc7_);
      }
      
      public function EF(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         for(_loc4_ in Digits)
         {
            if(Digits[_loc4_].currPos != Digits[_loc4_].Val)
            {
               _loc5_ = Digits[_loc4_].Val - Digits[_loc4_].currPos;
               _loc3_ = Math.abs(_loc5_);
               if(_loc3_ > 5)
               {
                  _loc3_ = 10 - _loc3_;
               }
               if(_loc3_ > 0.05)
               {
                  if(Math.abs(_loc5_) > 5)
                  {
                     _loc5_ = 0 - _loc5_;
                  }
                  Digits[_loc4_].currPos += _loc5_ / Math.abs(_loc5_) / 7;
               }
            }
            while(Digits[_loc4_].currPos < 0)
            {
               Digits[_loc4_].currPos += 10;
            }
            while(Digits[_loc4_].currPos > 10)
            {
               Digits[_loc4_].currPos -= 10;
            }
            _loc2_ = 0 - Math.round(Digits[_loc4_].currPos * 14);
            if(_loc2_ > 0)
            {
               _loc2_ -= 140;
            }
            Digits[_loc4_].BM.y = _loc2_;
         }
      }
      
      public function setCounter(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 >= Math.pow(10,Digits.length))
         {
            param1 = Math.pow(10,Digits.length) - 1;
         }
         _loc3_ = 0;
         while(_loc3_ < Digits.length)
         {
            Digits[_loc3_].Val = Math.floor(param1 % Math.pow(10,_loc3_ + 1) / Math.pow(10,_loc3_));
            _loc3_++;
         }
      }
      
      public function remove(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         for(_loc2_ in Digits)
         {
            Digits[_loc2_].Overlay.dispose();
            Digits[_loc2_].Overlay = null;
            Digits[_loc2_].BM = null;
         }
         if(counterBMP is BitmapData)
         {
            counterBMP.dispose();
         }
         counterBMP = null;
         removeEventListener("enterFrame",EF);
      }
   }
}

