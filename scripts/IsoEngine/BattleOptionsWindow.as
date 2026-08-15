package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   import flash.media.SoundTransform;
   
   public class BattleOptionsWindow extends Sprite
   {
      
      public var BG:*;
      
      public var D:*;
      
      public var switches:*;
      
      public var GD:*;
      
      public var BF:*;
      
      public var onClose:*;
      
      public var confirm:*;
      
      public var autoCenter:*;
      
      public var fasterWalking:*;
      
      public var showGrid:*;
      
      public var soundFXControl:*;
      
      public const switchPairs:*;
      
      public function BattleOptionsWindow(param1:*, param2:*)
      {
         var i:*;
         var title:*;
         var switchTexts:*;
         var switchesSpace:*;
         var endGameButton:*;
         var closeButton:*;
         var fullScreenButton:*;
         var widths:*;
         var fullScreenSpace:*;
         var maxWidth:*;
         var _GD:* = param1;
         var _BF:* = param2;
         switchPairs = [{
            "name":5634,
            "variable":"autoCenter",
            "onGD":true
         },{
            "name":5635,
            "variable":"fasterWalking",
            "onGD":true
         },{
            "name":5636,
            "variable":"showGrid",
            "onGD":true
         },{
            "name":6892,
            "variable":"soundFXControl",
            "onGD":true
         }];
         super();
         onClose = new Function();
         GD = _GD;
         BF = _BF;
         BG = new Sprite();
         BG.graphics.beginFill(0,0.5);
         BG.graphics.drawRect(0,0,880,495);
         addChild(BG);
         autoCenter = GD.autoCenter;
         fasterWalking = GD.walkAnimationSpeed != 1;
         showGrid = GD.showGrid;
         soundFXControl = GD.soundFXControl;
         title = new EngineText(Texts.fetch(36).toUpperCase(),16777215,16,"center",10,9,880,20);
         switchTexts = [];
         for(i in switchPairs)
         {
            switchTexts[i] = new EngineText(Texts.fetch(switchPairs[i].name).toUpperCase(),16777215,14,"left",50,50 + i * 50,880,20);
         }
         endGameButton = new Button(2,function():*
         {
            D.visible = false;
            confirm.visible = true;
         },Texts.fetch(1435).toUpperCase());
         closeButton = new Button(2,function():*
         {
            visible = false;
            onClose();
         },Texts.fetch(1436).toUpperCase());
         fullScreenButton = new Button(2,function():*
         {
            GD.parent.switchFullScreen();
         },Texts.fetch(7031).toUpperCase());
         widths = [];
         fullScreenSpace = 0;
         if(GD.parent.fullScreenAllowed)
         {
            fullScreenSpace = 30;
         }
         widths.push(title.textWidth);
         for(i in switchTexts)
         {
            widths.push(switchTexts[i].textWidth + 50);
         }
         widths.push(200);
         maxWidth = 0;
         for(i in widths)
         {
            if(widths[i] > maxWidth)
            {
               maxWidth = widths[i];
            }
         }
         D = new Dialogue(maxWidth + 20,switchPairs.length * 50 + 120 + fullScreenSpace);
         title.width = maxWidth;
         D.addToMask(title);
         switches = [];
         for(i in switchTexts)
         {
            switchTexts[i].width = maxWidth - 40;
            D.addToMask(switchTexts[i]);
            switches[i] = new Switch(1,this[switchPairs[i].variable],activateSwitch,activateSwitch);
            switches[i].x = 10;
            switches[i].y = 35 + i * 50;
            D.addChild(switches[i]);
         }
         if(GD.parent.fullScreenAllowed)
         {
            fullScreenButton.x = (maxWidth + 20) / 2 - 103;
            fullScreenButton.y = 50 + i * 50 + 47;
            D.addChild(fullScreenButton);
         }
         endGameButton.x = (maxWidth + 20) / 2 - 103;
         endGameButton.y = 50 + i * 50 + 47 + fullScreenSpace;
         D.addChild(endGameButton);
         closeButton.x = (maxWidth + 20) / 2 - 103;
         closeButton.y = 50 + i * 50 + 77 + fullScreenSpace;
         D.addChild(closeButton);
         D.x = 440 - D.dialogueWidth / 2;
         D.y = 248 - D.dialogueHeight / 2;
         addChild(D);
         confirm = new YesNoDialogue();
         confirm.visible = false;
         addChild(confirm);
         confirm.dontRemoveFunctions = true;
         confirm.setText(Texts.fetch(5637,GD.Caravans[0].People[0].gender).toUpperCase());
         confirm.onCancel = function():*
         {
            D.visible = true;
         };
         confirm.onApprove = function():*
         {
            GD.exitGame();
         };
      }
      
      private function activateSwitch(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in switches)
         {
            if(switches[_loc3_] == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         this[switchPairs[_loc2_].variable] = !this[switchPairs[_loc2_].variable];
         switch(switchPairs[_loc2_].variable)
         {
            case "autoCenter":
               GD.autoCenter = autoCenter;
               BF.autoCenter = autoCenter;
               break;
            case "fasterWalking":
               if(fasterWalking)
               {
                  BF.walkAnimationSpeed = GD.walkAnimationSpeed = 2;
               }
               else
               {
                  BF.walkAnimationSpeed = GD.walkAnimationSpeed = 1;
               }
               break;
            case "showGrid":
               GD.showGrid = showGrid;
               BF.showGrid = BF.Grid.visible = showGrid;
               break;
            case "soundFXControl":
               GD.soundFXControl = soundFXControl;
               for(_loc3_ in BF.Characters)
               {
                  if(BF.Characters[_loc3_].flameSoundChannel)
                  {
                     if(soundFXControl)
                     {
                        BF.applySoundTransform(BF.Characters[_loc3_].flameSoundChannel,BF.Characters[_loc3_].x,BF.Characters[_loc3_].y);
                     }
                     else
                     {
                        BF.Characters[_loc3_].flameSoundChannel.soundTransform = new SoundTransform(0,0);
                     }
                  }
               }
         }
      }
      
      public function remove() : *
      {
         GD = null;
      }
   }
}

