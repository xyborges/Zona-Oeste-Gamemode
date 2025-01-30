#define SSCANF_NO_NICE_FEATURES
#include <a_samp>
#include <sscanf2>
#include <zcmd>
#include <streamer>
//#include "../scriptfiles/modulos/voip.inc"

public OnGameModeInit(){
	//CriarObjetosMAPA();
	SetTimer("Mensagem", 30000, true);
	return 1;
}
forward Mensagem();
public Mensagem(){
	SendClientMessageToAll(0x33ccffFF, "/veh /arma /skin /ir");
}
main(){return 1;}
static const Float:aleatoriopos[][] = {
	{1176.5670,-1668.1007,22.2344},
	{1202.7865,-1719.4417,13.5469},
	{1369.7628,-1738.5957,13.5469},
	{1535.9998,-1660.2532,13.5469},
	{1224.4777,-1411.5140,13.2753},
	{941.7363,-1798.8944,13.9759},
	{1398.9897,-1864.9669,13.5469}

};
public OnPlayerConnect(playerid){
	TogglePlayerSpectating(playerid, 1);
	TogglePlayerSpectating(playerid, 0);
	SpawnPlayer(playerid);
	new r = random(sizeof aleatoriopos);
	//SetSpawnInfo(playerid, team, skin, Float:spawnX, Float:spawnY, Float:spawnZ, Float:angle, WEAPON:weapon1 = WEAPON_FIST, ammo1 = 0, WEAPON:weapon2 = WEAPON_FIST, ammo2 = 0, WEAPON:weapon3 = WEAPON_FIST, ammo3 = 0)
	SetSpawnInfo(playerid, random(255), random(255), aleatoriopos[r][0], aleatoriopos[r][1], aleatoriopos[r][2], 35.0, 0, 0, 0, 0, 0, 0);//, Float:angle, WEAPON:weapon1 = WEAPON_FIST, ammo1 = 0, WEAPON:weapon2 = WEAPON_FIST, ammo2 = 0, WEAPON:weapon3 = WEAPON_FIST, ammo3 = 0)
	return 1;
}
public OnPlayerDisconnect(playerid, reason){
	//DestruirVoip(playerid);
	return 1;
}
public OnPlayerSpawn(playerid){
	new r = random(sizeof aleatoriopos);
	SetPlayerPos(playerid, aleatoriopos[r][0], aleatoriopos[r][1], aleatoriopos[r][2]);
	return 1;
}
nome(playerid){
	static name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	return name;
}
public OnPlayerText(playerid, text[]){
	static str[255];
	format(str, sizeof str, "%s cuspiu: %s", nome(playerid), text);
	SendClientMessageToAll(-1, str);
	return 0;
}
CMD:veh(playerid, params[]){
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, -1, "/veh [ id ]");
	if(id < 400) return 1;
	new Float:p[3];
	GetPlayerPos(playerid, p[0], p[1], p[2]);
	new veh = CreateVehicle(id, p[0], p[1], p[2], 90.0, random(255), random(255), -1);//, colour1, colour2, respawnDelay, bool:addSiren = false)
	PutPlayerInVehicle(playerid, veh, 0);
	return 1;
}

CMD:ir(playerid, params[]){
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, -1, "/ir [ id ]");
	if(!IsPlayerConnected(id)) return 1;
	new Float:p[3];
	GetPlayerPos(id, p[0], p[1], p[2]);
	SetPlayerPos(playerid, p[0], p[1], p[2]);
	return 1;
}
CMD:skin(playerid, params[]){
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, -1, "/skin [ 0 - 310]");
	if(0 > id > 310) return SendClientMessage(playerid, -1, "Essa skin nao existe!");
	SetPlayerSkin(playerid, id);
	return 1;	
}
CMD:arma(playerid, params[]){
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, -1, "/arma [ id ]");
	GivePlayerWeapon(playerid, id, 200);
	return 1;	
}