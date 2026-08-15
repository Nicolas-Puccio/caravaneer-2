package IsoEngine
{
   public class Projectile
   {
      
      public var ammoType:*;
      
      public var ownContainer:*;
      
      public var x:*;
      
      public var y:*;
      
      public var z:*;
      
      public var squareX:*;
      
      public var squareY:*;
      
      public var width:* = 1;
      
      public var height:* = 1;
      
      public var Shadow:*;
      
      public var speed:*;
      
      public var direction:*;
      
      public var explosive:*;
      
      public var velocityLoss:*;
      
      public var firedBy:*;
      
      public var frame:*;
      
      public var FF:*;
      
      public var explosiveness:*;
      
      public var antiPersonnel:*;
      
      public var xSpeed:*;
      
      public var ySpeed:*;
      
      public var zSpeed:*;
      
      public var counter:*;
      
      public var prevX:*;
      
      public var prevY:*;
      
      public var prevZ:*;
      
      public var screenX:*;
      
      public var screenY:*;
      
      public var overObstacles:* = [];
      
      public var explodeOnImpact:*;
      
      public var flame:*;
      
      public function Projectile()
      {
         super();
      }
   }
}

