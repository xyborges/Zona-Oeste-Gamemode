new PlayerBar:barra[MAX_PLAYERS];
new timerbala[MAX_PLAYERS][25];
new PlayerLimite[MAX_PLAYERS][25];
static limitetiros[] = {
	
	5, // 22 M9 
	5, // 23 M9 SD
	3, // 24 Desert 

		// Shotgun
	5, // 25 Shotgun
	5, // 26 Sawnoff 
	5, // 27 Spas 12

		// Automatic
	7, // 28 Mac 10
	7, // 29 MP5
	8, // 30 AK-47
	8, // 31 M16
	7, // 32 Tec 9 

		// Rifle
	3, // 33 Rifle
	3, // 34 Sniper

		// Heavy
	2, // 35 RPG
	2, // 36 Heatseeker
	2, // 37 Flamer
	25// 38 Minigun

};	
new PlayerLimite[MAX_PLAYERS][25];
new timerbala[MAX_PLAYERS][25];
forward diminuirtemperatura(playerid, weapon);
public diminuirtemperatura(playerid, weapon){
	if(PlayerLimite[playerid][weapon] == 0) return KillTimer(timerbala[playerid][weapon]);
	PlayerLimite[playerid][weapon] -= 1;
	SetPlayerProgressBarValue(playerid, barra[playerid], PlayerLimite[playerid][weapon]);
	if(WEAPON:weapon+WEAPON:22 == WEAPON:GetPlayerWeapon(playerid))
		ShowProgressTemp(playerid);
	else
		HideProgressTemp(playerid);

	return 1;
}
GetWeaponTemp(playerid, weapon)
	return PlayerLimite[playerid][weapon];
GetWeaponLimit(weapon)
	return limitetiros[weapon];
ShowProgressTemp(playerid)
	return ShowPlayerProgressBar(playerid, barra[playerid]);
HideProgressTemp(playerid)
	return HidePlayerProgressBar(playerid, barra[playerid]);

CriarBarraTemperatura(playerid){
	if(!IsValidPlayerProgressBar(playerid, barra[playerid])){
		barra[playerid] = CreatePlayerProgressBar(playerid, 547.000000, 128.000000, 62.000000, 4.000000, -16776961, 100.000000, 0);
		SetPlayerProgressBarValue(playerid, barra[playerid], 0.0);
	}
}
ResetTemperatura(playerid){
	for(new i; i < sizeof PlayerLimite; i++)
		PlayerLimite[playerid][i] = 0;

	for(new i; i < sizeof timerbala; i++){
		if(IsValidTimer(timerbala[playerid][i]))
			KillTimer(timerbala[playerid][i]);
	}

	SetPlayerProgressBarValue(playerid, barra[playerid], 0.0);
	HideProgressTemp(playerid);
}
forward diminuirtemperatura(playerid, weapon);
public diminuirtemperatura(playerid, weapon){
	if(PlayerLimite[playerid][weapon] == 0) return KillTimer(timerbala[playerid][weapon]);
	PlayerLimite[playerid][weapon] -= 1;
	SetPlayerProgressBarValue(playerid, barra[playerid], PlayerLimite[playerid][weapon]);
	if(WEAPON:weapon+WEAPON:22 == WEAPON:GetPlayerWeapon(playerid))
		ShowProgressTemp(playerid);
	else
		HideProgressTemp(playerid);

	return 1;
}
/*
modeexit
	foreach(new i: Player){ 
		if(IsPlayerConnected(i))
			DestroyAllPlayerProgressBars(i);
	
	}
*/
InitTemp(playerid){
	if(GetPlayerWeapon(playerid) >= WEAPON:22){
		SetPlayerProgressBarMaxValue(playerid, barra[playerid], GetWeaponLimit(GetPlayerWeapon(playerid)-WEAPON:22));
		ShowProgressTemp(playerid);
		SetPlayerProgressBarValue(playerid, barra[playerid], PlayerLimite[playerid][GetPlayerWeapon(playerid) - WEAPON:22]);

	}
}
/*public OnPlayerWeaponShot(playerid, weaponid, BULLET_HIT_TYPE:hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(hittype == BULLET_HIT_TYPE:BULLET_HIT_TYPE_VEHICLE && IsBlindado(hitid)){
		return 0;
	}
	if(PlayerInfo[playerid][Nivel] < 2 && !IsPolice(PlayerInfo[playerid][Org])){
		SetPlayerAmmo(playerid, WeaponSlot(weaponid), 0);
		AvisosArma[playerid] ++;
		SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de no minimo nivel 2 para usar um armamento, voce sera kickado caso persista em utilizar armas.");
		if(AvisosArma[playerid] >= 2){
			AvisosArma[playerid] = 0;
			SendClientMessageToAll(LIGHTBLUE, fString("*(%d)%s foi kickado por suspeita de Gun-Cheats.",PlayerInfo[playerid][IDFixo], nome(playerid)));
			Kick(playerid);
		}
	}
	if(GetPlayerWeapon(playerid) >= WEAPON_COLT45){ // ter certeza de que estou tratando com uma arma que está na array de temperatura
		new weap = weaponid - 22;
		// caso o jogador dispare novamente e o timer ja exista ( no caso de uma arma automática, por exemplo) o timer é destruido e recriado ( como se fosse necesário um 'tempo' para a arma esfriar)
		if(IsValidTimer(timerbala[playerid][weap])) KillTimer(timerbala[playerid][weap]);

		timerbala[playerid][weap] = SetTimerEx("diminuirtemperatura", 1100, true, "ii", playerid, weap);
		if(GetWeaponTemp(playerid, weap) >= GetWeaponLimit(weap)){
			if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER){
				Congelar(playerid, 2);
				PlayerLimite[playerid][weap] = GetWeaponLimit(weap);
				SendClientMessage(playerid, LIGHTBLUE, "Sua arma esquentou, Aguarde alguns segundos.");
				SetPlayerProgressBarMaxValue(playerid, barra[playerid], GetWeaponLimit(weap));
				return 0;
			}
		}
		else{
			PlayerLimite[playerid][weap]++;
			SetPlayerProgressBarValue(playerid, barra[playerid], PlayerLimite[playerid][weap]);
		}
	} 
	return 1;
}*/
public OnPlayerChangeWeapon(playerid, are, was){
	HideProgressTemp(playerid);
	InitTemp(playerid);
	return 1;
}