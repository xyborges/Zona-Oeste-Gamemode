#include <open.mp>
#include <sampvoice>

#define Canal_Local 1
new SV_UINT:Microfone[MAX_PLAYERS] = {SV_NULL, ...};

DestruirVoip(playerid){
	if(SvHasMicro(playerid)){
		SvDeleteStream(Microfone[playerid]);
		Microfone[playerid] = SV_NULL;
	}
}
public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid) 
{
    
    if (keyid == 0x42 && Microfone[playerid]) 
    	SvAttachSpeakerToStream(Microfone[playerid], playerid);
}

public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    if (keyid == 0x42 && Microfone[playerid]) 
    	SvDetachSpeakerFromStream(Microfone[playerid], playerid);
}

CriarVoip(playerid){
	SvAddKey(playerid, 0x42);
    Microfone[playerid] = SvCreateDLStreamAtPlayer(6.0, SV_INFINITY, playerid, VerdeSamp, "Local");
    SendClientMessage(playerid, LIGHTBLUE, "VOIP: Voce está com todos os requisitos para utiliar.");
}