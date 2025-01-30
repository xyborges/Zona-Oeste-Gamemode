new PlayerText:TelaCarregar[MAX_PLAYERS][3];
new PlayerText:ConceMenu[MAX_PLAYERS][20];
new PlayerText:FomeSedeTD[MAX_PLAYERS][4];
new PlayerText:EditorAO[MAX_PLAYERS][14];
new PlayerText:Velocimetro[MAX_PLAYERS][13];
new PlayerText:BuySkinTD[MAX_PLAYERS][8];
new PlayerText:telapreta[MAX_PLAYERS][1];
new PlayerText:TunagemTD[MAX_PLAYERS][7];
new PlayerText:LoginDraw[MAX_PLAYERS][10];
new PlayerText:AmmunationText[MAX_PLAYERS][20];
new PlayerText:Hud[MAX_PLAYERS][8];
new PlayerText:skinSelect[MAX_PLAYERS][3];
new PlayerText:miniaviso[MAX_PLAYERS][3];

CriarTextDraws(playerid){
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

	miniaviso[playerid][1] = CreatePlayerTextDraw(playerid, 507.000000, 92.000000, " ");
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

	skinSelect[playerid][0] = CreatePlayerTextDraw(playerid, 165.000000, 353.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, skinSelect[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, skinSelect[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, skinSelect[playerid][0], 26.500000, 17.500000);
	PlayerTextDrawSetOutline(playerid, skinSelect[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, skinSelect[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, skinSelect[playerid][0], 1);
	PlayerTextDrawColour(playerid, skinSelect[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, skinSelect[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, skinSelect[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, skinSelect[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, skinSelect[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, skinSelect[playerid][0], 1);
	
	skinSelect[playerid][1] = CreatePlayerTextDraw(playerid, 280.000000, 354.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, skinSelect[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, skinSelect[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, skinSelect[playerid][1], 26.500000, 17.500000);
	PlayerTextDrawSetOutline(playerid, skinSelect[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, skinSelect[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, skinSelect[playerid][1], 1);
	PlayerTextDrawColour(playerid, skinSelect[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, skinSelect[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, skinSelect[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, skinSelect[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, skinSelect[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, skinSelect[playerid][1], 1);

	skinSelect[playerid][2] = CreatePlayerTextDraw(playerid, 236.000000, 356.000000, "select");
	PlayerTextDrawFont(playerid, skinSelect[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, skinSelect[playerid][2], 0.258332, 1.599999);
	PlayerTextDrawTextSize(playerid, skinSelect[playerid][2], 16.500000, 77.000000);
	PlayerTextDrawSetOutline(playerid, skinSelect[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, skinSelect[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, skinSelect[playerid][2], 2);
	PlayerTextDrawColour(playerid, skinSelect[playerid][2], 144);
	PlayerTextDrawBackgroundColour(playerid, skinSelect[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, skinSelect[playerid][2], -741092553);
	PlayerTextDrawUseBox(playerid, skinSelect[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, skinSelect[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, skinSelect[playerid][2], 1);

	Hud[playerid][0] = CreatePlayerTextDraw(playerid, 560.000000, 16.000000, "Santa_Maria_Beach");
	PlayerTextDrawFont(playerid, Hud[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, Hud[playerid][0], 0.220833, 1.050000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][0], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][0], 1);
	PlayerTextDrawAlignment(playerid, Hud[playerid][0], 1);
	PlayerTextDrawColour(playerid, Hud[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, Hud[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, Hud[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Hud[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Hud[playerid][0], 0);

	Hud[playerid][1] = CreatePlayerTextDraw(playerid, 590.000000, 4.000000, "10m_e54s");
	PlayerTextDrawFont(playerid, Hud[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, Hud[playerid][1], 0.220833, 1.050000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][1], 1);
	PlayerTextDrawAlignment(playerid, Hud[playerid][1], 1);
	PlayerTextDrawColour(playerid, Hud[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, Hud[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, Hud[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Hud[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Hud[playerid][1], 0);

	Hud[playerid][2] = CreatePlayerTextDraw(playerid, 13.000000, 6.000000, ".");
	PlayerTextDrawFont(playerid, Hud[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, Hud[playerid][2], 0.220833, 1.050000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Hud[playerid][2], 1);
	PlayerTextDrawColour(playerid, Hud[playerid][2], -1);
	PlayerTextDrawBackgroundColour(playerid, Hud[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, Hud[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Hud[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Hud[playerid][2], 0);

	Hud[playerid][3] = CreatePlayerTextDraw(playerid, 588.000000, 31.000000, "_");
	PlayerTextDrawFont(playerid, Hud[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, Hud[playerid][3], 0.600000, -0.549996);
	PlayerTextDrawTextSize(playerid, Hud[playerid][3], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Hud[playerid][3], 2);
	PlayerTextDrawColour(playerid, Hud[playerid][3], -1);
	PlayerTextDrawBackgroundColour(playerid, Hud[playerid][3], 255);
	PlayerTextDrawBoxColour(playerid, Hud[playerid][3], 255);
	PlayerTextDrawUseBox(playerid, Hud[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Hud[playerid][3], 0);

	Hud[playerid][4] = CreatePlayerTextDraw(playerid, 606.000000, 36.000000, "_");
	PlayerTextDrawFont(playerid, Hud[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, Hud[playerid][4], 0.600000, 1.100003);
	PlayerTextDrawTextSize(playerid, Hud[playerid][4], 299.000000, 48.500000);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Hud[playerid][4], 2);
	PlayerTextDrawColour(playerid, Hud[playerid][4], -1);
	PlayerTextDrawBackgroundColour(playerid, Hud[playerid][4], 255);
	PlayerTextDrawBoxColour(playerid, Hud[playerid][4], -1094795521);
	PlayerTextDrawUseBox(playerid, Hud[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Hud[playerid][4], 0);

	Hud[playerid][5] = CreatePlayerTextDraw(playerid, 578.000000, 36.000000, "_");
	PlayerTextDrawFont(playerid, Hud[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, Hud[playerid][5], 0.600000, 1.100003);
	PlayerTextDrawTextSize(playerid, Hud[playerid][5], 299.000000, -3.000000);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Hud[playerid][5], 2);
	PlayerTextDrawColour(playerid, Hud[playerid][5], -1);
	PlayerTextDrawBackgroundColour(playerid, Hud[playerid][5], 255);
	PlayerTextDrawBoxColour(playerid, Hud[playerid][5], 1296911871);
	PlayerTextDrawUseBox(playerid, Hud[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Hud[playerid][5], 0);

	Hud[playerid][6] = CreatePlayerTextDraw(playerid, 580.000000, 33.000000, "alan_bida_fatal");
	PlayerTextDrawFont(playerid, Hud[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, Hud[playerid][6], 0.133333, 0.650000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Hud[playerid][6], 1);
	PlayerTextDrawColour(playerid, Hud[playerid][6], 255);
	PlayerTextDrawBackgroundColour(playerid, Hud[playerid][6], 255);
	PlayerTextDrawBoxColour(playerid, Hud[playerid][6], 1296911666);
	PlayerTextDrawUseBox(playerid, Hud[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Hud[playerid][6], 0);

	Hud[playerid][7] = CreatePlayerTextDraw(playerid, 580.000000, 40.000000, "IDF:_1580");
	PlayerTextDrawFont(playerid, Hud[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, Hud[playerid][7], 0.141666, 0.650000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Hud[playerid][7], 1);
	PlayerTextDrawColour(playerid, Hud[playerid][7], 255);
	PlayerTextDrawBackgroundColour(playerid, Hud[playerid][7], 255);
	PlayerTextDrawBoxColour(playerid, Hud[playerid][7], 1296911666);
	PlayerTextDrawUseBox(playerid, Hud[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Hud[playerid][7], 0);

	AmmunationText[playerid][0] = CreatePlayerTextDraw(playerid, 316.000000, 116.000000, "_");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][0], 1.016666, 19.800003);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][0], 348.500000, 240.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][0], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][0], 1296911871);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][0], 0);

	AmmunationText[playerid][1] = CreatePlayerTextDraw(playerid, 417.000000, 96.000000, "sair");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][1], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][1], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][1], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][1], 1764337663);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][1], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][1], 1);

	AmmunationText[playerid][2] = CreatePlayerTextDraw(playerid, 313.000000, 258.000000, "comprar");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][2], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][2], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][2], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][2], 1764337663);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][2], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][2], 1);

	AmmunationText[playerid][3] = CreatePlayerTextDraw(playerid, 272.000000, 201.000000, "<");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][3], 0.483332, 2.099999);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][3], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][3], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][3], 1764337663);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][3], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][3], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][3], 1);

	AmmunationText[playerid][4] = CreatePlayerTextDraw(playerid, 351.000000, 200.000000, ">");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][4], 0.483332, 2.099999);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][4], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][4], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][4], 1764337663);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][4], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][4], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][4], 1);

	AmmunationText[playerid][5] = CreatePlayerTextDraw(playerid, 269.000000, 88.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][5], 5);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][5], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][5], 1);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][5], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][5], 0);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][5], 255);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][5], 0);
	PlayerTextDrawSetPreviewModel(playerid, AmmunationText[playerid][5], 355);
	PlayerTextDrawSetPreviewRot(playerid, AmmunationText[playerid][5], 0.000000, 0.000000, 0.000000, 2.409999);
	PlayerTextDrawSetPreviewVehicleColours(playerid, AmmunationText[playerid][5], 1, 1);

	AmmunationText[playerid][6] = CreatePlayerTextDraw(playerid, 313.000000, 118.000000, "AK-47");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][6], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][6], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][6], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][6], 1298250239);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][6], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][6], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][6], 0);

	AmmunationText[playerid][7] = CreatePlayerTextDraw(playerid, 313.000000, 188.000000, "9800R$");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][7], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][7], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][7], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][7], 1957340415);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][7], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][7], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][7], 0);

	AmmunationText[playerid][8] = CreatePlayerTextDraw(playerid, 312.000000, 219.000000, "AmmuNation");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][8], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][8], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][8], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][8], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][8], 1049161727);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][8], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][8], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][8], 0);

	AmmunationText[playerid][9] = CreatePlayerTextDraw(playerid, 229.000000, 172.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][9], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][9], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][9], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][9], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][9], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][9], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][9], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][9], 0);

	AmmunationText[playerid][10] = CreatePlayerTextDraw(playerid, 253.000000, 129.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][10], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][10], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][10], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][10], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][10], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][10], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][10], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][10], 0);

	AmmunationText[playerid][11] = CreatePlayerTextDraw(playerid, 263.000000, 227.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][11], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][11], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][11], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][11], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][11], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][11], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][11], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][11], 0);

	AmmunationText[playerid][12] = CreatePlayerTextDraw(playerid, 403.000000, 135.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][12], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][12], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][12], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][12], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][12], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][12], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][12], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][12], 0);

	AmmunationText[playerid][13] = CreatePlayerTextDraw(playerid, 360.000000, 113.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][13], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][13], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][13], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][13], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][13], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][13], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][13], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][13], 0);

	AmmunationText[playerid][14] = CreatePlayerTextDraw(playerid, 416.000000, 244.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][14], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][14], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][14], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][14], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][14], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][14], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][14], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][14], 0);

	AmmunationText[playerid][15] = CreatePlayerTextDraw(playerid, 371.000000, 280.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][15], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][15], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][15], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][15], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][15], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][15], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][15], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][15], 0);

	AmmunationText[playerid][16] = CreatePlayerTextDraw(playerid, 212.000000, 247.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][16], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][16], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][16], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][16], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][16], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][16], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][16], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][16], 0);

	AmmunationText[playerid][17] = CreatePlayerTextDraw(playerid, 371.000000, 157.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][17], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][17], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][17], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][17], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][17], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][17], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][17], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][17], 0);

	AmmunationText[playerid][18] = CreatePlayerTextDraw(playerid, 423.000000, 190.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][18], 0);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][18], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][18], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][18], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][18], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][18], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][18], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][18], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][18], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][18], 0);

	AmmunationText[playerid][19] = CreatePlayerTextDraw(playerid, 204.000000, 113.000000, ".");
	PlayerTextDrawFont(playerid, AmmunationText[playerid][19], 2);
	PlayerTextDrawLetterSize(playerid, AmmunationText[playerid][19], 0.233333, 1.400000);
	PlayerTextDrawTextSize(playerid, AmmunationText[playerid][19], 16.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, AmmunationText[playerid][19], 0);
	PlayerTextDrawSetShadow(playerid, AmmunationText[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, AmmunationText[playerid][19], 2);
	PlayerTextDrawColour(playerid, AmmunationText[playerid][19], -1);
	PlayerTextDrawBackgroundColour(playerid, AmmunationText[playerid][19], 255);
	PlayerTextDrawBoxColour(playerid, AmmunationText[playerid][19], 1296911816);
	PlayerTextDrawUseBox(playerid, AmmunationText[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, AmmunationText[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, AmmunationText[playerid][19], 0);

	ConceMenu[playerid][0] = CreatePlayerTextDraw(playerid, 316.000000, 311.000000, "_");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][0], 0.616666, -0.199992);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][0], 298.500000, 253.000000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][0], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][0], 135);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][0], 1);

	ConceMenu[playerid][1] = CreatePlayerTextDraw(playerid, 316.000000, 113.000000, "_");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][1], 0.616666, -0.199992);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][1], 298.500000, 253.000000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][1], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][1], 135);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][1], 1);

	ConceMenu[playerid][2] = CreatePlayerTextDraw(playerid, 316.000000, 116.000000, "_");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][2], 0.616666, 20.950004);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][2], 298.500000, 253.000000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][2], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][2], -421070081);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][2], -1061109537);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][2], 1);

	ConceMenu[playerid][3] = CreatePlayerTextDraw(playerid, 263.000000, 86.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][3], 5);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][3], 109.000000, 134.000000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][3], 1);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][3], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][3], 0);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][3], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][3], 0);
	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][3], 560);
	PlayerTextDrawSetPreviewRot(playerid, ConceMenu[playerid][3], -10.000000, 0.000000, -47.000000, 0.899999);
	PlayerTextDrawSetPreviewVehicleColours(playerid, ConceMenu[playerid][3], 1, 1);

	ConceMenu[playerid][4] = CreatePlayerTextDraw(playerid, 313.000000, 188.000000, "sultan");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][4], 3);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][4], 0.266665, 1.299998);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][4], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][4], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][4], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][4], 0);

	ConceMenu[playerid][5] = CreatePlayerTextDraw(playerid, 314.000000, 202.000000, "~r~nao_economico");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][5], 3);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][5], 0.266665, 1.299998);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][5], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][5], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][5], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][5], 0);

	ConceMenu[playerid][6] = CreatePlayerTextDraw(playerid, 314.000000, 229.000000, "~g~R$75000");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][6], 3);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][6], 0.266665, 1.299998);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][6], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][6], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][6], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][6], 0);

	ConceMenu[playerid][7] = CreatePlayerTextDraw(playerid, 262.000000, 248.000000, "BUY");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][7], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][7], 16.500000, 69.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][7], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][7], 16711935);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][7], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][7], 200);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][7], 1);

	ConceMenu[playerid][8] = CreatePlayerTextDraw(playerid, 194.000000, 283.000000, "<");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][8], 2);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][8], 0.516664, 2.999998);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][8], 23.000000, 58.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][8], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][8], 255);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][8], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][8], 200);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][8], 1);

	ConceMenu[playerid][9] = CreatePlayerTextDraw(playerid, 439.000000, 283.000000, ">");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][9], 2);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][9], 0.516664, 2.999998);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][9], 23.000000, 58.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][9], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][9], 255);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][9], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][9], 200);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][9], 1);

	ConceMenu[playerid][10] = CreatePlayerTextDraw(playerid, 154.000000, 88.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][10], 5);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][10], 112.500000, 180.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][10], 1);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][10], 255);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][10], 0);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][10], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][10], 0);
	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][10], 641);
	PlayerTextDrawSetPreviewRot(playerid, ConceMenu[playerid][10], 0.000000, 0.000000, -90.000000, 3.189999);
	PlayerTextDrawSetPreviewVehicleColours(playerid, ConceMenu[playerid][10], 1, 1);

	ConceMenu[playerid][11] = CreatePlayerTextDraw(playerid, 314.000000, 216.000000, "~y~ipva_1200R$");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][11], 3);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][11], 0.266665, 1.299998);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][11], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][11], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][11], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][11], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][11], 0);

	ConceMenu[playerid][12] = CreatePlayerTextDraw(playerid, 366.000000, 88.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][12], 5);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][12], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][12], 112.500000, 180.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][12], 1);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][12], 255);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][12], 0);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][12], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][12], 0);
	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][12], 641);
	PlayerTextDrawSetPreviewRot(playerid, ConceMenu[playerid][12], 0.000000, 0.000000, -90.000000, 3.189999);
	PlayerTextDrawSetPreviewVehicleColours(playerid, ConceMenu[playerid][12], 1, 1);

	ConceMenu[playerid][13] = CreatePlayerTextDraw(playerid, 166.000000, 77.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][13], 5);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][13], 112.500000, 180.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][13], 1);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][13], 255);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][13], 0);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][13], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][13], 0);
	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][13], 641);
	PlayerTextDrawSetPreviewRot(playerid, ConceMenu[playerid][13], 0.000000, 0.000000, -90.000000, 3.189999);
	PlayerTextDrawSetPreviewVehicleColours(playerid, ConceMenu[playerid][13], 1, 1);

	ConceMenu[playerid][14] = CreatePlayerTextDraw(playerid, 141.000000, 77.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][14], 5);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][14], 112.500000, 180.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][14], 1);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][14], 255);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][14], 0);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][14], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][14], 0);
	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][14], 641);
	PlayerTextDrawSetPreviewRot(playerid, ConceMenu[playerid][14], 0.000000, 0.000000, -90.000000, 3.189999);
	PlayerTextDrawSetPreviewVehicleColours(playerid, ConceMenu[playerid][14], 1, 1);

	ConceMenu[playerid][15] = CreatePlayerTextDraw(playerid, 378.000000, 76.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][15], 5);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][15], 112.500000, 180.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][15], 1);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][15], 255);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][15], 0);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][15], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][15], 0);
	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][15], 641);
	PlayerTextDrawSetPreviewRot(playerid, ConceMenu[playerid][15], 0.000000, 0.000000, -90.000000, 3.189999);
	PlayerTextDrawSetPreviewVehicleColours(playerid, ConceMenu[playerid][15], 1, 1);

	ConceMenu[playerid][16] = CreatePlayerTextDraw(playerid, 351.000000, 76.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][16], 5);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][16], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][16], 112.500000, 180.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][16], 1);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][16], 255);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][16], 0);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][16], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][16], 0);
	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][16], 641);
	PlayerTextDrawSetPreviewRot(playerid, ConceMenu[playerid][16], 0.000000, 0.000000, -90.000000, 3.189999);
	PlayerTextDrawSetPreviewVehicleColours(playerid, ConceMenu[playerid][16], 1, 1);

	ConceMenu[playerid][17] = CreatePlayerTextDraw(playerid, 366.000000, 249.000000, "EXIT");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][17], 2);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][17], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][17], 16.500000, 69.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][17], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][17], -16776961);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][17], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][17], 200);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][17], 1);

	ConceMenu[playerid][18] = CreatePlayerTextDraw(playerid, 314.000000, 249.000000, "_");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][18], 2);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][18], 0.629166, -0.599995);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][18], 298.500000, 80.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][18], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][18], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][18], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][18], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][18], 1);

	ConceMenu[playerid][19] = CreatePlayerTextDraw(playerid, 314.000000, 269.000000, "_");
	PlayerTextDrawFont(playerid, ConceMenu[playerid][19], 2);
	PlayerTextDrawLetterSize(playerid, ConceMenu[playerid][19], 0.629166, -0.599995);
	PlayerTextDrawTextSize(playerid, ConceMenu[playerid][19], 298.500000, 161.500000);
	PlayerTextDrawSetOutline(playerid, ConceMenu[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, ConceMenu[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, ConceMenu[playerid][19], 2);
	PlayerTextDrawColour(playerid, ConceMenu[playerid][19], -1);
	PlayerTextDrawBackgroundColour(playerid, ConceMenu[playerid][19], 255);
	PlayerTextDrawBoxColour(playerid, ConceMenu[playerid][19], 255);
	PlayerTextDrawUseBox(playerid, ConceMenu[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, ConceMenu[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, ConceMenu[playerid][19], 1);

	TelaCarregar[playerid][0] = CreatePlayerTextDraw(playerid, 225.000000, 122.000000, "Zona_Oeste");
	PlayerTextDrawFont(playerid, TelaCarregar[playerid][0], 0);
	PlayerTextDrawLetterSize(playerid, TelaCarregar[playerid][0], 1.474995, 8.350009);
	PlayerTextDrawTextSize(playerid, TelaCarregar[playerid][0], 401.000000, 23.500000);
	PlayerTextDrawSetOutline(playerid, TelaCarregar[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TelaCarregar[playerid][0], 4);
	PlayerTextDrawAlignment(playerid, TelaCarregar[playerid][0], 1);
	PlayerTextDrawColour(playerid, TelaCarregar[playerid][0], -1962934017);
	PlayerTextDrawBackgroundColour(playerid, TelaCarregar[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, TelaCarregar[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, TelaCarregar[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, TelaCarregar[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, TelaCarregar[playerid][0], 0);

	TelaCarregar[playerid][1] = CreatePlayerTextDraw(playerid, 267.000000, 185.000000, "Roleplay");
	PlayerTextDrawFont(playerid, TelaCarregar[playerid][1], 0);
	PlayerTextDrawLetterSize(playerid, TelaCarregar[playerid][1], 1.299993, 7.000004);
	PlayerTextDrawTextSize(playerid, TelaCarregar[playerid][1], 401.000000, 23.500000);
	PlayerTextDrawSetOutline(playerid, TelaCarregar[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TelaCarregar[playerid][1], 4);
	PlayerTextDrawAlignment(playerid, TelaCarregar[playerid][1], 1);
	PlayerTextDrawColour(playerid, TelaCarregar[playerid][1], -1962934017);
	PlayerTextDrawBackgroundColour(playerid, TelaCarregar[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, TelaCarregar[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, TelaCarregar[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, TelaCarregar[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, TelaCarregar[playerid][1], 0);

	TelaCarregar[playerid][2] = CreatePlayerTextDraw(playerid, 271.000000, 256.000000, "abre.ai/zonaoesterp_____________2023");
	PlayerTextDrawFont(playerid, TelaCarregar[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, TelaCarregar[playerid][2], 0.170827, 1.050004);
	PlayerTextDrawTextSize(playerid, TelaCarregar[playerid][2], 379.000000, 22.500000);
	PlayerTextDrawSetOutline(playerid, TelaCarregar[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, TelaCarregar[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, TelaCarregar[playerid][2], 1);
	PlayerTextDrawColour(playerid, TelaCarregar[playerid][2], -1);
	PlayerTextDrawBackgroundColour(playerid, TelaCarregar[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, TelaCarregar[playerid][2], 20);
	PlayerTextDrawUseBox(playerid, TelaCarregar[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, TelaCarregar[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, TelaCarregar[playerid][2], 0);
	
	LoginDraw[playerid][0] = CreatePlayerTextDraw(playerid, 526.000000, 98.000000, "_");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][0], 0.600000, 21.300003);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][0], 298.500000, 124.000000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][0], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][0], -741092399);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][0], 0);

	LoginDraw[playerid][1] = CreatePlayerTextDraw(playerid, 470.700012, 135.000000, "o");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][1], 0.349998, 1.849999);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][1], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][1], 1296911871);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][1], 0);

	LoginDraw[playerid][2] = CreatePlayerTextDraw(playerid, 470.399993, 166.000000, "u");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][2], 0.345832, -2.049999);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][2], 396.500000, 74.500000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][2], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][2], 1296911871);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][2], 0);

	LoginDraw[playerid][3] = CreatePlayerTextDraw(playerid, 521.000000, 146.000000, "_");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][3], 0.829166, 1.100003);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][3], 302.000000, 84.500000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][3], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][3], -1);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][3], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][3], 135);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][3], 0);

	LoginDraw[playerid][4] = CreatePlayerTextDraw(playerid, 521.700012, 145.000000, "Joao_Borges");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][4], 0.162499, 1.149999);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][4], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][4], -1);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][4], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][4], -206);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][4], 0);

	LoginDraw[playerid][5] = CreatePlayerTextDraw(playerid, 470.700012, 167.000000, "o");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][5], 0.349998, 1.849999);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][5], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][5], 1296911871);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][5], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][5], 0);

	LoginDraw[playerid][6] = CreatePlayerTextDraw(playerid, 470.299987, 175.000000, "O");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][6], 0.237498, 1.449999);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][6], 378.000000, 18.000000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][6], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][6], 1296911871);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][6], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][6], 0);

	LoginDraw[playerid][7] = CreatePlayerTextDraw(playerid, 521.000000, 174.000000, "senha");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][7], 0.183333, 1.200000);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][7], 51.500000, 85.500000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][7], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][7], -1);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][7], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][7], 135);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][7], 1);

	LoginDraw[playerid][8] = CreatePlayerTextDraw(playerid, 524.000000, 270.000000, "Entrar");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][8], 2);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][8], 0.183333, 1.350000);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][8], 16.500000, 47.000000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][8], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][8], -1);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][8], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][8], 200);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][8], 1);

	LoginDraw[playerid][9] = CreatePlayerTextDraw(playerid, 522.700012, 96.000000, "Zona~n~Oeste");
	PlayerTextDrawFont(playerid, LoginDraw[playerid][9], 0);
	PlayerTextDrawLetterSize(playerid, LoginDraw[playerid][9], 0.479165, 1.499999);
	PlayerTextDrawTextSize(playerid, LoginDraw[playerid][9], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, LoginDraw[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, LoginDraw[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, LoginDraw[playerid][9], 2);
	PlayerTextDrawColour(playerid, LoginDraw[playerid][9], -1);
	PlayerTextDrawBackgroundColour(playerid, LoginDraw[playerid][9], 255);
	PlayerTextDrawBoxColour(playerid, LoginDraw[playerid][9], -206);
	PlayerTextDrawUseBox(playerid, LoginDraw[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, LoginDraw[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, LoginDraw[playerid][9], 0);
	
	FomeSedeTD[playerid][0] = CreatePlayerTextDraw(playerid, 597.000000, 230.000000, "100%");
	PlayerTextDrawFont(playerid, FomeSedeTD[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid, FomeSedeTD[playerid][0], 0.224999, 1.500000);
	PlayerTextDrawTextSize(playerid, FomeSedeTD[playerid][0], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, FomeSedeTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, FomeSedeTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, FomeSedeTD[playerid][0], 1);
	PlayerTextDrawColour(playerid, FomeSedeTD[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, FomeSedeTD[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, FomeSedeTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, FomeSedeTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, FomeSedeTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, FomeSedeTD[playerid][0], 0);

	FomeSedeTD[playerid][1] = CreatePlayerTextDraw(playerid, 597.000000, 214.000000, "HUD:radar_pizza");
	PlayerTextDrawFont(playerid, FomeSedeTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, FomeSedeTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, FomeSedeTD[playerid][1], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, FomeSedeTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, FomeSedeTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, FomeSedeTD[playerid][1], 1);
	PlayerTextDrawColour(playerid, FomeSedeTD[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, FomeSedeTD[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, FomeSedeTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, FomeSedeTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, FomeSedeTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, FomeSedeTD[playerid][1], 0);

	FomeSedeTD[playerid][2] = CreatePlayerTextDraw(playerid, 596.000000, 188.000000, "100%");
	PlayerTextDrawFont(playerid, FomeSedeTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, FomeSedeTD[playerid][2], 0.224999, 1.500000);
	PlayerTextDrawTextSize(playerid, FomeSedeTD[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, FomeSedeTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, FomeSedeTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, FomeSedeTD[playerid][2], 1);
	PlayerTextDrawColour(playerid, FomeSedeTD[playerid][2], -1);
	PlayerTextDrawBackgroundColour(playerid, FomeSedeTD[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, FomeSedeTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, FomeSedeTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, FomeSedeTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, FomeSedeTD[playerid][2], 0);

	FomeSedeTD[playerid][3] = CreatePlayerTextDraw(playerid, 596.000000, 172.000000, "HUD:radar_centre");
	PlayerTextDrawFont(playerid, FomeSedeTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, FomeSedeTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, FomeSedeTD[playerid][3], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, FomeSedeTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, FomeSedeTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, FomeSedeTD[playerid][3], 1);
	PlayerTextDrawColour(playerid, FomeSedeTD[playerid][3], -1);
	PlayerTextDrawBackgroundColour(playerid, FomeSedeTD[playerid][3], 255);
	PlayerTextDrawBoxColour(playerid, FomeSedeTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, FomeSedeTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, FomeSedeTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, FomeSedeTD[playerid][3], 0);

	EditorAO[playerid][0] = CreatePlayerTextDraw(playerid, 461.000000, 219.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, EditorAO[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][0], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][0], 1);
	PlayerTextDrawColour(playerid, EditorAO[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][0], 1);

	EditorAO[playerid][1] = CreatePlayerTextDraw(playerid, 537.000000, 221.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, EditorAO[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][1], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][1], 1);
	PlayerTextDrawColour(playerid, EditorAO[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][1], 1);

	EditorAO[playerid][2] = CreatePlayerTextDraw(playerid, 467.000000, 239.000000, "X");
	PlayerTextDrawFont(playerid, EditorAO[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][2], 0.554166, 1.549998);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][2], 2);
	PlayerTextDrawColour(playerid, EditorAO[playerid][2], -2016478465);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][2], 0);

	EditorAO[playerid][3] = CreatePlayerTextDraw(playerid, 544.000000, 238.000000, "Y");
	PlayerTextDrawFont(playerid, EditorAO[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][3], 0.554166, 1.549998);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][3], 2);
	PlayerTextDrawColour(playerid, EditorAO[playerid][3], -2016478465);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][3], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][3], 0);

	EditorAO[playerid][4] = CreatePlayerTextDraw(playerid, 496.000000, 176.000000, "ld_beat:up");
	PlayerTextDrawFont(playerid, EditorAO[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][4], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][4], 1);
	PlayerTextDrawColour(playerid, EditorAO[playerid][4], -1);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][4], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][4], 1);

	EditorAO[playerid][5] = CreatePlayerTextDraw(playerid, 505.000000, 197.000000, "Z");
	PlayerTextDrawFont(playerid, EditorAO[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][5], 0.554166, 1.549998);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][5], 2);
	PlayerTextDrawColour(playerid, EditorAO[playerid][5], -2016478465);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][5], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][5], 0);

	EditorAO[playerid][6] = CreatePlayerTextDraw(playerid, 460.000000, 285.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, EditorAO[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][6], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][6], 1);
	PlayerTextDrawColour(playerid, EditorAO[playerid][6], -1);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][6], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][6], 1);

	EditorAO[playerid][7] = CreatePlayerTextDraw(playerid, 537.000000, 286.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, EditorAO[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][7], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][7], 1);
	PlayerTextDrawColour(playerid, EditorAO[playerid][7], -1);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][7], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][7], 1);

	EditorAO[playerid][8] = CreatePlayerTextDraw(playerid, 545.000000, 308.000000, "ry");
	PlayerTextDrawFont(playerid, EditorAO[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][8], 0.554166, 1.549998);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][8], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][8], 2);
	PlayerTextDrawColour(playerid, EditorAO[playerid][8], -2016478465);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][8], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][8], 0);

	EditorAO[playerid][9] = CreatePlayerTextDraw(playerid, 469.000000, 308.000000, "rx");
	PlayerTextDrawFont(playerid, EditorAO[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][9], 0.554166, 1.549998);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][9], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][9], 2);
	PlayerTextDrawColour(playerid, EditorAO[playerid][9], -2016478465);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][9], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][9], 0);

	EditorAO[playerid][10] = CreatePlayerTextDraw(playerid, 499.000000, 322.000000, "ld_beat:down");
	PlayerTextDrawFont(playerid, EditorAO[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][10], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][10], 1);
	PlayerTextDrawColour(playerid, EditorAO[playerid][10], -1);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][10], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][10], 1);

	EditorAO[playerid][11] = CreatePlayerTextDraw(playerid, 507.000000, 340.000000, "rz");
	PlayerTextDrawFont(playerid, EditorAO[playerid][11], 1);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][11], 0.554166, 1.549998);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][11], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][11], 2);
	PlayerTextDrawColour(playerid, EditorAO[playerid][11], -2016478465);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][11], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][11], 0);

	EditorAO[playerid][12] = CreatePlayerTextDraw(playerid, 395.000000, 175.000000, "+");
	PlayerTextDrawFont(playerid, EditorAO[playerid][12], 1);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][12], 0.554166, 1.549998);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][12], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][12], 2);
	PlayerTextDrawColour(playerid, EditorAO[playerid][12], -2016478465);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][12], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][12], 1);

	EditorAO[playerid][13] = CreatePlayerTextDraw(playerid, 433.000000, 175.000000, "-");
	PlayerTextDrawFont(playerid, EditorAO[playerid][13], 1);
	PlayerTextDrawLetterSize(playerid, EditorAO[playerid][13], 0.554166, 1.549998);
	PlayerTextDrawTextSize(playerid, EditorAO[playerid][13], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EditorAO[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, EditorAO[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, EditorAO[playerid][13], 2);
	PlayerTextDrawColour(playerid, EditorAO[playerid][13], -2016478465);
	PlayerTextDrawBackgroundColour(playerid, EditorAO[playerid][13], 255);
	PlayerTextDrawBoxColour(playerid, EditorAO[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, EditorAO[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, EditorAO[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, EditorAO[playerid][13], 1);
	
	TunagemTD[playerid][0] = CreatePlayerTextDraw(playerid, 49.000000, 198.000000, "_");
	PlayerTextDrawFont(playerid, TunagemTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, TunagemTD[playerid][0], 0.600000, 10.300003);
	PlayerTextDrawTextSize(playerid, TunagemTD[playerid][0], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, TunagemTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TunagemTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, TunagemTD[playerid][0], 2);
	PlayerTextDrawColour(playerid, TunagemTD[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, TunagemTD[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, TunagemTD[playerid][0], -65468);
	PlayerTextDrawUseBox(playerid, TunagemTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TunagemTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, TunagemTD[playerid][0], 0);

	TunagemTD[playerid][1] = CreatePlayerTextDraw(playerid, -10.000000, 170.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, TunagemTD[playerid][1], 5);
	PlayerTextDrawLetterSize(playerid, TunagemTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TunagemTD[playerid][1], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, TunagemTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, TunagemTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, TunagemTD[playerid][1], 1);
	PlayerTextDrawColour(playerid, TunagemTD[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, TunagemTD[playerid][1], 0);
	PlayerTextDrawBoxColour(playerid, TunagemTD[playerid][1], 255);
	PlayerTextDrawUseBox(playerid, TunagemTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, TunagemTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, TunagemTD[playerid][1], 0);
	PlayerTextDrawSetPreviewModel(playerid, TunagemTD[playerid][1], 1025);
	PlayerTextDrawSetPreviewRot(playerid, TunagemTD[playerid][1], -6.000000, 0.000000, 43.000000, 1.429998);
	PlayerTextDrawSetPreviewVehicleColours(playerid, TunagemTD[playerid][1], 1, 1);

	TunagemTD[playerid][2] = CreatePlayerTextDraw(playerid, 21.000000, 298.000000, "buy");
	PlayerTextDrawFont(playerid, TunagemTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, TunagemTD[playerid][2], 0.174998, 1.750000);
	PlayerTextDrawTextSize(playerid, TunagemTD[playerid][2], 16.500000, 19.500000);
	PlayerTextDrawSetOutline(playerid, TunagemTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, TunagemTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, TunagemTD[playerid][2], 2);
	PlayerTextDrawColour(playerid, TunagemTD[playerid][2], -1);
	PlayerTextDrawBackgroundColour(playerid, TunagemTD[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, TunagemTD[playerid][2], 16711880);
	PlayerTextDrawUseBox(playerid, TunagemTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, TunagemTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, TunagemTD[playerid][2], 1);

	TunagemTD[playerid][3] = CreatePlayerTextDraw(playerid, 76.000000, 298.000000, "EXIT");
	PlayerTextDrawFont(playerid, TunagemTD[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, TunagemTD[playerid][3], 0.174998, 1.750000);
	PlayerTextDrawTextSize(playerid, TunagemTD[playerid][3], 16.500000, 19.500000);
	PlayerTextDrawSetOutline(playerid, TunagemTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, TunagemTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, TunagemTD[playerid][3], 2);
	PlayerTextDrawColour(playerid, TunagemTD[playerid][3], -1);
	PlayerTextDrawBackgroundColour(playerid, TunagemTD[playerid][3], 255);
	PlayerTextDrawBoxColour(playerid, TunagemTD[playerid][3], -16777016);
	PlayerTextDrawUseBox(playerid, TunagemTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, TunagemTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, TunagemTD[playerid][3], 1);

	TunagemTD[playerid][4] = CreatePlayerTextDraw(playerid, 10.000000, 179.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, TunagemTD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, TunagemTD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TunagemTD[playerid][4], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TunagemTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, TunagemTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, TunagemTD[playerid][4], 1);
	PlayerTextDrawColour(playerid, TunagemTD[playerid][4], -1);
	PlayerTextDrawBackgroundColour(playerid, TunagemTD[playerid][4], 255);
	PlayerTextDrawBoxColour(playerid, TunagemTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, TunagemTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, TunagemTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, TunagemTD[playerid][4], 1);

	TunagemTD[playerid][5] = CreatePlayerTextDraw(playerid, 72.000000, 178.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, TunagemTD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, TunagemTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TunagemTD[playerid][5], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TunagemTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, TunagemTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, TunagemTD[playerid][5], 1);
	PlayerTextDrawColour(playerid, TunagemTD[playerid][5], -1);
	PlayerTextDrawBackgroundColour(playerid, TunagemTD[playerid][5], 255);
	PlayerTextDrawBoxColour(playerid, TunagemTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, TunagemTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, TunagemTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, TunagemTD[playerid][5], 1);

	TunagemTD[playerid][6] = CreatePlayerTextDraw(playerid, 35.000000, 323.000000, "~G~900R$");
	PlayerTextDrawFont(playerid, TunagemTD[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, TunagemTD[playerid][6], 0.224997, 1.599997);
	PlayerTextDrawTextSize(playerid, TunagemTD[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TunagemTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, TunagemTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, TunagemTD[playerid][6], 1);
	PlayerTextDrawColour(playerid, TunagemTD[playerid][6], -1);
	PlayerTextDrawBackgroundColour(playerid, TunagemTD[playerid][6], 255);
	PlayerTextDrawBoxColour(playerid, TunagemTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, TunagemTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, TunagemTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, TunagemTD[playerid][6], 0);
	
	telapreta[playerid][0] = CreatePlayerTextDraw(playerid, 295.000000, 1.000000, "_");
	PlayerTextDrawFont(playerid, telapreta[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, telapreta[playerid][0], 0.600000, 52.300003);
	PlayerTextDrawTextSize(playerid, telapreta[playerid][0], 298.500000, 720.000000);
	PlayerTextDrawSetOutline(playerid, telapreta[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, telapreta[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, telapreta[playerid][0], 2);
	PlayerTextDrawColour(playerid, telapreta[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, telapreta[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, telapreta[playerid][0], 255);
	PlayerTextDrawUseBox(playerid, telapreta[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, telapreta[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, telapreta[playerid][0], 0);
	//("teste 9");
	Velocimetro[playerid][0] = CreatePlayerTextDraw(playerid, 320.000000, 394.000000, "_");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][0], 0.600000, 3.000000);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][0], 294.500000, 82.000000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][0], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][0], 1296911871);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][0], 1);

	Velocimetro[playerid][1] = CreatePlayerTextDraw(playerid, 291.000000, 392.000000, "000");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][1], 3);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][1], 0.345831, 1.599997);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][1], 407.000000, 20.000000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][1], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][1], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][1], 0);

	Velocimetro[playerid][2] = CreatePlayerTextDraw(playerid, 346.000000, 414.000000, "0000435");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][2], 0.158332, 0.699998);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][2], 407.000000, 20.000000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][2], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][2], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][2], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][2], 0);

	Velocimetro[playerid][3] = CreatePlayerTextDraw(playerid, 360.000000, 397.000000, "_");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][3], 0.600000, -0.049995);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][3], 288.500000, 0.500000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][3], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][3], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][3], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][3], 9109759);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][3], 1);

	Velocimetro[playerid][4] = CreatePlayerTextDraw(playerid, 360.000000, 407.000000, "_");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][4], 0.600000, -0.049995);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][4], 288.500000, 0.500000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][4], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][4], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][4], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][4], 9109759);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][4], 1);

	Velocimetro[playerid][5] = CreatePlayerTextDraw(playerid, 248.000000, 388.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][5], 5);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][5], 30.500000, 39.000000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][5], 1);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][5], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][5], -256);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][5], 0);
	PlayerTextDrawSetPreviewModel(playerid, Velocimetro[playerid][5], 560);
	PlayerTextDrawSetPreviewRot(playerid, Velocimetro[playerid][5], -90.000000, 0.000000, 180.000000, 1.000000);
	PlayerTextDrawSetPreviewVehicleColours(playerid, Velocimetro[playerid][5], 1, 1);

	Velocimetro[playerid][6] = CreatePlayerTextDraw(playerid, 271.000000, 399.000000, "_");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][6], 0.600000, -0.049995);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][6], 288.500000, 0.500000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][6], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][6], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][6], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][6], 9109759);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][6], 1);

	Velocimetro[playerid][7] = CreatePlayerTextDraw(playerid, 271.000000, 416.000000, "_");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][7], 0.600000, -0.049995);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][7], 288.500000, 0.500000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][7], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][7], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][7], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][7], 9109759);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][7], 1);

	Velocimetro[playerid][8] = CreatePlayerTextDraw(playerid, 257.000000, 416.000000, "_");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][8], 0.600000, -0.049995);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][8], 288.500000, 0.500000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][8], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][8], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][8], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][8], 9109759);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][8], 1);

	Velocimetro[playerid][9] = CreatePlayerTextDraw(playerid, 256.000000, 399.000000, "_");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][9], 0.600000, -0.049995);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][9], 288.500000, 0.500000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][9], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][9], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][9], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][9], 9109759);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][9], 1);

	Velocimetro[playerid][10] = CreatePlayerTextDraw(playerid, 288.000000, 414.000000, "100~R~L");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][10], 2);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][10], 0.158332, 0.699998);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][10], 407.000000, 20.000000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][10], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][10], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][10], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][10], 0);

	Velocimetro[playerid][11] = CreatePlayerTextDraw(playerid, 354.000000, 394.000000, "F");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][11], 2);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][11], 0.158332, 0.699998);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][11], 407.000000, 20.000000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][11], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][11], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][11], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][11], 0);

	Velocimetro[playerid][12] = CreatePlayerTextDraw(playerid, 354.000000, 403.000000, "P");
	PlayerTextDrawFont(playerid, Velocimetro[playerid][12], 2);
	PlayerTextDrawLetterSize(playerid, Velocimetro[playerid][12], 0.158332, 0.699998);
	PlayerTextDrawTextSize(playerid, Velocimetro[playerid][12], 407.000000, 20.000000);
	PlayerTextDrawSetOutline(playerid, Velocimetro[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, Velocimetro[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, Velocimetro[playerid][12], 2);
	PlayerTextDrawColour(playerid, Velocimetro[playerid][12], -1);
	PlayerTextDrawBackgroundColour(playerid, Velocimetro[playerid][12], 255);
	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, Velocimetro[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, Velocimetro[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, Velocimetro[playerid][12], 0);
	//("teste 10");
	BuySkinTD[playerid][0] = CreatePlayerTextDraw(playerid, 302.000000, 1.000000, "_");
	PlayerTextDrawFont(playerid, BuySkinTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, BuySkinTD[playerid][0], 0.600000, 49.250003);
	PlayerTextDrawTextSize(playerid, BuySkinTD[playerid][0], 298.500000, 682.000000);
	PlayerTextDrawSetOutline(playerid, BuySkinTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, BuySkinTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, BuySkinTD[playerid][0], 2);
	PlayerTextDrawColour(playerid, BuySkinTD[playerid][0], -1);
	PlayerTextDrawBackgroundColour(playerid, BuySkinTD[playerid][0], 255);
	PlayerTextDrawBoxColour(playerid, BuySkinTD[playerid][0], -741092583);
	PlayerTextDrawUseBox(playerid, BuySkinTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, BuySkinTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, BuySkinTD[playerid][0], 0);

	BuySkinTD[playerid][1] = CreatePlayerTextDraw(playerid, 375.000000, 182.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, BuySkinTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, BuySkinTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, BuySkinTD[playerid][1], 42.000000, 52.000000);
	PlayerTextDrawSetOutline(playerid, BuySkinTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, BuySkinTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, BuySkinTD[playerid][1], 1);
	PlayerTextDrawColour(playerid, BuySkinTD[playerid][1], -1);
	PlayerTextDrawBackgroundColour(playerid, BuySkinTD[playerid][1], 9109759);
	PlayerTextDrawBoxColour(playerid, BuySkinTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, BuySkinTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, BuySkinTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, BuySkinTD[playerid][1], 1);

	BuySkinTD[playerid][2] = CreatePlayerTextDraw(playerid, 192.000000, 182.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, BuySkinTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, BuySkinTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, BuySkinTD[playerid][2], 42.000000, 52.000000);
	PlayerTextDrawSetOutline(playerid, BuySkinTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, BuySkinTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, BuySkinTD[playerid][2], 1);
	PlayerTextDrawColour(playerid, BuySkinTD[playerid][2], -1);
	PlayerTextDrawBackgroundColour(playerid, BuySkinTD[playerid][2], 9109759);
	PlayerTextDrawBoxColour(playerid, BuySkinTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, BuySkinTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, BuySkinTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, BuySkinTD[playerid][2], 1);

	BuySkinTD[playerid][3] = CreatePlayerTextDraw(playerid, 37.000000, 272.000000, "BUY");
	PlayerTextDrawFont(playerid, BuySkinTD[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, BuySkinTD[playerid][3], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, BuySkinTD[playerid][3], 16.500000, 63.500000);
	PlayerTextDrawSetOutline(playerid, BuySkinTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, BuySkinTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, BuySkinTD[playerid][3], 2);
	PlayerTextDrawColour(playerid, BuySkinTD[playerid][3], 9109759);
	PlayerTextDrawBackgroundColour(playerid, BuySkinTD[playerid][3], 255);
	PlayerTextDrawBoxColour(playerid, BuySkinTD[playerid][3], 9109704);
	PlayerTextDrawUseBox(playerid, BuySkinTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, BuySkinTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, BuySkinTD[playerid][3], 1);

	BuySkinTD[playerid][4] = CreatePlayerTextDraw(playerid, 36.000000, 351.000000, "CANCEL");
	PlayerTextDrawFont(playerid, BuySkinTD[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, BuySkinTD[playerid][4], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, BuySkinTD[playerid][4], 16.500000, 63.500000);
	PlayerTextDrawSetOutline(playerid, BuySkinTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, BuySkinTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, BuySkinTD[playerid][4], 2);
	PlayerTextDrawColour(playerid, BuySkinTD[playerid][4], -16776961);
	PlayerTextDrawBackgroundColour(playerid, BuySkinTD[playerid][4], 255);
	PlayerTextDrawBoxColour(playerid, BuySkinTD[playerid][4], -16777016);
	PlayerTextDrawUseBox(playerid, BuySkinTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, BuySkinTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, BuySkinTD[playerid][4], 1);

	BuySkinTD[playerid][5] = CreatePlayerTextDraw(playerid, 188.000000, 111.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, BuySkinTD[playerid][5], 5);
	PlayerTextDrawLetterSize(playerid, BuySkinTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, BuySkinTD[playerid][5], 189.000000, 222.500000);
	PlayerTextDrawSetOutline(playerid, BuySkinTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, BuySkinTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, BuySkinTD[playerid][5], 1);
	PlayerTextDrawColour(playerid, BuySkinTD[playerid][5], -1);
	PlayerTextDrawBackgroundColour(playerid, BuySkinTD[playerid][5], 0);
	PlayerTextDrawBoxColour(playerid, BuySkinTD[playerid][5], 255);
	PlayerTextDrawUseBox(playerid, BuySkinTD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, BuySkinTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, BuySkinTD[playerid][5], 0);
	PlayerTextDrawSetPreviewModel(playerid, BuySkinTD[playerid][5], 1);
	PlayerTextDrawSetPreviewRot(playerid, BuySkinTD[playerid][5], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehicleColours(playerid, BuySkinTD[playerid][5], 1, 1);

	BuySkinTD[playerid][6] = CreatePlayerTextDraw(playerid, 235.000000, 109.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, BuySkinTD[playerid][6], 5);
	PlayerTextDrawLetterSize(playerid, BuySkinTD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, BuySkinTD[playerid][6], 189.000000, 222.500000);
	PlayerTextDrawSetOutline(playerid, BuySkinTD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, BuySkinTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, BuySkinTD[playerid][6], 1);
	PlayerTextDrawColour(playerid, BuySkinTD[playerid][6], -1);
	PlayerTextDrawBackgroundColour(playerid, BuySkinTD[playerid][6], 0);
	PlayerTextDrawBoxColour(playerid, BuySkinTD[playerid][6], 255);
	PlayerTextDrawUseBox(playerid, BuySkinTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, BuySkinTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, BuySkinTD[playerid][6], 0);
	PlayerTextDrawSetPreviewModel(playerid, BuySkinTD[playerid][6], 1);
	PlayerTextDrawSetPreviewRot(playerid, BuySkinTD[playerid][6], -10.000000, 0.000000, 20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehicleColours(playerid, BuySkinTD[playerid][6], 1, 1);

	BuySkinTD[playerid][7] = CreatePlayerTextDraw(playerid, 309.000000, 322.000000, "~G~R$320");
	PlayerTextDrawFont(playerid, BuySkinTD[playerid][7], 3);
	PlayerTextDrawLetterSize(playerid, BuySkinTD[playerid][7], 0.554166, 2.449999);
	PlayerTextDrawTextSize(playerid, BuySkinTD[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, BuySkinTD[playerid][7], 2);
	PlayerTextDrawSetShadow(playerid, BuySkinTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, BuySkinTD[playerid][7], 2);
	PlayerTextDrawColour(playerid, BuySkinTD[playerid][7], -1);
	PlayerTextDrawBackgroundColour(playerid, BuySkinTD[playerid][7], 255);
	PlayerTextDrawBoxColour(playerid, BuySkinTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, BuySkinTD[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, BuySkinTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, BuySkinTD[playerid][7], 0);
	//("teste 11");
}

DestruirTextDraws(playerid)
{
	static bool:erro = false;


	for (new i; i < 3; i++) {
    	if (IsValidPlayerTextDraw(playerid, miniaviso[playerid][i])) 
    	    PlayerTextDrawDestroy(playerid, miniaviso[playerid][i]);
 	    else{
 	    	erro = true;
 	    	break;
 	    }

    }   	
    
    if(erro){
    	erro = false;
    }

  
	for(new i; i < 3; i++){
	    if(IsValidPlayerTextDraw(playerid, skinSelect[playerid][i]))
			PlayerTextDrawDestroy(playerid, skinSelect[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	        
	}	
	if(erro){
	
		erro = false;
	}
	for(new i; i <  20; i++){
	    if(IsValidPlayerTextDraw(playerid, AmmunationText[playerid][i]))
			PlayerTextDrawDestroy(playerid, AmmunationText[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	}    
	if(erro){
		erro = false;
	}
	for(new i; i < 3; i++){
	    if(IsValidPlayerTextDraw(playerid, TelaCarregar[playerid][i]))
			PlayerTextDrawDestroy(playerid, TelaCarregar[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	}
	if(erro){
		erro = false;

	}
	for(new i; i < 8; i++){
	    if(IsValidPlayerTextDraw(playerid, Hud[playerid][i]))
			PlayerTextDrawDestroy(playerid, Hud[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	}
	if(erro){
		erro = false;
	}
	for(new i; i < 20; i++){
	    if(IsValidPlayerTextDraw(playerid, ConceMenu[playerid][i]))
				PlayerTextDrawDestroy(playerid, ConceMenu[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	        
	}
	if(erro){
		erro = false;
		
	}
	for(new i; i <  13; i++){
	    if(IsValidPlayerTextDraw(playerid, Velocimetro[playerid][i]))
				PlayerTextDrawDestroy(playerid, Velocimetro[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	        
	}
	if(erro){
		erro = false;
	}
	for(new SKINbd; SKINbd<  8; SKINbd++){
	    if(IsValidPlayerTextDraw(playerid, BuySkinTD[playerid][SKINbd]))
				PlayerTextDrawDestroy(playerid, BuySkinTD[playerid][SKINbd]);
	    else{
	    	erro = true;
	    	break;
	    }
	}
	if(erro){
		erro = false;
	}
	PlayerTextDrawDestroy(playerid, telapreta[playerid][0]);
	for(new i; i <  7; i++){
	    if(IsValidPlayerTextDraw(playerid, TunagemTD[playerid][i]))
				PlayerTextDrawDestroy(playerid, TunagemTD[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	        
	}
	if(erro){
		erro = false;
	}
	for(new i; i < 14; i++){
	    if(IsValidPlayerTextDraw(playerid, EditorAO[playerid][i]))
				PlayerTextDrawDestroy(playerid, EditorAO[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	        
	}
	if(erro){
		erro = false;
	}
	for(new i; i < 4; i++){
	    if(IsValidPlayerTextDraw(playerid,FomeSedeTD[playerid][i]))
				PlayerTextDrawDestroy(playerid,FomeSedeTD[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	}
	if(erro){
		erro = false;
	}
	for(new i; i <  10; i++){
	    if(IsValidPlayerTextDraw(playerid, LoginDraw[playerid][i]))
				PlayerTextDrawDestroy(playerid, LoginDraw[playerid][i]);
	    else{
	    	erro = true;
	    	break;
	    }
	}        
	if(erro){
		erro = false;
	}

}