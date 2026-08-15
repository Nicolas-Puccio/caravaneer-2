package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.*;
   import flash.filters.DropShadowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   
   public class TownMode extends Sprite
   {
      
      public var GD:*;
      
      public var town:*;
      
      public var screens:*;
      
      public var currScreen:* = 1;
      
      public var categoryMarker:*;
      
      public var cursorInfo:*;
      
      public var industriesPage:* = 0;
      
      public var confirmDialogue:*;
      
      public var messageDialogue:*;
      
      public var buyingIndustry:*;
      
      public var changingIndustry:*;
      
      public var startingIndustry:*;
      
      public var calculator:*;
      
      public var statsScreen:* = 0;
      
      public var tradeWindow:*;
      
      public var healingFacility:*;
      
      public var policeStation:*;
      
      public var school:*;
      
      public var recentDataGraph:*;
      
      public var playersGraph:*;
      
      public var selectedPerson:*;
      
      public var stopped:* = false;
      
      internal var buttonPositions:*;
      
      internal var buttonTexts:*;
      
      internal const labelSpace:* = 209;
      
      internal const labelGap:* = 7;
      
      internal const labelRoundness:* = 10;
      
      internal var labelNames:*;
      
      public function TownMode(param1:*, param2:*, param3:* = 1)
      {
         var i:*;
         var BG:*;
         var CT:*;
         var tempText:*;
         var buttText:*;
         var tempDisp:*;
         var translateMatrix:*;
         var bTexts:*;
         var _GD:* = param1;
         var _town:* = param2;
         var _currScreen:* = param3;
         buttonPositions = [22,92,152,212,282,342,412];
         buttonTexts = [1261,1262,1263,1264,34,1265,1266];
         labelNames = [1293,1292,4171];
         super();
         GD = _GD;
         town = _town;
         currScreen = _currScreen;
         BG = new ImportedBitmap("TownBG.jpg");
         addChild(BG);
         screens = [];
         CT = new ColorTransform(0.3,0.2,0.1);
         i = 0;
         while(i <= 4)
         {
            screens[i] = {};
            screens[i].disp = new Sprite();
            screens[i].FG = new Sprite();
            screens[i].maskedBmp = new ImportedBitmap("InterfaceForeground.png");
            screens[i].maskedBmp.transform.colorTransform = CT;
            screens[i].FG.addChild(screens[i].maskedBmp);
            screens[i].FG.blendMode = "layer";
            screens[i].alphas = new Sprite();
            screens[i].alphas.blendMode = "alpha";
            screens[i].clearBmp = new Sprite();
            screens[i].clearBmp.graphics.beginFill(0,0.01);
            screens[i].clearBmp.graphics.drawRect(0,0,880,495);
            screens[i].alphas.addChild(screens[i].clearBmp);
            screens[i].FG.addChild(screens[i].alphas);
            screens[i].erase = new Sprite();
            screens[i].erase.blendMode = "erase";
            screens[i].FG.addChild(screens[i].erase);
            screens[i].disp.addChild(screens[i].FG);
            if(i != 0)
            {
               screens[i].hitArea = new Sprite();
               screens[i].hitArea.graphics.beginFill(16711680);
               screens[i].hitArea.graphics.drawRect(0,0,660,462);
               screens[i].disp.addChild(screens[i].hitArea);
               screens[i].disp.mask = screens[i].hitArea;
            }
            addChild(screens[i].disp);
            screens[i].erase.mouseEnabled = false;
            screens[i].erase.mouseChildren = false;
            i = Number(i) + 1;
         }
         categoryMarker = new Sprite();
         categoryMarker.graphics.lineStyle(1.5,0);
         categoryMarker.graphics.drawRect(-5,-5,210,50);
         categoryMarker.x = 660;
         screens[0].alphas.addChild(categoryMarker);
         screens[0].nameText = new EngineText(GD.Towns[town].name.toUpperCase(),0,22,"center",20,18,620,26);
         screens[0].alphas.addChild(screens[0].nameText);
         screens[0].alphas.graphics.lineStyle(1,0);
         screens[0].alphas.graphics.moveTo(0,472);
         screens[0].alphas.graphics.lineTo(880,472);
         screens[0].bottomLineCapacity = new EngineText("",0,14,"left",10,474,860,20);
         screens[0].bottomLineDate = new EngineText("",0,14,"right",10,474,860,20);
         screens[0].bottomLineMoney = new EngineText("",0,14,"left",10,474,860,20);
         screens[0].alphas.addChild(screens[0].bottomLineCapacity);
         screens[0].alphas.addChild(screens[0].bottomLineMoney);
         screens[0].alphas.addChild(screens[0].bottomLineDate);
         screens[0].buttons = [];
         i = 0;
         while(i < 7)
         {
            tempDisp = new Sprite();
            tempDisp.graphics.beginFill(0);
            tempDisp.graphics.drawRect(0,0,200,40);
            tempDisp.blendMode = "layer";
            if(i == 0)
            {
               buttText = GD.Towns[town].name;
               if(buttText.length > 18)
               {
                  buttText = buttText.substring(0,17) + ".";
               }
            }
            else
            {
               buttText = Texts.fetch(buttonTexts[i]);
            }
            tempText = new EngineText(buttText.toUpperCase(),0,16,"center",10,9,180,26);
            tempText.blendMode = "erase";
            tempDisp.addChild(tempText);
            screens[0].buttons[i] = {};
            screens[0].buttons[i].bmpDt = new BitmapData(200,40,true,0);
            screens[0].buttons[i].bmpDt.draw(tempDisp);
            screens[0].buttons[i].bmp = new Bitmap();
            if(screens[0].buttons[i].bmpDt is BitmapData)
            {
               screens[0].buttons[i].bmp.bitmapData = screens[0].buttons[i].bmpDt;
            }
            screens[0].buttons[i].disp = new Sprite();
            screens[0].buttons[i].disp.addChild(screens[0].buttons[i].bmp);
            screens[0].buttons[i].disp.x = 660;
            screens[0].buttons[i].disp.y = buttonPositions[i];
            screens[0].alphas.addChild(screens[0].buttons[i].disp);
            screens[0].buttons[i].disp.buttonMode = true;
            screens[0].buttons[i].disp.mouseChildren = false;
            screens[0].buttons[i].disp.addEventListener("click",pressMainMenuButton,false,0,false);
            i = Number(i) + 1;
         }
         screens[1].townImage = new ImportedBitmap("town" + town + ".png");
         screens[1].townImage.x = 20;
         screens[1].townImage.y = 82;
         screens[1].alphas.addChild(screens[1].townImage);
         screens[1].locations = [];
         translateMatrix = new Matrix();
         translateMatrix.tx = 22;
         translateMatrix.ty = 57;
         for(i in GD.Towns[town].locations)
         {
            screens[1].locations[i] = {};
            screens[1].locations[i].eraseSign = new Sprite();
            screens[1].locations[i].eraseSign.graphics.beginFill(10788829);
            screens[1].locations[i].eraseSign.graphics.drawCircle(0,-35,20);
            screens[1].locations[i].eraseSign.graphics.endFill();
            screens[1].locations[i].eraseSign.graphics.beginFill(10788829);
            screens[1].locations[i].eraseSign.graphics.moveTo(-8,-30);
            screens[1].locations[i].eraseSign.graphics.lineTo(0,0);
            screens[1].locations[i].eraseSign.graphics.lineTo(8,-30);
            screens[1].locations[i].eraseSign.graphics.endFill();
            screens[1].locations[i].eraseSign.x = Presets.Towns[town].locations[i].x + 20;
            screens[1].locations[i].eraseSign.y = Presets.Towns[town].locations[i].y + 82;
            screens[1].locations[i].eraseSign.blendMode = "layer";
            screens[1].locations[i].eraseCut = getLocationSymbol(Presets.Towns[town].locations[i].symbol);
            screens[1].locations[i].eraseCut.blendMode = "erase";
            screens[1].locations[i].eraseCut.scaleX = screens[1].locations[i].eraseCut.scaleY = 0.7;
            screens[1].locations[i].eraseCut.x = 0;
            screens[1].locations[i].eraseCut.y = -35;
            screens[1].locations[i].eraseSign.addChild(screens[1].locations[i].eraseCut);
            screens[1].erase.addChild(screens[1].locations[i].eraseSign);
            screens[1].locations[i].signBmData = new BitmapData(44,57,true,0);
            screens[1].locations[i].signBmData.draw(screens[1].locations[i].eraseSign,translateMatrix);
            screens[1].locations[i].signBitmap = new Bitmap();
            if(screens[1].locations[i].signBmData is BitmapData)
            {
               screens[1].locations[i].signBitmap.bitmapData = screens[1].locations[i].signBmData;
            }
            screens[1].locations[i].blueSign = new Sprite();
            screens[1].locations[i].blueSign.addChild(screens[1].locations[i].signBitmap);
            screens[1].locations[i].blueSign.x = Presets.Towns[town].locations[i].x - 2;
            screens[1].locations[i].blueSign.y = Presets.Towns[town].locations[i].y + 25;
            screens[1].disp.addChild(screens[1].locations[i].blueSign);
            screens[1].locations[i].blueSign.mouseEnabled = false;
            screens[1].locations[i].blueSign.alpha = 0;
            screens[1].locations[i].fillSign = new Sprite();
            screens[1].locations[i].fillSign.graphics.beginFill(16711680);
            screens[1].locations[i].fillSign.graphics.drawCircle(0,-35,22);
            screens[1].locations[i].fillSign.graphics.endFill();
            screens[1].locations[i].fillSign.graphics.beginFill(16711680);
            screens[1].locations[i].fillSign.graphics.moveTo(-11,-30);
            screens[1].locations[i].fillSign.graphics.lineTo(0,6);
            screens[1].locations[i].fillSign.graphics.lineTo(11,-30);
            screens[1].locations[i].fillSign.graphics.endFill();
            screens[1].locations[i].fillSign.x = Presets.Towns[town].locations[i].x + 20;
            screens[1].locations[i].fillSign.y = Presets.Towns[town].locations[i].y + 82;
            screens[1].alphas.addChild(screens[1].locations[i].fillSign);
            screens[1].locations[i].fillSign.buttonMode = true;
            screens[1].locations[i].fillSign.addEventListener("click",clickOnLocationSign,false,0,false);
         }
         screens[2].population = new EngineText("",16777215,14,"center",10,52,630,20);
         screens[2].alphas.addChild(screens[2].population);
         screens[2].wealthFactor = new EngineText("",16777215,14,"center",10,82,630,20);
         screens[2].alphas.addChild(screens[2].wealthFactor);
         bTexts = [6808,6809,1292];
         screens[2].switchButtons = [];
         screens[2].switchButtonCuts = [];
         screens[2].switchButtonFrames = [];
         i = 0;
         while(i <= 2)
         {
            screens[2].switchButtons[i] = new Sprite();
            screens[2].switchButtons[i].graphics.beginFill(16711680);
            screens[2].switchButtons[i].graphics.drawRect(0,0,200,20);
            screens[2].switchButtons[i].blendMode = "layer";
            screens[2].switchButtonCuts[i] = new Sprite();
            screens[2].switchButtonCuts[i].addChild(new EngineText(Texts.fetch(bTexts[i]).toUpperCase(),16777215,14,"center",0,0,200,20));
            screens[2].switchButtonCuts[i].blendMode = "erase";
            screens[2].switchButtons[i].addChild(screens[2].switchButtonCuts[i]);
            screens[2].switchButtonFrames[i] = new Sprite();
            screens[2].switchButtonFrames[i].graphics.lineStyle(2,16711680);
            screens[2].switchButtonFrames[i].graphics.drawRect(-3,-3,206,26);
            screens[2].switchButtons[i].addChild(screens[2].switchButtonFrames[i]);
            screens[2].switchButtons[i].buttonMode = true;
            screens[2].switchButtons[i].mouseChildren = false;
            screens[2].switchButtons[i].addEventListener("click",clickOnStatsButton,false,0,false);
            screens[2].alphas.addChild(screens[2].switchButtons[i]);
            i = Number(i) + 1;
         }
         screens[2].switchButtons[0].x = 10;
         screens[2].switchButtons[0].y = 52;
         screens[2].switchButtons[1].x = 440;
         screens[2].switchButtons[1].y = 52;
         screens[2].switchButtons[2].x = 10;
         screens[2].switchButtons[2].y = 82;
         screens[2].subScreens = [];
         i = 0;
         while(i <= 2)
         {
            screens[2].subScreens[i] = new Sprite();
            if(i == 0)
            {
               screens[2].alphas.addChild(screens[2].subScreens[i]);
            }
            else
            {
               screens[2].disp.addChild(screens[2].subScreens[i]);
            }
            i = Number(i) + 1;
         }
         screens[2].prodArea = new ScrollableArea(620,320,620,320,true,false,false,3,10);
         screens[2].prodArea.x = 10;
         screens[2].prodArea.y = 132;
         screens[2].areaFrame = new Sprite();
         screens[2].areaFrame.graphics.lineStyle(1,0);
         screens[2].areaFrame.graphics.drawRect(-1,-1,632,322);
         screens[2].areaFrame.x = 10;
         screens[2].areaFrame.y = 132;
         screens[2].subScreens[0].addChild(screens[2].areaFrame);
         screens[2].subScreens[0].addChild(screens[2].prodArea);
         screens[2].productTitle = new EngineText(Texts.fetch(1358).toUpperCase(),16777215,14,"left",20,112,180,20);
         screens[2].subScreens[0].addChild(screens[2].productTitle);
         screens[2].producedTitle = new EngineText(Texts.fetch(921).toUpperCase(),16777215,14,"center",200,112,130,20);
         screens[2].subScreens[0].addChild(screens[2].producedTitle);
         screens[2].consumedTitle = new EngineText(Texts.fetch(922).toUpperCase(),16777215,14,"center",340,112,130,20);
         screens[2].subScreens[0].addChild(screens[2].consumedTitle);
         screens[2].balanceTitle = new EngineText(Texts.fetch(1415).toUpperCase(),16777215,14,"center",480,112,130,20);
         screens[2].subScreens[0].addChild(screens[2].balanceTitle);
         recentDataGraph = new ConsProdGraph(630,320,null,false,false);
         recentDataGraph.x = 10;
         recentDataGraph.y = 132;
         screens[2].subScreens[1].addChild(recentDataGraph);
         playersGraph = new ConsProdGraph(630,320,null,true,false);
         playersGraph.x = 10;
         playersGraph.y = 132;
         screens[2].subScreens[2].addChild(playersGraph);
         screens[3].crewPhotoBG = new ImportedBitmap("PhotoBG.png");
         screens[3].crewPhotoFG = new ImportedBitmap("PhotoFG.png");
         screens[3].crewPortrait = new Sprite();
         screens[3].crewPhotoFG.x = screens[3].crewPortrait.x = 30;
         screens[3].crewPhotoFG.y = screens[3].crewPortrait.y = 72;
         screens[3].crewPhotoBG.x = 20;
         screens[3].crewPhotoBG.y = 62;
         screens[3].crewPhotoBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         screens[3].disp.addChild(screens[3].crewPhotoBG);
         screens[3].disp.addChild(screens[3].crewPortrait);
         screens[3].disp.addChild(screens[3].crewPhotoFG);
         screens[3].frames = new Sprite();
         screens[3].alphas.addChild(screens[3].frames);
         screens[3].frames.graphics.lineStyle(1.5,0);
         screens[3].frames.graphics.drawRect(20,352,620,100);
         screens[3].frames.graphics.moveTo(20,442);
         screens[3].frames.graphics.lineTo(640,442);
         screens[3].frames.graphics.drawRect(310,62,330,40);
         screens[3].frames.graphics.drawRect(310,172,330,160);
         screens[3].frames.graphics.drawRect(20,62,270,270);
         screens[3].name = new EngineText("",16777215,16,"center",310,71,330,20);
         screens[3].alphas.addChild(screens[3].name);
         screens[3].infoArea = new ScrollableArea(320,160,320,160,true,false,false,3,10);
         screens[3].infoArea.x = 310;
         screens[3].infoArea.y = 172;
         screens[3].disp.addChild(screens[3].infoArea);
         screens[3].titles = [];
         screens[3].values = [];
         screens[3].salaryText = new EngineText("",16777215,14,"center",310,112,330,20);
         screens[3].alphas.addChild(screens[3].salaryText);
         screens[3].hireButton = new Sprite();
         screens[3].hireButton.graphics.beginFill(0);
         screens[3].hireButton.graphics.drawRect(0,0,200,20);
         screens[3].hireButton.blendMode = "layer";
         screens[3].hireButton.x = 375;
         screens[3].hireButton.y = 142;
         screens[3].hireButtonCut = new EngineText(Texts.fetch(1272).toUpperCase(),16777215,14,"center",0,0,200,20);
         screens[3].hireButtonCut.blendMode = "erase";
         screens[3].hireButton.addChild(screens[3].hireButtonCut);
         screens[3].hireButton.buttonMode = true;
         screens[3].hireButton.mouseChildren = false;
         screens[3].hireButton.addEventListener("click",hirePerson,false,0,false);
         screens[3].alphas.addChild(screens[3].hireButton);
         screens[3].notEnoughMoney = new EngineText(Texts.fetch(1273).toUpperCase(),0,14,"center",310,142,330,20);
         screens[3].alphas.addChild(screens[3].notEnoughMoney);
         screens[3].hostileFaction = new EngineText(Texts.fetch(6798,null,38).toUpperCase(),0,14,"center",310,142,330,20);
         screens[3].alphas.addChild(screens[3].hostileFaction);
         screens[3].noPeopleToHire = new EngineText(Texts.fetch(1619).toUpperCase(),0,14,"center",20,231,600,20);
         screens[3].alphas.addChild(screens[3].noPeopleToHire);
         screens[3].peopleList = new List([],620,false,[],[],selectPersonToHire,null,true,true,false,false,9472128,5261376,2,1);
         screens[3].peopleList.x = 20;
         screens[3].peopleList.y = 352;
         screens[3].disp.addChild(screens[3].peopleList);
         screens[4].frames = new Sprite();
         screens[4].alphas.addChild(screens[4].frames);
         screens[4].labelText = new EngineText("",16777215,16,"center",20,66,209 - 7,20);
         screens[4].alphas.addChild(screens[4].labelText);
         screens[4].labelButtons = [];
         for(i in labelNames)
         {
            screens[4].labelButtons[i] = {};
            screens[4].labelButtons[i].disp = new Sprite();
            screens[4].labelButtons[i].disp.blendMode = "layer";
            screens[4].labelButtons[i].disp.graphics.beginFill(0);
            screens[4].labelButtons[i].disp.graphics.moveTo(0,30);
            screens[4].labelButtons[i].disp.graphics.lineTo(0,10);
            screens[4].labelButtons[i].disp.graphics.curveTo(0,0,10,0);
            screens[4].labelButtons[i].disp.graphics.lineTo(209 - 7 - 10,0);
            screens[4].labelButtons[i].disp.graphics.curveTo(209 - 7,0,209 - 7,10);
            screens[4].labelButtons[i].disp.graphics.lineTo(209 - 7,30);
            screens[4].labelButtons[i].disp.graphics.endFill();
            screens[4].labelButtons[i].disp.x = 20 + i * 209;
            screens[4].labelButtons[i].disp.y = 62;
            screens[4].labelButtons[i].text = new EngineText(Texts.fetch(labelNames[i]).toUpperCase(),16777215,16,"center",0,4,209 - 7,20);
            screens[4].labelButtons[i].text.blendMode = "erase";
            screens[4].labelButtons[i].disp.addChild(screens[4].labelButtons[i].text);
            screens[4].labelButtons[i].disp.mouseChildren = false;
            screens[4].labelButtons[i].disp.buttonMode = true;
            screens[4].labelButtons[i].disp.addEventListener("click",clickLabel,false,0,false);
            screens[4].alphas.addChild(screens[4].labelButtons[i].disp);
         }
         screens[4].labelScreens = [];
         for(i in labelNames)
         {
            screens[4].labelScreens[i] = new Sprite();
            screens[4].labelScreens[i].x = 20;
            screens[4].labelScreens[i].y = 92;
            screens[4].alphas.addChild(screens[4].labelScreens[i]);
         }
         screens[4].labelScreens[0].graphics.lineStyle(1,0);
         screens[4].labelScreens[0].graphics.drawRect(20,20,580,320);
         screens[4].townsIndustriesArea = new ScrollableArea(570,320,570,320,true,false,false,3,10);
         screens[4].townsIndustriesArea.x = 20;
         screens[4].townsIndustriesArea.y = 20;
         screens[4].labelScreens[0].addChild(screens[4].townsIndustriesArea);
         screens[4].labelScreens[1].graphics.lineStyle(1,0);
         screens[4].labelScreens[1].graphics.drawRect(20,110,580,230);
         screens[4].playersIndustriesArea = new ScrollableArea(570,230,570,230,true,false,false,3,10);
         screens[4].playersIndustriesArea.x = 20;
         screens[4].playersIndustriesArea.y = 110;
         screens[4].labelScreens[1].addChild(screens[4].playersIndustriesArea);
         screens[4].playersIndustriesStorageText = new EngineText("",16777215,14,"left",20,20,580,20);
         screens[4].playersIndustriesMoneyText = new EngineText("",16777215,14,"left",20,50,580,20);
         screens[4].labelScreens[1].addChild(screens[4].playersIndustriesStorageText);
         screens[4].labelScreens[1].addChild(screens[4].playersIndustriesMoneyText);
         screens[4].playersIndustriesUnemployedText = new EngineText("",16777215,14,"center",20,80,580,20);
         screens[4].labelScreens[1].addChild(screens[4].playersIndustriesUnemployedText);
         screens[4].playersIndustriesButtons = [];
         i = 0;
         while(i <= 3)
         {
            screens[4].playersIndustriesButtons[i] = {};
            screens[4].playersIndustriesButtons[i].disp = new Sprite();
            screens[4].playersIndustriesButtons[i].disp.blendMode = "layer";
            screens[4].playersIndustriesButtons[i].disp.graphics.beginFill(0);
            screens[4].playersIndustriesButtons[i].disp.graphics.drawRect(0,0,150,20);
            screens[4].playersIndustriesButtons[i].disp.x = i % 2 * 160 + 290;
            screens[4].playersIndustriesButtons[i].disp.y = 20 + Math.floor(i / 2) * 30;
            screens[4].playersIndustriesButtons[i].Text = new EngineText(Texts.fetch(1319 + i).toUpperCase(),16777215,14,"center",0,0,150,20);
            screens[4].playersIndustriesButtons[i].Text.blendMode = "erase";
            screens[4].playersIndustriesButtons[i].disp.addChild(screens[4].playersIndustriesButtons[i].Text);
            screens[4].playersIndustriesButtons[i].disp.mouseChildren = false;
            screens[4].playersIndustriesButtons[i].disp.buttonMode = true;
            screens[4].playersIndustriesButtons[i].disp.addEventListener("click",pressPlayersIndustriesButton,false,0,false);
            screens[4].labelScreens[1].addChild(screens[4].playersIndustriesButtons[i].disp);
            i = Number(i) + 1;
         }
         screens[4].labelScreens[2].graphics.lineStyle(1,0);
         screens[4].labelScreens[2].graphics.drawRect(20,20,580,320);
         screens[4].newIndustryArea = new ScrollableArea(570,320,570,320,true,false,false,3,10);
         screens[4].newIndustryArea.x = 20;
         screens[4].newIndustryArea.y = 20;
         screens[4].labelScreens[2].addChild(screens[4].newIndustryArea);
         setScreen(currScreen);
         updateBottomLine();
         tradeWindow = new TradeWindow(GD);
         tradeWindow.visible = false;
         addChild(tradeWindow);
         tradeWindow.onExit = function():*
         {
            updateBottomLine();
            setScreen();
         };
         healingFacility = new HealingFacility(GD);
         healingFacility.visible = false;
         addChild(healingFacility);
         healingFacility.onExit = function():*
         {
            updateBottomLine();
            setScreen();
         };
         policeStation = new PoliceStation(GD);
         policeStation.visible = false;
         addChild(policeStation);
         policeStation.onExit = function():*
         {
            updateBottomLine();
            setScreen();
         };
         school = new School(GD);
         school.visible = false;
         addChild(school);
         school.onExit = function():*
         {
            updateBottomLine();
            setScreen();
         };
         calculator = new Calculator();
         calculator.visible = false;
         addChild(calculator);
         confirmDialogue = new YesNoDialogue();
         confirmDialogue.visible = false;
         addChild(confirmDialogue);
         messageDialogue = new YesNoDialogue(true);
         messageDialogue.visible = false;
         addChild(messageDialogue);
         cursorInfo = new Sprite();
         cursorInfo.mouseChildren = false;
         cursorInfo.mouseEnabled = false;
         addChild(cursorInfo);
         addEventListener("enterFrame",EF,false,0,false);
      }
      
      public function updateIndustries() : *
      {
         var _loc8_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc9_:* = undefined;
         var _loc2_:* = undefined;
         var _loc6_:* = undefined;
         var _loc10_:* = undefined;
         var _loc19_:* = undefined;
         var _loc18_:* = undefined;
         var _loc1_:* = undefined;
         _loc5_ = undefined;
         _loc2_ = undefined;
         var _loc13_:* = undefined;
         var _loc17_:* = undefined;
         var _loc16_:* = undefined;
         var _loc12_:* = undefined;
         _loc18_ = undefined;
         _loc1_ = undefined;
         _loc12_ = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc3_:* = undefined;
         _loc5_ = undefined;
         var _loc11_:* = undefined;
         _loc2_ = undefined;
         for(_loc7_ in GD.Towns[town].industries)
         {
            if(GD.Towns[town].industries[_loc7_].maxSize == undefined || GD.Towns[town].industries[_loc7_].maxSize < GD.Towns[town].industries[_loc7_].employees)
            {
               GD.Towns[town].industries[_loc7_].maxSize = GD.Towns[town].industries[_loc7_].employees;
            }
         }
         for(_loc7_ in GD.Towns[town].playersIndustries)
         {
            if(GD.Towns[town].playersIndustries[_loc7_].maxSize == undefined || GD.Towns[town].playersIndustries[_loc7_].maxSize < GD.Towns[town].playersIndustries[_loc7_].employees)
            {
               GD.Towns[town].playersIndustries[_loc7_].maxSize = GD.Towns[town].playersIndustries[_loc7_].employees;
            }
         }
         screens[4].frames.graphics.clear();
         screens[4].frames.graphics.lineStyle(1.5,0);
         screens[4].frames.graphics.moveTo(20 + 209 * industriesPage,92);
         screens[4].frames.graphics.lineTo(20,92);
         screens[4].frames.graphics.lineTo(20,452);
         screens[4].frames.graphics.lineTo(640,452);
         screens[4].frames.graphics.lineTo(640,92);
         screens[4].frames.graphics.lineTo(20 + 209 * (industriesPage + 1) - 7,92);
         screens[4].frames.graphics.lineTo(20 + 209 * (industriesPage + 1) - 7,62 + 10);
         screens[4].frames.graphics.curveTo(20 + 209 * (industriesPage + 1) - 7,62,20 + 209 * (industriesPage + 1) - 7 - 10,62);
         screens[4].frames.graphics.lineTo(20 + 209 * industriesPage + 10,62);
         screens[4].frames.graphics.curveTo(20 + 209 * industriesPage,62,20 + 209 * industriesPage,62 + 10);
         screens[4].frames.graphics.lineTo(20 + 209 * industriesPage,92);
         screens[4].labelText.x = 20 + 209 * industriesPage;
         screens[4].labelText.text = Texts.fetch(labelNames[industriesPage]).toUpperCase();
         for(_loc7_ in screens[4].labelButtons)
         {
            screens[4].labelButtons[_loc7_].disp.visible = _loc7_ != industriesPage;
         }
         for(_loc7_ in screens[4].labelScreens)
         {
            screens[4].labelScreens[_loc7_].visible = _loc7_ == industriesPage;
         }
         if(industriesPage == 0)
         {
            for(_loc7_ in screens[4].townsIndustriesArea.contentList)
            {
               screens[4].townsIndustriesArea.Content.removeChild(screens[4].townsIndustriesArea.contentList[_loc7_].item);
            }
            screens[4].townsIndustriesArea.contentList = [];
            screens[4].townIndustryItems = [];
            for(_loc7_ in GD.Towns[town].industries)
            {
               _loc18_ = GD.Towns[town].getConsumptionProduction([GD.Towns[town].industries[_loc7_]]);
               _loc19_ = false;
               screens[4].townIndustryItems[_loc7_] = {};
               screens[4].townIndustryItems[_loc7_].disp = new Sprite();
               screens[4].townIndustryItems[_loc7_].disp.x = 10;
               screens[4].townIndustryItems[_loc7_].disp.y = 10 + _loc7_ * 130;
               screens[4].townIndustryItems[_loc7_].disp.graphics.lineStyle(1,0);
               screens[4].townIndustryItems[_loc7_].disp.graphics.drawRect(0,0,550,120);
               screens[4].townIndustryItems[_loc7_].industrySign = new Sprite();
               screens[4].townIndustryItems[_loc7_].industrySign.blendMode = "layer";
               screens[4].townIndustryItems[_loc7_].industrySign.graphics.beginFill(0);
               screens[4].townIndustryItems[_loc7_].industrySign.graphics.drawRect(0,0,80,100);
               screens[4].townIndustryItems[_loc7_].industrySign.x = 10;
               screens[4].townIndustryItems[_loc7_].industrySign.y = 10;
               screens[4].townIndustryItems[_loc7_].industrySignErase = GD.Towns[town].industries[_loc7_].picture;
               screens[4].townIndustryItems[_loc7_].industrySignErase.blendMode = "erase";
               screens[4].townIndustryItems[_loc7_].industrySignErase.scaleX = screens[4].townIndustryItems[_loc7_].industrySignErase.scaleY = 0.6;
               screens[4].townIndustryItems[_loc7_].industrySignErase.x = 40;
               screens[4].townIndustryItems[_loc7_].industrySignErase.y = 50;
               screens[4].townIndustryItems[_loc7_].industrySign.addChild(screens[4].townIndustryItems[_loc7_].industrySignErase);
               screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].industrySign);
               screens[4].townIndustryItems[_loc7_].nameText = new EngineText(GD.Towns[town].industries[_loc7_].name.toUpperCase(),16777215,16,"left",100,9,440,20);
               screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].nameText);
               screens[4].townIndustryItems[_loc7_].expensesText = new EngineText(Texts.fetch(1299).toUpperCase() + ": " + Math.round(GD.Towns[town].industries[_loc7_].totalExpenses * 100) / 100 + " €/" + Texts.fetch(941).toUpperCase(),16777215,12,"right",100,31,440,20);
               screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].expensesText);
               _loc1_ = 1294;
               if(Industry.Types[GD.Towns[town].industries[_loc7_].type].replaceEmployeesBySize)
               {
                  _loc1_ = 1316;
               }
               screens[4].townIndustryItems[_loc7_].employeesText = new EngineText(Texts.fetch(_loc1_).toUpperCase() + ": " + GD.Towns[town].industries[_loc7_].employees,16777215,12,"right",100,11,440,20);
               screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].employeesText);
               _loc2_ = [];
               _loc4_ = GD.Towns[town].industries[_loc7_].consumption;
               for(_loc8_ in _loc4_)
               {
                  _loc2_.push(Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase() + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
               }
               if(_loc4_.length == 0)
               {
                  _loc2_.push(Texts.fetch(949).toUpperCase());
               }
               screens[4].townIndustryItems[_loc7_].consumptionText = new EngineText(Texts.fetch(922).toUpperCase() + ": " + _loc2_.join("; "),16777215,12,"right",100,51,440,20);
               GameData.makeLineFit(screens[4].townIndustryItems[_loc7_].consumptionText,440);
               screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].consumptionText);
               _loc6_ = [];
               _loc2_ = [];
               _loc4_ = GD.Towns[town].industries[_loc7_].production;
               for(_loc8_ in _loc4_)
               {
                  if(_loc4_.length > 3)
                  {
                     _loc5_ = Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase().split(" ");
                     if(_loc5_.length > 1)
                     {
                        _loc5_[0] = _loc5_[0].charAt(0) + ".";
                     }
                     _loc2_.push(_loc5_.join(" ") + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
                  }
                  else
                  {
                     _loc2_.push(Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase() + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
                  }
                  _loc10_ = false;
                  for(_loc9_ in GameData.itemCategories)
                  {
                     if(Item.getDataFromType(_loc4_[_loc8_].item)[GameData.itemCategories[_loc9_]])
                     {
                        if(_loc6_[GameData.itemCategories[_loc9_]] == undefined)
                        {
                           _loc6_[GameData.itemCategories[_loc9_]] = _loc4_[_loc8_].amount;
                        }
                        else
                        {
                           var _loc20_:* = GameData.itemCategories[_loc9_];
                           var _loc23_:Number = _loc6_[_loc20_] + _loc4_[_loc8_].amount;
                           _loc6_[_loc20_] = _loc23_;
                        }
                        _loc10_ = true;
                        break;
                     }
                  }
                  if(!_loc10_)
                  {
                     for(_loc9_ in _loc18_.productsList)
                     {
                        if(_loc18_.productsList[_loc9_].item == _loc4_[_loc8_].item)
                        {
                           if(_loc18_.productsList[_loc9_].consumption - _loc18_.productsList[_loc9_].production > 0)
                           {
                              _loc19_ = true;
                           }
                           break;
                        }
                     }
                  }
               }
               if(!_loc19_)
               {
                  for(_loc8_ in _loc6_)
                  {
                     for(_loc9_ in _loc18_.categoryProducts)
                     {
                        if(_loc8_ == _loc9_)
                        {
                           if(_loc18_.categoryProducts[_loc9_].consumption - _loc18_.categoryProducts[_loc9_].production > 0)
                           {
                              _loc19_ = true;
                           }
                           break;
                        }
                     }
                  }
               }
               screens[4].townIndustryItems[_loc7_].productionText = new EngineText(Texts.fetch(921).toUpperCase() + ": " + _loc2_.join("; "),16777215,12,"right",100,71,440,20);
               GameData.makeLineFit(screens[4].townIndustryItems[_loc7_].productionText,440);
               screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].productionText);
               GD.Towns[town].industries[_loc7_].essential = _loc19_;
               if(GD.Towns[town].industries[_loc7_].forSale && !_loc19_ || GD.Story.finishedTheGame && GD.canBreakEconomy)
               {
                  screens[4].townIndustryItems[_loc7_].priceText = new EngineText(Texts.fetch(1296).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Towns[town].industries[_loc7_].price,2),16777215,14,"left",100,90,440,20);
                  screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].priceText);
                  if(GD.Caravans[0].money >= GD.Towns[town].industries[_loc7_].price)
                  {
                     screens[4].townIndustryItems[_loc7_].buyButton = new Sprite();
                     screens[4].townIndustryItems[_loc7_].buyButton.graphics.beginFill(0);
                     screens[4].townIndustryItems[_loc7_].buyButton.graphics.drawRect(0,0,200,20);
                     screens[4].townIndustryItems[_loc7_].buyButton.blendMode = "layer";
                     screens[4].townIndustryItems[_loc7_].buyButton.x = 340;
                     screens[4].townIndustryItems[_loc7_].buyButton.y = 90;
                     screens[4].townIndustryItems[_loc7_].buyButtonText = new EngineText(Texts.fetch(1298).toUpperCase(),16777215,14,"center",0,0,200,20);
                     screens[4].townIndustryItems[_loc7_].buyButtonText.blendMode = "erase";
                     screens[4].townIndustryItems[_loc7_].buyButton.addChild(screens[4].townIndustryItems[_loc7_].buyButtonText);
                     screens[4].townIndustryItems[_loc7_].buyButton.mouseChildren = false;
                     screens[4].townIndustryItems[_loc7_].buyButton.buttonMode = true;
                     screens[4].townIndustryItems[_loc7_].buyButton.addEventListener("click",buyIndustry,false,0,false);
                     screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].buyButton);
                  }
                  else
                  {
                     screens[4].townIndustryItems[_loc7_].notEnoughMoney = new EngineText(Texts.fetch(1273).toUpperCase(),16777215,14,"right",100,90,440,20);
                     screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].notEnoughMoney);
                  }
               }
               else
               {
                  screens[4].townIndustryItems[_loc7_].notForSale = new EngineText(Texts.fetch(1297).toUpperCase(),16777215,14,"right",100,90,440,20);
                  screens[4].townIndustryItems[_loc7_].disp.addChild(screens[4].townIndustryItems[_loc7_].notForSale);
               }
               screens[4].townsIndustriesArea.addContent(screens[4].townIndustryItems[_loc7_].disp,null,null,null,null,true);
            }
            screens[4].townsIndustriesArea.updateSize();
         }
         if(industriesPage == 1)
         {
            screens[4].playersIndustriesStorageText.text = Texts.fetch(1317).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Towns[town].occupiedPlayersStorageSpace,1,true) + " / " + MathFunctions.NumberFormat(GD.Towns[town].playersStorageSpace,0);
            screens[4].playersIndustriesMoneyText.text = Texts.fetch(1318).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Towns[town].playersMoney,2) + " € ";
            screens[4].playersIndustriesUnemployedText.text = Texts.fetch(1324).toUpperCase() + ": " + Math.max(GD.Towns[town].unemployed,0);
            screens[4].playersIndustriesButtons[0].disp.visible = GD.Towns[town].playersStorageSpace > 0;
            screens[4].playersIndustriesButtons[1].disp.visible = !Presets.Towns[town].cantExpandStorage;
            screens[4].playersIndustriesButtons[2].disp.visible = GD.Towns[town].playersIndustries.length > 0;
            screens[4].playersIndustriesButtons[3].disp.visible = GD.Towns[town].playersMoney > 0;
            for(_loc7_ in screens[4].playersIndustriesArea.contentList)
            {
               screens[4].playersIndustriesArea.Content.removeChild(screens[4].playersIndustriesArea.contentList[_loc7_].item);
            }
            screens[4].playersIndustriesArea.contentList = [];
            screens[4].playersIndustryItems = [];
            _loc18_ = GD.Towns[town].getConsumptionProduction();
            for(_loc7_ in GD.Towns[town].playersIndustries)
            {
               _loc16_ = true;
               _loc12_ = false;
               _loc13_ = GD.Towns[town].playersIndustries[_loc7_].consumption;
               for(_loc9_ in _loc13_)
               {
                  for(_loc8_ in _loc18_.productsList)
                  {
                     if(_loc18_.productsList[_loc8_].item == _loc13_[_loc9_].item)
                     {
                        _loc12_ = true;
                        if(_loc18_.productsList[_loc8_].production - _loc18_.productsList[_loc8_].consumption < _loc13_[_loc9_].amount)
                        {
                           trace(GD.Towns[town].playersIndustries[_loc7_].name + " is not feasible because it uses item " + _loc13_[_loc9_].item + " x " + _loc13_[_loc9_].amount + " and the town only produces " + _loc18_.productsList[_loc8_].production + "-" + _loc18_.productsList[_loc8_].consumption + " of this item");
                           _loc16_ = false;
                           break;
                        }
                     }
                  }
                  if(!_loc12_)
                  {
                     _loc16_ = false;
                  }
                  if(!_loc16_)
                  {
                     break;
                  }
               }
               screens[4].playersIndustryItems[_loc7_] = {};
               screens[4].playersIndustryItems[_loc7_].disp = new Sprite();
               screens[4].playersIndustryItems[_loc7_].disp.x = 10;
               screens[4].playersIndustryItems[_loc7_].disp.y = 10 + _loc7_ * 130;
               screens[4].playersIndustryItems[_loc7_].disp.graphics.lineStyle(1,0);
               screens[4].playersIndustryItems[_loc7_].disp.graphics.drawRect(0,0,550,120);
               screens[4].playersIndustryItems[_loc7_].industrySign = new Sprite();
               screens[4].playersIndustryItems[_loc7_].industrySign.blendMode = "layer";
               screens[4].playersIndustryItems[_loc7_].industrySign.graphics.beginFill(0);
               screens[4].playersIndustryItems[_loc7_].industrySign.graphics.drawRect(0,0,80,100);
               screens[4].playersIndustryItems[_loc7_].industrySign.x = 10;
               screens[4].playersIndustryItems[_loc7_].industrySign.y = 10;
               screens[4].playersIndustryItems[_loc7_].industrySignErase = GD.Towns[town].playersIndustries[_loc7_].picture;
               screens[4].playersIndustryItems[_loc7_].industrySignErase.blendMode = "erase";
               screens[4].playersIndustryItems[_loc7_].industrySignErase.scaleX = screens[4].playersIndustryItems[_loc7_].industrySignErase.scaleY = 0.6;
               screens[4].playersIndustryItems[_loc7_].industrySignErase.x = 40;
               screens[4].playersIndustryItems[_loc7_].industrySignErase.y = 50;
               screens[4].playersIndustryItems[_loc7_].industrySign.addChild(screens[4].playersIndustryItems[_loc7_].industrySignErase);
               screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].industrySign);
               screens[4].playersIndustryItems[_loc7_].nameText = new EngineText(GD.Towns[town].playersIndustries[_loc7_].name.toUpperCase(),16777215,16,"left",100,9,440,20);
               screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].nameText);
               screens[4].playersIndustryItems[_loc7_].expensesText = new EngineText(Texts.fetch(1299).toUpperCase() + ": " + Math.round(GD.Towns[town].playersIndustries[_loc7_].totalExpenses * 100) / 100 + " €/" + Texts.fetch(941).toUpperCase(),16777215,12,"right",100,31,440,20);
               screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].expensesText);
               _loc1_ = 1294;
               if(Industry.Types[GD.Towns[town].playersIndustries[_loc7_].type].replaceEmployeesBySize)
               {
                  _loc1_ = 1316;
               }
               screens[4].playersIndustryItems[_loc7_].employeesText = new EngineText(Texts.fetch(_loc1_).toUpperCase() + ": " + GD.Towns[town].playersIndustries[_loc7_].employees,16777215,12,"right",100,11,440,20);
               screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].employeesText);
               _loc2_ = [];
               _loc4_ = GD.Towns[town].playersIndustries[_loc7_].consumption;
               for(_loc8_ in _loc4_)
               {
                  _loc2_.push(Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase() + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
               }
               if(_loc4_.length == 0)
               {
                  _loc2_.push(Texts.fetch(949).toUpperCase());
               }
               screens[4].playersIndustryItems[_loc7_].consumptionText = new EngineText(Texts.fetch(922).toUpperCase() + ": " + _loc2_.join("; "),16777215,12,"right",100,51,440,20);
               GameData.makeLineFit(screens[4].playersIndustryItems[_loc7_].consumptionText,440);
               screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].consumptionText);
               _loc2_ = [];
               _loc4_ = GD.Towns[town].playersIndustries[_loc7_].production;
               for(_loc8_ in _loc4_)
               {
                  if(_loc4_.length > 3)
                  {
                     _loc5_ = Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase().split(" ");
                     if(_loc5_.length > 1)
                     {
                        _loc5_[0] = _loc5_[0].charAt(0) + ".";
                     }
                     _loc2_.push(_loc5_.join(" ") + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
                  }
                  else
                  {
                     _loc2_.push(Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase() + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
                  }
               }
               screens[4].playersIndustryItems[_loc7_].productionText = new EngineText(Texts.fetch(921).toUpperCase() + ": " + _loc2_.join("; "),16777215,12,"right",100,71,440,20);
               GameData.makeLineFit(screens[4].playersIndustryItems[_loc7_].productionText,440);
               screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].productionText);
               if(!GD.Towns[town].playersIndustries[_loc7_].cantDownsize)
               {
                  screens[4].playersIndustryItems[_loc7_].downsizeButton = new Sprite();
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.graphics.beginFill(0);
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.graphics.drawRect(0,0,140,20);
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.blendMode = "layer";
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.x = 400;
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.y = 90;
                  screens[4].playersIndustryItems[_loc7_].downsizeButtonText = new EngineText(Texts.fetch(1323).toUpperCase(),16777215,14,"center",0,0,140,20);
                  screens[4].playersIndustryItems[_loc7_].downsizeButtonText.blendMode = "erase";
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.addChild(screens[4].playersIndustryItems[_loc7_].downsizeButtonText);
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.mouseChildren = false;
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.buttonMode = true;
                  screens[4].playersIndustryItems[_loc7_].downsizeButton.addEventListener("click",downsizeIndustry,false,0,false);
                  screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].downsizeButton);
               }
               if(_loc16_)
               {
                  screens[4].playersIndustryItems[_loc7_].sellButton = new Sprite();
                  screens[4].playersIndustryItems[_loc7_].sellButton.graphics.beginFill(0);
                  screens[4].playersIndustryItems[_loc7_].sellButton.graphics.drawRect(0,0,140,20);
                  screens[4].playersIndustryItems[_loc7_].sellButton.blendMode = "layer";
                  screens[4].playersIndustryItems[_loc7_].sellButton.x = 100;
                  screens[4].playersIndustryItems[_loc7_].sellButton.y = 90;
                  screens[4].playersIndustryItems[_loc7_].sellButtonText = new EngineText(Texts.fetch(1328).toUpperCase(),16777215,14,"center",0,0,140,20);
                  screens[4].playersIndustryItems[_loc7_].sellButtonText.blendMode = "erase";
                  screens[4].playersIndustryItems[_loc7_].sellButton.addChild(screens[4].playersIndustryItems[_loc7_].sellButtonText);
                  screens[4].playersIndustryItems[_loc7_].sellButton.mouseChildren = false;
                  screens[4].playersIndustryItems[_loc7_].sellButton.buttonMode = true;
                  screens[4].playersIndustryItems[_loc7_].sellButton.addEventListener("click",sellIndustry,false,0,false);
                  screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].sellButton);
               }
               if(GD.Towns[town].playersIndustries[_loc7_].pricePerUnit <= GD.Caravans[0].money && GD.Towns[town].unemployed > 0 && (!GD.Towns[town].playersIndustries[_loc7_].naturalResource || GD.Towns[town].playersIndustries[_loc7_].employees < GD.Towns[town].playersIndustries[_loc7_].maxSize))
               {
                  screens[4].playersIndustryItems[_loc7_].expandButton = new Sprite();
                  screens[4].playersIndustryItems[_loc7_].expandButton.graphics.beginFill(0);
                  screens[4].playersIndustryItems[_loc7_].expandButton.graphics.drawRect(0,0,140,20);
                  screens[4].playersIndustryItems[_loc7_].expandButton.blendMode = "layer";
                  screens[4].playersIndustryItems[_loc7_].expandButton.x = 250;
                  screens[4].playersIndustryItems[_loc7_].expandButton.y = 90;
                  screens[4].playersIndustryItems[_loc7_].expandButtonText = new EngineText(Texts.fetch(1320).toUpperCase(),16777215,14,"center",0,0,140,20);
                  screens[4].playersIndustryItems[_loc7_].expandButtonText.blendMode = "erase";
                  screens[4].playersIndustryItems[_loc7_].expandButton.addChild(screens[4].playersIndustryItems[_loc7_].expandButtonText);
                  screens[4].playersIndustryItems[_loc7_].expandButton.mouseChildren = false;
                  screens[4].playersIndustryItems[_loc7_].expandButton.buttonMode = true;
                  screens[4].playersIndustryItems[_loc7_].expandButton.addEventListener("click",expandIndustry,false,0,false);
                  screens[4].playersIndustryItems[_loc7_].disp.addChild(screens[4].playersIndustryItems[_loc7_].expandButton);
               }
               screens[4].playersIndustriesArea.addContent(screens[4].playersIndustryItems[_loc7_].disp,null,null,null,null,true);
            }
            screens[4].playersIndustriesArea.updateSize();
         }
         if(industriesPage == 2)
         {
            screens[4].newIndustryArea.clearAll();
            _loc14_ = [];
            if(!Presets.Towns[town].stableEmployment)
            {
               for(_loc7_ in GD.Towns[town].possibleIndustries)
               {
                  _loc12_ = false;
                  for(_loc8_ in GD.Towns[town].industries)
                  {
                     if(GD.Towns[town].industries[_loc8_].type == GD.Towns[town].possibleIndustries[_loc7_])
                     {
                        _loc12_ = true;
                        break;
                     }
                  }
                  for(_loc8_ in GD.Towns[town].playersIndustries)
                  {
                     if(GD.Towns[town].playersIndustries[_loc8_].type == GD.Towns[town].possibleIndustries[_loc7_])
                     {
                        _loc12_ = true;
                        break;
                     }
                  }
                  if(!_loc12_)
                  {
                     _loc14_.push(GD.Towns[town].possibleIndustries[_loc7_]);
                  }
               }
               for(_loc7_ in Presets.Towns[town].industries)
               {
                  _loc12_ = false;
                  for(_loc8_ in GD.Towns[town].industries)
                  {
                     if(Presets.Towns[town].industries[_loc7_].type == GD.Towns[town].industries[_loc8_].type)
                     {
                        _loc12_ = true;
                        break;
                     }
                  }
                  for(_loc8_ in GD.Towns[town].playersIndustries)
                  {
                     if(Presets.Towns[town].industries[_loc7_].type == GD.Towns[town].playersIndustries[_loc8_].type)
                     {
                        _loc12_ = true;
                        break;
                     }
                  }
                  if(!_loc12_)
                  {
                     _loc14_.push(Presets.Towns[town].industries[_loc7_].type);
                  }
               }
               _loc15_ = false;
               for(_loc7_ in GD.Towns[town].bannedGoods)
               {
                  if(GD.Towns[town].bannedGoods[_loc7_] == 104)
                  {
                     _loc15_ = true;
                     break;
                  }
               }
               if(_loc15_)
               {
                  for(_loc7_ in _loc14_)
                  {
                     if(_loc14_[_loc7_] == 21)
                     {
                        _loc14_.splice(_loc7_,1);
                        break;
                     }
                  }
               }
            }
            if(_loc14_.length == 0)
            {
               _loc3_ = new EngineText(Texts.fetch(4179).toUpperCase(),16777215,14,"center",10,140,550,500,true,true);
               _loc3_.y = 140 - _loc3_.textHeight / 2 - 2;
               _loc3_.height = _loc3_.textHeight + 10;
               screens[4].newIndustryArea.addContent(_loc3_);
            }
            else
            {
               screens[4].newIndustryItems = [];
               for(_loc7_ in _loc14_)
               {
                  _loc11_ = new Industry(_loc14_[_loc7_],1,GD.Towns[town]);
                  screens[4].newIndustryItems[_loc7_] = {};
                  screens[4].newIndustryItems[_loc7_].disp = new Sprite();
                  screens[4].newIndustryItems[_loc7_].disp.x = 10;
                  screens[4].newIndustryItems[_loc7_].disp.y = 10 + _loc7_ * 130;
                  screens[4].newIndustryItems[_loc7_].disp.graphics.lineStyle(1,0);
                  screens[4].newIndustryItems[_loc7_].disp.graphics.drawRect(0,0,550,120);
                  screens[4].newIndustryItems[_loc7_].industry = _loc11_;
                  screens[4].newIndustryItems[_loc7_].industrySign = new Sprite();
                  screens[4].newIndustryItems[_loc7_].industrySign.blendMode = "layer";
                  screens[4].newIndustryItems[_loc7_].industrySign.graphics.beginFill(0);
                  screens[4].newIndustryItems[_loc7_].industrySign.graphics.drawRect(0,0,80,100);
                  screens[4].newIndustryItems[_loc7_].industrySign.x = 10;
                  screens[4].newIndustryItems[_loc7_].industrySign.y = 10;
                  screens[4].newIndustryItems[_loc7_].industrySignErase = _loc11_.picture;
                  screens[4].newIndustryItems[_loc7_].industrySignErase.blendMode = "erase";
                  screens[4].newIndustryItems[_loc7_].industrySignErase.scaleX = screens[4].newIndustryItems[_loc7_].industrySignErase.scaleY = 0.6;
                  screens[4].newIndustryItems[_loc7_].industrySignErase.x = 40;
                  screens[4].newIndustryItems[_loc7_].industrySignErase.y = 50;
                  screens[4].newIndustryItems[_loc7_].industrySign.addChild(screens[4].newIndustryItems[_loc7_].industrySignErase);
                  screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].industrySign);
                  screens[4].newIndustryItems[_loc7_].nameText = new EngineText(_loc11_.name.toUpperCase(),16777215,16,"left",100,9,440,20);
                  screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].nameText);
                  screens[4].newIndustryItems[_loc7_].expensesText = new EngineText(Texts.fetch(1299).toUpperCase() + ": " + Math.round(_loc11_.totalExpenses * 100) / 100 + " €/" + Texts.fetch(941).toUpperCase(),16777215,12,"right",100,31,440,20);
                  screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].expensesText);
                  screens[4].newIndustryItems[_loc7_].storageText = new EngineText(Texts.fetch(1317).toUpperCase() + ": " + _loc11_.storagePerUnit,16777215,12,"right",100,11,440,20);
                  screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].storageText);
                  _loc2_ = [];
                  _loc4_ = _loc11_.consumption;
                  for(_loc8_ in _loc4_)
                  {
                     _loc2_.push(Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase() + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
                  }
                  if(_loc4_.length == 0)
                  {
                     _loc2_.push(Texts.fetch(949).toUpperCase());
                  }
                  screens[4].newIndustryItems[_loc7_].consumptionText = new EngineText(Texts.fetch(922).toUpperCase() + ": " + _loc2_.join("; "),16777215,12,"right",100,51,440,20);
                  GameData.makeLineFit(screens[4].newIndustryItems[_loc7_].consumptionText,440);
                  screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].consumptionText);
                  _loc2_ = [];
                  _loc4_ = _loc11_.production;
                  for(_loc8_ in _loc4_)
                  {
                     if(_loc4_.length > 3)
                     {
                        _loc5_ = Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase().split(" ");
                        if(_loc5_.length > 1)
                        {
                           _loc5_[0] = _loc5_[0].charAt(0) + ".";
                        }
                        _loc2_.push(_loc5_.join(" ") + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
                     }
                     else
                     {
                        _loc2_.push(Texts.fetch(Item.getDataFromType(_loc4_[_loc8_].item).name).toUpperCase() + " x " + Math.round(_loc4_[_loc8_].amount * 10) / 10);
                     }
                  }
                  screens[4].newIndustryItems[_loc7_].productionText = new EngineText(Texts.fetch(921).toUpperCase() + ": " + _loc2_.join("; "),16777215,12,"right",100,71,440,20);
                  GameData.makeLineFit(screens[4].newIndustryItems[_loc7_].productionText,440);
                  screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].productionText);
                  if(_loc11_.forSale || GD.Story.finishedTheGame && GD.canBreakEconomy)
                  {
                     screens[4].newIndustryItems[_loc7_].priceText = new EngineText(Texts.fetch(1296).toUpperCase() + ": " + MathFunctions.NumberFormat(_loc11_.price * 3,2),16777215,14,"left",100,90,440,20);
                     screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].priceText);
                     if(GD.Caravans[0].money < _loc11_.price * 3)
                     {
                        screens[4].newIndustryItems[_loc7_].notEnoughMoney = new EngineText(Texts.fetch(1273).toUpperCase(),16777215,14,"right",100,90,440,20);
                        screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].notEnoughMoney);
                     }
                     else if(GD.Towns[town].unemployed <= 0)
                     {
                        screens[4].newIndustryItems[_loc7_].notUnemployed = new EngineText(Texts.fetch(4210).toUpperCase(),16777215,14,"right",100,90,440,20);
                        screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].notUnemployed);
                     }
                     else
                     {
                        screens[4].newIndustryItems[_loc7_].buyButton = new Sprite();
                        screens[4].newIndustryItems[_loc7_].buyButton.graphics.beginFill(0);
                        screens[4].newIndustryItems[_loc7_].buyButton.graphics.drawRect(0,0,200,20);
                        screens[4].newIndustryItems[_loc7_].buyButton.blendMode = "layer";
                        screens[4].newIndustryItems[_loc7_].buyButton.x = 340;
                        screens[4].newIndustryItems[_loc7_].buyButton.y = 90;
                        screens[4].newIndustryItems[_loc7_].buyButtonText = new EngineText(Texts.fetch(4172).toUpperCase(),16777215,14,"center",0,0,200,20);
                        screens[4].newIndustryItems[_loc7_].buyButtonText.blendMode = "erase";
                        screens[4].newIndustryItems[_loc7_].buyButton.addChild(screens[4].newIndustryItems[_loc7_].buyButtonText);
                        screens[4].newIndustryItems[_loc7_].buyButton.mouseChildren = false;
                        screens[4].newIndustryItems[_loc7_].buyButton.buttonMode = true;
                        screens[4].newIndustryItems[_loc7_].buyButton.addEventListener("click",startIndustry,false,0,false);
                        screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].buyButton);
                     }
                  }
                  else
                  {
                     screens[4].newIndustryItems[_loc7_].notForSale = new EngineText(Texts.fetch(1297).toUpperCase(),16777215,14,"right",100,90,440,20);
                     screens[4].newIndustryItems[_loc7_].disp.addChild(screens[4].newIndustryItems[_loc7_].notForSale);
                  }
                  screens[4].newIndustryArea.addContent(screens[4].newIndustryItems[_loc7_].disp,null,null,null,null,true);
               }
            }
            screens[4].newIndustryArea.updateSize();
         }
         updateBottomLine();
      }
      
      private function updateStatsPage() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in screens[2].subScreens)
         {
            screens[2].switchButtonFrames[_loc1_].visible = screens[2].subScreens[_loc1_].visible = _loc1_ == statsScreen;
         }
      }
      
      private function updateStats() : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         screens[2].population.text = Texts.fetch(1411).toUpperCase() + ": " + Math.max(GD.Towns[town].population,0);
         screens[2].wealthFactor.text = Texts.fetch(1412).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Towns[town].GDPperCapita,2);
         screens[2].switchButtons[2].visible = GD.Towns[town].playersIndustries.length > 0;
         if(!screens[2].switchButtons[2].visible && statsScreen == 2)
         {
            statsScreen = 0;
         }
         updateStatsPage();
         var _loc1_:* = GD.Towns[town].getConsumptionProduction();
         var _loc2_:* = _loc1_.categoryProducts;
         var _loc3_:* = _loc1_.productsList;
         screens[2].prodArea.clearAll();
         var _loc4_:* = 10;
         for(_loc5_ in _loc2_)
         {
            screens[2].prodArea.addContent(new EngineText(Texts.fetch(GameData.itemCategoryNames[_loc5_],1,19).toUpperCase(),0,14,"left",10,_loc4_,180,20),null,null,null,null,false);
            if(_loc2_[_loc5_].production == 0)
            {
               _loc6_ = "-";
            }
            else
            {
               _loc6_ = MathFunctions.NumberFormat(_loc2_[_loc5_].production,1,true);
            }
            screens[2].prodArea.addContent(new EngineText(_loc6_,0,14,"center",190,_loc4_,130,20),null,null,null,null,false);
            if(_loc2_[_loc5_].consumption == 0)
            {
               _loc6_ = "-";
            }
            else
            {
               _loc6_ = MathFunctions.NumberFormat(_loc2_[_loc5_].consumption,1,true);
            }
            screens[2].prodArea.addContent(new EngineText(_loc6_,0,14,"center",330,_loc4_,130,20),null,null,null,null,false);
            _loc6_ = MathFunctions.NumberFormat(_loc2_[_loc5_].production - _loc2_[_loc5_].consumption,1,true);
            if(_loc2_[_loc5_].production > _loc2_[_loc5_].consumption)
            {
               _loc6_ = "+" + _loc6_;
            }
            screens[2].prodArea.addContent(new EngineText(_loc6_,0,14,"center",470,_loc4_,130,20),null,null,null,null,false);
            _loc4_ += 20;
         }
         for(_loc5_ in _loc3_)
         {
            screens[2].prodArea.addContent(new EngineText(Texts.fetch(Item.getDataFromType(_loc3_[_loc5_].item).name,1,19).toUpperCase(),0,14,"left",10,_loc4_,180,20),null,null,null,null,false);
            if(_loc3_[_loc5_].production == 0)
            {
               _loc6_ = "-";
            }
            else
            {
               _loc6_ = MathFunctions.NumberFormat(_loc3_[_loc5_].production,1,true);
            }
            screens[2].prodArea.addContent(new EngineText(_loc6_,0,14,"center",190,_loc4_,130,20),null,null,null,null,false);
            if(_loc3_[_loc5_].consumption == 0)
            {
               _loc6_ = "-";
            }
            else
            {
               _loc6_ = MathFunctions.NumberFormat(_loc3_[_loc5_].consumption,1,true);
            }
            screens[2].prodArea.addContent(new EngineText(_loc6_,0,14,"center",330,_loc4_,130,20),null,null,null,null,false);
            _loc6_ = MathFunctions.NumberFormat(_loc3_[_loc5_].production - _loc3_[_loc5_].consumption,1,true);
            if(_loc3_[_loc5_].production > _loc3_[_loc5_].consumption)
            {
               _loc6_ = "+" + _loc6_;
            }
            screens[2].prodArea.addContent(new EngineText(_loc6_,0,14,"center",470,_loc4_,130,20),null,null,null,null,false);
            _loc4_ += 20;
         }
         screens[2].prodArea.updateSize();
         recentDataGraph.update(GD.Towns[town].historicalData,false);
         playersGraph.update(GD.Towns[town].historicalData,true);
      }
      
      private function downsizeIndustry(param1:*) : *
      {
         var num:*;
         var i:*;
         var e:* = param1;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(i in screens[4].playersIndustryItems)
         {
            if(screens[4].playersIndustryItems[i].downsizeButton == e.target)
            {
               num = i;
               break;
            }
         }
         changingIndustry = GD.Towns[town].playersIndustries[num];
         calculator.min = 0;
         calculator.max = changingIndustry.employees;
         calculator.visible = true;
         calculator.onUpdate = function():*
         {
            if(calculator.value <= calculator.max && calculator.value > 0)
            {
               calculator.rightSideText.text = Texts.fetch(1325).replace("@money@",MathFunctions.NumberFormat(changingIndustry.pricePerUnit * calculator.value * 0.35,0) + " €").toUpperCase();
            }
            else
            {
               calculator.rightSideText.text = "";
            }
         };
         calculator.setValue(0);
         calculator.info.text = Texts.fetch(1326).toUpperCase();
         calculator.onDone = function():*
         {
            var remainingSpace:*;
            if(calculator.value > 0)
            {
               remainingSpace = GD.Towns[town].playersStorageSpace - Industry.Types[changingIndustry.type].storagePerUnit * calculator.value - GD.Towns[town].occupiedPlayersStorageSpace;
               if(remainingSpace < 0)
               {
                  messageDialogue.setText(Texts.fetch(3398).replace("@number@",calculator.value).replace("@weight@",MathFunctions.NumberFormat(0 - remainingSpace,1,true) + " " + Texts.fetch(12)).replace("@expand@",Math.ceil(0 - remainingSpace)).replace("@downsize@",Math.floor((GD.Towns[town].playersStorageSpace - GD.Towns[town].occupiedPlayersStorageSpace) / Industry.Types[changingIndustry.type].storagePerUnit)).toUpperCase());
                  messageDialogue.visible = true;
               }
               else
               {
                  confirmDialogue.setText(Texts.fetch(1327).replace("@industryname@",changingIndustry.name).replace("@number@",calculator.value).toUpperCase());
                  confirmDialogue.visible = true;
                  confirmDialogue.onApprove = function():*
                  {
                     doDownsize(calculator.value);
                  };
               }
            }
         };
      }
      
      private function doDownsize(param1:*) : *
      {
         var _loc3_:* = undefined;
         changingIndustry.employees -= param1;
         GD.Towns[town].unemployed += param1;
         var _loc2_:Number = changingIndustry.pricePerUnit * param1 * 0.35;
         GD.Caravans[0].money += _loc2_;
         GD.Towns[town].money -= _loc2_;
         if(GD.Towns[town].money < 0)
         {
            GD.Towns[town].money = 0;
         }
         if(changingIndustry.employees == 0)
         {
            for(_loc3_ in GD.Towns[town].playersIndustries)
            {
               if(GD.Towns[town].playersIndustries[_loc3_] == changingIndustry)
               {
                  GD.Towns[town].playersIndustries.splice(_loc3_,1);
                  break;
               }
            }
         }
         GD.Towns[town].playersStorageSpace -= Industry.Types[changingIndustry.type].storagePerUnit * param1;
         updateIndustries();
      }
      
      private function expandIndustry(param1:*) : *
      {
         var num:*;
         var i:*;
         var maxExpand:*;
         var e:* = param1;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(i in screens[4].playersIndustryItems)
         {
            if(screens[4].playersIndustryItems[i].expandButton == e.target)
            {
               num = i;
               break;
            }
         }
         changingIndustry = GD.Towns[town].playersIndustries[num];
         maxExpand = Math.min(GD.Towns[town].unemployed,Math.floor(GD.Caravans[0].money / changingIndustry.pricePerUnit));
         if(changingIndustry.naturalResource)
         {
            maxExpand = Math.min(maxExpand,changingIndustry.maxSize - changingIndustry.employees);
         }
         calculator.min = 0;
         calculator.max = maxExpand;
         calculator.visible = true;
         calculator.onUpdate = function():*
         {
            if(calculator.value <= calculator.max && calculator.value > 0)
            {
               calculator.rightSideText.text = Texts.fetch(1331).replace("@money@",MathFunctions.NumberFormat(changingIndustry.pricePerUnit * calculator.value,0) + " €").toUpperCase();
            }
            else
            {
               calculator.rightSideText.text = "";
            }
         };
         calculator.setValue(0);
         calculator.info.text = Texts.fetch(1330).toUpperCase();
         calculator.onDone = function():*
         {
            if(calculator.value > 0)
            {
               confirmDialogue.setText(Texts.fetch(1332).replace("@industryname@",changingIndustry.name).replace("@number@",calculator.value).replace("@price@",MathFunctions.NumberFormat(changingIndustry.pricePerUnit * calculator.value,0) + " €").toUpperCase());
               confirmDialogue.visible = true;
               confirmDialogue.onApprove = function():*
               {
                  changingIndustry.employees += calculator.value;
                  GD.Towns[town].unemployed -= calculator.value;
                  var _loc1_:Number = changingIndustry.pricePerUnit * calculator.value;
                  GD.Caravans[0].money -= _loc1_;
                  GD.Towns[town].money += _loc1_;
                  GD.Towns[town].playersStorageSpace += Industry.Types[changingIndustry.type].storagePerUnit * calculator.value;
                  updateIndustries();
               };
            }
         };
      }
      
      private function sellIndustry(param1:*) : *
      {
         var num:*;
         var i:*;
         var remainingSpace:*;
         var e:* = param1;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(i in screens[4].playersIndustryItems)
         {
            if(screens[4].playersIndustryItems[i].sellButton == e.target)
            {
               num = i;
               break;
            }
         }
         changingIndustry = GD.Towns[town].playersIndustries[num];
         remainingSpace = GD.Towns[town].playersStorageSpace - Industry.Types[changingIndustry.type].storagePerUnit * changingIndustry.employees - GD.Towns[town].occupiedPlayersStorageSpace;
         if(remainingSpace < 0)
         {
            messageDialogue.setText(Texts.fetch(4283,GD.Caravans[0].People[0].gender).replace("@weight@",MathFunctions.NumberFormat(0 - remainingSpace,1,true) + " " + Texts.fetch(12)).replace("@expand@",Math.ceil(0 - remainingSpace)).toUpperCase());
            messageDialogue.visible = true;
         }
         else
         {
            confirmDialogue.setText(Texts.fetch(1329,GD.Caravans[0].People[0].gender).replace("@industryname@",changingIndustry.name).replace("@money@",MathFunctions.NumberFormat(changingIndustry.price * 0.55,0) + " €").toUpperCase());
            confirmDialogue.visible = true;
            confirmDialogue.onApprove = function():*
            {
               var _loc2_:* = undefined;
               var _loc1_:Number = changingIndustry.price * 0.55;
               GD.Towns[town].money -= _loc1_;
               if(GD.Towns[town].money < 0)
               {
                  GD.Towns[town].money = 0;
               }
               GD.Caravans[0].money += _loc1_;
               GD.Towns[town].industries.push(changingIndustry);
               for(_loc2_ in GD.Towns[town].playersIndustries)
               {
                  if(GD.Towns[town].playersIndustries[_loc2_] == changingIndustry)
                  {
                     GD.Towns[town].playersIndustries.splice(_loc2_,1);
                     break;
                  }
               }
               GD.Towns[town].playersStorageSpace -= Industry.Types[changingIndustry.type].storagePerUnit * changingIndustry.employees;
               updateIndustries();
            };
         }
      }
      
      private function buyIndustry(param1:*) : *
      {
         var num:*;
         var i:*;
         var e:* = param1;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(i in screens[4].townIndustryItems)
         {
            if(screens[4].townIndustryItems[i].buyButton == e.target)
            {
               num = i;
               break;
            }
         }
         confirmDialogue.setText(Texts.fetch(1315).replace("@industry@",GD.Towns[town].industries[num].name).toUpperCase());
         confirmDialogue.visible = true;
         buyingIndustry = GD.Towns[town].industries[num];
         confirmDialogue.onApprove = function():*
         {
            var _loc1_:* = undefined;
            for(_loc1_ in GD.Towns[town].industries)
            {
               if(GD.Towns[town].industries[_loc1_] == buyingIndustry)
               {
                  GD.Towns[town].industries.splice(_loc1_,1);
                  break;
               }
            }
            GD.Caravans[0].money -= buyingIndustry.price;
            GD.Towns[town].playersIndustries.push(buyingIndustry);
            GD.Towns[town].playersStorageSpace += Industry.Types[buyingIndustry.type].storagePerUnit * buyingIndustry.employees;
            updateIndustries();
         };
      }
      
      private function startIndustry(param1:*) : *
      {
         var i:*;
         var e:* = param1;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(i in screens[4].newIndustryItems)
         {
            if(screens[4].newIndustryItems[i].buyButton == e.target)
            {
               startingIndustry = screens[4].newIndustryItems[i].industry;
               break;
            }
         }
         confirmDialogue.setText(Texts.fetch(4174).replace("@industry@",startingIndustry.name).toUpperCase());
         confirmDialogue.visible = true;
         confirmDialogue.onApprove = function():*
         {
            GD.Caravans[0].money -= startingIndustry.price * 3;
            GD.Towns[town].money += startingIndustry.price * 3;
            GD.Towns[town].playersIndustries.push(startingIndustry);
            GD.Towns[town].unemployed--;
            GD.Towns[town].playersStorageSpace += Industry.Types[startingIndustry.type].storagePerUnit * startingIndustry.employees;
            if(town == 20)
            {
               GD.Towns[town].locations[0].visible = true;
            }
            if(town == 17)
            {
               GD.Towns[town].locations[1].visible = true;
            }
            updateIndustries();
         };
      }
      
      private function clickLabel(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXPage().play();
         }
         for(_loc3_ in screens[4].labelButtons)
         {
            if(screens[4].labelButtons[_loc3_].disp == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         industriesPage = _loc2_;
         updateIndustries();
      }
      
      private function selectPersonToHire(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc5_:* = undefined;
         var _loc3_:Array = [];
         selectedPerson = param1;
         if(screens[3].portraitInside is DisplayObject && screens[3].crewPortrait.contains(screens[3].portraitInside))
         {
            screens[3].crewPortrait.removeChild(screens[3].portraitInside);
         }
         screens[3].frames.visible = screens[3].infoArea.visible = screens[3].crewPhotoFG.visible = screens[3].crewPhotoBG.visible = screens[3].crewPortrait.visible = screens[3].salaryText.visible = screens[3].name.visible = screens[3].hireButton.visible = screens[3].notEnoughMoney.visible = screens[3].hostileFaction.visible = param1 is Character;
         if(screens[3].peopleList is List)
         {
            screens[3].peopleList.visible = param1 is Character;
         }
         screens[3].noPeopleToHire.visible = !(param1 is Character);
         screens[3].infoArea.clearAll();
         if(param1 is Character)
         {
            screens[3].portraitInside = selectedPerson.picture;
            screens[3].crewPortrait.addChild(screens[3].portraitInside);
            screens[3].name.text = selectedPerson.name.toUpperCase();
            _loc3_[0] = {
               "title":944,
               "value":selectedPerson.basePhysical,
               "y":10
            };
            _loc3_[1] = {
               "title":945,
               "value":selectedPerson.baseAgility,
               "y":30
            };
            _loc3_[2] = {
               "title":946,
               "value":selectedPerson.baseAccuracy,
               "y":50
            };
            _loc3_[3] = {
               "title":947,
               "value":selectedPerson.baseIntelligence,
               "y":70
            };
            _loc3_[4] = {
               "title":6797,
               "value":Math.round(GD.getFactionRelations(0,selectedPerson.faction)),
               "y":100
            };
            _loc3_[5] = {
               "title":984,
               "value":Math.round(selectedPerson.totalExperience),
               "y":130
            };
            _loc3_[6] = {
               "title":985,
               "value":Math.round(selectedPerson.generalBattleExperience),
               "y":150
            };
            _loc3_[7] = {
               "title":1095,
               "value":Math.round(selectedPerson.maxAP),
               "y":180
            };
            _loc3_[8] = {
               "title":6,
               "value":Math.round(selectedPerson.speed * 10) / 10,
               "y":200
            };
            _loc3_[9] = {
               "title":1271,
               "value":Math.round(selectedPerson.capacity),
               "y":230
            };
            _loc3_[10] = {
               "title":966,
               "value":Math.round(selectedPerson.learningCapacity * 100),
               "y":260
            };
            for(_loc4_ in Character.skillsList)
            {
               if(Character.skillsList[_loc4_].skill == "painThreshold")
               {
                  _loc2_ = 100;
               }
               else
               {
                  _loc2_ = 1;
               }
               _loc3_[10 + _loc4_] = {
                  "title":Character.skillsList[_loc4_].name,
                  "value":Math.round(selectedPerson[Character.skillsList[_loc4_].skill] * _loc2_),
                  "y":290 + _loc4_ * 20
               };
            }
            _loc5_ = 290 + Character.skillsList.length * 20;
            _loc3_.push({
               "title":996,
               "value":Math.round(selectedPerson.weight),
               "y":_loc5_ + 10
            });
            _loc3_.push({
               "title":997,
               "value":Math.round(selectedPerson.weight / selectedPerson.idealWeight * 100),
               "y":_loc5_ + 30
            });
            _loc3_.push({
               "title":998,
               "value":MathFunctions.NumberFormat(selectedPerson.GDA,0) + " " + Texts.fetch(939),
               "y":_loc5_ + 60
            });
            _loc3_.push({
               "title":999,
               "value":MathFunctions.NumberFormat(selectedPerson.waterConsumption,3,true) + " " + Texts.fetch(11),
               "y":_loc5_ + 80
            });
            _loc3_.push({
               "title":50,
               "value":Math.round(selectedPerson.HP) + "/" + Math.round(selectedPerson.maxHP),
               "y":_loc5_ + 110
            });
            for(_loc4_ in _loc3_)
            {
               screens[3].titles[_loc4_] = new EngineText(Texts.fetch(_loc3_[_loc4_].title).toUpperCase(),5259312,14,"left",10,_loc3_[_loc4_].y,300,20);
               screens[3].infoArea.addContent(screens[3].titles[_loc4_],null,null,null,null,true);
               screens[3].values[_loc4_] = new EngineText(_loc3_[_loc4_].value,5259312,14,"right",10,_loc3_[_loc4_].y,300,20);
               screens[3].infoArea.addContent(screens[3].values[_loc4_],null,null,null,null,true);
            }
            screens[3].salaryText.text = Texts.fetch(988).toUpperCase() + ": " + Math.round(selectedPerson.salary) + " / " + Texts.fetch(942).toUpperCase();
            screens[3].hireButton.visible = selectedPerson.salary <= GD.Caravans[0].money && GD.getFactionRelations(selectedPerson.faction,0) > -20;
            screens[3].hostileFaction.visible = GD.getFactionRelations(selectedPerson.faction,0) <= -20;
            if(screens[3].hostileFaction.visible)
            {
               screens[3].hostileFaction.text = Texts.fetch(6798,selectedPerson.gender,38);
            }
            screens[3].notEnoughMoney.visible = selectedPerson.salary > GD.Caravans[0].money && !screens[3].hostileFaction.visible;
         }
         screens[3].infoArea.updateSize();
         updateBottomLine();
      }
      
      public function hirePerson(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXCashRegister().play();
         }
         selectedPerson.payDay = GD.Time + 604800;
         GD.Caravans[0].addPerson(selectedPerson);
         GD.Caravans[0].money -= selectedPerson.salary;
         for(_loc2_ in GD.Towns[town].people)
         {
            if(GD.Towns[town].people[_loc2_] == selectedPerson)
            {
               GD.Towns[town].people.splice(_loc2_,1);
               break;
            }
         }
         GD.Towns[town].population--;
         GD.Towns[town].unemployed = Math.max(0,GD.Towns[town].unemployed);
         screens[3].peopleList.update(GD.Towns[town].people);
      }
      
      public function setScreen(param1:* = null) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         if(param1 != null)
         {
            currScreen = param1;
         }
         GD.lastTownCategory = currScreen;
         _loc3_ = 1;
         while(_loc3_ < screens.length)
         {
            screens[_loc3_].disp.visible = _loc3_ == currScreen;
            _loc3_++;
         }
         categoryMarker.y = buttonPositions[currScreen - 1];
         switch(currScreen)
         {
            case 1:
               updateTownScreen();
               break;
            case 2:
               updateStats();
               if(!Presets.Towns[town].storyOnly)
               {
                  GD.displayTutorial(21);
               }
               break;
            case 3:
               for(_loc3_ in GD.Towns[town].people)
               {
                  _loc2_ = GD.getFactionRelations(0,GD.Towns[town].people[_loc3_].faction);
                  if(!GD.Towns[town].people[_loc3_].wasInPlayersCaravan)
                  {
                     GD.Towns[town].people[_loc3_].morale = Math.max(Math.min(40 + MathFunctions.random(0,20) + _loc2_ / 10,100),1);
                  }
                  GD.Towns[town].people[_loc3_].recalculateSalary(_loc2_);
               }
               if(GD.Towns[town].people.length > 0)
               {
                  GD.displayTutorial(22);
               }
               screens[3].peopleList.update(GD.Towns[town].people);
               break;
            case 4:
               updateIndustries();
               if(!Presets.Towns[town].storyOnly)
               {
                  GD.displayTutorial(23);
               }
         }
      }
      
      public function updateTownScreen() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in screens[1].locations)
         {
            screens[1].locations[_loc1_].blueSign.visible = screens[1].locations[_loc1_].eraseSign.visible = screens[1].locations[_loc1_].fillSign.visible = GD.Towns[town].locations[_loc1_].visible;
         }
         GD.parent.executeDLCFunction(5,"updateChangeNameButton",town);
      }
      
      public function pressMainMenuButton(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXPage().play();
         }
         for(_loc3_ in screens[0].buttons)
         {
            if(screens[0].buttons[_loc3_].disp == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(_loc2_ <= 3)
         {
            setScreen(_loc2_ + 1);
         }
         if(_loc2_ == 4)
         {
            GD.setMode(3);
            stopped = true;
         }
         if(_loc2_ == 5)
         {
            GD.cameFromMode = 4;
            GD.setMode(5);
            stopped = true;
         }
         if(_loc2_ == 6)
         {
            GD.setMode(1);
            stopped = true;
         }
      }
      
      public function clickOnLocationSign(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc3_ in screens[1].locations)
         {
            if(screens[1].locations[_loc3_].fillSign == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         switch(Presets.Towns[town].locations[_loc2_].category)
         {
            case 1:
               if(Presets.Towns[town].locations[_loc2_].subCategory == 5)
               {
                  tradeWindow.setPartner(GD.Towns[town].playersStorage,getLocationSymbol(Presets.Towns[town].locations[_loc2_].symbol),null,null,true,["animals","slaves"],Texts.fetch(GD.Towns[town].locations[_loc2_].name).toUpperCase(),GD.Towns[town].playersStorageSpace,false,Texts.fetch(4170).toUpperCase());
               }
               else if(Presets.Towns[town].locations[_loc2_].subCategory == 6)
               {
                  _loc4_ = [];
                  if(Presets.Towns[town].locations[_loc2_].filters is Array)
                  {
                     _loc4_ = Presets.Towns[town].locations[_loc2_].filters;
                  }
                  tradeWindow.setPartner(GD.Towns[town],getLocationSymbol(Presets.Towns[town].locations[_loc2_].symbol),GD.Towns[town].locations[_loc2_],1,true,_loc4_,"",null,false,Texts.fetch(4170).toUpperCase());
               }
               else
               {
                  tradeWindow.setPartner(GD.Towns[town],getLocationSymbol(Presets.Towns[town].locations[_loc2_].symbol),GD.Towns[town].locations[_loc2_],Presets.Towns[town].locations[_loc2_].subCategory);
               }
               tradeWindow.visible = true;
               if(Presets.Towns[town].locations[_loc2_].subCategory == 1 || Presets.Towns[town].locations[_loc2_].subCategory == 2 || Presets.Towns[town].locations[_loc2_].subCategory == 3)
               {
                  GD.displayTutorial(25);
               }
               break;
            case 2:
               healingFacility.setFacility(GD.Towns[town],GD.Towns[town].locations[_loc2_],getLocationSymbol(Presets.Towns[town].locations[_loc2_].symbol),Presets.Towns[town].locations[_loc2_].subCategory);
               healingFacility.visible = true;
               break;
            case 3:
               GD.setMode(7,GD.Towns[town].locations[_loc2_].character);
               break;
            case 4:
               school.setFacility(Presets.Towns[town].locations[_loc2_].studies,Presets.Towns[town].locations[_loc2_].price,GD.Towns[town].locations[_loc2_],Texts.fetch(Presets.Towns[town].locations[_loc2_].name).toUpperCase() + ", " + GD.Towns[town].name.toUpperCase(),getLocationSymbol(Presets.Towns[town].locations[_loc2_].symbol));
               school.visible = true;
               break;
            case 5:
               policeStation.setFacility(Presets.Towns[town].locations[_loc2_].faction,Presets.Towns[town].locations[_loc2_].reward,Texts.fetch(Presets.Towns[town].locations[_loc2_].name).toUpperCase() + ", " + GD.Towns[town].name.toUpperCase(),getLocationSymbol(Presets.Towns[town].locations[_loc2_].symbol));
               policeStation.visible = true;
               break;
            case 6:
               if(Presets.Towns[town].locations[_loc2_].subCategory >= 1 && Presets.Towns[town].locations[_loc2_].subCategory <= 5)
               {
                  if(!GD.Caravans[0].findCargo(194))
                  {
                     messageDialogue.setText(Texts.fetch(5782,GD.Caravans[0].People[0].gender));
                     messageDialogue.visible = true;
                  }
                  else
                  {
                     GD.Caravans[0].reduceCargo(194,1);
                     GD.Story.transmittersInstalled++;
                     switch(Presets.Towns[town].locations[_loc2_].subCategory)
                     {
                        case 1:
                           GD.Towns[66].locations[3].visible = false;
                           break;
                        case 2:
                           GD.Towns[63].locations[5].visible = false;
                           break;
                        case 3:
                           GD.Towns[12].locations[6].visible = false;
                           break;
                        case 4:
                           GD.Towns[40].locations[5].visible = false;
                           break;
                        case 5:
                           GD.Towns[32].locations[5].visible = false;
                     }
                     setScreen();
                     updateBottomLine();
                  }
               }
               if(Presets.Towns[town].locations[_loc2_].subCategory == 6)
               {
                  if(!GD.Caravans[0].findCargo(208))
                  {
                     messageDialogue.setText(Texts.fetch(6732,GD.Caravans[0].People[0].gender));
                     messageDialogue.visible = true;
                  }
                  else
                  {
                     GD.Towns[5].locations[8].visible = false;
                     setScreen();
                     updateBottomLine();
                     GD.executeMajorEvent(108);
                  }
               }
         }
      }
      
      public function updateBottomLine() : *
      {
         screens[0].bottomLineCapacity.text = Texts.fetch(903).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].totalCargo,0) + "/" + MathFunctions.NumberFormat(GD.Caravans[0].maxCargo,0) + " " + Texts.fetch(12).toUpperCase();
         screens[0].bottomLineMoney.text = Texts.fetch(20).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].money,2);
         var _loc1_:* = GD.makeDate();
         screens[0].bottomLineDate.text = _loc1_.Day2d + "-" + _loc1_.ShortMonthName + "-" + _loc1_.Year2d + " " + _loc1_.Hour2d + ":" + _loc1_.Minute2d;
         var _loc2_:Number = 860 - screens[0].bottomLineCapacity.textWidth - screens[0].bottomLineDate.textWidth;
         screens[0].bottomLineMoney.x = 10 + screens[0].bottomLineCapacity.textWidth + _loc2_ / 2 - screens[0].bottomLineMoney.textWidth / 2;
      }
      
      public function EF(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         if(stopped)
         {
            return;
         }
         var _loc3_:Array = [];
         if(tradeWindow.visible || healingFacility.visible || policeStation.visible || school.visible)
         {
            cursorInfo.visible = false;
            return false;
         }
         if(currScreen == 1)
         {
            _loc2_ = null;
            for(_loc5_ in screens[1].locations)
            {
               if(GD.Towns[town].locations[_loc5_].visible && screens[1].locations[_loc5_].fillSign.hitTestPoint(mouseX,mouseY,true))
               {
                  _loc2_ = _loc5_;
                  break;
               }
            }
            for(_loc5_ in screens[1].locations)
            {
               if(GD.Towns[town].locations[_loc5_].visible)
               {
                  if(_loc5_ == _loc2_)
                  {
                     screens[1].locations[_loc5_].blueSign.alpha += 0.1;
                     if(screens[1].locations[_loc5_].blueSign.alpha > 0.7)
                     {
                        screens[1].locations[_loc5_].blueSign.alpha = 0.7;
                     }
                  }
                  else
                  {
                     screens[1].locations[_loc5_].blueSign.alpha -= 0.1;
                     if(screens[1].locations[_loc5_].blueSign.alpha < 0)
                     {
                        screens[1].locations[_loc5_].blueSign.alpha = 0;
                     }
                  }
               }
            }
            if(_loc2_ != null)
            {
               if(Presets.Towns[town].locations[_loc2_].category == 3 && !Presets.Towns[town].locations[_loc2_].forceName)
               {
                  _loc6_ = Dialogues.characterNames[GD.Towns[town].locations[_loc2_].character];
               }
               else
               {
                  _loc6_ = GD.Towns[town].locations[_loc2_].name;
               }
               _loc3_.push(new EngineText(Texts.fetch(_loc6_).toUpperCase(),3156000,14,"center",10,5,200,20));
            }
         }
         _loc7_ = 0;
         for(_loc5_ in _loc3_)
         {
            if(_loc3_[_loc5_] is EngineText && _loc3_[_loc5_].textWidth + 10 > _loc7_)
            {
               _loc7_ = _loc3_[_loc5_].textWidth + 10;
            }
         }
         for(_loc5_ in _loc3_)
         {
            if(_loc3_[_loc5_] is EngineText)
            {
               _loc3_[_loc5_].width = _loc7_;
            }
         }
         if(_loc3_.length > 0 && cursorInfo.alpha < 1)
         {
            cursorInfo.alpha += 0.2;
         }
         if(_loc3_.length == 0)
         {
            cursorInfo.alpha = 0;
         }
         cursorInfo.visible = _loc3_.length > 0;
         if(cursorInfo.visible)
         {
            while(cursorInfo.numChildren > 0)
            {
               cursorInfo.removeChild(cursorInfo.getChildAt(0));
            }
            _loc7_ = 0;
            _loc4_ = 0;
            for(_loc5_ in _loc3_)
            {
               cursorInfo.addChild(_loc3_[_loc5_]);
               if(_loc3_[_loc5_].x + _loc3_[_loc5_].width > _loc7_)
               {
                  _loc7_ = _loc3_[_loc5_].x + _loc3_[_loc5_].width;
               }
               if(_loc3_[_loc5_].y + _loc3_[_loc5_].height > _loc4_)
               {
                  _loc4_ = _loc3_[_loc5_].y + _loc3_[_loc5_].height;
               }
            }
            cursorInfo.graphics.clear();
            cursorInfo.graphics.lineStyle(2,3156000);
            cursorInfo.graphics.beginFill(16776424);
            cursorInfo.graphics.drawRect(0,0,_loc7_ + 10,_loc4_ + 5);
            cursorInfo.graphics.endFill();
            cursorInfo.x = mouseX + 20;
            cursorInfo.y = mouseY + 10;
            if(cursorInfo.y + _loc4_ + 5 > 490)
            {
               cursorInfo.y = 490 - _loc4_ - 5;
            }
            if(cursorInfo.x + _loc7_ + 5 > 875)
            {
               cursorInfo.x = mouseX - _loc7_ - 10;
            }
         }
      }
      
      private function pressPlayersIndustriesButton(param1:*) : *
      {
         var num:*;
         var townIconMask:*;
         var townIcon:*;
         var townIconInside:*;
         var i:*;
         var maxExpansion:*;
         var e:* = param1;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(i in screens[4].playersIndustriesButtons)
         {
            if(screens[4].playersIndustriesButtons[i].disp == e.target)
            {
               num = i;
               break;
            }
         }
         if(num == 0)
         {
            townIconMask = new ImportedBitmap("town" + town + ".png");
            townIconInside = new Sprite();
            townIconInside.graphics.beginFill(16777215);
            townIconInside.graphics.drawRect(0,0,620,360);
            townIconInside.blendMode = "layer";
            townIconMask.blendMode = "alpha";
            townIconInside.addChild(townIconMask);
            townIconInside.scaleX = townIconInside.scaleY = 0.09;
            townIconInside.x = 0 - townIconInside.width / 2;
            townIconInside.y = 0 - townIconInside.height / 2;
            townIcon = new Sprite();
            townIcon.addChild(townIconInside);
            tradeWindow.setPartner(GD.Towns[town].playersStorage,townIcon,null,null,true,["animals","slaves"],Texts.fetch(1355).replace("@town@",GD.Towns[town].name).toUpperCase(),GD.Towns[town].playersStorageSpace,false,Texts.fetch(4170).toUpperCase());
            tradeWindow.visible = true;
         }
         if(num == 1)
         {
            maxExpansion = Math.floor(GD.Caravans[0].money / GD.Towns[town].storagePrice);
            if(maxExpansion > 0)
            {
               calculator.min = 0;
               calculator.max = maxExpansion;
               calculator.visible = true;
               calculator.onUpdate = function():*
               {
                  if(calculator.value <= calculator.max && calculator.value > 0)
                  {
                     calculator.rightSideText.text = Texts.fetch(1331).replace("@money@",MathFunctions.NumberFormat(GD.Towns[town].storagePrice * calculator.value,0) + " €").toUpperCase();
                  }
                  else
                  {
                     calculator.rightSideText.text = "";
                  }
               };
               calculator.setValue(0);
               calculator.info.text = Texts.fetch(1330).toUpperCase();
               calculator.onDone = function():*
               {
                  confirmDialogue.setText(Texts.fetch(1333).replace("@capacity@",MathFunctions.NumberFormat(GD.Towns[town].playersStorageSpace + calculator.value,0) + " " + Texts.fetch(12)).toUpperCase());
                  confirmDialogue.visible = true;
                  confirmDialogue.onApprove = function():*
                  {
                     var _loc1_:Number = GD.Towns[town].storagePrice * calculator.value;
                     GD.Caravans[0].money -= _loc1_;
                     GD.Towns[town].money += _loc1_;
                     GD.Towns[town].playersStorageSpace += calculator.value;
                     updateIndustries();
                  };
               };
            }
         }
         if(num == 2)
         {
            calculator.min = 0;
            calculator.max = GD.Caravans[0].money;
            calculator.visible = true;
            calculator.setValue(0);
            calculator.info.text = Texts.fetch(1321).toUpperCase();
            calculator.onDone = function():*
            {
               GD.Towns[town].playersMoney += calculator.value;
               GD.Caravans[0].money -= calculator.value;
               updateIndustries();
            };
         }
         if(num == 3)
         {
            if(GD.Towns[town].playersMoney > 0)
            {
               calculator.min = 0;
               calculator.max = GD.Towns[town].playersMoney;
               calculator.visible = true;
               calculator.setValue(0);
               calculator.info.text = Texts.fetch(1322).toUpperCase();
               calculator.onDone = function():*
               {
                  GD.Towns[town].playersMoney -= calculator.value;
                  GD.Caravans[0].money += calculator.value;
                  updateIndustries();
               };
            }
         }
      }
      
      public function getLocationSymbol(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         _loc2_ = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         _loc2_ = undefined;
         _loc4_ = undefined;
         _loc5_ = undefined;
         _loc2_ = undefined;
         _loc4_ = undefined;
         _loc5_ = undefined;
         _loc2_ = undefined;
         _loc4_ = undefined;
         _loc5_ = undefined;
         switch(param1)
         {
            case 1:
               return new filtericonmarket();
            case 2:
               return new filtericonequipmentshop();
            case 3:
               return new filtericoncars();
            case 4:
               return new filtericonfirstaid();
            case 5:
               return new filtericonveterinary();
            case 6:
               return new filtericonmechanicalshop();
            case 7:
               return new filtericonwater();
            case 8:
               return new filtericonperson();
            case 9:
               return new filtericongeneralstore();
            case 10:
               return new filtericonanimals();
            case 11:
               return new filtericonweapons();
            case 12:
               return new filtericoncarts();
            case 13:
               return new filtericonslaves();
            case 14:
               return new filtericonpeople();
            case 15:
               return new filtericonroom();
            case 16:
               return new filtericontent();
            case 17:
               return new filtericonstorage();
            case 18:
               return new filtericonhouse();
            case 19:
               return new filtericonvolunteers();
            case 20:
               return new filtericonbook();
            case 21:
               return new filtericonsheriff();
            case 22:
               _loc3_ = new filtericonprisoners();
               _loc3_.scaleX = _loc3_.scaleY = 0.8;
               _loc2_ = new Sprite();
               _loc2_.addChild(_loc3_);
               return _loc2_;
            case 23:
               _loc2_ = new Sprite();
               _loc2_.addChild(new filtericonbook());
               _loc4_ = new filtericonsheriff();
               _loc4_.scaleX = _loc4_.scaleY = 0.3;
               _loc4_.x = -9.5;
               _loc4_.y = -1;
               _loc2_.addChild(_loc4_);
               _loc5_ = new filtericonsheriff();
               _loc5_.scaleX = _loc5_.scaleY = 0.3;
               _loc5_.x = 9.5;
               _loc5_.y = -1;
               _loc2_.addChild(_loc5_);
               return _loc2_;
            case 24:
               return new filtericonalkubrapolice();
            case 25:
               return new filtericonliberationarmy();
            case 26:
               return new filtericonworkforcemerchants();
            case 27:
               _loc2_ = new Sprite();
               _loc2_.addChild(new filtericonbook());
               _loc4_ = new filtericonmechanicalshop();
               _loc4_.scaleX = _loc4_.scaleY = 0.4;
               _loc4_.x = -9.5;
               _loc4_.y = -1;
               _loc2_.addChild(_loc4_);
               _loc5_ = new filtericonmechanicalshop();
               _loc5_.scaleX = _loc5_.scaleY = 0.4;
               _loc5_.x = 9.5;
               _loc5_.y = -1;
               _loc2_.addChild(_loc5_);
               return _loc2_;
            case 28:
               _loc2_ = new Sprite();
               _loc2_.addChild(new filtericonbook());
               _loc4_ = new filtericonveterinary();
               _loc4_.scaleX = _loc4_.scaleY = 0.4;
               _loc4_.x = -9.5;
               _loc4_.y = -1;
               _loc2_.addChild(_loc4_);
               _loc5_ = new filtericonveterinary();
               _loc5_.scaleX = _loc5_.scaleY = 0.4;
               _loc5_.x = 9.5;
               _loc5_.y = -1;
               _loc2_.addChild(_loc5_);
               return _loc2_;
            case 29:
               return new filtericonkendo();
            case 30:
               return new filtericontransmitter();
            case 31:
               return new filtericonbomb();
            case 32:
               return new filtericonqubba();
            case 33:
               return new filtericonfederation();
            case 34:
               _loc2_ = new Sprite();
               _loc2_.addChild(new filtericonbook());
               _loc4_ = new filtericonfirstaid();
               _loc4_.scaleX = _loc4_.scaleY = 0.4;
               _loc4_.x = -9.5;
               _loc4_.y = -1;
               _loc2_.addChild(_loc4_);
               _loc5_ = new filtericonfirstaid();
               _loc5_.scaleX = _loc5_.scaleY = 0.4;
               _loc5_.x = 9.5;
               _loc5_.y = -1;
               _loc2_.addChild(_loc5_);
               return _loc2_;
            default:
               return;
         }
      }
      
      public function clickOnStatsButton(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc3_ in screens[2].switchButtons)
         {
            if(param1.target == screens[2].switchButtons[_loc3_])
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         statsScreen = _loc2_;
         updateStatsPage();
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         screens[2].prodArea.remove();
         screens[2].prodArea = null;
         screens[3].infoArea.remove();
         screens[3].infoArea = null;
         screens[4].townsIndustriesArea.remove();
         screens[4].townsIndustriesArea = null;
         screens[4].playersIndustriesArea.remove();
         screens[4].playersIndustriesArea = null;
         screens[4].newIndustryArea.remove();
         screens[4].newIndustryArea = null;
         screens[3].peopleList.remove();
         screens[3].peopleList = null;
         recentDataGraph.remove();
         recentDataGraph = null;
         playersGraph.remove();
         playersGraph = null;
         tradeWindow.remove();
         tradeWindow = null;
         for(_loc1_ in screens[0].buttons)
         {
            if(screens[0].buttons[_loc1_].bmpDt is BitmapData)
            {
               screens[0].buttons[_loc1_].bmpDt.dispose();
            }
            screens[0].buttons[_loc1_].disp.buttonMode = false;
            screens[0].buttons[_loc1_].disp.removeEventListener("click",pressMainMenuButton);
         }
         for(_loc1_ in screens[2].switchButtons)
         {
            screens[2].switchButtons[_loc1_].buttonMode = false;
            screens[2].switchButtons[_loc1_].removeEventListener("click",clickOnStatsButton);
         }
         screens[3].hireButton.buttonMode = false;
         screens[3].hireButton.removeEventListener("click",hirePerson);
         _loc1_ = 0;
         while(_loc1_ <= 4)
         {
            while(screens[_loc1_].disp.numChildren > 0)
            {
               screens[_loc1_].disp.removeChildAt(0);
            }
            screens[_loc1_].disp = null;
            screens[_loc1_].maskedBmp.bitmapData.dispose();
            while(screens[_loc1_].alphas.numChildren > 0)
            {
               screens[_loc1_].alphas.removeChildAt(0);
            }
            screens[_loc1_].alphas = null;
            while(screens[_loc1_].erase.numChildren > 0)
            {
               screens[_loc1_].erase.removeChildAt(0);
            }
            screens[_loc1_].erase = null;
            _loc1_++;
         }
         for(_loc1_ in screens[1].locations)
         {
            screens[1].locations[_loc1_].eraseSign.removeChild(screens[1].locations[_loc1_].eraseCut);
            screens[1].locations[_loc1_].eraseCut = null;
            screens[1].locations[_loc1_].eraseSign = null;
            screens[1].locations[_loc1_].signBmData.dispose();
            screens[1].locations[_loc1_].signBmData = null;
            screens[1].locations[_loc1_].blueSign.removeChild(screens[1].locations[_loc1_].signBitmap);
            screens[1].locations[_loc1_].signBitmap = null;
            screens[1].locations[_loc1_].blueSign = null;
            if(screens[1].locations[_loc1_].signBmData is BitmapData)
            {
               screens[1].locations[_loc1_].signBmData.dispose();
            }
            screens[1].locations[_loc1_].fillSign.buttonMode = false;
            screens[1].locations[_loc1_].fillSign.removeEventListener("click",clickOnLocationSign);
         }
         removeEventListener("enterFrame",EF);
         calculator.remove();
         calculator = null;
         healingFacility.remove();
         healingFacility = null;
         policeStation.remove();
         policeStation = null;
         confirmDialogue.remove();
         confirmDialogue = null;
         messageDialogue.remove();
         messageDialogue = null;
         school.remove();
         school = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         GD = null;
      }
   }
}

