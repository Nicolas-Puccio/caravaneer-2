package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   
   public class SettingsWindow extends Sprite
   {
      
      public var BG:*;
      
      public var D:*;
      
      public var switches:*;
      
      public var GD:*;
      
      public var onClose:*;
      
      public var warning:*;
      
      public const switchPairs:*;
      
      public function SettingsWindow(param1:*)
      {
         var i:*;
         var title:*;
         var switchTexts:*;
         var switchesSpace:*;
         var halfLength:*;
         var closeButton:*;
         var widths:*;
         var maxWidth:*;
         var leftPartWidth:*;
         var placeY:*;
         var placeX:*;
         var setGD:* = param1;
         switchPairs = [{
            "name":1550,
            "variable":"pauseOnExitTown",
            "onGD":true
         },{
            "name":1384,
            "variable":"interactWithFriendlyCaravans",
            "onGD":true
         },{
            "name":929,
            "variable":"collectForage"
         },{
            "name":930,
            "variable":"hunt"
         },{
            "name":1250,
            "variable":"milk"
         },{
            "name":6801,
            "variable":"shear"
         },{
            "name":6892,
            "variable":"soundFXControl",
            "onGD":true
         },{
            "name":1251,
            "variable":"autoFillLubricant"
         },{
            "name":1252,
            "variable":"autoFillWater"
         },{
            "name":6826,
            "variable":"distributeBatteries",
            "onGD":true
         },{
            "name":6836,
            "variable":"transportAsPassengers",
            "onGD":true
         },{
            "name":1385,
            "variable":"advancedTrading",
            "onGD":true
         },{
            "name":6802,
            "variable":"autoSave",
            "onGD":true
         },{
            "name":6893,
            "variable":"musicControl",
            "onGD":true
         }];
         super();
         onClose = new Function();
         GD = setGD;
         BG = new Sprite();
         BG.graphics.beginFill(0,0.5);
         BG.graphics.drawRect(0,0,880,495);
         addChild(BG);
         title = new EngineText(Texts.fetch(36).toUpperCase(),16777215,16,"center",10,9,880,20);
         switchTexts = [];
         halfLength = Math.ceil(switchPairs.length / 2);
         for(i in switchPairs)
         {
            switchTexts[i] = new EngineText(Texts.fetch(switchPairs[i].name,GD.Caravans[0].People[0].gender,35).toUpperCase(),16777215,14,"left",50,60 + i * 50,880,20);
         }
         closeButton = new Button(2,function():*
         {
            visible = false;
            onClose();
         },Texts.fetch(1229).toUpperCase());
         widths = [];
         widths.push(title.textWidth);
         for(i in switchTexts)
         {
            widths.push(switchTexts[i].textWidth + 50);
         }
         widths.push(200);
         maxWidth = 0;
         leftPartWidth = 0;
         i = 0;
         while(i < halfLength)
         {
            if(widths[i] > leftPartWidth)
            {
               leftPartWidth = widths[i];
            }
            i = Number(i) + 1;
         }
         i = halfLength;
         while(i < widths.length)
         {
            if(widths[i] > maxWidth)
            {
               maxWidth = widths[i];
            }
            i = Number(i) + 1;
         }
         maxWidth += leftPartWidth + 20;
         D = new Dialogue(maxWidth + 40,halfLength * 50 + 100);
         title.width = maxWidth;
         D.addToMask(title);
         switches = [];
         for(i in switchTexts)
         {
            if(i < halfLength)
            {
               placeX = 20;
               placeY = 45 + i * 50;
            }
            else
            {
               placeX = leftPartWidth + 40;
               placeY = 45 + (i - halfLength) * 50;
            }
            switchTexts[i].width = maxWidth - 40;
            D.addToMask(switchTexts[i]);
            if(switchPairs[i].onGD)
            {
               switches[i] = new Switch(1,GD[switchPairs[i].variable],activateSwitch,activateSwitch);
            }
            else
            {
               switches[i] = new Switch(1,GD.Caravans[0][switchPairs[i].variable],activateSwitch,activateSwitch);
            }
            switches[i].x = placeX;
            switches[i].y = placeY;
            D.addChild(switches[i]);
            switchTexts[i].x = placeX + 40;
            switchTexts[i].y = placeY + 15;
         }
         closeButton.x = (maxWidth + 20) / 2 - 103;
         closeButton.y = 60 + (halfLength - 1) * 50 + 47;
         D.addChild(closeButton);
         D.x = 440 - D.dialogueWidth / 2;
         D.y = 248 - D.dialogueHeight / 2;
         D.drawHorizontalLine(40);
         addChild(D);
      }
      
      public function update() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in switchPairs)
         {
            if(switchPairs[_loc1_].onGD)
            {
               switches[_loc1_].setState(GD[switchPairs[_loc1_].variable]);
            }
            else
            {
               switches[_loc1_].setState(GD.Caravans[0][switchPairs[_loc1_].variable]);
            }
         }
      }
      
      private function activateSwitch(param1:*) : *
      {
         var num:*;
         var i:*;
         var t:* = param1;
         for(i in switches)
         {
            if(switches[i] == t)
            {
               num = i;
               break;
            }
         }
         if(switchPairs[num].variable == "advancedTrading" && !GD.warnedAboutAdvancedTrading)
         {
            GD.warnedAboutAdvancedTrading = true;
            warning = new YesNoDialogue();
            warning.setText(Texts.fetch(6813,GD.Caravans[0].People[0].gender).toUpperCase());
            addChild(warning);
            warning.onCancel = function():*
            {
               switches[i].onImage.visible = false;
               switches[i].offImage.visible = true;
               switches[i].position = false;
               removeChild(warning);
            };
            warning.onApprove = function():*
            {
               GD.advancedTrading = true;
               removeChild(warning);
            };
         }
         else
         {
            if(switchPairs[num].onGD)
            {
               GD[switchPairs[num].variable] = !GD[switchPairs[num].variable];
            }
            else
            {
               GD.Caravans[0][switchPairs[num].variable] = !GD.Caravans[0][switchPairs[num].variable];
            }
            if(switchPairs[num].variable == "musicControl")
            {
               if(!GameData.musicOn)
               {
                  GD.travelModeMusicControl.volume = 0;
                  GD.travelModeMusic.soundTransform = GD.travelModeMusicControl;
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

