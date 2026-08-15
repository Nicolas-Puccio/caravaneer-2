package IsoEngine
{
   import flash.display.Sprite;
   
   public class RepeatedGraphics extends Sprite
   {
      
      public function RepeatedGraphics(param1:*, param2:* = 0, param3:* = 1)
      {
         super();
         if(param1 == 1)
         {
            graphics.beginFill(param2);
            graphics.moveTo(3,-4);
            graphics.lineTo(-4,0);
            graphics.lineTo(3,4);
            graphics.endFill();
         }
         if(param1 == 2)
         {
            graphics.beginFill(param2);
            graphics.moveTo(-3,-4);
            graphics.lineTo(4,0);
            graphics.lineTo(-3,4);
            graphics.endFill();
         }
         if(param1 == 3)
         {
            graphics.beginFill(param2);
            graphics.moveTo(0,-7);
            graphics.lineTo(5,1);
            graphics.lineTo(2,1);
            graphics.lineTo(2,7);
            graphics.lineTo(-2,7);
            graphics.lineTo(-2,1);
            graphics.lineTo(-5,1);
            graphics.endFill();
         }
         alpha = param3;
      }
   }
}

