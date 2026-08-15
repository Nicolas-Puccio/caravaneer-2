package IsoEngine
{
   import Data.*;
   import flash.display.*;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.media.Sound;
   import flash.media.SoundTransform;
   import flash.system.*;
   import flash.ui.Mouse;
   import flash.utils.getDefinitionByName;
   
   public class BattleField extends Sprite
   {
      
      public static const pixelsPerMeter:* = 32;
      
      public static var miniMapBorderColor:* = 2290649224;
      
      public static var miniMapObstaclesColor:* = 4287137928;
      
      public static var miniMapYourGroupColor:* = 4283210969;
      
      public static var miniMapAllyColor:* = 4293977146;
      
      public static var miniMapEnemyColor:* = 4294901760;
      
      public static var miniMapFrameColor:* = 1157627903;
      
      public static var miniMapNeutralColor:* = 4292138112;
      
      public static var ObstacleSegmentDirections:*;
      
      public const randomObstacles:*;
      
      public var initialGrenadeHeight:* = 1.8;
      
      public var grenadeAngle:* = 0.7853981633974483;
      
      public var itsAHeadShot:*;
      
      public var succesfulHeadShot:*;
      
      public var centerOnEnemyIndex:*;
      
      public var gridWidth:*;
      
      public var gridHeight:*;
      
      public var inclination:*;
      
      public var verticalCompression:*;
      
      public var squareWidth:*;
      
      public var squareHeight:*;
      
      public var screenWidth:*;
      
      public var screenHeight:*;
      
      public var marksColor:*;
      
      public var difficulty:*;
      
      public var autoCenter:*;
      
      public var walkAnimationSpeed:*;
      
      public var showGrid:*;
      
      public var MobilePart:*;
      
      public var Mask:*;
      
      public var CharactersMap:*;
      
      public var ObstaclesMap:*;
      
      public var Visible:*;
      
      public var Path:*;
      
      public var cursors:*;
      
      public var currCursor:*;
      
      public var Float:*;
      
      public var FloatSpeed:* = 1;
      
      public var FloatHeight:* = 0;
      
      public var UnderGrid:*;
      
      public var GroundMarks:*;
      
      public var OverGrid:*;
      
      public var Grid:*;
      
      public var Shadows:*;
      
      public var Interlacing:*;
      
      public var TopMarks:*;
      
      public var Floor:*;
      
      public var Obstacles:*;
      
      public var Transport:*;
      
      public var obstaclesOnScreen:*;
      
      public var Characters:*;
      
      public var Groups:*;
      
      public var GroupCaravans:*;
      
      public var GroupBands:*;
      
      public var ActList:*;
      
      public var nowActing:*;
      
      public var ASMap:*;
      
      public var theAttacked:*;
      
      public var shiftPressed:* = false;
      
      public var ctrlPressed:* = false;
      
      public var selectedGlow:*;
      
      public var healingMode:*;
      
      public var DroppedWeapons:*;
      
      public var DroppedBolts:*;
      
      public var viewTargetX:*;
      
      public var viewTargetY:*;
      
      public var paused:* = true;
      
      public var xRel:*;
      
      public var yRel:*;
      
      public var viewSpeedX:*;
      
      public var viewSpeedY:*;
      
      public var selectedMark:*;
      
      public var aimAngle:*;
      
      public var ASSolution:*;
      
      public var prevSolX:*;
      
      public var prevSolY:*;
      
      public var squareBoxShiftX:*;
      
      public var squareBoxShiftY:*;
      
      public var textColor:*;
      
      public var cursorTextContainer:*;
      
      public var cursorTextBG:*;
      
      public var cursorText:*;
      
      public var mousePressed:*;
      
      public var mouseOnScreen:*;
      
      public var phase:*;
      
      public var leftViewLimit:*;
      
      public var rightViewLimit:*;
      
      public var topViewLimit:*;
      
      public var bottomViewLimit:*;
      
      public var leftPressed:*;
      
      public var rightPressed:*;
      
      public var downPressed:*;
      
      public var upPressed:*;
      
      public var burstCounter:*;
      
      public var flyingProjectiles:*;
      
      public var flamethrowerInAction:* = false;
      
      public var flamethrowerFlameBitmaps:*;
      
      public var flamethrowerFlames:*;
      
      public var flamethrowerShotAngle:*;
      
      public var RocketImage:*;
      
      public var RocketShadow:*;
      
      public var activeExplosions:*;
      
      public var flyingGrenades:*;
      
      public var cameraShakePower:* = 0;
      
      public var cameraShift:* = 0;
      
      public var BloodBitmaps:*;
      
      public var damageCaused:*;
      
      public var waitText:*;
      
      public var interfaceData:*;
      
      public var miniMapBitmap:*;
      
      public var prevMPX:* = 0;
      
      public var prevMPY:* = 0;
      
      public var allies:* = 0;
      
      public var enemies:* = 0;
      
      public var yourPeople:* = 0;
      
      public var preRendering:* = true;
      
      public var renderIndex:*;
      
      public var waitScreen:*;
      
      public var frameCount:* = 1;
      
      public var obstacles:*;
      
      public var turnCounter:* = 1;
      
      internal const groundMarksShapes:*;
      
      public var timeSpentOnMargin:* = 0;
      
      public var beforeMoveScreenX:*;
      
      public var beforeMoveScreenY:*;
      
      public const screenMoveMargin:* = 40;
      
      internal const directions:*;
      
      public var groundMarksBitmaps:*;
      
      public var gameEnded:* = false;
      
      public var onInterfaceUpdate:*;
      
      public var interfaceOnOff:*;
      
      public var onMessage:*;
      
      public var onLose:*;
      
      public var onWin:*;
      
      public var onAllPanicked:*;
      
      public function BattleField(param1:* = 800, param2:* = 600, param3:* = 100, param4:* = 100, param5:* = null, param6:* = 1, param7:* = true, param8:* = 1, param9:* = true, param10:* = 16777215, param11:* = 32, param12:* = 32, param13:* = 45, param14:* = 0.574)
      {
         var _loc18_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc19_:* = undefined;
         randomObstacles = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
         interfaceData = new InterfaceData();
         groundMarksShapes = [[[0,0],[1,0],[1,1],[0,1],[0,0],[0.2,0.5],[0.5,0.2],[0.8,0.5],[0.6,0.5],[0.6,0.8],[0.4,0.8],[0.4,0.5],[0.2,0.5]],[[0,0],[1,0],[1,1],[0,1],[0,0],[0.2,0.4],[0.5,0.4],[0.5,0.2],[0.8,0.5],[0.5,0.8],[0.5,0.6],[0.2,0.6],[0.2,0.4]],[[0,0],[1,0],[1,1],[0,1],[0,0],[0.4,0.2],[0.6,0.2],[0.6,0.5],[0.8,0.5],[0.5,0.8],[0.2,0.5],[0.4,0.5],[0.4,0.2]],[[0,0],[1,0],[1,1],[0,1],[0,0],[0.2,0.5],[0.5,0.2],[0.5,0.4],[0.8,0.4],[0.8,0.6],[0.5,0.6],[0.5,0.8],[0.2,0.5]],[[0,0],[1,0],[1,1],[0,1],[0,0],[0.3,0.3],[0.7,0.3],[0.7,0.7],[0.3,0.7],[0.3,0.3]],[[0.2,0.3],[0.3,0.2],[0.5,0.4],[0.7,0.2],[0.8,0.3],[0.6,0.5],[0.8,0.7],[0.7,0.8],[0.5,0.6],[0.3,0.8],[0.2,0.7],[0.4,0.5]]];
         directions = [[0,-1],[1,0],[0,1],[-1,0]];
         onInterfaceUpdate = defaultOnInterfaceUpdate;
         interfaceOnOff = defaultInterfaceOnOff;
         onMessage = defaultOnMessage;
         onLose = defaultOnLose;
         onWin = defaultOnWin;
         onAllPanicked = new Function();
         super();
         gridWidth = param3;
         gridHeight = param4;
         inclination = param13;
         verticalCompression = param14;
         squareWidth = param11;
         squareHeight = param12;
         screenWidth = param1;
         screenHeight = param2;
         marksColor = param10;
         obstacles = param5;
         difficulty = param6;
         autoCenter = param7;
         walkAnimationSpeed = param8;
         showGrid = param9;
         interfaceOnOff(false);
         var _loc17_:Number = inclination / MathFunctions.Rad2Deg;
         xRel = Math.sin(_loc17_);
         yRel = Math.cos(_loc17_) * verticalCompression;
         if(!(AnimationData.fullAnimationTypeFrames is Array))
         {
            AnimationData.Initiate();
         }
         Transport = [];
         CharactersMap = [];
         DroppedWeapons = [];
         DroppedBolts = [];
         ObstaclesMap = [];
         _loc18_ = 0;
         while(_loc18_ < gridWidth)
         {
            CharactersMap[_loc18_] = [];
            DroppedWeapons[_loc18_] = [];
            ObstaclesMap[_loc18_] = [];
            _loc18_++;
         }
         ASMap = new AStarMap(gridWidth,gridHeight);
         miniMapBitmap = new Bitmap(new BitmapData(gridWidth + 2,gridHeight + 2,true,0));
         _loc18_ = 0;
         while(_loc18_ < gridWidth + 2)
         {
            miniMapBitmap.bitmapData.setPixel32(_loc18_,0,miniMapBorderColor);
            miniMapBitmap.bitmapData.setPixel32(_loc18_,gridHeight + 1,miniMapBorderColor);
            _loc18_++;
         }
         _loc18_ = 0;
         while(_loc18_ < gridHeight + 2)
         {
            miniMapBitmap.bitmapData.setPixel32(0,_loc18_,miniMapBorderColor);
            miniMapBitmap.bitmapData.setPixel32(gridWidth + 1,_loc18_,miniMapBorderColor);
            _loc18_++;
         }
         miniMapBitmap.rotation = inclination;
         var _loc20_:Sprite = new Sprite();
         _loc20_.scaleY = verticalCompression;
         _loc20_.addChild(miniMapBitmap);
         interfaceData.miniMap.addChild(_loc20_);
         interfaceData.miniMapFrame.bitmapData = new BitmapData(screenWidth / squareWidth + 1,screenHeight / squareHeight + 1,true,0);
         _loc18_ = 0;
         while(_loc18_ <= screenWidth / squareWidth)
         {
            interfaceData.miniMapFrame.bitmapData.setPixel32(_loc18_,0,miniMapFrameColor);
            interfaceData.miniMapFrame.bitmapData.setPixel32(_loc18_,screenHeight / squareHeight,miniMapFrameColor);
            _loc18_++;
         }
         _loc18_ = 1;
         while(_loc18_ < screenHeight / squareHeight)
         {
            interfaceData.miniMapFrame.bitmapData.setPixel32(0,_loc18_,miniMapFrameColor);
            interfaceData.miniMapFrame.bitmapData.setPixel32(screenWidth / squareWidth,_loc18_,miniMapFrameColor);
            _loc18_++;
         }
         interfaceData.miniMap.addChild(interfaceData.miniMapFrame);
         Characters = [];
         Groups = [];
         GroupCaravans = [];
         GroupBands = [];
         ActList = [];
         nowActing = -1;
         waitScreen = new Sprite();
         waitScreen.graphics.beginFill(0);
         waitScreen.graphics.moveTo(0,0);
         waitScreen.graphics.lineTo(screenWidth,0);
         waitScreen.graphics.lineTo(screenWidth,screenHeight);
         waitScreen.graphics.lineTo(0,screenHeight);
         waitScreen.graphics.endFill();
         waitText = new EngineText(Texts.fetch(770).toUpperCase(),8947848,18,"center",0,0,screenWidth,20);
         waitText.y = screenHeight / 2 - waitText.textHeight / 2;
         waitScreen.addChild(waitText);
         addChild(waitScreen);
         addEventListener("enterFrame",EF,false,0,false);
         addEventListener("addedToStage",createStageEvents,false,0,false);
         if(obstacles == null)
         {
            generateRandomObstacles();
         }
         else
         {
            for(_loc18_ in obstacles)
            {
               if(Obstacle.Data[obstacles[_loc18_].type].elevation > 1)
               {
                  for(_loc19_ in Obstacle.Data[obstacles[_loc18_].type].fillSquares)
                  {
                     _loc15_ = obstacles[_loc18_].x + Obstacle.Data[obstacles[_loc18_].type].fillSquares[_loc19_].x;
                     _loc16_ = obstacles[_loc18_].y + Obstacle.Data[obstacles[_loc18_].type].fillSquares[_loc19_].y;
                     ASMap.Map[_loc15_][_loc16_] = 1;
                  }
               }
            }
         }
      }
      
      public function createStageEvents(param1:*) : *
      {
         stage.addEventListener("mouseLeave",mLeave,false,0,false);
         stage.addEventListener("deactivate",mLeave,false,0,false);
         stage.addEventListener("focusOut",mLeave,false,0,false);
         stage.addEventListener("mouseMove",mMove,false,0,false);
         stage.addEventListener("mouseDown",mDown,false,0,false);
         stage.addEventListener("mouseUp",mUp,false,0,false);
         stage.addEventListener("keyDown",keyPressed,false,0,false);
         stage.addEventListener("keyUp",keyReleased,false,0,false);
         stage.stageFocusRect = false;
         stage.focus = stage;
      }
      
      public function Init() : *
      {
         var _loc7_:* = undefined;
         var _loc19_:* = undefined;
         var _loc10_:* = undefined;
         var _loc6_:* = undefined;
         var _loc13_:* = undefined;
         var _loc8_:* = undefined;
         var _loc21_:* = undefined;
         var _loc18_:* = undefined;
         var _loc5_:* = undefined;
         flyingProjectiles = [];
         activeExplosions = [];
         flyingGrenades = [];
         RocketImage = new ImportedBitmap("Rocket.png").bitmapData;
         RocketShadow = new ImportedBitmap("RocketShadow.png").bitmapData;
         paused = false;
         flamethrowerFlameBitmaps = [];
         _loc6_ = 1;
         while(_loc6_ <= 46)
         {
            flamethrowerFlameBitmaps[_loc6_] = AnimationData.getSprite("FlamethrowerFlame",0,0,_loc6_);
            _loc6_++;
         }
         flamethrowerFlames = [];
         var _loc11_:* = ColorFunctions.num2rgb(marksColor);
         var _loc14_:* = ColorFunctions.visualBrightness(_loc11_.r,_loc11_.g,_loc11_.b);
         if(_loc14_ >= 128)
         {
            textColor = 0;
         }
         else
         {
            textColor = 16777215;
         }
         viewSpeedX = 0;
         viewSpeedY = 0;
         leftViewLimit = Infinity;
         topViewLimit = Infinity;
         rightViewLimit = 0 - Infinity;
         bottomViewLimit = 0 - Infinity;
         var _loc23_:Array = [[0,0],[gridWidth * squareWidth,0],[gridWidth * squareWidth,gridHeight * squareHeight],[0,gridHeight * squareHeight]];
         for(_loc6_ in _loc23_)
         {
            _loc19_ = map2Screen(_loc23_[_loc6_][0],_loc23_[_loc6_][1]);
            if(_loc19_.x < leftViewLimit)
            {
               leftViewLimit = _loc19_.x;
            }
            if(_loc19_.y < topViewLimit)
            {
               topViewLimit = _loc19_.y;
            }
            if(_loc19_.x > rightViewLimit)
            {
               rightViewLimit = _loc19_.x;
            }
            if(_loc19_.y > bottomViewLimit)
            {
               bottomViewLimit = _loc19_.y;
            }
         }
         leftViewLimit -= screenWidth / 2;
         rightViewLimit += screenWidth / 2;
         topViewLimit -= screenHeight / 2;
         bottomViewLimit += screenHeight / 2;
         cursors = [];
         cursors[6] = new CursorGroundTarget();
         MobilePart = new Sprite();
         Mask = new Sprite();
         UnderGrid = new Sprite();
         UnderGrid.cacheAsBitmap = true;
         GroundMarks = new Sprite();
         GroundMarks.cacheAsBitmap = true;
         Grid = new Sprite();
         Grid.cacheAsBitmap = true;
         Grid.visible = showGrid;
         Interlacing = new Sprite();
         Shadows = new Sprite();
         TopMarks = new Sprite();
         TopMarks.cacheAsBitmap = true;
         OverGrid = new Sprite();
         OverGrid.cacheAsBitmap = true;
         MobilePart.addChildAt(UnderGrid,0);
         MobilePart.addChildAt(GroundMarks,1);
         MobilePart.addChildAt(Grid,2);
         MobilePart.addChildAt(cursors[6],3);
         MobilePart.addChildAt(Shadows,4);
         MobilePart.addChildAt(OverGrid,5);
         MobilePart.addChildAt(Interlacing,6);
         MobilePart.addChildAt(TopMarks,7);
         Grid.graphics.lineStyle(1,0,0.1);
         _loc10_ = gridHeight * squareHeight;
         Obstacles = [];
         if(!(ObstacleSegmentDirections is Array))
         {
            ObstacleSegmentDirections = [];
         }
         for(_loc6_ in Obstacle.Data)
         {
            if(Obstacle.Data[_loc6_] is Object)
            {
               if(!(ObstacleSegmentDirections[_loc6_] is Array))
               {
                  ObstacleSegmentDirections[_loc6_] = [];
                  _loc13_ = 0;
                  for(_loc7_ in Obstacle.Data[_loc6_].segments)
                  {
                     if(_loc7_ == Obstacle.Data[_loc6_].segments.length - 1 || Obstacle.Data[_loc6_].segments[_loc7_].end)
                     {
                        _loc8_ = _loc13_;
                     }
                     else
                     {
                        _loc8_ = _loc7_ + 1;
                     }
                     if(Obstacle.Data[_loc6_].segments[_loc7_].end)
                     {
                        _loc13_ = _loc7_ + 1;
                     }
                     _loc21_ = MathFunctions.CalcAngle(Obstacle.Data[_loc6_].segments[_loc7_].x,Obstacle.Data[_loc6_].segments[_loc7_].y,Obstacle.Data[_loc6_].segments[_loc8_].x,Obstacle.Data[_loc6_].segments[_loc8_].y);
                     ObstacleSegmentDirections[_loc6_][_loc7_] = _loc21_ <= 3.141592653589793 * 0.25 || _loc21_ >= 3.141592653589793 * 1.25;
                  }
               }
            }
         }
         _loc6_ = 0;
         while(_loc6_ <= gridWidth)
         {
            _loc19_ = map2Screen(_loc6_ * squareWidth,0);
            Grid.graphics.moveTo(_loc19_.x,_loc19_.y);
            _loc19_ = map2Screen(_loc6_ * squareWidth,_loc10_);
            Grid.graphics.lineTo(_loc19_.x,_loc19_.y);
            _loc6_++;
         }
         _loc10_ = gridWidth * squareWidth;
         _loc6_ = 0;
         while(_loc6_ <= gridHeight)
         {
            _loc19_ = map2Screen(0,_loc6_ * squareHeight);
            Grid.graphics.moveTo(_loc19_.x,_loc19_.y);
            _loc19_ = map2Screen(_loc10_,_loc6_ * squareHeight);
            Grid.graphics.lineTo(_loc19_.x,_loc19_.y);
            _loc6_++;
         }
         Mask.graphics.beginFill(16777215);
         Mask.graphics.drawRect(0,0,screenWidth,screenHeight);
         Floor = new Sprite();
         var _loc2_:Number = Math.ceil(screenWidth / 450) + 1;
         var _loc1_:Number = Math.ceil(screenHeight / 260) + 1;
         var _loc12_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc2_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc1_)
            {
               _loc12_[_loc6_ + _loc7_ * _loc1_] = new ImportedBitmap("Ground1.png");
               _loc12_[_loc6_ + _loc7_ * _loc1_].x = _loc6_ * 450;
               _loc12_[_loc6_ + _loc7_ * _loc1_].y = _loc7_ * 260;
               Floor.addChild(_loc12_[_loc6_ + _loc7_ * _loc1_]);
               _loc7_++;
            }
            _loc6_++;
         }
         this.addChild(Floor);
         this.addChild(MobilePart);
         this.addChild(Mask);
         this.mask = Mask;
         centerViewOn(gridWidth * squareWidth / 2,gridHeight * squareHeight / 2,true);
         groundMarksShapes[6] = [];
         _loc6_ = 0;
         while(_loc6_ < 5)
         {
            _loc21_ = _loc6_ * 3.141592653589793 / 2.5;
            groundMarksShapes[6][_loc6_ * 2] = [0.5 + Math.sin(_loc21_) * 0.4,0.5 - Math.cos(_loc21_) * 0.4];
            _loc21_ = (_loc6_ + 0.5) * 3.141592653589793 / 2.5;
            groundMarksShapes[6][_loc6_ * 2 + 1] = [0.5 + Math.sin(_loc21_) * 0.2,0.5 - Math.cos(_loc21_) * 0.2];
            _loc6_++;
         }
         groundMarksShapes[6][10] = [0,0];
         groundMarksShapes[6][11] = [1,0];
         groundMarksShapes[6][12] = [1,1];
         groundMarksShapes[6][13] = [0,1];
         groundMarksShapes[6][14] = [0,0];
         groundMarksShapes[6][15] = [groundMarksShapes[6][9][0],groundMarksShapes[6][9][1]];
         groundMarksShapes[7] = [];
         _loc6_ = 0;
         while(_loc6_ < 6)
         {
            _loc21_ = _loc6_ * 3.141592653589793 / 3;
            groundMarksShapes[7][_loc6_] = [0.5 + Math.sin(_loc21_) * 0.5,0.5 - Math.cos(_loc21_) * 0.5];
            _loc6_++;
         }
         groundMarksBitmaps = [];
         var _loc17_:* = Infinity;
         var _loc15_:* = Infinity;
         var _loc4_:* = -Infinity;
         var _loc3_:* = -Infinity;
         _loc23_ = [[0,0],[squareWidth,0],[squareWidth,squareHeight],[0,squareHeight]];
         for(_loc6_ in _loc23_)
         {
            _loc19_ = map2Screen(_loc23_[_loc6_][0],_loc23_[_loc6_][1]);
            if(_loc19_.x < _loc17_)
            {
               _loc17_ = _loc19_.x;
            }
            if(_loc19_.y < _loc15_)
            {
               _loc15_ = _loc19_.y;
            }
            if(_loc19_.x > _loc4_)
            {
               _loc4_ = _loc19_.x;
            }
            if(_loc19_.y > _loc3_)
            {
               _loc3_ = _loc19_.y;
            }
         }
         squareBoxShiftX = _loc17_;
         squareBoxShiftY = _loc15_;
         selectedGlow = new GlowFilter(marksColor,1,0,0,100,1,false,false);
         for(_loc6_ in groundMarksShapes)
         {
            _loc18_ = new Sprite();
            _loc18_.graphics.beginFill(marksColor,0.5);
            for(_loc7_ in groundMarksShapes[_loc6_])
            {
               _loc19_ = map2Screen(groundMarksShapes[_loc6_][_loc7_][0] * squareWidth,groundMarksShapes[_loc6_][_loc7_][1] * squareHeight);
               if(_loc7_ == 0)
               {
                  _loc18_.graphics.moveTo(_loc19_.x,_loc19_.y);
               }
               else
               {
                  _loc18_.graphics.lineTo(_loc19_.x,_loc19_.y);
               }
            }
            _loc18_.graphics.endFill();
            groundMarksBitmaps[_loc6_] = new BitmapData(_loc4_ - _loc17_,_loc3_ - _loc15_,true,0);
            groundMarksBitmaps[_loc6_].draw(_loc18_,new Matrix(1,0,0,1,0 - _loc17_,0 - _loc15_));
         }
         selectedMark = new Bitmap(groundMarksBitmaps[7]);
         GroundMarks.addChild(selectedMark);
         cursors[1] = new CursorHand();
         cursors[2] = new CursorTarget();
         cursors[3] = new CursorFeet();
         cursors[4] = new CursorUnavailable();
         cursors[5] = new CursorHeal();
         _loc6_ = 1;
         while(_loc6_ < cursors.length)
         {
            cursors[_loc6_].cacheAsBitmap = true;
            cursors[_loc6_].visible = false;
            if(_loc6_ != 6)
            {
               addChild(cursors[_loc6_]);
            }
            _loc6_++;
         }
         cursorTextContainer = new Sprite();
         cursorTextBG = new Sprite();
         cursorTextContainer.addChild(cursorTextBG);
         cursorText = new EngineText("",0,12,"center",5,3);
         cursorTextContainer.addChild(cursorText);
         cursorTextContainer.visible = false;
         addChild(cursorTextContainer);
         Float = new Sprite();
         Float.cacheAsBitmap = true;
         Float.graphics.beginFill(marksColor,0.8);
         Float.graphics.moveTo(-5,-8);
         Float.graphics.lineTo(5,-8);
         Float.graphics.lineTo(0,0);
         Float.graphics.endFill();
         TopMarks.addChild(Float);
         var _loc22_:* = MathFunctions.random(gridWidth * gridHeight / 40,gridWidth * gridHeight / 20);
         var _loc20_:Array = [];
         _loc6_ = 1;
         while(_loc6_ <= _loc22_)
         {
            _loc20_.push({
               "type":MathFunctions.random(1,AnimationData.spriteBoundaries["UnderGrid"].length - 1),
               "x":MathFunctions.random(0,gridWidth * squareWidth),
               "y":MathFunctions.random(0,gridHeight * squareHeight)
            });
            _loc6_++;
         }
         _loc20_.sortOn(["x","y"],16);
         _loc6_ = 0;
         while(_loc6_ < _loc20_.length)
         {
            _loc5_ = new Bitmap(AnimationData.getSprite("UnderGrid",_loc20_[_loc6_].type,0,1));
            _loc19_ = map2Screen(_loc20_[_loc6_].x,_loc20_[_loc6_].y);
            _loc5_.x = _loc19_.x - _loc5_.bitmapData.width / 2;
            _loc5_.y = _loc19_.y - _loc5_.bitmapData.height / 2;
            UnderGrid.addChild(_loc5_);
            _loc6_++;
         }
         var _loc16_:Number = Math.ceil((rightViewLimit - leftViewLimit) / 1000);
         var _loc9_:Number = Math.ceil((bottomViewLimit - topViewLimit) / 1000);
         BloodBitmaps = [];
         _loc6_ = 0;
         while(_loc6_ < _loc16_)
         {
            BloodBitmaps[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc16_)
            {
               BloodBitmaps[_loc6_][_loc7_] = new Bitmap(new BitmapData(1000,1000,true,0));
               BloodBitmaps[_loc6_][_loc7_].x = leftViewLimit + _loc6_ * 1000;
               BloodBitmaps[_loc6_][_loc7_].y = topViewLimit + _loc7_ * 1000;
               UnderGrid.addChild(BloodBitmaps[_loc6_][_loc7_]);
               _loc7_++;
            }
            _loc6_++;
         }
         mMove(null);
      }
      
      public function keyPressed(param1:*) : *
      {
         switch(param1.keyCode)
         {
            case 16:
               shiftPressed = true;
               break;
            case 90:
            case 17:
               ctrlPressed = true;
         }
         if(paused || preRendering)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case 13:
            case 9:
            case 78:
               pressButton("next turn");
               break;
            case 65:
            case 37:
               leftPressed = true;
               break;
            case 68:
            case 39:
               rightPressed = true;
               break;
            case 87:
            case 38:
               upPressed = true;
               break;
            case 83:
            case 40:
               downPressed = true;
               break;
            case 82:
               pressButton("reload");
               break;
            case 84:
               pressButton("prev ammo type");
               break;
            case 89:
               pressButton("next ammo type");
               break;
            case 70:
               pressButton("switch weapon");
               break;
            case 71:
               pressButton("prev weapon mode");
               break;
            case 72:
               pressButton("next weapon mode");
               break;
            case 67:
               pressButton("switch healing mode");
               break;
            case 86:
               pressButton("prev firs aid");
               break;
            case 66:
               pressButton("next first aid");
               break;
            case 73:
               pressButton("drop weapon");
               break;
            case 85:
               pressButton("unload weapon");
               break;
            case 74:
               pressButton("pick up weapon");
               break;
            case 75:
               pressButton("next pick up pos");
               break;
            case 76:
               pressButton("prev pick up pos");
               break;
            case 77:
            case 32:
               centerViewOn(ActList[nowActing].x,ActList[nowActing].y,false);
               break;
            case 69:
               pressButton("center on enemy");
         }
      }
      
      public function pressButton(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(ActList[nowActing] is Character && inControl())
         {
            switch(param1)
            {
               case "switch weapon":
                  switchWeapon();
                  break;
               case "prev weapon mode":
                  prevWeaponMode();
                  break;
               case "next weapon mode":
                  nextWeaponMode();
                  break;
               case "reload":
                  if(reload())
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXReload().play();
                     }
                  }
                  else if(GameData.soundFXOn)
                  {
                     new SFXError().play();
                  }
                  break;
               case "unload weapon":
                  if(unloadWeapon())
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXUnload().play();
                     }
                  }
                  break;
               case "drop weapon":
                  if(dropWeapon())
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXDropWeapon().play();
                     }
                  }
                  break;
               case "switch healing mode":
                  switchHealingMode();
                  break;
               case "pick up weapon":
                  pickUpWeapon();
                  break;
               case "next pick up pos":
                  changeCurrPickUpPos(1);
                  break;
               case "prev pick up pos":
                  changeCurrPickUpPos(-1);
                  break;
               case "prev first aid":
                  prevFirstAid();
                  break;
               case "next first aid":
                  nextFirstAid();
                  break;
               case "prev ammo type":
                  prevAmmoType();
                  break;
               case "next ammo type":
                  nextAmmoType();
                  break;
               case "next turn":
                  nextTurn();
                  break;
               case "center on enemy":
                  _loc3_ = [];
                  for(_loc2_ in ActList)
                  {
                     if(ActList[_loc2_].band == 2 && ActList[_loc2_].health > 0)
                     {
                        _loc3_.push({
                           "person":ActList[_loc2_],
                           "distance":MathFunctions.CalcDistance(ActList[_loc2_].x,ActList[_loc2_].y,ActList[nowActing].x,ActList[nowActing].y)
                        });
                     }
                  }
                  if(_loc3_.length > 0)
                  {
                     _loc3_.sortOn("distance",16);
                     if(centerOnEnemyIndex >= _loc3_.length)
                     {
                        centerOnEnemyIndex = 0;
                     }
                     centerViewOn(_loc3_[centerOnEnemyIndex].person.x,_loc3_[centerOnEnemyIndex].person.y,false);
                     centerOnEnemyIndex = Number(centerOnEnemyIndex) + 1;
                  }
            }
         }
      }
      
      public function keyReleased(param1:*) : *
      {
         switch(param1.keyCode)
         {
            case 16:
               shiftPressed = false;
               break;
            case 90:
            case 17:
               ctrlPressed = false;
               break;
            case 65:
            case 37:
               leftPressed = false;
               break;
            case 68:
            case 39:
               rightPressed = false;
               break;
            case 87:
            case 38:
               upPressed = false;
               break;
            case 83:
            case 40:
               downPressed = false;
         }
      }
      
      public function mDown(param1:*) : *
      {
         mousePressed = true;
      }
      
      public function mUp(param1:*) : *
      {
         mousePressed = false;
      }
      
      public function mMove(param1:*) : *
      {
         mouseOnScreen = mouseX >= 0 && mouseX < screenWidth && mouseY >= 0 && mouseY < screenHeight;
      }
      
      public function mLeave(param1:*) : *
      {
         mouseOnScreen = false;
         shiftPressed = false;
         ctrlPressed = false;
      }
      
      public function centerViewOn(param1:*, param2:*, param3:* = false) : *
      {
         var _loc4_:* = undefined;
         _loc4_ = map2Screen(param1,param2);
         if(param3)
         {
            viewTargetX = MobilePart.x = 0 - _loc4_.x + screenWidth / 2;
            viewTargetY = MobilePart.y = 0 - _loc4_.y + screenHeight / 2;
         }
         else
         {
            viewTargetX = 0 - _loc4_.x + screenWidth / 2;
            viewTargetY = 0 - _loc4_.y + screenHeight / 2;
         }
      }
      
      public function map2Screen(param1:*, param2:*) : *
      {
         return {
            "x":0 - xRel * param2 + xRel * param1,
            "y":yRel * param2 + yRel * param1
         };
      }
      
      public function screen2Map(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         _loc3_ = param2 / (2 * yRel) - param1 / (2 * xRel);
         _loc4_ = param1 / xRel + _loc3_;
         return {
            "x":_loc4_,
            "y":_loc3_
         };
      }
      
      public function addCharacter(param1:Character, param2:*, param3:*, param4:*) : *
      {
         var _loc5_:Number = Characters.push(param1) - 1;
         Characters[_loc5_].lastSlot = null;
         Characters[_loc5_].lastDirection = null;
         Characters[_loc5_].lastAnimationPhase = null;
         Characters[_loc5_].lastFrame = null;
         Characters[_loc5_].lastAnimationType = null;
         Characters[_loc5_].squareX = Math.round(param2);
         Characters[_loc5_].squareY = Math.round(param3);
         ASMap.Map[param2][param3] = 1;
         drawCharacterOnMiniMap(Characters[_loc5_]);
         CharactersMap[param2][param3] = Characters[_loc5_];
         Characters[_loc5_].x = (param2 + 0.5) * squareWidth;
         Characters[_loc5_].y = (param3 + 0.5) * squareHeight;
         Characters[_loc5_].direction = param4;
         Characters[_loc5_].applyPhaseAndFrame = null;
         Characters[_loc5_].currFrame = 1;
         Characters[_loc5_].animationPhase = 0;
         Characters[_loc5_].currSlot = 0;
         Characters[_loc5_].reload(0);
         Characters[_loc5_].reload(1);
         Characters[_loc5_].updateFirstAid();
      }
      
      public function addGroup(param1:*, param2:* = 2, param3:* = 0, param4:* = null, param5:* = null) : *
      {
         var _loc20_:* = undefined;
         var _loc25_:* = undefined;
         var _loc22_:* = undefined;
         var _loc23_:* = undefined;
         var _loc15_:* = undefined;
         var _loc31_:* = undefined;
         var _loc29_:* = undefined;
         var _loc21_:* = undefined;
         var _loc13_:* = undefined;
         var _loc16_:* = undefined;
         var _loc32_:* = undefined;
         var _loc30_:* = undefined;
         var _loc10_:* = undefined;
         var _loc12_:* = undefined;
         var _loc27_:* = undefined;
         var _loc24_:* = undefined;
         var _loc26_:* = undefined;
         var _loc11_:* = undefined;
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc14_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc19_:* = undefined;
         var _loc18_:* = undefined;
         var _loc17_:* = undefined;
         if(param3 is Number)
         {
            if(param3 == 0 || param3 == 2)
            {
               _loc21_ = Math.round(gridWidth / 2 - param1.People.length);
            }
            else
            {
               _loc21_ = Math.round(gridHeight / 2 - param1.People.length);
            }
         }
         if(param5 == null)
         {
            _loc25_ = Groups.push([]) - 1;
         }
         else
         {
            if(!(Groups[param5] is Array))
            {
               Groups[param5] = [];
            }
            _loc25_ = param5;
         }
         GroupCaravans[_loc25_] = param1;
         GroupBands[_loc25_] = param2;
         var _loc28_:Array = [];
         for(_loc22_ in param1.Transport)
         {
            if(param1.Transport[_loc22_].category != 2 || !(param1.Transport[_loc22_].attachedTo is TransportUnit))
            {
               _loc28_.push(param1.Transport[_loc22_]);
            }
         }
         while(_loc28_.length > 30)
         {
            _loc28_.pop();
         }
         if(_loc28_.length > 0)
         {
            _loc8_ = 0;
            if(param3 is Number)
            {
               for(_loc22_ in _loc28_)
               {
                  if(param3 == 0 || param3 == 2)
                  {
                     if(param1.direction <= 3.141592653589793)
                     {
                        _loc28_[_loc22_].direction = 3;
                     }
                     else
                     {
                        _loc28_[_loc22_].direction = 1;
                     }
                     _loc8_ += _loc28_[_loc22_].widthWithCart;
                  }
                  else
                  {
                     if(param1.direction < MathFunctions.halfPI || param1.direction >= 3.141592653589793 * 0.75)
                     {
                        _loc28_[_loc22_].direction = 0;
                     }
                     else
                     {
                        _loc28_[_loc22_].direction = 2;
                     }
                     _loc8_ += _loc28_[_loc22_].heightWithCart;
                  }
               }
               _loc8_ += _loc28_.length - 1;
               if(param3 == 0 || param3 == 2)
               {
                  if(_loc28_[0].direction == 1)
                  {
                     _loc13_ = _loc21_ + Math.round(_loc8_ / 2);
                  }
                  if(_loc28_[0].direction == 3)
                  {
                     _loc13_ = _loc21_ - Math.round(_loc8_ / 2);
                  }
                  if(param3 == 0)
                  {
                     _loc16_ = 2;
                  }
                  if(param3 == 2)
                  {
                     _loc16_ = gridHeight - 3;
                  }
               }
               else
               {
                  if(_loc28_[0].direction == 2)
                  {
                     _loc16_ = _loc21_ - Math.round(_loc8_ / 2);
                  }
                  if(_loc28_[0].direction == 4)
                  {
                     _loc16_ = _loc21_ + Math.round(_loc8_ / 2);
                  }
                  if(param3 == 3)
                  {
                     _loc13_ = 2;
                  }
                  if(param3 == 1)
                  {
                     _loc13_ = gridWidth - 3;
                  }
               }
            }
            else
            {
               if(Math.abs(param3.x - gridWidth / 2) > Math.abs(param3.y - gridHeight / 2))
               {
                  if(param1.direction < MathFunctions.halfPI || param1.direction >= 3.141592653589793 * 1.5)
                  {
                     _loc19_ = 0;
                  }
                  else
                  {
                     _loc19_ = 2;
                  }
               }
               else if(param1.direction <= 3.141592653589793)
               {
                  _loc19_ = 1;
               }
               else
               {
                  _loc19_ = 3;
               }
               for(_loc22_ in param1.Transport)
               {
                  param1.Transport[_loc22_].direction = _loc19_;
               }
               for(_loc22_ in _loc28_)
               {
                  if(_loc19_ == 0 || _loc19_ == 2)
                  {
                     _loc8_ += _loc28_[_loc22_].heightWithCart;
                  }
                  else
                  {
                     _loc8_ += _loc28_[_loc22_].widthWithCart;
                  }
               }
               _loc8_ += _loc28_.length - 1;
               switch(_loc19_)
               {
                  case 0:
                     _loc13_ = param3.x;
                     _loc16_ = param3.y - Math.round(_loc8_ / 2);
                     break;
                  case 1:
                     _loc13_ = param3.x + Math.round(_loc8_ / 2);
                     _loc16_ = param3.y;
                     break;
                  case 2:
                     _loc13_ = param3.x;
                     _loc16_ = param3.y + Math.round(_loc8_ / 2);
                     break;
                  case 3:
                     _loc13_ = param3.x - Math.round(_loc8_ / 2);
                     _loc16_ = param3.y;
               }
            }
            for(_loc22_ in _loc28_)
            {
               _loc32_ = _loc13_;
               _loc30_ = _loc16_;
               if(_loc28_[_loc22_].direction == 0 || _loc28_[_loc22_].direction == 2)
               {
                  _loc32_ = _loc13_ - 0.5 + _loc28_[_loc22_].width / 2;
               }
               if(_loc28_[_loc22_].direction == 1 || _loc28_[_loc22_].direction == 3)
               {
                  _loc30_ = _loc16_ - 0.5 + _loc28_[_loc22_].height / 2;
               }
               if(_loc28_[_loc22_].direction == 0)
               {
                  _loc30_ += _loc28_[_loc22_].height - 1;
               }
               if(_loc28_[_loc22_].direction == 3)
               {
                  _loc32_ += _loc28_[_loc22_].width - 1;
               }
               _loc32_ = Math.round(_loc32_);
               _loc30_ = Math.round(_loc30_);
               if(_loc32_ < 0)
               {
                  _loc32_ = 0;
               }
               if(_loc32_ >= gridWidth)
               {
                  _loc32_ = gridWidth - 1;
               }
               if(_loc30_ < 0)
               {
                  _loc30_ = 0;
               }
               if(_loc30_ >= gridHeight)
               {
                  _loc30_ = gridHeight - 1;
               }
               _loc14_ = true;
               _loc10_ = _loc32_;
               _loc12_ = _loc30_;
               _loc27_ = 0;
               _loc24_ = 0;
               _loc26_ = 0;
               while(_loc14_)
               {
                  switch(_loc24_)
                  {
                     case 0:
                        _loc10_ = _loc32_ - _loc27_ + _loc26_;
                        _loc12_ = _loc30_ - _loc27_;
                        break;
                     case 1:
                        _loc10_ = _loc32_ + _loc27_;
                        _loc12_ = _loc30_ - _loc27_ + _loc26_;
                        break;
                     case 2:
                        _loc10_ = _loc32_ + _loc27_ - _loc26_;
                        _loc12_ = _loc30_ + _loc27_;
                        break;
                     case 3:
                        _loc10_ = _loc32_ - _loc27_;
                        _loc12_ = _loc30_ + _loc27_ - _loc26_;
                  }
                  _loc14_ = false;
                  _loc6_ = _loc10_ + 1;
                  while(_loc6_ > _loc10_ - _loc28_[_loc22_].width - 1)
                  {
                     _loc20_ = _loc12_ + 1;
                     while(_loc20_ > _loc12_ - _loc28_[_loc22_].height - 1)
                     {
                        if(_loc6_ < 0 || _loc6_ >= gridWidth || _loc20_ < 0 || _loc20_ >= gridHeight || ASMap.Map[_loc6_][_loc20_] > 0)
                        {
                           _loc14_ = true;
                           break;
                        }
                        _loc20_--;
                     }
                     if(_loc14_)
                     {
                        break;
                     }
                     _loc6_--;
                  }
                  if(!_loc14_ && _loc28_[_loc22_].cart is TransportUnit)
                  {
                     if(_loc28_[_loc22_].direction == 0 || _loc28_[_loc22_].direction == 2)
                     {
                        _loc17_ = Math.round(_loc10_ - _loc28_[_loc22_].width / 2 + 0.5 + _loc28_[_loc22_].cart.width / 2 - 0.5);
                     }
                     else
                     {
                        _loc18_ = Math.round(_loc12_ - _loc28_[_loc22_].height / 2 + 0.5 + _loc28_[_loc22_].cart.height / 2 - 0.5);
                     }
                     switch(_loc28_[_loc22_].direction)
                     {
                        case 0:
                           _loc18_ = _loc12_ + _loc28_[_loc22_].cart.height;
                           break;
                        case 1:
                           _loc17_ = _loc10_ - _loc28_[_loc22_].width;
                           break;
                        case 2:
                           _loc18_ = _loc12_ - _loc28_[_loc22_].height;
                           break;
                        case 3:
                           _loc17_ = _loc10_ + _loc28_[_loc22_].cart.width;
                     }
                     trace("trying to place the cart at " + _loc17_ + " " + _loc18_);
                     _loc6_ = _loc17_ + 1;
                     while(_loc6_ > _loc17_ - _loc28_[_loc22_].cart.width - 1)
                     {
                        _loc20_ = _loc18_ + 1;
                        while(_loc20_ > _loc18_ - _loc28_[_loc22_].cart.height - 1)
                        {
                           if(_loc6_ < 0 || _loc6_ >= gridWidth || _loc20_ < 0 || _loc20_ >= gridHeight || ASMap.Map[_loc6_][_loc20_] > 0)
                           {
                              _loc14_ = true;
                              break;
                           }
                           _loc20_--;
                        }
                        if(_loc14_)
                        {
                           break;
                        }
                        _loc6_--;
                     }
                     if(!_loc14_)
                     {
                        trace("successfully");
                        _loc28_[_loc22_].cart.squareX = _loc17_;
                        _loc28_[_loc22_].cart.squareY = _loc18_;
                     }
                  }
                  if(!_loc14_)
                  {
                     break;
                  }
                  var _temp_20:* = Number(_loc26_) + 1;
                  _loc26_++;
                  if(_temp_20 >= _loc27_ * 2)
                  {
                     _loc26_ = 0;
                     _loc24_++;
                     if(_loc27_ == 0 || _loc24_ > 3)
                     {
                        _loc24_ = 0;
                        var _temp_22:* = Number(_loc27_) + 1;
                        _loc27_++;
                        if(_temp_22 > Math.max(gridWidth,gridHeight))
                        {
                           break;
                        }
                     }
                  }
               }
               if(!_loc14_)
               {
                  trace("adding transport at: " + _loc10_ + " " + _loc12_ + " direction: " + _loc28_[_loc22_].direction);
                  placeTransport(_loc28_[_loc22_],_loc10_,_loc12_);
                  if(_loc28_[_loc22_].cart is TransportUnit)
                  {
                     placeTransport(_loc28_[_loc22_].cart,_loc28_[_loc22_].cart.squareX,_loc28_[_loc22_].cart.squareY);
                  }
               }
               switch(_loc28_[_loc22_].direction)
               {
                  case 0:
                     _loc16_ += _loc28_[_loc22_].heightWithCart + 1;
                     break;
                  case 1:
                     _loc13_ -= _loc28_[_loc22_].widthWithCart + 1;
                     break;
                  case 2:
                     _loc16_ -= _loc28_[_loc22_].heightWithCart + 1;
                     break;
                  case 3:
                     _loc13_ += _loc28_[_loc22_].widthWithCart + 1;
               }
            }
         }
         for(_loc22_ in param1.People)
         {
            _loc15_ = Groups[_loc25_].push(param1.People[_loc22_]) - 1;
            if(param1.People[_loc22_].category > 2 && param1.People[_loc22_].category != 5)
            {
               param1.People[_loc22_].band = 3;
            }
            else
            {
               param1.People[_loc22_].band = param2;
            }
            if(_loc25_ == 0)
            {
               yourPeople = Number(yourPeople) + 1;
            }
            else if(param1.People[_loc22_].band == 1)
            {
               allies = Number(allies) + 1;
            }
            else if(param1.People[_loc22_].band == 2)
            {
               enemies = Number(enemies) + 1;
            }
            Groups[_loc25_][_loc15_].group = _loc25_;
            if(param3 is Number)
            {
               if(param3 == 0)
               {
                  _loc32_ = _loc21_ + _loc22_ * 2;
                  _loc30_ = 4;
               }
               if(param3 == 1)
               {
                  _loc32_ = gridWidth - 5;
                  _loc30_ = _loc21_ + _loc22_ * 2;
               }
               if(param3 == 2)
               {
                  _loc32_ = _loc21_ + _loc22_ * 2;
                  _loc30_ = gridHeight - 5;
               }
               if(param3 == 3)
               {
                  _loc32_ = 4;
                  _loc30_ = _loc21_ + _loc22_ * 2;
               }
            }
            else
            {
               _loc32_ = Math.round(param3.x);
               _loc30_ = Math.round(param3.y);
            }
            _loc27_ = 1;
            _loc26_ = 0;
            _loc24_ = 0;
            _loc10_ = _loc32_;
            _loc12_ = _loc30_;
            while(surroundingsBlocked(_loc10_,_loc12_))
            {
               if(_loc24_ == 0)
               {
                  _loc10_ = _loc32_ + _loc26_;
                  _loc12_ = _loc30_ - _loc27_;
               }
               if(_loc24_ == 1)
               {
                  _loc10_ = _loc32_ + _loc27_;
                  _loc12_ = _loc30_ + _loc26_;
               }
               if(_loc24_ == 2)
               {
                  _loc10_ = _loc32_ - _loc26_;
                  _loc12_ = _loc30_ + _loc27_;
               }
               if(_loc24_ == 3)
               {
                  _loc10_ = _loc32_ - _loc27_;
                  _loc12_ = _loc30_ - _loc26_;
               }
               var _temp_27:* = Number(_loc26_) + 1;
               _loc26_++;
               if(_temp_27 > _loc27_)
               {
                  var _temp_28:* = Number(_loc24_) + 1;
                  _loc24_++;
                  if(_temp_28 > 3)
                  {
                     var _temp_29:* = Number(_loc27_) + 1;
                     _loc27_++;
                     if(_temp_29 >= gridWidth && _loc27_ >= gridHeight)
                     {
                        break;
                     }
                     _loc24_ = 0;
                  }
                  _loc26_ = 0 - _loc27_ + 1;
               }
            }
            _loc7_ = _loc10_ - gridWidth / 2;
            _loc9_ = _loc12_ - gridHeight / 2;
            if(Math.abs(_loc7_) > Math.abs(_loc9_))
            {
               if(_loc7_ > 0)
               {
                  _loc11_ = 3;
               }
               else
               {
                  _loc11_ = 1;
               }
            }
            else if(_loc9_ > 0)
            {
               _loc11_ = 0;
            }
            else
            {
               _loc11_ = 2;
            }
            addCharacter(Groups[_loc25_][_loc15_],_loc10_,_loc12_,_loc11_);
            ActList.push(Groups[_loc25_][_loc15_]);
         }
         ActList.sortOn("maxAP",18);
      }
      
      internal function surroundingsBlocked(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         _loc4_ = -1;
         while(_loc4_ <= 1)
         {
            _loc3_ = -1;
            while(_loc3_ <= 1)
            {
               _loc5_ = param1 + _loc4_;
               _loc6_ = param2 + _loc3_;
               if(_loc5_ < 0 || _loc5_ >= gridWidth || _loc6_ < 0 || _loc6_ >= gridWidth || ASMap.Map[_loc5_][_loc6_])
               {
                  return true;
               }
               _loc3_++;
            }
            _loc4_++;
         }
         return false;
      }
      
      internal function placeTransport(param1:*, param2:*, param3:*) : *
      {
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         var _loc9_:* = undefined;
         var _loc8_:* = undefined;
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         param1.prevFrame = null;
         _loc5_ = param2;
         while(_loc5_ > param2 - param1.width)
         {
            _loc4_ = param3;
            while(_loc4_ > param3 - param1.height)
            {
               ASMap.Map[_loc5_][_loc4_] = 1;
               ObstaclesMap[_loc5_][_loc4_] = param1;
               miniMapBitmap.bitmapData.setPixel32(_loc5_ + 1,_loc4_ + 1,miniMapObstaclesColor);
               _loc4_--;
            }
            _loc5_--;
         }
         _loc6_ = new BitmapData(param1.imageWidth,param1.imageHeight,true,0);
         param1.squareX = param2;
         param1.squareY = param3;
         param1.x = (param2 + 0.5) * squareWidth;
         param1.y = (param3 + 0.5) * squareHeight;
         param1.ownContainer = new Bitmap(_loc6_);
         if(param1.direction == 1 || param1.direction == 3)
         {
            _loc7_ = Math.ceil(param3 - param1.height / 2);
            if(param1.direction == 1)
            {
               _loc8_ = param2;
            }
            else
            {
               _loc8_ = param2 - param1.width + 1;
            }
         }
         else
         {
            _loc8_ = Math.ceil(param2 - param1.width / 2);
            if(param1.direction == 2)
            {
               _loc7_ = param3;
            }
            else
            {
               _loc7_ = param3 - param1.height + 1;
            }
         }
         _loc9_ = map2Screen((_loc8_ + 0.5) * squareWidth,(_loc7_ + 0.5) * squareHeight);
         param1.ownContainer.x = _loc9_.x - param1.imageWidth * 0.5;
         param1.ownContainer.y = _loc9_.y - param1.imageHeight * 0.5 - 20 + param1.yCorrection;
         _loc6_ = new BitmapData(param1.imageWidth,param1.imageHeight,true,0);
         param1.Shadow = new Bitmap(_loc6_);
         param1.Shadow.x = param1.ownContainer.x;
         param1.Shadow.y = param1.ownContainer.y;
         if(param1.category == 1 && param1.cart is TransportUnit)
         {
            param1.frame = 30;
         }
         else
         {
            param1.frame = 1;
         }
         Transport.push(param1);
      }
      
      public function EF(param1:*) : *
      {
         var _loc49_:* = undefined;
         var _loc26_:* = undefined;
         var _loc101_:* = undefined;
         var _loc48_:* = undefined;
         var _loc89_:* = undefined;
         var _loc98_:* = undefined;
         var _loc77_:* = undefined;
         var _loc68_:* = undefined;
         var _loc100_:* = undefined;
         var _loc44_:* = undefined;
         var _loc92_:* = undefined;
         _loc44_ = undefined;
         var _loc35_:* = undefined;
         var _loc14_:* = undefined;
         _loc92_ = undefined;
         var _loc37_:* = undefined;
         var _loc36_:* = undefined;
         var _loc17_:* = undefined;
         var _loc23_:* = undefined;
         var _loc63_:* = undefined;
         var _loc7_:* = undefined;
         var _loc30_:* = undefined;
         var _loc85_:* = undefined;
         var _loc84_:* = undefined;
         var _loc83_:* = undefined;
         var _loc56_:* = undefined;
         var _loc2_:* = undefined;
         var _loc15_:* = undefined;
         var _loc62_:* = undefined;
         var _loc103_:* = undefined;
         var _loc97_:Sound = null;
         var _loc81_:Class = null;
         var _loc27_:* = undefined;
         var _loc43_:* = undefined;
         var _loc51_:* = undefined;
         var _loc80_:* = undefined;
         var _loc13_:* = undefined;
         var _loc12_:* = undefined;
         var _loc6_:* = undefined;
         var _loc72_:* = undefined;
         var _loc61_:* = undefined;
         var _loc65_:* = undefined;
         var _loc99_:* = undefined;
         var _loc52_:* = undefined;
         var _loc50_:* = undefined;
         var _loc71_:* = undefined;
         var _loc19_:* = undefined;
         var _loc40_:* = undefined;
         var _loc86_:* = undefined;
         var _loc79_:* = undefined;
         var _loc33_:* = undefined;
         var _loc34_:* = undefined;
         var _loc11_:* = undefined;
         _loc35_ = undefined;
         var _loc42_:* = undefined;
         var _loc74_:* = undefined;
         var _loc93_:* = undefined;
         var _loc94_:* = undefined;
         var _loc39_:* = undefined;
         var _loc64_:* = undefined;
         var _loc8_:* = undefined;
         var _loc46_:* = undefined;
         var _loc3_:* = undefined;
         var _loc59_:* = undefined;
         var _loc47_:* = undefined;
         _loc44_ = undefined;
         var _loc82_:* = undefined;
         var _loc28_:* = undefined;
         var _loc55_:* = undefined;
         var _loc10_:* = undefined;
         var _loc21_:* = undefined;
         var _loc22_:* = undefined;
         var _loc69_:* = undefined;
         var _loc95_:* = undefined;
         var _loc60_:* = undefined;
         var _loc31_:* = undefined;
         var _loc76_:* = undefined;
         var _loc75_:* = undefined;
         var _loc29_:* = undefined;
         var _loc87_:* = undefined;
         var _loc66_:* = undefined;
         var _loc91_:* = undefined;
         var _loc78_:* = undefined;
         var _loc4_:* = undefined;
         var _loc57_:* = undefined;
         var _loc90_:* = undefined;
         var _loc32_:* = undefined;
         var _loc25_:* = undefined;
         var _loc102_:* = undefined;
         var _loc9_:* = undefined;
         var _loc54_:* = undefined;
         var _loc70_:* = undefined;
         var _loc24_:* = undefined;
         var _loc41_:* = undefined;
         var _loc18_:* = undefined;
         var _loc96_:* = undefined;
         var _loc58_:* = undefined;
         var _loc20_:* = undefined;
         var _loc73_:* = undefined;
         var _loc53_:* = undefined;
         var _loc5_:* = undefined;
         if(paused)
         {
            return false;
         }
         var _loc88_:Boolean = false;
         if(!(stage is Stage) || gameEnded)
         {
            return false;
         }
         if(preRendering)
         {
            if(frameCount == 2)
            {
               Init();
               setChildIndex(waitScreen,numChildren - 1);
               renderIndex = 0;
            }
            if(frameCount == 3)
            {
               _loc44_ = new Date();
               while(System.freeMemory > 100000)
               {
                  _loc48_ = renderIndex;
                  if(AnimationData.spriteBoundaries["ObstacleShadow"][obstacles[_loc48_].type] is Array)
                  {
                     if(Obstacle.Data[obstacles[_loc48_].type].elevation <= 1)
                     {
                        _loc77_ = new Bitmap(AnimationData.getSprite("Obstacle",obstacles[_loc48_].type,0,1));
                        _loc68_ = new Bitmap(AnimationData.getSprite("ObstacleShadow",obstacles[_loc48_].type,0,1));
                        _loc26_ = map2Screen((obstacles[_loc48_].x + 0.2 + Math.random() * 0.6) * squareWidth,(obstacles[_loc48_].y + 0.2 + Math.random() * 0.6) * squareHeight);
                        _loc77_.x = _loc26_.x + Obstacle.Data[obstacles[_loc48_].type].shiftX + AnimationData.spriteBoundaries["Obstacle"][obstacles[_loc48_].type][0][1].x;
                        _loc68_.x = _loc26_.x + Obstacle.Data[obstacles[_loc48_].type].shiftX + AnimationData.spriteBoundaries["ObstacleShadow"][obstacles[_loc48_].type][0][1].x;
                        _loc77_.y = _loc26_.y + Obstacle.Data[obstacles[_loc48_].type].shiftY + AnimationData.spriteBoundaries["Obstacle"][obstacles[_loc48_].type][0][1].y;
                        _loc68_.y = _loc26_.y + Obstacle.Data[obstacles[_loc48_].type].shiftY + AnimationData.spriteBoundaries["ObstacleShadow"][obstacles[_loc48_].type][0][1].y;
                        _loc68_.alpha = 0.5;
                        OverGrid.addChild(_loc68_);
                        OverGrid.addChild(_loc77_);
                     }
                     else
                     {
                        Obstacles[_loc48_] = new Obstacle(obstacles[_loc48_].type,obstacles[_loc48_].x,obstacles[_loc48_].y);
                        for(_loc49_ in Obstacle.Data[obstacles[_loc48_].type].fillSquares)
                        {
                           _loc100_ = obstacles[_loc48_].x + Obstacle.Data[obstacles[_loc48_].type].fillSquares[_loc49_].x;
                           _loc98_ = obstacles[_loc48_].y + Obstacle.Data[obstacles[_loc48_].type].fillSquares[_loc49_].y;
                           ObstaclesMap[_loc100_][_loc98_] = Obstacles[_loc48_];
                           ASMap.Map[_loc100_][_loc98_] = 1;
                           miniMapBitmap.bitmapData.setPixel32(_loc100_ + 1,_loc98_ + 1,miniMapObstaclesColor);
                        }
                        Obstacles[_loc48_].x = (Obstacles[_loc48_].squareX + 0.5) * squareWidth;
                        Obstacles[_loc48_].y = (Obstacles[_loc48_].squareY + 0.5) * squareHeight;
                        Obstacles[_loc48_].ownContainer = new Bitmap(AnimationData.getSprite("Obstacle",Obstacles[_loc48_].type,0,1));
                        Obstacles[_loc48_].Shadow = new Bitmap(AnimationData.getSprite("ObstacleShadow",Obstacles[_loc48_].type,0,1));
                        _loc26_ = map2Screen(Obstacles[_loc48_].x,Obstacles[_loc48_].y);
                        Obstacles[_loc48_].Shadow.x = _loc26_.x + Obstacle.Data[Obstacles[_loc48_].type].shiftX + AnimationData.spriteBoundaries["ObstacleShadow"][Obstacles[_loc48_].type][0][1].x;
                        Obstacles[_loc48_].ownContainer.x = _loc26_.x + Obstacle.Data[Obstacles[_loc48_].type].shiftX + AnimationData.spriteBoundaries["Obstacle"][Obstacles[_loc48_].type][0][1].x;
                        Obstacles[_loc48_].Shadow.y = _loc26_.y + Obstacle.Data[Obstacles[_loc48_].type].shiftY + AnimationData.spriteBoundaries["ObstacleShadow"][Obstacles[_loc48_].type][0][1].y;
                        Obstacles[_loc48_].ownContainer.y = _loc26_.y + Obstacle.Data[Obstacles[_loc48_].type].shiftY + AnimationData.spriteBoundaries["Obstacle"][Obstacles[_loc48_].type][0][1].y;
                        Obstacles[_loc48_].width = Obstacle.Data[Obstacles[_loc48_].type].width;
                        Obstacles[_loc48_].height = Obstacle.Data[Obstacles[_loc48_].type].height;
                     }
                  }
                  renderIndex = Number(renderIndex) + 1;
                  if(renderIndex >= obstacles.length)
                  {
                     renderIndex = 0;
                     frameCount = 4;
                  }
                  _loc92_ = new Date();
                  if(frameCount != 3 || _loc92_ - _loc44_ > 50)
                  {
                     break;
                  }
               }
            }
            else if(frameCount == 4)
            {
               _loc44_ = new Date();
               _loc14_ = false;
               while(System.freeMemory > 200000)
               {
                  _loc48_ = renderIndex;
                  if(Characters[_loc48_] is Character)
                  {
                     if(Characters[_loc48_].currSlot != Characters[_loc48_].lastSlot || Characters[_loc48_].direction != Characters[_loc48_].lastDirection || Characters[_loc48_].animationPhase != Characters[_loc48_].lastAnimationPhase || Characters[_loc48_].currFrame != Characters[_loc48_].lastFrame || Characters[_loc48_].currentWeaponAnimationType != Characters[_loc48_].lastAnimationType)
                     {
                        if(!(Characters[_loc48_].ownContainer is Bitmap))
                        {
                           Characters[_loc48_].ownContainer = new Bitmap();
                        }
                        else if(Characters[_loc48_].ownContainer.bitmapData is BitmapData)
                        {
                           Characters[_loc48_].ownContainer.bitmapData.dispose();
                        }
                        Characters[_loc48_].ownContainer.bitmapData = Characters[_loc48_].renderAnimation();
                        Characters[_loc48_].lastSlot = Characters[_loc48_].currSlot;
                        Characters[_loc48_].lastDirection = Characters[_loc48_].direction;
                        Characters[_loc48_].lastAnimationPhase = Characters[_loc48_].animationPhase;
                        Characters[_loc48_].lastFrame = Characters[_loc48_].currFrame;
                        Characters[_loc48_].lastAnimationType = Characters[_loc48_].currentWeaponAnimationType;
                        _loc14_ = true;
                     }
                     if(Characters[_loc48_].startAtRenderSprite == 0 || _loc14_)
                     {
                        Characters[_loc48_].ownContainer.x = Characters[_loc48_].screenX - 50;
                        Characters[_loc48_].ownContainer.y = Characters[_loc48_].screenY - 70;
                        _loc89_ = Characters[_loc48_].currentWeaponAnimationType;
                        _loc35_ = AnimationData.fullAnimationTypeFrames[_loc89_][Characters[_loc48_].animationPhase][Characters[_loc48_].currFrame].shadow;
                        Characters[_loc48_].Shadow = new Bitmap(AnimationData.getSprite("Shadows",1,Characters[_loc48_].direction,_loc35_));
                        Characters[_loc48_].Shadow.x = Characters[_loc48_].screenX - 50 + AnimationData.spriteBoundaries["Shadows"][1][Characters[_loc48_].direction][_loc35_].x;
                        Characters[_loc48_].Shadow.y = Characters[_loc48_].screenY - 70 + AnimationData.spriteBoundaries["Shadows"][1][Characters[_loc48_].direction][_loc35_].y;
                     }
                     else
                     {
                        Characters[_loc48_].ownContainer.bitmapData.copyPixels(Characters[_loc48_].renderAnimation(),new Rectangle(0,0,100,100),new Point(0,0),null,null,true);
                     }
                  }
                  if(Characters[_loc48_].startAtRenderSprite == 0)
                  {
                     renderIndex = Number(renderIndex) + 1;
                  }
                  if(renderIndex >= Characters.length)
                  {
                     renderIndex = 0;
                     frameCount = 5;
                  }
                  _loc92_ = new Date();
                  if(frameCount != 4 || _loc92_ - _loc44_ > 50)
                  {
                     break;
                  }
               }
            }
            if(frameCount == 5)
            {
               preRendering = false;
               removeChild(waitScreen);
               ctrlPressed = false;
               shiftPressed = false;
            }
            if(frameCount < 3)
            {
               frameCount = Number(frameCount) + 1;
            }
            return false;
         }
         currCursor = 0;
         cursorText.text = "";
         selectedMark.visible = nowActing >= 0;
         if(!paused)
         {
            damageCaused = false;
            itsAHeadShot = false;
            succesfulHeadShot = false;
            if(MobilePart.x != viewTargetX || MobilePart.y != viewTargetY)
            {
               viewSpeedX += (viewTargetX - MobilePart.x) * 0.2;
               viewSpeedY += (viewTargetY - MobilePart.y) * 0.2;
               viewSpeedX *= 0.5;
               viewSpeedY *= 0.5;
               MobilePart.x += viewSpeedX;
               MobilePart.y += viewSpeedY;
            }
            Floor.x = MobilePart.x % 450;
            Floor.y = MobilePart.y % 260;
            if(MobilePart.x > 0)
            {
               Floor.x -= 450;
            }
            if(MobilePart.y > 0)
            {
               Floor.y -= 260;
            }
            if(phase == 0 && (!autoCenter || Math.abs(viewTargetX - MobilePart.x) < 50 && Math.abs(viewTargetY - MobilePart.y) < 50))
            {
               phase = 1;
               interfaceOnOff(inControl());
            }
            if(Path is Array && Path.length > 0)
            {
               for(_loc48_ in Path)
               {
                  if(Path[_loc48_].sprite is Bitmap)
                  {
                     if(Path[_loc48_].sprite is DisplayObject && GroundMarks.contains(Path[_loc48_].sprite))
                     {
                        GroundMarks.removeChild(Path[_loc48_].sprite);
                     }
                     Path[_loc48_].sprite = null;
                  }
               }
            }
            if(prevMPX != MobilePart.x || prevMPY != MobilePart.y)
            {
               interfaceData.miniMapFrame.x = (0 - MobilePart.x) / squareWidth;
               interfaceData.miniMapFrame.y = (0 - MobilePart.y) / squareHeight;
               prevMPX = MobilePart.x;
               prevMPY = MobilePart.y;
            }
            if(Interlacing is Sprite && MobilePart.contains(Interlacing))
            {
               MobilePart.removeChild(Interlacing);
            }
            if(Shadows is Sprite && MobilePart.contains(Shadows))
            {
               MobilePart.removeChild(Shadows);
            }
            Interlacing = new Sprite();
            Shadows = new Sprite();
            Shadows.blendMode = "layer";
            Shadows.alpha = 0.5;
            Visible = [];
            _loc37_ = [];
            _loc36_ = [];
            for(_loc48_ in Characters)
            {
               if(Characters[_loc48_].burning > 0 && Characters[_loc48_].flameSoundChannel)
               {
                  if(GameData.soundFXOn)
                  {
                     applySoundTransform(Characters[_loc48_].flameSoundChannel,Characters[_loc48_].x,Characters[_loc48_].y);
                  }
                  else
                  {
                     Characters[_loc48_].flameSoundChannel.soundTransform = new SoundTransform(0,0);
                  }
               }
               if(Characters[_loc48_].animationPhase == 1)
               {
                  Characters[_loc48_].currFrame += walkAnimationSpeed;
               }
               else
               {
                  Characters[_loc48_].currFrame++;
               }
               if(Characters[_loc48_].applyPhaseAndFrame != null)
               {
                  Characters[_loc48_].animationPhase = Characters[_loc48_].applyPhaseAndFrame.phase;
                  Characters[_loc48_].currFrame = Characters[_loc48_].applyPhaseAndFrame.frame;
                  Characters[_loc48_].applyPhaseAndFrame = null;
               }
               _loc23_ = Characters[_loc48_].currentWeaponAnimationType;
               if(Characters[_loc48_].currFrame >= AnimationData.fullAnimationTypeFrames[_loc23_][Characters[_loc48_].animationPhase].length)
               {
                  Characters[_loc48_].currFrame = 1;
               }
               if(Characters[_loc48_].animationPhase == 1 && Characters[_loc48_].currFrame == 1)
               {
                  Characters[_loc48_].currFrame = walkAnimationSpeed;
               }
               if(!Characters[_loc48_].dead && Characters[_loc48_].bleeding > 0.5)
               {
                  if(Math.random() < 0.1 - 1 / (Characters[_loc48_].bleeding * 20))
                  {
                     _loc103_ = Math.pow(Math.random(),3) * 5;
                     _loc63_ = Math.random() * MathFunctions.dblPI;
                     Characters[_loc48_].bloodDrops.push({
                        "x":Characters[_loc48_].x + Math.sin(_loc63_) * _loc103_,
                        "y":Characters[_loc48_].y + Math.cos(_loc63_) * _loc103_,
                        "z":40,
                        "xSpeed":Math.sin(_loc63_) * _loc103_ * 0.5,
                        "ySpeed":Math.cos(_loc63_) * _loc103_ * 0.5,
                        "zSpeed":0,
                        "container":generateBloodDrop()
                     });
                  }
               }
               if(Characters[_loc48_].bloodDrops.length > 0)
               {
                  for(_loc49_ in Characters[_loc48_].bloodDrops)
                  {
                     Characters[_loc48_].bloodDrops[_loc49_].x += Characters[_loc48_].bloodDrops[_loc49_].xSpeed;
                     Characters[_loc48_].bloodDrops[_loc49_].y += Characters[_loc48_].bloodDrops[_loc49_].ySpeed;
                     Characters[_loc48_].bloodDrops[_loc49_].zSpeed += 1;
                     Characters[_loc48_].bloodDrops[_loc49_].z -= Characters[_loc48_].bloodDrops[_loc49_].zSpeed;
                     if(Characters[_loc48_].bloodDrops[_loc49_].z <= 0)
                     {
                        _loc26_ = map2Screen(Characters[_loc48_].bloodDrops[_loc49_].x,Characters[_loc48_].bloodDrops[_loc49_].y);
                        _loc2_ = -1;
                        while(_loc2_ <= 1)
                        {
                           _loc15_ = -1;
                           while(_loc15_ <= 1)
                           {
                              _loc7_ = Math.floor((_loc26_.x - leftViewLimit + _loc2_) / 1000);
                              _loc30_ = Math.floor((_loc26_.y - topViewLimit + _loc15_) / 1000);
                              _loc85_ = (_loc26_.x - leftViewLimit + _loc2_) % 1000;
                              _loc84_ = (_loc26_.y - topViewLimit + _loc15_) % 1000;
                              if(BloodBitmaps[_loc7_] is Array && BloodBitmaps[_loc7_][_loc30_] is Bitmap)
                              {
                                 switch(Math.abs(_loc2_) + Math.abs(_loc15_))
                                 {
                                    case 2:
                                       _loc62_ = 5;
                                       break;
                                    case 1:
                                       _loc62_ = 10;
                                       break;
                                    case 0:
                                       _loc62_ = 20;
                                 }
                                 _loc83_ = BloodBitmaps[_loc7_][_loc30_].bitmapData.getPixel32(_loc85_,_loc84_);
                                 _loc56_ = _loc83_ >> 24 & 0xFF;
                                 _loc56_ = _loc56_ + _loc62_;
                                 if(_loc56_ > 255)
                                 {
                                    _loc56_ = 255;
                                 }
                                 BloodBitmaps[_loc7_][_loc30_].bitmapData.setPixel32(_loc85_,_loc84_,6684672 + (_loc56_ << 24));
                              }
                              _loc15_++;
                           }
                           _loc2_++;
                        }
                        Characters[_loc48_].bloodDrops.splice(_loc49_,1);
                        _loc49_--;
                     }
                  }
               }
               if(Characters[_loc48_].animationPhase == 1)
               {
                  miniMapBitmap.bitmapData.setPixel32(Characters[_loc48_].squareX + 1,Characters[_loc48_].squareY + 1,0);
                  Characters[_loc48_].x += directions[Characters[_loc48_].direction][0] * squareWidth / 4 * walkAnimationSpeed;
                  Characters[_loc48_].y += directions[Characters[_loc48_].direction][1] * squareHeight / 4 * walkAnimationSpeed;
                  Characters[_loc48_].squareX = Math.floor(Characters[_loc48_].x / squareWidth);
                  Characters[_loc48_].squareY = Math.floor(Characters[_loc48_].y / squareHeight);
                  drawCharacterOnMiniMap(Characters[_loc48_]);
                  if(GameData.soundFXOn && Characters[_loc48_].currFrame % 4 == 2)
                  {
                     _loc81_ = getDefinitionByName("SFXFootstep" + MathFunctions.random(1,8)) as Class;
                     _loc97_ = new _loc81_() as Sound;
                     playSoundAt(_loc97_,Characters[_loc48_].x,Characters[_loc48_].y,0.7);
                  }
                  if(Characters[_loc48_].currFrame % 4 == 0)
                  {
                     if(Characters[_loc48_].AP >= Characters[_loc48_].walkAP)
                     {
                        Characters[_loc48_].reduceAP(Characters[_loc48_].walkAP);
                        if(Path[0].direction < 4)
                        {
                           Characters[_loc48_].direction = Path[0].direction;
                           Path.shift();
                        }
                        else
                        {
                           endWalk(Characters[_loc48_]);
                           if(phase != 0)
                           {
                              phase = 1;
                           }
                        }
                     }
                     else if(Characters[_loc48_].animationPhase == 1)
                     {
                        endWalk(Characters[_loc48_]);
                        if(phase != 0)
                        {
                           phase = 1;
                        }
                     }
                     if(Characters[_loc48_].AP <= 0)
                     {
                        _loc88_ = true;
                     }
                     else
                     {
                        updateInterface();
                     }
                  }
               }
               if(Characters[_loc48_].animationPhase == 2)
               {
                  if(GameData.soundFXOn)
                  {
                     if(Characters[_loc48_].currFrame == 5 && Characters[_loc48_].currentWeaponType.category == 0)
                     {
                        playSoundAt(new SFXPunchSwoosh(),Characters[_loc48_].x,Characters[_loc48_].y);
                     }
                     else if(Characters[_loc48_].currFrame == 3 && Characters[_loc48_].currentWeaponType.category == 1 && Characters[_loc48_].currentWeaponData.type == 1)
                     {
                        playSoundAt(new SFXKnifeSwoosh(),Characters[_loc48_].x,Characters[_loc48_].y);
                     }
                     else if(Characters[_loc48_].currFrame == 5 && Characters[_loc48_].currentWeaponType.category == 1 && Characters[_loc48_].currentWeaponData.type > 1)
                     {
                        if(Characters[_loc48_].currentWeaponData.type == 20)
                        {
                           playSoundAt(new SFXSwordSwoosh(),Characters[_loc48_].x,Characters[_loc48_].y);
                        }
                        else
                        {
                           playSoundAt(new SFXMeleeSwoosh(),Characters[_loc48_].x,Characters[_loc48_].y);
                        }
                     }
                  }
                  if(Characters[_loc48_].currFrame == AnimationData.HitFrames[Characters[_loc48_].currentWeaponAnimationType])
                  {
                     Attack(ActList[nowActing]);
                     if(Characters[_loc48_].currentWeaponType.category == 5)
                     {
                        Characters[_loc48_].grenadeAmounts[Characters[_loc48_].currSlot]--;
                        Characters[_loc48_].reduceItemFromEquipment(Item.itemNumFromCatSubCat(2,Characters[_loc48_].weapons[Characters[_loc48_].currSlot]),1,true);
                        updateInterface();
                        if(Characters[_loc48_].grenadeAmounts[Characters[_loc48_].currSlot] <= 0)
                        {
                           if(Characters[_loc48_] == ActList[nowActing])
                           {
                              phase = 4;
                           }
                        }
                     }
                  }
                  if(Characters[_loc48_].currFrame >= AnimationData.fullAnimationTypeFrames[_loc23_][Characters[_loc48_].animationPhase].length - 1)
                  {
                     _loc27_ = true;
                     if(burstCounter > 0)
                     {
                        if(Characters[_loc48_].currentAmmo is Item && Characters[_loc48_].currentAmmo.amount > 0)
                        {
                           burstCounter = Number(burstCounter) - 1;
                           _loc27_ = false;
                           Characters[_loc48_].applyPhaseAndFrame = {
                              "phase":2,
                              "frame":1
                           };
                        }
                        else
                        {
                           burstCounter = 0;
                        }
                     }
                     if(_loc27_)
                     {
                        Characters[_loc48_].applyPhaseAndFrame = {
                           "phase":0,
                           "frame":1
                        };
                        if(Characters[_loc48_].currentWeaponType.category != 5 && phase != 4)
                        {
                           if(Characters[_loc48_].AP <= 0)
                           {
                              if(flyingProjectiles.length > 0)
                              {
                                 phase = 3;
                              }
                              else
                              {
                                 _loc88_ = true;
                              }
                           }
                           else if(phase != 0)
                           {
                              phase = 1;
                           }
                        }
                     }
                  }
               }
               if(Characters[_loc48_].animationPhase == 3)
               {
                  if(Characters[_loc48_].currFrame >= AnimationData.fullAnimationTypeFrames[_loc23_][Characters[_loc48_].animationPhase].length - 1)
                  {
                     Characters[_loc48_].animationPhase = 0;
                     Characters[_loc48_].currFrame = 1;
                     if(Characters[_loc48_] == ActList[nowActing])
                     {
                        if(Characters[_loc48_].AP <= 0)
                        {
                           _loc88_ = true;
                        }
                        else if(phase != 0)
                        {
                           phase = 1;
                        }
                     }
                  }
               }
               if(Characters[_loc48_].animationPhase == 4)
               {
                  if(GameData.soundFXOn && Characters[_loc48_].currFrame == 7)
                  {
                     playSoundAt(new SFXBodyFall(),Characters[_loc48_].x,Characters[_loc48_].y);
                  }
                  if(Characters[_loc48_].currFrame == 5)
                  {
                     Characters[_loc48_].dead = true;
                     ASMap.Map[Characters[_loc48_].squareX][Characters[_loc48_].squareY] = 0;
                     CharactersMap[Characters[_loc48_].squareX][Characters[_loc48_].squareY] = null;
                     miniMapBitmap.bitmapData.setPixel32(Characters[_loc48_].squareX + 1,Characters[_loc48_].squareY + 1,0);
                     if(Characters[_loc48_].flameSoundChannel)
                     {
                        Characters[_loc48_].flameSoundChannel.stop();
                     }
                     if(Characters[_loc48_].weapons[Characters[_loc48_].currSlot] != 0)
                     {
                        if(!(DroppedWeapons[Characters[_loc48_].squareX][Characters[_loc48_].squareY] is Array))
                        {
                           DroppedWeapons[Characters[_loc48_].squareX][Characters[_loc48_].squareY] = [];
                        }
                        _loc43_ = [];
                        for(_loc49_ in Characters[_loc48_].attachments[Characters[_loc48_].currSlot])
                        {
                           if(Characters[_loc48_].attachments[Characters[_loc48_].currSlot][_loc49_] > 0)
                           {
                              _loc43_.push(Characters[_loc48_].attachments[Characters[_loc48_].currSlot][_loc49_]);
                           }
                        }
                        DroppedWeapons[Characters[_loc48_].squareX][Characters[_loc48_].squareY].push({
                           "type":Characters[_loc48_].weapons[Characters[_loc48_].currSlot],
                           "character":Characters[_loc48_],
                           "ammoType":Characters[_loc48_].currentAmmo.type,
                           "ammoAmount":Characters[_loc48_].currentAmmo.amount,
                           "attachments":_loc43_
                        });
                        _loc51_ = Item.itemNumFromCatSubCat(2,Characters[_loc48_].weapons[Characters[_loc48_].currSlot]);
                        Characters[_loc48_].reduceItemFromEquipment(_loc51_,1,true);
                        if(Characters[_loc48_].currentAmmo.amount > 0)
                        {
                           _loc51_ = Characters[_loc48_].currentAmmo.type;
                           Characters[_loc48_].reduceItemFromEquipment(_loc51_,Characters[_loc48_].currentAmmo.amount,true);
                        }
                        for(_loc49_ in Characters[_loc48_].attachments[Characters[_loc48_].currSlot])
                        {
                           if(Characters[_loc48_].attachments[Characters[_loc48_].currSlot][_loc49_] > 0)
                           {
                              _loc51_ = Item.itemNumFromCatSubCat(4,Characters[_loc48_].attachments[Characters[_loc48_].currSlot][_loc49_]);
                              Characters[_loc48_].reduceItemFromEquipment(_loc51_,1,true);
                           }
                        }
                        Characters[_loc48_].weapons[Characters[_loc48_].currSlot] = 0;
                     }
                     if(Characters[_loc48_].group == 0)
                     {
                        yourPeople = Number(yourPeople) - 1;
                        if(Characters[_loc48_] == GroupCaravans[Characters[_loc48_].group].People[0])
                        {
                           trace("losing because main character died");
                           loseTheGame();
                           return;
                        }
                     }
                     else if(Characters[_loc48_].band == 1)
                     {
                        allies = Number(allies) - 1;
                     }
                     if(Characters[_loc48_].band == 2 && GroupCaravans[0].People[0].HP > 0)
                     {
                        enemies = 0;
                        for(_loc49_ in Characters)
                        {
                           if(Characters[_loc49_].band == 2 && !Characters[_loc49_].dead)
                           {
                              enemies = Number(enemies) + 1;
                           }
                        }
                        if(enemies == 0)
                        {
                           winTheGame();
                           paused = true;
                           return;
                        }
                     }
                     updateInterface();
                     if(Characters[_loc48_] == ActList[nowActing])
                     {
                        _loc88_ = true;
                     }
                  }
                  if(Characters[_loc48_].currFrame >= AnimationData.fullAnimationTypeFrames[_loc23_][Characters[_loc48_].animationPhase].length - 1)
                  {
                     Characters[_loc48_].currFrame--;
                  }
               }
               _loc26_ = map2Screen(Characters[_loc48_].x,Characters[_loc48_].y);
               Characters[_loc48_].screenX = _loc26_.x;
               Characters[_loc48_].screenY = _loc26_.y;
               if(Characters[_loc48_].screenX > 0 - MobilePart.x - 50 && Characters[_loc48_].screenX < 0 - MobilePart.x + screenWidth + 50 && Characters[_loc48_].screenY > 0 - MobilePart.y - 30 && Characters[_loc48_].screenY < 0 - MobilePart.y + screenHeight + 70)
               {
                  if(Characters[_loc48_].dead)
                  {
                     _loc37_.push(Characters[_loc48_]);
                  }
                  else
                  {
                     _loc36_.push(Characters[_loc48_]);
                  }
                  if(Characters[_loc48_].ownContainer is Bitmap)
                  {
                     Characters[_loc48_].ownContainer.alpha = 1;
                     Characters[_loc48_].ownContainer.filters = [];
                  }
               }
            }
            if(nowActing >= 0)
            {
               _loc26_ = map2Screen(ActList[nowActing].x - squareWidth / 2,ActList[nowActing].y - squareHeight / 2);
               selectedMark.x = _loc26_.x + squareBoxShiftX;
               selectedMark.y = _loc26_.y + squareBoxShiftY;
            }
            obstaclesOnScreen = [];
            for(_loc48_ in Obstacles)
            {
               if(Obstacles[_loc48_].ownContainer.x + MobilePart.x + Obstacles[_loc48_].ownContainer.bitmapData.width > 0 && Obstacles[_loc48_].ownContainer.y + MobilePart.y + Obstacles[_loc48_].ownContainer.bitmapData.height > 0 && Obstacles[_loc48_].ownContainer.x + MobilePart.x <= screenWidth && Obstacles[_loc48_].ownContainer.y + MobilePart.y <= screenHeight)
               {
                  _loc36_.push(Obstacles[_loc48_]);
                  obstaclesOnScreen.push(Obstacles[_loc48_]);
               }
            }
            for(_loc48_ in Transport)
            {
               if(Transport[_loc48_].ownContainer.x + MobilePart.x + Transport[_loc48_].ownContainer.bitmapData.width > 0 && Transport[_loc48_].ownContainer.y + MobilePart.y + Transport[_loc48_].ownContainer.bitmapData.height > 0 && Transport[_loc48_].ownContainer.x + MobilePart.x <= screenWidth && Transport[_loc48_].ownContainer.y + MobilePart.y <= screenHeight)
               {
                  if(Transport[_loc48_].frame != Transport[_loc48_].prevFrame)
                  {
                     Transport[_loc48_].ownContainer.bitmapData.copyPixels(AnimationData.getSprite("Transport",Transport[_loc48_].type,Transport[_loc48_].direction,Transport[_loc48_].frame),new Rectangle(0,0,AnimationData.spriteBoundaries["Transport"][Transport[_loc48_].type][Transport[_loc48_].direction][Transport[_loc48_].frame].width,AnimationData.spriteBoundaries["Transport"][Transport[_loc48_].type][Transport[_loc48_].direction][Transport[_loc48_].frame].height),new Point(AnimationData.spriteBoundaries["Transport"][Transport[_loc48_].type][Transport[_loc48_].direction][Transport[_loc48_].frame].x,AnimationData.spriteBoundaries["Transport"][Transport[_loc48_].type][Transport[_loc48_].direction][Transport[_loc48_].frame].y));
                     Transport[_loc48_].Shadow.bitmapData.copyPixels(AnimationData.getSprite("TransportShadow",Transport[_loc48_].type,Transport[_loc48_].direction,Transport[_loc48_].frame),new Rectangle(0,0,AnimationData.spriteBoundaries["TransportShadow"][Transport[_loc48_].type][Transport[_loc48_].direction][Transport[_loc48_].frame].width,AnimationData.spriteBoundaries["TransportShadow"][Transport[_loc48_].type][Transport[_loc48_].direction][Transport[_loc48_].frame].height),new Point(AnimationData.spriteBoundaries["TransportShadow"][Transport[_loc48_].type][Transport[_loc48_].direction][Transport[_loc48_].frame].x,AnimationData.spriteBoundaries["TransportShadow"][Transport[_loc48_].type][Transport[_loc48_].direction][Transport[_loc48_].frame].y));
                  }
                  Transport[_loc48_].ownContainer.alpha = 1;
                  Transport[_loc48_].prevFrame = Transport[_loc48_].frame;
                  _loc36_.push(Transport[_loc48_]);
               }
               if(Transport[_loc48_].frame > 1 && Transport[_loc48_].frame < 9 || Transport[_loc48_].frame > 9 && Transport[_loc48_].frame < 29 || Transport[_loc48_].frame > 30 && Transport[_loc48_].frame < 38 || Transport[_loc48_].frame > 38 && Transport[_loc48_].frame < 58)
               {
                  Transport[_loc48_].frame++;
               }
               if(Transport[_loc48_].frame == 9)
               {
                  Transport[_loc48_].frame = 1;
               }
               if(Transport[_loc48_].frame == 38)
               {
                  Transport[_loc48_].frame = 30;
               }
               if(GameData.soundFXOn && (Transport[_loc48_].frame == 22 || Transport[_loc48_].frame == 52))
               {
                  playSoundAt(new SFXAnimalDie(),Transport[_loc48_].x,Transport[_loc48_].y,0.5);
               }
            }
            _loc48_ = 0;
            while(_loc48_ < flyingProjectiles.length)
            {
               flyingProjectiles[_loc48_].x += flyingProjectiles[_loc48_].speed * Math.sin(flyingProjectiles[_loc48_].direction);
               flyingProjectiles[_loc48_].y += flyingProjectiles[_loc48_].speed * Math.cos(flyingProjectiles[_loc48_].direction);
               flyingProjectiles[_loc48_].z -= 0.5;
               _loc80_ = checkHit(flyingProjectiles[_loc48_].prevX,flyingProjectiles[_loc48_].prevY,flyingProjectiles[_loc48_].x,flyingProjectiles[_loc48_].y,[flyingProjectiles[_loc48_].firedBy]);
               flyingProjectiles[_loc48_].prevX = flyingProjectiles[_loc48_].x;
               flyingProjectiles[_loc48_].prevY = flyingProjectiles[_loc48_].y;
               if(_loc80_ != null)
               {
                  if(_loc80_.segment[0].belongsTo is Character || _loc80_.segment[0].belongsTo is TransportUnit)
                  {
                     if(phase == 3)
                     {
                        _loc88_ = true;
                     }
                     if(!flyingProjectiles[_loc48_].explosive)
                     {
                        hitByProjectile(_loc80_.segment[0].belongsTo,flyingProjectiles[_loc48_].firedBy,flyingProjectiles[_loc48_].speed,flyingProjectiles[_loc48_].direction,_loc80_.distance);
                     }
                     if(GameData.soundFXOn && WeaponsData.Ammo[flyingProjectiles[_loc48_].ammoType].type == 4)
                     {
                        playSoundAt(new SFXCrossbowHit(),flyingProjectiles[_loc48_].x,flyingProjectiles[_loc48_].y);
                     }
                  }
                  else if(GameData.soundFXOn && WeaponsData.Ammo[flyingProjectiles[_loc48_].ammoType].type == 4)
                  {
                     playSoundAt(new SFXCrossbowMiss(),flyingProjectiles[_loc48_].x,flyingProjectiles[_loc48_].y);
                  }
               }
               if(flyingProjectiles[_loc48_].z <= 0 || _loc80_ != null)
               {
                  trace("***BANG***** projectile hits something. phase: " + phase);
                  if(phase == 3)
                  {
                     _loc88_ = true;
                  }
                  if(flyingProjectiles[_loc48_].explosive)
                  {
                     if(_loc80_ is Object)
                     {
                        _loc12_ = _loc80_.x - Math.sin(flyingProjectiles[_loc48_].direction) * 10;
                        _loc13_ = _loc80_.y - Math.cos(flyingProjectiles[_loc48_].direction) * 10;
                     }
                     else
                     {
                        _loc12_ = flyingProjectiles[_loc48_].x;
                        _loc13_ = flyingProjectiles[_loc48_].y;
                     }
                     createExplosion(_loc12_,_loc13_,flyingProjectiles[_loc48_].explosiveness,flyingProjectiles[_loc48_].antiPersonnel);
                  }
                  flyingProjectiles.splice(_loc48_,1);
                  _loc48_--;
               }
               else
               {
                  _loc26_ = map2Screen(flyingProjectiles[_loc48_].x,flyingProjectiles[_loc48_].y);
                  flyingProjectiles[_loc48_].squareX = Math.floor(flyingProjectiles[_loc48_].x / squareWidth);
                  flyingProjectiles[_loc48_].squareY = Math.floor(flyingProjectiles[_loc48_].y / squareHeight);
                  flyingProjectiles[_loc48_].ownContainer.x = _loc26_.x;
                  flyingProjectiles[_loc48_].ownContainer.y = _loc26_.y - flyingProjectiles[_loc48_].z;
                  flyingProjectiles[_loc48_].Shadow.x = _loc26_.x;
                  flyingProjectiles[_loc48_].Shadow.y = _loc26_.y;
                  if(flyingProjectiles[_loc48_].ownContainer.x + MobilePart.x > -10 && flyingProjectiles[_loc48_].ownContainer.x + MobilePart.x < screenWidth + 10 && flyingProjectiles[_loc48_].ownContainer.y + MobilePart.y > -10 && flyingProjectiles[_loc48_].ownContainer.y + MobilePart.y < screenHeight + 10)
                  {
                     _loc36_.push(flyingProjectiles[_loc48_]);
                  }
                  flyingProjectiles[_loc48_].speed *= flyingProjectiles[_loc48_].FF;
                  if(flyingProjectiles[_loc48_].squareX < 0 || flyingProjectiles[_loc48_].squareX >= gridWidth || flyingProjectiles[_loc48_].squareY < 0 || flyingProjectiles[_loc48_].squareY >= gridHeight)
                  {
                     trace("***PFIEW***** projectile flies away.");
                     if(phase == 3)
                     {
                        _loc88_ = true;
                     }
                     flyingProjectiles.splice(_loc48_,1);
                     _loc48_--;
                  }
               }
               _loc48_++;
            }
            var _loc38_:Boolean = true;
            for(_loc48_ in flyingGrenades)
            {
               _loc19_ = false;
               flyingGrenades[_loc48_].x += flyingGrenades[_loc48_].xSpeed / stage.frameRate * 32;
               flyingGrenades[_loc48_].y += flyingGrenades[_loc48_].ySpeed / stage.frameRate * 32;
               flyingGrenades[_loc48_].z += flyingGrenades[_loc48_].zSpeed / stage.frameRate * 32;
               for(_loc49_ in flyingGrenades[_loc48_].overObstacles)
               {
                  if(flyingGrenades[_loc48_].z / 32 < flyingGrenades[_loc48_].overObstacles[_loc49_].zHeight)
                  {
                     _loc19_ = true;
                     flyingGrenades[_loc48_].zSpeed = 0;
                     flyingGrenades[_loc48_].xSpeed *= 0.8;
                     flyingGrenades[_loc48_].ySpeed *= 0.8;
                     flyingGrenades[_loc48_].z = flyingGrenades[_loc48_].overObstacles[_loc49_].zHeight * 32;
                     _loc38_ = false;
                     if(flyingGrenades[_loc48_].z != flyingGrenades[_loc48_].prevZ)
                     {
                        if(GameData.soundFXOn)
                        {
                           playSoundAt(new SFXHitWall(),flyingGrenades[_loc48_].x,flyingGrenades[_loc48_].y);
                        }
                     }
                  }
               }
               flyingGrenades[_loc48_].zSpeed -= 9.8 / stage.frameRate;
               _loc80_ = checkHit(flyingGrenades[_loc48_].prevX,flyingGrenades[_loc48_].prevY,flyingGrenades[_loc48_].x,flyingGrenades[_loc48_].y,[flyingGrenades[_loc48_].firedBy],true,true);
               if(_loc80_ != null)
               {
                  for(_loc49_ in _loc80_)
                  {
                     if(flyingGrenades[_loc48_].z / 32 < _loc80_[_loc49_].segment[0].belongsTo.zHeight)
                     {
                        if(GameData.soundFXOn)
                        {
                           playSoundAt(new SFXHitWall(),flyingGrenades[_loc48_].x,flyingGrenades[_loc48_].y);
                        }
                        _loc19_ = true;
                        _loc40_ = MathFunctions.CalcAngle(_loc80_[_loc49_].segment[0].x,_loc80_[_loc49_].segment[0].y,_loc80_[_loc49_].segment[1].x,_loc80_[_loc49_].segment[1].y);
                        _loc6_ = _loc40_ + MathFunctions.halfPI;
                        _loc72_ = MathFunctions.CalcAngle(flyingGrenades[_loc48_].prevX,flyingGrenades[_loc48_].prevY,flyingGrenades[_loc48_].x,flyingGrenades[_loc48_].y);
                        _loc61_ = _loc6_ - (_loc72_ - _loc6_) + 3.141592653589793;
                        _loc65_ = Math.sqrt(Math.pow(flyingGrenades[_loc48_].xSpeed,2) + Math.pow(flyingGrenades[_loc48_].ySpeed,2));
                        _loc52_ = _loc80_[_loc49_].distance / (_loc65_ / stage.frameRate * 32);
                        _loc99_ = _loc65_ * 0.6;
                        flyingGrenades[_loc48_].xSpeed = Math.sin(_loc61_) * _loc99_;
                        flyingGrenades[_loc48_].ySpeed = Math.cos(_loc61_) * _loc99_;
                        flyingGrenades[_loc48_].x = _loc80_[_loc49_].x + flyingGrenades[_loc48_].xSpeed * (1 - _loc52_) / stage.frameRate * 32;
                        flyingGrenades[_loc48_].y = _loc80_[_loc49_].y + flyingGrenades[_loc48_].ySpeed * (1 - _loc52_) / stage.frameRate * 32;
                        flyingGrenades[_loc48_].prevX = _loc80_[_loc49_].x;
                        flyingGrenades[_loc48_].prevY = _loc80_[_loc49_].y;
                        break;
                     }
                     _loc71_ = null;
                     for(_loc50_ in flyingGrenades[_loc48_].overObstacles)
                     {
                        if(flyingGrenades[_loc48_].overObstacles[_loc50_] == _loc80_[_loc49_].segment[0].belongsTo)
                        {
                           _loc71_ = _loc50_;
                           break;
                        }
                     }
                     if(_loc71_ != null)
                     {
                        flyingGrenades[_loc48_].overObstacles.splice(_loc71_,1);
                     }
                     else
                     {
                        flyingGrenades[_loc48_].overObstacles.push(_loc80_[_loc49_].segment[0].belongsTo);
                     }
                  }
               }
               flyingGrenades[_loc48_].prevX = flyingGrenades[_loc48_].x;
               flyingGrenades[_loc48_].prevY = flyingGrenades[_loc48_].y;
               flyingGrenades[_loc48_].prevZ = flyingGrenades[_loc48_].z;
               flyingGrenades[_loc48_].counter--;
               if(flyingGrenades[_loc48_].counter > 0)
               {
                  if(flyingGrenades[_loc48_].z <= 0)
                  {
                     flyingGrenades[_loc48_].z = 0;
                     flyingGrenades[_loc48_].xSpeed *= 0.5;
                     flyingGrenades[_loc48_].ySpeed *= 0.5;
                     flyingGrenades[_loc48_].zSpeed = 0;
                     _loc38_ = false;
                     _loc19_ = true;
                     if(flyingGrenades[_loc48_].z != flyingGrenades[_loc48_].prevZ)
                     {
                        if(GameData.soundFXOn)
                        {
                           playSoundAt(new SFXHitFloor(),flyingGrenades[_loc48_].x,flyingGrenades[_loc48_].y);
                        }
                     }
                  }
                  if(_loc38_)
                  {
                     flyingGrenades[_loc48_].frame++;
                     if(flyingGrenades[_loc48_].frame > 16)
                     {
                        flyingGrenades[_loc48_].frame = 1;
                     }
                  }
                  _loc86_ = AnimationData.getSprite("Grenade",0,0,flyingGrenades[_loc48_].frame);
                  flyingGrenades[_loc48_].ownContainer = new Bitmap(_loc86_);
                  _loc26_ = map2Screen(flyingGrenades[_loc48_].x,flyingGrenades[_loc48_].y);
                  flyingGrenades[_loc48_].ownContainer.x = _loc26_.x - 5 + AnimationData.spriteBoundaries["Grenade"][0][0][flyingGrenades[_loc48_].frame].x;
                  flyingGrenades[_loc48_].ownContainer.y = _loc26_.y - 5 - flyingGrenades[_loc48_].z * 0.9 + AnimationData.spriteBoundaries["Grenade"][0][0][flyingGrenades[_loc48_].frame].y;
                  flyingGrenades[_loc48_].squareX = Math.floor(flyingGrenades[_loc48_].x / squareWidth);
                  flyingGrenades[_loc48_].squareY = Math.floor(flyingGrenades[_loc48_].y / squareHeight);
                  if(flyingGrenades[_loc48_].ownContainer.x + MobilePart.x > -10 && flyingGrenades[_loc48_].ownContainer.x + MobilePart.x < screenWidth + 10 && flyingGrenades[_loc48_].ownContainer.y + MobilePart.y > -10 && flyingGrenades[_loc48_].ownContainer.y + MobilePart.y < screenHeight + 10)
                  {
                     _loc36_.push(flyingGrenades[_loc48_]);
                  }
               }
               if(flyingGrenades[_loc48_].counter <= 0 || _loc19_ && flyingGrenades[_loc48_].explodeOnImpact)
               {
                  createExplosion(flyingGrenades[_loc48_].x,flyingGrenades[_loc48_].y,flyingGrenades[_loc48_].explosiveness,flyingGrenades[_loc48_].antiPersonnel,flyingGrenades[_loc48_].flame);
                  if(phase == 4)
                  {
                     ActList[nowActing].weapons[ActList[nowActing].currSlot] = 0;
                     ActList[nowActing].animationPhase = 0;
                     ActList[nowActing].currFrame = 1;
                     switchWeapon();
                  }
                  if(ActList[nowActing].AP <= 0)
                  {
                     _loc88_ = true;
                  }
                  else if(phase != 0)
                  {
                     phase = 1;
                  }
                  flyingGrenades.splice(_loc48_,1);
                  _loc48_--;
               }
            }
            if(flamethrowerInAction)
            {
               burstCounter = Number(burstCounter) - 1;
               if(burstCounter % 2 == 0)
               {
                  if(GameData.soundFXOn)
                  {
                     playSoundAt(new SFXFlamethrower(),ActList[nowActing].x,ActList[nowActing].y,0.3);
                  }
                  _loc79_ = flamethrowerFlames.push(new Projectile()) - 1;
                  flamethrowerFlames[_loc79_].prevX = flamethrowerFlames[_loc79_].x = ActList[nowActing].x;
                  flamethrowerFlames[_loc79_].prevY = flamethrowerFlames[_loc79_].y = ActList[nowActing].y;
                  flamethrowerFlames[_loc79_].frame = 0;
                  flamethrowerFlames[_loc79_].direction = flamethrowerShotAngle;
                  flamethrowerFlames[_loc79_].speed = 2;
                  flamethrowerFlames[_loc79_].firedBy = ActList[nowActing];
                  ActList[nowActing].loadedAmmo[ActList[nowActing].currSlot].amount--;
                  useCurrentAmmo(ActList[nowActing],1);
                  updateInterface();
                  if(ActList[nowActing].loadedAmmo[ActList[nowActing].currSlot].amount <= 0)
                  {
                     burstCounter = 0;
                  }
               }
               if(burstCounter == 0)
               {
                  flamethrowerInAction = false;
                  if(ActList[nowActing].AP <= 0)
                  {
                     phase = 3;
                  }
                  else if(phase != 0)
                  {
                     phase = 1;
                  }
               }
            }
            for(_loc48_ in flamethrowerFlames)
            {
               flamethrowerFlames[_loc48_].frame++;
               if(flamethrowerFlames[_loc48_].frame > 47)
               {
                  flamethrowerFlames.splice(_loc48_,1);
                  _loc48_--;
                  if(phase == 3 && flamethrowerFlames.length == 0)
                  {
                     _loc88_ = true;
                  }
               }
               else
               {
                  flamethrowerFlames[_loc48_].x += Math.sin(flamethrowerFlames[_loc48_].direction) * flamethrowerFlames[_loc48_].speed;
                  flamethrowerFlames[_loc48_].y += Math.cos(flamethrowerFlames[_loc48_].direction) * flamethrowerFlames[_loc48_].speed;
                  _loc80_ = checkHit(flamethrowerFlames[_loc48_].prevX,flamethrowerFlames[_loc48_].prevY,flamethrowerFlames[_loc48_].x,flamethrowerFlames[_loc48_].y,[flamethrowerFlames[_loc48_].firedBy]);
                  flamethrowerFlames[_loc48_].prevX = flamethrowerFlames[_loc48_].x;
                  flamethrowerFlames[_loc48_].prevY = flamethrowerFlames[_loc48_].y;
                  if(_loc80_ != null)
                  {
                     flamethrowerFlames[_loc48_].x = _loc80_.x;
                     flamethrowerFlames[_loc48_].y = _loc80_.y;
                     flamethrowerFlames[_loc48_].speed = 0;
                  }
                  flamethrowerFlames[_loc48_].squareX = Math.floor(flamethrowerFlames[_loc48_].x / squareWidth);
                  flamethrowerFlames[_loc48_].squareY = Math.floor(flamethrowerFlames[_loc48_].y / squareHeight);
                  _loc2_ = flamethrowerFlames[_loc48_].squareX - 1;
                  while(_loc2_ <= flamethrowerFlames[_loc48_].squareX + 1)
                  {
                     _loc15_ = flamethrowerFlames[_loc48_].squareY - 1;
                     while(_loc15_ <= flamethrowerFlames[_loc48_].squareY + 1)
                     {
                        if(_loc2_ >= 0 && _loc2_ < gridWidth && _loc15_ >= 0 && _loc15_ < gridHeight)
                        {
                           if(CharactersMap[_loc2_][_loc15_] is Character && CharactersMap[_loc2_][_loc15_] != flamethrowerFlames[_loc48_].firedBy)
                           {
                              _loc64_ = MathFunctions.CalcDistance(flamethrowerFlames[_loc48_].x,flamethrowerFlames[_loc48_].y,CharactersMap[_loc2_][_loc15_].x,CharactersMap[_loc2_][_loc15_].y);
                              if(_loc64_ < 30)
                              {
                                 burn(CharactersMap[_loc2_][_loc15_],Math.max(70 - Math.pow(_loc64_,0.5) - Math.pow(flamethrowerFlames[_loc48_].frame,0.1) * (1 - CharactersMap[_loc2_][_loc15_].fireResistance / 100),0),flamethrowerFlames[_loc48_].x,flamethrowerFlames[_loc48_].y);
                              }
                           }
                           if(ObstaclesMap[_loc2_][_loc15_] is TransportUnit && (ObstaclesMap[_loc2_][_loc15_].health > 0 || ObstaclesMap[_loc2_][_loc15_].category != 1))
                           {
                              _loc64_ = MathFunctions.CalcDistance(flamethrowerFlames[_loc48_].x,flamethrowerFlames[_loc48_].y,(_loc2_ + 0.5) * squareWidth,(_loc15_ + 0.5) * squareHeight);
                              ObstaclesMap[_loc2_][_loc15_].lastHitDamage += (70 - Math.pow(_loc64_,0.5) - Math.pow(flamethrowerFlames[_loc48_].frame,0.5)) * Math.max((100 - ObstaclesMap[_loc2_][_loc15_].fireResistance) * 0.00003,0);
                              ObstaclesMap[_loc2_][_loc15_].hitInThisTurn = true;
                           }
                        }
                        _loc15_++;
                     }
                     _loc2_++;
                  }
                  if(flamethrowerFlames[_loc48_].frame < 20)
                  {
                     flamethrowerFlames[_loc48_].speed *= 1.1;
                  }
                  else
                  {
                     flamethrowerFlames[_loc48_].speed *= 0.9;
                  }
                  _loc26_ = map2Screen(flamethrowerFlames[_loc48_].x,flamethrowerFlames[_loc48_].y);
                  _loc34_ = _loc26_.x - 50;
                  _loc33_ = _loc26_.y - 90;
                  if(flamethrowerFlames[_loc48_].frame <= 45 && _loc34_ + MobilePart.x > -100 && _loc34_ + MobilePart.x < screenWidth + 100 && _loc33_ + MobilePart.y > -100 && _loc33_ + MobilePart.y < screenHeight + 100)
                  {
                     flamethrowerFlames[_loc48_].ownContainer = new Bitmap(flamethrowerFlameBitmaps[flamethrowerFlames[_loc48_].frame]);
                     flamethrowerFlames[_loc48_].ownContainer.x = _loc34_ + AnimationData.spriteBoundaries["FlamethrowerFlame"][0][0][flamethrowerFlames[_loc48_].frame].x;
                     flamethrowerFlames[_loc48_].ownContainer.y = _loc33_ + AnimationData.spriteBoundaries["FlamethrowerFlame"][0][0][flamethrowerFlames[_loc48_].frame].y;
                     _loc36_.push(flamethrowerFlames[_loc48_]);
                  }
               }
            }
            for(_loc48_ in Characters)
            {
               if(Characters[_loc48_].FTBurstTotal > 0 && flamethrowerFlames.length == 0)
               {
                  Characters[_loc48_].lastHitDamage = Math.round(Characters[_loc48_].lastHitDamage + Characters[_loc48_].FTBurstTotal);
                  Characters[_loc48_].FTBurstTotal = 0;
                  Characters[_loc48_].hitByFlame = true;
               }
               if(Characters[_loc48_].hitInThisTurn && Characters[_loc48_].lastHitDamage < 0.5 && !flamethrowerInAction)
               {
                  generateMessage(Characters[_loc48_],"no damage hit");
               }
               Characters[_loc48_].hitInThisTurn = false;
               if(Characters[_loc48_].lastHitDamage >= 0.5)
               {
                  if(flamethrowerFlames.length == 0)
                  {
                     Hit(Characters[_loc48_],Math.round(Characters[_loc48_].lastHitDamage),Characters[_loc48_].hitFrom.x,Characters[_loc48_].hitFrom.y,!Characters[_loc48_].hitByFlame);
                  }
                  else
                  {
                     Characters[_loc48_].FTBurstTotal += Characters[_loc48_].lastHitDamage;
                  }
               }
               Characters[_loc48_].lastHitDamage = 0;
               Characters[_loc48_].hitByFlame = false;
            }
            for(_loc48_ in Transport)
            {
               if(Transport[_loc48_].FTBurstTotal > 0 && flamethrowerFlames.length == 0)
               {
                  Transport[_loc48_].lastHitDamage = Math.round(Transport[_loc48_].lastHitDamage + Transport[_loc48_].FTBurstTotal);
                  Transport[_loc48_].FTBurstTotal = 0;
               }
               if(Transport[_loc48_].lastHitDamage >= 0.5)
               {
                  if(flamethrowerFlames.length == 0)
                  {
                     generateMessage(Transport[_loc48_],"got hit",Math.round(Transport[_loc48_].lastHitDamage));
                     Transport[_loc48_].health -= Math.round(Transport[_loc48_].lastHitDamage);
                     if(Transport[_loc48_].health <= 0 && Transport[_loc48_].category == 1)
                     {
                        generateMessage(Transport[_loc48_],"die");
                     }
                     if(Transport[_loc48_].category == 1)
                     {
                        if(Transport[_loc48_].health > 0)
                        {
                           if(Transport[_loc48_].cart is TransportUnit)
                           {
                              Transport[_loc48_].frame = 31;
                           }
                           else
                           {
                              Transport[_loc48_].frame = 2;
                           }
                        }
                        else if(Transport[_loc48_].cart is TransportUnit)
                        {
                           Transport[_loc48_].frame = 39;
                        }
                        else
                        {
                           Transport[_loc48_].frame = 10;
                        }
                     }
                  }
                  else
                  {
                     Transport[_loc48_].FTBurstTotal += Transport[_loc48_].lastHitDamage;
                  }
               }
               Transport[_loc48_].lastHitDamage = 0;
               Transport[_loc48_].hitInThisTurn = false;
            }
            for(_loc48_ in activeExplosions)
            {
               activeExplosions[_loc48_].frame++;
               if(activeExplosions[_loc48_].frame25)
               {
                  activeExplosions.splice(_loc48_,1);
                  _loc48_--;
               }
               else if(activeExplosions[_loc48_].frame <= 24 && activeExplosions[_loc48_].screenX + MobilePart.x > -350 && activeExplosions[_loc48_].screenX + MobilePart.x < screenWidth && activeExplosions[_loc48_].screenY + MobilePart.y > -250 && activeExplosions[_loc48_].screenY + MobilePart.y < screenHeight)
               {
                  try
                  {
                     _loc11_ = AnimationData.getSprite("Explosion",0,0,activeExplosions[_loc48_].frame);
                     activeExplosions[_loc48_].ownContainer = new Bitmap(_loc11_);
                     activeExplosions[_loc48_].ownContainer.x = activeExplosions[_loc48_].screenX + AnimationData.spriteBoundaries["Explosion"][0][0][activeExplosions[_loc48_].frame].x;
                     activeExplosions[_loc48_].ownContainer.y = activeExplosions[_loc48_].screenY + AnimationData.spriteBoundaries["Explosion"][0][0][activeExplosions[_loc48_].frame].y;
                     _loc36_.push(activeExplosions[_loc48_]);
                  }
                  catch(error:Error)
                  {
                     trace("can\'t create new bitmap data. " + error.name + " (" + error.errorID + "): " + error.message);
                  }
                  continue;
               }
            }
            if(cameraShakePower != 0)
            {
               MobilePart.x += cameraShakePower;
               cameraShift += cameraShakePower;
               cameraShakePower = 0 - cameraShift * 1.8;
               if(Math.abs(cameraShakePower) < 0.01 && Math.abs(cameraShift) < 0.1)
               {
                  cameraShakePower = 0;
               }
            }
            _loc36_ = screenSort(_loc36_);
            Visible = _loc37_.concat(_loc36_);
            for(_loc48_ in Visible)
            {
               if(Visible[_loc48_] is Character)
               {
                  if(Visible[_loc48_].startAtRenderSprite != 0)
                  {
                     Visible[_loc48_].ownContainer.bitmapData.copyPixels(Visible[_loc48_].renderAnimation(),new Rectangle(0,0,100,100),new Point(0,0),null,null,true);
                  }
                  else if(Visible[_loc48_].currSlot != Visible[_loc48_].lastSlot || Visible[_loc48_].direction != Visible[_loc48_].lastDirection || Visible[_loc48_].animationPhase != Visible[_loc48_].lastAnimationPhase || Visible[_loc48_].currFrame != Visible[_loc48_].lastFrame || Visible[_loc48_].currentWeaponAnimationType != Visible[_loc48_].lastAnimationType)
                  {
                     if(Visible[_loc48_].ownContainer is Bitmap && Visible[_loc48_].ownContainer.bitmapData is BitmapData)
                     {
                        Visible[_loc48_].ownContainer.bitmapData.dispose();
                     }
                     Visible[_loc48_].ownContainer = new Bitmap(Visible[_loc48_].renderAnimation());
                     Visible[_loc48_].lastSlot = Visible[_loc48_].currSlot;
                     Visible[_loc48_].lastDirection = Visible[_loc48_].direction;
                     Visible[_loc48_].lastAnimationPhase = Visible[_loc48_].animationPhase;
                     Visible[_loc48_].lastFrame = Visible[_loc48_].currFrame;
                     Visible[_loc48_].lastAnimationType = Visible[_loc48_].currentWeaponAnimationType;
                  }
                  Visible[_loc48_].ownContainer.x = Visible[_loc48_].screenX - 50;
                  Visible[_loc48_].ownContainer.y = Visible[_loc48_].screenY - 70;
                  _loc89_ = Visible[_loc48_].currentWeaponAnimationType;
                  try
                  {
                     _loc35_ = AnimationData.fullAnimationTypeFrames[_loc89_][Visible[_loc48_].animationPhase][Visible[_loc48_].currFrame].shadow;
                     Visible[_loc48_].Shadow = new Bitmap(AnimationData.getSprite("Shadows",1,Visible[_loc48_].direction,_loc35_));
                     Visible[_loc48_].Shadow.x = Visible[_loc48_].screenX - 50 + AnimationData.spriteBoundaries["Shadows"][1][Visible[_loc48_].direction][_loc35_].x;
                     Visible[_loc48_].Shadow.y = Visible[_loc48_].screenY - 70 + AnimationData.spriteBoundaries["Shadows"][1][Visible[_loc48_].direction][_loc35_].y;
                  }
                  catch(e:Error)
                  {
                     trace("shadowFrame=AnimationData.fullAnimationTypeFrames[" + _loc89_ + "][" + Visible[_loc48_].animationPhase + "][" + Visible[_loc48_].currFrame + "].shadow = " + _loc35_);
                  }
               }
               Interlacing.addChild(Visible[_loc48_].ownContainer);
               if(Visible[_loc48_] is Character && Visible[_loc48_].burning > 0 && Visible[_loc48_].animationPhase != 4)
               {
                  Visible[_loc48_].bodyFlame = new Bitmap();
                  Visible[_loc48_].bodyFlame.bitmapData = AnimationData.getSprite("BodyBurn",0,0,Visible[_loc48_].burnFrame);
                  Visible[_loc48_].bodyFlame.x = Visible[_loc48_].ownContainer.x + 50 - Math.round(AnimationData.spriteBoundaries["BodyBurn"][0][0][Visible[_loc48_].burnFrame].width / 2);
                  Visible[_loc48_].bodyFlame.y = Visible[_loc48_].ownContainer.y + 30 - Math.round(AnimationData.spriteBoundaries["BodyBurn"][0][0][Visible[_loc48_].burnFrame].height / 2);
                  Interlacing.addChild(Visible[_loc48_].bodyFlame);
                  Visible[_loc48_].burnFrame++;
                  if(Visible[_loc48_].burnFrame > 40)
                  {
                     Visible[_loc48_].burnFrame = 1;
                  }
               }
               if(Visible[_loc48_].Shadow is DisplayObject)
               {
                  Shadows.addChild(Visible[_loc48_].Shadow);
               }
               if(Visible[_loc48_] is Obstacle)
               {
                  if(Visible[_loc48_].hitFrame > 0)
                  {
                     _loc42_ = new Bitmap(AnimationData.getSprite("ShotSmoke",0,0,Visible[_loc48_].hitFrame));
                     _loc26_ = map2Screen(Visible[_loc48_].hitX,Visible[_loc48_].hitY);
                     _loc42_.x = _loc26_.x - 10 + AnimationData.spriteBoundaries["ShotSmoke"][0][0][Visible[_loc48_].hitFrame].x;
                     _loc42_.y = _loc26_.y - 40 + AnimationData.spriteBoundaries["ShotSmoke"][0][0][Visible[_loc48_].hitFrame].y;
                     Interlacing.addChild(_loc42_);
                     if(!Visible[_loc48_].outerHit)
                     {
                        Interlacing.swapChildren(_loc42_,Visible[_loc48_].ownContainer);
                     }
                     Visible[_loc48_].hitFrame++;
                     if(Visible[_loc48_].hitFrame > 12)
                     {
                        Visible[_loc48_].hitFrame = 0;
                     }
                  }
               }
               if(Visible[_loc48_] is Character)
               {
                  if(Visible[_loc48_].bloodDrops.length > 0)
                  {
                     for(_loc49_ in Visible[_loc48_].bloodDrops)
                     {
                        _loc26_ = map2Screen(Visible[_loc48_].bloodDrops[_loc49_].x,Visible[_loc48_].bloodDrops[_loc49_].y);
                        Visible[_loc48_].bloodDrops[_loc49_].container.x = _loc26_.x;
                        Visible[_loc48_].bloodDrops[_loc49_].container.y = _loc26_.y - Visible[_loc48_].bloodDrops[_loc49_].z;
                        if(Visible[_loc48_].bloodDrops[_loc49_].container.x + Visible[_loc48_].bloodDrops[_loc49_].container.y < Visible[_loc48_].x + Visible[_loc48_].y)
                        {
                           Interlacing.addChildAt(Visible[_loc48_].bloodDrops[_loc49_].container,Interlacing.getChildIndex(Visible[_loc48_].ownContainer));
                        }
                        else
                        {
                           Interlacing.addChild(Visible[_loc48_].bloodDrops[_loc49_].container);
                        }
                     }
                  }
               }
            }
            MobilePart.addChildAt(Shadows,4);
            MobilePart.addChildAt(Interlacing,6);
            if(nowActing == -1)
            {
               nextTurn();
            }
            if(paused)
            {
               return;
            }
            if(phase != 0)
            {
               if(leftPressed)
               {
                  moveScreen(-15,0);
               }
               if(rightPressed)
               {
                  moveScreen(15,0);
               }
               if(upPressed)
               {
                  moveScreen(0,-15);
               }
               if(downPressed)
               {
                  moveScreen(0,15);
               }
               var _loc45_:Boolean = false;
               if(mouseOnScreen)
               {
                  if(mouseX < 40 || mouseY < 40 || mouseX > screenWidth - 40 || mouseY > screenHeight - 40)
                  {
                     if(timeSpentOnMargin == 0)
                     {
                        beforeMoveScreenX = MobilePart.x;
                        beforeMoveScreenY = MobilePart.y;
                     }
                     timeSpentOnMargin = Number(timeSpentOnMargin) + 1;
                     if(timeSpentOnMargin > 30)
                     {
                        timeSpentOnMargin = 30;
                     }
                     _loc74_ = MathFunctions.CalcAngle(screenWidth / 2,screenHeight / 2,mouseX,mouseY);
                     moveScreen(Math.sin(_loc74_) * timeSpentOnMargin,Math.cos(_loc74_) * timeSpentOnMargin);
                  }
                  else
                  {
                     _loc45_ = true;
                  }
               }
               else
               {
                  _loc45_ = true;
               }
               if(_loc45_ && timeSpentOnMargin > 0)
               {
                  if(timeSpentOnMargin < 5)
                  {
                     viewTargetX = beforeMoveScreenX;
                     viewTargetY = beforeMoveScreenY;
                  }
                  timeSpentOnMargin = 0;
               }
            }
            Float.visible = inControl();
            if(Float.visible)
            {
               Float.x = ActList[nowActing].screenX;
               FloatHeight += FloatSpeed;
               if(FloatHeight < 0)
               {
                  FloatHeight = 0;
                  FloatSpeed = 0 - FloatSpeed;
               }
               else
               {
                  FloatSpeed -= 0.1;
               }
               Float.y = ActList[nowActing].screenY - 55 - FloatHeight;
            }
            if(inControl())
            {
               if(phase == 1 && mouseOnScreen)
               {
                  _loc26_ = screen2Map(mouseX - MobilePart.x,mouseY - MobilePart.y);
                  _loc93_ = Math.floor(_loc26_.x / squareWidth);
                  _loc94_ = Math.floor(_loc26_.y / squareHeight);
                  _loc39_ = null;
                  if(shiftPressed)
                  {
                     for(_loc48_ in Visible)
                     {
                        Visible[_loc48_].ownContainer.alpha = 0.5;
                     }
                  }
                  else if(healingMode || ActList[nowActing].currentWeaponType.category != 5)
                  {
                     if(Visible is Array && Visible.length > 0)
                     {
                        _loc48_ = Visible.length - 1;
                        while(_loc48_ >= 0)
                        {
                           if(stage != null && (Visible[_loc48_] is Character || Visible[_loc48_] is TransportUnit) && !Visible[_loc48_].dead && Visible[_loc48_].ownContainer is Bitmap && Visible[_loc48_].ownContainer.hitTestPoint(stage.mouseX,stage.mouseY,false))
                           {
                              if(Visible[_loc48_].ownContainer.bitmapData.hitTest(new Point(0,0),2,new Point(Visible[_loc48_].ownContainer.mouseX,Visible[_loc48_].ownContainer.mouseY)))
                              {
                                 if(!(!(Visible[_loc48_] is Character) || MathFunctions.XOR(ActList[nowActing].IFF(Visible[_loc48_]),healingMode)))
                                 {
                                    _loc39_ = _loc48_;
                                    break;
                                 }
                                 Visible[_loc48_].ownContainer.alpha = 0.5;
                              }
                           }
                           _loc48_--;
                        }
                     }
                     if(!healingMode && _loc39_ == null && _loc93_ >= 0 && _loc93_ < gridWidth && _loc94_ >= 0 && _loc94_ < gridHeight && CharactersMap[_loc93_][_loc94_] is Character)
                     {
                        if(!ActList[nowActing].IFF(CharactersMap[_loc93_][_loc94_]))
                        {
                           for(_loc48_ in Visible)
                           {
                              if(Visible[_loc48_] == CharactersMap[_loc93_][_loc94_])
                              {
                                 _loc39_ = _loc48_;
                                 break;
                              }
                           }
                        }
                        else
                        {
                           CharactersMap[_loc93_][_loc94_].ownContainer.alpha = 1;
                           cursorText.text = CharactersMap[_loc93_][_loc94_].name;
                        }
                     }
                  }
                  if(_loc39_ != null)
                  {
                     if(ActList[nowActing].IFF(Visible[_loc39_]))
                     {
                        cursorText.text = Visible[_loc39_].name;
                        if(healingMode)
                        {
                           Visible[_loc39_].ownContainer.filters = [selectedGlow];
                           if(Math.abs(ActList[nowActing].squareX - Visible[_loc39_].squareX) + Math.abs(ActList[nowActing].squareY - Visible[_loc39_].squareY) <= 1)
                           {
                              if(Visible[_loc39_].bleeding >= 0.5)
                              {
                                 if(ActList[nowActing].AP >= ActList[nowActing].healAP)
                                 {
                                    currCursor = 5;
                                    cursorText.text += "\n" + Texts.fetch(49) + ": " + Math.round(Visible[_loc39_].bleeding);
                                    cursorText.text += "\n" + Texts.fetch(50) + ": " + Math.round(Visible[_loc39_].HP);
                                    cursorText.text += "\n" + Texts.fetch(51).replace("@points@",Math.round(ActList[nowActing].firstAidSkill / 100 * Item.getDataFromType(ActList[nowActing].selectedFirstAidType).heal)) + " (" + ActList[nowActing].healAP + " " + Texts.fetch(1095) + ")";
                                    if(mousePressed)
                                    {
                                       mousePressed = false;
                                       heal(Visible[_loc39_]);
                                    }
                                 }
                                 else
                                 {
                                    cursorText.text += "\n" + Texts.fetch(52);
                                    currCursor = 4;
                                 }
                              }
                              else
                              {
                                 cursorText.text += "\n" + Texts.fetch(53);
                                 currCursor = 4;
                              }
                           }
                           else
                           {
                              cursorText.text += "\n" + Texts.fetch(54);
                              currCursor = 4;
                           }
                        }
                     }
                     else
                     {
                        currCursor = 2;
                        Visible[_loc39_].ownContainer.filters = [selectedGlow];
                        _loc64_ = MathFunctions.CalcDistance(ActList[nowActing].squareX,ActList[nowActing].squareY,Visible[_loc39_].squareX,Visible[_loc39_].squareY);
                        if(_loc64_ > WeaponsData.Weapons[ActList[nowActing].weapons[ActList[nowActing].currSlot]].range)
                        {
                           cursorText.text = Texts.fetch(54);
                           currCursor = 4;
                        }
                        else if(ActList[nowActing].AP < ActList[nowActing].weaponModeAP())
                        {
                           cursorText.text = Texts.fetch(52);
                           currCursor = 4;
                        }
                        else if((ActList[nowActing].currentWeaponType.category == 2 || ActList[nowActing].currentWeaponType.category == 3 || ActList[nowActing].currentWeaponType.category == 4) && (ActList[nowActing].currentAmmo == undefined || ActList[nowActing].currentAmmo.amount == 0))
                        {
                           cursorText.text = Texts.fetch(55);
                           currCursor = 4;
                        }
                        else
                        {
                           _loc8_ = calculateHitChance(ActList[nowActing],Visible[_loc39_]);
                           if(_loc8_ == 0)
                           {
                              cursorText.text = Texts.fetch(56);
                              currCursor = 4;
                           }
                           else if(ActList[nowActing].currentWeaponType.category == 4)
                           {
                              cursorText.text = Texts.fetch(57);
                           }
                           else
                           {
                              if(_loc8_ >= 0.99 && _loc8_ < 1)
                              {
                                 cursorText.text = Texts.fetch(58) + ": 99%";
                              }
                              else if(_loc8_ < 0.01)
                              {
                                 cursorText.text = Texts.fetch(58) + ": < 1%";
                              }
                              else
                              {
                                 cursorText.text = Texts.fetch(58) + ": " + Math.round(_loc8_ * 100) + "%";
                              }
                              if(Visible[_loc39_].battleMorale <= 8)
                              {
                                 cursorText.text += "\n" + Texts.fetch(6897,Visible[_loc39_].gender);
                              }
                           }
                           if(mousePressed)
                           {
                              if(ActList[nowActing].currentWeaponType.category <= 1 || aimAngle != null)
                              {
                                 phase = 2;
                                 startAttack(ActList[nowActing],Visible[_loc39_]);
                                 mousePressed = false;
                              }
                           }
                        }
                     }
                  }
                  else if(inControl() && (!healingMode || shiftPressed) && !ctrlPressed)
                  {
                     if(ActList[nowActing].currentWeaponType.category == 5 && !shiftPressed && !healingMode)
                     {
                        _loc26_ = screen2Map(MobilePart.mouseX,MobilePart.mouseY);
                        _loc46_ = ActList[nowActing].maxThrowDistance(initialGrenadeHeight,grenadeAngle);
                        _loc3_ = MathFunctions.CalcDistance(ActList[nowActing].x,ActList[nowActing].y,_loc26_.x,_loc26_.y);
                        if(ActList[nowActing].weaponModeAP() <= ActList[nowActing].AP)
                        {
                           if(_loc3_ / 32 <= _loc46_)
                           {
                              currCursor = 6;
                              cursorText.text = Texts.fetch(59);
                              if(mousePressed)
                              {
                                 phase = 2;
                                 ActList[nowActing].applyPhaseAndFrame = {
                                    "phase":2,
                                    "frame":1
                                 };
                                 ActList[nowActing].lookAt(_loc26_.x,_loc26_.y);
                                 ActList[nowActing].reduceAP(ActList[nowActing].weaponModeAP());
                                 ActList[nowActing].throwGrenadeAt = {
                                    "x":_loc26_.x,
                                    "y":_loc26_.y
                                 };
                                 mousePressed = false;
                                 updateInterface();
                              }
                           }
                           else
                           {
                              currCursor = 4;
                              cursorText.text = Texts.fetch(54);
                           }
                        }
                        else
                        {
                           currCursor = 4;
                           cursorText.text = Texts.fetch(52);
                        }
                        cursorText.text += "\n" + Texts.fetch(60);
                     }
                     else if(_loc93_ >= 0 && _loc93_ < gridWidth && _loc94_ >= 0 && _loc94_ < gridHeight && !ASMap.Map[_loc93_][_loc94_] && !(_loc93_ == ActList[nowActing].squareX && _loc94_ == ActList[nowActing].squareY))
                     {
                        currCursor = 3;
                        if(Math.abs(_loc93_ - ActList[nowActing].squareX) + Math.abs(_loc94_ - ActList[nowActing].squareY) > 500)
                        {
                           cursorText.text = Texts.fetch(61);
                        }
                        else
                        {
                           if(prevSolX != _loc93_ || prevSolY != _loc94_)
                           {
                              ASSolution = ASMap.findPath(ActList[nowActing].squareX,ActList[nowActing].squareY,_loc93_,_loc94_);
                              prevSolX = _loc93_;
                              prevSolY = _loc94_;
                           }
                           ASMap.Map[ActList[nowActing].squareX][ActList[nowActing].squareY] = 1;
                           if(!(ASSolution is Array) || ASSolution.length == 0)
                           {
                              cursorText.text = Texts.fetch(62);
                           }
                           else
                           {
                              Path = convertAStoPath(ASSolution);
                              for(_loc48_ in Path)
                              {
                                 Path[_loc48_].sprite = new Bitmap(groundMarksBitmaps[Path[_loc48_].direction]);
                                 _loc26_ = map2Screen(Path[_loc48_].x * squareWidth,Path[_loc48_].y * squareHeight);
                                 Path[_loc48_].sprite.x = _loc26_.x + squareBoxShiftX;
                                 Path[_loc48_].sprite.y = _loc26_.y + squareBoxShiftY;
                                 GroundMarks.addChild(Path[_loc48_].sprite);
                              }
                              if(Path.length <= Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP))
                              {
                                 cursorText.text = Path.length * ActList[nowActing].walkAP + " " + Texts.fetch(1095).toUpperCase();
                              }
                              else
                              {
                                 cursorText.text = Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP) * ActList[nowActing].walkAP + " " + Texts.fetch(1095).toUpperCase() + " (" + Texts.fetch(63) + ")";
                              }
                              if(mousePressed && ActList[nowActing].AP >= ActList[nowActing].walkAP)
                              {
                                 prevSolX = prevSolY = null;
                                 beginWalk();
                                 mousePressed = false;
                              }
                           }
                        }
                     }
                  }
               }
               if(healingMode && !shiftPressed && currCursor == 0)
               {
                  cursorText.text = Texts.fetch(64);
                  if(mousePressed && mouseOnScreen)
                  {
                     healingMode = false;
                     mousePressed = false;
                     updateInterface();
                  }
               }
            }
            else if(!ActList[nowActing].controlled)
            {
               _loc44_ = new Date();
               var _loc16_:Boolean = ActList[nowActing].squaresToProcess.length > 0;
               if(ActList[nowActing].runningAway)
               {
                  while(ActList[nowActing].squaresToProcess.length > 0)
                  {
                     _loc47_ = ActList[nowActing].squaresToProcess.pop();
                     _loc82_ = 0;
                     _loc82_ = _loc82_ - dangerScoreReduction(ActList[nowActing],_loc47_) * ActList[nowActing].enemies.length * 10;
                     if(_loc82_ > ActList[nowActing].maxScore)
                     {
                        ActList[nowActing].maxScore = _loc82_;
                        ActList[nowActing].selectedSquare = _loc47_;
                     }
                     _loc59_ = new Date();
                     if(_loc59_ - _loc44_ > 30)
                     {
                        break;
                     }
                  }
                  if(_loc16_ && ActList[nowActing].squaresToProcess.length == 0)
                  {
                     if(ActList[nowActing].selectedSquare == null)
                     {
                        ActList[nowActing].AICue = [{"action":0}];
                     }
                     else
                     {
                        ActList[nowActing].AICue = [{
                           "action":1,
                           "x":ActList[nowActing].selectedSquare.x,
                           "y":ActList[nowActing].selectedSquare.y
                        },{"action":0}];
                     }
                  }
               }
               else
               {
                  if(ActList[nowActing].onlyWalk)
                  {
                     while(ActList[nowActing].squaresToProcess.length > 0)
                     {
                        _loc47_ = ActList[nowActing].squaresToProcess.pop();
                        _loc28_ = ASMap.findPath(_loc47_.x,_loc47_.y,ActList[nowActing].destX,ActList[nowActing].destY);
                        if(_loc28_ is Array && _loc28_.length > 0)
                        {
                           _loc47_.score = 100 / _loc28_.length;
                        }
                        else
                        {
                           _loc47_.score = 0;
                        }
                        if(_loc47_.score > ActList[nowActing].maxScore)
                        {
                           ActList[nowActing].maxScore = _loc47_.score;
                           ActList[nowActing].targetX = _loc47_.x;
                           ActList[nowActing].targetY = _loc47_.y;
                        }
                        _loc59_ = new Date();
                        if(_loc59_ - _loc44_ > 30)
                        {
                           break;
                        }
                     }
                     if(_loc16_ && ActList[nowActing].squaresToProcess.length == 0 && ActList[nowActing].currentWeaponType.category != 0 && ActList[nowActing].currentWeaponType.category != 1)
                     {
                        if(ActList[nowActing].targetX != undefined && ActList[nowActing].targetY != undefined)
                        {
                           ActList[nowActing].AICue = [{
                              "action":1,
                              "x":ActList[nowActing].targetX,
                              "y":ActList[nowActing].targetY
                           }];
                        }
                        ActList[nowActing].onlyWalk = false;
                        ActList[nowActing].AICue.push({"action":0});
                     }
                  }
                  else
                  {
                     _loc10_ = 0;
                     if(ActList[nowActing].currentWeaponType.category == 2 || ActList[nowActing].currentWeaponType.category == 3 || ActList[nowActing].currentWeaponType.category == 4)
                     {
                        while(ActList[nowActing].squaresToProcess.length > 0)
                        {
                           _loc47_ = ActList[nowActing].squaresToProcess.pop();
                           _loc22_ = 0 - Infinity;
                           _loc69_ = ActList[nowActing].enemies[0];
                           for(_loc48_ in ActList[nowActing].enemies)
                           {
                              _loc55_ = MathFunctions.CalcDistance(_loc47_.x,_loc47_.y,ActList[nowActing].enemies[_loc48_].squareX,ActList[nowActing].enemies[_loc48_].squareY);
                              if(_loc55_ <= ActList[nowActing].maximumRange && _loc55_ >= ActList[nowActing].minimumRange)
                              {
                                 if(_loc55_ > ActList[nowActing].optimalRange)
                                 {
                                    _loc21_ = ActList[nowActing].weaponModeAP(ActList[nowActing].maxAccuracyMode);
                                 }
                                 else
                                 {
                                    _loc21_ = ActList[nowActing].weaponModeAP(ActList[nowActing].minAPMode);
                                 }
                                 if(ActList[nowActing].availableAP - _loc47_.AP * ActList[nowActing].walkAP >= _loc21_)
                                 {
                                    _loc41_ = calculateHitChance(ActList[nowActing],ActList[nowActing].enemies[_loc48_],_loc47_.x,_loc47_.y);
                                    if(ActList[nowActing].enemies[_loc48_].currentWeaponData.price != undefined)
                                    {
                                       _loc41_ *= Math.max(ActList[nowActing].enemies[_loc48_].currentWeaponData.price / 800,1);
                                    }
                                    if(difficulty == 2)
                                    {
                                       _loc41_ *= 100 / Math.max(ActList[nowActing].enemies[_loc48_].HP,1);
                                    }
                                    if(ActList[nowActing].currentWeaponType.category == 3 && ActList[nowActing].currentWeaponType.subCategory == 2 && ActList[nowActing].currentAmmoData is Object)
                                    {
                                       _loc90_ = ActList[nowActing].currentAmmoData.explosiveness * 5;
                                       _loc32_ = Math.ceil(_loc90_ / Math.min(squareWidth,squareHeight));
                                       _loc2_ = ActList[nowActing].enemies[_loc48_].squareX - _loc32_;
                                       while(_loc2_ <= ActList[nowActing].enemies[_loc48_].squareX + _loc32_)
                                       {
                                          _loc15_ = ActList[nowActing].enemies[_loc48_].squareY - _loc32_;
                                          while(_loc15_ <= ActList[nowActing].enemies[_loc48_].squareY + _loc32_)
                                          {
                                             if(_loc2_ >= 0 && _loc2_ < gridWidth && _loc15_ >= 0 && _loc15_ < gridHeight && CharactersMap[_loc2_][_loc15_] is Character && CharactersMap[_loc2_][_loc15_] != ActList[nowActing].enemies[_loc48_])
                                             {
                                                _loc25_ = MathFunctions.CalcDistance(ActList[nowActing].enemies[_loc48_].x,ActList[nowActing].enemies[_loc48_].y,CharactersMap[_loc2_][_loc15_].x,CharactersMap[_loc2_][_loc15_].y);
                                                if(ActList[nowActing].IFF(CharactersMap[_loc2_][_loc15_]))
                                                {
                                                   _loc41_ -= _loc90_ / _loc25_ * 2;
                                                }
                                                else
                                                {
                                                   _loc41_ += _loc90_ / _loc25_;
                                                }
                                             }
                                             _loc15_++;
                                          }
                                          _loc2_++;
                                       }
                                    }
                                    if(ActList[nowActing].currentWeaponType.category == 2 && ActList[nowActing].currentWeaponType.subCategory == 5 || ActList[nowActing].currentWeaponType.category == 4)
                                    {
                                       _loc102_ = MathFunctions.CalcAngle(ActList[nowActing].x,ActList[nowActing].y,ActList[nowActing].enemies[_loc48_].x,ActList[nowActing].enemies[_loc48_].y);
                                       _loc9_ = MathFunctions.CalcDistance(ActList[nowActing].x,ActList[nowActing].y,ActList[nowActing].enemies[_loc48_].x,ActList[nowActing].enemies[_loc48_].y);
                                       for(_loc49_ in ActList[nowActing].friends)
                                       {
                                          _loc54_ = MathFunctions.CalcAngle(ActList[nowActing].x,ActList[nowActing].y,ActList[nowActing].friends[_loc49_].x,ActList[nowActing].friends[_loc49_].y);
                                          _loc70_ = MathFunctions.CalcDistance(ActList[nowActing].x,ActList[nowActing].y,ActList[nowActing].friends[_loc49_].x,ActList[nowActing].friends[_loc49_].y);
                                          _loc24_ = Math.abs(MathFunctions.AngleDifference(_loc102_,_loc54_));
                                          if(_loc24_ < 0.1)
                                          {
                                             if(_loc70_ < _loc9_)
                                             {
                                                _loc41_ -= (0.1 - _loc24_) * 100;
                                             }
                                             else if(_loc70_ < ActList[nowActing].currentWeaponData.range && _loc70_ / _loc9_ < 1.5)
                                             {
                                                _loc41_ -= (0.1 - _loc24_) * 20 * _loc9_ / _loc70_;
                                             }
                                          }
                                       }
                                    }
                                    if(_loc41_ > 0 && _loc41_ > _loc22_)
                                    {
                                       _loc22_ = _loc41_;
                                       _loc69_ = ActList[nowActing].enemies[_loc48_];
                                       _loc95_ = _loc55_;
                                    }
                                 }
                              }
                           }
                           if(_loc22_ > 0)
                           {
                              if(_loc95_ > ActList[nowActing].optimalRange)
                              {
                                 _loc60_ = [{
                                    "mode":ActList[nowActing].maxAccuracyMode,
                                    "AP":ActList[nowActing].weaponModeAP(ActList[nowActing].maxAccuracyMode)
                                 }];
                              }
                              else
                              {
                                 _loc60_ = [];
                                 for(_loc48_ in ActList[nowActing].currentWeaponType.modes)
                                 {
                                    if(_loc48_ != ActList[nowActing].maxDamageMode)
                                    {
                                       _loc60_.push({
                                          "mode":_loc48_,
                                          "AP":ActList[nowActing].weaponModeAP(_loc48_)
                                       });
                                    }
                                 }
                                 _loc60_.sortOn("AP",18);
                                 _loc60_.unshift({
                                    "mode":ActList[nowActing].maxDamageMode,
                                    "AP":ActList[nowActing].weaponModeAP(ActList[nowActing].maxDamageMode)
                                 });
                              }
                              _loc31_ = [];
                              _loc48_ = 0;
                              _loc76_ = ActList[nowActing].availableAP - _loc47_.AP * ActList[nowActing].walkAP;
                              _loc75_ = ActList[nowActing].availableAmmo;
                              while(_loc48_ < _loc60_.length)
                              {
                                 if(_loc31_.length == 0)
                                 {
                                    _loc29_ = 0;
                                 }
                                 else
                                 {
                                    _loc29_ = _loc31_[_loc31_.length - 1].score;
                                 }
                                 if(_loc75_ <= 0)
                                 {
                                    if(_loc76_ < ActList[nowActing].currentWeaponReloadAP)
                                    {
                                       break;
                                    }
                                    _loc76_ -= ActList[nowActing].currentWeaponReloadAP;
                                    _loc31_.push({
                                       "mode":"reload",
                                       "AP":ActList[nowActing].currentWeaponReloadAP,
                                       "score":_loc29_ + 50
                                    });
                                    if(ActList[nowActing].selectedAmmo[ActList[nowActing].currSlot] == null)
                                    {
                                       _loc87_ = 0;
                                    }
                                    else
                                    {
                                       for(_loc49_ in ActList[nowActing].equipment)
                                       {
                                          if(ActList[nowActing].equipment[_loc49_].category == 3 && ActList[nowActing].equipment[_loc49_].subCategory == ActList[nowActing].selectedAmmo[ActList[nowActing].currSlot])
                                          {
                                             _loc87_ = ActList[nowActing].equipment[_loc49_].amount;
                                          }
                                       }
                                    }
                                    _loc75_ = Math.min(ActList[nowActing].weaponAmmoCapacity(),_loc87_);
                                 }
                                 if(_loc60_[_loc48_].AP <= _loc76_)
                                 {
                                    _loc87_ = 1;
                                    if(ActList[nowActing].currentWeaponType.modes[_loc60_[_loc48_].mode].burst > 0)
                                    {
                                       _loc87_ *= ActList[nowActing].currentWeaponType.modes[_loc60_[_loc48_].mode].burst;
                                    }
                                    if(ActList[nowActing].currentWeaponType.modes[_loc60_[_loc48_].mode].parallelShots > 0)
                                    {
                                       _loc87_ *= ActList[nowActing].currentWeaponType.modes[_loc60_[_loc48_].mode].parallelShots;
                                    }
                                    _loc75_ -= _loc87_;
                                    if(ActList[nowActing].currentWeaponType.modes[_loc60_[_loc48_].mode].damageMultiplier > 0)
                                    {
                                       _loc66_ = ActList[nowActing].currentWeaponType.modes[_loc60_[_loc48_].mode].damageMultiplier;
                                    }
                                    else
                                    {
                                       _loc66_ = 1;
                                    }
                                    _loc31_.push({
                                       "mode":_loc60_[_loc48_].mode,
                                       "AP":_loc60_[_loc48_].AP,
                                       "score":_loc29_ + Math.pow(_loc22_,1.5) * _loc87_ * ActList[nowActing].currentWeaponType.modes[_loc60_[_loc48_].mode].accuracy * _loc66_ * 10
                                    });
                                    _loc76_ -= _loc60_[_loc48_].AP;
                                 }
                                 else
                                 {
                                    _loc48_++;
                                 }
                              }
                              _loc76_ = ActList[nowActing].availableAP - _loc47_.AP * ActList[nowActing].walkAP;
                              _loc10_ = 0;
                              _loc78_ = generatePossibleSquares(_loc47_.x,_loc47_.y,Math.floor(_loc76_ / ActList[nowActing].walkAP));
                              _loc4_ = null;
                              _loc48_ = 0;
                              while(_loc48_ < _loc31_.length)
                              {
                                 _loc76_ -= _loc31_[_loc48_].AP;
                                 _loc10_ = _loc31_[_loc48_].score;
                                 for(_loc49_ in _loc78_)
                                 {
                                    if(_loc78_[_loc49_].AP * ActList[nowActing].walkAP <= _loc76_)
                                    {
                                       _loc91_ = _loc10_;
                                       if(_loc91_ > ActList[nowActing].maxScore)
                                       {
                                          ActList[nowActing].maxScore = _loc91_;
                                          _loc4_ = _loc48_;
                                          ActList[nowActing].destX = _loc78_[_loc49_].x;
                                          ActList[nowActing].destY = _loc78_[_loc49_].y;
                                          ActList[nowActing].walkToX = _loc47_.x;
                                          ActList[nowActing].walkToY = _loc47_.y;
                                          ActList[nowActing].theVictim = _loc69_;
                                       }
                                    }
                                 }
                                 _loc48_++;
                              }
                              if(_loc4_ != null)
                              {
                                 ActList[nowActing].shotSequence = [];
                                 _loc49_ = 0;
                                 while(_loc49_ <= _loc4_)
                                 {
                                    ActList[nowActing].shotSequence.push(_loc31_[_loc49_].mode);
                                    _loc49_++;
                                 }
                              }
                           }
                           _loc59_ = new Date();
                           if(_loc59_ - _loc44_ > 30)
                           {
                              break;
                           }
                        }
                        if(_loc16_ && ActList[nowActing].squaresToProcess.length == 0)
                        {
                           if(ActList[nowActing].walkToX != null)
                           {
                              ActList[nowActing].AICue.push({
                                 "action":1,
                                 "x":ActList[nowActing].walkToX,
                                 "y":ActList[nowActing].walkToY
                              });
                              for(_loc48_ in ActList[nowActing].shotSequence)
                              {
                                 if(ActList[nowActing].shotSequence[_loc48_] == "reload")
                                 {
                                    ActList[nowActing].AICue.push({"action":3});
                                 }
                                 else
                                 {
                                    ActList[nowActing].AICue.push({
                                       "action":2,
                                       "victim":ActList[nowActing].theVictim,
                                       "mode":ActList[nowActing].shotSequence[_loc48_]
                                    });
                                 }
                              }
                              if(ActList[nowActing].walkToX != ActList[nowActing].destX || ActList[nowActing].walkToY != ActList[nowActing].destY)
                              {
                                 ActList[nowActing].AICue.push({
                                    "action":1,
                                    "x":ActList[nowActing].destX,
                                    "y":ActList[nowActing].destY
                                 });
                              }
                              ActList[nowActing].AICue.push({"action":0});
                           }
                           else
                           {
                              _loc57_ = Infinity;
                              _loc69_ = ActList[nowActing].enemies[0];
                              for(_loc48_ in ActList[nowActing].enemies)
                              {
                                 _loc55_ = MathFunctions.CalcDistance(ActList[nowActing].squareX,ActList[nowActing].squareY,ActList[nowActing].enemies[_loc48_].squareX,ActList[nowActing].enemies[_loc48_].squareY);
                                 if(ActList[nowActing].currentWeaponType.category == 3 && ActList[nowActing].currentWeaponType.subCategory == 2 && ActList[nowActing].currentAmmoData is Object)
                                 {
                                    _loc90_ = ActList[nowActing].currentAmmoData.explosiveness * 5;
                                    _loc32_ = Math.ceil(_loc90_ / Math.min(squareWidth,squareHeight));
                                    _loc2_ = ActList[nowActing].enemies[_loc48_].squareX - _loc32_;
                                    while(_loc2_ <= ActList[nowActing].enemies[_loc48_].squareX + _loc32_)
                                    {
                                       _loc15_ = ActList[nowActing].enemies[_loc48_].squareY - _loc32_;
                                       while(_loc15_ <= ActList[nowActing].enemies[_loc48_].squareY + _loc32_)
                                       {
                                          if(_loc2_ >= 0 && _loc2_ < gridWidth && _loc15_ >= 0 && _loc15_ < gridHeight && CharactersMap[_loc2_][_loc15_] is Character && CharactersMap[_loc2_][_loc15_] != ActList[nowActing].enemies[_loc48_] && CharactersMap[_loc2_][_loc15_] != ActList[nowActing])
                                          {
                                             _loc25_ = MathFunctions.CalcDistance(ActList[nowActing].enemies[_loc48_].x,ActList[nowActing].enemies[_loc48_].y,CharactersMap[_loc2_][_loc15_].x,CharactersMap[_loc2_][_loc15_].y);
                                             if(ActList[nowActing].IFF(CharactersMap[_loc2_][_loc15_]))
                                             {
                                                _loc55_ += _loc90_ / _loc25_ * 10;
                                             }
                                             else
                                             {
                                                _loc55_ -= _loc90_ / _loc25_;
                                             }
                                          }
                                          _loc15_++;
                                       }
                                       _loc2_++;
                                    }
                                 }
                                 if(_loc55_ < _loc57_)
                                 {
                                    _loc57_ = _loc55_;
                                    _loc69_ = ActList[nowActing].enemies[_loc48_];
                                 }
                              }
                              _loc18_ = findFreeSpot(_loc69_.squareX,_loc69_.squareY,ActList[nowActing].minimumRange + 1);
                              if(_loc18_ == false)
                              {
                                 ActList[nowActing].destX = ActList[nowActing].squareX;
                                 ActList[nowActing].destY = ActList[nowActing].squareY;
                              }
                              else
                              {
                                 ActList[nowActing].destX = _loc18_.x;
                                 ActList[nowActing].destY = _loc18_.y;
                              }
                              ActList[nowActing].AICue = [{
                                 "action":1,
                                 "x":ActList[nowActing].destX,
                                 "y":ActList[nowActing].destY
                              }];
                              ActList[nowActing].AICue.push({"action":0});
                           }
                        }
                     }
                     if(ActList[nowActing].currentWeaponType.category == 5)
                     {
                        while(ActList[nowActing].squaresToProcess.length > 0)
                        {
                           _loc47_ = ActList[nowActing].squaresToProcess.pop();
                           _loc48_ = 0;
                           while(_loc48_ < ActList[nowActing].grenadeSpots.length)
                           {
                              _loc55_ = MathFunctions.CalcDistance(_loc47_.x,_loc47_.y,ActList[nowActing].grenadeSpots[_loc48_].x,ActList[nowActing].grenadeSpots[_loc48_].y);
                              if(_loc55_ >= ActList[nowActing].minimumRange && _loc55_ <= ActList[nowActing].maximumRange)
                              {
                                 _loc10_ = ActList[nowActing].grenadeSpots[_loc48_].score * ActList[nowActing].maximumRange / _loc55_ * 0.5;
                                 _loc58_ = generatePossibleSquares(_loc47_.x,_loc47_.y,Math.floor((ActList[nowActing].maxAP - _loc47_.AP * ActList[nowActing].walkAP - ActList[nowActing].weaponModeAP()) / ActList[nowActing].walkAP));
                                 for(_loc49_ in _loc58_)
                                 {
                                    _loc96_ = _loc10_;
                                    if(_loc96_ > ActList[nowActing].maxScore)
                                    {
                                       ActList[nowActing].maxScore = _loc96_;
                                       ActList[nowActing].walkToX = _loc47_.x;
                                       ActList[nowActing].walkToY = _loc47_.y;
                                       ActList[nowActing].destX = _loc58_[_loc49_].x;
                                       ActList[nowActing].destY = _loc58_[_loc49_].y;
                                       ActList[nowActing].targetX = (ActList[nowActing].grenadeSpots[_loc48_].x + 0.5) * squareWidth;
                                       ActList[nowActing].targetY = (ActList[nowActing].grenadeSpots[_loc48_].y + 0.5) * squareHeight;
                                       ActList[nowActing].remainingAP = ActList[nowActing].maxAP - _loc47_.AP * ActList[nowActing].walkAP - ActList[nowActing].weaponModeAP();
                                       ActList[nowActing].selectedSquare = _loc47_.AP * ActList[nowActing].walkAP;
                                    }
                                 }
                              }
                              _loc48_++;
                           }
                           _loc59_ = new Date();
                           if(_loc59_ - _loc44_ > 30)
                           {
                              break;
                           }
                        }
                        if(_loc16_ && ActList[nowActing].squaresToProcess.length == 0)
                        {
                           if(ActList[nowActing].walkToX != null)
                           {
                              ActList[nowActing].AICue.push({
                                 "action":1,
                                 "x":ActList[nowActing].walkToX,
                                 "y":ActList[nowActing].walkToY
                              });
                              ActList[nowActing].AICue.push({
                                 "action":4,
                                 "x":ActList[nowActing].targetX,
                                 "y":ActList[nowActing].targetY
                              });
                              if(ActList[nowActing].destX != undefined && ActList[nowActing].destY != undefined)
                              {
                                 ActList[nowActing].AICue.push({
                                    "action":1,
                                    "x":ActList[nowActing].destX,
                                    "y":ActList[nowActing].destY
                                 });
                              }
                              ActList[nowActing].AICue.push({"action":0});
                           }
                           else
                           {
                              var _loc67_:Number = -Infinity;
                              for(_loc48_ in ActList[nowActing].grenadeSpots)
                              {
                                 _loc20_ = findFreeSpot(ActList[nowActing].grenadeSpots[_loc48_].x,ActList[nowActing].grenadeSpots[_loc48_].y);
                                 if(_loc20_)
                                 {
                                    _loc53_ = ASMap.findPath(ActList[nowActing].squareX,ActList[nowActing].squareY,_loc20_.x,_loc20_.y);
                                 }
                                 else
                                 {
                                    _loc53_ = null;
                                 }
                                 if(_loc53_ is Array)
                                 {
                                    _loc73_ = ActList[nowActing].grenadeSpots[_loc48_].score / _loc53_.length;
                                 }
                                 else
                                 {
                                    _loc73_ = 0 - Infinity;
                                 }
                                 if(_loc73_ > _loc67_)
                                 {
                                    _loc67_ = _loc73_;
                                    ActList[nowActing].destX = _loc20_.x;
                                    ActList[nowActing].destY = _loc20_.y;
                                 }
                              }
                              if(ActList[nowActing].destX != undefined && ActList[nowActing].destY != undefined)
                              {
                                 ActList[nowActing].AICue = [{
                                    "action":1,
                                    "x":ActList[nowActing].destX,
                                    "y":ActList[nowActing].destY
                                 }];
                              }
                              ActList[nowActing].AICue.push({"action":0});
                           }
                        }
                     }
                  }
                  if((ActList[nowActing].currentWeaponType.category == 0 || ActList[nowActing].currentWeaponType.category == 1) && ActList[nowActing].squaresToProcess.length == 0)
                  {
                     if(_loc16_ && ActList[nowActing].targetX != undefined && ActList[nowActing].targetY != undefined)
                     {
                        ActList[nowActing].AICue = [{
                           "action":1,
                           "x":ActList[nowActing].targetX,
                           "y":ActList[nowActing].targetY
                        }];
                     }
                     while(ActList[nowActing].remainingAP >= ActList[nowActing].weaponModeAP())
                     {
                        ActList[nowActing].AICue.push({
                           "action":2,
                           "victim":ActList[nowActing].theVictim
                        });
                        ActList[nowActing].remainingAP -= ActList[nowActing].weaponModeAP();
                     }
                     if(ActList[nowActing].AICue.length == 0 || ActList[nowActing].AICue.length > 0 && ActList[nowActing].AICue[ActList[nowActing].AICue.length - 1].action != 0)
                     {
                        ActList[nowActing].AICue.push({"action":0});
                     }
                  }
               }
               if(phase == 1)
               {
                  if(ActList[nowActing].AICue.length > 0)
                  {
                     switch((_loc5_ = ActList[nowActing].AICue.shift()).action)
                     {
                        case 0:
                           if(flyingProjectiles.length > 0)
                           {
                              phase = 3;
                           }
                           else
                           {
                              _loc88_ = true;
                           }
                           break;
                        case 1:
                           Path = convertAStoPath(ASMap.findPath(ActList[nowActing].squareX,ActList[nowActing].squareY,_loc5_.x,_loc5_.y));
                           if(Path.length > 0)
                           {
                              beginWalk();
                           }
                           break;
                        case 2:
                           if(_loc5_.victim.HP > 0)
                           {
                              if(_loc5_.mode != undefined)
                              {
                                 ActList[nowActing].currModes[ActList[nowActing].currSlot] = _loc5_.mode;
                              }
                              if(ActList[nowActing].currentWeaponType.category < 2 || ActList[nowActing].currentWeaponType.category >= 2 && ActList[nowActing].currentWeaponType.category <= 4 && ActList[nowActing].currentAmmo.amount > 0 || ActList[nowActing].currentWeaponType.category == 5 && ActList[nowActing].grenadeAmounts[ActList[nowActing].currSlot] > 0)
                              {
                                 phase = 2;
                                 if(ActList[nowActing].currentWeaponType.category > 1 && ActList[nowActing].currentWeaponType.category < 5)
                                 {
                                    aimAngle = aimRanged(ActList[nowActing],_loc5_.victim);
                                    if(aimAngle == null)
                                    {
                                       trace("####################### WARNING. AIM ANGLE IS NULL!!!! ############");
                                       trace("attacker: " + ActList[nowActing].name + ". victim: " + _loc5_.victim.name);
                                       aimAngle = MathFunctions.CalcAngle(ActList[nowActing].x,ActList[nowActing].y,_loc5_.victim.x,_loc5_.victim.y);
                                    }
                                    else
                                    {
                                       aimAngle = aimAngle.aimAngle;
                                    }
                                 }
                                 if(aimAngle != null)
                                 {
                                    if(ActList[nowActing].currentWeaponType.category == 3 && ActList[nowActing].currentWeaponType.subCategory == 2)
                                    {
                                       centerViewOn(_loc5_.victim.x,_loc5_.victim.y);
                                    }
                                 }
                                 startAttack(ActList[nowActing],_loc5_.victim);
                              }
                              else
                              {
                                 trace("problem with ammo");
                              }
                           }
                           break;
                        case 3:
                           trace("executing reload");
                           if(ActList[nowActing].AP >= ActList[nowActing].currentWeaponReloadAP)
                           {
                              reload();
                           }
                           break;
                        case 4:
                           trace("executing throw grenade");
                           if(ActList[nowActing].grenadeAmounts[ActList[nowActing].currSlot] > 0)
                           {
                              phase = 2;
                              ActList[nowActing].applyPhaseAndFrame = {
                                 "phase":2,
                                 "frame":1
                              };
                              ActList[nowActing].lookAt(_loc5_.x,_loc5_.y);
                              ActList[nowActing].reduceAP(ActList[nowActing].weaponModeAP());
                              ActList[nowActing].throwGrenadeAt = {
                                 "x":_loc5_.x,
                                 "y":_loc5_.y
                              };
                              if(autoCenter)
                              {
                                 centerViewOn(_loc5_.x,_loc5_.y);
                              }
                              updateInterface();
                           }
                           else
                           {
                              ActList[nowActing].AICue = [{"action":0}];
                           }
                     }
                  }
               }
            }
         }
         for(_loc48_ in obstaclesOnScreen)
         {
            if(obstaclesOnScreen[_loc48_].ownContainer.bitmapData.hitTest(new Point(0,0),2,new Point(obstaclesOnScreen[_loc48_].ownContainer.mouseX,obstaclesOnScreen[_loc48_].ownContainer.mouseY)))
            {
               obstaclesOnScreen[_loc48_].ownContainer.alpha = 0.7;
            }
            else
            {
               obstaclesOnScreen[_loc48_].ownContainer.alpha = 1;
            }
         }
         if(currCursor == 0)
         {
            Mouse.show();
         }
         else
         {
            Mouse.hide();
            if(currCursor == 6)
            {
               cursors[currCursor].x = MobilePart.mouseX;
               cursors[currCursor].y = MobilePart.mouseY;
            }
            else
            {
               cursors[currCursor].x = mouseX;
               cursors[currCursor].y = mouseY;
            }
         }
         _loc48_ = 1;
         while(_loc48_ < cursors.length)
         {
            cursors[_loc48_].visible = _loc48_ == currCursor;
            _loc48_++;
         }
         cursorTextContainer.visible = cursorText.text.length > 0;
         if(cursorTextContainer.visible)
         {
            cursorTextBG.graphics.clear();
            cursorTextBG.graphics.lineStyle(1,0);
            cursorTextBG.graphics.beginFill(16777215,0.8);
            cursorTextBG.graphics.moveTo(0,0);
            cursorTextBG.graphics.lineTo(cursorText.textWidth + 14,0);
            cursorTextBG.graphics.lineTo(cursorText.textWidth + 14,cursorText.textHeight + 8);
            cursorTextBG.graphics.lineTo(0,cursorText.textHeight + 8);
            cursorTextBG.graphics.endFill();
            if(currCursor == 0)
            {
               if(mouseX + 20 + cursorText.textWidth + 14 <= screenWidth)
               {
                  cursorTextContainer.x = mouseX + 20;
               }
               else
               {
                  cursorTextContainer.x = mouseX - cursorText.textWidth - 24;
               }
               cursorTextContainer.y = mouseY - cursorText.textHeight / 2 + 7;
            }
            else if(currCursor == 2 || currCursor == 5 || currCursor == 4)
            {
               if(mouseX + 15 + cursorText.textWidth + 14 <= screenWidth)
               {
                  cursorTextContainer.x = mouseX + 15;
               }
               else
               {
                  cursorTextContainer.x = mouseX - cursorText.textWidth - 29;
               }
               cursorTextContainer.y = mouseY - 11 - cursorText.textHeight / 2 + 7;
            }
            else if(currCursor == 6)
            {
               if(mouseX + 20 + cursorText.textWidth + 14 <= screenWidth)
               {
                  cursorTextContainer.x = mouseX + 20;
               }
               else
               {
                  cursorTextContainer.x = mouseX - cursorText.textWidth - 34;
               }
               cursorTextContainer.y = mouseY - 11 - cursorText.textHeight / 2 + 7;
            }
            else
            {
               if(mouseX + 30 + cursorText.textWidth + 14 <= screenWidth)
               {
                  cursorTextContainer.x = mouseX + 30;
               }
               else
               {
                  cursorTextContainer.x = mouseX - cursorText.textWidth - 24;
               }
               cursorTextContainer.y = mouseY - cursorText.textHeight / 2 + 7;
            }
         }
         if(ActList[nowActing].AP > ActList[nowActing].maxAP)
         {
            ActList[nowActing].AP = ActList[nowActing].maxAP;
         }
         if(_loc88_)
         {
            nextTurn();
         }
      }
      
      public function burn(param1:*, param2:*, param3:*, param4:*) : *
      {
         param1.lastHitDamage += param2 / 400;
         if(param2 > 0 && param1.burning <= 0)
         {
            if(GameData.soundFXOn)
            {
               param1.flameSoundChannel = new SFXFireLoop().play(0,10000000);
            }
         }
         param1.burning += param2 / 500;
         param1.battleMorale -= param2 / 100;
         param1.hitByFlame = true;
         param1.hitFrom = {
            "x":param3,
            "y":param4
         };
      }
      
      public function screenSort(param1:*) : *
      {
         var _loc6_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc2_:* = undefined;
         var _loc12_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc3_:* = undefined;
         var _loc7_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc15_:Array = [];
         for(_loc5_ in param1)
         {
            if(_loc15_.length == 0)
            {
               _loc15_.push(param1[_loc5_]);
            }
            else
            {
               _loc16_ = param1[_loc5_].x - (param1[_loc5_].width - 1) * squareWidth;
               _loc17_ = param1[_loc5_].x;
               _loc8_ = param1[_loc5_].y - (param1[_loc5_].height - 1) * squareHeight;
               _loc9_ = param1[_loc5_].y;
               _loc14_ = null;
               _loc4_ = [];
               _loc6_ = 0;
               while(_loc6_ < _loc15_.length)
               {
                  _loc2_ = _loc15_[_loc6_].x - (_loc15_[_loc6_].width - 1) * squareWidth;
                  _loc12_ = _loc15_[_loc6_].x;
                  _loc10_ = _loc15_[_loc6_].y - (_loc15_[_loc6_].height - 1) * squareHeight;
                  _loc11_ = _loc15_[_loc6_].y;
                  _loc3_ = _loc16_ >= _loc2_ && _loc16_ <= _loc12_ || _loc17_ >= _loc2_ && _loc17_ <= _loc12_ || _loc2_ >= _loc16_ && _loc12_ <= _loc17_ || _loc12_ >= _loc16_ && _loc12_ <= _loc17_;
                  _loc7_ = _loc8_ >= _loc10_ && _loc8_ <= _loc11_ || _loc9_ >= _loc10_ && _loc9_ <= _loc11_ || _loc10_ >= _loc8_ && _loc10_ <= _loc9_ || _loc11_ >= _loc8_ && _loc11_ <= _loc9_;
                  _loc13_ = false;
                  if(_loc7_ && !_loc3_ && param1[_loc5_].x < _loc15_[_loc6_].x)
                  {
                     _loc13_ = true;
                  }
                  if(_loc3_ && !_loc7_ && param1[_loc5_].y < _loc15_[_loc6_].y)
                  {
                     _loc13_ = true;
                  }
                  if((!_loc3_ && !_loc7_ || _loc3_ && _loc7_) && param1[_loc5_].x + param1[_loc5_].y < _loc15_[_loc6_].x + _loc15_[_loc6_].y)
                  {
                     _loc13_ = true;
                  }
                  if(_loc14_ == null)
                  {
                     if(_loc13_)
                     {
                        _loc14_ = _loc6_;
                     }
                  }
                  else if(!_loc13_)
                  {
                     if(_loc3_ || _loc7_)
                     {
                        _loc4_.push(_loc15_[_loc6_]);
                        _loc15_.splice(_loc6_,1);
                        _loc6_--;
                     }
                  }
                  _loc6_++;
               }
               if(_loc14_ == null)
               {
                  _loc14_ = _loc6_;
               }
               _loc15_.splice(_loc14_,0,param1[_loc5_]);
               for(_loc6_ in _loc4_)
               {
                  _loc15_.splice(_loc14_,0,_loc4_[_loc6_]);
               }
            }
         }
         return _loc15_;
      }
      
      public function nextTurn() : *
      {
         var _loc17_:* = undefined;
         var _loc16_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc23_:* = undefined;
         var _loc11_:* = undefined;
         var _loc7_:* = undefined;
         var _loc2_:* = undefined;
         var _loc22_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc10_:* = undefined;
         var _loc1_:* = undefined;
         var _loc15_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc14_:Boolean = false;
         var _loc25_:* = 0;
         var _loc18_:* = 0;
         centerOnEnemyIndex = 0;
         if(nowActing >= 0 && !ActList[nowActing].dead)
         {
            if(ActList[nowActing].burning >= 0.2)
            {
               Hit(ActList[nowActing],Math.round(ActList[nowActing].burning * 3 * (1 - ActList[nowActing].fireResistance / 100)),null,null,false,3);
               ActList[nowActing].battleMorale -= ActList[nowActing].burning * 10;
               ActList[nowActing].burning *= 0.8;
               if(ActList[nowActing].burning < 0.2)
               {
                  ActList[nowActing].burning = 0;
               }
               if(ActList[nowActing].burning <= 0 && ActList[nowActing].flameSoundChannel)
               {
                  ActList[nowActing].flameSoundChannel.stop();
               }
            }
            if(ActList[nowActing].bleeding >= 0.5 && ActList[nowActing].HP > 0)
            {
               Hit(ActList[nowActing],Math.round(ActList[nowActing].bleeding),null,null,false,2);
               ActList[nowActing].battleMorale -= ActList[nowActing].bleeding * 0.3;
               ActList[nowActing].bleeding *= 0.99;
            }
         }
         for(_loc16_ in ActList)
         {
            if(!ActList[_loc16_].dead && ActList[_loc16_].battleMorale > 8 && ActList[_loc16_].maxAP > 0)
            {
               if(ActList[_loc16_].band == 1)
               {
                  _loc25_++;
               }
               if(ActList[_loc16_].band == 2)
               {
                  _loc18_++;
               }
            }
            if(!ActList[_loc16_].dead && ActList[_loc16_].HP > 0 && ActList[_loc16_].band == 2)
            {
               _loc14_ = true;
            }
         }
         if(_loc25_ == 0)
         {
            trace("loses because allies=0");
            loseTheGame();
            return;
         }
         if(_loc18_ == 0 && _loc14_ && GroupCaravans[0].People[0].HP > 0)
         {
            trace("*************** ALL ENEMIES HAVE PANICKED");
            onAllPanicked();
         }
         prevSolX = prevSolY = undefined;
         var _loc24_:Boolean = false;
         while(true)
         {
            nowActing = Number(nowActing) + 1;
            if(nowActing >= ActList.length)
            {
               nowActing = 0;
               if(_loc24_)
               {
                  break;
               }
               _loc24_ = true;
               turnCounter = Number(turnCounter) + 1;
            }
            ActList[nowActing].controlled = ActList[nowActing].group == 0 && ActList[nowActing].battleMorale > 8 && ActList[nowActing].category < 3;
            if(ActList[nowActing] is Character && !ActList[nowActing].dead && ActList[nowActing].HP > 0 && ActList[nowActing].maxAP > 0 && (ActList[nowActing].maxAP >= ActList[nowActing].walkAP || ActList[nowActing].controlled))
            {
               if(ActList[nowActing].battleMorale <= 8)
               {
                  generateMessage(ActList[nowActing],"panic");
               }
               ActList[nowActing].AICue = [];
               ActList[nowActing].AP = ActList[nowActing].maxAP;
               if(autoCenter)
               {
                  centerViewOn(ActList[nowActing].x,ActList[nowActing].y,false);
               }
               phase = 0;
               healingMode = false;
               if(!ActList[nowActing].controlled)
               {
                  ActList[nowActing].enemies = [];
                  ActList[nowActing].friends = [];
                  ActList[nowActing].onlyWalk = false;
                  if(!ActList[nowActing].currentWeaponIsUsable)
                  {
                     switchWeapon();
                     if(!ActList[nowActing].currentWeaponIsUsable)
                     {
                        dropWeapon();
                     }
                  }
                  for(_loc16_ in ActList)
                  {
                     if(!ActList[_loc16_].dead)
                     {
                        if(ActList[_loc16_].band != 3 && ActList[_loc16_].band != ActList[nowActing].band && ActList[_loc16_].battleMorale > 8)
                        {
                           ActList[nowActing].enemies.push(ActList[_loc16_]);
                        }
                        if(_loc16_ != nowActing && ActList[_loc16_].band == ActList[nowActing].band)
                        {
                           ActList[nowActing].friends.push(ActList[_loc16_]);
                        }
                     }
                  }
                  if(ActList[nowActing].enemies.length == 0)
                  {
                     for(_loc16_ in ActList)
                     {
                        if(!ActList[_loc16_].dead)
                        {
                           if(ActList[_loc16_].band != 3 && ActList[_loc16_].band != ActList[nowActing].band)
                           {
                              ActList[nowActing].enemies.push(ActList[_loc16_]);
                           }
                        }
                     }
                  }
                  if(ActList[nowActing].enemies.length == 0)
                  {
                     nextTurn();
                     return;
                  }
                  if(ActList[nowActing].battleMorale <= 8 || ActList[nowActing].band == 3)
                  {
                     ActList[nowActing].runningAway = true;
                     if(dangerScoreReduction(ActList[nowActing],{
                        "x":ActList[nowActing].squareX,
                        "y":ActList[nowActing].squareY
                     }) <= 30)
                     {
                        ActList[nowActing].AICue = [{"action":0}];
                        nextTurn();
                        return false;
                     }
                     ActList[nowActing].selectedSquare = null;
                     ActList[nowActing].maxScore = 0 - Infinity;
                     ActList[nowActing].squaresToProcess = generatePossibleSquares(ActList[nowActing].squareX,ActList[nowActing].squareY,Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP));
                  }
                  else
                  {
                     ActList[nowActing].runningAway = false;
                     _loc12_ = [];
                     _loc16_ = 0;
                     while(_loc16_ < gridWidth)
                     {
                        _loc12_[_loc16_] = [];
                        _loc16_++;
                     }
                     switch(ActList[nowActing].currentWeaponType.category)
                     {
                        case 0:
                        case 1:
                           var _loc26_:* = Infinity;
                           var _loc6_:* = null;
                           var _loc19_:int = 0;
                           for(_loc16_ in ActList[nowActing].enemies)
                           {
                              if(Math.abs(ActList[nowActing].enemies[_loc16_].squareX - ActList[nowActing].squareX) + Math.abs(ActList[nowActing].enemies[_loc16_].squareY - ActList[nowActing].squareY) == 1)
                              {
                                 _loc6_ = ActList[nowActing].enemies[_loc16_];
                                 ActList[nowActing].destX = ActList[nowActing].squareX;
                                 ActList[nowActing].destY = ActList[nowActing].squareY;
                                 ActList[nowActing].theVictim = ActList[nowActing].enemies[_loc16_];
                                 break;
                              }
                              for(_loc17_ in directions)
                              {
                                 _loc11_ = ActList[nowActing].enemies[_loc16_].squareX + directions[_loc17_][0];
                                 _loc13_ = ActList[nowActing].enemies[_loc16_].squareY + directions[_loc17_][1];
                                 if(_loc11_ >= 0 && _loc11_ < gridWidth && _loc13_ >= 0 && _loc13_ < gridHeight && ASMap.Map[_loc11_][_loc13_] <= 0)
                                 {
                                    _loc23_ = ASMap.findPath(ActList[nowActing].squareX,ActList[nowActing].squareY,_loc11_,_loc13_);
                                    if(_loc23_ is Array && _loc23_.length < _loc26_)
                                    {
                                       _loc26_ = _loc23_.length;
                                       ActList[nowActing].destX = _loc11_;
                                       ActList[nowActing].destY = _loc13_;
                                       ActList[nowActing].theVictim = ActList[nowActing].enemies[_loc16_];
                                    }
                                 }
                              }
                           }
                           if(_loc6_ == null)
                           {
                              if(_loc26_ * ActList[nowActing].walkAP <= ActList[nowActing].AP - ActList[nowActing].weaponModeAP())
                              {
                                 ActList[nowActing].AICue = [{
                                    "action":1,
                                    "x":ActList[nowActing].destX,
                                    "y":ActList[nowActing].destY
                                 }];
                                 ActList[nowActing].remainingAP = ActList[nowActing].AP - _loc26_ * ActList[nowActing].walkAP;
                              }
                              else
                              {
                                 ActList[nowActing].onlyWalk = true;
                                 ActList[nowActing].squaresToProcess = generatePossibleSquares(ActList[nowActing].squareX,ActList[nowActing].squareY,Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP));
                                 ActList[nowActing].maxScore = 0 - Infinity;
                                 ActList[nowActing].remainingAP = 0;
                              }
                           }
                           else
                           {
                              ActList[nowActing].AICue = [];
                              ActList[nowActing].remainingAP = ActList[nowActing].AP;
                           }
                           break;
                        case 2:
                        case 3:
                        case 4:
                           switch(_loc7_ = WeaponsData.detectWeaponSkill(ActList[nowActing].currentWeaponData))
                           {
                              case "pistol":
                              case "rifle":
                              case "machinegun":
                              case "smg":
                              case "crossbow":
                                 ActList[nowActing].minimumRange = 0;
                                 ActList[nowActing].maximumRange = Math.round((10 + ActList[nowActing][_loc7_ + "Skill"] / 15) * ActList[nowActing].currentWeaponData.accuracy * (1 + ActList[nowActing].attachmentsEffects(ActList[nowActing].currSlot).accuracy) / 2.5);
                                 ActList[nowActing].optimalRange = Math.round((5 + ActList[nowActing][_loc7_ + "Skill"] / 30) * ActList[nowActing].currentWeaponData.accuracy * (1 + ActList[nowActing].attachmentsEffects(ActList[nowActing].currSlot).accuracy) / 2.5);
                                 break;
                              case "shotgun":
                                 ActList[nowActing].minimumRange = 0;
                                 ActList[nowActing].maximumRange = Math.round(5 + ActList[nowActing][_loc7_ + "Skill"] / 5);
                                 ActList[nowActing].optimalRange = Math.round(3 + ActList[nowActing][_loc7_ + "Skill"] / 10);
                                 break;
                              case "flamethrower":
                                 ActList[nowActing].minimumRange = 0;
                                 ActList[nowActing].maximumRange = ActList[nowActing].currentWeaponData.range;
                                 ActList[nowActing].optimalRange = Math.round(ActList[nowActing].currentWeaponData.range / 2);
                                 break;
                              case "rocketLauncher":
                                 ActList[nowActing].minimumRange = 5;
                                 ActList[nowActing].maximumRange = Math.round((10 + ActList[nowActing][_loc7_ + "Skill"] / 15) * ActList[nowActing].currentWeaponData.accuracy / 2);
                                 ActList[nowActing].optimalRange = Math.round((5 + ActList[nowActing][_loc7_ + "Skill"] / 30) * ActList[nowActing].currentWeaponData.accuracy / 2);
                           }
                           ActList[nowActing].squaresToProcess = generatePossibleSquares(ActList[nowActing].squareX,ActList[nowActing].squareY,Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP));
                           ActList[nowActing].maxScore = 0 - Infinity;
                           _loc22_ = Infinity;
                           var _loc20_:* = -Infinity;
                           var _loc4_:Number = -Infinity;
                           for(_loc16_ in ActList[nowActing].currentWeaponType.modes)
                           {
                              if(ActList[nowActing].weaponModeAP(_loc16_) < _loc22_)
                              {
                                 _loc22_ = ActList[nowActing].weaponModeAP(_loc16_);
                                 ActList[nowActing].minAPMode = _loc16_;
                              }
                              if(ActList[nowActing].currentWeaponType.modes[_loc16_].accuracy > _loc20_)
                              {
                                 _loc20_ = ActList[nowActing].currentWeaponType.modes[_loc16_].accuracy;
                                 ActList[nowActing].maxAccuracyMode = _loc16_;
                              }
                              _loc2_ = 1;
                              if(ActList[nowActing].currentWeaponType.modes[_loc16_].damageMultiplier > 0)
                              {
                                 _loc2_ *= ActList[nowActing].currentWeaponType.modes[_loc16_].damageMultiplier;
                              }
                              if(ActList[nowActing].currentWeaponType.modes[_loc16_].burst > 1)
                              {
                                 _loc2_ *= ActList[nowActing].currentWeaponType.modes[_loc16_].burst;
                              }
                              _loc2_ /= ActList[nowActing].weaponModeAP(_loc16_);
                              _loc2_ *= ActList[nowActing].currentWeaponType.modes[_loc16_].accuracy;
                              if(_loc2_ > _loc4_)
                              {
                                 _loc4_ = _loc2_;
                                 ActList[nowActing].maxDamageMode = _loc16_;
                              }
                           }
                           ActList[nowActing].availableAmmo = ActList[nowActing].currentAmmo.amount;
                           if(ActList[nowActing].availableAmmo <= 0 && ActList[nowActing].AP >= ActList[nowActing].currentWeaponReloadAP)
                           {
                              reload();
                           }
                           ActList[nowActing].availableAP = ActList[nowActing].AP;
                           ActList[nowActing].walkToX = null;
                           ActList[nowActing].walkToY = null;
                           ActList[nowActing].dangerMap = [];
                           _loc16_ = 0;
                           while(_loc16_ < gridWidth)
                           {
                              ActList[nowActing].dangerMap[_loc16_] = [];
                              _loc16_++;
                           }
                           break;
                        case 5:
                           var _loc21_:Number = Math.round(ActList[nowActing].currentWeaponData.explosiveness * 5 / Math.min(squareWidth,squareHeight));
                           ActList[nowActing].minimumRange = _loc21_;
                           ActList[nowActing].maximumRange = ActList[nowActing].maxThrowDistance(initialGrenadeHeight,grenadeAngle);
                           ActList[nowActing].optimalRange = Math.round(ActList[nowActing].maximumRange / 2);
                           ActList[nowActing].maxScore = 0 - Infinity;
                           ActList[nowActing].walkToX = null;
                           ActList[nowActing].walkToY = null;
                           ActList[nowActing].squaresToProcess = generatePossibleSquares(ActList[nowActing].squareX,ActList[nowActing].squareY,Math.floor((ActList[nowActing].maxAP - ActList[nowActing].weaponModeAP()) / ActList[nowActing].walkAP));
                           ActList[nowActing].dangerMap = [];
                           _loc16_ = 0;
                           while(_loc16_ < gridWidth)
                           {
                              ActList[nowActing].dangerMap[_loc16_] = [];
                              _loc16_++;
                           }
                           for(_loc16_ in ActList)
                           {
                              if(ActList[_loc16_].HP > 0)
                              {
                                 if(ActList[nowActing].IFF(ActList[_loc16_]))
                                 {
                                    _loc8_ = -30;
                                 }
                                 if(ActList[nowActing].band != ActList[_loc16_].band && ActList[_loc16_].band != 3)
                                 {
                                    _loc8_ = 10;
                                 }
                                 _loc1_ = ActList[_loc16_].squareX - _loc21_;
                                 while(_loc1_ <= ActList[_loc16_].squareX + _loc21_)
                                 {
                                    _loc15_ = ActList[_loc16_].squareY - _loc21_;
                                    while(_loc15_ <= ActList[_loc16_].squareY + _loc21_)
                                    {
                                       if(_loc1_ >= 0 && _loc1_ < gridWidth && _loc15_ >= 0 && _loc15_ < gridHeight)
                                       {
                                          _loc5_ = MathFunctions.CalcDistance(_loc1_,_loc15_,ActList[_loc16_].squareX,ActList[_loc16_].squareY);
                                          if(_loc5_ <= _loc21_)
                                          {
                                             _loc10_ = _loc8_ * (1 - _loc5_ / _loc21_);
                                             if(ActList[nowActing].dangerMap[_loc1_][_loc15_] == undefined)
                                             {
                                                ActList[nowActing].dangerMap[_loc1_][_loc15_] = _loc10_;
                                             }
                                             else
                                             {
                                                var _loc27_:Number = _loc15_;
                                                var _loc30_:Number = ActList[nowActing].dangerMap[_loc1_][_loc27_] + _loc10_;
                                                ActList[nowActing].dangerMap[_loc1_][_loc27_] = _loc30_;
                                             }
                                          }
                                       }
                                       _loc15_++;
                                    }
                                    _loc1_++;
                                 }
                              }
                           }
                           ActList[nowActing].grenadeSpots = [];
                           _loc1_ = 0;
                           while(_loc1_ < gridWidth)
                           {
                              _loc15_ = 0;
                              while(_loc15_ < gridHeight)
                              {
                                 if(ActList[nowActing].dangerMap[_loc1_][_loc15_] >= _loc21_)
                                 {
                                    ActList[nowActing].grenadeSpots.push({
                                       "x":_loc1_,
                                       "y":_loc15_,
                                       "score":ActList[nowActing].dangerMap[_loc1_][_loc15_]
                                    });
                                 }
                                 _loc15_++;
                              }
                              _loc1_++;
                           }
                           _loc9_ = 0 - Infinity;
                           _loc16_ = 0;
                           while(_loc16_ < ActList[nowActing].grenadeSpots.length)
                           {
                              if(ActList[nowActing].grenadeSpots[_loc16_].score > _loc9_)
                              {
                                 _loc9_ = ActList[nowActing].grenadeSpots[_loc16_].score;
                              }
                              _loc16_++;
                           }
                           _loc3_ = _loc9_ * 0.8;
                           _loc16_ = 0;
                           while(_loc16_ < ActList[nowActing].grenadeSpots.length)
                           {
                              if(ActList[nowActing].grenadeSpots[_loc16_].score < _loc3_)
                              {
                                 ActList[nowActing].grenadeSpots.splice(_loc16_,1);
                                 _loc16_--;
                              }
                              _loc16_++;
                           }
                           ActList[nowActing].grenadeSpots.sortOn("score",18);
                           ActList[nowActing].dangerMap = [];
                           _loc16_ = 0;
                           while(_loc16_ < gridWidth)
                           {
                              ActList[nowActing].dangerMap[_loc16_] = [];
                              _loc16_++;
                           }
                     }
                  }
               }
               updateInterface();
               interfaceOnOff(false);
               return;
            }
         }
         loseTheGame();
         return false;
      }
      
      public function endWalk(param1:*) : *
      {
         param1.applyPhaseAndFrame = {
            "phase":0,
            "frame":1
         };
         if(param1 == ActList[nowActing] && autoCenter && !param1.controlled)
         {
            centerViewOn(param1.x,param1.y);
         }
         ASMap.Map[param1.squareX][param1.squareY] = 1;
         CharactersMap[param1.squareX][param1.squareY] = param1;
         drawCharacterOnMiniMap(param1);
         param1.pickUpPos = 0;
      }
      
      public function moveScreen(param1:*, param2:*) : *
      {
         viewTargetX -= param1;
         viewTargetY -= param2;
         MobilePart.x -= param1;
         MobilePart.y -= param2;
         if(MobilePart.x > 0 - leftViewLimit)
         {
            MobilePart.x = 0 - leftViewLimit;
         }
         if(viewTargetX > 0 - leftViewLimit)
         {
            viewTargetX = 0 - leftViewLimit;
         }
         if(MobilePart.x < 0 - rightViewLimit + screenWidth)
         {
            MobilePart.x = 0 - rightViewLimit + screenWidth;
         }
         if(viewTargetX < 0 - rightViewLimit + screenWidth)
         {
            viewTargetX = 0 - rightViewLimit + screenWidth;
         }
         if(MobilePart.y > 0 - topViewLimit)
         {
            MobilePart.y = 0 - topViewLimit;
         }
         if(viewTargetY > 0 - topViewLimit)
         {
            viewTargetY = 0 - topViewLimit;
         }
         if(MobilePart.y < 0 - bottomViewLimit + screenHeight)
         {
            MobilePart.y = 0 - bottomViewLimit + screenHeight;
         }
         if(viewTargetY < 0 - bottomViewLimit + screenHeight)
         {
            viewTargetY = 0 - bottomViewLimit + screenHeight;
         }
      }
      
      public function startAttack(param1:*, param2:*) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         _loc3_ = param1.x - param2.x;
         _loc4_ = param1.y - param2.y;
         if(Math.abs(_loc3_) > Math.abs(_loc4_))
         {
            if(_loc3_ > 0)
            {
               param1.direction = 3;
            }
            else
            {
               param1.direction = 1;
            }
         }
         else if(_loc4_ > 0)
         {
            param1.direction = 0;
         }
         else
         {
            param1.direction = 2;
         }
         param1.reduceAP(param1.weaponModeAP());
         updateInterface();
         if(param1.currentWeaponMode.burst > 0)
         {
            burstCounter = param1.currentWeaponMode.burst - 1;
         }
         if(param1.currentWeaponType.category == 4)
         {
            flamethrowerInAction = true;
            param1.flamethrowerExperience += param1.weaponModeAP() / 5 * param1.learningCapacity;
            _loc5_ = calculateMaxShotOffset(ActList[nowActing]);
            flamethrowerShotAngle = aimAngle - _loc5_ + Math.random() * _loc5_ * 2;
            if(GameData.soundFXOn)
            {
               playSoundAt(new SFXFlamethrowerStart(),param1.x,param1.y);
            }
         }
         else
         {
            param1.applyPhaseAndFrame = {
               "phase":2,
               "frame":1
            };
         }
         theAttacked = param2;
      }
      
      public function playAttackSound(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:Sound = null;
         var _loc2_:Class = null;
         if(!GameData.soundFXOn)
         {
            return;
         }
         if(param1.currentWeaponData.sound != undefined)
         {
            if(param1.currentWeaponData.sound is Array)
            {
               _loc4_ = param1.currentWeaponData.sound[MathFunctions.random(0,param1.currentWeaponData.sound.length - 1)];
            }
            else
            {
               _loc4_ = param1.currentWeaponData.sound;
            }
            _loc2_ = getDefinitionByName(_loc4_) as Class;
            _loc3_ = new _loc2_() as Sound;
            playSoundAt(_loc3_,param1.x,param1.y);
         }
      }
      
      public function Attack(param1:*) : *
      {
         var _loc23_:* = undefined;
         var _loc24_:* = undefined;
         var _loc31_:* = undefined;
         var _loc26_:* = undefined;
         var _loc13_:* = undefined;
         var _loc21_:* = undefined;
         var _loc30_:* = undefined;
         var _loc32_:* = undefined;
         var _loc17_:* = undefined;
         var _loc16_:* = undefined;
         var _loc22_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc29_:* = undefined;
         var _loc5_:* = undefined;
         var _loc14_:* = undefined;
         var _loc25_:* = undefined;
         var _loc7_:* = undefined;
         var _loc11_:* = undefined;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc27_:* = undefined;
         var _loc15_:* = undefined;
         var _loc28_:* = undefined;
         var _loc6_:* = undefined;
         var _loc20_:* = undefined;
         var _loc8_:* = undefined;
         var _loc12_:* = undefined;
         _loc13_ = WeaponsData.detectWeaponSkill(param1.currentWeaponData);
         if(param1.currentWeaponType.category != 0 && param1.currentWeaponType.category != 1)
         {
            playAttackSound(param1);
         }
         switch(param1.currentWeaponType.category)
         {
            case 0:
            case 1:
               var _loc33_:String = _loc13_ + "Experience";
               var _loc34_:Number = param1[_loc33_] + param1.weaponModeAP() / 5;
               param1[_loc33_] = _loc34_;
               param1.closeBattleExperience += param1.learningCapacity;
               theAttacked.dodgeExperience += 0.5 * theAttacked.learningCapacity;
               if(Math.random() <= calculateHitChance(param1,theAttacked))
               {
                  playAttackSound(param1);
                  _loc30_ = calculateHitDamage(param1,theAttacked);
                  theAttacked.bleeding += _loc30_ * param1.currentWeaponData.openWoundCoeficient * 3;
                  if(difficulty == 2)
                  {
                     theAttacked.bleeding += _loc30_ * param1.currentWeaponData.openWoundCoeficient * 3;
                  }
                  Hit(theAttacked,_loc30_,param1.x,param1.y);
                  param1[_loc13_ + "Experience"] += 0.5;
               }
               else
               {
                  theAttacked.dodgeExperience += theAttacked.learningCapacity;
               }
               break;
            case 2:
               if(param1.currentAmmo.amount > 0)
               {
                  param1.rangedWeaponsExperience += param1.weaponModeAP() / 5 * param1.learningCapacity;
                  param1[_loc13_ + "Experience"] += param1.weaponModeAP() / 5;
                  _loc24_ = calculateMaxShotOffset(ActList[nowActing]);
                  _loc31_ = aimAngle - _loc24_ + Math.random() * _loc24_ * 2;
                  if(param1.currentWeaponMode.parallelShots > 1)
                  {
                     _loc32_ = param1.currentWeaponMode.parallelShots;
                  }
                  else
                  {
                     _loc32_ = 1;
                  }
                  _loc23_ = 1;
                  while(_loc23_ <= _loc32_)
                  {
                     if(param1.currentAmmo.amount > 0)
                     {
                        if(param1.currentAmmo.shotgunAmmo && param1.currentAmmoData.pallets > 1)
                        {
                           _loc17_ = ActList[nowActing].currentWeaponData.spread * (1 + ActList[nowActing].attachmentsEffects(ActList[nowActing].currSlot).spread / 10);
                           _loc16_ = _loc31_ - _loc17_ / 2;
                           _loc22_ = _loc17_ / (ActList[nowActing].currentAmmoData.pallets - 1);
                           _loc21_ = 0;
                           while(_loc21_ < ActList[nowActing].currentAmmoData.pallets)
                           {
                              fireProjectile(_loc16_ + _loc22_ * _loc21_,"bullet");
                              _loc21_++;
                           }
                        }
                        else
                        {
                           fireProjectile(_loc31_,"bullet");
                        }
                        if(param1.currentWeaponData.ammo == 17)
                        {
                           param1.caravan.money--;
                        }
                        else
                        {
                           param1.loadedAmmo[param1.currSlot].amount--;
                           useCurrentAmmo(param1,1);
                        }
                        updateInterface();
                     }
                     _loc23_++;
                  }
               }
               break;
            case 3:
               if(param1.loadedAmmo[param1.currSlot].amount > 0)
               {
                  param1.rangedWeaponsExperience += param1.weaponModeAP() / 5 * param1.learningCapacity;
                  param1[_loc13_ + "Experience"] += param1.weaponModeAP() / 5;
                  _loc24_ = calculateMaxShotOffset(ActList[nowActing]);
                  _loc31_ = aimAngle - _loc24_ + Math.random() * _loc24_ * 2;
                  _loc26_ = flyingProjectiles.push(new Projectile()) - 1;
                  flyingProjectiles[_loc26_].ammoType = ActList[nowActing].currentAmmo.subCategory;
                  flyingProjectiles[_loc26_].explosive = ActList[nowActing].currentAmmoData.explosive;
                  flyingProjectiles[_loc26_].FF = ActList[nowActing].currentAmmoData.FF;
                  flyingProjectiles[_loc26_].explosiveness = ActList[nowActing].currentAmmoData.explosiveness;
                  flyingProjectiles[_loc26_].antiPersonnel = ActList[nowActing].currentAmmoData.antiPersonnel;
                  flyingProjectiles[_loc26_].firedBy = ActList[nowActing];
                  flyingProjectiles[_loc26_].prevX = flyingProjectiles[_loc26_].x = param1.x + 21 * Math.sin(_loc31_);
                  flyingProjectiles[_loc26_].prevY = flyingProjectiles[_loc26_].y = param1.y + 21 * Math.cos(_loc31_);
                  flyingProjectiles[_loc26_].z = 40;
                  flyingProjectiles[_loc26_].speed = ActList[nowActing].currentWeaponData.arrowSpeed;
                  flyingProjectiles[_loc26_].direction = _loc31_;
                  _loc7_ = 0;
                  var _loc4_:* = 0;
                  switch(ActList[nowActing].currentAmmoData.type)
                  {
                     case 4:
                        if(Math.random() < 0.5)
                        {
                           _loc11_ = false;
                           for(_loc21_ in DroppedBolts)
                           {
                              if(DroppedBolts[_loc21_].type == param1.loadedAmmo[param1.currSlot].type)
                              {
                                 DroppedBolts[_loc21_].amount++;
                                 _loc11_ = true;
                                 break;
                              }
                           }
                           if(!_loc11_)
                           {
                              DroppedBolts.push(new Item(param1.loadedAmmo[param1.currSlot].type,1));
                           }
                        }
                        _loc29_ = map2Screen(Math.sin(_loc31_) * 10,Math.cos(_loc31_) * 10);
                        _loc2_ = _loc29_.x;
                        _loc3_ = _loc29_.y;
                        if(_loc2_ < 0)
                        {
                           _loc7_ = 0 - _loc2_;
                           _loc2_ = 0;
                        }
                        if(_loc3_ < 0)
                        {
                           _loc4_ = 0 - _loc3_;
                           _loc3_ = 0;
                        }
                        _loc9_ = 0 - Math.max(_loc7_,_loc2_) / 2;
                        _loc10_ = 0 - Math.max(_loc4_,_loc3_) / 2;
                        _loc18_ = new Sprite();
                        _loc18_.graphics.lineStyle(1,0);
                        _loc18_.graphics.moveTo(_loc7_,_loc4_);
                        _loc18_.graphics.lineTo(_loc2_,_loc3_);
                        _loc25_ = new BitmapData(Math.round(Math.max(_loc7_,_loc2_)) + 1,Math.round(Math.max(_loc4_,_loc3_)) + 1,true,0);
                        _loc25_.draw(_loc18_);
                        _loc5_ = new Bitmap(_loc25_);
                        _loc18_ = new Sprite();
                        _loc18_.graphics.lineStyle(1,0,0.5);
                        _loc18_.graphics.moveTo(_loc7_,_loc4_);
                        _loc18_.graphics.lineTo(_loc2_,_loc3_);
                        _loc25_ = new BitmapData(Math.round(Math.max(_loc7_,_loc2_)) + 1,Math.round(Math.max(_loc4_,_loc3_)) + 1,true,0);
                        _loc25_.draw(_loc18_);
                        _loc14_ = new Bitmap(_loc25_);
                        break;
                     case 6:
                     case 13:
                        _loc19_ = Math.round((3.141592653589793 - _loc31_) / (3.141592653589793 / 8));
                        if(_loc19_ < 0)
                        {
                           _loc19_ += 16;
                        }
                        _loc25_ = new BitmapData(15,15,true,0);
                        _loc25_.copyPixels(RocketImage,new Rectangle(0,_loc19_ * 15,15,15),new Point(0,0));
                        _loc5_ = new Bitmap(_loc25_);
                        _loc25_ = new BitmapData(15,15,true,0);
                        _loc25_.copyPixels(RocketShadow,new Rectangle(0,_loc19_ * 15,15,15),new Point(0,0));
                        _loc14_ = new Bitmap(_loc25_);
                        _loc9_ = -7.5;
                        _loc10_ = -7.5;
                  }
                  _loc5_.x = _loc9_;
                  _loc5_.y = _loc10_;
                  _loc14_.x = _loc9_;
                  _loc14_.y = _loc10_;
                  flyingProjectiles[_loc26_].ownContainer = new Sprite();
                  flyingProjectiles[_loc26_].ownContainer.addChild(_loc5_);
                  flyingProjectiles[_loc26_].Shadow = new Sprite();
                  flyingProjectiles[_loc26_].Shadow.addChild(_loc14_);
                  param1.loadedAmmo[param1.currSlot].amount--;
                  useCurrentAmmo(param1,1);
                  updateInterface();
               }
               break;
            case 5:
               trace("grenade thrown");
               param1.throwExperience += param1.learningCapacity;
               _loc26_ = flyingGrenades.push(new Projectile()) - 1;
               flyingGrenades[_loc26_].prevX = flyingGrenades[_loc26_].x = param1.x;
               flyingGrenades[_loc26_].prevY = flyingGrenades[_loc26_].y = param1.y;
               flyingGrenades[_loc26_].z = initialGrenadeHeight * 32;
               flyingGrenades[_loc26_].frame = 1;
               flyingGrenades[_loc26_].counter = param1.currentWeaponData.delay * stage.frameRate;
               flyingGrenades[_loc26_].firedBy = param1;
               flyingGrenades[_loc26_].explosiveness = param1.currentWeaponData.explosiveness;
               flyingGrenades[_loc26_].antiPersonnel = param1.currentWeaponData.antiPersonnel;
               flyingGrenades[_loc26_].explodeOnImpact = param1.currentWeaponData.explodeOnImpact;
               flyingGrenades[_loc26_].flame = param1.currentWeaponData.flame;
               _loc27_ = 1 / param1.throwingAccuracy * 4;
               if(Math.random() < 0.5)
               {
                  _loc27_ = 0 - _loc27_;
               }
               _loc15_ = MathFunctions.CalcDistance(param1.x,param1.y,param1.throwGrenadeAt.x,param1.throwGrenadeAt.y) / 32 * (1 - Math.random() * _loc27_);
               _loc15_ = Math.min(_loc15_,param1.maxThrowDistance(initialGrenadeHeight,grenadeAngle));
               _loc15_ = Math.max(_loc15_,0);
               _loc28_ = Math.sqrt((initialGrenadeHeight + _loc15_ * Math.tan(grenadeAngle)) / 4.9);
               _loc6_ = _loc15_ / (Math.cos(grenadeAngle) * _loc28_);
               flyingGrenades[_loc26_].zSpeed = _loc6_ * Math.sin(grenadeAngle);
               _loc20_ = 1 / param1.throwingAccuracy * 5;
               if(Math.random() < 0.5)
               {
                  _loc20_ = 0 - _loc20_;
               }
               _loc8_ = MathFunctions.CalcAngle(param1.x,param1.y,param1.throwGrenadeAt.x,param1.throwGrenadeAt.y) + Math.random() * _loc20_;
               _loc12_ = _loc6_ * Math.cos(grenadeAngle);
               flyingGrenades[_loc26_].xSpeed = _loc12_ * Math.sin(_loc8_);
               flyingGrenades[_loc26_].ySpeed = _loc12_ * Math.cos(_loc8_);
         }
      }
      
      public function fireProjectile(param1:*, param2:*) : *
      {
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc11_:* = undefined;
         var _loc3_:* = undefined;
         var _loc10_:* = undefined;
         var _loc4_:* = undefined;
         var _loc12_:* = undefined;
         var _loc5_:* = undefined;
         var _loc9_:* = undefined;
         if(param1 < 0)
         {
            param1 += MathFunctions.dblPI;
         }
         if(param1 > MathFunctions.dblPI)
         {
            param1 -= MathFunctions.dblPI;
         }
         var _loc6_:Object = {
            "x":ActList[nowActing].x,
            "y":ActList[nowActing].y
         };
         if(param2 == "bullet")
         {
            _loc3_ = [];
            if(param1 < 3.141592653589793)
            {
               _loc3_.push({
                  "startX":gridWidth * squareWidth,
                  "endX":gridWidth * squareWidth,
                  "startY":0,
                  "endY":gridHeight * squareHeight,
                  "direction":"right"
               });
            }
            else
            {
               _loc3_.push({
                  "startX":0,
                  "endX":0,
                  "startY":0,
                  "endY":gridHeight * squareHeight,
                  "direction":"left"
               });
            }
            if(param1 > MathFunctions.halfPI && param1 <= 3.141592653589793 * 1.5)
            {
               _loc3_.push({
                  "startX":0,
                  "endX":gridWidth * squareWidth,
                  "startY":0,
                  "endY":0,
                  "direction":"up"
               });
            }
            else
            {
               _loc3_.push({
                  "startX":0,
                  "endX":gridWidth * squareWidth,
                  "startY":gridHeight * squareHeight,
                  "endY":gridHeight * squareHeight,
                  "direction":"down"
               });
            }
            _loc4_ = MathFunctions.ang2ab(_loc6_.x,_loc6_.y,param1);
            for(_loc7_ in _loc3_)
            {
               _loc10_ = MathFunctions.LineHitsSegment(_loc4_,_loc3_[_loc7_].startX,_loc3_[_loc7_].startY,_loc3_[_loc7_].endX,_loc3_[_loc7_].endY);
               if(_loc10_ != null)
               {
                  if(_loc10_.x > _loc6_.x && _loc3_[_loc7_].direction == "right" || _loc10_.x < _loc6_.x && _loc3_[_loc7_].direction == "left" || _loc10_.y > _loc6_.y && _loc3_[_loc7_].direction == "down" || _loc10_.y < _loc6_.y && _loc3_[_loc7_].direction == "up")
                  {
                     _loc11_ = _loc10_;
                     break;
                  }
               }
            }
         }
         var _loc13_:* = checkHit(_loc6_.x,_loc6_.y,_loc11_.x,_loc11_.y,[ActList[nowActing]]);
         if(_loc13_ != null)
         {
            if(_loc13_.segment[0].belongsTo is Character || _loc13_.segment[0].belongsTo is TransportUnit)
            {
               _loc12_ = ActList[nowActing].currentAmmoData.muzzleVelocity * (1 + ActList[nowActing].currentWeaponData.muzzleVelocityChange);
               _loc5_ = ActList[nowActing].currentAmmo.velocityLoss * _loc13_.distance / 32;
               _loc9_ = _loc12_ * (1 - _loc5_);
               hitByProjectile(_loc13_.segment[0].belongsTo,ActList[nowActing],_loc9_,param1,_loc13_.distance);
            }
            if(_loc13_.segment[0].belongsTo is Obstacle)
            {
               if(GameData.soundFXOn)
               {
                  playSoundAt(new SFXRicochet(),_loc13_.x,_loc13_.y);
               }
               _loc13_.segment[0].belongsTo.hitFrame = 1;
               _loc13_.segment[0].belongsTo.hitX = _loc13_.x;
               _loc13_.segment[0].belongsTo.hitY = _loc13_.y;
               _loc13_.segment[0].belongsTo.outerHit = _loc13_.outer;
            }
         }
         else
         {
            trace("missed");
         }
      }
      
      public function checkHit(param1:*, param2:*, param3:*, param4:*, param5:* = null, param6:* = false, param7:* = false) : *
      {
         var _loc12_:* = undefined;
         var _loc10_:* = undefined;
         var _loc14_:* = undefined;
         var _loc19_:* = undefined;
         var _loc8_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = lineToSquares(param1,param2,param3,param4);
         var _loc9_:* = obstaclesFromSquares(_loc17_,param5,param6,param7);
         var _loc11_:Array = [];
         for(_loc10_ in _loc9_)
         {
            for(_loc12_ in _loc9_[_loc10_])
            {
               _loc11_.push([_loc9_[_loc10_][_loc12_],_loc9_[_loc10_][_loc9_[_loc10_][_loc12_].next]]);
               if(_loc9_[_loc10_][_loc12_].belongsTo is Obstacle)
               {
                  _loc11_[_loc11_.length - 1][2] = ObstacleSegmentDirections[_loc9_[_loc10_][_loc12_].belongsTo.type][_loc12_];
               }
            }
         }
         var _loc18_:Array = [];
         for(_loc10_ in _loc11_)
         {
            _loc14_ = MathFunctions.SegmentHitsSegment(param1,param2,param3,param4,_loc11_[_loc10_][0].x,_loc11_[_loc10_][0].y,_loc11_[_loc10_][1].x,_loc11_[_loc10_][1].y);
            if(_loc14_ != null)
            {
               _loc18_.push({
                  "segment":_loc11_[_loc10_],
                  "distance":MathFunctions.CalcDistance(param1,param2,_loc14_.x,_loc14_.y),
                  "x":_loc14_.x,
                  "y":_loc14_.y,
                  "outer":_loc11_[_loc10_][2]
               });
            }
         }
         if(_loc18_.length > 0)
         {
            if(param6)
            {
               _loc18_.sortOn("distance",16);
               return _loc18_;
            }
            var _loc13_:* = Infinity;
            for(_loc10_ in _loc18_)
            {
               if(_loc18_[_loc10_].distance < _loc13_)
               {
                  _loc13_ = _loc18_[_loc10_].distance;
                  _loc16_ = _loc18_[_loc10_].segment;
                  _loc19_ = _loc18_[_loc10_].x;
                  _loc8_ = _loc18_[_loc10_].y;
                  _loc15_ = _loc18_[_loc10_].outer;
               }
            }
            return {
               "distance":_loc13_,
               "segment":_loc16_,
               "x":_loc19_,
               "y":_loc8_,
               "outer":_loc15_
            };
         }
         return null;
      }
      
      public function obstaclesFromSquares(param1:*, param2:* = null, param3:* = false, param4:* = false) : *
      {
         var _loc7_:* = undefined;
         var _loc11_:* = undefined;
         var _loc9_:* = undefined;
         var _loc8_:* = undefined;
         var _loc13_:* = undefined;
         var _loc6_:* = undefined;
         var _loc10_:* = undefined;
         var _loc5_:Array = [];
         var _loc12_:Array = [];
         if(param2 == null)
         {
            param2 = [];
         }
         for(_loc6_ in param1)
         {
            if(param1[_loc6_].x >= 0 && param1[_loc6_].x < gridWidth && param1[_loc6_].y >= 0 && param1[_loc6_].y < gridHeight)
            {
               if(CharactersMap[param1[_loc6_].x][param1[_loc6_].y] is Character)
               {
                  _loc11_ = false;
                  for(_loc7_ in param2)
                  {
                     if(param2[_loc7_] == CharactersMap[param1[_loc6_].x][param1[_loc6_].y])
                     {
                        _loc11_ = true;
                        break;
                     }
                  }
                  if(!_loc11_)
                  {
                     _loc12_.push(CharactersMap[param1[_loc6_].x][param1[_loc6_].y]);
                  }
               }
               if(ObstaclesMap[param1[_loc6_].x][param1[_loc6_].y] is Obstacle && (Obstacle.Data[ObstaclesMap[param1[_loc6_].x][param1[_loc6_].y].type].elevation == 3 || param3) || ObstaclesMap[param1[_loc6_].x][param1[_loc6_].y] is TransportUnit && (ObstaclesMap[param1[_loc6_].x][param1[_loc6_].y].health > 0 || ObstaclesMap[param1[_loc6_].x][param1[_loc6_].y].category != 1))
               {
                  _loc11_ = false;
                  for(_loc7_ in param2)
                  {
                     if(param2[_loc7_] == ObstaclesMap[param1[_loc6_].x][param1[_loc6_].y])
                     {
                        _loc11_ = true;
                        break;
                     }
                  }
                  if(!_loc11_)
                  {
                     _loc12_.push(ObstaclesMap[param1[_loc6_].x][param1[_loc6_].y]);
                  }
               }
            }
         }
         _loc6_ = 0;
         while(_loc6_ < _loc12_.length)
         {
            _loc7_ = _loc6_ + 1;
            while(_loc7_ < _loc12_.length)
            {
               if(_loc12_[_loc6_] == _loc12_[_loc7_])
               {
                  _loc12_.splice(_loc7_,1);
                  _loc7_--;
               }
               _loc7_++;
            }
            _loc6_++;
         }
         for(_loc6_ in _loc12_)
         {
            if(_loc12_[_loc6_] is Character)
            {
               _loc5_.push(traceCharacterSegments(_loc12_[_loc6_]));
            }
            if(_loc12_[_loc6_] is Obstacle || _loc12_[_loc6_] is TransportUnit && (_loc12_[_loc6_].elevation > 2 || param4))
            {
               _loc9_ = [];
               _loc13_ = 0;
               if(_loc12_[_loc6_] is Obstacle)
               {
                  _loc10_ = Obstacle.Data[_loc12_[_loc6_].type].segments;
               }
               if(_loc12_[_loc6_] is TransportUnit)
               {
                  _loc10_ = _loc12_[_loc6_].segments;
               }
               for(_loc7_ in _loc10_)
               {
                  if(_loc7_ == _loc10_.length - 1 || _loc10_[_loc7_].end)
                  {
                     _loc8_ = _loc13_;
                  }
                  else
                  {
                     _loc8_ = _loc7_ + 1;
                  }
                  if(_loc10_[_loc7_].end)
                  {
                     _loc13_ = _loc7_ + 1;
                  }
                  _loc9_.push({
                     "x":_loc12_[_loc6_].x - squareWidth / 2 + _loc10_[_loc7_].x * squareWidth,
                     "y":_loc12_[_loc6_].y - squareWidth / 2 + _loc10_[_loc7_].y * squareHeight,
                     "belongsTo":_loc12_[_loc6_],
                     "next":_loc8_
                  });
               }
               _loc5_.push(_loc9_);
            }
         }
         return _loc5_;
      }
      
      public function hitByProjectile(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc17_:* = undefined;
         var _loc15_:* = undefined;
         var _loc9_:Boolean = false;
         if(GameData.soundFXOn)
         {
            if(param1 is TransportUnit && param1.category == 1 || param1 is Character)
            {
               playSoundAt(new SFXBulletHitsAnimal(),param1.x,param1.y,0.8);
            }
            else if(param1 is TransportUnit)
            {
               playSoundAt(new SFXBulletHitsTransport(),param1.x,param1.y);
            }
         }
         itsAHeadShot = param2.currentWeaponMode.headShot;
         if(param1 is Character && param2.currentWeaponMode.damageMultiplier > 0 && param1 == theAttacked)
         {
            _loc8_ = 1 - calculateMaxShotOffset(param2) * param5 / 20;
            if(Math.random() < _loc8_)
            {
               trace("multiplying damage by " + param2.currentWeaponMode.damageMultiplier);
               _loc9_ = true;
               succesfulHeadShot = true;
            }
         }
         if(_loc9_ && param2.currentWeaponMode.headShot)
         {
            _loc7_ = param1.headArmor;
         }
         else
         {
            _loc7_ = param1.armor;
         }
         if(param1 is Character)
         {
            _loc17_ = param1.bypassArmor;
         }
         else
         {
            _loc17_ = 0;
         }
         if(_loc7_ > 0 && Math.random() < _loc17_)
         {
            trace("Armor bypassed");
            _loc7_ = 0;
         }
         var _loc13_:Number = Math.pow(_loc7_ * 50 / (param2.currentAmmoData.armorPiercing * Math.pow(param2.currentAmmo.itemData.projectileMass,0.2)),0.8264462809917356);
         var _loc14_:Number = Math.max(param3 - _loc13_,0);
         var _loc11_:Number = param2.currentAmmo.itemData.projectileMass * Math.pow(_loc14_,2) / 2000;
         var _loc10_:Number = (1 - 1 / (1 + Math.exp(0.03 * _loc11_ - 3))) * Math.pow(_loc11_,0.125) * (0.5 + _loc11_ / 2000 * Math.exp(-_loc11_ / 2000) / 2) * param2.currentAmmo.bulletDiameter * param2.currentAmmo.itemData.softTargetDamage * 3;
         var _loc12_:* = MathFunctions.CalcAngle(param2.x,param2.y,param1.x,param1.y);
         var _loc6_:Number = Math.abs(MathFunctions.AngleDifference(_loc12_,param4));
         var _loc16_:Number = param5 * Math.sin(_loc6_);
         _loc10_ *= (10 - _loc16_) / 10;
         if(_loc16_ < 3 && Math.random() < 0.01 + Math.pow((3 - _loc16_) / 5,2))
         {
            _loc10_ *= 2;
         }
         if(_loc9_)
         {
            _loc10_ *= param2.currentWeaponMode.damageMultiplier;
         }
         param1.lastHitDamage += _loc10_;
         param1.hitInThisTurn = true;
         if(param1.HP > param1.lastHitDamage && _loc9_ && param2.currentWeaponMode.headShot)
         {
            _loc15_ = 5;
            if(difficulty == 1)
            {
               _loc15_ = 7;
            }
            if(!damageCaused && !param1.eyeDamage && Math.pow(Math.random(),_loc15_) > 1 / Math.pow(_loc10_,0.1))
            {
               param1.eyeDamage = true;
               generateMessage(param1,"eye damage");
               damageCaused = true;
            }
         }
         if(param1 is Character)
         {
            param1.hitFrom = {
               "x":param2.x,
               "y":param2.y
            };
            param1.hitByFlame = false;
            param1.bleeding += param2.currentAmmo.bulletDiameter * Math.min(_loc11_,2000) / 5000;
            if(difficulty == 2)
            {
               param1.bleeding += param2.currentAmmo.bulletDiameter * Math.min(_loc11_,2000) / 5000;
            }
         }
      }
      
      public function Hit(param1:*, param2:*, param3:* = null, param4:* = null, param5:* = true, param6:* = 1) : *
      {
         var _loc10_:* = undefined;
         var _loc9_:Sound = null;
         var _loc7_:Class = null;
         var _loc12_:* = undefined;
         var _loc11_:* = undefined;
         var _loc8_:* = undefined;
         var _loc16_:* = undefined;
         var _loc15_:* = undefined;
         if(GameData.soundFXOn)
         {
            if(param1.gender == 1)
            {
               _loc7_ = getDefinitionByName("SFXMaleGrunt" + MathFunctions.random(1,10)) as Class;
            }
            else
            {
               _loc7_ = getDefinitionByName("SFXFemaleGrunt" + MathFunctions.random(1,10)) as Class;
            }
            _loc9_ = new _loc7_() as Sound;
            playSoundAt(_loc9_,param1.x,param1.y,0.7);
         }
         if(param1.HP > 0)
         {
            if(param6 == 1)
            {
               generateMessage(param1,"got hit",param2);
            }
            if(param6 == 2)
            {
               generateMessage(param1,"bleeding",param2);
            }
            if(param6 == 3)
            {
               generateMessage(param1,"burning",param2);
            }
         }
         if(param3 != null && param4 != null)
         {
            param1.lookAt(param3,param4);
         }
         var _loc13_:* = MathFunctions.CalcAngle(param3,param4,param1.x,param1.y);
         var _loc14_:Number = Math.min(Math.round(param2 * 4),1000);
         if(param5)
         {
            _loc10_ = 1;
            while(_loc10_ <= _loc14_)
            {
               _loc8_ = Math.pow(Math.random(),2) * 0.8;
               if(Math.random() < 0.5)
               {
                  _loc11_ = _loc13_ - _loc8_;
               }
               else
               {
                  _loc11_ = _loc13_ + _loc8_;
               }
               _loc12_ = Math.pow(Math.random(),2) * (0.8 - _loc8_) * 8;
               param1.bloodDrops.push({
                  "x":param1.x,
                  "y":param1.y,
                  "z":40,
                  "xSpeed":Math.sin(_loc11_) * _loc12_,
                  "ySpeed":Math.cos(_loc11_) * _loc12_,
                  "zSpeed":0,
                  "container":generateBloodDrop()
               });
               _loc10_++;
            }
         }
         param1.HP -= param2;
         param1.painExperience += param2 * param1.learningCapacity;
         if(param1.HP / param1.maxHP < param1.painThreshold)
         {
            param1.battleMorale -= param2 * 0.5;
         }
         if(param1.HP <= 0)
         {
            if(param1.animationPhase != 4)
            {
               generateMessage(param1,"die");
            }
            param1.applyPhaseAndFrame = {
               "phase":4,
               "frame":1
            };
            _loc16_ = 0;
            for(_loc10_ in Characters)
            {
               if(!Characters[_loc10_].dead && Characters[_loc10_].HP > 0 && Characters[_loc10_].band == param1.band)
               {
                  _loc16_++;
               }
            }
            if(param1.band == 2 || param1.band == 1)
            {
               for(_loc10_ in Characters)
               {
                  if(!Characters[_loc10_].dead && Characters[_loc10_].HP > 0)
                  {
                     if(Characters[_loc10_].band == param1.band)
                     {
                        Characters[_loc10_].battleMorale -= 10 / _loc16_;
                     }
                     else if(Characters[_loc10_].band == 2 || Characters[_loc10_].band == 1)
                     {
                        Characters[_loc10_].battleMorale += 10 / _loc16_;
                     }
                  }
               }
            }
            updateInterface();
         }
         else
         {
            _loc15_ = 6;
            if(difficulty == 1)
            {
               _loc15_ = 10;
            }
            if(!itsAHeadShot && param6 == 1 && !damageCaused && param5 && !param1.legDamage && Math.pow(Math.random(),_loc15_) > 1 / Math.pow(param2,0.1))
            {
               param1.legDamage = true;
               generateMessage(param1,"leg damage");
               damageCaused = true;
            }
            if(!succesfulHeadShot && param6 == 1 && !damageCaused && param5 && !param1.armDamage && Math.pow(Math.random(),_loc15_) > 1 / Math.pow(param2,0.1))
            {
               param1.armDamage = true;
               generateMessage(param1,"arm damage");
               damageCaused = true;
            }
            _loc15_ = 8;
            if(difficulty == 1)
            {
               _loc15_ = 12;
            }
            if(succesfulHeadShot)
            {
               _loc15_ /= 1.5;
            }
            if(!damageCaused && param6 == 1 && param5 && !param1.eyeDamage && Math.pow(Math.random(),_loc15_) > 1 / Math.pow(param2,0.1))
            {
               param1.eyeDamage = true;
               generateMessage(param1,"eye damage");
               damageCaused = true;
            }
            if(param1.animationPhase == 0)
            {
               param1.applyPhaseAndFrame = {
                  "phase":3,
                  "frame":1
               };
            }
            if(param1 == ActList[nowActing])
            {
               updateInterface();
            }
         }
      }
      
      public function generateBloodDrop() : *
      {
         var _loc1_:Number = 0.2 + Math.random() * 0.2;
         var _loc2_:BitmapData = new BitmapData(1,1,true,6291456 + (Math.round(_loc1_ * 255) << 24));
         return new Bitmap(_loc2_);
      }
      
      public function calculateMaxShotOffset(param1:*) : *
      {
         return 1 / (param1[WeaponsData.detectWeaponSkill(param1.currentWeaponData) + "Skill"] * param1.currentWeaponMode.accuracy * param1.currentWeaponData.accuracy * (1 + param1.attachmentsEffects(param1.currSlot).accuracy) / 10);
      }
      
      public function calculateHitChance(param1:*, param2:*, param3:* = null, param4:* = null, param5:* = null, param6:* = null) : *
      {
         var _loc8_:* = undefined;
         var _loc7_:* = undefined;
         if(param3 == null)
         {
            param3 = param1.squareX;
         }
         if(param4 == null)
         {
            param4 = param1.squareY;
         }
         if(param5 == null)
         {
            param5 = param2.squareX;
         }
         if(param6 == null)
         {
            param6 = param2.squareY;
         }
         var _loc9_:* = MathFunctions.CalcDistance(param3,param4,param5,param6);
         if(_loc9_ > param1.currentWeaponData.range)
         {
            return 0;
         }
         switch(param1.currentWeaponType.category)
         {
            case 0:
               return Math.min(Math.max((param1.unarmedHitChance * param1.currentWeaponMode.hitProbability - param2.closeBattleDodge) / 100,0),1);
            case 1:
               if(param1.currentWeaponData.type == 24)
               {
                  return Math.min(Math.max((param1.unarmedHitChance * param1.currentWeaponMode.hitProbability - param2.closeBattleDodge) / 100,0),1);
               }
               return Math.min(Math.max((param1.meleeHitChance(param1.currentWeaponData) * param1.currentWeaponMode.hitProbability - param2.closeBattleDodge) / 100,0.05),1);
               break;
            case 2:
            case 3:
            case 4:
               break;
            default:
               return;
         }
         _loc8_ = aimRanged(param1,param2,param3,param4);
         if(_loc8_ == null)
         {
            _loc7_ = 0;
            aimAngle = null;
         }
         else
         {
            _loc7_ = Math.min(_loc8_.hitChance,1);
            aimAngle = _loc8_.aimAngle;
         }
         return _loc7_;
      }
      
      public function calculateHitDamage(param1:*, param2:*) : *
      {
         var _loc6_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         switch(param1.currentWeaponType.category)
         {
            case 0:
               _loc4_ = param1.unarmedDamage * param1.currentWeaponMode.damageMultiplier;
               _loc6_ = 0;
               break;
            case 1:
               if(param1.currentWeaponData.type == 24)
               {
                  _loc4_ = param1.currentWeaponData.baseDamage / 10 * param1.unarmedDamage * param1.currentWeaponMode.damageMultiplier;
               }
               else
               {
                  _loc4_ = param1.currentWeaponData.baseDamage / 10 * param1.meleeDamage(param1.currentWeaponData) * param1.currentWeaponMode.damageMultiplier;
               }
               _loc6_ = param1.currentWeaponData.armorNeutralization;
         }
         _loc3_ = param2.armor * (1 - _loc6_ / 100);
         _loc5_ = Math.max(_loc4_ * (1 - _loc3_ / 100) - _loc3_ / 5,0);
         if(Math.random() < 0.05)
         {
            _loc5_ *= MathFunctions.random(1.5,2.5);
            trace("critical");
         }
         return Math.round(_loc5_ * 0.8 + Math.random() * _loc5_ * 0.4);
      }
      
      public function traceCharacterSegments(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         if(param1.direction == 0 || param1.direction == 2)
         {
            _loc2_.push({
               "x":param1.x - 10,
               "y":param1.y
            });
            _loc2_.push({
               "x":param1.x,
               "y":param1.y - 7
            });
            _loc2_.push({
               "x":param1.x + 10,
               "y":param1.y
            });
            _loc2_.push({
               "x":param1.x,
               "y":param1.y + 7
            });
         }
         if(param1.direction == 1 || param1.direction == 3)
         {
            _loc2_.push({
               "x":param1.x - 7,
               "y":param1.y
            });
            _loc2_.push({
               "x":param1.x,
               "y":param1.y - 10
            });
            _loc2_.push({
               "x":param1.x + 7,
               "y":param1.y
            });
            _loc2_.push({
               "x":param1.x,
               "y":param1.y + 10
            });
         }
         for(_loc3_ in _loc2_)
         {
            _loc2_[_loc3_].belongsTo = param1;
         }
         _loc3_ = 0;
         while(_loc3_ <= _loc2_.length - 2)
         {
            _loc2_[_loc3_].next = _loc3_ + 1;
            _loc3_++;
         }
         _loc2_[_loc2_.length - 1].next = 0;
         return _loc2_;
      }
      
      public function aimRanged(param1:*, param2:*, param3:* = null, param4:* = null) : *
      {
         var _loc39_:* = undefined;
         var _loc48_:* = undefined;
         var _loc49_:* = undefined;
         var _loc14_:* = undefined;
         var _loc13_:* = undefined;
         var _loc30_:* = undefined;
         var _loc31_:* = undefined;
         var _loc38_:* = undefined;
         var _loc17_:* = undefined;
         var _loc7_:* = undefined;
         var _loc23_:* = undefined;
         var _loc47_:* = undefined;
         var _loc11_:* = undefined;
         var _loc24_:* = undefined;
         var _loc26_:* = undefined;
         var _loc51_:* = undefined;
         var _loc52_:* = undefined;
         var _loc43_:* = undefined;
         var _loc16_:* = undefined;
         var _loc21_:* = undefined;
         var _loc34_:* = undefined;
         var _loc22_:* = undefined;
         var _loc45_:* = undefined;
         var _loc19_:* = undefined;
         var _loc32_:* = undefined;
         var _loc25_:* = undefined;
         var _loc42_:* = undefined;
         var _loc46_:* = undefined;
         var _loc15_:* = undefined;
         var _loc29_:* = undefined;
         var _loc35_:* = undefined;
         var _loc33_:* = undefined;
         var _loc18_:* = undefined;
         var _loc36_:* = undefined;
         if(param3 != null && param4 != null)
         {
            _loc17_ = {
               "x":(param3 + 0.5) * squareWidth,
               "y":(param4 + 0.5) * squareHeight
            };
         }
         else
         {
            _loc17_ = {
               "x":param1.x,
               "y":param1.y
            };
         }
         var _loc44_:* = traceCharacterSegments(param2);
         var _loc12_:Array = [];
         var _loc8_:Array = [];
         var _loc28_:* = 0;
         var _loc40_:Number = Infinity;
         var _loc37_:* = -Infinity;
         for(_loc38_ in _loc44_)
         {
            _loc8_[_loc38_] = MathFunctions.CalcAngle(_loc17_.x,_loc17_.y,_loc44_[_loc38_].x,_loc44_[_loc38_].y);
            _loc28_ += _loc8_[_loc38_];
         }
         _loc23_ = _loc28_ / _loc44_.length;
         _loc28_ = 0;
         for(_loc38_ in _loc44_)
         {
            _loc28_ += Math.abs(MathFunctions.AngleDifference(_loc23_,_loc8_[_loc38_]));
         }
         if(_loc28_ / _loc44_.length > MathFunctions.halfPI)
         {
            _loc23_ -= 3.141592653589793;
            if(_loc23_ < 0)
            {
               _loc23_ += MathFunctions.dblPI;
            }
         }
         for(_loc38_ in _loc44_)
         {
            _loc47_ = MathFunctions.AngleDifference(_loc23_,_loc8_[_loc38_]);
            while(_loc47_ > 3.141592653589793)
            {
               _loc47_ -= MathFunctions.dblPI;
            }
            if(_loc47_ > _loc37_)
            {
               _loc37_ = _loc47_;
               _loc13_ = _loc8_[_loc38_];
               _loc31_ = _loc44_[_loc38_];
            }
            if(_loc47_ < _loc40_)
            {
               _loc40_ = _loc47_;
               _loc14_ = _loc8_[_loc38_];
               _loc30_ = _loc44_[_loc38_];
            }
         }
         if(_loc14_ > _loc13_ && _loc14_ - _loc13_ < 3.141592653589793 || _loc13_ > _loc14_ && _loc13_ - _loc14_ > 3.141592653589793)
         {
            _loc11_ = _loc14_;
            _loc14_ = _loc13_;
            _loc13_ = _loc11_;
            _loc11_ = _loc30_;
            _loc30_ = _loc31_;
            _loc31_ = _loc11_;
         }
         var _loc50_:* = lineToSquares(_loc17_.x,_loc17_.y,_loc30_.x,_loc30_.y);
         _loc50_ = _loc50_.concat(lineToSquares(_loc17_.x,_loc17_.y,_loc31_.x,_loc31_.y));
         _loc38_ = 0;
         while(_loc38_ < _loc50_.length)
         {
            _loc39_ = _loc38_ + 1;
            while(_loc39_ < _loc50_.length)
            {
               if(_loc50_[_loc38_].x == _loc50_[_loc39_].x && _loc50_[_loc38_].y == _loc50_[_loc39_].y)
               {
                  _loc50_.splice(_loc39_,1);
                  _loc39_--;
               }
               _loc39_++;
            }
            _loc38_++;
         }
         _loc7_ = obstaclesFromSquares(_loc50_,[param1,param2]);
         var _loc9_:Array = [];
         for(_loc38_ in _loc7_)
         {
            for(_loc39_ in _loc7_[_loc38_])
            {
               _loc9_.push([_loc7_[_loc38_][_loc39_],_loc7_[_loc38_][_loc7_[_loc38_][_loc39_].next]]);
            }
         }
         var _loc27_:Array = [];
         for(_loc38_ in _loc9_)
         {
            _loc24_ = MathFunctions.SegmentHitsSegment(_loc17_.x,_loc17_.y,_loc30_.x,_loc30_.y,_loc9_[_loc38_][0].x,_loc9_[_loc38_][0].y,_loc9_[_loc38_][1].x,_loc9_[_loc38_][1].y) != null;
            _loc26_ = MathFunctions.SegmentHitsSegment(_loc17_.x,_loc17_.y,_loc31_.x,_loc31_.y,_loc9_[_loc38_][0].x,_loc9_[_loc38_][0].y,_loc9_[_loc38_][1].x,_loc9_[_loc38_][1].y) != null;
            if(_loc24_ && _loc26_)
            {
               return null;
            }
            if(MathFunctions.PointInTriangle(_loc9_[_loc38_][0],_loc17_,_loc30_,_loc31_) || MathFunctions.PointInTriangle(_loc9_[_loc38_][1],_loc17_,_loc30_,_loc31_))
            {
               _loc51_ = MathFunctions.CalcAngle(_loc17_.x,_loc17_.y,_loc9_[_loc38_][0].x,_loc9_[_loc38_][0].y);
               _loc52_ = MathFunctions.CalcAngle(_loc17_.x,_loc17_.y,_loc9_[_loc38_][1].x,_loc9_[_loc38_][1].y);
               if(_loc51_ > _loc52_ && _loc51_ - _loc52_ < 3.141592653589793 || _loc52_ > _loc51_ && _loc52_ - _loc51_ > 3.141592653589793)
               {
                  _loc11_ = _loc51_;
                  _loc51_ = _loc52_;
                  _loc52_ = _loc11_;
               }
               _loc27_.push({
                  "segment":_loc9_[_loc38_],
                  "lowAngle":_loc51_,
                  "highAngle":_loc52_
               });
            }
         }
         _loc38_ = 0;
         while(_loc38_ < _loc27_.length)
         {
            for(_loc39_ in _loc27_)
            {
               if(_loc38_ != _loc39_ && (MathFunctions.AngleFallsBetween(_loc27_[_loc39_].lowAngle,_loc27_[_loc38_].lowAngle,_loc27_[_loc38_].highAngle) || MathFunctions.AngleFallsBetween(_loc27_[_loc39_].highAngle,_loc27_[_loc38_].lowAngle,_loc27_[_loc38_].highAngle)))
               {
                  _loc45_ = _loc27_[_loc38_].lowAngle;
                  _loc43_ = _loc27_[_loc39_].lowAngle;
                  _loc16_ = _loc27_[_loc38_].highAngle;
                  _loc21_ = _loc27_[_loc39_].highAngle;
                  if(MathFunctions.AngleDifference(_loc45_,_loc43_) > 0)
                  {
                     _loc34_ = _loc45_;
                  }
                  else
                  {
                     _loc34_ = _loc43_;
                  }
                  if(_loc34_ < 0)
                  {
                     _loc34_ += MathFunctions.dblPI;
                  }
                  if(MathFunctions.AngleDifference(_loc16_,_loc21_) < 0)
                  {
                     _loc22_ = _loc16_;
                  }
                  else
                  {
                     _loc22_ = _loc21_;
                  }
                  if(_loc22_ > MathFunctions.dblPI)
                  {
                     _loc22_ -= MathFunctions.dblPI;
                  }
                  _loc27_.push({
                     "lowAngle":_loc34_,
                     "highAngle":_loc22_
                  });
                  _loc27_.splice(_loc39_,1);
                  if(_loc39_ < _loc38_)
                  {
                     _loc38_--;
                  }
                  _loc27_.splice(_loc38_,1);
                  _loc38_--;
                  break;
               }
            }
            _loc38_++;
         }
         var _loc20_:Array = [];
         _loc20_.push({
            "lowAngle":_loc14_,
            "highAngle":_loc13_
         });
         _loc38_ = 0;
         while(_loc38_ < _loc20_.length)
         {
            for(_loc39_ in _loc27_)
            {
               if(MathFunctions.AngleFallsBetween(_loc20_[_loc38_].lowAngle,_loc27_[_loc39_].lowAngle,_loc27_[_loc39_].highAngle) && MathFunctions.AngleFallsBetween(_loc20_[_loc38_].highAngle,_loc27_[_loc39_].lowAngle,_loc27_[_loc39_].highAngle))
               {
                  _loc20_.splice(_loc38_,1);
                  _loc38_--;
                  break;
               }
               _loc19_ = MathFunctions.AngleFallsBetween(_loc27_[_loc39_].lowAngle,_loc20_[_loc38_].lowAngle,_loc20_[_loc38_].highAngle);
               _loc32_ = MathFunctions.AngleFallsBetween(_loc27_[_loc39_].highAngle,_loc20_[_loc38_].lowAngle,_loc20_[_loc38_].highAngle);
               if(_loc19_ && _loc32_)
               {
                  _loc20_.push({
                     "lowAngle":_loc20_[_loc38_].lowAngle,
                     "highAngle":_loc27_[_loc39_].lowAngle
                  });
                  _loc20_.push({
                     "lowAngle":_loc27_[_loc39_].highAngle,
                     "highAngle":_loc20_[_loc38_].highAngle
                  });
                  _loc20_.splice(_loc38_,1);
                  _loc38_--;
                  break;
               }
               if(_loc19_)
               {
                  _loc20_[_loc38_].highAngle = _loc27_[_loc39_].lowAngle;
               }
               else if(_loc32_)
               {
                  _loc20_[_loc38_].lowAngle = _loc27_[_loc39_].highAngle;
               }
            }
            _loc38_++;
         }
         if(_loc20_.length == 0)
         {
            return null;
         }
         _loc37_ = 0 - Infinity;
         for(_loc38_ in _loc20_)
         {
            _loc42_ = MathFunctions.AngleDifference(_loc20_[_loc38_].lowAngle,_loc20_[_loc38_].highAngle);
            if(_loc42_ > _loc37_)
            {
               _loc37_ = _loc42_;
               _loc25_ = _loc20_[_loc38_];
            }
         }
         var _loc5_:Number = (_loc25_.highAngle + _loc25_.lowAngle) / 2;
         if(Math.abs(_loc25_.highAngle - _loc25_.lowAngle) > 3.141592653589793)
         {
            _loc5_ += 3.141592653589793;
         }
         if(_loc5_ > MathFunctions.dblPI)
         {
            _loc5_ -= MathFunctions.dblPI;
         }
         var _loc6_:Array = [];
         var _loc41_:* = calculateMaxShotOffset(param1);
         if(param1.currentAmmo is Item && param1.currentAmmo.shotgunAmmo && param1.currentAmmoData.pallets > 1)
         {
            _loc35_ = param1.currentWeaponData.spread * (1 + param1.attachmentsEffects(param1.currSlot).spread / 10);
            _loc33_ = _loc5_ - _loc35_ / 2;
            _loc18_ = _loc35_ / (param1.currentAmmoData.pallets - 1);
            _loc38_ = 0;
            while(_loc38_ < param1.currentAmmoData.pallets)
            {
               _loc36_ = _loc33_ + _loc18_ * _loc38_;
               _loc6_.push({
                  "lowAngle":_loc36_ - _loc41_,
                  "highAngle":_loc36_ + _loc41_
               });
               _loc38_++;
            }
         }
         else
         {
            _loc6_.push({
               "lowAngle":_loc5_ - _loc41_,
               "highAngle":_loc5_ + _loc41_
            });
         }
         var _loc10_:* = 0;
         for(_loc38_ in _loc6_)
         {
            _loc29_ = MathFunctions.AngleDifference(_loc6_[_loc38_].lowAngle,_loc6_[_loc38_].highAngle);
            _loc46_ = [];
            for(_loc39_ in _loc20_)
            {
               if(MathFunctions.AngleFallsBetween(_loc6_[_loc38_].lowAngle,_loc20_[_loc39_].lowAngle,_loc20_[_loc39_].highAngle) && MathFunctions.AngleFallsBetween(_loc6_[_loc38_].highAngle,_loc20_[_loc39_].lowAngle,_loc20_[_loc39_].highAngle))
               {
                  _loc46_.push({
                     "lowAngle":_loc6_[_loc38_].lowAngle,
                     "highAngle":_loc6_[_loc38_].highAngle
                  });
                  break;
               }
               _loc19_ = MathFunctions.AngleFallsBetween(_loc20_[_loc39_].lowAngle,_loc6_[_loc38_].lowAngle,_loc6_[_loc38_].highAngle);
               _loc32_ = MathFunctions.AngleFallsBetween(_loc20_[_loc39_].highAngle,_loc6_[_loc38_].lowAngle,_loc6_[_loc38_].highAngle);
               if(_loc19_ && _loc32_)
               {
                  _loc46_.push({
                     "lowAngle":_loc20_[_loc39_].lowAngle,
                     "highAngle":_loc20_[_loc39_].highAngle
                  });
               }
               else
               {
                  if(_loc19_)
                  {
                     _loc46_.push({
                        "lowAngle":_loc20_[_loc39_].lowAngle,
                        "highAngle":_loc6_[_loc38_].highAngle
                     });
                  }
                  if(_loc32_)
                  {
                     _loc46_.push({
                        "lowAngle":_loc6_[_loc38_].lowAngle,
                        "highAngle":_loc20_[_loc39_].highAngle
                     });
                  }
               }
            }
            _loc15_ = 0;
            for(_loc39_ in _loc46_)
            {
               _loc15_ += MathFunctions.AngleDifference(_loc46_[_loc39_].lowAngle,_loc46_[_loc39_].highAngle);
            }
            _loc10_ += _loc15_ / _loc29_ * (1 - _loc10_);
         }
         return {
            "hitChance":_loc10_,
            "aimAngle":_loc5_
         };
      }
      
      internal function lineToSquares(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc13_:* = undefined;
         var _loc26_:* = undefined;
         var _loc22_:* = undefined;
         var _loc12_:* = undefined;
         var _loc21_:* = undefined;
         var _loc18_:* = undefined;
         var _loc11_:* = undefined;
         var _loc16_:* = undefined;
         var _loc29_:* = undefined;
         var _loc27_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc14_:* = undefined;
         var _loc17_:* = undefined;
         var _loc9_:* = undefined;
         var _loc20_:* = undefined;
         var _loc10_:* = undefined;
         var _loc15_:* = undefined;
         var _loc28_:Array = [];
         var _loc19_:Number = Math.floor(param1 / squareWidth);
         var _loc6_:Number = Math.floor(param2 / squareHeight);
         var _loc25_:Number = Math.floor(param3 / squareWidth);
         var _loc23_:Number = Math.floor(param4 / squareHeight);
         _loc22_ = param3 - param1;
         _loc12_ = param4 - param2;
         var _loc24_:* = MathFunctions.co2ab(param1,param2,param3,param4);
         if(_loc24_.x is Number)
         {
            _loc27_ = Math.min(_loc6_,_loc23_);
            while(_loc27_ <= Math.max(_loc6_,_loc23_))
            {
               _loc28_.push({
                  "x":_loc19_,
                  "y":_loc27_
               });
               _loc27_++;
            }
         }
         else if(Math.abs(_loc22_) > Math.abs(_loc12_))
         {
            _loc29_ = _loc22_ / Math.abs(_loc22_);
            _loc21_ = Math.floor(param1 / squareWidth);
            _loc18_ = Math.floor(param2 / squareHeight);
            _loc27_ = 0;
            while(_loc27_ <= Math.ceil(Math.abs(_loc22_ / squareWidth)))
            {
               _loc13_ = param1 + _loc29_ * _loc27_ * squareWidth;
               _loc26_ = _loc24_.a * _loc13_ + _loc24_.b;
               _loc11_ = Math.floor(_loc13_ / squareWidth);
               _loc16_ = Math.floor(_loc26_ / squareHeight);
               if(_loc18_ != _loc11_)
               {
                  _loc28_.push({
                     "x":_loc21_,
                     "y":_loc16_
                  });
                  _loc28_.push({
                     "x":_loc11_,
                     "y":_loc18_
                  });
               }
               _loc28_.push({
                  "x":_loc11_,
                  "y":_loc16_
               });
               _loc21_ = _loc11_;
               _loc18_ = _loc16_;
               _loc27_++;
            }
         }
         else
         {
            _loc29_ = _loc12_ / Math.abs(_loc12_);
            _loc21_ = Math.floor(param1 / squareWidth);
            _loc18_ = Math.floor(param2 / squareHeight);
            _loc27_ = 0;
            while(_loc27_ <= Math.ceil(Math.abs(_loc12_ / squareHeight)))
            {
               _loc26_ = param2 + _loc29_ * _loc27_ * squareHeight;
               _loc13_ = (_loc26_ - _loc24_.b) / _loc24_.a;
               _loc11_ = Math.floor(_loc13_ / squareWidth);
               _loc16_ = Math.floor(_loc26_ / squareHeight);
               if(_loc21_ != _loc11_)
               {
                  _loc28_.push({
                     "x":_loc11_,
                     "y":_loc18_
                  });
                  _loc28_.push({
                     "x":_loc21_,
                     "y":_loc16_
                  });
               }
               _loc28_.push({
                  "x":_loc11_,
                  "y":_loc16_
               });
               _loc21_ = _loc11_;
               _loc18_ = _loc16_;
               _loc27_++;
            }
         }
         var _loc5_:Array = [];
         if(_loc24_.x is Number)
         {
            for(_loc27_ in _loc28_)
            {
               _loc5_.push({
                  "x":_loc28_[_loc27_].x,
                  "y":_loc28_[_loc27_].y
               });
            }
         }
         else
         {
            for(_loc27_ in _loc28_)
            {
               _loc20_ = _loc28_[_loc27_].y * squareHeight;
               _loc10_ = (_loc28_[_loc27_].y + 1) * squareHeight;
               _loc15_ = (_loc20_ - _loc24_.b) / _loc24_.a;
               _loc7_ = (_loc10_ - _loc24_.b) / _loc24_.a;
               _loc17_ = _loc28_[_loc27_].x * squareWidth;
               _loc9_ = (_loc28_[_loc27_].x + 1) * squareWidth;
               _loc8_ = _loc24_.a * _loc17_ + _loc24_.b;
               _loc14_ = _loc24_.a * _loc9_ + _loc24_.b;
               if(_loc15_ >= _loc17_ && _loc15_ <= _loc9_ || _loc7_ >= _loc17_ && _loc7_ <= _loc9_ || _loc8_ >= _loc20_ && _loc8_ <= _loc10_ || _loc14_ >= _loc20_ && _loc14_ <= _loc10_)
               {
                  _loc5_.push({
                     "x":_loc28_[_loc27_].x,
                     "y":_loc28_[_loc27_].y
                  });
               }
            }
         }
         return _loc5_;
      }
      
      public function reload() : *
      {
         if((ActList[nowActing].currentWeaponType.category == 2 || ActList[nowActing].currentWeaponType.category == 3 || ActList[nowActing].currentWeaponType.category == 4) && ActList[nowActing].AP >= ActList[nowActing].currentWeaponReloadAP)
         {
            if(ActList[nowActing].reload(ActList[nowActing].currSlot))
            {
               ActList[nowActing].reduceAP(ActList[nowActing].currentWeaponReloadAP);
               if(ActList[nowActing].AP <= 0)
               {
                  nextTurn();
               }
               else
               {
                  updateInterface();
               }
               return true;
            }
         }
         return false;
      }
      
      public function switchWeapon() : *
      {
         if(ActList[nowActing].currSlot == 0)
         {
            ActList[nowActing].currSlot = 1;
         }
         else
         {
            ActList[nowActing].currSlot = 0;
         }
         updateInterface();
      }
      
      public function switchHealingMode() : *
      {
         healingMode = !healingMode && inControl() && ActList[nowActing].hasFirstAid;
         updateInterface();
      }
      
      public function heal(param1:*) : *
      {
         var _loc2_:Number = Math.round(ActList[nowActing].firstAidSkill / 200 * Item.getDataFromType(ActList[nowActing].selectedFirstAidType).heal);
         generateMessage(param1,"heal",Math.min(_loc2_,Math.ceil(param1.bleeding)));
         ActList[nowActing].firstAidExperience += ActList[nowActing].learningCapacity;
         ActList[nowActing].lookAt(param1.x,param1.y);
         param1.bleeding -= _loc2_;
         if(param1.bleeding < 0.5)
         {
            param1.bleeding = 0;
         }
         ActList[nowActing].reduceItemFromEquipment(ActList[nowActing].selectedFirstAidType,1);
         ActList[nowActing].updateFirstAid();
         healingMode = false;
         ActList[nowActing].reduceAP(ActList[nowActing].healAP);
         if(ActList[nowActing].AP <= 0)
         {
            ActList[nowActing].AP = 0;
            nextTurn();
         }
         else
         {
            updateInterface();
         }
      }
      
      public function dropWeapon() : *
      {
         var _loc4_:* = undefined;
         var _loc9_:* = undefined;
         var _loc1_:* = undefined;
         var _loc7_:* = undefined;
         var _loc10_:* = undefined;
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         if(ActList[nowActing].weapons[ActList[nowActing].currSlot] != 0)
         {
            _loc9_ = ActList[nowActing].currentWeaponData.animatedWeapon;
            _loc1_ = new BitmapData(50,50,true,0);
            _loc10_ = ActList[nowActing].currentWeaponAnimationType;
            if(ActList[nowActing].currentWeaponType.category == 5)
            {
               _loc1_.copyPixels(AnimationData.getSprite("Grenade",0,0,1),new Rectangle(0,0,10,10),new Point(20,20));
            }
            else
            {
               if(ActList[nowActing].currentWeaponData.bigGunBackpack > 0)
               {
                  _loc7_ = AnimationData.spriteBoundaries["BigGunBackpack"][ActList[nowActing].currentWeaponData.bigGunBackpack][1].length - 1;
                  _loc1_.copyPixels(AnimationData.getSprite("BigGunBackpack",ActList[nowActing].currentWeaponData.bigGunBackpack,1,_loc7_),new Rectangle(0,0,AnimationData.spriteBoundaries["BigGunBackpack"][ActList[nowActing].currentWeaponData.bigGunBackpack][1][_loc7_].width,AnimationData.spriteBoundaries["BigGunBackpack"][ActList[nowActing].currentWeaponData.bigGunBackpack][1][_loc7_].height),new Point(25 - Math.round(AnimationData.spriteBoundaries["BigGunBackpack"][ActList[nowActing].currentWeaponData.bigGunBackpack][1][_loc7_].width / 2),25 - Math.round(AnimationData.spriteBoundaries["BigGunBackpack"][ActList[nowActing].currentWeaponData.bigGunBackpack][1][_loc7_].height / 2)));
               }
               if(_loc9_ != 0)
               {
                  _loc7_ = AnimationData.spriteBoundaries["Weapon"][_loc9_][0].length - 1;
                  _loc1_.copyPixels(AnimationData.getSprite("Weapon",_loc9_,0,_loc7_),new Rectangle(0,0,AnimationData.spriteBoundaries["Weapon"][_loc9_][0][_loc7_].width,AnimationData.spriteBoundaries["Weapon"][_loc9_][0][_loc7_].height),new Point(25 - Math.round(AnimationData.spriteBoundaries["Weapon"][_loc9_][0][_loc7_].width / 2),25 - Math.round(AnimationData.spriteBoundaries["Weapon"][_loc9_][0][_loc7_].height / 2)),null,null,true);
               }
            }
            _loc5_ = new Bitmap(_loc1_);
            _loc2_ = map2Screen(ActList[nowActing].x,ActList[nowActing].y);
            _loc5_.x = _loc2_.x - 25;
            _loc5_.y = _loc2_.y - 25;
            UnderGrid.addChild(_loc5_);
            if(!(DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY] is Array))
            {
               DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY] = [];
            }
            _loc3_ = [];
            for(_loc4_ in ActList[nowActing].attachments[ActList[nowActing].currSlot])
            {
               if(ActList[nowActing].attachments[ActList[nowActing].currSlot][_loc4_] > 0)
               {
                  _loc3_.push(ActList[nowActing].attachments[ActList[nowActing].currSlot][_loc4_]);
               }
            }
            if(WeaponsData.WeaponTypes[WeaponsData.Weapons[ActList[nowActing].weapons[ActList[nowActing].currSlot]].type].category == 5)
            {
               _loc6_ = ActList[nowActing].grenadeAmounts[ActList[nowActing].currSlot];
            }
            else
            {
               _loc6_ = ActList[nowActing].currentAmmo.amount;
            }
            DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].push({
               "type":ActList[nowActing].weapons[ActList[nowActing].currSlot],
               "bitmap":_loc5_,
               "ammoType":ActList[nowActing].currentAmmo.type,
               "ammoAmount":_loc6_,
               "attachments":_loc3_
            });
            _loc8_ = Item.itemNumFromCatSubCat(2,ActList[nowActing].weapons[ActList[nowActing].currSlot]);
            if(WeaponsData.WeaponTypes[WeaponsData.Weapons[ActList[nowActing].weapons[ActList[nowActing].currSlot]].type].category == 5)
            {
               ActList[nowActing].reduceItemFromEquipment(_loc8_,ActList[nowActing].grenadeAmounts[ActList[nowActing].currSlot],true);
            }
            else
            {
               ActList[nowActing].reduceItemFromEquipment(_loc8_,1,true);
            }
            if(ActList[nowActing].currentAmmo.amount > 0)
            {
               _loc8_ = ActList[nowActing].currentAmmo.type;
               ActList[nowActing].reduceItemFromEquipment(_loc8_,ActList[nowActing].currentAmmo.amount,true);
            }
            for(_loc4_ in ActList[nowActing].attachments[ActList[nowActing].currSlot])
            {
               if(ActList[nowActing].attachments[ActList[nowActing].currSlot][_loc4_] > 0)
               {
                  _loc8_ = Item.itemNumFromCatSubCat(4,ActList[nowActing].attachments[ActList[nowActing].currSlot][_loc4_]);
                  ActList[nowActing].reduceItemFromEquipment(_loc8_,1,true);
               }
            }
            ActList[nowActing].loadedAmmo[ActList[nowActing].currSlot] = null;
            ActList[nowActing].weapons[ActList[nowActing].currSlot] = 0;
            ActList[nowActing].attachments[ActList[nowActing].currSlot] = [];
            ActList[nowActing].updateSelectedAmmo(ActList[nowActing].currSlot);
            updateInterface();
            return true;
         }
         return false;
      }
      
      public function pickUpWeapon() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(canPickUp())
         {
            _loc2_ = DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].splice(DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].length - ActList[nowActing].pickUpPos - 1,1)[0];
            if(ActList[nowActing].pickUpPos >= DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].length)
            {
               ActList[nowActing].pickUpPos = DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].length - 1;
            }
            if(ActList[nowActing].pickUpPos < 0)
            {
               ActList[nowActing].pickUpPos = 0;
            }
            ActList[nowActing].weapons[ActList[nowActing].currSlot] = _loc2_.type;
            if(_loc2_.bitmap is Bitmap && UnderGrid.contains(_loc2_.bitmap))
            {
               UnderGrid.removeChild(_loc2_.bitmap);
            }
            if(_loc2_.character is Character)
            {
               _loc2_.character.weapons[_loc2_.character.currSlot] = 0;
            }
            if(_loc2_.ammoType > 0 && _loc2_.ammoAmount > 0)
            {
               ActList[nowActing].loadedAmmo[ActList[nowActing].currSlot] = new Item(_loc2_.ammoType,_loc2_.ammoAmount);
            }
            else
            {
               ActList[nowActing].loadedAmmo[ActList[nowActing].currSlot] = null;
            }
            if(_loc2_.attachments is Array && _loc2_.attachments.length > 0)
            {
               for(_loc1_ in _loc2_.attachments)
               {
                  if(_loc2_.attachments[_loc1_] > 0)
                  {
                     ActList[nowActing].attachments[ActList[nowActing].currSlot].push(_loc2_.attachments[_loc1_]);
                  }
               }
            }
            ActList[nowActing].updateSelectedAmmo(ActList[nowActing].currSlot);
            _loc3_ = Item.itemNumFromCatSubCat(2,_loc2_.type);
            ActList[nowActing].addItemToEquipment(new Item(_loc3_,1),true);
            GroupCaravans[ActList[nowActing].group].addCargo(_loc3_,1,true);
            if(WeaponsData.WeaponTypes[WeaponsData.Weapons[_loc2_.type].type].category == 5)
            {
               ActList[nowActing].grenadeAmounts[ActList[nowActing].currSlot] = _loc2_.ammoAmount;
            }
            else
            {
               _loc3_ = _loc2_.ammoType;
               if(_loc3_ > 0 && _loc2_.ammoAmount > 0)
               {
                  ActList[nowActing].addItemToEquipment(new Item(_loc3_,_loc2_.ammoAmount),true);
                  GroupCaravans[ActList[nowActing].group].addCargo(_loc3_,_loc2_.ammoAmount,true);
               }
            }
            for(_loc1_ in _loc2_.attachments)
            {
               if(_loc2_.attachments[_loc1_] > 0)
               {
                  _loc3_ = Item.itemNumFromCatSubCat(4,_loc2_.attachments[_loc1_]);
                  ActList[nowActing].addItemToEquipment(new Item(_loc3_,1),true);
                  GroupCaravans[ActList[nowActing].group].addCargo(_loc3_,1,true);
               }
            }
            ActList[nowActing].reduceAP(ActList[nowActing].pickUpAP);
            if(ActList[nowActing].AP <= 0)
            {
               nextTurn();
            }
            else
            {
               updateInterface();
            }
         }
      }
      
      public function canPickUp() : *
      {
         return ActList[nowActing].AP >= ActList[nowActing].pickUpAP && ActList[nowActing].weapons[ActList[nowActing].currSlot] == 0 && DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY] is Array && DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].length > 0;
      }
      
      public function unloadWeapon() : *
      {
         var _loc1_:int = 0;
         if(ActList[nowActing].AP >= _loc1_)
         {
            if(ActList[nowActing].unloadWeapon(ActList[nowActing].currSlot))
            {
               ActList[nowActing].reduceAP(_loc1_);
               if(ActList[nowActing].AP <= 0)
               {
                  nextTurn();
               }
               ActList[nowActing].updateSelectedAmmo();
               updateInterface();
               return true;
            }
         }
         return false;
      }
      
      public function changeCurrPickUpPos(param1:*) : *
      {
         if(DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY] is Array)
         {
            ActList[nowActing].pickUpPos += param1;
            if(ActList[nowActing].pickUpPos >= DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].length)
            {
               ActList[nowActing].pickUpPos = 0;
            }
            if(ActList[nowActing].pickUpPos < 0)
            {
               ActList[nowActing].pickUpPos = DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].length - 1;
            }
            updateInterface();
         }
      }
      
      public function createExplosion(param1:*, param2:*, param3:*, param4:*, param5:* = false) : *
      {
         var _loc14_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc9_:* = undefined;
         var _loc13_:Number = param3 * 5;
         if(GameData.soundFXOn)
         {
            if(param5)
            {
               playSoundAt(new SFXMolotov(),param1,param2);
            }
            else
            {
               playSoundAt(new SFXExplosion(),param1,param2);
            }
         }
         _loc11_ = 0;
         while(_loc11_ < MathFunctions.dblPI)
         {
            _loc14_ = checkHit(param1,param2,param1 + Math.sin(_loc11_) * _loc13_,param2 + Math.cos(_loc11_) * _loc13_,null,false,true);
            if(_loc14_ is Object)
            {
               _loc7_ = (_loc13_ - _loc14_.distance) / _loc13_;
               if(_loc14_.segment[0].belongsTo is Character || _loc14_.segment[0].belongsTo is TransportUnit)
               {
                  if(param5)
                  {
                     if(_loc14_.segment[0].belongsTo is Character)
                     {
                        burn(_loc14_.segment[0].belongsTo,Math.max(param3 * _loc7_ * (1 - _loc14_.segment[0].belongsTo.fireResistance / 100),0) * 20,param1,param2);
                     }
                     if(_loc14_.segment[0].belongsTo is TransportUnit)
                     {
                        _loc14_.segment[0].belongsTo.lastHitDamage += (50 - Math.pow(_loc14_.distance,0.5)) * param3 * Math.max(1 - _loc14_.segment[0].belongsTo.fireResistance / 100,0) * 0.0001;
                     }
                  }
                  else
                  {
                     _loc6_ = param3 * _loc7_ / 2 - _loc14_.segment[0].belongsTo.explosionResistance / 10;
                     _loc6_ = _loc6_ + Math.max((param4 - _loc14_.segment[0].belongsTo.explosionResistance) / 10,0);
                     if(_loc14_.segment[0].belongsTo is Character)
                     {
                        _loc14_.segment[0].belongsTo.hitFrom = {
                           "x":param1,
                           "y":param2
                        };
                        _loc14_.segment[0].belongsTo.bleeding += _loc6_ / 5;
                        if(difficulty == 2)
                        {
                           _loc14_.segment[0].belongsTo.bleeding += _loc6_ / 5;
                        }
                        _loc14_.segment[0].belongsTo.hitByFlame = false;
                     }
                     _loc14_.segment[0].belongsTo.lastHitDamage += _loc6_;
                     _loc14_.segment[0].belongsTo.hitInThisTurn = true;
                     if(_loc14_.segment[0].belongsTo.HP > _loc14_.segment[0].belongsTo.lastHitDamage)
                     {
                        _loc12_ = 6;
                        if(difficulty == 1)
                        {
                           _loc12_ = 8;
                        }
                        if(_loc14_.segment[0].belongsTo is Character && !_loc14_.segment[0].belongsTo.legDamage && Math.pow(Math.random(),_loc12_) > 1 / Math.pow(_loc6_,0.1))
                        {
                           _loc14_.segment[0].belongsTo.legDamage = true;
                           generateMessage(_loc14_.segment[0].belongsTo,"leg damage");
                        }
                        if(_loc14_.segment[0].belongsTo is Character && !_loc14_.segment[0].belongsTo.armDamage && Math.pow(Math.random(),_loc12_) > 1 / Math.pow(_loc6_,0.1))
                        {
                           _loc14_.segment[0].belongsTo.armDamage = true;
                           generateMessage(_loc14_.segment[0].belongsTo,"arm damage");
                        }
                     }
                  }
               }
            }
            _loc11_ += 0.09817477042;
         }
         _loc10_ = map2Screen(param1,param2);
         activeExplosions.push({
            "x":param1,
            "y":param2,
            "frame":0,
            "screenX":_loc10_.x - 150,
            "screenY":_loc10_.y - 200,
            "width":1,
            "height":1
         });
         var _loc8_:* = MathFunctions.CalcDistance(screenWidth / 2,screenHeight / 2,_loc10_.x + MobilePart.x,_loc10_.y + MobilePart.y);
         if(_loc8_ < 500)
         {
            _loc9_ = (500 - _loc8_) / 500 * 6;
            if(Math.random() > 0.5)
            {
               cameraShakePower += _loc9_;
            }
            else
            {
               cameraShakePower -= _loc9_;
            }
         }
      }
      
      public function nextAmmoType() : *
      {
         ActList[nowActing].changeSelectedAmmo(1);
         updateInterface();
      }
      
      public function prevAmmoType() : *
      {
         ActList[nowActing].changeSelectedAmmo(-1);
         updateInterface();
      }
      
      public function prevWeaponMode() : *
      {
         ActList[nowActing].currModes[ActList[nowActing].currSlot]--;
         if(ActList[nowActing].currModes[ActList[nowActing].currSlot] < 0)
         {
            ActList[nowActing].currModes[ActList[nowActing].currSlot] = ActList[nowActing].currentWeaponType.modes.length - 1;
         }
         updateInterface();
      }
      
      public function nextWeaponMode() : *
      {
         ActList[nowActing].currModes[ActList[nowActing].currSlot]++;
         if(ActList[nowActing].currModes[ActList[nowActing].currSlot] >= ActList[nowActing].currentWeaponType.modes.length)
         {
            ActList[nowActing].currModes[ActList[nowActing].currSlot] = 0;
         }
         updateInterface();
      }
      
      public function prevFirstAid() : *
      {
         ActList[nowActing].firstAidStep(-1);
         updateInterface();
      }
      
      public function nextFirstAid() : *
      {
         ActList[nowActing].firstAidStep(1);
         updateInterface();
      }
      
      public function defaultOnInterfaceUpdate(param1:*) : *
      {
         if(param1.playersTurn)
         {
            trace("your character: " + param1.name);
            trace("AP: " + param1.AP);
            if(param1.healingMode)
            {
               trace("healing mode");
               trace("Bandage: type: " + param1.firstAidType + " name: " + param1.firstAidName + " amount: " + param1.firstAidAmount);
            }
            else
            {
               trace("weapon mode");
               trace("Weapon: category: " + param1.weaponCategory + " type: " + param1.weaponType + " name: " + param1.weaponName);
               if(param1.weaponCategory == 0 || param1.weaponCategory == 1)
               {
               }
               if(param1.weaponCategory == 2 || param1.weaponCategory == 3 || param1.weaponCategory == 4)
               {
                  if(param1.hasLoadedAmmo)
                  {
                     trace("Loaded Ammo: type: " + param1.loadedAmmoType + " name: " + param1.loadedAmmoName + " amount: " + param1.loadedAmmoAmount);
                  }
                  else
                  {
                     trace("no ammo loaded");
                  }
                  if(param1.selectedAmmoAmount > 0)
                  {
                     trace("Selected Ammo: type: " + param1.selectedAmmoType + " name: " + param1.selectedAmmoName + " amount: " + param1.selectedAmmoAmount);
                  }
                  else
                  {
                     trace("no ammo to reload");
                  }
               }
               if(param1.weaponCategory == 5)
               {
                  trace("Grenades Amount: " + param1.grenadesAmount);
               }
               trace("Weapon Mode: name: " + param1.weaponModeName + " AP: " + param1.weaponModeAP);
               if(param1.hasFirstAid)
               {
                  trace("Bandage: name: " + param1.firstAidName + " amount: " + param1.firstAidAmount);
               }
               else
               {
                  trace("no bandage");
               }
            }
            if(param1.anyWeaponsToPickUp)
            {
               trace("Weapon to pick up: " + param1.pickUpWeaponName);
            }
         }
         else
         {
            trace("other group character");
         }
         trace("--------------");
      }
      
      public function defaultInterfaceOnOff(param1:*) : *
      {
         if(param1)
         {
            trace("enabling interface");
         }
         else
         {
            trace("disabling interface");
         }
      }
      
      public function updateInterface() : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         interfaceData.playersTurn = ActList[nowActing].controlled;
         interfaceData.AP = ActList[nowActing].AP;
         interfaceData.maxAP = ActList[nowActing].maxAP;
         interfaceData.HP = Math.round(ActList[nowActing].HP);
         interfaceData.maxHP = ActList[nowActing].maxHP;
         interfaceData.morale = Math.min(100,Math.max(Math.round(ActList[nowActing].battleMorale),0));
         interfaceData.name = ActList[nowActing].name;
         interfaceData.healingMode = healingMode;
         interfaceData.bleeding = ActList[nowActing].bleeding;
         interfaceData.burning = ActList[nowActing].burning;
         interfaceData.overloaded = ActList[nowActing].equipmentWeight > ActList[nowActing].capacity;
         interfaceData.eyeDamage = ActList[nowActing].eyeDamage;
         interfaceData.armDamage = ActList[nowActing].armDamage;
         interfaceData.legDamage = ActList[nowActing].legDamage;
         interfaceData.characterPointer = ActList[nowActing];
         interfaceData.yourPeople = yourPeople;
         interfaceData.allies = allies;
         interfaceData.enemies = enemies;
         interfaceData.hasFirstAid = ActList[nowActing].hasFirstAid;
         if(ActList[nowActing].hasFirstAid)
         {
            interfaceData.firstAidType = ActList[nowActing].selectedFirstAidType;
            interfaceData.firstAidName = Texts.fetch(Item.getDataFromType(interfaceData.firstAidType).name);
            interfaceData.firstAidAmount = ActList[nowActing].selectedFirstAidAmount;
         }
         else
         {
            interfaceData.firstAidType = 0;
            interfaceData.firstAidName = "";
            interfaceData.firstAidAmount = 0;
         }
         interfaceData.healAP = ActList[nowActing].healAP;
         interfaceData.weaponCategory = ActList[nowActing].currentWeaponType.category;
         interfaceData.weaponType = ActList[nowActing].currentWeaponData.type;
         interfaceData.weaponInd = ActList[nowActing].weapons[ActList[nowActing].currSlot];
         interfaceData.weaponName = Texts.fetch(ActList[nowActing].currentWeaponData.name);
         interfaceData.aimedShot = ActList[nowActing].currentWeaponMode.aimed;
         interfaceData.headShot = ActList[nowActing].currentWeaponMode.headShot;
         interfaceData.burst = ActList[nowActing].currentWeaponMode.burst;
         interfaceData.parallelShots = ActList[nowActing].currentWeaponMode.parallelShots;
         interfaceData.hasScope = false;
         interfaceData.hasLaser = false;
         var _loc1_:* = ActList[nowActing].attachmentsBatteryStatus();
         for(_loc3_ in ActList[nowActing].attachments[ActList[nowActing].currSlot])
         {
            if(ActList[nowActing].attachments[ActList[nowActing].currSlot][_loc3_] > 0 && _loc1_[ActList[nowActing].currSlot][_loc3_])
            {
               if(WeaponsData.Attachments[ActList[nowActing].attachments[ActList[nowActing].currSlot][_loc3_]].type == 1)
               {
                  interfaceData.hasScope = true;
               }
               if(WeaponsData.Attachments[ActList[nowActing].attachments[ActList[nowActing].currSlot][_loc3_]].type == 2)
               {
                  interfaceData.hasLaser = true;
               }
            }
         }
         interfaceData.portrait = ActList[nowActing].getPortrait();
         if(ActList[nowActing].weapons[ActList[nowActing].currSlot] == 0)
         {
            interfaceData.weaponModeName = Texts.fetch(ActList[nowActing].currentWeaponMode.name);
         }
         else
         {
            interfaceData.weaponModeName = new Item(Item.itemNumFromCatSubCat(2,ActList[nowActing].weapons[ActList[nowActing].currSlot])).getWeaponModeName(ActList[nowActing].currModes[ActList[nowActing].currSlot]);
         }
         interfaceData.weaponModeAP = ActList[nowActing].weaponModeAP();
         if(ActList[nowActing].currentWeaponType.category == 5)
         {
            interfaceData.loadedAmmoAmount = ActList[nowActing].grenadeAmounts[ActList[nowActing].currSlot];
         }
         else
         {
            interfaceData.loadedAmmoAmount = ActList[nowActing].currentAmmo.amount;
         }
         interfaceData.hasLoadedAmmo = interfaceData.loadedAmmoAmount > 0;
         interfaceData.loadedAmmoType = ActList[nowActing].currentAmmo.type;
         if(ActList[nowActing].currentAmmo.amount > 0)
         {
            interfaceData.loadedAmmoName = Texts.fetch(ActList[nowActing].currentAmmoData.variation).toUpperCase();
            interfaceData.loadedAmmoCaliber = WeaponsData.Calibers[ActList[nowActing].currentAmmoData.type].name;
         }
         else
         {
            interfaceData.loadedAmmoName = "";
            interfaceData.loadedAmmoCaliber = "";
         }
         interfaceData.selectedAmmoType = ActList[nowActing].selectedAmmo[ActList[nowActing].currSlot];
         interfaceData.selectedAmmoAmount = 0;
         for(_loc3_ in ActList[nowActing].equipment)
         {
            if(ActList[nowActing].equipment[_loc3_].category == 3 && ActList[nowActing].equipment[_loc3_].type == interfaceData.selectedAmmoType)
            {
               interfaceData.selectedAmmoAmount += ActList[nowActing].equipment[_loc3_].amount - ActList[nowActing].equipment[_loc3_].inUse;
            }
         }
         if(interfaceData.selectedAmmoAmount > 0)
         {
            _loc2_ = Item.getDataFromType(interfaceData.selectedAmmoType);
            interfaceData.selectedAmmoName = Texts.fetch(_loc2_.variation).toUpperCase();
            interfaceData.selectedAmmoCaliber = WeaponsData.Calibers[_loc2_.type].name;
         }
         else
         {
            interfaceData.selectedAmmoName = "";
            interfaceData.selectedAmmoCaliber = "";
         }
         interfaceData.reloadAP = ActList[nowActing].currentWeaponReloadAP;
         interfaceData.grenadesAmount = ActList[nowActing].grenadeAmounts[ActList[nowActing].currSlot];
         interfaceData.anyWeaponsToPickUp = DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY] is Array && DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].length > 0;
         if(interfaceData.anyWeaponsToPickUp)
         {
            interfaceData.pickUpWeaponType = DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY][DroppedWeapons[ActList[nowActing].squareX][ActList[nowActing].squareY].length - ActList[nowActing].pickUpPos - 1].type;
            interfaceData.pickUpWeaponName = Texts.fetch(WeaponsData.Weapons[interfaceData.pickUpWeaponType].name);
         }
         else
         {
            interfaceData.pickUpWeaponType = 0;
            interfaceData.pickUpWeaponName = "";
         }
         interfaceData.pickUpAP = ActList[nowActing].pickUpAP;
         interfaceData.weaponDescription = WeaponsData.getWeaponDescription(ActList[nowActing].weapons[ActList[nowActing].currSlot]);
         onInterfaceUpdate(interfaceData);
      }
      
      public function defaultOnMessage(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         switch(param1)
         {
            case 1:
               _loc3_ = "positive message";
               break;
            case 2:
               _loc3_ = "neutral message";
               break;
            case 3:
               _loc3_ = "negative message";
         }
         trace(_loc3_ + ": " + param2);
      }
      
      public function addMessage(param1:*, param2:*) : *
      {
         interfaceData.Messages.push({
            "kind":param1,
            "text":param2
         });
         onMessage(param1,param2);
      }
      
      public function drawCharacterOnMiniMap(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(param1.group == 0)
         {
            _loc2_ = miniMapYourGroupColor;
         }
         else if(param1.band == 1)
         {
            _loc2_ = miniMapAllyColor;
         }
         else if(param1.band == 2)
         {
            _loc2_ = miniMapEnemyColor;
         }
         else
         {
            _loc2_ = miniMapNeutralColor;
         }
         miniMapBitmap.bitmapData.setPixel32(param1.squareX + 1,param1.squareY + 1,_loc2_);
      }
      
      public function defaultOnLose() : *
      {
         trace("You Lose");
      }
      
      public function defaultOnWin() : *
      {
         trace("You Win");
      }
      
      public function useCurrentAmmo(param1:*, param2:*) : *
      {
         param1.reduceItemFromEquipment(param1.loadedAmmo[param1.currSlot].type,param2,true);
      }
      
      public function winTheGame() : *
      {
         if(GroupCaravans[0].People[0].HP <= 0)
         {
            loseTheGame();
            return;
         }
         interfaceOnOff(false);
         paused = true;
         Mouse.show();
         onWin();
         gameEnded = true;
      }
      
      public function loseTheGame() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in Characters)
         {
            if(Characters[_loc1_].flameSoundChannel)
            {
               Characters[_loc1_].flameSoundChannel.stop();
            }
         }
         paused = true;
         Mouse.show();
         onLose();
         gameEnded = true;
      }
      
      public function inControl() : *
      {
         if(ActList[nowActing] is Character)
         {
            return ActList[nowActing].controlled && phase == 1;
         }
         return false;
      }
      
      public function generatePossibleSquares(param1:*, param2:*, param3:*) : *
      {
         var _loc6_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc5_:* = undefined;
         var _loc11_:* = undefined;
         var _loc8_:* = undefined;
         var _loc7_:Array = new Array({
            "x":param1,
            "y":param2,
            "AP":0
         });
         var _loc4_:* = 0;
         while(_loc4_ < _loc7_.length)
         {
            _loc6_ = _loc7_[_loc4_];
            if(_loc6_.AP < param3)
            {
               _loc9_ = 0;
               while(_loc9_ < 4)
               {
                  _loc11_ = _loc6_.x + directions[_loc9_][0];
                  _loc8_ = _loc6_.y + directions[_loc9_][1];
                  if(_loc11_ >= 0 && _loc8_ >= 0 && _loc11_ < gridWidth && _loc8_ < gridHeight && ASMap.Map[_loc11_][_loc8_] <= 0)
                  {
                     _loc5_ = false;
                     _loc10_ = 0;
                     while(_loc10_ < _loc7_.length)
                     {
                        if(_loc7_[_loc10_].x == _loc11_ && _loc7_[_loc10_].y == _loc8_)
                        {
                           if(_loc7_[_loc10_].AP <= _loc6_.AP + 1)
                           {
                              _loc5_ = true;
                              break;
                           }
                           _loc7_.splice(_loc10_,1);
                           if(_loc10_ <= _loc4_)
                           {
                              _loc4_--;
                           }
                           _loc10_--;
                        }
                        _loc10_++;
                     }
                     if(!_loc5_)
                     {
                        _loc7_.push({
                           "x":_loc11_,
                           "y":_loc8_,
                           "AP":_loc6_.AP + 1
                        });
                     }
                  }
                  _loc9_++;
               }
            }
            _loc4_++;
         }
         return _loc7_;
      }
      
      public function beginWalk() : *
      {
         var _loc1_:* = undefined;
         phase = 2;
         for(_loc1_ in directions)
         {
            if(Path[0].x - ActList[nowActing].squareX == directions[_loc1_][0] && Path[0].y - ActList[nowActing].squareY == directions[_loc1_][1])
            {
               ActList[nowActing].direction = _loc1_;
               break;
            }
         }
         ActList[nowActing].applyPhaseAndFrame = {
            "phase":1,
            "frame":1
         };
         ASMap.Map[ActList[nowActing].squareX][ActList[nowActing].squareY] = 0;
         CharactersMap[ActList[nowActing].squareX][ActList[nowActing].squareY] = null;
      }
      
      public function convertAStoPath(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         if(!(param1 is Array))
         {
            return [];
         }
         var _loc2_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push({
               "x":param1[_loc3_].x,
               "y":param1[_loc3_].y
            });
            _loc3_++;
         }
         for(_loc3_ in _loc2_)
         {
            if(_loc3_ == _loc2_.length - 1 && _loc3_ < Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP))
            {
               _loc2_[_loc3_].direction = 6;
            }
            else if(_loc3_ == Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP) - 1)
            {
               _loc2_[_loc3_].direction = 4;
            }
            else if(_loc3_ > Math.floor(ActList[nowActing].AP / ActList[nowActing].walkAP) - 1)
            {
               _loc2_[_loc3_].direction = 5;
            }
            else
            {
               for(_loc4_ in directions)
               {
                  if(directions[_loc4_][0] == _loc2_[_loc3_ + 1].x - _loc2_[_loc3_].x && directions[_loc4_][1] == _loc2_[_loc3_ + 1].y - _loc2_[_loc3_].y)
                  {
                     _loc2_[_loc3_].direction = _loc4_;
                     break;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function generateRandomObstacles() : *
      {
         var _loc7_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc9_:* = undefined;
         var _loc6_:* = undefined;
         var _loc5_:* = undefined;
         var _loc13_:* = undefined;
         var _loc12_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc11_:* = undefined;
         var _loc10_:* = undefined;
         var _loc8_:* = undefined;
         obstacles = [];
         var _loc14_:* = MathFunctions.random(gridWidth * gridHeight / 200,gridWidth * gridHeight / 50);
         _loc6_ = 1;
         while(_loc6_ <= _loc14_)
         {
            _loc9_ = MathFunctions.oneOfArray(randomObstacles);
            _loc8_ = _loc13_ = MathFunctions.random(0,gridWidth - 1);
            _loc5_ = _loc12_ = MathFunctions.random(0,gridHeight - 1);
            _loc4_ = 1;
            _loc3_ = 1;
            _loc11_ = -1;
            _loc10_ = true;
            while(_loc10_)
            {
               _loc10_ = false;
               for(_loc7_ in Obstacle.Data[_loc9_].fillSquares)
               {
                  _loc1_ = _loc8_ + Obstacle.Data[_loc9_].fillSquares[_loc7_].x - 1;
                  while(_loc1_ <= _loc8_ + Obstacle.Data[_loc9_].fillSquares[_loc7_].x + 1)
                  {
                     _loc2_ = _loc5_ + Obstacle.Data[_loc9_].fillSquares[_loc7_].y - 1;
                     while(_loc2_ <= _loc5_ + Obstacle.Data[_loc9_].fillSquares[_loc7_].y + 1)
                     {
                        if(_loc1_ >= gridWidth || _loc1_ < 0 || _loc2_ >= gridHeight || _loc2_ < 0 || ASMap.Map[_loc1_][_loc2_] == 1)
                        {
                           _loc10_ = true;
                           break;
                        }
                        _loc2_++;
                     }
                     _loc1_++;
                  }
                  if(_loc10_)
                  {
                     break;
                  }
               }
               if(_loc10_)
               {
                  var _temp_8:* = Number(_loc11_) + 1;
                  _loc11_++;
                  if(_temp_8 >= _loc4_ * 2)
                  {
                     _loc11_ = 0;
                     _loc3_++;
                     if(_loc3_ > 4)
                     {
                        _loc3_ = 1;
                        var _temp_9:* = Number(_loc4_) + 1;
                        _loc4_++;
                        if(_temp_9 >= gridWidth)
                        {
                           break;
                        }
                     }
                  }
                  switch(_loc3_)
                  {
                     case 1:
                        _loc8_ = _loc13_ - _loc4_ + _loc11_;
                        _loc5_ = _loc12_ - _loc4_;
                        break;
                     case 2:
                        _loc8_ = _loc13_ + _loc4_;
                        _loc5_ = _loc12_ - _loc4_ + _loc11_;
                        break;
                     case 3:
                        _loc8_ = _loc13_ + _loc4_ - _loc11_;
                        _loc5_ = _loc12_ + _loc4_;
                        break;
                     case 4:
                        _loc8_ = _loc13_ - _loc4_;
                        _loc5_ = _loc12_ + _loc4_ - _loc11_;
                  }
               }
               else
               {
                  for(_loc7_ in Obstacle.Data[_loc9_].fillSquares)
                  {
                     _loc1_ = _loc8_ + Obstacle.Data[_loc9_].fillSquares[_loc7_].x;
                     _loc2_ = _loc5_ + Obstacle.Data[_loc9_].fillSquares[_loc7_].y;
                     ASMap.Map[_loc1_][_loc2_] = 1;
                  }
                  obstacles.push({
                     "type":_loc9_,
                     "x":_loc8_,
                     "y":_loc5_
                  });
               }
            }
            _loc6_++;
         }
         for(_loc6_ in obstacles)
         {
            if(Obstacle.Data[obstacles[_loc6_].type].elevation <= 1)
            {
               for(_loc7_ in Obstacle.Data[obstacles[_loc6_].type].fillSquares)
               {
                  _loc1_ = obstacles[_loc6_].x + Obstacle.Data[obstacles[_loc6_].type].fillSquares[_loc7_].x;
                  _loc2_ = obstacles[_loc6_].y + Obstacle.Data[obstacles[_loc6_].type].fillSquares[_loc7_].y;
                  ASMap.Map[_loc1_][_loc2_] = null;
               }
            }
         }
      }
      
      public function dangerScoreReduction(param1:*, param2:*) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         var _loc3_:* = 0;
         if(param1.battleMorale <= 8 || param1.band == 3)
         {
            for(_loc6_ in ActList)
            {
               if(param1 != ActList[_loc6_] && ActList[_loc6_].HP > 0 && (ActList[_loc6_].band == 1 || ActList[_loc6_].band == 2))
               {
                  _loc3_ += 2000 / Math.pow(MathFunctions.CalcDistance(ActList[_loc6_].squareX,ActList[_loc6_].squareY,param2.x,param2.y),1.5);
               }
            }
            return _loc3_;
         }
         for(_loc6_ in param1.enemies)
         {
            if(param1.enemies[_loc6_].currentWeaponType.category > 1)
            {
               _loc7_ = checkHit(param1.enemies[_loc6_].x,param1.enemies[_loc6_].y,(param2.x + 0.5) * squareWidth,(param2.y + 0.5) * squareHeight,[param1,param1.enemies[_loc6_]]);
               if(_loc7_ == null || _loc7_.segment[0].belongsTo is Character && ActList[nowActing].IFF(_loc7_.segment[0].belongsTo))
               {
                  _loc3_ += 2000 / Math.pow(MathFunctions.CalcDistance(param1.enemies[_loc6_].squareX,param1.enemies[_loc6_].squareY,param2.x,param2.y),1.5);
                  if(param1.battleMorale > 0)
                  {
                     _loc3_ /= param1.battleMorale;
                  }
                  else
                  {
                     _loc3_ = 999999999;
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function findFreeSpot(param1:*, param2:*, param3:* = null) : *
      {
         var _loc5_:* = undefined;
         var _loc8_:* = undefined;
         var _loc7_:* = undefined;
         var _loc4_:* = 1;
         var _loc6_:* = 0;
         if(param3 == null)
         {
            _loc5_ = 1;
         }
         else
         {
            _loc5_ = Math.max(Math.floor(param3 / 1.4142),1);
         }
         if(param1 >= 0 && param1 < gridWidth && param2 >= 0 && param2 < gridHeight && ASMap.Map[param1][param2] == 0)
         {
            return {
               "x":param1,
               "y":param2
            };
         }
         while(true)
         {
            switch(_loc4_)
            {
               case 1:
                  _loc8_ = param1 - _loc5_ + _loc6_;
                  _loc7_ = param2 - _loc5_;
                  break;
               case 2:
                  _loc8_ = param1 + _loc5_;
                  _loc7_ = param2 - _loc5_ + _loc6_;
                  break;
               case 3:
                  _loc8_ = param1 + _loc5_ - _loc6_;
                  _loc7_ = param2 + _loc5_;
                  break;
               case 4:
                  _loc8_ = param1 - _loc5_;
                  _loc7_ = param2 + _loc5_ - _loc6_;
            }
            if((param3 == null || MathFunctions.CalcDistance(param1,param2,_loc8_,_loc7_) >= param3) && _loc8_ >= 0 && _loc8_ < gridWidth && _loc7_ >= 0 && _loc7_ < gridHeight && !ASMap.Map[_loc8_][_loc7_] > 0)
            {
               break;
            }
            var _temp_11:* = Number(_loc6_) + 1;
            _loc6_++;
            if(_temp_11 >= _loc5_ * 2 - 1)
            {
               _loc6_ = 0;
               var _temp_12:* = Number(_loc4_) + 1;
               _loc4_++;
               if(_temp_12 > 4)
               {
                  _loc4_ = 1;
                  var _temp_13:* = Number(_loc5_) + 1;
                  _loc5_++;
                  if(_temp_13 > Math.max(gridWidth,gridHeight))
                  {
                     return false;
                  }
               }
            }
         }
         return {
            "x":_loc8_,
            "y":_loc7_
         };
      }
      
      public function centerViewOnCurrentCharacter() : *
      {
         centerViewOn(ActList[nowActing].x,ActList[nowActing].y);
      }
      
      public function generateMessage(param1:*, param2:*, param3:* = null) : *
      {
         var _loc4_:String = "";
         if(param1 is Character)
         {
            _loc4_ = " (" + GroupCaravans[param1.group].name + ")";
         }
         switch(param2)
         {
            case "got hit":
               if(param3 > 0)
               {
                  addMessage(decideKind(param1,false),Texts.fetch(65,param1.gender).replace("@name@",param1.name + _loc4_).replace("@number@",param3));
               }
               else
               {
                  addMessage(2,Texts.fetch(3654,param1.gender).replace("@name@",param1.name + _loc4_));
               }
               break;
            case "bleeding":
               addMessage(decideKind(param1,false),Texts.fetch(879,param1.gender).replace("@name@",param1.name + _loc4_).replace("@number@",param3));
               break;
            case "burning":
               addMessage(decideKind(param1,false),Texts.fetch(880,param1.gender).replace("@name@",param1.name + _loc4_).replace("@number@",param3));
               break;
            case "die":
               addMessage(decideKind(param1,false),Texts.fetch(881,param1.gender).replace("@name@",param1.name + _loc4_));
               break;
            case "panic":
               addMessage(decideKind(param1,false),Texts.fetch(882,param1.gender).replace("@name@",param1.name + _loc4_));
               break;
            case "heal":
               addMessage(decideKind(param1,true),Texts.fetch(883,param1.gender).replace("@name@",param1.name + _loc4_).replace("@number@",param3));
               break;
            case "leg damage":
               addMessage(decideKind(param1,false),Texts.fetch(1098,param1.gender).replace("@name@",param1.name));
               break;
            case "arm damage":
               addMessage(decideKind(param1,false),Texts.fetch(1097,param1.gender).replace("@name@",param1.name));
               break;
            case "eye damage":
               addMessage(decideKind(param1,false),Texts.fetch(1099,param1.gender).replace("@name@",param1.name));
               break;
            case "no damage hit":
               addMessage(2,Texts.fetch(4183,param1.gender).replace("@name@",param1.name));
         }
      }
      
      public function decideKind(param1:*, param2:*) : *
      {
         if(param1 is TransportUnit)
         {
            return 2;
         }
         if(param1.band == 1)
         {
            if(param2)
            {
               return 1;
            }
            return 3;
         }
         if(param1.band == 2)
         {
            if(param2)
            {
               return 3;
            }
            return 1;
         }
         if(param1.band == 3)
         {
            return 2;
         }
      }
      
      public function playSoundAt(param1:*, param2:*, param3:*, param4:* = 1) : *
      {
         var _loc5_:* = param1.play();
         if(_loc5_)
         {
            applySoundTransform(_loc5_,param2,param3,param4);
         }
      }
      
      public function applySoundTransform(param1:*, param2:*, param3:*, param4:* = 1) : *
      {
         var _loc6_:* = map2Screen(param2,param3);
         var _loc5_:* = MathFunctions.CalcDistance(screenWidth / 2,screenHeight / 2,_loc6_.x + MobilePart.x,_loc6_.y + MobilePart.y);
         param1.soundTransform = new SoundTransform(Math.pow(Math.max(4000 - _loc5_,0) / 4000,4) * param4,Math.min(Math.max((_loc6_.x + MobilePart.x - screenWidth / 2) / 600,-1),1));
      }
      
      public function remove() : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:* = undefined;
         stage.removeEventListener("mouseLeave",mLeave);
         stage.removeEventListener("focusOut",mLeave);
         stage.removeEventListener("deactivate",mLeave);
         stage.removeEventListener("mouseMove",mMove);
         stage.removeEventListener("mouseDown",mDown);
         stage.removeEventListener("mouseUp",mUp);
         stage.removeEventListener("keyDown",keyPressed);
         stage.removeEventListener("keyUp",keyReleased);
         removeEventListener("enterFrame",EF);
         removeEventListener("addedToStage",createStageEvents);
         var _loc1_:* = Characters.concat(flyingProjectiles).concat(Transport).concat(Characters).concat(Obstacles).concat(flyingGrenades).concat(flamethrowerFlames).concat(activeExplosions);
         for(_loc2_ in _loc1_)
         {
            if(_loc1_[_loc2_].ownContainer is Bitmap && _loc1_[_loc2_].ownContainer.bitmapData is BitmapData)
            {
               _loc1_[_loc2_].ownContainer.bitmapData = null;
            }
            if(_loc1_[_loc2_].Shadow is Bitmap && _loc1_[_loc2_].Shadow.bitmapData is BitmapData)
            {
               _loc1_[_loc2_].Shadow.bitmapData = null;
            }
         }
         for(_loc2_ in BloodBitmaps)
         {
            for(_loc3_ in BloodBitmaps[_loc2_])
            {
               if(BloodBitmaps[_loc2_][_loc3_] is Bitmap && BloodBitmaps[_loc2_][_loc3_].bitmapData is BitmapData)
               {
                  BloodBitmaps[_loc2_][_loc3_].bitmapData.dispose();
               }
            }
         }
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         if(stage is Stage)
         {
            stage.focus = stage;
         }
      }
   }
}

