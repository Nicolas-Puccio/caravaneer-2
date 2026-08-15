package IsoEngine
{
   import Data.Texts;
   import Interface.*;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   public class BattleInterface extends Sprite
   {
      
      public static var pointerInfoBGColor:* = 12104352;
      
      public static var pointerInfoFGColor:* = 4339211;
      
      public var Name:*;
      
      public var WeaponName:*;
      
      public var WeaponType:*;
      
      public var LoadedAmmoAmount:*;
      
      public var LoadedAmmoName:*;
      
      public var WeaponModeName:*;
      
      public var ReloadAmmoName:*;
      
      public var ReloadAmmoAmount:*;
      
      public var FirstAidName:*;
      
      public var FirstAidAmount:*;
      
      public var PickUpItem:*;
      
      public var HPIndicator:*;
      
      public var MoraleIndicator:*;
      
      public var HPBars:*;
      
      public var MoraleBars:*;
      
      public var APIndicator:*;
      
      public var APDots:*;
      
      public var APOverflow:*;
      
      public var bleedingSign:*;
      
      public var burningSign:*;
      
      public var overloadSign:*;
      
      public var eyeDamageSign:*;
      
      public var armDamageSign:*;
      
      public var legDamageSign:*;
      
      public var criticallyWoundedSign:*;
      
      public var disabledScreen:*;
      
      public var battleField:*;
      
      public var reloadText:*;
      
      public var firstAidText:*;
      
      public var pickUpText:*;
      
      public var healingLight:*;
      
      public var mDown:* = false;
      
      public var draggingView:* = false;
      
      public var yourGroup:*;
      
      public var allies:*;
      
      public var enemies:*;
      
      public var pointerInfoText:*;
      
      public var pointerInfoBG:*;
      
      public var weaponDescription:* = "";
      
      public var AP:*;
      
      public var HP:*;
      
      public var morale:*;
      
      public var reloadAP:*;
      
      public var healAP:*;
      
      public var pickUpAP:*;
      
      public var weaponIconHolder:*;
      
      public var weaponIconImage:*;
      
      public var weaponIconAmmo:*;
      
      public var weaponIconAimedShot:*;
      
      public var weaponIconHeadShot:*;
      
      public var weaponIconBurstSymbol:*;
      
      public var weaponIconBurstText:*;
      
      public var weaponIconParallelShots:*;
      
      public var weaponIconScope:*;
      
      public var weaponIconLaser:*;
      
      public var portraitHolder:*;
      
      public var portraitImage:*;
      
      public var onClickPortrait:*;
      
      public var visibleMessages:*;
      
      public var characterPointer:*;
      
      public var onOpenOptions:*;
      
      public var stopped:* = false;
      
      private var clickableZone:* = 0;
      
      public function BattleInterface(param1:*)
      {
         var xx:*;
         var yy:*;
         var i:*;
         var Base:*;
         var Glass:*;
         var PLCol:*;
         var CountersCol:*;
         var brightIndicator:*;
         var dimIndicator:*;
         var buttonColor:*;
         var plasticTexts:*;
         var Weapon:*;
         var Reload:*;
         var PickUp:*;
         var FirstAid:*;
         var X1:*;
         var X2:*;
         var AS:*;
         var type:*;
         var available:*;
         var brightColorTransform:*;
         var dimColorTransform:*;
         var buttonColorTransform:*;
         var hpb:*;
         var mb:*;
         var bars:*;
         var percent:*;
         var zero:*;
         var hundred:*;
         var fifty:*;
         var AP:*;
         var dimCircles:*;
         var dimBleedingSign:*;
         var dimBurningSign:*;
         var dimOverloadedSign:*;
         var dimEyeDamageSign:*;
         var dimArmDamageSign:*;
         var dimLegDamageSign:*;
         var dimCriticallyWoundedSign:*;
         var lightBG:*;
         var miniMapMask:*;
         var switchSymbol:*;
         var switchWeapon:*;
         var unloadSymbol:*;
         var unloadWeapon:*;
         var dropSymbol:*;
         var dropWeapon:*;
         var prevWeaponMode:*;
         var nextWeaponMode:*;
         var prevReloadType:*;
         var nextReloadType:*;
         var reload:*;
         var prevFirstAidType:*;
         var nextFirstAidType:*;
         var prevPickUpPos:*;
         var nextPickUpPos:*;
         var firstAid:*;
         var pickUp:*;
         var tvButton:*;
         var nextTurnButton:*;
         var BF:* = param1;
         super();
         visibleMessages = [];
         battleField = BF;
         Base = new ImportedBitmap("BattleInterfaceBase.png");
         Glass = new ImportedBitmap("BattleInterfaceGlass.png");
         PLCol = 16777215;
         CountersCol = 16777215;
         brightIndicator = 10723715;
         dimIndicator = 4210214;
         buttonColor = 2498048;
         plasticTexts = new Sprite();
         onOpenOptions = function():*
         {
            trace("default open options");
         };
         Name = new EngineText(" ",PLCol,14,"center",645,10,230,20);
         Name.y = 15 - Name.textHeight / 2 - 2;
         Weapon = new EngineText(Texts.fetch(194).toUpperCase(),PLCol,14,"center",645,10,230,20);
         Weapon.y = 140 - Weapon.textHeight / 2 - 2;
         WeaponName = new EngineText(" ",PLCol,12,"left",730,null,145,20);
         WeaponName.y = 160 - WeaponName.textHeight / 2 - 2;
         WeaponType = new EngineText(" ",PLCol,10,"left",730,null,145,15);
         WeaponType.y = 172.5 - WeaponType.textHeight / 2 - 2;
         Reload = new EngineText(Texts.fetch(195).toUpperCase(),PLCol,14,"center",645,10,230,20);
         Reload.y = 265 - Reload.textHeight / 2 - 2;
         PickUp = new EngineText(Texts.fetch(196).toUpperCase(),PLCol,12,"center",315,10,260,20);
         PickUp.y = 460 - PickUp.textHeight / 2 - 2;
         FirstAid = new EngineText(Texts.fetch(197).toUpperCase(),PLCol,12,"center",5,10,295,20);
         FirstAid.y = 460 - FirstAid.textHeight / 2 - 2;
         X1 = new EngineText("X",PLCol,12,"center",825,null,15,20);
         X1.y = 192.5 - X1.textHeight / 2 - 2;
         X2 = new EngineText("X",PLCol,12,"center",195,null,15,20);
         X2.y = 477.5 - X2.textHeight / 2 - 2;
         AS = new AmmoSymbol();
         AS.x = 737.5;
         AS.y = 192.5;
         type = new EngineText(Texts.fetch(198).toUpperCase(),PLCol,8,"center",670,null,80,20);
         type.y = 282.5 - type.textHeight / 2 - 2;
         available = new EngineText(Texts.fetch(199).toUpperCase(),PLCol,8,"center",750,null,80,20);
         available.y = 282.5 - available.textHeight / 2 - 2;
         plasticTexts.addChild(Name);
         plasticTexts.addChild(Weapon);
         plasticTexts.addChild(WeaponName);
         plasticTexts.addChild(WeaponType);
         plasticTexts.addChild(Reload);
         plasticTexts.addChild(PickUp);
         plasticTexts.addChild(FirstAid);
         plasticTexts.addChild(X1);
         plasticTexts.addChild(X2);
         plasticTexts.addChild(type);
         plasticTexts.addChild(available);
         plasticTexts.addChild(AS);
         plasticTexts.alpha = 0.5;
         addChild(Base);
         LoadedAmmoAmount = new Counter(3);
         LoadedAmmoAmount.x = 840;
         LoadedAmmoAmount.y = 187;
         addChild(LoadedAmmoAmount);
         LoadedAmmoName = new EngineText(" ",CountersCol,10,"center",750,null,75,20);
         LoadedAmmoName.y = 192.5 - LoadedAmmoName.textHeight / 2 - 2;
         LoadedAmmoName.alpha = 0.6;
         addChild(LoadedAmmoName);
         WeaponModeName = new EngineText(" ",CountersCol,10,"center",670,null,180,20);
         WeaponModeName.y = 242.5 - WeaponModeName.textHeight / 2 - 2;
         WeaponModeName.alpha = 0.6;
         addChild(WeaponModeName);
         ReloadAmmoName = new EngineText(" ",CountersCol,10,"center",670,null,80,20);
         ReloadAmmoName.y = 297.5 - ReloadAmmoName.textHeight / 2 - 2;
         ReloadAmmoName.alpha = 0.6;
         addChild(ReloadAmmoName);
         ReloadAmmoAmount = new Counter(3);
         ReloadAmmoAmount.x = 775;
         ReloadAmmoAmount.y = 292;
         addChild(ReloadAmmoAmount);
         FirstAidName = new EngineText(" ",CountersCol,10,"center",30,null,145,20);
         FirstAidName.y = 477.5 - FirstAidName.textHeight / 2 - 2;
         FirstAidName.alpha = 0.6;
         addChild(FirstAidName);
         FirstAidAmount = new Counter(2);
         FirstAidAmount.x = 210;
         FirstAidAmount.y = 472;
         addChild(FirstAidAmount);
         PickUpItem = new EngineText(" ",CountersCol,10,"center",340,null,145,20);
         PickUpItem.y = 477.5 - PickUpItem.textHeight / 2 - 2;
         PickUpItem.alpha = 0.6;
         addChild(PickUpItem);
         HPIndicator = new Indicator(3,false,brightIndicator,dimIndicator,5,10,7);
         HPIndicator.x = 727;
         HPIndicator.y = 35;
         addChild(HPIndicator);
         MoraleIndicator = new Indicator(3,false,brightIndicator,dimIndicator,5,10,7);
         MoraleIndicator.x = 727;
         MoraleIndicator.y = 55;
         addChild(MoraleIndicator);
         brightColorTransform = new ColorTransform();
         dimColorTransform = new ColorTransform();
         buttonColorTransform = new ColorTransform();
         brightColorTransform.color = brightIndicator;
         dimColorTransform.color = dimIndicator;
         buttonColorTransform.color = buttonColor;
         hpb = new HPBox();
         mb = new MoraleBox();
         hpb.x = 750;
         hpb.y = 35;
         mb.x = 750;
         mb.y = 55;
         hpb.transform.colorTransform = brightColorTransform;
         mb.transform.colorTransform = brightColorTransform;
         addChild(hpb);
         addChild(mb);
         HPBars = [];
         MoraleBars = [];
         bars = new Sprite();
         bars.x = 767;
         bars.y = 35;
         addChild(bars);
         i = 0;
         while(i < 20)
         {
            bars.graphics.beginFill(dimIndicator);
            bars.graphics.moveTo(i * 5,0);
            bars.graphics.lineTo(i * 5 + 3,0);
            bars.graphics.lineTo(i * 5 + 3,10);
            bars.graphics.lineTo(i * 5,10);
            bars.graphics.endFill();
            bars.graphics.beginFill(dimIndicator);
            bars.graphics.moveTo(i * 5,20);
            bars.graphics.lineTo(i * 5 + 3,20);
            bars.graphics.lineTo(i * 5 + 3,30);
            bars.graphics.lineTo(i * 5,30);
            bars.graphics.endFill();
            HPBars[i] = new Sprite();
            HPBars[i].graphics.beginFill(brightIndicator);
            HPBars[i].graphics.moveTo(0,0);
            HPBars[i].graphics.lineTo(3,0);
            HPBars[i].graphics.lineTo(3,10);
            HPBars[i].graphics.lineTo(0,10);
            HPBars[i].graphics.endFill();
            HPBars[i].x = 767 + i * 5;
            HPBars[i].y = 35;
            HPBars[i].visible = false;
            addChild(HPBars[i]);
            MoraleBars[i] = new Sprite();
            MoraleBars[i].graphics.beginFill(brightIndicator);
            MoraleBars[i].graphics.moveTo(0,0);
            MoraleBars[i].graphics.lineTo(3,0);
            MoraleBars[i].graphics.lineTo(3,10);
            MoraleBars[i].graphics.lineTo(0,10);
            MoraleBars[i].graphics.endFill();
            MoraleBars[i].x = 767 + i * 5;
            MoraleBars[i].y = 55;
            MoraleBars[i].visible = false;
            addChild(MoraleBars[i]);
            i = Number(i) + 1;
         }
         percent = new EngineText("%",brightIndicator,7,"center",750,null,15,20);
         percent.y = 50 - percent.textHeight / 2 - 2;
         addChild(percent);
         zero = new EngineText("0",brightIndicator,7,"left",765,null,15,20);
         zero.y = 50 - zero.textHeight / 2 - 2;
         addChild(zero);
         hundred = new EngineText("100",brightIndicator,7,"right",847,null,20,20);
         hundred.y = 50 - hundred.textHeight / 2 - 2;
         addChild(hundred);
         fifty = new EngineText("50",brightIndicator,7,"center",806,null,20,20);
         fifty.y = 50 - fifty.textHeight / 2 - 2;
         addChild(fifty);
         APIndicator = new Indicator(2,false,brightIndicator,dimIndicator,5,10,7);
         APIndicator.x = 727;
         APIndicator.y = 95;
         addChild(APIndicator);
         AP = new EngineText(Texts.fetch(1095),brightIndicator,12,"center",740,null,20,20);
         AP.y = 100 - AP.textHeight / 2 - 2;
         addChild(AP);
         dimCircles = new Sprite();
         dimCircles.x = 760;
         dimCircles.y = 100;
         addChild(dimCircles);
         APDots = [];
         i = 0;
         while(i < 20)
         {
            dimCircles.graphics.beginFill(dimIndicator);
            dimCircles.graphics.drawCircle(i * 5 + 3,0,2);
            dimCircles.graphics.endFill();
            APDots[i] = new Sprite();
            APDots[i].graphics.beginFill(brightIndicator);
            APDots[i].graphics.drawCircle(0,0,2);
            APDots[i].graphics.endFill();
            APDots[i].x = 763 + i * 5;
            APDots[i].y = 100;
            APDots[i].visible = false;
            addChild(APDots[i]);
            i = Number(i) + 1;
         }
         dimCircles.graphics.beginFill(dimIndicator);
         dimCircles.graphics.moveTo(101,-5);
         dimCircles.graphics.lineTo(105,0);
         dimCircles.graphics.lineTo(101,5);
         dimCircles.graphics.endFill();
         APOverflow = new Sprite();
         APOverflow.graphics.beginFill(brightIndicator);
         APOverflow.graphics.moveTo(0,-5);
         APOverflow.graphics.lineTo(4,0);
         APOverflow.graphics.lineTo(0,5);
         APOverflow.graphics.endFill();
         APOverflow.x = 861;
         APOverflow.y = 100;
         APOverflow.visible = false;
         addChild(APOverflow);
         dimBleedingSign = new IndicatorBleeding();
         dimBleedingSign.transform.colorTransform = dimColorTransform;
         dimBleedingSign.scaleX = dimBleedingSign.scaleY = 0.15;
         dimBleedingSign.x = 737.5;
         dimBleedingSign.y = 80;
         addChild(dimBleedingSign);
         bleedingSign = new IndicatorBleeding();
         bleedingSign.transform.colorTransform = brightColorTransform;
         bleedingSign.scaleX = bleedingSign.scaleY = 0.15;
         bleedingSign.x = 737.5;
         bleedingSign.y = 80;
         bleedingSign.visible = false;
         addChild(bleedingSign);
         dimBurningSign = new IndicatorBurning();
         dimBurningSign.transform.colorTransform = dimColorTransform;
         dimBurningSign.scaleX = dimBurningSign.scaleY = 0.15;
         dimBurningSign.x = 757.5;
         dimBurningSign.y = 80;
         addChild(dimBurningSign);
         burningSign = new IndicatorBurning();
         burningSign.transform.colorTransform = brightColorTransform;
         burningSign.scaleX = burningSign.scaleY = 0.15;
         burningSign.x = 757.5;
         burningSign.y = 80;
         burningSign.visible = false;
         addChild(burningSign);
         dimOverloadedSign = new IndicatorOverload();
         dimOverloadedSign.transform.colorTransform = dimColorTransform;
         dimOverloadedSign.scaleX = dimOverloadedSign.scaleY = 0.15;
         dimOverloadedSign.x = 777.5;
         dimOverloadedSign.y = 80;
         addChild(dimOverloadedSign);
         overloadSign = new IndicatorOverload();
         overloadSign.transform.colorTransform = brightColorTransform;
         overloadSign.scaleX = overloadSign.scaleY = 0.15;
         overloadSign.x = 777.5;
         overloadSign.y = 80;
         overloadSign.visible = false;
         addChild(overloadSign);
         dimEyeDamageSign = new IndicatorEyeDamage();
         dimEyeDamageSign.transform.colorTransform = dimColorTransform;
         dimEyeDamageSign.scaleX = dimEyeDamageSign.scaleY = 0.15;
         dimEyeDamageSign.x = 797.5;
         dimEyeDamageSign.y = 80;
         addChild(dimEyeDamageSign);
         eyeDamageSign = new IndicatorEyeDamage();
         eyeDamageSign.transform.colorTransform = brightColorTransform;
         eyeDamageSign.scaleX = eyeDamageSign.scaleY = 0.15;
         eyeDamageSign.x = 797.5;
         eyeDamageSign.y = 80;
         eyeDamageSign.visible = false;
         addChild(eyeDamageSign);
         dimArmDamageSign = new IndicatorArmDamage();
         dimArmDamageSign.transform.colorTransform = dimColorTransform;
         dimArmDamageSign.scaleX = dimArmDamageSign.scaleY = 0.15;
         dimArmDamageSign.x = 817.5;
         dimArmDamageSign.y = 80;
         addChild(dimArmDamageSign);
         armDamageSign = new IndicatorArmDamage();
         armDamageSign.transform.colorTransform = brightColorTransform;
         armDamageSign.scaleX = armDamageSign.scaleY = 0.15;
         armDamageSign.x = 817.5;
         armDamageSign.visible = false;
         armDamageSign.y = 80;
         addChild(armDamageSign);
         dimLegDamageSign = new IndicatorLegDamage();
         dimLegDamageSign.transform.colorTransform = dimColorTransform;
         dimLegDamageSign.scaleX = dimLegDamageSign.scaleY = 0.15;
         dimLegDamageSign.x = 837.5;
         dimLegDamageSign.y = 80;
         addChild(dimLegDamageSign);
         legDamageSign = new IndicatorLegDamage();
         legDamageSign.transform.colorTransform = brightColorTransform;
         legDamageSign.scaleX = legDamageSign.scaleY = 0.15;
         legDamageSign.x = 837.5;
         legDamageSign.y = 80;
         legDamageSign.visible = false;
         addChild(legDamageSign);
         dimCriticallyWoundedSign = new IndicatorCriticallyWounded();
         dimCriticallyWoundedSign.transform.colorTransform = dimColorTransform;
         dimCriticallyWoundedSign.scaleX = dimCriticallyWoundedSign.scaleY = 0.15;
         dimCriticallyWoundedSign.x = 857.5;
         dimCriticallyWoundedSign.y = 80;
         addChild(dimCriticallyWoundedSign);
         criticallyWoundedSign = new IndicatorCriticallyWounded();
         criticallyWoundedSign.transform.colorTransform = brightColorTransform;
         criticallyWoundedSign.scaleX = criticallyWoundedSign.scaleY = 0.15;
         criticallyWoundedSign.x = 857.5;
         criticallyWoundedSign.y = 80;
         criticallyWoundedSign.visible = false;
         addChild(criticallyWoundedSign);
         addChild(plasticTexts);
         lightBG = new ImportedBitmap("BulbLightRedOff.png");
         lightBG.x = 7;
         lightBG.y = 449;
         addChild(lightBG);
         healingLight = new ImportedBitmap("BulbLightRedOn.png");
         healingLight.x = 7;
         healingLight.y = 449;
         healingLight.visible = false;
         addChild(healingLight);
         battleField.interfaceData.miniMap.x = 745;
         battleField.interfaceData.miniMap.y = 350;
         if(battleField.interfaceData.miniMap.width / battleField.interfaceData.miniMap.height > 1.3043478260869565)
         {
            battleField.interfaceData.miniMap.scaleX = battleField.interfaceData.miniMap.scaleY = 150 / battleField.interfaceData.miniMap.width;
            battleField.interfaceData.miniMap.y = 407.5 - battleField.interfaceData.miniMap.height / 2;
         }
         else
         {
            battleField.interfaceData.miniMap.scaleX = battleField.interfaceData.miniMap.scaleY = 115 / battleField.interfaceData.miniMap.height;
         }
         addChild(battleField.interfaceData.miniMap);
         miniMapMask = new MiniMapMask();
         miniMapMask.x = 670;
         miniMapMask.y = 350;
         addChild(miniMapMask);
         addEventListener("mouseDown",clickMouse,false,0,false);
         addEventListener("mouseUp",releaseMouse,false,0,false);
         addEventListener("enterFrame",EF,false,0,false);
         addEventListener("addedToStage",createStageEvents,false,0,false);
         battleField.interfaceData.miniMap.mask = miniMapMask;
         yourGroup = new EngineText(" ",BattleField.miniMapYourGroupColor,9,"left",680,350,75,10);
         yourGroup.y = 365 - yourGroup.textHeight / 2 - 2;
         addChild(yourGroup);
         allies = new EngineText(" ",BattleField.miniMapAllyColor,9,"left",680,350,75,10);
         allies.y = 375 - allies.textHeight / 2 - 2;
         addChild(allies);
         enemies = new EngineText(" ",BattleField.miniMapEnemyColor,9,"right",735,350,75,10);
         enemies.y = 365 - enemies.textHeight / 2 - 2;
         addChild(enemies);
         portraitHolder = new Sprite();
         portraitHolder.x = 655;
         portraitHolder.y = 35;
         portraitHolder.scaleX = portraitHolder.scaleY = 0.24;
         addChild(portraitHolder);
         portraitHolder.buttonMode = true;
         portraitHolder.mouseChildren = false;
         portraitHolder.addEventListener("click",clickPortraitExternal,false,0,false);
         weaponIconHolder = new Sprite();
         weaponIconHolder.x = 650;
         weaponIconHolder.y = 155;
         addChild(weaponIconHolder);
         weaponIconAmmo = new Bitmap(new BitmapData(70,70,true,0));
         weaponIconAmmo.x = 650;
         weaponIconAmmo.y = 155;
         addChild(weaponIconAmmo);
         weaponIconAimedShot = new AimedShotSymbol();
         weaponIconAimedShot.x = 700;
         weaponIconAimedShot.y = 205;
         weaponIconAimedShot.visible = false;
         addChild(weaponIconAimedShot);
         weaponIconHeadShot = new HeadShotSymbol();
         weaponIconHeadShot.x = 700;
         weaponIconHeadShot.y = 205;
         weaponIconHeadShot.visible = false;
         addChild(weaponIconHeadShot);
         weaponIconParallelShots = new ParallelShotsSymbol();
         weaponIconParallelShots.x = 700;
         weaponIconParallelShots.y = 205;
         weaponIconParallelShots.visible = false;
         addChild(weaponIconParallelShots);
         weaponIconBurstSymbol = new BurstSymbol();
         weaponIconBurstSymbol.x = 705;
         weaponIconBurstSymbol.y = 205;
         weaponIconBurstSymbol.visible = false;
         addChild(weaponIconBurstSymbol);
         weaponIconBurstText = new EngineText("",13223167,9,"right",660,205,45,15);
         addChild(weaponIconBurstText);
         weaponIconScope = new ScopeSymbol();
         weaponIconScope.x = 655;
         weaponIconScope.y = 205;
         weaponIconScope.visible = false;
         addChild(weaponIconScope);
         weaponIconLaser = new LaserSymbol();
         weaponIconLaser.x = 675;
         weaponIconLaser.y = 206;
         weaponIconLaser.scaleX = weaponIconLaser.scaleY = 0.85;
         weaponIconLaser.visible = false;
         addChild(weaponIconLaser);
         addChild(Glass);
         switchSymbol = new ButtonSymbolSwitch();
         switchSymbol.transform.colorTransform = buttonColorTransform;
         switchSymbol.scaleX = switchSymbol.scaleY = 0.12;
         switchSymbol.alpha = 0.6;
         switchWeapon = new InterfaceButton(new ImportedBitmap("Button40x15Up.png"),new ImportedBitmap("Button40x15Down.png"),switchSymbol,20,7.5,battleField.pressButton,"switch weapon");
         switchWeapon.x = 730;
         switchWeapon.y = 210;
         addChild(switchWeapon);
         unloadSymbol = new ButtonSymbolUnload();
         unloadSymbol.transform.colorTransform = buttonColorTransform;
         unloadSymbol.scaleX = unloadSymbol.scaleY = 0.12;
         unloadSymbol.alpha = 0.6;
         unloadWeapon = new InterfaceButton(new ImportedBitmap("Button40x15Up.png"),new ImportedBitmap("Button40x15Down.png"),unloadSymbol,20,7.5,battleField.pressButton,"unload weapon");
         unloadWeapon.x = 780;
         unloadWeapon.y = 210;
         addChild(unloadWeapon);
         dropSymbol = new ButtonSymbolDrop();
         dropSymbol.transform.colorTransform = buttonColorTransform;
         dropSymbol.scaleX = dropSymbol.scaleY = 0.12;
         dropSymbol.alpha = 0.6;
         dropWeapon = new InterfaceButton(new ImportedBitmap("Button40x15Up.png"),new ImportedBitmap("Button40x15Down.png"),dropSymbol,20,7.5,battleField.pressButton,"drop weapon");
         dropWeapon.x = 830;
         dropWeapon.y = 210;
         addChild(dropWeapon);
         prevWeaponMode = new InterfaceButton(new ImportedBitmap("Button15x15Up.png"),new ImportedBitmap("Button15x15Down.png"),new RepeatedGraphics(1,buttonColor,0.6),7.5,7.5,battleField.pressButton,"prev weapon mode");
         prevWeaponMode.x = 650;
         prevWeaponMode.y = 235;
         addChild(prevWeaponMode);
         nextWeaponMode = new InterfaceButton(new ImportedBitmap("Button15x15Up.png"),new ImportedBitmap("Button15x15Down.png"),new RepeatedGraphics(2,buttonColor,0.6),7.5,7.5,battleField.pressButton,"next weapon mode");
         nextWeaponMode.x = 855;
         nextWeaponMode.y = 235;
         addChild(nextWeaponMode);
         prevReloadType = new InterfaceButton(new ImportedBitmap("Button15x15Up.png"),new ImportedBitmap("Button15x15Down.png"),new RepeatedGraphics(1,buttonColor,0.6),7.5,7.5,battleField.pressButton,"prev ammo type");
         prevReloadType.x = 650;
         prevReloadType.y = 290;
         addChild(prevReloadType);
         nextReloadType = new InterfaceButton(new ImportedBitmap("Button15x15Up.png"),new ImportedBitmap("Button15x15Down.png"),new RepeatedGraphics(2,buttonColor,0.6),7.5,7.5,battleField.pressButton,"next ammo type");
         nextReloadType.x = 755;
         nextReloadType.y = 290;
         addChild(nextReloadType);
         reloadText = new EngineText(" ",buttonColor,10,"center",0,0,60,15);
         reloadText.alpha = 0.8;
         reload = new InterfaceButton(new ImportedBitmap("Button60x15Up.png"),new ImportedBitmap("Button60x15Down.png"),reloadText,0,7.5 - reloadText.textHeight / 2 - 2,battleField.pressButton,"reload");
         reload.x = 810;
         reload.y = 290;
         addChild(reload);
         prevFirstAidType = new InterfaceButton(new ImportedBitmap("Button15x15Up.png"),new ImportedBitmap("Button15x15Down.png"),new RepeatedGraphics(1,buttonColor,0.6),7.5,7.5,battleField.pressButton,"prev first aid");
         prevFirstAidType.x = 10;
         prevFirstAidType.y = 470;
         addChild(prevFirstAidType);
         nextFirstAidType = new InterfaceButton(new ImportedBitmap("Button15x15Up.png"),new ImportedBitmap("Button15x15Down.png"),new RepeatedGraphics(2,buttonColor,0.6),7.5,7.5,battleField.pressButton,"next first aid");
         nextFirstAidType.x = 180;
         nextFirstAidType.y = 470;
         addChild(nextFirstAidType);
         prevPickUpPos = new InterfaceButton(new ImportedBitmap("Button15x15Up.png"),new ImportedBitmap("Button15x15Down.png"),new RepeatedGraphics(1,buttonColor,0.6),7.5,7.5,battleField.pressButton,"prev pick up pos");
         prevPickUpPos.x = 320;
         prevPickUpPos.y = 470;
         addChild(prevPickUpPos);
         nextPickUpPos = new InterfaceButton(new ImportedBitmap("Button15x15Up.png"),new ImportedBitmap("Button15x15Down.png"),new RepeatedGraphics(2,buttonColor,0.6),7.5,7.5,battleField.pressButton,"next pick up pos");
         nextPickUpPos.x = 490;
         nextPickUpPos.y = 470;
         addChild(nextPickUpPos);
         firstAidText = new EngineText(" ",buttonColor,10,"center",0,0,60,15);
         firstAidText.alpha = 0.8;
         firstAid = new InterfaceButton(new ImportedBitmap("Button60x15Up.png"),new ImportedBitmap("Button60x15Down.png"),firstAidText,0,7.5 - firstAidText.textHeight / 2 - 2,battleField.pressButton,"switch healing mode");
         firstAid.x = 235;
         firstAid.y = 470;
         addChild(firstAid);
         pickUpText = new EngineText(" ",buttonColor,10,"center",0,0,60,15);
         pickUpText.alpha = 0.8;
         pickUp = new InterfaceButton(new ImportedBitmap("Button60x15Up.png"),new ImportedBitmap("Button60x15Down.png"),pickUpText,0,7.5 - pickUpText.textHeight / 2 - 2,battleField.pressButton,"pick up weapon");
         pickUp.x = 510;
         pickUp.y = 470;
         addChild(pickUp);
         tvButton = new InterfaceButton(new ImportedBitmap("TVButtonUp.png"),new ImportedBitmap("TVButtonDown.png"),null,7.5,7.5,openOptions);
         tvButton.x = 850;
         tvButton.y = 470;
         addChild(tvButton);
         nextTurnButton = new InterfaceButton(new ImportedBitmap("LaunchButtonUp.png"),new ImportedBitmap("LaunchButtonDown.png"),null,7.5,7.5,battleField.pressButton,"next turn");
         nextTurnButton.x = 595;
         nextTurnButton.y = 455;
         addChild(nextTurnButton);
         pointerInfoText = new EngineText("",pointerInfoFGColor,12,"center",0,0,null,null,true);
         pointerInfoBG = new Sprite();
         addChild(pointerInfoBG);
         addChild(pointerInfoText);
         disabledScreen = new Bitmap(new BitmapData(880,495,true,0));
         xx = 0;
         while(xx < 880)
         {
            yy = 0;
            while(yy < 495)
            {
               if((xx > 640 || yy > 445) && MathFunctions.XOR(xx % 4 < 2,yy % 4 < 2))
               {
                  disabledScreen.bitmapData.setPixel32(xx,yy,4278190080);
               }
               yy = Number(yy) + 1;
            }
            xx = Number(xx) + 1;
         }
         disabledScreen.visible = false;
         addChild(disabledScreen);
      }
      
      internal function openOptions() : *
      {
         onOpenOptions();
      }
      
      internal function clickPortraitExternal(param1:* = null) : *
      {
         if(onClickPortrait is Function)
         {
            onClickPortrait();
         }
      }
      
      internal function clickMouse(param1:*) : *
      {
         mDown = true;
         if(mouseX >= 670 && mouseX <= 820 && mouseY >= 350 && mouseY <= 465)
         {
            draggingView = true;
         }
         if(clickableZone == 1)
         {
            battleField.centerViewOnCurrentCharacter();
         }
      }
      
      internal function releaseMouse(param1:*) : *
      {
         mDown = false;
         draggingView = false;
      }
      
      internal function EF(param1:*) : *
      {
         var _loc8_:* = undefined;
         var _loc7_:* = undefined;
         var _loc11_:* = undefined;
         var _loc10_:* = undefined;
         _loc11_ = undefined;
         var _loc9_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         if(stopped)
         {
            return;
         }
         _loc7_ = 0;
         while(_loc7_ < visibleMessages.length)
         {
            visibleMessages[_loc7_].counter++;
            if(visibleMessages[_loc7_].counter > visibleMessages[_loc7_].TTL - visibleMessages[_loc7_].fade)
            {
               visibleMessages[_loc7_].TF.alpha = (visibleMessages[_loc7_].TTL - visibleMessages[_loc7_].counter) / visibleMessages[_loc7_].fade;
            }
            _loc8_ = _loc7_ * 15;
            if(visibleMessages[_loc7_].TF.y > _loc8_)
            {
               visibleMessages[_loc7_].TF.y -= Math.abs(visibleMessages[_loc7_].TF.y - _loc8_) / 10;
            }
            if(visibleMessages[_loc7_].TF.y < _loc8_)
            {
               visibleMessages[_loc7_].TF.y += Math.abs(visibleMessages[_loc7_].TF.y - _loc8_) / 10;
            }
            if(Math.abs(visibleMessages[_loc7_].TF.y - _loc8_) < 0.5)
            {
               visibleMessages[_loc7_].TF.y = _loc8_;
            }
            if(visibleMessages[_loc7_].counter >= visibleMessages[_loc7_].TTL)
            {
               removeChild(visibleMessages[_loc7_].TF);
               visibleMessages.splice(_loc7_,1);
               _loc7_--;
            }
            _loc7_++;
         }
         if(disabledScreen.visible)
         {
            return false;
         }
         if(draggingView)
         {
            battleField.viewTargetX = battleField.MobilePart.x = 0 - battleField.interfaceData.miniMap.mouseX * battleField.squareWidth + battleField.screenWidth / 2;
            battleField.viewTargetY = battleField.MobilePart.y = 0 - battleField.interfaceData.miniMap.mouseY * battleField.squareHeight + battleField.screenHeight / 2;
            battleField.moveScreen(0,0);
         }
         pointerInfoText.text = "";
         clickableZone = 0;
         if(mouseX >= 650 && mouseY >= 30 && mouseX <= 720 && mouseY <= 110)
         {
            pointerInfoText.text += Texts.fetch(944) + ": " + Math.round(characterPointer.physical) + "\n";
            pointerInfoText.text += Texts.fetch(945) + ": " + Math.round(characterPointer.agility) + "\n";
            pointerInfoText.text += Texts.fetch(946) + ": " + Math.round(characterPointer.accuracy) + "\n";
            pointerInfoText.text += Texts.fetch(947) + ": " + Math.round(characterPointer.intelligence) + "\n";
            pointerInfoText.text += Texts.fetch(967) + ": " + Math.round(characterPointer.rangedWeaponsSkill) + "\n";
            pointerInfoText.text += Texts.fetch(968) + ": " + Math.round(characterPointer.meleeSkill) + "\n";
            pointerInfoText.text += Texts.fetch(969) + ": " + Math.round(characterPointer.unarmedSkill) + "\n";
            pointerInfoText.text += Texts.fetch(970) + ": " + Math.round(characterPointer.throwSkill) + "\n";
         }
         if(mouseX >= 750 && mouseY >= 185 && mouseX <= 825 && mouseY <= 200)
         {
            if(characterPointer.currentAmmo.amount > 0)
            {
               _loc11_ = characterPointer.currentAmmo.getInfoPairs();
               for(_loc7_ in _loc11_)
               {
                  if(_loc11_[_loc7_].value != undefined)
                  {
                     pointerInfoText.text += _loc11_[_loc7_].name.toLowerCase() + ": " + _loc11_[_loc7_].value + "\n";
                  }
               }
            }
         }
         if(mouseX >= 670 && mouseY >= 290 && mouseX <= 750 && mouseY <= 305)
         {
            if(characterPointer.selectedAmmo[characterPointer.currSlot] > 0)
            {
               _loc10_ = new Item(characterPointer.selectedAmmo[characterPointer.currSlot],1);
               _loc11_ = _loc10_.getInfoPairs();
               for(_loc7_ in _loc11_)
               {
                  if(_loc11_[_loc7_].value != undefined)
                  {
                     pointerInfoText.text += _loc11_[_loc7_].name.toLowerCase() + ": " + _loc11_[_loc7_].value + "\n";
                  }
               }
            }
         }
         if(battleField.interfaceData.miniMap.hitTestPoint(mouseX,mouseY,false))
         {
            clickableZone = 2;
         }
         if(mouseX >= 725 && mouseY >= 35 && mouseX <= 870 && mouseY <= 45)
         {
            pointerInfoText.text = Texts.fetch(1096) + ": " + HP;
         }
         if(mouseX >= 725 && mouseY >= 55 && mouseX <= 870 && mouseY <= 65)
         {
            pointerInfoText.text = Texts.fetch(200) + ": " + morale;
         }
         if(mouseX >= 725 && mouseY >= 95 && mouseX <= 870 && mouseY <= 105)
         {
            pointerInfoText.text = Texts.fetch(1095) + ": " + AP;
         }
         if(mouseX >= 730 && mouseY >= 72.5 && mouseX <= 745 && mouseY <= 87.5)
         {
            pointerInfoText.text = Texts.fetch(201);
         }
         if(mouseX >= 750 && mouseY >= 72.5 && mouseX <= 765 && mouseY <= 87.5)
         {
            pointerInfoText.text = Texts.fetch(202);
         }
         if(mouseX >= 770 && mouseY >= 72.5 && mouseX <= 785 && mouseY <= 87.5)
         {
            pointerInfoText.text = Texts.fetch(27);
         }
         if(mouseX >= 790 && mouseY >= 72.5 && mouseX <= 805 && mouseY <= 87.5)
         {
            pointerInfoText.text = Texts.fetch(203);
         }
         if(mouseX >= 810 && mouseY >= 72.5 && mouseX <= 825 && mouseY <= 87.5)
         {
            pointerInfoText.text = Texts.fetch(204);
         }
         if(mouseX >= 830 && mouseY >= 72.5 && mouseX <= 845 && mouseY <= 87.5)
         {
            pointerInfoText.text = Texts.fetch(205);
         }
         if(mouseX >= 850 && mouseY >= 72.5 && mouseX <= 865 && mouseY <= 87.5)
         {
            pointerInfoText.text = Texts.fetch(206);
         }
         if(mouseX >= 650 && mouseY >= 155 && mouseX <= 720 && mouseY <= 225)
         {
            pointerInfoText.text = weaponDescription;
         }
         if(mouseX >= 730 && mouseY >= 210 && mouseX <= 770 && mouseY <= 225)
         {
            pointerInfoText.text = Texts.fetch(207);
         }
         if(mouseX >= 780 && mouseY >= 210 && mouseX <= 820 && mouseY <= 225)
         {
            pointerInfoText.text = Texts.fetch(208);
         }
         if(mouseX >= 830 && mouseY >= 210 && mouseX <= 870 && mouseY <= 225)
         {
            pointerInfoText.text = Texts.fetch(209);
         }
         if(mouseX >= 810 && mouseY >= 290 && mouseX <= 870 && mouseY <= 305)
         {
            if(reloadAP > 0)
            {
               pointerInfoText.text = reloadAP + " " + Texts.fetch(1095);
            }
            else
            {
               pointerInfoText.text = Texts.fetch(193);
            }
         }
         if(mouseX >= 850 && mouseY >= 470 && mouseX <= 865 && mouseY <= 480)
         {
            pointerInfoText.text = Texts.fetch(28);
         }
         if(mouseX >= 595 && mouseY >= 455 && mouseX <= 625 && mouseY <= 485)
         {
            pointerInfoText.text = Texts.fetch(210);
         }
         if(mouseX >= 235 && mouseY >= 470 && mouseX <= 295 && mouseY <= 485)
         {
            if(healAP > 0)
            {
               pointerInfoText.text = healAP + " " + Texts.fetch(1095);
            }
            else
            {
               pointerInfoText.text = Texts.fetch(193);
            }
         }
         if(mouseX >= 510 && mouseY >= 470 && mouseX <= 570 && mouseY <= 485)
         {
            if(pickUpAP > 0)
            {
               pointerInfoText.text = pickUpAP + " " + Texts.fetch(1095);
            }
            else
            {
               pointerInfoText.text = Texts.fetch(193);
            }
         }
         pointerInfoText.visible = pointerInfoBG.visible = pointerInfoText.text.length > 0;
         if(stage is Object && pointerInfoText.visible)
         {
            _loc9_ = 15;
            _loc3_ = 5;
            _loc6_ = 5;
            _loc5_ = 20;
            _loc4_ = pointerInfoText.textWidth + _loc6_ * 2 + 4;
            _loc2_ = pointerInfoText.textHeight + _loc6_ * 2 + 4;
            pointerInfoBG.graphics.clear();
            pointerInfoBG.graphics.lineStyle(1,pointerInfoFGColor);
            pointerInfoBG.graphics.beginFill(pointerInfoBGColor);
            pointerInfoBG.graphics.drawRect(0 - _loc6_,0 - _loc6_,_loc4_,_loc2_);
            pointerInfoBG.graphics.endFill();
            if(mouseX + _loc4_ + _loc9_ < stage.stageWidth)
            {
               pointerInfoBG.x = pointerInfoText.x = mouseX + _loc9_ + _loc6_;
            }
            else
            {
               pointerInfoBG.x = pointerInfoText.x = mouseX - _loc9_ - _loc4_ + _loc6_;
            }
            if(mouseY + _loc2_ + _loc5_ < stage.stageHeight)
            {
               pointerInfoBG.y = pointerInfoText.y = mouseY + _loc5_;
            }
            else
            {
               pointerInfoBG.y = pointerInfoText.y = stage.stageHeight - _loc2_;
            }
         }
         if(clickableZone > 0)
         {
            buttonMode = true;
         }
         else
         {
            buttonMode = false;
         }
      }
      
      public function mouseWheel(param1:*) : *
      {
         if(stopped)
         {
            return;
         }
         if(param1.delta < 0)
         {
            battleField.pressButton("next weapon mode");
         }
         else
         {
            battleField.pressButton("prev weapon mode");
         }
      }
      
      internal function createStageEvents(param1:* = null) : *
      {
         stage.addEventListener("mouseLeave",releaseMouse,false,0,false);
         stage.addEventListener("mouseWheel",mouseWheel,false,0,false);
      }
      
      public function addMessage(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         if(param1 == 1)
         {
            _loc3_ = 5062143;
         }
         if(param1 == 2)
         {
            _loc3_ = 16777215;
         }
         if(param1 == 3)
         {
            _loc3_ = 4456448;
         }
         if(visibleMessages.length == 0)
         {
            _loc5_ = 0;
         }
         else
         {
            _loc5_ = visibleMessages[visibleMessages.length - 1].TF.y + 15;
         }
         var _loc4_:EngineText = new EngineText(param2,_loc3_,11,"left",5,_loc5_,640,20);
         addChild(_loc4_);
         _loc4_.cacheAsBitmap = true;
         visibleMessages.push({
            "TTL":250,
            "fade":30,
            "counter":0,
            "TF":_loc4_
         });
      }
      
      internal function remove() : *
      {
         removeEventListener("mouseDown",clickMouse);
         removeEventListener("mouseUp",releaseMouse);
         removeEventListener("enterFrame",EF);
         removeEventListener("addedToStage",createStageEvents);
         stage.removeEventListener("mouseLeave",releaseMouse);
         stage.removeEventListener("mouseWheel",mouseWheel);
         portraitHolder.buttonMode = false;
         buttonMode = false;
      }
      
      public function turnOnOff(param1:*) : *
      {
         var _loc2_:* = undefined;
         disabledScreen.visible = !param1;
         if(!param1)
         {
            pointerInfoBG.visible = false;
            pointerInfoText.visible = false;
         }
         _loc2_ = 0;
         while(_loc2_ < numChildren)
         {
            if(getChildAt(_loc2_) is Sprite)
            {
               if(Sprite(getChildAt(_loc2_)).buttonMode)
               {
                  Sprite(getChildAt(_loc2_)).mouseEnabled = param1;
               }
            }
            _loc2_++;
         }
      }
   }
}

