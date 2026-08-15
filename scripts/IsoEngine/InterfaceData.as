package IsoEngine
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class InterfaceData
   {
      
      public var playersTurn:*;
      
      public var name:*;
      
      public var AP:*;
      
      public var maxAP:*;
      
      public var Messages:* = [];
      
      public var HP:*;
      
      public var maxHP:*;
      
      public var morale:*;
      
      public var healingMode:* = false;
      
      public var hasFirstAid:*;
      
      public var firstAidType:*;
      
      public var firstAidName:*;
      
      public var firstAidAmount:*;
      
      public var weaponCategory:*;
      
      public var weaponType:*;
      
      public var weaponInd:*;
      
      public var weaponName:*;
      
      public var weaponModeName:*;
      
      public var weaponModeAP:*;
      
      public var grenadesAmount:*;
      
      public var hasLoadedAmmo:*;
      
      public var loadedAmmoType:*;
      
      public var loadedAmmoName:*;
      
      public var loadedAmmoCaliber:*;
      
      public var loadedAmmoAmount:*;
      
      public var selectedAmmoType:*;
      
      public var selectedAmmoName:*;
      
      public var selectedAmmoCaliber:*;
      
      public var selectedAmmoAmount:*;
      
      public var anyWeaponsToPickUp:*;
      
      public var pickUpWeaponType:*;
      
      public var pickUpWeaponName:*;
      
      public var bleeding:*;
      
      public var burning:*;
      
      public var overloaded:*;
      
      public var eyeDamage:*;
      
      public var armDamage:*;
      
      public var legDamage:*;
      
      public var reloadAP:*;
      
      public var healAP:*;
      
      public var pickUpAP:*;
      
      public var miniMap:*;
      
      public var miniMapFrame:*;
      
      public var yourPeople:*;
      
      public var allies:*;
      
      public var enemies:*;
      
      public var weaponDescription:*;
      
      public var aimedShot:*;
      
      public var headShot:*;
      
      public var burst:*;
      
      public var parallelShots:*;
      
      public var hasScope:*;
      
      public var hasLaser:*;
      
      public var portrait:*;
      
      public var characterPointer:*;
      
      public function InterfaceData()
      {
         super();
         miniMap = new Sprite();
         miniMapFrame = new Bitmap();
      }
   }
}

