package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   
   public class OptionsMenu extends Sprite
   {
      
      public var D:*;
      
      public var BG:*;
      
      public var GD:*;
      
      public var loadSaveDialogue:*;
      
      public var confirmExitDialogue:*;
      
      public var buttons:*;
      
      public function OptionsMenu(param1:*)
      {
         var i:*;
         var textLines:*;
         var buttonFunctions:*;
         var textObjects:*;
         var title:*;
         var maxWidth:*;
         var _GD:* = param1;
         super();
         GD = _GD;
         BG = new Sprite();
         BG.graphics.beginFill(0,0.5);
         BG.graphics.drawRect(0,0,880,495);
         BG.graphics.endFill();
         addChild(BG);
         textLines = [Texts.fetch(1433).toUpperCase(),Texts.fetch(1434).toUpperCase(),Texts.fetch(1435).toUpperCase(),Texts.fetch(1436).toUpperCase()];
         buttonFunctions = [];
         buttonFunctions[0] = function():*
         {
            loadSaveDialogue.update(true);
            loadSaveDialogue.visible = true;
         };
         buttonFunctions[1] = function():*
         {
            loadSaveDialogue.update(false);
            loadSaveDialogue.visible = true;
         };
         buttonFunctions[2] = function():*
         {
            confirmExitDialogue.onApprove = function():*
            {
               GD.exitGame();
            };
            confirmExitDialogue.onCancel = function():*
            {
               confirmExitDialogue.visible = false;
            };
            confirmExitDialogue.visible = true;
         };
         buttonFunctions[3] = function():*
         {
            GD.mapMode.closeDialogue();
         };
         if(GD.parent.fullScreenAllowed)
         {
            textLines.splice(3,0,Texts.fetch(7031).toUpperCase());
            buttonFunctions.splice(3,0,GD.parent.switchFullScreen);
         }
         else
         {
            //-i don't want to change the index of fullscreen for now cause maybe need to enable it in the future, so just replace it
            textLines.splice(3,0,"start new town");
            buttonFunctions.splice(3,0,addCustomTown);
         }
         textObjects = [];
         buttons = [];
         title = new EngineText(Texts.fetch(28).toUpperCase(),16777215,20,"center",0,10,880,30);
         maxWidth = title.textWidth + 40;
         for(i in textLines)
         {
            textObjects[i] = new EngineText(textLines[i],16777215,15,"left",65,0,500,20);
            if(textObjects[i].textWidth + 85 > maxWidth)
            {
               maxWidth = textObjects[i].textWidth + 85;
            }
            buttons[i] = new Button(1,buttonFunctions[i]);
            buttons[i].x = 20;
            buttons[i].y = 55 + i * 40;
         }
         D = new Dialogue(maxWidth,textObjects.length * 40 + 70);
         D.x = 325 - D.dialogueWidth / 2;
         D.y = 248 - D.dialogueHeight / 2;
         for(i in textObjects)
         {
            textObjects[i].y = 57 + i * 40 + 15 - textObjects[i].textHeight / 2;
            D.addToMask(textObjects[i]);
            D.addChild(buttons[i]);
         }
         addChild(D);
         title.width = D.dialogueWidth;
         D.addToMask(title);
         D.drawHorizontalLine(45,0,D.dialogueWidth);
         loadSaveDialogue = new LoadSaveDialogue(GD,GD.parent);
         addChild(loadSaveDialogue);
         loadSaveDialogue.visible = false;
         confirmExitDialogue = new YesNoDialogue();
         confirmExitDialogue.setText(Texts.fetch(5637,GD.Caravans[0].People[0].gender).toUpperCase());
         confirmExitDialogue.visible = false;
         addChild(confirmExitDialogue);
      }

      public function addCustomTown() {//-should move this code to GD?
         var index:* = Presets.town_presets[0].length;
         GD.parent.setLocation(index, {
            "name":1,
            "x":GD.Caravans[0].x,
            "y":GD.Caravans[0].y,
            "population":0,
            "obligatoryPeople":[],
            "allowsSlaves":false,
            "locations":[{
               "x":298,
               "y":160,
               "category":1,
               "subCategory":5,
               "symbol":18,
               "visible":true,
               "name":7007
            }],
            "industries":[],
            "possibleIndustries":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46],
            "cantExpandStorage":false,
            "noPeopleToHire":true,
            "storyOnly":false,
            "defaultStorage":0,
            "constantPopulation":false,
            "storagePrice":100,
            "tax":0.05,
            "electricityPrice":0.3,
            "noticeability":1000
         }, true);
         GD.Towns[index] = new Town(index,GD);
         GD.Towns[index].altName = "town"+index;

         loadSaveDialogue.nameWriter.txt.text = "town"+index
         loadSaveDialogue.doSave()
         loadSaveDialogue.update(false)
         loadSaveDialogue.normalAction()
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         for(_loc1_ in buttons)
         {
            buttons[_loc1_].remove();
            buttons[_loc1_] = null;
         }
         buttons = null;
         D = null;
         BG = null;
         confirmExitDialogue.remove();
         confirmExitDialogue = null;
         loadSaveDialogue.remove();
         loadSaveDialogue = null;
         GD = null;
      }
   }
}

