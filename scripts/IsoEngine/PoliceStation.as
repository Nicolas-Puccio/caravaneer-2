package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class PoliceStation extends Sprite
   {
      
      public var D:*;
      
      public var GD:*;
      
      public var nameText:*;
      
      public var picHolder:*;
      
      public var bottomLineCapacity:*;
      
      public var bottomLineDate:*;
      
      public var bottomLineMoney:*;
      
      public var list:*;
      
      public var listArray:*;
      
      public var selectedTarget:*;
      
      public var pic:*;
      
      public var picInside:*;
      
      public var targetName:*;
      
      public var rewardText:*;
      
      public var exitButton:*;
      
      public var remandButton:*;
      
      public var infoLine:*;
      
      public var onExit:*;
      
      public var rewardSum:*;
      
      public var faction:*;
      
      public var rewardSize:*;
      
      public var lines:*;
      
      public var validList:*;
      
      public var ConfirmDialogue:*;
      
      public var MessageDialogue:*;
      
      public function PoliceStation(param1:*)
      {
         var _loc2_:* = undefined;
         super();
         addEventListener("enterFrame",EF,false,0,false);
         D = new Dialogue(880,495);
         addChild(D);
         GD = param1;
         bottomLineCapacity = new EngineText("",0,14,"left",10,474,860,20);
         bottomLineDate = new EngineText("",0,14,"right",10,474,860,20);
         bottomLineMoney = new EngineText("",0,14,"left",10,474,860,20);
         D.addToMask(bottomLineCapacity);
         D.addToMask(bottomLineDate);
         D.addToMask(bottomLineMoney);
         lines = new Sprite();
         lines.graphics.lineStyle(1,16777215);
         onExit = new Function();
         lines.graphics.moveTo(0,472);
         lines.graphics.lineTo(880,472);
         lines.graphics.drawRect(9,361,862,102);
         lines.graphics.moveTo(10,451);
         lines.graphics.lineTo(870,451);
         lines.graphics.drawRect(390,172,100,100);
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(16777215,0.3);
         _loc3_.graphics.drawRect(0,0,860,10);
         _loc3_.x = 10;
         _loc3_.y = 452;
         D.addChild(_loc3_);
         D.addToMask(lines);
         pic = new Sprite();
         pic.x = 390;
         pic.y = 172;
         pic.scaleX = pic.scaleY = 0.4;
         D.addChild(pic);
         nameText = new EngineText("",16777215,18,"center",10,10,860,20);
         D.addToMask(nameText);
         picHolder = new Sprite();
         picHolder.x = 440;
         picHolder.y = 100;
         picHolder.scaleX = picHolder.scaleY = 2.5;
         D.addToMask(picHolder);
         targetName = new EngineText("",16777215,14,"center",10,282,860,20);
         D.addToMask(targetName);
         rewardText = new EngineText("",16777215,18,"center",10,310,860,20);
         D.addToMask(rewardText);
         infoLine = new EngineText("",16777215,14,"center",10,222,860,20);
         D.addToMask(infoLine);
         exitButton = new Button(2,exit,Texts.fetch(1344).toUpperCase());
         exitButton.x = 17;
         exitButton.y = 309;
         D.addChild(exitButton);
         remandButton = new Button(2,claimReward,Texts.fetch(2857).toUpperCase());
         remandButton.x = 657;
         remandButton.y = 309;
         D.addChild(remandButton);
         list = new List([],860,false,[],[],selectTarget,null,true,true,false,false,9472128,16777215,2,1);
         list.x = 10;
         list.y = 362;
         D.addChild(list);
         ConfirmDialogue = new YesNoDialogue();
         ConfirmDialogue.visible = false;
         addChild(ConfirmDialogue);
         MessageDialogue = new YesNoDialogue(true);
         MessageDialogue.visible = false;
         addChild(MessageDialogue);
      }
      
      public function setFacility(param1:* = null, param2:* = null, param3:* = "", param4:* = null) : *
      {
         var _loc5_:* = undefined;
         validList = [];
         faction = param1;
         rewardSize = param2;
         nameText.text = param3;
         while(picHolder.numChildren > 0)
         {
            picHolder.removeChildAt(0);
         }
         picHolder.addChild(param4);
         for(_loc5_ in GD.Caravans[0].People)
         {
            if(GD.Caravans[0].People[_loc5_].category == 3 && GD.getFactionRelations(faction,GD.Caravans[0].People[_loc5_].oldFaction) < 0)
            {
               validList.push(GD.Caravans[0].People[_loc5_]);
            }
         }
         list.update(validList);
      }
      
      private function update() : *
      {
         var _loc1_:* = undefined;
         if(picInside is DisplayObject && pic.contains(picInside))
         {
            pic.removeChild(picInside);
         }
         rewardText.visible = remandButton.visible = lines.visible = selectedTarget is Character;
         if(list is List)
         {
            list.visible = rewardText.visible;
         }
         if(selectedTarget is Character)
         {
            picInside = new Bitmap(selectedTarget.generatePortrait());
            pic.addChild(picInside);
            updateBottomLine();
            targetName.text = selectedTarget.name.toUpperCase();
            exitButton.x = 17;
         }
         else
         {
            targetName.text = Texts.fetch(2858).toUpperCase();
            exitButton.x = 337;
         }
         rewardText.text = Texts.fetch(2855) + ": " + MathFunctions.NumberFormat(rewardSum,0,true) + " €";
         updateBottomLine();
      }
      
      public function selectTarget(param1:*) : *
      {
         selectedTarget = param1;
         if(selectedTarget is Character)
         {
            rewardSum = rewardFormula(selectedTarget);
         }
         update();
      }
      
      private function updateBottomLine() : *
      {
         bottomLineCapacity.text = Texts.fetch(903).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].totalCargo,0) + "/" + MathFunctions.NumberFormat(GD.Caravans[0].maxCargo,0) + " " + Texts.fetch(12).toUpperCase();
         bottomLineMoney.text = Texts.fetch(20).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].money,2);
         var _loc1_:* = GD.makeDate();
         bottomLineDate.text = _loc1_.Day2d + "-" + _loc1_.ShortMonthName + "-" + _loc1_.Year2d + " " + _loc1_.Hour2d + ":" + _loc1_.Minute2d;
         var _loc2_:Number = 860 - bottomLineCapacity.textWidth - bottomLineDate.textWidth;
         bottomLineMoney.x = 10 + bottomLineCapacity.textWidth + _loc2_ / 2 - bottomLineMoney.textWidth / 2;
      }
      
      private function exit() : *
      {
         visible = false;
         onExit();
      }
      
      private function EF(param1:*) : *
      {
      }
      
      private function rewardFormula(param1:*) : *
      {
         var _loc2_:Number = Math.pow(param1.price / 15,2) * rewardSize * (0 - GD.getFactionRelations(faction,param1.oldFaction)) / 10000000000;
         if(_loc2_ < 0.05)
         {
            return Math.round(_loc2_ * 100);
         }
         if(_loc2_ < 0.5)
         {
            return Math.round(_loc2_ * 10) * 10;
         }
         return Math.round(_loc2_) * 100;
      }
      
      public function remove() : *
      {
         removeEventListener("enterFrame",EF);
         list.remove();
         GD = null;
      }
      
      public function claimReward() : *
      {
         ConfirmDialogue.setText(Texts.fetch(2859,selectedTarget.gender).replace("@name@",selectedTarget.name).replace("@money@",MathFunctions.NumberFormat(rewardSum,0) + " €").toUpperCase());
         ConfirmDialogue.onApprove = function():*
         {
            validList.splice(validList.indexOf(selectedTarget),1);
            GD.Caravans[0].removePerson(selectedTarget);
            GD.Caravans[0].money += rewardSum;
            GD.affectFactionRelations(1,faction);
            list.update(validList);
            GD.Story.specificReputations[8]--;
            updateBottomLine();
         };
         ConfirmDialogue.visible = true;
      }
   }
}

