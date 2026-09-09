package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class CaravanMenu extends Sprite
   {
      
      public var category:* = 2;
      
      public var categoryButtonBodies:*;
      
      public var categoryButtonShining:*;
      
      public var bottomLineCapacity:*;
      
      public var bottomLinemoney:*;
      
      public var bottomLineDate:*;
      
      public var D:*;
      
      public var GD:*;
      
      public var categoriesMask:*;
      
      public var categoriesNormal:*;
      
      public var collectiveSkillValues:*;
      
      public var calculator:*;
      
      public var cursorInfo:*;
      
      public var manageContainers:*;
      
      public var withdrawFromUse:*;
      
      public var settingsWindow:*;
      
      public var freeDialogue:*;
      
      public var ConfirmDialogue:*;
      
      public var weightChartDialogue:*;
      
      public var messageDialogue:*;
      
      public var totalMenTitle:*;
      
      public var totalMenValue:*;
      
      public var volunteersTitle:*;
      
      public var volunteersValue:*;
      
      public var mercenariesTitle:*;
      
      public var mercenariesValue:*;
      
      public var prisonersTitle:*;
      
      public var prisonersValue:*;
      
      public var slavesTitle:*;
      
      public var slavesValue:*;
      
      public var otherTitle:*;
      
      public var otherValue:*;
      
      public var averageMoraleTitle:*;
      
      public var averageMoraleValue:*;
      
      public var totalSalaryTitle:*;
      
      public var totalSalaryValue:*;
      
      public var animalsTitle:*;
      
      public var animalsValue:*;
      
      public var cartsTitle:*;
      
      public var cartsValue:*;
      
      public var carsTitle:*;
      
      public var carsValue:*;
      
      public var maxCapacityTitle:*;
      
      public var maxCapacityValue:*;
      
      public var availableCapacityTitle:*;
      
      public var availableCapacityValue:*;
      
      public var maxSpeedTitle:*;
      
      public var maxSpeedValue:*;
      
      public var movingTitle:*;
      
      public var movingValue:*;
      
      public var visibilityTitle:*;
      
      public var visibilityValue:*;
      
      public var foodTitle:*;
      
      public var foodAvailable:*;
      
      public var foodProduced:*;
      
      public var foodConsumed:*;
      
      public var waterTitle:*;
      
      public var waterAvailable:*;
      
      public var waterProduced:*;
      
      public var waterConsumed:*;
      
      public var medsTitle:*;
      
      public var medsAvailable:*;
      
      public var medsProduced:*;
      
      public var medsConsumed:*;
      
      public var forageTitle:*;
      
      public var forageAvailable:*;
      
      public var forageProduced:*;
      
      public var forageConsumed:*;
      
      public var fuelTitle:*;
      
      public var fuelAvailable:*;
      
      public var fuelProduced:*;
      
      public var fuelConsumed:*;
      
      public var electricityTitle:*;
      
      public var electricityAvailable:*;
      
      public var electricityProduced:*;
      
      public var electricityConsumed:*;
      
      public var skillsWindow:*;
      
      public var crewPhotoBG:*;
      
      public var crewPhotoFG:*;
      
      public var crewPortrait:*;
      
      public var crewPortraitInside:*;
      
      public var crewList:*;
      
      public var crewName:*;
      
      public var crewNameFrame:*;
      
      public var crewHealthText:*;
      
      public var crewMoraleText:*;
      
      public var crewHealthBar:*;
      
      public var crewMoraleBar:*;
      
      public var crewPhysicalText:*;
      
      public var crewPhysicalValue:*;
      
      public var crewAgilityText:*;
      
      public var crewAgilityValue:*;
      
      public var crewAccuracyText:*;
      
      public var crewAccuracyValue:*;
      
      public var crewIntelligenceText:*;
      
      public var crewIntelligenceValue:*;
      
      public var crewDamagedPartsText:*;
      
      public var crewDamagedPartsValue:*;
      
      public var crewAPText:*;
      
      public var crewAPValue:*;
      
      public var crewSpeedText:*;
      
      public var crewSpeedValue:*;
      
      public var crewStateText:*;
      
      public var crewStateValue:*;
      
      public var crewSkillsAndExperiencesWindow:*;
      
      public var crewSkillsList:*;
      
      public var crewSkillsFrame:*;
      
      public var crewLearnignCapacityText:*;
      
      public var crewLearningCapacityValue:*;
      
      public var crewTotalExperienceText:*;
      
      public var crewTotalExperienceValue:*;
      
      public var crewBattleExperienceText:*;
      
      public var crewBattleExperienceValue:*;
      
      public var crewWeightText:*;
      
      public var crewWeightValue:*;
      
      public var crewOfIdealText:*;
      
      public var crewOfIdealValue:*;
      
      public var crewGDAText:*;
      
      public var crewGDAValue:*;
      
      public var crewWaterConsumptionText:*;
      
      public var crewWaterConsumptionValue:*;
      
      public var crewCapacityText:*;
      
      public var crewCapacityValue:*;
      
      public var selectedCrewMember:*;
      
      public var crewStatusText:*;
      
      public var crewSalaryText:*;
      
      public var crewPayDayText:*;
      
      public var crewAutoPayText:*;
      
      public var crewAutoPaySwitch:*;
      
      public var crewRaiseSalaryButton:*;
      
      public var crewDismissButton:*;
      
      public var crewFreeButton:*;
      
      public var crewEnslaveButton:*;
      
      public var crewRecruitButton:*;
      
      public var crewSlaughterButton:*;
      
      public var crewMeatLine:*;
      
      public var selectedEquipmentItem:*;
      
      public var selectedEquipmentPerson:*;
      
      public var equipmentPeopleList:*;
      
      public var equipmentItemsList:*;
      
      public var equipmentLines:*;
      
      public var equipmentItemPic:*;
      
      public var equipmentItemPicContent:*;
      
      public var equipmentItemName:*;
      
      public var equipButton:*;
      
      public var equipmentDescriptionFrame:*;
      
      public var equipmentItemEssencial1:*;
      
      public var equipmentItemEssencial2:*;
      
      public var equipmentDescriptionArea:*;
      
      public var equipmentDescriptionList:*;
      
      public var equipmentUncompatibleText:*;
      
      public var equipmentTooHeavyText:*;
      
      public var itemForRemoval:*;
      
      public var gotoItem:*;
      
      public var equipmentPersonPic:*;
      
      public var equipmentPersonPicContent:*;
      
      public var equipmentSlots:*;
      
      public var attachmentBatterySymbols:*;
      
      public var selectedEquipmentSlot:*;
      
      public var equipmentPersonName:*;
      
      public var equipmentPersonLoad:*;
      
      public var equipmentArmorInfo1:*;
      
      public var equipmentArmorInfo2:*;
      
      public var equipmentArmorInfo3:*;
      
      public var equipmentArmorSymbol1:*;
      
      public var equipmentArmorSymbol2:*;
      
      public var equipmentArmorSymbol3:*;
      
      public var defaultAmmoTitles:*;
      
      public var defaultAmmoFrames:*;
      
      public var defaultAmmoButtons:*;
      
      public var defaultAmmoTexts:*;
      
      public var equipmentList:*;
      
      public var equipmentInventoryTitle:*;
      
      public var equipmentButtons:*;
      
      public var equipmentPersonData:*;
      
      public var equipmentPersonDataFrame:*;
      
      public var groupSelectBodies:*;
      
      public var groupSelectShining:*;
      
      public var groupNameTexts:*;
      
      public var groupsSelected:* = 0;
      
      public var groupsLines:*;
      
      public var currentGroupPeople:*;
      
      public var currentGroupMoraleText:*;
      
      public var groupsTotalPeopleText:*;
      
      public var groupsSameAsOtherSwitch:*;
      
      public var groupsSameAsOtherText:*;
      
      public var groupsAvailableSameAsOtherOptions:*;
      
      public var groupsSameAsOtherIndex:* = 0;
      
      public var groupsFoodstuffs:*;
      
      public var groupsMedicineDistribution:*;
      
      public var groupsSameAsAnotherFoodConsumption:*;
      
      public var groupsSameAsAnotherWaterConsumption:*;
      
      public var groupsSameAsAnotherMedicineConsumption:*;
      
      public var groupsSameAsOtherFrame:*;
      
      public var groupsSameAsOtherGroupName:*;
      
      public var groupsNextSameAsOtherButton:*;
      
      public var groupsPrevSameAsOtherButton:*;
      
      public var groupsFrame:*;
      
      public var groupsFoodRationsTitle:*;
      
      public var groupsFoodRationsFrame:*;
      
      public var groupsFoodRationsText:*;
      
      public var groupsFoodRationsPlusButton:*;
      
      public var groupsFoodRationsMinusButton:*;
      
      public var groupsFoodstuffsText:*;
      
      public var groupsFoodstuffsFrame:*;
      
      public var groupsFoodstuffsArea:*;
      
      public var groupsFoodConsumption:*;
      
      public var groupsWaterRationsTitle:*;
      
      public var groupsWaterRationsFrame:*;
      
      public var groupsWaterRationsText:*;
      
      public var groupsWaterRationsPlusButton:*;
      
      public var groupsWaterRationsMinusButton:*;
      
      public var groupsWaterConsumption:*;
      
      public var groupsMedicineDistributionTitle:*;
      
      public var groupsMedicineConsumption:*;
      
      public var groupsFoodstuffsHeaderAvailable:*;
      
      public var groupsFoodstuuffsHeaderConsumed:*;
      
      public var groupsFoodstuuffsHeaderPercent:*;
      
      public var transportList:*;
      
      public var transportNoTransportText:*;
      
      public var selectedTransport:*;
      
      public var transportName:*;
      
      public var transportTextLines:*;
      
      public var transportWindPoweredText:*;
      
      public var animalPregnancyLine1:*;
      
      public var animalPregnancyLine2:*;
      
      public var transportPicBG:*;
      
      public var transportPicFG:*;
      
      public var transportNameFrame:*;
      
      public var transportHealthText:*;
      
      public var transportHealthFrame:*;
      
      public var transportHealthBar:*;
      
      public var transportAbandonButton:*;
      
      public var transportAnimalAgeTitle:*;
      
      public var transportAnimalAgeValue:*;
      
      public var transportAnimalMeatTitle:*;
      
      public var transportAnimalMeatValue:*;
      
      public var transportAnimalSlaughterButton:*;
      
      public var transportAnimalSkinTitle:*;
      
      public var transportAnimalSkinValue:*;
      
      public var transportAnimalRenameButton:*;
      
      public var transportPicSymbols:*;
      
      public var transportCartLubricantText:*;
      
      public var transportCartLubricantFrame:*;
      
      public var transportCartLubricantBar:*;
      
      public var transportCartLubricantButton:*;
      
      public var transportCarWaterText:*;
      
      public var transportCarLubricantText:*;
      
      public var transportCarFrames:*;
      
      public var transportCarWaterBar:*;
      
      public var transportCarLubricantBar:*;
      
      public var transportCarWaterButton:*;
      
      public var transportCarLubricantButton:*;
      
      public var transportChangeNameWindow:*;
      
      public var cartsAnimalsList:*;
      
      public var cartsCartsList:*;
      
      public var cartsNoCartsText:*;
      
      public var cartsLines:*;
      
      public var cartsSelectedCartPicHolder:*;
      
      public var cartsSelectedAnimal:*;
      
      public var cartsSelectedCart:*;
      
      public var cartsAnimalPicHolder:*;
      
      public var cartsAnimalPic:*;
      
      public var cartsAnimalPicInside:*;
      
      public var cartsAnimalName:*;
      
      public var cartsAnimalHealthText:*;
      
      public var cartsAnimalHealthFrame:*;
      
      public var cartsAnimalHealthBar:*;
      
      public var cartsAnimalCapacityTitle:*;
      
      public var cartsAnimalCapacityValue:*;
      
      public var cartsAnimalPassengersTitle:*;
      
      public var cartsAnimalPassengersValue:*;
      
      public var cartsAnimalSpeedTitle:*;
      
      public var cartsAnimalSpeedValue:*;
      
      public var cartsAttachedCartPicHolder:*;
      
      public var cartsAttachedCartPic:*;
      
      public var cartsAttachedCartPicInside:*;
      
      public var cartsAttachedCartName:*;
      
      public var cartsAttachedCartHealthText:*;
      
      public var cartsAttachedCartHealthFrame:*;
      
      public var cartsAttachedCartHealthBar:*;
      
      public var cartsAttachedCartCapacityTitle:*;
      
      public var cartsAttachedCartCapacityValue:*;
      
      public var cartsAttachedCartPassengersTitle:*;
      
      public var cartsAttachedCartPassengersValue:*;
      
      public var cartsAttachedCartCapacityMultiplierTitle:*;
      
      public var cartsAttachedCartCapacityMultiplierValue:*;
      
      public var cartsAttachedCartWeightTitle:*;
      
      public var cartsAttachedCartWeightValue:*;
      
      public var cartsCombinedCapacityText:*;
      
      public var cartsCombinedPassengersText:*;
      
      public var cartsDetachButton:*;
      
      public var cartsSelectedCartPicInside:*;
      
      public var cartsSelectedCartPic:*;
      
      public var cartsSelectedCartFrame:*;
      
      public var cartsSelectedCartName:*;
      
      public var cartsSelectedCartCapacityTitle:*;
      
      public var cartsSelectedCartCapacityValue:*;
      
      public var cartsSelectedCartPassengersTitle:*;
      
      public var cartsSelectedCartPassengersValue:*;
      
      public var cartsSelectedCartCapacityMultiplierTitle:*;
      
      public var cartsSelectedCartCapacityMultiplierValue:*;
      
      public var cartsSelectedCartWeightTitle:*;
      
      public var cartsSelectedCartWeightValue:*;
      
      public var cartsSelectedCartAttachButton:*;
      
      public var cartsTooHeavyText:*;
      
      public var cartsSelectedCartHealthText:*;
      
      public var cartsSelectedCartHealthFrame:*;
      
      public var cartsSelectedCartHealthBar:*;
      
      public var cartsSelectedCartExpectedCapacityValue:*;
      
      public var passengersSelectedTransport:*;
      
      public var passengersSelectedPassenger:*;
      
      public var passengersTransportPassengers:*;
      
      public var passengersTransportList:*;
      
      public var passengersPassengersList:*;
      
      public var passengersNoTransportText:*;
      
      public var passengersTransportPicBG:*;
      
      public var passengersCartPicBG:*;
      
      public var passengersTransportPicInside:*;
      
      public var passengersCartPicInside:*;
      
      public var passengersTransportNameFrame:*;
      
      public var passengersPlusSign:*;
      
      public var passengersLines:*;
      
      public var passengersPassengerNameFrame:*;
      
      public var passengersPassengerPicBG:*;
      
      public var passengersPassengerPicInside:*;
      
      public var passengersTransportPic:*;
      
      public var passengersCartPic:*;
      
      public var passengersTransportName:*;
      
      public var passengersTransportCapacityText:*;
      
      public var passengersTransportPassengersText:*;
      
      public var passengersTransportNoPassengersButton:*;
      
      public var passengersTransportAreaFrame:*;
      
      public var passengersTransportArea:*;
      
      public var passengersPassengerName:*;
      
      public var passengersPassengerPic:*;
      
      public var passengersPassengerHealthText:*;
      
      public var passengersPassengerHealthFrame:*;
      
      public var passengersPassengerHealthBar:*;
      
      public var passengersPassengerSpeedTitle:*;
      
      public var passengersPassengerSpeedValue:*;
      
      public var passengersPassengerCapacityTitle:*;
      
      public var passengersPassengerCapacityValue:*;
      
      public var passengersPassengerPassengersTitle:*;
      
      public var passengersPassengerPassengersValue:*;
      
      public var passengersPassengerWeightText:*;
      
      public var passengersPassengerSpacesTitle:*;
      
      public var passengersPassengerSpacesValue:*;
      
      public var passengersPassengerSeatButton:*;
      
      public var passengersPassengerCantSeatText:*;
      
      public var cargoList:*;
      
      public var cargoSelected:*;
      
      public var cargoPicBG:*;
      
      public var cargoPic:*;
      
      public var cargoPicInside:*;
      
      public var cargoInfoTitles:*;
      
      public var cargoInfoValues:*;
      
      public var cargoName:*;
      
      public var cargoNameFrame:*;
      
      public var weightPerUnitTitle:*;
      
      public var weightPerUnitValue:*;
      
      public var inUseText:*;
      
      public var availableAmountText:*;
      
      public var totalWeightTitle:*;
      
      public var totalWeightValue:*;
      
      public var pricePerUnitTitle:*;
      
      public var pricePerUnitValue:*;
      
      public var warningText:*;
      
      public var seePricesButton:*;
      
      public var additionalInfoText:*;
      
      public var additionalInfoFrame:*;
      
      public var cargoInfoArea:*;
      
      public var cargoCategoryText:*;
      
      public var cargoThrowAwayButton:*;
      
      public var cargoReadButton:*;
      
      public var cargoWeightChartButton:*;
      
      public var cargoRemoveFromUseButton:*;
      
      public var cargoManageContainersButton:*;
      
      public var cargoNotInUseText:*;
      
      public var cargoAvailableVolumeText:*;
      
      public var cargoDeviceOnOffButton:*;
      
      public var workshopArea:*;
      
      public var workshopItems:*;
      
      public var logFG:*;
      
      public var logBookmarks:*;
      
      public var logLayer:*;
      
      public var logNoise:*;
      
      public var logAlphas:*;
      
      public var logPages:*;
      
      public var logCurrName:*;
      
      public var economyGraph:*;
      
      public var knownPricesArea:*;
      
      public var knownPricesInd:* = 0;
      
      public var knownPricesItems:*;
      
      public var logCategories:*;
      
      public var currLogCategory:* = 0;
      
      public var logBookmarkWidth:*;
      
      private const logCategoryNames:*;
      
      private const logBookmarkGap:* = 5;
      
      public var readDialogue:*;
      
      public var stopped:* = false;
      
      public var skillsScrollable:*;
      
      public function CaravanMenu(param1:*, param2:* = null)
      {
         var categoryButtonYs:*;
         var i:*;
         var t:*;
         var categoryButtonsTextBitmap:*;
         var CT:*;
         var categoryButtonsTextMask:*;
         var txt:*;
         var categoryButtonsTexts:*;
         var availableTitle:*;
         var producedTitle:*;
         var consumedTitle:*;
         var distributeGroupTitle:*;
         var distributeWeaponsAndAmmoButton:*;
         var distributeAmmoOnlyButton:*;
         var distributeArmorButton:*;
         var distributeWeaponsAndAmmoText:*;
         var distributeAmmoOnlyText:*;
         var distributeArmorText:*;
         var distributeCartsButton:*;
         var distributePassengersButton:*;
         var distributeNoPassengersButton:*;
         var distributeCartsText:*;
         var distributePassengersText:*;
         var distributeNoPassengersText:*;
         var seeSkillsButton:*;
         var overviewSettingsButton:*;
         var overviewWeightChartButton:*;
         var overviewManageContainersButton:*;
         var skillsWindowDialogue:*;
         var skillWindowCloseButton:*;
         var skillsWindowDarkenBG:*;
         var collectiveSkillNames:*;
         var clearBmp:*;
         var separationLine:*;
         var yPos:*;
         var slotSettings:*;
         var slotNum:*;
         var symbol:*;
         var n:*;
         var j:*;
         var workshopAreaBG:*;
         var workshopAreaFrame:*;
         var setGD:* = param1;
         var setCategory:* = param2;
         categoryButtonBodies = [];
         categoryButtonShining = [];
         knownPricesItems = [];
         logCategoryNames = [null,2176,2177,2179];
         super();
         addEventListener("enterFrame",cursorControl,false,0,false);
         addEventListener("mouseUp",releaseButton,false,0,false);
         visible = false;
         GD = setGD;
         if(setCategory != null)
         {
            category = setCategory;
         }
         D = new Dialogue(880,495);
         if(GD.storyMode)
         {
            logCategories = [1,2,3];
         }
         else
         {
            logCategories = [1,3];
         }
         categoryButtonYs = [12,52,102,142,182,232,272,312,362,402,452];
         bottomLineCapacity = new EngineText("",16777215,14,"left",10,472,640,20);
         D.addToMask(bottomLineCapacity);
         bottomLineDate = new EngineText("",16777215,14,"right",10,472,640,20);
         D.addToMask(bottomLineDate);
         bottomLinemoney = new EngineText("",16777215,14,"left",250,472,640,20);
         D.addToMask(bottomLinemoney);
         updateBottomLine();
         i = 0;
         while(i <= 10)
         {
            categoryButtonBodies[i] = new Sprite();
            t = new ImportedBitmap("CaravanMenuCategoryButton.png");
            categoryButtonBodies[i].addChild(t);
            categoryButtonBodies[i].buttonMode = true;
            categoryButtonBodies[i].mouseEnabled = i != category;
            categoryButtonBodies[i].addEventListener("click",categoryButtonEvent,false,0,false);
            categoryButtonBodies[i].x = 668;
            categoryButtonBodies[i].y = categoryButtonYs[i] - 2;
            D.addChild(categoryButtonBodies[i]);
            i = Number(i) + 1;
         }
         i = 0;
         while(i <= 10)
         {
            categoryButtonShining[i] = new Sprite();
            t = new ImportedBitmap("CaravanMenuCategoryButtonShine.png");
            categoryButtonShining[i].addChild(t);
            categoryButtonShining[i].mouseEnabled = false;
            categoryButtonShining[i].mouseChildren = false;
            categoryButtonShining[i].x = 645;
            categoryButtonShining[i].y = categoryButtonYs[i] - 25;
            categoryButtonShining[i].visible = i == category;
            D.addChild(categoryButtonShining[i]);
            i = Number(i) + 1;
         }
         categoryButtonsTextBitmap = new ImportedBitmap("InterfaceForeground.png");
         CT = new ColorTransform(0,0,0);
         categoryButtonsTextBitmap.transform.colorTransform = CT;
         categoryButtonsTextBitmap.cacheAsBitmap = true;
         D.addChild(categoryButtonsTextBitmap);
         categoryButtonsTextMask = new Sprite();
         categoryButtonsTextMask.mouseEnabled = categoryButtonsTextMask.mouseChildren = false;
         categoryButtonsTextMask.cacheAsBitmap = true;
         D.addChild(categoryButtonsTextMask);
         categoryButtonsTextBitmap.mask = categoryButtonsTextMask;
         categoryButtonsTexts = [];
         i = 0;
         while(i <= 10)
         {
            if(i == 5)
            {
               txt = Texts.fetch(897,1,19).toUpperCase();
               txt += "/" + Texts.fetch(1176,null,20 - txt.length).toUpperCase();
            }
            else if(i == 4)
            {
               txt = Texts.fetch(1427,1,19).toUpperCase();
            }
            else
            {
               txt = Texts.fetch(892 + i,1,19).toUpperCase();
            }
            categoryButtonsTexts[i] = new EngineText(txt,16777215,14,"center",670,categoryButtonYs[i] + 6,200,16);
            categoryButtonsTextMask.addChild(categoryButtonsTexts[i]);
            i = Number(i) + 1;
         }
         D.drawVerticalLine(660,0,495);
         D.drawHorizontalLine(472,0,660);
         categoriesMask = [];
         categoriesNormal = [];
         i = 0;
         while(i <= 9)
         {
            categoriesMask[i] = new Sprite();
            categoriesNormal[i] = new Sprite();
            i = Number(i) + 1;
         }
         totalMenTitle = new EngineText("TOTAL MEN:",16777215,14,"left",10,12,200,20);
         totalMenValue = new EngineText("0",16777215,14,"right",10,12,200,20);
         volunteersTitle = new EngineText("VOLUNTEERS:",16777215,14,"left",10,32,200,20);
         volunteersValue = new EngineText("0",16777215,14,"right",10,32,200,20);
         mercenariesTitle = new EngineText("MERCENARIES:",16777215,14,"left",10,52,200,20);
         mercenariesValue = new EngineText("0",16777215,14,"right",10,52,200,20);
         prisonersTitle = new EngineText("PRISONERS:",16777215,14,"left",10,72,200,20);
         prisonersValue = new EngineText("0",16777215,14,"right",10,72,200,20);
         slavesTitle = new EngineText("SLAVES:",16777215,14,"left",10,92,200,20);
         slavesValue = new EngineText("0",16777215,14,"right",10,92,200,20);
         otherTitle = new EngineText("OTHER:",16777215,14,"left",10,112,200,20);
         otherValue = new EngineText("0",16777215,14,"right",10,112,200,20);
         averageMoraleTitle = new EngineText("AVERAGE MORALE:",16777215,14,"left",230,12,200,20);
         averageMoraleValue = new EngineText("0",16777215,14,"right",230,12,200,20);
         totalSalaryTitle = new EngineText("TOTAL SALARY:",16777215,14,"left",230,32,200,20);
         totalSalaryValue = new EngineText("0",16777215,14,"right",230,32,200,20);
         animalsTitle = new EngineText("ANIMALS:",16777215,14,"left",230,72,200,20);
         animalsValue = new EngineText("0",16777215,14,"right",230,72,200,20);
         cartsTitle = new EngineText("CARTS:",16777215,14,"left",230,92,200,20);
         cartsValue = new EngineText("0",16777215,14,"right",230,92,200,20);
         carsTitle = new EngineText("CARS:",16777215,14,"left",230,112,200,20);
         carsValue = new EngineText("0",16777215,14,"right",230,112,200,20);
         maxCapacityTitle = new EngineText("MAXIMUM CAPACITY:",16777215,14,"left",450,12,200,20);
         maxCapacityValue = new EngineText("0",16777215,14,"right",450,12,200,20);
         availableCapacityTitle = new EngineText("AVAILABLE CAPACITY:",16777215,14,"left",450,32,200,20);
         availableCapacityValue = new EngineText("0",16777215,14,"right",450,32,200,20);
         maxSpeedTitle = new EngineText("MAXIMUM SPEED:",16777215,14,"left",450,72,200,20);
         maxSpeedValue = new EngineText("0",16777215,14,"right",450,72,200,20);
         movingTitle = new EngineText("MOVING:",16777215,14,"left",450,92,200,20);
         movingValue = new EngineText("YES",16777215,14,"right",450,92,200,20);
         visibilityTitle = new EngineText("VISIBILITY:",16777215,14,"left",450,112,200,20);
         visibilityValue = new EngineText("0",16777215,14,"right",450,112,200,20);
         availableTitle = new EngineText(Texts.fetch(920).toUpperCase() + ":",16777215,14,"center",175,152,150,20);
         producedTitle = new EngineText(Texts.fetch(921).toUpperCase() + ":",16777215,14,"center",335,152,150,20);
         consumedTitle = new EngineText(Texts.fetch(922).toUpperCase() + ":",16777215,14,"center",495,152,150,20);
         foodTitle = new EngineText(Texts.fetch(15).toUpperCase() + ":",16777215,14,"left",10,177,260,20);
         foodAvailable = new EngineText("0",16777215,12,"center",120,178,260,20);
         foodProduced = new EngineText("0",16777215,12,"center",280,178,260,20);
         foodConsumed = new EngineText("0",16777215,12,"center",440,178,260,20);
         waterTitle = new EngineText(Texts.fetch(14).toUpperCase() + ":",16777215,14,"left",10,200,260,20);
         waterAvailable = new EngineText("0",16777215,12,"center",120,201,260,20);
         waterProduced = new EngineText("0",16777215,12,"center",280,201,260,20);
         waterConsumed = new EngineText("0",16777215,12,"center",440,201,260,20);
         medsTitle = new EngineText(Texts.fetch(16).toUpperCase() + ":",16777215,14,"left",10,223,260,20);
         medsAvailable = new EngineText("0",16777215,12,"center",120,224,260,20);
         medsProduced = new EngineText("0",16777215,12,"center",280,224,260,20);
         medsConsumed = new EngineText("0",16777215,12,"center",440,224,260,20);
         forageTitle = new EngineText(Texts.fetch(17).toUpperCase() + ":",16777215,14,"left",10,246,260,20);
         forageAvailable = new EngineText("0",16777215,12,"center",120,247,260,20);
         forageProduced = new EngineText("0",16777215,12,"center",280,247,260,20);
         forageConsumed = new EngineText("0",16777215,12,"center",440,247,260,20);
         fuelTitle = new EngineText(Texts.fetch(18).toUpperCase() + ":",16777215,14,"left",10,269,260,20);
         fuelAvailable = new EngineText("0",16777215,12,"center",120,270,260,20);
         fuelProduced = new EngineText("0",16777215,12,"center",280,270,260,20);
         fuelConsumed = new EngineText("0",16777215,12,"center",440,270,260,20);
         electricityTitle = new EngineText(Texts.fetch(19).toUpperCase() + ":",16777215,14,"left",10,292,260,20);
         electricityAvailable = new EngineText("0",16777215,12,"center",120,293,260,20);
         electricityProduced = new EngineText("0",16777215,12,"center",280,293,260,20);
         electricityConsumed = new EngineText("0",16777215,12,"center",440,293,260,20);
         distributeGroupTitle = new EngineText(Texts.fetch(923).toUpperCase(),16777215,14,"center",10,332,420,20);
         distributeWeaponsAndAmmoButton = new Button(1,distributeWeaponsAndAmmoFunction);
         distributeWeaponsAndAmmoButton.scaleX = distributeWeaponsAndAmmoButton.scaleY = 0.8;
         distributeWeaponsAndAmmoButton.x = 20;
         distributeWeaponsAndAmmoButton.y = 362;
         distributeAmmoOnlyButton = new Button(1,distributeAmmoOnlyFunction);
         distributeAmmoOnlyButton.scaleX = distributeAmmoOnlyButton.scaleY = 0.8;
         distributeAmmoOnlyButton.x = 20;
         distributeAmmoOnlyButton.y = 392;
         distributeArmorButton = new Button(1,distributeArmorFunction);
         distributeArmorButton.scaleX = distributeArmorButton.scaleY = 0.8;
         distributeArmorButton.x = 20;
         distributeArmorButton.y = 422;
         distributeWeaponsAndAmmoText = new EngineText(Texts.fetch(924).toUpperCase(),16777215,14,"left",60,347,160,40,true,true);
         distributeWeaponsAndAmmoText.y = 377 - Math.min(distributeWeaponsAndAmmoText.textHeight,distributeWeaponsAndAmmoText.height) / 2 - 2;
         distributeAmmoOnlyText = new EngineText(Texts.fetch(925).toUpperCase(),16777215,14,"left",60,387,160,40,true,true);
         distributeAmmoOnlyText.y = 407 - Math.min(distributeAmmoOnlyText.textHeight,distributeAmmoOnlyText.height) / 2 - 2;
         distributeArmorText = new EngineText(Texts.fetch(926).toUpperCase(),16777215,14,"left",60,427,160,40,true,true);
         distributeArmorText.y = 437 - Math.min(distributeArmorText.textHeight,distributeArmorText.height) / 2 - 2;
         distributeCartsButton = new Button(1,distributeCartsFunction);
         distributeCartsButton.scaleX = distributeCartsButton.scaleY = 0.8;
         distributeCartsButton.x = 230;
         distributeCartsButton.y = 362;
         distributePassengersButton = new Button(1,distributePassengersFunction);
         distributePassengersButton.scaleX = distributePassengersButton.scaleY = 0.8;
         distributePassengersButton.x = 230;
         distributePassengersButton.y = 392;
         distributeNoPassengersButton = new Button(1,distributeNoPassengersFunction);
         distributeNoPassengersButton.scaleX = distributeNoPassengersButton.scaleY = 0.8;
         distributeNoPassengersButton.x = 230;
         distributeNoPassengersButton.y = 422;
         distributeCartsText = new EngineText(Texts.fetch(898).toUpperCase(),16777215,14,"left",270,347,160,40,true);
         distributeCartsText.y = 377 - distributeCartsText.textHeight / 2 - 2;
         distributePassengersText = new EngineText(Texts.fetch(899).toUpperCase(),16777215,14,"left",270,387,160,40,true);
         distributePassengersText.y = 407 - distributePassengersText.textHeight / 2 - 2;
         distributeNoPassengersText = new EngineText(Texts.fetch(927).toUpperCase(),16777215,14,"left",270,427,160,40,true);
         distributeNoPassengersText.y = 437 - distributeNoPassengersText.textHeight / 2 - 2;
         seeSkillsButton = new Button(2,seeSkillsFunction,Texts.fetch(928).toUpperCase());
         seeSkillsButton.x = 447;
         seeSkillsButton.y = 329;
         overviewSettingsButton = new Button(2,function():*
         {
            settingsWindow.visible = true;
         },Texts.fetch(36).toUpperCase());
         overviewSettingsButton.x = 447;
         overviewSettingsButton.y = 366;
         categoriesNormal[0].addChild(overviewSettingsButton);
         overviewWeightChartButton = new Button(2,function():*
         {
            weightChartDialogue.disp.visible = true;
            redrawWeightChart();
         },Texts.fetch(1202).toUpperCase());
         overviewWeightChartButton.x = 447;
         overviewWeightChartButton.y = 402;
         categoriesNormal[0].addChild(overviewWeightChartButton);
         overviewManageContainersButton = new Button(2,openManageContainers,Texts.fetch(1216).toUpperCase());
         overviewManageContainersButton.x = 447;
         overviewManageContainersButton.y = 439;
         categoriesNormal[0].addChild(overviewManageContainersButton);
         skillsWindow = new Sprite();
         skillsWindow.graphics.beginFill(0,0.5);
         skillsWindow.graphics.drawRect(0,0,880,495);
         skillsWindowDialogue = new Dialogue(400,400);
         skillsWindowDialogue.x = 240;
         skillsWindowDialogue.y = 48;
         skillsWindow.addChild(skillsWindowDialogue);
         skillWindowCloseButton = new Button(2,closeSkillsWindow,Texts.fetch(902).toUpperCase());
         skillWindowCloseButton.x = 97;
         skillWindowCloseButton.y = 357;
         skillsWindowDialogue.addChild(skillWindowCloseButton);
         skillsWindowDarkenBG = new Sprite();
         skillsWindowDarkenBG.graphics.beginFill(4208688,0.7);
         skillsWindowDarkenBG.graphics.drawRect(0,0,360,320);
         skillsWindowDarkenBG.x = 20;
         skillsWindowDarkenBG.y = 20;
         skillsWindowDialogue.addChild(skillsWindowDarkenBG);
         skillsWindowDialogue.drawRectangle(19,19,362,322,true);
         skillsScrollable = new ScrollableArea(345,320,345,320,true,false,false,3);
         skillsScrollable.x = 20;
         skillsScrollable.y = 20;
         skillsWindowDialogue.addChild(skillsScrollable);
         skillsWindow.visible = false;
         collectiveSkillNames = [];
         collectiveSkillValues = [];
         for(i in Caravan.skillsList)
         {
            collectiveSkillNames[i] = new EngineText(Texts.fetch(Caravan.skillsList[i].name).toUpperCase(),16777215,14,"left",10,10 + i * 40,325,20);
            collectiveSkillValues[i] = new EngineText(Math.round(GD.Caravans[0][Caravan.skillsList[i].varName] * Caravan.skillsList[i].multiplier),16777215,14,"right",10,10 + i * 40,325,20);
            skillsScrollable.addContent(collectiveSkillNames[i]);
            skillsScrollable.addContent(collectiveSkillValues[i]);
         }
         categoriesMask[0].addChild(totalMenTitle);
         categoriesMask[0].addChild(totalMenValue);
         categoriesMask[0].addChild(volunteersTitle);
         categoriesMask[0].addChild(volunteersValue);
         categoriesMask[0].addChild(mercenariesTitle);
         categoriesMask[0].addChild(mercenariesValue);
         categoriesMask[0].addChild(prisonersTitle);
         categoriesMask[0].addChild(prisonersValue);
         categoriesMask[0].addChild(slavesTitle);
         categoriesMask[0].addChild(slavesValue);
         categoriesMask[0].addChild(otherTitle);
         categoriesMask[0].addChild(otherValue);
         categoriesMask[0].addChild(averageMoraleTitle);
         categoriesMask[0].addChild(averageMoraleValue);
         categoriesMask[0].addChild(totalSalaryTitle);
         categoriesMask[0].addChild(totalSalaryValue);
         categoriesMask[0].addChild(animalsTitle);
         categoriesMask[0].addChild(animalsValue);
         categoriesMask[0].addChild(cartsTitle);
         categoriesMask[0].addChild(cartsValue);
         categoriesMask[0].addChild(carsTitle);
         categoriesMask[0].addChild(carsValue);
         categoriesMask[0].addChild(maxCapacityTitle);
         categoriesMask[0].addChild(maxCapacityValue);
         categoriesMask[0].addChild(availableCapacityTitle);
         categoriesMask[0].addChild(availableCapacityValue);
         categoriesMask[0].addChild(maxSpeedTitle);
         categoriesMask[0].addChild(maxSpeedValue);
         categoriesMask[0].addChild(movingTitle);
         categoriesMask[0].addChild(movingValue);
         categoriesMask[0].addChild(visibilityTitle);
         categoriesMask[0].addChild(visibilityValue);
         categoriesMask[0].graphics.lineStyle(1,16777215);
         categoriesMask[0].graphics.moveTo(220,12);
         categoriesMask[0].graphics.lineTo(220,142);
         categoriesMask[0].graphics.moveTo(440,12);
         categoriesMask[0].graphics.lineTo(440,142);
         categoriesMask[0].graphics.moveTo(10,142);
         categoriesMask[0].graphics.lineTo(650,142);
         categoriesMask[0].addChild(availableTitle);
         categoriesMask[0].addChild(producedTitle);
         categoriesMask[0].addChild(consumedTitle);
         categoriesMask[0].addChild(foodTitle);
         categoriesMask[0].addChild(foodAvailable);
         categoriesMask[0].addChild(foodProduced);
         categoriesMask[0].addChild(foodConsumed);
         categoriesMask[0].addChild(waterTitle);
         categoriesMask[0].addChild(waterAvailable);
         categoriesMask[0].addChild(waterProduced);
         categoriesMask[0].addChild(waterConsumed);
         categoriesMask[0].addChild(medsTitle);
         categoriesMask[0].addChild(medsAvailable);
         categoriesMask[0].addChild(medsProduced);
         categoriesMask[0].addChild(medsConsumed);
         categoriesMask[0].addChild(forageTitle);
         categoriesMask[0].addChild(forageAvailable);
         categoriesMask[0].addChild(forageProduced);
         categoriesMask[0].addChild(forageConsumed);
         categoriesMask[0].addChild(fuelTitle);
         categoriesMask[0].addChild(fuelAvailable);
         categoriesMask[0].addChild(fuelProduced);
         categoriesMask[0].addChild(fuelConsumed);
         categoriesMask[0].addChild(electricityTitle);
         categoriesMask[0].addChild(electricityAvailable);
         categoriesMask[0].addChild(electricityProduced);
         categoriesMask[0].addChild(electricityConsumed);
         categoriesMask[0].graphics.drawRect(10,332,420,130);
         categoriesMask[0].addChild(distributeGroupTitle);
         categoriesMask[0].graphics.moveTo(10,352);
         categoriesMask[0].graphics.lineTo(430,352);
         categoriesNormal[0].addChild(distributeWeaponsAndAmmoButton);
         categoriesNormal[0].addChild(distributeAmmoOnlyButton);
         categoriesNormal[0].addChild(distributeArmorButton);
         categoriesMask[0].addChild(distributeWeaponsAndAmmoText);
         categoriesMask[0].addChild(distributeAmmoOnlyText);
         categoriesMask[0].addChild(distributeArmorText);
         categoriesNormal[0].addChild(distributeCartsButton);
         categoriesNormal[0].addChild(distributePassengersButton);
         categoriesNormal[0].addChild(distributeNoPassengersButton);
         categoriesMask[0].addChild(distributeCartsText);
         categoriesMask[0].addChild(distributePassengersText);
         categoriesMask[0].addChild(distributeNoPassengersText);
         categoriesNormal[0].addChild(seeSkillsButton);
         categoriesNormal[0].addChild(skillsWindow);
         logBookmarks = [];
         logBookmarkWidth = (640 - (logCategories.length - 1) * 5) / logCategories.length;
         logBookmarks = [];
         for(i in logCategories)
         {
            logBookmarks[i] = {};
            logBookmarks[i].disp = new Sprite();
            logBookmarks[i].disp.graphics.beginBitmapFill(new ImportedBitmap("TownBG.jpg").bitmapData);
            logBookmarks[i].disp.graphics.drawRect(0,0,logBookmarkWidth,30);
            logBookmarks[i].disp.x = 10 + i * (logBookmarkWidth + 5);
            logBookmarks[i].disp.y = 12;
            logBookmarks[i].darken = new Sprite();
            logBookmarks[i].darken.graphics.beginFill(0,0.3);
            logBookmarks[i].darken.graphics.drawRect(0,0,logBookmarkWidth,30);
            logBookmarks[i].disp.addChild(logBookmarks[i].darken);
            logBookmarks[i].disp.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
            logBookmarks[i].text = new EngineText(Texts.fetch(logCategoryNames[logCategories[i]],null,Math.floor((logBookmarkWidth - 10) / 9)).toUpperCase(),16777215,14,"center",5,5,logBookmarkWidth - 10,20);
            logBookmarks[i].alpha = 0.7;
            logBookmarks[i].disp.addChild(logBookmarks[i].text);
            logBookmarks[i].category = logCategories[i];
            logBookmarks[i].disp.buttonMode = true;
            logBookmarks[i].disp.mouseChildren = false;
            logBookmarks[i].disp.addEventListener("click",clickOnLogBookmark,false,0,false);
            categoriesNormal[1].addChild(logBookmarks[i].disp);
         }
         logFG = new Sprite();
         logFG.x = 10;
         logFG.y = 10;
         logFG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         categoriesNormal[1].addChild(logFG);
         CT = new ColorTransform(0.3,0.2,0.1);
         logLayer = new Sprite();
         logNoise = new ImportedBitmap("InterfaceForeground.png");
         logNoise.transform.colorTransform = CT;
         logNoise.x = -230;
         logNoise.y = -35;
         logLayer.addChild(logNoise);
         logLayer.blendMode = "layer";
         logAlphas = new Sprite();
         logAlphas.blendMode = "alpha";
         logLayer.addChild(logAlphas);
         clearBmp = new Bitmap(new BitmapData(880,495,true,0));
         clearBmp.x = -230;
         clearBmp.y = -35;
         logAlphas.addChild(clearBmp);
         logAlphas.mouseEnabled = false;
         logLayer.mouseEnabled = false;
         logCurrName = new EngineText("",0,14,"center",15,15,logBookmarkWidth - 10,20);
         logAlphas.addChild(logCurrName);
         logPages = [];
         for(i in logCategories)
         {
            logPages[i] = {};
            logPages[i].disp = new Sprite();
            switch(logCategories[i])
            {
               case 1:
                  economyGraph = new ConsProdGraph(620,180);
                  economyGraph.x = 20;
                  economyGraph.y = 50;
                  categoriesNormal[1].addChild(economyGraph);
                  separationLine = new Sprite();
                  separationLine.graphics.beginFill(0);
                  separationLine.graphics.drawRect(0,-1,640,2);
                  separationLine.x = 10;
                  separationLine.y = 240;
                  logPages[i].disp.addChild(separationLine);
                  knownPricesArea = {};
                  knownPricesArea.disp = new Sprite();
                  knownPricesArea.priceFor = new EngineText(Texts.fetch(6803,null,15).toUpperCase() + ":",0,14,"left",20,250,600,20);
                  knownPricesArea.disp.addChild(knownPricesArea.priceFor);
                  knownPricesArea.frames = new Sprite();
                  knownPricesArea.frames.graphics.lineStyle(1,0);
                  knownPricesArea.frames.graphics.drawRect(20,295,620,155);
                  knownPricesArea.frames.graphics.drawRect(knownPricesArea.priceFor.textWidth + 30,250,610 - knownPricesArea.priceFor.textWidth,20);
                  knownPricesArea.disp.addChild(knownPricesArea.frames);
                  knownPricesArea.itemName = new EngineText("---",0,14,"center",knownPricesArea.priceFor.textWidth + 60,250,550 - knownPricesArea.priceFor.textWidth,20);
                  knownPricesArea.disp.addChild(knownPricesArea.itemName);
                  knownPricesArea.locationTitle = new EngineText(Texts.fetch(6805).toUpperCase(),0,12,"left",30,280,600,20);
                  knownPricesArea.disp.addChild(knownPricesArea.locationTitle);
                  knownPricesArea.buyTitle = new EngineText(Texts.fetch(1298,null,8).toUpperCase(),0,12,"center",310,280,100,20);
                  knownPricesArea.disp.addChild(knownPricesArea.buyTitle);
                  knownPricesArea.sellTitle = new EngineText(Texts.fetch(1328,null,8).toUpperCase(),0,12,"center",410,280,100,20);
                  knownPricesArea.disp.addChild(knownPricesArea.sellTitle);
                  knownPricesArea.daysAgoTitle = new EngineText(Texts.fetch(6804,null,10).toUpperCase(),0,12,"center",510,280,120,20);
                  knownPricesArea.disp.addChild(knownPricesArea.daysAgoTitle);
                  knownPricesArea.prevButton = new Sprite();
                  knownPricesArea.prevButton.graphics.beginFill(0);
                  knownPricesArea.prevButton.graphics.drawRect(0,0,20,20);
                  knownPricesArea.prevButton.blendMode = "layer";
                  knownPricesArea.prevButtonCut = new RepeatedGraphics(1);
                  knownPricesArea.prevButtonCut.x = 10;
                  knownPricesArea.prevButtonCut.y = 10;
                  knownPricesArea.prevButtonCut.blendMode = "erase";
                  knownPricesArea.prevButton.addChild(knownPricesArea.prevButtonCut);
                  knownPricesArea.prevButton.mouseChildren = false;
                  knownPricesArea.prevButton.buttonMode = true;
                  knownPricesArea.prevButton.x = knownPricesArea.priceFor.textWidth + 30;
                  knownPricesArea.prevButton.y = 250;
                  knownPricesArea.prevButton.addEventListener("click",scrollKnownPrices,false,0,false);
                  knownPricesArea.disp.addChild(knownPricesArea.prevButton);
                  knownPricesArea.nextButton = new Sprite();
                  knownPricesArea.nextButton.graphics.beginFill(0);
                  knownPricesArea.nextButton.graphics.drawRect(0,0,20,20);
                  knownPricesArea.nextButton.blendMode = "layer";
                  knownPricesArea.nextButtonCut = new RepeatedGraphics(2);
                  knownPricesArea.nextButtonCut.x = 10;
                  knownPricesArea.nextButtonCut.y = 10;
                  knownPricesArea.nextButtonCut.blendMode = "erase";
                  knownPricesArea.nextButton.addChild(knownPricesArea.nextButtonCut);
                  knownPricesArea.nextButton.mouseChildren = false;
                  knownPricesArea.nextButton.buttonMode = true;
                  knownPricesArea.nextButton.x = 620;
                  knownPricesArea.nextButton.y = 250;
                  knownPricesArea.nextButton.addEventListener("click",scrollKnownPrices,false,0,false);
                  knownPricesArea.disp.addChild(knownPricesArea.nextButton);
                  knownPricesArea.listArea = new ScrollableArea(610,155,610,155,true,false,false,3,10);
                  knownPricesArea.listArea.x = 20;
                  knownPricesArea.listArea.y = 295;
                  knownPricesArea.disp.addChild(knownPricesArea.listArea);
                  logPages[i].disp.addChild(knownPricesArea.disp);
                  break;
               case 2:
                  logPages[i].inProgressText = new EngineText(Texts.fetch(2201).toUpperCase(),0,14,"center",20,50,620,20);
                  logPages[i].disp.addChild(logPages[i].inProgressText);
                  logPages[i].acceptedArea = new ScrollableArea(610,160,610,160,true,false,false,3,10);
                  logPages[i].acceptedArea.x = 20;
                  logPages[i].acceptedArea.y = 80;
                  logPages[i].disp.addChild(logPages[i].acceptedArea);
                  logPages[i].completedText = new EngineText(Texts.fetch(2202).toUpperCase(),0,14,"center",20,260,300,20);
                  logPages[i].disp.addChild(logPages[i].completedText);
                  logPages[i].completedArea = new ScrollableArea(290,160,290,160,true,false,false,3,10);
                  logPages[i].completedArea.x = 20;
                  logPages[i].completedArea.y = 290;
                  logPages[i].disp.addChild(logPages[i].completedArea);
                  logPages[i].failedText = new EngineText(Texts.fetch(2203).toUpperCase(),0,14,"center",340,260,300,20);
                  logPages[i].disp.addChild(logPages[i].failedText);
                  logPages[i].failedArea = new ScrollableArea(290,160,290,160,true,false,false,3,10);
                  logPages[i].failedArea.x = 340;
                  logPages[i].failedArea.y = 290;
                  logPages[i].disp.addChild(logPages[i].failedArea);
                  logPages[i].frames = new Sprite();
                  logPages[i].frames.graphics.lineStyle(1,0);
                  logPages[i].frames.graphics.drawRect(20,80,620,160);
                  logPages[i].frames.graphics.drawRect(20,290,300,160);
                  logPages[i].frames.graphics.drawRect(340,290,300,160);
                  logPages[i].disp.addChild(logPages[i].frames);
                  break;
               case 3:
                  logPages[i].mainArea = new ScrollableArea(610,400,610,400,true,false,false,3,10);
                  logPages[i].mainArea.x = 20;
                  logPages[i].mainArea.y = 50;
                  logPages[i].disp.addChild(logPages[i].mainArea);
                  logPages[i].areaFrame = new Sprite();
                  logPages[i].areaFrame.graphics.lineStyle(1,0);
                  logPages[i].areaFrame.graphics.drawRect(20,50,620,400);
                  logPages[i].disp.addChild(logPages[i].areaFrame);
            }
            logAlphas.addChild(logPages[i].disp);
         }
         categoriesNormal[1].addChild(logLayer);
         crewPhotoBG = new ImportedBitmap("PhotoBG.png");
         crewPhotoFG = new ImportedBitmap("PhotoFG.png");
         crewPortrait = new Sprite();
         crewPhotoFG.x = crewPortrait.x = 20;
         crewPhotoFG.y = crewPortrait.y = 22;
         crewPhotoBG.x = 10;
         crewPhotoBG.y = 12;
         crewPhotoBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         categoriesNormal[2].addChild(crewPhotoBG);
         categoriesNormal[2].addChild(crewPortrait);
         categoriesNormal[2].addChild(crewPhotoFG);
         crewName = new EngineText("",16777215,14,"center",290,22,250,20);
         categoriesMask[2].addChild(crewName);
         crewNameFrame = new Sprite();
         crewNameFrame.x = 415;
         crewNameFrame.y = 32;
         categoriesMask[2].addChild(crewNameFrame);
         crewHealthText = new EngineText("",16777215,14,"left",290,62,250,20);
         crewMoraleText = new EngineText("",16777215,14,"left",290,122,250,20);
         categoriesMask[2].addChild(crewHealthText);
         categoriesMask[2].addChild(crewMoraleText);
         crewStateText = new EngineText(Texts.fetch(953).toUpperCase() + ":",16777215,14,"left",290,82,250,20);
         crewStateValue = new EngineText("",16777215,14,"right",290,82,250,20);
         categoriesMask[2].addChild(crewStateText);
         categoriesMask[2].addChild(crewStateValue);
         crewHealthBar = new Sprite();
         crewHealthBar.x = 290;
         crewHealthBar.y = 62;
         crewMoraleBar = new Sprite();
         crewMoraleBar.x = 290;
         crewMoraleBar.y = 122;
         categoriesMask[2].addChild(crewHealthBar);
         categoriesMask[2].addChild(crewMoraleBar);
         crewDamagedPartsText = new EngineText(Texts.fetch(948).toUpperCase() + ":",16777215,14,"left",290,102,250,20);
         crewDamagedPartsValue = new EngineText("",16777215,14,"right",290,102,250,20);
         categoriesMask[2].addChild(crewDamagedPartsText);
         categoriesMask[2].addChild(crewDamagedPartsValue);
         crewPhysicalText = new EngineText("",16777215,14,"left",290,152,250,20);
         crewAgilityText = new EngineText("",16777215,14,"left",290,172,250,20);
         crewAccuracyText = new EngineText("",16777215,14,"left",290,192,250,20);
         crewIntelligenceText = new EngineText("",16777215,14,"left",290,212,250,20);
         crewPhysicalValue = new EngineText("",16777215,14,"right",290,152,250,20);
         crewAgilityValue = new EngineText("",16777215,14,"right",290,172,250,20);
         crewAccuracyValue = new EngineText("",16777215,14,"right",290,192,250,20);
         crewIntelligenceValue = new EngineText("",16777215,14,"right",290,212,250,20);
         categoriesMask[2].addChild(crewPhysicalText);
         categoriesMask[2].addChild(crewAgilityText);
         categoriesMask[2].addChild(crewAccuracyText);
         categoriesMask[2].addChild(crewIntelligenceText);
         categoriesMask[2].addChild(crewPhysicalValue);
         categoriesMask[2].addChild(crewAgilityValue);
         categoriesMask[2].addChild(crewAccuracyValue);
         categoriesMask[2].addChild(crewIntelligenceValue);
         crewAPText = new EngineText(Texts.fetch(1095,null,3),16777215,14,"left",290,242,250,20);
         crewAPValue = new EngineText("",16777215,14,"right",290,242,250,20);
         categoriesMask[2].addChild(crewAPText);
         categoriesMask[2].addChild(crewAPValue);
         crewSpeedText = new EngineText(Texts.fetch(6).toUpperCase(),16777215,14,"left",290,262,250,20);
         crewSpeedValue = new EngineText("",16777215,14,"right",290,262,250,20);
         categoriesMask[2].addChild(crewSpeedText);
         categoriesMask[2].addChild(crewSpeedValue);
         crewCapacityText = new EngineText(Texts.fetch(1271).toUpperCase(),16777215,14,"left",290,292,250,20);
         crewCapacityValue = new EngineText("",16777215,14,"right",290,292,250,20);
         categoriesMask[2].addChild(crewCapacityText);
         categoriesMask[2].addChild(crewCapacityValue);
         crewSkillsFrame = new Sprite();
         crewSkillsFrame.graphics.lineStyle(1,16777215,0.3);
         crewSkillsFrame.graphics.moveTo(-1,141);
         crewSkillsFrame.graphics.lineTo(251,141);
         crewSkillsFrame.graphics.lineTo(251,-1);
         crewSkillsFrame.graphics.lineStyle(1,0,0.6);
         crewSkillsFrame.graphics.lineTo(-1,-1);
         crewSkillsFrame.graphics.lineTo(-1,141);
         crewSkillsFrame.x = 290;
         crewSkillsFrame.y = 322;
         categoriesNormal[2].addChild(crewSkillsFrame);
         crewSkillsAndExperiencesWindow = new ScrollableArea(240,140,240,140,true,false,false,3,10);
         crewSkillsAndExperiencesWindow.x = 290;
         crewSkillsAndExperiencesWindow.y = 322;
         categoriesNormal[2].addChild(crewSkillsAndExperiencesWindow);
         crewLearnignCapacityText = new EngineText(Texts.fetch(966,1,20).toUpperCase(),16777215,14,"left",10,0,220,20);
         crewLearningCapacityValue = new EngineText("",16777215,14,"right",10,0,220,20);
         crewSkillsAndExperiencesWindow.addContent(crewLearnignCapacityText);
         crewSkillsAndExperiencesWindow.addContent(crewLearningCapacityValue);
         crewLearnignCapacityText.alpha = 0.7;
         crewLearningCapacityValue.alpha = 0.7;
         crewTotalExperienceText = new EngineText(Texts.fetch(984,1,20).toUpperCase(),16777215,14,"left",10,30,220,20);
         crewTotalExperienceValue = new EngineText("",16777215,14,"right",10,30,220,20);
         crewSkillsAndExperiencesWindow.addContent(crewTotalExperienceText);
         crewSkillsAndExperiencesWindow.addContent(crewTotalExperienceValue);
         crewTotalExperienceText.alpha = 0.7;
         crewTotalExperienceValue.alpha = 0.7;
         crewBattleExperienceText = new EngineText(Texts.fetch(985,1,20).toUpperCase(),16777215,14,"left",10,50,220,20);
         crewBattleExperienceValue = new EngineText("",16777215,14,"right",10,50,220,20);
         crewSkillsAndExperiencesWindow.addContent(crewBattleExperienceText);
         crewSkillsAndExperiencesWindow.addContent(crewBattleExperienceValue);
         crewBattleExperienceText.alpha = 0.7;
         crewBattleExperienceValue.alpha = 0.7;
         crewSkillsList = [];
         yPos = 80;
         for(i in Character.skillsList)
         {
            crewSkillsList[i] = {
               "name":new EngineText(Texts.fetch(Character.skillsList[i].name,1,20).toUpperCase(),16777215,14,"left",10,yPos,220,20),
               "value":new EngineText("",16777215,14,"right",10,yPos,220,20)
            };
            crewSkillsList[i].name.alpha = crewSkillsList[i].value.alpha = 0.8;
            crewSkillsAndExperiencesWindow.addContent(crewSkillsList[i].name);
            crewSkillsAndExperiencesWindow.addContent(crewSkillsList[i].value);
            yPos += 20;
         }
         crewWeightText = new EngineText(Texts.fetch(996,1,20).toUpperCase(),16777215,14,"left",10,yPos + 10,220,20);
         crewWeightText.alpha = 0.8;
         crewWeightValue = new EngineText("0",16777215,14,"right",10,yPos + 10,220,20);
         crewWeightValue.alpha = 0.8;
         crewSkillsAndExperiencesWindow.addContent(crewWeightText);
         crewSkillsAndExperiencesWindow.addContent(crewWeightValue);
         crewOfIdealText = new EngineText(Texts.fetch(997,1,20).toUpperCase(),16777215,14,"left",10,yPos + 30,220,20);
         crewOfIdealText.alpha = 0.8;
         crewOfIdealValue = new EngineText("0",16777215,14,"right",10,yPos + 30,220,20);
         crewOfIdealValue.alpha = 0.8;
         crewSkillsAndExperiencesWindow.addContent(crewOfIdealText);
         crewSkillsAndExperiencesWindow.addContent(crewOfIdealValue);
         crewGDAText = new EngineText(Texts.fetch(998,1,20).toUpperCase(),16777215,14,"left",10,yPos + 60,220,20);
         crewGDAText.alpha = 0.8;
         crewGDAValue = new EngineText("0",16777215,14,"right",10,yPos + 60,220,20);
         crewGDAValue.alpha = 0.8;
         crewSkillsAndExperiencesWindow.addContent(crewGDAText);
         crewSkillsAndExperiencesWindow.addContent(crewGDAValue);
         crewWaterConsumptionText = new EngineText(Texts.fetch(999,1,20).toUpperCase(),16777215,14,"left",10,yPos + 80,220,20);
         crewWaterConsumptionText.alpha = 0.8;
         crewWaterConsumptionValue = new EngineText("0",16777215,14,"right",10,yPos + 80,220,20);
         crewWaterConsumptionValue.alpha = 0.8;
         crewSkillsAndExperiencesWindow.addContent(crewWaterConsumptionText);
         crewSkillsAndExperiencesWindow.addContent(crewWaterConsumptionValue);
         crewStatusText = new EngineText("",16777215,14,"center",10,292,270,20);
         categoriesMask[2].addChild(crewStatusText);
         crewSalaryText = new EngineText("",16777215,14,"center",10,322,270,20);
         categoriesMask[2].addChild(crewSalaryText);
         crewPayDayText = new EngineText("",16777215,14,"center",10,342,270,20);
         categoriesMask[2].addChild(crewPayDayText);
         crewAutoPayText = new EngineText(Texts.fetch(989).toUpperCase(),16777215,14,"left",10,372,270,20);
         categoriesMask[2].addChild(crewAutoPayText);
         crewAutoPaySwitch = new Switch(1,true,function():*
         {
            selectedCrewMember.autoPay = !selectedCrewMember.autoPay;
         },function():*
         {
            selectedCrewMember.autoPay = !selectedCrewMember.autoPay;
         });
         crewAutoPaySwitch.x = 145 - crewAutoPayText.textWidth / 2 - 15;
         crewAutoPaySwitch.y = 362;
         crewAutoPaySwitch.scaleX = crewAutoPaySwitch.scaleY = 0.8;
         categoriesNormal[2].addChild(crewAutoPaySwitch);
         crewAutoPayText.x = crewAutoPaySwitch.x + 30;
         crewRaiseSalaryButton = new Button(2,openRaiseSalaryWindow,Texts.fetch(995).toUpperCase());
         crewRaiseSalaryButton.x = 42;
         crewRaiseSalaryButton.y = 404;
         categoriesNormal[2].addChild(crewRaiseSalaryButton);
         crewDismissButton = new Button(2,openDismissDialogue,Texts.fetch(991).toUpperCase());
         crewDismissButton.x = 42;
         crewDismissButton.y = 429;
         categoriesNormal[2].addChild(crewDismissButton);
         crewFreeButton = new Button(2,openFreeDialogue,Texts.fetch(992).toUpperCase());
         crewFreeButton.x = 42;
         crewFreeButton.y = 359;
         categoriesNormal[2].addChild(crewFreeButton);
         crewSlaughterButton = new Button(2,slaughterSlave,Texts.fetch(1170).toUpperCase());
         crewSlaughterButton.x = 42;
         crewSlaughterButton.y = 394;
         categoriesNormal[2].addChild(crewSlaughterButton);
         crewMeatLine = new EngineText("0",16777215,14,"center",10,424,250,20);
         categoriesNormal[2].addChild(crewMeatLine);
         crewEnslaveButton = new Button(2,openEnslaveDialogue,Texts.fetch(993).toUpperCase());
         crewEnslaveButton.x = 42;
         crewEnslaveButton.y = 399;
         categoriesNormal[2].addChild(crewEnslaveButton);
         crewRecruitButton = new Button(2,openRecruitDialogue,Texts.fetch(994).toUpperCase());
         crewRecruitButton.x = 42;
         crewRecruitButton.y = 379;
         categoriesNormal[2].addChild(crewRecruitButton);
         crewList = new List([],450,true,["volunteers","mercenaries","prisoners","slaves","other"],[],selectCrewMember);
         crewList.x = 550;
         crewList.y = 12;
         categoriesNormal[2].addChild(crewList);
         equipmentLines = new Sprite();
         equipmentLines.graphics.lineStyle(1,16777215,0.3);
         equipmentLines.graphics.moveTo(110,352);
         equipmentLines.graphics.lineTo(550,352);
         equipmentLines.graphics.lineStyle(1,0,0.6);
         equipmentLines.graphics.moveTo(110,351);
         equipmentLines.graphics.lineTo(550,351);
         categoriesNormal[3].addChild(equipmentLines);
         equipmentItemPic = new Sprite();
         equipmentItemPic.addChild(new ImportedBitmap("GenericBackground.png"));
         equipmentItemPic.x = 440;
         equipmentItemPic.y = 362;
         equipmentItemPic.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         categoriesNormal[3].addChild(equipmentItemPic);
         equipmentItemName = new EngineText("",16777215,14,"center",120,362,310,20);
         categoriesMask[3].addChild(equipmentItemName);
         equipButton = new Button(6,equipItem,Texts.fetch(1021).toUpperCase());
         equipButton.x = 117;
         equipButton.y = 389;
         categoriesNormal[3].addChild(equipButton);
         equipmentUncompatibleText = new EngineText(Texts.fetch(1019).toUpperCase(),16777215,14,"center",120,392,140,20);
         categoriesMask[3].addChild(equipmentUncompatibleText);
         equipmentTooHeavyText = new EngineText(Texts.fetch(1020).toUpperCase(),16777215,14,"center",120,392,140,20);
         categoriesMask[3].addChild(equipmentTooHeavyText);
         equipmentDescriptionFrame = new Sprite();
         equipmentDescriptionFrame.graphics.beginFill(4208688,0.5);
         equipmentDescriptionFrame.graphics.drawRect(0,0,150,70);
         equipmentDescriptionFrame.graphics.endFill();
         drawConcaveRect(equipmentDescriptionFrame,-1,-1,152,72);
         equipmentDescriptionFrame.x = 280;
         equipmentDescriptionFrame.y = 392;
         categoriesNormal[3].addChild(equipmentDescriptionFrame);
         equipmentDescriptionArea = new ScrollableArea(140,70,140,70,true,false,false,3,10);
         equipmentDescriptionArea.x = 280;
         equipmentDescriptionArea.y = 392;
         categoriesNormal[3].addChild(equipmentDescriptionArea);
         equipmentItemEssencial1 = new EngineText("",16777215,14,"center",120,422,140,20);
         equipmentItemEssencial2 = new EngineText("",16777215,11,"center",120,442,140,20);
         categoriesMask[3].addChild(equipmentItemEssencial1);
         categoriesMask[3].addChild(equipmentItemEssencial2);
         equipmentPersonPic = new Sprite();
         equipmentPersonPic.addChild(new ImportedBitmap("GenericBackground.png"));
         equipmentPersonPic.x = 120;
         equipmentPersonPic.y = 12;
         equipmentPersonPic.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         categoriesNormal[3].addChild(equipmentPersonPic);
         slotSettings = [{
            "width":50,
            "height":50,
            "x":230,
            "y":62
         },{
            "width":50,
            "height":50,
            "x":290,
            "y":62
         },{
            "width":100,
            "height":100,
            "x":120,
            "y":132
         },{
            "width":50,
            "height":50,
            "x":230,
            "y":182
         },{
            "width":50,
            "height":50,
            "x":290,
            "y":182
         },{
            "width":100,
            "height":100,
            "x":120,
            "y":242
         },{
            "width":50,
            "height":50,
            "x":230,
            "y":292
         },{
            "width":50,
            "height":50,
            "x":290,
            "y":292
         },{
            "width":180,
            "height":75,
            "x":360,
            "y":267
         }];
         equipmentSlots = [];
         for(i in slotSettings)
         {
            equipmentSlots[i] = {"pic":new Sprite()};
            drawConcaveRect(equipmentSlots[i].pic,-1,-1,slotSettings[i].width + 2,slotSettings[i].height + 2);
            equipmentSlots[i].pic.x = slotSettings[i].x;
            equipmentSlots[i].pic.y = slotSettings[i].y;
            equipmentSlots[i].unselectedBG = new Sprite();
            equipmentSlots[i].unselectedBG.graphics.beginFill(4208688,0.4);
            equipmentSlots[i].unselectedBG.graphics.drawRect(0,0,slotSettings[i].width,slotSettings[i].height);
            equipmentSlots[i].unselectedBG.graphics.endFill();
            equipmentSlots[i].pic.addChildAt(equipmentSlots[i].unselectedBG,0);
            equipmentSlots[i].selectedBG = new Sprite();
            equipmentSlots[i].selectedBG.graphics.beginFill(16777215,0.3);
            equipmentSlots[i].selectedBG.graphics.drawRect(0,0,slotSettings[i].width,slotSettings[i].height);
            equipmentSlots[i].selectedBG.graphics.endFill();
            equipmentSlots[i].selectedBG.visible = false;
            equipmentSlots[i].pic.addChildAt(equipmentSlots[i].selectedBG,1);
            if(i == 2 || i == 5)
            {
               equipmentSlots[i].ammoIcon = new filtericonammo();
               equipmentSlots[i].ammoIcon.x = 50;
               equipmentSlots[i].ammoIcon.y = 89;
               equipmentSlots[i].ammoIcon.scaleX = equipmentSlots[i].ammoIcon.scaleY = 0.4;
               equipmentSlots[i].pic.addChildAt(equipmentSlots[i].ammoIcon,2);
               equipmentSlots[i].infoText = new EngineText("x 123",16777215,12,"right",5,81,90,20);
               equipmentSlots[i].pic.addChildAt(equipmentSlots[i].infoText,3);
            }
            equipmentSlots[i].pic.buttonMode = true;
            equipmentSlots[i].pic.mouseChildren = false;
            equipmentSlots[i].pic.doubleClickEnabled = true;
            equipmentSlots[i].pic.addEventListener("click",clickOnEquipmentSlot,false,0,false);
            equipmentSlots[i].pic.addEventListener("doubleClick",doubleClickOnEquipmentSlot,false,0,false);
            categoriesNormal[3].addChild(equipmentSlots[i].pic);
         }
         equipmentPersonName = new EngineText("",16777215,14,"center",360,12,180,20);
         categoriesMask[3].addChild(equipmentPersonName);
         equipmentPersonLoad = new EngineText("",16777215,14,"center",360,32,180,20);
         categoriesMask[3].addChild(equipmentPersonLoad);
         equipmentArmorInfo1 = new EngineText("",16777215,14,"left",230,12,110,20);
         categoriesMask[3].addChild(equipmentArmorInfo1);
         equipmentArmorInfo2 = new EngineText("",16777215,14,"left",230,12,110,20);
         categoriesMask[3].addChild(equipmentArmorInfo2);
         equipmentArmorInfo3 = new EngineText("",16777215,14,"left",230,32,110,20);
         categoriesMask[3].addChild(equipmentArmorInfo3);
         equipmentArmorSymbol1 = new filtericonshield();
         categoriesMask[3].addChild(equipmentArmorSymbol1);
         equipmentArmorSymbol2 = new filtericonfire();
         categoriesMask[3].addChild(equipmentArmorSymbol2);
         equipmentArmorSymbol3 = new filtericonexplosion();
         categoriesMask[3].addChild(equipmentArmorSymbol3);
         equipmentArmorSymbol1.y = 22;
         equipmentArmorSymbol2.y = 22;
         equipmentArmorSymbol3.y = 42;
         equipmentArmorSymbol1.scaleX = equipmentArmorSymbol1.scaleY = equipmentArmorSymbol2.scaleX = equipmentArmorSymbol2.scaleY = equipmentArmorSymbol3.scaleX = equipmentArmorSymbol3.scaleY = 0.35;
         attachmentBatterySymbols = [];
         i = 0;
         while(i < 4)
         {
            attachmentBatterySymbols[i] = new Sprite();
            attachmentBatterySymbols[i].graphics.lineStyle(5,11534336,0.8);
            attachmentBatterySymbols[i].graphics.lineStyle(5,11534336,0.8);
            attachmentBatterySymbols[i].graphics.moveTo(-20,-10);
            attachmentBatterySymbols[i].graphics.lineTo(20,-10);
            attachmentBatterySymbols[i].graphics.lineTo(20,-5);
            attachmentBatterySymbols[i].graphics.lineTo(25,-5);
            attachmentBatterySymbols[i].graphics.lineTo(25,5);
            attachmentBatterySymbols[i].graphics.lineTo(20,5);
            attachmentBatterySymbols[i].graphics.lineTo(20,10);
            attachmentBatterySymbols[i].graphics.lineTo(-20,10);
            attachmentBatterySymbols[i].graphics.lineTo(-20,-10);
            attachmentBatterySymbols[i].graphics.moveTo(-20,20);
            attachmentBatterySymbols[i].graphics.lineTo(20,-20);
            attachmentBatterySymbols[i].graphics.moveTo(-20,-20);
            attachmentBatterySymbols[i].graphics.lineTo(20,20);
            if(i < 2)
            {
               slotNum = 3 + i;
            }
            else
            {
               slotNum = 4 + i;
            }
            attachmentBatterySymbols[i].x = slotSettings[slotNum].x + slotSettings[slotNum].width / 2;
            attachmentBatterySymbols[i].y = slotSettings[slotNum].y + slotSettings[slotNum].height / 2;
            attachmentBatterySymbols[i].scaleX = attachmentBatterySymbols[i].scaleY = 0.75;
            categoriesNormal[3].addChild(attachmentBatterySymbols[i]);
            i = Number(i) + 1;
         }
         defaultAmmoFrames = [];
         defaultAmmoTitles = [];
         defaultAmmoButtons = [];
         defaultAmmoTexts = [];
         i = 0;
         while(i <= 1)
         {
            defaultAmmoFrames[i] = new Sprite();
            defaultAmmoFrames[i].x = 230;
            defaultAmmoFrames[i].y = 157 + i * 110;
            drawConcaveRect(defaultAmmoFrames[i],-1,-1,112,17);
            defaultAmmoFrames[i].graphics.beginFill(4208688,0.4);
            defaultAmmoFrames[i].graphics.drawRect(0,0,110,15);
            defaultAmmoFrames[i].graphics.endFill();
            defaultAmmoTitles[i] = new EngineText(Texts.fetch(1075).toUpperCase() + ":",16777215,12,"center",230,132 + i * 110,110,20);
            categoriesMask[3].addChild(defaultAmmoTitles[i]);
            categoriesNormal[3].addChild(defaultAmmoFrames[i]);
            defaultAmmoTexts[i] = new EngineText("",16777215,11,"center",245,156 + i * 110,80,15);
            categoriesNormal[3].addChild(defaultAmmoTexts[i]);
            i = Number(i) + 1;
         }
         i = 0;
         while(i <= 3)
         {
            if(i % 2 == 0)
            {
               symbol = new RepeatedGraphics(1,4469521,0.8);
            }
            else
            {
               symbol = new RepeatedGraphics(2,4469521,0.8);
            }
            defaultAmmoButtons[i] = new Button(7,pressDefaultAmmoArrow,symbol);
            if(i % 2 == 0)
            {
               defaultAmmoButtons[i].x = 230;
            }
            else
            {
               defaultAmmoButtons[i].x = 325;
            }
            if(i < 2)
            {
               defaultAmmoButtons[i].y = 157;
            }
            else
            {
               defaultAmmoButtons[i].y = 267;
            }
            categoriesNormal[3].addChild(defaultAmmoButtons[i]);
            i = Number(i) + 1;
         }
         equipmentList = new List([],180,false,["ammo","firstaid"],["weapons","attachments","armor","food","devices","tools","miscellaneous"],selectEquipmentList,75,true,true,true,false,5788752,16777215,5,0.2,[219]);
         equipmentList.x = 360;
         equipmentList.y = 267;
         categoriesNormal[3].addChild(equipmentList);
         equipmentInventoryTitle = new EngineText(Texts.fetch(1090).toUpperCase() + ":",16777215,12,"center",360,242,180,20);
         categoriesMask[3].addChild(equipmentInventoryTitle);
         equipmentButtons = [];
         equipmentButtons[0] = new Button(2,swapWeapons,Texts.fetch(1094).toUpperCase());
         equipmentButtons[0].scaleX = 0.9;
         equipmentButtons[0].x = 358;
         equipmentButtons[0].y = 211;
         equipmentButtons[1] = new Button(2,clearEquipment,Texts.fetch(1093).toUpperCase());
         equipmentButtons[1].scaleX = 0.9;
         equipmentButtons[1].x = 358;
         equipmentButtons[1].y = 181;
         equipmentButtons[2] = new Button(2,clearInventory,Texts.fetch(1092).toUpperCase());
         equipmentButtons[2].scaleX = 0.9;
         equipmentButtons[2].x = 358;
         equipmentButtons[2].y = 151;
         i = 0;
         while(i <= 2)
         {
            categoriesNormal[3].addChild(equipmentButtons[i]);
            i = Number(i) + 1;
         }
         equipmentPersonDataFrame = new Sprite();
         equipmentPersonDataFrame.graphics.beginFill(4208688,0.5);
         equipmentPersonDataFrame.graphics.drawRect(0,0,180,80);
         equipmentPersonDataFrame.graphics.endFill();
         drawConcaveRect(equipmentPersonDataFrame,-1,-1,182,82);
         equipmentPersonDataFrame.x = 360;
         equipmentPersonDataFrame.y = 62;
         categoriesNormal[3].addChild(equipmentPersonDataFrame);
         equipmentPersonData = new ScrollableArea(170,80,170,80,true,false,false,3,10);
         equipmentPersonData.x = 360;
         equipmentPersonData.y = 62;
         categoriesNormal[3].addChild(equipmentPersonData);
         equipmentPeopleList = new List([],450,true,["volunteers","mercenaries"],["prisoners","slaves","other"],selectEquipmentPerson);
         equipmentPeopleList.x = 10;
         equipmentPeopleList.y = 12;
         categoriesNormal[3].addChild(equipmentPeopleList);
         equipmentItemsList = new List([],450,true,["weapons","ammo","armor","attachments","firstaid"],["market","food","devices","tools","miscellaneous","liquids","liquidscontainers"],selectEquipmentItem,null,false,false,false,false,5788752,16777215,5,0.2,[219]);
         equipmentItemsList.onDoubleClick = doubleClickEquipmentItem;
         equipmentItemsList.x = 550;
         equipmentItemsList.y = 12;
         categoriesNormal[3].addChild(equipmentItemsList);
         groupSelectBodies = [];
         groupSelectShining = [];
         groupNameTexts = [];
         i = 0;
         while(i <= 5)
         {
            groupSelectBodies[i] = new Sprite();
            t = new ImportedBitmap("CaravanMenuCategoryButton.png");
            groupSelectBodies[i].addChild(t);
            groupSelectBodies[i].buttonMode = true;
            groupSelectBodies[i].mouseEnabled = i != groupsSelected;
            groupSelectBodies[i].addEventListener("click",groupSelectEvent,false,0,false);
            groupSelectBodies[i].x = i % 3 * 220 + 7;
            groupSelectBodies[i].y = 9 + Math.floor(i / 3) * 40;
            categoriesNormal[4].addChild(groupSelectBodies[i]);
            i = Number(i) + 1;
         }
         i = 0;
         while(i <= 5)
         {
            groupSelectShining[i] = new Sprite();
            t = new ImportedBitmap("CaravanMenuCategoryButtonShine.png");
            groupSelectShining[i].addChild(t);
            groupSelectShining[i].mouseEnabled = false;
            groupSelectShining[i].mouseChildren = false;
            groupSelectShining[i].x = i % 3 * 220 - 18;
            groupSelectShining[i].y = Math.floor(i / 3) * 40 - 13;
            groupSelectShining[i].visible = i == groupsSelected;
            categoriesNormal[4].addChild(groupSelectShining[i]);
            i = Number(i) + 1;
         }
         i = 0;
         while(i <= 5)
         {
            groupNameTexts[i] = new Sprite();
            t = new EngineText(getGroupName(i + 1).toUpperCase(),3683376,14,"center",i % 3 * 220 + 20,17 + Math.floor(i / 3) * 40,180,20);
            groupNameTexts[i].addChild(t);
            groupNameTexts[i].mouseEnabled = false;
            groupNameTexts[i].mouseChildren = false;
            categoriesNormal[4].addChild(groupNameTexts[i]);
            i = Number(i) + 1;
         }
         groupsLines = new Sprite();
         groupsLines.graphics.lineStyle(1,16777215,0.3);
         groupsLines.graphics.moveTo(0,93);
         groupsLines.graphics.lineTo(659,93);
         groupsLines.graphics.lineStyle(1,0,0.6);
         groupsLines.graphics.moveTo(1,92);
         groupsLines.graphics.lineTo(660,92);
         categoriesNormal[4].addChild(groupsLines);
         groupsTotalPeopleText = new EngineText("",16777215,14,"left",10,102,640,20);
         categoriesMask[4].addChild(groupsTotalPeopleText);
         currentGroupMoraleText = new EngineText("",16777215,14,"right",10,102,640,20);
         categoriesMask[4].addChild(currentGroupMoraleText);
         groupsSameAsOtherSwitch = new Switch(1,true,groupsSwitchSameAsOther,groupsSwitchSameAsOther);
         groupsSameAsOtherText = new EngineText(Texts.fetch(1132).toUpperCase(),16777215,14,"left",10,132,640,20);
         groupsSameAsOtherSwitch.scaleX = groupsSameAsOtherSwitch.scaleY = 0.75;
         groupsSameAsOtherSwitch.y = 122;
         groupsSameAsOtherSwitch.x = 325 - groupsSameAsOtherText.textWidth / 2 - 15;
         groupsSameAsOtherText.x = 325 - groupsSameAsOtherText.textWidth / 2 + 15;
         categoriesMask[4].addChild(groupsSameAsOtherText);
         categoriesNormal[4].addChild(groupsSameAsOtherSwitch);
         groupsSameAsOtherFrame = new Sprite();
         drawConcaveRect(groupsSameAsOtherFrame,0,0,200,20);
         groupsSameAsOtherFrame.graphics.beginFill(0,0.2);
         groupsSameAsOtherFrame.graphics.drawRect(1,1,198,18);
         groupsSameAsOtherFrame.x = 230;
         groupsSameAsOtherFrame.y = 172;
         categoriesNormal[4].addChild(groupsSameAsOtherFrame);
         groupsSameAsOtherGroupName = new EngineText("",16777215,14,"center",230,172,200,20);
         categoriesNormal[4].addChild(groupsSameAsOtherGroupName);
         groupsNextSameAsOtherButton = new Button(8,groupsSameAsOtherIndexSwitch,new RepeatedGraphics(2,4469521));
         groupsNextSameAsOtherButton.x = 430;
         groupsNextSameAsOtherButton.y = 170;
         categoriesNormal[4].addChild(groupsNextSameAsOtherButton);
         groupsPrevSameAsOtherButton = new Button(8,groupsSameAsOtherIndexSwitch,new RepeatedGraphics(1,4469521));
         groupsPrevSameAsOtherButton.x = 205;
         groupsPrevSameAsOtherButton.y = 170;
         categoriesNormal[4].addChild(groupsPrevSameAsOtherButton);
         groupsSameAsAnotherFoodConsumption = new EngineText("",16777215,14,"center",10,212,640,20);
         groupsSameAsAnotherWaterConsumption = new EngineText("",16777215,14,"center",10,242,640,20);
         groupsSameAsAnotherMedicineConsumption = new EngineText("",16777215,14,"center",10,272,640,20);
         categoriesMask[4].addChild(groupsSameAsAnotherFoodConsumption);
         categoriesMask[4].addChild(groupsSameAsAnotherWaterConsumption);
         categoriesMask[4].addChild(groupsSameAsAnotherMedicineConsumption);
         groupsFrame = new Sprite();
         groupsFrame.graphics.lineStyle(1,16777215,0.3);
         groupsFrame.graphics.moveTo(0,163);
         groupsFrame.graphics.lineTo(659,163);
         groupsFrame.graphics.moveTo(331,163);
         groupsFrame.graphics.lineTo(331,471);
         groupsFrame.graphics.moveTo(331,233);
         groupsFrame.graphics.lineTo(659,233);
         groupsFrame.graphics.moveTo(11,233);
         groupsFrame.graphics.lineTo(319,233);
         groupsFrame.graphics.moveTo(136,233);
         groupsFrame.graphics.lineTo(136,251);
         groupsFrame.graphics.moveTo(186,233);
         groupsFrame.graphics.lineTo(186,251);
         groupsFrame.graphics.moveTo(236,233);
         groupsFrame.graphics.lineTo(236,251);
         groupsFrame.graphics.moveTo(11,232);
         groupsFrame.graphics.lineTo(11,251);
         groupsFrame.graphics.lineStyle(1,0,0.6);
         groupsFrame.graphics.moveTo(1,162);
         groupsFrame.graphics.lineTo(660,162);
         groupsFrame.graphics.moveTo(330,162);
         groupsFrame.graphics.lineTo(330,471);
         groupsFrame.graphics.moveTo(330,232);
         groupsFrame.graphics.lineTo(660,232);
         groupsFrame.graphics.moveTo(10,251);
         groupsFrame.graphics.lineTo(319,251);
         groupsFrame.graphics.moveTo(135,233);
         groupsFrame.graphics.lineTo(135,251);
         groupsFrame.graphics.moveTo(185,232);
         groupsFrame.graphics.lineTo(185,251);
         groupsFrame.graphics.moveTo(235,233);
         groupsFrame.graphics.lineTo(235,251);
         groupsFrame.graphics.moveTo(319,233);
         groupsFrame.graphics.lineTo(319,251);
         categoriesNormal[4].addChild(groupsFrame);
         groupsFoodRationsTitle = new EngineText(Texts.fetch(1133).toUpperCase() + ":",16777215,14,"left",10,172,200,20);
         categoriesMask[4].addChild(groupsFoodRationsTitle);
         groupsFoodRationsFrame = new Sprite();
         drawConcaveRect(groupsFoodRationsFrame,0,0,51,20);
         groupsFoodRationsFrame.graphics.beginFill(0,0.2);
         groupsFoodRationsFrame.graphics.drawRect(1,1,49,18);
         groupsFoodRationsFrame.y = 172;
         categoriesNormal[4].addChild(groupsFoodRationsFrame);
         groupsFoodRationsText = new EngineText("100%",16777215,14,"center",10,172,50,20);
         categoriesNormal[4].addChild(groupsFoodRationsText);
         groupsFoodRationsMinusButton = new Button(8,groupsChangeFoodRations,"-");
         groupsFoodRationsMinusButton.y = 170;
         groupsFoodRationsPlusButton = new Button(8,groupsChangeFoodRations,"+");
         groupsFoodRationsPlusButton.y = 170;
         groupsFoodRationsTitle.x = 165 - Math.min(groupsFoodRationsTitle.textWidth,groupsFoodRationsTitle.width) / 2 - 55;
         groupsFoodRationsMinusButton.x = groupsFoodRationsTitle.x + Math.min(groupsFoodRationsTitle.textWidth,groupsFoodRationsTitle.width) + 10;
         groupsFoodRationsText.x = groupsFoodRationsFrame.x = groupsFoodRationsMinusButton.x + 25;
         groupsFoodRationsPlusButton.x = groupsFoodRationsFrame.x + 50;
         categoriesNormal[4].addChild(groupsFoodRationsMinusButton);
         categoriesNormal[4].addChild(groupsFoodRationsPlusButton);
         groupsFoodstuffsText = new EngineText(Texts.fetch(1134).toUpperCase() + ":",16777215,14,"center",10,202,310,20);
         categoriesMask[4].addChild(groupsFoodstuffsText);
         groupsFoodstuffsFrame = new Sprite();
         drawConcaveRect(groupsFoodstuffsFrame,0,0,310,200);
         groupsFoodstuffsFrame.x = 10;
         groupsFoodstuffsFrame.y = 232;
         categoriesNormal[4].addChild(groupsFoodstuffsFrame);
         groupsFoodstuffsArea = new ScrollableArea(295,180,295,180,true,false,false,3);
         groupsFoodstuffsArea.x = 10;
         groupsFoodstuffsArea.y = 252;
         categoriesNormal[4].addChild(groupsFoodstuffsArea);
         groupsFoodstuffsHeaderAvailable = new EngineText(Texts.fetch(920,1,5).toUpperCase(),16777215,12,"center",135,232,50,20);
         groupsFoodstuuffsHeaderConsumed = new EngineText(Texts.fetch(922,1,5).toUpperCase(),16777215,12,"center",185,232,50,20);
         groupsFoodstuuffsHeaderPercent = new EngineText(Texts.fetch(1146,1,6).toUpperCase(),16777215,12,"center",235,232,70,20);
         categoriesMask[4].addChild(groupsFoodstuffsHeaderAvailable);
         categoriesMask[4].addChild(groupsFoodstuuffsHeaderConsumed);
         categoriesMask[4].addChild(groupsFoodstuuffsHeaderPercent);
         groupsFoodstuffs = [];
         for(i in GD.Caravans[0].groupSettings[groupsSelected + 1].foodstuffs)
         {
            n = groupsFoodstuffs.push({}) - 1;
            groupsFoodstuffs[n].foodstuff = i;
            groupsFoodstuffs[n].Name = new EngineText(Texts.fetch(Item.Goods[i].name,1,13).toUpperCase(),16777215,14,"left",5,n * 20,120,20);
            groupsFoodstuffs[n].Name.alpha = 0.8;
            groupsFoodstuffs[n].Frame = new Sprite();
            drawConcaveRect(groupsFoodstuffs[n].Frame,0,0,30,19);
            groupsFoodstuffs[n].Frame.graphics.beginFill(0,0.2);
            groupsFoodstuffs[n].Frame.graphics.drawRect(1,1,28,17);
            groupsFoodstuffs[n].Frame.y = groupsFoodstuffs[n].Name.y;
            groupsFoodstuffs[n].Frame.x = 245;
            groupsFoodstuffs[n].plusButton = new Button(8,changeFoodstuffRelPart,"+");
            groupsFoodstuffs[n].plusButton.scaleX = groupsFoodstuffs[n].plusButton.scaleY = 0.75;
            groupsFoodstuffs[n].plusButton.x = 275;
            groupsFoodstuffs[n].plusButton.y = groupsFoodstuffs[n].Name.y;
            groupsFoodstuffs[n].minusButton = new Button(8,changeFoodstuffRelPart,"-");
            groupsFoodstuffs[n].minusButton.scaleX = groupsFoodstuffs[n].minusButton.scaleY = 0.75;
            groupsFoodstuffs[n].minusButton.x = 226;
            groupsFoodstuffs[n].minusButton.y = groupsFoodstuffs[n].Name.y;
            groupsFoodstuffs[n].percentText = new EngineText("100",16777215,12,"center",244,n * 20 + 1,30,20);
            groupsFoodstuffs[n].availableText = new EngineText("0",16777215,9,"center",125,n * 20 + 3,50,20);
            groupsFoodstuffs[n].consumedText = new EngineText("0",16777215,9,"center",175,n * 20 + 3,50,20);
            groupsFoodstuffsArea.addContent(groupsFoodstuffs[n].Name);
            groupsFoodstuffsArea.addContent(groupsFoodstuffs[n].Frame);
            groupsFoodstuffsArea.addContent(groupsFoodstuffs[n].plusButton);
            groupsFoodstuffsArea.addContent(groupsFoodstuffs[n].minusButton);
            groupsFoodstuffsArea.addContent(groupsFoodstuffs[n].percentText);
            groupsFoodstuffsArea.addContent(groupsFoodstuffs[n].availableText);
            groupsFoodstuffsArea.addContent(groupsFoodstuffs[n].consumedText);
         }
         groupsFoodstuffsArea.Content.graphics.lineStyle(1,16777215,0.4);
         groupsFoodstuffsArea.Content.graphics.moveTo(125,0);
         groupsFoodstuffsArea.Content.graphics.lineTo(125,n * 20 + 20);
         groupsFoodstuffsArea.Content.graphics.moveTo(175,0);
         groupsFoodstuffsArea.Content.graphics.lineTo(175,n * 20 + 20);
         groupsFoodConsumption = new EngineText("",16777215,14,"center",10,440,310,20);
         categoriesMask[4].addChild(groupsFoodConsumption);
         groupsWaterConsumption = new EngineText("",16777215,14,"center",340,200,310,20);
         categoriesMask[4].addChild(groupsWaterConsumption);
         groupsMedicineDistributionTitle = new EngineText(Texts.fetch(1152).toUpperCase() + ":",16777215,14,"center",340,240,310,20);
         categoriesMask[4].addChild(groupsMedicineDistributionTitle);
         groupsWaterRationsTitle = new EngineText(Texts.fetch(1136).toUpperCase() + ":",16777215,14,"left",10,172,200,20);
         categoriesMask[4].addChild(groupsWaterRationsTitle);
         groupsMedicineConsumption = new EngineText("",16777215,14,"center",340,440,310,20);
         categoriesMask[4].addChild(groupsMedicineConsumption);
         groupsWaterRationsFrame = new Sprite();
         drawConcaveRect(groupsWaterRationsFrame,0,0,51,20);
         groupsWaterRationsFrame.graphics.beginFill(0,0.2);
         groupsWaterRationsFrame.graphics.drawRect(1,1,49,18);
         groupsWaterRationsFrame.y = 172;
         categoriesNormal[4].addChild(groupsWaterRationsFrame);
         groupsWaterRationsText = new EngineText("100%",16777215,14,"center",10,172,50,20);
         categoriesNormal[4].addChild(groupsWaterRationsText);
         groupsWaterRationsMinusButton = new Button(8,groupsChangeWaterRations,"-");
         groupsWaterRationsMinusButton.y = 170;
         groupsWaterRationsPlusButton = new Button(8,groupsChangeWaterRations,"+");
         groupsWaterRationsPlusButton.y = 170;
         groupsWaterRationsTitle.x = 495 - Math.min(groupsWaterRationsTitle.textWidth,groupsWaterRationsTitle.width) / 2 - 55;
         groupsWaterRationsMinusButton.x = groupsWaterRationsTitle.x + Math.min(groupsWaterRationsTitle.textWidth,groupsWaterRationsTitle.width) + 10;
         groupsWaterRationsText.x = groupsWaterRationsFrame.x = groupsWaterRationsMinusButton.x + 25;
         groupsWaterRationsPlusButton.x = groupsWaterRationsFrame.x + 50;
         categoriesNormal[4].addChild(groupsWaterRationsMinusButton);
         categoriesNormal[4].addChild(groupsWaterRationsPlusButton);
         groupsMedicineDistribution = [];
         i = 1;
         while(i <= 4)
         {
            groupsMedicineDistribution[i] = {};
            groupsMedicineDistribution[i].DO = new Sprite();
            groupsMedicineDistribution[i].DO.graphics.lineStyle(1,16777215,0.3);
            groupsMedicineDistribution[i].DO.graphics.moveTo(0,39);
            groupsMedicineDistribution[i].DO.graphics.lineTo(0,0);
            groupsMedicineDistribution[i].DO.graphics.lineTo(290,0);
            groupsMedicineDistribution[i].DO.graphics.lineStyle(1,0,0.6);
            groupsMedicineDistribution[i].DO.graphics.lineTo(290,39);
            groupsMedicineDistribution[i].DO.graphics.lineTo(0,39);
            groupsMedicineDistribution[i].DO.x = 350;
            groupsMedicineDistribution[i].DO.y = 270 + (i - 1) * 40;
            groupsMedicineDistribution[i].Name = new EngineText(Texts.fetch(954 + i).toUpperCase(),16777215,14,"left",360,280 + (i - 1) * 40,180,20);
            categoriesMask[4].addChild(groupsMedicineDistribution[i].Name);
            groupsMedicineDistribution[i].switches = [];
            groupsMedicineDistribution[i].switchSigns = [];
            groupsMedicineDistribution[i].switchSignContainers = [];
            j = 0;
            while(j <= 3)
            {
               groupsMedicineDistribution[i].switches[j] = new Switch(2,false,groupsPressMedicineDistributionSwitch,groupsPressMedicineDistributionSwitch);
               groupsMedicineDistribution[i].switches[j].x = 180 + j * 25;
               groupsMedicineDistribution[i].switches[j].y = 7;
               groupsMedicineDistribution[i].DO.addChild(groupsMedicineDistribution[i].switches[j]);
               groupsMedicineDistribution[i].switchSignContainers[j] = new Sprite();
               groupsMedicineDistribution[i].switchSignContainers[j].x = 180 + j * 25;
               groupsMedicineDistribution[i].switchSignContainers[j].y = 9;
               groupsMedicineDistribution[i].switchSigns[j] = new EngineText(j,3683376,14,"center",0,0,25,20);
               groupsMedicineDistribution[i].switchSignContainers[j].mouseEnabled = false;
               groupsMedicineDistribution[i].switchSignContainers[j].mouseChildren = false;
               groupsMedicineDistribution[i].switchSignContainers[j].addChild(groupsMedicineDistribution[i].switchSigns[j]);
               groupsMedicineDistribution[i].DO.addChild(groupsMedicineDistribution[i].switchSignContainers[j]);
               j = Number(j) + 1;
            }
            categoriesNormal[4].addChild(groupsMedicineDistribution[i].DO);
            i = Number(i) + 1;
         }
         groupsUpdateSelected();
         transportPicBG = new ImportedBitmap("GenericBackgroundLarge.png");
         transportPicBG.x = 10;
         transportPicBG.y = 12;
         transportPicBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         categoriesNormal[5].addChild(transportPicBG);
         transportName = new EngineText("",16777215,16,"center",280,21,260,20);
         categoriesMask[5].addChild(transportName);
         transportHealthText = new EngineText("",16777215,14,"center",10,272,250,20);
         categoriesMask[5].addChild(transportHealthText);
         transportNameFrame = new Sprite();
         transportNameFrame.x = 410;
         transportNameFrame.y = 12;
         categoriesNormal[5].addChild(transportNameFrame);
         transportHealthFrame = new Sprite();
         transportHealthFrame.graphics.lineStyle(1,16777215);
         transportHealthFrame.graphics.drawRect(0,0,250,20);
         transportHealthFrame.x = 10;
         transportHealthFrame.y = 292;
         categoriesMask[5].addChild(transportHealthFrame);
         transportHealthBar = new Sprite();
         transportHealthBar.x = 10;
         transportHealthBar.y = 292;
         categoriesMask[5].addChild(transportHealthBar);
         transportTextLines = [];
         i = 0;
         while(i < 20)
         {
            transportTextLines[i] = {};
            transportTextLines[i].title = new EngineText("",16777215,14,"left",280,60 + i * 20,260,20);
            transportTextLines[i].value = new EngineText("",16777215,14,"right",280,60 + i * 20,260,20);
            categoriesMask[5].addChild(transportTextLines[i].title);
            categoriesMask[5].addChild(transportTextLines[i].value);
            i = Number(i) + 1;
         }
         transportWindPoweredText = new EngineText(Texts.fetch(6379).toUpperCase(),16777215,14,"center",280,160,260,20);
         categoriesMask[5].addChild(transportWindPoweredText);
         animalPregnancyLine1 = new EngineText("",16777215,14,"center",280,260,260,20);
         animalPregnancyLine2 = new EngineText("",16777215,14,"center",280,280,260,20);
         categoriesMask[5].addChild(animalPregnancyLine1);
         categoriesMask[5].addChild(animalPregnancyLine2);
         transportAbandonButton = new Button(2,abandonTransport,Texts.fetch(1163).toUpperCase());
         transportAbandonButton.x = 42;
         transportAbandonButton.y = 439;
         categoriesNormal[5].addChild(transportAbandonButton);
         transportAnimalAgeTitle = new EngineText(Texts.fetch(1166).toUpperCase(),16777215,14,"left",10,322,250,20);
         transportAnimalAgeValue = new EngineText("0",16777215,14,"right",10,322,250,20);
         categoriesMask[5].addChild(transportAnimalAgeTitle);
         categoriesMask[5].addChild(transportAnimalAgeValue);
         transportAnimalMeatTitle = new EngineText(Texts.fetch(1169).toUpperCase(),16777215,14,"left",10,342,250,20);
         transportAnimalMeatValue = new EngineText("0",16777215,14,"right",10,342,250,20);
         categoriesMask[5].addChild(transportAnimalMeatTitle);
         categoriesMask[5].addChild(transportAnimalMeatValue);
         transportAnimalSkinTitle = new EngineText(Texts.fetch(1174).toUpperCase(),16777215,14,"left",10,362,250,20);
         transportAnimalSkinValue = new EngineText("0",16777215,14,"right",10,362,250,20);
         categoriesMask[5].addChild(transportAnimalSkinTitle);
         categoriesMask[5].addChild(transportAnimalSkinValue);
         transportAnimalSlaughterButton = new Button(2,slaughterAnimal,Texts.fetch(1170).toUpperCase());
         transportAnimalSlaughterButton.x = 42;
         transportAnimalSlaughterButton.y = 389;
         categoriesNormal[5].addChild(transportAnimalSlaughterButton);
         transportAnimalRenameButton = new Button(2,renameAnimal,Texts.fetch(1180).toUpperCase());
         transportAnimalRenameButton.x = 42;
         transportAnimalRenameButton.y = 414;
         categoriesNormal[5].addChild(transportAnimalRenameButton);
         transportPicSymbols = [];
         transportPicSymbols[0] = new InterfaceIconMale();
         transportPicSymbols[1] = new InterfaceIconFemale();
         transportPicSymbols[2] = new InterfaceIconBaby();
         transportPicSymbols[3] = new InterfaceIconYoung();
         transportPicSymbols[4] = new InterfaceIconOld();
         transportPicSymbols[5] = new Sprite();
         transportPicSymbols[5].graphics.beginFill(16777215);
         transportPicSymbols[5].graphics.drawCircle(0,0,8);
         transportPicSymbols[5].graphics.endFill();
         transportPicSymbols[0].x = 230;
         transportPicSymbols[0].y = 232;
         transportPicSymbols[1].x = 230;
         transportPicSymbols[1].y = 232;
         i = 2;
         while(i <= 4)
         {
            transportPicSymbols[i].x = 40;
            transportPicSymbols[i].y = 230;
            i = Number(i) + 1;
         }
         transportPicSymbols[5].x = 230;
         transportPicSymbols[5].y = 226;
         for(i in transportPicSymbols)
         {
            transportPicSymbols[i].alpha = 0.35;
            transportPicSymbols[i].scaleX = transportPicSymbols[i].scaleY = 0.75;
            categoriesNormal[5].addChild(transportPicSymbols[i]);
         }
         transportCartLubricantText = new EngineText("",16777215,14,"center",10,342,250,20);
         categoriesMask[5].addChild(transportCartLubricantText);
         transportCartLubricantFrame = new Sprite();
         transportCartLubricantFrame.graphics.lineStyle(1,16777215);
         transportCartLubricantFrame.graphics.drawRect(0,0,250,20);
         transportCartLubricantFrame.x = 12;
         transportCartLubricantFrame.y = 362;
         categoriesMask[5].addChild(transportCartLubricantFrame);
         transportCartLubricantBar = new Sprite();
         transportCartLubricantBar.x = 12;
         transportCartLubricantBar.y = 362;
         categoriesMask[5].addChild(transportCartLubricantBar);
         transportCartLubricantButton = new Button(2,fillLubricant,Texts.fetch(1178).toUpperCase());
         transportCartLubricantButton.x = 42;
         transportCartLubricantButton.y = 389;
         categoriesNormal[5].addChild(transportCartLubricantButton);
         transportCarWaterText = new EngineText("",16777215,14,"center",10,342,120,20);
         categoriesMask[5].addChild(transportCarWaterText);
         transportCarLubricantText = new EngineText("",16777215,14,"center",140,342,120,20);
         categoriesMask[5].addChild(transportCarLubricantText);
         transportCarFrames = new Sprite();
         transportCarFrames.graphics.lineStyle(1,16777215);
         transportCarFrames.graphics.drawRect(0,0,120,20);
         transportCarFrames.graphics.drawRect(130,0,120,20);
         transportCarFrames.x = 10;
         transportCarFrames.y = 362;
         categoriesMask[5].addChild(transportCarFrames);
         transportCarWaterBar = new Sprite();
         transportCarWaterBar.x = 10;
         transportCarWaterBar.y = 362;
         categoriesMask[5].addChild(transportCarWaterBar);
         transportCarLubricantBar = new Sprite();
         transportCarLubricantBar.x = 140;
         transportCarLubricantBar.y = 362;
         categoriesMask[5].addChild(transportCarLubricantBar);
         transportCarWaterButton = new Button(9,fillWater,Texts.fetch(1179).toUpperCase());
         transportCarWaterButton.x = 7;
         transportCarWaterButton.y = 389;
         categoriesNormal[5].addChild(transportCarWaterButton);
         transportCarLubricantButton = new Button(9,fillLubricant,Texts.fetch(1179).toUpperCase());
         transportCarLubricantButton.x = 137;
         transportCarLubricantButton.y = 389;
         categoriesNormal[5].addChild(transportCarLubricantButton);
         transportNoTransportText = new EngineText(Texts.fetch(6854,GD.Caravans[0].People[0].gender),16777215,14,"center",0,237.5,660,20);
         categoriesMask[5].addChild(transportNoTransportText);
         transportList = new List([],450,true,["animals","carts","cars"],[],selectTransport);
         transportList.x = 550;
         transportList.y = 12;
         categoriesNormal[5].addChild(transportList);
         cartsLines = new Sprite();
         cartsLines.graphics.lineStyle(1,16777215,0.3);
         cartsLines.graphics.moveTo(331,0);
         cartsLines.graphics.lineTo(331,42);
         cartsLines.graphics.moveTo(331,142);
         cartsLines.graphics.lineTo(331,302);
         cartsLines.graphics.moveTo(110,303);
         cartsLines.graphics.lineTo(550,303);
         cartsLines.graphics.moveTo(231,142);
         cartsLines.graphics.lineTo(231,43);
         cartsLines.graphics.lineTo(430,43);
         cartsLines.graphics.moveTo(230,143);
         cartsLines.graphics.lineTo(431,143);
         cartsLines.graphics.lineTo(431,42);
         cartsLines.graphics.lineStyle(1,0,0.6);
         cartsLines.graphics.moveTo(330,0);
         cartsLines.graphics.lineTo(330,42);
         cartsLines.graphics.moveTo(330,142);
         cartsLines.graphics.lineTo(330,302);
         cartsLines.graphics.moveTo(110,302);
         cartsLines.graphics.lineTo(550,302);
         cartsLines.graphics.moveTo(231,142);
         cartsLines.graphics.lineTo(430,142);
         cartsLines.graphics.lineTo(430,43);
         cartsLines.graphics.moveTo(230,143);
         cartsLines.graphics.lineTo(230,42);
         cartsLines.graphics.lineTo(431,42);
         categoriesNormal[6].addChild(cartsLines);
         cartsAnimalPicHolder = new ImportedBitmap("GenericBackground.png");
         cartsAnimalPicHolder.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         cartsAnimalPicHolder.x = 120;
         cartsAnimalPicHolder.y = 42;
         categoriesNormal[6].addChild(cartsAnimalPicHolder);
         cartsAttachedCartPicHolder = new ImportedBitmap("GenericBackground.png");
         cartsAttachedCartPicHolder.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         cartsAttachedCartPicHolder.x = 440;
         cartsAttachedCartPicHolder.y = 42;
         categoriesNormal[6].addChild(cartsAttachedCartPicHolder);
         cartsAnimalPic = new Sprite();
         cartsAnimalPic.x = 120;
         cartsAnimalPic.y = 42;
         cartsAnimalPic.scaleX = cartsAnimalPic.scaleY = 0.4;
         categoriesNormal[6].addChild(cartsAnimalPic);
         cartsAttachedCartPic = new Sprite();
         cartsAttachedCartPic.x = 440;
         cartsAttachedCartPic.y = 42;
         cartsAttachedCartPic.scaleX = cartsAttachedCartPic.scaleY = 0.4;
         categoriesNormal[6].addChild(cartsAttachedCartPic);
         cartsAnimalName = new EngineText("",16777215,14,"left",120,12,200,20);
         categoriesMask[6].addChild(cartsAnimalName);
         cartsAttachedCartName = new EngineText("",16777215,14,"right",340,12,200,20);
         categoriesMask[6].addChild(cartsAttachedCartName);
         cartsAnimalHealthText = new EngineText("",16777215,14,"left",120,152,200,20);
         categoriesMask[6].addChild(cartsAnimalHealthText);
         cartsAttachedCartHealthText = new EngineText("",16777215,14,"right",340,152,200,20);
         categoriesMask[6].addChild(cartsAttachedCartHealthText);
         cartsAnimalHealthFrame = new Sprite();
         cartsAnimalHealthFrame.graphics.lineStyle(1,16777215);
         cartsAnimalHealthFrame.graphics.drawRect(0,0,200,20);
         cartsAnimalHealthFrame.x = 120;
         cartsAnimalHealthFrame.y = 172;
         categoriesMask[6].addChild(cartsAnimalHealthFrame);
         cartsAnimalHealthBar = new Sprite();
         cartsAnimalHealthBar.x = 120;
         cartsAnimalHealthBar.y = 172;
         categoriesMask[6].addChild(cartsAnimalHealthBar);
         cartsAttachedCartHealthFrame = new Sprite();
         cartsAttachedCartHealthFrame.graphics.lineStyle(1,16777215);
         cartsAttachedCartHealthFrame.graphics.drawRect(0,0,200,20);
         cartsAttachedCartHealthFrame.x = 340;
         cartsAttachedCartHealthFrame.y = 172;
         categoriesMask[6].addChild(cartsAttachedCartHealthFrame);
         cartsAttachedCartHealthBar = new Sprite();
         cartsAttachedCartHealthBar.x = 340;
         cartsAttachedCartHealthBar.y = 172;
         categoriesMask[6].addChild(cartsAttachedCartHealthBar);
         cartsAnimalCapacityTitle = new EngineText(Texts.fetch(1155,null,20).toUpperCase(),16777215,14,"left",120,202,200,20);
         cartsAnimalCapacityValue = new EngineText("",16777215,14,"right",120,202,200,20);
         categoriesMask[6].addChild(cartsAnimalCapacityTitle);
         categoriesMask[6].addChild(cartsAnimalCapacityValue);
         cartsAnimalPassengersTitle = new EngineText(Texts.fetch(899,null,20).toUpperCase(),16777215,14,"left",120,222,200,20);
         cartsAnimalPassengersValue = new EngineText("",16777215,14,"right",120,222,200,20);
         categoriesMask[6].addChild(cartsAnimalPassengersTitle);
         categoriesMask[6].addChild(cartsAnimalPassengersValue);
         cartsAnimalSpeedTitle = new EngineText(Texts.fetch(6,null,20).toUpperCase(),16777215,14,"left",120,272,200,20);
         cartsAnimalSpeedValue = new EngineText("",16777215,14,"right",120,272,200,20);
         categoriesMask[6].addChild(cartsAnimalSpeedTitle);
         categoriesMask[6].addChild(cartsAnimalSpeedValue);
         cartsAttachedCartCapacityTitle = new EngineText(Texts.fetch(1155,null,20).toUpperCase(),16777215,14,"left",340,202,200,20);
         cartsAttachedCartCapacityValue = new EngineText("",16777215,14,"right",340,202,200,20);
         categoriesMask[6].addChild(cartsAttachedCartCapacityTitle);
         categoriesMask[6].addChild(cartsAttachedCartCapacityValue);
         cartsAttachedCartPassengersTitle = new EngineText(Texts.fetch(899,null,20).toUpperCase(),16777215,14,"left",340,222,200,20);
         cartsAttachedCartPassengersValue = new EngineText("",16777215,14,"right",340,222,200,20);
         categoriesMask[6].addChild(cartsAttachedCartPassengersTitle);
         categoriesMask[6].addChild(cartsAttachedCartPassengersValue);
         cartsAttachedCartCapacityMultiplierTitle = new EngineText(Texts.fetch(1161,null,20).toUpperCase(),16777215,14,"left",340,252,200,20);
         cartsAttachedCartCapacityMultiplierValue = new EngineText("",16777215,14,"right",340,252,200,20);
         categoriesMask[6].addChild(cartsAttachedCartCapacityMultiplierTitle);
         categoriesMask[6].addChild(cartsAttachedCartCapacityMultiplierValue);
         cartsAttachedCartWeightTitle = new EngineText(Texts.fetch(996,null,20).toUpperCase(),16777215,14,"left",340,272,200,20);
         cartsAttachedCartWeightValue = new EngineText("",16777215,14,"right",340,272,200,20);
         categoriesMask[6].addChild(cartsAttachedCartWeightTitle);
         categoriesMask[6].addChild(cartsAttachedCartWeightValue);
         cartsCombinedCapacityText = new EngineText("",16777215,16,"center",240,51,180,20);
         categoriesMask[6].addChild(cartsCombinedCapacityText);
         cartsCombinedPassengersText = new EngineText("",16777215,16,"center",240,81,180,20);
         categoriesMask[6].addChild(cartsCombinedPassengersText);
         cartsDetachButton = new Button(6,detachCart,Texts.fetch(1183).toUpperCase());
         cartsDetachButton.x = 257;
         cartsDetachButton.y = 109;
         categoriesNormal[6].addChild(cartsDetachButton);
         cartsSelectedCartPicHolder = new ImportedBitmap("GenericBackground.png");
         cartsSelectedCartPicHolder.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         cartsSelectedCartPicHolder.x = 440;
         cartsSelectedCartPicHolder.y = 362;
         categoriesNormal[6].addChild(cartsSelectedCartPicHolder);
         cartsSelectedCartPic = new Sprite();
         cartsSelectedCartPic.x = 440;
         cartsSelectedCartPic.y = 362;
         cartsSelectedCartPic.scaleX = cartsSelectedCartPic.scaleY = 0.4;
         categoriesNormal[6].addChild(cartsSelectedCartPic);
         cartsSelectedCartFrame = new Sprite();
         cartsSelectedCartFrame.graphics.lineStyle(1,16777215);
         cartsSelectedCartFrame.graphics.drawRect(0,0,420,40);
         cartsSelectedCartFrame.x = 120;
         cartsSelectedCartFrame.y = 312;
         categoriesMask[6].addChild(cartsSelectedCartFrame);
         cartsSelectedCartName = new EngineText("",16777215,16,"center",120,322,420,20);
         categoriesMask[6].addChild(cartsSelectedCartName);
         cartsSelectedCartCapacityTitle = new EngineText(Texts.fetch(1155,null,14).toUpperCase(),16777215,14,"left",270,362,160,20);
         cartsSelectedCartCapacityValue = new EngineText("",16777215,14,"right",270,362,160,20);
         categoriesMask[6].addChild(cartsSelectedCartCapacityTitle);
         categoriesMask[6].addChild(cartsSelectedCartCapacityValue);
         cartsSelectedCartPassengersTitle = new EngineText(Texts.fetch(899,null,14).toUpperCase(),16777215,14,"left",270,382,160,20);
         cartsSelectedCartPassengersValue = new EngineText("",16777215,14,"right",270,382,160,20);
         categoriesMask[6].addChild(cartsSelectedCartPassengersTitle);
         categoriesMask[6].addChild(cartsSelectedCartPassengersValue);
         cartsSelectedCartCapacityMultiplierTitle = new EngineText(Texts.fetch(1161,null,14).toUpperCase(),16777215,14,"left",270,422,160,20);
         cartsSelectedCartCapacityMultiplierValue = new EngineText("",16777215,14,"right",270,422,160,20);
         categoriesMask[6].addChild(cartsSelectedCartCapacityMultiplierTitle);
         categoriesMask[6].addChild(cartsSelectedCartCapacityMultiplierValue);
         cartsSelectedCartWeightTitle = new EngineText(Texts.fetch(996,null,14).toUpperCase(),16777215,14,"left",270,442,160,20);
         cartsSelectedCartWeightValue = new EngineText("",16777215,14,"right",270,442,160,20);
         categoriesMask[6].addChild(cartsSelectedCartWeightTitle);
         categoriesMask[6].addChild(cartsSelectedCartWeightValue);
         cartsSelectedCartAttachButton = new Button(6,attachCart,Texts.fetch(1184).toUpperCase());
         cartsSelectedCartAttachButton.x = 117;
         cartsSelectedCartAttachButton.y = 359;
         categoriesNormal[6].addChild(cartsSelectedCartAttachButton);
         cartsTooHeavyText = new EngineText(Texts.fetch(1020,null,14).toUpperCase(),16777215,14,"center",120,362,140,20);
         categoriesNormal[6].addChild(cartsTooHeavyText);
         cartsSelectedCartHealthText = new EngineText("",16777215,14,"center",120,382,140,20);
         categoriesMask[6].addChild(cartsSelectedCartHealthText);
         cartsSelectedCartHealthFrame = new Sprite();
         cartsSelectedCartHealthFrame.graphics.lineStyle(1,16777215);
         cartsSelectedCartHealthFrame.graphics.drawRect(0,0,140,20);
         cartsSelectedCartHealthFrame.x = 120;
         cartsSelectedCartHealthFrame.y = 402;
         categoriesMask[6].addChild(cartsSelectedCartHealthFrame);
         cartsSelectedCartHealthBar = new Sprite();
         cartsSelectedCartHealthBar.x = 120;
         cartsSelectedCartHealthBar.y = 402;
         categoriesMask[6].addChild(cartsSelectedCartHealthBar);
         cartsSelectedCartExpectedCapacityValue = new EngineText("",16777215,14,"center",120,442,140,20);
         categoriesMask[6].addChild(cartsSelectedCartExpectedCapacityValue);
         cartsNoCartsText = new EngineText(Texts.fetch(6855,GD.Caravans[0].People[0].gender),16777215,14,"center",0,237.5,660,20);
         categoriesMask[6].addChild(cartsNoCartsText);
         cartsAnimalsList = new List([],450,true,[],["carts","cars"],cartsSelectAnimal);
         cartsAnimalsList.x = 10;
         cartsAnimalsList.y = 12;
         categoriesNormal[6].addChild(cartsAnimalsList);
         cartsCartsList = new List([],450,true,[],[],cartsSelectCart);
         cartsCartsList.x = 550;
         cartsCartsList.y = 12;
         categoriesNormal[6].addChild(cartsCartsList);
         passengersLines = new Sprite();
         passengersLines.graphics.lineStyle(1,16777215,0.3);
         passengersLines.graphics.moveTo(110,301);
         passengersLines.graphics.lineTo(550,301);
         passengersLines.graphics.lineStyle(1,0,0.6);
         passengersLines.graphics.moveTo(110,300);
         passengersLines.graphics.lineTo(550,300);
         categoriesNormal[7].addChild(passengersLines);
         passengersTransportPicBG = new ImportedBitmap("GenericBackground.png");
         passengersTransportPicBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         passengersTransportPicBG.x = 120;
         passengersTransportPicBG.y = 62;
         categoriesNormal[7].addChild(passengersTransportPicBG);
         passengersCartPicBG = new ImportedBitmap("GenericBackground.png");
         passengersCartPicBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         passengersCartPicBG.x = 260;
         passengersCartPicBG.y = 62;
         categoriesNormal[7].addChild(passengersCartPicBG);
         passengersTransportPic = new Sprite();
         passengersTransportPic.x = 120;
         passengersTransportPic.y = 62;
         passengersTransportPic.scaleX = passengersTransportPic.scaleY = 0.4;
         categoriesNormal[7].addChild(passengersTransportPic);
         passengersCartPic = new Sprite();
         passengersCartPic.x = 260;
         passengersCartPic.y = 62;
         passengersCartPic.scaleX = passengersCartPic.scaleY = 0.4;
         categoriesNormal[7].addChild(passengersCartPic);
         passengersTransportNameFrame = new Sprite();
         passengersTransportNameFrame.graphics.lineStyle(1,16777215);
         passengersTransportNameFrame.graphics.drawRect(0,0,420,40);
         passengersTransportNameFrame.x = 120;
         passengersTransportNameFrame.y = 12;
         categoriesMask[7].addChild(passengersTransportNameFrame);
         passengersTransportName = new EngineText("",16777215,14,"center",130,22,400,20);
         categoriesMask[7].addChild(passengersTransportName);
         passengersPlusSign = new Sprite();
         passengersPlusSign.graphics.beginFill(16777215);
         passengersPlusSign.graphics.moveTo(-2,-10);
         passengersPlusSign.graphics.lineTo(2,-10);
         passengersPlusSign.graphics.lineTo(2,-2);
         passengersPlusSign.graphics.lineTo(10,-2);
         passengersPlusSign.graphics.lineTo(10,2);
         passengersPlusSign.graphics.lineTo(2,2);
         passengersPlusSign.graphics.lineTo(2,10);
         passengersPlusSign.graphics.lineTo(-2,10);
         passengersPlusSign.graphics.lineTo(-2,2);
         passengersPlusSign.graphics.lineTo(-10,2);
         passengersPlusSign.graphics.lineTo(-10,-2);
         passengersPlusSign.graphics.lineTo(-2,-2);
         passengersPlusSign.graphics.endFill();
         passengersPlusSign.x = 240;
         passengersPlusSign.y = 112;
         categoriesMask[7].addChild(passengersPlusSign);
         passengersTransportPassengersText = new EngineText("",16777215,14,"center",380,62,160,20);
         categoriesMask[7].addChild(passengersTransportPassengersText);
         passengersTransportCapacityText = new EngineText("",16777215,14,"center",380,102,160,20);
         categoriesMask[7].addChild(passengersTransportCapacityText);
         passengersTransportNoPassengersButton = new Button(6,passengersClear,Texts.fetch(927).toUpperCase());
         passengersTransportNoPassengersButton.x = 387;
         passengersTransportNoPassengersButton.y = 139;
         categoriesNormal[7].addChild(passengersTransportNoPassengersButton);
         passengersPassengerNameFrame = new Sprite();
         passengersPassengerNameFrame.graphics.lineStyle(1,16777215);
         passengersPassengerNameFrame.graphics.drawRect(0,0,420,40);
         passengersPassengerNameFrame.x = 120;
         passengersPassengerNameFrame.y = 312;
         categoriesMask[7].addChild(passengersPassengerNameFrame);
         passengersPassengerName = new EngineText("",16777215,14,"center",130,322,400,20);
         categoriesMask[7].addChild(passengersPassengerName);
         passengersPassengerPicBG = new ImportedBitmap("GenericBackground.png");
         passengersPassengerPicBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         passengersPassengerPicBG.x = 440;
         passengersPassengerPicBG.y = 362;
         categoriesNormal[7].addChild(passengersPassengerPicBG);
         passengersPassengerPic = new Sprite();
         passengersPassengerPic.x = 440;
         passengersPassengerPic.y = 362;
         passengersPassengerPic.scaleX = passengersPassengerPic.scaleY = 0.4;
         categoriesNormal[7].addChild(passengersPassengerPic);
         passengersPassengerHealthText = new EngineText("",16777215,14,"center",270,362,160,20);
         categoriesMask[7].addChild(passengersPassengerHealthText);
         passengersPassengerHealthFrame = new Sprite();
         passengersPassengerHealthFrame.graphics.lineStyle(1,16777215);
         passengersPassengerHealthFrame.graphics.drawRect(0,0,160,20);
         passengersPassengerHealthFrame.x = 270;
         passengersPassengerHealthFrame.y = 382;
         categoriesMask[7].addChild(passengersPassengerHealthFrame);
         passengersPassengerHealthBar = new Sprite();
         passengersPassengerHealthBar.x = 270;
         passengersPassengerHealthBar.y = 382;
         categoriesMask[7].addChild(passengersPassengerHealthBar);
         passengersPassengerSpeedTitle = new EngineText(Texts.fetch(6,null,14).toUpperCase(),16777215,14,"left",270,402,160,20);
         passengersPassengerSpeedValue = new EngineText("",16777215,14,"right",270,402,160,20);
         categoriesMask[7].addChild(passengersPassengerSpeedTitle);
         categoriesMask[7].addChild(passengersPassengerSpeedValue);
         passengersPassengerCapacityTitle = new EngineText(Texts.fetch(1155,null,14).toUpperCase(),16777215,14,"left",270,422,160,20);
         passengersPassengerCapacityValue = new EngineText("",16777215,14,"right",270,422,160,20);
         categoriesMask[7].addChild(passengersPassengerCapacityTitle);
         categoriesMask[7].addChild(passengersPassengerCapacityValue);
         passengersPassengerPassengersTitle = new EngineText(Texts.fetch(899,null,14).toUpperCase(),16777215,14,"left",270,442,160,20);
         passengersPassengerPassengersValue = new EngineText("",16777215,14,"right",270,442,160,20);
         categoriesMask[7].addChild(passengersPassengerPassengersTitle);
         categoriesMask[7].addChild(passengersPassengerPassengersValue);
         passengersPassengerWeightText = new EngineText("",16777215,14,"center",120,402,140,20);
         categoriesMask[7].addChild(passengersPassengerWeightText);
         passengersPassengerSpacesTitle = new EngineText(Texts.fetch(1186,null,12).toUpperCase() + ":",16777215,14,"center",120,422,140,20);
         categoriesMask[7].addChild(passengersPassengerSpacesTitle);
         passengersPassengerSpacesValue = new EngineText("",16777215,14,"center",120,442,140,20);
         categoriesMask[7].addChild(passengersPassengerSpacesValue);
         passengersPassengerSeatButton = new Button(6,seatPassanger,Texts.fetch(1187).toUpperCase());
         passengersPassengerSeatButton.x = 120;
         passengersPassengerSeatButton.y = 382;
         categoriesNormal[7].addChild(passengersPassengerSeatButton);
         passengersPassengerCantSeatText = new EngineText("",16777215,14,"center",120,362,140,20);
         categoriesMask[7].addChild(passengersPassengerCantSeatText);
         passengersTransportAreaFrame = new Sprite();
         drawConcaveRect(passengersTransportAreaFrame,-1,-1,422,122);
         passengersTransportAreaFrame.x = 120;
         passengersTransportAreaFrame.y = 172;
         categoriesNormal[7].addChild(passengersTransportAreaFrame);
         passengersTransportArea = new ScrollableArea(410,120,410,120,true,false,false,3,10);
         passengersTransportArea.x = 120;
         passengersTransportArea.y = 172;
         categoriesNormal[7].addChild(passengersTransportArea);
         passengersTransportPassengers = [];
         passengersNoTransportText = new EngineText(Texts.fetch(6854,GD.Caravans[0].People[0].gender),16777215,14,"center",0,237.5,660,20);
         categoriesMask[7].addChild(passengersNoTransportText);
         passengersTransportList = new List([],450,true,["animals","cars"],[],passengersSelectTransport);
         passengersTransportList.x = 10;
         passengersTransportList.y = 12;
         categoriesNormal[7].addChild(passengersTransportList);
         passengersPassengersList = new List([],450,true,["people","animals","carts","cars"],[],passengersSelectPassenger);
         passengersPassengersList.x = 550;
         passengersPassengersList.y = 12;
         categoriesNormal[7].addChild(passengersPassengersList);
         cargoPicBG = new ImportedBitmap("GenericBackgroundLarge.png");
         cargoPicBG.x = 10;
         cargoPicBG.y = 12;
         cargoPicBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         categoriesNormal[8].addChild(cargoPicBG);
         cargoPic = new Sprite();
         cargoPic.x = 10;
         cargoPic.y = 12;
         categoriesNormal[8].addChild(cargoPic);
         cargoName = new EngineText("",16777215,16,"center",280,21,260,20);
         categoriesMask[8].addChild(cargoName);
         cargoNameFrame = new Sprite();
         cargoNameFrame.x = 280;
         cargoNameFrame.y = 12;
         categoriesMask[8].addChild(cargoNameFrame);
         weightPerUnitTitle = new EngineText(Texts.fetch(1190).toUpperCase(),16777215,14,"left",280,62,260,20);
         categoriesMask[8].addChild(weightPerUnitTitle);
         weightPerUnitValue = new EngineText("0",16777215,14,"right",280,62,260,20);
         categoriesMask[8].addChild(weightPerUnitValue);
         totalWeightTitle = new EngineText(Texts.fetch(1191).toUpperCase(),16777215,14,"left",280,82,260,20);
         categoriesMask[8].addChild(totalWeightTitle);
         totalWeightValue = new EngineText("0",16777215,14,"right",280,82,260,20);
         categoriesMask[8].addChild(totalWeightValue);
         pricePerUnitTitle = new EngineText(Texts.fetch(1192).toUpperCase(),16777215,14,"left",280,112,260,20);
         categoriesMask[8].addChild(pricePerUnitTitle);
         pricePerUnitValue = new EngineText("0",16777215,14,"right",280,112,260,20);
         categoriesMask[8].addChild(pricePerUnitValue);
         seePricesButton = new Button(2,seePricesForCargoItem,Texts.fetch(6807).toUpperCase());
         seePricesButton.x = 307;
         seePricesButton.y = 139;
         categoriesNormal[8].addChild(seePricesButton);
         warningText = new EngineText("",16777215,14,"center",280,152,260,100,true,true);
         categoriesMask[8].addChild(warningText);
         additionalInfoText = new EngineText(Texts.fetch(1194).toUpperCase() + ":",16777215,14,"center",280,272,260,20);
         categoriesMask[8].addChild(additionalInfoText);
         additionalInfoFrame = new Sprite();
         drawConcaveRect(additionalInfoFrame,-1,-1,262,162);
         additionalInfoFrame.x = 280;
         additionalInfoFrame.y = 302;
         categoriesNormal[8].addChild(additionalInfoFrame);
         cargoInfoArea = new ScrollableArea(250,160,250,160,true,false,false,3,10);
         cargoInfoArea.x = 280;
         cargoInfoArea.y = 302;
         categoriesNormal[8].addChild(cargoInfoArea);
         cargoCategoryText = new EngineText("",16777215,14,"center",10,272,250,20);
         categoriesMask[8].addChild(cargoCategoryText);
         cargoNotInUseText = new EngineText("",16777215,14,"center",10,352,250,20);
         categoriesMask[8].addChild(cargoNotInUseText);
         inUseText = new EngineText("",16777215,14,"center",10,332,250,20);
         categoriesMask[8].addChild(inUseText);
         availableAmountText = new EngineText("",16777215,14,"center",10,312,250,20);
         categoriesMask[8].addChild(availableAmountText);
         cargoAvailableVolumeText = new EngineText("",16777215,14,"center",10,292,250,20);
         categoriesMask[8].addChild(cargoAvailableVolumeText);
         cargoThrowAwayButton = new Button(2,cargoThrowAway,Texts.fetch(1201).toUpperCase());
         cargoThrowAwayButton.x = 42;
         cargoThrowAwayButton.y = 409;
         categoriesNormal[8].addChild(cargoThrowAwayButton);
         cargoWeightChartButton = new Button(2,cargoWeightChart,Texts.fetch(1202).toUpperCase());
         cargoWeightChartButton.x = 42;
         cargoWeightChartButton.y = 439;
         categoriesNormal[8].addChild(cargoWeightChartButton);
         cargoRemoveFromUseButton = new Button(2,cargoRemoveFromUse,Texts.fetch(1203).toUpperCase());
         cargoRemoveFromUseButton.x = 42;
         cargoRemoveFromUseButton.y = 379;
         categoriesNormal[8].addChild(cargoRemoveFromUseButton);
         cargoReadButton = new Button(2,cargoRead,Texts.fetch(1986).toUpperCase());
         cargoReadButton.x = 42;
         cargoReadButton.y = 379;
         categoriesNormal[8].addChild(cargoReadButton);
         cargoDeviceOnOffButton = new Button(2,cargoSwitchOnOff,Texts.fetch(1243).toUpperCase());
         cargoDeviceOnOffButton.x = 42;
         cargoDeviceOnOffButton.y = 379;
         categoriesNormal[8].addChild(cargoDeviceOnOffButton);
         cargoManageContainersButton = new Button(2,openManageContainers,Texts.fetch(1216).toUpperCase());
         cargoManageContainersButton.x = 42;
         cargoManageContainersButton.y = 379;
         categoriesNormal[8].addChild(cargoManageContainersButton);
         cargoList = new List([],450,true,["market","food","liquids","liquidscontainers","devices","miscellaneous","weapons","ammo","attachments","armor","firstaid","tools"],[],cargoSelectItem,null,false,false,false,true);
         cargoList.x = 550;
         cargoList.y = 12;
         categoriesNormal[8].addChild(cargoList);
         workshopAreaBG = new Sprite();
         workshopAreaBG.graphics.beginFill(0,0.6);
         workshopAreaBG.graphics.drawRect(0,0,630,450);
         workshopAreaBG.x = 10;
         workshopAreaBG.y = 12;
         categoriesNormal[9].addChild(workshopAreaBG);
         workshopArea = new ScrollableArea(630,450,630,450,true,false,false,3,10);
         workshopArea.x = 10;
         workshopArea.y = 12;
         categoriesNormal[9].addChild(workshopArea);
         workshopAreaFrame = new Sprite();
         drawConcaveRect(workshopAreaFrame,-1,-1,632,452);
         workshopAreaFrame.x = 10;
         workshopAreaFrame.y = 12;
         categoriesNormal[9].addChild(workshopAreaFrame);
         updateWorkshop();
         addChild(D);
         manageContainers = {};
         manageContainers.disp = new Sprite();
         manageContainers.BG = new Sprite();
         manageContainers.BG.graphics.beginFill(0,0.5);
         manageContainers.BG.graphics.drawRect(0,0,880,495);
         manageContainers.disp.addChild(manageContainers.BG);
         manageContainers.disp.visible = false;
         manageContainers.D = new Dialogue(590,480);
         manageContainers.D.x = 145;
         manageContainers.D.y = 8;
         manageContainers.disp.addChild(manageContainers.D);
         manageContainers.darkerBGs = new Sprite();
         manageContainers.darkerBGs.graphics.beginFill(0,0.2);
         manageContainers.darkerBGs.graphics.drawRect(10,10,570,250);
         manageContainers.darkerBGs.graphics.drawRect(200,270,360,60);
         manageContainers.darkerBGs.graphics.drawRect(200,350,360,60);
         manageContainers.D.addChild(manageContainers.darkerBGs);
         manageContainers.liquidsFrame = new Sprite();
         drawConcaveRect(manageContainers.liquidsFrame,-1,-1,572,252);
         manageContainers.liquidsFrame.x = 10;
         manageContainers.liquidsFrame.y = 10;
         manageContainers.D.addChild(manageContainers.liquidsFrame);
         manageContainers.liquidsArea = new ScrollableArea(560,250,560,250,true,false,false,3,10);
         manageContainers.liquidsArea.x = 10;
         manageContainers.liquidsArea.y = 10;
         manageContainers.D.addChild(manageContainers.liquidsArea);
         manageContainers.availableLight = new Sprite();
         manageContainers.availableLight.graphics.beginFill(16777215,0.15);
         manageContainers.availableLight.graphics.drawRect(0,0,550,70);
         manageContainers.availableLight.x = 15;
         manageContainers.availableLight.y = 265;
         manageContainers.availableLight.visible = false;
         manageContainers.D.addChild(manageContainers.availableLight);
         manageContainers.prohibitedLight = new Sprite();
         manageContainers.prohibitedLight.graphics.beginFill(16777215,0.15);
         manageContainers.prohibitedLight.graphics.drawRect(0,0,550,70);
         manageContainers.prohibitedLight.x = 15;
         manageContainers.prohibitedLight.y = 345;
         manageContainers.prohibitedLight.visible = false;
         manageContainers.D.addChild(manageContainers.prohibitedLight);
         manageContainers.availableArea = new ScrollableArea(360,50,360,50,false,true,false,3,10);
         manageContainers.availableArea.x = 200;
         manageContainers.availableArea.y = 270;
         manageContainers.D.addChild(manageContainers.availableArea);
         manageContainers.prohibitedFrame = new Sprite();
         drawConcaveRect(manageContainers.prohibitedFrame,-1,-1,362,62);
         manageContainers.prohibitedFrame.x = 200;
         manageContainers.prohibitedFrame.y = 350;
         manageContainers.D.addChild(manageContainers.prohibitedFrame);
         manageContainers.availableFrame = new Sprite();
         drawConcaveRect(manageContainers.availableFrame,-1,-1,362,62);
         manageContainers.availableFrame.x = 200;
         manageContainers.availableFrame.y = 270;
         manageContainers.D.addChild(manageContainers.availableFrame);
         manageContainers.prohibitedArea = new ScrollableArea(360,50,360,50,false,true,false,3,10);
         manageContainers.prohibitedArea.x = 200;
         manageContainers.prohibitedArea.y = 350;
         manageContainers.D.addChild(manageContainers.prohibitedArea);
         manageContainers.maskLines = new Sprite();
         manageContainers.maskLines.graphics.lineStyle(1,16777215);
         manageContainers.maskLines.graphics.drawRect(15,265,550,70);
         manageContainers.maskLines.graphics.drawRect(15,345,550,70);
         manageContainers.D.addToMask(manageContainers.maskLines);
         manageContainers.availableText = new EngineText(Texts.fetch(1217).toUpperCase() + ":",16777215,14,"center",30,280,160,40,true,true);
         manageContainers.availableText.y = 300 - manageContainers.availableText.textHeight / 2 - 2;
         manageContainers.D.addToMask(manageContainers.availableText);
         manageContainers.withdrawnText = new EngineText(Texts.fetch(1218).toUpperCase() + ":",16777215,14,"center",30,360,160,40,true,true);
         manageContainers.withdrawnText.y = 380 - manageContainers.withdrawnText.textHeight / 2 - 2;
         manageContainers.D.addToMask(manageContainers.withdrawnText);
         manageContainers.OKButton = new Button(2,manageContainersApprove,Texts.fetch(1181).toUpperCase());
         manageContainers.OKButton.x = 77;
         manageContainers.OKButton.y = 437;
         manageContainers.D.addChild(manageContainers.OKButton);
         manageContainers.cancelButton = new Button(2,manageContainersCancel,Texts.fetch(634).toUpperCase());
         manageContainers.cancelButton.x = 297;
         manageContainers.cancelButton.y = 437;
         manageContainers.D.addChild(manageContainers.cancelButton);
         manageContainers.dragSymbol = new Sprite();
         manageContainers.dragSymbol.scaleX = manageContainers.dragSymbol.scaleY = 0.12;
         manageContainers.disp.addChild(manageContainers.dragSymbol);
         addChild(manageContainers.disp);
         withdrawFromUse = {};
         withdrawFromUse.disp = new Sprite();
         withdrawFromUse.BG = new Sprite();
         withdrawFromUse.BG.graphics.beginFill(0,0.5);
         withdrawFromUse.BG.graphics.drawRect(0,0,880,495);
         withdrawFromUse.disp.addChild(withdrawFromUse.BG);
         withdrawFromUse.D = new Dialogue(470,370);
         withdrawFromUse.D.x = 205;
         withdrawFromUse.D.y = 63;
         withdrawFromUse.disp.addChild(withdrawFromUse.D);
         withdrawFromUse.doneButton = new Button(2,function():*
         {
            withdrawFromUse.disp.visible = false;
            setCargoList();
         },Texts.fetch(1229).toUpperCase());
         withdrawFromUse.doneButton.x = 32;
         withdrawFromUse.doneButton.y = 337;
         withdrawFromUse.D.addChild(withdrawFromUse.doneButton);
         withdrawFromUse.withdrawAllButton = new Button(2,withdrawAllGlobal,Texts.fetch(1230).toUpperCase());
         withdrawFromUse.withdrawAllButton.x = 242;
         withdrawFromUse.withdrawAllButton.y = 337;
         withdrawFromUse.D.addChild(withdrawFromUse.withdrawAllButton);
         withdrawFromUse.darkerArea = new Sprite();
         withdrawFromUse.darkerArea.graphics.beginFill(0,0.2);
         withdrawFromUse.darkerArea.graphics.drawRect(0,0,450,270);
         withdrawFromUse.darkerArea.x = 10;
         withdrawFromUse.darkerArea.y = 10;
         withdrawFromUse.D.addChild(withdrawFromUse.darkerArea);
         withdrawFromUse.listFrame = new Sprite();
         drawConcaveRect(withdrawFromUse.listFrame,-1,-1,452,272);
         withdrawFromUse.listFrame.x = 10;
         withdrawFromUse.listFrame.y = 10;
         withdrawFromUse.D.addChild(withdrawFromUse.listFrame);
         withdrawFromUse.listArea = new ScrollableArea(440,270,440,270,true,false,false,3,10);
         withdrawFromUse.listArea.x = 10;
         withdrawFromUse.listArea.y = 10;
         withdrawFromUse.D.addChild(withdrawFromUse.listArea);
         withdrawFromUse.nameText = new EngineText("",16777215,14,"center",10,285,450,20);
         withdrawFromUse.D.addToMask(withdrawFromUse.nameText);
         withdrawFromUse.inUseText = new EngineText("",16777215,14,"center",10,305,450,20);
         withdrawFromUse.D.addToMask(withdrawFromUse.inUseText);
         withdrawFromUse.disp.visible = false;
         addChild(withdrawFromUse.disp);
         settingsWindow = new SettingsWindow(GD);
         settingsWindow.onClose = updateData;
         settingsWindow.visible = false;
         addChild(settingsWindow);
         calculator = new Calculator();
         calculator.visible = false;
         addChild(calculator);
         weightChartDialogue = {};
         weightChartDialogue.disp = new Sprite();
         weightChartDialogue.BG = new Sprite();
         weightChartDialogue.BG.graphics.beginFill(0,0.5);
         weightChartDialogue.BG.graphics.drawRect(0,0,880,495);
         weightChartDialogue.disp.addChild(weightChartDialogue.BG);
         weightChartDialogue.d = new Dialogue(400,450);
         weightChartDialogue.d.x = 240;
         weightChartDialogue.d.y = 23;
         weightChartDialogue.disp.addChild(weightChartDialogue.d);
         weightChartDialogue.closeButton = new Button(2,function():*
         {
            weightChartDialogue.disp.visible = false;
         },Texts.fetch(902).toUpperCase());
         weightChartDialogue.closeButton.x = 107;
         weightChartDialogue.closeButton.y = 407;
         weightChartDialogue.d.addChild(weightChartDialogue.closeButton);
         addChild(weightChartDialogue.disp);
         weightChartDialogue.disp.visible = false;
         freeDialogue = {};
         freeDialogue.BG = new Sprite();
         freeDialogue.BG.graphics.beginFill(0,0.5);
         freeDialogue.BG.graphics.drawRect(0,0,880,495);
         freeDialogue.disp = new Sprite();
         freeDialogue.disp.addChild(freeDialogue.BG);
         freeDialogue.D = new Dialogue(400,400);
         freeDialogue.D.x = 240;
         freeDialogue.D.y = 48;
         freeDialogue.disp.addChild(freeDialogue.D);
         freeDialogue.Buttons = [];
         freeDialogue.Buttons[0] = new Button(2,function():*
         {
            freeDialogue.disp.visible = false;
         },Texts.fetch(634).toUpperCase());
         freeDialogue.Buttons[0].x = 97;
         freeDialogue.Buttons[0].y = 357;
         freeDialogue.Buttons[1] = new Button(2,function():*
         {
            checkSlaverRep();
            selectedCrewMember.category += 5;
            GD.affectSpecificReputation(5,2);
            crewList.update(GD.Caravans[0].People);
            freeDialogue.disp.visible = false;
         },Texts.fetch(1278).toUpperCase());
         freeDialogue.Buttons[1].x = 97;
         freeDialogue.Buttons[1].y = 327;
         freeDialogue.Buttons[2] = new Button(2,leavePersonWithSupplies,Texts.fetch(1279).toUpperCase());
         freeDialogue.Buttons[2].x = 97;
         freeDialogue.Buttons[2].y = 297;
         freeDialogue.Buttons[3] = new Button(2,leavePersonWithoutSupplies,Texts.fetch(1280).toUpperCase());
         freeDialogue.Buttons[3].x = 97;
         freeDialogue.Buttons[3].y = 267;
         freeDialogue.Buttons[4] = new Button(2,function():*
         {
            checkSlaverRep();
            selectedCrewMember.category = 2;
            GD.Caravans[0].money -= selectedCrewMember.salary;
            selectedCrewMember.payDay = GD.Time + 604800;
            crewList.update(GD.Caravans[0].People);
            GD.affectSpecificReputation(5,1);
            freeDialogue.disp.visible = false;
         },Texts.fetch(1272).toUpperCase());
         freeDialogue.Buttons[4].x = 97;
         freeDialogue.Buttons[4].y = 237;
         freeDialogue.Buttons[5] = new Button(2,function():*
         {
            checkSlaverRep();
            GD.affectSpecificReputation(5,1);
            dismissPerson();
            freeDialogue.disp.visible = false;
         },Texts.fetch(1281).toUpperCase());
         freeDialogue.Buttons[5].x = 97;
         freeDialogue.Buttons[5].y = 327;
         freeDialogue.topMostButton = 237;
         for(i in freeDialogue.Buttons)
         {
            freeDialogue.D.addChild(freeDialogue.Buttons[i]);
         }
         freeDialogue.Text = new EngineText("",16777215,14,"center",10,10,380,400,true,true);
         freeDialogue.D.addChild(freeDialogue.Text);
         freeDialogue.setText = function(param1:*):*
         {
            freeDialogue.Text.text = param1;
            freeDialogue.Text.y = 10 + (freeDialogue.topMostButton - 20) / 2 - freeDialogue.Text.textHeight / 2 - 2;
         };
         freeDialogue.Text.mouseEnabled = false;
         freeDialogue.disp.visible = false;
         addChild(freeDialogue.disp);
         cursorInfo = new Sprite();
         cursorInfo.mouseEnabled = false;
         cursorInfo.mouseChildren = false;
         addChild(cursorInfo);
         ConfirmDialogue = new YesNoDialogue();
         ConfirmDialogue.visible = false;
         addChild(ConfirmDialogue);
         messageDialogue = new YesNoDialogue(true);
         messageDialogue.visible = false;
         addChild(messageDialogue);
         readDialogue = {};
         readDialogue.disp = new Sprite();
         readDialogue.BG = new Sprite();
         readDialogue.BG.graphics.beginFill(0,0.5);
         readDialogue.BG.graphics.drawRect(0,0,880,495);
         readDialogue.disp.addChild(readDialogue.BG);
         readDialogue.D = new Dialogue(600,450);
         readDialogue.D.x = 140;
         readDialogue.D.y = 23;
         readDialogue.disp.addChild(readDialogue.D);
         readDialogue.disp.visible = false;
         readDialogue.nameText = new EngineText("",16777215,18,"center",10,8,580,30);
         readDialogue.D.addToMask(readDialogue.nameText);
         readDialogue.closeButton = new Button(2,function():*
         {
            readDialogue.disp.visible = false;
         },Texts.fetch(902).toUpperCase());
         readDialogue.closeButton.x = 197;
         readDialogue.closeButton.y = 412;
         readDialogue.D.addChild(readDialogue.closeButton);
         readDialogue.readAreaBG = new Sprite();
         readDialogue.readAreaBG.graphics.beginBitmapFill(new ImportedBitmap("TownBG.jpg").bitmapData);
         readDialogue.readAreaBG.graphics.drawRect(0,0,560,360);
         readDialogue.readAreaBG.graphics.endFill();
         readDialogue.readAreaBG.x = 20;
         readDialogue.readAreaBG.y = 40;
         readDialogue.readAreaBG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         readDialogue.D.addChild(readDialogue.readAreaBG);
         readDialogue.readArea = new ScrollableArea(550,360,550,360,true,false,false,3,10);
         readDialogue.readArea.x = 20;
         readDialogue.readArea.y = 40;
         readDialogue.D.addChild(readDialogue.readArea);
         addChild(readDialogue.disp);
         transportChangeNameWindow = {};
         transportChangeNameWindow.display = new Sprite();
         transportChangeNameWindow.display.graphics.beginFill(0,0.5);
         transportChangeNameWindow.display.graphics.drawRect(0,0,880,495);
         transportChangeNameWindow.display.graphics.endFill();
         transportChangeNameWindow.D = new Dialogue(500,200);
         transportChangeNameWindow.D.x = 190;
         transportChangeNameWindow.D.y = 148;
         transportChangeNameWindow.display.addChild(transportChangeNameWindow.D);
         transportChangeNameWindow.textFrame = new Sprite();
         drawConcaveRect(transportChangeNameWindow.textFrame,-1,-1,402,22);
         transportChangeNameWindow.textFrame.graphics.beginFill(11577504);
         transportChangeNameWindow.textFrame.graphics.drawRect(0,0,400,20);
         transportChangeNameWindow.textFrame.x = 50;
         transportChangeNameWindow.textFrame.y = 80;
         transportChangeNameWindow.D.addChild(transportChangeNameWindow.textFrame);
         transportChangeNameWindow.textLine = new EngineText("",4208688,14,"center",50,80,400,20);
         transportChangeNameWindow.textLine.type = "input";
         transportChangeNameWindow.textLine.selectable = true;
         transportChangeNameWindow.textLine.maxChars = 25;
         transportChangeNameWindow.D.addChild(transportChangeNameWindow.textLine);
         transportChangeNameWindow.confirmButton = new Button(2,function():*
         {
            selectedTransport.givenName = transportChangeNameWindow.textLine.text;
            transportChangeNameWindow.display.visible = false;
            updateTransport();
         },Texts.fetch(1181).toUpperCase());
         transportChangeNameWindow.confirmButton.x = 42;
         transportChangeNameWindow.confirmButton.y = 127;
         transportChangeNameWindow.D.addChild(transportChangeNameWindow.confirmButton);
         transportChangeNameWindow.cancelButton = new Button(2,function():*
         {
            transportChangeNameWindow.display.visible = false;
         },Texts.fetch(634).toUpperCase());
         transportChangeNameWindow.cancelButton.x = 252;
         transportChangeNameWindow.cancelButton.y = 127;
         transportChangeNameWindow.D.addChild(transportChangeNameWindow.cancelButton);
         transportChangeNameWindow.titleText = new EngineText(Texts.fetch(1182).toUpperCase() + ":",16777215,14,"center",0,50,500,20);
         transportChangeNameWindow.D.addToMask(transportChangeNameWindow.titleText);
         transportChangeNameWindow.display.visible = false;
         addChild(transportChangeNameWindow.display);
         setCat();
      }
      
      private function leavePersonWithSupplies() : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc1_:* = GD.Caravans[0].getConsumedFoodstuffs(selectedCrewMember);
         var _loc4_:* = createGroupFromPerson();
         checkSlaverRep();
         GD.affectSpecificReputation(5,2);
         selectedCrewMember.category = 1;
         for(_loc3_ in _loc1_)
         {
            _loc2_ = Item.itemNumFromCatSubCat(1,_loc1_[_loc3_].item);
            GD.Caravans[0].reduceCargo(_loc2_,_loc1_[_loc3_].amount);
            GD.Caravans[_loc4_].addCargo(_loc2_,_loc1_[_loc3_].amount);
            trace("giving " + selectedCrewMember.name + " item " + _loc2_ + " x " + _loc1_[_loc3_].amount);
         }
         GD.Caravans[0].reduceCargo(1,selectedCrewMember.waterConsumption);
         GD.Caravans[_loc4_].addCargo(1,selectedCrewMember.waterConsumption);
         crewList.update(GD.Caravans[0].People);
         freeDialogue.disp.visible = false;
      }
      
      private function leavePersonWithoutSupplies() : *
      {
         checkSlaverRep();
         GD.affectSpecificReputation(5,-1);
         selectedCrewMember.category = 1;
         createGroupFromPerson();
         crewList.update(GD.Caravans[0].People);
         freeDialogue.disp.visible = false;
      }
      
      private function checkSlaverRep() : *
      {
         if(selectedCrewMember.category == 4)
         {
            GD.freeASlave(selectedCrewMember);
         }
      }
      
      private function createGroupFromPerson() : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         if(selectedCrewMember.oldFaction != undefined)
         {
            _loc5_ = selectedCrewMember.oldFaction;
         }
         else
         {
            _loc5_ = 5;
         }
         var _loc1_:Caravan = new Caravan(_loc5_,GD.mapMode.mapSymbols);
         _loc1_.addPerson(selectedCrewMember);
         _loc1_.x = GD.Caravans[0].x;
         _loc1_.y = GD.Caravans[0].y;
         GD.Caravans[0].recentlyInteractedCaravans.push(_loc1_);
         _loc1_.recentlyInteractedCaravans.push(GD.Caravans[0]);
         _loc1_.name = selectedCrewMember.name;
         _loc1_.category = 2;
         var _loc4_:* = null;
         var _loc7_:* = Infinity;
         for(_loc6_ in Presets.Towns)
         {
            _loc3_ = MathFunctions.CalcDistance(GD.Caravans[0].x,GD.Caravans[0].y,Presets.Towns[_loc6_].x,Presets.Towns[_loc6_].y);
            if(_loc3_ < _loc7_)
            {
               _loc7_ = _loc3_;
               _loc4_ = _loc6_;
            }
         }
         _loc1_.moving = true;
         var _loc2_:Number = GD.Caravans.push(_loc1_) - 1;
         GD.directCaravanToNearestTown(_loc1_);
         GD.Caravans[0].removePerson(selectedCrewMember);
         return _loc2_;
      }
      
      private function updateWorkshop() : *
      {
         var j:*;
         var k:*;
         var tmpItem:*;
         var tmpItem2:*;
         var currLine:*;
         var linePos:*;
         var name:*;
         var thisOK:*;
         var thisMax:*;
         var maxPerDay:*;
         var minRel:*;
         var currRel:*;
         var canProduceToday:*;
         var i:*;
         var blackOver:*;
         var createWorkshopRequirementItem:* = function(param1:*, param2:*, param3:*):*
         {
            var _loc6_:* = undefined;
            if(currLine == 0)
            {
               _loc6_ = 500 - param2;
            }
            else
            {
               _loc6_ = 500;
            }
            var _loc5_:EngineText = new EngineText(param1,16777215,12,"center",1,0,500,20);
            if(linePos + _loc5_.textWidth + 10 > _loc6_)
            {
               linePos = 0;
               currLine = Number(currLine) + 1;
            }
            _loc5_.width = _loc5_.textWidth + 10;
            var _loc4_:Sprite = new Sprite();
            _loc4_.graphics.lineStyle(1,10526880);
            if(param3)
            {
               _loc4_.graphics.beginFill(7368816);
            }
            else
            {
               _loc4_.graphics.beginFill(3158064);
            }
            _loc4_.graphics.drawRect(0,1,_loc5_.textWidth + 10,16);
            _loc4_.addChild(_loc5_);
            _loc4_.x = 600 - linePos - _loc5_.textWidth - 10;
            _loc4_.y = 30 + currLine * 20;
            linePos += _loc5_.textWidth + 15;
            return _loc4_;
         };
         workshopItems = [];
         workshopArea.clearAll();
         for(i in GameData.workshopRecipes)
         {
            workshopItems[i] = {
               "outcome":GameData.workshopRecipes[i].outcome,
               "outcomeAmount":GameData.workshopRecipes[i].outcomeAmount,
               "originalInd":i
            };
            workshopItems[i].disp = new Sprite();
            workshopItems[i].darkBG = new Sprite();
            workshopItems[i].darkBG.graphics.beginFill(4210752);
            workshopItems[i].darkBG.graphics.drawRect(0,0,610,100);
            workshopItems[i].disp.addChild(workshopItems[i].darkBG);
            workshopItems[i].lightBG = new Sprite();
            workshopItems[i].lightBG.graphics.beginFill(6316128);
            workshopItems[i].lightBG.graphics.drawRect(0,0,610,100);
            workshopItems[i].disp.addChild(workshopItems[i].lightBG);
            workshopItems[i].lightBG.visible = false;
            workshopItems[i].frame = new Sprite();
            workshopItems[i].frame.graphics.lineStyle(1,10526880);
            workshopItems[i].frame.graphics.drawRect(0,0,610,100);
            workshopItems[i].disp.addChild(workshopItems[i].frame);
            workshopItems[i].picBG = new Sprite();
            workshopItems[i].picBG.graphics.lineStyle(1,10526880);
            workshopItems[i].picBG.graphics.beginFill(7368816);
            workshopItems[i].picBG.graphics.drawRect(0,0,80,80);
            workshopItems[i].picBG.x = 10;
            workshopItems[i].picBG.y = 10;
            workshopItems[i].disp.addChild(workshopItems[i].picBG);
            tmpItem = new Item(workshopItems[i].outcome,1);
            workshopItems[i].pic = tmpItem.picture;
            workshopItems[i].pic.scaleX = workshopItems[i].pic.scaleY = 0.32;
            workshopItems[i].pic.x = 10;
            workshopItems[i].pic.y = 10;
            workshopItems[i].disp.addChild(workshopItems[i].pic);
            workshopItems[i].nameText = new EngineText(tmpItem.name.toUpperCase(),16777215,14,"left",100,9,500,22);
            if(workshopItems[i].outcomeAmount != 1)
            {
               workshopItems[i].nameText.text += " X " + workshopItems[i].outcomeAmount;
            }
            workshopItems[i].disp.addChild(workshopItems[i].nameText);
            workshopItems[i].requirementsText = new EngineText(Texts.fetch(1555).toUpperCase() + ": ",16777215,12,"left",100,30,500,20);
            workshopItems[i].maxProduction = 0;
            workshopItems[i].maxAmount = Infinity;
            workshopItems[i].canProduce = true;
            currLine = 0;
            linePos = 0;
            for(j in GameData.workshopRecipes[i].requiredMaterials)
            {
               thisOK = false;
               for(k in GD.Caravans[0].Cargo)
               {
                  if(GD.Caravans[0].Cargo[k].type == GameData.workshopRecipes[i].requiredMaterials[j].type)
                  {
                     thisMax = Math.floor((GD.Caravans[0].Cargo[k].amount - GD.Caravans[0].Cargo[k].inUse) / GameData.workshopRecipes[i].requiredMaterials[j].amount);
                     thisOK = thisMax > 0;
                     if(thisMax < workshopItems[i].maxAmount)
                     {
                        workshopItems[i].maxAmount = thisMax;
                     }
                     break;
                  }
               }
               if(!thisOK)
               {
                  workshopItems[i].canProduce = false;
               }
               tmpItem2 = new Item(GameData.workshopRecipes[i].requiredMaterials[j].type,1);
               workshopItems[i].disp.addChild(createWorkshopRequirementItem(tmpItem2.name.toUpperCase() + " x " + GameData.workshopRecipes[i].requiredMaterials[j].amount,workshopItems[i].requirementsText.textWidth + 5,thisOK));
            }
            for(j in GameData.workshopRecipes[i].requiredTools)
            {
               thisOK = false;
               if(Item.getDataFromType(GameData.workshopRecipes[i].requiredTools[j]).device)
               {
                  thisOK = GD.Caravans[0].devicesWorking(GameData.workshopRecipes[i].requiredTools[j]) > 0;
               }
               else
               {
                  for(k in GD.Caravans[0].Cargo)
                  {
                     if(GD.Caravans[0].Cargo[k].type == GameData.workshopRecipes[i].requiredTools[j])
                     {
                        thisOK = true;
                        break;
                     }
                  }
               }
               if(!thisOK)
               {
                  workshopItems[i].canProduce = false;
               }
               tmpItem2 = new Item(GameData.workshopRecipes[i].requiredTools[j],1);
               workshopItems[i].disp.addChild(createWorkshopRequirementItem(tmpItem2.name.toUpperCase(),workshopItems[i].requirementsText.textWidth + 5,thisOK));
            }
            minRel = Infinity;
            for(j in GameData.workshopRecipes[i].requiredSkills)
            {
               switch(GameData.workshopRecipes[i].requiredSkills[j].skill)
               {
                  case "doctor":
                     name = 1556;
                     break;
                  case "veterinary":
                     name = 1557;
                     break;
                  case "mechanic":
                     name = 1558;
                     break;
                  case "hunting":
                     name = 1559;
                     break;
                  case "collecting":
                     name = 1560;
                     break;
                  case "smuggling":
                     name = 1561;
               }
               thisOK = GD.Caravans[0][GameData.workshopRecipes[i].requiredSkills[j].skill + "Skill"] >= GameData.workshopRecipes[i].requiredSkills[j].min;
               if(!thisOK)
               {
                  workshopItems[i].canProduce = false;
               }
               else
               {
                  currRel = GD.Caravans[0][GameData.workshopRecipes[i].requiredSkills[j].skill + "Skill"] / GameData.workshopRecipes[i].requiredSkills[j].min;
                  if(currRel < minRel)
                  {
                     minRel = currRel;
                  }
               }
               workshopItems[i].disp.addChild(createWorkshopRequirementItem(Texts.fetch(name).toUpperCase() + ": " + GameData.workshopRecipes[i].requiredSkills[j].min,workshopItems[i].requirementsText.textWidth + 5,thisOK));
            }
            if(minRel == Infinity)
            {
               minRel = 1;
            }
            maxPerDay = Math.round(minRel * GameData.workshopRecipes[i].perDay);
            canProduceToday = maxPerDay - GD.producedToday[i];
            if(canProduceToday <= 0)
            {
               workshopItems[i].canProduce = false;
            }
            workshopItems[i].maxAmount = Math.min(workshopItems[i].maxAmount,canProduceToday);
            workshopItems[i].dailyText = new EngineText(Texts.fetch(2864).replace("@number@",maxPerDay).toUpperCase(),16777215,12,"left",100,70,500,20);
            workshopItems[i].disp.addChild(workshopItems[i].dailyText);
            workshopItems[i].disp.addChild(workshopItems[i].requirementsText);
            workshopItems[i].produceText = new EngineText("",16777215,12,"right",100,10,500,22);
            workshopItems[i].disp.addChild(workshopItems[i].produceText);
            if(workshopItems[i].canProduce)
            {
               workshopItems[i].produceText.text = Texts.fetch(1562).replace("@number@",workshopItems[i].maxAmount).toUpperCase();
            }
            else
            {
               workshopItems[i].produceText.text = Texts.fetch(1563).toUpperCase();
            }
            if(!workshopItems[i].canProduce)
            {
               blackOver = new Sprite();
               blackOver.graphics.beginFill(0,0.3);
               blackOver.graphics.drawRect(0,0,610,100);
               workshopItems[i].disp.addChild(blackOver);
            }
            if(workshopItems[i].canProduce)
            {
               workshopItems[i].disp.buttonMode = true;
               workshopItems[i].disp.mouseChildren = false;
               workshopItems[i].disp.addEventListener("click",clickOnWorkshopItem,false,0,false);
            }
         }
         workshopItems.sortOn("canProduce",2);
         for(i in workshopItems)
         {
            workshopArea.addContent(workshopItems[i].disp,10,10 + i * 110,null,null,true);
         }
         workshopArea.updateSize();
      }
      
      private function clickOnWorkshopItem(param1:* = null) : *
      {
         var num:*;
         var i:*;
         var e:* = param1;
         for(i in workshopItems)
         {
            if(workshopItems[i].disp == e.target)
            {
               num = i;
               break;
            }
         }
         if(workshopItems[num].maxAmount == 1)
         {
            produceItem(num,workshopItems[num].maxAmount);
         }
         else
         {
            calculator.min = 1;
            calculator.max = workshopItems[num].maxAmount;
            calculator.visible = true;
            calculator.setValue(1);
            calculator.info.text = Texts.fetch(1580).toUpperCase();
            calculator.onDone = function():*
            {
               produceItem(num,calculator.value);
            };
         }
      }
      
      private function produceItem(param1:*, param2:*) : *
      {
         var i:*;
         var materialItem:*;
         var materialsText:*;
         var materialsList:*;
         var ind:* = param1;
         var amount:* = param2;
         var tmpItem:* = new Item(workshopItems[ind].outcome,1);
         var produceAmount:* = amount * workshopItems[ind].outcomeAmount;
         var productName:* = tmpItem.name;
         if(produceAmount != 1)
         {
            productName += " X " + MathFunctions.NumberFormat(produceAmount,3,true);
         }
         materialsList = [];
         for(i in GameData.workshopRecipes[workshopItems[ind].originalInd].requiredMaterials)
         {
            materialItem = new Item(GameData.workshopRecipes[workshopItems[ind].originalInd].requiredMaterials[i].type,1);
            materialsList.push(materialItem.name.toUpperCase() + " X " + MathFunctions.NumberFormat(GameData.workshopRecipes[workshopItems[ind].originalInd].requiredMaterials[i].amount * amount,3,true));
         }
         materialsText = materialsList.join(", ");
         ConfirmDialogue.setText(Texts.fetch(1564).replace("@item@",productName).toUpperCase() + "\n\n" + materialsText + "\n\n" + Texts.fetch(1565).toUpperCase());
         ConfirmDialogue.altVar = [ind,amount];
         ConfirmDialogue.onApprove = function():*
         {
            var _loc1_:* = undefined;
            trace("produce " + ConfirmDialogue.altVar[0] + " X " + ConfirmDialogue.altVar[1]);
            GD.Caravans[0].addCargo(workshopItems[ConfirmDialogue.altVar[0]].outcome,workshopItems[ConfirmDialogue.altVar[0]].outcomeAmount * ConfirmDialogue.altVar[1]);
            for(_loc1_ in GameData.workshopRecipes[workshopItems[ConfirmDialogue.altVar[0]].originalInd].requiredMaterials)
            {
               GD.Caravans[0].reduceCargo(GameData.workshopRecipes[workshopItems[ConfirmDialogue.altVar[0]].originalInd].requiredMaterials[_loc1_].type,GameData.workshopRecipes[workshopItems[ConfirmDialogue.altVar[0]].originalInd].requiredMaterials[_loc1_].amount * ConfirmDialogue.altVar[1]);
            }
            var _loc3_:* = workshopItems[ind].originalInd;
            var _loc2_:Number = GD.producedToday[_loc3_] + ConfirmDialogue.altVar[1];
            GD.producedToday[_loc3_] = _loc2_;
            updateWorkshop();
         };
         ConfirmDialogue.visible = true;
      }
      
      private function updateCargo() : *
      {
         var _loc8_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc9_:* = undefined;
         var _loc6_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:* = undefined;
         var _loc10_:* = undefined;
         var _loc7_:* = undefined;
         updateBottomLine();
         if(cargoPicInside is DisplayObject && cargoPic.contains(cargoPicInside))
         {
            cargoPic.removeChild(cargoPicInside);
         }
         if(cargoInfoTitles is Array)
         {
            for(_loc6_ in cargoInfoTitles)
            {
               cargoInfoArea.Content.removeChild(cargoInfoTitles[_loc6_]);
            }
         }
         if(cargoInfoValues is Array)
         {
            for(_loc6_ in cargoInfoValues)
            {
               cargoInfoArea.Content.removeChild(cargoInfoValues[_loc6_]);
            }
         }
         cargoInfoArea.contentList = [];
         cargoInfoTitles = [];
         cargoInfoValues = [];
         cargoName.visible = cargoNameFrame.visible = weightPerUnitTitle.visible = weightPerUnitValue.visible = inUseText.visible = availableAmountText.visible = totalWeightTitle.visible = totalWeightValue.visible = pricePerUnitTitle.visible = pricePerUnitValue.visible = seePricesButton.visible = warningText.visible = additionalInfoText.visible = additionalInfoFrame.visible = cargoInfoArea.visible = cargoCategoryText.visible = cargoThrowAwayButton.visible = cargoWeightChartButton.visible = cargoRemoveFromUseButton.visible = cargoReadButton.visible = cargoManageContainersButton.visible = cargoNotInUseText.visible = cargoAvailableVolumeText.visible = cargoDeviceOnOffButton.visible = cargoSelected is Item;
         if(cargoSelected is Item)
         {
            cargoPicInside = cargoSelected.picture;
            cargoPic.addChild(cargoPicInside);
            if(cargoSelected.name.length > 25)
            {
               cargoName.text = cargoSelected.name.toUpperCase().substring(0,24) + ".";
            }
            else
            {
               cargoName.text = cargoSelected.name.toUpperCase();
            }
            cargoNameFrame.graphics.clear();
            cargoNameFrame.graphics.lineStyle(1,16777215);
            cargoNameFrame.graphics.drawRect(130 - cargoName.textWidth / 2 - 10,0,cargoName.textWidth + 20,40);
            cargoThrowAwayButton.visible = cargoSelected.amount - cargoSelected.inUse > 0;
            cargoReadButton.visible = cargoSelected.itemData.book || cargoSelected.itemData.map;
            cargoRemoveFromUseButton.visible = cargoSelected.inUse > 0 && !(cargoSelected.itemData.liquidsContainer || cargoSelected.itemData.liquid || cargoSelected.itemData.device);
            cargoManageContainersButton.visible = cargoSelected.itemData.liquidsContainer || cargoSelected.itemData.liquid;
            cargoDeviceOnOffButton.visible = cargoSelected.itemData.device;
            availableAmountText.text = Texts.fetch(1236).toUpperCase() + ": " + cargoSelected.amount;
            inUseText.text = Texts.fetch(1195).toUpperCase() + ": " + cargoSelected.inUse;
            weightPerUnitValue.text = Math.round(cargoSelected.weightPerUnit * 1000) / 1000 + " " + Texts.fetch(12).toUpperCase();
            totalWeightValue.text = Math.round(cargoSelected.totalWeight * 1000) / 1000 + " " + Texts.fetch(12).toUpperCase();
            if(cargoSelected.averagePrice == undefined)
            {
               pricePerUnitTitle.text = Texts.fetch(1192).toUpperCase();
               pricePerUnitValue.text = MathFunctions.NumberFormat(GD.globalItemPrice(cargoSelected.type),2);
            }
            else
            {
               pricePerUnitTitle.text = Texts.fetch(6806).toUpperCase();
               pricePerUnitValue.text = MathFunctions.NumberFormat(cargoSelected.averagePrice,2);
            }
            seePricesButton.visible = false;
            for(_loc6_ in GD.knownPrices)
            {
               if(GD.knownPrices[_loc6_].item == cargoSelected.type)
               {
                  seePricesButton.visible = true;
                  break;
               }
            }
            warningText.text = "";
            _loc9_ = GD.Caravans[0].getConsumptionProduction();
            if(cargoSelected.itemData.device && cargoSelected.consumption.length > 0)
            {
               _loc1_ = false;
               for(_loc6_ in cargoSelected.consumption)
               {
                  _loc2_ = false;
                  for(_loc8_ in GD.Caravans[0].Cargo)
                  {
                     if(GD.Caravans[0].Cargo[_loc8_].type == cargoSelected.consumption[_loc6_].item)
                     {
                        _loc2_ = true;
                        break;
                     }
                  }
                  if(!_loc2_)
                  {
                     _loc1_ = true;
                     break;
                  }
               }
               if(_loc1_)
               {
                  warningText.text = Texts.fetch(1249).toUpperCase();
               }
            }
            if(cargoSelected.itemData.device && cargoSelected.electricityConsumption > 0 && _loc9_.electricityConsumption > _loc9_.electricityProduction)
            {
               warningText.text = Texts.fetch(4591).toUpperCase();
            }
            warningText.y = 202 - warningText.textHeight / 2 - 2;
            cargoNotInUseText.text = Texts.fetch(1232).toUpperCase() + ": " + Math.round((cargoSelected.amount - cargoSelected.inUse) * 1000) / 1000;
            cargoAvailableVolumeText.visible = cargoSelected.itemData.liquid;
            if(cargoSelected.itemData.liquid)
            {
               cargoAvailableVolumeText.text = Texts.fetch(1239).toUpperCase() + ": " + Math.round((GD.Caravans[0].maxLiquidAmount(cargoSelected.type) + cargoSelected.amount) * 1000) / 1000 + Texts.fetch(11);
            }
            _loc4_ = cargoSelected.getInfoPairs();
            _loc7_ = 5;
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if(_loc4_[_loc6_].key != "name" && _loc4_[_loc6_].key != "weight" && _loc4_[_loc6_].key != "blank" && (_loc4_[_loc6_].key != "type" || cargoSelected.category == 2))
               {
                  if(_loc4_[_loc6_].key == "modesTitle" || _loc4_[_loc6_].key == "productionTitle" && cargoInfoTitles.length > 0 || _loc4_[_loc6_].key == "description" && cargoInfoTitles.length > 0)
                  {
                     _loc7_ += 10;
                  }
                  if(_loc4_[_loc6_].value != undefined)
                  {
                     _loc3_ = cargoInfoTitles.push(new EngineText(_loc4_[_loc6_].name.substring(0,28 - String(_loc4_[_loc6_].value).length),16777215,14,"left",5,_loc7_,240,20)) - 1;
                     _loc5_ = cargoInfoValues.push(new EngineText(_loc4_[_loc6_].value,16777215,14,"right",5,_loc7_,240,20)) - 1;
                     cargoInfoValues[_loc5_].alpha = 0.8;
                     cargoInfoArea.addContent(cargoInfoValues[_loc5_],null,null,null,null,true);
                  }
                  else if(_loc4_[_loc6_].multiline)
                  {
                     _loc10_ = OtherFunctions.breakToLines(_loc4_[_loc6_].name,28);
                     _loc8_ = 0;
                     while(_loc8_ < _loc10_.length)
                     {
                        _loc3_ = cargoInfoTitles.push(new EngineText(_loc10_[_loc8_],16777215,14,"left",5,_loc7_,240,20)) - 1;
                        cargoInfoTitles[_loc3_].alpha = 0.8;
                        cargoInfoArea.addContent(cargoInfoTitles[_loc3_],null,null,null,null,true);
                        _loc7_ += 20;
                        _loc8_++;
                     }
                  }
                  else
                  {
                     _loc3_ = cargoInfoTitles.push(new EngineText(_loc4_[_loc6_].name.substring(0,28),16777215,14,"center",5,_loc7_,240,20)) - 1;
                  }
                  if(!_loc4_[_loc6_].multiline)
                  {
                     cargoInfoTitles[_loc3_].alpha = 0.8;
                     cargoInfoArea.addContent(cargoInfoTitles[_loc3_],null,null,null,null,true);
                     _loc7_ += 20;
                  }
                  if(_loc4_[_loc6_].key == "type" || _loc4_[_loc6_].key == "modesTitle" || _loc4_[_loc6_].key == "productionTitlePart2" || _loc4_[_loc6_].key == "consumptionTitlePart2")
                  {
                     _loc7_ += 10;
                  }
               }
               _loc6_++;
            }
            if(cargoSelected.category == 2)
            {
               cargoCategoryText.text = Texts.fetch(194).toUpperCase();
            }
            else if(cargoSelected.category == 3)
            {
               cargoCategoryText.text = Texts.fetch(298).toUpperCase();
            }
            else if(cargoSelected.category == 4)
            {
               cargoCategoryText.text = Texts.fetch(1072).toUpperCase();
            }
            else if(cargoSelected.category == 5)
            {
               cargoCategoryText.text = Texts.fetch(926).toUpperCase();
            }
            else if(cargoSelected.category == 1)
            {
               if(cargoSelected.itemData.firstAid)
               {
                  cargoCategoryText.text = Texts.fetch(197).toUpperCase();
               }
               else if(cargoSelected.itemData.food)
               {
                  cargoCategoryText.text = Texts.fetch(15).toUpperCase();
               }
               else if(cargoSelected.itemData.liquid)
               {
                  cargoCategoryText.text = Texts.fetch(1197).toUpperCase();
               }
               else if(cargoSelected.itemData.liquidsContainer)
               {
                  cargoCategoryText.text = Texts.fetch(1198).toUpperCase();
               }
               else if(cargoSelected.itemData.device)
               {
                  cargoCategoryText.text = Texts.fetch(1199).toUpperCase();
               }
               else
               {
                  cargoCategoryText.text = Texts.fetch(1200).toUpperCase();
               }
            }
            else
            {
               cargoCategoryText.text = "";
            }
         }
         cargoInfoArea.updateSize();
      }
      
      private function openManageContainers() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         manageContainers.lcCopy = [];
         for(_loc1_ in GD.Caravans[0].liquidsContainers)
         {
            manageContainers.lcCopy[_loc1_] = [];
            for(_loc2_ in GD.Caravans[0].liquidsContainers[_loc1_])
            {
               manageContainers.lcCopy[_loc1_][_loc2_] = {
                  "type":GD.Caravans[0].liquidsContainers[_loc1_][_loc2_].type,
                  "amount":GD.Caravans[0].liquidsContainers[_loc1_][_loc2_].amount
               };
            }
         }
         manageContainers.inUseCopy = [];
         for(_loc1_ in GD.Caravans[0].Cargo)
         {
            manageContainers.inUseCopy[_loc1_] = GD.Caravans[0].Cargo[_loc1_].inUse;
         }
         updateManageContainers();
         manageContainers.disp.visible = true;
         if(visible)
         {
            GD.displayTutorial(18);
         }
         manageContainers.dragging = false;
         manageContainers.changes = false;
      }
      
      private function updateManageContainers() : *
      {
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(manageContainers.liquids is Array)
         {
            for(_loc2_ in manageContainers.liquids)
            {
               if(manageContainers.liquids[_loc2_] is Object && manageContainers.liquids[_loc2_].disp is DisplayObject)
               {
                  manageContainers.liquidsArea.Content.removeChild(manageContainers.liquids[_loc2_].disp);
               }
            }
         }
         manageContainers.liquidsArea.contentList = [];
         manageContainers.liquids = [];
         for(_loc2_ in GD.Caravans[0].Cargo)
         {
            if(GD.Caravans[0].Cargo[_loc2_].itemData.liquid)
            {
               manageContainers.liquids.push({
                  "type":GD.Caravans[0].Cargo[_loc2_].type,
                  "disp":new Sprite(),
                  "pic":GD.Caravans[0].Cargo[_loc2_].picture,
                  "name":GD.Caravans[0].Cargo[_loc2_].name,
                  "amount":GD.Caravans[0].Cargo[_loc2_].amount
               });
            }
         }
         for(_loc2_ in manageContainers.liquids)
         {
            manageContainers.liquids[_loc2_].light = new Sprite();
            manageContainers.liquids[_loc2_].light.graphics.beginFill(16777215,0.15);
            manageContainers.liquids[_loc2_].light.graphics.drawRect(-10,-10,560,80);
            manageContainers.liquids[_loc2_].light.visible = false;
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].light);
            manageContainers.liquids[_loc2_].picBG = new ImportedBitmap("GenericBackground.png");
            manageContainers.liquids[_loc2_].picBG.scaleX = manageContainers.liquids[_loc2_].picBG.scaleY = 0.6;
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].picBG);
            manageContainers.liquids[_loc2_].picEnvelope = new Sprite();
            manageContainers.liquids[_loc2_].picEnvelope.addChild(manageContainers.liquids[_loc2_].pic);
            manageContainers.liquids[_loc2_].picEnvelope.scaleX = manageContainers.liquids[_loc2_].picEnvelope.scaleY = 0.24;
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].picEnvelope);
            manageContainers.liquids[_loc2_].nameText = new EngineText(manageContainers.liquids[_loc2_].name.toUpperCase(),16777215,12,"center",70,1,100,20);
            manageContainers.liquids[_loc2_].nameText.alpha = 0.8;
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].nameText);
            manageContainers.liquids[_loc2_].maxAmount = 0;
            manageContainers.liquids[_loc2_].maxAmount = manageContainers.liquids[_loc2_].amount + GD.Caravans[0].maxLiquidAmountBeforeDistribution(manageContainers.liquids[_loc2_].type);
            manageContainers.liquids[_loc2_].amountText = new EngineText(Math.round(manageContainers.liquids[_loc2_].amount * 1000) / 1000 + " / " + Math.round(manageContainers.liquids[_loc2_].maxAmount * 1000) / 1000,16777215,12,"center",70,21,100,20);
            manageContainers.liquids[_loc2_].amountText.alpha = 0.8;
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].amountText);
            manageContainers.liquids[_loc2_].bar = new Sprite();
            manageContainers.liquids[_loc2_].bar.x = 70;
            manageContainers.liquids[_loc2_].bar.y = 40;
            if(manageContainers.liquids[_loc2_].amount > manageContainers.liquids[_loc2_].maxAmount)
            {
               _loc1_ = 100 * manageContainers.liquids[_loc2_].maxAmount / manageContainers.liquids[_loc2_].amount;
               manageContainers.liquids[_loc2_].bar.graphics.beginFill(8552104);
               manageContainers.liquids[_loc2_].bar.graphics.drawRect(0,11,_loc1_,8);
               manageContainers.liquids[_loc2_].bar.graphics.endFill();
               manageContainers.liquids[_loc2_].bar.graphics.beginFill(14060314);
               manageContainers.liquids[_loc2_].bar.graphics.drawRect(_loc1_ + 1,11,100 - _loc1_,8);
               manageContainers.liquids[_loc2_].bar.graphics.endFill();
               manageContainers.liquids[_loc2_].bar.graphics.lineStyle(1,16777215,0.7);
               manageContainers.liquids[_loc2_].bar.graphics.drawRect(0,10,_loc1_,10);
            }
            else
            {
               manageContainers.liquids[_loc2_].bar.graphics.beginFill(8552104);
               if(manageContainers.liquids[_loc2_].maxAmount > 0)
               {
                  _loc1_ = 100 * manageContainers.liquids[_loc2_].amount / manageContainers.liquids[_loc2_].maxAmount;
               }
               else
               {
                  _loc1_ = 0;
               }
               manageContainers.liquids[_loc2_].bar.graphics.drawRect(0,11,_loc1_,8);
               manageContainers.liquids[_loc2_].bar.graphics.endFill();
               manageContainers.liquids[_loc2_].bar.graphics.lineStyle(1,16777215,0.7);
               manageContainers.liquids[_loc2_].bar.graphics.drawRect(0,10,100,10);
            }
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].bar);
            manageContainers.liquids[_loc2_].containersFrame = new Sprite();
            drawConcaveRect(manageContainers.liquids[_loc2_].containersFrame,-1,-1,362,62);
            manageContainers.liquids[_loc2_].containersFrame.x = 180;
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].containersFrame);
            manageContainers.liquids[_loc2_].containersArea = new ScrollableArea(360,50,360,50,false,true,false,3,10);
            manageContainers.liquids[_loc2_].containersArea.x = 180;
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].containersArea);
            manageContainers.liquids[_loc2_].bottomLine = new Sprite();
            manageContainers.liquids[_loc2_].bottomLine.graphics.lineStyle(1,0,0.6);
            manageContainers.liquids[_loc2_].bottomLine.graphics.moveTo(-10,70);
            manageContainers.liquids[_loc2_].bottomLine.graphics.lineTo(550,70);
            manageContainers.liquids[_loc2_].bottomLine.graphics.lineStyle(1,16777215,0.3);
            manageContainers.liquids[_loc2_].bottomLine.graphics.moveTo(-10,71);
            manageContainers.liquids[_loc2_].bottomLine.graphics.lineTo(550,71);
            manageContainers.liquids[_loc2_].disp.addChild(manageContainers.liquids[_loc2_].bottomLine);
            if(GD.Caravans[0].liquidsContainers[manageContainers.liquids[_loc2_].type] is Array)
            {
               manageContainers.liquids[_loc2_].containers = generateContainersList(manageContainers.liquids[_loc2_].type);
               for(_loc3_ in manageContainers.liquids[_loc2_].containers)
               {
                  manageContainers.liquids[_loc2_].containersArea.addContent(manageContainers.liquids[_loc2_].containers[_loc3_].disp);
               }
            }
            manageContainers.liquids[_loc2_].disp.x = 10;
            manageContainers.liquids[_loc2_].disp.y = 10 + _loc2_ * 80;
            manageContainers.liquidsArea.addContent(manageContainers.liquids[_loc2_].disp,10,10 + _loc2_ * 80,540,70,true);
         }
         manageContainers.liquidsArea.updateSize();
         if(manageContainers.availableContainers is Array)
         {
            for(_loc2_ in manageContainers.availableContainers)
            {
               if(manageContainers.availableContainers[_loc2_] is Object && manageContainers.availableContainers[_loc2_].disp is DisplayObject)
               {
                  manageContainers.availableArea.Content.removeChild(manageContainers.availableContainers[_loc2_].disp);
               }
            }
         }
         manageContainers.availableArea.contentList = [];
         manageContainers.availableContainers = generateContainersList(0);
         for(_loc2_ in manageContainers.availableContainers)
         {
            manageContainers.availableArea.addContent(manageContainers.availableContainers[_loc2_].disp,null,null,null,null,true);
         }
         manageContainers.availableArea.updateSize();
         if(manageContainers.prohibitedContainers is Array)
         {
            for(_loc2_ in manageContainers.prohibitedContainers)
            {
               if(manageContainers.prohibitedContainers[_loc2_] is Object && manageContainers.prohibitedContainers[_loc2_].disp is DisplayObject)
               {
                  manageContainers.prohibitedArea.Content.removeChild(manageContainers.prohibitedContainers[_loc2_].disp);
               }
            }
         }
         manageContainers.prohibitedArea.contentList = [];
         manageContainers.prohibitedContainers = generateContainersList(-1);
         for(_loc2_ in manageContainers.prohibitedContainers)
         {
            manageContainers.prohibitedArea.addContent(manageContainers.prohibitedContainers[_loc2_].disp,null,null,null,null,true);
         }
         manageContainers.prohibitedArea.updateSize();
      }
      
      private function generateContainersList(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         for(_loc3_ in GD.Caravans[0].liquidsContainers[param1])
         {
            _loc2_[_loc3_] = {};
            _loc2_[_loc3_].disp = new Sprite();
            _loc2_[_loc3_].BG = new Sprite();
            _loc2_[_loc3_].BG.graphics.beginFill(4209720);
            _loc2_[_loc3_].BG.graphics.lineStyle(0.5,8419440);
            _loc2_[_loc3_].BG.graphics.drawRect(0,0,30,30);
            _loc2_[_loc3_].disp.addChild(_loc2_[_loc3_].BG);
            _loc2_[_loc3_].disp.y = 10;
            _loc2_[_loc3_].disp.x = 10 + _loc3_ * 40;
            _loc4_ = new Item(GD.Caravans[0].liquidsContainers[param1][_loc3_].type,1);
            _loc2_[_loc3_].picEnvelope = new Sprite();
            _loc2_[_loc3_].picEnvelope.addChild(_loc4_.picture);
            _loc2_[_loc3_].picEnvelope.scaleX = _loc2_[_loc3_].picEnvelope.scaleY = 0.12;
            _loc2_[_loc3_].disp.addChild(_loc2_[_loc3_].picEnvelope);
            _loc2_[_loc3_].num = new EngineText("x" + Math.round(GD.Caravans[0].liquidsContainers[param1][_loc3_].amount),16777215,12,"right",1,15,28,15);
            _loc2_[_loc3_].disp.addChild(_loc2_[_loc3_].num);
            _loc2_[_loc3_].disp.buttonMode = true;
            _loc2_[_loc3_].disp.mouseChildren = false;
            _loc2_[_loc3_].disp.addEventListener("mouseDown",clickOnContainer,false,0,false);
         }
         return _loc2_;
      }
      
      private function clickOnContainer(param1:*) : *
      {
         var tmpItem:*;
         var e:* = param1;
         manageContainers.dragFromType = manageContainers.overType;
         manageContainers.dragFromContainer = manageContainers.overContainer;
         if(manageContainers.overType == -1)
         {
            ConfirmDialogue.setText(Texts.fetch(1222).toUpperCase());
            ConfirmDialogue.onApprove = function():*
            {
               var _loc1_:* = GD.Caravans[0].liquidsContainers[manageContainers.dragFromType][manageContainers.dragFromContainer].type;
               GD.Caravans[0].moveLiquidsContainer(_loc1_,Infinity,-1,0);
               manageContainers.changes = true;
               updateManageContainers();
            };
            ConfirmDialogue.visible = true;
         }
         else
         {
            manageContainers.dragging = true;
            tmpItem = new Item(GD.Caravans[0].liquidsContainers[manageContainers.overType][manageContainers.overContainer].type,1);
            if(manageContainers.dragSymbolInside is DisplayObject && manageContainers.dragSymbol.contains(manageContainers.dragSymbolInside))
            {
               manageContainers.dragSymbol.removeChild(manageContainers.dragSymbolInside);
            }
            manageContainers.dragSymbolInside = tmpItem.picture;
            manageContainers.dragSymbol.addChild(manageContainers.dragSymbolInside);
            manageContainers.mouseShiftX = e.target.mouseX;
            manageContainers.mouseShiftY = e.target.mouseY;
         }
      }
      
      private function manageContainersApprove() : *
      {
         var j:*;
         var totalVolume:*;
         var i:*;
         var txt:*;
         var pieces:*;
         manageContainers.liquidsToSpill = [];
         for(i in GD.Caravans[0].Cargo)
         {
            if(GD.Caravans[0].Cargo[i].itemData.liquid)
            {
               totalVolume = GD.Caravans[0].Cargo[i].amount + GD.Caravans[0].maxLiquidAmountBeforeDistribution(GD.Caravans[0].Cargo[i].type);
               if(GD.Caravans[0].Cargo[i].amount > totalVolume)
               {
                  manageContainers.liquidsToSpill.push(new Item(GD.Caravans[0].Cargo[i].type,GD.Caravans[0].Cargo[i].amount - totalVolume));
               }
            }
         }
         if(manageContainers.liquidsToSpill.length == 0)
         {
            updateBottomLine();
            manageContainers.disp.visible = false;
            setCargoList();
         }
         else
         {
            txt = Texts.fetch(1224).toUpperCase() + " ";
            pieces = [];
            for(i in manageContainers.liquidsToSpill)
            {
               pieces[i] = Texts.fetch(1225).replace("@amount@",Math.round(manageContainers.liquidsToSpill[i].amount * 1000) / 1000 + Texts.fetch(11)).replace("@liquidname@",manageContainers.liquidsToSpill[i].name).toUpperCase();
            }
            txt += pieces.join("; ") + "." + String.fromCharCode(13);
            txt += Texts.fetch(1226).toUpperCase();
            ConfirmDialogue.setText(txt);
            ConfirmDialogue.onApprove = function():*
            {
               var _loc1_:* = undefined;
               for(_loc1_ in manageContainers.liquidsToSpill)
               {
                  GD.Caravans[0].reduceCargo(manageContainers.liquidsToSpill[_loc1_].type,manageContainers.liquidsToSpill[_loc1_].amount);
               }
               manageContainers.disp.visible = false;
               updateBottomLine();
               setCargoList();
            };
            ConfirmDialogue.visible = true;
         }
      }
      
      private function manageContainersCancel() : *
      {
         if(manageContainers.changes)
         {
            ConfirmDialogue.setText(Texts.fetch(1223).toUpperCase());
            ConfirmDialogue.onApprove = function():*
            {
               var _loc2_:* = undefined;
               var _loc1_:* = undefined;
               GD.Caravans[0].liquidsContainers = [];
               for(_loc1_ in manageContainers.lcCopy)
               {
                  GD.Caravans[0].liquidsContainers[_loc1_] = [];
                  for(_loc2_ in manageContainers.lcCopy[_loc1_])
                  {
                     GD.Caravans[0].liquidsContainers[_loc1_][_loc2_] = {
                        "type":manageContainers.lcCopy[_loc1_][_loc2_].type,
                        "amount":manageContainers.lcCopy[_loc1_][_loc2_].amount
                     };
                  }
               }
               for(_loc1_ in manageContainers.inUseCopy)
               {
                  GD.Caravans[0].Cargo[_loc1_].inUse = manageContainers.inUseCopy[_loc1_];
               }
               manageContainers.disp.visible = false;
            };
            ConfirmDialogue.visible = true;
         }
         else
         {
            manageContainers.disp.visible = false;
         }
      }
      
      private function cargoThrowAway() : *
      {
         var _loc1_:Number = cargoSelected.amount - cargoSelected.inUse;
         if(_loc1_ <= 1)
         {
            doThrowAway(_loc1_);
         }
         if(_loc1_ > 1)
         {
            if(cargoSelected.divisible)
            {
               calculator.min = 0.1;
            }
            else
            {
               calculator.min = 1;
            }
            calculator.max = _loc1_;
            calculator.visible = true;
            calculator.setValue(1);
            calculator.info.text = Texts.fetch(1212).toUpperCase();
            calculator.onDone = doThrowAway;
         }
      }
      
      private function doThrowAway(param1:*) : *
      {
         var amount:* = param1;
         ConfirmDialogue.setText(Texts.fetch(1213).replace("@itemname@",cargoSelected.name).replace("@number@",MathFunctions.NumberFormat(amount,1,true)).toUpperCase());
         ConfirmDialogue.onApprove = function():*
         {
            GD.Caravans[0].reduceCargo(cargoSelected.type,amount);
            setCargoList();
         };
         ConfirmDialogue.visible = true;
      }
      
      private function cargoWeightChart() : *
      {
         weightChartDialogue.disp.visible = true;
         redrawWeightChart(cargoSelected);
      }
      
      private function redrawWeightChart(param1:* = null) : *
      {
         var _loc11_:* = undefined;
         var _loc24_:* = undefined;
         var _loc26_:* = undefined;
         var _loc22_:* = undefined;
         var _loc5_:* = undefined;
         var _loc12_:* = undefined;
         _loc12_ = 150;
         var _loc13_:* = undefined;
         var _loc19_:* = undefined;
         var _loc2_:* = undefined;
         var _loc8_:* = undefined;
         _loc8_ = 0.7;
         var _loc10_:* = undefined;
         var _loc15_:* = undefined;
         var _loc4_:* = undefined;
         if(weightChartDialogue.chart is DisplayObject && weightChartDialogue.d.contains(weightChartDialogue.chart))
         {
            weightChartDialogue.d.removeChild(weightChartDialogue.chart);
         }
         if(weightChartDialogue.legend is DisplayObject && weightChartDialogue.d.contains(weightChartDialogue.legend))
         {
            weightChartDialogue.d.removeChild(weightChartDialogue.legend);
         }
         var _loc9_:Array = [15068920,14602788,6972825,9988385,8958127,16773287,14012927,7943220,9790849,13936743];
         var _loc27_:Array = [1204,298,1205,926,15,1206,197,1207,1208,1200];
         var _loc16_:Sprite = new Sprite();
         var _loc23_:Array = [];
         _loc22_ = 0;
         while(_loc22_ < 10)
         {
            _loc23_[_loc22_] = 0;
            _loc22_++;
         }
         for(_loc22_ in GD.Caravans[0].Cargo)
         {
            _loc23_[GD.Caravans[0].Cargo[_loc22_].filterCategory] += GD.Caravans[0].Cargo[_loc22_].totalWeight;
         }
         if(param1 is Item)
         {
            _loc24_ = param1.filterCategory;
         }
         var _loc25_:* = GD.Caravans[0].totalCargo;
         var _loc7_:Array = [];
         var _loc29_:* = 0;
         for(_loc22_ in _loc23_)
         {
            _loc7_[_loc22_] = {};
            _loc7_[_loc22_].disp = new Sprite();
            _loc7_[_loc22_].circle = new Sprite();
            _loc7_[_loc22_].circle.graphics.beginFill(_loc9_[_loc22_]);
            _loc7_[_loc22_].circle.graphics.drawCircle(150,150,150);
            _loc7_[_loc22_].disp.addChild(_loc7_[_loc22_].circle);
            _loc5_ = _loc29_ + _loc23_[_loc22_] / _loc25_ * 3.141592653589793 * 2;
            if(param1 is Item && _loc22_ == _loc24_)
            {
               _loc26_ = _loc29_ + (_loc5_ - _loc29_) / 2;
            }
            _loc7_[_loc22_].mask = new Sprite();
            _loc7_[_loc22_].mask.graphics.beginFill(16711680);
            _loc7_[_loc22_].mask.graphics.moveTo(150,150);
            _loc11_ = _loc29_;
            while(_loc11_ < _loc5_)
            {
               _loc7_[_loc22_].mask.graphics.lineTo(150 + 150 * Math.sin(_loc11_) * 1.5,150 - 150 * Math.cos(_loc11_) * 1.5);
               _loc11_ += 0.5;
            }
            _loc7_[_loc22_].mask.graphics.lineTo(150 + 150 * Math.sin(_loc5_) * 1.5,150 - 150 * Math.cos(_loc5_) * 1.5);
            _loc7_[_loc22_].mask.graphics.endFill;
            _loc7_[_loc22_].disp.addChild(_loc7_[_loc22_].mask);
            _loc7_[_loc22_].circle.mask = _loc7_[_loc22_].mask;
            _loc29_ = _loc5_;
            _loc16_.addChild(_loc7_[_loc22_].disp);
         }
         if(param1 is Item)
         {
            _loc13_ = param1.totalWeight / _loc25_ * 3.141592653589793 * 2;
            _loc19_ = new Sprite();
            _loc19_.graphics.beginFill(16777215,0.5);
            _loc19_.graphics.drawCircle(150,150,150);
            _loc16_.addChild(_loc19_);
            _loc2_ = new Sprite();
            _loc29_ = _loc26_ - _loc13_ / 2;
            _loc5_ = _loc29_ + _loc13_;
            _loc2_.graphics.beginFill(16711680);
            _loc2_.graphics.moveTo(150,150);
            _loc11_ = _loc29_;
            while(_loc11_ < _loc5_)
            {
               _loc2_.graphics.lineTo(150 + 150 * 1.5 * Math.sin(_loc11_),150 - 150 * 1.5 * Math.cos(_loc11_));
               _loc11_ += 0.5;
            }
            _loc2_.graphics.lineTo(150 + 150 * 1.5 * Math.sin(_loc5_),150 - 150 * 1.5 * Math.cos(_loc5_));
            _loc2_.graphics.endFill();
            _loc16_.addChild(_loc2_);
            _loc19_.mask = _loc2_;
         }
         _loc16_.scaleY = 0.7;
         var _loc30_:Sprite = new Sprite();
         _loc30_.addChild(_loc16_);
         var _loc31_:BitmapData = new BitmapData(150 * 2,150 * 2 * 0.7,true,0);
         _loc31_.draw(_loc30_);
         var _loc18_:Object = {};
         _loc18_.disp = new Sprite();
         _loc18_.base = new BitmapData(150 * 2,150 * 2 * 0.7,true,0);
         _loc18_.base.copyPixels(_loc31_,new Rectangle(0,0,_loc31_.width,_loc31_.height),new Point(0,0),null,null,true);
         _loc18_.disp.addChild(new Bitmap(_loc18_.base));
         _loc18_.darkener = new Sprite();
         var _loc17_:Matrix = new Matrix();
         _loc17_.createGradientBox(150 * 2,20,0,0,0);
         _loc18_.darkener.graphics.beginGradientFill("linear",[8947848,16777215,0,2236962],[0.3,0.2,0.6,0.5],[0,32,248,255],_loc17_);
         _loc18_.darkener.graphics.drawRect(0,0,150 * 2,150 * 2 * 0.7);
         _loc18_.darkener.graphics.endFill();
         _loc18_.darkenerMask = new Sprite();
         _loc18_.darkenerMask.graphics.beginFill(16711680);
         _loc18_.darkenerMask.graphics.drawEllipse(0,0,150 * 2,150 * 2 * 0.7);
         _loc18_.darkenerMask.graphics.endFill();
         _loc18_.disp.addChild(_loc18_.darkenerMask);
         _loc18_.darkener.mask = _loc18_.darkenerMask;
         _loc18_.disp.addChild(_loc18_.darkener);
         var _loc20_:BitmapData = new BitmapData(150 * 2,150 * 2 * 0.7,true,0);
         _loc20_.draw(_loc18_.disp);
         var _loc3_:BitmapData = new BitmapData(150 * 2,150 * 2,true,0);
         _loc22_ = 0;
         while(_loc22_ < 20)
         {
            _loc3_.copyPixels(_loc20_,new Rectangle(0,0,_loc20_.width,_loc20_.height),new Point(0,20 - _loc22_),null,null,true);
            _loc22_++;
         }
         _loc3_.copyPixels(_loc31_,new Rectangle(0,0,_loc31_.width,_loc31_.height),new Point(0,0),null,null,true);
         weightChartDialogue.chart = new Bitmap(_loc3_);
         weightChartDialogue.chart.x = 200 - 150;
         weightChartDialogue.chart.y = 20;
         weightChartDialogue.chart.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
         weightChartDialogue.d.addChild(weightChartDialogue.chart);
         weightChartDialogue.legend = new Sprite();
         weightChartDialogue.legend.y = 270;
         if(param1 is Item)
         {
            _loc23_.push(param1.totalWeight);
            _loc9_.push(16777215);
            _loc27_.push(1209);
         }
         var _loc6_:* = 0;
         for(_loc22_ in _loc23_)
         {
            if(_loc23_[_loc22_] > 0)
            {
               _loc6_++;
            }
         }
         var _loc14_:* = 0;
         var _loc28_:Array = [];
         var _loc21_:Array = [];
         if(_loc6_ > 6)
         {
            _loc4_ = Math.ceil(_loc6_ / 2);
         }
         for(_loc22_ in _loc23_)
         {
            if(_loc23_[_loc22_] > 0)
            {
               if(_loc6_ > 6)
               {
                  if(_loc14_ >= _loc4_)
                  {
                     _loc10_ = 240;
                  }
                  else
                  {
                     _loc10_ = 40;
                  }
                  _loc15_ = 60 - _loc4_ * 10 + _loc14_ % _loc4_ * 20;
               }
               else
               {
                  _loc10_ = 150;
                  _loc15_ = 60 - _loc6_ * 10 + _loc14_ * 20;
               }
               _loc28_[_loc14_] = new EngineText(Texts.fetch(_loc27_[_loc22_],null,12).toUpperCase() + ": " + Math.round(_loc23_[_loc22_]) + " " + Texts.fetch(12).toUpperCase(),16777215,12,"left",_loc10_,_loc15_ + 1,150,20);
               weightChartDialogue.legend.addChild(_loc28_[_loc14_]);
               _loc21_[_loc14_] = new Sprite();
               _loc21_[_loc14_].graphics.beginFill(_loc9_[_loc22_]);
               _loc21_[_loc14_].graphics.lineStyle(0.5,0);
               _loc21_[_loc14_].graphics.drawRect(0,3,20,15);
               _loc21_[_loc14_].x = _loc10_ - 30;
               _loc21_[_loc14_].y = _loc15_;
               weightChartDialogue.legend.addChild(_loc21_[_loc14_]);
               _loc14_++;
            }
         }
         weightChartDialogue.d.addChild(weightChartDialogue.legend);
      }
      
      private function cargoRemoveFromUse() : *
      {
         updateWithdrawFromUse();
         withdrawFromUse.disp.visible = true;
         if(visible)
         {
            GD.displayTutorial(20);
         }
      }
      
      private function cargoRead() : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc1_:Array = [];
         var _loc2_:* = 10;
         var _loc4_:Array = [];
         if(cargoSelected.itemData.map)
         {
            for(_loc3_ in cargoSelected.itemData.towns)
            {
               if(!GD.Towns[cargoSelected.itemData.towns[_loc3_]].discovered)
               {
                  _loc4_.push(GD.Towns[cargoSelected.itemData.towns[_loc3_]].name);
               }
               GD.Towns[cargoSelected.itemData.towns[_loc3_]].discovered = true;
            }
            if(_loc4_.length == 0)
            {
               messageDialogue.setText(Texts.fetch(4221).toUpperCase());
            }
            else
            {
               messageDialogue.setText(Texts.fetch(4220).toUpperCase() + ": " + _loc4_.join(", ").toUpperCase());
            }
            messageDialogue.visible = true;
         }
         if(cargoSelected.itemData.book)
         {
            readDialogue.nameText.text = cargoSelected.name.toUpperCase();
            readDialogue.disp.visible = true;
            readDialogue.readArea.clearAll();
            for(_loc3_ in cargoSelected.itemData.texts)
            {
               _loc5_ = Texts.fetch(cargoSelected.itemData.texts[_loc3_].text);
               _loc1_[_loc3_] = new EngineText(_loc5_,2103312,14,cargoSelected.itemData.texts[_loc3_].align,10,_loc2_,530,10000,true,true);
               _loc1_[_loc3_].height = _loc1_[_loc3_].textHeight + 10;
               readDialogue.readArea.addContent(_loc1_[_loc3_],null,null,null,null,true);
               _loc2_ += _loc1_[_loc3_].textHeight + 20;
            }
            readDialogue.readArea.updateSize();
            if(GD.storyMode && GD.Story is Caravaneer2MainStory)
            {
               if(cargoSelected.type == 105)
               {
                  GD.Story.readSpencerism = true;
               }
               if(cargoSelected.type == 106)
               {
                  GD.Story.readFafnirsCase = true;
               }
               if(cargoSelected.type == 107)
               {
                  GD.Story.readCalvinsLetter = true;
               }
            }
         }
      }
      
      private function cargoSwitchOnOff() : *
      {
         if(cargoSelected.amount == 1)
         {
            if(cargoSelected.inUse == 0)
            {
               cargoSelected.inUse = 1;
            }
            else
            {
               cargoSelected.inUse = 0;
            }
         }
         else
         {
            calculator.min = 0;
            calculator.max = cargoSelected.amount;
            calculator.visible = true;
            calculator.setValue(cargoSelected.inUse);
            calculator.info.text = Texts.fetch(1244).toUpperCase();
            calculator.onDone = function(param1:*):*
            {
               cargoSelected.inUse = param1;
               setCargoList();
            };
         }
         setCargoList();
      }
      
      private function updateWithdrawFromUse() : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         withdrawFromUse.nameText.text = cargoSelected.name.toUpperCase();
         withdrawFromUse.inUseText.text = Texts.fetch(1195).toUpperCase() + ": " + Math.round(cargoSelected.inUse * 1000) / 1000;
         withdrawFromUse.listArea.clearAll();
         withdrawFromUse.owners = [];
         if(cargoSelected.category == 2 || cargoSelected.category == 3 || cargoSelected.category == 4 || cargoSelected.category == 5 || cargoSelected.category == 1 && (cargoSelected.itemData.firstAidKit || cargoSelected.type == 219))
         {
            _loc4_ = GD.Caravans[0].People;
         }
         for(_loc2_ in _loc4_)
         {
            _loc1_ = 0;
            if(_loc4_[_loc2_] is Character)
            {
               for(_loc3_ in _loc4_[_loc2_].equipment)
               {
                  if(_loc4_[_loc2_].equipment[_loc3_].type == cargoSelected.type)
                  {
                     _loc1_ = _loc4_[_loc2_].equipment[_loc3_].amount;
                     break;
                  }
               }
            }
            if(_loc1_ > 0)
            {
               withdrawFromUse.owners.push({
                  "owner":_loc4_[_loc2_],
                  "amount":_loc1_
               });
            }
         }
         for(_loc2_ in withdrawFromUse.owners)
         {
            withdrawFromUse.owners[_loc2_].disp = new Sprite();
            withdrawFromUse.owners[_loc2_].picBG = new ImportedBitmap("GenericBackground.png");
            withdrawFromUse.owners[_loc2_].picBG.scaleX = withdrawFromUse.owners[_loc2_].picBG.scaleY = 0.5;
            withdrawFromUse.owners[_loc2_].picBG.x = 10;
            withdrawFromUse.owners[_loc2_].picBG.y = 10;
            withdrawFromUse.owners[_loc2_].disp.addChild(withdrawFromUse.owners[_loc2_].picBG);
            withdrawFromUse.owners[_loc2_].picEnvelope = new Sprite();
            withdrawFromUse.owners[_loc2_].picEnvelope.addChild(withdrawFromUse.owners[_loc2_].owner.picture);
            withdrawFromUse.owners[_loc2_].picEnvelope.scaleX = withdrawFromUse.owners[_loc2_].picEnvelope.scaleY = 0.2;
            withdrawFromUse.owners[_loc2_].picEnvelope.x = 10;
            withdrawFromUse.owners[_loc2_].picEnvelope.y = 10;
            withdrawFromUse.owners[_loc2_].disp.addChild(withdrawFromUse.owners[_loc2_].picEnvelope);
            withdrawFromUse.owners[_loc2_].nameText = new EngineText(withdrawFromUse.owners[_loc2_].owner.name.toUpperCase(),16777215,14,"center",70,10,210,20);
            withdrawFromUse.owners[_loc2_].nameText.alpha = 0.8;
            withdrawFromUse.owners[_loc2_].disp.addChild(withdrawFromUse.owners[_loc2_].nameText);
            withdrawFromUse.owners[_loc2_].inUseText = new EngineText(Texts.fetch(1195).toUpperCase() + ": " + Math.round(withdrawFromUse.owners[_loc2_].amount * 1000) / 1000,16777215,14,"center",70,40,210,20);
            withdrawFromUse.owners[_loc2_].inUseText.alpha = 0.8;
            withdrawFromUse.owners[_loc2_].disp.addChild(withdrawFromUse.owners[_loc2_].inUseText);
            if(withdrawFromUse.owners[_loc2_].owner.category == 1 || withdrawFromUse.owners[_loc2_].owner.category == 2)
            {
               withdrawFromUse.owners[_loc2_].withdrawSomeButton = new Button(6,withdrawSome,Texts.fetch(1233).toUpperCase());
               withdrawFromUse.owners[_loc2_].withdrawSomeButton.x = 287;
               withdrawFromUse.owners[_loc2_].withdrawSomeButton.y = 7;
               withdrawFromUse.owners[_loc2_].disp.addChild(withdrawFromUse.owners[_loc2_].withdrawSomeButton);
               withdrawFromUse.owners[_loc2_].withdrawAllButton = new Button(6,withdrawAll,Texts.fetch(1230).toUpperCase());
               withdrawFromUse.owners[_loc2_].withdrawAllButton.x = 287;
               withdrawFromUse.owners[_loc2_].withdrawAllButton.y = 37;
               withdrawFromUse.owners[_loc2_].disp.addChild(withdrawFromUse.owners[_loc2_].withdrawAllButton);
            }
            else
            {
               withdrawFromUse.owners[_loc2_].cantWithdrawText = new EngineText(Texts.fetch(2215).toUpperCase(),16777215,12,"center",287,0,140,60,true,true);
               withdrawFromUse.owners[_loc2_].cantWithdrawText.y = 37 - withdrawFromUse.owners[_loc2_].cantWithdrawText.textHeight / 2 - 2;
               withdrawFromUse.owners[_loc2_].disp.addChild(withdrawFromUse.owners[_loc2_].cantWithdrawText);
            }
            withdrawFromUse.owners[_loc2_].separationLine = new Sprite();
            withdrawFromUse.owners[_loc2_].separationLine.graphics.lineStyle(1,16777215,0.3);
            withdrawFromUse.owners[_loc2_].separationLine.graphics.moveTo(0,1);
            withdrawFromUse.owners[_loc2_].separationLine.graphics.lineTo(440,1);
            withdrawFromUse.owners[_loc2_].separationLine.graphics.lineStyle(1,0,0.6);
            withdrawFromUse.owners[_loc2_].separationLine.graphics.moveTo(0,0);
            withdrawFromUse.owners[_loc2_].separationLine.graphics.lineTo(440,0);
            withdrawFromUse.owners[_loc2_].separationLine.y = 70;
            withdrawFromUse.owners[_loc2_].disp.addChild(withdrawFromUse.owners[_loc2_].separationLine);
            withdrawFromUse.owners[_loc2_].disp.y = _loc2_ * 70;
            withdrawFromUse.listArea.addContent(withdrawFromUse.owners[_loc2_].disp,null,null,null,null,true);
         }
         withdrawFromUse.listArea.updateSize();
      }
      
      private function withdrawSome(param1:*) : *
      {
         var num:*;
         var i:*;
         var t:* = param1;
         for(i in withdrawFromUse.owners)
         {
            if(withdrawFromUse.owners[i].withdrawSomeButton == t)
            {
               num = i;
               break;
            }
         }
         calculator.min = 1;
         calculator.max = withdrawFromUse.owners[num].amount;
         calculator.visible = true;
         calculator.setValue(1);
         calculator.info.text = Texts.fetch(1215).toUpperCase();
         calculator.onDone = function(param1:*):*
         {
            if(withdrawFromUse.owners[num].owner is Character)
            {
               withdrawFromUse.owners[num].owner.unequip(cargoSelected.type,param1);
            }
            updateWithdrawFromUse();
         };
      }
      
      private function withdrawAll(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in withdrawFromUse.owners)
         {
            if(withdrawFromUse.owners[_loc3_].withdrawAllButton == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(withdrawFromUse.owners[_loc2_].owner is Character)
         {
            withdrawFromUse.owners[_loc2_].owner.unequip(cargoSelected.type,withdrawFromUse.owners[_loc2_].amount);
         }
         updateWithdrawFromUse();
      }
      
      private function withdrawAllGlobal() : *
      {
         ConfirmDialogue.setText(Texts.fetch(1234).toUpperCase());
         ConfirmDialogue.onApprove = function():*
         {
            var _loc1_:* = undefined;
            for(_loc1_ in withdrawFromUse.owners)
            {
               if(withdrawFromUse.owners[_loc1_].owner is Character && (withdrawFromUse.owners[_loc1_].owner.category == 1 || withdrawFromUse.owners[_loc1_].owner.category == 2))
               {
                  withdrawFromUse.owners[_loc1_].owner.unequip(cargoSelected.type,withdrawFromUse.owners[_loc1_].amount);
               }
            }
            withdrawFromUse.disp.visible = false;
            setCargoList();
         };
         ConfirmDialogue.visible = true;
      }
      
      private function cargoSelectItem(param1:*) : *
      {
         cargoSelected = param1;
         updateCargo();
      }
      
      private function setCargoList() : *
      {
         cargoList.update(GD.Caravans[0].Cargo);
      }
      
      private function updatePassengers() : *
      {
         var _loc2_:* = undefined;
         if(passengersTransportPicInside is DisplayObject && passengersTransportPic.contains(passengersTransportPicInside))
         {
            passengersTransportPic.removeChild(passengersTransportPicInside);
         }
         if(passengersCartPicInside is DisplayObject && passengersCartPic.contains(passengersCartPicInside))
         {
            passengersCartPic.removeChild(passengersCartPicInside);
         }
         if(passengersPassengerPicInside is DisplayObject && passengersPassengerPic.contains(passengersPassengerPicInside))
         {
            passengersPassengerPic.removeChild(passengersPassengerPicInside);
         }
         passengersTransportAreaFrame.visible = passengersTransportPicBG.visible = passengersTransportPic.visible = passengersCartPic.visible = passengersTransportName.visible = passengersTransportCapacityText.visible = passengersTransportPassengersText.visible = passengersTransportNoPassengersButton.visible = passengersTransportArea.visible = passengersSelectedTransport is TransportUnit;
         passengersPassengerPicBG.visible = passengersPassengerName.visible = passengersPassengerPic.visible = passengersPassengerHealthText.visible = passengersPassengerHealthFrame.visible = passengersPassengerHealthBar.visible = passengersPassengerSpeedTitle.visible = passengersPassengerSpeedValue.visible = passengersPassengerCapacityTitle.visible = passengersPassengerCapacityValue.visible = passengersPassengerPassengersTitle.visible = passengersPassengerPassengersValue.visible = passengersPassengerWeightText.visible = passengersPassengerSpacesTitle.visible = passengersPassengerSpacesValue.visible = passengersPassengerSeatButton.visible = passengersPassengerCantSeatText.visible = passengersSelectedPassenger is Object && passengersSelectedTransport is TransportUnit;
         passengersCartPicBG.visible = passengersPlusSign.visible = passengersSelectedTransport is TransportUnit && passengersSelectedTransport.canDragCarts;
         var _loc1_:Boolean = false;
         for(_loc2_ in GD.Caravans[0].Transport)
         {
            if(GD.Caravans[0].Transport[_loc2_].maxPassengers > 0 && GD.Caravans[0].Transport[_loc2_].category != 2)
            {
               _loc1_ = true;
               break;
            }
         }
         passengersLines.visible = passengersTransportNameFrame.visible = passengersPassengerNameFrame.visible = _loc1_;
         if(passengersTransportList is List)
         {
            passengersTransportList.visible = _loc1_;
         }
         if(passengersPassengersList is List)
         {
            passengersPassengersList.visible = _loc1_;
         }
         passengersNoTransportText.visible = !_loc1_;
         if(visible && passengersLines.visible)
         {
            GD.displayTutorial(14);
         }
         if(passengersSelectedTransport is TransportUnit)
         {
            passengersTransportPicInside = passengersSelectedTransport.picture;
            passengersTransportPic.addChild(passengersTransportPicInside);
            passengersTransportName.text = passengersSelectedTransport.name.toUpperCase();
            passengersTransportPassengersText.text = Texts.fetch(899).toUpperCase() + ": " + passengersSelectedTransport.passengerSpacesOccupied + "/" + passengersSelectedTransport.maxPassengersWithCart;
            passengersTransportCapacityText.text = Texts.fetch(903).toUpperCase() + ": " + Math.round(passengersSelectedTransport.passengersWeight) + "/" + Math.round(passengersSelectedTransport.capacityWithCart);
            if(passengersSelectedTransport.cart is TransportUnit)
            {
               passengersCartPicInside = passengersSelectedTransport.cart.picture;
               passengersCartPic.addChild(passengersCartPicInside);
               passengersTransportName.text += " + " + passengersSelectedTransport.cart.name.toUpperCase();
            }
            for(_loc2_ in passengersTransportPassengers)
            {
               passengersTransportArea.removeContent(passengersTransportPassengers[_loc2_].disp);
            }
            passengersTransportPassengers = [];
            for(_loc2_ in passengersSelectedTransport.Passengers)
            {
               passengersTransportPassengers[_loc2_] = {};
               passengersTransportPassengers[_loc2_].disp = new Sprite();
               passengersTransportPassengers[_loc2_].BG = new ImportedBitmap("GenericBackground.png");
               passengersTransportPassengers[_loc2_].BG.scaleX = passengersTransportPassengers[_loc2_].BG.scaleY = 0.4;
               passengersTransportPassengers[_loc2_].BG.filters = [new DropShadowFilter(4,45,0,0.3,4,4,1,3)];
               passengersTransportPassengers[_loc2_].disp.addChild(passengersTransportPassengers[_loc2_].BG);
               passengersTransportPassengers[_loc2_].disp.x = _loc2_ % 8 * 50 + 10;
               passengersTransportPassengers[_loc2_].disp.y = Math.floor(_loc2_ / 8) * 60 + 10;
               passengersTransportPassengers[_loc2_].portrait = passengersSelectedTransport.Passengers[_loc2_].picture;
               passengersTransportPassengers[_loc2_].outerPortrait = new Sprite();
               passengersTransportPassengers[_loc2_].outerPortrait.scaleX = passengersTransportPassengers[_loc2_].outerPortrait.scaleY = 0.16;
               passengersTransportPassengers[_loc2_].outerPortrait.addChild(passengersTransportPassengers[_loc2_].portrait);
               passengersTransportPassengers[_loc2_].disp.addChild(passengersTransportPassengers[_loc2_].outerPortrait);
               passengersTransportPassengers[_loc2_].num = new EngineText(passengersSelectedTransport.Passengers[_loc2_].passengerSpaces,16777215,12,"right",0,25,40,15);
               passengersTransportPassengers[_loc2_].disp.addChild(passengersTransportPassengers[_loc2_].num);
               passengersTransportPassengers[_loc2_].disp.addEventListener("click",clickOnPassenger,false,0,false);
               passengersTransportPassengers[_loc2_].disp.buttonMode = true;
               passengersTransportPassengers[_loc2_].disp.mouseChildren = false;
               passengersTransportArea.addContent(passengersTransportPassengers[_loc2_].disp);
            }
         }
         if(passengersSelectedTransport is TransportUnit && passengersSelectedPassenger is Object)
         {
            passengersPassengerName.text = passengersSelectedPassenger.name.toUpperCase();
            passengersPassengerPicInside = passengersSelectedPassenger.picture;
            passengersPassengerPic.addChild(passengersPassengerPicInside);
            if(passengersSelectedPassenger is TransportUnit && passengersSelectedPassenger.category == 2)
            {
               passengersPassengerSpeedValue.text = Texts.fetch(193).toUpperCase();
            }
            else
            {
               passengersPassengerSpeedValue.text = Math.round(passengersSelectedPassenger.speed * 10) / 10;
            }
            passengersPassengerCapacityValue.text = Math.round(passengersSelectedPassenger.capacity);
            if(passengersSelectedPassenger is Character)
            {
               passengersPassengerPassengersValue.text = Texts.fetch(193).toUpperCase();
            }
            else
            {
               passengersPassengerPassengersValue.text = passengersSelectedPassenger.passengerSpacesOccupied + "/" + passengersSelectedPassenger.maxPassengers;
            }
            if(passengersSelectedPassenger is Character || passengersSelectedPassenger is TransportUnit && passengersSelectedPassenger.category == 1)
            {
               passengersPassengerHealthText.text = Texts.fetch(50,null,8).toUpperCase() + ": ";
            }
            else
            {
               passengersPassengerHealthText.text = Texts.abbreviation(1153).toUpperCase() + ": ";
            }
            passengersPassengerHealthText.text += Math.round(passengersSelectedPassenger.health) + "/" + Math.round(passengersSelectedPassenger.maxHealth);
            passengersPassengerHealthBar.graphics.clear();
            passengersPassengerHealthBar.graphics.beginFill(16777215);
            passengersPassengerHealthBar.graphics.drawRect(5,5,150 * passengersSelectedPassenger.health / passengersSelectedPassenger.maxHealth,10);
            passengersPassengerWeightText.text = Texts.fetch(996).toUpperCase() + ": " + Math.round(passengersSelectedPassenger.weight);
            passengersPassengerSpacesValue.text = passengersSelectedPassenger.passengerSpaces;
            passengersPassengerSeatButton.visible = false;
            if(!(passengersSelectedTransport is TransportUnit))
            {
               passengersPassengerCantSeatText.text = "";
            }
            else if(passengersSelectedPassenger == passengersSelectedTransport)
            {
               passengersPassengerCantSeatText.text = Texts.fetch(1189).toUpperCase();
            }
            else if(passengersSelectedPassenger.passengerSpaces > passengersSelectedTransport.maxPassengersWithCart - passengersSelectedTransport.passengerSpacesOccupied)
            {
               passengersPassengerCantSeatText.text = Texts.fetch(1188).toUpperCase();
            }
            else if(passengersSelectedPassenger.weight > passengersSelectedTransport.capacityWithCart - passengersSelectedTransport.passengersWeight)
            {
               passengersPassengerCantSeatText.text = Texts.fetch(1020).toUpperCase();
            }
            else
            {
               passengersPassengerCantSeatText.text = "";
               passengersPassengerSeatButton.visible = true;
            }
         }
         updateBottomLine();
      }
      
      private function seatPassanger() : *
      {
         if(passengersSelectedPassenger is TransportUnit)
         {
            passengersSelectedPassenger.removeAllPassengers();
         }
         passengersSelectedPassenger.passengerIn = passengersSelectedTransport;
         passengersSelectedTransport.Passengers.push(passengersSelectedPassenger);
         setPassengersPassengersList();
      }
      
      private function clickOnPassenger(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc3_ in passengersTransportPassengers)
         {
            if(passengersTransportPassengers[_loc3_].disp == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         passengersSelectedTransport.Passengers[_loc2_].removeFromPassengers();
         setPassengersPassengersList();
      }
      
      private function passengersSelectTransport(param1:*) : *
      {
         passengersSelectedTransport = param1;
         updatePassengers();
      }
      
      private function passengersSelectPassenger(param1:*) : *
      {
         passengersSelectedPassenger = param1;
         updatePassengers();
      }
      
      private function setPassengersTransportList() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:Array = [];
         for(_loc2_ in GD.Caravans[0].Transport)
         {
            if(GD.Caravans[0].Transport[_loc2_].category != 2 && GD.Caravans[0].Transport[_loc2_].maxPassengers > 0)
            {
               _loc1_.push(GD.Caravans[0].Transport[_loc2_]);
            }
         }
         passengersTransportList.update(_loc1_);
      }
      
      private function setPassengersPassengersList() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:Array = [];
         for(_loc2_ in GD.Caravans[0].People)
         {
            if(!(GD.Caravans[0].People[_loc2_].passengerIn is TransportUnit))
            {
               _loc1_.push(GD.Caravans[0].People[_loc2_]);
            }
         }
         for(_loc2_ in GD.Caravans[0].Transport)
         {
            if(!(GD.Caravans[0].Transport[_loc2_].attachedTo is TransportUnit) && !(GD.Caravans[0].Transport[_loc2_].cart is TransportUnit) && !(GD.Caravans[0].Transport[_loc2_].passengerIn is TransportUnit))
            {
               _loc1_.push(GD.Caravans[0].Transport[_loc2_]);
            }
         }
         passengersPassengersList.update(_loc1_);
      }
      
      private function passengersClear() : *
      {
         passengersSelectedTransport.removeAllPassengers();
         setPassengersPassengersList();
      }
      
      private function updateCarts() : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         if(cartsAnimalPicInside is DisplayObject && cartsAnimalPic.contains(cartsAnimalPicInside))
         {
            cartsAnimalPic.removeChild(cartsAnimalPicInside);
         }
         if(cartsAttachedCartPicInside is DisplayObject && cartsAttachedCartPic.contains(cartsAttachedCartPicInside))
         {
            cartsAttachedCartPic.removeChild(cartsAttachedCartPicInside);
         }
         if(cartsSelectedCartPicInside is DisplayObject && cartsSelectedCartPic.contains(cartsSelectedCartPicInside))
         {
            cartsSelectedCartPic.removeChild(cartsSelectedCartPicInside);
         }
         cartsAnimalPicHolder.visible = cartsAttachedCartPicHolder.visible = cartsAnimalPic.visible = cartsAnimalName.visible = cartsAnimalHealthText.visible = cartsAnimalHealthFrame.visible = cartsAnimalHealthBar.visible = cartsAnimalCapacityTitle.visible = cartsAnimalCapacityValue.visible = cartsAnimalPassengersTitle.visible = cartsAnimalPassengersValue.visible = cartsAnimalSpeedTitle.visible = cartsAnimalSpeedValue.visible = cartsSelectedAnimal is TransportUnit;
         cartsAttachedCartPic.visible = cartsAttachedCartName.visible = cartsAttachedCartHealthText.visible = cartsAttachedCartHealthFrame.visible = cartsAttachedCartHealthBar.visible = cartsAttachedCartCapacityTitle.visible = cartsAttachedCartCapacityValue.visible = cartsAttachedCartPassengersTitle.visible = cartsAttachedCartPassengersValue.visible = cartsAttachedCartCapacityMultiplierTitle.visible = cartsAttachedCartCapacityMultiplierValue.visible = cartsAttachedCartWeightTitle.visible = cartsAttachedCartWeightValue.visible = cartsCombinedCapacityText.visible = cartsCombinedPassengersText.visible = cartsDetachButton.visible = cartsSelectedAnimal is TransportUnit && cartsSelectedAnimal.cart is TransportUnit;
         cartsSelectedCartPicHolder.visible = cartsSelectedCartPic.visible = cartsSelectedCartFrame.visible = cartsSelectedCartName.visible = cartsSelectedCartCapacityTitle.visible = cartsSelectedCartCapacityValue.visible = cartsSelectedCartPassengersTitle.visible = cartsSelectedCartPassengersValue.visible = cartsSelectedCartCapacityMultiplierTitle.visible = cartsSelectedCartCapacityMultiplierValue.visible = cartsSelectedCartWeightTitle.visible = cartsSelectedCartWeightValue.visible = cartsSelectedCartHealthText.visible = cartsSelectedCartHealthFrame.visible = cartsSelectedCartHealthBar.visible = cartsSelectedCart is TransportUnit;
         cartsTooHeavyText.visible = cartsSelectedCartExpectedCapacityValue.visible = cartsSelectedCartAttachButton.visible = cartsSelectedCart is TransportUnit && cartsSelectedAnimal is TransportUnit;
         var _loc4_:Boolean = false;
         var _loc1_:Boolean = false;
         for(_loc5_ in GD.Caravans[0].Transport)
         {
            if(GD.Caravans[0].Transport[_loc5_].category == 1)
            {
               _loc4_ = true;
            }
            if(GD.Caravans[0].Transport[_loc5_].category == 2)
            {
               _loc1_ = true;
            }
            if(_loc4_ && _loc1_)
            {
               break;
            }
         }
         if(cartsAnimalsList is List)
         {
            cartsAnimalsList.visible = _loc4_ || _loc1_;
         }
         if(cartsCartsList is List)
         {
            cartsCartsList.visible = _loc4_ || _loc1_;
         }
         cartsLines.visible = _loc4_ || _loc1_;
         cartsNoCartsText.visible = !cartsLines.visible;
         if(visible && cartsLines.visible)
         {
            GD.displayTutorial(13);
         }
         if(cartsSelectedAnimal is TransportUnit)
         {
            cartsAnimalPicInside = cartsSelectedAnimal.picture;
            cartsAnimalPic.addChild(cartsAnimalPicInside);
            cartsAnimalName.text = cartsSelectedAnimal.name.toUpperCase();
            cartsAnimalHealthText.text = Texts.fetch(50,1,12).toUpperCase() + ": " + Math.round(cartsSelectedAnimal.health) + "/" + Math.round(cartsSelectedAnimal.maxHealth);
            cartsAnimalHealthBar.graphics.clear();
            cartsAnimalHealthBar.graphics.beginFill(16777215);
            cartsAnimalHealthBar.graphics.drawRect(5,5,190 * cartsSelectedAnimal.health / cartsSelectedAnimal.maxHealth,10);
            cartsAnimalHealthBar.graphics.endFill();
            cartsAnimalCapacityValue.text = Math.round(cartsSelectedAnimal.capacity);
            cartsAnimalPassengersValue.text = Math.round(cartsSelectedAnimal.maxPassengers);
            cartsAnimalSpeedValue.text = Math.round(cartsSelectedAnimal.speed * 10) / 10;
            if(cartsSelectedAnimal.cart is TransportUnit)
            {
               cartsAttachedCartPicInside = cartsSelectedAnimal.cart.picture;
               cartsAttachedCartPic.addChild(cartsAttachedCartPicInside);
               cartsAttachedCartName.text = cartsSelectedAnimal.cart.name.toUpperCase();
               cartsAttachedCartHealthText.text = Texts.fetch(1153,1,12).toUpperCase() + ": " + Math.round(cartsSelectedAnimal.cart.health) + "/" + Math.round(cartsSelectedAnimal.cart.maxHealth);
               cartsAttachedCartHealthBar.graphics.clear();
               cartsAttachedCartHealthBar.graphics.beginFill(16777215);
               _loc3_ = 190 * cartsSelectedAnimal.cart.health / cartsSelectedAnimal.cart.maxHealth;
               cartsAttachedCartHealthBar.graphics.drawRect(195 - _loc3_,5,_loc3_,10);
               cartsAttachedCartHealthBar.graphics.endFill();
               cartsAttachedCartCapacityValue.text = Math.round(cartsSelectedAnimal.cart.capacity);
               cartsAttachedCartPassengersValue.text = Math.round(cartsSelectedAnimal.cart.maxPassengers);
               cartsAttachedCartCapacityMultiplierValue.text = Math.round(cartsSelectedAnimal.cart.multiplication * 10) / 10;
               cartsAttachedCartWeightValue.text = Math.round(cartsSelectedAnimal.cart.weight);
               cartsCombinedCapacityText.text = Texts.fetch(1155,null,20).toUpperCase() + ": " + Math.round(cartsSelectedAnimal.capacityWithCart);
               cartsCombinedPassengersText.text = Texts.fetch(899,null,20).toUpperCase() + ": " + cartsSelectedAnimal.passengerSpacesOccupied + "/" + Math.round(cartsSelectedAnimal.cart.maxPassengers);
            }
         }
         if(cartsSelectedCart is TransportUnit)
         {
            cartsSelectedCartPicInside = cartsSelectedCart.picture;
            cartsSelectedCartPic.addChild(cartsSelectedCartPicInside);
            cartsSelectedCartName.text = cartsSelectedCart.name.toUpperCase();
            cartsSelectedCartCapacityValue.text = Math.round(cartsSelectedCart.capacity);
            cartsSelectedCartPassengersValue.text = cartsSelectedCart.maxPassengers;
            cartsSelectedCartCapacityMultiplierValue.text = Math.round(cartsSelectedCart.multiplication * 10) / 10;
            cartsSelectedCartWeightValue.text = Math.round(cartsSelectedCart.weight);
            cartsSelectedCartHealthText.text = Texts.abbreviation(1153) + ": " + Math.round(cartsSelectedCart.health) + "/" + Math.round(cartsSelectedCart.maxHealth);
            cartsSelectedCartHealthBar.graphics.clear();
            cartsSelectedCartHealthBar.graphics.beginFill(16777215);
            cartsSelectedCartHealthBar.graphics.drawRect(5,5,130 * cartsSelectedCart.health / cartsSelectedCart.maxHealth,10);
            if(cartsSelectedAnimal is TransportUnit)
            {
               _loc2_ = Math.min(cartsSelectedAnimal.capacity * cartsSelectedCart.multiplication - cartsSelectedCart.weight,cartsSelectedCart.capacity);
               cartsSelectedCartAttachButton.visible = _loc2_ > 0;
               cartsTooHeavyText.visible = _loc2_ <= 0;
               cartsSelectedCartExpectedCapacityValue.text = Texts.abbreviation(1185) + ": " + Math.round(_loc2_) + " " + Texts.fetch(12);
            }
         }
      }
      
      private function detachCart() : *
      {
         cartsSelectedAnimal.cart.attachedTo = null;
         cartsSelectedAnimal.cart = null;
         cartsSelectedAnimal.normalizePassengers();
         setCartsCartsList();
         cartsAnimalsList.update();
         updateBottomLine();
      }
      
      private function attachCart() : *
      {
         if(cartsSelectedAnimal.cart is TransportUnit)
         {
            cartsSelectedAnimal.cart.attachedTo = null;
            cartsSelectedAnimal.cart = null;
         }
         cartsSelectedAnimal.cart = cartsSelectedCart;
         cartsSelectedCart.attachedTo = cartsSelectedAnimal;
         cartsSelectedAnimal.normalizePassengers();
         setCartsCartsList();
         cartsAnimalsList.update();
         updateBottomLine();
      }
      
      private function cartsSelectAnimal(param1:*) : *
      {
         cartsSelectedAnimal = param1;
         updateCarts();
      }
      
      private function cartsSelectCart(param1:*) : *
      {
         cartsSelectedCart = param1;
         updateCarts();
      }
      
      private function setCartsAnimalsList() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:Array = [];
         for(_loc2_ in GD.Caravans[0].Transport)
         {
            if(GD.Caravans[0].Transport[_loc2_].canDragCarts && !(GD.Caravans[0].Transport[_loc2_].passengerIn is TransportUnit) && GD.Caravans[0].Transport[_loc2_].capacity > 0)
            {
               _loc1_.push(GD.Caravans[0].Transport[_loc2_]);
            }
         }
         cartsAnimalsList.update(_loc1_);
      }
      
      private function setCartsCartsList() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:Array = [];
         for(_loc2_ in GD.Caravans[0].Transport)
         {
            if(GD.Caravans[0].Transport[_loc2_].category == 2 && !(GD.Caravans[0].Transport[_loc2_].attachedTo is TransportUnit) && !(GD.Caravans[0].Transport[_loc2_].passengerIn is TransportUnit))
            {
               _loc1_.push(GD.Caravans[0].Transport[_loc2_]);
            }
         }
         cartsCartsList.update(_loc1_);
      }
      
      private function selectTransport(param1:*) : *
      {
         selectedTransport = param1;
         updateTransport();
      }
      
      private function updateTransport() : *
      {
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc1_:* = undefined;
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         updateBottomLine();
         if(transportPicFG is DisplayObject)
         {
            categoriesNormal[5].removeChild(transportPicFG);
         }
         for(_loc3_ in transportPicSymbols)
         {
            transportPicSymbols[_loc3_].visible = selectedTransport is TransportUnit && selectedTransport.category == 1;
         }
         transportAnimalRenameButton.visible = transportAnimalAgeTitle.visible = transportAnimalAgeValue.visible = transportAnimalMeatTitle.visible = transportAnimalMeatValue.visible = transportAnimalSlaughterButton.visible = transportAnimalSkinTitle.visible = transportAnimalSkinValue.visible = selectedTransport is TransportUnit && selectedTransport.category == 1;
         transportCartLubricantText.visible = transportCartLubricantFrame.visible = transportCartLubricantBar.visible = transportCartLubricantButton.visible = selectedTransport is TransportUnit && selectedTransport.category == 2;
         transportCarWaterText.visible = transportCarLubricantText.visible = transportCarFrames.visible = transportCarWaterBar.visible = transportCarLubricantBar.visible = transportCarWaterButton.visible = transportCarLubricantButton.visible = selectedTransport is TransportUnit && selectedTransport.category == 3;
         transportWindPoweredText.visible = transportName.visible = transportPicBG.visible = transportNameFrame.visible = transportHealthText.visible = transportHealthFrame.visible = transportHealthBar.visible = transportAbandonButton.visible = selectedTransport is TransportUnit;
         if(transportList is List)
         {
            transportList.visible = GD.Caravans[0].Transport.length > 0;
         }
         transportNoTransportText.visible = GD.Caravans[0].Transport.length <= 0;
         if(visible && !transportNoTransportText.visible)
         {
            GD.displayTutorial(12);
         }
         for(_loc3_ in transportTextLines)
         {
            transportTextLines[_loc3_].title.visible = transportTextLines[_loc3_].value.visible = selectedTransport is TransportUnit;
         }
         if(selectedTransport is TransportUnit)
         {
            transportPicFG = selectedTransport.picture;
            transportPicFG.x = 10;
            transportPicFG.y = 12;
            categoriesNormal[5].addChild(transportPicFG);
            transportName.text = selectedTransport.name.toUpperCase();
            transportNameFrame.graphics.clear();
            transportNameFrame.graphics.lineStyle(1,16777215);
            transportNameFrame.graphics.drawRect(0 - transportName.textWidth / 2 - 10,0,transportName.textWidth + 20,40);
            if(selectedTransport.category == 1)
            {
               transportHealthText.text = Texts.fetch(50,undefined,24).toUpperCase();
            }
            else
            {
               transportHealthText.text = Texts.fetch(1153,undefined,24).toUpperCase();
            }
            transportHealthText.text += ": " + Math.round(selectedTransport.health) + "/" + Math.round(selectedTransport.maxHealth);
            transportHealthBar.graphics.clear();
            transportHealthBar.graphics.beginFill(16777215);
            transportHealthBar.graphics.drawRect(5,5,240 * (selectedTransport.health / selectedTransport.maxHealth),10);
            for(_loc3_ in transportTextLines)
            {
               transportTextLines[_loc3_].title.text = "";
               transportTextLines[_loc3_].value.text = "";
            }
            transportTextLines[0].title.text = Texts.fetch(1155).toUpperCase();
            transportTextLines[0].value.text = Math.round(selectedTransport.capacity);
            transportTextLines[1].title.text = Texts.fetch(899).toUpperCase();
            transportTextLines[1].value.text = selectedTransport.maxPassengers;
            if(selectedTransport.category == 1 || selectedTransport.category == 3)
            {
               if(selectedTransport.windPowered)
               {
                  transportTextLines[3].title.text = Texts.fetch(6).toUpperCase();
                  transportTextLines[3].value.text = Math.round(selectedTransport.speed * 100) + "%";
               }
               else
               {
                  transportTextLines[3].title.text = Texts.fetch(6).toUpperCase();
                  transportTextLines[3].value.text = Math.round(selectedTransport.speed);
               }
            }
            if(selectedTransport.category == 1)
            {
               if(selectedTransport.agePeriod == 1)
               {
                  transportTextLines[5].title.text = Texts.fetch(1173).toUpperCase();
                  transportTextLines[5].value.text = Math.round(selectedTransport.milkConsumption * 10) / 10;
               }
               else
               {
                  transportTextLines[5].title.text = Texts.fetch(1156).toUpperCase();
                  transportTextLines[5].value.text = Math.round(selectedTransport.forageConsumption * 10) / 10;
                  transportTextLines[6].title.text = Texts.fetch(1137).toUpperCase();
                  transportTextLines[6].value.text = Math.round(selectedTransport.waterConsumption * 10) / 10;
               }
               transportTextLines[8].title.text = Texts.fetch(996).toUpperCase();
               transportTextLines[8].value.text = Math.round(selectedTransport.weight * 10) / 10;
               if(selectedTransport.pregnant)
               {
                  animalPregnancyLine1.text = Texts.fetch(3509).toUpperCase();
                  animalPregnancyLine2.text = Texts.fetch(3510).toUpperCase() + ": " + Math.floor(selectedTransport.remainingPregnancy / 7);
               }
               else
               {
                  animalPregnancyLine1.text = animalPregnancyLine2.text = "";
               }
               transportTextLines[14].title.text = Texts.fetch(1157).toUpperCase();
               transportTextLines[14].value.text = Math.round(selectedTransport.price / 5) * 5;
               transportTextLines[16].title.text = Texts.fetch(1158).toUpperCase();
               if(selectedTransport.cart is TransportUnit)
               {
                  transportTextLines[16].value.text = Texts.fetch(918).toUpperCase();
               }
               else
               {
                  transportTextLines[16].value.text = Texts.fetch(919).toUpperCase();
               }
               _loc6_ = selectedTransport.produces;
               _loc1_ = 19 - _loc6_.length;
               transportTextLines[_loc1_].title.text = Texts.fetch(1160).toUpperCase() + ":";
               if(_loc6_.length == 0)
               {
                  transportTextLines[_loc1_].value.text = Texts.fetch(949).toUpperCase();
               }
               else
               {
                  for(_loc3_ in _loc6_)
                  {
                     _loc4_ = new Item(_loc6_[_loc3_].item,1);
                     transportTextLines[_loc1_ + 1 + _loc3_].title.text = _loc4_.name.toUpperCase();
                     transportTextLines[_loc1_ + 1 + _loc3_].value.text = Math.round(_loc6_[_loc3_].amount * 10) / 10;
                  }
               }
               _loc5_ = Math.floor(selectedTransport.age / 30);
               transportAnimalAgeValue.text = Math.floor(_loc5_ / 12) + Texts.fetch(1168).substr(0,1).toUpperCase() + " " + _loc5_ % 12 + Texts.fetch(1167).substr(0,1).toUpperCase();
               transportAnimalMeatValue.text = Math.round(selectedTransport.meatAmount * 10) / 10 + " " + Texts.fetch(12);
               transportAnimalSkinValue.text = Math.round(selectedTransport.skinAmount * 10) / 10 + " " + Texts.fetch(1175);
               transportPicSymbols[0].visible = selectedTransport.gender == 1;
               transportPicSymbols[1].visible = selectedTransport.gender == 2;
               _loc2_ = selectedTransport.agePeriod;
               transportPicSymbols[2].visible = _loc2_ == 1;
               transportPicSymbols[3].visible = _loc2_ == 2;
               transportPicSymbols[4].visible = _loc2_ == 4;
               transportPicSymbols[5].visible = selectedTransport.pregnant;
            }
            else
            {
               animalPregnancyLine1.text = animalPregnancyLine2.text = "";
            }
            transportWindPoweredText.visible = selectedTransport.windPowered;
            if(selectedTransport.category == 2)
            {
               transportTextLines[3].title.text = Texts.fetch(1161).toUpperCase();
               transportTextLines[3].value.text = Math.round(selectedTransport.multiplication * 10) / 10;
               transportTextLines[5].title.text = Texts.fetch(996).toUpperCase();
               transportTextLines[5].value.text = Math.round(selectedTransport.weight * 10) / 10;
               transportTextLines[7].title.text = Texts.fetch(1004).toUpperCase();
               transportTextLines[7].value.text = selectedTransport.armor;
               transportTextLines[8].title.text = Texts.fetch(1014).toUpperCase();
               transportTextLines[8].value.text = selectedTransport.fireResistance;
               transportTextLines[9].title.text = Texts.fetch(1015).toUpperCase();
               transportTextLines[9].value.text = selectedTransport.explosionResistance;
               transportTextLines[17].title.text = Texts.fetch(1159).toUpperCase();
               if(selectedTransport.attachedTo is TransportUnit)
               {
                  transportTextLines[17].value.text = Texts.fetch(918).toUpperCase();
               }
               else
               {
                  transportTextLines[17].value.text = Texts.fetch(919).toUpperCase();
               }
               transportTextLines[19].title.text = Texts.fetch(1157).toUpperCase();
               transportTextLines[19].value.text = Math.round(selectedTransport.price / 5) * 5;
               transportCartLubricantText.text = Texts.fetch(1177).toUpperCase() + ": " + Math.round(selectedTransport.lubricantLevel * 100) / 100 + "/" + Math.round(selectedTransport.maxLubricant * 100) / 100;
               transportCartLubricantBar.graphics.clear();
               transportCartLubricantBar.graphics.beginFill(16777215);
               transportCartLubricantBar.graphics.drawRect(5,5,240 * selectedTransport.lubricantLevel / selectedTransport.maxLubricant,10);
               transportCartLubricantBar.graphics.endFill();
            }
            if(selectedTransport.category == 3)
            {
               if(!selectedTransport.windPowered)
               {
                  transportTextLines[5].title.text = Texts.fetch(1162).toUpperCase();
                  transportTextLines[5].value.text = selectedTransport.fuelConsumption;
                  transportTextLines[6].title.text = Texts.fetch(1237).toUpperCase();
                  transportTextLines[6].value.text = Math.round(selectedTransport.fuelTank * 10) / 10;
               }
               transportTextLines[8].title.text = Texts.fetch(996).toUpperCase();
               transportTextLines[8].value.text = Math.round(selectedTransport.weight * 10) / 10;
               transportTextLines[10].title.text = Texts.fetch(1004).toUpperCase();
               transportTextLines[10].value.text = selectedTransport.armor;
               transportTextLines[11].title.text = Texts.fetch(1014).toUpperCase();
               transportTextLines[11].value.text = selectedTransport.fireResistance;
               transportTextLines[12].title.text = Texts.fetch(1015).toUpperCase();
               transportTextLines[12].value.text = selectedTransport.explosionResistance;
               transportTextLines[19].title.text = Texts.fetch(1157).toUpperCase();
               transportTextLines[19].value.text = Math.round(selectedTransport.price / 5) * 5;
               transportCarWaterText.text = Texts.fetch(14,1,4).toUpperCase() + ": " + Math.round(selectedTransport.waterLevel * 10) / 10 + "/" + Math.round(selectedTransport.maxWater * 10) / 10;
               transportCarLubricantText.text = Texts.fetch(1177,1,4).toUpperCase() + ": " + Math.round(selectedTransport.lubricantLevel * 10) / 10 + "/" + Math.round(selectedTransport.maxLubricant * 10) / 10;
               transportCarWaterBar.graphics.clear();
               if(selectedTransport.maxWater > 0)
               {
                  transportCarWaterBar.graphics.beginFill(16777215);
                  transportCarWaterBar.graphics.drawRect(5,5,110 * selectedTransport.waterLevel / selectedTransport.maxWater,10);
                  transportCarWaterBar.graphics.endFill();
               }
               transportCarLubricantBar.graphics.clear();
               transportCarLubricantBar.graphics.beginFill(16777215);
               transportCarLubricantBar.graphics.drawRect(5,5,110 * selectedTransport.lubricantLevel / selectedTransport.maxLubricant,10);
               transportCarLubricantBar.graphics.endFill();
            }
         }
         else
         {
            transportPicFG = null;
         }
      }
      
      private function fillLubricant() : *
      {
         GD.Caravans[0].fillLubricant(selectedTransport);
         updateTransport();
      }
      
      private function fillWater() : *
      {
         GD.Caravans[0].fillWater(selectedTransport);
         updateTransport();
      }
      
      private function renameAnimal() : *
      {
         transportChangeNameWindow.textLine.text = selectedTransport.name;
         stage.focus = transportChangeNameWindow.textLine;
         transportChangeNameWindow.textLine.setSelection(0,transportChangeNameWindow.textLine.text.length);
         transportChangeNameWindow.display.visible = true;
      }
      
      private function abandonTransport() : *
      {
         ConfirmDialogue.setText(Texts.fetch(1164).replace("@transportname@",selectedTransport.name).toUpperCase());
         ConfirmDialogue.onApprove = function():*
         {
            GD.Caravans[0].removeTransport(selectedTransport);
            transportList.update(GD.Caravans[0].Transport);
         };
         ConfirmDialogue.visible = true;
      }
      
      private function slaughterAnimal() : *
      {
         ConfirmDialogue.setText(Texts.fetch(1171).replace("@animalname@",selectedTransport.name).toUpperCase());
         ConfirmDialogue.onApprove = function():*
         {
            GD.Caravans[0].addCargo(selectedTransport.meat,selectedTransport.meatAmount);
            GD.Caravans[0].addCargo(78,selectedTransport.skinAmount);
            GD.Caravans[0].removeTransport(selectedTransport);
            transportList.update(GD.Caravans[0].Transport);
         };
         ConfirmDialogue.visible = true;
      }
      
      private function slaughterSlave() : *
      {
         ConfirmDialogue.setText(Texts.fetch(1171).replace("@animalname@",selectedCrewMember.name).toUpperCase());
         ConfirmDialogue.onApprove = function():*
         {
            var _loc1_:* = undefined;
            GD.Caravans[0].addCargo(174,selectedCrewMember.meatAmount);
            GD.Caravans[0].removePerson(selectedCrewMember);
            for(_loc1_ in GD.Caravans[0].People)
            {
               if(GD.Caravans[0].People[_loc1_].category == 4)
               {
                  GD.Caravans[0].People[_loc1_].morale -= 20;
               }
               else if(_loc1_ != 0)
               {
                  GD.Caravans[0].People[_loc1_].morale -= 5;
               }
            }
            var _loc3_:int = 5;
            var _loc2_:Number = GD.Story.specificReputations[_loc3_] - 30;
            GD.Story.specificReputations[_loc3_] = _loc2_;
            crewList.update(GD.Caravans[0].People);
         };
         ConfirmDialogue.visible = true;
      }
      
      private function groupsUpdateSelected() : *
      {
         var _loc5_:* = undefined;
         var _loc7_:* = undefined;
         var _loc2_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc4_:* = undefined;
         updateBottomLine();
         for(_loc2_ in groupSelectShining)
         {
            groupSelectShining[_loc2_].visible = _loc2_ == groupsSelected;
            groupSelectBodies[_loc2_].mouseEnabled = _loc2_ != groupsSelected;
         }
         if(groupsSelected < 5)
         {
            currentGroupPeople = GD.Caravans[0].getPeopleByGroup(groupsSelected + 1);
         }
         if(groupsSelected == 5)
         {
            currentGroupPeople = GD.Caravans[0].getPeopleByGroup([6,7,8,9,10]);
         }
         var _loc6_:* = 0;
         for(_loc2_ in currentGroupPeople)
         {
            _loc6_ += currentGroupPeople[_loc2_].morale;
         }
         if(currentGroupPeople.length > 0)
         {
            _loc8_ = Math.round(_loc6_ / currentGroupPeople.length);
         }
         else
         {
            _loc8_ = Texts.fetch(193).toUpperCase();
         }
         groupsTotalPeopleText.text = Texts.fetch(1131).toUpperCase() + ": " + currentGroupPeople.length;
         currentGroupMoraleText.text = Texts.fetch(910).toUpperCase() + ": " + _loc8_;
         groupsSameAsAnotherFoodConsumption.visible = groupsSameAsAnotherWaterConsumption.visible = groupsSameAsAnotherMedicineConsumption.visible = groupsPrevSameAsOtherButton.visible = groupsNextSameAsOtherButton.visible = groupsSameAsOtherGroupName.visible = groupsSameAsOtherFrame.visible = GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother;
         groupsFrame.visible = groupsFoodRationsTitle.visible = groupsFoodRationsFrame.visible = groupsFoodRationsText.visible = groupsFoodRationsPlusButton.visible = groupsFoodRationsMinusButton.visible = groupsFoodstuffsText.visible = groupsFoodstuffsFrame.visible = groupsFoodstuffsArea.visible = groupsFoodConsumption.visible = groupsWaterRationsTitle.visible = groupsWaterRationsFrame.visible = groupsWaterRationsText.visible = groupsWaterRationsPlusButton.visible = groupsWaterRationsMinusButton.visible = groupsWaterConsumption.visible = groupsMedicineDistributionTitle.visible = groupsMedicineConsumption.visible = groupsFoodstuffsHeaderAvailable.visible = groupsFoodstuuffsHeaderConsumed.visible = groupsFoodstuuffsHeaderPercent.visible = !GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother;
         for(_loc2_ in groupsMedicineDistribution)
         {
            groupsMedicineDistribution[_loc2_].DO.visible = !GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother;
            groupsMedicineDistribution[_loc2_].Name.visible = !GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother;
         }
         if(groupsSelected < 5)
         {
            _loc9_ = groupsSelected + 1;
         }
         if(groupsSelected == 5)
         {
            _loc9_ = [6,7,8,9,10];
         }
         if(groupsSameAsOtherGroupName.visible)
         {
            groupsAvailableSameAsOtherOptions = [];
            groupsSameAsOtherIndex = null;
            _loc2_ = 1;
            while(_loc2_ <= 6)
            {
               if(_loc2_ != groupsSelected + 1)
               {
                  _loc3_ = false;
                  _loc1_ = GD.Caravans[0].groupSettings[_loc2_];
                  while(_loc1_.sameAsAnother)
                  {
                     if(_loc1_.anotherGroup == groupsSelected + 1)
                     {
                        _loc3_ = true;
                        break;
                     }
                     _loc1_ = GD.Caravans[0].groupSettings[_loc1_.anotherGroup];
                  }
                  if(!_loc3_)
                  {
                     groupsAvailableSameAsOtherOptions.push(_loc2_);
                     if(GD.Caravans[0].groupSettings[groupsSelected + 1].anotherGroup == _loc2_)
                     {
                        groupsSameAsOtherIndex = groupsAvailableSameAsOtherOptions.length - 1;
                     }
                  }
               }
               _loc2_++;
            }
            if(groupsSameAsOtherIndex == null)
            {
               groupsSameAsOtherIndex = 0;
               GD.Caravans[0].groupSettings[groupsSelected + 1].anotherGroup = groupsAvailableSameAsOtherOptions[0];
            }
            groupsSameAsOtherGroupName.text = getGroupName(GD.Caravans[0].groupSettings[groupsSelected + 1].anotherGroup).toUpperCase();
            groupsSameAsAnotherFoodConsumption.text = Texts.fetch(1135,1,23).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].totalFoodConsumption(_loc9_),0) + " " + Texts.fetch(939) + "/" + Texts.fetch(941).toUpperCase();
            groupsSameAsAnotherWaterConsumption.text = Texts.fetch(1137,1,23).toUpperCase() + ": " + Math.round(GD.Caravans[0].totalWaterConsumption(_loc9_) * 10) / 10 + " " + Texts.fetch(11) + "/" + Texts.fetch(941).toUpperCase();
            groupsSameAsAnotherMedicineConsumption.text = Texts.fetch(1139,1,23).toUpperCase() + ": " + Math.round(GD.Caravans[0].totalMedicineConsumption(_loc9_)) + " " + Texts.fetch(13) + "/" + Texts.fetch(941).toUpperCase();
         }
         else
         {
            _loc4_ = GD.Caravans[0].getConsumedFoodstuffs();
            groupsFoodRationsText.text = GD.Caravans[0].groupSettings[groupsSelected + 1].foodRations + "%";
            for(_loc2_ in groupsFoodstuffs)
            {
               groupsFoodstuffs[_loc2_].percentText.text = GD.Caravans[0].groupSettings[groupsSelected + 1].foodstuffs[groupsFoodstuffs[_loc2_].foodstuff];
               groupsFoodstuffs[_loc2_].availableText.text = "0";
               groupsFoodstuffs[_loc2_].consumedText.text = "0";
               for(_loc5_ in GD.Caravans[0].Cargo)
               {
                  if(GD.Caravans[0].Cargo[_loc5_].category == 1 && GD.Caravans[0].Cargo[_loc5_].subCategory == groupsFoodstuffs[_loc2_].foodstuff)
                  {
                     groupsFoodstuffs[_loc2_].availableText.text = Math.round(GD.Caravans[0].Cargo[_loc5_].amount * 1000) / 1000;
                     break;
                  }
               }
               for(_loc5_ in _loc4_)
               {
                  if(_loc4_[_loc5_].item == groupsFoodstuffs[_loc2_].foodstuff)
                  {
                     groupsFoodstuffs[_loc2_].consumedText.text = Math.round(_loc4_[_loc5_].amount * 1000) / 1000;
                  }
               }
               for(_loc5_ in groupsMedicineDistribution)
               {
                  for(_loc7_ in groupsMedicineDistribution[_loc5_].switches)
                  {
                     groupsMedicineDistribution[_loc5_].switches[_loc7_].setState(_loc7_ == GD.Caravans[0].groupSettings[groupsSelected + 1].medicineUse[_loc5_]);
                  }
               }
            }
            groupsFoodConsumption.text = Texts.fetch(1135,1,23).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].totalFoodConsumption(_loc9_),0) + " " + Texts.fetch(939) + "/" + Texts.fetch(941).toUpperCase();
            groupsWaterRationsText.text = GD.Caravans[0].groupSettings[groupsSelected + 1].waterRations + "%";
            groupsWaterConsumption.text = Texts.fetch(1137,1,23).toUpperCase() + ": " + Math.round(GD.Caravans[0].totalWaterConsumption(_loc9_) * 10) / 10 + " " + Texts.fetch(11) + "/" + Texts.fetch(941).toUpperCase();
            groupsMedicineConsumption.text = Texts.fetch(1139,1,23).toUpperCase() + ": " + Math.round(GD.Caravans[0].totalMedicineConsumption(_loc9_)) + " " + Texts.fetch(13) + "/" + Texts.fetch(941).toUpperCase();
         }
         groupsSameAsOtherSwitch.setState(GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother);
      }
      
      private function groupsPressMedicineDistributionSwitch(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc2_ in groupsMedicineDistribution)
         {
            for(_loc3_ in groupsMedicineDistribution[_loc2_].switches)
            {
               if(param1 == groupsMedicineDistribution[_loc2_].switches[_loc3_])
               {
                  GD.Caravans[0].groupSettings[groupsSelected + 1].medicineUse[_loc2_] = _loc3_;
                  groupsUpdateSelected();
                  return false;
               }
            }
         }
      }
      
      private function changeFoodstuffRelPart(param1:*) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in groupsFoodstuffs)
         {
            if(param1 == groupsFoodstuffs[_loc2_].plusButton)
            {
               GD.Caravans[0].groupSettings[groupsSelected + 1].foodstuffs[groupsFoodstuffs[_loc2_].foodstuff]++;
               break;
            }
            if(param1 == groupsFoodstuffs[_loc2_].minusButton)
            {
               if(GD.Caravans[0].groupSettings[groupsSelected + 1].foodstuffs[groupsFoodstuffs[_loc2_].foodstuff] > 0)
               {
                  GD.Caravans[0].groupSettings[groupsSelected + 1].foodstuffs[groupsFoodstuffs[_loc2_].foodstuff]--;
               }
               break;
            }
         }
         groupsUpdateSelected();
      }
      
      private function groupsChangeFoodRations(param1:*) : *
      {
         if(param1 == groupsFoodRationsPlusButton)
         {
            GD.Caravans[0].groupSettings[groupsSelected + 1].foodRations += 10;
         }
         if(param1 == groupsFoodRationsMinusButton)
         {
            GD.Caravans[0].groupSettings[groupsSelected + 1].foodRations -= 10;
         }
         if(GD.Caravans[0].groupSettings[groupsSelected + 1].foodRations > 200)
         {
            GD.Caravans[0].groupSettings[groupsSelected + 1].foodRations = 200;
         }
         if(GD.Caravans[0].groupSettings[groupsSelected + 1].foodRations < 0)
         {
            GD.Caravans[0].groupSettings[groupsSelected + 1].foodRations = 0;
         }
         groupsUpdateSelected();
      }
      
      private function groupsChangeWaterRations(param1:*) : *
      {
         if(param1 == groupsWaterRationsPlusButton)
         {
            GD.Caravans[0].groupSettings[groupsSelected + 1].waterRations += 10;
         }
         if(param1 == groupsWaterRationsMinusButton)
         {
            GD.Caravans[0].groupSettings[groupsSelected + 1].waterRations -= 10;
         }
         if(GD.Caravans[0].groupSettings[groupsSelected + 1].waterRations > 200)
         {
            GD.Caravans[0].groupSettings[groupsSelected + 1].waterRations = 200;
         }
         if(GD.Caravans[0].groupSettings[groupsSelected + 1].waterRations < 0)
         {
            GD.Caravans[0].groupSettings[groupsSelected + 1].waterRations = 0;
         }
         groupsUpdateSelected();
      }
      
      private function groupsSameAsOtherIndexSwitch(param1:*) : *
      {
         if(param1 == groupsPrevSameAsOtherButton)
         {
            groupsSameAsOtherIndex = Number(groupsSameAsOtherIndex) - 1;
         }
         if(param1 == groupsNextSameAsOtherButton)
         {
            groupsSameAsOtherIndex = Number(groupsSameAsOtherIndex) + 1;
         }
         if(groupsSameAsOtherIndex >= groupsAvailableSameAsOtherOptions.length)
         {
            groupsSameAsOtherIndex = 0;
         }
         if(groupsSameAsOtherIndex < 0)
         {
            groupsSameAsOtherIndex = groupsAvailableSameAsOtherOptions.length - 1;
         }
         GD.Caravans[0].groupSettings[groupsSelected + 1].anotherGroup = groupsAvailableSameAsOtherOptions[groupsSameAsOtherIndex];
         groupsUpdateSelected();
      }
      
      private function getGroupName(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(param1 < 5)
         {
            _loc2_ = 904 + param1;
         }
         if(param1 == 5)
         {
            _loc2_ = 1124;
         }
         if(param1 == 6)
         {
            _loc2_ = 1122;
         }
         return Texts.fetch(_loc2_,1,20);
      }
      
      private function groupsSwitchSameAsOther() : *
      {
         var _loc2_:* = undefined;
         GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother = !GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother;
         if(GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother)
         {
            var _loc1_:Boolean = false;
            _loc2_ = 1;
            while(_loc2_ <= 6)
            {
               if(_loc2_ != groupsSelected + 1 && !GD.Caravans[0].groupSettings[_loc2_].sameAsAnother)
               {
                  _loc1_ = true;
                  break;
               }
               _loc2_++;
            }
            if(!_loc1_)
            {
               GD.Caravans[0].groupSettings[groupsSelected + 1].sameAsAnother = false;
            }
         }
         groupsUpdateSelected();
      }
      
      private function groupSelectEvent(param1:*) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in groupSelectBodies)
         {
            if(groupSelectBodies[_loc2_] == param1.target)
            {
               if(GameData.soundFXOn && _loc2_ != groupsSelected)
               {
                  new SFXMetallicClick().play();
               }
               groupsSelected = _loc2_;
               break;
            }
         }
         groupsUpdateSelected();
      }
      
      private function clearEquipment() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in equipmentSlots)
         {
            if(_loc1_ != 8)
            {
               doubleClickOnEquipmentSlot({"target":equipmentSlots[_loc1_].pic},true);
            }
         }
         updateEquipmentPerson();
         equipmentItemsList.update();
      }
      
      private function clearInventory() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < selectedEquipmentPerson.equipment.length)
         {
            if(selectedEquipmentPerson.equipment[_loc1_].category == 1 || selectedEquipmentPerson.equipment[_loc1_].category == 3)
            {
               selectedEquipmentPerson.reduceItemFromEquipment(selectedEquipmentPerson.equipment[_loc1_].type,selectedEquipmentPerson.equipment[_loc1_].amount,false,true);
               _loc1_--;
            }
            _loc1_++;
         }
         updateEquipmentPerson();
         equipmentItemsList.update();
      }
      
      private function swapWeapons() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         _loc1_ = selectedEquipmentPerson.weapons[1];
         selectedEquipmentPerson.weapons[1] = selectedEquipmentPerson.weapons[0];
         selectedEquipmentPerson.weapons[0] = _loc1_;
         _loc1_ = selectedEquipmentPerson.grenadeAmounts[0];
         selectedEquipmentPerson.grenadeAmounts[0] = selectedEquipmentPerson.grenadeAmounts[1];
         selectedEquipmentPerson.grenadeAmounts[1] = _loc1_;
         _loc2_ = 0;
         while(_loc2_ <= 1)
         {
            _loc1_ = selectedEquipmentPerson.attachments[1][_loc2_];
            selectedEquipmentPerson.attachments[1][_loc2_] = selectedEquipmentPerson.attachments[0][_loc2_];
            selectedEquipmentPerson.attachments[0][_loc2_] = _loc1_;
            _loc2_++;
         }
         updateEquipmentPerson();
      }
      
      private function selectEquipmentList(param1:*) : *
      {
         if(param1 is Item)
         {
            itemForRemoval = param1;
            calculator.min = 1;
            calculator.max = param1.amount;
            calculator.visible = true;
            calculator.setValue(1);
            calculator.info.text = Texts.fetch(1215).toUpperCase();
            calculator.onDone = removeItemFromEquipment;
         }
      }
      
      private function removeItemFromEquipment(param1:*) : *
      {
         if(itemForRemoval is Item)
         {
            selectedEquipmentPerson.reduceItemFromEquipment(itemForRemoval.type,param1,false,true);
         }
         updateEquipmentPerson();
         equipmentItemsList.update();
      }
      
      private function pressDefaultAmmoArrow(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in defaultAmmoButtons)
         {
            if(param1 == defaultAmmoButtons[_loc3_])
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         switch(_loc2_)
         {
            case 0:
               selectedEquipmentPerson.changeSelectedAmmo(-1,0);
               break;
            case 1:
               selectedEquipmentPerson.changeSelectedAmmo(1,0);
               break;
            case 2:
               selectedEquipmentPerson.changeSelectedAmmo(-1,1);
               break;
            case 3:
               selectedEquipmentPerson.changeSelectedAmmo(1,1);
         }
         updateAmmoNames();
      }
      
      private function clickOnEquipmentSlot(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in equipmentSlots)
         {
            if(equipmentSlots[_loc3_].pic == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(equipmentSlots[_loc3_].pic.useHandCursor)
         {
            selectedEquipmentSlot = _loc2_;
            checkIfSelectedIsPossible();
            updateSlots();
         }
      }
      
      private function doubleClickOnEquipmentSlot(param1:*, param2:* = false) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(!param2 && GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc4_ in equipmentSlots)
         {
            if(equipmentSlots[_loc4_].pic == param1.target)
            {
               _loc3_ = _loc4_;
               break;
            }
         }
         if(_loc3_ == 8)
         {
            return false;
         }
         var _loc6_:* = getSlotItemData(_loc3_);
         if(_loc6_.subCategory == 0)
         {
            return false;
         }
         var _loc5_:Boolean = _loc6_.category == 2 && WeaponsData.WeaponTypes[WeaponsData.Weapons[_loc6_.subCategory].type].category == 5;
         if(_loc6_.subCategory > 0)
         {
            if(_loc5_)
            {
               removeItemFromSlot(_loc3_,selectedEquipmentPerson.grenadeAmounts[_loc6_.weaponSlot]);
               selectedEquipmentPerson.grenadeAmounts[_loc6_.weaponSlot] = 0;
            }
            else
            {
               removeItemFromSlot(_loc3_,1);
            }
         }
         selectedEquipmentPerson.checkAttachmentsCompatibility();
         equipmentItemsList.update();
         updateEquipmentPerson();
         cursorControl(param1);
      }
      
      private function updateSlots() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in equipmentSlots)
         {
            equipmentSlots[_loc1_].unselectedBG.visible = selectedEquipmentSlot != _loc1_;
            equipmentSlots[_loc1_].selectedBG.visible = selectedEquipmentSlot == _loc1_;
         }
      }
      
      private function selectEquipmentItem(param1:*) : *
      {
         selectedEquipmentItem = param1;
         updateEquipmentItem();
      }
      
      private function selectEquipmentPerson(param1:*) : *
      {
         selectedEquipmentPerson = param1;
         updateEquipmentPerson();
         updateEquipmentItem();
      }
      
      private function doubleClickEquipmentItem(param1:*) : *
      {
         if(equipButton.visible)
         {
            equipItem();
         }
      }
      
      private function updateEquipmentItem() : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc1_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc2_:* = undefined;
         var _loc6_:* = undefined;
         updateBottomLine();
         equipmentItemPic.visible = equipmentItemName.visible = equipButton.visible = equipmentDescriptionFrame.visible = equipmentItemEssencial1.visible = equipmentItemEssencial2.visible = equipmentDescriptionArea.visible = equipmentUncompatibleText.visible = equipmentTooHeavyText.visible = selectedEquipmentItem is Item;
         if(selectedEquipmentItem is Item)
         {
            equipmentDescriptionList = [];
            equipmentDescriptionList.push({
               "name":Texts.fetch(996).toUpperCase(),
               "value":Math.round(selectedEquipmentItem.weightPerUnit * 1000) / 1000
            });
            equipmentDescriptionList.push({"skipLine":true});
            if(equipmentItemPicContent is DisplayObject && equipmentItemPic.contains(equipmentItemPicContent))
            {
               equipmentItemPic.removeChild(equipmentItemPicContent);
            }
            equipmentItemPicContent = selectedEquipmentItem.picture;
            equipmentItemPicContent.scaleX = equipmentItemPicContent.scaleY = 0.4;
            equipmentItemPic.addChild(equipmentItemPicContent);
            equipmentItemName.text = selectedEquipmentItem.name.toUpperCase();
            switch(selectedEquipmentItem.category)
            {
               case 1:
                  if(selectedEquipmentItem.itemData.firstAidKit)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1018).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.heal
                     });
                     equipmentItemEssencial1.text = Texts.fetch(197,1,15).toUpperCase();
                     equipmentItemEssencial2.text = "";
                  }
                  else
                  {
                     equipmentItemEssencial1.text = "";
                     equipmentItemEssencial2.text = "";
                  }
                  break;
               case 2:
                  if(selectedEquipmentItem.weaponType.category == 2 || selectedEquipmentItem.weaponType.category == 3 || selectedEquipmentItem.weaponType.category == 4)
                  {
                     equipmentItemEssencial1.text = Texts.fetch(298,1,15).toUpperCase() + ":";
                     equipmentItemEssencial2.text = Texts.fetch(WeaponsData.Calibers[selectedEquipmentItem.itemData.ammo].name,1,15).toUpperCase();
                     equipmentDescriptionList.push({"oneLine":Texts.fetch(selectedEquipmentItem.weaponType.name).toUpperCase()});
                     equipmentDescriptionList.push({"skipLine":true});
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(299).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.ammoCapacity
                     });
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(300).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.accuracy
                     });
                  }
                  else
                  {
                     equipmentItemEssencial1.text = Texts.fetch(selectedEquipmentItem.weaponType.name,1,15).toUpperCase();
                     equipmentItemEssencial2.text = "";
                  }
                  if(selectedEquipmentItem.weaponType.category == 2)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(301).toUpperCase(),
                        "value":Math.round((selectedEquipmentItem.itemData.muzzleVelocityChange + 1) * 100)
                     });
                  }
                  if(selectedEquipmentItem.weaponType.category == 3)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(302).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.arrowSpeed
                     });
                  }
                  if(selectedEquipmentItem.weaponType.category == 1)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(303).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.baseDamage
                     });
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(304).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.armorNeutralization
                     });
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(305).toUpperCase(),
                        "value":Math.round(selectedEquipmentItem.itemData.openWoundCoeficient * 1000)
                     });
                  }
                  if(selectedEquipmentItem.weaponType.category == 5)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(306).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.explosiveness
                     });
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(307).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.antiPersonnel
                     });
                  }
                  equipmentDescriptionList.push({"skipLine":true});
                  equipmentDescriptionList.push({"oneLine":Texts.fetch(1005).toUpperCase() + ":"});
                  equipmentDescriptionList.push({"skipLine":true});
                  for(_loc3_ in selectedEquipmentItem.weaponType.modes)
                  {
                     equipmentDescriptionList.push({
                        "name":selectedEquipmentItem.getWeaponModeName(_loc3_).toUpperCase(),
                        "value":selectedEquipmentItem.weaponType.modes[_loc3_].AP + " " + Texts.fetch(1095,null,3)
                     });
                  }
                  if(selectedEquipmentItem.weaponType.category == 2 || selectedEquipmentItem.weaponType.category == 3 || selectedEquipmentItem.weaponType.category == 4)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(195).toUpperCase(),
                        "value":selectedEquipmentItem.weaponType.reloadAP + " " + Texts.fetch(1095,null,3)
                     });
                  }
                  break;
               case 3:
                  equipmentItemEssencial1.text = Texts.fetch(298,1,15).toUpperCase();
                  equipmentItemEssencial2.text = "";
                  if(!selectedEquipmentItem.itemData.flamethrower && !selectedEquipmentItem.itemData.explosive)
                  {
                     if(WeaponsData.Calibers[selectedEquipmentItem.itemData.type].arrow)
                     {
                        _loc5_ = selectedEquipmentItem.itemData.projectileMass * Math.pow(50,2) / 2000;
                     }
                     else
                     {
                        _loc5_ = selectedEquipmentItem.itemData.projectileMass * Math.pow(selectedEquipmentItem.itemData.muzzleVelocity * 0.7,2) / 2000;
                     }
                     _loc1_ = (1 - 1 / (1 + Math.exp(0.03 * _loc5_ - 3))) * Math.pow(_loc5_,0.125) * (0.5 + _loc5_ / 2000 * Math.exp(-_loc5_ / 2000) / 2) * selectedEquipmentItem.bulletDiameter * selectedEquipmentItem.itemData.softTargetDamage * 2;
                     if(selectedEquipmentItem.itemData.pallets > 0)
                     {
                        _loc1_ *= selectedEquipmentItem.itemData.pallets;
                     }
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1012).toUpperCase(),
                        "value":Math.round(_loc1_)
                     });
                     equipmentDescriptionList.push({"skipLine":true});
                  }
                  if(selectedEquipmentItem.itemData.explosiveness > 0)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(306).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.explosiveness
                     });
                  }
                  if(selectedEquipmentItem.itemData.projectileMass > 0)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1006).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.projectileMass
                     });
                  }
                  if(selectedEquipmentItem.itemData.muzzleVelocity > 0)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(301).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.muzzleVelocity
                     });
                  }
                  if(selectedEquipmentItem.itemData.armorPiercing != undefined)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1007).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.armorPiercing
                     });
                  }
                  if(selectedEquipmentItem.itemData.softTargetDamage != undefined)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1008).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.softTargetDamage
                     });
                  }
                  if(selectedEquipmentItem.itemData.FF > 0)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1011).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.FF
                     });
                  }
                  if(selectedEquipmentItem.itemData.pallets != undefined)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1009).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.pallets
                     });
                  }
                  if(selectedEquipmentItem.itemData.bulletDiameter != undefined)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1010).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.bulletDiameter
                     });
                  }
                  else if(WeaponsData.Calibers[selectedEquipmentItem.itemData.type].bulletDiameter != undefined)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1013).toUpperCase(),
                        "value":WeaponsData.Calibers[selectedEquipmentItem.itemData.type].bulletDiameter
                     });
                  }
                  break;
               case 4:
                  equipmentItemEssencial1.text = Texts.fetch(1001,1,15).toUpperCase();
                  equipmentItemEssencial2.text = "";
                  _loc3_ = 0;
                  while(_loc3_ < selectedEquipmentItem.itemData.applicable.length)
                  {
                     switch(selectedEquipmentItem.itemData.applicable[_loc3_])
                     {
                        case "rifle":
                           equipmentItemEssencial2.text += Texts.fetch(973,1,15).toUpperCase();
                           break;
                        case "crossbow":
                           equipmentItemEssencial2.text += Texts.fetch(971,1,15).toUpperCase();
                           break;
                        case "pistol":
                           equipmentItemEssencial2.text += Texts.fetch(972,1,15).toUpperCase();
                           break;
                        case "machinegun":
                           equipmentItemEssencial2.text += Texts.fetch(974,1,15).toUpperCase();
                           break;
                        case "smg":
                           equipmentItemEssencial2.text += Texts.fetch(975,1,15).toUpperCase();
                           break;
                        case "shotgun":
                           equipmentItemEssencial2.text += Texts.fetch(986,1,15).toUpperCase();
                           break;
                        case "rocketLauncher":
                           equipmentItemEssencial2.text += Texts.fetch(976,1,15).toUpperCase();
                           break;
                        case "flamethrower":
                           equipmentItemEssencial2.text += Texts.fetch(977,1,15).toUpperCase();
                     }
                     if(_loc3_ < selectedEquipmentItem.itemData.applicable.length - 1)
                     {
                        equipmentItemEssencial2.text += ", ";
                     }
                     _loc3_++;
                  }
                  if(selectedEquipmentItem.itemData.affectAccuracy != undefined)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1016).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.affectAccuracy
                     });
                  }
                  if(selectedEquipmentItem.itemData.affectAP != undefined)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(1017).toUpperCase(),
                        "value":0 - selectedEquipmentItem.itemData.affectAP
                     });
                  }
                  if(selectedEquipmentItem.itemData.batteries > 0)
                  {
                     equipmentDescriptionList.push({
                        "name":Texts.fetch(6823).toUpperCase(),
                        "value":selectedEquipmentItem.itemData.batteries
                     });
                  }
                  break;
               case 5:
                  if(selectedEquipmentItem.itemData.type == 1)
                  {
                     equipmentItemEssencial1.text = Texts.fetch(1002,1,15).toUpperCase();
                  }
                  if(selectedEquipmentItem.itemData.type == 2)
                  {
                     equipmentItemEssencial1.text = Texts.fetch(1003,1,15).toUpperCase();
                  }
                  equipmentItemEssencial2.text = "";
                  equipmentDescriptionList.push({
                     "name":Texts.fetch(1004).toUpperCase(),
                     "value":selectedEquipmentItem.itemData.armor
                  });
                  equipmentDescriptionList.push({
                     "name":Texts.fetch(1014).toUpperCase(),
                     "value":selectedEquipmentItem.itemData.fireResistance
                  });
                  equipmentDescriptionList.push({
                     "name":Texts.fetch(1015).toUpperCase(),
                     "value":selectedEquipmentItem.itemData.explosionResistance
                  });
            }
            equipmentDescriptionArea.clearAll();
            _loc4_ = 5;
            for(_loc3_ in equipmentDescriptionList)
            {
               if(equipmentDescriptionList[_loc3_].skipLine)
               {
                  _loc4_ += 5;
               }
               else if(equipmentDescriptionList[_loc3_].oneLine is String)
               {
                  _loc6_ = new EngineText(equipmentDescriptionList[_loc3_].oneLine,16777215,11,"center",5,_loc4_,130,15);
                  equipmentDescriptionArea.addContent(_loc6_,null,null,null,null,true);
                  _loc4_ += 15;
               }
               else if(equipmentDescriptionList[_loc3_].name is String)
               {
                  _loc7_ = new EngineText(equipmentDescriptionList[_loc3_].name,16777215,11,"left",5,_loc4_,130,15);
                  _loc2_ = new EngineText(equipmentDescriptionList[_loc3_].value,16777215,11,"right",5,_loc4_,130,15);
                  while(_loc7_.textWidth + _loc2_.textWidth > 125)
                  {
                     if(_loc7_.text.length > 3)
                     {
                        _loc7_.text = _loc7_.text.substring(0,_loc7_.text.length - 2) + ".";
                     }
                     else
                     {
                        if(_loc2_.text.length <= 3)
                        {
                           break;
                        }
                        _loc2_.text = _loc2_.text.substring(0,_loc2_.text.length - 2) + ".";
                     }
                  }
                  equipmentDescriptionArea.addContent(_loc7_,null,null,null,null,true);
                  equipmentDescriptionArea.addContent(_loc2_,null,null,null,null,true);
                  _loc4_ += 15;
               }
            }
            equipmentDescriptionArea.updateSize();
         }
         checkIfSelectedIsPossible();
         updateSlots();
      }
      
      private function checkIfSelectedIsPossible() : *
      {
         var _loc7_:* = undefined;
         var _loc2_:* = undefined;
         var _loc5_:* = undefined;
         var _loc1_:* = undefined;
         var _loc9_:* = undefined;
         var _loc8_:* = undefined;
         var _loc6_:* = undefined;
         var _loc3_:Array = [];
         var _loc4_:Boolean = false;
         if(!(selectedEquipmentItem is Item) || !(selectedEquipmentPerson is Character))
         {
            selectedEquipmentSlot = null;
            for(_loc6_ in equipmentSlots)
            {
               equipmentSlots[_loc6_].pic.useHandCursor = false;
            }
            equipButton.visible = false;
            equipmentUncompatibleText.visible = false;
            equipmentTooHeavyText.visible = false;
            return false;
         }
         switch(selectedEquipmentItem.category)
         {
            case 2:
               _loc3_ = [2,5];
               break;
            case 3:
            case 1:
               _loc3_ = [8];
               break;
            case 4:
               _loc7_ = 0;
               while(_loc7_ <= 1)
               {
                  if(selectedEquipmentPerson.weapons[_loc7_] > 0)
                  {
                     _loc5_ = WeaponsData.detectWeaponSkill(WeaponsData.Weapons[selectedEquipmentPerson.weapons[_loc7_]]);
                     _loc1_ = false;
                     for(_loc6_ in selectedEquipmentItem.itemData.applicable)
                     {
                        if(selectedEquipmentItem.itemData.applicable[_loc6_] == _loc5_)
                        {
                           _loc1_ = true;
                           break;
                        }
                     }
                     if(_loc1_)
                     {
                        _loc9_ = false;
                        for(_loc6_ in selectedEquipmentPerson.attachments[_loc7_])
                        {
                           if(selectedEquipmentPerson.attachments[_loc7_][_loc6_] > 0 && WeaponsData.Attachments[selectedEquipmentPerson.attachments[_loc7_][_loc6_]].type == selectedEquipmentItem.itemData.type)
                           {
                              _loc9_ = true;
                              break;
                           }
                        }
                        if(_loc9_)
                        {
                           _loc3_.push((_loc7_ + 1) * 3 + _loc6_);
                        }
                        else
                        {
                           _loc3_.push((_loc7_ + 1) * 3);
                           _loc3_.push((_loc7_ + 1) * 3 + 1);
                        }
                     }
                  }
                  _loc7_++;
               }
               break;
            case 5:
               if(selectedEquipmentItem.itemData.type == 1)
               {
                  _loc3_ = [0];
               }
               if(selectedEquipmentItem.itemData.type == 2)
               {
                  _loc3_ = [1];
               }
         }
         for(_loc6_ in _loc3_)
         {
            if(_loc3_[_loc6_] == selectedEquipmentSlot)
            {
               _loc4_ = true;
               break;
            }
         }
         if(!_loc4_)
         {
            selectedEquipmentSlot = null;
         }
         for(_loc6_ in equipmentSlots)
         {
            _loc4_ = false;
            for(_loc7_ in _loc3_)
            {
               if(_loc3_[_loc7_] == _loc6_)
               {
                  _loc4_ = true;
                  break;
               }
            }
            equipmentSlots[_loc6_].pic.useHandCursor = _loc4_ && _loc6_ != 8 && _loc6_ != 0 && _loc6_ != 1;
         }
         if(selectedEquipmentSlot == null)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc3_.length)
            {
               switch(_loc3_[_loc6_])
               {
                  case 0:
                     _loc2_ = selectedEquipmentPerson.Jacket;
                     break;
                  case 1:
                     _loc2_ = selectedEquipmentPerson.Headgear;
                     break;
                  case 2:
                     _loc2_ = selectedEquipmentPerson.weapons[0];
                     break;
                  case 3:
                     _loc2_ = selectedEquipmentPerson.attachments[0][0];
                     break;
                  case 4:
                     _loc2_ = selectedEquipmentPerson.attachments[0][1];
                     break;
                  case 5:
                     _loc2_ = selectedEquipmentPerson.weapons[1];
                     break;
                  case 6:
                     _loc2_ = selectedEquipmentPerson.attachments[1][0];
                     break;
                  case 7:
                     _loc2_ = selectedEquipmentPerson.attachments[1][1];
                     break;
                  case 8:
                     _loc2_ = 1;
               }
               if(!_loc2_ > 0)
               {
                  selectedEquipmentSlot = _loc3_[_loc6_];
                  break;
               }
               _loc6_++;
            }
         }
         if(selectedEquipmentSlot == null && _loc3_.length > 0)
         {
            selectedEquipmentSlot = _loc3_[0];
         }
         switch(selectedEquipmentSlot)
         {
            case 0:
               if(selectedEquipmentPerson.Jacket > 0)
               {
                  _loc8_ = new Item(Item.itemNumFromCatSubCat(5,selectedEquipmentPerson.Jacket)).weightPerUnit;
               }
               else
               {
                  _loc8_ = 0;
               }
               break;
            case 1:
               if(selectedEquipmentPerson.Headgear > 0)
               {
                  _loc8_ = new Item(Item.itemNumFromCatSubCat(5,selectedEquipmentPerson.Headgear)).weightPerUnit;
               }
               else
               {
                  _loc8_ = 0;
               }
               break;
            case 2:
               if(selectedEquipmentPerson.weapons[0] > 0)
               {
                  _loc8_ = new Item(Item.itemNumFromCatSubCat(2,selectedEquipmentPerson.weapons[0])).weightPerUnit;
               }
               else
               {
                  _loc8_ = 0;
               }
               break;
            case 3:
               if(selectedEquipmentPerson.attachments[0][0] > 0)
               {
                  _loc8_ = new Item(Item.itemNumFromCatSubCat(4,selectedEquipmentPerson.attachments[0][0])).weightPerUnit;
               }
               else
               {
                  _loc8_ = 0;
               }
               break;
            case 4:
               if(selectedEquipmentPerson.attachments[0][1] > 0)
               {
                  _loc8_ = new Item(Item.itemNumFromCatSubCat(4,selectedEquipmentPerson.attachments[0][1])).weightPerUnit;
               }
               else
               {
                  _loc8_ = 0;
               }
               break;
            case 5:
               if(selectedEquipmentPerson.weapons[1] > 0)
               {
                  _loc8_ = new Item(Item.itemNumFromCatSubCat(2,selectedEquipmentPerson.weapons[1])).weightPerUnit;
               }
               else
               {
                  _loc8_ = 0;
               }
               break;
            case 6:
               if(selectedEquipmentPerson.attachments[1][0] > 0)
               {
                  _loc8_ = new Item(Item.itemNumFromCatSubCat(4,selectedEquipmentPerson.attachments[1][0])).weightPerUnit;
               }
               else
               {
                  _loc8_ = 0;
               }
               break;
            case 7:
               if(selectedEquipmentPerson.attachments[1][1] > 0)
               {
                  _loc8_ = new Item(Item.itemNumFromCatSubCat(4,selectedEquipmentPerson.attachments[1][1])).weightPerUnit;
               }
               else
               {
                  _loc8_ = 0;
               }
               break;
            default:
               _loc8_ = 0;
         }
         var _loc11_:* = selectedEquipmentPerson.availableCapacity;
         var _loc10_:* = getSlotItemData(selectedEquipmentSlot);
         if(_loc10_.subCategory > 0)
         {
            if(_loc10_.category == 2 && WeaponsData.WeaponTypes[WeaponsData.Weapons[_loc10_.subCategory].type].category == 5)
            {
               _loc11_ += WeaponsData.Weapons[_loc10_.subCategory].weight * selectedEquipmentPerson.grenadeAmounts[_loc10_.weaponSlot];
            }
            else
            {
               _loc11_ += new Item(Item.itemNumFromCatSubCat(_loc10_.category,_loc10_.subCategory),1).weightPerUnit;
            }
         }
         equipmentUncompatibleText.visible = _loc3_.length == 0;
         equipmentTooHeavyText.visible = _loc3_.length > 0 && selectedEquipmentItem.weightPerUnit > _loc11_;
         equipButton.visible = selectedEquipmentPerson is Character && !equipmentUncompatibleText.visible && !equipmentTooHeavyText.visible;
      }
      
      private function updateEquipmentPerson() : *
      {
         var _loc8_:* = undefined;
         var _loc2_:* = undefined;
         var _loc6_:* = undefined;
         var _loc9_:* = undefined;
         var _loc1_:* = undefined;
         var _loc5_:* = undefined;
         var _loc10_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc11_:* = undefined;
         updateBottomLine();
         equipmentPersonPic.visible = equipmentPersonName.visible = equipmentPersonLoad.visible = equipmentArmorInfo1.visible = equipmentArmorInfo2.visible = equipmentArmorInfo3.visible = equipmentArmorSymbol1.visible = equipmentList.visible = equipmentArmorSymbol2.visible = equipmentArmorSymbol3.visible = equipmentInventoryTitle.visible = equipmentPersonData.visible = equipmentPersonDataFrame.visible = selectedEquipmentPerson is Character;
         for(_loc6_ in equipmentSlots)
         {
            equipmentSlots[_loc6_].pic.visible = selectedEquipmentPerson is Character;
         }
         _loc6_ = 0;
         while(_loc6_ <= 1)
         {
            defaultAmmoTitles[_loc6_].visible = defaultAmmoFrames[_loc6_].visible = defaultAmmoTexts[_loc6_].visible = selectedEquipmentPerson is Character;
            _loc6_++;
         }
         for(_loc6_ in defaultAmmoButtons)
         {
            defaultAmmoButtons[_loc6_].visible = selectedEquipmentPerson is Character;
         }
         for(_loc6_ in equipmentButtons)
         {
            equipmentButtons[_loc6_].visible = selectedEquipmentPerson is Character;
         }
         if(selectedEquipmentPerson is Character)
         {
            if(equipmentPersonPicContent is Bitmap && equipmentPersonPic.contains(equipmentPersonPicContent))
            {
               equipmentPersonPic.removeChild(equipmentPersonPicContent);
            }
            equipmentPersonPicContent = new Bitmap(selectedEquipmentPerson.generatePortrait());
            equipmentPersonPicContent.scaleX = equipmentPersonPicContent.scaleY = 0.4;
            equipmentPersonPic.addChild(equipmentPersonPicContent);
            for(_loc6_ in equipmentSlots)
            {
               if(equipmentSlots[_loc6_].innerPic is DisplayObject && equipmentSlots[_loc6_].pic.contains(equipmentSlots[_loc6_].innerPic))
               {
                  equipmentSlots[_loc6_].pic.removeChild(equipmentSlots[_loc6_].innerPic);
               }
               equipmentSlots[_loc6_].innerPic = null;
               switch(_loc6_)
               {
                  case 0:
                     if(selectedEquipmentPerson.Jacket > 0)
                     {
                        equipmentSlots[_loc6_].innerPic = new Item(Item.itemNumFromCatSubCat(5,selectedEquipmentPerson.Jacket)).picture;
                        equipmentSlots[_loc6_].innerPic.scaleX = equipmentSlots[_loc6_].innerPic.scaleY = 0.2;
                     }
                     break;
                  case 1:
                     if(selectedEquipmentPerson.Headgear > 0)
                     {
                        equipmentSlots[_loc6_].innerPic = new Item(Item.itemNumFromCatSubCat(5,selectedEquipmentPerson.Headgear)).picture;
                        equipmentSlots[_loc6_].innerPic.scaleX = equipmentSlots[_loc6_].innerPic.scaleY = 0.2;
                     }
                     break;
                  case 2:
                     if(selectedEquipmentPerson.weapons[0] > 0)
                     {
                        equipmentSlots[_loc6_].innerPic = WeaponsData.getWeaponIcon(selectedEquipmentPerson.weapons[0]);
                        equipmentSlots[_loc6_].innerPic.smoothing = true;
                        equipmentSlots[_loc6_].innerPic.scaleX = equipmentSlots[_loc6_].innerPic.scaleY = 0.4;
                     }
                     break;
                  case 3:
                     if(selectedEquipmentPerson.attachments[0][0] > 0)
                     {
                        equipmentSlots[_loc6_].innerPic = new Item(Item.itemNumFromCatSubCat(4,selectedEquipmentPerson.attachments[0][0])).picture;
                        equipmentSlots[_loc6_].innerPic.scaleX = equipmentSlots[_loc6_].innerPic.scaleY = 0.2;
                     }
                     break;
                  case 4:
                     if(selectedEquipmentPerson.attachments[0][1] > 0)
                     {
                        equipmentSlots[_loc6_].innerPic = new Item(Item.itemNumFromCatSubCat(4,selectedEquipmentPerson.attachments[0][1])).picture;
                        equipmentSlots[_loc6_].innerPic.scaleX = equipmentSlots[_loc6_].innerPic.scaleY = 0.2;
                     }
                     break;
                  case 5:
                     if(selectedEquipmentPerson.weapons[1] > 0)
                     {
                        equipmentSlots[_loc6_].innerPic = WeaponsData.getWeaponIcon(selectedEquipmentPerson.weapons[1]);
                        equipmentSlots[_loc6_].innerPic = WeaponsData.getWeaponIcon(selectedEquipmentPerson.weapons[1]);
                        equipmentSlots[_loc6_].innerPic.smoothing = true;
                        equipmentSlots[_loc6_].innerPic.scaleX = equipmentSlots[_loc6_].innerPic.scaleY = 0.4;
                     }
                     break;
                  case 6:
                     if(selectedEquipmentPerson.attachments[1][0] > 0)
                     {
                        equipmentSlots[_loc6_].innerPic = new Item(Item.itemNumFromCatSubCat(4,selectedEquipmentPerson.attachments[1][0])).picture;
                        equipmentSlots[_loc6_].innerPic.scaleX = equipmentSlots[_loc6_].innerPic.scaleY = 0.2;
                     }
                     break;
                  case 7:
                     if(selectedEquipmentPerson.attachments[1][1] > 0)
                     {
                        equipmentSlots[_loc6_].innerPic = new Item(Item.itemNumFromCatSubCat(4,selectedEquipmentPerson.attachments[1][1])).picture;
                        equipmentSlots[_loc6_].innerPic.scaleX = equipmentSlots[_loc6_].innerPic.scaleY = 0.2;
                     }
               }
               if(equipmentSlots[_loc6_].innerPic is DisplayObject)
               {
                  equipmentSlots[_loc6_].pic.addChildAt(equipmentSlots[_loc6_].innerPic,2);
               }
            }
            equipmentPersonName.text = selectedEquipmentPerson.name.toUpperCase();
            equipmentPersonLoad.text = Texts.fetch(903).toUpperCase() + ": " + Math.round(selectedEquipmentPerson.equipmentWeight * 10) / 10 + "/" + Math.round(selectedEquipmentPerson.capacity * 10) / 10 + " " + Texts.fetch(12);
            _loc6_ = 0;
            while(_loc6_ <= 1)
            {
               if(selectedEquipmentPerson.weapons[_loc6_] != null)
               {
                  switch(WeaponsData.WeaponTypes[WeaponsData.Weapons[selectedEquipmentPerson.weapons[_loc6_]].type].category)
                  {
                     case 2:
                     case 3:
                     case 4:
                        equipmentSlots[(_loc6_ + 1) * 3 - 1].ammoIcon.visible = true;
                        _loc5_ = WeaponsData.Weapons[selectedEquipmentPerson.weapons[_loc6_]].ammo;
                        if(_loc6_ == 1 && selectedEquipmentPerson.weapons[0] > 0 && _loc5_ == WeaponsData.Weapons[selectedEquipmentPerson.weapons[0]].ammo)
                        {
                           equipmentSlots[(_loc6_ + 1) * 3 - 1].infoText.text = Texts.fetch(1023).toUpperCase();
                        }
                        else
                        {
                           _loc9_ = 0;
                           if(_loc5_ == 17)
                           {
                              _loc9_ = Math.floor(GD.Caravans[0].money);
                           }
                           else
                           {
                              for(_loc8_ in selectedEquipmentPerson.equipment)
                              {
                                 if(selectedEquipmentPerson.equipment[_loc8_].category == 3 && selectedEquipmentPerson.equipment[_loc8_].itemData.type == _loc5_)
                                 {
                                    _loc9_ += selectedEquipmentPerson.equipment[_loc8_].amount;
                                 }
                              }
                           }
                           equipmentSlots[(_loc6_ + 1) * 3 - 1].infoText.text = _loc9_;
                        }
                        equipmentSlots[(_loc6_ + 1) * 3 - 1].ammoIcon.x = 95 - equipmentSlots[(_loc6_ + 1) * 3 - 1].infoText.textWidth - 15;
                        break;
                     case 5:
                        equipmentSlots[(_loc6_ + 1) * 3 - 1].ammoIcon.visible = false;
                        equipmentSlots[(_loc6_ + 1) * 3 - 1].infoText.text = "x" + selectedEquipmentPerson.grenadeAmounts[_loc6_];
                        break;
                     default:
                        equipmentSlots[(_loc6_ + 1) * 3 - 1].ammoIcon.visible = false;
                        equipmentSlots[(_loc6_ + 1) * 3 - 1].infoText.text = "";
                  }
               }
               else
               {
                  equipmentSlots[(_loc6_ + 1) * 3 - 1].ammoIcon.visible = false;
                  equipmentSlots[(_loc6_ + 1) * 3 - 1].infoText.text = "";
               }
               _loc6_++;
            }
            equipmentArmorInfo1.text = selectedEquipmentPerson.armor;
            equipmentArmorInfo2.text = selectedEquipmentPerson.fireResistance;
            _loc1_ = 285 - (equipmentArmorInfo1.textWidth + equipmentArmorInfo2.textWidth + 45) / 2;
            equipmentArmorSymbol1.x = _loc1_ + 5;
            equipmentArmorInfo1.x = _loc1_ + 15;
            equipmentArmorSymbol2.x = _loc1_ + 35 + equipmentArmorInfo1.textWidth;
            equipmentArmorInfo2.x = _loc1_ + 45 + equipmentArmorInfo1.textWidth;
            equipmentArmorInfo3.text = selectedEquipmentPerson.explosionResistance;
            _loc1_ = 285 - (equipmentArmorInfo3.textWidth + 15) / 2;
            equipmentArmorSymbol3.x = _loc1_ + 5;
            equipmentArmorInfo3.x = _loc1_ + 15;
            equipmentList.update(selectedEquipmentPerson.equipment);
            for(_loc6_ in equipmentPersonData.contentList)
            {
               equipmentPersonData.Content.removeChild(equipmentPersonData.contentList[_loc6_].item);
            }
            equipmentPersonData.contentList = [];
            _loc4_ = [];
            var _loc7_:* = 5;
            _loc4_.push({
               "name":Texts.fetch(944).toUpperCase(),
               "value":Math.round(selectedEquipmentPerson.physical)
            });
            _loc4_.push({
               "name":Texts.fetch(945).toUpperCase(),
               "value":Math.round(selectedEquipmentPerson.agility)
            });
            _loc4_.push({
               "name":Texts.fetch(946).toUpperCase(),
               "value":Math.round(selectedEquipmentPerson.accuracy)
            });
            _loc4_.push({
               "name":Texts.fetch(947).toUpperCase(),
               "value":Math.round(selectedEquipmentPerson.intelligence),
               "skipLine":true
            });
            _loc4_.push({
               "name":Texts.fetch(50).toUpperCase(),
               "value":Math.round(selectedEquipmentPerson.HP) + "/" + Math.round(selectedEquipmentPerson.maxHP)
            });
            _loc4_.push({
               "name":Texts.fetch(200).toUpperCase(),
               "value":Math.round(selectedEquipmentPerson.morale) + "%"
            });
            _loc4_.push({
               "name":Texts.fetch(1095,null,3),
               "value":Math.round(selectedEquipmentPerson.maxAP),
               "skipLine":true
            });
            for(_loc6_ in Character.skillsList)
            {
               if(Character.skillsList[_loc6_].skill == "painThreshold")
               {
                  _loc11_ = selectedEquipmentPerson[Character.skillsList[_loc6_].skill] * 100;
               }
               else
               {
                  _loc11_ = selectedEquipmentPerson[Character.skillsList[_loc6_].skill];
               }
               _loc4_.push({
                  "name":Texts.fetch(Character.skillsList[_loc6_].name,1,19).toUpperCase(),
                  "value":Math.round(_loc11_)
               });
            }
            for(_loc6_ in _loc4_)
            {
               _loc10_ = new EngineText(_loc4_[_loc6_].name,16777215,11,"left",5,_loc7_,160,20);
               _loc3_ = new EngineText(_loc4_[_loc6_].value,16777215,11,"right",5,_loc7_,160,20);
               equipmentPersonData.addContent(_loc10_,null,null,null,null,true);
               equipmentPersonData.addContent(_loc3_,null,null,null,null,true);
               _loc7_ += 15;
               if(_loc4_[_loc6_].skipLine)
               {
                  _loc7_ += 5;
               }
            }
            _loc2_ = selectedEquipmentPerson.attachmentsBatteryStatus();
            for(_loc6_ in _loc2_)
            {
               for(_loc8_ in _loc2_[_loc6_])
               {
                  attachmentBatterySymbols[_loc6_ * 2 + _loc8_].visible = !_loc2_[_loc6_][_loc8_];
               }
            }
            equipmentPersonData.updateSize();
            updateAmmoNames();
            checkIfSelectedIsPossible();
            updateSlots();
         }
         else
         {
            for(_loc6_ in attachmentBatterySymbols)
            {
               attachmentBatterySymbols[_loc6_].visible = false;
            }
            checkIfSelectedIsPossible();
         }
      }
      
      private function updateAmmoNames() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ <= 1)
         {
            selectedEquipmentPerson.updateSelectedAmmo(_loc1_);
            if(selectedEquipmentPerson.selectedAmmo[_loc1_] == null)
            {
               defaultAmmoTexts[_loc1_].text = Texts.fetch(193);
            }
            else
            {
               trace("slot " + _loc1_ + ": " + WeaponsData.Weapons[selectedEquipmentPerson.weapons[_loc1_]].ammo);
               if(selectedEquipmentPerson.weapons[_loc1_] > 0 && WeaponsData.Weapons[selectedEquipmentPerson.weapons[_loc1_]].ammo == 17)
               {
                  defaultAmmoTexts[_loc1_].text = Texts.fetch(20).toUpperCase();
               }
               else
               {
                  defaultAmmoTexts[_loc1_].text = Texts.fetch(Item.getDataFromType(selectedEquipmentPerson.selectedAmmo[_loc1_]).variation).toUpperCase();
               }
            }
            _loc1_++;
         }
      }
      
      private function equipItem() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         _loc3_ = getSlotItemData(selectedEquipmentSlot);
         _loc2_ = _loc3_.subCategory > 0 && _loc3_.category == 2 && WeaponsData.WeaponTypes[WeaponsData.Weapons[_loc3_.subCategory].type].category == 5;
         _loc1_ = selectedEquipmentItem.category == 2 && selectedEquipmentItem.weaponType.category == 5;
         _loc5_ = selectedEquipmentPerson.availableCapacity;
         if(_loc3_.subCategory > 0)
         {
            if(_loc3_.category == 2 && WeaponsData.WeaponTypes[WeaponsData.Weapons[_loc3_.subCategory].type].category == 5)
            {
               _loc5_ += WeaponsData.Weapons[_loc3_.subCategory].weight * selectedEquipmentPerson.grenadeAmounts[_loc3_.weaponSlot];
            }
            else
            {
               _loc5_ += new Item(Item.itemNumFromCatSubCat(_loc3_.category,_loc3_.subCategory),1).weightPerUnit;
            }
         }
         if(_loc3_.subCategory > 0 && !_loc1_)
         {
            if(_loc2_)
            {
               removeItemFromSlot(selectedEquipmentSlot,selectedEquipmentPerson.grenadeAmounts[_loc3_.weaponSlot]);
               selectedEquipmentPerson.grenadeAmounts[_loc3_.weaponSlot] = 0;
            }
            else
            {
               removeItemFromSlot(selectedEquipmentSlot,1);
            }
         }
         if(selectedEquipmentSlot != 8)
         {
            if(_loc1_)
            {
               calculator.min = 1;
               _loc4_ = selectedEquipmentItem.amount - selectedEquipmentItem.inUse;
               if(selectedEquipmentItem.category == 2 && selectedEquipmentItem.subCategory == _loc3_.subCategory)
               {
                  _loc4_ += selectedEquipmentPerson.grenadeAmounts[_loc3_.weaponSlot];
               }
               calculator.max = Math.min(_loc4_,Math.floor(_loc5_ / selectedEquipmentItem.weightPerUnit));
               calculator.info.text = Texts.fetch(1022).toUpperCase();
               if(selectedEquipmentItem.category == 2 && selectedEquipmentItem.subCategory == _loc3_.subCategory)
               {
                  calculator.setValue(Math.min(selectedEquipmentPerson.grenadeAmounts[_loc3_.weaponSlot],calculator.max));
               }
               else
               {
                  calculator.setValue(0);
               }
               calculator.onDone = equipGrenades;
               calculator.visible = true;
            }
            else
            {
               setSlotValue(selectedEquipmentSlot,selectedEquipmentItem.subCategory);
               selectedEquipmentPerson.addItemToEquipment(new Item(selectedEquipmentItem.type,1));
               selectedEquipmentItem.inUse++;
            }
         }
         else
         {
            calculator.min = 1;
            calculator.max = Math.min(Math.round(selectedEquipmentItem.amount - selectedEquipmentItem.inUse),Math.floor(selectedEquipmentPerson.availableCapacity / selectedEquipmentItem.weightPerUnit));
            calculator.visible = true;
            calculator.setValue(1);
            calculator.info.text = Texts.fetch(1214).toUpperCase();
            calculator.onDone = addItemsToEquipment;
         }
         selectedEquipmentPerson.checkAttachmentsCompatibility();
         equipmentItemsList.update();
         updateEquipmentPerson();
      }
      
      private function addItemsToEquipment(param1:*) : *
      {
         selectedEquipmentPerson.addItemToEquipment(new Item(selectedEquipmentItem.type,param1));
         selectedEquipmentItem.inUse += param1;
         updateEquipmentPerson();
         equipmentItemsList.update();
      }
      
      private function equipGrenades(param1:*) : *
      {
         var _loc3_:* = getSlotItemData(selectedEquipmentSlot);
         var _loc2_:Boolean = _loc3_.category == 2 && WeaponsData.WeaponTypes[WeaponsData.Weapons[_loc3_.subCategory].type].category == 5;
         if(_loc3_.subCategory > 0)
         {
            if(_loc2_)
            {
               removeItemFromSlot(selectedEquipmentSlot,selectedEquipmentPerson.grenadeAmounts[_loc3_.weaponSlot]);
               selectedEquipmentPerson.grenadeAmounts[_loc3_.weaponSlot] = 0;
            }
            else
            {
               removeItemFromSlot(selectedEquipmentSlot,1);
            }
         }
         setSlotValue(selectedEquipmentSlot,selectedEquipmentItem.subCategory);
         selectedEquipmentPerson.addItemToEquipment(new Item(selectedEquipmentItem.type,param1));
         selectedEquipmentItem.inUse += param1;
         selectedEquipmentPerson.grenadeAmounts[_loc3_.weaponSlot] = param1;
         selectedEquipmentPerson.checkAttachmentsCompatibility();
         equipmentItemsList.update();
         updateEquipmentPerson();
      }
      
      private function removeItemFromSlot(param1:*, param2:* = 1) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = getSlotItemData(param1);
         var _loc3_:* = Item.itemNumFromCatSubCat(_loc5_.category,_loc5_.subCategory);
         selectedEquipmentPerson.reduceItemFromEquipment(_loc3_,param2,false,true);
         setSlotValue(param1,0);
      }
      
      private function setSlotValue(param1:*, param2:*) : *
      {
         switch(param1)
         {
            case 0:
               selectedEquipmentPerson.Jacket = param2;
               break;
            case 1:
               selectedEquipmentPerson.Headgear = param2;
               break;
            case 2:
               selectedEquipmentPerson.weapons[0] = param2;
               break;
            case 3:
               selectedEquipmentPerson.attachments[0][0] = param2;
               break;
            case 4:
               selectedEquipmentPerson.attachments[0][1] = param2;
               break;
            case 5:
               selectedEquipmentPerson.weapons[1] = param2;
               break;
            case 6:
               selectedEquipmentPerson.attachments[1][0] = param2;
               break;
            case 7:
               selectedEquipmentPerson.attachments[1][1] = param2;
         }
      }
      
      private function getSlotItemData(param1:*) : *
      {
         var _loc2_:Object = {};
         switch(param1)
         {
            case 0:
               _loc2_.category = 5;
               _loc2_.subCategory = selectedEquipmentPerson.Jacket;
               break;
            case 1:
               _loc2_.category = 5;
               _loc2_.subCategory = selectedEquipmentPerson.Headgear;
               break;
            case 2:
               _loc2_.category = 2;
               _loc2_.subCategory = selectedEquipmentPerson.weapons[0];
               _loc2_.weaponSlot = 0;
               break;
            case 3:
               _loc2_.category = 4;
               _loc2_.subCategory = selectedEquipmentPerson.attachments[0][0];
               break;
            case 4:
               _loc2_.category = 4;
               _loc2_.subCategory = selectedEquipmentPerson.attachments[0][1];
               break;
            case 5:
               _loc2_.category = 2;
               _loc2_.subCategory = selectedEquipmentPerson.weapons[1];
               _loc2_.weaponSlot = 1;
               break;
            case 6:
               _loc2_.category = 4;
               _loc2_.subCategory = selectedEquipmentPerson.attachments[1][0];
               break;
            case 7:
               _loc2_.category = 4;
               _loc2_.subCategory = selectedEquipmentPerson.attachments[1][1];
               break;
            default:
               _loc2_.category = 0;
               _loc2_.subCategory = 0;
         }
         return _loc2_;
      }
      
      private function openRaiseSalaryWindow() : *
      {
         calculator.visible = true;
         calculator.min = selectedCrewMember.minSalary;
         calculator.max = Infinity;
         calculator.info.text = Texts.fetch(995).toUpperCase();
         calculator.onDone = setSalary;
         calculator.setValue(selectedCrewMember.salary);
      }
      
      public function setSalary(param1:*) : *
      {
         selectedCrewMember.salary = param1;
         selectCrewMember(selectedCrewMember);
      }
      
      private function openDismissDialogue() : *
      {
         var text:* = Texts.fetch(1277,selectedCrewMember.gender).replace("@name@",selectedCrewMember.name).toUpperCase();
         if((GD.Caravans[0].overTown == null || Presets.Towns[GD.Caravans[0].overTown].constantPopulation) && (selectedCrewMember.category == 1 || selectedCrewMember.category == 2))
         {
            text += "\n\n" + Texts.fetch(1275,selectedCrewMember.gender).replace("@name@",selectedCrewMember.name).toUpperCase();
         }
         ConfirmDialogue.setText(text);
         ConfirmDialogue.onApprove = function():*
         {
            dismissPerson();
         };
         ConfirmDialogue.visible = true;
      }
      
      private function dismissPerson() : *
      {
         selectedCrewMember.recalculateSalary(GD.getFactionRelations(selectedCrewMember.faction,0));
         selectedCrewMember.salary = selectedCrewMember.minSalary;
         GD.Caravans[0].removeEquipment(selectedCrewMember);
         if(GD.Caravans[0].overTown != null && !Presets.Towns[GD.Caravans[0].overTown].constantPopulation)
         {
            if(selectedCrewMember.category == 2 && !(selectedCrewMember.specialPurpose == 2 && GD.Caravans[0].overTown == 18))
            {
               GD.Towns[GD.Caravans[0].overTown].people.push(selectedCrewMember);
            }
            else
            {
               GD.Towns[GD.Caravans[0].overTown].unemployed++;
            }
            GD.Towns[GD.Caravans[0].overTown].population++;
            GD.Caravans[0].removePerson(selectedCrewMember);
         }
         else
         {
            if(selectedCrewMember.category == 1)
            {
               selectedCrewMember.category = 6;
            }
            if(selectedCrewMember.category == 2)
            {
               selectedCrewMember.category = 7;
            }
            if(selectedCrewMember.category == 3)
            {
               selectedCrewMember.category = 8;
            }
            if(selectedCrewMember.category == 4)
            {
               selectedCrewMember.category = 9;
            }
         }
         crewList.update(GD.Caravans[0].People);
      }
      
      private function openFreeDialogue() : *
      {
         var _loc1_:* = undefined;
         freeDialogue.disp.visible = true;
         freeDialogue.Buttons[5].visible = GD.Caravans[0].overTown != undefined && !Presets.Towns[GD.Caravans[0].overTown].constantPopulation;
         freeDialogue.Buttons[1].visible = freeDialogue.Buttons[2].visible = freeDialogue.Buttons[3].visible = GD.Caravans[0].overTown == undefined || Presets.Towns[GD.Caravans[0].overTown].constantPopulation;
         selectedCrewMember.recalculateSalary(selectedCrewMember.morale);
         if(GD.Caravans[0].overTown == undefined || Presets.Towns[GD.Caravans[0].overTown].constantPopulation)
         {
            _loc1_ = Texts.fetch(1282,selectedCrewMember.gender).toUpperCase();
            freeDialogue.topMostButton = freeDialogue.Buttons[5].y;
            freeDialogue.Buttons[4].y = 237;
         }
         else
         {
            _loc1_ = Texts.fetch(1285,selectedCrewMember.gender).replace("@name@",selectedCrewMember.name).toUpperCase();
            freeDialogue.topMostButton = freeDialogue.Buttons[3].y;
            freeDialogue.Buttons[4].y = 297;
         }
         freeDialogue.Buttons[4].visible = (selectedCrewMember.category == 3 && selectedCrewMember.morale >= 30 || selectedCrewMember.category == 4 && selectedCrewMember.morale >= 40) && selectedCrewMember.salary <= GD.Caravans[0].money;
         if(freeDialogue.Buttons[4].visible)
         {
            selectedCrewMember.recalculateSalary(GD.getFactionRelations(selectedCrewMember.faction,0));
            _loc1_ += "\n\n" + Texts.fetch(1283,selectedCrewMember.gender).replace("@name@",selectedCrewMember.name).replace("@money@",Math.round(selectedCrewMember.salary) + "€").toUpperCase();
            freeDialogue.topMostButton = freeDialogue.Buttons[4].y;
         }
         if(GD.Caravans[0].overTown == undefined || Presets.Towns[GD.Caravans[0].overTown].constantPopulation)
         {
            _loc1_ += "\n\n" + Texts.fetch(1284,selectedCrewMember.gender).replace("@name@",selectedCrewMember.name).toUpperCase();
         }
         freeDialogue.setText(_loc1_);
      }
      
      private function openEnslaveDialogue() : *
      {
         var textToDisplay:* = Texts.fetch(1288,selectedCrewMember.gender).replace("@name@",selectedCrewMember.name).toUpperCase();
         if(GD.Story.specificReputations[7] <= 0)
         {
            textToDisplay += "\n\n" + Texts.fetch(3772).toUpperCase();
         }
         ConfirmDialogue.setText(textToDisplay);
         ConfirmDialogue.onApprove = function():*
         {
            selectedCrewMember.category = 4;
            GD.enslaveAPerson();
            crewList.update(GD.Caravans[0].People);
         };
         ConfirmDialogue.visible = true;
      }
      
      private function openRecruitDialogue() : *
      {
         ConfirmDialogue.setText(Texts.fetch(1287,selectedCrewMember.gender).replace("@name@",selectedCrewMember.name).replace("@money@",Math.round(selectedCrewMember.salary) + "€").toUpperCase());
         ConfirmDialogue.onApprove = function():*
         {
            selectedCrewMember.category = 2;
            selectedCrewMember.payDay = GD.Time + 604800;
            GD.Caravans[0].money -= selectedCrewMember.salary;
            crewList.update(GD.Caravans[0].People);
            if(selectedCrewMember.category == 8 || selectedCrewMember.category == 9)
            {
               GD.affectSpecificReputation(5,-4);
            }
         };
         ConfirmDialogue.visible = true;
      }
      
      private function selectCrewMember(param1:*) : *
      {
         var _loc7_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         updateBottomLine();
         selectedCrewMember = param1;
         if(crewPortraitInside is Bitmap && crewPortrait.contains(crewPortraitInside))
         {
            crewPortrait.removeChild(crewPortraitInside);
         }
         crewPhotoBG.visible = crewPhotoFG.visible = crewPortrait.visible = crewName.visible = crewNameFrame.visible = crewHealthText.visible = crewMoraleText.visible = crewHealthBar.visible = crewMoraleBar.visible = crewPhysicalText.visible = crewPhysicalValue.visible = crewAgilityText.visible = crewAgilityValue.visible = crewAccuracyText.visible = crewAccuracyValue.visible = crewIntelligenceText.visible = crewIntelligenceValue.visible = crewDamagedPartsText.visible = crewDamagedPartsValue.visible = crewAPText.visible = crewAPValue.visible = crewSpeedText.visible = crewSpeedValue.visible = crewCapacityText.visible = crewCapacityValue.visible = crewStateText.visible = crewStateValue.visible = crewSkillsAndExperiencesWindow.visible = crewSkillsFrame.visible = crewLearnignCapacityText.visible = crewLearningCapacityValue.visible = crewTotalExperienceText.visible = crewTotalExperienceValue.visible = crewBattleExperienceText.visible = crewBattleExperienceValue.visible = crewWeightText.visible = crewWeightValue
         .visible = crewOfIdealText.visible = crewOfIdealValue.visible = crewGDAText.visible = crewGDAValue.visible = crewWaterConsumptionText.visible = crewWaterConsumptionValue.visible = param1 is Character;
         crewStatusText.visible = crewSalaryText.visible = crewPayDayText.visible = crewAutoPayText.visible = crewAutoPaySwitch.visible = crewRaiseSalaryButton.visible = crewDismissButton.visible = crewFreeButton.visible = crewSlaughterButton.visible = crewMeatLine.visible = crewEnslaveButton.visible = crewRecruitButton.visible = param1 is Character;
         if(param1 is Character)
         {
            crewPortraitInside = new Bitmap(param1.generatePortrait());
            crewPortrait.addChild(crewPortraitInside);
            crewName.text = param1.name.toUpperCase();
            crewNameFrame.graphics.clear();
            crewNameFrame.graphics.lineStyle(1,16777215);
            _loc2_ = Math.min(crewName.textWidth,crewName.width) + 20;
            crewNameFrame.graphics.drawRect(0 - _loc2_ / 2,-15,_loc2_,30);
            crewHealthText.text = Texts.fetch(50).toUpperCase() + ": " + Math.round(param1.HP) + "/" + param1.maxHP + " " + Texts.fetch(1096,null,3);
            crewMoraleText.text = Texts.fetch(200).toUpperCase() + ": " + Math.round(param1.morale) + "%";
            _loc4_ = Math.max(crewHealthText.textWidth,crewMoraleText.textWidth);
            crewHealthBar.graphics.clear();
            crewHealthBar.graphics.lineStyle(1,16777215);
            crewHealthBar.graphics.drawRect(_loc4_ + 10,3,240 - _loc4_,14);
            _loc6_ = (240 - _loc4_ - 8) * param1.HP / param1.maxHP;
            if(param1.maxHP <= 0)
            {
               _loc6_ = 0;
            }
            crewHealthBar.graphics.beginFill(16777215);
            crewHealthBar.graphics.drawRect(_loc4_ + 14,7,_loc6_,6);
            crewHealthBar.graphics.endFill();
            crewMoraleBar.graphics.clear();
            crewMoraleBar.graphics.lineStyle(1,16777215);
            crewMoraleBar.graphics.drawRect(_loc4_ + 10,3,240 - _loc4_,14);
            _loc6_ = (240 - _loc4_ - 8) * param1.morale / 100;
            crewMoraleBar.graphics.beginFill(16777215);
            crewMoraleBar.graphics.drawRect(_loc4_ + 14,7,_loc6_,6);
            crewMoraleBar.graphics.endFill();
            crewPhysicalValue.text = param1.physical;
            crewAgilityValue.text = param1.agility;
            crewAccuracyValue.text = param1.accuracy;
            crewIntelligenceValue.text = param1.intelligence;
            crewStateValue.text = Texts.fetch(954 + param1.wounded,param1.gender).toUpperCase();
            crewPhysicalText.text = Texts.fetch(944).toUpperCase();
            if(param1.physical != param1.basePhysical)
            {
               crewPhysicalText.text += " (" + (param1.physical - param1.basePhysical) + ")";
            }
            crewAgilityText.text = Texts.fetch(945).toUpperCase();
            if(param1.agility != param1.baseAgility)
            {
               crewAgilityText.text += " (" + (param1.agility - param1.baseAgility) + ")";
            }
            crewAccuracyText.text = Texts.fetch(946).toUpperCase();
            if(param1.accuracy != param1.baseAccuracy)
            {
               crewAccuracyText.text += " (" + (param1.accuracy - param1.baseAccuracy) + ")";
            }
            crewIntelligenceText.text = Texts.fetch(947).toUpperCase();
            if(param1.intelligence != param1.baseIntelligence)
            {
               crewIntelligenceText.text += " (" + (param1.intelligence - param1.baseIntelligence) + ")";
            }
            if(!param1.eyeDamage && !param1.armDamage && !param1.legDamage)
            {
               crewDamagedPartsValue.text = Texts.fetch(949).toUpperCase();
            }
            else
            {
               crewDamagedPartsValue.text = "";
            }
            if(param1.eyeDamage)
            {
               crewDamagedPartsValue.text = Texts.fetch(950).toUpperCase();
            }
            if(param1.legDamage)
            {
               if(crewDamagedPartsValue.text.length > 0)
               {
                  crewDamagedPartsValue.text += ",";
               }
               crewDamagedPartsValue.text += Texts.fetch(951).toUpperCase();
            }
            if(param1.armDamage)
            {
               if(crewDamagedPartsValue.text.length > 0)
               {
                  crewDamagedPartsValue.text += ",";
               }
               crewDamagedPartsValue.text += Texts.fetch(952).toUpperCase();
            }
            crewLearningCapacityValue.text = MathFunctions.NumberFormat(param1.learningCapacity * 100,0);
            crewTotalExperienceValue.text = MathFunctions.NumberFormat(param1.totalExperience,0);
            crewBattleExperienceValue.text = MathFunctions.NumberFormat(param1.generalBattleExperience,0);
            for(_loc7_ in Character.skillsList)
            {
               if(Character.skillsList[_loc7_].skill == "painThreshold")
               {
                  _loc8_ = param1[Character.skillsList[_loc7_].skill] * 100;
               }
               else
               {
                  _loc8_ = param1[Character.skillsList[_loc7_].skill];
               }
               crewSkillsList[_loc7_].value.text = MathFunctions.NumberFormat(_loc8_,0);
            }
            crewAPValue.text = param1.maxAP;
            crewSpeedValue.text = MathFunctions.NumberFormat(param1.speed,1,true);
            crewCapacityValue.text = Math.round(param1.capacity);
            crewWeightValue.text = MathFunctions.NumberFormat(param1.weight,0);
            crewOfIdealValue.text = MathFunctions.NumberFormat(param1.weight / param1.idealWeight * 100,0);
            crewGDAValue.text = MathFunctions.NumberFormat(param1.GDA,0);
            crewWaterConsumptionValue.text = MathFunctions.NumberFormat(param1.waterConsumption,3);
            if(param1.category > 5)
            {
               _loc5_ = 1121;
            }
            else if(param1.category == 5)
            {
               _loc5_ = 1123;
            }
            else
            {
               _loc5_ = 959 + param1.category;
            }
            crewStatusText.text = Texts.fetch(959).toUpperCase() + ": " + Texts.fetch(_loc5_,param1.gender).toUpperCase();
            crewRaiseSalaryButton.visible = crewAutoPayText.visible = crewAutoPaySwitch.visible = crewPayDayText.visible = crewSalaryText.visible = param1.category == 2;
            crewDismissButton.visible = param1.category == 1 && param1 != GD.Caravans[0].People[0] || param1.category == 2;
            crewFreeButton.visible = param1.category == 3 || param1.category == 4;
            crewSlaughterButton.visible = crewMeatLine.visible = param1.category == 4 && GD.Caravans[0].cannibal;
            crewEnslaveButton.visible = param1.category == 3;
            crewRecruitButton.visible = (param1.category == 6 && param1.morale >= 50 || param1.category == 7 && param1.morale >= 30 || param1.category == 8 && param1.morale >= 30 || param1.category == 9 && param1.morale >= 40) && param1.salary <= GD.Caravans[0].money;
            if(param1.category == 1)
            {
               crewDismissButton.y = 379;
            }
            if(param1.category == 2)
            {
               _loc3_ = GD.makeDate(param1.payDay);
               crewSalaryText.text = Texts.fetch(988).toUpperCase() + ": " + Math.round(param1.salary);
               crewPayDayText.text = Texts.fetch(987).toUpperCase() + ": " + _loc3_.Day + "-" + _loc3_.ShortMonthName + "-" + _loc3_.Year2d;
               crewAutoPaySwitch.setState(param1.autoPay);
               crewDismissButton.y = 429;
            }
            if(param1.category == 3)
            {
               crewFreeButton.y = 359;
            }
            if(param1.category == 4)
            {
               if(GD.Caravans[0].cannibal)
               {
                  crewFreeButton.y = 364;
               }
               else
               {
                  crewFreeButton.y = 379;
               }
               if(GD.Caravans[0].cannibal)
               {
                  crewMeatLine.text = Texts.fetch(1169).toUpperCase() + ": " + Math.round(param1.meatAmount * 10) / 10 + " " + Texts.fetch(12);
               }
            }
         }
      }
      
      private function categoryButtonEvent(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXMetallicClick().play();
         }
         for(_loc3_ in categoryButtonBodies)
         {
            if(param1.target == categoryButtonBodies[_loc3_])
            {
               _loc2_ = _loc3_;
            }
         }
         if(_loc2_ == 10)
         {
            GD.setMode(GD.cameFromMode);
            stopped = true;
         }
         else
         {
            categoryButtonShining[category].visible = false;
            categoryButtonBodies[category].mouseEnabled = true;
            categoryButtonShining[_loc2_].visible = true;
            categoryButtonBodies[_loc2_].mouseEnabled = false;
            unsetCat();
            category = _loc2_;
            setCat();
         }
      }
      
      public function setCat() : *
      {
         var _loc1_:* = undefined;
         D.addToMask(categoriesMask[category]);
         D.addChild(categoriesNormal[category]);
         updateData();
         GD.lastCaravanMenuCategory = category;
         switch(category)
         {
            case 0:
               for(_loc1_ in Caravan.skillsList)
               {
                  collectiveSkillValues[_loc1_].text = Math.round(GD.Caravans[0][Caravan.skillsList[_loc1_].varName] * Caravan.skillsList[_loc1_].multiplier);
               }
               updateData();
               if(visible)
               {
                  GD.displayTutorial(7);
               }
               break;
            case 1:
               updateLog();
               if(visible)
               {
                  GD.displayTutorial(8);
               }
               break;
            case 2:
               crewList.update(GD.Caravans[0].People);
               break;
            case 3:
               equipmentItemsList.update(GD.Caravans[0].Cargo);
               equipmentPeopleList.update(GD.Caravans[0].People);
               if(visible)
               {
                  GD.displayTutorial(10);
               }
               break;
            case 4:
               groupsUpdateSelected();
               if(visible)
               {
                  GD.displayTutorial(11);
               }
               break;
            case 5:
               transportList.update(GD.Caravans[0].Transport);
               break;
            case 6:
               setCartsAnimalsList();
               setCartsCartsList();
               break;
            case 7:
               setPassengersTransportList();
               setPassengersPassengersList();
               break;
            case 8:
               setCargoList();
               if(visible)
               {
                  GD.displayTutorial(15);
               }
               break;
            case 9:
               updateWorkshop();
               if(visible)
               {
                  GD.displayTutorial(16);
               }
         }
      }
      
      public function unsetCat() : *
      {
         D.FGMask.removeChild(categoriesMask[category]);
         D.removeChild(categoriesNormal[category]);
      }
      
      private function updateData() : *
      {
         var _loc13_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc12_:* = undefined;
         var _loc7_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc9_:* = 0;
         var _loc8_:* = 0;
         updateBottomLine();
         var _loc16_:* = category;
         if(0 === _loc16_)
         {
            for(_loc3_ in GD.Caravans[0].People)
            {
               switch(GD.Caravans[0].People[_loc3_].category)
               {
                  case 1:
                     _loc7_++;
                     break;
                  case 2:
                     _loc5_++;
                     _loc10_ += GD.Caravans[0].People[_loc3_].salary;
                     break;
                  case 3:
                     _loc6_++;
                     break;
                  case 4:
                     _loc1_++;
                     break;
                  default:
                     _loc2_++;
               }
            }
            for(_loc3_ in GD.Caravans[0].Transport)
            {
               switch(GD.Caravans[0].Transport[_loc3_].category)
               {
                  case 1:
                     _loc11_++;
                     break;
                  case 2:
                     _loc9_++;
                     break;
                  case 3:
                     _loc8_++;
               }
            }
            if(GD.Caravans[0].moving)
            {
               _loc13_ = Texts.fetch(918).toUpperCase();
            }
            else
            {
               _loc13_ = Texts.fetch(919).toUpperCase();
            }
            updateOverviewValue("totalMen",Texts.fetch(904).toUpperCase(),MathFunctions.NumberFormat(GD.Caravans[0].People.length,0));
            updateOverviewValue("volunteers",Texts.fetch(905).toUpperCase(),MathFunctions.NumberFormat(_loc7_,0));
            updateOverviewValue("mercenaries",Texts.fetch(906).toUpperCase(),MathFunctions.NumberFormat(_loc5_,0));
            updateOverviewValue("prisoners",Texts.fetch(907).toUpperCase(),MathFunctions.NumberFormat(_loc6_,0));
            updateOverviewValue("slaves",Texts.fetch(908).toUpperCase(),MathFunctions.NumberFormat(_loc1_,0));
            updateOverviewValue("other",Texts.fetch(909).toUpperCase(),MathFunctions.NumberFormat(_loc2_,0));
            updateOverviewValue("averageMorale",Texts.fetch(910).toUpperCase(),MathFunctions.NumberFormat(GD.Caravans[0].morale,0));
            updateOverviewValue("totalSalary",Texts.fetch(911).toUpperCase(),MathFunctions.NumberFormat(_loc10_,0));
            updateOverviewValue("animals",Texts.fetch(912).toUpperCase(),MathFunctions.NumberFormat(_loc11_,0));
            updateOverviewValue("carts",Texts.fetch(913).toUpperCase(),MathFunctions.NumberFormat(_loc9_,0));
            updateOverviewValue("cars",Texts.fetch(914).toUpperCase(),MathFunctions.NumberFormat(_loc8_,0));
            updateOverviewValue("maxCapacity",Texts.fetch(26).toUpperCase(),MathFunctions.NumberFormat(GD.Caravans[0].maxCargo,0));
            updateOverviewValue("availableCapacity",Texts.fetch(915).toUpperCase(),MathFunctions.NumberFormat(GD.Caravans[0].maxCargo - GD.Caravans[0].totalCargo,0));
            updateOverviewValue("maxSpeed",Texts.fetch(916).toUpperCase(),Math.round(GD.Caravans[0].speed * 10) / 10);
            updateOverviewValue("moving",Texts.fetch(4).toUpperCase(),_loc13_);
            updateOverviewValue("visibility",Texts.fetch(917).toUpperCase(),MathFunctions.NumberFormat(GD.Caravans[0].noticeability,0));
            _loc4_ = GD.Caravans[0].getConsumptionProduction();
            _loc12_ = 0;
            for(_loc3_ in GD.Caravans[0].Cargo)
            {
               if(GD.Caravans[0].Cargo[_loc3_].itemData.food)
               {
                  _loc12_ += GD.Caravans[0].Cargo[_loc3_].itemData.waterPercentage * GD.Caravans[0].Cargo[_loc3_].amount * GD.Caravans[0].Cargo[_loc3_].weightPerUnit;
               }
            }
            foodAvailable.text = MathFunctions.NumberFormat(GD.Caravans[0].food,0) + " " + Texts.fetch(939);
            waterAvailable.text = MathFunctions.NumberFormat(GD.Caravans[0].water,0) + "+" + MathFunctions.NumberFormat(_loc12_,0) + " " + Texts.fetch(11);
            forageAvailable.text = MathFunctions.NumberFormat(GD.Caravans[0].forage,0) + " " + Texts.fetch(12);
            medsAvailable.text = MathFunctions.NumberFormat(GD.Caravans[0].meds,0) + " " + Texts.fetch(13);
            fuelAvailable.text = MathFunctions.NumberFormat(GD.Caravans[0].fuel,0) + " " + Texts.fetch(11);
            electricityAvailable.text = MathFunctions.NumberFormat(_loc4_.electricityProduction - _loc4_.electricityConsumption,0) + " " + Texts.fetch(940);
            foodProduced.text = MathFunctions.NumberFormat(_loc4_.foodProduction,0) + " " + Texts.fetch(939) + "/" + Texts.fetch(941);
            waterProduced.text = "0";
            forageProduced.text = "0 " + Texts.fetch(12) + "/" + Texts.fetch(941);
            medsProduced.text = "0 " + Texts.fetch(13) + "/" + Texts.fetch(941);
            fuelProduced.text = "0 " + Texts.fetch(11) + "/" + Texts.fetch(941);
            electricityProduced.text = MathFunctions.NumberFormat(_loc4_.electricityProduction,0) + " " + Texts.fetch(940);
            for(_loc3_ in _loc4_.production)
            {
               if(_loc4_.production[_loc3_].item == 1)
               {
                  waterProduced.text = MathFunctions.NumberFormat(_loc4_.production[_loc3_].amount,0);
               }
               if(_loc4_.production[_loc3_].item == 62)
               {
                  forageProduced.text = MathFunctions.NumberFormat(_loc4_.production[_loc3_].amount,0) + " " + Texts.fetch(12) + "/" + Texts.fetch(941);
               }
               if(_loc4_.production[_loc3_].item == 63)
               {
                  forageProduced.text = MathFunctions.NumberFormat(_loc4_.produntion[_loc3_].amount,0) + " " + Texts.fetch(12) + "/" + Texts.fetch(941);
               }
               if(_loc4_.production[_loc3_].item == 64)
               {
                  fuelProduced.text = MathFunctions.NumberFormat(_loc4_.production[_loc3_].amount,0) + " " + Texts.fetch(11) + "/" + Texts.fetch(941);
               }
            }
            waterProduced.text += "+" + Math.round(_loc4_.waterInFood * 10) / 10 + " " + Texts.fetch(11) + "/" + Texts.fetch(941);
            foodConsumed.text = MathFunctions.NumberFormat(_loc4_.foodConsumption,0) + " " + Texts.fetch(939) + "/" + Texts.fetch(941);
            waterConsumed.text = "0 " + Texts.fetch(11) + "/" + Texts.fetch(941);
            forageConsumed.text = "0 " + Texts.fetch(12) + "/" + Texts.fetch(941);
            medsConsumed.text = "0 " + Texts.fetch(13) + "/" + Texts.fetch(941);
            fuelConsumed.text = "0 " + Texts.fetch(11) + "/" + Texts.fetch(941);
            electricityConsumed.text = MathFunctions.NumberFormat(_loc4_.electricityConsumption,0) + " " + Texts.fetch(940);
            for(_loc3_ in _loc4_.consumption)
            {
               if(_loc4_.consumption[_loc3_].item == 1)
               {
                  waterConsumed.text = MathFunctions.NumberFormat(_loc4_.consumption[_loc3_].amount,0) + " " + Texts.fetch(11) + "/" + Texts.fetch(941);
               }
               if(_loc4_.consumption[_loc3_].item == 62)
               {
                  forageConsumed.text = MathFunctions.NumberFormat(_loc4_.consumption[_loc3_].amount,0) + " " + Texts.fetch(12) + "/" + Texts.fetch(941);
               }
               if(_loc4_.consumption[_loc3_].item == 63)
               {
                  medsConsumed.text = MathFunctions.NumberFormat(_loc4_.consumption[_loc3_].amount,0) + " " + Texts.fetch(13) + "/" + Texts.fetch(941);
               }
               if(_loc4_.consumption[_loc3_].item == 64)
               {
                  fuelConsumed.text = MathFunctions.NumberFormat(_loc4_.consumption[_loc3_].amount,0) + " " + Texts.fetch(11) + "/" + Texts.fetch(941);
               }
            }
            fuelConsumed.text += " + " + MathFunctions.NumberFormat(_loc4_.fuelPer100Km,0) + " " + Texts.fetch(11) + "/100" + Texts.fetch(943);
         }
      }
      
      private function updateOverviewValue(param1:*, param2:*, param3:*, param4:* = 200) : *
      {
         var _loc6_:* = undefined;
         this[param1 + "Value"].text = param3;
         var _loc5_:Number = param4 - this[param1 + "Value"].textWidth - 30;
         this[param1 + "Title"].text = "";
         _loc6_ = 0;
         while(_loc6_ < param2.length)
         {
            this[param1 + "Title"].text += param2.charAt(_loc6_);
            if(this[param1 + "Title"].textWidth > _loc5_ && _loc6_ != param2.length - 1)
            {
               this[param1 + "Title"].text = this[param1 + "Title"].text.substring(0,this[param1 + "Title"].text.length - 1) + ".";
               break;
            }
            _loc6_++;
         }
         this[param1 + "Title"].text += ":";
      }
      
      private function updateBottomLine() : *
      {
         bottomLineCapacity.text = Texts.fetch(903).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].totalCargo,0) + "/" + MathFunctions.NumberFormat(GD.Caravans[0].maxCargo,0) + " " + Texts.fetch(12).toUpperCase();
         bottomLinemoney.text = Texts.fetch(20).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].money,2);
         var _loc1_:* = GD.makeDate();
         bottomLineDate.text = _loc1_.Day2d + "-" + _loc1_.ShortMonthName + "-" + _loc1_.Year2d + " " + _loc1_.Hour2d + ":" + _loc1_.Minute2d;
         var _loc2_:Number = 640 - bottomLineCapacity.textWidth - bottomLineDate.textWidth;
         bottomLinemoney.x = 10 + bottomLineCapacity.textWidth + _loc2_ / 2 - bottomLinemoney.textWidth / 2;
      }
      
      private function distributeWeaponsAndAmmoFunction() : *
      {
         GD.Caravans[0].distributeWeapons();
         GD.Caravans[0].distributeAmmo();
         updateData();
      }
      
      private function distributeAmmoOnlyFunction() : *
      {
         GD.Caravans[0].distributeAmmo();
         updateData();
      }
      
      private function distributeArmorFunction() : *
      {
         GD.Caravans[0].distributeArmor();
         updateData();
      }
      
      private function distributeCartsFunction() : *
      {
         GD.Caravans[0].distributeTransport();
         updateData();
      }
      
      private function distributePassengersFunction() : *
      {
         GD.Caravans[0].distributePassengers();
         updateData();
      }
      
      private function distributeNoPassengersFunction() : *
      {
         GD.Caravans[0].removeAllPassengers();
         updateData();
      }
      
      private function seeSkillsFunction() : *
      {
         skillsWindow.visible = true;
      }
      
      private function closeSkillsWindow() : *
      {
         skillsWindow.visible = false;
      }
      
      private function drawConcaveRect(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         param1.graphics.lineStyle(1,16777215,0.3);
         param1.graphics.moveTo(param2,param3 + param5);
         param1.graphics.lineTo(param2 + param4,param3 + param5);
         param1.graphics.lineTo(param2 + param4,param3);
         param1.graphics.lineStyle(1,0,0.6);
         param1.graphics.lineTo(param2,param3);
         param1.graphics.lineTo(param2,param3 + param5);
         param1.graphics.lineStyle(0,0,0);
      }
      
      public function cursorControl(param1:*) : *
      {
         var _loc22_:* = undefined;
         var _loc8_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc21_:* = undefined;
         var _loc10_:* = undefined;
         var _loc3_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc14_:* = undefined;
         var _loc19_:* = undefined;
         var _loc12_:* = undefined;
         var _loc20_:* = undefined;
         var _loc11_:* = undefined;
         if(stopped || GD.tutorialOn)
         {
            return;
         }
         var _loc4_:* = null;
         var _loc23_:* = 0;
         var _loc16_:* = 0;
         var _loc15_:Array = [];
         var _loc13_:Array = [];
         var _loc7_:Array = [];
         var _loc9_:* = 3;
         switch(category)
         {
            case 2:
               if(mouseX >= 290 && mouseX <= 540 && selectedCrewMember is Character)
               {
                  if(mouseY >= 152 && mouseY < 172)
                  {
                     if(selectedCrewMember.physical != selectedCrewMember.basePhysical)
                     {
                        _loc5_ = selectedCrewMember.physicalLossReasons;
                     }
                  }
                  if(mouseY >= 172 && mouseY < 192)
                  {
                     if(selectedCrewMember.agility != selectedCrewMember.baseAgility)
                     {
                        _loc5_ = selectedCrewMember.agilityLossReasons;
                     }
                  }
                  if(mouseY >= 192 && mouseY < 212)
                  {
                     if(selectedCrewMember.accuracy != selectedCrewMember.baseAccuracy)
                     {
                        _loc5_ = selectedCrewMember.accuracyLossReasons;
                     }
                  }
                  if(mouseY >= 212 && mouseY < 232)
                  {
                     if(selectedCrewMember.intelligence != selectedCrewMember.baseIntelligence)
                     {
                        _loc5_ = selectedCrewMember.intelligenceLossReasons;
                     }
                  }
                  if(_loc5_ is Array && _loc5_.length > 0)
                  {
                     _loc15_.push(new EngineText(Texts.fetch(1551).toUpperCase() + ":",3156000,14,"center",10,5,300,20));
                     for(_loc8_ in _loc5_)
                     {
                        _loc15_.push(new EngineText(Texts.fetch(_loc5_[_loc8_]),3156000,14,"center",10,5 + (_loc8_ + 1) * 20,300,20));
                     }
                     _loc23_ = 0 - Infinity;
                     for(_loc8_ in _loc15_)
                     {
                        _loc22_ = _loc15_[_loc8_].textWidth + 20;
                        if(_loc22_ > _loc23_)
                        {
                           _loc23_ = _loc22_;
                        }
                     }
                     for(_loc8_ in _loc15_)
                     {
                        _loc15_[_loc8_].width = _loc23_;
                     }
                  }
               }
               break;
            case 3:
               if(!(selectedEquipmentPerson is Character))
               {
                  return false;
               }
               for(_loc8_ in equipmentSlots)
               {
                  if(equipmentSlots[_loc8_].pic.hitTestPoint(mouseX,mouseY,false))
                  {
                     _loc4_ = _loc8_;
                     break;
                  }
               }
               _loc6_ = [];
               if(_loc4_ == 8)
               {
                  if(mouseX > equipmentSlots[8].pic.x + 20 && mouseY < equipmentSlots[8].pic.y + 65)
                  {
                     for(_loc8_ in equipmentList.finalList)
                     {
                        if(equipmentList.finalList[_loc8_].pic.hitTestPoint(mouseX,mouseY,false))
                        {
                           _loc6_ = equipmentList.finalList[_loc8_].item.getInfoPairs();
                        }
                     }
                  }
               }
               else if(_loc4_ != null)
               {
                  _loc21_ = getSlotItemData(_loc4_);
                  if(_loc21_.subCategory > 0)
                  {
                     _loc6_ = new Item(Item.itemNumFromCatSubCat(_loc21_.category,_loc21_.subCategory),1).getInfoPairs();
                  }
               }
               if(_loc6_.length > 0)
               {
                  for(_loc8_ in _loc6_)
                  {
                     if(_loc6_[_loc8_].key == "modesTitle" || _loc6_[_loc8_].key == "description")
                     {
                        _loc9_ += 10;
                     }
                     if(_loc6_[_loc8_].value == undefined)
                     {
                        _loc13_[_loc8_] = new EngineText(_loc6_[_loc8_].name,3156000,12,"center",10,_loc9_,880,15,_loc6_[_loc8_].multiline,_loc6_[_loc8_].multiline);
                        _loc22_ = _loc13_[_loc8_].textWidth + 5;
                     }
                     else
                     {
                        _loc13_[_loc8_] = new EngineText(_loc6_[_loc8_].name + ":",3156000,12,"left",10,_loc9_,880,15);
                        _loc7_[_loc8_] = new EngineText(_loc6_[_loc8_].value,3156000,12,"right",10,_loc9_,880,15);
                        _loc22_ = _loc13_[_loc8_].textWidth + _loc7_[_loc8_].textWidth + 20 + 5;
                     }
                     _loc9_ += 15;
                     if(_loc6_[_loc8_].key == "name" || _loc6_[_loc8_].key == "weight")
                     {
                        _loc9_ += 10;
                     }
                     if(_loc22_ > _loc23_ && !_loc6_[_loc8_].multiline)
                     {
                        _loc23_ = _loc22_;
                     }
                  }
                  var _loc2_:Array = [];
                  if(_loc15_.length > 0 || _loc13_.length > 0)
                  {
                     _loc9_ += 10;
                     if(_loc4_ == 8)
                     {
                        _loc2_.push(new EngineText(Texts.fetch(1091).toUpperCase(),3156000,12,"center",10,_loc9_,880,15));
                     }
                     else
                     {
                        if(equipmentSlots[_loc4_].pic.useHandCursor && _loc4_ != selectedEquipmentSlot)
                        {
                           _loc2_.push(new EngineText(Texts.fetch(1073).toUpperCase(),3156000,12,"center",10,_loc9_,880,15));
                           _loc9_ += 15;
                        }
                        _loc2_.push(new EngineText(Texts.fetch(1074).toUpperCase(),3156000,12,"center",10,_loc9_,880,15));
                     }
                  }
                  for(_loc8_ in _loc2_)
                  {
                     if(_loc2_[_loc8_].textWidth + 5 > _loc23_)
                     {
                        _loc23_ = _loc2_[_loc8_].textWidth + 5;
                     }
                  }
                  for(_loc8_ in _loc2_)
                  {
                     _loc2_[_loc8_].width = _loc23_;
                  }
                  _loc3_ = 0;
                  for(_loc8_ in _loc13_)
                  {
                     _loc13_[_loc8_].width = _loc23_;
                     if(_loc6_[_loc8_].multiline)
                     {
                        _loc13_[_loc8_].height = _loc13_[_loc8_].textHeight + 5;
                        _loc9_ += _loc13_[_loc8_].textHeight - 5;
                        _loc3_ += _loc13_[_loc8_].textHeight - 5;
                        _loc10_ = _loc8_ + 1;
                        while(_loc10_ < _loc13_.length)
                        {
                           _loc13_[_loc10_].y += _loc13_[_loc8_].height - 10;
                           if(_loc7_[_loc10_] is TextField)
                           {
                              _loc7_[_loc10_].y = _loc13_[_loc10_].y;
                           }
                           _loc10_++;
                        }
                     }
                     _loc15_.push(_loc13_[_loc8_]);
                     if(_loc7_[_loc8_] is TextField)
                     {
                        _loc7_[_loc8_].width = _loc23_;
                        _loc15_.push(_loc7_[_loc8_]);
                     }
                  }
                  for(_loc8_ in _loc2_)
                  {
                     _loc2_[_loc8_].y += _loc3_;
                     _loc15_.push(_loc2_[_loc8_]);
                  }
               }
               break;
            case 7:
               if(mouseX >= 120 && mouseX <= 540 && mouseY >= 172 && mouseY <= 292)
               {
                  _loc17_ = Math.floor((passengersTransportArea.Content.mouseX - 10) / 50);
                  _loc18_ = Math.floor((passengersTransportArea.Content.mouseY - 10) / 60);
                  if(_loc17_ < 0 || _loc17_ > 7 || (passengersTransportArea.Content.mouseX - 10) % 50 > 40)
                  {
                     _loc17_ = null;
                  }
                  if(_loc18_ < 0 || (passengersTransportArea.Content.mouseY - 10) % 60 > 40)
                  {
                     _loc18_ = null;
                  }
                  if(_loc17_ != null && _loc18_ != null)
                  {
                     _loc14_ = _loc18_ * 8 + _loc17_;
                     _loc19_ = [];
                     if(passengersSelectedTransport is TransportUnit && _loc14_ < passengersSelectedTransport.Passengers.length)
                     {
                        if(passengersSelectedTransport.Passengers[_loc14_] is Character)
                        {
                           _loc19_ = [["health",50],["speed",6],["capacity",1155],["passengerSpaces",1186],["weight",996]];
                        }
                        if(passengersSelectedTransport.Passengers[_loc14_] is TransportUnit)
                        {
                           if(passengersSelectedTransport.Passengers[_loc14_].category == 1)
                           {
                              _loc19_ = [["health",50],["speed",6],["capacity",1155],["maxPassengers",899],["passengerSpaces",1186],["weight",996]];
                           }
                           if(passengersSelectedTransport.Passengers[_loc14_].category == 2)
                           {
                              _loc19_ = [["health",1153],["capacity",1155],["maxPassengers",899],["passengerSpaces",1186],["weight",996]];
                           }
                           if(passengersSelectedTransport.Passengers[_loc14_].category == 3)
                           {
                              _loc19_ = [["health",1153],["speed",6],["capacity",1155],["maxPassengers",899],["passengerSpaces",1186],["weight",996]];
                           }
                        }
                        _loc13_ = [];
                        _loc7_ = [];
                        _loc23_ = 0;
                        for(_loc8_ in _loc19_)
                        {
                           _loc13_.push(new EngineText(Texts.fetch(_loc19_[_loc8_][1]).toUpperCase(),3156000,12,"left",10,25 + _loc8_ * 15,880,15));
                           if(_loc19_[_loc8_][0] == "health")
                           {
                              _loc7_.push(new EngineText(Math.round(passengersSelectedTransport.Passengers[_loc14_].health) + "/" + Math.round(passengersSelectedTransport.Passengers[_loc14_].maxHealth),3156000,12,"right",10,25 + _loc8_ * 15,880,15));
                           }
                           else if(_loc19_[_loc8_][0] == "speed")
                           {
                              _loc7_.push(new EngineText(MathFunctions.NumberFormat(passengersSelectedTransport.Passengers[_loc14_][_loc19_[_loc8_][0]],1,true),3156000,12,"right",10,25 + _loc8_ * 15,880,15));
                           }
                           else
                           {
                              _loc7_.push(new EngineText(Math.round(passengersSelectedTransport.Passengers[_loc14_][_loc19_[_loc8_][0]]),3156000,12,"right",10,25 + _loc8_ * 15,880,15));
                           }
                           _loc22_ = _loc13_[_loc13_.length - 1].textWidth + _loc7_[_loc7_.length - 1].textWidth + 15;
                           if(_loc22_ > _loc23_)
                           {
                              _loc23_ = _loc22_;
                           }
                        }
                        for(_loc8_ in _loc13_)
                        {
                           _loc13_[_loc8_].width = _loc23_;
                           _loc7_[_loc8_].width = _loc23_;
                        }
                        _loc15_.push(new EngineText(passengersSelectedTransport.Passengers[_loc14_].name.toUpperCase(),3156000,12,"center",10,5,_loc23_,15));
                        for(_loc8_ in _loc13_)
                        {
                           _loc15_.push(_loc13_[_loc8_]);
                           _loc15_.push(_loc7_[_loc8_]);
                        }
                        _loc15_.push(new EngineText(Texts.fetch(1091).toUpperCase(),3156000,12,"center",10,_loc13_.length * 15 + 30,_loc23_,15));
                     }
                  }
               }
               break;
            case 9:
               if(!ConfirmDialogue.visible && !calculator.visible)
               {
                  for(_loc8_ in workshopItems)
                  {
                     workshopItems[_loc8_].lightBG.visible = false;
                  }
                  if(mouseX >= 20 && mouseY >= 10 && mouseX <= 630 && mouseY <= 460)
                  {
                     _loc12_ = Math.floor((workshopArea.mouseY - 10) / 110);
                     if(_loc12_ >= 0 && workshopArea.Content.mouseY - _loc12_ * 110 - 10 <= 100 && _loc12_ < workshopItems.length && workshopItems[_loc12_].canProduce)
                     {
                        workshopItems[_loc12_].lightBG.visible = true;
                     }
                  }
               }
         }
         if(manageContainers.disp.visible && !calculator.visible && !ConfirmDialogue.visible)
         {
            manageContainers.dragSymbol.visible = manageContainers.dragging;
            for(_loc8_ in manageContainers.liquids)
            {
               manageContainers.liquids[_loc8_].light.visible = false;
            }
            manageContainers.availableLight.visible = false;
            manageContainers.prohibitedLight.visible = false;
            manageContainers.draggingOver = null;
            if(manageContainers.dragging)
            {
               manageContainers.dragSymbol.x = manageContainers.disp.mouseX - manageContainers.mouseShiftX;
               manageContainers.dragSymbol.y = manageContainers.disp.mouseY - manageContainers.mouseShiftY;
               if(manageContainers.D.mouseX >= 20 && manageContainers.D.mouseX <= 570 && manageContainers.D.mouseY >= 270 && manageContainers.D.mouseY <= 330 && manageContainers.dragFromType != 0)
               {
                  manageContainers.availableLight.visible = true;
                  manageContainers.draggingOver = 0;
               }
               if(manageContainers.D.mouseX >= 20 && manageContainers.D.mouseX <= 570 && manageContainers.D.mouseY >= 350 && manageContainers.D.mouseY <= 410 && manageContainers.dragFromType != -1)
               {
                  manageContainers.prohibitedLight.visible = true;
                  manageContainers.draggingOver = -1;
               }
               if(manageContainers.D.mouseX >= 10 && manageContainers.D.mouseX <= 580 && manageContainers.D.mouseY >= 10 && manageContainers.D.mouseY <= 260)
               {
                  _loc20_ = Math.floor(manageContainers.liquidsArea.Content.mouseY / 80);
                  if(_loc20_ >= 0 && _loc20_ < manageContainers.liquids.length && manageContainers.liquids[_loc20_].type != manageContainers.dragFromType)
                  {
                     manageContainers.liquids[_loc20_].light.visible = true;
                     manageContainers.draggingOver = manageContainers.liquids[_loc20_].type;
                  }
               }
            }
            else
            {
               manageContainers.overContainer = null;
               manageContainers.overType = null;
               if(manageContainers.D.mouseX >= 200 && manageContainers.D.mouseX <= 560)
               {
                  if(manageContainers.D.mouseY >= 10 && manageContainers.D.mouseY <= 260)
                  {
                     _loc20_ = Math.floor(manageContainers.liquidsArea.Content.mouseY / 80);
                     if(_loc20_ < manageContainers.liquids.length)
                     {
                        manageContainers.overType = manageContainers.liquids[_loc20_].type;
                        if(manageContainers.liquids[_loc20_].containersArea.Content.mouseY >= 10 && manageContainers.liquids[_loc20_].containersArea.Content.mouseY <= 40 && (manageContainers.liquids[_loc20_].containersArea.Content.mouseX - 10) % 40 <= 30)
                        {
                           manageContainers.overContainer = Math.floor((manageContainers.liquids[_loc20_].containersArea.Content.mouseX - 10) / 40);
                           if(manageContainers.overContainer >= 0 && GD.Caravans[0].liquidsContainers[manageContainers.liquids[_loc20_].type] is Array && manageContainers.overContainer < GD.Caravans[0].liquidsContainers[manageContainers.liquids[_loc20_].type].length)
                           {
                              _loc11_ = new Item(GD.Caravans[0].liquidsContainers[manageContainers.liquids[_loc20_].type][manageContainers.overContainer].type,1);
                           }
                        }
                     }
                  }
                  if(manageContainers.D.mouseY >= 270 && manageContainers.D.mouseY <= 330)
                  {
                     if(manageContainers.availableArea.Content.mouseY >= 10 && manageContainers.availableArea.Content.mouseY <= 40 && (manageContainers.availableArea.Content.mouseX - 10) % 40 <= 30)
                     {
                        manageContainers.overType = 0;
                        manageContainers.overContainer = Math.floor((manageContainers.availableArea.Content.mouseX - 10) / 40);
                        if(manageContainers.overContainer >= 0 && GD.Caravans[0].liquidsContainers[0] is Array && manageContainers.overContainer < GD.Caravans[0].liquidsContainers[0].length)
                        {
                           _loc11_ = new Item(GD.Caravans[0].liquidsContainers[0][manageContainers.overContainer].type,1);
                        }
                     }
                  }
                  if(manageContainers.D.mouseY >= 350 && manageContainers.D.mouseY <= 410)
                  {
                     if(manageContainers.prohibitedArea.Content.mouseY >= 10 && manageContainers.prohibitedArea.Content.mouseY <= 40 && (manageContainers.prohibitedArea.Content.mouseX - 10) % 40 <= 30)
                     {
                        manageContainers.overType = -1;
                        manageContainers.overContainer = Math.floor((manageContainers.prohibitedArea.Content.mouseX - 10) / 40);
                        if(manageContainers.overContainer >= 0 && GD.Caravans[0].liquidsContainers[-1] is Array && manageContainers.overContainer < GD.Caravans[0].liquidsContainers[-1].length)
                        {
                           _loc11_ = new Item(GD.Caravans[0].liquidsContainers[-1][manageContainers.overContainer].type,1);
                        }
                     }
                  }
                  if(_loc11_ is Item)
                  {
                     _loc15_.push(new EngineText(_loc11_.name.toUpperCase(),3156000,12,"center",10,5,800,15));
                     _loc15_.push(new EngineText(Texts.fetch(1219).toUpperCase() + ": " + _loc11_.itemData.volume + Texts.fetch(11),3156000,12,"center",10,30,800,15));
                     if(manageContainers.overType == -1)
                     {
                        _loc15_.push(new EngineText(Texts.fetch(1228).toUpperCase(),3156000,12,"center",10,55,800,15));
                     }
                     else
                     {
                        _loc15_.push(new EngineText(Texts.fetch(1227).toUpperCase(),3156000,12,"center",10,55,800,15));
                     }
                     _loc15_[0].width = _loc15_[1].width = _loc15_[2].width = Math.max(_loc15_[0].textWidth,_loc15_[1].textWidth,_loc15_[2].textWidth) + 20;
                  }
               }
            }
         }
         if(_loc15_.length > 0 && cursorInfo.alpha < 1)
         {
            cursorInfo.alpha += 0.2;
         }
         if(_loc15_.length == 0)
         {
            cursorInfo.alpha = 0;
         }
         cursorInfo.visible = !calculator.visible && _loc15_.length > 0;
         if(cursorInfo.visible)
         {
            while(cursorInfo.numChildren > 0)
            {
               cursorInfo.removeChild(cursorInfo.getChildAt(0));
            }
            _loc23_ = 0;
            _loc16_ = 0;
            for(_loc8_ in _loc15_)
            {
               cursorInfo.addChild(_loc15_[_loc8_]);
               if(_loc15_[_loc8_].x + _loc15_[_loc8_].width > _loc23_)
               {
                  _loc23_ = _loc15_[_loc8_].x + _loc15_[_loc8_].width;
               }
               if(_loc15_[_loc8_].y + _loc15_[_loc8_].height > _loc16_)
               {
                  _loc16_ = _loc15_[_loc8_].y + _loc15_[_loc8_].height;
               }
            }
            cursorInfo.graphics.clear();
            cursorInfo.graphics.lineStyle(1,3156000);
            cursorInfo.graphics.beginFill(12631208);
            cursorInfo.graphics.drawRect(0,0,_loc23_ + 10,_loc16_ + 5);
            cursorInfo.graphics.endFill();
            cursorInfo.x = mouseX + 20;
            cursorInfo.y = mouseY + 10;
            if(cursorInfo.y + _loc16_ + 5 > 490)
            {
               cursorInfo.y = 490 - _loc16_ - 5;
            }
            if(cursorInfo.x + _loc23_ + 5 > 875)
            {
               cursorInfo.x = mouseX - _loc23_ - 10;
            }
         }
      }
      
      public function releaseButton(param1:*) : *
      {
         var e:* = param1;
         if(stopped || GD.tutorialOn)
         {
            return;
         }
         if(manageContainers.disp.visible && !calculator.visible && !ConfirmDialogue.visible && manageContainers.dragging && manageContainers.draggingOver != null)
         {
            if(manageContainers.draggingOver == -1)
            {
               ConfirmDialogue.setText(Texts.fetch(1221).toUpperCase());
               ConfirmDialogue.onApprove = function():*
               {
                  var _loc2_:* = undefined;
                  var _loc1_:* = undefined;
                  _loc2_ = GD.Caravans[0].liquidsContainers[manageContainers.dragFromType][manageContainers.dragFromContainer].type;
                  for(_loc1_ in GD.Caravans[0].liquidsContainers)
                  {
                     if(_loc1_ != -1)
                     {
                        GD.Caravans[0].moveLiquidsContainer(_loc2_,Infinity,_loc1_,-1);
                        manageContainers.changes = true;
                     }
                  }
                  updateManageContainers();
               };
               ConfirmDialogue.visible = true;
            }
            else if(GD.Caravans[0].liquidsContainers[manageContainers.dragFromType][manageContainers.dragFromContainer].amount == 1)
            {
               GD.Caravans[0].moveLiquidsContainer(GD.Caravans[0].liquidsContainers[manageContainers.dragFromType][manageContainers.dragFromContainer].type,1,manageContainers.dragFromType,manageContainers.draggingOver);
               manageContainers.changes = true;
               updateManageContainers();
            }
            else
            {
               calculator.min = 1;
               calculator.max = GD.Caravans[0].liquidsContainers[manageContainers.dragFromType][manageContainers.dragFromContainer].amount;
               calculator.visible = true;
               calculator.setValue(1);
               calculator.info.text = Texts.fetch(1220).toUpperCase();
               calculator.onDone = function(param1:*):*
               {
                  GD.Caravans[0].moveLiquidsContainer(GD.Caravans[0].liquidsContainers[manageContainers.dragFromType][manageContainers.dragFromContainer].type,param1,manageContainers.dragFromType,manageContainers.draggingOver);
                  manageContainers.changes = true;
                  updateManageContainers();
               };
            }
         }
         manageContainers.dragging = false;
      }
      
      public function clickOnLogBookmark(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in logBookmarks)
         {
            if(logBookmarks[_loc2_].disp == param1.target)
            {
               if(GameData.soundFXOn && currLogCategory != _loc2_)
               {
                  new SFXPage().play();
               }
               currLogCategory = _loc2_;
               break;
            }
         }
         updateLog();
      }
      
      public function fillListWithMissions(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = 10;
         var _loc6_:Array = [];
         param1.clearAll();
         for(_loc5_ in param2)
         {
            _loc3_ = _loc6_.push(new EngineText(Texts.fetch(GameData.missionDescriptions[param2[_loc5_]],GD.Caravans[0].People[0].gender),0,14,"left",10,_loc4_,param1.currWidth - 20,500,true,true)) - 1;
            if(param2[_loc5_] == 40 || param2[_loc5_] == 43)
            {
               _loc6_[_loc3_].text = _loc6_[_loc3_].text.replace("@town1@",GD.Towns[GD.Story.qgMissionTown1].name).replace("@town2@",GD.Towns[GD.Story.qgMissionTown2].name);
            }
            if(param2[_loc5_] == 41 || param2[_loc5_] == 42 || param2[_loc5_] == 44 || param2[_loc5_] == 45 || param2[_loc5_] == 46 || param2[_loc5_] == 47)
            {
               _loc6_[_loc3_].text = _loc6_[_loc3_].text.replace("@townname@",GD.Towns[GD.Story.qgMissionTown1].name);
            }
            if(param2[_loc5_] == 44)
            {
               _loc6_[_loc3_].text = _loc6_[_loc3_].text.replace("@grams@",GD.Story.qgMissionAmount + Texts.fetch(13));
            }
            if(param2[_loc5_] == 45)
            {
               _loc6_[_loc3_].text = _loc6_[_loc3_].text.replace("@kilograms@",GD.Story.qgMissionAmount + Texts.fetch(12));
            }
            _loc6_[_loc3_].height = _loc6_[_loc3_].textHeight + 20;
            param1.addContent(_loc6_[_loc3_],null,null,null,null,true);
            _loc4_ += _loc6_[_loc3_].textHeight + 20;
         }
         param1.updateSize();
      }
      
      public function updateLog() : *
      {
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         var _loc6_:* = undefined;
         logFG.graphics.clear();
         logFG.graphics.beginBitmapFill(new ImportedBitmap("TownBG.jpg").bitmapData);
         logFG.graphics.lineStyle(1,1512976);
         logFG.graphics.moveTo(0,30);
         logFG.graphics.lineTo(currLogCategory * (logBookmarkWidth + 5),30);
         logFG.graphics.lineTo(currLogCategory * (logBookmarkWidth + 5),0);
         logFG.graphics.lineTo(currLogCategory * (logBookmarkWidth + 5) + logBookmarkWidth,0);
         logFG.graphics.lineTo(currLogCategory * (logBookmarkWidth + 5) + logBookmarkWidth,30);
         logFG.graphics.lineTo(640,30);
         logFG.graphics.lineTo(640,450);
         logFG.graphics.lineTo(0,450);
         logFG.graphics.endFill();
         for(_loc5_ in logBookmarks)
         {
            logBookmarks[_loc5_].disp.visible = _loc5_ != currLogCategory;
         }
         for(_loc5_ in logPages)
         {
            logPages[_loc5_].disp.visible = _loc5_ == currLogCategory;
         }
         logCurrName.x = currLogCategory * (logBookmarkWidth + 5) + 15;
         logCurrName.text = Texts.fetch(logCategoryNames[logCategories[currLogCategory]],null,Math.floor((logBookmarkWidth - 10) / 9)).toUpperCase();
         if(economyGraph is ConsProdGraph)
         {
            economyGraph.visible = logCategories[currLogCategory] == 1;
         }
         switch(logCategories[currLogCategory])
         {
            case 1:
               economyGraph.update(GD.Caravans[0].historicalData,false);
               initKnownPrices();
               break;
            case 2:
               fillListWithMissions(logPages[currLogCategory].acceptedArea,GD.Story.acceptedQuests);
               fillListWithMissions(logPages[currLogCategory].completedArea,GD.Story.completedQuests);
               fillListWithMissions(logPages[currLogCategory].failedArea,GD.Story.failedQuests);
               break;
            case 3:
               logPages[currLogCategory].mainArea.clearAll();
               _loc4_ = 10;
               for(_loc5_ in GD.Story.specificReputations)
               {
                  if(GD.Story.specificReputations[_loc5_] != undefined && GameData.reputationNames[_loc5_] != undefined && (_loc5_ == 6 || _loc5_ == 8 || GD.storyMode))
                  {
                     if(GD.Story.specificReputations[_loc5_] > 0)
                     {
                        _loc3_ = "+";
                     }
                     else
                     {
                        _loc3_ = "";
                     }
                     logPages[currLogCategory].mainArea.addContent(new EngineText(Texts.fetch(GameData.reputationNames[_loc5_],GD.Caravans[0].People[0].gender).toUpperCase() + ": " + _loc3_ + Math.round(GD.Story.specificReputations[_loc5_]),0,14,"center",10,_loc4_,600,20),null,null,null,null,true);
                     _loc4_ += 20;
                  }
               }
               if(GD.storyMode)
               {
                  _loc2_ = false;
                  for(_loc5_ in GD.Story.characterRelations)
                  {
                     if(GD.Story.characterRelations[_loc5_] != undefined && _loc5_ != 34 && _loc5_ != 35 && _loc5_ != 37)
                     {
                        _loc2_ = true;
                        break;
                     }
                  }
                  if(_loc2_)
                  {
                     _loc4_ += 20;
                     logPages[currLogCategory].mainArea.addContent(new EngineText(Texts.fetch(2187).toUpperCase() + ":",0,14,"center",10,_loc4_,600,20),null,null,null,null,true);
                     _loc4_ += 30;
                     for(_loc5_ in GD.Story.characterRelations)
                     {
                        if(GD.Story.characterRelations[_loc5_] != undefined && _loc5_ != 34 && _loc5_ != 35 && _loc5_ != 37)
                        {
                           if(GD.Story.characterRelations[_loc5_] > 0)
                           {
                              _loc3_ = "+";
                           }
                           else
                           {
                              _loc3_ = "";
                           }
                           logPages[currLogCategory].mainArea.addContent(new EngineText(Texts.fetch(Dialogues.characterNames[_loc5_]).toUpperCase() + ": " + _loc3_ + Math.round(GD.Story.characterRelations[_loc5_]),0,14,"center",10,_loc4_,600,20),null,null,null,null,true);
                           _loc4_ += 20;
                        }
                     }
                  }
               }
               _loc4_ += 20;
               var _loc1_:Boolean = false;
               _loc5_ = 1;
               while(_loc5_ < Presets.factionNames.length)
               {
                  if(GD.revealedFactions[_loc5_])
                  {
                     _loc1_ = true;
                     break;
                  }
                  _loc5_++;
               }
               if(_loc1_)
               {
                  logPages[currLogCategory].mainArea.addContent(new EngineText(Texts.fetch(2188).toUpperCase() + ":",0,14,"center",10,_loc4_,600,20),null,null,null,null,true);
                  _loc4_ += 30;
                  _loc5_ = 1;
                  while(_loc5_ < Presets.factionNames.length)
                  {
                     if(GD.revealedFactions[_loc5_])
                     {
                        _loc6_ = GD.getFactionRelations(_loc5_);
                        if(_loc6_ > 0)
                        {
                           _loc3_ = "+";
                        }
                        else
                        {
                           _loc3_ = "";
                        }
                        logPages[currLogCategory].mainArea.addContent(new EngineText(Texts.fetch(Presets.factionNames[_loc5_]).toUpperCase() + ": " + _loc3_ + Math.round(_loc6_),0,14,"center",10,_loc4_,600,20),null,null,null,null,true);
                        _loc4_ += 20;
                     }
                     _loc5_++;
                  }
               }
               logPages[currLogCategory].mainArea.updateSize();
         }
      }
      
      public function updateKnownPrices() : *
      {
         var _loc1_:* = undefined;
         knownPricesArea.listArea.clearAll();
         if(GD.knownPrices.length == 0)
         {
            knownPricesArea.listArea.updateSize();
            knownPricesArea.itemName.text = "------";
            return;
         }
         while(knownPricesInd >= knownPricesItems.length)
         {
            knownPricesInd -= knownPricesItems.length;
         }
         while(knownPricesInd < 0)
         {
            knownPricesInd += knownPricesItems.length;
         }
         knownPricesArea.itemName.text = new Item(knownPricesItems[knownPricesInd].item,1).name.toUpperCase();
         for(_loc1_ in knownPricesItems[knownPricesInd].entries)
         {
            knownPricesArea.listArea.addContent(new EngineText(GD.Towns[GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].town].name.toUpperCase() + " : " + Texts.fetch(GD.Towns[GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].town].locations[GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].location].name).toUpperCase(),16777215,14,"left",0,0,280,20),10,10 + _loc1_ * 20,null,null,true);
            if(GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].buyPrice == undefined)
            {
               knownPricesArea.listArea.addContent(new EngineText("-",16777215,14,"center",0,0,100,20),290,10 + _loc1_ * 20,null,null,true);
            }
            else
            {
               knownPricesArea.listArea.addContent(new EngineText(MathFunctions.NumberFormat(GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].buyPrice,2),16777215,14,"center",0,0,100,20),290,10 + _loc1_ * 20,null,null,true);
            }
            if(GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].sellPrice == undefined)
            {
               knownPricesArea.listArea.addContent(new EngineText("-",16777215,14,"center",0,0,100,20),390,10 + _loc1_ * 20,null,null,true);
            }
            else
            {
               knownPricesArea.listArea.addContent(new EngineText(MathFunctions.NumberFormat(GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].sellPrice,2),16777215,14,"center",0,0,100,20),390,10 + _loc1_ * 20,null,null,true);
            }
            knownPricesArea.listArea.addContent(new EngineText("/",16777215,14,"center",0,0,120,20),490,10 + _loc1_ * 20,null,null,true);
            if(!GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].buyTime > 0)
            {
               knownPricesArea.listArea.addContent(new EngineText("-",16777215,14,"right",0,0,50,20),490,10 + _loc1_ * 20,null,null,true);
            }
            else
            {
               knownPricesArea.listArea.addContent(new EngineText(Math.round((GD.Time - GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].buyTime) / 86400),16777215,14,"right",0,0,50,20),490,10 + _loc1_ * 20,null,null,true);
            }
            if(!GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].sellTime > 0)
            {
               knownPricesArea.listArea.addContent(new EngineText("-",16777215,14,"left",0,0,50,20),560,10 + _loc1_ * 20,null,null,true);
            }
            else
            {
               knownPricesArea.listArea.addContent(new EngineText(Math.round((GD.Time - GD.knownPrices[knownPricesItems[knownPricesInd].entries[_loc1_]].sellTime) / 86400),16777215,14,"left",0,0,50,20),560,10 + _loc1_ * 20,null,null,true);
            }
         }
         knownPricesArea.listArea.updateSize();
      }
      
      public function initKnownPrices() : *
      {
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         knownPricesItems = [];
         for(_loc2_ in GD.knownPrices)
         {
            _loc1_ = false;
            for(_loc3_ in knownPricesItems)
            {
               if(GD.knownPrices[_loc2_].item == knownPricesItems[_loc3_].item)
               {
                  knownPricesItems[_loc3_].entries.push(_loc2_);
                  _loc1_ = true;
                  break;
               }
            }
            if(!_loc1_)
            {
               knownPricesItems.push({
                  "item":GD.knownPrices[_loc2_].item,
                  "entries":[_loc2_]
               });
               trace(GD.knownPrices[_loc2_].item + "==" + gotoItem);
               if(GD.knownPrices[_loc2_].item == gotoItem)
               {
                  knownPricesInd = knownPricesItems.length - 1;
               }
            }
         }
         gotoItem = undefined;
         updateKnownPrices();
      }
      
      public function scrollKnownPrices(param1:* = null) : *
      {
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         if(param1.target == knownPricesArea.prevButton)
         {
            knownPricesInd = Number(knownPricesInd) - 1;
         }
         else
         {
            knownPricesInd = Number(knownPricesInd) + 1;
         }
         updateKnownPrices();
      }
      
      public function seePricesForCargoItem() : *
      {
         gotoItem = cargoSelected.type;
         categoryButtonShining[category].visible = false;
         categoryButtonBodies[category].mouseEnabled = true;
         categoryButtonShining[1].visible = true;
         categoryButtonBodies[1].mouseEnabled = false;
         unsetCat();
         category = 1;
         currLogCategory = 0;
         setCat();
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         calculator.remove();
         calculator = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         removeEventListener("enterFrame",cursorControl);
         removeEventListener("mouseUp",releaseButton);
         skillsScrollable.remove();
         if(knownPricesArea is ScrollableArea)
         {
            knownPricesArea.remove();
         }
         for(_loc1_ in logPages)
         {
            if(logPages[_loc1_].acceptedArea is ScrollableArea)
            {
               logPages[_loc1_].acceptedArea.remove();
            }
            if(logPages[_loc1_].completedArea is ScrollableArea)
            {
               logPages[_loc1_].completedArea.remove();
            }
            if(logPages[_loc1_].failedArea is ScrollableArea)
            {
               logPages[_loc1_].failedArea.remove();
            }
            if(logPages[_loc1_].mainArea is ScrollableArea)
            {
               logPages[_loc1_].mainArea.remove();
            }
            logPages[_loc1_].acceptedArea = null;
            logPages[_loc1_].completedArea = null;
            logPages[_loc1_].completedArea = null;
            logPages[_loc1_].mainArea = null;
            logPages[_loc1_] = null;
         }
         logPages = null;
         crewSkillsAndExperiencesWindow.remove();
         crewSkillsAndExperiencesWindow = null;
         equipmentDescriptionArea.remove();
         equipmentDescriptionArea = null;
         equipmentPersonData.remove();
         equipmentPersonData = null;
         groupsFoodstuffsArea.remove();
         groupsFoodstuffsArea = null;
         passengersTransportArea.remove();
         passengersTransportArea = null;
         cargoInfoArea.remove();
         cargoInfoArea = null;
         workshopArea.remove();
         workshopArea = null;
         manageContainers.liquidsArea.remove();
         manageContainers.liquidsArea = null;
         manageContainers.availableArea.remove();
         manageContainers.availableArea = null;
         manageContainers.prohibitedArea.remove();
         manageContainers.prohibitedArea = null;
         withdrawFromUse.listArea.remove();
         withdrawFromUse.listArea = null;
         readDialogue.readArea.remove();
         readDialogue.readArea = null;
         for(_loc1_ in manageContainers.liquids)
         {
            manageContainers.liquids[_loc1_].containersArea.remove();
            manageContainers.liquids[_loc1_].containersArea = null;
         }
         economyGraph.remove();
         economyGraph = null;
         crewList.remove();
         crewList = null;
         equipmentList.remove();
         equipmentList = null;
         equipmentPeopleList.remove();
         equipmentPeopleList = null;
         equipmentItemsList.remove();
         equipmentItemsList = null;
         transportList.remove();
         transportList = null;
         cartsAnimalsList.remove();
         cartsAnimalsList = null;
         cartsCartsList.remove();
         cartsCartsList = null;
         passengersTransportList.remove();
         passengersTransportList = null;
         passengersPassengersList.remove();
         passengersPassengersList = null;
         cargoList.remove();
         cargoList = null;
      }
   }
}

