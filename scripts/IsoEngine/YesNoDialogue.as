package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   
   public class YesNoDialogue extends Sprite
   {
      
      public var D:*;
      
      public var BG:*;
      
      public var cancelButton:*;
      
      public var approveButton:*;
      
      public var onCancel:*;
      
      public var onApprove:*;
      
      public var text:*;
      
      public var dontClose:* = false;
      
      public var dontRemoveFunctions:* = false;
      
      public var altVar:*;
      
      private var pressedInside:* = false;
      
      public function YesNoDialogue(param1:* = false, param2:* = 190, param3:* = 148)
      {
         var _loc4_:* = undefined;
         super();
         addEventListener("mouseDown",pressMouse,false,0,false);
         BG = new Sprite();
         BG.graphics.beginFill(0,0.5);
         BG.graphics.drawRect(0,0,880,495);
         BG.graphics.endFill();
         addChild(BG);
         onCancel = new Function();
         onApprove = new Function();
         D = new Dialogue(500,200);
         D.x = param2;
         D.y = param3;
         if(!param1)
         {
            cancelButton = new Button(2,cancelFunction,Texts.fetch(919).toUpperCase());
            cancelButton.x = 270;
            cancelButton.y = 160;
            D.addChild(cancelButton);
         }
         if(!param1)
         {
            approveButton = new Button(2,approveFunction,Texts.fetch(918).toUpperCase());
            approveButton.x = 30;
            approveButton.y = 160;
         }
         else
         {
            approveButton = new Button(2,approveFunction,Texts.fetch(1181).toUpperCase());
            approveButton.x = 147;
            approveButton.y = 160;
         }
         text = new EngineText("",16777215,14,"center",10,10,480,140,true,true);
         D.addToMask(text);
         D.addChild(approveButton);
         addChild(D);
      }
      
      private function pressMouse(param1:*) : *
      {
         pressedInside = true;
      }
      
      public function cancelFunction() : *
      {
         if(!pressedInside)
         {
            return false;
         }
         onCancel();
         visible = false;
         if(!dontRemoveFunctions)
         {
            onCancel = new Function();
            onApprove = new Function();
         }
         pressedInside = false;
      }
      
      public function approveFunction() : *
      {
         if(!pressedInside)
         {
            return false;
         }
         onApprove();
         if(!dontClose)
         {
            visible = false;
         }
         dontClose = false;
         if(!dontRemoveFunctions)
         {
            onCancel = new Function();
            onApprove = new Function();
         }
         pressedInside = false;
      }
      
      public function setText(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         text.text = param1;
         text.y = 80 - text.textHeight / 2 - 2;
         if(text.textHeight > text.height - 4)
         {
            text.y = 20;
            text.height = text.textHeight + 4;
            approveButton.y = 20 + text.textHeight + 12;
            if(cancelButton is Button)
            {
               cancelButton.y = approveButton.y;
            }
            _loc3_ = D.x;
            _loc2_ = D.y;
            removeChild(D);
            D = new Dialogue(500,text.textHeight + 72);
            D.x = _loc3_;
            D.y = _loc2_ - (text.height - 140) / 2;
            D.addToMask(text);
            D.addChild(approveButton);
            if(cancelButton is Button)
            {
               D.addChild(cancelButton);
            }
            addChild(D);
         }
      }
      
      public function remove() : *
      {
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         D = null;
         BG = null;
         if(cancelButton is Button)
         {
            cancelButton.remove();
         }
         cancelButton = null;
         if(approveButton is Button)
         {
            approveButton.remove();
         }
         approveButton = null;
         onCancel = null;
         onApprove = null;
         text = null;
         altVar = null;
      }
   }
}

