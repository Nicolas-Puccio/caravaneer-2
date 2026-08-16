package
{
   import Data.*;
   import Interface.*;
   import IsoEngine.*;
   import com.gskinner.utils.Rndm;
   import com.spikything.utils.MouseWheelTrap;
   import flash.desktop.*;
   import flash.display.*;
   import flash.events.*;
   import flash.external.ExternalInterface;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.net.*;
   import flash.system.*;
   import flash.utils.*;
   import myStuff.*;
   
   public class Caravaneer2 extends MovieClip
   {
      
      public const local:* = true;
      
      public const onlineFromLocal:* = false;
      
      public var onSite:* = true;
      
      public const preInit:* = false;
      
      public var ac:* = null;
      
      public var dlcError:* = 1;
      
      private var lastKeepAlive:*;
      
      private var loadingStage:* = null;
      
      public var DLCList:*;
      
      private var scheduledDLC:*;
      
      private var dlcLoading:* = false;
      
      public var loadedDLC:*;
      
      public var DLCLoaders:*;
      
      private var DLCLoadingScreen:*;
      
      private var pendingLoaders:*;
      
      private var pendingRequests:*;
      
      private var currentPendingLoader:* = 0;
      
      public var GD:*;
      
      public var currentScreen:*;
      
      public var buttonsArray:*;
      
      public var loadData:*;
      
      public var savedData:*;
      
      public var savedConfig:*;
      
      public var loadSaveDialogue:*;
      
      public var setToMode:*;
      
      public var setAutoSave:*;
      
      public var mainScreenDifficulty:* = 1;
      
      public var charSetupScreen:*;
      
      public var theCharacter:*;
      
      public var countdown:* = 0;
      
      public var showTutorial:*;
      
      public var languagesArea:*;
      
      public var languageCheckbox:*;
      
      public var creditsTextLeft:*;
      
      public var creditsTextRight:*;
      
      public var creditsTextCenter:*;
      
      public var creditsMoving:* = false;
      
      public var creditsFadingScreen:*;
      
      public var creditsPauseCounter:*;
      
      public var dlcDialogue:*;
      
      public var switchSFXCross:*;
      
      public var switchMusicCross:*;
      
      public var intro:*;
      
      public var introArea:*;
      
      public var fullScreenOn:*;
      
      public var fullScreenOff:*;
      
      public var fullScreenAllowed:*;
      
      public var atlas:* = "";
      
      public var type:* = 0;
      
      public var cutting:* = false;
      
      internal var radios:*;
      
      public const version:* = "1.1.3";
      
      public const build:* = 210;
      
      public function Caravaneer2()
      {
         var _loc6_:* = undefined;
         var _loc5_:* = undefined;
         DLCList = [];
         scheduledDLC = [];
         loadedDLC = [];
         DLCLoaders = [];
         pendingLoaders = [];
         pendingRequests = [];
         radios = [];
         super();
         Texts.language = 1;
         DLCLoadingScreen = {};
         DLCLoadingScreen.disp = new Sprite();
         DLCLoadingScreen.disp.graphics.beginFill(0,0.5);
         DLCLoadingScreen.disp.graphics.drawRect(0,0,880,495);
         DLCLoadingScreen.textLine1 = new EngineText("",16777215,14,"center",10,223,860,20);
         DLCLoadingScreen.textLine2 = new EngineText("",16777215,14,"center",10,243,860,200,true,true);
         DLCLoadingScreen.disp.addChild(DLCLoadingScreen.textLine1);
         DLCLoadingScreen.disp.addChild(DLCLoadingScreen.textLine2);
         DLCLoadingScreen.closeButton = new Sprite();
         DLCLoadingScreen.closeButton.graphics.beginFill(16777215);
         DLCLoadingScreen.closeButton.graphics.drawRect(0,0,250,30);
         DLCLoadingScreen.closeButtonText = new EngineText("",0,14,"center",5,5,240,20);
         DLCLoadingScreen.closeButton.addChild(DLCLoadingScreen.closeButtonText);
         DLCLoadingScreen.closeButton.x = 315;
         DLCLoadingScreen.closeButton.y = 473;
         DLCLoadingScreen.closeButton.visible = false;
         DLCLoadingScreen.closeButton.mouseChildren = false;
         DLCLoadingScreen.closeButton.buttonMode = true;
         DLCLoadingScreen.closeButton.addEventListener("click",closeDLCLoadingScreen);
         DLCLoadingScreen.disp.addChild(DLCLoadingScreen.closeButton);
         DLCLoadingScreen.disp.visible = false;
         AnimationData.Initiate();
         fullScreenOn = new FullScreenOn();
         fullScreenOn.x = 840;
         fullScreenOn.y = 107;
         fullScreenOn.transform.colorTransform = new ColorTransform(0.05,0.025,0);
         fullScreenOn.alpha = 0.3;
         fullScreenOff = new FullScreenOff();
         fullScreenOff.x = 840;
         fullScreenOff.y = 107;
         fullScreenOff.transform.colorTransform = new ColorTransform(0.05,0.025,0);
         fullScreenOff.alpha = 0.3;
         savedData = SharedObject.getLocal("savedData");
         savedData.addEventListener("netStatus",GameData.netStatusError);
         if(savedData.data.saves == undefined)
         {
            savedData.data.saves = [];
         }
         savedConfig = SharedObject.getLocal("config");
         savedConfig.addEventListener("netStatus",GameData.netStatusError);
         if(savedConfig.data.language != undefined)
         {
            Texts.language = savedConfig.data.language;
         }
         creditsTextLeft = new EngineText("",16777215,14,"right",0,0,432,2000,true,true);
         creditsTextRight = new EngineText("",16777215,14,"left",448,0,432,2000,true,true);
         creditsTextCenter = new EngineText("",16777215,14,"center",0,0,880,2000,true,true);
         var _loc2_:* = [];
         _loc2_[3] = ["Jose Sans (LtHunter)","Shekish-Sergi Garcia Calero","Carlos Besga","Dmitry Zheltobriukhov","Mejj","Milo Gullon (doberwoman.es)"];
         _loc2_[4] = ["Jose Sans (LtHunter)","Nicolás Romanella","Bróucoli Colifato","MartinAriel","Fernando Cornejo","Stephania Soriano S.","Julian Guarguati","Martin Escowich","Sebastian Machlin","Erick Reyes","Joaquin Gonzalez","Plebe13","Pedro Renovato","Jeronimo Otaegui","Kunasgy","Manuel Morón"];
         _loc2_[7] = ["Jose Sans (LtHunter)","Natanael de Oliveira Marafon","Rodrigo Riekes Bruel","Gabriel Radaelli","Enzo Franco","Wilson Ribeiro dos Santos Junior","Guilherme Martins","Matheus Schlottfeldt","Loick","Fernando Tomin","Kasarion","Victor de Freitas","Nicolas Conte Flores","Gustavo Melo","Lucas Aguiar Nascimento Freitas","Yuri Nalin","Fernando Talietta","Válmer M. Munhoz","Daniel Saraiva Motta","Vítor Toguchi","Henrique \"Aloha\" Rodrigues","Jônatas Silvestre","João Gabriel Sampaio Lacerda","Diogo Primo Ferreira","Joel vitor","Dmitry Zheltobriukhov","Lucas Carvalho","Yure Magalhaes","Ramirez Lavor","Rodolfo Antoniazzi","Marco Diovany","Miguel Pinheiro da Costa (Phantom Pollux)","Luiz Iurk","igor","RedDagger","Engels","Victor Juliani","Guilherme","Evandro reis lima","BrasillianReich","Felipe Sanches Pereira"];
         _loc2_[8] = ["Markus B.","Alexander Boden","Denis and Melanie Saric","Jose Sans (LtHunter)","Senfmann","Frederico","Steinhoff","Maximi","Mario G","FrederickFacker","heng","B.Holtappels","Andrea N","Florian Stoessel","Gregor Schwezow","Andreas Köller","Ziegelstein","Engin Sakarya","Georg Prinz","Renppög Leahcim","Knuspergold","poliumx22","Jakob Zombiegod Malek","rakaresa","haudraufklaus","Lewis Philipp","C45U41","Speeedy"];
         _loc2_[10] = ["Valentin Florea","Bogdan6222","Jose Sans (LtHunter)","Lupulescu Daniel-Bogdan","blackhawk808"];
         _loc2_[11] = ["Rafał Listewnik aka Zenla","Kajetan Dziębaj","OczeK666","Jose Sans (LtHunter)","Michał Rak","W3bst3r","G0V3RNM3NT4L - Bryan Cooper","Jacek M (slimjim2 aka Jacmu)","Olgierd Myszor (kingoo1)"];
         _loc2_[13] = ["Arend Kant","Pieter \"nrostn\" Jonckiere","Jose Sans (LtHunter)","Mathias Verberne","Noorloosmodel","Samuel Bootsman","Lawrence Ong \"Lawie\" (Belgium)","Adriaan Marain","P.C. van Hespen","David Franses","Jasper Harms - Virion Ozora","asr","Johannes Yannic Teunis","Jacob Swan","Samuel Boots","","Quintus","Justin Talsma","ppeter0023","Lankhr"];
         _loc2_[15] = ["TDUEnthusiast","maraudersupreme","Stanley Yau ","Low Yik Fu"];
         _loc2_[19] = ["NDark Teng","P.H-Z.Song","Chung Te Hou","[TW]Danny Zhang","Lancer","blackhawk808","Jose Sans (LtHunter)"];
         _loc2_[21] = ["Hary Athineos","Biancoverde","boulbasar","ellizar","George Laos"];
         var _loc3_:* = ["Pimgd","mimb","Jose Sans (LtHunter)","simoni/skaihoj","Doug Mills","Dietrich","Valentin Florea","GGMariani","Kristin Wieler","haudraufklaus","TDUEnthusiast","Closeup93","Dobhran Black","TomJason","Charles Disney","Daniel Mundschau","Alice Smith","igor","Balujun","Rafał Listewnik aka Zenla","Knuspergold","NDark Teng","Arkos","Dogtopia","Alexander Boden","Oliver","Ramirez Lavor","Grizzles","Doyle","David Stagnaro"];
         var _loc4_:* = ["Spencer Rice","Pim van Dongen","Aron Ahmadia","Kevin Arden","Richard Weaver","Erik Schaumann","Neil Wiseman","Cameron Hale","K Wieler","Jørgen Jansen","Sally Bergstedt","Valentin Florea","NDark Teng","Matthew Gooding","Jose Sans Tojo","Arseniy Krasnoff","Michael Huemer","Daniel Mundschau","Alvin Sun","Michael Göppner","Gavin Lane","Peter Vanderhook","Moa Bergsten","Douglas Lum","Paul Lambert","Jonathan Kline","Attila Tibor Rausz","Max Jolley","Andrew Jones","Chris Lannacone","Geno Aabright","Adam Steele","Sébastien Chevreuil","John Twomey","Callum McCadden","Sarah Northway","Tobias Otnes Brattebø","Serge Marc Pommert","Peter Byrnes","Christer Somby","Tobias Grimm","Kyle Woodrich","Steve Kopera","Geir Joramo","Carlos Besga Arcauz","Randy Cohick","Andre Mathieu","Pavle Estrajher","Joseph Dixon","Hanwen Xu","Sawyer Meverden","Nicolas Conte Flores","James King","Lucy Scanlon","Pepijn Uitterhoeve","Ian Willard","Joshua Mahurin","Chandler Apple","John Cleveland","Dietrich Kulze"
         ,"Gunnar Hogberg","Michael Wark","Summer Geraghty","Wesley Foard","Lawrence Ong","Thomas Herzog","Alex Piatek","Olaph Jean","Stephanie Templeman","Sam Evans","Akseli Seppälä","Stephen Daughtry","Tyler Moren","Joseph Parker","Rickard Norlander","Alex dEntremont","David Lee","Bart Raeven","David Charles","Pier Faucher","Anthony Werner","Daniel Babalin","Shawn Doyle","Jordan Rivest","Robert Cantrell","David Stagnaro","Curtis Riley","Semen Novikov","Aubert Florent","Brian Amonette","Joshua Konantz","Edward Vul","Muhammad Maher Mohamad","Lars Sode","Franky Nicholson","Jacob Smith","Sahil Koul","Zach Ellashek","Ka Mok","Jacob Snowden","Alice Smith","Jérémy Outters","Vincent Tronchet","Mike Nettles","Fernando Henrique Tomin Santos","David Celozzi","Zacharias Charmpalis","Jared Rosenberg","Kaelin Bennett","Bernard","Evan Colson","Joseph Moen","Josiah Thompson","Glen Patterson II","Zack McCrane","Alexander Boden","Christopher Myers","Luke Olsson","Christopher Espinosa","Joseph Lee","Shigemi Hazuki"
         ,"Edward M Lazzarin","Oskari Mahlio","Daniel Shupe","Azriel Schloss","Dont Panic Tees","Gagero Roman Daniel","David Vincent","Nicholas Diagostino","Doug Mills","Raymond Woods","Wen Zhang","David Levy","Justin Talsma","Alma Hunt","Christopher Luck","Phil Desrosiers","Samuel Blake","Sky Brierley","Mike Mansell","Jamie Robinson","Lewys Stocks","Janosch Braun","Alex Lopez","Mathieu Sergerie","Simon Kaihøj","JUNG SHENG LIN","Darrin Daugherty","Niki Kuhar","Ian Barnhart","P Soon","Ryan Maynard","Chadwick Robbins","Monroe Morris","Oliver Mitchell","David Kleimann","André Batista","Richard Gremillion","Tristan Rogers","Brad Santos","Brett Ewald","Carwyn James Salter","John Ford","Christian Roberts","Nicolas Heggerud","Benjamin Lamb","Dimitar Ivanov","Patrick Rice","Alex Sandul","Alex Elias","Gabriel Clymer","Aaron Nix","Paul Silveria","Jacob Entzminger","Ketch Ramser","Buck Barwick","Eden Kapcan","Brandon Vail","Kristan Heisken","Mikkel Nørgaard","Stacie Ross","Tim Oberbauer","Matthew Rigby","Tristan Kamp"
         ,"Renée van Bussel","Yuri Nalin","Sam Custance","Nate Richards","Michal Urban","Katelynn Taylor","Iain Loasby","Jakob Malek","Karl Cornett","Aaron Slover","Benjamin Rousseau","Albert Masclans Pujol","Eric Traub","Dustin Wehrle","Lloyd Herbert","Callum Sanderson","Claudia Lo","Kürat ÖZER","Rene Corado","Buck Barwick","Maxime Lesourd","Justin Biebow","Peter Siddons","Ryan Morrison","Mark Simpson","Adrian Vargas","Ethan Morgan","Jasper Harms","Jeremy Pickering","Dobhran Black","Jonathan Hughes","Alexander Morrison","Joshua Fields","James Stoner","Robin Macdonnell","Eric Reitz","Roger Duarte","Nissim Siles","Fabio Alexandre Campos Tisovec","Daniel Holm Hansen","Lucas Gellerth Famelli","Cristian Vittini","Dan Hampton","David Mayer","Izaak Baltic","Andrew Strange","Daniel Avello Gajardo","Mark Talabere","Samuel Sailer","Charles ODay","Romain Le Duc","Gerrit Beerda","Florian Stoessel","Caleb Croasdell","WRECOGNITION","Paulo Henrique de Brito Ruiz","John Glue","Hardi Noobel","Alexander Hoffman"
         ,"Josh Gunderson","Martin Nygren","Mathieu Westphal","Matthew Bowley","Matthew Jones","Ronan Haughey","Torn Saetern","John ONeal","Patrick Moody","Dan Chrostowski","Josh Smith","Jordan Miranda-Pivac","Travis Bailey","J Smart","Mohamed Al-Hajri","Teo Cherici","Elisa Duro","Kalen Evans","Laurent Mazeau","Patrick Mahan","Nicholas Fulcher","Brian Hicks","Ryan Hickey","Elliott Dow","MatSu Media","Ashley DeVault","Timothy Chapman","Ismail Ali","Karim Magdy Mahmoud","Miguel Ochoa","Ana Rocha","Marko Aleksic","Pim Cornelis van Hespen","William Small","Timothy Keele","Jack Meuwissen","Martin Ferencic","Sergey Burykin","Andrea Neufang","Truman Whitaker","William Klauzowski","Hisham K","Markkus Grüntal","Andrew Thorsen","Charles Disney","Jacob Glømmen Bostad","Leonard Araz","Charles Green","Jason Loveridge","Tyler Robbins","Luke Groeneveld","Daulton Sink","Jacob Marks","Christopher Wester","Markus Manning","Nathan Richards","Kliment Todosov","Oliver O\'Brien","Lau Yan Ki","Steve Dobbs","Shawn Conner"
         ,"Sean Kelly","Ignacio Menéndez Granda"];
         creditsTextCenter.text = "\n\n\n\n" + Texts.fetch(6886) + ":\n\n\n\n\n\n\n\n\n\n\n" + Texts.fetch(6888) + ":\n";
         creditsTextLeft.text = Texts.fetch(6885) + ":\n\n\n\n\n\n\"" + Texts.fetch(2077) + "\", \"" + Texts.fetch(4998) + "\":\n\"" + Texts.fetch(1985) + "\":\n\n\n\n" + Texts.fetch(6887) + ":\n\n\n\n\n\n";
         creditsTextRight.text = "Dmitry Zheltobriukhov\n\n\n\n\n\nEmilio Pacheco\nJhon Shockley\n\n\n\nJohnny Rinaldo\n\n\n\n\n\n";
         for(_loc5_ in GameData.languages)
         {
            if(_loc5_ != 0 && GameData.languages[_loc5_].enabled)
            {
               creditsTextLeft.text += GameData.languages[_loc5_].name + ":";
               if(_loc2_[GameData.languages[_loc5_].ind] is Array)
               {
                  for(_loc6_ in _loc2_[GameData.languages[_loc5_].ind])
                  {
                     creditsTextCenter.text += "\n";
                     creditsTextLeft.text += "\n";
                     creditsTextRight.text += _loc2_[GameData.languages[_loc5_].ind][_loc6_] + "\n";
                  }
               }
               creditsTextCenter.text += "\n\n\n";
               creditsTextLeft.text += "\n\n\n";
               creditsTextRight.text += "\n\n\n";
            }
         }
         creditsTextCenter.text += Texts.fetch(6890) + ":\n\n";
         creditsTextLeft.text += "\n\n";
         creditsTextRight.text += "\n\n";
         for(_loc5_ in _loc3_)
         {
            creditsTextCenter.text += _loc3_[_loc5_] + "\n";
            creditsTextLeft.text += "\n";
            creditsTextRight.text += "\n";
         }
         creditsTextCenter.text += "\n\n";
         creditsTextLeft.text += "\n\n";
         creditsTextRight.text += "\n\n";
         creditsTextCenter.text += Texts.fetch(6889) + ":\n\n";
         creditsTextLeft.text += "\n\n\n";
         creditsTextRight.text += "\n\n\n";
         for(_loc5_ in _loc4_)
         {
            creditsTextCenter.text += _loc4_[_loc5_] + "\n";
            creditsTextLeft.text += "\n";
            creditsTextRight.text += "\n";
         }
         creditsTextCenter.text += "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
         creditsTextLeft.text += "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
         creditsTextRight.text += "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
         creditsTextCenter.text += Texts.fetch(6891);
         creditsTextLeft.height = creditsTextLeft.textHeight + 10;
         creditsTextRight.height = creditsTextRight.textHeight + 10;
         creditsTextCenter.height = creditsTextCenter.textHeight + 10;
         creditsFadingScreen = new Sprite();
         creditsFadingScreen.graphics.beginFill(0);
         creditsFadingScreen.graphics.drawRect(0,0,880,495);
         creditsFadingScreen.visible = false;
         var _loc1_:Number = 0.0025;
         addEventListener("addedToStage",stageAdd);
         addEventListener("enterFrame",EF);
      }
      
      public function stageAdd(param1:*) : *
      {
         MouseWheelTrap.setup(stage);
         requestDLCList();
         //-disable fullscreen
         fullScreenAllowed = false
         stage.scaleMode = "showAll";
         if(fullScreenAllowed)
         {
            stage.align = "top";
            stage.addEventListener("keyDown",airKeyDown);
            stage.addEventListener("fullScreen",updateFullScreenSymbol);
            setFullScreen();
         }
         if(savedConfig.data.language != undefined)
         {
            setScreen(2);
         }
         else
         {
            setScreen(1);
         }
      }
      
      public function setScreen(param1:*) : *
      {
         var j:*;
         var n:*;
         var i:*;
         var BG:*;
         var butt:*;
         var buttText:*;
         var txt:*;
         var bg:*;
         var title:*;
         var areaFrame:*;
         var showUnfinishedText:*;
         var proceedButt:*;
         var proceedButtText:*;
         var versionText:*;
         var FG:*;
         var maskedBmp:*;
         var alphas:*;
         var clearBmp:*;
         var erase:*;
         var titleScreenButtonContent:*;
         var titleScreenButtons:*;
         var titleScreenButtonTexts:*;
         var titleScreenButtonsBrighteners:*;
         var switchSFX:*;
         var switchMusic:*;
         var switchSFXHitArea:*;
         var switchMusicHitArea:*;
         var fullScreenHitArea:*;
         var fullScreenSwitch:*;
         var autoSaveCheckBox:*;
         var checkBox:*;
         var backButton:*;
         var startButton:*;
         var introScr:*;
         var introText:*;
         var introAreaFrame:*;
         var proceedButton:*;
         var proceedButtonText:*;
         var creditsScreen:*;
         var creditsMask:*;
         var num:* = param1;
         if(num != 4 && GD is GameData)
         {
            GD.remove();
            GD = null;
         }
         if(num != 6 && num != 7)
         {
            charSetupScreen = null;
         }
         if(currentScreen is DisplayObject)
         {
            while(currentScreen.numChildren > 0)
            {
               currentScreen.removeChildAt(0);
            }
            removeChild(currentScreen);
         }
         currentScreen = new Sprite();
         switch(num)
         {
            case 0:
               BG = new Sprite();
               BG.graphics.beginFill(1514016);
               BG.graphics.drawRect(0,0,880,495);
               addChild(BG);
               butt = new Sprite();
               butt.graphics.beginFill(10333125);
               butt.graphics.drawRect(0,0,200,30);
               buttText = new EngineText("PROCEED",1514016,16,"center",10,4,180,20);
               butt.addChild(buttText);
               butt.x = 340;
               butt.y = 425;
               currentScreen.addChild(butt);
               butt.buttonMode = true;
               butt.mouseChildren = false;
               butt.addEventListener("click",function(param1:* = null):*
               {
                  if(GameData.soundFXOn)
                  {
                     new SFXClick().play();
                  }
                  setScreen(11);
               });
               txt = new EngineText("Loading Complete",10333125,16,"center",60,202,780,22,true,true);
               currentScreen.addChild(txt);
               break;
            case 1:
               bg = new ImportedBitmap("TownBG.jpg");
               currentScreen.addChild(bg);
               title = new EngineText("PLEASE SELECT YOUR LANGUAGE",3156000,20,"center",10,30,860,30);
               currentScreen.addChild(title);
               areaFrame = new Sprite();
               areaFrame.graphics.lineStyle(1,3156000);
               areaFrame.graphics.drawRect(0,0,600,350);
               areaFrame.x = 140;
               areaFrame.y = 80;
               currentScreen.addChild(areaFrame);
               languagesArea = new ScrollableArea(590,350,590,350,true,false,false,3,10);
               languagesArea.x = 140;
               languagesArea.y = 80;
               currentScreen.addChild(languagesArea);
               updateLanguageArea();
               languageCheckbox = new Switch(5,false,switchLanguageChackbox,switchLanguageChackbox,null,null,10,10,false);
               languageCheckbox.x = 20;
               languageCheckbox.y = 460;
               currentScreen.addChild(languageCheckbox);
               showUnfinishedText = new EngineText("Show unfinished languages",0,12,"left",35,456,300,18);
               currentScreen.addChild(showUnfinishedText);
               proceedButt = new Sprite();
               proceedButt.graphics.beginFill(3156000);
               proceedButt.graphics.drawRect(0,0,200,30);
               proceedButtText = new EngineText("PROCEED",0,16,"center",10,4,180,20);
               proceedButt.blendMode = "layer";
               proceedButtText.blendMode = "erase";
               proceedButt.addChild(proceedButtText);
               proceedButt.x = 340;
               proceedButt.y = 450;
               proceedButt.buttonMode = true;
               proceedButt.mouseChildren = false;
               proceedButt.addEventListener("click",function(param1:* = null):*
               {
                  if(GameData.soundFXOn)
                  {
                     new SFXClick().play();
                  }
                  savedConfig.data.language = Texts.language;
                  try
                  {
                     savedConfig.flush();
                  }
                  catch(e:Error)
                  {
                     trace("flush error");
                  }
                  languagesArea.remove();
                  setScreen(2);
               });
               currentScreen.addChild(proceedButt);
               break;
            case 2:
               System.pauseForGCIfCollectionImminent(1);
               System.gc();
               DLCLoadingScreen.closeButtonText.text = Texts.fetch(1181).toUpperCase();
               theCharacter = null;
               bg = new ImportedBitmap("TitleScreen.jpg");
               currentScreen.addChild(bg);
               versionText = new EngineText(Texts.fetch(1420).toLowerCase() + " " + "1.1.3",3156000,12,"center",90,20,490,20);
               currentScreen.addChild(versionText);
               FG = new Sprite();
               maskedBmp = new ImportedBitmap("InterfaceForeground.png");
               maskedBmp.transform.colorTransform = new ColorTransform(0.28,0.29,0.2);
               FG.addChild(maskedBmp);
               FG.blendMode = "layer";
               alphas = new Sprite();
               alphas.blendMode = "alpha";
               clearBmp = new Sprite();
               clearBmp.graphics.beginFill(0,0.01);
               clearBmp.graphics.drawRect(0,0,880,495);
               alphas.addChild(clearBmp);
               FG.addChild(alphas);
               erase = new Sprite();
               erase.blendMode = "erase";
               FG.addChild(erase);
               erase.mouseEnabled = false;
               erase.mouseChildren = false;
               currentScreen.addChild(FG);
               titleScreenButtonContent = [{
                  "text":Texts.fetch(6877,null,23).toUpperCase(),
                  "onClick":function():*
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXClick().play();
                     }
                     setToMode = 1;
                     setAutoSave = false;
                     setScreen(6);
                  }
               },{
                  "text":Texts.fetch(1434,null,23).toUpperCase(),
                  "onClick":function():*
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXClick().play();
                     }
                     loadSaveDialogue.visible = true;
                  }
               },{
                  "text":Texts.fetch(6878,null,23).toUpperCase(),
                  "onClick":function():*
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXClick().play();
                     }
                     dlcDialogue.resetDLCList();
                     dlcDialogue.visible = true;
                  }
               },{
                  "text":Texts.fetch(6879,null,23).toUpperCase(),
                  "onClick":function():*
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXClick().play();
                     }
                     setScreen(10);
                  }
               },{
                  "text":Texts.fetch(6880,null,23).toUpperCase(),
                  "onClick":function():*
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXClick().play();
                     }
                     navigateToURL(new URLRequest("http://www.gamesofhonor.com/caravaneer_project/instructions/instructions.html"),"_blank");
                  }
               },{
                  "text":"CHANGE LANGUAGE".toUpperCase(),
                  "onClick":function():*
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXClick().play();
                     }
                     setScreen(1);
                  }
               },{
                  "text":Texts.fetch(1344,null,23).toUpperCase(),
                  "onClick":function():*
                  {
                     if(GameData.soundFXOn)
                     {
                        new SFXClick().play();
                     }
                     NativeApplication.nativeApplication.exit();
                  }
               }];
               titleScreenButtons = [];
               titleScreenButtonTexts = [];
               titleScreenButtonsBrighteners = [];
               for(i in titleScreenButtonContent)
               {
                  titleScreenButtons[i] = new Sprite();
                  titleScreenButtons[i].graphics.beginFill(16711680);
                  titleScreenButtons[i].graphics.drawRect(0,0,240,30);
                  titleScreenButtons[i].x = 20;
                  titleScreenButtons[i].y = 167 + i * 41;
                  titleScreenButtons[i].buttonMode = true;
                  titleScreenButtons[i].addEventListener("click",titleScreenButtonContent[i].onClick);
                  alphas.addChild(titleScreenButtons[i]);
                  titleScreenButtonTexts[i] = new Sprite();
                  titleScreenButtonTexts[i].addChild(new EngineText(titleScreenButtonContent[i].text,255,16,"center",0,0,230,22));
                  titleScreenButtonTexts[i].mouseEnabled = false;
                  titleScreenButtonTexts[i].x = 25;
                  titleScreenButtonTexts[i].y = 171 + i * 41;
                  erase.addChild(titleScreenButtonTexts[i]);
                  titleScreenButtonsBrighteners[i] = new Sprite();
                  titleScreenButtonsBrighteners[i].graphics.beginFill(16777215,0.06 * i);
                  titleScreenButtonsBrighteners[i].graphics.drawRect(0,0,240,30);
                  titleScreenButtonsBrighteners[i].x = 20;
                  titleScreenButtonsBrighteners[i].y = 167 + i * 41;
                  currentScreen.addChildAt(titleScreenButtonsBrighteners[i],currentScreen.getChildIndex(FG));
               }
               switchSFX = new SoundSwitchSFX();
               switchSFX.x = 840;
               switchSFX.y = 45;
               switchSFX.transform.colorTransform = new ColorTransform(0.05,0.025,0);
               switchSFX.alpha = 0.3;
               currentScreen.addChild(switchSFX);
               switchMusic = new SoundSwitchMusic();
               switchMusic.x = 840;
               switchMusic.y = 75;
               switchMusic.scaleX = switchMusic.scaleY = switchSFX.scaleX = switchSFX.scaleY = 0.45;
               switchMusic.transform.colorTransform = new ColorTransform(0.05,0.025,0);
               switchMusic.alpha = 0.3;
               currentScreen.addChild(switchMusic);
               switchSFXCross = new Sprite();
               switchSFXCross.graphics.lineStyle(1.5,0);
               switchSFXCross.graphics.moveTo(-3,-3);
               switchSFXCross.graphics.lineTo(3,3);
               switchSFXCross.graphics.moveTo(3,-3);
               switchSFXCross.graphics.lineTo(-3,3);
               switchSFXCross.x = 858;
               switchSFXCross.y = 45;
               switchSFXCross.visible = !GameData.soundFXOn;
               switchSFXCross.transform.colorTransform = new ColorTransform(0.05,0.025,0);
               switchSFXCross.alpha = 0.3;
               currentScreen.addChild(switchSFXCross);
               switchMusicCross = new Sprite();
               switchMusicCross.graphics.lineStyle(1.5,0);
               switchMusicCross.graphics.moveTo(-3,-3);
               switchMusicCross.graphics.lineTo(3,3);
               switchMusicCross.graphics.moveTo(3,-3);
               switchMusicCross.graphics.lineTo(-3,3);
               switchMusicCross.x = 858;
               switchMusicCross.y = 75;
               switchMusicCross.visible = !GameData.musicOn;
               switchMusicCross.transform.colorTransform = new ColorTransform(0.05,0.025,0);
               switchMusicCross.alpha = 0.3;
               currentScreen.addChild(switchMusicCross);
               switchSFXHitArea = new Sprite();
               switchSFXHitArea.graphics.beginFill(16711680);
               switchSFXHitArea.graphics.drawRect(-30,-30,60,60);
               switchSFXHitArea.visible = false;
               switchSFX.buttonMode = true;
               switchSFX.addChild(switchSFXHitArea);
               switchSFX.hitArea = switchSFXHitArea;
               switchSFX.addEventListener("click",clickSFXSwitch);
               switchMusicHitArea = new Sprite();
               switchMusicHitArea.graphics.beginFill(16711680);
               switchMusicHitArea.graphics.drawRect(-30,-30,60,60);
               switchMusicHitArea.visible = false;
               switchMusic.buttonMode = true;
               switchMusic.addChild(switchMusicHitArea);
               switchMusic.hitArea = switchMusicHitArea;
               switchMusic.addEventListener("click",clickMusicSwitch);
               if(fullScreenAllowed)
               {
                  currentScreen.addChild(fullScreenOn);
                  currentScreen.addChild(fullScreenOff);
                  updateFullScreenSymbol();
                  fullScreenOn.scaleX = fullScreenOn.scaleY = fullScreenOff.scaleX = fullScreenOff.scaleY = 0.45;
                  fullScreenHitArea = new Sprite();
                  fullScreenHitArea.graphics.beginFill(16711680);
                  fullScreenHitArea.graphics.drawRect(-15,-15,30,30);
                  fullScreenHitArea.visible = false;
                  fullScreenSwitch = new Sprite();
                  fullScreenSwitch.buttonMode = true;
                  fullScreenSwitch.addChild(fullScreenHitArea);
                  fullScreenSwitch.hitArea = fullScreenHitArea;
                  fullScreenSwitch.x = 840;
                  fullScreenSwitch.y = 107;
                  currentScreen.addChild(fullScreenSwitch);
                  fullScreenSwitch.addEventListener("click",switchFullScreen);
               }
               loadSaveDialogue = new LoadSaveDialogue(null,this,false);
               currentScreen.addChild(loadSaveDialogue);
               loadSaveDialogue.visible = false;
               dlcDialogue = new DLCDialogue(this);
               currentScreen.addChild(dlcDialogue);
               dlcDialogue.visible = false;
               currentScreen.addChild(DLCLoadingScreen.disp);
               break;
            case 4:
               startNewGame(setToMode);
               break;
            case 5:
               bg = new Sprite();
               bg.graphics.beginFill(0);
               bg.graphics.drawRect(0,0,880,495);
               currentScreen.addChild(bg);
               currentScreen.addChild(new EngineText(Texts.fetch(770).toUpperCase(),16777215,18,"center",0,235,880,24));
               GD = new GameData(currentScreen,this,1);
               loadingStage = 0;
               break;
            case 6:
               charSetupScreen = new CharacterSetupScreen(theCharacter);
               currentScreen.addChild(charSetupScreen);
               charSetupScreen.onDone = function():*
               {
                  setScreen(7);
               };
               charSetupScreen.onCancel = function():*
               {
                  setScreen(2);
               };
               break;
            case 7:
               bg = new ImportedBitmap("TownBG.jpg");
               currentScreen.addChild(bg);
               theCharacter = charSetupScreen.theCharacter;
               currentScreen.addChild(new EngineText(Texts.fetch(6810).toUpperCase() + ":",3156000,18,"center",0,225,880,20));
               i = 0;
               while(i <= 3)
               {
                  radios[i] = {};
                  radios[i].disp = new Sprite();
                  radios[i].disp.graphics.beginFill(16777215);
                  radios[i].disp.graphics.lineStyle(2,6314064);
                  radios[i].disp.graphics.drawCircle(0,0,10);
                  radios[i].disp.x = 390;
                  if(i < 2)
                  {
                     radios[i].disp.y = 295 + i * 30;
                  }
                  else
                  {
                     radios[i].disp.y = 80 + (i - 2) * 30;
                  }
                  radios[i].circle = new Sprite();
                  radios[i].circle.graphics.beginFill(6314064);
                  radios[i].circle.graphics.drawCircle(0,0,5);
                  radios[i].disp.addChild(radios[i].circle);
                  radios[i].circle.visible = i == 0 && mainScreenDifficulty == 1 || i == 1 && mainScreenDifficulty == 2 || i == 2;
                  radios[i].disp.buttonMode = true;
                  radios[i].disp.mouseChildren = false;
                  radios[i].disp.addEventListener("click",pressDifficulty);
                  currentScreen.addChild(radios[i].disp);
                  i++;
               }
               currentScreen.addChild(new EngineText(Texts.fetch(1606).toUpperCase(),3156000,16,"left",410,70,200,20));
               currentScreen.addChild(new EngineText(Texts.fetch(7103).toUpperCase(),3156000,16,"left",410,100,200,20));
               autoSaveCheckBox = new Switch(5,setAutoSave,switchAutoSave,switchAutoSave,null,null,20,20,false);
               autoSaveCheckBox.x = 380;
               autoSaveCheckBox.y = 160;
               currentScreen.addChild(autoSaveCheckBox);
               currentScreen.addChild(new EngineText(Texts.fetch(6802).toUpperCase(),3156000,16,"left",410,160,200,20));
               currentScreen.addChild(new EngineText(Texts.fetch(30).toUpperCase(),3156000,16,"left",410,285,200,20));
               currentScreen.addChild(new EngineText(Texts.fetch(2825).toUpperCase(),3156000,16,"left",410,315,200,20));
               currentScreen.addChild(new EngineText(Texts.fetch(6837).toUpperCase(),3156000,16,"left",410,375,200,20));
               showTutorial = !savedConfig.data.displayedTutorial;
               checkBox = new Switch(5,showTutorial,switchShowTutorial,switchShowTutorial,null,null,20,20,false);
               checkBox.x = 380;
               checkBox.y = 375;
               currentScreen.addChild(checkBox);
               backButton = new Button(2,function():*
               {
                  setScreen(6);
               },Texts.fetch(6811).toUpperCase());
               backButton.x = 227;
               backButton.y = 450;
               currentScreen.addChild(backButton);
               startButton = new Button(2,function():*
               {
                  setScreen(8);
               },Texts.fetch(6812).toUpperCase());
               startButton.x = 447;
               startButton.y = 450;
               currentScreen.addChild(startButton);
               break;
            case 8:
               savedConfig.data.displayedTutorial = true;
               try
               {
                  savedConfig.flush();
               }
               catch(e:Error)
               {
                  trace("flush error");
               }
               if(setToMode == 1)
               {
                  FG = new Sprite();
                  maskedBmp = new ImportedBitmap("InterfaceForeground.png");
                  maskedBmp.transform.colorTransform = new ColorTransform(0.1,0.075,0.05);
                  FG.addChild(maskedBmp);
                  FG.blendMode = "layer";
                  alphas = new Sprite();
                  alphas.blendMode = "alpha";
                  clearBmp = new Sprite();
                  clearBmp.graphics.beginFill(0,0.01);
                  clearBmp.graphics.drawRect(0,0,880,495);
                  alphas.addChild(clearBmp);
                  FG.addChild(alphas);
                  introScr = new Sprite();
                  currentScreen.addChild(new ImportedBitmap("StoryStartBG.jpg"));
                  introText = new EngineText(Texts.fetch(1608,theCharacter.gender),0,16,"center",30,40,820,400,true,true);
                  introScr.addChild(introText);
                  introScr.addChild(new EngineText(Texts.fetch(6876,theCharacter.gender),0,16,"center",40,460,800,400));
                  introText.y = 220 - introText.textHeight / 2;
                  currentScreen.addChild(FG);
                  alphas.addChild(introScr);
               }
               else
               {
                  bg = new Sprite();
                  bg.graphics.beginFill(0);
                  bg.graphics.drawRect(0,0,880,495);
                  currentScreen.addChild(bg);
                  currentScreen.addChild(new EngineText(Texts.fetch(770).toUpperCase(),16777215,18,"center",0,235,880,24));
               }
               countdown = 2;
               break;
            case 9:
               introScr = new Sprite();
               FG = new Sprite();
               maskedBmp = new ImportedBitmap("InterfaceForeground.png");
               maskedBmp.transform.colorTransform = new ColorTransform(0.1,0.075,0.05);
               FG.addChild(maskedBmp);
               FG.blendMode = "layer";
               alphas = new Sprite();
               alphas.blendMode = "alpha";
               clearBmp = new Sprite();
               clearBmp.graphics.beginFill(0,0.01);
               clearBmp.graphics.drawRect(0,0,880,495);
               alphas.addChild(clearBmp);
               FG.addChild(alphas);
               erase = new Sprite();
               erase.blendMode = "erase";
               FG.addChild(erase);
               erase.mouseEnabled = false;
               erase.mouseChildren = false;
               currentScreen.addChild(new ImportedBitmap("StoryStartBG.jpg"));
               introArea = new ScrollableArea(830,420,830,420,true,false,false,3,10);
               introScr.addChild(introArea);
               introArea.x = 20;
               introArea.y = 20;
               introAreaFrame = new Sprite();
               introAreaFrame.graphics.lineStyle(0.5,0);
               introAreaFrame.graphics.drawRect(19,19,842,422);
               introScr.addChild(introAreaFrame);
               introText = new EngineText(Texts.fetch(1432),0,15,"left",10,10,810,2000,true,true);
               introText.height = introText.textHeight + 20;
               introArea.addContent(introText);
               proceedButton = new Sprite();
               proceedButton.graphics.beginFill(0);
               proceedButton.graphics.drawRect(0,0,200,30);
               proceedButton.x = 340;
               proceedButton.y = 455;
               proceedButton.buttonMode = true;
               proceedButton.addEventListener("click",function():*
               {
                  if(GameData.soundFXOn)
                  {
                     new SFXClick().play();
                  }
                  introArea.remove();
                  setScreen(2);
               });
               introScr.addChild(proceedButton);
               proceedButtonText = new EngineText(Texts.fetch(6838).toUpperCase(),16777215,16,"center",340,459,200,22);
               erase.addChild(proceedButtonText);
               currentScreen.addChild(FG);
               alphas.addChild(introScr);
               break;
            case 10:
               creditsScreen = new Sprite();
               creditsScreen.graphics.beginFill(0);
               creditsScreen.graphics.drawRect(0,0,880,495);
               creditsScreen.addChild(creditsTextLeft);
               creditsScreen.addChild(creditsTextRight);
               creditsScreen.addChild(creditsTextCenter);
               creditsTextLeft.y = 495;
               creditsTextRight.y = 495;
               creditsTextCenter.y = 495;
               creditsMoving = true;
               creditsScreen.buttonMode = true;
               creditsScreen.mouseChildren = false;
               creditsScreen.addEventListener("click",function(param1:* = null):*
               {
                  if(GameData.soundFXOn)
                  {
                     new SFXClick().play();
                  }
                  creditsMoving = false;
                  setScreen(2);
                  creditsFadingScreen.visible = false;
               });
               creditsFadingScreen.visible = false;
               creditsScreen.addChild(creditsFadingScreen);
               creditsMask = new Sprite();
               creditsMask.graphics.beginFill(16711680);
               creditsMask.graphics.drawRect(0,0,880,495);
               currentScreen.addChild(creditsMask);
               creditsScreen.mask = creditsMask;
               currentScreen.addChild(creditsScreen);
               break;
            case 11:
               BG = new Sprite();
               BG.graphics.beginFill(0);
               BG.graphics.drawRect(0,0,880,495);
               currentScreen.addChild(BG);
               true;
               intro = new IntroVideo();
               intro.x = 440;
               intro.y = 247;
               intro.scaleX = 2;
               intro.scaleY = 2;
               intro.buttonMode = true;
               intro.mouseChildren = false;
               intro.addEventListener("click",function():*
               {
                  if(GameData.soundFXOn)
                  {
                     new SFXClick().play();
                  }
                  navigateToURL(new URLRequest("http://caravaneer.gamesofhonor.com"),"_blank");
               });
               currentScreen.addChild(intro);
               break;
            case 12:
               bg = new Sprite();
               bg.graphics.beginFill(0);
               bg.graphics.drawRect(0,0,880,495);
               currentScreen.addChild(bg);
               title = new EngineText("INITIALIZING. PLEASE WAIT.",16777215,20,"center",10,208,860,70);
               currentScreen.addChild(title);
         }
         addChild(currentScreen);
      }
      
      private function pressDifficulty(param1:* = null) : *
      {
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         if(param1.target == radios[0].disp)
         {
            mainScreenDifficulty = 1;
         }
         if(param1.target == radios[1].disp)
         {
            mainScreenDifficulty = 2;
         }
         if(param1.target == radios[2].disp)
         {
            setToMode = 1;
         }
         if(param1.target == radios[3].disp)
         {
            setToMode = 2;
         }
         radios[0].circle.visible = mainScreenDifficulty == 1;
         radios[1].circle.visible = mainScreenDifficulty == 2;
         radios[2].circle.visible = setToMode == 1;
         radios[3].circle.visible = setToMode == 2;
      }
      
      private function pressLanguage(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc2_ in buttonsArray)
         {
            if(buttonsArray[_loc2_].disp == param1.target)
            {
               Texts.language = buttonsArray[_loc2_].ind;
               break;
            }
         }
         for(_loc2_ in buttonsArray)
         {
            buttonsArray[_loc2_].txt.visible = buttonsArray[_loc2_].ind != Texts.language;
            buttonsArray[_loc2_].inverse.visible = buttonsArray[_loc2_].ind == Texts.language;
         }
      }
      
      public function startNewGame(param1:* = 1) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         GD = new GameData(currentScreen,this,null,param1 == 1,mainScreenDifficulty,theCharacter);
         executeDLCOnInit();
         GD.seed = Rndm.seed = Math.random() * 16777215;
         GD.setLocationsVisibility();
         GD.showTutorial = showTutorial;
         GD.autoSave = setAutoSave;
         if(!GD.storyMode)
         {
            GD.Caravans[0].x = -12600;
            GD.Caravans[0].y = 3700;
            GD.Towns[23].locations[2].assortment.push({
               "item":166,
               "amount":0.3
            });
            GD.Towns[23].locations[2].assortment.push({
               "item":229,
               "amount":0.5
            });
            GD.Towns[27].locations[1].assortment.push({
               "item":166,
               "amount":0.5
            });
            GD.Towns[27].locations[1].assortment.push({
               "item":229,
               "amount":0.5
            });
            GD.Towns[36].locations[3].assortment.push({
               "item":206,
               "amount":0.5
            });
            GD.Towns[40].locations[2].assortment.push({
               "item":206,
               "amount":0.3
            });
            GD.Towns[5].locations[3].assortment.push({
               "item":207,
               "amount":0.4
            });
            GD.mapCenterX = GD.Caravans[0].x;
            GD.mapCenterY = GD.Caravans[0].y;
            if(param1 == 2)
            {
               GD.Caravans[0].money = 150000;
               GD.Towns[19].locations[0].visible = true;
               GD.Caravans[0].addCargo(136,1);
               GD.Caravans[0].addCargo(128,1);
               GD.Caravans[0].addCargo(130,42);
               GD.Caravans[0].distributeWeapons();
               GD.Caravans[0].distributeAmmo();
            }
         }
         GD.Caravans[0].addCargo(65,2);
         GD.Caravans[0].addCargo(1,2);
         GD.Caravans[0].distributeWeapons();
         GD.Caravans[0].distributeAmmo();
         GD.Caravans[0].distributeArmor();
         GD.Caravans[0].distributeTransport();
         theCharacter = null;
         if(GD.storyMode)
         {
            GD.setMode(9);
         }
         else
         {
            GD.setMode(1);
         }
      }
      
      public function switchShowTutorial() : *
      {
         showTutorial = !showTutorial;
      }
      
      public function switchAutoSave() : *
      {
         setAutoSave = !setAutoSave;
      }
      
      public function updateLanguageArea(param1:* = false) : *
      {
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:* = undefined;
         buttonsArray = [];
         var _loc3_:* = 0;
         languagesArea.clearAll();
         for(_loc4_ in GameData.languages)
         {
            if(GameData.languages[_loc4_].enabled || param1)
            {
               _loc5_ = buttonsArray.push({}) - 1;
               if(GameData.languages[_loc4_].ind > 2 && GameData.languages[_loc4_].ind != 18 && GameData.languages[_loc4_].ind != 19 && GameData.languages[_loc4_].ind != 20 && GameData.languages[_loc4_].ind != 30)
               {
                  _loc2_ = " - " + Texts.fetch(6875,null,100000000000000000000,GameData.languages[_loc4_].ind).toUpperCase();
               }
               else
               {
                  _loc2_ = "";
               }
               buttonsArray[_loc5_].disp = new Sprite();
               buttonsArray[_loc5_].txt = new EngineText(GameData.languages[_loc4_].name.toUpperCase() + _loc2_,3156000,16,"left",10,4,570,22);
               buttonsArray[_loc5_].disp.addChild(buttonsArray[_loc5_].txt);
               buttonsArray[_loc5_].disp.y = _loc3_;
               buttonsArray[_loc5_].inverse = new Sprite();
               buttonsArray[_loc5_].inverse.graphics.beginFill(3156000);
               buttonsArray[_loc5_].inverse.graphics.drawRect(0,0,590,30);
               buttonsArray[_loc5_].inverseText = new EngineText(GameData.languages[_loc4_].name.toUpperCase() + _loc2_,3156000,16,"left",10,4,570,22);
               buttonsArray[_loc5_].inverse.blendMode = "layer";
               buttonsArray[_loc5_].inverseText.blendMode = "erase";
               buttonsArray[_loc5_].inverse.addChild(buttonsArray[_loc5_].inverseText);
               buttonsArray[_loc5_].disp.addChild(buttonsArray[_loc5_].inverse);
               buttonsArray[_loc5_].flag = new ImportedBitmap("flag" + GameData.languages[_loc4_].ind + ".png");
               buttonsArray[_loc5_].flag.x = 550;
               buttonsArray[_loc5_].flag.y = 5;
               buttonsArray[_loc5_].disp.addChild(buttonsArray[_loc5_].flag);
               buttonsArray[_loc5_].txt.visible = GameData.languages[_loc4_].ind != Texts.language;
               buttonsArray[_loc5_].inverse.visible = GameData.languages[_loc4_].ind == Texts.language;
               buttonsArray[_loc5_].hit = new Sprite();
               buttonsArray[_loc5_].hit.graphics.beginFill(16711680);
               buttonsArray[_loc5_].hit.graphics.drawRect(0,0,590,30);
               buttonsArray[_loc5_].hit.visible = false;
               buttonsArray[_loc5_].disp.addChild(buttonsArray[_loc5_].hit);
               buttonsArray[_loc5_].disp.buttonMode = true;
               buttonsArray[_loc5_].disp.mouseChildren = false;
               buttonsArray[_loc5_].disp.hitArea = buttonsArray[_loc5_].hit;
               buttonsArray[_loc5_].disp.addEventListener("click",pressLanguage);
               languagesArea.addContent(buttonsArray[_loc5_].disp,null,null,null,null,true);
               buttonsArray[_loc5_].ind = GameData.languages[_loc4_].ind;
               _loc3_ += 30;
            }
         }
         languagesArea.updateSize();
      }
      
      public function switchLanguageChackbox() : *
      {
         updateLanguageArea(languageCheckbox.position);
      }
      
      public function clickSFXSwitch(param1:* = null) : *
      {
         GameData.soundFXOn = !GameData.soundFXOn;
         switchSFXCross.visible = !GameData.soundFXOn;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
      }
      
      public function clickMusicSwitch(param1:* = null) : *
      {
         GameData.musicOn = !GameData.musicOn;
         switchMusicCross.visible = !GameData.musicOn;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
      }
      
      public function EF(param1:* = null) : *
      {
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         _loc2_ = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         if(loadingStage != null)
         {
            GD.load(loadData,loadingStage);
            loadingStage = Number(loadingStage) + 1;
            if(loadingStage == 7)
            {
               GD.finishInitialization();
               loadData = null;
               System.pauseForGCIfCollectionImminent(1);
               System.gc();
               executeDLCOnInit();
               GD.setMode(1);
               loadingStage = null;
            }
         }
         if(ac != null)
         {
            _loc5_ = new Date();
            if(_loc5_ - lastKeepAlive > 120000)
            {
               _loc4_ = new URLLoader();
               _loc2_ = new URLRequest("keepalive.php");
               _loc2_.method = "POST";
               _loc2_.data = new URLVariables();
               _loc2_.data.session = ac;
               _loc4_.load(_loc2_);
               lastKeepAlive = _loc5_;
            }
         }
         if(countdown > 0)
         {
            countdown = Number(countdown) - 1;
            if(countdown == 0)
            {
               setScreen(4);
            }
         }
         if(cutting)
         {
            if(AnimationData.spriteBoundaries[atlas][type] is Array)
            {
               if(AnimationData.storedSprites[atlas][type] == undefined)
               {
                  AnimationData.splitAtlas(atlas,type);
               }
               type = Number(type) + 1;
            }
            else if(type == 0)
            {
               type = Number(type) + 1;
            }
            else
            {
               cutNextAtlas();
            }
         }
         if(creditsMoving)
         {
            creditsTextLeft.y -= 2;
            creditsTextRight.y -= 2;
            creditsTextCenter.y -= 2;
            _loc3_ = Math.max(Math.max(creditsTextLeft.height,creditsTextRight.height),creditsTextCenter.height);
            if(creditsTextCenter.y < 290 - _loc3_)
            {
               creditsMoving = false;
               creditsPauseCounter = 125;
            }
         }
         if(creditsPauseCounter > 0)
         {
            creditsPauseCounter = Number(creditsPauseCounter) - 1;
            if(creditsPauseCounter == 0)
            {
               creditsFadingScreen.alpha = 0;
               creditsFadingScreen.visible = true;
            }
         }
         if(creditsFadingScreen.visible)
         {
            creditsFadingScreen.alpha += 0.01;
            if(creditsFadingScreen.alpha >= 1)
            {
               creditsFadingScreen.visible = false;
               setScreen(2);
            }
         }
         if(intro != undefined && (intro.currentFrame == 201 || false && intro.currentFrame == 225))
         {
            intro.stop();
            currentScreen.removeChild(intro);
            intro = undefined;
            if(savedConfig.data.language != undefined)
            {
               setScreen(2);
            }
            else
            {
               setScreen(1);
            }
         }
      }
      
      private function cutNextAtlas() : *
      {
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:Boolean = false;
         _loc3_ = atlas == "";
         for(_loc1_ in AnimationData.spriteBoundaries)
         {
            if(_loc3_)
            {
               atlas = _loc1_;
               _loc2_ = true;
               type = 0;
               break;
            }
            if(_loc1_ == atlas)
            {
               _loc3_ = true;
            }
         }
         if(!_loc2_)
         {
            cutting = false;
            setScreen(0);
         }
      }
      
      public function requestAC() : *
      {
         try
         {
            ExternalInterface.addCallback("setNum",this.setAC);
            ExternalInterface.call("setGame");
         }
         catch(e:Error)
         {
            displayDLCError(Texts.fetch(6908) + "\n" + e.message);
            ac = null;
         }
      }
      
      public function setAC(param1:*) : *
      {
         ac = param1;
         dlcError = 2;
         DLCLoadingScreen.textLine1.text = Texts.fetch(6902);
         DLCLoadingScreen.textLine2.text = Texts.fetch(770);
         DLCLoadingScreen.disp.visible = true;
         requestDLCList();
         lastKeepAlive = new Date();
      }
      
      public function requestDLCList() : *
      {
         //-enable crowdfunder dlc
         // id - name - version - build - enabled
         // 1    Crowdfunder x     1       1  Crowdfunder.swf
         onReceiveDLCList({"target":{"data":"5|Industrial Magnate|x|1|1|IndustrialMagnate.swf|4|Advanced Weaponry|x|1|1|AdvancedWeaponry.swf|3|Welcome DLC|x|1|1|WelcomeToGamesOfHonor.swf|2|Special Story|x|1|1|SpecialStory.swf|1|Crowdfunder|x|1|1|Crowdfunder.swf"}});
      }
      
      public function loadListError(param1:* = null) : *
      {
         dlcError = 3;
         DLCLoadingScreen.disp.visible = false;
         displayDLCError(Texts.fetch(6904) + "\n" + Texts.fetch(6906));
         if(currentScreen == 2)
         {
            dlcDialogue.update();
         }
      }
      
      public function onReceiveDLCList(param1:* = null) : *
      {
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         DLCList = [];
         DLCLoadingScreen.disp.visible = false;
         if(param1.target.data.charAt(0) == "%")
         {
            dlcError = Number(param1.target.data.charAt(1));
            if(param1.target.data.charAt(1) == 4)
            {
               displayDLCError(Texts.fetch(6904) + "\n" + Texts.fetch(6906));
            }
            if(currentScreen == 2)
            {
               dlcDialogue.update();
            }
         }
         else
         {
            dlcError = 0;
            _loc2_ = param1.target.data.split("|");
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if(_loc2_[_loc4_ + 5].length > 0)
               {
                  _loc3_ = _loc2_[_loc4_ + 5].split(",");
                  DLCList.push({
                     "id":Number(_loc2_[_loc4_]),
                     "name":_loc2_[_loc4_ + 1],
                     "version":_loc2_[_loc4_ + 2],
                     "build":Number(_loc2_[_loc4_ + 3]),
                     "enabled":_loc2_[_loc4_ + 4] == "1",
                     "url":[]
                  });
                  _loc5_ = 0;
                  while(_loc5_ < _loc3_.length)
                  {
                     DLCList[DLCList.length - 1].url.push(_loc3_[_loc5_]);
                     _loc5_++;
                  }
               }
               else
               {
                  DLCList.push({
                     "id":Number(_loc2_[_loc4_]),
                     "name":_loc2_[_loc4_ + 1],
                     "version":_loc2_[_loc4_ + 2],
                     "build":Number(_loc2_[_loc4_ + 3]),
                     "enabled":_loc2_[_loc4_ + 4] == 1,
                     "url":_loc2_[_loc4_ + 5]
                  });
               }
               _loc4_ += 6;
            }
            for(_loc4_ in DLCList)
            {
               if(DLCList[_loc4_].build > 210)
               {
                  DLCList[_loc4_].enabled = false;
               }
               if(DLCList[_loc4_].enabled)
               {
                  loadDLC(DLCList[_loc4_].id);
               }
            }
         }
      }
      
      public function removeDLC(param1:*) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in loadedDLC)
         {
            if(loadedDLC[_loc2_].id == param1)
            {
               if(loadedDLC[_loc2_].hasOwnProperty("remove"))
               {
                  loadedDLC[_loc2_].remove();
               }
               DLCLoaders[_loc2_].unloadAndStop();
               loadedDLC[_loc2_] = null;
               loadedDLC.splice(_loc2_,1);
               DLCLoaders[_loc2_] = null;
               DLCLoaders.splice(_loc2_,1);
            }
         }
      }
      
      public function loadDLC(param1:*) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in DLCList)
         {
            if(DLCList[_loc2_].id == param1)
            {
               scheduledDLC.push(DLCList[_loc2_]);
               if(!dlcLoading)
               {
                  nextDLCLoader();
               }
               break;
            }
         }
      }
      
      public function nextDLCLoader() : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc5_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         if(scheduledDLC.length == 0)
         {
            DLCLoadingScreen.disp.visible = false;
            dlcLoading = false;
            if(currentScreen == 2)
            {
               dlcDialogue.update();
            }
         }
         else
         {
            dlcLoading = true;
            _loc2_ = scheduledDLC.shift();
            DLCLoadingScreen.disp.visible = true;
            DLCLoadingScreen.textLine1.text = Texts.fetch(6901) + ": " + _loc2_.name;
            DLCLoadingScreen.textLine2.text = Texts.fetch(770);
            if(_loc2_.url.length > 0)
            {
               if(_loc2_.url is String)
               {
                  _loc7_ = _loc2_.url;
                  _loc5_ = 1;
               }
               else
               {
                  _loc5_ = _loc2_.url.length;
               }
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  if(_loc2_.url is Array)
                  {
                     _loc7_ = _loc2_.url[_loc4_];
                  }
                  _loc8_ = pendingLoaders.push(new Loader()) - 1;
                  pendingLoaders[_loc8_].contentLoaderInfo.addEventListener("complete",onDLCConversionComplete);
                  pendingLoaders[_loc8_].uncaughtErrorEvents.addEventListener("uncaughtError",onDLCError);
                  pendingLoaders[_loc8_].contentLoaderInfo.addEventListener("ioError",onDLCError);
                  pendingLoaders[_loc8_].contentLoaderInfo.addEventListener("progress",onDLCProgress);
                  pendingLoaders[_loc8_].contentLoaderInfo.addEventListener("httpStatus",onDLChttpStatus);
                  pendingRequests[_loc8_] = new URLRequest(_loc7_);
                  _loc4_++;
               }
               currentPendingLoader = 0;
               nextPendingLoader();
            }
            else
            {
               _loc3_ = new URLLoader();
               _loc3_.dataFormat = "binary";
               _loc3_.addEventListener("complete",onLoadDLC);
               _loc3_.addEventListener("progress",onDLCProgress);
               _loc3_.addEventListener("ioError",onDLCError);
               _loc3_.addEventListener("securityError",onDLCError);
               _loc3_.addEventListener("httpStatus",onDLChttpStatus);
               try
               {
                  _loc1_ = new URLRequest("getdlc.php");
                  _loc1_.method = "POST";
                  _loc1_.data = new URLVariables();
                  _loc1_.data.session = ac;
                  _loc1_.data.id = _loc2_.id;
                  _loc3_.load(_loc1_);
                  lastKeepAlive = new Date();
               }
               catch(error:Error)
               {
                  displayDLCError(error.name + ": " + error.message);
               }
            }
         }
      }
      
      public function nextPendingLoader() : *
      {
         pendingLoaders[currentPendingLoader].load(pendingRequests[currentPendingLoader],new LoaderContext(false,ApplicationDomain.currentDomain,null));
         currentPendingLoader = Number(currentPendingLoader) + 1;
      }
      
      public function onDLChttpStatus(param1:* = null) : *
      {
         if(param1 != null && param1.status != 200 && param1.status != 304 && param1.status != 0)
         {
            displayDLCError(Texts.fetch(6903) + ": " + param1.status + "\n" + Texts.fetch(6905));
            dlcError = 6;
         }
      }
      
      public function onLoadDLC(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         if(param1.target.bytesTotal > 0)
         {
            _loc2_ = new Loader();
            _loc2_.contentLoaderInfo.addEventListener("complete",onDLCConversionComplete);
            _loc2_.contentLoaderInfo.addEventListener("ioError",onDLCError);
            _loc2_.uncaughtErrorEvents.addEventListener("uncaughtError",onDLCError);
            _loc2_.loadBytes(param1.target.data,new LoaderContext(false,ApplicationDomain.currentDomain,null));
         }
         else
         {
            displayDLCError(Texts.fetch(6904) + "\n" + Texts.fetch(6906));
         }
      }
      
      public function onDLCConversionComplete(param1:* = null) : *
      {
         var _loc2_:* = param1.target.loader.content;
         if(_loc2_.hasOwnProperty("initialize"))
         {
            _loc2_.initialize(this);
         }
         loadedDLC.push(_loc2_);
         DLCLoaders.push(param1.target.loader);
         if(currentPendingLoader >= pendingLoaders.length)
         {
            pendingLoaders = [];
            pendingRequests = [];
            nextDLCLoader();
         }
         else
         {
            nextPendingLoader();
         }
      }
      
      public function onDLCProgress(param1:* = null) : *
      {
         if(param1 != null)
         {
            if(pendingLoaders.length > 0)
            {
               DLCLoadingScreen.textLine2.text = Math.round(((currentPendingLoader - 1) / pendingLoaders.length + param1.target.bytesLoaded / param1.target.bytesTotal / pendingLoaders.length) * 100) + "%";
            }
            else
            {
               DLCLoadingScreen.textLine2.text = Math.round(param1.target.bytesLoaded / param1.target.bytesTotal * 100) + "%";
            }
         }
      }
      
      public function onDLCError(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = "";
         if(param1 is IOErrorEvent)
         {
            _loc3_ = param1.text;
         }
         else
         {
            if(param1.error is Error)
            {
               _loc3_ = param1.error.getStackTrace();
               if(_loc3_ == null)
               {
                  _loc3_ = param1.error.message;
               }
            }
            else if(param1.error is ErrorEvent)
            {
               _loc3_ = ErrorEvent(param1.error).text;
            }
            else
            {
               _loc3_ = param1.error.toString();
            }
            if(param1.error.info is Object)
            {
               _loc3_ += "\n\nInfo: \n";
            }
            for(_loc2_ in param1.error.info)
            {
               _loc3_ += _loc2_ + ": " + param1.error.info[_loc2_] + "\n";
            }
         }
         displayDLCError(_loc3_);
      }
      
      public function displayDLCError(param1:*) : *
      {
         DLCLoadingScreen.textLine1.text = Texts.fetch(6907);
         DLCLoadingScreen.textLine2.text = param1;
         DLCLoadingScreen.disp.visible = true;
         DLCLoadingScreen.closeButton.visible = true;
         DLCLoadingScreen.closeButton.y = 243 + DLCLoadingScreen.textLine2.textHeight + 20;
      }
      
      public function closeDLCLoadingScreen(param1:* = null) : *
      {
         DLCLoadingScreen.closeButton.visible = false;
         DLCLoadingScreen.disp.visible = false;
      }
      
      public function setSpriteBoundaries(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         if(!(AnimationData.spriteBoundaries[param1] is Array))
         {
            AnimationData.spriteBoundaries[param1] = [];
         }
         if(!(AnimationData.spriteBoundaries[param1][param2] is Array))
         {
            AnimationData.spriteBoundaries[param1][param2] = [];
         }
         if(!(AnimationData.spriteBoundaries[param1][param2][param3] is Array))
         {
            AnimationData.spriteBoundaries[param1][param2][param3] = [];
         }
         AnimationData.spriteBoundaries[param1][param2][param3][param4] = param5;
      }
      
      public function removeSpriteBoundaries(param1:*, param2:*) : *
      {
         delete AnimationData.spriteBoundaries[param1][param2];
      }
      
      public function setSpriteDimensions(param1:*, param2:*, param3:*) : *
      {
         if(!(AnimationData.spriteDimensions[param1] is Array))
         {
            AnimationData.spriteDimensions[param1] = [];
         }
         AnimationData.spriteDimensions[param1][param2] = param3;
         if(!(AnimationData.storedSprites[param1] is Array))
         {
            AnimationData.storedSprites[param1] = [];
         }
      }
      
      public function removeSpriteDimensions(param1:*, param2:*) : *
      {
         delete AnimationData.spriteDimensions[param1][param2];
      }
      
      public function setWeaponAnimationType(param1:*, param2:*) : *
      {
         WeaponsData.AnimationTypes[param1] = param2;
      }
      
      public function setWeapon(param1:*, param2:*) : *
      {
         WeaponsData.Weapons[param1] = param2;
      }
      
      public function removeWeapon(param1:*) : *
      {
         delete WeaponsData.Weapons[param1];
      }
      
      public function setItem(param1:*, param2:*, param3:*) : *
      {
         Item.Items[param1] = {
            "category":param2,
            "subCategory":param3
         };
      }
      
      public function removeItem(param1:*) : *
      {
         delete Item.Items[param1];
      }
      
      public function setGood(param1:*, param2:*) : *
      {
         Item.Goods[param1] = param2;
      }
      
      public function removeGood(param1:*) : *
      {
         delete Item.Goods[param1];
      }
      
      public function setCaliber(param1:*, param2:*) : *
      {
         WeaponsData.Calibers[param1] = param2;
      }
      
      public function removeCaliber(param1:*) : *
      {
         delete WeaponsData.Calibers[param1];
      }
      
      public function setAmmo(param1:*, param2:*) : *
      {
         WeaponsData.Ammo[param1] = param2;
      }
      
      public function removeAmmo(param1:*) : *
      {
         delete WeaponsData.Ammo[param1];
      }
      
      public function setAttachment(param1:*, param2:*) : *
      {
         WeaponsData.Attachments[param1] = param2;
      }
      
      public function removeAttachment(param1:*) : *
      {
         delete WeaponsData.Attachments[param1];
      }
      
      public function addRecipe(param1:*, param2:*) : *
      {
         GameData.workshopRecipes[param1] = param2;
      }
      
      public function removeRecipe(param1:*) : *
      {
         delete GameData.workshopRecipes[param1];
      }
      
      public function setText(param1:*, param2:*, param3:*) : *
      {
         if(!(Texts._texts[param1] is Array))
         {
            Texts._texts[param1] = [];
         }
         Texts._texts[param1][param2] = param3;
      }
      
      public function removeTextEntry(param1:*) : *
      {
         delete Texts._texts[param1];
      }
      
      public function executeDLCOnInit() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in loadedDLC)
         {
            if(!GD.initiatedDLC[loadedDLC[_loc1_].id])
            {
               if(loadedDLC[_loc1_].hasOwnProperty("onGameInit"))
               {
                  loadedDLC[_loc1_].onGameInit();
               }
               GD.initiatedDLC[loadedDLC[_loc1_].id] = true;
            }
         }
      }
      
      public function setDialogueEntry(param1:*, param2:*) : *
      {
         Dialogues.entries[param1] = param2;
      }
      
      public function removeDialogueEntry(param1:*) : *
      {
         delete Dialogues.entries[param1];
      }
      
      public function addResponsesToDialogueEntry(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         for(_loc3_ in param2)
         {
            Dialogues.entries[param1].responses.push(param2[_loc3_]);
         }
      }
      
      public function removeResponsesFromDialogueEntry(param1:*, param2:*) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in param2)
         {
            _loc4_ = 0;
            while(_loc4_ < Dialogues.entries[param1].responses.length)
            {
               if(Dialogues.entries[param1].responses[_loc4_] == param2[_loc3_])
               {
                  Dialogues.entries[param1].responses.splice(_loc4_,1);
                  _loc4_--;
               }
               _loc4_++;
            }
         }
      }
      
      public function addDialogueResponse(param1:*, param2:*) : *
      {
         Dialogues.responses[param1] = param2;
      }
      
      public function removeDialogueResponse(param1:*) : *
      {
         delete Dialogues.responses[param1];
      }
      
      public function addTownLocation(param1:*, param2:*, param3:*) : *
      {
         Presets.town_presets[0][param1].locations[param2] = param3;
      }
      
      public function removeTownLocation(param1:*, param2:*) : *
      {
         delete Presets.town_presets[0][param1].locations[param2];
      }
      
      public function addCharacterName(param1:*, param2:*) : *
      {
         Dialogues.characterNames[param1] = param2;
      }
      
      public function removeCharacterName(param1:*) : *
      {
         delete Dialogues.characterNames[param1];
      }
      
      public function setDialogueDefault(param1:*, param2:*) : *
      {
         Caravaneer2MainStory.defaultDefaults[param1] = param2;
      }
      
      public function removeDialogueDefault(param1:*) : *
      {
         delete Caravaneer2MainStory.defaultDefaults[param1];
      }
      
      public function setCharacterFaction(param1:*, param2:*) : *
      {
         Caravaneer2MainStory.defaultCharacterFactions[param1] = param2;
      }
      
      public function removeCharacterFaction(param1:*) : *
      {
         delete Caravaneer2MainStory.defaultCharacterFactions[param1];
      }
      
      public function setLocation(param1:*, param2:*) : *
      {
         Presets.town_presets[0][param1] = param2;
      }
      
      public function removeLocation(param1:*) : *
      {
         delete Presets.town_presets[0][param1];
      }
      
      public function setArmor(param1:*, param2:*) : *
      {
         Item.Armor[param1] = param2;
      }
      
      public function removeArmor(param1:*) : *
      {
         delete Item.Armor[param1];
      }
      
      public function setMissionDescription(param1:*, param2:*) : *
      {
         GameData.missionDescriptions[param1] = param2;
      }
      
      public function removeMissionDescription(param1:*) : *
      {
         delete GameData.missionDescriptions[param1];
      }
      
      public function createCharacter(param1:*) : *
      {
         return new Character(param1);
      }
      
      public function createCaravan(param1:*) : *
      {
         return new Caravan(param1,GD.mapMode.mapSymbols);
      }
      
      public function createDialogue(param1:*, param2:*) : *
      {
         return new Dialogue(param1,param2);
      }
      
      public function createEngineText(param1:* = "", param2:* = 16777215, param3:* = 12, param4:* = "center", param5:* = 0, param6:* = 0, param7:* = null, param8:* = null, param9:* = false, param10:* = false, param11:* = null, param12:* = "regular") : *
      {
         return new EngineText(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
      }
      
      public function createButton(param1:*, param2:* = null, param3:* = null, param4:* = null, param5:* = null, param6:* = false) : *
      {
         return new Button(param1,param2,param3,param4,param5,param6);
      }
      
      public function fetchText(param1:*, param2:* = 1, param3:* = 100000000000000000000) : *
      {
         return Texts.fetch(param1,param2,param3);
      }
      
      public function executeDLCFunction(param1:*, param2:*, param3:* = null) : *
      {
         var _loc4_:* = undefined;
         for(_loc4_ in loadedDLC)
         {
            if(loadedDLC[_loc4_].id == param1)
            {
               if(param3 == null)
               {
                  loadedDLC[_loc4_][param2]();
               }
               else
               {
                  loadedDLC[_loc4_][param2](param3);
               }
            }
         }
      }
      
      public function setFullScreen() : *
      {
         stage.fullScreenSourceRect = new Rectangle(0,0,879,494);
         stage.displayState = "fullScreenInteractive";
      }
      
      public function setWindowMode() : *
      {
         stage.fullScreenSourceRect = null;
         stage.displayState = "normal";
      }
      
      public function airKeyDown(param1:* = null) : *
      {
         if(param1.keyCode == 27)
         {
            param1.preventDefault();
         }
         if(param1.keyCode == 123 && fullScreenAllowed)
         {
            switchFullScreen();
         }
      }
      
      public function updateFullScreenSymbol(param1:* = null) : *
      {
         fullScreenOn.visible = stage.displayState != "fullScreenInteractive";
         fullScreenOff.visible = stage.displayState == "fullScreenInteractive";
      }
      
      public function switchFullScreen(param1:* = null) : *
      {
         if(fullScreenAllowed)
         {
            if(stage.displayState == "fullScreenInteractive")
            {
               setWindowMode();
            }
            else
            {
               setFullScreen();
            }
            updateFullScreenSymbol();
         }
      }
   }
}

