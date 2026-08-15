package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class DialogueScreen extends Sprite
   {
      
      public static var lastStoryCreated:*;
      
      public var Story:*;
      
      public var GD:*;
      
      public var currentEntry:*;
      
      public var character:*;
      
      public var contentWidth:* = 270;
      
      private var questionBubble:*;
      
      private var questionText:*;
      
      private var responses:*;
      
      private var questionArea:*;
      
      private var tradeWindow:*;
      
      private var healingFacility:*;
      
      private var responsesArea:*;
      
      public var maxQuestionSize:* = 400;
      
      private var roundness:* = 15;
      
      private var textShift:* = 10;
      
      public var blackScreen:*;
      
      public var blackScreenChange:*;
      
      public var waitInProgress:*;
      
      public var waitCounter:* = 0;
      
      public function DialogueScreen(param1:*, param2:*, param3:* = null)
      {
         var i:*;
         var foundLois:*;
         var found:*;
         var BG:*;
         var setChar:* = param1;
         var passGameData:* = param2;
         var passStory:* = param3;
         super();
         GD = passGameData;
         addEventListener("enterFrame",EF,false,0,false);
         if(passStory == null)
         {
            Story = GD.Story;
         }
         else
         {
            Story = passStory;
         }
         character = setChar;
         if(character == 8 && Story.youAttackedLois)
         {
            foundLois = false;
            for(i in GD.Caravans[0].People)
            {
               if(GD.Caravans[0].People[i].specialPurpose == 2)
               {
                  foundLois = true;
                  break;
               }
            }
            if(foundLois)
            {
               currentEntry = 502;
            }
            else
            {
               currentEntry = 498;
            }
         }
         else if(character == 18 && Story.characterRelations[character] < -5)
         {
            currentEntry = 1093;
         }
         else if(character == 9)
         {
            found = false;
            for(i in GD.Caravans[0].People)
            {
               if(GD.Caravans[0].People[i].specialPurpose == 2)
               {
                  found = true;
                  break;
               }
            }
            if(found)
            {
               if(Story.youAcceptedFarnirsJob)
               {
                  currentEntry = 1148;
               }
               else
               {
                  currentEntry = 1147;
               }
            }
            else
            {
               currentEntry = Story.dialogueDefaults[character];
            }
         }
         else if(character == 25)
         {
            if(Story.specificReputations[7] > 0)
            {
               currentEntry = 1691;
            }
            else if(GD.getFactionRelations(0,10) <= -10)
            {
               currentEntry = 1692;
            }
            else if(Story.dialogueDefaults[character] == 1622 && Story.noraIsDead)
            {
               currentEntry = 1624;
            }
            else
            {
               currentEntry = Story.dialogueDefaults[character];
            }
         }
         else
         {
            currentEntry = Story.dialogueDefaults[character];
         }
         if(currentEntry == undefined)
         {
            currentEntry = Caravaneer2MainStory.defaultDefaults[character];
         }
         if(Story.characterRelations[character] == undefined)
         {
            Story.characterRelations[character] = 0;
         }
         BG = new ImportedBitmap("Dialogue" + character + ".png");
         addChild(BG);
         questionBubble = new Sprite();
         questionBubble.x = textShift + 10;
         questionBubble.y = textShift + 10;
         questionText = new EngineText("test",0,13,"left",0,0,contentWidth,2000,true,true);
         questionArea = new ScrollableArea(contentWidth,20,null,maxQuestionSize,true,false,true,2);
         questionArea.addContent(questionText,null,null,null,null,true);
         questionBubble.addChild(questionArea);
         addChild(questionBubble);
         responses = [];
         responsesArea = new ScrollableArea(contentWidth + textShift * 2 + 5,495,contentWidth + textShift * 2 + 5,495,true,false,true,2,10,15062684);
         responsesArea.x = 880 - contentWidth - textShift * 2 - 20;
         addChild(responsesArea);
         tradeWindow = new TradeWindow(GD);
         tradeWindow.visible = false;
         addChild(tradeWindow);
         tradeWindow.onExit = function():*
         {
         };
         healingFacility = new HealingFacility(GD);
         healingFacility.visible = false;
         addChild(healingFacility);
         healingFacility.onExit = function():*
         {
         };
         blackScreen = new Sprite();
         blackScreen.graphics.beginFill(0);
         blackScreen.graphics.drawRect(0,0,880,495);
         addChild(blackScreen);
         refresh();
      }
      
      public function refresh() : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc9_:* = undefined;
         var _loc1_:* = undefined;
         var _loc7_:Array = [];
         _loc7_.push({
            "what":"@yourname@",
            "by":GD.Caravans[0].People[0].name
         });
         questionText.text = Texts.fetch(Dialogues.entries[currentEntry].text,GD.Caravans[0].People[0].gender);
         for(_loc5_ in _loc7_)
         {
            questionText.text = questionText.text.replace(_loc7_[_loc5_].what,_loc7_[_loc5_].by);
         }
         if(currentEntry == 277)
         {
            questionText.text = questionText.text.replace("@number@",Story.KukulsPriceForContact);
         }
         if(currentEntry == 302)
         {
            questionText.text = questionText.text.replace("@weight@",MathFunctions.NumberFormat(Story.KukulsPriceForContact,1,true) + " Kg");
         }
         if(currentEntry == 358)
         {
            questionText.text = questionText.text.replace("@amount1@",MathFunctions.NumberFormat(Story.cleaversToBring,1,true)).replace("@amount2@",MathFunctions.NumberFormat(Story.boltsToBring,1,true));
         }
         if(currentEntry == 364)
         {
            questionText.text = questionText.text.replace("@time@",GD.makeDate(Story.meetLoisTime).Hour + ":" + GD.makeDate(Story.meetLoisTime).Minute2d);
         }
         if(currentEntry == 1440)
         {
            questionText.text = questionText.text.replace("@townname@",GD.Towns[Story.escortWFMCaravanTo].name);
         }
         if(currentEntry == 1442)
         {
            questionText.text = questionText.text.replace("@money@",MathFunctions.NumberFormat(Story.wfmReward,2,true) + " €");
         }
         if(currentEntry == 1449 || currentEntry == 1450)
         {
            questionText.text = questionText.text.replace("@name@",Texts.fetch(Story.wfmDeliverCharacterName)).replace("@town@",GD.Towns[Story.wfmDeliverToTown].name);
         }
         if(currentEntry == 1944)
         {
            questionText.text = questionText.text.replace("@money@",MathFunctions.NumberFormat(Story.warehousePrice,0,true) + " €");
         }
         if(currentEntry == 2052 || currentEntry == 2055)
         {
            questionText.text = questionText.text.replace("@town1@",GD.Towns[Story.qgMissionTown1].name).replace("@town2@",GD.Towns[Story.qgMissionTown2].name);
         }
         if(currentEntry == 2053 || currentEntry == 2054 || currentEntry == 2056 || currentEntry == 2057 || currentEntry == 2058 || currentEntry == 2059)
         {
            questionText.text = questionText.text.replace("@townname@",GD.Towns[Story.qgMissionTown1].name);
         }
         if(currentEntry == 2060)
         {
            questionText.text = questionText.text.replace("@money@",MathFunctions.NumberFormat(Story.qgMissionCashReward,0,false) + " €");
         }
         if(questionText.textHeight > maxQuestionSize)
         {
            questionArea.minWidth = questionArea.maxWidth = contentWidth - 15;
            questionText.width = contentWidth - 20;
         }
         else
         {
            questionText.width = questionArea.minWidth = questionArea.maxWidth = contentWidth;
         }
         questionText.x = contentWidth / 2 - questionText.textWidth / 2;
         if(questionText.textHeight > maxQuestionSize)
         {
            questionText.x -= 7.5;
         }
         questionText.y = -2;
         questionArea.Content.y = 0;
         questionArea.updateSize();
         questionBubble.graphics.clear();
         questionBubble.graphics.lineStyle(2,0,0.5);
         questionBubble.graphics.beginFill(16777215,0.9);
         questionBubble.graphics.moveTo(contentWidth + textShift - roundness,0 - textShift);
         questionBubble.graphics.curveTo(contentWidth + textShift,0 - textShift,contentWidth + textShift,0 - textShift + roundness);
         var _loc2_:Number = questionArea.currHeight / 2;
         questionBubble.graphics.lineTo(contentWidth + textShift,_loc2_ - 5);
         var _loc6_:* = MathFunctions.CalcAngle(contentWidth + textShift,_loc2_,440,120);
         questionBubble.graphics.lineTo(contentWidth + textShift + Math.sin(_loc6_) * 20,_loc2_ + Math.cos(_loc6_) * 20);
         questionBubble.graphics.lineTo(contentWidth + textShift,_loc2_ + 5);
         questionBubble.graphics.lineTo(contentWidth + textShift,questionArea.currHeight + textShift - roundness);
         questionBubble.graphics.curveTo(contentWidth + textShift,questionArea.currHeight + textShift,contentWidth + textShift - roundness,questionArea.currHeight + textShift);
         questionBubble.graphics.lineTo(0 - textShift + roundness,questionArea.currHeight + textShift);
         questionBubble.graphics.curveTo(0 - textShift,questionArea.currHeight + textShift,0 - textShift,questionArea.currHeight + textShift - roundness);
         questionBubble.graphics.lineTo(0 - textShift,0 - textShift + roundness);
         questionBubble.graphics.curveTo(0 - textShift,0 - textShift,0 - textShift + roundness,0 - textShift);
         questionBubble.graphics.endFill();
         var _loc8_:* = 495;
         responsesArea.clearAll();
         responses = [];
         _loc1_ = Dialogues.entries[currentEntry].responses.length - 1;
         while(_loc1_ >= 0)
         {
            _loc3_ = Dialogues.responses[Dialogues.entries[currentEntry].responses[_loc1_]];
            if(_loc3_.conditions is Function)
            {
               _loc4_ = _loc3_.conditions(this);
            }
            else
            {
               _loc4_ = true;
            }
            if(_loc4_)
            {
               _loc9_ = responses.push({}) - 1;
               responses[_loc9_].text = new EngineText(Texts.fetch(_loc3_.text,GD.Caravans[0].People[0].gender),0,13,"left",0,0,contentWidth,455,true,true);
               for(_loc5_ in _loc7_)
               {
                  responses[_loc9_].text.text = responses[_loc9_].text.text.replace(_loc7_[_loc5_].what,_loc7_[_loc5_].by);
               }
               if(currentEntry == 471)
               {
                  responses[_loc9_].text.text = responses[_loc9_].text.text.replace("@money@",MathFunctions.NumberFormat(Story.priceToFreeOlaf,2,true) + " €");
               }
               if(currentEntry == 1022)
               {
                  responses[_loc9_].text.text = responses[_loc9_].text.text.replace("@money@",MathFunctions.NumberFormat(GD.Caravans[0].money,2,true) + " €");
               }
               if(currentEntry == 1317)
               {
                  responses[_loc9_].text.text = responses[_loc9_].text.text.replace("@number@",Story.janubiBanditsToKill);
               }
               if(currentEntry == 1950 && _loc1_ == 1)
               {
                  responses[_loc9_].text.text = responses[_loc9_].text.text.replace("@money@",MathFunctions.NumberFormat(Story.warehousePrice,0,true) + " €");
               }
               if(currentEntry == 1950 && _loc1_ == 2)
               {
                  responses[_loc9_].text.text = responses[_loc9_].text.text.replace("@money@",MathFunctions.NumberFormat(Story.warehousePrice * 2,0,true) + " €");
               }
               responses[_loc9_].text.x = -2;
               responses[_loc9_].text.y = -2;
               responses[_loc9_].text.height = responses[_loc9_].text.textHeight + 5;
               responses[_loc9_].disp = new MovieClip();
               responses[_loc9_].disp.x = responsesArea.currWidth - contentWidth - textShift - 5;
               _loc8_ -= responses[_loc9_].text.textHeight + textShift * 2;
               if(_loc9_ != 0)
               {
                  _loc8_ -= 10;
               }
               responses[_loc9_].disp.y = _loc8_;
               responses[_loc9_].disp.graphics.lineStyle(2,0,0.5);
               responses[_loc9_].disp.graphics.beginFill(15062684,0.9);
               responses[_loc9_].disp.graphics.moveTo(contentWidth + textShift - roundness,0 - textShift);
               responses[_loc9_].disp.graphics.curveTo(contentWidth + textShift,0 - textShift,contentWidth + textShift,0 - textShift + roundness);
               responses[_loc9_].disp.graphics.lineTo(contentWidth + textShift,responses[_loc9_].text.textHeight + textShift - roundness);
               responses[_loc9_].disp.graphics.curveTo(contentWidth + textShift,responses[_loc9_].text.textHeight + textShift,contentWidth + textShift - roundness,responses[_loc9_].text.textHeight + textShift);
               responses[_loc9_].disp.graphics.lineTo(0 - textShift + roundness,responses[_loc9_].text.textHeight + textShift);
               responses[_loc9_].disp.graphics.curveTo(0 - textShift,responses[_loc9_].text.textHeight + textShift,0 - textShift,responses[_loc9_].text.textHeight + textShift - roundness);
               responses[_loc9_].disp.graphics.lineTo(0 - textShift,0 - textShift + roundness);
               responses[_loc9_].disp.graphics.curveTo(0 - textShift,0 - textShift,0 - textShift + roundness,0 - textShift);
               responses[_loc9_].disp.graphics.endFill();
               responses[_loc9_].disp.addChild(responses[_loc9_].text);
               responses[_loc9_].disp.ind = Dialogues.entries[currentEntry].responses[_loc1_];
               responses[_loc9_].disp.mouseChildren = false;
               responses[_loc9_].disp.buttonMode = true;
               responses[_loc9_].disp.useHandCursor = true;
               responses[_loc9_].ind = Dialogues.entries[currentEntry].responses[_loc1_];
               responses[_loc9_].disp.addEventListener("mouseDown",clickResponse,false,0,false);
               responsesArea.addContent(responses[_loc9_].disp,null,null,null,responses[_loc9_].text.textHeight + textShift * 2 + 5,true);
            }
            _loc1_--;
         }
         responsesArea.updateSize();
         if(responsesArea.verticalScrollbar.visible)
         {
            responsesArea.x = 880 - contentWidth - textShift * 2 - 20;
         }
         else
         {
            responsesArea.x = 880 - contentWidth - textShift * 2 - 10;
         }
      }
      
      public function clickResponse(param1:*) : *
      {
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         var _loc2_:* = Dialogues.responses[param1.target.ind];
         if(_loc2_.actions is Function)
         {
            _loc2_.actions(this);
         }
         if(_loc2_.goTo > 0)
         {
            currentEntry = _loc2_.goTo;
            refresh();
         }
      }
      
      public function leave() : *
      {
         GD.setMode(GD.cameFromMode);
      }
      
      public function setCurrentDefault(param1:*) : *
      {
         Story.dialogueDefaults[character] = param1;
      }
      
      public function affectCurrentRelationship(param1:*) : *
      {
         if(Story.characterRelations[character] == undefined)
         {
            Story.characterRelations[character] = param1;
         }
         else
         {
            var _loc2_:* = character;
            var _loc3_:Number = Story.characterRelations[_loc2_] + param1;
            Story.characterRelations[_loc2_] = _loc3_;
         }
      }
      
      public function affectSpecificReputation(param1:*, param2:*) : *
      {
         GD.affectSpecificReputation(param1,param2);
      }
      
      public function getCurrentRelationship() : *
      {
         if(Story.characterRelations[character] == undefined)
         {
            return 0;
         }
         return Story.characterRelations[character];
      }
      
      public function getSpecificReputation(param1:*, param2:* = null) : *
      {
         if(Story.specificReputations[param1] == undefined)
         {
            return 0;
         }
         return Story.specificReputations[param1];
      }
      
      public function openLocation(param1:*, param2:*, param3:* = null) : *
      {
         var _loc5_:* = undefined;
         if(param3 == null)
         {
            param3 = currentEntry;
         }
         var _loc4_:filtericonpeople = new filtericonpeople();
         if(Presets.Towns[param1].locations[param2].category == 1)
         {
            if(Presets.Towns[param1].locations[param2].subCategory == 1 || Presets.Towns[param1].locations[param2].subCategory == 2 || Presets.Towns[param1].locations[param2].subCategory == 3)
            {
               GD.displayTutorial(25);
            }
            if(Presets.Towns[param1].locations[param2].subCategory == 5)
            {
               tradeWindow.setPartner(GD.Towns[param1].playersStorage,_loc4_,null,null,true,["carts","cars","animals","slaves"],Texts.fetch(GD.Towns[param1].locations[param2].name).toUpperCase(),GD.Towns[param1].playersStorageSpace);
            }
            else if(Presets.Towns[param1].locations[param2].subCategory == 6)
            {
               _loc5_ = [];
               if(Presets.Towns[param1].locations[param2].filters is Array)
               {
                  _loc5_ = Presets.Towns[param1].locations[param2].filters;
               }
               tradeWindow.setPartner(GD.Towns[param1],_loc4_,GD.Towns[param1].locations[param2],1,true,_loc5_);
            }
            else
            {
               tradeWindow.setPartner(GD.Towns[param1],_loc4_,GD.Towns[param1].locations[param2],Presets.Towns[param1].locations[param2].subCategory);
            }
            tradeWindow.visible = true;
         }
         if(Presets.Towns[param1].locations[param2].category == 2)
         {
            healingFacility.setFacility(GD.Towns[param1],GD.Towns[param1].locations[param2],_loc4_,Presets.Towns[param1].locations[param2].subCategory);
            healingFacility.visible = true;
         }
         currentEntry = param3;
         refresh();
         setChildIndex(tradeWindow,numChildren - 1);
         setChildIndex(healingFacility,numChildren - 1);
      }
      
      public function acceptQuest(param1:*) : *
      {
         GD.acceptQuest(param1);
      }
      
      public function completeQuest(param1:*) : *
      {
         GD.completeQuest(param1);
      }
      
      public function failQuest(param1:*) : *
      {
         GD.failQuest(param1);
      }
      
      public function executeMajorEvent(param1:*) : *
      {
         GD.executeMajorEvent(param1);
      }
      
      public function wrongAnswerToMarco(param1:*) : *
      {
         affectSpecificReputation(2,-1);
         if(Story.marcosTestErrors > 1)
         {
            currentEntry = 551;
            affectSpecificReputation(2,-10);
            failQuest(9);
            Story.marcosTestFailed = true;
         }
         else
         {
            Story.marcosTestErrors++;
            currentEntry = param1;
         }
         refresh();
      }
      
      public function waitEffect(param1:* = null) : *
      {
         if(param1 == null)
         {
            param1 = currentEntry;
         }
         blackScreenChange = param1;
         waitInProgress = true;
         waitCounter = 0;
      }
      
      public function EF(param1:* = null) : *
      {
         blackScreen.visible = waitInProgress;
         if(waitInProgress)
         {
            waitCounter = Number(waitCounter) + 1;
            if(waitCounter < 20)
            {
               blackScreen.alpha = waitCounter / 20;
            }
            if(waitCounter >= 20)
            {
               blackScreen.alpha = (40 - waitCounter) / 20;
            }
            if(waitCounter == 20)
            {
               currentEntry = blackScreenChange;
               refresh();
            }
            if(waitCounter == 40)
            {
               waitInProgress = false;
            }
         }
      }
      
      public function remove() : *
      {
         removeEventListener("enterFrame",EF);
         GD = null;
         Story = null;
         questionArea.remove();
         questionArea = null;
         responsesArea.remove();
         responsesArea = null;
         if(tradeWindow is TradeWindow)
         {
            tradeWindow.remove();
         }
         tradeWindow = null;
         if(healingFacility is HealingFacility)
         {
            healingFacility.remove();
         }
         healingFacility = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
   }
}

