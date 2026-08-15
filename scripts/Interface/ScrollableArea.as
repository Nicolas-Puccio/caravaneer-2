package Interface
{
   import flash.display.Sprite;
   import flash.text.*;
   
   public class ScrollableArea extends Sprite
   {
      
      public var Mask:*;
      
      public var Content:*;
      
      public var minWidth:*;
      
      public var maxWidth:*;
      
      public var currWidth:*;
      
      public var minHeight:*;
      
      public var maxHeight:*;
      
      public var currHeight:*;
      
      public var verticalScrollEnabled:*;
      
      public var horizontalScrollEnabled:*;
      
      public var autoHideScrollbars:*;
      
      public var contentList:*;
      
      public var verticalScrollbar:*;
      
      public var horizontalScrollbar:*;
      
      public var leftmostPoint:*;
      
      public var topmostPoint:*;
      
      public var rightmostPoint:*;
      
      public var bottommostPoint:*;
      
      public function ScrollableArea(param1:*, param2:*, param3:* = null, param4:* = null, param5:* = true, param6:* = true, param7:* = false, param8:* = 1, param9:* = 15, param10:* = 16777215, param11:* = 0)
      {
         super();
         leftmostPoint = topmostPoint = rightmostPoint = bottommostPoint = 0;
         contentList = [];
         if(param3 == null)
         {
            param3 = param1;
         }
         if(param4 == null)
         {
            param4 = param2;
         }
         currWidth = param1;
         currHeight = param2;
         this.minWidth = param1;
         this.minHeight = param2;
         this.maxWidth = param3;
         this.maxHeight = param4;
         this.verticalScrollEnabled = param5;
         this.horizontalScrollEnabled = param6;
         this.autoHideScrollbars = param7;
         Content = new Sprite();
         Mask = new Sprite();
         Content.mask = Mask;
         addChild(Content);
         addChild(Mask);
         verticalScrollbar = new Scrollbar(Content,"y",0,0,param2,null,param9,param8,param10,param11);
         addChild(verticalScrollbar);
         horizontalScrollbar = new Scrollbar(Content,"x",0,0,param1,null,param9,param8,param10);
         horizontalScrollbar.rotation = -90;
         horizontalScrollbar.scaleX = -1;
         addChild(horizontalScrollbar);
         addEventListener("addedToStage",defineStageEvents,false,0,false);
         addEventListener("removedFromStage",killStageEvents,false,0,false);
         updateSize();
      }
      
      public function defineStageEvents(param1:*) : *
      {
         stage.addEventListener("mouseWheel",scrollWithWheel,false,0,false);
      }
      
      public function killStageEvents(param1:*) : *
      {
         stage.removeEventListener("mouseWheel",scrollWithWheel);
      }
      
      public function scrollWithWheel(param1:*) : *
      {
         if(mouseX >= 0 && mouseX <= currWidth && mouseY >= 0 && mouseY <= currHeight)
         {
            if(Content is Object && param1 is Object)
            {
               Content.y += param1.delta * 10;
               if(Content.y < 0 - bottommostPoint + currHeight)
               {
                  Content.y = 0 - bottommostPoint + currHeight;
               }
               if(Content.y > 0 - topmostPoint)
               {
                  Content.y = 0 - topmostPoint;
               }
               verticalScrollbar.Scroller.y = Math.max((0 - Content.y - topmostPoint) * verticalScrollbar.relation,0);
            }
         }
      }
      
      public function addContent(param1:*, param2:* = null, param3:* = null, param4:* = null, param5:* = null, param6:* = false) : *
      {
         if(param2 == null)
         {
            param2 = param1.x;
         }
         if(param3 == null)
         {
            param3 = param1.y;
         }
         contentList.push({
            "item":param1,
            "x":param2,
            "y":param3,
            "w":param4,
            "h":param5
         });
         param1.x = param2;
         param1.y = param3;
         Content.addChild(param1);
         if(!param6)
         {
            updateSize();
         }
      }
      
      public function removeContent(param1:*) : *
      {
         var _loc2_:* = undefined;
         Content.removeChild(param1);
         for(_loc2_ in contentList)
         {
            if(contentList[_loc2_].item == param1)
            {
               contentList.splice(_loc2_,1);
               _loc2_--;
            }
         }
      }
      
      public function clearAll(param1:* = false) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in contentList)
         {
            Content.removeChild(contentList[_loc2_].item);
         }
         contentList = [];
         if(param1)
         {
            updateSize();
         }
      }
      
      public function updateSize() : *
      {
         var i:*;
         var height:*;
         var bounds:*;
         var width:*;
         currWidth = minWidth;
         currHeight = minHeight;
         leftmostPoint = topmostPoint = rightmostPoint = bottommostPoint = 0;
         for(i in contentList)
         {
            with(contentList[i])
            {
               
               if(item is TextField)
               {
                  bounds = {
                     "left":x,
                     "top":y,
                     "right":x + item.textWidth,
                     "bottom":y + item.textHeight
                  };
               }
               else
               {
                  bounds = item.getBounds(Content);
               }
               if(contentList[i].w != undefined)
               {
                  bounds.right = bounds.left + contentList[i].w;
               }
               if(contentList[i].h != undefined)
               {
                  bounds.bottom = bounds.top + contentList[i].h;
               }
               if(bounds.left < leftmostPoint)
               {
                  leftmostPoint = bounds.left;
               }
               if(bounds.top < topmostPoint)
               {
                  topmostPoint = bounds.top;
               }
               if(bounds.right > rightmostPoint)
               {
                  rightmostPoint = bounds.right;
               }
               if(bounds.bottom > bottommostPoint)
               {
                  bottommostPoint = bounds.bottom;
               }
            }
         }
         bottommostPoint += 5;
         if(rightmostPoint > currWidth)
         {
            if(rightmostPoint < maxWidth)
            {
               currWidth = rightmostPoint;
            }
            else
            {
               currWidth = maxWidth;
            }
         }
         if(bottommostPoint > currHeight)
         {
            if(bottommostPoint < maxHeight)
            {
               currHeight = bottommostPoint;
            }
            else
            {
               currHeight = maxHeight;
            }
         }
         if(verticalScrollEnabled && (!autoHideScrollbars || bottommostPoint > maxHeight || topmostPoint < 0))
         {
            verticalScrollbar.visible = true;
            verticalScrollbar.x = currWidth;
            verticalScrollbar.scrollbarSize = verticalScrollbar.windowSize = currHeight;
            verticalScrollbar.minScroll = topmostPoint;
            verticalScrollbar.maxScroll = bottommostPoint;
            verticalScrollbar.update();
         }
         else
         {
            verticalScrollbar.visible = false;
         }
         if(horizontalScrollEnabled && (!autoHideScrollbars || rightmostPoint > maxWidth || leftmostPoint < 0))
         {
            horizontalScrollbar.visible = true;
            horizontalScrollbar.y = currHeight;
            horizontalScrollbar.scrollbarSize = horizontalScrollbar.windowSize = currWidth;
            horizontalScrollbar.minScroll = leftmostPoint;
            horizontalScrollbar.maxScroll = rightmostPoint;
            horizontalScrollbar.update();
         }
         else
         {
            horizontalScrollbar.visible = false;
         }
         if(Content.y < 0 - bottommostPoint + currHeight)
         {
            Content.y = 0 - bottommostPoint + currHeight;
         }
         if(Content.y > 0 - topmostPoint)
         {
            Content.y = 0 - topmostPoint;
         }
         if(Content.x < 0 - rightmostPoint + currWidth)
         {
            Content.x = 0 - rightmostPoint + currWidth;
         }
         if(Content.x > 0 - leftmostPoint)
         {
            Content.x = 0 - leftmostPoint;
         }
         Mask.graphics.clear();
         Mask.graphics.beginFill(16777215);
         Mask.graphics.drawRect(0,0,currWidth,currHeight);
         Mask.graphics.endFill();
      }
      
      public function remove() : *
      {
         clearAll();
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         if(verticalScrollbar is Scrollbar)
         {
            verticalScrollbar.remove();
         }
         if(horizontalScrollbar is Scrollbar)
         {
            horizontalScrollbar.remove();
         }
      }
   }
}

