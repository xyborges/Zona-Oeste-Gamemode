#include <a_samp>

new PlayerText:miniaviso[MAX_PLAYERS][3];

public OnFilterScriptInit()
{
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	miniaviso[playerid][0] = CreatePlayerTextDraw(playerid, 573.000000, 95.000000, "_");
	PlayerTextDrawFont(playerid, miniaviso[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, miniaviso[playerid][0], 0.666666, 2.400003);
	PlayerTextDrawTextSize(playerid, miniaviso[playerid][0], 301.000000, 131.500000);
	PlayerTextDrawSetOutline(playerid, miniaviso[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, miniaviso[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, miniaviso[playerid][0], 2);
	PlayerTextDrawColour(playerid, miniaviso[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, miniaviso[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, miniaviso[playerid][0], 165);
	PlayerTextDrawUseBox(playerid, miniaviso[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, miniaviso[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, miniaviso[playerid][0], 0);

	miniaviso[playerid][1] = CreatePlayerTextDraw(playerid, 507.000000, 92.000000, "Seja_bem_vindo_ao_zona_oeste_roleplay!");
	PlayerTextDrawFont(playerid, miniaviso[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, miniaviso[playerid][1], 0.187500, 1.600000);
	PlayerTextDrawTextSize(playerid, miniaviso[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, miniaviso[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, miniaviso[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, miniaviso[playerid][1], 1);
	PlayerTextDrawColour(playerid, miniaviso[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, miniaviso[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, miniaviso[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, miniaviso[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, miniaviso[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, miniaviso[playerid][1], 0);

	miniaviso[playerid][2] = CreatePlayerTextDraw(playerid, 569.000000, 123.000000, "_");
	PlayerTextDrawFont(playerid, miniaviso[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, miniaviso[playerid][2], 0.662500, -0.499994);
	PlayerTextDrawTextSize(playerid, miniaviso[playerid][2], 301.000000, 131.500000);
	PlayerTextDrawSetOutline(playerid, miniaviso[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, miniaviso[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, miniaviso[playerid][2], 2);
	PlayerTextDrawColour(playerid, miniaviso[playerid][2], -1);
	PlayerTextDrawBackgroundColour(playerid, miniaviso[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, miniaviso[playerid][2], -16776961);
	PlayerTextDrawUseBox(playerid, miniaviso[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, miniaviso[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, miniaviso[playerid][2], 0);

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, miniaviso[playerid][0]);
	PlayerTextDrawDestroy(playerid, miniaviso[playerid][1]);
	PlayerTextDrawDestroy(playerid, miniaviso[playerid][2]);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!strcmp(cmdtext, "/tdtest", true))
	{
		PlayerTextDrawShow(playerid, miniaviso[playerid][0]);
		PlayerTextDrawShow(playerid, miniaviso[playerid][1]);
		PlayerTextDrawShow(playerid, miniaviso[playerid][2]);
		return 1;
	}
	return 0;
}
