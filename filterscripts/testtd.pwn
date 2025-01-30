#define FILTERSCRIPT
#include <open.mp>
#include <Pawn.CMD>
#include "../scriptfiles/modulos/inventario.inc"


cmd:checkmochila(playerid){
	for(new i; i < 27; i++){
		if(IsValidPlayerTextDraw(playerid,mochilaTD[playerid][i]))
			SendClientMessage(playerid, 0x33ccffff, "mochila td %d, valido!", mochilaTD[playerid][i]);
		else
			SendClientMessage(playerid,0xff0000FF , "mochila td %d, invalido!", mochilaTD[playerid][i]);
	}
}
cmd:criarmochila(playerid){
	CriarInventarios();
	return 1;
}
cmd:destruirmochila(playerid){
	DestruirInventarios();
	return 1;
}
cmd:mochilamostrar(p){
		for(new i; i < 27; i++){
			PlayerTextDrawShow(p, mochilaTD[p][i]);
		}
		for(new i; i < 20; i++){
			PlayerTextDrawShow(p, PreviewTD[p][i]);
		}
		for(new i; i < 20; i++){
			PlayerTextDrawShow(p, textoInv[p][i]);
		}
	
}