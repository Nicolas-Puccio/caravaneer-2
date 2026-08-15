package Interface
{
   import IsoEngine.ImportedBitmap;
   import flash.display.Sprite;
   
   public class Scrollbar extends Sprite
   {
      
      internal var style:*;
      
      internal var objectPointer:*;
      
      internal var variableName:*;
      
      internal var minScroll:*;
      
      internal var maxScroll:*;
      
      internal var windowSize:*;
      
      internal var pageSize:*;
      
      internal var scrollbarSize:*;
      
      internal var scrollbarWidth:*;
      
      internal var fillColor:*;
      
      internal var borderColor:*;
      
      internal var borderThickness:*;
      
      internal var backgroundFillColor:*;
      
      internal var backgroundAlpha:*;
      
      internal var currentPos:*;
      
      internal var relation:*;
      
      internal var scrollerSize:*;
      
      internal var nowScrolling:*;
      
      internal var dragStart:*;
      
      internal var scrollerInitPos:*;
      
      internal var Scroller:*;
      
      internal var scrollerMask:*;
      
      internal var scrollerHighlights:*;
      
      internal var scrollerShadows:*;
      
      public function Scrollbar(param1:*, param2:*, param3:*, param4:*, param5:*, param6:* = null, param7:* = 15, param8:* = 1, param9:* = 16777215, param10:* = 0, param11:* = 1, param12:* = 0, param13:* = 0.2, param14:* = 0)
      {
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         super();
         if(param6 == null)
         {
            param6 = param5;
         }
         nowScrolling = false;
         this.style = param8;
         this.objectPointer = param1;
         this.variableName = param2;
         this.minScroll = param3;
         this.maxScroll = param4;
         this.windowSize = param5;
         this.scrollbarSize = param6;
         this.scrollbarWidth = param7;
         this.fillColor = param9;
         this.borderColor = param10;
         this.borderThickness = param11;
         this.currentPos = param14;
         this.backgroundFillColor = param12;
         this.backgroundAlpha = param13;
         Scroller = new Sprite();
         if(param8 == 3)
         {
            _loc15_ = new ImportedBitmap("InterfaceBackground.png");
            _loc16_ = new Sprite();
            _loc16_.graphics.beginBitmapFill(_loc15_.bitmapData);
            _loc16_.graphics.drawRect(0,0,880,880);
            Scroller.addChild(_loc16_);
            scrollerMask = new Sprite();
            Scroller.addChild(scrollerMask);
            _loc16_.mask = scrollerMask;
            scrollerHighlights = new Sprite();
            scrollerHighlights.blendMode = "screen";
            Scroller.addChild(scrollerHighlights);
            scrollerShadows = new Sprite();
            scrollerShadows.blendMode = "multiply";
            Scroller.addChild(scrollerShadows);
         }
         Scroller.buttonMode = true;
         Scroller.useHandCursor = true;
         Scroller.addEventListener("mouseDown",clickScroller,false,0,false);
         addEventListener("addedToStage",defineStageEvents,false,0,false);
         addEventListener("removedFromStage",killStageEvents,false,0,false);
         addEventListener("enterFrame",EF,false,0,false);
         addChild(Scroller);
         update();
      }
      
      public function defineStageEvents(param1:*) : *
      {
         stage.addEventListener("mouseUp",releaseScroller,false,0,false);
         stage.addEventListener("rollOut",releaseScroller,false,0,false);
      }
      
      public function killStageEvents(param1:*) : *
      {
         stage.removeEventListener("mouseUp",releaseScroller);
         stage.removeEventListener("rollOut",releaseScroller);
      }
      
      public function update() : *
      {
         graphics.clear();
         if(style == 1 || style == 2)
         {
            graphics.lineStyle(borderThickness,borderColor);
         }
         if(style == 1)
         {
            graphics.beginFill(backgroundFillColor,backgroundAlpha);
            graphics.drawRect(0,0,scrollbarWidth,scrollbarSize);
         }
         if(style == 2)
         {
            graphics.moveTo(scrollbarWidth / 2,0);
            graphics.lineTo(scrollbarWidth / 2,scrollbarSize);
         }
         if(style == 3)
         {
            graphics.lineStyle(1,0,0.4);
            graphics.moveTo(0,scrollbarSize);
            graphics.lineTo(0,0);
            graphics.lineTo(scrollbarWidth,0);
            graphics.lineStyle(1,16777215,0.2);
            graphics.moveTo(scrollbarWidth,0);
            graphics.lineTo(scrollbarWidth,scrollbarSize);
            graphics.lineTo(0,scrollbarSize);
         }
         relation = Math.min(scrollbarSize / (maxScroll - minScroll),1);
         scrollerSize = windowSize * relation;
         Scroller.graphics.clear();
         if(style == 1 || style == 2)
         {
            Scroller.graphics.lineStyle(borderThickness,borderColor);
         }
         if(style == 1 || style == 2)
         {
            Scroller.graphics.beginFill(fillColor);
            Scroller.graphics.drawRect(0,0,scrollbarWidth,scrollerSize);
         }
         if(style == 3)
         {
            scrollerMask.graphics.clear();
            scrollerMask.graphics.beginFill(16777215);
            scrollerMask.graphics.drawRect(0,0,scrollbarWidth,scrollerSize);
         }
         if(style == 3)
         {
            scrollerHighlights.graphics.clear();
            scrollerHighlights.graphics.lineStyle(1,16777215,0.4);
            scrollerHighlights.graphics.moveTo(0,scrollerSize);
            scrollerHighlights.graphics.lineTo(0,0);
            scrollerHighlights.graphics.lineTo(scrollbarWidth,0);
            scrollerShadows.graphics.clear();
            scrollerShadows.graphics.lineStyle(1,0,0.5);
            scrollerShadows.graphics.moveTo(scrollbarWidth,0);
            scrollerShadows.graphics.lineTo(scrollbarWidth,scrollerSize);
            scrollerShadows.graphics.lineTo(0,scrollerSize);
         }
         Scroller.y = (0 - minScroll - objectPointer[variableName]) * relation;
         if(Scroller.y + scrollerSize > scrollbarSize)
         {
            Scroller.y = scrollbarSize - scrollerSize;
         }
      }
      
      public function clickScroller(param1:*) : *
      {
         nowScrolling = true;
         dragStart = mouseY;
         scrollerInitPos = Scroller.y;
      }
      
      public function releaseScroller(param1:*) : *
      {
         nowScrolling = false;
      }
      
      public function EF(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(nowScrolling)
         {
            _loc2_ = mouseY - dragStart;
            Scroller.y = scrollerInitPos + _loc2_;
            if(Scroller.y < 0)
            {
               Scroller.y = 0;
            }
            if(Scroller.y > scrollbarSize - scrollerSize)
            {
               Scroller.y = scrollbarSize - scrollerSize;
            }
            objectPointer[variableName] = 0 - minScroll - Scroller.y / relation;
         }
      }
      
      public function remove() : *
      {
         removeEventListener("enterFrame",EF);
         removeEventListener("addedToStage",defineStageEvents);
         removeEventListener("removedFromStage",killStageEvents);
         Scroller.buttonMode = false;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
   }
}

