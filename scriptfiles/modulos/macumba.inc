WasteDeAMXersTime();

#include <open.mp>
#define MAX_MACUMBA 100

enum MacumbaEnum{
	bool:MacumbaCriada,
	Float:MacumbaPos[3],
	Pessoa[24 + 1],
	ObjetosMacumba[11]
}
new InfoMacumba[MAX_MACUMBA][MacumbaEnum];
enum macmbPos{
	Float: xm, Float: ym, Float: zm
}
new MacumbaPositions[][macmbPos] = {
	{223.45110, 1901.62268, 16.68070},
	{224.07140, 1901.60913, 16.64090},
	{224.03140, 1901.60913, 16.64090},
	{224.05141, 1901.60913, 16.68090},
	{224.05403, 1901.18835, 16.64209},
	{224.36046, 1901.56116, 16.64209},
	{223.21695, 1901.03979, -1.0},
	{223.84990, 1902.10095, 0.3},
	{223.57117, 1901.28577, 16.67780},
	{223.53770, 1901.18958, 16.67780},
	{223.46666, 1901.25977, 16.67780}
};
GerarMacumba(const pessoa[], Float: dX, Float: dY, Float: dZ){
	for(new incd; incd < MAX_MACUMBA; incd++){
		if(InfoMacumba[incd][MacumbaCriada]) continue;
		print("c");
		InfoMacumba[incd][MacumbaCriada] = true;
		format(InfoMacumba[incd][Pessoa], 24, pessoa);
		InfoMacumba[incd][MacumbaPos][0] = dX;
		InfoMacumba[incd][MacumbaPos][1] = dY;
		InfoMacumba[incd][MacumbaPos][2] = dZ;
		print("d");

		InfoMacumba[incd][ObjetosMacumba][0] = CreateDynamicObject(19993, dX, dY, dZ,   0.00000, 0.00000, 0.00000);
		InfoMacumba[incd][ObjetosMacumba][1] = CreateDynamicObject(19578, dX, dY, dZ,   0.00000, 0.00000, -98.00000);
		InfoMacumba[incd][ObjetosMacumba][2] = CreateDynamicObject(19578, dX, dY, dZ,   0.00000, 0.00000, -98.00000);
		InfoMacumba[incd][ObjetosMacumba][3] = CreateDynamicObject(19578, dX, dY, dZ,   0.00000, 0.00000, -98.00000);
		InfoMacumba[incd][ObjetosMacumba][4] = CreateDynamicObject(19820, dX, dY, dZ,   0.00000, 0.00000, 0.00000);
		InfoMacumba[incd][ObjetosMacumba][5] = CreateDynamicObject(19820, dX, dY, dZ,   0.00000, 0.00000, 0.00000);
		InfoMacumba[incd][ObjetosMacumba][6] = CreateDynamicObject(3461, dX, dY, dZ,   0.00000, 0.00000, 0.00000);
		InfoMacumba[incd][ObjetosMacumba][7] = CreateDynamicObject(2245, dX, dY, dZ,   0.00000, 0.00000, 0.00000);
		InfoMacumba[incd][ObjetosMacumba][8] = CreateDynamicObject(19575, dX, dY, dZ,   0.00000, 0.00000, 0.00000);
		InfoMacumba[incd][ObjetosMacumba][9] = CreateDynamicObject(19575, dX, dY, dZ,   0.00000, 0.00000, 0.00000);
		InfoMacumba[incd][ObjetosMacumba][10] = CreateDynamicObject(19575, dX, dY, dZ,   0.00000, 0.00000, 0.00000);

		print("e");
		for(new j; j < 11; j++){
			if(j == 0) continue;
			//AttachDynamicObjectToObject(STREAMER_TAG_OBJECT objectid, attachtoid, Float:offsetx, Float:offsety, Float:offsetz, Float:rx, Float:ry, Float:rz, syncrotation = 1)
			AttachDynamicObjectToObject(InfoMacumba[incd][ObjetosMacumba][j], InfoMacumba[incd][ObjetosMacumba][0], 
				floatsub(MacumbaPositions[0][xm], MacumbaPositions[j][xm]), 
				floatsub(MacumbaPositions[0][ym], MacumbaPositions[j][ym]), 
				(j == 6 || j == 7 ? (MacumbaPositions[j][zm]) : (0.0)), 0,0,0);
				
		}
		print("f");
		return incd;
	}
	return -1;
}