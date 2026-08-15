package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   
   public class ColorPicker extends Sprite
   {
      
      public var D:*;
      
      public var approveButton:*;
      
      public var titleText:*;
      
      public var squares:*;
      
      public var currentSquareMark:*;
      
      public var hueStep:*;
      
      public var saturationStep:*;
      
      public var valueStep:*;
      
      public var currentColor:*;
      
      private var part:*;
      
      private var character:*;
      
      private var characterSetup:*;
      
      private var natural:* = false;
      
      private var pressedInside:* = false;
      
      internal const hueSteps:* = 6;
      
      internal const saturationSteps:* = 4;
      
      internal const valueWidth:* = 4;
      
      internal const valueHeight:* = 4;
      
      internal const squareWidth:* = 15;
      
      internal const squareGap:* = 5;
      
      public function ColorPicker()
      {
         var i:*;
         var naturalCheckbox:*;
         var naturalText:*;
         var verticalSpace:*;
         var horizontalSpace:*;
         var bigY:*;
         var smallX:*;
         var smallY:*;
         var currCenterX:*;
         var currCenterY:*;
         var wholeValueSpace:*;
         var bigX:*;
         var dropShadowPlane:*;
         super();
         addEventListener("mouseDown",pressMouse,false,0,false);
         D = new Dialogue(600,495);
         D.x = 280;
         D.y = 0;
         D.drawRectangle(10,42,580,405);
         approveButton = new Button(2,function(param1:* = null):*
         {
            visible = false;
         },Texts.fetch(1229).toUpperCase());
         approveButton.x = 197;
         approveButton.y = 459;
         naturalCheckbox = new Switch(5,false,switchNatural,switchNatural,null,null,10,10,false);
         naturalCheckbox.x = 20;
         naturalCheckbox.y = 465;
         D.addChild(naturalCheckbox);
         naturalText = new EngineText(Texts.fetch(7101),16777215,12,"left",40,461,160,18);
         D.addToMask(naturalText);
         titleText = new EngineText("",16777215,16,"center",10,11,580,22);
         horizontalSpace = 93.33333333333333;
         verticalSpace = 96.25;
         dropShadowPlane = new Sprite();
         squares = [];
         bigX = 0;
         while(bigX < 6)
         {
            squares[bigX] = [];
            bigY = 0;
            while(bigY < 4)
            {
               squares[bigX][bigY] = [];
               currCenterX = 20 + (bigX + 0.5) * horizontalSpace;
               currCenterY = 52 + (bigY + 0.5) * verticalSpace;
               smallX = 0;
               while(smallX < 4)
               {
                  squares[bigX][bigY][smallX] = [];
                  smallY = 0;
                  while(smallY < 4)
                  {
                     squares[bigX][bigY][smallX][smallY] = {};
                     squares[bigX][bigY][smallX][smallY].disp = new Sprite();
                     wholeValueSpace = 75;
                     squares[bigX][bigY][smallX][smallY].disp.x = currCenterX - wholeValueSpace / 2 + smallX * (15 + 5);
                     wholeValueSpace = 75;
                     squares[bigX][bigY][smallX][smallY].disp.y = currCenterY - wholeValueSpace / 2 + smallY * (15 + 5);
                     squares[bigX][bigY][smallX][smallY].disp.buttonMode = true;
                     squares[bigX][bigY][smallX][smallY].disp.addEventListener("click",clickedOnSquare);
                     dropShadowPlane.addChild(squares[bigX][bigY][smallX][smallY].disp);
                     smallY = Number(smallY) + 1;
                  }
                  smallX = Number(smallX) + 1;
               }
               bigY = Number(bigY) + 1;
            }
            bigX = Number(bigX) + 1;
         }
         dropShadowPlane.filters = [new DropShadowFilter(3,45,0,0.8,10,10,1)];
         D.addChild(dropShadowPlane);
         currentSquareMark = new Sprite();
         currentSquareMark.graphics.lineStyle(1,16777215,0.8);
         currentSquareMark.graphics.drawRect(0,0,15 + 5,15 + 5);
         D.addChild(currentSquareMark);
         D.addToMask(titleText);
         D.addChild(approveButton);
         addChild(D);
      }
      
      public function switchNatural() : *
      {
         natural = !natural;
         updateSquares();
         updateSquareMark();
      }
      
      public function update(param1:*, param2:*, param3:*, param4:*, param5:* = null) : *
      {
         part = param3;
         character = param4;
         characterSetup = param5;
         currentColor = param2;
         titleText.text = param1;
         updateSquares();
         updateSquareMark();
      }
      
      public function updateSquares() : *
      {
         var _loc8_:* = undefined;
         var _loc2_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc13_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc12_:* = undefined;
         var _loc4_:* = currentColor.minH;
         var _loc10_:* = currentColor.maxH;
         var _loc9_:* = currentColor.minS;
         var _loc14_:* = currentColor.maxS;
         var _loc11_:* = currentColor.minV;
         var _loc1_:* = currentColor.maxV;
         if(natural)
         {
            switch(part)
            {
               case "hair":
               case "beard":
               case "eyebrows":
                  _loc4_ = 30;
                  _loc10_ = 90;
                  _loc14_ = 70;
                  break;
               case "lips":
                  _loc10_ = 30;
                  _loc9_ = 50;
                  _loc14_ = 90;
                  _loc11_ = 40;
                  _loc1_ = 90;
                  break;
               case "eyeSockets":
                  _loc4_ = 0;
                  _loc10_ = 30;
                  _loc9_ = 20;
                  _loc14_ = 45;
                  _loc11_ = 35;
                  _loc1_ = 100;
            }
         }
         hueStep = (_loc10_ - _loc4_) / 6;
         saturationStep = (_loc14_ - _loc9_) / 4;
         valueStep = (_loc1_ - _loc11_) / (4 * 4);
         _loc12_ = 0;
         while(_loc12_ < 6)
         {
            _loc8_ = 0;
            while(_loc8_ < 4)
            {
               _loc2_ = 0;
               while(_loc2_ < 4)
               {
                  _loc6_ = 0;
                  while(_loc6_ < 4)
                  {
                     _loc7_ = currentColor.minH + _loc12_ * hueStep;
                     _loc13_ = currentColor.minS + _loc8_ * saturationStep;
                     _loc3_ = currentColor.minV + (_loc6_ * 4 + _loc2_) * valueStep;
                     _loc5_ = ColorFunctions.hsv2rgb(_loc7_,_loc13_,_loc3_);
                     squares[_loc12_][_loc8_][_loc2_][_loc6_].rgb = _loc5_;
                     squares[_loc12_][_loc8_][_loc2_][_loc6_].disp.graphics.clear();
                     squares[_loc12_][_loc8_][_loc2_][_loc6_].disp.graphics.beginFill(ColorFunctions.rgb2num(_loc5_.r,_loc5_.g,_loc5_.b));
                     squares[_loc12_][_loc8_][_loc2_][_loc6_].disp.graphics.drawRect(0,0,15,15);
                     _loc6_++;
                  }
                  _loc2_++;
               }
               _loc8_++;
            }
            _loc12_++;
         }
      }
      
      public function updateSquareMark() : *
      {
         var _loc5_:Number = Math.min(Math.max(Math.round((currentColor.hsv.h - currentColor.minH) / hueStep),0),6 - 1);
         trace("current hue is " + currentColor.hsv.h + " its position is: " + _loc5_);
         var _loc4_:Number = Math.min(Math.max(Math.round((currentColor.hsv.s - currentColor.minS) / saturationStep),0),4 - 1);
         var _loc3_:Number = Math.min(Math.max(Math.round((currentColor.hsv.v - currentColor.minV) / valueStep),0),15);
         var _loc1_:Number = _loc3_ % 4;
         var _loc2_:Number = Math.floor(_loc3_ / 4);
         currentSquareMark.x = squares[_loc5_][_loc4_][_loc1_][_loc2_].disp.x - 5 / 2;
         currentSquareMark.y = squares[_loc5_][_loc4_][_loc1_][_loc2_].disp.y - 5 / 2;
      }
      
      private function pressMouse(param1:*) : *
      {
         pressedInside = true;
      }
      
      private function clickedOnSquare(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         for(_loc4_ in squares)
         {
            for(_loc2_ in squares[_loc4_])
            {
               for(_loc3_ in squares[_loc4_][_loc2_])
               {
                  for(_loc5_ in squares[_loc4_][_loc2_][_loc3_])
                  {
                     if(param1.target == squares[_loc4_][_loc2_][_loc3_][_loc5_].disp)
                     {
                        character[part + "Color"] = {
                           "r":squares[_loc4_][_loc2_][_loc3_][_loc5_].rgb.r,
                           "g":squares[_loc4_][_loc2_][_loc3_][_loc5_].rgb.g,
                           "b":squares[_loc4_][_loc2_][_loc3_][_loc5_].rgb.b,
                           "bc":1
                        };
                        if(characterSetup != null)
                        {
                           characterSetup.update();
                        }
                        currentColor.hsv = ColorFunctions.rgb2hsv(squares[_loc4_][_loc2_][_loc3_][_loc5_].rgb.r,squares[_loc4_][_loc2_][_loc3_][_loc5_].rgb.g,squares[_loc4_][_loc2_][_loc3_][_loc5_].rgb.b);
                        currentSquareMark.x = squares[_loc4_][_loc2_][_loc3_][_loc5_].disp.x - 5 / 2;
                        currentSquareMark.y = squares[_loc4_][_loc2_][_loc3_][_loc5_].disp.y - 5 / 2;
                        break;
                     }
                  }
               }
            }
         }
      }
      
      public function remove() : *
      {
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         D = null;
         if(approveButton is Button)
         {
            approveButton.remove();
         }
         approveButton = null;
         titleText = null;
      }
   }
}

