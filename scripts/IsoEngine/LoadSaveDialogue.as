package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   import flash.net.*;
   import flash.utils.ByteArray;
   
   public class LoadSaveDialogue extends Sprite
   {
      
      public var D:*;
      
      public var BG:*;
      
      public var GD:*;
      
      public var mainMovie:*;
      
      public var saveData:*;
      
      public var title:*;
      
      public var save:*;
      
      public var normalActionButt:*;
      
      public var fileActionButt:*;
      
      public var cancelButt:*;
      
      public var deleteButt:*;
      
      public var FR:*;
      
      public var overBlack:*;
      
      public var listArea:*;
      
      public var slots:*;
      
      public var selectedSlot:* = 0;
      
      public var confirmDialogue:*;
      
      public var nameWriter:*;
      
      public function LoadSaveDialogue(param1:*, param2:*, param3:* = true)
      {
         var i:*;
         var listFrame:*;
         var _GD:* = param1;
         var _mainMovie:* = param2;
         var _save:* = param3;
         super();
         mainMovie = _mainMovie;
         saveData = mainMovie.savedData;
         save = _save;
         GD = _GD;
         BG = new Sprite();
         BG.graphics.beginFill(0,0.5);
         BG.graphics.drawRect(0,0,880,495);
         BG.graphics.endFill();
         addChild(BG);
         D = new Dialogue(400,430);
         D.x = 325 - D.dialogueWidth / 2;
         D.y = 248 - D.dialogueHeight / 2;
         addChild(D);
         title = new EngineText("",16777215,20,"center",10,10,380,30);
         D.addToMask(title);
         D.drawHorizontalLine(45,0,D.dialogueWidth);
         normalActionButt = new Button(2,normalAction,"");
         normalActionButt.x = 97;
         normalActionButt.y = 277;
         D.addChild(normalActionButt);
         D.drawHorizontalLine(313,0,D.dialogueWidth);
         fileActionButt = new Button(2,fileAction,"");
         fileActionButt.x = 97;
         fileActionButt.y = 327;
         D.addChild(fileActionButt);
         deleteButt = new Button(2,deleteAction,Texts.fetch(6895).toUpperCase());
         deleteButt.x = 97;
         deleteButt.y = 357;
         D.addChild(deleteButt);
         cancelButt = new Button(2,function():*
         {
            visible = false;
         },Texts.fetch(634).toUpperCase());
         cancelButt.x = 97;
         cancelButt.y = 387;
         D.addChild(cancelButt);
         listFrame = new Sprite();
         listFrame.graphics.beginFill(4735032);
         listFrame.graphics.drawRect(0,0,360,210);
         listFrame.graphics.endFill();
         listFrame.graphics.lineStyle(1,16777215,0.3);
         listFrame.graphics.moveTo(361,-1);
         listFrame.graphics.lineTo(361,211);
         listFrame.graphics.lineTo(-1,211);
         listFrame.graphics.lineStyle(1,0,0.6);
         listFrame.graphics.lineTo(-1,-1);
         listFrame.graphics.lineTo(361,-1);
         listFrame.x = 20;
         listFrame.y = 60;
         D.addChild(listFrame);
         listArea = new ScrollableArea(350,210,350,210,true,false,false,3,10);
         listArea.x = 20;
         listArea.y = 60;
         D.addChild(listArea);
         FR = new FileReference();
         FR.addEventListener("complete",onDone,false,0,false);
         FR.addEventListener("select",loadIt,false,0,false);
         FR.addEventListener("ioError",onError,false,0,false);
         FR.addEventListener("securityError",onError,false,0,false);
         FR.addEventListener("cancel",onCancel,false,0,false);
         overBlack = new Sprite();
         overBlack.graphics.beginFill(0,0.5);
         overBlack.graphics.drawRect(0,0,880,495);
         overBlack.graphics.endFill();
         addChild(overBlack);
         overBlack.visible = false;
         confirmDialogue = new YesNoDialogue();
         confirmDialogue.visible = false;
         addChild(confirmDialogue);
         nameWriter = {};
         nameWriter.disp = new Sprite();
         nameWriter.bg = new Sprite();
         nameWriter.bg.graphics.beginFill(0,0.5);
         nameWriter.bg.graphics.drawRect(0,0,880,495);
         nameWriter.disp.addChild(nameWriter.bg);
         nameWriter.D = new Dialogue(500,100);
         nameWriter.D.x = 75;
         nameWriter.D.y = 198;
         nameWriter.disp.addChild(nameWriter.D);
         nameWriter.title = new EngineText(Texts.fetch(1444).toUpperCase(),16777215,16,"center",10,10,480,30);
         nameWriter.D.addToMask(nameWriter.title);
         nameWriter.approveButt = new Button(2,doSave,Texts.fetch(1439).toUpperCase());
         nameWriter.approveButt.x = 37;
         nameWriter.approveButt.y = 67;
         nameWriter.D.addChild(nameWriter.approveButt);
         nameWriter.cancelButt = new Button(2,function():*
         {
            nameWriter.disp.visible = false;
         },Texts.fetch(634).toUpperCase());
         nameWriter.cancelButt.x = 257;
         nameWriter.cancelButt.y = 67;
         nameWriter.D.addChild(nameWriter.cancelButt);
         nameWriter.textFrame = new Sprite();
         nameWriter.textFrame.graphics.beginFill(4735032);
         nameWriter.textFrame.graphics.drawRect(0,0,460,20);
         nameWriter.textFrame.graphics.endFill();
         nameWriter.textFrame.graphics.lineStyle(1,16777215,0.3);
         nameWriter.textFrame.graphics.moveTo(461,-1);
         nameWriter.textFrame.graphics.lineTo(461,21);
         nameWriter.textFrame.graphics.lineTo(-1,21);
         nameWriter.textFrame.graphics.lineStyle(1,0,0.6);
         nameWriter.textFrame.graphics.lineTo(-1,-1);
         nameWriter.textFrame.graphics.lineTo(461,-1);
         nameWriter.textFrame.x = 20;
         nameWriter.textFrame.y = 38;
         nameWriter.D.addChild(nameWriter.textFrame);
         nameWriter.txt = new EngineText("",16777215,14,"center",20,38,460,20);
         nameWriter.txt.selectable = true;
         nameWriter.txt.type = "input";
         nameWriter.txt.maxChars = 40;
         nameWriter.D.addChild(nameWriter.txt);
         nameWriter.disp.visible = false;
         addChild(nameWriter.disp);
         update(save);
      }
      
      public function doSave() : *
      {
         var writeSlot:*;
         var flushStatus:*;
         if(slots[selectedSlot].num == null)
         {
            if(saveData.data.saves.length == 0)
            {
               writeSlot = 1;
            }
            else
            {
               writeSlot = saveData.data.saves.length;
            }
         }
         else
         {
            writeSlot = slots[selectedSlot].num;
         }
         saveData.data.saves[writeSlot] = {
            "name":nameWriter.txt.text,
            "time":new Date(),
            "save":GD.generateSave()
         };
         try
         {
            flushStatus = saveData.flush();
         }
         catch(error:Error)
         {
            trace("Error...Could not write SharedObject to disk\n");
         }
         update(save);
         nameWriter.disp.visible = false;
         this.visible = false;
      }
      
      public function normalAction() : *
      {
         var date:*;
         if(slots.length == 0)
         {
            return;
         }
         if(save)
         {
            if(slots[selectedSlot].num == null)
            {
               date = new Date();
               nameWriter.txt.text = date.fullYear + "-" + twoChars(date.month + 1) + "-" + twoChars(date.date) + " " + twoChars(date.hours) + ":" + twoChars(date.minutes);
               stage.focus = nameWriter.txt;
               nameWriter.txt.setSelection(0,nameWriter.txt.text.length);
               nameWriter.disp.visible = true;
            }
            else
            {
               confirmDialogue.setText(Texts.fetch(1443,GD.Caravans[0].People[0].gender));
               confirmDialogue.onApprove = function():*
               {
                  nameWriter.txt.text = saveData.data.saves[slots[selectedSlot].num].name;
                  stage.focus = nameWriter.txt;
                  nameWriter.txt.setSelection(0,nameWriter.txt.text.length);
                  nameWriter.disp.visible = true;
               };
               confirmDialogue.visible = true;
            }
         }
         else
         {
            overBlack.visible = true;
            mainMovie.loadData = saveData.data.saves[slots[selectedSlot].num].save;
            mainMovie.setScreen(5);
         }
      }
      
      public function deleteAction() : *
      {
         var gender:*;
         if(!save || selectedSlot != 0)
         {
            if(GD is GameData)
            {
               gender = GD.Caravans[0].People[0].gender;
            }
            else
            {
               gender = 1;
            }
            confirmDialogue.setText(Texts.fetch(6896,gender).replace("@slotname@",saveData.data.saves[slots[selectedSlot].num].name));
            confirmDialogue.onApprove = function():*
            {
               saveData.data.saves.splice(slots[selectedSlot].num,1);
               saveData.flush();
               update(save);
            };
            confirmDialogue.visible = true;
         }
      }
      
      public function fileAction() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         if(save)
         {
            _loc2_ = GD.generateSave();
            _loc1_ = new Date();
            FR.save(_loc2_,_loc1_.fullYear + "-" + twoChars(_loc1_.month + 1) + "-" + twoChars(_loc1_.date) + " " + twoChars(_loc1_.hours) + "-" + twoChars(_loc1_.minutes) + ".c2s");
         }
         else
         {
            FR.browse([new FileFilter(Texts.fetch(1441),"*.c2s")]);
         }
         overBlack.visible = true;
      }
      
      public function twoChars(param1:*) : *
      {
         var _loc2_:String = param1;
         if(_loc2_.length == 2)
         {
            return _loc2_;
         }
         if(_loc2_.length > 2)
         {
            return _loc2_.substr(_loc2_.length - 2,2);
         }
         while(_loc2_.length < 2)
         {
            _loc2_ = "0" + _loc2_;
         }
         return _loc2_;
      }
      
      public function loadIt(param1:* = null) : *
      {
         if(!save)
         {
            FR.load();
         }
      }
      
      public function onDone(param1:* = null) : *
      {
         overBlack.visible = false;
         if(save)
         {
            this.visible = false;
         }
         else if(FR.data is ByteArray)
         {
            mainMovie.loadData = FR.data;
            mainMovie.setScreen(5);
         }
      }
      
      public function onError(param1:* = null) : *
      {
         trace("error");
      }
      
      public function update(param1:* = true) : *
      {
         var _loc2_:* = undefined;
         save = param1;
         listArea.clearAll();
         slots = [];
         selectedSlot = 0;
         if(save)
         {
            title.text = Texts.fetch(1433).toUpperCase();
            normalActionButt.buttonText.text = Texts.fetch(1439).toUpperCase();
            fileActionButt.buttonText.text = Texts.fetch(1437).toUpperCase();
         }
         else
         {
            title.text = Texts.fetch(1434).toUpperCase();
            normalActionButt.buttonText.text = Texts.fetch(1440).toUpperCase();
            fileActionButt.buttonText.text = Texts.fetch(1438).toUpperCase();
         }
         for(_loc2_ in saveData.data.saves)
         {
            if(!save || _loc2_ != 0)
            {
               slots.push({
                  "name":saveData.data.saves[_loc2_].name,
                  "num":_loc2_,
                  "time":saveData.data.saves[_loc2_].time
               });
            }
         }
         slots.sortOn("time",18);
         if(save)
         {
            slots.unshift({
               "name":"< " + Texts.fetch(1442) + " >",
               "num":null
            });
         }
         for(_loc2_ in slots)
         {
            slots[_loc2_].disp = new Sprite();
            slots[_loc2_].bg = new Sprite();
            slots[_loc2_].bg.graphics.beginFill(16777215);
            slots[_loc2_].bg.graphics.drawRect(0,0,350,20);
            slots[_loc2_].disp.addChild(slots[_loc2_].bg);
            slots[_loc2_].txt = new EngineText(slots[_loc2_].name,16777215,14,"center",0,0,350,20);
            slots[_loc2_].disp.addChild(slots[_loc2_].txt);
            slots[_loc2_].disp.buttonMode = true;
            slots[_loc2_].disp.addEventListener("click",clickOnSlot,false,0,false);
            slots[_loc2_].disp.mouseChildren = false;
            slots[_loc2_].disp.y = _loc2_ * 20;
            listArea.addContent(slots[_loc2_].disp,null,null,null,null,true);
         }
         listArea.updateSize();
         overBlack.visible = false;
         updateSelected();
      }
      
      public function updateSelected() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in slots)
         {
            if(_loc1_ == selectedSlot)
            {
               slots[_loc1_].txt.textColor = 4735032;
            }
            else
            {
               slots[_loc1_].txt.textColor = 16777215;
            }
            slots[_loc1_].bg.visible = _loc1_ == selectedSlot;
         }
      }
      
      public function clickOnSlot(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in slots)
         {
            if(slots[_loc3_].disp == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         selectedSlot = _loc2_;
         updateSelected();
      }
      
      public function onCancel(param1:* = null) : *
      {
         overBlack.visible = false;
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in slots)
         {
            slots[_loc1_].disp.removeEventListener("click",clickOnSlot);
            slots[_loc1_].disp.buttonMode = false;
            slots[_loc1_].disp = null;
            slots[_loc1_].bg = null;
            slots[_loc1_].txt = null;
         }
         GD = null;
         mainMovie = null;
         listArea.remove();
         listArea = null;
         D = null;
         BG = null;
         saveData = null;
         title = null;
         save = null;
         normalActionButt.remove();
         normalActionButt = null;
         fileActionButt.remove();
         fileActionButt = null;
         deleteButt.remove();
         deleteButt = null;
         cancelButt.remove();
         cancelButt = null;
         FR = null;
         overBlack = null;
         slots;
         confirmDialogue.remove();
         confirmDialogue = null;
         nameWriter = null;
         nameWriter = null;
      }
   }
}

