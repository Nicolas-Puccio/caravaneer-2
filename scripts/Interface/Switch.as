package Interface
{
   import IsoEngine.GameData;
   import IsoEngine.ImportedBitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class Switch extends Sprite
   {
      
      public var onImage:*;
      
      public var offImage:*;
      
      public var onFunction:*;
      
      public var doubleClickFunction:*;
      
      public var offFunction:*;
      
      public var position:*;
      
      public var type:*;
      
      public var buttMode:*;
      
      public var lastClickTime:*;
      
      public function Switch(param1:*, param2:* = true, param3:* = null, param4:* = null, param5:* = null, param6:* = null, param7:* = 0, param8:* = 0, param9:* = false, param10:* = null, param11:* = 6314064)
      {
         super();
         type = param1;
         buttMode = param9;
         if(param5 is DisplayObject && param6 is DisplayObject)
         {
            onImage = param5;
            offImage = param6;
         }
         else if(type == 3)
         {
            onImage = new Sprite();
            onImage.graphics.beginFill(5261376,0.8);
            onImage.graphics.drawRect(0,0,param7,param8);
            onImage.graphics.endFill();
            onImage.graphics.lineStyle(1,0,1);
            onImage.graphics.moveTo(1,param8 - 1);
            onImage.graphics.lineTo(1,1);
            onImage.graphics.lineTo(param7 - 1,1);
            onImage.graphics.lineStyle(1,16777215,0.3);
            onImage.graphics.lineTo(param7 - 1,param8 - 1);
            onImage.graphics.lineTo(1,param8 - 1);
            offImage = new Sprite();
            offImage.graphics.beginFill(7366752,0.8);
            offImage.graphics.drawRect(0,0,param7,param8);
            offImage.graphics.endFill();
            offImage.graphics.lineStyle(1,16777215,0.3);
            offImage.graphics.moveTo(1,param8 - 1);
            offImage.graphics.lineTo(1,1);
            offImage.graphics.lineTo(param7 - 1,1);
            offImage.graphics.lineStyle(1,0,0.6);
            offImage.graphics.lineTo(param7 - 1,param8 - 1);
            offImage.graphics.lineTo(1,param8 - 1);
         }
         else if(type == 4)
         {
            offImage = new ImportedBitmap("InterfaceSwitch4Hole.png");
            onImage = new ImportedBitmap("InterfaceSwitch4Slider.png");
         }
         else if(type == 5)
         {
            offImage = new Sprite();
            offImage.graphics.lineStyle(2,param11);
            offImage.graphics.beginFill(16777215);
            offImage.graphics.drawRect(0,0,param7,param8);
            onImage = new Sprite();
            onImage.graphics.lineStyle(2,param11);
            onImage.graphics.beginFill(16777215);
            onImage.graphics.drawRect(0,0,param7,param8);
            onImage.graphics.beginFill(6314064);
            onImage.graphics.moveTo(param7 * 0.1,param8 * 0.55);
            onImage.graphics.lineTo(param7 * 0.4,param8 * 0.85);
            onImage.graphics.lineTo(param7 * 0.9,param8 * 0.25);
            onImage.graphics.lineTo(param7 * 0.8,param8 * 0.15);
            onImage.graphics.lineTo(param7 * 0.4,param8 * 0.71);
            onImage.graphics.lineTo(param7 * 0.2,param8 * 0.45);
            onImage.graphics.endFill();
         }
         else
         {
            offImage = new ImportedBitmap("InterfaceSwitch" + type + "Down.png");
            onImage = new ImportedBitmap("InterfaceSwitch" + type + "Up.png");
         }
         onFunction = param3;
         offFunction = param4;
         doubleClickFunction = param10;
         position = param2;
         addChild(offImage);
         addChild(onImage);
         onImage.visible = position || type == 4;
         offImage.visible = !position || type == 4;
         if(type == 4)
         {
            if(position)
            {
               onImage.x = 20;
            }
            else
            {
               onImage.x = 0;
            }
         }
         buttonMode = true;
         useHandCursor = true;
         addEventListener("mouseDown",pressed,false,0,false);
         if(buttMode)
         {
            addEventListener("mouseUp",pressed,false,0,false);
            addEventListener("rollOut",releaseIfPressed,false,0,false);
         }
      }
      
      private function releaseIfPressed(param1:*) : *
      {
         if(!position)
         {
            pressed(null);
         }
      }
      
      public function pressed(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(doubleClickFunction is Function)
         {
            _loc2_ = new Date();
            if(lastClickTime != undefined && _loc2_ - lastClickTime < 150)
            {
               if(doubleClickFunction.length > 0)
               {
                  doubleClickFunction(this);
               }
               else
               {
                  doubleClickFunction();
               }
               return;
            }
         }
         position = !position;
         if(type == 4)
         {
            if(position)
            {
               onImage.x = 20;
            }
            else
            {
               onImage.x = 0;
            }
         }
         else
         {
            onImage.visible = position;
            offImage.visible = !position;
         }
         if(!buttMode || position)
         {
            if(position)
            {
               if(onFunction.length > 0)
               {
                  onFunction(this);
               }
               else
               {
                  onFunction();
               }
            }
            else if(offFunction.length > 0)
            {
               offFunction(this);
            }
            else
            {
               offFunction();
            }
         }
         if(GameData.soundFXOn && param1 != null && param1.type != "mouseUp")
         {
            new SFXSwitch().play();
         }
         lastClickTime = new Date();
      }
      
      public function setState(param1:*) : *
      {
         position = param1;
         onImage.visible = position;
         offImage.visible = !position;
      }
      
      public function remove(param1:* = null) : *
      {
         buttonMode = false;
      }
   }
}

