package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   
   public class School extends Sprite
   {
      
      public var D:*;
      
      public var GD:*;
      
      public var nameText:*;
      
      public var lines:*;
      
      public var picHolder:*;
      
      public var bottomLineCapacity:*;
      
      public var bottomLineDate:*;
      
      public var bottomLineMoney:*;
      
      public var exitButton:*;
      
      public var infoLine:*;
      
      public var onExit:*;
      
      public var experiences:*;
      
      public var price:*;
      
      public var priceText:*;
      
      public var experiencesTitle:*;
      
      public var experiencesList:*;
      
      public var selectedTarget:*;
      
      public var calculator:*;
      
      public var ConfirmDialogue:*;
      
      public var MessageDialogue:*;
      
      public var studyingList:*;
      
      public var yourPeopleList:*;
      
      public var validList:*;
      
      public var facility:*;
      
      public var cursorInfo:*;
      
      public function School(param1:*)
      {
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
         lines = new Sprite();
         lines.graphics.lineStyle(1,16777215);
         onExit = new Function();
         lines.graphics.moveTo(0,472);
         lines.graphics.lineTo(880,472);
         D.addToMask(lines);
         nameText = new EngineText("",16777215,18,"center",10,10,860,20);
         D.addToMask(nameText);
         picHolder = new Sprite();
         picHolder.x = 440;
         picHolder.y = 100;
         picHolder.scaleX = picHolder.scaleY = 2.5;
         D.addToMask(picHolder);
         infoLine = new EngineText("",16777215,14,"center",10,222,860,20);
         D.addToMask(infoLine);
         exitButton = new Button(2,exit,Texts.fetch(1344).toUpperCase());
         exitButton.x = 337;
         exitButton.y = 439;
         D.addChild(exitButton);
         priceText = new EngineText("",16777215,18,"center",10,400,860,20);
         D.addToMask(priceText);
         experiencesList = [];
         experiencesTitle = new EngineText(Texts.fetch(2887).toUpperCase() + ":",16777215,18,"center",10,410,860,20);
         D.addToMask(experiencesTitle);
         yourPeopleList = new List([],450,true,[],[],selectYourPerson,null,false,false,true);
         yourPeopleList.x = 10;
         yourPeopleList.y = 12;
         D.addChild(yourPeopleList);
         studyingList = new List([],450,true,[],[],selectStudyingPerson,null,false,false,true);
         studyingList.x = 770;
         studyingList.y = 12;
         D.addChild(studyingList);
         studyingList.time = GD.Time;
         var _loc2_:EngineText = new EngineText(Texts.fetch(3).toUpperCase(),16777215,12,"left",10,410,450,20);
         _loc2_.rotation = 90;
         _loc2_.x = 135;
         _loc2_.y = 10;
         D.addToMask(_loc2_);
         var _loc3_:EngineText = new EngineText(Texts.fetch(2894).toUpperCase(),16777215,12,"right",10,410,450,20);
         _loc3_.rotation = -90;
         _loc3_.x = 745;
         _loc3_.y = 460;
         D.addToMask(_loc3_);
         ConfirmDialogue = new YesNoDialogue();
         ConfirmDialogue.visible = false;
         addChild(ConfirmDialogue);
         MessageDialogue = new YesNoDialogue(true);
         MessageDialogue.visible = false;
         addChild(MessageDialogue);
         calculator = new Calculator();
         calculator.visible = false;
         addChild(calculator);
         cursorInfo = new Sprite();
         cursorInfo.mouseEnabled = false;
         cursorInfo.mouseChildren = false;
         D.addChild(cursorInfo);
      }
      
      public function setFacility(param1:*, param2:*, param3:*, param4:* = "", param5:* = null) : *
      {
         var _loc9_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         experiences = param1;
         price = param2;
         facility = param3;
         nameText.text = param4;
         while(picHolder.numChildren > 0)
         {
            picHolder.removeChildAt(0);
         }
         picHolder.addChild(param5);
         priceText.text = Texts.fetch(1296).toUpperCase() + ": " + MathFunctions.NumberFormat(price,2,true) + " € / " + Texts.fetch(941).toUpperCase();
         for(_loc7_ in experiencesList)
         {
            D.FGMask.removeChild(experiencesList[_loc7_]);
         }
         experiencesList = [];
         for(_loc7_ in experiences)
         {
            if(experiences[_loc7_].experience == "generalBattleExperience")
            {
               _loc6_ = 985;
            }
            else
            {
               for(_loc9_ in Character.skillsList)
               {
                  if(Character.skillsList[_loc9_].experience == experiences[_loc7_].experience)
                  {
                     _loc6_ = Character.skillsList[_loc9_].name;
                     break;
                  }
               }
            }
            experiencesList[_loc7_] = new EngineText(Texts.fetch(_loc6_).toUpperCase() + " X " + MathFunctions.NumberFormat(experiences[_loc7_].amount,0),16777215,14,"center",10,372 - _loc7_ * 20,860,20);
            D.addToMask(experiencesList[_loc7_]);
         }
         var _loc8_:Number = 350 - experiences.length * 20 - 40;
         picHolder.scaleX = picHolder.scaleY = _loc8_ / 40;
         picHolder.y = 40 + _loc8_ / 2;
         experiencesTitle.y = 360 - experiences.length * 20;
         update();
      }
      
      private function update() : *
      {
         var _loc1_:* = undefined;
         validList = [];
         for(_loc1_ in GD.Caravans[0].People)
         {
            if(_loc1_ != 0 && (GD.Caravans[0].People[_loc1_].category == 1 || GD.Caravans[0].People[_loc1_].category == 2))
            {
               validList.push(GD.Caravans[0].People[_loc1_]);
            }
         }
         yourPeopleList.update(validList);
         studyingList.update(facility.people);
         updateBottomLine();
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
      
      public function selectYourPerson(param1:*) : *
      {
         var maxTime:*;
         var target:* = param1;
         if(target is Character)
         {
            selectedTarget = target;
            maxTime = Math.floor(GD.Caravans[0].money / price);
            if(maxTime == 0)
            {
               MessageDialogue.setText(Texts.fetch(1273).toUpperCase());
               MessageDialogue.visible = true;
            }
            else if(maxTime == 1)
            {
               ConfirmDialogue.setText(Texts.fetch(2889,target.gender).replace("@name@",target.name).replace("@days@",1).replace("@money@",MathFunctions.NumberFormat(price,0) + " €").toUpperCase());
               ConfirmDialogue.onApprove = function():*
               {
                  sendSelectedToStudy(1);
               };
               ConfirmDialogue.visible = true;
            }
            else
            {
               calculator.min = 1;
               calculator.max = maxTime;
               calculator.info.text = Texts.fetch(2888).toUpperCase();
               calculator.visible = true;
               calculator.setValue(1);
               calculator.onDone = function():*
               {
                  ConfirmDialogue.setText(Texts.fetch(2889,target.gender).replace("@name@",target.name).replace("@days@",calculator.value).replace("@money@",MathFunctions.NumberFormat(price * calculator.value,0) + " €").toUpperCase());
                  ConfirmDialogue.onApprove = function():*
                  {
                     sendSelectedToStudy(calculator.value);
                  };
                  ConfirmDialogue.visible = true;
                  calculator.visible = false;
               };
               calculator.onUpdate = function():*
               {
                  calculator.rightSideText.text = Texts.fetch(1296) + ": " + MathFunctions.NumberFormat(calculator.value * price,0) + " €";
               };
               calculator.onUpdate();
            }
         }
      }
      
      public function sendSelectedToStudy(param1:*) : *
      {
         GD.Caravans[0].removePerson(selectedTarget);
         facility.people.push(selectedTarget);
         selectedTarget.studyTime = param1 * 86400;
         selectedTarget.startedStudying = GD.Time;
         GD.Caravans[0].money -= price * param1;
         update();
      }
      
      public function selectStudyingPerson(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(param1 is Character)
         {
            selectedTarget = param1;
            if(param1.startedStudying + param1.studyTime < GD.Time)
            {
               takePersonBack();
            }
            else
            {
               ConfirmDialogue.setText(Texts.fetch(2893,param1.gender).replace("@name@",param1.name).toUpperCase());
               ConfirmDialogue.onApprove = takePersonBack;
               ConfirmDialogue.visible = true;
            }
         }
      }
      
      private function takePersonBack() : *
      {
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:Number = selectedTarget.startedStudying + selectedTarget.studyTime;
         if(GD.Time > _loc2_)
         {
            _loc1_ = selectedTarget.studyTime;
         }
         else
         {
            _loc1_ = GD.Time - selectedTarget.startedStudying;
         }
         for(_loc3_ in experiences)
         {
            selectedTarget[experiences[_loc3_].experience] += experiences[_loc3_].amount * _loc1_ / 86400 * selectedTarget.learningCapacity;
         }
         selectedTarget.startedStudying = undefined;
         selectedTarget.studyTime = undefined;
         facility.people.splice(facility.people.indexOf(selectedTarget),1);
         GD.Caravans[0].addPerson(selectedTarget);
         update();
      }
      
      private function exit() : *
      {
         visible = false;
         onExit();
      }
      
      private function EF(param1:*) : *
      {
         var _loc12_:* = undefined;
         var _loc7_:* = undefined;
         var _loc13_:* = undefined;
         var _loc11_:* = undefined;
         var _loc5_:* = undefined;
         var _loc14_:* = undefined;
         var _loc2_:* = undefined;
         if(!visible)
         {
            return;
         }
         var _loc10_:* = 0;
         var _loc15_:* = 0;
         var _loc9_:Array = [];
         var _loc3_:* = [];
         if(mouseX >= 20 && mouseX <= 80 && mouseY >= 10 && mouseY <= 460)
         {
            _loc12_ = Math.floor(yourPeopleList.scrollableArea.Content.mouseY / 80);
            if(_loc12_ >= 0 && _loc12_ < validList.length && yourPeopleList.scrollableArea.Content.mouseY % 80 >= 10)
            {
               _loc3_ = yourPeopleList.finalList[_loc12_].item.getInfoPairs();
               _loc11_ = yourPeopleList.finalList[_loc12_].item.name;
            }
         }
         if(mouseX >= 780 && mouseY <= 850 && mouseY >= 10 && mouseY <= 460)
         {
            _loc12_ = Math.floor(studyingList.scrollableArea.Content.mouseY / 80);
            if(_loc12_ >= 0 && _loc12_ < facility.people.length && studyingList.scrollableArea.Content.mouseY % 80 >= 10)
            {
               _loc3_ = studyingList.finalList[_loc12_].item.getInfoPairs();
               _loc11_ = studyingList.finalList[_loc12_].item.name;
               _loc14_ = studyingList.finalList[_loc12_].item.startedStudying + studyingList.finalList[_loc12_].item.studyTime;
               if(_loc14_ <= GD.Time)
               {
                  _loc3_.push({
                     "name":"-=" + Texts.fetch(2891).toUpperCase() + "=-",
                     "key":"studying"
                  });
               }
               else
               {
                  _loc2_ = GD.makeDate(_loc14_);
                  _loc3_.push({
                     "name":Texts.fetch(2890).toUpperCase(),
                     "value":_loc2_.Day + "-" + _loc2_.ShortMonthName + "-" + _loc2_.Year2d + " " + _loc2_.Hour2d + ":" + _loc2_.Minute2d,
                     "key":"studying"
                  });
               }
               _loc3_.push({
                  "name":Texts.fetch(2892).toUpperCase(),
                  "key":"click"
               });
            }
         }
         var _loc6_:* = 30;
         var _loc8_:Array = [];
         var _loc4_:Array = [];
         if(_loc3_.length > 0)
         {
            for(_loc5_ in _loc3_)
            {
               if(_loc3_[_loc5_].key == "studying")
               {
                  _loc6_ += 10;
               }
               if(_loc3_[_loc5_].value == undefined)
               {
                  _loc8_[_loc5_] = new EngineText(_loc3_[_loc5_].name,3156000,12,"center",10,_loc6_,880,15);
                  _loc13_ = _loc8_[_loc5_].textWidth + 5;
               }
               else
               {
                  _loc8_[_loc5_] = new EngineText(_loc3_[_loc5_].name + ":",3156000,12,"left",10,_loc6_,880,15);
                  _loc4_[_loc5_] = new EngineText(_loc3_[_loc5_].value,3156000,12,"right",10,_loc6_,880,15);
                  _loc13_ = _loc8_[_loc5_].textWidth + _loc4_[_loc5_].textWidth + 20 + 5;
               }
               _loc6_ += 15;
               if(_loc3_[_loc5_].key == "name" || _loc3_[_loc5_].key == "weight")
               {
                  _loc6_ += 10;
               }
               if(_loc13_ > _loc15_)
               {
                  _loc15_ = _loc13_;
               }
            }
            for(_loc5_ in _loc8_)
            {
               _loc8_[_loc5_].width = _loc15_;
               _loc9_.push(_loc8_[_loc5_]);
               if(_loc4_[_loc5_] is EngineText)
               {
                  _loc4_[_loc5_].width = _loc15_;
                  _loc9_.push(_loc4_[_loc5_]);
               }
            }
            if(_loc9_.length > 0)
            {
            }
            _loc9_.push(new EngineText(_loc11_.toUpperCase(),3156000,12,"center",10,5,_loc15_,15));
         }
         if(_loc9_.length > 0 && cursorInfo.alpha < 1)
         {
            cursorInfo.alpha += 0.2;
         }
         if(_loc9_.length == 0)
         {
            cursorInfo.alpha = 0;
         }
         cursorInfo.visible = !calculator.visible && !ConfirmDialogue.visible && !MessageDialogue.visible && _loc9_.length > 0;
         if(cursorInfo.visible)
         {
            while(cursorInfo.numChildren > 0)
            {
               cursorInfo.removeChild(cursorInfo.getChildAt(0));
            }
            _loc15_ = 0;
            _loc10_ = 0;
            for(_loc5_ in _loc9_)
            {
               cursorInfo.addChild(_loc9_[_loc5_]);
               if(_loc9_[_loc5_].x + _loc9_[_loc5_].width > _loc15_)
               {
                  _loc15_ = _loc9_[_loc5_].x + _loc9_[_loc5_].width;
               }
               if(_loc9_[_loc5_].y + _loc9_[_loc5_].height > _loc10_)
               {
                  _loc10_ = _loc9_[_loc5_].y + _loc9_[_loc5_].height;
               }
            }
            cursorInfo.graphics.clear();
            cursorInfo.graphics.lineStyle(1,3156000);
            cursorInfo.graphics.beginFill(12631208);
            cursorInfo.graphics.drawRect(0,0,_loc15_ + 10,_loc10_ + 5);
            cursorInfo.graphics.endFill();
            cursorInfo.x = mouseX + 20;
            cursorInfo.y = mouseY + 10;
            if(cursorInfo.y + _loc10_ + 5 > 490)
            {
               cursorInfo.y = 490 - _loc10_ - 5;
            }
            if(cursorInfo.x + _loc15_ + 5 > 875)
            {
               cursorInfo.x = mouseX - _loc15_ - 10;
            }
         }
      }
      
      public function remove() : *
      {
         removeEventListener("enterFrame",EF);
         yourPeopleList.remove();
         yourPeopleList = null;
         studyingList.remove();
         studyingList = null;
         onExit = null;
         selectedTarget = null;
         calculator.remove();
         calculator = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         GD = null;
      }
   }
}

