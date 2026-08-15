package IsoEngine
{
   import flash.display.Sprite;
   
   public class InterfaceButton extends Sprite
   {
      
      internal var upImage:*;
      
      internal var downImage:*;
      
      internal var overImage:*;
      
      internal var pressed:* = false;
      
      internal var action:*;
      
      internal var parameter:*;
      
      public function InterfaceButton(param1:*, param2:*, param3:* = null, param4:* = 0, param5:* = 0, param6:* = null, param7:* = null)
      {
         super();
         upImage = param1;
         downImage = param2;
         overImage = param3;
         action = param6;
         parameter = param7;
         addChild(downImage);
         downImage.visible = false;
         addChild(upImage);
         if(overImage != null)
         {
            overImage.x = param4;
            overImage.y = param5;
            addChild(overImage);
         }
         buttonMode = true;
         useHandCursor = true;
         mouseChildren = false;
         addEventListener("mouseDown",pressMe,false,0,false);
         addEventListener("mouseUp",releaseMe,false,0,false);
         addEventListener("mouseOut",leaveMe,false,0,false);
         addEventListener("removedFromStage",remove,false,0,false);
      }
      
      public function remove(param1:* = null) : *
      {
         removeEventListener("removedFromStage",remove);
      }
      
      public function pressMe(param1:*) : *
      {
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         downImage.visible = true;
         upImage.visible = false;
      }
      
      public function leaveMe(param1:* = null) : *
      {
         downImage.visible = false;
         upImage.visible = true;
      }
      
      public function releaseMe(param1:*) : *
      {
         if(action is Function && downImage.visible)
         {
            if(parameter == null)
            {
               action();
            }
            else
            {
               action(parameter);
            }
         }
         leaveMe();
      }
   }
}

