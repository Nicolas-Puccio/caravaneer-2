package IsoEngine
{
   import Data.*;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class EngineText extends TextField
   {
      
      private var fontClass:Class = §DroidSansMonoCaravaneer_ttf$daed6ff73ec69cb50927d9deaae2edd6-1815762808§;
      
      public var TF:*;
      
      public function EngineText(param1:* = "", param2:* = 16777215, param3:* = 12, param4:* = "center", param5:* = 0, param6:* = 0, param7:* = null, param8:* = null, param9:* = false, param10:* = false, param11:* = null, param12:* = "regular")
      {
         super();
         x = param5;
         y = param6;
         if(param7 != null)
         {
            width = param7;
         }
         else
         {
            autoSize = "left";
         }
         if(param8 != null)
         {
            height = param8;
         }
         selectable = false;
         multiline = param9;
         wordWrap = param10;
         TF = new TextFormat();
         TF.color = param2;
         TF.align = param4;
         TF.size = param3;
         TF.bold = param12 == "bold" || param12 == "boldItalic";
         TF.italic = param12 == "italic" || param12 == "boldItalic";
         if(param11 == null)
         {
            if(Texts.useSystemFonts)
            {
               TF.font = Texts.systemFontName;
            }
            else
            {
               TF.font = "Droid Sans Mono";
            }
         }
         else
         {
            TF.font = param11;
         }
         antiAliasType = "normal";
         embedFonts = TextField.isFontCompatible(TF.font,param12);
         defaultTextFormat = TF;
         text = param1;
      }
      
      public function get size() : *
      {
         return TF.size;
      }
      
      public function set size(param1:*) : *
      {
         TF.size = param1;
         setTextFormat(TF);
      }
   }
}

