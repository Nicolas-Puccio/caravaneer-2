package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class HealingFacility extends Sprite
   {
      
      public var D:*;
      
      public var GD:*;
      
      public var town:*;
      
      public var facility:*;
      
      public var facilitySign:*;
      
      public var facilityCategory:*;
      
      public var nameText:*;
      
      public var townText:*;
      
      public var surgeriesText:*;
      
      public var bottomLineCapacity:*;
      
      public var bottomLineDate:*;
      
      public var bottomLineMoney:*;
      
      public var list:*;
      
      public var listArray:*;
      
      public var selectedTarget:*;
      
      public var pic:*;
      
      public var picInside:*;
      
      public var targetName:*;
      
      public var targetHealth:*;
      
      public var exitButton:*;
      
      public var healButton:*;
      
      public var beigeBarMask:*;
      
      public var blueBarMask:*;
      
      public var currHeal:*;
      
      public var healingPointer:*;
      
      public var nowDragging:* = false;
      
      public var startX:*;
      
      public var infoLine:*;
      
      public var onExit:*;
      
      public var surgeryButtons:*;
      
      public var surgeryBlanks:*;
      
      public var beigeBar:*;
      
      public var blueBar:*;
      
      public var woundedText:*;
      
      public var healAllPriceText:*;
      
      public var healAllButton:*;
      
      public var healAllPrice:*;
      
      public var totalWounded:*;
      
      public var ConfirmDialogue:*;
      
      public var MessageDialogue:*;
      
      internal const healthBarX:* = 250;
      
      internal const healthBarWidth:* = 380;
      
      internal const healthBarY:* = 269;
      
      internal const healthBarHeight:* = 24;
      
      public function HealingFacility(param1:*)
      {
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
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
         var _loc6_:Sprite = new Sprite();
         _loc6_.graphics.lineStyle(1,16777215);
         onExit = new Function();
         _loc6_.graphics.moveTo(0,472);
         _loc6_.graphics.lineTo(880,472);
         _loc6_.graphics.drawRect(9,361,862,102);
         _loc6_.graphics.moveTo(10,451);
         _loc6_.graphics.lineTo(870,451);
         _loc6_.graphics.drawRect(390,112,100,100);
         var _loc7_:Sprite = new Sprite();
         _loc7_.graphics.beginFill(16777215,0.3);
         _loc7_.graphics.drawRect(0,0,860,10);
         _loc7_.x = 10;
         _loc7_.y = 452;
         D.addChild(_loc7_);
         D.addToMask(_loc6_);
         _loc5_ = 0;
         while(_loc5_ <= 100)
         {
            _loc4_ = 3;
            if(_loc5_ % 10 == 0)
            {
               _loc4_ = 7;
            }
            _loc6_.graphics.moveTo(250 + 380 * _loc5_ / 100,257);
            _loc6_.graphics.lineTo(250 + 380 * _loc5_ / 100,257 - _loc4_);
            _loc5_ += 2;
         }
         pic = new Sprite();
         pic.x = 390;
         pic.y = 112;
         pic.scaleX = pic.scaleY = 0.4;
         D.addChild(pic);
         nameText = new EngineText("",16777215,14,"left",20,32,400,20);
         D.addToMask(nameText);
         townText = new EngineText("",16777215,14,"right",460,32,400,20);
         D.addToMask(townText);
         woundedText = new EngineText("",16777215,14,"left",20,327,400,20);
         D.addToMask(woundedText);
         healAllPriceText = new EngineText("",16777215,14,"right",460,327,400,20);
         D.addToMask(healAllPriceText);
         targetName = new EngineText("",16777215,14,"left",20,152,400,20);
         D.addToMask(targetName);
         targetHealth = new EngineText("",16777215,14,"right",460,152,400,20);
         D.addToMask(targetHealth);
         infoLine = new EngineText("",16777215,14,"center",10,222,860,20);
         D.addToMask(infoLine);
         var _loc8_:Sprite = new Sprite();
         _loc8_.graphics.beginFill(2367002,0.6);
         _loc8_.graphics.drawRect(0,0,392,24);
         _loc8_.x = 244;
         _loc8_.y = 269;
         D.addChild(_loc8_);
         beigeBar = new Sprite();
         beigeBar.x = 244;
         beigeBar.y = 269;
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(392,24,3.141592653589793 / 2,0,0);
         beigeBar.graphics.beginGradientFill("linear",[7299403,12102291,16777215,12102291,12102291,7299403],[1,1,1,1,1,1],[0,50,55,60,200,255],_loc2_,"repeat");
         beigeBar.graphics.drawRect(0,0,392,24);
         D.addChild(beigeBar);
         beigeBarMask = new Sprite();
         beigeBarMask.x = 250;
         beigeBarMask.y = 269;
         D.addChild(beigeBarMask);
         beigeBar.mask = beigeBarMask;
         blueBar = new Sprite();
         blueBar.x = 244;
         blueBar.y = 269;
         blueBar.graphics.beginGradientFill("linear",[5460343,8881579,16777215,8881579,8881579,5460343],[1,1,1,1,1,1],[0,50,55,60,200,255],_loc2_,"repeat");
         blueBar.graphics.drawRect(0,0,392,24);
         D.addChild(blueBar);
         blueBarMask = new Sprite();
         blueBarMask.x = 250;
         blueBarMask.y = 269;
         D.addChild(blueBarMask);
         blueBar.mask = blueBarMask;
         var _loc3_:ImportedBitmap = new ImportedBitmap("HealingFrame.png");
         _loc3_.x = 235;
         _loc3_.y = 257;
         D.addChild(_loc3_);
         healingPointer = new Sprite();
         healingPointer.addChild(new ImportedBitmap("HealingFramePointer.png"));
         healingPointer.y = 284;
         healingPointer.x = 440;
         healingPointer.buttonMode = true;
         healingPointer.addEventListener("mouseDown",startDragging,false,0,false);
         addEventListener("mouseUp",stopDragging,false,0,false);
         D.addChild(healingPointer);
         exitButton = new Button(2,exit,Texts.fetch(1344).toUpperCase());
         exitButton.x = 17;
         exitButton.y = 269;
         D.addChild(exitButton);
         healButton = new Button(2,heal," ");
         healButton.x = 657;
         healButton.y = 269;
         D.addChild(healButton);
         healAllButton = new Button(2,healAll," ");
         healAllButton.x = 337;
         healAllButton.y = 324;
         D.addChild(healAllButton);
         surgeryButtons = [];
         surgeryBlanks = [];
         _loc5_ = 1;
         while(_loc5_ <= 3)
         {
            surgeryButtons[_loc5_] = {};
            surgeryButtons[_loc5_].disp = new Sprite();
            surgeryButtons[_loc5_].disp.blendMode = "layer";
            surgeryButtons[_loc5_].disp.mouseChildren = false;
            surgeryButtons[_loc5_].disp.buttonMode = true;
            surgeryButtons[_loc5_].txt = new EngineText(Texts.fetch(1374 + _loc5_).toUpperCase(),16777215,16,"center",0,-1,880,20);
            surgeryButtons[_loc5_].txt.width = surgeryButtons[_loc5_].txt.textWidth + 20;
            surgeryButtons[_loc5_].disp.graphics.beginFill(16777215);
            surgeryButtons[_loc5_].disp.graphics.drawRect(0,0,surgeryButtons[_loc5_].txt.width,20);
            surgeryButtons[_loc5_].txt.blendMode = "erase";
            surgeryButtons[_loc5_].disp.addChild(surgeryButtons[_loc5_].txt);
            surgeryButtons[_loc5_].disp.y = 82;
            surgeryButtons[_loc5_].disp.x = _loc5_ * 200;
            surgeryButtons[_loc5_].disp.addEventListener("click",clickSurgeryButton,false,0,false);
            surgeryButtons[_loc5_].disp.visible = false;
            D.addToMask(surgeryButtons[_loc5_].disp);
            surgeryBlanks[_loc5_] = {};
            surgeryBlanks[_loc5_].disp = new Sprite();
            surgeryBlanks[_loc5_].txt = new EngineText(Texts.fetch(1374 + _loc5_).toUpperCase(),16777215,16,"center",0,-1,880,20);
            surgeryBlanks[_loc5_].txt.width = surgeryBlanks[_loc5_].txt.textWidth + 20;
            surgeryBlanks[_loc5_].disp.graphics.lineStyle(1,16777215);
            surgeryBlanks[_loc5_].disp.graphics.drawRect(0,0,surgeryBlanks[_loc5_].txt.width,20);
            surgeryBlanks[_loc5_].disp.y = 82;
            surgeryBlanks[_loc5_].disp.addChild(surgeryBlanks[_loc5_].txt);
            D.addToMask(surgeryBlanks[_loc5_].disp);
            _loc5_++;
         }
         list = new List([],860,false,[],[],selectHealTarget,null,true,true,false,false,9472128,16777215,2,1);
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
      
      private function clickSurgeryButton(param1:*) : *
      {
         var num:*;
         var i:*;
         var price:*;
         var e:* = param1;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(i in surgeryButtons)
         {
            if(surgeryButtons[i].disp == e.target)
            {
               num = i;
               break;
            }
         }
         if(num == 1)
         {
            price = eyeSurgeryPrice();
         }
         if(num == 2)
         {
            price = armSurgeryPrice();
         }
         if(num == 3)
         {
            price = legSurgeryPrice();
         }
         if(price > GD.Caravans[0].money)
         {
            MessageDialogue.setText(Texts.fetch(1378).replace("@money@",MathFunctions.NumberFormat(price,2) + " €").toUpperCase() + "\n\n" + Texts.fetch(1379).toUpperCase());
            MessageDialogue.visible = true;
         }
         else
         {
            ConfirmDialogue.setText(Texts.fetch(1378).replace("@money@",MathFunctions.NumberFormat(price,2) + " €").toUpperCase() + "\n\n" + Texts.fetch(1380).toUpperCase());
            ConfirmDialogue.visible = true;
            ConfirmDialogue.onApprove = function():*
            {
               GD.Caravans[0].money -= Math.round(price * 100) / 100;
               if(num == 1)
               {
                  selectedTarget.eyeDamage = false;
               }
               if(num == 2)
               {
                  selectedTarget.armDamage = false;
               }
               if(num == 3)
               {
                  selectedTarget.legDamage = false;
               }
               list.update();
            };
         }
      }
      
      public function setFacility(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc5_:* = undefined;
         if(facilitySign is DisplayObject && D.FGMask.contains(facilitySign))
         {
            D.FGMask.removeChild(facilitySign);
         }
         town = param1;
         facility = param2;
         facilitySign = param3;
         facilityCategory = param4;
         facilitySign.x = 440;
         facilitySign.y = 40;
         D.addToMask(facilitySign);
         nameText.text = Texts.fetch(facility.name).toUpperCase();
         townText.text = town.name.toUpperCase();
         listArray = [];
         if(facilityCategory == 1)
         {
            listArray = GD.Caravans[0].People;
         }
         else
         {
            for(_loc5_ in GD.Caravans[0].Transport)
            {
               if(facilityCategory == 2 && GD.Caravans[0].Transport[_loc5_].category == 1 || facilityCategory == 3 && (GD.Caravans[0].Transport[_loc5_].category == 2 || GD.Caravans[0].Transport[_loc5_].category == 3))
               {
                  listArray.push(GD.Caravans[0].Transport[_loc5_]);
               }
            }
         }
         for(_loc5_ in listArray)
         {
            listArray[_loc5_].health = Math.round(listArray[_loc5_].health);
         }
         list.scrollableArea.Content.x = 0;
         list.update(listArray);
         if(facilityCategory == 3)
         {
            healButton.buttonText.text = Texts.fetch(1364).toUpperCase();
            healAllButton.buttonText.text = Texts.fetch(3515).toUpperCase();
         }
         else
         {
            healButton.buttonText.text = Texts.fetch(1363).toUpperCase();
            healAllButton.buttonText.text = Texts.fetch(3514).toUpperCase();
         }
         update();
      }
      
      private function update() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         if(picInside is DisplayObject && pic.contains(picInside))
         {
            pic.removeChild(picInside);
         }
         for(_loc2_ in surgeryButtons)
         {
            surgeryButtons[_loc2_].disp.visible = false;
            surgeryBlanks[_loc2_].disp.visible = false;
         }
         healingPointer.visible = beigeBar.visible = blueBar.visible = selectedTarget is Object;
         if(!(selectedTarget is Object))
         {
            targetName.text = targetHealth.text = infoLine.text = "";
         }
         if(selectedTarget != null)
         {
            if(selectedTarget is Character)
            {
               picInside = new Bitmap(selectedTarget.generatePortrait());
            }
            else
            {
               picInside = selectedTarget.picture;
            }
            pic.addChild(picInside);
            updateBottomLine();
            targetName.text = selectedTarget.name.toUpperCase();
            if(selectedTarget is TransportUnit && selectedTarget.category != 1)
            {
               targetHealth.text = Texts.abbreviation(1153).toUpperCase();
            }
            else
            {
               targetHealth.text = Texts.fetch(50).toUpperCase();
            }
            targetHealth.text += ": " + Math.round(selectedTarget.health) + " / " + Math.round(selectedTarget.maxHealth);
            beigeBarMask.graphics.clear();
            beigeBarMask.graphics.beginFill(16777215);
            beigeBarMask.graphics.drawRect(-5,-5,380 * Math.round(selectedTarget.health) / Math.round(selectedTarget.maxHealth) + 5,24 + 10);
            if(facilityCategory == 1)
            {
               _loc1_ = [];
               _loc5_ = [];
               for(_loc2_ in facility.surgeries)
               {
                  if(facility.surgeries[_loc2_] == 1)
                  {
                     _loc5_.push(surgeryBlanks[1]);
                     _loc1_.push(surgeryButtons[1]);
                  }
                  if(facility.surgeries[_loc2_] == 2)
                  {
                     _loc5_.push(surgeryBlanks[2]);
                     _loc1_.push(surgeryButtons[2]);
                  }
                  if(facility.surgeries[_loc2_] == 3)
                  {
                     _loc5_.push(surgeryBlanks[3]);
                     _loc1_.push(surgeryButtons[3]);
                  }
               }
               _loc4_ = 0;
               for(_loc2_ in _loc1_)
               {
                  _loc4_ += _loc1_[_loc2_].disp.width;
               }
               _loc4_ += (_loc1_.length - 1) * 10;
               _loc3_ = 440 - _loc4_ / 2;
               for(_loc2_ in _loc1_)
               {
                  _loc1_[_loc2_].disp.x = _loc3_;
                  _loc5_[_loc2_].disp.x = _loc3_;
                  _loc1_[_loc2_].disp.visible = _loc1_[_loc2_] == surgeryButtons[1] && selectedTarget.eyeDamage || _loc1_[_loc2_] == surgeryButtons[2] && selectedTarget.armDamage || _loc1_[_loc2_] == surgeryButtons[3] && selectedTarget.legDamage;
                  _loc5_[_loc2_].disp.visible = !_loc1_[_loc2_].disp.visible;
                  _loc3_ += _loc1_[_loc2_].disp.width + 10;
               }
            }
            if(currHeal - selectedTarget.health > Math.floor(GD.Caravans[0].money / healPrice()))
            {
               currHeal = selectedTarget.health + Math.floor(GD.Caravans[0].money / healPrice());
            }
            updateHealLevel();
         }
         totalWounded = 0;
         healAllPrice = 0;
         if(facilityCategory == 1)
         {
            for(_loc2_ in GD.Caravans[0].People)
            {
               if(Math.round(GD.Caravans[0].People[_loc2_].health) < Math.round(GD.Caravans[0].People[_loc2_].maxHealth))
               {
                  totalWounded = Number(totalWounded) + 1;
                  healAllPrice += healPrice(GD.Caravans[0].People[_loc2_]) * (Math.round(GD.Caravans[0].People[_loc2_].maxHealth) - Math.round(GD.Caravans[0].People[_loc2_].health));
               }
            }
            woundedText.text = Texts.fetch(3511).toUpperCase() + ": " + totalWounded;
            healAllPriceText.text = Texts.fetch(3516).toUpperCase() + ": " + MathFunctions.NumberFormat(healAllPrice,2,true) + " €";
         }
         if(facilityCategory == 2)
         {
            for(_loc2_ in GD.Caravans[0].Transport)
            {
               if(GD.Caravans[0].Transport[_loc2_].category == 1 && Math.round(GD.Caravans[0].Transport[_loc2_].health) < Math.round(GD.Caravans[0].Transport[_loc2_].maxHealth))
               {
                  totalWounded = Number(totalWounded) + 1;
                  healAllPrice += healPrice(GD.Caravans[0].Transport[_loc2_]) * (Math.round(GD.Caravans[0].Transport[_loc2_].maxHealth) - Math.round(GD.Caravans[0].Transport[_loc2_].health));
               }
            }
            woundedText.text = Texts.fetch(3512).toUpperCase() + ": " + totalWounded;
            healAllPriceText.text = Texts.fetch(3516).toUpperCase() + ": " + MathFunctions.NumberFormat(healAllPrice,2,true) + " €";
         }
         if(facilityCategory == 3)
         {
            for(_loc2_ in GD.Caravans[0].Transport)
            {
               if(GD.Caravans[0].Transport[_loc2_].category != 1 && Math.round(GD.Caravans[0].Transport[_loc2_].health) < Math.round(GD.Caravans[0].Transport[_loc2_].maxHealth))
               {
                  totalWounded = Number(totalWounded) + 1;
                  healAllPrice += healPrice(GD.Caravans[0].Transport[_loc2_]) * (Math.round(GD.Caravans[0].Transport[_loc2_].maxHealth) - Math.round(GD.Caravans[0].Transport[_loc2_].health));
               }
            }
            woundedText.text = Texts.fetch(3513).toUpperCase() + ": " + totalWounded;
            healAllPriceText.text = Texts.fetch(3517).toUpperCase() + ": " + MathFunctions.NumberFormat(healAllPrice,2,true) + " €";
         }
      }
      
      public function updateHealLevel() : *
      {
         var _loc1_:Number = 250 + Math.round(currHeal) / Math.round(selectedTarget.maxHealth) * 380;
         var _loc2_:Number = Math.round(selectedTarget.health) / Math.round(selectedTarget.maxHealth) * 380;
         healingPointer.x = _loc1_ - 9;
         blueBarMask.graphics.clear();
         blueBarMask.graphics.beginFill(16711680);
         blueBarMask.graphics.drawRect(_loc2_,-5,_loc1_ - _loc2_ - 250,24 + 10);
         if(selectedTarget is Character || selectedTarget is TransportUnit && selectedTarget.category == 1)
         {
            infoLine.text = Texts.fetch(1365).replace("@number@",Math.round(currHeal - selectedTarget.health)).replace("@price@",MathFunctions.NumberFormat(Math.round(currHeal - selectedTarget.health) * healPrice(),2,false) + " €").toUpperCase();
         }
         else
         {
            infoLine.text = Texts.fetch(1366).replace("@number@",Math.round(currHeal - selectedTarget.health)).replace("@price@",MathFunctions.NumberFormat(Math.round(currHeal - selectedTarget.health) * healPrice(),2,false) + " €").toUpperCase();
         }
      }
      
      public function selectHealTarget(param1:*) : *
      {
         selectedTarget = param1;
         if(selectedTarget != null)
         {
            currHeal = selectedTarget.maxHealth;
         }
         else
         {
            currHeal = 0;
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
      
      private function healPrice(param1:* = null) : *
      {
         if(param1 == null)
         {
            param1 = selectedTarget;
         }
         if(param1 is Character)
         {
            if(param1.specialPurpose == 1 && town == GD.Towns[17])
            {
               return 0;
            }
            return 40 * facility.relPrice;
         }
         if(param1 is TransportUnit)
         {
            if(param1.category == 1)
            {
               return 20 * facility.relPrice;
            }
            if(param1.category == 2)
            {
               return 25 * facility.relPrice;
            }
            if(param1.category == 3)
            {
               return 70 * facility.relPrice;
            }
         }
      }
      
      private function eyeSurgeryPrice() : *
      {
         return 10000 * facility.relPrice;
      }
      
      private function armSurgeryPrice() : *
      {
         return 6000 * facility.relPrice;
      }
      
      private function legSurgeryPrice() : *
      {
         return 8000 * facility.relPrice;
      }
      
      private function startDragging(param1:*) : *
      {
         nowDragging = true;
         startX = mouseX - healingPointer.x;
      }
      
      private function stopDragging(param1:*) : *
      {
         nowDragging = false;
      }
      
      private function exit() : *
      {
         visible = false;
         onExit();
      }
      
      private function heal() : *
      {
         if(selectedTarget is Object)
         {
            GD.Caravans[0].money -= Math.round(currHeal - selectedTarget.health) * healPrice();
            selectedTarget.health = currHeal;
            list.update();
         }
      }
      
      private function healAll() : *
      {
         if(totalWounded == 0 || GD.Caravans[0].money <= 0)
         {
            return;
         }
         if(healAllPrice > GD.Caravans[0].money)
         {
            ConfirmDialogue.setText(Texts.fetch(3520 + facilityCategory).replace("@money@",MathFunctions.NumberFormat(healAllPrice,2,true) + " €").toUpperCase());
            ConfirmDialogue.onApprove = function():*
            {
               var _loc2_:* = undefined;
               var _loc5_:* = undefined;
               var _loc1_:Array = [];
               var _loc3_:Boolean = false;
               if(facilityCategory == 1)
               {
                  for(_loc5_ in GD.Caravans[0].People)
                  {
                     _loc1_.push(GD.Caravans[0].People[_loc5_]);
                  }
               }
               if(facilityCategory == 2)
               {
                  for(_loc5_ in GD.Caravans[0].Transport)
                  {
                     if(GD.Caravans[0].Transport[_loc5_].category == 1)
                     {
                        _loc1_.push(GD.Caravans[0].Transport[_loc5_]);
                     }
                  }
               }
               if(facilityCategory == 3)
               {
                  for(_loc5_ in GD.Caravans[0].Transport)
                  {
                     if(GD.Caravans[0].Transport[_loc5_].category != 1)
                     {
                        _loc1_.push(GD.Caravans[0].Transport[_loc5_]);
                     }
                  }
               }
               _loc1_.sortOn("health",16);
               for(_loc5_ in _loc1_)
               {
                  _loc1_[_loc5_].health = Math.round(_loc1_[_loc5_].health);
               }
               var _loc4_:* = 0;
               do
               {
                  _loc2_ = _loc1_[0].health;
                  _loc5_ = 0;
                  while(_loc1_[_loc5_].health <= _loc2_ && _loc1_[_loc5_].health < Math.round(_loc1_[_loc5_].maxHealth))
                  {
                     if(GD.Caravans[0].money < healPrice(_loc1_[_loc5_]))
                     {
                        _loc3_ = true;
                        break;
                     }
                     _loc1_[_loc5_].health++;
                     GD.Caravans[0].money -= healPrice(_loc1_[_loc5_]);
                     var _temp_4:* = Number(_loc5_) + 1;
                     _loc5_++;
                     if(_temp_4 >= _loc1_.length)
                     {
                        break;
                     }
                  }
                  if(_loc3_)
                  {
                     break;
                  }
                  var _temp_6:* = Number(_loc4_) + 1;
                  _loc4_++;
               }
               while(_temp_6 <= 100000);
               list.update();
            };
         }
         else
         {
            ConfirmDialogue.setText(Texts.fetch(3517 + facilityCategory).replace("@money@",MathFunctions.NumberFormat(healAllPrice,2,true) + " €").toUpperCase());
            ConfirmDialogue.onApprove = function():*
            {
               var _loc1_:* = undefined;
               if(facilityCategory == 1)
               {
                  for(_loc1_ in GD.Caravans[0].People)
                  {
                     GD.Caravans[0].People[_loc1_].health = Math.round(GD.Caravans[0].People[_loc1_].maxHealth);
                  }
               }
               if(facilityCategory == 2)
               {
                  for(_loc1_ in GD.Caravans[0].Transport)
                  {
                     if(GD.Caravans[0].Transport[_loc1_].category == 1)
                     {
                        GD.Caravans[0].Transport[_loc1_].health = Math.round(GD.Caravans[0].Transport[_loc1_].maxHealth);
                     }
                  }
               }
               if(facilityCategory == 3)
               {
                  for(_loc1_ in GD.Caravans[0].Transport)
                  {
                     if(GD.Caravans[0].Transport[_loc1_].category != 1)
                     {
                        GD.Caravans[0].Transport[_loc1_].health = Math.round(GD.Caravans[0].Transport[_loc1_].maxHealth);
                     }
                  }
               }
               GD.Caravans[0].money -= healAllPrice;
               list.update();
            };
         }
         ConfirmDialogue.visible = true;
      }
      
      private function EF(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         if(nowDragging)
         {
            _loc3_ = 630;
            _loc3_ = Math.min(_loc3_,Math.floor((Math.floor(GD.Caravans[0].money / healPrice()) + selectedTarget.health) / Math.round(selectedTarget.maxHealth) * 380 + 250));
            _loc2_ = 250 + Math.round(selectedTarget.health) / Math.round(selectedTarget.maxHealth) * 380;
            healingPointer.x = mouseX - startX;
            if(healingPointer.x + 9 > _loc3_)
            {
               healingPointer.x = _loc3_ - 9;
            }
            if(healingPointer.x + 9 < _loc2_)
            {
               healingPointer.x = _loc2_ - 9;
            }
            currHeal = (healingPointer.x + 9 - 250) / 380 * Math.round(selectedTarget.maxHealth);
            updateHealLevel();
         }
      }
      
      public function remove() : *
      {
         removeEventListener("enterFrame",EF);
         list.remove();
         GD = null;
      }
   }
}

