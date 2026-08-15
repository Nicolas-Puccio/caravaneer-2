package IsoEngine
{
   import Interface.*;
   import flash.display.*;
   import flash.filters.BlurFilter;
   import flash.filters.GlowFilter;
   
   public class Calculator extends Sprite
   {
      
      public var buttons:*;
      
      public var indicator:*;
      
      public var value:*;
      
      public var info:*;
      
      public var outOfRangeLight:*;
      
      public var onDone:*;
      
      public var onUpdate:*;
      
      public var replaceValue:*;
      
      public var onOffSwitch:*;
      
      public var min:* = 0;
      
      public var max:* = Infinity;
      
      public var afterComa:*;
      
      public var leftSideText:*;
      
      public var rightSideText:*;
      
      public function Calculator(param1:* = 1)
      {
         var _loc8_:* = undefined;
         var _loc3_:* = undefined;
         var _loc9_:* = undefined;
         super();
         afterComa = param1;
         onDone = defaultFunction;
         onUpdate = defaultFunction;
         var _loc13_:Sprite = new Sprite();
         _loc13_.graphics.beginFill(0,0.75);
         _loc13_.graphics.drawRect(0,0,880,495);
         _loc13_.graphics.endFill();
         addChild(_loc13_);
         var _loc5_:Sprite = new Sprite();
         _loc5_.graphics.beginFill(0,0.8);
         _loc5_.graphics.drawRect(0,0,333,440);
         _loc5_.x = 285;
         _loc5_.y = 43;
         _loc5_.filters = [new BlurFilter(8,8,4)];
         addChild(_loc5_);
         var _loc15_:ImportedBitmap = new ImportedBitmap("CalculatorBase.png");
         _loc15_.x = 265;
         _loc15_.y = 23;
         addChild(_loc15_);
         leftSideText = new EngineText("",12179693,14,"center",10,30,245,455,true,true);
         rightSideText = new EngineText("",12179693,14,"center",625,30,245,455,true,true);
         addChild(leftSideText);
         addChild(rightSideText);
         indicator = new Indicator(14,false,16769240,null,8,15,18.8);
         indicator.setValue(0);
         indicator.x = 314;
         indicator.y = 78;
         addChild(indicator);
         var _loc6_:GlowFilter = new GlowFilter(16719904,1,15,20,8,3);
         indicator.filters = [_loc6_];
         var _loc2_:ImportedBitmap = new ImportedBitmap("CalculatorGlass.png");
         _loc2_.x = 265;
         _loc2_.y = 23;
         addChild(_loc2_);
         var _loc10_:Array = ["-1","1","2","3","+1","-10","4","5","6","+10","-100","7","8","9","+100","-1K","DEL","0","AC","+1K","MIN","OK","MAX"];
         buttons = [];
         _loc8_ = 0;
         while(_loc8_ < 23)
         {
            _loc9_ = _loc8_ % 5;
            _loc3_ = Math.floor(_loc8_ / 5);
            if(_loc9_ == 0 || _loc9_ == 4 || _loc3_ == 3 && _loc9_ != 2 || _loc8_ == 22)
            {
               buttons[_loc8_] = new Button(4,buttonPressed,_loc10_[_loc8_]);
            }
            else if(_loc8_ < 21)
            {
               buttons[_loc8_] = new Button(3,buttonPressed,_loc10_[_loc8_]);
            }
            if(_loc8_ == 21)
            {
               buttons[_loc8_] = new Button(5,buttonPressed,_loc10_[_loc8_]);
            }
            if(_loc8_ == 22)
            {
               _loc9_ = 4;
            }
            buttons[_loc8_].x = 315 + _loc9_ * 54;
            buttons[_loc8_].y = 213 + _loc3_ * 44;
            addChild(buttons[_loc8_]);
            _loc8_++;
         }
         info = new EngineText("",16777215,12,"center",290,150,300,20);
         info.alpha = 0.5;
         addChild(info);
         onOffSwitch = new Switch(4,true,close,close,null,null,0,0,true);
         onOffSwitch.x = 495;
         onOffSwitch.y = 183;
         addChild(onOffSwitch);
         var _loc12_:EngineText = new EngineText("ON",16777215,13,"left",547,180,30,20);
         _loc12_.alpha = 0.5;
         addChild(_loc12_);
         var _loc14_:EngineText = new EngineText("OFF",16777215,13,"left",463,180,30,20);
         _loc14_.alpha = 0.5;
         addChild(_loc14_);
         var _loc7_:ImportedBitmap = new ImportedBitmap("BulbBase.png");
         _loc7_.x = 315;
         _loc7_.y = 183;
         addChild(_loc7_);
         var _loc11_:ImportedBitmap = new ImportedBitmap("BulbLightRedOff.png");
         _loc11_.x = 312;
         _loc11_.y = 180;
         addChild(_loc11_);
         outOfRangeLight = new ImportedBitmap("BulbLightRedOn.png");
         outOfRangeLight.x = 311;
         outOfRangeLight.y = 179;
         addChild(outOfRangeLight);
         outOfRangeLight.visible = false;
         var _loc4_:EngineText = new EngineText("ERROR",16777215,13,"left",332,180,130,20);
         _loc4_.alpha = 0.5;
         addChild(_loc4_);
         addEventListener("addedToStage",createStageEvents,false,0,false);
      }
      
      private function createStageEvents(param1:*) : *
      {
         stage.addEventListener("keyDown",keyPressed,false,0,false);
         stage.focus = stage;
      }
      
      private function keyPressed(param1:*) : *
      {
         if(this.visible)
         {
            if(param1.keyCode >= 48 && param1.keyCode <= 57)
            {
               pressDigit(param1.keyCode - 48);
            }
            if(param1.keyCode >= 96 && param1.keyCode <= 105)
            {
               pressDigit(param1.keyCode - 96);
            }
            switch(param1.keyCode)
            {
               case 45:
                  pressDigit(0);
                  break;
               case 35:
                  pressDigit(1);
                  break;
               case 40:
                  pressDigit(2);
                  break;
               case 34:
                  pressDigit(3);
                  break;
               case 37:
                  pressDigit(4);
                  break;
               case 12:
                  pressDigit(5);
                  break;
               case 39:
                  pressDigit(6);
                  break;
               case 36:
                  pressDigit(7);
                  break;
               case 38:
                  pressDigit(8);
                  break;
               case 33:
                  pressDigit(9);
            }
            if(param1.keyCode == 8)
            {
               del();
            }
         }
      }
      
      private function defaultFunction(param1:* = null) : *
      {
      }
      
      public function close() : *
      {
         this.visible = false;
         onDone = defaultFunction;
         onUpdate = defaultFunction;
         if(leftSideText is EngineText)
         {
            leftSideText.text = "";
         }
         if(rightSideText is EngineText)
         {
            rightSideText.text = "";
         }
         afterComa = 1;
      }
      
      public function setValue(param1:*) : *
      {
         value = param1;
         setIndicator();
         replaceValue = true;
      }
      
      private function buttonPressed(param1:* = null) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in buttons)
         {
            if(buttons[_loc3_] == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         switch(_loc2_)
         {
            case 0:
               increaseVal(-1);
               break;
            case 1:
               pressDigit(1);
               break;
            case 2:
               pressDigit(2);
               break;
            case 3:
               pressDigit(3);
               break;
            case 4:
               increaseVal(1);
               break;
            case 5:
               increaseVal(-10);
               break;
            case 6:
               pressDigit(4);
               break;
            case 7:
               pressDigit(5);
               break;
            case 8:
               pressDigit(6);
               break;
            case 9:
               increaseVal(10);
               break;
            case 10:
               increaseVal(-100);
               break;
            case 11:
               pressDigit(7);
               break;
            case 12:
               pressDigit(8);
               break;
            case 13:
               pressDigit(9);
               break;
            case 14:
               increaseVal(100);
               break;
            case 15:
               increaseVal(-1000);
               break;
            case 16:
               del();
               break;
            case 17:
               pressDigit(0);
               break;
            case 18:
               value = 0;
               setIndicator();
               break;
            case 19:
               increaseVal(1000);
               break;
            case 20:
               value = min;
               if(value < 0)
               {
                  value = 0;
               }
               replaceValue = true;
               setIndicator();
               break;
            case 21:
               if(value >= min && value <= max)
               {
                  onDone(value);
                  close();
               }
               break;
            case 22:
               value = max;
               if(value > 99999999999999)
               {
                  value = 99999999999999;
               }
               replaceValue = true;
               setIndicator();
         }
      }
      
      private function del() : *
      {
         var _loc1_:* = undefined;
         if(value > 9)
         {
            _loc1_ = String(value);
            _loc1_ = _loc1_.substring(0,_loc1_.length - 1);
            value = Number(_loc1_);
         }
         else
         {
            value = 0;
         }
         setIndicator();
      }
      
      public function increaseVal(param1:*) : *
      {
         value += param1;
         if(value > 99999999999999)
         {
            value = 99999999999999;
         }
         if(value < 0)
         {
            value = 0;
         }
         replaceValue = true;
         setIndicator();
      }
      
      public function pressDigit(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(value == 0 || replaceValue)
         {
            value = param1;
         }
         else
         {
            _loc2_ = String(value);
            if(_loc2_.length < 14)
            {
               _loc2_ += param1;
            }
            value = Number(_loc2_);
         }
         replaceValue = false;
         setIndicator();
      }
      
      private function setIndicator() : *
      {
         onUpdate();
         outOfRangeLight.visible = value < min || value > max;
         indicator.setValue(value,afterComa,true);
      }
      
      public function remove() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in buttons)
         {
            buttons[_loc1_].remove();
            buttons[_loc1_] = null;
         }
         buttons = null;
         onDone = null;
         onUpdate = null;
         outOfRangeLight = null;
         indicator = null;
         leftSideText = null;
         rightSideText = null;
         onOffSwitch.remove();
         onOffSwitch = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         if(stage is Stage)
         {
            stage.removeEventListener("keyDown",keyPressed);
         }
         removeEventListener("addedToStage",createStageEvents);
      }
   }
}

