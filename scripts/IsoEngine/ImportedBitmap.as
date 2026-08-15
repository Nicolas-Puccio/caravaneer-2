package IsoEngine
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.utils.getDefinitionByName;
   
   public class ImportedBitmap extends Bitmap
   {
      
      public function ImportedBitmap(param1:String)
      {
         var _loc3_:BitmapData = null;
         var _loc2_:Class = null;
         try
         {
            _loc2_ = getDefinitionByName(param1) as Class;
            _loc3_ = new _loc2_(0,0) as BitmapData;
            super(_loc3_);
         }
         catch(e:Error)
         {
            trace(param1 + " not found");
            bitmapData = new BitmapData(10,10,true,0);
         }
      }
   }
}

