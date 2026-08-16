package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   
   public class CaravanEncounterMenu extends Sprite
   {
      
      private var D:*;
      
      private var BG:*;
      
      public var mustAttack:* = true;
      
      public var settings:*;
      
      public var obstacles:*;
      
      public var confirmExitDialogue:*;
      
      public function CaravanEncounterMenu(param1:*, param2:*, param3:*, param4:*, param5:*, param6:* = null, param7:* = null)
      {
         var funct:*;
         var currY:*;
         var i:*;
         var textLines:*;
         var buttonFunctions:*;
         var textObjects:*;
         var buttons:*;
         var titleText:*;
         var title:*;
         var maxWidth:*;
         var subTitle:*;
         var warning:*;
         var lineY:*;
         var titleNum:* = param1;
         var options:* = param2;
         var group:* = param3;
         var gameData:* = param4;
         var attackFunction:* = param5;
         var _settings:* = param6;
         var _obstacles:* = param7;
         super();
         settings = _settings;
         obstacles = _obstacles;
         group.distributeLiquidsContainers(true);
         BG = new Sprite();
         BG.graphics.beginFill(0,0.5);
         BG.graphics.drawRect(0,0,880,495);
         BG.graphics.endFill();
         addChild(BG);
         textLines = [];
         buttonFunctions = [];
         for(i in options)
         {
            switch(options[i])
            {
               case "go to battle":
                  textLines.push(Texts.fetch(633).toUpperCase());
                  funct = function():*
                  {
                     attackFunction(false,group,settings,obstacles);
                  };
                  buttonFunctions.push(funct);
                  textLines.push(Texts.fetch(633).toUpperCase() + " (full AI)");
                  funct = function():*
                  {
                     for(_locCaravanMember_ in gameData.Caravans[0].People)
                     {
                        if(gameData.Caravans[0].People[_locCaravanMember_].category == 2 || _locCaravanMember_ == 0)
                        {
                           gameData.Caravans[0].People[_locCaravanMember_].category = 5;
                           if(_locCaravanMember_ != 0)
                           {
                              gameData.Caravans[0].People[_locCaravanMember_].name = "bot-" + gameData.Caravans[0].People[_locCaravanMember_].name;
                           }
                        }
                     }
                     attackFunction(true,group,settings,obstacles);
                  };
                  buttonFunctions.push(funct);
                  textLines.push(Texts.fetch(633).toUpperCase() + " (mercenaries AI)");
                  funct = function():*
                  {
                     for(_locCaravanMember_ in gameData.Caravans[0].People)
                     {
                        if(gameData.Caravans[0].People[_locCaravanMember_].category == 2)
                        {
                           gameData.Caravans[0].People[_locCaravanMember_].category = 5;
                           gameData.Caravans[0].People[_locCaravanMember_].name = "bot-" + gameData.Caravans[0].People[_locCaravanMember_].name;
                        }
                     }
                     attackFunction(true,group,settings,obstacles);
                  };
                  buttonFunctions.push(funct);
                  break;
               case "auto distribute ammo and go to battle":
                  textLines.push(Texts.fetch(635).toUpperCase());
                  funct = function():*
                  {
                     gameData.Caravans[0].distributeAmmo();
                     attackFunction(false,group,settings,obstacles);
                  };
                  buttonFunctions.push(funct);
                  break;
               case "attack":
                  textLines.push(Texts.fetch(636).toUpperCase());
                  funct = function():*
                  {
                     attackFunction(true,group,settings,obstacles);
                  };
                  buttonFunctions.push(funct);
                  textLines.push(Texts.fetch(636).toUpperCase() + " (full AI)");
                  funct = function():*
                  {
                     for(_locCaravanMember_ in gameData.Caravans[0].People)
                     {
                        if(gameData.Caravans[0].People[_locCaravanMember_].category == 2 || _locCaravanMember_ == 0)
                        {
                           gameData.Caravans[0].People[_locCaravanMember_].category = 5;
                           if(_locCaravanMember_ != 0)
                           {
                              gameData.Caravans[0].People[_locCaravanMember_].name = "bot-" + gameData.Caravans[0].People[_locCaravanMember_].name;
                           }
                        }
                     }
                     attackFunction(true,group,settings,obstacles);
                  };
                  buttonFunctions.push(funct);
                  textLines.push(Texts.fetch(636).toUpperCase() + " (mercenaries AI)");
                  funct = function():*
                  {
                     for(_locCaravanMember_ in gameData.Caravans[0].People)
                     {
                        if(gameData.Caravans[0].People[_locCaravanMember_].category == 2)
                        {
                           gameData.Caravans[0].People[_locCaravanMember_].category = 5;
                           gameData.Caravans[0].People[_locCaravanMember_].name = "bot-" + gameData.Caravans[0].People[_locCaravanMember_].name;
                        }
                     }
                     attackFunction(true,group,settings,obstacles);
                  };
                  buttonFunctions.push(funct);
                  break;
               case "auto distribute ammo and attack":
                  textLines.push(Texts.fetch(637).toUpperCase());
                  funct = function():*
                  {
                     gameData.Caravans[0].distributeAmmo();
                     attackFunction(true,group,settings,obstacles);
                  };
                  buttonFunctions.push(funct);
                  break;
               case "trade":
                  group.randomPointer = null;
                  textLines.push(Texts.fetch(638).toUpperCase());
                  funct = function():*
                  {
                     gameData.mapMode.openDialogue(6,group);
                  };
                  buttonFunctions.push(funct);
                  break;
               case "caravan menu":
                  textLines.push(Texts.fetch(1424).toUpperCase());
                  funct = function():*
                  {
                     gameData.setMode(3,3);
                  };
                  buttonFunctions.push(funct);
                  break;
               case "exit game":
                  textLines.push(Texts.fetch(1435).toUpperCase());
                  funct = function():*
                  {
                     confirmExitDialogue.setText(Texts.fetch(5637,gameData.Caravans[0].People[0].gender).toUpperCase());
                     confirmExitDialogue.onApprove = function():*
                     {
                        gameData.exitGame();
                     };
                     confirmExitDialogue.visible = true;
                  };
                  buttonFunctions.push(funct);
                  break;
               case "cancel":
                  textLines.push(Texts.fetch(1266).toUpperCase());
                  funct = function():*
                  {
                     gameData.mapMode.closeDialogue();
                  };
                  buttonFunctions.push(funct);
            }
         }
         textObjects = [];
         buttons = [];
         if(titleNum == 1)
         {
            titleText = Texts.fetch(639).replace("@groupname@",group.name).toUpperCase();
         }
         if(titleNum == 2)
         {
            titleText = Texts.fetch(640).replace("@groupname@",group.name).toUpperCase();
         }
         title = new EngineText(titleText,16777215,20,"center",0,10,880,30);
         maxWidth = title.textWidth + 40;
         subTitle = new EngineText(Texts.fetch(1425) + ": " + group.People.length,16777215,14,"center",0,40,880,20);
         maxWidth = Math.max(maxWidth,subTitle.textWidth + 40);
         for(i in textLines)
         {
            textObjects[i] = new EngineText(textLines[i],16777215,15,"left",65,0,500,20);
            if(textObjects[i].textWidth + 85 > maxWidth)
            {
               maxWidth = textObjects[i].textWidth + 85;
            }
            buttons[i] = new Button(1,buttonFunctions[i]);
         }
         warning = new EngineText(Texts.fetch(1426),16777215,14,"center",0,80,maxWidth - 40,200,true,true);
         currY = 90 + warning.textHeight + 10;
         lineY = currY - 10;
         for(i in textLines)
         {
            buttons[i].x = 20;
            buttons[i].y = currY;
            textObjects[i].y = currY + 17 - textObjects[i].textHeight / 2;
            currY += 40;
         }
         D = new Dialogue(maxWidth,currY + 15);
         D.x = 325 - D.dialogueWidth / 2;
         D.y = 248 - D.dialogueHeight / 2;
         D.addToMask(title);
         D.addToMask(subTitle);
         D.addToMask(warning);
         D.drawHorizontalLine(70,0,D.dialogueWidth);
         for(i in textObjects)
         {
            D.addToMask(textObjects[i]);
            D.addChild(buttons[i]);
         }
         addChild(D);
         title.width = D.dialogueWidth;
         subTitle.width = D.dialogueWidth;
         warning.x = D.dialogueWidth / 2 - warning.width / 2;
         confirmExitDialogue = new YesNoDialogue();
         confirmExitDialogue.onCancel = function():*
         {
            confirmExitDialogue.visible = false;
         };
         confirmExitDialogue.visible = false;
         addChild(confirmExitDialogue);
      }
      
      public function remove() : *
      {
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
   }
}

