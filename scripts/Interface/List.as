package Interface
{
   import IsoEngine.Character;
   import IsoEngine.EngineText;
   import IsoEngine.GameData;
   import IsoEngine.Item;
   import IsoEngine.TransportUnit;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.utils.getDefinitionByName;
   
   public class List extends Sprite
   {
      
      public var scrollableArea:*;
      
      public var fullList:*;
      
      public var finalList:*;
      
      public var selectedItem:* = 0;
      
      public var onSelect:*;
      
      public var onDoubleClick:*;
      
      public var onEmptyList:*;
      
      public var Filters:*;
      
      public var listSize:*;
      
      public var vertical:*;
      
      public var unselectable:*;
      
      public var showInUse:*;
      
      public var selectFrameColor:*;
      
      public var picBGColor:*;
      
      public var selectFrameSize:*;
      
      public var selectFrameAlpha:*;
      
      public var time:*;
      
      public var alwaysAllow:*;
      
      private var filterButtonsArr:*;
      
      private var filterValues:*;
      
      public function List(param1:*, param2:*, param3:* = true, param4:* = null, param5:* = null, param6:* = null, param7:* = null, param8:* = false, param9:* = false, param10:* = false, param11:* = false, param12:* = 5788752, param13:* = 16777215, param14:* = 5, param15:* = 0.2, param16:* = null)
      {
         var totalWidth:*;
         var totalHeight:*;
         var areaWidth:*;
         var areaHeight:*;
         var areaX:*;
         var areaY:*;
         var areaWithScrollbarWidth:*;
         var areaWithScrollbarHeight:*;
         var maxButtsPerRow:*;
         var i:*;
         var $class:*;
         var $data:*;
         var filterIcons:*;
         var rows:*;
         var col:*;
         var thisRowCols:*;
         var colWidth:*;
         var n:*;
         var buttWidth:*;
         var buttHeight:*;
         var row:*;
         var remainingButts:*;
         var remainingRows:*;
         var areaBG:*;
         var frame:*;
         var items:* = param1;
         var size:* = param2;
         var setVertical:* = param3;
         var filterButtons:* = param4;
         var disableFilters:* = param5;
         var onSelectFunction:* = param6;
         var setListSize:* = param7;
         var omitBG:* = param8;
         var omitFrame:* = param9;
         var makeUnselectable:* = param10;
         var setShowInUse:* = param11;
         var _picBGColor:* = param12;
         var _selectFrameColor:* = param13;
         var _selectFrameSize:* = param14;
         var _selectFrameAlpha:* = param15;
         var _alwaysAllow:* = param16;
         filterButtonsArr = [];
         filterValues = [];
         super();
         maxButtsPerRow = 5;
         selectFrameColor = _selectFrameColor;
         picBGColor = _picBGColor;
         selectFrameSize = _selectFrameSize;
         selectFrameAlpha = _selectFrameAlpha;
         alwaysAllow = _alwaysAllow;
         filterValues = filterButtons;
         showInUse = setShowInUse;
         filterIcons = [];
         if(setListSize == null)
         {
            listSize = 100;
         }
         else
         {
            listSize = setListSize;
         }
         vertical = setVertical;
         unselectable = makeUnselectable;
         Filters = {
            "people":true,
            "volunteers":true,
            "mercenaries":true,
            "prisoners":true,
            "slaves":true,
            "other":true,
            "transport":true,
            "animals":true,
            "carts":true,
            "cars":true,
            "items":true,
            "weapons":true,
            "ammo":true,
            "armor":true,
            "attachments":true,
            "food":true,
            "devices":true,
            "tools":true,
            "liquids":true,
            "liquidscontainers":true,
            "miscellaneous":true,
            "market":true,
            "firstaid":true
         };
         if(disableFilters is Array)
         {
            for(i in disableFilters)
            {
               Filters[disableFilters[i]] = false;
            }
         }
         fullList = [];
         rows = Math.ceil(filterButtons.length / maxButtsPerRow);
         remainingButts = filterButtons.length;
         remainingRows = rows;
         row = 0;
         while(row < rows)
         {
            thisRowCols = Math.round(remainingButts / remainingRows);
            colWidth = listSize / thisRowCols;
            col = 0;
            while(col < thisRowCols)
            {
               if(vertical)
               {
                  buttWidth = colWidth;
                  buttHeight = 20;
               }
               else
               {
                  buttWidth = 20;
                  buttHeight = colWidth;
               }
               n = filterButtonsArr.push(new Switch(3,Filters[filterButtons[filterButtons.length - remainingButts]],switchFilter,switchFilter,null,null,buttWidth,buttHeight,false,doubleClickFilter)) - 1;
               if(filterValues[n] == "tools")
               {
                  $class = getDefinitionByName("filtericonmechanicalshop") as Class;
               }
               else
               {
                  $class = getDefinitionByName("filtericon" + filterValues[n]) as Class;
               }
               $data = new $class() as Sprite;
               filterIcons[n] = $data;
               if(vertical)
               {
                  filterButtonsArr[n].x = colWidth * col;
                  filterButtonsArr[n].y = row * 20;
                  filterIcons[n].x = filterButtonsArr[n].x + colWidth / 2;
                  filterIcons[n].y = filterButtonsArr[n].y + 10;
               }
               else
               {
                  filterButtonsArr[n].y = colWidth * col;
                  filterButtonsArr[n].x = row * 20;
                  filterIcons[n].y = filterButtonsArr[n].y + colWidth / 2;
                  filterIcons[n].x = filterButtonsArr[n].x + 10;
               }
               addChild(filterButtonsArr[n]);
               filterIcons[n].scaleX = filterIcons[n].scaleY = 0.4;
               filterIcons[n].alpha = 0.3;
               filterIcons[n].mouseEnabled = false;
               addChild(filterIcons[n]);
               remainingButts = Number(remainingButts) - 1;
               col = Number(col) + 1;
            }
            remainingRows = Number(remainingRows) - 1;
            row = Number(row) + 1;
         }
         if(vertical)
         {
            totalWidth = listSize;
            totalHeight = size;
            areaX = 0;
            areaY = rows * 20;
            if(rows > 0)
            {
               areaY += 1;
            }
            areaWidth = totalWidth - 10;
            areaHeight = totalHeight - areaY;
            areaWithScrollbarWidth = areaWidth + 10;
            areaWithScrollbarHeight = areaHeight;
         }
         else
         {
            totalWidth = size;
            totalHeight = listSize;
            areaX = rows * 20;
            if(rows > 0)
            {
               areaX += 1;
            }
            areaY = 0;
            areaWidth = totalWidth - areaX;
            areaHeight = totalHeight - 10;
            areaWithScrollbarWidth = areaWidth;
            areaWithScrollbarHeight = areaHeight + 10;
         }
         if(!omitBG)
         {
            areaBG = new Sprite();
            areaBG.graphics.beginFill(4208688,0.7);
            areaBG.graphics.drawRect(areaX,areaY,areaWithScrollbarWidth,areaWithScrollbarHeight);
            addChild(areaBG);
         }
         if(!omitFrame)
         {
            frame = new Sprite();
            frame.graphics.lineStyle(1,16777215,0.3);
            frame.graphics.moveTo(areaX - 1,areaY + areaWithScrollbarHeight + 1);
            frame.graphics.lineTo(areaX + areaWithScrollbarWidth + 1,areaY + areaWithScrollbarHeight + 1);
            frame.graphics.lineTo(areaX + areaWithScrollbarWidth + 1,areaY - 1);
            frame.graphics.lineStyle(1,0,0.6);
            frame.graphics.lineTo(areaX - 1,areaY - 1);
            frame.graphics.lineTo(areaX - 1,areaY + areaWithScrollbarHeight + 1);
            addChild(frame);
         }
         scrollableArea = new ScrollableArea(areaWidth,areaHeight,areaWidth,areaHeight,vertical,!vertical,false,3,10);
         scrollableArea.x = areaX;
         scrollableArea.y = areaY;
         addChild(scrollableArea);
         for(i in items)
         {
            fullList.push(items[i]);
         }
         if(onSelectFunction == null)
         {
            onSelect = defaultOnSelect;
         }
         else
         {
            onSelect = onSelectFunction;
         }
         onDoubleClick = function(param1:*):*
         {
         };
         update();
      }
      
      private function switchFilter(param1:* = null) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in filterButtonsArr)
         {
            if(filterButtonsArr[_loc3_] == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         Filters[filterValues[_loc2_]] = !Filters[filterValues[_loc2_]];
         update();
      }
      
      private function doubleClickFilter(param1:* = null) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in filterButtonsArr)
         {
            Filters[filterValues[_loc3_]] = filterButtonsArr[_loc3_] == param1;
            filterButtonsArr[_loc3_].position = filterButtonsArr[_loc3_].onImage.visible = Filters[filterValues[_loc3_]];
            filterButtonsArr[_loc3_].offImage.visible = !Filters[filterValues[_loc3_]];
         }
         update();
      }
      
      private function defaultOnSelect(param1:*) : *
      {
         trace("item selected");
      }
      
      public function update(param1:* = null) : *
      {
         var _loc10_:* = undefined;
         _loc10_ = 10;
         var _loc6_:* = undefined;
         var _loc8_:* = undefined;
         var _loc2_:* = undefined;
         var _loc14_:* = undefined;
         var _loc4_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc13_:* = undefined;
         var _loc7_:* = undefined;
         var _loc16_:* = undefined;
         var _loc9_:* = undefined;
         var _loc11_:Number = selectFrameSize / ((listSize - 30) / 250);
         if(param1 is Array)
         {
            fullList = [];
            for(_loc4_ in param1)
            {
               fullList.push(param1[_loc4_]);
            }
         }
         var _loc12_:Array = ["volunteers","mercenaries","prisoners","slaves","other","market","food","liquids","liquidscontainers","devices","tools","miscellaneous","weapons","ammo","armor","attachments","firstaid","animals","carts","cars"];
         if(finalList is Array && finalList.length > 0)
         {
            _loc14_ = finalList[selectedItem].item;
         }
         scrollableArea.clearAll();
         finalList = [];
         for(_loc6_ in _loc12_)
         {
            if(Filters[_loc12_[_loc6_]])
            {
               for(_loc4_ in fullList)
               {
                  _loc2_ = false;
                  if(fullList[_loc4_] is Character && Filters.people)
                  {
                     switch(_loc12_[_loc6_])
                     {
                        case "volunteers":
                           _loc2_ = fullList[_loc4_].category == 1;
                           break;
                        case "mercenaries":
                           _loc2_ = fullList[_loc4_].category == 2;
                           break;
                        case "prisoners":
                           _loc2_ = fullList[_loc4_].category == 3;
                           break;
                        case "slaves":
                           _loc2_ = fullList[_loc4_].category == 4;
                           break;
                        case "other":
                           _loc2_ = fullList[_loc4_].category >= 5;
                     }
                  }
                  if(fullList[_loc4_] is Item && Filters.items)
                  {
                     switch(_loc12_[_loc6_])
                     {
                        case "weapons":
                           _loc2_ = fullList[_loc4_].category == 2;
                           break;
                        case "ammo":
                           _loc2_ = fullList[_loc4_].category == 3;
                           break;
                        case "armor":
                           _loc2_ = fullList[_loc4_].category == 5;
                           break;
                        case "attachments":
                           _loc2_ = fullList[_loc4_].category == 4;
                           break;
                        case "firstaid":
                           _loc2_ = fullList[_loc4_].category == 1 && fullList[_loc4_].itemData.firstAidKit;
                           break;
                        case "food":
                           _loc2_ = fullList[_loc4_].category == 1 && fullList[_loc4_].itemData.food;
                           break;
                        case "devices":
                           _loc2_ = fullList[_loc4_].category == 1 && fullList[_loc4_].itemData.device;
                           break;
                        case "tools":
                           _loc2_ = fullList[_loc4_].category == 1 && fullList[_loc4_].tool;
                           break;
                        case "liquids":
                           _loc2_ = fullList[_loc4_].category == 1 && fullList[_loc4_].itemData.liquid && (!fullList[_loc4_].itemData.food || !Filters["food"]);
                           break;
                        case "liquidscontainers":
                           _loc2_ = fullList[_loc4_].category == 1 && fullList[_loc4_].itemData.liquidsContainer;
                           break;
                        case "miscellaneous":
                           _loc2_ = fullList[_loc4_].category == 1 && !fullList[_loc4_].itemData.firstAidKit && !fullList[_loc4_].itemData.food && !fullList[_loc4_].itemData.device && !fullList[_loc4_].itemData.liquid && !fullList[_loc4_].itemData.liquidsContainer && !fullList[_loc4_].tool && !fullList[_loc4_].itemData.market;
                           break;
                        case "market":
                           _loc2_ = fullList[_loc4_].category == 1 && fullList[_loc4_].itemData.market && (!fullList[_loc4_].itemData.food || !Filters["food"]) && (!fullList[_loc4_].itemData.liquid || !Filters["liquids"]);
                     }
                  }
                  if(fullList[_loc4_] is TransportUnit && Filters.transport)
                  {
                     switch(_loc12_[_loc6_])
                     {
                        case "animals":
                           _loc2_ = fullList[_loc4_].category == 1;
                           break;
                        case "carts":
                           _loc2_ = fullList[_loc4_].category == 2;
                           break;
                        case "cars":
                           _loc2_ = fullList[_loc4_].category == 3;
                     }
                  }
                  if(fullList[_loc4_] is Item)
                  {
                     _loc2_ &&= fullList[_loc4_].amount - fullList[_loc4_].inUse >= 0.05 || showInUse && fullList[_loc4_].amount >= 0.05;
                  }
                  for(_loc8_ in finalList)
                  {
                     if(finalList[_loc8_].item == fullList[_loc4_])
                     {
                        _loc2_ = false;
                        break;
                     }
                  }
                  if(_loc2_)
                  {
                     finalList.push({
                        "item":fullList[_loc4_],
                        "pic":new Sprite()
                     });
                     if(finalList[finalList.length - 1].item == _loc14_)
                     {
                        selectedItem = finalList.length - 1;
                     }
                  }
               }
            }
         }
         if(alwaysAllow is Array)
         {
            for(_loc4_ in fullList)
            {
               for(_loc6_ in alwaysAllow)
               {
                  if(alwaysAllow[_loc6_] == fullList[_loc4_].type)
                  {
                     _loc2_ = fullList[_loc4_].amount - fullList[_loc4_].inUse >= 0.05 || showInUse && fullList[_loc4_].amount >= 0.05;
                     for(_loc8_ in finalList)
                     {
                        if(finalList[_loc8_].item == fullList[_loc4_])
                        {
                           _loc2_ = false;
                           break;
                        }
                     }
                     if(_loc2_)
                     {
                        finalList.push({
                           "item":fullList[_loc4_],
                           "pic":new Sprite()
                        });
                        if(finalList[finalList.length - 1].item == _loc14_)
                        {
                           selectedItem = finalList.length - 1;
                        }
                     }
                     break;
                  }
               }
            }
         }
         var _loc15_:Array = [];
         if(selectedItem >= finalList.length)
         {
            selectedItem = finalList.length - 1;
         }
         if(selectedItem <= 0)
         {
            selectedItem = 0;
         }
         for(_loc4_ in finalList)
         {
            finalList[_loc4_].selectFrame = new Sprite();
            finalList[_loc4_].selectFrame.graphics.beginFill(selectFrameColor,selectFrameAlpha);
            finalList[_loc4_].selectFrame.graphics.moveTo(0 - _loc11_,10 - _loc11_);
            finalList[_loc4_].selectFrame.graphics.curveTo(0 - _loc11_,0 - _loc11_,10 - _loc11_,0 - _loc11_);
            finalList[_loc4_].selectFrame.graphics.lineTo(250 - 10 + _loc11_,0 - _loc11_);
            finalList[_loc4_].selectFrame.graphics.curveTo(250 + _loc11_,0 - _loc11_,250 + _loc11_,10 - _loc11_);
            finalList[_loc4_].selectFrame.graphics.lineTo(250 + _loc11_,250 - 10 + _loc11_);
            finalList[_loc4_].selectFrame.graphics.curveTo(250 + _loc11_,250 + _loc11_,250 - 10 + _loc11_,250 + _loc11_);
            finalList[_loc4_].selectFrame.graphics.lineTo(10 - _loc11_,250 + _loc11_);
            finalList[_loc4_].selectFrame.graphics.curveTo(0 - _loc11_,250 + _loc11_,0 - _loc11_,250 - 10 + _loc11_);
            finalList[_loc4_].selectFrame.graphics.endFill();
            finalList[_loc4_].pic.addChild(finalList[_loc4_].selectFrame);
            finalList[_loc4_].selectFrame.visible = !unselectable && _loc4_ == selectedItem;
            _loc15_[_loc4_] = new Sprite();
            _loc15_[_loc4_].graphics.beginFill(picBGColor,0.8);
            _loc15_[_loc4_].graphics.moveTo(0,10);
            _loc15_[_loc4_].graphics.curveTo(0,0,10,0);
            _loc15_[_loc4_].graphics.lineTo(250 - 10,0);
            _loc15_[_loc4_].graphics.curveTo(250,0,250,10);
            _loc15_[_loc4_].graphics.lineTo(250,250 - 10);
            _loc15_[_loc4_].graphics.curveTo(250,250,250 - 10,250);
            _loc15_[_loc4_].graphics.lineTo(10,250);
            _loc15_[_loc4_].graphics.curveTo(0,250,0,250 - 10);
            _loc15_[_loc4_].graphics.endFill();
            finalList[_loc4_].pic.addChild(_loc15_[_loc4_]);
            if(finalList[_loc4_].item is Character)
            {
               finalList[_loc4_].pic.addChild(new Bitmap(finalList[_loc4_].item.generatePortrait()));
               switch(finalList[_loc4_].item.category)
               {
                  case 1:
                     finalList[_loc4_].typeSymbol = new filtericonvolunteers();
                     break;
                  case 2:
                     finalList[_loc4_].typeSymbol = new filtericonmercenaries();
                     break;
                  case 3:
                     finalList[_loc4_].typeSymbol = new filtericonprisoners();
                     break;
                  case 4:
                     finalList[_loc4_].typeSymbol = new filtericonslaves();
                     break;
                  default:
                     finalList[_loc4_].typeSymbol = new filtericonother();
               }
               finalList[_loc4_].typeSymbol.x = 210;
               finalList[_loc4_].typeSymbol.y = 210;
               finalList[_loc4_].typeSymbol.scaleX = finalList[_loc4_].typeSymbol.scaleY = 1.5;
               finalList[_loc4_].typeSymbol.alpha = 0.5;
               finalList[_loc4_].pic.addChild(finalList[_loc4_].typeSymbol);
               finalList[_loc4_].healthBar = new Sprite();
               finalList[_loc4_].healthBar.graphics.lineStyle(0.1,16777215);
               finalList[_loc4_].healthBar.graphics.drawRect(0,0,130,20);
               finalList[_loc4_].healthBar.graphics.lineStyle(0,0);
               finalList[_loc4_].healthBar.graphics.beginFill(16777215);
               finalList[_loc4_].healthBar.graphics.drawRect(3,3,124 * (finalList[_loc4_].item.HP / finalList[_loc4_].item.maxHP),14);
               finalList[_loc4_].healthBar.graphics.endFill();
               finalList[_loc4_].healthBar.x = 20;
               finalList[_loc4_].healthBar.y = 210;
               finalList[_loc4_].healthBar.alpha = 0.5;
               finalList[_loc4_].pic.addChild(finalList[_loc4_].healthBar);
               _loc3_ = [];
               if(finalList[_loc4_].item.eyeDamage)
               {
                  _loc3_.push(new IndicatorEyeDamage());
               }
               if(finalList[_loc4_].item.armDamage)
               {
                  _loc3_.push(new IndicatorArmDamage());
               }
               if(finalList[_loc4_].item.legDamage)
               {
                  _loc3_.push(new IndicatorLegDamage());
               }
               _loc5_ = 30;
               for(_loc6_ in _loc3_)
               {
                  _loc3_[_loc6_].x = _loc5_;
                  _loc3_[_loc6_].y = 30;
                  _loc3_[_loc6_].scaleX = _loc3_[_loc6_].scaleY = 0.5;
                  _loc3_[_loc6_].transform.colorTransform = new ColorTransform(1,1,1,0.5,255,255,255,0);
                  finalList[_loc4_].pic.addChild(_loc3_[_loc6_]);
                  _loc5_ += 50;
               }
               if(finalList[_loc4_].item.studyTime != undefined && time != undefined)
               {
                  finalList[_loc4_].studySign = new Sprite();
                  if(finalList[_loc4_].item.startedStudying + finalList[_loc4_].item.studyTime > time)
                  {
                     finalList[_loc4_].studySign.graphics.lineStyle(1,16777215);
                     finalList[_loc4_].studySign.graphics.drawCircle(0,0,20);
                     finalList[_loc4_].studyInnerCircle = new Sprite();
                     finalList[_loc4_].studyInnerCircle.graphics.beginFill(16777215);
                     finalList[_loc4_].studyInnerCircle.graphics.drawCircle(0,0,15);
                     finalList[_loc4_].studySign.addChild(finalList[_loc4_].studyInnerCircle);
                     finalList[_loc4_].studyMask = new Sprite();
                     _loc13_ = (time - finalList[_loc4_].item.startedStudying) / finalList[_loc4_].item.studyTime * 3.141592653589793 * 2;
                     finalList[_loc4_].studyMask.graphics.beginFill(16711680);
                     finalList[_loc4_].studyMask.graphics.moveTo(0,0);
                     finalList[_loc4_].studyMask.graphics.lineTo(0,-40);
                     _loc16_ = 0;
                     while(_loc16_ <= 3.141592653589793 * 2)
                     {
                        if(_loc16_ > _loc13_)
                        {
                           _loc7_ = _loc13_;
                        }
                        else
                        {
                           _loc7_ = _loc16_;
                        }
                        finalList[_loc4_].studyMask.graphics.lineTo(0 + Math.sin(_loc7_) * 40,0 - Math.cos(_loc7_) * 40);
                        _loc16_ += 3.141592653589793 / 4;
                     }
                     finalList[_loc4_].studyMask.graphics.endFill();
                     finalList[_loc4_].studySign.addChild(finalList[_loc4_].studyMask);
                     finalList[_loc4_].studyInnerCircle.mask = finalList[_loc4_].studyMask;
                  }
                  else
                  {
                     finalList[_loc4_].studySign.graphics.beginFill(8616191);
                     finalList[_loc4_].studySign.graphics.drawCircle(0,0,15);
                     finalList[_loc4_].studySign.graphics.endFill();
                  }
                  finalList[_loc4_].studySign.x = 210;
                  finalList[_loc4_].studySign.y = 40;
                  finalList[_loc4_].studySign.alpha = 0.5;
                  finalList[_loc4_].pic.addChild(finalList[_loc4_].studySign);
               }
            }
            if(finalList[_loc4_].item is Item)
            {
               finalList[_loc4_].pic.addChild(finalList[_loc4_].item.picture);
               finalList[_loc4_].amount = new EngineText("",16777215,Math.round(40 * (100 / listSize)),"right",10,240 - 45 * (100 / listSize),230,60 * (100 / listSize));
               finalList[_loc4_].amount.alpha = 0.8;
               if(finalList[_loc4_].item.category == 1)
               {
                  finalList[_loc4_].amount.text = "";
               }
               else
               {
                  finalList[_loc4_].amount.text = "x";
               }
               if(showInUse && finalList[_loc4_].item.inUse > 0)
               {
                  _loc9_ = finalList[_loc4_].item.amount;
               }
               else
               {
                  _loc9_ = finalList[_loc4_].item.amount - finalList[_loc4_].item.inUse;
               }
               if(_loc9_ >= 100000000)
               {
                  finalList[_loc4_].amount.text += Math.round(_loc9_ / 1000000) + " M";
               }
               else if(_loc9_ >= 100000)
               {
                  finalList[_loc4_].amount.text += Math.round(_loc9_ / 1000) + " K";
               }
               else
               {
                  finalList[_loc4_].amount.text += _loc9_;
               }
               finalList[_loc4_].pic.addChild(finalList[_loc4_].amount);
            }
            if(finalList[_loc4_].item is TransportUnit)
            {
               finalList[_loc4_].pic.addChild(finalList[_loc4_].item.picture);
               if(finalList[_loc4_].item.category == 1)
               {
                  if(finalList[_loc4_].item.gender == 1)
                  {
                     finalList[_loc4_].genderSymbol = new InterfaceIconMale();
                  }
                  else
                  {
                     finalList[_loc4_].genderSymbol = new InterfaceIconFemale();
                  }
                  finalList[_loc4_].genderSymbol.scaleX = finalList[_loc4_].genderSymbol.scaleY = 0.7;
                  finalList[_loc4_].genderSymbol.x = 40;
                  finalList[_loc4_].genderSymbol.y = 210;
                  finalList[_loc4_].genderSymbol.alpha = 0.5;
                  finalList[_loc4_].pic.addChild(finalList[_loc4_].genderSymbol);
               }
               if(finalList[_loc4_].item.category == 1 && finalList[_loc4_].item.cart is TransportUnit)
               {
                  finalList[_loc4_].icon = new filtericoncarts();
                  finalList[_loc4_].icon.scaleX = finalList[_loc4_].icon.scaleY = 1.3;
                  finalList[_loc4_].icon.alpha = 0.5;
                  finalList[_loc4_].icon.x = 210;
                  finalList[_loc4_].icon.y = 210;
                  finalList[_loc4_].pic.addChild(finalList[_loc4_].icon);
               }
               if(finalList[_loc4_].item.category == 2 && finalList[_loc4_].item.attachedTo is TransportUnit)
               {
                  finalList[_loc4_].icon = new filtericonanimals();
                  finalList[_loc4_].icon.scaleX = finalList[_loc4_].icon.scaleY = 1.3;
                  finalList[_loc4_].icon.alpha = 0.5;
                  finalList[_loc4_].icon.x = 210;
                  finalList[_loc4_].icon.y = 210;
                  finalList[_loc4_].pic.addChild(finalList[_loc4_].icon);
               }
            }
            if(vertical)
            {
               finalList[_loc4_].pic.x = 10;
               finalList[_loc4_].pic.y = 10 + _loc4_ * (listSize - 20);
            }
            else
            {
               finalList[_loc4_].pic.x = 10 + _loc4_ * (listSize - 20);
               finalList[_loc4_].pic.y = 10;
            }
            finalList[_loc4_].pic.scaleX = finalList[_loc4_].pic.scaleY = (listSize - 30) / 250;
            finalList[_loc4_].pic.buttonMode = true;
            finalList[_loc4_].pic.mouseChildren = false;
            finalList[_loc4_].pic.addEventListener("click",selectItem,false,0,false);
            finalList[_loc4_].pic.doubleClickEnabled = true;
            finalList[_loc4_].pic.addEventListener("doubleClick",doubleClick,false,0,false);
            scrollableArea.addContent(finalList[_loc4_].pic,null,null,null,null,true);
         }
         scrollableArea.updateSize();
         if(!unselectable)
         {
            if(finalList.length > 0)
            {
               onSelect(finalList[selectedItem].item);
            }
            else
            {
               onSelect(null);
            }
         }
      }
      
      private function selectItem(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         if(GameData.soundFXOn)
         {
            new SFXClick().play();
         }
         for(_loc3_ in finalList)
         {
            if(finalList[_loc3_].pic == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(!unselectable)
         {
            finalList[selectedItem].selectFrame.visible = false;
         }
         selectedItem = _loc2_;
         onSelect(finalList[selectedItem].item);
         if(!unselectable)
         {
            finalList[selectedItem].selectFrame.visible = true;
         }
      }
      
      private function doubleClick(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc3_ in finalList)
         {
            if(finalList[_loc3_].pic == param1.target)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         onDoubleClick(finalList[selectedItem].item);
      }
      
      public function remove(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         for(_loc2_ in finalList)
         {
            finalList[_loc2_].pic.buttonMode = false;
            finalList[_loc2_].item = null;
            finalList[_loc2_] = null;
         }
         scrollableArea.remove();
         scrollableArea = null;
         for(_loc2_ in fullList)
         {
            fullList[_loc2_] = null;
         }
         fullList = null;
         finalList = null;
         onSelect = null;
         onDoubleClick = null;
         onEmptyList = null;
         Filters = null;
         for(_loc2_ in filterButtonsArr)
         {
            filterButtonsArr[_loc2_].remove();
            filterButtonsArr[_loc2_] = null;
         }
         filterButtonsArr = null;
         filterValues = null;
      }
   }
}

