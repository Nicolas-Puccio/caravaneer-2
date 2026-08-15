package Interface
{
   import IsoEngine.EngineText;
   import IsoEngine.GameData;
   import IsoEngine.ImportedBitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class Button extends Sprite
   {
      
      public var pressedImage:*;
      
      public var releasedImage:*;
      
      public var clickFunction:*;
      
      public var outFunction:*;
      
      public var downFunction:*;
      
      public var buttonText:*;
      
      public var onClick:*;
      
      public function Button(param1:*, param2:* = null, param3:* = null, param4:* = null, param5:* = null, param6:* = false)
      {
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc10_:* = undefined;
         var _loc12_:* = undefined;
         var _loc11_:* = undefined;
         var _loc9_:* = undefined;
         super();
         onClick = param6;
         if(param4 is DisplayObject && param5 is DisplayObject)
         {
            pressedImage = param4;
            releasedImage = param5;
         }
         else if(param1 == 7)
         {
            pressedImage = new ImportedBitmap("Button15x15Down.png");
            releasedImage = new ImportedBitmap("Button15x15Up.png");
         }
         else if(param1 == 8)
         {
            pressedImage = new ImportedBitmap("InterfaceSwitch2Up.png");
            releasedImage = new ImportedBitmap("InterfaceSwitch2Down.png");
         }
         else if(param1 == 9 || param1 == 10)
         {
            pressedImage = new ImportedBitmap("InterfaceButton6Down.png");
            releasedImage = new ImportedBitmap("InterfaceButton6Up.png");
            if(param1 == 9)
            {
               releasedImage.scaleX = pressedImage.scaleX = 0.86;
            }
            if(param1 == 10)
            {
               releasedImage.scaleX = pressedImage.scaleX = 0.71;
            }
         }
         else
         {
            pressedImage = new ImportedBitmap("InterfaceButton" + param1 + "Down.png");
            releasedImage = new ImportedBitmap("InterfaceButton" + param1 + "Up.png");
         }
         clickFunction = param2;
         addChild(pressedImage);
         addChild(releasedImage);
         pressedImage.visible = false;
         if(param3 != null)
         {
            switch(param1)
            {
               case 2:
                  _loc11_ = 4469521;
                  _loc7_ = 13;
                  _loc8_ = "center";
                  _loc13_ = 3;
                  _loc14_ = 3;
                  _loc10_ = 200;
                  _loc12_ = 20;
                  break;
               case 3:
                  _loc11_ = 2630688;
                  _loc7_ = 12;
                  _loc8_ = "center";
                  _loc13_ = 1;
                  _loc14_ = 2;
                  _loc10_ = 34;
                  _loc12_ = 20;
                  break;
               case 4:
                  _loc11_ = 15789288;
                  _loc7_ = 12;
                  _loc8_ = "center";
                  _loc13_ = 1;
                  _loc14_ = 2;
                  _loc10_ = 34;
                  _loc12_ = 20;
                  break;
               case 5:
                  _loc11_ = 15789288;
                  _loc7_ = 12;
                  _loc8_ = "center";
                  _loc13_ = 1;
                  _loc14_ = 2;
                  _loc10_ = 142;
                  _loc12_ = 20;
                  break;
               case 6:
                  _loc11_ = 4469521;
                  _loc7_ = 13;
                  _loc8_ = "center";
                  _loc13_ = 3;
                  _loc14_ = 3;
                  _loc10_ = 140;
                  _loc12_ = 20;
                  break;
               case 7:
                  _loc11_ = 4469521;
                  _loc7_ = 12;
                  _loc8_ = "center";
                  _loc13_ = 0;
                  _loc14_ = 0;
                  _loc10_ = 15;
                  _loc12_ = 15;
                  break;
               case 8:
                  _loc11_ = 4469521;
                  _loc7_ = 14;
                  _loc8_ = "center";
                  _loc13_ = 0;
                  _loc14_ = 2.5;
                  _loc10_ = 23;
                  _loc12_ = 20;
                  break;
               case 9:
                  _loc11_ = 4469521;
                  _loc7_ = 13;
                  _loc8_ = "center";
                  _loc13_ = 3;
                  _loc14_ = 3;
                  _loc10_ = 120;
                  _loc12_ = 20;
                  break;
               case 10:
                  _loc11_ = 4469521;
                  _loc7_ = 13;
                  _loc8_ = "center";
                  _loc13_ = 3;
                  _loc14_ = 3;
                  _loc10_ = 100;
                  _loc12_ = 20;
            }
            if(param3 is String)
            {
               buttonText = new EngineText(param3,_loc11_,_loc7_,_loc8_,_loc13_,_loc14_,_loc10_,_loc12_);
            }
            else
            {
               buttonText = param3;
               buttonText.x = _loc13_ + _loc10_ / 2;
               buttonText.y = _loc14_ + _loc12_ / 2;
            }
            _loc9_ = new Sprite();
            _loc9_.addChild(buttonText);
            _loc9_.mouseEnabled = false;
            _loc9_.mouseChildren = false;
            addChild(_loc9_);
         }
         buttonMode = true;
         useHandCursor = true;
         addEventListener("mouseDown",pressed,false,0,false);
         addEventListener("mouseUp",released,false,0,false);
         addEventListener("mouseOut",mOut,false,0,false);
      }
      
      public function pressed(param1:*) : *
      {
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         pressedImage.visible = true;
         releasedImage.visible = false;
         if(downFunction is Function)
         {
            if(downFunction.length > 0)
            {
               downFunction(param1.target);
            }
            else
            {
               downFunction();
            }
         }
         if(onClick && clickFunction != null)
         {
            if(clickFunction.length > 0)
            {
               clickFunction(param1.target);
            }
            else
            {
               clickFunction();
            }
         }
      }
      
      public function released(param1:*) : *
      {
         if(!onClick && clickFunction != null && pressedImage.visible)
         {
            if(clickFunction.length > 0)
            {
               clickFunction(param1.target);
            }
            else
            {
               clickFunction();
            }
         }
         mOut();
      }
      
      public function mOut(param1:* = null) : *
      {
         if(pressedImage != null)
         {
            pressedImage.visible = false;
         }
         if(releasedImage != null)
         {
            releasedImage.visible = true;
         }
         if(outFunction is Function)
         {
            if(outFunction.length > 0)
            {
               outFunction(this);
            }
            else
            {
               outFunction();
            }
         }
      }
      
      public function remove(param1:* = null) : *
      {
         buttonMode = false;
         removeEventListener("mouseDown",pressed);
         removeEventListener("mouseUp",released);
         removeEventListener("mouseOut",mOut);
         pressedImage = null;
         releasedImage = null;
         clickFunction = null;
         outFunction = null;
         downFunction = null;
         buttonText = null;
         onClick = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
   }
}

