#define FILTERSCRIPT
#include <open.mp>
#include <Pawn.CMD>
#include "../scriptfiles/modulos/grandesfuncoes.inc"
#include "../scriptfiles/modulos/textdraws.inc"
main(){
	return 1;
}
TotalTD(id){
	new td;
	switch(id){
		case 0: td = sizeof TelaCarregar;
		case 1: td = sizeof ConceMenu;
		case 2: td = sizeof FomeSedeTD;
		case 3: td = sizeof EditorAO;
		case 4: td = sizeof Velocimetro;
		case 5: td = sizeof BuySkinTD;
		case 6: td = sizeof telapreta;
		case 7: td = sizeof TunagemTD;
		case 8: td = sizeof LoginDraw;
		case 9: td = sizeof AmmunationText;
		case 10: td = sizeof Hud;
		case 11: td = sizeof skinSelect;//hud skin miniaviso
		case 12: td = sizeof miniaviso;
	}
	return td;
}
cmd:checktds(playerid){
	new textdraw[13];
	print("1fs");
	for(new i; i < sizeof TelaCarregar; i++){
		if(IsValidPlayerTextDraw(playerid, TelaCarregar[playerid][i])){
			textdraw[0] ++;
		}
	}
	print("2fs");
	for (new i = 0; i < sizeof ConceMenu; i++) {
	  if (IsValidPlayerTextDraw(playerid, ConceMenu[playerid][i])) {
	    textdraw[1]++;
	  }
	}
	print("3fs");
	// FomeSedeTD
	for (new i = 0; i < sizeof FomeSedeTD; i++) {
	  if (IsValidPlayerTextDraw(playerid, FomeSedeTD[playerid][i])) {
	    textdraw[2]++;
	  }
	}
	print("4fs");
	// EditorAO
	for (new i = 0; i < sizeof EditorAO; i++) {
	  if (IsValidPlayerTextDraw(playerid, EditorAO[playerid][i])) {
	    textdraw[3]++;
	  }
	}
	print("5fs");
	// Velocimetro
	for (new i = 0; i < sizeof Velocimetro; i++) {
	  if (IsValidPlayerTextDraw(playerid, Velocimetro[playerid][i])) {
	    textdraw[4]++;
	  }
	}
	print("6fs");
	// BuySkinTD
	for (new i = 0; i < sizeof BuySkinTD; i++) {
	  if (IsValidPlayerTextDraw(playerid, BuySkinTD[playerid][i])) {
	    textdraw[5]++;
	  }
	}
	print("7fs");	
	// telapreta
	for (new i = 0; i < sizeof telapreta; i++) {
	  if (IsValidPlayerTextDraw(playerid, telapreta[playerid][i])) {
	    textdraw[6]++;
	  }
	}
	print("8fs");
	// TunagemTD
	for (new i = 0; i < sizeof TunagemTD; i++) {
	  if (IsValidPlayerTextDraw(playerid, TunagemTD[playerid][i])) {
	    textdraw[7]++;
	  }
	}
	print("9fs");
	// LoginDraw
	for (new i = 0; i < sizeof LoginDraw; i++) {
	  if (IsValidPlayerTextDraw(playerid, LoginDraw[playerid][i])) {
	    textdraw[8]++;
	  }
	}
	print("10fs");
	// AmmunationText
	for (new i = 0; i < sizeof AmmunationText; i++) {
	  if (IsValidPlayerTextDraw(playerid, AmmunationText[playerid][i])) {
	    textdraw[9]++;
	  }
	}
	print("11fs");
	// Hud
	for (new i = 0; i < sizeof Hud; i++) {
	  if (IsValidPlayerTextDraw(playerid, Hud[playerid][i])) {
	    textdraw[10]++;
	  }
	}
	print("12fs");
	// skinSelect
	for (new i = 0; i < sizeof skinSelect; i++) {
	  if (IsValidPlayerTextDraw(playerid, skinSelect[playerid][i])) {
	    textdraw[11]++;
	  }
	}
	print("13fs");
	// miniaviso
	for (new i = 0; i < sizeof miniaviso; i++) {
	  if (IsValidPlayerTextDraw(playerid, miniaviso[playerid][i])) {
	    textdraw[12]++;
	  }
	}
	print("14fs");
	SendClientMessage(playerid, -1, "Informacoes:");
	new string[128];
	for(new i; i < 13; i++){
		new str[40];
		format(str, sizeof str, "TD %d: %d/%d criados\n", i, textdraw[i], TotalTD(i));
		strcat(string, str);
	}
	new str2[100], contador;
	for(new PlayerText:i; i < MAX_PLAYER_TEXT_DRAWS; i++){
		if(IsValidPlayerTextDraw(playerid, i))
			contador++;
	}
	format(str2, sizeof str2, "\nTotal validos: %d", contador);
	strcat(string, str2);
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "TDs", string, "ok", #);
	return 1;
}
	