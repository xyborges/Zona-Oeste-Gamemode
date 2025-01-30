enum meusitems{
	Quantia,
	Item,
}
new ItemInfo[MAX_PLAYERS][33][meusitems];
new PlayerText:DrawInv[MAX_PLAYERS][38];
CriarInventario(playerid){
	DrawInv[playerid][0] = CreatePlayerTextDraw(playerid, 373.000000, 179.000000, "box");
	PlayerTextDrawLetterSize(playerid, DrawInv[playerid][0], 0.000000, 14.687500);
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][0], 592.389404, 0.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][0], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, DrawInv[playerid][0], 1);
	PlayerTextDrawBoxColour(playerid, DrawInv[playerid][0], 150);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][0], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][0], 255);
	PlayerTextDrawFont(playerid, DrawInv[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][0], 1);
 
	DrawInv[playerid][1] = CreatePlayerTextDraw(playerid, 372.000000, 179.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][1], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][1], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][1], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][1], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][1], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][1], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][1], 0.000000, 0.000000, 0.000000, 99.000000);
 
	DrawInv[playerid][2] = CreatePlayerTextDraw(playerid, 400.000000, 179.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][2], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][2], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][2], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][2], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][2], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][2], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][3] = CreatePlayerTextDraw(playerid, 428.000000, 179.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][3], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][3], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][3], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][3], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][3], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][3], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][3], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][4] = CreatePlayerTextDraw(playerid, 456.000000, 179.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][4], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][4], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][4], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][4], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][4], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][4], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][4], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][5] = CreatePlayerTextDraw(playerid, 484.000000, 179.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][5], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][5], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][5], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][5], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][5], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][5], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][5], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][6] = CreatePlayerTextDraw(playerid, 512.000000, 179.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][6], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][6], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][6], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][6], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][6], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][6], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][6], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][6], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][7] = CreatePlayerTextDraw(playerid, 540.000000, 179.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][7], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][7], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][7], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][7], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][7], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][7], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][7], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][7], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][8] = CreatePlayerTextDraw(playerid, 568.000000, 179.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][8], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][8], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][8], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][8], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][8], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][8], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][8], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][8], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][9] = CreatePlayerTextDraw(playerid, 372.000000, 207.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][9], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][9], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][9], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][9], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][9], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][9], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][9], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][9], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][10] = CreatePlayerTextDraw(playerid, 400.000000, 207.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][10], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][10], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][10], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][10], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][10], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][10], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][10], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][10], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][11] = CreatePlayerTextDraw(playerid, 428.000000, 207.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][11], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][11], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][11], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][11], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][11], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][11], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][11], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][11], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][12] = CreatePlayerTextDraw(playerid, 456.000000, 207.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][12], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][12], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][12], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][12], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][12], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][12], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][12], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][12], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][13] = CreatePlayerTextDraw(playerid, 484.000000, 207.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][13], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][13], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][13], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][13], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][13], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][13], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][13], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][13], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][14] = CreatePlayerTextDraw(playerid, 512.000000, 207.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][14], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][14], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][14], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][14], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][14], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][14], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][14], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][14], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][15] = CreatePlayerTextDraw(playerid, 540.000000, 207.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][15], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][15], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][15], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][15], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][15], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][15], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][15], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][15], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][16] = CreatePlayerTextDraw(playerid, 568.000000, 207.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][16], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][16], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][16], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][16], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][16], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][16], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][16], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][16], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][17] = CreatePlayerTextDraw(playerid, 372.000000, 235.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][17], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][17], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][17], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][17], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][17], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][17], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][17], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][17], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][18] = CreatePlayerTextDraw(playerid, 400.000000, 235.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][18], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][18], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][18], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][18], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][18], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][18], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][18], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][18], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][19] = CreatePlayerTextDraw(playerid, 428.000000, 235.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][19], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][19], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][19], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][19], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][19], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][19], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][19], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][19], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][20] = CreatePlayerTextDraw(playerid, 456.000000, 235.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][20], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][20], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][20], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][20], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][20], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][20], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][20], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][20], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][21] = CreatePlayerTextDraw(playerid, 484.000000, 235.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][21], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][21], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][21], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][21], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][21], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][21], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][21], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][21], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][22] = CreatePlayerTextDraw(playerid, 512.000000, 235.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][22], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][22], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][22], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][22], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][22], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][22], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][22], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][22], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][22], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][23] = CreatePlayerTextDraw(playerid, 540.000000, 235.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][23], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][23], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][23], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][23], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][23], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][23], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][23], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][23], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][23], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][23], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][24] = CreatePlayerTextDraw(playerid, 568.000000, 235.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][24], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][24], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][24], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][24], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][24], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][24], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][24], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][24], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][24], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][24], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][25] = CreatePlayerTextDraw(playerid, 372.000000, 263.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][25], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][25], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][25], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][25], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][25], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][25], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][25], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][25], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][25], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][25], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][26] = CreatePlayerTextDraw(playerid, 400.000000, 263.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][26], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][26], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][26], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][26], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][26], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][26], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][26], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][26], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][26], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][26], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][27] = CreatePlayerTextDraw(playerid, 428.000000, 263.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][27], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][27], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][27], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][27], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][27], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][27], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][27], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][27], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][27], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][27], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][28] = CreatePlayerTextDraw(playerid, 456.000000, 263.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][28], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][28], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][28], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][28], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][28], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][28], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][28], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][28], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][28], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][28], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][29] = CreatePlayerTextDraw(playerid, 484.000000, 263.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][29], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][29], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][29], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][29], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][29], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][29], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][29], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][29], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][29], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][29], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][30] = CreatePlayerTextDraw(playerid, 512.000000, 263.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][30], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][30], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][30], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][30], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][30], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][30], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][30], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][30], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][30], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][30], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][31] = CreatePlayerTextDraw(playerid, 540.000000, 263.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][31], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][31], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][31], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][31], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][31], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][31], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][31], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][31], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][31], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][31], 0.000000, 0.000000, 0.000000, 1.000000);
 
	DrawInv[playerid][32] = CreatePlayerTextDraw(playerid, 568.000000, 263.000000, "");
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][32], 25.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][32], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][32], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][32], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][32], 170);
	PlayerTextDrawFont(playerid, DrawInv[playerid][32], 5);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][32], 0);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][32], true);
	PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][32], 0);
	PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][32], 0.000000, 0.000000, 0.000000, 1.000000);
 
	for(new i = 1; i < 33; ++i)
	{
		PlayerTextDrawSetPreviewRot(playerid, DrawInv[playerid][i], 0.000000, 0.000000, 0.000000, 1);
	}
 
	DrawInv[playerid][33] = CreatePlayerTextDraw(playerid, 373.000000, 161.000000, "box");
	PlayerTextDrawLetterSize(playerid, DrawInv[playerid][33], 0.000000, 1.466506);
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][33], 592.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][33], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][33], -1);
	PlayerTextDrawUseBox(playerid, DrawInv[playerid][33], 1);
	PlayerTextDrawBoxColour(playerid, DrawInv[playerid][33], 255);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][33], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][33], 255);
	PlayerTextDrawFont(playerid, DrawInv[playerid][33], 1);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][33], 1);
 
	DrawInv[playerid][34] = CreatePlayerTextDraw(playerid, 372.000000, 162.000000, "INVENTARIO:_MAX_PLAYER_NAME");
	PlayerTextDrawLetterSize(playerid, DrawInv[playerid][34], 0.210623, 0.888332);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][34], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][34], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][34], 0);
	PlayerTextDrawSetOutline(playerid, DrawInv[playerid][34], 1);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][34], 255);
	PlayerTextDrawFont(playerid, DrawInv[playerid][34], 1);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][34], 1);
 
	DrawInv[playerid][35] = CreatePlayerTextDraw(playerid, 584.375000, 163.166656, "X");
	PlayerTextDrawLetterSize(playerid, DrawInv[playerid][35], 0.298748, 0.824165);
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][35], 590, 10.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][35], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][35], -16776961);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][35], 0);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][35], 255);
	PlayerTextDrawFont(playerid, DrawInv[playerid][35], 3);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][35], 1);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][35], true);
 
	DrawInv[playerid][36] = CreatePlayerTextDraw(playerid, 374.000000, 296.000000, "Usar");
	PlayerTextDrawLetterSize(playerid, DrawInv[playerid][36], 0.200000, 1.000000);
	PlayerTextDrawTextSize(playerid, DrawInv[playerid][36], 396, 10.000000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][36], 1);
	PlayerTextDrawColour(playerid, DrawInv[playerid][36], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, DrawInv[playerid][36], 1);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][36], 255);
	PlayerTextDrawFont(playerid, DrawInv[playerid][36], 2);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][36], 1);
	PlayerTextDrawSetSelectable(playerid, DrawInv[playerid][36], true);

 
	DrawInv[playerid][37] = CreatePlayerTextDraw(playerid, 593.147094, 303.800354, "_0_unidades");
	PlayerTextDrawLetterSize(playerid, DrawInv[playerid][37], 0.200000, 0.800000);
	PlayerTextDrawAlignment(playerid, DrawInv[playerid][37], 3);
	PlayerTextDrawColour(playerid, DrawInv[playerid][37], -1);
	PlayerTextDrawSetShadow(playerid, DrawInv[playerid][37], 0);
	PlayerTextDrawSetOutline(playerid, DrawInv[playerid][37], 1);
	PlayerTextDrawBackgroundColour(playerid, DrawInv[playerid][37], 255);
	PlayerTextDrawFont(playerid, DrawInv[playerid][37], 1);
	PlayerTextDrawSetProportional(playerid, DrawInv[playerid][37], 1);
 
}
new Pagina[MAX_PLAYERS] = 1;
enum {
	NADA = 18631,
	CELULAR = 18866,
	CREDITOS = 1277,
	CHIP = 1581,
	CAPACETE = 18977,
	CAPACETE_V = 19109,
	RADINHO = 19942, 
	PIZZA = 19580,
	HAMBURGUER = 2880,
	COXINHA = 19847,
	PRATO_FEITO = 2221,
	FEIJOADA = 19638,
	BAURU = 19579,
	COCA_COLA = 19835,
	PEPSI = 19569,
	SUCO_LARANJA = 19564,
	SUCO_MARACUJA = 19563,
	DINAMITE = 1654,
	DINHEIRO_FLUTUANTE = 1212,
	JBL = 2229,
	MACONHA = 19473,
	SEMENTE = 625,
	LEITE = 19570,
	LOCKPICK = 19804,
	MP3 = 19424,
	PORTAO = 980,
	DINHEIRO_FLUTUANTE_BANDIDO = 1550,
	CAIXA_ENTREGA = 2358,
	AGUA = 1484,
	CERVEJA = 1951,
	CAIXA = 2912,
	GALAO_CHEIO = 19621,
	GALAO_VAZIO = 1666,
	REDE = 2945,
	DILDO_ROXO = 321,
	DILDO_PEQUENO = 322,
	DILDO_MEDIO = 323,
	DILDO_GRANDE = 324,
	FLORES = 325,
	CABO = 326,
	SOCO_INGLES = 331,
	TACO_DE_GOLF = 333,
	CACETETE = 334,
	FACA = 335,
	TACO_DE_BASEBALL = 336,
	ARMA_APA = 337,
	TACO_DE_SINUCA = 338,
	KATANA = 339,
	MOTOSERRA = 341,
	DESERT_EAGLE = 348,
	SHOTGUN = 349,
	SAWEDOFF = 350,
	SPAS = 351,
	UZI = 352,
	MP5 = 353,
	AK_47 = 355,
	M4_A1 = 356,
	ESPINGARDA = 357,
	SNIPER = 358,
	RPG = 359,
	HEAT_SEAKER = 360,
	LANCA_CHAMAS = 361,
	MINIGUN = 362,
	DETONADOR = 364,
	SPRAY = 365,
	EXTINTOR = 366,
	OCULOS_VN = 368,
	OCULOS_CALOR = 369,
	PARAQUEDAS = 371,
	TEC9 = 372,
	HOT_KNIFE = 434,
	UFO_AVIAO = 512,
	BANDITO = 568
}
InventarioName(item)
{
	new name[32];
	if(IsSkin(item)){
		name = "Skin";
		return name;
	}
	for(new i; i < sizeof Acessorios; i++){
		if(Acessorios[i][AcessorioId] == item){
			format(name, sizeof name, Acessorios[i][AcessorioNome]);
			return name;
		}
	}
	switch(item){
		case CELULAR: name = "Celular";
	    case CREDITOS: name = "Creditos";
	    case CHIP: name = "Chip";
	    case CAPACETE: name = "Capacete";
	    case RADINHO: name = "Radinho";
	    case PIZZA: name = "Pizza";
	    case HAMBURGUER: name = "Hamburguer";
	    case COXINHA: name = "Coxinha";
	    case PRATO_FEITO: name = "Prato-Feito";
	    case FEIJOADA: name = "Feijoada";
	    case BAURU: name = "Bauru";
	    case COCA_COLA: name = "Coca-Cola";
	    case PEPSI: name = "Pepsi";
	    case SUCO_LARANJA: name = "Suco_De_Laranja";
	    case SUCO_MARACUJA: name = "Suco_De_Maracuja";
	    case DINAMITE: name = "Dinamite";
	    case DINHEIRO_FLUTUANTE_BANDIDO: name = "Dinheiro_De_Roubo";
	    case DINHEIRO_FLUTUANTE: name = "Dinheiro";
	    case MACONHA: name = "Maconha";
	    case MP3: name = "MP3";
	    case LOCKPICK: name = "LockPick";
	    case 980: name = "Portao";
	    case GALAO_VAZIO: name = "Galao_Vazio";
	    case GALAO_CHEIO: name = "Galao_Com_Gasolina";
	    case SEMENTE: name = "Semente";
	    case LEITE: name = "Leite";
	    case JBL: name = "JBL";
	    case AGUA: name = "Agua";
	    case CERVEJA: name = "Cerveja";
	    case REDE: name = "Rede_de_Pescar";
		case DILDO_ROXO: name = "Dildo_Roxo";
		case DILDO_PEQUENO: name= "Dildo_Pequeno";
		case DILDO_MEDIO: name = "Dildo_Medio";
		case DILDO_GRANDE: name = "Dildo_Grande";
		case FLORES: name = "Flores";
		case CABO: name = "Cabo";
		case SOCO_INGLES: name = "Soco_Ingles";
		case TACO_DE_GOLF: name = "Taco_De_Golf";
		case CACETETE: name = "Cacetete";
		case FACA: name = "Faca";
		case TACO_DE_BASEBALL: name = "Taco_De_Baseball";
		case ARMA_APA: name  = "Apa";
		case TACO_DE_SINUCA: name = "Taco_De_Sinuca";
		case KATANA: name = "Katana";
		case MOTOSERRA: name = "Motoserra";
		case DESERT_EAGLE: name  = "Desert_Eagle";
		case SHOTGUN: name = "Shotgun";
		case SAWEDOFF: name = "Sawed-off";
		case SPAS: name = "Spas-12";
		case UZI: name  = "Uzi";
		case MP5: name = "MP5";
		case AK_47: name = "AK-47";
		case M4_A1: name = "M4-A1";
		case ESPINGARDA: name  = "Espingarda";
		case SNIPER: name = "Sniper";
		case RPG: name = "RPG";
		case HEAT_SEAKER: name = "Heat-Seaker";
		case LANCA_CHAMAS: name = "Lanca-Chamas";
		case MINIGUN: name = "Minigun";
		case DETONADOR: name = "Detonador";
		case SPRAY: name = "Spray";
		case EXTINTOR: name = "Extintor";
		case OCULOS_VN: name = "Visao_Noturna";
		case OCULOS_CALOR: name = "Visao_De_Calor";
		case PARAQUEDAS: name = "Paraquedas";
		case TEC9: name = "Tec9";
		case UFO_AVIAO: name = "OVNI";
		case HOT_KNIFE, BANDITO:{
			return GetVehicleName(item);
		}
		default: name = "Vazio";
	}
	return name;
}
stock IdDoItem(ArmaID)
{
	switch(ArmaID)
	{
	    case 331: ArmaID = 1;
	    case 333: ArmaID = 2;
	    case 334: ArmaID = 3;
	    case 335: ArmaID = 4;
	    case 336: ArmaID = 5;
	    case 337: ArmaID = 6;
	    case 338: ArmaID = 7;
	    case 339: ArmaID = 8;
	    case 341: ArmaID = 9;
	    case 321: ArmaID = 10;
	    case 322: ArmaID = 11;
	    case 323: ArmaID = 12;
	    case 324: ArmaID = 13;
	    case 325: ArmaID = 14;
	    case 326: ArmaID = 15;
	    case 342: ArmaID = 16;
	    case 343: ArmaID = 17;
	    case 344: ArmaID = 18;
	    case 346: ArmaID = 22;
	    case 347: ArmaID = 23;
	    case 348: ArmaID = 24;
	    case 349: ArmaID = 25;
	    case 350: ArmaID = 26;
	    case 351: ArmaID = 27;
	    case 352: ArmaID = 28;
	    case 353: ArmaID = 29;
	    case 355: ArmaID = 30;
	    case 356: ArmaID = 31;
	    case 372: ArmaID = 32;
	    case 357: ArmaID = 33;
	    case 358: ArmaID = 34;
	    case 359: ArmaID = 35;
	    case 360: ArmaID = 36;
	    case 361: ArmaID = 37;
	    case 362: ArmaID = 38;
	    case 363: ArmaID = 39;
	    case 364: ArmaID = 40;
	    case 365: ArmaID = 41;
	    case 366: ArmaID = 42;
	    case 367: ArmaID = 43;
	    case 368: ArmaID = 44;
	    case 369: ArmaID = 45;
	    case 371: ArmaID = 46;
	}
	return ArmaID;
}
IDparaARMA(ArmaID)
{
    new myvvar = -1; // Default value if no match is found
    
    switch (ArmaID)
    {
        case 1: myvvar = 331; 
        case 2: myvvar = 333; 
        case 3: myvvar = 334; 
        case 4: myvvar = 335; 
        case 5: myvvar = 336; 
        case 6: myvvar = 337; 
        case 7: myvvar = 338; 
        case 8: myvvar = 339; 
        case 9: myvvar = 341; 
        case 10: myvvar = 321; 
        case 11: myvvar = 322; 
        case 12: myvvar = 323; 
        case 13: myvvar = 324; 
        case 14: myvvar = 325; 
        case 15: myvvar = 326; 
        case 16: myvvar = 342; 
        case 17: myvvar = 343; 
        case 18: myvvar = 344; 
        case 22: myvvar = 346; 
        case 23: myvvar = 347; 
        case 24: myvvar = 348; 
        case 25: myvvar = 349; 
        case 26: myvvar = 350; 
        case 27: myvvar = 351; 
        case 28: myvvar = 352; 
        case 29: myvvar = 353; 
        case 30: myvvar = 355; 
        case 31: myvvar = 356; 
        case 32: myvvar = 372; 
        case 33: myvvar = 357; 
        case 34: myvvar = 358; 
        case 35: myvvar = 359; 
        case 36: myvvar = 360; 
        case 37: myvvar = 361; 
        case 38: myvvar = 362; 
        case 39: myvvar = 363; 
        case 40: myvvar = 364; 
        case 41: myvvar = 365; 
        case 42: myvvar = 366; 
        case 43: myvvar = 367; 
        case 44: myvvar = 368; 
        case 45: myvvar = 369; 
        case 46: myvvar = 371; 
    }

    return myvvar;
}
