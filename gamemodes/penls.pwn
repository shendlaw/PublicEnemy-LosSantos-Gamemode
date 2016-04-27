#include <a_samp>
#include <moneyhax>
#include <antiad>
#include <antibot>
#include <antiafk>
#pragma tabsize 0
#define never 10000

static gTeam[MAX_PLAYERS]; // Tracks the team assignment for each player

#define CHECKPOINT_NONE 0
#define CHECKPOINT_PICKUP 1
#define CHECKPOINT_DROPOFF 2
#define CHECKPOINT_SR1START 3
#define CHECKPOINT_SRA 4
#define CHECKPOINT_SRB 5
#define CHECKPOINT_SRC 6
#define CHECKPOINT_SRD 7
#define CHECKPOINT_SRE 8
#define CHECKPOINT_SRF 9
#define CHECKPOINT_SRG 10
#define CHECKPOINT_CARDROP 11
#define CHECKPOINT_HOME 12
#define CHECKPOINT_DM 13
#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_GRAD2 0xBFC0C2FF
#define COLOR_GRAD3 0xCBCCCEFF
#define COLOR_GRAD4 0xD8D8D8FF
#define COLOR_GRAD5 0xE3E3E3FF
#define COLOR_GRAD6 0xF0F0F0FF
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_FADE1 0xE6E6E6E6
#define COLOR_FADE2 0xC8C8C8C8
#define COLOR_FADE3 0xAAAAAAAA
#define COLOR_FADE4 0x8C8C8C8C
#define COLOR_FADE5 0x6E6E6E6E
#define COLOR_PURPLE 0xC2A2DAAA
#define COLOR_DBLUE 0x2641FEAA
#define COLOR_ALLDEPT 0xFF8282AA
#define TEAM_CYAN 1
#define TEAM_BLUE 2
#define TEAM_GREEN 3
#define TEAM_ORANGE 4
#define TEAM_BALLAS 5
#define TEAM_GROVE 6
#define TEAM_VAGOS 7
#define TEAM_AZTECAS 8
#define TEAM_NANG 9
#define TEAM_RIFA 78
#define TEAM_MAFIA 11
#define TEAM_RMAFIA 12
#define TEAM_TRIADS 13
#define TEAM_BIKERS 14
#define OBJECTIVE_COLOR 0x640000FF
#define TEAM_GREEN_COLOR 0xFFFFFFFF
#define TEAM_BLUE_COLOR 0x8D8DFFFF
#define COLOR_ADD 0x63FF60FF
#define TEAM_CYAN_COLOR 0xFF8282FF
#define TEAM_ORANGE_COLOR 0xFF8300FF
#define TEAM_ORANGE1_COLOR 0xFF8300FF
#define TEAM_ORANGE2_COLOR 0xFF8300FF
#define TEAM_ORANGE3_COLOR 0xFF8300FF
#define TEAM_ORANGE4_COLOR 0xFF8300FF
#define TEAM_ORANGE5_COLOR 0xFF8300FF
#define TEAM_ORANGE6_COLOR 0xFF8300FF
#define TEAM_ORANGE7_COLOR 0xFF8300FF
#define TEAM_ORANGE8_COLOR 0xFF8300FF
#define TEAM_ORANGE9_COLOR 0xFF8300FF
#define TEAM_ORANGE10_COLOR 0xFF8300FF
#define TEAM_BALLAS_COLOR 0xD900D3FF
#define TEAM_BALLAS1_COLOR 0xD900D3FF
#define TEAM_BALLAS2_COLOR 0xD900D3FF
#define TEAM_BALLAS3_COLOR 0xD900D3FF
#define TEAM_BALLAS4_COLOR 0xD900D3FF
#define TEAM_BALLAS5_COLOR 0xD900D3FF
#define TEAM_BALLAS6_COLOR 0xD900D3FF
#define TEAM_BALLAS7_COLOR 0xD900D3FF
#define TEAM_BALLAS8_COLOR 0xD900D3FF
#define TEAM_BALLAS9_COLOR 0xD900D3FF
#define TEAM_BALLAS10_COLOR 0xD900D3FF
#define TEAM_GROVE_COLOR 0x00D900FF
#define TEAM_GROVE1_COLOR 0x00D900FF
#define TEAM_GROVE2_COLOR 0x00D900FF
#define TEAM_GROVE3_COLOR 0x00D900FF
#define TEAM_GROVE4_COLOR 0x00D900FF
#define TEAM_GROVE5_COLOR 0x00D900FF
#define TEAM_GROVE6_COLOR 0x00D900FF
#define TEAM_GROVE7_COLOR 0x00D900FF
#define TEAM_GROVE8_COLOR 0x00D900FF
#define TEAM_GROVE9_COLOR 0x00D900FF
#define TEAM_GROVE10_COLOR 0x00D900FF
#define TEAM_VAGOS_COLOR 0xFFC801FF
#define TEAM_VAGOS1_COLOR 0xFFC801FF
#define TEAM_VAGOS2_COLOR 0xFFC801FF
#define TEAM_VAGOS3_COLOR 0xFFC801FF
#define TEAM_VAGOS4_COLOR 0xFFC801FF
#define TEAM_VAGOS5_COLOR 0xFFC801FF
#define TEAM_VAGOS6_COLOR 0xFFC801FF
#define TEAM_VAGOS7_COLOR 0xFFC801FF
#define TEAM_VAGOS8_COLOR 0xFFC801FF
#define TEAM_VAGOS9_COLOR 0xFFC801FF
#define TEAM_VAGOS10_COLOR 0xFFC801FF
#define TEAM_AZTECAS_COLOR 0x01FCFFFF
#define TEAM_AZTECAS1_COLOR 0x01FCFFFF
#define TEAM_AZTECAS2_COLOR 0x01FCFFFF
#define TEAM_AZTECAS3_COLOR 0x01FCFFFF
#define TEAM_AZTECAS4_COLOR 0x01FCFFFF
#define TEAM_AZTECAS5_COLOR 0x01FCFFFF
#define TEAM_AZTECAS6_COLOR 0x01FCFFFF
#define TEAM_AZTECAS7_COLOR 0x01FCFFFF
#define TEAM_AZTECAS8_COLOR 0x01FCFFFF
#define TEAM_AZTECAS9_COLOR 0x01FCFFFF
#define TEAM_AZTECAS10_COLOR 0x01FCFFFF
#define TEAM_NANG_COLOR 0xBDCB92FF
#define TEAM_NANG1_COLOR 0xBDCB92FF
#define TEAM_NANG2_COLOR 0xBDCB92FF
#define TEAM_NANG3_COLOR 0xBDCB92FF
#define TEAM_NANG4_COLOR 0xBDCB92FF
#define TEAM_NANG5_COLOR 0xBDCB92FF
#define TEAM_NANG6_COLOR 0xBDCB92FF
#define TEAM_NANG7_COLOR 0xBDCB92FF
#define TEAM_NANG8_COLOR 0xBDCB92FF
#define TEAM_NANG9_COLOR 0xBDCB92FF
#define TEAM_NANG10_COLOR 0xBDCB92FF
#define TEAM_RIFA_COLOR 0x000000FF
#define TEAM_RIFA1_COLOR 0x000000FF
#define TEAM_RIFA2_COLOR 0x000000FF
#define TEAM_RIFA3_COLOR 0x000000FF
#define TEAM_RIFA4_COLOR 0x000000FF
#define TEAM_RIFA5_COLOR 0x000000FF
#define TEAM_RIFA6_COLOR 0x000000FF
#define TEAM_RIFA7_COLOR 0x000000FF
#define TEAM_RIFA8_COLOR 0x000000FF
#define TEAM_RIFA9_COLOR 0x000000FF
#define TEAM_RIFA10_COLOR 0x000000FF
#define TEAM_MAFIA_COLOR 0x9A9999FF
#define TEAM_MAFIA1_COLOR 0x9A9999FF
#define TEAM_MAFIA2_COLOR 0x9A9999FF
#define TEAM_MAFIA3_COLOR 0x9A9999FF
#define TEAM_MAFIA4_COLOR 0x9A9999FF
#define TEAM_MAFIA5_COLOR 0x9A9999FF
#define TEAM_MAFIA6_COLOR 0x9A9999FF
#define TEAM_MAFIA7_COLOR 0x9A9999FF
#define TEAM_MAFIA8_COLOR 0x9A9999FF
#define TEAM_MAFIA9_COLOR 0x9A9999FF
#define TEAM_MAFIA10_COLOR 0x9A9999FF
#define TEAM_RMAFIA_COLOR 0x916600FF
#define TEAM_RMAFIA1_COLOR 0x916600FF
#define TEAM_RMAFIA2_COLOR 0x916600FF
#define TEAM_RMAFIA3_COLOR 0x916600FF
#define TEAM_RMAFIA4_COLOR 0x916600FF
#define TEAM_RMAFIA5_COLOR 0x916600FF
#define TEAM_RMAFIA6_COLOR 0x916600FF
#define TEAM_RMAFIA7_COLOR 0x916600FF
#define TEAM_RMAFIA8_COLOR 0x916600FF
#define TEAM_RMAFIA9_COLOR 0x916600FF
#define TEAM_RMAFIA10_COLOR 0x916600FF
#define TEAM_TRIADS_COLOR 0x587B95FF
#define TEAM_TRIADS1_COLOR 0x587B95FF
#define TEAM_TRIADS2_COLOR 0x587B95FF
#define TEAM_TRIADS3_COLOR 0x587B95FF
#define TEAM_TRIADS4_COLOR 0x587B95FF
#define TEAM_TRIADS5_COLOR 0x587B95FF
#define TEAM_TRIADS6_COLOR 0x587B95FF
#define TEAM_TRIADS7_COLOR 0x587B95FF
#define TEAM_TRIADS8_COLOR 0x587B95FF
#define TEAM_TRIADS9_COLOR 0x587B95FF
#define TEAM_TRIADS10_COLOR 0x587B95FF
#define TEAM_BIKERS_COLOR 0xA49A00FF
#define TEAM_BIKERS1_COLOR 0xA49A00FF
#define TEAM_BIKERS2_COLOR 0xA49A00FF
#define TEAM_BIKERS3_COLOR 0xA49A00FF
#define TEAM_BIKERS4_COLOR 0xA49A00FF
#define TEAM_BIKERS5_COLOR 0xA49A00FF
#define TEAM_BIKERS6_COLOR 0xA49A00FF
#define TEAM_BIKERS7_COLOR 0xA49A00FF
#define TEAM_BIKERS8_COLOR 0xA49A00FF
#define TEAM_BIKERS9_COLOR 0xA49A00FF
#define TEAM_BIKERS10_COLOR 0xA49A00FF
#define COLOR_INVIS 0xAFAFAFFF
#define COLOR_SPEC 0xBFC0C2FF
#define INACTIVE_PLAYER_ID 255
#define MAX_ALLOWED_CHARS 88

forward DeletePickup(pickupid);
forward DropPlayerWeapons(playerid);
forward KickWithMsg(playerid);
forward TextDraws();
forward iconmap();
forward SendMSG(playerid);
forward TextDrawT(playerid);
forward SetAllPlayerRaceCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num);
forward GameTicks (ticks);
forward ConvertTicks (ticks);
forward CopScanner ();
forward PayPlayerInArea (playerID, Float:x1, Float:y1,Float:z1, Float:x2, Float:y2,Float:z2, cash);
forward PirateShipScoreUpdate ();
forward Spectator ();
forward IsAPlane (carid);
forward IsACopCar (carid);
forward IsAnAmbulance (carid);
forward IsATruck (carid);
forward InBP1 (playerid);
forward InBP2 (playerid);
forward InBP3 (playerid);
forward InBP4 (playerid);
forward ClearCrime (playerid);
forward BetWinner (playerid,contest);
forward PayLog (string[]);
forward CmdLog (string[]);
forward RaceDebug (playerid);
forward RaceEnd ();
forward DMDelay ();
forward DMDelayr ();
forward DMDelayg ();
forward DMDetect ();
forward DMEndCam (playerid,string[]);
forward DMScoreCalc ();
forward JobGive (playerid);
forward HireCost (carid);
forward CarCheck ();
forward CarInit ();
forward CarTow (carid);
forward CarRespawn (carid);
forward LockCar (carid);
forward UnLockCar (carid);
forward TeamCarLockInit ();
forward TeamLockReset (carid);
forward InitLockDoors (playerid);
forward TeamLockDoors (playerid);
forward DebugPrint (string[],value1,value2,type);
forward CellPhoneTimer ();
forward SetPlayerFlash ();
forward SetPlayerFlashRev ();
forward RingToner ();
forward RingTonerRev ();
forward SetPlayerUnjail ();
forward VoteKickTimer ();
forward ClearVote (kickedid);
forward PrintSBizInfo (playerid,targetid);
forward PrintBizInfo (playerid,targetid);
forward PrintKillStats (playerid,targetid);
forward PrintDeathStats (playerid,targetid);
forward SetPlayerToTeamColorFlash (playerid);
forward SaveRace (playerid,name[]);
forward BestTime (name[]);
forward LoadTmp ();
forward LoadRace (playerid,name[]);
forward LoadProperty ();
forward LoadDM (playerid,name[]);
forward SaveDM (playerid,name[]);
forward LoadRaceList (playerid,name[]);
forward SaveRaceList (playerid,name[]);
forward LoadBizz ();
forward LoadSBizz ();
forward SkyDive ();
forward Production ();
forward DateProp (playerid);
forward Checkprop ();
forward DelPrint (string1[]);
forward LoadPlayer (loaderid,const string[]);
forward SavePlayer (loaderid,const string[]);
forward CopCheck (playerid);
forward MedCheck (playerid);
forward OnPlayerRename (name[],string[],playerid);
forward OnPropUpdate ();
forward ABroadCast (color,const string[],level);
forward SendTeamBeepMessage (team, color, string[]);
forward SendEnemyMessage (color, string[]);
forward SendReportMessage (color, string[]);
forward SendPlayerCommandMessage (color, string[]);
forward PlayerFixRadio (playerid);
forward PlayerFixRadio2 (playerid);
forward StopJail ();
forward HouseLevel (playerid);
forward CHouseLevel (houseid);
forward CrimInRange (Float:radi, playerid,copid);
forward CrimProxDetector(Float:radi, playerid,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10);
forward PlayerToPoint (Float:radi, playerid, Float:x, Float:y, Float:z);
forward PlayerInArea ();
forward PlayerInArena ();
forward PenInArea ();
forward CustomPickups ();
forward IdleKick ();
forward AntiCamp (playerid);
forward AntiTeleport ();
forward RaceSpec (playerid);
forward BestPlayer (playerid);
forward PenDelay (playerid);
forward SpeedDelay (playerid);
forward DMPlayer (playerid);
forward InHouse ();
forward IsStringAName (string[]);
forward GetPlayerID (string[]);
forward SetCamBack (playerid);
forward DollahScoreUpdate();
forward SetPlayerRandomSpawn(playerid);
forward CheckpointReset();
forward RaceCheckpointReset();
forward SetPlayerToTeamColor(playerid);
forward SetupPlayerForClassSelection(playerid);
forward SetPlayerTeamFromClass(playerid,classid);
forward GameModeExitFunc();
forward GameModeInitExitFunc();
forward PrePlayerNewMission();
forward SetPlayerNewMission();
forward RaceDelay();
forward RaceDelayr();
forward RaceDelayg();
forward OnPlayerDropCashBox(playerid);
forward RewardCalc(playerid,min,max);
forward SetAllPlayerCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num);
forward SetAllCopCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi);
forward OpenDoors();
forward SetPlayerCriminal(playerid,declare,reason[],pe,flash);
forward SetPlayerFree(playerid,declare,reason[],pe,flash);
forward OffTheHook();
forward SetPlayerWeapons(playerid);
forward PrintPlayerWeapons(playerid,targetid);
forward SetPlayerToTeamColor(playerid);
forward GameModeInitExitFunc();
forward LoadConfig();
forward GetVal(string[]);
forward SyncUp();
forward SyncTime();
forward PayDay();
forward strtik(const string[], &index);
forward split(const strsrc[], strdest[][], delimiter);
forward OnPlayerLogin(playerid,const string[]);
forward OnUpdatePlayer(playerid);
forward BroadCast(color,const string[]);
forward OOCOff(color,const string[]);
forward PlaySoundAll(playerid, soundid, Float:psx ,Float:psy ,Float:psz);
forward SendTeamMessage(team, color, string[]);
forward SendAdminMessage(color, string[]);
forward AddCar(carcoords);
forward PlayerPlayMusic(playerid);
forward StopMusic();
forward Encript(string[]);
forward Decript(string[]);
forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
forward ProxDetectorS(Float:radi, playerid, targetid);
forward FixHour(hour);
forward TestDistance(playerid,giveplayerid,Float:tarx,Float:tary,Float:tarz,Float:radi);
forward PlayJailSound(sound , stopsound, duration, Float: jailx,  Float: jaily,  Float: jailz);
forward ExecuteCount(playerid,pid);
forward GoDuel(playerid,pid,w1,w2);
forward ExpireDuel(playerid,pid);

//------------------------------------------------------------------------------------------------------
new DropLimit = 4; // above
new DeleteTime = 20; //above
new Text:PE;
new Text:LS;
new Text:Mode;
new Text:Version;
new Text:Site;
new
	bool:InvitedDuel[MAX_PLAYERS],
	IdDuel[MAX_PLAYERS],
	wep1[MAX_PLAYERS],
	wep2[MAX_PLAYERS],
	bool:UsingArena,
	Counting = 5,
	CountDueling[5][5] ={"~r~1","~b~2","~p~3","~y~4","~g~5"}
;
new PlayerInLounge[MAX_PLAYERS];
new pInArena1[MAX_PLAYERS];
new pInArena2[MAX_PLAYERS];
new pInArena3[MAX_PLAYERS];
new pInArena4[MAX_PLAYERS];
new pInArena5[MAX_PLAYERS];
new arenapickup1;
new arenapickup2;
new arenapickup3;
new arenapickup4;
new arenapickup5;
new arenaexitpickup1;
new arenaexitpickup2;
new arenaexitpickup3;
new arenaexitpickup4;
new arenaexitpickup5;
new mapicons=0;
new gPlayerCheckpointStatus[MAX_PLAYERS];
new gPlayerLapStatus[MAX_PLAYERS];
new gPlayerLogged[MAX_PLAYERS];
new gPlayerSpawned[MAX_PLAYERS];
new gActivePlayers[MAX_PLAYERS];
new gLastCar[301];
new gOoc[MAX_PLAYERS];
new BigEar[MAX_PLAYERS];
new Spectate[MAX_PLAYERS];
new FlashTime[MAX_PLAYERS];
new CellTime[MAX_PLAYERS];
new JailTime[MAX_PLAYERS];
new StartTime[MAX_PLAYERS];
new RaceTime[MAX_PLAYERS];
new Contract[MAX_PLAYERS];
new KickVote[MAX_PLAYERS];
new VoteKick[MAX_PLAYERS];
new LastVote[MAX_PLAYERS];
new HireCar[MAX_PLAYERS];
new SafeTime[MAX_PLAYERS];
/*new HidePM[MAX_PLAYERS];*/
new gDice[MAX_PLAYERS];
new gSkyDive[MAX_PLAYERS];
new gSpeedo[MAX_PLAYERS];
new gSpentCash[MAX_PLAYERS];
new FirstSpawn[MAX_PLAYERS];
new gPlayerFighter[MAX_PLAYERS];
new DmScore[MAX_PLAYERS];
new LapCount[MAX_PLAYERS];
new SwitchKey[MAX_PLAYERS];
new TVMode[MAX_PLAYERS];
new Fixr[MAX_PLAYERS];
new Hidden[MAX_PLAYERS];
new Locator[MAX_PLAYERS];
new PLicence[MAX_PLAYERS];
new DmHiScore;
new DmHiPlayer = 255;
new Speeder;
new gFighters;
new pos1time;
new pos2time;
new pos3time;
new cmins,csecs,cmils;
new Mobile[MAX_PLAYERS];
new RingTone[MAX_PLAYERS];
new CallCost[MAX_PLAYERS];
new Mute[MAX_PLAYERS];
new gPlayerAccount[MAX_PLAYERS];
new gRaceGuy[MAX_PLAYERS];
new gPlayerMission[MAX_PLAYERS];
new gPhoneBook[MAX_PLAYERS];
new gLastDriver[302];
new gTeamCarLock[265];
new gCarLock[265];
new gPublicEnemy = INVALID_PLAYER_ID;
new gSuperCop = INVALID_PLAYER_ID;
new gRaceLeader;
new gFightLeader;
new gRaceFin;
new gRaceMid;
new gRaceMid2;
new gRaceEnd;
new LevScoreOld;
new MissionActive;
new DropOff;
new noooc;
new racelist = 1;
new dmlist = 1;
new automission = 1;
new adds = 1;
new addtimer = 60000;
new raceendtimer;
new dmweapon;
new RetVal;
new specflick;
new Float:rx, Float:ry, Float:rz;
new Float:cwx, Float:cwy, Float:cwz;
new Float: scx, Float: scy, Float: scz;
new Float:rsx, Float:rsy, Float:rsz;
new Float:rmx, Float:rmy, Float:rmz;
new Float:rm2x, Float:rm2y, Float:rm2z;
new Float:rex, Float:rey, Float:rez;
new Float: jailxt, Float: jailyt, Float: jailzt;
new stopsoundt;
new carselect[15];
new objstore[128];
new cbjstore[128];
new motd[256];
new CurrentRace[256];
new stealcar = 0;
new stealcardest = 0;
new rccounter = 0;
new racedelay = 60000;
//new RStart;
new RNext;
new RNext2;
new REnd;
new Float:radardist = 1000.0;
new radarfreq = 1000;
new ghour = 0;
new gminute = 0;
new gsecond = 0;
new reward = 0;
new mediccharge = 1000;
new preward = 0;
new numplayers = 0;
new dollah = 1000; // Amount player recieves on spawn.
new realtime = 1;
new wtime = 15;
new hotwire = 1;
new cashbox = 1;
new streetrace = 1;
new deathmatch = 1;
new levelcost = 10000;
new deathcost = 500;
new paycheck = 10000;
new jobdelay = 20000;
new petime = 180000; //3 minuites
new jailtime = 20000; //20 seconds
new callcost = 10; //20 seconds
new forceteam = 0;
new realchat = 1;
new fow = 1;
new timeshift = 0;
new stats = 0;
new gdebug = 0;
new shifthour;
new synctimer;
new newmistimer;
new unjailtimer;
new playertimer;
new dmtimer;
new cartimer;
new lastkiller;
new celltimer;
new intrate = 1;
new teamcarlock = 0;
new levelexp = 2;
new nocasino = 0;
new idletime = 1800000; //30 mins
new dmtime = 240; //4 mins
new accountplay = 1;
new civnokill =1;
new basedcost = 1000;
new suecost = 1000;
new cchargetime = 10;
new txtcost = 1;
new offhook;
new pickups;
new randomrace = 0;
new nocarcash = 0;
new skydivecount = 60;
new Gtickcount;
new gLaps;
new Float:PlayerPos[MAX_PLAYERS][6];
new Float:DmeCam[6];
new Float:TeleportDest[MAX_PLAYERS][3];
new Float:CarTracking[MAX_PLAYERS][4];
new Float:TelePos[MAX_PLAYERS][6];
new Float:PenPos[3];
new BetRace[MAX_PLAYERS][2];
new BetDm[MAX_PLAYERS][2];
new tmps1[256];
new allowedchars[MAX_ALLOWED_CHARS][2] = {
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z", //26
	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z", //26
	"1","2","3","4","5","6","7","8","9","0", // 10
	"!","@","#","$","%","^","&","*","(",")","-",":",";",",",".","?"," ","[","]","{","}","~","_","/","\"","=" //26
};
new Races[54][128] = {
{"LS2LV2LS"},
{"Downhill"},
{"Docks"},
{"StormDrain"},
{"Rectang"},
{"RampTime"},
{"VineDrive"},
{"RiverDieR"},
{"aero"},
{"AirportDrag"},
{"AirportParking"},
{"AirportRunway"},
{"AirportUnderground"},
{"Square"},
{"CrazyMtChillad"},
{"CupCakeCorner"},
{"Drift"},
{"grovesfjump"},
{"HillRun"},
{"Insanity"},
{"Jumper"},
{"LSDual"},
{"LSMainStreet"},
{"LSOrbital"},
{"OverHill_4X4"},
{"LAEastbound"},
{"StadiumLoop"},
{"TourDeSA"},
{"Tracker"},
{"Vinal"},
{"4x4DirtLoop"},
{"4x4OverTrack"},
{"4x4LSSouth"},
{"4x4DirtLoop"},
{"HillRun"},
{"BigWater"},
{"BlueFarm"},
{"BlueRed"},
{"Coastal"},
{"Countryloop"},
{"DesertGas"},
{"DesertRamp"},
{"FarmersLoop"},
{"JimsRing"},
{"ScorpGo"},
{"RiverRun"},
{"HarbourLoop"},
{"MoonRaker"},
{"VineDrive"},
{"DesertDiver"},
{"DriftHell"},
{"PierPressure"},
{"Mental"},
{"BeachTwist"}
};

new DmGun[12] = {31,30,32,26,28,24,27,25,29,22,23,0};

new DeathMatches[36][128] = {
{"Area52"},
{"Atlantis"},
{"Baseball"},
{"Construction"},
{"Quarry"},
{"Refinery"},
{"RodsOffice"},
{"RodsCastle"},
{"Carrier"},
{"TheBoat"},
{"Ruins"},
{"RodsCampus"},
{"Ruins"},
{"Urban"},
{"Ruins"},
{"TheCage"},
{"TheFarm"},
{"WildWest"},
{"Suburb"},
{"TruckYard"},
{"OpenWarII"},
{"MastaTrailer"},
{"EstateOfHate"},
{"OpenWar"},
{"HellSite"},
{"BigEars"},
{"PirateView"},
{"CabinFever"},
{"BatesMotel"},
{"Woods"},
{"SleepyHallow"},
{"WangView"},
{"DeathWay"},
{"TrainHouse"},
{"Glen"},
{"Abandon"}
};

new Float:gRandomPlayerSpawns[15][3] = {
{1094.4218,-1098.2269,25.2422},
{1101.2023,-1085.7203,26.1813},
{1096.1254,-1064.2736,29.1876},
{1103.8142,-1026.3247,32.0990},
{1142.7146,-1026.3687,32.0073},
{291.8222,-1336.9775,53.4404},
{246.7791,-1354.0120,53.1094},
{161.7426,-1342.1641,69.6395},
{419.9783,-1264.4738,51.5809},
{398.8884,-1270.2999,50.0198},
{2241.2683,-1241.4480,25.3971},
{2221.3689,-1237.8572,24.8427},
{2144.9207,-1245.7646,24.9917},
{2104.0166,-1245.5676,25.2678},
{2191.5950,-1277.3251,25.0362}
};

new Float:gRandomDMSpawns[21][3] = {
{-2414.0,1551.8,2.1}, // 1
{-2406.9,1555.2,2.1}, // 2
{-2392.8,1550.4,2.1}, // 3
{-2406.6,1545.1,2.1}, // 4
{-2391.9,1539.2,2.1}, // 5
{-2379.7,1541.8,2.1}, // 6
{-2366.9,1539.6,2.1}, // 7
{-2426.6,1537.4,2.1}, // 8
{-2473.5,1550.1,33.2}, // 9
{-2474.2,1546.8,23.6}, // 10
{-2464.2,1530.9,17.3}, // 11
{-2437.5,1559.0,17.3}, // 12
{-2416.3,1554.3,26.0}, // 13
{-2424.7,1542.5,26.0}, // 14
{-2410.5,1532.4,26.0}, // 15
{-2403.5,1546.5,26.0}, // 16
{-2389.2,1550.7,26.0}, // 17
{-2368.0,1556.7,17.3}, // 18
{-2351.5,1551.1,23.1}, // 19
{-2313.7,1546.4,18.7}, // 20
{-2313.7,1546.4,18.7} // 21
};

new Float:gDMWbounds[4] = {0.0,0.0,0.0,0.0};

new Float:gCopPlayerSpawns[2][3] = {
{1530.8369,-1664.8872,6.2188},
{1530.6913,-1669.4760,6.2188}
//{614.8,-608.2,17.2},
//{611.5,-607.8,17.2}
};

new Float:gMedPlayerSpawns[2][3] = {
{1178.1,-1321.0,14.1},
{1177.7,-1325.0,14.0}
};

new Float:gRaceCheckpoints[5][3] = {
{144.869800 ,-1564.952000,10.716340},
{1370.314000,-939.442600,34.187500},
{2865.989000,-1657.180000,10.875000},
{2123.180000,-2665.730000,13.375000},
{1350.4,-1400.2,13.3}//ls
};

/*
{1699.2, 1435.1, 10.7},
{1457.7,-1160.6,23.4},
{1454.2,-1439.2,13.1},
{1711.3,-1439.7,13.1},
{1710.7,-1163.6,23.4},
{1711.3,-1439.7,13.1},
{-1417.0,-295.8,14.1},
{-1945.2,606.4,35.0},//sf
{-2262.5,2310.1,4.8},
{-795.5,2421.2,157.0},
{310.1,1946.2,17.6},
{2349.5,2142.5,10.6},//lv
{1350.4,-1400.2,13.3}//ls
};
*/

new Float:gCBdropoff[37][3] = {
{2217.2,-1179.7,29.7},
{1098.1,-1428.0,22.7},
{2484.2,-1961.8,16.7},
{733.2,-1357.9,23.5},
{1411.6,-1455.1,20.4},
{1080.6,-1605.0,20.4},
{382.0,-2058.7,10.7},
{656.1,-1646.6,15.4},
{816.2,-1380.5,23.5},
{853.3,-1388.2,-0.5},
{915.4,-1235.1,17.2},
{1153.7,-1180.4,32.8},
{1183.9,-1257.3,18.8},
{1441.3,-926.8,39.6},
{1527.5,-893.5,57.6},
{1342.1,-1624.3,17.7},
{1292.1,-770.7,95.9},
{1907.9,-1318.6,14.1},
{1971.7,-1284.5,28.4},
{2687.1,-1144.6,71.3},
{2654.1,-1317.5,58.9},
{2771.0,-1388.5,27.1},
{2793.3,-1945.0,17.3},
{197.9,-1206.0,78.3},
{2447.5,-2209.8,26.6},
{2512.4,-2072.9,26.5},
{2171.6,-1732.1,17.2},
{2175.4,-1836.1,16.1},
{2399.5,-1550.7,28.0},
{2109.2,-1010.2,63.8},
{1409.9,-1274.5,33.4},
{1279.8,-1439.0,20.4},
{2234.0,-2269.3,17.8},
{2025.8,-2133.1,19.8},
{811.2,-1098.2,25.9},
{818.2,-944.2,55.2},
{1976.8,-1779.4,17.3}
};

enum pSpec
{
	Float:sPx,
	Float:sPy,
	Float:sPz,
	sPint,
	sLocal,
	sCam,
};

new Unspec[MAX_PLAYERS][pSpec];

enum eCars
{
	model_id,
	Float:pos_x,
	Float:pos_y,
	Float:pos_z,
	Float:z_angle,
	respawn_delay
};

enum pInfo
{
	pPassword[128],
	pCash,
	pAccount,
	pAdmin,
	pLevel,
	pExp,
	gPupgrade,
	pKills,
	pCB,
	pHW,
	pSR,
	pWA,
	pPEN,
	pGun1,
	pGun2,
	pGun3,
	pGun4,
	pGun5,
	pGun6,
	pAmmo1,
	pAmmo2,
	pAmmo3,
	pAmmo4,
	pAmmo5,
	pAmmo6,
	Float:pSHealth,
	Float:pHealth,
	Float:pPos_x,
	Float:pPos_y,
	Float:pPos_z,
	pInt,
	pLocal,
	pTeam,
	pModel,
	pPnumber,
	pPhousekey,
	pPbiskey,
};
new PlayerInfo[MAX_PLAYERS][pInfo];

enum plInfo
{
	plPassword[128],
	plCash,
	plAccount,
	plAdmin,
	plLevel,
	plExp,
	glPupgrade,
	plKills,
	plCB,
	plHW,
	plSR,
	plWA,
	plPEN,
	plGun1,
	plGun2,
	plGun3,
	plGun4,
	plGun5,
	plGun6,
	plAmmo1,
	plAmmo2,
	plAmmo3,
	plAmmo4,
	plAmmo5,
	plAmmo6,
	Float:plSHealth,
	Float:plHealth,
	Float:plPos_x,
	Float:plPos_y,
	Float:plPos_z,
	plInt,
	plLocal,
	plTeam,
	plModel,
	plPnumber,
	plPhousekey,
	plPbiskey,
};
new PLlayerInfo[MAX_PLAYERS][plInfo];

enum hInfo
{
	Float:hEntrancex,
	Float:hEntrancey,
	Float:hEntrancez,
	Float:hExitx,
	Float:hExity,
	Float:hExitz,
	hHealthx,
	hHealthy,
	hHealthz,
	hArmourx,
	hArmoury,
	hArmourz,
	hOwner[MAX_PLAYER_NAME],
	hDiscription[MAX_PLAYER_NAME],
	hValue,
	hHel,
	hArm,
	hInt,
	hLock,
	hOwned,
	hRooms,
	hRent,
	hRentabil,
	hTakings,
	hVec,
	hVcol1,
	hVcol2,
	hDate,
	hLevel,
};

new HouseInfo[34][hInfo];

enum bInfo
{
	Float:bEntrancex,
	Float:bEntrancey,
	Float:bEntrancez,
	Float:bExitx,
	Float:bExity,
	Float:bExitz,
	bHealthx,
	bHealthy,
	bHealthz,
	bArmourx,
	bArmoury,
	bArmourz,
	bOwner[MAX_PLAYER_NAME],
	bDiscription[64],
	bValue,
	bHel,
	bArm,
	bInt,
	bLock,
	bOwned,
	bEntcost,
	bTakings,
	bDate,
	bLevel,
	bProd,
	bProdCap,
	bComp,
	bCompCap,
	bProdCost,
	bPayComp,
	bPriceMod,
};

new BizzInfo[13][bInfo];

enum sbInfo
{
	Float:sbEntrancex,
	Float:sbEntrancey,
	Float:sbEntrancez,
	sbOwner[MAX_PLAYER_NAME],
	sbDiscription[64],
	sbValue,
	sbHel,
	sbArm,
	sbInt,
	sbLock,
	sbOwned,
	sbEntcost,
	sbTakings,
	sbDate,
	sbLevel,
	sbProd,
	sbProdCap,
	sbComp,
	sbCompCap,
	sbProdCost,
	sbPayComp,
};

new SBizzInfo[14][sbInfo];

enum pHaul
{
	pCapasity,
	pLoad,
};

new PlayerHaul[100][pHaul];

enum pCrime
{
	pBplayer[32],
	pAccusing[32],
	pAccusedof[32],
	pVictim[32],
};

new PlayerCrime[MAX_PLAYERS][pCrime];

enum pTele
{
	Float:pTmpposx,
	Float:pTmpposy,
	Float:pTmpposz,
	pTmpint,
};

new Teletmp[255][pTele];

enum rInfo
{
	Float:rStartx,
	Float:rStarty,
	Float:rStartz,
	Float:rMidx,
	Float:rMidy,
	Float:rMidz,
	Float:rMid2x,
	Float:rMid2y,
	Float:rMid2z,
	Float:rEndx,
	Float:rEndy,
	Float:rEndz,
	rName[MAX_PLAYER_NAME],
	rBest[MAX_PLAYER_NAME],
	rBestm,
	rBests,
	rBestms,
	rLaps,
};

new RaceInfo[rInfo];

/*
enum pPickup
{
	pID,
	pType,
	Float:pPx,
	Float:pPy,
	Float:pPz,
};

new PickUps[MAX_PLAYERS][pPickup];
*/

new RandCars[50][1] = {
{404},{405},{410},{413},{418},
{419},{421},{422},{426},{436},
{439},{445},{458},{466},{467},
{474},{475},{479},{482},{483},
{491},{492},{496},{500},{507},
{516},{517},{518},{526},{527},
{529},{533},{540},{542},{545},
{546},{547},{549},{550},{551},
{555},{566},{579},{580},{585},
{587},{589},{600},{602},{603}
};


new RandLCars[6][1] = {
{431},// bus
{433},// barracks
{437},// coach
{443},// packer
{455},// flatbed
{578}// dft30
};


new GunPrice[30][1] = {
{500}, //parachute
{400}, //golfclub
{300}, //nightstick
{200}, //knife
{700}, //baseballbat
{300}, //shovel
{100}, //poolcue
{400}, //purpledildo
{780}, //whitedildo
{560}, //longwhitedildo
{530}, //whitedildo2
{200}, //flowers
{600}, //cane
{500}, //sdpistol
{1000}, //colt45
{1500}, //deagle
{2000}, //Tec9
{3000}, //uzi
{2500}, //mp5
{100}, //shotgun
{2000}, //spas12
{4000}, //sawnoff
{2000}, //ak47
{2500}, //m4
{1000}, //rifle
{1}, //pistolammo
{10}, //shotgunammo
{2}, //smgammo
{20}, //assaultammo
{50} //rifle
};

new Peds[276][1] = {
{264},
{102},//TEAM_BALLAS
{103},
{104},
{105},//TEAM_GROVE
{106},
{107},
{108},//TEAM_VAGOS
{109},
{110},
{114},//TEAM_AZTECAS
{115},
{116},
{121},// TEAM_NANG
{122},
{123},
{124},//TEAM_MAFIA
{125},
{126},
{127},
{111},//TEAM_RMAFIA
{112},
{113},
{117},//TEAM_TRIADS
{118},
{120},
{247},//TEAM_BIKERS
{248},
{100},
{256},
{263},
{262},
{261},
{260},
{259},
{258},
{257},
{256},
{255},
{253},
{252},
{251},
{250},
{249},
{246},
{245},
{244},
{243},
{242},
{241},
{240},
{239},
{238},
{237},
{236},
{235},
{234},
{233},
{232},
{231},
{230},
{229},
{228},
{227},
{226},
{225},
{173},
{174},
{175},
{224},
{223},
{222},
{221},
{220},
{219},
{218},
{217},
{216},
{215},
{214},
{213},
{212},
{211},
{210},
{209},//	{208},
{207},
{206},
{205},
{204},
{203},
{202},
{201},
{200},
{199},
{198},
{197},
{196},
{195},
{194},
{193},
{192},
{191},
{190},
{189},
{188},
{187},
{186},
{185},
{184},
{183},
{182},
{181},
{180},
{179},
{178},
{177},
{176},
{172},
{171},
{170},
{169},
{168},
{167},//	{166},//	{165},//	{164},//	{163},
{162},
{161},
{160},
{159},
{158},
{157},
{156},
{155},
{154},
{153},
{152},
{151},
{150},//	{149},
{148},
{147},
{146},
{145},
{144},
{143},
{142},
{141},
{140},
{139},
{138},
{137},
{136},
{135},
{134},
{133},
{132},
{131},
{130},
{129},
{128},
{101},
{254},
{99},
{98},
{97},
{96},
{95},
{94},
{93},
{92},
{91},
{90},
{89},
{88},
{87},//	{86},
{85},
{84},
{83},
{82},
{81},
{80},
{79},
{78},
{77},
{76},
{75},//	{74},
{73},
{72},
{69},
{68},
{67},
{66},//	{65},
{64},
{63},
{62},
{61},
{60},
{59},
{58},
{57},
{56},
{55},
{54},
{53},
{52},
{51},
{50},
{49},
{48},
{47},
{46},
{45},
{44},
{43},//	{42},
{41},
{40},
{39},
{38},
{37},
{36},
{35},
{34},
{33},
{32},
{31},
{30},
{29},
{28},
{27},
{26},
{25},
{24},
{23},
{22},
{21},
{20},
{19},
{18},
{17},
{16},
{15},
{14},
{13},
{12},
{11},
{10},
{1},//TRUTH
{2},//MACCER
{290},//ROSE
{291},//PAUL
{292},//CESAR
{293},//OGLOC
{294},//WUZIMU
{187},
{296},//JIZZY
{297},//MADDOGG
{298},//CAT
{299},//ZERO
{71}, //=255 amb
{70},
{274},
{275},
{276}, //==259
{163}, //=260
{164},
{165},
{166},
{295},//TORINO
{246},
{186},
{147},
{288},
{286},
{285},
{284},
{283},
{282},
{281},
{280} //276
};
//{9},
//{8},
//{7},
//{6},
//{5},
//{4},
//{3},
//{2},
//{1}


/*
{536},//Blade
{496},//Blista
{422},//Bobcat
{518},//Buccaneer
{402},//Buffalo
{482},//Burrito
{480},//Comet
{562},//Elegy
{587},//Euros
{533},//Feltzer
{565},//Flash
{579},//Huntly
{545},//Hustler
{546},//Intruduer
{559},//Jester
{400},//Landstalker
{517},//Majestic
{551},//Merit
{500},//Mesa
{467},//Oceanic
{603},//Phoenix
{436},//Previon
{475},//Sabre
{567},//Savanna
{535},//Slamvan
{561},//Stratum
{560},//Sultan
{550},//Sunrise
{566},//Tahoma
{558},//Uranus
{540},//Vincent
{412},//Voodoo
{421},//Washington
{529},//Willard
{555}//Windsor
};
*/

new RandLow[7][1] = {
{536}, //Blade
{575}, //Broadway
{534}, //Remington
{567}, //Savanna
{535}, //Slamvan
{576}, //Tornado
{412}  //Voodoo
};

new RandBikes[12][1] = {
//{448},//Pizza Boy
{461},//PCJ-600
{462},//Faggio
{463},//Freeway
{468},//Sanchez
{481},//BMX
{509},//Bike
{510},//Mountain Bike
{521},//FCR-900
//{522},//NRG-500
{581},//BF-400
{586},//Wayfarer
{571},//kart
{471}//quad
};

new RandAngles[5][1] = {
{562},//Elegy
//{561},//Stratum
{565},//Flash
{559},//Jester
{558},//Uranus
{560}//Sultan
};

new RandomMSG[][] =
{
    "SMS: Visit our forums: http://rbkbrigades.tk, Sender: MOLE (555)",
    "SMS: If you want to listen some good music use /radio, Sender: MOLE (555)",
    "SMS: Remember to kill the PENo1 and get his money, Sender: MOLE (555)",
    "SMS: Play always the missions, Sender: MOLE (555)",
    "SMS: Gain exp and level up for buy a house or a biz, Sender: MOLE (555)",
    "SMS: If you are looking for a mission just send me a message by typing /sms 555 yes, Sender: MOLE (555)",
    "SMS: Dont know what this gamemode is about? check our forums theres a tutorial, Sender: MOLE (555)",
    "SMS: Want to change your class? press F4 and suicide, Sender: MOLE (555)",
    "SMS: Deposit your money at 24/7 ATM before someone robs you, Sender: MOLE (555)"
};

new Float:HouseCarSpawns[34][4] = {
{2342.5,-1039.8,52.5,180.1809},//flash //trailer 0
{2064.4,-1694.4,13.1,271.1561},//elergy 1
{2246.9573,-1909.0677,14.2518,177.5861},
{1109.8,-968.0,42.7,0.0},//house3
{2497.6274,-2025.6306,13.2521,355.4281}, // hosue 4
{2645.0,-1990.8,13.1,180.0},//balde hr - 5
{2503.5977,-1364.4044,28.2365,357.6592},//house 6
{1910.5149,-1120.5304,25.4493,177.8350},//house7
{828.8,-887.0,68.5,230.7095},//blistac 8
{2149.6,-1610.9,14.0,90.7904},//remington 9
{760.1,-1687.8,4.3,180.6},//10
{645.5,-1616.1,14.9,0.0},//supergt 11
{1830.7705,-1404.1754,13.1338,269.9360},//house 12
{1679.2,-1462.9,13.3,270.0},//comet 13
{959.5864,-901.0845,45.8584,177.3087},//newhouse cheeta	14
{2445.8,-1326.8,23.6,18.4},
{2845.9,-1286.8,18.9,90.0},//savanna 8 house 16
{2159.8,-1803.9,13.3,271.4}, //blank 17
{2485.1,-1653.4,13.1,90.7904},//bullit 10 house 18
{977.6,-829.0,95.6,0.0},//hotring 2 house 19
{1514.0,-694.6,94.5,90.0},//bullit 10 house 20
{1246.7,-1107.6,25.5,266.4},//rancher 5 house 21
{831.7,-857.5,69.9,180.0},//bucaner//hotrod 6 house 22
{1007.9,-659.4,121.1,130.6194},//cheetah 23
{1110.0,-726.4,100.1,90.0},//zr350 //house 24
{259.7,-1221.0,74.7,202.0011},//infurnus house25
{1463.7,-901.7,55.8,359.0},//euros //house26
{1440.1,-890.6,51.2,0.0},//banshee //house 27
{1040.7,-1053.7,31.7,0.0},//banshee //house 19
{1146.2,-2046.5,69.0,301.3},
//{1880.2,-2022.3,13.3,180.0},//banshee //house 20 //move
{963.5,-1830.8,12.6,254.8},//banshee //house 21
{2088.6,-1140.6,25.5,90.8},//banshee //house 21
{904.5523,-1454.7026,12.9286,269.2811},
{1534.1,-841.5,65.0,93.2}//banshee //house 21
};


new CarSpawns[186][eCars] = {
	{405,2205.2,-1177.0,25.7,270.8,never},//carid 90
	{554,2205.1,-1169.1,25.7,270.8,never},
	{426,2216.7,-1170.6,25.7,268.3,never},
	{445,2228.5,-1177.3,25.7,88.4,never},
	{492,2229.2,-1170.2,25.7,86.9,never},
	{507,2228.9,-1162.7,25.7,87.8,never},
	{545,2217.0,-1157.2,25.7,269.8,never},
	{540,169.1929,-1342.3611,69.7396,180.4404,never},
	{482,422.8060,-1263.5979,51.6681,21.4204,never},
	{547,405.9748,-1264.3921,50.1237,24.2110,never},
	{550,2242.3, -1235.4, 24.3,359.7513,never},
	{551,2223.9, -1237.3, 24.4,358.8547,never},
	{560,2106.4695,-1248.7920,24.0461,0.1524,never},
	{566,2196.2891,-1277.7905,24.2147,180.4522,never},
	{402,198.6057,-1437.2435,13.1844,318.3837,never},
	{405,216.5521,-1431.4004,13.0853,132.5749,never},
	{554,334.2231,-1343.7405,14.3828,209.9581,never},
	{426,481.0428,-1320.8564,15.4095,35.6808,never},
	{507,697.4343,-1230.9486,16.5063,298.7916,never},
	{545,723.9850,-1121.5535,18.1450,333.9010,never},
	{540,912.2176,-996.2035,38.1402,7.5764,never},
	{482,982.1829,-921.8636,41.8776,262.3163,never},
	{547,981.8715,-917.3546,41.5443,88.0589,never},
	{550,1188.4082,-925.1859,42.8590,277.5563,never},
	{400,1307.5226,-914.4717,39.0082,269.3765,never},
	{405,1450.2,-937.1,36.2,269.6909,never}, //116
	{492,2148.3257,-1175.2518,24.1959,269.6909,never},
	{507,2161.4871,-1163.1450,23.6760,269.1628,never},
	{545,2216.8965,-1165.9469,25.4697,89.8643,never},
	{540,2348.2910,-1167.9983,27.3637,323.1586,never},
	{482,2502.0388,-1134.9507,39.1953,150.9506,never},
	{547,2909.4895,-1180.3746,11.0176,222.1346,never},
	{550,2853.1858,-1326.8011,11.1511,278.9301,never},
	{551,2797.2690,-1549.3374,10.4935,93.0282,never},
	{533,2796.9031,-1567.2024,10.6386,272.4041,never},
	{482,2813.2175,-1673.0276,9.6638,2.3369,never},
	{547,2827.6736,-1703.9755,9.7308,77.2896,never},
	{550,2809.3872,-1837.2391,9.7398,268.9880,never},
	{551,2870.8789,-1943.2599,11.4834,359.2344,never},
	{566,2411.5386,-2134.7576,13.9352,0.7795,never},
	{554,1389.7467,-2695.9370,13.4164,121.1818,never},
	{405,783.1359,-1601.8208,13.2577,270.9069,never},
	{554,782.7205,-1619.3584,13.2653,93.0550,never},
	{426,923.0841,-1361.7990,13.0324,181.1371,never},
	{445,911.7986,-1352.7415,13.1543,359.3287,never},
	{492,1174.6599,-922.1939,43.1189,276.8927,never},
	{507,1363.0210,-1288.3124,13.2839,180.1453,never},
	{545,1363.2723,-1260.8229,13.0954,179.5841,never},
	{540,2383.5627,-1927.9207,13.2436,359.6281,never},
	{482,2377.0374,-1927.8434,13.1071,0.7843,never},
	{547,2391.7234,-1978.0658,13.1963,90.1736,never},
	{550,2396.6899,-1966.8123,13.2793,271.6838,never},
	{551,2391.1135,-1500.6554,23.6355,269.7709,never},
	{560,2390.7446,-1490.9093,23.5335,271.1926,never},
	{405,321.2212,-1809.3561,4.2627,179.7758,never},
	{554,334.3586,-1789.3143,4.6717,178.7722,never},
	{426,343.8039,-1808.9827,4.3090,181.8368,never},
	{445,499.4850,-1764.0182,5.3367,89.7930,never},
	{492,646.4998,-1771.6411,13.2905,348.7706,never},
	{507,740.4332,-1797.7659,13.9196,349.9927,never},//150
	{545,652.4496,-1656.7273,14.4585,91.3294,never},
	{540,546.0256,-1622.4747,16.4585,180.7857,never},
	{482,438.9431,-1625.4088,25.7951,0.1850,never},
	{547,453.3896,-1494.3240,30.7917,7.7513,never},
	{550,487.6469,-1516.2312,20.0235,185.5384,never},
	{551,300.5775,-1490.8882,24.3748,235.1359,never},
	{560,297.9918,-1535.9011,24.3758,231.2773,never},
	{566,524.0590,-1375.0093,15.8231,193.3626,never},
	{405,598.9131,-1519.1414,14.8214,180.4083,never},
	{554,593.2022,-1519.3578,14.9461,181.5466,never},
	{426,733.5679,-1438.4880,13.3203,266.7551,never},
	{445,770.4971,-1431.1127,13.3247,0.7436,never},
	{492,735.9440,-1346.2430,13.3003,88.3069,never},
	{507,736.8572,-1337.1550,13.3140,271.3832,never},
	{545,856.7003,-1363.1852,13.4093,179.8542,never},//165
	{482,888.1506,-1659.2727,13.3296,1.2414,never},
	{547,879.1024,-1669.2560,13.3305,180.5853,never},
	{550,888.0242,-1678.5981,13.3294,358.4990,never},
	{551,920.4441,-1823.0966,12.3452,84.1821,never},
	{560,986.5818,-1761.2992,13.4014,181.9385,never},
	{566,1062.6744,-1757.9412,13.1956,89.0572,never},
	{405,1084.3831,-1763.8369,13.1501,269.0443,never},
	{554,1081.8948,-1629.9564,13.4064,90.0880,never},
	{426,981.7941,-1523.5115,13.3379,267.2751,never},
	{445,1014.7464,-1434.4586,13.3292,266.3129,never},
	{492,2684.6,-1990.2,13.3,180.0931,never},
	{507,2684.6,-2019.0,13.3 ,0.8777,never},
	{545,1096.1,-1379.9,13.3,270.1909,never},//178
	{540,1151.6812,-1203.2323,20.2889,273.5155,never},//179
	{482,1182.2568,-1219.2407,18.4163,0.5578,never},
	{547,1260.9978,-1187.1921,23.3559,183.3606,never},
	{550,1331.9304,-1081.3899,24.9941,90.4092,never},
	{551,1284.8755,-1525.5013,13.3451,269.4388,never},
	{560,1279.1887,-1539.2032,13.3201,94.8070,never},
	{566,1275.9120,-1646.7448,13.3273,267.2669,never},
	{405,1318.2792,-1785.7821,13.2429,182.4215,never},
	{554,1253.9153,-1833.3832,13.1734,175.3692,never},
	{426,1279.2875,-1814.4156,13.1657,93.6385,never},
	{445,1198.5004,-1835.2216,13.1820,93.6780,never},
	{492,1479.9131,-1737.8813,13.2418,269.5805,never},
	{507,1508.1047,-1737.7089,13.2418,270.0250,never},
	{545,1618.0411,-1891.1044,13.3278,0.3364,never},
	{540,1623.7291,-1892.7234,13.3307,180.0126,never},
	{482,1742.8494,-1857.7446,13.1960,271.1740,never},
	{547,1743.5837,-1844.6041,13.3557,180.3384,never},
	{550,1838.1904,-1871.3842,13.1703,358.5452,never},
	{551,1841.4791,-1871.6549,13.1687,179.3825,never},
	{560,1777.1376,-1910.0310,13.1681,91.0725,never},
	{566,1803.1235,-1920.5144,13.1758,266.0453,never},
	{566,1981.0780,-1986.3513,13.3275,2.1479,never},
	{405,1987.6057,-1994.9520,13.3296,359.9128,never},
	{554,1978.0371,-2066.7500,13.1640,358.2871,never},
	{426,1984.7471,-2066.7776,13.1625,359.7226,never},
	{445,1938.0565,-2086.8459,13.3429,268.3414,never},
	{492,1947.1119,-2136.3887,13.3286,90.9804,never},
	{507,1932.1523,-2141.5220,13.3429,1.8383,never},
	{545,1793.9172,-2148.5300,13.3781,359.7861,never},
	{540,1748.0751,-2084.2090,13.3324,0.4337,never},
	{482,1560.5026,-2260.5457,13.3258,268.7398,never},
	{547,1461.6943,-1505.1688,13.2541,356.9007,never},
	{550,1426.4930,-1402.3170,13.1800,181.0290,never},
	{551,1435.0645,-1325.6835,13.2580,270.9400,never},
	{560,1513.9486,-1272.5691,14.2685,181.0697,never},
	{566,1583.7561,-1338.7435,16.1896,359.8619,never},
	{405,1573.8772,-1209.9202,17.1378,92.7502,never},
	{554,1476.2012,-1120.3083,23.5660,359.9746,never},
	{426,1430.2316,-1054.8555,22.8693,359.3625,never},
	{445,1574.1168,-1036.7643,23.6151,145.6786,never},
	{492,1617.6676,-1009.8663,23.6052,356.8697,never},
	{507,1645.3188,-1036.5238,23.6027,0.7258,never},
	{545,1735.2826,-1010.5402,23.6588,346.3133,never},
	{540,1770.4874,-1060.9886,23.6658,179.2750,never},
	{482,1739.9854,-1084.5490,23.6660,176.8026,never},
	{547,1653.1766,-1134.8994,23.6110,178.6835,never},
	{550,1617.3746,-1132.8293,23.6117,91.7300,never},
	{551,1790.0190,-1292.9065,13.2653,267.2964,never},
	{560,1754.3009,-1476.8170,13.2402,269.6320,never},
	{554,2003.3417,-1121.4993,26.3879,357.4926,never},
	{426,2084.2334,-1170.0986,24.2042,91.8975,never},
	{445,2229.1128,-1357.8774,23.6930,268.2194,never},
	{492,2229.2278,-1345.4033,23.6892,93.3009,never},
	{507,2332.5684,-1362.4845,23.7297,358.1198,never},
	{545,2384.1567,-1275.6326,23.9198,101.6528,never},
	{540,2432.3149,-1226.0785,24.9941,17.9805,never},
	{482,2426.9612,-1224.4158,25.0000,202.7159,never},
	{547,2438.4309,-1321.6925,24.1225,269.7535,never},
	{551,2612.9702,-1262.6970,48.2461,269.4752,never},
	{560,2659.4529,-1428.4343,30.1790,266.5051,never},
	{566,2659.7053,-1422.6743,30.1714,89.8159,never},
	{405,2485.5313,-1556.1823,23.7478,178.8338,never},
	{554,2478.7664,-1555.7006,23.7226,183.6043,never},
	{426,2605.3967,-1365.8829,34.6461,359.9891,never},
	{445,2754.7136,-1373.0253,40.1154,91.4169,never},
	{492,2717.3662,-1468.0308,30.0894,1.0298,never},
	{507,2816.7195,-1449.4285,15.9549,268.9106,never},
	{545,2816.9937,-1441.5880,15.9544,90.7779,never},
	{540,2681.9016,-1673.3879,9.1290,0.5605,never},
	{482,2442.5845,-1642.7507,13.1644,180.3454,never},
	{547,2361.3120,-1674.6146,13.2505,357.4959,never},
	{550,2298.3535,-1633.7542,14.3849,80.8107,never},
	{551,2297.9077,-1639.9464,14.4352,94.4292,never},
	{560,2255.4045,-1664.5736,15.1304,74.6898,never},
	{566,2234.1057,-1726.9386,13.1665,271.7536,never},
	{405,2319.3833,-1716.6823,13.2518,359.8540,never},
	{554,2474.5105,-1755.9194,13.2522,270.5967,never},
	{426,2501.8213,-1754.2794,13.1208,176.4916,never}, //= 255
	{445,2489.1560,-1952.6886,13.1366,178.1629,never},
	{492,2495.4326,-1953.2922,13.1299,356.5514,never},
	{507,2306.7168,-1989.6796,13.2639,184.8385,never},
	{482,2056.1807,-1904.7751,13.2502,2.2910,never},
	{550,2064.9871,-1919.1674,13.2504,180.8575,never},
	{551,1886.4812,-2022.9338,13.0964,179.4265,never},
	{560,1824.8976,-2019.8374,13.0875,272.5273,never},
	{566,1942.1669,-1862.6425,13.2679,264.5590,never},
	{405,1923.9409,-1795.5616,13.0877,90.0886,never},
	{554,1807.0905,-1571.7120,13.1659,125.1048,never},
	{426,1809.9016,-1676.0603,13.2422,180.7589,never},
	{445,1809.6266,-1653.3402,13.2365,180.6530,never},
	{492,1809.7056,-1660.3019,13.2380,180.6262,never},
	{507,1978.4003,-1675.0157,15.6741,269.7336,never},
	{545,1974.8230,-1693.5488,15.6741,92.1162,never},
	{540,1929.2253,-1584.6954,13.2700,185.5542,never},
	{482,1731.9725,-1590.8959,13.1630,77.7249,never},
	{547,1721.5776,-1589.2834,13.1526,80.9057,never},
	{550,1695.1428,-1519.2667,13.1671,0.7121,never},
	{551,1694.7080,-1501.7454,13.1675,357.8150,never}
    };

// new Float:gJailPlayerSpawns[1][3] = {
// {264.395200,77.564040,1001.039000}
// };

//Round code stolen from mike's Manhunt :P
new gRoundTime = 3600000;                   // Round time - 1 hour
//new gRoundTime = 1200000;					// Round time - 20 mins
//new gRoundTime = 900000;					// Round time - 15 mins
//new gRoundTime = 600000;					// Round time - 10 mins
//new gRoundTime = 300000;					// Round time - 5 mins
//new gRoundTime = 120000;					// Round time - 2 mins
//new gRoundTime = 60000;					// Round time - 1 min



//------------------------------------------------------------------------------------------------------

main()
{

print(" "); print(" "); print(" "); print(" "); print(" "); print(" "); print(" "); print(" ");
print(" "); print(" "); print(" "); print(" "); print(" "); print(" "); print(" "); print(" ");
print("       Public Enemy                                                             ");
print("________________________________________________________________________________");
print("             Los Santos                                                         ");
print("________________________________________________________________________________");
print("                               Edited by shendlaw                               ");
print("________________________________________________________________________________");
print("                            Created by Denver (Astro)                           ");
print("________________________________________________________________________________");
print("                                                               Gamemode         ");
print("________________________________________________________________________________");
print("                                                                     Loaded     ");
}

//------------------------------------------------------------------------------------------------------

public DollahScoreUpdate()
{
	new LevScore;
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
   			LevScore = PlayerInfo[i][pLevel];
			SetPlayerScore(i, LevScore);
			if (LevScore > LevScoreOld)
			{
				LevScoreOld = LevScore;
			}
		}
	}
	return 1;
}

public GameTicks()
{
	Gtickcount = Gtickcount+500;
}

public ConvertTicks(ticks)
{
	csecs = 0;
	cmils = 0;
	cmins = 0;
	new tempcsecs = ticks / 1000;//61.59
	cmins = ticks / 60000;//1.0265
	csecs = (ticks - cmins*60000)/1000;
	cmils = (ticks - tempcsecs*1000)/10;
}


public CopScanner()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i) && gTeam[i] >= 4 && gPublicEnemy != i && gSuperCop != i && Hidden[i] !=1)
		{
			if(gTeam[i] == 4)
			{
				CrimProxDetector(radardist, i,TEAM_ORANGE1_COLOR,TEAM_ORANGE2_COLOR,TEAM_ORANGE3_COLOR,TEAM_ORANGE4_COLOR,TEAM_ORANGE5_COLOR,TEAM_ORANGE6_COLOR,TEAM_ORANGE7_COLOR,TEAM_ORANGE8_COLOR,TEAM_ORANGE9_COLOR,TEAM_ORANGE10_COLOR);
			}
			if(gTeam[i] == 5)
			{
				CrimProxDetector(radardist, i,TEAM_BALLAS1_COLOR,TEAM_BALLAS2_COLOR,TEAM_BALLAS3_COLOR,TEAM_BALLAS4_COLOR,TEAM_BALLAS5_COLOR,TEAM_BALLAS6_COLOR,TEAM_BALLAS7_COLOR,TEAM_BALLAS8_COLOR,TEAM_BALLAS9_COLOR,TEAM_BALLAS10_COLOR);
			}
			if(gTeam[i] == 6)
			{
				CrimProxDetector(radardist, i,TEAM_GROVE1_COLOR,TEAM_GROVE2_COLOR,TEAM_GROVE3_COLOR,TEAM_GROVE4_COLOR,TEAM_GROVE5_COLOR,TEAM_GROVE6_COLOR,TEAM_GROVE7_COLOR,TEAM_GROVE8_COLOR,TEAM_GROVE9_COLOR,TEAM_GROVE10_COLOR);
			}
			if(gTeam[i] == 7)
			{
				CrimProxDetector(radardist, i,TEAM_VAGOS1_COLOR,TEAM_VAGOS2_COLOR,TEAM_VAGOS3_COLOR,TEAM_VAGOS4_COLOR,TEAM_VAGOS5_COLOR,TEAM_VAGOS6_COLOR,TEAM_VAGOS7_COLOR,TEAM_VAGOS8_COLOR,TEAM_VAGOS9_COLOR,TEAM_VAGOS10_COLOR);
			}
			if(gTeam[i] == 8)
			{
				CrimProxDetector(radardist, i,TEAM_AZTECAS1_COLOR,TEAM_AZTECAS2_COLOR,TEAM_AZTECAS3_COLOR,TEAM_AZTECAS4_COLOR,TEAM_AZTECAS5_COLOR,TEAM_AZTECAS6_COLOR,TEAM_AZTECAS7_COLOR,TEAM_AZTECAS8_COLOR,TEAM_AZTECAS9_COLOR,TEAM_AZTECAS10_COLOR);
			}
			if(gTeam[i] == 9)
			{
				CrimProxDetector(radardist, i,TEAM_NANG1_COLOR,TEAM_NANG2_COLOR,TEAM_NANG3_COLOR,TEAM_NANG4_COLOR,TEAM_NANG5_COLOR,TEAM_NANG6_COLOR,TEAM_NANG7_COLOR,TEAM_NANG8_COLOR,TEAM_NANG9_COLOR,TEAM_NANG10_COLOR);
			}
			if(gTeam[i] == 78)
			{
				CrimProxDetector(radardist, i,TEAM_RIFA1_COLOR,TEAM_RIFA2_COLOR,TEAM_RIFA3_COLOR,TEAM_RIFA4_COLOR,TEAM_RIFA5_COLOR,TEAM_RIFA6_COLOR,TEAM_RIFA7_COLOR,TEAM_RIFA8_COLOR,TEAM_RIFA9_COLOR,TEAM_RIFA10_COLOR);
			}
			if(gTeam[i] == 11)
			{
				CrimProxDetector(radardist, i,TEAM_MAFIA1_COLOR,TEAM_MAFIA2_COLOR,TEAM_MAFIA3_COLOR,TEAM_MAFIA4_COLOR,TEAM_MAFIA5_COLOR,TEAM_MAFIA6_COLOR,TEAM_MAFIA7_COLOR,TEAM_MAFIA8_COLOR,TEAM_MAFIA9_COLOR,TEAM_MAFIA10_COLOR);
			}
			if(gTeam[i] == 12)
			{
				CrimProxDetector(radardist, i,TEAM_RMAFIA1_COLOR,TEAM_RMAFIA2_COLOR,TEAM_RMAFIA3_COLOR,TEAM_RMAFIA4_COLOR,TEAM_RMAFIA5_COLOR,TEAM_RMAFIA6_COLOR,TEAM_RMAFIA7_COLOR,TEAM_RMAFIA8_COLOR,TEAM_RMAFIA9_COLOR,TEAM_RMAFIA10_COLOR);
			}
			if(gTeam[i] == 13)
			{
				CrimProxDetector(radardist, i,TEAM_TRIADS1_COLOR,TEAM_TRIADS2_COLOR,TEAM_TRIADS3_COLOR,TEAM_TRIADS4_COLOR,TEAM_TRIADS5_COLOR,TEAM_TRIADS6_COLOR,TEAM_TRIADS7_COLOR,TEAM_TRIADS8_COLOR,TEAM_TRIADS9_COLOR,TEAM_TRIADS10_COLOR);
			}
			if(gTeam[i] == 14)
			{
				CrimProxDetector(radardist, i,TEAM_BIKERS1_COLOR,TEAM_BIKERS2_COLOR,TEAM_BIKERS3_COLOR,TEAM_BIKERS4_COLOR,TEAM_BIKERS5_COLOR,TEAM_BIKERS6_COLOR,TEAM_BIKERS7_COLOR,TEAM_BIKERS8_COLOR,TEAM_BIKERS9_COLOR,TEAM_BIKERS10_COLOR);
			}
		}
	}
}

public Spectator()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(TVMode[i] >= 1 && TVMode[i] <= 5)
			{
				Unspec[i][sCam] = 2;
				TVMode[i]++;
				BestPlayer(i);
			}
			if(TVMode[i] >= 6 && TVMode[i] <= 9)
			{
				Unspec[i][sCam] = 3;
				TVMode[i]++;
				BestPlayer(i);
			}
			if(TVMode[i] == 10)
			{
				TVMode[i] = 1;
				BestPlayer(i);
				Unspec[i][sCam] = random(4);
			}
			if(TVMode[i] >= 11 && TVMode[i] <= 15)
			{
				DMPlayer(i);
				Unspec[i][sCam] = 2;
				TVMode[i]++;
			}
			if(TVMode[i] >= 16 && TVMode[i] <= 19)
			{
				DMPlayer(i);
				Unspec[i][sCam] = 3;
				TVMode[i]++;
			}
			if(TVMode[i] == 20)
			{
				DMPlayer(i);
				TVMode[i] = 11;
				Unspec[i][sCam] = random(4);
			}
			if(TVMode[i] >= 21 && TVMode[i] <= 25)
			{
				RaceSpec(i);
				Unspec[i][sCam] = 2;
				TVMode[i]++;
			}
			if(TVMode[i] >= 26 && TVMode[i] <= 29)
			{
				RaceSpec(i);
				Unspec[i][sCam] = 3;
				TVMode[i]++;
			}
			if(TVMode[i] == 30)
			{
				RaceSpec(i);
				TVMode[i] = 21;
				Unspec[i][sCam] = random(4);
			}
			if(TVMode[i] >= 31 && TVMode[i] <= 35)
			{
				PenDelay(i);
				Unspec[i][sCam] = 2;
				TVMode[i]++;
			}
			if(TVMode[i] >= 36 && TVMode[i] <= 39)
			{
				PenDelay(i);
				Unspec[i][sCam] = 3;
				TVMode[i]++;
			}
			if(TVMode[i] == 40)
			{
				PenDelay(i);
				TVMode[i] = 31;
				Unspec[i][sCam] = random(4);
			}
			if(TVMode[i] >= 41 && TVMode[i] <= 45)
			{
				SpeedDelay(i);
				Unspec[i][sCam] = 2;
				TVMode[i]++;
			}
			if(TVMode[i] >= 46 && TVMode[i] <= 49)
			{
				SpeedDelay(i);
				Unspec[i][sCam] = 3;
				TVMode[i]++;
			}
			if(TVMode[i] == 50)
			{
				SpeedDelay(i);
				TVMode[i] = 41;
				Unspec[i][sCam] = random(4);
			}
			if(Spectate[i] < 253 && Spectate[i] != 255)
			{
				SetPlayerColor(i,COLOR_SPEC);
				TogglePlayerControllable(i, 0);
				new hight;
				new targetid = Spectate[i];
				new Float:px, Float:py, Float:pz, Float:pa;
				if(specflick == 1)
				{
					GetPlayerPos(targetid, CarTracking[i][0], CarTracking[i][1], CarTracking[i][2]);
				}
				px = CarTracking[i][0];py = CarTracking[i][1];pz = CarTracking[i][2];
				if(PlayerInfo[targetid][pInt] == 0)
				{
					SetPlayerInterior(i,0);
				}
				if(PlayerInfo[targetid][pInt] > 0)
				{
					SetPlayerInterior(i,PlayerInfo[targetid][pInt]);
				}
				if(pz > 530.0 && PlayerInfo[targetid][pInt] == 0) //the highest land point in sa = 526.8
				{
					SetPlayerInterior(i,1);
				}
				if(Unspec[i][sCam] <= 1 &&  Unspec[i][sCam] != 10)
				{
					if(GetPlayerState(targetid) != 1)
					{
						SetPlayerCameraPos(i,px,py,pz+40);
					}
					else
					{
						SetPlayerCameraPos(i,px,py,pz+10);
					}
					SetPlayerPos(i, px, py, pz+110);
				}
				else if(Unspec[i][sCam] >= 2 && Unspec[i][sCam] <= 3)
				{
					new dist;
					if(Unspec[i][sCam] == 2)
					{
						if(GetPlayerState(targetid) != 1)
						{
							dist = 6;
							hight = 2;
						}
						else
						{
							dist = 6;
							hight = 1;
						}
					}
					if(Unspec[i][sCam] == 3)
					{
						if(GetPlayerState(targetid) != 1)
						{
							dist = -50;
							hight = 4;
						}
						else
						{
							dist = -10;
							hight = 2;
						}
					}
					if(GetPlayerState(targetid) != 1)
					{
						if(specflick == 2)
						{
							new Float:px2, Float:py2, Float:pz2, Float:tpx,Float:tpy;
							GetPlayerPos(targetid, px2, py2, pz2);
							if(py2 > py && px2 > px)
							{
								tpx = px2-px;
								tpy = py2-py;
								if(tpy > tpx)
								{
									if(tpy-tpx > 10.0)
									{
										CarTracking[i][3] = 0.0;
									}
									else
									{
										CarTracking[i][3] = 315.0;
									}
								}
								if(tpy < tpx)
								{
									if(tpx-tpy > 10.0)
									{
										CarTracking[i][3] = 270.0;
									}
									else
									{
										CarTracking[i][3] = 315.0;
									}
								}
							}
							if(py2 < py && px2 > px)
							{
								tpx = px2-px;
								tpy = py-py2;
								if(tpy > tpx)
								{
									if(tpy-tpx > 10.0)
									{
										CarTracking[i][3] = 180.0;
									}
									else
									{
										CarTracking[i][3] = 225.0;
									}
								}
								if(tpy < tpx)
								{
									if(tpx-tpy > 10.0)
									{
										CarTracking[i][3] = 270.0;
									}
									else
									{
										CarTracking[i][3] = 225.0;
									}
								}
							}
							if(py2 < py && px2 < px)
							{
								tpx = px-px2;
								tpy = py-py2;
								if(tpy > tpx)
								{
									if(tpy-tpx > 10.0)
									{
										CarTracking[i][3] = 180.0;
									}
									else
									{
										CarTracking[i][3] = 135.0;
									}
								}
								if(tpy < tpx)
								{
									if(tpx-tpy > 10.0)
									{
										CarTracking[i][3] = 90.0;
									}
									else
									{
										CarTracking[i][3] = 135.0;
									}
								}
							}
							if(py2 > py && px2 < px)
							{
								tpx = px-px2;
								tpy = py2-py;
								if(tpy > tpx)
								{
									if(tpy-tpx > 10.0)
									{
										CarTracking[i][3] = 0.0;
									}
									else
									{
										CarTracking[i][3] = 45.0;
									}
								}
								if(tpy < tpx)
								{
									if(tpx-tpy > 10.0)
									{
										CarTracking[i][3] = 90.0;
									}
									else
									{
										CarTracking[i][3] = 45.0;
									}
								}
							}
							specflick = 0;
						}
						pa = CarTracking[i][3];
						//	new formated[256];
						//	format(formated, sizeof(formated), "Debug:CarAngle (%f)",CarTracking[i][3]);
						//	SendClientMessageToAll(COLOR_WHITE, formated);
					}
					else
					{
						GetPlayerFacingAngle(targetid,pa);
					}
					if(pa >= 0.0 && pa <= 22.5) //n1
					{
						SetPlayerCameraPos(i, px, py-(dist), pz+hight);
					}
					if(pa >= 332.5 && pa < 0.0) //n2
					{
						SetPlayerCameraPos(i, px, py-(dist), pz+hight);
					}
					if(pa >= 22.5 && pa <= 67.5) //nw
					{
						SetPlayerCameraPos(i, px+(dist/2), py-(dist/2), pz+hight);
					}
					if(pa >= 67.5 && pa <= 112.5) //w
					{
						SetPlayerCameraPos(i, px+(dist), py, pz+hight);
					}
					if(pa >= 112.5 && pa <= 157.5) //sw
					{
						SetPlayerCameraPos(i, px+(dist/2), py+(dist/2), pz+hight);
					}
					if(pa >= 157.5 && pa <= 202.5) //s
					{
						SetPlayerCameraPos(i, px, py+(dist), pz+hight);
					}
					if(pa >= 202.5 && pa <= 247.5)//se
					{
						SetPlayerCameraPos(i, px-(dist/2), py+(dist/2), pz+hight);
					}
					if(pa >= 247.5 && pa <= 292.5)//e
					{
						SetPlayerCameraPos(i, px-(dist), py, pz+hight);
					}
					if(pa >= 292.5 && pa <= 332.5)//e
					{
						SetPlayerCameraPos(i, px-(dist/2), py-(dist/2), pz+hight);
					}
					SetPlayerPos(i, px, py, pz+110);
				}
				else if(Unspec[i][sCam] == 5)
				{
					SetPlayerPos(i, px, py, pz+40);
				}
				else if(Unspec[i][sCam] == 6)
				{
					SetPlayerPos(i, rsx, rsy, rsz+100);
					SetPlayerCameraPos(i, rsx, rsy+4, rsz+2);
				}
				else if(Unspec[i][sCam] == 7)
				{
					SetPlayerPos(i, rmx, rmy, rmz+100);
					SetPlayerCameraPos(i, rmx, rmy+4, rmz+2);
				}
				else if(Unspec[i][sCam] == 8)
				{
					SetPlayerPos(i, rm2x, rm2y, rm2z+100);
					SetPlayerCameraPos(i, rm2x, rm2y+4, rm2z+2);
				}
				else if(Unspec[i][sCam] == 9)
				{
					SetPlayerPos(i, rex, rey, rez+100);
					SetPlayerCameraPos(i, rex, rey+4, rez+2);
				}
				else if(Unspec[i][sCam] == 10)
				{
					new house = Unspec[i][sLocal];
					SetPlayerPos(i,HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]+100);
					SetPlayerCameraPos(i, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]+2.0);
					SetPlayerInterior(i,0);
				}
				SetPlayerCameraLookAt(i,px,py,pz);
			}
			if(Spectate[i] == 253)
			{
				TogglePlayerControllable(i, 1);
				SetPlayerInterior(i,Unspec[i][sPint]);
				PlayerInfo[i][pInt] = Unspec[i][sPint];
				PlayerInfo[i][pLocal] = Unspec[i][sLocal];
				Unspec[i][sLocal] = 255;
				SetSpawnInfo(i, 1, PlayerInfo[i][pModel], Unspec[i][sPx],  Unspec[i][sPy], Unspec[i][sPz]-1.0, 1.0, -1, -1, -1, -1, -1, -1);
				//SetPlayerPos(i, Unspec[i][sPx], Unspec[i][sPy], Unspec[i][sPz]);
				gTeam[i] = PlayerInfo[i][pTeam];
				SetPlayerToTeamColor(i);
				SpawnPlayer(i);
				Spectate[i] = 255;
			}
			if(Spectate[i] == 254)
			{
				TogglePlayerControllable(i, 1);
				SetPlayerInterior(i,Unspec[i][sPint]);
				PlayerInfo[i][pInt] = Unspec[i][sPint];
				PlayerInfo[i][pLocal] = Unspec[i][sLocal];
				SetPlayerPos(i, Unspec[i][sPx],  Unspec[i][sPy], Unspec[i][sPz]);
				Spectate[i] = 255;
			}
			if(Spectate[i] == 256)
			{
				SetPlayerToTeamColor(i);
				Spectate[i] = 255;
			}
			if(Spectate[i] == 257)
			{
				Spectate[i] = 254;
			}
		}
	}
	if(specflick < 2)
	{
		specflick++;
	}
	else
	{
		specflick = 0;
	}
}

//------------------------------------------------------------------------------------------------------

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if (gdebug >= 1){printf("DEBUG OnPlayerEnterVehicle(%d, %d, %d)", playerid, vehicleid, ispassenger);}
	if(gTeam[playerid] == TEAM_GREEN)
	{
		if (IsACopCar(vehicleid) && !ispassenger)
		{
			SetPlayerCriminal(playerid,255, "Stealing A Police Vehicle",0,0);
			if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
		}
		if (IsAnAmbulance(vehicleid) && !ispassenger)
		{
			SetPlayerCriminal(playerid,255, "Stealing An Ambulance",0,0);
			if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
		}
	}
	return 1;
}

public IsAPlane(carid)
{
	if((carid >= 66 && carid <=71) || carid == 60)
	{
		return 1;
	}
	return 0;
}

public IsACopCar(carid)
{
	if((carid >= 35) && (carid <= 60))
	{
		return 1;
	}
	return 0;
}

public IsAnAmbulance(carid)
{
	if((carid >= 61) && (carid <= 63))
	{
		return 1;
	}
	return 0;
}

public IsATruck(carid)
{
	if(carid >= 78 && carid <= 81)
	{
		return 1;
	}
	return 0;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerConnect(playerid)
{
	mapicons=0;
	PlayerInLounge[playerid]=0;
	pInArena1[playerid]=0;
	pInArena2[playerid]=0;
	pInArena3[playerid]=0;
	pInArena4[playerid]=0;
	pInArena5[playerid]=0;

    for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if(HouseInfo[h][hOwned] == 0)
		{
			SetPlayerMapIcon(playerid, mapicons, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez], 31, 0);
			mapicons ++;
		}
		if(HouseInfo[h][hOwned] == 1)
		{
			SetPlayerMapIcon(playerid, mapicons, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez], 32, 0);
			mapicons ++;
		}
	}

    for(new b = 0; b < sizeof(BizzInfo); b++)
	{
		if(BizzInfo[b][bOwned] == 0)
		{
			SetPlayerMapIcon(playerid, mapicons, BizzInfo[b][bEntrancex], BizzInfo[b][bEntrancey], BizzInfo[b][bEntrancez], 52, 0);
			mapicons ++;
		}
		if(BizzInfo[b][bOwned] == 1)
		{
			SetPlayerMapIcon(playerid, mapicons, BizzInfo[b][bEntrancex], BizzInfo[b][bEntrancey], BizzInfo[b][bEntrancez], 36, 0);
			mapicons ++;
		}
	}

    for(new sb = 0; sb < sizeof(SBizzInfo); sb++)
	{
		if(SBizzInfo[sb][sbOwned] == 0)
		{
			SetPlayerMapIcon(playerid, mapicons, SBizzInfo[sb][sbEntrancex], SBizzInfo[sb][sbEntrancey], SBizzInfo[sb][sbEntrancez], 52, 0);
			mapicons ++;
		}
		if(SBizzInfo[sb][sbOwned] == 1)
		{
			SetPlayerMapIcon(playerid, mapicons, SBizzInfo[sb][sbEntrancex], SBizzInfo[sb][sbEntrancey], SBizzInfo[sb][sbEntrancez], 36, 0);
			mapicons ++;
		}
	}

if (gdebug >= 1){printf("DEBUG OnPlayerConnect(%d)", playerid);}
	gActivePlayers[playerid]++;
	numplayers++;
	//TelePos[playerid][0] = 0;
	//TelePos[playerid][1] = 0;
	//TelePos[playerid][2] = 0;
	SafeTime[playerid] = 60;
	BetRace[playerid][0] = 255;
	BetRace[playerid][1] = 0;
	BetDm[playerid][0] = 255;
	BetDm[playerid][1] = 0;
	//HidePM[playerid] = 0;
	gPlayerFighter[playerid] = 0;
	DmScore[playerid] = 0;
	Mobile[playerid] = 255;
	Spectate[playerid] = 255;
	Unspec[playerid][sLocal] = 255;
    gSkyDive[playerid] = 0;
	TVMode[playerid] = 0;
    gLastCar[playerid] = 0;
    FirstSpawn[playerid] = 0;
	gPlayerLapStatus[playerid] = 0;
	gOoc[playerid] = 0;
	BigEar[playerid] = 0;
	FlashTime[playerid] = 0;
	gDice[playerid] = 0;
	gSpeedo[playerid] = 0;
	gPlayerLogged[playerid] = 0;
	gPlayerAccount[playerid] = 0;
	gPlayerSpawned[playerid] = 0;
	LapCount[playerid] = 0;
	Mute[playerid] = 0;
	StartTime[playerid] = 0;
	gRaceGuy[playerid] = 0;
	Contract[playerid] = 0;
	gPlayerMission[playerid] = 0;
	PlayerInfo[playerid][pCash] = dollah;
	KickVote[playerid] = 0;
	VoteKick[playerid] = 0;
	LastVote[playerid] = 255;
	HireCar[playerid] = 299;
	Hidden[playerid] = 0;
	Locator[playerid] = 0;
	PLicence[playerid] = 0;
	gPhoneBook[playerid] = 0;
	//PlayerPos[playerid][3] = 1.0;
	//PlayerPos[playerid][4] = 1.0;
	//PlayerPos[playerid][5] = 1.0;
	GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);
	PlayerInfo[playerid][pAccount] = 0;
	PlayerInfo[playerid][pAdmin] = 0;
	PlayerInfo[playerid][pLevel] = 1;
	PlayerInfo[playerid][pExp] = 0;
	PlayerInfo[playerid][gPupgrade] = 0;
	PlayerInfo[playerid][pKills] = 0;
	PlayerInfo[playerid][pCB] = 0;
	PlayerInfo[playerid][pHW] = 0;
	PlayerInfo[playerid][pSR] = 0;
	PlayerInfo[playerid][pWA] = 0;
	PlayerInfo[playerid][pPEN] = 0;
	PlayerInfo[playerid][pGun1] = 0;
	PlayerInfo[playerid][pGun2] = 0;
	PlayerInfo[playerid][pGun3] = 0;
	PlayerInfo[playerid][pGun4] = 0;
	PlayerInfo[playerid][pGun5] = 0;
	PlayerInfo[playerid][pGun6] = 0;
	PlayerInfo[playerid][pAmmo1] = 200;
	PlayerInfo[playerid][pAmmo2] = 8;
	PlayerInfo[playerid][pAmmo3] = 30;
	PlayerInfo[playerid][pAmmo4] = 30;
	PlayerInfo[playerid][pAmmo5] = 10;
	PlayerInfo[playerid][pAmmo6] = 10;
	PlayerInfo[playerid][pSHealth] = 0.0;
	PlayerInfo[playerid][pHealth] = 50.0;
	PlayerInfo[playerid][pPos_x] = 2246.6;
	PlayerInfo[playerid][pPos_y] = -1161.9;
	PlayerInfo[playerid][pPos_z] = 1029.7;
	PlayerInfo[playerid][pInt] = 15;
	PlayerInfo[playerid][pLocal] = 255;
	PlayerInfo[playerid][pTeam] = 1;
	PlayerInfo[playerid][pModel] = 264;
	new randphone = 1000 + random(8999);//minimum 1000  max 9999 //giving one at the start
	PlayerInfo[playerid][pPnumber] = randphone;
	PlayerInfo[playerid][pPhousekey] = 255;
	PlayerInfo[playerid][pPbiskey] = 255;
	ClearCrime(playerid);
	printf("Player Connecting as (%d)", playerid);
	SetPlayerColor(playerid,COLOR_GRAD2);
	new bitch[256];
    GetPlayerName(playerid,bitch,sizeof(bitch));
    format(bitch,sizeof(bitch),"*** %s joined the server",bitch);
	SendClientMessageToAll(COLOR_GRAD1,bitch);
	new plname[MAX_PLAYER_NAME];
	new plstring[MAX_PLAYER_NAME];
    GetPlayerName(playerid, plname, sizeof(plname));
	format(plstring, sizeof(plstring), "%s.cer", plname);
	if(fexist(plstring))
	{
		gPlayerAccount[playerid] = 1;
		ShowPlayerDialog(playerid, 9, DIALOG_STYLE_PASSWORD, "{076F13}Login your account", "{F0FF00}Welcome back,\n{FFFFFF}put your password here\nfor login in Public Enemy: Los Santos server.", "Login", "");
	    return 1;
	}
	else
	{
		gPlayerAccount[playerid] = 0;
		ShowPlayerDialog(playerid, 10, DIALOG_STYLE_PASSWORD, "{076F13}Create an account", "{F0FF00}Welcome,\n{FFFFFF}choose your password\nfor register in Public Enemy: Los Santos server.", "Create", "");
  //return 1;
	}
	return 1;
}

public ClearCrime(playerid)
{
if (gdebug >= 1){printf("DEBUG ClearCrime(%d)", playerid);}
	new string[MAX_PLAYER_NAME];
	format(string, sizeof(string), "********");
	strmid(PlayerCrime[playerid][pBplayer], string, 0, strlen(string), 255);
	strmid(PlayerCrime[playerid][pVictim], string, 0, strlen(string), 255);
	strmid(PlayerCrime[playerid][pAccusing], string, 0, strlen(string), 255);
	strmid(PlayerCrime[playerid][pAccusedof], string, 0, strlen(string), 255);
	return 1;
}

public BetWinner(playerid,contest)
{
	new winname[MAX_PLAYER_NAME];
	new better[MAX_PLAYER_NAME];
	new string[256];
	GetPlayerName(playerid, winname, sizeof(winname));
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(contest == 1)
			{
				if(BetRace[i][0] == playerid)
				{
					GivePlayerMoney(i,BetRace[i][1]*2);
					BizzInfo[5][bTakings] -= (BetRace[i][1]*2);
					format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
					SendClientMessage(i, TEAM_VAGOS_COLOR,string);
					format(string, sizeof(string), "   You have won $%d on %s in a streetrace", BetRace[i][1]*2, winname);
					SendClientMessage(i, COLOR_WHITE, string);
					SendClientMessage(i, TEAM_VAGOS_COLOR,"_______________________________________");
					PlayerPlaySound(i, 1052, 0.0, 0.0, 0.0);
					GetPlayerName(i, better, sizeof(better));
					format(string, sizeof(string), "%s won $%d on %s", better, BetRace[i][1]*2, winname);
					printf("%s", string);
					PayLog(string);
				}
				BetRace[i][0] = 255;
				BetRace[i][1] = 0;
			}
			if(contest == 2)
			{
				if(BetDm[i][0] == playerid)
				{
					GivePlayerMoney(i,BetDm[i][1]*2);
					BizzInfo[5][bTakings] -= (BetDm[i][1]*2);
					format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
					SendClientMessage(i, TEAM_VAGOS_COLOR,string);
					format(string, sizeof(string), "   You have won $%d on %s in a deathmatch", BetDm[i][1]*2, winname);
					SendClientMessage(i, COLOR_WHITE, string);
					SendClientMessage(i, TEAM_VAGOS_COLOR,"_______________________________________");
					PlayerPlaySound(i, 1052, 0.0, 0.0, 0.0);
					GetPlayerName(i, better, sizeof(better));
					format(string, sizeof(string), "%s won $%d on %s", better, BetDm[i][1]*2, winname);
					printf("%s", string);
					PayLog(string);
				}
				BetDm[i][0] = 255;
				BetDm[i][1] = 0;
			}
		}
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------
public OnPlayerDisconnect(playerid,reason)
{
    if(InvitedDuel[playerid] == true)
    {
        for(new killerid; killerid < MAX_PLAYERS; killerid++) if(IsPlayerConnected(killerid) && InvitedDuel[killerid] == true)
        {
	        InvitedDuel[killerid] = false;
	        InvitedDuel[playerid] = false;
	        IdDuel[playerid] = playerid;
	        IdDuel[killerid] = killerid;
	        UsingArena = false;
	        SpawnPlayer(killerid);
        }
    }
//if (gdebug >= 1){printf("DEBUG OnPlayerDisconnect(%d)", playerid);}
	PlayerInLounge[playerid]=0;
    pInArena1[playerid]=0;
	pInArena2[playerid]=0;
	pInArena3[playerid]=0;
	pInArena4[playerid]=0;
	pInArena5[playerid]=0;
	printf("DEBUG OnPlayerDisconnect(%d)1", playerid);
	new bitch[256];
	GetPlayerName(playerid,bitch,sizeof(bitch));
	format(bitch,sizeof(bitch),"*** %s left the server",bitch);
    SendClientMessageToAll(COLOR_GRAD1,bitch);
	gActivePlayers[playerid]--;
	numplayers--;
	if (DmHiPlayer == playerid)
	{
		DmHiPlayer = INVALID_PLAYER_ID;
		new tmp1;
		new tmp2;
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(DmScore[i] > tmp1 && IsPlayerConnected(i) == 1)
			{
				DmScore[i] = tmp1;
				i = tmp2;
			}
		}
		if(DmHiPlayer != 255)
		{
			DmHiPlayer = tmp2;
			new dmname[MAX_PLAYER_NAME];
			new string[256];
			GetPlayerName(DmHiPlayer, dmname, sizeof(dmname));
			DmHiScore = DmScore[DmHiPlayer];
			format(string, sizeof(string), "DMNEWS: %s Is now in the lead with %d ", dmname,DmHiScore);
			BroadCast(COLOR_WHITE, string);
		}
	}
	if (gPublicEnemy == playerid)
	{
		gPublicEnemy = INVALID_PLAYER_ID;
		GivePlayerMoney(playerid, -reward);
		KillTimer(offhook);

	}
	OnUpdatePlayer(playerid);
	printf("DEBUG OnPlayerDisconnect(%d)2", playerid);
	printf("DEBUG OnPlayerDisconnect(%d)3", playerid);
	if(HireCar[playerid] != 299)
	{
		gLastDriver[HireCar[playerid]] = 300;
		gCarLock[HireCar[playerid]] = 0;
		UnLockCar(HireCar[playerid]);
	}
	if (gLastCar[playerid] > 0)
	{
		gLastDriver[gLastCar[playerid]] = 300;
		if(PlayerInfo[playerid][pPhousekey] != gLastCar[playerid]-1)
		{
			gCarLock[gLastCar[playerid]] = 0;
			UnLockCar(gLastCar[playerid]);
		}
	}
	printf("DEBUG OnPlayerDisconnect(%d)4", playerid);
	if (gPlayerCheckpointStatus[playerid] == CHECKPOINT_DROPOFF)
	{
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		MissionActive = 0;
		if (gdebug){print("DEBUG MissionActive = 0;");}
	}
	if (gSuperCop == playerid)
	{
		gSuperCop = INVALID_PLAYER_ID;
	}
}

public SetPlayerRandomSpawn(playerid)
{
	new rand;
	new playername[32];
	new house = PlayerInfo[playerid][pPhousekey];
	GetPlayerName(playerid, playername, sizeof(playername));
	

if (pInArena1[playerid] == 1)
{
	       ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 24, 9999);
           GivePlayerWeapon(playerid, 25, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, 1411.2220, -2.8143, 1000.9237);
           SetPlayerInterior(playerid, 1);
           pInArena1[playerid]=1;
    return 1;
}
if (pInArena2[playerid] == 1)
{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 34, 9999);
           GivePlayerWeapon(playerid, 25, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, 281.7788, 179.6681, 1007.1719);
           SetPlayerInterior(playerid, 3);
           pInArena2[playerid]=1;
    return 1;
}
if (pInArena3[playerid] == 1)
{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 27, 9999);
           GivePlayerWeapon(playerid, 33, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, -1401.3137, 107.1078, 1032.2734);
           SetPlayerInterior(playerid, 1);
           pInArena3[playerid]=1;
    return 1;
}
if (pInArena4[playerid] == 1)
{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 31, 9999);
           GivePlayerWeapon(playerid, 25, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, -1129.8909, 1057.5424, 1346.4141);
           SetPlayerInterior(playerid, 10);
           pInArena4[playerid]=1;
    return 1;
}
if (pInArena5[playerid] == 1)
{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 24, 9999);
           GivePlayerWeapon(playerid, 30, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, 486.4857,-3.1394,1002.3828);
           SetPlayerInterior(playerid, 17);
           pInArena5[playerid]=1;
    return 1;
}
	if(gPlayerFighter[playerid] == 1)
    {
		new string[256];
		gTeam[playerid] = 4;
		SetPlayerToTeamColor(playerid);
		rand = random(sizeof(gRandomDMSpawns)-2)+1;
		SetPlayerPos(playerid, gRandomDMSpawns[rand][0], gRandomDMSpawns[rand][1], gRandomDMSpawns[rand][2]); // Warp the player
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerInterior(playerid,0);
		PlayerInfo[playerid][pInt] = 0;
		format(string, sizeof(string), "  ~r~%d~w~|~g~%d",DmScore[playerid],DmHiScore);
		GameTextForPlayer(playerid, string, 5000, 6);
		if(gFightLeader < 1000)
		{
			TogglePlayerControllable(playerid, 0);
		}
		if (gdebug >=0){printf("DEBUG SPAWNED: Playerid:%d Team:%d DMPoint:%d", playerid, gTeam[playerid], rand);}
		return 1;
	}
	if(house !=255)
	{
		/*
		if(gTeam[playerid] <= 2 && strcmp(playername, HouseInfo[house][hOwner], true) == 0 || gTeam[playerid] > 2)
		{
			*/
			SetPlayerToTeamColor(playerid);
			SetPlayerInterior(playerid,HouseInfo[house][hInt]);
			SetPlayerPos(playerid, HouseInfo[house][hExitx], HouseInfo[house][hExity],HouseInfo[house][hExitz]); // Warp the player
			PlayerInfo[playerid][pLocal] = house;
			PlayerInfo[playerid][pInt] = HouseInfo[house][hInt];
			if (gdebug >=1){printf("DEBUG SPAWNED: Playerid:%d Team:%d SpawnPoint:%d", playerid, gTeam[playerid], rand);}
			return 1;
		//}

	}
	if ((gTeam[playerid]) == 2)
	{
		SetPlayerToTeamColor(playerid);
		rand = random(sizeof(gCopPlayerSpawns));
		SetPlayerPos(playerid, gCopPlayerSpawns[rand][0], gCopPlayerSpawns[rand][1], gCopPlayerSpawns[rand][2]); // Warp the player
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerInterior(playerid,0);
		PlayerInfo[playerid][pInt] = 0;
		if (gdebug >=1){printf("DEBUG SPAWNED: Playerid:%d Team:%d SpawnPoint:%d", playerid, gTeam[playerid], rand);}
		return 1;
    }
    if ((gTeam[playerid]) == 1)
    {
		SetPlayerToTeamColor(playerid);
		rand = random(sizeof(gMedPlayerSpawns));
		SetPlayerPos(playerid, gMedPlayerSpawns[rand][0], gMedPlayerSpawns[rand][1], gMedPlayerSpawns[rand][2]); // Warp the player
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerInterior(playerid,0);
		PlayerInfo[playerid][pInt] = 0;
		if (gdebug >=1){printf("DEBUG SPAWNED: Playerid:%d Team:%d SpawnPoint:%d", playerid, gTeam[playerid], rand);}
		return 1;
	}
    else
    {
		SetPlayerToTeamColor(playerid);
		rand = random(sizeof(gRandomPlayerSpawns));
		SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerInterior(playerid,0);
		PlayerInfo[playerid][pInt] = 0;
		if (gdebug >=1){printf("DEBUG SPAWNED: Playerid:%d Team:%d SpawnPoint:%d", playerid, gTeam[playerid], rand);}
		//return 1;
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerDeath(playerid, killerid, reason)
{
	if (gdebug >=0){printf("OnPlayerDeath Playerid:%d killerid:%d reason:%d", playerid, killerid, reason);}

	new name[MAX_PLAYER_NAME];
	new string[256];
	new deathreason[20];
	new playercash;
	new victimteam;
	new Float:px,Float:py,Float:pz;
	DropPlayerWeapons(playerid);
	new Float:killerHP;
	GetPlayerHealth(killerid, killerHP);
	SetPlayerHealth(killerid, killerHP+20);
	//new killerteam;
	victimteam = (gTeam[playerid]);
	//killerteam = (gTeam[killerid]);
	gPlayerSpawned[playerid] = 0;
	GetPlayerName(playerid, name, sizeof(name));
	PlayerInfo[playerid][pLocal] = 255;
	GetPlayerPos(playerid, px, py, pz);
    SendDeathMessage(killerid,playerid,reason);
	if(killerid != 255)
	{
		if(GetPlayerState(killerid) == 2 && playerid != gPublicEnemy)
		{
			SendClientMessage(killerid, COLOR_YELLOW, "DriveBy Kill, Gets You Fuck all, Dont Abuse it, On foot gets you $$$");
			return 1;
		}
	}
/*	if(reason == 38)
	{
		new kstring[128];
		new kickname[MAX_PLAYER_NAME];
		GetPlayerName(playerid, kickname, sizeof(kickname));
		format(kstring, sizeof(kstring), "AdminSweep: Player [%d]%s Has Been Banned, Cheat Detected",playerid,kickname);
		printf("%s", kstring);
		SendClientMessageToAll(COLOR_RED, kstring);
		Ban(playerid);
	}  */
	if(gPlayerFighter[playerid] == 1)
	{
		DmScore[playerid]--;
		if(killerid != INVALID_PLAYER_ID)
		{
			DmScore[killerid]++;
			if(DmScore[killerid] > DmHiScore)
			{
				new dmname[MAX_PLAYER_NAME];
				GetPlayerName(killerid, dmname, sizeof(dmname));
				DmHiPlayer = killerid;
				DmHiScore = DmScore[killerid];
				format(string, sizeof(string), "DMNEWS: %s Is now in the lead with %d ", dmname,DmHiScore);
				BroadCast(COLOR_WHITE, string);
				format(string, sizeof(string), "  ~g~%d~w~|~g~%d",DmScore[killerid],DmHiScore);
			}
			else
			{
				format(string, sizeof(string), "  ~r~%d~w~|~g~%d",DmScore[killerid],DmHiScore);
			}
			GameTextForPlayer(killerid, string, 5000, 6);
		}
	}
	GetWeaponName(reason, deathreason, 20);
	if (strlen(deathreason) == 0)
	{
		format(deathreason, sizeof(deathreason), "Fists");
	}
	if (reason == 41)
	{
		format(deathreason, sizeof(deathreason), "Pepper Spray");
	}
	if (gPlayerCheckpointStatus[playerid] == CHECKPOINT_DROPOFF)
	{
		if (gdebug){print("DEBUG test6");}
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		new check;
		check = gPlayerCheckpointStatus[playerid];
		if (gdebug){printf("DEBUG check %d" ,check);}
		OnPlayerDropCashBox(playerid);
	}
	if (gPlayerCheckpointStatus[playerid] > 4 && gPlayerCheckpointStatus[playerid] < 11)
	{
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		LapCount[playerid] = 0;
	}
	/*
	if((PlayerInfo[playerid][pPhousekey]+1 != gLastCar[playerid] && gLastCar[playerid] != 0) || HireCar[playerid] != gLastCar[playerid] && gLastCar[playerid] != 0)
	{
		printf("DEBUG PlayerInfo[playerid][pPhousekey](%d) gLastCar[playerid]-1(%d) HireCar[playerid](%d)", PlayerInfo[playerid][pPhousekey],gLastCar[playerid]-1,HireCar[playerid]);
		UnLockCar(gLastCar[playerid]);
		gCarLock[gLastCar[playerid]] = 0;
		gLastDriver[gLastCar[playerid]] = 300;
		gLastCar[playerid] = 0;
	}
	*/
	new caller = Mobile[playerid];
	if(caller != 255)
	{
		if(caller < 255)
		{
			SendClientMessage(caller,  COLOR_GRAD2, "   The line just went dead....");
			CellTime[caller] = 0;
			CellTime[playerid] = 0;
			Mobile[caller] = 255;
		}
		Mobile[playerid] = 255;
		CellTime[playerid] = 0;
	}
	ClearCrime(playerid);
	if (killerid == INVALID_PLAYER_ID)
	{
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && gTeam[i] != gTeam[playerid] && CrimInRange(20.0, playerid,i) && GetPlayerState(i) != 2)
			{
				killerid = i;
				format(deathreason, sizeof(deathreason), "Intimidation");
			}
		}
	}
	if (killerid == INVALID_PLAYER_ID)
	{
		if ((gTeam[playerid]) == 0){return 1;}
		new slice = ((PlayerInfo[playerid][pLevel]*deathcost)+(basedcost)); //1k +your level
		GivePlayerMoney(playerid, -slice);
		format(string, sizeof(string), "DOC: Your Medical Bill Comes To $%d, Have A Nice Day.", slice);
		SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
		switch (reason)
		{
			case WEAPON_DROWN:
			{
				format(string, sizeof(string), ".: %s drowned :.", name);
				BroadCast(COLOR_RED, string);
			if (gPublicEnemy == playerid)
	{
		gPublicEnemy = INVALID_PLAYER_ID;
		GivePlayerMoney(playerid, -reward);
		KillTimer(offhook);
  
	}
			}
			case WEAPON_COLLISION:
			{
				format(string, sizeof(string), ".: %s cratered :.", name);
				BroadCast(COLOR_RED, string);
			if (gPublicEnemy == playerid)
	{
		gPublicEnemy = INVALID_PLAYER_ID;
		GivePlayerMoney(playerid, -reward);
		KillTimer(offhook);
  
	}
			}
			default:
			{
			if (gPublicEnemy == playerid)
	{
		gPublicEnemy = INVALID_PLAYER_ID;
		GivePlayerMoney(playerid, -reward);
		KillTimer(offhook);
  
	}
				/*
				if (strlen(deathreason) > 0)
				{
					format(string, sizeof(string), ".: %s died. (%s) :.", name, deathreason);
				}*/
			//	else
			//	{
					format(string, sizeof(string), ".: %s died :.", name);
			//	}

				BroadCast(COLOR_RED, string);
			}
		}
		if (gTeam[playerid] == 4)
		{
			gTeam[playerid] = PlayerInfo[playerid][pTeam];
		}
		if (gPublicEnemy == playerid)
		{
			if(killerid == 255)
			{
				gPublicEnemy = INVALID_PLAYER_ID;
				GivePlayerMoney(playerid, -preward);
				format(string, sizeof(string), "SMS: %s, The Ambulance Driver Took Your Last Payment $%d, Sender: MOLE (555)",name,preward);
				RingTone[playerid] = 20;
				SendClientMessage(playerid, COLOR_YELLOW, string);
				KillTimer(offhook);
    
				new tmpmed;
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) == 1 && gTeam[i] == TEAM_CYAN)
					{
						tmpmed++;
					}
				}
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) == 1 && gTeam[i] == TEAM_CYAN)
					{
						GivePlayerMoney(i, preward/tmpmed);
					}
				}
			}
		}
		return 1;
	}
	if (Contract[playerid] > 0)
	{
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		GivePlayerMoney(killerid, Contract[playerid]);
		format(string,128,"<< %s has fulfilled the contract on %s and collected $%d >>",killer,name,Contract[playerid]);
		BroadCast(COLOR_YELLOW, string);
		PayLog(string);
		Contract[playerid] = 0;
	}
	if (victimteam >= 4)
	{
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		new slice = ((PlayerInfo[playerid][pLevel]*deathcost)+(basedcost)); //1k +your level
		playercash = GetPlayerMoney(playerid);
		if(SafeTime[playerid] <= 0 || gPlayerFighter[playerid] == 1)
		{
			if(gTeam[killerid] != gTeam[playerid])
			{
				if(GetPlayerState(killerid) == 1)
				{
					PlayerInfo[killerid][pKills] = PlayerInfo[killerid][pKills]+2;
				}
				else
				{
					PlayerInfo[killerid][pKills]++;
				}
				PlayerInfo[playerid][pKills]--;
				if(PlayerInfo[killerid][pKills] >= 30)
				{
					PlayerInfo[killerid][pExp]++;
					PlayerInfo[killerid][pKills] = 0;
					SendClientMessage(killerid, COLOR_YELLOW, "You are getting stronger Exp +1");
				}
			}
		}
		if (strlen(deathreason) > 0)// patch
		{
			if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill) || gTeam[killerid] == gTeam[playerid])//med kill criminal
			{
				format(string, sizeof(string), ".: %s murdered %s. (%s) :.", killer, name, deathreason);
			}
			else
			{
				format(string, sizeof(string), ".: %s murdered %s. (%s) for $%d :.", killer, name, deathreason, slice);
			}
			if (gdebug){print("DEBUG Deathtest3");}

		}
		else
		{
			if (gdebug){print("DEBUG Deathtest4");}
			if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill || gTeam[killerid] == gTeam[playerid]))
			{
				format(string, sizeof(string), ".: %s murdered %s :.", killer, name);
			}
			else
			{
				format(string, sizeof(string), ".: %s murdered %s for $%d :.", killer, name, slice);
			}
		}
		if ((gTeam[killerid]) == 2)//cops kill criminal
		{
			format(string, sizeof(string), ".: %s was arrested by Officer %s (%s) and fined $%d :.", name, killer, deathreason, slice);
			if(IsACopCar(gLastCar[killerid]))
			{
				GivePlayerMoney(killerid, 2000);
				SendClientMessage(killerid, TEAM_BLUE_COLOR, "Vehicle Bonus $2000");
			}
		}
		if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill) || (gTeam[killerid] == gTeam[playerid] && gTeam[playerid] != 4))
		{
			slice = 0;
		}
		if (((gTeam[killerid]) != 4) && ((gTeam[killerid]) == gTeam[playerid]))//no team kill
		{
			slice = 0;
		}
		if (playercash > 0)
		{
			if (gdebug){print("DEBUG Deathtest1");}
			GivePlayerMoney(playerid, -slice);
		}
		else
		{
			if (gdebug){print("DEBUG Deathtest2");}
			slice = slice+500;
		}
		GivePlayerMoney(killerid, slice);
		PlayerPlaySound(killerid, 1083, 0.0, 0.0, 0.0);
		if (((gTeam[killerid]) == 3) && reason != 49)
		{
			SetPlayerCriminal(killerid,255, "First Degree Murder",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		else if (((gTeam[killerid]) == 3) && reason == 49)
		{
			SetPlayerCriminal(killerid,255, "Hit And Run",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		if (gPublicEnemy == playerid)
		{
			//SendClientMessage(killerid, TEAM_BLUE_COLOR, "HQ: You Have Arrested Public Enemy No.1, $5000 Bonus PayCheck");
			GivePlayerMoney(killerid, preward);
			GivePlayerMoney(playerid, -preward);
			KillTimer(offhook);
   
			format(string, sizeof(string), "SMS: %s, %s Stole Your Last Payment $%d, Sender: MOLE (555)", name, killer,preward);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			RingTone[playerid] = 20;
			format(string, sizeof(string), ".:Public Enemy No.1 %s was killed by %s (%s) and lost $%d :.", name, killer,  deathreason, slice);
			PlayerInfo[killerid][pPEN]++;
			if(PlayerInfo[killerid][pPEN] >= 4)
			{
				PlayerInfo[killerid][pExp]++;
				PlayerInfo[killerid][pPEN] = 0;
				SendClientMessage(killerid, COLOR_YELLOW, "You are getting stronger Exp +1");
			}
			PlayerPlayMusic(killerid);
		}
		BroadCast(COLOR_RED, string);
		if (gPublicEnemy != playerid)
		{
			if(gPlayerFighter[killerid] != 1)
			{
				format(string, sizeof(string), "~g~$%d", slice);
				GameTextForPlayer(killerid, string, 5000, 1);
			}
		}
		else
		{
			format(string, sizeof(string), "~p~P.E.No.1 ~w~Killed~n~You Take The ~g~$%d", preward);
			GameTextForPlayer(killerid, string, 5000, 1);
			gPublicEnemy = INVALID_PLAYER_ID;
		}
	}
	else if (victimteam == 2)
	{
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		// Cop kill
		if (gdebug){print("DEBUG test5");}
		PlayerInfo[playerid][pKills]--;
		if (gTeam[killerid] == 2)//cops kill cop
		{
			format(string,128,".: Officer %s murdered Officer %s (%s) and was sued for $%d :.",killer,name,deathreason,suecost);
			PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
			GivePlayerMoney(killerid, -suecost);
			GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
		}
		else
		{
			format(string,128,".: %s murdered Officer %s (%s) :.",killer,name,deathreason);
	    }
		if (gTeam[killerid] == 3)
		{
			if(reason != 49)
			{
				SetPlayerCriminal(killerid,255, "First Degree Murder",0,0);
			}
			else if (reason == 49)
			{
				SetPlayerCriminal(killerid,255, "Hit And Run",0,0);
			}
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		if(gTeam[killerid] >= 5 && SafeTime[playerid] <= 0)
		{
			if(GetPlayerState(killerid) == 1)
			{
				PlayerInfo[killerid][pKills] = PlayerInfo[killerid][pKills]+2;
			}
			else
			{
				PlayerInfo[killerid][pKills]++;
			}
			if(PlayerInfo[killerid][pKills] >= 30)
			{
				PlayerInfo[killerid][pExp]++;
				PlayerInfo[killerid][pKills] = 0;
				SendClientMessage(killerid, COLOR_YELLOW, "You are getting stronger Exp +1");
			}
		}
		BroadCast(COLOR_RED, string);
	}
	else if (victimteam == 3)
	{
		if (gdebug){print("DEBUG test6");}
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		// Civ kill
		if ((gTeam[killerid]) == 2)//cops kill civ
		{
			format(string,128,".: Officer %s murdered %s (%s) and was sued for $%d :.",killer,name,deathreason,suecost);
			PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
			GivePlayerMoney(killerid, -suecost);
			GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
		}
		else
		{
			format(string,128,".: %s murdered %s (%s) :.",killer,name,deathreason);
	    }
		if (((gTeam[killerid]) == 3 || (gTeam[killerid]) == 1) && reason != 49)
		{
			SetPlayerCriminal(killerid,255, "First Degree Murder",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		else if (((gTeam[killerid]) == 3 || (gTeam[killerid]) == 1) && reason == 49)
		{
			SetPlayerCriminal(killerid,255, "Hit And Run",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
	    BroadCast(COLOR_RED, string);
	}
	else if (victimteam == 1)
	{
		if (gdebug){print("DEBUG test6");}
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		// Civ kill
		if ((gTeam[killerid]) == 2)//cops kill civ
		{
			format(string,128,".: Officer %s murdered Paramedic %s (%s) and was sued for $%d :.",killer,name,deathreason,suecost);
			PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
			GivePlayerMoney(killerid, -suecost);
			GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
		}
		else if ((gTeam[killerid]) == 1)//med kill civ
		{
			format(string,128,".: Paramedic %s murdered %s (%s) and was sued for $%d :.",killer,name,deathreason,suecost);
			PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
			GivePlayerMoney(killerid, -suecost);
			GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
		}
		else
		{
			format(string,128,".: %s murdered %s (%s) :.",killer,name,deathreason);
	    }
		if (((gTeam[killerid]) == 4) && reason != 49)
		{
			SetPlayerCriminal(killerid,255, "First Degree Murder",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		else if (((gTeam[killerid]) == 3) && reason == 49)
		{
			SetPlayerCriminal(killerid,255, "Hit And Run",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
	    BroadCast(COLOR_RED, string);
	}
	if (gSuperCop == playerid)
	{
		gSuperCop = INVALID_PLAYER_ID;
	}
	if(GetPlayerState(killerid) == 1)
	{
		lastkiller = killerid;
	}
	killerid = INVALID_PLAYER_ID;
	SetPlayerColor(playerid,COLOR_GRAD2);
	if(InvitedDuel[killerid] == true)
    {
    InvitedDuel[killerid] = false;
    InvitedDuel[playerid] = false;
    IdDuel[playerid] = playerid;
    IdDuel[killerid] = killerid;
    UsingArena = false;
    SpawnPlayer(killerid);
    SpawnPlayer(playerid);
    }
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if (gdebug >=1){printf("OnPlayerSpawn Playerid:%d", playerid);}
	if (teamcarlock)
	{
		TeamLockDoors(playerid);
	}
	InitLockDoors(playerid);
	if(accountplay)
	{
		if (gdebug >=1){printf("accountplay");}
		/*if (gPlayerAccount[playerid] == 0)
		{
			gTeam[playerid] = 0;
			SetPlayerRandomSpawn(playerid);
			PlayJailSound(1153 , 1154, 2000,264.395200, 77.564040, 1001.039000);
			gPlayerSpawned[playerid] = 1;
            //ShowPlayerDialog(playerid, 10, DIALOG_STYLE_PASSWORD, "{076F13}Create an Account", "{F0FF00}Welcome,\n{FFFFFF}choose your password\nfor register in Public Enemy: Los Santos server.", "Create", "");
			return 1;
		}
		if (gPlayerLogged[playerid] == 0)
		{
			gTeam[playerid] = 0;
			SetPlayerRandomSpawn(playerid);
			PlayJailSound(1153 , 1154, 2000,264.395200, 77.564040, 1001.039000);
			gPlayerSpawned[playerid] = 1;
			//ShowPlayerDialog(playerid, 9, DIALOG_STYLE_PASSWORD, "{076F13}Login you'r account", "{F0FF00}Welcome back,\n{FFFFFF}put your password here\nfor login in Public Enemy: Los Santos server.", "Login", "");
    		return 1;
		}*/
	}
	if (gPlayerSpawned[playerid] == 1)
	{
			gTeam[playerid] = PlayerInfo[playerid][pTeam];
		if (gTeam[playerid] == 2 && forceteam && CopCheck(playerid))
		{
			gTeam[playerid] = 3;
			PlayerInfo[playerid][pTeam] = 3;
			SetPlayerRandomSpawn(playerid);
			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Your are not allowed to be a cop.");
		}
		/*
		if(gTeam[playerid] == 2 && PlayerInfo[playerid][pLevel] < 3)
		{
			gTeam[playerid] = 3;
			PlayerInfo[playerid][pTeam] = 3;
			SetPlayerRandomSpawn(playerid);
			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: You must be level 3 to join the cops.");
		}
		*/
		if (gTeam[playerid] == 1 && forceteam && MedCheck(playerid))
		{
			gTeam[playerid] = 3;
			PlayerInfo[playerid][pTeam] = 3;
			SetPlayerRandomSpawn(playerid);
			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Your are not allowed to be a paramedic.");
		}
		if (gTeam[playerid] == 4) //medic / criminal reset team
		{
			gTeam[playerid] = PlayerInfo[playerid][pTeam];
		}
		/*
		if (FirstSpawn[playerid] == 0)
		{
			SetPlayerToTeamColor(playerid);
			SetPlayerInterior(playerid,PlayerInfo[playerid][pInt]);
			printf("PlayerInfo[playerid][pInt]= %d",PlayerInfo[playerid][pInt]);
			SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
			gPlayerSpawned[playerid] = 1;
			FirstSpawn[playerid] = 1;
			print("insidespawn or firstsawpn");
			return 1;
		}
		*/
        SetPlayerRandomSpawn(playerid);
		if (gdebug){printf("DEBUG id = %d gTeam = %d",playerid,gTeam[playerid]);}
		//SetPlayerPos(playerid, 1360.0217,2565.6328,10.8265);///badspawn
		//SetPlayerWorldBounds(playerid,3500.00,66.67,-653.33,-2806.67);
		switch (MissionActive)
		{
			case 1://Cashbox not picked up
			{
				if ((gTeam[playerid]) == 1)
				{
					SendClientMessage(playerid, COLOR_YELLOW, objstore);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_PICKUP;
				}
				else if (gTeam[playerid] == 2)
				{
					SendClientMessage(playerid, TEAM_BLUE_COLOR, cbjstore);
				}
				SetPlayerCheckpoint(playerid,cwx, cwy, cwz, 1.0);
			}
			case 2://Cashbox picked up firsttime
			{
				if ((gTeam[playerid]) == 1)
				{
					SendClientMessage(playerid, COLOR_YELLOW, objstore);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				}
				else if (gTeam[playerid] == 2)
				{
					SendClientMessage(playerid, TEAM_BLUE_COLOR, cbjstore);
				}
				SetPlayerCheckpoint(playerid,cwx, cwy, cwz, 1.0);
			}
			case 3://Cashbox was dropped
			{

				SetPlayerCheckpoint(playerid,cwx,cwy,cwz, 1.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_PICKUP;
				return 1;
			}
			case 5://racewait
			{
				if (gdebug){print("DEBUG Checkp5");}
				if ((gTeam[playerid]) == 1)
				{
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SR1START;
				}
					SetPlayerCheckpoint(playerid,cwx,cwy,cwz, 8.0);
				return 1;
			}
			case 6://racewait
			{
				if (gdebug){print("DEBUG Checkp5");}
				if ((gTeam[playerid]) == 1 || (gTeam[playerid]) == 3)
				{
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
				}
					SetPlayerCheckpoint(playerid,cwx,cwy,cwz, 8.0);
				return 1;
			}
			case 7://progress
			{
				if (gdebug){print("DEBUG Checkp5");}
				if ((gTeam[playerid]) == 1)
				{
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					SetPlayerCheckpoint(playerid,cwx,cwy,cwz, 8.0);
				}
				if ((gTeam[playerid]) == 2 )
				{
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SR1START;
					SetPlayerCheckpoint(playerid,scx,scy,scz, 8.0);
				}
				return 1;
			}
			case 9://Car is waiting first occupent
			{
				if (gTeam[playerid] == 1)
				{
					SendClientMessage(playerid, COLOR_YELLOW, objstore);
					SetVehicleParamsForPlayer(stealcar,playerid,1,0);
					SetPlayerCheckpoint(playerid,scx, scy, scz,5.0 );
				}
				else if (gTeam[playerid] == 2)
				{
				    SendClientMessage(playerid, TEAM_BLUE_COLOR, cbjstore);
				    SetVehicleParamsForPlayer(stealcar,playerid,1,1);
					SetPlayerCheckpoint(playerid,scx, scy, scz,5.0 );
				}
			}
			case 10://Car has been takin by Criminal
			{
				if (gTeam[playerid] == 1)
				{
					SendClientMessage(playerid, COLOR_YELLOW, objstore);
				}
				else if (gTeam[playerid] == 2)
				{
					SendClientMessage(playerid, TEAM_BLUE_COLOR, cbjstore);
				}
				SetPlayerCheckpoint(playerid, cwx, cwy, cwz, 16.0);
				SetVehicleParamsForPlayer(stealcar,playerid,1,0);
			}
			case 101://Car is empty but was takin
			{
				SetVehicleParamsForPlayer(stealcar,playerid,1,0);
			}
			default:
			{

			}
		}

	}
	TextDrawShowForPlayer(playerid,PE);
	TextDrawShowForPlayer(playerid,LS);
	TextDrawShowForPlayer(playerid,Mode);
	TextDrawShowForPlayer(playerid,Version);
	TextDrawShowForPlayer(playerid,Site);
	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	return 1;
}
//---------------------------------------CHECKPOINT----------------------------------------------------
public PayLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("Gamemode/pay.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public CmdLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("Gamemode/cmd.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public PrePlayerNewMission()
{
if (gdebug >=1){printf("PrePlayerNewMission");}
CheckpointReset();
RaceCheckpointReset();
	if (MissionActive == 12)
	{
		gFighters=0;
		gFightLeader=0;
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				DmScore[i] = 0;
				if(gPlayerFighter[i] == 1)
				{
					gPlayerFighter[i] = 0;
					TogglePlayerControllable(i, 1);
					SetPlayerRandomSpawn(i);
				}
			}
		}
	}
    if (MissionActive > 8 && MissionActive < 12)
	{
		if(MissionActive != 0)
		{
			printf("DEBUG: Bad Hotwire: stealcar = %d, stealcardest = %d",stealcar,stealcardest);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(stealcar != -1)
					{
					    SetVehicleParamsForPlayer(stealcar,i,0,0);
						SetVehicleToRespawn(stealcar);
						stealcar = -1;
					}
				}
			}
		}
	}
	if (MissionActive > 4 && MissionActive <= 7 )
	{
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				LapCount[i] = 0;
				StartTime[i] = 0;
			}
		}
		gRaceFin = 0;
		gRaceMid = 0;
		gRaceMid2 = 0;
		gRaceEnd = 0;
		gLaps = 0;
		BroadCast(COLOR_WHITE, "RACENEWS: ::: Race Over :::");
	}
	if (cashbox == 0 && hotwire == 0 && streetrace == 0 && deathmatch == 0)
	{
		MissionActive = 255;
		if (gdebug){print("DEBUG MissionActive = 255");}
		return 1;
	}
	if (cashbox == 0 && hotwire == 0 && streetrace == 1 && deathmatch == 0)
	{
		MissionActive = 4;
		if (gdebug){print("DEBUG MissionActive = 4");}
		SetPlayerNewMission();
		return 1;
	}
	if (cashbox == 0 && hotwire == 0 && streetrace == 0 && deathmatch == 1)
	{
		MissionActive = 12;
		if (gdebug){print("DEBUG MissionActive = 12");}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive == 0)
	{
		if (cashbox == 0)
		{
			MissionActive = 4;
			if (gdebug){print("DEBUG MissionActive = 4");}
		}
		else
		{
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
		}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive > 0 && MissionActive <= 4)
	{
		if (streetrace == 0)
		{
			MissionActive = 8;
			if (gdebug){print("DEBUG MissionActive = 8");}
		}
		else
		{
			MissionActive = 4;
			if (gdebug){print("DEBUG MissionActive = 4");}
		}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive > 4 && MissionActive <= 8 )
	{
		if (hotwire == 0)
		{
			MissionActive = 12;
			if (gdebug){print("DEBUG MissionActive = 12");}
		}
		else
		{
			MissionActive = 8;
			if (gdebug){print("DEBUG MissionActive = 8");}
		}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive > 8 && MissionActive <= 12)
	{
		if (deathmatch == 0)
		{
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
		}
		else
		{
			MissionActive = 12;
			if (gdebug){print("DEBUG MissionActive = 12");}
		}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive == 13)
	{
		if (cashbox == 0)
		{
			MissionActive = 4;
			if (gdebug){print("DEBUG MissionActive = 4");}
		}
		else
		{
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
		}
		SetPlayerNewMission();
		return 1;
	}
	return 1;
}

public SetPlayerNewMission()
{
if (gdebug >=1){printf("SetPlayerNewMission");}
	switch (MissionActive)
	{
		case 0:
		{
			new rando = random(5);
			if (rando == 1)
			{
				cwx = 997.7;
				cwy = -921.1;
				cwz = 42.1;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At North Side Gas Station, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-14 North Side Gas Station.");
			}
			else if(rando == 2)
			{
				cwx = 2421.5;
				cwy = -1221.7;
				cwz = 25.3;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At The Pig Pen, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-10 At The Pig Pen.");
			}
			else if(rando == 3)
			{
				cwx = 2069.7;
				cwy = -1780.1;
				cwz = 13.5;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At East Side Tattoo, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-32 At East Side Tatoo.");
			}
			else if(rando == 4)
			{
				cwx = 1352.4;
				cwy = -1756.7;
				cwz = 13.5;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At Roboi's Food Mart, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-17 At Robbi's Food Mart.");
			}
			else
			{
				cwx = 1831.1;
				cwy = -1842.8;
				cwz = 13.5;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At The 69 Cent Store, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-94 At The 69 Cent Store.");
			}
			rx = cwx;//storing the store
			ry = cwy;
			rz = cwz;
			MissionActive = 1;
			if (gdebug){print("DEBUG MissionActive = 1;");}
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					if (gTeam[i] >= 3)
					{
						if (automission)
						{
							JobGive(i);
						}
						else if (PlayerInfo[i][pPnumber] !=0)
						{
							SendClientMessage(i, COLOR_YELLOW, "SMS: I Got A Job For You, Text Yes To 555 For More Info, Sender: MOLE (555)");
							SendClientMessage(i, COLOR_WHITE, "HINT: Type (/sms 555 yes) to get the waypoint from mole");
							RingTone[i] =20;
						}
					}
					else if (gPlayerSpawned[i] == 1 && (gTeam[i]) == 2)
					{
						SendClientMessage(i, COLOR_DBLUE, cbjstore);
						GameTextForPlayer(i, "~w~Waypoint set ~n~~r~CashBox", 5000, 1);
						SetPlayerCheckpoint(i,cwx, cwy, cwz, 1.4);
					}
				}
			}
			return 1;
		}
/*
		case 2:
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if (IsPlayerConnected(i) && i != gSuperCop && i != gPublicEnemy )
				{
						SetPlayerCheckpoint(i,cwx,cwy,cwz, 1.0);
						gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
						if (gdebug){print("DEBUG CHECKPOINT_NONE1");}
				}
			}
			return 1;
		}
		case 3:
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if (IsPlayerConnected(i))
				{
						SetPlayerCheckpoint(i,cwx,cwy,cwz, 1.0);
						gPlayerCheckpointStatus[i] = CHECKPOINT_PICKUP;
				}
			}
			return 1;
		}*/
		case 4:
		{
			/*
			if (gdebug){print("DEBUG Checkp2");}
			RStart = random(sizeof(gRaceCheckpoints));
			RNext = random(sizeof(gRaceCheckpoints));
			while (RNext == RStart)
			{
				RNext = random(sizeof(gRaceCheckpoints));
			}
			REnd = random(sizeof(gRaceCheckpoints));
			while (RNext == REnd)
			{
				REnd = random(sizeof(gRaceCheckpoints));
			}
			cwx = gRaceCheckpoints[RStart][0];
			cwy = gRaceCheckpoints[RStart][1];
			cwz = gRaceCheckpoints[RStart][2];
			scx = gRaceCheckpoints[RNext][0];
			scy = gRaceCheckpoints[RNext][1];
			scz = gRaceCheckpoints[RNext][2];
			rx = gRaceCheckpoints[REnd][0];
			ry = gRaceCheckpoints[REnd][1];
			rz = gRaceCheckpoints[REnd][2];
			*/
			gRaceFin = 0;
			gRaceMid = 0;
			gRaceMid2 = 0;
			if(randomrace)
			{
				RNext = random(sizeof(gRaceCheckpoints)-1);
				RNext2 = random(sizeof(gRaceCheckpoints));
				REnd = random(sizeof(gRaceCheckpoints));
				while (RNext == REnd)
				{
					REnd = random(sizeof(gRaceCheckpoints));
				}
				while (RNext2 == RNext)
				{
					RNext2 = random(sizeof(gRaceCheckpoints));
				}
				rsx = gRaceCheckpoints[4][0];
				rsy = gRaceCheckpoints[4][1];
				rsz = gRaceCheckpoints[4][2];
				rmx = gRaceCheckpoints[RNext][0];
				rmy = gRaceCheckpoints[RNext][1];
				rmz = gRaceCheckpoints[RNext][2];
				rm2x = gRaceCheckpoints[RNext2][0];
				rm2y = gRaceCheckpoints[RNext2][1];
				rm2z = gRaceCheckpoints[RNext2][2];
				rex = gRaceCheckpoints[REnd][0];
				rey = gRaceCheckpoints[REnd][1];
				rez = gRaceCheckpoints[REnd][2];
			}
			//printf("racelist1 = %d",racelist);
			/*
			if(racelist > 0)
			{
				if(racelist > 8)
				{
					racelist = 1;
					//printf("racelist2 = %d",racelist);
				}
				new nextrace = racelist-1;
				LoadRace(255,Races[nextrace]);
				racelist++;
				//printf("racelist3 = %d",racelist);
			}
			*/
			if(racelist > 0)
			{
				new randa = random(sizeof(Races));
				LoadRace(255,Races[randa]);
			}
			MissionActive = 5;
			if (gdebug){print("DEBUG MissionActive = 5");}
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && (gPlayerSpawned[i] == 1))
				{
					if (gdebug){print("DEBUG Checkp4");}
					if (gTeam[i] >= 3)
					{
						if (automission)
						{
							JobGive(i);
						}
						else if (PlayerInfo[i][pPnumber] !=0)
						{
							SendClientMessage(i, COLOR_YELLOW, "SMS: I Got A Job For You, Text Yes To 555 For More Info, Sender: MOLE (555)");
							SendClientMessage(i, COLOR_WHITE, "HINT: Type (/sms 555 yes) to get the waypoint from mole");
							RingTone[i] =20;
						}
					}
					else if((gTeam[i]) == 2 && RaceInfo[rLaps] == 0)
					{

						if (gdebug){print("DEBUG Checkp6");}
						format(cbjstore, sizeof(cbjstore), "HQ: 911 10-14 Set Up A RoadBlock At The Red Marker.");
						GameTextForPlayer(i, "~w~Waypoint set ~n~~r~RoadBlock", 5000, 1);
						SendClientMessage(i, COLOR_DBLUE, cbjstore);
						RingTone[i] = 20;
						SetPlayerRaceCheckpoint(i, 0, rm2x,rm2y,rm2z,rex,rey,rez, 8.0);
					}
				}
			}
			return 1;
		}
		case 8:
        {
			if (gdebug){print("DEBUG test1");}
			stealcar = random(166)+88;
			GetVehiclePos(stealcar, scx, scy, scz);
			format(objstore, sizeof(objstore), "SMS: A Buyer Is Interested In The Car Marked On Your GPS, Sender: MOLE (555)");
			format(cbjstore, sizeof(cbjstore), "HQ: 911 10-64 Suspect Vehicle Spotted.");
			rx = scx;//storing the car pos
			ry = scy;
			rz = scz;
			if (gdebug){print("DEBUG TEST2");}
			stealcardest = random(166)+88;
			while (stealcardest == stealcar)
			{
				stealcardest = random(166)+88;
			}
			MissionActive = 9;
			if (gdebug){print("DEBUG MissionActive = 9;");}
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && (gPlayerSpawned[i] == 1))
				{
					if (gdebug){print("DEBUG test2");}
					if (gTeam[i] >= 3)
					{
						if (automission)
						{
							JobGive(i);
						}
						else if (PlayerInfo[i][pPnumber] !=0)
						{
							SendClientMessage(i, COLOR_YELLOW, "SMS: I Got A Job For You, Text Yes To 555 For More Info, Sender: MOLE (555)");
							SendClientMessage(i, COLOR_WHITE, "HINT: Type (/sms 555 yes) to get the waypoint from mole");
							RingTone[i] =20;
						}
					}
					else
					{
						if (gdebug){print("DEBUG test4");}
						SendClientMessage(i, COLOR_DBLUE, cbjstore);
						GameTextForPlayer(i, "~w~Waypoint set ~n~~y~Suspect Vehicle", 5000, 1);
						SetVehicleParamsForPlayer(stealcar,i,1,1);

					}
				}
			}
			if (gdebug){printf("DEBUG HOTWIRE mission started: TargetCar:%d",stealcar);}
		return 1;
		}
		case 12:
		{
			new rand = random(sizeof(DmGun));
			dmweapon = DmGun[rand];
			if(dmlist > 35)
			{
				dmlist = 1;
				//printf("racelist2 = %d",racelist);
			}
			new nextdm = random(sizeof(DeathMatches));
			LoadDM(255,DeathMatches[nextdm]);
			new sgun1[20];
			new winfo[256];
			if(DmGun[rand] > 0)
			{
				GetWeaponName(DmGun[rand], sgun1, 20);
				format(winfo, sizeof(winfo), "DM Weapon: %s",sgun1);
			}
			else
			{
				format(winfo, sizeof(winfo), "DM Weapon: Bring Your Own");
			}
			SendClientMessageToAll(COLOR_GREEN, winfo);
			//dmlist++;
			//printf("racelist3 = %d",racelist);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					SendClientMessage(i, COLOR_YELLOW, "SMS: DeathMatch Starting Soon At The Red Marker Outside Ammunation, Sender: MOLE (555)");
					RingTone[i] = 20;
					SendClientMessage(i, COLOR_WHITE, "HINT: Go To The Red Marker And Wait For The DeathMatch To Start.");
					SetPlayerCheckpoint(i,gRandomDMSpawns[0][0],gRandomDMSpawns[0][1],gRandomDMSpawns[0][2], 4.0);
					GameTextForPlayer(i, "~w~Waypoint set ~n~~r~DeathMatch", 5000, 1);
					gPlayerCheckpointStatus[i] = CHECKPOINT_DM;
				}
			}
			MissionActive = 13;
			return 1;
		}

		case 10:
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if (!IsPlayerInVehicle(i, stealcar))
					{
                   	   SetVehicleParamsForPlayer(stealcar,i,1,0);
					}
				}
			}
			return 1;
		}
		case 101:
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if (!IsPlayerInVehicle(i, stealcar))
					{
						SetVehicleParamsForPlayer(stealcar,i,1,0);
					}
					//SetAllPlayerCheckpoint(scx, scy, scz, 16.0, 255);
				}
			}
			return 1;
		}
		case 102:
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if (!IsPlayerInVehicle(i, stealcar))
					{
						SetVehicleParamsForPlayer(stealcar,i,1,0);
					}
				}
			}
			return 1;
		}
		default:
		{
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if (gdebug >=1){printf("OnPlayerEnterCheckpoint %d",playerid);}
	new string[128];
	new name[MAX_PLAYER_NAME];
	switch (gPlayerCheckpointStatus[playerid])
	{
		case CHECKPOINT_PICKUP:
		    {
				if(GetPlayerState(playerid) != 1)
				{
					GameTextForPlayer(playerid, "~w~You must be~n~~r~on foot", 1000, 1);
					return 1;
				}
				if (gdebug){print("DEBUG CHECKPOINT_PICKUP");}
		  	    GetPlayerName(playerid, name, sizeof(name));
		  	    if (MissionActive == 1)
		  	    {
					RewardCalc(playerid,1000,10000);
					DropOff = random(sizeof(gCBdropoff));
				}
				if (gTeam[playerid] >= 3)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					CheckpointReset();
					GameTextForPlayer(playerid, "~w~Now get to the~n~~r~Safehouse", 5000, 1);
					cwx = gCBdropoff[DropOff][0];
					cwy = gCBdropoff[DropOff][1];
					cwz = gCBdropoff[DropOff][2];
					SetAllPlayerCheckpoint(cwx, cwy, cwz, 1.4, 0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_DROPOFF;
					if (gdebug){printf("DEBUG gpcs %d",gPlayerCheckpointStatus[playerid]);}
					format(string, sizeof(string), "%s Has Picked Up The CashBox Containing $%d.", name ,reward);
					BroadCast(COLOR_YELLOW, string);
					gSuperCop = playerid;
					SetPlayerCriminal(playerid,255, "Armed Robbery",0,0);
					MissionActive = 2;
					if (gdebug){print("DEBUG MissionActive = 2;");}
				}
				else if ((gTeam[playerid]) == 2)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					CheckpointReset();
					GameTextForPlayer(playerid, "~w~Return the CashBox~n~to the ~r~Store", 5000, 1);
					cwx = rx;//retrieving the store
					cwy = ry;
					cwz = rz;
					SetAllPlayerCheckpoint(cwx, cwy, cwz, 1.4, 0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_DROPOFF;
					format(string, sizeof(string), "Officer %s Has Picked Up The CashBox Containing $%d.", name ,reward);
					BroadCast(COLOR_YELLOW, string);
	            	gSuperCop = playerid;
	            	MissionActive = 2;
	            	if (gdebug){print("DEBUG MissionActive = 2;");}
				}
			}
		case CHECKPOINT_DROPOFF:
		    {
				if (gdebug){print("DEBUG CHECKPOINT_DROPOFF");}
				GetPlayerName(playerid, name, sizeof(name));
				GivePlayerMoney(playerid, reward);
				preward = reward;
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				if ((gTeam[playerid]) >= 4)
				{
					format(string, sizeof(string), "~g~JOB COMPLETE~n~~w~Your cut was~n~~g~$%d", reward);
					GameTextForPlayer(playerid, string, 5000, 6);
					format(string, sizeof(string), "%s Just Cracked The CashBox For $%d.", name,reward);
					gSuperCop = INVALID_PLAYER_ID;
					SetPlayerCriminal(playerid,255, "Armed Robbery",1,1);
					gPlayerMission[playerid] = 1;
				}
				else
				{
					format(string, sizeof(string), "~b~CASHBOX RETURNED~n~~w~Bonus Paycheck~n~~g~$%d", reward);
					GameTextForPlayer(playerid, string, 5000, 6);
					format(string, sizeof(string), "%s Just Returned The CashBox For $%d.", name,reward);
					SetPlayerToTeamColor(playerid);
					gSuperCop = INVALID_PLAYER_ID;
					if(PlayerInfo[playerid][pCB] >= 4)
					{
						PlayerInfo[playerid][pExp]++;
						PlayerInfo[playerid][pCB] = 0;
						SendClientMessage(playerid, COLOR_YELLOW, "You are getting stronger Exp +1");
					}
				}
				PlayerPlayMusic(playerid);
				BroadCast(COLOR_YELLOW, string);
				CheckpointReset();
				MissionActive = 4;//srace
				if (gdebug){print("DEBUG MissionActive = 4;");}
		    }
		case CHECKPOINT_SR1START:
		    {
				if (gdebug){print("DEBUG CHECKPOINT_SR1START");}
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				if (gTeam[playerid] >= 3)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					if(IsAPlane(tmpcar))
					{
						GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
						return 1;
					}
					if (MissionActive == 5)// first to arrive
					{
						gRaceLeader++;
						if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
                        if (gRaceLeader == 1)
						{
							format(string, sizeof(string), "~r~Wait For More Racers");
							GameTextForPlayer(playerid, string, 2000, 6);
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
							DisablePlayerCheckpoint(playerid);
							return 1;
						}
						else if (gRaceLeader == 2)
						{
							gRaceLeader = 0;
							if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
							format(string, sizeof(string), "SMS: %d Seconds To Race Start, Sender: MOLE (555)",racedelay/1000);
							RingTone[playerid] = 20;
							SendEnemyMessage(COLOR_YELLOW, string);
							format(string, sizeof(string), "~r~Wait Here For Racers");
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
							GameTextForPlayer(playerid, string, 2000, 6);
						}
						SetTimer("RaceDelay", racedelay, 0);
						DisablePlayerCheckpoint(playerid);
						MissionActive = 6;
						if (gdebug){print("DEBUG MissionActive = 6");}
					}
					else if (MissionActive == 6) //late arrivels
					{
						if (gdebug){print("DEBUG waiting");}
						DisablePlayerCheckpoint(playerid);
						gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~w~Patrol This Area~n~ For Suspects", 5000, 1);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
					return 1;
				}
		    }
		case CHECKPOINT_SRA:
		    {
				if (gdebug){print("DEBUG CHECKPOINT_SRA");}
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if (StartTime[playerid] == 0)
				{
					StartTime[playerid] = Gtickcount;
					if(gTeam[playerid] == 3)
					{
						SetPlayerCriminal(playerid,255, "Street Racing",0,0);
						//if(FlashTime[playerid] == 0){FlashTime[playerid] = 60;}
					}
				}
				LapCount[playerid]++;
				gRaceEnd++;
				if(LapCount[playerid] > gLaps)
				{
					gLaps = LapCount[playerid];
					gRaceEnd = 1;
				}
				if(RaceInfo[rLaps] != 0)
				{
					if(gLaps != (RaceInfo[rLaps]+1) && gLaps > 1)
					{
						//RaceDebug(playerid);
						if(gLaps == 2)
						{
							for(new i = 0; i <= MAX_PLAYERS; i++)
							{
								if(IsPlayerConnected(i) && gTeam[i] == 2)
								{
									format(cbjstore, sizeof(cbjstore), "HQ: 911 10-14 Set Up A RoadBlock At The Red Marker.");
									SendClientMessage(i, COLOR_DBLUE, cbjstore);
									RingTone[i] = 20;
									SetPlayerCheckpoint(i,rm2x,rm2y,rm2z, 8.0);
								}
							}
							RaceTime[playerid] = Gtickcount;
						}
						if (gRaceEnd == 1 && LapCount[playerid] == gLaps)
						{
							pos1time = RaceTime[playerid] - StartTime[playerid];
							ConvertTicks(pos1time);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 1st Place T: %d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~1st Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
							SetAllCopCheckpoint(rex,rey,rez, 8.0);
						}
						else if (gRaceEnd == 2 && LapCount[playerid] == gLaps)
						{
							pos2time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos2time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 2nd Place T: +%d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~2nd Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
						}
						else if (gRaceEnd == 3 && LapCount[playerid] == gLaps)
						{
							pos3time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos3time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 3rd Place T: +%d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~3rd Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
						}
						else
						{
							format(string, sizeof(string), "~w~Lap %d/%d",LapCount[playerid],RaceInfo[rLaps]);
						}
						GameTextForPlayer(playerid, string, 5000, 1);
					}
					else if(gLaps == (RaceInfo[rLaps]+1) && gLaps > 1)
					{
						if (gRaceEnd == 1)
						{
							DisablePlayerCheckpoint(playerid);
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
							if (gdebug){print("DEBUG RACE OVER");}
							RewardCalc(playerid,1000,10000);
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							preward = reward;
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~YOU WIN~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							BroadCast(COLOR_WHITE, "RACENEWS: The Race Will End In 120 secs");
							RaceTime[playerid] = Gtickcount;
							pos1time = RaceTime[playerid] - StartTime[playerid];
							ConvertTicks(pos1time);
							GetPlayerName(playerid, name, sizeof(name));
							raceendtimer = SetTimer("RaceEnd", 120000, 0);
							if(RaceInfo[rBestms] > pos1time || RaceInfo[rBestms] == 0)
							{
								RaceInfo[rBestms] = pos1time;
								strmid(RaceInfo[rBest],name, 0, strlen(name), 255);
								BestTime(CurrentRace);
								format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d",name,reward);
								BroadCast(COLOR_WHITE, string);
								format(string, sizeof(string), "RACENEWS: %s Has Set A New Best Time In %s T: %d:%d:%d", name,CurrentRace,cmins,csecs,cmils);
								BroadCast(COLOR_WHITE, string);
							}
							else
							{
								format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d T: %d:%d:%d", name,reward,cmins,csecs,cmils);
								BroadCast(COLOR_WHITE, string);
							}
							SetPlayerCriminal(playerid,255, "Street Racing",1,1);
							gPlayerMission[playerid] = 2;
							BetWinner(playerid,1);
							return 1;
						}
						else if (gRaceEnd == 2)
						{
							DisablePlayerCheckpoint(playerid);
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
							if (gdebug){print("DEBUG RACE OVER");}
							reward = preward/2;
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~2nd place~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							RaceTime[playerid] = Gtickcount;
							pos3time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos3time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s Just Came 2nd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							return 1;
						}
						else if (gRaceEnd == 3)
						{
							CheckpointReset();
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
							if (gdebug){print("DEBUG RACE OVER");}
							reward = preward/3;
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~3rd place~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							RaceTime[playerid] = Gtickcount;
							pos2time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos2time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s Just Came 3rd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							KillTimer(raceendtimer);
							RaceEnd();
							return 1;
						}
					}
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerCheckpoint(playerid,rmx,rmy,rmz, 16.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRB;
				}
				if(RaceInfo[rLaps] == 0 && LapCount[playerid] == 1)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerCheckpoint(playerid,rmx,rmy,rmz, 16.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRB;
				}
		    }
		case CHECKPOINT_SRB:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceMid != 1 && LapCount[playerid] > gLaps)
				{
					gRaceMid = 1;
				}
				if (gdebug){print("DEBUG CHECKPOINT_SRB");}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid,rm2x,rm2y,rm2z, 16.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRC;
				gRaceMid++;
				if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
		    }
		case CHECKPOINT_SRC:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceMid2 != 1 && LapCount[playerid] > gLaps)
				{
					gRaceMid2 = 1;
				}
				if (gdebug){print("DEBUG CHECKPOINT_SRB");}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid,rex,rey,rez, 16.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRD;
				gRaceMid2++;
				if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
		    }
		case CHECKPOINT_SRD:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceFin != 1 && LapCount[playerid] > gLaps)
				{
					gRaceFin = 1;
				}
				if (gdebug){print("DEBUG CHECKPOINT_SRC");}
				gRaceFin++;
				if(RaceInfo[rLaps] > 0)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerCheckpoint(playerid,rsx,rsy,rsz, 16.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					SetAllCopCheckpoint(rex,rey,rez, 8.0);
				}
				if(RaceInfo[rLaps] == 0)
				{
					if (gRaceFin == 1)
					{
						DisablePlayerCheckpoint(playerid);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						if (gdebug){print("DEBUG RACE OVER");}
						RewardCalc(playerid,1000,10000);
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						preward = reward;
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~YOU WIN~n~~w~Your winnings are ~n~~g~$%d", reward);
						GameTextForPlayer(playerid, string, 5000, 6);
						BroadCast(COLOR_WHITE, "RACENEWS: The Race Will End In 120 secs");
						RaceTime[playerid] = Gtickcount;
						pos1time = RaceTime[playerid] - StartTime[playerid];
						ConvertTicks(pos1time);
						GetPlayerName(playerid, name, sizeof(name));
						raceendtimer = SetTimer("RaceEnd", 120000, 0);
						if(RaceInfo[rBestms] > pos1time || RaceInfo[rBestms] == 0)
						{
							RaceInfo[rBestms] = pos1time;
							strmid(RaceInfo[rBest],name, 0, strlen(name), 255);
							BestTime(CurrentRace);
							format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d",name,reward);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "RACENEWS: %s Has Set A New Best Time In %s T: %d:%d:%d", name,CurrentRace,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
						}
						else
						{
							format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d T: %d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
						}
						SetPlayerCriminal(playerid,255, "Street Racing",1,1);
						gPlayerMission[playerid] = 2;
						BetWinner(playerid,1);
					}
					else if (gRaceFin == 2)
					{
						DisablePlayerCheckpoint(playerid);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						if (gdebug){print("DEBUG RACE OVER");}
						reward = preward/2;
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~2nd place~n~~w~Your winnings are ~n~~g~$%d", reward);
						GameTextForPlayer(playerid, string, 5000, 6);
						RaceTime[playerid] = Gtickcount;
						pos3time = RaceTime[playerid] - StartTime[playerid];
						new splittime = pos3time - pos1time;
						ConvertTicks(splittime);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "RACENEWS: %s Just Came 2nd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
						BroadCast(COLOR_WHITE, string);
					}
					else if (gRaceFin == 3)
					{
						CheckpointReset();
						RaceCheckpointReset();
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						if (gdebug){print("DEBUG RACE OVER");}
						reward = preward/3;
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~3rd place~n~~w~Your winnings are ~n~~g~$%d", reward);
						GameTextForPlayer(playerid, string, 5000, 6);
						RaceTime[playerid] = Gtickcount;
						pos2time = RaceTime[playerid] - StartTime[playerid];
						new splittime = pos2time - pos1time;
						ConvertTicks(splittime);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "RACENEWS: %s Just Came 3rd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
						BroadCast(COLOR_WHITE, string);
						KillTimer(raceendtimer);
						RaceEnd();
					}
				}
		    }
		case CHECKPOINT_CARDROP:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				GameTextForPlayer(playerid, "~w~Get out of the ~n~~y~Car", 5000, 1);
				MissionActive = 11;
				if (gdebug){print("DEBUG MissionActive = 11");}
		    }
		case CHECKPOINT_HOME:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				GameTextForPlayer(playerid, "~w~You are~n~~y~Home", 5000, 1);
		    }
		case CHECKPOINT_DM:
		    {
				gFightLeader++;
				gFighters++;
				gPlayerFighter[playerid] = 1;
				DisablePlayerCheckpoint(playerid);
				gTeam[playerid] = 4;
				SetPlayerToTeamColor(playerid);
				SetSpawnInfo(playerid, 1, PlayerInfo[playerid][pModel], gRandomDMSpawns[1][0], gRandomDMSpawns[1][1], gRandomDMSpawns[1][2], 1.0, -1, -1, -1, -1, -1, -1);
				if(gFighters >= 21)
				{
					gFighters = 2;
				}
				else
				{
					SetPlayerPos(playerid, gRandomDMSpawns[gFighters][0], gRandomDMSpawns[gFighters][1], gRandomDMSpawns[gFighters][2]); // Warp the player
				}
				if(dmweapon > 0)
				{
					ResetPlayerWeapons(playerid);
					GivePlayerWeapon(playerid, dmweapon, 999);
				}
				//SetPlayerWorldBounds(playerid,gDMWbounds[0],gDMWbounds[1],gDMWbounds[2],gDMWbounds[3]);
				SetPlayerFacingAngle(playerid, 270.0);
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
				TogglePlayerControllable(playerid, 0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				SendClientMessage(playerid, COLOR_WHITE,"HINT: Relog if you wrongly joined the DeathMatch or you want to leave it!");
				format(string, sizeof(string), "~r~DeathMatch~n~~w~Wait for more players");
				GameTextForPlayer(playerid, string, 5000, 3);
				if (gFightLeader == 2)
				{
					SetTimer("DMDelay", racedelay, 0);
					format(string, sizeof(string), "SMS: %d Seconds To DeathMatch Start, Sender: MOLE (555)",racedelay/1000);
					RingTone[playerid] = 20;
					BroadCast(COLOR_YELLOW, string);
				}
		    }
  		default:
	        {
		        if ((gTeam[playerid]) == 2)
				{
					PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "~w~Defend This ~n~Position");
					GameTextForPlayer(playerid, string, 5000, 1);
					if (gdebug){print("DEBUG crims protect");}
			    }
				if ((gTeam[playerid]) == 2)
				{
					PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "~w~Patrol This Area~n~ For Suspects");
					GameTextForPlayer(playerid, string, 5000, 1);
					if (gdebug){print("DEBUG cops protect");}
			    }
	        }
	}
	return 1;
}

public RaceDebug(playerid)
{
	new string[256];
	format(string, sizeof(string), "gRaceFin(%d) gRaceMid(%d) gRaceMid2(%d) gRaceEnd(%d) gLaps(%d) RaceInfo[rLaps](%d) LapCount[playerid](%d)",gRaceFin,gRaceMid,gRaceMid2,gRaceEnd,gLaps,RaceInfo[rLaps],LapCount[playerid]);
	BroadCast(COLOR_WHITE, string);
}

public RaceEnd()
{
	CheckpointReset();
	RaceCheckpointReset();
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			StartTime[i] = 0;
			LapCount[i] = 0;
		}
	}
	gRaceFin = 0;
	gRaceMid = 0;
	gRaceMid2 = 0;
	gRaceEnd = 0;
	gLaps = 0;
	BroadCast(COLOR_WHITE, "RACENEWS: ::: Race Over :::");
	MissionActive = 8;
	if (gdebug){print("DEBUG MissionActive = 8");}
}

public RaceDelay()
{
	if (gdebug >=1){printf("RaceDelay ");}
	new string[32];
	format(string, sizeof(string), "~r~Ready");
	new gdelay=1000;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if ((gPlayerCheckpointStatus[i] == CHECKPOINT_SRA) && gTeam[i] >= 3)
			{
				GameTextForPlayer(i, string, gdelay, 6);
				PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			}
		}
	}

		SetTimer("RaceDelayr", gdelay, 0);
		return 1;
}
public RaceDelayr()
{
if (gdebug >=1){printf("RaceDelayr");}
	new string[32];
	format(string, sizeof(string), "~y~Set");
	new hdelay=1000;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if ((gPlayerCheckpointStatus[i] == CHECKPOINT_SRA) && (gTeam[i] >= 3))
			{
				GameTextForPlayer(i, string, hdelay, 6);
				PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			}
		}
	}
		SetTimer("RaceDelayg", hdelay, 0);
		return 1;
}
public RaceDelayg()
{
if (gdebug >=1){printf("RaceDelayg");}
	new rdelay=1000;
	new string[32];
	format(string, sizeof(string), "~g~GO");
	gLaps = 0;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if (gTeam[i] >= 3)
			{
				if (gPlayerCheckpointStatus[i] == CHECKPOINT_SRA)
				{
					GameTextForPlayer(i, string, rdelay, 6);
					PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
					SetPlayerRaceCheckpoint(i,0,rsx,rsy,rsz,rmx,rmy,rmz, 8.0);
					gPlayerCheckpointStatus[i] = CHECKPOINT_SRA;
				}
				else
				{
					DisablePlayerCheckpoint(i);
					gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
				}
			}
		}
	}
		SetAllCopCheckpoint(rm2x,rm2y,rm2z, 8.0);
		MissionActive = 7;
		if (gdebug){print("DEBUG MissionActive = 7");}
		return 1;
}

public DMDelay()
{
	if (gdebug >=1){printf("DMDelay ");}
	new string[32];
	gFightLeader = 1000;
	format(string, sizeof(string), "~r~Ready");
	new gdelay=1000;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		DisablePlayerCheckpoint(i);
		if(IsPlayerConnected(i))
		{
			if (gPlayerFighter[i] == 1)
			{
				GameTextForPlayer(i, string, gdelay, 6);
				PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			}
		}
	}
		SetTimer("DMDelayr", gdelay, 0);
		return 1;
}
public DMDelayr()
{
if (gdebug >=1){printf("DMDelayr");}
	new string[32];
	format(string, sizeof(string), "~y~Set");
	new hdelay=1000;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if (gPlayerFighter[i] == 1)
			{
				GameTextForPlayer(i, string, hdelay, 6);
				PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			}
		}
	}
		SetTimer("DMDelayg", hdelay, 0);
		return 1;
}
public DMDelayg()
{
if (gdebug >=1){printf("DMDelayg");}
	new rdelay=1000;
	new string[32];
	format(string, sizeof(string), "~g~FIGHT");
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if (gPlayerFighter[i] == 1)
			{
				GameTextForPlayer(i, string, rdelay, 6);
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
				TogglePlayerControllable(i, 1);
			}
		}
	}
	MissionActive = 13;
	if (gdebug){print("DEBUG MissionActive = 13");}
	return 1;
}

public DMDetect()
{
	if(gFightLeader == 1000)
	{
		dmtimer++;
		PlayerInArena();
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1 && gPlayerFighter[i] == 1)
			{
				if(dmtime-dmtimer == 60)
				{
					GameTextForPlayer(i, "~r~One Minuite Remaining", 5000, 1);
				}
			}
		}
		if(dmtimer == dmtime)
		{
			new ename[MAX_PLAYER_NAME];
			new string[256];
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1 && gPlayerFighter[i] == 1 || IsPlayerConnected(i) == 1 && TVMode[i]>11 && TVMode[i]<20)
				{
					if(TVMode[i]>11 && TVMode[i]<20)
					{
						TVMode[i] = 0;
						Spectate[i] = 300;
					}
					TogglePlayerControllable(i, 0);
					if(IsPlayerConnected(DmHiPlayer) == 1)
					{
						GetPlayerPos(DmHiPlayer, DmeCam[0], DmeCam[1], DmeCam[2]);
						DmeCam[3] = DmeCam[0];
						DmeCam[4] = DmeCam[1]+2;
						DmeCam[5] = DmeCam[2]+0.2;
						DmeCam[2] = DmeCam[2]+0.6;
						SetPlayerFacingAngle(DmHiPlayer, 0.0);
						RewardCalc(DmHiPlayer,1000,10000);
						GetPlayerName(DmHiPlayer, ename, sizeof(ename));
						format(string, sizeof(string), "~r~DeathMatch Over~n~~b~Winner~n~~w~%s~n~kills:%d~n~~g~Prize:$%d", ename,DmHiScore, reward);
					}
					else
					{
						format(string, sizeof(string), "~r~DeathMatch Over~n~~b~No Winner");
						DmeCam[0] = gRandomDMSpawns[1][0];
						DmeCam[1] = gRandomDMSpawns[1][1];
						DmeCam[2] = gRandomDMSpawns[1][2];
						DmeCam[3] = DmeCam[0];
						DmeCam[4] = DmeCam[1];
						DmeCam[5] =DmeCam[2]+30;
					}
					DMEndCam(i,string);
				}
			}
		}
		if(dmtimer == dmtime+10)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					if(Spectate[i] == 300)
					{
						Spectate[i] = 253;
					}
					if(gPlayerFighter[i] == 1)
					{
						if(PlayerInfo[i][pTeam] != 3)
						{
							gTeam[i] = PlayerInfo[i][pTeam];
							SetPlayerToTeamColor(i);
						}
						gPlayerFighter[i] = 0;
						DmScore[i] = 0;
						TogglePlayerControllable(i, 1);
						SpawnPlayer(i);
						SetPlayerRandomSpawn(i);
					}
				}
			}
		}
		if(dmtimer == dmtime+11)
		{
			if(IsPlayerConnected(DmHiPlayer) == 1)
			{
				new ename[MAX_PLAYER_NAME];
				new string[256];
				PlayerPlaySound(DmHiPlayer, 1058, 0.0, 0.0, 0.0);
				GetPlayerName(DmHiPlayer, ename, sizeof(ename));
				GivePlayerMoney(DmHiPlayer, reward);
				format(string, sizeof(string), "~g~JOB COMPLETE~n~~w~Your cut was~n~~g~$%d", reward);
				PlayerPlayMusic(DmHiPlayer);
				GameTextForPlayer(DmHiPlayer, string, 5000, 6);
				format(string, sizeof(string), "%s Won A Deathmatch With A Total Of %d Kills For $%d", ename,DmHiScore, reward);
				BroadCast(COLOR_YELLOW, string);
				//SetPlayerPos(DmHiPlayer,gRandomDMSpawns[0][0],gRandomDMSpawns[0][1],gRandomDMSpawns[0][2]);
				if(PlayerInfo[DmHiPlayer][pTeam] != 1 && PlayerInfo[DmHiPlayer][pTeam] != 2)
				{
					SetPlayerCriminal(DmHiPlayer,255, "Mass Murder",1,1);
					gPlayerMission[DmHiPlayer] = 4;
				}
				else
				{
					PlayerInfo[DmHiPlayer][pWA] = PlayerInfo[DmHiPlayer][pWA]+5;
					if(PlayerInfo[DmHiPlayer][pWA] >= 20)
					{
						PlayerInfo[DmHiPlayer][pExp]++;
						PlayerInfo[DmHiPlayer][pWA] = PlayerInfo[DmHiPlayer][pWA]-20;
						SendClientMessage(DmHiPlayer, COLOR_YELLOW, "You are getting stronger Exp +1");
					}
				}
				BetWinner(DmHiPlayer,2);
			}
			gFighters = 0;
			gFightLeader = 0;
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
			DmHiScore = 0;
			DmHiPlayer = 255;
			dmtimer = 0;
		}
	}
}

public DMEndCam(playerid,string[])
{
	GameTextForPlayer(playerid, string, 5000, 6);
	SetPlayerCameraPos(playerid,DmeCam[3], DmeCam[4], DmeCam[5]);
	SetPlayerCameraLookAt(playerid,DmeCam[0], DmeCam[1], DmeCam[2]);
}

public DMScoreCalc()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gPlayerFighter[i] == 1)
		{
			if(gPlayerFighter[i] == 1)
			{
				new tmp1 = DmScore[i];
				if(tmp1 > DmHiScore)
				{
					DmHiScore = tmp1;
					DmHiPlayer = i;
				}
			}
		}
	}
	return 1;
}


public OnPlayerDropCashBox(playerid)
{
if (gdebug >=1){printf("OnPlayerDropCashBox %d",playerid);}
	new string[128];
	new dname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, dname, sizeof(dname));
	format(string, sizeof(string), ".: %s Dropped The CashBox! :.", dname);
	BroadCast(COLOR_RED, string);
	GetPlayerPos(playerid, cwx, cwy, cwz);
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
				SetPlayerCheckpoint(i,cwx,cwy,cwz, 1.0);
				gPlayerCheckpointStatus[i] = CHECKPOINT_PICKUP;
		}
	}
	MissionActive = 3;
	if (gdebug){print("DEBUG MissionActive = 3;");}
	return 1;
}

public RewardCalc(playerid,min,max)
{
	reward = (min + (random(max-min)) + ((numplayers + PlayerInfo[playerid][pLevel]) *1000)); //minimum 1000 max 10000 + activeplayers x 1000
	printf("DEBUG RewardCalc = (Random(min=%d)(max=%d))(numplayers=%d)(PlayerInfo[playerid][pLevel]=%d) Total =%d",min,max,numplayers,PlayerInfo[playerid][pLevel],reward);
}

public CheckpointReset()
{
	if (gdebug >= 1){printf("DEBUG CheckpointReset()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			DisablePlayerCheckpoint(i);
			gPlayerLapStatus[i] = 0;
			gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
		}
	}

}

public RaceCheckpointReset()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			DisablePlayerRaceCheckpoint(i);
			gPlayerLapStatus[i] = 0;
			gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
		}
	}

}

public JobGive(playerid)
{
	if (gdebug >= 1){printf("DEBUG JobGive (%d)",playerid);}
	if(MissionActive == 1)
	{

		SendClientMessage(playerid, COLOR_YELLOW, objstore);
		SetPlayerCheckpoint(playerid,cwx, cwy, cwz, 1.4);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_PICKUP;
		RingTone[playerid] = 20;
		SendClientMessage(playerid, COLOR_WHITE, "HINT: Go To The Red Marker And Steal The CashBox.");
		GameTextForPlayer(playerid, "~w~Waypoint set ~n~~r~CashBox", 5000, 1);
		return 1;
	}
	if(MissionActive == 5)
	{
		format(objstore, sizeof(objstore), "SMS: StreetRace Starting Soon At The Red Marker, Sender: MOLE (555)");
		SendClientMessage(playerid, COLOR_YELLOW, objstore);
		RingTone[playerid] = 20;
		SetPlayerRaceCheckpoint(playerid,0,rsx,rsy,rsz, rmx,rmy,rmz, 8.0);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_SR1START;
		SendClientMessage(playerid, COLOR_WHITE, "HINT: Go To The Red Marker And Wait For The Race To Start.");
		GameTextForPlayer(playerid, "~w~Waypoint set ~n~~r~StreetRace", 5000, 1);
		return 1;
	}
    if(MissionActive == 9)
	{
		SendClientMessage(playerid, COLOR_YELLOW, objstore);
		RingTone[playerid] = 20;
		SetVehicleParamsForPlayer(stealcar,playerid,1,0);
			SetPlayerCheckpoint(playerid,scx, scy, scz,5.0 );
		SendClientMessage(playerid, COLOR_WHITE, "HINT: Go To The Red Marker And Steal The Car.");
		GameTextForPlayer(playerid, "~w~Waypoint set ~n~~r~The Car", 5000, 1);
		return 1;
	}
	else
	{
		SendClientMessage(playerid, COLOR_YELLOW, "SMS: I Got Nothing Right Now, Sender: MOLE (555)");
		RingTone[playerid] = 20;
	}
	return 1;
}

public SetAllPlayerCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num)
{
	if (gdebug >= 1){printf("DEBUG SetAllPlayerCheckpoint()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			SetPlayerCheckpoint(i,allx,ally,allz, radi);
			if (num != 255)
			{
				gPlayerCheckpointStatus[i] = num;
			}
		}
	}

}

public SetAllCopCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi)
{
	if (gdebug >= 1){printf("DEBUG SetAllCopCheckpoint()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(gTeam[i] == 2)
			{
				SetPlayerCheckpoint(i,allx,ally,allz, radi);
			}
		}
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
if (gdebug >=1){printf("OnPlayerStateChange %d %d %d",playerid, newstate, oldstate);}
	if((newstate == 2 || newstate == 3) && nocarcash)
	{
		if (gPlayerCheckpointStatus[playerid] == CHECKPOINT_DROPOFF)
		{
			if (gdebug){print("DEBUG test6");}
			DisablePlayerCheckpoint(playerid);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			new check = gPlayerCheckpointStatus[playerid];
			if (gdebug){printf("DEBUG check %d" ,check);}
			OnPlayerDropCashBox(playerid);
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
		if(gTeam[playerid] >= 4 && LapCount[playerid] > 0)
		{
			new count;
			new string[256];
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gTeam[i] == 2 && CrimInRange(50.0, playerid,i))
				{
					count = 1;
					format(string, sizeof(string), "~p~Racer ~w~Jailed~n~Bonus Paycheck ~n~~g~$%d", 10000);
					GameTextForPlayer(i, string, 5000, 1);
					GivePlayerMoney(i, 10000);
					PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
					PlayerInfo[i][pWA] = PlayerInfo[i][pWA]+2;
					if(PlayerInfo[i][pWA] >= 20)
					{
						PlayerInfo[i][pExp]++;
						PlayerInfo[i][pWA] = 0;
						SendClientMessage(i, COLOR_YELLOW, "You are getting stronger Exp +1");
					}
				}
			}
			if(count == 1)
			{
				new name [MAX_PLAYER_NAME];
				GetPlayerName(playerid, name, sizeof(name));
				format(string, sizeof(string), "RACENEWS: %s Has Been Busted Buy The Cops.", name);
				BroadCast(COLOR_WHITE, string);
				SetPlayerInterior(playerid,6);
				LapCount[playerid] = 0;
				PlayerInfo[playerid][pInt] = 6;
				SetPlayerPos(playerid,264.395200,77.564040,1001.039000);
				SendClientMessage(playerid, COLOR_GRAD1,"   You have been jailed for street racing (type /checktime).");
				PlayJailSound(1153 , 1154, 2000,264.395200, 77.564040, 1001.039000);
				JailTime[playerid] = 60;
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER) //buggy dont finnish
	{
		new newcar = GetPlayerVehicleID(playerid);
		new oldcar = gLastCar[playerid];
		new housecar = PlayerInfo[playerid][pPhousekey]+1;
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
		if (gdebug >=1){printf("oldcar %d, newcar %d",oldcar,newcar);}
		if(IsATruck(newcar))
		{
			new string[256];
			format(string, sizeof(string), "Components: %d/%d", PlayerHaul[newcar][pLoad],PlayerHaul[newcar][pCapasity]);
			SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
			SendClientMessage(playerid, COLOR_WHITE, "INFO: You can deliver components to business");
			SendClientMessage(playerid, COLOR_WHITE, "INFO: Commands are /load /buycomp /sellcomp /bestsale");
		}
		if(newcar >= 71 && newcar <= 74)
		{
			if (HireCar[playerid] != newcar)
			{
				new string[128];
				format(string, sizeof(string), "~w~You can Rent this car~n~Cost:~g~$%d~n~~w~To rent type ~g~/rentcar~w~~n~to get out type ~r~/exit",BizzInfo[8][bEntcost]);
				TogglePlayerControllable(playerid, 0);
				GameTextForPlayer(playerid, string, 5000, 3);
			}

		}
		if(newcar >= 75 && newcar <= 77)
		{
			if (HireCar[playerid] != newcar)
			{
				new string[128];
				format(string, sizeof(string), "~w~You can Rent this car~n~Cost:~g~$%d~n~~w~To rent type ~g~/rentcar~w~~n~to get out type ~r~/exit",BizzInfo[9][bEntcost]);
				TogglePlayerControllable(playerid, 0);
				GameTextForPlayer(playerid, string, 5000, 3);
			}

		}
	/*	for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(GetPlayerState(i) == 2 && GetPlayerVehicleID(i) == newcar)
				{
					RemovePlayerFromVehicle(i);
					TogglePlayerControllable(i, 1); //hirecar bug
				}
			}
		}*/
		/*
		if (HireCar[playerid] != 299 && gTeam[playerid] <= 2) //works on lock command now
		{
			if(newcar != housecar && oldcar != 301)
			{
				gLastDriver[oldcar] = 300;
				gCarLock[oldcar] = 0;
				UnLockCar(oldcar);
				HireCar[playerid] = newcar;
			}
		}
		*/
		if(oldcar != 301)
		{
			if((housecar != oldcar && oldcar != 0) && (HireCar[playerid] != oldcar && newcar != housecar))
			{
				if(gLastDriver[oldcar] == playerid && oldcar != newcar)
				{
					gLastDriver[oldcar] = 300;
					gCarLock[oldcar] = 0;
					UnLockCar(oldcar);
				}
			}
		}
if(gTeamCarLock[newcar] == 1)
		{
			gTeamCarLock[newcar] = 0;
			UnLockCar(newcar);
		}
		gLastCar[playerid] = newcar;
		if (gdebug >=1){printf("gLastCar[playerid](%d)",gLastCar[playerid]);}
		gLastDriver[newcar] = playerid;
		if ((newcar == stealcar) && (MissionActive == 9))
		{
			RewardCalc(playerid,1000,10000);
		}
		if((newcar == stealcar) && (MissionActive >= 9))
		{
			if (gdebug){print("DEBUG TEST3");}
			if (gTeam[playerid] >= 3 && MissionActive >= 9)
			{
				if (gdebug){print("DEBUG TEST4");}
				new name[MAX_PLAYER_NAME];
				new string[256];
				GetPlayerName(playerid, name, sizeof(name));
				GetVehiclePos(stealcardest, cwx, cwy, cwz);
				GameTextForPlayer(playerid, "~w~Now get the ~y~Car~n~~w~to the ~r~Buyer", 5000, 1);
				format(string, sizeof(string), "%s Has Stolen A Car Worth $%d", name,reward);
				BroadCast(COLOR_YELLOW, string);
				SetAllPlayerCheckpoint(cwx, cwy, cwz, 16.0, 0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_CARDROP;
				MissionActive = 10;
				if (gdebug){print("DEBUG MissionActive = 10;");}
				if (gTeam[playerid] == 3)
				{
					SetPlayerCriminal(playerid,255, "Grand Theft Auto",0,0);
				}
				gSuperCop = playerid;
				OpenDoors();
			}
			if (gTeam[playerid] == 2 && MissionActive >= 9)
			{
				if (gdebug){print("DEBUG TEST6");}
				GameTextForPlayer(playerid, "~w~You are Cop, please Wait other gangs or civilian", 5000, 1);
                RemovePlayerFromVehicle(playerid);
			if (gdebug){print("DEBUG MissionActive = 10;");}
			}
			if (gTeam[playerid] == 2 && MissionActive >= 10)
			{
				if (gdebug){print("DEBUG TEST6");}
				new name[MAX_PLAYER_NAME];
				new string[256];
				GetPlayerName(playerid, name, sizeof(name));
				cwx = 1539.1;
				cwy = -1668.0;
				cwz = 5.8;
				GameTextForPlayer(playerid, "~w~Return the ~y~car ~n~~w~to the ~r~Pound", 5000, 1);
				format(string, sizeof(string), "Officer %s Has Seized A Stolen Car Worth $%d", name,reward);
				BroadCast(COLOR_YELLOW, string);
				SetAllPlayerCheckpoint(cwx, cwy, cwz, 16.0, 0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_CARDROP;
				gSuperCop = playerid;
				MissionActive = 10;
				if (gdebug){print("DEBUG MissionActive = 10;");}
			}
		}
	}
	if(newstate == PLAYER_STATE_SPAWNED)
	{
		new Float: lwx, Float:lwy, Float:lwz;
		GetPlayerPos(playerid, lwx, lwy, lwz);
		if (gdebug >=1){printf("z =%f int =%d",lwz,PlayerInfo[playerid][pInt]);}
		if((lwz > 530.0 && PlayerInfo[playerid][pInt] == 0) || PlayerToPoint(1000.0, playerid, -1041.9,-1868.4,79.1)) //the highest land point in sa = 526.8
		{
			SetPlayerRandomSpawn(playerid);
			print("overhight or ob");
		}
		//SetPlayerInterior(playerid,0);
		if(dmweapon > 0 && gPlayerFighter[playerid] != 0)
		{
			GivePlayerWeapon(playerid, dmweapon, 999);
			if(PlayerInfo[playerid][pSHealth] < 50.0)
			{
				SetPlayerHealth(playerid, 100.0);
			}
			else
			{
				SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
			}
		}
		else
		{
			SetPlayerWeapons(playerid);
			SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
		}
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
		gPlayerSpawned[playerid] = 1;
		SafeTime[playerid] = 60;
		//OnUpdatePlayer(playerid); //spawnsave
	}
	return 1;
}

public HireCost(carid)
{
	switch (carid)
	{
		case 69:
		{
			return 90000; //bullit
		}
		case 70:
		{
			return 130000; //infurnus
		}
		case 71:
		{
			return 100000; //turismo
		}
		case 72:
		{
			return 80000;
		}
		case 73:
		{
			return 70000;
		}
		case 74:
		{
			return 60000;
		}
	}
	return 0;
}

public CarCheck()
{
	if (gdebug >= 3){printf("DEBUG CarCheck()");}
	//new foundowner = -1;
	for(new c = 1; c < 254; c++)
	{
		/*
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(HireCar[i] == c && foundowner == -1)
				{
					foundowner = i;
				}
			}
		}
		if(foundowner == -1 && c > 34 && gCarLock[c] == 1)
		{
			gCarLock[c] = 0;
			UnLockCar(c);
		}
		*/
		if (gLastDriver[c] == 301)
		{
			CarRespawn(c);
		}
		if (gLastDriver[c] >= 300)
		{
			gLastDriver[c]++;
		}
		//foundowner = -1;
	}
	return 1;
}

public CarInit()
{
	if (gdebug >= 3){printf("DEBUG CarCheck()");}
	for(new c = 1; c < 254; c++)
	{
 		gLastDriver[c] = 299;
		gTeamCarLock[c] = 0;
		//gCarLock[c] = 0;
	}
	gLastDriver[301]=255;
	return 1;
}

public CarTow(carid)
{
	if (gdebug >= 1){printf("DEBUG CarRespawn(%d)",carid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInVehicle(i, carid) || HireCar[i] == carid)
			{
				gLastDriver[carid] = 255;
				return 0;
			}
		}
	}
	// 		CreateVehicle(HouseInfo[h][hVec], HouseCarSpawns[h][0], HouseCarSpawns[h][1], HouseCarSpawns[h][2], HouseCarSpawns[h][3], HouseInfo[h][hVcol1], HouseInfo[h][hVcol2], -1);
	// 				SetVehiclePos(plo,plocx,plocy+4, plocz);
	SetVehiclePos(carid,HouseCarSpawns[carid-1][0], HouseCarSpawns[carid-1][1], HouseCarSpawns[carid-1][2]);
	SetVehicleZAngle(carid, HouseCarSpawns[carid-1][3]);
	return 1;
}

public CarRespawn(carid)
{
	if (gdebug >= 1){printf("DEBUG CarRespawn(%d)",carid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInVehicle(i, carid) || HireCar[i] == carid)
			{
				gLastDriver[carid] = 255;
				return 0;
			}
		}
	}
	SetVehicleToRespawn(carid);
	gLastDriver[carid] = 299;
	TeamLockReset(carid);
	return 1;
}

public LockCar(carid)
{
	if (gdebug >= 1){printf("DEBUG LockCar(%d)",carid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(stealcar == carid)
			{
				SetVehicleParamsForPlayer(carid,i,1,1);
			}
			else
			{
				SetVehicleParamsForPlayer(carid,i,0,1);
			}
		}
	}
}

public UnLockCar(carid)
{
	if (gdebug >= 1){printf("DEBUG UnLockCar(%d)",carid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(stealcar == carid)
			{
				SetVehicleParamsForPlayer(carid,i,1,0);
			}
			else
			{
				if(!IsAPlane(carid))
				{
					SetVehicleParamsForPlayer(carid,i,0,0);
				}
			}
		}
	}
}

public OpenDoors()
{
	if (gdebug >= 1){printf("DEBUG OpenDoors()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			SetVehicleParamsForPlayer(stealcar,i,1,0);
		}
	}
}

public TeamCarLockInit()
{
	if (gdebug >= 1){printf("DEBUG TeamCarLockInit()");}
	for(new c = 0; c <= 200; c++)
	{
		if ((c >= 23) && (c <= 48))
		{
			gTeamCarLock[c] = 2;
		}
		if ((c >= 49) && (c <= 51))
		{
			gTeamCarLock[c] = 4;
		}
		if ((c >= 52) && (c <= 200))
		{
			gTeamCarLock[c] = 1;
		}
			gCarLock[c] = 0;
	}
	return 1;
}

public TeamLockReset(carid)
{
	if (gdebug >= 3){printf("DEBUG TeamLockReset(carid)",carid);}
	if (!teamcarlock)
	{
		return 0;
	}
	//DebugPrint("TeamLockReset()",0,0,1);
	if ((carid >= 23) && (carid <= 48))
	{
		gTeamCarLock[carid] = 2;
	}
	if ((carid >= 49) && (carid <= 51))
	{
		gTeamCarLock[carid] = 4;
	}
	if ((carid >= 52) && (carid <= 200))
	{
		gTeamCarLock[carid] = 1;
	}
	gCarLock[carid] = 0;
	return 1;
}

public InitLockDoors(playerid)
{
	if (gdebug >= 1){printf("DEBUG1 InitLockDoors(%d)",playerid);}
	new c;
	while (c < 254)
	{
		c++;
		if (gCarLock[c] == 1)
		{
			if (gdebug >= 1){printf("DEBUG3 InitLockDoors(%d)car(%d)",playerid,c);}
			SetVehicleParamsForPlayer(c,playerid,0,1);
		}
	}
	if(PLicence[playerid] != 1)
	{
		SetVehicleParamsForPlayer(66,playerid,0,1);
		SetVehicleParamsForPlayer(67,playerid,0,1);
		SetVehicleParamsForPlayer(68,playerid,0,1);
		SetVehicleParamsForPlayer(69,playerid,0,1);
		SetVehicleParamsForPlayer(70,playerid,0,1);
		SetVehicleParamsForPlayer(71,playerid,0,1);
	}
	return 1;
}
public TeamLockDoors(playerid)
{
	if (gdebug >= 1){printf("DEBUG TeamLockDoors(%d)",playerid);}
	new c =0;
	while (c <= 200)
	{
		c++;
		if (gCarLock[c] == 1)
		{
			SetVehicleParamsForPlayer(c,playerid,0,1);
		}
		if (gTeamCarLock[c] == 1)
		{
			if(gTeam[playerid] != 1 && gTeam[playerid] != 3)
			{
				SetVehicleParamsForPlayer(c,playerid,0,1);
			}
			else
			{
				SetVehicleParamsForPlayer(c,playerid,0,0);
			}
		}
		if (gTeamCarLock[c] == 2)
		{
			if(gTeam[playerid] != 2)
			{
				SetVehicleParamsForPlayer(c,playerid,0,1);
			}
			else
			{
				SetVehicleParamsForPlayer(c,playerid,0,0);
			}
		}
		if (gTeamCarLock[c] == 4)
		{
			if(gTeam[playerid] != 4)
			{
				SetVehicleParamsForPlayer(c,playerid,0,1);
			}
			else
			{
				SetVehicleParamsForPlayer(c,playerid,0,0);
			}
		}
		if (gTeamCarLock[c] == 0)
		{
				SetVehicleParamsForPlayer(c,playerid,0,0);
		}
	}
	return 1;
}

public DebugPrint(string[],value1,value2,type)
{
	new formated[256];
	if (gdebug >= 2 && type == 1)
	{
		format(formated, sizeof(formated), "Debug:(%d) %s: %d",value1,string,value2);
		printf("%s",formated);
		SendClientMessageToAll(COLOR_WHITE, formated);
	}
	return 1;
}


public OnPlayerExitVehicle(playerid, vehicleid)
{
	if (gdebug >= 1){printf("DEBUG OnPlayerExitVehicle(%d, %d)", playerid, vehicleid);}
	if (GetPlayerState(playerid) == 1)
	{
		return 1;
	}
	new string[256];
	new ename[MAX_PLAYER_NAME];
	if (vehicleid == stealcar && (MissionActive == 10 || MissionActive == 101))
	{
		GameTextForPlayer(playerid, "~w~Get back in the ~n~~r~Car", 5000, 1);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
			SetVehicleParamsForPlayer(stealcar,i,1,0);
			}
		}
		if (playerid == gSuperCop)
		{
			gSuperCop = 255;
		}
		CheckpointReset();
		MissionActive = 101;
		if (gdebug){print("DEBUG MissionActive = 101");}
	}
	else if (gTeam[playerid] >= 4 && vehicleid == stealcar && MissionActive == 11 && gSuperCop == playerid)
	{
		if (gdebug){print("DEBUG CHECKPOINT_CARDROP");}
		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		GetPlayerName(playerid, ename, sizeof(ename));
		GivePlayerMoney(playerid, reward);
		preward = reward;
		format(string, sizeof(string), "~g~CAR DELIVERED~n~~w~Your were paid ~n~~g~$%d", reward);
		PlayerPlayMusic(playerid);
		GameTextForPlayer(playerid, string, 5000, 6);
		format(string, sizeof(string), "%s Just Sold A Hot Car For $%d.", ename,reward);
		BroadCast(COLOR_YELLOW, string);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				SetVehicleParamsForPlayer(stealcar,i,0,0);
			}
		}
		if (playerid != gPublicEnemy)
		{
			gPlayerMission[playerid] = 3;
			SetPlayerCriminal(playerid,255, "Grand Theft Auto",1,1);
		}
		CheckpointReset();
		SetVehicleToRespawn(stealcar);
		stealcar = -1;
		MissionActive = 12;
		if (gdebug){print("DEBUG MissionActive = 12");}
	}
	else if (gTeam[playerid] == 2 && vehicleid == stealcar && MissionActive == 11 && gSuperCop == playerid)
	{
		if (gdebug){print("DEBUG CHECKPOINT_CARDROP");}
		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		GetPlayerName(playerid, ename, sizeof(ename));
		GivePlayerMoney(playerid, reward);
		PlayerInfo[playerid][pHW]++;
		if(PlayerInfo[playerid][pHW] >= 3)
		{
			PlayerInfo[playerid][pExp]++;
			PlayerInfo[playerid][pHW] = 0;
			SendClientMessage(playerid, COLOR_YELLOW, "You are getting stronger Exp +1");
		}
		format(string, sizeof(string), "~g~CAR RETURNED~n~~w~Bonus Paycheck ~n~~g~$%d", reward);
		PlayerPlayMusic(playerid);
		GameTextForPlayer(playerid, string, 5000, 6);
		format(string, sizeof(string), "Officer %s Just Returned A Stolen Car For $%d.", ename,reward);
		BroadCast(COLOR_YELLOW, string);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				SetVehicleParamsForPlayer(stealcar,i,0,0);
			}
		}
		CheckpointReset();
		SetVehicleToRespawn(stealcar);
		stealcar = -1;
		MissionActive = 12;
		if (gdebug){print("DEBUG MissionActive = 12");}
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	new string[128];
	PlayerInfo[playerid][pModel] = Peds[classid][0];
	if(classid >= 260)
	{
		format(string, sizeof(string), "~b~SAPD~n~ ~r~Objective~w~: Retain Law");
		GameTextForPlayer(playerid,string,3500,6);
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	}
	else if (classid >= 255 && classid <= 259)
	{
			format(string, sizeof(string), "~g~PARAMEDIC~n~~r~Objective~w~: Save Life");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid >= 1 && classid <= 3)
	{
			format(string, sizeof(string), "~p~BALLAS~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid >= 4 && classid <= 6)
	{
			format(string, sizeof(string), "~p~GROVE~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid >= 7 && classid <= 9)
	{
			format(string, sizeof(string), "~p~VAGOS~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid >= 10 && classid <= 12)
	{
			format(string, sizeof(string), "~p~AZTECAS~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid >= 13 && classid <= 15)
	{
			format(string, sizeof(string), "~p~NANG~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
 	else if (classid >= 16 && classid <= 21)
	{
			format(string, sizeof(string), "~p~MAFIA~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid >= 22 && classid <= 24)
	{
			format(string, sizeof(string), "~p~RUSSIAN MAFIA~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid >= 25 && classid <= 27)
	{
			format(string, sizeof(string), "~p~TRIADS~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid >= 28 && classid <= 30)
	{
			format(string, sizeof(string), "~p~BIKERS~n~~r~Objective~w~: Chaos");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else
	{
		format(string, sizeof(string), "~g~CIVILIAN~n~~r~Objective~w~: Live Life");
		GameTextForPlayer(playerid,string,3500,6);
	}
	SetPlayerTeamFromClass(playerid,classid);
	SetupPlayerForClassSelection(playerid);
	TextDrawHideForPlayer(playerid,PE);
	TextDrawHideForPlayer(playerid,LS);
	TextDrawHideForPlayer(playerid,Mode);
	TextDrawHideForPlayer(playerid,Version);
	TextDrawHideForPlayer(playerid,Site);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
	switch (gTeam[playerid])
	{
		case TEAM_BLUE:
		{
			SetPlayerInterior(playerid,5);
			SetPlayerPos(playerid,323.4,305.6,999.1);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid,323.4-1.5,305.6,999.1+0.7);
			SetPlayerCameraLookAt(playerid,323.4,305.6,999.1+0.7);

		}
		case TEAM_CYAN:
		{
			SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,1187.0,-1295.8,13.5);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerCameraPos(playerid,1187.0+1.5,-1295.8,13.5+0.7);
			SetPlayerCameraLookAt(playerid,1187.0,-1295.8,13.5+0.7);
		}
		case TEAM_GREEN:
		{
			SetPlayerInterior(playerid,3);
			SetPlayerPos(playerid,-2654.4,1424.2,912.4);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid,-2654.4-1.5,1424.2,912.4+0.7);
			SetPlayerCameraLookAt(playerid,-2654.4,1424.2,912.4+0.7);
		}
		default:
		{
			/*
			SetPlayerInterior(playerid,2);
			SetPlayerPos(playerid,1216.699000,-6.416779,1001.328000);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid,1216.699000-1.5,-6.416779,1001.328000+0.7);
			SetPlayerCameraLookAt(playerid,1216.699000,-6.416779,1001.328000+0.7);
			*/
			SetPlayerInterior(playerid,3);
			SetPlayerPos(playerid,-2654.4,1424.2,912.4);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid,-2654.4-1.5,1424.2,912.4+0.7);
			SetPlayerCameraLookAt(playerid,-2654.4,1424.2,912.4+0.7);
		}
	}
}

//---------------------------------------------------------

public SetPlayerTeamFromClass(playerid,classid)
{
	if (gdebug >= 2){printf("DEBUG SetPlayerTeamFromClass(%d, %d)", playerid, classid);}
	if(classid >= 260)
	{
		gTeam[playerid] = TEAM_BLUE;
		PlayerInfo[playerid][pTeam] = 2;
	}
	else if (classid >= 255 && classid <= 259)
	{
		gTeam[playerid] = TEAM_CYAN;
		PlayerInfo[playerid][pTeam] = 1;
	}
	else if (classid >= 1 && classid <= 3)
	{
		gTeam[playerid] = TEAM_BALLAS;
		PlayerInfo[playerid][pTeam] = 5;
	}
	else if (classid >= 4 && classid <= 6)
	{
		gTeam[playerid] = TEAM_GROVE;
		PlayerInfo[playerid][pTeam] = 6;
	}
	else if (classid >= 7 && classid <= 9)
	{
		gTeam[playerid] = TEAM_VAGOS;
		PlayerInfo[playerid][pTeam] = 7;
	}
	else if (classid >= 10 && classid <= 12)
	{
		gTeam[playerid] = TEAM_AZTECAS;
		PlayerInfo[playerid][pTeam] = 8;
	}
	else if (classid >= 13 && classid <= 15)
	{
		gTeam[playerid] = TEAM_NANG;
		PlayerInfo[playerid][pTeam] = 9;
	}
 	else if (classid >= 16 && classid <= 21)
	{
		gTeam[playerid] = TEAM_MAFIA;
		PlayerInfo[playerid][pTeam] = 11;
	}
	else if (classid >= 22 && classid <= 24)
	{
		gTeam[playerid] = TEAM_RMAFIA;
		PlayerInfo[playerid][pTeam] = 12;
	}
	else if (classid >= 25 && classid <= 27)
	{
		gTeam[playerid] = TEAM_TRIADS;
		PlayerInfo[playerid][pTeam] = 13;
	}
	else if (classid >= 28 && classid <= 30)
	{
		gTeam[playerid] = TEAM_BIKERS;
		PlayerInfo[playerid][pTeam] = 14;
	}
	else
	{
	    gTeam[playerid] = TEAM_GREEN;
	    PlayerInfo[playerid][pTeam] = 3;
	}
}

//---------------------------------------------------------

public SetPlayerCriminal(playerid,declare,reason[],pe,flash)
{
if (gdebug >= 1){printf("DEBUG SetPlayerCriminal(%d, %d ,%s ,%d ,%d)", playerid,declare,reason,pe,flash);}
	new turned[MAX_PLAYER_NAME];
	new turner[MAX_PLAYER_NAME];
	new turnmes[128];
	//new tmpstring[32];
	//format(tmpstring, sizeof(tmpstring), reason);
	strmid(PlayerCrime[playerid][pAccusedof], reason, 0, strlen(reason), 255);
	GetPlayerName(playerid, turned, sizeof(turned));
	if (declare == 255)
	{
		//print("DEBUG: 4");
		format(turner, sizeof(turner), "Unknown");
		strmid(PlayerCrime[playerid][pVictim], turner, 0, strlen(turner), 255);
	}
	else
	{
		//print("DEBUG: 5");
		GetPlayerName(declare, turner, sizeof(turner));
		strmid(PlayerCrime[playerid][pVictim], turner, 0, strlen(turner), 255);
		strmid(PlayerCrime[declare][pBplayer], turned, 0, strlen(turned), 255);
		strmid(PlayerCrime[declare][pAccusing], reason, 0, strlen(reason), 255);
	}
	if (pe == 1)
	{
		if (gPublicEnemy != INVALID_PLAYER_ID && gPublicEnemy != playerid)
		{
			OffTheHook();
			KillTimer(offhook);
   
	    }
		gPublicEnemy = playerid;
        SetPlayerWorldBounds(gPublicEnemy, 2966.18, -1004.297, 607.2495, -2931.147);
		format(turnmes, sizeof(turnmes), "SMS: %s, You Are Now Public Enemy No.1 For %s. Evade Death For %d Minuites, Sender: MOLE (555)",turned,reason,petime/60000);
		RingTone[playerid] = 20;
		SendClientMessage(playerid, COLOR_YELLOW, turnmes);
		format(cbjstore, sizeof(cbjstore), "HQ: All Units Be On The Lookout For Public Enemy %s",turned);
		SendTeamBeepMessage(2, COLOR_DBLUE, cbjstore);
		format(turnmes, sizeof(turnmes), "HQ: Wanted In Connection With %s, You have %d Minuites.",reason,petime/60000);
		format(objstore, sizeof(objstore), "SMS: Kill That Sucker %s, And Take His Last Payment, Sender: MOLE (555)",turned);
		SendTeamMessage(2, COLOR_DBLUE, turnmes);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && gPublicEnemy != i && gTeam[i] >= 3)
			{
				SendClientMessage(i, COLOR_YELLOW, objstore);
				RingTone[i] = 20;
			}
		}
		SendTeamMessage(2, COLOR_WHITE, "HINT: Hunt Down And Eliminate The Flashing Icon For A Big Reward.");
		offhook = SetTimer("OffTheHook", petime, 0);
	}
    else
    {
		if ((gTeam[playerid]) == 1)//med kill criminal
		{
			format(turnmes, sizeof(turnmes), "WARNING: %s, The Cops Are After You For %s Paramedic Privs Removed Reporter: %s",turned,reason,turner);
		}
		else
		{
			format(turnmes, sizeof(turnmes), "WARNING: %s, The Cops Are After You For %s. Reporter: %s",turned,reason,turner);
		}
		gTeam[playerid] = 4;//lawbreaker
		if (flash)
		{
			FlashTime[playerid] = 10;
		}
		else
		{
			SetPlayerToTeamColor(playerid);
		}
		SendClientMessage(playerid, COLOR_RED, turnmes);
	}
			print("DEBUG: 5");
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && (gTeam[i]) == 2 && gPublicEnemy != playerid)
		{
			format(cbjstore, sizeof(turnmes), "HQ: All Units APB: Reporter: %s",turner);
			SendClientMessage(i, TEAM_BLUE_COLOR, cbjstore);
			format(cbjstore, sizeof(turnmes), "HQ: Crime: %s, Suspect: %s",reason,turned);
			SendClientMessage(i, TEAM_BLUE_COLOR, cbjstore);
		}
	}
}
//---------------------------------------------------------

public SetPlayerFree(playerid,declare,reason[],pe,flash)
{
if (gdebug >= 1){printf("DEBUG SetPlayerFree(%d, %d ,%d ,%d)", playerid,declare,pe,flash);}
	ClearCrime(playerid);
	new turned[MAX_PLAYER_NAME];
	new turner[MAX_PLAYER_NAME];
	new turnmes[128];
	new crbjstore[128];
	if (declare == 255)
	{
		format(turner, sizeof(turner), "911");
	}
	else
	{
		GetPlayerName(declare, turner, sizeof(turner));
	}
	GetPlayerName(playerid, turned, sizeof(turned));
	if (PlayerInfo[playerid][pTeam] == 1)
	{
		gTeam[playerid] = 1;
	}
	else
	{
		gTeam[playerid] = 3;
	}
	if (flash)
	{
		FlashTime[playerid] = 10;
	}
	else
	{
		SetPlayerToTeamColor(playerid);
	}
	format(turnmes, sizeof(turnmes), "SMS: %s, Because You %s, You Are No Longer A Criminal, Sender: MOLE (555)",turned,reason);
	RingTone[playerid] = 20;
	SendClientMessage(playerid, COLOR_YELLOW, turnmes);
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && (gTeam[i]) == 2)
		{
			format(crbjstore, sizeof(crbjstore), "HQ: All Units Officer %s Has Completed Assignment",turner);
			SendClientMessage(i, COLOR_DBLUE, crbjstore);
			format(crbjstore, sizeof(crbjstore), "HQ: %s Has Been Processed, %s",turned,reason);
			SendClientMessage(i, COLOR_DBLUE, crbjstore);
		}
	}
}
public OffTheHook()
{
if (gdebug >= 1){printf("DEBUG OffTheHook()");}
	new hookoff[128];
	new offhookn[MAX_PLAYER_NAME];
	new mission = gPlayerMission[gPublicEnemy];
	if(mission == 4)
	{
		mission = random(3)+1;
	}
	switch (mission)
	{
		case 1:
		{
			PlayerInfo[gPublicEnemy][pCB]++;
			if(PlayerInfo[gPublicEnemy][pCB] >= 4)
			{
				PlayerInfo[gPublicEnemy][pExp]++;
				PlayerInfo[gPublicEnemy][pCB] = 0;
				SendClientMessage(gPublicEnemy, COLOR_YELLOW, "You are getting stronger Exp +1");
			}
		}
		case 2:
		{
			PlayerInfo[gPublicEnemy][pSR]++;
			if(PlayerInfo[gPublicEnemy][pSR] >= 4)
			{
				PlayerInfo[gPublicEnemy][pExp]++;
				PlayerInfo[gPublicEnemy][pSR] = 0;
				SendClientMessage(gPublicEnemy, COLOR_YELLOW, "You are getting stronger Exp +1");
			}
		}
		case 3:
		{
			PlayerInfo[gPublicEnemy][pHW]++;
			if(PlayerInfo[gPublicEnemy][pHW] >= 4)
			{
				PlayerInfo[gPublicEnemy][pExp]++;
				PlayerInfo[gPublicEnemy][pHW] = 0;
				SendClientMessage(gPublicEnemy, COLOR_YELLOW, "You are getting stronger Exp +1");
			}
		}
		default:
		{
		}
	}
	SetPlayerToTeamColor(gPublicEnemy);
	GetPlayerName(gPublicEnemy, offhookn, sizeof(offhookn));
	format(hookoff, sizeof(hookoff), "NEWSFLASH: %s Has Evaded The Police And Is No Longer Public Enemy No.1",offhookn);
	RingTone[gPublicEnemy] = 20;
	SendClientMessageToAll(COLOR_PURPLE, hookoff);
	gPublicEnemy = INVALID_PLAYER_ID;
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	SetPlayerWorldBounds(i, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	}
	return 1;
}

public CellPhoneTimer()
{
if (gdebug >= 3){printf("DEBUG CellPhoneTimer()");}
new string[64];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(CellTime[i] > 0)
			{
				if (CellTime[i] == cchargetime)
				{
					CellTime[i] = 1;
					if(Mobile[Mobile[i]] == i)
					{
						CallCost[i] = CallCost[i]+callcost;
					}
				}
				//printf("CellTime %d %d",i,CellTime[i]);
				CellTime[i] = CellTime[i] +1;
				//printf("callers line %d called %d caller %d",Mobile[Mobile[i]],Mobile[i],i);
				if (Mobile[Mobile[i]] == 255 && CellTime[i] == 5)
				{
					new called[MAX_PLAYER_NAME];
					GetPlayerName(Mobile[i], called, sizeof(called));
					format(string, sizeof(string), "* %s's phone rings.", called);
					RingTone[Mobile[i]] = 10;
					ProxDetector(30.0, Mobile[i], string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
			}
			if(CellTime[i] == 0 && CallCost[i] > 0)
			{
				format(string, sizeof(string), "~w~The call cost~n~~r~$%d",CallCost[i]);
				GivePlayerMoney(i, -CallCost[i]);
				BizzInfo[10][bTakings] += CallCost[i];
				GameTextForPlayer(i, string, 5000, 1);
				CallCost[i] = 0;
			}

		}
	}
}

public SetPlayerFlash()
{
//if (gdebug >= 2){printf("DEBUG SetPlayerFlash()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if (gPublicEnemy == i || gSuperCop == i)
		{
			FlashTime[i] = 3;
		}
		if(IsPlayerConnected(i) == 1 && FlashTime[i] > 0)
		{
			//printf("flashtime %d %d",i,FlashTime[i]);
			FlashTime[i]--;
			SetPlayerToTeamColorFlash(i);
		}
	}
	SetTimer("SetPlayerFlashRev", 1000, 0);
	return 1;
}

public SetPlayerFlashRev()
{
//if (gdebug >= 2){printf("DEBUG SetPlayerFlashRev()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && FlashTime[i] > 1)
		{
			FlashTime[i]--;
			//printf("flashtime %d %d",i,FlashTime[i]);
			SetPlayerColor(i,COLOR_INVIS); // invisibil
		}
	}
	SetTimer("SetPlayerFlash", 1000, 0);
	return 1;
}


public RingToner()
{
//if (gdebug >= 2){printf("DEBUG RingToner()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && RingTone[i] != 6 && RingTone[i] != 0 && RingTone[i] < 11)
		{
			//printf("RingTone %d %d",i,RingTone[i]);
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1138, 0.0, 0.0, 0.0);
		}
		if(IsPlayerConnected(i) == 1 && RingTone[i] == 6)
		{
			RingTone[i] = RingTone[i] -1;
		}
		if(IsPlayerConnected(i) == 1 && RingTone[i] == 20)
		{
			//printf("RingTone %d %d",i,RingTone[i]);
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1139, 0.0, 0.0, 0.0);
		}
	}
	//RingTonerRev();
	SetTimer("RingTonerRev", 200, 0);
	return 1;
}

public RingTonerRev()
{
//if (gdebug >= 2){printf("DEBUG SetPlayerFlashRev()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1  && RingTone[i] != 5 && RingTone[i] != 0 && RingTone[i] < 10)
		{
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1137, 0.0, 0.0, 0.0);
		}
		if(IsPlayerConnected(i) == 1 && RingTone[i] == 5)
		{
			RingTone[i] = RingTone[i] -1;
		}
		if(IsPlayerConnected(i) == 1 && RingTone[i] == 19)
		{
			//printf("RingTone %d %d",i,RingTone[i]);
			PlayerPlaySound(i, 1139, 0.0, 0.0, 0.0);
			RingTone[i] = 0;
		}
	}
	SetTimer("RingToner", 500, 0);
	return 1;
}

public SetPlayerUnjail()
{
if (gdebug >= 3){printf("DEBUG SetPlayerUnjail()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && JailTime[i] < 0)
		{
			JailTime[i]++;
			//printf("JailTime %d %d",i,JailTime[i]);
		}
		if(IsPlayerConnected(i) == 1 && JailTime[i] > 0)
		{
			JailTime[i]--;
			//printf("JailTime %d %d",i,JailTime[i]);
		}
		if(IsPlayerConnected(i) == 1 && JailTime[i] == 10)
		{
			new string[128];
			//printf("JailTime %d %d",i,JailTime[i]);
			FlashTime[i] = 0;
			SetPlayerPos(i,268.3,77.4,1001.0);
			SendClientMessage(i, COLOR_GRAD1,"   You have paid your debt to society.");
			format(string, sizeof(string), "~g~Freedom~n~~w~Try to be a better citizen");
			GameTextForPlayer(i, string, 5000, 1);
			PlayJailSound(1165 , 1166, 1000,264.395200, 77.564040, 1001.039000);
		}
	}
}

public VoteKickTimer()
{
if (gdebug >= 3){printf("DEBUG VoteKickTimer()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && VoteKick[i] > 0)
		{
			VoteKick[i]++;
			//printf("VoteKick %d VoteKick[%d] KickVote[%d]",i,VoteKick[i],KickVote[i]);
			if(IsPlayerConnected(i) == 1 && VoteKick[i] == 20)
			{
				if(KickVote[i] >= numplayers/4)
				{
					new string[128];
					new accused[MAX_PLAYER_NAME];
					GetPlayerName(i, accused, sizeof(accused));
					format(string, sizeof(string), "VOTE SUCCESS: %s has been voted out of the server",accused);
					BroadCast(COLOR_RED,string);
					ClearVote(i);
					Kick(i);
				}
				else
				{
					new string[128];
					new accused[MAX_PLAYER_NAME];
					GetPlayerName(i, accused, sizeof(accused));
					format(string, sizeof(string), "VOTE FAILED: %s will not be kicked",accused);
					BroadCast(COLOR_RED,string);
					ClearVote(i);
				}
			}
		}
	}
}

public ClearVote(kickedid)
{
	KickVote[kickedid] = 0;
	VoteKick[kickedid] = 0;
	for(new j = 0; j <= MAX_PLAYERS; j++)
	{
		if(IsPlayerConnected(j) == 1 && LastVote[j] == kickedid)
		{
			LastVote[j] = 255;
		}
	}
}



public SetPlayerWeapons(playerid)
{
	if (gdebug >= 1){printf("DEBUG SetPlayerWeapons(%d)",playerid);}
	//ResetPlayerWeapons(playerid);
	if(PlayerInfo[playerid][pGun1] == 0)
	{
    PlayerInfo[playerid][pGun1] = 24;
    }
	if (PlayerInfo[playerid][pGun1] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun1], PlayerInfo[playerid][pAmmo1]);
	}
	if(gTeam[playerid] == 1)
	{
		GivePlayerWeapon(playerid, 4, 0);
	}
	if(gTeam[playerid] == 2)
	{
		GivePlayerWeapon(playerid, 3, 0);
		//GivePlayerWeapon(playerid, 41, 500); //spray
	}
	if(gTeam[playerid] >= 3)
	{
		GivePlayerWeapon(playerid, 32, 100);
	}
	if (PlayerInfo[playerid][pGun2] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun2], PlayerInfo[playerid][pAmmo2]);
	}
	if (PlayerInfo[playerid][pGun3] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun3], PlayerInfo[playerid][pAmmo3]);
	}
	if (PlayerInfo[playerid][pGun4] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun4], PlayerInfo[playerid][pAmmo4]);
	}
	if (PlayerInfo[playerid][pGun5] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun5], PlayerInfo[playerid][pAmmo5]);
	}
	if (PlayerInfo[playerid][pGun6] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun6], PlayerInfo[playerid][pAmmo6]);
	}
}

public PrintSBizInfo(playerid,targetid)
{
	new coordsstring[256];
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	format(coordsstring, sizeof(coordsstring),"*** %s ***",SBizzInfo[targetid][sbDiscription]);
	SendClientMessage(playerid, COLOR_WHITE,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Locked: %d EntryFee: $%d Till: $%d", SBizzInfo[targetid][sbLock], SBizzInfo[targetid][sbEntcost], SBizzInfo[targetid][sbTakings]);
	SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Product: %d/%d Components: %d/%d", SBizzInfo[targetid][sbProd],SBizzInfo[targetid][sbProdCap],SBizzInfo[targetid][sbComp],SBizzInfo[targetid][sbCompCap]);
	SendClientMessage(playerid, COLOR_GRAD2,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Products Per Component: %d Paying $%d",SBizzInfo[targetid][sbProdCost],SBizzInfo[targetid][sbPayComp]);
	SendClientMessage(playerid, COLOR_GRAD3,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Product Cost $%d",(SBizzInfo[targetid][sbPayComp]/SBizzInfo[targetid][sbProdCost]));
	SendClientMessage(playerid, COLOR_GRAD4,coordsstring);
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
}

public PrintBizInfo(playerid,targetid)
{
	new coordsstring[256];
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	format(coordsstring, sizeof(coordsstring),"*** %s ***",BizzInfo[targetid][bDiscription]);
	SendClientMessage(playerid, COLOR_WHITE,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Locked: %d EntryFee: $%d Till: $%d", BizzInfo[targetid][bLock], BizzInfo[targetid][bEntcost], BizzInfo[targetid][bTakings]);
	SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Product: %d/%d Components: %d/%d", BizzInfo[targetid][bProd],BizzInfo[targetid][bProdCap],BizzInfo[targetid][bComp],BizzInfo[targetid][bCompCap]);
	SendClientMessage(playerid, COLOR_GRAD2,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Products Per Component: %d Paying $%d",BizzInfo[targetid][bProdCost],BizzInfo[targetid][bPayComp]);
	SendClientMessage(playerid, COLOR_GRAD3,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Product Cost $%d PriceMod %d%",(BizzInfo[targetid][bPayComp]/BizzInfo[targetid][bProdCost]), BizzInfo[targetid][bPriceMod]);
	SendClientMessage(playerid, COLOR_GRAD4,coordsstring);
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
}

public PrintPlayerWeapons(playerid,targetid)
{
	if (gdebug >= 1){printf("DEBUG PrintPlayerWeapons(%d %d)",playerid,targetid);}
	new cash =  GetPlayerMoney(targetid);
	new level = PlayerInfo[targetid][pLevel];
	new exp = PlayerInfo[targetid][pExp];
	new gun1 = PlayerInfo[targetid][pGun1];
	new gun2 = PlayerInfo[targetid][pGun2];
	new gun3 = PlayerInfo[targetid][pGun3];
	new gun4 = PlayerInfo[targetid][pGun4];
	new gun5 = PlayerInfo[targetid][pGun5];
	new gun6 = PlayerInfo[targetid][pGun6];
	new ammo1 = PlayerInfo[targetid][pAmmo1];
	new ammo2 = PlayerInfo[targetid][pAmmo2];
	new ammo3 = PlayerInfo[targetid][pAmmo3];
	new ammo4 = PlayerInfo[targetid][pAmmo4];
	new ammo5 = PlayerInfo[targetid][pAmmo5];
	new ammo6 = PlayerInfo[targetid][pAmmo6];
	new kills = PlayerInfo[targetid][pKills];
	new pcb = PlayerInfo[targetid][pCB];
	new phw = PlayerInfo[targetid][pHW];
	new psr = PlayerInfo[targetid][pSR];
	new pwa = PlayerInfo[targetid][pWA] ;
	new ppen = PlayerInfo[targetid][pPEN];
	new pnumber = PlayerInfo[targetid][pPnumber];
	new account = PlayerInfo[targetid][pAccount];
	new nxtlevel = PlayerInfo[targetid][pLevel]+1;
	new expamount = nxtlevel*levelexp;
	new costlevel = nxtlevel*levelcost;//10k for testing purposes
	new housekey = PlayerInfo[targetid][pPhousekey];
	new bizkey = PlayerInfo[targetid][pPbiskey];
	new intir = PlayerInfo[playerid][pInt];
	new local = PlayerInfo[playerid][pLocal];
	new Float:shealth = PlayerInfo[targetid][pSHealth];
	new Float:health;
	new name[MAX_PLAYER_NAME];
	new sgun1[20];
	new sgun2[20];
	new sgun3[20];
	new sgun4[20];
	new sgun5[20];
	new sgun6[20];
	GetWeaponName(gun1, sgun1, 20);
	GetWeaponName(gun2, sgun2, 20);
	GetWeaponName(gun3, sgun3, 20);
	GetWeaponName(gun4, sgun4, 20);
	GetWeaponName(gun5, sgun5, 20);
	GetWeaponName(gun6, sgun6, 20);
	GetPlayerName(targetid, name, sizeof(name));
	GetPlayerHealth(targetid,health);
	new Float:px,Float:py,Float:pz;
	GetPlayerPos(targetid, px, py, pz);
	new coordsstring[256];
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	format(coordsstring, sizeof(coordsstring),"*** %s ***",name);
	SendClientMessage(playerid, COLOR_WHITE,coordsstring);
	format(coordsstring, sizeof(coordsstring), "PlayerLevel: [%d] SpawnHealth: %.1f Cash: [$%d] Bank: [$%d] Ph: [%d]", level, shealth+50, cash, account, pnumber);
	SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Weapons: %s %s %s %s %s %s", sgun1,sgun2,sgun3,sgun4,sgun5,sgun6);
	SendClientMessage(playerid, COLOR_GRAD2,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Ammo1: [%d] Ammo2: [%d] Ammo3: [%d] Ammo4: [%d] Ammo5: [%d] Ammo6: [%d]", ammo1,ammo2,ammo3,ammo4,ammo5,ammo6);
	SendClientMessage(playerid, COLOR_GRAD3,coordsstring);
	if (stats)
	{
		format(coordsstring, sizeof(coordsstring), "CashBox: [%d/4] HotWire: [%d/4] StreetRace: [%d/4] Service: [%d/20] ",pcb,phw,psr,pwa);
		SendClientMessage(playerid, COLOR_GRAD4,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Kills: [%d/30] PENo.1 Kills: [%d/4]  NextLevel: [$%d] Exp: [%d/%d]",kills,ppen,costlevel,exp,expamount);
		SendClientMessage(playerid, COLOR_GRAD5,coordsstring);
	}
	if (IsPlayerAdmin(playerid) || PlayerInfo[playerid][pAdmin] >= 1)
	{
		format(coordsstring, sizeof(coordsstring), "House key [%d] Business key [%d] HireKey [%d] int:[%d] local[%d]", housekey,bizkey,HireCar[targetid],intir,local);
		SendClientMessage(playerid, COLOR_GRAD6,coordsstring);
	}
}
//---------------------------------------------------------

public SetPlayerToTeamColor(playerid)
{
	if(gTeam[playerid] == TEAM_GREEN)
	{
		SetPlayerColor(playerid,TEAM_GREEN_COLOR); // red
	}
	else if(gTeam[playerid] == TEAM_BLUE)
	{
	    SetPlayerColor(playerid,TEAM_BLUE_COLOR); // blue
	}
	else if(gTeam[playerid] == TEAM_ORANGE)
	{
	    SetPlayerColor(playerid,TEAM_ORANGE10_COLOR); // blue
	}
	else if(gTeam[playerid] == TEAM_BALLAS)
	{
	    SetPlayerColor(playerid,TEAM_BALLAS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_GROVE)
	{
	    SetPlayerColor(playerid,TEAM_GROVE10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_VAGOS)
	{
	    SetPlayerColor(playerid,TEAM_VAGOS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_AZTECAS)
	{
	    SetPlayerColor(playerid,TEAM_AZTECAS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_NANG)
	{
	    SetPlayerColor(playerid,TEAM_NANG10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_RIFA)
	{
	    SetPlayerColor(playerid,TEAM_RIFA10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_MAFIA)
	{
	    SetPlayerColor(playerid,TEAM_MAFIA10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_RMAFIA)
	{
	    SetPlayerColor(playerid,TEAM_RMAFIA10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_TRIADS)
	{
	    SetPlayerColor(playerid,TEAM_TRIADS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_BIKERS)
	{
	    SetPlayerColor(playerid,TEAM_BIKERS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_CYAN)
	{
	    SetPlayerColor(playerid,TEAM_CYAN_COLOR); // blue
	}
}

public SetPlayerToTeamColorFlash(playerid)
{
	if(gTeam[playerid] == TEAM_GREEN)
	{
		SetPlayerColor(playerid,TEAM_GREEN_COLOR); // red
	}
	else if(gTeam[playerid] == TEAM_BLUE)
	{
	    SetPlayerColor(playerid,TEAM_BLUE_COLOR); // blue
	}
	else if(gTeam[playerid] == TEAM_ORANGE)
	{
	    SetPlayerColor(playerid,TEAM_ORANGE_COLOR); // blue
	}
	else if(gTeam[playerid] == TEAM_BALLAS)
	{
	    SetPlayerColor(playerid,TEAM_BALLAS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_GROVE)
	{
	    SetPlayerColor(playerid,TEAM_GROVE_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_VAGOS)
	{
	    SetPlayerColor(playerid,TEAM_VAGOS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_AZTECAS)
	{
	    SetPlayerColor(playerid,TEAM_AZTECAS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_NANG)
	{
	    SetPlayerColor(playerid,TEAM_NANG_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_RIFA)
	{
	    SetPlayerColor(playerid,TEAM_RIFA_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_MAFIA)
	{
	    SetPlayerColor(playerid,TEAM_MAFIA_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_RMAFIA)
	{
	    SetPlayerColor(playerid,TEAM_RMAFIA_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_TRIADS)
	{
	    SetPlayerColor(playerid,TEAM_TRIADS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_BIKERS)
	{
	    SetPlayerColor(playerid,TEAM_BIKERS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_CYAN)
	{
	    SetPlayerColor(playerid,TEAM_CYAN_COLOR); // blue
	}
}

//---------------------------------------------------------

public GameModeInitExitFunc()
{
	if (gdebug >= 1){printf("DEBUG GameModeInitExitFunc()");}
	new string[128];
	format(string, sizeof(string), "Traveling...");
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			DisablePlayerCheckpoint(i);
			gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
			if (gdebug){print("DEBUG CHECKPOINT_NONE3");}
			GameTextForPlayer(i, string, 4000, 5);
			if (gdebug){printf("DEBUG %s", string);}
			SetPlayerCameraPos(i,1460.0, -1324.0, 287.2);
			SetPlayerCameraLookAt(i,1374.5, -1291.1, 239.0);
			OnUpdatePlayer(i);
			gPlayerLogged[i] = 0;
		}
	}
	SetTimer("GameModeExitFunc", 4000, 0);
	return 1;
}

public GameModeExitFunc()
{
	KillTimer(synctimer);
	KillTimer(newmistimer);
	KillTimer(unjailtimer);
	KillTimer(playertimer);
	KillTimer(cartimer);
	KillTimer(celltimer);
	GameModeExit();
}

//--------------------------------Config--------------------------------------------------------------
public LoadConfig()
{
	if (gdebug){print("DEBUG is on");}
	new valtmp[128];
	new File: file = fopen("Gamemode/pen01.cfg", io_read);
	fread(file, valtmp);strmid(motd, valtmp, 0, strlen(valtmp)-1, 255);
	fread(file, valtmp);GetVal(valtmp);fow = RetVal;
	fread(file, valtmp);GetVal(valtmp);radardist = RetVal;
	fread(file, valtmp);GetVal(valtmp);radarfreq = RetVal;
	fread(file, valtmp);GetVal(valtmp);addtimer = RetVal*1000;
	fread(file, valtmp);GetVal(valtmp);stats = RetVal;
	fread(file, valtmp);GetVal(valtmp);dollah = RetVal;
	fread(file, valtmp);GetVal(valtmp);realtime = RetVal;
	fread(file, valtmp);GetVal(valtmp);timeshift = RetVal;
	fread(file, valtmp);GetVal(valtmp);wtime = RetVal;
	fread(file, valtmp);GetVal(valtmp);gRoundTime = RetVal*60000;
	fread(file, valtmp);GetVal(valtmp);cashbox = RetVal;
	fread(file, valtmp);GetVal(valtmp);streetrace = RetVal;
	fread(file, valtmp);GetVal(valtmp);hotwire = RetVal;
	fread(file, valtmp);GetVal(valtmp);levelcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);basedcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);deathcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);suecost = RetVal;
	fread(file, valtmp);GetVal(valtmp);paycheck = RetVal;
	fread(file, valtmp);GetVal(valtmp);jobdelay = RetVal;
	fread(file, valtmp);GetVal(valtmp);petime = RetVal*60000;
	fread(file, valtmp);GetVal(valtmp);realchat = RetVal;
	fread(file, valtmp);GetVal(valtmp);forceteam = RetVal;
	fread(file, valtmp);GetVal(valtmp);cchargetime = RetVal;
	fread(file, valtmp);GetVal(valtmp);callcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);txtcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);jailtime = RetVal;
	fread(file, valtmp);GetVal(valtmp);intrate = RetVal;
	fread(file, valtmp);GetVal(valtmp);teamcarlock = RetVal;
	fread(file, valtmp);GetVal(valtmp);levelexp = RetVal;
	fread(file, valtmp);GetVal(valtmp);nocasino = RetVal;
	fread(file, valtmp);GetVal(valtmp);automission = RetVal;
	fread(file, valtmp);GetVal(valtmp);civnokill = RetVal;
	fread(file, valtmp);GetVal(valtmp);accountplay = RetVal;
	fread(file, valtmp);GetVal(valtmp);mediccharge = RetVal;
	fclose(file);
}
//------------------------------------------------------------------------------------------------------
public GetVal(string[])
{
	new tmp[32];
	new idx;
	tmp = strtok(string, idx);
	tmp = strtok(string, idx);
	RetVal = strval(tmp);
	strmid(string, string, 0, strlen(string)-1, 255);
	printf("%s",string);
}

public SaveRace(playerid,name[])
{
		new coordsstring[256];
		new racename[64];
		new makername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, makername, sizeof(makername));
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%s,%s,%d,%d",
		RaceInfo[rStartx],
		RaceInfo[rStarty],
		RaceInfo[rStartz],
		RaceInfo[rMidx],
		RaceInfo[rMidy],
		RaceInfo[rMidz],
		RaceInfo[rMid2x],
		RaceInfo[rMid2y],
		RaceInfo[rMid2z],
		RaceInfo[rEndx],
		RaceInfo[rEndy],
		RaceInfo[rEndz],
		makername,
		"none",
		0,
		RaceInfo[rLaps]);
		format(racename, sizeof(racename), "Race/%s.race",name);
		new File: file2 = fopen(racename, io_write);
		fwrite(file2, coordsstring);
		fclose(file2);
		format(coordsstring, sizeof(coordsstring), "%s Race Saved",name);
		SendClientMessage(playerid, COLOR_GREEN,coordsstring);
		return 1;
}

public BestTime(name[])
{
	print("BestTime");
		new coordsstring[256];
		new racename[64];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%s,%s,%d,%d",
		RaceInfo[rStartx],
		RaceInfo[rStarty],
		RaceInfo[rStartz],
		RaceInfo[rMidx],
		RaceInfo[rMidy],
		RaceInfo[rMidz],
		RaceInfo[rMid2x],
		RaceInfo[rMid2y],
		RaceInfo[rMid2z],
		RaceInfo[rEndx],
		RaceInfo[rEndy],
		RaceInfo[rEndz],
		RaceInfo[rName],
		RaceInfo[rBest],
		RaceInfo[rBestms],
		RaceInfo[rLaps]);
		format(racename, sizeof(racename), "Race/%s.race",name);
		new File: file2 = fopen(racename, io_write);
		fwrite(file2, coordsstring);
		fclose(file2);
		return 1;
}

public LoadTmp()
{
	new arrCoords[4][64];
	new strFromFile2[64];
	new File: file = fopen("Gamemode/tmppos.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(Teletmp))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			Teletmp[idx][pTmpposx] = floatstr(arrCoords[0]);
			Teletmp[idx][pTmpposy] = floatstr(arrCoords[1]);
			Teletmp[idx][pTmpposz] = floatstr(arrCoords[2]);
			Teletmp[idx][pTmpint] = strval(arrCoords[3]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}


public LoadRace(playerid,name[])
{
	if (gdebug >= 1){printf("DEBUG Loadrace(%d,%s)",playerid,name);}
	new arrCoords[16][64];
	new strFromFile2[256];
	new racename[64];
	strmid(CurrentRace, name, 0, strlen(name), 255);
	format(racename, sizeof(racename), "Race/%s.race",name);
	new File: file = fopen(racename, io_read);
	if (file)
	{
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		RaceInfo[rStartx] = floatstr(arrCoords[0]);
		RaceInfo[rStarty] = floatstr(arrCoords[1]);
		RaceInfo[rStartz] = floatstr(arrCoords[2]);
		RaceInfo[rMidx] = floatstr(arrCoords[3]);
		RaceInfo[rMidy] = floatstr(arrCoords[4]);
		RaceInfo[rMidz] = floatstr(arrCoords[5]);
		RaceInfo[rMid2x] = floatstr(arrCoords[6]);
		RaceInfo[rMid2y] = floatstr(arrCoords[7]);
		RaceInfo[rMid2z] = floatstr(arrCoords[8]);
		RaceInfo[rEndx] = floatstr(arrCoords[9]);
		RaceInfo[rEndy] = floatstr(arrCoords[10]);
		RaceInfo[rEndz] = floatstr(arrCoords[11]);
		strmid(RaceInfo[rName], arrCoords[12], 0, strlen(arrCoords[12]), 255);
		strmid(RaceInfo[rBest], arrCoords[13], 0, strlen(arrCoords[13]), 255);
		RaceInfo[rBestms] = strval(arrCoords[14]);
		RaceInfo[rLaps] = strval(arrCoords[15]);
		rsx = RaceInfo[rStartx];rsy = RaceInfo[rStarty];rsz =RaceInfo[rStartz];
		rmx = RaceInfo[rMidx];rmy = RaceInfo[rMidy];rmz = RaceInfo[rMidz];
		rm2x = RaceInfo[rMid2x];rm2y = RaceInfo[rMid2y];rm2z = RaceInfo[rMid2z];
		rex = RaceInfo[rEndx];rey = RaceInfo[rEndy];rez = RaceInfo[rEndz];
		fclose(file);
		format(strFromFile2, sizeof(strFromFile2), "%s Race Loaded",name);
		ConvertTicks(RaceInfo[rBestms]);
		SendClientMessage(playerid, COLOR_GREEN,strFromFile2);
		if(RaceInfo[rLaps] > 0)
		{
			format(strFromFile2, sizeof(strFromFile2), "Next Race: %s, By : %s | BestTime: %s : %d:%d:%d Laps: %d",name,RaceInfo[rName],RaceInfo[rBest],cmins,csecs,cmils,RaceInfo[rLaps]);
		}
		else
		{
			format(strFromFile2, sizeof(strFromFile2), "Next Race: %s, By : %s | BestTime: %s : %d:%d:%d",name,RaceInfo[rName],RaceInfo[rBest],cmins,csecs,cmils);
		}
		SendEnemyMessage(COLOR_GREEN, strFromFile2);
		randomrace = 0;
	}
	else
	{
		if(playerid != 255)
		{
			SendClientMessage(playerid, COLOR_GREEN,"File not found");
		}
	}
	return 1;
}

public LoadProperty()
{
	new arrCoords[29][64];
	new strFromFile2[256];
	new File: file = fopen("Gamemode/property.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(HouseInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			HouseInfo[idx][hEntrancex] = floatstr(arrCoords[0]);
			HouseInfo[idx][hEntrancey] = floatstr(arrCoords[1]);
			HouseInfo[idx][hEntrancez] = floatstr(arrCoords[2]);
			HouseInfo[idx][hExitx] = floatstr(arrCoords[3]);
			HouseInfo[idx][hExity] = floatstr(arrCoords[4]);
			HouseInfo[idx][hExitz] = floatstr(arrCoords[5]);
			HouseInfo[idx][hHealthx] = strval(arrCoords[6]);
			HouseInfo[idx][hHealthy] = strval(arrCoords[7]);
			HouseInfo[idx][hHealthz] = strval(arrCoords[8]);
			HouseInfo[idx][hArmourx] = strval(arrCoords[9]);
			HouseInfo[idx][hArmoury] = strval(arrCoords[10]);
			HouseInfo[idx][hArmourz] = strval(arrCoords[11]);
			strmid(HouseInfo[idx][hOwner], arrCoords[12], 0, strlen(arrCoords[12]), 255);
			strmid(HouseInfo[idx][hDiscription], arrCoords[13], 0, strlen(arrCoords[13]), 255);
			HouseInfo[idx][hValue] = strval(arrCoords[14]);
			HouseInfo[idx][hHel] = strval(arrCoords[15]);
			HouseInfo[idx][hArm] = strval(arrCoords[16]);
			HouseInfo[idx][hInt] = strval(arrCoords[17]);
			HouseInfo[idx][hLock] = strval(arrCoords[18]);
			HouseInfo[idx][hOwned] = strval(arrCoords[19]);
			HouseInfo[idx][hRooms] = strval(arrCoords[20]);
			HouseInfo[idx][hRent] = strval(arrCoords[21]);
			HouseInfo[idx][hRentabil] = strval(arrCoords[22]);
			HouseInfo[idx][hTakings] = strval(arrCoords[23]);
			HouseInfo[idx][hVec] = strval(arrCoords[24]);
  	        if(HouseInfo[idx][hVec] == 457)
			{
				HouseInfo[idx][hVec] = 411;
			}
			HouseInfo[idx][hVcol1] = strval(arrCoords[25]);
			HouseInfo[idx][hVcol2] = strval(arrCoords[26]);
			HouseInfo[idx][hDate] = strval(arrCoords[27]);
			HouseInfo[idx][hLevel] = strval(arrCoords[28]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}

public LoadDM(playerid,name[])
{
	new arrCoords[4][64];
	new strFromFile2[256];
	new dmname[64];
	format(dmname, sizeof(dmname), "Deathmatch/%s.dm",name);
	new File: file = fopen(dmname, io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(gRandomDMSpawns))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			gRandomDMSpawns[idx][0] = floatstr(arrCoords[0]);
			gRandomDMSpawns[idx][1] = floatstr(arrCoords[1]);
			gRandomDMSpawns[idx][2] = floatstr(arrCoords[2]);
			idx++;
		}
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		gDMWbounds[0] = floatstr(arrCoords[0]);
		gDMWbounds[1] = floatstr(arrCoords[1]);
		gDMWbounds[2] = floatstr(arrCoords[2]);
		gDMWbounds[3] = floatstr(arrCoords[3]);
		fclose(file);
		format(strFromFile2, sizeof(strFromFile2), "Next DM: %s",name);
		SendClientMessageToAll(COLOR_GREEN, strFromFile2);
	}
	else
	{
		if(playerid != 255)
		{
			SendClientMessage(playerid, COLOR_GREEN,"File not found");
		}
	}
	return 1;
}

public SaveDM(playerid,name[])
{
		new coordsstring[256];
		new racename[64];
		format(racename, sizeof(racename), "Deathmatch/%s.dm",name);
		new File: file2 = fopen(racename, io_write);
		new idx;
		while (idx < sizeof(gRandomDMSpawns))
		{
			format(coordsstring, sizeof(coordsstring), "%f,%f,%f\n",gRandomDMSpawns[idx][0],gRandomDMSpawns[idx][1],gRandomDMSpawns[idx][2]);
			fwrite(file2, coordsstring);
			idx++;
		}
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f\n",gDMWbounds[0],gDMWbounds[1],gDMWbounds[2],gDMWbounds[3]);
		fwrite(file2, coordsstring);
		fclose(file2);
		format(coordsstring, sizeof(coordsstring), "%s DM Saved",name);
		SendClientMessage(playerid, COLOR_GREEN,coordsstring);
		return 1;
}

public LoadRaceList(playerid,name[])
{
	new arrCoords[4][64];
	new strFromFile2[256];
	new dmname[64];
	format(dmname, sizeof(dmname), "Deathmatch/%s.dm",name);
	new File: file = fopen(dmname, io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(gRandomDMSpawns))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			gRandomDMSpawns[idx][0] = floatstr(arrCoords[0]);
			gRandomDMSpawns[idx][1] = floatstr(arrCoords[1]);
			gRandomDMSpawns[idx][2] = floatstr(arrCoords[2]);
			idx++;
		}
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		gDMWbounds[0] = floatstr(arrCoords[0]);
		gDMWbounds[1] = floatstr(arrCoords[1]);
		gDMWbounds[2] = floatstr(arrCoords[2]);
		gDMWbounds[3] = floatstr(arrCoords[3]);
		fclose(file);
		format(strFromFile2, sizeof(strFromFile2), "Next DM: %s",name);
		SendClientMessageToAll(COLOR_GREEN, strFromFile2);
	}
	else
	{
		if(playerid != 255)
		{
			SendClientMessage(playerid, COLOR_GREEN,"File not found");
		}
	}
	return 1;
}

public SaveRaceList(playerid,name[])
{
		new coordsstring[256];
		new racename[64];
		format(racename, sizeof(racename), "Deathmatch/%s.dm",name);
		new File: file2 = fopen(racename, io_write);
		new idx;
		while (idx < sizeof(gRandomDMSpawns))
		{
			format(coordsstring, sizeof(coordsstring), "%f,%f,%f\n",gRandomDMSpawns[idx][0],gRandomDMSpawns[idx][1],gRandomDMSpawns[idx][2]);
			fwrite(file2, coordsstring);
			idx++;
		}
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f\n",gDMWbounds[0],gDMWbounds[1],gDMWbounds[2],gDMWbounds[3]);
		fwrite(file2, coordsstring);
		fclose(file2);
		format(coordsstring, sizeof(coordsstring), "%s DM Saved",name);
		SendClientMessage(playerid, COLOR_GREEN,coordsstring);
		return 1;
}


public LoadBizz()
{
	new arrCoords[31][64];
	new strFromFile2[256];
	new File: file = fopen("Gamemode/bizz.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(BizzInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			BizzInfo[idx][bEntrancex] = floatstr(arrCoords[0]);
			BizzInfo[idx][bEntrancey] = floatstr(arrCoords[1]);
			BizzInfo[idx][bEntrancez] = floatstr(arrCoords[2]);
			BizzInfo[idx][bExitx] = floatstr(arrCoords[3]);
			BizzInfo[idx][bExity] = floatstr(arrCoords[4]);
			BizzInfo[idx][bExitz] = floatstr(arrCoords[5]);
			BizzInfo[idx][bHealthx] = strval(arrCoords[6]);
			BizzInfo[idx][bHealthy] = strval(arrCoords[7]);
			BizzInfo[idx][bHealthz] = strval(arrCoords[8]);
			BizzInfo[idx][bArmourx] = strval(arrCoords[9]);
			BizzInfo[idx][bArmoury] = strval(arrCoords[10]);
			BizzInfo[idx][bArmourz] = strval(arrCoords[11]);
			strmid(BizzInfo[idx][bOwner], arrCoords[12], 0, strlen(arrCoords[12]), 255);
			strmid(BizzInfo[idx][bDiscription], arrCoords[13], 0, strlen(arrCoords[13]), 255);
			BizzInfo[idx][bValue] = strval(arrCoords[14]);
			BizzInfo[idx][bHel] = strval(arrCoords[15]);
			BizzInfo[idx][bArm] = strval(arrCoords[16]);
			BizzInfo[idx][bInt] = strval(arrCoords[17]);
			BizzInfo[idx][bLock] = strval(arrCoords[18]);
			BizzInfo[idx][bOwned] = strval(arrCoords[19]);
			BizzInfo[idx][bEntcost] = strval(arrCoords[20]);
			BizzInfo[idx][bTakings] = strval(arrCoords[21]);
			BizzInfo[idx][bDate] = strval(arrCoords[22]);
			BizzInfo[idx][bLevel] = strval(arrCoords[23]);
			BizzInfo[idx][bProd] = strval(arrCoords[24]);
			BizzInfo[idx][bProdCap] = strval(arrCoords[25]);
			BizzInfo[idx][bComp] = strval(arrCoords[26]);
			BizzInfo[idx][bCompCap] = strval(arrCoords[27]);
			BizzInfo[idx][bProdCost] = strval(arrCoords[28]);
			BizzInfo[idx][bPayComp] = strval(arrCoords[29]);
			BizzInfo[idx][bPriceMod] = strval(arrCoords[30]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}


public LoadSBizz()
{
	new arrCoords[21][64];
	new strFromFile2[256];
	new File: file = fopen("Gamemode/sbizz.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(SBizzInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			SBizzInfo[idx][sbEntrancex] = floatstr(arrCoords[0]);
			SBizzInfo[idx][sbEntrancey] = floatstr(arrCoords[1]);
			SBizzInfo[idx][sbEntrancez] = floatstr(arrCoords[2]);
			//printf("HouseInfo hEntrancez %f",HouseInfo[idx][hEntrancez]);
			strmid(SBizzInfo[idx][sbOwner], arrCoords[3], 0, strlen(arrCoords[3]), 255);
			strmid(SBizzInfo[idx][sbDiscription], arrCoords[4], 0, strlen(arrCoords[4]), 255);
			SBizzInfo[idx][sbValue] = strval(arrCoords[5]);
			SBizzInfo[idx][sbHel] = strval(arrCoords[6]);
			SBizzInfo[idx][sbArm] = strval(arrCoords[7]);
			SBizzInfo[idx][sbInt] = strval(arrCoords[8]);
			SBizzInfo[idx][sbLock] = strval(arrCoords[9]);
			SBizzInfo[idx][sbOwned] = strval(arrCoords[10]);
			SBizzInfo[idx][sbEntcost] = strval(arrCoords[11]);
			SBizzInfo[idx][sbTakings] = strval(arrCoords[12]);
			SBizzInfo[idx][sbDate] = strval(arrCoords[13]);
			SBizzInfo[idx][sbLevel] = strval(arrCoords[14]);
			SBizzInfo[idx][sbProd] = strval(arrCoords[15]);
			SBizzInfo[idx][sbProdCap] = strval(arrCoords[16]);
			SBizzInfo[idx][sbComp] = strval(arrCoords[17]);
			SBizzInfo[idx][sbCompCap] = strval(arrCoords[18]);
			SBizzInfo[idx][sbProdCost] = strval(arrCoords[19]);
			SBizzInfo[idx][sbPayComp] = strval(arrCoords[20]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}

//------------------------------------------------------------------------------------------------------
public OnGameModeInit()
{
    SetTimer("SendMSG", 900000, true);
    TextDraws();
    AntiDeAMX();
    UsePlayerPedAnims();
	LoadConfig();
	LoadTmp();
	LoadProperty();
	LoadBizz();
	LoadSBizz();
	//PlayerHaul[78][pLoad] = 10000;
	PlayerHaul[78][pCapasity] = 10;
	//PlayerHaul[79][pLoad] = 10000;
	PlayerHaul[79][pCapasity] = 10;
	//PlayerHaul[80][pLoad] = 10000;
	PlayerHaul[80][pCapasity] = 5;
	//PlayerHaul[81][pLoad] = 10000;
	PlayerHaul[81][pCapasity] = 5;
	SetGameModeText("PENo1: LS v6 (alpha)");
	SendRconCommand("hostname [DM / Missions / RPG] Public Enemy: Los Santos");
	format(objstore, sizeof(objstore), "MOLE: I Got Nothin, Check Back With Me Later.");
	format(cbjstore, sizeof(cbjstore), "HQ: There is Nothing in Your Vicinity, Out.");
	gettime(ghour, gminute, gsecond);
	FixHour(ghour);
	ghour = shifthour;
	if(!realtime)
	{
		SetWorldTime(wtime);
	}
	// Player Class's
	for(new i = 0; i <= sizeof(Peds)-1; i++)
	{
		AddPlayerClass(Peds[i][0],1958.3783,1343.1572,1100.3746,269.1425,-1,-1,-1,-1,-1,-1);
		//if (gdebug){printf("DEBUG ped (%d) added", i);}
	}
	// Car Spawns
	//cops cars
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if (gdebug >= 1){printf("HouseInfo[%d][hVec] %d",h,HouseInfo[h][hVec]);}
		CreateVehicle(HouseInfo[h][hVec], HouseCarSpawns[h][0], HouseCarSpawns[h][1], HouseCarSpawns[h][2], HouseCarSpawns[h][3], HouseInfo[h][hVcol1], HouseInfo[h][hVcol2], never);
		gCarLock[h+1] = 1;
	}//34
	CreateVehicle(601,1530.753000,-1683.450000,6.274824,270.0, -1, -1, never);//copcar
	CreateVehicle(528,1558.392000,-1710.859000,5.466783,1.0, -1, -1,never);
	CreateVehicle(596,1569.639000,-1710.859000,5.466783,1.0, -1, -1,never);
	CreateVehicle(596,1249.4,-2042.1,59.7,268.8, -1, -1, never); //sf
	CreateVehicle(596,1589.639000,-1710.859000,5.466783,1.0, -1, -1,never);
	CreateVehicle(596,1601.308000,-1628.710000,13.056540,90.0, -1, -1, never);
	CreateVehicle(596,1601.308000,-1621.916000,13.056540,90.0, -1, -1, never);
	CreateVehicle(596,1535.8275,-1678.0283,13.1680,359.9876, -1, -1, never);
	CreateVehicle(596,1561.860000,-1694.905000,6.139762,222.0,-1, -1, never);
	CreateVehicle(596,1601.660000,-1696.529000,6.139762,89.0,-1, -1, never);
	CreateVehicle(497,1116.5,-2053.9,74.4,358.5, -1, -1, never); //copjeep/chop//sf
	CreateVehicle(497,1116.0,-2017.9,74.4,0.7, -1, -1, never);//sf
	CreateVehicle(599,614.8,-588.5,17.4,240.0, -1, -1, never);
	CreateVehicle(599,635.1,-561.5,16.5,180.0, -1, -1, never);
	CreateVehicle(599, 1247.9,-2031.2,59.7,270.1, -1, -1, -1);//sf
	CreateVehicle(427,1539.392000,-1646.262000,6.274928,180.0, -1, -1, never);//enforcer
	CreateVehicle(427,1531.254000,-1647.431000,6.274976,200.0, -1, -1, never);
	CreateVehicle(490,1546.324000,-1658.402000,6.274824,180.0, -1, -1,never);//fbiranch
	CreateVehicle(490,1546.324000,-1672.156000,6.274824,180.0, -1, -1,never);
	CreateVehicle(490,1535.8459,-1668.7560,13.2653,359.7447,-1, -1, never);
	CreateVehicle(523,612.6,-597.3,16.7,270.0, -1, -1, never); // copbike
	CreateVehicle(523,1249.2,-2022.0,59.7,267.3, -1, -1,never); //sf
	CreateVehicle(523,1528.1152,-1679.0033,5.4564,241.9187, -1, -1, never);
	CreateVehicle(523,1530.1611,-1676.0326,5.4563,231.7766, -1, -1, never);
	CreateVehicle(523,1568.483000,-1694.808000,6.138681,222.0,-1, -1,never);
	CreateVehicle(497, 1517.8,-1656.1,13.7,0.0, -1, -1,never);//police mavric
	CreateVehicle(416,1181.463501,-1308.673706,13.939081,270.0, -1, -1, never);//ambulance
	CreateVehicle(416, 1181.7,-1339.2,13.8,270.0, -1, -1,never);
	CreateVehicle(416, 1183.0,-1329.7,13.7,1.0, -1, -1, never);
	CreateVehicle(407,1172.5,-1795.5,13.1,0.0, -1, -1, never);//fire 407
	CreateVehicle(407,1182.1,-1795.9,13.1,0.0, -1, -1, never);
	CreateVehicle(476,1935.763794,-2416.733887,13.846451,89.0,-1, -1, never);//dodos//ls
	CreateVehicle(511,1848.121704,-2435.860352,13.754265,89.0,-1, -1, never);//ls
	CreateVehicle(476,-1297.811279,-457.169250,14.448013,89.0,-1, -1, never);//lv
	CreateVehicle(511,-1286.913696,-394.913086,14.448013,89.0,-1, -1, never);//lv
	CreateVehicle(476,1586.432007,1615.842651,11.119888,89.0,-1, -1, never);//sf
	CreateVehicle(511,1634.947388,1555.917969,11.109032,89.0,-1, -1, never);//sf
	CreateVehicle(541,551.7929,-1285.5260,16.9303,0.4147,-1, -1, never);//? bullit
	CreateVehicle(429,536.9888,-1286.5275,16.9993,359.1704,-1, -1, never); //? infurnus //nowcheeta
	CreateVehicle(451,544.1793,-1286.1422,16.9492,7.3116,-1, -1, never);//turismo
	CreateVehicle(429,2128.2063,-1141.5492,24.8090,42.9799,-1, -1, never); //banshee
	CreateVehicle(415,2131.3589,-1138.5345,25.1992,40.9620,-1, -1, never); //cheeta
	CreateVehicle(480,2134.7695,-1134.7576,25.4289,46.3918,-1, -1, never); //comet
	//CreateVehicle(420, 1672.876587,-2251.854736,13.674889,271.2,-1, -1, -1);//taxi
	//CreateVehicle(420, 1754.525635,-1857.888306,13.713638,271.2,-1, -1, -1);
	//CreateVehicle(420, -1421.801880,-300.223724,14.299576,44.2,-1, -1, -1);
	//CreateVehicle(420, 1708.555786,1435.376587,10.863876,287.2,-1, -1, -1);
    CreateVehicle(456, 2795.2,-2417.8,13.4,90.8,-1,-1,never);
    CreateVehicle(456, 2783.9,-2417.9,13.4,90.8,-1,-1,never);
    CreateVehicle(440, 2794.1,-2455.9,13.4,90.8,-1,-1,never);
    CreateVehicle(440, 2782.9,-2455.6,13.4,90.8,-1,-1,never);
	CreateVehicle(470, 1105.7,-2070.5,69.0,185.7,-1, -1, never);//patriot
	CreateVehicle(481, 1885.2,-1360.1,18.6,90.0,0, 1, never);//bmx
	CreateVehicle(481, 1886.0,-1363.1,18.6,90.0,1, 0, never);//bmx
	CreateVehicle(481, 1886.0,-1365.1,18.6,90.0,-1, -1, never);//bmx jail
	CreateVehicle(493, 720.1,-1694.0,-0.4,179.4,-1,-1,never);
	CreateVehicle(493, 721.2,-1629.4,-0.4,180.9,-1,-1,never);
	CreateVehicle(468, 976.3570,-814.0229,97.8475, 29.2329,0,16,never); //mower
	CreateVehicle(468, 1424.7,-880.6,49.8,0.0,0,-1,never);//dozer
	CreateVehicle(463, 1513.4,-690.7,94.5,91.3,86,-1,never); //paulcar harly
	CreateVehicle(493, 739.5,-1670.5,-0.6,177.5,-1,-1,never);// new jetmax
	CreateVehicle(493, 737.7,-1639.9,-0.6,178.1,-1,-1,never);
	CreateVehicle(493, 714.3,-1672.0,-0.5,182.2,-1,-1,never);
	CreateVehicle(560, 249.9507,-1229.3521,74.5567,1.1,-1,-1,never);
	//end new jetmax
	//CreateVehicle(522, 1654.8,-1636.9,83.7,90.0,0, 6, -1);//fcr
	//CreateVehicle(522, 1228.7,-1266.2,64.5,90.0,0, 6, -1);//fcr
	//CreateVehicle(487, 1767.0,-2285.9,26.9,359.9,-1, -1, -1); //airportmavrik
	//CreateVehicle(577,1585.1444,1187.9630,10.7343,179.9691,-1,-1,-1); // at400 = crash when you walk up to it
	
	//3dtexts arene
	Create3DTextLabel("{FF0000}Arena: {FFFFFF}Deagle & Shotgun\n{FF0000}Acces Level: {FFFFFF}3", COLOR_WHITE, 1370.8131, -1316.0708, 13.5469, 40.0, 0, 0);
	Create3DTextLabel("{FF0000}EXIT ARENA", COLOR_WHITE, 1403.1113, 7.2928, 1000.9063, 40.0, 0, 0);
	arenapickup1 = CreatePickup(1559, 1, 1370.8131, -1316.0708, 13.5469);
	arenaexitpickup1 = CreatePickup(1559, 1, 1403.1113, 7.2928, 1000.9063);
	Create3DTextLabel("{FF0000}Arena: {FFFFFF}Sniper & Shotgun\n{FF0000}Acces Level: {FFFFFF}3", COLOR_WHITE, 1370.8138, -1319.9871, 13.5469, 40.0, 0, 0);
	Create3DTextLabel("{FF0000}EXIT ARENA", COLOR_WHITE, 288.9320, 171.0621, 1007.1794, 40.0, 0, 0);
	arenapickup2 = CreatePickup(1559, 1, 1370.8138, -1319.9871, 13.5469);
	arenaexitpickup2 = CreatePickup(1559, 1, 288.9320, 171.0621, 1007.1794);
	Create3DTextLabel("{FF0000}Arena: {FFFFFF}Spas & Rifle\n{FF0000}Acces Level: {FFFFFF}3", COLOR_WHITE, 1370.6614, -1341.3257, 13.5469, 40.0, 0, 0);
	Create3DTextLabel("{FF0000}EXIT ARENA", COLOR_WHITE, -1419.0128, 89.3194, 1032.7629, 40.0, 0, 0);
	arenapickup3 = CreatePickup(1559, 1, 1370.6614, -1341.3257, 13.5469);
	arenaexitpickup3 = CreatePickup(1559, 1, -1419.0128, 89.3194, 1032.7629);
	Create3DTextLabel("{FF0000}Arena: {FFFFFF}M4 & Shotgun\n{FF0000}Acces Level: {FFFFFF}3", COLOR_WHITE, 1370.8104, -1361.3358, 13.5469, 40.0, 0, 0);
	Create3DTextLabel("{FF0000}EXIT ARENA", COLOR_WHITE, -1132.5076, 1041.5408, 1345.7432, 40.0, 0, 0);
	arenapickup4 = CreatePickup(1559, 1, 1370.8104, -1361.3358, 13.5469);
	arenaexitpickup4 = CreatePickup(1559, 1, -1132.5076, 1041.5408, 1345.7432);
	Create3DTextLabel("{FF0000}Arena: {FFFFFF}Ak47 & Deagle\n{FF0000}Acces Level: {FFFFFF}3", COLOR_WHITE, 1370.8025, -1365.4608, 13.5469, 40.0, 0, 0);
	Create3DTextLabel("{FF0000}EXIT ARENA", COLOR_WHITE, 492.8779, -23.5419, 1000.6797, 40.0, 0, 0);
	arenapickup5 = CreatePickup(1559, 1, 1370.8025, -1365.4608, 13.5469);
	arenaexitpickup5 = CreatePickup(1559, 1, 492.8779, -23.5419, 1000.6797);
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		/*
		if(HouseInfo[h][hHel] == 1)
		{
			AddStaticPickup(1240, 2, HouseInfo[h][hHealthx], HouseInfo[h][hHealthy], HouseInfo[h][hHealthz]);
			pickups++;
		}
		if(HouseInfo[h][hArm] == 1)
		{
			AddStaticPickup(1242, 2, HouseInfo[h][hArmourx], HouseInfo[h][hArmoury], HouseInfo[h][hArmourz]);
			pickups++;
		}
		*/
		if(HouseInfo[h][hOwned] == 0)
		{
			AddStaticPickup(1273, 2, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
			pickups++;
		}
		if(HouseInfo[h][hOwned] == 1)
		{
			AddStaticPickup(1239, 2, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
			pickups++;
		}
	}
	for(new h = 0; h < sizeof(BizzInfo); h++)
	{
		/*
		if(BizzInfo[h][bHel] == 1)
		{
			AddStaticPickup(1240, 2, BizzInfo[h][bHealthx], BizzInfo[h][bHealthy], BizzInfo[h][bHealthz]);
			pickups++;
		}
		if(BizzInfo[h][bArm] == 1)
		{
			AddStaticPickup(1242, 2, BizzInfo[h][bArmourx], BizzInfo[h][bArmoury], BizzInfo[h][bArmourz]);
			pickups++;
		}
		*/
		if(BizzInfo[h][bOwned] == 0)
		{
			AddStaticPickup(1272, 2, BizzInfo[h][bEntrancex], BizzInfo[h][bEntrancey], BizzInfo[h][bEntrancez]);
			pickups++;
		}
		if(BizzInfo[h][bOwned] == 1)
		{
			AddStaticPickup(1239, 2, BizzInfo[h][bEntrancex], BizzInfo[h][bEntrancey], BizzInfo[h][bEntrancez]);
			pickups++;
		}
	}
	for(new h = 0; h < sizeof(SBizzInfo); h++)
	{
		/*
		if(BizzInfo[h][bHel] == 1)
		{
			AddStaticPickup(1240, 2, BizzInfo[h][bHealthx], BizzInfo[h][bHealthy], BizzInfo[h][bHealthz]);
			pickups++;
		}
		if(BizzInfo[h][bArm] == 1)
		{
			AddStaticPickup(1242, 2, BizzInfo[h][bArmourx], BizzInfo[h][bArmoury], BizzInfo[h][bArmourz]);
			pickups++;
		}
		*/
		if(SBizzInfo[h][sbOwned] == 0)
		{
			AddStaticPickup(1272, 2, SBizzInfo[h][sbEntrancex], SBizzInfo[h][sbEntrancey], SBizzInfo[h][sbEntrancez]);
			pickups++;
		}
		if(SBizzInfo[h][sbOwned] == 1)
		{
			AddStaticPickup(1239, 2, SBizzInfo[h][sbEntrancex], SBizzInfo[h][sbEntrancey], SBizzInfo[h][sbEntrancez]);
			pickups++;
		}
	}
	AddStaticPickup(1274, 2, BizzInfo[4][bEntrancex], BizzInfo[4][bEntrancey], BizzInfo[4][bEntrancez]);pickups++; //thebank
	//56
	//Rooftop 1
	/*
	AddStaticPickup(1550, 2, 2217.2,-1179.7,29.7);//moneybag
	AddStaticPickup(1550, 2, 1098.1, -1428.0, 22.7);
	AddStaticPickup(1550, 2, 2484.2,-1961.8,16.7);
	AddStaticPickup(1550, 2, 733.2,-1357.9,23.5);
	AddStaticPickup(1550, 2, 1411.6,-1455.1,20.4);
	AddStaticPickup(1550, 2, 1080.6,-1605.0,20.4);
	AddStaticPickup(1550, 2, 382.0,-2058.7,10.7);
	AddStaticPickup(1550, 2, 656.1,-1646.6,15.4);
	AddStaticPickup(1550, 2, 816.2,-1380.5,23.5);
	AddStaticPickup(1550, 2, 853.3,-1388.2,-0.5);
	AddStaticPickup(1550, 2, 915.4,-1235.1,17.2);
	AddStaticPickup(1550, 2, 1153.7,-1180.4,32.8);
	AddStaticPickup(1550, 2, 1183.9,-1257.3,18.8);
	AddStaticPickup(1550, 2, 1441.3,-926.8,39.6);
	AddStaticPickup(1550, 2, 1527.5,-893.5,57.6);
	AddStaticPickup(1550, 2, 1292.1,-770.7,95.9);
	AddStaticPickup(1550, 2, 1907.9,-1318.6,14.1);
	AddStaticPickup(1550, 2, 1971.7,-1284.5,28.4);
	AddStaticPickup(1550, 2, 2687.1,-1144.6,71.3);
	AddStaticPickup(1550, 2, 2654.1,-1317.5,58.9);
	AddStaticPickup(1550, 2, 2771.0,-1388.5,27.1);
	AddStaticPickup(1550, 2, 2793.3,-1945.0,17.3);
	AddStaticPickup(1550, 2, 2447.5,-2209.8,26.6);
	AddStaticPickup(1550, 2, 197.9,-1206.0,78.3);
	AddStaticPickup(1550, 2, 1342.1,-1624.3,17.7);
	*/
	AddStaticPickup(371, 2, 1544.2,-1353.4,329.4); //ls towertop
	AddStaticPickup(371, 2, 1536.0, -1360.0, 1150.0);
	AddStaticPickup(3013, 2, 997.7,-921.1,42.1);//cashbox
	AddStaticPickup(3013, 2, 2421.5, -1221.7, 25.3);
	AddStaticPickup(3013, 2, 2069.7,-1780.1,13.5);
	AddStaticPickup(3013, 2, 1352.4,-1756.7,13.5);
	AddStaticPickup(3013, 2, 1831.1,-1842.8,13.5);
	AddStaticPickup(1242, 2, 1527.5,-12.1,1002.0); //binco armor
	/*
	AddStaticPickup(335, 2, -35.1,-49.7,1003.5);//24-7
	AddStaticPickup(366, 2, -18.6,-49.8,1003.5);
	AddStaticPickup(335, 2, -36.5,-75.3,1003.5);
	AddStaticPickup(366, 2, -16.0,-75.3,1003.5);
	AddStaticPickup(335, 2, -34.0,-3.2,1003.5);
	AddStaticPickup(366, 2, -27.7,-3.8,1003.5);
	AddStaticPickup(335, 2, 434.6,-85.1,999.5);//0
	AddStaticPickup(351, 2, 439.1,-82.0,999.5);
	AddStaticPickup(352, 2, 445.3,-84.2,999.5);
	AddStaticPickup(365, 2, 451.2,-84.1,999.5);
	AddStaticPickup(346, 2, 454.3,-91.5,999.5);
	AddStaticPickup(372, 2, 373.4,-184.8,1001.4);//1
	AddStaticPickup(372, 2, 373.4,-184.8,1001.4);
	AddStaticPickup(355, 2, 375.6,-181.8,1001.4);
	AddStaticPickup(335, 2, 379.9,-182.0,1000.6);
	AddStaticPickup(350, 2, 375.5,-189.0,1001.4);
	AddStaticPickup(350, 2, 375.5,-189.0,1001.4);
	AddStaticPickup(356, 2, 931.4,-5.6,1001.5);//2
	AddStaticPickup(352, 2, 931.3,-2.9,1001.5);
	AddStaticPickup(348, 2, 931.3,-0.4,1001.5);
	AddStaticPickup(350, 2, 934.8,6.6,1000.9);
	AddStaticPickup(335, 2, 938.5,6.8,1000.9);
	AddStaticPickup(365, 2, 949.9,-5.9,1001.1);
	AddStaticPickup(348, 2, 962.9,-55.2,1001.1);//3
	AddStaticPickup(350, 2, 966.8,-48.1,1001.9);
	AddStaticPickup(351, 2, 966.7,-45.3,1001.9);
	AddStaticPickup(352, 2, 958.7,-61.1,1001.1);
	AddStaticPickup(372, 2, 963.4,-60.4,1001.1);
	AddStaticPickup(353, 2, 964.0,-43.7,1001.1);
	AddStaticPickup(355, 2, 946.3,-57.8,1001.1);
	AddStaticPickup(356, 2, 943.9,-55.4,1001.1);
	AddStaticPickup(350, 2, 1296.9,4.9,1001.0); //bizz9
	AddStaticPickup(352, 2, 1292.3,4.4,1001.0);
	AddStaticPickup(356, 2, 1288.5,4.9,1001.0);
	AddStaticPickup(351, 2, 1285.1,4.6,1001.0);
	AddStaticPickup(370, 2, 1496.7,-1562.1,23.5);
	AddStaticPickup(348, 2, 1294.3,4.9,1001.0);
	AddStaticPickup(343, 2, -783.0,500.8,1371.7);//bizz 11
	*/
	pickups=pickups+9;

	new randa = random(sizeof(RandCars));
	randa = random(sizeof(RandCars));carselect[0] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[1] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[2] = RandCars[randa][0];
	randa = random(sizeof(RandLow));carselect[3] = RandLow[randa][0];
	randa = random(sizeof(RandCars));carselect[4] = RandCars[randa][0];
	randa = random(sizeof(RandAngles));carselect[5] = RandAngles[randa][0];
	randa = random(sizeof(RandCars));carselect[6] = RandCars[randa][0];
	randa = random(sizeof(RandLow));carselect[7] = RandLow[randa][0];
	randa = random(sizeof(RandCars));carselect[8] = RandCars[randa][0];
	randa = random(sizeof(RandAngles));carselect[9] = RandAngles[randa][0];
	randa = random(sizeof(RandCars));carselect[10] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[11] = RandCars[randa][0];
	randa = random(sizeof(RandBikes));carselect[12] = RandBikes[randa][0];
	randa = random(sizeof(RandBikes));carselect[13] = RandBikes[randa][0];
	randa = random(sizeof(RandLCars));carselect[14] = RandLCars[randa][0];
	CreateVehicle(carselect[14], 1279.4,-1337.0,13.5,1.0,-1, -1, -1);//long
	//printf("DEBUG: Rando Cars %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,",carselect[0],carselect[1],carselect[2],carselect[3],carselect[4],carselect[5],carselect[6],carselect[7],carselect[8],carselect[9],carselect[10],carselect[11],carselect[12],carselect[13],carselect[14]);
	if (gRoundTime > 0)
	{
		SetTimer("GameModeInitExitFunc", gRoundTime, 0);
	}
	if (realtime)
	{
		new tmphour;
		new tmpminute;
		new tmpsecond;
		gettime(tmphour, tmpminute, tmpsecond);
		FixHour(tmphour);
		tmphour = shifthour;
		SetWorldTime(tmphour);
	}
	if (fow)
	{
		SetTimer("CopScanner", radarfreq, 1);
	}
	synctimer = SetTimer("SyncUp", 60000, 1);
	newmistimer = SetTimer("PrePlayerNewMission", jobdelay, 1);
	unjailtimer = SetTimer("SetPlayerUnjail", 1000, 1);
	if (nocasino)
	{
		playertimer = SetTimer("PlayerInArea", 1000, 1);
	}
	cartimer = SetTimer("CarCheck", 30000, 1);
	celltimer = SetTimer("CellPhoneTimer", 1000, 1);
	SetTimer("RingToner", 500, 0);
	SetTimer("SetPlayerFlash", 1000, 0);
	SetTimer("CustomPickups", 1000, 1);
	SetTimer("InHouse", 1000, 1);
	SetTimer("GameTicks", 500, 1);
	SetTimer("VoteKickTimer", 1000, 1);
	SetTimer("DMDetect", 1000, 1);
	SetTimer("Spectator", 2000, 1);
	SetTimer("PenInArea", 2000, 1);
	SetTimer("IdleKick", idletime, 1);
	SetTimer("AntiTeleport", 1000, 1);
	SetTimer("AntiCamp", 1000, 1);
	SetTimer("SkyDive", 1000, 1);
	SetTimer("Production", 300000, 1); //5 mins
	//for(new i = 0; i < sizeof(CarSpawns); i++)
	for(new i = 0; i < 165; i++)
	{
		AddCar(i);
		if (gdebug){printf("DEBUG car (%d) spawned", i);}
	}
	CarInit();
	TeamCarLockInit();
	return 1;
}

public SyncUp()
{
if (gdebug >= 3){printf("DEBUG SyncUp()");}
	SyncTime();
	DollahScoreUpdate();
}

public SyncTime()
{
if (gdebug >= 3){printf("DEBUG SyncTime()");}
	new string[64];
	new tmphour;
	new tmpminute;
	new tmpsecond;
	gettime(tmphour, tmpminute, tmpsecond);
	FixHour(tmphour);
	tmphour = shifthour;
	if ((tmphour > ghour) || (tmphour == 0 && ghour == 23))
	{
		format(string, sizeof(string), "SERVER: The Time Is Now %d:00 Hours",tmphour);
		BroadCast(COLOR_WHITE,string);
		if (numplayers == 0)
		{
			GameModeInitExitFunc();
		}
		if (gdebug){printf("DEBUG tmphour=%d ghour=%d",tmphour,ghour);}
		ghour = tmphour;
		PayDay();
		if (realtime)
		{
			SetWorldTime(tmphour);
		}
	}
}

public SkyDive()
{
	skydivecount--;
	new string[256];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gSkyDive[i] == 1)
		{
			if(skydivecount > 10)
			{
				format(string, sizeof(string), "~W~%d",skydivecount);
			}
			else
			{
				format(string, sizeof(string), "~r~%d",skydivecount);
			}
			GameTextForPlayer(i, string, 2000, 6);
			if(skydivecount == 0)
			{
				GivePlayerWeapon(i, 46, 0);
				SetPlayerPos(i,SBizzInfo[0][sbEntrancex]+i, SBizzInfo[0][sbEntrancey], 1350.0);
				SetPlayerInterior(i,0);
				PlayerInfo[i][pInt] = 0;
				SendClientMessage(i, TEAM_GROVE_COLOR, "GREENLIGHT: GO!! GO!! GO!!");
				gSkyDive[i] = 0;
			}
		}
	}
	if(skydivecount == 0)
	{
		skydivecount = 60;
	}
}
/*
public Production()
{
	for(new i = 0; i < sizeof(BizzInfo); i++)
	{
		if(BizzInfo[i][bComp] >= BizzInfo[i][bProdCost])
		{
			//printf("BizzInfo[i][bComp] %d BizzInfo[i][bProdCost] %d",BizzInfo[i][bComp],BizzInfo[i][bProdCost])
			if(BizzInfo[i][bProd] < BizzInfo[i][bProdCap])
			{
				//printf("BizzInfo[i][bProd] %d BizzInfo[i][bProdCap] %d",BizzInfo[i][bProd],BizzInfo[i][bProdCap])
				BizzInfo[i][bComp] = BizzInfo[i][bComp]-BizzInfo[i][bProdCost];
				BizzInfo[i][bProd]++;
			}
		}
	}
	for(new i = 0; i < sizeof(SBizzInfo); i++)
	{
		if(SBizzInfo[i][sbComp] >= SBizzInfo[i][sbProdCost])
		{
			if(SBizzInfo[i][sbProd] < SBizzInfo[i][sbProdCap])
			{
				SBizzInfo[i][sbComp] = SBizzInfo[i][sbComp]-SBizzInfo[i][sbProdCost];
				SBizzInfo[i][sbProd]++;
			}
		}
	}
}
*/
public Production()
{
	for(new i = 0; i < sizeof(BizzInfo); i++)
	{
		if(BizzInfo[i][bComp] > 0)
		{
			//printf("BizzInfo[i][bComp] %d BizzInfo[i][bProdCost] %d",BizzInfo[i][bComp],BizzInfo[i][bProdCost])
			if(BizzInfo[i][bProd] < BizzInfo[i][bProdCap])
			{
				//printf("BizzInfo[i][bProd] %d BizzInfo[i][bProdCap] %d",BizzInfo[i][bProd],BizzInfo[i][bProdCap])
				BizzInfo[i][bProd] = BizzInfo[i][bProd]+BizzInfo[i][bProdCost];
				BizzInfo[i][bComp]--;
			}
		}
	}
	for(new i = 0; i < sizeof(SBizzInfo); i++)
	{
		if(SBizzInfo[i][sbComp] > 0)
		{
			if(SBizzInfo[i][sbProd] < SBizzInfo[i][sbProdCap])
			{
				SBizzInfo[i][sbProd] = SBizzInfo[i][sbProd]+SBizzInfo[i][sbProdCost];
				SBizzInfo[i][sbComp]--;
			}
		}
	}
}

public DateProp(playerid)
{
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));
	new curdate = getdate();
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if (strcmp(playername, HouseInfo[h][hOwner], true) == 0)
		{
			HouseInfo[h][hDate] = curdate;
			OnPropUpdate();
		}
	}
	for(new b = 0; b < sizeof(BizzInfo); b++)
	{
		if (strcmp(playername, BizzInfo[b][bOwner], true) == 0)
		{
			BizzInfo[b][bDate] = curdate;
			OnPropUpdate();
		}
	}
	for(new c = 0; c < sizeof(SBizzInfo); c++)
	{
		if (strcmp(playername, SBizzInfo[c][sbOwner], true) == 0)
		{
			SBizzInfo[c][sbDate] = curdate;
			OnPropUpdate();
		}
	}
	return 1;
}

public Checkprop()
{
	new olddate;
	new string[256];
	new curdate = getdate();
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if(HouseInfo[h][hOwned] == 1 && HouseInfo[h][hDate] > 9)
		{
			olddate = HouseInfo[h][hDate];
			if(curdate-olddate >= 3)
			{
				HouseInfo[h][hHel] = 0;
				HouseInfo[h][hArm] = 0;
				HouseInfo[h][hHealthx] = 0;
				HouseInfo[h][hHealthy] = 0;
				HouseInfo[h][hHealthz] = 0;
				HouseInfo[h][hArmourx] = 0;
				HouseInfo[h][hArmoury] = 0;
				HouseInfo[h][hArmourz] = 0;
				HouseInfo[h][hLock] = 1;
				HouseInfo[h][hOwned] = 0;
				HouseInfo[h][hVec] = 418;
				HouseInfo[h][hVcol1] = -1;
				HouseInfo[h][hVcol2] = -1;
				strmid(HouseInfo[h][hOwner], "The State", 0, strlen("The State"), 255);
				format(string, sizeof(string), "REAL ESTATE: A House is available at a value of $%d",HouseInfo[h][hValue]);
				SendClientMessageToAll(TEAM_BALLAS_COLOR, string);
				OnPropUpdate();
			}
		}
	}
	for(new b = 0; b < sizeof(BizzInfo); b++)
	{
		if(BizzInfo[b][bOwned] == 1 && BizzInfo[b][bDate] > 9)
		{
			olddate = BizzInfo[b][bDate];
			if(curdate-olddate >= 3)
			{
				BizzInfo[b][bHel] = 0;
				BizzInfo[b][bArm] = 0;
				BizzInfo[b][bLock] = 1;
				BizzInfo[b][bOwned] = 0;
				strmid(BizzInfo[b][bOwner], "The State", 0, strlen("The State"), 255);
				format(string, sizeof(string), "REAL ESTATE: A Business is available at a value of $%d",BizzInfo[b][bValue]);
				SendClientMessageToAll(TEAM_BALLAS_COLOR, string);
				OnPropUpdate();
			}
		}
	}
	for(new c = 0; c < sizeof(SBizzInfo); c++)
	{
		if(SBizzInfo[c][sbOwned] == 1 && SBizzInfo[c][sbDate] > 9)
		{
			olddate = SBizzInfo[c][sbDate];
			if(curdate-olddate >= 3)
			{
				SBizzInfo[c][sbHel] = 0;
				SBizzInfo[c][sbArm] = 0;
				SBizzInfo[c][sbLock] = 1;
				SBizzInfo[c][sbOwned] = 0;
				strmid(SBizzInfo[c][sbOwner], "The State", 0, strlen("The State"), 255);
				format(string, sizeof(string), "REAL ESTATE: A Small Business is available at a value of $%d",SBizzInfo[c][sbValue]);
				SendClientMessageToAll(TEAM_BALLAS_COLOR, string);
				OnPropUpdate();
			}
		}
	}
	return 1;
}

public PayDay()
{
if (gdebug >= 1){printf("DEBUG PayDay()");}
	new string[128];
	new pay,account,interest;
	new rent = 0;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && PlayerInfo[i][pLevel] > 0)
		{
			new playername2[MAX_PLAYER_NAME];
			GetPlayerName(i, playername2, sizeof(playername2));
			account = PlayerInfo[i][pAccount];
			new key = PlayerInfo[i][pPhousekey];
			if(key != 255)
			{
				rent = HouseInfo[key][hRent];
				if(strcmp(playername2, HouseInfo[key][hOwner], true) == 0)
				{
					rent = 0;
				}
				else if(rent > GetPlayerMoney(i))
				{
					PlayerInfo[i][pPhousekey] = 255;
					SendClientMessage(i, COLOR_WHITE, "You have been evicted");
					rent = 0;
				}
				HouseInfo[key][hTakings] = HouseInfo[key][hTakings]+rent;
			}
			new tmpintrate;
			if (key != 255 && strcmp(playername2, HouseInfo[key][hOwner], true) == 0)
			{
				tmpintrate = intrate+HouseInfo[key][hLevel];
			}
			else
			{
				tmpintrate = 1;
			}
			interest = (PlayerInfo[i][pAccount]/1000)*(tmpintrate);
			pay = PlayerInfo[i][pLevel]*paycheck;
			PlayerInfo[i][pExp]++;
			PlayerPlayMusic(i);
			GivePlayerMoney(i,pay-rent);
			PlayerInfo[i][pAccount] = account+interest;
			BizzInfo[4][bTakings] = BizzInfo[4][bTakings]+((PlayerInfo[i][pAccount]/1000)+intrate);
			SendClientMessage(i, COLOR_WHITE, "|___ BANK STATMENT ___|");
			format(string, sizeof(string), "  Balance: $%d", account);
			SendClientMessage(i, COLOR_GRAD1, string);
			format(string, sizeof(string), "  Interest Rate: 0.%d percent",tmpintrate);
			SendClientMessage(i, COLOR_GRAD2, string);
			format(string, sizeof(string), "  Interest Gained $%d", interest);
			SendClientMessage(i, COLOR_GRAD3, string);
			SendClientMessage(i, COLOR_GRAD4, "|--------------------------------------|");
			format(string, sizeof(string), "  New Balance: $%d", PlayerInfo[i][pAccount]);
			SendClientMessage(i, COLOR_GRAD5, string);
			format(string, sizeof(string), "  Rent: -$%d", rent);
			SendClientMessage(i, COLOR_GRAD5, string);
			format(string, sizeof(string), "~y~PayDay~n~~w~Paycheck ~n~~g~$%d", pay);
			GameTextForPlayer(i, string, 5000, 1);
			rent = 0;
		}
	}
	Checkprop();
	return 1;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
public strtik(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ','))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ',') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return;
}
public split(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;

	while(i <= strlen(strsrc)){
	    if(strsrc[i]==delimiter || i==strlen(strsrc)){
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}

	return 1;
}

public DelPrint(string1[])
{
	strmid(string1, string1, 0, strlen(string1)-1, 255);
	printf("%s", string1);
}

public LoadPlayer(loaderid,const string[])
{
	new string2[64];
	new loaded = loaderid;
	new valtmp[128];
	format(string2, sizeof(string2), "%s.cer", string);
	new File: file = fopen(string2, io_read);
	if (file)
	{
			fread(file, valtmp);strmid(PLlayerInfo[loaded][plPassword], valtmp, 0, strlen(valtmp)-1, 255);
			fread(file, valtmp);PLlayerInfo[loaded][plCash] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAccount] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAdmin] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plLevel] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plExp] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][glPupgrade] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plKills] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plCB] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plHW] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plSR] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plWA] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPEN] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun1] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun2] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun3] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun4] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun5] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun6] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo1] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo2] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo3] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo4] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo5] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo6] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plSHealth] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plHealth] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPos_x] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPos_y] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPos_z] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plInt] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plLocal] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plTeam] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plModel] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPnumber] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPhousekey] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPbiskey] = strval(valtmp);DelPrint(valtmp);
			SendClientMessage(loaderid, COLOR_WHITE, "SERVER: Account Loaded");
	}
	else
	{
		SendClientMessage(loaderid, COLOR_WHITE, "SERVER: No account found by that name");
		return 0;
	}
	return 1;
}

public SavePlayer(loaderid,const string[])
{
	new string3[32];
	new saved = loaderid;
	format(string3, sizeof(string3), "%s.cer", string);
	new File: pFile = fopen(string3, io_write);
	if (pFile)
	{
		new var[32];
		format(var, 32, "%s\n", PLlayerInfo[saved][plPassword]);fwrite(pFile, var);
		fclose(pFile);
		new File: hFile = fopen(string3, io_append);
		format(var, 32, "%d pCash\n",PLlayerInfo[saved][plCash]);fwrite(hFile, var);
		format(var, 32, "%d pAccount\n",PLlayerInfo[saved][plAccount]);fwrite(hFile, var);
		format(var, 32, "%d pAdmin\n",PLlayerInfo[saved][plAdmin]);fwrite(hFile, var);
		format(var, 32, "%d pLevel\n",PLlayerInfo[saved][plLevel]);fwrite(hFile, var);
		format(var, 32, "%d pExp\n",PLlayerInfo[saved][plExp]);fwrite(hFile, var);
		format(var, 32, "%d gPupgrade\n",PLlayerInfo[saved][glPupgrade]);fwrite(hFile, var);
		format(var, 32, "%d pKills\n",PLlayerInfo[saved][plKills]);fwrite(hFile, var);
		format(var, 32, "%d pCB\n",PLlayerInfo[saved][plCB]);fwrite(hFile, var);
		format(var, 32, "%d pHW\n",PLlayerInfo[saved][plHW]);fwrite(hFile, var);
		format(var, 32, "%d pSR\n",PLlayerInfo[saved][plSR]);fwrite(hFile, var);
		format(var, 32, "%d pWA\n",PLlayerInfo[saved][plWA]);fwrite(hFile, var);
		format(var, 32, "%d pPEN\n",PLlayerInfo[saved][plPEN]);fwrite(hFile, var);
		format(var, 32, "%d pGun1\n",PLlayerInfo[saved][plGun1]);fwrite(hFile, var);
		format(var, 32, "%d pGun2\n",PLlayerInfo[saved][plGun2]);fwrite(hFile, var);
		format(var, 32, "%d pGun3\n",PLlayerInfo[saved][plGun3]);fwrite(hFile, var);
		format(var, 32, "%d pGun4\n",PLlayerInfo[saved][plGun4]);fwrite(hFile, var);
		format(var, 32, "%d pGun5\n",PLlayerInfo[saved][plGun5]);fwrite(hFile, var);
		format(var, 32, "%d pGun6\n",PLlayerInfo[saved][plGun6]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo1\n",PLlayerInfo[saved][plAmmo1]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo2\n",PLlayerInfo[saved][plAmmo2]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo3\n",PLlayerInfo[saved][plAmmo3]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo4\n",PLlayerInfo[saved][plAmmo4]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo5\n",PLlayerInfo[saved][plAmmo5]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo6\n",PLlayerInfo[saved][plAmmo6]);fwrite(hFile, var);
		format(var, 32, "%.1f pSHealth\n", PLlayerInfo[saved][plSHealth]);fwrite(hFile, var);
		format(var, 32, "%.1f pHealth\n", PLlayerInfo[saved][plHealth]);fwrite(hFile, var);
		format(var, 32, "%.1f pPos_x\n", PLlayerInfo[saved][plPos_x]);fwrite(hFile, var);
		format(var, 32, "%.1f pPos_y\n", PLlayerInfo[saved][plPos_y]);fwrite(hFile, var);
		format(var, 32, "%.1f pPos_z\n", PLlayerInfo[saved][plPos_z]);fwrite(hFile, var);
		format(var, 32, "%d pInt\n",PLlayerInfo[saved][plInt]);fwrite(hFile, var);
		format(var, 32, "%d pLocal\n",PLlayerInfo[saved][plLocal]);fwrite(hFile, var);
		format(var, 32, "%d pTeam\n",PLlayerInfo[saved][plTeam]);fwrite(hFile, var);
		format(var, 32, "%d pModel\n",PLlayerInfo[saved][plModel]);fwrite(hFile, var);
		format(var, 32, "%d pPnumber\n",PLlayerInfo[saved][plPnumber]);fwrite(hFile, var);
		format(var, 32, "%d pPhousekey\n",PLlayerInfo[saved][plPhousekey]);fwrite(hFile, var);
		format(var, 32, "%d pPbiskey\n",PLlayerInfo[saved][plPbiskey]);fwrite(hFile, var);
		fclose(hFile);
	}
	return 1;
}


public OnPlayerLogin(playerid,const string[])
{
	if (gdebug >= 1){printf("DEBUG OnPlayerLogin(%d) (%s)", playerid,string);}
	new string2[64];
	new playername2[MAX_PLAYER_NAME];
	//new password[64];
	new tmp2[256];
	/*
	if (gPlayerSpawned[playerid] == 1)
	{
		SetPlayerHealth(playerid,0.0);
	}
	*/
	GetPlayerName(playerid, playername2, sizeof(playername2));
	format(string2, sizeof(string2), "%s.cer", playername2);
	new File: file = fopen(string2, io_read);
	if (file)
	{
		new valtmp[128];
		fread(file, valtmp);strmid(PlayerInfo[playerid][pPassword], valtmp, 0, strlen(valtmp)-1, 255);
		if (gdebug){printf("DEBUG password from file= (%s) pass enterd =  (%s)",PlayerInfo[playerid][pPassword] ,string );}
		//fread(file, valtmp);strmid(password, valtmp, 0, strlen(string), 255);
		if ((strcmp(PlayerInfo[playerid][pPassword], string, true, strlen(valtmp)-1) == 0))// && (strlen(string) == strlen(password)))
		{
			fread(file, valtmp);PlayerInfo[playerid][pCash] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAccount] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAdmin] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pLevel] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pExp] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][gPupgrade] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pKills] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pCB] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pHW] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pSR] = strval(valtmp);DelPrint(valtmp);
			if(PlayerInfo[playerid][pKills] < 0){PlayerInfo[playerid][pKills] = 0;}//patch
			if(PlayerInfo[playerid][pCB] < 0){PlayerInfo[playerid][pCB] = 0;}//patch
			if(PlayerInfo[playerid][pHW] < 0){PlayerInfo[playerid][pHW] = 0;}//patch
			if(PlayerInfo[playerid][pSR] < 0){PlayerInfo[playerid][pSR] = 0;}//patch
			fread(file, valtmp);PlayerInfo[playerid][pWA] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPEN] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun1] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun2] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun3] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun4] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun5] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun6] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo1] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo2] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo3] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo4] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo5] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo6] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pSHealth] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pHealth] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPos_x] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPos_y] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPos_z] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pInt] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pLocal] = strval(valtmp);DelPrint(valtmp);
			if(PlayerInfo[playerid][pModel] == 264){fread(file, valtmp);PlayerInfo[playerid][pTeam] = strval(valtmp);DelPrint(valtmp);}else{fread(file, valtmp);}
			if(PlayerInfo[playerid][pModel] == 264){fread(file, valtmp);PlayerInfo[playerid][pModel] = strval(valtmp);DelPrint(valtmp);}else{fread(file, valtmp);}
			fread(file, valtmp);PlayerInfo[playerid][pPnumber] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPhousekey] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPbiskey] = strval(valtmp);DelPrint(valtmp);
			fclose(file);
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);

			//if (gdebug){printf("DEBUG phonenumber = %d",pnumber);}
			if(PlayerInfo[playerid][pLevel] == -999) //autoban
			{
				Ban(playerid);
			}
			SendClientMessage(playerid, COLOR_GREEN, "Welcome to Public Enemy: Los Santos Server, hope you will enjoy playing here.");
	        SendClientMessage(playerid, COLOR_YELLOW, "For more informations about this server check /help, /news & /credits");
	        SendClientMessage(playerid, COLOR_WHITE, "This server is a non-profit project, admins will be chosen when there will be players.");
			SendClientMessage(playerid, COLOR_YELLOW, motd);
			format(string2, sizeof(string2), "SERVER: Welcome %s",playername2);
			SendClientMessage(playerid, COLOR_WHITE,string2);
			SetPlayerWeapons(playerid);
			printf("%s has logged in",playername2);
			if (PlayerInfo[playerid][pAdmin] > 0)
			{
				format(string2, sizeof(string2), "SERVER: You are logged in as a level %d admin",PlayerInfo[playerid][pAdmin]);
				SendClientMessage(playerid, COLOR_WHITE,string2);
			}
			SetSpawnInfo(playerid, 1, PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
   if(gTeam[playerid] == 0)
			{
				gTeam[playerid] = 3;
			}
			else
			{
				gTeam[playerid] = PlayerInfo[playerid][pTeam];
			}
			gPlayerLogged[playerid] = 1;
			if(accountplay)
			{
				gPlayerSpawned[playerid] = 0;
			}
			//SpawnPlayer(playerid);
			GetPlayerName(playerid, playername2, sizeof(playername2));
			format(tmp2, sizeof(tmp2), "~w~Welcome ~n~~y~   %s", playername2);
			DateProp(playerid);
			GameTextForPlayer(playerid, tmp2, 5000, 1);
			return 1;
		}
		else
		{
			ShowPlayerDialog(playerid, 9, DIALOG_STYLE_PASSWORD, "{076F13}Login your account", "{F0FF00}Welcome back,\n{FFFFFF}put your password here\nfor login in Public Enemy: Los Santos server.\n{FF0000}Wrong Password.", "Login", "");
			printf("%s is hacking a password",playername2);
			fclose(file);
			//return 1;
		}
		return 1;
	}
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "SERVER: You do not have an account, create one");
		ShowPlayerDialog(playerid, 10, DIALOG_STYLE_PASSWORD, "{076F13}Create an account", "{F0FF00}Welcome,\n{FFFFFF}choose your password\nfor register in Public Enemy: Los Santos server.", "Create", "");
	}
	return 1;
}

public CopCheck(playerid)
{
	if (gdebug >= 1){printf("DEBUG CopCheck(%d) (%s)", playerid);}
	new playername2[MAX_PLAYER_NAME];
	new storedcopname[64];
	GetPlayerName(playerid, playername2, sizeof(playername2));
	new File: file = fopen("Gamemode/cops.cfg", io_read);
	if (file)
	{
		new valtmp[MAX_PLAYER_NAME];
		while (fread(file, valtmp) > 0)
		{
			//printf("%s",valtmp);
			strmid(storedcopname, valtmp, 0, strlen(playername2), 255);
			if ((strcmp(storedcopname, playername2, true, strlen(playername2)) == 0) && (strlen(playername2) == strlen(storedcopname)))
			{
				fclose(file);
				return 1;
			}
		}
	}
	fclose(file);
	return 0;
}
public MedCheck(playerid)
{
	if (gdebug >= 1){printf("DEBUG MedCheck(%d) (%s)", playerid);}
	new playername2[MAX_PLAYER_NAME];
	new storedcopname[64];
	GetPlayerName(playerid, playername2, sizeof(playername2));
	new File: file = fopen("Gamemode/meds.cfg", io_read);
	if (file)
	{
		new valtmp[MAX_PLAYER_NAME];
		while (fread(file, valtmp) > 0)
		{
			//printf("%s",valtmp);
			strmid(storedcopname, valtmp, 0, strlen(playername2), 255);
			if ((strcmp(storedcopname, playername2, true, strlen(playername2)) == 0) && (strlen(playername2) == strlen(storedcopname)))
			{
				fclose(file);
				return 1;
			}
		}
	}
	fclose(file);
	return 0;
}
public OnUpdatePlayer(playerid)
{
	if (gdebug >= 1){printf("DEBUG OnUpdatePlayer(%d)", playerid);}
	if (gPlayerLogged[playerid] != 0)
	{
		new string3[32];
		new playername3[MAX_PLAYER_NAME];
		GetPlayerName(playerid, playername3, sizeof(playername3));
		format(string3, sizeof(string3), "%s.cer", playername3);
		new File: pFile = fopen(string3, io_write);
		if (gdebug){printf("DEBUG OnUpdatePlayer(%d)8.5", playerid);}
		if (pFile)
		{
			new var[32];
			format(var, 32, "%s\n", PlayerInfo[playerid][pPassword]);fwrite(pFile, var);
			fclose(pFile);
			new File: hFile = fopen(string3, io_append);
			PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
			format(var, 32, "%d pCash\n",PlayerInfo[playerid][pCash]);fwrite(hFile, var);
			format(var, 32, "%d pAccount\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
			format(var, 32, "%d pAdmin\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
			format(var, 32, "%d pLevel\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
			format(var, 32, "%d pExp\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
			format(var, 32, "%d gPupgrade\n",PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
			format(var, 32, "%d pKills\n",PlayerInfo[playerid][pKills]);fwrite(hFile, var);
			format(var, 32, "%d pCB\n",PlayerInfo[playerid][pCB]);fwrite(hFile, var);
			format(var, 32, "%d pHW\n",PlayerInfo[playerid][pHW]);fwrite(hFile, var);
			format(var, 32, "%d pSR\n",PlayerInfo[playerid][pSR]);fwrite(hFile, var);
			format(var, 32, "%d pWA\n",PlayerInfo[playerid][pWA]);fwrite(hFile, var);
			format(var, 32, "%d pPEN\n",PlayerInfo[playerid][pPEN]);fwrite(hFile, var);
			format(var, 32, "%d pGun1\n",PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
			format(var, 32, "%d pGun2\n",PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
			format(var, 32, "%d pGun3\n",PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
			format(var, 32, "%d pGun4\n",PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
			format(var, 32, "%d pGun5\n",PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
			format(var, 32, "%d pGun6\n",PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo1\n",PlayerInfo[playerid][pAmmo1]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo2\n",PlayerInfo[playerid][pAmmo2]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo3\n",PlayerInfo[playerid][pAmmo3]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo4\n",PlayerInfo[playerid][pAmmo4]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo5\n",PlayerInfo[playerid][pAmmo5]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo6\n",PlayerInfo[playerid][pAmmo6]);fwrite(hFile, var);
			format(var, 32, "%.1f pSHealth\n", PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
			GetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);
			format(var, 32, "%.1f pHealth\n", PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
			GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
			if ((PlayerInfo[playerid][pPos_x]==0.0 && PlayerInfo[playerid][pPos_y]==0.0 && PlayerInfo[playerid][pPos_z]==0.0) || (gPlayerFighter[playerid] != 0))
			{
				PlayerInfo[playerid][pPos_x] = 1684.9;
				PlayerInfo[playerid][pPos_y] = -2244.5;
				PlayerInfo[playerid][pPos_z] = 13.5;
			}
			if(Spectate[playerid] != 255)
			{
				PlayerInfo[playerid][pPos_x] = Unspec[playerid][sPx];
				PlayerInfo[playerid][pPos_y] = Unspec[playerid][sPy];
				PlayerInfo[playerid][pPos_z] = Unspec[playerid][sPz];
				PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
			}
			format(var, 32, "%.1f pPos_x\n", PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
			format(var, 32, "%.1f pPos_y\n", PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
			format(var, 32, "%.1f pPos_z\n", PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
			format(var, 32, "%d pInt\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
			format(var, 32, "%d pLocal\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
			format(var, 32, "%d pTeam\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
			format(var, 32, "%d pModel\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
			format(var, 32, "%d pPnumber\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
			format(var, 32, "%d pPhousekey\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
			format(var, 32, "%d pPbiskey\n",PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
			fclose(hFile);
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_YELLOW, "You do not have an account, create one");
		ShowPlayerDialog(playerid, 10, DIALOG_STYLE_PASSWORD, "{076F13}Create an account", "{F0FF00}Welcome,\n{FFFFFF}choose your password\nfor register in Public Enemy: Los Santos server.", "Create", "");
	}
	if (gdebug){printf("DEBUG OnUpdatePlayer(%d)End", playerid);}
	return 1;
}

public OnPlayerRename(name[],string[],playerid)
{
	if (gdebug >= 1){printf("DEBUG OnPlayerRename(%d)", playerid);}
	if (gPlayerLogged[playerid] != 0)
	{
		new File: pFile = fopen(string, io_write);
		if (gdebug){printf("DEBUG OnUpdatePlayer(%d)8.5", playerid);}
		if (pFile)
		{
			new var[32];
			format(var, 32, "%s\n", PlayerInfo[playerid][pPassword]);fwrite(pFile, var);
			fclose(pFile);
			new File: hFile = fopen(string, io_append);
			PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
			format(var, 32, "%d pCash\n",PlayerInfo[playerid][pCash]);fwrite(hFile, var);
			format(var, 32, "%d pAccount\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
			format(var, 32, "%d pAdmin\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
			format(var, 32, "%d pLevel\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
			format(var, 32, "%d pExp\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
			format(var, 32, "%d gPupgrade\n",PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
			format(var, 32, "%d pKills\n",PlayerInfo[playerid][pKills]);fwrite(hFile, var);
			format(var, 32, "%d pCB\n",PlayerInfo[playerid][pCB]);fwrite(hFile, var);
			format(var, 32, "%d pHW\n",PlayerInfo[playerid][pHW]);fwrite(hFile, var);
			format(var, 32, "%d pSR\n",PlayerInfo[playerid][pSR]);fwrite(hFile, var);
			format(var, 32, "%d pWA\n",PlayerInfo[playerid][pWA]);fwrite(hFile, var);
			format(var, 32, "%d pPEN\n",PlayerInfo[playerid][pPEN]);fwrite(hFile, var);
			format(var, 32, "%d pGun1\n",PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
			format(var, 32, "%d pGun2\n",PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
			format(var, 32, "%d pGun3\n",PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
			format(var, 32, "%d pGun4\n",PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
			format(var, 32, "%d pGun5\n",PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
			format(var, 32, "%d pGun6\n",PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo1\n",PlayerInfo[playerid][pAmmo1]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo2\n",PlayerInfo[playerid][pAmmo2]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo3\n",PlayerInfo[playerid][pAmmo3]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo4\n",PlayerInfo[playerid][pAmmo4]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo5\n",PlayerInfo[playerid][pAmmo5]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo6\n",PlayerInfo[playerid][pAmmo6]);fwrite(hFile, var);
			format(var, 32, "%.1f pSHealth\n", PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
			GetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);
			format(var, 32, "%.1f pHealth\n", PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
			GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
			if ((PlayerInfo[playerid][pPos_x]==0.0 && PlayerInfo[playerid][pPos_y]==0.0 && PlayerInfo[playerid][pPos_z]==0.0) || (gPlayerFighter[playerid] != 0))
			{
				PlayerInfo[playerid][pPos_x] = 1684.9;
				PlayerInfo[playerid][pPos_y] = -2244.5;
				PlayerInfo[playerid][pPos_z] = 13.5;
			}
			if(Spectate[playerid] != 255)
			{
				PlayerInfo[playerid][pPos_x] = Unspec[playerid][sPx];
				PlayerInfo[playerid][pPos_y] = Unspec[playerid][sPy];
				PlayerInfo[playerid][pPos_z] = Unspec[playerid][sPz];
				PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
			}
			format(var, 32, "%.1f pPos_x\n", PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
			format(var, 32, "%.1f pPos_y\n", PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
			format(var, 32, "%.1f pPos_z\n", PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
			format(var, 32, "%d pInt\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
			format(var, 32, "%d pLocal\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
			format(var, 32, "%d pTeam\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
			format(var, 32, "%d pModel\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
			format(var, 32, "%d pPnumber\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
			format(var, 32, "%d pPhousekey\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
			format(var, 32, "%d pPbiskey\n",PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
			fclose(hFile);
		}
		new bkey = PlayerInfo[playerid][pPbiskey];
		new hkey = PlayerInfo[playerid][pPhousekey];
		new playername[32];
		if(bkey != 255)
		{
			if(bkey >= 100)
			{
				strmid(SBizzInfo[bkey-100][sbOwner], name, 0, strlen(name), 255);
			}
			else
			{
				strmid(BizzInfo[bkey][bOwner], name, 0, strlen(name), 255);
			}
		}
		GetPlayerName(playerid, playername, sizeof(playername));
		if (hkey != 255 && strcmp(playername, HouseInfo[hkey][hOwner], true) == 0)
		{
			strmid(HouseInfo[hkey][hOwner], name, 0, strlen(name), 255);
		}
		OnPropUpdate();
	}
	else
	{
		SendClientMessage(playerid, COLOR_YELLOW, "You do not have an account, create one");
		ShowPlayerDialog(playerid, 10, DIALOG_STYLE_PASSWORD, "{076F13}Create an account", "{F0FF00}Welcome,\n{FFFFFF}choose your password\nfor register in Public Enemy: Los Santos server.", "Create", "");
	}
	if (gdebug){printf("DEBUG OnUpdatePlayer(%d)End", playerid);}
	return 1;
}

public OnPropUpdate()
{
	if (gdebug >= 1){printf("DEBUG OnPropUpdate()");}
	new idx;
	new File: file2;
	while (idx < sizeof(HouseInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%d,%d,%d,%d,%d,%d,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
		HouseInfo[idx][hEntrancex],
		HouseInfo[idx][hEntrancey],
		HouseInfo[idx][hEntrancez],
		HouseInfo[idx][hExitx],
		HouseInfo[idx][hExity],
		HouseInfo[idx][hExitz],
		HouseInfo[idx][hHealthx],
		HouseInfo[idx][hHealthy],
		HouseInfo[idx][hHealthz],
		HouseInfo[idx][hArmourx],
		HouseInfo[idx][hArmoury],
		HouseInfo[idx][hArmourz],
		HouseInfo[idx][hOwner],
		HouseInfo[idx][hDiscription],
		HouseInfo[idx][hValue],
		HouseInfo[idx][hHel],
		HouseInfo[idx][hArm],
		HouseInfo[idx][hInt],
		HouseInfo[idx][hLock],
		HouseInfo[idx][hOwned],
		HouseInfo[idx][hRooms],
		HouseInfo[idx][hRent],
		HouseInfo[idx][hRentabil],
		HouseInfo[idx][hTakings],
		HouseInfo[idx][hVec],
		HouseInfo[idx][hVcol1],
		HouseInfo[idx][hVcol2],
		HouseInfo[idx][hDate],
		HouseInfo[idx][hLevel]);
		if(idx == 0)
		{
			file2 = fopen("Gamemode/property.cfg", io_write);
		}
		else
		{
			file2 = fopen("Gamemode/property.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	idx = 0;
	while (idx < sizeof(BizzInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%d,%d,%d,%d,%d,%d,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
		BizzInfo[idx][bEntrancex],
		BizzInfo[idx][bEntrancey],
		BizzInfo[idx][bEntrancez],
		BizzInfo[idx][bExitx],
		BizzInfo[idx][bExity],
		BizzInfo[idx][bExitz],
		BizzInfo[idx][bHealthx],
		BizzInfo[idx][bHealthy],
		BizzInfo[idx][bHealthz],
		BizzInfo[idx][bArmourx],
		BizzInfo[idx][bArmoury],
		BizzInfo[idx][bArmourz],
		BizzInfo[idx][bOwner],
		BizzInfo[idx][bDiscription],
		BizzInfo[idx][bValue],
		BizzInfo[idx][bHel],
		BizzInfo[idx][bArm],
		BizzInfo[idx][bInt],
		BizzInfo[idx][bLock],
		BizzInfo[idx][bOwned],
		BizzInfo[idx][bEntcost],
		BizzInfo[idx][bTakings],
		BizzInfo[idx][bDate],
		BizzInfo[idx][bLevel],
		BizzInfo[idx][bProd],
		BizzInfo[idx][bProdCap],
		BizzInfo[idx][bComp],
		BizzInfo[idx][bCompCap],
		BizzInfo[idx][bProdCost],
		BizzInfo[idx][bPayComp],
		BizzInfo[idx][bPriceMod]);
		if(idx == 0)
		{
			file2 = fopen("Gamemode/bizz.cfg", io_write);
		}
		else
		{
			file2 = fopen("Gamemode/bizz.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	idx = 0;
	while (idx < sizeof(SBizzInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
		SBizzInfo[idx][sbEntrancex],
		SBizzInfo[idx][sbEntrancey],
		SBizzInfo[idx][sbEntrancez],
		SBizzInfo[idx][sbOwner],
		SBizzInfo[idx][sbDiscription],
		SBizzInfo[idx][sbValue],
		SBizzInfo[idx][sbHel],
		SBizzInfo[idx][sbArm],
		SBizzInfo[idx][sbInt],
		SBizzInfo[idx][sbLock],
		SBizzInfo[idx][sbOwned],
		SBizzInfo[idx][sbEntcost],
		SBizzInfo[idx][sbTakings],
		SBizzInfo[idx][sbDate],
		SBizzInfo[idx][sbLevel],
		SBizzInfo[idx][sbProd],
		SBizzInfo[idx][sbProdCap],
		SBizzInfo[idx][sbComp],
		SBizzInfo[idx][sbCompCap],
		SBizzInfo[idx][sbProdCost],
		SBizzInfo[idx][sbPayComp]);
		if(idx == 0)
		{
			file2 = fopen("Gamemode/sbizz.cfg", io_write);
		}
		else
		{
			file2 = fopen("Gamemode/sbizz.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public BroadCast(color,const string[])
{
	printf("%s", string);
	SendClientMessageToAll(color, string);
	return 1;
}

public ABroadCast(color,const string[],level)
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if ((IsPlayerAdmin(i)) || PlayerInfo[i][pAdmin] >= level)
			{
				SendClientMessage(i, color, string);
				printf("%s", string);
			}
		}
	}
	return 1;
}

public OOCOff(color,const string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && !gOoc[i])
		{
			SendClientMessage(i, color, string);
		}
	}
}

public PlaySoundAll(playerid, soundid, Float:psx ,Float:psy ,Float:psz)
{
	if (gdebug >= 1){printf("DEBUG PlaySoundAll(%d)", playerid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			PlayerPlaySound(i, soundid, psx, psy, psz);
		}
	}
}

public SendTeamMessage(team, color, string[])
{
if (gdebug >= 1){printf("DEBUG SendTeamMessage(%d)", team);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gTeam[i] == team)
		{
			SendClientMessage(i, color, string);
		}
	}
}

public SendTeamBeepMessage(team, color, string[])
{
if (gdebug >= 1){printf("DEBUG SendTeamMessage(%d)", team);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gTeam[i] == team)
		{
			SendClientMessage(i, color, string);
			RingTone[i] = 20;
		}
	}
}

public SendEnemyMessage(color, string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gTeam[i] >= 3)
		{
			SendClientMessage(i, color, string);
		}
	}
}


public SendAdminMessage(color, string[])
{
if (gdebug >= 1){printf("DEBUG SendAdminMessage()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && PlayerInfo[i][pAdmin] > 1)
		{
			SendClientMessage(i, color, string);
		}
	}
}



public AddCar(carcoords)
{
	new randcol = random(126);
	new randcol2 = 1;
	if (rccounter == 14)
	{
		rccounter = 0;
	}
	CreateVehicle(carselect[rccounter], CarSpawns[carcoords][pos_x], CarSpawns[carcoords][pos_y], CarSpawns[carcoords][pos_z], CarSpawns[carcoords][z_angle], randcol, randcol2, never);
	//AddStaticVehicle(carselect[rccounter], CarSpawns[carindex][pos_x], CarSpawns[carindex][pos_y], CarSpawns[carindex][pos_z], CarSpawns[carindex][z_angle],randcol,randcol2); // nm
	rccounter++;
	return 1;
}

public PlayerPlayMusic(playerid)
{
if (gdebug >= 1){printf("DEBUG PlayerPlayMusic(%d)",playerid);}
	SetTimer("StopMusic", 5000, 0);
	PlayerPlaySound(playerid, 1068, 0.0, 0.0, 0.0);
}

public StopMusic()
{
if (gdebug >= 1){printf("DEBUG StopMusic()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			PlayerPlaySound(i, 1069, 0.0, 0.0, 0.0);
		}
	}
}

public PlayerFixRadio(playerid)
{
if (gdebug >= 1){printf("DEBUG PlayerPlayMusic(%d)",playerid);}
	SetTimer("PlayerFixRadio2", 50, 0);
	PlayerPlaySound(playerid, 1068, 0.0, 0.0, 0.0);
	Fixr[playerid] = 1;
}

public PlayerFixRadio2()
{
if (gdebug >= 1){printf("DEBUG StopMusic()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(Fixr[i])
			{
				PlayerPlaySound(i, 1069, 0.0, 0.0, 0.0);
				Fixr[i] = 0;
			}
		}
	}
}

public PlayJailSound(sound , stopsound, duration, Float:jailx, Float:jaily, Float:jailz)
{
if (gdebug >= 1){printf("DEBUG PlayJailSound()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			PlayerPlaySound(i, sound, jailx, jaily, jailz);
			//printf("startjail %d",i);
			stopsoundt = stopsound;
			jailxt = jailx;
			jailyt = jaily;
			jailzt = jailz;
		}
	}
	SetTimer("StopJail", duration, 0);
}

public StopJail()
{
if (gdebug >= 1){printf("DEBUG StopJail()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			PlayerPlaySound(i, stopsoundt, jailxt, jailyt, jailzt);
			//printf("stopjail %d",i);
		}
	}
}

strrest(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
	new offset = index;
	new result[128];
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
IsNumeric(const string[])
{
        for (new i = 0, j = strlen(string); i < j; i++)
        {
                if (string[i] > '9' || string[i] < '0') return 0;
        }
        return 1;
}

//---------------------------<[ OnPlayerCommandText ]>--------------------------------------------------------
public OnPlayerCommandText(playerid, cmdtext[])
{
if (gdebug >= 1){printf("DEBUG OnPlayerCommandText(%d)",playerid);}
	CmdLog(cmdtext);
	new string[256];
	new playermoney;
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new playername[MAX_PLAYER_NAME];
	new cmd[256];
	new tmp[256];
	new Message[256];
    new gMessage[256];
    new pName[MAX_PLAYER_NAME+1];
    new iName[MAX_PLAYER_NAME+1];
	new giveplayerid, moneys, idx;
	cmd = strtok(cmdtext, idx);
	if(IsPlayerConnected(playerid) == 0){
	return 1;
 	}
 	 	if((cmdtext[0] == '/') && strlen(cmdtext) > 1) {

	    new character[256];
	    new i, j;
	    new found = 0;
	    new foundchar[256];

		for(i=1; i<(strlen(cmdtext)); i++) {
		strmid(character, cmdtext, i, i+1, 2);
  			for(j = 0; j<MAX_ALLOWED_CHARS; j++) {
		    	tmps1 = allowedchars[j];
		        if(strcmp(hash(character), hash(tmps1), false) == 0) {
          		found = 1;
          		foundchar = tmps1;
          		}
 		    }
	    if(found == 1) {
		found = 0;
	}else return SendClientMessage(playerid, 	COLOR_GRAD1,"Illegal character(s) used. Use [0-1], [a-z], [A-Z] or [!@#$%^&*()-[];:,.<>?/]");
		}
	}
//-------------------------------[anims]--------------------------------------------------------------------------
if(!strcmp(cmd, "/animlist", true))
{
      ShowPlayerDialog(playerid, 11, DIALOG_STYLE_MSGBOX, "{076F13}Server Animations", ShowAnims(), "Ok", "");
      return 1;
}
if(!strcmp(cmd, "/pee", true))
{
	SetPlayerSpecialAction(playerid, 68);
	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
	return 1;
}

if(!strcmp(cmd, "/handsup", true))
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
	return 1;
}

if(!strcmp(cmd, "/drunk", true))
{
	ApplyAnimation(playerid, "PED", "WALK_DRUNK", 4.0, 1, 1, 1, 1, 0);
	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
	return 1;
}

if(!strcmp(cmd, "/bomb", true))
{
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/vomit", true))
{
   	ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/eat", true))
{
   	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/slapass", true))
{
   	ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/crack", true))
{
   	ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/fu", true))
{
   	ApplyAnimation(playerid, "PED", "fucku", 4.0, 0, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/taichi", true))
{
   	ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/hurt", true))
{
   	ApplyAnimation(playerid, "SWAT", "gnstwall_injurd", 4.0, 1, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/box", true))
{
   	ApplyAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(!strcmp(cmd, "/wank", true))
{
   	ApplyAnimation(playerid, "PAULNMAC", "wank_out", 4.0, 0, 0, 0, 0, 0);
   	SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
   	return 1;
}

if(strcmp(cmd, "/smoke", true) == 0)
{
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
    SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To smoke, use the FIRE KEY and /stopanim to stop smoking.");
   	return 1;
}

if(strcmp(cmd, "/dance", true) == 0)
{
            new dancestyle;
      		tmp = strtok(cmdtext, idx);
			if(!strlen(tmp) || strlen(tmp) > 2) {
				SendClientMessage(playerid,COLOR_GRAD1,"USAGE: /dance [style 1-4]");
				SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
				return 1;
			}

			dancestyle = strval(tmp);
			if(dancestyle < 1 || dancestyle > 4) {
			    SendClientMessage(playerid,COLOR_GRAD1,"USAGE: /dance [style 1-4]");
			    SendClientMessage(playerid, COLOR_GRAD1, "ANIM: To stop anim use /stopanim.");
			    return 1;
			}

			if(dancestyle == 1) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
			} else if(dancestyle == 2) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
			} else if(dancestyle == 3) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
			} else if(dancestyle == 4) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
			}
 	  		return 1;
	}
	
if(strcmp(cmd, "/stopanim", true) == 0)
{
    ClearAnimations(playerid);
   	return 1;
}
//-------------------------------[weather & time]--------------------------------------------------------------------------
if(!strcmp(cmd, "/weather", true))
{
    new weather, str[128];
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp))
        return SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /weather [weatherid]");
    if(!IsNumeric(tmp))
        return SendClientMessage(playerid, COLOR_GRAD1, "ERROR: Weather id must be a number.");
    weather = strval(tmp);
    SetPlayerWeather(playerid, weather);
    format(str, sizeof(str),"You have set your weather to %d",weather);
    SendClientMessage(playerid,COLOR_YELLOW,str);
    return 1;
}

if(!strcmp(cmd, "/time", true))
{
    new time, str[128];
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp))
        return SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /time [time]");
    if(!IsNumeric(tmp))
        return SendClientMessage(playerid, COLOR_GRAD1, "ERROR: Time must be a number.");
    time = strval(tmp);
    SetPlayerTime(playerid, time, 0);
    format(str, sizeof(str),"You have set your time to %d",time);
    SendClientMessage(playerid,COLOR_YELLOW,str);
    return 1;
}
//-------------------------------[News]--------------------------------------------------------------------------
if(!strcmp(cmdtext, "/news", true))
{
    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "{076F13}Server News", ShowNews(), "Ok", "");
    return 1;
}
//-------------------------------[Credits]--------------------------------------------------------------------------
if(!strcmp(cmd, "/credits", true))
{
      ShowPlayerDialog(playerid, 2, DIALOG_STYLE_MSGBOX, "{076F13}Server Credits", ShowCredits(), "Ok", "");
      return 1;
}
//-------------------------------[Radio]--------------------------------------------------------------------------
if (strcmp(cmdtext, "/radio", true)==0)
   {
    ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{076F13}Radio Stations", "Radio Pop\nRadio Hip Hop\nRadio Video Games\nRadio Taraf\n{FF0000}Radio Off", "Listen", "Cancel");
    return 1;
   }
//-------------------------------[help]--------------------------------------------------------------------------
if(!strcmp(cmd, "/help", true))
{
      ShowPlayerDialog(playerid, 4, DIALOG_STYLE_MSGBOX, "{076F13}Help", ShowHelp(), "Ok", "");
      return 1;
}
//-------------------------------[cmds]--------------------------------------------------------------------------
if(!strcmp(cmd, "/cmds", true))
{
      ShowPlayerDialog(playerid, 5, DIALOG_STYLE_MSGBOX, "{076F13}Server Public Commands", ShowCmdsPage1(playerid), "Ok", "");
      return 1;
}
//-------------------------------[rules]--------------------------------------------------------------------------
if(!strcmp(cmd, "/rules", true))
{
      ShowPlayerDialog(playerid, 6, DIALOG_STYLE_MSGBOX, "{076F13}Server Rules", ShowRules(), "Ok", "");
      return 1;
}
//-------------------------------[acmds]--------------------------------------------------------------------------
if(!strcmp(cmd, "/acmds", true))
{
if (PlayerInfo[playerid][pAdmin] >= 1)
{
      ShowPlayerDialog(playerid, 7, DIALOG_STYLE_MSGBOX, "{076F13}Server Admin Commands", ShowAdminCmds(playerid), "Ok", "");
}
      return 1;
}
//-------------------------------[stats]--------------------------------------------------------------------------
if (strcmp(cmd, "/stats", true) == 0)
	{
            ShowPlayerDialog(playerid, 8, DIALOG_STYLE_MSGBOX, "{076F13}Stats", ShowStats(playerid), "Ok", "");
		}
//-------------------------------[duel]--------------------------------------------------------------------------
    if(!strcmp("/duel", cmd, true))
    {
    	new ids,tmps[3][80],w1,w2;

        tmps[0] = strtok(cmdtext, idx);
        tmps[1] = strtok(cmdtext, idx);
        tmps[2] = strtok(cmdtext, idx);

        ids = strval(tmps[0]);
        w1 = strval(tmps[1]);
        w2 = strval(tmps[2]);

        new id = strval(tmps[0]);

        if (gPublicEnemy == playerid)
			return SendClientMessage(playerid,COLOR_GRAD1,"SERVER: The Public Enemy No.1 can't play duels");

        if(InvitedDuel[playerid] == true)
			return SendClientMessage(playerid,COLOR_GRAD1,"DUEL: Invitation sended, wait for a response");

        if(!strlen(tmps[1]) || !strlen(tmps[2]))
		    return SendClientMessage(playerid,COLOR_GRAD1,"USAGE: /duel <id> <weapon 1> <weapon 2>");

        if(ids == playerid)
			return SendClientMessage(playerid,COLOR_GRAD1,"ERROR: You can not invite yourself");

        if(!IsPlayerConnected(id))
		    return SendClientMessage(playerid,COLOR_GRAD1,"ERROR: This player is not online");

        if(!strlen(tmps[0]))
			return SendClientMessage(playerid,COLOR_GRAD1,"ERROR: You must provide id of player that you want to duel with");

		if(!IsValidWeapon(w1) || !IsValidWeapon(w2))
  			return SendClientMessage(playerid,COLOR_GRAD1,"ERROR: Invalid weapons ID");

   		if(UsingArena == true)
			return SendClientMessage(playerid,COLOR_GRAD1,"DUEL: The duel arena is in using by someone else");

		if(InvitedDuel[ids] == true)
        	return SendClientMessage(playerid,COLOR_GRAD1,"DUEL: Currently the player is in a Duel, wait..");

        new name[24];
        GetPlayerName(playerid, name, sizeof(name));
        format(string, sizeof(string), "%s inviting you to a Duel\n(Press accept or decline the invite)",name);
        ShowPlayerDialog(ids,11,DIALOG_STYLE_MSGBOX,"{076F13}Duel",string,"Accept", "Decline");
        GameTextForPlayer(ids,"~r~DUEL!", 2500, 3);
        IdDuel[ids] = playerid;
        wep1[ids] = w1;
        wep2[ids] = w2;
        SetTimerEx("ExpireDuel",15000,false,"ii",ids,playerid);
        return true;
    }
//-------------------------------[Private Messages]--------------------------------------------------------------------------
if(strcmp("/pm", cmd, true) == 0)
        {
                tmp = strtok(cmdtext,idx);

                if(!strlen(tmp) || strlen(tmp) > 5) {
                        SendClientMessage(playerid,COLOR_GRAD1,"USAGE: /pm [id] [message]");
                        return 1;
                }

                new id = strval(tmp);
        gMessage = strrest(cmdtext,idx);

                if(!strlen(gMessage)) {
                        SendClientMessage(playerid,COLOR_GRAD1,"USAGE: /pm [id] [message]");
                        return 1;
                }

                if(!IsPlayerConnected(id)) {
                        SendClientMessage(playerid,COLOR_GRAD1,"ERROR: This player is not online.");
                        return 1;
                }

                if(playerid != id) {
                        GetPlayerName(id,iName,sizeof(iName));
                        GetPlayerName(playerid,pName,sizeof(pName));
                        format(Message,sizeof(Message),"PM to %s (ID: %d): %s",iName,id,gMessage);
                        SendClientMessage(playerid,0xFFFF00AA,Message);
                        format(Message,sizeof(Message),"PM from %s (ID: %d): %s",pName,playerid,gMessage);
                        SendClientMessage(id,0xFFFF00AA,Message);
                        PlayerPlaySound(id,1085,0.0,0.0,0.0);

                        printf("PM Logger: %s (ID:%s) (Name: %s)",Message, playerid, pName);

                }
                else {
                        SendClientMessage(playerid,COLOR_GRAD1,"ERROR: You can't send a PM to yourself!");
                }
                return 1;
        }
//-------------------------------[lounge]--------------------------------------------------------------------------
if (strcmp(cmdtext, "/lounge", true)==0)
{
new Float:hp;
GetPlayerHealth(playerid,hp);
if(PlayerInLounge[playerid] == 1)
{
     SetPlayerRandomSpawn(playerid);
     PlayerInLounge[playerid]=0;
}
else
{
if (gPublicEnemy == playerid)
{
SendClientMessage(playerid,COLOR_GRAD1,"SERVER: The Public Enemy No.1 can't join the lounge");
}
else
{
if(hp <= 40)
{
SendClientMessage(playerid,COLOR_GRAD1,"SERVER: You need atleast 40 HP for join the lounge");
}
else
{
		SetPlayerPos(playerid, -794.9882,492.3308,1376.1953);
	    SetPlayerInterior(playerid, 1);
	    SendClientMessage(playerid,COLOR_GRAD1,"SERVER: If you want to leave the lounge type again /lounge");
	    PlayerInLounge[playerid]=1;
	    ResetPlayerWeapons(playerid);
}
}
}
return 1;
}
//-------------------------------[suicide]--------------------------------------------------------------------------
if (strcmp(cmdtext, "/kill", true)==0)
{
SetPlayerHealth(playerid, 0);
return 1;
}
//-------------------------------[Pay]--------------------------------------------------------------------------
	if(strcmp(cmd, "/pay", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /pay [playerid/PartOfName] [amount]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if(PlayerInfo[giveplayerid][pLocal] == 106)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Command not allowed in this location");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /pay [playerid/PartOfName] [amount]");
			return 1;
		}
		moneys = strval(tmp);
		if(moneys > 1000 && PlayerInfo[playerid][pLevel] < 3)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "You must be level 3 to pay over 1000");
			return 1;
		}
		//if (gdebug){printf("DEBUG givecash_command: %d %d",giveplayerid,moneys);}
		if (IsPlayerConnected(giveplayerid))
		{
			if (ProxDetectorS(5.0, playerid, giveplayerid))
			{
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				playermoney = GetPlayerMoney(playerid);
				if (moneys > 0 && playermoney >= moneys)
				{
					GivePlayerMoney(playerid, (0 - moneys));
					GivePlayerMoney(giveplayerid, moneys);
					format(string, sizeof(string), "   You have sent %s(player: %d), $%d.", giveplayer,giveplayerid, moneys);
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD1, string);
					format(string, sizeof(string), "   You have recieved $%d from %s(player: %d).", moneys, sendername, playerid);
					SendClientMessage(giveplayerid, COLOR_GRAD1, string);
					format(string, sizeof(string), "%s has paid $%d to %s", sendername, moneys, giveplayer);
					PayLog(string);
					if(moneys >= 1000000)
					{
						ABroadCast(COLOR_YELLOW,string,1);
					}
					PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s takes out some cash, and hands it to %s.", sendername ,giveplayer);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Your too far away.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	return 1;
	}
	if(strcmp(cmd, "/charity", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /charity [amount]");
			return 1;
		}
		if(PlayerInfo[giveplayerid][pLocal] == 106)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Command not allowed in this location");
			return 1;
		}
		moneys = strval(tmp);
		if(moneys < 0)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "That is not enough.");
			return 1;
		}
		GivePlayerMoney(playerid, (-moneys));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s Thank you for you donation of, $%d.",sendername, moneys);
		printf("%s", string);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		SendClientMessage(playerid, COLOR_GRAD1, string);
		PayLog(string);
		return 1;
	}
//-------------------------------[Register]--------------------------------------------------------------------------
/*if (strcmp(cmd, "/regnick", true)==0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /regnick [password]");
			return 1;
		}
		if (gPlayerAccount[playerid] == 1)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   That name is registered");
			return 1;
		}
		gPlayerAccount[playerid] = 1;

		strmid(PlayerInfo[playerid][pPassword], tmp, 0, strlen(cmdtext), 255);
		Encript(PlayerInfo[playerid][pPassword]);
		GetPlayerName(playerid, playername, sizeof(playername));
		format(string, sizeof(string), "%s.cer", playername);
		PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
		new File: file = fopen(string, io_read);
		if (file)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   That nick is registered");
			fclose(file);
			return 1;
		}
	//	new Float:px, Float:py, Float:pz;//
	//	new Float:health;//
		//new randphone = 1000 + random(8999);//minimum 1000  max 9999 //giving one at the start
		//PlayerInfo[playerid][pPnumber] = randphone;
		printf("%s has created an account.", playername);
		new File:hFile;
		hFile = fopen(string, io_append);
		new var[32];//
		format(var, 32, "%s\n", PlayerInfo[playerid][pPassword]);fwrite(hFile, var);
		format(var, 32, "%d pCash\n", PlayerInfo[playerid][pCash]);fwrite(hFile, var);
		format(var, 32, "%d pAccount\n", PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
		format(var, 32, "%d pAdmin\n", PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
		format(var, 32, "%d pLevel\n", PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
		format(var, 32, "%d pExp\n", PlayerInfo[playerid][pExp]);fwrite(hFile, var);
		format(var, 32, "%d gPupgrade\n", PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
		format(var, 32, "%d pKills\n", PlayerInfo[playerid][pKills]);fwrite(hFile, var);
		format(var, 32, "%d pCB\n", PlayerInfo[playerid][pCB]);fwrite(hFile, var);
		format(var, 32, "%d pHW\n", PlayerInfo[playerid][pHW]);fwrite(hFile, var);
		format(var, 32, "%d pSR\n", PlayerInfo[playerid][pSR]);fwrite(hFile, var);
		format(var, 32, "%d pWA\n", PlayerInfo[playerid][pWA]);fwrite(hFile, var);
		format(var, 32, "%d pPEN\n", PlayerInfo[playerid][pPEN]);fwrite(hFile, var);
		format(var, 32, "%d pGun1\n", PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
		format(var, 32, "%d pGun2\n", PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
		format(var, 32, "%d pGun3\n", PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
		format(var, 32, "%d pGun4\n", PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
		format(var, 32, "%d pGun5\n", PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
		format(var, 32, "%d pGun6\n", PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo1\n", PlayerInfo[playerid][pAmmo1]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo2\n", PlayerInfo[playerid][pAmmo2]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo3\n", PlayerInfo[playerid][pAmmo3]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo4\n", PlayerInfo[playerid][pAmmo4]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo5\n", PlayerInfo[playerid][pAmmo5]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo6\n", PlayerInfo[playerid][pAmmo6]);fwrite(hFile, var);
		format(var, 32, "%f pSHealth\n", PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
		format(var, 32, "%f pHealth\n", PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
		format(var, 32, "%f pPos_x\n", PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
		format(var, 32, "%f pPos_y\n", PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
		format(var, 32, "%f pPos_z\n", PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
		if(accountplay)
		{
			PlayerInfo[playerid][pInt] = 0;
		}
		format(var, 32, "%d pInt\n", PlayerInfo[playerid][pInt]);fwrite(hFile, var);
		format(var, 32, "%d pLocal\n", PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
		format(var, 32, "%d pTeam\n", PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
		format(var, 32, "%d pModel\n", PlayerInfo[playerid][pModel]);fwrite(hFile, var);
		format(var, 32, "%d pPnumber\n", PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
		format(var, 32, "%d pPhousekey\n", PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
		format(var, 32, "%d pPbiskey\n", PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
		fclose(hFile);
		OnPlayerLogin(playerid,PlayerInfo[playerid][pPassword]);
		return 1;
	}*/
//-------------------------------[Register]--------------------------------------------------------------------------
	if (strcmp(cmd, "/changepass", true)==0)
	{
		tmp = strtok(cmdtext, idx);
		if (gPlayerLogged[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not Logged In");
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /changepass [password]");
			return 1;
		}
		strmid(PlayerInfo[playerid][pPassword], tmp, 0, strlen(cmdtext), 255);
		format(string, sizeof(string), "Your new password is %s don't forget it", PlayerInfo[playerid][pPassword]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		Encript(PlayerInfo[playerid][pPassword]);
		OnUpdatePlayer(playerid);
		GetPlayerName(playerid, playername, sizeof(playername));
		printf("%s has changed there password.", playername);
		return 1;
	}
	if (strcmp(cmd, "/changenick", true)==0)
	{
		tmp = strtok(cmdtext, idx);
		new string2[256];
		if (gPlayerLogged[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not Logged In");
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /changename [newname]");
			return 1;
		}
		format(string, sizeof(string), "%s.cer", tmp);
		if(fexist(string))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   That nick is registered");
			return 1;
		}
		OnPlayerRename(tmp,string,playerid);
		format(string, sizeof(string), "You may now reconnect with the name %s", tmp);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		GetPlayerName(playerid, playername, sizeof(playername));
		format(string2, sizeof(string2), "%s.cer", playername);
		printf("%s has changed there name to %s.", playername,tmp);
		gPlayerLogged[playerid] = 0;
		fremove(string2);
		return 1;
	}
//-------------------------------[Level]--------------------------------------------------------------------------
	if(strcmp(cmd, "/dn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPos(playerid, slx, sly, slz-2);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not An Admin");
		}
		return 1;
	}
	if(strcmp(cmd, "/up", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPos(playerid, slx, sly, slz+2);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not An Admin");
		}
		return 1;
	}
	if (strcmp(cmd, "/fly", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:px, Float:py, Float:pz, Float:pa;
			GetPlayerFacingAngle(playerid,pa);
			if(pa >= 0.0 && pa <= 22.5) //n1
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px, py+30, pz+5);
			}
			if(pa >= 332.5 && pa < 0.0) //n2
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px, py+30, pz+5);
			}
			if(pa >= 22.5 && pa <= 67.5) //nw
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px-15, py+15, pz+5);
			}
			if(pa >= 67.5 && pa <= 112.5) //w
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px-30, py, pz+5);
			}
			if(pa >= 112.5 && pa <= 157.5) //sw
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px-15, py-15, pz+5);
			}
			if(pa >= 157.5 && pa <= 202.5) //s
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px, py-30, pz+5);
			}
			if(pa >= 202.5 && pa <= 247.5)//se
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px+15, py-15, pz+5);
			}
			if(pa >= 247.5 && pa <= 292.5)//e
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px+30, py, pz+5);
			}
			if(pa >= 292.5 && pa <= 332.5)//e
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px+15, py+15, pz+5);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not An Admin");
		}
		return 1;
	}
	if(strcmp(cmd, "/lt", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPos(playerid, slx, sly+2, slz);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not An Admin");
		}
		return 1;
	}
	if(strcmp(cmd, "/rt", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPos(playerid, slx, sly-2, slz-2);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not An Admin");
		}
		return 1;
	}
//-------------------------------[Stats]--------------------------------------------------------------------------
	if (strcmp(cmd, "/pstats", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /pstats [playerid/PartOfName]");
				return 1;
			}
			if(IsStringAName(tmp))
			{
				giveplayerid = GetPlayerID(tmp);
			}
			else
			{
				giveplayerid = strval(tmp);
			}
			if(IsPlayerConnected(giveplayerid))
			{
            PrintPlayerWeapons(playerid,giveplayerid);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   No Such Player");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You are not an admin");
		}
	}
	if (strcmp(cmd, "/number", true) == 0)
	{
		if (gPhoneBook[playerid] == 1)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /number [playerid/PartOfName]");
				return 1;
			}
			if(IsStringAName(tmp))
			{
				giveplayerid = GetPlayerID(tmp);
			}
			else
			{
				giveplayerid = strval(tmp);
			}
			if(IsPlayerConnected(giveplayerid))
			{
				GetPlayerName(giveplayerid, sendername, sizeof(sendername));
				format(string, 256, "Name: %s, Ph: %d",sendername,PlayerInfo[giveplayerid][pPnumber]);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   No Such Player");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Do Not Have A PhoneBook");
		}
	}
//-------------------------------[BuyLevel]--------------------------------------------------------------------------
	if (strcmp(cmd, "/buylevel", true) == 0)
	{
		if (gPlayerLogged[playerid] != 0)
		{
			PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);//
			if (gdebug){printf("DEBUG buylev cash = %d", PlayerInfo[playerid][pCash]);}
			if(PlayerInfo[playerid][pLevel] >= 0)
			{
				new nxtlevel = PlayerInfo[playerid][pLevel]+1;
				new costlevel = nxtlevel*levelcost;//10k for testing purposes
				new expamount = nxtlevel*levelexp;
				new infostring[256];
				if (PlayerInfo[playerid][pCash] < costlevel)
				{
					format(infostring, 256, "   You do Not Have Enough Cash ($%d)",costlevel);
					SendClientMessage(playerid, COLOR_GRAD1, infostring);
				}
				if (PlayerInfo[playerid][pExp] < expamount)
				{
					format(infostring, 256, "   You Need %d Experiance Points, You Curently Have [%d]",expamount,PlayerInfo[playerid][pExp]);
					SendClientMessage(playerid, COLOR_GRAD1, infostring);
				}
				else
				{
					format(string, sizeof(string), "~g~LEVEL UP~n~~w~You Are Now Level %d", nxtlevel);
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					PlayerPlayMusic(playerid);
					GivePlayerMoney(playerid, (-costlevel));
					PlayerInfo[playerid][pLevel]++;
					PlayerInfo[playerid][pExp] = 0;
					PlayerInfo[playerid][gPupgrade] = PlayerInfo[playerid][gPupgrade]+2;
					GameTextForPlayer(playerid, string, 5000, 1);
					format(infostring, 256, "   You Bought Level %d For ($%d) Type /upgrade", nxtlevel, costlevel);
					SendClientMessage(playerid, COLOR_GRAD1, infostring);
					format(infostring, 256, "   You Have %d Unspent Upgrade Points",PlayerInfo[playerid][gPupgrade]);
					SendClientMessage(playerid, COLOR_GRAD2, infostring);
				}
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not Logged In");
		}
	}
//-------------------------------[UPGRADE]--------------------------------------------------------------------------
	if (strcmp(cmd, "/carcolor", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD3,"($5000) USAGE: /carcolor [color 1 - 2] [color number]");
				return 1;
			}
			new colornum = strval(tmp);
			if(colornum > 2 || colornum < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD3,"Choices are 1 or 2");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD3,"($5000) USAGE: /carcolor [color 1 - 2] [color number]");
			}
			new color = strval(tmp);
			if(color > 126)
			{
				SendClientMessage(playerid, COLOR_GRAD3,"Maximum is 126");
				return 1;
			}
			if (GetPlayerMoney(playerid) < 5000)
			{
				SendClientMessage(playerid, COLOR_GRAD3,"You can't afford that ($5000)");
			}
			if(colornum == 1)
			{
				HouseInfo[house][hVcol1] = color;
				format(string, sizeof(string), "Car color 1 set to %d -$5000",color);
				SendClientMessage(playerid, COLOR_GRAD3,string);
			}
			else
			{
				HouseInfo[house][hVcol2] = color;
				format(string, sizeof(string), "Car color 2 set to %d -$5000",color);
				SendClientMessage(playerid, COLOR_GRAD3,string);
			}
			SendClientMessage(playerid, COLOR_GRAD6, "Your new paintjob will be complete within 24 hours");
			GivePlayerMoney(playerid,-5000);
			SBizzInfo[6][sbTakings] = SBizzInfo[6][sbTakings]+5000;
			PlayerPlaySound(giveplayerid, 1134, 0.0, 0.0, 0.0);
			OnPropUpdate();
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
			return 1;
		}
		return 1;
	}
	if (strcmp(cmd, "/carupgrade", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			new gunid[16];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				format(string, sizeof(string), "USAGE: /carupgrade [carname]");
				SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
				SendClientMessage(playerid, COLOR_WHITE,"*** CAR UPGRADES Cost $100000 ***");
				SendClientMessage(playerid, COLOR_GRAD2,string);
				if(PlayerInfo[playerid][pLevel] == 3)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 3 Cars: freeway feltzer saber blade vortex quad");
				}
				else if(PlayerInfo[playerid][pLevel] == 4)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 4 Cars: freeway feltzer saber blade savanna remington vortex quad");
				}
				else if(PlayerInfo[playerid][pLevel] == 5)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 5 Cars: freeway feltzer saber blade savanna remington buccaneer flash vortex quad");
				}
				else if(PlayerInfo[playerid][pLevel] == 6)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 6 Cars: freeway feltzer saber blade savanna remington buccaneer flash");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 6 Cars: slamvan uranus sultan vortex quad sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 7)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 7 Cars: freeway feltzer saber blade savanna remington buccaneer flash");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 7 Cars: slamvan uranus sultan jester elergy vortex quad sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 8)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 8 Cars: freeway feltzer saber blade savanna remington buccaneer flash");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 8 Cars: slamvan uranus sultan jester elergy supergt blistac vortex quad sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 9)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 9 Cars: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 9 Cars: slamvan uranus sultan jester elergy supergt blistac zr350 vortex quad sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 10)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 10 Cars: freeway feltzer saber blade savanna remington buccaneer flash sandking quad sanchez");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 10 Cars: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah vortex duneride");
				}
				else if(PlayerInfo[playerid][pLevel] == 11)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 11 Cars: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 11 Cars: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah");
					SendClientMessage(playerid, COLOR_GRAD1, "Level 11 Cars: banshee fcr900 comet vortex quad duneride sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 12)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 12 Cars: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 12 Cars: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah");
					SendClientMessage(playerid, COLOR_GRAD1, "Level 12 Cars: banshee fcr900 comet hotring vortex quad duneride sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 13)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 13 Cars: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 13 Cars: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah");
					SendClientMessage(playerid, COLOR_GRAD1, "Level 13 Cars: banshee fcr900 comet hotring turismo bullet vortex quad duneride sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 14)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 14 Cars: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 14 Cars: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah sanchez");
					SendClientMessage(playerid, COLOR_GRAD1, "Level 14 Cars: banshee fcr900 comet hotring turismo bullet infurnus vortex quad duneride");
				}
				else if(PlayerInfo[playerid][pLevel] >= 15)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 15 Cars: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Level 15 Cars: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah sanchez");
					SendClientMessage(playerid, COLOR_GRAD1, "Level 15 Cars: banshee fcr900 comet hotring turismo bullet infurnus monster monstera");
					SendClientMessage(playerid, COLOR_GRAD1, "Level 15 Cars: monsterb vortex quad duneride bfinject stretch");
				}
				SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
				return 1;
			}
			if(SBizzInfo[6][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
				return 1;
			}
			strmid(gunid, tmp, 0, strlen(cmdtext), 255);
			if (GetPlayerMoney(playerid) > 100000)
			{
				if (PlayerInfo[playerid][pLevel] >= 18 && (strcmp(gunid, "nrg500", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Bike Is Now An Nrg-500");
					HouseInfo[house][hVec] = 522;
				}
				else if (PlayerInfo[playerid][pLevel] >= 15 && (strcmp(gunid, "monster", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now An monster");
					HouseInfo[house][hVec] = 444;
				}
				else if (PlayerInfo[playerid][pLevel] >= 15 && (strcmp(gunid, "stretch", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A stretch");
					HouseInfo[house][hVec] = 409;
				}
				else if (PlayerInfo[playerid][pLevel] >= 15 && (strcmp(gunid, "monstera", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now An monstera");
					HouseInfo[house][hVec] = 556;
				}
				else if (PlayerInfo[playerid][pLevel] >= 15 && (strcmp(gunid, "monsterb", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now An monsterb");
					HouseInfo[house][hVec] = 557;
				}

				else if (PlayerInfo[playerid][pLevel] >= 16 && (strcmp(gunid, "infurnus", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now An infurnus");
					HouseInfo[house][hVec] = 411;
				}

				else if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "bullet", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A bullet");
					HouseInfo[house][hVec] = 541;
				}
				else if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "turismo", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A turismo");
					HouseInfo[house][hVec] = 451;
				}
				else if (PlayerInfo[playerid][pLevel] >= 12 && (strcmp(gunid, "hotring", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A hotring");
					HouseInfo[house][hVec] = 502;
				}
				else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "banshee", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A banshee");
					HouseInfo[house][hVec] = 429;
				}
				else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "fbiranch", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A fbiranch");
					HouseInfo[house][hVec] = 490;
				}
				else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "comet", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A comet");
					HouseInfo[house][hVec] = 480;
				}
				else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "fcr900", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Bike Is Now A fcr900");
					HouseInfo[house][hVec] = 521;
				}
				else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "cheetah", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A cheetah");
					HouseInfo[house][hVec] = 415;
				}
				else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "hotknife", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A hotknife");
					HouseInfo[house][hVec] = 434;
				}
				else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "enforcer", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A enforcer");
					HouseInfo[house][hVec] = 427;
				}
				else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "duneride", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A duneride");
					HouseInfo[house][hVec] = 573;
				}
				else if (PlayerInfo[playerid][pLevel] >= 9 && (strcmp(gunid, "zr350", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A zr350");
					HouseInfo[house][hVec] = 477;
				}
				else if (PlayerInfo[playerid][pLevel] >= 9 && (strcmp(gunid, "sandking", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A sandking");
					HouseInfo[house][hVec] = 495;
				}
				else if (PlayerInfo[playerid][pLevel] >= 8 && (strcmp(gunid, "blistac", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A blistac");
					HouseInfo[house][hVec] = 496;
				}
				else if (PlayerInfo[playerid][pLevel] >= 8 && (strcmp(gunid, "supergt", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A supergt");
					HouseInfo[house][hVec] = 506;
				}
				else if (PlayerInfo[playerid][pLevel] >= 7 && (strcmp(gunid, "elergy", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A elergy");
					HouseInfo[house][hVec] = 562;
				}
				else if (PlayerInfo[playerid][pLevel] >= 7 && (strcmp(gunid, "jester", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A jester");
					HouseInfo[house][hVec] = 559;
				}
				else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "sultan", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A sultan");
					HouseInfo[house][hVec] = 560;
				}
				else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "sanchez", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A sanchez");
					HouseInfo[house][hVec] = 468;
				}
				else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "huntley", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A huntley");
					HouseInfo[house][hVec] = 579;
				}
				else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "slamvan", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A slamvan");
					HouseInfo[house][hVec] = 535;
				}
				else if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "flash", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A flash");
					HouseInfo[house][hVec] = 565;
				}
				else if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "buccaneer", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A buccaneer");
					HouseInfo[house][hVec] = 518;
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "savanna", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A savanna");
					HouseInfo[house][hVec] = 567;
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "remington", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A remington");
					HouseInfo[house][hVec] = 534;
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "journey", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A journey");
					HouseInfo[house][hVec] = 508;
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "rancher", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A rancher");
					HouseInfo[house][hVec] = 489;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "huntly", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A huntly");
					HouseInfo[house][hVec] = 579;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "copcar", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A copcar");
					HouseInfo[house][hVec] = 596;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "blade", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A blade");
					HouseInfo[house][hVec] = 536;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "buffalo", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A buffalo");
					HouseInfo[house][hVec] = 402;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "saber", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A saber");
					HouseInfo[house][hVec] = 475;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "feltzer", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A feltzer");
					HouseInfo[house][hVec] = 533;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "freeway", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A freeway");
					HouseInfo[house][hVec] = 463;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "vortex", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A vortex");
					HouseInfo[house][hVec] = 539;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "quad", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A quad");
					HouseInfo[house][hVec] = 471;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD6, "   Unrecognized Car");
					return 1;
				}
				SendClientMessage(playerid, COLOR_GRAD6, "Your new car will be delivered within 24 hours -$100000");
				OnPropUpdate();
				GivePlayerMoney(playerid,-100000);
				SBizzInfo[6][sbTakings] = SBizzInfo[6][sbTakings]+100000;
				SBizzInfo[6][sbProd]--;
				PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You can't afford that ($100000)");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
			return 1;
		}
	}
	if (strcmp(cmd, "/resetupgrades", true) == 0)
	{
		if (gPlayerLogged[playerid] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You Are Not Logged In");
			return 1;
		}
		if (GetPlayerMoney(playerid) < 100000)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Cost is $100000");
			return 1;
		}
		if (PlayerInfo[playerid][pLevel] < 2)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You need to be at least level 2");
			return 1;
		}
		PlayerInfo[playerid][gPupgrade] = (PlayerInfo[playerid][pLevel]-1)*2;
		PlayerInfo[playerid][pGun1] = 0;
		PlayerInfo[playerid][pGun2] = 0;
		PlayerInfo[playerid][pGun3] = 0;
		PlayerInfo[playerid][pGun4] = 0;
		PlayerInfo[playerid][pGun5] = 0;
		PlayerInfo[playerid][pGun6] = 0;
		PlayerInfo[playerid][pAmmo1] = 200;
		PlayerInfo[playerid][pAmmo2] = 8;
		PlayerInfo[playerid][pAmmo3] = 30;
		PlayerInfo[playerid][pAmmo4] = 30;
		PlayerInfo[playerid][pAmmo5] = 10;
		PlayerInfo[playerid][pAmmo6] = 10;
		PlayerInfo[playerid][pSHealth] = 0.0;
		GivePlayerMoney(playerid,-100000);
		//SBizzInfo[6][sbTakings] = SBizzInfo[6][sbTakings]+100000;
		PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
		format(string, 256, "   You Have %d Unspent Upgrade Points",PlayerInfo[playerid][gPupgrade]);
		SendClientMessage(playerid, COLOR_GRAD2, string);
	}
	if(strcmp(cmd, "/bestbuy", true) == 0)
	{
		new tmpprice;
		new store;
		if(Locator[playerid] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "you do not have this device");
			return 1;
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if(BizzInfo[i][bPriceMod] < tmpprice && BizzInfo[i][bEntcost] == 0 && BizzInfo[i][bProd] > 0)
			{
				tmpprice = BizzInfo[i][bPriceMod];
				store = i;
			}
			for(new j = 0; j < sizeof(BizzInfo); j++)
			{
			 	if(BizzInfo[j][bPriceMod] < tmpprice && BizzInfo[j][bEntcost] == 0 && BizzInfo[j][bProd] > 0)
			 	{
			 		tmpprice = BizzInfo[j][bPriceMod];
			 		store = j;
				}
			}
		}
		SetPlayerCheckpoint(playerid,BizzInfo[store][bEntrancex], BizzInfo[store][bEntrancey], BizzInfo[store][bEntrancez], 4.0);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
		GameTextForPlayer(playerid, "~w~Waypoint set ~r~Best Buy", 5000, 1);
		return 1;
	}
	if(strcmp(cmd, "/bestsale", true) == 0)
	{
		new tmpprice = 0;
		new store = 255;
		if(Locator[playerid] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "you do not have this device");
			return 1;
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if(BizzInfo[i][bPayComp] > tmpprice && BizzInfo[i][bCompCap] > BizzInfo[i][bComp] && BizzInfo[i][bTakings] > BizzInfo[i][bPayComp])
			{
				tmpprice = BizzInfo[i][bPayComp];
				store = i;
			}
			for(new j = 0; j < sizeof(BizzInfo); j++)
			{
			 	if(store != 255 && BizzInfo[j][bPayComp] > tmpprice && BizzInfo[j][bCompCap] > BizzInfo[j][bComp] && BizzInfo[j][bTakings] > BizzInfo[j][bPayComp])
			 	{
			 		tmpprice = BizzInfo[j][bPayComp];
			 		store = j;
				}
			}
		}
		if(store == 255)
		{
			GameTextForPlayer(playerid, "~w~There are no sales to be made for now.", 5000, 1);
			return 1;
		}
		SetPlayerCheckpoint(playerid,BizzInfo[store][bEntrancex], BizzInfo[store][bEntrancey], BizzInfo[store][bEntrancez], 4.0);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
		GameTextForPlayer(playerid, "~w~Waypoint set ~r~Best Sale", 5000, 1);
		return 1;
	}
	if (strcmp(cmd, "/buygun", true) == 0)
	{
		new gun;
		new gunid[16];
		new gunstring1[256];
		new gunstring2[256];
		new gunstring3[256];
		new gunstring4[256];
		new gunstring5[256];
		new infostring[256];
		new guncharge;
		new ammocharge;
		new location = PlayerInfo[playerid][pLocal];
		if(location < 99 || location == 255)
		{
			SendClientMessage(playerid, COLOR_WHITE,"You are not in a store");
			return 1;
		}
		new mod = (BizzInfo[location-99][bPriceMod]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string, sizeof(string), "USAGE: /buygun [gunname] [ammoamount]");
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** Guns & Ammo ***");
			SendClientMessage(playerid, COLOR_GRAD2,string);
			format(gunstring1, 256, "Weapons: parachute ($%d) golfclub ($%d) nightstick ($%d) knife ($%d) baseballbat ($%d) shovel ($%d) poolcue ($%d)",
			GunPrice[0][0]/100*mod,GunPrice[1][0]/100*mod,GunPrice[2][0]/100*mod,GunPrice[3][0]/100*mod,GunPrice[4][0]/100*mod,GunPrice[5][0]/100*mod,GunPrice[6][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring1);
			format(gunstring2, 256, "Weapons: purpledildo ($%d) whitedildo ($%d) longwhitedildo ($%d) whitedildo2 ($%d) flowers ($%d) cane",
			GunPrice[7][0]/100*mod,GunPrice[8][0]/100*mod,GunPrice[9][0]/100*mod,GunPrice[10][0]/100*mod,GunPrice[11][0]/100*mod,GunPrice[12][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring2);
			format(gunstring3, 256, "Weapons: sdpistol ($%d) colt45 ($%d) deagle ($%d) tec9 ($%d)  uzi ($%d) mp5 ($%d)",
			GunPrice[13][0]/100*mod,GunPrice[14][0]/100*mod,GunPrice[15][0]/100*mod,GunPrice[16][0]/100*mod,GunPrice[17][0]/100*mod,GunPrice[18][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring3);
			format(gunstring4, 256, "Weapons: shotgun ($%d) spas12 ($%d)sawnoff ($%d) ak47 ($%d) m4 ($%d) rifle ($%d)",
			GunPrice[19][0]/100*mod,GunPrice[20][0]/100*mod,GunPrice[21][0]/100*mod,GunPrice[22][0]/100*mod,GunPrice[23][0]/100*mod,GunPrice[24][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring4);
			format(gunstring5, 256, "Weapons: pistolammo ($%d) shotgunammo ($%d) smgammo ($%d) assaultammo ($%d) rifleammo ($%d)",
			GunPrice[25][0],GunPrice[26][0],GunPrice[27][0],GunPrice[28][0],GunPrice[29][0]);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring5);
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			return 1;
		}
		strmid(gunid, tmp, 0, strlen(cmdtext), 255);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string, sizeof(string), "USAGE: /buygun [gunname] [ammoamount]");
			return 1;
		}
		new ammo = strval(tmp);
		/*
		if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "minigun", true, strlen(gunid)) == 0))
		{
			SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A minigun");
			PlayerInfo[playerid][pGun6] = 38;
			ResetPlayerWeapons(playerid);
			SetPlayerWeapons(playerid);
			PlayerInfo[playerid][gPupgrade]--;
		}

		if (PlayerInfo[playerid][pLevel] >= 12 && (strcmp(gunid, "flamethrower", true, strlen(gunid)) == 0))
		{
			SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A flamethrower");
			PlayerInfo[playerid][pGun6] = 37;
		}
		*/
		if (strcmp(gunid, "parachute", true, strlen(gunid)) == 0)
		{
			gun = 46;
			guncharge = GunPrice[0][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "golfclub", true, strlen(gunid)) == 0)
		{
			gun = 2;
			guncharge = GunPrice[1][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "nightstick", true, strlen(gunid)) == 0)
		{
			gun = 3;
			guncharge = GunPrice[2][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "knife", true, strlen(gunid)) == 0)
		{
			gun = 4;
			guncharge = GunPrice[3][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "baseballbat", true, strlen(gunid)) == 0)
		{
			gun = 5;
			guncharge = GunPrice[4][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "shovel", true, strlen(gunid)) == 0)
		{
			gun = 6;
			guncharge = GunPrice[5][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "poolcue", true, strlen(gunid)) == 0)
		{
			gun = 7;
			guncharge = GunPrice[6][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "purpledildo", true, strlen(gunid)) == 0)
		{
			gun = 10;
			guncharge = GunPrice[7][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "whitedildo", true, strlen(gunid)) == 0)
		{
			gun = 11;
			guncharge = GunPrice[8][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "longwhitedildo", true, strlen(gunid)) == 0)
		{
			gun = 12;
			guncharge = GunPrice[9][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "whitedildo2", true, strlen(gunid)) == 0)
		{
			gun = 13;
			guncharge = GunPrice[10][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "flowers", true, strlen(gunid)) == 0)
		{
			gun = 14;
			guncharge = GunPrice[11][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "cane", true, strlen(gunid)) == 0)
		{
			gun = 15;
			guncharge = GunPrice[12][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "sdpistol", true, strlen(gunid)) == 0)
		{
			gun = 23;
			guncharge = GunPrice[13][0]/100*mod;
			ammocharge = GunPrice[25][0]*ammo;
		}
		else if (strcmp(gunid, "colt45", true, strlen(gunid)) == 0)
		{
			gun = 22;
			guncharge = GunPrice[14][0]/100*mod;
			ammocharge = GunPrice[25][0]*ammo;
		}
		else if (strcmp(gunid, "deagle", true, strlen(gunid)) == 0)
		{
			gun = 24;
			guncharge = GunPrice[15][0]/100*mod;
			ammocharge = GunPrice[25][0]*ammo;
		}
		else if (strcmp(gunid, "Tec9", true, strlen(gunid)) == 0)
		{
			gun = 32;
			guncharge = GunPrice[16][0]/100*mod;
			ammocharge = GunPrice[27][0]*ammo;
		}
		else if (strcmp(gunid, "uzi", true, strlen(gunid)) == 0)
		{
			gun = 28;
			guncharge = GunPrice[17][0]/100*mod;
			ammocharge = GunPrice[27][0]*ammo;
		}
		else if (strcmp(gunid, "mp5", true, strlen(gunid)) == 0)
		{
			gun = 29;
			guncharge = GunPrice[18][0]/100*mod;
			ammocharge = GunPrice[27][0]*ammo;
		}
		else if (strcmp(gunid, "shotgun", true, strlen(gunid)) == 0)
		{
			gun = 25;
			guncharge = GunPrice[19][0]/100*mod;
			ammocharge = GunPrice[26][0]*ammo;
		}
		else if (strcmp(gunid, "spas12", true, strlen(gunid)) == 0)
		{
			gun = 27;
			guncharge = GunPrice[20][0]/100*mod;
			ammocharge = GunPrice[26][0]*ammo;
		}
		else if (strcmp(gunid, "sawnoff", true, strlen(gunid)) == 0)
		{
			gun = 26;
			guncharge = GunPrice[21][0]/100*mod;
			ammocharge = GunPrice[26][0]*ammo;
		}
		else if (strcmp(gunid, "ak47", true, strlen(gunid)) == 0)
		{
			gun = 30;
			guncharge = GunPrice[22][0]/100*mod;
			ammocharge = GunPrice[28][0]*ammo;
		}
		else if (strcmp(gunid, "m4", true, strlen(gunid)) == 0)
		{
			gun = 31;
			guncharge = GunPrice[23][0]/100*mod;
			ammocharge = GunPrice[28][0]*ammo;
		}
		else if (strcmp(gunid, "rifle", true, strlen(gunid)) == 0)
		{
			gun = 33;
			guncharge = GunPrice[24][0]/100*mod;
			ammocharge = GunPrice[29][0]*ammo;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD6, "ShopKeeper says: I have never heard of that weapon.");
			return 1;
		}
		if((guncharge+ammocharge) > GetPlayerMoney(playerid))
		{
			format(infostring, 256, "You Dont Have $%d",guncharge+ammocharge);
			SendClientMessage(playerid, COLOR_GRAD3, infostring);
			return 1;
		}
		format(infostring, 256, "You have purchased %s with %d ammo for $%d",gunid,ammo,guncharge+ammocharge);
		SendClientMessage(playerid, COLOR_GRAD3, infostring);
		GivePlayerMoney(playerid,-(guncharge+ammocharge));
		BizzInfo[location-99][bTakings] = BizzInfo[location-99][bTakings]+(guncharge+ammocharge);
		BizzInfo[location-99][bProd]--;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		GivePlayerWeapon(playerid, gun, ammo);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s bought weapons for $%d at biz %d", sendername, (guncharge+ammocharge), location-99);
		printf("%s", string);
		PayLog(string);
		return 1;
	}
	if (strcmp(cmd, "/upgrade", true) == 0)
	{
		new gunid[16];
		new infostring[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string, sizeof(string), "USAGE: /upgrade [upgradename] (You Have %d Upgrade points)",PlayerInfo[playerid][gPupgrade]);
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** UPGRADES ***");
			SendClientMessage(playerid, COLOR_GRAD2,string);
			if(PlayerInfo[playerid][pLevel] == 2)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 2 Weapons: sdpistol colt45");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 3)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 3 Weapons: sdpistol colt45 mp5");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo smgammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 4)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 4 Weapons: sdpistol colt45 mp5 shotgun");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 5)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 5 Weapons: sdpistol colt45 mp5 shotgun spas12");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 6)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 6 Weapons: sdpistol colt45 mp5 shotgun spas12 deagle");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 7)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 7 Weapons: sdpistol colt45 mp5 shotgun spas12 deagle uzi");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 8)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 8 Weapons: sdpistol colt45 mp5 shotgun spas12 deagle uzi sawnoff");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 9)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 9 Weapons: sdpistol colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo assaultammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 10)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 10 Weapons: sdpistol colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47 m4");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo assaultammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 11)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 11 Weapons: sdpistol colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47 m4 rifle");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo assaultammo rifleammo");
			}
			else if(PlayerInfo[playerid][pLevel] == 12)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Level 12 Weapons: sdpistol colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47 m4 rifle flamethrower");
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo assaultammo rifleammo heavyammo");
			}
			else if(PlayerInfo[playerid][pLevel] >= 13)
			{
				format(infostring, 256, "Level %d Weapons: sdpistol colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47 m4 rifle",PlayerInfo[playerid][pLevel]);
				SendClientMessage(playerid, COLOR_GRAD4, "Extra Ammo: pistolammo shotgunammo smgammo assaultammo rifleammo heavyammo");
				SendClientMessage(playerid, COLOR_GRAD3, infostring);
			}
			SendClientMessage(playerid, COLOR_GRAD5, "Extra Health: health");
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			return 1;
		}
		strmid(gunid, tmp, 0, strlen(cmdtext), 255);
		if (PlayerInfo[playerid][gPupgrade] > 0)
		{
			/*
			if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "minigun", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A minigun");
				PlayerInfo[playerid][pGun6] = 38;
				ResetPlayerWeapons(playerid);
				SetPlayerWeapons(playerid);
				PlayerInfo[playerid][gPupgrade]--;
			}

			if (PlayerInfo[playerid][pLevel] >= 12 && (strcmp(gunid, "flamethrower", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A flamethrower");
				PlayerInfo[playerid][pGun6] = 37;
			}
   */
			if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "parachute", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A parachute");
				PlayerInfo[playerid][pGun5] = 46;
			}
			else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "rifle", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A rifle");
				PlayerInfo[playerid][pGun5] = 33;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "m4", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With An m4");
				PlayerInfo[playerid][pGun4] = 31;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "golfclub", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A golfclub");
				PlayerInfo[playerid][pGun6] = 2;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "nightstick", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A nightstick");
				PlayerInfo[playerid][pGun6] = 3;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "knife", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A knife");
				PlayerInfo[playerid][pGun6] = 4;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "baseballbat", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A baseballbat");
				PlayerInfo[playerid][pGun6] = 5;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "shovel", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A shovel");
				PlayerInfo[playerid][pGun6] = 6;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "poolcue", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A poolcue");
				PlayerInfo[playerid][pGun6] = 7;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "purpledildo", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A purpledildo");
				PlayerInfo[playerid][pGun6] = 10;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "whitedildo", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A whitedildo");
				PlayerInfo[playerid][pGun6] = 11;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "longwhitedildo", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A longwhitedildo");
				PlayerInfo[playerid][pGun6] = 12;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "whitedildo2", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A whitedildo2");
				PlayerInfo[playerid][pGun6] = 13;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "flowers", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With flowers");
				PlayerInfo[playerid][pGun6] = 14;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "cane", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A cane");
				PlayerInfo[playerid][pGun6] = 15;
			}
			else if (PlayerInfo[playerid][pLevel] >= 9 && (strcmp(gunid, "ak47", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With An ak47");
				PlayerInfo[playerid][pGun4] = 30;
			}
			else if (PlayerInfo[playerid][pLevel] >= 9 && (strcmp(gunid, "Tec9", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A Tec9");
				PlayerInfo[playerid][pGun3] = 32;
			}
			else if (PlayerInfo[playerid][pLevel] >= 8 && (strcmp(gunid, "sawnoff", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A sawnoff");
				PlayerInfo[playerid][pGun2] = 26;
			}
			else if (PlayerInfo[playerid][pLevel] >= 7 && (strcmp(gunid, "uzi", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "SNew Upgrade: You Will Now Spawn With An uzi");
				PlayerInfo[playerid][pGun3] = 28;
			}
			else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "deagle", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A deagle");
				PlayerInfo[playerid][pGun1] = 24;
			}
			else if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "spas12", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A spas12");
				PlayerInfo[playerid][pGun2] = 27;
			}
			else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "shotgun", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A shotgun");
				PlayerInfo[playerid][pGun2] = 25;
			}
			else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "mp5", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With An mp5");
				PlayerInfo[playerid][pGun3] = 29;
			}
			else if (PlayerInfo[playerid][pLevel] >= 2 && (strcmp(gunid, "colt45", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A colt45");
				PlayerInfo[playerid][pGun1] = 22;
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "sdpistol", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With An sdpistol");
				PlayerInfo[playerid][pGun1] = 23;
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "pistolammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo1] = PlayerInfo[playerid][pAmmo1]+50;
				format(infostring, 256, "New Upgrade: You Will Now Spawn With %d Pistol Ammo (+50)",PlayerInfo[playerid][pAmmo1]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "shotgunammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo2] = PlayerInfo[playerid][pAmmo2]+50;
				format(infostring, 256, "New Upgrade: You Will Now Spawn With %d Shotgun Ammo (+50)",PlayerInfo[playerid][pAmmo2]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "smgammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo3] = PlayerInfo[playerid][pAmmo3]+100;
				format(infostring, 256, "New Upgrade: You Will Now Spawn With %d SMG Ammo (+100)",PlayerInfo[playerid][pAmmo3]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "assaultammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo4] = PlayerInfo[playerid][pAmmo4]+50;
				format(infostring, 256, "New Upgrade: You Will Now Spawn With %d Assault Ammo (+50)",PlayerInfo[playerid][pAmmo4]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "rifleammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo5] = PlayerInfo[playerid][pAmmo5]+10;
				format(infostring, 256, "New Upgrade: You Will Now Spawn With %d Rifleammo Ammo (+10)",PlayerInfo[playerid][pAmmo5]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "heavyammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo6] = PlayerInfo[playerid][pAmmo6]+10;
				format(infostring, 256, "New Upgrade: You Will Now Spawn With %d Heavyammo Ammo (+50)",PlayerInfo[playerid][pAmmo6]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "health", true, strlen(gunid)) == 0))
			{
				if (PlayerInfo[playerid][pSHealth] < 100)
				{
					PlayerInfo[playerid][pSHealth] = PlayerInfo[playerid][pSHealth]+5.0;
					format(infostring, 256, "New Upgrade: You Will Now Spawn With %.2f Health (+5)",PlayerInfo[playerid][pSHealth]+50);
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD6, "   You Have Maximum Spawn Health");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD6, "   Unrecognized Upgrade");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD6, "   You Have 0 Upgrade Points");
			return 1;
		}
		SetPlayerWeapons(playerid);
		PlayerInfo[playerid][gPupgrade]--;
		return 1;
	}
//-------------------------------[Login]--------------------------------------------------------------------------
/*	if (strcmp(cmd, "/login", true) ==0 )
	{
		new tmppass[64];
		if (gPlayerLogged[playerid] == 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, "SERVER: You are already logged in.");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /login [password]");
			return 1;
		}
		strmid(tmppass, tmp, 0, strlen(cmdtext), 255);
		Encript(tmppass);
		if (gdebug){printf("DEBUG enterd %s", tmppass);}
		OnPlayerLogin(playerid,tmppass);
		return 1;
	}*/
//[TEST]______________________________________________________________________________

//----------------------------------[ooc]-----------------------------------------------
	if(strcmp(cmd, "/ooc", true) == 0 || strcmp(cmd, "/o", true) == 0)
	{
		if ((noooc) && PlayerInfo[playerid][pAdmin] < 1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   the ooc chanel has been disabled by admin");
			return 1;
		}
		if(Mute[playerid] == 1)
		{
			SendClientMessage(playerid, TEAM_CYAN_COLOR, "You cannot speak, you have been silenced");
			return 0;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/o)oc [ooc chat]");
			return 1;
		}
		format(string, sizeof(string), "(( %s: %s ))", sendername, result);
		OOCOff(TEAM_ORANGE_COLOR,string);
		printf("%s", string);
		return 1;
	}
	if(strcmp(cmd, "/noooc", true) == 0)
	{
		if (PlayerInfo[playerid][pAdmin] >= 3 && (!noooc))
		{
			noooc = 1;
			if(stats)
			{
				realchat = 1;
			}
			BroadCast(COLOR_GRAD2, "   ooc chat channel disabled by admin");
		}
		else if (PlayerInfo[playerid][pAdmin] >= 3 && (noooc))
		{
			noooc = 0;
			if(stats)
			{
				realchat = 0;
			}
			BroadCast(COLOR_GRAD2, "   ooc chat channel enabled by admin");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/speedo", true) == 0)
	{
		if (gSpeedo[playerid] == 1)
		{
			gSpeedo[playerid] = 2;
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~g~on", 5000, 5);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
		else if (gSpeedo[playerid] == 2)
		{
			gSpeedo[playerid] = 1;
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~r~off", 5000, 5);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "you dont have a speedometer");
		}
		return 1;
	}
//----------------------------------[advertise]-----------------------------------------------
	if(strcmp(cmd, "/advertise", true) == 0 || strcmp(cmd, "/ad", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/ad)vertise [advert text]");
			return 1;
		}
		if ((noooc) && (PlayerInfo[playerid][pAdmin] < 1))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   the advertisment chanel has been disabled by admin");
			return 1;
		}
		if ((!adds) && (PlayerInfo[playerid][pAdmin] < 1))
		{
			format(string, sizeof(string), "   Please try again later %d seconds between adverts",  (addtimer/1000));
			SendClientMessage(playerid, COLOR_GRAD2, string);
			return 1;

		}
		format(string, sizeof(string), "Advertisement: %s, Contact: %s Ph: %d",  result, sendername,PlayerInfo[playerid][pPnumber]);
		OOCOff(TEAM_GROVE_COLOR,string);
		if (PlayerInfo[playerid][pAdmin] < 1){SetTimer("AddsOn", addtimer, 0);adds = 0;}
		printf("%s", string);
		return 1;
	}
//----------------------------------[togooc]-----------------------------------------------

	if(strcmp(cmd, "/togooc", true) == 0)
	{
		if (!gOoc[playerid])
		{
			gOoc[playerid] = 1;
			SendClientMessage(playerid, COLOR_GRAD2, "   ooc chat channel disabled");
		}
		else if (gOoc[playerid])
		{
			(gOoc[playerid] = 0);
			SendClientMessage(playerid, COLOR_GRAD2, "   ooc chat channel enabled");
		}
		return 1;
	}
//----------------------------------[Emote]-----------------------------------------------
	if(strcmp(cmd, "/me", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /me [action]");
			return 1;
		}
		format(string, sizeof(string), "* %s %s", sendername, result);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		printf("%s", string);
		return 1;
	}
//----------------------------------[Local]-----------------------------------------------
	if(strcmp(cmd, "/local", true) == 0 || strcmp(cmd, "/l", true) == 0 || strcmp(cmd, "/say", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/l)ocal [local chat]");
			return 1;
		}
		format(string, sizeof(string), "%s Says %s", sendername, result);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		printf("%s", string);
		return 1;
	}
//----------------------------------[Shout]-----------------------------------------------
	if(strcmp(cmd, "/shout", true) == 0 || strcmp(cmd, "/s", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/s)hout [local chat]");
			return 1;
		}
		format(string, sizeof(string), "%s Shouts %s!!", sendername, result);
		ProxDetector(30.0, playerid, string,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_FADE1,COLOR_FADE2);
		printf("%s", string);
		return 1;
	}
//----------------------------------[Shout]-----------------------------------------------
	if(strcmp(cmd, "/megaphone", true) == 0 || strcmp(cmd, "/m", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/m)egaphone [megaphone chat]");
			return 1;
		}
		if (gTeam[playerid] != 2)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not part of a team");
			return 1;
		}
		if(!IsACopCar(tmpcar))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not in a police vehicle");
			return 1;
		}
		format(string, sizeof(string), "[Officer %s:o< %s]", sendername, result);
		ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		printf("%s", string);
		return 1;
	}
//----------------------------------[Team]-----------------------------------------------
	if(strcmp(cmd, "/r", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/r)adio [radio chat]");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
			if(PlayerInfo[playerid][pAdmin] == -2)
			{
				format(string, sizeof(string), "** Chief %s: %s, over. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** Officer %s: %s, over. **", sendername, result);
			}
			SendTeamMessage(2, TEAM_BLUE_COLOR, string);
			printf("%s", string);
			return 1;
		}
		if (gTeam[playerid] == 1)
		{
			if(PlayerInfo[playerid][pAdmin] == -1)
			{
				format(string, sizeof(string), "** Chief %s: %s, over. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** Paramedic %s: %s, over. **", sendername, result);
			}
			SendTeamMessage(1, TEAM_CYAN_COLOR, string);
			printf("%s", string);
			return 1;
		}
		if (gTeam[playerid] >= 5)
		{
			if(PlayerInfo[playerid][pAdmin] <= -5)
			{
				format(string, sizeof(string), "** Boss %s: %s, over. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** %s: %s, over. **", sendername, result);
			}
			SendTeamMessage(gTeam[playerid], TEAM_AZTECAS_COLOR, string);
			printf("%s", string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not part of a team");
			//return 1;
		}
		return 1;
	}
//----------------------------------[offduty]-----------------------------------------------
	if(strcmp(cmd, "/duty", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(forceteam && CopCheck(playerid))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not a cop.");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
			if (PlayerToPoint(3, playerid,255.3,77.4,1003.6) || PlayerInfo[playerid][pLocal] != 255)
			{
				gTeam[playerid] = 3;
				SetPlayerToTeamColor(playerid);
				format(string, sizeof(string), "* %s Puts a gun and a badge in a locker", sendername);
				SetPlayerWeapons(playerid);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				printf("%s", string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   you are not in a locker room");
				return 1;
			}
		}
		if (gTeam[playerid] == 3)
		{
			if (PlayerToPoint(3, playerid,255.3,77.4,1003.6) || PlayerInfo[playerid][pLocal] != 255)
			{
				gTeam[playerid] = 2;
				SetPlayerToTeamColor(playerid);
				if(PlayerInfo[playerid][pAdmin] == -2)
				{
					format(string, sizeof(string), "* Chief %s Takes a gun and a badge from a locker", sendername);
				}
				else
				{
					format(string, sizeof(string), "* Officer %s Takes a gun and a badge from a locker", sendername);
				}
				SetPlayerWeapons(playerid);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				printf("%s", string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   you are not in a locker room");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not part of a team");
			return 1;
		}
		return 1;
	}
//----------------------------------[departments]-----------------------------------------------
	if(strcmp(cmd, "/departments", true) == 0 || strcmp(cmd, "/d", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/d)epartments [department chat]");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
			if(PlayerInfo[playerid][pAdmin] == -2)
			{
				format(string, sizeof(string), "** SAPD Chief %s: %s, over. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** Officer %s: %s, over. **", sendername, result);
			}
			SendTeamMessage(2, COLOR_ALLDEPT, string);
			SendTeamMessage(4, COLOR_ALLDEPT, string);
			printf("%s", string);
			return 1;
		}
		if (gTeam[playerid] == 1)
		{
			if(PlayerInfo[playerid][pAdmin] == -3)
			{
				format(string, sizeof(string), "** SAMD Chief %s: %s, over. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** Paramedic %s: %s, over. **", sendername, result);
			}
			SendTeamMessage(2, COLOR_ALLDEPT, string);
			SendTeamMessage(1, COLOR_ALLDEPT, string);
			printf("%s", string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not part of a team");
			//return 1;
		}
		return 1;
	}
//----------------------------------[mdc]-----------------------------------------------
	if(strcmp(cmd, "/mdc", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /mdc [playerid/PartOfName]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		GetPlayerName(giveplayerid, sendername, sizeof(sendername));
		if(!IsACopCar(tmpcar))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not in a police vehicle");
			return 1;
		}
		SendClientMessage(playerid, TEAM_BLUE_COLOR,"______-=MOBILE DATA COMPUTER=-_______");
		format(string, sizeof(string), "Name : %s", sendername);
		SendClientMessage(playerid, COLOR_WHITE,string);
		format(string, sizeof(string), "Crime : %s", PlayerCrime[giveplayerid][pAccusedof]);
		SendClientMessage(playerid, COLOR_GRAD2,string);
		format(string, sizeof(string), "Claimant : %s", PlayerCrime[giveplayerid][pVictim]);
		SendClientMessage(playerid, COLOR_GRAD3,string);
		format(string, sizeof(string), "Reported : %s", PlayerCrime[giveplayerid][pAccusing]);
		SendClientMessage(playerid, COLOR_GRAD4,string);
		format(string, sizeof(string), "Accused : %s", PlayerCrime[giveplayerid][pBplayer]);
		SendClientMessage(playerid, COLOR_GRAD5,string);
		SendClientMessage(playerid, TEAM_BLUE_COLOR,"_______________________________________");
		printf("%s", string);
		return 1;
	}
//----------------------------------[SetCrim]-----------------------------------------------
	if(strcmp(cmd, "/suspect", true) == 0 || strcmp(cmd, "/su", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/su)spect [playerid/PartOfName] [crime discription]");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if(JailTime[giveplayerid] != 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   That person can't be suspected right now.");
			printf("JailTime[giveplayerid](%d) gTeam[giveplayerid](%d)",JailTime[giveplayerid],gTeam[giveplayerid]);
			return 1;
		}
			if (IsPlayerConnected(giveplayerid))
			{
				if (gTeam[giveplayerid] != 2)
				{
					if (gTeam[giveplayerid] >= 4)
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   that person is already a suspect");
						return 1;
					}
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/su)spect [playerid/PartOfName] [crime text]");
						return 1;
					}
					if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
					if(FlashTime[giveplayerid] == 0){FlashTime[giveplayerid] = 10;}
					SetPlayerCriminal(giveplayerid,playerid, result,0,0);
					JailTime[giveplayerid] = -60;
					//printf("%s: %s", giveplayer, result);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   you cannot suspect a cop");
				}
			}
			else
			{
					format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
					SendClientMessage(playerid, COLOR_GRAD1, string);
					return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not a cop");
		}
	}
//----------------------------------[SetFree]-----------------------------------------------
	if(strcmp(cmd, "/free", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /free [playerid/PartOfName]");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
			if (IsPlayerConnected(giveplayerid))
			{
				if (gTeam[giveplayerid] == 4)
				{
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /free [playerid/PartOfName] [reason text]");
						return 1;
					}
					if (gPublicEnemy == giveplayerid)
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   You do not have the power to do that");
						return 1;
					}
					SetPlayerFree(giveplayerid,playerid, result,0,0);
					//printf("%s: %s", giveplayer, result);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   This person is free");
				}
			}
			else
			{
					format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
					SendClientMessage(playerid, COLOR_GRAD1, string);
					return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   you are not a cop");
		}
	}
//----------------------------------[LOCK]-----------------------------------------------
	if(strcmp(cmd, "/lock", true) == 0)
	{
		new carid;
		if (gTeam[playerid] == 2 || gTeam[playerid] == 1)
		{
			if(gLastCar[playerid] == 0 && PlayerInfo[playerid][pPhousekey] == 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle.");
				return 1;
			}
			else if(gLastCar[playerid] != 0 && gLastCar[playerid] != PlayerInfo[playerid][pPhousekey]+1)
			{
				if (HireCar[playerid] != gLastCar[playerid] && HireCar[playerid] != 299)
				{
					gLastDriver[HireCar[playerid]] = 300;
					gCarLock[HireCar[playerid]] = 0;
					UnLockCar(HireCar[playerid]);
				}
				HireCar[playerid] = gLastCar[playerid];
			}
		}
		if (PlayerInfo[playerid][pPhousekey] == 255)
		{
			if(HireCar[playerid] == 299)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle.");
				return 1;
			}
		}
		carid = PlayerInfo[playerid][pPhousekey]+1;
		if(HireCar[playerid] != 299 && !SwitchKey[playerid])
		{
			carid = HireCar[playerid];
		}
		//new driver = gLastDriver[carid];
		new lockstatus = gCarLock[carid];
		new Float:cx,Float:cy,Float:cz;
		GetVehiclePos(carid, cx, cy, cz);
		for(new i = 0; i < sizeof(HouseInfo); i++)
		{
			//printf("House :%d  x:%f y:%f z:%f",i,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]);
			if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]) || PlayerToPoint(3, playerid,HouseInfo[i][hExitx], HouseInfo[i][hExity], HouseInfo[i][hExitz]))
			{
				//printf("House :%d",i);
				if(PlayerInfo[playerid][pPhousekey] == i)
				{
					//printf("pPhousekey :%d  hLock :%d",PlayerInfo[playerid][pPhousekey] ,HouseInfo[i][hLock]);
					if(HouseInfo[i][hLock] == 1)
					{
						HouseInfo[i][hLock] = 0;
						GameTextForPlayer(playerid, "~w~Door ~g~Unlocked", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
					if(HouseInfo[i][hLock] == 0)
					{
						HouseInfo[i][hLock] = 1;
						GameTextForPlayer(playerid, "~w~Door ~r~Locked", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~You Dont Have A Key", 5000, 6);
					return 1;
				}
			}
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			//printf("House :%d  x:%f y:%f z:%f",i,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]);
			if (PlayerToPoint(3, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]) || PlayerToPoint(3, playerid,BizzInfo[i][bExitx], BizzInfo[i][bExity], BizzInfo[i][bExitz]))
			{
				//printf("House :%d",i);
				if(PlayerInfo[playerid][pPbiskey] == i)
				{
					//printf("pPhousekey :%d  hLock :%d",PlayerInfo[playerid][pPhousekey] ,HouseInfo[i][hLock]);
					if(BizzInfo[i][bLock] == 1)
					{
						BizzInfo[i][bLock] = 0;
						GameTextForPlayer(playerid, "~w~Bussiness ~g~Open", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
					if(BizzInfo[i][bLock] == 0)
					{
						BizzInfo[i][bLock] = 1;
						GameTextForPlayer(playerid, "~w~Bussiness ~r~Closed", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~You Dont Have A Key", 5000, 6);
					return 1;
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			//printf("House :%d  x:%f y:%f z:%f",i,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]);
			if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				//printf("House :%d",i);
				if(PlayerInfo[playerid][pPbiskey] == i+100)
				{
					//printf("pPhousekey :%d  hLock :%d",PlayerInfo[playerid][pPhousekey] ,HouseInfo[i][hLock]);
					if(SBizzInfo[i][sbLock] == 1)
					{
						SBizzInfo[i][sbLock] = 0;
						GameTextForPlayer(playerid, "~w~Bussiness ~g~Open", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
					if(SBizzInfo[i][sbLock] == 0)
					{
						SBizzInfo[i][sbLock] = 1;
						GameTextForPlayer(playerid, "~w~Bussiness ~r~Closed", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~You Dont Have A Key", 5000, 6);
					return 1;
				}
			}
		}
		switch (lockstatus)
		{
			case 0:
			{
				/*
				if (gTeam[playerid] == 2 || gTeam[playerid] == 1)
				{
					if(driver != playerid)
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle.");
						return 1;
					}
					GameTextForPlayer(playerid, "~w~Vehicle ~r~Locked", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 1;
					LockCar(carid);
					return 1;
				}
    */
				if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle");
					return 1;
				}
				if(HireCar[playerid] == carid && !SwitchKey[playerid])
				{
					GameTextForPlayer(playerid, "~w~Hire Vehicle ~r~Locked", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 1;
					LockCar(carid);
				}
				else if (PlayerInfo[playerid][pPhousekey] == carid-1)
				{
					GameTextForPlayer(playerid, "~w~House Vehicle ~r~Locked", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 1;
					LockCar(carid);
					return 1;
				}
			}
			case 1:
			{
				/*
				if (gTeam[playerid] == 2 || gTeam[playerid] == 1)
				{
					if(driver != playerid)
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle");
						return 1;
					}
					GameTextForPlayer(playerid, "~w~Vehicle ~g~Unlocked", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 0;
					UnLockCar(carid);
					return 1;
				}
    */
				if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle");
					return 1;
				}
				if(HireCar[playerid] == carid && !SwitchKey[playerid])
				{
					GameTextForPlayer(playerid, "~w~Hire Vehicle ~g~Unlocked", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 0;
					UnLockCar(carid);
				}
				if (PlayerInfo[playerid][pPhousekey] == carid-1)
				{
					GameTextForPlayer(playerid, "~w~House Vehicle ~g~Unlocked", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 0;
					UnLockCar(carid);
					return 1;
				}
			}
			default:
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   Error");
			}
		}
		if(carid == 256)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle");
		}
		return 1;
	}
//----------------------------------[Wisper]-----------------------------------------------
	if(strcmp(cmd, "/wisper", true) == 0 || strcmp(cmd, "/w", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/w)isper [playerid/PartOfName] [whisper text]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if (IsPlayerConnected(giveplayerid))
		{
			if (ProxDetectorS(5.0, playerid, giveplayerid))
			{
				GetPlayerName(playerid, sendername, sizeof(sendername));
				if(giveplayerid == playerid)
				{
					format(string, sizeof(string), "* %s mutters somthing.", sendername);
					ProxDetector(5.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' '))
				{
					idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
				{
					result[idx - offset] = cmdtext[idx];
					idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/w)isper [playerid/PartOfName] [whisper text]");
					return 1;
				}
				format(string, sizeof(string), "%s whispers %s", sendername, result);
				SendClientMessage(playerid,  COLOR_YELLOW, string);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s: %s", sendername, result);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Your too far away.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
//----------------------------------[Phone]-----------------------------------------------
	if(strcmp(cmd, "/bank", true) == 0 || strcmp(cmd, "/deposit", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bank [amount]");
			format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bank [amount]");
			format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		if (cashdeposit > GetPlayerMoney(playerid) || cashdeposit < 1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
			return 1;
		}
		if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			GivePlayerMoney(playerid,-cashdeposit);
			new curfunds = PlayerInfo[playerid][pAccount];
			PlayerInfo[playerid][pAccount]=cashdeposit+PlayerInfo[playerid][pAccount];
			SendClientMessage(playerid, COLOR_WHITE, "|___ BANK STATMENT ___|");
			format(string, sizeof(string), "  Old Balance: $%d", curfunds);
			SendClientMessage(playerid, COLOR_GRAD2, string);
			format(string, sizeof(string), "  Deposit: $%d",cashdeposit);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_GRAD6, "|-----------------------------------------|");
			format(string, sizeof(string), "  New Balance: $%d", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a 24-7 ATM or a Bank");
			return 1;
		}
	}
	if(strcmp(cmd, "/loan", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if (gPlayerLogged[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, "SERVER: You must be logged in.");
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /loan [amount]");
			format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /loan [amount]");
			format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		if (PlayerInfo[playerid][pAccount] - cashdeposit < -50000)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You have exceeded the loan limit ($50000)");
			return 1;
		}
		if (PlayerInfo[playerid][pAccount] - cashdeposit > -1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   We give loans we dont take them");
			return 1;
		}
		if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			GivePlayerMoney(playerid,cashdeposit);
			new curfunds = PlayerInfo[playerid][pAccount];
			PlayerInfo[playerid][pAccount]=PlayerInfo[playerid][pAccount]-cashdeposit;
			SendClientMessage(playerid, COLOR_WHITE, "|___ BANK STATMENT ___|");
			format(string, sizeof(string), "  Old Balance: $%d", curfunds);
			SendClientMessage(playerid, COLOR_GRAD2, string);
			format(string, sizeof(string), "  Deposit: $%d",cashdeposit);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_GRAD6, "|-----------------------------------------|");
			format(string, sizeof(string), "  New Balance: $%d", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a 24-7 ATM or a Bank");
			return 1;
		}
	}
	if(strcmp(cmd, "/withdraw", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /withdraw [amount]");
			format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /withdraw [amount]");
			format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		if (cashdeposit > PlayerInfo[playerid][pAccount] || cashdeposit < 1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
			return 1;
		}
		if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			GivePlayerMoney(playerid,cashdeposit);
			PlayerInfo[playerid][pAccount]=PlayerInfo[playerid][pAccount]-cashdeposit;
			format(string, sizeof(string), "  You Have Withdrawn $%d from your account Total: $%d ", cashdeposit,PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a 24-7 ATM or a Bank");
			return 1;
		}
	}
	if(strcmp(cmd, "/balance", true) == 0)
	{
		if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			format(string, sizeof(string), "  You Have $%d in your account.",PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a 24-7 ATM or a Bank");
			return 1;
		}
	}
	if(strcmp(cmd, "/dice", true) == 0)
	{
		new dice = random(6)+1;
		if (gDice[playerid] == 1)
		{
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "* %s Throws A Dice That lands on %d", sendername,dice);
			ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You Don't Have A Dice");
			return 1;
		}
	}
	if(strcmp(cmd, "/betdm", true) == 0) //BizzInfo[5][bDiscription]
	{
		if (MissionActive == 13)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   A deathmatch is in progress");
			return 1;
		}
		/*
		if (PlayerInfo[playerid][pLocal] != 104)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a Betting shop");
			return 1;
		}
  */
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /betdm [playerid/PartOfName] [amount]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /betdm [playerid/PartOfName] [amount]");
			return 1;
		}
		moneys = strval(tmp);
		if (moneys > 1000000)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Sorry house limit is $1000000");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys)
			{
				GivePlayerMoney(playerid,-moneys);
				BizzInfo[5][bTakings] += moneys;
				BetDm[playerid][0] = giveplayerid;
				BetDm[playerid][1] = moneys;
				format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
				SendClientMessage(playerid, TEAM_VAGOS_COLOR,string);
				format(string, sizeof(string), "   You have bet $%d on %s to win the next deathmatch", moneys, giveplayer);
				SendClientMessage(playerid, COLOR_WHITE, string);
				SendClientMessage(playerid, TEAM_VAGOS_COLOR,"_______________________________________");
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "  $%d has been bet on you by %s to win the next deathmatch", moneys, sendername);
				SendClientMessage(giveplayerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "%s bet $%d on %s", sendername, moneys, giveplayer);
				printf("%s", string);
				PayLog(string);
				PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	return 1;
	}
	if(strcmp(cmd, "/betrace", true) == 0)
	{
		if (MissionActive >= 7 && MissionActive <= 8 )
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   A race is in progress");
			return 1;
		}
		/*
		if (PlayerInfo[playerid][pLocal] != 104)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a Betting shop");
			return 1;
		}
  */
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /betrace [playerid/PartOfName] [amount]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /betrace [playerid/PartOfName] [amount]");
			return 1;
		}
		moneys = strval(tmp);
		if (moneys > 1000000)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Sorry house limit is $1000000");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys)
			{
				GivePlayerMoney(playerid,-moneys);
				BizzInfo[5][bTakings] += moneys;
				BetRace[playerid][0] = giveplayerid;
				BetRace[playerid][1] = moneys;
				format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
				SendClientMessage(playerid, TEAM_VAGOS_COLOR,string);
				format(string, sizeof(string), "You have bet $%d on %s to win the next race", moneys, giveplayer);
				SendClientMessage(playerid, COLOR_WHITE, string);
				SendClientMessage(playerid, TEAM_VAGOS_COLOR,"_______________________________________");
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "  $%d has been bet on you by %s to win the next race", moneys, sendername);
				SendClientMessage(giveplayerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "%s bet $%d on %s", sendername, moneys, giveplayer);
				printf("%s", string);
				PayLog(string);
				PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	return 1;
	}
	if(strcmp(cmd, "/bets", true) == 0)
	{
		format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
		SendClientMessage(playerid, TEAM_VAGOS_COLOR,string);
		if(BetRace[playerid][0] == 255)
		{
			format(giveplayer, sizeof(giveplayer), "No one");
		}
		else
		{
			GetPlayerName(BetRace[playerid][0], giveplayer, sizeof(giveplayer));
		}
		format(string, sizeof(string), "Race: %s for $%d",giveplayer, BetRace[playerid][1]);
		SendClientMessage(playerid, COLOR_WHITE,string);
		if(BetDm[playerid][0] == 255)
		{
			format(giveplayer, sizeof(giveplayer), "No one");
		}
		else
		{
			GetPlayerName(BetDm[playerid][0], giveplayer, sizeof(giveplayer));
		}
		format(string, sizeof(string), "Deathmatch: %s for $%d",giveplayer, BetDm[playerid][1]);
		SendClientMessage(playerid, COLOR_GRAD2,string);
		SendClientMessage(playerid, TEAM_VAGOS_COLOR,"_______________________________________");
	}
	if(strcmp(cmd, "/transfer", true) == 0 || strcmp(cmd, "/wiretransfer", true) == 0)
	{
		if(PlayerInfo[playerid][pLevel] < 3)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "You must be level 3");
			return 1;
		}
		if (!PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a Bank");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /transfer [playerid/PartOfName] [amount]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /transfer [playerid/PartOfName] [amount]");
			return 1;
		}
		moneys = strval(tmp);
		//if (gdebug){printf("DEBUG givecash_command: %d %d",giveplayerid,moneys);}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = PlayerInfo[playerid][pAccount] ;
			if (moneys > 0 && playermoney >= moneys)
			{
				PlayerInfo[playerid][pAccount] -= moneys;
				PlayerInfo[giveplayerid][pAccount] += moneys;
				format(string, sizeof(string), "   You have transferd $%d to %s's account", moneys, giveplayer,giveplayerid);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "   You have recieved $%d to into your account from %s", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "%s transferd $%d to %s", sendername, moneys, giveplayer);
				printf("%s", string);
				PayLog(string);
				PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	return 1;
	}
	if(strcmp(cmd, "/buy", true) == 0)
	{
		if (!PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53))//centerpoint 24-7
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are not in a 24-7");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /buy [item number]");
			SendClientMessage(playerid, COLOR_GREEN, "|_______ 24-7 _______|");
			SendClientMessage(playerid, COLOR_GRAD1, "| 1: Cell Phone $500");
			SendClientMessage(playerid, COLOR_GRAD2, "| 2: Scratch Card $1000");
			SendClientMessage(playerid, COLOR_GRAD3, "| 3: Phone Book $500");
			SendClientMessage(playerid, COLOR_GRAD4, "| 4: Dice $500");
			SendClientMessage(playerid, COLOR_GRAD5, "| 5: Vehicle Key $5000");
			SendClientMessage(playerid, COLOR_GRAD5, "| 6: Vehicle Lock $10000");
			SendClientMessage(playerid, COLOR_GRAD6, "| 7: Speedometer $5000");
			SendClientMessage(playerid, COLOR_GREEN, "|----------------------------------|");
			return 1;
		}
		new item = strval(tmp);
		if(BizzInfo[6][bProd] == 0)
		{
			GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
			return 1;
		}
		if (item == 1 && GetPlayerMoney(playerid) > 500)
		{
			GivePlayerMoney(playerid,-500);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+500;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			new randphone = 1000 + random(8999);//minimum 1000  max 9999
			PlayerInfo[playerid][pPnumber] = randphone;
			format(string, sizeof(string), "Mobile Phone Purchased Your New Number Is %d", randphone);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_GRAD5, "You Can Check This Anytime By Typing /mystats");
			SendClientMessage(playerid, COLOR_WHITE, "HINT: You can now type /cmds to see your cell phone commands.");
			format(string, sizeof(string), "~r~-$%d", 500);
			GameTextForPlayer(playerid, string, 5000, 1);
			return 1;
		}
		if (item == 2 && GetPlayerMoney(playerid) > 1000)
		{
			GivePlayerMoney(playerid,-1000);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+1000;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			new prize;
			new symb1[32];
			new symb2[32];
			new symb3[32];
			new randcard1 = random(10);//minimum 1000  max 9999
			new randcard2 = random(10);//minimum 1000  max 9999
			new randcard3 = random(10);//minimum 1000  max 9999
			format(string, sizeof(string), "~r~-$%d", 1000);
			GameTextForPlayer(playerid, string, 5000, 1);
			if (gdebug >= 1){printf("randcard1 = %d,randcard2 = %d,randcard3 = %d",randcard1,randcard2,randcard3);}
			if(randcard1 >= 5)
			{
				format(symb1, sizeof(symb1), "~b~]");
				randcard1 = 1;
			}
			else if(randcard1 <= 4 && randcard1 >= 2)
			{
				format(symb1, sizeof(symb1), "~g~]");
				randcard1 = 2;
			}
			else if(randcard1 < 2)
			{
				format(symb1, sizeof(symb1), "~y~]");
				randcard1 = 3;
			}
			if(randcard2 >= 5)
			{
				format(symb2, sizeof(symb2), "~b~]");
				randcard2 = 1;
			}
			else if(randcard2 <= 4 && randcard2 >= 2)
			{
				format(symb2, sizeof(symb2), "~g~]");
				randcard2 = 2;
			}
			else if(randcard2 < 2)
			{
				format(symb2, sizeof(symb2), "~y~]");
				randcard2 = 3;
			}
			if(randcard3 >= 5)
			{
				format(symb3, sizeof(symb3), "~b~]");
				randcard3 = 1;
			}
			else if(randcard3 <= 4 && randcard3 >= 2)
			{
				format(symb3, sizeof(symb3), "~g~]");
				randcard3 = 2;
			}
			else if(randcard3 < 2)
			{
				format(symb3, sizeof(symb3), "~y~]");
				randcard3 = 3;
			}
			if (gdebug >= 1){printf("randcard1 = %d,randcard2 = %d,randcard3 = %d",randcard1,randcard2,randcard3);}
			if(randcard1 == randcard2 && randcard1 == randcard3)
			{
				if(randcard1 > 5)
				{
					prize = 100000;
				}
				if(randcard1 <= 4 && randcard1 >= 2)
				{
					prize = 10000;
				}
				if(randcard1 < 2)
				{
					prize = 2000;
				}
				GivePlayerMoney(playerid,prize);
				BizzInfo[6][bTakings] = BizzInfo[6][bTakings]-prize;
				format(string, sizeof(string), "%s %s %s ~n~~n~~w~~g~$%d",symb1,symb2,symb3, prize);
			}
			else
			{
				format(string, sizeof(string), "%s %s %s ~n~~n~~w~~r~$0",symb1,symb2,symb3);
			}
			GameTextForPlayer(playerid, string, 3000, 3);
			return 1;
		}
		if (item == 3 && GetPlayerMoney(playerid) > 500)
		{
			GivePlayerMoney(playerid,-500);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+500;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			gPhoneBook[playerid] = 1;
			format(string, sizeof(string), "Phone Book Purchased You Can Look Up Any Players Number");
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /number <id/name>.");
			format(string, sizeof(string), "~r~-$%d", 500);
			GameTextForPlayer(playerid, string, 5000, 1);
			return 1;
		}
		if (item == 4 && GetPlayerMoney(playerid) > 500)
		{
			GivePlayerMoney(playerid,-500);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+500;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			gDice[playerid] = 1;
			format(string, sizeof(string), "Dice Purchased You Can Throw Your Dice.");
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /dice ");
			format(string, sizeof(string), "~r~-$%d", 500);
			GameTextForPlayer(playerid, string, 5000, 1);
			return 1;
		}
		if (item == 5 && GetPlayerMoney(playerid) > 5000)
		{
			if (gLastCar[playerid] != 0)
			{
				if(HireCar[playerid] != 299)
				{
					gCarLock[HireCar[playerid]] = 0;
					UnLockCar(HireCar[playerid]);
					HireCar[playerid] = 299;
				}
				GivePlayerMoney(playerid,-5000);
				BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+5000;
				BizzInfo[6][bProd]--;
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				HireCar[playerid] = gLastCar[playerid];
				format(string, sizeof(string), "Key Purchased You Can Lock Your Last Vehicle.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /lock ");
				format(string, sizeof(string), "~r~-$%d", 5000);
				GameTextForPlayer(playerid, string, 5000, 1);
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "You Don't Have A Vehicle To Fit It To");
			}
			return 1;
		}
		if (item == 6 && GetPlayerMoney(playerid) > 5000)
		{
			if(PlayerInfo[playerid][pPhousekey] != 255)
			{
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) == 1 && HireCar[PlayerInfo[playerid][pPhousekey]+1])
					{
						HireCar[i] = 299;
					}
				}
				GivePlayerMoney(playerid,-10000);
				BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+10000;
				BizzInfo[6][bProd]--;
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "New Lock's Purchased.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /lock ");
				format(string, sizeof(string), "~r~-$%d", 10000);
				GameTextForPlayer(playerid, string, 5000, 1);
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "You Don't Have A Vehicle To Fit It To");
			}
			return 1;
		}
		if (item == 7 && GetPlayerMoney(playerid) > 5000)
		{
			gSpeedo[playerid] = 1;
			GivePlayerMoney(playerid,-5000);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+5000;
			BizzInfo[6][bProd]--;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Speedometer Purchased.");
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /speedo ");
			format(string, sizeof(string), "~r~-$%d", 5000);
			GameTextForPlayer(playerid, string, 5000, 1);
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't have the cash for that");
		}
		return 1;
	}
	if(strcmp(cmd, "/buyhouse", true) == 0)
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new h = 0; h < sizeof(HouseInfo); h++)
		{
			if(PlayerToPoint(2.0, playerid, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]) && HouseInfo[h][hOwned] == 0)
			{
				if(PlayerInfo[playerid][pLevel] < HouseInfo[h][hLevel])
				{
					format(string, sizeof(string), "You Must Be Level %d To Purchase This", HouseInfo[h][hLevel]);
					SendClientMessage(playerid, COLOR_GRAD5, string);
					return 1;
				}
				if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
				{
					SendClientMessage(playerid, COLOR_WHITE, "   You already own a house, type /sellhouse if you want to buy this one.");
					return 1;
				}
				if(GetPlayerMoney(playerid) > HouseInfo[h][hValue])
				{
					PlayerInfo[playerid][pPhousekey] = h;
					HouseInfo[h][hOwned] = 1;
					GetPlayerName(playerid, sendername, sizeof(sendername));
					strmid(HouseInfo[h][hOwner], sendername, 0, strlen(sendername), 255);
					GivePlayerMoney(playerid,-HouseInfo[h][hValue]);
					PlayerPlayMusic(playerid);
					SetPlayerInterior(playerid,HouseInfo[h][hInt]);
					SetPlayerPos(playerid,HouseInfo[h][hExitx],HouseInfo[h][hExity],HouseInfo[h][hExitz]);
					GameTextForPlayer(playerid, "~w~Welcome Home~n~You can exit at any time by moving to this door and typing /exit", 5000, 3);
					PlayerInfo[playerid][pInt] = HouseInfo[h][hInt];
					PlayerInfo[playerid][pLocal] = h;
					SendClientMessage(playerid, COLOR_WHITE, "Congratulations, On Your New Purchase.");
					SendClientMessage(playerid, COLOR_WHITE, "Type /cmds to review the new property help section.");
					DateProp(playerid);
					OnPropUpdate();
					OnUpdatePlayer(playerid);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "You don't have the cash for that");
					return 1;
				}
			}
		}
	}
	if(strcmp(cmd, "/rentroom", true) == 0)
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new h = 0; h < sizeof(HouseInfo); h++)
		{
			if(PlayerToPoint(2.0, playerid, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]) && HouseInfo[h][hOwned] == 1 &&  HouseInfo[h][hRentabil] == 1)
			{
				if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
				{
					SendClientMessage(playerid, COLOR_WHITE, "   You already own a house, type /sellhouse if you want to rent this one.");
					return 1;
				}
				if(GetPlayerMoney(playerid) > HouseInfo[h][hRent])
				{
					PlayerInfo[playerid][pPhousekey] = h;
					GivePlayerMoney(playerid,-HouseInfo[h][hRent]);
					HouseInfo[h][hTakings] = HouseInfo[h][hTakings]+HouseInfo[h][hRent];
					PlayerPlayMusic(playerid);
					SetPlayerInterior(playerid,HouseInfo[h][hInt]);
					SetPlayerPos(playerid,HouseInfo[h][hExitx],HouseInfo[h][hExity],HouseInfo[h][hExitz]);
					GameTextForPlayer(playerid, "~w~Welcome Home~n~You can exit at any time by moving to this door and typing /exit", 5000, 3);
					PlayerInfo[playerid][pInt] = HouseInfo[h][hInt];
					PlayerInfo[playerid][pLocal] = h;
					SendClientMessage(playerid, COLOR_WHITE, "Congratulations, You can enter and exit here anytime.");
					SendClientMessage(playerid, COLOR_WHITE, "Type /cmds to review the new property help section.");
					OnUpdatePlayer(playerid);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "You don't have the cash for that");
					return 1;
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/rentcar", true) == 0)
	{
		if(GetPlayerVehicleID(playerid) >= 71 && GetPlayerVehicleID(playerid) <= 77)
		{
			new hirefee = HireCost(GetPlayerVehicleID(playerid));
			if(GetPlayerVehicleID(playerid) >= 71 && GetPlayerVehicleID(playerid) <= 74)
			{
				if(BizzInfo[9][bProd] == 0)
				{
					GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
					return 1;
				}
				if(PlayerInfo[playerid][pPbiskey] == 9)
				{
					GameTextForPlayer(playerid, "~w~No charge for the boss", 5000, 3);
					TogglePlayerControllable(playerid, 1);
					return 1;
				}
				if (GetPlayerMoney(playerid) <  BizzInfo[9][bEntcost])
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much cash");
					return 1;
				}
				GivePlayerMoney(playerid,-BizzInfo[9][bEntcost]);
				BizzInfo[9][bTakings] = BizzInfo[9][bTakings]+BizzInfo[9][bEntcost];
				BizzInfo[9][bProd]--;
			}
			if(GetPlayerVehicleID(playerid) >= 75 && GetPlayerVehicleID(playerid) <= 77)
			{
				if(BizzInfo[8][bProd] == 0)
				{
					GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
					return 1;
				}
				if(PlayerInfo[playerid][pPbiskey] == 8)
				{
					GameTextForPlayer(playerid, "~w~No charge for the boss", 5000, 3);
					TogglePlayerControllable(playerid, 1);
					return 1;
				}
				if (GetPlayerMoney(playerid) <  BizzInfo[8][bEntcost])
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much cash");
					return 1;
				}
				GivePlayerMoney(playerid,-BizzInfo[8][bEntcost]);
				BizzInfo[8][bTakings] = BizzInfo[8][bTakings]+BizzInfo[8][bEntcost];
				BizzInfo[8][bProd]--;
			}
			if(HireCar[playerid] != 299)
			{
				gCarLock[HireCar[playerid]] = 0;
				UnLockCar(HireCar[playerid]);
			}
			HireCar[playerid] = GetPlayerVehicleID(playerid);
			OnPropUpdate();
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~We hope you enjoy ~n~the use of this car~n~To lock or unlock your car~n~type ~g~/lock~n~~w~please drive safely",hirefee);
			TogglePlayerControllable(playerid, 1);
			GameTextForPlayer(playerid, string, 5000, 3);
		}
		return 1;
	}
	if(strcmp(cmd, "/hirecar", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /hirecar [key id]");
				return 1;
			}
			new car = strval(tmp);
			/*
			if(HireCar[playerid] != 299)
			{
				gCarLock[HireCar[playerid]] = 0;
				UnLockCar(HireCar[playerid]);
				HireCar[playerid] = 299;
			}
   */
			HireCar[playerid] = car;
			format(string, sizeof(string), "Key Fashioned You Can Lock Car %d.",car);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /lock ");
			return 1;
		}
	}
	if(strcmp(cmd, "/switchkey", true) == 0)
	{
		if(!SwitchKey[playerid])
		{
			if(HireCar[playerid] != 299)
			{
				SwitchKey[playerid] = 1;
				GameTextForPlayer(playerid, "~w~You control now your house car", 5000, 6);
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You do not hire a car", 5000, 6);
			}
			return 1;
		}
		else
		{
			SwitchKey[playerid] = 0;
			GameTextForPlayer(playerid, "~w~You control now your hire car", 5000, 6);
		}
		return 1;
	}
	if(strcmp(cmd, "/givekey", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new car;
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /givekey [playerid/PartOfName]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "  You dont have a key to give");
			return 1;
		}
		else
		{
			if(HireCar[playerid] != 299 && SwitchKey[playerid] == 0)
			{
				car = HireCar[playerid];
				gCarLock[car] = 0;
				UnLockCar(car);
				HireCar[playerid] = 299;
			}
			else
			{
				car = PlayerInfo[playerid][pPhousekey]+1;
			}
		}
		if (IsPlayerConnected(giveplayerid))
		{
			if (ProxDetectorS(5.0, playerid, giveplayerid))
			{
				if(HireCar[giveplayerid] != 299)
				{
					gCarLock[HireCar[giveplayerid]] = 0;
					UnLockCar(HireCar[giveplayerid]);
				}
				HireCar[giveplayerid] = car;
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "   You have given %s the key to your vehicle", giveplayer);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "   You have recieved the key to a vehicle from %s", sendername);
				SendClientMessage(giveplayerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "* %s takes out a set of keys, and tosses them to %s.", sendername ,giveplayer);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/unrentcar", true) == 0)
	{
		if(HireCar[playerid] != 299)
		{
			gCarLock[HireCar[playerid]] = 0;
			UnLockCar(HireCar[playerid]);
			HireCar[playerid] = 299;
			GameTextForPlayer(playerid, "~w~You no longer rent a car", 5000, 3);
		}
		return 1;
	}
	if(strcmp(cmd, "/unrent", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "   You own this house");
			return 1;
		}
		PlayerInfo[playerid][pPhousekey] = 255;
		SendClientMessage(playerid, COLOR_WHITE, "You are now homeless");
		return 1;
	}
	if(strcmp(cmd, "/housewithdraw", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		new bouse = PlayerInfo[playerid][pPhousekey];
		if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /housewithdraw [amount]");
				format(string, sizeof(string), "  You Have $%d in your cashbox.", HouseInfo[bouse][hTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			new cashdeposit = strval(tmp);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /housewithdraw [amount]");
				format(string, sizeof(string), "  You Have $%d in your cashbox.", HouseInfo[bouse][hTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			if (cashdeposit >  HouseInfo[bouse][hTakings] || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
				return 1;
			}
			if (!PlayerToPoint(100, playerid,HouseInfo[bouse][hExitx],HouseInfo[bouse][hExity],HouseInfo[bouse][hExitz]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your house");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,cashdeposit);
				HouseInfo[bouse][hTakings]=HouseInfo[bouse][hTakings]-cashdeposit;
				format(string, sizeof(string), "  You Have Withdrawn $%d from your cashbox Total: $%d ", cashdeposit,BizzInfo[bouse][bTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't own a house.");
		}
		return 1;

	}
	if(strcmp(cmd, "/asellhouse", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /asellhouse [houseid]");
			return 1;
		}
		new house = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			HouseInfo[house][hHel] = 0;
			HouseInfo[house][hArm] = 0;
			HouseInfo[house][hHealthx] = 0;
			HouseInfo[house][hHealthy] = 0;
			HouseInfo[house][hHealthz] = 0;
			HouseInfo[house][hArmourx] = 0;
			HouseInfo[house][hArmoury] = 0;
			HouseInfo[house][hArmourz] = 0;
			HouseInfo[house][hLock] = 1;
			HouseInfo[house][hOwned] = 0;
			HouseInfo[house][hVec] = 418;
			HouseInfo[house][hVcol1] = -1;
			HouseInfo[house][hVcol2] = -1;
			strmid(HouseInfo[house][hOwner], "The State", 0, strlen("The State"), 255);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~You have sold this property", HouseInfo[house][hValue]);
			GameTextForPlayer(playerid, string, 10000, 3);
			OnPropUpdate();
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "You are not an admin.");
		}
		return 1;
	}
	if(strcmp(cmd, "/sellhouse", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		if(PlayerInfo[playerid][pPhousekey] == 255)
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't own a house.");
			return 1;
		}
		if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			new house = PlayerInfo[playerid][pPhousekey];
			HouseInfo[house][hHel] = 0;
			HouseInfo[house][hArm] = 0;
			HouseInfo[house][hHealthx] = 0;
			HouseInfo[house][hHealthy] = 0;
			HouseInfo[house][hHealthz] = 0;
			HouseInfo[house][hArmourx] = 0;
			HouseInfo[house][hArmoury] = 0;
			HouseInfo[house][hArmourz] = 0;
			HouseInfo[house][hLock] = 1;
			HouseInfo[house][hOwned] = 0;
			HouseInfo[house][hVec] = 418;
			HouseInfo[house][hVcol1] = -1;
			HouseInfo[house][hVcol2] = -1;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			strmid(HouseInfo[house][hOwner], "The State", 0, strlen("The State"), 255);
			GivePlayerMoney(playerid,HouseInfo[house][hValue]);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~Congratulations~n~ You have sold your property for ~n~~g~$%d", HouseInfo[house][hValue]);
			GameTextForPlayer(playerid, string, 10000, 3);
			PlayerInfo[playerid][pPhousekey] = 255;
			if(PlayerInfo[playerid][pLocal] == house)
			{
				SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,HouseInfo[house][hEntrancex],HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]);
				PlayerInfo[playerid][pInt] = 0;
			}
			OnPropUpdate();
			OnUpdatePlayer(playerid);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't own a house.");
		}
		return 1;
	}
	if(strcmp(cmd, "/houseupgrade", true) == 0 || strcmp(cmd, "/hu", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /houseupgrade [item number]");
				SendClientMessage(playerid, COLOR_GRAD1, "|_______ Home Supplys _______|");
				SendClientMessage(playerid, COLOR_GRAD2, "| 1: Health Upgrade $50000");
				SendClientMessage(playerid, COLOR_GRAD3, "| 2: Armour Upgrade $100000");
				SendClientMessage(playerid, COLOR_GRAD5, "| 3: TV $500");
				SendClientMessage(playerid, COLOR_WHITE, "| 4: TV Door Cam $1000");
				SendClientMessage(playerid, COLOR_GRAD5, "| 5: Subscribe DM TV $10000");
				SendClientMessage(playerid, COLOR_GRAD3, "| 6: Subscribe SR TV $10000");
				SendClientMessage(playerid, COLOR_GRAD2, "| 7: Subscribe PEN TV $20000");
				SendClientMessage(playerid, COLOR_GRAD1, "| 8: UAV Surveillance System $100000");
				return 1;
			}
			new item = strval(tmp);
			switch (item)
			{
				case 1:
				{
					if(SBizzInfo[5][sbProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if(PlayerInfo[playerid][pLevel] < 5)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 5 To Purchase This");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 50000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
						return 1;
					}
					HouseInfo[house][hHel] = 1;
					GivePlayerMoney(playerid,-50000);
					SBizzInfo[5][sbTakings] += 50000;//heal buisness
					SBizzInfo[5][sbProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "You Can Now Heal Yourself At Home, Type /heal.");
				}
				case 2:
				{
					if(SBizzInfo[5][sbProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 7)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 7 To Purchase This");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 100000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
						return 1;
					}
					HouseInfo[house][hArm] = 1;
					GivePlayerMoney(playerid,-100000);
					SBizzInfo[5][sbTakings] += 100000;//heal buisness
					SBizzInfo[5][sbProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "You Can Now Get Armour At Home, Type /heal.");
				}
				case 3:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 3 To Purchase This");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 500)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
						return 1;
					}

					HouseInfo[house][hHealthx] = 1;
					GivePlayerMoney(playerid,-500);
					BizzInfo[10][bTakings] += 500;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "You use your TV set, type /tv.");
				}
				case 4:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 3 To Purchase This");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 10000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
						return 1;
					}

					HouseInfo[house][hHealthy] = 1;
					GivePlayerMoney(playerid,-10000);
					BizzInfo[10][bTakings] += 10000;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "You can now watch your front door, type /tv door.");
				}
				case 5:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 3 To Purchase This");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 10000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
						return 1;
					}

					HouseInfo[house][hHealthz] = 1;
					GivePlayerMoney(playerid,-10000);
					BizzInfo[10][bTakings] += 10000;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "You watch DM TV, type /tv dm.");
				}
				case 6:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 3 To Purchase This");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 10000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
						return 1;
					}

					HouseInfo[house][hArmourx] = 1;
					GivePlayerMoney(playerid,-10000);
					BizzInfo[10][bTakings] += 10000;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "You can now watch SR TV, type /tv race.");
				}
				case 7:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 3 To Purchase This");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 20000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
						return 1;
					}

					HouseInfo[house][hArmoury] = 1;
					GivePlayerMoney(playerid,-20000);
					BizzInfo[10][bTakings] += 20000;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "You can now watch PEN TV, type /tv pen.");
				}
				case 8:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 3 To Purchase This");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 20000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
						return 1;
					}

					HouseInfo[house][hArmourz] = 1;
					GivePlayerMoney(playerid,-100000);
					BizzInfo[10][bTakings] += 100000;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "You can now watch Recon TV, type /tv <id>.");
				}
			}
			OnPropUpdate();
			OnUpdatePlayer(playerid);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
			//return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/setrent", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setrent [RentFee]");
				return 1;
			}
			if(strval(tmp) < 1)
			{
				SendClientMessage(playerid, COLOR_WHITE, "Minimum rent is $1");
				return 1;
			}
			HouseInfo[bouse][hRent] = strval(tmp);
			OnPropUpdate();
			format(string, sizeof(string), "House rent set to $%d", HouseInfo[bouse][hRent]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
			return 1;
		}
	}
	if(strcmp(cmd, "/evictall", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPhousekey];
		if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1 && i != playerid)
				{

					if (PlayerInfo[i][pPhousekey] == PlayerInfo[playerid][pPhousekey] )
					{
						SendClientMessage(i, COLOR_WHITE, "You have been evicted");
						SendClientMessage(playerid, COLOR_WHITE, "Tenent has been evicted");
						PlayerInfo[i][pPhousekey] = 255;
						return 1;
					}

				}
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
			return 1;
		}
	}
	if(strcmp(cmd, "/evict", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /evict [playerid/PartOfName]");
			}
			new target = strval(tmp);
			if (target == playerid)
			{
				SendClientMessage(target, COLOR_WHITE, "You cant evict yourself");
				return 1;
			}
			if (PlayerInfo[target][pPhousekey] == PlayerInfo[playerid][pPhousekey] && (IsPlayerConnected(target)) == 1)
			{
				SendClientMessage(target, COLOR_WHITE, "You have been evicted");
				SendClientMessage(playerid, COLOR_WHITE, "Tenent has been evicted");
				PlayerInfo[target][pPhousekey] = 255;
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
			return 1;
		}
	}
	if(strcmp(cmd, "/setrentable", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setrentable [0/1]");
			}
			HouseInfo[bouse][hRentabil] = strval(tmp);
			OnPropUpdate();
			format(string, sizeof(string), "House rentable set to %d", HouseInfo[bouse][hRentabil]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
			return 1;
		}
	}
	if(strcmp(cmd, "/call", true) == 0 || strcmp(cmd, "/c", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/c)all [phonenumber]");
			return 1;
		}
		if(PlayerInfo[playerid][pPnumber] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..You dont't have a cell phone");
			return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "* %s takes out a cellphone.", sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		new phonenumb = strval(tmp);
		if(phonenumb == 911)
		{
			SendClientMessage(playerid, COLOR_WHITE, "HINT: You now use T to talk on your cellphone, type /hangup to hang up");
			SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Which Service Do You Require, Police or Paramedic?");
			Mobile[playerid] = 911;
			return 1;
		}
		if(phonenumb == PlayerInfo[playerid][pPnumber])
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..You just get a busy tone");
			return 1;
		}
		if(Mobile[playerid] != 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..You are already on a call");
			return 1;
		}
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if (Mobile[giveplayerid] == 255)
					{
						format(string, sizeof(string), "Your Mobile Is Ringing Type (/Pickup) CallerID: %s", sendername);
						SendClientMessage(giveplayerid, COLOR_YELLOW, string);
						GetPlayerName(giveplayerid, sendername, sizeof(sendername));
						RingTone[giveplayerid] = 10;
						format(string, sizeof(string), "* %s's phone begins to ring.", sendername);
						SendClientMessage(playerid, COLOR_WHITE, "HINT: You now use T to talk on your cellphone, type /hangup to hang up");
						ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						CellTime[playerid] = 1;
						return 1;
					}
				}
			}
		}
		SendClientMessage(playerid, COLOR_GRAD2, "  ..You just get a Busy tone");
		return 1;
	}
	if(strcmp(cmd, "/txt", true) == 0 || strcmp(cmd, "/t", true) == 0 || strcmp(cmd, "/sms", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/t)ext [phonenumber] [text chat]");
			return 1;
		}
		if(PlayerInfo[playerid][pPnumber] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..You dont't have a cell phone");
			return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "* %s takes out a cellphone.", sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		new phonenumb = strval(tmp);
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/t)ext [phonenumber] [text chat]");
			return 1;
		}
		if(phonenumb == 555)
		{
			if ((strcmp("yes", result, true, strlen(result)) == 0) && (strlen(result) == strlen("yes")))
			{
				SendClientMessage(playerid, COLOR_WHITE, "Text Message Delivered");
				if (gTeam[playerid] == 2 || gTeam[playerid] == 1)
				{
					SendClientMessage(playerid, COLOR_YELLOW, "SMS: I Have No Idea What Your Talking About, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				JobGive(playerid);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SMS: A Simple Yes Will Do, Sender: MOLE (555)");
				RingTone[playerid] = 20;
				return 1;
			}
		}
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					format(string, sizeof(string), "SMS: %s, Sender: %s (%d)", result,sendername,PlayerInfo[playerid][pPnumber]);
					GetPlayerName(giveplayerid, sendername, sizeof(sendername));
					//format(string, sizeof(string), "* %s's phone beeps.", sendername);
					RingTone[giveplayerid] =20;
					SendClientMessage(playerid, COLOR_WHITE, "Text Message Delivered");
					SendClientMessage(giveplayerid, COLOR_YELLOW, string);
					SendClientMessage(playerid,  COLOR_YELLOW, string);
					format(string, sizeof(string), "~r~$-%d", txtcost);
					GameTextForPlayer(playerid, string, 5000, 1);
					GivePlayerMoney(playerid,-txtcost);
					BizzInfo[10][bTakings] += txtcost;
		           	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		           	Mobile[playerid] = 255;
					return 1;
				}
			}
		}
		SendClientMessage(playerid, COLOR_GRAD2, "  ..Message Delivery Failed");
		return 1;
	}
//----------------------------------[pickup]-----------------------------------------------

	if(strcmp(cmd, "/pickup", true) == 0 || strcmp(cmd, "/p", true) == 0)
	{
		if(Mobile[playerid] != 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..You are already on a call");
			return 1;
		}
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1)
			{
				if(Mobile[i] == playerid)
				{
					Mobile[playerid] = i; //caller connecting
					SendClientMessage(i,  COLOR_GRAD2, "   They Picked Up The Call.");
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "* %s answers their cellphone.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					RingTone[playerid] = 0;
				}

			}
		}
		return 1;
	}
	if(strcmp(cmd, "/hangup", true) == 0 || strcmp(cmd, "/h", true) == 0)
	{
		new caller = Mobile[playerid];
		if(caller != 255)
		{
			if(caller < 255)
			{
				SendClientMessage(caller,  COLOR_GRAD2, "   They Hung Up.");
				CellTime[caller] = 0;
				CellTime[playerid] = 0;
				SendClientMessage(playerid,  COLOR_GRAD2, "   You Hung Up.");
				Mobile[caller] = 255;
			}
			Mobile[playerid] = 255;
			CellTime[playerid] = 0;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "* %s pockets their cellphone.", sendername);
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			RingTone[playerid] = 0;
			return 1;
		}
			SendClientMessage(playerid,  COLOR_GRAD2, "   Your phone is in your pocket.");
		return 1;
	}
//----------------------------------[TIME]-----------------------------------------------
    if(strcmp(cmd, "/fixr", true) == 0)
    {
		PlayerFixRadio(playerid);
		return 1;
	}
	if(strcmp(cmd, "/checktime", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new hour,minuite,second;
		gettime(hour,minuite,second);
		FixHour(hour);
		hour = shifthour;
		if (minuite < 10)
		{
			if (JailTime[playerid] > 0)
			{
				format(string, sizeof(string), "~g~|~w~%d:0%d~g~|~n~~w~Jail Time Left: %d sec", hour, minuite, JailTime[playerid]-10);
			}
			else
			{
				format(string, sizeof(string), "~g~|~w~%d:0%d~g~|", hour, minuite);
			}
		}
		else
		{
			if (JailTime[playerid] > 0)
			{
				format(string, sizeof(string), "~g~|~w~%d:%d~g~|~n~~w~Jail Time Left: %d sec", hour, minuite, JailTime[playerid]-10);
			}
			else
			{
				format(string, sizeof(string), "~g~|~w~%d:%d~g~|", hour, minuite);
			}
		}
		GameTextForPlayer(playerid, string, 5000, 1);
		format(string, sizeof(string), "* %s checks the time.", sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		return 1;
	}
//----------------------{HOUSES}-------------------
	if(strcmp(cmd, "/house", true) == 0 && PlayerInfo[playerid][pAdmin] >= 3)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /house [housenumber]");
			return 1;
		}
		new housenum = strval(tmp);
		SetPlayerInterior(playerid,HouseInfo[housenum][hInt]);
		SetPlayerPos(playerid,HouseInfo[housenum][hExitx],HouseInfo[housenum][hExity],HouseInfo[housenum][hExitz]);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		PlayerInfo[playerid][pInt] = HouseInfo[housenum][hInt];
		PlayerInfo[playerid][pLocal] = housenum;
		return 1;
	}
	if(strcmp(cmd, "/biz", true) == 0 && PlayerInfo[playerid][pAdmin] >= 3)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /biz [housenumber]");
			return 1;
		}
		new housenum = strval(tmp);
		SetPlayerInterior(playerid,BizzInfo[housenum][bInt]);
		SetPlayerPos(playerid,BizzInfo[housenum][bExitx],BizzInfo[housenum][bExity],BizzInfo[housenum][bExitz]);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		PlayerInfo[playerid][pInt] = BizzInfo[housenum][bInt];
		PlayerInfo[playerid][pLocal] = housenum+99;
		return 1;
	}
	if(strcmp(cmd, "/sbiz", true) == 0 && PlayerInfo[playerid][pAdmin] >= 3)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sbiz [biznumber]");
			return 1;
		}
		new housenum = strval(tmp);
		SetPlayerInterior(playerid,SBizzInfo[housenum][sbInt]);
		SetPlayerPos(playerid,SBizzInfo[housenum][sbEntrancex],SBizzInfo[housenum][sbEntrancey],SBizzInfo[housenum][sbEntrancez]);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		return 1;
	}
	if(strcmp(cmd, "/edithousecar", true) == 0)
	{
		if(PlayerInfo[playerid][pAdmin] < 1337)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "not admin");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /edithousecar [vecid]");
			return 1;
		}
		new proplev = strval(tmp);
		for(new i = 0; i < sizeof(HouseInfo); i++)
		{
			if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
			{
				HouseInfo[i][hVec] = proplev;
				format(string, sizeof(string), "House Car: %d is now %d", i,HouseInfo[i][hVec]);
				SendClientMessage(playerid, COLOR_GRAD2, string);
			}
		}
		OnPropUpdate();
		return 1;
	}
	if(strcmp(cmd, "/editlevel", true) == 0)
	{
		if(PlayerInfo[playerid][pAdmin] < 1337)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "not admin");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /editlevel [level]");
			return 1;
		}
		new proplev = strval(tmp);
		for(new i = 0; i < sizeof(HouseInfo); i++)
		{
			if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
			{
				format(string, sizeof(string), "House: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					HouseInfo[i][hLevel] = proplev;
				}
			}
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]))
			{
				format(string, sizeof(string), "Biz: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					BizzInfo[i][bLevel] = proplev;
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				format(string, sizeof(string), "SBiz: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					SBizzInfo[i][sbLevel] = proplev;
				}
			}
		}
		OnPropUpdate();
		return 1;
	}
	if(strcmp(cmd, "/editprod", true) == 0)
	{
		if(PlayerInfo[playerid][pAdmin] < 1337)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "not admin");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /editprop [level]");
			return 1;
		}
		new proplev = strval(tmp);
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]))
			{
				format(string, sizeof(string), "Biz: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					BizzInfo[i][bProdCost] = proplev;
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				format(string, sizeof(string), "SBiz: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					SBizzInfo[i][sbProdCost] = proplev;
				}
			}
		}
		OnPropUpdate();
		return 1;
	}
	if(strcmp(cmd, "/load", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		if(tmpcar < 78 || tmpcar > 81)
		{
			GameTextForPlayer(playerid, "~r~You are not in a delivery truck", 5000, 1);
			return 1;
		}
		format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
		SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
	}
	if(strcmp(cmd, "/buycomp", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		new compcost = 9000;
		if(PlayerToPoint(60.0, playerid, 2787.8,-2436.3,13.7))
		{
			if(IsATruck(tmpcar))
			{
				if(PlayerHaul[tmpcar][pLoad] < PlayerHaul[tmpcar][pCapasity])
				{
					new amount = PlayerHaul[tmpcar][pCapasity]-PlayerHaul[tmpcar][pLoad];
					new cost = amount*compcost;
					if(GetPlayerMoney(playerid) >= cost)
					{
						PlayerHaul[tmpcar][pLoad] = PlayerHaul[tmpcar][pCapasity];
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "You Bought %d Components For $%d", amount,cost);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						GivePlayerMoney(playerid,-cost);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						return 1;
					}
					else
					{
						format(string, sizeof(string), "You cant afford %d Components at $%d", amount,cost);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
				}
				else
				{
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, TEAM_GROVE_COLOR, "This Vehicle Does Not Deliver Components");
				return 1;
			}
		}
	}
	if(strcmp(cmd, "/sellcomp", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		new cashmade;
		if(!IsATruck(tmpcar))
		{
			GameTextForPlayer(playerid, "~r~You are not in a delivery truck", 5000, 1);
			return 1;
		}
		if(PlayerHaul[tmpcar][pLoad] == 0)
		{
			GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
			format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
			SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
			return 1;
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if (PlayerToPoint(10, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]))
			{
				//printf("Found House :%d",i);
				for(new l = PlayerHaul[tmpcar][pLoad]; l > 0; l--)
				{
					if(BizzInfo[i][bCompCap] == BizzInfo[i][bComp])
					{
						GameTextForPlayer(playerid, "~r~Our stores are full", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						format(string, sizeof(string), "%s sold comp for $%d to %s", sendername, cashmade, BizzInfo[i][bDiscription]);
						printf("%s", string);
						PayLog(string);
						return 1;
					}
					if(BizzInfo[i][bPayComp] > BizzInfo[i][bTakings])
					{
						GameTextForPlayer(playerid, "~r~We Cant Afford The Deal", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "%s sold comp for $%d to %s", sendername, cashmade, BizzInfo[i][bDiscription]);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						printf("%s", string);
						PayLog(string);
						return 1;
					}
					PlayerHaul[tmpcar][pLoad]--;
					BizzInfo[i][bComp]++;
					cashmade = cashmade+BizzInfo[i][bPayComp];
					GivePlayerMoney(playerid,BizzInfo[i][bPayComp]);
					BizzInfo[i][bTakings] = BizzInfo[i][bTakings]-BizzInfo[i][bPayComp];
					if(PlayerHaul[tmpcar][pLoad] == 0 || PlayerHaul[tmpcar][pLoad] == 5)
					{
						PlayerInfo[playerid][pWA]++;
						if(PlayerInfo[playerid][pWA] >= 20)
						{
							PlayerInfo[playerid][pExp]++;
							PlayerInfo[playerid][pWA] = 0;
							SendClientMessage(playerid, COLOR_YELLOW, "You are getting stronger Exp +1");
						}
					}
					if(PlayerHaul[tmpcar][pLoad] == 0)
					{
						GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "%s sold comp for $%d to %s", sendername, cashmade, BizzInfo[i][bDiscription]);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						printf("%s", string);
						PayLog(string);
						return 1;
					}
				}
				OnPropUpdate();
				return 1;
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(10, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				//printf("Found House :%d",i);
				for(new l = PlayerHaul[tmpcar][pLoad]; l > 0; l--)
				{
					if(SBizzInfo[i][sbCompCap] == SBizzInfo[i][sbComp])
					{
						GameTextForPlayer(playerid, "~r~Our stores are full", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
					if(SBizzInfo[i][sbPayComp] > SBizzInfo[i][sbTakings])
					{
						GameTextForPlayer(playerid, "~r~We Cant Afford The Deal", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
					PlayerHaul[tmpcar][pLoad]--;
					SBizzInfo[i][sbComp]++;
					cashmade = cashmade+SBizzInfo[i][sbPayComp];
					GivePlayerMoney(playerid,SBizzInfo[i][sbPayComp]);
					format(string, sizeof(string), "%s sold comp for $%d to %s", sendername, cashmade, SBizzInfo[i][sbDiscription]);
					printf("%s", string);
					PayLog(string);
					SBizzInfo[i][sbTakings] = SBizzInfo[i][sbTakings]-SBizzInfo[i][sbPayComp];
					if(PlayerHaul[tmpcar][pLoad] == 0 || PlayerHaul[tmpcar][pLoad] == 5)
					{
						PlayerInfo[playerid][pWA]++;
						if(PlayerInfo[playerid][pWA] >= 20)
						{
							PlayerInfo[playerid][pExp]++;
							PlayerInfo[playerid][pWA] = 0;
							SendClientMessage(playerid, COLOR_YELLOW, "You are getting stronger Exp +1");
						}
					}
					if(PlayerHaul[tmpcar][pLoad] == 0)
					{
						GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
				}
				OnPropUpdate();
				return 1;
			}
		}
		GameTextForPlayer(playerid, "~r~To Far From A Business", 5000, 1);
		return 1;
	}
	if(strcmp(cmd, "/enter", true) == 0)
	{
		for(new i = 0; i < sizeof(HouseInfo); i++)
		{
			if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
			{
				//printf("Found House :%d",i);
				if(PlayerInfo[playerid][pPhousekey] == i || HouseInfo[i][hLock] == 0)
				{
					SetPlayerInterior(playerid,HouseInfo[i][hInt]);
					SetPlayerPos(playerid,HouseInfo[i][hExitx],HouseInfo[i][hExity],HouseInfo[i][hExitz]);
					GameTextForPlayer(playerid, "~w~Welcome Home", 5000, 1);
					PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
					PlayerInfo[playerid][pLocal] = i;
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Locked", 5000, 1);
				}
			}
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]))
			{
				//printf("Found House :%d",i);
				if(PlayerInfo[playerid][pPbiskey] == i || GetPlayerMoney(playerid) >= BizzInfo[i][bEntcost] || (BizzInfo[i][bEntcost] > 20000 && PlayerInfo[playerid][pLevel] < 3))
				{
					if(PlayerInfo[playerid][pPbiskey] != i)
					{
						if(BizzInfo[i][bLock] == 1)
						{
							GameTextForPlayer(playerid, "~r~Closed", 5000, 1);
							return 1;
						}
						if(BizzInfo[i][bProd] == 0)
						{
							GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
							return 1;
						}
						GivePlayerMoney(playerid,-BizzInfo[i][bEntcost]);
						format(string, sizeof(string), "~r~-$%d~n~~w~type /exit~n~to get out~n~Type ~g~/buygun ~w~to buy weapons", BizzInfo[i][bEntcost]);
						BizzInfo[i][bTakings] = BizzInfo[i][bTakings]+BizzInfo[i][bEntcost];
						BizzInfo[i][bProd]--;
						OnPropUpdate();
						GameTextForPlayer(playerid, string, 5000, 3);
						if(i == 7) //casino
						{
							gSpentCash[playerid] = GetPlayerMoney(playerid);
						}
					}
					SetPlayerInterior(playerid,BizzInfo[i][bInt]);
					SetPlayerPos(playerid,BizzInfo[i][bExitx],BizzInfo[i][bExity],BizzInfo[i][bExitz]);
					PlayerInfo[playerid][pInt] = BizzInfo[i][bInt];
					PlayerInfo[playerid][pLocal] = i+99;
					new dood[MAX_PLAYER_NAME];
					GetPlayerName(playerid, dood, sizeof(dood));
					format(string, sizeof(string), "%s payed $%d to enter biz %d", dood, BizzInfo[i][bEntcost], i);
					printf("%s", string);
					PayLog(string);
					//PlayerInfo[playerid][pLocal] = i;
				}
				else
				{
					GameTextForPlayer(playerid, "~r~You dont have the cash", 5000, 1);
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				if(PlayerInfo[playerid][pPbiskey] == i || GetPlayerMoney(playerid) >= SBizzInfo[i][sbEntcost] || (SBizzInfo[i][sbEntcost] > 20000 && PlayerInfo[playerid][pLevel] < 3))
				{
					if(PlayerInfo[playerid][pPbiskey] != i)
					{
						if(SBizzInfo[i][sbLock] == 1)
						{
							GameTextForPlayer(playerid, "~r~Closed", 5000, 1);
							return 1;
						}
						if(SBizzInfo[i][sbProd] == 0)
						{
							GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
							return 1;
						}
						if(i == 2 || i == 8) //planes school
						{
							SetVehicleParamsForPlayer(66,playerid,0,0);
							SetVehicleParamsForPlayer(67,playerid,0,0);
							SetVehicleParamsForPlayer(68,playerid,0,0);
							SetVehicleParamsForPlayer(69,playerid,0,0);
							SetVehicleParamsForPlayer(70,playerid,0,0);
							SetVehicleParamsForPlayer(71,playerid,0,0);
							SetVehicleParamsForPlayer(72,playerid,0,0);
							PLicence[playerid] = 1;
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "Pilots Licence: You can now fly any plane");
						}
						if(i == 0) //parachute
						{

							SetPlayerInterior(playerid,1);
							SetPlayerPos(playerid,1.71875, 30.4062, 1200.34);
							PlayerInfo[i][pInt] = 0;
							gSkyDive[playerid] = 1;
						}
						if(i == 1) //wheele
						{
							//SetPlayerInterior(playerid,HouseInfo[i][hInt]);
							if (GetPlayerState(playerid) == 2)
							{
								new tmpcar = GetPlayerVehicleID(playerid);
								TelePos[playerid][0] = 0.0;
								TelePos[playerid][1] = 0.0;
								PlayerInfo[playerid][pLocal] = 10000;
								SetVehiclePos(tmpcar, -2724.0,217.9,4.1);
							}
							else
							{
								GameTextForPlayer(playerid, "~w~You must be in a Street Racer", 1000, 1);
								return 1;
							}
							Spectate[playerid] = 500;
							GameTextForPlayer(playerid, "~w~To Exit type ~r~/exit", 5000, 1);
							//PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
						}
						if(i == 3 || i == 7) //stealth school
						{
							Hidden[playerid] = 1;
							SetPlayerToTeamColor(playerid);
							GameTextForPlayer(playerid, "~w~Stealth Device~n~~g~Your icon is hidden", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "Stealth Active: Your icon is hidden.");
						}
						if(i == 4) //towcar school
						{
							GameTextForPlayer(playerid, "~w~breakdown service~n~~g~type /towcar", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "To use this service: type /towcar.");
							return 1;
						}
						if(i == 5) //homeupgrade school
						{
							GameTextForPlayer(playerid, "~w~Home Supply~~g~type /houseupgrade", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "To use this service: type /houseupgrade.");
							return 1;
						}
						if(i == 6) //sellcars school
						{
							GameTextForPlayer(playerid, "~w~Car Sales~n~~g~type /carupgrade", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "To use this service: type /carupgrade.");
							return 1;
						}
						if(i == 9 || i == 10) //buy school
						{
							Locator[playerid] = 1;
							GameTextForPlayer(playerid, "~w~Locator Device~n~~g~Your can locate best buys and sales", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "type /bestbuy or /bestsale");
						}
						if(i == 11 || i == 12) //buy school
						{
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "type /jointeam <teamid> to use");
							return 1;
						}
						GivePlayerMoney(playerid,-SBizzInfo[i][sbEntcost]);
						gSpentCash[playerid] = GetPlayerMoney(playerid);
						SBizzInfo[i][sbProd]--;
						SBizzInfo[i][sbTakings] = SBizzInfo[i][sbTakings]+SBizzInfo[i][sbEntcost];
						new dood[MAX_PLAYER_NAME];
						GetPlayerName(playerid, dood, sizeof(dood));
						format(string, sizeof(string), "%s payed $%d to enter sbiz %d", dood, SBizzInfo[i][sbEntcost], i);
						printf("%s", string);
						PayLog(string);
						OnPropUpdate();
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~You dont have the cash", 5000, 1);
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/exit", true) == 0)
	{
		if (PlayerToPoint(10, playerid,-2724.0,217.9,4.1))
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1519.2,-1474.4,9.1);
			}
			else
			{
				SetPlayerPos(playerid, 1519.2,-1474.4,9.1);
				return 1;
			}
			new oldcash = gSpentCash[playerid];
			if(oldcash > 0)
			{
				new Total = GetPlayerMoney(playerid) - oldcash;
				printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(playerid),oldcash);
				new name[MAX_PLAYER_NAME];
				SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]+Total;
				GetPlayerName(playerid, name, sizeof(name));
				format(string,128,"<< %s has left the modshop with $%d >>",name,Total);
				PayLog(string);
			}
			gSpentCash[playerid] = 0;
			TelePos[playerid][0] = 0.0;
			TelePos[playerid][1] = 0.0;
			Spectate[playerid] = 255;
			PlayerInfo[playerid][pLocal] = 255;
		}
		for(new i = 0; i <  sizeof(HouseInfo); i++)
		{
			//printf("House :%d",i);
			if (PlayerToPoint(3, playerid,HouseInfo[i][hExitx], HouseInfo[i][hExity], HouseInfo[i][hExitz]))
			{
				SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,HouseInfo[i][hEntrancex],HouseInfo[i][hEntrancey],HouseInfo[i][hEntrancez]);
				PlayerInfo[playerid][pInt] = 0;
				PlayerInfo[playerid][pLocal] = 255;
				if(HouseInfo[i][hHel] == 1)
				{
					new Float:tempheal;
					GetPlayerHealth(playerid,tempheal);
					if(tempheal < 100.0)
					{
						SetPlayerHealth(playerid,100.0);
					}
				}
			}
		}
		for(new i = 0; i <  sizeof(BizzInfo); i++)
		{
			//printf("Bizz :%d",i);
			if (PlayerToPoint(3, playerid,BizzInfo[i][bExitx], BizzInfo[i][bExity], BizzInfo[i][bExitz]))
			{
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
				SetPlayerPos(playerid,BizzInfo[i][bEntrancex],BizzInfo[i][bEntrancey],BizzInfo[i][bEntrancez]);
				PlayerInfo[playerid][pLocal] = 255;
				if(i == 7 && PlayerInfo[playerid][pPbiskey] != 7) //casino
				{
					new oldcash = gSpentCash[playerid];
					if(oldcash > 0)
					{
						new Total = GetPlayerMoney(playerid) - oldcash;
						printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(playerid),oldcash);
						new name[MAX_PLAYER_NAME];
						BizzInfo[i][bTakings] = BizzInfo[i][bTakings]+Total;
						GetPlayerName(playerid, name, sizeof(name));
						format(string,128,"<< %s has left the casino with $%d >>",name,Total);
						PayLog(string);
						gSpentCash[playerid] = 0;
					}
				}
			}
		}
		if(GetPlayerVehicleID(playerid) >= 71 && GetPlayerVehicleID(playerid) <= 77)
		{
			TogglePlayerControllable(playerid, 1);
			RemovePlayerFromVehicle(playerid);
		}
		return 1;
	}
	if(strcmp(cmd, "/home", true) == 0)
	{
		if(PlayerInfo[playerid][pPhousekey] != 255)
		{
			SetPlayerCheckpoint(playerid,HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancex], HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancey], HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancez], 4.0);
			GameTextForPlayer(playerid, "~w~Waypoint set ~r~Home", 5000, 1);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
		}
		else
		{
			GameTextForPlayer(playerid, "~w~You are homeless", 5000, 1);
		}
		return 1;
	}
	if(strcmp(cmd, "/modcar", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			if(SBizzInfo[1][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
				return 1;
			}
			if (GetPlayerState(playerid) != 2 && tmpcar != house+1)
			{
				GameTextForPlayer(playerid, "~r~Not in your housecar", 5000, 1);
				return 1;
			}
			if(PlayerToPoint(2.0, playerid, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]))
			{
				GivePlayerMoney(playerid,-1000);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]+1000;//modshop buisness
				SBizzInfo[1][sbProd]--;
				TelePos[playerid][0] = 0.0;
				TelePos[playerid][1] = 0.0;
				SetVehiclePos(tmpcar, 1040.6,-1021.0,31.7);
				gSpentCash[playerid] = GetPlayerMoney(playerid);
				Spectate[playerid] = 500;
				GameTextForPlayer(playerid, "~w~To Exit type ~r~/exit~n~-$1000", 5000, 1);
			//PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
				PlayerInfo[playerid][pLocal] = 10001;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You are not at your home", 5000, 1);
			}
		}
		else
		{
			GameTextForPlayer(playerid, "~w~You are not a home owner", 5000, 1);
		}
		return 1;
	}
	if(strcmp(cmd, "/modst", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			if(SBizzInfo[1][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
				return 1;
			}
			if (GetPlayerState(playerid) != 2 && tmpcar != house+1)
			{
				GameTextForPlayer(playerid, "~r~Not in your housecar", 5000, 1);
				return 1;
			}
			if(PlayerToPoint(2.0, playerid, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]))
			{
				GivePlayerMoney(playerid,-1000);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]+1000;//modshop buisness
				SBizzInfo[1][sbProd]--;
				TelePos[playerid][0] = 0.0;
				TelePos[playerid][1] = 0.0;
				SetVehiclePos(tmpcar, -2720.5,217.5,4.1);
				gSpentCash[playerid] = GetPlayerMoney(playerid);
				Spectate[playerid] = 500;
				GameTextForPlayer(playerid, "~w~To Exit type ~r~/exit~n~-$1000", 5000, 1);
			//PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
				PlayerInfo[playerid][pLocal] = 10002;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You are not at your home", 5000, 1);
			}
		}
		else
		{
			GameTextForPlayer(playerid, "~w~You are not a home owner", 5000, 1);
		}
		return 1;
	}
	if(strcmp(cmd, "/modlr", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			if(SBizzInfo[1][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
				return 1;
			}
			if (GetPlayerState(playerid) != 2 && tmpcar != house+1)
			{
				GameTextForPlayer(playerid, "~r~Not in your housecar", 5000, 1);
				return 1;
			}
			if(PlayerToPoint(2.0, playerid, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]))
			{
				GivePlayerMoney(playerid,-1000);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]+1000;//modshop buisness
				SBizzInfo[1][sbProd]--;
				TelePos[playerid][0] = 0.0;
				TelePos[playerid][1] = 0.0;
				SetVehiclePos(tmpcar, 2644.6,-2044.9,13.3);
				gSpentCash[playerid] = GetPlayerMoney(playerid);
				Spectate[playerid] = 500;
				GameTextForPlayer(playerid, "~w~To Exit type ~r~/exit~n~-$1000", 5000, 1);
			//PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
				PlayerInfo[playerid][pLocal] = 10003;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You are not at your home", 5000, 1);
			}
		}
		else
		{
			GameTextForPlayer(playerid, "~w~You are not a home owner", 5000, 1);
		}
		return 1;
	}
	if(strcmp(cmd, "/towcar", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			if(SBizzInfo[4][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
				return 1;
			}
			if(CarTow(house+1))
			{
				GameTextForPlayer(playerid, "~w~Car~n~~g~Towed Home~n~~r~$-1000", 5000, 1);
				GivePlayerMoney(playerid,-1000);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SBizzInfo[4][sbTakings] = SBizzInfo[4][sbTakings]+1000;//towcar buisness
				SBizzInfo[4][sbProd]--;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~Car is~n~in ~r~use", 5000, 1);
			}
		}
		else
		{
			GameTextForPlayer(playerid, "~w~You are not a home owner", 5000, 1);
		}
		return 1;
	}
	if(strcmp(cmd, "/fixcar", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			if(SBizzInfo[4][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
				return 1;
			}
			if(CarRespawn(house+1))
			{
				GameTextForPlayer(playerid, "~w~Car~n~~g~Repaired~n~~r~$-1000", 5000, 1);
				GivePlayerMoney(playerid,-1000);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SBizzInfo[4][sbTakings] = SBizzInfo[4][sbTakings]+1000;//towcar buisness
				SBizzInfo[4][sbProd]--;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~Car is~n~in ~r~use", 5000, 1);
			}
		}
		else
		{
			GameTextForPlayer(playerid, "~w~You are not a home owner", 5000, 1);
		}
		return 1;
	}
	// 		CreateVehicle(HouseInfo[h][hVec], HouseCarSpawns[h][0], HouseCarSpawns[h][1], HouseCarSpawns[h][2], HouseCarSpawns[h][3], HouseInfo[h][hVcol1], HouseInfo[h][hVcol2], -1);
	// 				SetVehiclePos(plo,plocx,plocy+4, plocz);
	if (strcmp(cmd, "/dmweapon", true) == 0)
	{
		new gunid[16];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string, sizeof(string), "USAGE: /dmweapon [gunname]");
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** DM WEAPONS ***");
			SendClientMessage(playerid, COLOR_GRAD2,string);
			SendClientMessage(playerid, COLOR_GRAD3, "Weapons: default chainsaw sdpistol colt45 mp5 shotgun spas12");
			SendClientMessage(playerid, COLOR_GRAD3, "Weapons: deagle uzi sawnoff tec9 ak47 m4 rifle flamethrower");
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			return 1;
		}
			strmid(gunid, tmp, 0, strlen(cmdtext), 255);
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
			{
				/*
				if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "minigun", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A minigun");
					PlayerInfo[playerid][pGun6] = 38;
					ResetPlayerWeapons(playerid);
					SetPlayerWeapons(playerid);
					PlayerInfo[playerid][gPupgrade]--;
				}
    */
				if ((strcmp(gunid, "flamethrower", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A flamethrower");
					dmweapon = 37;
				}
				else if ((strcmp(gunid, "rifle", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A rifle");
					dmweapon = 33;
				}
				else if ((strcmp(gunid, "m4", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With An m4");
					dmweapon = 31;
				}
				else if ((strcmp(gunid, "ak47", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With An ak47");
					dmweapon = 30;
				}
				else if ((strcmp(gunid, "Tec9", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A Tec9");
					dmweapon = 32;
				}
				else if ((strcmp(gunid, "sawnoff", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A sawnoff");
					dmweapon = 26;
				}
				else if ((strcmp(gunid, "uzi", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With An uzi");
					dmweapon = 28;
				}
				else if ((strcmp(gunid, "deagle", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A deagle");
					dmweapon = 24;
				}
				else if ((strcmp(gunid, "spas12", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A spas12");
					dmweapon = 27;
				}
				else if ((strcmp(gunid, "shotgun", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With A shotgun");
					dmweapon = 25;
				}
				else if ((strcmp(gunid, "mp5", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With An mp5");
					dmweapon = 29;
				}
				else if ((strcmp(gunid, "colt45", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With A colt45");
					dmweapon = 22;
				}
				else if ((strcmp(gunid, "sdpistol", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With An sdpistol");
					dmweapon = 23;
				}
				else if ((strcmp(gunid, "chainsaw", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With A chainsaw");
					dmweapon = 9;
				}
				else if ((strcmp(gunid, "default", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With There Own Weapons");
					dmweapon = 0;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD6, "   Unrecognized Weapon");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD6, "   You Are Not An Admin");
				return 1;
			}
		return 1;
	}
	if(strcmp(cmd, "/startdm", true) == 0)
	{
		if(MissionActive == 0 || MissionActive == 4 || MissionActive == 8 || MissionActive == 12)
		{
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
			{
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) && gPlayerSpawned[i])
					{
						SendClientMessage(i, COLOR_YELLOW, "SMS: DeathMatch Starting Soon At The Red Marker, Sender: MOLE (555)");
						RingTone[i] = 20;
						SendClientMessage(i, COLOR_WHITE, "HINT: Go To The Red Marker And Wait For The DeathMatch To Start.");
						SetPlayerCheckpoint(i,gRandomDMSpawns[0][0],gRandomDMSpawns[0][1],gRandomDMSpawns[0][2], 4.0);
						GameTextForPlayer(i, "~w~Waypoint set ~r~DM", 5000, 1);
						gPlayerCheckpointStatus[i] = CHECKPOINT_DM;
					}
				}
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You are not admin", 5000, 1);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "A mission is currently active");
		}
		return 1;
	}
	if(strcmp(cmd, "/plan", true) == 0)
	{
		SetPlayerInterior(playerid,10);
		SetPlayerPos(playerid,246.234, 117.805, 1005.61);
		//GetPlayerName(playerid, sendername, sizeof(sendername));
		GameTextForPlayer(playerid, "~w~Welcome Home", 5000, 1);
		//format(string, sizeof(string), "* %s checks the time.", sendername);
		//ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		return 1;
	}
//----------------------------------[BIZZ]-----------------------------------------------
	if(strcmp(cmd, "/buybiz", true) == 0)
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		if(PlayerInfo[playerid][pPbiskey] != 255)
		{
			SendClientMessage(playerid, COLOR_WHITE, "   You already own a business, type /sellbiz if you want to buy this one.");
			return 1;
		}
		for(new b = 0; b < sizeof(SBizzInfo); b++)
		{
			if(PlayerToPoint(2.0, playerid, SBizzInfo[b][sbEntrancex], SBizzInfo[b][sbEntrancey], SBizzInfo[b][sbEntrancez]) && SBizzInfo[b][sbOwned] == 0)
			{
				if(PlayerInfo[playerid][pLevel] < SBizzInfo[b][sbLevel])
				{
					format(string, sizeof(string), "You Must Be Level %d To Purchase This",SBizzInfo[b][sbLevel]);
					SendClientMessage(playerid, COLOR_GRAD5, string);
					return 1;
				}
				if(GetPlayerMoney(playerid) > SBizzInfo[b][sbValue])
				{
					PlayerInfo[playerid][pPbiskey] = b+100;
					SBizzInfo[b][sbOwned] = 1;
					GetPlayerName(playerid, sendername, sizeof(sendername));
					strmid(SBizzInfo[b][sbOwner], sendername, 0, strlen(sendername), 255);
					GivePlayerMoney(playerid,-SBizzInfo[b][sbValue]);
					PlayerPlayMusic(playerid);
					SendClientMessage(playerid, COLOR_WHITE, "Congratulations, On Your New Purchase.");
					SendClientMessage(playerid, COLOR_WHITE, "Type /cmds to review the new business help section.");
					DateProp(playerid);
					OnPropUpdate();
					OnUpdatePlayer(playerid);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "You don't have the cash for that");
					return 1;
				}
			}
		}
		for(new b = 0; b < sizeof(BizzInfo); b++)
		{
			if(PlayerToPoint(2.0, playerid, BizzInfo[b][bEntrancex], BizzInfo[b][bEntrancey], BizzInfo[b][bEntrancez]) && BizzInfo[b][bOwned] == 0)
			{
				if(PlayerInfo[playerid][pLevel] < BizzInfo[b][bLevel])
				{
					format(string, sizeof(string), "You Must Be Level %d To Purchase This",BizzInfo[b][bLevel]);
					SendClientMessage(playerid, COLOR_GRAD5, string);
					return 1;
				}
				if(GetPlayerMoney(playerid) > BizzInfo[b][bValue])
				{
					PlayerInfo[playerid][pPbiskey] = b;
					BizzInfo[b][bOwned] = 1;
					GetPlayerName(playerid, sendername, sizeof(sendername));
					strmid(BizzInfo[b][bOwner], sendername, 0, strlen(sendername), 255);
					GivePlayerMoney(playerid,-BizzInfo[b][bValue]);
					PlayerPlayMusic(playerid);
					SetPlayerInterior(playerid,BizzInfo[b][bInt]);
					PlayerInfo[playerid][pInt] = BizzInfo[b][bInt];
					SetPlayerPos(playerid,BizzInfo[b][bExitx],BizzInfo[b][bExity],BizzInfo[b][bExitz]);
					GameTextForPlayer(playerid, "~w~Welcome~n~You can exit at any time by moving to this door and typing /exit", 5000, 3);
					PlayerInfo[playerid][pInt] = BizzInfo[b][bInt];
					PlayerInfo[playerid][pLocal] = b ;
					SendClientMessage(playerid, COLOR_WHITE, "Congratulations, On Your New Purchase.");
					SendClientMessage(playerid, COLOR_WHITE, "Type /cmds to review the new business help section.");
					DateProp(playerid);
					OnPropUpdate();
					OnUpdatePlayer(playerid);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "You don't have the cash for that");
					return 1;
				}
			}
		}
	}
	if(strcmp(cmd, "/sellbiz", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		if(PlayerInfo[playerid][pPbiskey] == 255)
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't own a bizz.");
			return 1;
		}
		if(PlayerInfo[playerid][pPbiskey] >= 100 && strcmp(playername, SBizzInfo[PlayerInfo[playerid][pPbiskey]-100][sbOwner], true) == 0)
		{
			new bouse = PlayerInfo[playerid][pPbiskey]-100;
			SBizzInfo[bouse][sbHel] = 0;
			SBizzInfo[bouse][sbArm] = 0;
			SBizzInfo[bouse][sbLock] = 1;
			SBizzInfo[bouse][sbOwned] = 0;
			SBizzInfo[bouse][sbTakings] = 0;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			strmid(SBizzInfo[bouse][sbOwner], "The State", 0, strlen("The State"), 255);
			GivePlayerMoney(playerid,SBizzInfo[bouse][sbValue]);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~Congratulations~n~ You have sold your property for ~n~~g~$%d", SBizzInfo[bouse][sbValue]);
			GameTextForPlayer(playerid, string, 10000, 3);
			PlayerInfo[playerid][pPbiskey] = 255;
			OnPropUpdate();
			OnUpdatePlayer(playerid);
			return 1;
		}
		if(strcmp(playername, BizzInfo[PlayerInfo[playerid][pPbiskey]][bOwner], true) == 0)
		{
			new bouse = PlayerInfo[playerid][pPbiskey];
			BizzInfo[bouse][bHel] = 0;
			BizzInfo[bouse][bArm] = 0;
			BizzInfo[bouse][bLock] = 1;
			BizzInfo[bouse][bOwned] = 0;
			BizzInfo[bouse][bTakings] = 0;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			strmid(BizzInfo[bouse][bOwner], "The State", 0, strlen("The State"), 255);
			GivePlayerMoney(playerid,BizzInfo[bouse][bValue]);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~Congratulations~n~ You have sold your property for ~n~~g~$%d", BizzInfo[bouse][bValue]);
			GameTextForPlayer(playerid, string, 10000, 3);
			PlayerInfo[playerid][pPbiskey] = 255;
			OnPropUpdate();
			OnUpdatePlayer(playerid);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't own a business.");
		}
	}
	if (strcmp(cmd, "/bizinfo", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if(bouse == 255)
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't own a business.");
		}
		if (bouse >= 100)
		{

			PrintSBizInfo(playerid,bouse-100);
		}
		else
		{
			PrintBizInfo(playerid,bouse);
		}
		return 1;
	}
	if(strcmp(cmd, "/bizfee", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /bizfee [EntranceFee]");
		}
		if(strval(tmp) < 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Minimum entrance is $0");
			return 1;
		}
		if (bouse >= 100)
		{

			SBizzInfo[bouse-100][sbEntcost] = strval(tmp);
			format(string, sizeof(string), "Entrance fee set to $%d", SBizzInfo[bouse-100][sbEntcost]);
		}
		else
		{
			BizzInfo[bouse][bEntcost] = strval(tmp);
			format(string, sizeof(string), "Entrance fee set to $%d", BizzInfo[bouse][bEntcost]);
		}
		OnPropUpdate();
		SendClientMessage(playerid, COLOR_WHITE, string);
		return 1;
	}
	if(strcmp(cmd, "/pricemod", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /pricemod [percentage of base value (default %100)]");
			return 1;
		}
		if(strval(tmp) < 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Minimum percentage is 0%");
			return 1;
		}
		if (bouse >= 100)
		{
			SBizzInfo[bouse-100][sbEntcost] = strval(tmp);
			format(string, sizeof(string), "You dont own a large business");
		}
		else
		{
			BizzInfo[bouse][bPriceMod] = strval(tmp);
			format(string, sizeof(string), "Price percentage modifier set to %d%", BizzInfo[bouse][bPriceMod]);
		}
		OnPropUpdate();
		SendClientMessage(playerid, COLOR_WHITE, string);
		return 1;
	}
	if(strcmp(cmd, "/compprice", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /compprice [amount to pay per unit of components]");
		}
		if(strval(tmp) < 10000)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Minimum amount is $10000");
			return 1;
		}
		if (bouse >= 100)
		{
			if(strval(tmp) > SBizzInfo[bouse-100][sbTakings])
			{
				SendClientMessage(playerid, COLOR_WHITE, "You dont have that much in your till.");
				return 1;
			}
			SBizzInfo[bouse-100][sbPayComp] = strval(tmp);
			format(string, sizeof(string), "Buying Components for $%d", SBizzInfo[bouse-100][sbPayComp]);
		}
		else
		{
			if(strval(tmp) > BizzInfo[bouse][bTakings])
			{
				SendClientMessage(playerid, COLOR_WHITE, "You dont have that much in your till.");
				return 1;
			}
			BizzInfo[bouse][bPayComp] = strval(tmp);
			format(string, sizeof(string), "Buying Components for $%d", BizzInfo[bouse][bPayComp]);
		}
		OnPropUpdate();
		SendClientMessage(playerid, COLOR_WHITE, string);
		return 1;
	}
	if(strcmp(cmd, "/missionactive", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /bizfee [EntranceFee]");
		}
		MissionActive = strval(tmp);
		new sstring[256];
		format(sstring, sizeof(sstring), "MissionActive = %d",MissionActive);
		SendClientMessage(playerid, COLOR_GRAD1, sstring);
		return 1;
	}
	if(strcmp(cmd, "/bizname", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (PlayerInfo[playerid][pAdmin] < 1337)
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "   You can't own a large business");
			return 1;
		}
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /bizname [Name](dont use ,)");
		}
		if (bouse >= 100)
		{
			strmid(SBizzInfo[bouse-100][sbDiscription], result, 0, 64, 255);
			format(string, sizeof(string), "Buisness name set to %s",SBizzInfo[bouse-100][sbDiscription]);
		}
		else
		{
			strmid(BizzInfo[bouse][bDiscription], result, 0, 64, 255);
			format(string, sizeof(string), "Buisness name set to %s",BizzInfo[bouse][bDiscription]);
		}
			OnPropUpdate();
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
	}
	if(strcmp(cmd, "/bizwithdraw", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			if (bouse >= 100)
			{
				format(string, sizeof(string), "  You Have $%d in your till.", SBizzInfo[bouse-100][sbTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
			}
			else
			{
				format(string, sizeof(string), "  You Have $%d in your till.", BizzInfo[bouse][bTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
			}
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bizwithdraw [amount]");
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bizwithdraw [amount]");
			return 1;
		}
		if (bouse >= 100)
		{
			if(cashdeposit > SBizzInfo[bouse-100][sbTakings] || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
				return 1;
			}
		}
		else
		{
			if (cashdeposit > BizzInfo[bouse][bTakings] || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
				return 1;
			}
		}
		if (bouse >= 100)
		{
			if(!PlayerToPoint(100, playerid,SBizzInfo[bouse-100][sbEntrancex],SBizzInfo[bouse-100][sbEntrancey],SBizzInfo[bouse-100][sbEntrancez]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,cashdeposit);
				SBizzInfo[bouse-100][sbTakings]=SBizzInfo[bouse-100][sbTakings]-cashdeposit;
				format(string, sizeof(string), "  You Have Withdrawn $%d from your till Total: $%d ", cashdeposit,SBizzInfo[bouse-100][sbTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
		else
		{
			if (!PlayerToPoint(100, playerid,BizzInfo[bouse][bExitx],BizzInfo[bouse][bExity],BizzInfo[bouse][bExitz]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,cashdeposit);
				BizzInfo[bouse][bTakings]=BizzInfo[bouse][bTakings]-cashdeposit;
				format(string, sizeof(string), "  You Have Withdrawn $%d from your till Total: $%d ", cashdeposit,BizzInfo[bouse][bTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
	}
	if(strcmp(cmd, "/bizbank", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			if (bouse >= 100)
			{
				format(string, sizeof(string), "  You Have $%d in your till.", SBizzInfo[bouse-100][sbTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
			}
			else
			{
				format(string, sizeof(string), "  You Have $%d in your till.", BizzInfo[bouse][bTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
			}
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bizbank [amount]");
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bizbank [amount]");
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		if (cashdeposit > GetPlayerMoney(playerid) || cashdeposit < 1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
			return 1;
		}
		if (bouse >= 100)
		{
			if(!PlayerToPoint(100, playerid,SBizzInfo[bouse-100][sbEntrancex],SBizzInfo[bouse-100][sbEntrancey],SBizzInfo[bouse-100][sbEntrancez]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,-cashdeposit);
				SBizzInfo[bouse-100][sbTakings]=SBizzInfo[bouse-100][sbTakings]+cashdeposit;
				format(string, sizeof(string), "  You Have Banked $%d to your till Total: $%d ", cashdeposit,SBizzInfo[bouse-100][sbTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
		else
		{
			if (!PlayerToPoint(100, playerid,BizzInfo[bouse][bExitx],BizzInfo[bouse][bExity],BizzInfo[bouse][bExitz]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,-cashdeposit);
				BizzInfo[bouse][bTakings]=BizzInfo[bouse][bTakings]+cashdeposit;
				format(string, sizeof(string), "  You Have Banked $%d to your till Total: $%d ", cashdeposit,BizzInfo[bouse][bTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
	}
	if(strcmp(cmd, "/bizupgrade", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse >= 100)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a large business");
			return 1;
		}
		if (PlayerInfo[playerid][pInt] != BizzInfo[bouse][bInt])
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You must be in your business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /bizupgrade [item number]");
			SendClientMessage(playerid, COLOR_GRAD2, "|_______ Home Supplys _______|");
			SendClientMessage(playerid, COLOR_GRAD3, "| 1: health Pickup $50000");
			SendClientMessage(playerid, COLOR_GRAD4, "| 2: Armour Pickup $100000");
			return 1;
		}
		new item = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /bizupgrade [item number]");
			SendClientMessage(playerid, COLOR_GRAD2, "|_______ Home Supplys _______|");
			SendClientMessage(playerid, COLOR_GRAD3, "| 1: health Pickup $50000");
			SendClientMessage(playerid, COLOR_GRAD4, "| 2: Armour Pickup $100000");
			return 1;
		}
		switch (item)
		{
			case 1:
			{
				if(PlayerInfo[playerid][pLevel] < 5)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 5 To Purchase This");
					return 1;
				}
				if(GetPlayerMoney(playerid) < 50000)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "You Don't have The Cash To Purchase This");
					return 1;
				}
				BizzInfo[bouse][bHel] = 1;
				GivePlayerMoney(playerid,-50000);
				SBizzInfo[5][sbTakings] = SBizzInfo[5][sbTakings]+50000;//heal buisness
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			}
			case 2:
			{
				if (PlayerInfo[playerid][pLevel] < 8)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 8 To Purchase This");
					return 1;
				}
				if(GetPlayerMoney(playerid) < 100000)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "You Don't have The Cash To Purchase This");
					return 1;
				}
				BizzInfo[bouse][bArm] = 1;
				GivePlayerMoney(playerid,-100000);
				SBizzInfo[5][sbTakings] = SBizzInfo[5][sbTakings]+100000;//heal buisness
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			}
		}
			OnPropUpdate();
			OnUpdatePlayer(playerid);
			SendClientMessage(playerid, COLOR_GRAD5, "Your Shoppers Can Now Use /heal.");
			return 1;
	}
//----------------------------------[JOB]-----------------------------------------------

	if(strcmp(cmd, "/job", true) == 0)
	{
		if (gTeam[playerid] >= 3)
		{
			SendClientMessage(playerid, COLOR_YELLOW, objstore);
		}
		else if (gTeam[playerid] == 2)
		{
			SendClientMessage(playerid, COLOR_DBLUE, cbjstore);
		}
		return 1;
	}
//-----------------------------------[HEAL]-------------------------------------------------------------------------
	if(strcmp(cmd, "/heal", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new location = PlayerInfo[playerid][pLocal];
		if(!strlen(tmp))
		{
			if(location != 255)
			{
				if(location < 99)
				{
					if(HouseInfo[location][hArm] == 1)
					{
						format(string, sizeof(string), "* %s put's on body armour.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPlayerArmour(playerid, 100);
					}
					else
					{
						format(string, sizeof(string), "This place does not have armour upgrades");
						SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
					}
					if(HouseInfo[location][hHel] == 1)
					{
						new Float:tempheal;
						GetPlayerHealth(playerid,tempheal);
						if ( tempheal < 100.0)
						{
							SetPlayerHealth(playerid,100.0);
							PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "You have been healed to 100 health");
							SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
						}
						else
						{
							SendClientMessage(playerid, TEAM_GREEN_COLOR,"You are alredy healed to 100");
						}
					}
					else
					{
						format(string, sizeof(string), "This place does not have healing upgrades");
						SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
					}
					return 1;
				}
				else
				{
					if(BizzInfo[location-99][bArm] == 1)
					{
						format(string, sizeof(string), "* %s put's on body armour.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPlayerArmour(playerid, 100);
					}
					else
					{
						format(string, sizeof(string), "This place does not have armour upgrades");
						SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
					}
					if(BizzInfo[location-99][bHel] == 1)
					{
						new Float:tempheal;
						GetPlayerHealth(playerid,tempheal);
						if ( tempheal < 100.0)
						{
							SetPlayerHealth(playerid,100.0);
							PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "You have been healed to 100 health");
							SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
						}
						else
						{
							SendClientMessage(playerid, TEAM_GREEN_COLOR,"You are alredy healed to 100");
						}
					}
					else
					{
						format(string, sizeof(string), "This place does not have healing upgrades");
						SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
					}
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /heal [playerid/PartOfName]");
				return 1;
			}
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if (giveplayerid == playerid)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   You can not heal yourself!");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new giveambu = GetPlayerVehicleID(giveplayerid);
			new playambu = GetPlayerVehicleID(playerid);
			if (gTeam[playerid] == TEAM_CYAN)//model
			{
				if ((playambu >= 61 && playambu <= 63) && (playambu == giveambu))
				{
					new Float:tempheal;
					GetPlayerHealth(giveplayerid,tempheal);
					if ( tempheal >= 150.0)
					{
						SendClientMessage(playerid, TEAM_GREEN_COLOR,"   That person is fully healed.");
						return 1;
					}
					format(string, sizeof(string), "~y~You healed ~n~~w~%s~n~~g~$%d", giveplayer,mediccharge);
					//printf("AdmCmd: %s has jailed %s.", sendername, giveplayer);
					GivePlayerMoney(playerid,mediccharge);
					GivePlayerMoney(giveplayerid,-mediccharge);
					GameTextForPlayer(playerid, string, 5000, 1);
					SetPlayerHealth(giveplayerid,150.0);
					PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
					PlayerPlaySound(giveplayerid, 1150, 0.0, 0.0, 0.0);
					if(gTeam[giveplayerid] == TEAM_CYAN)
					{
						format(string, sizeof(string), "You have been healed to 150 health -$ free",mediccharge);
						SendClientMessage(giveplayerid, TEAM_GREEN_COLOR,string);
						return 1;
					}
					else
					{
						format(string, sizeof(string), "You have been healed to 150 health -$%d",mediccharge);
						SendClientMessage(giveplayerid, TEAM_GREEN_COLOR,string);
						PlayerInfo[playerid][pWA]++;
						if(PlayerInfo[playerid][pWA] >= 20)
						{
							PlayerInfo[playerid][pExp]++;
							PlayerInfo[playerid][pWA] = 0;
							SendClientMessage(playerid, COLOR_YELLOW, "You are getting stronger Exp +1");
						}
					}

				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   one of you is not in the ambulance!");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
//----------------------------------[ADMINADMIN]-----------------------------------------------
//----------------------------------[mole]-----------------------------------------------
	if(strcmp(cmd, "/mole", true) == 0 && PlayerInfo[playerid][pAdmin] >= 1337)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /mole [mole text]");
			return 1;
		}
		format(string, sizeof(string), "SMS: %s, Sender: MOLE (555)",result);
		if (gTeam[playerid] < 3){SendClientMessage(playerid, COLOR_YELLOW, string);}
		SendEnemyMessage(COLOR_YELLOW, string);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && gPlayerSpawned[i])
			{
				if(gTeam[i] >= 3)
				{
					RingTone[i] =20;
				}
			}
		}
		printf("MOLE: %s", result);
		return 1;
	}
//----------------------------------[HQ]-----------------------------------------------
	if(strcmp(cmd, "/hq", true) == 0 && PlayerInfo[playerid][pAdmin] >= 1337)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /hq [hq text]");
			return 1;
		}
		format(string, sizeof(string), "HQ: %s, over", result);
		if (gTeam[playerid] != 2 ){SendClientMessage(playerid, COLOR_DBLUE, string);}
		SendTeamBeepMessage(2, COLOR_DBLUE, string);
		printf("HQ: %s", result);
		return 1;
	}
//----------------------------------[RECON]-----------------------------------------------
	if(strcmp(cmd, "/bigears", true) == 0 && PlayerInfo[playerid][pAdmin] >= 2)
	{
		if (!BigEar[playerid])
		{
			BigEar[playerid] = 1;
			SendClientMessage(playerid, COLOR_GRAD2, "   Your Ears Have Grown");
		}
		else if (BigEar[playerid])
		{
			(BigEar[playerid] = 0);
			SendClientMessage(playerid, COLOR_GRAD2, "   Your Ears Have Shrank");
		}
		return 1;
	}
	if(strcmp(cmd, "/id", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /recon [playerid/PON/off]");
			return 1;
		}
		new target;
		if(IsStringAName(tmp))
		{
			target = GetPlayerID(tmp);
		}
		else
		{
			target = strval(tmp);
		}
		new sstring[256];
		GetPlayerName(target, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "ID: (%d) %s",target,giveplayer);
		SendClientMessage(playerid, COLOR_GRAD1, sstring);
		return 1;
	}
	if(strcmp(cmd, "/tv", true) == 0 || strcmp(cmd, "/recon", true) == 0)
	{
		new house;
		if(Unspec[playerid][sLocal] == 255)
		{
			house = PlayerInfo[playerid][pLocal];
		}
		else
		{
			house = Unspec[playerid][sLocal];
		}
		if(PlayerInfo[playerid][pAdmin] < 1)
		{
			if(house == 255)
			{
				GameTextForPlayer(playerid, "~r~There is no tv here", 5000, 1);
				return 1;
			}
		}
		//printf("house has tv %d",HouseInfo[house][hHealthx]);
		TVMode[playerid] = 0;
		Unspec[playerid][sCam] = 2;
		if(Spectate[playerid] == 255 && PlayerInfo[playerid][pLocal] != 255 || Spectate[playerid] == 255 && PlayerInfo[playerid][pAdmin] > 0)
		{
			GetPlayerPos(playerid, Unspec[playerid][sPx], Unspec[playerid][sPy], Unspec[playerid][sPz]);
			Unspec[playerid][sPint] = PlayerInfo[playerid][pInt];
			Unspec[playerid][sLocal] = PlayerInfo[playerid][pLocal];
			PlayerInfo[playerid][pLocal] = 255;
			gTeam[playerid] = 0;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			if(HouseInfo[house][hHealthx] != 1)
			{
				GameTextForPlayer(playerid, "~r~Upgrade not installed", 5000, 1);
				return 1;
			}
			TVMode[playerid] = 1;
			Spectate[playerid] = lastkiller;
			GameTextForPlayer(playerid, "~w~                True~n~                   ~b~Crime", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("off", tmp, true, strlen(tmp)) == 0)
		{
			Spectate[playerid] = 253;
			GameTextForPlayer(playerid, "~w~                TV~n~~r~                Off", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("door", tmp, true, strlen(tmp)) == 0)
		{
			if(HouseInfo[house][hHealthy] != 1)
			{
				GameTextForPlayer(playerid, "~r~DoorCam not installed", 5000, 1);
				return 1;
			}
			if(PlayerInfo[playerid][pLocal] == 255 && Unspec[playerid][sLocal] == 255 )
			{
				GameTextForPlayer(playerid, "~r~no can do", 5000, 1);
				return 1;
			}
			house = Unspec[playerid][sLocal];
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					if(PlayerToPoint(20.0, i, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]))
					{
						Unspec[playerid][sCam] = 10;
						Spectate[playerid] = i;
						GameTextForPlayer(playerid, "~b~Door~r~Cam~n~~w~Type /tv off~n~to exit", 5000, 1);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
				}
			}
			if(Unspec[playerid][sCam] != 10)
			{
				GameTextForPlayer(playerid, "~w~No one is at the door", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
			}
			return 1;
		}
		if(strcmp("dm", tmp, true, strlen(tmp)) == 0)
		{
			if(HouseInfo[house][hHealthz] != 1)
			{
				GameTextForPlayer(playerid, "~r~No subscription", 5000, 1);
				return 1;
			}
			if(MissionActive != 13 || DmHiPlayer == 255)
			{
				GameTextForPlayer(playerid, "~g~No DeathMatchs~n~~w~On TV now", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				return 1;
			}
			TVMode[playerid] = 11;
			Spectate[playerid] = DmHiPlayer;
			GameTextForPlayer(playerid, "~r~                D~w~MTV", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("race", tmp, true, strlen(tmp)) == 0)
		{
			if(HouseInfo[house][hArmourx] != 1)
			{
				GameTextForPlayer(playerid, "~r~No subscription", 5000, 1);
				return 1;
			}
			if(MissionActive < 4 || MissionActive > 7)
			{
				GameTextForPlayer(playerid, "~g~No Races~n~~w~On TV now", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				return 1;
			}
			TVMode[playerid] = 21;
			RaceSpec(playerid);
			GameTextForPlayer(playerid, "~w~                S~b~R~n~~r~                TV", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("pen", tmp, true, strlen(tmp)) == 0)
		{
			if(HouseInfo[house][hArmoury] != 1)
			{
				GameTextForPlayer(playerid, "~r~No subscription", 5000, 1);
				return 1;
			}
			if(gPublicEnemy == 255)
			{
				GameTextForPlayer(playerid, "~g~No Public Enemys~n~~w~On TV now", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				return 1;
			}
			TVMode[playerid] = 31;
			PenDelay(playerid);
			GameTextForPlayer(playerid, "~p~                PEN~n~                ~w~TV", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("speed", tmp, true, strlen(tmp)) == 0)
		{
			if(Speeder == 255)
			{
				GameTextForPlayer(playerid, "~g~No Speeders ~n~~w~On TV now", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				return 1;
			}
			TVMode[playerid] = 41;
			SpeedDelay(playerid);
			GameTextForPlayer(playerid, "~y~                Speed~n~                ~w~TV", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("foot", tmp, true, strlen(tmp)) == 0 && PlayerInfo[playerid][pAdmin] >= 1)
		{
			Spectate[playerid] = lastkiller;
		}
		if(strcmp("next", tmp, true, strlen(tmp)) == 0 && PlayerInfo[playerid][pAdmin] >= 1)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					if(i > Spectate[playerid] && Spectate[playerid] != 255 && PlayerInfo[i][pLevel] <= 2)
					{
						new Float:health;
						GetPlayerHealth(i, health);
						Spectate[playerid] = i;
						new sstring[256];
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
						new cash =  GetPlayerMoney(i);
						format(sstring, sizeof(sstring), "Recon: (%d) %s $%d H:%.1f ",i,giveplayer,cash,health);
						SendClientMessage(playerid, COLOR_GREEN, sstring);
						return 1;
					}
				}
			}
		}
		if(strcmp("prev", tmp, true, strlen(tmp)) == 0 && PlayerInfo[playerid][pAdmin] >= 1)
		{
			for(new i = MAX_PLAYERS; i >= 0; i--)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					if(i < Spectate[playerid] && Spectate[playerid] != 255 && PlayerInfo[i][pLevel] <= 2)
					{
						new Float:health;
						GetPlayerHealth(i, health);
						Spectate[playerid] = i;
						new sstring[256];
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
						new cash =  GetPlayerMoney(i);
						format(sstring, sizeof(sstring), "Recon: (%d) %s $%d H:%.1f",i,giveplayer,cash,health);
						SendClientMessage(playerid, COLOR_GREEN, sstring);
						return 1;
					}
				}
			}
		}
		if(house == 255)
		{
			if(PlayerInfo[playerid][pAdmin] < 1)
			{
				GameTextForPlayer(playerid, "~r~Upgrade not installed", 5000, 1);
				return 1;
			}
		}
		else
		{
			if(HouseInfo[house][hArmourz] != 1 && PlayerInfo[playerid][pAdmin] < 1)
			{
				GameTextForPlayer(playerid, "~r~Upgrade not installed", 5000, 1);
				return 1;
			}
		}
		if(IsStringAName(tmp))
		{
			Spectate[playerid] = GetPlayerID(tmp);
		}
		else
		{
			Spectate[playerid] = strval(tmp);
		}
		if(IsPlayerConnected(Spectate[playerid]))
		{
			if(Hidden[Spectate[playerid]] != 1 && PlayerInfo[playerid][pAdmin] < 1)
			{
				SendClientMessage(playerid, COLOR_GREEN, "Target is masked");
			}
			new Float:health;
			GetPlayerHealth(Spectate[playerid], health);
			new sstring[256];
			GetPlayerName(Spectate[playerid], giveplayer, sizeof(giveplayer));
			new cash =  GetPlayerMoney(Spectate[playerid]);
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
			{
				format(sstring, sizeof(sstring), "Recon: (%d) %s $%d H:%.0f",Spectate[playerid],giveplayer,cash,health);
			}
			else
			{
				format(sstring, sizeof(sstring), "UAV: (%d) %s",Spectate[playerid],giveplayer);
			}
			SendClientMessage(playerid, COLOR_GREEN, sstring);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREEN, "Target is not available");
		}
		return 1;
	}
//----------------------------------[SPAWN]-----------------------------------------------

	if(strcmp(cmd, "/spawn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SetPlayerRandomSpawn(playerid);
  }
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/spawn2", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SpawnPlayer(playerid);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/spawn3", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			OnPlayerSpawn(playerid);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/pen", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SetPlayerCriminal(playerid,255, "Armed Robbery",1,1);
			gPlayerMission[playerid] = 1;
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[PAYDAY]-----------------------------------------------
/*
	if(strcmp(cmd, "/payday", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			PayDay();
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}*/
	if(strcmp(cmd, "/incmis", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			gRaceLeader=1;
			gFightLeader=1;
			SendClientMessage(playerid, COLOR_GRAD1, "Playercount Incrementeted");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[TEST]-----------------------------------------------

	if(strcmp(cmd, "/test", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			new sstring[256];
			new playambu = GetPlayerVehicleID(playerid);
			format(sstring, sizeof(sstring), "currentpickups = %d gFighters = %d gFightLeader = %d dmtimer = %d DmHiScore = %d",pickups ,gFighters ,gFightLeader,dmtimer,DmHiScore);
			SendClientMessage(playerid, COLOR_GRAD1, sstring);
			format(sstring, sizeof(sstring), "currentcar = %d locked[%d] stealcar = %d stealcardest = %d MissionActive = %d",playambu,gCarLock[playambu],stealcar,stealcardest,MissionActive);
			SendClientMessage(playerid, COLOR_GRAD1, sstring);
			//GetPlayerVehicleID(playerid);
			/*
			for(new i = 0; i <= 24; i++)
			{
				format(sstring, sizeof(sstring), "currentpickups = %d", pickups);
				print(sstring);
			}

			//SetSpawnInfo(playerid, 2, 153, 0.0, 0.0, 0.0, 0.1, -1, -1, -1, -1, -1, -1);
		   // SpawnPlayer(playerid);
			if (CopCheck(playerid))
			{
				print("yes you are a cop");
			}
			else
			{
				print("not a cop cop");
			}
		    //printf("johnsid = %d",GetPlayerID("John_"));
			//SetPlayerCriminal(playerid,255, "Armed Robbery",1,0);
			//GameTextForPlayer(playerid, string, 5000, 1);
			//SendClientMessage(playerid, COLOR_GRAD1, string);
   */
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/patch", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
				SBizzInfo[0][sbPayComp] = 10000;
				SBizzInfo[1][sbPayComp] = 11000;
				SBizzInfo[2][sbPayComp] = 12000;
				SBizzInfo[3][sbPayComp] = 10000;
				SBizzInfo[4][sbPayComp] = 11000;
				SBizzInfo[5][sbPayComp] = 12000;
				SBizzInfo[6][sbPayComp] = 10000;
				SBizzInfo[7][sbPayComp] = 10000;
				SBizzInfo[8][sbPayComp] = 10000;
				SBizzInfo[9][sbPayComp] = 10000;
				SBizzInfo[10][sbPayComp] = 10000;

				BizzInfo[0][bPayComp] = 12000;
				BizzInfo[1][bPayComp] = 10000;
				BizzInfo[2][bPayComp] = 11000;
				BizzInfo[3][bPayComp] = 10000;
				BizzInfo[4][bPayComp] = 12000;
				BizzInfo[5][bPayComp] = 12000;
				BizzInfo[6][bPayComp] = 10000;
				BizzInfo[7][bPayComp] = 11000;
				BizzInfo[8][bPayComp] = 10000;
				BizzInfo[9][bPayComp] = 12000;
				BizzInfo[10][bPayComp] = 10000;
				BizzInfo[11][bPayComp] = 10020;
				BizzInfo[12][bPayComp] = 10010;
			/*
				SBizzInfo[0][sbProd] = 50;SBizzInfo[0][sbProdCap] = 500;SBizzInfo[0][sbComp] = 2;SBizzInfo[0][sbCompCap] = 10;SBizzInfo[0][sbProdCost] = 10;SBizzInfo[0][sbPayComp] = 10000;
				SBizzInfo[1][sbProd] = 50;SBizzInfo[1][sbProdCap] = 500;SBizzInfo[1][sbComp] = 4;SBizzInfo[1][sbCompCap] = 16;SBizzInfo[1][sbProdCost] = 4;SBizzInfo[1][sbPayComp] = 11000;
				SBizzInfo[2][sbProd] = 50;SBizzInfo[2][sbProdCap] = 240;SBizzInfo[2][sbComp] = 5;SBizzInfo[2][sbCompCap] = 20;SBizzInfo[2][sbProdCost] = 2;SBizzInfo[2][sbPayComp] = 12000;
				SBizzInfo[3][sbProd] = 50;SBizzInfo[3][sbProdCap] = 500;SBizzInfo[3][sbComp] = 3;SBizzInfo[3][sbCompCap] = 10;SBizzInfo[3][sbProdCost] = 7;SBizzInfo[3][sbPayComp] = 10000;
				SBizzInfo[4][sbProd] = 50;SBizzInfo[4][sbProdCap] = 500;SBizzInfo[4][sbComp] = 6;SBizzInfo[4][sbCompCap] = 10;SBizzInfo[4][sbProdCost] = 10;SBizzInfo[4][sbPayComp] = 11000;
				SBizzInfo[5][sbProd] = 50;SBizzInfo[5][sbProdCap] = 100;SBizzInfo[5][sbComp] = 4;SBizzInfo[5][sbCompCap] = 20;SBizzInfo[5][sbProdCost] = 1;SBizzInfo[5][sbPayComp] = 12000;
				SBizzInfo[6][sbProd] = 50;SBizzInfo[6][sbProdCap] = 100;SBizzInfo[6][sbComp] = 5;SBizzInfo[6][sbCompCap] = 20;SBizzInfo[6][sbProdCost] = 1;SBizzInfo[6][sbPayComp] = 10000;

				BizzInfo[0][bProd] = 50;BizzInfo[0][bProdCap] = 500;BizzInfo[0][bComp] = 6;BizzInfo[0][bCompCap] = 18;BizzInfo[0][bProdCost] = 2;BizzInfo[0][bPayComp] = 12000;
				BizzInfo[1][bProd] = 50;BizzInfo[1][bProdCap] = 500;BizzInfo[1][bComp] = 4;BizzInfo[1][bCompCap] = 10;BizzInfo[1][bProdCost] = 3;BizzInfo[1][bPayComp] = 10000;
				BizzInfo[2][bProd] = 50;BizzInfo[2][bProdCap] = 500;BizzInfo[2][bComp] = 5;BizzInfo[2][bCompCap] = 10;BizzInfo[2][bProdCost] = 4;BizzInfo[2][bPayComp] = 11000;
				BizzInfo[3][bProd] = 50;BizzInfo[3][bProdCap] = 500;BizzInfo[3][bComp] = 3;BizzInfo[3][bCompCap] = 10;BizzInfo[3][bProdCost] = 5;BizzInfo[3][bPayComp] = 10000;
				BizzInfo[4][bProd] = 50;BizzInfo[4][bProdCap] = 100;BizzInfo[4][bComp] = 6;BizzInfo[4][bCompCap] = 0;BizzInfo[4][bProdCost] = 0;BizzInfo[4][bPayComp] = 12000;
				BizzInfo[5][bProd] = 50;BizzInfo[5][bProdCap] = 100;BizzInfo[5][bComp] = 5;BizzInfo[5][bCompCap] = 0;BizzInfo[5][bProdCost] = 0;BizzInfo[5][bPayComp] = 12000;
				BizzInfo[6][bProd] = 50;BizzInfo[6][bProdCap] = 220;BizzInfo[6][bComp] = 4;BizzInfo[6][bCompCap] = 10;BizzInfo[6][bProdCost] = 10;BizzInfo[6][bPayComp] = 10000;
				BizzInfo[7][bProd] = 50;BizzInfo[7][bProdCap] = 100;BizzInfo[7][bComp] = 3;BizzInfo[7][bCompCap] = 0;BizzInfo[7][bProdCost] = 0;BizzInfo[7][bPayComp] = 11000;
				BizzInfo[8][bProd] = 50;BizzInfo[8][bProdCap] = 100;BizzInfo[8][bComp] = 6;BizzInfo[8][bCompCap] = 20;BizzInfo[8][bProdCost] = 1;BizzInfo[8][bPayComp] = 10000;
				BizzInfo[9][bProd] = 50;BizzInfo[9][bProdCap] = 100;BizzInfo[9][bComp] = 4;BizzInfo[9][bCompCap] = 20;BizzInfo[9][bProdCost] = 1;BizzInfo[9][bPayComp] = 12000;
				BizzInfo[10][bProd] = 50;BizzInfo[10][bProdCap] = 100;BizzInfo[10][bComp] = 3;BizzInfo[10][bCompCap] = 20;BizzInfo[10][bProdCost] = 1;BizzInfo[10][bPayComp] = 10000;
				BizzInfo[11][bProd] = 50;BizzInfo[11][bProdCap] = 500;BizzInfo[11][bComp] = 4;BizzInfo[11][bCompCap] = 10;BizzInfo[11][bProdCost] = 3;BizzInfo[11][bPayComp] = 10020;
				BizzInfo[12][bProd] = 50;BizzInfo[12][bProdCap] = 500;BizzInfo[12][bComp] = 5;BizzInfo[12][bCompCap] = 10;BizzInfo[12][bProdCost] = 4;BizzInfo[12][bPayComp] = 10010;

				BizzInfo[4][bProd] = 50;BizzInfo[4][bProdCap] = 100;BizzInfo[4][bComp] = 6;BizzInfo[4][bCompCap] = 10;BizzInfo[4][bProdCost] = 5;BizzInfo[4][bPayComp] = 12000;
				BizzInfo[5][bProd] = 50;BizzInfo[5][bProdCap] = 100;BizzInfo[5][bComp] = 5;BizzInfo[5][bCompCap] = 10;BizzInfo[5][bProdCost] = 5;BizzInfo[5][bPayComp] = 12000;
				BizzInfo[7][bProd] = 50;BizzInfo[7][bProdCap] = 100;BizzInfo[7][bComp] = 3;BizzInfo[7][bCompCap] = 10;BizzInfo[7][bProdCost] = 5;BizzInfo[7][bPayComp] = 11000;

				BizzInfo[0][bPriceMod] = 100;BizzInfo[1][bPriceMod] = 100;BizzInfo[2][bPriceMod] = 100;
				BizzInfo[3][bPriceMod] = 100;BizzInfo[4][bPriceMod] = 100;BizzInfo[5][bPriceMod] = 100;
				BizzInfo[6][bPriceMod] = 100;BizzInfo[7][bPriceMod] = 100;BizzInfo[8][bPriceMod] = 100;
				BizzInfo[9][bPriceMod] = 100;BizzInfo[10][bPriceMod] = 100;BizzInfo[11][bPriceMod] = 100;BizzInfo[12][bPriceMod] = 100;
    */
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[TEST]-----------------------------------------------
	if(strcmp(cmd, "/testcam", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
					new Float:plx,Float:ply,Float:plz;
					new Float:clx,Float:cly,Float:clz;
						GetPlayerPos(playerid, plx, ply, plz);
						clx = plx;
						cly = ply+2;
						clz = plz+0.2;
						plz = plz+0.6;
						SetPlayerFacingAngle(playerid, 0.0);
						SetPlayerCameraPos(playerid,clx, cly, clz);
						SetPlayerCameraLookAt(playerid,plx, ply, plz);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/prop", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			LoadProperty();
			LoadBizz();
			LoadSBizz();
			SendClientMessage(playerid, COLOR_GRAD1, "   Property Reloaded");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/tmppos", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			LoadTmp();
			SendClientMessage(playerid, COLOR_GRAD1, "   TmpPos Reloaded");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[UNCON]-----------------------------------------------

	if(strcmp(cmd, "/uncon", true) == 0)
	{

		SetCamBack(playerid);
		return 1;
	}

//----------------------------------[AdminChat]-----------------------------------------------
	if(strcmp(cmd, "/admin", true) == 0 || strcmp(cmd, "/a", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/a)dmin [admin chat]");
			return 1;
		}
		format(string, sizeof(string), "*Admin %s: %s", sendername, result);
		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
			SendAdminMessage(COLOR_YELLOW, string);
		}
		printf("Admin %s: %s", sendername, result);
		return 1;
	}
//-------------------------------[Logout]--------------------------------------------------------------------------
	if (strcmp(cmd, "/logout", true) ==0 )
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			OnUpdatePlayer(playerid);
			gPlayerLogged[playerid] = 0;
			SendClientMessage(playerid, COLOR_GRAD1, "   It is now safe to quit.");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
	if (strcmp(cmd, "/logoutpl", true) ==0 )
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /logoutpl [playerid/PartOfName]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			OnUpdatePlayer(giveplayerid);
			gPlayerLogged[giveplayerid] = 0;
			SendClientMessage(playerid, COLOR_GRAD1, "   player was logged out.");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
//-------------------------------[Logoutall]--------------------------------------------------------------------------
	if (strcmp(cmd, "/logoutall", true) ==0 )
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					OnUpdatePlayer(i);
					gPlayerLogged[i] = 0;
				}
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   All Players Logged out.");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
//--------------------------------------------------------------------------------------
//----------------------------------[cnn]-----------------------------------------------
	if(strcmp(cmd, "/cnn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cnn [cnn textformat ~n~=Newline ~r~=Red ~g~=Green ~b~=Blue ~w~=White ~y~=Yellow]");
				return 1;
			}
			format(string, sizeof(string), "~b~%s: ~w~%s",sendername,result);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					GameTextForPlayer(i, string, 5000, 6);
				}
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
	if(strcmp(cmd, "/cnnn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			tmp = strtok(cmdtext, idx);
			new txtid;
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cnnn <type> ");
				return 1;
			}
			txtid = strval(tmp);
			if(txtid == 2)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "You can not select 2");
				return 1;
			}
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cnnn <type> [cnnc textformat ~n~=Newline ~r~=Red ~g~=Green ~b~=Blue ~w~=White ~y~=Yellow]");
				return 1;
			}
			format(string, sizeof(string), "~w~%s",result);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					GameTextForPlayer(i, string, 5000, txtid);
				}
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
//[ADMIN]______________________________________________________________________________
//-----------------------------------[JAIL]-------------------------------------------------------------------------
	if(strcmp(cmd, "/ajail", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ajail [playerid/PartOfName] [seconds]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
			//printf("stringnameid %d",giveplayerid);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ajail [playerid/PartOfName] [seconds]");
			return 1;
		}
		new time = strval(tmp);

		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
			{
				SetPlayerInterior(giveplayerid,6);
				PlayerInfo[giveplayerid][pInt] = 6;
                SetPlayerPos(giveplayerid,264.395200,77.564040,1001.039000);
				format(string, sizeof(string), "   You have sent %s(player: %d) to jail.", giveplayer,giveplayerid);
				//printf("AdmCmd: %s has jailed %s.", sendername, giveplayer);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				SendClientMessage(giveplayerid, COLOR_GRAD1,"   You have been jailed for misconduct.");
				PlayJailSound(1153 , 1154, 2000,264.395200, 77.564040, 1001.039000);
				JailTime[giveplayerid] = time+10;
				//TogglePlayerControllable(giveplayerid, 0);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/jail", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /jail");
			return 1;
		}
		giveplayerid = strval(tmp);
		if(JailTime[giveplayerid] > 0 || gTeam[giveplayerid] != 4)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   That person can't be jailed right now.");
			printf("JailTime[giveplayerid](%d) gTeam[giveplayerid](%d)",JailTime[giveplayerid],gTeam[giveplayerid]);
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if (gTeam[playerid] == TEAM_BLUE)
			{
				if (TestDistance(playerid,giveplayerid,264.395200,77.564040,1001.039000,7))
				{
					//print("DEBUG Distancetested");
					new slice = ((PlayerInfo[giveplayerid][pLevel]*deathcost)+(1000)); //1k +your level
					SetPlayerPos(giveplayerid,264.395200,77.564040,1001.039000);
					GivePlayerMoney(playerid, slice);
					GivePlayerMoney(giveplayerid, -slice);
					PlayJailSound(1165 , 1166, 2000,264.395200, 77.564040, 1001.039000);
					format(string, sizeof(string), "~r~Suspect ~w~Detained~n~You Get ~g~$%d", slice);
					GameTextForPlayer(playerid, string, 5000, 1);
					format(string, sizeof(string), "~r~JAIL~n~~w~You Are fined ~n~~r~$%d", -slice);
					GameTextForPlayer(giveplayerid, string, 5000, 1);
					PlayerPlayMusic(playerid);
					JailTime[giveplayerid] = jailtime;
					SetPlayerFree(giveplayerid,playerid,"Serving Prison Sentence",0,0);
					if(FlashTime[giveplayerid] == 0){FlashTime[giveplayerid] = 10;}
					//TogglePlayerControllable(giveplayerid, 0);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   one of you is to far away from a jail cell!");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
//----------------------------------[UNJAIL]-----------------------------------------------
	if(strcmp(cmd, "/unjail", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /unjail [playerid/PartOfName]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
			{
				SetPlayerInterior(giveplayerid,6);
				PlayerInfo[playerid][pInt] = 6;
                SetPlayerPos(giveplayerid,268.3,77.4,1001.0);
				format(string, sizeof(string), "   You have released %s(player: %d) from jail.", giveplayer,giveplayerid);
				//printf("AdmCmd: %s has jailed %s.", sendername, giveplayer);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				SetPlayerWeapons(playerid);
				SendClientMessage(giveplayerid, COLOR_GRAD1,"   You have paid your debt to society.");
				PlayJailSound(1165 , 1166, 2000,264.395200, 77.564040, 1001.039000);
				JailTime[giveplayerid] = 10;
				//TogglePlayerControllable(giveplayerid, 0);
				return 1;
			}
			/*
			else if (gTeam[playerid] == TEAM_BLUE)
			{
				if (TestDistance(playerid,giveplayerid,264.395200,77.564040,1001.039000,7))
				{
					SetPlayerPos(giveplayerid,268.3,77.4,1001.0);
					format(string, sizeof(string), "   You have released %s(player: %d) from jail.", giveplayer,giveplayerid);
					//printf("AdmCmd: %s has jailed %s.", sendername, giveplayer);
					SendClientMessage(playerid, COLOR_GRAD1, string);
					SetPlayerWeapons(playerid);
					SendClientMessage(giveplayerid, COLOR_GRAD1,"   You have paid your debt to society.");
					PlayJailSound(1165 , 1166, 1000,264.395200, 77.564040, 1001.039000);
					//TogglePlayerControllable(giveplayerid, 0);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   one of you is to far away from a jail cell!");
					return 1;
				}
			}
   */
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
//----------------------------------[TOD]-----------------------------------------------

	if(strcmp(cmd, "/tod", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /tod [timeofday] (0-23)");
			return 1;
		}
		new hour;
		hour = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
            SetWorldTime(hour);
			format(string, sizeof(string), "   Time set to %d Hours.", hour);
			BroadCast(COLOR_GRAD1, string);
		}
		/*
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
  */
		return 1;
	}
//-----------------------------------editstat---------------------------------------
/*	if(strcmp(cmd, "/setstat", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
			SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints |4 Model ");
			SendClientMessage(playerid, COLOR_GRAD3, "|5 BankAccount |6 PhoneNumber |7 ExpPoints ");
			SendClientMessage(playerid, COLOR_GRAD2, "|8 HouseKey |9 BizKey |10 CB |11 HW |12 SR |13 WA |14 PEN");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
			SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints");
			SendClientMessage(playerid, COLOR_GRAD3, "|4 Model |5 BankAccount |6 PhoneNumber");
			SendClientMessage(playerid, COLOR_GRAD2, "|7 ExpPoints |8 HouseKey |9 BizKey");
			return 1;
		}
		new stat;
		stat = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
			SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints");
			SendClientMessage(playerid, COLOR_GRAD3, "|4 Model |5 BankAccount |6 PhoneNumber");
			SendClientMessage(playerid, COLOR_GRAD2, "|7 ExpPoints |8 HouseKey |9 BizKey");
			return 1;
		}
		new amount;
		amount = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			switch (stat)
			{
				case 1:
				{
					PlayerInfo[giveplayerid][pLevel] = amount;
					format(string, sizeof(string), "   The Player Was Set To Level %d", amount);
				}
				case 2:
				{
					PlayerInfo[giveplayerid][pSHealth] = amount;
					format(string, sizeof(string), "   The Player Was Set To %d Spawnhealth ", amount);
				}
				case 3:
				{
					PlayerInfo[giveplayerid][gPupgrade] = amount;
					format(string, sizeof(string), "   The Player Was Set To %d Upgrade Points", amount);
				}
				case 4:
				{
					PlayerInfo[giveplayerid][pModel] = amount;
					format(string, sizeof(string), "   The Player Was Set To Model %d", amount);
				}
				case 5:
				{
					PlayerInfo[giveplayerid][pAccount] = amount;
					format(string, sizeof(string), "   The Player Account Was Set To $%d", amount);
				}
				case 6:
				{
					PlayerInfo[giveplayerid][pPnumber] = amount;
					format(string, sizeof(string), "   The Player Phone Number Was Set To %d", amount);
				}
				case 7:
				{
					PlayerInfo[giveplayerid][pExp] = amount;
					format(string, sizeof(string), "   The Player Exp Points Were Set To %d", amount);
				}
				case 8:
				{
					PlayerInfo[giveplayerid][pPhousekey] = amount;
					format(string, sizeof(string), "   The Player House Key Was Set To %d", amount);
				}
				case 9:
				{
					PlayerInfo[giveplayerid][pPbiskey] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 10:
				{
					PlayerInfo[giveplayerid][pCB] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 11:
				{
					PlayerInfo[giveplayerid][pHW] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 12:
				{
					PlayerInfo[giveplayerid][pSR] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 13:
				{
					PlayerInfo[giveplayerid][pWA] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 14:
				{
					PlayerInfo[giveplayerid][pPEN] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				default:
				{
					format(string, sizeof(string), "   Invalid Stat Code", amount);
				}

			}
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}*/
//----------------------------------[SETINT]-----------------------------------------------
	if(strcmp(cmd, "/setint", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /setint [interiorid]");
			return 1;
		}
		new intid;
		intid = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			SetPlayerInterior(playerid,intid);
			PlayerInfo[playerid][pInt] = intid;
			format(string, sizeof(string), "   interiorid %d.", intid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[SKYDIVE]------------------------------------------------
	if(strcmp(cmd, "/skydive", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			GetPlayerPos(playerid, rx, ry, rz);
			if (IsPlayerConnected(playerid))
			{
				GivePlayerWeapon(playerid, 46, 0);
				SetPlayerPos(playerid,rx, ry, rz+1500);
				SendClientMessage(playerid, COLOR_WHITE, "GO!! GO!! GO!!");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[FOURDIVE]------------------------------------------------
	if(strcmp(cmd, "/fourdive", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /fourdive [playerid1] [playerid2] [playerid3] [playerid4]");
			return 1;
		}
		new para1;
		new para2;
		new para3;
		new para4;
		para1 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		para2 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		para3 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		para4 = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			if (IsPlayerConnected(para1)){ GivePlayerWeapon(para1, 46, 0); SetPlayerPos(para1,1536.0, -1360.0, 1350.0);SetPlayerInterior(para1,0);PlayerInfo[para1][pInt] = 0;SendClientMessage(para1, COLOR_WHITE, "GO!! GO!! GO!!");}
			if ((IsPlayerConnected(para2)) && (para2>0)) { GivePlayerWeapon(para2, 46, 0); SetPlayerPos(para2,1536.0, -1345.0, 1350.0);SetPlayerInterior(para2,0);PlayerInfo[para2][pInt] = 0;SendClientMessage(para2, COLOR_RED, "GO!! GO!! GO!!");}
			if ((IsPlayerConnected(para3)) && (para3>0)) { GivePlayerWeapon(para3, 46, 0); SetPlayerPos(para3,1552.0, -1345.0, 1350.0);SetPlayerInterior(para3,0);PlayerInfo[para3][pInt] = 0;SendClientMessage(para3, COLOR_RED, "GO!! GO!! GO!!");}
			if ((IsPlayerConnected(para4)) && (para4>0)) { GivePlayerWeapon(para4, 46, 0); SetPlayerPos(para4,1552.0, -1360.0, 1350.0);SetPlayerInterior(para4,0);PlayerInfo[para4][pInt] = 0;SendClientMessage(para4, COLOR_RED, "GO!! GO!! GO!!");}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[MAKEADMIN]------------------------------------------------
	if(strcmp(cmd, "/makeadmin", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /makeadmin [playerid/PartOfName] [level(1-3)]");
			return 1;
		}
		new para1;
		new level;
		if(IsStringAName(tmp))
		{
			para1 = GetPlayerID(tmp);
		}
		else
		{
			para1 = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		level = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GetPlayerName(para1, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			PlayerInfo[para1][pAdmin] = level;
			printf("AdmCmd: %s has promoted %s to a level %d admin.", sendername, giveplayer, level);
			format(string, sizeof(string), "   You have been promoted to a level %d admin by %s", level, sendername);
			SendClientMessage(para1, COLOR_GRAD1, string);
			format(string, sizeof(string), "   You have promoted %s to a level %d admin.", giveplayer,level);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[MAKEADMIN]------------------------------------------------
	if(strcmp(cmd, "/makeraceman", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /makeraceman [playerid/PartOfName] [on 1 off 0)]");
			return 1;
		}
		new para1;
		new level;
		if(IsStringAName(tmp))
		{
			para1 = GetPlayerID(tmp);
		}
		else
		{
			para1 = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		level = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			GetPlayerName(para1, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			gRaceGuy[para1] = level;
			printf("AdmCmd: %s has promoted %s to Race Creator.", sendername, giveplayer, level);
			format(string, sizeof(string), "   You have been promoted to Race Creator by %s", sendername);
			SendClientMessage(para1, COLOR_GRAD1, string);
			SendClientMessage(para1, COLOR_WHITE, "HINT: You can now type /cmds to see your race editing commands.");
			format(string, sizeof(string), "   You have promoted %s to Race Creator.", giveplayer);
			SendClientMessage(playerid, COLOR_GRAD1, string);

		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[setteam]------------------------------------------------
	if(strcmp(cmd, "/setteam", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /setteam [playerid/PartOfName] [team 1(civ) - 2(cop)]");
			return 1;
		}
		new para1;
		new level;
		if(IsStringAName(tmp))
		{
			para1 = GetPlayerID(tmp);
		}
		else
		{
			para1 = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		level = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			GetPlayerName(para1, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			PlayerInfo[para1][pTeam] = level;
			//OnUpdatePlayer(para1);
			gTeam[para1] = level;
			SetPlayerWeapons(para1);
			SetPlayerRandomSpawn(para1);
			//gPlayerSpawned[para1] = 0;
			//OnPlayerSpawn(para1);
			ClearCrime(para1);
			if (gPublicEnemy == para1)
			{
				gPublicEnemy = INVALID_PLAYER_ID;
				KillTimer(offhook);
    
	    	}
			printf("AdmCmd: %s has switched %s to team %d.", sendername, giveplayer, level);
			format(string, sizeof(string), "   You have been switched to team %d by %s", level, sendername);
			SendClientMessage(para1, COLOR_GRAD1, string);
			format(string, sizeof(string), "   You have switched %s to team %d.", giveplayer,level);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/jointeam", true) == 0)
	{
        new sbiz;
		if (PlayerToPoint(3, playerid,SBizzInfo[11][sbEntrancex], SBizzInfo[11][sbEntrancey], SBizzInfo[11][sbEntrancez]))
		{
			sbiz = 11;
		}
		else if (PlayerToPoint(3, playerid,SBizzInfo[12][sbEntrancex], SBizzInfo[12][sbEntrancey], SBizzInfo[12][sbEntrancez]))
		{
			sbiz = 12;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "You are not close to a team store");
			return 1;
		}
		if(GetPlayerMoney(playerid) < SBizzInfo[sbiz][sbEntcost] || (SBizzInfo[sbiz][sbEntcost] > 20000 && PlayerInfo[playerid][pLevel] < 3))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "You cant afford this");
			return 1;
		}
		if(SBizzInfo[sbiz][sbLock] == 1)
		{
			GameTextForPlayer(playerid, "~r~Closed", 5000, 1);
			return 1;
		}
		if(SBizzInfo[sbiz][sbProd] == 0)
		{
			GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /jointeam [team 1(medic) - 2(cop)]");
			return 1;
		}
		new level = strval(tmp);
		if (level > 0 && level < 12)
		{
			if (gPublicEnemy == playerid)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "You cant change team now");
				return 1;
	    	}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			PlayerInfo[playerid][pTeam] = level;
			gTeam[playerid] = level;
			ClearCrime(playerid);
			SetPlayerToTeamColor(playerid);
			format(string, sizeof(string), "%s, You have been switched to team %d", sendername, level);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			GivePlayerMoney(playerid,-SBizzInfo[sbiz][sbEntcost]);
			SBizzInfo[sbiz][sbProd]--;
			SBizzInfo[sbiz][sbTakings] = SBizzInfo[sbiz][sbTakings]+SBizzInfo[sbiz][sbEntcost];
			new dood[MAX_PLAYER_NAME];
			GetPlayerName(playerid, dood, sizeof(dood));
			format(string, sizeof(string), "%s payed $%d to enter sbiz %d", dood, SBizzInfo[sbiz][sbEntcost], sbiz);
			printf("%s", string);
			PayLog(string);
			OnPropUpdate();
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "There is no team for that number");
		}
		return 1;
	}
//----------------------------------[GOTO]-----------------------------------------------
	if(strcmp(cmd, "/gotols", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1529.6,-1691.2,13.3);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1529.6,-1691.2,13.3);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/gotolv", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1699.2, 1435.1, 10.7);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1699.2,1435.1, 10.7);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/gotosf", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1417.0,-295.8,14.1);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1417.0,-295.8,14.1);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/entercar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /entercar [carid]");
			return 1;
		}
		new testcar = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			PutPlayerInVehicle(playerid, testcar, 1);
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/gotocar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /gotocar [carid]");
			return 1;
		}
		new testcar = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			new Float:cwx2,Float:cwy2,Float:cwz2;
			GetVehiclePos(testcar, cwx2, cwy2, cwz2);
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, cwx2, cwy2, cwz2);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, cwx2, cwy2, cwz2);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			SetPlayerInterior(playerid,0);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/mark", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			GetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
			SendClientMessage(playerid, COLOR_GRAD1, "   teleporter destination set");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/gotomark", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			SetPlayerInterior(playerid,0);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/gotoin", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1416.107000,0.268620,1000.926000);
			}
			else
			{
				SetPlayerPos(playerid, 1416.107000,0.268620,1000.926000);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			SetPlayerInterior(playerid,1);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/gotostad", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1435.75, -652.664, 1054.94);
			}
			else
			{
				SetPlayerPos(playerid, -1435.75, -652.664, 1054.94);
			}
			SetPlayerInterior(playerid,4);
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/gotojet", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1.71875, 30.4062, 1200.34);
			}
			else
			{
				SetPlayerPos(playerid, 1.71875, 30.4062, 1200.34);
			}
			SetPlayerInterior(playerid,1);
			SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	return 1;
	}
	if(strcmp(cmd, "/goto", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /goto [playerid/PartOfName]");
			return 1;
		}
			new Float:plocx,Float:plocy,Float:plocz;
			new plo;
		if(IsStringAName(tmp))
		{
			plo = GetPlayerID(tmp);
		}
		else
		{
			plo = strval(tmp);
		}
			if (IsPlayerConnected(plo))
			{
				if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
				{
					if(Spectate[playerid] != 255)
					{
						Spectate[playerid] = 256;
					}
					GetPlayerPos(plo, plocx, plocy, plocz);
					if(PlayerInfo[plo][pInt] > 0)
					{
						SetPlayerInterior(playerid,PlayerInfo[plo][pInt]);
						PlayerInfo[playerid][pInt] = PlayerInfo[plo][pInt];
						PlayerInfo[playerid][pLocal] = PlayerInfo[plo][pLocal];
					}
					if(PlayerInfo[playerid][pInt] == 0)
					{
						SetPlayerInterior(playerid,0);
					}
					if(plocz > 530.0 && PlayerInfo[plo][pInt] == 0) //the highest land point in sa = 526.8
					{
						SetPlayerInterior(playerid,1);
						PlayerInfo[playerid][pInt] = 1;
					}
					if (GetPlayerState(playerid) == 2)
					{
						new tmpcar = GetPlayerVehicleID(playerid);
						SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
						TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
					}
					else
					{
						SetPlayerPos(playerid,plocx,plocy+2, plocz);
					}
					SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		return 1;
	}
	if(strcmp(cmd, "/gotop", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /gotop [posid]");
			return 1;
		}
			new tmppo;
			tmppo = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar,Teletmp[tmppo][pTmpposx], Teletmp[tmppo][pTmpposy], Teletmp[tmppo][pTmpposz]);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid,Teletmp[tmppo][pTmpposx], Teletmp[tmppo][pTmpposy], Teletmp[tmppo][pTmpposz]);
			}
			PlayerInfo[playerid][pInt] = Teletmp[tmppo][pTmpint];
			SetPlayerInterior(playerid,Teletmp[tmppo][pTmpint]);
			format(string, sizeof(string), "TmpPos Location: %d",tmppo);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[GETHERE]-----------------------------------------------
	if(strcmp(cmd, "/gethere", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /gethere [playerid/PartOfName]");
			return 1;
		}
			new Float:plocx,Float:plocy,Float:plocz;
			new plo;
			if(IsStringAName(tmp))
			{
				plo = GetPlayerID(tmp);
			}
			else
			{
				plo = strval(tmp);
			}
			if (IsPlayerConnected(plo))
			{
				if ((IsPlayerAdmin(plo)) || PlayerInfo[plo][pAdmin] > 1337)
				{
					SendClientMessage(playerid, COLOR_GRAD1, "Ask the admin to goto you.");
					return 1;
				}
				if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
				{
					GetPlayerPos(playerid, plocx, plocy, plocz);
					if(PlayerInfo[playerid][pInt] > 0)
					{
						SetPlayerInterior(plo,PlayerInfo[playerid][pInt]);
						PlayerInfo[plo][pInt] = PlayerInfo[playerid][pInt];
						PlayerInfo[plo][pLocal] = PlayerInfo[playerid][pLocal];
					}
					if(PlayerInfo[playerid][pInt] == 0)
					{
						SetPlayerInterior(plo,0);
					}
					if(plocz > 930.0 && PlayerInfo[playerid][pInt] == 0) //the highest land point in sa = 526.8
					{
						SetPlayerInterior(plo,1);
						PlayerInfo[plo][pInt] = 1;
					}
					if (GetPlayerState(plo) == 2)
					{
						TelePos[plo][0] = 0.0;
						TelePos[plo][1] = 0.0;
						new tmpcar = GetPlayerVehicleID(plo);
						SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
					}
					else
					{
						SetPlayerPos(plo,plocx,plocy+2, plocz);
					}
					SendClientMessage(plo, COLOR_GRAD1, "   You have been teleported");
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		return 1;
	}
	if(strcmp(cmd, "/getcar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /gethere [carid]");
			return 1;
		}
		new Float:plocx,Float:plocy,Float:plocz;
		new plo;
		plo = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GetPlayerPos(playerid, plocx, plocy, plocz);
			SetVehiclePos(plo,plocx,plocy+4, plocz);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[GiveGun]------------------------------------------------
	if(strcmp(cmd, "/givegun", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /givegun [playerid/PartOfName] [weaponid(eg. 46 = Parachute)] [ammo]");
			//SendClientMessage(playerid, COLOR_RED, "Warning: Invalid WeaponID's will crash the server");
			return 1;
		}
		new playa;
		new gun;
		new ammo;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		gun = strval(tmp);
		tmp = strtok(cmdtext, idx);
		ammo = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GivePlayerWeapon(playa, gun, ammo);
			printf("AdmCmd: %s gave %s Weapon %d",sendername,  giveplayer, gun);

		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[GiveHealth]------------------------------------------------
	if(strcmp(cmd, "/givehealth", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /givehealth [playerid/PartOfName] [health]");
			return 1;
		}
		new playa;
		new health;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		health = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SetPlayerHealth(playa, health);
			printf("AdmCmd: %s gave %s %d Health",sendername,  giveplayer, health);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[GiveHealth]------------------------------------------------
	if(strcmp(cmd, "/checkup", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /givehealth [playerid/PartOfName] [health]");
			return 1;
		}
		new playa;
		new Float:oldhealth;
		new Float:newhealth;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		GetPlayerHealth(playerid, oldhealth);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SetPlayerHealth(playa, 10.0);
			GetPlayerHealth(playa, newhealth);
			if(newhealth != 10.0)
			{
				printf("AdmCmd: cheatfound");
			}
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//native GetPlayerHealth(playerid, &Float:health);
//native SetPlayerHealth(playerid, Float:health);
//----------------------------------[GiveMoney]------------------------------------------------
/*	if(strcmp(cmd, "/givemoney", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /givemoney [playerid/PartOfName] [money]");
			return 1;
		}
		new playa;
		new money;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		money = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			ResetPlayerMoney(playa);
			GivePlayerMoney(playa, money);
			printf("AdmCmd: %s set %s to $%d",sendername,  giveplayer, money);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}*/
//-----------------------------------[Slap]-----------------------------------------------
	if(strcmp(cmd, "/slap", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /slap [playerid/PartOfName]");
			return 1;
		}
		new playa;
		new Float:shealth;
		new Float:slx, Float:sly, Float:slz;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >=1)
		{
			GetPlayerHealth(playa, shealth);
			SetPlayerHealth(playa, shealth-5);
			GetPlayerPos(playa, slx, sly, slz);
			SetPlayerPos(playa, slx, sly, slz+5);
			PlaySoundAll(playa, 1130, slx, sly, slz+5);
			printf("AdmCmd: %s slapped %s",sendername,  giveplayer);
			format(string, sizeof(string), "AdmCmd: %s was slapped by %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/mute", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /slap [playerid/PartOfName]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			if(Mute[playa] == 0)
			{
				Mute[playa] = 1;
				printf("AdmCmd: %s silenced %s",sendername,  giveplayer);
				format(string, sizeof(string), "AdmCmd: %s was silenced by %s",giveplayer ,sendername);
				SendClientMessageToAll(COLOR_RED, string);
			}
			else
			{
				Mute[playa] = 0;
				printf("AdmCmd: %s unsilenced %s",sendername,  giveplayer);
				format(string, sizeof(string), "AdmCmd: %s was unsilenced by %s",giveplayer ,sendername);
				SendClientMessageToAll(COLOR_RED, string);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[Slap]------------------------------------------------
	if(strcmp(cmd, "/sslap", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sslap [playerid/PartOfName]");
			return 1;
		}
		new playa;
		new Float:shealth;
		new Float:slx, Float:sly, Float:slz;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GetPlayerHealth(playa, shealth);
			SetPlayerHealth(playa, shealth-5);
			GetPlayerPos(playa, slx, sly, slz);
			SetPlayerPos(playa, slx, sly, slz+5);
			PlaySoundAll(playa, 1130, slx, sly, slz+5);
			
			format(string, sizeof(string), "AdmCmd: %s Silent Slaps %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was Silently Slap",giveplayer);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/mute", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /slap [playerid/PartOfName]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			if(Mute[playa] == 0)
			{
				Mute[playa] = 1;
				printf("AdmCmd: %s silenced %s",sendername,  giveplayer);
				format(string, sizeof(string), "AdmCmd: %s was silenced by %s",giveplayer ,sendername);
				SendClientMessageToAll(COLOR_RED, string);
			}
			else
			{
				Mute[playa] = 0;
				printf("AdmCmd: %s unsilenced %s",sendername,  giveplayer);
				format(string, sizeof(string), "AdmCmd: %s was unsilenced by %s",giveplayer ,sendername);
				SendClientMessageToAll(COLOR_RED, string);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[Slap]------------------------------------------------
	if(strcmp(cmd, "/ss", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ss [playerid/PartOfName]");
			return 1;
		}
		new playa;
		new Float:shealth;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			GetPlayerHealth(playa, shealth);
			format(string, sizeof(string), "AdmCmd: %s has %.2f health",giveplayer ,shealth);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			printf(string);
			SetPlayerHealth(playa, shealth-40);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[Slap]------------------------------------------------
	if(strcmp(cmd, "/sc", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sc [playerid/PartOfName]");
			return 1;
		}
		new playa;
		new Float:shealth;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			GetPlayerHealth(playa, shealth);
			format(string, sizeof(string), "AdmCmd: %s has %f health",giveplayer ,shealth);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			printf(string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[Kick]------------------------------------------------
	if(strcmp(cmd, "/kick", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /kick [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			Kick(playa);
			format(string, sizeof(string), "AdmCmd: %s Kicked %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was kicked by %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[Freeze]------------------------------------------------
	if(strcmp(cmd, "/freeze", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /freeze [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		if(PlayerInfo[playa][pAdmin] > 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "Admins can not be frozen");
			return 1;
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			TogglePlayerControllable(playa, 0);
			format(string, sizeof(string), "AdmCmd: %s Freezes %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was Frozen by %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}

//----------------------------------[Freeze]------------------------------------------------
	if(strcmp(cmd, "/sf", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sf [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			TogglePlayerControllable(playa, 0);
			format(string, sizeof(string), "AdmCmd: %s SFreezes %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was SFrozen",giveplayer);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[Thaw]------------------------------------------------
	if(strcmp(cmd, "/thaw", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /thaw [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			TogglePlayerControllable(playa, 1);
			format(string, sizeof(string), "AdmCmd: %s Thaw %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was Thawed by %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[Ban]------------------------------------------------
	if(strcmp(cmd, "/ban", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ban [playerid]");
			return 1;
		}
		new playa = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1338)
		{
			format(string, sizeof(string), "AdmCmd: %s Banned %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was Owned by %s",giveplayer ,sendername);
			PlayerInfo[playa][pAdmin] = PlayerInfo[playa][pLevel];
			PlayerInfo[playa][pLevel] = -999;
			SendClientMessageToAll(COLOR_RED, string);
			Ban(playa);
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			format(string, sizeof(string), "AdmCmd: %s Banned %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was banned by %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
			PlayerInfo[playa][pAdmin] = PlayerInfo[playa][pLevel];
			PlayerInfo[playa][pLevel] = -999;
			Ban(playa);
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			if(PlayerInfo[playa][pLevel] > 2)
			{
				format(string, sizeof(string), "AdmNote: %s is level %d",playa,  PlayerInfo[playa][pLevel]);
				SendClientMessage(playerid,COLOR_RED, string);
				return 1;
			}
			format(string, sizeof(string), "AdmCmd: %s Banned %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was banned by %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
			PlayerInfo[playa][pAdmin] = PlayerInfo[playa][pLevel];
			PlayerInfo[playa][pLevel] = -999;
			Ban(playa);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[Ban]------------------------------------------------
	if(strcmp(cmd, "/sban", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sban [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			PlayerInfo[playa][pAdmin] = PlayerInfo[playa][pLevel];
			PlayerInfo[playa][pLevel] = -999;
			Ban(playa);
			format(string, sizeof(string), "AdmCmd: %s Silently Banned %s",sendername,  giveplayer);
			printf("%s",string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}

	/*
//----------------------------------[Mod]------------------------------------------------
	if(strcmp(cmd, "/mod", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /mod [carmodid] 1034~1041");
			return 1;
		}
		new playa;
		playa = strval(tmp);
		new modcar = GetPlayerVehicleID(playerid);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			AddVehicleComponent(modcar, playa);
			if (gdebug){printf("DEBUG modcar = %d mod = %d", modcar, playa);}
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
 */
//----------------------------------[EndRound]-----------------------------------------------

	if(strcmp(cmd, "/endround", true) == 0)
	{
  if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			GameModeInitExitFunc();
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[EndRound]-----------------------------------------------

//----------------------------------[GMX]-----------------------------------------------

	if(strcmp(cmd, "/gmx", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GameModeExit();
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[mission & premission]-----------------------------------------------
/*
	if(strcmp(cmd, "/mission", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			SetPlayerNewMission();
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
*/
	if(strcmp(cmd, "/premission", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1338)
		{
		  PrePlayerNewMission();
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//----------------------------------[missionstop]-----------------------------------------------
/*	if(strcmp(cmd, "/missionstop", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			MissionActive = 0;
			CheckpointReset();
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					SetVehicleParamsForPlayer(stealcar,i,0,0);
				}
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   missions stopped type /mission to restart");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}*/
///<----------------------------[customrace]-------------------
	if (strcmp(cmd, "/sp", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sp [1(resets)/2/3/4]");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new idx2 = strval(tmp);
			if(idx2 == 1)
			{
				new idx3 = 1;
				while (idx3 < sizeof(gRandomDMSpawns))
				{
					GetPlayerPos(playerid, gRandomDMSpawns[idx3][0], gRandomDMSpawns[idx3][1], gRandomDMSpawns[idx3][2]);
					idx3++;
				}
				gDMWbounds[0] = 50000000.0;gDMWbounds[1] = -50000000.0;gDMWbounds[2] = 50000000.0;gDMWbounds[3] = -50000000.0;
			}
			GetPlayerPos(playerid, gRandomDMSpawns[idx2][0], gRandomDMSpawns[idx2][1], gRandomDMSpawns[idx2][2]);
			format(string, sizeof(string), "DM Spawnpoint %d Set!",idx2);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			SetPlayerCheckpoint(playerid,gRandomDMSpawns[idx2][0], gRandomDMSpawns[idx2][1], gRandomDMSpawns[idx2][2],4);
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
			return 1;
		}
		else
		{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/cam", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cam [1/2/3/4]");
			return 1;
		}
		Unspec[playerid][sCam] = strval(tmp);
		format(string, sizeof(string), "Switching to cam %d",Unspec[playerid][sCam]);
		SendClientMessage(playerid, COLOR_GRAD1, string);
		return 1;
	}
	if (strcmp(cmd, "/dmn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new Float:tmp1,Float:tmp2;
			GetPlayerPos(playerid, tmp1,gDMWbounds[2], tmp2);
			format(string, sizeof(string), "DM Northpoint Set!");
			SendClientMessage(playerid, COLOR_GRAD1, string);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			SetPlayerCheckpoint(playerid,tmp1,gDMWbounds[2], tmp2,4.0);
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
			return 1;
		}
		else
		{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/dms", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new Float:tmp1,Float:tmp2;
			GetPlayerPos(playerid, tmp1,gDMWbounds[3], tmp2);
			format(string, sizeof(string), "DM Southpoint Set!");
			SendClientMessage(playerid, COLOR_GRAD1, string);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			SetPlayerCheckpoint(playerid,tmp1,gDMWbounds[3], tmp2,4.0);
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
			return 1;
		}
		else
		{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/dme", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new Float:tmp1,Float:tmp2;
			GetPlayerPos(playerid, gDMWbounds[0],tmp1, tmp2);
			format(string, sizeof(string), "DM Eastpoint Set!");
			SendClientMessage(playerid, COLOR_GRAD1, string);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			SetPlayerCheckpoint(playerid,gDMWbounds[0],tmp1, tmp2,4.0);
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
			return 1;
		}
		else
		{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/dmw", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new Float:tmp1,Float:tmp2;
			GetPlayerPos(playerid, gDMWbounds[1],tmp1, tmp2);
			format(string, sizeof(string), "DM Westpoint Set!");
			SendClientMessage(playerid, COLOR_GRAD1, string);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			SetPlayerCheckpoint(playerid,gDMWbounds[1],tmp1, tmp2,4.0);
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
			return 1;
		}
		else
		{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/savedm", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /savedm [dmname]");
				return 1;
			}
			SaveDM(playerid,tmp);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/loaddm", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /loaddm [dmname]");
				return 1;
			}
			LoadDM(playerid,tmp);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/stopdm", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			gFighters=0;
			gFightLeader=0;
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(gPlayerFighter[i] == 1)
					{
						gPlayerFighter[i] = 0;
						TogglePlayerControllable(i, 1);
						SetPlayerRandomSpawn(i);
						//SetPlayerWorldBounds(i,500000.0,-500000.0,500000.0,-500000.0);
					}
				}
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/laps", true) == 0)
	{
		if(MissionActive > 5 && MissionActive < 8)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "You cannot edit during a race");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /laps <amount>");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new cpid = strval(tmp);
			RaceInfo[rLaps]	= cpid;
			SendClientMessage(playerid, COLOR_GRAD2, "Laps Set");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/cp", true) == 0)
	{
		if(MissionActive > 5 && MissionActive < 8)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "You cannot edit during a race");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cp [1/2/3/4]");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new cpid = strval(tmp);
			if(cpid == 1)
			{
				GetPlayerPos(playerid, RaceInfo[rStartx], RaceInfo[rStarty], RaceInfo[rStartz]);
				SendClientMessage(playerid, COLOR_GRAD1, "Race Waypoint 1 Set!");
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				SetPlayerRaceCheckpoint(playerid,0,RaceInfo[rStartx], RaceInfo[rStarty], RaceInfo[rStartz],RaceInfo[rStartx], RaceInfo[rStarty], RaceInfo[rStartz], 8);
				PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
				return 1;
			}
			else if(cpid == 2)
			{
				GetPlayerPos(playerid, RaceInfo[rMidx], RaceInfo[rMidy], RaceInfo[rMidz]);
				SendClientMessage(playerid, COLOR_GRAD1, "Race Waypoint 2 Set!");
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				SetPlayerRaceCheckpoint(playerid,0,RaceInfo[rMidx], RaceInfo[rMidy], RaceInfo[rMidz],RaceInfo[rMidx], RaceInfo[rMidy], RaceInfo[rMidz], 8);
				PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
				return 1;
			}
			else if(cpid == 3)
			{
				GetPlayerPos(playerid,RaceInfo[rMid2x], RaceInfo[rMid2y], RaceInfo[rMid2z]);
				SendClientMessage(playerid, COLOR_GRAD1, "Race Waypoint 3 Set!");
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				SetPlayerRaceCheckpoint(playerid,0,RaceInfo[rMid2x], RaceInfo[rMid2y], RaceInfo[rMid2z],RaceInfo[rMid2x], RaceInfo[rMid2y], RaceInfo[rMid2z], 8);
				PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
				return 1;
			}
			else
			{
				GetPlayerPos(playerid,RaceInfo[rEndx], RaceInfo[rEndy], RaceInfo[rEndz]);
				SendClientMessage(playerid, COLOR_GRAD1, "Race Waypoint 4 Set!");
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				SetPlayerRaceCheckpoint(playerid,0,RaceInfo[rEndx], RaceInfo[rEndy], RaceInfo[rEndz],RaceInfo[rEndx], RaceInfo[rEndy], RaceInfo[rEndz], 8);
				PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
				rsx = RaceInfo[rStartx];rsy = RaceInfo[rStarty];rsz =RaceInfo[rStartz];
				rmx = RaceInfo[rMidx];rmy = RaceInfo[rMidy];rmz = RaceInfo[rMidz];
				rm2x = RaceInfo[rMid2x];rm2y = RaceInfo[rMid2y];rm2z = RaceInfo[rMid2z];
				rex = RaceInfo[rEndx];rey = RaceInfo[rEndy];rez = RaceInfo[rEndz];
				randomrace = 0;
			//	return 1;
			}
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/startrace", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
			CheckpointReset();
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					SetVehicleParamsForPlayer(stealcar,playerid,0,0);
					LapCount[i] = 0;
					StartTime[i] = 0;
				}
			}
			MissionActive = 5;
			if (gdebug){print("DEBUG MissionActive = 5");}
			gRaceFin = 0;
			gRaceMid = 0;
			gRaceMid2 = 0;
			gRaceEnd = 0;
			gLaps = 0;
			KillTimer(raceendtimer);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					if (gTeam[i] >= 3)
					{
						JobGive(i);
					}
				}
			}
			SendClientMessage(playerid, COLOR_GRAD1, "Race Started");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/randomrace", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			if(randomrace == 1)
			{
				randomrace = 0;
				SendClientMessage(playerid, COLOR_GRAD2, "Random races disabled");
				rsx = RaceInfo[rStartx];rsy = RaceInfo[rStarty];rsz =RaceInfo[rStartz];
				rmx = RaceInfo[rMidx];rmy = RaceInfo[rMidy];rmz = RaceInfo[rMidz];
				rm2x = RaceInfo[rMid2x];rm2y = RaceInfo[rMid2y];rm2z = RaceInfo[rMid2z];
				rex = RaceInfo[rEndx];rey = RaceInfo[rEndy];rez = RaceInfo[rEndz];
			}
			else if(randomrace == 0)
			{
				randomrace = 1;
				SendClientMessage(playerid, COLOR_GRAD2, "Random races enabled");
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
	if(strcmp(cmd, "/setrace", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new racename[64];
			new name[64];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setrace [racename] [position-1-2-3-4]");
				format(string, sizeof(string), "Race List (1. %s) (2. %s) (3. %s) (4. %s) ",Races[0],Races[1],Races[2],Races[3]);
				SendClientMessage(playerid, COLOR_GREEN,string);
				format(string, sizeof(string), "Race List (5. %s) (6. %s) (7. %s) (8. %s) ",Races[4],Races[5],Races[6],Races[7]);
				SendClientMessage(playerid, COLOR_GREEN,string);
				return 1;
			}
			strmid(name, tmp, 0, strlen(tmp), 255);
			format(racename, sizeof(racename), "Race/%s.race",name);
			new File: file = fopen(racename, io_read);
			if (!file)
			{
				SendClientMessage(playerid, COLOR_GREEN,"File not found");
				return 1;
			}
			fclose(file);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setrace [racename] [position-1-2-3-4]");
				return 1;
			}
			new raceid = strval(tmp)-1;
			racelist = strval(tmp);
			strmid(Races[raceid], name, 0, strlen(name), 255);
			format(string, sizeof(string), "New List (1. %s) (2. %s) (3. %s) (4. %s) ",Races[0],Races[1],Races[2],Races[3]);
			SendClientMessage(playerid, COLOR_GREEN,string);
			format(string, sizeof(string), "New List (5. %s) (6. %s) (7. %s) (8. %s) ",Races[4],Races[5],Races[6],Races[7]);
			SendClientMessage(playerid, COLOR_GREEN,string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
	if(strcmp(cmd, "/racelist", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			if(racelist == 0)
			{
				racelist = 1;
				SendClientMessage(playerid, COLOR_GRAD2, "Race List Enabled");
				format(string, sizeof(string), "Race List (1. %s) (2. %s) (3. %s) (4. %s) ",Races[0],Races[1],Races[2],Races[3]);
				SendClientMessage(playerid, COLOR_GREEN,string);
				format(string, sizeof(string), "New List (5. %s) (6. %s) (7. %s) (8. %s) ",Races[4],Races[5],Races[6],Races[7]);
				SendClientMessage(playerid, COLOR_GREEN,string);
			}
			else if(racelist != 0)
			{
				racelist = 0;
				SendClientMessage(playerid, COLOR_GRAD2, "Race List Disabled");
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
	if(strcmp(cmd, "/footmode", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			if(nocarcash == 1)
			{
				nocarcash = 0;
				SendClientMessage(playerid, COLOR_GRAD2, "Cashbox car mode");
			}
			else if(nocarcash == 0)
			{
				nocarcash = 1;
				SendClientMessage(playerid, COLOR_GRAD2, "Cashbox foot mode");
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
	}
	if (strcmp(cmd, "/racedelay", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /racedelay [seconds]");
			format(string, 256, "Race Delay is set to %d seconds", racedelay/1000);
			SendClientMessage(playerid, COLOR_GRAD2, string);
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			new weaponid = strval(tmp);
			if(weaponid > 240 || weaponid < 10)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "Minimum is 10 Maximum is 240");
				return 1;
			}
			racedelay = weaponid*1000;
			format(string, 256, "Race Delay set to %d seconds", weaponid);
			SendClientMessage(playerid, COLOR_GRAD2, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/saverace", true)==0)
	{
		if(MissionActive > 5 && MissionActive < 8)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "You cannot edit during a race");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /saverace [racename]");
				return 1;
			}
			SaveRace(playerid,tmp);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/loadrace", true)==0)
	{
		if(MissionActive > 5 && MissionActive < 8)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "You cannot edit during a race");
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pAdmin] == -1 || gRaceGuy[playerid])
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /loadrace [racename](disables racelist)");
				return 1;
			}
			LoadRace(playerid,tmp);
			racelist = 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/unban", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /unban [playername]");
				return 1;
			}
			if(!LoadPlayer(playerid,tmp))
			{
				return 1;
			}
			if(PLlayerInfo[playerid][plAdmin] == 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "that player is not banned!");
				return 1;
			}
			else
			{
				PLlayerInfo[playerid][plLevel] = PLlayerInfo[playerid][plAdmin];
				PLlayerInfo[playerid][plAdmin] = 0;
				SavePlayer(playerid,tmp);
				SendClientMessage(playerid, COLOR_GRAD1, "Player Un banned");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/loadpl", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /loadplayer [playername]");
				return 1;
			}
			LoadPlayer(playerid,tmp);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if (strcmp(cmd, "/savepl", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /saveplayer [playername]");
				return 1;
			}
			SavePlayer(playerid,tmp);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
//<-----------------------------[SpawnWeapon]-----------------------------------------------------------------------
	if (strcmp(cmd, "/drop", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /drop [weaponid]");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			new weaponid = strval(tmp);
			new Float:px, Float:py, Float:pz;
			GetPlayerPos(playerid, px, py, pz);
			new coordsstring[256];
			format(coordsstring, 256, "AddStaticPickup(%d, 2, %.1f,%.1f,%.1f);\n", weaponid, px, py, pz);
			printf("AdmCmd:%d was spawned", weaponid);
			AddStaticPickup(weaponid, 15, px, py, pz);
			pickups++;
			new File:hFile;
			hFile = fopen("Gamemode/coords.txt", io_append);
			fwrite(hFile, coordsstring);
			fclose(hFile);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}
	if(strcmp(cmd, "/pos", true) == 0)
	{
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_YELLOW, "USAGE: /pos [comment]");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			new Float:px, Float:py, Float:pz;
			GetPlayerPos(playerid, px, py, pz);
			new coordsstring[256];
			format(coordsstring, 256, "%.1f,%.1f,%.1f // %s\n", px, py, pz,result);
			new File:hFile;
			hFile = fopen("Gamemode/pos.txt", io_append);
			fwrite(hFile, coordsstring);
			fclose(hFile);

		}
		return 1;
	}
	if(strcmp(cmd, "/addcop", true) == 0)
	{
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_YELLOW, "USAGE: /addcop [copname]");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pAdmin] == -2)
		{
			new Float:px, Float:py, Float:pz;
			GetPlayerPos(playerid, px, py, pz);
			new coordsstring[256];
			format(coordsstring, 256, "%s\n",result);
			new File:hFile;
			hFile = fopen("Gamemode/cops.cfg", io_append);
			fwrite(hFile, coordsstring);
			fclose(hFile);
			SendClientMessage(playerid, COLOR_GRAD1, "   The Player was added to the cop list");
		}
		return 1;
	}
	if(strcmp(cmd, "/addmed", true) == 0)
	{
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_YELLOW, "USAGE: /addmed [copname]");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pAdmin] == -3)
		{
			new Float:px, Float:py, Float:pz;
			GetPlayerPos(playerid, px, py, pz);
			new coordsstring[256];
			format(coordsstring, 256, "%s\n",result);
			new File:hFile;
			hFile = fopen("Gamemode/meds.cfg", io_append);
			fwrite(hFile, coordsstring);
			fclose(hFile);
			SendClientMessage(playerid, COLOR_GRAD1, "   The Player was added to the paramedic list");
		}
		return 1;
	}
//<-----------------------------[SpawnVehicle]-----------------------------------------------------------------------
/*	if (strcmp(cmd, "/vec", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /vec [vehicleid]");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			new weaponid = strval(tmp);
			new Float:px, Float:py, Float:pz, Float:pa;
			GetPlayerFacingAngle(playerid,pa);
			GetPlayerPos(playerid, px, py, pz);
			new coordsstring[256];
			format(coordsstring, 256, "CreateVehicle(%d, %.1f,%.1f,%.1f,%.1f,-1,-1,-1);\n", weaponid, px, py, pz ,pa);
			printf("AdmCmd:vech: %d was spawned", weaponid);
			CreateVehicle(weaponid, px, py, pz, pa,-1,-1,-1);
			new File:hFile;
			hFile = fopen("coords.txt", io_append);
			fwrite(hFile, coordsstring);
			fclose(hFile);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}
		return 1;
	}*/
//<-----------------------------[PlaySound]-----------------------------------------------------------------------
	if (strcmp(cmd, "/ps", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ps [soundid] eg. (1052 - 1058)(1020 - 1022), 1035");
			return 1;
		}
		new weaponid = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++) { if(IsPlayerConnected(i) == 1) { PlayerPlaySound(i, weaponid, 0.0, 0.0, 0.0); } }
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}

		return 1;
	}
//<-----------------------------[Admins]-----------------------------------------------------------------------
/*	if (strcmp(cmd, "/admins", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GRAD1, "Admins Online:");
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1 && PlayerInfo[i][pAdmin] >= 1 && PlayerInfo[i][pAdmin] < 1338)
			{
				GetPlayerName(i, sendername, sizeof(sendername));
				format(string, 256, "Admin: %s", sendername);
				SendClientMessage(playerid, COLOR_GRAD2, string);
			}
		}
		return 1;
	}*/
//<-----------------------------[cashbox]-----------------------------------------------------------------------
	if (strcmp(cmd, "/cashbox", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cashbox [0-1] This mission on 1 off 0");
			format(string, sizeof(string), "cb:%d sr:%d hw:%d dm:%d", cashbox,streetrace,hotwire,deathmatch);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			return 1;
		}
		new weaponid = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			cashbox=weaponid;
			format(string, sizeof(string), "cb:%d sr:%d hw:%d dm:%d", cashbox,streetrace,hotwire,deathmatch);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}

		return 1;
	}
//<-----------------------------[streetrace]-----------------------------------------------------------------------
	if (strcmp(cmd, "/streetrace", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /streetrace [0-1] This mission on 1 off 0");
			format(string, sizeof(string), "cb:%d sr:%d hw:%d dm:%d", cashbox,streetrace,hotwire,deathmatch);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			return 1;
		}
		new weaponid = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			streetrace=weaponid;
			format(string, sizeof(string), "cb:%d sr:%d hw:%d dm:%d", cashbox,streetrace,hotwire,deathmatch);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}

		return 1;
	}
//<-----------------------------[hotwire]-----------------------------------------------------------------------
	if (strcmp(cmd, "/hotwire", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /hotwire [0-1] This mission on 1 off 0");
			format(string, sizeof(string), "cb:%d sr:%d hw:%d dm:%d", cashbox,streetrace,hotwire,deathmatch);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			return 1;
		}
		new weaponid = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			hotwire=weaponid;
			format(string, sizeof(string), "cb:%d sr:%d hw:%d dm:%d", cashbox,streetrace,hotwire,deathmatch);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}

		return 1;
	}
	if (strcmp(cmd, "/deathmatch", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /deathmatch [0-1] This mission on 1 off 0");
			format(string, sizeof(string), "cb:%d sr:%d hw:%d dm:%d", cashbox,streetrace,hotwire,deathmatch);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			return 1;
		}
		new weaponid = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			deathmatch=weaponid;
			format(string, sizeof(string), "cb:%d sr:%d hw:%d dm:%d", cashbox,streetrace,hotwire,deathmatch);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
		}

		return 1;
	}
//---------------------------------------------------------------------------------------
/* HidePM
if( strcmp( cmd, "/hidepm", true ) == 0 )
	{
	if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
	    HidePM[ playerid ] = 1;
	    SendClientMessage( playerid, COLOR_YELLOW, "You won't recieve other player's PM messages anymore." );
	    return 1;
	}
	if( strcmp( cmd, "/showpm", true ) == 0 )
	{
    if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
	    HidePM[ playerid ] = 0;
	    SendClientMessage( playerid, COLOR_YELLOW, "You will now see other player's PM messages again." );
	    return 1;
	}
*/
//----------------------------------[HELP]-----------------------------------------------
	if(strcmp(cmd, "/contract", true) == 0) //no finnish
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /contract [playerid/PartOfName] [amount]");
			return 1;
		}
		new id = strval(tmp);
		if(id == playerid)
			return SendClientMessage(playerid,COLOR_GRAD1,"ERROR: You can not place a contract on yourself");
			
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /contract [playerid/PartOfName] [amount]");
			return 1;
		}
		moneys = strval(tmp);
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys)
			{
				GivePlayerMoney(playerid, (0 - moneys));
				Contract[giveplayerid] = Contract[giveplayerid]+moneys;
				format(string, sizeof(string), "%s has placed a contract on %s, for $%d.",sendername, giveplayer, moneys);
				PayLog(string);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				BroadCast(COLOR_YELLOW, string);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/votekick", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /votekick [playerid/PartOfName]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if(IsPlayerAdmin(giveplayerid) || PlayerInfo[giveplayerid][pAdmin] >= 3)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Administrators can not be Vote Kicked");
			return 1;
		}
		if(PlayerInfo[giveplayerid][pLevel] >= 0)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Players over level 0 cannot be Vote Kicked atm");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid) && gPlayerSpawned[giveplayerid] == 1)
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			VoteKick[giveplayerid] = 1;
			KickVote[giveplayerid] = 1;
			format(string, sizeof(string), "%s has started a vote to kick %s, type /vote %d to vote yes",sendername, giveplayer,giveplayerid);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			BroadCast(COLOR_YELLOW, string);
		}
		else
		{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/vote", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /vote [playerid]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if (VoteKick[giveplayerid] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "There is no vote in progress on this player");
			return 1;
		}
		if (LastVote[playerid] == giveplayerid)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "You can only vote once on a player");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			KickVote[giveplayerid]++;
			LastVote[playerid] = giveplayerid;
			SendClientMessage(playerid, COLOR_GRAD1, "Your vote has been counted, Thank you for voting");
		}
		else
		{
			format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
return 1;
}
//------------------------------------------------------------------------------------------------------
public HouseLevel(playerid)
{
	new h = PlayerInfo[playerid][pPhousekey];
	if(h == 255)
	{
		return 0;
	}
	if(h <= 4)
	{
		return 1;
	}
	if(h >= 5 && h <= 9)
	{
		return 2;
	}
	if(h >= 10 && h <= 18)
	{
		return 3;
	}
	if(h >= 19 && h <= 22)
	{
		return 4;
	}
	if(h >= 23 && h <= 25)
	{
		return 5;
	}
	if(h == 26)
	{
		return 6;
	}
	if(h == 27)
	{
		return 7;
	}
	if(h >= 28 && h <= 31)
	{
		return 7;
	}
	return 0;
}

public CHouseLevel(houseid)
{
	if(houseid <= 4)
	{
		return 3;
	}
	if(houseid >= 29 && houseid <= 30)
	{
		return 4;
	}
	if(houseid >= 5 && houseid <= 9)
	{
		return 5;
	}
	if(houseid >= 10 && houseid <= 18 || houseid == 28)
	{
		return 7;
	}
	if(houseid >= 19 && houseid <= 22)
	{
		return 8;
	}
	if(houseid >= 23 && houseid <= 25)
	{
		return 9;
	}
	if(houseid == 26)
	{
		return 10;
	}
	if(houseid == 27)
	{
		return 11;
	}
	if(houseid >= 28 && houseid <= 31)
	{
		return 12;
	}
	return 0;
}

public Encript(string[])
{
	for(new x=0; x < strlen(string); x++)
	  {
		  string[x] += (3^x) * (x % 15);
		  if(string[x] > (0xff))
		  {
			  string[x] -= 256;
		  }
	  }
	return 1;
}

public Decript(string[])
{
	if (gdebug){printf("DEBUG string = %s", string);}
	for(new x=0; x < strlen(string); x++)
	  {
		  string[x] -= (3^x) * (x % 15);
		  if(string[x] > (0xff))
		  {
			  string[x] -= 256;
		  }
	  }
	if (gdebug){printf("DEBUG decript = %s", string);}
	return 1;
}

public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if (gdebug >= 3){printf("DEBUG ProxDetector()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	//radi = 2.0; //Trigger Radius
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(!BigEar[i])
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
				if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				{
					SendClientMessage(i, col1, string);
				}
				else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				{
					SendClientMessage(i, col2, string);
				}
				else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				{
					SendClientMessage(i, col3, string);
				}
				else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				{
					SendClientMessage(i, col4, string);
				}
				else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					SendClientMessage(i, col5, string);
				}
			}
			else
			{
				SendClientMessage(i, col1, string);
			}
		}
	}
			return 1;
}

public CrimInRange(Float:radi, playerid,copid)
{
	if (gdebug >= 0){printf("DEBUG CrimProxDetector()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	GetPlayerPos(copid, posx, posy, posz);
	tempposx = (oldposx -posx);
	tempposy = (oldposy -posy);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)))
	{
		return 1;
	}
	return 0;
}

public CrimProxDetector(Float:radi, playerid,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10)
{
	if (gdebug >= 3){printf("DEBUG CrimProxDetector()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy;
	new count;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	for(count = 10; count >= 0; count=count-1)
	{
		//printf("counter = %d",count);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1 && gTeam[i] == 2 && FlashTime[i] == 0)
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				if (((tempposx < radi/count) && (tempposx > -radi/count)) && ((tempposy < radi/count) && (tempposy > -radi/count)))
				{
					//printf("DEBUG: player %d has at range %d",i,count);
					if (count == 10) {SetPlayerColor(playerid,col1);return 1;}
					else if (count == 9) {SetPlayerColor(playerid,col1);return 1;}
					else if (count == 8) {SetPlayerColor(playerid,col2);return 1;}
					else if (count == 7) {SetPlayerColor(playerid,col3);return 1;}
					else if (count == 6) {SetPlayerColor(playerid,col4);return 1;}
					else if (count == 5) {SetPlayerColor(playerid,col5);return 1;}
					else if (count == 4) {SetPlayerColor(playerid,col6);return 1;}
					else if (count == 3) {SetPlayerColor(playerid,col7);return 1;}
					else if (count == 2) {SetPlayerColor(playerid,col8);return 1;}
					else if (count == 1) {SetPlayerColor(playerid,col9);return 1;}
					else {SetPlayerColor(playerid,col10);return 1;}
				}

			}
		}
	}
	return 1;
}



public ProxDetectorS(Float:radi, playerid, targetid)
{
	if (gdebug >= 3){printf("DEBUG ProxDetectorS()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	//radi = 2.0; //Trigger Radius
	GetPlayerPos(targetid, posx, posy, posz);
	tempposx = (oldposx -posx);
	tempposy = (oldposy -posy);
	tempposz = (oldposz -posz);
	//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
		return 1;
	}
	return 0;
}

public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	if (gdebug >= 3){printf("DEBUG ProxDetectorS()");}
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	tempposx = (oldposx -x);
	tempposy = (oldposy -y);
	tempposz = (oldposz -z);
	//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
		return 1;
	}
	return 0;
}

public TestDistance(playerid,giveplayerid,Float:tarx,Float:tary,Float:tarz,Float:radi)
{
	if (gdebug >= 3){printf("DEBUG TestDistance()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	//radi = 2.0; //Trigger Radius
	GetPlayerPos(giveplayerid, posx, posy, posz);
	tempposx = (tarx -oldposx);
	tempposy = (tary -oldposy);
	tempposz = (tarz -oldposz);
	//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
		if (gdebug >= 2){printf("DEBUG TestDistance2()");}
		tempposx = (tarx -posx);
		tempposy = (tary -posy);
		tempposz = (tarz -posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			if (gdebug >= 2){printf("DEBUG TestDistance3()");}
			return 1;
		}
	}
	else
	{
		return 0;
	}
	return 0;
}

public PlayerInArea()
{
	new Float:x, Float:y, Float:z;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			GetPlayerPos(i, x, y, z);
			//printf("DEBUGpia: X:%f Y:%f Z:%f",x, y, z);
			if(x<=2720.00 && x>=1220.00 && y<=2600.00 && y>=850.00 && z<=1100.0 && z>=900.0 || PlayerToPoint(2.0, i, 1119.0,-1.7,1000.6))
			{
				new string[64];
				format(string, sizeof(string), "~r~Closed");
				GameTextForPlayer(i, string, 5000, 6);
				SetPlayerInterior(i,12);
				PlayerInfo[i][pInt] = 12;
				SetPlayerPos(i,1022.599975,-1123.699951,23.799999);
			}
		}
	}
	return 1;
}

public PlayerInArena()
{
	new Float:x, Float:y, Float:z;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			GetPlayerPos(i, x, y, z);
			if((gPlayerFighter[i] != 1 && PlayerInfo[i][pAdmin] < 1 && Spectate[i] == 255))
			{
				if(x<=gDMWbounds[0]+50 && x>=gDMWbounds[1]-50 && y<=gDMWbounds[2]+50 && y>=gDMWbounds[3]-50)
				{
					GameTextForPlayer(i, "~w~Warning You Are Approaching A~n~~r~Restricted Area~n~~w~Turn back or be shot", 5000, 6);
				}
				if(x<=gDMWbounds[0]+25 && x>=gDMWbounds[1]-25 && y<=gDMWbounds[2]+25 && y>=gDMWbounds[3]-25)
				{
					SetPlayerHealth(i, 0.0);
				}
			}
			if(gPlayerFighter[i])
			{
				if(x>gDMWbounds[0])
				{
					SetPlayerPos(i, gDMWbounds[0], y,z); // Warp the player
					GameTextForPlayer(i, "~w~You cannot leave~n~~r~DEATHMATCH", 5000, 6);
				}
				if(x<gDMWbounds[1])
				{
					SetPlayerPos(i, gDMWbounds[1], y,z); // Warp the player
					GameTextForPlayer(i, "~w~You cannot leave~n~~r~DEATHMATCH", 5000, 6);
				}
				if(y>gDMWbounds[2])
				{
					SetPlayerPos(i, x,gDMWbounds[2],z); // Warp the player
					GameTextForPlayer(i, "~w~You cannot leave~n~~r~DEATHMATCH", 5000, 6);
				}
				if(y<gDMWbounds[3])
				{
					SetPlayerPos(i, x,gDMWbounds[3],z); // Warp the player
					GameTextForPlayer(i, "~w~You cannot leave~n~~r~DEATHMATCH", 5000, 6);
				}
			}
		}
	}
	return 1;
}

public PenInArea()
{
	new Float:x, Float:y, Float:z;
		if(gPublicEnemy != 255)
		{
			GetPlayerPos(gPublicEnemy, x, y, z);
			if(z>900.0)
			{
				new house = PlayerInfo[gPublicEnemy][pLocal];
				GameTextForPlayer(gPublicEnemy, "~w~There is nowhere to hide", 5000, 1);
				SetPlayerInterior(gPublicEnemy,0);
				PlayerInfo[gPublicEnemy][pInt] = 0;
				PlayerInfo[gPublicEnemy][pLocal] = 255;
				if(house > 99 && house != 255)
				{
					SetPlayerPos(gPublicEnemy, BizzInfo[house-99][bEntrancex], BizzInfo[house-99][bEntrancey],BizzInfo[house-99][bEntrancez]); // Warp the player
				}
				else if(house < 99 && house != 255)
				{
					SetPlayerPos(gPublicEnemy, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]); // Warp the player
				}
				else
				{
					SetPlayerPos(gPublicEnemy, 1350.1,-1279.1,13.3); // Warp the player to amunation
				}
			}
			if(z <= -0.8)
			{
				GameTextForPlayer(gPublicEnemy, "~w~Public Enemy Can Not Swim", 5000, 1);
				SetPlayerPos(gPublicEnemy, 1350.1,-1279.1,13.3); // Warp the player to amunation
			}
			if(x == PenPos[0] && y == PenPos[1] && z == PenPos[2])
			{
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) && gTeam[i] == 2 && CrimInRange(5.0, gPublicEnemy,i))
					{
						SetPlayerHealth(gPublicEnemy, 0.0);
						OnPlayerDeath(gPublicEnemy, i, 0);
					}
				}
			}
			PenPos[0] = x ;PenPos[1]= y;PenPos[2]= z;
		}
	return 1;
}

public CustomPickups()
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new string[128];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			GetPlayerPos(i, oldposx, oldposy, oldposz);
			new tmpcar = GetPlayerVehicleID(i);
			/*
			if(gPlayerSpawned[i] && PlayerToPoint(10.0, i, 1520.1,-1473.2,9.2))
			{
				new string[128];
				format(string, sizeof(string), "~w~Wheel Arch Angels~n~Type ~g~/enter ~w~to use");
				GameTextForPlayer(i, string, 5000, 3);
			}
			*/
			if(oldposx!=0.0 && oldposy!=0.0 && oldposz!=0.0)
			{
				for(new h = 0; h < sizeof(SBizzInfo); h++)
				{
					if(IsATruck(tmpcar) && PlayerToPoint(10.0, i, SBizzInfo[h][sbEntrancex], SBizzInfo[h][sbEntrancey], SBizzInfo[h][sbEntrancez]))
					{
						format(string, sizeof(string), "~w~%s~n~~r~Components Required~w~: %d~n~~g~Paying~w~: $%d~n~~g~Funds: ~w~: $%d",SBizzInfo[h][sbDiscription],(SBizzInfo[h][sbCompCap]-SBizzInfo[h][sbComp]),SBizzInfo[h][sbPayComp],SBizzInfo[h][sbTakings]);
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
					if(PlayerToPoint(2.0, i, SBizzInfo[h][sbEntrancex], SBizzInfo[h][sbEntrancey], SBizzInfo[h][sbEntrancez]))
					{
						if(SBizzInfo[h][sbOwned] == 1)
						{
							format(string, sizeof(string), "~w~%s~w~~n~Owner : %s~n~Entrance Fee : ~g~$%d ~w~Level : %d ~n~to enter type /enter",SBizzInfo[h][sbDiscription],SBizzInfo[h][sbOwner],SBizzInfo[h][sbEntcost],SBizzInfo[h][sbLevel]);
						}
						else
						{
							format(string, sizeof(string), "~w~%s~w~~n~This Business is for sale~n~Cost: ~g~$%d ~w~Level : %d ~n~to buy this Business type /buybiz",SBizzInfo[h][sbDiscription],SBizzInfo[h][sbValue],SBizzInfo[h][sbLevel]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
				for(new h = 0; h < sizeof(HouseInfo); h++)
				{
					if(PlayerToPoint(2.0, i, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]))
					{
						if(HouseInfo[h][hOwned] == 1)
						{
							if(HouseInfo[h][hRentabil] == 0)
							{
								format(string, sizeof(string), "~w~This House is owned by~n~%s~n~Level : %d",HouseInfo[h][hOwner],HouseInfo[h][hLevel]);
							}
							else
							{
								format(string, sizeof(string), "~w~This House is owned by~n~%s~n~Rent: $%d Level : %d~n~Type /rentroom to rent a room",HouseInfo[h][hOwner],HouseInfo[h][hRent],HouseInfo[h][hLevel]);
							}
							GameTextForPlayer(i, string, 5000, 3);
							return 1;
						}
						else
						{
							format(string, sizeof(string), "~w~This House is for sale~n~Discription: %s ~n~Cost: ~g~$%d~n~~w~ Level : %d~n~to buy this house type /buyhouse",HouseInfo[h][hDiscription],HouseInfo[h][hValue],HouseInfo[h][hLevel]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
				for(new h = 0; h < sizeof(BizzInfo); h++)
				{
					if(IsATruck(tmpcar) && PlayerToPoint(10.0, i, BizzInfo[h][bEntrancex], BizzInfo[h][bEntrancey], BizzInfo[h][bEntrancez]))
					{
						format(string, sizeof(string), "~w~%s~n~~r~Components Required~w~: %d~n~~g~Paying~w~: $%d~n~~g~Funds: ~w~: $%d",BizzInfo[h][bDiscription],(BizzInfo[h][bCompCap]-BizzInfo[h][bComp]),BizzInfo[h][bPayComp],BizzInfo[h][bTakings]);
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
					if(PlayerToPoint(2.0, i, BizzInfo[h][bEntrancex], BizzInfo[h][bEntrancey], BizzInfo[h][bEntrancez]))
					{
						if(BizzInfo[h][bOwned] == 1)
						{
							format(string, sizeof(string), "~w~%s~w~~n~Owner : %s~n~Entrance Fee : ~g~$%d ~w~Level : %d ~n~to enter type /enter",BizzInfo[h][bDiscription],BizzInfo[h][bOwner],BizzInfo[h][bEntcost],BizzInfo[h][bLevel]);
						}
						else
						{
							format(string, sizeof(string), "~w~%s~w~~n~This Business is for sale~n~Cost: ~g~$%d ~w~Level : %d ~n~to buy this Business type /buybiz",BizzInfo[h][bDiscription],BizzInfo[h][bValue],BizzInfo[h][bLevel]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

public IdleKick()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && PlayerInfo[i][pAdmin] < 1)
		{
			GetPlayerPos(i, PlayerPos[i][0], PlayerPos[i][1], PlayerPos[i][2]);
			//printf("player %d\n x = %f\n y = %f\n z = %f\n x2 = %f\n y2 = %f\n z2 = %f\n",i, PlayerPos[i][0],PlayerPos[i][1],PlayerPos[i][2],PlayerPos[i][3],PlayerPos[i][4],PlayerPos[i][5]);
			if(PlayerPos[i][0] == PlayerPos[i][3] && PlayerPos[i][1] == PlayerPos[i][4] && PlayerPos[i][2] == PlayerPos[i][5])
			{
				Kick(i);
			}
			PlayerPos[i][3] = PlayerPos[i][0];
			PlayerPos[i][4] = PlayerPos[i][1];
			PlayerPos[i][5] = PlayerPos[i][2];
		}
	}
}

public AntiCamp(playerid)
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(SafeTime[i] > 0)
			{
				SafeTime[i]--;
			}
			if(SafeTime[i] == 1)
			{
				if(gPlayerAccount[i] == 1 && gPlayerLogged[i] == 0)
				{
					ShowPlayerDialog(playerid, 9, DIALOG_STYLE_PASSWORD, "{076F13}Login your account", "{F0FF00}Welcome back,\n{FFFFFF}put your password here\nfor login in Public Enemy: Los Santos server.", "Login", "");
					//Kick(i);
				}
			}
		}
	}
}

public AntiTeleport()
{
	new plname[MAX_PLAYER_NAME];
	new string[256];
	new Float:maxspeed = 175.0;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && (GetPlayerState(i) == 2))
		{
			GetPlayerPos(i, TelePos[i][3], TelePos[i][4], TelePos[i][5]);
			if(TelePos[i][5] > 550.0)
			{
				TelePos[i][0] = 0.0;
				TelePos[i][1] = 0.0;
			}
			//printf("player %d\n x = %f\n y = %f\n z = %f\n x2 = %f\n y2 = %f\n z2 = %f\n",i, PlayerPos[i][0],PlayerPos[i][1],PlayerPos[i][2],PlayerPos[i][3],PlayerPos[i][4],PlayerPos[i][5]);
			if(TelePos[i][0] != 0.0)
			{
				new Float:xdist = TelePos[i][3]-TelePos[i][0];
				new Float:ydist = TelePos[i][4]-TelePos[i][1];
				new Float:sqxdist = xdist*xdist;
				new Float:sqydist = ydist*ydist;
				new Float:distance = (sqxdist+sqydist)/31;
				if(gSpeedo[i] == 2)
				{
					if(distance <10)
					{
						format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~mph :   ~w~%.0f",distance);
					}
					if(distance > 10 && distance < 100)
					{
						format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~mph :  ~w~%.0f",distance);
					}
					if(distance > 100)
					{
						format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~mph : ~w~%.0f",distance);
					}
					GameTextForPlayer(i, string, 2000, 5);
				}
				if(distance > maxspeed)
				{
					new tmpcar = GetPlayerVehicleID(i);
					if(!IsAPlane(tmpcar))
					{
						GetPlayerName(i, plname, sizeof(plname));
						format(string, 256, "AdmWarning: [%d]%s %.0f mph",i,plname,distance);
						Speeder = i;
						ABroadCast(COLOR_YELLOW,string,1);
					}
				}
			}
			if(TelePos[i][5] < 550.0 && TelePos[i][3] != 0.0)
			{
				TelePos[i][0] = TelePos[i][3];
				TelePos[i][1] = TelePos[i][4];
			}
		}
	}
}


public RaceSpec(playerid)
{
	new tmplaps;
	new bestracer;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && LapCount[i] > 0)
		{
			if(LapCount[i] > tmplaps)
			{
				bestracer = i;
				tmplaps = LapCount[i];
			}
		}
	}
	if(Spectate[playerid] != bestracer)
	{
		new sstring[256];
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestracer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~w~%s",giveplayer);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestracer;
	}
	return 1;
}

public BestPlayer(playerid)
{
	new bestplayer;
	bestplayer = lastkiller;
	if(gSuperCop != INVALID_PLAYER_ID)
	{
		bestplayer = gSuperCop;
	}
	if(Spectate[playerid] != bestplayer)
	{
		new sstring[256];
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestplayer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~w~%s",giveplayer);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestplayer;
	}
	return 1;
}

public PenDelay(playerid)
{
	new bestplayer;
	new sstring[256];
	bestplayer = gPublicEnemy;
	if(bestplayer == INVALID_PLAYER_ID)
	{
		TVMode[playerid] = 1;
		GameTextForPlayer(playerid, "~w~                True~n~                   ~b~Crime", 5000, 6);
		BestPlayer(playerid);
		return 1;
	}
	if(Spectate[playerid] != bestplayer)
	{
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestplayer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~p~Starring ~n~~w~%s",giveplayer);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestplayer;
	}
	return 1;
}

public SpeedDelay(playerid)
{
	new bestplayer;
	new sstring[256];
	bestplayer = Speeder;
	if(bestplayer == INVALID_PLAYER_ID)
	{
		TVMode[playerid] = 1;
		GameTextForPlayer(playerid, "~w~                True~n~                   ~b~Crime", 5000, 6);
		BestPlayer(playerid);
		return 1;
	}
	if(Spectate[playerid] != bestplayer)
	{
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestplayer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~p~Starring ~n~~w~%s",giveplayer);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestplayer;
	}
	return 1;
}


public DMPlayer(playerid)
{
	new bestplayer;
	bestplayer = DmHiPlayer;
	if(bestplayer == INVALID_PLAYER_ID)
	{
		TVMode[playerid] = 1;
		GameTextForPlayer(playerid, "~w~                True~n~                   ~b~Crime", 5000, 6);
		BestPlayer(playerid);
		return 1;
	}
	if(Spectate[playerid] != bestplayer)
	{
		new sstring[256];
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestplayer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~w~%s~n~  score:~r~ %d",giveplayer,DmScore[bestplayer]);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestplayer;
	}
	return 1;
}

public InHouse()
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new string[256];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(PlayerInfo[i][pLocal] != 255)
			{
				new house = PlayerInfo[i][pLocal];
				GetPlayerPos(i, oldposx, oldposy, oldposz);
				if(oldposz != 0.0)
				{
					if(oldposz < 600.0)
					{
						//new string[64];
						//format(string, sizeof(string), "~w~rexit");
						if(house == 10000)
						{
							if (!PlayerToPoint(6, i,-2724.0,217.9,4.1))
							{
								if (GetPlayerState(i) == 2)
								{
									new tmpcar = GetPlayerVehicleID(i);
									SetVehiclePos(tmpcar, 1520.1,-1473.2,9.2);
									SetVehicleZAngle(tmpcar, 270.0);
								}
								else
								{
									SetPlayerPos(i, 1520.1,-1473.2,9.2);
								}
									new oldcash = gSpentCash[i];
									new Total = GetPlayerMoney(i) - oldcash;
									printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(i),oldcash);
									new name[MAX_PLAYER_NAME];
									SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]-Total;
									GetPlayerName(i, name, sizeof(name));
									format(string,128,"<< %s has left the modshop with $%d >>",name,Total);
									PayLog(string);
									gSpentCash[i] = 0;
								TelePos[i][0] = 0.0;
								TelePos[i][1] = 0.0;
								PlayerInfo[i][pLocal] = 255;
								SetPlayerInterior(i,0);
								PlayerInfo[i][pInt] = 0;
								Spectate[i] = 255;
							}
						}
						if(house > 10000)
						{
							new tmpcar = GetPlayerVehicleID(i);
							if (!PlayerToPoint(6, i,1040.6,-1021.0,31.7) && house == 10001 ||!PlayerToPoint(6, i,-2720.5,217.5,4.1) && house == 10002 ||!PlayerToPoint(6, i,2644.6,-2044.9,13.3) && house == 10003)
							{
								if (GetPlayerState(i) == 2)
								{
									SetVehiclePos(tmpcar, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]);
									SetVehicleZAngle(tmpcar, HouseCarSpawns[tmpcar-1][3]);
								}
								else
								{
									SetPlayerPos(i, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]);
								}
									new oldcash = gSpentCash[i];
									new Total = GetPlayerMoney(i) - oldcash;
									printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(i),oldcash);
									new name[MAX_PLAYER_NAME];
									SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]-Total;
									GetPlayerName(i, name, sizeof(name));
									format(string,128,"<< %s has left the homemodshop with $%d >>",name,Total);
									PayLog(string);
									gSpentCash[i] = 0;
								TelePos[i][0] = 0.0;
								TelePos[i][1] = 0.0;
								PlayerInfo[i][pLocal] = 255;
								SetPlayerInterior(i,0);
								PlayerInfo[i][pInt] = 0;
								Spectate[i] = 255;
							}
						}
						if(house >= 99 && house != 10000)
						{
							if(house == 7+99 && PlayerInfo[i][pPbiskey] != 7) //casino) //casino
							{
								new oldcash = gSpentCash[i];
								new Total = GetPlayerMoney(i) - oldcash;
								printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(i),oldcash);
								new name[MAX_PLAYER_NAME];
								BizzInfo[7][bTakings] = BizzInfo[7][bTakings]-Total;
								GetPlayerName(i, name, sizeof(name));
								format(string,128,"<< %s has left the casino with $%d >>",name,Total);
								PayLog(string);
								gSpentCash[i] = 0;
							}
							SetPlayerPos(i, BizzInfo[house-99][bEntrancex], BizzInfo[house-99][bEntrancey],BizzInfo[house-99][bEntrancez]); // Warp the player
							PlayerInfo[i][pLocal] = 255;
							SetPlayerInterior(i,0);
							PlayerInfo[i][pInt] = 0;
						}
						else if(house < 99 && house != 10000)
						{
							SetPlayerPos(i, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]); // Warp the player
							PlayerInfo[i][pLocal] = 255;
							SetPlayerInterior(i,0);
							PlayerInfo[i][pInt] = 0;
						}
					}
				}
			}
		}
	}
	return 1;
}



public IsStringAName(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			new testname[MAX_PLAYER_NAME];
			GetPlayerName(i, testname, sizeof(testname));
			//printf("IsS:testname = %s : string = %s",testname,string);
			if(strcmp(testname, string, true, strlen(string)) == 0)
			{
				//printf("TRUE IsS:testname = %s : string = %s",testname,string);
				return 1;
			}
		}
	}
	return 0;
}

public GetPlayerID(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			new testname[MAX_PLAYER_NAME];
			GetPlayerName(i, testname, sizeof(testname));
			//printf("GetP:testname = %s : string = %s",testname,string);
			if(strcmp(testname, string, true, strlen(string)) == 0)
			{
				//printf("TRUE GetP:testname = %s : string = %s playerid %d",testname,string, i);
				return i;
			}
		}
	}
	return INVALID_PLAYER_ID;
}

public OnPlayerText(playerid, text[])
{
	if(stringContainsIP(text))
	{
	new bitch[256];
    GetPlayerName(playerid,bitch,sizeof(bitch));
    format(bitch,sizeof(bitch),"%s may be trying to spam his server",bitch);
	SendClientMessageToAll(COLOR_GRAD1,bitch);
		return 0;
	}
	if(Mute[playerid] == 1)
	{
		SendClientMessage(playerid, TEAM_CYAN_COLOR, "You cannot speak, you have been silenced");
		return 0;
	}
	if(Mobile[playerid] != 255)
	{
		new string [128];
		new sendername[MAX_PLAYER_NAME];
		new idx;
		new tmp[MAX_PLAYER_NAME];
		tmp = strtok(text, idx);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s Says (cellphone): %s", sendername, text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		//printf("callers line %d called %d caller %d",Mobile[Mobile[playerid]],Mobile[playerid],playerid);
		if(Mobile[playerid] == 914)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: Sorry I don't understand?");
				return 0;
			}
				new turner[MAX_PLAYER_NAME];
				new wanted[128];
				GetPlayerName(playerid, turner, sizeof(turner));
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: We have alerted all units in the area.");
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Thank you for reporting this incident");
				format(wanted, sizeof(wanted), "Dispatch: All Units IA: Caller: %s",turner);
				SendTeamBeepMessage(1, TEAM_CYAN_COLOR, wanted);
				format(wanted, sizeof(wanted), "Dispatch: Incident: %s",text);
				SendTeamMessage(1, TEAM_CYAN_COLOR, wanted);
				if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
				SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
				Mobile[playerid] = 255;
				return 0;
		}
		if(Mobile[playerid] == 913)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Sorry i dont understand?");
				return 0;
			}
			if ((strcmp("no", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("no")))
			{
				new turner[MAX_PLAYER_NAME];
				new wanted[128];
				GetPlayerName(playerid, turner, sizeof(turner));
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: We have alerted all units in the area.");
				SendClientMessage(playerid, COLOR_DBLUE, "Thank you for reporting this crime");
				format(wanted, sizeof(wanted), "HQ: All Units APB: Reporter: %s",turner);
				SendTeamBeepMessage(2, COLOR_DBLUE, wanted);
				format(wanted, sizeof(wanted), "HQ: Crime: %s, Suspect: Unknown",PlayerCrime[playerid][pAccusing]);
				SendTeamMessage(2, COLOR_DBLUE, wanted);
				if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
				SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
				Mobile[playerid] = 255;
				return 0;
			}
			new badguy;
			if(IsStringAName(tmp))
			{
				badguy = GetPlayerID(tmp);
			}
			else
			{
				badguy = strval(tmp);
			}
			if (gTeam[badguy] == 2 || gTeam[badguy] == 1)
			{
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: You will have to contact internal affairs. This is an emergency line");
				SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
				Mobile[playerid] = 255;
				return 0;
			}
			if (gTeam[badguy] >= 4)
			{
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Units are already assigned to that case");
				SendClientMessage(playerid, COLOR_DBLUE, "Thank you for reporting this crime");
				SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
				Mobile[playerid] = 255;
				return 0;
			}
			if (badguy == playerid)
			{
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Dont Fool Around, This is an emergency line.");
				SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
				Mobile[playerid] = 255;
				return 0;
			}
			if (IsPlayerConnected(badguy))
			{
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: We have alerted all units in the area.");
				SendClientMessage(playerid, COLOR_DBLUE, "Thank you for reporting this crime");
				SetPlayerCriminal(badguy,playerid, PlayerCrime[playerid][pAccusing],0,0);
				if(FlashTime[badguy] == 0){FlashTime[playerid] = 10;}
				if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
				SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
				Mobile[playerid] = 255;
				return 0;
			}
			else
			{
				format(string, sizeof(string), "Police HQ: I have no Information on %s, are you shure thats the right name?",tmp);
				SendClientMessage(playerid, COLOR_DBLUE, string);
				return 0;
			}
		}
		if(Mobile[playerid] == 912)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Sorry i dont understand?");
				return 0;
			}
				strmid(PlayerCrime[playerid][pAccusing], text, 0, strlen(text), 255);
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: If you know the assailant's name or part of it say it now or just say no.");
				Mobile[playerid] = 913;
				return 0;
		}
		if(Mobile[playerid] == 911)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Sorry i dont understand, police or paramedic?");
				return 0;
			}
			else if ((strcmp("police", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("police")))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: I am patching you to  Police HQ, please hold.");
				Mobile[playerid] = 912;
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Please give me a short description of the crime.");
				return 0;
			}
			else if ((strcmp("paramedic", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("paramedic")))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: I am patching you to  Paramedic HQ, please hold.");
				Mobile[playerid] = 914;
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: Please give me a short description of the Incident.");
				return 0;
			}
			else
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Sorry i dont understand, police or paramedic?");
				return 0;
			}
		}
		if(IsPlayerConnected(Mobile[playerid]) == 1 && Mobile[Mobile[playerid]] == playerid)
		{
			SendClientMessage(Mobile[playerid], COLOR_YELLOW,string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_YELLOW,"Theres nobody there");
		}
		return 0;
	}
	if (realchat)
	{
		new string [128];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s Says %s", sendername, text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		return 0;
	}
	return 1;
}

public SetCamBack(playerid)
{
	new Float:plocx,Float:plocy,Float:plocz;
	GetPlayerPos(playerid, plocx, plocy, plocz);
	SetPlayerPos(playerid, -1863.15, -21.6598, 1060.15); // Warp the player
	SetPlayerInterior(playerid,14);
	//SetPlayerPos(playerid, plocx, plocy, plocz); // Warp the player
	//SetPlayerInterior(playerid,0);
}

public FixHour(hour)
{
	//if (gdebug >= 2){printf("DEBUG FixHour(%d)",hour);}
	hour = timeshift+hour;
	if (hour < 0)
	{
		hour = hour+24;
	}
	else if (hour > 23)
	{
		hour = hour-24;
	}
	shifthour = hour;
	return 1;
}

//--------------------------------------------------------------------------------------------
/* public OnPlayerPrivmsg(senderid, playerid, text[] )
{
	new string[256];
	new name[24]; // Reciever
	new name2[24]; // Sender
	GetPlayerName( playerid, name, 24 );
	GetPlayerName( senderid, name2, 24 );
	format(string, sizeof(string), "[pm] %s %d %s %d %s", name, playerid, name2, senderid, text);
	add_log( string );
	format(string, sizeof(string), "PM sent to %s (ID:%d): %s", name, playerid, text);
	SendClientMessage(senderid, 0xFCF54500, string);
	format(string, sizeof(string), "PM from %s (ID:%d): %s", name2, senderid, text);
	SendClientMessage(playerid, 0xFFDC1800, string);
	format( string, sizeof( string ), "PM from %s(ID:%d) to %s(ID:%d): %s", name2, senderid, name, playerid, text );
	// Now inform admins about it
	for( new i = 0; i < MAX_PLAYERS; i ++ )
	{
		if( IsPlayerConnected( i ) )
		{
		    if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		    {
		        // Level 3 admin or higher, may see PM. Well... do we want to see PM's?
		        // Oh, and the recieving player shouldn't see this either.
		        if( HidePM[ i ] != 1 && i != playerid )
				{
				    // Yay, send the notice.
				    SendClientMessage( i, COLOR_YELLOW, string );
				}
			}
		}
	}
	return 0; 
}*/
//--------------------------------------------------------------------------------------------------
hash(str2[])
{
	new tmpdasdsa[256];
	tmpdasdsa[0]=0;
	valstr(tmpdasdsa,num_hash(str2));
	return tmpdasdsa;
}

num_hash(buf[])
 {
	new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}

public SetAllPlayerRaceCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num)
{
	//if (gdebug >= 1){printf("DEBUG SetAllPlayerCheckpoint()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			SetPlayerRaceCheckpoint(i,0,allx,ally,allz,allx,ally,allz, radi);
			if (num != 255)
			{
				gPlayerCheckpointStatus[i] = num;
			}
		}
	}

}
public OnPlayerEnterRaceCheckpoint(playerid)
{
	new string[128];
	new name[MAX_PLAYER_NAME];

	switch (gPlayerCheckpointStatus[playerid])
	{
	case CHECKPOINT_SR1START:
		    {
			//	if (gdebug){print("DEBUG CHECKPOINT_SR1START");}
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				if (gTeam[playerid] >= 3)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					if(IsAPlane(tmpcar))
					{
						GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
						return 1;
					}
					if (MissionActive == 5)// first to arrive
					{
						gRaceLeader++;
					//	if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
						if (gRaceLeader == 1)
						{
							format(string, sizeof(string), "~r~Wait For More Racers");
							GameTextForPlayer(playerid, string, 2000, 6);
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
							DisablePlayerRaceCheckpoint(playerid);
							return 1;
						}
						else if (gRaceLeader == 2)
						{
							gRaceLeader = 0;
						//	if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
							format(string, sizeof(string), "Hurry %d Seconds To Race Start!",racedelay/1000);
							RingTone[playerid] = 20;
							SendEnemyMessage(COLOR_WHITE, string);
							format(string, sizeof(string), "~r~Wait Here For Racers");
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
							GameTextForPlayer(playerid, string, 2000, 6);
						}
						SetTimer("RaceDelay", racedelay, 0);
						DisablePlayerRaceCheckpoint(playerid);
						MissionActive = 6;
					//	if (gdebug){print("DEBUG MissionActive = 6");}
					}
					else if (MissionActive == 6) //late arrivels
					{
					//	if (gdebug){print("DEBUG waiting");}
						DisablePlayerRaceCheckpoint(playerid);
						gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~w~Patrol This Area~n~ For Suspects", 5000, 1);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
					return 1;
				}
		    }
		case CHECKPOINT_SRA:
		    {
			//	if (gdebug){print("DEBUG CHECKPOINT_SRA");}
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if (StartTime[playerid] == 0)
				{
					StartTime[playerid] = Gtickcount;
					if(gTeam[playerid] == 3)
					{
						SetPlayerCriminal(playerid,255, "Street Racing",0,0);
						//if(FlashTime[playerid] == 0){FlashTime[playerid] = 60;}
					}
				}
				LapCount[playerid]++;
				gRaceEnd++;
				if(LapCount[playerid] > gLaps)
				{
					gLaps = LapCount[playerid];
					gRaceEnd = 1;
				}
				if(RaceInfo[rLaps] != 0)
				{
					if(gLaps != (RaceInfo[rLaps]+1) && gLaps > 1)
					{
						//RaceDebug(playerid);
						if(gLaps == 2)
						{
							for(new i = 0; i <= MAX_PLAYERS; i++)
							{
								if(IsPlayerConnected(i) && gTeam[i] == 2)
								{
									format(cbjstore, sizeof(cbjstore), "HQ: 911 10-14 Set Up A RoadBlock At The Red Marker.");
									SendClientMessage(i, COLOR_DBLUE, cbjstore);
									RingTone[i] = 20;
									SetPlayerCheckpoint(i,rm2x,rm2y,rm2z, 8.0);
								}
							}
							RaceTime[playerid] = Gtickcount;
						}
						if (gRaceEnd == 1 && LapCount[playerid] == gLaps)
						{
							pos1time = RaceTime[playerid] - StartTime[playerid];
							ConvertTicks(pos1time);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 1st Place T: %d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~1st Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
							SetAllCopCheckpoint(rex,rey,rez, 8.0);
						}
						else if (gRaceEnd == 2 && LapCount[playerid] == gLaps)
						{
							pos2time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos2time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 2nd Place T: +%d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~2nd Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
						}
						else if (gRaceEnd == 3 && LapCount[playerid] == gLaps)
						{
							pos3time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos3time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 3rd Place T: +%d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~3rd Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
						}
						else
						{
							format(string, sizeof(string), "~w~Lap %d/%d",LapCount[playerid],RaceInfo[rLaps]);
						}
						GameTextForPlayer(playerid, string, 5000, 1);
					}
					else if(gLaps == (RaceInfo[rLaps]+1) && gLaps > 1)
					{
						if (gRaceEnd == 1)
						{
							DisablePlayerCheckpoint(playerid);
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						//	if (gdebug){print("DEBUG RACE OVER");}
							RewardCalc(playerid,1000,10000);
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							preward = reward;
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~w~MISSION PASSED! ~n~~g~$%d", reward);
							//format(string, sizeof(string), "~g~YOU WIN~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 0);
							BroadCast(COLOR_WHITE, "RACENEWS: The Race Will End In 120 secs");
							RaceTime[playerid] = Gtickcount;
							pos1time = RaceTime[playerid] - StartTime[playerid];
							ConvertTicks(pos1time);
							GetPlayerName(playerid, name, sizeof(name));
							raceendtimer = SetTimer("RaceEnd", 120000, 0);
							if(RaceInfo[rBestms] > pos1time || RaceInfo[rBestms] == 0)
							{
								RaceInfo[rBestms] = pos1time;
								strmid(RaceInfo[rBest],name, 0, strlen(name), 255);
								BestTime(CurrentRace);
								format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d",name,reward);
								BroadCast(COLOR_WHITE, string);
								format(string, sizeof(string), "RACENEWS: %s Has Set A New Best Time In %s T: %d:%d:%d", name,CurrentRace,cmins,csecs,cmils);
								BroadCast(COLOR_WHITE, string);
							}
							else
							{
								format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d T: %d:%d:%d", name,reward,cmins,csecs,cmils);
								BroadCast(COLOR_WHITE, string);
							}
							SetPlayerCriminal(playerid,255, "Street Racing",1,1);
							gPlayerMission[playerid] = 2;
							BetWinner(playerid,1);
							return 1;
						}
						else if (gRaceEnd == 2)
						{
							DisablePlayerCheckpoint(playerid);
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						//	if (gdebug){print("DEBUG RACE OVER");}
							reward = preward/2;
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~2nd place~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							RaceTime[playerid] = Gtickcount;
							pos3time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos3time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s Just Came 2nd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							return 1;
						}
						else if (gRaceEnd == 3)
						{
							CheckpointReset();
							RaceCheckpointReset();
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						//	if (gdebug){print("DEBUG RACE OVER");}
							reward = preward/3;
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~3rd place~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							RaceTime[playerid] = Gtickcount;
							pos2time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos2time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s Just Came 3rd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							KillTimer(raceendtimer);
							RaceEnd();
							return 1;
						}
					}
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerRaceCheckpoint(playerid,0,rmx,rmy,rmz,rm2x,rm2y,rm2z, 8.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRB;
				}
				if(RaceInfo[rLaps] == 0 && LapCount[playerid] == 1)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerRaceCheckpoint(playerid,0,rmx,rmy,rmz,rm2x,rm2y,rm2z, 8.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRB;
				}
		    }
		case CHECKPOINT_SRB:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceMid != 1 && LapCount[playerid] > gLaps)
				{
					gRaceMid = 1;
				}
			//	if (gdebug){print("DEBUG CHECKPOINT_SRB");}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerRaceCheckpoint(playerid,0,rm2x,rm2y,rm2z,rex,rey,rez, 8.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRC;
				gRaceMid++;
			//	if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
		    }
		case CHECKPOINT_SRC:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceMid2 != 1 && LapCount[playerid] > gLaps)
				{
					gRaceMid2 = 1;
				}
			//	if (gdebug){print("DEBUG CHECKPOINT_SRB");}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerRaceCheckpoint(playerid,0,rex,rey,rez,rsx,rsy,rsz, 8.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRD;
				gRaceMid2++;
			//	if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
		    }
		case CHECKPOINT_SRD:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceFin != 1 && LapCount[playerid] > gLaps)
				{
					gRaceFin = 1;
				}
			//	if (gdebug){print("DEBUG CHECKPOINT_SRC");}
				gRaceFin++;
				if(RaceInfo[rLaps] > 0)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerRaceCheckpoint(playerid,1,rsx,rsy,rsz,rsx,rsy,rsz, 8.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					SetAllCopCheckpoint(rex,rey,rez, 8.0);
				}
				if(RaceInfo[rLaps] == 0)
				{
					if (gRaceFin == 1)
					{
						DisablePlayerCheckpoint(playerid);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					//	if (gdebug){print("DEBUG RACE OVER");}
						RewardCalc(playerid,1000,10000);
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						preward = reward;
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~w~MISSION PASSED! ~n~~g~$%d", reward);
						//CheckpointReset();
      					DisablePlayerRaceCheckpoint(playerid);
						//format(string, sizeof(string), "~g~YOU WIN~n~~w~Your winnings are ~n~~g~$%d", reward);
						GameTextForPlayer(playerid, string, 5000, 0);
						BroadCast(COLOR_WHITE, "RACENEWS: The Race Will End In 120 secs");
						RaceTime[playerid] = Gtickcount;
						pos1time = RaceTime[playerid] - StartTime[playerid];
						ConvertTicks(pos1time);
						GetPlayerName(playerid, name, sizeof(name));
						raceendtimer = SetTimer("RaceEnd", 120000, 0);
						if(RaceInfo[rBestms] > pos1time || RaceInfo[rBestms] == 0)
						{
							RaceInfo[rBestms] = pos1time;
							strmid(RaceInfo[rBest],name, 0, strlen(name), 255);
							BestTime(CurrentRace);
							format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d",name,reward);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "RACENEWS: %s Has Set A New Best Time In %s T: %d:%d:%d", name,CurrentRace,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
						}
						else
						{
							format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d T: %d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
						}
						SetPlayerCriminal(playerid,255, "Street Racing",1,1);
						gPlayerMission[playerid] = 2;
						BetWinner(playerid,1);
					}
					else if (gRaceFin == 2)
					{
						DisablePlayerCheckpoint(playerid);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					//	if (gdebug){print("DEBUG RACE OVER");}
						reward = preward/2;
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~2nd place~n~~w~Your winnings are ~n~~g~$%d", reward);
						//CheckpointReset();
						DisablePlayerRaceCheckpoint(playerid);
						GameTextForPlayer(playerid, string, 5000, 6);
						RaceTime[playerid] = Gtickcount;
						pos3time = RaceTime[playerid] - StartTime[playerid];
						new splittime = pos3time - pos1time;
						ConvertTicks(splittime);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "RACENEWS: %s Just Came 2nd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
						BroadCast(COLOR_WHITE, string);
					}
					else if (gRaceFin == 3)
					{
						CheckpointReset();
						RaceCheckpointReset();
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					//	if (gdebug){print("DEBUG RACE OVER");}
						reward = preward/3;
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~3rd place~n~~w~Your winnings are ~n~~g~$%d", reward);
						DisablePlayerRaceCheckpoint(playerid);
						//CheckpointReset();
						GameTextForPlayer(playerid, string, 5000, 6);
						RaceTime[playerid] = Gtickcount;
						pos2time = RaceTime[playerid] - StartTime[playerid];
						new splittime = pos2time - pos1time;
						ConvertTicks(splittime);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "RACENEWS: %s Just Came 3rd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
						BroadCast(COLOR_WHITE, string);
						KillTimer(raceendtimer);
						RaceEnd();
					}
				}
		    }
		    }
	return 1;
}

public iconmap()
{

    for(new i=0; i<MAX_PLAYERS; i++)
	{
		for(new ico=0;ico<=mapicons;ico++)
	    {
	    	RemovePlayerMapIcon(i,ico);
	    }
  	}
  	mapicons=0;
    for(new i=0; i<MAX_PLAYERS; i++)
	{
		for(new h = 0; h < sizeof(HouseInfo); h++)
		{
			if(HouseInfo[h][hOwned] == 0)
			{
				SetPlayerMapIcon(i, mapicons, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez], 31, 0);
				mapicons ++;
			}
			if(HouseInfo[h][hOwned] == 1)
			{
				SetPlayerMapIcon(i, mapicons, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez], 32, 0);
				mapicons ++;
			}
		}
        for(new b = 0; b < sizeof(BizzInfo); b++)
	    {
		if(BizzInfo[b][bOwned] == 0)
		{
			SetPlayerMapIcon(i, mapicons, BizzInfo[b][bEntrancex], BizzInfo[b][bEntrancey], BizzInfo[b][bEntrancez], 52, 0);
			mapicons ++;
		}
		if(BizzInfo[b][bOwned] == 1)
		{
			SetPlayerMapIcon(i, mapicons, BizzInfo[b][bEntrancex], BizzInfo[b][bEntrancey], BizzInfo[b][bEntrancez], 36, 0);
			mapicons ++;
		}
      }
      for(new sb = 0; sb < sizeof(SBizzInfo); sb++)
	  {
		if(SBizzInfo[sb][sbOwned] == 0)
		{
			SetPlayerMapIcon(i, mapicons, SBizzInfo[sb][sbEntrancex], SBizzInfo[sb][sbEntrancey], SBizzInfo[sb][sbEntrancez], 52, 0);
			mapicons ++;
		}
		if(SBizzInfo[sb][sbOwned] == 1)
		{
			SetPlayerMapIcon(i, mapicons, SBizzInfo[sb][sbEntrancex], SBizzInfo[sb][sbEntrancey], SBizzInfo[sb][sbEntrancez], 36, 0);
			mapicons ++;
		}
	  }
	}
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
    PlayerPlaySound(issuerid, 17802, 0.0, 0.0, 0.0); // Ding Sound
	return 1;
}

public SendMSG(playerid)
{
    new randMSG = random(sizeof(RandomMSG));
    RingTone[playerid] = 20;
    SendClientMessageToAll(COLOR_YELLOW, RandomMSG[randMSG]);
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    new bitch[256];
	GetPlayerName(playerid,bitch,sizeof(bitch));
	
	if(pickupid == arenapickup1)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 24, 9999);
           GivePlayerWeapon(playerid, 25, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, 1411.2220, -2.8143, 1000.9237);
           SetPlayerInterior(playerid, 1);
           pInArena1[playerid]=1;
           format(bitch,sizeof(bitch),"*** %s joined Arena 1 (Deagle & Shotgun)",bitch);
           SendClientMessageToAll(COLOR_GRAD1,bitch);
	    }
        return 1;
	}
	if(pickupid == arenapickup2)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 34, 9999);
           GivePlayerWeapon(playerid, 25, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, 281.7788, 179.6681, 1007.1719);
           SetPlayerInterior(playerid, 3);
           pInArena2[playerid]=1;
           format(bitch,sizeof(bitch),"*** %s joined Arena 2 (Sniper & Shotgun)",bitch);
           SendClientMessageToAll(COLOR_GRAD1,bitch);
	    }
        return 1;
	}
	if(pickupid == arenapickup3)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 27, 9999);
           GivePlayerWeapon(playerid, 33, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, -1401.3137, 107.1078, 1032.2734);
           SetPlayerInterior(playerid, 1);
           pInArena3[playerid]=1;
           format(bitch,sizeof(bitch),"*** %s joined Arena 3 (Spas & Rifle)",bitch);
           SendClientMessageToAll(COLOR_GRAD1,bitch);
	    }
        return 1;
	}
	if(pickupid == arenapickup4)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 31, 9999);
           GivePlayerWeapon(playerid, 25, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, -1129.8909, 1057.5424, 1346.4141);
           SetPlayerInterior(playerid, 10);
           pInArena4[playerid]=1;
           format(bitch,sizeof(bitch),"*** %s joined Arena 4 (M4 & Shotgun)",bitch);
           SendClientMessageToAll(COLOR_GRAD1,bitch);
	    }
        return 1;
	}
	if(pickupid == arenapickup5)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           GivePlayerWeapon(playerid, 24, 9999);
           GivePlayerWeapon(playerid, 30, 9999);
           SetPlayerHealth(playerid, 100);
           SetPlayerArmour(playerid, 100);
           SetPlayerPos(playerid, 486.4857,-3.1394,1002.3828);
           SetPlayerInterior(playerid, 17);
           pInArena5[playerid]=1;
           format(bitch,sizeof(bitch),"*** %s joined Arena 5 (Ak47 & Deagle)",bitch);
           SendClientMessageToAll(COLOR_GRAD1,bitch);
	    }
        return 1;
	}

	if(pickupid == arenaexitpickup1)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           SetPlayerWeapons(playerid);
		   SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
		   SetPlayerArmour(playerid, 0);
           SetPlayerRandomSpawn(playerid);
           pInArena1[playerid]=0;
	    }
        return 1;
	}
	if(pickupid == arenaexitpickup2)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           SetPlayerWeapons(playerid);
		   SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
		   SetPlayerArmour(playerid, 0);
           SetPlayerRandomSpawn(playerid);
           pInArena2[playerid]=0;
	    }
        return 1;
	}
	if(pickupid == arenaexitpickup3)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           SetPlayerWeapons(playerid);
		   SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
		   SetPlayerArmour(playerid, 0);
           SetPlayerRandomSpawn(playerid);
           pInArena3[playerid]=0;
	    }
        return 1;
	}
	if(pickupid == arenaexitpickup4)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           SetPlayerWeapons(playerid);
		   SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
		   SetPlayerArmour(playerid, 0);
           SetPlayerRandomSpawn(playerid);
           pInArena4[playerid]=0;
	    }
        return 1;
	}
	if(pickupid == arenaexitpickup5)
	{
        if (PlayerInfo[playerid][pLevel] > 2)
		{
           ResetPlayerWeapons(playerid);
           SetPlayerWeapons(playerid);
		   SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
		   SetPlayerArmour(playerid, 0);
           SetPlayerRandomSpawn(playerid);
           pInArena5[playerid]=0;
	    }
        return 1;
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
if(dialogid == 3)
	{
	if(response == 1)
		{
		if(listitem == 0)
		    {
		    PlayAudioStreamForPlayer(playerid, "http://yp.shoutcast.com/sbin/tunein-station.pls?id=389248");
            SendClientMessage(playerid,COLOR_GRAD1,"RADIO: You are listening now to: Radio Pop");
		    return 1;
		    }
		 if(listitem == 1)
		    {
            PlayAudioStreamForPlayer(playerid, "http://yp.shoutcast.com/sbin/tunein-station.pls?id=8318");
            SendClientMessage(playerid,COLOR_GRAD1,"RADIO: You are listening now to: Radio HipHop");
            }
         if(listitem == 2)
		    {
            PlayAudioStreamForPlayer(playerid, "http://yp.shoutcast.com/sbin/tunein-station.pls?id=5266");
            SendClientMessage(playerid,COLOR_GRAD1,"RADIO: You are listening now to: Radio Videogame Music");
		    }
         if(listitem == 3)
		    {
            PlayAudioStreamForPlayer(playerid, "http://live.radiotaraf.ro:8181");
            SendClientMessage(playerid,COLOR_GRAD1,"RADIO: You are listening now to: Radio Taraf");
		    }
		 if(listitem == 4)
		    {
		    StopAudioStreamForPlayer(playerid);
            SendClientMessage(playerid,COLOR_GRAD1,"RADIO: Radio is now off");
		    return 1;
		    }
		    }
		    }
if(dialogid == 9)
 {
 if(response)
 {
 new tmppass[64];
 new idx;
 new tmp[256];
 tmp = strtok(inputtext, idx);
 		if (gPlayerLogged[playerid] == 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, "SERVER: You are already logged in.");
			return 1;
		}
		if(!strlen(tmp))
		{
			ShowPlayerDialog(playerid, 9, DIALOG_STYLE_PASSWORD, "{076F13}Login your account", "{F0FF00}Welcome back,\n{FFFFFF}put your password here\nfor login in Public Enemy: Los Santos server.\n{FF0000}Try using another password.", "Login", "");
			return 1;
		}
 		strmid(tmppass, tmp, 0, strlen(inputtext), 255);
		Encript(tmppass);
		if (gdebug){printf("DEBUG enterd %s", tmppass);}
		OnPlayerLogin(playerid,tmppass);
			}
		else
		{
		ShowPlayerDialog(playerid, 9, DIALOG_STYLE_PASSWORD, "{076F13}Login your account", "{F0FF00}Welcome back,\n{FFFFFF}put your password here\nfor login in Public Enemy: Los Santos server.\n{FF0000}Login or leave the server.", "Login", "");
		}
		}
if(dialogid == 10)
 {
 if(response)
 {
 new idx;
 new tmp[256];
 new string[256];
 new playername[MAX_PLAYER_NAME];
		tmp = strtok(inputtext, idx);
		if(!strlen(tmp))
		{
			ShowPlayerDialog(playerid, 10, DIALOG_STYLE_PASSWORD, "{076F13}Create an account", "{F0FF00}Welcome,\n{FFFFFF}choose your password\nfor register in Public Enemy: Los Santos server.\n{FF0000}Try using another password.", "Create", "");
			return 1;
		}
		if (gPlayerAccount[playerid] == 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, "SERVER: You already have an account.");
			return 1;
		}
		gPlayerAccount[playerid] = 1;

		strmid(PlayerInfo[playerid][pPassword], tmp, 0, strlen(inputtext), 255);
		Encript(PlayerInfo[playerid][pPassword]);
		GetPlayerName(playerid, playername, sizeof(playername));
		format(string, sizeof(string), "%s.cer", playername);
		PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
		new File: file = fopen(string, io_read);
		if (file)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   That nick is registered");
			fclose(file);
			return 1;
		}
		printf("%s has created an account.", playername);
		new File:hFile;
		hFile = fopen(string, io_append);
		new var[32];//
		format(inputtext, 32, "%s\n", PlayerInfo[playerid][pPassword]);fwrite(hFile, inputtext);
		format(var, 32, "%d pCash\n", PlayerInfo[playerid][pCash]);fwrite(hFile, var);
		format(var, 32, "%d pAccount\n", PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
		format(var, 32, "%d pAdmin\n", PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
		format(var, 32, "%d pLevel\n", PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
		format(var, 32, "%d pExp\n", PlayerInfo[playerid][pExp]);fwrite(hFile, var);
		format(var, 32, "%d gPupgrade\n", PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
		format(var, 32, "%d pKills\n", PlayerInfo[playerid][pKills]);fwrite(hFile, var);
		format(var, 32, "%d pCB\n", PlayerInfo[playerid][pCB]);fwrite(hFile, var);
		format(var, 32, "%d pHW\n", PlayerInfo[playerid][pHW]);fwrite(hFile, var);
		format(var, 32, "%d pSR\n", PlayerInfo[playerid][pSR]);fwrite(hFile, var);
		format(var, 32, "%d pWA\n", PlayerInfo[playerid][pWA]);fwrite(hFile, var);
		format(var, 32, "%d pPEN\n", PlayerInfo[playerid][pPEN]);fwrite(hFile, var);
		format(var, 32, "%d pGun1\n", PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
		format(var, 32, "%d pGun2\n", PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
		format(var, 32, "%d pGun3\n", PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
		format(var, 32, "%d pGun4\n", PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
		format(var, 32, "%d pGun5\n", PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
		format(var, 32, "%d pGun6\n", PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo1\n", PlayerInfo[playerid][pAmmo1]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo2\n", PlayerInfo[playerid][pAmmo2]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo3\n", PlayerInfo[playerid][pAmmo3]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo4\n", PlayerInfo[playerid][pAmmo4]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo5\n", PlayerInfo[playerid][pAmmo5]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo6\n", PlayerInfo[playerid][pAmmo6]);fwrite(hFile, var);
		format(var, 32, "%f pSHealth\n", PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
		format(var, 32, "%f pHealth\n", PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
		format(var, 32, "%f pPos_x\n", PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
		format(var, 32, "%f pPos_y\n", PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
		format(var, 32, "%f pPos_z\n", PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
		if(accountplay)
		{
			PlayerInfo[playerid][pInt] = 0;
		}
		format(var, 32, "%d pInt\n", PlayerInfo[playerid][pInt]);fwrite(hFile, var);
		format(var, 32, "%d pLocal\n", PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
		format(var, 32, "%d pTeam\n", PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
		format(var, 32, "%d pModel\n", PlayerInfo[playerid][pModel]);fwrite(hFile, var);
		format(var, 32, "%d pPnumber\n", PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
		format(var, 32, "%d pPhousekey\n", PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
		format(var, 32, "%d pPbiskey\n", PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
		fclose(hFile);
		OnPlayerLogin(playerid,PlayerInfo[playerid][pPassword]);
			}
		else
		{
		ShowPlayerDialog(playerid, 10, DIALOG_STYLE_PASSWORD, "{076F13}Create an account", "{F0FF00}Welcome,\n{FFFFFF}choose your password\nfor register in Public Enemy: Los Santos server.\n{FF0000}Create an account or leave the server.", "Create", "");
        }
        }
    if(dialogid == 11)
    {
        if(!response) return ExpireDuel(playerid,IdDuel[playerid]);
        if(response)
        {
            UsingArena = true;
            new name[MAX_PLAYER_NAME], string[256];
            GetPlayerName(playerid, name, sizeof(name));
            format(string, sizeof(string), "DUEL: %s accepted the duel invite, wait 8 seconds to start",name);
            SendClientMessage(IdDuel[playerid],COLOR_YELLOW,string);
            SendClientMessage(playerid,COLOR_YELLOW,"DUEL: You accepted the duel, wait 8 seconds to start");
            SetTimerEx("GoDuel",8000,false,"ii",playerid,IdDuel[playerid],wep1[playerid],wep2[playerid]);
        }
        return true;
    }
    return 1;
}

ShowNews()
{
	new News[1024];
	strcat(News, "{F0FF00}News from 06/04/2016 | v6 (alpha)\n\
				  \n\
				  {FFFFFF}Removed heal when you kill someone\n\
                  {FFFFFF}Fixed race checkpoint when race finish\n\
                  {FFFFFF}Added limit for pen for don't let him leave LS\n\
                  {FFFFFF}Fixed other few bugs that was making trouble\n\
				  ");

	return News;
}

ShowCredits()
{
	new Credits[1024];
	strcat(Credits, "{F0FF00}Scripter:\n\
				     {FFFFFF}[RBK]shendlaw\n\
				     \n\
				     {F0FF00}Server Owners:\n\
				     {FFFFFF}RBK Brigades\n\
				     {FFFFFF}DjJunior\n\
					 \n\
					 {F0FF00}Scripts & Help:\n\
					 {FFFFFF}www.sa-mp.com\n\
					 {FFFFFF}www.sa-mp.ro\n\
					 {FFFFFF}[RBK]Zaster\n\
					 {FFFFFF}[KHK]Khalid\n\
					 \n\
					 {F0FF00}Based on:\n\
	                 {FFFFFF}Original PEN:LS\n\
					 {FFFFFF}by Denver(Astro)");

	return Credits;
}

ShowHelp()
{
	new Help[1024];
	strcat(Help, "{F0FF00}Public Enemy: Los Santos\n");
	strcat(Help, "\n");
	strcat(Help, "{FFFFFF}Hi, welcome to Public Enemy: Los Santos, this gamemode was created in 2006 by Astro, taked by [RBK]shendlaw in 2016 for bring back\n");
	strcat(Help, "{FFFFFF}the best gamemode ever created on SA:MP, we are trying to improve this gamemode by adding new features and bringing you guys entrainment.\n");
	strcat(Help, "{FFFFFF}This gamemode got 4 awesome missions that can be played every 10 minutes, who will win the mission will become the Public Enemy No.1, and\n");
    strcat(Help, "{FFFFFF}if someone of you will kill him, will get the reward of completed mission, but this is not only, the server got a RPG system with 2 factions,\n");
    strcat(Help, "{FFFFFF}houses, businesses and much cool stuff more! In your free time you can DeathMatch where you want in the map, or do it at DM Arenas located at\n");
    strcat(Help, "{FFFFFF}Ammunation. Hope you will enjoy playing there, stay with us and we won't disappoint you!\n");
    strcat(Help, "\n");
    strcat(Help, "{FF0000}For more informations try out: /cmds /news /credits /rules");

	return Help;
}

ShowCmdsPage1(playerid)
{
	new Cmds1[1200];
	strcat(Cmds1, "{FF0000}*** ACCOUNT ***{FFFFFF} /rules /changenick /changepass /mystats /buylevel /upgrade\n");
	strcat(Cmds1, "{FF0000}*** GAME ***{FFFFFF} /radio /weather /time /lounge /contract /enter /exit /stats /duel /animlist\n");
	strcat(Cmds1, "{FF0000}*** GENERAL ***{FFFFFF} /pay /charity /checktime /buy /votekick /vote /unrentcar /givekey /switchkey\n");
    strcat(Cmds1, "{FF0000}*** GENERAL ***{FFFFFF} /resetupgrades /betrace /betdm /bets /buygun /bestbuy /bestsale /id\n");
    strcat(Cmds1, "{FF0000}*** CHAT ***{FFFFFF} (/w)hisper (/o)oc (/s)hout (/l)ocal (/ad)vertise /me /togooc /pm\n");
    strcat(Cmds1, "{FF0000}*** BANK ***{FFFFFF} /balance /withdraw /deposit /wiretransfer /loan, ATM Only: /balance /withdraw\n");
        if (gTeam[playerid] == 2)
		{
			strcat(Cmds1, "{FF0000}*** SAPD ***{FFFFFF} /r(team radio) (/d)epartments (/m)egaphone (/su)spect /mdc /free /jail /duty /lock\n");
		}
		if (gTeam[playerid] == 1)
		{
			strcat(Cmds1, "{FF0000}*** SAMD ***{FFFFFF} /r(team radio) (/d)epartments /heal /lock\n");
		}
    strcat(Cmds1, "{FF0000}*** CELLPHONE ***{FFFFFF} (/c)all 'eg: /call 911' /sms (/p)ickup (/h)angup /number\n");
    strcat(Cmds1, "{FF0000}*** HOUSE ***{FFFFFF} /enter /exit /lock /home /heal /houseupgrade (/hu) /setrentable /tv (off/dm/race/pen/door)\n");
    strcat(Cmds1, "{FF0000}*** HOUSE ***{FFFFFF} /carupgrade /carcolor /evictall /towcar /fixcar /modcar /modst /modlr /setrent /evict /housewithdraw\n");
    strcat(Cmds1, "{FF0000}*** RENT ***{FFFFFF} /unrent /enter /exit /lock /home\n");
    strcat(Cmds1, "{FF0000}*** BUSINESS ***{FFFFFF} /bizinfo /compprice /pricemod /bizfee\n");
    strcat(Cmds1, "{FF0000}*** BUSINESS ***{FFFFFF} /lock /sellbiz /bizwithdraw /bizupgrade\n");
    if (gRaceGuy[playerid])
		{
	strcat(Cmds1, "{FF0000}*** RACE EDIT ***{FFFFFF} /cp /racedelay /laps /randomrace /racelist /setrace /saverace /loadrace");
		}
	return Cmds1;
}

ShowAdminCmds(playerid)
{
	new ACmds1[1024];
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	strcat(ACmds1, "{FF0000}*1* MODERATOR ***{FFFFFF} /pstats /setint /mute /kick /ban /goto /cnn /a(dmin) chat\n");
	}
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
	strcat(ACmds1, "{FF0000}*2* ADMIN ***{FFFFFF} /skydive /setteam /bigears /ps /cnn /addcop /addmed /freeze /thaw /ajail /unjail /recon /cam\n");
	}
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
	strcat(ACmds1, "{FF0000}*3* ADMIN ***{FFFFFF} /noooc /makeadmin /fourdive /dmweapon /loaddm /savedm /sp /startdm /stopdm /gotols /unban\n");
	strcat(ACmds1, "{FF0000}*3* ADMIN ***{FFFFFF} /cashbox /streetrace /hotwire /endround /mark /gotomark /gotolv /gotosf /gethere /tod\n");
	}
	if (PlayerInfo[playerid][pAdmin] >= 1337)
	{
	strcat(ACmds1, "{FF0000}*1337* ADMIN ***{FFFFFF} /loadpl /savepl /sban /givehealth /givegun /givemoney /makeadmin /gmx /asellhouse /tod /gotocar /sslap\n");
	strcat(ACmds1, "{FF0000}*1337* ADMIN ***{FFFFFF} /mole /hq /logout /logoutpl /logoutall /drop /pos /test /spawn /incmis /editlevel /editprod\n");
	}
	return ACmds1;
}

ShowRules()
{
	new Rules[1024];
	strcat(Rules, "{F0FF00}For all rules you must check: http://rbkbrigades.tk\n");
	strcat(Rules, "\n");
	strcat(Rules, "{FFFFFF}No Cheating, No carkill, No spam, No spawnkill, No flame,\n");
	strcat(Rules, "{FFFFFF}No caps, No Joypad, No team-kill, No ads,\n");
	strcat(Rules, "{FFFFFF}Don't help the PENo1, Don't shoot during a street race,\n");
	strcat(Rules, "\n");
	strcat(Rules, "{FF0000}Check our forum if you don't want to get banned or kicked.\n");
	return Rules;
}

ShowAnims()
{
	new Anims[1024];
	strcat(Anims, "{F0FF00}Use /stopanim to stop an animation\n");
	strcat(Anims, "\n");
	strcat(Anims, "{FFFFFF}/pee /handsup /drunk /bomb /vomit /eat /slapass\n");
	strcat(Anims, "/crack /fu /taichi /hurt /box /wank /smoke /dance\n");
	return Anims;
}

ShowStats(playerid)
{
    new Stats[1200];
    new nxtlevel = PlayerInfo[playerid][pLevel]+1;
	GetPlayerName(playerid,Stats,sizeof Stats);
	format(Stats,sizeof Stats,"{F0FF00}*** %s's Stats ***\n\n",Stats);
    format(Stats, sizeof Stats, "%s{F0FF00}General Informations\n{FF0000}Player Level: {FFFFFF}[%d]\n{FF0000}Spawn Health: {FFFFFF}[%.1f]\n{FF0000}Wallet Cash: {FFFFFF}[$%d]\n{FF0000}Bank Cash: {FFFFFF}[$%d]\n{FF0000}Phone Number: {FFFFFF}[%d]\n\n", Stats, PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pSHealth] + 50, GetPlayerMoney(playerid), PlayerInfo[playerid][pAccount], PlayerInfo[playerid][pPnumber]);
    format(Stats, sizeof Stats, "%s{F0FF00}Completed Stuff\n{FF0000}CashBox: {FFFFFF}[%d/4]\n{FF0000}HotWire: {FFFFFF}[%d/4]\n{FF0000}StreetRace: {FFFFFF}[%d/4]\n{FF0000}Service: {FFFFFF}[%d/20]\n\n", Stats, PlayerInfo[playerid][pCB], PlayerInfo[playerid][pHW], PlayerInfo[playerid][pSR], PlayerInfo[playerid][pWA]);
    format(Stats, sizeof Stats, "%s{F0FF00}Kills & Level\n{FF0000}Kills: {FFFFFF}[%d/30]\n{FF0000}PENo.1 Kills: {FFFFFF}[%d/4]\n{FF0000}Next Level: {FFFFFF}[$%d]\n{FF0000}Completed Exp: {FFFFFF}[%d/%d]\n\n", Stats, PlayerInfo[playerid][pKills], PlayerInfo[playerid][pPEN], nxtlevel*levelcost, PlayerInfo[playerid][pExp], nxtlevel*levelexp);
	return Stats;
}

ShowStatsClicked(clickedplayerid)
{
    new StatsClicked[1200];
    new nxtlevel = PlayerInfo[clickedplayerid][pLevel]+1;
	GetPlayerName(clickedplayerid,StatsClicked,sizeof StatsClicked);
	format(StatsClicked,sizeof StatsClicked,"{F0FF00}*** %s's Stats ***\n\n",StatsClicked);
    format(StatsClicked, sizeof StatsClicked, "%s{F0FF00}General Informations\n{FF0000}Player Level: {FFFFFF}[%d]\n{FF0000}Spawn Health: {FFFFFF}[%.1f]\n{FF0000}Wallet Cash: {FFFFFF}[$%d]\n{FF0000}Bank Cash: {FFFFFF}[$%d]\n{FF0000}Phone Number: {FFFFFF}[%d]\n\n", StatsClicked, PlayerInfo[clickedplayerid][pLevel], PlayerInfo[clickedplayerid][pSHealth] + 50, GetPlayerMoney(clickedplayerid), PlayerInfo[clickedplayerid][pAccount], PlayerInfo[clickedplayerid][pPnumber]);
    format(StatsClicked, sizeof StatsClicked, "%s{F0FF00}Completed Stuff\n{FF0000}CashBox: {FFFFFF}[%d/4]\n{FF0000}HotWire: {FFFFFF}[%d/4]\n{FF0000}StreetRace: {FFFFFF}[%d/4]\n{FF0000}Service: {FFFFFF}[%d/20]\n\n", StatsClicked, PlayerInfo[clickedplayerid][pCB], PlayerInfo[clickedplayerid][pHW], PlayerInfo[clickedplayerid][pSR], PlayerInfo[clickedplayerid][pWA]);
    format(StatsClicked, sizeof StatsClicked, "%s{F0FF00}Kills & Level\n{FF0000}Kills: {FFFFFF}[%d/30]\n{FF0000}PENo.1 Kills: {FFFFFF}[%d/4]\n{FF0000}Next Level: {FFFFFF}[$%d]\n{FF0000}Completed Exp: {FFFFFF}[%d/%d]\n\n", StatsClicked, PlayerInfo[clickedplayerid][pKills], PlayerInfo[clickedplayerid][pPEN], nxtlevel*levelcost, PlayerInfo[clickedplayerid][pExp], nxtlevel*levelexp);
	return StatsClicked;
}


public OnPlayerClickPlayer(playerid,clickedplayerid,source)
{
ShowPlayerDialog(playerid, 12, DIALOG_STYLE_MSGBOX, "{076F13}Stats", ShowStatsClicked(clickedplayerid), "Ok", "");
return 1;
}

public ExecuteCount(playerid,pid)
{
    if (Counting > 0)
    {
        GameTextForPlayer(playerid,CountDueling[Counting-1], 2500, 3);
        GameTextForPlayer(pid,CountDueling[Counting-1], 1000, 3);
        Counting--;
        SetTimerEx("GoDuel",1000,false,"ii",playerid,pid);
    }
    else
    {
        GameTextForPlayer(playerid,"~>~~g~Go~w~Go~r~Go~b~Go~<~", 2500, 3);
        GameTextForPlayer(pid,"~>~~g~Go~w~Go~r~Go~b~Go~<~", 2500, 3);
        Counting = 5;
        TogglePlayerControllable(playerid,true);
        TogglePlayerControllable(pid,true);
    }
    return true;
}

public GoDuel(playerid,pid,w1,w2)
{
	SetPlayerPos(playerid, -1381.5552, 1260.8600, 1039.8672);
	SetPlayerPos(pid, -1411.3805, 1231.7291, 1039.8672);
	SetPlayerInterior(playerid, 16);
	SetPlayerInterior(pid, 16);
	SetPlayerHealth(pid, 100);
    SetPlayerArmour(pid, 100);
	SetPlayerHealth(playerid, 100);
    SetPlayerArmour(playerid, 100);
    GivePlayerWeapon(playerid,w1,999999);
    GivePlayerWeapon(playerid,w2,999999);
    GivePlayerWeapon(pid,w1,999999);
    GivePlayerWeapon(pid,w2,999999);
    InvitedDuel[playerid] = true;
    InvitedDuel[pid] = true;
    TogglePlayerControllable(playerid,false);
    TogglePlayerControllable(pid,false);
    ExecuteCount(playerid,pid);
    return true;
}

public ExpireDuel(playerid,pid)
{
    if(UsingArena == false)
    {
        SendClientMessage(pid,COLOR_WHITE,"DUEL: Duel request expired");
        SendClientMessage(playerid,COLOR_WHITE,"DUEL: Duel request expired, you refused the invite");
        InvitedDuel[pid] = false;
        InvitedDuel[playerid] = false;
        IdDuel[playerid] = playerid;
        IdDuel[pid] = pid;
        ResetPlayerWeapons(playerid);
    }
    return true;
}

IsValidWeapon(weaponid)
{
        new badWeapon[21] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 40, 44, 45, 46};
        for(new i=0; i <20; i++)
			if (weaponid == badWeapon[i])
				return false;
        return true;
}

AntiDeAMX()
{
        new a[][] =
        {
        "Unarmed (Fist)",
        "Brass K"
        };
        #pragma unused a
}

public TextDraws()
{
PE = TextDrawCreate(529.000000, 405.000000, "~g~~h~Public Enemy");
TextDrawBackgroundColor(PE, 85);
TextDrawFont(PE, 1);
TextDrawLetterSize(PE, 0.310000, 1.600000);
TextDrawColor(PE, -1);
TextDrawSetOutline(PE, 1);
TextDrawSetProportional(PE, 1);

LS = TextDrawCreate(561.000000, 418.000000, "~w~Los ~r~Santos");
TextDrawBackgroundColor(LS, 85);
TextDrawFont(LS, 1);
TextDrawLetterSize(LS, 0.310000, 1.600000);
TextDrawColor(LS, -1);
TextDrawSetOutline(LS, 1);
TextDrawSetProportional(LS, 1);

Mode = TextDrawCreate(523.000000, 431.000000, "~r~DM ~w~/ ~r~Missions ~w~/ ~r~RPG");
TextDrawBackgroundColor(Mode, 85);
TextDrawFont(Mode, 1);
TextDrawLetterSize(Mode, 0.310000, 1.600000);
TextDrawColor(Mode, -1);
TextDrawSetOutline(Mode, 1);
TextDrawSetProportional(Mode, 1);

Version = TextDrawCreate(88.000000, 430.000000, "~y~v6 (alpha)_");
TextDrawAlignment(Version, 2);
TextDrawBackgroundColor(Version, 85);
TextDrawFont(Version, 1);
TextDrawLetterSize(Version, 0.310000, 1.600000);
TextDrawColor(Version, -1);
TextDrawSetOutline(Version, 1);
TextDrawSetProportional(Version, 1);

Site = TextDrawCreate(510.000000, 3.000000, "~b~~h~www.rbk~y~brig~r~ades.tk");
TextDrawBackgroundColor(Site, 85);
TextDrawFont(Site, 3);
TextDrawLetterSize(Site, 0.310000, 1.600000);
TextDrawColor(Site, -1);
TextDrawSetOutline(Site, 1);
TextDrawSetProportional(Site, 1);
}

public OnPlayerFloodControl(playerid, iCount, iTimeSpan) {
	if(iCount > 2 && iTimeSpan < 8000) {
		Ban(playerid);
	}
}

public KickWithMsg(playerid)
{
	Kick(playerid);
}

public OnPlayerPaused(playerid, status, time)
{
    if(gPublicEnemy == playerid)
    {
		if(status == 1 && time == 30)
		{
        new string[256];
        new bitch[256];
  		gPublicEnemy = INVALID_PLAYER_ID;
		GivePlayerMoney(playerid, -reward);
		KillTimer(offhook);
  
		GetPlayerName(playerid,bitch,sizeof(bitch));
        format(string, sizeof(string), "%s has been kicked, reason: AFK as Public Enemy No.1", bitch, time);
        SendClientMessageToAll(COLOR_RED, string);
        SetTimerEx("KickWithMsg", 1000, 0, "d", playerid);
        }
    }
    if(PlayerInLounge[playerid] == 0)
    {
        if(status == 1 && time == 60)
		{
		SetPlayerPos(playerid, -794.9882,492.3308,1376.1953);
	    SetPlayerInterior(playerid, 1);
	    SendClientMessage(playerid,COLOR_GRAD1,"SERVER: Next time use /lounge to go AFK, do /lounge to get back playing.");
	    PlayerInLounge[playerid]=1;
	    ResetPlayerWeapons(playerid);
		}
     }
    return true;
}

public DropPlayerWeapons(playerid)
{
    new playerweapons[13][2];
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid, x, y, z);//here gets your position..!

	for(new i=0; i<13; i++)
	{
    	GetPlayerWeaponData(playerid, i, playerweapons[i][0], playerweapons[i][1]);
    	new model = GetWeaponType(playerweapons[i][0]);// this to get, what weapons are you using in the moment !
		new times = floatround(playerweapons[i][1]/10.0001);
    	new Float:X = x + (random(3) - random(3));
    	new Float:Y = y + (random(3) - random(3));
    	if(playerweapons[i][1] != 0 && model != -1)
		{
		    if(times > DropLimit) times = DropLimit;
	    	for(new a=0; a<times; a++)
			{
				new pickupid = CreatePickup(model, 3, X, Y, z);//this is the place where you die, there you will drop your weapons !
				SetTimerEx("DeletePickup", DeleteTime*1000, false, "d", pickupid);//there you may change the time 1 *1000 to *19283718293712 whatever...!
			}
		}
	}
	return 1;
}

public DeletePickup(pickupid)
{
	DestroyPickup(pickupid);
	return 1;
}

GetWeaponType(weaponid) //explainin'
{
	switch(weaponid)
	{
	    case 1: return 331; case 2: return 333; case 3: return 334; // this is to define the weapons
		case 4: return 335; case 5: return 336; case 6: return 337;
		case 7: return 338; case 8: return 339; case 9: return 341;
		case 10: return 321; case 11: return 322; case 12: return 323;
		case 13: return 324; case 14: return 325; case 15: return 326;
		case 16: return 342; case 17: return 343; case 18: return 344;
		case 22: return 346; case 23: return 347; case 24: return 348;
		case 25: return 349; case 26: return 350; case 27: return 351;
		case 28: return 352; case 29: return 353; case 30: return 355;
		case 31: return 356; case 32: return 372; case 33: return 357;
		case 34: return 358; case 35: return 359; case 36: return 360;
		case 37: return 361; case 38: return 362; case 39: return 363;
		case 41: return 365; case 42: return 366; case 46: return 371; //example, this case is the id 46 is the parachute, we will drop the parachute, that's if  you got one
	}
	return -1;
}
