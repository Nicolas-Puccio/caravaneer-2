package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.geom.ColorTransform;
   
   public class CharacterSetupScreen extends Sprite
   {
      
      public var D:*;
      
      public var theCharacter:*;
      
      public var portrait:*;
      
      public var portraitHolder:*;
      
      public var radio:*;
      
      public var nameText:*;
      
      public var buttons:*;
      
      public var values:*;
      
      public var availablePoints:* = 0;
      
      public var onDone:*;
      
      public var onCancel:*;
      
      public var parts:*;
      
      public var bristleGrade:*;
      
      public var bristleColor:*;
      
      public var colors:*;
      
      public const colorsOrder:*;
      
      public const colorNames:*;
      
      public const partsOrder:*;
      
      public const namesOrder:*;
      
      public const buttonsOrder:*;
      
      public const maxBristleGrades:* = 7;
      
      public var colorPicker:*;
      
      public function CharacterSetupScreen(param1:* = null)
      {
         var i:*;
         var lines:*;
         var skinHSV:*;
         var bristleHSV:*;
         var photoBG:*;
         var screenTitle:*;
         var nameTitle:*;
         var maleSign:*;
         var femaleSign:*;
         var genderText:*;
         var nameSpaceWidth:*;
         var nameBG:*;
         var photoBGFrame:*;
         var attributeNames:*;
         var attributeValueBGs:*;
         var aboutAttributesText:*;
         var facePartsNames:*;
         var placeY:*;
         var placeX:*;
         var setCharacter:* = param1;
         colorsOrder = ["skin","hair","lips","eyes","eyeSockets","eyebrows","beard"];
         colorNames = [1543,1530,1544,1533,1545,1535,1546];
         partsOrder = ["head","hair","nose","mouth","eyes","beard","eyebrows","ears","wrinkles","whiskers","moustache","shirt","necklace"];
         namesOrder = [1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542];
         buttonsOrder = [0,1,3,4,2,6,5,7,8,10,9,13,11,12];
         super();
         if(setCharacter == null)
         {
            theCharacter = new Character({"age":25});
            theCharacter.basePhysical = 5;
            theCharacter.baseAgility = 5;
            theCharacter.baseAccuracy = 5;
            theCharacter.baseIntelligence = 5;
            theCharacter.gender = 1;
         }
         else
         {
            theCharacter = setCharacter;
         }
         availablePoints = Math.max(0,20 - theCharacter.basePhysical - theCharacter.baseAgility - theCharacter.baseAccuracy - theCharacter.baseIntelligence);
         onDone = defaultOnDone;
         onCancel = defaultOnCancel;
         D = new Dialogue(880,495);
         lines = new Sprite();
         D.addToMask(lines);
         parts = {};
         colors = {};
         for(i in colorsOrder)
         {
            colors[colorsOrder[i]] = {};
         }
         init();
         lines.graphics.lineStyle(1,16711680);
         for(i in colorsOrder)
         {
            colors[colorsOrder[i]].text = new EngineText(Texts.fetch(colorNames[i],null,12).toUpperCase(),16777215,14,"left",20,302 + i * 20,140,20);
            D.addToMask(colors[colorsOrder[i]].text);
            lines.graphics.drawRect(150,304 + i * 20,121,16);
         }
         colors["skin"].minH = 10;
         colors["skin"].maxH = 30;
         colors["skin"].minS = 20;
         colors["skin"].maxS = 35;
         colors["skin"].minV = 25;
         colors["skin"].maxV = 100;
         colors["hair"].minH = 0;
         colors["hair"].maxH = 360;
         colors["hair"].minS = 0;
         colors["hair"].maxS = 100;
         colors["hair"].minV = 0;
         colors["hair"].maxV = 100;
         colors["lips"].minH = 0;
         colors["lips"].maxH = 360;
         colors["lips"].minS = 20;
         colors["lips"].maxS = 100;
         colors["lips"].minV = 0;
         colors["lips"].maxV = 50;
         colors["eyes"].minH = 10;
         colors["eyes"].maxH = 240;
         colors["eyes"].minS = 0;
         colors["eyes"].maxS = 50;
         colors["eyes"].minV = 0;
         colors["eyes"].maxV = 75;
         colors["eyeSockets"].minH = 0;
         colors["eyeSockets"].maxH = 360;
         colors["eyeSockets"].minS = 0;
         colors["eyeSockets"].maxS = 100;
         colors["eyeSockets"].minV = 0;
         colors["eyeSockets"].maxV = 100;
         colors["eyebrows"].minH = 0;
         colors["eyebrows"].maxH = 360;
         colors["eyebrows"].minS = 0;
         colors["eyebrows"].maxS = 100;
         colors["eyebrows"].minV = 0;
         colors["eyebrows"].maxV = 100;
         colors["beard"].minH = 0;
         colors["beard"].maxH = 360;
         colors["beard"].minS = 0;
         colors["beard"].maxS = 100;
         colors["beard"].minV = 0;
         colors["beard"].maxV = 100;
         skinHSV = ColorFunctions.rgb2hsv(theCharacter.skinColor.r * theCharacter.skinColor.bc,theCharacter.skinColor.g * theCharacter.skinColor.bc,theCharacter.skinColor.b * theCharacter.skinColor.bc);
         bristleHSV = ColorFunctions.rgb2hsv(theCharacter.bristleColor.r * theCharacter.bristleColor.bc,theCharacter.bristleColor.g * theCharacter.bristleColor.bc,theCharacter.bristleColor.b * theCharacter.bristleColor.bc);
         bristleGrade = Math.max(Math.round((skinHSV.s - bristleHSV.s + skinHSV.v - bristleHSV.v) / 20),0);
         photoBG = new ImportedBitmap("GenericBackgroundLarge.png");
         screenTitle = new EngineText(Texts.fetch(1525).toUpperCase(),16777215,16,"center",320,21,540,20);
         D.addToMask(screenTitle);
         nameTitle = new EngineText(Texts.fetch(1526,null,15).toUpperCase() + ":",16777215,14,"left",315,62,540,20);
         D.addChild(nameTitle);
         maleSign = new InterfaceIconMale();
         femaleSign = new InterfaceIconFemale();
         femaleSign.x = 850;
         femaleSign.y = 72;
         femaleSign.scaleX = femaleSign.scaleY = 0.25;
         D.addToMask(femaleSign);
         maleSign.x = 800;
         maleSign.y = 72;
         maleSign.scaleX = maleSign.scaleY = 0.25;
         D.addToMask(maleSign);
         radio = [];
         i = 0;
         while(i <= 1)
         {
            radio[i] = {};
            radio[i].disp = new Sprite();
            radio[i].BG = new Sprite();
            radio[i].BG.graphics.beginFill(11052176);
            radio[i].BG.graphics.drawCircle(0,0,8);
            radio[i].BG.filters = [new DropShadowFilter(3,45,0,0.3,2,2,1,3,true)];
            radio[i].disp.addChild(radio[i].BG);
            radio[i].innerCircle = new Sprite();
            radio[i].innerCircle.graphics.beginFill(2630688);
            radio[i].innerCircle.graphics.drawCircle(0,0,4);
            radio[i].innerCircle.visible = false;
            radio[i].disp.addChild(radio[i].innerCircle);
            radio[i].disp.buttonMode = true;
            radio[i].disp.mouseChildren = false;
            radio[i].disp.addEventListener("click",clickRadio,false,0,false);
            D.addChild(radio[i].disp);
            i = Number(i) + 1;
         }
         radio[0].disp.x = 830;
         radio[0].disp.y = 72;
         radio[1].disp.x = 780;
         radio[1].disp.y = 72;
         genderText = new EngineText(Texts.fetch(1527,null,15).toUpperCase() + ":",16777215,14,"left",315,62,540,20);
         genderText.x = 760 - genderText.textWidth;
         D.addToMask(genderText);
         nameSpaceWidth = genderText.x - (nameTitle.x + nameTitle.textWidth) - 30;
         nameBG = new Sprite();
         nameBG.graphics.beginFill(11052176);
         nameBG.graphics.drawRect(0,0,nameSpaceWidth,20);
         nameBG.filters = [new DropShadowFilter(3,45,0,0.3,2,2,1,3,true)];
         nameBG.x = nameTitle.x + nameTitle.textWidth + 10;
         nameBG.y = 62;
         D.addChild(nameBG);
         nameText = new EngineText(theCharacter.name,0,14,"left",nameBG.x + 5,62,nameSpaceWidth - 20,20);
         nameText.selectable = true;
         nameText.maxChars = 30;
         nameText.type = "input";
         nameText.addEventListener("change",function():*
         {
            theCharacter.name = nameText.text;
            trace(theCharacter.name);
         },false,0,false);
         D.addChild(nameText);
         photoBG.x = 20;
         photoBG.y = 20;
         photoBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         photoBG.transform.colorTransform = new ColorTransform(1,1,1,1,30,30,30,0);
         D.addChild(photoBG);
         portrait = new Sprite();
         portraitHolder = new Sprite();
         portraitHolder.addChild(portrait);
         portraitHolder.x = 20;
         portraitHolder.y = 20;
         D.addChild(portraitHolder);
         photoBGFrame = new Sprite();
         photoBGFrame.graphics.lineStyle(3,1050624,0.5);
         photoBGFrame.graphics.drawRect(0,0,248,248);
         photoBGFrame.x = 21;
         photoBGFrame.y = 21;
         D.addChild(photoBGFrame);
         buttons = [];
         values = [];
         attributeNames = [];
         attributeValueBGs = [];
         aboutAttributesText = new EngineText("",16777215,11,"right",700,104,160,18);
         aboutAttributesText.htmlText = "<a href=\'http://caravaneer.gamesofhonor.com/c2officialinstructions.php?page=4\' target=\'_blank\'>" + Texts.fetch(7102) + "</a>";
         lines.graphics.lineStyle(1,16777215);
         lines.graphics.moveTo(860,119);
         lines.graphics.lineTo(856 - Math.min(aboutAttributesText.textWidth,aboutAttributesText.width),119);
         D.addToMask(aboutAttributesText);
         i = 0;
         while(i <= 4)
         {
            if(i < 4)
            {
               attributeNames[i] = new EngineText(Texts.fetch(944 + i,null,25).toUpperCase() + ":",16777215,14,"right",315,102 + i * 30,250,20);
               D.addChild(attributeNames[i]);
               buttons.push(new Button(8,pressButton,new RepeatedGraphics(1)));
               buttons[buttons.length - 1].x = 607;
               buttons[buttons.length - 1].y = 101 + i * 30;
               buttons[buttons.length - 1].scaleX = buttons[buttons.length - 1].scaleY = 0.95;
               D.addChild(buttons[buttons.length - 1]);
               buttons.push(new Button(8,pressButton,new RepeatedGraphics(2)));
               buttons[buttons.length - 1].x = 667;
               buttons[buttons.length - 1].y = 101 + i * 30;
               buttons[buttons.length - 1].scaleX = buttons[buttons.length - 1].scaleY = 0.95;
               D.addChild(buttons[buttons.length - 1]);
            }
            attributeValueBGs[i] = new Sprite();
            attributeValueBGs[i].graphics.beginFill(11052176);
            attributeValueBGs[i].graphics.drawRect(0,0,40,20);
            attributeValueBGs[i].filters = [new DropShadowFilter(3,45,0,0.3,2,2,1,3,true)];
            attributeValueBGs[i].x = 630;
            values[i] = new EngineText("X",0,14,"center",630,102 + i * 30,40,20);
            if(i < 4)
            {
               attributeValueBGs[i].y = 102 + i * 30;
            }
            else
            {
               attributeValueBGs[i].y = 222;
               values[i].y = 222;
            }
            D.addChild(attributeValueBGs[i]);
            D.addChild(values[i]);
            i = Number(i) + 1;
         }
         attributeNames[4] = new EngineText(Texts.fetch(1528).toUpperCase() + ":",16777215,14,"right",315,222,250,20);
         D.addChild(attributeNames[4]);
         lines.graphics.lineStyle(1,16777215);
         lines.graphics.moveTo(315,442);
         lines.graphics.lineTo(565,442);
         lines.graphics.moveTo(610,442);
         lines.graphics.lineTo(860,442);
         lines.graphics.moveTo(315,302);
         lines.graphics.lineTo(315,442);
         lines.graphics.moveTo(565,302);
         lines.graphics.lineTo(565,442);
         lines.graphics.moveTo(610,302);
         lines.graphics.lineTo(610,442);
         lines.graphics.moveTo(860,302);
         lines.graphics.lineTo(860,442);
         facePartsNames = [];
         for(i in buttonsOrder)
         {
            if(i < 7)
            {
               placeX = 315;
            }
            else
            {
               placeX = 610;
            }
            placeY = 302 + i % 7 * 20;
            facePartsNames[i] = new EngineText(Texts.fetch(namesOrder[buttonsOrder[i]],null,20).toUpperCase(),16777215,14,"center",placeX,placeY,250,20);
            D.addToMask(facePartsNames[i]);
            lines.graphics.moveTo(placeX,placeY);
            lines.graphics.lineTo(placeX + 250,placeY);
            buttons.push(new Button(7,pressButton,new RepeatedGraphics(1)));
            buttons[buttons.length - 1].x = placeX + 3;
            buttons[buttons.length - 1].y = placeY + 3;
            D.addChild(buttons[buttons.length - 1]);
            buttons.push(new Button(7,pressButton,new RepeatedGraphics(2)));
            buttons[buttons.length - 1].x = placeX + 234;
            buttons[buttons.length - 1].y = placeY + 3;
            D.addChild(buttons[buttons.length - 1]);
         }
         buttons.push(new Button(2,pressButton,Texts.fetch(634,null,20).toUpperCase()));
         buttons[buttons.length - 1].x = 42;
         buttons[buttons.length - 1].y = 459;
         D.addChild(buttons[buttons.length - 1]);
         buttons.push(new Button(2,pressButton,Texts.fetch(1547,null,20).toUpperCase()));
         buttons[buttons.length - 1].x = 337;
         buttons[buttons.length - 1].y = 459;
         D.addChild(buttons[buttons.length - 1]);
         buttons.push(new Button(2,pressButton,Texts.fetch(1229,null,20).toUpperCase()));
         buttons[buttons.length - 1].x = 632;
         buttons[buttons.length - 1].y = 459;
         D.addChild(buttons[buttons.length - 1]);
         buttons.push(new Button(2,pressButton,Texts.fetch(1548,null,20).toUpperCase()));
         buttons[buttons.length - 1].x = 337;
         buttons[buttons.length - 1].y = 259;
         D.addChild(buttons[buttons.length - 1]);
         buttons.push(new Button(2,pressButton,Texts.fetch(1549,null,20).toUpperCase()));
         buttons[buttons.length - 1].x = 632;
         buttons[buttons.length - 1].y = 259;
         D.addChild(buttons[buttons.length - 1]);
         update();
         colorPicker = new ColorPicker();
         colorPicker.visible = false;
         D.addChild(colorPicker);
         addChild(D);
      }
      
      public function pressButton(param1:* = null) : *
      {
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc2_:* = undefined;
         var _loc7_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         for(_loc6_ in buttons)
         {
            if(buttons[_loc6_] == param1)
            {
               _loc3_ = _loc6_;
               break;
            }
         }
         switch(_loc3_)
         {
            case 0:
               if(theCharacter.basePhysical > 1)
               {
                  theCharacter.basePhysical--;
                  availablePoints = Number(availablePoints) + 1;
               }
               break;
            case 1:
               if(availablePoints > 0 && theCharacter.basePhysical < 10)
               {
                  theCharacter.basePhysical++;
                  availablePoints = Number(availablePoints) - 1;
               }
               break;
            case 2:
               if(theCharacter.baseAgility > 1)
               {
                  theCharacter.baseAgility--;
                  availablePoints = Number(availablePoints) + 1;
               }
               break;
            case 3:
               if(availablePoints > 0 && theCharacter.baseAgility < 10)
               {
                  theCharacter.baseAgility++;
                  availablePoints = Number(availablePoints) - 1;
               }
               break;
            case 4:
               if(theCharacter.baseAccuracy > 1)
               {
                  theCharacter.baseAccuracy--;
                  availablePoints = Number(availablePoints) + 1;
               }
               break;
            case 5:
               if(availablePoints > 0 && theCharacter.baseAccuracy < 10)
               {
                  theCharacter.baseAccuracy++;
                  availablePoints = Number(availablePoints) - 1;
               }
               break;
            case 6:
               if(theCharacter.baseIntelligence > 1)
               {
                  theCharacter.baseIntelligence--;
                  availablePoints = Number(availablePoints) + 1;
               }
               break;
            case 7:
               if(availablePoints > 0 && theCharacter.baseIntelligence < 10)
               {
                  theCharacter.baseIntelligence++;
                  availablePoints = Number(availablePoints) - 1;
               }
         }
         if(_loc3_ > 7 && _loc3_ < 36)
         {
            _loc8_ = Math.floor((_loc3_ - 8) / 2);
            _loc2_ = _loc3_ % 2;
            if(buttonsOrder[_loc8_] == 13)
            {
               if(_loc2_ == 0)
               {
                  bristleGrade = Number(bristleGrade) - 1;
                  if(bristleGrade < 0)
                  {
                     bristleGrade = 7 - 1;
                  }
               }
               if(_loc2_ == 1)
               {
                  bristleGrade = Number(bristleGrade) + 1;
                  if(bristleGrade >= 7)
                  {
                     bristleGrade = 0;
                  }
               }
            }
            else
            {
               if(_loc2_ == 0)
               {
                  parts[partsOrder[buttonsOrder[_loc8_]]].currentInd--;
                  if(parts[partsOrder[buttonsOrder[_loc8_]]].currentInd < 0)
                  {
                     parts[partsOrder[buttonsOrder[_loc8_]]].currentInd = parts[partsOrder[buttonsOrder[_loc8_]]].available.length - 1;
                  }
               }
               if(_loc2_ == 1)
               {
                  parts[partsOrder[buttonsOrder[_loc8_]]].currentInd++;
                  if(parts[partsOrder[buttonsOrder[_loc8_]]].currentInd >= parts[partsOrder[buttonsOrder[_loc8_]]].available.length)
                  {
                     parts[partsOrder[buttonsOrder[_loc8_]]].currentInd = 0;
                  }
               }
               parts[partsOrder[buttonsOrder[_loc8_]]].desired = parts[partsOrder[buttonsOrder[_loc8_]]].available[parts[partsOrder[buttonsOrder[_loc8_]]].currentInd];
            }
         }
         if(_loc3_ == 36)
         {
            onCancel();
         }
         if(_loc3_ == 37)
         {
            theCharacter = new Character({
               "age":theCharacter.age,
               "eyeSockets":1,
               "gender":theCharacter.gender,
               "name":theCharacter.name,
               "physical":theCharacter.basePhysical,
               "agility":theCharacter.baseAgility,
               "accuracy":theCharacter.baseAccuracy,
               "intelligence":theCharacter.baseIntelligence,
               "caravan":theCharacter.caravan
            });
            theCharacter.category = 1;
            theCharacter.neverPanic = true;
            init();
         }
         if(_loc3_ == 38)
         {
            theCharacter.updateBattlefieldAppearence();
            onDone();
         }
         if(_loc3_ == 39)
         {
            theCharacter.name = NamePhonetics.randomName(theCharacter.gender);
            nameText.text = theCharacter.name;
         }
         if(_loc3_ == 40)
         {
            _loc7_ = [];
            _loc6_ = 0;
            while(_loc6_ <= 3)
            {
               _loc7_[_loc6_] = 1;
               _loc6_++;
            }
            _loc5_ = 16;
            while(_loc5_ > 0)
            {
               _loc4_ = MathFunctions.random(0,3);
               if(_loc7_[_loc4_] < 10)
               {
                  _loc7_[_loc4_]++;
                  _loc5_--;
               }
            }
            theCharacter.basePhysical = _loc7_[0];
            theCharacter.baseAgility = _loc7_[1];
            theCharacter.baseAccuracy = _loc7_[2];
            theCharacter.baseIntelligence = _loc7_[3];
            availablePoints = 0;
         }
         if(_loc3_ != 36 && _loc3_ != 38 && _loc3_ != 39)
         {
            update();
         }
      }
      
      public function clickRadio(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc3_ in radio)
         {
            if(radio[_loc3_].disp == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         switch(_loc2_)
         {
            case 0:
               theCharacter.gender = 2;
               break;
            case 1:
               theCharacter.gender = 1;
         }
         update();
      }
      
      public function clickColorBox(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc4_ in colorsOrder)
         {
            if(param1.target == colors[colorsOrder[_loc4_]].box)
            {
               _loc2_ = colorsOrder[_loc4_];
               _loc3_ = colorNames[_loc4_];
               break;
            }
         }
         _loc5_ = theCharacter[_loc2_ + "Color"];
         colors[_loc2_].hsv = ColorFunctions.rgb2hsv(_loc5_.r * _loc5_.bc,_loc5_.g * _loc5_.bc,_loc5_.b * _loc5_.bc);
         colorPicker.update(Texts.fetch(_loc3_).toUpperCase(),colors[_loc2_],_loc2_,theCharacter,this);
         colorPicker.visible = true;
      }
      
      public function update() : *
      {
         var _loc5_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc7_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         _loc6_ = 8;
         for(_loc4_ in colorsOrder)
         {
            _loc7_ = theCharacter[colorsOrder[_loc4_] + "Color"];
            colors[colorsOrder[_loc4_]].hsv = ColorFunctions.rgb2hsv(_loc7_.r * _loc7_.bc,_loc7_.g * _loc7_.bc,_loc7_.b * _loc7_.bc);
            colors[colorsOrder[_loc4_]].hsv.h = colors[colorsOrder[_loc4_]].defaultH;
            colors[colorsOrder[_loc4_]].hsv.s = colors[colorsOrder[_loc4_]].defaultS;
            if(colors[colorsOrder[_loc4_]].hsv.h <= colors[colorsOrder[_loc4_]].minH)
            {
               colors[colorsOrder[_loc4_]].lowerH = null;
            }
            else
            {
               colors[colorsOrder[_loc4_]].lowerH = Math.max(colors[colorsOrder[_loc4_]].hsv.h - 8,colors[colorsOrder[_loc4_]].minH);
               colors[colorsOrder[_loc4_]].lowerHColor = ColorFunctions.hsv2rgb(colors[colorsOrder[_loc4_]].lowerH,colors[colorsOrder[_loc4_]].hsv.s,colors[colorsOrder[_loc4_]].hsv.v);
            }
            if(colors[colorsOrder[_loc4_]].hsv.h >= colors[colorsOrder[_loc4_]].maxH)
            {
               colors[colorsOrder[_loc4_]].higherH = null;
            }
            else
            {
               colors[colorsOrder[_loc4_]].higherH = Math.min(colors[colorsOrder[_loc4_]].hsv.h + 8,colors[colorsOrder[_loc4_]].maxH);
               colors[colorsOrder[_loc4_]].higherHColor = ColorFunctions.hsv2rgb(colors[colorsOrder[_loc4_]].higherH,colors[colorsOrder[_loc4_]].hsv.s,colors[colorsOrder[_loc4_]].hsv.v);
            }
            if(colors[colorsOrder[_loc4_]].hsv.s <= colors[colorsOrder[_loc4_]].minS)
            {
               colors[colorsOrder[_loc4_]].lowerS = null;
            }
            else
            {
               colors[colorsOrder[_loc4_]].lowerS = Math.max(colors[colorsOrder[_loc4_]].hsv.s - 8,colors[colorsOrder[_loc4_]].minS);
               colors[colorsOrder[_loc4_]].lowerSColor = ColorFunctions.hsv2rgb(colors[colorsOrder[_loc4_]].hsv.h,colors[colorsOrder[_loc4_]].lowerS,colors[colorsOrder[_loc4_]].hsv.v);
            }
            if(colors[colorsOrder[_loc4_]].hsv.s >= colors[colorsOrder[_loc4_]].maxS)
            {
               colors[colorsOrder[_loc4_]].higherS = null;
            }
            else
            {
               colors[colorsOrder[_loc4_]].higherS = Math.min(colors[colorsOrder[_loc4_]].hsv.s + 8,colors[colorsOrder[_loc4_]].maxS);
               colors[colorsOrder[_loc4_]].higherSColor = ColorFunctions.hsv2rgb(colors[colorsOrder[_loc4_]].hsv.h,colors[colorsOrder[_loc4_]].higherS,colors[colorsOrder[_loc4_]].hsv.v);
            }
            if(colors[colorsOrder[_loc4_]].hsv.v <= colors[colorsOrder[_loc4_]].minV)
            {
               colors[colorsOrder[_loc4_]].lowerV = null;
            }
            else
            {
               colors[colorsOrder[_loc4_]].lowerV = Math.max(colors[colorsOrder[_loc4_]].hsv.v - 8,colors[colorsOrder[_loc4_]].minV);
               colors[colorsOrder[_loc4_]].lowerVColor = ColorFunctions.hsv2rgb(colors[colorsOrder[_loc4_]].hsv.h,colors[colorsOrder[_loc4_]].hsv.s,colors[colorsOrder[_loc4_]].lowerV);
            }
            if(colors[colorsOrder[_loc4_]].hsv.v >= colors[colorsOrder[_loc4_]].maxV)
            {
               colors[colorsOrder[_loc4_]].higherV = null;
            }
            else
            {
               colors[colorsOrder[_loc4_]].higherV = Math.min(colors[colorsOrder[_loc4_]].hsv.v + 8,colors[colorsOrder[_loc4_]].maxV);
               colors[colorsOrder[_loc4_]].higherVColor = ColorFunctions.hsv2rgb(colors[colorsOrder[_loc4_]].hsv.h,colors[colorsOrder[_loc4_]].hsv.s,colors[colorsOrder[_loc4_]].higherV);
            }
            if(colors[colorsOrder[_loc4_]].box is Sprite && D.contains(colors[colorsOrder[_loc4_]].box))
            {
               D.removeChild(colors[colorsOrder[_loc4_]].box);
            }
            _loc3_ = {
               "r":Math.round(theCharacter[colorsOrder[_loc4_] + "Color"].r * theCharacter[colorsOrder[_loc4_] + "Color"].bc),
               "g":Math.round(theCharacter[colorsOrder[_loc4_] + "Color"].g * theCharacter[colorsOrder[_loc4_] + "Color"].bc),
               "b":Math.round(theCharacter[colorsOrder[_loc4_] + "Color"].b * theCharacter[colorsOrder[_loc4_] + "Color"].bc)
            };
            colors[colorsOrder[_loc4_]].box = new Sprite();
            colors[colorsOrder[_loc4_]].box.graphics.beginFill(ColorFunctions.rgb2num(_loc3_.r,_loc3_.g,_loc3_.b));
            colors[colorsOrder[_loc4_]].box.graphics.drawRect(0,0,120,14);
            colors[colorsOrder[_loc4_]].box.graphics.endFill();
            colors[colorsOrder[_loc4_]].box.x = 151;
            colors[colorsOrder[_loc4_]].box.y = 305 + _loc4_ * 20;
            D.addChild(colors[colorsOrder[_loc4_]].box);
            colors[colorsOrder[_loc4_]].box.buttonMode = true;
            colors[colorsOrder[_loc4_]].box.addEventListener("click",clickColorBox,false,0,false);
         }
         for(_loc4_ in partsOrder)
         {
            _loc1_ = "portrait" + partsOrder[_loc4_].substring(0,1).toUpperCase() + partsOrder[_loc4_].substring(1,partsOrder[_loc4_].length);
            parts[partsOrder[_loc4_]].available = theCharacter.getPortraitOptions(partsOrder[_loc4_]);
            _loc2_ = false;
            for(_loc5_ in parts[partsOrder[_loc4_]].available)
            {
               if(parts[partsOrder[_loc4_]].available[_loc5_] == parts[partsOrder[_loc4_]].desired)
               {
                  _loc2_ = true;
                  parts[partsOrder[_loc4_]].currentInd = _loc5_;
                  break;
               }
            }
            if(!_loc2_)
            {
               for(_loc5_ in parts[partsOrder[_loc4_]].available)
               {
                  if(parts[partsOrder[_loc4_]].available[_loc5_] == parts[partsOrder[_loc4_]].temporary)
                  {
                     _loc2_ = true;
                     parts[partsOrder[_loc4_]].currentInd = _loc5_;
                     break;
                  }
               }
               if(!_loc2_)
               {
                  parts[partsOrder[_loc4_]].currentInd = MathFunctions.random(0,parts[partsOrder[_loc4_]].available.length - 1);
                  parts[partsOrder[_loc4_]].temporary = parts[partsOrder[_loc4_]].available[parts[partsOrder[_loc4_]].currentInd];
               }
            }
            theCharacter[_loc1_] = parts[partsOrder[_loc4_]].available[parts[partsOrder[_loc4_]].currentInd];
         }
         if(theCharacter.gender == 2)
         {
            theCharacter.bristleColor = {
               "r":theCharacter.skinColor.r,
               "g":theCharacter.skinColor.g,
               "b":theCharacter.skinColor.b,
               "bc":theCharacter.skinColor.bc
            };
         }
         else
         {
            theCharacter.bristleColor = ColorFunctions.hsv2rgb(colors["skin"].hsv.h,Math.max(colors["skin"].hsv.s - bristleGrade * 10,0),Math.max(colors["skin"].hsv.v - bristleGrade * 10,0));
            theCharacter.bristleColor.bc = theCharacter.skinColor.bc;
         }
         portraitHolder.removeChild(portrait);
         portrait = theCharacter.getPortrait(true);
         portraitHolder.addChild(portrait);
         values[0].text = theCharacter.basePhysical;
         values[1].text = theCharacter.baseAgility;
         values[2].text = theCharacter.baseAccuracy;
         values[3].text = theCharacter.baseIntelligence;
         values[4].text = availablePoints;
         radio[0].innerCircle.visible = theCharacter.gender == 2;
         radio[1].innerCircle.visible = theCharacter.gender == 1;
      }
      
      public function init() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         for(_loc1_ in partsOrder)
         {
            parts[partsOrder[_loc1_]] = {"desired":theCharacter["portrait" + partsOrder[_loc1_].substring(0,1).toUpperCase() + partsOrder[_loc1_].substring(1,partsOrder[_loc1_].length)]};
         }
         for(_loc1_ in colorsOrder)
         {
            _loc2_ = theCharacter[colorsOrder[_loc1_] + "Color"];
            colors[colorsOrder[_loc1_]].hsv = ColorFunctions.rgb2hsv(_loc2_.r * _loc2_.bc,_loc2_.g * _loc2_.bc,_loc2_.b * _loc2_.bc);
            colors[colorsOrder[_loc1_]].defaultH = colors[colorsOrder[_loc1_]].hsv.h;
            colors[colorsOrder[_loc1_]].defaultS = colors[colorsOrder[_loc1_]].hsv.s;
         }
      }
      
      public function defaultOnDone() : *
      {
         trace("done");
      }
      
      public function defaultOnCancel() : *
      {
         trace("cancel");
      }
   }
}

