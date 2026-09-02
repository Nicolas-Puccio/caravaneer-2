package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   
   public class TradeWindow extends Sprite
   {
      
      internal var D:*;
      
      internal var GD:*;
      
      public var onExit:*;
      
      public var partners:*;
      
      public var bottomLineCapacity:*;
      
      public var bottomLineDate:*;
      
      public var bottomLineMoney:*;
      
      public var exitButton:*;
      
      public var closeDealButton:*;
      
      public var currentPartnerSymbol:*;
      
      public var partnerName:*;
      
      public var yourWeight:*;
      
      public var yourPrice:*;
      
      public var partnerWeight:*;
      
      public var partnerPrice:*;
      
      public var partner:*;
      
      public var shop:*;
      
      public var shopType:*;
      
      public var calculator:*;
      
      public var bulbs:*;
      
      public var cursorInfo:*;
      
      public var moneyText:*;
      
      public var moneyDirection:*;
      
      public var partnerSymbol:*;
      
      public var bulbBases:*;
      
      public var bulbTexts:*;
      
      public var crossMoney:*;
      
      public var free:*;
      
      public var blockedFilters:*;
      
      public var partnersName:*;
      
      public var ConfirmDialogue:*;
      
      public var MessageDialogue:*;
      
      public var setLimit:*;
      
      public var partnersAvailableSpace:*;
      
      public var playersAvailableSpace:*;
      
      public var realShop:*;
      
      public var problemDisplay:*;
      
      public var tradeButtonText:*;
      
      public var mainCharPic:*;
      
      public function TradeWindow(paramGD:*, paramPartner:* = null, paramPartnerSymbol:* = null, param4:* = null, param5:* = null, param6:* = false, param7:* = null, param8:* = "")
      {
         var _loc9_:* = undefined;
         super();
         GD = paramGD;
         //- resets changes from the player's AI
         GD.Caravans[0].People[0].category = 1;
         for(_locCaravanMember_ in GD.Caravans[0].People)
         {
            if(GD.Caravans[0].People[_locCaravanMember_].category == 5 && GD.Caravans[0].People[_locCaravanMember_].name.indexOf("bot-") == 0)
            {
               GD.Caravans[0].People[_locCaravanMember_].category = 2;
               GD.Caravans[0].People[_locCaravanMember_].name = GD.Caravans[0].People[_locCaravanMember_].name.substring(4);
            }
         }

         onExit = new Function();
         D = new Dialogue(880,495);
         addChild(D);
         addEventListener("enterFrame",cursorControl,false,0,false);
         bottomLineCapacity = new EngineText("",0,14,"left",10,474,860,20);
         bottomLineDate = new EngineText("",0,14,"right",10,474,860,20);
         bottomLineMoney = new EngineText("",0,14,"left",10,474,860,20);
         D.addToMask(bottomLineCapacity);
         D.addToMask(bottomLineDate);
         D.addToMask(bottomLineMoney);
         var _loc11_:* = new Sprite();
         D.addToMask(_loc11_);
         _loc11_.graphics.lineStyle(1,16777215);
         _loc11_.graphics.moveTo(0,472);
         _loc11_.graphics.lineTo(880,472);
         exitButton = new Button(2,exit,Texts.fetch(1344).toUpperCase());
         exitButton.x = 132;
         exitButton.y = 225;
         D.addChild(exitButton);
         closeDealButton = new Button(2,doBarter,Texts.fetch(1345).toUpperCase());
         closeDealButton.x = 542;
         closeDealButton.y = 225;
         D.addChild(closeDealButton);
         _loc11_.graphics.drawRect(130,222,210,30);
         _loc11_.graphics.drawRect(540,222,210,30);
         _loc11_.graphics.drawRect(360,222,160,30);
         _loc11_.graphics.moveTo(120,470);
         _loc11_.graphics.lineTo(120,237);
         _loc11_.graphics.lineTo(130,237);
         _loc11_.graphics.moveTo(340,237);
         _loc11_.graphics.lineTo(360,237);
         _loc11_.graphics.moveTo(520,237);
         _loc11_.graphics.lineTo(540,237);
         _loc11_.graphics.moveTo(750,237);
         _loc11_.graphics.lineTo(760,237);
         _loc11_.graphics.lineTo(760,0);
         _loc11_.graphics.drawRect(130,12,60,60);
         _loc11_.graphics.drawRect(690,402,60,60);
         _loc11_.graphics.drawRect(130,82,620,130);
         _loc11_.graphics.drawRect(130,262,620,130);
         partners = new Array({},{});
         for(_loc9_ in partners)
         {
            partners[_loc9_].items = [];
         }
         mainCharPic = new Sprite();
         mainCharPic.scaleX = mainCharPic.scaleY = 0.24;
         mainCharPic.x = 130;
         mainCharPic.y = 12;
         D.addChild(mainCharPic);
         var _loc10_:* = new EngineText(Texts.fetch(3).toUpperCase(),16777215,16,"left",200,11,550,20,true);
         D.addChild(_loc10_);
         moneyText = new EngineText("",16777215,16,"left",360,226,160,22,true);
         D.addToMask(moneyText);
         crossMoney = new Sprite();
         crossMoney.y = 237;
         D.addToMask(crossMoney);
         moneyDirection = new RepeatedGraphics(3);
         moneyDirection.y = 237;
         D.addToMask(moneyDirection);
         yourPrice = new EngineText("",16777215,14,"left",200,32,550,20,true);
         D.addChild(yourPrice);
         yourWeight = new EngineText("",16777215,14,"left",200,52,550,20,true);
         D.addChild(yourWeight);
         partnerName = new EngineText("",16777215,16,"right",130,401,550,20,true);
         D.addChild(partnerName);
         partnerPrice = new EngineText("",16777215,14,"right",130,422,550,20,true);
         D.addChild(partnerPrice);
         partnerWeight = new EngineText("",16777215,14,"right",130,442,550,20,true);
         D.addChild(partnerWeight);
         partners[0].area = new ScrollableArea(608,128,608,128,true,false,false,3,10);
         partners[0].area.x = 131;
         partners[0].area.y = 83;
         D.addChild(partners[0].area);
         partners[1].area = new ScrollableArea(608,128,608,128,true,false,false,3,10);
         partners[1].area.x = 131;
         partners[1].area.y = 263;
         D.addChild(partners[1].area);
         problemDisplay = {};
         problemDisplay.counter = 0;
         problemDisplay.disp = new Sprite();
         problemDisplay.disp.graphics.lineStyle(1,3156000);
         problemDisplay.disp.graphics.beginFill(12631208);
         problemDisplay.disp.graphics.drawRect(0,0,300,30);
         problemDisplay.disp.x = 290;
         problemDisplay.disp.y = 130;
         problemDisplay.txt = new EngineText("",3156000,14,"center",0,5,300,20);
         problemDisplay.disp.addChild(problemDisplay.txt);
         problemDisplay.disp.mouseEnabled = false;
         problemDisplay.disp.visible = false;
         addChild(problemDisplay.disp);
         calculator = new Calculator();
         calculator.visible = false;
         addChild(calculator);
         bulbTexts = [];
         bulbBases = [];
         bulbs = [];
         _loc9_ = 0;
         while(_loc9_ < 6)
         {
            bulbBases[_loc9_] = new ImportedBitmap("BulbBase.png");
            D.addChild(bulbBases[_loc9_]);
            bulbs[_loc9_] = new ImportedBitmap("BulbLightRedOn.png");
            D.addChild(bulbs[_loc9_]);
            bulbs[_loc9_].visible = false;
            _loc9_++;
         }
         bulbBases[0].x = 737;
         bulbBases[0].y = 36;
         bulbBases[1].x = 737;
         bulbBases[1].y = 16;
         bulbBases[2].x = 737;
         bulbBases[2].y = 56;
         bulbBases[3].x = 130;
         bulbBases[3].y = 426;
         bulbBases[4].x = 130;
         bulbBases[4].y = 406;
         bulbBases[5].x = 130;
         bulbBases[5].y = 446;
         for(_loc9_ in bulbBases)
         {
            bulbs[_loc9_].x = bulbBases[_loc9_].x - 4;
            bulbs[_loc9_].y = bulbBases[_loc9_].y - 4;
         }
         _loc9_ = 0;
         while(_loc9_ < 6)
         {
            if(_loc9_ < 3)
            {
               bulbTexts[_loc9_] = new EngineText("",16777215,12,"right",130,bulbBases[_loc9_].y - 3,600,20,true);
            }
            else
            {
               bulbTexts[_loc9_] = new EngineText("",16777215,12,"left",150,bulbBases[_loc9_].y - 3,600,20,true);
            }
            if(_loc9_ == 0 || _loc9_ == 3)
            {
               bulbTexts[_loc9_].text = Texts.fetch(1273);
            }
            if(_loc9_ == 1 || _loc9_ == 4)
            {
               bulbTexts[_loc9_].text = Texts.fetch(27);
            }
            if(_loc9_ == 2 || _loc9_ == 5)
            {
               bulbTexts[_loc9_].text = Texts.fetch(1346);
            }
            D.addChild(bulbTexts[_loc9_]);
            _loc9_++;
         }
         if(paramPartner != null)
         {
            setPartner(paramPartner,paramPartnerSymbol,param4,param5,param6,param7,param8);
         }
         ConfirmDialogue = new YesNoDialogue();
         ConfirmDialogue.visible = false;
         addChild(ConfirmDialogue);
         MessageDialogue = new YesNoDialogue(true);
         MessageDialogue.visible = false;
         addChild(MessageDialogue);
         cursorInfo = new Sprite();
         cursorInfo.mouseEnabled = false;
         cursorInfo.mouseChildren = false;
         addChild(cursorInfo);
      }
      
      public function setPartner(paramPartner:*, paramPartnerSymbol:*, param3:* = null, param4:* = null, param5:* = false, param6:* = null, param7:* = "", param8:* = null, param9:* = false, param10:* = null) : *
      {
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc17_:* = undefined;
         var _loc13_:* = undefined;
         var _loc21_:* = undefined;
         var _loc18_:* = undefined;
         var _loc16_:* = undefined;
         var _loc11_:* = undefined;
         while(mainCharPic.numChildren > 0)
         {
            mainCharPic.removeChildAt(0);
         }
         mainCharPic.addChild(GD.Caravans[0].People[0].picture);
         if(param10 == null)
         {
            tradeButtonText = Texts.fetch(1345).toUpperCase();
         }
         else
         {
            tradeButtonText = param10;
         }
         closeDealButton.buttonText.text = tradeButtonText;
         partner = paramPartner;
         shop = param3;
         shopType = param4;
         realShop = shop;
         if(shopType == 1)
         {
            realShop = null;
         }
         free = param5;
         blockedFilters = param6;
         partnersName = param7;
         partnerSymbol = paramPartnerSymbol;
         setLimit = param8;
         yourPrice.visible = partnerPrice.visible = bulbBases[0].visible = bulbTexts[0].visible = bulbBases[3].visible = bulbTexts[3].visible = moneyText.visible = moneyDirection.visible = !free;
         if(!param9)
         {
            for(_loc13_ in partners)
            {
               if(partners[_loc13_].list is DisplayObject && D.contains(partners[_loc13_].list))
               {
                  D.removeChild(partners[_loc13_].list);
               }
            }
         }
         partners[0].array = GD.Caravans[0].Cargo.concat(GD.Caravans[0].Transport);
         if(partner is Town && partner.allowsSlaves || partner is Caravan && partner.slavers)
         {
            partners[0].array = partners[0].array.concat(GD.Caravans[0].People);
         }
         var _loc20_:* = ["market","food","liquids","liquidscontainers","devices","tools","miscellaneous","weapons","ammo","attachments","armor","firstaid","animals","carts","cars"];
         if(partner is Town && partner.allowsSlaves || !(partner is Town))
         {
            _loc20_.push("slaves");
         }
         for(_loc13_ in blockedFilters)
         {
            _loc14_ = 0;
            while(_loc14_ < _loc20_.length)
            {
               if(_loc20_[_loc14_] == blockedFilters[_loc13_])
               {
                  _loc20_.splice(_loc14_,1);
                  break;
               }
               _loc14_++;
            }
         }
         if(shopType == 7)
         {
            _loc20_ = [];
            partners[0].array = [];
            for(_loc13_ in GD.Caravans[0].Cargo)
            {
               if(GD.Caravans[0].Cargo[_loc13_].type == 174)
               {
                  partners[0].array.push(GD.Caravans[0].Cargo[_loc13_]);
                  break;
               }
            }
         }
         if(!param9)
         {
            partners[0].list = new List([],450,true,_loc20_,["volunteers","mercenaries","prisoners","other"].concat(blockedFilters),selectPlayerItem,85,false,false,true);
            //- i think this is my code
            if(partner is Town)
            {
               partners[0].list.EnableNewColor(GD,partner,realShop);
            }

            partners[0].list.x = 10;
            partners[0].list.y = 12;
            D.addChild(partners[0].list);
         }
         if(partner is Caravan)
         {
            partners[1].array = partner.Cargo.concat(partner.People);

            //+-just for testing
            partners[1].array = partners[1].array.concat(partner.Transport);
         }
         if(partner is Town)
         {
            if(shop is Object && shopType != 1)
            {
               partners[1].array = shop.stock;
            }
            else
            {
               partners[1].array = partner.stock;
            }
            partners[1].array = partners[1].array.concat(shop.transport);
            if(partner.allowsSlaves)
            {
               partners[1].array = partners[1].array.concat(shop.slaves);
            }
         }
         if(partner is Array)
         {
            partners[1].array = partner.concat([]);
         }
         if(partner is Caravan)
         {
            _loc21_ = partner.getConsumptionProduction();
            var caloriesOwned = 0;//+- was _loc18_
            for(_loc13_ in partner.Cargo)
            {
               if(partner.Cargo[_loc13_].itemData.food)
               {
                  caloriesOwned += partner.Cargo[_loc13_].amount * partner.Cargo[_loc13_].itemData.calories;
               }
            }
            _loc16_ = Math.max(caloriesOwned - _loc21_.foodConsumption * 7,0) / caloriesOwned;
         }
         for(_loc13_ in partners)
         {
            _loc14_ = 0;
            while(_loc14_ < partners[_loc13_].array.length)
            {
               if(partners[_loc13_].array[_loc14_] is Item)
               {
                  if(GD.advancedTrading && partners[_loc13_].array[_loc14_].itemData.liquidsContainer)
                  {
                     _loc11_ = partners[_loc13_].array[_loc14_].amount;
                  }
                  else
                  {
                     _loc11_ = partners[_loc13_].array[_loc14_].amount - partners[_loc13_].array[_loc14_].inUse;
                  }
                  //-
                  if(_loc13_ == 1 && partner is Caravan && !GD.Config("see hidden cargo"))
                  {
                     if(partners[_loc13_].array[_loc14_].category != 1 || partners[_loc13_].array[_loc14_].itemData.liquidsContainer)
                     {
                        _loc11_ = 0;
                     }
                     else
                     {
                        for(_loc15_ in _loc21_.consumption)
                        {
                           if(partners[_loc13_].array[_loc14_].type == _loc21_.consumption[_loc15_].item)
                           {
                              _loc11_ -= _loc21_.consumption[_loc15_].amount * 7;
                           }
                        }
                     }
                     if(partners[_loc13_].array[_loc14_].itemData.food)
                     {
                        _loc11_ *= _loc16_;
                     }
                     if(partners[_loc13_].array[_loc14_].type == 64)
                     {
                        _loc11_ -= _loc21_.fuelPer100Km * 3;
                     }
                  }
                  if(_loc11_ > 0)
                  {
                     partners[_loc13_].array[_loc14_] = new Item(partners[_loc13_].array[_loc14_].type,_loc11_);
                  }
                  else
                  {
                     partners[_loc13_].array.splice(_loc14_,1);
                     _loc14_--;
                  }
               }
               //-
               if(!GD.Config("see hidden cargo") && partners[_loc13_].array[_loc14_] is Character && partners[_loc13_].array[_loc14_].category != 4)
               {
                  partners[_loc13_].array.splice(_loc14_,1);
                  _loc14_--;
               }
               _loc14_++;
            }
         }
         partners[0].list.update(partners[0].array);
         if(!param9)
         {
            partners[1].list = new List([],390,true,[],["volunteers","mercenaries","prisoners","other"],selectPartnerItem,85,false,false,true);//-forgot what 85 was
            partners[1].list.x = 770;
            partners[1].list.y = 42;
            partners[1].list.update(partners[1].array);
            D.addChild(partners[1].list);
         }
         var _loc12_:* = new Button(10,takeAll,Texts.fetch(1356,1,10).toUpperCase(),null,null,true);
         _loc12_.x = 767;
         _loc12_.y = 9;
         D.addChild(_loc12_);
         var _loc19_:* = new Button(10,pressClear,Texts.fetch(1357,1,10).toUpperCase(),null,null,true);
         _loc19_.x = 767;
         _loc19_.y = 441;
         D.addChild(_loc19_);
         if(currentPartnerSymbol is DisplayObject && D.contains(currentPartnerSymbol))
         {
            D.removeChild(currentPartnerSymbol);
         }
         if(partnerSymbol is DisplayObject)
         {
            currentPartnerSymbol = partnerSymbol;
            currentPartnerSymbol.x = 720;
            currentPartnerSymbol.y = 432;
            D.addChild(currentPartnerSymbol);
         }
         if(shop is Object)
         {
            partnerName.text = Texts.fetch(shop.name).toUpperCase();
         }
         else if(partner is Array)
         {
            partnerName.text = partnersName;
         }
         else
         {
            partnerName.text = partner.name.toUpperCase();
         }
         update();
      }
      
      public function update() : *
      {
         var _loc8_:* = undefined;
         var _loc4_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         partnersAvailableSpace = null;
         if(partner is Caravan)
         {
            partnersAvailableSpace = partner.maxCargo - partner.totalCargo + totalWeight(partners[0].items);
         }
         else if(partner is Array && setLimit != null)
         {
            _loc5_ = 0;
            for(_loc7_ in partner)
            {
               if(partner[_loc7_] is Item || partner[_loc7_] is TransportUnit)
               {
                  _loc5_ += partner[_loc7_].totalWeight;
               }
            }
            partnersAvailableSpace = setLimit - _loc5_ + totalWeight(partners[0].items);
         }
         playersAvailableSpace = GD.Caravans[0].maxCargo - GD.Caravans[0].totalCargo + totalWeight(partners[1].items);
         yourPrice.text = Texts.fetch(1347).toUpperCase() + ": " + MathFunctions.NumberFormat(totalPrice(partners[0].items),2,false) + "   " + Texts.fetch(1191).toUpperCase() + ": " + MathFunctions.NumberFormat(totalWeight(partners[0].items),1,true);
         _locWaterFromFood_ = 0;
         for(_locCargo_ in GD.Caravans[0].Cargo)
         {
            if(GD.Caravans[0].Cargo[_locCargo_].itemData.food)
            {
               _locWaterFromFood_ += GD.Caravans[0].Cargo[_locCargo_].itemData.waterPercentage * GD.Caravans[0].Cargo[_locCargo_].amount * GD.Caravans[0].Cargo[_locCargo_].weightPerUnit;
            }
         }
         yourWeight.text = "WATER NEED: " + MathFunctions.NumberFormat(Math.max(GD.waterNeed - GD.Caravans[0].water - _locWaterFromFood_,0),0) + "   FOOD NEED: " + MathFunctions.NumberFormat(Math.max(GD.foodNeed - GD.Caravans[0].food,0),0) + " kcal";
         if(partnersAvailableSpace != null)
         {
            yourPrice.text += " / " + MathFunctions.NumberFormat(partnersAvailableSpace,1,true);
         }
         var partnersMoneyAlt:* = 0;
         if(!free)
         {
            if(shop is Object && shopType != 1)
            {
               partnersMoneyAlt = shop.money;
            }
            else
            {
               partnersMoneyAlt = partner.money;
            }
         }
         var extraPartnerPriceText:* = " ($" + Math.ceil(partnersMoneyAlt) +")"
         partnerPrice.text = Texts.fetch(1347).toUpperCase() + ": " + MathFunctions.NumberFormat(totalPrice(partners[1].items),2,false) + extraPartnerPriceText;
         partnerWeight.text = Texts.fetch(1191).toUpperCase() + ": " + MathFunctions.NumberFormat(totalWeight(partners[1].items),1,true) + " / " + MathFunctions.NumberFormat(playersAvailableSpace,1,true);
         for(_loc7_ in partners)
         {
            for(_loc8_ in partners[_loc7_].area.contentList)
            {
               partners[_loc7_].area.Content.removeChild(partners[_loc7_].area.contentList[_loc8_].item);
            }
            partners[_loc7_].area.contentList = [];
         }
         for(_loc7_ in partners)
         {
            for(_loc8_ in partners[_loc7_].items)
            {
               partners[_loc7_].items[_loc8_].pic.y = Math.floor(_loc8_ / 10) * 60 + 10;
               partners[_loc7_].items[_loc8_].pic.x = _loc8_ % 10 * 60 + 10;
               partners[_loc7_].items[_loc8_].pic.scaleX = partners[_loc7_].items[_loc8_].pic.scaleY = 0.2;
               partners[_loc7_].area.addContent(partners[_loc7_].items[_loc8_].pic,null,null,null,null,true);
               if(partners[_loc7_].items[_loc8_].item is Item)
               {
                  partners[_loc7_].items[_loc8_].amountText.text = partners[_loc7_].items[_loc8_].item.amount;
               }
            }
         }
         for(_loc7_ in partners)
         {
            partners[_loc7_].area.updateSize();
         }
         partners[0].list.update(partners[0].array);
         partners[1].list.update(partners[1].array);
         bulbs[0].visible = totalPrice(partners[1].items) - totalPrice(partners[0].items) > GD.Caravans[0].money;
         bulbs[1].visible = GD.Caravans[0].totalCargo - GD.Caravans[0].maxCargo > 0.05;
         var _loc9_:Boolean = true;
         for(_loc7_ in GD.Caravans[0].Cargo)
         {
            if(GD.Caravans[0].Cargo[_loc7_].itemData.liquid)
            {
               GD.Caravans[0].arrangeLiquidsContainers(GD.Caravans[0].Cargo[_loc7_].type);
               if(GD.Caravans[0].maxLiquidAmount(GD.Caravans[0].Cargo[_loc7_].type) < 0)
               {
                  _loc9_ = false;
                  break;
               }
            }
         }
         bulbs[2].visible = !_loc9_;
         if(free)
         {
            _loc1_ = 100000000000000000000;
         }
         else if(partner is Town && shop is Object && shopType != 1)
         {
            _loc1_ = shop.money;
         }
         else if(partner is Town || partner is Caravan)
         {
            _loc1_ = partner.money;
         }
         else
         {
            _loc1_ = 0;
         }
         var _loc3_:* = totalPrice(partners[0].items) - totalPrice(partners[1].items);
         bulbs[3].visible = _loc3_ > _loc1_ && _loc3_ > 0;
         if(partnersAvailableSpace == null)
         {
            bulbs[4].visible = false;
         }
         else
         {
            bulbs[4].visible = partnersAvailableSpace - totalWeight(partners[0].items) <= -0.05;
         }
         _loc9_ = true;
         if(partner is Caravan)
         {
            for(_loc7_ in partner.Cargo)
            {
               if(partner.Cargo[_loc7_].itemData.liquid)
               {
                  if(partner.maxLiquidAmount(partner.Cargo[_loc7_].type) < 0)
                  {
                     _loc9_ = false;
                     break;
                  }
               }
            }
            bulbs[5].visible = !_loc9_;
         }
         else
         {
            bulbs[5].visible = false;
         }
         var _loc11_:* = totalPrice(partners[0].items) - totalPrice(partners[1].items);
         moneyText.text = MathFunctions.NumberFormat(Math.abs(_loc11_),2) + " €";
         var _loc10_:* = moneyText.textWidth + 20;
         if(Math.abs(_loc11_) < 0.005)
         {
            moneyDirection.rotation = 90;
         }
         else if(_loc11_ > 0)
         {
            moneyDirection.rotation = 0;
         }
         else
         {
            moneyDirection.rotation = 180;
         }
         moneyText.x = 440 - _loc10_ / 2 + 20;
         moneyDirection.x = 440 - _loc10_ / 2 + moneyDirection.width / 2;
         if(!free)
         {
            if(shop is Object && shopType != 1)
            {
               _loc2_ = shop.money;
            }
            else
            {
               _loc2_ = partner.money;
            }
         }
         crossMoney.graphics.clear();
         if(!free && (_loc11_ > 0 && _loc11_ > _loc2_ || _loc11_ < 0 && Math.abs(_loc11_) > GD.Caravans[0].money))
         {
            crossMoney.x = moneyText.x;
            crossMoney.graphics.lineStyle(1,16777215);
            crossMoney.graphics.moveTo(0,0);
            crossMoney.graphics.lineTo(moneyText.textWidth,0);
         }
         updateBottomLine();
      }
      
      public function selectPlayerItem(param1:*, takeMax:* = false) : *
      {
         takeItem(partners[0],param1,takeMax);
      }
      
      public function selectPartnerItem(param1:*, takeMax:* = false) : *
      {
         takeItem(partners[1],param1,takeMax);
      }
      
      private function takeItem(param1:*, param2:*, takeMax:*) : *
      {
         var max:*;
         var i:*;
         var occupiedSpace:*;
         var spareWeight:*;
         var moneyProblem:*;
         var perMoneyAmount:*;
         var containersProblem:*;
         var maxLiquid:*;
         var availableMoney:*;
         var from:* = param1;
         var item:* = param2;
         if(item != null)
         {
            if(item is TransportUnit || item is Character)
            {
               doMove(from,item,1);
            }
            if(item is Item)
            {
               max = item.amount;
               spareWeight = null;
               if(from == partners[1])
               {
                  spareWeight = GD.Caravans[0].maxCargo - GD.Caravans[0].totalCargo;
               }
               if(from == partners[0])
               {
                  if(setLimit != null)
                  {
                     if(partner is Array)
                     {
                        occupiedSpace = 0;
                        for(i in partner)
                        {
                           if(partner[i] is Item)
                           {
                              occupiedSpace += partner[i].totalWeight;
                           }
                        }
                        spareWeight = setLimit - occupiedSpace;
                     }
                     if(partner is Caravan)
                     {
                        spareWeight = setLimit - partner.totalCargo;
                     }
                  }
                  else if(partner is Caravan)
                  {
                     spareWeight = partner.maxCargo - partner.totalCargo;
                  }
               }
               containersProblem = false;
               moneyProblem = false;
               if(!GD.advancedTrading && max >= 0.05 && spareWeight != null && item is Item && item.weightPerUnit > 0)
               {
                  max = Math.max(Math.min(max,Math.floor(10 * spareWeight / item.weightPerUnit) / 10),0);
               }
               if(!GD.advancedTrading && max >= 0.05 && item is Item && item.itemData.liquid)
               {
                  maxLiquid = 100000000000000000000;
                  if(from == partners[1])
                  {
                     maxLiquid = GD.Caravans[0].maxLiquidAmount(item.type);
                  }
                  else if(partner is Caravan)
                  {
                     maxLiquid = partner.maxLiquidAmount(item.type);
                  }
                  max = Math.min(max,Math.max(Math.floor(maxLiquid * 10) / 10,0));
                  if(max < 0.05)
                  {
                     containersProblem = true;
                  }
               }
               if(!free && from == partners[1] && !GD.advancedTrading && max >= 0.05)
               {
                  if(item is Item)
                  {
                     availableMoney = GD.Caravans[0].money + totalPrice(partners[0].items) - totalPrice(partners[1].items);
                     perMoneyAmount = GD.itemAmountFromPrice(partner,item.type,availableMoney,true,realShop);
                     perMoneyAmount = Math.floor(perMoneyAmount * 10) / 10;
                  }
                  if(!item.divisible)
                  {
                     perMoneyAmount = Math.floor(perMoneyAmount);
                  }
                  max = Math.min(max,perMoneyAmount);
                  if(perMoneyAmount <= 0)
                  {
                     moneyProblem = true;
                  }
               }
               if(!item.divisible)
               {
                  max = Math.floor(max);
               }
               else
               {
                  max = Math.round(max * 10) / 10;
               }
               if(containersProblem)
               {
                  problemDisplay.txt.text = Texts.fetch(1346);
                  problemDisplay.counter = 50;
               }
               else if(moneyProblem)
               {
                  problemDisplay.txt.text = Texts.fetch(1273);
                  problemDisplay.counter = 50;
               }
               else if(max < 0.05)
               {
                  problemDisplay.txt.text = Texts.fetch(1020);
                  problemDisplay.counter = 50;
               }
               if(max < 5.05 && !takeMax)
               {
                  if(max >= 0.05)
                  {
                     doMove(from,item,Math.min(1,max));
                  }
               }
               else if(takeMax)
               {
                  if(max >= 0.05)
                  {
                     doMove(from,item,max);
                  }
               }
               else
               {
                  calculator.visible = true;
                  calculator.min = 1;
                  if(item.divisible)
                  {
                     calculator.min = 0.1;
                  }
                  calculator.max = max;
                  calculator.onUpdate = function():*
                  {
                     var _loc1_:* = undefined;
                     var _loc2_:* = undefined;
                     if(!(item is Item))
                     {
                        calculator.rightSideText.text = "";
                     }
                     else if(calculator.value == 0)
                     {
                        calculator.rightSideText.text = "";
                     }
                     else if(calculator.value > calculator.max)
                     {
                        calculator.rightSideText.text = Texts.fetch(1359);
                     }
                     else
                     {
                        _loc1_ = from == partners[1];
                        if(!free)
                        {
                           _loc2_ = GD.calculatePrice(partner,item.type,calculator.value,_loc1_,realShop);
                        }
                        calculator.rightSideText.text = Texts.fetch(1358) + ": " + item.name;
                        if(!free)
                        {
                           calculator.rightSideText.text += "\n" + Texts.fetch(1347) + ": " + MathFunctions.NumberFormat(_loc2_,2,false) + " €";
                           calculator.rightSideText.text += "\n" + Texts.fetch(1192) + ": " + MathFunctions.NumberFormat(_loc2_ / calculator.value,2,false) + " €";
                        }
                        calculator.rightSideText.text += "\n" + Texts.fetch(1191) + ": " + MathFunctions.NumberFormat(item.weightPerUnit * calculator.value,1,true) + " " + Texts.fetch(12);
                     }
                     if(GD.advancedTrading)
                     {
                        if(item is Item && item.itemData.liquid)
                        {
                           if(from == partners[1])
                           {
                              calculator.rightSideText.text += "\n\n" + Texts.fetch(1367).replace("@amount@",MathFunctions.NumberFormat(Math.max(GD.Caravans[0].maxLiquidAmount(item.type),0),1,true) + " " + Texts.fetch(11));
                           }
                           else if(partner is Caravan)
                           {
                              calculator.rightSideText.text += "\n\n" + Texts.fetch(1368).replace("@amount@",MathFunctions.NumberFormat(Math.max(partner.maxLiquidAmount(item.type),0),1,true) + " " + Texts.fetch(11));
                           }
                        }
                        if(from == partners[1])
                        {
                           if(spareWeight > 0)
                           {
                              calculator.rightSideText.text += "\n\n" + Texts.fetch(1370).replace("@amount@",MathFunctions.NumberFormat(spareWeight,1,true) + " " + Texts.fetch(12));
                           }
                           else
                           {
                              calculator.rightSideText.text += "\n\n" + Texts.fetch(1371).replace("@amount@",MathFunctions.NumberFormat(0 - spareWeight,1,true) + " " + Texts.fetch(12));
                           }
                        }
                        if(from == partners[0])
                        {
                           if(spareWeight != null)
                           {
                              if(spareWeight > 0)
                              {
                                 calculator.rightSideText.text += "\n\n" + Texts.fetch(1372).replace("@amount@",MathFunctions.NumberFormat(spareWeight,1,true) + " " + Texts.fetch(12));
                              }
                              else
                              {
                                 calculator.rightSideText.text += "\n\n" + Texts.fetch(1373).replace("@amount@",MathFunctions.NumberFormat(0 - spareWeight,1,true) + " " + Texts.fetch(12));
                              }
                           }
                        }
                     }
                  };
                  _locAmountNeeded_ = Math.min(1,calculator.max);
                  if(item.itemData.food)
                  {
                     _locAmountNeeded_ = Math.ceil((GD.foodNeed - GD.Caravans[0].food) / item.itemData.calories);
                     _locAmountNeeded_ = Math.min(_locAmountNeeded_,calculator.max);
                     _locAmountNeeded_ = Math.max(_locAmountNeeded_,Math.min(1,calculator.max));
                  }
                  if(item.type == 1)
                  {
                     _locAmountNeeded_ = GD.waterNeed - GD.Caravans[0].water - _locWaterFromFood_;
                     _locAmountNeeded_ = Math.min(_locAmountNeeded_,calculator.max);
                     _locAmountNeeded_ = Math.max(_locAmountNeeded_,Math.min(1,calculator.max));
                  }
                  calculator.setValue(_locAmountNeeded_);
                  calculator.info.text = Texts.fetch(1348).toUpperCase();
                  calculator.onDone = function(param1:*):*
                  {
                     doMove(from,item,param1);
                  };
               }
            }
         }
      }
      
      private function doMove(param1:*, param2:*, param3:*, param4:* = false) : *
      {
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc6_:Boolean = false;
         _loc5_ = param1 != partners[0];
         if(param2 is Item)
         {
            for(_loc8_ in param1.items)
            {
               if(param1.items[_loc8_].item is Item && param1.items[_loc8_].item.type == param2.type)
               {
                  param1.items[_loc8_].item.amount += param3;
                  _loc7_ = _loc8_;
                  _loc6_ = true;
                  break;
               }
            }
         }
         if(!_loc6_)
         {
            if(param2 is Item)
            {
               _loc7_ = param1.items.push({"item":new Item(param2.type,param3)}) - 1;
            }
            else
            {
               _loc7_ = param1.items.push({"item":param2}) - 1;
            }
            param1.items[_loc7_].pic = new Sprite();
            param1.items[_loc7_].pic.graphics.beginFill(16777215,0.1);
            param1.items[_loc7_].pic.graphics.lineStyle(1,16777215);
            param1.items[_loc7_].pic.graphics.drawRect(0,0,250,250);
            if(param2 is Character)
            {
               param1.items[_loc7_].pic.addChild(param2.getPortrait());
            }
            else
            {
               param1.items[_loc7_].pic.addChild(param2.picture);
            }
            if(param2 is Item)
            {
               param1.items[_loc7_].amountText = new EngineText("",16777215,50,"right",10,185,230,50);
               param1.items[_loc7_].amountText.filters = [new DropShadowFilter(1,45,0,1,0,0)];
               param1.items[_loc7_].pic.addChild(param1.items[_loc7_].amountText);
            }
            param1.items[_loc7_].pic.mouseChildren = false;
            param1.items[_loc7_].pic.buttonMode = true;
            param1.items[_loc7_].pic.addEventListener("click",clickBarterItem,false,0,false);
         }
         if(param2 is TransportUnit)
         {
            if(param2.cart is TransportUnit)
            {
               param1.items[_loc7_].cart = param2.cart;
            }
            if(param2.attachedTo is TransportUnit)
            {
               param1.items[_loc7_].attachedTo = param2.attachedTo;
               param1.items[_loc7_].passengers = [];
               while(param1.items[_loc7_].attachedTo.passengersWeight > param1.items[_loc7_].attachedTo.capacity || param1.items[_loc7_].attachedTo.passengerSpacesOccupied > param1.items[_loc7_].attachedTo.maxPassengers)
               {
                  param1.items[_loc7_].passengers.push(param1.items[_loc7_].attachedTo.Passengers[param1.items[_loc7_].attachedTo.Passengers.length - 1]);
                  param1.items[_loc7_].attachedTo.Passengers[param1.items[_loc7_].attachedTo.Passengers.length - 1].removeFromPassengers();
               }
            }
            if(param2.Passengers.length > 0)
            {
               param1.items[_loc7_].passengers = [];
               for(_loc8_ in param2.Passengers)
               {
                  param1.items[_loc7_].passengers.push(param2.Passengers[_loc8_]);
               }
            }
         }
         if(param2 is TransportUnit || param2 is Character)
         {
            if(partner is Array && setLimit != null)
            {
               param1.items[_loc7_].weight = param2.weight;
            }
            else
            {
               param1.items[_loc7_].weight = 0;
            }
            param1.items[_loc7_].price = 0;
            if(param2.passengerIn is TransportUnit)
            {
               param1.items[_loc7_].passengerIn = param2.passengerIn;
            }
         }
         if(param2 is Item)
         {
            param1.items[_loc7_].weight = param1.items[_loc7_].item.totalWeight;
            if(free)
            {
               param1.items[_loc7_].price = 0;
            }
         }
         for(_loc8_ in param1.array)
         {
            if(param1.array[_loc8_] == param2)
            {
               if(param2 is Item)
               {
                  param1.array[_loc8_].amount -= param3;
                  if(param1.array[_loc8_].amount <= 0.05)
                  {
                     param1.array.splice(_loc8_,1);
                  }
               }
               else
               {
                  param1.array.splice(_loc8_,1);
               }
               break;
            }
         }
         if(param1 == partners[0])
         {
            reduceFromPartner(GD.Caravans[0],param2,param3);
            addToPartner(partner,param2,param3);
         }
         else
         {
            addToPartner(GD.Caravans[0],param2,param3);
            reduceFromPartner(partner,param2,param3);
         }
         if((param2 is TransportUnit || param2 is Character) && !free)
         {
            updateTransportCharacterPrices(param2);
         }
         if(param2 is Item && !free && !param4)
         {
            recalculateItemPrices();
         }
         if(!param4)
         {
            update();
         }
      }
      
      private function recalculateItemPrices() : *
      {
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(free)
         {
            return;
         }
         for(_loc2_ in partners)
         {
            for(_loc3_ in partners[_loc2_].items)
            {
               if(partners[_loc2_].items[_loc3_].item is Item)
               {
                  if(_loc2_ == 1)
                  {
                     reduceFromPartner(GD.Caravans[0],partners[_loc2_].items[_loc3_].item,partners[_loc2_].items[_loc3_].item.amount);
                     addToPartner(partner,partners[_loc2_].items[_loc3_].item,partners[_loc2_].items[_loc3_].item.amount);
                  }
                  else
                  {
                     addToPartner(GD.Caravans[0],partners[_loc2_].items[_loc3_].item,partners[_loc2_].items[_loc3_].item.amount);
                     reduceFromPartner(partner,partners[_loc2_].items[_loc3_].item,partners[_loc2_].items[_loc3_].item.amount);
                  }
               }
            }
         }
         for(_loc2_ in partners)
         {
            _loc1_ = [];
            for(_loc3_ in partners[_loc2_].items)
            {
               if(partners[_loc2_].items[_loc3_].item is Item)
               {
                  _loc1_.push({
                     "tradeItem":partners[_loc2_].items[_loc3_],
                     "price":partners[_loc2_].items[_loc3_].item.itemData.price,
                     "name":partners[_loc2_].items[_loc3_].item.name
                  });
               }
            }
            _loc1_.sortOn(["price","name"],[18,2]);
            for(_loc3_ in _loc1_)
            {
               _loc1_[_loc3_].tradeItem.price = GD.calculatePrice(partner,_loc1_[_loc3_].tradeItem.item.type,_loc1_[_loc3_].tradeItem.item.amount,_loc2_ == 1,realShop);
               if(_loc2_ == 0)
               {
                  reduceFromPartner(GD.Caravans[0],_loc1_[_loc3_].tradeItem.item,_loc1_[_loc3_].tradeItem.item.amount);
                  addToPartner(partner,_loc1_[_loc3_].tradeItem.item,_loc1_[_loc3_].tradeItem.item.amount);
               }
               else
               {
                  addToPartner(GD.Caravans[0],_loc1_[_loc3_].tradeItem.item,_loc1_[_loc3_].tradeItem.item.amount);
                  reduceFromPartner(partner,_loc1_[_loc3_].tradeItem.item,_loc1_[_loc3_].tradeItem.item.amount);
               }
            }
         }
      }
      
      private function updateTransportCharacterPrices(param1:*) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = transportCharacterPricePerMoneyUnit(param1,true,true);
         for(_loc3_ in partners)
         {
            for(_loc4_ in partners[_loc3_].items)
            {
               if(param1 is Character && partners[_loc3_].items[_loc4_].item is Character || param1 is TransportUnit && partners[_loc3_].items[_loc4_].item is TransportUnit && param1.type == partners[_loc3_].items[_loc4_].item.type)
               {
                  _loc2_ = _loc5_ * partners[_loc3_].items[_loc4_].item.price;
                  if(partners[_loc3_].items[_loc4_].item is TransportUnit && partners[_loc3_].items[_loc4_].item.category == 1)
                  {
                     _loc2_ = Math.max(_loc2_,meatPrice(partners[_loc3_].items[_loc4_].item));
                  }
                  partners[_loc3_].items[_loc4_].price = applyTaxes(_loc2_,_loc3_ == 1);
               }
            }
         }
      }
      
      private function ClickbarterItemAll(param1:*) : *
      {
         clickBarterItem(param1,true);
      }
      
      private function clickBarterItem(param1:*, removeAll:* = false) : *
      {
         var j:*;
         var part:*;
         var ind:*;
         var i:*;
         var e:* = param1;
         var breakMe:* = false;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(i in partners)
         {
            for(j in partners[i].items)
            {
               if(partners[i].items[j].pic == e.target)
               {
                  part = i;
                  ind = j;
                  breakMe = true;
                  break;
               }
            }
            if(breakMe)
            {
               break;
            }
         }
         if(partners[part].items[ind].item is Item && partners[part].items[ind].item.amount < 3.05 && !removeAll)//-forgot what this does
         {
            returnItem(part,ind,Math.min(1,partners[part].items[ind].item.amount));
         }
         else if(removeAll)
         {
            returnItem(part,ind,partners[part].items[ind].item.amount);
         }
         else if(partners[part].items[ind].item is Item)
         {
            calculator.visible = true;
            calculator.min = 0;
            calculator.max = partners[part].items[ind].item.amount;
            calculator.onUpdate = function():*
            {
               var _loc1_:* = undefined;
               var _loc4_:* = undefined;
               var _loc3_:* = undefined;
               if(!(partners[part].items[ind].item is Item))
               {
                  calculator.rightSideText.text = "";
               }
               else if(calculator.value == 0)
               {
                  calculator.rightSideText.text = "";
               }
               else if(calculator.value > calculator.max)
               {
                  calculator.rightSideText.text = Texts.fetch(1359);
               }
               else
               {
                  _loc1_ = part == 1;
                  calculator.rightSideText.text = Texts.fetch(1358) + ": " + partners[part].items[ind].item.name;
                  if(!free)
                  {
                     _loc4_ = recalculatePrice(part,ind,partners[part].items[ind].item.amount - calculator.value);
                     calculator.rightSideText.text += "\n" + Texts.fetch(1360) + ": " + MathFunctions.NumberFormat(partners[part].items[ind].price - _loc4_,2,false) + " €";
                  }
                  calculator.rightSideText.text += "\n" + Texts.fetch(1361) + ": " + MathFunctions.NumberFormat(partners[part].items[ind].item.weightPerUnit * calculator.value,1,true) + " " + Texts.fetch(12);
                  if(part == 1 && partners[part].items[ind].item.itemData.liquid && GD.Caravans[0].maxLiquidAmount(partners[part].items[ind].item.type) < 0)
                  {
                     calculator.rightSideText.text += "\n\n" + Texts.fetch(1369).replace("@amount@",MathFunctions.NumberFormat(0 - GD.Caravans[0].maxLiquidAmount(partners[part].items[ind].item.type),1,true) + " " + Texts.fetch(11));
                  }
                  if(part == 0 && partner is Caravan && partners[part].items[ind].item.itemData.liquid && partner.maxLiquidAmount(partners[part].items[ind].item.type) < 0)
                  {
                     calculator.rightSideText.text += "\n\n" + Texts.fetch(1369).replace("@amount@",MathFunctions.NumberFormat(0 - partner.maxLiquidAmount(partners[part].items[ind].item.type),1,true) + " " + Texts.fetch(11));
                  }
               }
               var _loc2_:* = null;
               if(part == 1)
               {
                  _loc2_ = GD.Caravans[0].maxCargo - GD.Caravans[0].totalCargo;
                  if(_loc2_ > 0)
                  {
                     calculator.rightSideText.text += "\n\n" + Texts.fetch(1370).replace("@amount@",MathFunctions.NumberFormat(_loc2_,1,true) + " " + Texts.fetch(12));
                  }
                  else
                  {
                     calculator.rightSideText.text += "\n\n" + Texts.fetch(1371).replace("@amount@",MathFunctions.NumberFormat(0 - _loc2_,1,true) + " " + Texts.fetch(12));
                  }
               }
               if(part == 0)
               {
                  if(setLimit != null)
                  {
                     if(partner is Array)
                     {
                        _loc3_ = 0;
                        for(i in partner)
                        {
                           if(partner[i] is Item)
                           {
                              _loc3_ += partner[i].totalWeight;
                           }
                        }
                        _loc2_ = setLimit - _loc3_;
                     }
                     if(partner is Caravan)
                     {
                        _loc2_ = setLimit - partner.totalCargo;
                     }
                  }
                  else if(partner is Caravan)
                  {
                     _loc2_ = partner.maxCargo - partner.totalCargo;
                  }
                  if(_loc2_ != null)
                  {
                     if(_loc2_ > 0)
                     {
                        calculator.rightSideText.text += "\n\n" + Texts.fetch(1372).replace("@amount@",MathFunctions.NumberFormat(_loc2_,1,true) + " " + Texts.fetch(12));
                     }
                     else
                     {
                        calculator.rightSideText.text += "\n\n" + Texts.fetch(1373).replace("@amount@",MathFunctions.NumberFormat(0 - _loc2_,1,true) + " " + Texts.fetch(12));
                     }
                  }
               }
            };
            calculator.setValue(1);
            calculator.info.text = Texts.fetch(1215).toUpperCase();
            calculator.onDone = function(param1:*):*
            {
               returnItem(part,ind,param1);
            };
         }
         else
         {
            returnItem(part,ind,1);
         }
      }
      
      public function returnItem(param1:*, param2:*, param3:*, param4:* = false) : *
      {
         var _loc10_:* = undefined;
         var _loc9_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         trace("supposed to remove " + param1 + " " + param2 + " x " + param3);
         var _loc5_:Boolean = false;
         if(partners[param1].items[param2].item is Item)
         {
            if(!free)
            {
               partners[param1].items[param2].price = recalculatePrice(param1,param2,partners[param1].items[param2].item.amount - param3);
            }
            for(_loc9_ in partners[param1].array)
            {
               if(partners[param1].array[_loc9_] is Item && partners[param1].array[_loc9_].type == partners[param1].items[param2].item.type)
               {
                  partners[param1].array[_loc9_].amount += param3;
                  _loc5_ = true;
                  break;
               }
            }
            if(!_loc5_)
            {
               partners[param1].array.unshift(new Item(partners[param1].items[param2].item.type,param3));
            }
         }
         else
         {
            partners[param1].array.unshift(partners[param1].items[param2].item);
         }
         var _loc7_:Boolean = false;
         if(partners[param1].items[param2].cart is TransportUnit)
         {
            trace("this animal used to have a cart");
            for(_loc9_ in partners[param1].array)
            {
               trace("comparing " + partners[param1].items[param2].cart.name + " to " + partners[param1].array[_loc9_].name);
               if(partners[param1].array[_loc9_] == partners[param1].items[param2].cart)
               {
                  partners[param1].items[param2].item.cart = partners[param1].array[_loc9_];
                  partners[param1].array[_loc9_].attachedTo = partners[param1].items[param2].item;
                  _loc7_ = true;
                  trace("found it!");
                  break;
               }
            }
            if(!_loc7_)
            {
               for(_loc9_ in partners[param1].items)
               {
                  if(partners[param1].items[_loc9_].item == partners[param1].items[param2].cart)
                  {
                     partners[param1].items[_loc9_].attachedTo = partners[param1].items[param2].item;
                     break;
                  }
               }
            }
         }
         _loc7_ = false;
         if(partners[param1].items[param2].attachedTo is TransportUnit)
         {
            for(_loc9_ in partners[param1].array)
            {
               if(partners[param1].array[_loc9_] == partners[param1].items[param2].attachedTo)
               {
                  partners[param1].items[param2].item.attachedTo = partners[param1].array[_loc9_];
                  partners[param1].array[_loc9_].cart = partners[param1].items[param2].item;
                  _loc7_ = true;
                  break;
               }
            }
            if(!_loc7_ && partners[param1].items[param2].passengers is Array)
            {
               for(_loc9_ in partners[param1].items)
               {
                  if(partners[param1].items[_loc9_].item == partners[param1].items[param2].attachedTo)
                  {
                     if(!(partners[param1].items[_loc9_].passengers is Array))
                     {
                        partners[param1].items[_loc9_].passengers = [];
                     }
                     for(_loc10_ in partners[param1].items[param2].passengers)
                     {
                        partners[param1].items[_loc9_].passengers.push(partners[param1].items[param2].passengers[_loc10_]);
                     }
                     partners[param1].items[param2].passengers = null;
                     break;
                  }
               }
            }
            if(!_loc7_)
            {
               for(_loc9_ in partners[param1].items)
               {
                  if(partners[param1].items[_loc9_].item == partners[param1].items[param2].attachedTo)
                  {
                     partners[param1].items[_loc9_].cart = partners[param1].items[param2].item;
                     break;
                  }
               }
            }
         }
         if(partners[param1].items[param2].passengers is Array)
         {
            if(param1 == 0)
            {
               _loc6_ = GD.Caravans[0].Transport.concat(GD.Caravans[0].People);
            }
            if(param1 == 1)
            {
               _loc6_ = partner.Transport.concat(partner.People);
            }
            for(_loc9_ in partners[param1].items[param2].passengers)
            {
               for(_loc10_ in _loc6_)
               {
                  if(partners[param1].items[param2].passengers[_loc9_] == _loc6_[_loc10_])
                  {
                     if(partners[param1].items[param2].item.attachedTo is TransportUnit)
                     {
                        partners[param1].items[param2].item.attachedTo.Passengers.push(_loc6_[_loc10_]);
                        trace("returning " + _loc6_[_loc10_].name + " back to " + partners[param1].items[param2].item.attachedTo.name);
                        _loc6_[_loc10_].passengerIn = partners[param1].items[param2].item.attachedTo;
                     }
                     else
                     {
                        partners[param1].items[param2].item.Passengers.push(_loc6_[_loc10_]);
                        trace("returning " + _loc6_[_loc10_].name + " back to " + partners[param1].items[param2].item.name);
                        _loc6_[_loc10_].passengerIn = partners[param1].items[param2].item;
                     }
                     break;
                  }
               }
            }
         }
         if(partners[param1].items[param2].passengerIn is TransportUnit)
         {
            if(param1 == 0)
            {
               _loc8_ = GD.Caravans[0].Transport;
            }
            if(param1 == 1)
            {
               _loc8_ = partner.Transport;
            }
            for(_loc9_ in _loc8_)
            {
               if(_loc8_[_loc9_] == partners[param1].items[param2].passengerIn)
               {
                  partners[param1].items[param2].item.passengerIn = _loc8_[_loc9_];
                  _loc8_[_loc9_].Passengers.push(partners[param1].items[param2].item);
                  trace("returning " + partners[param1].items[param2].item.name + " to " + _loc8_[_loc9_].name);
                  break;
               }
            }
         }
         if(param1 == 1)
         {
            reduceFromPartner(GD.Caravans[0],partners[param1].items[param2].item,param3,true);
         }
         else
         {
            reduceFromPartner(partner,partners[param1].items[param2].item,param3,true);
         }
         if(param1 == 1)
         {
            addToPartner(partner,partners[param1].items[param2].item,param3);
         }
         else
         {
            addToPartner(GD.Caravans[0],partners[param1].items[param2].item,param3);
         }
         var _loc11_:* = partners[param1].items[param2].item;
         if(partners[param1].items[param2].item is Item)
         {
            partners[param1].items[param2].item.amount -= param3;
            partners[param1].items[param2].weight = partners[param1].items[param2].item.totalWeight;
            if(partners[param1].items[param2].item.amount <= 0)
            {
               partners[param1].items.splice(param2,1);
            }
         }
         else
         {
            partners[param1].items.splice(param2,1);
         }
         if((_loc11_ is TransportUnit || _loc11_ is Character) && !free)
         {
            updateTransportCharacterPrices(_loc11_);
         }
         if(!param4 && _loc11_ is Item)
         {
            recalculateItemPrices();
         }
         if(!param4)
         {
            update();
         }
      }
      
      private function reduceFromPartner(param1:*, param2:*, param3:*, param4:* = false) : *
      {
         var _loc5_:* = undefined;
         if(param2 is Item)
         {
            if(param1 is Caravan)
            {
               param1.reduceCargo(param2.type,param3);
            }
            if(param1 is Town)
            {
               if(shop is Object && shopType != 1)
               {
                  param1.removeFromStock(param2.type,param3,shop.stock);
               }
               else
               {
                  param1.removeFromStock(param2.type,param3);
               }
            }
            if(param1 is Array)
            {
               for(_loc5_ in param1)
               {
                  if(param1[_loc5_] is Item && param1[_loc5_].type == param2.type)
                  {
                     param1[_loc5_].amount -= param3;
                     if(param1[_loc5_].amount <= 0)
                     {
                        param1.splice(_loc5_,1);
                     }
                     break;
                  }
               }
            }
         }
         if(param2 is TransportUnit)
         {
            if(param1 is Caravan)
            {
               param1.removeTransport(param2,param4);
            }
            if(param1 is Town)
            {
               for(_loc5_ in shop.transport)
               {
                  if(shop.transport[_loc5_] == param2)
                  {
                     shop.transport.splice(_loc5_,1);
                     break;
                  }
               }
            }
            if(param1 is Array)
            {
               for(_loc5_ in param1)
               {
                  if(param1[_loc5_] == param2)
                  {
                     param1.splice(_loc5_,1);
                     break;
                  }
               }
            }
         }
         if(param2 is Character)
         {
            if(param1 is Caravan)
            {
               param1.removePerson(param2,false);
            }
            if(param1 is Town)
            {
               for(_loc5_ in shop.slaves)
               {
                  if(shop.slaves[_loc5_] == param2)
                  {
                     shop.slaves.splice(_loc5_,1);
                     break;
                  }
               }
            }
            if(param1 is Array)
            {
               for(_loc5_ in param1)
               {
                  if(param1[_loc5_] == param2)
                  {
                     param1.splice(_loc5_,1);
                     break;
                  }
               }
            }
         }
      }
      
      private function addToPartner(param1:*, param2:*, param3:*) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         if(param2 is Item)
         {
            if(param1 is Caravan)
            {
               param1.addCargo(param2.type,param3,false,true);
            }
            if(param1 is Town)
            {
               if(shop is Object && shopType != 1)
               {
                  param1.addToStock(param2.type,param3,shop.stock);
               }
               else
               {
                  param1.addToStock(param2.type,param3);
               }
            }
            if(param1 is Array)
            {
               for(_loc5_ in param1)
               {
                  if(param1[_loc5_] is Item && param1[_loc5_].type == param2.type)
                  {
                     param1[_loc5_].amount += param3;
                     _loc4_ = true;
                     break;
                  }
               }
               if(!_loc4_)
               {
                  param1.push(new Item(param2.type,param3));
               }
            }
         }
         if(param2 is TransportUnit)
         {
            if(param1 is Caravan)
            {
               param1.addTransport(param2);
            }
            if(param1 is Town)
            {
               shop.transport.push(param2);
            }
            if(param1 is Array)
            {
               param1.push(param2);
            }
         }
         if(param2 is Character)
         {
            if(param1 is Caravan)
            {
               param1.addPerson(param2);
            }
            if(param1 is Town)
            {
               shop.slaves.push(param2);
            }
            if(param1 is Array)
            {
               param1.push(param2);
            }
         }
      }
      
      private function totalPrice(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = 0;
         for(_loc2_ in param1)
         {
            _loc3_ += param1[_loc2_].price;
         }
         return _loc3_;
      }
      
      private function totalWeight(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = 0;
         for(_loc2_ in param1)
         {
            _loc3_ += param1[_loc2_].weight;
         }
         return _loc3_;
      }
      
      private function updateBottomLine() : *
      {
         bottomLineCapacity.text = Texts.fetch(903).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].totalCargo,0) + "/" + MathFunctions.NumberFormat(GD.Caravans[0].maxCargo,0) + " " + Texts.fetch(12).toUpperCase();
         bottomLineMoney.text = Texts.fetch(20).toUpperCase() + ": " + MathFunctions.NumberFormat(GD.Caravans[0].money,2);
         var _loc1_:* = GD.makeDate();
         bottomLineDate.text = _loc1_.Day2d + "-" + _loc1_.ShortMonthName + "-" + _loc1_.Year2d + " " + _loc1_.Hour2d + ":" + _loc1_.Minute2d;
         var _loc2_:* = 860 - bottomLineCapacity.textWidth - bottomLineDate.textWidth;
         bottomLineMoney.x = 10 + bottomLineCapacity.textWidth + _loc2_ / 2 - bottomLineMoney.textWidth / 2;
      }
      
      private function transportCharacterPrice(param1:*, param2:*) : *
      {
         var _loc3_:* = transportCharacterPricePerMoneyUnit(param1,param2) * param1.price;
         if(param1 is TransportUnit && param1.category == 1)
         {
            _loc3_ = Math.max(_loc3_,meatPrice(param1));
         }
         return applyTaxes(_loc3_,param2);
      }
      
      private function meatPrice(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(partner is Town)
         {
            _loc2_ = partner.getItemBasePrice(param1.meat);
         }
         else
         {
            _loc2_ = GD.globalItemPrice(param1.meat);
         }
         return param1.meatAmount * _loc2_;
      }
      
      internal function applyTaxes(param1:*, param2:*) : *
      {
         if(free)
         {
            return param1;
         }
         var _loc3_:* = param1;
         if(shop is Object)
         {
            if(param2)
            {
               _loc3_ *= 1 + shop.margin;
            }
            else
            {
               _loc3_ *= 1 / (1 + shop.margin);
            }
         }
         if(partner is Town)
         {
            if(param2)
            {
               _loc3_ *= 1 + partner.tax;
            }
            else
            {
               _loc3_ *= 1 / (1 + partner.tax);
            }
         }
         if(partner is Caravan)
         {
            if(param2)
            {
               _loc3_ *= 2;
            }
            else
            {
               _loc3_ *= 0.5;
            }
         }
         return _loc3_;
      }
      
      private function transportCharacterPricePerMoneyUnit(param1:*, param2:*, param3:* = false) : *
      {
         var _loc8_:* = undefined;
         var _loc4_:* = undefined;
         var _loc9_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc5_:* = 0;
         var _loc10_:* = 0;
         if(free || partner is Array)
         {
            return 1;
         }
         if(param1 is TransportUnit)
         {
            _loc6_ = TransportUnit.Types[param1.type].price;
         }
         if(param1 is Character)
         {
            _loc6_ = GameData.averageSlavePrice;
         }
         if(shop is Object)
         {
            if(param1 is TransportUnit)
            {
               for(_loc7_ in shop.transportAssortment)
               {
                  if(shop.transportAssortment[_loc7_].type == param1.type && shop.transportAssortment[_loc7_].amount > 0)
                  {
                     _loc10_ = shop.transportAssortment[_loc7_].amount * _loc6_;
                     break;
                  }
               }
               for(_loc7_ in shop.transport)
               {
                  if(shop.transport[_loc7_].type == param1.type)
                  {
                     _loc5_ += shop.transport[_loc7_].price;
                  }
               }
            }
            if(param1 is Character)
            {
               _loc10_ = shop.slavesAmount * _loc6_;
               for(_loc7_ in shop.slaves)
               {
                  _loc5_ += shop.slaves[_loc7_].price;
               }
            }
         }
         if(partner is Caravan)
         {
            if(param1 is TransportUnit)
            {
               for(_loc7_ in partner.Transport)
               {
                  _loc5_ += partner.Transport[_loc7_].price;
               }
            }
            if(param1 is Character)
            {
               for(_loc7_ in partner.People)
               {
                  if(partner.People[_loc7_].category == 4)
                  {
                     _loc5_ += partner.People[_loc7_].price;
                  }
               }
            }
            _loc10_ = _loc6_ / 10;
         }
         _loc9_ = _loc5_;
         for(_loc7_ in partners)
         {
            for(_loc8_ in partners[_loc7_].items)
            {
               if(param1 is Character && partners[_loc7_].items[_loc8_].item is Character || param1 is TransportUnit && partners[_loc7_].items[_loc8_].item is TransportUnit && param1.type == partners[_loc7_].items[_loc8_].item.type)
               {
                  if(_loc7_ == 0)
                  {
                     _loc9_ -= partners[_loc7_].items[_loc8_].item.price;
                  }
                  else
                  {
                     _loc9_ += partners[_loc7_].items[_loc8_].item.price;
                  }
               }
            }
         }
         if(!param3)
         {
            if(param2)
            {
               _loc5_ -= param1.price;
            }
            else
            {
               _loc5_ += param1.price;
            }
         }
         _loc4_ = priceIntegral(0.00001,Math.max(_loc5_,0.0001),Math.max(_loc10_,_loc6_ / 100));
         _loc4_ /= _loc5_;
         _loc4_ = Math.min(_loc4_,1.2);
         _loc4_ = Math.max(_loc4_,0.1);
         if(partner is Town)
         {
            if(param1 is Character && Presets.Towns[partner.type].slavePrices != undefined)
            {
               _loc4_ *= Presets.Towns[partner.type].slavePrices;
            }
            if(param1 is TransportUnit && param1.category == 1 && Presets.Towns[partner.type].animalPrices != undefined)
            {
               _loc4_ *= Presets.Towns[partner.type].animalPrices;
            }
         }
         if(_loc10_ <= 0)
         {
            _loc4_ = Math.min(_loc4_,0.5);
         }
         return _loc4_;
      }
      
      public function priceIntegral(param1:*, param2:*, param3:*) : *
      {
         var _loc4_:* = undefined;
         return param3 * Math.log(param2) - param3 * Math.log(param1);
      }
      
      public function cursorControl(param1:*) : *
      {
         var _loc25_:* = undefined;
         var _loc16_:* = undefined;
         var _loc23_:* = undefined;
         var _loc12_:* = undefined;
         var _loc8_:* = undefined;
         var _loc30_:* = undefined;
         var _loc31_:* = undefined;
         var _loc19_:* = undefined;
         var _loc20_:* = undefined;
         var _loc5_:* = undefined;
         var _loc11_:* = undefined;
         var _loc17_:* = undefined;
         var _loc27_:* = undefined;
         var _loc4_:* = undefined;
         var _loc24_:* = undefined;
         var _loc2_:* = undefined;
         var _loc22_:* = undefined;
         var _loc26_:* = undefined;
         var _loc29_:* = undefined;
         var _loc9_:* = undefined;
         var _loc3_:* = undefined;
         if(!visible || ConfirmDialogue.visible || MessageDialogue.visible || GD.tutorialOn)
         {
            return false;
         }
         problemDisplay.disp.visible = problemDisplay.counter > 0;
         if(problemDisplay.counter > 0)
         {
            if(problemDisplay.counter > 25)
            {
               problemDisplay.disp.alpha = 1;
            }
            else
            {
               problemDisplay.disp.alpha = problemDisplay.counter / 25;
            }
            problemDisplay.counter--;
         }
         var _loc18_:* = 0;
         var _loc10_:* = 0;
         var _loc28_:* = [];
         var _loc15_:* = "";
         var _loc13_:* = "";
         var _loc21_:* = "";
         var _loc7_:* = "";
         var _loc14_:* = "";
         var _loc6_:* = "";
         for(_loc23_ in partners)
         {
            if(mouseX >= partners[_loc23_].list.x + partners[_loc23_].list.scrollableArea.x + 10 && mouseX <= partners[_loc23_].list.x + partners[_loc23_].list.scrollableArea.x + partners[_loc23_].list.scrollableArea.currWidth - 10 && mouseY >= partners[_loc23_].list.y + partners[_loc23_].list.scrollableArea.y && mouseY <= partners[_loc23_].list.y + partners[_loc23_].list.scrollableArea.y + partners[_loc23_].list.scrollableArea.currHeight)
            {
               //-fix for tooltip
               _loc12_ = (partners[_loc23_].list.scrollableArea.Content.mouseY - 5) % 60;
               if(_loc12_ < 55)
               {
                  _loc8_ = Math.floor((partners[_loc23_].list.scrollableArea.Content.mouseY - 5) / 60);
                  if(_loc8_ >= 0 && _loc8_ < partners[_loc23_].list.finalList.length)
                  {
                     _loc19_ = partners[_loc23_].list.finalList[_loc8_].item;
                     if(_loc19_ is Item)
                     {
                        _loc21_ = Texts.fetch(1190).toUpperCase() + ": " + MathFunctions.NumberFormat(_loc19_.weightPerUnit,3,true) + " " + Texts.fetch(12);
                        if(!free)
                        {
                           if(_loc23_ == 0)
                           {
                              _loc30_ = GD.calculatePrice(partner,_loc19_.type,1,false,realShop);
                           }
                           else
                           {
                              _loc30_ = GD.calculatePrice(partner,_loc19_.type,1,true,realShop);
                           }
                           if(partner is Town)
                           {
                              GD.addKnownPrice(_loc19_.type,partner,shop,_loc30_,_loc23_ != 0);
                           }
                           _loc15_ = Texts.fetch(1157).toUpperCase() + ": " + MathFunctions.NumberFormat(_loc30_,2) + " €";
                           if(_loc23_ == 0)
                           {
                              _loc31_ = GD.Caravans[0].findCargo(_loc19_.type);
                              if(_loc31_ && _loc31_.averagePrice != undefined)
                              {
                                 _loc13_ = Texts.fetch(6806).toUpperCase() + ": " + MathFunctions.NumberFormat(_loc31_.averagePrice,2) + " €";
                              }
                           }
                        }
                     }
                     else if(!free)
                     {
                        if(_loc23_ == 0)
                        {
                           _loc15_ = Texts.fetch(1157).toUpperCase() + ": " + MathFunctions.NumberFormat(transportCharacterPrice(_loc19_,false)) + " €";
                        }
                        else
                        {
                           _loc15_ = Texts.fetch(1157).toUpperCase() + ": " + MathFunctions.NumberFormat(transportCharacterPrice(_loc19_,true)) + " €";
                        }
                     }
                  }
               }
            }
         }
         if(mouseX >= 130 && mouseX <= 740)
         {
            if(mouseY >= 82 && mouseY <= 212)
            {
               _loc20_ = 0;
            }
            if(mouseY >= 262 && mouseY <= 392)
            {
               _loc20_ = 1;
            }
         }
         if(_loc20_ != undefined)
         {
            _loc5_ = Math.floor((partners[_loc20_].area.Content.mouseX - 10) / 60);
            _loc11_ = Math.floor((partners[_loc20_].area.Content.mouseY - 10) / 60);
            _loc17_ = _loc5_ + _loc11_ * 10;
            if(_loc17_ >= 0 && _loc17_ < partners[_loc20_].items.length)
            {
               if((partners[_loc20_].area.Content.mouseX - 10) % 60 <= 50 && (partners[_loc20_].area.Content.mouseY - 10) % 60 <= 50)
               {
                  _loc19_ = partners[_loc20_].items[_loc17_].item;
                  if(partners[_loc20_].items[_loc17_].item is Item)
                  {
                     if(!free)
                     {
                        _loc15_ = Texts.fetch(1347).toUpperCase() + ": " + MathFunctions.NumberFormat(partners[_loc20_].items[_loc17_].price,2) + " €";
                        _loc7_ = Texts.fetch(1192).toUpperCase() + ": " + MathFunctions.NumberFormat(partners[_loc20_].items[_loc17_].price / partners[_loc20_].items[_loc17_].item.amount,2) + " €";
                     }
                     _loc21_ = Texts.fetch(1191).toUpperCase() + ": " + MathFunctions.NumberFormat(partners[_loc20_].items[_loc17_].weight,1,true) + " " + Texts.fetch(12);
                     _loc14_ = Texts.fetch(1190).toUpperCase() + ": " + MathFunctions.NumberFormat(partners[_loc20_].items[_loc17_].item.weightPerUnit,3,true) + " " + Texts.fetch(12);
                  }
                  else if(!free)
                  {
                     _loc15_ = Texts.fetch(1296).toUpperCase() + ": " + MathFunctions.NumberFormat(partners[_loc20_].items[_loc17_].price,2) + " €";
                  }
                  _loc6_ = Texts.fetch(1091).toUpperCase();
               }
            }
         }
         if(_loc19_ != undefined)
         {
            _loc27_ = [];
            _loc4_ = [];
            _locType_ = "";
            if(_loc19_ is Item)
            {
               _locType_ = " - " + _loc19_.type;
            }
            _loc27_.push(new EngineText(_loc19_.name.toUpperCase() + _locType_,0,14,"center",12,5,880,20));
            _loc4_[0] = false;
            _loc24_ = 25;
            if(_loc15_ != "")
            {
               _loc24_ += 17;
               if(_loc7_ == "")
               {
                  _loc27_.push(new EngineText(_loc15_,0,12,"center",12,25,880,20));
                  _loc4_.push(false);
               }
               else
               {
                  _loc27_.push(new EngineText(_loc15_,0,12,"left",12,25,880,20));
                  _loc4_.push(new EngineText(_loc7_,0,12,"right",12,25,880,20));
               }
            }
            if(_loc13_ != "")
            {
               _loc27_.push(new EngineText(_loc13_,0,12,"center",12,_loc24_,880,20));
               _loc4_.push(false);
               _loc24_ += 17;
            }
            if(_loc21_ != "")
            {
               if(_loc14_ == "")
               {
                  _loc27_.push(new EngineText(_loc21_,0,12,"center",12,_loc24_,880,20));
                  _loc4_.push(false);
               }
               else
               {
                  _loc27_.push(new EngineText(_loc21_,0,12,"left",12,_loc24_,880,20));
                  _loc4_.push(new EngineText(_loc14_,0,12,"right",12,_loc24_,880,20));
               }
               _loc24_ += 25;
            }
            _loc2_ = _loc19_.getInfoPairs(true);
            for(_loc23_ in _loc2_)
            {
               if(_loc2_[_loc23_].key != "name" && (_loc2_[_loc23_].key != "weight" || _loc19_ is TransportUnit && (_loc19_.category == 1 || _loc19_.category == 2)) && _loc2_[_loc23_].key != "type" && _loc2_[_loc23_].key != "blank" && _loc2_[_loc23_].key != "projectileMass" && _loc2_[_loc23_].key != "muzzleVelocity" && _loc2_[_loc23_].key != "bulletDiameter" && _loc2_[_loc23_].key != "FF")
               {
                  if(_loc2_[_loc23_].key == "description" || _loc2_[_loc23_].key == "productionTitle")
                  {
                     _loc24_ += 8;
                  }
                  if(_loc2_[_loc23_].value != undefined)
                  {
                     _loc27_.push(new EngineText(_loc2_[_loc23_].name,0,12,"left",12,_loc24_,880,20));
                     _loc4_.push(new EngineText(_loc2_[_loc23_].value,0,12,"right",12,_loc24_,880,20));
                  }
                  else
                  {
                     if(_loc2_[_loc23_].multiline)
                     {
                        _loc26_ = -100000000000000000000;
                        for(_loc25_ in _loc27_)
                        {
                           _loc29_ = _loc27_[_loc25_].text.length;
                           if(_loc4_[_loc25_] is EngineText)
                           {
                              _loc29_ += _loc4_[_loc25_].text.length + 2;
                           }
                           if(_loc29_ > _loc26_)
                           {
                              _loc26_ = _loc29_;
                           }
                        }
                        _loc22_ = _loc2_[_loc23_].name.split(" ");
                        _loc3_ = "";
                        while(_loc22_.length > 0)
                        {
                           if(_loc3_.length + _loc22_[0].length + 1 <= _loc26_ || _loc3_.length == 0 && _loc22_[0].length <= _loc26_)
                           {
                              if(_loc3_.length == 0)
                              {
                                 _loc3_ = _loc22_.shift();
                              }
                              else
                              {
                                 _loc3_ += " " + _loc22_.shift();
                              }
                              _loc9_ = false;
                           }
                           else
                           {
                              _loc9_ = true;
                           }
                           if(_loc22_.length == 0)
                           {
                              _loc9_ = true;
                           }
                           if(_loc9_)
                           {
                              if(_loc22_.length > 0 && _loc22_[0].length > _loc26_)
                              {
                                 _loc22_.unshift(_loc22_[0].substring(0,_loc26_));
                                 _loc22_[1] = _loc22_[1].substring(_loc26_,_loc22_[1].length);
                              }
                              if(_loc3_.length > 0)
                              {
                                 _loc27_.push(new EngineText(_loc3_,0,12,"center",12,_loc24_,880,20));
                                 _loc24_ += 17;
                              }
                              _loc3_ = "";
                           }
                        }
                     }
                     else
                     {
                        _loc27_.push(new EngineText(_loc2_[_loc23_].name,0,12,"center",12,_loc24_,880,20));
                     }
                     _loc4_.push(false);
                  }
                  _loc24_ += 17;
               }
            }
            if(_loc6_ != "")
            {
               _loc24_ += 8;
               _loc27_.push(new EngineText(_loc6_,0,12,"center",12,_loc24_,880,20));
            }
            for(_loc23_ in _loc27_)
            {
               _loc28_.push(_loc27_[_loc23_]);
               if(_loc4_[_loc23_] is EngineText)
               {
                  _loc16_ = _loc27_[_loc23_].textWidth + _loc4_[_loc23_].textWidth + 20;
                  _loc28_.push(_loc4_[_loc23_]);
               }
               else
               {
                  _loc16_ = _loc27_[_loc23_].textWidth + 5;
               }
               if(_loc16_ > _loc18_)
               {
                  _loc18_ = _loc16_;
               }
            }
            for(_loc23_ in _loc28_)
            {
               _loc28_[_loc23_].width = _loc18_;
            }
         }
         if(_loc28_.length > 0 && cursorInfo.alpha < 1)
         {
            cursorInfo.alpha += 0.2;
         }
         if(_loc28_.length == 0)
         {
            cursorInfo.alpha = 0;
         }
         cursorInfo.visible = !calculator.visible && _loc28_.length > 0;
         if(cursorInfo.visible)
         {
            while(cursorInfo.numChildren > 0)
            {
               cursorInfo.removeChild(cursorInfo.getChildAt(0));
            }
            _loc18_ = 0;
            _loc10_ = 0;
            for(_loc23_ in _loc28_)
            {
               cursorInfo.addChild(_loc28_[_loc23_]);
               if(_loc28_[_loc23_].x + _loc28_[_loc23_].width > _loc18_)
               {
                  _loc18_ = _loc28_[_loc23_].x + _loc28_[_loc23_].width;
               }
               if(_loc28_[_loc23_].y + _loc28_[_loc23_].height > _loc10_)
               {
                  _loc10_ = _loc28_[_loc23_].y + _loc28_[_loc23_].height;
               }
            }
            cursorInfo.graphics.clear();
            cursorInfo.graphics.lineStyle(1,3156000);
            cursorInfo.graphics.beginFill(12631208);
            cursorInfo.graphics.drawRect(0,0,_loc18_ + 10,_loc10_ + 5);
            cursorInfo.graphics.endFill();
            cursorInfo.x = mouseX + 20;
            cursorInfo.y = mouseY + 10;
            if(cursorInfo.y + _loc10_ + 5 > 490)
            {
               cursorInfo.y = 490 - _loc10_ - 5;
            }
            if(cursorInfo.x + _loc18_ + 5 > 875)
            {
               cursorInfo.x = mouseX - _loc18_ - 10;
            }
         }
      }
      
      public function recalculatePrice(param1:*, param2:*, param3:*) : *
      {
         if(param1 == 1)
         {
            reduceFromPartner(GD.Caravans[0],partners[param1].items[param2].item,partners[param1].items[param2].item.amount);
            addToPartner(partner,partners[param1].items[param2].item,partners[param1].items[param2].item.amount);
         }
         else
         {
            addToPartner(GD.Caravans[0],partners[param1].items[param2].item,partners[param1].items[param2].item.amount);
            reduceFromPartner(partner,partners[param1].items[param2].item,partners[param1].items[param2].item.amount);
         }
         var _loc4_:* = param1 == 1;
         var _loc5_:* = GD.calculatePrice(partner,partners[param1].items[param2].item.type,param3,_loc4_,realShop);
         if(param1 == 0)
         {
            reduceFromPartner(GD.Caravans[0],partners[param1].items[param2].item,partners[param1].items[param2].item.amount);
            addToPartner(partner,partners[param1].items[param2].item,partners[param1].items[param2].item.amount);
         }
         else
         {
            addToPartner(GD.Caravans[0],partners[param1].items[param2].item,partners[param1].items[param2].item.amount);
            reduceFromPartner(partner,partners[param1].items[param2].item,partners[param1].items[param2].item.amount);
         }
         return _loc5_;
      }
      
      public function exit() : *
      {
         if(partners[0].items.length > 0 || partners[1].items.length > 0)
         {
            ConfirmDialogue.setText(Texts.fetch(1383).toUpperCase());
            ConfirmDialogue.onApprove = function():*
            {
               clearAll(null,true);
               problemDisplay.disp.visible = false;
               problemDisplay.counter = 0;
               visible = false;
               onExit();
            };
            ConfirmDialogue.onCancel = function():*
            {
            };
            ConfirmDialogue.visible = true;
         }
         else
         {
            problemDisplay.disp.visible = false;
            problemDisplay.counter = 0;
            visible = false;
            onExit();
         }
      }
      
      public function clearAll(param1:* = null, param2:* = false) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         if(param1 == null)
         {
            _loc3_ = 0;
            _loc5_ = 1;
         }
         else
         {
            _loc3_ = param1;
            _loc5_ = param1;
         }
         _loc4_ = _loc3_;
         while(_loc4_ <= _loc5_)
         {
            while(partners[_loc4_].items.length > 0)
            {
               if(partners[_loc4_].items[0].item is Item)
               {
                  returnItem(_loc4_,0,partners[_loc4_].items[0].item.amount,true);
               }
               else
               {
                  returnItem(_loc4_,0,1,true);
               }
            }
            _loc4_++;
         }
         if(!param2)
         {
            update();
         }
      }
      
      public function doBarter(param1:* = false) : *
      {
         var cargoDiff:*;
         var moneyDiff:*;
         var partnersMoney:*;
         var overLimit:*;
         var i:*;
         var playersProblematicLiquids:*;
         var partnersProblematicLiquids:*;
         var liquidsList:*;
         var partnersWeightDiff:*;
         var skipFirst:* = param1;
         if(partners[0].items.length == 0 && partners[1].items.length == 0)
         {
            return;
         }
         cargoDiff = GD.Caravans[0].maxCargo - GD.Caravans[0].totalCargo;
         moneyDiff = totalPrice(partners[1].items) - totalPrice(partners[0].items);
         partnersMoney = 0;
         if(!free)
         {
            if(shop is Object && shopType != 1)
            {
               partnersMoney = shop.money;
            }
            else
            {
               partnersMoney = partner.money;
            }
         }
         playersProblematicLiquids = [];
         partnersProblematicLiquids = [];
         for(i in GD.Caravans[0].Cargo)
         {
            if(GD.Caravans[0].Cargo[i].itemData.liquid)
            {
               overLimit = 0 - GD.Caravans[0].maxLiquidAmount(GD.Caravans[0].Cargo[i].type);
               if(overLimit > 0)
               {
                  playersProblematicLiquids.push(GD.Caravans[0].Cargo[i]);
               }
            }
         }
         if(partner is Caravan)
         {
            for(i in partner.Cargo)
            {
               if(partner.Cargo[i].itemData.liquid)
               {
                  overLimit = 0 - partner.maxLiquidAmount(partner.Cargo[i].type);
                  if(overLimit > 0)
                  {
                     partnersProblematicLiquids.push(partner.Cargo[i]);
                  }
               }
            }
         }
         if(partnersAvailableSpace != null)
         {
            partnersWeightDiff = partnersAvailableSpace - totalWeight(partners[0].items);
         }
         else
         {
            partnersWeightDiff = 100000000000000000000;
         }
         if(!free && moneyDiff > 0 && Math.abs(moneyDiff) > GD.Caravans[0].money)
         {
            MessageDialogue.setText(Texts.fetch(1350).replace("@money@",MathFunctions.NumberFormat(Math.abs(moneyDiff) - GD.Caravans[0].money,2,false) + " €").toUpperCase());
            MessageDialogue.visible = true;
         }
         else if(partnersWeightDiff < -0.05)
         {
            MessageDialogue.setText(Texts.fetch(1352).replace("@number@",MathFunctions.NumberFormat(Math.abs(partnersWeightDiff),1,true)).toUpperCase());
            MessageDialogue.visible = true;
         }
         else if(playersProblematicLiquids.length > 0)
         {
            liquidsList = [];
            for(i in playersProblematicLiquids)
            {
               liquidsList.push(playersProblematicLiquids[i].name);
            }
            MessageDialogue.setText(Texts.fetch(1351).replace("@liquids@",liquidsList.join(", ")).toUpperCase());
            MessageDialogue.visible = true;
         }
         else if(partnersProblematicLiquids.length > 0)
         {
            liquidsList = [];
            for(i in partnersProblematicLiquids)
            {
               liquidsList.push(partnersProblematicLiquids[i].name);
            }
            MessageDialogue.setText(Texts.fetch(1353).replace("@liquids@",liquidsList.join(", ")).toUpperCase());
            MessageDialogue.visible = true;
         }
         else if(cargoDiff < -0.05 && skipFirst !== true)
         {
            ConfirmDialogue.setText(Texts.fetch(1349).replace("@number@",MathFunctions.NumberFormat(Math.abs(cargoDiff),1,true)).toUpperCase());
            ConfirmDialogue.visible = true;
            ConfirmDialogue.onApprove = function():*
            {
               ConfirmDialogue.dontClose = true;
               doBarter(true);
            };
         }
         else if(!free && moneyDiff < 0 && Math.abs(moneyDiff) > partnersMoney)
         {
            ConfirmDialogue.setText(Texts.fetch(1354).replace("@money@",MathFunctions.NumberFormat(Math.max(partnersMoney,0),2,false) + " €").replace("@disadvantage@",MathFunctions.NumberFormat(Math.abs(moneyDiff) - Math.max(partnersMoney,0),2,false) + " €").toUpperCase());
            ConfirmDialogue.visible = true;
            ConfirmDialogue.onApprove = function():*
            {
               finishBarter();
               ConfirmDialogue.dontRemoveFunctions = false;
            };
            ConfirmDialogue.dontRemoveFunctions = true;
         }
         else
         {
            finishBarter();
            ConfirmDialogue.visible = false;
         }
      }
      
      public function finishBarter() : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc1_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc6_:* = undefined;
         if(GameData.soundFXOn && !free)
         {
            new SFXCashRegister().play();
         }
         if(!free)
         {
            _loc1_ = totalPrice(partners[1].items) - totalPrice(partners[0].items);
            if(_loc1_ < 0)
            {
               if(shop is Object && shopType != 1)
               {
                  _loc4_ = Math.max(shop.money,0);
               }
               else
               {
                  _loc4_ = Math.max(partner.money,0);
               }
               _loc1_ = Math.max(_loc1_,0 - _loc4_);
            }
            if(shop is Object && shopType != 1)
            {
               shop.money += _loc1_;
               partner.money += Math.abs(_loc1_) * partner.tax;
            }
            else
            {
               partner.money += _loc1_;
            }
            GD.Caravans[0].money -= _loc1_;
         }
         if(partner is Town)
         {
            for(_loc3_ in partners)
            {
               for(_loc5_ in partners[_loc3_].items)
               {
                  if(partners[_loc3_].items[_loc5_].item is Item)
                  {
                     _loc6_ = partners[_loc3_].items[_loc5_].price / partners[_loc3_].items[_loc5_].item.amount;
                     GD.addKnownPrice(partners[_loc3_].items[_loc5_].item.type,partner,shop,_loc6_,_loc3_ != 0);
                     if(_loc3_ == 1)
                     {
                        _loc7_ = GD.Caravans[0].findCargo(partners[_loc3_].items[_loc5_].item.type);
                        if(_loc7_.averagePrice == undefined)
                        {
                           _loc7_.averagePrice = _loc6_;
                        }
                        else
                        {
                           _loc7_.averagePrice = ((_loc7_.amount - partners[_loc3_].items[_loc5_].item.amount) * _loc7_.averagePrice + partners[_loc3_].items[_loc5_].item.amount * _loc6_) / _loc7_.amount;
                        }
                     }
                  }
               }
            }
         }
         for(_loc3_ in partners[1].items)
         {
            if(partners[1].items[_loc3_].item is Character)
            {
               GD.enslaveAPerson(partners[1].items[_loc3_].item);
            }
         }
         var _loc2_:* = 0;
         for(_loc3_ in partners[0].items)
         {
            if(partners[0].items[_loc3_].item is Item && partner is Town)
            {
               for(_loc5_ in partner.bannedGoods)
               {
                  if(partners[0].items[_loc3_].item.type == partner.bannedGoods[_loc5_])
                  {
                     _loc2_ += partners[0].items[_loc3_].item.totalWeight;
                     break;
                  }
               }
            }
         }
         if(_loc2_ > 0)
         {
            trace("selling " + _loc2_ + " of illegal goods");
            partner.illegalActions.push({
               "action":2,
               "amount":_loc2_,
               "smugglingSkill":GD.Caravans[0].smugglingSkill
            });
            GD.Caravans[0].distributeExperience("smugglingSkill","smugglingExperience",_loc2_ / 2);
         }
         for(_loc3_ in partners)
         {
            partners[_loc3_].items = [];
         }
         for(_loc3_ in GD.Caravans[0].Cargo)
         {
            if(GD.Caravans[0].Cargo[_loc3_].type == 97)
            {
               GD.Caravans[0].money += GD.Caravans[0].Cargo[_loc3_].amount;
               GD.Caravans[0].Cargo.splice(_loc3_,1);
               break;
            }
         }
         if(partner is Caravan)
         {
            for(_loc3_ in partner.Cargo)
            {
               if(partner.Cargo[_loc3_].type == 97)
               {
                  partner.money += partner.Cargo[_loc3_].amount;
                  partner.Cargo.splice(_loc3_,1);
                  break;
               }
            }
         }
         setPartner(partner,partnerSymbol,shop,shopType,free,blockedFilters,partnersName,setLimit,true,tradeButtonText);
      }
      
      public function takeAll() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < partners[1].array.length)
         {
            partners[1];
            if(partners[1].array[_loc1_] is Item)
            {
               doMove(partners[1],partners[1].array[_loc1_],partners[1].array[_loc1_].amount,true);
            }
            else
            {
               doMove(partners[1],partners[1].array[_loc1_],1,true);
            }
            _loc1_--;
            _loc1_++;
         }
         recalculateItemPrices();
         update();
      }
      
      public function pressClear() : *
      {
         clearAll();
      }
      
      public function takeMoney() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in partners[1].array)
         {
            if(partners[1].array[_loc1_] is Item && partners[1].array[_loc1_].type == 97)
            {
               doMove(partners[1],partners[1].array[_loc1_],partners[1].array[_loc1_].amount);
               break;
            }
         }
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         calculator.remove();
         calculator = null;
         removeEventListener("enterFrame",cursorControl);
         for(_loc1_ in partners)
         {
            if(partners[_loc1_].list is List)
            {
               partners[_loc1_].list.remove();
            }
            if(partners[_loc1_].area is ScrollableArea)
            {
               partners[_loc1_].area.remove();
            }
         }
         GD = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
   }
}

