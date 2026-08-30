package IsoEngine
{
    //-new class
    public class MyBattleField extends BattleField
    {
      
        public function MyBattleField(param1:* = 800, param2:* = 600, param3:* = 100, param4:* = 100, param5:* = null, param6:* = 1, param7:* = true, param8:* = 1, param9:* = true, param10:* = 16777215, param11:* = 32, param12:* = 32, param13:* = 45, param14:* = 0.574)
        {
            super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
        }
        
        override public function addCharacter(char:Character, x:*, y:*, dir:*) : *
        {
            if(char.category != 4) {//-not spawn prisoners
                super.addCharacter(char,x,y,dir);
            }

            return;
        }

        //-not spawn transport
        override internal function placeTransport(theTransport:*,xPos:*,yPos:*):*
        {
            return;
        }
    }
}

