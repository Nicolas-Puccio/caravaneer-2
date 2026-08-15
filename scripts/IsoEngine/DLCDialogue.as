package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   import flash.net.*;
   
   public class DLCDialogue extends Sprite
   {
      
      public var D:*;
      
      public var BG:*;
      
      public var doneButt:*;
      
      public var listArea:*;
      
      public var errorText:*;
      
      public var gameRoot:*;
      
      public var warning:*;
      
      public var storedList:*;
      
      private var enabledBoxes:*;
      
      public function DLCDialogue(param1:*)
      {
         var i:*;
         var title:*;
         var listFrame:*;
         var _gameRoot:* = param1;
         super();
         gameRoot = _gameRoot;
         BG = new Sprite();
         BG.graphics.beginFill(0,0.5);
         BG.graphics.drawRect(0,0,880,495);
         BG.graphics.endFill();
         addChild(BG);
         if(gameRoot.onSite)
         {
            D = new Dialogue(600,460);
         }
         else
         {
            D = new Dialogue(600,400);
         }
         D.x = 440 - D.dialogueWidth / 2;
         D.y = 248 - D.dialogueHeight / 2;
         addChild(D);
         title = new EngineText(Texts.fetch(6878).toUpperCase(),16777215,20,"center",10,10,580,30);
         D.addToMask(title);
         D.drawHorizontalLine(45,0,D.dialogueWidth);
         doneButt = new Button(2,function():*
         {
            close();
         },Texts.fetch(1229).toUpperCase());
         doneButt.x = 197;
         if(gameRoot.onSite)
         {
            doneButt.y = 417;
         }
         else
         {
            doneButt.y = 357;
         }
         D.addChild(doneButt);
         listFrame = new Sprite();
         listFrame.graphics.beginFill(4735032);
         listFrame.graphics.drawRect(0,0,560,280);
         listFrame.graphics.endFill();
         listFrame.graphics.lineStyle(1,16777215,0.3);
         listFrame.graphics.moveTo(561,-1);
         listFrame.graphics.lineTo(561,281);
         listFrame.graphics.lineTo(-1,281);
         listFrame.graphics.lineStyle(1,0,0.6);
         listFrame.graphics.lineTo(-1,-1);
         listFrame.graphics.lineTo(561,-1);
         listFrame.x = 20;
         listFrame.y = 60;
         D.addChild(listFrame);
         listArea = new ScrollableArea(550,280,550,280,true,false,false,3,10);
         listArea.x = 20;
         listArea.y = 60;
         D.addChild(listArea);
         errorText = new EngineText("",16777215,14,"center",20,190,540,200,true,true);
         D.addChild(errorText);
         warning = new YesNoDialogue(true);
         warning.visible = false;
         addChild(warning);
         update();
      }
      
      public function update() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         listArea.clearAll();
         errorText.visible = false;
         if(!gameRoot.onSite)
         {
            displayError(Texts.fetch(6909) + "<br><br><a href=\'http://www.gamesofhonor.com/caravaneer-2\' target=\'_blank\'>http://www.gamesofhonor.com/caravaneer-2</a>");
         }
         else if(gameRoot.ac == null && !gameRoot.local)
         {
            displayError(Texts.fetch(6908));
         }
         else if(gameRoot.dlcError == 4)
         {
            displayError(Texts.fetch(6904) + "<br>" + Texts.fetch(6906));
         }
         else if(gameRoot.dlcError == 5)
         {
            displayError(Texts.fetch(6910));
         }
         else if(gameRoot.dlcError == 2)
         {
            displayError(Texts.fetch(6911));
         }
         else if(gameRoot.dlcError == 6)
         {
            displayError(Texts.fetch(6999));
         }
         else
         {
            enabledBoxes = [];
            _loc1_ = new Sprite();
            _loc1_.graphics.beginFill(11446745);
            _loc1_.graphics.drawRect(0,0,534,1);
            _loc1_.x = 8;
            _loc1_.y = 10;
            listArea.addContent(_loc1_,null,null,null,null,true);
            for(_loc2_ in gameRoot.DLCList)
            {
               enabledBoxes[_loc2_] = new Sprite();
               enabledBoxes[_loc2_].graphics.lineStyle(2,11446745);
               enabledBoxes[_loc2_].graphics.beginFill(11446745,0.01);
               enabledBoxes[_loc2_].graphics.drawRect(0,0,20,20);
               enabledBoxes[_loc2_].graphics.endFill();
               if(gameRoot.DLCList[_loc2_].enabled)
               {
                  enabledBoxes[_loc2_].graphics.moveTo(5,5);
                  enabledBoxes[_loc2_].graphics.lineTo(10,15);
                  enabledBoxes[_loc2_].graphics.lineTo(15,5);
               }
               enabledBoxes[_loc2_].x = 10;
               enabledBoxes[_loc2_].y = 20 + _loc2_ * 40;
               enabledBoxes[_loc2_].buttonMode = true;
               enabledBoxes[_loc2_].addEventListener("click",clickOnEnabledBox);
               _loc1_ = new Sprite();
               _loc1_.graphics.beginFill(11446745);
               _loc1_.graphics.drawRect(0,0,534,1);
               _loc1_.x = 8;
               _loc1_.y = _loc2_ * 40 + 50;
               listArea.addContent(_loc1_,null,null,null,null,true);
               listArea.addContent(enabledBoxes[_loc2_],null,null,null,null,true);
               listArea.addContent(new EngineText(gameRoot.DLCList[_loc2_].name,11446745,14,"left",40,20 + _loc2_ * 40,500,20),null,null,null,null,true);
            }
         }
         listArea.updateSize();
      }
      
      public function clickOnEnabledBox(param1:* = null) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         for(_loc4_ in enabledBoxes)
         {
            if(param1.target == enabledBoxes[_loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
         }
         var _loc2_:Boolean = false;
         if(gameRoot.build < gameRoot.DLCList[_loc3_].build)
         {
            warning.setText(gameRoot.DLCList[_loc3_].name + ": " + Texts.fetch(6912).replace("@versionname@",gameRoot.DLCList[_loc3_].version));
            warning.visible = true;
            warning.onCancel = new Function();
            _loc2_ = true;
         }
         if(!_loc2_)
         {
            gameRoot.DLCList[_loc3_].enabled = !gameRoot.DLCList[_loc3_].enabled;
            update();
         }
      }
      
      public function displayError(param1:*) : *
      {
         errorText.visible = true;
         errorText.htmlText = param1;
         errorText.y = 188 - errorText.textHeight / 2;
         errorText.height = errorText.textHeight + 5;
      }
      
      public function resetDLCList() : *
      {
         var _loc1_:* = undefined;
         storedList = [];
         for(_loc1_ in gameRoot.DLCList)
         {
            storedList[_loc1_] = gameRoot.DLCList[_loc1_].enabled;
         }
      }
      
      public function close() : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         this.visible = false;
         if(!gameRoot.onSite)
         {
            return false;
         }
         var _loc1_:Array = [];
         var _loc5_:Array = [];
         for(_loc4_ in storedList)
         {
            if(gameRoot.DLCList[_loc4_].enabled != storedList[_loc4_])
            {
               _loc1_.push(gameRoot.DLCList[_loc4_].id);
               _loc5_.push(gameRoot.DLCList[_loc4_].enabled ? 1 : 0);
            }
         }
         var _loc3_:URLLoader = new URLLoader();
         try
         {
            if(gameRoot.local || gameRoot.onlineFromLocal)
            {
               _loc2_ = new URLRequest("http://www.gamesofhonor.com/dlcaction.php");
            }
            else if(gameRoot.onSite)
            {
               _loc2_ = new URLRequest("dlcaction.php");
            }
            _loc2_.method = "POST";
            _loc2_.data = new URLVariables();
            _loc2_.data.action = 1;
            _loc2_.data.ids = _loc1_.join("|");
            _loc2_.data.values = _loc5_.join("|");
            _loc2_.data.session = gameRoot.ac;
            _loc3_.load(_loc2_);
         }
         catch(error:Error)
         {
            gameRoot.displayDLCError(error.name + ": " + error.message);
         }
         for(_loc4_ in _loc1_)
         {
            if(_loc5_[_loc4_] == 0)
            {
               gameRoot.removeDLC(_loc1_[_loc4_]);
            }
            else
            {
               gameRoot.loadDLC(_loc1_[_loc4_]);
            }
         }
      }
      
      public function reloadDLCList() : *
      {
         while(gameRoot.loadedDLC.length > 0)
         {
            gameRoot.removeDLC(gameRoot.loadedDLC[0].id);
         }
         gameRoot.requestDLCList();
      }
   }
}

