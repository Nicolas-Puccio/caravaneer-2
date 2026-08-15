package Data
{
   import IsoEngine.DialogueScreen;
   
   public class Caravaneer2MainStory
   {
      
      public static var defaultDefaults:* = {
         1:1,
         2:173,
         3:184,
         7:256,
         8:285,
         9:308,
         10:372,
         11:402,
         12:486,
         13:523,
         14:561,
         15:580,
         16:605,
         17:754,
         18:799,
         19:800,
         20:850,
         21:905,
         22:997,
         23:1094,
         24:1095,
         25:1096,
         26:1109,
         27:1281,
         28:1321,
         29:1378,
         30:1533,
         31:1695,
         32:1701,
         33:1755,
         34:1758,
         35:1759,
         36:1774,
         37:1989
      };
      
      public static var defaultCharacterFactions:* = {
         3:1,
         7:1,
         8:3,
         9:2,
         10:3,
         12:4,
         13:9,
         14:4,
         17:10,
         18:13,
         20:11,
         21:12,
         23:9,
         24:9,
         25:10,
         26:11,
         27:9,
         29:10,
         31:17,
         32:18,
         33:18,
         34:18,
         35:18,
         36:18,
         37:17
      };
      
      public var dialogueDefaults:*;
      
      public var characterFactions:*;
      
      public var askedCricketAboutOlaf:* = false;
      
      public var askedCricketAboutDrekar:* = false;
      
      public var askedCrickedAboutHives:* = false;
      
      public var earnedReputationWithCricket:* = false;
      
      public var doneWithCricket:* = false;
      
      public var cricketSendsRegardsToLintu:* = false;
      
      public var askedKukulAboutTribes:* = false;
      
      public var askedKukulToTalkWithDrekar:* = false;
      
      public var KukulsPriceForContact:* = 0;
      
      public var askedKukulAboutOlaf:* = false;
      
      public var askedKukulAboutDoctor:* = false;
      
      public var knowThatKukulIsAVeterinary:* = false;
      
      public var enteredBunkerForTheFirstTime:* = false;
      
      public var exitedBunker:* = false;
      
      public var mainMissionAccepted:* = false;
      
      public var cricketToldYouAboutEconomics:* = false;
      
      public var acceptedEmiliasQuest:* = false;
      
      public var askedKukulAboutEmiliasQuest:* = false;
      
      public var accompanyedByThum:* = false;
      
      public var thumJoinTime:*;
      
      public var thumDisplayedMessage:* = false;
      
      public var kukulSendsYouToDrekar:* = false;
      
      public var askedCricketAboutPolitics:* = false;
      
      public var farnirOfferedYouTheJob:* = false;
      
      public var youAcceptedFarnirsJob:* = false;
      
      public var knowAboutPullid:* = false;
      
      public var askedApisAboutOlaf:* = false;
      
      public var heardAboutLois:* = false;
      
      public var apisMissionAccepted:* = false;
      
      public var apisMissionOffered:* = false;
      
      public var cleaversToBring:* = 5;
      
      public var boltsToBring:* = 50;
      
      public var agreedToMeetLois:* = false;
      
      public var meetLoisTime:*;
      
      public var metLois:* = false;
      
      public var failedToMeetLois:* = false;
      
      public var askedApisToContactLois:* = false;
      
      public var repeatedLoisMeeting:* = false;
      
      public var heardLoisStoryFromApis:* = false;
      
      public var askedApisAboutEmilia:* = false;
      
      public var receivedFindBookQuest:* = false;
      
      public var gotInfoAboutBookFromKukul:* = false;
      
      public var killedRoversAtSigurdsHut:* = false;
      
      public var readSpencerism:* = false;
      
      public var readFafnirsCase:* = false;
      
      public var receivedInfiltrateMissionFromPullid:* = false;
      
      public var toldKukulAboutTheCase:* = false;
      
      public var toldKukulThatYouHaveTheBook:* = false;
      
      public var agreedToFindAnAllyForLintu:* = false;
      
      public var askedApisToBecomeLintusAlly:* = false;
      
      public var knowThatPullidWantKukulGone:* = false;
      
      public var discoveredLoisLocation:* = false;
      
      public var firstZoneResolved:* = false;
      
      public var toldBrassAboutFafmir:* = false;
      
      public var brassGaveYouHisGoldenRing:* = false;
      
      public var askedBrassAboutInsects:* = false;
      
      public var talkedToBrassAboutWeapons:* = false;
      
      public var enteredSaxaulTreeBefore:* = false;
      
      public var askedFafnirAboutOlaf:* = false;
      
      public var knowHowToTradeWithKivi:* = false;
      
      public var askedMarcoAboutOlaf:* = false;
      
      public var loisIsDead:* = false;
      
      public var loisReturned:* = false;
      
      public var fafnirSentToKillLois:* = false;
      
      public var fafnirIsMadAtYou:* = false;
      
      public var bailedByFafnir:* = false;
      
      public var loisStartedAttack:* = false;
      
      public var youAttackedLois:* = false;
      
      public var requieDonkeyFromApis:* = false;
      
      public var drekarStartedDefense:* = false;
      
      public var loisAttacksWithLintu:* = false;
      
      public var drekarDefeated:* = false;
      
      public var youHelpedDefeatDrekar:* = false;
      
      public var readCalvinsLetter:* = false;
      
      public var fafnirStartsKukulAssassination:* = false;
      
      public var kukulAssassinationTime:*;
      
      public var kukulIsDead:* = false;
      
      public var marcosTestErrors:* = 0;
      
      public var askedOrionAboutOlaf:* = false;
      
      public var gotRingFromEmilia:* = false;
      
      public var kukulIsMissing:* = false;
      
      public var lintuStartedAttack:* = false;
      
      public var lintuAttackTime:*;
      
      public var toldFafnirAboutKukul:* = false;
      
      public var lintuAreDestroyed:* = false;
      
      public var drekarAttackingLintu:* = false;
      
      public var drekarAttackTime:*;
      
      public var lintuStartedDefense:* = false;
      
      public var askedKukulIfHeFoundOlaf:* = false;
      
      public var drekarReturned:* = false;
      
      public var lintuReturned:* = false;
      
      public var marcosTestFailed:* = false;
      
      public var loisMovesCarefuly:* = false;
      
      public var talkedToKiviAboutSigurd:* = false;
      
      public var talkedToKiviAboutPolitics:* = false;
      
      public var discussedPaymentWithSigurd:* = false;
      
      public var acceptedSigurdsJob:* = false;
      
      public var askedOrionAboutEmilia:* = false;
      
      public var heardAboutDemons:* = false;
      
      public var toldEmiliaAboutDemons:* = false;
      
      public var spencerRiceIsDead:* = false;
      
      public var toldSigurdAboutSpencersDeath:* = false;
      
      public var broughtSpencerRiceToKivi:* = false;
      
      public var drekarLeft:* = false;
      
      public var toldLoisAboutSpencerRice:* = false;
      
      public var toldLoisAboutNegotiations:* = false;
      
      public var convincedToEliminateDrekar:* = false;
      
      public var spokeWithSpencerAboutDrekarElimination:* = false;
      
      public var negotiationsOver:* = false;
      
      public var negotiationEndTime:*;
      
      public var kiviStartedAttack:* = false;
      
      public var kiviAttackTime:*;
      
      public var toldSpencerThatDrekarAgree:* = false;
      
      public var spokeWithSpencerAboutUltimatum:* = false;
      
      public var toldSpencerTheTruth:* = false;
      
      public var kiviReturned:* = false;
      
      public var kiviAreDestroyed:* = false;
      
      public var askedSpencerAboutSigurd:* = false;
      
      public var heardAboutCalvinsOffer:* = false;
      
      public var earnedTrustReputationWithCalvin:* = false;
      
      public var acceptedCalvinsMission:* = false;
      
      public var confessedCalvinsPlansToKevin:* = false;
      
      public var kevinToldYouAboutCalvin:* = false;
      
      public var talkedToKevin:* = false;
      
      public var heardAboutKevinsMusic:* = false;
      
      public var reportedToCalvinAboutKevin:* = false;
      
      public var heardAboutKevinsOrganization:* = false;
      
      public var acceptedKevinsLetterQuest:* = false;
      
      public var calvinsReward:*;
      
      public var acceptedMenaceKevinQuest:* = false;
      
      public var calvinsDecryptionReady:*;
      
      public var calvinIsDecrypting:* = false;
      
      public var calvinKnowsAboutLiberationArmy:* = false;
      
      public var deliveredKevinsLetter:* = false;
      
      public var heardAboutNotReading:* = false;
      
      public var toldKevinAboutDelivery:* = false;
      
      public var convincedThePriest:* = false;
      
      public var acceptedConvincePriestMission:* = false;
      
      public var needToGiveAStatement:* = false;
      
      public var gaveStatementAboutKevin:* = false;
      
      public var heardAboutManOfZincBasics:* = false;
      
      public var askedPriestAboutSlaves:* = false;
      
      public var acceptedNariziansMission:* = false;
      
      public var talkedToMustapartaAboutNarizians:* = false;
      
      public var acceptedFindTribeMission:* = false;
      
      public var tribeFound:* = false;
      
      public var discussedTribesAlternativeWithJohn:* = false;
      
      public var suggestedJohnToLeave:* = false;
      
      public var acceptedBuildSettlementMisiion:* = false;
      
      public var shouldReturnToJohn:* = false;
      
      public var johnReturnTime:*;
      
      public var nariziansAgreedToBeConverted:* = false;
      
      public var toldSolanumAboutNarizianIntentionsToConvert:* = false;
      
      public var toldSolanumThatNariziansAgreeToBeConverted:* = false;
      
      public var solanumAgreedToConvertNarizians:* = false;
      
      public var nariziansAreMarchingToOrth:* = false;
      
      public var accepted3MMisiion:* = false;
      
      public var allNariziansKilled:* = false;
      
      public var youAttackedNarizians:* = false;
      
      public var toldToTalkToMustapartaAboutOlaf:* = false;
      
      public var talkedToMustapartaAboutOlaf:* = false;
      
      public var askedPriestAboutTheRobe:* = false;
      
      public var nariziansArePreparingToLeave:* = false;
      
      public var nariziansLeaveTime:*;
      
      public var nariziansLeft:* = false;
      
      public var toldSolanumAboutNariziansLeaving:* = false;
      
      public var solvedSolanumsMission:* = false;
      
      public var buildingNarizianSettlement:* = false;
      
      public var settlementCompleteTime:*;
      
      public var knowThatNarizianMarketIsFree:* = false;
      
      public var countdownToAbolishSlavery:* = false;
      
      public var abolishSlaveryTime:*;
      
      public var janubiSlaveryAbolished:* = false;
      
      public var askedMustapartaAboutMakingMoney:* = false;
      
      public var needToComeBackToSapoboi:*;
      
      public var backToSapoboiTime:*;
      
      public var receivedMoneyFromSapoboi:* = false;
      
      public var suggestedJohnToBuildASettlement:* = false;
      
      public var visitedTheNarizianSettlement:* = false;
      
      public var sapoboiIsMadAtYou:* = false;
      
      public var nariziansWentNorth:* = false;
      
      public var knowAboutChunkNariz:* = false;
      
      public var canceledTheSettlmentPlan:* = false;
      
      public var triedToLieToSapoboi:* = false;
      
      public var lintuAcceptNarizians:* = false;
      
      public var nariziansCameToLintu:*;
      
      public var nariziansDestination:*;
      
      public var pullidAcceptNarizians:* = false;
      
      public var askedApisAboutNarizians:* = false;
      
      public var askedLoisAboutNarizians:* = false;
      
      public var askedOrionAboutNarizians:* = false;
      
      public var talkedWithSpencerAboutNarizians:* = false;
      
      public var nariziansCameToPullid:* = false;
      
      public var heardPullidAndNariziansStory:* = false;
      
      public var continueAfterChunkNarizStory:*;
      
      public var menacedKevin:* = false;
      
      public var kevinIsDead:* = false;
      
      public var toldCalvinAboutManacingKelvin:* = false;
      
      public var calvinRecommendsYouToWorkforceMerchants:* = false;
      
      public var knowWhereOlafIs:* = false;
      
      public var heardAboutDollandTruffle:* = false;
      
      public var youAreAcceptedToLiberationArmy:* = false;
      
      public var sentToCottonFieldsByCalvin:* = false;
      
      public var toldBrassAboutDollandTruffle:* = false;
      
      public var gotPriceForOlaf:* = false;
      
      public var priceToFreeOlaf:*;
      
      public var toldBrassAboutOlafsLocation:* = false;
      
      public var toldBrassOlafsPrice:* = false;
      
      public var askedSolanumAboutEmilia:* = false;
      
      public var toldBrassAboutDemons:* = false;
      
      public var heardHowToFoolTheDemon:* = false;
      
      public var triedToConvinceBunkerPeopleAboutTheDemon:* = false;
      
      public var heardAboutTheDemonFromOrion:* = false;
      
      public var heardAboutTheDemonFromSolanum:* = false;
      
      public var heardAboutTheDemonFromJacob:* = false;
      
      public var toldJacobAboutTryingToConvinceOthers:* = false;
      
      public var jacobExplainedYouAboutTheColony:* = false;
      
      public var cameToConfusionExplanationFrom:*;
      
      public var heardAboutDemonHunter:* = false;
      
      public var talkedWithJakobAboutTheDeamon:* = false;
      
      public var talkedToLoisAboutBeatingDrekar:* = false;
      
      public var askedLoisAboutOlaf:* = false;
      
      public var freedOlaf:* = false;
      
      public var askedTheGuardAboutOlaf:* = false;
      
      public var tryToBuyOlafThroughTifk:* = false;
      
      public var talkToHuliAboutFreeingOlaf:* = false;
      
      public var needToBringGuardTheMoney:* = false;
      
      public var comeBackToGuardTime:*;
      
      public var needToComeBackToGuard:* = false;
      
      public var talkedToGuardAboutFreeingOlaf:* = false;
      
      public var foundOutAboutTheBunker:* = false;
      
      public var decidedWhatToDoWithTheBaby:* = false;
      
      public var askedApisAboutYourPeople:* = false;
      
      public var askedCricketAboutYourPeople:* = false;
      
      public var askedKukulAboutYourPeople:* = false;
      
      public var askedFafnirAboutYourPeople:* = false;
      
      public var askedLoisAboutYourPeople:* = false;
      
      public var askedOrionAboutYourPeople:* = false;
      
      public var askedSpencerRiceAboutYourPeople:* = false;
      
      public var askedCalvinAboutUranium:* = false;
      
      public var askedCalvinAboutYuorPeople:* = false;
      
      public var askedHuliAboutUranium:* = false;
      
      public var askedKukulAboutNauticalAlmanac:* = false;
      
      public var heardAboutPimAndAlmanac:* = false;
      
      public var heardAboutUraniumFromCalvin:* = false;
      
      public var buriedTheBaby:* = false;
      
      public var askedHuliAboutOlaf:* = false;
      
      public var askedHuliAboutYourPeople:* = false;
      
      public var askedHuliAboutHerJob:* = false;
      
      public var wasOfferedJobByDolland:* = false;
      
      public var acceptedJobByDolland:* = false;
      
      public var dollandPromisedToFindYourPeople:* = false;
      
      public var askedDollandTruffleAboutUranium:* = false;
      
      public var metDollandTruffle:* = false;
      
      public var askedDollandTruffleAboutYourPeople:* = false;
      
      public var wfmMissionInProgress:* = 0;
      
      public var wfmMissionsCompleted:* = 0;
      
      public var truffleStartedInvestigationAt:*;
      
      public var askedDollandAboutTheRegion:* = false;
      
      public var askedHuliAboutLocations:* = false;
      
      public var lipasSolved:* = false;
      
      public var punchedLipas:* = false;
      
      public var lipasComeBackTime:*;
      
      public var lookingForNauticalAlmanac:* = false;
      
      public var savedLipasTime:*;
      
      public var proceedWithConfusionMission:* = false;
      
      public var needToAttackCannibals:* = false;
      
      public var defeatedTheCannibals:* = false;
      
      public var askedJohnPatsonAboutTribals:* = false;
      
      public var jacobsQuestInProgress:* = false;
      
      public var toldJacobAboutTheCannibals:* = false;
      
      public var askedJacobAboutTheList:* = false;
      
      public var toldHuliAboutDefeatingCannibals:* = false;
      
      public var broughtWorkersReplyToWFM:* = false;
      
      public var startedNegotiationsWithNora:* = false;
      
      public var toldRebelsAboutTheTour:* = false;
      
      public var rebelsRejectTheTour:* = false;
      
      public var rebelsAcceptedTheTour:* = false;
      
      public var rebelsJoinedYouForTheTour:* = false;
      
      public var toldHuliAboutRebelsAcceptingTheTour:* = false;
      
      public var toldHuliAboutRebelsRejectingTheTour:* = false;
      
      public var startedSuppressRebelionOperation:* = false;
      
      public var gotCloseToMikaze:* = false;
      
      public var mikazeRebelsDefeted:* = false;
      
      public var needToProvokeOzbet:* = false;
      
      public var provokedOzbet:* = false;
      
      public var releasingOzbetDefenders:* = false;
      
      public var nextBunchTime:*;
      
      public var currentOzbetDefendersBunch:*;
      
      public var janubiStartedDefense:* = false;
      
      public var ozbetDefeated:* = false;
      
      public var janubiDefeated:* = false;
      
      public var ozbetDefendersReturned:* = false;
      
      public var janubiTroopsReturned:* = false;
      
      public var escortWFMCaravanTo:*;
      
      public var wfmMissionDone:* = false;
      
      public var wfmMissionFailed:* = false;
      
      public var wfmReward:*;
      
      public var wfmFailedMissions:* = 0;
      
      public var janubiBanditsToKill:*;
      
      public var wfmDeliverToCharacter:*;
      
      public var wfmDeliverToTown:*;
      
      public var wfmDeliveryStarted:*;
      
      public var wfmDeliveryTime:*;
      
      public var wfmDeliverCharacterName:*;
      
      public var receivedWFMGuide:* = false;
      
      public var newSerinoSlavesNum:*;
      
      public var askedHuliAboutCannibalList:* = false;
      
      public var mustapartaHasCanniballLetter:* = false;
      
      public var gaveLetterToMustapartaAt:*;
      
      public var mustapartaLostTheLetter:* = false;
      
      public var gaveCannibalListToCalvin:* = false;
      
      public var gaveCannibalListToCalvinAt:*;
      
      public var decodedCannibalsList:* = false;
      
      public var talkedWithSapoboiAboutCannibalism:* = false;
      
      public var hasBeenInTeachToEat:* = false;
      
      public var hasBeenJudgemental:* = false;
      
      public var agreedToBringMeatToSapoboi:* = false;
      
      public var gotSapoboisConfession:* = false;
      
      public var promisedSapoboiNotToTellAboutCannibalism:* = false;
      
      public var toldSolanumAboutSapoboi:* = false;
      
      public var toldMustapartaAboutCalvin:* = false;
      
      public var promisedToShowTheListToMustaparta:* = false;
      
      public var solanumHeardAboutSapoboiAt:*;
      
      public var sapoboiKilled:* = false;
      
      public var spokeWithSolanumAboutSapoboisDeath:* = false;
      
      public var needToAttckWinchester:* = false;
      
      public var killedWinchester:* = false;
      
      public var talkedToNikubanAboutWinchester:* = false;
      
      public var askedNikubanAboutIdeology:* = false;
      
      public var askedNikubanAboutOzbet:* = false;
      
      public var askedNikubanAboutToowoomba:* = false;
      
      public var laMissionInProgress:* = 0;
      
      public var laMissionsCompleted:* = 0;
      
      public var receivedAMapFromNikuban:* = false;
      
      public var toldEliahAboutClan:* = false;
      
      public var eliahsManDead:* = false;
      
      public var gotSecondChanceFromEliah:* = false;
      
      public var toldEliahAboutTheSecondMan:* = false;
      
      public var failedToEscortEliahsMan:* = false;
      
      public var failedLAMissions:* = 0;
      
      public var toldNikubanAboutWorkers:* = false;
      
      public var broughtEliahsManToWinchester:* = false;
      
      public var doneWithTheWinchester:* = false;
      
      public var failedToBringWorkers:* = false;
      
      public var failedToBringWorkersForTheSecondTime:* = false;
      
      public var toldNikubanAboutWorkersFailure1:* = false;
      
      public var toldNikubanAboutWorkersFailure2:* = false;
      
      public var bringingWorkers:* = false;
      
      public var defeatedButNotTold:* = false;
      
      public var toldFulierAboutLA:* = false;
      
      public var askedNikubanAboutCannibalList:* = false;
      
      public var toldJacobAboutBuryingTheBaby:* = false;
      
      public var reportedToNikubanAboutCannibals:* = false;
      
      public var startedWorkingwithNora:* = false;
      
      public var noraIsDead:* = false;
      
      public var allRebelsAreDead:* = false;
      
      public var mikazePoliceDefeated:* = false;
      
      public var rebelsReturned:* = false;
      
      public var askedNoraAboutMOStructure:* = false;
      
      public var askedNoraAboutWFMBusiness:* = false;
      
      public var askedNoraAboutHerTask:* = false;
      
      public var askedNikubanAboutUranium:* = false;
      
      public var askedNikubanAboutYourPeople:* = false;
      
      public var receivedRecruitHuliMission:* = false;
      
      public var huliSaidSheWillThink:* = false;
      
      public var huliStartedThinkingTime:*;
      
      public var needToBringMoneyToHuli:* = false;
      
      public var huliIsLookingForInfo:* = false;
      
      public var huliStartedLookingTime:*;
      
      public var askedHuliAboutNews:* = false;
      
      public var askedNikubanForMoney:* = false;
      
      public var toldNikubanAboutTheFederation:* = false;
      
      public var lipasMetYou:* = false;
      
      public var boughtSextantFromLipas:* = false;
      
      public var askedNikubanAboutAlmanac:* = false;
      
      public var knowWhereYourPeopleAre:* = false;
      
      public var askedPimAboutAlmanac:* = false;
      
      public var heardAboutPimsProjectAt:*;
      
      public var tookRecordsFromPim:* = false;
      
      public var completedKevinsQuest:* = false;
      
      public var toldPimAboutCompletingMusicQuest:* = false;
      
      public var startedWorkingOnAntennasProject:* = false;
      
      public var heardAboutAntennasProject:* = false;
      
      public var knowAboutSoldNavigationDevice:* = false;
      
      public var transmittersInstalled:* = 0;
      
      public var receivedPimsDevice:* = false;
      
      public var toldPimAboutHisDevice:* = false;
      
      public var talkedWithRichardWeaver:* = false;
      
      public var toldNikubanAboutWeaversDecision:* = false;
      
      public var johnSheppardDied:* = false;
      
      public var sheppardDiedAt:*;
      
      public var weaverAgreesToAttackTheFederation:* = false;
      
      public var qubbaDestructionCountdownStartedAt:*;
      
      public var toldNikubanAboutSheppardsDeath:* = false;
      
      public var talkedToNikubanAboutFederationAttack:* = false;
      
      public var liberationArmyReinforcementArrived:* = false;
      
      public var liberationArmyReinforcementMen:*;
      
      public var askedMustapartaAboutFightingFederation:* = false;
      
      public var receivedPeopleFromMustaparta:* = false;
      
      public var askedLoisAboutFightingFederation:* = false;
      
      public var talkedToOrionAboutTheFederation:* = false;
      
      public var spokeWithSpencerRiceAboutTHeFederation:* = false;
      
      public var talkedToSolanumAboutTheFederation:* = false;
      
      public var spokeWithKukulAboutTheFederation:* = false;
      
      public var sigurdSaidHeWouldLeave:*;
      
      public var heardAboutReginsPlan:* = false;
      
      public var heardAboutReginsPlanAt:*;
      
      public var reginsMenDefeated:* = false;
      
      public var reginsMenCount:*;
      
      public var loisLeft:* = false;
      
      public var toldLoisAboutRegin:* = false;
      
      public var loisWariorsLeft:* = false;
      
      public var reginDestroyedPullid:* = false;
      
      public var askedLoisAboutGold:* = false;
      
      public var heardAboutFafnirsWarehouse:* = false;
      
      public var askedApisAboutFafnirsWarehouse:* = false;
      
      public var askedApisAboutGold:* = false;
      
      public var metFafnirInZonderhoop:* = false;
      
      public var acceptedBuyWarehouseMission:* = false;
      
      public var heardAboutTheWalls:* = true;
      
      public var talkedToApisAboutWarehouse:* = false;
      
      public var warehousePrice:*;
      
      public var needToComeBackWithWarehouseMoney:* = false;
      
      public var youOwnPullidWarehouse:* = false;
      
      public var fafnirsMenAreWithYou:* = false;
      
      public var toldApisTheTruthAboutWarehouse:* = false;
      
      public var apisStartedWarehouseInvestigation:*;
      
      public var apisIsInvegatingWalls:* = false;
      
      public var toldFafnirAboutBuyingTheWarehouse:* = false;
      
      public var askaedLoisAboutTheWarehouse:* = false;
      
      public var completedWarehouseMission:* = false;
      
      public var talkedToRichardAboutPirates:* = false;
      
      public var askedFafnirAboutTheFederation:* = false;
      
      public var fafnirStartedTalkingWithPiratesAt:*;
      
      public var heardPiratesAnswer:* = false;
      
      public var piratesWillBecomeHostile:* = false;
      
      public var piratesWillAttack:* = false;
      
      public var toldWeaverAboutPirateAllies:* = false;
      
      public var qubbaAttackPhase:* = 0;
      
      public var federationStartedDefehse:* = false;
      
      public var piratesReleased:* = false;
      
      public var sentFederationTroopsToQubba:* = false;
      
      public var sentQubbaTroopsToAusz:* = false;
      
      public var federationCapturedQubba:* = false;
      
      public var qubbaCapturedTheFederation:* = false;
      
      public var bothSidesDestroyed:* = false;
      
      public var madeQubbaInactive:* = false;
      
      public var foundYourPeopleInAusz:* = false;
      
      public var weaverRecommendedQubbaForBunkerDwellers:* = false;
      
      public var weaverOrderedToFreeYourPeople:* = false;
      
      public var freedYourPeople:* = false;
      
      public var toldBrassThatTheyAreFree:* = false;
      
      public var promisedYourPeopleToTakeThemToTheBunker:* = false;
      
      public var toldBrassAboutQubbaIntegration:* = false;
      
      public var takingYourMenToQubba:* = false;
      
      public var takingYourMenToBunker:* = false;
      
      public var tookYourPeopleToBunker:* = false;
      
      public var tookYourPeopleToQubba:* = false;
      
      public var yourPeopleArrivedToQubbaAt:*;
      
      public var brassArrested:* = false;
      
      public var bunkerExtinctionPhase:* = 0;
      
      public var bunkerExtinctionCounter:*;
      
      public var offeredBrassToBringFood:* = false;
      
      public var offeredBrassMedicine:* = false;
      
      public var offeredBrassHelpWithTheDesease:* = false;
      
      public var askedAllQuestionsAboutYourPeople:* = false;
      
      public var leftBrassInQubba:* = false;
      
      public var leftBrassInQubbaAt:*;
      
      public var knowAboutBrassTrial:* = false;
      
      public var federationAttackStarted:* = false;
      
      public var askedWeaverAboutJob:* = false;
      
      public var askedWeaverHowToRaiseReputation:* = false;
      
      public var agreedToBecomeAPolitician:* = false;
      
      public var qgMissionInProgress:* = 0;
      
      public var qgMissionStage:* = 0;
      
      public var qgMissionStartTime:*;
      
      public var qgMissionTown1:*;
      
      public var qgMissionTown2:*;
      
      public var qgMissionCompleted:* = false;
      
      public var qgMissionFailed:* = false;
      
      public var qgMissionAmount:*;
      
      public var qgMissionSuccessRate:*;
      
      public var qgMissionCashReward:*;
      
      public var knowWhatHappenedToEmiliasBaby:* = false;
      
      public var acceptedBombMission:* = false;
      
      public var bombSet:* = false;
      
      public var bombSetAt:*;
      
      public var bombExploded:* = false;
      
      public var toldFistonAboutTheBomb:* = false;
      
      public var nikubanMentionedQubba:* = false;
      
      public var finishedTheGame:* = false;
      
      public var specificReputations:*;
      
      public var characterRelations:*;
      
      public var acceptedQuests:*;
      
      public var completedQuests:*;
      
      public var failedQuests:*;
      
      public var additionalVariables:*;
      
      public function Caravaneer2MainStory()
      {
         var _loc1_:* = undefined;
         super();
         additionalVariables = {};
         characterFactions = [];
         for(_loc1_ in defaultCharacterFactions)
         {
            characterFactions[_loc1_] = defaultCharacterFactions[_loc1_];
         }
         DialogueScreen.lastStoryCreated = this;
         acceptedQuests = [];
         completedQuests = [];
         failedQuests = [];
         dialogueDefaults = [];
         for(_loc1_ in defaultDefaults)
         {
            dialogueDefaults[_loc1_] = defaultDefaults[_loc1_];
         }
         specificReputations = [];
         _loc1_ = 1;
         while(_loc1_ <= 8)
         {
            specificReputations[_loc1_] = 0;
            _loc1_++;
         }
         characterRelations = [];
      }
   }
}

