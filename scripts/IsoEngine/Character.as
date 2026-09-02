package IsoEngine
{
   import Data.*;
   import com.gskinner.utils.Rndm;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Character
   {
      
      public static const basicPickUpAP:* = 3;
      
      public static const basicHealAP:* = 5;
      
      public static const maxAttachments:* = 2;
      
      public static const panicMorale:* = 8;
      
      public static const skillsList:* = [{
         "name":932,
         "skill":"doctorSkill",
         "experience":"doctorExperience"
      },{
         "name":933,
         "skill":"veterinarySkill",
         "experience":"veterinaryExperience"
      },{
         "name":934,
         "skill":"mechanicSkill",
         "experience":"mechanicExperience"
      },{
         "name":967,
         "skill":"rangedWeaponsSkill",
         "experience":"rangedWeaponsExperience"
      },{
         "name":968,
         "skill":"meleeSkill",
         "experience":"closeBattleExperience"
      },{
         "name":969,
         "skill":"unarmedSkill",
         "experience":"unarmedExperience"
      },{
         "name":970,
         "skill":"throwSkill",
         "experience":"throwExperience"
      },{
         "name":971,
         "skill":"crossbowSkill",
         "experience":"crossbowExperience"
      },{
         "name":972,
         "skill":"pistolSkill",
         "experience":"pistolExperience"
      },{
         "name":973,
         "skill":"rifleSkill",
         "experience":"rifleExperience"
      },{
         "name":974,
         "skill":"machinegunSkill",
         "experience":"machinegunExperience"
      },{
         "name":975,
         "skill":"smgSkill",
         "experience":"smgExperience"
      },{
         "name":986,
         "skill":"shotgunSkill",
         "experience":"shotgunExperience"
      },{
         "name":976,
         "skill":"rocketLauncherSkill",
         "experience":"rocketLauncherExperience"
      },{
         "name":977,
         "skill":"flamethrowerSkill",
         "experience":"flamethrowerExperience"
      },{
         "name":978,
         "skill":"knivesSkill",
         "experience":"knivesExperience"
      },{
         "name":979,
         "skill":"clubsSkill",
         "experience":"clubsExperience"
      },{
         "name":980,
         "skill":"choppingSkill",
         "experience":"choppingExperience"
      },{
         "name":981,
         "skill":"swordsSkill",
         "experience":"swordsExperience"
      },{
         "name":983,
         "skill":"closeBattleDodge",
         "experience":"dodgeExperience"
      },{
         "name":982,
         "skill":"painThreshold",
         "experience":"painExperience"
      },{
         "name":197,
         "skill":"firstAidSkill",
         "experience":"firstAidExperience"
      },{
         "name":935,
         "skill":"huntingSkill",
         "experience":"huntingExperience"
      },{
         "name":936,
         "skill":"collectingSkill",
         "experience":"collectingExperience"
      },{
         "name":938,
         "skill":"smugglingSkill",
         "experience":"smugglingExperience"
      },{
         "name":937,
         "skill":"sight",
         "experience":"travelExperience"
      }];
      
      public static const variablesToSave:* = ["neverPanic","dontRemoveFromTown","specialPortrait","weapons","attachments","grenadeAmounts","selectedAmmo","hunger","thirst","currModes","category","salary","minSalary","cycleCounter","dead","payDay","autoPay","skinColor","hairColor","shirtColor","pantsColor","shoesColor","lipsColor","beardColor","eyebrowsColor","eyesColor","eyeSocketsColor","bristleColor","name","gender","basePhysical","baseAgility","baseAccuracy","baseIntelligence","Height","_weight","idealWeight","faction","_HP","oldFaction","rangedWeaponsExperience","crossbowExperience","pistolExperience","rifleExperience","machinegunExperience","smgExperience","shotgunExperience","rocketLauncherExperience","flamethrowerExperience","throwExperience","unarmedExperience","dodgeExperience","closeBattleExperience","knivesExperience","clubsExperience","choppingExperience","swordsExperience","painExperience","generalBattleExperience","sleevesType","hasRightBracelet","hasLeftBracelet","braceletColor"
      ,"originalBodyType","LegsType","originalHead","originalBeardType","originalBackHairType","Jacket","Headgear","_morale","_battleMorale","eyeDamage","armDamage","legDamage","race","age","portraitShoulders","portraitHead","portraitNose","portraitMouth","portraitEyes","portraitHair","portraitWrinkles","portraitBeard","portraitEyebrows","portraitEars","portraitEyeSockets","portraitWhiskers","portraitMoustache","portraitShirt","portraitNecklace","specialPurpose","doctorExperience","firstAidExperience","veterinaryExperience","mechanicExperience","huntingExperience","collectingExperience","travelExperience","smugglingExperience","studyTime","startedStudying","enslavedAt","salaryCoefficient","wasInPlayersCaravan"];
      
      public static const battleModeVariables:* = ["squareX","squareY","x","y","currFrame","animationPhase","direction","applyPhaseAndFrame","band","AP","bleeding","burning"];
      
      public var randomPointer:* = null;
      
      public var neverPanic:* = false;
      
      public var specialPurpose:* = 0;
      
      public var weapons:*;
      
      public var attachments:*;
      
      public var grenadeAmounts:*;
      
      public var loadedAmmo:*;
      
      public var selectedAmmo:*;
      
      public var equipment:*;
      
      public var hunger:* = 0;
      
      public var thirst:* = 0;
      
      public var squareX:*;
      
      public var squareY:*;
      
      public var x:*;
      
      public var y:*;
      
      public var screenX:*;
      
      public var screenY:*;
      
      public var currSlot:* = 0;
      
      public var currFrame:*;
      
      public var animationPhase:*;
      
      public var direction:*;
      
      public var ownContainer:*;
      
      public var Shadow:*;
      
      public var currModes:*;
      
      public var category:*;
      
      public var salary:*;
      
      public var minSalary:*;
      
      public var group:*;
      
      public var cycleCounter:*;
      
      public var dead:* = false;
      
      public var applyPhaseAndFrame:*;
      
      public var band:*;
      
      public var payDay:* = 0;
      
      public var autoPay:* = true;
      
      public var skinColor:*;
      
      public var hairColor:*;
      
      public var shirtColor:*;
      
      public var pantsColor:*;
      
      public var shoesColor:*;
      
      public var lipsColor:*;
      
      public var beardColor:*;
      
      public var eyebrowsColor:*;
      
      public var eyesColor:*;
      
      public var eyeSocketsColor:*;
      
      public var bristleColor:*;
      
      public var name:*;
      
      public var gender:*;
      
      public var basePhysical:*;
      
      public var baseAgility:*;
      
      public var baseAccuracy:*;
      
      public var baseIntelligence:*;
      
      public var Height:*;
      
      public var _weight:*;
      
      public var idealWeight:*;
      
      public var faction:* = 5;
      
      public var AP:*;
      
      public var _HP:*;
      
      public var oldFaction:*;
      
      public var enslavedAt:*;
      
      public var salaryCoefficient:* = 1;
      
      public var wasInPlayersCaravan:* = false;
      
      public var rangedWeaponsExperience:* = 0;
      
      public var crossbowExperience:* = 0;
      
      public var pistolExperience:* = 0;
      
      public var rifleExperience:* = 0;
      
      public var machinegunExperience:* = 0;
      
      public var smgExperience:* = 0;
      
      public var shotgunExperience:* = 0;
      
      public var rocketLauncherExperience:* = 0;
      
      public var flamethrowerExperience:* = 0;
      
      public var throwExperience:* = 0;
      
      public var unarmedExperience:* = 0;
      
      public var dodgeExperience:* = 0;
      
      public var closeBattleExperience:* = 0;
      
      public var knivesExperience:* = 0;
      
      public var clubsExperience:* = 0;
      
      public var choppingExperience:* = 0;
      
      public var swordsExperience:* = 0;
      
      public var painExperience:* = 0;
      
      public var generalBattleExperience:* = 0;
      
      public var doctorExperience:* = 0;
      
      public var firstAidExperience:* = 0;
      
      public var veterinaryExperience:* = 0;
      
      public var mechanicExperience:* = 0;
      
      public var huntingExperience:* = 0;
      
      public var collectingExperience:* = 0;
      
      public var travelExperience:* = 0;
      
      public var smugglingExperience:* = 0;
      
      public var width:* = 1;
      
      public var height:* = 1;
      
      public var sleevesType:*;
      
      public var hasRightBracelet:*;
      
      public var hasLeftBracelet:*;
      
      public var braceletColor:*;
      
      public var originalBodyType:*;
      
      public var LegsType:*;
      
      public var originalHead:*;
      
      public var originalBeardType:*;
      
      public var originalBackHairType:*;
      
      public var Jacket:* = 0;
      
      public var Headgear:* = 0;
      
      public var selectedFirstAidType:*;
      
      public var selectedFirstAidAmount:*;
      
      public var hasFirstAid:*;
      
      public var lastSlot:*;
      
      public var lastDirection:*;
      
      public var lastAnimationPhase:*;
      
      public var lastFrame:*;
      
      public var lastAnimationType:*;
      
      public var bloodDrops:*;
      
      public var lastHitDamage:* = 0;
      
      public var hitInThisTurn:* = false;
      
      public var hitFrom:*;
      
      public var hitByFlame:* = false;
      
      public var bleeding:* = 0;
      
      public var burning:* = 0;
      
      public var burnFrame:* = 1;
      
      public var bodyFlame:*;
      
      public var flameSoundChannel:*;
      
      public var pickUpPos:* = 0;
      
      public var FTBurstTotal:* = 0;
      
      public var caravan:*;
      
      public var passengerIn:*;
      
      public var dontRemoveFromTown:*;
      
      public var specialPortrait:*;
      
      public var throwGrenadeAt:*;
      
      public var zHeight:* = 1.6;
      
      public var _morale:* = 50;
      
      public var _battleMorale:* = 50;
      
      public var AICue:*;
      
      public var eyeDamage:* = false;
      
      public var armDamage:* = false;
      
      public var legDamage:* = false;
      
      public var race:*;
      
      public var age:*;
      
      public var studyTime:*;
      
      public var startedStudying:*;
      
      public var portraitShoulders:*;
      
      public var portraitHead:*;
      
      public var portraitNose:*;
      
      public var portraitMouth:*;
      
      public var portraitEyes:*;
      
      public var portraitHair:*;
      
      public var portraitWrinkles:*;
      
      public var portraitBeard:*;
      
      public var portraitEyebrows:*;
      
      public var portraitEars:*;
      
      public var portraitEyeSockets:*;
      
      public var portraitWhiskers:*;
      
      public var portraitMoustache:*;
      
      public var portraitShirt:*;
      
      public var portraitNecklace:*;
      
      public var controlled:*;
      
      public var savedPortrait:*;
      
      public var enemies:*;
      
      public var friends:*;
      
      public var squaresToProcess:*;
      
      public var maxScore:*;
      
      public var targetX:*;
      
      public var targetY:*;
      
      public var remainingAP:*;
      
      public var destX:*;
      
      public var destY:*;
      
      public var theVictim:*;
      
      public var selectedSquare:*;
      
      public var minimumRange:*;
      
      public var maximumRange:*;
      
      public var optimalRange:*;
      
      public var minAPMode:*;
      
      public var maxAccuracyMode:*;
      
      public var maxDamageMode:*;
      
      public var availableAmmo:*;
      
      public var availableAP:*;
      
      public var dangerMap:*;
      
      public var walkToX:*;
      
      public var walkToY:*;
      
      public var shotSequence:*;
      
      public var onlyWalk:*;
      
      public var grenadeSpots:*;
      
      public var runningAway:*;
      
      public var startAtRenderSprite:* = 0;
      
      public function Character(param1:* = null)
      {
         var _loc9_:* = undefined;
         var _loc7_:* = undefined;
         var _loc4_:* = undefined;
         var _loc13_:* = undefined;
         var _loc15_:* = undefined;
         var _loc6_:* = undefined;
         var _loc2_:* = undefined;
         var _loc8_:* = undefined;
         var _loc14_:* = undefined;
         var _loc5_:* = undefined;
         var _loc10_:* = undefined;
         var _loc18_:* = undefined;
         var _loc17_:* = undefined;
         var _loc3_:* = undefined;
         weapons = [0,0];
         attachments = [[],[]];
         grenadeAmounts = [0,0];
         loadedAmmo = [null,null];
         selectedAmmo = [null,null];
         currModes = [0,0];
         AICue = [];
         squaresToProcess = [];
         super();
         cycleCounter = Rndm.integer(0,360 - 1);
         ownContainer = new Bitmap();
         if(param1 == null)
         {
            param1 = {};
         }
         if(param1.savePointer)
         {
            randomPointer = Rndm.pointer;
         }
         if(param1.setPointer != undefined)
         {
            Rndm.pointer = param1.setPointer;
            randomPointer = param1.setPointer;
         }
         if(param1.disableRandom)
         {
            Rndm.disabled = true;
         }
         if(param1.caravan != undefined)
         {
            caravan = param1.caravan;
         }
         if(param1.salaryCoefficient != undefined)
         {
            salaryCoefficient = param1.salaryCoefficient;
         }
         else
         {
            salaryCoefficient = Rndm.integer(1,5);
         }
         if(param1.faction != undefined)
         {
            faction = oldFaction = param1.faction;
         }
         if(param1.specialPurpose != undefined)
         {
            specialPurpose = param1.specialPurpose;
         }
         if(param1.specialPortrait > 0)
         {
            specialPortrait = param1.specialPortrait;
         }
         else
         {
            specialPortrait = null;
         }
         if(param1.category == null)
         {
            category = 2;
         }
         else
         {
            category = param1.category;
         }
         if(param1.gender == null)
         {
            if(Rndm.random() < 0.3)
            {
               gender = 2;
            }
            else
            {
               gender = 1;
            }
         }
         else
         {
            gender = param1.gender;
         }
         if(param1.age != null)
         {
            age = param1.age;
         }
         else
         {
            age = Rndm.integer(16,54);
         }
         var _loc11_:* = 1;
         if(param1.levelModifier != null)
         {
            _loc11_ = param1.levelModifier;
         }
         var _loc16_:* = 1;
         if(param1.experienceModifier != null)
         {
            _loc16_ = param1.experienceModifier;
         }
         else
         {
            _loc16_ = age / 30;
         }
         if(gender == 1)
         {
            _loc4_ = 1.2;
            _loc7_ = 0.8;
         }
         else
         {
            _loc4_ = 0.8;
            _loc7_ = 1.2;
         }
         if(param1.physical != null)
         {
            basePhysical = param1.physical;
         }
         else
         {
            basePhysical = Math.min(Math.round((Rndm.integer(4,7) - Math.abs(age - 20) / 15) * _loc11_ * _loc4_),10);
         }
         if(param1.agility != null)
         {
            baseAgility = param1.agility;
         }
         else
         {
            baseAgility = Math.min(Math.round((Rndm.integer(4,7) - Math.abs(age - 18) / 15) * _loc11_ * _loc7_),10);
         }
         if(param1.accuracy != null)
         {
            baseAccuracy = param1.accuracy;
         }
         else
         {
            baseAccuracy = Math.min(Math.round((Rndm.integer(4,7) - Math.abs(age - 25) / 20) * _loc11_),10);
         }
         if(param1.intelligence != null)
         {
            baseIntelligence = param1.intelligence;
         }
         else
         {
            baseIntelligence = Math.min(Math.round((Rndm.integer(4,7) + Math.min((age - 15) / 15,1.7)) * _loc11_),10);
         }
         for(_loc9_ in skillsList)
         {
            if(param1[skillsList[_loc9_].experience] != null)
            {
               this[skillsList[_loc9_].experience] = param1[skillsList[_loc9_].experience];
            }
            else
            {
               this[skillsList[_loc9_].experience] = Math.round(100 * Rndm.random() * _loc16_);
            }
         }
         generalBattleExperience = Math.round(500 * Rndm.random() * _loc16_);
         if(param1.salary != undefined)
         {
            minSalary = param1.salary;
         }
         else
         {
            recalculateSalary();
            minSalary *= 0.8 + Rndm.random() * 0.4;
            minSalary = Math.round(minSalary);
         }
         if(param1.height == null)
         {
            Height = 150 + physical * 3 + physical * Rndm.random() * 4;
         }
         else
         {
            Height = param1.height;
         }
         if(gender == 1)
         {
            idealWeight = Height - 100 - (Height - 150) / 4;
         }
         if(gender == 2)
         {
            idealWeight = Height - 100 - (Height - 150) / 2;
         }
         if(param1.weight == null)
         {
            weight = idealWeight * (0.7 + Rndm.random() * 0.4);
         }
         else
         {
            weight = param1.weight;
         }
         salary = minSalary;
         equipment = [];
         if(param1.name == null)
         {
            name = NamePhonetics.randomName(gender);
         }
         else
         {
            name = param1.name;
         }
         if(category == 4)
         {
            _morale = Rndm.integer(5,30);
         }
         else
         {
            _morale = Rndm.integer(30,70);
         }
         HP = maxHP;
         bloodDrops = [];
         weapons = [0,0];
         if(param1.skinColor == null)
         {
            _loc6_ = Rndm.random();
            if(param1.race == null)
            {
               race = Rndm.random();
            }
            else
            {
               race = param1.race;
            }
            if(race < 0.3 && _loc6_ < 0.5)
            {
               _loc6_ = 0.5;
            }
            if(race > 0.7 && _loc6_ < 0.3)
            {
               _loc6_ = 0.3;
            }
            if(race > 0.7 && _loc6_ > 0.7)
            {
               _loc6_ = 0.7;
            }
            _loc8_ = 25 - Math.abs(race - 0.5) * 20;
            _loc13_ = 20 + _loc6_ * 15;
            _loc15_ = 90 - _loc6_ * 45;
            if(_loc15_ > 100)
            {
               _loc15_ = 100;
            }
            skinColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            skinColor.bc = 0.9 + Rndm.random() * 0.2;
         }
         else
         {
            skinColor = param1.skinColor;
         }
         if(param1.lipsColor != null)
         {
            lipsColor = param1.lipsColor;
         }
         else
         {
            _loc14_ = ColorFunctions.rgb2hsv(skinColor.r,skinColor.g,skinColor.b);
            _loc8_ = _loc14_.h;
            _loc13_ = _loc14_.s;
            _loc15_ = _loc14_.v;
            if(gender == 1)
            {
               _loc8_ -= Rndm.integer(1,6);
               _loc13_ += Rndm.integer(1,7);
               _loc15_ -= Rndm.integer(0,3);
               _loc2_ = 0.85 + Rndm.random() * 0.2;
            }
            else
            {
               _loc8_ -= Rndm.integer(5,15);
               _loc13_ += Rndm.integer(5,15);
               _loc15_ -= Rndm.integer(5,15);
               _loc2_ = 0.75 + Rndm.random() * 0.2;
            }
            if(_loc8_ < 0)
            {
               _loc8_ = 0;
            }
            if(_loc13_ > 255)
            {
               _loc13_ = 255;
            }
            if(_loc15_ < 0)
            {
               _loc15_ = 0;
            }
            lipsColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            lipsColor.bc = _loc2_;
         }
         if(param1.hairColor != null)
         {
            hairColor = param1.hairColor;
         }
         else
         {
            if(age > 40 && Rndm.random() < age / 100 - race / 3)
            {
               _loc8_ = 0;
               _loc13_ = 0;
               _loc15_ = 60 + Rndm.random() * 40;
               _loc2_ = 1;
            }
            else if(race < 0.1 || Rndm.random() < 0.5 - race / 2)
            {
               _loc8_ = 10 + Rndm.random() * 10;
               _loc13_ = 50 + Rndm.random() * 30;
               _loc15_ = 5 + Rndm.random() * 20;
               _loc2_ = 0.8 + Rndm.random() * 0.2;
            }
            else if(race > 0.9 || Rndm.random() < race / 4)
            {
               _loc8_ = 30 + Rndm.random() * 10;
               _loc13_ = 15 + Rndm.random() * 7;
               _loc15_ = 80 + Rndm.random() * 10;
               _loc2_ = 1 + Rndm.random() * 0.2;
            }
            else if(Rndm.random() < 0.2 + race / 10)
            {
               _loc8_ = 5 + Rndm.random() * 30;
               _loc13_ = 60 + Rndm.random() * 20;
               _loc15_ = 40 + Rndm.random() * 20;
               _loc2_ = 1;
            }
            else if(Rndm.random() < race / 10 + 0.1)
            {
               _loc8_ = 40 + Rndm.random() * 10;
               _loc13_ = 15 + Rndm.random() * 10;
               _loc15_ = 55 + Rndm.random() * 20;
               _loc2_ = 1 + Rndm.random() * 0.1;
            }
            else
            {
               _loc15_ = 20 + Rndm.random() * 80;
               _loc13_ = 100 - _loc15_;
               _loc8_ = 40 - _loc15_ / 5;
               _loc2_ = 0.8 + Rndm.random() * 0.4;
            }
            hairColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            hairColor.bc = _loc2_;
         }
         if(param1.beardColor != null)
         {
            beardColor = param1.beardColor;
         }
         else if(Rndm.random() < 0.5)
         {
            beardColor = hairColor;
         }
         else
         {
            if(Rndm.random() < 0.9)
            {
               _loc5_ = ColorFunctions.rgb2hsv(hairColor.r,hairColor.g,hairColor.b);
               _loc8_ = _loc5_.h;
               _loc13_ = _loc5_.s;
               _loc15_ = _loc5_.v;
               _loc8_ += Rndm.random() * 10 - 5;
               _loc13_ += Rndm.random() * 10 - 5;
               _loc15_ += Rndm.random() * 10 - 5;
               if(_loc13_ > 100)
               {
                  _loc13_ = 100;
               }
               if(_loc13_ < 0)
               {
                  _loc13_ = 0;
               }
               if(_loc15_ > 100)
               {
                  _loc15_ = 100;
               }
               if(_loc15_ < 0)
               {
                  _loc15_ = 0;
               }
               _loc2_ = hairColor.bc - 0.1 + Rndm.random() * 0.2;
               while(_loc8_ < 0)
               {
                  _loc8_ += 360;
               }
            }
            else
            {
               _loc8_ = Rndm.random() * 360;
               _loc13_ = 70 + Rndm.random() * 20;
               _loc15_ = 40 + Rndm.random() * 30;
               _loc2_ = 1;
            }
            beardColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            beardColor.bc = _loc2_;
         }
         if(param1.eyebrowsColor != null)
         {
            eyebrowsColor = param1.eyebrowsColor;
         }
         else
         {
            _loc5_ = ColorFunctions.rgb2hsv(hairColor.r,hairColor.g,hairColor.b);
            _loc8_ = _loc5_.h;
            _loc13_ = _loc5_.s;
            _loc15_ = _loc5_.v;
            _loc13_ += 5 + Rndm.random() * 10;
            _loc15_ -= 10 + Rndm.random() * 20;
            if(_loc13_ > 100)
            {
               _loc13_ = 100;
            }
            if(_loc15_ < 0)
            {
               _loc15_ = 0;
            }
            eyebrowsColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            eyebrowsColor.bc = hairColor.bc * 0.9;
         }
         if(param1.bristleColor == null)
         {
            _loc14_ = ColorFunctions.rgb2hsv(skinColor.r,skinColor.g,skinColor.b);
            _loc10_ = _loc14_.h;
            _loc18_ = _loc14_.s;
            _loc17_ = _loc14_.v;
            if(gender == 1 && Rndm.random() < 0.8 && age > 18)
            {
               _loc5_ = ColorFunctions.rgb2hsv(hairColor.r,hairColor.g,hairColor.b);
               _loc8_ = _loc5_.h;
               _loc13_ = _loc5_.s;
               _loc15_ = _loc5_.v;
               _loc13_ += 2 + Rndm.random() * 20;
               _loc15_ -= 20 + Rndm.random() * 50;
               if(_loc13_ > 100)
               {
                  _loc13_ = 100;
               }
               if(_loc15_ < 0)
               {
                  _loc15_ = 0;
               }
               _loc3_ = Math.min(Rndm.random() * (age / 18 - 1),1);
               _loc15_ = Math.min(_loc17_,_loc15_);
               _loc8_ = (_loc8_ * _loc3_ + _loc10_ * (1 - _loc3_)) / 2;
               _loc13_ = (_loc13_ * _loc3_ + _loc18_ * (1 - _loc3_)) / 2;
               _loc15_ = (_loc15_ * _loc3_ + _loc17_ * (1 - _loc3_)) / 2;
               _loc2_ = hairColor.bc * _loc3_ + skinColor.bc * (1 - _loc3_);
               bristleColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
               bristleColor.bc = _loc2_;
            }
            else
            {
               _loc10_ += 5;
               _loc17_ -= 5;
               if(_loc10_ > 359)
               {
                  _loc10_ = 359;
               }
               if(_loc17_ < 0)
               {
                  _loc17_ = 0;
               }
               bristleColor = ColorFunctions.hsv2rgb(_loc10_,_loc18_,_loc17_);
               bristleColor.bc = skinColor.bc - 0.1;
            }
         }
         else
         {
            bristleColor = param1.bristleColor;
         }
         if(param1.hairColor == null && Rndm.random() < 0.05)
         {
            _loc8_ = Rndm.random() * 360;
            _loc13_ = 70 + Rndm.random() * 20;
            _loc15_ = 40 + Rndm.random() * 30;
            hairColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            hairColor.bc = 1;
            if(param1.beardColor == null && Rndm.random() < 0.5)
            {
               beardColor = hairColor;
            }
         }
         if(param1.eyesColor != null)
         {
            eyesColor = param1.eyesColor;
         }
         else
         {
            if(Rndm.random() < race)
            {
               _loc8_ = 120 + Rndm.random() * 130;
               _loc13_ = 5 + Rndm.random() * 30;
               _loc15_ = 40 + Rndm.random() * 20;
               _loc2_ = 1 + Rndm.random() * 0.2;
            }
            else
            {
               _loc8_ = Rndm.random() * 40;
               _loc13_ = 60 + Rndm.random() * 20;
               _loc15_ = Rndm.random() * 20;
               _loc2_ = 0.8 + Rndm.random() * 0.2;
            }
            eyesColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            eyesColor.bc = _loc2_;
         }
         if(param1.pantsColor == null)
         {
            _loc8_ = Rndm.integer(0,359);
            _loc13_ = Rndm.integer(0,30);
            _loc15_ = Rndm.integer(0,70);
            pantsColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            pantsColor.bc = 1 + Rndm.random() * 0.5;
         }
         else
         {
            pantsColor = param1.pantsColor;
         }
         if(param1.shoesColor == null)
         {
            _loc8_ = Rndm.integer(0,60);
            _loc13_ = Rndm.integer(30,70);
            _loc15_ = Rndm.integer(0,30);
            shoesColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            shoesColor.bc = 1;
         }
         else
         {
            shoesColor = param1.shoesColor;
         }
         if(param1.shirtColor == null)
         {
            _loc8_ = Rndm.integer(0,360);
            _loc13_ = Rndm.integer(0,20);
            _loc15_ = Rndm.integer(10,100);
            _loc13_ = Math.round(_loc13_ * ((150 - _loc15_) / 150));
            shirtColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            shirtColor.bc = 0.8 + Rndm.random() * 0.2;
         }
         else
         {
            shirtColor = param1.shirtColor;
         }
         if(param1.eyeSocketsColor == null)
         {
            _loc14_ = ColorFunctions.rgb2hsv(skinColor.r,skinColor.g,skinColor.b);
            _loc8_ = _loc14_.h;
            _loc13_ = _loc14_.s;
            _loc15_ = _loc14_.v;
            if(gender == 1 || Rndm.random() < 0.5)
            {
               if(Rndm.random() <= 0.05)
               {
                  _loc8_ = 0;
                  _loc13_ = 100;
                  _loc15_ = 0;
               }
               else
               {
                  _loc8_ -= Rndm.integer(2,10);
                  _loc13_ += Rndm.integer(-5,10);
                  _loc15_ -= Rndm.integer(0,3);
                  _loc2_ = 0.85 + Rndm.random() * 0.2;
               }
            }
            else
            {
               _loc8_ = Rndm.integer(0,359);
               _loc13_ += Rndm.integer(0,20);
               _loc15_ -= Rndm.integer(5,20);
               _loc2_ = 0.75 + Rndm.random() * 0.2;
            }
            if(_loc8_ < 0)
            {
               _loc8_ = 0;
            }
            if(_loc13_ > 255)
            {
               _loc13_ = 255;
            }
            if(_loc13_ < 0)
            {
               _loc13_ = 0;
            }
            if(_loc15_ < 0)
            {
               _loc15_ = 0;
            }
            eyeSocketsColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            eyeSocketsColor.bc = _loc2_;
         }
         else
         {
            eyeSocketsColor = param1.eyeSocketsColor;
         }
         if(param1.portraitShoulders != undefined)
         {
            portraitShoulders = param1.portraitShoulders;
         }
         else
         {
            portraitShoulders = MathFunctions.oneOfArray(getPortraitOptions("shoulders"));
         }
         if(param1.portraitHair != undefined)
         {
            portraitHair = param1.portraitHair;
         }
         else
         {
            portraitHair = MathFunctions.oneOfArray(getPortraitOptions("hair"));
         }
         if(param1.portraitHead != undefined)
         {
            portraitHead = param1.portraitHead;
         }
         else
         {
            portraitHead = MathFunctions.oneOfArray(getPortraitOptions("head"));
         }
         if(param1.portraitMouth != undefined)
         {
            portraitMouth = param1.portraitMouth;
         }
         else
         {
            portraitMouth = MathFunctions.oneOfArray(getPortraitOptions("mouth"));
         }
         if(param1.portraitNose != undefined)
         {
            portraitNose = param1.portraitNose;
         }
         else
         {
            portraitNose = MathFunctions.oneOfArray(getPortraitOptions("nose"));
         }
         if(param1.portraitEyebrows != undefined)
         {
            portraitEyebrows = param1.portraitEyebrows;
         }
         else
         {
            portraitEyebrows = MathFunctions.oneOfArray(getPortraitOptions("eyebrows"));
         }
         if(param1.portraitEyes != undefined)
         {
            portraitEyes = param1.portraitEyes;
         }
         else
         {
            portraitEyes = MathFunctions.oneOfArray(getPortraitOptions("eyes"));
         }
         if(param1.portraitEars != undefined)
         {
            portraitEars = param1.portraitEars;
         }
         else
         {
            portraitEars = MathFunctions.oneOfArray(getPortraitOptions("ears"));
         }
         if(param1.portraitBeard != undefined)
         {
            portraitBeard = param1.portraitBeard;
         }
         else
         {
            portraitBeard = MathFunctions.oneOfArray(getPortraitOptions("beard"));
         }
         if(param1.portraitMoustache != undefined)
         {
            portraitMoustache = param1.portraitMoustache;
         }
         else
         {
            portraitMoustache = MathFunctions.oneOfArray(getPortraitOptions("moustache"));
         }
         if(param1.portraitWhiskers != undefined)
         {
            portraitWhiskers = param1.portraitWhiskers;
         }
         else if(Rndm.random() < 0.9)
         {
            portraitWhiskers = 0;
         }
         else
         {
            portraitWhiskers = MathFunctions.oneOfArray(getPortraitOptions("whiskers"));
         }
         if(param1.portraitShirt != undefined)
         {
            portraitShirt = param1.portraitShirt;
         }
         else
         {
            portraitShirt = MathFunctions.oneOfArray(getPortraitOptions("shirt"));
         }
         var _loc12_:* = getPortraitOptions("wrinkles");
         if(param1.portraitNecklace != undefined)
         {
            portraitNecklace = param1.portraitNecklace;
         }
         else if(Rndm.random() > 0.4)
         {
            portraitNecklace = MathFunctions.oneOfArray(getPortraitOptions("necklace"));
         }
         else
         {
            portraitNecklace = 0;
         }
         if(param1.portraitBeard == undefined && param1.portraitMoustache == undefined)
         {
            if(Rndm.random() < 0.5)
            {
               portraitBeard = 0;
            }
            if(Rndm.random() < 0.05)
            {
               portraitMoustache = 0;
            }
            if(gender == 1 && beardColor.r + beardColor.g + beardColor.b < 128 && age > 25 && Rndm.random() < 0.05)
            {
               portraitMoustache = 6;
            }
            if(gender == 1 && age < 30 || gender == 2 && age < 35)
            {
               portraitWrinkles = 0;
            }
            else if(gender == 1)
            {
               portraitWrinkles = _loc12_[Math.floor((age - 30) / 5)];
            }
            else
            {
               portraitWrinkles = _loc12_[Math.floor((age - 35) / 5)];
            }
         }
         if(param1.portraitEyeSockets != undefined)
         {
            portraitEyeSockets = param1.portraitEyeSockets;
         }
         else if(Rndm.random() < 0.7)
         {
            portraitEyeSockets = 1;
         }
         else
         {
            portraitEyeSockets = 0;
            eyeSocketsColor = skinColor;
         }
         if(param1.sleevesType == null)
         {
            sleevesType = Rndm.integer(0,5);
         }
         else
         {
            sleevesType = param1.sleevesType;
         }
         if(param1.hasRightBracelet == null)
         {
            hasRightBracelet = Rndm.random() > 0.5;
         }
         else
         {
            hasRightBracelet = param1.hasRightBracelet;
         }
         if(param1.hasLeftBracelet == null)
         {
            hasLeftBracelet = Rndm.random() > 0.5;
         }
         else
         {
            hasRightBracelet = param1.hasRightBracelet;
         }
         if(param1.braceletColor == null)
         {
            _loc8_ = Rndm.integer(0,60);
            _loc13_ = Rndm.integer(50,100);
            _loc15_ = Rndm.integer(0,20);
            braceletColor = ColorFunctions.hsv2rgb(_loc8_,_loc13_,_loc15_);
            braceletColor.bc = 1;
         }
         else
         {
            braceletColor = param1.braceletColor;
         }
         if(param1.legsType == null)
         {
            if(gender == 1)
            {
               LegsType = 1;
            }
            else
            {
               LegsType = 2;
            }
         }
         else
         {
            LegsType = param1.legsType;
         }
         updateBattlefieldAppearence();
         Rndm.disabled = false;
      }
      
      public function recalculateSalary(param1:* = null) : *
      {
         minSalary = Math.round((Math.pow(basePhysical + baseAgility + baseAccuracy + baseIntelligence,2) + Math.pow(totalExperience,0.5) * 8) / 10) * 20 * salaryCoefficient;
         if(param1 is Number)
         {
            minSalary *= Math.max(1 - param1 / 1000,0.4);
         }
         if(salary < minSalary)
         {
            salary = minSalary;
         }
      }
      
      public function updateBattlefieldAppearence() : *
      {
         if(portraitShirt == 0)
         {
            sleevesType = 0;
         }
         if(gender == 2 && LegsType == 1)
         {
            LegsType = 2;
         }
         if(gender == 1 && LegsType == 2)
         {
            LegsType = 1;
         }
         if(gender == 1)
         {
            if(portraitShirt == 0 || portraitShirt == 1 || portraitShirt == 3)
            {
               originalBodyType = 1;
            }
            if(portraitShirt == 2 || portraitShirt == 4)
            {
               if(Math.random() < 0.5)
               {
                  originalBodyType = 2;
               }
               else
               {
                  originalBodyType = 3;
               }
            }
         }
         if(gender == 2)
         {
            originalBodyType = 5;
         }
         switch(portraitHair)
         {
            case 0:
            case 1:
            case 2:
            case 6:
            case 7:
            case 10:
            case 11:
            case 14:
            case 15:
            case 18:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 27:
            case 28:
            case 29:
               originalHead = 1;
               break;
            case 3:
            case 26:
            case 31:
               originalHead = 2;
               break;
            case 4:
            case 5:
            case 8:
            case 9:
            case 12:
            case 13:
            case 25:
            case 30:
               originalHead = 3;
               break;
            case 17:
            case 19:
               originalHead = 4;
               break;
            case 16:
               originalHead = 5;
               break;
            default:
               originalHead = 1;
         }
         switch(portraitHair)
         {
            case 2:
            case 4:
            case 5:
            case 10:
            case 12:
            case 13:
            case 25:
               originalBackHairType = 1;
               break;
            case 15:
            case 22:
               originalBackHairType = 2;
               break;
            default:
               originalBackHairType = 0;
         }
         if(portraitBeard == 1 || portraitBeard == 2 || portraitBeard == 3 || portraitBeard == 5 || portraitBeard == 7 || portraitBeard == 8)
         {
            originalBeardType = 2;
         }
         else if(portraitBeard == 6 || portraitBeard == 14 || portraitBeard == 15)
         {
            originalBeardType = 3;
         }
         else if(portraitBeard == 17 || portraitBeard == 18)
         {
            originalBeardType = 4;
         }
         else if(portraitMoustache == 2 || portraitMoustache == 4 || portraitMoustache == 5 || portraitMoustache == 6 || portraitMoustache == 7 || portraitMoustache >= 9 && portraitMoustache <= 16)
         {
            originalBeardType = 1;
         }
         else
         {
            originalBeardType = 0;
         }
      }
      
      public function get portraitBackHair() : *
      {
         if(portraitHair != 1 && portraitHair != 14 && portraitHair != 18 && portraitHair != 20 && portraitHair != 21 && portraitHair != 23 && portraitHair != 24 && portraitHair != 29 && portraitHair != 31)
         {
            return portraitHair;
         }
         return 0;
      }
      
      public function get portraitBackBeard() : *
      {
         if(portraitBeard == 3 || portraitBeard == 4 || portraitBeard == 11 || portraitBeard == 13 || portraitBeard == 17 || portraitBeard == 18)
         {
            return portraitBeard;
         }
         return 0;
      }
      
      public function getPortraitOptions(param1:*) : *
      {
         switch(param1)
         {
            case "hair":
               if(gender == 1)
               {
                  if(age < 30)
                  {
                     return [0,1,2,3,4,5,6,7,10,11,12,13,14,17,19,20,21,23,24,25,26,27,28];
                  }
                  if(age < 45)
                  {
                     return [0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29];
                  }
                  return [0,1,6,7,8,9,12,13,15,16,18,19,20,21,22,24,29];
               }
               return [0,1,2,3,4,5,6,10,12,14,30,31];
               break;
            case "head":
               if(gender == 1)
               {
                  if(age < 25)
                  {
                     return [1,2,3,6,9];
                  }
                  if(age < 40)
                  {
                     return [1,2,3,4,6,8,9];
                  }
                  return [1,3,4,5,6,7,8,9];
               }
               return [1,2,9];
               break;
            case "mouth":
               if(gender == 1)
               {
                  return [2,3,4,5,6,7,9,11];
               }
               return [1,8,9,10,11,12];
               break;
            case "nose":
               if(gender == 1)
               {
                  return [1,3,4,5,6,7,8,9,10,11,12,13,15,16];
               }
               return [2,6,11,13,14,15,16];
               break;
            case "eyebrows":
               if(gender == 1)
               {
                  return [1,3,4,6,7,8,9,10,11];
               }
               return [2,5,7];
               break;
            case "eyes":
               if(gender == 1)
               {
                  return [1,2,4,5,6,7,8,9,10,11];
               }
               return [1,3,10,11,12,13];
               break;
            case "ears":
               return [1,2,3,4,5,6,7];
            case "beard":
               if(gender == 2 || age < 22)
               {
                  return [0];
               }
               if(age < 30)
               {
                  return [0,1,2,4,7,8,9,10,11,12,13,15,16,19];
               }
               if(age < 40)
               {
                  return [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,19];
               }
               return [0,1,3,4,5,6,7,8,11,12,14,15,16,17,18];
               break;
            case "moustache":
               if(gender == 2 || age < 18)
               {
                  return [0];
               }
               if(age < 24)
               {
                  return [0,3,8,15,17];
               }
               if(age < 30)
               {
                  return [0,1,4,5,8,9,10,11,13,14,15];
               }
               if(age < 40)
               {
                  return [0,2,4,5,7,9,10,11,12,13,14];
               }
               return [0,2,7,9,11,12,13,14,16];
               break;
            case "wrinkles":
               if(gender == 1)
               {
                  return [0,1,2,3,4,5];
               }
               return [0,6,7,8,9];
               break;
            case "whiskers":
               if(gender == 2 || age < 19)
               {
                  return [0];
               }
               return [0,1,2,3];
               break;
            case "shirt":
               return [0,1,2,3,4];
            case "necklace":
               return [0,1];
            case "shoulders":
               if(gender == 1)
               {
                  return [1];
               }
               if(gender == 2)
               {
                  return [1];
               }
         }
      }
      
      public function renderAnimation(param1:* = null, param2:* = 3000) : *
      {
         var _loc4_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc3_:* = undefined;
         var _loc16_:* = undefined;
         var _loc15_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc20_:* = undefined;
         var _loc14_:* = undefined;
         var _loc13_:* = undefined;
         var _loc12_:* = undefined;
         var _loc9_:* = undefined;
         var _loc19_:* = undefined;
         var _loc17_:* = undefined;
         if(param1 == null)
         {
            param1 = {
               "character":this,
               "weaponSlot":currSlot,
               "direction":direction,
               "animationPhase":animationPhase,
               "frame":currFrame,
               "animationType":currentWeaponAnimationType
            };
         }
         _loc4_ = new BitmapData(100,100);
         if(param1.direction == 0)
         {
            _loc10_ = ["LeftTopArm","LeftForearm","Beard","Legs","Weapon","Body","RightForearm","RightTopArm","BigGunBackpack","ShoulderPlates","BackHair","Head"];
            if(param1.animationPhase == 4 && param1.frame > 7)
            {
               _loc10_ = ["BigGunBackpack","BackHair","LeftTopArm","LeftForearm","Legs","Weapon","Body","RightForearm","RightTopArm","ShoulderPlates","Head","Beard"];
            }
         }
         if(param1.direction == 1)
         {
            _loc10_ = ["BackHair","BigGunBackpack","LeftTopArm","Legs","Body","LeftForearm","RightTopArm","ShoulderPlates","Head","Beard","Weapon","RightForearm"];
            if(param1.animationPhase == 4 && param1.frame > 3)
            {
               _loc10_ = ["BackHair","BigGunBackpack","LeftTopArm","Head","Beard","ShoulderPlates","Body","Beard","LeftForearm","Legs","Weapon","RightTopArm","RightForearm"];
            }
            else if(param1.character.slotAnimationType(param1.weaponSlot) == 1 && (param1.frame < 4 || param1.frame >= 14))
            {
               _loc10_ = ["BackHair","BigGunBackpack","LeftTopArm","Legs","Body","LeftForearm","RightTopArm","ShoulderPlates","Head","Beard","RightForearm","Weapon"];
            }
            else if(param1.character.slotAnimationType(param1.weaponSlot) == 3)
            {
               _loc10_ = ["BackHair","BigGunBackpack","LeftTopArm","Legs","Body","LeftForearm","ShoulderPlates","RightTopArm","Head","Beard","Weapon","RightForearm"];
            }
            else if(param1.character.slotAnimationType(param1.weaponSlot) == 2 && (param1.frame == 1 || param1.frame >= 16 && param1.frame <= 18))
            {
               _loc10_ = ["BackHair","BigGunBackpack","LeftTopArm","Legs","Body","RightTopArm","ShoulderPlates","Head","Beard","RightForearm","Weapon","LeftForearm"];
            }
            else if(param1.character.slotAnimationType(param1.weaponSlot) == 0)
            {
               if(param1.frame > 4 && param1.frame < 14)
               {
                  _loc10_ = ["BackHair","BigGunBackpack","LeftForearm","LeftTopArm","Legs","Body","RightTopArm","ShoulderPlates","Head","Beard","RightForearm","Weapon"];
               }
               else
               {
                  _loc10_ = ["BackHair","BigGunBackpack","LeftTopArm","Legs","Body","ShoulderPlates","Head","Beard","LeftForearm","RightTopArm","RightForearm","Weapon"];
               }
            }
         }
         if(param1.direction == 2)
         {
            _loc10_ = ["BackHair","BigGunBackpack","RightTopArm","RightForearm","Legs","Body","Weapon","LeftTopArm","ShoulderPlates","Head","Beard","LeftForearm"];
            if(param1.animationPhase == 4 && param1.frame > 3)
            {
               _loc10_ = ["BackHair","BigGunBackpack","RightTopArm","Weapon","Head","Body","Beard","ShoulderPlates","RightForearm","Legs","LeftTopArm","LeftForearm"];
            }
         }
         if(param1.direction == 3)
         {
            _loc10_ = ["RightForearm","RightTopArm","Beard","Weapon","Legs","LeftForearm","Body","LeftTopArm","BigGunBackpack","ShoulderPlates","BackHair","Head"];
            if(param1.animationPhase == 4 && param1.frame > 7)
            {
               _loc10_ = ["BackHair","BigGunBackpack","RightForearm","RightTopArm","Weapon","Legs","LeftForearm","Body","ShoulderPlates","Head","Beard","LeftTopArm"];
            }
         }
         _loc4_ = new BitmapData(100,100,true,0);
         _loc3_ = {
            "r":255,
            "g":0,
            "b":0,
            "bc":1
         };
         _loc16_ = {
            "r":0,
            "g":255,
            "b":0,
            "bc":1
         };
         _loc15_ = {
            "r":0,
            "g":0,
            "b":255,
            "bc":1
         };
         var _loc18_:Date = new Date();
         var _loc5_:Boolean = false;
         _loc9_ = startAtRenderSprite;
         while(_loc9_ < _loc10_.length)
         {
            if(_loc10_[_loc9_] == "Weapon")
            {
               _loc12_ = WeaponsData.Weapons[param1.character.weapons[param1.weaponSlot]].animatedWeapon;
            }
            else if(_loc10_[_loc9_] == "BigGunBackpack")
            {
               _loc12_ = WeaponsData.Weapons[param1.character.weapons[param1.weaponSlot]].bigGunBackpack;
            }
            else if(_loc10_[_loc9_] == "Legs" && Item.Armor[Jacket] is Object && Item.Armor[Jacket].changeLegs > 0)
            {
               _loc12_ = Item.Armor[Jacket].changeLegs;
            }
            else
            {
               _loc12_ = param1.character[_loc10_[_loc9_] + "Type"];
            }
            if(_loc12_ > 0)
            {
               switch(_loc10_[_loc9_])
               {
                  case "Head":
                     _loc3_ = skinColor;
                     if(portraitHair == 0 || portraitHair == 18)
                     {
                        _loc15_ = skinColor;
                     }
                     else
                     {
                        _loc15_ = hairColor;
                     }
                     _loc16_ = headgearColor;
                     break;
                  case "BackHair":
                     _loc15_ = hairColor;
                     break;
                  case "Body":
                     _loc3_ = skinColor;
                     if(BodyType == 5 || BodyType == 6)
                     {
                        if(portraitShirt > 0)
                        {
                           _loc3_ = shirtColor;
                        }
                        _loc15_ = shirtColor;
                     }
                     else if(portraitShirt == 0)
                     {
                        _loc15_ = skinColor;
                     }
                     else
                     {
                        _loc15_ = shirtColor;
                     }
                     _loc16_ = jacketColor;
                     break;
                  case "Beard":
                     _loc15_ = beardColor;
                     break;
                  case "LeftTopArm":
                  case "RightTopArm":
                     if(Jacket >= 14 && Jacket <= 18)
                     {
                        _loc3_ = jacketColor;
                        _loc15_ = jacketColor;
                        _loc16_ = jacketColor;
                     }
                     else
                     {
                        _loc3_ = skinColor;
                        _loc15_ = shirtColor;
                        if(_loc12_ == 1)
                        {
                           if(sleevesType == 0)
                           {
                              _loc15_ = skinColor;
                           }
                           if(sleevesType == 2 || sleevesType == 3 || sleevesType == 5)
                           {
                              _loc3_ = shirtColor;
                           }
                        }
                        _loc16_ = jacketColor;
                     }
                     break;
                  case "LeftForearm":
                  case "RightForearm":
                     if(Jacket >= 14 && Jacket <= 18)
                     {
                        _loc3_ = skinColor;
                        _loc15_ = jacketColor;
                     }
                     else
                     {
                        _loc3_ = skinColor;
                        _loc15_ = shirtColor;
                        if(_loc12_ == 1 || _loc12_ == 2)
                        {
                           if(sleevesType < 3 || sleevesType == 4)
                           {
                              _loc15_ = skinColor;
                           }
                           _loc16_ = braceletColor;
                        }
                     }
                     break;
                  case "Legs":
                     _loc3_ = skinColor;
                     _loc15_ = pantsColor;
                     _loc16_ = shoesColor;
                     break;
                  default:
                     _loc3_ = {
                        "r":255,
                        "g":0,
                        "b":0,
                        "bc":1
                     };
               }
               _loc11_ = [];
               _loc11_ = _loc11_.concat([_loc3_.r / 255 * _loc3_.bc,_loc16_.r / 255 * _loc16_.bc,_loc15_.r / 255 * _loc15_.bc,0,0]);
               _loc11_ = _loc11_.concat([_loc3_.g / 255 * _loc3_.bc,_loc16_.g / 255 * _loc16_.bc,_loc15_.g / 255 * _loc15_.bc,0,0]);
               _loc11_ = _loc11_.concat([_loc3_.b / 255 * _loc3_.bc,_loc16_.b / 255 * _loc16_.bc,_loc15_.b / 255 * _loc15_.bc,0,0]);
               _loc11_ = _loc11_.concat([0,0,0,1,0]);
               _loc6_ = new ColorMatrixFilter(_loc11_);
               if(_loc10_[_loc9_] == "LeftTopArm" || _loc10_[_loc9_] == "LeftForearm" || _loc10_[_loc9_] == "RightTopArm" || _loc10_[_loc9_] == "RightForearm")
               {
                  _loc14_ = "arms";
               }
               if(_loc10_[_loc9_] == "Head" || _loc10_[_loc9_] == "Body" || _loc10_[_loc9_] == "Beard" || _loc10_[_loc9_] == "BackHair" || _loc10_[_loc9_] == "ShoulderPlates")
               {
                  _loc14_ = "body";
               }
               if(_loc10_[_loc9_] == "Legs")
               {
                  _loc14_ = "legs";
               }
               if(_loc10_[_loc9_] == "Weapon" || _loc10_[_loc9_] == "BigGunBackpack")
               {
                  _loc14_ = "weapon";
               }
               if(param1.animationPhase <= 4)
               {
                  _loc20_ = AnimationData.fullAnimationTypeFrames[param1.animationType][param1.animationPhase][param1.frame][_loc14_];
               }
               if(param1.animationPhase == 5)
               {
                  _loc20_ = AnimationData.vehicleGunFrame[_loc14_];
               }
               _loc19_ = new BitmapData(100,100,true,0);
               if(param1.animationPhase == 1 && _loc14_ != "legs")
               {
                  if(param1.frame == 1 || param1.frame == 5)
                  {
                     _loc13_ = -2;
                  }
                  if(param1.frame == 2 || param1.frame == 4 || param1.frame == 6 || param1.frame == 8)
                  {
                     _loc13_ = -1;
                  }
                  if(param1.frame == 3 || param1.frame == 7)
                  {
                     _loc13_ = 0;
                  }
               }
               else
               {
                  _loc13_ = 0;
               }
               if(_loc10_[_loc9_] != "Weapon" && _loc10_[_loc9_] != "BigGunBackpack" && !preserveColor(_loc10_[_loc9_]))
               {
                  if(_loc12_ > 0)
                  {
                     _loc19_.applyFilter(AnimationData.getSprite(_loc10_[_loc9_],_loc12_,param1.direction,_loc20_),new Rectangle(0,0,AnimationData.spriteBoundaries[_loc10_[_loc9_]][_loc12_][param1.direction][_loc20_].width,AnimationData.spriteBoundaries[_loc10_[_loc9_]][_loc12_][param1.direction][_loc20_].height),new Point(AnimationData.spriteBoundaries[_loc10_[_loc9_]][_loc12_][param1.direction][_loc20_].x,AnimationData.spriteBoundaries[_loc10_[_loc9_]][_loc12_][param1.direction][_loc20_].y + _loc13_),_loc6_);
                  }
               }
               else if(_loc12_ > 0)
               {
                  _loc19_.copyPixels(AnimationData.getSprite(_loc10_[_loc9_],_loc12_,param1.direction,_loc20_),new Rectangle(0,0,AnimationData.spriteBoundaries[_loc10_[_loc9_]][_loc12_][param1.direction][_loc20_].width,AnimationData.spriteBoundaries[_loc10_[_loc9_]][_loc12_][param1.direction][_loc20_].height),new Point(AnimationData.spriteBoundaries[_loc10_[_loc9_]][_loc12_][param1.direction][_loc20_].x,AnimationData.spriteBoundaries[_loc10_[_loc9_]][_loc12_][param1.direction][_loc20_].y + _loc13_));
               }
               _loc4_.copyPixels(_loc19_,new Rectangle(0,0,100,100),new Point(0,0),null,null,true);
               _loc19_.dispose();
            }
            _loc17_ = new Date();
            if(_loc17_ - _loc18_ > param2 && _loc9_ < _loc10_.length - 1)
            {
               startAtRenderSprite = _loc9_ + 1;
               _loc5_ = true;
               break;
            }
            _loc9_++;
         }
         if(!_loc5_)
         {
            startAtRenderSprite = 0;
         }
         return _loc4_;
      }
      
      public function generatePortrait() : *
      {
         var _loc4_:* = undefined;
         var _loc12_:* = undefined;
         var _loc14_:* = undefined;
         var _loc6_:* = undefined;
         var _loc13_:* = undefined;
         var _loc10_:* = undefined;
         var _loc8_:* = undefined;
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         if(specialPortrait > 0)
         {
            return new ImportedBitmap("SpecialCharacter" + specialPortrait + ".png").bitmapData;
         }
         var _loc11_:int = 250;
         var _loc1_:int = 250;
         var _loc15_:Array = ["BackHair","Shoulders","Shirt","Necklace","BackBeard","Head","EyeSockets","Ears","Wrinkles","Eyes","Eyebrows","Nose","Mouth","Whiskers","Beard","Moustache","Hair"];
         var _loc3_:BitmapData = new BitmapData(_loc11_,_loc1_,true,0);
         var _loc7_:* = ColorFunctions.rgb2hsv(skinColor.r,skinColor.g,skinColor.b);
         _loc7_.h = Math.max(_loc7_.h - 10,0);
         _loc7_.s = Math.min(_loc7_.s + 10,100);
         var _loc9_:* = ColorFunctions.hsv2rgb(_loc7_.h,_loc7_.s,_loc7_.v);
         _loc9_.bc = 1;
         for(_loc6_ in _loc15_)
         {
            if(this["portrait" + _loc15_[_loc6_]] > 0)
            {
               _loc2_ = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               _loc13_ = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               _loc10_ = {
                  "r":0,
                  "g":0,
                  "b":0,
                  "bc":1
               };
               switch(_loc15_[_loc6_])
               {
                  case "Shoulders":
                  case "Ears":
                  case "Wrinkles":
                  case "Nose":
                     _loc2_ = skinColor;
                     _loc13_ = _loc9_;
                     break;
                  case "Head":
                     _loc2_ = skinColor;
                     _loc10_ = bristleColor;
                     _loc13_ = _loc9_;
                     break;
                  case "Eyes":
                     _loc2_ = eyeSocketsColor;
                     _loc10_ = {
                        "r":240,
                        "g":225,
                        "b":210,
                        "bc":1
                     };
                     _loc13_ = eyesColor;
                     break;
                  case "Mouth":
                     _loc2_ = skinColor;
                     _loc10_ = lipsColor;
                     _loc13_ = {
                        "r":250,
                        "g":240,
                        "b":230,
                        "bc":1
                     };
                     break;
                  case "Hair":
                  case "Whiskers":
                  case "BackHair":
                     _loc2_ = skinColor;
                     _loc10_ = hairColor;
                     break;
                  case "Beard":
                  case "BackBeard":
                  case "Moustache":
                     _loc2_ = skinColor;
                     _loc10_ = beardColor;
                     break;
                  case "Eyebrows":
                     _loc2_ = skinColor;
                     _loc10_ = eyebrowsColor;
                     break;
                  case "EyeSockets":
                     _loc2_ = eyeSocketsColor;
                     break;
                  case "Shirt":
                     _loc10_ = shirtColor;
               }
               _loc8_ = [];
               _loc8_ = _loc8_.concat([_loc2_.r / 255 * _loc2_.bc,_loc13_.r / 255 * _loc13_.bc,_loc10_.r / 255 * _loc10_.bc,0,0]);
               _loc8_ = _loc8_.concat([_loc2_.g / 255 * _loc2_.bc,_loc13_.g / 255 * _loc13_.bc,_loc10_.g / 255 * _loc10_.bc,0,0]);
               _loc8_ = _loc8_.concat([_loc2_.b / 255 * _loc2_.bc,_loc13_.b / 255 * _loc13_.bc,_loc10_.b / 255 * _loc10_.bc,0,0]);
               _loc8_ = _loc8_.concat([0,0,0,1,0]);
               _loc5_ = new ColorMatrixFilter(_loc8_);
               _loc14_ = new ImportedBitmap("CP" + _loc15_[_loc6_] + this["portrait" + _loc15_[_loc6_]] + ".png").bitmapData;
               if(_loc15_[_loc6_] != "Necklace")
               {
                  _loc14_.applyFilter(_loc14_,new Rectangle(0,0,_loc11_,_loc1_),new Point(0,0),_loc5_);
               }
               _loc4_ = _loc12_ = 0;
               if((_loc15_[_loc6_] == "Beard" || _loc15_[_loc6_] == "BackBeard") && portraitBeard != 9 && portraitBeard != 4 && portraitBeard != 19)
               {
                  switch(portraitHead)
                  {
                     case 4:
                        _loc4_ = -1;
                        break;
                     case 7:
                        _loc4_ = -7;
                        _loc12_ = 2;
                  }
               }
               if(_loc15_[_loc6_] == "Moustache" || _loc15_[_loc6_] == "Beard" && portraitBeard == 9)
               {
                  switch(portraitMouth)
                  {
                     case 5:
                        _loc12_ = -3;
                        break;
                     case 2:
                        _loc4_ = -2;
                        break;
                     case 6:
                        _loc4_ = -3;
                        _loc12_ = -3;
                  }
               }
               _loc3_.copyPixels(_loc14_,new Rectangle(0,0,_loc11_,_loc1_),new Point(_loc4_,_loc12_),null,null,true);
            }
         }
         return _loc3_;
      }
      
      public function getPortrait(param1:* = false) : *
      {
         if(!(savedPortrait is Bitmap) || param1)
         {
            savedPortrait = new Bitmap(generatePortrait());
            savedPortrait.smoothing = true;
            savedPortrait.name = "char portrait";
         }
         return savedPortrait;
      }
      
      public function get picture() : *
      {
         return getPortrait();
      }
      
      public function get health() : *
      {
         return HP;
      }
      
      public function set health(param1:*) : *
      {
         HP = param1;
      }
      
      public function get maxHealth() : *
      {
         return maxHP;
      }
      
      public function get passengerSpaces() : *
      {
         return 1;
      }
      
      public function removeFromPassengers() : *
      {
         if(passengerIn is TransportUnit)
         {
            passengerIn.removePassenger(this);
         }
      }
      
      public function get currentWeaponData() : *
      {
         return WeaponsData.Weapons[weapons[currSlot]];
      }
      
      public function get currentWeaponType() : *
      {
         return WeaponsData.WeaponTypes[currentWeaponData.type];
      }
      
      public function weaponModeAP(param1:* = null, param2:* = null) : *
      {
         var _loc3_:* = undefined;
         if(param2 == null)
         {
            param2 = currSlot;
         }
         if(param1 == null)
         {
            param1 = currModes[param2];
         }
         if(param1 >= WeaponsData.WeaponTypes[WeaponsData.Weapons[weapons[param2]].type].modes.length)
         {
            return null;
         }
         _loc3_ = WeaponsData.WeaponTypes[WeaponsData.Weapons[weapons[param2]].type].modes[param1].AP;
         if(armDamage)
         {
            _loc3_ *= 2;
         }
         return _loc3_;
      }
      
      public function get currentWeaponIsUsable() : *
      {
         var _loc3_:* = undefined;
         var _loc1_:* = 100000000000000000000;
         var _loc2_:Boolean = false;
         for(_loc3_ in currentWeaponType.modes)
         {
            if(weaponModeAP(_loc3_) < _loc1_)
            {
               _loc1_ = weaponModeAP(_loc3_);
            }
         }
         if(maxAP < _loc1_)
         {
            trace("CAN\'T USE THE WEAPON BECAUSE there\'s not enough AP for the minimum Ap mode");
            return false;
         }
         if(currentWeaponType.category >= 2 && currentWeaponType.category <= 4 && (!(loadedAmmo[currSlot] is Item) || loadedAmmo[currSlot] is Item && loadedAmmo[currSlot].amount == 0))
         {
            if(currentWeaponReloadAP > maxAP)
            {
               trace("CAN\'T USE THE WEAPON BECAUSE reload takes more AP than the character can possibly have");
               return false;
            }
            _loc2_ = false;
            for(_loc3_ in equipment)
            {
               if(equipment[_loc3_].category == 3 && equipment[_loc3_].itemData.type == currentWeaponData.ammo)
               {
                  _loc2_ = true;
                  break;
               }
            }
            if(!_loc2_)
            {
               trace("CAN\'T USE THE WEAPON BECAUSE there\'s no ammo to reload");
               return false;
            }
         }
         return true;
      }
      
      public function get currentWeaponMode() : *
      {
         if(currModes[currSlot] >= currentWeaponType.modes.length)
         {
            currModes[currSlot] = 0;
         }
         return currentWeaponType.modes[currModes[currSlot]];
      }
      
      public function weaponAmmoCapacity(param1:* = null) : *
      {
         if(param1 == null)
         {
            param1 = currSlot;
         }
         return WeaponsData.Weapons[weapons[param1]].ammoCapacity;
      }
      
      public function get currentWeaponAnimationType() : *
      {
         return slotAnimationType(currSlot);
      }
      
      public function slotAnimationType(param1:*) : *
      {
         if(WeaponsData.Weapons[weapons[param1]].animatedWeapon == 0 && WeaponsData.Weapons[weapons[param1]].type == 10)
         {
            return 7;
         }
         return WeaponsData.AnimationTypes[WeaponsData.Weapons[weapons[param1]].animatedWeapon];
      }
      
      public function get currentAmmo() : *
      {
         if(currentWeaponData.ammo == 17)
         {
            return new Item(231,Math.floor(caravan.money));
         }
         if(loadedAmmo[currSlot] is Item)
         {
            return loadedAmmo[currSlot];
         }
         return new Item(0,0);
      }
      
      public function get currentAmmoData() : *
      {
         if(currentWeaponData.ammo == 17)
         {
            return WeaponsData.Ammo[34];
         }
         if(currentAmmo.type != 0)
         {
            return WeaponsData.Ammo[currentAmmo.subCategory];
         }
      }
      
      public function maxThrowDistance(param1:*, param2:*) : *
      {
         var _loc4_:Number = physical * 10000 + Math.pow(throwExperience,0.5) * 3000;
         var _loc6_:Number = Math.sqrt(_loc4_ / (currentWeaponData.weight * 1000));
         var _loc5_:Number = Math.sin(param2) * _loc6_;
         var _loc7_:Number = (0 - _loc5_ + Math.sqrt(Math.pow(_loc5_,2) + 19.6 * param1)) / -9.8;
         var _loc8_:Number = (0 - _loc5_ - Math.sqrt(Math.pow(_loc5_,2) + 19.6 * param1)) / -9.8;
         var _loc3_:Number = Math.max(_loc7_,_loc8_);
         return Math.cos(param2) * _loc6_ * _loc3_;
      }
      
      public function IFF(param1:*) : *
      {
         return band == param1.band || band == 3 || param1.band == 3;
      }
      
      public function updateSelectedAmmo(param1:* = null) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = undefined;
         if(param1 == null)
         {
            param1 = currSlot;
         }
         if(weapons[param1] > 0 && (WeaponsData.WeaponTypes[WeaponsData.Weapons[weapons[param1]].type].category == 2 || WeaponsData.WeaponTypes[WeaponsData.Weapons[weapons[param1]].type].category == 3 || WeaponsData.WeaponTypes[WeaponsData.Weapons[weapons[param1]].type].category == 4))
         {
            if(WeaponsData.Weapons[weapons[param1]].ammo == 17)
            {
               selectedAmmo[param1] = 231;
            }
            else
            {
               _loc4_ = false;
               _loc2_ = WeaponsData.Weapons[weapons[param1]].ammo;
               if(selectedAmmo[param1] != null)
               {
                  if(WeaponsData.Ammo[Item.Items[selectedAmmo[param1]].subCategory].type == _loc2_)
                  {
                     _loc3_ = 0;
                     while(_loc3_ < equipment.length)
                     {
                        if(equipment[_loc3_].type == selectedAmmo[param1])
                        {
                           if(equipment[_loc3_].amount > 0)
                           {
                              if(equipment[_loc3_].amount - equipment[_loc3_].inUse > 0)
                              {
                                 _loc4_ = true;
                              }
                              break;
                           }
                           equipment.splice(_loc3_,1);
                           _loc3_--;
                        }
                        _loc3_++;
                     }
                  }
               }
               if(!_loc4_)
               {
                  selectedAmmo[param1] = null;
                  for(_loc3_ in equipment)
                  {
                     if(equipment[_loc3_].category == 3 && equipment[_loc3_].itemData.type == _loc2_ && equipment[_loc3_].amount - equipment[_loc3_].inUse > 0)
                     {
                        selectedAmmo[param1] = equipment[_loc3_].type;
                        break;
                     }
                  }
               }
            }
         }
         else
         {
            selectedAmmo[param1] = null;
         }
      }
      
      public function changeSelectedAmmo(param1:*, param2:* = null) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = 0;
         if(param2 == null)
         {
            param2 = currSlot;
         }
         if(weapons[param2] == null)
         {
            return false;
         }
         for(_loc3_ in equipment)
         {
            if(equipment[_loc3_].type == selectedAmmo[param2])
            {
               _loc4_ = _loc3_;
               break;
            }
         }
         _loc3_ = 1;
         while(Math.abs(_loc3_ * param1) <= equipment.length)
         {
            _loc4_ += param1;
            if(_loc4_ >= equipment.length)
            {
               _loc4_ -= equipment.length;
            }
            if(_loc4_ < 0)
            {
               _loc4_ += equipment.length;
            }
            if(equipment[_loc4_].category == 3 && equipment[_loc4_].itemData.type == WeaponsData.Weapons[weapons[param2]].ammo && equipment[_loc4_].amount - equipment[_loc4_].inUse > 0)
            {
               selectedAmmo[param2] = equipment[_loc4_].type;
               break;
            }
            _loc3_++;
         }
      }
      
      public function reload(param1:* = null) : *
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:* = undefined;
         if(param1 == null)
         {
            param1 = currSlot;
         }
         if(WeaponsData.WeaponTypes[WeaponsData.Weapons[weapons[param1]].type].category == 2 || WeaponsData.WeaponTypes[WeaponsData.Weapons[weapons[param1]].type].category == 3 || WeaponsData.WeaponTypes[WeaponsData.Weapons[weapons[param1]].type].category == 4)
         {
            if(selectedAmmo[param1] == null)
            {
               updateSelectedAmmo(param1);
            }
            if(loadedAmmo[param1] != null && loadedAmmo[param1].amount >= weaponAmmoCapacity(param1) && loadedAmmo[param1].type == selectedAmmo[param1])
            {
               trace("ammo full");
            }
            else
            {
               _loc2_ = false;
               for(_loc4_ in equipment)
               {
                  if(equipment[_loc4_].category == 3 && equipment[_loc4_].type == selectedAmmo[param1])
                  {
                     var infiniteAmmo:* = GameData.currentGame.Config("infinite ammo")
                     if(infiniteAmmo) {
                        _loc3_ = weaponAmmoCapacity(param1);
                     }
                     else {
                        unloadWeapon(param1);
                        _loc3_ = Math.min(weaponAmmoCapacity(param1),equipment[_loc4_].amount - equipment[_loc4_].inUse);
                        equipment[_loc4_].inUse += _loc3_;
                     }

                     loadedAmmo[param1] = new Item(selectedAmmo[param1],_loc3_);
                     _loc2_ = true;
                     trace("loading " + _loc3_ + " of " + selectedAmmo[param1] + " into slot " + param1);
                  }
               }
               if(_loc2_)
               {
                  updateSelectedAmmo(param1);
                  return true;
               }
               trace("out of ammo");
            }
         }
         return false;
      }
      
      internal function unloadWeapon(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(loadedAmmo[param1] is Item && loadedAmmo[param1].amount > 0)
         {
            for(_loc2_ in equipment)
            {
               if(equipment[_loc2_].type == loadedAmmo[param1].type && !GameData.currentGame.Config("infinite ammo"))
               {
                  equipment[_loc2_].inUse -= loadedAmmo[param1].amount;
               }
            }
            loadedAmmo[param1].amount = 0;
            return true;
         }
         return false;
      }
      
      public function updateFirstAid() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         hasFirstAid = false;
         for(_loc2_ in equipment)
         {
            if(equipment[_loc2_].type == selectedFirstAidType)
            {
               hasFirstAid = true;
               _loc1_ = true;
               break;
            }
         }
         if(!_loc1_)
         {
            for(_loc2_ in equipment)
            {
               if(equipment[_loc2_].itemData.firstAidKit)
               {
                  hasFirstAid = true;
                  selectedFirstAidType = equipment[_loc2_].type;
                  break;
               }
            }
         }
         selectedFirstAidAmount = 0;
         if(hasFirstAid)
         {
            for(_loc2_ in equipment)
            {
               if(equipment[_loc2_].type == selectedFirstAidType)
               {
                  selectedFirstAidAmount += equipment[_loc2_].amount;
               }
            }
         }
      }
      
      public function firstAidStep(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:* = undefined;
         if(hasFirstAid && param1 != 0)
         {
            _loc2_ = null;
            for(_loc3_ in equipment)
            {
               if(equipment[_loc3_].type == selectedFirstAidType)
               {
                  _loc2_ = _loc3_;
                  break;
               }
            }
            if(_loc2_ != null)
            {
               _loc4_ = 0;
               while(_loc4_ < equipment.length)
               {
                  _loc2_ += param1;
                  _loc4_ += Math.abs(param1);
                  while(_loc2_ >= equipment.length)
                  {
                     _loc2_ -= equipment.length;
                  }
                  while(_loc2_ < 0)
                  {
                     _loc2_ += equipment.length;
                  }
                  if(equipment[_loc2_].itemData.firstAidKit)
                  {
                     selectedFirstAidType = equipment[_loc2_].type;
                     selectedFirstAidAmount = equipment[_loc2_].amount;
                     break;
                  }
               }
            }
            trace("selected first aid kit: " + Item.getDataFromType(selectedFirstAidType).name);
         }
      }
      
      public function lookAt(param1:*, param2:*) : *
      {
         var _loc3_:Number = param1 - x;
         var _loc4_:Number = param2 - y;
         if(Math.abs(_loc3_) > Math.abs(_loc4_))
         {
            if(_loc3_ > 0)
            {
               direction = 1;
            }
            else
            {
               direction = 3;
            }
         }
         else if(_loc4_ > 0)
         {
            direction = 2;
         }
         else
         {
            direction = 0;
         }
      }
      
      public function addItemToEquipment(param1:*, param2:* = false) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:Boolean = false;
         for(_loc4_ in equipment)
         {
            if(equipment[_loc4_].type == param1.type)
            {
               equipment[_loc4_].amount += param1.amount;
               if(param2)
               {
                  equipment[_loc4_].inUse += param1.amount;
               }
               _loc3_ = true;
               break;
            }
         }
         if(!_loc3_)
         {
            equipment.push(new Item(param1.type,param1.amount));
            if(param2)
            {
               equipment[equipment.length - 1].inUse = param1.amount;
            }
         }
      }
      
      public function attachmentsBatteryStatus() : *
      {
         var _loc5_:* = undefined;
         var _loc1_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = 0;
         _loc1_ = [[true,true],[true,true]];
         for(_loc4_ in equipment)
         {
            if(equipment[_loc4_].type == 219)
            {
               _loc2_ += equipment[_loc4_].amount;
               break;
            }
         }
         for(_loc4_ in attachments)
         {
            for(_loc5_ in attachments[_loc4_])
            {
               if(attachments[_loc4_][_loc5_] > 0)
               {
                  _loc3_ = Item.getDataFromType(Item.itemNumFromCatSubCat(4,attachments[_loc4_][_loc5_]));
                  if(_loc3_.batteries > _loc2_)
                  {
                     _loc1_[_loc4_][_loc5_] = false;
                  }
                  else if(_loc3_.batteries > 0)
                  {
                     _loc2_ -= _loc3_.batteries;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function reduceItemFromEquipment(param1:*, param2:*, param3:* = false, param4:* = false) : *
      {
         var _loc5_:* = undefined;
         for(_loc5_ in equipment)
         {
            if(equipment[_loc5_].type == param1)
            {
               if(param3)
               {
                  equipment[_loc5_].inUse -= param2;
               }
               equipment[_loc5_].amount -= param2;
               if(equipment[_loc5_].amount < 0.5)
               {
                  equipment.splice(_loc5_,1);
               }
               break;
            }
         }
         if(param4)
         {
            for(_loc5_ in caravan.Cargo)
            {
               if(caravan.Cargo[_loc5_].type == param1)
               {
                  caravan.Cargo[_loc5_].inUse -= param2;
                  break;
               }
            }
         }
         else
         {
            caravan.reduceCargo(param1,param2,true);
         }
      }
      
      public function unequip(param1:*, param2:*) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         if(param1 <= 0)
         {
            return;
         }
         reduceItemFromEquipment(param1,param2,false,true);
         var _loc6_:Item = new Item(param1,1);
         var _loc3_:* = param2;
         if(_loc6_.category == 2)
         {
            for(_loc4_ in weapons)
            {
               if(weapons[_loc4_] == _loc6_.subCategory)
               {
                  if(_loc6_.weaponType.category == 5)
                  {
                     _loc8_ = Math.min(_loc3_,grenadeAmounts[_loc4_]);
                     grenadeAmounts[_loc4_] -= _loc8_;
                     if(grenadeAmounts[_loc4_] <= 0)
                     {
                        weapons[_loc4_] = 0;
                     }
                     _loc3_ -= _loc8_;
                  }
                  else
                  {
                     weapons[_loc4_] = 0;
                     _loc3_--;
                  }
               }
               if(_loc3_ <= 0)
               {
                  break;
               }
            }
            checkAttachmentsCompatibility();
         }
         if(_loc6_.category == 3)
         {
            for(_loc4_ in weapons)
            {
               updateSelectedAmmo(_loc4_);
            }
         }
         if(_loc6_.category == 4)
         {
            for(_loc4_ in attachments)
            {
               if(attachments[_loc4_] is Array)
               {
                  for(_loc5_ in attachments[_loc4_])
                  {
                     if(attachments[_loc4_][_loc5_] == _loc6_.subCategory)
                     {
                        attachments[_loc4_][_loc5_] = undefined;
                        _loc3_--;
                        if(_loc3_ <= 0)
                        {
                           break;
                        }
                     }
                  }
               }
               if(_loc3_ <= 0)
               {
                  break;
               }
            }
         }
         if(_loc6_.category == 5)
         {
            if(_loc6_.itemData.type == 1)
            {
               Jacket = 0;
            }
            if(_loc6_.itemData.type == 2)
            {
               Headgear = 0;
            }
         }
      }
      
      public function checkAttachmentsCompatibility() : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc2_:* = undefined;
         var _loc1_:* = undefined;
         var _loc3_:* = undefined;
         for(_loc3_ in attachments)
         {
            if(weapons[_loc3_] > 0)
            {
               _loc2_ = WeaponsData.detectWeaponSkill(WeaponsData.Weapons[weapons[_loc3_]]);
            }
            else
            {
               _loc2_ = null;
            }
            for(_loc4_ in attachments[_loc3_])
            {
               if(attachments[_loc3_][_loc4_] > 0)
               {
                  _loc1_ = false;
                  for(_loc5_ in WeaponsData.Attachments[attachments[_loc3_][_loc4_]].applicable)
                  {
                     if(WeaponsData.Attachments[attachments[_loc3_][_loc4_]].applicable[_loc5_] == _loc2_)
                     {
                        _loc1_ = true;
                        break;
                     }
                  }
                  if(!_loc1_)
                  {
                     reduceItemFromEquipment(Item.itemNumFromCatSubCat(4,attachments[_loc3_][_loc4_]),1,false,true);
                     attachments[_loc3_][_loc4_] = null;
                  }
               }
            }
         }
      }
      
      public function get equipmentWeight() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = 0;
         for(_loc2_ in equipment)
         {
            _loc1_ += equipment[_loc2_].weightPerUnit * equipment[_loc2_].amount;
         }
         return _loc1_;
      }
      
      public function get availableCapacity() : *
      {
         return capacity - equipmentWeight;
      }
      
      public function attachmentsEffects(param1:* = null) : *
      {
         var _loc7_:* = undefined;
         var _loc3_:* = undefined;
         var _loc6_:* = undefined;
         if(param1 == null)
         {
            param1 = currSlot;
         }
         var _loc2_:Object = {};
         var _loc4_:Array = ["Accuracy","AP","Spread"];
         for(_loc6_ in _loc4_)
         {
            _loc2_[_loc4_[_loc6_].toLowerCase()] = 0;
         }
         var _loc5_:* = attachmentsBatteryStatus();
         for(_loc6_ in attachments[param1])
         {
            if(attachments[param1][_loc6_] > 0 && _loc5_[param1][_loc6_])
            {
               _loc3_ = true;
               if(WeaponsData.Attachments[attachments[param1][_loc6_]].scope && !(currentWeaponType.modes[currModes[param1]].headShot || currentWeaponType.modes[currModes[param1]].aimed))
               {
                  _loc3_ = false;
               }
               if(WeaponsData.Attachments[attachments[param1][_loc6_]].laser && (currentWeaponType.modes[currModes[param1]].headShot || currentWeaponType.modes[currModes[param1]].aimed))
               {
                  _loc3_ = false;
               }
               if(_loc3_)
               {
                  for(_loc7_ in _loc4_)
                  {
                     if(WeaponsData.Attachments[attachments[param1][_loc6_]]["affect" + _loc4_[_loc7_]] != undefined)
                     {
                        var _loc9_:* = _loc4_[_loc7_].toLowerCase();
                        var _loc8_:Number = _loc2_[_loc9_] + WeaponsData.Attachments[attachments[param1][_loc6_]]["affect" + _loc4_[_loc7_]];
                        _loc2_[_loc9_] = _loc8_;
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function get APperSquare() : *
      {
         if(legDamage)
         {
            return 2;
         }
         return 1;
      }
      
      public function get physical() : *
      {
         var _loc1_:* = basePhysical;
         var _loc2_:Number = weight / idealWeight;
         if(_loc2_ < 0.5)
         {
            _loc1_ -= 4;
         }
         else if(_loc2_ < 0.6)
         {
            _loc1_ -= 3;
         }
         else if(_loc2_ < 0.7)
         {
            _loc1_ -= 2;
         }
         else if(_loc2_ < 0.8)
         {
            _loc1_--;
         }
         return Math.max(_loc1_,1);
      }
      
      public function get physicalLossReasons() : *
      {
         var _loc1_:Array = [];
         if(weight / idealWeight < 0.8)
         {
            _loc1_.push(1554);
         }
         return _loc1_;
      }
      
      public function get agility() : *
      {
         var _loc1_:* = baseAgility;
         if(HP < maxHP * 0.25)
         {
            _loc1_--;
         }
         if(HP < maxHP * 0.15)
         {
            _loc1_--;
         }
         var _loc2_:Number = weight / idealWeight;
         if(_loc2_ > 3.6)
         {
            _loc1_ -= 9;
         }
         else if(_loc2_ > 3.4)
         {
            _loc1_ -= 8;
         }
         else if(_loc2_ > 3.1)
         {
            _loc1_ -= 7;
         }
         else if(_loc2_ > 2.8)
         {
            _loc1_ -= 6;
         }
         else if(_loc2_ > 2.5)
         {
            _loc1_ -= 5;
         }
         else if(_loc2_ > 2.2)
         {
            _loc1_ -= 4;
         }
         else if(_loc2_ > 1.9)
         {
            _loc1_ -= 3;
         }
         else if(_loc2_ > 1.6)
         {
            _loc1_ -= 2;
         }
         else if(_loc2_ > 1.3)
         {
            _loc1_--;
         }
         return Math.max(_loc1_,1);
      }
      
      public function get agilityLossReasons() : *
      {
         var _loc1_:Array = [];
         if(HP < maxHP * 0.25)
         {
            _loc1_.push(1552);
         }
         if(weight / idealWeight > 1.3)
         {
            _loc1_.push(1553);
         }
         return _loc1_;
      }
      
      public function get accuracy() : *
      {
         var _loc1_:* = baseAccuracy;
         if(HP < maxHP * 0.2)
         {
            _loc1_--;
         }
         if(HP < maxHP * 0.1)
         {
            _loc1_--;
         }
         if(eyeDamage)
         {
            _loc1_ -= 2;
         }
         return Math.max(_loc1_,0);
      }
      
      public function get accuracyLossReasons() : *
      {
         var _loc1_:Array = [];
         if(HP < maxHP * 0.2)
         {
            _loc1_.push(1552);
         }
         return _loc1_;
      }
      
      public function get intelligence() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = baseIntelligence;
         var _loc2_:Number = HP / maxHP;
         if(_loc2_ < 0.1)
         {
            _loc1_ -= 2;
         }
         else if(_loc2_ < 0.2)
         {
            _loc1_ -= 1;
         }
         return Math.max(_loc1_,0);
      }
      
      public function get intelligenceLossReasons() : *
      {
         var _loc1_:Array = [];
         if(HP / maxHP < 0.2)
         {
            _loc1_.push(1552);
         }
         return _loc1_;
      }
      
      public function get maxHP() : *
      {
         return Math.max(physical * 20,1);
      }
      
      public function get HP() : *
      {
         if(_HP > maxHP)
         {
            return maxHP;
         }
         return _HP;
      }
      
      public function set HP(param1:*) : *
      {
         _HP = param1;
      }
      
      public function get maxAP() : *
      {
         var _loc1_:* = 5 + Math.round(agility * 1.5 + Math.pow(generalBattleExperience,0.5) / 40);
         if(battleMorale < 20)
         {
            _loc1_--;
         }
         if(battleMorale < 10)
         {
            _loc1_--;
         }
         if(battleMorale > 80)
         {
            _loc1_++;
         }
         if(battleMorale > 90)
         {
            _loc1_++;
         }
         if(battleMorale > 99)
         {
            _loc1_++;
         }
         var _loc2_:Number = equipmentWeight / capacity;
         if(_loc2_ > 1)
         {
            _loc1_--;
         }
         if(_loc2_ > 1.2)
         {
            _loc1_--;
         }
         if(_loc2_ <= 0.5)
         {
            _loc1_++;
         }
         return Math.max(_loc1_,2);
      }
      
      public function get walkAP() : *
      {
         if(legDamage)
         {
            return 2;
         }
         return 1;
      }
      
      public function get BMR() : *
      {
         return (66 + 13.7 * weight + 5 * Height - 6.8 * age) * 1.2;
      }
      
      public function get GDA() : *
      {
         return (66 + 13.7 * idealWeight + 5 * Height - 6.8 * age) * 1.2;
      }
      
      public function get waterConsumption() : *
      {
         return weight * 0.035;
      }
      
      public function reduceAP(param1:*) : *
      {
         AP -= param1;
         generalBattleExperience += param1 * (0.5 + learningCapacity * 0.5);
      }
      
      public function get capacity() : *
      {
         var _loc1_:Number = physical * 8 + Math.pow(travelExperience,0.3);
         if(HP < maxHP * 0.05)
         {
            _loc1_ *= 0.05;
         }
         else if(HP < maxHP * 0.1)
         {
            _loc1_ *= 0.1;
         }
         else if(HP < maxHP * 0.15)
         {
            _loc1_ *= 0.2;
         }
         else if(HP < maxHP * 0.2)
         {
            _loc1_ *= 0.4;
         }
         else if(HP < maxHP * 0.25)
         {
            _loc1_ *= 0.8;
         }
         return _loc1_;
      }
      
      public function get wounded() : *
      {
         var _loc1_:* = maxHP;
         var _loc2_:* = HP;
         if(_loc1_ - _loc2_ < 0.5)
         {
            return 0;
         }
         if(_loc2_ > _loc1_ * 0.8)
         {
            return 1;
         }
         if(_loc2_ > _loc1_ * 0.4)
         {
            return 2;
         }
         if(_loc2_ > _loc1_ * 0.1)
         {
            return 3;
         }
         return 4;
      }
      
      public function get unarmedDamage() : *
      {
         return (physical * 1.5 + accuracy * 0.4 + Math.pow(closeBattleExperience,0.5) / 20 + Math.pow(unarmedExperience,0.5) / 5) * 0.5;
      }
      
      public function meleeDamage(param1:*) : *
      {
         var _loc2_:* = WeaponsData.detectWeaponSkill(param1);
         return physical * 1.8 + accuracy * 0.7 + Math.pow(closeBattleExperience,0.5) / 20 + Math.pow(this[_loc2_ + "Experience"],0.5) / 10;
      }
      
      public function get closeBattleDodge() : *
      {
         return agility * 2 + Math.pow(closeBattleExperience,0.5) / 10 + Math.pow(dodgeExperience,0.5) / 5;
      }
      
      public function get unarmedHitChance() : *
      {
         return agility * 7 + accuracy * 9 + Math.pow(unarmedExperience,0.5) / 3 + Math.pow(closeBattleExperience,0.5) / 6;
      }
      
      public function meleeHitChance(param1:*) : *
      {
         var _loc2_:* = WeaponsData.detectWeaponSkill(param1);
         return agility * 7 + accuracy * 9 + Math.pow(this[_loc2_ + "Experience"],0.5) / 3 + Math.pow(closeBattleExperience,0.5) / 6;
      }
      
      public function get armor() : *
      {
         var _loc1_:* = 0;
         if(Jacket > 0)
         {
            _loc1_ += Item.Armor[Jacket].armor;
         }
         return _loc1_ + headArmor;
      }
      
      public function get headArmor() : *
      {
         if(Headgear > 0)
         {
            return Item.Armor[Headgear].armor;
         }
         return 0;
      }
      
      public function get bypassArmor() : *
      {
         return 0.05;
      }
      
      public function get explosionResistance() : *
      {
         var _loc1_:* = 0;
         if(Jacket > 0)
         {
            _loc1_ += Item.Armor[Jacket].explosionResistance;
         }
         if(Headgear > 0)
         {
            _loc1_ += Item.Armor[Headgear].explosionResistance;
         }
         return _loc1_;
      }
      
      public function get fireResistance() : *
      {
         var _loc1_:* = 0;
         if(Jacket > 0)
         {
            _loc1_ += Item.Armor[Jacket].fireResistance;
         }
         if(Headgear > 0)
         {
            _loc1_ += Item.Armor[Headgear].fireResistance;
         }
         return _loc1_;
      }
      
      public function get learningCapacity() : *
      {
         return intelligence / 7;
      }
      
      public function get rangedWeaponsSkill() : *
      {
         return Math.round(Math.max(accuracy * 8,1) + Math.pow(rangedWeaponsExperience,0.5) / 3);
      }
      
      public function get crossbowSkill() : *
      {
         return Math.round(rangedWeaponsSkill * 0.5 + Math.pow(crossbowExperience,0.5) * 0.5);
      }
      
      public function get rocketLauncherSkill() : *
      {
         return Math.round(rangedWeaponsSkill * 0.5 + Math.pow(rocketLauncherExperience,0.5) * 0.5);
      }
      
      public function get pistolSkill() : *
      {
         return Math.round(rangedWeaponsSkill * 0.7 + Math.pow(pistolExperience,0.5) * 0.3);
      }
      
      public function get rifleSkill() : *
      {
         return Math.round(rangedWeaponsSkill * 0.6 + Math.pow(rifleExperience,0.5) * 0.4);
      }
      
      public function get machinegunSkill() : *
      {
         return Math.round(rangedWeaponsSkill * 0.5 + Math.pow(machinegunExperience,0.5) * 0.5);
      }
      
      public function get smgSkill() : *
      {
         return Math.round(rangedWeaponsSkill * 0.5 + Math.pow(smgExperience,0.5) * 0.5);
      }
      
      public function get shotgunSkill() : *
      {
         return Math.round(rangedWeaponsSkill * 0.6 + Math.pow(shotgunExperience,0.5) * 0.4);
      }
      
      public function get flamethrowerSkill() : *
      {
         return Math.round(rangedWeaponsSkill * 0.2 + Math.pow(flamethrowerExperience,0.5) * 0.8);
      }
      
      public function get throwSkill() : *
      {
         return Math.round(physical * 7 + Math.pow(throwExperience,0.5));
      }
      
      public function get throwingAccuracy() : *
      {
         return Math.max(accuracy * 4,1) + Math.pow(throwExperience,0.5) / 2;
      }
      
      public function get painThreshold() : *
      {
         return 1 / Math.pow(Math.max(painExperience * physical / 10,1),0.1);
      }
      
      public function get doctorSkill() : *
      {
         var _loc1_:Number = intelligence * 10 + Math.pow(doctorExperience,0.5);
         var _loc2_:Number = HP / maxHP;
         if(_loc2_ < 0.1)
         {
            _loc1_ -= 30;
         }
         else if(_loc2_ <= 0.2)
         {
            _loc1_ -= 10;
         }
         return Math.max(_loc1_,0);
      }
      
      public function get firstAidSkill() : *
      {
         return doctorSkill * 0.8 + Math.pow(firstAidExperience,0.5);
      }
      
      public function get veterinarySkill() : *
      {
         return intelligence * 6 + Math.pow(veterinaryExperience,0.5) * 2;
      }
      
      public function get mechanicSkill() : *
      {
         return intelligence * 3 + agility * 2 + Math.pow(mechanicExperience,0.5) * 3;
      }
      
      public function get huntingSkill() : *
      {
         return agility * 3 + accuracy * 4 + intelligence + Math.pow(huntingExperience,0.5);
      }
      
      public function get collectingSkill() : *
      {
         return 20 + agility * 5 + Math.pow(collectingExperience,0.5);
      }
      
      public function get sight() : *
      {
         return Math.pow(accuracy * 10 + Math.pow(travelExperience,0.5),0.5) * 8;
      }
      
      public function get smugglingSkill() : *
      {
         return agility * 4 + accuracy * 2 + intelligence * 3 + Math.pow(smugglingExperience,0.5);
      }
      
      public function get noticeability() : *
      {
         return Math.max(physical * 10 - agility * 5,1) / Math.max(Math.pow(travelExperience,0.1),1);
      }
      
      public function get unarmedSkill() : *
      {
         return physical * 1.5 + accuracy * 0.4 + Math.pow(unarmedExperience,0.5);
      }
      
      public function get meleeSkill() : *
      {
         return physical * 1.8 + accuracy * 0.7 + Math.pow(closeBattleExperience,0.5);
      }
      
      public function get knivesSkill() : *
      {
         return physical * 1.8 + accuracy * 0.7 + Math.pow(knivesExperience,0.5);
      }
      
      public function get clubsSkill() : *
      {
         return physical * 1.8 + accuracy * 0.7 + Math.pow(clubsExperience,0.5);
      }
      
      public function get choppingSkill() : *
      {
         return physical * 1.8 + accuracy * 0.7 + Math.pow(choppingExperience,0.5);
      }
      
      public function get swordsSkill() : *
      {
         return physical * 1.8 + accuracy * 0.7 + Math.pow(swordsExperience,0.5);
      }
      
      public function get totalExperience() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = 0;
         for(_loc2_ in Character.skillsList)
         {
            if(Character.skillsList[_loc2_].experience is String)
            {
               _loc1_ += this[Character.skillsList[_loc2_].experience];
            }
         }
         return _loc1_;
      }
      
      public function get weight() : *
      {
         if(_weight > idealWeight / 3)
         {
            return _weight;
         }
         return idealWeight / 3;
      }
      
      public function set weight(param1:*) : *
      {
         _weight = param1;
      }
      
      public function get morale() : *
      {
         if(!_morale > 0)
         {
            return 1;
         }
         return _morale;
      }
      
      public function set morale(param1:*) : *
      {
         _morale = Math.max(Math.min(param1,100),1);
      }
      
      public function get battleMorale() : *
      {
         if(neverPanic && _battleMorale < 8 + 1)
         {
            return 8 + 1;
         }
         return _battleMorale;
      }
      
      public function set battleMorale(param1:*) : *
      {
         _battleMorale = param1;
      }
      
      public function get currentWeaponReloadAP() : *
      {
         if(currentWeaponType.reloadAP > 0)
         {
            if(armDamage)
            {
               return currentWeaponType.reloadAP * 2;
            }
            return currentWeaponType.reloadAP;
         }
         return 0;
      }
      
      public function get pickUpAP() : *
      {
         if(armDamage)
         {
            return 3 * 2;
         }
         return 3;
      }
      
      public function get healAP() : *
      {
         if(armDamage)
         {
            return 5 * 2;
         }
         return 5;
      }
      
      public function get speed() : *
      {
         var _loc1_:Number = 3 + agility / 2;
         switch(wounded)
         {
            case 2:
               _loc1_ *= 0.9;
               break;
            case 3:
               _loc1_ *= 0.8;
               break;
            case 4:
               _loc1_ *= HP / maxHP * 3;
         }
         _loc1_ = Math.max(_loc1_,1);
         if(legDamage)
         {
            _loc1_ /= 1.5;
         }
         return _loc1_;
      }
      
      public function get BodyType() : *
      {
         if(Item.Armor[Jacket] is Object)
         {
            if(Item.Armor[Jacket].changeBody is Array)
            {
               return Item.Armor[Jacket].changeBody[gender - 1];
            }
            if(Item.Armor[Jacket].changeBody > 0)
            {
               return Item.Armor[Jacket].changeBody;
            }
         }
         return originalBodyType;
      }
      
      public function get HeadType() : *
      {
         if(Item.Armor[Headgear] is Object && Item.Armor[Headgear].changeHead > 0)
         {
            return Item.Armor[Headgear].changeHead;
         }
         return originalHead;
      }
      
      public function get ShoulderPlatesType() : *
      {
         if(Item.Armor[Jacket] is Object && Item.Armor[Jacket].changeShoulderPlates != undefined)
         {
            return Item.Armor[Jacket].changeShoulderPlates;
         }
         return 0;
      }
      
      public function get BackHairType() : *
      {
         if(Item.Armor[Headgear] is Object && Item.Armor[Headgear].changeBackHair != undefined)
         {
            return Item.Armor[Headgear].changeBackHair;
         }
         return originalBackHairType;
      }
      
      public function get BeardType() : *
      {
         if(Item.Armor[Headgear] is Object && Item.Armor[Headgear].changeBeard != undefined)
         {
            return Item.Armor[Headgear].changeBeard;
         }
         return originalBeardType;
      }
      
      public function get LeftTopArmType() : *
      {
         if(Item.Armor[Jacket] is Object && Item.Armor[Jacket].changeTopArm > 0)
         {
            return Item.Armor[Jacket].changeTopArm;
         }
         if(sleevesType == 0 || sleevesType == 1 || sleevesType == 2 || sleevesType == 3 || sleevesType == 5)
         {
            return 1;
         }
         if(sleevesType == 4)
         {
            return 2;
         }
      }
      
      public function get RightTopArmType() : *
      {
         if(Item.Armor[Jacket] is Object && Item.Armor[Jacket].changeTopArm > 0)
         {
            return Item.Armor[Jacket].changeTopArm;
         }
         if(sleevesType == 0 || sleevesType == 1 || sleevesType == 2 || sleevesType == 3 || sleevesType == 5)
         {
            return 1;
         }
         if(sleevesType == 4)
         {
            return 2;
         }
      }
      
      public function get LeftForearmType() : *
      {
         if(Item.Armor[Jacket] is Object && Item.Armor[Jacket].changeForearm > 0)
         {
            return Item.Armor[Jacket].changeForearm;
         }
         if(sleevesType == 0 || sleevesType == 1 || sleevesType == 2 || sleevesType == 3 || sleevesType == 4)
         {
            if(hasLeftBracelet)
            {
               return 2;
            }
            return 1;
         }
         if(sleevesType == 5)
         {
            return 3;
         }
      }
      
      public function get RightForearmType() : *
      {
         if(Item.Armor[Jacket] is Object && Item.Armor[Jacket].changeForearm > 0)
         {
            return Item.Armor[Jacket].changeForearm;
         }
         if(sleevesType == 0 || sleevesType == 1 || sleevesType == 2 || sleevesType == 3 || sleevesType == 4)
         {
            if(hasRightBracelet)
            {
               return 2;
            }
            return 1;
         }
         if(sleevesType == 5)
         {
            return 3;
         }
      }
      
      public function get jacketColor() : *
      {
         if(Jacket > 0)
         {
            return Item.Armor[Jacket].color;
         }
         return {
            "r":0,
            "g":0,
            "b":0,
            "bc":1
         };
      }
      
      public function getInfoPairs(param1:* = false) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:Array = [];
         _loc2_.push({
            "name":Texts.fetch(50).toUpperCase(),
            "value":Math.round(HP) + "/" + Math.round(maxHP),
            "key":"health"
         });
         _loc5_ = physical;
         _loc4_ = basePhysical;
         if(_loc5_ != _loc4_)
         {
            _loc3_ = " (" + (_loc5_ - _loc4_) + ")";
         }
         else
         {
            _loc3_ = "";
         }
         _loc2_.push({
            "name":Texts.fetch(944).toUpperCase(),
            "value":_loc5_ + _loc3_,
            "key":"physical"
         });
         _loc5_ = agility;
         _loc4_ = baseAgility;
         if(_loc5_ != _loc4_)
         {
            _loc3_ = " (" + (_loc5_ - _loc4_) + ")";
         }
         else
         {
            _loc3_ = "";
         }
         _loc2_.push({
            "name":Texts.fetch(945).toUpperCase(),
            "value":_loc5_ + _loc3_,
            "key":"agility"
         });
         _loc2_.push({
            "name":Texts.fetch(946).toUpperCase(),
            "value":accuracy,
            "key":"accuracy"
         });
         _loc2_.push({
            "name":Texts.fetch(947).toUpperCase(),
            "value":intelligence,
            "key":"intelligence"
         });
         _loc2_.push({
            "name":Texts.fetch(1271).toUpperCase(),
            "value":MathFunctions.NumberFormat(capacity,1,true),
            "key":"carringCapacity"
         });
         _loc2_.push({
            "name":Texts.fetch(916).toUpperCase(),
            "value":MathFunctions.NumberFormat(speed,1,true),
            "key":"speed"
         });
         _loc2_.push({
            "name":Texts.fetch(984).toUpperCase(),
            "value":MathFunctions.NumberFormat(totalExperience,0),
            "key":"totalExperience"
         });
         _loc2_.push({
            "name":Texts.fetch(966).toUpperCase(),
            "value":MathFunctions.NumberFormat(learningCapacity * 100,0),
            "key":"learningCapacity"
         });
         return _loc2_;
      }
      
      public function get price() : *
      {
         var _loc1_:Number = Math.round((Math.pow(basePhysical + baseAgility + baseAccuracy + baseIntelligence,2) + Math.pow(totalExperience,0.5) * 8) / 10) * 150;
         if(gender == 2)
         {
            if(age < 25)
            {
               _loc1_ *= 2;
            }
            else if(age < 30)
            {
               _loc1_ *= 1.5;
            }
            else if(age < 35)
            {
               _loc1_ *= 1.2;
            }
            else if(age > 40)
            {
               _loc1_ *= 0.7;
            }
         }
         else if(age > 40)
         {
            _loc1_ *= 0.8;
         }
         var _loc2_:Number = _loc1_;
         _loc1_ -= (maxHP - HP) * 40;
         return Math.round(Math.max(_loc1_,_loc2_ * 0.1));
      }
      
      public function get headgearColor() : *
      {
         if(Headgear > 0)
         {
            return Item.Armor[Headgear].color;
         }
         return {
            "r":0,
            "g":0,
            "b":0,
            "bc":1
         };
      }
      
      public function preserveColor(param1:*) : *
      {
         if(Item.Armor[Jacket] is Object)
         {
            return param1 == "Body" && Item.Armor[Jacket].preserveBodyColor || param1 == "Legs" && Item.Armor[Jacket].preserveLegsColor || (param1 == "RightTopArm" || param1 == "LeftTopArm") && Item.Armor[Jacket].preserveTopArmColor || (param1 == "RightForearm" || param1 == "LeftForearm") && Item.Armor[Jacket].preserveForearmColor || param1 == "ShoulderPlates" && Item.Armor[Jacket].preserveShoulderPlatesColor;
         }
         return false;
      }
      
      public function get meatAmount() : *
      {
         return weight * 0.3;
      }
      
      public function remove() : *
      {
         weapons = null;
         attachments = null;
         grenadeAmounts = null;
         loadedAmmo = null;
         selectedAmmo = null;
         equipment = null;
         currModes = null;
         group = null;
         applyPhaseAndFrame = null;
         ownContainer = null;
         Shadow = null;
         caravan = null;
         passengerIn = null;
         throwGrenadeAt = null;
         AICue = null;
         savedPortrait = null;
         bodyFlame = null;
         if(flameSoundChannel)
         {
            flameSoundChannel.stop();
         }
         flameSoundChannel = null;
         ownContainer = null;
         Shadow = null;
      }
   }
}

