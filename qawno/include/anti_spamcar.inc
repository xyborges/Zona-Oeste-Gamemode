
// Kuddy's Anti Car Spam

new FloodControl[MAX_PLAYERS],
    gb_as@con[MAX_PLAYERS] = {true, ...},
    gi_as@non[MAX_PLAYERS],
    gi_as@car[MAX_PLAYERS];

public OnGameModeInit()
{
    SetTimer("UpdateAntiSpam", 600, true);
    for(new i; i < MAX_PLAYERS; i ++)
    {
        if(!IsPlayerConnected(i)) continue;
        else SetTimerEx("decon", 3000, false, "d", i);
    }
    return 1;
}

#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect OnPlayerConnect
#endif
public OnPlayerConnect(playerid)
{
    gb_as@con[playerid] = true;
    gi_as@non[playerid] = 0;
    gi_as@car[playerid] = 0;
    return 1;
}

public OnPlayerSpawn(playerid) return SetTimerEx("decon", 3000, false, "d", playerid), 0x1;

public OnPlayerExitVehicle(playerid, vehicleid)
{
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(gb_as@con[playerid]) return 1;
    if(newstate == 2)
    {
        if(GetTickCount() - 600 < FloodControl[playerid]) PunirSpam(playerid);
        FloodControl[playerid] = GetTickCount();
        gi_as@non[playerid] = 1;
        gi_as@car[playerid] = GetPlayerVehicleID(playerid);
    }
    else
    {
        if(GetTickCount() - 600 < FloodControl[playerid]) PunirSpam(playerid);
        FloodControl[playerid] = GetTickCount();
        gi_as@non[playerid] = 0;
    }
    return 1;
}

forward decon(playerid);
public decon(playerid) return gb_as@con[playerid] = false, 0x1;

public OnPlayerUpdate(playerid)
{
    if(gi_as@non[playerid] != 0)
    {
        if(gi_as@car[playerid] != GetPlayerVehicleID(playerid)) PunirSpam(playerid);
    }
    return 1;
}

PunirSpam(playerid)
{
    CallRemoteFunction("OnPlayerCarCheat","i",playerid);// OPEN_MP_TAGS:...)
    return 1;
}


