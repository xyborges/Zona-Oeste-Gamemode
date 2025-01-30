static deletematime[MAX_PLAYERS] = -1;

forward HideMiniavs(playerid);
forward ShowMiniavs(playerid);
forward DeleteMiniavs(playerid);
forward AfterCallMiniavs(playerid, const aviso_id);

public HideMiniavs(playerid){
	for(new i = 0; i < 3; i++){
		PlayerTextDrawHide(playerid, miniaviso[playerid][i]);
	}
}
public ShowMiniavs(playerid){
	for(new i = 0; i < 3; i++){
		PlayerTextDrawShow(playerid, miniaviso[playerid][i]);
	}	
}
public DeleteMiniavs(playerid){
	HideMiniavs(playerid);
	if(IsValidTimer(deletematime[playerid])){
		KillTimer(deletematime[playerid]);

	}
	deletematime[playerid] = -1;
}
CallMiniAviso(playerid, const aviso_id, const text[], const time = 8000){
	if(!IsValidTimer(deletematime[playerid])){
		deletematime[playerid] = SetTimerEx("AfterCallMiniavs", time, false, "dd", playerid, aviso_id);
	}
	else{
		KillTimer(deletematime[playerid]);
		deletematime[playerid] = SetTimerEx("AfterCallMiniavs", time, false, "dd", playerid, aviso_id);
	}
	PlayerPlaySound(playerid, CONFIRM_SOUNDID, 0.0, 0.0, 0.0);	
	new str[128];
	format(str, sizeof str, "%s", text);
	for(new i; i < sizeof str; i++){
		if(str[i] == ' ')
			str[i] = '_';
		else if(str[i] == '_'){
			str[i] = ' ';
		}
	}
	PlayerTextDrawSetString(playerid, miniaviso[playerid][1], str);
	ShowMiniavs(playerid);
	return aviso_id;
}