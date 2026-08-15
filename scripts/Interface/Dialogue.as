package Interface
{
   import IsoEngine.ImportedBitmap;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class Dialogue extends Sprite
   {
      
      public var dialogueWidth:*;
      
      public var dialogueHeight:*;
      
      public var BG:*;
      
      public var BGMask:*;
      
      public var highlights:*;
      
      public var shadows:*;
      
      public var FG:*;
      
      public var FGMask:*;
      
      public function Dialogue(param1:*, param2:*)
      {
         var _loc4_:* = undefined;
         super();
         dialogueWidth = param1;
         dialogueHeight = param2;
         BG = new ImportedBitmap("InterfaceBackground.png");
         BG.x = 0 - Math.random() * (BG.width - dialogueWidth);
         BG.y = 0 - Math.random() * (BG.height - dialogueHeight);
         addChild(BG);
         BGMask = new Sprite();
         BGMask.graphics.beginFill(16711680);
         BGMask.graphics.moveTo(0,0);
         BGMask.graphics.lineTo(dialogueWidth,0);
         BGMask.graphics.lineTo(dialogueWidth,dialogueHeight);
         BGMask.graphics.lineTo(0,dialogueHeight);
         BGMask.graphics.endFill();
         addChild(BGMask);
         BG.mask = BGMask;
         var _loc3_:BitmapData = new BitmapData(dialogueWidth,dialogueHeight,true,0);
         _loc4_ = 0;
         while(_loc4_ < dialogueWidth)
         {
            _loc3_.setPixel32(_loc4_,0,587202559);
            if(_loc4_ > 0 && _loc4_ < dialogueWidth - 1)
            {
               _loc3_.setPixel32(_loc4_,1,1157627903);
            }
            if(_loc4_ > 1 && _loc4_ < dialogueWidth - 2)
            {
               _loc3_.setPixel32(_loc4_,2,587202559);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < dialogueHeight)
         {
            _loc3_.setPixel32(0,_loc4_,587202559);
            if(_loc4_ > 0 && _loc4_ < dialogueHeight - 1)
            {
               _loc3_.setPixel32(1,_loc4_,1157627903);
            }
            if(_loc4_ > 1 && _loc4_ < dialogueHeight - 2)
            {
               _loc3_.setPixel32(2,_loc4_,587202559);
            }
            _loc4_++;
         }
         highlights = new Bitmap(_loc3_);
         highlights.blendMode = "screen";
         addChild(highlights);
         _loc3_ = new BitmapData(dialogueWidth,dialogueHeight,true,0);
         _loc4_ = 0;
         while(_loc4_ < dialogueWidth)
         {
            _loc3_.setPixel32(_loc4_,dialogueHeight - 1,2281701376);
            if(_loc4_ > 0 && _loc4_ < dialogueWidth - 1)
            {
               _loc3_.setPixel32(_loc4_,dialogueHeight - 2,1711276032);
            }
            if(_loc4_ > 1 && _loc4_ < dialogueWidth - 2)
            {
               _loc3_.setPixel32(_loc4_,dialogueHeight - 3,1140850688);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < dialogueHeight)
         {
            _loc3_.setPixel32(dialogueWidth - 1,_loc4_,2281701376);
            if(_loc4_ > 0 && _loc4_ < dialogueHeight - 1)
            {
               _loc3_.setPixel32(dialogueWidth - 2,_loc4_,1711276032);
            }
            if(_loc4_ > 1 && _loc4_ < dialogueHeight - 2)
            {
               _loc3_.setPixel32(dialogueWidth - 3,_loc4_,1140850688);
            }
            _loc4_++;
         }
         shadows = new Bitmap(_loc3_);
         shadows.blendMode = "multiply";
         addChild(shadows);
         FG = new ImportedBitmap("InterfaceForeground.png");
         FG.x = 0 - Math.random() * (FG.width - dialogueWidth);
         FG.y = 0 - Math.random() * (FG.height - dialogueHeight);
         addChild(FG);
         FGMask = new Sprite();
         FG.cacheAsBitmap = true;
         FGMask.cacheAsBitmap = true;
         addChild(FGMask);
         FG.mask = FGMask;
      }
      
      public function addToMask(param1:*) : *
      {
         FGMask.addChild(param1);
      }
      
      public function drawHorizontalLine(param1:*, param2:* = 0, param3:* = null) : *
      {
         var _loc4_:* = undefined;
         if(param3 == null)
         {
            param3 = dialogueWidth;
         }
         _loc4_ = Math.max(param2,0);
         while(_loc4_ <= Math.min(param3,dialogueWidth - 1))
         {
            shadows.bitmapData.setPixel32(_loc4_,param1 - 1,1711276032);
            if(_loc4_ > 2 && _loc4_ < dialogueWidth - 3)
            {
               shadows.bitmapData.setPixel32(_loc4_,param1 - 2,570425344);
            }
            highlights.bitmapData.setPixel32(_loc4_,param1,872415231);
            if(_loc4_ > 2 && _loc4_ < dialogueWidth - 3)
            {
               highlights.bitmapData.setPixel32(_loc4_,param1 + 1,301989887);
            }
            _loc4_++;
         }
      }
      
      public function drawVerticalLine(param1:*, param2:* = 0, param3:* = null) : *
      {
         var _loc4_:* = undefined;
         if(param3 == null)
         {
            param3 = dialogueHeight;
         }
         _loc4_ = Math.max(param2,0);
         while(_loc4_ <= Math.min(param3,dialogueHeight - 1))
         {
            shadows.bitmapData.setPixel32(param1 - 1,_loc4_,1711276032);
            if(_loc4_ > 2 && _loc4_ < dialogueHeight - 3)
            {
               shadows.bitmapData.setPixel32(param1 - 2,_loc4_,570425344);
            }
            highlights.bitmapData.setPixel32(param1,_loc4_,872415231);
            if(_loc4_ > 2 && _loc4_ < dialogueHeight - 3)
            {
               highlights.bitmapData.setPixel32(param1 + 1,_loc4_,301989887);
            }
            _loc4_++;
         }
      }
      
      public function drawRectangle(param1:*, param2:*, param3:*, param4:*, param5:* = true) : *
      {
         var _loc6_:* = undefined;
         _loc6_ = Math.max(param1,0);
         while(_loc6_ <= Math.min(param1 + param3,dialogueWidth - 1))
         {
            if(param5)
            {
               shadows.bitmapData.setPixel32(_loc6_,param2,1711276032);
               if(_loc6_ > 2 && _loc6_ < dialogueWidth - 3)
               {
                  shadows.bitmapData.setPixel32(_loc6_,param2 - 1,570425344);
               }
               highlights.bitmapData.setPixel32(_loc6_,param2 + param4,872415231);
               if(_loc6_ > 2 && _loc6_ < dialogueWidth - 3)
               {
                  highlights.bitmapData.setPixel32(_loc6_,param2 + param4 + 1,301989887);
               }
            }
            else
            {
               highlights.bitmapData.setPixel32(_loc6_,param2,872415231);
               if(_loc6_ > 2 && _loc6_ < dialogueWidth - 3)
               {
                  highlights.bitmapData.setPixel32(_loc6_,param2 - 1,301989887);
               }
               shadows.bitmapData.setPixel32(_loc6_,param2 + param4,1711276032);
               if(_loc6_ > 2 && _loc6_ < dialogueWidth - 3)
               {
                  shadows.bitmapData.setPixel32(_loc6_,param2 + param4 + 1,570425344);
               }
            }
            _loc6_++;
         }
         _loc6_ = Math.max(param2,0);
         while(_loc6_ <= Math.min(param2 + param4,dialogueHeight - 1))
         {
            if(param5)
            {
               shadows.bitmapData.setPixel32(param1,_loc6_,1711276032);
               if(_loc6_ > 2 && _loc6_ < dialogueHeight - 3)
               {
                  shadows.bitmapData.setPixel32(param1 - 1,_loc6_,570425344);
               }
               highlights.bitmapData.setPixel32(param1 + param3,_loc6_,872415231);
               if(_loc6_ > 2 && _loc6_ < dialogueHeight - 3)
               {
                  highlights.bitmapData.setPixel32(param1 + param3 + 1,_loc6_,301989887);
               }
            }
            else
            {
               highlights.bitmapData.setPixel32(param1,_loc6_,872415231);
               if(_loc6_ > 2 && _loc6_ < dialogueHeight - 3)
               {
                  highlights.bitmapData.setPixel32(param1 - 1,_loc6_,301989887);
               }
               shadows.bitmapData.setPixel32(param1 + param3,_loc6_,1711276032);
               if(_loc6_ > 2 && _loc6_ < dialogueHeight - 3)
               {
                  shadows.bitmapData.setPixel32(param1 + param3 + 1,_loc6_,570425344);
               }
            }
            _loc6_++;
         }
      }
   }
}

