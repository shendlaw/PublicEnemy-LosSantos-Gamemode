/*
*	Onpause for sa-mp by Juan stone.
*	http://forum.sa-mp.com/member.php?u=232360
*/

#if !defined _samp_included
	#error "You must include a_samp before that Onpause"
#endif

#if defined _Onpause_included
	#endinput
#endif

#define _included_Onpause

enum E_DATA_PAUSED (<<= 0)
{
	E_PLAYER_PAUSED = 0,
	E_PLAYER_TIME_PAUSED,
	E_PLAYER_STATE_PAUSED
};

new
	PlayerPaused[MAX_PLAYERS][E_DATA_PAUSED], gHook_update, gHook_connect
	;

forward OnPlayerUpdatePause(); public OnPlayerUpdatePause()
{
	for(new playerid; playerid != MAX_PLAYERS; playerid++)
	{
	    if(IsPlayerConnected(playerid) && GetPlayerState(playerid) != 0)
	    {
	        if(GetTickCount()-PlayerPaused[playerid][E_PLAYER_PAUSED] >= 5000)
	        {
	            PlayerPaused[playerid][E_PLAYER_TIME_PAUSED] = PlayerPaused[playerid][E_PLAYER_TIME_PAUSED]+1, PlayerPaused[playerid][E_PLAYER_STATE_PAUSED] = 1;
	            return CallRemoteFunction("OnPlayerPaused", "iii", playerid, PlayerPaused[playerid][E_PLAYER_STATE_PAUSED], PlayerPaused[playerid][E_PLAYER_TIME_PAUSED]+5000/1000);
	        }
	        else if(GetTickCount()-PlayerPaused[playerid][E_PLAYER_PAUSED] <= 4999)
	        {
	            PlayerPaused[playerid][E_PLAYER_TIME_PAUSED] = 0, PlayerPaused[playerid][E_PLAYER_STATE_PAUSED] = 0;
	            return CallRemoteFunction("OnPlayerPaused", "iii", playerid, PlayerPaused[playerid][E_PLAYER_STATE_PAUSED], PlayerPaused[playerid][E_PLAYER_TIME_PAUSED]/1000);
	        }
	    }
	}
	return true;
}

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
    SetTimer("OnPlayerUpdatePause", 1000, true);
    gHook_connect = funcidx("Hook_OnPlayerConnect") != -1;
    gHook_update = funcidx("Hook_OnPlayerUpdate") != -1;
	return CallLocalFunction("Hook_OnFilterScriptInit", "");
}

#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif

#define OnFilterScriptInit Hook_OnFilterScriptInit

forward Hook_OnFilterScriptInit();

#else

public OnGameModeInit()
{
    SetTimer("OnPlayerUpdatePause", 1000, true);
    
    gHook_connect = funcidx("Hook_OnPlayerConnect") != -1;
	gHook_update = funcidx("Hook_OnPlayerUpdate") != -1;

	if(funcidx("Hook_OnGameModeInit") != -1)
	{
		return CallLocalFunction("Hook_OnGameModeInit", "");
	}
	return true;
}

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit Hook_OnGameModeInit

forward Hook_OnGameModeInit();

#endif

public OnPlayerConnect(playerid)
{
    PlayerPaused[playerid][E_PLAYER_PAUSED] = GetTickCount(), PlayerPaused[playerid][E_PLAYER_TIME_PAUSED] = 0, PlayerPaused[playerid][E_PLAYER_STATE_PAUSED] = 0;
	if(gHook_connect)
	{
		return CallLocalFunction("Hook_OnPlayerConnect", "i", playerid);
	}
	return true;
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect Hook_OnPlayerConnect

forward Hook_OnPlayerConnect(playerid);

public OnPlayerUpdate(playerid)
{
    PlayerPaused[playerid][E_PLAYER_PAUSED] = GetTickCount();
    gHook_update = funcidx("Hook_OnPlayerUpdate") != -1;

	if(gHook_update)
	{
		return CallLocalFunction("Hook_OnPlayerUpdate", "i", playerid);
	}
	return true;
}

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif

#define OnPlayerUpdate Hook_OnPlayerUpdate

forward Hook_OnPlayerUpdate(playerid);

stock GetPlayerStatePaused(playerid)
	return PlayerPaused[playerid][E_PLAYER_STATE_PAUSED];

stock GetPlayerTimePaused(playerid)
{
	if(GetPlayerStatePaused(playerid))
		return PlayerPaused[playerid][E_PLAYER_TIME_PAUSED]+5;

	if(!GetPlayerStatePaused(playerid))
	    return PlayerPaused[playerid][E_PLAYER_TIME_PAUSED];

	return PlayerPaused[playerid][E_PLAYER_TIME_PAUSED];
}

forward OnPlayerPaused(playerid, status, time);

/*
native GetPlayerStatePaused(playerid);
native GetPlayerTimePaused(playerid);
*/