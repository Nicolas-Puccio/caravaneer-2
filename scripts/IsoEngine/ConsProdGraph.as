package IsoEngine
{
   import Data.*;
   import Interface.*;
   import flash.display.Sprite;
   
   public class ConsProdGraph extends Sprite
   {
      
      public var totalWidth:*;
      
      public var totalHeight:*;
      
      public var periodSelectorEnabled:*;
      
      public var productsAreaWidth:*;
      
      public var productsAreaHeight:*;
      
      public var selectedPeriod:* = 1;
      
      public var maxPeriods:* = 3;
      
      public var data:*;
      
      public var players:*;
      
      public var products:*;
      
      public var productsArea:*;
      
      public var changePeriodButtons:*;
      
      public var periodText:*;
      
      public var noDataText:*;
      
      public var selectedItem:* = null;
      
      public var selectedItemSlot:* = null;
      
      public var vGraphTexts:*;
      
      public var hGraphTexts:*;
      
      public var graph:*;
      
      public var prodBox:*;
      
      public var prodText:*;
      
      public var consBox:*;
      
      public var consText:*;
      
      public var balanceText:*;
      
      public var borderColor:* = 5652004;
      
      public var productionColor:* = 2892436;
      
      public var consumptionColor:* = 12582912;
      
      public function ConsProdGraph(param1:* = 620, param2:* = 250, param3:* = null, param4:* = null, param5:* = true)
      {
         var _loc7_:* = undefined;
         super();
         totalWidth = param1;
         totalHeight = param2;
         periodSelectorEnabled = param5;
         if(totalWidth > 500)
         {
            productsAreaWidth = 200;
         }
         else
         {
            productsAreaWidth = Math.max(150,totalWidth - 300);
         }
         if(periodSelectorEnabled)
         {
            productsAreaHeight = totalHeight - 30;
         }
         else
         {
            productsAreaHeight = totalHeight;
         }
         if(param3 != null)
         {
            data = param3;
         }
         if(param4 != null)
         {
            players = param4;
         }
         noDataText = new EngineText(Texts.fetch(5957).toUpperCase(),borderColor,14,"center",10,totalHeight / 2 - 10,totalWidth - productsAreaWidth - 20,20);
         addChild(noDataText);
         graph = new Sprite();
         addChild(graph);
         var _loc6_:Sprite = new Sprite();
         _loc6_.graphics.lineStyle(1,borderColor);
         _loc6_.graphics.drawRect(totalWidth - productsAreaWidth,0,productsAreaWidth,productsAreaHeight);
         if(periodSelectorEnabled)
         {
            _loc6_.graphics.drawRect(totalWidth - productsAreaWidth,totalHeight - 20,productsAreaWidth,20);
         }
         productsArea = new ScrollableArea(productsAreaWidth - 10,productsAreaHeight,productsAreaWidth - 10,productsAreaHeight,true,false,false,3,10);
         productsArea.x = totalWidth - productsAreaWidth;
         productsArea.y = 0;
         addChild(productsArea);
         if(periodSelectorEnabled)
         {
            changePeriodButtons = [];
            periodText = new EngineText("",borderColor,14,"center",totalWidth - productsAreaWidth + 20,totalHeight - 20,productsAreaWidth - 40,20);
            addChild(periodText);
            _loc7_ = 0;
            while(_loc7_ <= 1)
            {
               changePeriodButtons[_loc7_] = {};
               changePeriodButtons[_loc7_].disp = new Sprite();
               changePeriodButtons[_loc7_].disp.blendMode = "layer";
               changePeriodButtons[_loc7_].bg = new Sprite();
               changePeriodButtons[_loc7_].bg.graphics.beginFill(borderColor);
               changePeriodButtons[_loc7_].bg.graphics.drawRect(0,0,20,20);
               changePeriodButtons[_loc7_].disp.addChild(changePeriodButtons[_loc7_].bg);
               changePeriodButtons[_loc7_].fg = new RepeatedGraphics(_loc7_ + 1);
               changePeriodButtons[_loc7_].fg.x = 10;
               changePeriodButtons[_loc7_].fg.y = 10;
               changePeriodButtons[_loc7_].fg.blendMode = "erase";
               changePeriodButtons[_loc7_].disp.addChild(changePeriodButtons[_loc7_].fg);
               changePeriodButtons[_loc7_].disp.y = totalHeight - 20;
               if(_loc7_ == 0)
               {
                  changePeriodButtons[_loc7_].disp.x = totalWidth - productsAreaWidth;
               }
               if(_loc7_ == 1)
               {
                  changePeriodButtons[_loc7_].disp.x = totalWidth - 20;
               }
               changePeriodButtons[_loc7_].disp.buttonMode = true;
               changePeriodButtons[_loc7_].disp.mouseChildren = false;
               changePeriodButtons[_loc7_].disp.addEventListener("click",pressChangePeriod,false,0,false);
               addChild(changePeriodButtons[_loc7_].disp);
               _loc7_++;
            }
         }
         addChild(_loc6_);
         prodBox = new Sprite();
         prodBox.graphics.lineStyle(1,borderColor);
         prodBox.graphics.beginFill(productionColor);
         prodBox.graphics.drawRect(0,0,10,10);
         prodBox.y = totalHeight - 15;
         addChild(prodBox);
         prodText = new EngineText(Texts.fetch(921).toUpperCase(),borderColor,10,"left",20,totalHeight - 15,200,20);
         prodText.width = prodText.textWidth + 5;
         prodText.y = totalHeight - prodText.textHeight / 2 - 12;
         addChild(prodText);
         consBox = new Sprite();
         consBox.graphics.lineStyle(1,borderColor);
         consBox.graphics.beginFill(consumptionColor);
         consBox.graphics.drawRect(0,0,10,10);
         consBox.y = totalHeight - 15;
         consBox.x = prodText.textWidth + 40;
         addChild(consBox);
         consText = new EngineText(Texts.fetch(922).toUpperCase(),borderColor,10,"left",prodText.textWidth + 60,totalHeight - 15,200,20);
         consText.width = consText.textWidth + 5;
         consText.y = totalHeight - consText.textHeight / 2 - 12;
         addChild(consText);
         balanceText = new EngineText("",borderColor,10,"right",0,totalHeight - 15,totalWidth - productsAreaWidth - 20,20);
         addChild(balanceText);
         updatePeriod();
      }
      
      public function pressChangePeriod(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc3_ in changePeriodButtons)
         {
            if(changePeriodButtons[_loc3_].disp == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(_loc2_ == 0)
         {
            selectedPeriod = Number(selectedPeriod) - 1;
         }
         else
         {
            selectedPeriod = Number(selectedPeriod) + 1;
         }
         if(selectedPeriod < 1)
         {
            selectedPeriod = maxPeriods;
         }
         if(selectedPeriod > maxPeriods)
         {
            selectedPeriod = 1;
         }
         updatePeriod();
      }
      
      public function updatePeriod() : *
      {
         if(periodSelectorEnabled)
         {
            switch(selectedPeriod)
            {
               case 1:
                  periodText.text = Texts.fetch(5925).toUpperCase();
                  break;
               case 2:
                  periodText.text = Texts.fetch(5926).toUpperCase();
                  break;
               case 3:
                  periodText.text = Texts.fetch(5956).toUpperCase();
            }
         }
         update();
      }
      
      public function update(param1:* = null, param2:* = null) : *
      {
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc8_:* = undefined;
         var _loc6_:* = undefined;
         if(param1 != null)
         {
            data = param1;
         }
         if(param2 != null)
         {
            players = param2;
         }
         productsArea.clearAll();
         if(!(data is Array) || data.length < 2)
         {
            emptyData();
            return;
         }
         var _loc3_:Array = [];
         for(_loc6_ in data)
         {
            if(players)
            {
               _loc5_ = data[_loc6_].playersProduction;
               _loc8_ = data[_loc6_].playersConsumption;
            }
            else
            {
               _loc5_ = data[_loc6_].production;
               _loc8_ = data[_loc6_].consumption;
            }
            for(_loc7_ in _loc5_)
            {
               if(_loc5_[_loc7_].amount > 0)
               {
                  _loc4_ = false;
                  for(_loc9_ in _loc3_)
                  {
                     if(_loc3_[_loc9_] == _loc5_[_loc7_].item)
                     {
                        _loc4_ = true;
                        break;
                     }
                  }
                  if(!_loc4_)
                  {
                     _loc3_.push(_loc5_[_loc7_].item);
                  }
               }
            }
            for(_loc7_ in _loc8_)
            {
               if(_loc8_[_loc7_].amount > 0)
               {
                  _loc4_ = false;
                  for(_loc9_ in _loc3_)
                  {
                     if(_loc3_[_loc9_] == _loc8_[_loc7_].item)
                     {
                        _loc4_ = true;
                        break;
                     }
                  }
                  if(!_loc4_)
                  {
                     _loc3_.push(_loc8_[_loc7_].item);
                  }
               }
            }
         }
         products = [];
         if(_loc3_.length == 0)
         {
            emptyData();
            return;
         }
         for(_loc6_ in _loc3_)
         {
            products[_loc6_] = {};
            products[_loc6_].item = _loc3_[_loc6_];
            products[_loc6_].normalText = new Sprite();
            products[_loc6_].normalText.addChild(new EngineText(new Item(_loc3_[_loc6_],1).name.toUpperCase(),borderColor,12,"center",0,1,productsAreaWidth - 10,20));
            products[_loc6_].normalText.y = _loc6_ * 20;
            products[_loc6_].normalText.mouseChildren = false;
            products[_loc6_].normalText.buttonMode = true;
            products[_loc6_].normalTextHit = new Sprite();
            products[_loc6_].normalTextHit.graphics.beginFill(16711680);
            products[_loc6_].normalTextHit.graphics.drawRect(0,0,productsAreaWidth - 10,20);
            products[_loc6_].normalText.addChild(products[_loc6_].normalTextHit);
            products[_loc6_].normalTextHit.visible = false;
            products[_loc6_].normalText.hitArea = products[_loc6_].normalTextHit;
            productsArea.addContent(products[_loc6_].normalText,null,null,null,null,true);
            products[_loc6_].normalText.addEventListener("click",clickProduct,false,0,false);
            products[_loc6_].inverseText = new Sprite();
            products[_loc6_].inverseText.blendMode = "layer";
            products[_loc6_].inverseTextBG = new Sprite();
            products[_loc6_].inverseTextBG.graphics.beginFill(borderColor);
            products[_loc6_].inverseTextBG.graphics.drawRect(0,0,productsAreaWidth - 10,20);
            products[_loc6_].inverseText.addChild(products[_loc6_].inverseTextBG);
            products[_loc6_].inverseTextText = new EngineText(new Item(_loc3_[_loc6_],1).name.toUpperCase(),borderColor,12,"center",0,1,productsAreaWidth - 10,20);
            products[_loc6_].inverseTextTextContainer = new Sprite();
            products[_loc6_].inverseTextTextContainer.addChild(products[_loc6_].inverseTextText);
            products[_loc6_].inverseTextTextContainer.blendMode = "erase";
            products[_loc6_].inverseText.addChild(products[_loc6_].inverseTextTextContainer);
            products[_loc6_].inverseText.y = _loc6_ * 20;
            productsArea.addContent(products[_loc6_].inverseText,null,null,null,null,true);
         }
         productsArea.updateSize();
         noDataText.visible = false;
         updateSelected();
      }
      
      public function emptyData() : *
      {
         productsArea.updateSize();
         graph.graphics.clear();
         noDataText.visible = true;
         balanceText.text = "";
      }
      
      public function clickProduct(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc2_ in products)
         {
            if(param1.target == products[_loc2_].normalText)
            {
               selectedItem = products[_loc2_].item;
               break;
            }
         }
         updateSelected();
      }
      
      public function updateSelected() : *
      {
         var _loc1_:* = undefined;
         if(selectedItem != null)
         {
            for(_loc1_ in products)
            {
               if(products[_loc1_].item == selectedItem)
               {
                  selectedItemSlot = _loc1_;
                  break;
               }
            }
         }
         if(selectedItemSlot >= products.length)
         {
            selectedItemSlot = products.length - 1;
         }
         if(selectedItemSlot == null)
         {
            selectedItemSlot = 0;
         }
         for(_loc1_ in products)
         {
            products[_loc1_].inverseText.visible = _loc1_ == selectedItemSlot;
            products[_loc1_].normalText.visible = _loc1_ != selectedItemSlot;
         }
         selectedItem = products[selectedItemSlot].item;
         updateGraph();
      }
      
      public function updateGraph() : *
      {
         var _loc17_:* = undefined;
         var _loc19_:* = undefined;
         var _loc4_:* = undefined;
         var _loc1_:* = undefined;
         var _loc18_:* = undefined;
         var _loc28_:* = undefined;
         var _loc25_:* = undefined;
         var _loc16_:* = undefined;
         var _loc11_:* = undefined;
         var _loc14_:* = undefined;
         var _loc2_:* = undefined;
         var _loc27_:* = undefined;
         var _loc8_:* = undefined;
         var _loc24_:* = undefined;
         var _loc22_:* = undefined;
         var _loc26_:* = undefined;
         var _loc29_:* = undefined;
         var _loc7_:* = undefined;
         var _loc12_:* = undefined;
         var _loc15_:* = undefined;
         var _loc13_:* = undefined;
         var _loc23_:* = undefined;
         var _loc10_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc20_:* = 0;
         var _loc3_:* = 0;
         if(selectedPeriod == 1)
         {
            _loc4_ = 2592000;
         }
         if(selectedPeriod == 2)
         {
            _loc4_ = 15768000;
         }
         if(selectedPeriod == 3)
         {
            _loc4_ = data[0].time - data[data.length - 1].time;
         }
         _loc16_ = 1;
         while(_loc16_ < data.length)
         {
            _loc3_ += data[_loc16_ - 1].time - data[_loc16_].time;
            _loc16_++;
         }
         _loc28_ = _loc3_ / (data.length - 1);
         for(_loc16_ in data)
         {
            if(data[0].time - data[_loc16_].time <= _loc4_)
            {
               if(players)
               {
                  _loc1_ = data[_loc16_].playersProduction;
                  _loc18_ = data[_loc16_].playersConsumption;
               }
               else
               {
                  _loc1_ = data[_loc16_].production;
                  _loc18_ = data[_loc16_].consumption;
               }
               for(_loc17_ in _loc1_)
               {
                  if(_loc1_[_loc17_].item == selectedItem && _loc1_[_loc17_].amount > _loc20_)
                  {
                     _loc20_ = _loc1_[_loc17_].amount;
                  }
               }
               for(_loc17_ in _loc18_)
               {
                  if(_loc18_[_loc17_].item == selectedItem && _loc18_[_loc17_].amount > _loc20_)
                  {
                     _loc20_ = _loc18_[_loc17_].amount;
                  }
               }
            }
         }
         _loc20_ = _loc20_ / _loc28_ * 86400;
         if(vGraphTexts is Array)
         {
            for(_loc16_ in vGraphTexts)
            {
               removeChild(vGraphTexts[_loc16_].text);
            }
         }
         vGraphTexts = [];
         if(_loc20_ > 1000)
         {
            _loc29_ = 1000;
         }
         else if(_loc20_ > 100)
         {
            _loc29_ = 100;
         }
         else if(_loc20_ > 10)
         {
            _loc29_ = 10;
         }
         else if(_loc20_ > 1)
         {
            _loc29_ = 1;
         }
         else if(_loc20_ >= 0.1)
         {
            _loc29_ = 0.1;
         }
         else
         {
            _loc29_ = 0.01;
         }
         _loc11_ = 0;
         _loc16_ = _loc29_;
         while(_loc16_ <= _loc20_)
         {
            vGraphTexts.push({
               "text":new EngineText(Math.round(_loc16_ * 100) / 100,borderColor,10,"right",0,0,500,20),
               "val":_loc16_
            });
            if(vGraphTexts[vGraphTexts.length - 1].text.textWidth > _loc11_)
            {
               _loc11_ = vGraphTexts[vGraphTexts.length - 1].text.textWidth;
            }
            _loc16_ += _loc29_;
         }
         for(_loc16_ in vGraphTexts)
         {
            vGraphTexts[_loc16_].text.width = _loc11_ + 5;
         }
         _loc14_ = totalWidth - productsAreaWidth - _loc11_ - 25;
         _loc27_ = _loc11_ + 5;
         if(hGraphTexts is Array)
         {
            for(_loc16_ in hGraphTexts)
            {
               removeChild(hGraphTexts[_loc16_].text);
            }
         }
         hGraphTexts = [];
         if(_loc4_ >= 86400)
         {
            _loc29_ = Math.ceil(_loc4_ / (_loc14_ / 20) / 86400) * 86400;
         }
         else
         {
            _loc29_ = 3600;
         }
         _loc11_ = 0;
         _loc16_ = Math.ceil((data[0].time - _loc4_) / _loc29_) * _loc29_;
         while(_loc16_ <= data[0].time)
         {
            _loc24_ = GameData.staticMakeDate(_loc16_);
            if(_loc29_ == 3600)
            {
               hGraphTexts.push({
                  "text":new EngineText(_loc24_.Hour + ":" + _loc24_.Minute2d,borderColor,8,"right",0,0,500,20),
                  "val":_loc16_
               });
            }
            else
            {
               hGraphTexts.push({
                  "text":new EngineText(_loc24_.Day + "-" + _loc24_.ShortMonthName + "-" + _loc24_.Year2d,borderColor,8,"right",0,0,500,20),
                  "val":_loc16_
               });
            }
            if(hGraphTexts[hGraphTexts.length - 1].text.textWidth > _loc11_)
            {
               _loc11_ = hGraphTexts[hGraphTexts.length - 1].text.textWidth;
            }
            _loc16_ += _loc29_;
         }
         for(_loc16_ in hGraphTexts)
         {
            hGraphTexts[_loc16_].text.width = _loc11_ + 5;
         }
         _loc2_ = totalHeight - _loc11_ - 35;
         _loc8_ = _loc2_;
         _loc22_ = _loc14_ / _loc4_;
         _loc26_ = _loc2_ / _loc20_;
         graph.graphics.clear();
         graph.graphics.lineStyle(1,borderColor,0.2);
         for(_loc16_ in vGraphTexts)
         {
            vGraphTexts[_loc16_].text.y = _loc8_ - vGraphTexts[_loc16_].val * _loc26_ - vGraphTexts[_loc16_].text.textHeight / 2 - 2;
            graph.graphics.moveTo(_loc27_,_loc8_ - vGraphTexts[_loc16_].val * _loc26_);
            graph.graphics.lineTo(totalWidth - productsAreaWidth - 20,_loc8_ - vGraphTexts[_loc16_].val * _loc26_);
            addChild(vGraphTexts[_loc16_].text);
         }
         for(_loc16_ in hGraphTexts)
         {
            hGraphTexts[_loc16_].text.x = _loc27_ + (hGraphTexts[_loc16_].val - data[0].time + _loc4_) * _loc22_ - hGraphTexts[_loc16_].text.textHeight / 2 - 2;
            graph.graphics.moveTo(_loc27_ + (hGraphTexts[_loc16_].val - data[0].time + _loc4_) * _loc22_,0);
            graph.graphics.lineTo(_loc27_ + (hGraphTexts[_loc16_].val - data[0].time + _loc4_) * _loc22_,_loc8_);
            hGraphTexts[_loc16_].text.y = totalHeight - 30;
            hGraphTexts[_loc16_].text.rotation = -90;
            addChild(hGraphTexts[_loc16_].text);
         }
         var _loc9_:* = 0;
         var _loc21_:* = 0;
         _loc19_ = 1;
         while(_loc19_ <= 2)
         {
            _loc23_ = null;
            for(_loc16_ in data)
            {
               if(players)
               {
                  if(_loc19_ == 1)
                  {
                     _loc7_ = data[_loc16_].playersProduction;
                  }
                  else
                  {
                     _loc7_ = data[_loc16_].playersConsumption;
                  }
               }
               else if(_loc19_ == 1)
               {
                  _loc7_ = data[_loc16_].production;
               }
               else
               {
                  _loc7_ = data[_loc16_].consumption;
               }
               _loc15_ = _loc12_;
               _loc12_ = 0;
               for(_loc17_ in _loc7_)
               {
                  if(_loc7_[_loc17_].item == selectedItem)
                  {
                     _loc13_ = _loc7_[_loc17_].amount;
                     if(_loc19_ == 1)
                     {
                        _loc9_ += _loc13_;
                     }
                     else
                     {
                        _loc21_ += _loc13_;
                     }
                     _loc12_ = _loc7_[_loc17_].amount / _loc28_ * 86400;
                     break;
                  }
               }
               if(_loc16_ == 0)
               {
                  if(_loc19_ == 1)
                  {
                     graph.graphics.lineStyle(2,productionColor,0.8);
                  }
                  else
                  {
                     graph.graphics.lineStyle(2,consumptionColor,0.6);
                  }
                  graph.graphics.moveTo(_loc27_ + _loc4_ * _loc22_,_loc8_ - _loc12_ * _loc26_);
               }
               else
               {
                  if(data[0].time - data[_loc16_].time > _loc4_)
                  {
                     _loc23_ = _loc16_;
                     break;
                  }
                  graph.graphics.lineTo(_loc27_ + (data[_loc16_].time - data[0].time + _loc4_) * _loc22_,_loc8_ - _loc12_ * _loc26_);
               }
            }
            if(_loc23_ != null)
            {
               _loc10_ = MathFunctions.co2ab(data[_loc23_ - 1].time - data[0].time + _loc4_,_loc15_,data[_loc16_].time - data[_loc23_].time + _loc4_,_loc12_).b;
               graph.graphics.lineTo(_loc27_,_loc8_ - _loc10_ * _loc26_);
            }
            _loc19_++;
         }
         graph.graphics.lineStyle(1,borderColor);
         graph.graphics.moveTo(0,_loc8_);
         graph.graphics.lineTo(totalWidth - productsAreaWidth - 20,_loc8_);
         graph.graphics.moveTo(_loc27_,0);
         graph.graphics.lineTo(_loc27_,totalHeight - 30);
         _loc6_ = _loc9_ - _loc21_;
         if(Math.abs(_loc6_) > 100)
         {
            _loc5_ = MathFunctions.NumberFormat(_loc6_,0,true);
         }
         else if(Math.abs(_loc6_) > 10)
         {
            _loc5_ = MathFunctions.NumberFormat(_loc6_,1,true);
         }
         else if(Math.abs(_loc6_) > 1)
         {
            _loc5_ = MathFunctions.NumberFormat(_loc6_,2,true);
         }
         else
         {
            _loc5_ = MathFunctions.NumberFormat(_loc6_,3,true);
         }
         if(_loc6_ > 0)
         {
            _loc5_ = "+" + _loc5_;
         }
         balanceText.text = Texts.fetch(5958).toUpperCase() + ": " + _loc5_;
         balanceText.y = totalHeight - balanceText.textHeight / 2 - 12;
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in changePeriodButtons)
         {
            changePeriodButtons[_loc1_].disp.buttonMode = false;
            changePeriodButtons[_loc1_].disp.removeChild(changePeriodButtons[_loc1_].bg);
            changePeriodButtons[_loc1_].disp.removeChild(changePeriodButtons[_loc1_].fg);
            changePeriodButtons[_loc1_].disp = null;
         }
         for(_loc1_ in products)
         {
            products[_loc1_].normalText.removeEventListener("click",clickProduct);
            products[_loc1_].inverseText.removeChild(products[_loc1_].inverseTextBG);
            products[_loc1_].inverseTextTextContainer.removeChild(products[_loc1_].inverseTextText);
            products[_loc1_].inverseText.removeChild(products[_loc1_].inverseTextTextContainer);
         }
         productsArea.remove();
         productsArea = null;
         data = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
   }
}

