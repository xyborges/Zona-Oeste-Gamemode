#define FILTERSCRIPT
#include <open.mp>
#include <Pawn.CMD>
#include <streamer>
cmd:testdddd(playerid){
	for(new i; i > CountDynamicObjects(); i++)
	{
	    Streamer_SetFloatData(STREAMER_TYPE_OBJECT , i, E_STREAMER_STREAM_DISTANCE, 500.0);
	    Streamer_SetFloatData(STREAMER_TYPE_OBJECT , i, E_STREAMER_DRAW_DISTANCE, 350.0);
	}
	return 1; 
}
cmd:atestado(playerid, params[]){
	Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, strval(params), playerid);
	return 1;
}