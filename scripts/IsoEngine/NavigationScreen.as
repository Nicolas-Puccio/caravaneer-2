package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.*;
   import flash.filters.DropShadowFilter;
   
   public class NavigationScreen extends Sprite
   {
      
      public var GD:*;
      
      public var map:*;
      
      public var mapBG:*;
      
      public var innerMap:*;
      
      public var mapTowns:*;
      
      public var navigationMark:*;
      
      public var buttons:*;
      
      public var pressedButtons:*;
      
      public var movePerFrame:* = 1;
      
      public var innerMapLines:*;
      
      public var infoText:*;
      
      public var navText:*;
      
      public var markerLine:*;
      
      public var startMark:*;
      
      public var endMark:*;
      
      public const innerMapColor:* = 2232576;
      
      public const markerColor:* = 2892436;
      
      public const defaultReduction:* = 8;
      
      public var travelTime:*;
      
      public var waterNeed:*;
      
      public var waterAvailable:*;
      
      public var foodNeed:*;
      
      public var foodAvailable:*;
      
      public var forageNeed:*;
      
      public var forageAvailable:*;
      
      public var fuelNeed:*;
      
      public var fuelPer100Km:*;
      
      public var fuelAvailable:*;
      
      public var pressedUp:*;
      
      public var pressedDown:*;
      
      public var pressedRight:*;
      
      public var pressedLeft:*;
      
      public var stopped:* = false;
      
      public var distance:*;
      
      public var direction:*;
      
      public var goButton:*;
      
      public var invertButton:*;
      
      public function NavigationScreen(param1:*)
      {
         var _loc6_:* = undefined;
         super();
         GD = param1;
         var _loc3_:Dialogue = new Dialogue(880,495);
         pressedButtons = [];
         _loc3_.drawHorizontalLine(42,40,600);
         _loc3_.drawHorizontalLine(452,40,600);
         _loc3_.drawVerticalLine(40,42,452);
         _loc3_.drawVerticalLine(600,42,452);
         var _loc11_:Sprite = new Sprite();
         var _loc14_:ImportedBitmap = new ImportedBitmap("TownBG.jpg");
         _loc14_.x = -660;
         _loc11_.addChild(_loc14_);
         var _loc16_:Sprite = new Sprite();
         _loc16_.graphics.beginFill(16711680);
         _loc16_.graphics.drawRect(0,0,220,410);
         _loc11_.addChild(_loc16_);
         _loc14_.mask = _loc16_;
         _loc11_.x = 640;
         _loc11_.y = 42;
         _loc11_.filters = [new DropShadowFilter(3,45,0,1,5,5,0.5,3)];
         _loc3_.addChild(_loc11_);
         var _loc13_:Button = new Button(2,closeThis,Texts.fetch(902).toUpperCase());
         _loc13_.x = 647;
         _loc13_.y = 459;
         _loc3_.addChild(_loc13_);
         map = new Sprite();
         var _loc12_:Sprite = new Sprite();
         _loc12_.graphics.beginFill(16711680);
         _loc12_.graphics.drawRect(0,0,560,410);
         _loc12_.x = 40;
         _loc12_.y = 42;
         map.mask = _loc12_;
         mapBG = new ImportedBitmap("TownBG.jpg");
         mapBG.scaleX = -1;
         mapBG.x = 880;
         map.addChild(mapBG);
         map.filters = [new DropShadowFilter(3,45,3351057,1,5,5,0.5,3,true)];
         map.x = 40;
         map.y = 42;
         _loc3_.addChild(map);
         buttons = [];
         var _loc8_:RepeatedGraphics = new RepeatedGraphics(1);
         _loc8_.rotation = 90;
         buttons[0] = new Button(2,new Function(),_loc8_);
         buttons[0].x = 217;
         buttons[0].y = 9;
         _loc3_.addChild(buttons[0]);
         var _loc4_:RepeatedGraphics = new RepeatedGraphics(1);
         _loc4_.rotation = -90;
         buttons[2] = new Button(2,new Function(),_loc4_);
         buttons[2].x = 217;
         buttons[2].y = 459;
         _loc3_.addChild(buttons[2]);
         var _loc7_:RepeatedGraphics = new RepeatedGraphics(1);
         _loc7_.rotation = 90;
         buttons[3] = new Button(2,new Function(),_loc7_);
         buttons[3].x = 7;
         buttons[3].y = 144;
         buttons[3].scaleX = -1;
         buttons[3].rotation = -90;
         _loc3_.addChild(buttons[3]);
         var _loc9_:RepeatedGraphics = new RepeatedGraphics(1);
         _loc9_.rotation = -90;
         buttons[1] = new Button(2,new Function(),_loc9_);
         buttons[1].x = 607;
         buttons[1].y = 144;
         buttons[1].scaleX = -1;
         buttons[1].rotation = -90;
         _loc3_.addChild(buttons[1]);
         buttons[4] = new Button(8,new Function(),"+");
         buttons[4].x = 607.5;
         buttons[4].y = 42;
         _loc3_.addChild(buttons[4]);
         buttons[5] = new Button(8,new Function(),"-");
         buttons[5].x = 607.5;
         buttons[5].y = 72;
         _loc3_.addChild(buttons[5]);
         buttons[6] = new Button(8,new Function(),"R");
         buttons[6].x = 607.5;
         buttons[6].y = 429;
         _loc3_.addChild(buttons[6]);
         for(_loc6_ in buttons)
         {
            buttons[_loc6_].clickFunction = buttons[_loc6_].outFunction = releaseButton;
            buttons[_loc6_].downFunction = pressButton;
         }
         var _loc5_:EngineText = new EngineText(Texts.fetch(1396).toUpperCase(),16777215,14,"center",640,12,220,20);
         _loc3_.addToMask(_loc5_);
         innerMapLines = new Sprite();
         map.addChild(innerMapLines);
         innerMap = new Sprite();
         mapTowns = [];
         for(_loc6_ in GD.Towns)
         {
            mapTowns[_loc6_] = {};
            mapTowns[_loc6_].disp = new Sprite();
            mapTowns[_loc6_].circle = new Sprite();
            mapTowns[_loc6_].circle.graphics.beginFill(2232576);
            mapTowns[_loc6_].circle.graphics.drawCircle(0,0,3 + GD.Towns[_loc6_].population / 500);
            mapTowns[_loc6_].disp.addChild(mapTowns[_loc6_].circle);
            mapTowns[_loc6_].text = new EngineText(GD.Towns[_loc6_].name,2232576,12,"center",-100,mapTowns[_loc6_].circle.height / 2,200,20);
            mapTowns[_loc6_].width = mapTowns[_loc6_].textWidth + 10;
            mapTowns[_loc6_].x = 0 - mapTowns[_loc6_].width / 2;
            mapTowns[_loc6_].disp.addChild(mapTowns[_loc6_].text);
            mapTowns[_loc6_].disp.x = Presets.Towns[_loc6_].x / 8;
            mapTowns[_loc6_].disp.y = Presets.Towns[_loc6_].y / 8;
            mapTowns[_loc6_].disp.cacheAsBitmap = true;
            innerMap.addChild(mapTowns[_loc6_].disp);
         }
         map.addChild(innerMap);
         var _loc15_:Sprite = new Sprite();
         _loc15_.graphics.beginFill(4278190080);
         _loc15_.graphics.drawRect(15,15,530,380);
         map.addChild(_loc15_);
         innerMap.mask = _loc15_;
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.lineStyle(2,2232576);
         _loc2_.graphics.drawRect(15,15,530,380);
         _loc2_.graphics.lineStyle(1,2232576);
         _loc2_.graphics.drawRect(10,10,540,390);
         _loc2_.graphics.drawRect(5,5,550,400);
         map.addChild(_loc2_);
         addChild(_loc3_);
         infoText = new EngineText("",2232576,14,"center",650,52,200,390,true,true);
         _loc3_.addChild(infoText);
         navText = new EngineText("",2892436,12,"left",60,62,500,390,true,true);
         var _loc10_:Sprite = new Sprite();
         _loc10_.addChild(navText);
         _loc10_.mouseChildren = false;
         _loc10_.mouseEnabled = false;
         _loc3_.addChild(_loc10_);
         goButton = {};
         goButton.disp = new Sprite();
         goButton.txt = new EngineText(Texts.fetch(2221).toUpperCase(),2232576,14,"center",0,0,180,20);
         goButton.disp.addChild(goButton.txt);
         goButton.disp.x = 660;
         goButton.disp.y = 352;
         goButton.disp.graphics.lineStyle(1,2232576);
         goButton.disp.graphics.drawRect(0,0,180,20);
         goButton.hit = new Sprite();
         goButton.hit.graphics.beginFill(16711680);
         goButton.hit.graphics.drawRect(0,0,180,20);
         goButton.disp.addChild(goButton.hit);
         goButton.disp.hitArea = goButton.hit;
         goButton.hit.visible = false;
         goButton.disp.buttonMode = true;
         goButton.disp.mouseChildren = false;
         goButton.disp.addEventListener("click",goButtonFunction,false,0,false);
         _loc3_.addChild(goButton.disp);
         invertButton = {};
         invertButton.disp = new Sprite();
         invertButton.txt = new EngineText(Texts.fetch(2222).toUpperCase(),2232576,14,"center",0,0,180,20);
         invertButton.disp.addChild(invertButton.txt);
         invertButton.disp.x = 660;
         invertButton.disp.y = 382;
         invertButton.disp.graphics.lineStyle(1,2232576);
         invertButton.disp.graphics.drawRect(0,0,180,20);
         invertButton.hit = new Sprite();
         invertButton.hit.graphics.beginFill(16711680);
         invertButton.hit.graphics.drawRect(0,0,180,20);
         invertButton.disp.addChild(invertButton.hit);
         invertButton.disp.hitArea = invertButton.hit;
         invertButton.hit.visible = false;
         invertButton.disp.buttonMode = true;
         invertButton.disp.mouseChildren = false;
         invertButton.disp.addEventListener("click",invertButtonFunction,false,0,false);
         _loc3_.addChild(invertButton.disp);
         map.buttonMode = true;
         map.mouseChildren = false;
         map.useHandCursor = false;
         markerLine = new Sprite();
         innerMap.addChild(markerLine);
         map.addEventListener("mouseDown",clickOnMap,false,0,false);
         startMark = new Sprite();
         startMark.graphics.lineStyle(1,2892436);
         startMark.graphics.drawCircle(0,0,3);
         innerMap.addChild(startMark);
         endMark = new Sprite();
         endMark.graphics.beginFill(2892436);
         endMark.graphics.moveTo(0,0);
         endMark.graphics.lineTo(-4,6);
         endMark.graphics.lineTo(4,6);
         endMark.graphics.endFill();
         innerMap.addChild(endMark);
         if(GD.routeEnd == null)
         {
            GD.routeStart = null;
         }
         if(GD.routeStart != null && GD.routeEnd != null)
         {
            markerLine.x = GD.routeStart.x / 8;
            markerLine.y = GD.routeStart.y / 8;
            markerLine.graphics.clear();
            markerLine.graphics.lineStyle(1,2892436);
            markerLine.graphics.moveTo(0,0);
            markerLine.graphics.lineTo(GD.routeEnd.x / 8 - markerLine.x,GD.routeEnd.y / 8 - markerLine.y);
         }
         navigationMark = new Sprite();
         innerMap.addChild(navigationMark);
         updateZoom();
         updateMap();
         updateInfoText();
         updateMarks();
         addEventListener("enterFrame",EF,false,0,false);
         addEventListener("mouseMove",MM,false,0,false);
         map.addEventListener("mouseWheel",wheelZoom,false,0,false);
         addEventListener("addedToStage",setFocus,false,0,false);
         addEventListener("keyDown",keyPressed,false,0,false);
         addEventListener("keyUp",keyReleased,false,0,false);
      }
      
      public function setFocus(param1:* = null) : *
      {
         stage.stageFocusRect = false;
         stage.focus = this;
      }
      
      internal function keyPressed(param1:*) : *
      {
         if(stopped)
         {
            return;
         }
         if(param1.keyCode == 38 || param1.keyCode == 87)
         {
            pressedButtons[0] = true;
         }
         if(param1.keyCode == 37 || param1.keyCode == 65)
         {
            pressedButtons[3] = true;
         }
         if(param1.keyCode == 40 || param1.keyCode == 83)
         {
            pressedButtons[2] = true;
         }
         if(param1.keyCode == 39 || param1.keyCode == 68)
         {
            pressedButtons[1] = true;
         }
         if(param1.keyCode == 114)
         {
            resetZoom();
         }
      }
      
      internal function keyReleased(param1:*) : *
      {
         if(stopped)
         {
            return;
         }
         if(param1.keyCode == 38 || param1.keyCode == 87)
         {
            pressedButtons[0] = false;
         }
         if(param1.keyCode == 37 || param1.keyCode == 65)
         {
            pressedButtons[3] = false;
         }
         if(param1.keyCode == 40 || param1.keyCode == 83)
         {
            pressedButtons[2] = false;
         }
         if(param1.keyCode == 39 || param1.keyCode == 68)
         {
            pressedButtons[1] = false;
         }
      }
      
      public function updateMap() : *
      {
         var _loc4_:* = undefined;
         var _loc10_:* = undefined;
         var _loc5_:* = undefined;
         for(_loc4_ in GD.Towns)
         {
            mapTowns[_loc4_].disp.visible = GD.Towns[_loc4_].active && GD.Towns[_loc4_].discovered;
         }
         innerMap.x = 280 - GD.mapCenterX / 8 * GD.mapScale;
         innerMap.y = 205 - GD.mapCenterY / 8 * GD.mapScale;
         innerMapLines.graphics.clear();
         var _loc11_:Number = 560 * 8 / GD.mapScale;
         var _loc1_:Number = Math.pow(10,Math.round(Math.log(_loc11_ / 10) * 0.434294481904));
         var _loc2_:Number = GD.mapCenterX - 265 * 8 / GD.mapScale;
         var _loc8_:Number = GD.mapCenterY - 190 * 8 / GD.mapScale;
         var _loc15_:Number = GD.mapCenterX + 265 * 8 / GD.mapScale;
         var _loc6_:Number = GD.mapCenterY + 190 * 8 / GD.mapScale;
         var _loc13_:Number = Math.ceil(_loc2_ / _loc1_) * _loc1_;
         var _loc16_:Number = Math.floor(_loc15_ / _loc1_) * _loc1_;
         var _loc17_:Boolean = _loc13_ / _loc1_ % 2 == 0;
         var _loc3_:Number = Math.ceil(_loc8_ / _loc1_) * _loc1_;
         var _loc12_:Number = Math.floor(_loc6_ / _loc1_) * _loc1_;
         var _loc9_:Boolean = _loc3_ / _loc1_ % 2 == 0;
         innerMapLines.graphics.clear();
         var _loc14_:Array = [];
         innerMapLines.graphics.lineStyle(1,2232576,0.3);
         _loc4_ = _loc13_;
         while(_loc4_ <= _loc16_)
         {
            _loc10_ = _loc4_ / 8 * GD.mapScale + innerMap.x;
            innerMapLines.graphics.moveTo(_loc10_,15);
            innerMapLines.graphics.lineTo(_loc10_,395);
            _loc14_.push(_loc10_);
            _loc4_ += _loc1_;
         }
         _loc14_.unshift(15);
         _loc14_.push(545);
         var _loc7_:Array = [];
         _loc4_ = _loc3_;
         while(_loc4_ <= _loc12_)
         {
            _loc10_ = _loc4_ / 8 * GD.mapScale + innerMap.y;
            innerMapLines.graphics.moveTo(15,_loc10_);
            innerMapLines.graphics.lineTo(545,_loc10_);
            _loc7_.push(_loc10_);
            _loc4_ += _loc1_;
         }
         _loc7_.unshift(15);
         _loc7_.push(395);
         innerMapLines.graphics.lineStyle(1,2232576,1);
         for(_loc4_ in _loc14_)
         {
            innerMapLines.graphics.moveTo(_loc14_[_loc4_],5);
            innerMapLines.graphics.lineTo(_loc14_[_loc4_],10);
            innerMapLines.graphics.moveTo(_loc14_[_loc4_],400);
            innerMapLines.graphics.lineTo(_loc14_[_loc4_],405);
         }
         for(_loc4_ in _loc7_)
         {
            innerMapLines.graphics.moveTo(5,_loc7_[_loc4_]);
            innerMapLines.graphics.lineTo(10,_loc7_[_loc4_]);
            innerMapLines.graphics.moveTo(550,_loc7_[_loc4_]);
            innerMapLines.graphics.lineTo(555,_loc7_[_loc4_]);
         }
         innerMapLines.graphics.lineStyle(0,0);
         _loc4_ = 0;
         while(_loc4_ < _loc14_.length - 1)
         {
            if(_loc17_ && _loc4_ % 2 == 0 || !_loc17_ && _loc4_ % 2 == 1)
            {
               innerMapLines.graphics.beginFill(2232576,0.3);
               innerMapLines.graphics.drawRect(_loc14_[_loc4_],5,_loc14_[_loc4_ + 1] - _loc14_[_loc4_],5);
               innerMapLines.graphics.drawRect(_loc14_[_loc4_],400,_loc14_[_loc4_ + 1] - _loc14_[_loc4_],5);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc7_.length - 1)
         {
            if(_loc9_ && _loc4_ % 2 == 0 || !_loc9_ && _loc4_ % 2 == 1)
            {
               innerMapLines.graphics.beginFill(2232576,0.3);
               innerMapLines.graphics.drawRect(5,_loc7_[_loc4_],5,_loc7_[_loc4_ + 1] - _loc7_[_loc4_]);
               innerMapLines.graphics.drawRect(550,_loc7_[_loc4_],5,_loc7_[_loc4_ + 1] - _loc7_[_loc4_]);
            }
            _loc4_++;
         }
         navigationMark.graphics.clear();
         navText.text = "";
         if(GD.Caravans[0].devicesWorking(198) > 0)
         {
            navigationMark.graphics.lineStyle(1,2892436);
            navigationMark.graphics.drawCircle(0,0,40 / 8);
            navigationMark.graphics.moveTo(-80 / 8,0);
            navigationMark.graphics.lineTo(80 / 8,0);
            navigationMark.graphics.moveTo(0,-80 / 8);
            navigationMark.graphics.lineTo(0,80 / 8);
            navigationMark.x = GD.Caravans[0].x / 8;
            navigationMark.y = GD.Caravans[0].y / 8;
            navText.text = Texts.fetch(5790);
         }
         else if(GD.lastSextantPos.length > 0)
         {
            navigationMark.graphics.lineStyle(1,2892436);
            navigationMark.graphics.beginFill(2892436,0.2);
            navigationMark.graphics.drawCircle(0,0,GD.lastSextantOffset / 8);
            navigationMark.x = GD.lastSextantPos[0] / 8;
            navigationMark.y = GD.lastSextantPos[1] / 8;
            navText.text = Texts.fetch(5791);
            _loc5_ = GD.Time - GD.lastSextantMeasurement;
            navText.text += "\n" + Texts.fetch(5792).replace("@hours@",Math.floor(_loc5_ / 3600)).replace("@minutes@",Math.round(_loc5_ % 3600 / 60));
         }
         MM();
      }
      
      public function updateZoom() : *
      {
         var _loc1_:* = undefined;
         if(GD.mapScale < 0.1)
         {
            GD.mapScale = 0.1;
         }
         if(GD.mapScale > 10)
         {
            GD.mapScale = 10;
         }
         movePerFrame = 8 / GD.mapScale * 10;
         for(_loc1_ in mapTowns)
         {
            mapTowns[_loc1_].text.scaleX = mapTowns[_loc1_].text.scaleY = 1 / Math.pow(GD.mapScale,0.7);
            mapTowns[_loc1_].text.x = 0 - mapTowns[_loc1_].text.width / 2;
         }
         startMark.scaleX = startMark.scaleY = endMark.scaleX = endMark.scaleY = 1 / Math.pow(GD.mapScale,0.7);
         innerMap.scaleX = innerMap.scaleY = GD.mapScale;
      }
      
      public function pressButton(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc2_ in buttons)
         {
            if(param1 == buttons[_loc2_])
            {
               _loc3_ = _loc2_;
               break;
            }
         }
         if(_loc2_ == 6)
         {
            resetZoom();
         }
         pressedButtons[_loc2_] = true;
      }
      
      public function releaseButton(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc2_ in buttons)
         {
            if(param1 == buttons[_loc2_])
            {
               _loc3_ = _loc2_;
               break;
            }
         }
         pressedButtons[_loc2_] = false;
      }
      
      public function resetZoom() : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = 0;
         var _loc1_:Number = 100000000000000000000;
         var _loc4_:Number = -100000000000000000000;
         var _loc2_:Number = 100000000000000000000;
         var _loc6_:Number = -100000000000000000000;
         for(_loc5_ in GD.Towns)
         {
            if(GD.Towns[_loc5_].discovered)
            {
               _loc1_ = Math.min(_loc1_,GD.Towns[_loc5_].x);
               _loc4_ = Math.max(_loc4_,GD.Towns[_loc5_].x);
               _loc2_ = Math.min(_loc2_,GD.Towns[_loc5_].y);
               _loc6_ = Math.max(_loc6_,GD.Towns[_loc5_].y);
               _loc3_++;
            }
         }
         trace(_loc1_ + " " + _loc4_ + " " + _loc2_ + " " + _loc6_);
         GD.mapCenterX = _loc1_ + (_loc4_ - _loc1_) / 2;
         GD.mapCenterY = _loc2_ + (_loc6_ - _loc2_) / 2;
         if(_loc3_ <= 1)
         {
            GD.mapScale = 1;
         }
         else
         {
            GD.mapScale = Math.min(Math.max(Math.min(560 / ((_loc4_ - _loc1_) / 8),410 / ((_loc6_ - _loc2_) / 8)),0.1),1.11) * 0.9;
         }
         updateZoom();
         updateMap();
      }
      
      public function closeThis() : *
      {
         GD.setMode(GD.cameFromMode);
         stopped = true;
      }
      
      public function EF(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         if(stopped)
         {
            return;
         }
         for(_loc3_ in pressedButtons)
         {
            _loc2_ = false;
            var _loc4_:Boolean = false;
            if(pressedButtons[_loc3_])
            {
               switch(_loc3_)
               {
                  case 0:
                     GD.mapCenterY -= movePerFrame;
                     _loc2_ = true;
                     break;
                  case 1:
                     GD.mapCenterX += movePerFrame;
                     _loc2_ = true;
                     break;
                  case 2:
                     GD.mapCenterY += movePerFrame;
                     _loc2_ = true;
                     break;
                  case 3:
                     GD.mapCenterX -= movePerFrame;
                     _loc2_ = true;
                     break;
                  case 4:
                     GD.mapScale *= 1.05;
                     _loc4_ = true;
                     break;
                  case 5:
                     GD.mapScale *= 0.95;
                     _loc4_ = true;
               }
            }
            if(_loc4_)
            {
               updateZoom();
            }
            if(_loc2_ || _loc4_)
            {
               updateMap();
            }
         }
      }
      
      private function clickOnMap(param1:* = null) : *
      {
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         var _loc2_:Number = innerMap.mouseX * 8;
         var _loc3_:Number = innerMap.mouseY * 8;
         if(GD.routeStart != null && GD.routeEnd != null)
         {
            GD.routeStart = null;
            GD.routeEnd = null;
         }
         if(GD.routeStart == null)
         {
            GD.routeStart = {
               "x":_loc2_,
               "y":_loc3_
            };
            markerLine.x = innerMap.mouseX;
            markerLine.y = innerMap.mouseY;
            markerLine.graphics.clear();
         }
         else if(GD.routeEnd == null)
         {
            GD.routeEnd = {
               "x":_loc2_,
               "y":_loc3_
            };
         }
         updateMarks();
         updateInfoText();
      }
      
      public function updateMarks() : *
      {
         startMark.visible = GD.routeStart != null;
         if(startMark.visible)
         {
            startMark.x = GD.routeStart.x / 8;
            startMark.y = GD.routeStart.y / 8;
         }
         endMark.visible = GD.routeEnd != null;
         if(endMark.visible)
         {
            endMark.x = GD.routeEnd.x / 8;
            endMark.y = GD.routeEnd.y / 8;
            endMark.rotation = direction;
         }
      }
      
      public function MM(param1:* = null) : *
      {
         if(stopped)
         {
            return;
         }
         if(GD.routeStart != null && GD.routeEnd == null)
         {
            markerLine.graphics.clear();
            markerLine.graphics.lineStyle(1,2892436);
            markerLine.graphics.moveTo(0,0);
            markerLine.graphics.lineTo(innerMap.mouseX - markerLine.x,innerMap.mouseY - markerLine.y);
            updateInfoText();
         }
      }
      
      public function updateInfoText() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = GD.Caravans[0].getConsumptionProduction();
         foodNeed = _loc5_.foodConsumption - _loc5_.foodProduction;
         fuelPer100Km = _loc5_.fuelPer100Km;
         waterNeed = forageNeed = fuelNeed = 0;
         for(_loc1_ in _loc5_.consumption)
         {
            if(_loc5_.consumption[_loc1_].item == 1)
            {
               waterNeed = _loc5_.consumption[_loc1_].amount;
            }
            if(_loc5_.consumption[_loc1_].item == 62)
            {
               forageNeed = _loc5_.consumption[_loc1_].amount;
            }
            if(_loc5_.consumption[_loc1_].item == 64)
            {
               fuelNeed = _loc5_.consumption[_loc1_].amount;
            }
         }
         for(_loc1_ in _loc5_.production)
         {
            if(_loc5_.production[_loc1_].item == 1)
            {
               waterNeed -= _loc5_.production[_loc1_].amount;
            }
            if(_loc5_.production[_loc1_].item == 62)
            {
               forageNeed -= _loc5_.production[_loc1_].amount;
            }
            if(_loc5_.production[_loc1_].item == 64)
            {
               fuelNeed -= _loc5_.production[_loc1_].amount;
            }
         }
         foodNeed = Math.max(foodNeed,0);
         waterNeed = Math.max(waterNeed,0);
         forageNeed = Math.max(forageNeed,0);
         fuelNeed = Math.max(fuelNeed,0);
         waterAvailable = GD.Caravans[0].water;
         foodAvailable = GD.Caravans[0].food;
         forageAvailable = GD.Caravans[0].forage;
         fuelAvailable = GD.Caravans[0].fuel;
         if(GD.routeStart == null)
         {
            infoText.text = Texts.fetch(1397);
         }
         else if(GD.routeEnd == null)
         {
            infoText.text = Texts.fetch(1398) + "\n\n";
            direction = MathFunctions.CalcRevYAngle(GD.routeStart.x,GD.routeStart.y,innerMap.mouseX * 8,innerMap.mouseY * 8) * MathFunctions.Rad2Deg;
            distance = MathFunctions.CalcDistance(GD.routeStart.x,GD.routeStart.y,innerMap.mouseX * 8,innerMap.mouseY * 8) / 5;
         }
         else
         {
            infoText.text = "";
            direction = MathFunctions.CalcRevYAngle(GD.routeStart.x,GD.routeStart.y,GD.routeEnd.x,GD.routeEnd.y) * MathFunctions.Rad2Deg;
            distance = MathFunctions.CalcDistance(GD.routeStart.x,GD.routeStart.y,GD.routeEnd.x,GD.routeEnd.y) / 5;
         }
         if(GD.routeStart != null && distance > 0)
         {
            infoText.text += Texts.fetch(7) + ": " + MathFunctions.NumberFormat(direction,1,true) + "º\n\n";
            infoText.text += Texts.fetch(1399) + ": " + Math.round(distance) + " " + Texts.fetch(943) + "\n\n";
            if(GD.Caravans[0].hasWindPowered)
            {
               _loc2_ = GD.Caravans[0].direction;
               GD.Caravans[0].direction = direction / MathFunctions.Rad2Deg;
            }
            travelTime = distance / GD.Caravans[0].speed;
            if(GD.Caravans[0].hasWindPowered)
            {
               GD.Caravans[0].direction = _loc2_;
            }
            if(travelTime == 100000000000000000000)
            {
               infoText.text += Texts.fetch(1446);
            }
            else
            {
               _loc3_ = Math.floor(travelTime / 24);
               _loc4_ = Math.round(travelTime % 24);
               if(_loc4_ == 24)
               {
                  _loc3_++;
                  _loc4_ = 0;
               }
               infoText.text += Texts.fetch(1400) + ": ";
               if(_loc3_ > 0)
               {
                  infoText.text += _loc3_ + Texts.abbreviation(941) + " ";
               }
               infoText.text += _loc4_ + Texts.abbreviation(1401) + "\n\n";
            }
         }
         if(GD.routeStart != null && GD.routeEnd != null && travelTime != 100000000000000000000 && distance > 0)
         {
            infoText.text += Texts.fetch(1402) + ": " + MathFunctions.NumberFormat(waterNeed * travelTime / 24,0) + " " + Texts.fetch(11) + "\n";
            infoText.text += Texts.fetch(1403) + ": " + MathFunctions.NumberFormat(waterAvailable,0) + " " + Texts.fetch(11) + "\n\n";
            infoText.text += Texts.fetch(1404) + ": " + MathFunctions.NumberFormat(foodNeed * travelTime / 24,0) + " " + Texts.fetch(939) + "\n";
            infoText.text += Texts.fetch(1405) + ": " + MathFunctions.NumberFormat(foodAvailable,0) + " " + Texts.fetch(939) + "\n\n";
            if(forageNeed > 0)
            {
               infoText.text += Texts.fetch(1406) + ": " + MathFunctions.NumberFormat(forageNeed * travelTime / 24,0) + " " + Texts.fetch(12) + "\n";
               infoText.text += Texts.fetch(1407) + ": " + MathFunctions.NumberFormat(forageAvailable,0) + " " + Texts.fetch(12) + "\n\n";
            }
            if(fuelNeed > 0 || fuelPer100Km > 0)
            {
               infoText.text += Texts.fetch(1408) + ": " + MathFunctions.NumberFormat(fuelNeed * travelTime / 24 + fuelPer100Km * distance / 100,0) + " " + Texts.fetch(11) + "\n";
               infoText.text += Texts.fetch(1409) + ": " + MathFunctions.NumberFormat(fuelAvailable,0) + " " + Texts.fetch(11) + "\n\n";
            }
            infoText.size = 14;
            while(!(infoText.textHeight <= 310 || infoText.size < 8))
            {
               infoText.size--;
            }
            goButton.disp.visible = true;
            invertButton.disp.visible = true;
            goButton.disp.y = 62 + infoText.textHeight;
            invertButton.disp.y = 92 + infoText.textHeight;
         }
         else
         {
            goButton.disp.visible = false;
            invertButton.disp.visible = false;
         }
      }
      
      public function wheelZoom(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(stopped)
         {
            return;
         }
         _loc2_ = 1;
         while(_loc2_ <= Math.abs(param1.delta))
         {
            if(param1.delta > 0)
            {
               GD.mapScale *= 1.05;
            }
            else
            {
               GD.mapScale *= 0.95;
            }
            _loc2_++;
         }
         updateZoom();
         updateMap();
      }
      
      public function goButtonFunction(param1:* = null) : *
      {
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         GD.Caravans[0].direction = direction / MathFunctions.Rad2Deg;
         GD.Caravans[0].moving = true;
         GD.skipPause = true;
         if(GD.cameFromMode != 1)
         {
            GD.setMode(GD.cameFromMode);
         }
         stopped = true;
         GD.setMode(1);
         GD.mapMode.musicFadeIn = true;
      }
      
      public function invertButtonFunction(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         _loc3_ = GD.routeStart.x;
         _loc2_ = GD.routeStart.y;
         GD.routeStart.x = GD.routeEnd.x;
         GD.routeStart.y = GD.routeEnd.y;
         GD.routeEnd.x = _loc3_;
         GD.routeEnd.y = _loc2_;
         updateInfoText();
         updateMarks();
      }
      
      public function remove() : *
      {
         removeEventListener("enterFrame",EF);
         removeEventListener("mouseMove",MM);
         removeEventListener("addedToStage",setFocus);
         removeEventListener("keyDown",keyPressed);
         removeEventListener("keyUp",keyReleased);
         if(stage is Stage)
         {
            stage.focus = stage;
         }
      }
   }
}

