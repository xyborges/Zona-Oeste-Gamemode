forward OnPlayerChangeWeapon(playerid, are, was);
static
	armapassada[MAX_PLAYERS];

CheckChangeWeapon(playerid){
	if( (GetPlayerWeapon(playerid) == WEAPON:0 && GetPlayerWeapon(playerid) != WEAPON:armapassada[playerid]) || GetPlayerWeapon(playerid) != WEAPON:armapassada[playerid]){ 
		CallRemoteFunction("OnPlayerChangeWeapon", "iii", playerid, GetPlayerWeapon(playerid), armapassada[playerid]);
		
	}
	else
		armapassada[playerid] = GetPlayerWeapon(playerid);
}