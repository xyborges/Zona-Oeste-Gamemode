new Float: PosPickMunDep[][] = {
	{2739.7153,-2391.9480,13.6328},
	{2751.1545,-2391.0549,13.6549},
	{2744.4558,-2425.3972,13.6286},
	{2744.5750,-2438.1304,13.6432},
	{2783.2480,-2435.0151,13.6348},
	{2784.9185,-2409.2280,13.6344},
	{2793.0901,-2424.8726,13.6324},
	{2793.0925,-2463.4702,13.6324},
	{2793.0916,-2447.6194,13.6324},
	{2782.5027,-2488.5889,13.6567},
	{2790.6140,-2501.5938,13.6468}
};
enum PickAmmo{
	PickMunicao,
	Text3D:TextoPickMun,
	PickupPickMun
}
new InfoPickAmmo[11][PickAmmo];
//SetPlayerAttachedObject(playerid,9,2040,1,0.000000,0.387999,-0.059000,84.800018,87.799995,0.599998,1.000000,1.000000,1.000000)
/*public OnGameModeInit(){
	for(new i; i < sizeof PosPickMunDep; i++){
		InfoPickAmmo[i][TextoPickMun] = CreateDynamic3DTextLabel("~R~Aperte 'Y' Para pegar municao.\n10/10", -1, 
			PosPickMunDep[i][0], PosPickMunDep[i][1], PosPickMunDep[i][2], 30.0);// 30.0, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
		InfoPickAmmo[i][PickupPickMun] = CreateDynamicPickup(2040, 1,PosPickMunDep[i][0], PosPickMunDep[i][1], PosPickMunDep[i][2]);//, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_PICKUP_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
		InfoPickAmmo[i][PickMunicao] = 10;
	}
	return 1;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if((newkeys == KEY_YES)){
		for(new i; i<sizeof PosPickMunDep; i++){
			if(IsPlayerInRangeOfPoint(playerid, 2.0, PosPickMunDep[i][0], PosPickMunDep[i][1], PosPickMunDep[i][2])){
				if(InfoPickAmmo[i][PickMunicao] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este local nao possui mais caixas de municao.");
				if(NaMao[playerid] == Caixa) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com uma caixa de municao nas mãos. Coloque na Van!");
				ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
				SetTimerEx("pegandomunicaoDEP", 5000, false, "ii", playerid, i);
				GameTextForPlayer(playerid, "~b~PEGANDO MUNICAO...", 5000, 3);
				break;
			}
		}
	}
	return 1;
}
function pegandomunicaoDEP(playerid, pickmunD){
	if(!IsPlayerInRangeOfPoint(playerid, 2.0, PosPickMunDep[pickmunD][0], PosPickMunDep[pickmunD][1], PosPickMunDep[pickmunD][2])){
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce saiu de perto da Caixa e nao pegou a municao.");
		ClearAnimations(playerid);
	}
	else{
		if(NaMao[playerid] == Caixa){
			ClearAnimations(playerid);
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com uma Caixa em Maos.");
		}
		else{
			ClearAnimations(playerid);
			SetPlayerAttachedObject(playerid,9,2040,1,0.000000,0.387999,-0.059000,84.800018,87.799995,0.599998,1.000000,1.000000,1.000000);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pegou uma caixa! Coloque-a no veiculo usando /colocarmun.");
			NaMao[playerid] = Caixa;
			InfoPickAmmo[pickmunD][PickMunicao] --;
			UpdateDynamic3DTextLabelText(TextoPickMun, LIGHTRED, fString("~R~Aperte 'Y' Para pegar municao.\n%d/10", InfoPickAmmo[pickmunD][PickMunicao]));
			SetPlayerAttachedObject(playerid,9,2040,1,0.000000,0.387999,-0.059000,84.800018,87.799995,0.599998,1.000000,1.000000,1.000000)
			return 1;
		}
	}
	return 1;
}
CMD:colocarmun(playerid){
	foreach(new i: Vehicles){
		new Float: X, Float: Y, Float: Z, Float: Ang;
		GetVehiclePos(i, X, Y, Z);
		if(!IsPlayerInRangeOfPoint(playerid, 3.9, X, Y, Z)) continue;
		GetVehicleZAngle(i, Ang);
		X = X + -3.0 * floatsin(-Ang, degrees);
	   	Y = Y + -3.0 * floatcos(-Ang, degrees);
	   	if(IsPlayerInRangeOfPoint(playerid, 3.9, X-1.0285, Y+1.0768, Z)){
			if(NaMao[playerid] != Caixa) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta com uma caixa de municao nas maos.");
			if(CaminhaoCarregado[i] == 50) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este veiculo atingiu o maximo de municao transportavel possivel. 110/110.");
			NaMao[playerid] = 0;
			CaminhaoCarregado[i] += 1;
			ApplyAnimationEx(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
			MensagemLocal(25.0, playerid, Roxoeu, fString("* %s colocou uma caixa de municao no %s. Total: %d/110", GetVehicleName(GetVehicleModel(i)), false, CaminhaoCarregado);
			ChecarAnexagem(playerid);
			break;
		}
		return 1;
	}
	return 1;
}
ChecarAnexagem(playerid){
	new obj;
	GetPlayerAttachedObject(playerid, 9, obj);
	if(obj == 2040)
		RemovePlayerAttachedObject(playerid, 9);
	return 1;
}
ContarCaixas(){
	new quantia = 0;
	for(new i; i < 11; i++){
		quantia = InfoPickAmmo[i][PickMunicao];
	}
	return quantia;	
}*/