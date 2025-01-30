/* --------------------------- < Creditos Do Servidor > ---------------------------*/	

/*				
				 Projeto iniciado em 25/03/2021 (12:03pm), por Joao Borges.
				 Creditos aos envolvidos deste projeto.


					Zona Oeste Roleplay (2021-2023)

					Joao Borges
					Douglas Alves 
					Pedro Henrique
					Wellington 
					Marselo
					David
					Arthur
					Bruno
					Orleans Roleplay ( Projeto inicial )



					Novos Creditos:

					Reiniciando o desenvolvimento em 20/09/2023 (16:51pm)
					João Borges.
					Douglas Alves.
					Pedro Henrique.
					Gabriel Ferrin.

					Zona Oeste - RPG

*/	
/* --------------------------- <Includes Do Servidor > ---------------------------*/
#pragma warning disable 213, 204 // porra de open mp
#include <open.mp>
#include <Pawn.CMD>
#include <Pawn.Raknet>					
#include <streamer>
#include <sscanf2>
#include <SVAO>
#include <a_mysql>
#include <B_Neon>
#include <foreach>	
/*          ---------------   Modulos   ---------------          */
#include "../scriptfiles/modulos/mapas.inc"
#include "../scriptfiles/modulos/textdraws.inc"
#include "../scriptfiles/modulos/grandesfuncoes.inc"
#include "../scriptfiles/modulos/objetos.inc"
#include "../scriptfiles/modulos/macumba.inc"
#include "../scriptfiles/modulos/pegarmunicao.inc"
#include "../scriptfiles/modulos/macascfg.inc"
#include "../scriptfiles/modulos/Cores.inc"
//#include "../scriptfiles/modulos/voip.inc"
//#include "../scriptfiles/modulos/armatemperatura.inc"
#include "../scriptfiles/modulos/OnPlayerChangeWeapon.inc"
/* --------------------------- < Parte Includes Anti-Cheat > ---------------------------*/
#include <anti_air_break.inc>
#include <Anti-Cheat/FakeKill.inc>
#include <Anti-Cheat/GodMode.inc>			
#include <Anti-Cheat/anti_gun_cheat.inc>
#include <Anti-Cheat/VehicleAbuse.inc>
/* ====================================================================== */

enum{
	SET_POSITION,
	GET_POSITION
}
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define TIRE_POPPED        1
#define TIRE_UNCHANGED     0
#define MAX_GARAGENS 100
#define function%0(%1) forward%0(%1); public%0(%1)
#define GetDynamicObjectModel(%0) Streamer_GetIntData(STREAMER_TYPE_OBJECT, %0, E_STREAMER_MODEL_ID)
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define SERIAL_1 "8090899D04944F5C4C5409A49C8409D9FD499D49"
#define SERIAL_2 "552A682729B38D271A9AD55B21B426406EC711C3"
#define SERIAL_3 "4458465947454248504B51425156534F4738384F"
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define pScripter "{3BC4FF}B{5BADEB}O{7C96D7}R{9C7FC4}G{BD68B0}E{DE519C}S" 
#define NIVEL_SCRIPTER 11
#define SCRIPTER_IP "..."
#define PIX_SERVIDOR "79683cbf-c95f-4dce-843d-45309c2a15d2"
#define PIX_SERVIDOR_EMAIL "sem"
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define MASCULINO 1
#define FEMININO 2
#define SKIN_MASCULINO 26
#define SKIN_FEMININA 150
#define totald 1.0
#define MAX_FREQUENCIAS 500
#define MAX_LOCALS_S	120
#define MAX_EMPRESAS 120
#define CAR 0
#define BIKE 1
#define MOTORBIKE 2
#define BOAT 3
#define PLANE 4
#define RCCAR 5
#define TRAIN 6
#define TRAILER 7
#define HELICOPTER 8
#define IsPlayerAndroid(%0)                 GetPVarInt(%0, "NotAndroid") == 0
#define MAX_CAMERAS 100
#define MAX_MACONHAS 200
#define CofreNormal 2332
#define CofreQbrado 1829
#define MAX_PORTAO  100
#define MAX_COFRES	25
#define FLOAT_VALUE 2.0
#define MAX_JBL	 30
#define MAX_IDARMAS 47
#define segundos(%0) (1000 * %0)
#define minutos(%0) (1000 * %0 * 60)
#define MAX_CAIXAS          100
#define MAX_GPS_LOCAL       320
#define MAX_EMPREGOS        20
#define MAX_COMPRAS_PICK    100
#define MAX_INTERIORES      120
#define MAX_CARRO_SPAWN 	15
#define MAX_PLAYER_SENHA 	50
#define MAX_CARRO_CONCE 	90
#define MAX_CARRO_ORG       12
#define MAX_OBJT        	800
#define MAX_ORGS            30
#define MAX_CARROS 			12
#define MAXCONCE            5
#define MAX_POSTOS 20
#define TEXTO_EMPRESAAVENDA "(%d)%s\nValor Bruto: {33aa33}%dR$\n{ffffff}Ganhos Por Hora: {33aa33}%d\n{fff000}/comprarempresa"
#define TEXTO_EMPRESACOMPRADA "(%d)%s\nValor Pago: {33aa33}%d\n{ffffff}Ganhos Por Hora: {33aa33}%d\n{fff000}Dono: %s"
#define ISP 			 	IsPlayerInRangeOfPoint
#define MAX_GZS 			999
#define MAX_CASAS   		500
#define MAX_TAMANHO         15
#define MAX_CONTRATOS		50
#define CONFIRM_SOUNDID					1083					//Confirmation Sound
#define TEXTO_GARAGEMAVENDA "{33ccff}Garagem ID: %d\n{fff000}Dono: %s\nPreco: %d\n%s\n{ffffff}use /comprargaragem."
#define TEXTO_GARAGEMCOMPRADA "{33ccff}Garagem ID: %d\n{fff000}Dono: %s\n%s\n{ffffff}Aperte Y para entrar."
#define TEXTO_AVENDAV    	"{ffff00}VIP\n{33ccff}Residencia N. %d\n{FFF000}Dono: %s\n{ffffff}Preco: {00ff15}R$%d\n%s\n{33ccff}Aluguel: {33aa33}%dR$\n{33aa33}/comprarcasa\n{ffffff}Aperte Y para entrar"
#define TEXTO_COMPRADOV  	"{ffff00}VIP\n{33ccff}Residencia N. %d\n{FFF000}Dono: %s\n{00ff15}%s\n{33ccff}Aluguel: {33aa33}%dR$\n{ffffff}Aperte Y para entrar"
#define TEXTO_AVENDA    	"{33ccff}Residencia N. %d\n{FFF000}Dono: %s\n{ffffff}Preco: {00ff15}R$%d\n%s\n{33ccff}Aluguel: {33aa33}%dR$\n{33aa33}/comprarcasa\n{ffffff}Aperte Y para entrar"
#define TEXTO_COMPRADO  	"{33ccff}Residencia N. %d\n{FFF000}Dono: %s\n{00ff15}%s\n{33ccff}Aluguel: {33aa33}%dR$\n{ffffff}Aperte Y para entrar"
#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif
#define MAX_DROPS   800
#define VEHICLE_PART_DIANTEIRODIREITO   (1)
#define VEHICLE_PART_DIANTEIROESQUERDO  (2)
#define VEHICLE_PART_TRASEIRODIREITO    (3)
#define VEHICLE_PART_TRASEIROESQUERDO   (4)
#define VEHICLE_PART_FRENTE             (5)
#define VEHICLE_PART_TRAZ               (6)
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
static const Float:coordspegaremp[11][] = {
	{-1046.7114, -585.7683, 32.2494},
	{-357.2361,-454.2185,6.9756},
	{-424.6707,-1763.9119,7.4376},
	{-438.9700,-1757.5052,7.4376},
	{2421.0293,-2101.2983,13.5538},
	{1709.5602,924.0325,-8.6412},
	{1832.1105,-1446.1182,13.5930},
	{-371.35501, -1436.94507, 25.65495},
	{595.9457,-1514.7836,15.4952},
	{-1644.03650, -2231.24292, 29.53947},
	{1183.25842, -1316.67725, 13.55144}
};
static const Float:spawnaleatorio[7][] = {
	{1176.5670,-1668.1007,22.2344},
	{1202.7865,-1719.4417,13.5469},
	{1369.7628,-1738.5957,13.5469},
	{1535.9998,-1660.2532,13.5469},
	{1224.4777,-1411.5140,13.2753},
	{941.7363,-1798.8944,13.9759},
	{1398.9897,-1864.9669,13.5469}

};
#define MAX_ALUGUEIS 50
new timerRCx;
new MyBuffer[255];
new TimerTeste[MAX_PLAYERS];
new TimeCorte[MAX_PLAYERS];
new NaMao[MAX_PLAYERS];
new MadeirasGlobal;
new TimerCarregandoMadeira[MAX_PLAYERS];
new MadeirasCarro[MAX_VEHICLES];
new TimerDescarregar[MAX_PLAYERS];
new TempoMembros[MAX_PLAYERS];
new TempoComando[MAX_PLAYERS];
new TempoComandoReparo[MAX_PLAYERS];
new TempoComandoAbastecer[MAX_PLAYERS];
new TimeCarregandoCaminhao[MAX_PLAYERS];
new TimerLogin[MAX_PLAYERS];
new BikePlayer[MAX_PLAYERS];
new Discando[MAX_PLAYERS];
new TimerChamarLigacao[MAX_PLAYERS];
new CarroForte[MAX_VEHICLES];
new TimerCarregandoCF[MAX_PLAYERS];
new Caixaplayer[MAX_PLAYERS];
new DentroDeCasa[MAX_PLAYERS];
new DentroDeGaragem[MAX_PLAYERS];
new TimerReabastecerCaixa[MAX_PLAYERS];
new TimePlantarBomba[MAX_PLAYERS];
new TimerRepararcaixa[MAX_PLAYERS];
new TimerPlayer[MAX_PLAYERS][8];
new skinidplayer[MAX_PLAYERS] = 1;
new CriouJBL[MAX_PLAYERS];
new JBLProxima[MAX_PLAYERS];
new NivelAdmin[MAX_PLAYERS];
new Hits[MAX_PLAYERS];
new TimerVelocimetro[MAX_PLAYERS];
new TickUp[MAX_PLAYERS];
new LEITEs[MAX_PLAYERS];
new TimerLEITE[MAX_PLAYERS];
new OutrosTimers;
new TimerPayday;
new TimerTaximetro[MAX_VEHICLES];
new TempoEquipar[MAX_PLAYERS];
new contandogas[MAX_PLAYERS];
new SlotTunCar[MAX_PLAYERS] = 0;
new vComponent[MAX_VEHICLES];
new ComponentesQuimicos[MAX_PLAYERS];
new TimerColherMC[MAX_PLAYERS];
new gettimeMaconha[8];
new TimerMac[MAX_PLAYERS];
new TimerPMac[MAX_PLAYERS];
new CurandoAlguem[MAX_PLAYERS];
new TipoEdicao[MAX_PLAYERS];
new tempocomando[MAX_PLAYERS];
new Tempopayday;
new Tempocaixa;
new tempoAluguelCobrar;
new ZonaDeCaca;
new ZonaDeCacaDinamica;
new DynamicZonaCaca;
new Couros[MAX_PLAYERS];
new veiculoslot[MAX_PLAYERS];
new tipoconce[MAX_PLAYERS];
new CarroConce[6];
new varAmmunation[MAX_PLAYERS];
new AvisosArma[MAX_PLAYERS];
new VeiculoEntrou[MAX_PLAYERS];
new MinhaOpcao[MAX_PLAYERS];
new VotosSim;
new VotosNao;
new bool:permissao_gmx;
new bool:JaRegistrado[MAX_PLAYERS];
new bool: EnqueteCriada;
new bool: Votou[MAX_PLAYERS];
new bool: Sentado[MAX_PLAYERS];
new bool: Algemado[MAX_PLAYERS];
new bool: TaserAtivado[MAX_PLAYERS];
new bool: NoTaser[MAX_PLAYERS];
new bool: CarregandoCombustivel[MAX_VEHICLES];
new bool: Abastecendo[MAX_PLAYERS] = {false, ...};
new bool: EnchendoGalao[MAX_PLAYERS];
new bool: BancoSendoRoubado;
new bool: RoubandoBanco[MAX_PLAYERS];
new bool: NoSaco[MAX_PLAYERS];
new bool: PegandoCouro[MAX_PLAYERS];
new bool: DscEq[MAX_PLAYERS];
new bool: Morto[MAX_PLAYERS];
new bool: SendoCurado[MAX_PLAYERS];
new bool: Controle[MAX_PLAYERS];
new bool: Internado[MAX_PLAYERS];
new bool: PlantandoSEMENTE[MAX_PLAYERS];
new bool: EmTunagem[MAX_PLAYERS];
new bool: PedindoTaxi[MAX_PLAYERS];
new bool: PedindoSamu[MAX_PLAYERS];
new bool: Atropelado[MAX_PLAYERS];
new bool: VeiculoOcupado[MAX_VEHICLES];
new bool: ComandoDado[MAX_PLAYERS];
new bool: Cinto[MAX_PLAYERS];
new bool: InCamera[MAX_PLAYERS];
new bool: PedindoMecanico[MAX_PLAYERS];
new bool: Consertando[MAX_PLAYERS];
new bool: BombaPlantada[MAX_VEHICLES];
new bool: PlantandoCaixa[MAX_PLAYERS];
new bool: ReparandoCaixa[MAX_PLAYERS];
new bool: Sequestrado[MAX_PLAYERS];
new bool: Arrastado[MAX_PLAYERS];
new bool: ReabastecendoCaixa[MAX_PLAYERS];
new bool: MotoristaCF[MAX_PLAYERS];
new bool: QueLigou[MAX_PLAYERS];
new bool: EmChamada[MAX_PLAYERS];
new bool: EmTv[MAX_PLAYERS];
new bool: BikeSpawn[MAX_VEHICLES];
new bool: VeiculoEmprego[MAX_VEHICLES];
new bool: TrabalhoStaff[MAX_PLAYERS];
new bool: CarregandoCaminhao[MAX_PLAYERS];
new bool: Roubando;
new bool: Plantando[MAX_PLAYERS];
new bool: EditandoCaixa[MAX_PLAYERS];
new bool: DescarregandoMadeiras[MAX_PLAYERS];
new bool: JaCortando[MAX_PLAYERS];
new bool: CarregandoMadeira[MAX_PLAYERS];
new bool: TextoGerado;
new bool: Negociando[MAX_PLAYERS];
new bool: Comprador[MAX_PLAYERS];
new bool: EmTeste[MAX_PLAYERS];
new bool: TrabalhandoEmprego[MAX_PLAYERS][MAX_EMPREGOS];
new bool: Pescando[MAX_PLAYERS];
new bool: MochilaTDAberta[MAX_PLAYERS];
new bool: InEdit[MAX_PLAYERS];
new bool: novato[MAX_PLAYERS];
new CarregandoCF[MAX_PLAYERS];
new SkinSelected[MAX_PLAYERS];
new race_check[MAX_PLAYERS];
new CaminhaoCarregado[MAX_VEHICLES];
new TimerPesca[MAX_PLAYERS];
new Peixes[MAX_PLAYERS];
new TimerMaconha;
new VeiculoHab[MAX_PLAYERS];
new AvisoAuto[MAX_PLAYERS];
new CheckCarro[MAX_PLAYERS];
new CheckAviao[MAX_PLAYERS];
new CheckMoto[MAX_PLAYERS];
new AvisosSair[MAX_PLAYERS];
new Nopm[MAX_PLAYERS];
new Iterator:CarroDeAluguel<MAX_ALUGUEIS>;
new Iterator:ContratosIT<MAX_CONTRATOS>;
new Iterator: Vehicles<MAX_VEHICLES>;
new Iterator: GaragensIterator<MAX_GARAGENS>;
new Iterator: Frequencia<MAX_FREQUENCIAS>;
new Iterator: Gangzoness<MAX_GZS>;
new Iterator: MenusCriados<MAX_COMPRAS_PICK>;
new Iterator: B_House<MAX_CASAS>;
new Iterator: B_Interiores<MAX_INTERIORES>;
new Iterator: B_Portao<MAX_PORTAO>;
new Iterator: B_Cofres<MAX_COFRES>;
new Iterator: MaconhasIterator<MAX_MACONHAS>;
new Iterator: Empresas<MAX_EMPRESAS>;
stock TogglePlayerControllableEx(playerid, bool:toggle){
	TogglePlayerControllable(playerid, toggle);
}
Congelar(playerid, const tempovv){
	Controle[playerid] = true;
	TogglePlayerControllableEx(playerid, false);
	SetTimerEx("descongelar", segundos(tempovv), false, "i", playerid);
	return 1;
}
forward descongelar(playerid);
public descongelar(playerid){
	Controle[playerid] = false;
	TogglePlayerControllableEx(playerid, true);
	return 1;
}
function FreeFireDano(playerid, option, &Float: X, &Float: Y, &Float:Z){
	static Float: Pos[3];
	switch(option){
		case SET_POSITION:{
			Pos[0]  = X;
			Pos[1]  = Y;
			Pos[2]  = Z;
		}
		case GET_POSITION:{
			X = Pos[0];
			Y = Pos[1];
			Z = Pos[2];

		}
	}
}
static s_playerWarnings[MAX_PLAYERS];
new CarroDaLoja[3];
enum aluguellojaC{
	aluguelModel, Float:aluguelposX, Float:aluguelposY, Float:aluguelposZ, Float:aluguelposA,
	aluguelColor,aluguelColor2, aluguelSpawn
}
static const VeiculoLojaAluguel[][aluguellojaC] = {
	{404, 1003.6152, -1362.7153, 12.9535, 270.0000, -1, -1, 100},
	{549, 1003.4099, -1368.6310, 13.0095, 270.0000, -1, -1, 100},
	{499, 1005.3817, -1352.1448, 13.7173, 270.0000, -1, -1, 100}

};
enum VeiculoAluguelE{
	OVeiculo,
	VeiculoModelo,
	TempoDeAluguel,
	VeiculoDono[24],
	Float:VeiculoPos[4]
}
new InfoCAluguel[MAX_ALUGUEIS][VeiculoAluguelE];

enum AluguelEnum{
	VeiculoNome[32],
	VeiculoModelo,
	VeiculoValor
}
static const AluguelCarro[][AluguelEnum] = {
	{"Perennial", 404, 900},
	{"Furgao", 499, 1100},
	{"Tampa", 549, 500}
};
// ----------------------------- <Skin Register System > ---------------------------
static const skinpage[] = {
	40,
	26,
	15,
	12

};
new ActorPlayer[MAX_PLAYERS];
enum{
	SEM_OP,
	RETORNAR_AJUDA,
	RESETAR_TRIGGER
}

//------------------------------------------------------------------------------------
enum defingz_dom{
	gz_id, value_gz
}
static const AttachmentBones[][24] = {
	{"NullPart"},
	{"Coluna"},                     //0
	{"Cabeca"},                     //1
	{"Braco esquerdo"},             //2
	{"Braco direito"},              //3
	{"Mao esquerda"},               //4
	{"Mao direita"},                //5
	{"Coxa esquerda"},              //6
	{"Coxa direita"},               //7
	{"Pe esquerdo"},                //8
	{"Pe direito"},                 //9
	{"Panturrilha direita"},        //10
	{"Panturrilha esquerda"},       //11
	{"Antebraco esquerdo"},         //12
	{"Antebraco direito"},          //13
	{"Clavicula esquerda"},         //14
	{"Clavicula direita"},          //15
	{"Pescoco"},                    //16
	{"Mandibula"}                   //17
};
new Float:CoordPTDep[][] = {
	{2380.32324, -2177.37427, 25.00537, 0.0,0.0, 45.0},
	{2532.9854, -2330.0854, 24.3862, 0.0, 0.0, 45.0}

};
enum ContratosEnum{
	bool:ContratoExistente,
	Alvo,
	ValorAlvo,
	Faccao,
	Contratante[24]
}
new Contrato[MAX_CONTRATOS][ContratosEnum];
enum PortoesDep{
	OPTDep,
	bool:PortaoExplodido,
	TempoVoltar,
	bool:Explodindo,
	Text3D:TextoPT
}
new PTDEPInfo[2][PortoesDep];
enum attached_object_data
{
    Float:ao_x,
    Float:ao_y,
    Float:ao_z,
    Float:ao_rx,
    Float:ao_ry,
    Float:ao_rz,
    Float:ao_sx,
    Float:ao_sy,
    Float:ao_sz,
    partebone,
    modelindex,
    indexslot
}
/*new SV_GSTREAM: GRadio[MAX_FREQUENCIAS] = SV_NULL;*/
new ao[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS][attached_object_data];

enum EmpresaEnum{
	Empresaid,
	bool: EmpresaCriada,
	bool:EmpresaComprada,
	EmpresaNome[32],
	EmpresaDono[24],
	EmpresaLucro,
	Ganhos,
	EmpresaValor,
	Text3D:EmpresaTexto,
	Float: EmpresaPos[3],
	EmpresaPickup
}
new InfoEmpresa[MAX_EMPRESAS][EmpresaEnum];
enum Pdosto{
	CombustivelDisponivel
}
new PostoI[MAX_POSTOS][Pdosto];
enum enumAc{
	AcessorioNome[32],
	AcessorioId,
	AcessorioPreco,
	bool: VipAcessorio
}
enum houseint{
	Float:hx, Float:hy, Float:hz, interiorCH
}
static const interiorhouses[][houseint] = {
    {318.564971,1118.209960,1083.882812, 5},
	{2807.619873,-1171.899902,1025.570312, 8},
	{2324.419921,-1145.568359,1050.710083, 12},
	{886.9446,1918.2090,-88.9744, 1},
	{244.411987, 305.032989, 999.148437, 1},					
	{271.884979, 306.631988, 999.148437, 2},					
 	{444.646911, 508.239044, 1001.419494, 12},
	{2324.419921,-1145.568359,1050.710083, 12},
	{235.508994,	1189.169897,	1080.339966, 3},
	{1267.663208, -781.323242,1091.906250, 5},
	{2333.0330,	-1073.9600,	1049.0230, 6},
	{2196.6169,-1203.4315,1049.0234, 6},
	{2753.0359,431.0807,1578.6868, 1},
	{1972.3658,-1552.8248,2451.3450, 1},//1972.3658,-1552.8248,2451.3450
	{238.1810,240.9031,999.2313, 1},
	{1558.5370,-1340.6003,168.8308, 1},
	{-2169.9109,-2135.4746,1501.1005, 0},
	{2748.0151,-2467.8440,1030.5946, 0},
	{3626.6084,-556.1490,1847.2784}
};
enum tInterior{
	InteriorName[32],
	Float:IX,Float:IY, Float:IZ, icon, INTID
}
static const interiorinfos[][tInterior] = {

	{"Mercadinho",-2997.4451,2650.8403,1239.8154, 17, 10},//0
	{"Pref", 1504.8495,728.7220,-48.8910, 40, 10},//1
	{"DP PM", 1560.9388,-1674.9203,16.1899, 30, 0},//2
	{"Ammun", 316.2629,-170.2928,999.5938, 18, 6},//3
	{"Binco",452.2705,501.4550,1001.4495, 45, 14},//4
	{"Agencia", 390.7690,173.7712,1008.3828	, 34, 3},//5
	{"Banco",-1887.9283,3514.9075,1071.6793, 52, 0},//6
	{"HqOrg",1207.5077,2634.3201,1244.6591,19, 0},//7
	{"Puteiro", -2640.762939,1406.682006,906.460937,	49, 3},//8
	{"Hospital", -925.8238,396.3874,1400.1888,	22, 0},//9
	{"Pizzaria", 369.579528,-4.487294,1001.858886,	29, 9},//10
	{"AutoEscola", -2039.4138,-133.9461,-50.9141,	51, 1},//11
	{"Bar", 501.980987,-69.150199,998.757812,	49, 11},//12
	{"Boate", 493.390991,-22.722799,1000.679687,	48, 17},//13
	{"Prisao", 1811.6775,-1515.2771,5700.4287, 6, 0},
	{"Binco 2", 1538.6042,1555.7346,10.9250, 45, 0},
	{"HqOrg 2", 1523.2192,1506.8329,10.8861, 19, 0},
	{"Ammun 2", 2860.8206,800.3947,801.7853, 18, 0},
	{"Autoescola2", -2036.0485,-88.0708,940.0704, 51, 0},
	{"Entrada CF",-987.2761,1480.3595,1336.7917, 52, 0},
	{"24/7 2",  1414.0142,429.0459,1081.5009, 17, 0},
	{"Hosp 2", 1172.0118,-1310.5596,1019.4160, 22, 0},
	{"Merc. Negro", 1078.9817,937.3892,1604.8663, 0, 0},
	{"Conce", -2253.9934,3399.6572,734.3741, 55, 1},
	{"Corp 1", 1165.7377,360.3731,1002.1450,30,0},
	{"HqOrg 3",942.4731,-4279.0015,2792.7161,10, 3},
	{"Corp 3", -5104.8066,-659.5227,1352.1370, 30, 2},
	{"Corp 4", 1559.5521,-3992.4023,645.2406, 30, 3},
	{"Corp 5",251.0680,-23.9117,1501.0168, 30, 4}

};
new Acessorios[][enumAc] ={
	{"Laser Verde", 19083, 700, true},
	{"Laser Azul", 19080, 700, true},
	{"Laser Vermelho", 18643, 700, true},
	{"Colete Swat", 19142, 999, true},
	{"Cigarro", 19625, 420, true},
	{"Bone branco", 18933, 150, false},
	{"Bone Verde",18929, 150, false},
	{"Bone de polícia",18636, 150, false},
	{"Bone de tenis", 18961, 150, false},
	{"Toca preta", 18953, 120, false},
	{"Toca cinza",18954, 120, false},
	{"Toca de natal",19066, 180, false},
	{"Chapeu listrado",18968, 200, false},
	{"Chapeu de cowboy",19098, 200, false},
	{"Chapeu amarelo",18951, 200, false},
	{"Toca ripester",19554, 120, false},
	{"Bandana preta",18896, 500, false},
	{"Bandana de caveira",18895, 500, false},
	{"Bandana verde",18898, 500, false},
	{"Mascara preta",18912, 500, false},
	{"Mascara branca",18919, 500, false},
	{"Mascara de caveira",18911, 350, false},
	{"Mascara de Serial killer",19036, 350, false},
	{"Mascara de gas",19472, 400, false},
	{"Oculos vermelho",19026, 210, false},
	{"Oculos rosa",19025, 280, false},
	{"Oculos azul",19023, 280, false},
	{"Oculos preto",19138, 280, false},
	{"Mochila", 19559, 100, false},
	{"Fone de ouvido", 19424, 300, false}
};
enum PostoEnum{
	Float: PostoX,
	Float: PostoY,
	Float: PostoZ,
	Text3D: PostoLabel
}
static PostoInfo[][PostoEnum] = {
	{0.0,0.0,0.0},
	{2116.87939, 920.16211, 10.83586},
	{1941.17419, -1772.54614, 13.66231},
	{-91.03750, -1168.26270, 2.44150},
	{-1675.25171, 413.90958, 7.19898},
	{12202.04712, 2475.85083, 10.89196},
	{606.21674, 1701.93347, 7.17993},
	{613.06854, 1691.79468, 7.17993},
	{619.93286, 1681.89539, 7.17993},
	{1382.70422, 459.53149, 20.37184},
	{655.39093, -565.10785, 16.36047},
	{-2410.56519, 975.97998, 45.48096},
	{-1605.87036, -2714.31274, 48.56379},
	{-2243.91650, -2560.62915, 31.94855},
	{596.3885,-1496.3568,15.3040}
};
enum{
	OPCAO_INICIAR = 1,
	OPCAO_CONCLUIR = 2
}
enum{
	OPAL_DEFINIR,
	OPAL_TRANCAR,
	OPAL_LOCALIZAR,
	OPAL_ESTACIONAR
}
enum{
	TUTORIAL_PARTE_UM,
	TUTORIAL_PARTE_DOIS,
	TUTORIAL_PARTE_TRES,
	TUTORIAL_PARTE_QUATRO
}
enum{
	USANDO_CAPA,
	REMOVER_CAPA
}
enum{
	VEICULO_LIGADO = 1,
	LIGAR_VEICULO = 2,
	DESLIGAR_VEICULO = 3,
	FAROL_LIGADO = 4,
	LIGAR_FAROL = 5,
	DESLIGAR_FAROL = 6,
	VEICULO_TRANCADO = 7,
	LIGAR_ALARME = 8,
	TRANCAR_VEICULO = 9,
	DESTRANCAR_VEICULO = 10,
	DESLIGAR_ALARME = 11
}
enum vipinfoE{
	NomeVip[18],
	Valor
};
enum cfgJBL{
	TipoMusica,
	Float:PosJBL[3],
	jblDono[24],
	bool: JBLCriada,
	JBLVw,
	ObjetoJbl
}
new InfoJBL[MAX_JBL][cfgJBL];
enum CameraAdmin{
	Float:CamPos[6],
	bool:CameraCriada,
	ACamera
}

new CameraInfo[MAX_CAMERAS][CameraAdmin];
enum enumPartes{
	RODA_FRENTE_D = 1,
	RODA_FRENTE_E = 2,
	RODA_ATRAS_D = 3,
	RODA_ATRAS_E = 4,
	CAPO = 5,
	PORTA_MALA = 6
}
enum Cofreconfiguration{
	CofreName[32],
	CofreMoney,
	bool: CofreQuebrado,
	OCofre,
	Text3D: CofreTexto,
	InteriorCofre,
	VWCofre,
	bool: SendoRoubado,
	Float:CofrePos[3]
}
new CofreInfo[MAX_COFRES][Cofreconfiguration];
static const Infosvip[][vipinfoE] = {
	{"{ffffff}Sem Vip", 10},
	{"{7f7679}Platina", 12},
	{"{a6e0ed}Diamante", 15},
	{"{e0115f}Ruby", 25}
};
static const Float: randomcoordspawn[][] = {
	{1062.6720,-1737.2592,13.1849,89.2866}, // px veh 1
	{1062.6371,-1740.1489,13.1934,89.1573}, // px veh 2
	{1062.5919,-1743.0186,13.1948,89.0286}, // px veh 3
	{1062.5391,-1745.9581,13.1927,88.8968}, // px veh 4
	{1062.4779,-1748.9675,13.1927,88.7614}, // px veh 5
	{1062.4094,-1752.0468,13.1919,88.6435}, // px veh 6
	{1062.3403,-1754.8458,13.1934,88.5188}, // px veh 7
	{1062.2614,-1757.7848,13.1941,88.3883}, // px veh 8
	{1062.1694,-1760.9335,13.1934,88.2791}, // px veh 9
	{1062.0786,-1763.8721,13.1919,88.1485}, // px veh 10
	{1061.9875,-1766.6177,13.0892,87.9973}, // px veh 11
	{1062.7189,-1769.5878,13.0892,87.7907}, // px veh 12
	{1062.6053,-1772.4556,13.0913,87.6639}, // px veh 13
	{1077.5800,-1772.5900,13.0597,89.8882}, // px veh 14
	{1077.5709,-1775.3899,13.0640,89.7276}, // px veh 15
	{1077.5822,-1769.9299,13.0624,90.0696}, // px veh 16
	{1077.5736,-1766.7800,13.0624,90.2666}, // px veh 17
	{1077.5568,-1763.9800,13.0609,90.4434}, // px veh 18
	{1077.5287,-1760.9702,13.0640,90.6422}, // px veh 19
	{1077.4928,-1758.1003,13.0640,90.8091}, // px veh 20
	{1077.4473,-1755.1133,13.1076,90.9398} // px veh 21
};
enum EnumCarBuy{
	carName[30],
	carroModel,
	carroPrice
}
static const carrosCompra[][EnumCarBuy] = {
	// veiculos Poop
	{"NaC", -1, 9999999999}, //0
	{"Manana,_Comum", 410, 23000},//1
	{"Bravura,_Comum", 401, 28000},//2
	{"Perennial,_Comum", 404, 29000},//3
	{"Sentinel,_Comum",405, 30000},//4
	{"Mesa,_Comum", 500, 33000},//5
	{"VooDoo,_Comum", 412, 38000},//6
	{"Stratum,_Comum", 561, 39000},//7
	{"Landstalker,_Comum", 400, 40000},//8
	{"Hustler,_Comum", 545, 42000},//9
	{"Merit,_Comum", 551, 44000},//10
	{"VooDoo,_Comum", 412, 85000},//11
	{"Admiral,_Comum", 445, 46000},//12

	//Motos
	{"Faggio,_Moto", 462, 10000}, //13
	{"Freeway,_Moto", 463, 28000}, //14
	{"Quad,_Moto", 471, 29000},//15
	{"Wayfarer,_Moto", 586, 31000},//16
	{"Sanchez,_Moto", 468, 32000},//17
	{"BF-400,_Moto", 581, 40000},//18
	{"PCJ-600,_Moto", 461, 47000},//19
	{"FCR-900,_Moto", 521, 69000},//20

	//Veiculos Esportivos
	{"Sultan,_Sport", 560, 70000},//21
	{"Jester,_Sport", 559, 110000},//22
	{"Buffalo,_Sport", 402, 230000},//23
	{"Cheetah,_Sport", 415, 255000},//24
	{"Banshee,_Sport", 429, 119000},//25
	{"Bullet,_Sport", 541, 324000},//26
	{"Turismo,_Sport", 451, 354000},//27
	{"Super_GT,_Sport", 506, 1340000},//28

	// veiculos vips
	{"NRG-500,_Vip", 522, 220000},//29
	{"Infernus,_Vip", 411, 400000}//30 
};	
static const MensagensAleatorias[][] = {
	"Dica -> Use /menucar para ver seus veiculos.",
	"Dica -> Use /admins para ver os admins onlines.",
	"Dica -> Nao conseguiu ajuda? use /atendimento e fale com um Admin!",
	"Dica -> Organizacoes e Corporacoes podem recrutar pelo jogo seguindo sempre o IC.",
	"Dica -> Encontrou um Erro ou Bug? reporte no nosso discord para ser resolvido.",
	"Dica -> Voce pode acompanhar as atualizacoes do servidor pelo nosso Discord!",
	"Dica -> Use /CELULAR para se comunicar no Whatssap, ou use /wpp.",
	"Dica -> Nao ande contra-mao, pode atrapalhar o roleplay de outro jogador.",
	"Dica -> Ofensas ao servidor nao e uma forma de se expressar. Nos ajude com sugestoes!",
	"Dica -> Voce pode usar /GPS para encontrar locais importantes.",
	"Dica -> Use /carteira para ver seus documentos, nivel de procurado e dinheiro.",
	"Dica -> Ao morrer, seu dinheiro e resetado! sempre deposite-o no banco.",
	"Dica -> Para spawnar o veiculo do seu emprego, primeiro entre em servico!"
};

enum Ammunationinfo{
	ArmaNome[35],
	IDArma,
	Valor,
	QuantiaDar,
	Model,
	bool: ArmaVip
};
static const ArmaAmmunation[][Ammunationinfo] = {
	{"Null", 			 WEAPON:0,  1231231233, 1, -1, false},
	{"Faca", 			 WEAPON:4,  800, 1, 335, false},
	{"Motosserra",  	 WEAPON:9,  1250, 1, 341, true},
	{"Taco De Baseball", WEAPON:5,  1250, 1, 336, false},
	{"Katana", 			 WEAPON:8,  3400, 1, 339, true},
	{"9mm",  			 WEAPON:22, 7900, 66, 347, false},
	{"Desert Eagle",	 WEAPON:24, 8100, 50, 348, false},
	{"MP5",   			 WEAPON:WEAPON_MP5, 8300, 50, 353, true},
	{"Escopeta", 		 WEAPON:25, 8800, 30, 349, true},
	{"M4-A1", 			 WEAPON:31, 9500, 70, 356, true},
	{"AK-47",			 WEAPON:30, 9700, 50, 355, true}
};
new Tentativas[MAX_PLAYERS];
new ChamarOSpawn[MAX_PLAYERS];
new MunBomb[MAX_VEHICLES];
//#define GetDynamicObjectModel(%0) Streamer_GetIntData(STREAMER_TYPE_OBJECT, %0, E_STREAMER_MODEL_ID)
new orgAtacando[MAX_GZS];
enum dd{
	Float:aX,
	Float:aY,
	Float:aZ
};
new AreaRoubar[dd];
enum Carteiras{
	Carro,
	Moto,
	Aviao
};
enum orgsEtc{
	OrgNome[40],
	Sigla[7],
	Cor,
	HexColor[9]
}
//1,2,3,9,10,11,12,14,16,17
new const OrgGm[][orgsEtc] = {
	{"Civil", "Civil", 0xFFFFFF55, "FFFFFF"}, // 0 
	{"Policia Militar", "Pm",0x0086ff55, "0086ff"},//1
	{"Policia Civil", "Pc",	0x00388b55, "00388b"},//2
	{"Bope", "Bope", 0x3400ff55, "3400ff"},//3
	{"Comando Vermelho","CV", 0xFF000055, "FF0000"},//4
	{"Terceiro Comando Puro", "TCP", 0x43a31355, "43a313"},//5
	{"Milicia", "MLC", 0x9a10d855, "9a10d8"},//6
	{"Primeiro Comando Da Capital", "PCC", 0x6aff0055, "6aff00"},//7
	{"Familia Do Norte", "FDN",	0xb000ff55, "b000ff"},//8
	{"ROTAM", "ROTAM", 0x1116e155, "1116e1"},//9
	{"Policia Rodoviaria Federal", "PRF", 0xF4FF0055, "F4FF00"},//10
	{"Policia Federal", "PF", 0xff720055, "ff7200"},//11
	{"Exercito Brasileiro", "EB", 0x1A793955, "1A7939"},//12
	{"Okaida", "OKD", 0x33ccff55, "33ccff"},//13
	{"ROTA", "ROTA", 0x1116e1ff, "1116e1"},//14
	{"Amigos Dos Amigos", "ADA", 0xffc00055, "ffc000"},//15
	{"Forca Tatica", "FT", 0x1116e155, "1116e1"},//16
	{"Tropa De Choque", "Choque", 0x33ccff55, "33ccff"},//17
	{"Hamas", "HMS", 0x80808055, "808080"}// 18 ( NOVA )
};
enum{
	CIVIL,
	POLICIA_MILITAR,
	POLICIA_CIVIL,
	BOPE,
	COMANDO_VERMELHO,
	TERCEIRO_COMANDO_PURO,
	MILICIA,
	PRIMEIRO_COMANDO,
	FAMILIA_DO_NORTE,
	POLICIA_RODOVIARIA,
	POLICIA_FEDERAL,
	EXERCITO_BRASILEIRO,
	OKAIDA,
	ROTA,
	ADA,
	FORCA_TATICA,
	CHOQUE
}
enum EncomendasServer
{
	MaconhaEnc,
	EquipamentosEnc,
	VeiculosModel,
	TempoEnc[3],
	Encid
}
new encMafia[MAX_ORGS][3][EncomendasServer];
new EncomendasMafia[MAX_ORGS][EncomendasServer];
new CarteiraInfo[MAX_PLAYERS][Carteiras];
enum DroparCoisas{
	Float:DropX,
	Float:DropY,
	Float:DropZ,
	QuantiaItem,
	TipoItem,
	bool:Dropado,
	Text3D:TextoDrop,
	OBDrop
};
new InfoDrop[MAX_DROPS][DroparCoisas];

enum Infors{
	Float:CasaX,
	Float:CasaY,
	Float:CasaZ,
	Float:SaidaX,
	Float:SaidaY,
	Float:SaidaZ,
	Interior,
	Dono[24],
	Quantia[60],
	Item[60],
	Aluguel,
	PrecoCasa,
	Text3D:CasaLabel,
    CasaComprada,
	bool:CasaCriada,
	Trancada,
	casaid,
	PickCasa,
	CasaVip,
	MapCasa
};

new InfoCasa[MAX_CASAS][Infors];
enum hGfV{
	AluguelNome[24]
}
new InfoAluguel[MAX_CASAS][4][hGfV];
enum VehicleOperatorSystem{
	Trancou[24], Item[60], Quantia[60], bool: Quebrado, bool: Desmanchado
}
new VeiculoConfiguracao[MAX_VEHICLES][VehicleOperatorSystem];
enum OrganizacaoConfig{
	OrgId,
	OrgCofre,
	OrgInterior,
	Float:OrgSpawn[4],
	OrgVw,
	Float:OrgPickPos[3],
	bool:PickDisponivel,
	bool:OrgCriada,
	Text3D: TextoPick,
	Pick,
	Vagas,
	OrgLider[24],
	Spawnados,
	VehCor,
	Equipamentos,
	MaconhaOrg,
	SalarioCargo[11]
}
new OrgInfo[MAX_ORGS][OrganizacaoConfig];

enum OraganizacaoVeiculos{
	VeiculoModelo,
	Float:VeiculoSpawn[4]

}
new OrgVeiculo[MAX_ORGS][MAX_CARROS][OraganizacaoVeiculos];
new Iterator:B_Caixas<MAX_CAIXAS>;
new bool: RC[MAX_VEHICLES];
new bool: Editing[MAX_PLAYERS];
enum MenusInfo{
	Float:MenuX,
	Float:MenuY,
	Float:MenuZ,
	TipoCompra,
	Text3D:CompraLabel,
	bool:MenuCriado,
	PickMenu,
	MVW
};
new MenuInfo[MAX_COMPRAS_PICK][MenusInfo];
enum ptfd
{
	Float:ObX,
	Float:ObY,
	Float:ObZ,
	Float:RotX,
	Float:RotY,
	Float:RotZ,
	bool:ObjetoCriado,
	Objeto,
    ObjetoModel,
	PIDF,
	Text3D: Texto
};
cache_return_int(row, const col[]){
	new val;
	cache_get_value_name_int(row, col, val);
	return val;
}
Float:cache_return_float(row, const col[]){
	new Float:val;
	cache_get_value_name_float(row, col, val);
	return val;
}
enum VehicleInfo{
	Float:Vx,
	Float:Vy,
	Float:Vz,
	Float:Rotacao,
	Cor1,
	Cor2,
	IDCarro,
	Carro,
	vehid,
	Placa[8],
	IPVA,
	VehVw,
	Text3D: PlacaText,
	bool: Apreendido,

};
new VehInfo[MAX_PLAYERS][MAXCONCE][VehicleInfo];
new bool: VeiculoTrancado[MAX_VEHICLES];
new ObjetoInfo[MAX_OBJT][ptfd];
new CarroOrg[MAX_ORGS][MAX_CARRO_SPAWN];
new OrgCarro[MAX_VEHICLES];
new SpawnouEmprego[MAX_PLAYERS];
new EmpregoCar[MAX_VEHICLES];
new RoubadoCarroForte;
enum Negocios{
	ItemName[32],
	Valor,
	Dias
}
new rdr[][24] = {
	"Cueca","Camisa","Calcinha",
	"Meia","Roupao","Calcao", "Zorba"
};
static const negociarmafia[][Negocios] = {
	{"Maconha", 4, 1},
	{"Armamento Militar", 90, -1},
	{"Veiculo Para Organizacao", 60000, 1},
	{"Limpar Grana", 50, 0},
	{"Checar Entregas", 0, 0}
};
enum Empregos{
	NomeEmp[32],
	Requisitos[32]
}
new VacaMarcada[MAX_PLAYERS];
new bool: TirandoLEITE[MAX_PLAYERS];
static const Float: vacasinfo[][] = {
	{-322.24661, -1429.26501, 14.03327},
	{-317.73782, -1413.79993, 13.12425},
	{-328.59671, -1428.91003, 14.15100},
	{-311.75970, -1426.17627, 13.62630},
 	{-313.02560, -1419.17236, 13.34130},
	{-316.78989, -1427.47461, 13.80540},   
	{-328.26031, -1416.20190, 13.38160},   
	{-328.34671, -1389.31616, 11.46000},   
	{-323.44421, -1398.59680, 12.25290},   
	{-326.96109, -1407.62744, 12.88520},   
	{-318.27390, -1403.17957, 12.64450},   
	{-303.48840, -1407.43152, 12.82910},   
	{-300.50281, -1427.79285, 13.14170},   
	{-315.29800, -1392.41260, 11.71520},   
	{-301.94031, -1416.38208, 13.00130}
};
enum autEnum{
	AutNome[32],
	AutNivel
}
static const AtuInfo[][autEnum] = {
	{"Desacato", 2},
	{"Vandalismo", 2},
	{"Roubo", 3},
	{"Tentativa De Fuga", 3},
	{"Trafico", 3},
	{"Tentativa De Suborno", 3},
	{"Tentativa De Homicidio", 3},
	{"Nao Pagar Multa", 2},
	{"Conduzir V. Sem Cnh", 2},
	{"Direcao Perigosa", 3},
	{"Agressao", 2},
	{"Homicidio", 5},
	{"PIA", 3},
	{"IDP", 5},
	{"Atentado", 6},
	{"Sequestro", 6}
};
enum mulEnum{
	MulNome[37],
	MulMoney
}
static const MultaInfo[][mulEnum] = {
	{"Dirigir Sem Cnh", 4500},
	{"Direcao Perigosa", 7000},
	{"Atropelamento Culposo", 3000},
	{"Atropelamento nao Culposo", 6000},
	{"Corrida Ilegal", 10000},
	{"Dirigir Na Contra mao", 3500},
	{"Desordem", 3000},
	{"Colisao De Transito", 5000},
	{"Conduzir V. Em Mal Estado", 2700},
	{"Subir Escadas", 2000},
	{"Cortar Caminho", 2000},
	{"Dirigir V. Sem Placa", 3000},
	{"Abandono Em Rodovia", 2500},
	{"Tentativa De Fuga", 3500},
	{"Transpt. De Drogas", 7000},
	{"Bloq. Via Com Veiculo", 8000},
	{"Dirigir No Acostamento", 2100}
};
enum tunagem{
	NomeTunagem[16],
	ModelTunagem,
	PriceTunagem
}
static const TunagemInfo[][tunagem] = {
	{"Roda Offroad", 1025, 320},//0
	{"Roda Shadow", 1073, 290},
	{"Roda Mega", 1074, 340},
	{"Roda Twist", 1078, 450},
	{"Roda Groove", 1081, 460},
	{"Roda Atomic", 1085, 390},//5

	{"Spoiler Pro", 1000, 1200},//6
	{"Spoiler Win", 1001, 1400},
	{"Spoiler Drag", 1002, 1300},
	{"Spoiler Alpha", 1003, 1500},//9

	{"Nitro", 1008, 2000}
};
enum EnumMaconha{
	Float:MaconhaPosicaoX,
	Float:MaconhaPosicaoY,
	Float:MaconhaPosicaoZ
}
new MaconhaRecolher[][EnumMaconha] = {
	{0.0, 0.0, 0.0},
	{2574.3528,2835.7258,10.8203},// ponto cortar M
	{2585.0833,2835.9939,10.8203}, // ponto cortar M
	{2594.6467,2835.0049,10.8203}, // ponto cortar M
	{2592.9580,2818.0120,10.8203}, // ponto cortar M
	{2581.1497,2817.7417,10.8203}, // ponto cortar M
	{2572.2483,2820.3198,10.8203} // ponto cortar M
};

#define MAX_VEADOS 42
#define MAX_BLOQUEIOS 100

static const Float: InfoDers[][] = {
{-1611.61328, -2476.66602, 93.29710,   0.00000, 0.00000, 90.00000},
{-1925.56201, -2404.00391, 29.49670,   0.00000, 0.00000, 0.00000},
{-1847.54858, -1872.12463, 87.18190,   0.00000, 0.00000, 0.00000},
{-1389.12683, -1947.34460, 17.63580,   0.00000, 0.00000, 0.00000},
{-1816.49963, -2219.31641, 74.93650,   0.00000, 0.00000, 0.00000},
{-1561.68921, -2076.25244, 42.14170,   0.00000, 0.00000, 0.00000},
{-1516.98157, -2336.11572, 0.67560,   0.00000, 21.00000, 76.00000},
{-1716.99377, -2482.38135, 18.18192,   0.00000, 0.00000, -106.08004},
{-1278.75500, -2858.14233, 61.16085,   0.00000, 0.00000, -91.00000},
{-999.59332, -2640.27051, 102.77785,   0.00000, 0.00000, 49.38001},
{-443.31381, -2310.28003, 77.31749,   0.00000, 0.00000, 105.00000},
{-288.19489, -2296.23584, 29.75867,   0.00000, 0.00000, -40.00000},
{-1080.20361, -2317.38428, 53.36700,   0.00000, 0.00000, -178.00000},
{-1727.48926, -1758.50659, 28.94500,   0.00000, 0.00000, 84.00000},
{-1313.53528, -2022.48254, 8.13237,   0.00000, 0.00000, 114.23997},
{-1441.90247, -2637.25977, 58.30460,   0.00000, 0.00000, 84.00000},
{-1574.47107, -2492.87207, 90.96360,   0.00000, 0.00000, 0.00000},
{-1592.45654, -1946.24280, 95.18287,   0.00000, 0.00000, 0.00000},
{-1270.98206, -2048.54590, 21.78580,   0.00000, 0.00000, 0.00000},
{-1258.38220, -2049.05835, 22.07160,   0.00000, 0.00000, 0.00000},
{-1337.69666, -2413.49390, 44.72762,   0.00000, 0.00000, 0.00000},
{-1315.51685, -2601.19165, 38.61036,   0.00000, 0.00000, 0.00000},
{-1384.75623, -2735.69702, 86.99895,   0.00000, 0.00000, -149.00000},
{-1245.63025, -2328.30884, 20.87715,   0.00000, 0.00000, 33.00000},
{-1274.26501, -2468.05981, 9.69549,   0.00000, 0.00000, 0.00000},
{-1224.51624, -2620.60522, 9.69352,   0.00000, 0.00000, 0.00000},
{-1254.98181, -2646.38745, 33.50575,   0.00000, 0.00000, 0.00000},
{-1476.41284, -2510.79126, 60.93969,   0.00000, 0.00000, 0.00000},
{-1510.54077, -2524.28198, 67.56954,   0.00000, 0.00000, 0.00000},
{-1640.28906, -2303.43652, 60.04160,   0.00000, 0.00000, 0.00000},
{-1986.40100, -1972.22803, 81.17060,   0.00000, 0.00000, 0.00000},
{-1408.68933, -2037.87793, 0.36673,   0.00000, 0.00000, 0.00000},
{-1346.26208, -2117.53442, 29.81694,   0.00000, 0.00000, 0.00000},
{-1403.22168, -2381.00732, 30.86746,   0.00000, 0.00000, 0.00000},
{-1582.28162, -2415.56250, 45.48959,   0.00000, 0.00000, 0.00000},
{-1672.97913, -2397.21436, 98.69875,   0.00000, 0.00000, 0.00000},
{-1869.94055, -2165.75342, 82.29986,   0.00000, 0.00000, 0.00000},
{-1497.63989, -2203.88599, 1.54592,   0.00000, 0.00000, 164.00000},
{-1420.12122, -1794.09888, 47.31942,   0.00000, 0.00000, 0.00000},
{-1369.98926, -1929.12549, 19.39882,   0.00000, 0.00000, 0.00000},
{-1692.53296, -1950.09668, 103.95287,   0.00000, 0.00000, 0.00000},
{-1845.26746, -2416.18311, 43.26555,   0.00000, 0.00000, 0.00000}};
enum Inff{
	Float:DeerX,
	Float:DeerY, 
	Float:DeerZ,
	bool:DeerCriado,
	bool:DeerMorto,
	ODeer
}

new DeerInfo[MAX_VEADOS][Inff];
new TimerViadinho[MAX_VEADOS];
function CriarVeado(){
	new value = random(sizeof InfoDers);
	new i = value;
	if(!DeerInfo[i][DeerCriado]){
		DeerInfo[i][DeerCriado] = true;
		DeerInfo[i][DeerX] = InfoDers[value][0];
		DeerInfo[i][DeerY] = InfoDers[value][1];
		DeerInfo[i][DeerZ] = InfoDers[value][2];
		DeerInfo[i][ODeer] = CreateDynamicObject(19315, DeerInfo[i][DeerX],DeerInfo[i][DeerY],DeerInfo[i][DeerZ], InfoDers[value][3], InfoDers[value][4], InfoDers[value][5], -1, -1, -1, 400.0);
		DeerInfo[i][DeerMorto] = false;
		TimerViadinho[i] = SetTimerEx("DestroirVeado", minutos(3), false, "i", i);
		////printf("%d %f %f %f", i, DeerInfo[i][DeerX],DeerInfo[i][DeerY],DeerInfo[i][DeerZ]);
		return i;
	}
	else
		chamarota();

	return 1;
}
function chamarota() return CriarVeado();
function DestroirVeado(veado){
	if(IsValidDynamicObject(DeerInfo[veado][ODeer])){
		DestroyDynamicObject(DeerInfo[veado][ODeer]);
		DeerInfo[veado][DeerMorto] = false;
		DeerInfo[veado][DeerCriado] = false;
		CriarVeado();
	}
}
enum ObjetoIndfo{
	Float: ObjetoPos[4],
	OBjeto,
	Text3D: TextoObjeto,
	DonoBloqueio[24]
}
new BloqueioInfo[MAX_BLOQUEIOS][ObjetoIndfo];
static const empinfo[][Empregos] = {
	{"{ffffff}Pescador", "{ffffff}Nenhum"},
	{"Cortador De Madeira", "{ffffff}Nenhum"},
	{"Transpt. De Madeira", "{ffffff}Niv. 4 e Hab. De Carro"},
	{"Transpt. De Armas", "{ffffff}Hab. De Carro E Niv. 8"},
	{"Carro Forte", "{ffffff}Hab. De Carro E Niv. 2"},
	{"Mecanico", "{ffffff}Niv. 6 E Hab. De Carro"},
	{"LEITEiro", "{ffffff}Niv. 2"},
	{"Taxista", "{ffffff}Hab. De Carro"},
	{"SAMU", "{ffffff}Hab. De Carro e Niv. 7"},
	{"Cacador", "{ffffff}Niv. 2"},
	{"Transpt. De Combustivel", "{ffffff}Niv. 9 e Hab. De Carro"},
	{"Sair Do Emprego", "-"}
};
enum{
	PESCADOR = 1,
	MADEIREIRO = 2,
	TRANSPORTADORM = 3,
	TRANSP_ARMA = 4,
	CARRO_FORTE = 5,
	MECANICO = 6,
	LEITEIRO = 7,
	TAXISTA = 8,
	SAMU = 9,
	CACADOR = 10,
	TRANSP_COMBUSTIVEL = 11
}
/* --------------------------- > Tunning Part < -------------------------*/
enum spoilertun{
	spoilerid, spoilername[24], spoilerprice
}
static const spoilercomponent[][spoilertun] = {
	{1018, "Pro", 1000},
	{1019, "Win", 1200},
	{1020, "Drag", 950},
	{1021, "Alpha", 900}
};
enum scapenum{
	scape, scapename[24], scapeprice
}
static const scapecomponent[][scapenum] = {
	{1018, "Upswet", 400},
	{1019, "Twin", 500},
	{1020, "Large", 350},
	{1021, "Medium", 370},
	{1022, "Small", 500},
	{1023, "Twist", 400}
};
enum tunningwheel{
	wheel, wheelname[24], wheelprice
}
static const wheelcomponent[][tunningwheel] = {
	{1073, "Shadow", 1200},
	{1074, "Mega", 1200},
	{1075, "Rimshine", 1200},
	{1076, "Wires", 1200},
	{1077, "Classic", 1200},
	{1078, "Twist", 1200},
	{1079, "Cutter", 1200},
	{1080, "Switch", 1200},
	{1081, "Groove", 1200},
	{1082, "Import", 1200},
	{1083, "Dollar", 1200},
	{1084, "Trance", 1200},
	{1085, "Atomic", 1200}
};
/* ----------------------------------------------------------------------*/
enum carroComprar{
	vehName[32],
	VehModel,
	Value
}
static const InfoCompra[][carroComprar] = {
	{"VooDoo", 412, 85000},
	{"Premier", 426, 95000},
	{"Admiral", 445, 46000},
	{"Glendale", 466, 95000},
	{"Nebula", 516, 85000},
	{"Rustler", 545, 75000},
	{"Oceanic", 467, 68000},
	{"Manana", 410, 40000},
	{"Perennial", 404, 44000},
	{"Elegant", 507, 65000},
	{"Sultan", 560, 180000},
	{"BF-400", 581, 80000},
	{"Sanchez", 468, 50000},
	{"Huntley", 579, 90000}
};
enum info{
	idgun,
	modelgun,
	NameGun[29]
}
enum MaconhaPlantacao{
	macid,
	Float: MacPos[3],
	MacQuant,
	DonoMac[24],
	AMaconha,
	Text3D: TextoMaconha
}
new MacPlant[MAX_MACONHAS][MaconhaPlantacao];
enum{
	SPAWN_CIVIL = 1,
	SPAWN_ORG = 2,
	SPAWN_CASA = 3,
	SPAWN_EMPREGO = 4,
	SPAWN_ULTIMAPOS = 5
}
new EstiloSpawn[MAX_PLAYERS];
new CasaSpawn[MAX_PLAYERS];
enum ItemMec{
	KitReparo,
	Sprays,
	KitRodas,
	Gasolinas
}
new MecMenu[MAX_PLAYERS][ItemMec];
enum compraMecs{
	nomeitem[25],
	valoritemmec,
	itemmec
}
static const MecanicoCompras[][compraMecs] = {
	{"Nada", -9999, 0},
	{"Kit De Reparo(x1)", 350, 1},
	{"Lata De Tinta(x2)", 600, 2},
	{"Galao De Gasolina(x1)", 500, 1}
};
enum vehData{
	veiculoModelo,
	CorVeiculo[2],
	RespawnDelay,
	Float: OldPos[3],
	Float:OldPosTaxi[3],
	Float: MileageTaxi,
	Float:Mileage,
	Float:GasolinaContar,
	sirene,
	Gasolina,
 	ParteRoda[5],
}
new VeiculoInfo[MAX_VEHICLES][vehData];
enum EnumAtendimento{
	Atendidos,
	Float:Nota,
	bool: EmAtendimento,
	bool: OAtendido,
	bool: PediuSenha,
	momentosenha,
	AtenId
}
new Atendimento[MAX_PLAYERS][EnumAtendimento];
static const Float:RdonPickups2[][] =
{
    {1.2},{3.2},{2.3},{3.5},
    {1.5},{3.6},{2.6},{3.8},
    {2.8},{3.9},{2.9},{3.4},    
    //
    {-1.1},{-1.2},{-1.3},{-1.4},
    {-1.5},{-1.6},{-1.9},{-1.8},
    {-1.9},{-1.0},{-1.2},{-1.3}
};
static const Float:RdonPickups[][] =
{
    {0.1},{0.2},{0.3},{0.4},
    {0.5},{0.6},{0.9},{0.8},
    {0.9},{1.0},{1.2},{1.3},
    //
    {-0.1},{-0.2},{-0.3},{-0.4},
    {-0.5},{-0.6},{-0.9},{-0.8},
    {-0.9},{-1.0},{-1.2},{-1.3}
};
new Madeiras[MAX_PLAYERS];
static const Float:MadeirasPosicao[][] = {
	{-429.1388,-1789.1112,3.3600}, // 1
	{-420.3839,-1797.9849,4.1037}, // 2
	{-408.7457,-1793.9048,3.0232}, // 3
	{-399.7895,-1784.2236,3.0438}, // 4
	{-388.0276,-1775.7512,4.3450}, // 5
	{-385.4427,-1786.5370,2.9234}, // 6
	{-379.1290,-1789.8658,3.9734} // 7
};
static const Float:RandCoord[][] = {
	{2148.7476, -1138.4069, 25.2346, -90.0002},
	{2148.2847, -1143.2482, 25.2346, -90.0002},
	{2148.5334, -1148.0458, 25.2346, -90.0002},
	{2148.5642, -1152.8688, 25.2346, -90.0002},
	{2148.2966, -1156.9995, 25.2346, -90.0002},
	{2148.4141, -1161.5067, 25.2346, -90.0002},
	{2148.3994, -1166.1300, 25.2346, -90.0002},
	{2148.4929, -1170.6896, 25.2346, -90.0002},
	{2148.3921, -1175.4922, 25.0946, -90.0002},
	{2148.2163, -1180.0970, 25.0946, -90.0002},
	{2148.4199, -1184.9531, 25.0946, -90.0002},
	{2148.2747, -1189.3163, 25.0946, -90.0002},
	{2148.5535, -1194.3031, 25.0946, -90.0002}
};
enum PlayerData{
	Nick[24],
	Senha[32],
	UltimoLogin[32],
	Admin,
	IDFixo,
	DinheiroPD,
	Float:Px,
	Float:Py,
	Float:Pz,
	InteriorPlayer,
	Nivel,
	Xp,
	Dinheiro,
	Cash,
	Vip,
	TempoVip,
	Org,
	Ip[16],
	Cidade,
	Skin,
	Emprego,
	CadeiaStaff,
	Prisao,
	Banco,
	Cargo,
	bool:Logado,
	Mochila,
	estrelas,
	VirtualWorld,
	VezesPreso,
	bool: Ferido,
	Float:DeathPos[3],
	DeathInterior,
	DeathVirtualWorld,
	Titulo[32],
	TituloPersonalizado[90],
	Genero,
	TipoPrisao,
	bool: VoipMutado,
	bool: Porte,
	MomentoFerido,
	MotivoCadeia[32],
	Fome,
	Sede,
	HorasJogadas,
	HorasJogando,
	Grana
};
new PlayerInfo[MAX_PLAYERS][PlayerData];
#define PRESIDIO 0
#define PRISAO_EB1 1
#define PREISAO_EB2 2
#define PRISAO_EB3 3
enum tipoPrison{
	Float:PrisaoX,
	Float:PrisaoY,
	Float:PrisaoZ
};

static const infoPrisoes[][tipoPrison] = {
	{1799.3418,-1562.1702,5700.4287}, // prisao 1
	{1820.0496,-1558.7894,5700.4287}, // prisao 3
	{1820.1061,-1563.2439,5700.4287}, // prisao 4
	{1819.9933,-1566.8292,5700.4287}, // prisao 5
	{1820.0505,-1572.9072,5700.4287}, // prisao 6
	{1819.7330,-1577.5248,5700.4287}, // prisao 7
	{1819.9797,-1582.1451,5700.4287}, // prisao 8
	{1800.0042,-1581.0411,5700.4287}, // prisao 9
	{1800.0479,-1576.4913,5700.4287}, // prisao 10
	{1800.0935,-1571.7316,5700.4287}, // prisao 11
	{1800.1412,-1566.7618,5700.4287}, // prisao 12
	{1800.1855,-1562.1421,5700.4287}, // prisao 13
	{1800.2299,-1557.5222,5700.5986}, // prisao 14
	{1800.2810,-1552.2025,5700.5962}, // prisao 15
	{1821.2281,-1553.7053,5703.9131}, // prisao 16
	{1821.4723,-1558.5991,5703.9136}, // prisao 17
	{1821.7129,-1563.4232,5703.9136}, // prisao 18
	{1821.9465,-1568.1073,5703.9136}, // prisao 19
	{1822.1732,-1572.6517,5703.9136}, // prisao 20
	{1821.6483,-1577.5840,5703.9136}, // prisao 21
	{1821.7456,-1582.3451,5703.9189}, // prisao 22
	{1799.1787,-1580.8267,5703.9097}, // prisao 23
	{1798.9736,-1576.2091,5703.9097}, // prisao 24
	{1799.1174,-1571.5654,5703.9097}, // prisao 25
	{1798.7675,-1566.8885,5703.9097}, // prisao 26
	{1798.4821,-1562.1366,5703.9067}, // prisao 27
	{1799.6677,-1557.3447,5703.9067}, // prisao 28
	{1799.3126,-1552.5980,5703.9136} // prisao 29
};
main(){

	WasteDeAMXersTime();
	return 1;
}
new AntDMZone[3];
new ZonaPesca[2];
enum Caixass{
	caixaid,
	Float:CaixaX,
	Float:CaixaY,
	Float:CaixaZ,
	Float:CaixaRX,
	Float:CaixaRY,
	Float:CaixaRZ,
	CaixaGrana,
	bool:CaixaCriado,
	bool:SendoRoubado,
	bool:CaixaQuebrado,
	Text3D: CaixaTexto,
	ObjetoCaixa
}
new InfoCaixa[MAX_CAIXAS][Caixass];
enum InterioresCfg{
	Interior,
	Vw,
	Text3D: LabelEntrada,
	Text3D: LabelSaida,
	PickEntrada,
	PickSaida,
	Float:IntX,
	Float:IntY,
	Float:IntZ,
	Float:IntsX,
	Float:IntsY,
	Float:IntsZ,
	bool:InteriorCriado,
	NomeInterior[30],
	TipoIcon,
	Icone
};
new IntInfo[MAX_INTERIORES][InterioresCfg];
enum GpsInfor{
	gpsid,
	LocalName[32],
	Float:LocalX,
	Float:LocalY,
	Float:LocalZ,
	LocalTipo,
	bool: LocalCriado
}
new GpsInfo[MAX_GPS_LOCAL][GpsInfor];
enum pisinfoS{
	DonoPortao[24],
	SenhaPortao[32],
	Float: Px,
	Float: Py,
	Float: Pz,
	Float: Pxr,
	Float: Pyr,
	Float: Pzr,
	PortaoID,
	OPortao,
	bool: PortaoCriado,
	Text3D: PortaoText
};
new InfoPortao[MAX_PORTAO][pisinfoS];
enum Gzinform{
	gzid,
	OGZ,
	Float:Gzx,
	Float:Gzy,
	Float:Gzxx,
	Float:Gzyy,
	DonoGz,
	GZNome[32],
	bool: Dominando,
	bool: GZCriado
}
new GzInfo[MAX_GZS][Gzinform];

enum LocalEnum {
	localid,
	Text3D:TextoLocal,
	bool:LocalCriadoS,
	Float:LocalxX, Float: LocalyY, Float: LocalzZ
}
new LocalInfo[MAX_LOCALS_S][LocalEnum];
enum bank{
	Usuario[24],
	userbanco,
	Dinheiro,
	bool: Bloqueada
}
new BancoInfo[MAX_PLAYERS][bank];
enum GaragensEnum{
	Garagemid,Float: GaragemX, Float: GaragemY, Float: GaragemZ, bool:GaragemTrancada ,
	Text3D:GaragemTexto, GaragemPreco, GaragemDono[24], bool: GaragemComprada

}
new GaragemInfo[MAX_GARAGENS][GaragensEnum];

forward Float: ModelFromIpva(model);
forward Float: DistanciaPlayers(playerid, otherplayer);
forward Float: DistVehicle(playerid, vehicleid);
forward exitGamemode(playerid);

/* outros módulos importantes  -------------------------------------*/
#include "../scriptfiles/modulos/inventario.inc"
#include "../scriptfiles/modulos/mini_tutorial_registro.inc"
//------------------------------------------------------------------

// ----------------------------------- < Atualizacao Menu Vip > ---------------------------
new VeiculoInv[MAX_PLAYERS] = -1;
enum tItemMV{
	NameItem[32], priceitem, objectitem
}
static const MVItem[][tItemMV] = {
	{"BANDITO (Inventario)", 17, BANDITO},
	{"HotKnife (Inventario)", 18, HOT_KNIFE},
	{"Ovni (Inventario)", 25, UFO_AVIAO},
	{"Portao (Invetario)", 9, PORTAO}
};
/* --------------------------- < Parte MySQL/SQLite > ---------------------------*/	
#include "../scriptfiles/modulos/ConnectMysql.inc"

public OnRconCommand(cmd[]){
	if(!strcmp(cmd, "supergmx")){
		SendClientMessageToAll(LIGHTBLUE, "* Super-gmx lancado pelo console online.");
		KickarTodos(-1);
		SalvarTudo();
		SendRconCommand("exit");
	}
	if(!strcmp(cmd, "dstrd")){
		DestruirTextDraws(0);
	}
	return 1;
}
public OnGameModeInit()
{
	print("Servidor: Carregando gamemode...");
	//CA_Init();
	CriarObjetosMAPA();
	Iter_Clear(Gangzoness);
	WasteDeAMXersTime();
	AntiDeAMX();
	SetTimer("mensagens", minutos(2), true);
	OutrosTimers = SetTimer("timer", 2000, true);
	TimerPayday = SetTimer("checkpay", 1000, true);
	SetTimer("CheckVehicleAluguelTimer", minutos(20), true);
	SetTimer("AtualizarFome", minutos(4), true);
	SetTimer("AtualizarSede", minutos(3), true);
	
	new tempo = gettime();
	tempoAluguelCobrar = gettime() + 3900 * 3;
	ResetarPD();
	EnableZoneNames(true);
	mudarclima();
	tempoeclima();
	DisableInteriorEnterExits();
	UsePlayerPedAnims();
	ShowNameTags(false);
	SetNameTagDrawDistance(14.0);
	EnableStuntBonusForAll(false);
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
    AreaRoubo(1903.0658,1426.2345,72.6910);
    ManualVehicleEngineAndLights();
    //-----------------------------------<Objetos>--------------------------------------------
    GerarObjetos();
    // Loja de Aluguel -----------------------------------------
  
	for(new i; i < sizeof CarroDaLoja; i++){
  		CarroDaLoja[i] = CriarVeiculo("Carro do Aluguel de carros", VeiculoLojaAluguel[i][aluguelModel], VeiculoLojaAluguel[i][aluguelposX], VeiculoLojaAluguel[i][aluguelposY], VeiculoLojaAluguel[i][aluguelposZ], VeiculoLojaAluguel[i][aluguelposA], VeiculoLojaAluguel[i][aluguelColor], VeiculoLojaAluguel[i][aluguelColor2], VeiculoLojaAluguel[i][aluguelSpawn]);
  	}
	for(new i; i < sizeof CarroDaLoja; i++){
		VehOpcao(CarroDaLoja[i], DESLIGAR_VEICULO);
	}
	//-----------------------------------<MySQL Conexao>--------------------------------------
	Iniciardatabases();
	CarregarDadosdoDB();
	/* --------------------------- < Textos Metro Spawm > --------------------------------------*/
    CreateDynamicPickup(19607, 1, 1153.9907,-1772.6782,16.5992);
    CreateDynamicPickup(19607, 1, 3585.5808,548.1251,1519.5316);
    CreateDynamic3DTextLabel("{33ccff}Metro\n{ffffff}Aperte 'Y' para sair.", -1, 3585.5808,548.1251,1519.5316, 30.0);
    CreateDynamic3DTextLabel("{33ccff}Metro\n{ffffff}Aperte 'Y' para entrar.", -1, 1153.9907,-1772.6782,16.5992, 30.0);
	/*  ---------------------------------------------------------------------------------------- */
	CreateDynamic3DTextLabel("{33ccff}Garagem\n{ffffff}Aperte 'Y' para sair.", -1, 943.6443,2129.4978,1004.6800,15.0);

	for(new i; i < sizeof PosPickMunDep; i++){
		InfoPickAmmo[i][TextoPickMun] = CreateDynamic3DTextLabel("Aperte 'Y' Para pegar municao.\n10/10", LIGHTBLUE, 
			PosPickMunDep[i][0], PosPickMunDep[i][1], PosPickMunDep[i][2], 30.0);// 30.0, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
		InfoPickAmmo[i][PickupPickMun] = CreateDynamicPickup(2040, 1,PosPickMunDep[i][0], PosPickMunDep[i][1], PosPickMunDep[i][2]);//, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_PICKUP_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
		InfoPickAmmo[i][PickMunicao] = 10;
	}

	for(new i; i < sizeof CoordPTDep; i++){
		PTDEPInfo[i][TextoPT] = CreateDynamic3DTextLabel("Portao do Deposito\nAperte 'Y' para explodir", LIGHTBLUE, CoordPTDep[i][0], CoordPTDep[i][1], CoordPTDep[i][2]-3, 30.0);
		PTDEPInfo[i][OPTDep] = CreateDynamicObject(980, CoordPTDep[i][0], CoordPTDep[i][1], CoordPTDep[i][2], CoordPTDep[i][3], CoordPTDep[i][4], CoordPTDep[i][5]);
	}	
	
	for(new i; i < 12; i++){ 
		CriarVeado();
	}

	for(new i = 1; i <sizeof PostoInfo; i++){
		if(1 <= i <= 3) PostoI[i][CombustivelDisponivel] = 1100;
		else
			PostoI[i][CombustivelDisponivel] = 45000;

		PostoInfo[i][PostoLabel] = CreateDynamic3DTextLabel("{33aa33}Posto Disponivel\n{ffffff}Use /abastecer\n/enchergalao", -1, PostoInfo[i][PostoX],PostoInfo[i][PostoY],PostoInfo[i][PostoZ], 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	}
	for(new i = 1; i < 6; i++){
		CreateDynamic3DTextLabel("{33aa33}Componentes De Maconha\nUse /pegarcomponente", -1, MaconhaRecolher[i][MaconhaPosicaoX], MaconhaRecolher[i][MaconhaPosicaoY], MaconhaRecolher[i][MaconhaPosicaoZ], 25.0);
	}
	CreateDynamic3DTextLabel("{fff000}Produzir SEMENTE\n{ffffff}/criarSEMENTE", -1, 2566.3037,2811.2964,10.8203, 30.0);

	/* <------------------------------------- < Objetos >------------------------------------------------->*/
	CreateDynamicPickup(1210, 1, -1046.7114, -585.7683, 32.2494);
	CreateDynamic3DTextLabel("{33ccff}Transpt. De Combustivel\n{ffffff}Aperte 'Y'", -1, -1046.7114, -585.7683, 32.2494, 30.0);

	CreateDynamic3DTextLabel("{33ccff}Spawnador De Veiculos\n{ffffff}Aperte F", -1, -997.0001, -600.4232, 32.0432, 90.0);
	CreateDynamic3DTextLabel("{fff000}Abastecer Caminhao\n{ffffff}Use /abastecerc", -1, -993.6506, -698.6577, 32.0566, 30.0);
	CreateDynamicPickup(1239, 1, -993.6506, -698.6577, 32.0566);


    //-------------------------------------- < Cacador > --------------------------------------------------

	CreateDynamicObject(16151, -1629.55945, -2238.97290, 30.77627,   0.00000, 0.00000, 4.00000);
	CreateDynamicObject(1736, -1633.82153, -2232.37305, 33.29050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(358, -1637.91992, -2238.04785, 32.80910,   -15.35999, -21.54002, 90.00000);

    CreateDynamic3DTextLabel("{33ccff}Emprego De Cacador\n{ffffff}Aperte 'Y'", -1, -1644.03650, -2231.24292, 29.53947, 30.0);
    CreateDynamicPickup(1210, 1, -1644.03650, -2231.24292, 29.53947);

    CreateDynamic3DTextLabel("{fff000}Vender Couros de Servos\n{ffffff}/venderc", -1, -1631.17444, -2240.77710, 31.43168, 30.0);
    CreateDynamicPickup(1239, 1, -1631.17444, -2240.77710, 31.43168);// worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_PICKUP_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)


    //Tunagem Oficina
    CreateDynamic3DTextLabel("{33ccff}Tunagem De Veiculos\n{ffffff}/tunar", -1, 1816.4877,-1432.2344,13.6016, 30.0);
    CreateDynamic3DTextLabel("{33ccff}Tunagem De Veiculos\n{ffffff}/tunar", -1, 1816.6492,-1440.3865,13.5895, 30.0);

    //Emprego De Samu
    CreateDynamic3DTextLabel("{33ccff}Emprego De Samu\n{ffffff}Aperte 'Y'", -1,  1183.25842, -1316.67725, 13.55144, 30.0);
    CreateDynamicPickup(1210, 1,  1183.25842, -1316.67725, 13.55144);
    CreateDynamic3DTextLabel("{33ccff}Spawnador De Veiculos\n{ffffff}Aperte 'F'", -1, 1182.45911, -1334.29919, 13.55144, 30.0);

    //Emprego De Taxista
    CreateDynamic3DTextLabel("{33ccff}Spawnador De Veiculos\n{ffffff}Aperte 'F'", -1, 597.5421,-1507.7991,15.4015, 30.0);
    CreateDynamic3DTextLabel("{33ccff}Emprego De Taxista\n{ffffff}Aperte 'Y'", -1, 595.9457,-1514.7836,15.4952, 30.0);
    CreateDynamicPickup(1210, 1, 595.9457,-1514.7836,15.4952);
   
    //Emprego De LEITEiro
    CreateDynamic3DTextLabel("{33ccff}Emprego De Leiteiro\n{ffffff}Aperte 'Y'", -1, -371.35501, -1436.94507, 25.65495, 25.0);
    CreateDynamicPickup(1210, 1, -371.35501, -1436.94507, 25.65495);
    CreateDynamic3DTextLabel("{33ccff}Eric Do Leite Morno\n{ffffff}/venderLEITE", -1, -377.46396, -1449.73047, 25.64083, 30.0);
  
    //Emprego de Mecanico
    CreateDynamic3DTextLabel("{33ccff}Menu Do Mecanico\n{ffffff}Use /mecmenu", -1, 1832.9821,-1417.8627,13.6016, 30.0);
    CreateDynamicPickup(1239, 1, 1832.9821,-1417.8627,13.6016);
    CreateDynamic3DTextLabel("{33ccff}Spawnador De Veiculos\n{ffffff}Aperte F", -1, 1836.1971,-1410.5281,13.6016, 10.0);
    CreateDynamic3DTextLabel("{33ccff}Emprego De Mecanico\n{ffffff}Aperte 'Y'", -1, 1832.1105,-1446.1182,13.5930, 10.0);
    CreateDynamicPickup(1210, 1, 1832.1105,-1446.1182,13.5930); 
	
	//Emprego de Carro Forte
	CreateDynamic3DTextLabel("{33ccff}Bolsa De Grana\n{ffffff}/pegardinheiro", -1, -986.9874,1467.3966,1332.0389, 7.0);
	CreateDynamic3DTextLabel("{33ccff}Emprego De Carro Forte\n{ffffff}Aperte 'Y'", -1, 1709.5602,924.0325,-8.6412, 10.0);
	CreateDynamicPickup(1210, 1, 1709.5602,924.0325,-8.6412);
	//CreateDynamicPickup(1239, 1, 1650.7220,923.1868,10.6719);
	CreateDynamic3DTextLabel("{33aa33}Spawnador De Veiculos\n{ffffff}Aperte F", -1, 1701.5437,917.7558,10.8203, 30.0);
    
    CreateDynamicPickup(1083, 1,1077.3367,-1780.9073,13.6607);//, worldid = -1, interiorid 
    //puxarveiculo= -1, playerid = -1, Float:streamdistance = STREAMER_PICKUP_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
    CreateDynamic3DTextLabel("{33ccff}Puxador de Veiculos\nAperte 'Y' Para acessar.", -1, 1077.3367,-1780.9073,13.6607, 30.0);
    
    // spawnador de bikes
	CreateDynamic3DTextLabel("{33ccff}Spawnador De Faggio\n{ffffff}Aperte F", -1, -1746.7351,13.5703,357.6936, 80.0);
    
    //------------------------------------- < Transporte de armas > ------------------------------
    CreateDynamic3DTextLabel("{33ccff}Spawnador De Veiculos\n{ffffff}Aperte F", -1, 2403.4880,-2101.4609,13.5469, 30.0);
	CreateDynamic3DTextLabel("{33aa33}Carregar Caminhao\n{ffffff}/carregarc", -1, 2413.7568,-2013.8184,13.4351, 30.0);
	CreateDynamicPickup(1239, 1, 2413.7568,-2013.8184,13.4351);

	CreateDynamic3DTextLabel("{33aa33}Descarregar Caminhao\n{ffffff}/descarregarc", -1, -1722.4606,-117.3898,3.5489, 30.0);
	CreateDynamicPickup(1239, 1, -1722.4606,-117.3898,3.5489);
    CreateDynamic3DTextLabel("{33aa33}Emprego De Transpt. De Armas\n{ffffff}Aperte 'Y'", -1, 2421.0293,-2101.2983,13.5538, 30.0);
    CreateDynamicPickup(1210, 1, 2421.0293,-2101.2983,13.5538);
	
	//------------------------------------- < Madeireira > ------------------------------

	CreateDynamic3DTextLabel("{33aa33}Descarregar Madeiras\n/{ffffff}descarregarm", -1, -1114.63110, -1621.44092, 76.42254, 30.0);
	CreateDynamicPickup(1239, 1, -1114.63110, -1621.44092, 76.42254);
	CreateDynamic3DTextLabel("{33aa33}Entregar Madeiras\n{ffffff}/dmadeiras", -1, -418.3577,-1763.3823,5.4784, 30.0);
	CreateDynamicPickup(1239, 1, -418.3577,-1763.3823,5.4784);
	CreateDynamic3DTextLabel("{33aa33}Transportador De Madeiras\n{ffffff}Aperte 'Y'", -1, -438.9700,-1757.5052,7.4376, 30.0);
	CreateDynamicPickup(1210, 1, -438.9700,-1757.5052,7.4376);
	CreateDynamic3DTextLabel("{33aa33}Cortador De Madeiras\n{ffffff}Aperte 'Y'", -1, -424.6707,-1763.9119,7.4376, 30.0);
	CreateDynamicPickup(1210, 1, -424.6707,-1763.9119,7.4376);
	
	//------------------------------------- < Pescador > ------------------------------
	CreateDynamic3DTextLabel("{33ccff}Emprego De Pescador\n{ffffff}Aperte 'Y' para pegar.", -1, -357.2361,-454.2185,6.9756, 30.0);
	CreateDynamicPickup(1210, 1, -357.2361,-454.2185,6.9756);
	CreateDynamic3DTextLabel("{33ccff}Venda De Peixes\n{fff000}Use /dpeixes", -1, -399.8480,-428.8607,16.2031, 30.0);
	CreateDynamicPickup(1239, 1, -399.8480,-428.8607,16.2031);
	CreateDynamic3DTextLabel("{33ccff}Spawnador De Veiculos\n{ffffff}Aperte 'F'", -1, -439.8221,-1752.9894,6.7783, 30.0);
	CreateDynamic3DTextLabel("{33ccff}Spawnar Veiculo Pescador\nAperte F", -1, -340.5342,-459.1330,2.2028, 30.0);
	CreateDynamic3DTextLabel("{33aa33}Carregar Madeiras\n{ffffff}/carregarm", -1, -423.2203,-1767.7653,5.0589, 30.0);
	CreateDynamicPickup(1239, 1, -423.2203,-1767.7653,5.0589);

	//------------------------------------- < Prisao de Bangu > ------------------------------
	CreateDynamic3DTextLabel("{33ccff}Prisao De Bangu\n{ffffff}/prender", -1, 876.2717,2259.7966,10.9103, 30.0);
	CreateDynamicPickup(1239, 1, 876.2717,2259.7966,10.9103);	

	// ------------------------------------------ < Conces >----------------------------------
	CreateDynamicPickup(1239, 1,  -2253.6848,3391.2898,734.5806);//496.3505,-2161.9553,13.6107,178.2157,0,0,0,0,0,0); // posi??o conce
	CreateDynamic3DTextLabel("{33ccff}Concessionaria\n{ffffff}Digite /conce", -1,  -2253.6848,3391.2898,734.5806, 30.0);

	CarroConce[0] = AddStaticVehicleEx(411, 1790.1060, -1701.8846, 13.6608, 180.0000, -1, -1, -1, false);
	CarroConce[1] = AddStaticVehicleEx(415, 1778.9781, -1712.4991, 13.4445, 180.0000, -1, -1, -1, false);
	CarroConce[2] = AddStaticVehicleEx(541, 1797.1720, -1702.2072, 13.2158, 180.0000, -1, -1, -1, false);
	CarroConce[3] = AddStaticVehicleEx(541, 1799.6033, -1693.2682, 13.2963, 272.0000, -1, -1, -1, false);
	CarroConce[4] = AddStaticVehicleEx(541, 1776.6118, -1701.7590, 13.4544, 90.0000, -1, -1, -1, false);
	CarroConce[5] = AddStaticVehicleEx(541, 1777.0776, -1693.4569, 13.2640, 90.0000, -1, -1, -1, false);

	//------------------------------------------- < Orgs > -----------------------------------
	for(new i = 1; i < sizeof OrgGm; i++){
		OrgInfo[i][OrgCriada] = true;
	}
	//------------------------------------------- < Gzs... > ---------------------------------
	ZonaDeCaca = GangZoneCreate( -2219, -2808.5, -691, -1749.5);
	ZonaPesca[1] = 	GangZoneCreate(-193, -686.5, -93, -571.5);
	ZonaDeCacaDinamica = CreateDynamicRectangle( -2219, -2808.5, -691, -1749.5);
    AntDMZone[0] = CreateDynamicRectangle( 349, -2088.5, 409, -1722.5);
	ZonaPesca[0] = CreateDynamicRectangle(-193, -686.5, -93, -571.5);
	DynamicZonaCaca = CreateDynamicRectangle( -2219, -2808.5, -691, -1749.5);

	Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, 300);
	return 1;
}
public OnVehicleStreamIn(vehicleid){
	for(new i; i < 3; i++){
		if(vehicleid == CarroConce[i]){
			SetVehicleParamsEx(vehicleid,false,false,false,true,true,false,false);
			SetVehicleToRespawn(vehicleid);			
		}
	}
	return 1;
}
forward checkpay();
public checkpay(){
	if( Tempopayday < gettime()){
		////printf("Payday dado com sucesso!");
		ResetarPD();
		darpayday();
	}
	if(tempoAluguelCobrar < gettime()){
		tempoAluguelCobrar = gettime() + 3600 * 3;
		SendClientMessageToAll(VerdeSamp, "As cobrancas de aluguel acabam de chegar!");
		foreach(new i: B_House){
			for(new al; al < 4; al++){
				if(InfoCasa[i][CasaComprada] == 1 && !isnull(InfoAluguel[i][al][AluguelNome]) || strcmp(InfoAluguel[i][al][AluguelNome], "Ninguem")){
					foreach(new p: Player){
						if(!strcmp(nome(p), InfoAluguel[i][al][AluguelNome], true)){
							GivePlayerCash(p, -InfoCasa[i][Aluguel]);
							SendClientMessage(p, LIGHTBLUE, "(Aluguel) Foi subtraido de voce %dR$ do aluguel.", InfoCasa[i][Aluguel]);
							AdicionarItemCasa(i, DINHEIRO_FLUTUANTE, InfoCasa[i][Aluguel]);
						}
					}					
				}
			}
		}
	}
	return 1;
}
forward timer();
public timer(){
	CheckPrisonStaff();
	CheckPrisonMilitar();
	//checkstates();
	new str[150];
	foreach(new i: Player){
		if(PlayerInfo[i][Logado]){
			if(!isnull(PlayerInfo[i][TituloPersonalizado]) && !isnull(PlayerInfo[i][Titulo])) format(str, sizeof str, "%s\n%s\nID:%04d", PlayerInfo[i][TituloPersonalizado],PlayerInfo[i][Titulo], PlayerInfo[i][IDFixo]);
			if(isnull(PlayerInfo[i][TituloPersonalizado]) && !isnull(PlayerInfo[i][Titulo])) format(str, sizeof str, "%s\nID:%04d",PlayerInfo[i][Titulo], PlayerInfo[i][IDFixo]);
			if(!isnull(PlayerInfo[i][TituloPersonalizado]) && isnull(PlayerInfo[i][Titulo])) format(str, sizeof str, "%s\nID:%04d", PlayerInfo[i][TituloPersonalizado], PlayerInfo[i][IDFixo]);
			if(isnull(PlayerInfo[i][TituloPersonalizado]) && isnull(PlayerInfo[i][Titulo])) format(str, sizeof str, "ID:%04d", PlayerInfo[i][IDFixo]);
			SetPlayerChatBubble(i, str, Roxoeu, 15.0, 4000);
			if(NoTaser[i]) if(PlayerSpeed(i) > 0) ApplyAnimationEx(i, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0, SYNC_ALL);
			if(PlayerInfo[i][Ferido]){
				if(IsPlayerInAnyVehicle(i)){
					new str2[144];
					format(str2, sizeof str2, "%s foi kickado por entrar ferido em um veiculo.", nome(i));
					SendClientMessageToAll(Rosa, str2);
					Kick(i);
				}
				else
					ApplyAnimationEx(i, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0, SYNC_ALL);
			}
			
			if( (Tempopayday - gettime()) > 0) format(str, sizeof str, "%s", ConvertPayday(Tempopayday - gettime()));
			PlayerTextDrawSetString(i, Hud[i][1], str);
			PlayerTextDrawShow(i, Hud[i][1]);
		}
	}
	return 1;
}

public OnGameModeExit()
{

	mysql_terminou = false;
	DestroyAllDynamicObjects();
	Iter_Clear(Gangzoness);
	return 1;
}
public OnPlayerExitVehicle(playerid, vehicleid){
	////////printf("OnPlayerExitVehicle");
	if(vehicleid == VeiculoInv[playerid] && VeiculoInv[playerid] != -1){
		if(IsVehicleAttachedObjectSlotUsed(VeiculoInv[playerid], 2))
			RemoVehicleAttachedObject(VeiculoInv[playerid], 2);

		DestroyVehicleEx(VeiculoInv[playerid], "");
		VeiculoInv[playerid] = -1;
	}
	
	if(Arrastado[playerid] || Sequestrado[playerid]){
	    PutPlayerInVehicle(playerid, vehicleid, 3);
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Nao saia do veiculo. Voce pode ser preso.");
	}
	return 1;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid){
	if(InEdit[playerid] && clickedid == Text:INVALID_TEXT_DRAW){
		SelectTextDraw(playerid, 0x33ccff);
	}
	if(EmTunagem[playerid]){
		EmTunagem[playerid] = false;
		if(clickedid == Text:INVALID_TEXT_DRAW){
			new id = GetPVarInt(playerid, "CARidV");
			if(vComponent[GetPlayerVehicleID(playerid)] != 0){
				vComponent[GetPlayerVehicleID(playerid)] = 0;
			}
			carregarComponentes(playerid, id);
			SlotTunCar[playerid] = 0;
			for(new i; i < 7; i++){
				PlayerTextDrawHide(playerid, TunagemTD[playerid][i]);
			}
			//////printf("chamando");
			CancelSelectTextDraw(playerid);
		}
	}
	return 1;
}
public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	new Slot = GetPVarInt(playerid, "AcesEdit");
	if(playertextid == skinSelect[playerid][0]){
		if(SkinSelected[playerid] <= 0){
			SkinSelected[playerid] = 3;
		}
		else
			SkinSelected[playerid] --;

		SetActorSkin(ActorPlayer[playerid], skinpage[SkinSelected[playerid]]);
		interpolarSkin(playerid);
	}
	if(playertextid == skinSelect[playerid][1]){
		if(SkinSelected[playerid] >= 3){
			SkinSelected[playerid] = 0;
		}
		else
			SkinSelected[playerid] ++;
		
		SetActorSkin(ActorPlayer[playerid], skinpage[SkinSelected[playerid]]);
		interpolarSkin(playerid);
	}
	if(playertextid == skinSelect[playerid][2]){
		if(InEdit[playerid]){
			if(IsValidActor(ActorPlayer[playerid])) 
				DestroyActor(ActorPlayer[playerid]);

			PlayerInfo[playerid][Skin] = skinpage[SkinSelected[playerid]];
			EstiloSpawn[playerid] = SPAWN_CIVIL;
	
			SetPlayerVirtualWorld(playerid, 0);
			CarregarHabilitacoes(playerid);
			GivePlayerCash(playerid, 500);
			InEdit[playerid] = false;
			SkinSelected[playerid] = 0;
			for(new i; i < 3; i++){
				PlayerTextDrawHide(playerid, skinSelect[playerid][i]);
			}
			if(JaRegistrado[playerid]){
				TogglePlayerSpectating(playerid, false);
				if(CheckPosInvalida(playerid)){

				}
				else
					SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin], PlayerInfo[playerid][Px],PlayerInfo[playerid][Py],PlayerInfo[playerid][Pz],90.0);
				
				SpawnPlayer(playerid);
				//SetPlayerPos(playerid, PlayerInfo[playerid][Px],PlayerInfo[playerid][Py],PlayerInfo[playerid][Pz]); // meu deus como o samp é ruim
				JaRegistrado[playerid] = false;
				
			}
			else{
				ShowPlayerDialog(playerid, DIALOG_GENERO_LOGIN, DIALOG_STYLE_LIST, "{33ccff}Escolha Seu Genero!", "{33ccff}Masculino\n{fff000}Feminino", "Ok", "Sair");
				

			}
		}
	}
	if(playertextid == DrawInv[playerid][35]){
		EsconderInventario(playerid);
	}
	static slotid = -1;
	if( (playertextid >= DrawInv[playerid][1] && playertextid <= DrawInv[playerid][33]) && MochilaTDAberta[playerid]){
		
		for(new i = 1; i < 33; i++){
			if(playertextid == DrawInv[playerid][i]){
				slotid = i-1;
				break;
			}
			else
				continue;
		}
		PlayerTextDrawSetString(playerid, DrawInv[playerid][37], "%s - %d unidades", InventarioName(ItemInfo[playerid][slotid][Item]), ItemInfo[playerid][slotid][Quantia]);	
	
	}
	if(playertextid == DrawInv[playerid][36]){
		if(slotid == -1) return SendClientMessage(playerid, LIGHTBLUE, "Clique em algum item.");
		SetPVarInt(playerid, "slot", slotid);
		ShowPlayerDialog(playerid, DIALOG_FUNCOESMOCHILATD, DIALOG_STYLE_LIST, "{fff000}Funcoes Disponiveis", "Usar\nExcluir\nSeparar Item", "Select", "Sair");
	}
	if(playertextid == ConceMenu[playerid][17]){
		FecharConce(playerid);
		SendClientMessage(playerid, LIGHTBLUE, "Concessionaria fechada.");
		CancelSelectTextDraw(playerid);
	}
	if(playertextid == ConceMenu[playerid][9]){
		if(veiculoslot[playerid] == sizeof carrosCompra) return SendClientMessage(playerid, -1, "Nenhum proximo veiculo disponivel.");
		veiculoslot[playerid] ++;
		MostrarConce(playerid);
	}
	if(playertextid == ConceMenu[playerid][7]){
	    new str[144];
		format(str, sizeof(str), "{ffffff}Deseja mesmo comprar o veiculo %s ({47d32a}R$%d{ffffff})?", GetVehicleName(carrosCompra[veiculoslot[playerid]][carroModel]), carrosCompra[veiculoslot[playerid]][carroPrice]);
	    ShowPlayerDialog(playerid, DIALOG_COMPRAR, DIALOG_STYLE_MSGBOX, "{fff000}Confirmacao De Compra", str, "Ok", "Sair");
	}
	if(playertextid == ConceMenu[playerid][8]){
		if(veiculoslot[playerid] == 1) return SendClientMessage(playerid, -1, "Nenhum veiculo anterior disponivel.");
		veiculoslot[playerid] --;
		MostrarConce(playerid);
	}
		//   textdraws interacao Ammunation
	if(playertextid == AmmunationText[playerid][1]){
		for(new i; i < 20; i++){
			PlayerTextDrawHide(playerid, AmmunationText[playerid][i]);
		}
		CancelSelectTextDraw(playerid);
		SendClientMessage(playerid, LIGHTBLUE, "Voce fechou o menu da Ammunation.");

	}
	if(playertextid == AmmunationText[playerid][3]){
		if(varAmmunation[playerid] == 1) return SendClientMessage(playerid, LIGHTBLUE, "Nenhuma arma a mais para ver.");
		varAmmunation[playerid] --;

		MostrarAmmunation(playerid);
	}
	if(playertextid == AmmunationText[playerid][4]){
		if(varAmmunation[playerid] == sizeof ArmaAmmunation-1) return SendClientMessage(playerid, LIGHTBLUE, "Nenhuma arma a mais para ver.");
		varAmmunation[playerid] ++;

		MostrarAmmunation(playerid);
	}
	if(playertextid == AmmunationText[playerid][2]){
		new arma = varAmmunation[playerid];
		if(GetPlayerCash(playerid) < ArmaAmmunation[arma][Valor]) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao tem dinheiro suficiente.");
		if(ArmaAmmunation[arma][ArmaVip] && PlayerInfo[playerid][Vip] < 1) return SendClientMessage(playerid, LIGHTBLUE, "Voce precisa ser vip para comprar este tipo de arma.");
		GivePlayerCash(playerid, -ArmaAmmunation[arma][Valor]);
		GivePlayerWeapon(playerid, WEAPON:ArmaAmmunation[arma][IDArma], ArmaAmmunation[arma][QuantiaDar]);
		new str[90];
		format(str, sizeof str, "Voce comprou a arma %s(x%d)", ArmaAmmunation[arma][ArmaNome], ArmaAmmunation[arma][QuantiaDar]);
		SendClientMessage(playerid, LIGHTBLUE, str);
	}
	//
	if(playertextid == LoginDraw[playerid][8]){
		new playersenha[61];
		GetPVarString(playerid, "SenhaPlayer", playersenha, 61);
		if(isnull(playersenha)) return SendClientMessage(playerid, LIGHTBLUE, "* O Campo senha e obrigatorio.");
		if(4 < strlen(playersenha) > 25) return SendClientMessage(playerid, LIGHTBLUE, "Sua senha precisa conter entre 4 e 32 caracteres.");
		EsconderLogin(playerid);
		ContinuarLogin(playerid, nome(playerid), playersenha);
	
	}
	if(playertextid == LoginDraw[playerid][7]){
		ShowPlayerDialog(playerid, DIALOG_SENHA, DIALOG_STYLE_PASSWORD, "{fff000}Digite a senha a baixo", "{33ccff}Digite a senha de Login/Registro para entrar no servidor.", "Ok", "Sair");
	}
	if(playertextid == EditorAO[playerid][0]){
		if(TipoEdicao[playerid] == 1) ao[playerid][Slot][ao_x] += 0.1;
		if(TipoEdicao[playerid] == 2) ao[playerid][Slot][ao_x] -= 0.1;
		SetPlayerAttachedObjectEx(playerid, Slot, ao[playerid][Slot][modelindex], 
			ao[playerid][Slot][partebone], ao[playerid][Slot][ao_x], ao[playerid][Slot][ao_y],ao[playerid][Slot][ao_z], ao[playerid][Slot][ao_rx], ao[playerid][Slot][ao_ry], ao[playerid][Slot][ao_rz],ao[playerid][Slot][ao_sx], ao[playerid][Slot][ao_sy], ao[playerid][Slot][ao_sz]);	
	}
	if(playertextid == EditorAO[playerid][1]){
		if(TipoEdicao[playerid] == 1) ao[playerid][Slot][ao_y] += 0.1;
		if(TipoEdicao[playerid] == 2) ao[playerid][Slot][ao_y] -= 0.1;
		SetPlayerAttachedObjectEx(playerid, Slot, ao[playerid][Slot][modelindex], 
			ao[playerid][Slot][partebone], ao[playerid][Slot][ao_x], ao[playerid][Slot][ao_y],ao[playerid][Slot][ao_z], ao[playerid][Slot][ao_rx], ao[playerid][Slot][ao_ry], ao[playerid][Slot][ao_rz],ao[playerid][Slot][ao_sx], ao[playerid][Slot][ao_sy], ao[playerid][Slot][ao_sz]);	
	}
	if(playertextid == EditorAO[playerid][4]){
		if(TipoEdicao[playerid] == 1) ao[playerid][Slot][ao_z] += 0.1;
		if(TipoEdicao[playerid] == 2) ao[playerid][Slot][ao_z] -= 0.1;
		SetPlayerAttachedObjectEx(playerid, Slot, ao[playerid][Slot][modelindex], 
			ao[playerid][Slot][partebone], ao[playerid][Slot][ao_x], ao[playerid][Slot][ao_y],ao[playerid][Slot][ao_z], ao[playerid][Slot][ao_rx], ao[playerid][Slot][ao_ry], ao[playerid][Slot][ao_rz],ao[playerid][Slot][ao_sx], ao[playerid][Slot][ao_sy], ao[playerid][Slot][ao_sz]);	
	}
	if(playertextid == EditorAO[playerid][6]){
		if(TipoEdicao[playerid] == 1) ao[playerid][Slot][ao_rx] += 0.1;
		if(TipoEdicao[playerid] == 2) ao[playerid][Slot][ao_rx] -= 0.1;
		SetPlayerAttachedObjectEx(playerid, Slot, ao[playerid][Slot][modelindex], 
			ao[playerid][Slot][partebone], ao[playerid][Slot][ao_x], ao[playerid][Slot][ao_y],ao[playerid][Slot][ao_z], ao[playerid][Slot][ao_rx], ao[playerid][Slot][ao_ry], ao[playerid][Slot][ao_rz],ao[playerid][Slot][ao_sx], ao[playerid][Slot][ao_sy], ao[playerid][Slot][ao_sz]);	
	}
	if(playertextid == EditorAO[playerid][7]){
		if(TipoEdicao[playerid] == 1) ao[playerid][Slot][ao_ry] += 0.1;
		if(TipoEdicao[playerid] == 2) ao[playerid][Slot][ao_ry] -= 0.1;
		SetPlayerAttachedObjectEx(playerid, Slot, ao[playerid][Slot][modelindex], 
			ao[playerid][Slot][partebone], ao[playerid][Slot][ao_x], ao[playerid][Slot][ao_y],ao[playerid][Slot][ao_z], ao[playerid][Slot][ao_rx], ao[playerid][Slot][ao_ry], ao[playerid][Slot][ao_rz],ao[playerid][Slot][ao_sx], ao[playerid][Slot][ao_sy], ao[playerid][Slot][ao_sz]);	
	}
	if(playertextid == EditorAO[playerid][10]){
		if(TipoEdicao[playerid] == 1) ao[playerid][Slot][ao_rz] += 0.1;
		if(TipoEdicao[playerid] == 2) ao[playerid][Slot][ao_rz] -= 0.1;
		SetPlayerAttachedObjectEx(playerid, Slot, ao[playerid][Slot][modelindex], 
			ao[playerid][Slot][partebone], ao[playerid][Slot][ao_x], ao[playerid][Slot][ao_y],ao[playerid][Slot][ao_z], ao[playerid][Slot][ao_rx], ao[playerid][Slot][ao_ry], ao[playerid][Slot][ao_rz],ao[playerid][Slot][ao_sx], ao[playerid][Slot][ao_sy], ao[playerid][Slot][ao_sz]);	
	}
	if(playertextid == EditorAO[playerid][12]){
		TipoEdicao[playerid] = 1;
		SendClientMessage(playerid, LIGHTBLUE, "* Voce mudou a edicao para 'Mais'");
	}
	if(playertextid == EditorAO[playerid][13]){
		TipoEdicao[playerid] = 2;
		SendClientMessage(playerid, LIGHTBLUE, "* Voce mudou a edicao para 'Menos'");
	}
	//final editor android
	if(playertextid == TunagemTD[playerid][4]){
		if(SlotTunCar[playerid] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Nao ha mais slots para ver.");
		SlotTunCar[playerid] -= 1;
		new slot = SlotTunCar[playerid];
		if(IsValidComponentForVehicle(GetPlayerVehicleID(playerid), TunagemInfo[slot][ModelTunagem])){
			if(vComponent[GetPlayerVehicleID(playerid)] != 0){
				vComponent[GetPlayerVehicleID(playerid)] = 0;
			}
			vComponent[GetPlayerVehicleID(playerid)] = TunagemInfo[slot][ModelTunagem];
		}

		PlayerTextDrawSetPreviewModel(playerid, TunagemTD[playerid][1], TunagemInfo[SlotTunCar[playerid]][ModelTunagem]);
		PlayerTextDrawShow(playerid, TunagemTD[playerid][1]);
		new str[7];
		format(str, sizeof str, "~G~%d", TunagemInfo[slot][PriceTunagem]);
		PlayerTextDrawSetString(playerid, TunagemTD[playerid][6], str);
		PlayerTextDrawShow(playerid, TunagemTD[playerid][6]);
		return 1;
	}
	if(playertextid == TunagemTD[playerid][3]){
		SlotTunCar[playerid] = 0;
		if(vComponent[GetPlayerVehicleID(playerid)] != 0){
			vComponent[GetPlayerVehicleID(playerid)] = 0;
		}
		EmTunagem[playerid] = false;
		for(new i; i < 7; i++){
			PlayerTextDrawHide(playerid, TunagemTD[playerid][i]);
		}

		new id = GetPVarInt(playerid, "CARidV");
		salvarComponentes(playerid, id);
		carregarComponentes(playerid, id);
		CancelSelectTextDraw(playerid);
	}
	if(playertextid == TunagemTD[playerid][2]){ // comprar
		new slot = SlotTunCar[playerid];
		if(IsValidComponentForVehicle(GetPlayerVehicleID(playerid), TunagemInfo[slot][ModelTunagem])){
			if(GetPlayerCash(playerid) >= TunagemInfo[slot][PriceTunagem]){
				AddVehicleComponent(GetPlayerVehicleID(playerid), TunagemInfo[slot][ModelTunagem]);
				GivePlayerCash(playerid, -TunagemInfo[slot][PriceTunagem]);
				SendClientMessage(playerid, LIGHTBLUE, "* Voce comprou com sucesso este Componente.");
				vComponent[GetPlayerVehicleID(playerid)] = 0;
				return 1;
			}
			else
				SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
		}
		else
			SendClientMessage(playerid, LIGHTBLUE, "* Este componente nao e valido para este veiculo.");
	}
	if(playertextid == TunagemTD[playerid][5]){
		if(SlotTunCar[playerid] == 10) return SendClientMessage(playerid, LIGHTBLUE, "* Nao ha mais slots para ver.");
		SlotTunCar[playerid] += 1;
		new slot = SlotTunCar[playerid];
		if(IsValidComponentForVehicle(GetPlayerVehicleID(playerid), TunagemInfo[slot][ModelTunagem])){
			if(vComponent[GetPlayerVehicleID(playerid)] != 0){
				vComponent[GetPlayerVehicleID(playerid)] = 0;
			}
			vComponent[GetPlayerVehicleID(playerid)] = TunagemInfo[slot][ModelTunagem];
		}
		PlayerTextDrawSetPreviewModel(playerid, TunagemTD[playerid][1], TunagemInfo[SlotTunCar[playerid]][ModelTunagem]);
		PlayerTextDrawShow(playerid, TunagemTD[playerid][1]);
		new str[7];
		format(str, sizeof str, "~G~%d$", TunagemInfo[slot][PriceTunagem]);
		PlayerTextDrawSetString(playerid, TunagemTD[playerid][6], str);
		PlayerTextDrawShow(playerid, TunagemTD[playerid][6]);
		return 1;
	}
	if(playertextid == BuySkinTD[playerid][2]){ //esquerd (311)
		if(skinidplayer[playerid] == 1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce chegou no limite de skins.");
		skinidplayer[playerid]  --;
		PlayerTextDrawSetPreviewModel(playerid, BuySkinTD[playerid][6], skinidplayer[playerid]);
		PlayerTextDrawSetPreviewModel(playerid, BuySkinTD[playerid][5], skinidplayer[playerid]);
		PlayerTextDrawShow(playerid, BuySkinTD[playerid][6]);
		PlayerTextDrawShow(playerid, BuySkinTD[playerid][5]);
	}
	if(playertextid == BuySkinTD[playerid][1]){ //direita (311)
		if(skinidplayer[playerid] == 311) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja subiu muitas skins.");
		skinidplayer[playerid] ++;
		PlayerTextDrawSetPreviewModel(playerid, BuySkinTD[playerid][6], skinidplayer[playerid]);
		PlayerTextDrawSetPreviewModel(playerid, BuySkinTD[playerid][5], skinidplayer[playerid]);
		PlayerTextDrawShow(playerid, BuySkinTD[playerid][6]);
		PlayerTextDrawShow(playerid, BuySkinTD[playerid][5]);
	}
	if(playertextid == BuySkinTD[playerid][3]){
		if(GetPlayerCash(playerid) < 320) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
		if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
		if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem mochila.");
		GivePlayerCash(playerid, -320);
		AdicionarItemN(playerid, skinidplayer[playerid], 1);
		SendClientMessage(playerid, VerdeSamp, "* Voce acaba de comprar uma roupa nova, ela foi para sua mochila.");
	}
	if(playertextid == BuySkinTD[playerid][4]){
		CancelSelectTextDraw(playerid);
		for(new i; i< 8; i++){
			PlayerTextDrawHide(playerid, BuySkinTD[playerid][i]);
		}
		skinidplayer[playerid] = 1;
		SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de cancelar a compra.");
	}
	return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger){
	if(EmpregoCar[vehicleid] != PlayerInfo[playerid][Emprego]  && VeiculoEmprego[vehicleid] && !ispassenger){
	    if(EmpregoCar[vehicleid] == TRANSP_ARMA && IsBandido(PlayerInfo[playerid][Org])) return 1;

	    ClearAnimations(playerid);
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este veiculo, ele pertence a um especifico emprego.");
	}
	else if(OrgCarro[vehicleid] != PlayerInfo[playerid][Org] && OrgCarro[vehicleid] != 0 && !ispassenger){
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este veiculo e de uma organizacao. Voce nao pode usar.");
	    ClearAnimations(playerid);
	}
	else if(BikeSpawn[vehicleid] && BikePlayer[playerid] != vehicleid && !ispassenger){
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Esta nao e a sua faggio! Evite roubar de outras pessoas.");
		ClearAnimations(playerid);
	}
	return 1;
}
public OnPlayerRequestClass(playerid, classid){
	return 1;
}
public OnPlayerRequestSpawn(playerid)
{
	return 1;
}
public OnPlayerConnect(playerid){

    vamosver:
    if(!mysql_terminou)
    {
    	SendClientMessage(playerid, LIGHTBLUE, "O Banco de dados ainda esta carregando.");
    	SendClientMessage(playerid, LIGHTBLUE, "Voce esta na fila de espera.");
        goto vamosver;
    }else{
		Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, 600, playerid);
		CriarTextDraws(playerid);
		RemoveOBMAPA(playerid);
		ResetarMochila(playerid);
		CriarInventario(playerid);
		Trigger(playerid, RESETAR_TRIGGER);
		TogglePlayerSpectating(playerid, true);
		JaRegistrado[playerid] = false;
		ChecarAnexagem(playerid);
		MochilaTDAberta[playerid] = false;
		novato[playerid] = false;
		// resetando uma Enum
		new reset[PlayerData];
		PlayerInfo[playerid] = reset;
		

		AvisosArma[playerid] = 0;
		varAmmunation[playerid] = 1;
		VeiculoEntrou[playerid] = 0;
		veiculoslot[playerid] = 1;
		RemoveBuilding(playerid);
		
		tipoconce[playerid] = 1;
		Sentado[playerid] = false;
		EnchendoGalao[playerid] = false;
		AvisoAuto[playerid] = 0;
		Algemado[playerid] = false;
		TaserAtivado[playerid] = false;
		DeletePVar(playerid, "SenhaPlayer");
		PlayerInfo[playerid][MomentoFerido] = -1;
		PlayerInfo[playerid][Ferido] = false;
		PlayerInfo[playerid][Logado] = false;
		Controle[playerid] = true;
		SetPVarInt(playerid, "DescarregandoCombus", 0);
	    RoubandoBanco[playerid] = false;
	    TrabalhandoEmprego[playerid][PlayerInfo[playerid][Emprego]] = false;
	    NoSaco[playerid] = false;
	    PegandoCouro[playerid] = false;
	    Couros[playerid] = 0;
	    Nopm[playerid] = -1;
	    TipoEdicao[playerid] = 1;
		PlantandoSEMENTE[playerid] = false;
		Morto[playerid] = false;
		DscEq[playerid] = false;
		SetPVarInt(playerid, "Freq", 0);
		TimerMac[playerid] = -1;
		CurandoAlguem[playerid] = -1;
		TickUp[playerid] = 0;
		EmTunagem[playerid] = false;
		CasaSpawn[playerid] = -1;
		contandogas[playerid] = 0;
		CasaSpawn[playerid] = -1;
		SetPVarInt(playerid, "checking", 0);
		//print("testando crash 9");
		Atropelado[playerid] = false;
		Hits[playerid] = 0;
		Nopm[playerid] = -1;
		skinidplayer[playerid] = 1;
		JBLProxima[playerid] = -1;
		NivelAdmin[playerid] = 0;
		PedindoMecanico[playerid] = false;//dl.dropboxusercontent.com
		PedindoTaxi[playerid] = false;
		PedindoSamu[playerid] = false;
		SetPVarInt(playerid, "CFGCOFRE", -1);
		//print("testando crash 10");
		CriouJBL[playerid] = -1;
		ReparandoCaixa[playerid] = false;
		PlantandoCaixa[playerid] = false;
		//print("testando crash 11");
		if(IsValidTimer(TimerRepararcaixa[playerid]))
			KillTimer(TimerRepararcaixa[playerid]);
	    
	    //print("testando crash 12");
	    Caixaplayer[playerid] = -1;
	    BikePlayer[playerid] = -1;
	    VeiculoInv[playerid] = -1;
	    PlantandoCaixa[playerid] = false;
	    Arrastado[playerid] = false;
	    Sequestrado[playerid] = false;
	    
	    //print("testando crash 13");
	    SetPVarInt(playerid, "editandosabosta", 0);
	    //print("testando crash 14");
	    QueLigou[playerid] = false;
	    DentroDeCasa[playerid] = -1;
	    DentroDeGaragem[playerid] = -1;
	    Tentativas[playerid] = 0;
	    Discando[playerid] = -1;
	    EmChamada[playerid] = false;
		TrabalhoStaff[playerid] = false;
	    NaMao[playerid] = 0;
	    EditandoCaixa[playerid] = false;
	    EmTv[playerid] = false;
	    JaCortando[playerid] = false;
	    GangZoneShowForPlayer(playerid, ZonaPesca[1], Amarelo);
		new Reset2[bank];
		BancoInfo[playerid] = Reset2;
		AvisoAuto[playerid] = 0;
		Pescando[playerid] = false;
		Peixes[playerid] = 0;
	    AvisosSair[playerid] = 0;
	    SpawnouEmprego[playerid] = -1;
		if(IsValidTimer(TimerTeste[playerid]))
			KillTimer(TimerTeste[playerid]);
	    
	    Negociando[playerid] = false;
	    Comprador[playerid] = false;
	    EmTeste[playerid] = false;
	    if(IsValidDynamicCP(CheckCarro[playerid]))
	    	DestroyDynamicCP(CheckCarro[playerid]);
	    if(IsValidDynamicCP(CheckMoto[playerid]))
		    DestroyDynamicCP(CheckMoto[playerid]);
	    if(IsValidDynamicCP(CheckAviao[playerid]))
		    DestroyDynamicCP(CheckAviao[playerid]);

	    VeiculoHab[playerid] = -1;
		VerBanimento(playerid);
		SetPlayerColor(playerid, Cinza);
		MostrarTelacarregamento(playerid);
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason){

    new Float: X, Float: Y, Float: Z;
    GetPlayerPos(playerid, X, Y, Z);

	PlayerInfo[playerid][DeathPos][0] = X;
	PlayerInfo[playerid][DeathPos][1] = Y;
	PlayerInfo[playerid][DeathPos][2] = Z;

	KillTimer(TimerPlayer[playerid][7]);
	PlayerInfo[playerid][MomentoFerido] = -1;
	SetPVarInt(playerid, "checking", 0);
	Hits[playerid] = 0;
	salvarAcessorios(playerid);
	ChecarAnexagem(playerid);
	DscEq[playerid] = false;

	if(GetPlayerCash(playerid) > 0){
		if(IsPlayerSpawned(playerid)){
			new Float: conta = (0.04) * float(GetPlayerCash(playerid)), Float:Pos[3];

			GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
			CriarItemDrop(Pos[0], Pos[1], Pos[2], DINHEIRO_FLUTUANTE, floatround(conta));
			GivePlayerCash(playerid, -floatround(conta));
			SendClientMessage(playerid, LIGHTBLUE, "Voce morreu e perdeu 4 por cento de seu dinheiro.");
		}
	}

	Morto[playerid] = true;
    DentroDeCasa[playerid] = -1;
    DentroDeGaragem[playerid] = -1;
    NaMao[playerid] = 0;

    FalharTeste(playerid);
    FalharDinamite(playerid);
    FalharNaMadeira(playerid);
    FalharCarregando(playerid);
    FalharNaPesca(playerid);

	PlayerInfo[playerid][Ferido] = true;
	PlayerInfo[playerid][MomentoFerido] = gettime();

    TogglePlayerSpectating(playerid, true);
    GameTextForPlayer(playerid, "~R~Voce acaba de morrer!~N~Aguarde alguns segundos para voltar.", 15000, 3);

    TimerPlayer[playerid][0] = SetTimerEx("voltaravida", 10000, false, "i", playerid);
    if(killerid != INVALID_PLAYER_ID){
		CallRemoteFunction("OnPlayerKillPlayer", "iii", playerid, killerid, reason);
	}
	return 1;
}
forward OnPlayerKillPlayer(playerid, killerid, arma);
public OnPlayerKillPlayer(playerid, killerid, arma)
{
	CheckContrato(playerid, killerid);
	SendDeathMessage(killerid, playerid, arma);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	DestruirTextDraws(playerid);
	print("teste1");
	if(IsValidActor(ActorPlayer[playerid])){
		DestroyActor(ActorPlayer[playerid]);
		ActorPlayer[playerid] = -1;
	}
   	print("teste2");
    SkinSelected[playerid] = 0;
    VeiculoEntrou[playerid] = 0;
	Hits[playerid] = 0;
	DscEq[playerid] = false;
	KillTimer(TimerPlayer[playerid][7]);
	KillTimer(TimerColherMC[playerid]);
	Morto[playerid] = false;
	CasaSpawn[playerid] = -1;
	if(CurandoAlguem[playerid] != -1){
		new id = CurandoAlguem[playerid];
		SendClientMessage(id, LIGHTBLUE, "* O Medico desconectou e voce nao foi reanimado.");
		SendoCurado[id] = false;
		CurandoAlguem[playerid] = -1;
	}
	if(GetPVarInt(playerid, "Freq") != 0){
		SetPVarInt(playerid, "Freq", 0);
	}
	KillTimer(TimerPMac[playerid]);
 	s_playerWarnings[playerid] = 0;
	ResetMileage(SpawnouEmprego[playerid]);
	PC_EmulateCommand(playerid, "/resetartaximetro");
	Atropelado[playerid] = false;
	SalvarAtendimento(playerid);
	KillTimer(TimerVelocimetro[playerid]);
	ComandoDado[playerid] = false;
    TogglePlayerSpectating(playerid, false);
    SetPlayerScore(playerid, 0);
    StopAudioStreamForPlayer(playerid);
	SetPlayerColor(playerid, Cinza);
	KillTimer(TimerLEITE[playerid]);
	KillTimer(TimerLogin[playerid]);
	VacaMarcada[playerid] = -1;
	LEITEs[playerid] = 0;
	TirandoLEITE[playerid] = false;
	Atendimento[playerid][PediuSenha] = false;
	if(Atendimento[playerid][OAtendido]){
		Atendimento[playerid][OAtendido] = false;
		new id = Atendimento[playerid][AtenId];
		Atendimento[id][EmAtendimento] = false;
		Atendimento[id][Nota] += 10.0;
		SendClientMessage(id, Rosa, "* O Jogador que voce estava atendendo quitou.");
		Atendimento[playerid][AtenId] = -1;
	}
	PC_EmulateCommand(playerid, "/finalizarat");
	if(PlayerInfo[playerid][Logado]){
		DeleteMiniavs(playerid);
		if(VeiculoInv[playerid] != -1){
			if(IsVehicleAttachedObjectSlotUsed(VeiculoInv[playerid], 2))
				RemoVehicleAttachedObject(VeiculoInv[playerid], 2);

			DestroyVehicleEx(VeiculoInv[playerid], "");
			VeiculoInv[playerid] = -1;
		}

		InEdit[playerid] = false;

		Arrastado[playerid] = false;
		Sequestrado[playerid] = false;
		salvarBanco(playerid);
		salvarAcessorios(playerid);
		FalharReparoCaixa(playerid);
		FalharPlantandocaixa(playerid);
	    FalharReabastecer(playerid);
	    SetPVarInt(playerid, "editandosabosta", 0);
		KillTimer(ChamarOSpawn[playerid]);
	    TrabalhoStaff[playerid] = false;
        EmTv[playerid] = false;
	    FalharDinamite(playerid);
	    FalharTeste(playerid);
	    FalharLigacao(playerid);
	    FalharNaMadeira(playerid);
	    FalharCarregando(playerid);
		SalvarHabilitacoes(playerid);
		VerificarEdicaoCaixa(playerid);
        SalvarMochila(playerid);
        FalharCarregandoCaminhao(playerid);
	    SalvarConta(playerid);
	    CheckBike(playerid);
		vNegociacao(playerid);
        VerEditing(playerid);
	    removertudo(playerid);
	    CheckVehEmp(playerid);
	    FalharNaPesca(playerid);
	    for(new i; i<MAXCONCE; i++){
			SalvarCarro(playerid, i);
		}

		PlayerInfo[playerid][Logado] = false;
	}
	for(new yR; yR< 8; yR++){
		if(IsValidTimer(TimerPlayer[playerid][yR]))
			KillTimer(TimerPlayer[playerid][yR]);
	}
	
	new Reset[PlayerData];
	PlayerInfo[playerid] = Reset;
	
	ResetPlayerCash(playerid);
	
	return 1;
}
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid){
	Congelar(playerid, 2);
	return 1;
}
public OnPlayerSpawn(playerid)
{
	if(!PlayerInfo[playerid][Logado]) return Kick(playerid);
	showGzs(playerid);
	
	Congelar(playerid, 2);
	
	Pagina[playerid] = 1;
	
	if(PlayerInfo[playerid][Genero] == 0) ShowPlayerDialog(playerid, DIALOG_GENERO, DIALOG_STYLE_LIST, "{33ccff}Escolha Seu Genero!", "{33ccff}Masculino\n{fff000}Feminino", "Ok", "Sair");
	if(PlayerInfo[playerid][Skin] == 0){
		
		StartPlayerSkin(playerid);
		interpolarSkin(playerid);
	}
	else{
		
		if(!PlayerInfo[playerid][Logado]) return Kick(playerid);
		AtualizarNavbar(playerid);

		if(MochilaTDAberta[playerid])
			EsconderInventario(playerid);

	
		MochilaTDAberta[playerid] = false;
		TaserAtivado[playerid] = false;
		Sequestrado[playerid] = false;
		Arrastado[playerid] = false;
		Algemado[playerid] = false;
		Nopm[playerid] = -1;
		////printf("genero spawn %d", PlayerInfo[playerid][Genero]);
		if(Nopm[playerid] != -1 || NoSaco[playerid]) PlayerTextDrawHide(playerid, telapreta[playerid][0]);
		if(Morto[playerid]){
			PlayerInfo[playerid][Ferido] = false;
			Morto[playerid] = false;
		}
	
		ComponentesQuimicos[playerid] = 0;
		CancelSelectTextDraw(playerid);
	
		TogglePlayerControllableEx(playerid, false);
		
		RemovePlayerAttachedObjectEx(playerid, 7);

		TempoEquipar[playerid] = gettime() - 30;
		Hits[playerid] = 0;
		PlayerTextDrawHide(playerid, telapreta[playerid][0]);
		StopAudioStreamForPlayer(playerid);
	
		FalharReabastecer(playerid);
		
		Arrastado[playerid] = false;
		Sequestrado[playerid] = false;
		FalharDinamite(playerid);
		DentroDeCasa[playerid] = -1;
		DentroDeGaragem[playerid] = -1;
	
		FalharReparoCaixa(playerid);

		FalharPlantandocaixa(playerid);
	
		TrabalhoStaff[playerid] = false;
		SetPlayerColor(playerid, -1);
		
		FalharNaPesca(playerid);

		FalharNaMadeira(playerid);

		FalharCarregando(playerid);
	
		FalharCarregandoCaminhao(playerid);

		NaMao[playerid] = 0;

	    CheckVip(playerid);
	    
	    CheckOTeste(playerid);
	
	    TempoComando[playerid] = gettime() - 120;
	    TempoComandoReparo[playerid] = gettime() - 120;
	    TempoComandoAbastecer[playerid] = gettime() - 120;
	  
	    if(novato[playerid]){
			new r = random(sizeof spawnaleatorio);
			SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin],spawnaleatorio[r][0],spawnaleatorio[r][1],spawnaleatorio[r][2], 0);
			SetPlayerPos(playerid, spawnaleatorio[r][0],spawnaleatorio[r][1],spawnaleatorio[r][2]); // meu deus como o samp é ruim 
		}
	
		/*switch(EstiloSpawn[playerid]){
			case SPAWN_CIVIL:{
		   	 	SetPlayerPosEx(playerid, 3585.6218,524.0502,1519.5316);
				SetPlayerFacingAngle(playerid, 360.0);
				SetCameraBehindPlayer(playerid);
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
			}
			case SPAWN_CASA:{
				if(CasaSpawn[playerid] != -1){
					new i = CasaSpawn[playerid];
					if(!strcmp(InfoCasa[i][Dono], nome(playerid) ) || AlugouCasa(playerid, CasaSpawn[playerid])){
						SetPlayerPos(playerid, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]);
					}
					else{
						CasaSpawn[playerid] = -1;
						EstiloSpawn[playerid] = SPAWN_CIVIL;
						SendClientMessage(playerid, LIGHTBLUE, "* A Casa selecionada nao era mais sua.");
						SpawnPlayer(playerid);
					}
				}
			}
			case SPAWN_ORG:{
				if(PlayerInfo[playerid][Org] == 0){
					EstiloSpawn[playerid] = SPAWN_CIVIL;
					SendClientMessage(playerid, LIGHTBLUE, "* Voce estava sem Spawn e foi redirecionado para o Spawn Civil.");
					SpawnPlayer(playerid);
				}
				else{
			 		TogglePlayerControllableEx(playerid, false);
			  		SetPlayerPosEx(playerid, OrgInfo[PlayerInfo[playerid][Org]][OrgSpawn][0], OrgInfo[PlayerInfo[playerid][Org]][OrgSpawn][1], OrgInfo[PlayerInfo[playerid][Org]][OrgSpawn][2]);
			   		SetPlayerFacingAngle(playerid, OrgInfo[PlayerInfo[playerid][Org]][OrgSpawn][3]);
			   		SetPlayerVirtualWorld(playerid, OrgInfo[PlayerInfo[playerid][Org]][OrgVw]);
			   		SetPlayerInterior(playerid, OrgInfo[PlayerInfo[playerid][Org]][OrgInterior]);
			  		SetCameraBehindPlayer(playerid);
			  	 	SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
			 	 	SetTimerEx("descongelarorg", 6000, false, "i", playerid);
				}
			}
			case SPAWN_ULTIMAPOS:{
				SetPlayerPos(playerid, PlayerInfo[playerid][Px], PlayerInfo[playerid][Py], PlayerInfo[playerid][Pz]);
				SetPlayerInterior(playerid, PlayerInfo[playerid][InteriorPlayer]);
				SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][VirtualWorld]);
				ApllyAnim(playerid, "PED", "KO_SKID_BACK", 4.1, 0, 0, 0, 1, 0, SYNC_ALL);
				SetTimerEx("animacao", 2000, false, "i", playerid);
			}
		}*/
		if(PlayerInfo[playerid][Ferido]){
			VerFerimento(playerid);
		}
		else{
			if(CheckPosInvalida(playerid)){

			}
			else{
		
				SetPlayerPos(playerid, PlayerInfo[playerid][Px], PlayerInfo[playerid][Py], PlayerInfo[playerid][Pz]);
	
				Streamer_Update(playerid);
				
				SetPlayerInterior(playerid, PlayerInfo[playerid][InteriorPlayer]);
				SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][VirtualWorld]);
				
				ApllyAnim(playerid, "PED", "KO_SKID_BACK", 4.1, 0, 0, 0, 1, 0, SYNC_ALL);
		
				SetTimerEx("animacao", 2000, false, "i", playerid);	
		
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);		
			}
		}
		SetTimerEx("descongelar", 6000, false, "i", playerid);
	
		for(new i; i <MAX_PLAYER_ATTACHED_OBJECTS; i++){
			carregarAcessorios(playerid, i);
		}
	
		CheckArmaPeito(playerid);
	
	}
	return 1;
}
public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
	if(!PlayerInfo[playerid][Logado] || GetPlayerState(playerid) == PLAYER_STATE:6) return 0;
	if(result == -1) return SendClientMessage(playerid, -1, "{c0c0c0}Este comando nao existe! Use /ajuda OU /relatorio.");//, nome(playerid));
	return 1;
}
public OnPlayerText(playerid, text[])
{
	//f("OnPlayerText");
	if(!PlayerInfo[playerid][Logado]) return 0;
	
	new stringOPT[256];
	text[0] = toupper(text[0]);
	//if(!IsPlayerInAnyVehicle(playerid) && !PlayerInfo[playerid][Ferido]) ApplyAnimationEx(playerid,"PED","IDLE_CHAT",   4.1, 0, 1, 1, 1, 1, SYNC_ALL);
	if(PlayerInfo[playerid][Ferido]){
		format(stringOPT, sizeof stringOPT, "%s esta gemendo no chao!", nome(playerid));
		MensagemLocal(25.0, playerid, Roxoeu, stringOPT, false);
		return 0;
	}
	else if(EmChamada[playerid]){
		format(stringOPT, sizeof stringOPT, "[Ligacao](%d)%s diz: %s.", playerid, nome(playerid), text);
	    SendClientMessage(playerid, Amarelo, stringOPT);
	    format(stringOPT, sizeof stringOPT, "[Ligacao](%d)%s diz: %s.", playerid, nome(playerid), text);
	    SendClientMessage(Discando[playerid], Amarelo, stringOPT);
	}
	else if(Atendimento[playerid][EmAtendimento] || Atendimento[playerid][OAtendido]){
		format(stringOPT, sizeof stringOPT, "(%d)%s -> %s", playerid, nome(playerid), text);
		SendClientMessage(Atendimento[playerid][AtenId], Rosa, stringOPT);
		SendClientMessage(playerid, Rosa, stringOPT);
	}
	else{
		if(PlayerInfo[playerid][Org] != 0){
		    if(TrabalhoStaff[playerid]){
				
				format(stringOPT, sizeof(stringOPT), "[%d]%s diz: %s", playerid, nome(playerid), text);
	        	MensagemLocal(25.0, playerid, ColorStaff(PlayerInfo[playerid][Admin]), stringOPT, false);
			}
			else{
			    if(PlayerInfo[playerid][Vip] > 0){
			    	new vip = PlayerInfo[playerid][Vip];
			    	/*
						{"{7f7679}Platina", 12},
						{"{a6e0ed}Diamante", 15},
						{"{e0115f}Ruby", 25}
			    	*/

					if(vip == 1)	
						format(stringOPT, sizeof(stringOPT), "{e0115f}[VIP %s][%d]%s diz: %s.", Infosvip[PlayerInfo[playerid][Vip]][NomeVip], PlayerInfo[playerid][IDFixo], nome(playerid), text);
	
					if(vip == 2)	
						format(stringOPT, sizeof(stringOPT), "{a6e0ed}[VIP %s][%d]%s diz: %s.", Infosvip[PlayerInfo[playerid][Vip]][NomeVip], PlayerInfo[playerid][IDFixo], nome(playerid), text);
					
					if(vip == 3)	
						format(stringOPT, sizeof(stringOPT), "{e0115f}[MAGNATA %s][%d]%s diz: %s.", Infosvip[PlayerInfo[playerid][Vip]][NomeVip], PlayerInfo[playerid][IDFixo], nome(playerid),text);					
					
					MensagemLocal(25.0, playerid, -1, stringOPT, false);
				}
				else{
					format(stringOPT, sizeof(stringOPT), "[%s][%d] diz: %s.", OrgGm[PlayerInfo[playerid][Org]][OrgNome], PlayerInfo[playerid][IDFixo], text);					
					MensagemLocal(25.0, playerid, -1, stringOPT, false);					
				}
			}
		}
		else{
		    if(TrabalhoStaff[playerid]){
				format(stringOPT, sizeof(stringOPT), "[%d]%s diz: %s.", playerid, nome(playerid), text);
	        	MensagemLocal(25.0, playerid, ColorStaff(PlayerInfo[playerid][Admin]), stringOPT, false);
			}
			else{
			    if(PlayerInfo[playerid][Vip] > 0){
			    	new vip = PlayerInfo[playerid][Vip];
			    	/*
						{"{7f7679}Platina", 12},
						{"{a6e0ed}Diamante", 15},
						{"{e0115f}Ruby", 25}
			    	*/

					if(vip == 1)	
						format(stringOPT, sizeof(stringOPT), "{e0115f}[VIP %s][%d] diz: %s.", Infosvip[PlayerInfo[playerid][Vip]][NomeVip], PlayerInfo[playerid][IDFixo], text);
	
					if(vip == 2)	
						format(stringOPT, sizeof(stringOPT), "{a6e0ed}[VIP %s][%d] diz: %s.", Infosvip[PlayerInfo[playerid][Vip]][NomeVip], PlayerInfo[playerid][IDFixo], text);
					
					if(vip == 3)	
						format(stringOPT, sizeof(stringOPT), "{e0115f}[MAGNATA %s][%d] diz: %s.", Infosvip[PlayerInfo[playerid][Vip]][NomeVip], PlayerInfo[playerid][IDFixo], text);					
					
					MensagemLocal(25.0, playerid, -1, stringOPT, false);
				}
				else{
					format(stringOPT, sizeof(stringOPT), "[%d]%s diz: %s.",PlayerInfo[playerid][IDFixo], nome(playerid), text);
					MensagemLocal(25.0, playerid, -1, stringOPT, false);
				}
			}
		}
	}
	return 0;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid){
		case DIALOG_CONFIRMAR_ALUGUEL:{
			if(response){
				IniciarCAluguel(playerid, OPCAO_CONCLUIR);
				SendClientMessage(playerid, LIGHTBLUE, "Aluguel de veiculo realizado.");
			}
			else{
				ShowPlayerDialog(playerid, DIALOG_ALUGAR_CARRO, DIALOG_STYLE_INPUT, "{33ccff}# Aluguel de Veiculo", "{fff000}Digite em HORAS por quanto tempo você quer alugar este veiculo: ", "Alugar", "Retornar");
			}
		}
		case DIALOG_ALUGAR_CARRO:{
			if(response){
				if(!Number(inputtext) || strval(inputtext) < 1) return SendClientMessage(playerid, LIGHTRED, "Voce digitou um horario invalido.");
				IniciarCAluguel(playerid, OPCAO_INICIAR, strval(inputtext));
				ShowPlayerDialog(playerid, DIALOG_CONFIRMAR_ALUGUEL, DIALOG_STYLE_MSGBOX, "{33ccff} # Confirmacao de Aluguel", "{fff000}Tem certeza de que deseja alugar este veiculo por %d horas? isso vai lhe custar {008000}%dR$.", "Sim", "Nao",
					strval(inputtext), GetValorCAluguel(GetVehicleModel(GetPlayerVehicleID(playerid))) * strval(inputtext));
			}
			else
				RemovePlayerFromVehicle(playerid);
			
		}
		case DIALOG_ESCOLHER_OPCAO:{
			if(response){
				if(PlayerInfo[playerid][Mochila] != 1) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao possui mochila.");
				switch(listitem){
					case 0:{
						EsconderInventario(playerid);
						MinhaOpcao[playerid] = 1;
						AbrirMochilaDialog(playerid);
					}
					case 1:{
						MinhaOpcao[playerid] = 2;
						//if(PlayerInfo[playerid][Admin] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este sistema ainda esta sendo desenvolvido!");
						MochilaTDAberta[playerid] = true;
						MostrarMochila(playerid);
					}
				}
			}
		}
		case DIALOG_TIPOSCONCE:{
			if(response){
				switch(listitem){
					case 0:MostrarConceTipo(playerid, 1);
					case 1:MostrarConceTipo(playerid, 21);
					case 2:MostrarConceTipo(playerid, 13);
					case 3:MostrarConceTipo(playerid, 29);
				}
			}
		}
		case DIALOG_SENHA:{
			if(response){
				SetPVarString(playerid, "SenhaPlayer", inputtext);
				PlayerTextDrawSetString(playerid, LoginDraw[playerid][7], "OK!");
				PlayerTextDrawShow(playerid, LoginDraw[playerid][7]);
			}
		}
		case DIALOG_TROCARNOMEEMPRESA:{
			if(response){
				new empresa = GetPVarInt(playerid, "SuaEmpresa");
				if(strlen(inputtext) < 1 || strlen(inputtext) > 25){
					PC_EmulateCommand(playerid, "/menuempresa");
					SendClientMessage(playerid, LIGHTBLUE, "Nome invalido!");
					return 1;
				}
				if(!strcmp(nome(playerid), InfoEmpresa[empresa][EmpresaDono])){
					format(InfoEmpresa[empresa][EmpresaNome], 32, inputtext);
					AtualizarTextEmpresa(empresa);
					SendClientMessage(playerid, LIGHTBLUE, fString("Novo nome da empresa: %s", inputtext));
					PC_EmulateCommand(playerid, "/menuempresa");
					SalvarEmpresa(empresa);
				}
			}
			else
				PC_EmulateCommand(playerid, "/menuempresa");
		}
		case DIALOG_CONFIMARVENDAEMRPESA:{
			if(response){
				new empresa = GetPVarInt(playerid, "SuaEmpresa");
				if(!strcmp(nome(playerid), InfoEmpresa[empresa][EmpresaDono])){
					new Float: conta = (0.3) * float(InfoEmpresa[empresa][EmpresaValor]);
					GivePlayerCash(playerid, floatround(conta));
					SendClientMessage(playerid, LIGHTBLUE, fString("Voce acaba de vender sua empresa e ganhou %dR$ em cima dela.", floatround(conta)));
					ResetarEmpresa(empresa);		
				}
				else
					SendClientMessage(playerid, LIGHTBLUE, "Voce nao e o dono da empresa.");
			}
			else
				PC_EmulateCommand(playerid, "/menuempresa");
		}
		case DIALOG_QUANTIACOMPRAR:{
			if(response){

			}
		}
		case DIALOG_OPCOES_EMPRESA:{

			if(response){
				switch(listitem){
					case 0:{
						ShowPlayerDialog(playerid, DIALOG_TROCARNOMEEMPRESA, DIALOG_STYLE_INPUT, 
						"{33ccff}Troque o nome", "{fff000}Digite a seguir o nome da nova empresa!\n{ff0000}Limite de 25 caracteres.", "Ok", "Sair");
					}
					case 1:{
						new empresa = GetPVarInt(playerid, "SuaEmpresa");
						if(!strcmp(nome(playerid), InfoEmpresa[empresa][EmpresaDono])){
							if(InfoEmpresa[empresa][EmpresaLucro] < 1) return SendClientMessage(playerid, LIGHTBLUE, "A Empresa nao possui dinheiro.");
							GivePlayerCash(playerid, InfoEmpresa[empresa][EmpresaLucro]);
							SendClientMessage(playerid, VerdeSamp, fString("Voce sacou %dR$ do cofre da empresa.", InfoEmpresa[empresa][EmpresaLucro]));
							InfoEmpresa[empresa][EmpresaLucro] = 0;
							SalvarEmpresa(empresa);
							PC_EmulateCommand(playerid, "/menuempresa");
						}
						else
							SendClientMessage(playerid, LIGHTBLUE, "Voce nao e o dono da empresa.");
						
					}
					case 2:{
						new empresa = GetPVarInt(playerid, "SuaEmpresa");
						if(GetPlayerCash(playerid) < 60000) return SendClientMessage(playerid, LIGHTBLUE, "Voce precisa de 60.000R$ para aumentar os ganhos da sua empresa.");
						if (InfoEmpresa[empresa][Ganhos] >= GetLimiteGanhos(PlayerInfo[playerid][Vip])){
						    if (PlayerInfo[playerid][Vip] < 3) 
						        SendClientMessage(playerid, LIGHTBLUE, "O máximo de ganhos desta empresa foi atingido. Compre VIP para aumentar.");
						    
						    else
						        SendClientMessage(playerid, LIGHTBLUE, "O máximo de ganhos desta empresa foi atingido.");
						    
						}

						if(!strcmp(nome(playerid), InfoEmpresa[empresa][EmpresaDono])){
							GivePlayerCash(playerid, -90000);
							new Float: continha = (0.12 * InfoEmpresa[empresa][Ganhos]);
							InfoEmpresa[empresa][Ganhos] += floatround(continha);
							InfoEmpresa[empresa][EmpresaValor] += 25000;
							SendClientMessage(playerid, LIGHTBLUE, "Voce aumentou a porcentagem de ganhos da sua empresa em 12 por cento.");
							SendClientMessageToAll(LIGHTBLUE, "* A Empresa %s acaba de ter uma valorizacao de 25.000R$.", InfoEmpresa[empresa][EmpresaNome]);
							SalvarEmpresa(empresa);
							AtualizarTextEmpresa(empresa);

							return 1;
						}
						else
							SendClientMessage(playerid, LIGHTBLUE, "Voce nao e o dono desta empresa.");
					}
					case 3:{
						ShowPlayerDialog(playerid, DIALOG_ACHAR_NEGOEmpresa, DIALOG_STYLE_INPUT, "Jogadores", "Digite o id do jogador que deseja oferecer a empresa", "Ok", "Voltar");
					}
					case 4:{
						ShowPlayerDialog(playerid, DIALOG_CONFIMARVENDAEMRPESA, DIALOG_STYLE_MSGBOX, "{ff0000}AVISO", "{ff0000}Gostaria mesmo de vender sua empresa? esta acao e irreversivel.", "Sim", "Nao...");
					}
					default: SendClientMessage(playerid, LIGHTBLUE, "Ainda em desenvolvimento.");
				}
			}
		}
		case DIALOG_ACHAR_NEGOEmpresa:{
			if(!response) return PC_EmulateCommand(playerid, "/menuempresa");
			if(response){
				new slot = -1;
				foreach(new i: Player){
					new Float: X, Float: Y, Float: Z;
					GetPlayerPos(i, X, Y, Z);
					if(ISP(i, 9.0, X, Y, Z) && i != playerid && PlayerInfo[i][IDFixo] == strval(inputtext)){		
						slot = i;
						break;
					}
				}
				if(slot == -1 || !Number(inputtext) || strval(inputtext) == PlayerInfo[playerid][IDFixo]){
					SendClientMessage(playerid, LIGHTBLUE, "Nao encontrado.");
					PC_EmulateCommand(playerid, "/menuempresa");
				}
				else{
					SetPVarInt(playerid, "USERTransEmpresa", slot);
					new jogador = GetPVarInt(playerid, "USERTransEmpresa");
					new str[144];
					format(str, sizeof str, "Tem certeza de que quer passar a posse da empresa para %d(%s)?", PlayerInfo[jogador][IDFixo], nome(jogador));
					ShowPlayerDialog(playerid, DIALOG_PASSAR_EMPRESA, DIALOG_STYLE_MSGBOX, "{33ccff}Passar Empresa", str, "Sim", "Nao");
				}
			}
		}
		case DIALOG_PASSAR_EMPRESA:{
			if(response){
				new usuario = GetPVarInt(playerid, "USERTransEmpresa"), empresa = GetPVarInt(playerid, "SuaEmpresa");
				new Float: X, Float: Y, Float: Z;
				GetPlayerPos(usuario, X, Y, Z);
				if(!ISP(playerid, 9.0, X, Y, Z) || !IsPlayerConnectedP(usuario)){
					SendClientMessage(playerid, LIGHTBLUE, "Este jogador ficou offline ou esta muito longe de voce.");
					PC_EmulateCommand(playerid, "/menuempresa");
				}
				else{
					format(InfoEmpresa[empresa][EmpresaDono], 24, nome(usuario));
					SendClientMessage(playerid, VerdeSamp, fString("Voce passou a posse da empresa para %s.", nome(usuario)));
					SendClientMessage(usuario, VerdeSamp, fString("A posse da empresa %s de %s foi passada para voce.", InfoEmpresa[empresa][EmpresaNome], nome(playerid)));
					AtualizarTextEmpresa(empresa);
					SendClientMessage(usuario, LIGHTBLUE, "Voce acaba de adquirir uma nova empresa.");
				}
			}
			else{
				PC_EmulateCommand(playerid, "/menuempresa");
			}
		}
		case DIALOG_COMPRAR_EMPRESA:{
			if(response){
				new empresa = GetPVarInt(playerid, "Empresaselect");
				if(!InfoEmpresa[empresa][EmpresaCriada]){
					SetPVarInt(playerid, "Empresaselect", -1);
					SendClientMessage(playerid, LIGHTBLUE, "Esta empresa nao existe mais.");
					return 1;
				}
				if(InfoEmpresa[empresa][EmpresaComprada]){
					SetPVarInt(playerid, "Empresaselect", -1);
					SendClientMessage(playerid, LIGHTBLUE, "Alguem ja comprou esta empresa.");
					return 1;
				}
				else if(GetPlayerCash(playerid) < InfoEmpresa[empresa][EmpresaValor]){
					SetPVarInt(playerid, "Empresaselect", -1);
					SendClientMessage(playerid, LIGHTBLUE, "Voce nao possui dinheiro suficiente.");
					return 1;
				}
				else{
					InfoEmpresa[empresa][EmpresaComprada] = true;
					format(InfoEmpresa[empresa][EmpresaDono], 24, nome(playerid));
					GivePlayerCash(playerid, -InfoEmpresa[empresa][EmpresaValor]);
					SendClientMessage(playerid, LIGHTBLUE, fString("Voce comprou a empresa %s", InfoEmpresa[empresa][EmpresaNome]));
					AtualizarTextEmpresa(empresa);	
				}
			}
		}
		case DIALOG_KICK: Kick(playerid);
		case DIALOG_CRIARCONTABANCO:{
			if(response){
				if(PossuiContaBanco(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "Voce ja possui conta no banco!");
				CriarContaBanco(playerid);

			}
			else
				SendClientMessage(playerid, LIGHTBLUE, "Voce cancelou a criacao da conta.");
		}
		case DIALOG_ENCHER_CAMION:{
			if(response){
				new posto = listitem + 1;
				Abastecendo[playerid] = true;
				SetPVarInt(playerid, "OPostoA", posto);
				TogglePlayerControllableEx(playerid, false);
				SetTimerEx("colocargas", 7000, false, "iis", SpawnouEmprego[playerid], playerid, nome(playerid));
				GameTextForPlayer(playerid, "~B~Enchendo Caminhao...", 5800, 3);
			}
		}
		case DIALOG_COMIDAS:{
			if(response){
				if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Sua mochila esta cheia!");
				switch(listitem){
					case 0:{
						if(GetPlayerCash(playerid) < 30) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -30);
						AdicionarItem(playerid, PIZZA, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Lanchonete > Voce comprou uma PIZZA!");
					}
					case 1:{
						if(GetPlayerCash(playerid) < 15) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -15);
						AdicionarItem(playerid, HAMBURGUER, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Lanchonete > Voce comprou um HAMBURGUER!");
						
					}
					case 2:{
						if(GetPlayerCash(playerid) < 5) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -5);
						AdicionarItem(playerid, COXINHA, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Lanchonete > Voce comprou uma COXINHA!");
					}
					case 3:{
						if(GetPlayerCash(playerid) < 18) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -18);
						AdicionarItem(playerid, PRATO_FEITO, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Lanchonete > Voce comprou um Prato-Feito!");
					}
					case 4:{
						if(GetPlayerCash(playerid) < 15) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -15);
						AdicionarItem(playerid, FEIJOADA, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Lanchonete > Voce comprou uma FEIJOADA!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 15);
					}
					case 5:{
						if(GetPlayerCash(playerid) < 6) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -6);
						AdicionarItem(playerid, BAURU, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Lanchonete > Voce comprou um BAURU!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 6);
					}
				}
			}
		}
		case DIALOG_BEBIDAS:{
			if(response){
				switch(listitem){
					case 0:{
						if(GetPlayerCash(playerid) < 6) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -6);
						AdicionarItem(playerid, COCA_COLA, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Bar > Voce comprou uma Coca-Cola!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 6);
					}
					case 1:{
						if(GetPlayerCash(playerid) < 6) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -6);
						AdicionarItem(playerid, PEPSI, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Bar > Voce comprou uma PEPSI!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 6);
					}
					case 2:{
						if(GetPlayerCash(playerid) < 4) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -4);
						AdicionarItem(playerid, SUCO_LARANJA, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Bar > Voce comprou um Suco De Laranja!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 4);
					}
					case 3:{
						if(GetPlayerCash(playerid) < 4) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -4);
						AdicionarItem(playerid, SUCO_MARACUJA, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Bar > Voce comprou um Suco De Maracuja!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 4);
					}
					case 4:{
						if(GetPlayerCash(playerid) < 9) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -9);
						AdicionarItem(playerid, AGUA, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Bar > Voce comprou uma Agua!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 9);
					}
					case 5:{
						if(GetPlayerCash(playerid) < 12) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -12);
						AdicionarItem(playerid, CERVEJA, 1);
						SendClientMessage(playerid, LIGHTBLUE, "Bar > Voce comprou uma Cerveja!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 12);
					}
				}
			}
		}
		case DIALOG_VENDER_COUROS:{
			if(response){
				if(Couros[playerid] == 0) return 1;
				PlayerInfo[playerid][DinheiroPD] += Couros[playerid] * 290;
				GameTextForPlayer(playerid, "~B~Pay Day aumentado!", 2000, 3);
				new str[90];
				format(str, sizeof str, "Voce vendeu %d Couros por %dR$", Couros[playerid], Couros[playerid] * 290);
				SendClientMessage(playerid, COR_COPOM, str);
				Couros[playerid] = 0;
				GameTextForPlayer(playerid, "~B~PayDay aumentado!", 3000, 3);
			}
		}
		case DIALOG_GENERO_LOGIN:{
			if(response || !response){
				PlayerInfo[playerid][Genero] = listitem+1;
				SendClientMessage(playerid, VerdeSamp, "Voce escolheu o genero %s.", (listitem + 1) == 1 ? ("Masculino") : ("Feminino"));
				TogglePlayerSpectating(playerid,false);
				SpawnPlayer(playerid);
				PlayerInfo[playerid][Skin] = listitem+1;
				CallMiniAviso(playerid, TUTORIAL_PARTE_UM, "Seja bem vindo ao Zona Oeste!");
				novato[playerid] = true;
			}
		}
		case DIALOG_GENERO:{
			if(response){
				if(listitem == 0){	
					PlayerInfo[playerid][Genero] = MASCULINO;
					SendClientMessage(playerid, VerdeSamp, "Voce escolheu o genero Masculino.");
					SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				}
				if(listitem == 1){
					PlayerInfo[playerid][Genero] = FEMININO;
					SendClientMessage(playerid, VerdeSamp, "Voce escolheu o genero Feminino.");
					SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				}
			}
			else{
				PlayerInfo[playerid][Skin] = SKIN_MASCULINO;
				PlayerInfo[playerid][Genero] = MASCULINO;
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
			}
		}
		case DIALOG_APREENDER:{
			if(!response){
				new str[10], achada = -1;
				GetPVarString(playerid, "ConsulPL", str, 10);
				foreach(new i: Player){
					for(new j; j < MAXCONCE; j++){	
						if(!strcmp(VehInfo[i][j][Placa], str) && !isnull(VehInfo[i][j][Placa])){
							new conta = 2*floatround(ModelFromIpva(VehInfo[i][j][IDCarro]));
							if(VehInfo[i][j][Apreendido]) return SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo ja esta Apreendido.");
							new Float: x, Float: y, Float: z;
							GetVehiclePos(VehInfo[i][j][Carro], x, y, z);
							if(!ISP(playerid, 20.0, x, y, z)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar ate 20 metros do veiculo.");
							if(VehInfo[i][j][IPVA] >= conta){
								VehInfo[i][j][Apreendido] = true;
								new str2[90];
								format(str2, sizeof str2, "%s apreendeu seu veiculo com %dR$ De IPVA!", nome(playerid), VehInfo[i][j][IPVA]);
								SendClientMessage(i, LIGHTBLUE, str2);								
								DestroyVehicleEx(VehInfo[i][j][Carro], "Apreencao De Veiculo");
								achada = i;
								SendClientMessage(playerid, LIGHTBLUE, "* Voce apreendeu este veiculo com sucesso.");
								break;
							}
							else{
								SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo possui muito pouco IPVA para ser pago para ser Apreendido.");
								break;
							}
						}
					}
				}
				if(achada == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Esta placa nao foi achada na cidade ( Dono off possivelmente)");
			}
		}
		case DIALOG_TITULOS:{
			if(response){
				switch(listitem){
					case 0:{
						format(PlayerInfo[playerid][Titulo], 32, "");
						PC_EmulateCommand(playerid, "/titulos");
						SendClientMessage(playerid, LIGHTBLUE, "* Voce tirou o seu titulo.");
					}
					case 1:{
						if(PlayerInfo[playerid][Emprego] != 0){
							format(PlayerInfo[playerid][Titulo], 32, "%s", EmpName(playerid));
							SendClientMessage(playerid, VerdeSamp, "SUCESSO! Voce alterou seu titulo para o nome do Emprego.");
							PC_EmulateCommand(playerid, "/titulos");
						}
						else{
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Emprego.");
							PC_EmulateCommand(playerid, "/titulos");
						}
					}
					case 2:{
						if(PlayerInfo[playerid][Admin] != 0){
							format(PlayerInfo[playerid][Titulo], 32, "%s", StaffCargo(PlayerInfo[playerid][Admin]));
							SendClientMessage(playerid, VerdeSamp, "SUCESSO! Voce alterou seu titulo para Admin.");
							PC_EmulateCommand(playerid, "/titulos");							
						}
						else{
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e admin.");
							PC_EmulateCommand(playerid, "/titulos");
						}
					}
					case 3:{
						if(PlayerInfo[playerid][Vip] != 0){
							format(PlayerInfo[playerid][Titulo], 32, "%s", Infosvip[PlayerInfo[playerid][Vip]][NomeVip]);
							SendClientMessage(playerid, VerdeSamp, "SUCESSO! Voce alterou seu titulo para VIP.");
							PC_EmulateCommand(playerid, "/titulos");							
						}
						else{
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e VIP.");
							PC_EmulateCommand(playerid, "/titulos");
						}
					}
					case 4:{
						if(GetPlayerCash(playerid) >= 1000000 || BancoInfo[playerid][Dinheiro] >= 1000000 || (PlayerInfo[playerid][Vip] + GetPlayerCash(playerid)) >= 1000000){
							format(PlayerInfo[playerid][Titulo], 32, "{fff000}Milionario");// Infosvip[PlayerInfo[playerid][Vip]][NomeVip]);
							SendClientMessage(playerid, VerdeSamp, "SUCESSO! Voce alterou seu titulo para Milionario.");
							PC_EmulateCommand(playerid, "/titulos");							
						}
						else{
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e Milionario.");
							PC_EmulateCommand(playerid, "/titulos");
						}
					}
					case 5:{
						if(PlayerInfo[playerid][Cash] >= 5){
							if(isnull(PlayerInfo[playerid][TituloPersonalizado]))
								ShowPlayerDialog(playerid, DIALOG_TITULOPERSONALIZADO, DIALOG_STYLE_INPUT, "{fff000}Editando Seu Titulo", "{33ccff}Digite abaixo o Titulo Personalizado que voce deseja.\nMaximo de 90 caracteres.", "Ok", "Sair");						
							else
								ShowPlayerDialog(playerid, DIALOG_TITULOPERSONALIZADOE, DIALOG_STYLE_INPUT, "{fff000}Editando Seu Titulo", "{33ccff}Digite abaixo para editar o seu Titulo Personalizado.\nMaximo de 90 caracteres.", "Ok", "Sair");						
						}
						else{
							if(!isnull(PlayerInfo[playerid][TituloPersonalizado])){
								ShowPlayerDialog(playerid, DIALOG_TITULOPERSONALIZADOE, DIALOG_STYLE_INPUT, "{fff000}Editando Seu Titulo", "{33ccff}Digite abaixo para editar o seu Titulo Personalizado.\nMaximo de 90 caracteres.", "Ok", "Sair");						
							}
							else{
								SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Coins para editar um titulo personalizado.");
								PC_EmulateCommand(playerid, "/titulos");
							}
						}
					}
				}
			}
		}
		case DIALOG_TITULOPERSONALIZADOE:{
			if(response){
				if(strlen(inputtext) > 90 || !strlen(inputtext)){
					PC_EmulateCommand(playerid, "/titulos");
					SendClientMessage(playerid, LIGHTBLUE, "* Este titulo e muito grande ou nao tem tamanho.");
				}
				else{
					format(PlayerInfo[playerid][TituloPersonalizado], 90, "%s", inputtext);
					SendClientMessage(playerid, LIGHTBLUE, "* Sucesso! Voce editou seu Titulo.");
					new str[144];
					format(str, sizeof str, "%s editou seu titulo personalizado.", nome(playerid));
					SendClientMessageToAll(VerdeSamp, str);
					PC_EmulateCommand(playerid, "/titulos");
					SalvarConta(playerid);
				}
			}
		}
		case DIALOG_TITULOPERSONALIZADO:{
			if(response){
				if(strlen(inputtext) > 90 || !strlen(inputtext) || PlayerInfo[playerid][Cash] < 5){
					PC_EmulateCommand(playerid, "/titulos");
					SendClientMessage(playerid, LIGHTBLUE, "* Este titulo e muito grande, nao tem tamanho ou voce nao possui Coins suficientes.");
				}
				else{
					PlayerInfo[playerid][Cash] -= 5;
					format(PlayerInfo[playerid][TituloPersonalizado], 90, "%s", inputtext);
					SendClientMessage(playerid, LIGHTBLUE, "* Sucesso! Voce editou seu Titulo.");
					new str[144];
					format(str, sizeof str, "%s editou seu titulo personalizado.", nome(playerid));
					SendClientMessageToAll(VerdeSamp, str);
					PC_EmulateCommand(playerid, "/titulos");
					SalvarConta(playerid);
				}
			}
		}
		case DIALOG_SETAR_DINHEIRO:{
			new usuario[24];
			GetPVarString(playerid, "Configurado", usuario, 24);
			if(!response) return PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
			if(response){
				new valor = strval(inputtext);
				if(!Number(inputtext) || valor < 0){
					PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
					
					SendClientMessage(playerid, LIGHTBLUE, "* Este valor e invalido.");
				}
				else{
					new achou = -1;
					foreach(new i: Player){
						if(!strcmp(nome(i), usuario)){
							achou = i;
							break;
						}
					}
					if(achou == -1){
						new Query[128], Cache: cache; 
						mysql_format(Dados, Query, sizeof Query, "SELECT `Nome` FROM `Contas` WHERE `Nome` = '%s'", usuario);
						cache = mysql_query(Dados, Query);
						new rows = cache_num_rows();
						if(cache_is_valid(cache) && rows){
							mysql_format(Dados, Query, sizeof Query, "UPDATE `Contas` SET `Dinheiro` = `Dinheiro` + `'%d'` WHERE `Nome` = '%s'",
								valor, usuario);
							mysql_tquery(Dados, Query);
							SendClientMessage(playerid, LIGHTBLUE, "* Voce setou esta quantia de dinheiro para um jogador Offline.");
						}
						else{
							SendClientMessage(playerid, LIGHTBLUE, "* Voce digitou o nome de um usuario inexistente.");
						}
						if(cache_is_valid(cache))cache_delete(cache);
					}
					else{
						GivePlayerCash(achou, valor);
						new str[144];
						format(str, sizeof str, "%s te setou %dR$ de grana.", nome(playerid), valor);
						SendClientMessage(achou, Rosa, str);
						format(str, sizeof str, "Voce setou %dR$ para %s", valor, nome(achou));
						SendClientMessage(playerid, Rosa, str);
						PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
					}
				}
			}
		}
		case DIALOG_CONSULTARCONTA:{
			if(response || !response){
				new usuario[24];
				GetPVarString(playerid, "Configurado", usuario, 24);
				PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
			}
		}
		case DIALOG_MENU_SCRIPTER:{
			//"Setar Dinheiro\nConsultar Conta\nDeletar Conta\nResetar Staff\nResetar Atributos Staff"
			if(response){
				switch(listitem){
					case 0:{
						ShowPlayerDialog(playerid, DIALOG_SETAR_DINHEIRO, DIALOG_STYLE_INPUT, "{fff000}Setar Dinheiro", "{33ccff}Digite a quantia de dinheiro a ser setada", "Ok","Retornar");
					}
					case 1:{
						new Query[90], Cache: R, str[144], usuario[24], LLogin[32];
						GetPVarString(playerid, "Configurado", usuario, 24);
						mysql_format(Dados,Query, sizeof Query, "SELECT * FROM `Contas` WHERE `Nome` = '%e'", usuario);
						R = mysql_query(Dados, Query);
						new rows = cache_num_rows();
						if(cache_is_valid(R) && rows){
							new org, dinheiro, cash, banco;
							cache_get_value_name_int(0, "Org", org);
							cache_get_value_name_int(0, "Dinheiro", dinheiro);
							cache_get_value_name_int(0, "Cash", cash);
							cache_get_value_name_int(0, "Banco", banco);
							cache_get_value_name(0, "UltimoLogin", LLogin,32);
							format(str, sizeof str, "%s\n\nDinheiro %d\nCoins %d\nBanco %d\nOrg %s\nUltimo Login %s", usuario, dinheiro, cash, banco,
								OrgGm[ org ][OrgNome], LLogin);
							ShowPlayerDialog(playerid, DIALOG_CONSULTARCONTA, DIALOG_STYLE_MSGBOX, "{fff000}Consultando Conta", str, "Ok", #);
						}
						else{
							SendClientMessage(playerid, LIGHTBLUE, "|INFO| Nao foi possivel encontrar esta conta.");
						}
						if(cache_is_valid(R))cache_delete(R);
					}
					case 2:{
						new usuario[24];
						GetPVarString(playerid, "Configurado", usuario, 24);
						new achado = -1;
						foreach(new i: Player){
							if(!strcmp(nome(i), usuario)){
								achado = i;
							}
						}
						if(achado != -1){
							PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode deletar a conta de um jogador online!");
						}
						else{
							new Query[99];
							mysql_format(Dados, Query, sizeof Query, "DELETE FROM `Contas` WHERE `Nome` = '%e'",usuario);
							mysql_tquery(Dados, Query);

							mysql_format(Dados, Query, sizeof Query, "DELETE FROM `Acessorios` WHERE `Nome` = '%e'",usuario);
							mysql_tquery(Dados, Query);

						    mysql_format(Dados,Query, sizeof(Query), "DELETE FROM `Staff` WHERE Nome = '%e'", usuario);
						    mysql_tquery(Dados, Query);
						   
						    mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Mochilas` WHERE `userid` = '%d'", usuario);
						    mysql_tquery(Dados, Query);

						    mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Habs` WHERE `Nome` = '%e'", usuario);
						    mysql_tquery(Dados, Query);
						    
						    mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Conce` WHERE `Nome` = '%e'", usuario);
						    mysql_tquery(Dados, Query);

						    SendClientMessage(playerid, LIGHTBLUE, "* A Conta do jogador foi deletada do servidor.");
						}
					}

					case 3:{
						new usuario[24];
						GetPVarString(playerid, "Configurado", usuario, 24);
						new achado = -1;
						foreach(new i: Player){
							if(!strcmp(nome(i), usuario)){
								achado = i;
							}
						}
						if(achado != -1){
							PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
							SendClientMessage(playerid, LIGHTBLUE, "* Este jogador esta online, use /daradmin.");
						}
						else{
							new Query[99];
							mysql_format(Dados,Query, sizeof Query, "UPDATE `Contas` SET `Admin` = '0' WHERE `Nome` = '%s'",usuario);
							mysql_tquery(Dados, Query);

						    mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Staff` WHERE `Nome` = '%s'", usuario);
						    mysql_tquery(Dados, Query);
	
						    SendClientMessage(playerid, LIGHTBLUE, "* Sucesso! O Jogador nao e mais Admin.");
						}
					}
					case 4:{
						foreach(new i: Player){
							if(PlayerInfo[i][Admin] != 0){
								PlayerInfo[i][Cash] += 5;
						
							}
						}
						new Query[99];
						mysql_format(Dados, Query, sizeof Query, "UPDATE `Contas` SET `Cash` = `Cash` + '5' WHERE `Admin` > 0");	
						mysql_tquery(Dados, Query);
						format(Query, sizeof Query, "%s setou 5 Coins para todos os Staffs.", nome(playerid));
						AdminMessage(ColorStaff(11), Query);
						
						new usuario[24];
						GetPVarString(playerid, "Configurado", usuario, 24);
						PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
					}
					case 5:{
						foreach(new i: Player){
							if(PlayerInfo[i][Admin] != 0){
								GivePlayerCash(i, 5000);
							}
						}
						new Query[99];
						mysql_format(Dados, Query, sizeof Query, "UPDATE `Contas` SET `Dinheiro` = `Dinheiro` + '5000' WHERE `Admin` > 0");	
						mysql_tquery(Dados, Query);
						format(Query, sizeof Query, "%s setou 5000$ para todos os Staffs.", nome(playerid));
						AdminMessage(ColorStaff(11), Query);
						new usuario[24];
						GetPVarString(playerid, "Configurado", usuario, 24);
						PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));	
					}
					case 6:{
						new usuario[24];
						GetPVarString(playerid, "Configurado", usuario, 24);
						new achado = -1;
						foreach(new i: Player){
							if(!strcmp(nome(i), usuario)){
								PlayerInfo[i][Admin] = 0;
								ResetPlayerCash(i);
								PlayerInfo[playerid][Cash] = 0;
								PlayerInfo[playerid][Vip] = 0;
								SendClientMessage(i, LIGHTBLUE, "* Voce teve alguns dados resetados por um Admin.");
								SendClientMessage(i, LIGHTBLUE, "* Voce teve alguns dados resetados por um Admin.");
								SendClientMessage(i, LIGHTBLUE, "* Voce teve alguns dados resetados por um Admin.");
								SendClientMessage(i, LIGHTBLUE, "* Voce teve alguns dados resetados por um Admin.");
							}
						}
						if(achado == -1){
							new Query[140];
							mysql_format(Dados, Query, sizeof Query, "UPDATE `Contas` SET `Admin` = '0', `Cash` = '0', `Dinheiro` = '0', `Vip` = '0' WHERE `Nome` = '%s'",usuario);
						    mysql_tquery(Dados, Query);
						    SendClientMessage(playerid, LIGHTBLUE, "* Sucesso! O Jogador teve alguns dados resetados.");
						}
					}
				}
			}
		}
		case DIALOG_COMPRAR_ACESSORIO:{
			if(response){
				new id = listitem;
				if(GetPlayerCash(playerid) < Acessorios[id][AcessorioPreco]){
					SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
					PC_EmulateCommand(playerid, "/menu");

				}
				else if(Acessorios[id][VipAcessorio] && PlayerInfo[playerid][Vip] == 0){
					SendClientMessage(playerid, LIGHTBLUE, "* Este acessorio e apenas para Vips.");
					PC_EmulateCommand(playerid, "/menu");
				}
				else if(MochilaCheia(playerid)){
					SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a sua Mochila cheia.");
					PC_EmulateCommand(playerid, "/menu");
				}
				else{
					GivePlayerCash(playerid, -Acessorios[id][AcessorioPreco]);
					AdicionarItem(playerid, Acessorios[id][AcessorioId], 1);
					SendClientMessage(playerid, LIGHTBLUE, "* Voce comprou um acessorio com Sucesso.");
					PC_EmulateCommand(playerid, "/mochila");
					//(playerid, GetPVarInt(playerid, "Menuid"), Acessorios[id][AcessorioPreco]);
				}
			}
		}
		case DIALOG_SUBS_LOCAL:{
			if(response){
				if(listitem >= 0){
					new id = listitem + 1, achou = -1;
					if(achou == -1){
						new d= GetPVarInt(playerid, "AcesEdit");

						ao[playerid][d][partebone] = id;
										
						SetPlayerAttachedObjectEx(playerid, d, ao[playerid][d][modelindex], 
							ao[playerid][d][partebone], ao[playerid][d][ao_x], ao[playerid][d][ao_y],ao[playerid][d][ao_z], ao[playerid][d][ao_rx], ao[playerid][d][ao_ry], ao[playerid][d][ao_rz],
							ao[playerid][d][ao_sx], ao[playerid][d][ao_sy], ao[playerid][d][ao_sz]);						
		
						//SetPlayerAttachedObject(playerid, index, modelid, bone, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0)
						//RemovePlayerAttachedObject(playerid, d);
						SendClientMessage(playerid, LIGHTBLUE, "* Editado com sucesso.");

						PC_EmulateCommand(playerid, "/acessorios");
					}
				}
			}
		}
		case DIALOG_OPEDITAR:{
			if(!response) return PC_EmulateCommand(playerid, "/acessorios");
			if(response){
				new acessorio = GetPVarInt(playerid, "AcesEdit");
				switch(listitem){
					case 0:{
						EditAttachedObject(playerid, acessorio);
						SendClientMessage(playerid, LIGHTBLUE, "* Voce comecou a editar este acessorio.");
					}
					case 1:{
						for(new i; i <14; i++){
							PlayerTextDrawShow(playerid, EditorAO[playerid][i]);
						}
						TipoEdicao[playerid] = 1;
						SelectTextDraw(playerid, Rosa);
						SendClientMessage(playerid, LIGHTBLUE, "* Voce comecou a editar este objeto.");
						SendClientMessage(playerid, COR_SCRIPTER, "Use /finalizaredicao para terminar a edicao.");
						SendClientMessage(playerid, COR_SCRIPTER, "Use /finalizaredicao para terminar a edicao.");
						SendClientMessage(playerid, COR_SCRIPTER, "Use /finalizaredicao para terminar a edicao.");
					}
				}
			}
		}
		case DIALOG_OPCOES_EDITAC:{
			if(!response) return PC_EmulateCommand(playerid, "/acessorios");
			if(response){
				new acessorio = GetPVarInt(playerid, "AcesEdit");
				switch(listitem){
					case 0:{
						ShowPlayerDialog(playerid, DIALOG_OPEDITAR, DIALOG_STYLE_LIST, "{fff000}Escolhendo", "Editor PC\nEditor Android", "Ok", "Sair");
					}
					case 1:{
						new grandestr[500];
						strcat(grandestr, "Parte\tDisponivel\n");
						for(new i = 1; i <sizeof AttachmentBones; i++){
							new str[50];
							format(str, sizeof str, "%s\n", AttachmentBones[i]);
							strcat(grandestr, str);				
						}
						ShowPlayerDialog(playerid, DIALOG_SUBS_LOCAL,DIALOG_STYLE:5, "{fff000}Escolhendo Local", grandestr, "Ok", "Retorno");
					}
					case 2:{
						if(MochilaCheia(playerid)){
							SendClientMessage(playerid, LIGHTBLUE, "* Sua Mochila esta cheia!");
							PC_EmulateCommand(playerid, "/acessorios");
						}
						else if(PlayerInfo[playerid][Mochila] == 0){
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						}
						else{
							AdicionarItem(playerid, ao[playerid][acessorio][modelindex], 1);
							RemovePlayerAttachedObjectEx(playerid, acessorio);
							SendClientMessage(playerid, LIGHTBLUE, "* Voce guardou este acessorio no Inventario.");
							PC_EmulateCommand(playerid, "/mochila");
						}
					}
				}
			}
		}
		case DIALOG_VER_ACCS:{
			if(response){
				new var = -1;
				for(new i; i <MAX_PLAYER_ATTACHED_OBJECTS; i++){
					if(IsPlayerAttachedObjectSlotUsed(playerid, i)){
						if(listitem == i){
							var = i;
							SetPVarInt(playerid, "AcesEdit", i);
							ShowPlayerDialog(playerid, DIALOG_OPCOES_EDITAC, DIALOG_STYLE_LIST, "{fff000}Acessorios Opcao", "{33ccff}Editar Acessorio\nAlterar Local\nGuardar Acessorio (Mochila)", "Ok", "Sair");
							break;
						}
						else
							continue;
					}
					else
						listitem++;
				}
				if(var == -1){
					SendClientMessage(playerid, LIGHTBLUE, "* Slot invalido para editar.");
					PC_EmulateCommand(playerid, "/acessorios");
				}
			}
		}
		case DIALOG_ABASTECER:{
			if(response){
				new value = strval(inputtext), id = GetPVarInt(playerid, "QPosto");
				if(!Number(inputtext) || value < 1 || value > (GetPlayerCash(playerid) * 5) || value > 100 || (value + VeiculoInfo[GetPlayerVehicleID(playerid)][Gasolina]) > 100){
					PC_EmulateCommand(playerid, "/abastecer");
					SendClientMessage(playerid, LIGHTBLUE, "* Voce digitou uma quantia invalida OU nao tem dinheiro suficiente para Reabastecer");
				}
				if(id == 14 && PlayerInfo[playerid][Emprego] != TAXISTA){
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este posto de gasolina.");
					PC_EmulateCommand(playerid, "/menu");
				}
				if(id != 14 && value > PostoI[id][CombustivelDisponivel]){
					PC_EmulateCommand(playerid, "/menu");
					SendClientMessage(playerid, LIGHTBLUE, fString("* Este posto de gasolina tem somente %d Litros de combustivel.", PostoI[id][CombustivelDisponivel]));
				}
				else{
					if(VehOpcao(GetPlayerVehicleID(playerid), VEICULO_LIGADO)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa desligar o Motor!");
					GivePlayerCash(playerid, -value);
					SetTimerEx("reabastecerV", 4000, false, "iii", playerid, GetPlayerVehicleID(playerid), value);
					TogglePlayerControllableEx(playerid, false);
					GameTextForPlayer(playerid, "~R~Reabastecendo Veiculo...", 3000, 3);
				}
			}
		}
		case DIALOG_OPCAO_HOSPITAL:{
			if(response){
				new Float: Hp;
				GetPlayerHealth(playerid, Hp);
				switch(listitem){
					case 0:{
						if(GetPlayerCash(playerid) < 500 || Hp >= 100){
							PC_EmulateCommand(playerid, "/menu");
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente ou nao precisa de tratamento.");
						}
						else{
							GivePlayerCash(playerid, -500);
							MandarPraMaca(playerid);
						}
					}
				}
			}
		}
		case DIALOG_COFRECASA:{
			if(response){
				if(listitem >= 0){
					SetPVarInt(playerid, "ListaIdHouse", listitem);
					ShowPlayerDialog(playerid, DIALOG_COFRECASASELECT, DIALOG_STYLE_LIST, "{fff000}Cofre Casa", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
				}
			}
		}
		case DIALOG_SUBS_MOCHILA_CASA:{
			if(response){
				if(listitem >= 0){
					if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui mochila.");
					new cont, id = GetPVarInt(playerid, "ListaIdHouse"), casa = DentroDeCasa[playerid];
					
		        	for(new i; i<32; i++){
		        		if(ItemInfo[playerid][i][Item] != NADA){
				        	if(listitem == i){
				        		cont++;
								InfoCasa[casa][Quantia][id] = ItemInfo[playerid][listitem][Quantia];
								InfoCasa[casa][Item][id] = ItemInfo[playerid][listitem][Item];
								ItemInfo[playerid][listitem][Quantia] = 0;
								ItemInfo[playerid][listitem][Item] = NADA;
								SendClientMessage(playerid, LIGHTBLUE, "* O Item da sua mochila foi para a casa.");				
								PC_EmulateCommand(playerid, "/cofrecasa");
								break;
							}
							else
								continue;
						}
						else
							listitem++;
					}
					if(cont == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Mochila vazia!");
				}
			}
		}
		case DIALOG_COFRECASASELECT:{
			new id = GetPVarInt(playerid, "ListaIdHouse"), casa = DentroDeCasa[playerid];
			if(response){
				switch(listitem){
					case 0:{
						if(MochilaCheia(playerid)){
							SendClientMessage(playerid, LIGHTBLUE, "* Sua mochila esta cheia, Voce nao pode pegar o item.");
							PC_EmulateCommand(playerid, "/cofrecasa");
							//ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							if(InfoCasa[casa][Quantia][id] == 0 || InfoCasa[casa][Item][id] == 0){
								SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
								PC_EmulateCommand(playerid, "/cofrecasa");
								//ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
							}
							else{
								AdicionarItem(playerid, InfoCasa[casa][Item][id], InfoCasa[casa][Quantia][id]);
								new str[144], Float: X, Float: Y, Float: Z;
								GetPlayerPos(playerid, X, Y, Z);
								format(str, sizeof str, "%s pegou o item %s do cofre.", nome(playerid), InventarioName(InfoCasa[casa][Item][id]));
								MensagemL(X, Y, Z, str);						
								InfoCasa[casa][Item][id] = 0;
								InfoCasa[casa][Quantia][id] = 0;
								PC_EmulateCommand(playerid, "/cofrecasa");
								SendClientMessage(playerid, LIGHTBLUE, "* O Item foi para sua mochila.");
							}			
						}
					}
					case 1:{
						if(InfoCasa[casa][Quantia][id] == 0 || InfoCasa[casa][Item][id] == 0){
							SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
							PC_EmulateCommand(playerid, "/cofrecasa");
							//ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							CriarItem(playerid, InfoCasa[casa][Item][id], InfoCasa[casa][Quantia][id]);
							InfoCasa[casa][Quantia][id] = 0;
							InfoCasa[casa][Item][id] = 0;
							PC_EmulateCommand(playerid, "/cofrecasa");
							SendClientMessage(playerid, LIGHTBLUE, "* O Item foi descartado no chao.");	
						}
					}
					case 2:{
						if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ter uma mochila.");
						if(InfoCasa[casa][Quantia][id] != 0 || InfoCasa[casa][Item][id] != 0){
							SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item nao invalido.");
							PC_EmulateCommand(playerid, "/cofrecasa");
							//ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							new str[600], str2[600];
							strcat(str, "{33ccff}Item\t{33ccff}Quantia\n");

							for(new i; i< 32; i++){
								if(ItemInfo[playerid][i][Item] != NADA){
								    format(str2, sizeof(str2), "{ffffff}%s\t(%dx)\n", InventarioName(ItemInfo[playerid][i][Item]), ItemInfo[playerid][i][Quantia]);
					     			strcat(str, str2);
								}
							}
							ShowPlayerDialog(playerid, DIALOG_SUBS_MOCHILA_CASA, DIALOG_STYLE:5, "{FFF000}Sua Mochila", str, "Select", "Sair");							
						}
					}
				}
			}
		}
		case DIALOG_TUNAR_OFICINA:{
			if(response){
				if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar em seu veiculo.");
				switch(listitem){
					case 0:{
						new string[290] = "Roda\tPreco\n", str[25 + 6];
						for(new i; i < sizeof wheelcomponent; i++){
							format(str, sizeof str, "{33ccff}%s\t%dR$\n", wheelcomponent[i][wheelname], wheelcomponent[i][wheelprice]);
							strcat(string, str);
						}
						ShowPlayerDialog(playerid, DIALOG_BUY_WHEEL, DIALOG_STYLE:5,"Componentes disponiveis", string, "Ok", "voltar");
					}
					
					case 1:{
						new string[255] = "Escapamento\tPreco\n", str[40];
						for(new i; i < sizeof scapecomponent; i++){
							format(str, sizeof str, "{33ccff}%s\t%dR$\n", scapecomponent[i][scapename], scapecomponent[i][scapeprice]);
							strcat(string, str);
						}
						ShowPlayerDialog(playerid, DIALOG_BUY_SCAPE, DIALOG_STYLE:5,"Escapamentos", string, "Ok", "voltar");
					}
					case 2:{//spoilercomponent
						new string[255] = "Spoiler\tPreco\n", str[40];
						for(new i; i < sizeof spoilercomponent; i++){
							format(str, sizeof str, "{33ccff}%s\t%dR$\n", spoilercomponent[i][spoilername], spoilercomponent[i][spoilerprice]);
							strcat(string, str);
						}
						ShowPlayerDialog(playerid, DIALOG_BUY_SPOILER, DIALOG_STYLE:5,"Escapamentos", string, "Ok", "voltar");
					}
					case 3:{
						new id = GetPVarInt(playerid, "CARidV"), str[144];
						for(new i = 1; i<13; i++){
							new getcomp;
							getcomp = GetVehicleComponentInSlot(VehInfo[playerid][id][Carro], CARMODTYPE:i);
							if(getcomp != 0){
								mysql_format(Dados, str, sizeof str, "UPDATE `Conce` SET `Componente%d` = '0' WHERE `vehid` = '%d' AND `nome` = '%s'", 
									i, id, nome(playerid));
								mysql_tquery(Dados, str);
								RemoveVehicleComponent(VehInfo[playerid][id][Carro], getcomp);
							}
						}
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce resetou sua tunagem.");
					}
				}
			}
			else
				SetPVarInt(playerid, "CARidV", -1);
		}
		case DIALOG_BUY_SPOILER:{
			if(response){
				new spoiler = listitem, carid = GetPVarInt(playerid, "CARidV");

				if(GetPlayerCash(playerid) < spoilercomponent[spoiler][spoilerprice]){
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
					PC_EmulateCommand(playerid, "/tunar");
				}
				if(!IsValidComponentForVehicle(VehInfo[playerid][carid][Carro], spoiler)){
					PC_EmulateCommand(playerid, "/tunar");
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este Spoiler nao e compativel com seu veiculo.");
				}
				else{
					AddVehicleComponent(VehInfo[playerid][carid][Carro], spoilercomponent[spoiler][spoilerid]);
					GivePlayerCash(playerid, -spoilercomponent[spoiler][spoilerprice]);
					SendClientMessage(playerid, VerdeLeve, "|INFO| Voce comprou um Spoiler por %d$.", spoilercomponent[spoiler][spoilerprice]);
				}
			}
			else
				PC_EmulateCommand(playerid, "/tunar");
		}
		case DIALOG_BUY_SCAPE:{
			if(response){
				new scapee = listitem, carid = GetPVarInt(playerid, "CARidV");

				if(GetPlayerCash(playerid) < scapecomponent[scapee][scapeprice]){
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
					PC_EmulateCommand(playerid, "/tunar");
				}
				if(!IsValidComponentForVehicle(VehInfo[playerid][carid][Carro], scapee)){
					PC_EmulateCommand(playerid, "/tunar");
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este Escape nao e compativel com seu veiculo.");
				}
				else{
					AddVehicleComponent(VehInfo[playerid][carid][Carro], scapecomponent[scapee][scape]);
					GivePlayerCash(playerid, -scapecomponent[scapee][scapeprice]);
					SendClientMessage(playerid, VerdeLeve, "|INFO| Voce comprou um scape por %d$.", scapecomponent[scapee][scapeprice]);
				}
			}
			else
				PC_EmulateCommand(playerid, "/tunar");
		}
		case DIALOG_BUY_WHEEL:{
			if(response){
				new roda = listitem, carid = GetPVarInt(playerid, "CARidV");
				if(GetPlayerCash(playerid) < 1200){
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
				}
				else{
					AddVehicleComponent(VehInfo[playerid][carid][Carro], wheelcomponent[roda][wheel]);
					GivePlayerCash(playerid, -1200);
					SendClientMessage(playerid, VerdeLeve, "|INFO| Voce comprou uma roda por 1200R$.");
				}
			}
			else
				PC_EmulateCommand(playerid, "/tunar");
		}
		case DIALOG_SELECIONAR_COMPID:{
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar em seu veiculo.");
			if(response){
				if(!Number(inputtext)){
					ShowPlayerDialog(playerid, DIALOG_SELECIONAR_COMPID, DIALOG_STYLE_INPUT, "{33ccff}# Componente Especifico", "{fff000}Pesquise no google 'Componentes ID Samp' para achar um componente.", "Comprar", "sair");
					SendClientMessage(playerid, LIGHTBLUE, "* Apenas numeros sao permitidos.");
					return 1;
				}
				else if(strval(inputtext) > 1193 || strval(inputtext) < 1000){
					ShowPlayerDialog(playerid, DIALOG_SELECIONAR_COMPID, DIALOG_STYLE_INPUT, "{33ccff}# Componente Especifico", "{fff000}Pesquise no google 'Componentes ID Samp' para achar um componente.", "Comprar", "sair");
					SendClientMessage(playerid, LIGHTBLUE, "* Apenas componentes entre 1000 e 1193.");		
					return 1;			
				}
				else{
					new componente = strval(inputtext);
					if(IsValidComponentForVehicle(GetPlayerVehicleID(playerid), componente)){
						vComponent[GetPlayerVehicleID(playerid)] = componente;
						ShowPlayerDialog(playerid, DIALOG_COMPRARCOMP, DIALOG_STYLE_MSGBOX, "{fff000}# Comprando Componente", "{fff000}Deseja comprar este componente para seu veiculo? Preco: {33aa33}1900$", "Sim", "Nao");
					}
					else{
						ShowPlayerDialog(playerid, DIALOG_SELECIONAR_COMPID, DIALOG_STYLE_INPUT, "{33ccff}# Componente Especifico", "{fff000}Pesquise no google 'Componentes ID Samp' para achar um componente.", "Comprar", "sair");
						SendClientMessage(playerid, LIGHTBLUE, "* Este componente nao e valido para seu veiculo.");							
					}					
				}
			}
			else{
				ShowPlayerDialog(playerid, DIALOG_TUNAR_OFICINA, DIALOG_STYLE_LIST, "{fff000}# Tunando Seu Veiculo", "{33ccff}Tunagem Disponivel\n{fff000}Digitar Componente\n{ff0000}Resetar Componentes", "Ok", "Sair");
			}
		}
		case DIALOG_COMPRARCOMP:{
			if(!response){
				ShowPlayerDialog(playerid, DIALOG_SELECIONAR_COMPID, DIALOG_STYLE_INPUT, "{33ccff}# Componente Especifico", "{fff000}Pesquise no google 'Componentes ID Samp' para achar um componente.", "Comprar", "sair");
				vComponent[GetPlayerVehicleID(playerid)] = 0;
			}
			else{
				if(GetPlayerCash(playerid) >= 1900){
					GivePlayerCash(playerid, -1900);
					AddVehicleComponent(GetPlayerVehicleID(playerid), vComponent[GetPlayerVehicleID(playerid)]);
					SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de comprar este Componente.");
					salvarComponentes(playerid, GetPVarInt(playerid, "CARidV"));
					carregarComponentes(playerid, GetPVarInt(playerid, "CARidV"));
					vComponent[GetPlayerVehicleID(playerid)] = 0;
					ShowPlayerDialog(playerid, DIALOG_SELECIONAR_COMPID, DIALOG_STYLE_INPUT, "{33ccff}# Componente Especifico", "{fff000}Pesquise no google 'Componentes ID Samp' para achar um componente.", "Comprar", "Ok");
				}
				else{
					if(vComponent[GetPlayerVehicleID(playerid)] != 0){
						vComponent[GetPlayerVehicleID(playerid)] = 0;
						SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
					}
				}
			}
		}
		case DIALOG_SELECTSPAWN:{
			if(!response){
				AbrirSelecaoSpawn(playerid);
			}
			else{
				SetPlayerHealth(playerid, 100);
				switch(listitem){

					case 0:{
						EstiloSpawn[playerid] = SPAWN_CIVIL;
						TogglePlayerSpectating(playerid, false);
						SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin],3585.6218,524.0502,1519.5316,360.0);
						SpawnPlayer(playerid);
					}
					case 1:{
						if(PlayerInfo[playerid][Org] != 0){
							EstiloSpawn[playerid] = SPAWN_ORG;
							new org = PlayerInfo[playerid][Org];
							TogglePlayerSpectating(playerid, false);
							SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin], OrgInfo[org][OrgSpawn][0],OrgInfo[org][OrgSpawn][1],OrgInfo[org][OrgSpawn][2],OrgInfo[org][OrgSpawn][3]);
							SpawnPlayer(playerid);
						}
						else{
							AbrirSelecaoSpawn(playerid);
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Organizacao.");
						}
					}
					case 2:{
						if(PlayerInfo[playerid][Px] != 0 && PlayerInfo[playerid][Py] !=0 && PlayerInfo[playerid][Pz] != 0){
							TogglePlayerSpectating(playerid, false);
							SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin], PlayerInfo[playerid][Px],PlayerInfo[playerid][Py],PlayerInfo[playerid][Pz],90.0);
							EstiloSpawn[playerid] = SPAWN_ULTIMAPOS;
							SpawnPlayer(playerid);
							
						}
						else{
							AbrirSelecaoSpawn(playerid);
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui ultima posicao.");
						}
					}
					case 3:{
						new str[255], contar;
						foreach(new i: B_House){
							if(DonoDaCasa(playerid, i) || AlugouCasa(playerid, i)){
								contar++;
								new str2[55];
								format(str2, sizeof(str2), "N. %d - %s.\n", i, CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]));
								strcat(str, str2);							
							}
							ShowPlayerDialog(playerid, DIALOG_SPAWN_HOUSE, DIALOG_STYLE_LIST, "{ff0000}# Suas Casas", str, "Spawn", "Nao");
						}
						if(contar == 0){
							AbrirSelecaoSpawn(playerid);
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem residencias.");
						}
					}
				}
			}
		}
		case DIALOG_EDITAR_SALARIO:{
			if(response){
				new value = strval(inputtext), cargo = GetPVarInt(playerid, "CFGCargo"), org = PlayerInfo[playerid][Org];
				if( 1 <= value <= 5000){
					OrgInfo[org][SalarioCargo][cargo] = strval(inputtext);
					new str[128];
					format(str, sizeof str, "Sucesso! O Salario do(a) %s foi trocado para %dR$", CargoOrgPCargo(PlayerInfo[playerid][Org], cargo), strval(inputtext));
					SendClientMessage(playerid, VerdeSamp, str);
					SalvarOrg(org);
					PC_EmulateCommand(playerid, "/configurarsalario");
				}
				else{
					SendClientMessage(playerid, LIGHTBLUE, "* Este salario e invalido!");
					PC_EmulateCommand(playerid, "/configurarsalario");
				}
			}
		}
		case DIALOG_VER_SALARIOS:{
			if(response){
				if(listitem >= 0){
					listitem = listitem + 1;
					SetPVarInt(playerid, "CFGCargo", listitem);
					new str[60];
					format(str, sizeof str, "Voce selecionou o cargo %s.", CargoOrgPCargo(PlayerInfo[playerid][Org], listitem));

					SendClientMessage(playerid, LIGHTBLUE, str);
					ShowPlayerDialog(playerid, DIALOG_EDITAR_SALARIO, DIALOG_STYLE_INPUT, "{fff000}# Editando Salario",
					 "Digite o novo salario para este Cargo.", "Ok", "Retornar");
				}
			}
		}
		case DIALOG_EQS_MAFIA:{ //finalizei aqui
			if(response){ 
				new quantiamac = strval(inputtext);
				if(!Number(inputtext)){
					ShowPlayerDialog(playerid, DIALOG_EQS_MAFIA, 
						DIALOG_STYLE_INPUT, "{ff0000}# Comprando Equipamentos", "{33ccff}Digite no campo a baixo a quantia de Equipamentos para encomendar.\n\
						64 p. Kit.", "Buy", "Return");
					SendClientMessage(playerid, LIGHTBLUE, "* Apenas numeros.");
				}
				else if(OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] < quantiamac * 60){
					ShowPlayerDialog(playerid, DIALOG_EQS_MAFIA, 
						DIALOG_STYLE_INPUT, "{ff0000}# Comprando Equipamentos", "{33ccff}Digite no campo a baixo a quantia de Equipamentos para encomendar.\n\
						64 p. Kit.", "Buy", "Return");
					SendClientMessage(playerid, LIGHTBLUE, "* Sua org tem dinheiro suficiente.");

				}
				else if(strval(inputtext) < 10){
					ShowPlayerDialog(playerid, DIALOG_EQS_MAFIA, 
						DIALOG_STYLE_INPUT, "{ff0000}# Comprando Equipamentos", "{33ccff}Digite no campo a baixo a quantia de Equipamentos para encomendar.\n\
						64 p. Kit.", "Buy", "Return");
					SendClientMessage(playerid, LIGHTBLUE, "* Voce so pode comprar 10 Equipamentos para cima.");

				}
				else{
					new org = PlayerInfo[playerid][Org];
					OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] -= quantiamac*60;
					EncomendasMafia[org][EquipamentosEnc] = quantiamac;
					new str[144];
					format(str, sizeof str, "* Sucesso! Voce acaba de encomendar %d kits de Equipamento da Mafia.", quantiamac);
					SendClientMessage(playerid, LIGHTBLUE, str);
					EncomendasMafia[org][TempoEnc][1] = gettime() + 60 * 60 * 3;//60 * 60 * 24 * 3;
					format(str, sizeof str, "Aviso | As encomendas de Equipamentos chegaram em %s", Convert(EncomendasMafia[org][TempoEnc][1] - gettime()));
					SendClientMessage(playerid, VerdeSamp, str);
					encMafia[org][1][Encid] = PlayerInfo[playerid][Org]+3;
					new Query[190];
					format(Query, sizeof Query, "INSERT INTO `Mafia` (`encid`, `Equipamentos`, `TempoEntrega1`, `orgid`) VALUES ('%d', '%d', '%d', '%d')",
						PlayerInfo[playerid][Org]+3,EncomendasMafia[org][EquipamentosEnc], EncomendasMafia[org][TempoEnc][1], org);
					DB_ExecuteQuery(Mafia, Query);

				}
			}
		}
		case DIALOG_COMPRAR_CARRO_ORG:{
			if(response){
				new id = listitem;
				if(TemVeiculoOrg(PlayerInfo[playerid][Org], InfoCompra[id][VehModel])){
					SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo ja existe na sua org.");
					new str[480];
					strcat(str, "Carro\tValor\n");
					for(new i; i<sizeof(InfoCompra); i++){
						new str2[49];
						format(str2, sizeof str2, "%s\t{33aa33}%d$\n",
							InfoCompra[i][vehName], InfoCompra[i][Value]);
						strcat(str, str2);
					}
					ShowPlayerDialog(playerid, DIALOG_COMPRAR_CARRO_ORG,DIALOG_STYLE:5,
						"{ff0000}# Comprando Veiculos", str,"Ok", "Sair");
				}
				else if(OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] < InfoCompra[id][Value]){
					SendClientMessage(playerid, LIGHTBLUE, "* Sua org nao tem dinheiro suficiente.");
					new str[480];
					strcat(str, "Carro\tValor\n");
					for(new i; i<sizeof(InfoCompra); i++){
						new str2[59];
						format(str2, sizeof str2, "%s\t{33aa33}%d$\n",
							InfoCompra[i][vehName], InfoCompra[i][Value]);
						strcat(str, str2);
					}
					ShowPlayerDialog(playerid, DIALOG_COMPRAR_CARRO_ORG,DIALOG_STYLE:5,
						"{ff0000}# Comprando Veiculos", str,"Ok", "Sair");
				}
				else if(MaximoVeiculoOrg(PlayerInfo[playerid][Org])){
					SendClientMessage(playerid, LIGHTBLUE, "* Voce atingiu o maximo de veiculos na org.");
					new str[480];
					strcat(str, "Carro\tValor\n");
					for(new i; i<sizeof(InfoCompra); i++){
						new str2[59];
						format(str2, sizeof str2, "%s\t{33aa33}%d$\n",
							InfoCompra[i][vehName], InfoCompra[i][Value]);
						strcat(str, str2);
					}
					ShowPlayerDialog(playerid, DIALOG_COMPRAR_CARRO_ORG,5,
						"{ff0000}# Comprando Veiculos", str,"Ok", "Sair");
				}
				else{
					new org = PlayerInfo[playerid][Org];
					OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] -= InfoCompra[id][Value];
					EncomendasMafia[org][VeiculosModel] = InfoCompra[id][VehModel];
					EncomendasMafia[org][TempoEnc][2] = gettime() + 60 * 60 * 24 * 1;
					encMafia[org][2][Encid]= PlayerInfo[playerid][Org]+2;
					new str[255];
					format(str, sizeof str, "Aviso | Sucesso! Voce comprou o veiculo %s da mafia. A entrega do veiculo sera em %s", GetVehicleName(InfoCompra[id][VehModel]), Convert(EncomendasMafia[org][TempoEnc][2] - gettime() ) );
					SendClientMessage(playerid, -1, str);
					format(str, sizeof str, "INSERT INTO `Mafia` (`encid`, `VeiculoModel`, `TempoEntrega2`, `orgid`) VALUES ('%d', '%d', '%d', '%d')",
						PlayerInfo[playerid][Org]+2,EncomendasMafia[org][VeiculosModel], EncomendasMafia[org][TempoEnc][2], org);
					DB_ExecuteQuery(Mafia, str);	
				}
			}
		}
		case DIALOG_MACONHAS_MAFIA:{ //finalizei aqui
			if(response){ 
				new quantiamac = strval(inputtext);
				if(!Number(inputtext)){
					ShowPlayerDialog(playerid, DIALOG_MACONHAS_MAFIA, 
						DIALOG_STYLE_INPUT, "{ff0000}# Comprando Drogas", "{33ccff}Digite no campo a baixo a quantia de Maconha para encomendar.\n\
						4/g.", "Buy", "Return");
					SendClientMessage(playerid, LIGHTBLUE, "* Apenas numeros.");
				}
				else if(OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] < quantiamac * 4){
					ShowPlayerDialog(playerid, DIALOG_MACONHAS_MAFIA, 
						DIALOG_STYLE_INPUT, "{ff0000}# Comprando Drogas", "{33ccff}Digite no campo a baixo a quantia de Maconha para encomendar.\n\
						4/g.", "Buy", "Return");
					SendClientMessage(playerid, LIGHTBLUE, "* Sua org nao tem dinheiro suficiente.");

				}
				else if(strval(inputtext) < 100){
					ShowPlayerDialog(playerid, DIALOG_MACONHAS_MAFIA, 
						DIALOG_STYLE_INPUT, "{ff0000}# Comprando Drogas", "{33ccff}Digite no campo a baixo a quantia de Maconha para encomendar.\n\
						4/g.", "Buy", "Return");
					SendClientMessage(playerid, LIGHTBLUE, "* Voce so pode comprar 100g pra cima!");

				}
				else{
					new org = PlayerInfo[playerid][Org];
					OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] -= quantiamac*4;
					EncomendasMafia[org][MaconhaEnc] = quantiamac;
					new str[144];
					format(str, sizeof str, "* Sucesso! Voce acaba de encomendar %dg de Maconha da Mafia.", quantiamac);
					SendClientMessage(playerid, LIGHTBLUE, str);
					encMafia[org][0][Encid] = PlayerInfo[playerid][Org]+1;
					EncomendasMafia[org][TempoEnc][0] = gettime() + 60 * 60 * 24* 1;
					format(str, sizeof str, "Aviso | As encomendas de drogas chegaram em %s", Convert(EncomendasMafia[org][TempoEnc][0] - gettime() ) );
					SendClientMessage(playerid, VerdeSamp, str);
					new Query[210];
					format(Query, sizeof Query, "INSERT INTO `Mafia` (`encid`, `Drogas`, `TempoEntrega0`, `orgid`) VALUES ('%d', '%d', '%d', '%d')",
						PlayerInfo[playerid][Org]+1,EncomendasMafia[org][MaconhaEnc], EncomendasMafia[org][TempoEnc][0], org);
					DB_ExecuteQuery(Mafia, Query);			
				}
			}
		}
		case DIALOG_NEGOCIAR_MAFIA:{
			if(response){

				switch(listitem){
					case 0:{
						if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 9) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e lider ou nao esta em uma org.");
						new org = PlayerInfo[playerid][Org];
						if(EncomendasMafia[org][MaconhaEnc] > 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja encomendou drogas da mafia, nao pode fazer isso novamente ate elas chegarem.");
						ShowPlayerDialog(playerid, DIALOG_MACONHAS_MAFIA, 
							DIALOG_STYLE_INPUT, "{ff0000}# Comprando Drogas", "{33ccff}Digite no campo a baixo a quantia de Maconha para encomendar.\n\
							{33aa33}4${33ccff}/g, so podera encomendar uma vez, ate o dia de entrega chegar.", "Buy", "Return");
					}
					case 1:{
						if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 9) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e lider ou nao esta em uma org.");
						new org = PlayerInfo[playerid][Org];
						if(EncomendasMafia[org][EquipamentosEnc] > 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja encomendou Equipamentos da mafia, nao pode fazer isso novamente ate elas chegarem.");
						ShowPlayerDialog(playerid, DIALOG_EQS_MAFIA, 
							DIALOG_STYLE_INPUT, "{ff0000}# Comprando Equipamentos", "{33ccff}Digite no campo a baixo a quantia de Equipamentos para encomendar.\n\
							{33aa33}60$ {33ccff}P. Kit, so podera encomendar uma vez, ate o dia de entrega chegar.", "Buy", "Return");
					}
					case 2:{
						if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 9) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e lider ou nao esta em uma org.");
						if(EncomendasMafia[ PlayerInfo[playerid][Org] ][VeiculosModel] > 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja encomendou um veiculo da Mafia.");
						new str[480];
						strcat(str, "Carro\tValor\n");
						for(new i; i<sizeof(InfoCompra); i++){
							new str2[63];
							format(str2, sizeof str2, "%s\t{33aa33}%d$\n",
								InfoCompra[i][vehName], InfoCompra[i][Value]);
							strcat(str, str2);
						}
						ShowPlayerDialog(playerid, DIALOG_COMPRAR_CARRO_ORG,5,
							"{ff0000}# Comprando Veiculos", str,"Ok", "Sair");
					}
					case 3:{
						new str[255];
						format(str, sizeof str, "%s\n\n{fff000}Voce possui um total de %dR$ para deixar limpo\n\n{33aa33}Voce ganhara 60%% deste valor (%dR$)\n{fff000}Aceita?", nome(playerid), PegarQuantiaItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO), floatround((0.6) * float(PegarQuantiaItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO))));
						ShowPlayerDialog(playerid, DIALOG_LIMPAR_GRANA, DIALOG_STYLE_MSGBOX, "{fff000}Negociando Com A Mafia", str, "Sim", "Nao");
					}
					case 4:{
						ChecarEncomendas(PlayerInfo[playerid][Org]);
					}
				}
			}
		}
		case DIALOG_LIMPAR_GRANA:{
			if(response){
				if(PegarQuantiaItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO) > 0){
					new Float: conta = ((0.6) * PegarQuantiaItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO)), str[144];
					if(PegarQuantiaItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO) > 2000){
						SendClientMessage(playerid, LIGHTBLUE, "Nota -> Um Bonus de 800$ foi adicionado.");
						GivePlayerCash(playerid, 800);
					}
					format(str, sizeof str, "Sucesso! Voce converteu %d$ de grana roubada em %d$ de grana limpa!", PegarQuantiaItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO), floatround(conta));
					RemoverItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO);
					GivePlayerCash(playerid, floatround(conta));
					SendClientMessage(playerid, COR_COPOM, str);

				}
				else{
					PC_EmulateCommand(playerid, "/negociar");
					SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
				}
			}
		}
		case DIALOG_CONSULTA_PLACA:{
			if(response){
				new Query[144], Cache: R;
				mysql_format(Dados, Query, sizeof Query, "SELECT `Dono`, `Veiculo`, `Apreendido`, `IPVA` FROM `Conce` WHERE `Placa` = '%s'", inputtext);
				R = mysql_query(Dados, Query);
				new rows = cache_num_rows();
				if(cache_is_valid(R) && rows){
					new str[255], nomeuser[24];
					cache_get_value_name(0, "Dono", nomeuser, 24);
					format(str, sizeof str, "{33ccff}Placa %s\n\
						{ffffff}Dono: %s\n\
						Modelo: %s\n\
						Apreendido: %s\n\
						{ffffff}IPVA Sem pagar: %dR$\n", inputtext, nomeuser, GetVehicleName(cache_return_int(0, "Veiculo")), (cache_return_int(0, "Apreendido") ? ("{33aa33}Sim") : ("{ff0000}Nao")), cache_return_int(0, "IPVA"));
					ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Informacoes Encontradas", str, "Ok", #);

					//ShowPlayerDialog(playerid, DIALOG_CONSULTA_PLACA, DIALOG_STYLE_INPUT, "{fff000}Consultando Placa", "Digite no campo a baixo a Placa para Consulta.", "Ok", "Sair");
				}
				else{
					SendClientMessage(playerid, LIGHTBLUE, "* Esta placa nao foi localizada no Banco de dados do Detran!");
					ShowPlayerDialog(playerid, DIALOG_CONSULTA_PLACA, DIALOG_STYLE_INPUT, "{fff000}Consultando Placa", "Digite no campo a baixo a Placa para Consulta.", "Ok", "Sair");
				}
				if(cache_is_valid(R))cache_delete(R);
			}
		}
		case DIALOG_ESCOLHAS_PLACA:{
			if(response){
				switch(listitem){
					case 0:{
						AbrirSelecaoPlaca(playerid);					
					}
					case 1:{
						ShowPlayerDialog(playerid, DIALOG_CONSULTA_PLACA, DIALOG_STYLE_INPUT, "{fff000}Consultando Placa", "Digite no campo a baixo a Placa para Consulta.", "Ok", "Sair");
					}
					case 2:{
						AbrirSelecaoIpva(playerid);
					}
				}
			}
		}
		case DIALOG_SELECT_IPVA:{
			if(response){
				if(listitem >= 0){
					new var;
			        for(new i; i<MAXCONCE; i++){
			            if(VehInfo[playerid][i][IPVA] != 0){
			                if(listitem == var){
			                    SetPVarInt(playerid, "selectCarIPVA", i);
			                    break;
							}
							else
							    var++;
						}
						else
						    continue;
					}
					new id = GetPVarInt(playerid, "selectCarIPVA");
					if(VehInfo[playerid][id][IPVA] > 0 && GetPlayerCash(playerid) > VehInfo[playerid][id][IPVA]){
						GivePlayerCash(playerid, -VehInfo[playerid][id][IPVA]);
						new str[144];
						format(str, sizeof str, "IPVA | Voce pagou um total de %dR$ de ipva deste veiculo.", VehInfo[playerid][id][IPVA]);
						SendClientMessage(playerid, VerdeSamp, str);
						VehInfo[playerid][id][IPVA] = 0;
						if(VehInfo[playerid][id][Apreendido]){//ipvapay
							VehInfo[playerid][id][Apreendido] = false;
							VehInfo[playerid][id][Carro] = CriarVeiculo("veh desapreendido", VehInfo[playerid][id][IDCarro], VehInfo[playerid][id][Vx], VehInfo[playerid][id][Vy], VehInfo[playerid][id][Vz]+1, VehInfo[playerid][id][Rotacao], VeiculoInfo[VehInfo[playerid][id][Carro]][CorVeiculo][0], VeiculoInfo[VehInfo[playerid][id][Carro]][CorVeiculo][1], -1);
							SendClientMessage(playerid, VerdeSamp, "IPVA | O Veiculo que estava apreendido foi spawnado novamente, Nos recomendamos voce relogar para evitar perda de dados.");
						}
						PC_EmulateCommand(playerid, "/menu");
						DeletePVar(playerid, "selectCarIPVA");

					}
					else{
						AbrirSelecaoIpva(playerid);
						SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo nao possui IPVA para ser pagou OU voce esta sem dinheiro.");
					}
				}
				else{
					PC_EmulateCommand(playerid, "/menu");
				}
			}
		}
		case DIALOG_SELECTVEH_PLACA:{
			if(response){
		        for(new i; i<MAXCONCE; i++){
		            if(VehInfo[playerid][i][IDCarro] != 0){
		                if(listitem == i){
		                    SetPVarInt(playerid, "selectCar", i);
							break;
						}
						else
						    continue;
					}
					else
					    listitem++;
				}
				new id = GetPVarInt(playerid, "selectCar");
				if(id != -1){
					if(isnull(VehInfo[playerid][id][Placa])){
						if(GetPlayerCash(playerid) >= 600){
							GivePlayerCash(playerid, -600);
							format(VehInfo[playerid][id][Placa], 8, B_GenCharPlaca(6));
							new str[100];
							format(str, sizeof str, "* Aviso: A Nova placa de seu veiculo e '%s'.", VehInfo[playerid][id][Placa]);
							SendClientMessage(playerid, VerdeSamp, str);	
							format(str, sizeof str, "%s", VehInfo[playerid][id][Placa]);
       						VehInfo[playerid][id][PlacaText] = Create3DTextLabel(str, -1, 0,0,0, 9.0, 0);// testLOS=0)
       						Attach3DTextLabelToVehicle(VehInfo[playerid][id][PlacaText], VehInfo[playerid][id][Carro], 0.0,0.0,0.0);	
							mysql_format(Dados, str, sizeof str, "UPDATE `Conce` SET `Placa` = '%s' WHERE `nome` = '%s' AND `vehid` = '%d'",
								nome(playerid), VehInfo[playerid][id][vehid]);
							mysql_tquery(Dados, str);
						}
						else{
							AbrirSelecaoPlaca(playerid);
							SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem 600 reais.");
						}
					}
					else{
						SendClientMessage(playerid, LIGHTBLUE, "* Veiculo ja emplacado!");
						AbrirSelecaoPlaca(playerid);					
					}
				}			
			}
			else{
				PC_EmulateCommand(playerid, "/menu");
			}
		}
		case DIALOG_EDITAR_CARROS:{
			if(response){
				SetPVarInt(playerid, "CarEdit", listitem);
				ShowPlayerDialog(playerid, DIALOG_EDITAR_VEICULO_ORG,
					DIALOG_STYLE_LIST, "{FF0000}# Opcao Veiculo", "Editar Slot\nAtualizar Posicao", "Ok", "Retornar");
			}
			else
				AbrirCfgOrg(playerid);
		}
		case DIALOG_EDITAR_VEICULO_ORG:{
			new slotcarro = GetPVarInt(playerid, "CarEdit"), org = GetPVarInt(playerid, "IDOrg");
			if(response){
				if(listitem == 0){
					ShowPlayerDialog(playerid, DIALOG_EDITAR_SLOTCARRO, DIALOG_STYLE_INPUT,
						"{FF0000}# Editar Slot", "Digite no campo a baixo o id de veiculo.", "Ok", "Sair");
				}
				if(listitem == 1){
					if(OrgVeiculo[org][slotcarro][VeiculoModelo] == 0){
						SendClientMessage(playerid, -1, "Voce nao pode atualizar o spawn de um veiculo que nao existe.");
						ShowPlayerDialog(playerid, DIALOG_EDITAR_SLOTCARRO, DIALOG_STYLE_INPUT,
							"{FF0000}# Editar Slot", "Digite no campo a baixo o id de veiculo.", "Ok", "Sair");
					}
					else{
						new Float: X, Float: Y,Float:Z, Float:A;
						GetPlayerPos(playerid, X, Y, Z);
						GetPlayerFacingAngle(playerid, A);
						OrgVeiculo[org][slotcarro][VeiculoSpawn][0] = X;
						OrgVeiculo[org][slotcarro][VeiculoSpawn][1] = Y;
						OrgVeiculo[org][slotcarro][VeiculoSpawn][2] = Z;
						OrgVeiculo[org][slotcarro][VeiculoSpawn][3] = A;
						SendClientMessage(playerid, -1, "Sucesso! O Spawn do slot foi atualizado.");
						ShowPlayerDialog(playerid, DIALOG_EDITAR_VEICULO_ORG,
							DIALOG_STYLE_LIST, "{FF0000}# Opcao Veiculo", "Editar Slot\nAtualizar Posicao", "Ok", "Retornar");
						SalvarOrg(org);
					}
				}
			}
			else{
				new str[500], id = GetPVarInt(playerid, "IDOrg");
				for(new i; i<MAX_CARROS; i++){
					new str2[27 + 10];
					format(str2, sizeof str2, "(%d)\t%s\n",i, GetVehicleName(OrgVeiculo[id][i][VeiculoModelo]));
					strcat(str, str2);
				}
				ShowPlayerDialog(playerid, DIALOG_EDITAR_CARROS, DIALOG_STYLE_LIST, "{ff0000}# Menu Veiculos", str, "Ok", "Retornar");
			}
		}
		case DIALOG_EDITAR_SLOTCARRO:{
			if(response){
				new veiculo = strval(inputtext), slotcarro = GetPVarInt(playerid, "CarEdit"), org = GetPVarInt(playerid, "IDOrg");
				if(veiculo > 611 || !Number(inputtext)){
					SendClientMessage(playerid, -1, "Digite um id valido.");
					ShowPlayerDialog(playerid, DIALOG_EDITAR_SLOTCARRO, DIALOG_STYLE_INPUT,
						"{FF0000}# Editar Slot", "Digite no campo a baixo o id de veiculo.", "Ok", "Sair");			
				}
				else{
					OrgVeiculo[org][slotcarro][VeiculoModelo] = strval(inputtext);
					SendClientMessage(playerid, -1, "Sucesso! O Slot foi trocado para o que voce digitou.");
					ShowPlayerDialog(playerid, DIALOG_EDITAR_VEICULO_ORG,
						DIALOG_STYLE_LIST, "{FF0000}# Opcao Veiculo", "Editar Slot\nAtualizar Posicao", "Ok", "Retornar");
					SalvarOrg(org);
				}
			}
			else{
				ShowPlayerDialog(playerid, DIALOG_EDITAR_VEICULO_ORG,
					DIALOG_STYLE_LIST, "{FF0000}# Opcao Veiculo", "Editar Slot\nAtualizar Posicao", "Ok", "Retornar");			
			}
		}
		case DIALOG_CONFIGURACAO_ORG:{
			if(response){
				//"Atualizar Veiculos\nAtualizar Spawn\nAtualizar Pickup\nAtualizar Veiculos Cor\nDinheiro Cofre"
				new id = GetPVarInt(playerid, "IDOrg");
				switch(listitem){
					case 0:{
						new str[500];
						for(new i; i<MAX_CARROS; i++){
							new str2[27 + 10];
							format(str2, sizeof str2, "(%d)\t%s\n",i, GetVehicleName(OrgVeiculo[id][i][VeiculoModelo]));
							strcat(str, str2);
						}
						ShowPlayerDialog(playerid, DIALOG_EDITAR_CARROS, DIALOG_STYLE_LIST, "{ff0000}# Menu Veiculos", str, "Ok", "Retornar");
					}
					case 1:{
						new Float: X, Float: Y, Float: Z, Float: A;
						GetPlayerPos(playerid, X, Y, Z);
						GetPlayerFacingAngle(playerid, A);
						OrgInfo[id][OrgSpawn][0] = X;
						OrgInfo[id][OrgSpawn][1] = Y;
						OrgInfo[id][OrgSpawn][2] = Z;
						OrgInfo[id][OrgSpawn][3] = A;	
						OrgInfo[id][OrgInterior] = GetPlayerInterior(playerid);	
						OrgInfo[id][OrgVw] = GetPlayerVirtualWorld(playerid);	
						SendClientMessage(playerid, -1, "Sucesso! O Spawn foi atualizado com sucesso.");
						AbrirCfgOrg(playerid);	
						////////printf("%dint %dvw %s att", OrgInfo[id][OrgInterior], OrgInfo[id][OrgVw]);
						SalvarOrg(id);	

					}
					case 2:{
						if(!OrgInfo[id][PickDisponivel]){
							OrgInfo[id][PickDisponivel] = true;
							new Float: X, Float: Y, Float: Z;
							GetPlayerPos(playerid, X, Y, Z);
							OrgInfo[id][OrgPickPos][0] = X;
							OrgInfo[id][OrgPickPos][1] = Y;
							OrgInfo[id][OrgPickPos][2] = Z;
							OrgInfo[id][Pick] = CreateDynamicPickup(1083, 1, X, Y, Z);
							OrgInfo[id][TextoPick] = CreateDynamic3DTextLabel("{33CCFF}Pickup Organizacao\nAperte 'Y' Para acessar", -1, X, Y, Z, 25.0);// 
							AbrirCfgOrg(playerid);
							SendClientMessage(playerid, -1, "Sucesso! Pickup foi criado.");
							SalvarOrg(id);
						}
						else{
							new Float: X, Float: Y, Float: Z;
							GetPlayerPos(playerid, X, Y, Z);
							OrgInfo[id][OrgPickPos][0] = X;
							OrgInfo[id][OrgPickPos][1] = Y;
							OrgInfo[id][OrgPickPos][2] = Z;
							DestroyDynamicPickup(OrgInfo[id][Pick]);
							DestroyDynamic3DTextLabel(OrgInfo[id][TextoPick]);
							OrgInfo[id][Pick] = CreateDynamicPickup(1083, 1, X, Y, Z);
							OrgInfo[id][TextoPick] = CreateDynamic3DTextLabel("{33CCFF}Pickup Organizacao\nAperte 'Y' Para acessar", -1, X, Y, Z, 25.0);// 
							SendClientMessage(playerid, -1, "Sucesso! Pickup atualizado.");
							AbrirCfgOrg(playerid);
							SalvarOrg(id);
						}
					}
					case 3:{
						ShowPlayerDialog(playerid, DIALOG_EDITAR_VORG_COR, 
							DIALOG_STYLE_INPUT, "{ff0000}# Editar Cor", "Digite a nova cor dos veiculos desta organizacao abaixo", "Ok", "Retornar");
					}
					case 4:{
						ShowPlayerDialog(playerid, DIALOG_COFREMONEY, DIALOG_STYLE_INPUT, 
							"{33ccff}# Dinheiro No Cofre", "Digite a quantia de dinheiro para esta org.", "Ok", "Sair");
					}
				}
			}
			else{
				SendClientMessage(playerid, -1, "Voce cancelou a edicao.");
				SetPVarInt(playerid, "IDOrg", -1);
				DeletePVar(playerid, "IDOrg");
			}
		}
		case DIALOG_COFREMONEY:{
			if(response){
				new valor = strval(inputtext), org = GetPVarInt(playerid, "IDOrg");
				if(!Number(inputtext) || valor < 0){
					AbrirCfgOrg(playerid);
					SendClientMessage(playerid, LIGHTBLUE, "* Voce digitou um valor invalido.");
				}
				else{
					OrgInfo[org][OrgCofre] = strval(inputtext);
					new str[144];
					format(str, sizeof str, "Novo saldo da(o) %s: %dR$", OrgGm[org][OrgNome], strval(inputtext));
					SendClientMessage(playerid, LIGHTBLUE, str);
					AbrirCfgOrg(playerid);
				}
			}
		}
		case DIALOG_EDITAR_VORG_COR:{
			if(response){
				if(!Number(inputtext) || strlen(inputtext) > 3){
					SendClientMessage(playerid, LIGHTBLUE, "* Digite a cor corretamente.");
					AbrirCfgOrg(playerid);
				}
				else{
					AbrirCfgOrg(playerid);
					new id = GetPVarInt(playerid, "IDOrg");
					OrgInfo[id][VehCor] = strval(inputtext);
					new str[50];
					format(str, sizeof str, "A Nova cor desta org e %d.", strval(inputtext));
					SendClientMessage(playerid, LIGHTBLUE, str);
					SalvarOrg(id);
				}
			}
		}
		case DIALOG_SPAWN_HOUSE:{
			if(!response) return AbrirSelecaoSpawn(playerid);
			if(response){
				if(listitem >= 0){
					new lista;
					foreach(new i: B_House){
						if(DonoDaCasa(playerid, i) || AlugouCasa(playerid, i)){
							
							if(listitem == lista){
								SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin], PlayerInfo[playerid][Px],PlayerInfo[playerid][Py],PlayerInfo[playerid][Pz],90.0);
								TogglePlayerSpectating(playerid, false);
								SpawnPlayer(playerid);							
								SendClientMessage(playerid, LIGHTBLUE, "* Voce foi teleportado ate a residencia.");
								SetPlayerInterior(playerid, 0);
								EstiloSpawn[playerid] = SPAWN_CASA;
								CasaSpawn[playerid] = i;
								SetPlayerVirtualWorld(playerid, 0);
							
								break;
							}
							else
								lista++;
						}
						else
							continue;
					}
				}
			}
		}
		case DIALOG_LOGARADMIN:{
			if(response){
				if(!isnull(inputtext)){
					if(!strcmp(inputtext, "algas")){
						PlayerInfo[playerid][Admin] = NivelAdmin[playerid];
						new str[144];
						format(str, sizeof(str), "* (%d)%s logou como Admin!", playerid, nome(playerid));
						AdminMessage(Rosa, str);			
						new Cache: R;
						mysql_format(Dados, str, sizeof(str), "SELECT * FROM `Staff` WHERE `Nome` = '%s'", nome(playerid));
						R = mysql_query(Dados, str);
						new rows = cache_num_rows();
						if(!cache_is_valid(R) && !rows){
							mysql_format(Dados, str, sizeof(str), "INSERT INTO `Staff` (`Nome`) VALUES ('%s')", nome(playerid));
							mysql_tquery(Dados, str);
						}
						if(cache_is_valid(R))cache_delete(R);
					}
					else{
						new str[144];
						format(str, sizeof str, "{ff0000}[AVISO] %s errou a senha admin (senha: %s) e foi kickado!", nome(playerid), inputtext);
						AdminMessage(-1, str);
						Kick(playerid);
					}			
				}
				else{
					new str[144];
					format(str, sizeof(str), "{ff0000}[AVISO](%d)%s Nao quis logar como Admin!", playerid, nome(playerid));
					AdminMessage(Rosa, str);				
				}
			}
		}
		case DIALOG_MP3:{
			if(response){
				SendClientMessage(playerid, LIGHTBLUE, "* Aguarde alguns segundos para a musica Tocar.");
				switch(listitem){
					case 0:PlayAudioStreamForPlayer(playerid, "http://node-17.zeno.fm/1s7c5qtrq18uv?rj-ttl=5&rj-tok=AAABeuhXLsMAnKWkVG5Uib18sw");
					case 1: PlayAudioStreamForPlayer(playerid, "http://stream.zeno.fm/u6431vzhs18uv");
					case 2: PlayAudioStreamForPlayer(playerid, "http://stream.zeno.fm/14g665rbt18uv");
					case 3: PlayAudioStreamForPlayer(playerid, "http://stream.zeno.fm/hkps4e3vkm0uv");
					//case 4: PlayAudioStreamForPlayer(playerid, "https://zeno.fm/lil-peep-sadsong/");
					case 4: StopAudioStreamForPlayer(playerid);
				}
			}
		}
		case DIALOG_JBL:{
			if(response){

				if(CriouJBL[playerid] == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao criou uma JBL.");
				new i = CriouJBL[playerid];
		
				switch(listitem){
					case 0:{
						foreach(new ii: Player){
							if(ISP(ii, 10.0, InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2]) && GetPlayerVirtualWorld(ii) ==InfoJBL[i][JBLVw]){
								PlayAudioStreamForPlayer(ii, "http://node-17.zeno.fm/1s7c5qtrq18uv?rj-ttl=5&rj-tok=AAABeuhXLsMAnKWkVG5Uib18sw",
								InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2], 10.0, true);
								InfoJBL[i][TipoMusica] =  1;
							}
						}
					}
					case 1:{
						foreach(new ii: Player){
							if(ISP(ii, 10.0, InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2]) && GetPlayerVirtualWorld(ii) ==InfoJBL[i][JBLVw]){
								PlayAudioStreamForPlayer(ii, "http://stream.zeno.fm/u6431vzhs18uv",
								InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2], 10.0, true);
							    InfoJBL[i][TipoMusica] = 2;
							}
						}
					}
					case 2:{
						foreach(new ii: Player){
							if(ISP(i, 10.0, InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2]) && GetPlayerVirtualWorld(ii) ==InfoJBL[i][JBLVw]){
								PlayAudioStreamForPlayer(ii, "http://stream.zeno.fm/14g665rbt18uv",
								InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2], 10.0, true);
								InfoJBL[i][TipoMusica] = 3;
							}
						}
					}//https://zeno.fm/lil-peep-sadsong/
					case 3:{
						foreach(new ii: Player){
							if(ISP(i, 10.0, InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2]) && GetPlayerVirtualWorld(ii) ==InfoJBL[i][JBLVw]){
								PlayAudioStreamForPlayer(ii, "https://node-20.zeno.fm/5gz4xe3vkm0uv?rj-ttl=5&rj-tok=AAABevHjJGgAVyyp5CHS8pkJhQ",
								InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2], 10.0, true);
								InfoJBL[i][TipoMusica] = 4;
							}
						}
					}
					case 4:{
						foreach(new ii: Player){
							if(ISP(i, 10.0, InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2]) && GetPlayerVirtualWorld(ii) ==InfoJBL[i][JBLVw]){
								PlayAudioStreamForPlayer(ii, "https://zeno.fm/lil-peep-sadsong/",
								InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2], 10.0, true);
								InfoJBL[i][TipoMusica] = 5;
							}
						}
					}
				}
			}
		}
		case DIALOG_MECMENU:{
			if(response){
				if(listitem >= 0){
					listitem = listitem + 1;
					if(GetPlayerCash(playerid) < MecanicoCompras[listitem][valoritemmec]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
					switch(listitem){
						case 1:{
							MecMenu[playerid][KitReparo] +=  MecanicoCompras[listitem][itemmec];
							GivePlayerCash(playerid, -MecanicoCompras[listitem][valoritemmec]);
							SendClientMessage(playerid, VerdeSamp, "* Voce acaba de comprar um Kit De Reparo.");

						}
						case 2:{
							MecMenu[playerid][Sprays] +=  MecanicoCompras[listitem][itemmec];
							GivePlayerCash(playerid, -MecanicoCompras[listitem][valoritemmec]);
							SendClientMessage(playerid, VerdeSamp, "* Voce acaba de comprar duas latas de Spray.");
						}
						case 3:{
							MecMenu[playerid][Gasolinas] +=  MecanicoCompras[listitem][itemmec];
							GivePlayerCash(playerid, -MecanicoCompras[listitem][valoritemmec]);
							SendClientMessage(playerid, VerdeSamp, "* Voce acaba de comprar um galao de Gasolina.");				
						}
					}
				}
				AbrirMecMenu(playerid);
			}
		}
		case DIALOG_MENUCONSERTO:{
			if(response){
				switch(listitem){
					case 0:{
						if(MecMenu[playerid][KitReparo] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem nenhum Kit de reparo.");
						SendClientMessage(playerid, LIGHTBLUE, "* Lembrando: Voce precisa estar na frente do Motor do veiculo!");
						if(Consertando[playerid]) return 1;
						for(new c = MAX_VEHICLES, j = 0; c != j; c--){
							new Float: X, Float: Y, Float: Z, Float: A;
							GetVehiclePos(c, X, Y, Z);
							GetVehicleZAngle(c, A);
							X = X + 3.0 * floatsin(-A, degrees);
							Y = Y + 3.0 * floatcos(-A, degrees);
							if(ISP(playerid, 3.9, X-1.0285, Y+1.0768, Z)){
								new Float: Hp;
								if(GetVehicleHealth(c, Hp)){
									if(c < 320){
										ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
										PlayerSoundTime(1133, 4.5, X, Y, Z, 2300);
										PlayerSoundTime(1140, 4.5, X, Y, Z, 3200);
										PlayerSoundTime(1140, 4.5, X, Y, Z, 3900);
										PlayerSoundTime(1133, 4.5, X, Y, Z, 5300);
										PlayerSoundTime(1133, 4.5, X, Y, Z, 5900);
										PlayerSoundTime(1021, 4.5, X, Y, Z, 6300);
										PlayerSoundTime(1039, 4.5, X, Y, Z, 7300);
										PlayerSoundTime(1133, 4.5, X, Y, Z, 8000);
										TimerPlayer[playerid][5] = SetTimerEx("TerminarConserto", 12100, false, "ii", playerid, c);
										Consertando[playerid] = true;
										GameTextForPlayer(playerid, "~R~Reparando...", 7900, 3);
										break;
									}
								}
							}
						}
					}
					case 1:{
						if(MecMenu[playerid][Sprays] < 2) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de pelo menos duas latas de Spray.");	
						for(new c = MAX_VEHICLES, j = 0; c != j; c--){
							new Float: X, Float: Y, Float: Z;
							GetVehiclePos(c,X, Y, Z);
							if(ISP(playerid, 3.9, X, Y, Z)){
								SetPVarInt(playerid, "ChangeColor", c);
								ShowPlayerDialog(playerid, DIALOG_TROCARCOR, DIALOG_STYLE_INPUT, "{fff000}Trocar Cor", "{33ccff}Troque a cor deste veiculo, escreva no campo a baixo o ID de uma cor\n\
								Isso vai usar duas latas de Spray.", "Ok", "Sair");
								break;
							}
						}
					}
					case 2:{
						new Float:Pos[6];
						GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
						for(new i = MAX_VEHICLES, j = 0; i != j; i--){
							GetVehiclePos(i, Pos[3], Pos[4], Pos[5]);
							////////printf("%d %d carantes", i, GetVehicleModel(i));
							if(VectorSize(Pos[3] - Pos[0], Pos[4] - Pos[1], Pos[5] - Pos[2]) < 8.9){
								////////printf("%d %d car", i, GetVehicleModel(i));
								if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
    		                    {
                		        	SetVehiclePosEx(GetVehicleTrailer(GetPlayerVehicleID(playerid)), Pos[3], Pos[4], Pos[5]);
        		                   	DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
            		            }
                		        else{
                    		       	AttachTrailerToVehicle(i,GetPlayerVehicleID(playerid));
                		        }
                    		}
                    	}
					}
					case 3:{

						new Float:Pos[6], check = -1;
						GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
						for(new i = MAX_VEHICLES, j = 0; i != j; i--){
							GetVehiclePos(i, Pos[3], Pos[4], Pos[5]);
							////////printf("%d %d carantes", i, GetVehicleModel(i));
                    		//GetXYZOfVehiclePart(vehicleid, part, &Float:x, &Float:y, &Float:z, Float:offset = 0.5)
							GetXYZOfVehiclePart(i, VEHICLE_PART_TRASEIROESQUERDO, Pos[3], Pos[4], Pos[5]);
                    		if(ISP(playerid, 1.2, Pos[3], Pos[4], Pos[5])){
                    			if(VeiculoInfo[i][Gasolina] == 100) 
                    				return SendClientMessage(playerid, LIGHTBLUE, "* O Tanque de gasolina deste veiculo esta cheio.");
                    			
                    			check = i;
                    			new str[144];
                    			format(str, sizeof str, "* %s reabasteceu de gasolina um veiculo.", nome(playerid));
                    			MensagemLocal(25.0, playerid, Roxoeu, str, false);
                    			VeiculoInfo[i][Gasolina] = 100;
                    			MecMenu[playerid][Gasolinas] --;
                    			break;
                    		}
                    	}	
                    	if(check == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta perto de um veiculo ou nao esta na Roda esquerda de atras do veiculo.");					
					}
				}
			}
		}
		case DIALOG_TROCARCOR:{
			if(response){
				if(MecMenu[playerid][Sprays] < 2) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de pelo menos 2 latas de Spray.");
				if(Number(inputtext)){
					new i = GetPVarInt(playerid, "ChangeColor");
					VeiculoInfo[i][CorVeiculo][0] = strval(inputtext);
					VeiculoInfo[i][CorVeiculo][1] = strval(inputtext);
					SendClientMessage(playerid, VerdeSamp, "* Voce trocou com sucesso a cor deste veiculo.");
					ChangeVehicleColours(i, VeiculoInfo[i][CorVeiculo][0], VeiculoInfo[i][CorVeiculo][1]);
					DeletePVar(playerid, "ChangeColor");
					MecMenu[playerid][Sprays] -= 2;
				}
				else{
					PC_EmulateCommand(playerid, "/menuconserto");
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Digite corretamente !");
				}
			}
		}
		case DIALOG_EMERGENCIAS:{
			if(!response) return AbrirCELULAR(playerid);
			else{
				new Float: X, Float: Y, Float: Z;
				GetPlayerPos(playerid, X, Y, Z);
				new str[144];
				switch(listitem){
					case 0:{
		
						foreach(new i: Player){
							if(IsPolice(PlayerInfo[i][Org]) && Equipado(i)){
								format(str, sizeof str, "Chamado > (%d)%s precisa urgente de um policial em %s(%0.2fm)\n", playerid, nome(playerid), CoordZone(X, Y, Z), DistanciaPlayers(i, playerid));
								SendClientMessage(i, Roxoeu, str);
								SetPlayerCheckpoint(i, X, Y, Z, 3.0);
							}
						}
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de pedir atendimento policial nesta regiao, aguarde, e se preciso, se esconda.");
					}
					case 1:{
						if(PedindoMecanico[playerid]){
							PedindoMecanico[playerid] = false;
							SendClientMessage(playerid, LIGHTBLUE, "* Voce cancelou o seu pedido de mecanico.");
						}
						else{
							PedindoMecanico[playerid] = true;
							SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de pedir um mecanico para esta regiao, Aguarde. Caso queira cancelar use o pedido novamente.");
							foreach(new i: Player){
								if(PlayerInfo[i][Emprego] == MECANICO){
									format(str, sizeof str, "Chamados > %s acaba de pedir um mecanico, veja em /chamados.", nome(playerid));
									SendClientMessage(i, VerdeSamp, str);
								}
							}
						}
					}
					case 2:{
						if(PedindoTaxi[playerid]){
							PedindoTaxi[playerid] = false;
							SendClientMessage(playerid, LIGHTBLUE, "* Voce cancelou o seu pedido de Taxi.");
						}
						else{
							PedindoTaxi[playerid] = true;
							SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de pedir um Taxi para esta regiao, Aguarde. Caso queira cancelar use o pedido novamente.");
							foreach(new i: Player){
								if(PlayerInfo[i][Emprego] == TAXISTA){
									format(str, sizeof str, "Chamados > %s acaba de pedir um Taxi, veja em /chamados.", nome(playerid));
									SendClientMessage(i, VerdeSamp, str);
								}
							}
						}
					}
					case 3:{
						if(SendoCurado[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta sendo curado.");
						if(PedindoSamu[playerid]){
							PedindoSamu[playerid] = false;
							SendClientMessage(playerid, LIGHTBLUE, "* Voce cancelou o seu pedido de Samu.");
						}
						else{
							PedindoSamu[playerid] = true;
							SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de pedir um SAMU para esta regiao, Aguarde. Caso queira cancelar use o pedido novamente.");
							foreach(new i: Player){
								if(PlayerInfo[i][Emprego] == SAMU){
									format(str, sizeof str, "Chamados > %s acaba de pedir um SAMU, veja em /chamados.", nome(playerid));
									SendClientMessage(i, VerdeSamp, str);
								}
							}
						}
					}
				}
			}
		}
		case DIALOG_ACEITARMEC:{
			if(response){
				if(listitem >= 0){
					foreach(new i: Player){
						if(PedindoMecanico[i]){
							if(listitem == i){
								SendClientMessage(playerid, LIGHTBLUE, "* Voce aceitou o chamado deste jogador, a posicao dele foi marcada no mapa.");
								new Float: X, Float: Y, Float: Z, str[144];
								GetPlayerPos(i, X, Y, Z);
								SetPlayerCheckpoint(playerid, X, Y, Z, 3.5);
								format(str, sizeof str, "* %s aceitou o seu chamado, aguarde na sua posicao.", nome(playerid));
								SendClientMessage(i, VerdeSamp, str);
								PedindoMecanico[i] = false;
								break;
							}
							else
								continue;
						}
						else
							listitem++;
					}
				}
			}
		}
		case DIALOG_ACEITARTAXI:{
			if(response){
				if(listitem >= 0){
					foreach(new i: Player){
						if(PedindoTaxi[i]){
							if(listitem == i){
								SendClientMessage(playerid, LIGHTBLUE, "* Voce aceitou o chamado deste jogador, a posicao dele foi marcada no mapa.");
								new Float: X, Float: Y, Float: Z, str[144];
								GetPlayerPos(i, X, Y, Z);
								SetPlayerCheckpoint(playerid, X, Y, Z, 3.5);
								format(str, sizeof str, "* %s aceitou o seu chamado, aguarde na sua posicao.", nome(playerid));
								SendClientMessage(i, VerdeSamp, str);
								PedindoTaxi[i] = false;
								break;
							}
							else
								continue;
						}
						else
							listitem++;
					}
				}
			}
		}
		case DIALOG_ACEITARSAMU:{
			if(response){
				if(listitem >= 0){
					foreach(new i: Player){
						if(PedindoSamu[i]){
							if(listitem == i){
								SendClientMessage(playerid, LIGHTBLUE, "* Voce aceitou o chamado deste jogador, a posicao dele foi marcada no mapa.");
								new Float: X, Float: Y, Float: Z, str[144];
								GetPlayerPos(i, X, Y, Z);
								SetPlayerCheckpoint(playerid, X, Y, Z, 3.5);
								format(str, sizeof str, "* %s aceitou o seu chamado, aguarde na sua posicao.", nome(playerid));
								SendClientMessage(i, VerdeSamp, str);
								PedindoSamu[i] = false;
								break;
							}
							else
								continue;
						}
						else
							listitem++;
					}
				}
			}
		}
		case DIALOG_EDITARCOFRENOME:{
			if(!response){
				ShowPlayerDialog(playerid, DIALOG_CFGCOFRE, DIALOG_STYLE_LIST, "Configurar Cofre", "{33ccff}Editar Posicao\n{33ccff}Mudar Nome\n{33ccff}Deletar Cofre"
				, "Ok", #);
			}
			else{
				if(isnull(inputtext)){
					ShowPlayerDialog(playerid, DIALOG_EDITARCOFRENOME, DIALOG_STYLE_INPUT, "Mudar nome do cofre", "{33ccff}Digite o novo nome do cofre no campo a baio:", "Ok", "Retornar");
					SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa escrever algo!!");
				}
				else{
					new id = GetPVarInt(playerid, "CFGCOFRE");
					new str[90];
					format(str, sizeof str, "(%d)%s\n\n{33ccff}use /roubarcofre",id, inputtext);
					UpdateDynamic3DTextLabelText(CofreInfo[id][CofreTexto], -1, str);
					ShowPlayerDialog(playerid, DIALOG_CFGCOFRE, DIALOG_STYLE_LIST, "Configurar Cofre", "{33ccff}Editar Posicao\n{33ccff}Mudar Nome\n{33ccff}Deletar Cofre", "Ok", #);
					SendClientMessage(playerid, Rosa, "* O Nome do cofre foi trocado com sucesso!");
					SalvarCofre(id);
				}
			}
		}
		case DIALOG_CFGCOFRE:{
			if(response){
				switch(listitem){
					case 0:{
						new id = GetPVarInt(playerid, "CFGCOFRE");
						EditDynamicObject(playerid, CofreInfo[id][OCofre]);
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce comecou a editar este Cofre.");
					}
					case 1:{
						ShowPlayerDialog(playerid, DIALOG_EDITARCOFRENOME, DIALOG_STYLE_INPUT, "Mudar nome do cofre", "{33ccff}Digite o novo nome do cofre no campo a baio:", "Ok", "Retornar");
					}
					case 2:{
						new id = GetPVarInt(playerid, "CFGCOFRE");

						new Query[60];
						mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Cofres` WHERE `cofreid` = '%d'", id);
						mysql_tquery(Dados, Query);

						DestroyDynamic3DTextLabel(CofreInfo[id][CofreTexto]);
						DestroyDynamicObject(CofreInfo[id][OCofre]);
						new reset[Cofreconfiguration];
						CofreInfo[id] = reset;
						SendClientMessage(playerid, Rosa, "* Este cofre foi apagado do servidor com sucesso.");
						Iter_Remove(B_Cofres, id);
						SetPVarInt(playerid, "CFGCOFRE", -1);
					}
				}
			}
			else
				SetPVarInt(playerid, "CFGCOFRE", -1);
		}
		case DIALOG_NOTAADMIN:{
			new id = Atendimento[playerid][AtenId];
			if(!response){
				Atendimento[id][Nota] += 10.0;
				Atendimento[playerid][AtenId] = -1;
			}
			else{
				switch(listitem){
					case 0:{
						Atendimento[id][Nota] += 10.0;
						Atendimento[playerid][AtenId] = -1;
					}
					case 1:{
						Atendimento[id][Nota] += 7.5;
						Atendimento[playerid][AtenId] = -1;
					}
					case 2:{
						Atendimento[id][Nota] = 5.0;
						Atendimento[playerid][AtenId] = -1;
					}
					case 3:{
						Atendimento[id][Nota] = 3.0;
						Atendimento[playerid][AtenId] = -1;
					}
					case 4:{
						Atendimento[id][Nota] = 0.0;
						Atendimento[playerid][AtenId] = -1;
					}
				}
			}
		}
		case DIALOG_MUDARNOMEGPS:{
		    if(!response) return DeletePVar(playerid, "editgpsid");
		    else{
				new id = GetPVarInt(playerid, "editgpsid"), str[78];
				format(str, sizeof str, "|INFO| Voce editou %s para %s.", GpsInfo[id][LocalName], inputtext);
				SendClientMessage(playerid, LIGHTBLUE, str);
				format(GpsInfo[id][LocalName], 32, inputtext);
				DeletePVar(playerid, "editgpsid");
			}
		}
		case DIALOG_OPCOESEDIT:{
		    if(!response) return DeletePVar(playerid, "editgpsid");
		    else{
                new id = GetPVarInt(playerid, "editgpsid");
		        switch(listitem){
		            case 0:{
		                if(!GpsInfo[id][LocalCriado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Local invalido.");
						GpsInfo[id][LocalCriado] = false;
						GpsInfo[id][gpsid] = -1;
						GpsInfo[id][LocalTipo] = -1;
						GpsInfo[id][LocalX] = 0.0;
						GpsInfo[id][LocalY] = 0.0;
						GpsInfo[id][LocalZ] = 0.0;
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| Local deletado com sucesso.");
						new Query[78];
						mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Gps` WHERE `gpsid` = '%d'", id);
						mysql_tquery(Dados, Query);
						DeletePVar(playerid, "editgpsid");
						return 1;
					}
					case 1:{
						if(!GpsInfo[id][LocalCriado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Local invalido.");
						ShowPlayerDialog(playerid, DIALOG_MUDARNOMEGPS, DIALOG_STYLE_INPUT, "{fff000}Mudar Nome", "{33ccff}Digite o novo nome para este local.\nPode usar qualquer caracterer.", "Ok", "Sair");
					}
				}
			}
		}
		case DIALOG_EDITARGPS:{
		    if(response){
		        for(new i; i<MAX_GPS_LOCAL; i++){
		            if(GpsInfo[i][LocalCriado]){
			            if(listitem == i){
			                SetPVarInt(playerid, "editgpsid", i);
			                new str[90];
			                format(str, sizeof(str), "%s selecionado (%d)", GpsInfo[i][LocalName], i);
			                ShowPlayerDialog(playerid, DIALOG_OPCOESEDIT, DIALOG_STYLE_LIST, str, "{33ccff}Apagar Local\n{33ccff}Renomear", "Ok", "Sair");
						}
						else
						    continue;
					}
					else
					    listitem++;
				}
			}
		}
		case DIALOG_ABRIRPORTAO:{
			if(response){
			    new id = GetPVarInt(playerid, "qualopID");
			    if(isnull(inputtext)){
			    	SendClientMessage(playerid, -1, "* Digite alguma coisa para abrir o portao.");
			    }
			    else{
				    if(!strcmp(InfoPortao[id][SenhaPortao], inputtext, false, 32)){
			            MoveDynamicObject(InfoPortao[id][OPortao], InfoPortao[id][Px], InfoPortao[id][Py], InfoPortao[id][Pz]-8000, 7.0);
			            GameTextForPlayer(playerid, "Portao abrindo...", 4000, 1);
						SetTimerEx("fecharop", 7000, false, "i", id);
					}
					else{
					    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Senha errada! O Portao nao foi aberto.");
					    DeletePVar(playerid, "qualopID");
					}
				}
			}
			else
			    DeletePVar(playerid, "qualopID");
		}
		case DIALOG_DEFINIRSENHA:{
		    if(response){
		        //if(!Number(inputtext) || !TextoNome(inputtext)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Nao use caracteres especiais.");
		        new id = GetPVarInt(playerid, "oportaoi");
		        format(InfoPortao[id][SenhaPortao],32,inputtext);
		        new str[69];
		        format(str, sizeof str, "|INFO| Sucesso! Voce definiu a senha do portao para %s.", inputtext);
		        SendClientMessage(playerid, LIGHTBLUE, str);
		        SetPVarInt(playerid, "oportaoi", 0);
			}
			else
			    SetPVarInt(playerid, "oportaoi", 0);
		}
		case DIALOG_FUNCOESPORTAO:{
		    if(response){
		    	new id = GetPVarInt(playerid, "oportaoi");
//	ShowPlayerDialog(playerid, DIALOG_FUNCOESPORTAO, DIALOG_STYLE_LIST, str, "{33ccff}Editar Posicao\n{33ccff}Mudar Senha\n{33ccff}Mudar Dono {ff0000}SOMENTE ADMINS\n{33ccff}Recolher Portao", "Ok", "Sair");
				switch(listitem){
					case 0:{
					    
					    EditDynamicObject(playerid, InfoPortao[id][OPortao]);
					    new str[60];
					    format(str, sizeof str, "|INFO| Voce comecou a editar o portao %d.", id);
					    SendClientMessage(playerid, LIGHTBLUE, str);
					    SetPVarInt(playerid, "editandosabosta", 1533);
					}
					case 1:{
						if(isnull(InfoPortao[id][SenhaPortao])){
						    ShowPlayerDialog(playerid, DIALOG_DEFINIRSENHA, DIALOG_STYLE_INPUT, "{fff000}Defina Uma Senha", "{33ccff}Este portao esta sem senha.\nDefina uma agora.", "Definir", "Sair");
						}
						else
						    ShowPlayerDialog(playerid, DIALOG_DEFINIRSENHA, DIALOG_STYLE_INPUT, "{fff000}Defina Uma Senha", "{33ccff}Este portao ja te uma senha definida.\nDefina uma nova agora.", "Definir", "Sair");
					}
					case 3:{
					    if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(!strcmp(nome(playerid), InfoPortao[id][DonoPortao])){
						    AdicionarItem(playerid, PORTAO, 1);
						    DestruirPortao(id);
						    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este portao foi recolhido e deletado do banco de dados. sua mochila tambem foi salva.");
							SalvarMochila(playerid);
							DeletePVar(playerid, "oportaoi");
						}
						else{
							if(PlayerInfo[playerid][Admin] >= 10){
								if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
							    //new id = GetPVarInt(playerid, "oportaoi");
							    AdicionarItem(playerid, PORTAO, 1);
							    DestruirPortao(id);
							    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este portao foi recolhido e deletado do banco de dados. sua mochila tambem foi salva.");
								SalvarMochila(playerid);
								DeletePVar(playerid, "oportaoi");								
							}
						}
					}
				}
			}
		}
		case DIALOG_COMPRAR_ITEM:{
		    if(response){
		    	if(listitem >= 0){
		    		new id = listitem;
		    		//MVItem[i][NameItem], MVItem[i][priceitem]
		    		SetPVarInt(playerid, "iditemmvip", id);
	                if(PlayerInfo[playerid][Cash] < MVItem[id][priceitem]){
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui Coins suficiente.");
						PC_EmulateCommand(playerid, "/menuvip");
					}
					else{
					    if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta cheia.");
						new str[180];
						format(str, sizeof(str), "{33ccff}%s\n\n{fff000}Tem certeza de que deseja comprar o item {f07b0f}%s{fff000} Por {fff000}%dC?\n{Ff0000}OBS: O item vai para sua mochila.", nome(playerid), MVItem[id][NameItem], MVItem[id][priceitem]);
						ShowPlayerDialog(playerid, DIALOG_TERMINARCOMPRA_MVIP, DIALOG_STYLE_MSGBOX, "{fff000}Compra De Portao", str, "Sim", "Nao");
					}
				}
			}
		}
		case DIALOG_TERMINARCOMPRA_MVIP:{
		    if(response){
		    	new id = GetPVarInt(playerid, "iditemmvip");
		    	//objectitem
		        if(PlayerInfo[playerid][Cash] < MVItem[id][priceitem]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem %d Coins.", MVItem[id][priceitem]);
				PlayerInfo[playerid][Cash] -= MVItem[id][priceitem];
				new str[176];
				format(str, sizeof str, "{f07b0f}Menu Vip - {33ccff}%s acaba de comprar um %s na Loja Vip.", nome(playerid), MVItem[id][NameItem]);
				AdicionarItem(playerid, MVItem[id][objectitem], 1);
				SendClientMessageToAll(Amarelo, str);
				SalvarConta(playerid);
				SalvarMochila(playerid);
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este %s foi para seu inventario.", MVItem[id][NameItem]);
			}
		}
		case DIALOG_TERMINARCOMPRAVIP:{
		    if(response){
		        new tipo = GetPVarInt(playerid, "idvip");
		        if(PlayerInfo[playerid][Cash] < Infosvip[tipo][Valor]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem cash suficiente.");
		        else{
        			PlayerInfo[playerid][Cash] -= Infosvip[tipo][Valor];
			        PlayerInfo[playerid][Vip] = tipo;
		            PlayerInfo[playerid][TempoVip] = gettime() + 60 * 60 * 24 * 30;

		           
		            new str[158];
		            format(str, sizeof str, "|INFO| Voce acaba de comprar um vip nivel %d por %dC.", tipo, Infosvip[tipo][Valor]);
		           	SendClientMessage(playerid, Amarelo, str);
		            format(str, sizeof str, "{f07b0f}Menu Vip - {33ccff}%s acaba de comprar um vip %s{33ccff} por 30 dias.", nome(playerid), Infosvip[tipo][NomeVip]);
		            SendClientMessageToAll(Amarelo, str);
		            DeletePVar(playerid, "idvip");
				}
			}
		}
		case DIALOG_COMPRARVIP:{
		    if(response){
		        //if(PlayerInfo[playerid][Vip] < listitem) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Nivel deste vip ??© menor do o que voce tem.");
				SetPVarInt(playerid, "idvip", listitem+1);
				new str[144];
				format(str, sizeof(str), "{fff000}%s\n\n{33ccff}Voce selecionou o vip %s.\n\
				{33ccff}Deseja compra-lo? Valor {ff0000}%dC (30 dias)", nome(playerid), Infosvip[listitem+1][NomeVip], Infosvip[listitem+1][Valor]);
				ShowPlayerDialog(playerid, DIALOG_TERMINARCOMPRAVIP, DIALOG_STYLE_MSGBOX, "{fff000}Comprar Vip", str, "Sim", "Nao");
			}
			else{
			    PC_EmulateCommand(playerid, "/menuvip");
			}
		}
		case DIALOG_MENUVIP:{
		    if(response){
		        switch(listitem){
		            case 0:{
		            	new str[300];
		            	MyBuffer[0] = EOS;
						format(str, sizeof(str), "{f07b0f}Comprar Vip\t{fff000}%d Coins\n", PlayerInfo[playerid][Cash]);
						strcat(MyBuffer, str);
						for(new i = 1; i< sizeof(Infosvip); i++){
						    //listitem = i;
						    format(str, sizeof(str), "%s\t{fff000}%d Coins\n", Infosvip[i][NomeVip], Infosvip[i][Valor]);
						    strcat(MyBuffer, str);
						}
		                ShowPlayerDialog(playerid, DIALOG_COMPRARVIP, 5, "{33aa33}Opcao comprar Vip", MyBuffer, "Ok", "Sair");
					}
					case 1:{
						new string[255] = "{33ccff}Item\t{33ccff}Preco\n", concatenar[45];
						for(new i; i < sizeof MVItem; i++){
							format(concatenar, sizeof concatenar, "%s\t{33ccff}%dC\n", MVItem[i][NameItem], MVItem[i][priceitem]);
							strcat(string, concatenar);
						}
				        ShowPlayerDialog(playerid, DIALOG_COMPRAR_ITEM, 5, "{fff000}Compra De Itens", string, "Comprar", "Sair");
					}
					case 2:{
					    if(PlayerInfo[playerid][Cash] < 25) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de pelo menos 25C.");
						ShowPlayerDialog(playerid, DIALOG_TROCARNOME, DIALOG_STYLE_INPUT, "{fff000}Troca Nick", "{33ccff}Digite no campo a baixo o novo nick que voce deseja para sua conta.\n\
						{ff0000}OBS: Nao use caracteres especiais e nem espacos.", "Ok", "Sair");
					}
				}
			}
		}
		case DIALOG_TROCARNOME:{
		    if(!response) return PC_EmulateCommand(playerid, "/menuvip");
		    else{
		        if(strlen(inputtext) > 24 || strlen(inputtext) <= 2 || !strlen(inputtext)) return SendClientMessage(playerid, LIGHTBLUE,"|INFO| Voce digitou mais que 24 caractres OU nao digitou nada.");
				if(!TextoNome(inputtext) && !Numero(inputtext)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode digitar caracteres especiais.");
				if(strfind(inputtext, "!", false) != -1 || strfind(inputtext, " ", false) != -1 || strfind(inputtext, ";", false) != -1 ||
				strfind(inputtext, "#", false) != -1 || strfind(inputtext, ",", false) != -1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode digitar caractres especiais.");
				SetPVarString(playerid, "nometrocar", inputtext);
				new str[144];
				format(str, sizeof(str), "{fff000}%s\n\n{33ccff}Voce digitou o nome {ffffff}%s.\n{ff0000}Deseja trocar?", nome(playerid), inputtext);
				ShowPlayerDialog(playerid, DIALOG_TROCARNOME_2, DIALOG_STYLE_MSGBOX, "{fff000}Trocando Nome", str, "Sim", "Nao");
			}
		}
		case DIALOG_TROCARNOME_2:{
		    if(!response){
				ShowPlayerDialog(playerid, DIALOG_TROCARNOME, DIALOG_STYLE_INPUT, "{fff000}Troca Nick", "{33ccff}Digite no campo a baixo o novo nick que voce deseja para sua conta.\n\
				{ff0000}OBS: Nao use caracteres especiais e nem espacos.", "Ok", "Sair");
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce voltou para a troca de nome.");
			}
			else{
			    if(PlayerInfo[playerid][Cash] < 25) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui cash suficiente.");
			    new Query[144], pegar[24], Cache: R;
			    GetPVarString(playerid, "nometrocar", pegar, sizeof pegar);
			    mysql_format(Dados, Query, sizeof(Query), "SELECT `Nome` FROM `Contas` WHERE `Nome` = '%e'", pegar);
			    R= mysql_query(Dados, Query);
			    new rows = cache_num_rows();
			    if(cache_is_valid(R) && rows) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este nome ja esta em uso.");
			    else{
				    PlayerInfo[playerid][Cash] -= 25;
				    SalvarConta(playerid);
				    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Staff` SET `Nome` = '%s' WHERE `Nome` = '%s'", pegar, nome(playerid));
				    mysql_tquery(Dados, Query);

					ChecarLider(playerid, pegar);

				    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Contas` SET Nome` = '%s' WHERE `Nome` = '%s'", pegar, nome(playerid));
				    mysql_tquery(Dados, Query);

				    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Acessorios` SET `Nome` = '%s' WHERE `Nome` = '%s'", pegar, nome(playerid));
				    mysql_tquery(Dados, Query);

				    mysql_format(Dados,Query, sizeof(Query), "UPDATE `Banco` SET `Usuario` = '%s' WHERE `Usuario` = '%s'", pegar, nome(playerid));
				    mysql_tquery(Dados, Query);

				    RenomearCasas(playerid, pegar);
				    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Mochilas` SET `Nome` = '%s' WHERE `userid` = '%d'", pegar, PlayerInfo[playerid][IDFixo]);
				    mysql_tquery(Dados, Query);

				    mysql_format(Dados,Query, sizeof(Query), "UPDATE `Habs` SET `Nome` = '%s' WHERE `Nome` = '%s'", pegar, nome(playerid));
				    mysql_tquery(Dados, Query);
				    for(new i; i<MAXCONCE; i++){
					    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Conce` SET `Nome` = '%s' WHERE `vehid` = '%d' AND `nome` = '%s'", pegar, i, nome(playerid));
					    mysql_tquery(Dados, Query);
					}
					SalvarMochila(playerid);
					new str[187];
					format(str, sizeof str, "{f07b0f}Menu Vip - {33ccff}%s acaba de trocar o nick na loja vip.", nome(playerid));
				    SendClientMessageToAll(Amarelo, str);
				    format(str, sizeof str, "|INFO| Sucesso! Voce acaba de trocar seu nome para '%s'. Relogue para poder logar com o novo nome.{ff0000} NAO ESQUECA DE TROCA-LO!!", pegar);
				    SendClientMessage(playerid, Amarelo, str);
					PC_EmulateCommand(playerid, "/menuvip");
					DeletePVar(playerid, "nometrocar");
					SetTimerEx("kickar", 1000, false, "i", playerid);
				}
				if(cache_is_valid(R))cache_delete(R);
			}
		}
		case DIALOG_MUDARNOMEINT:{
		    if(!response){
				new id = GetPVarInt(playerid, "IntCfg");
				new str[42];
				format(str, sizeof(str), "%s selecionada", IntInfo[id][NomeInterior]);
				ShowPlayerDialog(playerid, DIALOG_CFGINT, DIALOG_STYLE_LIST, str, "{33ccff}Mudar Nome\n{33ccff}Atualizar Entrada\n{33ccff}Atualizar Saida", "Ok", "Sair");
			}
			else{
			    new i = GetPVarInt(playerid, "IntCfg");
			    format(IntInfo[i][NomeInterior], 30, inputtext);
				new stru[90];
				format(stru, sizeof(stru), "{60a478}%s\n{ffffff}Aperte 'F' para entrar.\n[%d]", IntInfo[i][NomeInterior], i);
				UpdateDynamic3DTextLabelText(IntInfo[i][LabelEntrada], -1, stru);
				
				format(stru, sizeof(stru), "{60a478}%s\n{ffffff}Aperte 'F' para sair.\n[%d]", IntInfo[i][NomeInterior], i);
				UpdateDynamic3DTextLabelText(IntInfo[i][LabelSaida], -1, stru);
				
				format(stru, sizeof stru, "|INFO| Sucesso! Voce mudou o nome do interior para '%s'", IntInfo[i][NomeInterior]);
				SendClientMessage(playerid, LIGHTBLUE, stru);
			}
		}
		case DIALOG_CFGINT:{
		    if(response){
		        switch(listitem){
		            case 0:{
		                ShowPlayerDialog(playerid, DIALOG_MUDARNOMEINT, DIALOG_STYLE_INPUT, "{fff000}Mudanca De Nome", "{33ccff}Digite o novo nome que voce deseja para este local.", "Ok", "Sair");
					}
					case 1:{
					    new id = GetPVarInt(playerid, "IntCfg");
					    new Float: X, Float: Y, Float: Z;
					    GetPlayerPos(playerid, X, Y, Z);
					    IntInfo[id][IntX] = X;
					    IntInfo[id][IntY] = Y;
					    IntInfo[id][IntZ] = Z;
					    IntInfo[id][Interior] = GetPlayerInterior(playerid);
					    new str[144];
					    format(str, sizeof str, "|INFO| Sucesso ! Voce alterou a entrada da %s.", IntInfo[id][NomeInterior]);
					    SendClientMessage(playerid, LIGHTBLUE, str);
                        AttPickLabel(playerid, id);
                        SalvarInteriores(id);
					}
					case 2:{
					    //if(GetPlayerVirtualWorld(playerid) == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode definir uma entrada neste virtual world.");

					    new id = GetPVarInt(playerid, "IntCfg");
					    new Float: X, Float: Y, Float: Z;
					    GetPlayerPos(playerid, X, Y, Z);
					    IntInfo[id][IntsX] = X;
					    IntInfo[id][IntsY] = Y;
					    IntInfo[id][IntsZ] = Z;
					    new str[144];
					    format(str, sizeof str, "|INFO| Sucesso ! Voce alterou a saida da %s.", IntInfo[id][NomeInterior]);
					    SendClientMessage(playerid, LIGHTBLUE, str);
                        AttPickLabel(playerid, id);
                        SalvarInteriores(id);
					}
					case 3:{
						new i = GetPVarInt(playerid, "IntCfg");
						foreach(new p: Player){
							if(GetPlayerVirtualWorld(p) == IntInfo[i][Vw] && GetPlayerInterior(p) == IntInfo[i][Interior]){
								SetPlayerPos(p, IntInfo[i][IntsX], IntInfo[i][IntsY], IntInfo[i][IntsZ]);
								SetPlayerInterior(p, 0);
								SetPlayerVirtualWorld(playerid, 0);
							}
						}
						new str[95];
						mysql_format(Dados, str, sizeof str, "DELETE FROM `Interiores` WHERE `VirtualWorld` = '%d'", IntInfo[i][Vw]);
						mysql_tquery(Dados, str);
				        IntInfo[i][InteriorCriado] = false;
				        IntInfo[i][IntX] = 0;
				        IntInfo[i][Interior] = 0;
						IntInfo[i][Vw] = 0;
				        IntInfo[i][TipoIcon] = 0;
						Iter_Remove(B_Interiores, i);
					
						DestroyDynamic3DTextLabel(IntInfo[i][LabelEntrada]); //= CreateDynamic3DTextLabel(str, -1, X,Y,Z,30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
						DestroyDynamicPickup(IntInfo[i][PickEntrada]);
						DestroyDynamic3DTextLabel(IntInfo[i][LabelSaida]); //= CreateDynamic3DTextLabel(strru, -1, Sx,Sy,Sz,30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0 ,i);
						DestroyDynamicPickup(IntInfo[i][PickSaida]);// = CreateDynamicPickup(19132, 1, Sx,Sy,Sz, i);
						DestroyDynamicMapIcon(IntInfo[i][Icone]);
						SendClientMessage(playerid, LIGHTBLUE, "Interior deletado com sucesso.");			
					}
				}
			}
		}
		case DIALOG_AMMUNATION:{
		    if(response){
				if(GetPlayerCash(playerid) < ArmaAmmunation[listitem][Valor]){
				    PC_EmulateCommand(playerid, "/menu");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente para comprar esta arma.");
				}
				else{
				    GivePlayerCash(playerid, -ArmaAmmunation[listitem][Valor]);
				    new str[144];
				    format(str, sizeof str,"[AmmuNation] Voce comprou a arma %s pelo valor de %dR$.", ArmaAmmunation[listitem][ArmaNome], ArmaAmmunation[listitem][Valor]); 
				    SendClientMessage(playerid, Amarelo, str);
				    GivePlayerWeapon(playerid, WEAPON:ArmaAmmunation[listitem][IDArma], ArmaAmmunation[listitem][QuantiaDar]);
				    PC_EmulateCommand(playerid, "/menu");
				    //(playerid, GetPVarInt(playerid, "Menuid"), ArmaAmmunation[listitem][Valor]);
				}
			}
		}
		case DIALOG_TELEPORT_VEH:{
			if(response){
			    if(!IsPlayerInAnyVehicle(playerid)) return 1;
			    new Float: X, Float: Y, Float: Z;
			    GetPlayerPos(playerid, X, Y, Z);
			    SetVehiclePosEx(GetPlayerVehicleID(playerid), X, Y, Z+190);
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce teleportou o veiculo para cima.");
			}
		}
		case DIALOG_DEPOSITARBANCO:{
		    if(response){
				new valor = strval(inputtext);
				if(valor <= 0 || valor > GetPlayerCash(playerid)){
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Valor invalido ou voce nao tem tudo isso nas maos.");
				    PC_EmulateCommand(playerid, "/menu");
				}
				else{
				    GivePlayerCash(playerid, -valor);
					BancoInfo[playerid][Dinheiro] += valor;
					new str[144];
					format(str, sizeof str, "{fff000}[B.{33aa33}B{fff000}]{ffffff} Voce depositou %dR$ na sua conta bancaria.", valor);
					SendClientMessage(playerid, -1,str);
                    PC_EmulateCommand(playerid, "/menu");
				}
			}
			else
			    PC_EmulateCommand(playerid, "/menu");
		}
		case DIALOG_SACARBANCO:{
		    if(response){
		        new valor = strval(inputtext);
		        if(!Number(inputtext)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pode digitar somente numeros.");
		        else{
					if(valor <= 0 || valor > BancoInfo[playerid][Dinheiro]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem tudo isso na sua conta bancaria.");
					GivePlayerCash(playerid, valor);
					BancoInfo[playerid][Dinheiro] -= valor;
					new str[144];
					format(str, sizeof str, "{fff000}[B.{33aa33}B{fff000}]{ffffff} Voce sacou %dR$ de sua conta bancaria.", valor);
					SendClientMessage(playerid, -1, str);
					PC_EmulateCommand(playerid, "/menu");
				}
			}
			else
			    PC_EmulateCommand(playerid, "/menu");
		}
		case DIALOG_TERMINAR_TRANSFERENCIA:{
		    if(response){
				new id = GetPVarInt(playerid, "idtransferir"), valor = strval(inputtext);
				if(valor <= 0 || valor > BancoInfo[playerid][Dinheiro]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Valor invalido! Verifique novamente.");
				BancoInfo[playerid][Dinheiro] -= valor;
				new str[144];
				format(str, sizeof str,"|INFO| Transferencia de %dR$ feita com sucesso para a conta %04d.", valor, id);
				SendClientMessage(playerid, LIGHTBLUE, str);
				new Cache: R;
				mysql_format(Dados, str, sizeof str, "UPDATE `Banco` SET `Dinheiro` = `Dinheiro` + '%d' WHERE `userbanco` = '%d'",
					valor, id);
				mysql_tquery(Dados, str);
				mysql_format(Dados, str, sizeof str, "SELECT `Usuario` FROM `Banco` WHERE `userbanco` = '%d'", id);
				R = mysql_query(Dados, str);
				new rows = cache_num_rows();
				if(cache_is_valid(R) && rows){
					new user[24];
					cache_get_value_name(0, "Usuario", user, 24);
					if(GetPlayer_id(user, id)){	
						format(str, sizeof str, "|INFO| Voce recebeu uma transferencia de %dR$ de %s.", valor, nome(playerid));
						SendClientMessage(id, LIGHTBLUE, str);
						BancoInfo[id][Dinheiro] += valor;
					}
				}
				if(cache_is_valid(R))cache_delete(R);
			}
			else{
			    DeletePVar(playerid, "idtransferir");
			}
		}
		case DIALOG_TRANSFERIR:{
		    if(response){
		        if(!Number(inputtext)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pode digitar somente numeros.");
                new id = strval(inputtext);
                if(!PossuiContaNumeroBanco(id)) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou uma conta de banco inexistente.");
		        if(id == BancoInfo[playerid][userbanco]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode transferir o dinheiro para voce mesmo.");
				SetPVarInt(playerid, "idtransferir", id);
				new str[144];
				format(str, sizeof(str), "{fff000}[B.{33AA33}B{fff000}]\n\nDigite a quantia que voce deseja transferir para a conta %04d.", GetPVarInt(playerid, "idtransferir"));
				ShowPlayerDialog(playerid, DIALOG_TERMINAR_TRANSFERENCIA, DIALOG_STYLE_INPUT, "{fff000}Transferencia De Dinheiro", str, "Select", "Sair");
				return 1;
			}
			else{
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce dessistiu da transferencia.");
			    DeletePVar(playerid, "idtransferir");
			}
		}
		case DIALOG_RETORNARBANCO:{
			if(response)
				PC_EmulateCommand(playerid, "/menu");
			else
				PC_EmulateCommand(playerid, "/menu");
		}
		case DIALOG_BUSCAR_CONTA:{
			if(response){
				SendClientMessage(playerid, LIGHTBLUE, "{fff000}[B.{33AA33}B{fff000}]{ffffff} Buscando conta...");
				new Cache: R, var[128];
				mysql_format(Dados, var, sizeof var, "SELECT * FROM `Banco` WHERE `Usuario` = '%e' LIMIT 1;", inputtext);
				R = mysql_query(Dados, var);
				if(cache_num_rows()){ 
					Sleep(4);
					SendClientMessage(playerid, LIGHTBLUE, "{fff000}[B.{33AA33}B{fff000}]{ffffff} Conta Encontrada!");
					new name[MAX_PLAYER_NAME];
					TogglePlayerControllableEx(playerid, true);
					cache_get_value_name(0, "Usuario",name, sizeof name);
					ShowPlayerDialog(playerid, DIALOG_RETORNARBANCO, DIALOG_STYLE_MSGBOX, "{fff000}[B.{33AA33}B{fff000}]{ffffff}Conta Encontrada!", "{fff000}Usuario: %s\n{fff000}Numero da conta: %04d", "Finalizar", #, inputtext, cache_return_int(0, "userbanco"));
				}
				else
					ShowPlayerDialog(playerid, DIALOG_RETORNARBANCO, DIALOG_STYLE_MSGBOX, "{fff000}[B.{33AA33}B{fff000}]{ffffff}Conta nao encontrada!", "{ff0000}Verifique se o nome do usuario foi digitado corretamente.", "Ok", #);
				
				if(cache_is_valid(R))cache_delete(R);
			}
			else{
				PC_EmulateCommand(playerid, "/menu");
			}
		}
		case DIALOG_CAIXABANCO:{//
			if(!PossuiContaBanco(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "Crie uma conta no banco para usar o caixa!");
		    if(response){
		        switch(listitem){
		            case 0: ShowPlayerDialog(playerid, DIALOG_DEPOSITARBANCO, DIALOG_STYLE_INPUT, "{ff0000}Opcao Deposito", "{fff000}[B.{33AA33}B{fff000}]\n\nDigite o valor do deposito no campo a seguir.","Ok", "Sair");
                    case 1: ShowPlayerDialog(playerid, DIALOG_SACARBANCO, DIALOG_STYLE_INPUT, "{ff0000}Opcao Saque", "{fff000}[B.{33AA33}B{fff000}]\n\nDigite o valor do saque no campo a seguir.","Ok", "Sair");
					case 2: ShowPlayerDialog(playerid, DIALOG_TRANSFERIR, DIALOG_STYLE_INPUT, "{fff000}Opcao Transferencia","{fff000}[B.{33AA33}B{FFF000}]\n\nDigite o numero da conta no campo a baixo que voce deseja transferir o dinheiro.", "Select", "Sair");
					case 3:{
						if(PlayerInfo[playerid][DinheiroPD] < 1){
							SendClientMessage(playerid, LIGHTBLUE, "Voce nao tem dinheiro para receber.");
						}
						else
							ShowPlayerDialog(playerid, DIALOG_SACARSALARIOBANCO, DIALOG_STYLE_MSGBOX, "{33ccff}# Salario", fString("{33ccff}%s, voce possui %dR$ para sacar de seu salario.\n{ff0000}Deseja Sacar?", nome(playerid), PlayerInfo[playerid][DinheiroPD]), "Sim", "Retornar");
					}
					case 4:{
						new str[144];
						format(str, sizeof str,"{fff000}[B.{33AA33}B{FFF000}]\n\n\
						{ffffff}Voce possui um total de %dR$ em sua conta bancaria.", BancoInfo[playerid][Dinheiro]); 
					    SendClientMessage(playerid, -1, str);
					    MostrarDialogCaixa(playerid, 2);
					}
					case 5:{
						TogglePlayerControllableEx(playerid, false);
						ShowPlayerDialog(playerid, DIALOG_BUSCAR_CONTA, DIALOG_STYLE_INPUT, "{fff000}[B.{33AA33}B{FFF000}] Consulta", "{fff000}[B.{33AA33}B{FFF000}]\nDigite o nome do usuario que voce deseja obter o numero da conta:", "Ok","Retornar");
					}
				}
			}
		}
		case DIALOG_MERCADO_NEGRO:{
		    if(response){
		        if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
				switch(listitem){
				    case 0:{
				        if(GetPlayerCash(playerid) < 7000) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
				        GivePlayerCash(playerid, -7000);
				        AdicionarItem(playerid, DINAMITE, 1);
				        SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce comprou uma DINAMITE por 7000R$.");
					}
					case 1:{
						ShowPlayerDialog(playerid, DIALOG_COMPRAR_MACONHA, DIALOG_STYLE_INPUT, "{fff000}# Maconha", "{33ccff}Digite no campo abaixo o total de gramas que voce quer.\n{ff0000}OBS: 5$ por grama.", "Comprar", "back");
					}
					case 2:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						if(GetPlayerCash(playerid) < 1200) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
						GivePlayerCash(playerid, -1200);
						AdicionarItem(playerid, LOCKPICK, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um Lock Pick para quebrar trancas.");						
						PC_EmulateCommand(playerid, "/menu");
					}
					case 3:{
						if(GetPlayerCash(playerid) < 1500) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao tem dinheiro suficiente.");
						//if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao possui mochila.");
						GivePlayerCash(playerid, -1500);
						SetPlayerArmour(playerid, 120);
						SendClientMessage(playerid, LIGHTBLUE, "Voce comprou um colete com 120 de protecao.");
						PC_EmulateCommand(playerid, "/menu");
					}
				}
			}
		}
		case DIALOG_COMPRAR_MACONHA:{
			if(response){
				if(!Number(inputtext)){
					ShowPlayerDialog(playerid, DIALOG_COMPRAR_MACONHA, DIALOG_STYLE_INPUT, "{fff000}# Maconha","{33ccff}Digite no campo abaixo o total de gramas que voce quer.\n{ff0000}OBS: 5$ por grama.", "Comprar", "retornar");
					SendClientMessage(playerid, LIGHTBLUE, "* Digite somente numeros.");
				}
				else{
					new conta = strval(inputtext) * 5;
					if(GetPlayerCash(playerid) < conta){
						ShowPlayerDialog(playerid, DIALOG_COMPRAR_MACONHA, DIALOG_STYLE_INPUT, "{fff000}# Maconha" ,"{33ccff}Digite no campo abaixo o total de gramas que voce quer.\n{ff0000}OBS: 5$ por grama.", "Comprar", "retornar");
						SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");						
					}
					else{
						AdicionarItem(playerid, MACONHA, strval(inputtext));
						GivePlayerCash(playerid, -conta);
						new str[98];
						format(str, sizeof(str), "* Voce comprou %d gramas por %dR$", strval(inputtext), conta);
						SendClientMessage(playerid, VerdeSamp, str);
						PC_EmulateCommand(playerid, "/menu");
					}
				}
			}
			else{
				PC_EmulateCommand(playerid, "/menu");
			}
		}
		case DIALOG_EQUIPARSKIN:{
		    if(response){
		    	new str[80];
		    	if(listitem != 7){
			    	format(str,sizeof str, "* %s acaba de se equipar.", nome(playerid));
			    	MensagemLocal(50.0, playerid, Roxoeu, str, false);
			    }
		        switch(listitem){
          			case 0: SetPlayerSkin(playerid, 280);
			    	case 1: SetPlayerSkin(playerid, 284);
			    	case 2: SetPlayerSkin(playerid, 285);
			    	case 3: SetPlayerSkin(playerid, 286);
		     		case 4: SetPlayerSkin(playerid, 287);
     				case 5: SetPlayerSkin(playerid, 288);
			    	case 6: SetPlayerSkin(playerid, 306);
			    	case 7:{
			    		if(!Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta fardado.");
			    		SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				    	format(str,sizeof str, "* %s tirou sua farda.", nome(playerid));
				    	MensagemLocal(50.0, playerid, Roxoeu, str, false);			    		
			    	}
				}
			}
		}
		case DIALOG_CONFIRMAR_TODOS:{
		    if(response){
		        new Query[128];
		        mysql_format(Dados, Query, sizeof(Query), "UPDATE `Contas` SET `Org` = '0', `Cargo` = '0' WHERE `Org` = '%d' AND `Nome` != '%s'", PlayerInfo[playerid][Org], nome(playerid));
	            mysql_tquery(Dados, Query);
				foreach(new p: Player){
				    if(p != playerid && PlayerInfo[p][Org] == PlayerInfo[playerid][Org]){
				        SendClientMessage(p, LIGHTBLUE, "|INFO| Todos os membros foram demitidos desta organizacao.");
				        PlayerInfo[p][Org] = 0;
				        PlayerInfo[p][Cargo] = 0;
						SpawnPlayer(p);
					}
				}
				OrgInfo[PlayerInfo[playerid][Org]][Vagas] = 30;
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sucesso ! Todos os membros da organizacao foram demitidos.");
				//AtualizarOrganizacoes();
			}
		}
		case DIALOG_SAQUE:{
		    if(response){
		        new i = GetPVarInt(playerid, "caixauso"), valor = strval(inputtext);
		        if(!Number(inputtext) || InfoCaixa[i][CaixaGrana] < valor){
		            new str[128];
		            format(str, sizeof(str), "|INFO| Este caixa possui %dR$ disponivel para saque.", InfoCaixa[i][CaixaGrana]);
		            SendClientMessage(playerid, LIGHTBLUE, str);
				}
				else{
					if(valor <= 0 || valor > BancoInfo[playerid][Dinheiro]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem tudo isso na sua conta bancaria.");
					GivePlayerCash(playerid, valor);
					InfoCaixa[i][CaixaGrana] -= valor;
					BancoInfo[playerid][Dinheiro] -= valor;
					new str[144];
					format(str, sizeof str, "{fff000}[B.{33aa33}B{fff000}]{ffffff} Voce sacou %dR$ de sua conta bancaria.", valor);
					SendClientMessage(playerid, -1, str);
                	MostrarDialogCaixa(playerid);
				}
			}
			else
			    MostrarDialogCaixa(playerid);
		}
		case DIALOG_DEPOSITAR:{
		    if(response){
				new i = GetPVarInt(playerid, "caixauso"), valor = strval(inputtext);
				if(valor <= 0 || valor > GetPlayerCash(playerid)){
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Valor invalido ou voce nao tem tudo isso nas maos.");
				    MostrarDialogCaixa(playerid);
				}
				else{
				    GivePlayerCash(playerid, -valor);
				    InfoCaixa[i][CaixaGrana] += valor;
					BancoInfo[playerid][Dinheiro] += valor;
					new str[144];
					format(str, sizeof str, "{fff000}[B.{33aa33}B{fff000}]{ffffff} Voce depositou %dR$ na sua conta bancaria.", valor);
					SendClientMessage(playerid, -1,str);
                    MostrarDialogCaixa(playerid);
				}
			}
			else
			    MostrarDialogCaixa(playerid);
		}
		case DIALOG_SACARSALARIO:{
			if(response){
				if( (Tempopayday - gettime()) < 10 ){
					SendClientMessage(playerid, LIGHTBLUE, "Falta menos de 10 segundos para voce receber o salario por PayDay. Aguarde!");
				}
				else if(InfoCaixa[GetPVarInt(playerid, "caixauso")][CaixaGrana] < PlayerInfo[playerid][DinheiroPD]){
					SendClientMessage(playerid, LIGHTBLUE, "Este caixa nao possui dinheiro para ser sacado. Procure outro!");
				}
				else{
					GivePlayerCash(playerid, PlayerInfo[playerid][DinheiroPD]);
					InfoCaixa[GetPVarInt(playerid, "caixauso")][CaixaGrana] -= PlayerInfo[playerid][DinheiroPD];
					PlayerInfo[playerid][DinheiroPD] = 0;
					SendClientMessage(playerid, VerdeSamp, "Voce sacou o dinheiro de seu trabalho.");
				}
			}
			else
				MostrarDialogCaixa(playerid);
		}
		case DIALOG_SACARSALARIOBANCO:{
			if(response){
				if( (Tempopayday - gettime()) < 10 ){
					SendClientMessage(playerid, LIGHTBLUE, "Falta menos de 10 segundos para voce receber o salario por PayDay. Aguarde!");
				}
				else{
					GivePlayerCash(playerid, PlayerInfo[playerid][DinheiroPD]);
					PlayerInfo[playerid][DinheiroPD] = 0;
					SendClientMessage(playerid, VerdeSamp, "Voce sacou o dinheiro de seu trabalho.");
				}
			}
			else
				MostrarDialogCaixa(playerid, 2);
		}
		case DIALOG_CAIXA:{
			if(!PossuiContaBanco(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "Crie uma conta no banco para usar o caixa!");
		    if(response){
		        switch(listitem){
		            case 0:{
		                ShowPlayerDialog(playerid, DIALOG_SAQUE, DIALOG_STYLE_INPUT, "{fff000}Opcao Saque", "{fff000}Digite a baixo o valor da quantia para saque.", "Sacar", "Sair");
					}
					case 1:{
					    ShowPlayerDialog(playerid, DIALOG_DEPOSITAR, DIALOG_STYLE_INPUT, "{fff000}Opcao Deposito", "{fff000}Digite a baixo o valor da quantia do deposito.", "Depositar", "Sair");
					}
					case 2:{
					    new str[144];
					    format(str, sizeof(str), "{fff000}%s\n\n{33ccff}Este caixa possui um total de %dR$ para saque.\nVoce possui %dR$ na conta bancaria para sacar.",nome(playerid), InfoCaixa[GetPVarInt(playerid, "caixauso")][CaixaGrana], BancoInfo[playerid][Dinheiro]);
					    ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{ff0000}Extrato", str, "{33aa33}Certo", "");
						DeletePVar(playerid, "caixauso");
					}
					case 3:{
						if(PlayerInfo[playerid][DinheiroPD] < 1){
							SendClientMessage(playerid, LIGHTBLUE, "Voce nao tem dinheiro para receber.");
							MostrarDialogCaixa(playerid);
						}
						else
							ShowPlayerDialog(playerid, DIALOG_SACARSALARIO, DIALOG_STYLE_MSGBOX, "{33ccff}# Salario", fString("{33ccff}%s, voce possui %dR$ para sacar de seu salario.\n{ff0000}Deseja Sacar?", nome(playerid), PlayerInfo[playerid][DinheiroPD]), "Sim", "Retornar");
					}
					case 4:{
					    if(NaMao[playerid] != DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa pegar a DINAMITE na mao.");
						if(InfoCaixa[GetPVarInt(playerid, "caixauso")][CaixaQuebrado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este caixa esta quebrado.");
						if(PlantandoCaixa[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta plantando uma bomba.");
						if(Tempocaixa >= gettime()) return SendClientMessage(playerid, LIGHTBLUE, fString("* Aguarde %s para roubar um caixa.", Convert(Tempocaixa - gettime())));
						if(!MembrosPerto(playerid, 2)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de mais um membro para roubar o caixa.");
						if(!PoliciaisOnline(3)) return SendClientMessage(playerid, LIGHTBLUE, "* Precisa de mais policiais online para fazer esta acao.");
						PC_EmulateCommand(playerid, "/anim");
						TogglePlayerControllableEx(playerid, false);
                        ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
                        new caixa = GetPVarInt(playerid, "caixauso");
                        NaMao[playerid] = 0;
                        PlantandoCaixa[playerid] = true;
						new Float: X, Float: Y, Float: Z;
						GetPlayerPos(playerid, X, Y, Z);
                        GameTextForPlayer(playerid, "~R~Plantando DINAMITE", 12000, 1);
                        TimePlantarBomba[playerid] = SetTimerEx("preparandobomba", 12000, false, "ii", playerid, caixa);
                        SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+3);
                        Tempocaixa = gettime() + ( 60 * 20);
			  		    new str[128];
			  		    format(str, sizeof str, "AVISO: %s esta roubando o caixa de %s. Marcado em seu mapa.", nome(playerid), CoordZone(X,Y,Z));
			  		    foreach(new i: Player){
					        if(IsPolice(PlayerInfo[i][Org])){					   
								SendClientMessage(i, LIGHTBLUE, str);
								SetPlayerCheckpoint(i, X, Y, Z, 3.5);
							}
						}
						AdminMessage(Rosa, str);
						SendClientMessageToAll(LIGHTBLUE, fString("* Um Caixa esta sendo Roubado em %s.", CoordZone(X, Y, Z)));
					}
				}
			}
			else
			    DeletePVar(playerid, "caixauso");
		}
		case DIALOG_DELETECAIXA:{
		    if(response){
		        new Query[70], i = GetPVarInt(playerid, "caixaid");
		        mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Caixas` WHERE `caixaid` = '%d'", i);
		        mysql_tquery(Dados, Query);
		        DestroyDynamicObject(InfoCaixa[i][ObjetoCaixa]);
		        DestroyDynamic3DTextLabel(InfoCaixa[i][CaixaTexto]);
		        InfoCaixa[i][CaixaCriado] = false;
		        Iter_Remove(B_Caixas, i);
		        SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Caixa foi deletado com sucesso.");
		        DeletePVar(playerid, "caixaid");
			}
			else
			    ShowPlayerDialog(playerid, DIALOG_CFGRCAIXA, DIALOG_STYLE_LIST, "{fff000}Configurar Caixa", "{33ccff}Editar Posicao\nDeletar", "Ok", "Sair");
		}
		case DIALOG_CFGRCAIXA:{
		    if(response){
				switch(listitem){
				    case 0:{
				        new id = GetPVarInt(playerid, "caixaid");
						if(EditandoCaixa[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta editando um caixa.");
						if(!InfoCaixa[id][CaixaCriado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o id de um caixa que nao foi criado.");
						if(!ISP(playerid, 10.0, InfoCaixa[id][CaixaX], InfoCaixa[id][CaixaY], InfoCaixa[id][CaixaZ])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar ate 10 metros do caixa.");
						EditDynamicObject(playerid, InfoCaixa[id][ObjetoCaixa]);

						SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce comecou a editar este caixa.");
						EditandoCaixa[playerid] = true;
					}
					case 1:{
						new str[128];
						format(str, sizeof(str), "{fff000}%s\n\n{33ccff}Tem certeza de que deseja deletar o caixa{ff0000} %d?", nome(playerid), GetPVarInt(playerid, "caixaid"));
						ShowPlayerDialog(playerid, DIALOG_DELETECAIXA, DIALOG_STYLE_MSGBOX, "{fff000}Aviso", str, "{33aa33}Sim", "{ff0000}Nao");
					}
					case 2:{
					    foreach(new i: B_Caixas){
					        if(InfoCaixa[i][CaixaCriado]){
								InfoCaixa[i][CaixaGrana] = 50000;
							}
						}
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| Todos os caixas foram recarregados de dinheiro, esta funcao ??© util enquanto nao tiver o emprego de Carro Forte.");
					}
				}
			}
			else
			    DeletePVar(playerid, "caixaid");
		}
		case DIALOG_SELECIONAR_GPSPUBLICO:{
		    if(response){
		        new contagem = 0, slot = -1;
      			for(new i; i<MAX_GPS_LOCAL; i++){
         			if(GpsInfo[i][LocalCriado] && GpsInfo[i][LocalTipo] == GetPVarInt(playerid, "slotzin"))
         			{
	     				if(contagem == listitem){
	     				    slot = listitem;
	     				    listitem = i;
	            		    break;
						}
						else
							contagem ++;
					}
				}
				if(slot == -1) return SendClientMessage(playerid, LIGHTBLUE,"|INFO| Localizacao invalida.");
	            SetPlayerCheckpoint(playerid, GpsInfo[listitem][LocalX],GpsInfo[listitem][LocalY],GpsInfo[listitem][LocalZ], 3.0);
	            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este local foi marcado no seu minimapa.");
	            DeletePVar(playerid, "slotzin");
			}
		}
		case DIALOG_GPS:{ //"{33ccff}Locais Publicos\n{33ccff}Bases De Organizacoes\n{33ccff}Locais De Empregos\n{33ccff}Outros"
			if(response){
			    SetPVarInt(playerid, "slotzin", listitem+1);
			    switch(listitem){
			        case 0..6:{
			            new str[1000];
			            strcat(str, "{33aa33}Local\t{33aa33}Distancia\n");
			            for(new i; i<MAX_GPS_LOCAL; i++){
			                if(GpsInfo[i][LocalCriado] && GpsInfo[i][LocalTipo] == GetPVarInt(playerid, "slotzin")){
				                listitem = i;
				                new str2[67];
			                    format(str2, sizeof(str2), "{33ccff}%s\t{ffffff}%0.2fm\n", GpsInfo[i][LocalName], GetPlayerDistanceFromPoint(playerid, GpsInfo[i][LocalX],GpsInfo[i][LocalY],GpsInfo[i][LocalZ]));
			                    strcat(str, str2);
							}
						}
						ShowPlayerDialog(playerid, DIALOG_SELECIONAR_GPSPUBLICO, 5, "{fff000}Locais Disponiveis", str, "Ok", "Sair");
					}
				}
			}
		}
		case DIALOG_EMPREGOS:{
		    if(response){
		    	if(TrabalhandoEmprego[playerid][PlayerInfo[playerid][Emprego]]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa sair do modo de trabalho.");
		        switch(listitem){
		            case 0:{
		                if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta em um emprego.");
		                SetPlayerCheckpoint(playerid,  -357.2361,-454.2185,6.9756, 3.0);
		                SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu mapa.");
					}
					case 1:{
					    if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta em um emprego.");
					    SetPlayerCheckpoint(playerid, -424.6707,-1763.9119,7.4376, 3.0);
					    SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu mapa.");
					}
					case 2:{
						if(PlayerInfo[playerid][Nivel] < 4 || CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui carteira de carro ou nao tem nivel suficiente.");
					    if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta em um emprego.");
					    SetPlayerCheckpoint(playerid, -438.9700,-1757.5052,7.4376, 3.0);
					    SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu mapa.");
					}
					case 3:{
						if(CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de carteira de motorista para usar este emprego.");
					    if(PlayerInfo[playerid][Nivel] < 8) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de no minimo nivel 8.");
					    if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta em um emprego.");
					    SetPlayerCheckpoint(playerid, 2421.0293,-2101.2983,13.5538, 3.0);
					    SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu mapa.");
					}
					case 4:{
						if(CarteiraInfo[playerid][Carro] == 0 || PlayerInfo[playerid][Nivel] < 2) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de carteira de motorista e nivel 2 para usar este emprego.");
					    if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta em um emprego.");
					    SetPlayerCheckpoint(playerid, 1709.5602,924.0325,-8.6412, 3.4);
					    SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu mapa.");
					}
					case 5:{
						if(PlayerInfo[playerid][Nivel] < 6 || CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de nivel 2 e carteira de motorista.");
						if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta em um emprego.");
						SetPlayerCheckpoint(playerid, 1832.1105,-1446.1182,13.5930, 3.2);
						SendClientMessage(playerid, LIGHTBLUE,"|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 6:{
						if(PlayerInfo[playerid][Nivel] < 2) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de no minimo nivel 3 para usar este emprego.");
						if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						SetPlayerCheckpoint(playerid, -371.35501, -1436.94507, 25.65495, 2.0);
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 7:{
						if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						if(CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui carteira de Motorista.");
						SetPlayerCheckpoint(playerid, 595.9457,-1514.7836,15.4952, 2.3);
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 8:{
						if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						if(CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui carteira de Motorista.");
						if(PlayerInfo[playerid][Nivel] < 7) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem nivel 7 ou maior.");
						SetPlayerCheckpoint(playerid,  1183.25842, -1316.67725, 13.55144, 2.3);//medic
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 9:{
						if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						if(PlayerInfo[playerid][Nivel] < 2) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem nivel 2 ou maior.");
						SetPlayerCheckpoint(playerid,  -1644.03650, -2231.24292, 29.53947, 4.0);//cacadorE
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 10:{
						if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						if(PlayerInfo[playerid][Nivel] < 9) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem nivel 9 ou maior.");
						if(CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem carteira de motorista!");

						SetPlayerCheckpoint(playerid,  -1046.7114, -585.7683, 32.2494, 4.0);//parte comb1
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 11:{
					    if(PlayerInfo[playerid][Emprego] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao faz parte de nenhum emprego.");
						if(TrabalhandoEmprego[playerid][PlayerInfo[playerid][Emprego]]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa sair de trabalho para se demitir.");
						PlayerInfo[playerid][Emprego] = 0;
					    //GivePlayerCash(playerid, -350);
					    SendClientMessage(playerid, VerdeSamp, "|INFO| Voce saiu do seu antigo emprego.");
					    FalharNaMadeira(playerid);
					    FalharNaPesca(playerid);
					    FalharCarregando(playerid);
					    FalharCarregandoCaminhao(playerid);
					    CheckVehEmp(playerid);
					}
				}
			}
		}
		case DIALOG_VENDERPEIXES:{
			if(response){
		        PlayerInfo[playerid][DinheiroPD] += (40 * Peixes[playerid]);
		        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce vendeu os peixes com sucesso, seu PayDay foi aumentado.");
				Peixes[playerid] = 0;
				GameTextForPlayer(playerid, "~B~Pay Day aumentado!", 2000, 3);
			}
		}
		case DIALOG_AJUDAGERAL:{
			if(response){
				Trigger(playerid, RETORNAR_AJUDA);

				switch(listitem){
					case 0: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Comandos Uteis", "{33ccff}/carteira /mostrarcarteira /orgs /render /deitar /relatorio /mochila /pagar /anim /guardar ", "Ok", "");
					case 1:{
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Comandos Organizacoes", "{33ccff}[Corps]\n\n\
						/autuar /prender /rilegal /consultarplaca /ar /tabelamulta /tabelaau /multar /revistar /revistarmochila /algemar /d /repararcaixa\n\n{ff0000}[Faccoes]\n\n\
						/dinamitar /explodir /roubarcf /seq /menucontrato /descarregareqs /roubarcofre /roubarcf\n\n{ffffff}[Padroes]\n\n\
						/r /orgs /gov /dominar /demitir /demitirtodos /convidar", "ok", #);
					}
					case 2:{
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Pagina 2", "{33ccff}Comandos De Orgs/corps\n\
							{ffffff}[Padroes]\n/membros /tirarporte /darporte /membrosoff /bloqueio\n/procurados /ativartaser /rbloqueios /medemitir /colocarsaco\n/configurarsalario /dominios /estoqueorg /convidar /promover /demitiroff", "Ok", #);
					}
				    case 3:{
				        switch(PlayerInfo[playerid][Emprego]){
				        	case PESCADOR: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Pescador", "{33ccff}/Jogarrede\n{33ccff}/dpeixes\n/{33ccff}/trabalhar\n{33aa33}Spawne o barco na frente de onde pega o emprego.", "Ok", "");
							case MADEIREIRO: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Madeireiro", "{33ccff}/carvore\n{33ccff}/dmadeiras\n{33ccff}/trabalhar\n{33ccff}Voce precisa ter 6 madeiras para poder entregalas.", "Ok", #);
							case TRANSPORTADORM: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Transportador De M.", "{33ccff}/carregarm\n/{33ccff}descarregarm\n/trabalhar\n{33ccff}Spawne o veiculo do lado da casa de madeira.", "Ok", #);
							case TRANSP_ARMA: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Transp. De Armas", "{33ccff}/carregarc\n{33ccff}/pegarcarga\n/{33ccff}descarregarc\n/trabalhar\n{33ccff}Spawne o veiculo na frente de onde pega o emprego.", "Ok", #);
							case CARRO_FORTE: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Carro Forte", "{33ccff}/caixa\n{33ccff}/pegardinheiro\t/descarregar\\t/trabalhar\n{33aa33}Spawne o Caminhao na frente do Hq.\n{33ccff}Aperte 'Y' atras do carro forte para carrega-lo.", "Ok", #);
							case MECANICO: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "Emprego De Mecanico", "{33ccff}/chamados\t/trabalhar\t/menuconserto\t/mecmenu\t/meusitens\n{33aa33}Spawne o Caminhao dentro do Hq.", "Ok", #);
							case LEITEIRO: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX,"Emprego De LEITEiro", "{33ccff}/trabalhar\t/tirarLEITE\t/venderLEITE\n{{33ccff}Voce pode vender o LEITE para o Eric Do LEITE na fazenda, ou, em um 24/7.","Ok", #);
							case TAXISTA: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "Emprego De Taxista", "{33ccff}/trabalhar\t/iniciartaximetro\t/parartaximetro\n/resetartaximetro\t/chamados\nNao precisa cobrar necessariamente o valor que o taximetro mostra.", "Ok", #);						
							case SAMU:	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "Emprego De Taxista", "{33ccff}/trabalhar\t/reanimar\t/chamados", "Ok", #);
							case CACADOR:	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "Emprego De Cacador", "{33ccff}/trabalhar\t/pegarcouro\t/venderc", "Ok", #);
							case TRANSP_COMBUSTIVEL: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "Emprego De T. Combustivel", "{33ccff}/trabalhar\t/abastecerc\t/dcombus", "Ok", #);
						}
					}
					case 4:{
						if(PlayerInfo[playerid][Vip] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser vip para ver esta aba.");
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Vantagens Vip", "{33ccff}/reparar\n/pegarsalario\n/skin\n/cv(chat vip)\n/an(anuncio vip)\n/abastecervip\nMais Espaco na Mochila.\nMais espaco no porta malas.\nVips podem ter 5 casas e 3 carros na conce.\nO Salario por payday e aumentado 10 por cento.\n", "Ok", "Sair");
					}
					case 5:{
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, 
							"{FF0000}# Comandos Carros", "{33ccff}/portamala [abrir/fechar]\n{ff0000}OBS: Os itens podem ser roubados, sempre mantenha fechado!\n{33ccff}Para trocar a cor de um veiculo va ao mecanico.\n\
							{33ccff}/menucar\n/menualuguel", "Ok", #);
					}
					case 6:{
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, 
							"{FF0000}# Comandos Carros", "{33ccff}/plantarSEMENTE\n{33ccff}/colherplanta\n{33ccff}/pegarcomponente\n\
							{33ccff}/criarsemente", "Ok", #);						
					}
					case 7:{
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{33ccff}# Response", "{fff000}Comandos Uteis para casas:\n\n/comprarcasa/vendercasa [ valor ] /cofrecasa /despejar /gpscasa\n/definiraluguel /alugar /desalugar /listamoradores /trancarcasa\n\n{ff0000}Mais comandos para vir!", "ok", #);
					}
				}
			}
		}
		case DIALOG_COMPRARROUPA:{
		    if(response){
				if(!Number(inputtext)){
				    PC_EmulateCommand(playerid, "/menu");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Digite o ID da roupa.");
				}
				new id = strval(inputtext);
				if(id == 217){
				    PC_EmulateCommand(playerid, "/menu");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Selecione outra skin.");
				}
				if(id > 0 && id < 311)
				{
				    SetPlayerSkin(playerid, id);
				    PlayerInfo[playerid][Skin] = id;
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce comprou a skin com sucesso.");
					GivePlayerCash(playerid, -329);
					//(playerid, GetPVarInt(playerid, "Menuid"), 329); //vendaaq
				}
				else{
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Escreva o ID de uma skin valido.");
					PC_EmulateCommand(playerid, "/menu");
				}
			}
		}
		case DIALOG_HABS:{
		    if(response){
		        switch(listitem){
			        case 0:{
			            if(GetPlayerCash(playerid) < 1700){
			                PC_EmulateCommand(playerid, "/menu");
			                SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
						}
						else{
						    if(CarteiraInfo[playerid][Carro] == 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja tem carteira de motorista");
						    if(EmTeste[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Fale com o programador, algum bug aconteceu.");
						    SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][IDFixo]);
						    EmTeste[playerid] = true;
						    VeiculoHab[playerid] = -1;
						    VeiculoHab[playerid] = CriarVeiculo("teste cnh", 419, -2040.6221, -99.1940, 34.5386, 0.0000, -1, -1, -1);
					
							SetVehicleVirtualWorld(VeiculoHab[playerid], PlayerInfo[playerid][IDFixo]);
							PutPlayerInVehicle(playerid, VeiculoHab[playerid], 0);
							SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce iniciou o teste de Habilitacao De Veiculo. Va ate a marca sem danificar MUITO o veiculo.");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");

					        CheckCarro[playerid] = CreateDynamicCP(-2544.8076, 659.3400, 26.8100, 4.0, PlayerInfo[playerid][IDFixo], 0, playerid, 3000);
							SetPlayerInterior(playerid, 0);
							GivePlayerCash(playerid, -1700);
							//(playerid, GetPVarInt(playerid, "Menuid"), 1700);
						}
					}
			        case 1:{
			            if(GetPlayerCash(playerid) < 1500){
			                PC_EmulateCommand(playerid, "/menu");
			                SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
						}
						else{
						    if(CarteiraInfo[playerid][Moto] == 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja tem carteira de motorista");
						    if(EmTeste[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Fale com o programador, algum bug aconteceu.");
						    SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][IDFixo]);
						    EmTeste[playerid] = true;
						    VeiculoHab[playerid] = -1;
						    VeiculoHab[playerid] = CriarVeiculo("teste cnh", 468, -2040.6221, -99.1940, 34.5386, 0.0000, -1, -1, -1);
							SetVehicleVirtualWorld(VeiculoHab[playerid], PlayerInfo[playerid][IDFixo]);
							PutPlayerInVehicle(playerid, VeiculoHab[playerid], 0);
							SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce iniciou o teste de Habilitacao De Moto. Va ate a marca sem danificar MUITO o veiculo.");
							//SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce iniciou o teste de Habilitacao De Veiculo. Va ate a marca sem danificar MUITO o veiculo.");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
                            SendClientMessage(playerid,Amarelo, "[Aviso]: Nao ultrapasse 65KM/H!");
							CheckMoto[playerid] = CreateDynamicCP(-2544.8076, 659.3400, 26.8100, 4.0, PlayerInfo[playerid][IDFixo], 0, playerid, 3000);
							SetPlayerInterior(playerid, 0);
							GivePlayerCash(playerid, -1500);
							//(playerid, GetPVarInt(playerid, "Menuid"), 1500);
						}
					}
					case 2:{
					    if(GetPlayerCash(playerid) < 8900){
							PC_EmulateCommand(playerid, "/menu");
							SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
						}
						else{
						    if(CarteiraInfo[playerid][Aviao] == 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui esta carteira.");
						    SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][IDFixo]);
						    EmTeste[playerid] = true;
						    VeiculoHab[playerid] = -1;
						    VeiculoHab[playerid] = CriarVeiculo("teste cnh", 593, 2092.8582, -2461.4937, 14.1080, 90.0000, -1, -1, -1);
							SetVehicleVirtualWorld(VeiculoHab[playerid], PlayerInfo[playerid][IDFixo]);
							PutPlayerInVehicle(playerid, VeiculoHab[playerid], 0);
							SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce iniciou o teste de Habilitacao De Aviao.");
							CheckAviao[playerid] = CreateDynamicCP(324.9785, 2542.4653, 17.3530, 4.0, PlayerInfo[playerid][IDFixo], 0, playerid, 6000);
							SetPlayerInterior(playerid, 0);
							GivePlayerCash(playerid, -8900);
							//(playerid, GetPVarInt(playerid, "Menuid"), 8900);
						}
					}
				}
			}
		}
		case DIALOG_VERCARTEIRA:{
		    if(response){
		    	new id = GetPVarInt(playerid, "idrgP");
				switch(listitem){
				    case 0: ShowVerRg(id, playerid);
				    case 1:{
				        new str[128];
				        format(str, sizeof(str), "{33ccff}Todas carteiras de habilitacao.\n\n{ffffff}Carro %s\n{ffffff}Moto %s\n{ffffff}Aviao %s", PegarCarteira(id, 1), PegarCarteira(id, 2), PegarCarteira(id, 3));
				        ShowPlayerDialog(playerid, DIALOG_VERRG_CARTEIRA, DIALOG_STYLE_MSGBOX, "{fff000}Habilitacoes", str, "Ok", "");
					}
				}
			}
		}
		case DIALOG_INFO_VERRG:{
			if(!response || response){
				new str[169], id = GetPVarInt(playerid, "idrgP");
				format(str, sizeof(str), "Documentos\nHabilitacoes\n{ffffff}Dinheiro {33aa33}R$%d, %s, Porte: %s", GetPlayerCash(id), TipoFicha(id), (PlayerInfo[id][Porte] ? ("Sim") : ("Nao")));
				ShowPlayerDialog(playerid, DIALOG_VERCARTEIRA, DIALOG_STYLE_LIST, "{fff000}Carteira", str, "Select", "Sair");	
			}
		}
		case DIALOG_VERRG_CARTEIRA:{
			if(!response || response){
				new str[169], id = GetPVarInt(playerid, "idrgP");
				format(str, sizeof(str), "Documentos\nHabilitacoes\n{ffffff}Dinheiro {33aa33}R$%d, %s, Porte: %s", GetPlayerCash(id), TipoFicha(id), (PlayerInfo[id][Porte] ? ("Sim") : ("Nao")));
				ShowPlayerDialog(playerid, DIALOG_VERCARTEIRA, DIALOG_STYLE_LIST, "{fff000}Carteira", str, "Select", "Sair");	
			}
		}
		case DIALOG_CARTEIRA:{
		    if(response){
				switch(listitem){
				    case 0: ShowRg(playerid, playerid);
				    case 1:{
				        new str[128];
				        format(str, sizeof(str), "{33ccff}Todas as suas carteiras de habilitacao.\n\n{ffffff}Carro %s\n{ffffff}Moto %s\n{ffffff}Aviao %s", PegarCarteira(playerid, 1), PegarCarteira(playerid, 2), PegarCarteira(playerid, 3));
				        ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Suas Habilitacoes", str, "Ok", "");
					}
				    case 2:{
				    	PC_EmulateCommand(playerid, "/carteira");
				    }
				}
			}
		}
		case DIALOG_CONFIRMAR_ITEM:{
		    if(response){
		        if(MochilaCheia(playerid)){
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					ClearAnimations(playerid);
				}
				else{
			        new id = GetPVarInt(playerid, "itemidd");
			        if(!InfoDrop[id][Dropado]){
			        	SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Item nao existe mais!");
                    	PC_EmulateCommand(playerid, "/anim");
                    }
                    else{
	                    InfoDrop[id][Dropado] = false;
				        AdicionarItem(playerid, InfoDrop[id][TipoItem], InfoDrop[id][QuantiaItem]);
				        InfoDrop[id][DropX] = 0;
				        InfoDrop[id][DropY] = 0;
				        InfoDrop[id][DropZ] = 0;
				        InfoDrop[id][QuantiaItem] = 0;
				        InfoDrop[id][TipoItem] = 0;
				        DestroyDynamic3DTextLabel(InfoDrop[id][TextoDrop]);
				        DestroyDynamicObject(InfoDrop[id][OBDrop]);
				        DeletePVar(playerid, "itemidd");
				        ClearAnimations(playerid);
				    }
				}
		        return 1;
			}
			else{
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce optou por nao pegar o item.");
                DeletePVar(playerid, "itemidd");
                ClearAnimations(playerid);
			}
		}
		case DIALOG_CERTEZADROP:{
		    if(!response) return PC_EmulateCommand(playerid, "/mochila");
		    new slot = GetPVarInt(playerid, "slot");
		    switch(ItemInfo[playerid][slot][Item]){
		        case DINHEIRO_FLUTUANTE, DINHEIRO_FLUTUANTE_BANDIDO:{
				    CriarItem(playerid, ItemInfo[playerid][slot][Item], ItemInfo[playerid][slot][Quantia]);
				}
				case 700..789:{
					VerItem(playerid, ItemInfo[playerid][slot][Item]);
					CriarItem(playerid, ItemInfo[playerid][slot][Item], ItemInfo[playerid][slot][Quantia]);
				    ItemInfo[playerid][slot][Quantia] = 0;
				    ItemInfo[playerid][slot][Item] = NADA;
				}
				default:{
					VerItem(playerid, ItemInfo[playerid][slot][Item]);
					CriarItem(playerid, ItemInfo[playerid][slot][Item], ItemInfo[playerid][slot][Quantia]);
					if(ItemInfo[playerid][slot][Quantia] <= 0){
					    ItemInfo[playerid][slot][Quantia] = 0;
					    ItemInfo[playerid][slot][Item] = NADA;
					}
				}
			}
		    ItemInfo[playerid][slot][Quantia] = 0;
	    	ItemInfo[playerid][slot][Item] = NADA;
			new str[144];
			format(str, sizeof str, "** %s dropou um item no chao.", nome(playerid));
			MensagemLocal(25.0, playerid, 0xC2A2DAFF, str, true);
			PC_EmulateCommand(playerid, "/mochila");
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce dropou o item no chao.");
		}
		case DIALOG_MANDARMSG:{
		    if(response){
		        new id = GetPVarInt(playerid, "iddozapnego");
				new str[144];
		        format(str, sizeof(str), "{25D366}[Whatssap][PV]%s(+55 %d): %s", nome(playerid), PlayerInfo[playerid][IDFixo], inputtext);
		        SendClientMessage(id, -1, str);
		        SendClientMessage(playerid, -1, str);
			}
			else
				AbrirCELULAR(playerid);
		}
		case DIALOG_ZAPPV:{
		    if(response){
				if(!Number(inputtext)){
				    ShowPlayerDialog(playerid, DIALOG_ZAPPV, DIALOG_STYLE_INPUT, "{fff000}Digite o numero", "{33ccff}Esta mensagem aparece para o usuario.\n{fff000}Digite o numero de CELULAR do jogador.", "Enviar", "Sair");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Apenas numeros.");
				}
				else{
					foreach(new i: Player){
					    if(strval(inputtext) == PlayerInfo[i][IDFixo]){
					        if(!TemItem(i, CELULAR) || !TemItem(i, CHIP)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao possui CELULAR ou CHIP.");
					        SetPVarInt(playerid, "iddozapnego", i);
					        ShowPlayerDialog(playerid, DIALOG_MANDARMSG, DIALOG_STYLE_INPUT, "{fff000}Mandar Mensagem", "{33ccff}O Numero digitado esta disponivel, agora, escreva a mensagem.", "Mandar", "Sair");
							break;
						}
					}
				}
			}
			else
				AbrirCELULAR(playerid);
		}
		case DIALOG_GRUPOZAP:{
		    if(response){
		    	if(!TemItem(playerid, CHIP)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui CHIP.");
		    	if(!TemItem(playerid, CREDITOS)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem CREDITOS.");
		        new str[170];
		        format(str, sizeof(str), "{25D366}[Whatssap][Grupo]%s(+55 %d): %s", nome(playerid), playerid, inputtext);
		        SendZapMessage(str);
		        DiminuirItem(playerid, CREDITOS, 1);
			}
			else
			    AbrirCELULAR(playerid);
		}
		case DIALOG_WHATSSAP:{
		    if(response){
		        if(!TemItem(playerid, CHIP)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Para usar o whatssap voce precisa ter um CHIP.");
  				if(listitem == 0) return ShowPlayerDialog(playerid, DIALOG_ZAPPV, DIALOG_STYLE_INPUT, "{fff000}Digite o numero", "{33ccff}Esta mensagem aparece para o usuario.\n{fff000}Digite o numero de CELULAR do jogador", "Enviar", "Sair");
  				if(listitem == 1) return ShowPlayerDialog(playerid, DIALOG_GRUPOZAP, DIALOG_STYLE_INPUT, "{fff000}Digite A Mensagem", "{33ccff}Esta mensagem aparece para todos os usuarios do servidor que tenham CHIP e CELULAR !\n{fff000}Digite apenas mensagens IC.", "Enviar", "Sair");
			}
			else
			    AbrirCELULAR(playerid);
		}
		case DIALOG_OLX:{
		    if(response){
		    	new str[256];
		    	format(str, sizeof str, "[{aa33aa}O{33AA33}L{FFA500}X{ffffff} {fff000}Anuncio{ffffff}](%d)%s -> %s, CELULAR: %d.",PlayerInfo[playerid][IDFixo], nome(playerid), inputtext, PlayerInfo[playerid][IDFixo]);
		        SendClientMessageToAll(-1, str);
			}
			else
			    AbrirCELULAR(playerid);
		}
		case DIALOG_DISCAR:{
		    if(!response) return AbrirCELULAR(playerid);
		    else{
		        if(!Number(inputtext)){
		            AbrirCELULAR(playerid);
		            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Digite um numero valido.");
				}
				else{
			        if(EmChamada[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta em uma ligacao telefonica.");
			        if(Discando[playerid] != -1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta falando / ligando para alguem.");
					if(playerid == strval(inputtext)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode ligar para voce mesmo.");
					new i = strval(inputtext);
					new uva = -1;
	        		foreach(new id: Player){
						if(i == PlayerInfo[id][IDFixo]){
							i = id;
							uva = i;
							break;
						}
					}
					if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
					if(!IsPlayerConnectedP(i)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta logado.");
					if(EmChamada[i]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este numero de telefone esta ocupado no momento!");
					if(Discando[i] != -1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Alguem ja esta ligando para este numero.");
				    Discando[playerid] = i;
				    QueLigou[i] = true;
				    Discando[i] = playerid;
				    TimerChamarLigacao[playerid] = SetTimerEx("ligacao", 3000, true, "ii", playerid, i);
				    new str[128];
				    format(str, sizeof str, "[Ligacao] Voce esta ligando para %s(+55 %d).", nome(i), strval(inputtext));
			 	    SendClientMessage(playerid, Amarelo, str);

			 	    format(str, sizeof str, "[Ligacao] %s esta ligando para voce ! Digite /atender para atender ou /desligar para recusar a ligacao.", nome(playerid));
                    SendClientMessage(i, Amarelo, str);
					return 1;
				}
			}
		}
		case DIALOG_CELULAR:{
		    if(response){
				switch(listitem){
				    case 0:ShowPlayerDialog(playerid, DIALOG_WHATSSAP, DIALOG_STYLE_LIST, "{FFF000}Seu Whatssap", "{25D366}Particular\n{25D366}Grupo", "Select", "Sair");
					case 1:ShowPlayerDialog(playerid, DIALOG_OLX, DIALOG_STYLE_INPUT, "{aa33aa}O{33AA33}L{FFA500}X", "{33aa33}Escreva o que voce deseja anunciar no campo abaixo.", "Enviar", "Sair");
					case 2:ShowPlayerDialog(playerid, DIALOG_DISCAR, DIALOG_STYLE_INPUT, "{fff000}Ligacao", "{33aa33}Digite o ID do jogador parar fazer a chamada telefonica.", "Ok", "Sair");
					case 3:{
						if(!PossuiContaBanco(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "Crie uma conta no banco antes de usar este aplicativo!");
						new str[144];
						format(str, sizeof(str), "{fff000}[B.{33AA33}B]\n\n\
						{ffffff}Voce possui um total de %dR$ na conta do banco.\nDigite o numero da conta que deseja fazer a transferencia.", BancoInfo[playerid][Dinheiro]);
						ShowPlayerDialog(playerid, DIALOG_TRANSFERIR, DIALOG_STYLE_INPUT, "{fff000}Transferencia Bancaria", str, "Ok", "Sair");
					}
					case 4:{
						if(PlayerInfo[playerid][Nivel] <= 3) return SendClientMessage(playerid, LIGHTBLUE, "Voce precisa de nivel 4 ou superior para pedir um ataque terrorista.");

						if(PlayerInfo[playerid][Org] == 18) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode pedir um ATAQUE TERRORISTA SENDO um TERRORISTA.");
						if(GetPlayerCash(playerid) < 300) return SendClientMessage(playerid, 0x808080FF, "Voce PRECISA de 300 REAIS para pedir um ATAQUE TERRORISTA.");
						SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+4);
						if(!TerroristasOnline()) return SendClientMessage(playerid, 0x808080FF, "Nao ha nenhum terrorista online.");
						new Float: X, Float: Y, Float: Z;
						GetPlayerPos(playerid, X, Y, Z);
						foreach(new i: Player){
							if(PlayerInfo[i][Org] == 18){
								SendClientMessage(i, 0x808080FF, fString("* %s acaba de pedir um Ataque Terrorista em %s(%s). Marcado em seu mapa.", nome(playerid), CoordZone(X, Y, Z), DistanciaJogador(i, playerid)));
								SetPlayerCheckpoint(i, X, Y, Z, 5.0);
							}
						}
						GivePlayerCash(playerid, -300);
						SendClientMessage(playerid, 0x808080FF, "Voce pediu um ATAQUE TERRORISTA nesta area. Os terroristas onlines foram AVISADOS.");
					}
					case 5:ShowPlayerDialog(playerid, DIALOG_EMERGENCIAS, DIALOG_STYLE_LIST, "{fff000}Voce precisa do que?", "{33ccff}Policia\n{7C9B5A}Mecanico\n{7C9B5A}Taxista\n{ff8080}Samu", "Select", "Retornar");
				}
			}
		}
		case DIALOG_FUNCOESMOCHILA:{
		    if(response){
		        new slot = GetPVarInt(playerid, "slot");
		        switch(listitem){
		            case 0:{
				        if(ItemInfo[playerid][slot][Item] == NADA || ItemInfo[playerid][slot][Quantia] == 0){
				            PC_EmulateCommand(playerid, "/mochila");
				            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce selecionou um item invalido.");
						}
						else{
							if(IsSkin(ItemInfo[playerid][slot][Item])){
							
								PlayerInfo[playerid][Skin] = ItemInfo[playerid][slot][Item];
								if(Pagina[playerid] == 1){
									ItemInfo[playerid][slot][Item] = GetPlayerSkin(playerid);
									PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][slot], GetPlayerSkin(playerid));
								}
								else{
									new Conta = Pagina[playerid] * 20;
									ItemInfo[playerid][slot][Item] = GetPlayerSkin(playerid);
									PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][(Conta-slot)], GetPlayerSkin(playerid));
								}
								AdicionarItemN(playerid, GetPlayerSkin(playerid), 1);
								SetPlayerSkin(playerid, ItemInfo[playerid][slot][Item]);
								DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);

								new stre[144];
								format(stre, sizeof stre, "%s colocou uma %s nova.", nome(playerid), rdr[random(12)]);
								MensagemLocal(25.0, playerid, Roxoeu, stre, false);
							

								PC_EmulateCommand(playerid, "/mochila");
							}
							else if(IsAcessorio(ItemInfo[playerid][slot][Item])){
								if(LotSlots(playerid)){
									SendClientMessage(playerid, LIGHTBLUE, "* Voce esta lotado de Acessorios.");
								}
								else{
									new d = GetLivreSlot(playerid);
									if(d != -1){
										ao[playerid][d][partebone] = 1;
										RemovePlayerAttachedObjectEx(playerid, d);

										SetPlayerAttachedObjectEx(playerid, d, ItemInfo[playerid][slot][Item], 1);//, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);						
										SendClientMessage(playerid, LIGHTBLUE, "* Adicionado com sucesso, ele esta escondido na parte da Coluna.");
										DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);
										PC_EmulateCommand(playerid, "/mochila");
									}
									else{
										PC_EmulateCommand(playerid, "/mochila");
										SetPVarInt(playerid, "ModelSetA", -1);
										SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com os Slots de acessorios no maximo!");
									}								
								}
							}
							else{	
								switch(ItemInfo[playerid][slot][Item]){
									case 980:{
										CriarPortao(playerid);
						    			ItemInfo[playerid][slot][Quantia] = 0;
									    ItemInfo[playerid][slot][Item] = NADA;
									    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de usar um portao. Use /MenuPortao [ id ] para configurar.");
									}
									case MACONHA:{
										if(ItemInfo[playerid][slot][Quantia] >= 5){
											SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
											ApplyAnimationEx(playerid,"SMOKING","M_smk_drag",4.1,1,0,0,0,0);
											ItemInfo[playerid][slot][Quantia] -= 5;
											new str[80];
											format(str, sizeof str, "** %s acaba de fumar uma Diamba..", nome(playerid));
											MensagemLocal(30.0, playerid, Roxoeu,str,true);
											
											SetTimerEx("limparmac", 3000, false, "i", playerid);

											new Float: Colete;
											GetPlayerArmour(playerid, Colete);

											PlayerInfo[playerid][Fome] -= 7;
											if(PlayerInfo[playerid][Fome] < 0) PlayerInfo[playerid][Fome] = 0;
											MostrarFomeSede(playerid);		
																				
											if(Colete < 100) SetPlayerArmour(playerid, Colete+4.5);
											if(ItemInfo[playerid][slot][Quantia] == 0){
												ItemInfo[playerid][slot][Item] = NADA;
											}
										}
									}
								    case CELULAR:{
										ShowPlayerDialog(playerid, DIALOG_CELULAR, 5,"{fff000}Seu CELULAR", "{33ccff}Aplicativo\t{33ccff}Funcao\n\
										{25D366}Whatssap\t{ffffff}Mensagens\n\
										{aa33aa}O{33AA33}L{FFA500}X\t{ffffff}Anuncios\n\
										{fff000}Ligar\t{ffffff}Chamada Telefonica\n\
										{ffffff}Transferencia {77dd77}PicPay\t{ffffff}Transferencia Bancaria\n\
										{ff0000}Emergencia\t{ffffff}Chame uma autoridade ou servico", "Ok", "Sair");
									}
									case CAPACETE:{
									    if(ObjetoUsadoEmIndex(playerid, 8)){
									    	SendClientMessage(playerid, LIGHTBLUE,"* A um acessorio sendo usado no lugar do CAPACETE.");
										}
										else{
											if(IsPlayerAttachedObjectSlotUsed(playerid, 8)){
										        RemovePlayerAttachedObject(playerid, 8);
											    new str[60];
											    format(str, sizeof(str), "** %s removeu seu CAPACETE.", nome(playerid));
											    MensagemLocal(30.0, playerid, Roxoeu, str, true);
											}else{
											    SetPlayerAttachedObject(playerid,8,18979,2,0.063999,0.011000,-0.004999,-1.399996,90.400001,88.799995,0.953999,0.827999,0.872000);
										        new str[60];
										        format(str, sizeof(str), "** %s colocou seu CAPACETE.", nome(playerid));
										        MensagemLocal(30.0, playerid, Roxoeu, str, true);
											}
										}
									}
									case RADINHO:{
										if(ObjetoUsadoEmIndex(playerid, 9)){
											SendClientMessage(playerid, LIGHTBLUE, "* A um acessorio sendo usado no lugar do CAPACETE.");
										}
										else{
										    if(IsPlayerAttachedObjectSlotUsed(playerid, 9)){
										        RemovePlayerAttachedObject(playerid, 9);
										        new str[60];
										        format(str, sizeof(str), "** %s desequipou seu RADINHO.", nome(playerid));
										        MensagemLocal(30.0, playerid, Roxoeu, str, true);
											}
											else{
											    SetPlayerAttachedObject(playerid,9,19942,7,-0.026999,0.070999,-0.057000,-1.700001,-86.500061,-97.199996,1.000000,1.000000,1.000000);
							        			new str[60];
										        format(str, sizeof(str), "** %s equipou seu RADINHO.", nome(playerid));
										        MensagemLocal(30.0, playerid, Roxoeu, str, true);
											}
										}
									}
									case SEMENTE:{
										PC_EmulateCommand(playerid, "/mochila");
										SendClientMessage(playerid, LIGHTBLUE, "* Use /plantarSEMENTE para plantar esta SEMENTE.");
									}
									case DINHEIRO_FLUTUANTE_BANDIDO:{
										SendClientMessage(playerid, LIGHTBLUE, "* Voce deve limpar este dinheiro com a Mafia.");
										PC_EmulateCommand(playerid, "/mochila");
									}
									case DINHEIRO_FLUTUANTE:{
										if(ItemInfo[playerid][slot][Item] == DINHEIRO_FLUTUANTE){
											GivePlayerCash(playerid, ItemInfo[playerid][slot][Quantia]);
											new srt[98];
											format(srt, sizeof srt, "{33aa33}|INFO| Voce pegou %dR$ de sua mochila.", ItemInfo[playerid][slot][Quantia]);
											SendClientMessage(playerid, -1, srt);
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										    PC_EmulateCommand(playerid, "/mochila");
										}
									}
									case DILDO_ROXO..TEC9:{
									    GivePlayerWeapon(playerid, WEAPON:IdDoItem(ItemInfo[playerid][slot][Item]), ItemInfo[playerid][slot][Quantia]);
									    new str[120];
									    format(str, sizeof str, "|INFO| Voce pegou uma arma com %d Municoes da mochila.", ItemInfo[playerid][slot][Quantia]);
									    SendClientMessage(playerid, LIGHTBLUE, str);
									    ItemInfo[playerid][slot][Quantia] = 0;
									    ItemInfo[playerid][slot][Item] = NADA;
									}
									case GALAO_CHEIO:{
										if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a mochila Cheia!");
										new Float:Pos[6], check = -1;
										GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
										foreach(new i: Vehicles){
											GetVehiclePos(i, Pos[3], Pos[4], Pos[5]);
											////////printf("%d %d carantes", i, GetVehicleModel(i));
				                    		//GetXYZOfVehiclePart(vehicleid, part, &Float:x, &Float:y, &Float:z, Float:offset = 0.5)
											GetXYZOfVehiclePart(i, VEHICLE_PART_TRASEIROESQUERDO, Pos[3], Pos[4], Pos[5]);
				                    		if(ISP(playerid, 1.2, Pos[3], Pos[4], Pos[5])){
				                    			check = i;
				                    			break;
				                    		}
				                    	}
				                    	if(ItemInfo[playerid][slot][Quantia] > 100) return SendClientMessage(playerid, LIGHTBLUE, "* Muita gasolina !");
				                    	if( ( ItemInfo[playerid][slot][Quantia] + VeiculoInfo[check][Gasolina]) > 100) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta tentando abastecer um tanque com muita gasolina.");
				                    	if(check == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta no tanque de nenhum veiculo ou voce esta tentando abastecer mais do que o tanque pode suportar!");
				      					VeiculoInfo[check][Gasolina] = ItemInfo[playerid][slot][Quantia];
				                    	DiminuirItem(playerid, GALAO_CHEIO, ItemInfo[playerid][slot][Quantia]);
				                    	AdicionarItem(playerid, GALAO_VAZIO, 1);
				       
				                    	new str[144];
				                    	format(str, sizeof str, "** %s acaba de reabastecer um veiculo.", nome(playerid));
				                    	MensagemLocal(50.0, playerid, Roxoeu, str, false);

									}
									case PIZZA, HAMBURGUER, COXINHA, PRATO_FEITO, FEIJOADA, BAURU, COCA_COLA, PEPSI, SUCO_LARANJA, SUCO_MARACUJA, AGUA, CERVEJA:{
										new str[90], diminuir;
										diminuir = ConverterComida(ItemInfo[playerid][slot][Item]);
										if(IsBebida(ItemInfo[playerid][slot][Item])){
											format(str, sizeof str, "Voce acaba de beber um liquido, sua sede diminuiu %d porcento.", diminuir);
											SendClientMessage(playerid, COR_COPOM, str);
											PlayerInfo[playerid][Sede] -= diminuir;
											if(PlayerInfo[playerid][Sede] < 0) PlayerInfo[playerid][Sede] = 0;
											ApplyAnimationEx(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
											MostrarFomeSede(playerid);
											SetTimerEx("LimparAnim", 3000, false, "i", playerid);
										}
										if(IsComida(ItemInfo[playerid][slot][Item])){
										    ApplyAnimationEx(playerid, "FOOD", "EAT_Burger", 3.0, 1, 0, 0, 0, 0, SYNC_ALL);
											format(str, sizeof str, "Voce acaba de ingerir uma comida, sua fome diminuiu %d porcento.", diminuir);
											SendClientMessage(playerid, COR_COPOM, str);
											PlayerInfo[playerid][Fome] -= diminuir;
											if(PlayerInfo[playerid][Fome] < 0) PlayerInfo[playerid][Fome] = 0;
											MostrarFomeSede(playerid);
											SetTimerEx("LimparAnim", 3000, false, "i", playerid);
										
										}
										DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);
										PC_EmulateCommand(playerid, "/mochila");
									}
									case GALAO_VAZIO:{
									    if(NaMao[playerid] == GALAO_VAZIO) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com o item 'Galao Vazio' nao mao. Use /guardar GV para guarda-lo.");
		                                NaMao[playerid] = GALAO_VAZIO;
		                                SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pegou um Galao Vazio na mao.");
									    ItemInfo[playerid][slot][Quantia] -= 1;
									    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
										if(ItemInfo[playerid][slot][Quantia] <= 0){
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										}										
									}
									case MP3:{
										ShowPlayerDialog(playerid, DIALOG_MP3,DIALOG_STYLE_LIST, "{ff0000}# Escolha A Musica", "Radio Trap / Funk e Hip Hop\nRadio Funk\nRadio Eletronica\nRadio Piseiro\n{ff0000}Parar Som", "Ok", "Sair");
									}
									case LOCKPICK:{
										new veh = -1;
										for(new i, j = MAX_VEHICLES; i != j; i++){
											new Float: Dist = CheckPlayerDistanceToVehicle(4.0, playerid, i);
											if(Dist){

												veh = i;
												if(VeiculoDoJogador(playerid, i))return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso com seu proprio veiculo.");
												if(VehOpcao(i, VEICULO_TRANCADO)){
													//TogglePlayerControllableEx(playerid, false);
													ApplyAnimationEx(playerid, "SWORD", "sword_block", 1.0, 1, 0, 0, 1, 0, SYNC_ALL);
													GameTextForPlayer(playerid, "~r~Forcando~n~~y~tranca do veiculo", 14000, 1);
													TimerPlayer[playerid][7] = SetTimerEx("quebrartranca", 15000, false, "ii", playerid, i);
													DiminuirItem(playerid, LOCKPICK, 1);
													VehOpcao(i, LIGAR_ALARME);
													SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+3);

													new Float: x, Float: y, Float: z;
													GetPlayerPos(playerid, x, y, z);
													foreach(new player: Player){
														if(IsPolice(PlayerInfo[player][Org])){
															new str[144];
															format(str, sizeof str, "* (rede) %s esta quebrando a tranca de um veiculo em %s.", nome(playerid), CoordZone(x,y,z));
															SendClientMessage(player, Roxoeu, str);
														}
													}
													break;
												}
												else{
													SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo nao esta trancado.");
													break;
												}
											}
										}
										if(veh == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar perto de algum veiculo.");
									}
									case LEITE:{
										ApplyAnimationEx(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
										ApplyAnimationEx(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
										ItemInfo[playerid][slot][Quantia] -= 1;
										new str[89];
										format(str, sizeof str, "** %s acaba de comer um LEITE em Po.", nome(playerid));
										MensagemLocal(30.0, playerid, Roxoeu,str,true);
											

										SetTimerEx("limparmac", 3000, false, "i", playerid);
										PlayerInfo[playerid][Sede] -= 4;
										PlayerInfo[playerid][Fome] -= 4;
										if(PlayerInfo[playerid][Sede] < 0) PlayerInfo[playerid][Sede] = 0;
										if(PlayerInfo[playerid][Fome] < 0) PlayerInfo[playerid][Fome] = 0;
										MostrarFomeSede(playerid);
										if(ItemInfo[playerid][slot][Quantia] <= 0){
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										}
									}
									case DINAMITE:{
									    if(NaMao[playerid] == DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com o item 'DINAMITE' nao mao. Use /guardar DINAMITE para guarda-lo.");
		                                NaMao[playerid] = DINAMITE;
		                                SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pegou uma dinamite na mao.");
									    ItemInfo[playerid][slot][Quantia] -= 1;
									    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
										if(ItemInfo[playerid][slot][Quantia] <= 0){
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										}
									}
									case HOT_KNIFE..BANDITO:{
										if(VeiculoInv[playerid] != -1){
											DestroyVehicleEx(VeiculoInv[playerid], "");
											VeiculoInv[playerid] = -1;
										}

										new Float: X, Float: Y, Float: Z, Float: A;
										GetPlayerFacingAngle(playerid, A);
										GetPlayerPos(playerid, X, Y, Z);

										VeiculoInv[playerid] = CriarVeiculo("Veiculo Inv", ItemInfo[playerid][slot][Item], X, Y, Z, A, random(32), random(32), -1);

										if(ItemInfo[playerid][slot][Item] == UFO_AVIAO){
											SetVehicleAttachedObject(VeiculoInv[playerid],2,18846,0,0,0,0,0,0);
											LinkVehicleToInterior(VeiculoInv[playerid], 1);
										}

										PutPlayerInVehicle(playerid, VeiculoInv[playerid] , 0);


										SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce spawnou um veiculo de inventario.");
									}

								    default: SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode fazer nada com este item.");
								}
							}
						}
					}
					case 1:{
				        if(ItemInfo[playerid][slot][Item] == NADA || ItemInfo[playerid][slot][Quantia] == 0){
				            PC_EmulateCommand(playerid, "/mochila");
				            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce selecionou um item invalido.");
						}
						else{
							if(CriouJBL[playerid] != -1 && ItemInfo[playerid][slot][Item] == JBL) return SendClientMessage(playerid, LIGHTBLUE, "* Guarde a JBL antes de dropar ela.");
							ShowPlayerDialog(playerid, DIALOG_OPCAODROP, DIALOG_STYLE_LIST, 
								"{FF0000}# Opcao Drop", "{33ccff}Dropar Tudo\nDropar Quantidade", "Ok", "Back");
						}
					}
					case 2:{
						if(response){
							if(ItemInfo[playerid][slot][Item] == NADA || ItemInfo[playerid][slot][Quantia] == 0){
								PC_EmulateCommand(playerid, "/mochila");
								SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
							}
							else{
								ShowPlayerDialog(playerid, DIALOG_SEPARAR_ITEM, DIALOG_STYLE_INPUT, "{fff000}# Separar Itens", "{33ccff}Digite a quantia que voce deseja separar deste item.", "Ok", "Sair");
							}
						}
					}
				}
			}
			else{
			
				if(MinhaOpcao[playerid] == 1)
					AbrirMochilaDialog(playerid);

				if(MinhaOpcao[playerid] == 2)
					MostrarMochila(playerid);
			}
		}
		case DIALOG_FUNCOESMOCHILATD:{
		    if(response){
		        new slot = GetPVarInt(playerid, "slot");
		        switch(listitem){
		            case 0:{
				        if(ItemInfo[playerid][slot][Item] == NADA || ItemInfo[playerid][slot][Quantia] == 0){
				            
				            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce selecionou um item invalido.");
						}
						else{
							if(IsSkin(ItemInfo[playerid][slot][Item])){
								new skn = GetPlayerSkin(playerid);
								PlayerInfo[playerid][Skin] = ItemInfo[playerid][slot][Item];
								SetPlayerSkin(playerid, ItemInfo[playerid][slot][Item]);
								DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);//aqmdf
								if(!MochilaCheia(playerid))
									AdicionarItemN(playerid, GetPlayerSkin(playerid), 1);
								else{
									SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta cheia! A Skin que estava em seu corpo foi dropada no chão.");
									CriarItem(playerid, skn, 1);
								}
								new stre[144];
								format(stre, sizeof stre, "%s colocou uma %s nova.", nome(playerid), rdr[random(12)]);
								MensagemLocal(25.0, playerid, Roxoeu, stre, false);
								MostrarMochila(playerid);
							
							}
							else if(IsAcessorio(ItemInfo[playerid][slot][Item])){
								if(LotSlots(playerid)){
									SendClientMessage(playerid, LIGHTBLUE, "* Voce esta lotado de Acessorios.");
								}
								else{
									new d = GetLivreSlot(playerid);
									if(d != -1){
										ao[playerid][d][partebone] = 1;
										RemovePlayerAttachedObjectEx(playerid, d);

										SetPlayerAttachedObjectEx(playerid, d, ItemInfo[playerid][slot][Item], 1);//, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);						
										SendClientMessage(playerid, LIGHTBLUE, "* Adicionado com sucesso, ele esta escondido na parte da Coluna.");
										DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);
										MostrarMochila(playerid);
									}
									else{
										MostrarMochila(playerid);
										SetPVarInt(playerid, "ModelSetA", -1);
										SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com os Slots de acessorios no maximo!");
									}								
								}
							}
							else{	
								switch(ItemInfo[playerid][slot][Item]){
									case 980:{
										CriarPortao(playerid);
						    			ItemInfo[playerid][slot][Quantia] = 0;
									    ItemInfo[playerid][slot][Item] = NADA;
									    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de usar um portao. Use /MenuPortao [ id ] para configurar.");
										MostrarMochila(playerid);
									}
									case MACONHA:{
										if(ItemInfo[playerid][slot][Quantia] >= 5){
											SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
											ApplyAnimationEx(playerid,"SMOKING","M_smk_drag",4.1,1,0,0,0,0);
											ItemInfo[playerid][slot][Quantia] -= 5;
											new str[80];
											format(str, sizeof str, "** %s acaba de fumar uma Diamba..", nome(playerid));
											MensagemLocal(30.0, playerid, Roxoeu,str,true);
											
											SetTimerEx("limparmac", 3000, false, "i", playerid);

											new Float: Colete;
											GetPlayerArmour(playerid, Colete);

											PlayerInfo[playerid][Fome] -= 7;
											if(PlayerInfo[playerid][Fome] < 0) PlayerInfo[playerid][Fome] = 0;
											MostrarFomeSede(playerid);		
																				
											if(Colete < 100) SetPlayerArmour(playerid, Colete+4.5);
											if(ItemInfo[playerid][slot][Quantia] == 0){
												ItemInfo[playerid][slot][Item] = NADA;
											}
											MostrarMochila(playerid);
										}
									}
								    case CELULAR:{
										ShowPlayerDialog(playerid, DIALOG_CELULAR, 5,"{fff000}Seu CELULAR", "{33ccff}Aplicativo\t{33ccff}Funcao\n\
										{25D366}Whatssap\t{ffffff}Mensagens\n\
										{aa33aa}O{33AA33}L{FFA500}X\t{ffffff}Anuncios\n\
										{fff000}Ligar\t{ffffff}Chamada Telefonica\n\
										{ffffff}Transferencia {77dd77}PicPay\t{ffffff}Transferencia Bancaria\n\
										{ff0000}Emergencia\t{ffffff}Chame uma autoridade ou servico", "Ok", "Sair");
										EsconderInventario(playerid);
									}
									case CAPACETE:{
									    if(ObjetoUsadoEmIndex(playerid, 8)){
									    	SendClientMessage(playerid, LIGHTBLUE,"* A um acessorio sendo usado no lugar do CAPACETE.");
										}
										else{
											if(IsPlayerAttachedObjectSlotUsed(playerid, 8)){
										        RemovePlayerAttachedObject(playerid, 8);
											    new str[60];
											    format(str, sizeof(str), "** %s removeu seu CAPACETE.", nome(playerid));
											    MensagemLocal(30.0, playerid, Roxoeu, str, true);
											}else{
											    SetPlayerAttachedObject(playerid,8,18979,2,0.063999,0.011000,-0.004999,-1.399996,90.400001,88.799995,0.953999,0.827999,0.872000);
										        new str[60];
										        format(str, sizeof(str), "** %s colocou seu CAPACETE.", nome(playerid));
										        MensagemLocal(30.0, playerid, Roxoeu, str, true);
											}
											MostrarMochila(playerid);
										}
									}
									case RADINHO:{
										if(ObjetoUsadoEmIndex(playerid, 9)){
											SendClientMessage(playerid, LIGHTBLUE, "* A um acessorio sendo usado no lugar do CAPACETE.");
										}
										else{
										    if(IsPlayerAttachedObjectSlotUsed(playerid, 9)){
										        RemovePlayerAttachedObject(playerid, 9);
										        new str[60];
										        format(str, sizeof(str), "** %s desequipou seu RADINHO.", nome(playerid));
										        MensagemLocal(30.0, playerid, Roxoeu, str, true);
											}
											else{
											    SetPlayerAttachedObject(playerid,9,19942,7,-0.026999,0.070999,-0.057000,-1.700001,-86.500061,-97.199996,1.000000,1.000000,1.000000);
							        			new str[60];
										        format(str, sizeof(str), "** %s equipou seu RADINHO.", nome(playerid));
										        MensagemLocal(30.0, playerid, Roxoeu, str, true);
											}
										}
										MostrarMochila(playerid);
									}
									case SEMENTE:{
										MostrarMochila(playerid);
										SendClientMessage(playerid, LIGHTBLUE, "* Use /plantarSEMENTE para plantar esta SEMENTE.");
									}
									case DINHEIRO_FLUTUANTE_BANDIDO:{
										SendClientMessage(playerid, LIGHTBLUE, "* Voce deve limpar este dinheiro com a Mafia.");
										MostrarMochila(playerid);
									}
									case DINHEIRO_FLUTUANTE:{
										if(ItemInfo[playerid][slot][Item] == DINHEIRO_FLUTUANTE){
											GivePlayerCash(playerid, ItemInfo[playerid][slot][Quantia]);
											new srt[98];
											format(srt, sizeof srt, "{33aa33}|INFO| Voce pegou %dR$ de sua mochila.", ItemInfo[playerid][slot][Quantia]);
											SendClientMessage(playerid, -1, srt);
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										    MostrarMochila(playerid);
										}
									}
									case DILDO_ROXO..TEC9:{
									    GivePlayerWeapon(playerid, IdDoItem(ItemInfo[playerid][slot][Item]), ItemInfo[playerid][slot][Quantia]);
									    new str[120];
									    format(str, sizeof str, "|INFO| Voce pegou uma arma com %d Municoes da mochila.", ItemInfo[playerid][slot][Quantia]);
									    SendClientMessage(playerid, LIGHTBLUE, str);
									    ItemInfo[playerid][slot][Quantia] = 0;
									    ItemInfo[playerid][slot][Item] = NADA;
									    MostrarMochila(playerid);
									}
									case GALAO_CHEIO:{
										if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a mochila Cheia!");
										new Float:Pos[6], check = -1;
										GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
										foreach(new i: Vehicles){
											GetVehiclePos(i, Pos[3], Pos[4], Pos[5]);
											////////printf("%d %d carantes", i, GetVehicleModel(i));
				                    		//GetXYZOfVehiclePart(vehicleid, part, &Float:x, &Float:y, &Float:z, Float:offset = 0.5)
											GetXYZOfVehiclePart(i, VEHICLE_PART_TRASEIROESQUERDO, Pos[3], Pos[4], Pos[5]);
				                    		if(ISP(playerid, 1.2, Pos[3], Pos[4], Pos[5])){
				                    			check = i;
				                    			break;
				                    		}
				                    	}
				                    	if(ItemInfo[playerid][slot][Quantia] > 100) return SendClientMessage(playerid, LIGHTBLUE, "* Muita gasolina !");
				                    	if( ( ItemInfo[playerid][slot][Quantia] + VeiculoInfo[check][Gasolina]) > 100) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta tentando abastecer um tanque com muita gasolina.");
				                    	if(check == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta no tanque de nenhum veiculo ou voce esta tentando abastecer mais do que o tanque pode suportar!");
				      					VeiculoInfo[check][Gasolina] = ItemInfo[playerid][slot][Quantia];
				                    	DiminuirItem(playerid, GALAO_CHEIO, ItemInfo[playerid][slot][Quantia]);
				                    	AdicionarItem(playerid, GALAO_VAZIO, 1);
				       
				                    	new str[144];
				                    	format(str, sizeof str, "** %s acaba de reabastecer um veiculo.", nome(playerid));
				                    	MensagemLocal(50.0, playerid, Roxoeu, str, false);
				                    	MostrarMochila(playerid);

									}
									case PIZZA, HAMBURGUER, COXINHA, PRATO_FEITO, FEIJOADA, BAURU, COCA_COLA, PEPSI, SUCO_LARANJA, SUCO_MARACUJA, AGUA, CERVEJA:{
										new str[90], diminuir;
										diminuir = ConverterComida(ItemInfo[playerid][slot][Item]);
										if(IsBebida(ItemInfo[playerid][slot][Item])){
											format(str, sizeof str, "Voce acaba de beber um liquido, sua sede diminuiu %d porcento.", diminuir);
											SendClientMessage(playerid, COR_COPOM, str);
											PlayerInfo[playerid][Sede] -= diminuir;
											if(PlayerInfo[playerid][Sede] < 0) PlayerInfo[playerid][Sede] = 0;
											ApplyAnimationEx(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
											MostrarFomeSede(playerid);
											SetTimerEx("LimparAnim", 3000, false, "i", playerid);
										}
										if(IsComida(ItemInfo[playerid][slot][Item])){
										    ApplyAnimationEx(playerid, "FOOD", "EAT_Burger", 3.0, 1, 0, 0, 0, 0, SYNC_ALL);
											format(str, sizeof str, "Voce acaba de ingerir uma comida, sua fome diminuiu %d porcento.", diminuir);
											SendClientMessage(playerid, COR_COPOM, str);
											PlayerInfo[playerid][Fome] -= diminuir;
											if(PlayerInfo[playerid][Fome] < 0) PlayerInfo[playerid][Fome] = 0;
											MostrarFomeSede(playerid);
											SetTimerEx("LimparAnim", 3000, false, "i", playerid);
										
										}
										DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);
										MostrarMochila(playerid);
									}
									case GALAO_VAZIO:{
									    if(NaMao[playerid] == GALAO_VAZIO) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com o item 'Galao Vazio' nao mao. Use /guardar GV para guarda-lo.");
		                                NaMao[playerid] = GALAO_VAZIO;
		                                SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pegou um Galao Vazio na mao.");
									    ItemInfo[playerid][slot][Quantia] -= 1;
									    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
										if(ItemInfo[playerid][slot][Quantia] <= 0){
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										}
										MostrarMochila(playerid);										
									}
									case MP3:{
										ShowPlayerDialog(playerid, DIALOG_MP3,DIALOG_STYLE_LIST, "{ff0000}# Escolha A Musica", "Radio Trap / Funk e Hip Hop\nRadio Funk\nRadio Eletronica\nRadio Piseiro\n{ff0000}Parar Som", "Ok", "Sair");
										EsconderInventario(playerid);
									}
									case LOCKPICK:{
										new veh = -1;
										for(new i, j = MAX_VEHICLES; i != j; i++){
											new Float: Dist = CheckPlayerDistanceToVehicle(4.0, playerid, i);
											if(Dist){

												veh = i;
												if(VeiculoDoJogador(playerid, i))return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso com seu proprio veiculo.");
												if(VehOpcao(i, VEICULO_TRANCADO)){
													//TogglePlayerControllableEx(playerid, false);
													ApplyAnimationEx(playerid, "SWORD", "sword_block", 1.0, 1, 0, 0, 1, 0, SYNC_ALL);
													GameTextForPlayer(playerid, "~r~Forcando~n~~y~tranca do veiculo", 14000, 1);
													TimerPlayer[playerid][7] = SetTimerEx("quebrartranca", 15000, false, "ii", playerid, i);
													DiminuirItem(playerid, LOCKPICK, 1);
													VehOpcao(i, LIGAR_ALARME);
													SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+3);

													new Float: x, Float: y, Float: z;
													GetPlayerPos(playerid, x, y, z);
													foreach(new player: Player){
														if(IsPolice(PlayerInfo[player][Org])){
															new str[144];
															format(str, sizeof str, "* (rede) %s esta quebrando a tranca de um veiculo em %s.", nome(playerid), CoordZone(x,y,z));
															SendClientMessage(player, Roxoeu, str);

														}
													}
													EsconderInventario(playerid);
													break;
												}
												else{
													SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo nao esta trancado.");
													break;
												}
											}
										}

										if(veh == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar perto de algum veiculo.");
									}
									case LEITE:{
										ApplyAnimationEx(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
										ApplyAnimationEx(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
										ItemInfo[playerid][slot][Quantia] -= 1;
										new str[89];
										format(str, sizeof str, "** %s acaba de comer um LEITE em Po.", nome(playerid));
										MensagemLocal(30.0, playerid, Roxoeu,str,true);
											

										SetTimerEx("limparmac", 3000, false, "i", playerid);
										PlayerInfo[playerid][Sede] -= 4;
										PlayerInfo[playerid][Fome] -= 4;
										if(PlayerInfo[playerid][Sede] < 0) PlayerInfo[playerid][Sede] = 0;
										if(PlayerInfo[playerid][Fome] < 0) PlayerInfo[playerid][Fome] = 0;
										MostrarFomeSede(playerid);
										if(ItemInfo[playerid][slot][Quantia] <= 0){
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										}
										MostrarMochila(playerid);
									}
									case HOT_KNIFE..BANDITO:{
										if(VeiculoInv[playerid] != -1){
											DestroyVehicleEx(VeiculoInv[playerid], "");
											VeiculoInv[playerid] = -1;
										}

										new Float: X, Float: Y, Float: Z, Float: A;
										GetPlayerFacingAngle(playerid, A);
										GetPlayerPos(playerid, X, Y, Z);

										VeiculoInv[playerid] = CriarVeiculo("Veiculo Inv", ItemInfo[playerid][slot][Item], X, Y, Z, A, random(32), random(32), -1);

										if(ItemInfo[playerid][slot][Item] == UFO_AVIAO){
											SetVehicleAttachedObject(VeiculoInv[playerid],2,18846,0,0,0,0,0,0);
											LinkVehicleToInterior(VeiculoInv[playerid], 1);
										}

										PutPlayerInVehicle(playerid, VeiculoInv[playerid] , 0);


										SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce spawnou um veiculo de inventario.");
									}
									case DINAMITE:{
									    if(NaMao[playerid] == DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com o item 'DINAMITE' nao mao. Use /guardar DINAMITE para guarda-lo.");
		                                NaMao[playerid] = DINAMITE;
		                                SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pegou uma dinamite na mao.");
									    ItemInfo[playerid][slot][Quantia] -= 1;
									    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
										if(ItemInfo[playerid][slot][Quantia] <= 0){
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										}
										MostrarMochila(playerid);
									}
								    default: SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode fazer nada com este item.");
								}
							}
						}
					}
					case 1:{
				        if(ItemInfo[playerid][slot][Item] == NADA || ItemInfo[playerid][slot][Quantia] == 0){
				            PC_EmulateCommand(playerid, "/mochila");
				            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce selecionou um item invalido.");
						}
						else{
							if(CriouJBL[playerid] != -1 && ItemInfo[playerid][slot][Item] == JBL) return SendClientMessage(playerid, LIGHTBLUE, "* Guarde a JBL antes de dropar ela.");
							ShowPlayerDialog(playerid, DIALOG_OPCAODROP, DIALOG_STYLE_LIST, 
								"{FF0000}# Opcao Drop", "{33ccff}Dropar Tudo\nDropar Quantidade", "Ok", "Back");
						}
					}
					case 2:{
						if(response){
							if(ItemInfo[playerid][slot][Item] == NADA || ItemInfo[playerid][slot][Quantia] == 0){
								PC_EmulateCommand(playerid, "/mochila");
								SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
							}
							else{
								ShowPlayerDialog(playerid, DIALOG_SEPARAR_ITEM, DIALOG_STYLE_INPUT, "{fff000}# Separar Itens", "{33ccff}Digite a quantia que voce deseja separar deste item.", "Ok", "Sair");
							}
						}
					}
				}
			}
			else
				PC_EmulateCommand(playerid, "/mochila");
		}
		case DIALOG_SEPARAR_ITEM:{
			if(response){
				new slot = GetPVarInt(playerid, "slot");
				if(strval(inputtext) >= ItemInfo[playerid][slot][Quantia] || !Number(inputtext) || strval(inputtext) < 1){
					ShowPlayerDialog(playerid, DIALOG_SEPARAR_ITEM, DIALOG_STYLE_INPUT, "{fff000}# Separar Itens", "{33ccff}Digite a quantia que voce deseja separar deste item.", "Ok", "Sair");
					SendClientMessage(playerid, LIGHTBLUE, "* Voce digitou um valor Invalido.");
				}
				else{
					if(!MochilaCheia(playerid)){
						AdicionarItemN(playerid, ItemInfo[playerid][slot][Item], strval(inputtext));
						ItemInfo[playerid][slot][Quantia] -= strval(inputtext);
						SendClientMessage(playerid, LIGHTBLUE, "* Item separado com sucesso.");
						PC_EmulateCommand(playerid, "/mochila");
					}
					else{
						SendClientMessage(playerid, LIGHTBLUE, "* Sua mochila esta cheia.");
						PC_EmulateCommand(playerid, "/mochila");
					}
				}
			}
			else{
				PC_EmulateCommand(playerid, "/mochila");
			}
		}
		case DIALOG_OPCAODROP:{
			if(response){
				if(listitem == 0){
					new str[144];
					new slot = GetPVarInt(playerid, "slot");
				   	format(str, sizeof(str), "{ff0000}[AVISO]\n\n{33ccff}Tem certeza que deseja dropar o item %s(%dx) ?", InventarioName(ItemInfo[playerid][slot][Item]), ItemInfo[playerid][slot][Quantia]);
				   	ShowPlayerDialog(playerid, DIALOG_CERTEZADROP, DIALOG_STYLE_MSGBOX, "{fff000}Nota De Aviso", str, "Sim", "Nao");
				}
				if(listitem == 1){
					ShowPlayerDialog(playerid, DIALOG_QUANTIADROP, DIALOG_STYLE_INPUT, "{ff0000}# Quantia Drop", "{33ccff}Digite no campo a baixo a quantia desejada para dropar.", "Dropar", "Retornar");
				}
			}
			else
				PC_EmulateCommand(playerid, "/mochila");
		}
		case DIALOG_QUANTIADROP:{
			if(response){
				new slot = GetPVarInt(playerid, "slot"), quantia = strval(inputtext);
				if(!Number(inputtext) || !strlen(inputtext) || quantia >= ItemInfo[playerid][slot][Quantia]){
					PC_EmulateCommand(playerid, "/mochila");
					SendClientMessage(playerid, LIGHTBLUE, "* Voce digitou uma quantia invalida.");
				}
				else{
					CriarItem(playerid, ItemInfo[playerid][slot][Item], quantia);
					ItemInfo[playerid][slot][Quantia] -= quantia;
					new str[80];
					format(str, sizeof str, "** %s dropou um item no chao.", nome(playerid));
					MensagemLocal(25.0, playerid, 0xC2A2DAFF, str, true);
					if(ItemInfo[playerid][slot][Quantia] == 0){
						ItemInfo[playerid][slot][Item] = NADA;
					}
				}
			}
		}
		case DIALOG_MOCHILA:{
		    if(response){
		        if(listitem >= 0){
		        	for(new i; i<32; i++){
		        		if(ItemInfo[playerid][i][Item] != NADA){
				        	if(listitem == i){
								SetPVarInt(playerid, "slot", listitem);
								ShowPlayerDialog(playerid, DIALOG_FUNCOESMOCHILA, DIALOG_STYLE_LIST, "{fff000}Funcoes Disponiveis", "Usar\nExcluir\nSeparar Item", "Select", "Sair");
								break;
							}
							else
								continue;
						}
						else
							listitem++;
					}
				}
			}
		}
		case DIALOG_MERCADINHO:{
		    if(response){

				
				switch(listitem){
				    case 0:{
				    	if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
				        if(GetPlayerCash(playerid) < 35) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
						if(PlayerInfo[playerid][Mochila] == 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja tem uma mochila.");
						PlayerInfo[playerid][Mochila] = 1;
						SendClientMessage(playerid, -1, "{33AA33}|INFO| Voce comprou uma Mochila por 35$.");
						GivePlayerCash(playerid, -35);
						new Query[90];
						mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Mochilas` (`userid`, `TemMochila`) VALUES ('%d', '%d')", PlayerInfo[playerid][IDFixo], PlayerInfo[playerid][Mochila]);
						mysql_tquery(Dados, Query);
						PC_EmulateCommand(playerid, "/menu");
						ResetarMochila(playerid);
						//(playerid, GetPVarInt(playerid, "Menuid"), 35);
						return 1;
					}
					case 1:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
					    if(GetPlayerCash(playerid) < 699) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
					    GivePlayerCash(playerid, -699);
					    AdicionarItem(playerid, CELULAR, 1);
					    SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um CELULAR.");
					    PC_EmulateCommand(playerid, "/menu");
					    //(playerid, GetPVarInt(playerid, "Menuid"), 1000);
					}
					case 2:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
					    if(GetPlayerCash(playerid) < 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
					    GivePlayerCash(playerid, -10);
					    AdicionarItem(playerid, CREDITOS, 10);
					    SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de recarregar 10 CREDITOS.");
					    PC_EmulateCommand(playerid, "/menu");
					    //(playerid, GetPVarInt(playerid, "Menuid"), 10);
					}
					case 3:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
					    if(GetPlayerCash(playerid) < 25) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
					    GivePlayerCash(playerid, -25);
					    AdicionarItem(playerid, CHIP, 1);
					    SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um CHIP da vivo.");
					    PC_EmulateCommand(playerid, "/menu");
					    //(playerid, GetPVarInt(playerid, "Menuid"), 25);
					}
					case 4:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
					    if(GetPlayerCash(playerid) < 170) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
					    GivePlayerCash(playerid, -170);
					    AdicionarItem(playerid, CAPACETE, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um CAPACETE.");
						PC_EmulateCommand(playerid, "/menu");
						//(playerid, GetPVarInt(playerid, "Menuid"), 170);
					}
					case 5:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
						if(GetPlayerCash(playerid) < 200) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
						GivePlayerCash(playerid, -200);
						AdicionarItem(playerid, RADINHO, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um RADINHO.");
						PC_EmulateCommand(playerid, "/menu");
						//(playerid, GetPVarInt(playerid, "Menuid"), 200);
					}
					case 6:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
						if(GetPlayerCash(playerid) < 25) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
						GivePlayerCash(playerid, -25);
						AdicionarItem(playerid, LEITE, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um LEITE.");
						PC_EmulateCommand(playerid, "/menu");			
						//(playerid, GetPVarInt(playerid, "Menuid"), 25);			
					}
					case 7:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
						GivePlayerCash(playerid, -500);
						AdicionarItem(playerid, MP3, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um MP3.");
						PC_EmulateCommand(playerid, "/menu");
						//(playerid, GetPVarInt(playerid, "Menuid"), 500);
					}
					case 8:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						if(GetPlayerCash(playerid) < 50) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
						GivePlayerCash(playerid, -50);
						AdicionarItem(playerid, GALAO_VAZIO, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um Galao Vazio.");
						PC_EmulateCommand(playerid, "/menu");	
						//(playerid, GetPVarInt(playerid, "Menuid"), 50);					
					}
					case 9:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						if(GetPlayerCash(playerid) < 40) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
						GivePlayerCash(playerid, -40);
						AdicionarItem(playerid, REDE, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar uma rede de Pesca.");						PC_EmulateCommand(playerid, "/menu");	
						//(playerid, GetPVarInt(playerid, "Menuid"), 50);					
					}
					case 10:{
						if(PlayerInfo[playerid][Emprego] != LEITEIRO) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode vender LEITEs.");
						if(!TrabalhandoEmprego[playerid][LEITEIRO]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar trabalhando para vender LEITE!");
						//if(!ISP(playerid, 3.0, -377.46396, -1449.73047, 25.64083)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta perto do Eric Do LEITE Morno para vender os LEITEs.");
						if(LEITEs[playerid] < 1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem LEITEs para vender!");
						new str[60];
						format(str, sizeof str, "Voce vendeu %dL de LEITE por {33aa33}%dR$", LEITEs[playerid], 20*LEITEs[playerid]);
						SendClientMessage(playerid, LIGHTBLUE, str);
						LEITEs[playerid] = 0;
						GameTextForPlayer(playerid, "~B~PayDay aumentado!", 3000, 3);
						PC_EmulateCommand(playerid, "/menu");
					}
				}
			}
		}
		case DIALOG_CRIANDOINTS:{
		    if(response){//Mercadinho\nPrefeitura\nDp Policial"
		    	/*enum tInterior{
					InteriorName[32],
					Float:IX,Float:IY, Float:IZ, icon, INTID
				}

				new interiorinfos[][tInterior] = {*/
				new lojanome[32], id = listitem;
			    GetPVarString(playerid, "nomedaloja", lojanome, sizeof lojanome);
				new Float:Pos[3];
				GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
				CriarInterior(lojanome,interiorinfos[id][INTID],Pos[0], Pos[1], Pos[2], interiorinfos[id][IX],interiorinfos[id][IY],interiorinfos[id][IZ],interiorinfos[id][icon]);
			}
		}
		case DIALOG_MEDEMITIR:{
		    if(response){
				new Query[90];
				format(Query, sizeof Query, "%s se demitiu (%s)", nome(playerid), OrgGm[PlayerInfo[playerid][Org]][OrgNome]);
				AdicionarLogs(Query);
		        if(PlayerInfo[playerid][Cargo] == 10){
					format(OrgInfo[PlayerInfo[playerid][Org]][OrgLider], 24, "Ninguem");
					format(MyBuffer, 200, "{%s}Lider %s da(o) %s acaba de pedir demissao.",OrgGm[PlayerInfo[playerid][Org]][HexColor], nome(playerid), OrgGm[PlayerInfo[playerid][Org]][OrgNome]);
					SendClientMessageToAll(-1, MyBuffer);
					SalvarOrg(PlayerInfo[playerid][Org]);
					PlayerInfo[playerid][Org] = 0;
					PlayerInfo[playerid][Cargo] = 0;
					SpawnPlayer(playerid);
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de pedir demissao de sua organizacao, agora e um civil.");
				}
				else{
					new str[144];
					format(str, sizeof(str), "{%s}Membro %s acaba de pedir demissao.",OrgGm[PlayerInfo[playerid][Org]][HexColor], nome(playerid));
					MessageOrg(PlayerInfo[playerid][Org], -1, str);
					OrgInfo[PlayerInfo[playerid][Org]][Vagas] ++;
					PlayerInfo[playerid][Org] = 0;
					PlayerInfo[playerid][Cargo] = 0;
					SpawnPlayer(playerid);
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de pedir demissao de sua organizacao, agora e um civil.");
					SalvarConta(playerid);
				}
			}
			else
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce dessistiu de se demitir.");
		}
		case DIALOG_OFCASA:{
	        new valor = GetPVarInt(playerid, "valorcasa"), idcasa = GetPVarInt(playerid, "idcasa"), dono = GetPVarInt(playerid, "quemcasa");
	        if(response){
				if(GetPlayerCash(playerid) < valor){
					SendClientMessage(playerid, -1, "|INFO| - Voce nao tem dinheiro suficiente.");
					Negociando[dono] = false;
				}
				if(ContarCasas(playerid)){
					SendClientMessage(playerid, -1, "|INFO| Voce ja possui o limite de casas.");
					Negociando[dono] = false;
				}
				if(strcmp(InfoCasa[idcasa][Dono], nome(dono), false, 24)){
					SendClientMessage(playerid, -1, "Esta casa nao e mais do jogador que voce estava negociando.");
					Negociando[dono] = false;
				}
				if(!IsPlayerConnectedP(dono)){
				    SendClientMessage(playerid, -1, "|INFO| - O Dono da casa desconectou.");
				}
				if(!InfoCasa[idcasa][CasaCriada]){
				    SendClientMessage(playerid, -1, "|INFO| - A Casa nao existe mais no servidor.");
				    Negociando[dono] = false;
				}
				format(InfoCasa[idcasa][Dono], 24, nome(playerid));
				new str[190];
				format(str, sizeof(str), TEXTO_COMPRADO, idcasa, nome(playerid), CoordZone(InfoCasa[idcasa][CasaX], InfoCasa[idcasa][CasaY], InfoCasa[idcasa][CasaZ]), InfoCasa[idcasa][Aluguel]);
				UpdateDynamic3DTextLabelText(InfoCasa[idcasa][CasaLabel], -1, str);
				SetPlayerPosEx(playerid, InfoCasa[idcasa][CasaX], InfoCasa[idcasa][CasaY], InfoCasa[idcasa][CasaZ]);
				GivePlayerCash(dono, valor);
				SendClientMessage(dono, LIGHTBLUE, "* Casa vendida com sucesso.");
				SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de adquirir uma nova residencia, Use 'Y' entrar para entrar .");
				DeletePVar(playerid, "valorcasa");
				DeletePVar(playerid, "idcasa");
				DeletePVar(playerid, "quemcasa");
			}
			else{
			    Negociando[dono] = false;
				SendClientMessage(dono, -1, "|INFO| - O Jogador recusou a compra.");
				DeletePVar(playerid, "valorcasa");
				DeletePVar(playerid, "idcasa");
				DeletePVar(playerid, "quemcasa");
			}
		}
		case DIALOG_CRIARCASA:{
	        if(response){
         		new Float: X, Float: Y, Float: Z;    		
         		GetPlayerPos(playerid, X, Y, Z);
	            CriarCasa(GetPVarInt(playerid, "VipFromHouse"),X, Y, Z, interiorhouses[listitem][hx],interiorhouses[listitem][hy],interiorhouses[listitem][hz], interiorhouses[listitem][interiorCH], GetPVarInt(playerid, "Preco"));
			}
		}
		case DIALOG_CONVIDARORG:{
		    if(response){
				new org = GetPVarInt(playerid, "OrgConvidou"), id = GetPVarInt(playerid, "quemconvidouorg");
				PlayerInfo[playerid][Org] = org;
				PlayerInfo[playerid][Cargo] = 1;
				EstiloSpawn[playerid] = SPAWN_ORG;
				OrgInfo[PlayerInfo[playerid][Org]][Vagas] --;
				SpawnPlayer(playerid);
				SendClientMessage(id, LIGHTBLUE, "{33aa33}|INFO| - O Jogador aceitou o pedido.");
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Seja bem vindo a organizacao.");
				DeletePVar(playerid, "OrgConvidou");
				DeletePVar(playerid, "quemconvidouorg");
				SalvarConta(playerid);
				new Query[90];
				format(Query, sizeof Query, "%s convidou org %s", nome(id), nome(playerid));
				AdicionarLogs(Query);
			}
			else{
                new id = GetPVarInt(playerid, "quemconvidouorg");
                SendClientMessage(id, -1, "{ff0000}|INFO| - O Jogador recusou o pedido!");
                SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce negou o pedido.");
                DeletePVar(playerid, "quemconvidouorg");
                DeletePVar(playerid, "OrgConvidou");
			}
		}
		case DIALOG_INUTIL:{
			Trigger(playerid, SEM_OP);
		}
		case DIALOG_SPAWNVEH:{
		    if(response){
				new id = PlayerInfo[playerid][Org];
	            if(OrgVeiculo[id][listitem][VeiculoModelo] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode spawnar um veiculo invalido.");
             	if(OrgInfo[id][Spawnados] >= 15) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua org ja spawnou muitos veiculos.");
				OrgInfo[id][Spawnados] ++;
				if(OrgVeiculo[id][listitem][VeiculoSpawn][0] != 0){
														   //CriarVeiculo(OrgVeiculo[id][listitem][VeiculoModelo], OrgVeiculo[id][listitem][VeiculoSpawn][0], OrgVeiculo[id][listitem][VeiculoSpawn][1], OrgVeiculo[id][listitem][VeiculoSpawn][2], OrgVeiculo[id][listitem][VeiculoSpawn][3], colo1, colo2, resawn_delay, addsien=0)
					CarroOrg[id][OrgInfo[id][Spawnados]] = CriarVeiculo("spawn de org", OrgVeiculo[id][listitem][VeiculoModelo], OrgVeiculo[id][listitem][VeiculoSpawn][0], OrgVeiculo[id][listitem][VeiculoSpawn][1], OrgVeiculo[id][listitem][VeiculoSpawn][2], OrgVeiculo[id][listitem][VeiculoSpawn][3], 1, 1, -1, (IsPolice(PlayerInfo[playerid][Org]) ? (true) : (false) ));
				}
				else{
					CarroOrg[id][OrgInfo[id][Spawnados]] = CriarVeiculo("spawn de org", OrgVeiculo[id][listitem][VeiculoModelo], OrgInfo[id][OrgPickPos][0], OrgInfo[id][OrgPickPos][1], OrgInfo[id][OrgPickPos][2], 90.0, 1, 1, -1, (IsPolice(PlayerInfo[playerid][Org]) ? (true) : (false) ));
				}
				if(OrgVeiculo[id][listitem][VeiculoModelo] == 476) MunBomb[CarroOrg[id][OrgInfo[id][Spawnados]]] = 6;				
				PutPlayerInVehicle(playerid, CarroOrg[id][OrgInfo[id][Spawnados]], 0);
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce spawnou o veiculo com sucesso.");
				OrgCarro[CarroOrg[id][OrgInfo[id][Spawnados]]] = id;
				RC[CarroOrg[id][OrgInfo[id][Spawnados]]] = true;
				//ShowPlayerDialog(playerid, DIALOG_TELEPORT_VEH, DIALOG_STYLE_MSGBOX, "{fff000}Teleportar Veiculo", "{aa33aa}Deseja teleportar este veiculo para cima?\n{33aa33}Util para avioes e helicopteros.", "{33aa33}Sim", "{ff0000}Nao");
				ChangeVehicleColours(GetPlayerVehicleID(playerid), OrgInfo[PlayerInfo[playerid][Org]][VehCor], OrgInfo[PlayerInfo[playerid][Org]][VehCor]);
			}
		}
	    case DIALOG_MENUCORPS:{
	        if(response){
	            switch(listitem){
	                case 0:{
					    new id = PlayerInfo[playerid][Org]; // menu
					    new str2[300], str[300];
					    strcat(str2, "{33ccff}ID\t{33ccff}Veiculo\n");
						for(new i; i<MAX_CARRO_ORG; i++){
		 	  				format(str, sizeof(str), "(%d)\t%s\n", i, GetVehicleName(OrgVeiculo[id][i][VeiculoModelo]));
 							strcat(str2, str);
						}
						ShowPlayerDialog(playerid, DIALOG_SPAWNVEH, 5, "{fff000}Selecione", str2, "Ok", "Sair");
					}
	                case 1:{
	                	ShowDialogEquipar(playerid);
	                }
	                case 2:{
	                	ShowPlayerDialog(playerid, DIALOG_EQUIPARSKIN,DIALOG_STYLE_LIST, "{fff000}Equipar Skin", "Skin Padrao\nSkin ROCAM\nSkin Tatica\nSkin Investigativa\n\
	                		Skin Militar\nSkin Rural\nSkin Feminina\n{ff0000}Remover Skin", "Ok", "Sair");
	                }
				}
			}
		}
		case DIALOG_MENUORGS:{
	        if(response){
	            switch(listitem){
	                case 0:{
					    new id = PlayerInfo[playerid][Org]; // menu
					    new str2[300], str[300];
					    strcat(str2, "{33ccff}ID\t{33ccff}Veiculo\n");
						for(new i; i<MAX_CARRO_ORG; i++){
		 	  				format(str, sizeof(str), "(%d)\t%s\n", i, GetVehicleName(OrgVeiculo[id][i][VeiculoModelo]));
 							strcat(str2, str);
						}
						ShowPlayerDialog(playerid, DIALOG_SPAWNVEH, 5, "{fff000}Selecione", str2, "Ok", "Sair");
					}
	                case 1:{
	                	ShowDialogEquipar(playerid);
	                }
	                case 2:{
						if(PlayerInfo[playerid][Cargo] != 10) return SendClientMessage(playerid, LIGHTBLUE, "Somente lideres podem pegar Maconha.");
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						new org = PlayerInfo[playerid][Org];
						if(OrgInfo[org][MaconhaOrg] > 0){
							OrgInfo[org][MaconhaOrg] -= 90;
							AdicionarItem(playerid, MACONHA, 90);
							SendClientMessage(playerid, LIGHTBLUE, "* Voce pegou 90 gramas de Maconha. Ela foi para a sua Mochila.");
						}
						else
							SendClientMessage(playerid, LIGHTBLUE, "* A Org esta sem Maconha em estoque!");
	                }
				}
			}
		}
		case DIALOG_EQUIPAMENTOORG:{
			if(response){
				if(OrgInfo[PlayerInfo[playerid][Org]][Equipamentos] < 1) return SendClientMessage(playerid, LIGHTBLUE, "* Organizacao sem equipamentos!");

			
				SetPlayerArmour(playerid, 30.0);
				OrgInfo[PlayerInfo[playerid][Org]][Equipamentos] --;
				switch(listitem){
					case 0: GivePlayerWeapon(playerid, WEAPON_AK47, 500);
					case 1: GivePlayerWeapon(playerid, WEAPON_DEAGLE, 60);
					case 2:{
						SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 500);
						GivePlayerWeapon(playerid, WEAPON_COLT45, 50);
						SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 500);
					} 
					case 3: GivePlayerWeapon(playerid, WEAPON_SHOTGUN, 20);
					case 4: GivePlayerWeapon(playerid, WEAPON_BAT, 1);
					case 5:{
						if(PlayerInfo[playerid][Org] != 18) return SendClientMessage(playerid, LIGHTBLUE, "Somente TERRORISTAS podem pegar esta arma.");
						GivePlayerWeapon(playerid, WEAPON_ROCKETLAUNCHER, 1);
					}
					case 6:{
						if(PlayerInfo[playerid][Org] != 18) return SendClientMessage(playerid, LIGHTBLUE, "Somente TERRORISTAS podem pegar esta arma.");
						GivePlayerWeapon(playerid, WEAPON_SNIPER, 3);
					}
				}
			}
		}
		case DIALOG_EQUIPAMENTOCORP:{
			if(response){
				if(OrgInfo[PlayerInfo[playerid][Org]][OrgCofre] < 250) return SendClientMessage(playerid, LIGHTBLUE, "* Corporacao sem dinheiro no Cofre!");

				OrgInfo[PlayerInfo[playerid][Org]][OrgCofre] -= 250;
				SetPlayerArmour(playerid, 30.0);
				//M4\nDesert\n9mm\nEscopeta\nCacetete\nParaquedas\nRPG\nSniper
				switch(listitem){
					case 0: GivePlayerWeapon(playerid,WEAPON_M4, 500);
					case 1: GivePlayerWeapon(playerid, WEAPON_DEAGLE, 60);
					case 2:{
						SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 500);
						GivePlayerWeapon(playerid, WEAPON_COLT45, 50);
						SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 500);
						SendClientMessage(playerid, LIGHTBLUE, "* Use /ativartaser para usar esta pistola como arma de choque.");
					} 
					case 3: GivePlayerWeapon(playerid, WEAPON_SHOTGUN, 20);
					case 4: GivePlayerWeapon(playerid, WEAPON_NITESTICK, 1);
					case 5:{							
						GivePlayerWeapon(playerid, WEAPON_PARACHUTE, 1);
					}
					case 6:{
						if(PlayerInfo[playerid][Org] != 12) return SendClientMessage(playerid, LIGHTBLUE, "Somente MEMBROS do EXERCITO podem pegar esta arma.");
						GivePlayerWeapon(playerid, WEAPON_ROCKETLAUNCHER, 1);
					}
					case 7:{
						if(PlayerInfo[playerid][Org] == 11 || PlayerInfo[playerid][Org] == 12 || PlayerInfo[playerid][Org] == 3){
							GivePlayerWeapon(playerid, WEAPON_SNIPER, 3);
						}
						else
							SendClientMessage(playerid, LIGHTBLUE, "Sua organizacao NAO PODE utilizar SNIPER.");
					}
				}
			}
		} 
		case DIALOG_PXVEHICLE:
		{
	        if(response){// pvar = carid
				if(listitem >= 0){
					new slot;
		            for(new i; i<MAXCONCE; i++){
		                if(VehInfo[playerid][i][IDCarro] != 0){
		                    if(listitem == slot){
		                        SetPVarInt(playerid, "caridd", i);
								break;
							}
							else
							    slot++;
						}
						else
						    continue;
					}
					new id = GetPVarInt(playerid, "caridd");
					if(VehInfo[playerid][id][Apreendido]){
						SendClientMessage(playerid, LIGHTBLUE, "IPVA | Este veiculo foi apreendido por falta de pagamento de IPVA.");
						DeletePVar(playerid, "caridd");
					}
					else{
						if(DistVehicle(playerid, VehInfo[playerid][id][Carro]) < 100.0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce so pode puxar veiculos com 100 metros de distancia ou mais! Vai la buscar!");
						if(IsVehicleOccupied(VehInfo[playerid][id][Carro])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode puxar este veiculo! Ele esta ocupado.");
						new str[128];
						format(str, sizeof str, "|INFO| Voce puxou o veiculo %s.", GetVehicleName(VehInfo[playerid][id][IDCarro]));
						SendClientMessage(playerid, Amarelo, str);
						new r = random(sizeof(randomcoordspawn));
						SetVehiclePos(VehInfo[playerid][id][Carro], randomcoordspawn[r][0], randomcoordspawn[r][1], randomcoordspawn[r][2]);
						SetVehicleZAngle(VehInfo[playerid][id][Carro], randomcoordspawn[r][3]);
						DeletePVar(playerid, "caridd");
					}
				}
			}
		} 
		case DIALOG_FUNCOES_ALUGUEL:{
			if(response){
				if(listitem == 0){
					ConfiguracaoAluguel(playerid, OPAL_TRANCAR);
				}
				if(listitem == 1){
					ConfiguracaoAluguel(playerid, OPAL_LOCALIZAR);
				}
				if(listitem == 2){
					ConfiguracaoAluguel(playerid, OPAL_ESTACIONAR);
				}
			}
		}
		case DIALOG_CARMENU_ALUGUEL:{
			if(response){
				if(listitem >= 0){
					new slot;
		            for(new i; i<MAX_ALUGUEIS; i++){
		                if(MeuCarroAlugado(playerid, i)){
		                    if(listitem == slot){
		                    	slot = i;
		                        ConfiguracaoAluguel(playerid, OPAL_DEFINIR, i);
								break;
							}
							else
							    slot++;
						}
						else
							continue;
					}
					
					if(!MeuCarroAlugado(playerid, slot)){
						SendClientMessage(playerid, LIGHTRED, "Este veiculo nao e mais seu.");
						
					}
					else{
						new str[128];
						format(str, sizeof str, "Voce selecionou o veiculo %s.", GetVehicleName(InfoCAluguel[slot][VeiculoModelo]));
						SendClientMessage(playerid, LIGHTBLUE, str);
						ShowPlayerDialog(playerid, DIALOG_FUNCOES_ALUGUEL, DIALOG_STYLE_LIST, "{fff000}O Que deseja fazer?", "Trancar\nLocalizar\nEstacionar", "Ok", "Sair");
					}
				}
			}
		}         
		case DIALOG_CARMENU:
		{
	        if(response){// pvar = carid
				if(listitem >= 0){
					new slot;
		            for(new i; i<MAXCONCE; i++){
		                if(VehInfo[playerid][i][IDCarro] != 0){
		                    if(listitem == slot){
		                        SetPVarInt(playerid, "carid", i);
								break;
							}
							else
							    slot++;
						}
						else
						    continue;
					}
					new id = GetPVarInt(playerid, "carid");
					if(VehInfo[playerid][id][Apreendido]){
						SendClientMessage(playerid, LIGHTBLUE, "IPVA | Este veiculo foi apreendido por falta de pagamento de IPVA.");
						DeletePVar(playerid, "carid");
					}
					else{
						new str[128];
						format(str, sizeof str, "|INFO| Voce selecionou o veiculo %s.", GetVehicleName(VehInfo[playerid][GetPVarInt(playerid, "carid")][IDCarro]));
						SendClientMessage(playerid, Amarelo, str);
						ShowPlayerDialog(playerid, DIALOG_FUNCOES, DIALOG_STYLE_LIST, "{fff000}O Que deseja fazer?", "Estacionar\nLocalizar\nVender\nVender Para Jogador\nTrancar/Destrancar\nAbrir/Fechar Capo\nPorta Malas", "Ok", "Sair");
					}
				}
			}
		}
		case DIALOG_FUNCOES:
		{
		    if(response)
		    {
		        if(listitem == 0)
		        { //parte estacionar
		            new idd = GetPVarInt(playerid, "carid"), Float: Hp;

		            if(VeiculoConfiguracao[VehInfo[playerid][idd][Carro]][Quebrado] || VeiculoConfiguracao[VehInfo[playerid][idd][Carro]][Desmanchado]) return SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo esta quebrado! Voce nao pode estacionar.");
		            if(!IsPlayerInVehicle(playerid, VehInfo[playerid][idd][Carro])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar no seu veiculo.");
					GetVehicleHealth(GetPlayerVehicleID(playerid), Hp);
					
					new Float:pos[4];
					salvarComponentes(playerid, idd);
					GetVehiclePos(VehInfo[playerid][idd][Carro], pos[0], pos[1], pos[2]);
					GetVehicleZAngle(VehInfo[playerid][idd][Carro], pos[3]);
					if(!isnull(VehInfo[playerid][idd][Placa])){
	       				Delete3DTextLabel(VehInfo[playerid][idd][PlacaText]);
	       				//VehInfo[playerid][i][PlacaText] = Create3DTextLabel(fString("%s", VehInfo[playerid][i][Placa]), -1, 0,0,0, 9.0, 0);// testLOS=0)
	       				//Attach3DTextLabelToVehicle(VehInfo[playerid][i][PlacaText], VehInfo[playerid][i][Carro], 0.0,0.0,0.0);
	       			}
	       			new gasolinadoveh = VeiculoInfo[VehInfo[playerid][idd][Carro]][Gasolina];
					VehInfo[playerid][idd][Vx] = pos[0];
					VehInfo[playerid][idd][Vy] = pos[1];
					VehInfo[playerid][idd][Vz] = pos[2];
					VehInfo[playerid][idd][Rotacao] = pos[3];
					DestroyVehicleEx(VehInfo[playerid][idd][Carro], "Estacionado (Conce)");
					VehInfo[playerid][idd][Carro] = CriarVeiculo("veiculo estacionado", VehInfo[playerid][idd][IDCarro], VehInfo[playerid][idd][Vx], VehInfo[playerid][idd][Vy], VehInfo[playerid][idd][Vz], VehInfo[playerid][idd][Rotacao], VeiculoInfo[VehInfo[playerid][idd][Carro]][CorVeiculo][0],VeiculoInfo[VehInfo[playerid][idd][Carro]][CorVeiculo][1], -1);
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Veiculo estacionado nesta posicao.");
					SetPVarInt(playerid, "carid", -1);
					PutPlayerInVehicle(playerid, VehInfo[playerid][idd][Carro], 0);
					if(!isnull(VehInfo[playerid][idd][Placa])){
	       				//Delete3DTextLabel(VehInfo[playerid][id][PlacaText]);
	       				new str[87];
	       				format(str, sizeof str, "%s", VehInfo[playerid][idd][Placa]);
	       				VehInfo[playerid][idd][PlacaText] = Create3DTextLabel(str, -1, 0,0,0, 9.0, 0);// testLOS=0)
	       				Attach3DTextLabelToVehicle(VehInfo[playerid][idd][PlacaText], VehInfo[playerid][idd][Carro], 0.0,0.0,0.0);
	       			}
	       			VeiculoInfo[VehInfo[playerid][idd][Carro]][Gasolina] = gasolinadoveh;
	       			carregarComponentes(playerid, idd);
	       			SetVehicleHealth(VehInfo[playerid][idd][Carro], Hp);
				}
				if(listitem == 1){
				    new i = GetPVarInt(playerid, "carid");
				    new Float: X, Float: Y, Float: Z;
				    GetVehiclePos(VehInfo[playerid][i][Carro],X,Y,Z);
				    SetPlayerCheckpoint(playerid,X,Y,Z, 3.0);
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce marcou no seu Mini-Mapa a posicao do veiculo.");
					SetPVarInt(playerid, "carid", -1);
				}
				if(listitem == 2)
				{
				    new str[128], idd = GetPVarInt(playerid, "carid");
				    format(str, sizeof(str), "{33ccff}Tem certeza que deseja vender seu %s ?", GetVehicleName(VehInfo[playerid][idd][IDCarro]));
					ShowPlayerDialog(playerid, DIALOG_VENDERCONCE, DIALOG_STYLE_MSGBOX, "{fff000}Venda Do Veiculo", str, "Sim", "Nao");
				}
				if(listitem == 3){
					MyBuffer[0] = EOS;
					new Float: X, Float: Y, Float:Z, str[230], ctg;
		            GetPlayerPos(playerid, X,Y,Z);
					foreach(new i: Player){
					    if(i != playerid && ISP(i, 5.5,X, Y, Z)){
					        ctg++;
					        format(str, sizeof(str), "%d\t%s\n", PlayerInfo[i][IDFixo], nome(i));
					        strcat(MyBuffer, str);
						}
					}
					if(ctg == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Nao ha ninguem perto de voce.");
					ShowPlayerDialog(playerid, DIALOG_SELECIONAR_NEGO, DIALOG_STYLE_LIST, "{fff000}Selecione O Jogador", MyBuffer, "{33aa33}Select", "{ff0000}Sair");
				}
				if(listitem == 4)
				{
				    new Float:pos[3], id = GetPVarInt(playerid, "carid");
				    GetVehiclePos(VehInfo[playerid][id][Carro], pos[0], pos[1], pos[2]);

				    if(!IsPlayerInRangeOfPoint(playerid, 20.0, pos[0], pos[1], pos[2])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Voce precisa estar ate 20 metros perto do veiculo.");
			     	new bool: engine,bool:lights,bool:alarm,bool:doors,bool:bonnet,bool:boot,bool:objective;
				    GetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,doors,bonnet,boot,objective);

			     	if(doors == true)
			     	{
			     	    VeiculoTrancado[VehInfo[playerid][id][Carro]] = false;
		 				SetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,false,bonnet,boot,objective);
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Seu veiculo foi destrancado.");
					}
					else{
						SetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,true,bonnet,boot,objective);
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Seu veiculo foi trancado.");
						VeiculoTrancado[VehInfo[playerid][id][Carro]] = true;
					}
				}
				if(listitem == 5)
				{
					new id = GetPVarInt(playerid, "carid");
					new bool:engine,bool:lights,bool:alarm,bool:doors,bool:bonnet,bool:boot,bool:objective;
					GetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,doors,bonnet,boot,objective);
				 	if(bonnet == false){
				 		SetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,doors,true,boot,objective);
				 		
					}
				 	else{
				 		SetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,doors,false,boot,objective);
						
					}		
				}
				if(listitem == 6){
					PC_EmulateCommand(playerid, "/portamala abrir");
				}
			}
			else
			    SetPVarInt(playerid, "carid", -1);
		}
		case DIALOG_SELECIONAR_NEGO:{
		    if(response){
		    	new lista;
		    	if(listitem >= 0){
			        new Float: X, Float: Y, Float: Z;
			        GetPlayerPos(playerid,X,Y,Z);
			        foreach(new i: Player){
			        	if(ISP(i,5.5, X, Y, Z) && i != playerid){
			   				if(listitem == lista){
				                listitem = i;
				                break;
				            }
				            else
				            	lista++;
						}
						else
							continue;
					}
					SetPVarInt(playerid, "negonegociar", listitem);
					new neginho = GetPVarInt(playerid, "negonegociar");
					MyBuffer[0] = EOS;
					format(MyBuffer, sizeof(MyBuffer), "{33ccff}Voce acaba de selecionar o jogador {fff000}%s.\nAgora escreva abaixo o preco da negociacao.", nome(neginho));
					ShowPlayerDialog(playerid, DIALOG_SELECIONAR_NEGO_2, DIALOG_STYLE_INPUT, "{fff000}Informacao", MyBuffer, "Ok", "Sair");
				}
			}
		}
		case DIALOG_SELECIONAR_NEGO_2:{
		    if(response){
		        if(!Number(inputtext)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pode digitar somente numeros.");
		        new valor = strval(inputtext), quem = GetPVarInt(playerid, "negonegociar");
		        if(valor < 1 || valor > 3000000) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este valor e invalido.");
				if(!IsPlayerConnectedP(quem)){
				    PC_EmulateCommand(playerid, "/menucar");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta offline.");
					DeletePVar(playerid, "negonegociar");
				}
				else if(MaximoVeiculos(quem)){
				    PC_EmulateCommand(playerid, "/menucar");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Jogador possui o maximo de veiculos.");
				    DeletePVar(playerid, "negonegociar");
				}
				else if(GetPlayerCash(quem) < valor){
				    PC_EmulateCommand(playerid, "/menucar");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Jogador nao possui esta quantia em maos.");
				    DeletePVar(playerid, "negonegociar");
				}
				else if(VeiculoVip(VehInfo[playerid][GetPVarInt(playerid, "carid")][IDCarro]) && PlayerInfo[quem][Vip] == 0){
					SendClientMessage(playerid, LIGHTBLUE, "* Voce esta tentando vender um veiculo Vip para um jogador que nao possui Vip! Venda cancelada.");
					DeletePVar(playerid, "negonegociar");
				}
				else{
					MyBuffer[0] = EOS;
					format(MyBuffer, sizeof(MyBuffer), "{33ccff}%s\n\nDeseja comprar o veiculo {ffffff}%s{33ccff} de {fff000}%s{33ccff} no valor de {33aa33}%dR$?", nome(quem), GetVehicleName(VehInfo[playerid][GetPVarInt(playerid, "carid")][IDCarro]), nome(playerid), valor);
					ShowPlayerDialog(quem, DIALOG_SELECIONAR_NEGO_3, DIALOG_STYLE_MSGBOX, "{fff000}Informacao", MyBuffer, "Sim", "Nao");
					SetPVarInt(quem, "valorvendaa", valor);
					SetPVarInt(quem, "iddonegovendaa", playerid);
					SetPVarInt(quem, "slotdavenda", GetPVarInt(playerid, "carid"));
					new str[144];
					format(str, sizeof str, "|INFO| Voce ofereceu o veiculos %s a venda por %dR$ para %s! Aguarde ele responder...", GetVehicleName(VehInfo[playerid][GetPVarInt(playerid, "carid")][IDCarro]), valor, nome(quem));
					SendClientMessage(playerid, Amarelo, str);
				}
			}
		}
		case DIALOG_SELECIONAR_NEGO_3:{
			new id = GetPVarInt(playerid, "iddonegovendaa"), valor = GetPVarInt(playerid, "valorvendaa"), slot = GetPVarInt(playerid, "slotdavenda");
		    if(!response){
		    	new str[79];
		    	format(str, sizeof str, "|INFO| %s se recusou comprar o veiculo!", nome(playerid));

				SendClientMessage(id, LIGHTBLUE, str);
				DeletePVar(id, "negonegociar");
				DeletePVar(playerid, "valorvendaa");
				DeletePVar(playerid, "iddonegovendaa");
				DeletePVar(playerid, "slotdavenda");
				return 1;
			}
			else{
			    if(!IsPlayerConnectedP(id)){
			        SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Jogador que voce estava negociando ficou OFFLINE.");
					DeletePVar(playerid, "valorvendaa");
					DeletePVar(playerid, "iddonegovendaa");
					DeletePVar(playerid, "slotdavenda");
					return 1;
				}
			    else if(MaximoVeiculos(playerid) || GetPlayerCash(playerid) < valor){
					SendClientMessage(id, LIGHTBLUE, "|INFO| %s ja possui o maximo de veiculos ou nao tem o dinheiro em maos.");
			        FalharVenda(playerid, id);
			        return 1;
				}
				else{
					for(new i; i<MAXCONCE; i++)
			        {
			            if(VehInfo[playerid][i][IDCarro] == 0){
			                VehInfo[playerid][i] = VehInfo[id][slot];
			                VehInfo[playerid][i][vehid] = i;
							GivePlayerCash(playerid, -valor);
							GivePlayerCash(id, valor);
							SendClientMessage(id, Amarelo, "|INFO| Sucesso! O Jogador acaba de comprar o seu veiculo.");
							new str[144];
							format(str, sizeof str, "|INFO| Voce acaba de comprar um novo veiculo do jogador %s.", nome(id));

							SendClientMessage(playerid, LIGHTBLUE, str);
						
							
							format(str, sizeof str, "%s", VehInfo[playerid][i][Placa]);
							if(!isnull(VehInfo[playerid][i][Placa])){//plaque
	   							Delete3DTextLabel(VehInfo[playerid][i][PlacaText]);       	
	       						VehInfo[playerid][i][PlacaText] = Create3DTextLabel(str, -1, 0,0,0, 9.0, 0);// testLOS=0)
	       						Attach3DTextLabelToVehicle(VehInfo[playerid][i][PlacaText], VehInfo[playerid][i][Carro], 0.0,0.0,0.0);
      						}	
							new Query[179];
							mysql_format(Dados, Query, sizeof(Query), "UPDATE `Conce` SET `Nome` = '%s', `vehid` = '%d' WHERE `Nome` = '%s' AND `vehid` = '%d'", nome(playerid), i, nome(id), slot);
							mysql_tquery(Dados, Query);
							salvarComponentes(playerid, i);
							carregarComponentes(playerid, i);
						    VeiculoTrancado[VehInfo[playerid][slot][Carro]] = false;
				            VehInfo[id][slot][IDCarro] = -1;
						    new reset[VehicleInfo];
						    VehInfo[id][slot] = reset;
						    FalharVenda(playerid, id);

							break;
						}
					}
				}
			}
		}
		case DIALOG_VENDERCONCE:
		{
			if(response)
			{
			    new Query[128], id = GetPVarInt(playerid, "carid");
			    mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Conce` WHERE `vehid` = '%d' AND `nome` = '%s'", VehInfo[playerid][id][vehid], nome(playerid));
			    mysql_tquery(Dados, Query);
			    VeiculoTrancado[VehInfo[playerid][id][Carro]] = false;
	     		Portas(VehInfo[playerid][id][Carro]);
                
                if(!isnull(VehInfo[playerid][id][Placa])){
	       			Delete3DTextLabel(VehInfo[playerid][id][PlacaText]);
	       		}
				DestroyVehicleEx(VehInfo[playerid][id][Carro], "Venda Para Conce");
			    if(PlayerInfo[playerid][Vip] == 0){
			    	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce vendeu seu veiculo e ganhou metade do valor dele na concessionaria.");
				    for(new i; i<MAX_CARRO_CONCE; i++)
				    {
				        if(carrosCompra[i][carroModel] == VehInfo[playerid][id][IDCarro])
				        {
				            //////////printf("%d, %s, %d, %d antes de vender.", id, nome(playerid), VehInfo[playerid][id][IDCarro], VehInfo[playerid][id][vehid]);
				            GivePlayerCash(playerid, carrosCompra[i][carroPrice] / 2);
				            VehInfo[playerid][id][IDCarro] = -1;
						    new reset[VehicleInfo];
						    VehInfo[playerid][id] = reset;
	                        //////////printf("%d, %s, %d, %d depois de vender.", id, nome(playerid), VehInfo[playerid][id][IDCarro], VehInfo[playerid][id][vehid]);
				            break;
						}
					}
				}
				else{
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce vendeu seu veiculo e ganhou mais da metade do valor dele na concessionaria por ser Vip.");
				    
				    for(new i; i<MAX_CARRO_CONCE; i++)
				    {
				        if(carrosCompra[i][carroModel] == VehInfo[playerid][id][IDCarro])
				        {
				            //////////printf("%d, %s, %d, %d antes de vender.", id, nome(playerid), VehInfo[playerid][id][IDCarro], VehInfo[playerid][id][vehid]);
				            new Float: conta = (0.7) * float(carrosCompra[i][carroPrice]);
				            GivePlayerCash(playerid, floatround(conta));
				            VehInfo[playerid][id][IDCarro] = -1;
						    new reset[VehicleInfo];
						    VehInfo[playerid][id] = reset;
	                        //////////printf("%d, %s, %d, %d depois de vender.", id, nome(playerid), VehInfo[playerid][id][IDCarro], VehInfo[playerid][id][vehid]);
				            break;
						}
					}					
				}
			}
		}
		case DIALOG_COMPRARVEICULO:{
			if(response){
			    if(listitem >= 0){
				    new str[122];
				    format(str, sizeof(str), "{ffffff}Deseja mesmo comprar o veiculo %s ({47d32a}R$%d{ffffff})?", GetVehicleName(carrosCompra[veiculoslot[playerid]][carroModel]), carrosCompra[veiculoslot[playerid]][carroPrice]);
				    ShowPlayerDialog(playerid, DIALOG_COMPRAR, DIALOG_STYLE_MSGBOX, "{fff000}Confirmacao De Compra", str, "Ok", "Sair");
				}
			}
		}
		case DIALOG_COMPRAR:
		{
		    if(response){
		        new id = veiculoslot[playerid];
		        if(GetPlayerCash(playerid) < carrosCompra[id][carroPrice]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
		        if(MaximoVeiculos(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja atingiu o limite de veiculos para comprar.");
		        if(VeiculoVipM(carrosCompra[id][carroModel]) && PlayerInfo[playerid][Vip] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ser Vip para comprar este veiculo.");
		        for(new i; i<MAXCONCE; i++)
		        {
		            if(VehInfo[playerid][i][IDCarro] == 0){
		                new r;
		               	r = random(sizeof(RandCoord));
		               	FecharConce(playerid);
		               	VehInfo[playerid][i][Vx] = RandCoord[r][0];
		               	VehInfo[playerid][i][Vy] = RandCoord[r][1];
		               	VehInfo[playerid][i][Vz] = RandCoord[r][2];	

		                VehInfo[playerid][i][IDCarro] = carrosCompra[id][carroModel];
		                VehInfo[playerid][i][Rotacao] = RandCoord[r][3];
		                VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][0]= 0;
		                VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][1]= 0;
		                VehInfo[playerid][i][vehid] = i;
		                VehInfo[playerid][i][Carro] = CriarVeiculo("comprado", VehInfo[playerid][i][IDCarro], VehInfo[playerid][i][Vx], VehInfo[playerid][i][Vy], VehInfo[playerid][i][Vz], VehInfo[playerid][i][Rotacao], VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][0],VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][1], -1);
						GivePlayerCash(playerid, -carrosCompra[id][carroPrice]);
						SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de comprar um novo veiculo.");
						SendClientMessage(playerid, LIGHTBLUE, "Nao esqueca de emplacar seu carro e evitar Multas.");
						new Query[179];
						mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Conce` (`vehid`, `nome`, `Veiculo`, `X`, `Y`, `Z`, `Rotacao`) VALUES ('%d', '%s', '%d', '%f', '%f', '%f', '%f')", i, nome(playerid), VehInfo[playerid][i][IDCarro],VehInfo[playerid][i][Vx], VehInfo[playerid][i][Vy], VehInfo[playerid][i][Vz], VehInfo[playerid][i][Rotacao]);
						mysql_tquery(Dados, Query);
						//SendClientMessage(playerid, -1, "%d %d", VehInfo[playerid][1][IDCarro], VehInfo[playerid][2][IDCarro]);
						
						format(Query, sizeof Query, "%s buy veh (%d$)", nome(playerid), carrosCompra[id][carroPrice]);
						AdicionarLogs(Query);
						VeiculoInfo[VehInfo[playerid][i][Carro]][Gasolina] = 100;
		
						for(new vc; vc < 20; vc++){
							PlayerTextDrawHide(playerid, ConceMenu[playerid][vc]);
						}
						break;
					}
				}
			}
		}
		case DIALOG_PORTAMALAS_PLAYER:{
			if(response){
				if(listitem >= 0){
					SetPVarInt(playerid, "slotPm", listitem);
					ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
				}
			}
		}
		case DIALOG_PORTAMULA:{
			if(response){
				new item = GetPVarInt(playerid, "slotPm"), carro = GetPVarInt(playerid, "Malas");
				switch(listitem){
					case 0:{
						if(MochilaCheia(playerid)){
							SendClientMessage(playerid, LIGHTBLUE, "* Sua mochila esta cheia, Voce nao pode pegar o item.");
							ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							if(VeiculoConfiguracao[carro][Quantia][item] == 0 || VeiculoConfiguracao[carro][Item][item] == NADA){
								SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
								ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
							}
							else{
								AdicionarItem(playerid, VeiculoConfiguracao[carro][Item][item], VeiculoConfiguracao[carro][Quantia][item]);
								new str[144], Float: X, Float: Y, Float: Z;
								GetPlayerPos(playerid, X, Y, Z);
								format(str, sizeof str, "%s pegou o item %s do porta-mala.", nome(playerid), InventarioName(VeiculoConfiguracao[carro][Item][item]));
								MensagemL(X, Y, Z, str);						
								VeiculoConfiguracao[carro][Quantia][item] = 0;
								VeiculoConfiguracao[carro][Item][item] = NADA;
								new string[600];
								strcat(string, "Item\tQuantia\n");
								for(new i; i< 32; i++){
									format(string, sizeof string, "%s%s\t%d\n", string, InventarioName(VeiculoConfiguracao[carro][Item][i]), VeiculoConfiguracao[carro][Quantia][i]);
								}
								ShowPlayerDialog(playerid, DIALOG_PORTAMALAS_PLAYER, 5, "{ff0000}# itens Atuais", string, "Ok", "Retornar");
								SendClientMessage(playerid, LIGHTBLUE, "* O Item foi para sua mochila.");
							}			
						}
					}
					case 1:{
						if(VeiculoConfiguracao[carro][Quantia][item] == 0 || VeiculoConfiguracao[carro][Item][item] == NADA){
							SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
							ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							CriarItem(playerid, VeiculoConfiguracao[carro][Item][item], VeiculoConfiguracao[carro][Quantia][item]);
							new string[600];//, carro = GetPVarInt(playerid, "Malas");
							VeiculoConfiguracao[carro][Quantia][item] = 0;
							VeiculoConfiguracao[carro][Item][item] = NADA;
							
							strcat(string, "Item\tQuantia\n");
							for(new i; i< 32; i++){
								format(string, sizeof string, "%s%s\t%d\n",string, InventarioName(VeiculoConfiguracao[carro][Item][i]), VeiculoConfiguracao[carro][Quantia][i]);
								ShowPlayerDialog(playerid, DIALOG_PORTAMALAS_PLAYER, 5, "{ff0000}# itens Atuais", string, "Ok", "Retornar");
							}
							SendClientMessage(playerid, LIGHTBLUE, "* O Item foi descartado no chao.");	
						}
					}
					case 2:{
						if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ter uma mochila.");
						if(VeiculoConfiguracao[carro][Quantia][item] != 0 || VeiculoConfiguracao[carro][Item][item] != NADA){
							SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item nao invalido.");
							ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							new str[600], str2[600];
							strcat(str, "{33ccff}Item\t{33ccff}Quantia\n");
			
							for(new i; i< 32; i++){
								if(ItemInfo[playerid][i][Item] != NADA){
								    format(str2, sizeof(str2), "{ffffff}%s\t(%dx)\n", InventarioName(ItemInfo[playerid][i][Item]), ItemInfo[playerid][i][Quantia]);
					     			strcat(str, str2);
								}
							}
							ShowPlayerDialog(playerid, DIALOG_SUBS_MOCHILA_PM, 5, "{FFF000}Sua Mochila", str, "Select", "Sair");							
						}
					}
				}
			}
		}
		case DIALOG_SUBS_MOCHILA_PM:{
			if(response){
				if(listitem >= 0){
					if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui mochila.");
					new cont, item = GetPVarInt(playerid, "slotPm"), carro = GetPVarInt(playerid, "Malas");
				
		        	for(new i; i<32; i++){
		        		if(ItemInfo[playerid][i][Item] != NADA){
				        	if(listitem == i){
				        		cont++;
								VeiculoConfiguracao[carro][Quantia][item] = ItemInfo[playerid][listitem][Quantia];
								VeiculoConfiguracao[carro][Item][item] = ItemInfo[playerid][listitem][Item];
								ItemInfo[playerid][listitem][Quantia] = 0;
								ItemInfo[playerid][listitem][Item] = NADA;
								SendClientMessage(playerid, LIGHTBLUE, "* O Item da sua mochila foi para o porta malas.");				
								new string[600];
								strcat(string, "Item\tQuantia\n");
								for(new m; m< 32; m++){
									format(string, sizeof string, "%s%s\t%d\n",string,InventarioName(VeiculoConfiguracao[carro][Item][m]), VeiculoConfiguracao[carro][Quantia][m]);
									ShowPlayerDialog(playerid, DIALOG_PORTAMALAS_PLAYER, 5, "{ff0000}# itens Atuais", string, "Ok", "Retornar");
								}
								break;
							}
							else
								continue;
						}
						else
							listitem++;
					}
					if(cont == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Mochila vazia!");
				}
			}
		}
		case DIALOG_MOSTRARMALAS:
		{
			if(!response){
				SendClientMessage(playerid, Roxoeu, "Voce fechou o menu Porta-Malas.");
				SetPVarInt(playerid, "Malas", -1);
				return 1;
			}
			else{
				switch(listitem){//bruno
					case 0:{
						new carro = GetPVarInt(playerid, "Malas");
				
						new string[600];
						strcat(string, "Item\tQuantia\n");
						for(new i; i< 32; i++){
							format(string, sizeof string, "%s%s\t%d\n",string,InventarioName(VeiculoConfiguracao[carro][Item][i]), VeiculoConfiguracao[carro][Quantia][i]);
							ShowPlayerDialog(playerid, DIALOG_PORTAMALAS_PLAYER, 5, "{ff0000}# Itens Atuais", string, "Ok", "Retornar");
						}
					}
					case 1:{
						ShowPlayerDialog(playerid, DIALOG_INPUTPLAYER, DIALOG_STYLE_INPUT, "{fff000}Colocar Jogador", "Digite o ID do jogador a baixo.", "Select", "Exit");
					}
					case 2:{
						if(!response) return ShowMalas(playerid, GetPVarInt(playerid, "Malas"));

						new string[144], cont;
						foreach(new i: Player){
							if(Nopm[i] == GetPVarInt(playerid, "Malas")){
								cont++;
								format(string, sizeof string, "%s(%d) %s\n", string, i, nome(i) );
							}
						}
						if(cont != 0){
							ShowPlayerDialog(playerid, DIALOG_OUTPUTPMALAS, DIALOG_STYLE_LIST, "{fff000}Escolha Qual remover", string, "Remover", "Sair");
						}
						else{
							SendClientMessage(playerid, Roxoeu, "* Nao ha ninguem no seu Porta-Malas.");
							ShowMalas(playerid, GetPVarInt(playerid, "Malas") );
							return 1;
						}
					}
				}
			}
		}
		case DIALOG_OUTPUTPMALAS:{
			if(!response) return ShowMalas(playerid, GetPVarInt(playerid, "Malas") );
			if(response){
					new achou = -1, ct;
					foreach(new i: Player){
						if(Nopm[i] == GetPVarInt(playerid, "Malas")){
							if(listitem == ct){
								achou = i;
								break;
							}
							else
								ct++;
						}
						else
							continue;
					}
					if(achou == -1){
						SendClientMessage(playerid, LIGHTBLUE, " Jogador nao esta em seu porta-malas.");
					}
					else{
						new id = achou, Float: X, Float: Y, Float: Z;
						GetPlayerPos(playerid, X, Y, Z);
						new str[90];
						format(str, sizeof str, "* %s removeu %s de seu Porta-Malas.", nome(playerid), nome(id));
						MensagemL(X, Y, Z, str);
						Nopm[id] = -1;
						TogglePlayerControllableEx(id, true);
						PlayerTextDrawHide(id, telapreta[playerid][0]);
						SetPlayerPos(id, X, Y, Z);
					}
				
			}
		}
		case DIALOG_INPUTPLAYER:{
			if(!response) return ShowMalas(playerid, GetPVarInt(playerid, "Malas"));
			new id = strval(inputtext);
			new Float: X, Float: Y, Float: Z;
			
			new uva = -1;
        	foreach(new i: Player){
				if(id == PlayerInfo[i][IDFixo]){
					id = i;
					uva = i;
					break;
				}
			}
			GetPlayerPos(id, X, Y, Z);
			if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
			if(!IsPlayerConnectedP(id)){ //|| id == playerid){
				ShowMalas(playerid, GetPVarInt(playerid, "Malas"));
				SendClientMessage(playerid, Roxoeu, "* Voce digitou um ID offline ou tentou se colocar no Porta-malas.");
				return 1;
			}
			else if(!ISP(playerid, 5.0, X, Y, Z)){
				ShowMalas(playerid, GetPVarInt(playerid, "Malas"));
				SendClientMessage(playerid, Roxoeu, "* Voce est??¡ muito longe deste jogador.");
				return 1;			
			}
			else if(ContarVeh(GetPVarInt(playerid, "Malas") >=2)){
				ShowMalas(playerid, GetPVarInt(playerid, "Malas"));
				SendClientMessage(playerid, Roxoeu, "* O Porta-Malas ja est??¡ com duas pessoas.");
				return 1;
			}
			else{
				SetPVarInt(id, "InputVeh", GetPVarInt(playerid, "Malas") );
				SetPVarInt(id, "InputP", playerid);
				SendClientMessage(playerid, Roxoeu, "* Voce enviou o pedido para o jogador.");
				new str[144];
				format(str, sizeof str, "{33ccff}%s\n\n%s esta pedindo para voce \
					entrar no Porta-Malas do veiculo(%d) dele.",nome(id), nome(playerid), GetPVarInt(playerid, "Malas"));
				ShowPlayerDialog(id, DIALOG_ENFIARNOPM, DIALOG_STYLE_MSGBOX, "{fff000}Aviso", str, "Ok", "Nao");
			}
		}
		case DIALOG_ENFIARNOPM:{
			if(!response){
				new id = GetPVarInt(playerid, "InputP");
				new str[89];
				format(str, sizeof str, "* O Jogador se recusou a entrar no Porta-Malas.", nome(playerid));
				SendClientMessage(id, Roxoeu, str);
				DeletePVar(playerid, "InputP");
				DeletePVar(playerid, "InputVeh");
			}
			else{
				new Float: X, Float: Y, Float: Z, id = GetPVarInt(playerid, "InputP");
				GetPlayerPos(playerid, X, Y, Z);
				new str[95];

				format(str, sizeof str, "** %s colocou %s no Porta-Malas.", nome(id), nome(playerid));
				MensagemL(X, Y, Z, str);
				PutPlayerInPortaMalas(playerid, GetPVarInt(playerid, "InputVeh"));	
				Nopm[playerid] = GetPVarInt(playerid, "InputVeh");
				
				DeletePVar(playerid, "InputP");
				DeletePVar(playerid, "InputVeh");
				return 1;
			}
		}
	 	case DIALOG_EDITAR:{
		    if(response){
	     		if(listitem == 0){
		            if(GetPVarInt(playerid, "Port") == -1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta com o ID certo do objeto.");
		            if(ObjetoInfo[GetPVarInt(playerid, "Port")][ObjetoCriado] == false) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce tentou editar um Objeto nao existente e foi interrompido.");
					Editing[playerid] = true;
					SetPVarInt(playerid, "IDO", GetPVarInt(playerid, "Port"));
					EditDynamicObject(playerid, ObjetoInfo[GetPVarInt(playerid, "Port")][Objeto]);
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce comecou a editar este Objeto, cancele a edicao usando 'ESC'");
				}
				if(listitem == 1){
				    ShowPlayerDialog(playerid, DIALOG_SALVAROB, DIALOG_STYLE_INPUT, "{fff000}Confirmar Troca", "{33aa33}Digite no campo abaixo o ID para trocar este objeto.", "Ok", "Sair");
				}
				if(listitem == 2){
				    new id = GetPVarInt(playerid, "Port");
					new string[128], Cache: R, i;
					for(new f = 1; f<MAX_OBJT; f++){
					    if(!ObjetoInfo[f][ObjetoCriado]){
							i = f;
							break;
						}
					}
					new Query[200];
		   			mysql_format(Dados, Query, sizeof(Query), "SELECT * FROM `Objetos` WHERE `Objetoid` = '%d'", i);
					R = mysql_query(Dados, Query);
					
		     		if(!cache_is_valid(R)){
		     			new rows;
		     			cache_get_row_count(rows);
		     			if(rows == 0){
		     			
		         			ObjetoInfo[i][ObjetoModel] = ObjetoInfo[id][ObjetoModel];
						    ObjetoInfo[i][PIDF] = i;
							mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Objetos` (`Objetoid`, `ObjetoModel`, `ObX`, `ObY`, `ObZ`, `RotX`, `RotY`, `RotZ`) VALUES ('%d','%d', '%f', '%f', '%f', '%f', '%f', '%f')",i, ObjetoInfo[i][ObjetoModel],
							ObjetoInfo[id][ObX],ObjetoInfo[id][ObY],ObjetoInfo[id][ObZ], ObjetoInfo[id][RotX], ObjetoInfo[id][RotY], ObjetoInfo[id][RotZ]);
							mysql_tquery(Dados, Query);
							ObjetoInfo[i][ObX] = ObjetoInfo[id][ObX];
							ObjetoInfo[i][ObY] = ObjetoInfo[id][ObY];
							ObjetoInfo[i][ObZ] = ObjetoInfo[id][ObZ];
							ObjetoInfo[i][RotX] = ObjetoInfo[id][RotX];
							ObjetoInfo[i][RotY] = ObjetoInfo[id][RotY];
							ObjetoInfo[i][RotZ] = ObjetoInfo[id][RotZ];
							ObjetoInfo[i][ObjetoCriado] = true;
				    		ObjetoInfo[i][Objeto] = CreateDynamicObject(ObjetoInfo[i][ObjetoModel], ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ],
				  		    ObjetoInfo[i][RotX], ObjetoInfo[i][RotY],
																										  					 ObjetoInfo[i][RotZ]);
				    		format(string, sizeof(string), "{aa33aa}Objeto {ffffff}%d (%d)", i, ObjetoInfo[i][ObjetoModel]);
							ObjetoInfo[i][Texto] = CreateDynamic3DTextLabel(string, -1, ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ]-0.3, 4.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
							new str[144];
							format(str, sizeof str,"|INFO| Voce duplicou o objeto '%d', ID do objeto duplicado = '%d'", id, i); 
							SendClientMessage(playerid, -1, str);
						}
					}
				}	
				if(listitem == 3)
				{
					new Query[90], Cache: R, i = GetPVarInt(playerid, "Port");
					mysql_format(Dados, Query, sizeof(Query), "SELECT * FROM `Objetos` WHERE `Objetoid` = '%d'", i);
					R = mysql_query(Dados, Query);
					new rows = cache_num_rows();
					if(cache_is_valid(R) && rows){
					    if(!ObjetoInfo[i][ObjetoCriado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este objeto nao esta criado.");
					    ObjetoInfo[i][ObjetoCriado] = false;
					    DestroyDynamicObject(ObjetoInfo[i][Objeto]);
					    mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Objetos` WHERE `Objetoid` = '%d'", i);
					    mysql_tquery(Dados, Query);
					    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Objeto foi removido do banco de dados e do jogo.");
						ObjetoInfo[i][ObX] = 0.0;
						ObjetoInfo[i][ObY] = 0.0;
						ObjetoInfo[i][ObZ] = 0.0;
						ObjetoInfo[i][RotX] = 0.0;
						ObjetoInfo[i][RotY] = 0.0;
					 	ObjetoInfo[i][RotZ] = 0.0;
					 	DestroyDynamic3DTextLabel(ObjetoInfo[i][Texto]);
					 	ObjetoInfo[i][ObjetoCriado] = false;
					}
					else 
						return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este objeto nao existe no banco de dados.");
				}
			}
		}
		case DIALOG_SALVAROB:
		{ 
		    if(response){
			    if(!strlen(inputtext)) return SendClientMessage(playerid, LIGHTBLUE, "?");
				new i = GetPVarInt(playerid, "Port");
				if(ObjetoInfo[i][ObjetoModel] == strval(inputtext)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o mesmo id que esta no objeto.");
				ObjetoInfo[i][ObjetoModel] = strval(inputtext);
				DestroyDynamicObject(ObjetoInfo[i][Objeto]);
				CreateDynamicObject(ObjetoInfo[i][ObjetoModel], ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ],
	  														 ObjetoInfo[i][RotX], ObjetoInfo[i][RotY],
										  					 ObjetoInfo[i][RotZ]);
				new string[35];
				format(string, sizeof(string), "{aa33aa}Objeto {ffffff}%d (%d)", i, ObjetoInfo[i][ObjetoModel]);
				UpdateDynamic3DTextLabelText(ObjetoInfo[i][Texto], -1, string);
				string[0] = EOS;
				SalvarObjeto(i);
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Objeto salvo com sucesso.");
			}
		}
	}
	return 1;
}
public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ){
	if(PlayerInfo[playerid][Admin] < 1) return 1;
	if(!IsPlayerInAnyVehicle(playerid))
		SetPlayerPos(playerid, fX, fY, fZ);
	else
		SetVehiclePos(GetPlayerVehicleID(playerid), fX, fY, fZ);

	TogglePlayerControllableEx(playerid, false);
	SetTimerEx("descongelar", 3000, false, "i", playerid);
	SendClientMessage(playerid, LIGHTBLUE, "Carregando mapa...");
	return 1;
}
public OnVehicleMod(playerid, vehicleid, componentid){
	if(!IsValidComponentForVehicle(vehicleid, componentid) && !EmTunagem[playerid]){
		RemoveVehicleComponent(vehicleid, componentid);
		new str[144];
		format(str, sizeof str, "%s foi kickado por suspeita de Tunning Hacks.", nome(playerid));
		AdminMessage(Rosa, str);	
		Kick(playerid);	
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	foreach(new i: Player){
		if(Nopm[i] == vehicleid || VeiculoEntrou[i] == vehicleid){
			// voc??ª precisa fazer est??¡ fun??§??£o em um Ex tambem, para n??£o acontecer bugs...
			GameTextForPlayer(i, "* O Veiculo foi destruido e voce foi morto.", 2000, 3);
			SetPlayerHealth(i, 0);
			TogglePlayerControllableEx(i, true);
			Nopm[i] = -1;
			PlayerTextDrawHide(i, telapreta[i][0]);
			VeiculoEntrou[i] = 0;

		}
	}
	ChangeVehicleColours(vehicleid, VeiculoInfo[vehicleid][CorVeiculo][0], VeiculoInfo[vehicleid][CorVeiculo][1]);
	if(BikeSpawn[vehicleid]){
	    foreach(new i: Player){
	        if(BikePlayer[i] == vehicleid){
	            DestroyVehicleEx(vehicleid, "Faggio Destruida (OnVehSpawn)");
	            BikeSpawn[vehicleid] = false;
	            GameTextForPlayer(i, "* Faggio destruida!", 2000, 3);
	            BikePlayer[i] = -1;
			}
		}
	}
	if(VeiculoEmprego[vehicleid]){
		foreach(new i: Player){
		    if(SpawnouEmprego[i] == vehicleid){
		        CheckVehEmp(i);
		        ResetMileage(SpawnouEmprego[i]);
		        KillTimer(TimerTaximetro[i]);
		        TimerTaximetro[i] = -1;
		        VeiculoInfo[i][MileageTaxi] = 0.0;
				GameTextForPlayer(i, "* Veiculo do emprego destruido.", 2000, 1);
				break;
			}
		}
	}
	if(RC[vehicleid]){
		new str[90];
		format(str, sizeof(str), "[Aviso Org %d] Veiculo %s foi destruido apos ser respawnado.",OrgCarro[vehicleid],GetVehicleName(GetVehicleModel(vehicleid)));
		MessageOrg(OrgCarro[vehicleid], -1, str);
 		DestroyVehicleEx(vehicleid, "Veiculo de org Respawnado");
   		RC[vehicleid] = false;
		OrgInfo[OrgCarro[vehicleid]][Spawnados] --;
    	OrgCarro[vehicleid] = 0;
	}
	foreach(new i: Player){
		for(new j; j <MAXCONCE; j++){
			if(VehInfo[i][j][Carro] == vehicleid){
				carregarComponentes(i, j);
			}
		}
	}
	return 1;
}
public OnVehicleDeath(vehicleid, killerid)
{
	VeiculoInfo[vehicleid][MileageTaxi] = 0;
	foreach(new i: Player){
		if(Nopm[i] == vehicleid || VeiculoEntrou[i] == vehicleid){
			// voc??ª precisa fazer est??¡ fun??§??£o em um Ex tambem, para n??£o acontecer bugs...
			GameTextForPlayer(i, "* O Veiculo foi destruido e voce foi morto.", 2000, 3);
			SetPlayerHealth(i, 0);
			Nopm[i] = -1;
			PlayerTextDrawHide(i, telapreta[i][0]);
			TogglePlayerControllableEx(i, true);
			VeiculoEntrou[i] = 0;
		}
	}
	if(GetVehicleModel(vehicleid) == 428) BombaPlantada[vehicleid] = false;
	if(RC[vehicleid]){
		new str[90];
		format(str, sizeof(str), "[Aviso Org %d] Veiculo %s foi resetado apos ser destruido.",OrgCarro[vehicleid], GetVehicleName(GetVehicleModel(vehicleid)));
		MessageOrg(OrgCarro[vehicleid], -1, str);
        DestroyVehicleEx(vehicleid, "Destruido OnVehDeath");
     	RC[vehicleid] = false;
      	OrgInfo[OrgCarro[vehicleid]][Spawnados] --;
        OrgCarro[vehicleid] = 0;
	}

	if(IsVehicleAttachedObjectSlotUsed(vehicleid, 2))
		RemoVehicleAttachedObject(vehicleid, 2);

	return 1;
}
WeaponSlot(weaponid) 
{ 
	switch(weaponid) 
	{ 
		case 0..1:   return 0;
		case 2..9:   return 1;
		case 22..24: return 2; 
		case 25..27: return 3;
		case 28..29: return 4;
		case 32:	 return 4;
		case 30..31: return 5;
		case 33..34: return 6;
		case 35..38: return 7;
		case 16..18: return 8;
		case 39:	 return 8;
		case 41..43: return 9;
		case 10..15: return 10;
		case 44..46: return 11;
		case 40: 	 return 12;
	} 
	return 0; 
}
/*Float:DanoDim(playerid, Float: damage){
	// 0.3 0.4 0.55
	new Float: Colete;
	GetPlayerArmour(playerid, Colete);
	if(Colete < 1)
		return 0.0;

	if(Colete >= 50.0)
		return ( damage - (0.5) * damage);

	new Float: conta = (( Colete / 100 )* damage);


	return (damage - conta);
}*/
/*
	Dano adicional das armas:
	M4: 28.4
	AK: 38.2
	DESERT: 24.3
	COLT-45: 29.0
	GRANADA: 100.0
	PISTOLA SILENCIADA: 16.0
	SHOTGUN: 19.0
	SAWED-OFF: 19.0
	COMBAT-SHOTGUN: 19.0
	UZI: 27.0
	MP5: 27.5
	TEC9: 27.2
	RIFLE: 19.2
	SNIPER: 19.1

Float:DanoDaArma(arma){
	switch(arma){
		case WEAPON_M4: return (29.4 - totald);
		case WEAPON_AK47: return (39.2 - totald);
		case WEAPON_DEAGLE: return (25.3 - totald);
		case WEAPON_COLT45: return (30.0 - totald);
		case WEAPON_GRENADE: return (100.0 - totald);
		case WEAPON_SILENCED: return (17.0 - totald);
		case WEAPON_SHOTGUN: return (20.0 - totald);
		case WEAPON_SAWEDOFF: return (20.0 - totald);
		case WEAPON_SHOTGSPA: return (20.0 - totald);
		case WEAPON_UZI: return (28.0 - totald);
		case WEAPON_MP5: return (28.5 - totald);
		case WEAPON_TEC9: return (27.2 - totald);
		case WEAPON_RIFLE: return (20.2 - totald);
		case WEAPON_SNIPER: return (20.1 - totald);
	}
	return 0.0;
}*/
public OnPlayerLeaveDynamicArea(playerid, areaid){
	if(areaid == DynamicZonaCaca && TrabalhandoEmprego[playerid][CACADOR]){
		PC_EmulateCommand(playerid, "/trabalhar");
		SendClientMessage(playerid, LIGHTBLUE, "* Voce saiu da area de caca.");
		RemovePlayerWeapon(playerid, WEAPON_SNIPER);
	}
	return 1;
}
public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == ZonaPesca[0] && PlayerInfo[playerid][Emprego] == PESCADOR){
	    SendClientMessage(playerid, Amarelo, "|INFO| Voce entrou na zona de pesca, use /jogarrede.");
	}
	return 1;
}
stock GetVehicleTiresStatus(vehicleid, &rear_right_tire, &front_right_tire,
		&rear_left_tire, &front_left_tire)
{
	new
		tires, panelfake;

	if (GetVehicleDamageStatus(vehicleid, panelfake, panelfake, panelfake, tires) == 0)
		return 0;

	rear_right_tire = tires & 1;
	front_right_tire = tires >> 1 & 1;
	rear_left_tire = tires >> 2 & 1;
	front_left_tire = tires >> 3 & 1; 

	return 1;
}
CMD:ttt(playerid){
	SendClientMessage(playerid, -1, "%f", PlayerInfo[playerid][Px]);
	return 1;
}
cmd:sincronizar(playerid){
	new interior = GetPlayerInterior(playerid), vw = GetPlayerVirtualWorld(playerid), Float: x, Float: y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	
	TogglePlayerControllableEx(playerid, true);
	SetPlayerPos(playerid, 0.0,0.0, 999.0);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid,-1);

	SetPlayerInterior(playerid, interior);
	SetPlayerVirtualWorld(playerid, vw);
	SetPlayerPos(playerid, x, y, z);
	Streamer_Update(playerid, STREAMER_TYPE_OBJECT);
	return 1;
}
cmd:mylod(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/mylod [ valor ] distancia para renderizacao de objetos!");
	if(strval(params) < 100 || strval(params) > 1000) return SendClientMessage(playerid, LIGHTBLUE, "O Limite e entre 100 e 999!");
	Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, strval(params), playerid);
	return 1;
}
cmd:sethabilitacoes(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 4) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /setarhabilitacoes [ id fixo ]");
	new id = strval(params);
	GetPlayerId(id);
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o ID de um jogador offline.");
	CarteiraInfo[id][Carro] = 1;
	CarteiraInfo[id][Moto] = 1;
	CarteiraInfo[id][Aviao] = 1;
	SendClientMessage(id, LIGHTBLUE, "%s setou todas as carteiras para voce ( temporario. )", nome(playerid));
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce setou todas as carteiras para %s ( Temporario ).", nome(id));
	return 1;
}
cmd:statusatual(playerid){
	    new front_left, front_right, rear_left, rear_right;
		GetVehicleTiresStatus(GetPlayerVehicleID(playerid), rear_right, front_right, rear_left, front_left);

		//printf("frente d: %d   frente e: %d   traseira d: %d   traseira e: %d", front_right, front_left, rear_right, rear_left);
	    if(front_left !=TIRE_POPPED){ // roda frente
	    	SendClientMessage(playerid, LIGHTBLUE, "s front left");
	    }
	    else{
	    	SendClientMessage(playerid, LIGHTBLUE, "n front left");
	    }
	    if(front_right  != TIRE_POPPED){ // roda frente 2
	    	SendClientMessage(playerid, LIGHTBLUE, "s front right");
	    }
	    else{
	    	SendClientMessage(playerid, LIGHTBLUE, "n front right");
	    }
	    if(rear_left  != TIRE_POPPED){ // roda frente 2
	    	SendClientMessage(playerid, LIGHTBLUE, "s Rear left");
	    }
	    else{
	    	SendClientMessage(playerid, LIGHTBLUE, "n Rear left");
	    }
	    if(rear_right != TIRE_POPPED){ 
	    	SendClientMessage(playerid, LIGHTBLUE, "Sim Rear Right");
	    }
	    else{
			SendClientMessage(playerid, LIGHTBLUE, "nao Rear Right");
	    }
	    return 1;
}
forward AtualizarVelocimetro(playerid);//TimerVelocimetro
public AtualizarVelocimetro(playerid){
	if(!IsPlayerAfk(playerid) && IsPlayerInAnyVehicle(playerid)){
		VelocidadeAutoEscola(playerid);
		ContarGasolina(playerid, GetPlayerVehicleID(playerid));

	    new st2r[6];
	    format(st2r, sizeof(st2r), "%03d", GetVehicleSpeed2(GetPlayerVehicleID(playerid)));
	    PlayerTextDrawSetString(playerid, Velocimetro[playerid][1], st2r);
	    new front_left, front_right, rear_left, rear_right;
		GetVehicleTiresStatus(GetPlayerVehicleID(playerid), rear_right, front_right, rear_left, front_left);

	    if(front_left != TIRE_POPPED){ // roda frente
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][6], VerdeSamp);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][6]);
	    }
	    else{
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][6], Vermelho);//9109759
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][6]);
	    }
	    if(front_right!= TIRE_POPPED){ // roda frente 2
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][7], VerdeSamp);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][7]);
	    }
	    else{
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][7], Vermelho);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][7]);
	    }
	    if(rear_left != TIRE_POPPED){ // roda frente 2
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][8], VerdeSamp);
	    }
	    else{
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][8], Vermelho);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][8]);
	    }
	    if(rear_right != TIRE_POPPED){ 
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][9], VerdeSamp);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][9]);
	    }
	    else{
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][9], Vermelho);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][9]);
	    }

	    if(VehOpcao(GetPlayerVehicleID(playerid), FAROL_LIGADO)){
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][3], VerdeSamp);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][3]);
	    }
	    else{
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][3], Vermelho);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][3]);
	    }

	    if(VehOpcao(GetPlayerVehicleID(playerid), VEICULO_TRANCADO)){
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][4], VerdeSamp);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][4]);
	    }
	    else{
	    	PlayerTextDrawBoxColour(playerid, Velocimetro[playerid][4], Vermelho);
	    	PlayerTextDrawShow(playerid, Velocimetro[playerid][4]);
	    }
	    AtualizarTextoGasosa(playerid);
	    new Float: h;
	    GetVehicleHealth(GetPlayerVehicleID(playerid), h);
	    if(h < 301){
	    	if(!VeiculoConfiguracao[GetPlayerVehicleID(playerid)][Quebrado]){
		    	VeiculoConfiguracao[GetPlayerVehicleID(playerid)][Quebrado] = true;
				VehOpcao(GetPlayerVehicleID(playerid), DESLIGAR_VEICULO);
				SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo esta quebrado.");
				SetVehicleHealth(GetPlayerVehicleID(playerid), 299);
			}
			else{
				VehOpcao(GetPlayerVehicleID(playerid), DESLIGAR_VEICULO);
			}
	    }

	}
}

public OnPlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate)
{
	////////printf("OnPlayerStateChange");
	if(!IsPlayerSpawned(playerid)) return 1;

	if(newstate == PLAYER_STATE_DRIVER){
	
		if(LojaAluguelCar(playerid)){// se o player estiver no veiculo estacionado na loja
			if(ContarCarrosDispo() < 1){
				SendClientMessage(playerid, LIGHTRED, "A Empresa de alugueis nao possui mais veiculos no estoque para alugar!");
				CheckVehHacker(playerid, 1);
			}
			ShowPlayerDialog(playerid, DIALOG_ALUGAR_CARRO, DIALOG_STYLE_INPUT, "Aluguel de Veiculo", "Digite em HORAS por quanto tempo você quer alugar este veiculo: ", "Alugar", "Retornar");
		}
	}
	if(newstate == PLAYER_STATE_DRIVER){
		if((GetTickCount()-GetPVarInt(playerid, "cartime")) < 1000) // enters veh as driver faster than 1 once
	    {
			SetPVarInt(playerid, "carspam", GetPVarInt(playerid, "carspam")+1);
			if(GetPVarInt(playerid, "carspam") >= 5){
				new str[144];
				format(str, sizeof str, "%s foi kickado por suspeita de Car-Grabber.", nome(playerid));
				AdminMessage(Rosa, str);
				Kick(playerid);
				SendClientMessageToAll(Rosa, "[R.C] RC Em 8 segundos por causa de Cheaters.");
				SetTimer("RC15", 8000, false);
	        }
	  	}
	  	SetPVarInt(playerid, "cartime", GetTickCount());
	
	    SendClientMessage(playerid, Roxoeu, "Use a tecla 'N' para ligar o motor OU /motor.");
		SendClientMessage(playerid, Roxoeu, "Use o comando '/farol' para ligar o farol.");
		AtualizarVelocimetro(playerid);
		TimerVelocimetro[playerid] = SetTimerEx("AtualizarVelocimetro", 1400, true, "i", playerid);
		verc(playerid);
		ChecarOrgCarro(playerid);

	    for(new i; i< 13; i++){
			PlayerTextDrawShow(playerid, Velocimetro[playerid][i]);
		}
		for(new i; i < 8; i++){
			PlayerTextDrawHide(playerid, Hud[playerid][i]);
		}
		new gun[2];
		GetPlayerWeaponData(playerid, 3, gun[0], gun[1]);
		if(gun[0] != 0) RemovePlayerWeapon(playerid, gun[0]);
		return 1;
	}
	else{
		new gun[2];
		GetPlayerWeaponData(playerid, 3, gun[0], gun[1]);
		if(gun[0] != 0) RemovePlayerWeapon(playerid, gun[0]);
		KillTimer(TimerVelocimetro[playerid]);
		Cinto[playerid] = false;
		if(oldstate == PLAYER_STATE:2 || oldstate == PLAYER_STATE:3){
			for(new i; i < 8; i++){
				PlayerTextDrawShow(playerid, Hud[playerid][i]);
			}
		}
		for(new i; i< 13; i++){
   			PlayerTextDrawHide(playerid, Velocimetro[playerid][i]);
		}
	   	if(EmTeste[playerid]){
	       	TimerTeste[playerid] = SetTimerEx("QuitarTeste", 15000, false, "i", playerid);
	       	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Volte pro veiculo agora!!");
		}
		CheckVehHacker(playerid, 3);
	}
	return 1;
}
ChecarOrgCarro(playerid){
	new vehicleid = GetPlayerVehicleID(playerid);
	if(OrgCarro[vehicleid] != PlayerInfo[playerid][Org] && OrgCarro[vehicleid] != 0){
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este veiculo é de uma organizacao. Voce nao pode usar.");
	    ClearAnimations(playerid);
		SetTimerEx("kickar", 1000, false, "i", playerid);
	}
}
FalharReparoCaixa(playerid){
	if(ReparandoCaixa[playerid]){
	    ReparandoCaixa[playerid] = false;
	    KillTimer(TimerRepararcaixa[playerid]);
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Falha no reparo do caixa.");
	    ClearAnimations(playerid);
	    TogglePlayerControllableEx(playerid, true);
	}
}
cmd:ano(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/anonimo [ texto ]");
	new str[144];
	format(str, sizeof str, "(%d)Anonimo diz '%s'.", PlayerInfo[playerid][IDFixo], params);
	SendClientMessageToAll(0xde5d24FF, str);
	return 1;
}
cmd:loginadm(playerid){
	if(PlayerInfo[playerid][Admin] > 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode logar mais de uma vez! Noia!");

	/*if(!cef_player_has_plugin(playerid)){
		
	}
	else{*/

	if(NivelAdmin[playerid] != 0) ShowPlayerDialog(playerid, DIALOG_LOGARADMIN, DIALOG_STYLE_PASSWORD, 
		"{FFF000}Login Admin", "{33ccff}Coloque a senha da administracao abaixo para poder usar comandos.", "Ok", "Nao");
	return 1;
}
cmd:do(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, -1, "USO: /do [ acao ]");
	new str[256];
	format(str, sizeof str, "%s (( %s )).", params, nome(playerid));
	MensagemLocal(25.0, playerid, Roxoeu, str, false);
	return 1;
}
cmd:eu(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, -1, "USO: /eu [ acao ]");
	new str[256];
	format(str, sizeof str, "**%s %s.", nome(playerid), params);
	MensagemLocal(25.0, playerid, Roxoeu, str, false);
	return 1;
}
cmd:portamala(playerid, const params[]){
	if(isnull(params)) return SendClientMessage(playerid, Roxoeu, "/portamalas [ abrir / fechar ]");
	new Float: pos[7];
	GetPlayerPos(playerid, pos[3], pos[4], pos[5]);
	for(new i, j = MAX_VEHICLES; i != j; i++){
		GetVehiclePos(i, pos[0], pos[1], pos[2]);
		//GetXYZOfVehiclePart(vehicleid, part, &Float:x, &Float:y, &Float:z, Float:offset = 0.5)
		GetXYZOfVehiclePart(i, VEHICLE_PART_TRAZ, pos[0], pos[1], pos[2]);
		if(IsPlayerInRangeOfPoint(playerid, 1.1, pos[0], pos[1], pos[2])){
			if(!strcmp(params, "abrir")){
			
				if(!strcmp(VeiculoConfiguracao[i][Trancou], nome(playerid))){
					format(VeiculoConfiguracao[i][Trancou], 24, "");
					SendClientMessage(playerid,Roxoeu, "** Porta-malas foi aberto com sucesso!");
					ApplyAnimationEx(playerid, "PED", "fucku", 4.0, 0, 0, 0, 0, 0, SYNC_ALL);
					ShowMalas(playerid, i);
					break;
				}
				else if( !isnull(VeiculoConfiguracao[i][Trancou]) && strcmp(VeiculoConfiguracao[i][Trancou], nome(playerid))){
					
					new srt[87];
					format(srt, sizeof srt, "* %s trancou este Porta-Malas. Voce nao pode abrir!", VeiculoConfiguracao[i][Trancou]);
					SendClientMessage(playerid, LIGHTBLUE, srt);
					break;
				}
				else{
					format(VeiculoConfiguracao[i][Trancou], 24, "");
					SendClientMessage(playerid,Roxoeu, "* Voce abriu este Porta-Malas.");
					ApplyAnimationEx(playerid, "PED", "fucku", 4.0, 0, 0, 0, 0, 0, SYNC_ALL);
					ShowMalas(playerid, i);
					break;
				}
			}
			else if(!strcmp(params, "fechar")){
				if(!isnull(VeiculoConfiguracao[i][Trancou])){
					SendClientMessage(playerid, -1, "Este Porta-malas ja esta fechado.");
					break;
				}
				else{
					format(VeiculoConfiguracao[i][Trancou], 24, nome(playerid));
					SendClientMessage(playerid, Roxoeu, "** Voce trancou com sucesso o Porta-malas de seu veiculo. Somente voce pode abrir agora!");
					break;
				}
			}
		}
	}
	return 1;
}

public ChecarEncomendas(i);
public ChecarEncomendas(i){
	////printf("Checar encomendas chamado (%d)", gettime());
		new str[160];
		if(EncomendasMafia[i][TempoEnc][0] != 0 && gettime() > EncomendasMafia[i][TempoEnc][0]){
			////print("Maconha Mafia chamada");
			if(EncomendasMafia[i][MaconhaEnc] > 0){
				OrgInfo[i][MaconhaOrg] += EncomendasMafia[i][MaconhaEnc];
				format(str, sizeof str, "Negocios | A Mafia acaba de entregar %dg de Maconha para a(o) %s.",
					EncomendasMafia[i][MaconhaEnc], OrgGm[i][OrgNome]);
				////print(str);
				SendClientMessageToAll(VerdeSamp, str);
				mysql_format(Dados, str, sizeof str, "DELETE FROM `Mafia` WHERE `encid` = '%d' AND `orgid` = '%d'", encMafia[i][0][Encid], i);
				mysql_tquery(Dados, str);
				EncomendasMafia[i][MaconhaEnc] = 0;
				EncomendasMafia[i][TempoEnc][0] = 0;
			}
		}
		if(EncomendasMafia[i][TempoEnc][1] != 0 && gettime() > EncomendasMafia[i][TempoEnc][1]){
			////print("Equipamento Mafia chamada");
			if(EncomendasMafia[i][EquipamentosEnc] > 0){
				OrgInfo[i][Equipamentos] += EncomendasMafia[i][EquipamentosEnc];
				format(str, sizeof str, "Negocios | A Mafia acaba de entregar %d kits de equipamentos para a(o) %s.",
					EncomendasMafia[i][EquipamentosEnc], OrgGm[i][OrgNome]);
				////print(str);
				SendClientMessageToAll(VerdeSamp, str);
				format(str, sizeof str, "DELETE FROM `Mafia` WHERE `encid` = '%d' AND `orgid` = '%d'", encMafia[i][1][Encid], i);
				DB_ExecuteQuery(Mafia, str);
				EncomendasMafia[i][EquipamentosEnc] = 0;
				EncomendasMafia[i][TempoEnc][1] = 0;
			}
		}
		if(EncomendasMafia[i][TempoEnc][2] !=0 && gettime() > EncomendasMafia[i][TempoEnc][2]){
			////print("VEHICLE Mafia chamada");
			if(EncomendasMafia[i][VeiculosModel] > 0){
				adicionarveiculoOrg(i, EncomendasMafia[i][VeiculosModel]);
				format(str, sizeof str, "Negocios | A Mafia acaba de entregar o veiculos %s para a(o) %s.",
					GetVehicleName(EncomendasMafia[i][VeiculosModel]), OrgGm[i][OrgNome]);
				////print(str);
				SendClientMessageToAll(VerdeSamp, str);
				format(str, sizeof str, "encid %d orgid %d", encMafia[i][2][Encid], i);
				SendClientMessage(0, -1, str);
				format(str, sizeof str, "DELETE FROM `Mafia` WHERE `encid` = '%d' AND `orgid` = '%d'", encMafia[i][2][Encid], i);
				DB_ExecuteQuery(Mafia, str);
				EncomendasMafia[i][VeiculosModel] = 0;
				EncomendasMafia[i][TempoEnc][2] = 0;
			}
		}
		return 1;
}

cmd:encomendas(playerid){
	if(PlayerInfo[playerid][Org] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Apenas faccoes podem negociar com os Mafiosos.");
	if(!IsBandido(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Apenas faccoes podem negociar com os Mafiosos.");
	if(!ISP(playerid, 3.0, -1690.12219, -97.14761, 3.54467)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar perto do Mafioso.");	
	new org = PlayerInfo[playerid][Org];
	new string[255];
	strcat(string, "{33ccff}Item\t{33ccff}Quantia\t{33ccff}Tempo De Espera\n");
	new string2[255];
	format(string2, sizeof string2, "Maconha\t%d\t%s\nArmamento Militar\t%d\t%s\nVeiculo\t%s\t%s",
		EncomendasMafia[org][MaconhaEnc], ChecarEstadoEncomenda(EncomendasMafia[org][TempoEnc][0],EncomendasMafia[org][MaconhaEnc]),
		EncomendasMafia[org][EquipamentosEnc], ChecarEstadoEncomenda(EncomendasMafia[org][TempoEnc][1],EncomendasMafia[org][EquipamentosEnc]),
		GetVehicleName(EncomendasMafia[org][VeiculosModel]), ChecarEstadoEncomenda(EncomendasMafia[org][TempoEnc][2],EncomendasMafia[org][VeiculosModel]));
	strcat(string, string2);
	ShowPlayerDialog(playerid, DIALOG_INUTIL, 5, "{ff0000}# Suas Encomendas", string, "Ok", #);
	return 1;
}
ChecarEstadoEncomenda(tempo, produto){
	new string[70];
	if( (tempo - gettime()) >= 0 && produto > 0){
		format(string, sizeof string, "{fff000}A Caminho, %s.", Convert(tempo - gettime()));
		return string;
	}

	if(gettime() > tempo && produto > 0)
		string = "{008000}Disponivel";

	if(tempo > gettime() || tempo < 1 && produto < 1)
		string = "-";

	return string;
}
cmd:negociar(playerid){
	//if(PlayerInfo[playerid][Org] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Apenas faccoes podem negociar com os Mafiosos.");
	//if(PlayerInfo[playerid][Cargo] != 10) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ser lider para fazer isso.");
	//if(!IsBandido(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Apenas faccoes podem negociar com os Mafiosos.");
	if(!ISP(playerid, 3.0, -1690.12219, -97.14761, 3.54467)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar perto do Mafioso.");
	new string[470];
	strcat(string, "Item\tValor P/Item\tTempo De Entrega (dias)\n");
	for(new i; i<sizeof(negociarmafia); i++){
		new newstr[59];
		format(newstr, sizeof(newstr), "%s\t{33aa33}%d$\t%d\n", negociarmafia[i][ItemName], negociarmafia[i][Valor], negociarmafia[i][Dias]);
		strcat(string, newstr);
	}
	ShowPlayerDialog(playerid, DIALOG_NEGOCIAR_MAFIA, 5, "{ff0000}Negociando Com A Mafia", string, "Ok", "Sair");
	return 1;
}
cmd:jbl(playerid){
	if(TemItem(playerid, JBL)){
		if(CriouJBL[playerid] != -1){
			new i = CriouJBL[playerid];
			foreach(new ii: Player){
				if(ISP(ii, 10.0, InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2]) && GetPlayerVirtualWorld(ii) == InfoJBL[i][JBLVw]){
					StopAudioStreamForPlayer(ii);
					JBLProxima[ii] = -1;
					InfoJBL[i][JBLCriada] = false;
					InfoJBL[i][TipoMusica] = -1;
					DestroyDynamicObject(InfoJBL[i][ObjetoJbl]);
					format(InfoJBL[i][jblDono], 24, "NullPlay3r");
					SendClientMessage(playerid, LIGHTBLUE, "* Voce removeu sua JBL.");
					CriouJBL[playerid] = -1;
					break;
				}
			}
		}
		else{
			new id = -1;
			for(new i; i <MAX_JBL; i++){
				if(ISP(playerid, 12.0, InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2]) && InfoJBL[i][JBLCriada]){
					SendClientMessage(playerid, LIGHTBLUE, "* Voce esta muito perto de outra JBL.");
					id = i;
					break;
				}
			}
			if(id == -1){
				new Float: X, Float: Y, Float: Z;
				GetPlayerPos(playerid, X, Y, Z);
				CriarJBL(playerid, X, Y, Z-1);
				SendClientMessage(playerid, LIGHTBLUE, "* JBL Criada com sucesso, Use o comando novamente para remove-la.");
			}
		}
	}
	return 1;
}

cmd:menujbl(playerid, params[]){
	if(CriouJBL[playerid] == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao criou nenhuma JBL.");

	new i = CriouJBL[playerid];
	if(ISP(playerid, 2.0, InfoJBL[i][PosJBL][0], InfoJBL[i][PosJBL][1], InfoJBL[i][PosJBL][2]) && GetPlayerVirtualWorld(playerid) ==InfoJBL[i][JBLVw]){
		ShowPlayerDialog(playerid, DIALOG_JBL, DIALOG_STYLE_LIST, "{ff0000}# Escolha A Musica", "Radio Trap / Funk e Hip Hop\n\
			Radio Funk\nRadio Eletronica\nRadio Piseiro\nRadio Sad Songs", "Ok", "Sair");
	}
	return 1;
}
cmd:camera(playerid, params[]){ //InCamera
	if(!PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ser admin para usar este comando.");
	if(InCamera[playerid]){
		InCamera[playerid] = false;
		SpawnPlayer(playerid);
		SendClientMessage(playerid, Rosa, "* Voce nao esta mais em uma camera.");
	}
	else{
		if(isnull(params)) return SendClientMessage(playerid,-1,"USO: /cameraadmin [ camera id ]");
		new id = strval(params);
		if(!CameraInfo[id][CameraCriada]) return SendClientMessage(playerid,-Rosa, "* Este id de camera ainda nao foi criado.");
		AttachCameraToDynamicObject(playerid, CameraInfo[id][ACamera]);
		InCamera[playerid] = true;
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta vendo esta camera agora.");
	}
	return 1;
}
//====================== [ Sistema de criar cofre e roubar ETC ETC] =================
cmd:criarcofre(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return SendClientMessage(playerid, Rosa, "* Voce nao tem permissao para usar este comando.");
	new cofrenome[32], gran;
	if(sscanf(params, "is[32]", gran, cofrenome)) return SendClientMessage(playerid, Rosa, "USO: /criarcofre [ dinheiro no cofre ] [ nome do cofre ex: Cofre da binco ]");
	new Float:p[3];
	GetPlayerPos(playerid, p[0], p[1], p[2]);
	CriarCofre(playerid, cofrenome, p[0], p[1], p[2], gran);
	return 1;
}
cmd:editarcofre(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return SendClientMessage(playerid, Rosa, "* Voce nao tem permissao para usar este comando.");
	new id = strval(params);
	if(isnull(params)) return SendClientMessage(playerid, Rosa, "USO: /editarcofre [ id ]");
	if(!CofreInfo[id][OCofre]) return SendClientMessage(playerid, Rosa, "* Este cofre nao existe");
	SetPVarInt(playerid, "CFGCOFRE", id);
	ShowPlayerDialog(playerid, DIALOG_CFGCOFRE, DIALOG_STYLE_LIST, "Configurar Cofre", "{33ccff}Editar Posicao\n{33ccff}Mudar Nome\n{33ccff}Deletar Cofre"
	, "Ok", #);
	return 1;
}
cmd:dareq(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 10) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/dareq [ org ] sao setados 500 eqs.");
	OrgInfo[strval(params)][Equipamentos] += 500;
	return 1;
}
cmd:roubarcofre(playerid){
	//if(PlayerInfo[playerid][Admin] !=12) return SendClientMessage(playerid, LIGHTBLUE, "Desativado !");
	foreach(new i: B_Cofres){
		if(!IsBandido(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE,"* Voce nao pode fazer isso.");
		//if(PlayerInfo[playerid][Org] == 0) return SendClientMessage(playerid,)
		if(PlayerInfo[playerid][Org] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso.");
		if(!PoliciaisOnline(3)) return SendClientMessage(playerid, LIGHTBLUE, "* Precisa de mais policiais online para fazer esta acao.");
		if(Roubando) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Algum local ja foi roubado recentemente.");
		if(ISP(playerid, 3.0, CofreInfo[i][CofrePos][0], CofreInfo[i][CofrePos][1], CofreInfo[i][CofrePos][2])){
			if(GetPlayerVirtualWorld(playerid) == CofreInfo[i][VWCofre] && GetPlayerInterior(playerid) == CofreInfo[i][InteriorCofre]){
				if(CofreInfo[i][SendoRoubado]) return SendClientMessage(playerid, LIGHTBLUE, "* Este cofre ja esta sendo roubado!");
				if(CofreInfo[i][CofreQuebrado]) return SendClientMessage(playerid, LIGHTBLUE, "* Este cofre esta quebrado!");
				if(NaMao[playerid] != DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa pegar uma DINAMITE na mao!");
				if(!MembrosPerto(playerid, 4)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de mais tres membro para roubar o Cofre.");
				PC_EmulateCommand(playerid, "/anim");
		  	    ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
		  	    ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
				NaMao[playerid] = 0;
				TimerPlayer[playerid][4] = SetTimerEx("roubarcofre", 9000, false, "ii", i, playerid);
				GameTextForPlayer(playerid, "~R~CONFIGURANDO BOMBA...", 9000, 3);
				SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) +5);
				CofreInfo[i][SendoRoubado] = true;
				new str[100];
				format(str, sizeof str, "AVISO: %s esta roubando o cofre do %s.", nome(playerid), CofreInfo[i][CofreName]);
				foreach(new i2: Player){
			        if(IsPolice(PlayerInfo[i2][Org])){
						SendClientMessage(i2, LIGHTBLUE, str);
			        }
					
				}
				AdminMessage(Rosa, str);
				break;
			}
		}
	}
	return 1;
}

forward roubarcofre(cofre, playerid);
public roubarcofre(cofre, playerid){
	PC_EmulateCommand(playerid, "/anim");
	SetTimerEx("ExplodiCofre", 30000, false, "i", cofre);
	SendClientMessage(playerid, LIGHTBLUE, "* A Bomba foi plantada! vai ser explodido em 30s. Saia de perto!");
	new Query[90];
	format(Query, sizeof Query, "%s roub. cofre (%s)", nome(playerid), OrgGm[ PlayerInfo[playerid][Org] ][Sigla]);
	AdicionarLogs(Query);
}
forward ExplodiCofre(cofre);
public ExplodiCofre(cofre){
	new Float: Rx, Float: Ry, Float: Rz, Float: X = CofreInfo[cofre][CofrePos][0], Float: Y = CofreInfo[cofre][CofrePos][1], Float: Z = CofreInfo[cofre][CofrePos][2];
	GetDynamicObjectRot(CofreInfo[cofre][OCofre], Rx, Ry, Rz);
	X = X + -3.1 * floatsin(-Rz, degrees);
	Y = Y + -3.1 * floatcos(-Rz, degrees);
	new conta = CofreInfo[cofre][CofreMoney] / 16;
	for(new i; i<10; i++){
		CriarItemDrop(X-0.220-RdonPickups[random(sizeof(RdonPickups))][0], Y+0.100+RdonPickups[random(sizeof(RdonPickups))][0],Z+1, DINHEIRO_FLUTUANTE_BANDIDO, random(conta));
	}
	CreateExplosion(X, Y, Z, 2, 5.0);
	SendClientMessageToAll(LIGHTBLUE, "* Um Cofre acaba de ser roubado!");
	DestroyDynamicObject(CofreInfo[cofre][OCofre]);
	CofreInfo[cofre][OCofre] = CreateDynamicObject(CofreQbrado, CofreInfo[cofre][CofrePos][0], CofreInfo[cofre][CofrePos][1], CofreInfo[cofre][CofrePos][2],
 	Rx,Ry,Rz, CofreInfo[cofre][VWCofre], CofreInfo[cofre][InteriorCofre]);
 	SetTimerEx("voltarcofre", minutos(15), false, "i", cofre);
 	CofreInfo[cofre][CofreQuebrado] = true;
 	CofreInfo[cofre][SendoRoubado] = false;
 	Roubando = true;
}
forward voltarcofre(cofre);
public voltarcofre(cofre){
	new Float: Rx, Float: Ry, Float: Rz;
	GetDynamicObjectRot(CofreInfo[cofre][OCofre], Rx, Ry, Rz);
	DestroyDynamicObject(CofreInfo[cofre][OCofre]);
	CofreInfo[cofre][OCofre] = CreateDynamicObject(CofreNormal, CofreInfo[cofre][CofrePos][0], CofreInfo[cofre][CofrePos][1], CofreInfo[cofre][CofrePos][2],
 	Rx,Ry,Rz, CofreInfo[cofre][VWCofre], CofreInfo[cofre][InteriorCofre]);
	new str[120];
	format(str, sizeof str, "* O(A) %s se recuperou do ultimo assalto!", CofreInfo[cofre][CofreName]);
 	SendClientMessageToAll(LIGHTBLUE, str);
 	CofreInfo[cofre][CofreQuebrado] = false;
}
//======================
cmd:passageiro(playerid){
	if(VeiculoEntrou[playerid] != 0) return SendClientMessage(playerid, LIGHTBLUE, "Voce ja e passageiro de um veiculo.");
	for(new i; i< MAX_VEHICLES; i++){
		if(GetVehicleModel(i) == 427 || GetVehicleModel(i) == 433 || GetVehicleModel(i) == 528 || GetVehicleModel(i) == 601){
			new Float: x, Float: y, Float: z, Float: ang;
			GetVehicleZAngle(i, ang);
			GetVehiclePos(i, x, y, z);
			x = x + -5.2 * floatsin(-ang, degrees);
		  	y = y + -5.2 * floatcos(-ang, degrees);
		   	if(ISP(playerid, 4.5, x-1.0293, y+1.0768, z)){
		   		VeiculoEntrou[playerid] = i;
				TogglePlayerControllableEx(playerid, false);
				SetTimerEx("descongelar", 2000, false, "i", playerid);
		   		SetPlayerPos(playerid, -26.6448,42.7381,1000.3384);
		   		SetPlayerVirtualWorld(playerid, i);
		   		SendClientMessage(playerid, LIGHTBLUE, "* Use o comando /spassageiro para sair do veiculo.");
		   		break;
		   	}
		}//,-25.6924,1001.4828,272.0065
		if(GetVehicleModel(i) == 548){
			new Float: x, Float: y, Float: z;
			GetVehiclePos(i, x, y, z);
		   	if(ISP(playerid, 4.9, x, y, z)){
		   		VeiculoEntrou[playerid] = i;
				TogglePlayerControllableEx(playerid, false);
				SetTimerEx("descongelar", 2000, false, "i", playerid);
		   		SetPlayerPos(playerid, 1472.0371,1766.5850,-45.2163);
		   		SetPlayerVirtualWorld(playerid, i);
		   		SendClientMessage(playerid, LIGHTBLUE, "* Use o comando /spassageiro para sair do veiculo.");
		   		break;
		   	}
			
		}
		if(GetVehicleModel(i) == 416){
			new Float: x, Float: y, Float: z;
			GetVehiclePos(i, x, y, z);
		   	if(ISP(playerid, 4.9, x, y, z)){
		   		VeiculoEntrou[playerid] = i;
				TogglePlayerControllableEx(playerid, false);
				SetTimerEx("descongelar", 2000, false, "i", playerid);
		   		SetPlayerPos(playerid, 1398.2711,-25.6924,1001.4828);
		   		SetPlayerVirtualWorld(playerid, i);
		   		SendClientMessage(playerid, LIGHTBLUE, "* Use o comando /spassageiro para sair do veiculo.");
		   		break;
		   	}
			
		}
	}
	return 1;
}
cmd:spassageiro(playerid){
	if(VeiculoEntrou[playerid] != 0){
		new veh = VeiculoEntrou[playerid];
		new Float: x, Float: y, Float: z, Float: ang;
		GetVehicleZAngle(veh, ang);
		GetVehiclePos(veh, x, y, z);
		x = x + -5.2 * floatsin(-ang, degrees);
	  	y = y + -5.2 * floatcos(-ang, degrees);
	  	SetPlayerPos(playerid,x-1.0293, y+1.0768, z);
	  	VeiculoEntrou[playerid] = 0;
	  	SendClientMessage(playerid, LIGHTBLUE, "* Voce saiu deste veiculo.");	
	  	SetPlayerVirtualWorld(playerid, 0);
	  	SetPlayerInterior(playerid, 0);
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta como passageiro em um veiculo.");

	return 1;
}
cmd:wpp(playerid, params[]){
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando, voce esta ferido!");
	if(!TemItem(playerid, CREDITOS)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem CREDITOS.");
    if(!TemItem(playerid, CHIP)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui CHIP.");
   	if(!TemItem(playerid, CELULAR)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui CELULAR.");
    if(isnull(params)) return SendClientMessage(playerid, Rosa, "USO: /wpp [ texto ] * estas mensagens vao direto ao grupo, global.");
    new str[170];
    format(str, sizeof(str), "{25D366}[Whatssap][Grupo]%s(+55 %d): %s", nome(playerid), PlayerInfo[playerid][IDFixo], params);
    SendZapMessage(str);
    DiminuirItem(playerid, CREDITOS, 1);
    return 1;
}
cmd:CELULAR(playerid){
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando, voce esta ferido!");
	if(!TemItem(playerid, CELULAR)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem CELULAR.");
	AbrirCELULAR(playerid);
	new str[144];
	format(str, sizeof str, "** %s pegou o seu CELULAR.", nome(playerid));
	MensagemLocal(25.0, playerid, Roxoeu, str, false);
	return 1;
}
cmd:atendimento(playerid){
	if(Atendimento[playerid][OAtendido]) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar este comando agora.");
	new str[144];
	if(Atendimento[playerid][PediuSenha]){
		Atendimento[playerid][PediuSenha] = false;
		SendClientMessage(playerid, Rosa, "* Voce cancelou o seu atendimento.");
		format(str, sizeof str, "%s cancelou seu SAC.", nome(playerid));
		AdminMessage(Rosa, str);
		Atendimento[playerid][momentosenha] = 0;
	}
	else{
		Atendimento[playerid][PediuSenha] = true;
		SendClientMessage(playerid, Rosa, "* Voce acaba de pedir atendimento, tenha paciencia.");
		format(str, sizeof str, "(%d)%s acaba de pedir um atendimento! use /ac.", PlayerInfo[playerid][IDFixo], nome(playerid));
		AdminMessage(Rosa, str);
		Atendimento[playerid][momentosenha] = gettime();
	}
	return 1;
}
cmd:ac(playerid, params[]){
	if(Atendimento[playerid][EmAtendimento] || !PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, Rosa, "* Voce ja esta em um atendimento ou nao e admin.");

	if(PlayerInfo[playerid][Admin] < 1) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar o comando.");
	if(isnull(params)) return SendClientMessage(playerid, Rosa, "USO: /ac [ id do jogador ]");
	new id = strval(params);
	new uva = -1;
	foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, Rosa, "Este jogador nao esta conectado.");
	if(id == playerid) return 1;
	if(Atendimento[id][momentosenha] == 0 || !Atendimento[id][PediuSenha]) return SendClientMessage(playerid, Rosa, "* Este jogador nao esta precisando de atendimento.");
	Atendimento[id][PediuSenha] = false;
	Atendimento[id][OAtendido] = true;
	Atendimento[playerid][EmAtendimento] = true;
	Atendimento[playerid][Atendidos] += 1;
	SendClientMessage(id, -1, "");
	SendClientMessage(id, -1, "");
	SendClientMessage(id, -1, "");
	new str[144];
	format(str, sizeof str, "Um Admin acaba de aceitar sua senha, tempo de espera %s.", Convert(gettime() - Atendimento[id][momentosenha]));
	SendClientMessage(id, Rosa, str);
	Atendimento[id][momentosenha] = 0;
	Atendimento[id][AtenId] = playerid;
	Atendimento[playerid][AtenId] = id;
	SendClientMessage(playerid, Rosa, "* Agora voce esta em um atendimento, use /finalizarat para finalizar o atendimento.");
	return 1;
}

cmd:admins(playerid){
	new contagem, str[700];
	strcat(str,	"{33ccff}Staff\t{33ccff}Modo\t{33ccff}Nota\n");
	foreach(new i: Player){
		if(!PlayerInfo[i][Admin]) continue;
		contagem++;
		new Float: nota = floatmul(floatdiv(Atendimento[i][Nota],floatadd(Atendimento[i][Nota],Atendimento[i][Atendidos])), 10.0);
		new str2[144];
		format(str2, sizeof str2, "(%d)%s\t%s\t%0.1f\t%s\n", i, nome(i), 
			TrabalhoStaff[playerid] ? ("Trabalhando") : ("Jogando"), 
			nota, StaffCargo(PlayerInfo[i][Admin]));
		strcat(str, str2);
	}
	if(contagem == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Nao ha nenhum admin online.");
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_TABLIST_HEADERS, "{fff000}Admins Online", str, "Ok", #);
	return 1;
}
/*
cmd:editargps(playerid){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	
	new str[1200];
	strcat(str, "ID\tlocal\n");
	for(new i; i<MAX_GPS_LOCAL; i++){
	    if(GpsInfo[i][LocalCriado]){
	    	new str2[144];
		    format(str2, sizeof(str2), "%d\t%s\n", i, GpsInfo[i][LocalName]);
	    	strcat(str, str2);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_EDITARGPS, 5, "{fff000}Selecione para editar.", str, "Ok", "Sair");
*/
cmd:finalizaredicao(playerid){
	for(new i; i <14; i++){
		PlayerTextDrawHide(playerid, EditorAO[playerid][i]);
	}
	CancelSelectTextDraw(playerid);
	return 1;
}
cmd:finalizarat(playerid){
	if(!PlayerInfo[playerid][Admin] || !Atendimento[playerid][EmAtendimento]) return 1;//SendClientMessage(playerid, Rosa, "* Voce nao esta atendendo alguem ou nao e admin.");
	new id = Atendimento[playerid][AtenId];
	Atendimento[id][OAtendido] = false;
	Atendimento[playerid][EmAtendimento] = false;
	Atendimento[id][PediuSenha] = false;
	SendClientMessage(playerid, Rosa, "* Voce acabou o antedimento com este jogador, ele vai te avaliar.");
	ShowPlayerDialog(id, DIALOG_NOTAADMIN, DIALOG_STYLE_LIST, "Nota de atendimento", "{33aa33}10.0\n{fff000}7.5\n{ffa500}5.0\n\
		{aa33aa}3.0\n{ff0000}0.0","Ok", #);
	return 1;
}
cmd:filaatendimento(playerid){
	if(!PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, Rosa, "* Voce nao tem permissao para usar este comando.");
	
	new str[450], contagem = -1;
	foreach(new i: Player){
		if(Atendimento[i][PediuSenha]){
			contagem++;
			format(str, sizeof(str), "%s(%d)%s - '%s de espera'\n", str, PlayerInfo[i][IDFixo], nome(i), Convert(gettime() - Atendimento[i][momentosenha]));
		}
	}
	if(contagem == -1) return SendClientMessage(playerid, Rosa, "* Nao ha ninguem esperando atendimento.");
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Pessoas Em Fila", str, "Ok", #);
	return 1;
}
cmd:dominar(playerid){
	if(PlayerInfo[playerid][Org] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(!Equipado(playerid) && IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar fardado.");
	foreach(new i: Gangzoness){
	    if(IsPlayerInGangZone(playerid, GzInfo[i][OGZ])){
	        new org = PlayerInfo[playerid][Org];

	        if(!strcmp("Restrito", GzInfo[i][GZNome])) return SendClientMessage(playerid, LIGHTRED, "* Voce nao pode dominar este Gangzone.");
	        if(GzInfo[i][DonoGz] == PlayerInfo[playerid][Org]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este gangzone ja pertence a sua organizacao.");
	        if(GzInfo[i][Dominando]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Ja estao dominando este gangzone.");
	        GangZoneFlashForAll(GzInfo[i][OGZ], OrgGm[org][Cor]);
	        GzInfo[i][Dominando] = true;
	        orgAtacando[i] = org;
	        SetTimerEx("dominandogz", minutos(2), false, "ii", org, GzInfo[i][gzid]);
	        new str[128];
	        format(str, sizeof(str), "(%s)%s esta dominando um territorio.",OrgGm[org][OrgNome], nome(playerid));
	        SendClientMessageToAll(OrgGm[org][Cor], str);

	        format(str, sizeof str, "%s, sua organizacao comecou a dominar o(a) %s. Aguarde 1 minuto.", nome(playerid), GzInfo[i][GZNome]);
	        SendClientMessage(playerid, -1, str);
	        format(str, sizeof str, "%s(%s) dominando %s", nome(playerid), OrgGm[org][Sigla], OrgGm[org][OrgNome]);
	        AdicionarLogs(str);
	        break;
		}
	}
	return 1;
}
forward dominandogz(org, gz);
public dominandogz(org, gz){
	GzInfo[gz][DonoGz] = org;

	GangZoneStopFlashForAll(GzInfo[gz][OGZ]);
	GangZoneShowForAll(GzInfo[gz][OGZ], OrgGm[org][Cor]);
	new str[128];
	format(str, sizeof str, "%s foi dominado com sucesso pelo %s.", GzInfo[gz][GZNome], OrgGm[org][OrgNome]);
	SendClientMessageToAll(OrgGm[org][Cor], str);
	GzInfo[gz][Dominando] = false;
	new string[40];
	foreach(new i: Player){
		if(PlayerInfo[i][Org] == org && IsPlayerInGangZone(i, gz)){
			format(string, sizeof string, "%s", OrgGm[ GzInfo[gz][DonoGz]][OrgNome]);
			PlayerTextDrawSetString(i, Hud[i][2], string);
		}
	}
	SalvarGangzones();
	return 1;
}
cmd:criargz(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new Float:Pos[4], gzn[32];
	if(sscanf(params, "ffffs[32]", Pos[0], Pos[1], Pos[2], Pos[3], gzn)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /criargz [minx] [miny] [maxx] [maxy] [nome]");
	CriarGangZone(Pos[0], Pos[1], Pos[2], Pos[3], gzn);
	SendClientMessage(playerid, LIGHTBLUE, "criado com sucesso."); //Pos[0], Pos[1], Pos[2], Pos[3], gzn);
	return 1;
}
cmd:editargps(playerid){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	
	new str[1200];
	strcat(str, "ID\tlocal\n");
	for(new i; i<MAX_GPS_LOCAL; i++){
	    if(GpsInfo[i][LocalCriado]){
	    	new str2[144];
		    format(str2, sizeof(str2), "%d\t%s\n", i, GpsInfo[i][LocalName]);
	    	strcat(str, str2);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_EDITARGPS, 5, "{fff000}Selecione para editar.", str, "Ok", "Sair");
	return 1;
}
cmd:clima(playerid){
	if(PlayerInfo[playerid][Admin] < 4) return 1;
	
    tempoeclima();
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Clima e aleatorio.");
	return 1;
}
cmd:hora(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 4) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar este comando.");
	if(isnull(params) || Numero(params)) return SendClientMessage(playerid, -1, "/hora [ 0 - 24 ]");
	SendClientMessageToAll(Rosa, fString("Staff %s alterou a hora do servidor para: %04.d", nome(playerid), strval(params)));
	SetWorldTime(strval(params));
	return 1;
}
cmd:abrirp(playerid, params[]){
	if(isnull(params) || Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /abrirp [ id do portao ]");
	new i = strval(params);
 	if(!IsPlayerInRangeOfPoint(playerid, 6.2, InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta muito longe deste portao.");
    if(isnull(InfoPortao[i][SenhaPortao])){
  		MoveDynamicObject(InfoPortao[i][OPortao], InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz]-8000, 7.0);
	    GameTextForPlayer(playerid, "~Y~Portao sem senha!", 2000, 3);
		SetTimerEx("fecharop", 7000, false, "i", i);
	}
	else{
 		ShowPlayerDialog(playerid, DIALOG_ABRIRPORTAO, DIALOG_STYLE_INPUT, "{fff000}Abrindo O Portao", "{33ccff}Digite a senha deste portao para voce abrir.", "Ok", "Sair");
		SetPVarInt(playerid, "qualopID", i);
	}
	return 1;
}

cmd:menuvip(playerid){
	new str[86];
	format(str, sizeof(str), "{f07b0f}Menu Vip | {fff000}Voce possui %d Coins", PlayerInfo[playerid][Cash]);
	ShowPlayerDialog(playerid, DIALOG_MENUVIP, DIALOG_STYLE_LIST, str, "1\tComprar Vip\n2\tComprar Itens\n3\tMudar Nome", "Ok","Sair");
	return 1;
}
alias:menuvip("menucoin", "menuc", "menucash", "lojavip")

cmd:menuportao(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /menuportao [ id do portao ]");
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /menuportao [ id do portao ]");
	new id = strval(params);
	if(!InfoPortao[id][PortaoCriado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o id de um portao nao existente.");
	if(PlayerInfo[playerid][Admin] == 0 && strcmp(InfoPortao[id][DonoPortao], nome(playerid), false, 24)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode abrir este portao.");
	SetPVarInt(playerid, "oportaoi", id);
	new str[45];
	format(str, sizeof(str), "Portao %d ( %s )", id, InfoPortao[id][DonoPortao]);
	ShowPlayerDialog(playerid, DIALOG_FUNCOESPORTAO, DIALOG_STYLE_LIST, str, "{33ccff}Editar Posicao\n{33ccff}Mudar Senha\n{33ccff}Mudar Dono {ff0000}SOMENTE ADMINS\n{33ccff}Recolher Portao", "Ok", "Sair");
	return 1;
}
cmd:setarcoins(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 11) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando.");
	new id, qnt;
	if(sscanf(params, "ii", id, qnt)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /setarcoins [ id ou nome ] [ quantia ]");
	new uva = -1;
	foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o ID de um jogador offline.");
	if(qnt < 0 || qnt > 100) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Quantia invalida!");
	if(PlayerInfo[id][Cash] > 80) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador ja possui muito Cash.");
	new str[95];
	format(str, sizeof str, "|INFO| Voce setou %d Coins para o jogador %s.", qnt, nome(id));
	SendClientMessage(playerid, Amarelo, str);
	format(str, sizeof str, "|INFO| Voce recebeu %d Coins do staff %s.", qnt, nome(playerid));
	SendClientMessage(id, Amarelo, str);
	PlayerInfo[id][Cash] += qnt;
	format(str, sizeof str, "%s setou %dC %s", nome(playerid), qnt, nome(id));
	AdicionarLogs(str);
	return 1;
}
cmd:fr(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /fr [ fora do roleplay (OOC) ]");
	new str[144];
	format(str, sizeof(str), "* %s diz: %s", nome(playerid), params);
	MensagemLocal(25.0, playerid, Cinza, str, false);
	return 1;
}
//	ApllyAnim(playerid,"SMOKING","M_smk_drag",4.1,0,1,1,0,0);
cmd:mutarvoip(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 3) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/mutarvoip [ id ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "/mutarvoip [ id ]");
	new id = strval(params), achou = -1;
	foreach(new i: Player){
		if(PlayerInfo[i][IDFixo] == id){
			id = i;
			achou = i;
		}
	}
	if(achou == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Jogador offline!");
	if(PlayerInfo[id][Admin] > PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso.");
	/*if(!SvMutePlayerStatus(id)){
		SvMutePlayerEnable(id);
		new str[90];
		format(str, sizeof str, "%s mutou o voip do jogador %s", nome(playerid), nome(id));
		SendClientMessageToAll(ColorStaff(PlroiayerInfo[playerid][Admin]), str);
		SendClientMessage(id, ColorStaff(PlayerInfo[playerid][Admin]), "* Voce foi mutado por um admin.");
		PlayerInfo[id][VoipMutado] = true;
	}
	else{
		SvMutePlayerDisable(id);
		new str[90];
		format(str, sizeof str, "%s desmutou o voip do jogador %s", nome(playerid), nome(id));
		SendClientMessageToAll(ColorStaff(PlayerInfo[playerid][Admin]), str);
		SendClientMessage(id, ColorStaff(PlayerInfo[playerid][Admin]), "* Voce foi desmutado por um admin.");
		PlayerInfo[id][VoipMutado] = false;		
	}*/
	return 1;
}
cmd:caixa(playerid){
	if(PlayerInfo[playerid][Emprego] != CARRO_FORTE || !TrabalhandoEmprego[playerid][CARRO_FORTE]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao trabalha com carro forte ou nao esta trabalhando agora.");
	if(!IsValidVehicle(SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa spawnar o carro forte");
	if(CarroForte[ SpawnouEmprego[playerid] ] < 5000) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa que o carro forte esteja carregado com mais de 5000R$! Total atualmente: %d/40000", CarroForte[SpawnouEmprego[playerid]]);
	if(Caixaplayer[playerid] != -1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja marcou um caixa.");
	new i = Iter_Random(B_Caixas);
	Caixaplayer[playerid] = i;
	SetPlayerCheckpoint(playerid, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ], 2.0);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Caixa %d foi marcado para voce.");
	return 1;
}
cmd:pegardinheiro(playerid){
	if(PlayerInfo[playerid][Emprego] != CARRO_FORTE || !TrabalhandoEmprego[playerid][CARRO_FORTE]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao trabalha com carro forte ou nao esta trabalhando agora.");
	if(!IsValidVehicle(SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa spawnar o carro forte");
	if(CarroForte[GetPlayerVehicleID(playerid)] >= 10000) return SendClientMessage(playerid,  LIGHTBLUE, "|INFO| Seu carro forte ainda tem dinheiro para entregar.");
	if(!ISP(playerid, 4.5, -986.9874,1467.3966,1332.0389)){
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta na posicao exata, foi marcado a entrada do cofre em seu mapa.");
	    SetPlayerCheckpoint(playerid, 1652.0073,923.9772,10.6719, 4.5);
	}
	else{
	    TogglePlayerControllableEx(playerid, false);
		TimerCarregandoCF[playerid] = SetTimerEx("CarregandoCFf", 2000, false, "i", playerid);
		GameTextForPlayer(playerid, "~G~Pegando Bolsa...", 2000, 1);
		ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
	}
	return 1;
}

forward CarregandoCFf(playerid);
public CarregandoCFf(playerid){
	ClearAnimations(playerid);
	TogglePlayerControllableEx(playerid, true);

	if(!IsValidVehicle(SpawnouEmprego[playerid]))
		return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Seu carro forte nao esta spawnado.");

	if(CarregandoCF[playerid] != 0)
		return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com uma bolsa de dinheiro. Coloque-a atras do carro forte!");

	CarregandoCF[playerid] = 1;
	TogglePlayerControllableEx(playerid, true);

	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de pegar uma bolsa de dinheiro. Va ate a traseira de seu Carro Forte.");
	SetPlayerAttachedObject(playerid,6,1550,1,0.197000,0.318000,0.000000,0.000000,84.100036,0.000000,1.000000,1.000000,1.000000);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	//CarroForte[SpawnouEmprego[playerid]] = 40000;
	//SetPlayerCheckpoint(playerid,InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ], 3.0);
	return 1;
}
cmd:descarregar(playerid){
	if(Caixaplayer[playerid] == -1) return 1;
	if(CarregandoCF[playerid] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta com o dinheiro em maos.");
	if(PlayerInfo[playerid][Emprego] != CARRO_FORTE || !TrabalhandoEmprego[playerid][CARRO_FORTE]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao e motorista de carro forte ou nao esta em modo de trabalho.");
    if(ReabastecendoCaixa[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta reabastecendo o caixa.");
	if(IsPlayerInVehicle(playerid, SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Saia de dentro do veiculo para descarregar!");
	new i = Caixaplayer[playerid];
	if(!ISP(playerid, 4.5, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ])){
	    SetPlayerCheckpoint(playerid, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ]-0.3, 4.5);
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| A Posicao do ponto de descarga foi marcado em seu mapa.");
	}
	else{

		ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
	    GameTextForPlayer(playerid, "~G~Reabastecendo o caixa...", 10000, 1);
	    ReabastecendoCaixa[playerid] = true;
	    TimerReabastecerCaixa[playerid] = SetTimerEx("terminardscrrg", 10000, false, "ii", playerid, i);
	}
	return 1;
}
FalharReabastecer(playerid){
	if(ReabastecendoCaixa[playerid]){
	    ReabastecendoCaixa[playerid] = false;
	    TogglePlayerControllableEx(playerid, true);
	    KillTimer(TimerReabastecerCaixa[playerid]);
	    ClearAnimations(playerid);
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce falhou no reabastecimento do caixa.");
	}
}

// ================= [ Comandos TRANSP_ARMA ] ================== */
cmd:descarregareqs(playerid){
	if(PlayerInfo[playerid][Org] == 0) return 1;
	new org = PlayerInfo[playerid][Org];
	if(DscEq[playerid]) return 1;
	if(IsPolice(org)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando!");
	if(PlayerInfo[playerid][Emprego] == TRANSP_ARMA) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode descarregar equipamentos da sua propria empresa em sua org.");
	new veh = GetPlayerVehicleID(playerid);
	if(CaminhaoCarregado[veh] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Este caminhao nao esta carregado.");
	if(VehOpcao(veh, VEICULO_LIGADO)) return SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo esta ligado! Desligue ele.");
	if(!ISP(playerid, 3.5, OrgInfo[org][OrgPickPos][0], OrgInfo[org][OrgPickPos][1], OrgInfo[org][OrgPickPos][2])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta no pickup de equipar da sua Organizacao.");
	TogglePlayerControllableEx(playerid, false);
	DscEq[playerid] = true;
	GameTextForPlayer(playerid, "~R~Descarregando Equipamentos...", 3000, 3);
	SetTimerEx("DandoEQ", 9000, false, "iii",playerid, veh, org);
	SendClientMessage(playerid, LIGHTBLUE, "* Voce esta descarregando a municao deste caminhao, nao ligue o motor!");
	SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+3);
	return 1;
	//CaminhaoCarregado
}
forward DandoEQ(playerid,veh, org);
public DandoEQ (playerid,veh, org){
	if(IsPlayerConnectedP(playerid)){
		if(!IsPlayerInVehicle(playerid, veh)){
			SendClientMessage(playerid, LIGHTBLUE, "* O Descarregamento nao pode continuar, voce saiu do veicul.");
			TogglePlayerControllableEx(playerid, true);
		}
		else if(!VehOpcao(veh, VEICULO_LIGADO)){
			if(IsValidVehicle(veh)){
				TogglePlayerControllableEx(playerid, true);
				OrgInfo[org][Equipamentos] += CaminhaoCarregado[veh];
				new str[144];
				DscEq[playerid] = false;
				format(str, sizeof str, "* %s descarregou %d caixas de municao para a Organizacao.", nome(playerid), CaminhaoCarregado[veh]);
				MessageOrg(PlayerInfo[playerid][Org], -1, str);
				SendClientMessage(playerid, LIGHTBLUE, "* Voce descarregou com sucesso este caminhao.");
				CaminhaoCarregado[veh] = 0;
				SendClientMessageToAll(LIGHTBLUE, "* Criminosos acabam de roubar um veiculo carregado de municao.");
				format(str, sizeof str, "%s roubou um CM.A(%s)", nome(playerid), OrgGm[org][OrgNome]);
				AdicionarLogs(str);
			}
			else{
				TogglePlayerControllableEx(playerid, true);
			}
		}
		else{
			SendClientMessage(playerid, LIGHTBLUE, "* Voce ligou o veiculo, o descarregamento de equipamentos nao pode continuar.");
			TogglePlayerControllableEx(playerid, true);
		}
	}
}
cmd:carregarc(playerid, params[]){
	if(PlayerInfo[playerid][Emprego] != TRANSP_ARMA || !TrabalhandoEmprego[playerid][TRANSP_ARMA]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao e Transpt. De Armas ou nao esta trabalhando.");
	if(!IsPlayerInVehicle(playerid, SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar no veiculo que spawnou do emprego.");
	if(CaminhaoCarregado[GetPlayerVehicleID(playerid)] == 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este caminhao ja esta carregado.");
	if(CarregandoCaminhao[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta carregando um caminhao.");
	if(!ISP(playerid, 5.0, 2413.7568,-2013.8184,13.4351)){
   		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar na posicao exata, foi marcado em seu mapa.");
   		SetPlayerCheckpoint(playerid, 2413.7568,-2013.8184,13.4351, 5.0);
	}
	else{
	    TogglePlayerControllableEx(playerid, false);
	    CarregandoCaminhao[playerid] = true;
	    TimeCarregandoCaminhao[playerid] = SetTimerEx("terminarcarregar", 8000, false, "i", playerid);
	    GameTextForPlayer(playerid, "~R~Carregando...", 7000, 1);
	}
	return true;
}
cmd:pegarcarga(playerid){
	if(PlayerInfo[playerid][Emprego] != TRANSP_ARMA || !TrabalhandoEmprego[playerid][TRANSP_ARMA]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao e Transpt. De Armas ou nao esta trabalhando.");
	if(SpawnouEmprego[playerid] == -1 || SpawnouEmprego[playerid] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao spawnou seu veiculo.");
	new Float: x, Float: y, Float: z;
	GetXYZOfVehiclePart(SpawnouEmprego[playerid], VEHICLE_PART_TRAZ, x, y, z);
	if(CaminhaoCarregado[ SpawnouEmprego[playerid]] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Seu caminhao esta sem Cargas!");
	if(!ISP(playerid, 4.1, x, y, z)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta na traseira do veiculo!");
	if(NaMao[playerid] != 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta com algo nas maos.");
	if(NaMao[playerid] == CAIXA_ENTREGA) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta com uma caixa de entrega nas maos.");
	CaminhaoCarregado[ SpawnouEmprego[playerid]] --;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	NaMao[playerid] = CAIXA_ENTREGA;
	SendClientMessage(playerid, LIGHTBLUE, fString("* Voce pegou uma caixa de armas, total %d/10.", CaminhaoCarregado[ SpawnouEmprego[playerid]] ));
	return 1;
}
cmd:descarregarc(playerid){
	if(PlayerInfo[playerid][Emprego] != TRANSP_ARMA || !TrabalhandoEmprego[playerid][TRANSP_ARMA]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao e Transpt. De Armas ou nao esta trabalhando.");
	if(NaMao[playerid] != CAIXA_ENTREGA) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa pegar uma Caixa De Armas na traseiro do veiculo.");
	if(!ISP(playerid, 5.0, -1722.4606,-117.3898,3.5489)){
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta na posicao exata, foi marcado em seu mapa.");
	    SetPlayerCheckpoint(playerid, -1722.4606,-117.3898,3.5489, 4.0);
	}
	else{
	    NaMao[playerid] = 0;
	    PlayerInfo[playerid][DinheiroPD] += 240;
	    SendClientMessage(playerid, LIGHTBLUE, "* Voce entregou uma caixa de armas.");
	    GameTextForPlayer(playerid, "~B~PayDay aumentado! +240$", 3000, 3);
	    PC_EmulateCommand(playerid, "/anim");
	}
	return 1;
}

cmd:roubarcf(playerid){
	if(PlayerInfo[playerid][Emprego] == CARRO_FORTE) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode roubar um carro forte trabalhando na empresa deles.");
	if(!IsBandido(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE,"* Voce nao pode fazer isso.");
	if(!PoliciaisOnline(5)) return SendClientMessage(playerid, LIGHTBLUE, "* Precisa de mais policiais online para fazer esta acao.");
	if( (gettime() - RoubadoCarroForte) > 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa aguardar %s para realizar outro roubo.", Convert(RoubadoCarroForte - gettime()));
	if(PlayerInfo[playerid][Org] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode roubar Carro Fortes.");
	if(NaMao[playerid] != DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa pegar a DINAMITE na mao.");
	if(!MembrosPerto(playerid, 4)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de 3 membros perto para roubar este Carro Forte.");
	foreach(new i: Vehicles){
		if(GetVehicleModel(i) == 428){
			new Float: X, Float: Y, Float: Z, Float: Ang;
			GetVehiclePos(i, X, Y, Z);
			GetVehicleZAngle(i, Ang);
			X = X + -3.0 * floatsin(-Ang, degrees);
	    	Y = Y + -3.0 * floatcos(-Ang, degrees);
	    	if(IsPlayerInRangeOfPoint(playerid, 3.9, X-1.0285, Y+1.0768, Z)){
	    		if(GetVehicleSpeed2(i) > 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode explodir um veiculo em movimento.");
	    		if(CarroForte[i] < 2000) return SendClientMessage(playerid, LIGHTBLUE, "*O Carro forte nao possui muito dinheiro para roubar.");
	    		if(BombaPlantada[i]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Ja existe uma bomba plantada aqui! Saia de perto");
	    		SetTimerEx("explodircf", 30000, false, "ii", PlayerInfo[playerid][Org], i);
	    		NaMao[playerid] = 0;
	    		BombaPlantada[i] = true;
	    		ClearAnimations(playerid);
	    		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	    		new str[144];
	    		format(str, sizeof(str), "**%s plantou o explosivo na porta do Carro Forte.", nome(playerid));
	    		MensagemLocal(55.0, playerid, Roxoeu, str, true);
	    		ApplyAnimationEx(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
	    		SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+3);
			    foreach(new y: Player){
			        if(IsPolice(PlayerInfo[y][Org])){
			        	//new str[86];
			        	format(str, sizeof str, "AVISO: %s esta roubando um carro forte.", nome(playerid));
						SendClientMessage(y, LIGHTBLUE, str);
						SetPlayerCheckpoint(y, X, Y, Z, 3.4);
						
					}
				}
				AdminMessage(Rosa, str);
				SendClientMessageToAll(LIGHTBLUE, fString("* Um Carro Forte esta sendo Roubado em %s.", CoordZone(X, Y, Z)));
	    		break;
	    	}
		}
	}
	return 1;
}
forward explodircf(org, i);
public explodircf(org, i){
	if(!BombaPlantada[i]) return 1;

	new Float: X, Float: Y, Float: Z, Float: Ang;
	GetVehiclePos(i, X, Y, Z);
	GetVehicleZAngle(i, Ang);
   	SetVehicleParamsEx(i, false, true, true, false, false, false, false);
   	CreateExplosion(X, Y, Z, 6, 10.0);
   	new conta = CarroForte[i] / 23;
   	X = X + -5.2 * floatsin(-Ang, degrees);
  	Y = Y + -5.2 * floatcos(-Ang, degrees);
   	for(new grana; grana<16; grana++){
   		CriarItemDrop(X-1.0293-RdonPickups[random(sizeof(RdonPickups))][0], Y+1.0768+RdonPickups[random(sizeof(RdonPickups))][0], Z, DINHEIRO_FLUTUANTE_BANDIDO, random(conta));
   	}
   	new FStr[144];
   	format(FStr, sizeof FStr, "Um Carro forte foi roubado na regiao de %s com %dR$ de dinheiro...", CoordZone(X, Y, Z), CarroForte[i]);
   	SendClientMessageToAll(LIGHTBLUE, FStr);
   	CarroForte[i] = 0;
   	BombaPlantada[i] = false;
   	new Query[180], time[6];
	gettime(time[0], time[1], time[2]);
	//gettime(hour=0, minute=0, second=0)
	getdate(time[3],time[4], time[5]);
	//getdate(year=0, month=0, day=0)
   	mysql_format(Dados, Query, sizeof Query, "INSERT INTO `Logs` (`Log`, `Data`) VALUES ('roubo a carro forte (%s)(%d)', '%d/%d/%d %d:%d')",
   		OrgGm[ org ][Sigla], GetPmOn(), time[5], time[4], time[3], time[0], time[1]);
    mysql_tquery(Dados, Query);
    RoubadoCarroForte = gettime() + 60 * 50; // 60 segundos X 50 = 50m :)
   	return 1;
}
FalharCarregandoCaminhao(playerid){
	if(CarregandoCaminhao[playerid]){
	    CarregandoCaminhao[playerid] = false;
		KillTimer(TimeCarregandoCaminhao[playerid]);
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Falha no carregamento do caminhao.");
	}
}
//=============================================================*/
cmd:pagar(playerid, params[]){
	new id, valor;
	if(sscanf(params, "ii", id, valor)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /pagar [ id ] [ valor ]");
	new uva = -1;
	foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta conectado.");
	if(valor <= 0 || valor > GetPlayerCash(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Valor invalido, digite novamente.");
	if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode pagar voce mesmo.");
	new Float:Pos[3];
	GetPlayerPos(id, Pos[0], Pos[1], Pos[2]);
	if(!ISP(playerid, 6.0, Pos[0], Pos[1], Pos[2])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta muito longe de voce.");
	GivePlayerCash(id, valor);
	GivePlayerCash(playerid, -valor);
	new str[144];
	format(str, sizeof str, "AVISO: Voce pagou %dR$ de dinheiro para %s.", valor, nome(id));
	SendClientMessage(playerid, 0x33aa33ff, str);
	format(str, sizeof str, "AVISO: Voce recebeu %dR$ de dinheiro de %s.", valor, nome(playerid));
	SendClientMessage(id, 0x33aa33ff,  str);
	return 1;
}

// ====================== | Comandos Vips | =====================*/
cmd:skin(playerid, params[]){
	if(PlayerInfo[playerid][Vip] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser vip.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /skin [ id da skin ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /skin [ id da skin ]");
	new id = strval(params);
	if(id <= 0 || id == 217 || id > 311) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar esta skin.");
	SetPlayerSkin(playerid, id);
	new str[60];
	format(str, sizeof(str), "** VIP %s trocou sua skin.", nome(playerid));
	MensagemLocal(55.0, playerid, Roxoeu, str, false);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Esta skin nao e permanente! Assim que respawnar sera trocado.");
	return 1;
}
cmd:pegarsalario(playerid){
	if(PlayerInfo[playerid][Vip] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser vip.");
	if(PlayerInfo[playerid][DinheiroPD] < 1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem salario para receber.");
	SendClientMessageToAll(LIGHTBLUE, fString("VIP: %s acaba de pegar o seu salario.", nome(playerid)));
	GivePlayerCash(playerid, PlayerInfo[playerid][DinheiroPD]);
	PlayerInfo[playerid][DinheiroPD] = 0;
	SendClientMessage(playerid, COR_COPOM, "Aviso: O Dinheiro pego foi para sua mao!");
	return 1;
}
/*
	{"{7f7679}Platina", 12},
	{"{a6e0ed}Diamante", 15},
	{"{e0115f}Ruby", 25}
*/
cmd:cv(playerid, params[]){
	if(PlayerInfo[playerid][Vip] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao e VIP.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/chatvip [texto]");
	new vip = PlayerInfo[playerid][Vip];
	new str[255];
	if(vip == 1){
		format(str, sizeof str, "(%d)(/CV) Platina: %s diz: %s.", PlayerInfo[playerid][IDFixo], nome(playerid), params);
		SendVipsMessage(0x7f7679FF, str);
	}
	if(vip == 2){
		format(str, sizeof str, "(%d)(/CV) Diamante:%s diz: %s.", PlayerInfo[playerid][IDFixo], nome(playerid), params);
		SendVipsMessage(0xa6e0edFF, str); 
	}
	if(vip == 3){
		format(str, sizeof str, "(%d)(/CV) MAGNATA Ruby: %s diz: %s.", PlayerInfo[playerid][IDFixo], nome(playerid), params);
		SendVipsMessage(0xee0115fF, str); 
	}
	return 1;
}
SendVipsMessage(color, const str[]){
	foreach(new i: Player){
		if(PlayerInfo[i][Vip] > 0){
			SendClientMessage(i, color, str);
		}
	}
	return 1;
}
cmd:an(playerid, params[]){
	if(PlayerInfo[playerid][Vip] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao e VIP.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/an(uncio) [texto]");
	new vip = PlayerInfo[playerid][Vip];
	if(vip == 1){
		SendClientMessageToAll(0x7f7679FF, "ANUNCIO Platina:(%d)%s diz: %s.", PlayerInfo[playerid][IDFixo], nome(playerid), params);
	}
	if(vip == 2){
		SendClientMessageToAll(-1, " ");
		SendClientMessageToAll(0xa6e0edFF, "ANUNCIO Diamante:(%d)%s diz: %s.", PlayerInfo[playerid][IDFixo], nome(playerid), params);
	}
	if(vip == 3){
		SendClientMessageToAll(-1, " ");
		SendClientMessageToAll(-1, " ");
		SendClientMessageToAll(0xee0115fF, ">>_______________________ANUNCIO MAGNATA Ruby_______________________<<");
		SendClientMessageToAll(0xee0115fF, "MAGNATA Ruby: (%d)%s diz: %s.", PlayerInfo[playerid][IDFixo], nome(playerid), params);
	}
	return 1;
}
cmd:abastecervip(playerid, params[]){
	if(PlayerInfo[playerid][Vip] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser vip.");
	
	if(gettime() - TempoComandoAbastecer[playerid] < 120) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pode usar este comando com um intervalo de 2 minutos.");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar dentro de um veiculo.");
    TempoComandoAbastecer[playerid] = gettime() + 120;
    RepairVehicle(GetPlayerVehicleID(playerid));
 	new str[60];
	format(str, sizeof(str), "** VIP %s abasteceu seu veiculo.", nome(playerid));
	MensagemLocal(80.0, playerid, Roxoeu, str, true);
	VeiculoConfiguracao[GetPlayerVehicleID(playerid)][Quebrado] = false;
	return 1;
}
cmd:reparar(playerid, params[]){
	if(PlayerInfo[playerid][Vip] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser vip.");
	
	if(gettime() - TempoComandoReparo[playerid] < 120) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pode usar este comando com um intervalo de 2 minutos.");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar dentro de um veiculo.");
    TempoComandoReparo[playerid] = gettime() + 120;
    RepairVehicle(GetPlayerVehicleID(playerid));
 	new str[60];
	format(str, sizeof(str), "** VIP %s reparou seu veiculo.", nome(playerid));
	MensagemLocal(80.0, playerid, Roxoeu, str, true);
	VeiculoInfo[GetPlayerVehicleID(playerid)][Gasolina] = 100;
	VeiculoConfiguracao[GetPlayerVehicleID(playerid)][Quebrado] = false;
	return 1;
}
// ====================== | Fim Comandos Vips | =====================*/
cmd:guardar(playerid, params[]){
	if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem mochila.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /guardar [ nome do item ]");
	PC_EmulateCommand(playerid, "/anim");
	if(!strcmp(params, "gv", true, 3)){
        if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta cheia.");
	    if(NaMao[playerid] != GALAO_VAZIO) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta com uma DINAMITE na mao.");
	    AdicionarItem(playerid, GALAO_VAZIO, 1);
		new str[90];
		format(str, sizeof(str), "* %s guardou um Galao Vazio na mochila.", nome(playerid));
		MensagemLocal(30.0, playerid, Roxoeu, str, true);
		NaMao[playerid] = 0;
	}
	if(!strcmp(params, "dinamite", true, 4)){
        if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta cheia.");
	    if(NaMao[playerid] != DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta com uma DINAMITE na mao.");
	    AdicionarItem(playerid, DINAMITE, 1);
		new str[90];
		format(str, sizeof(str), "* %s guardou uma DINAMITE na mochila.", nome(playerid));
		MensagemLocal(30.0, playerid, Roxoeu, str, true);
		NaMao[playerid] = 0;
	}
	else if(!strcmp(params, "arma", true, 5)){
		//if(IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso.");
	    //if(GetPlayerWeapon(playerid) == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta com uma arma na mao.");
        if(!GetPlayerWeapon(playerid)) return 1;
        if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta cheia.");
        if(GetPlayerWeapon(playerid) == WEAPON:34) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode guardar esta arma.");
        if(PlayerInfo[playerid][Nivel] < 2){
			SetPlayerAmmo(playerid, WeaponSlot(GetPlayerWeapon(playerid)), 0);
			SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de no minimo nivel 2 para guardar um armamento.");
		}
		else{
		    AdicionarItem(playerid, IDparaARMA(GetPlayerWeapon(playerid)), GetPlayerAmmo(playerid));
		    new str[90], gun[32];
			GetWeaponName(GetPlayerWeapon(playerid), gun, sizeof(gun));
			format(str, sizeof(str), "* %s guardou a arma %s na mochila.", nome(playerid), gun);
			MensagemLocal(30.0, playerid, Roxoeu, str, true);
			RemovePlayerWeapon(playerid, GetPlayerWeapon(playerid));
		}
	}
	else
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao consegue guardar este item.");
	return 1;
}
cmd:e(playerid){
	foreach(new i: B_Interiores){
		if(IsPlayerInRangeOfPoint(playerid, 1.5, IntInfo[i][IntX], IntInfo[i][IntY],IntInfo[i][IntZ]) && IntInfo[i][InteriorCriado]){
            SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsY],IntInfo[i][IntsZ]);
            SetPlayerInterior(playerid, IntInfo[i][Interior]);
            SetPlayerVirtualWorld(playerid, i);
            new str[45];
            format(str, sizeof(str), "|INFO| Voce entrou em: %s", IntInfo[i][NomeInterior]);
            SendClientMessage(playerid, LIGHTBLUE, str);
            SetPVarString(playerid, "EntradaLoja", IntInfo[i][NomeInterior]);
			TogglePlayerControllableEx(playerid, false);
			SetTimerEx("descongelar", 4000, false, "i", playerid);
			SetPVarInt(playerid, "InteriorHABf", i);
	        break;
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1.5, IntInfo[GetPlayerVirtualWorld(playerid)][IntsX], IntInfo[GetPlayerVirtualWorld(playerid)][IntsY],IntInfo[GetPlayerVirtualWorld(playerid)][IntsZ]) && IntInfo[GetPlayerVirtualWorld(playerid)][InteriorCriado]){
		    SetPlayerPosEx(playerid, IntInfo[GetPlayerVirtualWorld(playerid)][IntX], IntInfo[GetPlayerVirtualWorld(playerid)][IntY],IntInfo[GetPlayerVirtualWorld(playerid)][IntZ]);
		    SetPlayerInterior(playerid, 0);
		    SetPlayerVirtualWorld(playerid, 0);
		    SetPVarString(playerid, "EntradaLoja", "");
		    TogglePlayerControllableEx(playerid, false);
		    SetTimerEx("descongelar", 4000, false, "i", playerid);
		    break;
		}
	}	
	return 1;
}
cmd:anim(playerid){
	if(NoTaser[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando no momento.");
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando ferido.");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando em um veiculo");
	ClearAnimations(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	Sentado[playerid] = false;
	return 1;
}
cmd:render(playerid){
	ApplyAnimationEx(playerid, "PED", "HANDSUP", 4.1, 0, 1, 1, 1, 1, SYNC_ALL);
	//SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
	new str[74];
	format(str, sizeof(str), "** %s levanta as maos para o alto.", nome(playerid));
	MensagemLocal(30.0, playerid, Roxoeu, str, true);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Use /anim para a animacao sair.");
	return 1;
}
cmd:deitar(playerid)
{
	ApllyAnim(playerid, "PED", "KO_SKID_BACK", 3.1, 0, 1, 1, 1, 1, SYNC_ALL);
	new str[74];
	format(str, sizeof(str), "** %s deitou de frente no chao.", nome(playerid));
	MensagemLocal(30.0, playerid, Roxoeu, str, true);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Use /anim para a animacao sair.");
	return 1;
}

cmd:agachar(playerid)
{
    if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");
    ApplyAnimation(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0, SYNC_ALL);
    return 1;
}

cmd:vomitar(playerid)
{
    if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

    ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0, SYNC_ALL);
    return 1;
}
cmd:comprimentar(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");
  
	ApplyAnimation(playerid, "GANGS", "HNDSHKFA", 4.0, 0, 0, 0, 0, 0, SYNC_ALL);
	return 1;
}

cmd:sentar(playerid)
{
    if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

    if (Sentado[playerid]) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce ja esta sentado, use /anim para levantar.");
    
    ClearAnimations(playerid);
    ApplyAnimation(playerid, "PED", "SEAT_idle", 1.0, 1, 0, 0, 0, 0, SYNC_ALL);
    SendClientMessage(playerid, LIGHTBLUE, "Voce sentou, use /anim para levantar.");
	new str[74];
	format(str, sizeof(str), "** %s acaba de sentar.", nome(playerid));
	MensagemLocal(30.0, playerid, Roxoeu, str, true);
    Sentado[playerid] = true;
    return 1;
}
cmd:fumar(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

	ApplyAnimation(playerid, "SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
	return 1;
}

cmd:cruzarb(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

	ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
	return 1;
}

cmd:apontar(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

	ApplyAnimation(playerid, "ped", "ARRESTgun", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
	return 1;
}
cmd:animacoes(playerid)
{
    SendClientMessage(playerid, LIGHTBLUE, "/dance /falar /strip /bebado /apontar /fumar");
    SendClientMessage(playerid, LIGHTBLUE, "/sentar /deitar /comprimentar /vomitar /render");
    SendClientMessage(playerid, LIGHTBLUE, "/overdose /fumar /gro /cruzarb /stopanim /continencia");
    return 1;
}

cmd:continencia(playerid, const params[])
{
    if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

    new idCont;
    if (sscanf(params, "d", idCont))
        SendClientMessage(playerid, LIGHTBLUE, " Use: /continencia [1-2]");

    switch(idCont) 
    {
	    case 1:
	        ApplyAnimation(playerid, "ON_LOOKERS", "Pointup_shout", 4.1, 1, 1, 1, 0, 0, SYNC_ALL);
	    case 2:
	        ApplyAnimation(playerid, "ON_LOOKERS", "POINTUP_LOOP", 4.1, 1, 0, 0, 0, 0, SYNC_ALL);
    }
    return 1;
}

cmd:bebado(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

	ApplyAnimation(playerid, "PED", "WALK_DRUNK", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
	return 1;
}

cmd:falar(playerid)
{
    if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

    ApplyAnimation(playerid, "GHANDS", "gsign1LH", 4.0, 0, 0, 0, 0, 0, SYNC_ALL);
    return 1;
}

cmd:overdose(playerid)
{
    if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

    ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
    return 1;
}

cmd:gro(playerid)
{
    if (IsPlayerInAnyVehicle(playerid)) 
    	return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar animacoes dentro de um veiculo");

    ApplyAnimation(playerid, "BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
    return 1;
}
cmd:textos(playerid){
	if(PlayerInfo[playerid][Admin] < 9) return 1;

	if(TextoGerado){
	    TextoGerado = false;
	    SendClientMessage(playerid, Rosa, "|INFO| Voce desativou os textos dos objetos.");
		for(new i = 1; i<MAX_OBJT; i++){
		    if(ObjetoInfo[i][ObjetoCriado]){
		        DestroyDynamic3DTextLabel(ObjetoInfo[i][Texto]);
			}
		}
	}
	else{
	    TextoGerado = true;
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ativou os textos dos objetos.");
		for(new i = 1; i<MAX_OBJT; i++){
		    new string[256];
		    if(ObjetoInfo[i][ObjetoCriado]){
				format(string, sizeof(string), "{aa33aa}Objeto {ffffff}%d (%d)", ObjetoInfo[i][PIDF], ObjetoInfo[i][ObjetoModel]);
				ObjetoInfo[i][Texto] = CreateDynamic3DTextLabel(string, -1, ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ]-0.3, 5.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
			}
		}
	}
	return 1;
}
cmd:dpeixes(playerid){
	if(PlayerInfo[playerid][Emprego] != PESCADOR) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao trabalha com pescas.");
	if(!ISP(playerid, 2.5, -399.8480,-428.8607,16.2031)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta na posicao exata.");
	if(Peixes[playerid] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem peixes suficientes.");
	new str[128];
	format(str, sizeof(str), "{fff000}%s\n\n{ffffff}Voce possui um total de %d peixes.\n{ffffff}Deseja vender eles por %dR$?", nome(playerid), Peixes[playerid], (40*Peixes[playerid]));
	ShowPlayerDialog(playerid, DIALOG_VENDERPEIXES, DIALOG_STYLE_MSGBOX, "{ff0000}Aviso", str, "Sim","Nao");
	return 1;
}
cmd:jogarrede(playerid){
	if(PlayerInfo[playerid][Emprego] != PESCADOR) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao trabalha com pescas.");
	if(!TemItem(playerid, REDE)) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao tem rede de pesca.");
	if(IsPlayerInDynamicArea(playerid, ZonaPesca[0]) && TrabalhandoEmprego[playerid][PESCADOR]){
	    if(Pescando[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja jogou a rede, aguarde ela voltar !!");
	    if(Peixes[playerid] >= 20){
	        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui o maximo de peixes. Va ate a marcacao no mapa.");
	        SetPlayerCheckpoint(playerid, -399.8480,-428.8607,16.2031, 3.0);
		}
		else{
		    Pescando[playerid] = true;
		    TimerPesca[playerid] = SetTimerEx("pescando", 12000, false, "i", playerid);
		    GameTextForPlayer(playerid, "~R~Pescando...", 1, 1);
	    	TogglePlayerControllableEx(playerid, false);
		}
	}
	else
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao entrou em modo de trabalho ou nao esta na zona de pesca.");
	return 1;
}
cmd:trabalhar(playerid){
	if(PlayerInfo[playerid][Emprego] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui um emprego.");
	switch(PlayerInfo[playerid][Emprego]){
	    case PESCADOR:{
	        if(TrabalhandoEmprego[playerid][PESCADOR]){
	            TrabalhandoEmprego[playerid][PESCADOR] = false;
	            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Agora voce nao esta mais trabalhando de pescador.");
	            SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
			}
			else{
			    TrabalhandoEmprego[playerid][PESCADOR] = true;
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce comecou a trabalhar de pescador, va ate a marca amarela em seu mapa para pescar.");
				SetPlayerSkin(playerid, 35);
			}
		}
		case MADEIREIRO:{
		    if(TrabalhandoEmprego[playerid][MADEIREIRO]){
		        TrabalhandoEmprego[playerid][MADEIREIRO] = false;
		        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Agora voce nao esta mais trabalhando de madeireiro.");
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
			}
			else{
			    TrabalhandoEmprego[playerid][MADEIREIRO] = true;
			    SetPlayerSkin(playerid, 1);
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce comecou a trabalhar de Madeireiro, Va ate a marca em seu mapa e de /carvore.");
				new r = random(sizeof(MadeirasPosicao));
			    SetPlayerCheckpoint(playerid, MadeirasPosicao[r][0], MadeirasPosicao[r][1], MadeirasPosicao[r][2], 3.0);
			}
		}
		case TRANSPORTADORM:{
		    if(TrabalhandoEmprego[playerid][TRANSPORTADORM]){
		        TrabalhandoEmprego[playerid][TRANSPORTADORM] = false;
		        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Agora voce nao esta mais trabalhando de Transportador De Madeira.");
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
			}
			else{
			    TrabalhandoEmprego[playerid][TRANSPORTADORM] = true;
			    SetPlayerSkin(playerid, 260);
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce comecou a trabalhar de Transportador De M., Va ate a marca e spawne seu veiculo.");
				SetPlayerCheckpoint(playerid, -439.8221,-1752.9894,6.7783, 3.0);
			}
		}
		case TRANSP_ARMA:{
		    if(TrabalhandoEmprego[playerid][TRANSP_ARMA]){
		        TrabalhandoEmprego[playerid][TRANSP_ARMA] = false;
		        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Agora voce nao esta mais trabalhando de Transpt. De Arma.");
		        SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
			}
			else{
			    TrabalhandoEmprego[playerid][TRANSP_ARMA] = true;
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce comecou a trabalhar de Transpt. De Arma, Va ate a marca e spawne seu veiculo.");
				SetPlayerCheckpoint(playerid, 2403.4880,-2101.4609,13.5469, 3.0);
				SetPlayerSkin(playerid, 260);
			}
		}
		case CARRO_FORTE:{
		    if(TrabalhandoEmprego[playerid][CARRO_FORTE]){
		        TrabalhandoEmprego[playerid][CARRO_FORTE] = false;
		        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Agora voce nao esta mais trabalhando de Carro Forte.");
		        SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
			}
			else{
			    TrabalhandoEmprego[playerid][CARRO_FORTE] = true;
			    MotoristaCF[playerid] = true;
			    SetPlayerSkin(playerid, 71);
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce entrou em modo de trabalho. Va ate a marca e spawne um veiculo.");
				SetPlayerCheckpoint(playerid, 1701.5437,917.7558,10.8203, 3.0);
			}
		}
		case MECANICO:{
			new str[144];
			if(TrabalhandoEmprego[playerid][MECANICO]){
				TrabalhandoEmprego[playerid][MECANICO] = false;
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce saiu do modo de servico.");
				format(str, sizeof str, "* Mecanico (%d)%s saiu do modo de servico.", PlayerInfo[playerid][IDFixo], nome(playerid));
				SendClientMessageToAll(VerdeSamp, str);
			}
			else{
				TrabalhandoEmprego[playerid][MECANICO] = true;
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce entrou em modo de servico, use /chamados para ver os chamados de mecanico.");
				SetPlayerSkin(playerid, 42);
				format(str, sizeof str, "* Mecanico (%d)%s esta disponivel para servico.",  PlayerInfo[playerid][IDFixo], nome(playerid));
				SendClientMessageToAll(VerdeSamp, str);
			}
		}
		case LEITEIRO:{
			if(TrabalhandoEmprego[playerid][LEITEIRO]){
				TrabalhandoEmprego[playerid][LEITEIRO] = false;
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce saiu do modo de servico.");
				VacaMarcada[playerid] = -1;
				TirandoLEITE[playerid] = false;
				DisablePlayerCheckpoint(playerid);
			}
			else{
				TrabalhandoEmprego[playerid][LEITEIRO] = true;
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce entrou em modo de trabalho, va ate a marca e de /tirarLEITE.");
				VacaMarcada[playerid] = random(sizeof vacasinfo);
				SetPlayerCheckpoint(playerid, vacasinfo[VacaMarcada[playerid]][0], vacasinfo[VacaMarcada[playerid]][1], vacasinfo[VacaMarcada[playerid]][2], 3.0);
			}
		}
		case TAXISTA:{
			if(TrabalhandoEmprego[playerid][TAXISTA]){
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				TrabalhandoEmprego[playerid][TAXISTA] = false;
				new veh = SpawnouEmprego[playerid];
				if(IsValidVehicle(veh)){
					KillTimer(TimerTaximetro[veh]);
					TimerTaximetro[veh] = -1;
					VeiculoInfo[veh][MileageTaxi] = 0.0;
				}
				new str[144];
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce saiu do modo de servico.");
				format(str, sizeof str, "* Taxista (%d)%s saiu do modo de servico.",  PlayerInfo[playerid][IDFixo], nome(playerid));
				SendClientMessageToAll(VerdeSamp, str);
			}
			else{
				new str[144];
				SetPlayerSkin(playerid, 142);
				TrabalhandoEmprego[playerid][TAXISTA] = true;
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce entrou em modo de trabalho, Veja os chamados usando /chamados.");
				format(str, sizeof str, "* Taxista (%d)%s esta disponivel para servico.",  PlayerInfo[playerid][IDFixo], nome(playerid));
				SendClientMessageToAll(VerdeSamp, str);
			}
		}
		case CACADOR:{
			if(TrabalhandoEmprego[playerid][CACADOR]){
				TrabalhandoEmprego[playerid][CACADOR] = false;
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta mais caçando agora.");
				GangZoneHideForPlayer(playerid, ZonaDeCaca);
			}
			else{
				TrabalhandoEmprego[playerid][CACADOR] = true;
				SetPlayerSkin(playerid, 6);
				GivePlayerWeapon(playerid, WEAPON_SNIPER, 30);
				SendClientMessage(playerid, LIGHTBLUE, "* Voce iniciou seu trabalho como Cacador, cace Servos na area amarela.");
				GangZoneShowForPlayer(playerid, ZonaDeCaca, COR_COPOM);
			}		
		}
		case SAMU:{
			if(TrabalhandoEmprego[playerid][SAMU]){
				TrabalhandoEmprego[playerid][SAMU] = false;
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				SendClientMessage(playerid, LIGHTBLUE, "* Voce saiu do modo de servico.");
			}
			else{
				TrabalhandoEmprego[playerid][SAMU] = true;
				SetPlayerSkin(playerid, 274);
				new str[144];
				format(str, sizeof str, "* SAMU (%d)%s esta disponivel para atendimentos.",  PlayerInfo[playerid][IDFixo], nome(playerid));
				SendClientMessageToAll(LIGHTBLUE, str);	
			}		
		}
		case TRANSP_COMBUSTIVEL:{
			if(!TrabalhandoEmprego[playerid][TRANSP_COMBUSTIVEL]){
				TrabalhandoEmprego[playerid][TRANSP_COMBUSTIVEL] = true;
				SetPlayerSkin(playerid, 260);
				SendClientMessage(playerid, LIGHTBLUE, "* Voce entrou em modo de trabalho. Va na marca pegar um Veiculo.");
				SetPlayerCheckpoint(playerid, -997.0001, -600.4232, 32.0432, 3.0);
			}
			else{
				TrabalhandoEmprego[playerid][TRANSP_COMBUSTIVEL] = false;
				SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				SendClientMessage(playerid, LIGHTBLUE,"* Voce saiu do modo de trabalho.");
			}
		}
	}
	return 1;
}

cmd:tirarLEITE(playerid){
	if(PlayerInfo[playerid][Emprego] != LEITEIRO) return 1;
	if(!TrabalhandoEmprego[playerid][LEITEIRO]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa dar /trabalhar antes.");
	if(!ISP(playerid, 2.4, vacasinfo[VacaMarcada[playerid]][0], vacasinfo[VacaMarcada[playerid]][1], vacasinfo[VacaMarcada[playerid]][2])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta perto da vaca marcada.");
	if(TirandoLEITE[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta tirando LEITE.");
	if(LEITEs[playerid] >= 50) return SendClientMessage(playerid, LIGHTBLUE, "* Voce atingiu o limite de LEITEs! Va vender.");
	TogglePlayerControllableEx(playerid, true);

	SendClientMessage(playerid, Roxoeu, "* Voce comecou a tirar LEITE dessa vaca.");
	TirandoLEITE[playerid] = true;
	TimerLEITE[playerid] = SetTimerEx("termianrLEITE", 10000, false, "i", playerid);
	GameTextForPlayer(playerid, "~R~Tirando LEITE...", 1000, 3);
	ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
	ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
	return 1;
}
cmd:venderLEITE(playerid){
	if(PlayerInfo[playerid][Emprego] != LEITEIRO) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode vender LEITEs.");
	if(!TrabalhandoEmprego[playerid][LEITEIRO]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar trabalhando para vender LEITE!");
	if(!ISP(playerid, 3.0, -377.46396, -1449.73047, 25.64083)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta perto do Eric Do LEITE Morno para vender os LEITEs.");
	if(LEITEs[playerid] < 1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem LEITEs para vender!");
	PlayerInfo[playerid][DinheiroPD] += (9*LEITEs[playerid]);
	GameTextForPlayer(playerid, "~B~Pay Day aumentado!", 2000, 3);
	new str[60];
	format(str, sizeof str, "Voce vendeu %dL de LEITE por {33aa33}%dR$", LEITEs[playerid], 9*LEITEs[playerid]);
	SendClientMessage(playerid, LIGHTBLUE, str);
	LEITEs[playerid] = 0;
	GameTextForPlayer(playerid, "~B~PayDay aumentado!", 3000, 3);
	VacaMarcada[playerid] = random(sizeof vacasinfo);
	SetPlayerCheckpoint(playerid, vacasinfo[VacaMarcada[playerid]][0], vacasinfo[VacaMarcada[playerid]][1], vacasinfo[VacaMarcada[playerid]][2], 3.0);
	SendClientMessage(playerid, Roxoeu, "* Va para a proxima vaca!");
	return 1;
}
//native KillPlayerTimers(playerid);
forward termianrLEITE(playerid);
public termianrLEITE(playerid){
	TirandoLEITE[playerid] = false;
	new randola = 1 + random(4);
	new str[69];
	format(str, sizeof str, "Voce tirou %d litros da vaca, total %d .", randola, LEITEs[playerid]+randola);
	SendClientMessage(playerid, VerdeSamp, str);
	LEITEs[playerid] += randola;
	if(LEITEs[playerid] > 50){
		SendClientMessage(playerid, LIGHTBLUE, "* Voce atingiu o limite de LEITEs! Va vender.");
		SetPlayerCheckpoint(playerid, -377.46396, -1449.73047, 25.64083, 2.4);
	}
	else{
		VacaMarcada[playerid] = random(sizeof vacasinfo);
		SetPlayerCheckpoint(playerid, vacasinfo[VacaMarcada[playerid]][0], vacasinfo[VacaMarcada[playerid]][1], vacasinfo[VacaMarcada[playerid]][2], 3.0);
		SendClientMessage(playerid, Roxoeu, "* Va para a proxima vaca!");
	}
	TogglePlayerControllableEx(playerid, true);
	return 1;
}
cmd:menuconserto(playerid){
	if(PlayerInfo[playerid][Emprego] != MECANICO) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao e um mecanico.");
	if(!TrabalhandoEmprego[playerid][MECANICO]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa entrar em modo de servico!");
	ShowPlayerDialog(playerid, DIALOG_MENUCONSERTO, 5, "{fff000}Menu Conserto", "{33ccff}Opcao\t{33ccff}Necessario\n\
		{fff000}Reparar Veiculo\tKit Reparo\n{fff000}Trocar Cor\tSpray\n\
		{fff000}Guinchar\tCaminhao Do Emprego\n{fff000}Reabastecer\tGalao De Gasolina", "Ok", "Sair");
	return 1;	
}
cmd:meusitens(playerid){
	if(PlayerInfo[playerid][Emprego] != MECANICO) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser mecanico!");
	if(!TrabalhandoEmprego[playerid][MECANICO]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ficar em modo de servico.");
	new str[167];
	format(str, sizeof str, "{33ccff}%s:\n\nKit De Reparo %d\nSprays: %d\nJogo De Rodas: %d\nGasolinas: %d", nome(playerid), MecMenu[playerid][KitReparo], MecMenu[playerid][Sprays], MecMenu[playerid][KitRodas], MecMenu[playerid][Gasolinas]);
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Menu Do Mecanico", str, "Ok", "sair");
	return 1;
}
cmd:mecmenu(playerid){
	if(PlayerInfo[playerid][Emprego] != MECANICO) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser mecanico!");
	if(!TrabalhandoEmprego[playerid][MECANICO]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ficar em modo de servico.");
	if(!ISP(playerid, 3.0, 1832.9821,-1417.8627,13.6016)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar na Oficina.");
	AbrirMecMenu(playerid);
	return 1;
}
AbrirMecMenu(playerid){
	new str[255];
	strcat(str, "Item\tPreco\tQuantia\n");
	for(new i = 1; i < sizeof MecanicoCompras; i++){
		new str2[256];
		format(str2, sizeof str2, "%s\t{33aa33}%d$\t%d\n", MecanicoCompras[i][nomeitem], MecanicoCompras[i][valoritemmec], MecanicoCompras[i][itemmec]);
		strcat(str, str2);
	}
	ShowPlayerDialog(playerid, DIALOG_MECMENU, 5, "{fff000}Menu Do Mecanico", str, "Ok", "sair");
}
cmd:reanimar(playerid){
	if(PlayerInfo[playerid][Emprego] != SAMU) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ser samu para usar este comando.");
	if(!TrabalhandoEmprego[playerid][SAMU]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa entrar em modo de trabalho.");
	if(CurandoAlguem[playerid] != -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta curando alguem.");
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE,"* Voce nao pode reviver alguem quando estiver ferido.");
	new usuario = -1;
	foreach(new i: Player){
		if(PlayerInfo[i][Ferido]){
			new Float: x, Float: y, Float: z;
			GetPlayerPos(i, x,y,z);
			if(ISP(playerid, 2.2, x, y, z) && i != playerid){
				if(SendoCurado[i]) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador ja esta sendo curado.");
				usuario = i;
				break;
			}
		}
	}
	if(usuario == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta perto de ninguem ferido.");
	new str[144];
	format(str, sizeof str, "* %s esta reanimando %s...", nome(playerid), nome(usuario));
	MensagemLocal(25.0, playerid, Roxoeu, str, false);
	SendoCurado[usuario] = true;
	CurandoAlguem[playerid] = usuario;
	SetTimerEx("reanimarnego", 9000, false, "ii", playerid, usuario);
	ApplyAnimationEx(playerid, "MEDIC", "CPR", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

forward reanimarnego(playerid, nego);
public  reanimarnego(playerid, nego){
	new Float: x, Float: y, Float: z;
	GetPlayerPos(nego, x, y, z);
	if(ISP(playerid, 2.2, x, y, z)){
		if(CurandoAlguem[playerid] == nego){
			TogglePlayerControllableEx(playerid, true);
			TogglePlayerControllableEx(nego, true);		
			ClearAnimations(nego);
			SendoCurado[nego] = false;
			CurandoAlguem[playerid] = -1;
			PlayerInfo[nego][Ferido] = false;
			PC_EmulateCommand(playerid, "/anim");
			PC_EmulateCommand(nego, "anim");
			new str[144];
			format(str, sizeof str, "* %s reanimou o jogador %s.", nome(playerid), nome(nego));
			MensagemLocal(25.0, playerid, Roxoeu, str, false);
			ApplyAnimationEx(nego, "PED", "HANDSUP", 4.1, 0, 1, 1, 1, 1, SYNC_ALL);
			ClearAnimations(nego);
			GameTextForPlayer(playerid, "~B~PayDay aumentado!", 3000, 3);
			PlayerInfo[playerid][DinheiroPD] += 350 + random(230);
		}
		else{
			CurandoAlguem[playerid] = -1;
			SendoCurado[nego] = false;
			SendClientMessage(nego, LIGHTBLUE, "* Nao foi possivel fazer a reanimacao, algum erro aconteceu.!");
			SendClientMessage(playerid, LIGHTBLUE,"* Algum erro aconteceu e voce nao pode salvar o paciente!");			
		}
	}	
	else{
		CurandoAlguem[playerid] = -1;
		SendoCurado[nego] = false;
		SendClientMessage(nego, LIGHTBLUE, "* Nao foi possivel fazer a reanimacao, o medico esta longe de voce!");
		SendClientMessage(playerid, LIGHTBLUE,"* Voce nao estava perto do jogador, ele nao foi reanimado!");
	}
}
cmd:chamados(playerid){//aqui (finalzinho)
	if(PlayerInfo[playerid][Emprego] == MECANICO){
		if(!TrabalhandoEmprego[playerid][MECANICO]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa entrar em modo de servico!");
		new str[320], contar, Float: X, Float: Y, Float: Z;
		foreach(new i: Player){
			if(!PedindoMecanico[i]) continue;
			GetPlayerPos(i, X, Y, Z);
			contar++;
			format(str, sizeof(str), "%s(%d)%s - Local: %s (%0.2fm)\n", str, i, nome(i), CoordZone(X, Y, Z), DistanciaPlayers(playerid, i));
		}
		if(contar == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Nao ha ninguem precisando de mecanico na cidade!");
		ShowPlayerDialog(playerid, DIALOG_ACEITARMEC, DIALOG_STYLE_LIST, "{fff000}Pedidos Mecanico", str, "Ok", #);
	}
	else if(PlayerInfo[playerid][Emprego] == TAXISTA){
		if(!TrabalhandoEmprego[playerid][TAXISTA]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa entrar em modo de servico!");
		new str[320], contar, Float: X, Float: Y, Float: Z;
		foreach(new i: Player){
			if(!PedindoTaxi[i]) continue;
			GetPlayerPos(i, X, Y, Z);
			contar++;
			format(str, sizeof(str), "%s(%d)%s - Local: %s (%0.2fm)\n", str, i, nome(i), CoordZone(X, Y, Z), DistanciaPlayers(playerid, i));
		}
		if(contar == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Nao ha ninguem precisando de Taxi na cidade!");
		ShowPlayerDialog(playerid, DIALOG_ACEITARTAXI, DIALOG_STYLE_LIST, "{fff000}Pedidos Taxi", str, "Ok", #);
	}
	else if(PlayerInfo[playerid][Emprego] == SAMU){
		if(!TrabalhandoEmprego[playerid][SAMU]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa entrar em modo de servico!");
		new str[320], contar, Float: X, Float: Y, Float: Z;
		foreach(new i: Player){
			if(!PedindoSamu[i]) continue;
			GetPlayerPos(i, X, Y, Z);
			contar++;
			format(str, sizeof(str), "%s(%d)%s - Local: %s (%0.2fm)\n", str, i, nome(i), CoordZone(X, Y, Z), DistanciaPlayers(playerid, i));
		}
		if(contar == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Nao ha ninguem precisando de SAMU na cidade!");
		ShowPlayerDialog(playerid, DIALOG_ACEITARSAMU, DIALOG_STYLE_LIST, "{fff000}Pedidos Taxi", str, "Ok", #);
	}				
	return 1;
}

public Float: DistanciaPlayers(playerid, otherplayer){
	new Float:pos[3], Float:distance =0.0;
	if(IsPlayerConnectedP(otherplayer)){
		GetPlayerPos(otherplayer, pos[0], pos[1], pos[2]);
	    distance = GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]);
	}
	return distance;
}
cmd:dmadeiras(playerid)
{
	if(PlayerInfo[playerid][Emprego] != MADEIREIRO || !TrabalhandoEmprego[playerid][MADEIREIRO]) return 1;
	if(Madeiras[playerid] < 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ter 10 toras.");
	if(!ISP(playerid, 2.0, -418.3577,-1763.3823,5.4784)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta na posicao que entrega as madeiras.");
	new str[70];
	format(str, sizeof(str), "|INFO| Voce vendeu suas 10 madeiras por {33aa33}+%dR$ de PayDay.", (90 * Madeiras[playerid]));
	SendClientMessage(playerid, 0x33aa33ff, str);
	PlayerInfo[playerid][DinheiroPD] += (90 * Madeiras[playerid]);
	GameTextForPlayer(playerid, "~B~Pay Day aumentado!", 2000, 3);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	Madeiras[playerid] = 0;
	MadeirasGlobal += 10;
	for(new i; i<sizeof(MadeirasPosicao); i++){
	    SetPlayerCheckpoint(playerid, MadeirasPosicao[i][0], MadeirasPosicao[i][1], MadeirasPosicao[i][2], 2.5);
	}
	return 1;
}
cmd:carregarm(playerid){
	if(ISP(playerid, 3.0, -423.2203,-1767.7653,5.0589) && TrabalhandoEmprego[playerid][TRANSPORTADORM]){
	    if(MadeirasCarro[GetPlayerVehicleID(playerid)] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Seu veiculo ja esta carregado.");
		if(CarregandoMadeira[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta carregando.");
		if(MadeirasGlobal < 6) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Espere alguem cortar mais madeiras!");
		TimerCarregandoMadeira[playerid] = SetTimerEx("carregandomadeira", 8000, false, "ii", playerid, GetPlayerVehicleID(playerid));
		TogglePlayerControllableEx(playerid, false);
		GameTextForPlayer(playerid, "~R~Carregando...", 1, 1);
	}
	return 1;
}
cmd:descarregarm(playerid){
	if(ISP(playerid, 3.0, -1114.63110, -1621.44092, 76.42254) && TrabalhandoEmprego[playerid][TRANSPORTADORM]){
	    if(!IsPlayerInVehicle(playerid, SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar em seu veiculo do emprego para descarregar as madeiras.");
		if(MadeirasCarro[SpawnouEmprego[playerid]] < 6) return SendClientMessage(playerid, LIGHTBLUE,"|INFO| Este veiculo nao esta carregado com madeiras.");
		if(DescarregandoMadeiras[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta descarregando madeiras.");
        DescarregandoMadeiras[playerid] = true;
		TimerDescarregar[playerid] = SetTimerEx("descarregartd", 5000, false, "i", playerid);
	    TogglePlayerControllableEx(playerid, false);
	    GameTextForPlayer(playerid, "~R~Descarregando...", 1, 1);
	}
	return 1;
}
FalharCarregando(playerid){
    CarregandoMadeira[playerid] = false;
	KillTimer(TimerCarregandoMadeira[playerid]);
	KillTimer(TimerDescarregar[playerid]);
	DescarregandoMadeiras[playerid] = false;
	TogglePlayerControllableEx(playerid, true);
	return 1;
}
cmd:carvore(playerid){
	if(PlayerInfo[playerid][Emprego] != MADEIREIRO || !TrabalhandoEmprego[playerid][MADEIREIRO]) return 1;
	if(JaCortando[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta cortando uma madeira.");
	if(Madeiras[playerid] >= 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui muitas madeiras, va entrega-las na frente da casa.");
	//TimeCorte
	for(new i; i<sizeof(MadeirasPosicao); i++){
	    if(ISP(playerid, 2.5, MadeirasPosicao[i][0], MadeirasPosicao[i][1], MadeirasPosicao[i][2])){
			if(JaCortando[playerid]) return 1;
			TogglePlayerControllableEx(playerid, false);
	        ApllyAnim(playerid, "BASEBALL", "BAT_4", 4.1, 1, 0, 0, 0, 0, SYNC_ALL);
			TimeCorte[playerid] = SetTimerEx("cortarmad", 9549, false, "i", playerid);
			JaCortando[playerid] = true;
			GameTextForPlayer(playerid, "~R~Cortando...", 15000, 1);
			break;
		}
	}
	return 1;
}
FalharNaMadeira(playerid){
	if(JaCortando[playerid]){
		TogglePlayerControllableEx(playerid, true);
		JaCortando[playerid] = false;
		KillTimer(TimeCorte[playerid]);
	}
}
cmd:ajudaempresa(playerid){
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{33ccff}Ajuda Empresas", "Comandos Disponiveis:\n\n{fff000}/comprarempresa\n/menuempresa", "Ok", #);
}
cmd:ajuda(playerid){
	ShowPlayerDialog(playerid, DIALOG_AJUDAGERAL, 5, "{fff000}Comandos Do Servidor", "{33aa33}Categoria\t{33aa33}Tipo\n\
	Ajuda Geral\t{ffffff}Comandos Uteis\n\
	Ajuda Organizacao\t{ffffff}Comandos De Orgs\n\
	Ajuda Organizacao 2\t{ffffff}Comandos de Orgs\n\
	Ajuda Meu Emprego\t{ffffff}Comandos De Seu Emprego\n\
	Ajuda Vip\t{ffffff}Comandos Vips\n\
	Ajuda Veiculos\t{ffffff}Comandos De Carros\n\
	Ajuda Maconha\t{ffffff}Comandos Gerais\n\
	Ajuda Casas\t{ffffff}Comandos Uteis", "Ok", "Sair");
	return 1;
}
	
cmd:pegaremprego(playerid){
	if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja tem um emprego, saia dele antes !");
	if(ISP(playerid, 3.0,  -1046.7114, -585.7683, 32.2494)){
		if(PlayerInfo[playerid][Nivel] < 9) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ter no minimo nivel 9.");
		if(CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ter carteira de carro!");
		PlayerInfo[playerid][Emprego] = TRANSP_COMBUSTIVEL;
		SendClientMessage(playerid, 0x33aa33ff, "|INFO| Voce esta trabalhando como Transportador De Combustivel agora, Use /ajuda para ver os comandos.");
	}
	if(ISP(playerid, 3.0, -357.2361,-454.2185,6.9756)){
	    PlayerInfo[playerid][Emprego] = PESCADOR;
		SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce esta trabalhando de pescador agora. Use /ajuda para ver os comandos de seu emprego.");
	}
	if(ISP(playerid, 3.0, -424.6707,-1763.9119,7.4376)){
	    PlayerInfo[playerid][Emprego] = MADEIREIRO;
	    SendClientMessage(playerid, -1,"{33aa33}|INFO| Voce esta trabalhando de madeireiro agora. Use /ajuda para ver os comandos de seu emprego.");
	}
	if(ISP(playerid, 1.6, -438.9700,-1757.5052,7.4376)){
	    if(PlayerInfo[playerid][Nivel] < 4 || CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui carteira de carro ou nao tem nivel suficiente.");
    	PlayerInfo[playerid][Emprego] = TRANSPORTADORM;
    	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta trabalhando de Transporte De Madeiras agora. Use /ajuda para ver os comandos de seu emprego.");
	}
	if(ISP(playerid, 1.6, 2421.0293,-2101.2983,13.5538)){
	    if(CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de carteira de motorista para usar este emprego.");
		if(PlayerInfo[playerid][Nivel] < 8) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de no minimo nivel 8.");
		PlayerInfo[playerid][Emprego] = TRANSP_ARMA;
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta trabalhando de Transpt. De Arma agora. Use /ajuda para ver os comandos de seu emprego.");
	}
	if(ISP(playerid, 1.4, 1709.5602,924.0325,-8.6412)){
	    if(CarteiraInfo[playerid][Carro] == 0 || PlayerInfo[playerid][Nivel] < 2) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de carteira de motorista para usar este emprego.");
	    PlayerInfo[playerid][Emprego] = CARRO_FORTE;
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta trabalhando de Carro Forte agora. Use /ajuda para ver os comandos de seu emprego.");
	}
	if(ISP(playerid, 1.4, 1832.1105,-1446.1182,13.5930)){
		if(PlayerInfo[playerid][Nivel] >= 6 || CarteiraInfo[playerid][Carro] == 1){ //return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de nivel 2 ou maior.");
			PlayerInfo[playerid][Emprego] = MECANICO;
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce agora trabalha como Mecanico. Use /ajuda para ver os comandos de seu emprego.");
		}
		else
			SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem nivel 6 ou carteira de carro.");
	
	}
	if(ISP(playerid, 1.4, -371.35501, -1436.94507, 25.65495)){
		if(PlayerInfo[playerid][Nivel] < 2) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui nivel suficiente.");
		if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
		PlayerInfo[playerid][Emprego] = LEITEIRO;
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce agora trabalha como LEITEiro, use /ajuda para ver os comandos.");
			
	}
	if(ISP(playerid, 1.9, 595.9457,-1514.7836,15.4952)){
		if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa ja possui emprego.");
		if(CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ter carteira de motorista.");
		PlayerInfo[playerid][Emprego] = TAXISTA;
		SendClientMessage(playerid, LIGHTBLUE,"|INFO| Voce agora trabalha como Taxista, use /ajuda para ver os comandos.");
	}
	if(ISP(playerid, 1.8, -1644.03650, -2231.24292, 29.53947)){
		if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja possui um emprego.");
		if(PlayerInfo[playerid][Nivel] < 2) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ter nivel 2 ou maior.");
		PlayerInfo[playerid][Emprego] = CACADOR;
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce agora trabalha como Cacador, use /ajuda para ver os Comandos.");		
	}
	if(ISP(playerid, 1.9, 1183.25842, -1316.67725, 13.55144)){
		if(PlayerInfo[playerid][Emprego] != 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja possui um emprego.");
		if(CarteiraInfo[playerid][Carro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ter carteira de motorista.");
		if(PlayerInfo[playerid][Nivel] < 3) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ter nivel 3 ou maior.");
		PlayerInfo[playerid][Emprego] = SAMU;
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce agora trabalha como Samu, use /ajuda para ver os Comandos.");
	}
	return true;
}
GetPmOn(){
	new pmf;
	foreach(new i: Player){
		if(IsPolice(PlayerInfo[i][Org]) && Equipado(i)) pmf++;
	}
	return pmf;
}
cmd:online(playerid){
	new str[255], civil, orgo, pm, pmf, todos, samus;
	foreach(new i: Player){
		new org = PlayerInfo[i][Org];
		if(IsBandido(org)) orgo++;
		if(IsPolice(org)) pm++;
		if(IsPolice(org) && Equipado(i)) pmf++;
		if(PlayerInfo[i][Emprego] == SAMU) samus++;
		if(org == 0) civil++;
		todos++;
	}
	SendClientMessage(playerid,-1, "");
	format(str, sizeof(str), "Total de %d jogadores online.", todos);
	SendClientMessage(playerid, LIGHTBLUE, str);
	format(str, sizeof str, "Bandidos: %d, Policiais: %d, Civis: %d, Policiais Fardados: %d, Samus: %d",
		orgo, pm, civil, pmf, samus);
	SendClientMessage(playerid, VerdeSamp, str);
	return 1;
}
PoliciaisOnline(total){
	new contar;
	foreach(new i: Player){
		if(IsPolice(PlayerInfo[i][Org])){
			contar++;
			if(contar >= total)
				return true;
		}
	}
	return false;
}
cmd:trazer(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] == 0) return 1;
	new str[80];
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /trazer [ id ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa digitar somente numeros.");
	new id = strval(params);
	new uva = -1;
	foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(IsPlayerConnectedP(id)){
		new Float:pos[3];
		format(str, sizeof(str), "* STAFF %s puxou o jogador %s(%d).", nome(playerid), nome(id), id);
		MensagemLocal(25.0, playerid, LIGHTBLUE, str, false);
		format(str, sizeof(str), "* STAFF %s puxou voce.", nome(playerid));
		SendClientMessage(id, LIGHTBLUE, str);
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		SetPlayerPosEx(id, pos[0], pos[1], pos[2]);
		SetPlayerInterior(id, GetPlayerInterior(playerid));
		SetPlayerVirtualWorld(id, GetPlayerVirtualWorld(playerid));
	}
	else{
		SendClientMessage(playerid, LIGHTBLUE, "* Jogador offline.");
	}
	return 1;
}

cmd:ir(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] == 0) return 1;
	new str[80];
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /ir [ id ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa digitar somente numeros.");
	new id = strval(params);
	new uva = -1;
	foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}	
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id))return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Jogador offline.");
	new Float:pos[3];
	format(str, sizeof(str), "* STAFF %s foi ao jogador %s(%d).", nome(playerid), nome(id), id);
	MensagemLocal(25.0, playerid, -1, str, false);
	format(str, sizeof(str), "* STAFF %s veio ate voce.", nome(playerid));
	SendClientMessage(id, LIGHTBLUE, str);
	SetPlayerInterior(playerid, GetPlayerInterior(id));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
	GetPlayerPos(id, pos[0], pos[1], pos[2]);
	SetPlayerPosEx(playerid, pos[0], pos[1], pos[2]);
	return 1;
}

cmd:aa(playerid){
	if(PlayerInfo[playerid][Admin] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser Admin.");
	new string[1500], st2[1500];
	format(st2, sizeof(st2), "{33ccff}Aqui estao alguns comandos Admins.\n\n");
	strcat(string, st2);
	if(PlayerInfo[playerid][Admin] >= 1){
        strcat(string, "{fff000}/tra /a /mutarvoip /ir /trazer /kick /id /tv /cameraadmin /resposta /filaatendimento /ac /finalizarat\n{ffffff}Alguns comandos para Helpers.\n\n\n");
	}
	if(PlayerInfo[playerid][Admin] >= 3){
 		strcat(string, "{fff000}/cadeia /enquete /avisars /Lmc /agencadeia /agencadeiaid \n{ffffff}Alguns comandos para Admins 3.\n\n\n");
	}
	if(PlayerInfo[playerid][Admin] >= 4){
		strcat(string, "{fff000}/clima /trazerveh /hora /rc /destruirbqs /irobjeto /venderveiculo /soltar\n{ffffff}Alguns comandos para Admins 4.\n\n\n");
	}
	if(PlayerInfo[playerid][Admin] >= 5){
		strcat(string, "{fff000}/ban /agenban /deletarlocalsentar /criarlocalsentar /demitirlider\n{ffffff}Alguns comandos para Supervisores.\n\n\n");
	}
	if(PlayerInfo[playerid][Admin] >= 7){
		strcat(string, "{fff000}/setarnivel /darlider /gmx /desbanir /daritem /resetarmochila /tirargrana\n{ffffff}Alguns comandos para Coordenadores.\n\n\n");
	}
	if(PlayerInfo[playerid][Admin] >= 9){
 		strcat(string, "{fff000}/criarobjeto /setpos /editargps \
        /configurarob /cfgint /criarcasa /configurarorg /menutipos \
		/textos\n/criarlocal /criarcofre /criargz /editarcofre /criarinterior /criarmenu /criarcaixa /cfgcaixa \n\
	   /editarcarro /crashar /anexarempresa /trocarsenha /deletarempresa /criarempresa /setarcofre /resetarcofre\n/enchercofres /menusperto /deletarmenu /daradmin /setarapk /removerapk\n{33ccff}Alguns comandos para Fundadores.\n\n\n");
	}
	if(PlayerInfo[playerid][Admin] >= 11){
	    strcat(string, "{fff000}/setarcoins /query /menuscripter /dargrana /darvip /payday\n{ffffff}Alguns comandos para Admins Master.\n\n\n");
	}
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Comandos Para Admins", string, "Ok", "");
	return 1;
}
cmd:menuscripterss(playerid, params[]){
	if(PlayerInfo[playerid][Admin] != 11) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/menuscripter [ nome da conta ]");
	SetPVarString(playerid, "Configurado", params);
	new str[79];
	format(str, sizeof str, "Voce esta configurando a Conta %s", nome(playerid));
	ShowPlayerDialog(playerid, DIALOG_MENU_SCRIPTER, DIALOG_STYLE_LIST, "{33ccff}Opcoes Menu", "Setar Dinheiro\nConsultar Conta\nDeletar Conta\nResetar Staff\nSet Coins All Admins\nSet Money All Admins\nResetar Dados", "Ok", "Sair");
	return 1;
}
cmd:menuscripter(playerid, params[]){
	if(PlayerInfo[playerid][Admin] != 11) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/menuscripter [ nome da conta ]");
	SetPVarString(playerid, "Configurado", params);
	new str[79];
	format(str, sizeof str, "Voce esta configurando a Conta %s", nome(playerid));
	ShowPlayerDialog(playerid, DIALOG_MENU_SCRIPTER, DIALOG_STYLE_LIST, "{33ccff}Opcoes Menu", "Setar Dinheiro\nConsultar Conta\nDeletar Conta\nResetar Staff\nSet Coins All Admins\nSet Money All Admins\nResetar Dados", "Ok", "Sair");
	format(str, sizeof str, "%s acaba de acessar o menu scripter.", nome(playerid));
	AdminMessage(COR_SCRIPTER, str);
	return 1;
}
verc(playerid){
	if(GetPlayerVehicleID(playerid) == VeiculoHab[playerid]) return KillTimer(TimerTeste[playerid]);
	return 1;
}
cmd:cfgcaixa(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new id = strval(params);
	SetPVarInt(playerid, "caixaid", id);
	ShowPlayerDialog(playerid, DIALOG_CFGRCAIXA, DIALOG_STYLE_LIST, "{fff000}Configurar Caixa", "{33ccff}Editar Posicao\n{33ccff}Deletar\n{33ccff}Recarregar Todos", "Ok", "Sair");
	return 1;
}
cmd:criarcaixa(playerid){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	CriarCaixa(playerid);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este caixa foi criado com sucesso.");
	return 1;
}
cmd:criarlocal(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new ln[32], tipo;
	if(sscanf(params, "is[32]", tipo, ln)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /criarlocal [ tipo ] [ nome ] * tipo 1 = Public, tipo 2 Hq Organizacao, Tipo 3 = Emprego, Tipo 4 = tudo que nao seje anterior, 5 = empresas");
	if(tipo <= 0 || tipo >= 6) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce so pode usar os locais entre 1-4.");
	new Float:p[3];
	GetPlayerPos(playerid, p[0], p[1], p[2]);
	CriarLocal(ln, p[0], p[1], p[2], tipo);
	return 1;
}
cmd:gps(playerid){
	ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "{fff000}Locais DO GPS", "{33ccff}Locais Publicos\n{33ccff}Bases De Organizacoes\n{33ccff}Locais De Empregos\n{33ccff}Outros\n{33ccff}Empresas", "Ok", "Sair");
	return 1;
}
function Sleep(seconds)
{
    new
        sec_a = gettime(),
        sec_b = (sec_a + seconds)
    ;

    sleep_loop:
    if(sec_a < sec_b)
    {
        sec_a = gettime();
        goto sleep_loop;
    }
}
function retirartaser(playerid, const nick[]){
	if(!strcmp( nome(playerid), nick)){
		NoTaser[playerid] = false;
		PC_EmulateCommand(playerid, "/anim");
		SendClientMessage(playerid, LIGHTBLUE, "* O Efeito do taser passou em seu corpo.");
		ApplyAnimationEx(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0, SYNC_ALL);
		TogglePlayerControllableEx(playerid, true);
	}
	else{
		NoTaser[playerid] = false;
		PC_EmulateCommand(playerid, "/anim");
	}
	return 1;
}
cmd:ativartaser(playerid){
	if(!IsPolice( PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e policial.");
	if(!Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar fardado!");
	if(TaserAtivado[playerid]){
		TaserAtivado[playerid] = false;
		SendClientMessage(playerid, LIGHTBLUE, "* Voce desativou o taser.");
	}
	else{
		SendClientMessage(playerid, LIGHTBLUE, "* Voce ativou o taser. Para desativar use o mesmo comando.");
		TaserAtivado[playerid] = true;

	}
	return 1;
}
/*public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart){
	if(damagedid != INVALID_PLAYER_ID){
		static Text3D:DynamicText, timee;
		new Float: x, Float: y, Float:z;
		FreeFireDano(playerid, GET_POSITION, x, y, z);
		FreeFireDano(playerid, GET_POSITION, x, y, z);
		if(IsValidTimer(timee)){
			deletartext(playerid, DynamicText);
		}
		if(bodypart != 9)
			DynamicText = CreateDynamic3DTextLabel(fString("%0.2f", amount), Amarelo, x,y,z, 30.0, damagedid, INVALID_VEHICLE_ID, 0, -1, -1, playerid);
		else{
			amount = amount + 5;
			DynamicText = CreateDynamic3DTextLabel(fString("%0.2f", amount+0.5), LIGHTRED, x,y,z, 30.0, damagedid, INVALID_VEHICLE_ID, 0, -1, -1, playerid);
		}
		timee = SetTimerEx("deletartext", 1200, false, "ii", playerid, DynamicText);
	}
	return 1;
}*/
function deletartext(playerid, Text3D:text){
	if(IsValidDynamic3DTextLabel(text)){
		DestroyDynamic3DTextLabel(text);
	}
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart){
	if(playerid != INVALID_PLAYER_ID && IsPlayerSpawned(playerid)){
		new weapon = weaponid;
		if(TrabalhoStaff[playerid]) return 1;

		new Float:hp;
		GetPlayerHealth(playerid, hp);
		if(amount > hp) CheckDeath2(playerid);
		CheckDeath2(playerid);
		if(IsPlayerConnectedP(issuerid)){
			if(TaserAtivado[issuerid] && bodypart != 9 && !PlayerInfo[playerid][Ferido] && weapon == 22 && PlayerInfo[playerid][Org] != PlayerInfo[issuerid][Org]){
				if(NoTaser[playerid]) return 1;

				NoTaser[playerid] = true;
				ClearAnimations(playerid);
				new str[90];
				format(str, sizeof str, "* %s levou um tiro de taser de %s.", nome(playerid), nome(issuerid));
				MensagemLocal(50.0,playerid, Roxoeu, str, false);
				SetTimerEx("retirartaser", 20000, false, "is", playerid, nome(playerid));
				ApplyAnimationEx(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0, SYNC_ALL);
			}
		}
		if(IsPlayerPreso(issuerid)){
			SendClientMessage(issuerid, LIGHTBLUE, "* Voce nao pode fazer isso preso.");
			GetPlayerHealth(playerid, hp);
			SetPlayerHealth(playerid, hp+amount);
		}
		if(weapon == 34){
			if(!IsPlayerInDynamicArea(playerid, ZonaDeCacaDinamica)) return 1;
	    	new str[144];
	    	format(str, sizeof str, "(%d)%s atirou de sniper em %s.",PlayerInfo[issuerid][IDFixo], nome(issuerid), nome(playerid));
	    	AdminMessage(Rosa, str);
	    	new Float: h;
	    	GetPlayerHealth(playerid, h);
	    	SetPlayerHealth(playerid, h+amount);
	    	PC_EmulateCommand(issuerid, "trabalhar");
	    	SendClientMessage(issuerid, LIGHTBLUE, "* Voce nao pode cometer DM nesta area.");
	    }
		if(IsPlayerSpawned(playerid)){
			if(CurandoAlguem[playerid] != -1){
				new str[144], id = CurandoAlguem[playerid];
				format(str, sizeof str, "* %s foi ferido e nao conseguiu reanimar %s.", nome(playerid), nome(id));
				MensagemLocal(25.0, playerid, Roxoeu, str, false);
				SendoCurado[id] = false;
				PC_EmulateCommand(playerid, "/anim");
				CurandoAlguem[playerid] = -1;
			}
		}
	}
	return 1;
}
forward removeratroplamento(playerid);
public removeratroplamento(playerid){
	Atropelado[playerid] = false;
	PC_EmulateCommand(playerid, "/anim");
}
static IsPlayerAfk(playerid)
	return (GetTickCount() > (TickUp[playerid]+2000));


public OnPlayerUpdate(playerid){
	if(playerid != INVALID_PLAYER_ID && IsPlayerSpawned(playerid)){
		MostrarTextdrawHud(playerid);
		CheckArmaPeito(playerid);
		CheckChangeWeapon(playerid);
 	}
	TickUp[playerid] = GetTickCount();
	
	return 1;
}

stock PlayerSpeed(playerid)
{
	new Float: fVelocity[3];
	GetPlayerVelocity(playerid, fVelocity[0], fVelocity[1], fVelocity[2]);
	return floatround(floatsqroot((fVelocity[0] * fVelocity[0]) + (fVelocity[1] * fVelocity[1]) + (fVelocity[2] * fVelocity[2]))) * 100;
}
function PTDEPINFOPlnt(playerid, portao, org){
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, CoordPTDep[portao][0], CoordPTDep[portao][1], CoordPTDep[portao][2])){
		PTDEPInfo[portao][Explodindo] = false;
		SendClientMessageToAll(LIGHTBLUE, "A Explosao do portao %d falhou! O(a) %s nao conseguiram dinamitar.", portao+1, OrgGm[org][OrgNome]);
	}
	else{
		SendClientMessageToAll(LIGHTBLUE, "Bomba Plantada! O(a) %s estao dinamitando o portao %d do deposito.", OrgGm[org][OrgNome], portao+1);
		ClearAnimations(playerid);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		SetTimerEx("explodirportaoDEP", 60000, false, "ii", portao, org);
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Portao se explodira em 60s. Saia de perto!");
	}
	return 1;
}
function explodirportaoDEP(portao, org){
	CreateExplosion(CoordPTDep[portao][0], CoordPTDep[portao][1], CoordPTDep[portao][2], 10, 5.0);
	SendClientMessageToAll(LIGHTBLUE, "Portao %d do deposito foi explodido pelo %s", portao+1, OrgGm[org][OrgNome]);
	SendClientMessageToAll(LIGHTBLUE, "%s dinamitou com sucesso o portao %d do deposito.",OrgGm[org][OrgNome], portao+1);
	UpdateDynamic3DTextLabelText(PTDEPInfo[portao][TextoPT], LIGHTBLUE, "PORTAO EXPLODIDO");
	PTDEPInfo[portao][PortaoExplodido] = true;
	SetTimerEx("voltarportaoDEP", minutos(15), false, "ii", portao, org);
	if(portao == 0)
		MoveDynamicObject(PTDEPInfo[portao][OPTDep], 2387.74097, -2190.94360, 24.34164, 35.0,  64.26000, 2.58000, -31.20001);
	else
		MoveDynamicObject(PTDEPInfo[portao][OPTDep], 2590.15601, -2400.52271, 12.65140, 70.0,  89.64000, 40.56000, 58.32000);

	return 1;
}
function voltarportaoDEP(portao, org){
	SetDynamicObjectPos(PTDEPInfo[portao][OPTDep], CoordPTDep[portao][0], CoordPTDep[portao][1], CoordPTDep[portao][2]);
	SetDynamicObjectRot(PTDEPInfo[portao][OPTDep], CoordPTDep[portao][3], CoordPTDep[portao][4], CoordPTDep[portao][5]);
	SendClientMessageToAll(LIGHTBLUE, "O Portao %d, explodido pelo(a) %s, foi consertado.", portao+1, OrgGm[org][OrgNome]);
	PTDEPInfo[portao][PortaoExplodido] = false;
	PTDEPInfo[portao][Explodindo] = false;
	UpdateDynamic3DTextLabelText(PTDEPInfo[portao][TextoPT], LIGHTBLUE, "Portao do Deposito\nAperte 'Y' para explodir");
	return 1;
}
public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
	if(!IsPlayerSpawned(playerid)) return 1;

	if((newkeys == KEY_YES)){
		for(new i; i < sizeof coordspegaremp; i++){
			if(IsPlayerInRangeOfPoint(playerid, 1.4, coordspegaremp[i][0], coordspegaremp[i][1], coordspegaremp[i][1]))
				PC_EmulateCommand(playerid, "/pegaremprego");
		}

	}
	if((newkeys == KEY_YES)){
		if(PlayerInfo[playerid][Emprego] == CARRO_FORTE && TrabalhandoEmprego[playerid][CARRO_FORTE]){
			new Float: X, Float: Y, Float: Z;
			foreach(new i: Vehicles){
				if(GetVehicleModel(i) == 428){ // id do carro forte
					GetVehiclePos(i, X, Y, Z);
					//GetXYZOfVehiclePart(vehicleid, part, &Float:x, &Float:y, &Float:z, Float:offset = 0.5)
					if(!IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z)) continue;
					GetXYZOfVehiclePart(i, VEHICLE_PART_TRAZ, X, Y, Z);
					if(IsPlayerInRangeOfPoint(playerid, 2.0, X, Y, Z)){
						if(CarregandoCF[playerid] == 1){
							CarroForte[i] += 10000;
							CarregandoCF[playerid] = 0;
							ApplyAnimationEx(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
							MensagemLocal(25.0, playerid, Roxoeu, fString("* %s colocou dinheiro em um carro forte. Total: %d/40000",nome(playerid), CarroForte[i]));
							SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
							ChecarAnexagem(playerid);
							break;
						}
						if(CarregandoCF[playerid] == 0 ){
							CarroForte[i] -= 10000;
							CarregandoCF[playerid] = 1;
							MensagemLocal(25.0, playerid, Roxoeu, fString("* %s retirou dinheiro de um carro forte. Total: %d/40000",nome(playerid), CarroForte[i]));
							SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
							SetPlayerAttachedObject(playerid,6,1550,1,0.197000,0.318000,0.000000,0.000000,84.100036,0.000000,1.000000,1.000000,1.000000);						
							break;
						}
						

					}					
				}
			}

		}
	}

	if((newkeys == KEY_YES)){

		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1153.9907,-1772.6782,16.5992)){
			SetPlayerPos(playerid, 3585.5808,548.1251,1519.5316);
			Streamer_Update(playerid);//, type = -1)
		}
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 3585.5808,548.1251,1519.5316)){
			SetPlayerPos(playerid, 1153.9910,-1772.3671,16.5992);
			SetPlayerFacingAngle(playerid, 1.4303);
			SetCameraBehindPlayer(playerid);
		}


	}
	if((newkeys == KEY_YES)){
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1077.3367,-1780.9073,13.6607)){
			new str[255],str2[255], ct;
			strcat(str, "{33CCFF}Slot id\t {33CCFF}Veiculo\t {33CCFF}Distancia\n");
			for(new i; i<MAXCONCE; i++)
			{
			    if(VehInfo[playerid][i][IDCarro] != 0){
				    ct++;
					format(str2, sizeof(str2), "(%d)\t (%d)%s\t%s\n",i, VehInfo[playerid][i][Carro], GetVehicleName(VehInfo[playerid][i][IDCarro]),DistanciaVeh(playerid, VehInfo[playerid][i][Carro]));
					strcat(str, str2);
				}
			}
			if(ct == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem nenhum veiculo.");
			ShowPlayerDialog(playerid, DIALOG_PXVEHICLE, 5, "{fff000}Menu Do Veiculo", str, "Ok", "Sair");			
		}
	}
	if((newkeys == KEY_YES)){
		for(new i; i<sizeof PosPickMunDep; i++){
			if(IsPlayerInRangeOfPoint(playerid, 2.0, PosPickMunDep[i][0], PosPickMunDep[i][1], PosPickMunDep[i][2])){
				if(InfoPickAmmo[i][PickMunicao] == 0){
					if(!IsValidTimer(timerRCx))
						timerRCx = SetTimer("recomporCaixas", minutos(15), true);
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este local nao possui mais caixas de municao.");
					break;
				}
				else{
					if(NaMao[playerid] == CAIXA) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com uma caixa de municao nas m?os. Coloque na Van!");
					ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
					SetTimerEx("pegandomunicaoDEP", 5000, false, "ii", playerid, i);
					GameTextForPlayer(playerid, "~b~PEGANDO MUNICAO...", 5000, 3);
					SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+3);
					break;
				}
			}
		}
	}
	if((newkeys == KEY_YES)){
		for(new i; i < sizeof CoordPTDep; i++){
			if(IsPlayerInRangeOfPoint(playerid, 5.0, CoordPTDep[i][0], CoordPTDep[i][1], CoordPTDep[i][2])){
				if(PTDEPInfo[i][PortaoExplodido]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Portao ja foi explodido.");
				if(PlayerInfo[playerid][Org] == 0 || IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode fazer isso.");
				if(PTDEPInfo[i][Explodindo]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Ja foi plantada uma bomba neste portao. Saia de perto!");
				if(NaMao[playerid] != DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar com a dinamite na mao.");
				if(ContarCaixas() < 50) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Nao restaram muitas caixas desde o ultimo roubo. Aguarde para roubar.");
				//if(!PoliciaisOnline(8)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Precisa de mais policiais online para fazer esta acao.");
				//if(!MembrosPerto(playerid, 8)) SendClientMessage SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa de mais um membro para roubar o caixa.");
				PTDEPInfo[i][Explodindo] = true;
				GameTextForPlayer(playerid, "~b~PLANTANDO BOMBA...", 2000, 3);
				ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
				SetTimerEx("PTDEPINFOPlnt", 30000, false, "ddd", playerid, i, PlayerInfo[playerid][Org]);
				NaMao[playerid] = 0;
				SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+5);
				break;
			}
		}
	}
	if((newkeys == KEY_YES)){
		for(new i; i < MAX_LOCALS_S; i++){
			if(LocalInfo[i][LocalCriadoS] && IsPlayerInRangeOfPoint(playerid, 2.3,LocalInfo[i][LocalxX], LocalInfo[i][LocalyY], LocalInfo[i][LocalzZ])){
				if(IsPlayerInAnyVehicle(playerid)) return 1;
				PC_EmulateCommand(playerid, "/sentar");
				break;
			}
		}
	}
	/*if((newkeys == KEY_YES)){
	    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 476){ // hustler huntley rustler sla o nome do aviao
	        new Bombad[MAX_VEHICLES], Float: X, Float: Y, Float: Z, vehct = GetPlayerVehicleID(playerid);
	        if((gettime() - UsoBomba[playerid]) < 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Aguarde 10 segundos para lancar outra bomba.");
			if(MunBomb[vehct] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta sem bombas! Volte e reabasteca o Aviao.");
			MunBomb[vehct] -= 1;
			new str[45];
			format(str, sizeof(str), "|INFO| Bomba lancada! Total %d/6.", MunBomb[vehct]);
			SendClientMessage(playerid, LIGHTBLUE, str);
	    	UsoBomba[playerid] = gettime();
			vehct = GetPlayerVehicleID(playerid);
	        GetVehiclePos(vehct, X,Y,Z);
	        Bombad[vehct] = CreateDynamicObject(345, X,Y,Z-3,  -90.00000, 44.00000, 0.00000, 0,0,-1, 400.0, 400.0);
			CA_FindZ_For2DCoord ( X, Y, Z );
			MoveDynamicObject(Bombad[vehct], X,Y,Z, 39);
		}
	}*/
	if(PRESSED(KEY_YES)){
		PC_EmulateCommand(playerid, "/menu");
	}
	if(PlayerSpeed(playerid) > 0.0) CheckDeath(playerid);
	if((newkeys == KEY_CROUCH)){
		foreach(new i: B_Portao){
		    if(IsPlayerInRangeOfPoint(playerid, 6.2, InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz]) && InfoPortao[i][PortaoCriado]){
		        if(isnull(InfoPortao[i][SenhaPortao])){
		            MoveDynamicObject(InfoPortao[i][OPortao], InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz]-8000, 7.0);
		            GameTextForPlayer(playerid, "~R~PORTAO SEM SENHA", 4000, i);
					SetTimerEx("fecharop", 7000, false, "i", i);
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce tambem pode usar /abrirp.");
		            break;
				}
				else{
				    ShowPlayerDialog(playerid, DIALOG_ABRIRPORTAO, DIALOG_STYLE_INPUT, "{fff000}Abrindo O Portao", "{33ccff}Digite a senha deste portao para voce abrir.", "Ok", "Sair");
					SetPVarInt(playerid, "qualopID", i);
					break;
				}
			}
		}
	}
	if((newkeys == KEY_SECONDARY_ATTACK)){
	    if(ISP(playerid, 1.9, -1746.7351,13.5703,357.6936)){
	        if(BikePlayer[playerid] == -1){
				BikePlayer[playerid] = CriarVeiculo("moto de spawn",462, -1746.7351,13.5703,357.6936, 268.2740, 3, 3, -1);
				PutPlayerInVehicle(playerid, BikePlayer[playerid], 0);
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sucesso! voce pegou uma Faggio no Spawn.");
				SetTimerEx("bikespawn", 2000, false, "i", BikePlayer[playerid]);
				return 1;
			}
			else{
			    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Saia do veiculo!");
				CheckBike(playerid);
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce destruiu a sua Faggio.");
			}
		}
	}
	if((newkeys == KEY_SECONDARY_ATTACK)){
	    if(ISP(playerid, 2.5, -439.8221,-1752.9894,6.7783) && PlayerInfo[playerid][Emprego] == TRANSPORTADORM && TrabalhandoEmprego[playerid][TRANSPORTADORM]){
		    if(SpawnouEmprego[playerid] == -1){
		        SpawnouEmprego[playerid] = CriarVeiculo("veh de emprego", 478, -439.8221,-1752.9894,6.7783, 315.7976, 3, 3, -1);
		        PutPlayerInVehicle(playerid, SpawnouEmprego[playerid], 0);
		        MadeirasCarro[SpawnouEmprego[playerid]] = 0;
		        SendClientMessage(playerid, Amarelo, "|INFO| Caso deseje destrui-lo va no spawnador novamente.");
		        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Va ate a marca para carregar o veiculo.");
		        SetPlayerCheckpoint(playerid, -423.2203,-1767.7653,5.0589, 3.0);
		        VeiculoEmprego[SpawnouEmprego[playerid]] = true;
		        EmpregoCar[SpawnouEmprego[playerid]] = TRANSPORTADORM;
		        return 1;
			}
			else{
			    EmpregoCar[SpawnouEmprego[playerid]] = -1;
			    MadeirasCarro[SpawnouEmprego[playerid]] = 0;
			    VeiculoEmprego[SpawnouEmprego[playerid]] = false;
			    DestroyVehicleEx(SpawnouEmprego[playerid], "Destruido Do Emprego");
			    SpawnouEmprego[playerid] = -1;
			    SendClientMessage(playerid, Amarelo, "|INFO| Veiculo destruido com sucesso.");
			    return 1;
			}
		}
	    if(ISP(playerid, 2.5, -340.5342,-459.1330,2.2028) && PlayerInfo[playerid][Emprego] == PESCADOR && TrabalhandoEmprego[playerid][PESCADOR]){
			if(SpawnouEmprego[playerid] == -1){
			    SpawnouEmprego[playerid] = CriarVeiculo("veh de emprego", 453, -329.9251, -469.5641, -0.0613, -135.1199, -1, -1, -1);
				PutPlayerInVehicle(playerid, SpawnouEmprego[playerid], 0);
				SendClientMessage(playerid, Amarelo, "|INFO| Caso deseje destrui-lo va no spawnador novamente.");
				VeiculoEmprego[SpawnouEmprego[playerid]] = true;
				EmpregoCar[SpawnouEmprego[playerid]] = PESCADOR;
			}
			else{
			    EmpregoCar[SpawnouEmprego[playerid]] = -1;
				VeiculoEmprego[SpawnouEmprego[playerid]] = false;
                DestroyVehicleEx(SpawnouEmprego[playerid], "Destruido Do Emprego");
			    SpawnouEmprego[playerid] = -1;
			    SendClientMessage(playerid, Amarelo, "|INFO| Veiculo destruido com sucesso.");
			}
		}
		if(ISP(playerid, 2.5, 2403.4880,-2101.4609,13.5469) && PlayerInfo[playerid][Emprego] == TRANSP_ARMA && TrabalhandoEmprego[playerid][TRANSP_ARMA]){
			if(SpawnouEmprego[playerid] == -1){
			    SpawnouEmprego[playerid] = CriarVeiculo("veh de emprego",455, 2395.7036, -2112.5125, 13.9426, 270.0000, 6, 6, -1);
			    PutPlayerInVehicle(playerid, SpawnouEmprego[playerid], 0);
			    SendClientMessage(playerid, Amarelo, "|INFO| Caso deseje destruilo va no spawnador novamente.");
			    VeiculoEmprego[SpawnouEmprego[playerid]] = true;
			    EmpregoCar[SpawnouEmprego[playerid]] = TRANSP_ARMA;
			    CaminhaoCarregado[SpawnouEmprego[playerid]] = 0;
			}
			else{
			    EmpregoCar[SpawnouEmprego[playerid]] = -1; //aqq
			    VeiculoEmprego[SpawnouEmprego[playerid]] = false; 
			    DestroyVehicleEx(SpawnouEmprego[playerid], "Destruido Do Emprego");
				SpawnouEmprego[playerid] = -1;
				SendClientMessage(playerid, Amarelo, "|INFO| Veiculo destruido com sucesso.");
			}
		}
		if(ISP(playerid, 2.5, 1701.5437,917.7558,10.8203) && PlayerInfo[playerid][Emprego] == CARRO_FORTE && TrabalhandoEmprego[playerid][CARRO_FORTE]){
		    if(SpawnouEmprego[playerid] == -1){
		        SpawnouEmprego[playerid] = CriarVeiculo("veh de emprego",428, 1696.9380, 918.4292, 10.8242, 0.0000, -1, -1, -1);
				PutPlayerInVehicle(playerid, SpawnouEmprego[playerid], 0);
				SendClientMessage(playerid, Amarelo, "|INFO| Caso deseje destruilo va no spawnador novamente.");
				VeiculoEmprego[SpawnouEmprego[playerid]] = true;
				EmpregoCar[SpawnouEmprego[playerid]] = CARRO_FORTE;
				CarroForte[SpawnouEmprego[playerid]] = 0;
				SendClientMessage(playerid, Amarelo, "|INFO| Va ate a marca e carregue o Carro Forte.");
				SetPlayerCheckpoint(playerid, 1650.7220,923.1868,10.6719, 3.0);
			}
			else{
			    EmpregoCar[SpawnouEmprego[playerid]] = -1;
			    VeiculoEmprego[SpawnouEmprego[playerid]] = false;
			    DestroyVehicleEx(SpawnouEmprego[playerid], "Destruido Do Emprego");
			    SpawnouEmprego[playerid] = -1;
			    SendClientMessage(playerid, Amarelo, "|INFO| Veiculo destruido com sucesso.");
			}
		}
		if(ISP(playerid, 2.5, 1836.1971,-1410.5281,13.6016) && PlayerInfo[playerid][Emprego] == MECANICO && TrabalhandoEmprego[playerid][MECANICO]){
			if(SpawnouEmprego[playerid] == -1){
				SpawnouEmprego[playerid] = CriarVeiculo("veh de emprego",525, 1836.1971,-1410.5281,13.6016, 273.0469, 6, 3, -1);
				PutPlayerInVehicle(playerid, SpawnouEmprego[playerid], 0);
				SendClientMessage(playerid, Amarelo, "|INFO| Caso deseje destrui-lo va no spawnador novamente.");
				VeiculoEmprego[SpawnouEmprego[playerid]] = true;
				EmpregoCar[SpawnouEmprego[playerid]] = MECANICO;
			}
			else{
				EmpregoCar[SpawnouEmprego[playerid]] = -1;
				VeiculoEmprego[SpawnouEmprego[playerid]] = false;
				DestroyVehicleEx(SpawnouEmprego[playerid], "Destruido Do Emprego");
				SpawnouEmprego[playerid] = -1;
				SendClientMessage(playerid, Amarelo, "|INFO| Veiculo destruido com sucesso.");
			}
		}
		if(ISP(playerid, 2.4, 597.5421,-1507.7991,15.4015) && PlayerInfo[playerid][Emprego] == TAXISTA && TrabalhandoEmprego[playerid][TAXISTA]){
			if(SpawnouEmprego[playerid] == -1){
				SpawnouEmprego[playerid] = CriarVeiculo("veh de emprego",438, 597.5421,-1507.7991,15.4015, 268.0000, 2, 6, -1);
				PutPlayerInVehicle(playerid, SpawnouEmprego[playerid], 0);
				TimerTaximetro[SpawnouEmprego[playerid]] = -1;
				SendClientMessage(playerid, Amarelo, "|INFO| Caso deseje destrui-lo va no spawnador novamente.");
				VeiculoEmprego[SpawnouEmprego[playerid]] = true;
				EmpregoCar[SpawnouEmprego[playerid]] = TAXISTA;
				return 1;
			}
			else{
				ResetMileage(SpawnouEmprego[playerid]);
				KillTimer(TimerTaximetro[SpawnouEmprego[playerid]]);
				VeiculoInfo[SpawnouEmprego[playerid]][MileageTaxi] = 0;
				TimerTaximetro[SpawnouEmprego[playerid]] = -1;
				EmpregoCar[SpawnouEmprego[playerid]] = -1;
				VeiculoEmprego[SpawnouEmprego[playerid]] = false;
				DestroyVehicleEx(SpawnouEmprego[playerid], "Destruido Do Emprego");
				SpawnouEmprego[playerid] = -1;
				SendClientMessage(playerid, Amarelo, "|INFO| Veiculo destruido com sucesso.");
				return 1;
			}
		}
		if(ISP(playerid, 2.4, 1182.45911, -1334.29919, 13.55144) && PlayerInfo[playerid][Emprego] == SAMU && TrabalhandoEmprego[playerid][SAMU]){
			if(SpawnouEmprego[playerid] == -1){
				SpawnouEmprego[playerid] = CriarVeiculo("veh de emprego",416, 1182.3850, -1338.8402, 13.8593, 270.0000, 1, 2, -1);
				PutPlayerInVehicle(playerid, SpawnouEmprego[playerid], 0);
				TimerTaximetro[SpawnouEmprego[playerid]] = -1;
				SendClientMessage(playerid, Amarelo, "|INFO| Caso deseje destrui-lo va no spawnador novamente.");
				VeiculoEmprego[SpawnouEmprego[playerid]] = true;
				EmpregoCar[SpawnouEmprego[playerid]] = SAMU;
				return 1;
			}
			else{
				KillTimer(TimerTaximetro[SpawnouEmprego[playerid]]);
				VeiculoInfo[SpawnouEmprego[playerid]][MileageTaxi] = 0;
				EmpregoCar[SpawnouEmprego[playerid]] = -1;
				VeiculoEmprego[SpawnouEmprego[playerid]] = false;
				DestroyVehicleEx(SpawnouEmprego[playerid], "Destruido Do Emprego");
				SpawnouEmprego[playerid] = -1;
				SendClientMessage(playerid, Amarelo, "|INFO| Veiculo destruido com sucesso.");
				return 1;
			}
		}
		if(ISP(playerid, 2.4, -997.0001, -600.4232, 32.0432) && PlayerInfo[playerid][Emprego] == TRANSP_COMBUSTIVEL && TrabalhandoEmprego[playerid][TRANSP_COMBUSTIVEL]){
			if(SpawnouEmprego[playerid] == -1){ //parte combustivel
				SpawnouEmprego[playerid] = CriarVeiculo("veh de emprego",578, -984.9359, -622.9838, 32.4562, 90.0000, 1, 2, -1);
				PutPlayerInVehicle(playerid, SpawnouEmprego[playerid], 0);
				TimerTaximetro[SpawnouEmprego[playerid]] = -1;
				SendClientMessage(playerid, Amarelo, "|INFO| Caso deseje destrui-lo va no spawnador novamente.");
				VeiculoEmprego[SpawnouEmprego[playerid]] = true;
				CarregandoCombustivel[ SpawnouEmprego[playerid] ] = false;
				SetPlayerCheckpoint(playerid, -993.6506, -698.6577, 32.0566, 3.0);
				SendClientMessage(playerid, LIGHTBLUE, "* Va ate a marca e de o Comando para abastecer o Caminhao.");
				EmpregoCar[SpawnouEmprego[playerid]] = TRANSP_COMBUSTIVEL;
				SetVehicleAttachedObject(SpawnouEmprego[playerid],1,3631,0.000000,-1.650000,0.300000,0.000000,0.000000,89.099983);
				return 1;
			}
			else{
				VeiculoInfo[SpawnouEmprego[playerid]][MileageTaxi] = 0;
				EmpregoCar[SpawnouEmprego[playerid]] = -1;
				VeiculoEmprego[SpawnouEmprego[playerid]] = false;
				DestroyVehicleEx(SpawnouEmprego[playerid], "Destruido Do Emprego");
				SpawnouEmprego[playerid] = -1;
				SendClientMessage(playerid, Amarelo, "|INFO| Veiculo destruido com sucesso.");
				return 1;
			}
		}				
	}
	if((newkeys == KEY_SECONDARY_ATTACK)){
		for(new i; i<MAX_DROPS; i++){
  			if(InfoDrop[i][Dropado] && IsPlayerInRangeOfPoint(playerid, 1.9, InfoDrop[i][DropX], InfoDrop[i][DropY], InfoDrop[i][DropZ])){
				if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui uma mochila.");
				SetPVarInt(playerid, "itemidd", i);
                new xC = GetPVarInt(playerid, "itemidd");
				new str[144];
  			    format(str, sizeof(str), "{ff0000}[AVISO]\n\n{33ccff}Tem certeza de que deseja pegar do chao o item %s(%dx) ?", InventarioName(InfoDrop[xC][TipoItem]), InfoDrop[xC][QuantiaItem]);
  			    ShowPlayerDialog(playerid, DIALOG_CONFIRMAR_ITEM, DIALOG_STYLE_MSGBOX, "{fff000}Nota De Aviso", str, "Sim", "Nao");
				ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
				break;
			}
		}
	}
	if(newkeys & KEY_YES){
		foreach(new i: GaragensIterator){
    	    if(ISP(playerid, 1.3, GaragemInfo[i][GaragemX], GaragemInfo[i][GaragemY], GaragemInfo[i][GaragemZ]))
    	    {	
        	    if(!IsPlayerInAnyVehicle(playerid)){
	        	    SetPlayerVirtualWorld(playerid, i);
		           	SetPlayerInterior(playerid, 7);
	    	       	SetPlayerPosEx(playerid, 943.6443,2129.4978,1004.6800);
					DentroDeGaragem[playerid] = i;
					SendClientMessage(playerid, LIGHTBLUE, "* Use 'Y' sair para sair da Garagem.");
					break;
				}
				else{
	        	    SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), i);
		           	LinkVehicleToInterior(GetPlayerVehicleID(playerid), 7);
	    	       	SetVehiclePos(GetPlayerVehicleID(playerid), 943.6443,2129.4978,1004.6800);
	        	    SetPlayerVirtualWorld(playerid, i);
		           	SetPlayerInterior(playerid, 7);
					DentroDeGaragem[playerid] = i;
					SendClientMessage(playerid, LIGHTBLUE, "* Use 'Y' sair para sair da Garagem.");
					break;					
				}
			}
		}
		if(ISP(playerid, 9.0, 943.6443,2129.4978,1004.6800) && DentroDeGaragem[playerid] != -1){
			if(!IsPlayerInAnyVehicle(playerid)){
				SetPlayerPos(playerid, GaragemInfo[DentroDeGaragem[playerid]][GaragemX], GaragemInfo[DentroDeGaragem[playerid]][GaragemY], GaragemInfo[DentroDeGaragem[playerid]][GaragemZ]);
			    SetPlayerPosEx(playerid, GaragemInfo[DentroDeGaragem[playerid]][GaragemX], GaragemInfo[DentroDeGaragem[playerid]][GaragemY], GaragemInfo[DentroDeGaragem[playerid]][GaragemZ]);
			    SetPlayerVirtualWorld(playerid, 0);
		    	SetPlayerInterior(playerid, 0);
		    	TogglePlayerControllableEx(playerid, false);
		    	SetTimerEx("descongelar", 3000, false, "i", playerid);
		    	DentroDeGaragem[playerid] = -1;
		    }
		    else{
		    	if(GetPlayerState(playerid) == PLAYER_STATE:2){
		    		SetVehiclePos(GetPlayerVehicleID(playerid), GaragemInfo[DentroDeGaragem[playerid]][GaragemX], GaragemInfo[DentroDeGaragem[playerid]][GaragemY], GaragemInfo[DentroDeGaragem[playerid]][GaragemZ]);
		    		SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), 0);
		    		SetPlayerVirtualWorld(playerid, 0);
		    		LinkVehicleToInterior(GetPlayerVehicleID(playerid), 0);
		    		SetPlayerInterior(playerid, 0);
			    	TogglePlayerControllableEx(playerid, false);
			    	SetTimerEx("descongelar", 3000, false, "i", playerid);
			    	DentroDeGaragem[playerid] = -1;		    		
		    	}
		    }
		    return 1;
		}
	}
	if(newkeys & KEY_YES){
		foreach(new i: B_House){
    	    if(ISP(playerid, 1.3, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]))
    	    {	
        	    SetPlayerVirtualWorld(playerid, i);
	           	SetPlayerInterior(playerid, InfoCasa[i][Interior]);
	           	SetPlayerPosEx(playerid, InfoCasa[i][SaidaX], InfoCasa[i][SaidaY], InfoCasa[i][SaidaZ]);
				DentroDeCasa[playerid] = i;
				SendClientMessage(playerid, LIGHTBLUE, "* Use 'Y' sair para sair da residencia.");
				break;
			}
		}
		if(InfoCasa[GetPlayerVirtualWorld(playerid)][CasaCriada] && ISP(playerid, 9.0, InfoCasa[GetPlayerVirtualWorld(playerid)][SaidaX], InfoCasa[GetPlayerVirtualWorld(playerid)][SaidaY], InfoCasa[GetPlayerVirtualWorld(playerid)][SaidaZ]) && DentroDeCasa[playerid] != -1){
			SetPlayerPos(playerid, InfoCasa[GetPlayerVirtualWorld(playerid)][CasaX], InfoCasa[GetPlayerVirtualWorld(playerid)][CasaY], InfoCasa[GetPlayerVirtualWorld(playerid)][CasaZ]);
		    SetPlayerPosEx(playerid, InfoCasa[GetPlayerVirtualWorld(playerid)][CasaX], InfoCasa[GetPlayerVirtualWorld(playerid)][CasaY], InfoCasa[GetPlayerVirtualWorld(playerid)][CasaZ]);
		    SetPlayerVirtualWorld(playerid, 0);
		    SetPlayerInterior(playerid, 0);
		    TogglePlayerControllableEx(playerid, false);
		    SetTimerEx("descongelar", 3000, false, "i", playerid);
		    return 1;
		}
	}
	if((newkeys == KEY_YES)){
		foreach(new i: B_Caixas){
			if(ISP(playerid, 1.9, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ]) && InfoCaixa[i][CaixaCriado]){
				if(InfoCaixa[i][CaixaQuebrado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este caixa foi explodido por bandidos.");
				MostrarDialogCaixa(playerid);
				SetPVarInt(playerid, "caixauso", i);
				break;
			}
		}
	}
	if((newkeys == KEY_YES)){
        new id = PlayerInfo[playerid][Org];
        if(!ISP(playerid, 1.5, OrgInfo[id][OrgPickPos][0], OrgInfo[id][OrgPickPos][1], OrgInfo[id][OrgPickPos][2])) return 1;
        if(!OrgInfo[id][PickDisponivel]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este Pickup nao esta disponivel, fale com um Admin.");
		if(PlayerInfo[playerid][Org] != 0 && IsPolice(PlayerInfo[playerid][Org])) return ShowPlayerDialog(playerid, DIALOG_MENUCORPS, DIALOG_STYLE_LIST, "{fff000}Escolha A Opcao", "Spawn Veiculo\nEquipar\nEscolher Skin", "Ok", "Sair");
        if(PlayerInfo[playerid][Org] != 0 && IsBandido(PlayerInfo[playerid][Org])) return ShowPlayerDialog(playerid, DIALOG_MENUORGS, DIALOG_STYLE_LIST, "{fff000}Escolha A Opcao", "Spawn Veiculo\nEquipar\nPegar Maconha", "Ok", "Sair");
 		return 1;
 	}
 	if((newkeys == KEY_SECONDARY_ATTACK)){
	    foreach(new i: B_Interiores){
			if(IsPlayerInRangeOfPoint(playerid, 1.5, IntInfo[i][IntX], IntInfo[i][IntY],IntInfo[i][IntZ]) && IntInfo[i][InteriorCriado]){
	            SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsY],IntInfo[i][IntsZ]);
	            SetPlayerInterior(playerid, IntInfo[i][Interior]);
	            SetPlayerVirtualWorld(playerid, i);
	            new str[45];
	            format(str, sizeof(str), "|INFO| Voce entrou em: %s", IntInfo[i][NomeInterior]);
	            SendClientMessage(playerid, LIGHTBLUE, str);
	            SetPVarString(playerid, "EntradaLoja", IntInfo[i][NomeInterior]);
				TogglePlayerControllableEx(playerid, false);
				SetTimerEx("descongelar", 4000, false, "i", playerid);
				SetPVarInt(playerid, "InteriorHABf", i);
	            break;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 1.5, IntInfo[GetPlayerVirtualWorld(playerid)][IntsX], IntInfo[GetPlayerVirtualWorld(playerid)][IntsY],IntInfo[GetPlayerVirtualWorld(playerid)][IntsZ]) && IntInfo[GetPlayerVirtualWorld(playerid)][InteriorCriado]){
			    SetPlayerPosEx(playerid, IntInfo[GetPlayerVirtualWorld(playerid)][IntX], IntInfo[GetPlayerVirtualWorld(playerid)][IntY],IntInfo[GetPlayerVirtualWorld(playerid)][IntZ]);
			    SetPlayerInterior(playerid, 0);
			    SetPlayerVirtualWorld(playerid, 0);
			    SetPVarString(playerid, "EntradaLoja", "");
			    TogglePlayerControllableEx(playerid, false);
			    SetTimerEx("descongelar", 4000, false, "i", playerid);
			    break;
			}
		}
	}
 	if((newkeys == KEY_NO)){
 		if(!IsPlayerInAnyVehicle(playerid)){
 			PC_EmulateCommand(playerid, "/mochila");
 			return 1;
 		}
 		else{
 			if(LojaAluguelCar(playerid)) return 1;

 			if(GetPlayerState(playerid) != PLAYER_STATE:2) return 1;

 			new veh = GetPlayerVehicleID(playerid);
 			new str[90];
 			if(VeiculoInfo[veh][Gasolina] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* A Gasolina deste veiculo Acabou.");
 
 			if(!VehOpcao(veh, VEICULO_LIGADO)){
 				if(!VeiculoConfiguracao[GetPlayerVehicleID(playerid)][Quebrado]){
	 				SetTimerEx("ligarvehicle", 2000, false, "ii", playerid, veh);
 					format(str, sizeof str, "* %s deu partida no motor do veiculo.", nome(playerid));
 					MensagemLocal(25.0, playerid, Roxoeu, str, true);
 				}
 				else
 					SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode ligar o motor de um veiculo Quebrado.");
 				return 1;
 			}
 			else{
 				VehOpcao(veh, DESLIGAR_VEICULO);
 			 	format(str, sizeof str, "* %s desligou o motor do veiculo.", nome(playerid));
 				MensagemLocal(25.0, playerid, Roxoeu, str, true);
 				return 1;
 			}
 		}
 	}
	return 1;
}
cmd:abastecerc(playerid){
	if(PlayerInfo[playerid][Emprego] != TRANSP_COMBUSTIVEL) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao trabalha com transporte de combustivel!");
	if(!TrabalhandoEmprego[playerid][TRANSP_COMBUSTIVEL]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta em modo de servico, use /trabalhar.");
	if(!ISP(playerid, 8.0, -993.6506, -698.6577, 32.0566)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta na posicao de abastecimento.");
	if(Abastecendo[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta abastecendo um veiculo.");
	new veh = SpawnouEmprego[playerid];
	if(veh == INVALID_VEHICLE_ID || veh == 0 || veh == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao spawnou seu veiculo!");
	if(CarregandoCombustivel[veh]) return SendClientMessage(playerid, LIGHTBLUE, "* Seu veiculo ja foi carregado com combustivel!");
	new str[255];
	strcat(str, "Local\tDistancia\tPreco\n");
	for(new i; i < 3; i++){
		new two[30];
		format(two, sizeof two, "%s\t%0.1f\t%d$\n",
			CoordZone(PostoInfo[i+1][PostoX], PostoInfo[i+1][PostoY], PostoInfo[i+1][PostoZ]), DistanciaToPoint(playerid, PostoInfo[i+1][PostoX], PostoInfo[i+1][PostoY], PostoInfo[i+1][PostoZ]), ConverterPorNumero(i+1));
		strcat(str, two);
	}
	ShowPlayerDialog(playerid, DIALOG_ENCHER_CAMION, 5, "{33ccff}# Response", str, "Ok", #);
	return 1;
}
stock ConverterPorNumero(numero){
	switch(numero){
		case 1: return 1200;
		case 2: return 1100;
		case 3: return 400;
	}
	return 700;
}
function DistanciaToPoint(playerid, Float: x, Float: y, Float: z){
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	return floatround(VectorSize( X- x, Y - y, Z - z));
}
cmd:motor(playerid){
 	if(GetPlayerState(playerid) != PLAYER_STATE:2) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ser motorista e estar dentro de um veiculo.");
 	if(LojaAluguelCar(playerid)) return 1;

	new veh = GetPlayerVehicleID(playerid);
	new str[90];
 	if(VeiculoInfo[veh][Gasolina] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* A Gasolina deste veiculo Acabou.");

	if(!VehOpcao(veh, VEICULO_LIGADO)){
 		if(!VeiculoConfiguracao[GetPlayerVehicleID(playerid)][Quebrado]){
			SetTimerEx("ligarvehicle", 2000, false, "ii", playerid, veh);
 			format(str, sizeof str, "* %s deu partida no motor do veiculo.", nome(playerid));
 			MensagemLocal(25.0, playerid, Roxoeu, str, true);
 		}
 		else
 			SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode ligar o motor de um veiculo Quebrado.");	
 	}
 	else{
 		VehOpcao(veh, DESLIGAR_VEICULO);
 	 	format(str, sizeof str, "* %s desligou o motor do veiculo.", nome(playerid));
		MensagemLocal(25.0, playerid, Roxoeu, str, true);
	}
 	return 1;
}
cmd:veiculostatus(playerid, params[]){
	new oq[5];
	if(sscanf(params, "iiiii",oq[0], oq[1], oq[2], oq[3], oq[4])) return SendClientMessage(playerid, -1, "");
  //UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, tires)
	UpdateVehicleDamageStatus(oq[0], oq[1], oq[2], oq[3], oq[4]);
	return 1;
}
cmd:irhp(playerid){
	SetPlayerPos(playerid, 2582.5076,1351.0708,78.5583);
	return 1;
}
cmd:estoqueorg(playerid){
	if(PlayerInfo[playerid][Org] == 0) return 1;
	new str[255], org = PlayerInfo[playerid][Org];
	strcat(str, "Item\tQuantia\n");
	new str2[128];
	format(str2, sizeof str2, "{fff000}Maconha\t%dg\n{33ccff}Equipamentos\t%d\n{33aa33}Dinheiro\t%dR$",
		OrgInfo[org][MaconhaOrg], OrgInfo[org][Equipamentos], OrgInfo[org][OrgCofre]);
	strcat(str, str2);
	ShowPlayerDialog(playerid, DIALOG_INUTIL, 5, "{33ccff}Estoque Da Org", str, "Ok", #);
	return 1;
}
cmd:farol(playerid){
	if(IsPlayerInAnyVehicle(playerid)){
		new veh = GetPlayerVehicleID(playerid);
		if(!VehOpcao(veh, FAROL_LIGADO)){
			VehOpcao(veh, LIGAR_FAROL);
			SendClientMessage(playerid, Roxoeu, "* Farol ligado.");
		}
		else{
			VehOpcao(veh, DESLIGAR_FAROL);
			SendClientMessage(playerid, Roxoeu, "* Farol desligado.");			
		}
	}
	return 1;
}
forward ligarvehicle(playerid, vehicleid);
public ligarvehicle(playerid, vehicleid){
	new porcentagem = random(100);
	if(VehOpcao(vehicleid, VEICULO_LIGADO)){
		VehOpcao(vehicleid, DESLIGAR_VEICULO);
		SendClientMessage(playerid, COR_COPOM, "* Voce girou a chave novamente e o motor foi Desligado.");

	}
	else{
		switch(porcentagem){
			case 0..95:{
				VehOpcao(vehicleid, LIGAR_VEICULO);
				SendClientMessage(playerid, Roxoeu, "* Veiculo Ligado!");
			}
			case 96..100:{
				SendClientMessage(playerid, LIGHTBLUE, "* O Veiculo falhou! De a partida novamente.");	
			}
		}
	}
	return 1;
}
//OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ )
public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	new Float:pp[6];
	GetDynamicObjectPos(objectid, pp[0], pp[1], pp[2]);
	GetDynamicObjectRot(objectid, pp[3], pp[4], pp[5]);
	if(GetPVarInt(playerid, "editandosabosta") == 1533){
	    if(response == 1){
	        new id = GetPVarInt(playerid, "oportaoi");
	        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Edi??§??£o salva com sucesso. Voce salvou este portao.");
	        SetDynamicObjectPos(InfoPortao[id][OPortao], x, y, z);
	        SetDynamicObjectRot(InfoPortao[id][OPortao], rx, ry, rz);
	        SalvarPortao(id);
			DestroyDynamic3DTextLabel(InfoPortao[id][PortaoText]);
			new str[90];
    	   	format(str, sizeof(str), "%s\n%{33ccff}ID %d\n%s", InfoPortao[id][DonoPortao], InfoPortao[id][PortaoID], CoordZone(InfoPortao[id][Px], InfoPortao[id][Py], InfoPortao[id][Pz]));
	       	InfoPortao[id][PortaoText] = CreateDynamic3DTextLabel(str, -1,InfoPortao[id][Px], InfoPortao[id][Py], InfoPortao[id][Pz], 30.0);
	        DeletePVar(playerid, "oportaoi");
			SetPVarInt(playerid, "editandosabosta", 0);
			DeletePVar(playerid, "editandosabosta");

			salvarAcessorios(playerid);
		}
		else if (response == 0){
		    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Operacao cancelada com sucesso.");
			SetDynamicObjectPos(objectid, pp[0], pp[1], pp[2]);
			SetDynamicObjectRot(objectid, pp[3], pp[4], pp[5]);
			SetPVarInt(playerid, "editandosabosta", 0);
			DeletePVar(playerid, "editandosabosta");
		}
	}
	else if(EditandoCaixa[playerid]){
	    if(response == 1){
	        new i = GetPVarInt(playerid, "caixaid");
			InfoCaixa[i][CaixaX] = x;
			InfoCaixa[i][CaixaY] = y;
			InfoCaixa[i][CaixaZ] = z;
			InfoCaixa[i][CaixaRX] = rx;
			InfoCaixa[i][CaixaRY] = ry;
			InfoCaixa[i][CaixaRZ] = rz;
			SetDynamicObjectPos(InfoCaixa[i][ObjetoCaixa], x, y, z);
			SetDynamicObjectRot(InfoCaixa[i][ObjetoCaixa], rx, ry, rz);
			DestroyDynamic3DTextLabel(InfoCaixa[i][CaixaTexto]);
			SalvarCaixa(i);
			new str[60];
	        format(str, sizeof(str), "{33ccff}Caixa Eletronico N. %d\nAperte 'Y'", i);
	        InfoCaixa[i][CaixaTexto] = CreateDynamic3DTextLabel(str, -1, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ], 15.0);
			UpdateDynamic3DTextLabelText(InfoCaixa[i][CaixaTexto], -1, str);
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Caixa foi editado e salvo com sucesso.");
			EditandoCaixa[playerid] = false;
		}
		else if (response == 0){
			EditandoCaixa[playerid] = false;
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce cancelou a edicao do caixa.");
			SetDynamicObjectPos(objectid, pp[0], pp[1], pp[2]);
			SetDynamicObjectRot(objectid, pp[3], pp[4], pp[5]);
		}
	}
	else if(Editing[playerid]){
	    if(response == 1){
	        new ob = GetPVarInt(playerid, "Port");
			SetDynamicObjectPos(ObjetoInfo[ob][Objeto], x,y, z);
			SetDynamicObjectRot(ObjetoInfo[ob][Objeto], rx,ry, rz);
		    Editing[playerid] = false;
		    DestroyDynamic3DTextLabel(ObjetoInfo[ob][Texto]);
			new string[128];
			format(string, sizeof(string), "{aa33aa}Objeto {ffffff}%d (%d)", ob, ObjetoInfo[ob][ObjetoModel]);
			ObjetoInfo[ob][Texto] = CreateDynamic3DTextLabel(string, -1, x,y,z-0.3, 5.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
		    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Edicao foi finalizada.");
		    SalvarObjeto(ob);
			return 1;
		}
		else if (response == 0){
			Editing[playerid] = false;
			new str[99];
			format(str, sizeof str, "|INFO| Voce cancelou a edicao do objeto '%d'.", GetPVarInt(playerid, "Port"));
			SendClientMessage(playerid, -1, str);
			SetDynamicObjectPos(objectid, pp[0], pp[1], pp[2]);
			SetDynamicObjectRot(objectid, pp[3], pp[4], pp[5]);
			pp[0] = EOS;
		}
	}
	if(GetPVarInt(playerid, "CFGCOFRE") != -1){
		if(response == 1){
			new id = GetPVarInt(playerid, "CFGCOFRE");
			SetDynamicObjectPos(CofreInfo[id][OCofre], x, y, z);
			SetDynamicObjectRot(CofreInfo[id][OCofre], rx, ry, rz);
			DestroyDynamic3DTextLabel(CofreInfo[id][CofreTexto]);
			SalvarCofre(id);
			SetPVarInt(playerid, "CFGCOFRE", -1);
			SendClientMessage(playerid, Rosa, "* Cofre salvo com sucesso.");
		}
	}
	return 1;
}
SalvarCofre(id){
	new Query[255], Float: X, Float: Y, Float: Z, Float: Rx, Float: Ry, Float: Rz;
	GetDynamicObjectPos(CofreInfo[id][OCofre], X, Y, Z);
	GetDynamicObjectRot(CofreInfo[id][OCofre], Rx, Ry, Rz);
	CofreInfo[id][CofrePos][0] = X;
	CofreInfo[id][CofrePos][1] = Y;
	CofreInfo[id][CofrePos][2] = Z;
	new str[144];
	format(str, sizeof str, "(%d)%s\n\n{33ccff}use /roubarcofre",id, CofreInfo[id][CofreName]);
	CofreInfo[id][CofreTexto] = CreateDynamic3DTextLabel(str, -1, X, Y, Z, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, CofreInfo[id][VWCofre], CofreInfo[id][InteriorCofre]);
	mysql_format(Dados, Query, sizeof(Query), "UPDATE `Cofres` SET `CofreName` = '%s', `CofreMoney` = '%d', `CofreX`= '%f', `CofreY` = '%f', `CofreZ` = '%f',\
	`CofreRx` = '%f', `CofreRy` = '%f', `CofreRz` = '%f' WHERE `Cofreid` = '%d'", CofreInfo[id][CofreName], CofreInfo[id][CofreMoney], X, Y, Z, Rx, Ry, Rz, id);
	return mysql_tquery(Dados, Query);
}
public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(checkpointid == CheckCarro[playerid]){
	    if(IsPlayerInVehicle(playerid, VeiculoHab[playerid]))
		{
	        new Float:Hp;
	        GetVehicleHealth(VeiculoHab[playerid], Hp);
	        if(Hp < 960){
	            DestroyVehicleEx(VeiculoHab[playerid], "Falha Carteira AutoEscola");
	            EmTeste[playerid] = false;
	            SetPlayerVirtualWorld(playerid, 0);
	            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce falhou no teste do veiculo.");
				new i = GetPVarInt(playerid, "InteriorHABf");
				SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsX],IntInfo[i][IntsX]);
				SetPlayerInterior(playerid, IntInfo[i][Interior]);
				SetPlayerVirtualWorld(playerid, i);
	            DestroyDynamicCP(CheckCarro[playerid]);
				CheckCarro[playerid] = -1;
				CheckMoto[playerid] = -1;
				VeiculoHab[playerid] = -1;
				CheckAviao[playerid] = -1;
				//EmTeste[playerid]
			}
			else{
			    EmTeste[playerid] = false;
			    SetPlayerVirtualWorld(playerid, 0);
			    DestroyVehicleEx(VeiculoHab[playerid], "Passou Hab Auto Escola");
			    CarteiraInfo[playerid][Carro] = 1;
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce passou no teste de habilitacao. Parabens!");
				new Query[128];
				format(Query, sizeof Query, "%s passou hab carro", nome(playerid));
				AdicionarLogs(Query);
			    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Habs` SET `Carro` = '%d' WHERE `Nome` = '%s'", CarteiraInfo[playerid][Carro], nome(playerid));
			    mysql_tquery(Dados, Query);

			    DestroyDynamicCP(CheckCarro[playerid]);
				new i = GetPVarInt(playerid, "InteriorHABf");
				SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsY],IntInfo[i][IntsZ]);
				SetPlayerInterior(playerid, IntInfo[i][Interior]);
				SetPlayerVirtualWorld(playerid, i);
				CheckCarro[playerid] = -1;
				CheckMoto[playerid] = -1;
				CheckAviao[playerid] = -1;
				VeiculoHab[playerid] = -1;
				VeiculoHab[playerid] = -1;
				//EmTeste[playerid]
			}
		}
	}
	if(checkpointid == CheckMoto[playerid]){
	    if(IsPlayerInVehicle(playerid, VeiculoHab[playerid])){
	        new Float:Hp;
	        GetVehicleHealth(VeiculoHab[playerid], Hp);
	        if(Hp < 960)
			{
	            DestroyVehicleEx(VeiculoHab[playerid], "Falha Carteira AutoEscola ( moto)");
	            EmTeste[playerid] = false;
	            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce falhou no teste da moto.");
				new i = GetPVarInt(playerid, "InteriorHABf");
				SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsX],IntInfo[i][IntsX]);
				SetPlayerInterior(playerid, IntInfo[i][Interior]);
				SetPlayerVirtualWorld(playerid, i);
	            DestroyDynamicCP(CheckMoto[playerid]);
	            VeiculoHab[playerid] = -1;
				CheckCarro[playerid] = -1;
				CheckMoto[playerid] = -1;
				CheckAviao[playerid] = -1;
				//EmTeste[playerid]
			}
			else{
			    EmTeste[playerid] = false;
			    SetPlayerVirtualWorld(playerid, 0);
			    DestroyVehicleEx(VeiculoHab[playerid], "Passou Hab AutoEscola ( moto )");
			    CarteiraInfo[playerid][Moto] = 1;
				new Query[128];
				format(Query, sizeof Query, "%s passou hab moto", nome(playerid));
				AdicionarLogs(Query);
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce passou no teste de habilitacao. Parabens!");
				new i = GetPVarInt(playerid, "InteriorHABf");
				SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsY],IntInfo[i][IntsZ]);
				SetPlayerInterior(playerid, IntInfo[i][Interior]);
				SetPlayerVirtualWorld(playerid, i);
				CheckCarro[playerid] = -1;
				CheckMoto[playerid] = -1;
				CheckAviao[playerid] = -1;
				//EmTeste[playerid]
				VeiculoHab[playerid] = -1;
			    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Habs` SET `Moto` = '%d' WHERE `Nome` = '%s'", CarteiraInfo[playerid][Moto], nome(playerid));
			    mysql_tquery(Dados, Query);
			    DestroyDynamicCP(CheckMoto[playerid]);
			}
		}
	}
	if(checkpointid == CheckAviao[playerid]){
	    if(IsPlayerInVehicle(playerid, VeiculoHab[playerid])){
	        new Float:Hp;
	        GetVehicleHealth(VeiculoHab[playerid], Hp);
	        if(Hp < 960)
			{
	            DestroyVehicleEx(VeiculoHab[playerid], "Falha Carteira AutoEscola ( aviao )");
	            EmTeste[playerid] = false;
	            SetPlayerVirtualWorld(playerid, 0);
	            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce falhou no teste de aviao.");
				new i = GetPVarInt(playerid, "InteriorHABf");
				SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsX],IntInfo[i][IntsX]);
				SetPlayerInterior(playerid, IntInfo[i][Interior]);
				SetPlayerVirtualWorld(playerid, i);
	            DestroyDynamicCP(CheckAviao[playerid]);
				VeiculoHab[playerid] = -1;
			}
			else{
			    EmTeste[playerid] = false;
			    SetPlayerVirtualWorld(playerid, 0);
			    DestroyVehicleEx(VeiculoHab[playerid],"Passou Hab AutoEscola (Aviao)");
			    CarteiraInfo[playerid][Aviao] = 1;
			    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce passou no teste de habilitacao. Parabens!");
				new i = GetPVarInt(playerid, "InteriorHABf");
				new Query[128];
				format(Query, sizeof Query, "%s passou hab Aviao", nome(playerid));
				AdicionarLogs(Query);
				SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsY],IntInfo[i][IntsZ]);
				SetPlayerInterior(playerid, IntInfo[i][Interior]);
				SetPlayerVirtualWorld(playerid, i);
				VeiculoHab[playerid] = -1;
			    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Habs` SET `Aviao` = '%d' WHERE `Nome` = '%s'", CarteiraInfo[playerid][Aviao], nome(playerid));
			    mysql_tquery(Dados, Query);
			    DestroyDynamicCP(CheckAviao[playerid]);
			}
		}
	}
	return 1;
}
public OnPlayerEnterCheckpoint(playerid){
	DisablePlayerCheckpoint(playerid);
	return 1;
}
AbrirSelecaoSpawn(playerid){
    ShowPlayerDialog(playerid, DIALOG_SELECTSPAWN, DIALOG_STYLE_LIST, "{33ccff}# Local Spawn", 
        "{fff000}Spawn Civil\n{fff000}Spawn Da Org\n{fff000}Ultima Posicao\n{fff000}Sua Casa", "Ok", #);	
    return 1;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, CLICK_SOURCE:source)
{
	return 1;
}
forward checkMac();
public checkMac(){
	foreach(new i: MaconhasIterator){
		if(MacPlant[i][MacQuant] < 250){
			new conta = 1 + random(3);
			MacPlant[i][MacQuant] += conta;
			new str[144];
			format(str, sizeof str, "{33aa33}Maconha de %s\n%d/250g", MacPlant[i][DonoMac], MacPlant[i][MacQuant]);
			UpdateDynamic3DTextLabelText(MacPlant[i][TextoMaconha], -1, str);
		}
	}
}
salvarMaconhas(){
	new Query[255];
	foreach(new i: MaconhasIterator){
		mysql_format(Dados, Query, sizeof Query, "UPDATE `Maconhas` SET `MacX` = '%f', `MacY` = '%f', `MacZ` = '%f', `MacDono` = '%s',\
			`MacQuant` = '%d' WHERE `macid` = '%d'",
			MacPlant[i][MacPos][0], MacPlant[i][MacPos][1], MacPlant[i][MacPos][2], MacPlant[i][DonoMac], MacPlant[i][MacQuant], i);
		mysql_tquery(Dados, Query);		
	}
}
VerificarEdicaoCaixa(playerid){
	if(EditandoCaixa[playerid]){
		new id = GetPVarInt(playerid, "caixaid");
		SetDynamicObjectPos(InfoCaixa[id][ObjetoCaixa], InfoCaixa[id][CaixaX], InfoCaixa[id][CaixaY], InfoCaixa[id][CaixaZ]);
		SetDynamicObjectRot(InfoCaixa[id][ObjetoCaixa], InfoCaixa[id][CaixaRX], InfoCaixa[id][CaixaRY], InfoCaixa[id][CaixaRZ]);
		EditandoCaixa[playerid] = false;
	}
	return 1;
}
VerEditing(playerid)
{
	if(Editing[playerid]){
	    new pt = GetPVarInt(playerid, "Port");
	    Editing[playerid] = false;
	    SalvarObjeto(pt);
        SetPVarInt(playerid, "Port", -1);
        //////////printf("'[%d]%s' desconectou enquanto editava um Objeto.", nome(playerid));
	}
	return 1;
}
SalvarObjeto(i)
{
	new Query[256], Float:p[6];
	GetDynamicObjectPos(ObjetoInfo[i][Objeto], p[0], p[1], p[2]);
	GetDynamicObjectRot(ObjetoInfo[i][Objeto], p[3], p[4], p[5]);
	ObjetoInfo[i][ObX] = p[0];
	ObjetoInfo[i][ObY] = p[1];
	ObjetoInfo[i][ObZ] = p[2];
	ObjetoInfo[i][RotX] = p[3];
	ObjetoInfo[i][RotY] = p[4];
	ObjetoInfo[i][RotZ] = p[5];
	mysql_format(Dados, Query, sizeof(Query), "UPDATE `Objetos` SET `ObX` = '%f', `ObY` = '%f',`ObZ` = '%f',\
	`RotX` = '%f', `RotY` = '%f', `RotZ` = '%f', `ObjetoModel` = '%d' WHERE `Objetoid` = '%d'", ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ], ObjetoInfo[i][RotX], ObjetoInfo[i][RotY],
	ObjetoInfo[i][RotZ],  ObjetoInfo[i][ObjetoModel], ObjetoInfo[i][PIDF]);
	mysql_tquery(Dados, Query);
	//////////printf("INFO: o Objeto '%d' foi salvo separadamente.", i);
	return 1;
}
cmd:resetarcofre(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/resetarcofre [ org ]");
	if(!Number(params)) return 1;
	new i = strval(params);
	OrgInfo[i][OrgCofre] = 0;
	SalvarOrg(i);
	new str[144];
	format(str, sizeof str, "%s resetou o cofre da org %s", nome(playerid), OrgGm[i][OrgNome]);
	AdminMessage(COR_SCRIPTER, str);
	return 1;
}
cmd:enchercofres(playerid){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	for(new i = 1; i != sizeof OrgGm; i++){
		OrgInfo[i][OrgCofre] = 1000000;
		SalvarOrg(i);
	}
	new str[144];
	format(str, sizeof str, "%s encheu o cofre de todas as Organizacoes.", nome(playerid));
	AdminMessage(COR_SCRIPTER, str);
	return 1;
}
cmd:setarcofre(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new id, quantia;
	if(sscanf(params, "ii", id, quantia)) return SendClientMessage(playerid, LIGHTBLUE, "/setarcofre [ org ] [ quantia ]");
	OrgInfo[id][OrgCofre] = quantia;
	new str[78];
	format(str, sizeof str, "Voce setou %d$ para %s", quantia, OrgGm[id][OrgNome]);
	SendClientMessage(playerid, LIGHTBLUE, str);
	return 1;
}
cmd:resetartaximetro(playerid){
	if(PlayerInfo[playerid][Emprego] != TAXISTA) return 1; //SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e taxista.");
	if(!TrabalhandoEmprego[playerid][TAXISTA]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta trabalhando, use /trabalhar!");
	if(!IsPlayerInVehicle(playerid, SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar dentro do seu veiculo do emprego.");
	new veh = SpawnouEmprego[playerid];
	if(TimerTaximetro[veh] == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao ativou o taximetro.");
	KillTimer(TimerTaximetro[veh]);
	TimerTaximetro[veh] = -1;
	VeiculoInfo[veh][MileageTaxi] = 0.0;
	SendClientMessage(playerid, LIGHTBLUE, "* Voce resetou o Taximetro e ele foi desligado automaticamente.");
	return 1;
}
cmd:parartaximetro(playerid){
	if(PlayerInfo[playerid][Emprego] != TAXISTA) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e taxista.");
	if(!TrabalhandoEmprego[playerid][TAXISTA]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta trabalhando, use /trabalhar!");
	if(!IsPlayerInVehicle(playerid, SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar dentro do seu veiculo do emprego.");
	new veh = SpawnouEmprego[playerid];
	if(TimerTaximetro[veh] == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao ativou o taximetro.");
	KillTimer(TimerTaximetro[veh]);
	TimerTaximetro[veh] = -1;
	new str[128];
	format(str, sizeof str, "%s parou seu Taximetro em %0.0fm com uma receita estimada em %dR$.",nome(playerid), VeiculoInfo[veh][MileageTaxi], floatround(VeiculoInfo[veh][MileageTaxi] / 4 / 2 + 15));
	MensagemLocal(30.0, playerid, Roxoeu, str, true);
	return 1;
}
cmd:iniciartaximetro(playerid){
	if(PlayerInfo[playerid][Emprego] != TAXISTA) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao e taxista.");
	if(!TrabalhandoEmprego[playerid][TAXISTA]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta trabalhando, use /trabalhar!");
	if(!IsPlayerInVehicle(playerid, SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar dentro do seu veiculo do emprego.");
	new veh = SpawnouEmprego[playerid];
	if(TimerTaximetro[veh] != -1) return SendClientMessage(playerid, LIGHTBLUE, "* Este Taximetro ja esta ativado, use /parartaximetro ou /resetartaximetro.");
	new Float: x, Float: y, Float: z;
	GetVehiclePos(veh, x, y, z);
	VeiculoInfo[veh][OldPosTaxi][0] = x;
	VeiculoInfo[veh][OldPosTaxi][1] = y;
	VeiculoInfo[veh][OldPosTaxi][2] = z;

	TimerTaximetro[veh] = SetTimerEx("GetMileage", 2000, true, "ii", playerid, veh);
	SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de iniciar o Taximetro.");
	return 1;
} 
cmd:configurarsalario(playerid){
	if(PlayerInfo[playerid][Cargo] < 10) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ser lider para usar este comando.");
	new str[447 + 1];
	strcat(str, "Cargo\tSalario\n");
	for(new i; i < 10; i++){
		new st2r[47];
		format(st2r, sizeof st2r, "{ffffff}%s\t{33aa33}%dR$\n",
			CargoOrgPCargo(PlayerInfo[playerid][Org], i+1), OrgInfo[ PlayerInfo[playerid][Org] ][SalarioCargo][i+1]);
		strcat(str, st2r);
	}
	ShowPlayerDialog(playerid, DIALOG_VER_SALARIOS, 5, "{fff000}# Configurando Salarios", str, "Ok", "Sair");
	return 1;
}
cmd:depositarorg(playerid, params[]){
	if(PlayerInfo[playerid][Org] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ser de uma Organizacao.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/depositarorg [ quantia ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "* Digite somente numeros!");
	new quantia = strval(params);
	if(GetPlayerCash(playerid) < quantia || quantia > GetPlayerCash(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce digitou um valor muito alto!");
	new org = PlayerInfo[playerid][Org];
	GivePlayerCash(playerid, -quantia);
	OrgInfo[org][OrgCofre] += quantia;
	new str[128];
	format(str, sizeof(str), "Cofre | %s depositou uma quantia de %d$ no cofre da organizacao.", nome(playerid), quantia);
	foreach(new i: Player){
		if(PlayerInfo[i][Org] == org){
			SendClientMessage(i, VerdeSamp, str);
		}
	}
	SalvarOrg(org);
	return 1;
}
cmd:configurarorg(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new id = strval(params);
	if(isnull(params)) return SendClientMessage(playerid, -1, "/configurarorg [ id da organizacao ]");
	if(!OrgInfo[id][OrgCriada]) return SendClientMessage(playerid, -1, "* Esta organizacao nao foi criada.");
	SetPVarInt(playerid, "IDOrg", id);
	ShowPlayerDialog(playerid, DIALOG_CONFIGURACAO_ORG, DIALOG_STYLE_LIST, 
		"{FF0000}# Configuracao Org", "Atualizar Veiculos\nAtualizar Spawn\nAtualizar Pickup\nAtualizar Veiculos Cor\nDinheiro Cofre", "Ok", "Sair");
	return 1;
}
AbrirCfgOrg(playerid){
	ShowPlayerDialog(playerid, DIALOG_CONFIGURACAO_ORG, DIALOG_STYLE_LIST, 
	"{FF0000}# Configuracao Org", "Atualizar Veiculos\nAtualizar Spawn\nAtualizar Pickup\nAtualizar Veiculos Cor\nDinheiro Cofre", "Ok", "Sair");
	return 1;
}

cmd:cigarro(playerid){
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
	return 1;
}
cmd:rap(playerid){
	PlayAudioStreamForPlayer(playerid, "http://node-17.zeno.fm/1s7c5qtrq18uv?rj-ttl=5&rj-tok=AAABeuhXLsMAnKWkVG5Uib18sw");//, Float:posX = 0.0, Float:posY = 0.0, Float:posZ = 0.0, Float:distance = 50.0, usepos = 0)
	return 1;
}

cmd:mostrarcarteira(playerid, params[]){
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, LIGHTBLUE, "/mostrarcarteira [id ]");
	new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "* O Jogador esta offline.");
	new Float: Pos[3];
	GetPlayerPos(id, Pos[0], Pos[1], Pos[2]);
	if(!ISP(playerid, 3.5, Pos[0], Pos[1], Pos[2])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar proximo ao jogador.");
	
	new str[128];
	SetPVarInt(id, "idrgP", playerid);
    format(str, sizeof(str), "** %s mostrou sua carteira para %s.", nome(playerid), nome(id));
	MensagemLocal(30.0, playerid, Roxoeu, str, true);
	format(str, sizeof(str), "Documentos\nHabilitacoes\n{ffffff}Dinheiro {33aa33}R$%d, %s, Porte: %s", GetPlayerCash(playerid), TipoFicha(playerid), (PlayerInfo[playerid][Porte] ? ("Sim") : ("Nao")));
	ShowPlayerDialog(id, DIALOG_VERCARTEIRA, DIALOG_STYLE_LIST, "{fff000}Carteira", str, "Select", "Sair");
	return 1;	
}
cmd:carteira(playerid){
	new str[128];
    format(str, sizeof(str), "** %s olhou sua carteira.", nome(playerid));
	MensagemLocal(30.0, playerid, Roxoeu, str, true);
	format(str, sizeof(str), "Documentos\nHabilitacoes\n{ffffff}Dinheiro {33aa33}R$%d, %s, Porte: %s", GetPlayerCash(playerid), TipoFicha(playerid), (PlayerInfo[playerid][Porte] ? ("Sim") : ("Nao")));
	ShowPlayerDialog(playerid, DIALOG_CARTEIRA, DIALOG_STYLE_LIST, "{fff000}Sua Carteira", str, "Select", "Sair");
	return 1;
}
TipoFicha(playerid){
	new tipo[35];
	switch(GetPlayerWantedLevel(playerid)){
	    case 0: tipo = "{ffffff}Sem Crimes";
	    case 1..5: tipo = "{fff000}Procurado";
	    case 6..12: tipo = "{e15a22}Perigoso";
	    case 13..25: tipo = "{8816bc}Muito Perigoso";
	    case 26..90: tipo = "{f61522}Presidiario Fugitivo";
	    case 91..120: tipo = "{2c27c4}Fugitivo Internacional";
	    case 121..2000: tipo = "{ff0000}Terrorista";
	    default: tipo = "{ffffff}Sem Crimes";
	}
	return tipo;
}
ShowVerRg(playerid, forplayer)
{
	new str[230], result = PlayerInfo[playerid][Nivel];
	if(result == 0) result = 1;
	format(str, sizeof(str), "{33ccff}Algumas informacoes importantes a seguir.\n\n{ffffff}Nome [%s]\n{ffffff}Dinheiro [%d]\n{ffffff}Nivel %d (%d/%dXp)\n{ffffff}Emprego %s\n{ffffff}Vezes Preso %d", nome(playerid), GetPlayerCash(playerid), PlayerInfo[playerid][Nivel], PlayerInfo[playerid][Xp], result * 2, EmpName(playerid), PlayerInfo[playerid][VezesPreso]);
	ShowPlayerDialog(forplayer, DIALOG_INFO_VERRG, DIALOG_STYLE_MSGBOX, "{fff000}Sua Documentacao", str, "Ok", "");
}
ShowRg(playerid, forplayer)
{
	new str[230], result = PlayerInfo[playerid][Nivel];
	if(result == 0) result = 1;
	format(str, sizeof(str), "{33ccff}Algumas informacoes importantes a seguir.\n\n{ffffff}Nome [%s]\n{ffffff}Dinheiro [%d]\n{ffffff}Nivel %d (%d/%dXp)\n{ffffff}Emprego %s\n{ffffff}Vezes Preso %d\n{ffffff}Tempo No Servidor: %s", 
		nome(playerid), GetPlayerCash(playerid), 
		PlayerInfo[playerid][Nivel], PlayerInfo[playerid][Xp], result * 2, EmpName(playerid), PlayerInfo[playerid][VezesPreso], PlayerInfo[playerid][HorasJogadas] > 0 ? Convert(gettime() - PlayerInfo[playerid][HorasJogadas]) : "0");
	ShowPlayerDialog(forplayer, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Sua Documentacao", str, "Ok", "");
	////printf("%s      |    %d",Convert(PlayerInfo[playerid][HorasJogadas] - gettime()),  PlayerInfo[playerid][HorasJogadas]);
}
cmd:revistarmochila(playerid, params[]){
    if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar o comando.");
	if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	if(!Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /revistarmochila [ id do jogador ]");
	new id = strval(params), Float: X, Float: Y, Float: Z;
	
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "ID Invalido.");
	GetPlayerPos(id, X, Y, Z);
	new str2[80];
	format(str2, sizeof(str2), "** %s esta revistando alguem.", nome(playerid));
	MensagemLocal(30.0, playerid, Roxoeu, str2, true);
	if(!ISP(playerid, 4.0, X, Y, Z)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar perto do jogador.");
	if(PlayerInfo[id][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador nao possui mochila.");
	
	new  
		string[963];

	strcat(string, "Item\tQuantia\n");
	for(new i; i< 32; i++){
		if(ItemInfo[id][i][Item] != NADA){
			new str[29];
		    format(str, sizeof(str), "%s\t(%dx)\n", InventarioName(ItemInfo[id][i][Item]), ItemInfo[id][i][Quantia]);
			strcat(string, str);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{FFF000}Mochila", string, "Select", "Sair");
	return 1;
}
cmd:mochila(playerid)
{
	/*
	if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ter uma mochila.");
	
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Dentro do veiculo nao Cupinxa! rsrs");
	if(IsPlayerPreso(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso preso.");

	new conta = 20 * PlayerInfo[playerid][Vip];
	new  
		string[963];
	if(conta == 0) conta = 20;
	strcat(string, "Item\tQuantia\n");
	for(new i; i< conta; i++){
		if(ItemInfo[playerid][i][Item] != NADA ){
			new str[29];
	    	format(str, sizeof(str), "%s\t(%dx)\n", InventarioName(ItemInfo[playerid][i][Item]), ItemInfo[playerid][i][Quantia]);
			strcat(string, str);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_MOCHILA, 5, "{FFF000}Sua Mochila", string, "Select", "Sair");
   */
	ShowPlayerDialog(playerid, DIALOG_ESCOLHER_OPCAO, DIALOG_STYLE_LIST, "{33ccff}Escolha uma opcao", "Inventario em Dialog\nInventario em Text-Draw", "Ok", "Sair");
	return 1;
}
cmd:menu(playerid)
{
	foreach(new i: MenusCriados){
	    if(IsPlayerInRangeOfPoint(playerid, 2.5, MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ]) && MenuInfo[i][MenuCriado] && MenuInfo[i][MVW] == GetPlayerVirtualWorld(playerid)){
			switch(MenuInfo[i][TipoCompra]){
			    case 1:{
			    	SetPVarInt(playerid, "Menuid", i);
			        ShowPlayerDialog(playerid, DIALOG_MERCADINHO, 5, "{fff000}Dialog 24/7", "{33ccff}Item\t{33ccff}Preco\n\
					Mochila\t{33aa33}35$\n\
					{ff8080}Celular\t{33aa33}699$\n\
					Creditos\t{33aa33}10$\n\
					{ff8080}Chip de Telefone\t{33aa33}25$\n\
					Capacete\t{33aa33}170$\n\
					{ff8080}Walkie-Talkie\t{33aa33}200$\n\
					Leite em Po\t{33aa33}25$\n\
					Dispositivo MP3\t{33aa33}500$\n\
					{ff8080}Galao Vazio\t{33aa33}50$\n\
					Rede De Pesca\t{33aa33}40$\n\
					Vender Leite\t{33aa33}12$ p/Litro", "Comprar", "Sair");
				}
				case 2:{
					SendClientMessage(playerid, VerdeSamp, fString("* O Numero de sua conta bancaria e %04d.", BancoInfo[playerid][userbanco]));
					MostrarDialogCaixa(playerid, 2);
				}
				case 3:{
					if(!PossuiContaBanco(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "Crie uma conta no banco para comecar a trabalhar!");
					new string[525 + 1];
					strcat(string, "{33aa33}Emprego\t{33aa33}Nivel\n");
					for(new e; e< sizeof(empinfo); e++){
						new str[80];
						format(str, sizeof str, "%s\t%s\n", empinfo[e][NomeEmp], empinfo[e][Requisitos]);
						strcat(string, str);
					}
			    	ShowPlayerDialog(playerid, DIALOG_EMPREGOS, 5, "{fff000}Empregos Do Servidor", string, "Ok", "Sair");
				}
				case 4:{
					SetPVarInt(playerid, "Menuid", i);
				    ShowPlayerDialog(playerid, DIALOG_COMIDAS, 5, "{fff000}Lanches", "{33ccff}Comida\t{33ccff}Preco\n\
					{ff8080}Pizza\t{33aa33}30$\n\
					Hamburguer\t{33aa33}15$\n\
					{ff8080}Coxinha\t{33aa33}5$\n\
					Prato Feito\t{33aa33}18$\n\
					{ff8080}Feijoada\t{33aa33}15$\n\
					Bauru\t{33aa33}6$\n\
					", "Comprar", "Sair");
				}
				case 5:{
					SetPVarInt(playerid, "Menuid", i);
				    ShowPlayerDialog(playerid, DIALOG_HABS, 5, "{fff000}Habilitacoes", "{33ccff}Tipo\t{33aa33}Valor\n\
				    Carro\t{33aa33}R$1700\n\
				    Moto\t{33aa33}R$1500\n\
				    Aviao\t{33aa33}R$8900\n", "Select", "Sair");
				}

				case 6:{
					SetPVarInt(playerid, "Menuid", i);
					SelectTextDraw(playerid, 0xFAB847FF);
					for(new pS; pS< 8; pS++){
						PlayerTextDrawShow(playerid, BuySkinTD[playerid][pS]);
					}
					SendClientMessage(playerid, LIGHTBLUE, "* Voce tambem pode usar /comprarskin [ id ]");
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de selecionar para comprar skin, o valor de todas e 320.");
					return 1;
				}
				case 7:{
				    ShowPlayerDialog(playerid, DIALOG_MERCADO_NEGRO, 5, "{ff0000}Mercado Negro", "{33aa33}Item\t{33aa33}Preco\n\
				    {33ccff}Dinamite\t{ffffff}7000R$\n{33ccff}Maconha\t5$/g\n{33ccff}Lock Pick\t1200$\n{33ccff}Colete 120\t1500$", "Ok", "Sair");
				}
				case 8:{
					MostrarAmmunation(playerid);
				}
				case 9:{
					ShowPlayerDialog(playerid, DIALOG_ESCOLHAS_PLACA, DIALOG_STYLE_LIST,
						"{ff0000}# Opcoes Placa", "Emplacar Veiculo (600$)\nConsultar Placa\nPagar IPVA", "Ok", "Sair");
				}
				case 10:{
					ShowPlayerDialog(playerid, DIALOG_OPCAO_HOSPITAL, 5, "{fff000}# Opcoes Hospital", "{33ccff}Opcao\t{33aa33}Valor\n\
						Se Internar\t{33aa33}500$\n\
						Trocar Sexo\t{33aa33}60000${ff0000}(INDISPONIVEL)\n", "Ok", "Sair");
				}
				case 11:{
					SetPVarInt(playerid, "Menuid", i);
					new contagem[999];
					strcat(contagem, "Acessorio\tValor\tVip\n");
					for(new c; c < sizeof Acessorios; c ++){
						new contagem2[50];
						format(contagem2, sizeof contagem2, "%s\t{33aa33}%dR$\t%s\n", Acessorios[c][AcessorioNome], Acessorios[c][AcessorioPreco], (Acessorios[c][VipAcessorio] ? ("Sim") : ("Nao")));
						strcat(contagem, contagem2);
					}
					ShowPlayerDialog(playerid, DIALOG_COMPRAR_ACESSORIO, 5, "{fff000}Comprando Acessorio", contagem, "Ok", "Sair");
				}
				case 12:{
					//SendClientMessage(playerid, VerdeSamp, fString("* O Numero de sua conta bancaria e %04d.", BancoInfo[playerid][userbanco]));
					ShowPlayerDialog(playerid, DIALOG_CRIARCONTABANCO, DIALOG_STYLE_MSGBOX, "{33ccff}# Criar conta no Banco", "{fff000}Banco Do Brasil\n\n{33ccff}Gostaria de criar uma conta bancaria em nosso Banco?", "Criar", "Negar");
				}
				case 13:{
					SetPVarInt(playerid, "Menuid", i);
					ShowPlayerDialog(playerid, DIALOG_BEBIDAS, 5, "{33ccff}Bebidas Disponiveis", "Nome\tPreco\n{ff8080}Coca-Cola\t{33aa33}6$\n\
						Pepsi\t{33aa33}4$\n\
						{ff8080}Suco De Laranja\t{33aa33}4$\n\
						Suco De Maracuja\t{33aa33}4$\n\
						{ff8080}Agua\t{33aa33}9$\n\
						Cerveja\t{33aa33}12$", "Ok", #);
				}
			}
		}
	}
	return 1;
}
cmd:criarinterior(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new name[30];
	if(sscanf(params, "s[30]", name)) return SendClientMessage(playerid, LIGHTBLUE,"USO: /criarinterior [ nome ]");
	SetPVarString(playerid, "nomedaloja", name);
	new namee[32], strinteriores[600];
	strinteriores[0] = EOS;
	for(new i; i < sizeof interiorinfos; i++){
		format(namee, sizeof namee, "%s\n", interiorinfos[i][InteriorName]);
		strcat(strinteriores, namee);
	}
	ShowPlayerDialog(playerid, DIALOG_CRIANDOINTS, DIALOG_STYLE_LIST, "{fff000}Escolha O Interior desejado", strinteriores, "Ok", "Sair");
	return 1;
}
cmd:menutipos(playerid){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Tipos", "* tipo 1 = 24/7, tipo 2 = Banco, tipo 9 = Emplacamento, 10 = Hospital, 11 = Acessorios, 12 = Criar Conta Banco, 13 = Menu Bebidas\ntipo 3 = Agencia, Tipo 4 = Comidas, Tipo 5 = Habilitacoes, Tipo 6 = Roupas, Tipo 7 = Mercado Negro, tipo 8 = Ammunation", "Ok", #);
	return 1;
}
cmd:specialaction(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/specialaction < 0 - 18 >");
	switch(strval(params)){
		case 0: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		case 1: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DUCK);
		case 2: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DUCK);
		case 3: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
		case 4: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
		case 5: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
		case 6: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
		case 7: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
		case 8: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		case 9: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SITTING);
		case 10: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		case 11: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CUFFED);
		case 12: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
		case 13: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_ENTER_VEHICLE);
		case 14: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_EXIT_VEHICLE);
		case 15: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
		case 16: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
		case 17: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
		case 18: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
		default: return SendClientMessage(playerid, LIGHTBLUE, "/specialaction < 0 - 13 >");
	}
	return 1;
}
cmd:criarmenu(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new tipo;

	if(sscanf(params, "i", tipo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /criarmenu [ tipo ] /menutipos");
	if(tipo == 0 || tipo > 13) return 1;
	new Float:X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	new cd=CriarMenu(playerid, X,Y,Z, tipo);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce criou com sucesso o menu %d.", cd);
	return 1;
}
cmd:idon(playerid, params[]){
	new id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, LIGHTBLUE, "/idon [ nome do jogador ]");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador nao esta online.");
	new str[144];
	format(str, sizeof str, "%s - Samp id %d, id fixo %d.", nome(id), id, PlayerInfo[id][IDFixo]);
	SendClientMessage(playerid, Roxoeu, str);
	return 1;
}
cmd:id(playerid, params[])
{
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /id [ nome do jogador ]");
	new Query[90];
	mysql_format(Dados, Query, sizeof(Query), "SELECT `Nome`, `userid` FROM `Contas` WHERE `Nome` = '%s'", params);
	mysql_tquery(Dados, Query, "PlayerIDSearch", "is",playerid, params);
	return 1;
}
function PlayerIDSearch(playerid, const params[]){
	new rows;
	cache_get_row_count(rows);
	if(rows > 0){
		new idf, str[150];
		cache_get_value_name_int(0, "userid", idf);
	    format(str, sizeof(str), "[%s{ffffff}]%s (%d) %d - Fixo", PegarOnline(params),params, PegarId(params), idf);
		SendClientMessage(playerid, -1, str);
	}
	else
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Esta conta nao existe.");

	return 1;
}
PegarId(const id[])
{
	foreach(new i: Player){
	    if(!strcmp(nome(i), id, false, 24)){
	        return i;
		}
	}
	return 0;
}
PegarOnline(const nomeon[])
{
	new str[17] = "{FF0000}OFFLINE";
	foreach(new i: Player){
	    if(!strcmp(nome(i), nomeon, false, 24)){
	        str = "{33AA33}ONLINE";
		}
	}
	return str;
}
cmd:tv(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 1) return 1;
	if(!EmTv[playerid]){
		if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /tv [ id do jogador ]");
		new id = strval(params);
	    new uva = -1;
	    foreach(new i: Player){
			if(id == PlayerInfo[i][IDFixo]){
				id = i;
				uva = i;
				break;
			}
		}
		if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
		TogglePlayerSpectating(playerid, true);
		SetPlayerInterior(playerid, GetPlayerInterior(id));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));

		if(!IsPlayerInAnyVehicle(id)) PlayerSpectatePlayer(playerid, id);
		else
			PlayerSpectateVehicle(playerid, GetPlayerVehicleID(id));
			//, mode = SPECTATE_MODE_NORMAL)
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta assistindo este jogador.");
        EmTv[playerid] = true;
	}
	else{
	    EmTv[playerid] = false;
	    TogglePlayerSpectating(playerid, false);
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce parou de assistir o jogador.");
	}
	return 1;
}
cmd:tra(playerid){
	if(PlayerInfo[playerid][Admin] < 1) return 1;
	switch(PlayerInfo[playerid][Admin]){
		case 1..4:{
			if(!TrabalhoStaff[playerid]){
	            SetPlayerColor(playerid, VerdeSamp);
	            SetPlayerSkin(playerid, 217);
	            TrabalhoStaff[playerid] = true;
	            SetPlayerHealth(playerid, 99999);
	            SendClientMessage(playerid, Amarelo, "|INFO| Voce entrou em modo de trabalho.");
			}
			else{
			    TrabalhoStaff[playerid] = false;
				SetPlayerColor(playerid, -1);
				SpawnPlayer(playerid);
				SetPlayerHealth(playerid, 100);
				SendClientMessage(playerid, Amarelo, "|INFO| Voce saiu do modo de trabalho.");
			}
		}
		case 5..11:{
			if(!TrabalhoStaff[playerid]){
	            SetPlayerColor(playerid, Rosa);
	            SetPlayerSkin(playerid, 217);
	            TrabalhoStaff[playerid] = true;
	            SetPlayerHealth(playerid, 99999);
	            SendClientMessage(playerid, Amarelo, "|INFO| Voce entrou em modo de trabalho.");
			}
			else{
			    TrabalhoStaff[playerid] = false;
				SetPlayerColor(playerid, -1);
				SpawnPlayer(playerid);
				SetPlayerHealth(playerid, 100);
				SendClientMessage(playerid, Amarelo, "|INFO| Voce saiu do modo de trabalho.");
			}
		}
	}
	return 1;
}
cmd:avisars(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 3) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /anunciostaff [ texto ]");
	new str[144];
	format(str, sizeof str, "=- -= =- -= =- -= =- -= =- -= =- -= ( Aviso %s ) =- -= =- -= =- -= =- -= =- -= =- -=", StaffCargo(PlayerInfo[playerid][Admin]));
    SendClientMessageToAll(ColorStaff(PlayerInfo[playerid][Admin]), str);
    format(str, sizeof str, "%s -> %s.", nome(playerid), params);
    SendClientMessageToAll(ColorStaff(PlayerInfo[playerid][Admin]), str);
	return 1;
}
ColorStaff(a){
	switch(a){
		case 1..2: return 0xFF00F9FF;
		case 3..4: return 0xFF00A1FF;
		case 5..6: return 0xDA004EFF;
		case 7..8: return 0x0006FFFF;
		case 9..10: return 0x0007ffff;
		case 11: return COR_SCRIPTER;
	}
	return 0xFFFFFFFF;
}
StaffCargo(a){
	new admincarg[13 + 11] = "Nenhum";
	switch(a){
		case 1..2: admincarg = "{FF00F9}Ajudante";
		case 3..4: admincarg = "{FF00A1}Admin";
		case 5..6: admincarg = "{DA004E}Supervisor";
		case 7..8: admincarg = "{0006FF}Coordenador";
		case 9..10: admincarg = "{0007ff}Idealizador";
		case 11: admincarg = "{0006FF}Desenvolvedor";
	}
	return admincarg;
}
cmd:resetarmochila(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 7) return 1;
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /resetarmochila [ id ]");
	new id = strval(params);
	new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o id de um jogador offline.");
	if(PlayerInfo[id][Admin] > PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Nivel admin deste jogador e maior que o seu, Voce nao pode resetar ele.");
	ResetarMochila(id);
	new str[90];
	format(str, sizeof str, "[STAFF] %s resetou a sua mochila.", nome(playerid)); 
	SendClientMessage(id, Rosa, str);

	format(str, sizeof str, "|INFO| Voce resetou com sucesso a mochila do jogador %s.", nome(id));
	SendClientMessage(playerid, Rosa, str);
	return 1;
}
cmd:soltar(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 4) return 1;
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /soltar [ id ]");
	new id = strval(params);
	//if(PlayerInfo[id][Prisao] < 1 && PlayerInfo[id][CadeiaStaff] > 0 || PlayerInfo[id][CadeiaStaff] < 1 && PlayerInfo[id][Prisao] > 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta preso.
   	new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(PlayerInfo[id][CadeiaStaff] < 1 && PlayerInfo[id][Prisao] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta preso.");
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta conectado.");
	new str[144];
	if(PlayerInfo[id][CadeiaStaff] > 0){
	    PlayerInfo[id][CadeiaStaff] = 0;
	    format(str, sizeof str, "[STAFF] %s soltou voce da cadeia STAFF.", nome(playerid));
	    SendClientMessage(id, LIGHTBLUE, str);
	    format(str, sizeof str, "[STAFF] %s soltou o jogador %s(%d) da cadeia STAFF.", nome(playerid), nome(id), id);
	    SendClientMessageToAll(Rosa, str);
	    SetPlayerVirtualWorld(id, 0);
	    SpawnPlayer(id);
	    SetPlayerHealth(id, 100);
	}
	else if(PlayerInfo[id][Prisao] > 0){
	    PlayerInfo[id][Prisao] = 0;
	    SetPlayerHealth(id, 100);
	    format(str, sizeof str, "[STAFF] %s soltou voce da prisao.", nome(playerid));
	    SendClientMessage(id, LIGHTBLUE, str);
	    format(str, sizeof str, "[STAFF] %s soltou o jogador %s(%d) da prisao.", nome(playerid), nome(id), id);
	    SendClientMessageToAll(Rosa, str);
	    SetPlayerVirtualWorld(id, 0);
	    SetPlayerPosEx(id, 876.2717,2259.7966,10.9103);
	}
	return 1;
}
cmd:a(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] <= 0) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /a [ texto ]");
	new str[144];
	format(str, sizeof(str), "[CHAT-STAFF][%d]%s diz: %s", PlayerInfo[playerid][IDFixo], nome(playerid), params);
	AdminMessage(Rosa, str);
	return 1;
}
cmd:gmx(playerid)
{
	if(PlayerInfo[playerid][Admin] < 7) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar o comando.");
	new str[61];
	format(str, sizeof(str), "%s acaba de dar GMX no servidor.", nome(playerid));
	SendClientMessageToAll(Rosa, str);
	SetTimerEx("exitGamemode", 5000, false, "i", playerid);
	return 1;
}
cmd:kickartodos(playerid){
	if(PlayerInfo[playerid][Admin] < 10) return 1;
	PC_EmulateCommand(playerid, "/lmc");
	SendClientMessageToAll(LIGHTBLUE, "|INFO| Admin %s kickou todos os jogadores do servidor.", nome(playerid));
	KickarTodos(playerid);
	return 1;
}
KickarTodos(playerid){
	foreach(new i: Player){
		if(i != playerid)
			Kick(i);
	}
}
cmd:rea(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 3) return 1;
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /rea(nimar) ( id fixo)");
	new id = strval(params);
	GetPlayerId(id);
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTRED, "|INFO| Este jogador nao esta conectado.");
	if(!PlayerInfo[id][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta ferido.");
	SendClientMessageToAll(LIGHTBLUE, "* Admin %s reanimou %s.", nome(playerid), nome(id));
	SendClientMessage(id, LIGHTBLUE, "|INFO| O Admin %s reanimou voce.", nome(playerid));
	PlayerInfo[id][Ferido] = false;
	ClearAnimations(id);
	return 1;
}
stock IsPlayerPreso(playerid){
	if(PlayerInfo[playerid][CadeiaStaff] > 0 || PlayerInfo[playerid][Prisao] > 0)
		return true;
	return false;
}
cmd:meutempo(playerid){
	if(PlayerInfo[playerid][CadeiaStaff] < 1 && PlayerInfo[playerid][Prisao] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta preso.");
	new str[179];
	if(PlayerInfo[playerid][CadeiaStaff] > 0){
		format(str, sizeof str, "%s\n\n{ffffff}Tempo De Prisao: {33ccff}%d\n{ffffff}Motivo: {ff0000}%s",
			nome(playerid), PlayerInfo[playerid][CadeiaStaff], PlayerInfo[playerid][MotivoCadeia]);
		ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Informacoes Prisao", str, "Ok", #);
		//format(str, sizeof str, "[Cadeia]: Voce ainda tem %d segundos de cadeia, Motivo: %s.", PlayerInfo[playerid][CadeiaStaff], PlayerInfo[playerid][MotivoCadeia]);
		SendClientMessage(playerid, Amarelo, str);
    }
    else if(PlayerInfo[playerid][Prisao] > 0){
    	format(str, sizeof str, "[Cadeia]: Voce ainda tem %d segundos de prisao.", PlayerInfo[playerid][Prisao]);
    	SendClientMessage(playerid, Amarelo, str);
	}
	return 1;
}
cmd:revistar(playerid, params[]){
    if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	if(!Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /revistar [ id do jogador ]");
	new id = strval(params), Float: X, Float: Y, Float: Z;
	
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, -1, "* Este ID e invalido.");
	GetPlayerPos(id, X, Y, Z);
	if(!ISP(playerid, 4.0, X, Y, Z)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta perto do jogador.");
	new str[30] = "{FFF000}Armado: {ff0000}Nao", str2[444], arma[16], mun[16];
	format(str2, sizeof(str2), "** %s esta revistando alguem.", nome(playerid));
	MensagemLocal(30.0, playerid, Roxoeu, str2, true);
	format(str2, sizeof(str2), "{fff000}Habilitacoes\n\n\
	{ffffff}Carro '%s'\n\
	{ffffff}Moto '%s'\n\
	{ffffff}Aviao '%s'\n\n\
	{fff000}Ilegais\n\
	{ffffff}Mandato '%s'\n\
	{33ccff}Use /rilegal para limpar o jogador\n", PegarCarteira(id, 1), PegarCarteira(id, 2), PegarCarteira(id, 3), TipoFicha(id));
	for(new i; i<12; i++){
		GetPlayerWeaponData(id, i, arma[i], mun[i]);
		if(arma[i] != 0){
		    format(str, sizeof(str), "{FFF000}Armado: {33aa33}Sim\n");
		    strcat(str2, str);
		    break;
		}
	}
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Informacoes Do Jogador", str2, "Ok", "");
	return 1;
}
Numero(const param[]){
	if(isnull(param) || !Number(param))
	    return true;
	return false;
}
cmd:rilegal(playerid, params[]){
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /rilegal [ id do jogador ]");
	new id = strval(params), Float: X, Float: Y, Float: Z;
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	GetPlayerPos(id, X, Y, Z);
	if(!ISP(playerid, 4.0, X, Y, Z)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta muito longe deste jogador.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta conectado.");
	RemoverItem(id, DINAMITE);
	RemoverItem(id, MACONHA);
	RemoverItem(id, DINHEIRO_FLUTUANTE_BANDIDO);
	for(new d = 700; d < 789; d++){
		RemoverItem(id, d);
	}
	new str[76];
	format(str, sizeof(str), "** %s removeu os ilegais de %s.", nome(playerid), nome(id));
	MensagemLocal(25.0, playerid, -1, str, false);
	return 1;
}
RemoverItem(playerid, item){

	for(new i; i<32; i++){
	    if(ItemInfo[playerid][i][Item] != NADA && ItemInfo[playerid][i][Item] == item){
	        ItemInfo[playerid][i][Item] = NADA;
	        ItemInfo[playerid][i][Quantia] = 0;
		}
	}
	return 0;
}
cmd:algemar(playerid, params[]){
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode algemar dentro de um veiculo.");
	if(!Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /algemar [ id ]");

	new id = strval(params);
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	new Float: pos[3];
	GetPlayerPos(id, pos[0], pos[1], pos[2]);
	if(!ISP(playerid, 3.4, pos[0], pos[1], pos[2])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar perto do jogador.");
	new str[90];
	if(!Algemado[id]){
		SetPlayerSpecialAction(id, SPECIAL_ACTION_CUFFED);
		format(str, sizeof str, "* %s algemou %s.", nome(playerid), nome(id));
		MensagemLocal(25.0, playerid, -1, str, false);
		TogglePlayerControllableEx(id, false);
		Algemado[id] = true;
	}
	else{
		SetPlayerSpecialAction(id, SPECIAL_ACTION_NONE);
		format(str, sizeof str, "* %s desalgemou %s.", nome(playerid), nome(id));
		MensagemLocal(25.0, playerid, -1, str, false);
		TogglePlayerControllableEx(id, true);
		Algemado[id] = false;
	}
	return 1;
}
cmd:tabelamulta(playerid){
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando.");
	new str[439];
	strcat(str, "{fff000}Multa\t{33aa33}Valor\n");
	for(new i; i < sizeof MultaInfo; i++){
		new str2[50];
		format(str2, sizeof str2, "%s\t%d\n", MultaInfo[i][MulNome], MultaInfo[i][MulMoney]);
		strcat(str, str2);
	}
	ShowPlayerDialog(playerid, DIALOG_INUTIL, 5, "{33ccff}# Tabela De Multas", str, "Ok", #);
	return 1;
}
cmd:tabelaau(playerid){
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando.");
	new str[269];
	strcat(str, "{fff000}Nome\t{33ccff}Estrelas\n");
	for(new i; i < sizeof AtuInfo; i++){
		new str2[30];
		format(str2, sizeof str2, "%s\t%d\n", AtuInfo[i][AutNome], AtuInfo[i][AutNivel]);
		strcat(str, str2);
	}
	ShowPlayerDialog(playerid, DIALOG_INUTIL, 5, 
		"{fff000}# Tabela De Autuacoes", str, "Ok", #);
	return 1;
}
cmd:multar(playerid, params[]){
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	new id, motivo[32];
	if(sscanf(params, "is[32]", id, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /multar [ id ] [ motivo ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta offline.");
	new idm = -1;
	for(new i; i<sizeof MultaInfo; i++){
		if(strfind(MultaInfo[i][MulNome], motivo, true) != -1){
			idm = i;
		}
	}

	if(idm == -1) 
		return SendClientMessage(playerid, LIGHTBLUE,"* Voce digitou um motivo inexistente, consulte o /tabelamulta.");

	if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode se multar!");
	if(PlayerInfo[id][Org] == PlayerInfo[playerid][Org]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode multar um jogador da sua propria organizacao.");
	new Float: x, Float: y, Float: z;
	GetPlayerPos(id, x, y, z);
	if(!ISP(playerid, 4.0, x, y, z)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar perto deste jogador.");
	new str[160];
	format(str, sizeof str, "Policial %s multou o jogador %s por %s.", nome(playerid), nome(id), MultaInfo[idm][MulNome]);
	MensagemLocal(35.0, playerid, Roxoeu, str, false);
	AdicionarLogs(str);
	format(str, sizeof str, "Voce foi multado em %dR$.", MultaInfo[idm][MulMoney]);
	SendClientMessage(id, LIGHTBLUE, str);
	GivePlayerCash(id, -MultaInfo[idm][MulMoney]);

    OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] += MultaInfo[idm][MulMoney] / 2;
    format(str, sizeof str, "Org | %s multou alguem e %d$ foi adicionado no cofre.",
    	nome(playerid), MultaInfo[idm][MulMoney]);
    MessageOrg(PlayerInfo[playerid][Org], LIGHTBLUE, str);
    return 1;
}

cmd:autuar(playerid, params[]){
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	new id, motivo[32];
	if(sscanf(params, "is[32]", id, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /autuar [ id ] [ motivo ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta offline.");
	new idm = -1;
	for(new i; i<sizeof AtuInfo; i++){
		if(strfind(AtuInfo[i][AutNome], motivo, true) != -1){
			idm = i;
		}
	}

	if(idm == -1) 
		return SendClientMessage(playerid, LIGHTBLUE,"* Voce digitou um motivo inexistente, consulte o /tabelaau.");

	new str[144];
	format(str, sizeof str, "[Autuado]: %s aumentou seu nivel de procurado. ('%s')", nome(playerid), AtuInfo[idm][AutNome]);
	SendClientMessage(id, LIGHTBLUE, str);

	format(str, sizeof str, "[Autuado]: %s foi autuado com sucesso.", nome(id));
    SendClientMessage(playerid, LIGHTBLUE, str);

    SetPlayerWantedLevel(id, GetPlayerWantedLevel(id)+AtuInfo[idm][AutNivel]);
    return 1;
}

cmd:gov(playerid, params[]){
	if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 4) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /gov [ texto ]");
	new str[156];
	format(str, sizeof str, "{%s}_______________________________[Anuncio %s]_______________________________", OrgGm[PlayerInfo[playerid][Org]][HexColor], OrgGm[PlayerInfo[playerid][Org]][OrgNome]);
	SendClientMessageToAll(-1, str);
	format(str, sizeof str, "%s(%d): {%s}%s.", nome(playerid), PlayerInfo[playerid][IDFixo], OrgGm[PlayerInfo[playerid][Org]][HexColor], params);
	SendClientMessageToAll(-1, str);
	return 1;
}
cmd:seq(playerid, params[]){
	if(PlayerInfo[playerid][Org] == 0 || !IsBandido(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	new id = strval(params);
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /seq [ id do jogador ]");
	if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode se arrastar.");
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 482) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar em uma van Burrito.");
    if(OrgCarro[GetPlayerVehicleID(playerid)] != PlayerInfo[playerid][Org]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Esta van nao e de sua org.");
	if(IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Jogador ja esta em um veiculo."); //nome(id));
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o id de um jogador offline.");
	if(IsPlayerInVehicle(id, GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador ja esta em sei veiculo.");
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(!ISP(id, 5.0,X, Y, Z)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta muito longe!");
	PutPlayerInVehicle(id, GetPlayerVehicleID(playerid), 3);
	TogglePlayerControllableEx(id, false);
	Sequestrado[id] = true;
	new str[144];
	format(str, sizeof(str), "** %s sequestrou o cidadao %s.", nome(playerid), nome(id));
	MensagemLocal(25.0, playerid, -1, str, false);

	format(str, sizeof str, "|INFO| Voce foi sequestrado por %s.", nome(playerid));
	SendClientMessage(id, LIGHTBLUE, str);
	return 1;
}
cmd:ejetar(playerid, params[]){
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta em um veiculo.");
	new id = strval(params);
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /ejetar [ id do jogador ]");
	if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode se arrastar.");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o id de um jogador offline.");
	if(!IsPlayerInVehicle(id, GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta em seu veiculo.");
	Sequestrado[id] = false;
	Arrastado[id] = false;
	RemovePlayerFromVehicle(id);
	TogglePlayerControllableEx(id, true);
	new str[98];
	format(str, sizeof str, "%s te removeu do veiculo.", nome(playerid));
	SendClientMessage(id, LIGHTBLUE, str);
	format(str, sizeof str, "Voce removeu %s do seu veiculo.", nome(id));
	SendClientMessage(playerid, LIGHTBLUE, str);
	return 1;
}
cmd:repararcaixa(playerid, params[]){
	if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	foreach(new i: B_Caixas){
	    if(ISP(playerid, 2.3, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ])){
	        if(!InfoCaixa[i][CaixaQuebrado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este caixa nao esta quebrado.");
	        if(ReparandoCaixa[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta reparando um caixa.");
	        ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
	        ReparandoCaixa[playerid] = true;
			GameTextForPlayer(playerid, "~R~Reparando Caixa...", 8000, 1);
			TimerRepararcaixa[playerid] = SetTimerEx("repararcaixa", 8000, false, "ii", playerid, i);
			break;
		}
	}
	return 1;
}
cmd:ar(playerid, params[]){
	if(PlayerInfo[playerid][Org] == 0 || !IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	new id = strval(params);
	if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
	if(Numero(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /ar [ id do jogador ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode se arrastar.");
	if(!IsViatura(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, LIGHTBLUE, "Voce precisa estar em uma viatura.");
	if(IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Jogador ja esta em um veiculo.");// nome(id));
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o id de um jogador offline.");
	if(IsPlayerInVehicle(id, GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador ja esta em seu veiculo.");
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(!ISP(id, 5.0,X, Y, Z)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta muito longe!");
	PutPlayerInVehicle(id, GetPlayerVehicleID(playerid), 3);
	TogglePlayerControllableEx(id, false);
	Arrastado[id] = true;
	new str[144];
	format(str, sizeof(str), "** %s arrastou o cidadao %s para seu veiculo.", nome(playerid), nome(id));
	MensagemLocal(25.0, playerid, -1, str, false);

	format(str, sizeof str, "|INFO| Voce foi arrastado para o veiculo pelo jogador %s.", nome(playerid));
	SendClientMessage(id, LIGHTBLUE, str);
	return 1;
}
cmd:ab(playerid){
	if(PlayerInfo[playerid][Org] == 0) return 1;
	if(IsPolice(PlayerInfo[playerid][Org])){
		new str[89];	
		format(str, sizeof(str), "{%s}(%d) %s! RENDA-SE AGORA!",OrgGm[ PlayerInfo[playerid][Org]][HexColor], PlayerInfo[playerid][IDFixo], OrgGm[PlayerInfo[playerid][Org]][OrgNome]);
		MensagemLocal(25.0, playerid, Roxoeu, str, false);
	}
	if(IsBandido(PlayerInfo[playerid][Org])){
		new str[89];
		format(str, sizeof(str), "{%s}(%d) PERDEU P**RA SE RENDE!",OrgGm[ PlayerInfo[playerid][Org]][HexColor], PlayerInfo[playerid][IDFixo]);
		MensagemLocal(25.0, playerid, Roxoeu, str, false);
	}
	return 1;
}

cmd:prender(playerid, params[]){
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| A Sua organizacao nao e militar.");
	if(ISP(playerid, 4.0, 876.2717,2259.7966,10.9103)){

		if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");
		if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /prender [ id ] * o tempo do jogador e contado pelas estrelas.");
		if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /prender [ id ] * o tempo do jogador e contado pelas estrelas.");
		new Float: X, Float: Y, Float: Z, id = strval(params);
	    new uva = -1;
	    foreach(new i: Player){
			if(id == PlayerInfo[i][IDFixo]){
				id = i;
				uva = i;
				break;
			}
		}
		if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
		GetPlayerPos(id, X, Y, Z);
		if(!ISP(playerid, 5.0, X, Y, Z)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce esta muito longe do jogador para prender ele.");
		if(GetPlayerWantedLevel(id) < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador possui nenhum mandato.");
		PlayerInfo[id][Prisao] = 120 * GetPlayerWantedLevel(id);
		TogglePlayerControllableEx(id, false);
		Arrastado[id] = false;
		PlayerInfo[id][VezesPreso] ++;
		new prisaoaleatoria = sizeof infoPrisoes;
		PlayerInfo[id][TipoPrisao] = random(prisaoaleatoria);
		SetPlayerPosEx(id, infoPrisoes[PlayerInfo[id][TipoPrisao]][PrisaoX],infoPrisoes[PlayerInfo[id][TipoPrisao]][PrisaoY],infoPrisoes[PlayerInfo[id][TipoPrisao]][PrisaoZ]);
		GameTextForPlayer(id, "~R~BEM VINDO A~N~~Y~PRISAO", 5000, 1);
		SendClientMessage(id, LIGHTBLUE, "[Dica] Veja seu tempo preso em '/meutempo'");
		new Query[90];
		format(Query, sizeof Query, "%s prendeu %s (%s)", nome(playerid), nome(id), OrgGm[ PlayerInfo[playerid][Org] ][Sigla]);
		AdicionarLogs(Query);
		new str[144];
		PC_EmulateCommand(id, "anim");
		format(str, sizeof str, "{%s}%s acaba de prender o cidadao %s.",OrgGm[PlayerInfo[playerid][Org]][HexColor], OrgGm[PlayerInfo[playerid][Org]][OrgNome], nome(id));
		SendClientMessageToAll(-1, str);
		SetTimerEx("descongelar", 4000, false, "i", id);
		SetPlayerWantedLevel(id, 0);
	    new org = PlayerInfo[ playerid ][Org];
	    OrgInfo[org][OrgCofre] += 2000;
	    format(str, sizeof str, "Org | %s prendeu um bandido e 2000$ foi adicionado no cofre.", nome(playerid));
	    MessageOrg(PlayerInfo[playerid][Org], LIGHTBLUE, str);
	}
	return 1;
}
cmd:cadeia(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 3) return 1;
	new id, tempo, motivo[32];
	if(sscanf(params, "iis[32]", id, tempo, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /cadeia [ id ] [ tempo em minutos ] [ motivo ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta offline.");
 	if(PlayerInfo[id][Prisao] > 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta na prisao militar! Solte ele antes.");
	if(PlayerInfo[id][Admin] > PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode prender um admin maior que seu cargo.");
	SetPlayerVirtualWorld(id, 1);
	PlayerInfo[id][CadeiaStaff] = 60*tempo;
	format(PlayerInfo[id][MotivoCadeia], 32, motivo);
	TogglePlayerControllableEx(id, false);
	SetPlayerPosEx(id, 228.8630,-2024.9109,149.0989);
	GameTextForPlayer(id, "~R~BEM VINDO A~n~~Y~CADEIA ADMIN", 5000, 3);
	SendClientMessage(id, LIGHTBLUE, "[Dica] Veja seu tempo preso em '/meutempo'");
	new str[144];
	format(str, sizeof(str), "STAFF %s prendeu o jogador %s(%d) por %d minutos. ( %s )", nome(playerid), nome(id), id, tempo, motivo);
	SendClientMessageToAll(LIGHTBLUE, str);
	SetTimerEx("descongelar", 4000, false, "i", id);
	return 1;
}
cmd:agencadeiaid(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 3) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando.");
	new id, tempo, motivo[25];
	if(sscanf(params, "iis[25]", tempo, id, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "/agencadeiaid [ minutos ] [ id ] [ motivo ]");
	//if(IsPlayerOnline(nick)) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador ja esta online.");
	new teste = -1;
	foreach(new i: Player){
		if(PlayerInfo[i][IDFixo] == id){
			SendClientMessage(playerid, LIGHTBLUE, "Este jogador esta online!");
			teste = i;
			break;
		}
	}
	if(teste != -1) return 1;
	new Query[100];
	mysql_format(Dados, Query, sizeof Query, "SELECT `userid` FROM `Contas` WHERE `userid`  = '%d'", id);
	mysql_tquery(Dados, Query, "AgendarCadeiaIDOff", "isi",playerid, tempo, motivo, id);
	return 1;
}
function AgendarCadeiaIDOff(playerid, tempo, const motivo[], id){
	new rows;
	cache_get_row_count(rows);
	if(rows){
		new Query[150];
		mysql_format(Dados, Query, sizeof Query, "UPDATE `Contas` SET `CadeiaStaff` = '%d', `MotivoCadeia` = '%s' WHERE `userid` = '%d'", 60 * tempo, motivo, id);
		mysql_tquery(Dados, Query);
		format(Query, sizeof Query, "STAFF: %s agendou %d minutos de cadeia para o id %d | %s",
			nome(playerid), tempo, id, motivo);
		SendClientMessageToAll(ColorStaff(PlayerInfo[playerid][Admin]), Query);
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "* Erro! Esta conta não existe no banco de dados.");

}
function AgendarCadeiaNameOff(playerid, tempo, const motivo[], const nick){
	new rows;
	cache_get_row_count(rows);
	if(rows){
		new Query[150];
		mysql_format(Dados, Query, sizeof Query, "UPDATE `Contas` SET `CadeiaStaff` = '%d', `MotivoCadeia` = '%s' WHERE `Nome` = '%d'", 60 * tempo, motivo, nick);
		mysql_tquery(Dados, Query);
		format(Query, sizeof Query, "STAFF: %s agendou %d minutos de cadeia para %s | %s",
			nome(playerid), tempo, nick, motivo);
		SendClientMessageToAll(ColorStaff(PlayerInfo[playerid][Admin]), Query);
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "* Erro! Esta conta nao existe no banco de dados.");

}
cmd:agencadeia(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 3) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando.");
	new nick[24], tempo, motivo[25];
	if(sscanf(params, "is[24]s[25]", tempo, nick, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "/agencadeia [ minutos ] [ nome ] [ motivo ]");
	if(IsPlayerOnline(nick)) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador ja esta online.");
	new Query[100];
	mysql_format(Dados, Query, sizeof Query, "SELECT `Nome` FROM `Contas` WHERE `Nome`  = '%s'", nick);
	mysql_tquery(Dados, Query, "AgendarCadeiaNameOff", "iiss",playerid, tempo, motivo, nick);
	return 1;
}
cmd:convidar(playerid, params[])
{
	if(PlayerInfo[playerid][Cargo] < 8) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Voce precisa ter cargo 8.");
	new id;
	if(OrgInfo[PlayerInfo[playerid][Org]][Vagas] == 0) return SendClientMessage(playerid,LIGHTBLUE, "|INFO| Organizacao cheia! 30/30.");
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /convidar [ id ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta offline.");
	if(id == playerid) return 1;
	if(PlayerInfo[id][Nivel] < 2) return SendClientMessage(playerid, LIGHTBLUE, "* Jogador precisa ter nivel 2 ou maior para estar em uma org.");
	if(PlayerInfo[id][Org] == PlayerInfo[playerid][Org]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Este jogador ja e desta organizacao.");
	if(PlayerInfo[id][Org] != 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Este jogador ja esta em uma organizacao.");
	SetPVarInt(id, "OrgConvidou", PlayerInfo[playerid][Org]);
	SetPVarInt(id, "quemconvidouorg", playerid);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce enviou o pedido para o jogador.");
	new str[144];
	format(str, sizeof(str), "{33ccff}%s esta te convidando para a organizacao: {FFFFFF}%s\n{ff0000}Voce deseja aceitar o pedido?", nome(playerid), OrgGm[PlayerInfo[playerid][Org]][OrgNome]);
	ShowPlayerDialog(id, DIALOG_CONVIDARORG, DIALOG_STYLE_MSGBOX, "{fff000}Solicitacao De Entrada", str, "{33aa33}Sim", "{ff0000}Nao");
	return 1;
}
cmd:chatlider(playerid, params[]){
	if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 9) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/chatlider  [ texto ]");
	new str[180];
	foreach(new i: Player){
		if(PlayerInfo[i][Org] != 0 && PlayerInfo[i][Cargo] >= 9){
			format(str, sizeof str, "%s(%s)%s diz: %s.", OrgGm[ PlayerInfo[playerid][Org]][Sigla], 
				CargoOrgPCargo(PlayerInfo[playerid][Org], PlayerInfo[playerid][Cargo]), nome(playerid), params);
			SendClientMessage(i, LIGHTBLUE, str);
		}
	}
	return 1;
}
cmd:r(playerid, params[])
{
	if(PlayerInfo[playerid][Org] == 0) return 1;
	if(IsPlayerPreso(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso preso.");
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando, voce esta ferido!");
	if(!TemItem(playerid, RADINHO)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ter um RADINHO.");
	if(IsPolice(PlayerInfo[playerid][Org]) && !Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE,"* Voce precisa estar fardado.");// = true;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /r [ texto ]");
	new str[170];
	format(str, sizeof(str), "{%s}%s %s(%d) diz: %s", OrgGm[PlayerInfo[playerid][Org]][HexColor],CargoOrg(playerid), nome(playerid), PlayerInfo[playerid][IDFixo],params);
	MessageOrg(PlayerInfo[playerid][Org], -1, str);
	new st[60];
	format(st, 60, "** %s falou algo no radio.", nome(playerid));
	MensagemLocal(30.0, playerid, Roxoeu, st, true);
	return 1;
}
cmd:medemitir(playerid)
{
	if(PlayerInfo[playerid][Org] == 0) return 1;
	new str[150];
	format(str, sizeof(str), "{33ccff}Voce tem certeza de que deseja sair da organizacao {%s}%s{33ccff}?",OrgGm[PlayerInfo[playerid][Org]][HexColor], OrgGm[PlayerInfo[playerid][Org]][OrgNome]);
	ShowPlayerDialog(playerid, DIALOG_MEDEMITIR, DIALOG_STYLE_MSGBOX, "{fff000}Deseja se demitir?", str, "{33aa33}Sim", "{ff0000}Nao");
	return 1;
}
cmd:promover(playerid, params[]){
	if(PlayerInfo[playerid][Cargo] < 10 || PlayerInfo[playerid][Org] == 0) return 1;
	new id, cargo;
	if(sscanf(params, "ii", id, cargo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /promover [ id ] [ cargo ]");
	if(cargo <= 0 || cargo > 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Deve ser maior que 0 e menor que 10!");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}	
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta conectado.");
	if(PlayerInfo[id][Org] != PlayerInfo[playerid][Org]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| A Organizacao deste jogador nao e a mesma que a sua.");
	new str[79];
	format(str, sizeof str,"PROMOCAO: %s promoveu voce para o cargo %d.", nome(playerid), cargo); 
	SendClientMessage(id, Amarelo, str);
	PlayerInfo[id][Cargo] = cargo;
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Jogador promovido com sucesso.");
	return 1;
}
cmd:demitir(playerid, params[])
{
	if(PlayerInfo[playerid][Cargo] != 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Voce precisa ser Lider!");
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /demitir [ id ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| - O Jogador precisa estar online.");
	if(PlayerInfo[id][Org] != PlayerInfo[playerid][Org]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Jogador precisa ser da sua org.");
	if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Voce nao pode fazer isso.");
	if(PlayerInfo[id][Cargo] >= PlayerInfo[playerid][Cargo]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Cargo deste jogador e maior que o seu!");
	OrgInfo[PlayerInfo[playerid][Org]][Vagas] ++;
	new str[144];
	format(str, sizeof(str), "Lider %s demitiu %s.", nome(playerid), nome(id));
	MessageOrg(PlayerInfo[playerid][Org], LIGHTBLUE, str);
	PlayerInfo[id][Org] = 0;
	PlayerInfo[id][Cargo] = 0;
	SendClientMessage(id, LIGHTBLUE, "|INFO|: Voce foi demitido da sua organizacao e voltou para o spawn.");
	SpawnPlayer(id);
	SalvarOrg(PlayerInfo[playerid][Org]);
	return 1;
}

cmd:criarcasa(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new preco, vip;
	if(sscanf(params, "ii", preco, vip)) return SendClientMessage(playerid, -1, "USO: /criarcasa [ preco ] [ nivel vip ]");
	if(preco <= 0 || preco > 1000000000) return SendClientMessage(playerid, -1, "Somente entre 1 e 100 milhoes.");
	SetPVarInt(playerid, "Preco", preco);
	SetPVarInt(playerid, "VipFromHouse", vip);
	new namee[32], string[500];
	for(new i; i < sizeof interiorhouses; i++){
		format(namee, sizeof namee, "Casa %d\n", i);
		strcat(string, namee);
	}
	ShowPlayerDialog(playerid, DIALOG_CRIARCASA, DIALOG_STYLE_LIST, "{fff000}Cria??§ao De Casas", string, "Ok", "Sair");
	return 1;
}
cmd:trancarcasa(playerid){
	foreach(new i: B_House){
	    if(IsPlayerInRangeOfPoint(playerid, 1.2, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]) && DonoDaCasa(playerid, i)){
			if(InfoCasa[i][Trancada] == 1){
			    InfoCasa[i][Trancada] = 0;
				GameTextForPlayer(playerid, "~G~Destrancada", 1000, 1);
			}
			else{
				InfoCasa[i][Trancada] = 1;
				GameTextForPlayer(playerid, "~G~Trancada", 1000, 1);
			}
		}
	}
	return 1;
}
cmd:desalugar(playerid){
	new achado = -1;
	foreach(new i: B_House){
	    if(IsPlayerInRangeOfPoint(playerid, 1.2, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ])){	
	    	if(DonoDaCasa(playerid, i)) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode alugar a sua propria casa.");
	    	if(!AlugouCasa(playerid, i)) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao alugou esta residencia.");
	    	for(new ck; ck < 4; ck++){
	    		if(!strcmp( InfoAluguel[i][ck][AluguelNome], nome(playerid))){
		    		achado = ck;
				}
	    	}
	    	if(achado == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao alugou esta casa.");
	    	format(InfoAluguel[i][achado][AluguelNome], 24, "Ninguem");
	    	SendClientMessage(playerid, LIGHTBLUE, "Voce desalugou esta residencia.");
	    }
	}
	return 1;
}
//graças a deus ????????????????????
stock AlugouCasa(playerid, casa){
	for(new i; i < 4; i++){
		if(!isnull(InfoAluguel[casa][i][AluguelNome]) && !strcmp(nome(playerid), InfoAluguel[casa][i][AluguelNome]))return true;
	}
	return false;
}
cmd:listamoradores(playerid){
	new str[24 * 4 + 12];
	strcat(str, "Morador\n");
	foreach(new i: B_House){
	    if(IsPlayerInRangeOfPoint(playerid, 1.2, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ])){
			for(new loop; loop < 4; loop++){
				new str2[sizeof str];
				format(str2, sizeof str2, "%s\n", InfoAluguel[i][loop][AluguelNome]);
				strcat(str, str2);
			}
		}
	}
	ShowPlayerDialog(playerid, DIALOG_INUTIL, 5, "{33ccff}# Response", str, "Ok", #);
	return 1;	    	
}
cmd:despejar(playerid, params[]){
	new casar = -1;
	foreach(new i: B_House){
	    if(IsPlayerInRangeOfPoint(playerid, 1.2, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]) && DonoDaCasa(playerid, i)){
	    	casar = i;
	    	if(isnull(params)){
	    		SendClientMessage(playerid, LIGHTBLUE, "/despejar [ nome do jogador ]");
	    	}
	    	else{
	    		for(new ck; ck < 4; ck++){
	    			if(!isnull(InfoAluguel[i][ck][AluguelNome]) && !strcmp(params, InfoAluguel[i][ck][AluguelNome]) && strcmp(params, "Ninguem", true)){
	    				format(InfoAluguel[i][ck][AluguelNome], 24, "Ninguem");
	    				SendClientMessage(playerid, LIGHTBLUE, "Este jogador foi despejado de sua residencia.");
	    				break;
	    			}
	    		}
	    	}
	    }
	}
	if(casar == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao esta na frente de sua residencia.");
	return 1;	
}
cmd:alugarcasa(playerid){
	new achado = -1;
	foreach(new i: B_House){
	    if(IsPlayerInRangeOfPoint(playerid, 1.2, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ])){
	    	if(DonoDaCasa(playerid, i)) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode alugar sua propria casa.");
	    	if(AlugouCasa(playerid, i)) return SendClientMessage(playerid, LIGHTBLUE, "Voce ja alugou esta residencia.");
	    	if(InfoCasa[i][Aluguel] == 0) return SendClientMessage(playerid, LIGHTBLUE, "Esta casa nao esta disponivel para aluguel.");
	    	for(new ck; ck < 4; ck++){
	    		if(isnull(InfoAluguel[i][ck][AluguelNome]) || !strcmp(InfoAluguel[i][ck][AluguelNome], "Ninguem")){
		    		achado = ck;
		    		break;
				}
	    	}
	    	if(achado == -1) return SendClientMessage(playerid, LIGHTBLUE, "Esta casa nao tem quartos disponiveis.");
	    	format(InfoAluguel[i][achado][AluguelNome], 24, nome(playerid));
	    	//if(CasaLotada(i)) return SendClientMessage(playerid, LIGHTBLUE, "Esta residencia esta lotada! Sem vagas para morar.");	
	    	//AdicionarMorador(i, nome(playerid));
	    	SendClientMessage(playerid, LIGHTBLUE, fString("Voce alugou esta casa. Valor do aluguel: %dR$.", InfoCasa[i][Aluguel]));
	    	SendClientMessage(playerid, LIGHTBLUE, "Use /desalugar para nao morar mais aqui.");
	    }
	}
	return 1;
}
cmd:definiraluguel(playerid, params[]){
	foreach(new i: B_House){
	    if(IsPlayerInRangeOfPoint(playerid, 1.2, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]) && DonoDaCasa(playerid, i)){
			new valor = strval(params);
			if(!Number(params) || isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/definiraluguel [ 0$ - 1600$ ]");
			if(0 <= valor <= 1600){
				new str[200];
				if(valor == 0){
					InfoCasa[i][Aluguel] = 0;
					if(InfoCasa[i][PrecoCasa] < 1)
						if(InfoCasa[i][CasaVip] > 0)
							format(str, sizeof(str), TEXTO_COMPRADOV, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
						else
							format(str, sizeof(str), TEXTO_COMPRADO, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
					else
						if(InfoCasa[i][CasaVip] > 0)
							format(str, sizeof(str), TEXTO_AVENDAV, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
						else
							format(str, sizeof(str), TEXTO_AVENDA, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
					
					UpdateDynamic3DTextLabelText(InfoCasa[i][CasaLabel], -1, str);
					SendClientMessage(playerid, VerdeSamp, "Voce removeu o aluguel de sua residencia.");
					
				}
				else{
					InfoCasa[i][Aluguel] = valor;
					SendClientMessage(playerid, VerdeSamp, fString("Voce definiu o aluguel de sua casa. Valor: %dR$.", valor));
					SendClientMessageToAll(LIGHTBLUE, fString("[Imobiliaria] Residencia %d esta disponivel para aluguel! Valor: %dR$.", i,valor));
					
					if(InfoCasa[i][PrecoCasa] < 1)
						if(InfoCasa[i][CasaVip] > 0)
							format(str, sizeof(str), TEXTO_COMPRADOV, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
						else
							format(str, sizeof(str), TEXTO_COMPRADO, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
					else
						if(InfoCasa[i][CasaVip] > 0)
							format(str, sizeof(str), TEXTO_AVENDAV, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
						else
							format(str, sizeof(str), TEXTO_AVENDA, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
					
					UpdateDynamic3DTextLabelText(InfoCasa[i][CasaLabel], -1, str);
					
				}
			}
		}
	}
	return 1;	
}
cmd:comprarcasa(playerid)
{
	foreach(new i: B_House)
	{
 		if(ContarCasas(playerid)) return 1;
 		
		if(IsPlayerInRangeOfPoint(playerid, 1.5, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ])){
            if(InfoCasa[i][PrecoCasa] <= 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode comprar esta casa.");
		    if(DonoDaCasa(playerid, i)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Esta casa ja e sua!");
			//if(InfoCasa[i][CasaComprada] == 1) return SendClientMessage(playerid, -1, "Voce nao pode comprar uma casa que ja foi comprada.");
	 		if(GetPlayerCash(playerid) < InfoCasa[i][PrecoCasa]) return SendClientMessage(playerid, -1, "Voce Nao tem dinheiro suficiente.");
			if(InfoCasa[i][CasaVip] > 0 && PlayerInfo[playerid][Vip] < 1) return SendClientMessage(playerid, LIGHTBLUE, "Voce precisa ser vip para comprar esta casa.");
			if(!strcmp(InfoCasa[i][Dono], "Ninguem", false, 24)){
				format(InfoCasa[i][Dono], 24, nome(playerid));
				new str[190];
				format(str, sizeof(str), TEXTO_COMPRADO, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
				UpdateDynamic3DTextLabelText(InfoCasa[i][CasaLabel], -1, str);
				GivePlayerCash(playerid, -InfoCasa[i][PrecoCasa]);
				SendClientMessage(playerid, -1, "{00ff15}Voce acaba de comprar uma nova residencia.");
				SendClientMessage(playerid, -1, "Use 'Y' entrar para entrar nela.");
				InfoCasa[i][CasaComprada] = 1;
				InfoCasa[i][PrecoCasa] = 0;
				AlterarCasaIcon(i);
			}
			else
			{
			    foreach(new p: Player)
				{
					if(IsPlayerOnline(InfoCasa[i][Dono])){
						BancoInfo[p][Dinheiro] += InfoCasa[i][PrecoCasa];
						SendClientMessage(p, LIGHTBLUE, "|INFO| Alguem acaba de comprar sua residencia, o dinheiro foi para o banco.");
						break;
					}
					else{
						new Query[90], Cache: R;
						mysql_format(Dados, Query, sizeof(Query), "SELECT `Nome` FROM `Contas` WHERE `Nome` = '%s'", InfoCasa[i][Dono]);
						R=mysql_query(Dados, Query);
						new rows = cache_num_rows();
						if(cache_is_valid(R) && rows){
							format(Query, sizeof(Query), "UPDATE `Contas` SET `Banco` = `Banco` + '%d' WHERE `Nome` = '%s'", InfoCasa[i][PrecoCasa], InfoCasa[i][Dono]);
							mysql_tquery(Dados, Query);
							SendClientMessage(playerid, LIGHTBLUE, "|INFO| O dono da casa nao estava online, o dinheiro foi para a conta dele.");
						}
						if(cache_is_valid(R))cache_delete(R);
						break;
					}
				}
				new str[190];
				format(str, sizeof(str), TEXTO_COMPRADO, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]),InfoCasa[i][Aluguel]);
				UpdateDynamic3DTextLabelText(InfoCasa[i][CasaLabel], -1, str);
				GivePlayerCash(playerid, -InfoCasa[i][PrecoCasa]);
				SendClientMessage(playerid, -1, "{00ff15}Voce acaba de comprar uma nova casa.");
				InfoCasa[i][CasaComprada] = 1;
				InfoCasa[i][PrecoCasa] = 0;
				format(InfoCasa[i][Dono], 24, nome(playerid));
			}
			SalvarCasa(i);
		}
	}
	return 1;
}
cmd:ofcasa(playerid, params[])
{
	foreach(new i: B_House)
	{
	    if(InfoCasa[i][CasaComprada] == 1 && IsPlayerInRangeOfPoint(playerid, 1.9, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]))
		{
			if(!strcmp(InfoCasa[i][Dono], nome(playerid), false, 24))
			{
			    new id, value;
			    if(sscanf(params, "ii", id, value)) return SendClientMessage(playerid, -1, "USO: /ofcasa [ id ] [ valor ]");
				if(Negociando[playerid]) return SendClientMessage(playerid, -1, "|INFO| - Voce ja esta negociando uma casa.");
				if(value <= 0 || value >= 1000000000) return SendClientMessage(playerid, -1, "|INFO| - O Valor deve ser entre 1 e 1 bilhao.");
			    new uva = -1;
			    foreach(new v: Player){
					if(id == PlayerInfo[v][IDFixo]){
						id = v;
						uva = v;
						break;
					}
				}
				if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
				if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, -1, "|INFO| Jogador esta offline.");
			    new Float:p[3];
			    if(id == playerid) return 1;
			    GetPlayerPos(id, p[0], p[1], p[2]);
			    if(!IsPlayerInRangeOfPoint(playerid, 4.0, p[0], p[1], p[2])) return SendClientMessage(playerid, -1, "|INFO| Este jogador precisa estar perto de voce!");
			    if(ContarCasas(id)) return SendClientMessage(playerid, -1, "|INFO| O Jogador ja possui o limite de casas.");
				Negociando[playerid] = true;
				new str[144];
				format(str, sizeof(str), "{33ccff}%s deseja vender a casa ({ffffff}%d{33ccff}) pelo valor {33aa33}R$%d\n{ffffff}Deseja aceita?", nome(playerid), i, value);
				ShowPlayerDialog(id, DIALOG_OFCASA, DIALOG_STYLE_MSGBOX, "{fff000}Venda De Casas", str, "{00ff15}Sim", "{ff0000}Nao");
				SendClientMessage(playerid, -1, "|INFO| - Voce ofereceu a casa pro jogador, aguarde ele aceita...");
				SetPVarInt(id, "valorcasa", value);
				SetPVarInt(id, "idcasa", i);
				SetPVarInt(id, "quemcasa", playerid);
				Comprador[id] = true;
			}
		}
	}
	return 1;
}
cmd:gpscasa(playerid, params[]){
	if(!TemItem(playerid, CELULAR)) return SendClientMessage(playerid, LIGHTBLUE, "Para usar o gps casa voce precisa comprar um CELULAR.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/gpscasa [ house id ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "/gpscasa [ house id ]");
	new casa = strval(params);
	if(!InfoCasa[casa][CasaCriada]) return SendClientMessage(playerid, LIGHTBLUE, "Esta residencia nao existe!");
	SetPlayerCheckpoint(playerid, InfoCasa[casa][CasaX], InfoCasa[casa][CasaY], InfoCasa[casa][CasaZ], 3.2);
	SendClientMessage(playerid, LIGHTBLUE, "O Numero da residencia foi marcada em seu Mapa.");
	return 1;
}
cmd:cofrecasa(playerid){
	if(DentroDeCasa[playerid] != -1){
		new casa = DentroDeCasa[playerid];
		if(isnull(InfoCasa[casa][Dono])) return SendClientMessage(playerid, LIGHTBLUE, "* Esta casa nao possui dono.");
		if(strcmp(nome(playerid), InfoCasa[casa][Dono])) return SendClientMessage(playerid, LIGHTBLUE, "* Esta casa nao e sua.");
		new string[600], conta = PlayerInfo[playerid][Vip] * 20;
		if(conta == 0) conta = 20;
		strcat(string, "Item\tQuantia\n");
		for(new i; i< conta; i++){
			format(string, sizeof string, "%s%s\t%d\n",string,InventarioName(InfoCasa[casa][Item][i]), InfoCasa[casa][Quantia][i]);
			ShowPlayerDialog(playerid, DIALOG_COFRECASA, 5, "{ff0000}# Itens Atuais", string, "Ok", "Retornar");
		}		
	}
	return 1;
}
cmd:vendercasa(playerid, params[])
{
	foreach(new i: B_House)
	{
	    if(InfoCasa[i][CasaComprada] == 1 && IsPlayerInRangeOfPoint(playerid, 1.9, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]) && !strcmp(InfoCasa[i][Dono], nome(playerid), false, 24))
	    {
		    if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /vendercasa [ valor ]");
		    if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pode digitar somente numeros.");
		    if(strval(params) == 0){
	        	InfoCasa[i][PrecoCasa] = 0;
				new str[190];
				if(InfoCasa[i][CasaVip])
					format(str, sizeof(str), TEXTO_COMPRADOV, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
				else
					format(str, sizeof(str), TEXTO_COMPRADO, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);

				UpdateDynamic3DTextLabelText(InfoCasa[i][CasaLabel], -1, str);
			}else{
			    InfoCasa[i][PrecoCasa] = strval(params);
				new str[200];
				if(InfoCasa[i][CasaVip])
					format(str, sizeof(str), TEXTO_AVENDAV, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
				else
					format(str, sizeof(str), TEXTO_AVENDA, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
				
				UpdateDynamic3DTextLabelText(InfoCasa[i][CasaLabel], -1, str);
				SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce acaba de colocar sua residencia a venda.");
			}
		}
	}
	return 1;
}
cmd:demitirlider(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 5) return 1;
	new id = strval(params);
	if(!Number(params) || isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /demitirlider [ id da org ]");
	if(id <= 0 || id > MAX_ORGS) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Somente entre 1 e 30.");
	if(!strcmp(OrgInfo[id][OrgLider], "Ninguem", false, 24)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Esta organizacao nao possui lider.");
	new Query[180];
 	mysql_format(Dados, Query, sizeof(Query), "UPDATE `Contas` SET `Org` = '0', `Cargo` = '0' WHERE `Nome` = '%s'", OrgInfo[id][OrgLider]);
    mysql_tquery(Dados, Query);
	foreach(new i: Player){
	    if(PlayerInfo[i][Org] == id && PlayerInfo[i][Cargo] == 10){
	        PlayerInfo[i][Org] = 0;
			PlayerInfo[i][Cargo] = 0;
            SpawnPlayer(i);
            SendClientMessage(i, LIGHTBLUE, "|INFO| Voce foi removido da lideranca de sua organizacao.");
		}
	}
	new str[144];
	format(str, sizeof(str), "%s Lider do(a) %s foi demitido.", OrgInfo[id][OrgLider], OrgGm[id][OrgNome]);
	SendClientMessageToAll(LIGHTBLUE, str);
    format(OrgInfo[id][OrgLider], 24, "Ninguem");
    SalvarOrg(id);
	return 1;
}
cmd:demitirtodos(playerid){
	if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ser lider.");
	ShowPlayerDialog(playerid, DIALOG_CONFIRMAR_TODOS, DIALOG_STYLE_MSGBOX, "{ff0000}Aviso", "{fff000}Tem Certeza de que deseja demitir todos os membros desta organizacao?", "{33aa33}Sim", "{FF0000}Nao");
	return 1;
}
/* -=-=-=-=- Comandos Reembolso -=-=-=-=- */
cmd:tirargrana(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 7) return 1;
	new id, quantia;
	if(sscanf(params, "ii", id, quantia)) return SendClientMessage(playerid, LIGHTBLUE, "/tirargrana [ id fixo ][ quantia ]");
	new achado = -1;
	foreach(new i: Player){
		if(PlayerInfo[i][IDFixo] == id){
			id = i;
			achado = i;
			break;
		}
	}
	if(achado == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Jogador nao encontrado!");
	new str[144];
	format(str, sizeof str, "%s retirou %dR$ de voce.", nome(playerid), quantia);
	SendClientMessage(id, LIGHTBLUE, str);
	GivePlayerCash(id, -quantia);
	format(str, sizeof str, "Voce retirou %dR$ de %s.", quantia, nome(id));
	SendClientMessage(playerid, LIGHTBLUE, str);	
	return 1;
}
cmd:daritem(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 7) return 1;

	new id, quantia, item;
	if(sscanf(params, "iii", id, item, quantia)) return SendClientMessage(playerid, LIGHTBLUE, "/daritem [ id ] [ item id ] [ quantia ]");
	new achado = -1;
	foreach(new i: Player){
		if(PlayerInfo[i][IDFixo] == id){
			id = i;
			achado = i;
			break;
		}
	}
	if(achado == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Jogador nao encontrado!");
	AdicionarItem(id, item, quantia);
	new str[144];
	format(str, sizeof str, "Voce setou o item %d para %s.", item, nome(id));
	SendClientMessage(playerid, LIGHTBLUE, str);
	format(str, sizeof str, "%s set item%d para %s", nome(playerid), item, nome(id));
	AdicionarLogs(str);	
	return 1;
}
cmd:dargrana(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 11) return 1;
	new id, quantia;
	if(sscanf(params, "ii", id, quantia)) return SendClientMessage(playerid, LIGHTBLUE, "/dargrana [ id fixo ][ quantia ]");
	new achado = -1;
	foreach(new i: Player){
		if(PlayerInfo[i][IDFixo] == id){
			id = i;
			achado = i;
			break;
		}
	}
	if(achado == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Jogador nao encontrado!");
	SendClientMessage(id, LIGHTBLUE, "%s setou %dR$ de dinheiro para voce.", nome(playerid), quantia);
	GivePlayerCash(id, quantia);
	SendClientMessage(playerid, LIGHTBLUE, "Voce setou %dR$ para %s.", quantia, nome(id));
	new str[90];
	format(str, sizeof str, "%s set money %d para %s", nome(playerid), quantia, nome(id));
	AdicionarLogs(str);	
	return 1;
}
//========================================//
cmd:darlider(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 7) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar o comando.");
	new id, org;
	if(sscanf(params, "ii", id, org)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /darlider [ id do jogador ] [ id da organizacao ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return 1;
	if(PlayerInfo[id][Cargo] > 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador ja esta em uma organizacao.");
	if(org <= 0 || org > MAX_ORGS) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Somente entre 1 e 30.");
	if(strcmp(OrgInfo[org][OrgLider], "Ninguem", false, 30)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Esta organizacao ja possui lider.");
	format(OrgInfo[org][OrgLider], 24, nome(id));
	PlayerInfo[id][Org] = org;
	PlayerInfo[id][Cargo] = 10;
	SalvarOrg(org);
	EstiloSpawn[id] = SPAWN_ORG;
	new str[136];
	format(str, sizeof(str), "[Lideres] {00C2EC}[%d]%s agora e o novo lider do %s.", id, nome(id), OrgGm[org][OrgNome]);
	SendClientMessageToAll(Cinza, str);
	SpawnPlayer(id);
	SalvarConta(id);
	return 1;
}
cmd:criarobjeto(playerid, params[])
{
    if(PlayerInfo[playerid][Admin] < 9) return 1;
    if(!TextoGerado) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Ative os textos antes com /texto.");
	//if(GetPVarInt(playerid, "Admin") == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta logado no RCON.");
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /criarobjeto [ id do objeto ]");
	new Query[190], string[128], Float:X, Float: Y,Float:Z;
	GetPlayerPos(playerid, X,Y,Z);
	if(id > 300){
		for(new i = 1; i<MAX_OBJT; i++)
		{
		    if(!ObjetoInfo[i][ObjetoCriado]){
        		ObjetoInfo[i][ObjetoModel] = id;
		        ObjetoInfo[i][PIDF] = i;
				mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Objetos` (`Objetoid`, `ObjetoModel`, `ObX`, `ObY`, `ObZ`, `RotX`, `RotY`, `RotZ`) VALUES ('%d','%d', '%f', '%f', '%f', 0, 0, 0)",i, id, X,Y,Z);
				mysql_tquery(Dados, Query);

				ObjetoInfo[i][ObX] = X;
				ObjetoInfo[i][ObY] = Y;
				ObjetoInfo[i][ObZ] = Z;
				ObjetoInfo[i][ObjetoCriado] = true;
    			ObjetoInfo[i][Objeto] = CreateDynamicObject(ObjetoInfo[i][ObjetoModel], ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ],
																					  ObjetoInfo[i][RotX], ObjetoInfo[i][RotY],
																					  					 ObjetoInfo[i][RotZ]);

    			format(string, sizeof(string), "{aa33aa}Objeto {ffffff}%d (%d)", i, ObjetoInfo[i][ObjetoModel]);
				ObjetoInfo[i][Texto] = CreateDynamic3DTextLabel(string, -1, ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ]-0.3, 2.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
				string[0] = EOS;
				Query[0] = EOS;
				new strr[40];
				format(strr, sizeof(strr), "O ID do objeto ??© %d.", i);
				SendClientMessage(playerid, -1, strr);
				return i;
			}
		}
	}
	return 1;
}
cmd:irobjeto(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 3) return 1;
	//if(GetPVarInt(playerid, "Admin") == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este comando.");
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /irobjeto [ id ]");
	if(id > MAX_OBJT) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Limite e 799!");
	if(ObjetoInfo[id][ObjetoCriado] == false) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode teleportar em um objeto que nao existe.");
	SetPlayerPosEx(playerid, ObjetoInfo[id][ObX], ObjetoInfo[id][ObY], ObjetoInfo[id][ObZ]);
	new st[90];
	format(st, sizeof st, "{33ffcc}|INFO| Voce foi ate o objeto id '%d' ( %d )", id, ObjetoInfo[id][ObjetoModel]);
	SendClientMessage(playerid, -1, st);
	return 1;
}
cmd:conce(playerid){
	if(!ISP(playerid, 4.0, -2253.6848,3391.2898,734.5806)) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao esta na concessionaria.");

	ShowPlayerDialog(playerid, DIALOG_TIPOSCONCE, DIALOG_STYLE_LIST, "{fff000}Tipos De Veiculos", "Comuns\nEsportivos\nMotos\nVip", "Ok","Sair");
	return 1;
}
cmd:kick(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 1) return 1;
	new id, motivo[32];
	if(sscanf(params, "is[32]", id, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /kick [ id ] [ motivo ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador nao esta conectado.");
	if(PlayerInfo[id][Admin] > PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode kickar um admin com o nivel maior que o seu.");
	if(!PlayerInfo[id][Logado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Jogador nao esta logado.");
	new str[144];
	format(str, sizeof(str), "Admin %s kickou o jogador %s, motivo '%s'", nome(playerid), nome(id), motivo);
	SendClientMessageToAll(LIGHTBLUE, str);
	SetTimerEx("kickar", 1000, false, "i", id);
	return 1;
}
cmd:darvip(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 11) return 1;
	new id, nivel, dias;
	if(sscanf(params, "iii", id, nivel, dias)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /darvip [ id ] [ nivel ] [ dias ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}

	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Jogador nao esta conectado.");
	if(nivel < 0 || nivel > 3) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Nivel deve ser somente entre 0 e 3.");
	if(dias < 0 || dias > 30) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Os dias devem ser maior que 0 e menor que 30!");
	switch(nivel){
	    case 0:{
			PlayerInfo[id][Vip] = 0;
			PlayerInfo[id][TempoVip] = 0;
			new str[144];
			format(str, sizeof(str), "{fff000}%s\n\n{33ccff}O Staff %s acaba de remover o seu Vip.\n Para continuar usando compre outro.", nome(id), nome(playerid));
			ShowPlayerDialog(id, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{ff0000}Aviso Urgente", str, "Ok", "");
		}
		default:{
			PlayerInfo[id][Vip] = nivel;
			PlayerInfo[id][TempoVip] = gettime() + 60 * 60 * 24 * dias;
			new str[144];
			format(str, sizeof(str), "{fff000}%s\n\n{33ccff}O Staff %s acaba de dar vip nivel %d por %s.\nObrigado por nos apoiar!\nVeja seus beneficios em /ajuda - Ajuda Vip\nVoce tambem pode pedir sua tag no discord do servidor.\nMuito Mais beneficios estao sendo criados.", nome(id), nome(playerid), nivel, Convert(PlayerInfo[playerid][TempoVip] - gettime()));
			ShowPlayerDialog(id, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{ff0000}Aviso Urgente", str, "Ok", "");
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Vip dado ao jogador com sucesso.");
		}
	}
	return 1;
}
cmd:resposta(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 1) return 1;
	new id, resposta[32];
	if(sscanf(params, "is[32]", id, resposta)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /resposta [ id ou nome] [ resposta ]");
   	new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Jogador nao esta conectado!");
	new str[144];
	format(str, sizeof str, "[RESPOSTA]{fff000}%s diz: '{ffffff}'%s'.", nome(playerid), resposta);
	SendClientMessage(id, Rosa, str);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce enviou a mensagem com sucesso para o outro jogador.");
	return 1;
}
cmd:relatorio(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /relatorio [ ... ]");
	new str[150];
	format(str, sizeof(str), "[RELATORIO]{fff000}(%d){ffffff}%s relata:{7C9B5A} %s", PlayerInfo[playerid][IDFixo], nome(playerid), params);
	AdminMessage(Rosa, str);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Seu relatorio foi enviado com sucesso para os Admins online.");
	return 1;
}
cmd:removerapk(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;

	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/removerapk [ serial ]");
	new Cache: R, Query[169];
	mysql_format(Dados, Query, sizeof Query, "SELECT `Serial` FROM `ApkLiberado` WHERE `Serial` = '%s'", params);
	R = mysql_query(Dados, Query);
	new rows = cache_num_rows();
	if(cache_is_valid(R) && rows){
		mysql_format(Dados, Query, sizeof Query, "DELETE FROM `ApkLiberado` WHERE `Serial` = '%e'", params);
		mysql_tquery(Dados, Query);
		SendClientMessage(playerid, LIGHTBLUE, "Apk removido com sucesso.");
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "Este apk nao foi encontrado no banco de dados.");

	if(cache_is_valid(R))cache_delete(R);
	return 1;
}
cmd:setarapk(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;

	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/setarapk [ serial ]");
	new query[150];
	mysql_format(Dados, query, sizeof query, "INSERT INTO `ApkLiberado` (`Serial`) VALUES ('%s')", params);
	mysql_tquery(Dados, query);
	SendClientMessage(playerid, LIGHTBLUE, fString("Serial %s foi liberado.", params));
	return 1;
}
cmd:daradmin(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new id, nivel;
	if(sscanf(params, "ii", id, nivel)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /daradmin [ id ] [ nivel admin ]");
	if(nivel < 0 || nivel > 11) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Nivel deve ser maior que 0 e menor que 10!");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return 1;
	if(PlayerInfo[id][Admin] > PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Nivel admin deste jogador ??© igual ou superior ao seu.");
	if(nivel > PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode setar esse nivel.");
	AdicionarLogs(fString("%s deu admin %d para %s", nome(playerid), nivel, nome(id)));
	PlayerInfo[id][Admin] = nivel;
	new str[144];
	format(str, sizeof str, "Administracao: %s setou admin nivel '%d' para voce.", nome(playerid), nivel);
	SendClientMessage(id, Rosa, str);

	format(str, sizeof(str), "Administracao: %s setou admin nivel '%d' para '%s(%d)'.", nome(playerid), nivel, nome(id), id);
	AdminMessage(Rosa, str);
	if(nivel != 0){
		new Query[144], Cache: R;
		mysql_format(Dados, Query, sizeof(Query), "SELECT `Nome` FROM `Staff` WHERE `Nome` = '%s'", nome(id));
		R = mysql_query(Dados, Query);
		new rows = cache_num_rows();
		if(!cache_is_valid(R) && !rows){
			mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Staff` (`Nome`) VALUES ('%s')", nome(id));
			mysql_tquery(Dados, Query);
			SendClientMessage(id, LIGHTBLUE, "|INFO| Bem vindo a administracao! Veja os comandos de seu cargo com /aa.");
			NivelAdmin[id] = nivel;
		}
		if(cache_is_valid(R))cache_delete(R);
	}
	else{
		new Query[90];
		mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Staff` WHERE `Nome` = '%s'", nome(id));
		mysql_tquery(Dados, Query);
		new reset[EnumAtendimento];
		Atendimento[playerid] = reset;
		NivelAdmin[id] = 0;
		SendClientMessage(id, Rosa, "Aviso -> Voce foi removido da STAFF.");
	}
	NivelAdmin[id] = nivel;
	return 1;
}
cmd:rc(playerid){
	if(PlayerInfo[playerid][Admin] < 4) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar este comando.");

	for(new i, j = MAX_VEHICLES; i != j; i++){
		if(!IsVehicleOccupied(i)){
			SetVehicleToRespawn(i);
		}
	}
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce deu RC em todos os veiculos do servidor.");
	return 1;
}
cmd:ban(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 5) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem permissao.");

	new id, motivo[32];

	if(sscanf(params, "is[32]", id, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /ban [ id ][ motivo ]");
    new uva = -1;
    foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(!IsPlayerConnectedP(id)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o ID de um jogador offline.");
	if(PlayerInfo[id][Admin] > PlayerInfo[playerid][Admin]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode banir um admin maior que seu cargo.");
	//if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode se banir!");

	new str[144];
	format(str, sizeof(str), "ADMcmd: %s baniu o ip de [%d]%s, ( %s ).", nome(playerid), id, nome(id), motivo);
	SendClientMessageToAll(LIGHTBLUE, str);

	new ip[16], Query[195];
	GetPlayerIp(id, ip, sizeof(ip));
	mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Banidos` (`Nome`, `Ip`, `Motivo`, `Staff`) VALUES ('%s', '%s', '%s', '%s')", nome(id), ip, motivo, nome(playerid));
	mysql_tquery(Dados, Query);

	SetTimerEx("kickar", 900, false, "i", id);
	return 1;
}
cmd:agenban(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 5) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem permissao.");

	new s[24], motivo[32];

	if(sscanf(params, "s[24]s[32]", s, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /agenban [ nome ][ motivo ]");
	new str[144];
	format(str, sizeof(str), "ADMcmd: %s agendou o ban de %s. ( %s ).", nome(playerid), s, motivo);
	SendClientMessageToAll(LIGHTBLUE, str);

	new Query[195];
	mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Banidos` (`Nome`, `Motivo`, `Staff`, `Ip`) VALUES ('%s', '%s', '%s', '%s')", s, motivo, nome(playerid), GetPlayerIpDB(s));
	mysql_tquery(Dados, Query);
	return 1;
}
GetPlayerIpDB(const namequery[]){
	new str[144];
	mysql_format(Dados, str, sizeof str, "SELECT `Nome`, `Ip` FROM `Contas` WHERE `Nome` = '%e'", namequery);
	new Cache: R = mysql_query(Dados, str), ip[16] = "0.0";
	new rows = cache_num_rows();
	if(cache_is_valid(R) && rows){
		cache_get_value_name(0, "Ip", ip, 16);
	}
	if(cache_is_valid(R))cache_delete(R);
	return ip;
}
cmd:desbanir(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 7) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem permissao!");

	new name[24], motivo[20];
	if(sscanf(params, "ss[20]", name, motivo)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /desbanir [ nome ] [ motivo ] ");
	new Query[99], Cache: R;
	mysql_format(Dados, Query, sizeof(Query), "SELECT `Nome` FROM `Banidos` WHERE `Nome` = '%s'", name);
	R = mysql_query(Dados, Query);
	new rows = cache_num_rows();
	if(cache_is_valid(R) && rows)
	{
	    mysql_format(Dados, Query, sizeof(Query), "DELETE FROM `Banidos` WHERE `Nome` = '%s'", name);
		mysql_tquery(Dados, Query);

		new str[122];
		format(str, sizeof(str), "Admcmd: %s desbaniu %s, ( %s ).", nome(playerid), name, motivo);
		SendClientMessageToAll(LIGHTBLUE, str);
	}
	else{
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Nao Encontrado!");
	}
	if(cache_is_valid(R))cache_delete(R);
	return 1;
}
cmd:trancar(playerid, params[]){
	new Float:pos[3], id = strval(params);
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/trancar [ vehicle slot id ]");
	if(VehInfo[playerid][id][IDCarro] == 0) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao possui veiculo neste Slot.");
    GetVehiclePos(VehInfo[playerid][id][Carro], pos[0], pos[1], pos[2]);

	if(!IsPlayerInRangeOfPoint(playerid, 20.0, pos[0], pos[1], pos[2])) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| - Voce precisa estar ate 20 metros perto do veiculo.");
    new bool:engine,bool:lights,bool:alarm,bool:doors,bool:bonnet,bool:boot,bool:objective;
    GetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,doors,bonnet,boot,objective);

	if(doors == true)
   	{
   		VeiculoTrancado[VehInfo[playerid][id][Carro]] = false;
		SetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,false,bonnet,boot,objective);
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Seu veiculo foi destrancado.");
	}
	else{
		SetVehicleParamsEx(VehInfo[playerid][id][Carro],engine,lights,alarm,true,bonnet,boot,objective);
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Seu veiculo foi trancado.");
		VeiculoTrancado[VehInfo[playerid][id][Carro]] = true;
	}
	return 1;
}
cmd:menucar(playerid)
{
	new str[255],str2[255], ct;
	strcat(str, "{33CCFF}Slot id\t {33CCFF}Veiculo\t {33CCFF}Distancia\n");
	for(new i; i<MAXCONCE; i++)
	{
	    if(VehInfo[playerid][i][IDCarro] != 0){
		    ct++;
			format(str2, sizeof(str2), "(%d)\t (%d)%s\t%s\n",i, VehInfo[playerid][i][Carro], GetVehicleName(VehInfo[playerid][i][IDCarro]),DistanciaVeh(playerid, VehInfo[playerid][i][Carro]));
			strcat(str, str2);
		}
	}
	if(ct == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem nenhum veiculo.");
	ShowPlayerDialog(playerid, DIALOG_CARMENU, 5, "{fff000}Menu Do Veiculo", str, "Ok", "Sair");
	return 1;
}
CobrarIPVA(playerid){
	new cont;
	for(new i; i<MAXCONCE; i++){
		if(VehInfo[playerid][i][IDCarro] != 0){
			cont++;
			if(isnull(VehInfo[playerid][i][Placa])){
				GivePlayerCash(playerid, -200);
				SendClientMessage(playerid, LIGHTBLUE, "MULTA | Voce tomou uma multa por nao ter veiculos emplacados.");
			}
			else{
				VehInfo[playerid][i][IPVA] += floatround(ModelFromIpva(VehInfo[playerid][i][IDCarro]));
				
				new str[144];
				format(str, sizeof str, "IPVA | Voce acaba de receber %dR$ de IPVA para pagar! Pague antes que seu carro seja Apreendido.", floatround(ModelFromIpva(VehInfo[playerid][i][IDCarro])));
				SendClientMessage(playerid, LIGHTBLUE, str);
			}
		}
	}
}
public Float: ModelFromIpva(model){
	new Float: padrao = 1000.0;

	for(new i; i<MAX_CARRO_CONCE; i++){
		if(carrosCompra[i][carroModel] == model){
			padrao = (0.035) * float(carrosCompra[i][carroPrice]);
			break;
		}
	}
	return padrao;
}
DistanciaJogador(playerid, playerid2){
	new Float:pos[3], str[11];
	GetPlayerPos(playerid2, pos[0], pos[1], pos[2]);
   	new Float:distance = GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]);
   	format(str, sizeof(str), "%0.2fm", distance);
	return str;
}
DistanciaVeh(playerid, veh){
	new Float:pos[3], str[11];
	if(veh != INVALID_VEHICLE_ID){
		GetVehiclePos(veh, pos[0], pos[1], pos[2]);
    	new Float:distance = GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]);
    	format(str, sizeof(str), "%0.2fm", distance);
    }
	else
	    str = "NaN";
	return str;
}
cmd:orgs(playerid){
	new string[1010];
	strcat(string, "{33ccff}ID\t{33ccff}Nome\t{33ccff}Lider\n");
	for(new i = 1; i< sizeof OrgGm; i++){
		new str[70];
		format(str, sizeof str, "%d\t%s(%s)\t%s\n", i, OrgGm[i][OrgNome],OrgGm[i][Sigla], OrgInfo[i][OrgLider]);
		strcat(string, str);
	}
	ShowPlayerDialog(playerid, DIALOG_INUTIL, 5, "{ff0000}# Organizacoes",
	 string, "Fechar", #);
	return 1;
}
cmd:configurarob(playerid, params[])
{
    if(PlayerInfo[playerid][Admin] < 9) return 1;
    if(!TextoGerado) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Ative os textos antes com /texto.");
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /criarob [ id ]");
	if(ISP(playerid, 5.0, ObjetoInfo[id][ObX], ObjetoInfo[id][ObY], ObjetoInfo[id][ObZ])){
		SetPVarInt(playerid, "Port", id);
    	ShowPlayerDialog(playerid, DIALOG_EDITAR, DIALOG_STYLE_LIST, "{fff000}Configuracoes Disponiveis", "{00C2EC}Editar Posicao\n{00C2EC}Mudar ID\n{00C2EC}Duplicar Objeto\n{00C2EC}Deletar Objeto", "Ok", "Sair");
	}
	return 1;
}
stock SalvarOrg(org){
	static Query[300];
	mysql_format(Dados, Query, sizeof Query,  "UPDATE `Orgs` SET `OrgSpawnX` = '%f',\
		`OrgSpawnY` = '%f',\
		`OrgSpawnZ` = '%f',\
		`OrgSpawnA` = '%f',\
		`OrgVw` = '%d',\
		`OrgInterior` = '%d' WHERE `OrgId` = '%d'",
	 	OrgInfo[org][OrgSpawn][0], OrgInfo[org][OrgSpawn][1], OrgInfo[org][OrgSpawn][2], OrgInfo[org][OrgSpawn][3],
		OrgInfo[org][OrgVw], OrgInfo[org][OrgInterior], org);

	mysql_tquery(Dados, Query);

	mysql_format(Dados, Query, sizeof Query, "UPDATE `Orgs` SET `OrgCofre` = '%d' WHERE `OrgId` = '%d'", OrgInfo[org][OrgCofre], org);
	mysql_pquery(Dados, Query);	

	mysql_format(Dados, Query, sizeof Query, "UPDATE `Orgs` SET `PickDisponivel` = '%d', `Vagas` = '%d',\
	`OrgLider` = '%s', `VehCor` = '%d' WHERE `OrgId` = '%d'",
		OrgInfo[org][PickDisponivel], OrgInfo[org][Vagas], OrgInfo[org][OrgLider], OrgInfo[org][VehCor], org);

	mysql_pquery(Dados, Query);

	mysql_format(Dados, Query, sizeof Query, "UPDATE `Orgs` SET `Equipamentos` = '%d', \
		`Maconha` = '%d' WHERE `OrgId` = '%d'", 
		OrgInfo[org][Equipamentos], OrgInfo[org][MaconhaOrg], org);
	mysql_pquery(Dados, Query);

	mysql_format(Dados, Query, sizeof Query, "UPDATE `Orgs` SET `OrgPickPosX` = '%f', `OrgPickPosY` = '%f', `OrgPickPosZ` = '%f' WHERE `OrgId` = '%d'",
		OrgInfo[org][OrgPickPos][0], OrgInfo[org][OrgPickPos][1], OrgInfo[org][OrgPickPos][2], org);
	mysql_pquery(Dados, Query);

	for(new cargos = 1; cargos != 10; cargos++){
		mysql_format(Dados, Query, sizeof Query, "UPDATE `Orgs` SET `SalarioCargo%d` = '%d' WHERE `OrgId` = '%d'",
			cargos, OrgInfo[org][SalarioCargo][cargos], org);
		mysql_tquery(Dados, Query);
	}
	for(new i; i<MAX_CARROS; i++){
		if(OrgVeiculo[org][i][VeiculoModelo] == 0) continue;
		mysql_format(Dados, Query, sizeof Query, "UPDATE `Orgs` SET `VeiculoSpawnX%d` = '%f',\
		 `VeiculoSpawnY%d` = '%f', `VeiculoSpawnZ%d` = '%f', `VeiculoSpawnA%d` = '%f', `VeiculoModelo%d` = '%d' WHERE `OrgId` = '%d'",
		 i, OrgVeiculo[org][i][VeiculoSpawn][0], i, OrgVeiculo[org][i][VeiculoSpawn][1], i, OrgVeiculo[org][i][VeiculoSpawn][2], i, OrgVeiculo[org][i][VeiculoSpawn][3],
		 i, OrgVeiculo[org][i][VeiculoModelo], org);
		mysql_tquery(Dados, Query);
	}
}
nome(playerid){
	static name[24];
	GetPlayerName(playerid, name, sizeof name);
	return name;
}
LoadVehicle(playerid){
    new Query[100];
	for(new i; i<MAXCONCE; i++){
		mysql_format(Dados, Query, sizeof Query, "SELECT * FROM `Conce` WHERE `Nome` = '%e' AND `vehid` = '%d'", nome(playerid), i);
		mysql_tquery(Dados, Query, "LoadPlayerVehicle", "ii", playerid, i);
	}
}
function LoadPlayerVehicle(playerid, i){
	new rows;
	cache_get_row_count(rows);
	if(rows){
			cache_get_value_name_int(0, "vehid", VehInfo[playerid][i][vehid]);
			cache_get_value_name_int(0, "Veiculo", VehInfo[playerid][i][IDCarro]);
		    cache_get_value_name_float(0, "X", VehInfo[playerid][i][Vx]);
		    cache_get_value_name_float(0, "Y", VehInfo[playerid][i][Vy]);
		    cache_get_value_name_float(0, "Z", VehInfo[playerid][i][Vz]);
		    cache_get_value_name_bool(0, "Apreendido", VehInfo[playerid][i][Apreendido]);

		    cache_get_value_name_float(0, "Rotacao", VehInfo[playerid][i][Rotacao]);
		   
		    if(!VehInfo[playerid][i][Apreendido]){
		    	VehInfo[playerid][i][Carro] = CriarVeiculo("nao esta apreendido ( normal //print)", VehInfo[playerid][i][IDCarro], VehInfo[playerid][i][Vx], VehInfo[playerid][i][Vy], VehInfo[playerid][i][Vz]+1, VehInfo[playerid][i][Rotacao], VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][0], VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][1], -1);
		    	carregarComponentes(playerid, i);
		    }
		    cache_get_value_name_bool(0, "Desmanchado", VeiculoConfiguracao[ VehInfo[playerid][i][Carro] ][Desmanchado]);
	     
	        if(VeiculoConfiguracao[ VehInfo[playerid][i][Carro] ][Desmanchado]){
	        	DesmancharVeiculo(VehInfo[playerid][i][Carro]);
	        }
	        cache_get_value_name_int(0, "Gasolina", VeiculoInfo[ VehInfo[playerid][i][Carro] ][Gasolina]);
	        Portas(VehInfo[playerid][i][Carro]);
	        
	        cache_get_value_name_int(0, "IPVA", VehInfo[playerid][i][IPVA]);

	        format(VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Trancou], 24, nome(playerid));
	        VeiculoTrancado[VehInfo[playerid][i][Carro]] = true;
	        cache_get_value_name_bool(0, "Quebrado", VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Quebrado]);
	       
	        if(VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Quebrado])
	        	SetVehicleHealth(VehInfo[playerid][i][Carro], 300);
	       
	       	cache_get_value_name_int(0, "Cor1", VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][0]);
	       	cache_get_value_name_int(0, "Cor2", VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][1]);
			ChangeVehicleColours(VehInfo[playerid][i][Carro],  VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][0], VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][1]);

	        cache_get_value_name(0, "Placa", VehInfo[playerid][i][Placa], 8);
	       	if(!isnull(VehInfo[playerid][i][Placa]) || strcmp(VehInfo[playerid][i][Placa], "NULL", true)){
	       		new str[12];
	       		format(str, sizeof str, "%s", VehInfo[playerid][i][Placa]);
	       		VehInfo[playerid][i][PlacaText] = Create3DTextLabel(str, -1, 0,0,0, 9.0, 0);// testLOS=0)
	       		Attach3DTextLabelToVehicle(VehInfo[playerid][i][PlacaText], VehInfo[playerid][i][Carro], 0.0,0.0,0.0);
	       	}
	        cache_get_value_name_float(0, "KMR", VeiculoInfo[VehInfo[playerid][i][Carro]][Mileage]);

			for(new c; c < 60; c++){
				new str[12];
				format(str, sizeof str, "Item%d", c);
				cache_get_value_name_int(0, str, VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Item][c]);
				format(str, sizeof str, "Quantia%d", c);
				cache_get_value_name_int(0, str, VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Quantia][c]);
		
			}
			format(VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Trancou], 24, nome(playerid));
		

	}
	return 1;
}

Portas(carro){
	new bool:engine,bool:lights,bool:alarm,bool:doors,bool:bonnet,bool:boot,bool:objective;
    GetVehicleParamsEx(carro,engine,lights,alarm,doors,bonnet,boot,objective);
   	if(doors == true) return SetVehicleParamsEx(carro,engine,lights,alarm,false,bonnet,boot,objective);
	else
		SetVehicleParamsEx(carro,engine,lights,alarm,true,bonnet,boot,objective);
	return true;
}
VerBanimento(playerid)
{
	new Query[155], Cache:R, ip[16];

	GetPlayerIp(playerid, ip, sizeof(ip));
	mysql_format(Dados, Query, sizeof(Query), "SELECT * FROM `Banidos` WHERE `Ip` = '%s' OR `Nome` = '%e'", ip, nome(playerid));
	R = mysql_query(Dados, Query);
    if(cache_is_valid(R)){
    	new rows = cache_num_rows();
    	if(rows){
			new str[186], name[24],Motivo[32];
			cache_get_value_name(0, "Staff", name, 24);
			cache_get_value_name(0, "Motivo", Motivo, 32);
			format(str, sizeof(str), "{fff000}%s{ffffff} Baniu este ip e conta pelo motivo '{ff0000}%s{ffffff}'.\n{ffffff}Va ao discord pedir atendimento se for um erro.", name,Motivo);
			ShowPlayerDialog(playerid, DIALOG_KICK, DIALOG_STYLE_MSGBOX, "{fff000}Aviso de banimento", str, "Ok", "");
			SetTimerEx("kickar", 900, false, "i", playerid);
		}
	}
	if(cache_is_valid(R))cache_delete(R);
	return 1;
}
ConvertPayday(number)
{
    new hours = 0, mins = 0, secs = 0, string[128];
    hours = floatround(number / 3600);
    mins = floatround((number / 60) - (hours * 60));
    secs = floatround(number - ((hours * 3600) + (mins * 60)));
    new days = 0;

    if(hours >= 24)
    {
        days = floatround((hours/24), floatround_floor);
        hours = hours % 24;
    }

    if(days > 0)
    {
        format(string, 100, "%d dias, %dh %dm e %ds", days, hours, mins, secs);
    }
    else if(hours > 0)
    {
        format(string, 100, "%02dh, %02dm e %02ds", hours, mins, secs);
    }
    else
    {
        format(string, 100, "%02d:%02d", mins, secs);
    }
    return string;
}
Convert(number)
{
    new hours = 0, mins = 0, secs = 0, string[128];
    hours = floatround(number / 3600);
    mins = floatround((number / 60) - (hours * 60));
    secs = floatround(number - ((hours * 3600) + (mins * 60)));
    new days = 0;

    if(hours >= 24)
    {
        days = floatround((hours/24), floatround_floor);
        hours = hours % 24;
    }

    if(days > 0)
    {
        format(string, 100, "%d dias, %dh %dm e %ds", days, hours, mins, secs);
    }
    else if(hours > 0)
    {
        format(string, 100, "%02dh, %02dm e %02ds", hours, mins, secs);
    }
    else
    {
        format(string, 100, "%02dm e%02ds", mins, secs);
    }
    return string;
}

MensagemLocal(Float:dist, playerid, cor, const textt[], bool:bubble = false)
{
	#pragma unused bubble
    new Float:x, Float: y, Float: z;
    GetPlayerPos(playerid, x,y,z);
    //if(bubble) SetPlayerChatBubble(playerid, textt, cor, dist, 15000);
    foreach(new i: Player){
        if(ISP(i, dist, x,y,z) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)){
            SendClientMessage(i, cor, textt);
        }
    }
    return true;
}
GivePlayerCash(playerid, total){
	GivePlayerMoney(playerid, total);
	PlayerInfo[playerid][Dinheiro] += total;
	return 1;
}
GetPlayerCash(playerid){
	return PlayerInfo[playerid][Dinheiro];
}
ResetPlayerCash(playerid){
	PlayerInfo[playerid][Dinheiro] = 0;
	ResetPlayerMoney(playerid);
	return 1;
}
SalvarConta(playerid){
	new hora, minuto, segundo, dia, mes, ano, lastlogin[32];
	gettime(hora, minuto, segundo);
	getdate(ano, mes, dia);

	format(lastlogin, sizeof lastlogin, "%02d/%02d/%02d (%02d:%02d)", dia,mes,ano, hora, minuto);
	GetPlayerPos(playerid, PlayerInfo[playerid][Px], PlayerInfo[playerid][Py], PlayerInfo[playerid][Pz]);
	static query[550];
	format(query, sizeof query, "UPDATE `Contas` SET `Dinheiro` = '%d', `Genero` = '%d', `Skin` = %d, `TipoPrisao` = %d, `Trabalho` = %d, `DinheiroPD` = %d, `Admin` = %d, `Fome` = %d, `Sede` = %d, `VoipMutado` = %d, `VezesPreso` = %d, `Org` = %d, `Cargo` = %d WHERE `userid` = '%d'",
	PlayerInfo[playerid][Dinheiro], PlayerInfo[playerid][Genero], PlayerInfo[playerid][Skin], PlayerInfo[playerid][TipoPrisao], PlayerInfo[playerid][Emprego], PlayerInfo[playerid][DinheiroPD], NivelAdmin[playerid], PlayerInfo[playerid][Fome], PlayerInfo[playerid][Sede], PlayerInfo[playerid][VoipMutado], PlayerInfo[playerid][VezesPreso], PlayerInfo[playerid][Org], PlayerInfo[playerid][Cargo], PlayerInfo[playerid][IDFixo]);
	

	mysql_pquery(Dados, query);
	format(query, sizeof query, "UPDATE `Contas` SET `Nivel` = %d, `DeathX` = %f, `DeathY` = %f, `DeathZ` = %f,\
	    `DeathInterior` = %d, `DeathVirtualWorld` = %d, `Ferido` = %d,\
	    `Xp` = %d, `Vip` = %d, `TempoVip` = %d, `Prisao` = %d, `Cash` = %d, \
		`Px` = %f, `Py` = %f, `Pz` = %f, `Interior` = %d, `VirtualWorld` = %d,\
		`CadeiaStaff` = %d, `HorasJogadas` = %d, `Procurado` = %d, `MotivoCadeia` = '%s',\
		`TituloPersonalizado` = '%s', `Titulo` = '%s', `UltimoLogin` = '%s', `Ip` = '%s' WHERE `userid` = '%d'",
		PlayerInfo[playerid][Nivel], PlayerInfo[playerid][DeathPos][0], PlayerInfo[playerid][DeathPos][1], 
		PlayerInfo[playerid][DeathPos][2], PlayerInfo[playerid][DeathInterior], 
		PlayerInfo[playerid][DeathVirtualWorld], PlayerInfo[playerid][Ferido], PlayerInfo[playerid][Xp],
		PlayerInfo[playerid][Vip], PlayerInfo[playerid][TempoVip], PlayerInfo[playerid][Prisao],
		PlayerInfo[playerid][Cash], PlayerInfo[playerid][Px], PlayerInfo[playerid][Py],
		PlayerInfo[playerid][Pz], GetPlayerInterior(playerid),GetPlayerVirtualWorld(playerid),
		PlayerInfo[playerid][CadeiaStaff], PlayerInfo[playerid][HorasJogadas],PlayerInfo[playerid][estrelas],
		PlayerInfo[playerid][MotivoCadeia], PlayerInfo[playerid][TituloPersonalizado], PlayerInfo[playerid][Titulo],
		PlayerInfo[playerid][UltimoLogin], PlayerInfo[playerid][Ip], PlayerInfo[playerid][IDFixo]);
	mysql_pquery(Dados, query);
	query[0] = EOS;
	return 1;
}
CarregarConta(playerid, id){
	if(id != race_check[playerid]) return Kick(playerid);

	if(PlayerInfo[playerid][HorasJogadas] == 0) PlayerInfo[playerid][HorasJogadas] = gettime();
	new Query[90], Cache: R;
	mysql_format(Dados, Query, sizeof(Query), "SELECT * FROM `Contas` WHERE `Nome` = '%e'", nome(playerid));
	R = mysql_query(Dados, Query);
	if(cache_is_valid(R)){
		cache_get_value_name_int(0, "userid",PlayerInfo[playerid][IDFixo]);
		cache_get_value_name_int(0, "Skin", PlayerInfo[playerid][Skin]);
	    cache_get_value_name_int(0, "Skin", PlayerInfo[playerid][Skin]);
	    cache_get_value_name_int(0, "TipoPrisao", PlayerInfo[playerid][TipoPrisao]);
	    cache_get_value_name_int(0, "Trabalho", PlayerInfo[playerid][Emprego]);
	    cache_get_value_name_int(0, "DinheiroPD", PlayerInfo[playerid][DinheiroPD]);
	    cache_get_value_name_int(0, "Admin", NivelAdmin[playerid]);
	    cache_get_value_name_int(0, "Fome", PlayerInfo[playerid][Fome]);
	    cache_get_value_name_int(0, "Sede", PlayerInfo[playerid][Sede]);
	    cache_get_value_name_int(0, "VoipMutado", PlayerInfo[playerid][VoipMutado]);
	    cache_get_value_name_int(0, "VezesPreso", PlayerInfo[playerid][VezesPreso]);
	    cache_get_value_name_int(0, "Org", PlayerInfo[playerid][Org]);
	    cache_get_value_name_int(0, "Cargo", PlayerInfo[playerid][Cargo]);
	    cache_get_value_name_int(0, "Nivel", PlayerInfo[playerid][Nivel]);
	    cache_get_value_name_int(0, "Genero", PlayerInfo[playerid][Genero]);
	    cache_get_value_name_float(0, "DeathX", PlayerInfo[playerid][DeathPos][0]);
	    cache_get_value_name_float(0, "DeathY", PlayerInfo[playerid][DeathPos][1]);
	    cache_get_value_name_float(0, "DeathZ", PlayerInfo[playerid][DeathPos][2]);
	    cache_get_value_name_int(0, "DeathInterior", PlayerInfo[playerid][DeathInterior]);
	    cache_get_value_name_int(0, "DeathVirtualWorld", PlayerInfo[playerid][DeathVirtualWorld]);
	    cache_get_value_name_int(0, "Ferido", PlayerInfo[playerid][Ferido]);
	    cache_get_value_name_int(0, "Xp", PlayerInfo[playerid][Xp]);
	    cache_get_value_name_int(0, "Vip", PlayerInfo[playerid][Vip]);
	    cache_get_value_name_int(0, "TempoVip", PlayerInfo[playerid][TempoVip]);
	    cache_get_value_name_int(0, "Prisao", PlayerInfo[playerid][Prisao]);
	    cache_get_value_name_int(0, "Cash", PlayerInfo[playerid][Cash]);
	    cache_get_value_name_float(0, "Px", PlayerInfo[playerid][Px]);
	    cache_get_value_name_float(0, "Py", PlayerInfo[playerid][Py]);
	    cache_get_value_name_float(0, "Pz", PlayerInfo[playerid][Pz]);
	    cache_get_value_name_int(0, "Interior", PlayerInfo[playerid][InteriorPlayer]);
	    cache_get_value_name_int(0, "VirtualWorld", PlayerInfo[playerid][VirtualWorld]);
	    cache_get_value_name_int(0, "CadeiaStaff", PlayerInfo[playerid][CadeiaStaff]);
	    cache_get_value_name_int(0, "HorasJogadas", PlayerInfo[playerid][HorasJogadas]);
	    cache_get_value_name_int(0, "Procurado", PlayerInfo[playerid][estrelas]);
	    cache_get_value_name_int(0, "Dinheiro", PlayerInfo[playerid][Dinheiro]);

	
	    if(PlayerInfo[playerid][VoipMutado]){
	        //SvMutePlayerEnable(playerid);
	        SendClientMessage(playerid, LIGHTBLUE, "|INFO| Seu voip foi mutado por um Admin.");
	    }

	    cache_get_value_name(0, "MotivoCadeia", PlayerInfo[playerid][MotivoCadeia]);
	    cache_get_value_name(0, "TituloPersonalizado", PlayerInfo[playerid][TituloPersonalizado]);
	    cache_get_value_name(0, "Titulo", PlayerInfo[playerid][Titulo]);
	    cache_get_value_name(0, "UltimoLogin", PlayerInfo[playerid][UltimoLogin]);
	    cache_get_value_name(0, "Ip", PlayerInfo[playerid][Ip]);
	}

	PlayerInfo[playerid][Logado] = true;
	SetPVarInt(playerid, "Admin", NivelAdmin[playerid]);
	SetPlayerScore(playerid, PlayerInfo[playerid][Nivel]);
	carregarBanco(playerid);
	if(PlayerInfo[playerid][CadeiaStaff] > 0) SendClientMessage(playerid, LIGHTBLUE, "INFO | Voce foi preso por um admin na cadeia staff. Va ao discord checar a aba denuncias.");
	MostrarFomeSede(playerid);

	OnPlayerAfterLogin(playerid);
	return 1;
}

function OnPlayerAfterLogin(playerid){
	GivePlayerMoney(playerid, PlayerInfo[playerid][Dinheiro]);
	SetPlayerWantedLevel(playerid, PlayerInfo[playerid][estrelas]);
	SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
	CarregarMochila(playerid);
	ConectarVIP(playerid);
    if(PlayerInfo[playerid][Skin] != 0){
		TogglePlayerSpectating(playerid, false);
		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin], PlayerInfo[playerid][Px],PlayerInfo[playerid][Py],PlayerInfo[playerid][Pz],90.0);    	//editaq
   		SpawnPlayer(playerid);
    }
    else{
    	StartPlayerSkin(playerid);
		interpolarSkin(playerid);

    }
	return 1;
}
salvarComponentes(playerid, carro){
	for(new i; i<13; i++){
		new model;
		model = GetVehicleComponentInSlot(VehInfo[playerid][carro][Carro], i);
		if(model != 0){
			new str[150];
			format(str, sizeof str, "Componente%d", i);
			mysql_format(Dados, str, sizeof str, "UPDATE Conce SET Componente%d = '%d' WHERE vehid = '%d' AND nome = '%s'", 
				i, model, carro, nome(playerid));
			mysql_tquery(Dados, str);
			RemoveVehicleComponent(VehInfo[playerid][carro][Carro], model);
		}
	}
	return 1;
}
carregarComponentes(playerid, carro){
	new Query[95];
	mysql_format(Dados, Query, sizeof Query, "SELECT * FROM `Conce` WHERE `nome` = '%s' AND `vehid` = '%d'", nome(playerid), carro);
	mysql_tquery(Dados, Query, "LoadComp", "ii",playerid, carro);
	return 1;
}
function LoadComp(playerid, vehicle_id){
	new cache;
	cache_get_row_count(cache);
	if(cache){
		for(new i; i <13; i++){
			new query[17], value;
			format(query, sizeof query, "Componente%d", i);
			cache_get_value_name_int(0, query, value);
			if(value != 0)
				AddVehicleComponent(VehInfo[playerid][vehicle_id][Carro], value);
		}
	}
	return 1;
}
SalvarCarro(playerid, i){
	if(VehInfo[playerid][i][IDCarro] != 0){
		//////////printf("%d, %s, %d, %d quando deslogou.", i, nome(playerid), VehInfo[playerid][i][IDCarro], VehInfo[playerid][i][vehid]);
		Portas(VehInfo[playerid][i][Carro]);
		salvarComponentes(playerid, i);
		new Query[295], Float: X, Float: Y, Float: Z, Float: A;
		GetVehiclePos(VehInfo[playerid][i][Carro], X, Y, Z);

		GetVehicleZAngle(VehInfo[playerid][i][Carro], A);
		mysql_format(Dados, Query, sizeof(Query), "UPDATE `Conce` SET `Veiculo` = '%d', `X` = '%f', `Y` = '%f',\
		`Z` = '%f', `Rotacao` = '%f', `Cor1` = '%d',\
	 	`Cor2` = '%d', `KMR` = '%f' WHERE `vehid` = '%d' AND `nome` = '%e'",
		VehInfo[playerid][i][IDCarro],X,Y,Z,A,VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][0],VeiculoInfo[VehInfo[playerid][i][Carro]][CorVeiculo][1], VeiculoInfo[VehInfo[playerid][i][Carro]][Mileage], VehInfo[playerid][i][vehid], nome(playerid));
		mysql_pquery(Dados, Query);

		mysql_format(Dados, Query, sizeof Query, "UPDATE `Conce` SET `IPVA` = '%d', `Placa` = '%s', `Apreendido` = '%d', `Quebrado` = '%d', `Gasolina` = '%d', `Desmanchado` = '%d', `VehVw` = '%d' WHERE `Nome` = '%s' AND `vehid` = '%d'",
			VehInfo[playerid][i][IPVA], VehInfo[playerid][i][Placa], (VehInfo[playerid][i][Apreendido] ? (1) : (0)), (VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Quebrado] ? (1) : (0)), VeiculoInfo[VehInfo[playerid][i][Carro]][Gasolina], (VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Desmanchado] ? (1) : (0)), GetVehicleVirtualWorld(VehInfo[playerid][i][Carro]), nome(playerid), VehInfo[playerid][i][vehid]);
		mysql_tquery(Dados, Query);
		
		for(new c; c < 60; c++){
			mysql_format(Dados, Query, sizeof(Query), "UPDATE `Conce` SET `Item%d` = '%d', `Quantia%d` = '%d' WHERE `vehid` = '%d' AND `nome` = '%s'",
				c, VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Item][c], c, VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Quantia][c], VehInfo[playerid][i][vehid], nome(playerid));
			mysql_tquery(Dados, Query);
			VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Item][c] = 0;
			VeiculoConfiguracao[VehInfo[playerid][i][Carro]][Quantia][c] = 0;
		}
	    if(!isnull(VehInfo[playerid][i][Placa])){
	   		Delete3DTextLabel(VehInfo[playerid][i][PlacaText]);       	
      	}
		VeiculoTrancado[VehInfo[playerid][i][Carro]] = false;

		DestroyVehicleEx(VehInfo[playerid][i][Carro], "Salvo para o DB (usado)");
		new Reset[VehicleInfo];//, reset2[VehicleOperatorSystem];
		VehInfo[playerid][i] = Reset;
	}
}
stock GetPlayerSerial(playerid){
	new serial[41 + 1];
	GPCI(playerid, serial, sizeof serial);
	return serial;
}
vNegociacao(playerid){
	if(Comprador[playerid]){
	    Negociando[GetPVarInt(playerid, "quemcasa")] = false;
	    Comprador[playerid] = false;
	    SendClientMessage(GetPVarInt(playerid, "quemcasa"), -1, "|INFO| - O Jogador desconectou.");
		DeletePVar(playerid, "valorcasa");
		DeletePVar(playerid, "idcasa");
		DeletePVar(playerid, "quemcasa");
	}
	return 1;
}
SalvarMoradores(casa){
	static Query[170];
	for(new i2; i2 < 4; i2++){
	   	mysql_format(Dados, Query, sizeof Query, "UPDATE `Casas` SET `AluguelNome%d` = '%s' WHERE `Casaid` = '%d'", i2, InfoAluguel[casa][i2][AluguelNome], casa); 	
    	mysql_tquery(Dados, Query);
    }
}
SalvarCasa(i){
	new Query[420];
	mysql_format(Dados, Query, sizeof Query, "UPDATE `Casas` SET \
	`Dono` = '%s', `CasaX` = '%f', \
	`CasaY` = '%f', `CasaZ` = '%f', \
	`SaidaX` = '%f', `SaidaY` = '%f', \
	`SaidaZ` = '%f', `Interior` = '%d', \
	`Aluguel` = '%d', \
	`PrecoCasa` = '%d', `CasaComprada` = '%d', `Trancada` = '%d', `CasaVip` = '%d' WHERE `Casaid` = '%d'",
	InfoCasa[i][Dono], InfoCasa[i][CasaX],
	InfoCasa[i][CasaY], InfoCasa[i][CasaZ],
	InfoCasa[i][SaidaX], InfoCasa[i][SaidaY],
	InfoCasa[i][SaidaZ], InfoCasa[i][Interior],
	InfoCasa[i][Aluguel],
    InfoCasa[i][PrecoCasa], InfoCasa[i][CasaComprada], InfoCasa[i][Trancada], InfoCasa[i][CasaVip], i);
	mysql_tquery(Dados, Query);
    return i;
}
ContarCasas(playerid){
	new cont;
	foreach(new i: B_House){
	    if(InfoCasa[i][CasaCriada] && InfoCasa[i][CasaComprada] == 1 && !strcmp(nome(playerid), InfoCasa[i][Dono], false, 24)){
	        cont++;
			if(PlayerInfo[playerid][Vip] == 0 || PlayerInfo[playerid][Vip] == 1){
				if(cont == 2){
		            return true;
				}
			}
			else if(PlayerInfo[playerid][Vip] == 2){
				if(cont == 3){
					return true;
				}
			}
			else if(PlayerInfo[playerid][Vip] == 3){
				if(cont == 5){
					return true;
				}
			}
		}
	}
	return false;
}
RenomearCasas(playerid, const onome[]){
	foreach(new i: B_House){
	    if(InfoCasa[i][CasaCriada] && InfoCasa[i][CasaComprada] == 1 && !strcmp(nome(playerid), InfoCasa[i][Dono], false, 24)){
	        format(InfoCasa[i][Dono], 24, onome);
	        SendClientMessage(playerid, Amarelo, "|INFO| Residencias foram renomeadas.");
		    InfoCasa[i][PrecoCasa] = 0;
			new str[190];

			if(InfoCasa[i][CasaVip] > 0)
				format(str, sizeof(str), TEXTO_COMPRADOV, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]),InfoCasa[i][Aluguel]);
			else
				format(str, sizeof(str), TEXTO_COMPRADO, i, nome(playerid), CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]),InfoCasa[i][Aluguel]);
	
			UpdateDynamic3DTextLabelText(InfoCasa[i][CasaLabel], -1, str);
		}
	}
	return false;
}
CriarCasa(VipH, Float: ux, Float: uy, Float: uz, Float: Sx, Float: Sy, Float: Sz, interior, preco){
	for(new i = 0; i<MAX_CASAS; i++){
	    if(!InfoCasa[i][CasaCriada]){
	        new Query[255];
	        mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Casas` (`Casaid`, `PrecoCasa`, `CasaX`, `CasaY`, `CasaZ`, `SaidaX`, `SaidaY`, `SaidaZ`) VALUES \
	        												('%d',   '%d',      '%f',  '%f',  '%f',  '%f',   '%f',   '%f')", 
	        												 i,      preco,     ux,    uy,    uz,    Sx,     Sy,     Sz);
			mysql_tquery(Dados, Query);

			mysql_format(Dados, Query, sizeof Query, "UPDATE `Casas` SET `Interior` = '%d', `CasaVip` = '%d', `Dono` = 'Ninguem' WHERE `Casaid` = '%d'", interior, VipH, i);
			mysql_tquery(Dados, Query);

	        InfoCasa[i][CasaCriada] = true;
	        InfoCasa[i][CasaX] = ux;
	        InfoCasa[i][CasaY] = uy;
	        InfoCasa[i][CasaVip] = VipH;
	        InfoCasa[i][CasaZ] = uz;
	        InfoCasa[i][SaidaX] = Sx;
	        InfoCasa[i][casaid] = i;
	        InfoCasa[i][SaidaY] = Sy;
			format(InfoCasa[i][Dono], 24, "Ninguem");
	        InfoCasa[i][SaidaZ] = Sz;
	        InfoCasa[i][Interior] = interior;
	        InfoCasa[i][PrecoCasa] = preco;
	        InfoCasa[i][Trancada] = 0;
	        InfoCasa[i][CasaComprada] = 0;
	        AlterarCasaIcon(i);
	        //, STREAMER_TAG_AREA:areaid = STREAMER_TAG_AREA:-1, priority = 0)
	        //////////printf("%f   |   %f   |  %f      (%d)",InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ], i);
	        new str[190];
	        if(InfoCasa[i][CasaVip])
	        	format(str, sizeof(str), TEXTO_AVENDAV, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
	        else
	        	format(str, sizeof(str), TEXTO_AVENDA, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
	        
	        InfoCasa[i][CasaLabel] = CreateDynamic3DTextLabel(str, -1, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ], 3.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
	        InfoCasa[i][PickCasa] = CreateDynamicPickup(19522, 1, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]);
			Iter_Add(B_House, i);
			return i;
		}
	}
	return -1;
}
AlterarCasaIcon(i){
	if(IsValidDynamicMapIcon(InfoCasa[i][MapCasa])) DestroyDynamicMapIcon(InfoCasa[i][MapCasa]);

	if(!InfoCasa[i][CasaComprada])
		InfoCasa[i][MapCasa] = CreateDynamicMapIcon(InfoCasa[i][CasaX],InfoCasa[i][CasaY], InfoCasa[i][CasaZ], 31, 0, -1, -1, -1, 150.0, MAPICON_LOCAL);
	else
		InfoCasa[i][MapCasa] = CreateDynamicMapIcon(InfoCasa[i][CasaX],InfoCasa[i][CasaY], InfoCasa[i][CasaZ], 32, 0, -1, -1, -1, 150.0, MAPICON_LOCAL);
	
}
function CriarGaragem(playerid, valorr){
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	for(new i; i < MAX_GARAGENS; i++){
		if(GaragemInfo[i][GaragemX] != 0) continue;
		
		GaragemInfo[i][GaragemX] = X;
		GaragemInfo[i][GaragemY] = Y;
		GaragemInfo[i][GaragemZ] = Z;
		GaragemInfo[i][GaragemPreco] = valorr;
		GaragemInfo[i][GaragemTrancada] = false;
		GaragemInfo[i][GaragemComprada] = false;
		GaragemInfo[i][Garagemid] = i;
		format(GaragemInfo[i][GaragemDono], 24, "Ninguem");
		new str[255];
		mysql_format(Dados, str, sizeof str, "INSERT INTO `Garagens` (`GaragemPreco`, `GaragemComprada`, `GaragemX`, `GaragemY`, `GaragemZ`, `Garagemid`) VALUES (\
			'%d', '%d', '%f', '%f', '%f', '%d')",
			valorr, 0, X,Y,Z,i);
		mysql_tquery(Dados, str);
		format(str, sizeof str, TEXTO_GARAGEMAVENDA, i, GaragemInfo[i][GaragemDono],GaragemInfo[i][GaragemPreco], CoordZone(GaragemInfo[i][GaragemX],GaragemInfo[i][GaragemY],GaragemInfo[i][GaragemZ]));
		GaragemInfo[i][GaragemTexto] = CreateDynamic3DTextLabel(str, -1, X,Y,Z, 30.0);//, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
		return i;
	}
	return 1;
}
SalvarGaragem(i){
	new query[255];
	mysql_format(Dados, query, sizeof query, "UPDATE Garagens SET \
		`GaragemPreco` = '%d',\
		`GaragemTrancada` = '%d',\
		`GaragemComprada` = '%d',\
		`GaragemDono` = '%s',\
		`GaragemX` = '%f',\
		`GaragemY` = '%f',\
		`GaragemZ` = '%f' WHERE `Garagemid` = '%d'", GaragemInfo[i][GaragemPreco], (GaragemInfo[i][GaragemTrancada] ? (1) : (0)), (GaragemInfo[i][GaragemComprada] ? (1) : (0)), GaragemInfo[i][GaragemDono],
		GaragemInfo[i][GaragemX], GaragemInfo[i][GaragemY], GaragemInfo[i][GaragemZ], i);
	mysql_tquery(Dados, query);
	return 1;
}
cmd:comprargaragem(playerid)
{
	foreach(new i: GaragensIterator)
	{	
		if(IsPlayerInRangeOfPoint(playerid, 1.5, GaragemInfo[i][GaragemX], GaragemInfo[i][GaragemY], GaragemInfo[i][GaragemZ])){
            if(GaragemInfo[i][GaragemPreco] <= 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode comprar esta garagem.");
		    if(DonoDaGaragem(playerid, i)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Esta casa ja e sua!");
	 		if(GetPlayerCash(playerid) < GaragemInfo[i][GaragemPreco]) return SendClientMessage(playerid, -1, "Voce Nao tem dinheiro suficiente.");
			if(!strcmp(GaragemInfo[i][GaragemDono], "Ninguem", false, 24)){
				ComprarGaragem(playerid, i);
			}
			else
			{
			    foreach(new p: Player)
				{
					if(IsPlayerOnline(GaragemInfo[i][GaragemDono])){
						BancoInfo[p][Dinheiro] += GaragemInfo[i][GaragemPreco];
						SendClientMessage(p, LIGHTBLUE, fString("|INFO| Alguem acaba de comprar sua Garagem em %s, o dinheiro foi para o banco.", CoordZone(GaragemInfo[i][GaragemX],GaragemInfo[i][GaragemY],GaragemInfo[i][GaragemZ])));
						break;
					}
					else{
						new Query[90], Cache: R;
						mysql_format(Dados, Query, sizeof(Query), "SELECT `Nome` FROM `Contas` WHERE `Nome` = '%s'", InfoCasa[i][Dono]);
						R = mysql_query(Dados, Query);
						if(cache_is_valid(R)){
							new rows = cache_num_rows();
							if(rows){
								mysql_format(Dados, Query, sizeof(Query), "UPDATE `Contas` SET `Banco` = `Banco` + '%d' WHERE `Nome` = '%s'", InfoCasa[i][PrecoCasa], InfoCasa[i][Dono]);
								mysql_tquery(Dados, Query);
								SendClientMessage(playerid, LIGHTBLUE, "|INFO| O dono da casa nao estava online, o dinheiro foi para a conta dele.");
							}
						}
						if(cache_is_valid(R))cache_delete(R);
						break;
					}
				}
				ComprarGaragem(playerid, i);
			}
			SalvarCasa(i);
		}
	}
	return 1;
}
ComprarGaragem(playerid, i){
	format(GaragemInfo[i][GaragemDono], 24, nome(playerid));
	new str[190];
	format(str, sizeof(str), TEXTO_GARAGEMCOMPRADA, i, GaragemInfo[i][GaragemDono], CoordZone(GaragemInfo[i][GaragemX],GaragemInfo[i][GaragemY],GaragemInfo[i][GaragemZ]));
	UpdateDynamic3DTextLabelText(GaragemInfo[i][GaragemTexto], -1, str);
	GivePlayerCash(playerid, -GaragemInfo[i][GaragemPreco]);
	SendClientMessage(playerid, -1, "{00ff15}Garagem comprada! pressione 'Y' para entrar na Garagem.");
	GaragemInfo[i][GaragemComprada] = true;
	GaragemInfo[i][GaragemPreco] = 0;
	SalvarGaragem(i);
}
DonoDaGaragem(playerid, garagem){
	if(!isnull(GaragemInfo[garagem][GaragemDono]) && !strcmp(nome(playerid), GaragemInfo[garagem][GaragemDono]))
		return true;
	return false;
}
AdminMessage(cor, const msg[])
{
	foreach(new i: Player){
	    if(PlayerInfo[i][Admin] > 0){
     		SendClientMessage(i, cor, msg);
		}
	}
	return 0;
}
MessageOrg(org, cor,const msg[]){
    foreach(new i: Player){
    	if(PlayerInfo[i][Admin] == 11 && org != PlayerInfo[i][Org]) SendClientMessage(i, cor, msg);
	    if(PlayerInfo[i][Org] == org && TemItem(i, RADINHO)){
     		SendClientMessage(i, cor, msg);
		}
	}
	return 0;
}
cmd:boquete(playerid, params[]){
	new id;
    if(sscanf(params, "i", id)) return SendClientMessage(playerid, LIGHTBLUE, "/boquete [id]");
    new achou = -1;
    foreach(new i: Player){
    	if(PlayerInfo[i][IDFixo] == id){
    		achou = i;
    		id = i;
    	}
    }
    if(achou == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador esta offline.");
    if(id == playerid) return 1;
    if(DistanciaEntrePlayers(playerid, id) > floatround(1.2)) return SendClientMessage(playerid, LIGHTBLUE, "* Chegue mais perto deste jogador!");
    new string[78];
    new Float:angle, Float:x, Float:y, Float:z;
    GetPlayerPos(id, x, y, z);
    GetXYInFrontOfPlayer(id, x, y, 0.8);
    SetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(id, angle);
   	SetPlayerFacingAngle(playerid, angle + 180);
    format(string, sizeof(string),"*%s paga um boquete para %s.", nome(playerid), nome(id));
    MensagemLocal(30.0, playerid, Roxoeu, string);
    ApplyAnimationEx(playerid,"BLOWJOBZ","BJ_COUCH_LOOP_W",3.1,0,1,1,0,0,SYNC_ALL);
    ApplyAnimationEx(id,"BLOWJOBZ","BJ_COUCH_END_P",3.1,0,1,1,0,0,SYNC_ALL);
    return 1;
}
cmd:dance(playerid, params[])
{
	if(PlayerInfo[playerid][Ferido]) return 1;

  
    new dancing;
    if(sscanf(params, "d", dancing))
    {
        SendClientMessage(playerid,LIGHTBLUE," Use: /dance [1-15]");
        return true;
    }
    if(dancing < 1 || dancing > 15) return SendClientMessage(playerid, LIGHTBLUE, "Use: /dance [1-15]");
    switch(dancing)
    {
    	//ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
        case 1: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
        case 2: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
        case 3: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
        case 4: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
        case 5:ApplyAnimationEx(playerid, "DANCING","dance_loop", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 6:ApplyAnimationEx(playerid, "DANCING","DAN_Down_A", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 7:ApplyAnimationEx(playerid, "DANCING","DAN_Left_A", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 8:ApplyAnimationEx(playerid, "DANCING","DAN_Loop_A", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 9:ApplyAnimationEx(playerid, "DANCING","DAN_Right_A", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 10:ApplyAnimationEx(playerid, "DANCING","DAN_Up_A", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 11:ApplyAnimationEx(playerid, "DANCING","dnce_M_a", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 12:ApplyAnimationEx(playerid, "DANCING","dnce_M_b", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 13:ApplyAnimationEx(playerid, "DANCING","dnce_M_c", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 14:ApplyAnimationEx(playerid, "DANCING","dnce_M_d", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
        case 15:ApplyAnimationEx(playerid, "DANCING","dnce_M_e", 4.0, 1, 1, 1, 1, 0, SYNC_ALL);
    }
    return true;
}

cmd:sexy(playerid, params[])
{
	new Float:health;
    GetPlayerHealth(playerid,health);
	if(health < 34.0)
		return 1; 

	switch(strval(params))
	{
		case 1: ApplyAnimationEx(playerid, "STRIP", "strip_E", 4.1, 1, 0, 0, 0, 0, SYNC_ALL);
		case 2: ApplyAnimationEx(playerid, "STRIP", "strip_G", 4.1, 1, 0, 0, 0, 0, SYNC_ALL);
		case 3: ApplyAnimationEx(playerid, "STRIP", "STR_A2B", 4.1, 0, 0, 0, 0, 0, SYNC_ALL);
		case 4: ApplyAnimationEx(playerid, "STRIP", "STR_Loop_A", 4.1, 1, 0, 0, 0, 0, SYNC_ALL);
		case 5: ApplyAnimationEx(playerid, "STRIP", "STR_Loop_B", 4.1, 1, 0, 0, 0, 0, SYNC_ALL);
		case 6: ApplyAnimationEx(playerid, "STRIP", "STR_Loop_C", 4.1, 1, 0, 0, 0, 0, SYNC_ALL);
		default: SendClientMessage(playerid, LIGHTBLUE, "USAGE: /sexy [1-6]");
	}
	return 1;
}
function DistanciaEntrePlayers(playerid, id){
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(id, X, Y, Z);
	return floatround(GetPlayerDistanceFromPoint(playerid,  X, Y, Z));
}
function GetXYInFrontOfPlayer(playerid, &Float:q, &Float:w, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, q, w, a);
    if(GetPlayerState(playerid) == PLAYER_STATE:2)
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    else
        GetPlayerFacingAngle(playerid, a);

    q += (distance * floatsin(-a, degrees));
    w += (distance * floatcos(-a, degrees));
    return floatround(a);
}
cmd:tppick(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 10) return 1;
	new id = strval(params);
	SetPlayerPos(playerid, OrgInfo[id][OrgPickPos][0], OrgInfo[id][OrgPickPos][1], OrgInfo[id][OrgPickPos][2]);
	return 1;
}
cmd:cfgint(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "USO: /cfgint [ nome do interior ]");
	new id = -1;
	foreach(new i: B_Interiores){
		if(!strcmp(params, IntInfo[i][NomeInterior])){
			id = i;
			break;
		}
	}
	if(id == -1) return SendClientMessage(playerid, LIGHTRED, "Voce digitou errado o nome deste interior.");
	if(!IntInfo[id][InteriorCriado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce digitou o ID de um interior que nao esta criado.");
	new str[44];
	format(str, sizeof(str), "%s selecionada", IntInfo[id][NomeInterior]);
	ShowPlayerDialog(playerid, DIALOG_CFGINT, DIALOG_STYLE_LIST, str, "{33ccff}Mudar Nome\n{33ccff}Atualizar Entrada\n{33ccff}Atualizar Saida\n{33ccff}Deletar Int", "Ok", "Sair");
	SetPVarInt(playerid, "IntCfg", id);
	return 1;
}
CriarInterior(const nomeint[], Int,Float:X, Float: Y, Float: Z, Float: Sx, Float:Sy, Float:Sz, Tipoicone){
	for(new i = 1; i<MAX_INTERIORES; i++){
	    if(!IntInfo[i][InteriorCriado]){
	        IntInfo[i][InteriorCriado] = true;
	        IntInfo[i][IntX] = X;

	        IntInfo[i][Interior] = Int;
			IntInfo[i][Vw] = i;
	        IntInfo[i][IntY] = Y;
	        IntInfo[i][IntZ] = Z;
	        IntInfo[i][IntsX] = Sx;
	        IntInfo[i][IntsY] = Sy;
	        IntInfo[i][IntsZ] = Sz;
	        IntInfo[i][TipoIcon] = Tipoicone;
			format(IntInfo[i][NomeInterior], 30, nomeint);
			new strr[600];
			mysql_format(Dados, strr, sizeof(strr), "INSERT INTO `Interiores` (`NomeInterior`, `Interiorid`, `VirtualWorld`, `IntX`, `IntY`, `IntZ`, `IntsX`, `IntsY`, `IntsZ`, `TipoIcon`) VALUES ('%s', '%d', '%d', '%f', '%f', '%f', '%f','%f','%f', '%d')", IntInfo[i][NomeInterior], IntInfo[i][Interior], i,
			IntInfo[i][IntX], IntInfo[i][IntY], IntInfo[i][IntZ], IntInfo[i][IntsX], IntInfo[i][IntsY], IntInfo[i][IntsZ], IntInfo[i][TipoIcon]);
			mysql_tquery(Dados, strr);
			Iter_Add(B_Interiores, i);
			new str[90];
			format(str, sizeof(str), "{60a478}%s\n{ffffff}Aperte 'F' para entrar.\n", IntInfo[i][NomeInterior]);
			IntInfo[i][LabelEntrada] = CreateDynamic3DTextLabel(str, -1, X,Y,Z,30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
			IntInfo[i][PickEntrada] = CreateDynamicPickup(19607, 1, X,Y,Z);
		
			format(str, sizeof(str), "{60a478}%s\n{ffffff}Aperte 'F' para sair.\n", IntInfo[i][NomeInterior]);
			IntInfo[i][LabelSaida] = CreateDynamic3DTextLabel(str, -1, Sx,Sy,Sz,30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0 ,i);
			IntInfo[i][PickSaida] = CreateDynamicPickup(19607, 1, Sx,Sy,Sz, i);
			IntInfo[i][Icone] = CreateDynamicMapIcon(X,Y,Z, Tipoicone, -1, 0, 0, -1);//, Float:streamdistance = STREAMER_MAP_ICON_SD, style = MAPICON_LOCAL, STREAMER_TAG_AREA:areaid = STREAMER_TAG_AREA:-1, priority = 0);
			return i;
		}
	}
	return -1;
}
SalvarInteriores(i){
	static Query[350];
	Query[0] = EOS;
	mysql_format(Dados, Query, sizeof(Query), "UPDATE `Interiores` SET `NomeInterior` = '%s', `Interiorid` = '%d', `IntX` = '%f', `IntY` = '%f', `IntZ` = '%f',\
 	`IntsX` = '%f', `IntsY` = '%f', `IntsZ` = '%f', `TipoIcon` = '%d' WHERE `VirtualWorld` = '%d'", IntInfo[i][NomeInterior], IntInfo[i][Interior],IntInfo[i][IntX], IntInfo[i][IntY], IntInfo[i][IntZ], IntInfo[i][IntsX], IntInfo[i][IntsY], IntInfo[i][IntsZ], IntInfo[i][TipoIcon], IntInfo[i][Vw]);
	mysql_tquery(Dados, Query);

}
cmd:menusperto(playerid){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new id = -1;
	foreach(new i: MenusCriados){
		if(IsPlayerInRangeOfPoint(playerid, 1.0, MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ])){
			SendClientMessage(playerid, LIGHTBLUE, "Menus perto encontrados: %d", i);
			id = i;
		}
	}
	if(id == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao esta perto de nenhum menu.");
	return 1;
}
cmd:deletarmenu(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new i = strval(params);
	if(!Number(params) || isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/deletarmenu [ menu id ]");
	if(!MenuInfo[i][MenuCriado]) return SendClientMessage(playerid, LIGHTBLUE, "Este menu nao foi criado.");
	DestroyDynamic3DTextLabel(MenuInfo[i][CompraLabel]);
	MenuInfo[i][MenuCriado] = false;
	Iter_Remove(MenusCriados, i);
	DestroyDynamicPickup(MenuInfo[i][PickMenu]);
	SendClientMessage(playerid, LIGHTBLUE, "O Menu foi deletado.");
    MenuInfo[i][MenuX] = 0;
    MenuInfo[i][MenuY] = 0;
    MenuInfo[i][MenuZ] = 0;
    new str[100];
    mysql_format(Dados, str, sizeof str, "DELETE FROM `Menus` WHERE `Menuid` = '%d'", i);
    mysql_tquery(Dados, str);
    return 1;
}
CriarMenu(playerid, Float:X, Float: Y, Float: Z, tipocompra){
	for(new i; i<MAX_COMPRAS_PICK; i++){
	    if(!MenuInfo[i][MenuCriado]){
	        MenuInfo[i][MenuCriado] = true;
	        MenuInfo[i][MenuX] = X;
	        MenuInfo[i][MVW] = GetPlayerVirtualWorld(playerid);
	        MenuInfo[i][MenuY] = Y;
	        MenuInfo[i][MenuZ] = Z;
	        MenuInfo[i][TipoCompra] = tipocompra;
	        new str[144];
	        format(str, sizeof(str), "{60a478}%s\n{ffffff}Aperte 'Y'",GetTypeLoja(i));
	        //CreateDynamic3DTextLabel(const text[], color, Float:x, Float:y, Float:z, Float:drawdistance, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
			MenuInfo[i][CompraLabel] = CreateDynamic3DTextLabel(str,-1, MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ], 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, MenuInfo[i][MVW]);
			MenuInfo[i][PickMenu] = CreateDynamicPickup(1239, 1, MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ], MenuInfo[i][MVW]);
			//CreateDynamicPick
			new Query[256];
			mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Menus` (`Menuid`, `MenuX`, `MenuY`, `MenuZ`, `TipoCompra`, `MVW`) VALUES ('%d', '%f', '%f', '%f', '%d', '%d');", i, MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ], MenuInfo[i][TipoCompra], MenuInfo[i][MVW]);
			mysql_tquery(Dados, Query);
			Iter_Add(MenusCriados, i);
			return i;
		}
	}
	return -1;
}
GetTypeLoja(loja){
	new str[17];
	switch(MenuInfo[loja][TipoCompra]){
	    case 1:str = "24/7";
		case 2:str = "Banco";
		case 3:str ="Agencia";
		case 4:str = "Comidas";
		case 5:str = "Habilitacoes";
		case 6:str = "Loja De Roupas";
		case 7:str = "Mercado Negro";
		case 8:str = "Ammunation";
		case 9:str = "Emplacamento";
		case 10: str = "Hospital";
		case 11:str = "Acessorios";
		case 12:str= "Criar Conta";
		case 13:str = "Bebidas";
		case 14:str = "Alugar Veiculos";
	}
	return str;
}
cmd:setpos(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new Float: x, Float: y, Float: z;
	if(sscanf(params, "fff", x, y, z)) return SendClientMessage(playerid, LIGHTBLUE, "/setpos [ x ] [ y ] [ z ]");
	SetPlayerPos(playerid, x, y, z);
	return 1;
}
SalvarMenu(i){
	new Query[255];
	mysql_format(Dados, Query, sizeof(Query), "UPDATE Menus SET MenuX = '%f', MenuY = '%f', MenuZ = '%f', TipoCompra = '%d' WHERE Menuid = '%d'", MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ], MenuInfo[i][TipoCompra], i);
    mysql_tquery(Dados, Query);

    mysql_format(Dados, Query, sizeof(Query), "UPDATE Menus SET MVW = '%d' WHERE Menuid = '%d'", MenuInfo[i][MVW], i);
    mysql_tquery(Dados, Query);
    return 1;
}
MochilaCheia(playerid){
	new cont;
	if(PlayerInfo[playerid][Mochila] == 0) return false;
	for(new i; i<32; i++){
	    if(ItemInfo[playerid][i][Item] != NADA){
	        cont ++;
	        if(cont == 32){
	            return true;
			}
		}
	}
	return false;
}
ResetarMochila(playerid){
	
	for(new i; i<32; i++){
		
	    ItemInfo[playerid][i][Quantia] = 0;
	    ItemInfo[playerid][i][Item] = NADA;
	}

	return 1;
}
DiminuirItem(playerid, item, quantia){
	for(new i; i<32; i++){
		if(ItemInfo[playerid][i][Item] == item){
			ItemInfo[playerid][i][Quantia] -= quantia;
			if(ItemInfo[playerid][i][Quantia] == 0){
				ItemInfo[playerid][i][Item] = NADA;
			}
			break;
		}
	}
	return 1;
}
AdicionarItem(playerid, item, quantia){
	if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui mochila.");
	if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Mochila cheia!");
	for(new i; i<32; i++){
		if(ItemInfo[playerid][i][Item] == item){
			ItemInfo[playerid][i][Quantia] += quantia;
			return i;
		}
	    else if(ItemInfo[playerid][i][Item] == NADA){
	        ItemInfo[playerid][i][Quantia] += quantia;
	        ItemInfo[playerid][i][Item] = item;
	        return i;
		}
	}
	return -1;
}
AdicionarItemN(playerid, item, quantia){
	if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui mochila.");
	if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Mochila cheia!");
	for(new i; i<32; i++){
		if(ItemInfo[playerid][i][Item] == NADA){
	        ItemInfo[playerid][i][Quantia] += quantia;
	        ItemInfo[playerid][i][Item] = item;
	        return i;
		}
	}
	return -1;
}
stock IsSkin(skinid){
	if(1 <= skinid <= 311)
		return true;
	return false;
}
stock IsAcessorio(objeto){
	for(new i; i < sizeof Acessorios; i++){
		if(Acessorios[i][AcessorioId] == objeto)
			return true;
	}
	return false;
}
CarregarMochila(playerid)
{
	new Query[120];
	mysql_format(Dados, Query, sizeof Query, "SELECT * FROM `Mochilas` WHERE `userid` = '%d'", PlayerInfo[playerid][IDFixo]);
	mysql_tquery(Dados, Query, "LoadMochila", "i", playerid);
	return 1;
}
function LoadMochila(playerid){
	new rows;
	cache_get_row_count(rows);
	if(rows){
		cache_get_value_name_int(0, "KitReparo", MecMenu[playerid][KitReparo]);
	   	cache_get_value_name_int(0, "Tintas", MecMenu[playerid][Sprays]);
	   	cache_get_value_name_int(0, "KitRodas", MecMenu[playerid][KitRodas]);
	   	cache_get_value_name_int(0, "Gasolinas", MecMenu[playerid][Gasolinas]);
	   	cache_get_value_name_int(0, "TemMochila", PlayerInfo[playerid][Mochila]);

	    for(new i = 0; i<32; i++){
	    	new Query[15];
	        format(Query, sizeof(Query), "Item%d", i);
	        cache_get_value_name_int(0, Query, ItemInfo[playerid][i][Item]);
	        format(Query, sizeof(Query), "Quantia%d", i);
	        cache_get_value_name_int(0, Query, ItemInfo[playerid][i][Quantia]);
		}
	}
}
SalvarMochila(playerid){
	if(PlayerInfo[playerid][Mochila] == 1){
		new Query[256];
		mysql_format(Dados, Query, sizeof Query, "UPDATE `Mochilas` SET `KitReparo` = '%d', \
			`Tintas` = '%d', `KitRodas` = '%d', `Gasolinas` = '%d' WHERE `userid` = '%d'",
			MecMenu[playerid][KitReparo], MecMenu[playerid][Sprays], MecMenu[playerid][KitRodas], MecMenu[playerid][Gasolinas], PlayerInfo[playerid][IDFixo]);
		mysql_tquery(Dados, Query);

		mysql_format(Dados, Query, sizeof(Query), "UPDATE `Mochilas` SET `TemMochila` = '%d' WHERE `userid` = '%d'", PlayerInfo[playerid][Mochila], PlayerInfo[playerid][IDFixo]);
		mysql_tquery(Dados, Query);
		for(new i; i<32; i++){
		    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Mochilas` SET `Item%d` = '%d', \
		    	`Quantia%d` = '%d' WHERE `userid` = '%d'",i, ItemInfo[playerid][i][Item],i, ItemInfo[playerid][i][Quantia], PlayerInfo[playerid][IDFixo]);
			mysql_tquery(Dados, Query);
		}
		//////////printf("Mochila do jogador '%s' salva.", nome(playerid));
	}
	return 1;
}
SendZapMessage(const msg[]){
	foreach(new i: Player){
	    if(TemItem(i, CELULAR) && TemItem(i, CHIP) && TemItem(i, CREDITOS)){
	        SendClientMessage(i, -1, msg);
		}
	}
	return 0;
}
TemItem(playerid, item)
{
	for(new i; i<32; i++){
	    if(ItemInfo[playerid][i][Item] == item){
	        return true;
		}
	}
	return false;
}
CriarItem(playerid, item, quantia)
{
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	for(new i; i<MAX_DROPS; i++){
	    if(!InfoDrop[i][Dropado]){
	        InfoDrop[i][Dropado] = true;
	        InfoDrop[i][DropX] = X;
	        InfoDrop[i][DropY] = Y;
	        InfoDrop[i][DropZ] = Z-1;
			InfoDrop[i][QuantiaItem] = quantia;
			InfoDrop[i][TipoItem] = item;
	        new str[144];
	        InfoDrop[i][OBDrop] = CreateDynamicObject(ConverterParaObjeto(item), X, Y, Z-1, 0.0, 0.0, 0.9);
	        format(str, sizeof(str), "Item %s (%dx)\nAperte 'F'", InventarioName(item), quantia);
			InfoDrop[i][TextoDrop] = CreateDynamic3DTextLabel(str, Cinza, X, Y, Z-1, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
			return i;
		}
	}
	return -1;
}
CriarItemDrop(Float: X, Float: Y, Float: Z, item, quantia){
	for(new i; i<MAX_DROPS; i++){
	    if(!InfoDrop[i][Dropado]){
	        InfoDrop[i][Dropado] = true;
	        InfoDrop[i][DropX] = X;
	        InfoDrop[i][DropY] = Y;
	        InfoDrop[i][DropZ] = Z-1;
			InfoDrop[i][QuantiaItem] = quantia;
			InfoDrop[i][TipoItem] = item;
	        new str[144];
	        InfoDrop[i][OBDrop] = CreateDynamicObject(ConverterParaObjeto(item), X, Y, Z-1, 0.0, 0.0, 0.9);
	        format(str, sizeof(str), "Item %s (%dx)\nAperte 'F'", InventarioName(item), quantia);
			InfoDrop[i][TextoDrop] = CreateDynamic3DTextLabel(str, Cinza, X, Y, Z-1, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
			return i;
		}
	}
	return -1;
}

AbrirCELULAR(playerid){
	if(IsPlayerPreso(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso preso.");

	ShowPlayerDialog(playerid, DIALOG_CELULAR, 5,"{fff000}Seu CELULAR", "{33ccff}Aplicativo\t{33ccff}Funcao\n\
	{25D366}Whatssap\t{ffffff}Mensagens\n\
	{aa33aa}O{33AA33}L{FFA500}X\t{ffffff}Anuncios\n\
	{fff000}Ligar\t{ffffff}Chamada Telefonica\n\
	{ffffff}Transferencia {77dd77}PicPay\t{ffffff}Transferencia Bancaria\n\
	{FFA500}Ataque Terrorista\t{ffffff}<=\n\
	{ff0000}Emergencia\t{ffffff}Chame uma autoridade ou servico", "Ok", "Sair");
	return 1;
}
ConverterParaObjeto(item){
	switch(item){
		case CELULAR: return 330;
		case CREDITOS: return 19234;
		case CHIP: return 19226;
		case CAPACETE: return 18979;
		case RADINHO: return 19942;
		case PIZZA: return 1582;
		case HAMBURGUER: return 2880;
		case COXINHA: return 19574;
		case PRATO_FEITO: return 19636;
		case FEIJOADA: return 19637;
		case BAURU: return 19579;
		case COCA_COLA: return 2601;
		case PEPSI: return 2601;
		case SUCO_LARANJA: return 19563;
		case SUCO_MARACUJA: return 19564;
		case DINAMITE: return 1654;
		case DINHEIRO_FLUTUANTE, DINHEIRO_FLUTUANTE_BANDIDO: return 1212;
	}
	return false;
}
VerItem(playerid, item)
{

	if(item == CAPACETE && IsPlayerAttachedObjectSlotUsed(playerid, 8)){
 		RemovePlayerAttachedObject(playerid, 8);
        new str[60];
        format(str, sizeof(str), "** %s removeu seu CAPACETE.", nome(playerid));
	    MensagemLocal(30.0, playerid, Roxoeu, str, true);
	    return true;
	}
	else if(item == RADINHO && IsPlayerAttachedObjectSlotUsed(playerid, 9)){
 		RemovePlayerAttachedObject(playerid, 9);
        new str[60];
        format(str, sizeof(str), "** %s desequipou seu RADINHO.", nome(playerid));
	    MensagemLocal(30.0, playerid, Roxoeu, str, true);
	    return true;
	}
	return false;
}
removertudo(playerid){
	for(new i; i<MAX_PLAYER_ATTACHED_OBJECTS; i++){
	    RemovePlayerAttachedObjectEx(playerid, i);
	}
}
CarregarHabilitacoes(playerid){
	new Query[77], Cache:R;
	mysql_format(Dados, Query, sizeof(Query), "SELECT * FROM `Habs` WHERE `Nome` = '%s'", nome(playerid));
	R = mysql_query(Dados, Query);
	if(cache_is_valid(R)){
		new rows = cache_num_rows();
		if(rows){
			CarteiraInfo[playerid][Carro] = cache_return_int(0, "Carro");
			CarteiraInfo[playerid][Moto] = cache_return_int(0, "Moto");
			CarteiraInfo[playerid][Aviao] = cache_return_int(0, "Aviao");
		}
	}
	else{
	    format(Query, sizeof(Query), "INSERT INTO `Habs` (`Nome`) VALUES ('%s')", nome(playerid));
	    mysql_tquery(Dados, Query);
	}
	cache_delete(R);
	return 1;
}
SalvarHabilitacoes(playerid){
	new Query[128];
	mysql_format(Dados, Query, sizeof(Query), "UPDATE `Habs` SET `Carro` = '%d',\
		`Aviao` = '%d', `Moto` = '%d' WHERE `Nome` = '%e'", CarteiraInfo[playerid][Carro], CarteiraInfo[playerid][Aviao], CarteiraInfo[playerid][Moto], nome(playerid));
	mysql_tquery(Dados, Query);

	new Reset[Carteiras];
	CarteiraInfo[playerid] = Reset;
	return 1;
}
FalharTeste(playerid){
	if(EmTeste[playerid]){
 		DestroyVehicleEx(VeiculoHab[playerid], "Falhou No Teste Hab");
	    EmTeste[playerid] = false;
     	SetPlayerVirtualWorld(playerid, 0);
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce falhou no teste do veiculo.");
		KillTimer(TimerTeste[playerid]);
		new Query[90];
		format(Query, sizeof Query, "%s falhou hab", nome(playerid));
		AdicionarLogs(Query);
        DestroyDynamicCP(CheckCarro[playerid]);
        DestroyDynamicCP(CheckMoto[playerid]);
        DestroyDynamicCP(CheckAviao[playerid]);
        AvisoAuto[playerid] = 0;
		new i = GetPVarInt(playerid, "InteriorHABf");
		SetPlayerPosEx(playerid, IntInfo[i][IntsX], IntInfo[i][IntsY],IntInfo[i][IntsZ]);
		SetPlayerInterior(playerid, IntInfo[i][Interior]);
		SetPlayerVirtualWorld(playerid, i);
		CheckCarro[playerid] = -1;
		CheckMoto[playerid] = -1;
		CheckAviao[playerid] = -1;
		VeiculoHab[playerid] = -1;
		//EmTeste[playerid]
	}
}
PegarCarteira(playerid, carteira){
	new str[15] = "{ff0000}Nao";
	switch(carteira){
	    case 1: if(CarteiraInfo[playerid][Carro] == 1) str = "{33aa33}Sim";
		case 2: if(CarteiraInfo[playerid][Moto] == 1) str = "{33aa33}Sim";
		case 3: if(CarteiraInfo[playerid][Aviao] == 1) str = "{33aa33}Sim";
	}
	return str;
}
MostrarLogin(playerid){
	PlayerTextDrawSetString(playerid, LoginDraw[playerid][4], nome(playerid));

	for(new i; i < 10; i++){
		PlayerTextDrawShow(playerid, LoginDraw[playerid][i]);
	}
	SelectTextDraw(playerid, 0xFAB847FF);
	interpolar(playerid);
	return 1;
}
EsconderLogin(playerid){
	for(new i; i < 10; i++){
		PlayerTextDrawHide(playerid, LoginDraw[playerid][i]);
	}
	CancelSelectTextDraw(playerid);
}
function AtualizarSede(){
	foreach(new i: Player){
		if(PlayerInfo[i][Logado] && IsPlayerSpawned(i)){
			PlayerInfo[i][Sede] ++;
			AtualizarTextFomeSede(i);
			if(PlayerInfo[i][Sede] >= 90){
				CallMiniAviso(i, -1, "* Voce esta ficando com sede! Beba algo.");
			}
			if(PlayerInfo[i][Sede] >= 100){
				PlayerInfo[i][Sede] = 100;
				new Float: Hp;
				GetPlayerHealth(i, Hp);
				if(Hp < 35.0) CheckDeath(i);
				else{
					if(!PlayerInfo[i][Ferido]){
						SetPlayerHealth(i, Hp-10.5);
						CallMiniAviso(i, -1, "Voce esta perdendo vida! Beba algo!");
					}
				}	
			}
		}
	}
	return 1;
}
function AtualizarFome(){
	foreach(new i: Player){
		if(PlayerInfo[i][Logado] && IsPlayerSpawned(i)){
			PlayerInfo[i][Fome] ++;
			AtualizarTextFomeSede(i);
			if(PlayerInfo[i][Fome] >= 90){
				CallMiniAviso(i, -1, "Voce esta ficando com fome.");
			}
			if(PlayerInfo[i][Fome] >= 100){
				PlayerInfo[i][Fome] = 100;
				new Float: Hp;
				GetPlayerHealth(i, Hp);
				if(Hp < 35.0) CheckDeath(i);
				else{
					if(!PlayerInfo[i][Ferido]){
						SetPlayerHealth(i, Hp-9.5);
						CallMiniAviso(i, -1, "Voce esta perdendo vida! Coma algo!");
					}
				}	
			}
		}
	}
	return 1;
}
function MostrarFomeSede(playerid) {
    for (new idty = 0; idty < 4; idty++) {
        if(IsValidPlayerTextDraw(playerid, FomeSedeTD[playerid][idty])){ 
	        PlayerTextDrawShow(playerid, FomeSedeTD[playerid][idty]);
	    }
    }
    AtualizarTextFomeSede(playerid);
    return 1;
}
function AdicionarFome(playerid, quantia){
	if( (quantia + PlayerInfo[playerid][Fome]) < 100 && PlayerInfo[playerid][Fome] >= 0){
		PlayerInfo[playerid][Fome] -= quantia;
		if(PlayerInfo[playerid][Fome] < 1) PlayerInfo[playerid][Fome] = 0;
		AtualizarTextFomeSede(playerid);
	}
	return 1;
}
function AdicionarSede(playerid, quantia){
	if( (quantia + PlayerInfo[playerid][Sede]) < 100 && PlayerInfo[playerid][Sede] >= 0){
		PlayerInfo[playerid][Sede] -= quantia;
		if(PlayerInfo[playerid][Sede] < 1) PlayerInfo[playerid][Sede] = 0;
		AtualizarTextFomeSede(playerid);
	}
	return 1;
}
function AtualizarTextFomeSede(i){
	new str[6];
	format(str, sizeof str, "%d%%", PlayerInfo[i][Sede]);
	PlayerTextDrawSetString(i, FomeSedeTD[i][2], str);		
	PlayerTextDrawShow(i, FomeSedeTD[i][2]);
		
	format(str, sizeof str, "%d%%", PlayerInfo[i][Fome]);
	PlayerTextDrawSetString(i, FomeSedeTD[i][0], str);
	PlayerTextDrawShow(i, FomeSedeTD[i][0]);
	return 1;
}
AtualizarNavbar(playerid){
	if(IsPlayerSpawned(playerid)){
		new str[35];
		format(str, sizeof str, "%s", nome(playerid));
		PlayerTextDrawSetString(playerid, Hud[playerid][6], str);
		format(str, sizeof str, "IDF:_%d",PlayerInfo[playerid][IDFixo]);
		PlayerTextDrawSetString(playerid, Hud[playerid][7], str);
		for(new i; i < 8; i++){
			PlayerTextDrawShow(playerid, Hud[playerid][i]);
		}
	}
	return 1;
}
CheckVehEmp(playerid){
	if(SpawnouEmprego[playerid] != -1){
		ResetMileage(SpawnouEmprego[playerid]);
	    EmpregoCar[SpawnouEmprego[playerid]] = -1;
	    CarroForte[SpawnouEmprego[playerid]] = 0;
	    CaminhaoCarregado[SpawnouEmprego[playerid]] = 0;
        MadeirasCarro[SpawnouEmprego[playerid]] = 0;
        VeiculoEmprego[SpawnouEmprego[playerid]] = false;
	    DestroyVehicleEx(SpawnouEmprego[playerid], "Resetado No CheckEmp");
	    SpawnouEmprego[playerid] = -1;
	    //////////printf("Veiculo de emprego do jogador '%s' foi destruido.", nome(playerid));
	}
}
FalharNaPesca(playerid){
	if(Pescando[playerid]){
		KillTimer(TimerPesca[playerid]);
		Pescando[playerid] = false;
		Peixes[playerid] = 0;
		TrabalhandoEmprego[playerid][PESCADOR] = false;
	}
}

cmd:criarlocalsentar(playerid){
	if(PlayerInfo[playerid][Admin] < 5) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao tem permissao.");

	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	LocalSentarAqui(X, Y, Z);
	SendClientMessage(playerid, VerdeSamp, "Voce criou um local para sentar aqui. Para deletar use o comando /deletarlocal.");
	return 1;
}
cmd:deletarlocalsentar(playerid){
	if(PlayerInfo[playerid][Admin] < 5) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao tem permissao.");

	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	for(new i; i < MAX_LOCALS_S; i++){
		if(LocalInfo[i][LocalCriadoS] && IsPlayerInRangeOfPoint(playerid, 2.3,LocalInfo[i][LocalxX], LocalInfo[i][LocalyY], LocalInfo[i][LocalzZ])){
			
			LocalInfo[i][LocalCriadoS] = false;
			
			DestroyDynamic3DTextLabel(LocalInfo[i][TextoLocal]);
			new string[120];
			
			mysql_format(Dados, string, sizeof string, "DELETE FROM `LocalSentar` WHERE `localid` = '%d'", i);
			mysql_tquery(Dados, string);

			SendClientMessage(playerid, LIGHTBLUE, "O Local %d de sentar foi deletado.", i);
			break;
		}
	}
	return 1;
}
LocalSentarAqui(Float: xx, Float: yy, Float: zz){
	for(new i; i < MAX_LOCALS_S; i++){
		if(!LocalInfo[i][LocalCriadoS]){
			LocalInfo[i][LocalCriadoS] = true;
			LocalInfo[i][LocalxX] = xx;
			LocalInfo[i][LocalyY] = yy;
			LocalInfo[i][LocalzZ] = zz;
			LocalInfo[i][localid] = i;
			LocalInfo[i][TextoLocal] = CreateDynamic3DTextLabel("* Clique 'Y' para sentar", Roxoeu,LocalInfo[i][LocalxX], LocalInfo[i][LocalyY], LocalInfo[i][LocalzZ], 10.0);
			new query[150];
			mysql_format(Dados, query, sizeof query, "INSERT INTO `LocalSentar` (`LocalX`, `LocalY`, `LocalZ`, `localid`) VALUES\
				('%f', '%f', '%f', '%d')", LocalInfo[i][LocalxX], LocalInfo[i][LocalyY], LocalInfo[i][LocalzZ], i);
			mysql_tquery(Dados, query);
			//SalvarLocalSentar(i);
			return i;
		}
	}
	return -1;
} 
stock SalvarLocalSentar(i){
	if(!LocalInfo[i][LocalCriadoS]) return 1;

	new string[190];
	mysql_format(Dados, string, sizeof string, "UPDATE LocalSentar SET LocalX = '%f', \
		LocalY = '%f', LocalZ = '%f' WHERE localid = '%d'", LocalInfo[i][LocalxX], LocalInfo[i][LocalyY], LocalInfo[i][LocalzZ], i);

	return 1;
}
function CarregarLocalSentar(){
	new rows, total=0;
	cache_get_row_count(rows);
	
	if(!rows) return 1;

	for(new i; i <rows; i++){
		new id = cache_return_int(i, "localid");
		LocalInfo[id][LocalxX] = cache_return_float(i, "LocalX");
		LocalInfo[id][LocalyY] = cache_return_float(i, "LocalY");
		LocalInfo[id][LocalzZ] = cache_return_float(i, "LocalZ");
		LocalInfo[id][LocalCriadoS] = true;
		LocalInfo[id][TextoLocal] = CreateDynamic3DTextLabel("* Clique 'Y' para sentar", Roxoeu,LocalInfo[id][LocalxX], LocalInfo[id][LocalyY], LocalInfo[id][LocalzZ], 10.0);
		total ++;
	}
	return printf("Database: total de %d Locais de sentar carregados!", total);
}
CriarLocal(const localname[], Float:X, Float: Y, Float: Z, tipo){
	for(new i; i<MAX_GPS_LOCAL; i++){
	    if(!GpsInfo[i][LocalCriado]){
	        GpsInfo[i][LocalCriado] = true;
	        format(GpsInfo[i][LocalName], 32, localname);
	        GpsInfo[i][LocalX] = X;
	        GpsInfo[i][LocalY] = Y;
	        GpsInfo[i][gpsid] = i;
	        GpsInfo[i][LocalZ] = Z;
			GpsInfo[i][LocalTipo] = tipo;
			new str[169];
			mysql_format(Dados, str, sizeof(str), "INSERT INTO `Gps` (`gpsid`, `LocalName`, `LocalX`, `LocalY`, `LocalZ`, `LocalTipo`) VALUES ('%d', '%s', '%f', '%f', '%f', '%d')",
			i,
			GpsInfo[i][LocalName],
			GpsInfo[i][LocalX],
			GpsInfo[i][LocalY],
			GpsInfo[i][LocalZ],
			GpsInfo[i][LocalTipo]);
			mysql_tquery(Dados, str);
			return i;
		}
	}
	return -1;
}
salvarGps(i){
	if(!GpsInfo[i][LocalCriado]) return 1;

	new Query[185];
	mysql_format(Dados, Query, sizeof Query, "UPDATE `Gps` SET `LocalX` = '%f', `LocalY` = '%f', `LocalZ` = '%f', `LocalTipo` = '%d', `LocalName` = '%s' WHERE `gpsid` = '%d'",
	GpsInfo[i][LocalX], GpsInfo[i][LocalY], GpsInfo[i][LocalZ], GpsInfo[i][LocalTipo], GpsInfo[i][LocalName], i);
	return mysql_tquery(Dados, Query);
}

CoordZone(Float:x, Float:y, Float:z){
    new zonenme[24] = "Desconhecido";
    for(new zoneid; zoneid < sizeof(zones); zoneid++){
        if(x >= zones[zoneid][zone_minx] && x < zones[zoneid][zone_maxx] && y >= zones[zoneid][zone_miny] && y < zones[zoneid][zone_maxy] && z >= zones[zoneid][zone_minz] && z < zones[zoneid][zone_maxz] && z < 900.0)
        {
            format(zonenme, sizeof zonenme, zones[zoneid][zone_name]);
            return zonenme;
        }
    }
    return zonenme;
}
ApllyAnim(playerid, const iLib[], const anim[], Float:um, dois, tres, quatro, cinco, seis, FORCE_SYNC:sete = SYNC_NONE){
	ApplyAnimationEx(playerid, iLib, "null", 0.0, 0, 0, 0, 0, 1);
	ApplyAnimationEx(playerid, iLib, anim, um, dois, tres, quatro, cinco, seis, FORCE_SYNC:sete);
}
// continuar
CriarCaixa(playerid){
	new Float:P[3];
	GetPlayerPos(playerid, P[0], P[1], P[2]);
	for(new i; i<MAX_CAIXAS; i++){
	    if(!InfoCaixa[i][CaixaCriado]){
	        InfoCaixa[i][CaixaCriado] = true;
			InfoCaixa[i][CaixaQuebrado] = false;
	        InfoCaixa[i][CaixaX] = P[0];
	        InfoCaixa[i][CaixaY] = P[1];
	        InfoCaixa[i][CaixaZ] = P[2];
	        InfoCaixa[i][CaixaRX] = 0.0;
	        InfoCaixa[i][CaixaGrana] = 5000;
	        InfoCaixa[i][CaixaRY] = 0.0;
	        InfoCaixa[i][CaixaRZ] = 0.0;
			InfoCaixa[i][ObjetoCaixa] = CreateDynamicObject(19324, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ], InfoCaixa[i][CaixaRX],InfoCaixa[i][CaixaRY],InfoCaixa[i][CaixaRZ]);
	        new str[60];
	        format(str, sizeof(str), "{33ccff}Caixa Eletronico N. %d\nAperte 'Y'", i);
	        InfoCaixa[i][CaixaTexto] = CreateDynamic3DTextLabel(str, -1, P[0], P[1], P[2], 15.0);
			new Query[220];
			mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Caixas` (`caixaid`, `CaixaX`, `CaixaY`, `CaixaZ`, `CaixaRX`, `CaixaGrana`) VALUES \
			('%d', '%f', '%f', '%f', '%f', '%d')", i, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ], InfoCaixa[i][CaixaRX], InfoCaixa[i][CaixaGrana]);
			mysql_tquery(Dados, Query);
			Iter_Add(B_Caixas, i);
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Caso a posicao saia errada use /cfgcaixa [ id do caixa ]");
	        return i;
		}
	}
	return -1;
}
SalvarCaixa(i){
	new Query[300];
	mysql_format(Dados, Query, sizeof(Query), "UPDATE `Caixas` SET `CaixaX` = '%f', `CaixaY` = '%f', `CaixaZ` = '%f', \
	`CaixaRX` = '%f', `CaixaRY` = '%f', `CaixaRZ` = '%f', `CaixaGrana` = '%d' WHERE `caixaid` = '%d'", 
	InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ],
	InfoCaixa[i][CaixaRX], InfoCaixa[i][CaixaRY], InfoCaixa[i][CaixaRZ], InfoCaixa[i][CaixaGrana], i);
	mysql_tquery(Dados, Query);

	return i;
}
DonoDaCasa(playerid, casa){
	if(!isnull(InfoCasa[casa][Dono]))
		if(!strcmp(nome(playerid), InfoCasa[casa][Dono], false, 24))
			return true;	
	
	return false;
}
cmd:trazerveh(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 4) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/trazerveh [ samp veiculo id ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "Este ID e invalido.");
	if(!IsValidVehicle(strval(params)))return SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo nao existe no servidor");
	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x, y, z);
	SetVehiclePos(strval(params), x, y, z);
	return 1;
}
cmd:tunar(playerid){
	if(ISP(playerid, 4.0, 1816.6492,-1440.3865,13.5895) || ISP(playerid, 4.0, 1816.4877,-1432.2344,13.6016)){
		for(new i; i<MAXCONCE; i++){
			if(IsPlayerInVehicle(playerid, VehInfo[playerid][i][Carro])){
				SetPVarInt(playerid, "CARidV", i);
				ShowPlayerDialog(playerid, DIALOG_TUNAR_OFICINA, DIALOG_STYLE_LIST, "{fff000}# Tunando Seu Veiculo", "Rodas\nEscapamentos\nSpoilers\nResetar Componentes", "Ok", "Sair");
				break;
			}
		}
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar na posicao exata.");

	return 1;
}
cmd:dinamitar(playerid){
	if(PlayerInfo[playerid][Org] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode roubar esta loja.");
	if(IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE,"* Voce nao pode fazer isso.");
	if(Plantando[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta plantando algo.");
	if(NaMao[playerid] != DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa estar com a dinamite na mao.");
    //if(Roubando) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Algum local ja foi roubado recentemente.");
    if(BancoSendoRoubado) return SendClientMessage(playerid, LIGHTBLUE, "* O Banco ja esta sendo roubado!");
    //if(!MembrosPerto(playerid, 6)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de mais cinco membro para roubar aqui.");
	if(!ISP(playerid,4.0, 1329.479614,	-1545.197753,	14.012809)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta perto da porta do cofre!");
	if(!PoliciaisOnline(8)) return SendClientMessage(playerid, LIGHTBLUE, "* Precisa de mais policiais online para fazer esta acao.");
	if(PortaDoBanco == -1) return SendClientMessage(playerid, LIGHTBLUE, "* O Banco ja foi roubado recentemente, Aguarde 20m para ele ficar disponivel novamente.");
	if(RoubandoBanco[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta roubando o Banco!");
	ApllyAnim(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
	RoubandoBanco[playerid] = true;
	SetTimerEx("terminarplant", 25000, false, "isi", playerid, nome(playerid), PlayerInfo[playerid][Org]);
	GameTextForPlayer(playerid, "~R~Plantando Bomba...", 25000, 3);
	new str[128];
	NaMao[playerid] = 0;
	BancoSendoRoubado = true;
	format(str, sizeof str, "AVISO: %s esta roubando o Banco Central!", nome(playerid));
	foreach(new i: Player){
		if(IsPolice(PlayerInfo[i][Org])){					   
			SendClientMessage(i, LIGHTBLUE, str);
		}
	}
	AdminMessage(Rosa, str);
    return 1;
}
forward terminarplant(playerid, const q[], org);
public terminarplant(playerid, const q[], org){
	if(!strcmp(nome(playerid), q) && PlayerInfo[playerid][Org] == org){
		RoubandoBanco[playerid] = false;
		SetTimerEx("DestruirPorta", 30000, false, "i", org);
		PC_EmulateCommand(playerid, "/anim");
		SendClientMessage(playerid, LIGHTBLUE, "* A Porta do banco vai abrir em 30 segundos! Saia de Perto!");
	}
	else{
		RoubandoBanco[playerid] = false;
		new str[144];
		PC_EmulateCommand(playerid, "/anim");
		format(str, sizeof str, "%s nao conseguiu arrombar a porta do Banco!", OrgGm[org][OrgNome]);
		SendClientMessageToAll(LIGHTBLUE, str);
	}
	return 1;
}
function DestruirPorta(org){
	new Float: x, Float: y, Float: z;
	GetDynamicObjectPos(PortaDoBanco, x, y, z);

	DestroyDynamicObject(PortaDoBanco);
	CreateExplosion(x, y, z, 10, 12.0);
 	for(new i; i<30; i++){
	    CriarItemDrop(1327.1592-RdonPickups2[random(sizeof(RdonPickups2))][0], -1556.3221+RdonPickups2[random(sizeof(RdonPickups2))][0], 13.5628, DINHEIRO_FLUTUANTE_BANDIDO, 1000-(random(230)));
	    CriarItemDrop(1329.8979-RdonPickups2[random(sizeof(RdonPickups2))][0], -1550.3976+RdonPickups2[random(sizeof(RdonPickups2))][0], 13.5628, DINHEIRO_FLUTUANTE_BANDIDO, 1000-(random(230)));
	}
	new str[144];
	format(str, sizeof str, "%s arrombaram a porta do banco com sucesso!", OrgGm[org][OrgNome]);
	SendClientMessageToAll(LIGHTBLUE, str);
	SetTimer("refazerporta", minutos(20), false);
	BancoSendoRoubado = false;
	PortaDoBanco = -1;
	return 1;
}
function refazerporta(){
	PortaDoBanco = CreateDynamicObject(2634, 1329.479614,	-1545.197753,	14.012809,	0.0,	0.0,	-9.0);
	SendClientMessageToAll(LIGHTBLUE, "* A Porta do banco foi consertada! O Banco se recuperou do assalto.");
	return 1;
}
cmd:consultarplaca(playerid, params[]){
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar o comando.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/consultarplaca [ placa ]");
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando, voce esta ferido!");
	new achou = -1;
	for(new j, i = MAX_VEHICLES; j != i; j++){
		new Float: X, Float: Y, Float: Z;
		GetVehiclePos(j, X, Y, Z);
		if(IsViatura(j) && ISP(playerid, 6.0, X, Y, Z)){
			if(!VehOpcao(j, VEICULO_LIGADO)){
				SendClientMessage(playerid, LIGHTBLUE, "* As Consultas so funciona com o veiculo ligado!");
				break;
			}
			else{
				achou = j;
				break;
			}
		}
	}
	if(achou == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar perto de uma viatura.");
	new Query[144], Cache: R;
	mysql_format(Dados, Query, sizeof Query, "SELECT Veiculo, Apreendido, IPVA FROM Conce WHERE Placa = '%s'", params);
	R = mysql_query(Dados, Query);
	if(!cache_is_valid(R)) return SendClientMessage(playerid, LIGHTBLUE, "* Esta placa nao existe ou voce digitou errado!");
	else{
		new rows = cache_num_rows();
		if(rows){
			new dono[24];
			cache_get_value_name(0, "nome", dono, 24);
			new str[255];
			format(str, sizeof str, "{33ccff}Placa %s\n\
				{ffffff}Dono: %s\n\
				Modelo: %s\n\
				Apreendido: %s\n\
				{ffffff}IPVA Sem pagar: %dR$\n", params, dono, GetVehicleName(cache_return_int(0, "Veiculo")), (cache_return_int(0, "Apreendido") ? ("{33aa33}Sim") : ("{ff0000}Nao")), cache_return_int(0, "IPVA"));
			ShowPlayerDialog(playerid, DIALOG_APREENDER, DIALOG_STYLE_MSGBOX, "{fff000}Consulta Via Copom", str, "Ok", "Apreender");
			SetPVarString(playerid, "ConsulPL", params);
		}
	}
	cache_delete(R);
	return 1;
}
cmd:procurados(playerid, params[]){
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando, voce esta ferido!");
	new achou = -1;
	for(new j, i = MAX_VEHICLES; j != i; j++){
		new Float: X, Float: Y, Float: Z;
		GetVehiclePos(j, X, Y, Z);
		if(IsViatura(j) && ISP(playerid, 6.0, X, Y, Z)){
			achou = j;
		}
	}
	if(achou == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta perto de uma viatura.");
	new bigstr[900];
	strcat(bigstr,"Jogador\tNivel\tLocal\n");
	new contagem;
	foreach(new i: Player){
		if(GetPlayerWantedLevel(i) > 0){
			if(contagem == 20) break;
			new str[128];
			new Float: X, Float: Y, Float: Z;
			GetPlayerPos(i, X, Y, Z);
			format(str,sizeof str, "%s\t%s\t%s\n", nome(i), TipoFicha(i), CoordZone(X, Y, Z));
			strcat(bigstr, str);
			contagem ++;
		}
	}
	if(contagem == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Nao ha ninguem sendo procurado no momento.");
	ShowPlayerDialog(playerid, DIALOG_INUTIL, 5, "{fff000}Tabela De Procurados", bigstr, "Ok", #);
	return 1;
}
cmd:d(playerid, params[]){
	if(!IsPolice(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar o comando.");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/d [ copom ] aviso: voce precisa estar perto de uma viatura");
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando, voce esta ferido!");
	for(new j, i = MAX_VEHICLES; j != i; j++){
		new Float: X, Float: Y, Float: Z;
		GetVehiclePos(j, X, Y, Z);
		if(IsViatura(j) && ISP(playerid, 6.0, X, Y, Z)){
			SendCopomMessage(playerid, params, GetPlayerVehicleID(playerid));
			//SendClientMessage(playerid, Roxoeu, fString("** (/d) %s %s diz: %s. **",CargoOrg(playerid), nome(playerid), params));
		}
	}
	return 1;
}

SendCopomMessage(playerid, const message[], vtr){
	foreach(new i: Player){
		for(new j, r = MAX_VEHICLES; j != r; j++){
			new Float: X, Float: Y, Float: Z;
			GetVehiclePos(j, X, Y, Z);
			if(IsViatura(j) && ISP(i, 6.0, X, Y, Z)){
				new str[144];
				format(str, sizeof str, "** VTR %d (/d) %s %s diz: %s. **",vtr, CargoOrg(playerid), nome(playerid), message);
				SendClientMessage(i, COR_COPOM, str);
				break;
			}
		}
	}	
	return 0;
}

CargoOrgPCargo(org, cargo){
	new ret[24] = "Nenhum";
	if(IsPolice(org)){
		switch(org){
			case 12:{
				switch(cargo){
					case 1: ret = "Soldado";
					case 2: ret = "Cabo";
					case 3: ret = "3 Sargento";
					case 4: ret = "2 Sargento";
					case 5: ret = "1 Sargento";
					case 6: ret = "Capitao";
					case 7: ret = "Tenente";
					case 8: ret = "Aspirante";
					case 9: ret = "Tenente-General";
					case 10: ret = "General";
				}
			}
			default:{
				switch(cargo){
					case 1: ret = "Soldado";
					case 2: ret = "Cabo";
					case 3: ret = "3 Sargento";
					case 4: ret = "2 Sargento";
					case 5: ret = "1 Sargento";
					case 6: ret = "Tenente";
					case 7: ret = "Capitao";
					case 8: ret = "Major";
					case 9: ret = "Tenente-Coronel";
					case 10: ret = "Comandante";
				}				
			}
		}
	}
	if(IsBandido(org)){
		switch(cargo){
			case 1: ret = "X9";
			case 2: ret = "Aviaozinho";
			case 3: ret = "Fogueteiro";
			case 4: ret = "Vapor";
			case 5: ret = "Guerrilheiro";
			case 6: ret = "Gerente Do Trafico";
			case 7: ret = "Gerente Geral";
			case 8: ret = "Frente";
			case 9: ret = "Sub Chefao";
			case 10: ret = "Chefao";
		}
	}
	return ret;
}
CargoOrg(playerid){
	new ret[24] = "Nenhum";
	if(IsPolice(PlayerInfo[playerid][Org])){
		switch(PlayerInfo[playerid][Cargo]){
			case 1: ret = "Soldado";
			case 2: ret = "Cabo";
			case 3: ret = "3 Sargento";
			case 4: ret = "2 Sargento";
			case 5: ret = "1 Sargento";
			case 6: ret = "Capitao";
			case 7: ret = "Tenente";
			case 8: ret = "Aspirante";
			case 9: ret = "Tenente-General";
			case 10: ret = "General";
		}
	}
	if(IsBandido(PlayerInfo[playerid][Org])){
		switch(PlayerInfo[playerid][Cargo]){
			case 1: ret = "X9";
			case 2: ret = "Aviaozinho";
			case 3: ret = "Fogueteiro";
			case 4: ret = "Vapor";
			case 5: ret = "Guerrilheiro";
			case 6: ret = "Gerente Da Boca";
			case 7: ret = "Gerente Geral";
			case 8: ret = "Frente";
			case 9: ret = "Sub Chefao";
			case 10: ret = "Chefao";
		}
	}
	return ret;
}

FalharDinamite(playerid){
	if(Plantando[playerid]){
	    Plantando[playerid] = false;
		MessageOrg(PlayerInfo[playerid][Org], LIGHTBLUE, "O Jogador que estava roubando o banco morreu. O Roubo ainda continua.");
	}
	return 1;
}
AreaRoubo(Float: X, Float: Y, Float: Z){
	AreaRoubar[aX] = X;
	AreaRoubar[aY] = Y;
	AreaRoubar[aZ] = Z;
	return 1;
}
cmd:atender(playerid){
	if(!QueLigou[playerid]) return 1;
	if(PlayerInfo[playerid][Ferido]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando, voce esta ferido!");
	if(Discando[playerid] == -1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Ninguem esta ligando para voce.");
	if(EmChamada[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta em uma ligacao telefonica.");
    Tentativas[Discando[playerid]] = 0;
	EmChamada[playerid] = true;
	EmChamada[Discando[playerid]] = true;
	new st[190];
	format(st, sizeof st, "[Ligacao] Voce atendeu o jogador '%s', Fale com ele atraves do Chat.", nome(Discando[playerid]));
	SendClientMessage(playerid, Amarelo, st);
	format(st, sizeof st, "[Ligacao] %s atendeu a sua ligacao, Fale com ele atraves do Chat.", nome(playerid));
    SendClientMessage(Discando[playerid], Amarelo, st);
	KillTimer(TimerChamarLigacao[Discando[playerid]]);
	return 1;
}
cmd:desligar(playerid){
	if(Discando[playerid] == -1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Ninguem esta ligando para voce.");
	if(QueLigou[playerid] && EmChamada[playerid]){
		KillTimer(TimerChamarLigacao[Discando[playerid]]);
		new st[140];
		format(st, sizeof st, "[Ligacao] Voce desligou a chamada de %s", nome(Discando[playerid]));
		SendClientMessage(playerid, Amarelo, st);
		format(st, sizeof st, "[Ligacao] Ligacao Desligada! %s desligou a ligacao.", nome(playerid));
    	SendClientMessage(Discando[playerid], Amarelo, st);
		EmChamada[playerid] = false;
		QueLigou[playerid] = false;
		QueLigou[Discando[playerid]] = false;
		Tentativas[Discando[playerid]] = 0;
		EmChamada[Discando[playerid]] = false;
		Discando[Discando[playerid]] = -1;
		Discando[playerid] = -1;
	}
	else if(Discando[playerid] != -1 && !EmChamada[playerid] && QueLigou[playerid])
	{
	    KillTimer(TimerChamarLigacao[Discando[playerid]]);
	    new st[144];
	    format(st, sizeof st, "[Ligacao] Ligacao recusada! Voce desligou a chamada de %s", nome(Discando[playerid]));
		SendClientMessage(playerid, Amarelo, st);
		format(st, sizeof st, "[Ligacao] Ligacao Desligada! %s desligou a ligacao.", nome(playerid));
    	SendClientMessage(Discando[playerid], Amarelo, st);
		QueLigou[playerid] = false;
		QueLigou[Discando[playerid]] = false;
		EmChamada[playerid] = false;
		Tentativas[Discando[playerid]] = 0;
		EmChamada[Discando[playerid]] = false;
		Discando[Discando[playerid]] = -1;
		Discando[playerid] = -1;
	}
	else if(Discando[playerid] != -1 && EmChamada[playerid] && !QueLigou[playerid]){
	    KillTimer(TimerChamarLigacao[Discando[playerid]]);
	    new str[144];
	    format(str, sizeof str, "[Ligacao] Ligacao desligada! Voce desligou a chamada de %s", nome(Discando[playerid]));
		SendClientMessage(playerid, Amarelo, str);
    	format(str, sizeof str, "[Ligacao] Ligacao Desligada! %s desligou a ligacao.", nome(playerid));
    	SendClientMessage(Discando[playerid], Amarelo, str);
		QueLigou[playerid] = false;
		QueLigou[Discando[playerid]] = false;
		EmChamada[playerid] = false;
		Tentativas[Discando[playerid]] = 0;
		EmChamada[Discando[playerid]] = false;
		Discando[Discando[playerid]] = -1;
		Discando[playerid] = -1;
	}
	return 1;
}
FalharLigacao(playerid){
	if(EmChamada[playerid]){
	    QueLigou[playerid] = false;
	    QueLigou[Discando[playerid]] = false;
	    Tentativas[playerid] = 0;
	    KillTimer(TimerChamarLigacao[playerid]);
	    EmChamada[playerid] = false;
	    EmChamada[Discando[playerid]] = false;
	    new str[90];
	    format(str, sizeof str, "[Ligacao] A Ligacao de %s caiu...", nome(playerid));
	    SendClientMessage(Discando[playerid], Amarelo, str);
        KillTimer(TimerChamarLigacao[Discando[playerid]]);
	    Discando[Discando[playerid]] = -1;
	    Discando[playerid] = -1;

	}
	else if(Discando[playerid] != -1 && !EmChamada[playerid]){
	    Tentativas[Discando[playerid]] = 0;
	    QueLigou[Discando[playerid]] = false;
	    QueLigou[playerid] = false;
	    EmChamada[playerid] = false;
	    EmChamada[Discando[playerid]] = false;
	    KillTimer(TimerChamarLigacao[playerid]);
	    new str[144];
	    format(str, sizeof str,  "[Ligacao] A Ligacao sendo feita para %s falhou.", nome(playerid));
		SendClientMessage(Discando[playerid], Amarelo, str);
		KillTimer(TimerChamarLigacao[Discando[playerid]]);
		Discando[Discando[playerid]] = -1;
		Discando[playerid] = -1;
	}
}
AttPickLabel(playerid, i){
	if(!IntInfo[i][InteriorCriado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este interior nao esta criado.");
	DestroyDynamic3DTextLabel(IntInfo[i][LabelEntrada]);
	DestroyDynamicPickup(IntInfo[i][PickEntrada]);
	DestroyDynamic3DTextLabel(IntInfo[i][LabelSaida]);
	DestroyDynamicPickup(IntInfo[i][PickSaida]);
	Streamer_Update(playerid);
	new Float:p[3];
	GetPlayerPos(playerid, p[0], p[1], p[2]);
	Streamer_UpdateEx(playerid,  p[0], p[1], p[2]);//, worldid = -1, interiorid = -1, type = -1, compensatedtime = -1, freezeplayer = 1)
	new
		stru[90],
	    strr[90];

	format(stru, sizeof(stru), "{60a478}%s\n{ffffff}Aperte 'F' para entrar.\n[%d]", IntInfo[i][NomeInterior], i);
	IntInfo[i][LabelEntrada] = CreateDynamic3DTextLabel(stru, -1, IntInfo[i][IntX],IntInfo[i][IntY],IntInfo[i][IntZ],30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
	IntInfo[i][PickEntrada] = CreateDynamicPickup(19607, 1, IntInfo[i][IntX],IntInfo[i][IntY],IntInfo[i][IntZ]);
	Streamer_Update(playerid);
	Streamer_UpdateEx(playerid,  p[0], p[1], p[2]);
	format(strr, sizeof(strr), "{60a478}%s\n{ffffff}Aperte 'F' para sair.\n[%d]", IntInfo[i][NomeInterior], i);
	IntInfo[i][LabelSaida] = CreateDynamic3DTextLabel(strr, -1, IntInfo[i][IntsX],IntInfo[i][IntsY],IntInfo[i][IntsZ],30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0 ,i);
	IntInfo[i][PickSaida] = CreateDynamicPickup(19607, 1, IntInfo[i][IntsX],IntInfo[i][IntsY],IntInfo[i][IntsZ], i);

	return 1;
}
stock GetVehicleSpeed2(vehicleid)
{
	if(vehicleid == INVALID_VEHICLE_ID) return 0;
	new Float:vPos[3];
  	GetVehicleVelocity(vehicleid, vPos[0], vPos[1], vPos[2]);
   	return floatround((floatmul(floatsqroot(floatpower(vPos[0], 2.0) + floatpower(vPos[1], 2.0) + floatpower(vPos[2], 2.0)), 100.0) / 0.4463), floatround_floor);
}
cmd:crashar(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/crashar [ id ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "/crashar [ id ]");
	if(PlayerInfo[playerid][Admin] < PlayerInfo[strval(params)][Admin]){
		AdminMessage(Rosa, fString("Admin %s tentou crashar %s e foi crashado.", nome(playerid), nome(strval(params))));
		GameTextForPlayer(playerid, "~$#{`^}:>}<<`}>P`{`??}>:><~~r~Hello", 2333, 1);	
	}
	else
		GameTextForPlayer(strval(params), "~$#{`^}:>}<<`}>P`{`??}>:><~~r~Hello", 2333, 1);
	return 1;
}
MaximoVeiculos(playerid){
	new cont;
	for(new i; i<MAXCONCE; i++){
 		if(VehInfo[playerid][i][IDCarro] != 0){
 		    cont++;
 		    if(cont == 2 && PlayerInfo[playerid][Vip] <= 1){
 		        return true;
			}
			else if(cont == 3 && PlayerInfo[playerid][Vip] == 2){
			    return true;
			}
			else if(cont == 4 && PlayerInfo[playerid][Vip] == 3){
				return true;
			}
		}
	}
	return false;
}
ChecarLider(playerid, const onome[]){
	if(PlayerInfo[playerid][Cargo] == 10 && !strcmp(nome(playerid), OrgGm[PlayerInfo[playerid][Org]][OrgNome], false, 24)){
		format(OrgInfo[PlayerInfo[playerid][Org]][OrgLider], 24, onome);
	}
}
SetPlayerPosEx(playerid, Float: X, Float: Y, Float: Z){
	SetPlayerPos(playerid, X, Y, Z);
	DentroDeCasa[playerid] = -1;
	return 1;
}
CriarPortao(playerid){
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	for(new i; i<MAX_PORTAO; i++){
	    if(!InfoPortao[i][PortaoCriado]){
	        InfoPortao[i][PortaoCriado] = true;
	        InfoPortao[i][Px] = X;
	        InfoPortao[i][Py] = Y;
	        InfoPortao[i][Pz] = Z;
	        InfoPortao[i][Pxr] = 0.0;
	        InfoPortao[i][Pyr] = 0.0;
	        InfoPortao[i][Pzr] = 0.0;
	        format(InfoPortao[i][DonoPortao], 24, nome(playerid));
			InfoPortao[i][PortaoID] = i;
			Iter_Add(B_Portao, i);
			InfoPortao[i][OPortao] = CreateDynamicObject(980, InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz], InfoPortao[i][Pxr], InfoPortao[i][Pyr], InfoPortao[i][Pzr]);
			new Querar[255];
			mysql_format(Dados, Querar, sizeof(Querar), "INSERT INTO `Portoes` (`Dono`, `PortaoID`, `Px`, `Py`, `Pz`) VALUES ('%s', '%d', '%f', '%f', '%f')", nome(playerid), i, InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz]);
			mysql_tquery(Dados, Querar);
			new str[87];
        	format(str, sizeof(str), "%s\n%{33ccff}ID %d\n%s", InfoPortao[i][DonoPortao], InfoPortao[i][PortaoID], CoordZone(InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz]));
        	InfoPortao[i][PortaoText] = CreateDynamic3DTextLabel(str, -1,InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz], 30.0);
			return i;
		}
	}
	return -1;
}
SalvarPortao(id){
	new Query[300], Float:Pos[6];
	GetDynamicObjectPos(InfoPortao[id][OPortao], Pos[0], Pos[1], Pos[2]);
	GetDynamicObjectRot(InfoPortao[id][OPortao], Pos[3], Pos[4], Pos[5]);
	mysql_format(Dados, Query, sizeof(Query), "UPDATE `Portoes` SET `Dono` = '%s', `Senha` = '%s', `Px` = '%f', `Py` = '%f', `Pz` = '%f', \
	`Pxr` = '%f', `Pyr` = '%f', `Pzr` = '%f' WHERE `PortaoID` = '%d'",
	InfoPortao[id][DonoPortao],
	InfoPortao[id][SenhaPortao],
	Pos[0],
	Pos[1],
	Pos[2],
	Pos[3],
	Pos[4],
	Pos[5],
	InfoPortao[id][PortaoID]);
	mysql_tquery(Dados, Query);
	InfoPortao[id][Px] = Pos[0];
	InfoPortao[id][Py] = Pos[1];
	InfoPortao[id][Pz] = Pos[2];
	InfoPortao[id][Pxr] = Pos[3];
	InfoPortao[id][Pxr] = Pos[4];
	InfoPortao[id][Pxr] = Pos[5];
}
DestruirPortao(id){
	if(InfoPortao[id][PortaoCriado]){
	    new Desquerar[60];
	    mysql_format(Dados, Desquerar, sizeof(Desquerar), "DELETE FROM `Portoes` WHERE `PortaoID` = '%d'", id);
	    mysql_tquery(Dados, Desquerar);

	    InfoPortao[id][PortaoCriado] = false;
	    DestroyDynamicObject(InfoPortao[id][OPortao]);
	    DestroyDynamic3DTextLabel(InfoPortao[id][PortaoText]);
	    format(InfoPortao[id][DonoPortao], 24, "Ninguem");
		InfoPortao[id][Px] = 0.0;
		InfoPortao[id][Py] = 0.0;
		InfoPortao[id][Pz] = 0.0;

		InfoPortao[id][Pxr] = 0.0;
		InfoPortao[id][Pyr] = 0.0;
		InfoPortao[id][Pzr] = 0.0;
		InfoPortao[id][PortaoID] = -1;
	    Iter_Remove(B_Portao, id);
	    return true;
	}
	return false;
}
TextoNome(const s[]){
	for (new i = 0, j = strlen(s); i < j; i++){
		if (s[i] > 'A' || s[i] < 'Z') return 0;
	}
	return 1;
}
Number(const s[]){
	for (new i = 0, j = strlen(s); i < j; i++){
		if (s[i] > '9' || s[i] < '0' || s[i] == '+' || s[i] == '-') return 0;
	}
	return 1;
}
FalharVenda(playerid, oto){
	DeletePVar(oto, "negonegociar");
	DeletePVar(playerid, "valorvendaa");
	DeletePVar(playerid, "iddonegovendaa");
	DeletePVar(playerid, "slotdavenda");
	return 1;
}
cmd:payday(playerid){
	if(PlayerInfo[playerid][Admin] == 11){
		////printf("1");
		darpayday();
	}
	return 1;
}
forward RC15();
public RC15(){
	for(new i, j = MAX_VEHICLES; i != j; i++){
		if(!IsVehicleOccupied(i)){
			SetVehicleToRespawn(i);
		}
	}
	SendClientMessageToAll(Rosa, "[R.C] > Os Veiculos do Servidor foram Respawnados.");
	return 1;
}
darpayday(){
	new hora, minuto, segundo;
	gettime(hora, minuto, segundo);
	AumentoEmpresas();
	mudarclima();
	tempoeclima();
	SendClientMessageToAll(VerdeSamp, "PayDay | O PayDay acaba de ser dado.");
	foreach(new i: Player){
		if(!IsPlayerConnectedP(i)) continue;

		if(PlayerInfo[i][Org] != 0) GivePlayerMoneyfromcargo(i);
		if(PlayerInfo[i][Vip] == 0){
		    GivePlayerCash(i, PlayerInfo[i][DinheiroPD]);
		    new str[40];
		    format(str, sizeof str, "Dinheiro do trabalho: %dR$", PlayerInfo[i][DinheiroPD]);
		    SendClientMessage(i, VerdeSamp, str);
		    PlayerInfo[i][DinheiroPD] = 0;
		}
		else{

			new Float: cont = (PlayerInfo[i][DinheiroPD] > 0 ? ((float(PlayerInfo[i][Vip]) * 0.8) * float(PlayerInfo[i][DinheiroPD])) : (0.0));
		   
		    GivePlayerCash(i, PlayerInfo[i][DinheiroPD] + floatround(cont));
		    new str[44];
		    format(str, sizeof str, "Dinheiro do trabalho + bonus VIP: %dR$", PlayerInfo[i][DinheiroPD] + floatround(cont));
		    SendClientMessage(i, VerdeSamp, str);
		  
		    if(PlayerInfo[i][Vip] == 3){
		    	GameTextForPlayer(i, "~h~~h~+1 coin", 3000, 3);
		    	PlayerInfo[i][Cash] += 1;
		    }
		    PlayerInfo[i][DinheiroPD] = 0;			
		}
		////printf("4");
		CobrarIPVA(i);
		new conta = PlayerInfo[i][Nivel] * 2;
		if(conta == 0) conta = 1;
	   	PlayerInfo[i][Xp] += 1;
	   	new str[97];
		if(PlayerInfo[i][Xp] >= conta){
			PlayerInfo[i][Xp] = 0;
	  		PlayerInfo[i][Nivel] += 1;
	  		SetPlayerScore(i, PlayerInfo[i][Nivel]);
	  		format(str, sizeof str, "[Level-Up] Nivel antigo: %d, Nivel atual: %d. Voce recebeu %d$ de bonus.", PlayerInfo[i][Nivel]-1, PlayerInfo[i][Nivel], 35*2 * PlayerInfo[i][Nivel]);
	        SendClientMessage(i, Amarelo, str);
			GivePlayerCash(i, 35* 2 * PlayerInfo[i][Nivel]);
		}
	}
	return 1;
}
forward TerminarConserto(playerid, carro);
public TerminarConserto(playerid, carro){
	PC_EmulateCommand(playerid, "/anim");
	RepairVehicle(carro);
	Consertando[playerid] = false;
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Veiculo reparado com sucesso.");
	VeiculoConfiguracao[carro][Quebrado] = false;
	VeiculoConfiguracao[carro][Desmanchado] = false;
	VehOpcao(carro, LIGAR_VEICULO);
}
Salario(org){
	new conta;
	foreach(new i: Player){
		if(PlayerInfo[i][Org] == org){
			conta += OrgInfo[PlayerInfo[i][Org]][SalarioCargo][PlayerInfo[i][Cargo]];
		}
	}
	return conta;
}
GivePlayerMoneyfromcargo(playerid){
	if(Salario(PlayerInfo[playerid][Org]) > OrgInfo[PlayerInfo[playerid][Org]][OrgCofre]) 
		return SendClientMessage(playerid, LIGHTBLUE, "* Sua org esta sem dinheiro para te pagar.");
	if(PlayerInfo[playerid][Org] != 0){
		BancoInfo[playerid][Dinheiro] += OrgInfo[ PlayerInfo[playerid][Org] ][SalarioCargo][ PlayerInfo[playerid][Cargo] ];
		new str[89];
		format(str, sizeof str, "Org | Voce recebeu %dR$ De pagamento da sua Org.", OrgInfo[ PlayerInfo[playerid][Org] ][SalarioCargo][ PlayerInfo[playerid][Cargo] ]);
		SendClientMessage(playerid, LIGHTBLUE, str);
		OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] -= OrgInfo[ PlayerInfo[playerid][Org] ][SalarioCargo][ PlayerInfo[playerid][Cargo] ];
	}
	return 1;
}
FalharPlantandocaixa(playerid){
	if(!PlantandoCaixa[playerid]) return 1;

	PlantandoCaixa[playerid] = false;
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Falha no roubo do caixa.");
	KillTimer(TimePlantarBomba[playerid]);
	return 1;
}
CriarGangZone(Float: x1, Float: y1, Float: x2, Float: y2, const nomegz[], upar = 1){
	for(new i; i < MAX_GZS; i++){
	    if(GzInfo[i][GZCriado]) continue;

		new gz = GangZoneCreate(x1,y1,x2,y2);
		GzInfo[i][GZCriado] = true;

		if(upar == 1){
			new Query[199];
			GzInfo[i][OGZ] = gz;
			format(GzInfo[i][GZNome], 32, nomegz);
			GzInfo[i][Dominando] = false;
			GzInfo[i][DonoGz] = 0;
			GzInfo[i][Gzx] = x1;
			GzInfo[i][Gzy] = y1;
			GzInfo[i][Gzxx] = x2;
			GzInfo[i][Gzyy] = y2;
			mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Gangzones` (`gzid`, `Gzx`, `Gzy`, `Gzxx`, `Gzyy`, `DonoGz`, `GZNome`) VALUES ('%d', '%f', '%f', '%f', '%f', '%d', '%s')",
			i,
			GzInfo[i][Gzx],
			GzInfo[i][Gzy],
			GzInfo[i][Gzxx],
			GzInfo[i][Gzyy],
			GzInfo[i][DonoGz],
			GzInfo[i][GZNome]);
			mysql_tquery(Dados, Query);
			GangZoneShowForAll(i, 0xffffffff);
			GzInfo[i][gzid] = i;
		}
		
	
		Iter_Add(Gangzoness, i);
		return gz;
	}
	return -1;
}
SalvarGangzones(){
	static str[135];
	foreach(new i: Gangzoness){
		mysql_format(Dados, str, sizeof(str), "UPDATE `Gangzones` SET `Donogz` = '%d' WHERE `gzid` = '%d'", GzInfo[i][DonoGz], GzInfo[i][gzid]);//, {Float, _:...})
		mysql_tquery(Dados, str);
		GangZoneDestroy(GzInfo[i][OGZ]);

	}
}
public OnPlayerLeaveGangZone(playerid, zoneid){
	PlayerTextDrawHide(playerid, Hud[playerid][2]);
	return 1;
}
public OnPlayerEnterGangZone(playerid, zoneid){
	new string[40];
	format(string, sizeof string, "%s", OrgGm[ GzInfo[zoneid][DonoGz]][OrgNome]);
	PlayerTextDrawSetString(playerid, Hud[playerid][2], string);
	return 1;
}
showGzs(playerid){
	foreach(new i: Gangzoness){
		GangZoneShowForPlayer(playerid, GzInfo[i][OGZ], OrgGm[GzInfo[i][DonoGz]][Cor]);
		UseGangZoneCheck(GzInfo[i][OGZ], true);
		if(GzInfo[i][Dominando]){
			GangZoneFlashForPlayer(playerid, GzInfo[i][OGZ], OrgGm[orgAtacando[i]][Cor]);
		}
	}
}
stock CriarBolinha(playerid, Float: X, Float: Y, Float: Z){
	GetPlayerPos(playerid, X, Y, Z); // preguica de editar a include
}
carregarAtendimento(playerid){

	new reset[EnumAtendimento];
	Atendimento[playerid] = reset;

	new str[100];
	mysql_format(Dados, str, sizeof str, "SELECT Nota, Atendidos FROM Staff WHERE Nome = '%s'", nome(playerid));
	new Cache: R = mysql_query(Dados, str);
	if(cache_is_valid(R)){
		new rows = cache_num_rows();
		if(rows){
			Atendimento[playerid][Nota] = cache_return_float(0, "Nota");
			Atendimento[playerid][Atendidos] = cache_return_int(0, "Atendidos");
		}
	}
	if(cache_is_valid(R))cache_delete(R);
	return 1;
}
CriarCofre(playerid, const namec[], Float:xCofre, Float: yCofre, Float: zCofre, moneyc = 50000){
	for(new i; i<MAX_COFRES; i++){
		if(!CofreInfo[i][OCofre]){
			CofreInfo[i][InteriorCofre] = GetPlayerInterior(playerid);
			CofreInfo[i][VWCofre] = GetPlayerVirtualWorld(playerid);
			CofreInfo[i][CofreMoney] = moneyc;
			CofreInfo[i][CofrePos][0] = xCofre;
			CofreInfo[i][CofrePos][1] = yCofre;
			CofreInfo[i][CofrePos][2] = zCofre;
			format(CofreInfo[i][CofreName], 32, namec);
			CofreInfo[i][OCofre] = CreateDynamicObject(CofreNormal, xCofre, yCofre, zCofre,
		 	0.0,0.0,0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
		 	new str[144];
		 	format(str, sizeof str, "(%d)%s\n\n{33ccff}use /roubarcofre",i, CofreInfo[i][CofreName]);
		 	CofreInfo[i][CofreTexto] = CreateDynamic3DTextLabel(str, -1, xCofre, yCofre, zCofre, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			new Query[320];
			mysql_format(Dados, Query, sizeof(Query), "INSERT INTO `Cofres` (`cofreid`, `CofreName`, `CofreMoney`, `CofreX`, `CofreY`, `CofreZ`, `VWCofre`, `CofreInterior`) VALUES ('%d','%s','%d','%f','%f','%f', '%d', '%d')",
			i, CofreInfo[i][CofreName], CofreInfo[i][CofreMoney], xCofre, yCofre, zCofre, CofreInfo[i][VWCofre], CofreInfo[i][InteriorCofre]);
			mysql_tquery(Dados, Query);
			Iter_Add(B_Cofres, i);
			return i;
		}
	}
	return -1;
}
PlayerSoundTime(soundid, Float: range, Float: xx, Float: yy, Float: zz, time){
	SetTimerEx("PlaySoundForPlayersInRange", time, false, "iffff", soundid, xx, yy, zz, range);
}
forward PlaySoundForPlayersInRange(soundid, Float:x, Float:y, Float:z, Float: range);
public PlaySoundForPlayersInRange(soundid, Float:x, Float:y, Float:z, Float: range)
{
    foreach(new i: Player)
    {
        if(IsPlayerInRangeOfPoint(i,range,x,y,z))
        {
            PlayerPlaySound(i, soundid, x, y, z);
        }
    }
}
SalvarAtendimento(playerid){
	if(!PlayerInfo[playerid][Admin]) return 1;

	new str[100];
	mysql_format(Dados, str, sizeof (str), 
	"UPDATE Staff SET `Nota` = '%f', `Atendidos` = '%d' WHERE `Nome` = '%s'", Atendimento[playerid][Nota], Atendimento[playerid][Atendidos], nome(playerid));
	mysql_tquery(Dados, str);

	new reset[EnumAtendimento];
	Atendimento[playerid] = reset;
	return true;
}
CriarVeiculo(const motivo[], veh, Float:x, Float:y, Float:z, Float:rotation, colo1, colo2, resawn_delay, bool:addsien=false){
	#pragma unused motivo
	new vehicle = CreateVehicle(veh, x, y, z, rotation, colo1, colo2, resawn_delay, false);
	RepairVehicle(vehicle);
	VeiculoInfo[vehicle][veiculoModelo] = veh;
	VeiculoInfo[vehicle][CorVeiculo][0] = colo1;
	VeiculoInfo[vehicle][CorVeiculo][1] = colo2;
	VeiculoInfo[vehicle][RespawnDelay] = resawn_delay;


	VeiculoInfo[vehicle][OldPos][0] = x;
	VeiculoInfo[vehicle][OldPos][1] = y;
	VeiculoInfo[vehicle][OldPos][2] = z;

	VeiculoInfo[vehicle][OldPosTaxi][0] = x;
	VeiculoInfo[vehicle][OldPosTaxi][1] = y;
	VeiculoInfo[vehicle][OldPosTaxi][2] = z;

	VeiculoInfo[vehicle][sirene] = addsien;
	VeiculoInfo[vehicle][Gasolina] = 100;
	VeiculoOcupado[vehicle] = false;

	VeiculoInfo[vehicle][ParteRoda][1] = 0;
	VeiculoInfo[vehicle][ParteRoda][2] = 0;
	VeiculoInfo[vehicle][ParteRoda][3] = 0;
	VeiculoInfo[vehicle][ParteRoda][4] = 0;
	
	VehOpcao(vehicle, DESLIGAR_VEICULO);
	VehOpcao(vehicle, DESLIGAR_FAROL);
	//SetVehicleIndividualTires(vehicle, TIRE_UNCHANGED,TIRE_UNCHANGED,TIRE_UNCHANGED,TIRE_UNCHANGED);
	format(VeiculoConfiguracao[vehicle][Trancou], 24, "");
	VeiculoConfiguracao[vehicle][Quebrado] = false;
	SetVehiclePosEx(vehicle, x, y, z);
	Iter_Add(Vehicles, vehicle);
	return vehicle;
}
cmd:salvarconta(playerid){
	if(gettime() < tempocomando[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce so pode usar este comando a cada 30s.");
	tempocomando[playerid] = gettime() + 30;
	SalvarConta(playerid);
	SendClientMessage(playerid, LIGHTBLUE, "Voce salvou sua conta com sucesso.");
	return 1;
}
cmd:criarcamera(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 10) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ser admin para usar este comando.");
	new Float:Parametro[6];
	if(sscanf(params, "ffffff", Parametro[0], Parametro[1], Parametro[2], Parametro[3], Parametro[4], Parametro[5])) 
		return SendClientMessage(playerid, LIGHTBLUE, "USO: /criarcamera ( X Y Z RX RY RZ)");


	new cam = CriarCamera(Parametro[0], Parametro[1], Parametro[2], Parametro[3], Parametro[4], Parametro[5]);
	new str[144];
	format(str, sizeof str, "Sucesso! Voce acaba de criar a camera %d nesta posicao.", cam);
	SendClientMessage(playerid, LIGHTBLUE, str);
	return 1;
}
CriarCamera(Float: Xx, Float: Yy, Float: Zz, Float: RxX, Float: RyY, Float: RzZ){
	for(new i; i<MAX_CAMERAS; i++){
		if(!CameraInfo[i][CameraCriada]){
			CameraInfo[i][CameraCriada] = true;
			CameraInfo[i][ACamera] = CreateDynamicObject(2921, Xx, Yy, Zz, RxX, RyY, RzZ);
			new Query[255];
			mysql_format(Dados, Query, sizeof(Query), 
			"INSERT INTO `CamerasAdmin` (`Camid`, `CameraX`, `CameraY`, `CameraZ`, `CRx`, `CRy`, `CRz`)\
			VALUES ('%d', '%f', '%f', '%f', '%f', '%f', '%f')", i, Xx, Yy, Zz, RxX, RyY, RzZ);
			mysql_tquery(Dados, Query);
			return i;
		}
	}
	return -1;
}

function CarregarCameras(){
	new rows, totalcam=0;
	cache_get_row_count(rows);
	if(rows){
		for(new i; i<rows; i++){//CamerasAdmin
			new id = cache_return_int(i, "Camid");
			CameraInfo[id][CameraCriada] = true;
			CameraInfo[id][ACamera] = CreateDynamicObject(2921, cache_return_float(i, "CameraX"), cache_return_float(i, "CameraY"), cache_return_float(i, "CameraZ"),
				cache_return_float(i, "CRx"), cache_return_float(i, "CRy"), cache_return_float(i, "CRz"));
			totalcam++;
		}
	}
	return printf("Database: total de %d cameras criadas!", totalcam);
}
forward OnPlayerCheater(playerid, CheaterID, const descricao[]);
public OnPlayerCheater(playerid, CheaterID, const descricao[]){
	if(CheaterID == 2 || Nopm[playerid] != -1)return 1;//|| GetPlayerState(playerid) == 6) return 1;

	//if(CheaterID == 1) OnPlayerText(playerid, "Eu Sou um otario! Estou usando Hack de arma! Por sorte este servidor tem Ant Cheat.");
	new str[144];
	format(str, sizeof str, "(%d)%s foi chutado do servidor por suspeita de cheat code %d.", playerid, nome(playerid), CheaterID);
	SendClientMessageToAll(Rosa, str);
	////////printf("%s kickado por codigo %d", nome(playerid), CheaterID);
	Kick(playerid);
	return 1;
}

CriarJBL(playerid, Float: x, Float: y, Float: z, tipojbl = -1){
	new Float: Ang;
	GetPlayerFacingAngle(playerid, Ang);
	for(new i; i < MAX_JBL; i++){
		if(!InfoJBL[i][JBLCriada]){
			CriouJBL[playerid] = i;
			InfoJBL[i][JBLCriada] = true;
			InfoJBL[i][PosJBL][0] = x;
			InfoJBL[i][PosJBL][1] = y;
			InfoJBL[i][PosJBL][2] = z;
			InfoJBL[i][JBLVw] = GetPlayerVirtualWorld(playerid);
			format(InfoJBL[i][jblDono], 24, nome(playerid));
			InfoJBL[i][ObjetoJbl] = CreateDynamicObject(2226, x, y, z, 0.0, 0.0, Ang);
			InfoJBL[i][TipoMusica] = tipojbl;
			ShowPlayerDialog(playerid, DIALOG_JBL, DIALOG_STYLE_LIST, "{ff0000}# Escolha A Musica", "Radio Trap / Funk e Hip Hop\n\
				Radio Funk\nRadio Eletronica\nRadio Piseiro\nRadio Sad Songs", "Ok", "Sair");
			return i;
		}
	}
	return -1;
}
forward CheckJBL(i);
public CheckJBL(i){
	if(JBLProxima[i] != -1) return 1;

	for(new jbl; jbl < MAX_JBL; jbl++){
		if(ISP(i,10.0, InfoJBL[jbl][PosJBL][0], InfoJBL[jbl][PosJBL][1],InfoJBL[jbl][PosJBL][2]) && InfoJBL[jbl][TipoMusica] != -1 && InfoJBL[jbl][JBLCriada] && GetPlayerVirtualWorld(i) ==InfoJBL[jbl][JBLVw]){
			if(JBLProxima[i] != InfoJBL[jbl][ObjetoJbl]){ //Audio(InfoJBL[jbl][TipoMusica])
				PlayAudioStreamForPlayer(i, Audio(InfoJBL[jbl][TipoMusica]),
					InfoJBL[jbl][PosJBL][0], InfoJBL[jbl][PosJBL][1],InfoJBL[jbl][PosJBL][2], 10.0, true);
				JBLProxima[i] = InfoJBL[jbl][ObjetoJbl];
			}
		}
		else{
			if(JBLProxima[i] != -1){
				JBLProxima[i] = -1;
				StopAudioStreamForPlayer(i);
			}
		}
	}
	return 1;
}
Audio(tipo){
	new string[168];
	switch(tipo){
		case 1: string = "http://node-17.zeno.fm/1s7c5qtrq18uv?rj-ttl=5&rj-tok=AAABeuhXLsMAnKWkVG5Uib18sw";
		case 2: string = "http://stream.zeno.fm/u6431vzhs18uv";
		case 3: string = "http://stream.zeno.fm/14g665rbt18uv";
		case 4: string = "https://node-20.zeno.fm/5gz4xe3vkm0uv?rj-ttl=5&rj-tok=AAABevHjJGgAVyyp5CHS8pkJhQ";
		case 5: string = "https://zeno.fm/lil-peep-sadsong/";
	}
	return string;
}





/*
B_GenChar(palavras){
	new
		str[47] = "NKI23TOGHAoakmr34mvOFMCID87gdvyD7I8ifgh9PAJOSi",
		str2[16];

	for(new i; i < palavras; i++){
		new i2 = random(sizeof str-1);
		format(str2, sizeof(str2), "%s%c", str2, str[i2]);
	}
	return str2;
}

*/




B_GenCharPlaca(palavras){
	new

		str[47] = "abcdefghijklmnopqrstuvwxyz1234567890AbCdEfGhIj",
		str2[16];

	for(new i; i < palavras; i++){
		new i2 = random(sizeof str-1);
		format(str2, sizeof(str2), "%s%c", str2, str[i2]);
	}
	return str2;
} 
ShowMalas(playerid, veiculo){
	SetPVarInt(playerid, "Malas", veiculo);
	ShowPlayerDialog(playerid, DIALOG_MOSTRARMALAS, DIALOG_STYLE_LIST, "{fff000}Seu Porta-Malas", "Ver Porta-Malas\nColocar Pessoa\n\
	Remover Pessoa", "Select", "Exit");
	return 1;
}
MensagemL(Float: x, Float: y, Float: z, const stri[]){
	foreach(new i: Player){
		if(ISP(i, 20.0, x, y, z))
			SendClientMessage(i, Roxoeu, stri);
	}
	return 0;
}
PutPlayerInPortaMalas(playerid, car){
	SetPlayerPos(playerid, -995.0186,-1578.7582,76.3672);
	TogglePlayerControllableEx(playerid, true);
	PlayerTextDrawShow(playerid, telapreta[playerid][0]);

	new str[144];
	ApplyAnimationEx(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0, SYNC_ALL);
	TogglePlayerControllableEx(playerid, false);
	Nopm[playerid] = car;
	format(str, sizeof str, "* %s, Voce acaba de ser colocado no Porta-Malas de um veiculo(%d).", nome(playerid), Nopm[playerid]);
	SendClientMessage(playerid, Roxoeu, str);
	return 1;
}
ContarVeh(veh){
	new cont = 0;
	foreach(new i: Player){
		if(Nopm[i] == veh)
			cont++;
	}
	return cont;
}
forward limparmac(playerid);
public limparmac(playerid){
	PC_EmulateCommand(playerid, "/anim");
}
DestroyVehicleEx(vehicleid, const reason[]){
	
	foreach(new i: Player){
		if(Nopm[i] == vehicleid){
			GameTextForPlayer(i, "Veiculo Destruido!", 2000, 3);
			SetPlayerHealth(i, 0);
			Nopm[i] = -1;
			PlayerTextDrawHide(i, telapreta[i][0]);
			TogglePlayerControllableEx(i, true);
		}
	}
	new hora, minuto, segundo, dia, mes, ano;
	gettime(hora, minuto, segundo);
	getdate(ano, mes, dia);
	
	printf("veiculo %d destruido. motivo: %s. hora: %02d:%02d:%02d. data: %02d/%02d/%02d", vehicleid, reason, hora, minuto, segundo, dia, mes, ano);
	if(IsVehicleAttachedObjectSlotUsed(vehicleid, 1)) RemoVehicleAttachedObject(vehicleid, 1);
	
	MunBomb[vehicleid] = 0; 
	VeiculoConfiguracao[vehicleid][Quebrado] = false;
	VeiculoConfiguracao[vehicleid][Desmanchado] = false;
	VeiculoInfo[vehicleid][sirene] = 0;
	VeiculoInfo[vehicleid][Mileage] = 0;

	if(IsVehicleAttachedObjectSlotUsed(vehicleid, 2))
		RemoVehicleAttachedObject(vehicleid, 2);	

	Iter_Remove(Vehicles, vehicleid);
	DestroyVehicle(vehicleid);
}

public exitGamemode(playerid){
	SalvarTudo();
	if(permissao_gmx){
		SendRconCommand("gmx");
		SendClientMessageToAll(LIGHTBLUE, "O Servidor esta reiniciando...");
	}
	return 1;
}
SalvarTudo(){
	if(IsValidTimer(OutrosTimers))
		KillTimer(OutrosTimers);
	
	if(IsValidTimer(TimerMaconha))
		KillTimer(TimerMaconha);

	if(IsValidTimer(TimerPayday))
		KillTimer(TimerPayday);

	foreach(new i: Player)
		OnPlayerDisconnect(i, 1);

	SalvarGangzones();
	SalvarEmpresas();
	salvarMaconhas();
	for(new i; i<MAX_GPS_LOCAL; i++)
		salvarGps(i);
	foreach(new i: GaragensIterator){
		SalvarGaragem(i);
	}
	foreach(new i: MenusCriados){
	    SalvarMenu(i);
	}
	foreach(new i: B_Portao){
	    SalvarPortao(i);
	}
	foreach(new i: B_Caixas){
	    SalvarCaixa(i);  
	}
	for(new i = 1; i<sizeof OrgGm; i++){
		SalvarOrg(i);
	}
	foreach(new i: B_House){
       	SalvarCasa(i);
       	SalvarMoradores(i);
	}
	SalvarCarrosAlugados();
	SalvarMafia();
	CloseDbs();
	permissao_gmx = true;
}
AbrirSelecaoIpva(playerid){
	new str[255], ct;
	strcat(str, "{33CCFF}ID\t {33CCFF}Veiculo\t{33aa33}IPVA\n");
	for(new i; i<MAXCONCE; i++){
		if(VehInfo[playerid][i][IPVA] > 0){
		    ct++;
	   		new str2[29+32];
			format(str2, sizeof(str2), "(%d)\t%s\t%dR$\n",i, GetVehicleName(VehInfo[playerid][i][IDCarro]), VehInfo[playerid][i][IPVA]);
			strcat(str, str2);
		}	
	}
	if(ct == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao possui ipva para pagar.");
	ShowPlayerDialog(playerid, DIALOG_SELECT_IPVA, 5, "{fff000}# Selecionar Veiculo", str, "Ok", "Retornar");	
	return 1;
}
AbrirSelecaoPlaca(playerid){
	new str[255], ct;
	strcat(str, "{33CCFF}ID\t {33CCFF}Veiculo\n");
	for(new i; i<MAXCONCE; i++){
		if(VehInfo[playerid][i][IDCarro] != 0){
		    ct++;
	   		new str2[29+32];
			format(str2, sizeof(str2), "(%d)\t %s\n",i, GetVehicleName(VehInfo[playerid][i][IDCarro]));
			strcat(str, str2);
		}	
	}
	if(ct == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem nenhum veiculo.");
	ShowPlayerDialog(playerid, DIALOG_SELECTVEH_PLACA, 5, "{fff000}# Selecionar Veiculo", str, "Ok", "Retornar");	
	return 1;
}
IsViatura(vehicleid){
	if(VeiculoInfo[vehicleid][sirene] == 1) return true;
	switch(GetVehicleModel(vehicleid)){
		case 427, 490, 523, 470, 528, 596, 597, 598, 599, 601, 497: 
			return true;
	}
	return false;
}
VeiculoVipM(veh){
	switch(veh){
		case 411, 522: return true;
	}
	return false;
}
VeiculoVip(veh){
	switch(GetVehicleModel (veh) ){
		case 411, 522, 471: return true;
	}
	return false;
}
adicionarveiculoOrg(org, veh){
	for(new i; i<MAX_CARROS; i++){
		if(OrgVeiculo[org][i][VeiculoModelo] == 0){
			OrgVeiculo[org][i][VeiculoModelo] = veh;
			SalvarOrg(org);
			return i;
		}
	}
	return -1;
}
MaximoVeiculoOrg(org){
	new cont;
	for(new i; i<MAX_CARROS; i++){
		if(OrgVeiculo[org][i][VeiculoModelo] != 0){
			cont++;
			if(cont == MAX_CARROS)
				return true;
		}
	}
	return false;
}
TemVeiculoOrg(org, veh){
	for(new i; i<MAX_CARROS; i++){
		if(OrgVeiculo[org][i][VeiculoModelo] == veh){
			return true;
		}
	}
	return false;
}
cmd:salvarcasa(playerid, params[]){

	SalvarCasa(strval(params));
	return 1;
}
VehOpcao(vehicleid, opcao){
	new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	switch(opcao){
		case VEICULO_LIGADO:{
			if(engine)
				return true;
			return false;
		}
		case LIGAR_VEICULO:SetVehicleParamsEx(vehicleid, true, lights, alarm, doors, bonnet, boot, objective);
		case DESLIGAR_VEICULO:SetVehicleParamsEx(vehicleid, false, lights, alarm, doors, bonnet, boot, objective);
		case FAROL_LIGADO:{
			if(lights)
				return true;
			return false;
		}
		case VEICULO_TRANCADO:{
			if(doors)
				return true;
			return false;
		}
		case TRANCAR_VEICULO: SetVehicleParamsEx(vehicleid, engine, lights, alarm, true, bonnet, boot, objective);
		case DESTRANCAR_VEICULO: SetVehicleParamsEx(vehicleid, engine, lights, alarm, false, bonnet, boot, objective);
		case LIGAR_ALARME: SetVehicleParamsEx(vehicleid, engine, lights, true, doors, bonnet, boot, objective);
		case DESLIGAR_ALARME: SetVehicleParamsEx(vehicleid, engine, lights, false, doors, bonnet, boot, objective);
		case LIGAR_FAROL: SetVehicleParamsEx(vehicleid, engine, true, alarm, doors, bonnet, boot, objective);		
		case DESLIGAR_FAROL: SetVehicleParamsEx(vehicleid, engine, false, alarm, doors, bonnet, boot, objective);
	}
	return 0;
}
EmpName(playerid){
	new tamanho[30];
	switch(PlayerInfo[playerid][Emprego]){
		case 0: tamanho = "Nenhum";
		case 1: tamanho = "Pescador";
		case 2: tamanho = "Cortador De Madeira";
		case 3: tamanho = "Transpt. De Madeira";
		case 4: tamanho = "Transpt. De Armas";
		case 5: tamanho = "Carro Forte";
		case 6: tamanho = "Mecanico";
		case 7: tamanho = "LEITEiro";
		case 8: tamanho = "Taxista";
		case 9: tamanho = "SAMU";
	}
	return tamanho;
}
forward checkstates();
public checkstates(){
	foreach(new i: Player){
		//////printf("%d  %d  %d  %d",NetStats_MessagesReceived(i),NetStats_MessagesSent(i), NetStats_MessagesRecvPerSecond(i), TickUp[i]);		
	}
}
cmd:stats(playerid){
	new stats[400+1];
    GetPlayerNetworkStats(playerid, stats, sizeof(stats)); // get your own networkstats
    ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "My NetworkStats", stats, "Okay", "");
    return 1;
}
MembrosPerto(playerid, members){
	new conta;
	foreach(new i: Player){
		new Float: X, Float: Y, Float: Z;
		GetPlayerPos(playerid, X, Y, Z);
		if(ISP(i, 4.0, X,Y,Z) && PlayerInfo[i][Org] == PlayerInfo[playerid][Org])
			conta++;
		if(conta >= members)
			return true;
	}
	return false;
}
AdicionarLogs(const log[]){
	new Query[255], time[6];
	gettime(time[0], time[1], time[2]);
	//gettime(hour=0, minute=0, second=0)
	getdate(time[3],time[4], time[5]);
	//getdate(year=0, month=0, day=0)	
	mysql_format(Dados, Query, sizeof Query, "INSERT INTO `Logs` (`Log`, `Data`) VALUES ('%s', '%d/%d/%d %d:%d')",
		log, time[5], time[4], time[3], time[0], time[1]);
	mysql_tquery(Dados, Query);
	return 1;
}
SetVehiclePosEx(vehicleid, Float:x, Float: y, Float: z){
	if(IsValidVehicle(vehicleid)){

		VeiculoInfo[vehicleid][OldPos][0] = x;
		VeiculoInfo[vehicleid][OldPos][1] = y;
		VeiculoInfo[vehicleid][OldPos][2] = z;
	
		VeiculoInfo[vehicleid][OldPosTaxi][0] = x;
		VeiculoInfo[vehicleid][OldPosTaxi][1] = y;
		VeiculoInfo[vehicleid][OldPosTaxi][2] = z;	
	}
	return vehicleid;
}
forward Float: GetMileage(playerid, veh);
public Float: GetMileage(playerid, veh){
	if(IsPlayerInVehicle(playerid, veh)){
		if(VeiculoInfo[veh][OldPosTaxi][0] == 0 || VeiculoInfo[veh][OldPosTaxi][1] == 0 || VeiculoInfo[veh][OldPosTaxi][2] == 0) 
			return 0.0;
		new 
			Float: x, 
			Float: y, 
			Float: z;

		GetVehiclePos(veh, x, y, z);
		if(VeiculoInfo[veh][OldPosTaxi][0] == x && VeiculoInfo[veh][OldPosTaxi][1] == y && VeiculoInfo[veh][OldPosTaxi][2] == z) 
			return 0.0;
		new Float: 
			Xis = floatsub(VeiculoInfo[veh][OldPosTaxi][0], x),
			Float: Ype = floatsub(VeiculoInfo[veh][OldPosTaxi][1], y),
			Float: Ze = floatsub(VeiculoInfo[veh][OldPosTaxi][2], z),
			Float: newMileage = VectorSize(Xis, Ype, Ze);
		
		VeiculoInfo[veh][OldPosTaxi][0] = x;
		VeiculoInfo[veh][OldPosTaxi][1] = y;
		VeiculoInfo[veh][OldPosTaxi][2] = z;

		if(1 <= newMileage <= 4)
			return 0.0;
		VeiculoInfo[veh][MileageTaxi] += newMileage;

		new Float: conta = VeiculoInfo[veh][MileageTaxi] / 4 / 2 + 30;
		new str[90];
		format(str, sizeof str, "~n~~n~~n~~n~~n~~n~~n~~n~~n~%0.0fm, receita estimada ~G~%dR$", VeiculoInfo[veh][MileageTaxi],
			floatround(conta));
		GameTextForPlayer(playerid, str, 3000, 3);
		
		return VeiculoInfo[veh][MileageTaxi];
	}
	else{
		KillTimer(TimerTaximetro[veh]);
		TimerTaximetro[veh] = -1;
		SendClientMessage(playerid, LIGHTBLUE, "* Voce saiu do veiculo e o Taximetro foi parado.");
	}
	return 0.0;
}
function Float: Distancia(Float: X1, Float: Y1, Float: X2, Float: Y2){

	return floatsqroot(  ((X1 - X2) * (X1 - X2)) + ((Y1 - Y2) * (Y1 - Y2)));
}
stock ContarGasolina(playerid, veh){
	if(IsPlayerInVehicle(playerid, veh)){
		if(VeiculoInfo[veh][OldPos][0] == 0 || VeiculoInfo[veh][OldPos][1] == 0 || VeiculoInfo[veh][OldPos][2] == 0) 
			return floatround(0.0);
		new 
			Float: x, 
			Float: y, 
			Float: z;

		GetVehiclePos(veh, x, y, z);
		if(VeiculoInfo[veh][OldPos][0] == x && VeiculoInfo[veh][OldPos][1] == y && VeiculoInfo[veh][OldPos][2] == z) 
			return floatround(0.0);

		new Float: 
			Xis = floatsub(VeiculoInfo[veh][OldPos][0], x),
			Float: Ype = floatsub(VeiculoInfo[veh][OldPos][1], y),
			Float: Ze = floatsub(VeiculoInfo[veh][OldPos][2], z),
			Float: newMileage = VectorSize(Xis, Ype, Ze);
		
		VeiculoInfo[veh][OldPos][0] = x;
		VeiculoInfo[veh][OldPos][1] = y;
		VeiculoInfo[veh][OldPos][2] = z;

		if(1 <= newMileage <= 4)
			return floatround(0.0);

		VeiculoInfo[veh][Mileage] += newMileage;

		new string[15];
		format(string, sizeof string, "%07d", floatround(VeiculoInfo[veh][Mileage]));
		PlayerTextDrawSetString(playerid, Velocimetro[playerid][2], string);
		PlayerTextDrawShow(playerid, Velocimetro[playerid][2]);

		VeiculoInfo[veh][GasolinaContar] += newMileage; //470
		if(VeiculoInfo[veh][GasolinaContar] >= Rodagem(GetVehicleModel(veh))){
			VeiculoInfo[veh][GasolinaContar] = 0.0;
			AtualizarGasolina(playerid, veh);
		}
	}
	return 0;
}
stock AtualizarGasolina(playerid, veh){
	if(VehOpcao(veh, VEICULO_LIGADO)){
		VeiculoInfo[veh][Gasolina] -- ;
		AtualizarTextoGasosa(playerid);
		if(VeiculoInfo[veh][Gasolina] < 1){
			VehOpcao(veh, DESLIGAR_VEICULO);
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| A Gasolina deste veiculo Acabou.");
		}
	}
}
stock AtualizarTextoGasosa(playerid){
	if(IsPlayerInAnyVehicle(playerid)){
		new str[9];
		format(str, sizeof str, "%03d~R~L", VeiculoInfo[GetPlayerVehicleID(playerid)][Gasolina]);
		PlayerTextDrawSetString(playerid,Velocimetro[playerid][10], str);
		PlayerTextDrawShow(playerid, Velocimetro[playerid][10]);
	}
	return 1;
}
GetPlayerId(&userid){
	foreach(new i: Player){
		if(PlayerInfo[i][Logado] && PlayerInfo[i][IDFixo] == userid){
			userid = i;
			return true;
		}
	}
	return false;
}
cmd:checkconnect(playerid, params[]){
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/checkconnect [ id ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um valor Invalido.");
	new id = strval(params);
	if(!GetPlayerId(id)) return SendClientMessage(playerid, LIGHTBLUE, "Este jogador esta offline.");
	if(IsPlayerConnectedP(id)){
		new str[60];
		format(str, sizeof str, "* %d esta online!", id);
		SendClientMessage(playerid, LIGHTBLUE, str);
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "Este jogador nao esta online.");

	return 1;
}
ResetMileage(veh){
	if(IsValidVehicle(veh)){

		VeiculoInfo[veh][OldPos][0] = 0.0;
		VeiculoInfo[veh][OldPos][2] = 0.0;
		VeiculoInfo[veh][OldPos][1] = 0.0;

		VeiculoInfo[veh][OldPosTaxi][0] = 0.0;
		VeiculoInfo[veh][OldPosTaxi][2] = 0.0;
		VeiculoInfo[veh][OldPosTaxi][1] = 0.0;
		VeiculoInfo[veh][Mileage] = 0.0;
		VeiculoInfo[veh][MileageTaxi] = 0.0;
	}
	return 1;
}
IsTerrorista(rgd){
	switch(rgd){
		case 18: return true;
	}
	return false;
}
IsBandido(rgd){
	switch(rgd){
		case 4, 5, 6,7,8,13,15, 18, 19: return true;
	}
	return false;
}
IsPolice(rgd){
	switch(rgd){
		case 1,2,3,9,10,11,12,14,16,17: return true;
	}
	return false;
}

CheckDeath2(playerid){
	new Float: hp;
	GetPlayerHealth(playerid, hp);
	if(hp < 30 && PlayerInfo[playerid][Logado]){
		SetPlayerHealth(playerid, 30);
		PlayerInfo[playerid][Ferido] = true;
		CheckDeath(playerid);
	}
	return 1;
}
CheckDeath(playerid){
	if(PlayerInfo[playerid][Ferido] && PlayerInfo[playerid][Logado]){
		PlayerInfo[playerid][MomentoFerido] = gettime() + 180;

		new Float: X, Float: Y, Float: Z;
		GetPlayerPos(playerid, X, Y, Z);

		PlayerInfo[playerid][DeathPos][0] = X;
		PlayerInfo[playerid][DeathPos][1] = Y;
		PlayerInfo[playerid][DeathPos][2] = Z;

		new str[144];
		format(str, sizeof str, "* %s perdeu muito sangue e agora esta ferido.", nome(playerid));
		MensagemLocal(15.0, playerid, Roxoeu, str, true);
		ApplyAnimationEx(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0, SYNC_ALL);
		SendClientMessage(playerid, LIGHTBLUE, "* Use /sobreviver para se auto reanimar!");
		return true;
	}
	return false;
}

forward curarnego(playerid);
public curarnego(playerid){
	SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de ser curado.");
	SetPlayerHealth(playerid, 100);
	TogglePlayerControllableEx(playerid, false);
	SetPlayerPos(playerid, 1253.8267,-1305.0664,1061.1350);
	SetPlayerFacingAngle(playerid, 92.8145);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllableEx(playerid, true);
}

stock GetPlayerFPS(playerid)
{
    SetPVarInt(playerid, "DrunkL", GetPlayerDrunkLevel(playerid));
    if(GetPVarInt(playerid, "DrunkL") < 100){
        SetPlayerDrunkLevel(playerid, 2000);}
    else
    {
        if(GetPVarInt(playerid, "LDrunkL") != GetPVarInt(playerid, "DrunkL"))
        {
            SetPVarInt(playerid, "FPS", (GetPVarInt(playerid, "LDrunkL") - GetPVarInt(playerid, "DrunkL")));
            SetPVarInt(playerid, "LDrunkL", GetPVarInt(playerid, "DrunkL"));
            if((GetPVarInt(playerid, "FPS") > 0) && (GetPVarInt(playerid, "FPS") < 256)){
            return GetPVarInt(playerid, "FPS") - 1;}
        }
    }
    return 0;
}
CheckPlayerDistanceToVehicle(Float:radi, playerid, vehicleid)
{
    if(IsPlayerConnectedP(playerid))
    {
        new Float:PX,Float:PY,Float:PZ,Float:X,Float:Y,Float:Z;
        GetPlayerPos(playerid,PX,PY,PZ);
        GetVehiclePos(vehicleid, X,Y,Z);
        new Float:Distance = (X-PX)*(X-PX)+(Y-PY)*(Y-PY)+(Z-PZ)*(Z-PZ);
        if(Distance <= radi*radi)
        {
            return true;
        }
    }
    return 0;
}
forward quebrartranca(playerid, carro);
public quebrartranca(playerid, carro){
	if(CheckPlayerDistanceToVehicle(4.0, playerid, carro)){
		ClearAnimations(playerid);
		TogglePlayerControllableEx(playerid, true);
		VehOpcao(carro, DESTRANCAR_VEICULO);
		VehOpcao(carro, DESLIGAR_ALARME);

		new str[144], Float: x, Float: y, Float: z;
		GetPlayerPos(playerid, x, y, z);
		format(str, sizeof str, "%s quebrou a tranca de um Veiculo.", nome(playerid));
		MensagemL(x, y, z, str);
	}
	else{
		SendClientMessage(playerid, LIGHTBLUE, "* Voce nao estava perto do carro para destranca-lo.");
		ClearAnimations(playerid);
		TogglePlayerControllableEx(playerid, true);
	}
}
VeiculoDoJogador(playerid, vehicleid){
	for(new i; i <MAXCONCE; i++){
		if(VehInfo[playerid][i][Carro] == vehicleid)
			return true;
	}
	return false;
}
stock GetXYZOfVehiclePart(vehicleid, part, &Float:x, &Float:y, &Float:z, Float:offset = 0.5)
{
    #if defined COLANDREAS
        new Float:cz;
    #endif
    new Float:X, Float:Y, Float:Z, Float:A;
    GetVehiclePos(vehicleid, x, y, z);
    GetVehicleZAngle(vehicleid, A);

    switch(part)
    {
        case VEHICLE_PART_DIANTEIRODIREITO: // Pneu dianteiro direito
        {
            GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_WHEELSFRONT, X, Y, Z);

            x += ( ( (X + offset) * floatsin( -A + 90.0, degrees ) ) + ( ( Y * floatsin( -A, degrees ) ) ) );
            y += ( ( (X + offset) * floatcos( -A + 90.0, degrees ) ) + ( ( Y * floatcos( -A, degrees ) ) ) );

            #if defined COLANDREAS
                CA_RayCastLine(x, y, z, x, y, z + 5.0, cz, cz, cz);

                if (cz != 0.0)
                    z = cz + offset;
            #endif
        }
        case VEHICLE_PART_DIANTEIROESQUERDO: // Pneu dianteiro esquerdo
        {
            GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_WHEELSFRONT, X, Y, Z);

            x += ( ( (X + offset) * floatsin( -A - 90.0, degrees ) ) + ( ( Y * floatsin( -A, degrees ) ) ) );
            y += ( ( (X + offset) * floatcos( -A - 90.0, degrees ) ) + ( ( Y * floatcos( -A, degrees ) ) ) );

            #if defined COLANDREAS
                CA_RayCastLine(x, y, z, x, y, z + 5.0, cz, cz, cz);

                if (cz != 0.0)
                    z = cz + offset;
            #endif
        }
        case VEHICLE_PART_TRASEIRODIREITO: // Pneu traseiro direito
        {
            GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_WHEELSREAR, X, Y, Z);

            x += ( ( (X + offset) * floatsin( -A + 90.0, degrees ) ) + ( ( Y * floatsin( -A, degrees ) ) ) );
            y += ( ( (X + offset) * floatcos( -A + 90.0, degrees ) ) + ( ( Y * floatcos( -A, degrees ) ) ) );

            #if defined COLANDREAS
                CA_RayCastLine(x, y, z, x, y, z + 5.0, cz, cz, cz);

                if (cz != 0.0)
                    z = cz + offset;
            #endif
        }
        case VEHICLE_PART_TRASEIROESQUERDO: // Pneu traseiro esquerdo
        {
            GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_WHEELSREAR, X, Y, Z);

            x += ( ( (X + offset) * floatsin( -A - 90.0, degrees ) ) + ( ( Y * floatsin( -A, degrees ) ) ) );
            y += ( ( (X + offset) * floatcos( -A - 90.0, degrees ) ) + ( ( Y * floatcos( -A, degrees ) ) ) );

            #if defined COLANDREAS
                CA_RayCastLine(x, y, z, x, y, z + 5.0, cz, cz, cz);

                if (cz != 0.0)
                    z = cz + offset;
            #endif
        }
        case VEHICLE_PART_FRENTE: // Na frente
        {
            GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, X, Y, Z);

            x += ( (Y / 2.0 + offset) * floatsin( -A, degrees ) );
            y += ( (Y / 2.0 + offset) * floatcos( -A, degrees ) );

            #if defined COLANDREAS
                CA_RayCastLine(x, y, z, x, y, z + 5.0, cz, cz, cz);

                if (cz != 0.0)
                    z = cz + offset;
            #endif
        }
        case VEHICLE_PART_TRAZ: // Atrás
        {
            GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, X, Y, Z);

            x += ( (Y / 2.0 + offset) * floatsin( -A + 180, degrees ) );
            y += ( (Y / 2.0 + offset) * floatcos( -A + 180, degrees ) );

            #if defined COLANDREAS
                CA_RayCastLine(x, y, z, x, y, z + 5.0, cz, cz, cz);

                if (cz != 0.0)
                    z = cz + offset;
            #endif
        }
    }
}

function GetXYInFrontOfObject(objectid, &Float:q, &Float:w, Float:distance)
{
    new Float:aV, Float:rotxX, Float:rotyY;
    GetDynamicObjectPos(objectid, q, w, aV);
    GetDynamicObjectRot(objectid, rotxX, rotyY, aV);

    q -= (distance * floatsin(-aV, degrees));
    w -= (distance * floatcos(-aV, degrees));
    return floatround(aV);
}

stock ApplyAnimationEx(playerid, const animlib[], const animname[], Float:fDelta, loop, lockx, locky, freeze, time, FORCE_SYNC:forceSync = SYNC_NONE)
{
	PreloadAnim(playerid, animlib);
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forceSync);
	return 1;
}
forward reabastecerV(playerid, veh, tanto);
public reabastecerV(playerid, veh, tanto){
	if(IsPlayerInVehicle(playerid, veh)){
		VeiculoInfo[veh][Gasolina] += tanto;
		PostoI[GetPVarInt(playerid, "QPosto")][CombustivelDisponivel] -= tanto;
		TogglePlayerControllableEx(playerid, true);
		SendClientMessage(playerid, LIGHTBLUE, "* Gasolina reabastecida neste veiculo.");
		AtualizarTextoGasosa(playerid);
	}
	else{
		SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar dentro do Veiculo.");
		TogglePlayerControllableEx(playerid, true);
	}
	return 1;
}
stock GetVehicleType(vehicleid)
{
    switch(GetVehicleModel(vehicleid)){
        case 400 .. 416, 418 .. 424, 426 .. 429, 431 .. 434, 436 .. 440, 442 .. 445, 451, 455 .. 459, 466, 467, 470, 471, 474, 475, 477 .. 480, 482, 483, 485, 486, 489 .. 492, 494 .. 496, 498 .. 500, 502 .. 508, 514 .. 518, 524 .. 536, 539 .. 547, 549 .. 552, 554 .. 562, 565 .. 568, 571 .. 576, 578 .. 580, 582, 583, 585, 587 .. 589, 596 .. 605, 609: return CAR;
        case 481, 509, 510: return BIKE;
        case 448, 461 .. 463, 468, 521 .. 523, 581, 586: return MOTORBIKE;
        case 430, 446, 452 .. 454, 472, 473, 484, 493, 595: return BOAT;
        case 460, 476, 511 .. 513, 519, 520, 553, 577, 592, 593: return PLANE;
        case 441, 464, 465, 501, 564, 594: return RCCAR;
        case 449, 537, 538, 569, 570, 590: return TRAIN;
        case 435, 450, 584, 591, 606 .. 608, 610, 611: return TRAILER;
        case 417, 425, 447, 469, 487, 488, 497, 548, 563: return HELICOPTER;
    }
    return -1;
}
stock GetVehicleTiresDamageStatus(vehicleid, &TraseiraDireita, &DianteiraDireita, &TraseiraEsquerda, &DianteiraEsquerda)
{
    new Panels, Doors, Lights, Tires;
    GetVehicleDamageStatus(vehicleid, Panels, Doors, Lights, Tires);
    if(GetVehicleType(vehicleid) == MOTORBIKE || GetVehicleType(vehicleid) == BIKE)
        DianteiraEsquerda = Tires >> 1 & 1, DianteiraDireita = Tires & 1;
    else
    {
        TraseiraDireita = Tires & 1;
        DianteiraDireita = Tires >> 1 & 1;
        TraseiraEsquerda = Tires >> 2 & 1;
        DianteiraEsquerda = Tires >> 3 & 1;
    }
    return true;
}
encode_tires(tires1, tires2, tires3, tires4) {
    return tires1 | (tires2 << 1) | (tires3 << 2) | (tires4 << 3);
}
forward trocarroda(playerid, carro, roda);
public trocarroda(playerid, carro, roda){
	if(IsValidVehicle(carro)){
		new TraseiraDireita, DianteiraDireita, TraseiraEsquerda, DianteiraEsquerda, damagestatus[4];
		GetVehicleDamageStatus(carro, damagestatus[0], damagestatus[1], damagestatus[2], damagestatus[3]);
		GetVehicleTiresDamageStatus(carro, TraseiraDireita, DianteiraDireita, TraseiraEsquerda, DianteiraEsquerda);
		switch(roda){
			case 1:{
				UpdateVehicleDamageStatus(carro, damagestatus[0], damagestatus[1], damagestatus[2], encode_tires(TraseiraDireita, 0, TraseiraEsquerda, DianteiraEsquerda));
			}
			case 2:{
				UpdateVehicleDamageStatus(carro, damagestatus[0], damagestatus[1], damagestatus[2], encode_tires(TraseiraDireita, DianteiraDireita, TraseiraEsquerda, 0));
			}
			case 3:{
				UpdateVehicleDamageStatus(carro, damagestatus[0], damagestatus[1], damagestatus[2], encode_tires(TraseiraDireita, 0, TraseiraEsquerda, DianteiraEsquerda));
			}
			case 4:{
				UpdateVehicleDamageStatus(carro, damagestatus[0], damagestatus[1], damagestatus[2], encode_tires(0, DianteiraDireita, TraseiraEsquerda, DianteiraEsquerda));
			}
		}
		VeiculoInfo[carro][ParteRoda][roda] = 0;
		SendClientMessage(playerid, LIGHTBLUE, "* Voce trocou esta roda com sucesso.");
		TogglePlayerControllableEx(playerid, true);
		PC_EmulateCommand(playerid, "/anim");
	}
	else{
		SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo nao existe mais, algum erro aconteceu.");
		TogglePlayerControllableEx(playerid, true);
		PC_EmulateCommand(playerid, "/anim");
	}
	return 1;
}
stock PreloadAnim(playerid, const animd[]){
	ApplyAnimation(playerid, animd, "null", 0.0, 0, 0, 0, 0, 0);
	return 1;
}
stock PreloadAnims(playerid)//Anti bug animes :D
{
	ApplyAnimation(playerid, "SWORD", "null", 0.0, 0, 0, 0, 0, 0);	
	ApplyAnimation(playerid, "BLOWJOBZ", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "STRIP", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "DANCING", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BAR", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BASEBALL", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BOMBER", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CARRY", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CRACK", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "GRENADE", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "MEDIC", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PED", "null", 0.0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SMOKING", "null", 0.0, 0, 0, 0, 0, 0);
    return 1;
}

checkInAcessoriosDB(const name[]){
	new str[144], Cache: R;
	mysql_format(Dados, str, sizeof str, "SELECT * FROM `Acessorios` WHERE `Nome` = '%s'", name);
	R = mysql_query(Dados, str);
	new rows = cache_num_rows();
	if(!rows){

		mysql_format(Dados, str, sizeof str, "INSERT INTO `Acessorios` (`Nome`) VALUES ('%s')", name);
		mysql_tquery(Dados, str);
	}
	if(cache_is_valid(R))cache_delete(R);
	return 1;
}
salvarAcessorios(playerid){
	for(new i; i <MAX_PLAYER_ATTACHED_OBJECTS; i++){
		new str[255], indexN = i;
		mysql_format(Dados, str, sizeof str, "UPDATE `Acessorios` SET `Acessorio%d` = '%d', `partebone%d` = '%d', `ao_x%d` = '%f', `ao_y%d` = '%f', `ao_z%d` = '%f' WHERE `Nome` = '%s'",
			i, ao[playerid][indexN][modelindex], i,ao[playerid][indexN][partebone], i, ao[playerid][indexN][ao_x], i, ao[playerid][indexN][ao_y], i, ao[playerid][indexN][ao_z], nome(playerid));
		mysql_tquery(Dados, str);
		mysql_format(Dados, str, sizeof str, "UPDATE `Acessorios` SET `ao_rx%d` = '%f', `ao_ry%d` = '%f', `ao_rz%d` = '%f', `ao_sx%d` = '%f', `ao_sy%d` = '%f', `ao_sz%d` = '%f' WHERE `Nome` = '%s'", i, ao[playerid][indexN][ao_rx], i, ao[playerid][indexN][ao_ry],i, ao[playerid][indexN][ao_rz], i,ao[playerid][indexN][ao_sx], i, ao[playerid][indexN][ao_sy], i,ao[playerid][indexN][ao_sz], nome(playerid));
		mysql_tquery(Dados, str);
	
	}
	return 1;
}
carregarAcessorios(playerid, i){
	new str[144], Cache: R;
	mysql_format(Dados, str, sizeof str,"SELECT * FROM `Acessorios` WHERE `Nome` = '%s'", nome(playerid));
	R = mysql_query(Dados, str);
	new rows = cache_num_rows();
	if(cache_is_valid(R) && rows){
		new indexn = i;
		RemovePlayerAttachedObjectEx(playerid, i);
		format(str, sizeof str, "Acessorio%d", i);
		ao[playerid][indexn][modelindex] = cache_return_int(0, str);
		if(ao[playerid][indexn][modelindex] != 0){
			ao[playerid][indexn][indexslot] = indexn;
			format(str, sizeof str, "partebone%d", i);
			ao[playerid][indexn][partebone] = cache_return_int(0, str);
			format(str, sizeof str, "ao_x%d", i);
			//////printf("3.2");
			ao[playerid][indexn][ao_x] = cache_return_float(0, str);
			format(str, sizeof str, "ao_y%d", i);
			//////printf("3.5");
			ao[playerid][indexn][ao_y] = cache_return_float(0, str);
			format(str, sizeof str, "ao_z%d", i);
			//////printf("3.7");
			ao[playerid][indexn][ao_z] = cache_return_float(0, str);
			format(str, sizeof str, "ao_rx%d", i);
			ao[playerid][indexn][ao_rx] = cache_return_float(0, str);
			format(str, sizeof str, "ao_ry%d", i);
			//////printf("3.8");
			ao[playerid][indexn][ao_ry] = cache_return_float(0, str);
			format(str, sizeof str, "ao_rz%d", i);
			//////printf("3.9");
			ao[playerid][indexn][ao_rz] = cache_return_float(0, str);
			format(str, sizeof str, "ao_sx%d", i);
			ao[playerid][indexn][ao_sx] = cache_return_float(0, str);
			format(str, sizeof str, "ao_sy%d", i);
			//////printf("3.9.9");
			ao[playerid][indexn][ao_sy] = cache_return_float(0, str);
			format(str, sizeof str, "ao_sz%d", i);
			ao[playerid][indexn][ao_sz] = cache_return_float(0, str);
			SetPlayerAttachedObjectEx(playerid, indexn, ao[playerid][indexn][modelindex], 
				ao[playerid][indexn][partebone], ao[playerid][indexn][ao_x], ao[playerid][indexn][ao_y],ao[playerid][indexn][ao_z], ao[playerid][indexn][ao_rx], ao[playerid][indexn][ao_ry], ao[playerid][indexn][ao_rz],
				ao[playerid][indexn][ao_sx], ao[playerid][indexn][ao_sy], ao[playerid][indexn][ao_sz]);//, materialcolor1 = 0, materialcolor2 = 0)
			//////printf("%s", NomeAcessorios(ao[playerid][index][partebone]));
		}
	}
	if(cache_is_valid(R))cache_delete(R);
	return 1;
}
stock RemovePlayerAttachedObjectEx(playerid, indexa){
	new reset[attached_object_data];
	ao[playerid][indexa] = reset;
    RemovePlayerAttachedObject(playerid, indexa);
    return indexa;
}
stock SetPlayerAttachedObjectEx(playerid, index, modelid, bone, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0){
   	ao[playerid][index][indexslot] = index;
    ao[playerid][index][modelindex] = modelid;
    ao[playerid][index][partebone] = bone;
    ao[playerid][index][ao_x] = fOffsetX;
   	ao[playerid][index][ao_y] = fOffsetY;
   	ao[playerid][index][ao_z] = fOffsetZ;
    ao[playerid][index][ao_rx] = fRotX;
    ao[playerid][index][ao_ry] = fRotY;
    ao[playerid][index][ao_rz] = fRotZ;
    ao[playerid][index][ao_sx] = fScaleX;
    ao[playerid][index][ao_sy] = fScaleY;
    ao[playerid][index][ao_sz] = fScaleZ;
    //////f("SPAO ( model %d bone %d %s", ao[playerid][index][modelindex], ao[playerid][index][partebone], NomeAcessorios(ao[playerid][index][modelindex]));
    SetPlayerAttachedObject(playerid, index, modelid, bone, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ, materialcolor1, materialcolor2);
}
stock ObjetoUsadoEmIndex(playerid, indexas){
	if(ao[playerid][indexas][modelindex] != 0 && IsPlayerAttachedObjectSlotUsed(playerid, indexas))
		return true;
	return false;
}
public OnPlayerEditAttachedObject(playerid, EDIT_RESPONSE:response, index, modelid, boneid, 
	Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, 
	Float:fRotX, Float:fRotY, Float:fRotZ, 
	Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
    if(response){
    	if(fScaleX > 3.0 || fScaleY > 3.0 || fScaleZ > 3.0){
    		SendClientMessage(playerid, LIGHTBLUE, "* Este objeto esta muito grande! Diminua.");
    		EditAttachedObject(playerid, index);
    	}
    	else{
	        SendClientMessage(playerid, VerdeSamp, "Este objeto foi salvo com Sucesso apos a edicao.");
    		ao[playerid][index][modelindex] = modelid;
	    	ao[playerid][index][partebone] = boneid;
        	ao[playerid][index][ao_x] = fOffsetX;
        	ao[playerid][index][ao_y] = fOffsetY;
        	ao[playerid][index][ao_z] = fOffsetZ;
        	ao[playerid][index][ao_rx] = fRotX;
        	ao[playerid][index][ao_ry] = fRotY;
        	ao[playerid][index][ao_rz] = fRotZ;
        	ao[playerid][index][ao_sx] = fScaleX;
        	ao[playerid][index][ao_sy] = fScaleY;
        	ao[playerid][index][ao_sz] = fScaleZ;
			SetPlayerAttachedObjectEx(playerid, index, modelid, boneid, ao[playerid][index][ao_x], ao[playerid][index][ao_y], ao[playerid][index][ao_z], ao[playerid][index][ao_rx], ao[playerid][index][ao_ry], ao[playerid][index][ao_rz], ao[playerid][index][ao_sx], ao[playerid][index][ao_sy], ao[playerid][index][ao_sz]);
			salvarAcessorios(playerid);
		}
    }
    else
    {
        SendClientMessage(playerid, VerdeSamp, "Voce cancelou a edicao, o objeto voltou a antiga Posicao.");
        new i = index;
        SetPlayerAttachedObjectEx(playerid, index, modelid, boneid, ao[playerid][i][ao_x], ao[playerid][i][ao_y], ao[playerid][i][ao_z], ao[playerid][i][ao_rx], ao[playerid][i][ao_ry], ao[playerid][i][ao_rz], ao[playerid][i][ao_sx], ao[playerid][i][ao_sy], ao[playerid][i][ao_sz]);
    }
    return 1;
}
stock AbrirSelectChangeParteAc(playerid){//DIALOG_SELECT_LOCAL_SET
	new grandestr[500];
	strcat(grandestr, "Parte\tDisponivel\n");			
	for(new i = 1; i <sizeof AttachmentBones; i++){
		new str[50];
		format(str, sizeof str, "%s\n",AttachmentBones[i]);
		strcat(grandestr, str);				
	}
	ShowPlayerDialog(playerid, DIALOG_SELECT_LOCAL_SET,5, "{fff000}Escolhendo Local", grandestr, "Ok", "Retorno");
}
stock AbrirSelectChangeParte(playerid){
	new grandestr[500];
	strcat(grandestr, "Parte\tDisponivel\n");			
	for(new i = 1; i <sizeof AttachmentBones; i++){
		new str[50];
		format(str, sizeof str, "%s\n",AttachmentBones[i]);
		strcat(grandestr, str);				
	}
	ShowPlayerDialog(playerid, DIALOG_SUBS_LOCAL,5, "{fff000}Escolhendo Local", grandestr, "Ok", "Retorno");
}
stock LotSlots(playerid){
	new cont;
	for(new i; i <MAX_PLAYER_ATTACHED_OBJECTS; i++){
		if(ObjetoUsadoEmIndex(playerid, i))
			cont++;
	}
	return (cont == MAX_PLAYER_ATTACHED_OBJECTS ? (true) : (false));
}
stock GetLivreSlot(playerid){
	new oq = -1;
	for(new i; i<MAX_PLAYER_ATTACHED_OBJECTS; i++){
		if(!ObjetoUsadoEmIndex(playerid, i)){
			oq = i;
			break;
		}
	}
	return oq;
}
stock AdicionarItemVeiculo(veiculo, item, quantia){
	for(new i; i != 14; i++){
		if(VeiculoConfiguracao[veiculo][Item][i] == 0){
			VeiculoConfiguracao[veiculo][Item][i] = item;
			VeiculoConfiguracao[veiculo][Quantia][i] = quantia;
			return i;
		}
	}
	return -1;
}
stock Rodagem(modelo){
	new r = 480;
	switch(modelo){
		case 434, 556, 557, 406, 432, 522: r = 300;
		case 560, 451, 502, 503, 506, 541, 402, 411: r = 315; // Carros Esportivos
		case 490, 528, 596, 597, 598, 599, 601, 407, 416, 420, 427, 433, 431, 437, 438: r = 479; // Public Services Vehicles
		case 448, 461, 462, 463, 468, 471, 521, 581, 586: r = 620; // Motos
	}
	return r;
}

cmd:rfr(playerid, params[]){
	if(GetPVarInt(playerid, "Freq") != 0){
		if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/rfr [ texto ]");
		foreach(new i: Player){
			if(GetPVarInt(i, "Freq") == GetPVarInt(playerid, "Freq")){
				new str[144];
				format(str, sizeof str, "[Frequencia] %s diz: %s.", nome(playerid), params);
				SendClientMessage(i, 0xFF0000FF, str);
			}
		}
    }
    else
    	SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa conectar no /frequencia antes!");
    return 1;
}

cmd:frequencia(playerid, params[]){
	if(!TemItem(playerid, RADINHO)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui radio.");
	if(GetPVarInt(playerid, "Freq") != 0){
		//if(SvHasListenerInStream(GRadio[id], playerid)) SvDetachListenerFromStream(GRadio[id], playerid);
		//if(SvHasSpeakerInStream(GRadio[id], playerid)) SvDetachSpeakerFromStream(GRadio[id], playerid);
        SendClientMessage(playerid, LIGHTBLUE, "* Voce foi desconectado desta frequencia.");
        SetPVarInt(playerid, "Freq", 0);
    }
    else{
		new freq = strval(params);
		if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/frequencia [ 1-400 ]");
		if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "/frequencia [ 1-400 ]");
		if(1 <= freq <= MAX_FREQUENCIAS){
			if(Iter_Contains(Frequencia, freq)){
				SetPVarInt(playerid, "Freq", freq);
				//SvAttachListenerToStream(GRadio[freq], playerid);
				SendClientMessage(playerid, LIGHTBLUE, "* Voce foi conectado com sucesso a esta frequencia.");
				SendClientMessage(playerid, VerdeSamp, "* Para desconectar desta frequencia use /frequencia novamente.");
			}
			else{
				Iter_Add(Frequencia, freq);
				//GRadio[freq] = SvCreateGStream(0xffff0000, "RADINHO");
				SetPVarInt(playerid, "Freq", freq);
				//SvAttachListenerToStream(GRadio[freq], playerid);
				SendClientMessage(playerid, LIGHTBLUE, "* Voce foi conectado com sucesso a esta frequencia! use /rfr.");
				SendClientMessage(playerid, VerdeSamp, "* Para desconectar desta frequencia use /frequencia novamente.");

			}
		}
		else
			SendClientMessage(playerid, LIGHTBLUE, "* Esta frequencia nao pode ser criada.");
	}
	return 1;
}
cmd:colocarsaco(playerid, params[]){
	if(PlayerInfo[playerid][Org] == 0) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/colocarsaco [ id ]");
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "/colocarsaco [ id ]");
	new achou = -1, id = strval(params);
	foreach(new i: Player){
		if(PlayerInfo[i][IDFixo] == id){
			id = i;
			achou = i;
			break;
		}
	}
	if(achou == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce digitou um ID invalido.");
	if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode fazer isso!");
	if(IsPlayerInAnyVehicle(playerid) && !IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, LIGHTBLUE, "* Saia do veiculo para fazer isso.");
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(id, X, Y, Z);
	if(!ISP(playerid, 3.0, X, Y, Z)) return SendClientMessage(playerid, LIGHTBLUE, "Voce precisa estar perto do jogador!");
	new str[144];
	if(NoSaco[id]){
		NoSaco[id] = false;
		PlayerTextDrawHide(id, telapreta[id][0]);
		format(str, sizeof str, "* %s removeu o saco da cabeca de %s.", nome(playerid), nome(id));
		MensagemLocal(50.0, playerid, Roxoeu, str, false);
		TogglePlayerControllableEx(id, true);

	}
	else{
		NoSaco[id] = true;
		PlayerTextDrawShow(id, telapreta[id][0]);
		format(str, sizeof str, "* %s colocou o saco na cabeca de %s.", nome(playerid), nome(id));
		MensagemLocal(50.0, playerid, Roxoeu, str, false);		
		TogglePlayerControllableEx(id, false);
	}
	return 1;
}
cmd:bloqueio(playerid){
	if(PlayerInfo[playerid][Org] == 0) return 1;
	if(MaximoBloqueios(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja tem o maximo de bloqueios permitidos. Use /rbloqueios.");
	new Float: x, Float: y, Float: z, Float:rz;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, rz);
	if(IsBandido(PlayerInfo[playerid][Org])) CriarBloqueio(playerid, 1227, x, y, z+1, rz);
	if(IsPolice(PlayerInfo[playerid][Org])) CriarBloqueio(playerid, 1237, x, y, z, rz);
	if(IsBandido(PlayerInfo[playerid][Org])) SetPlayerPos(playerid, x, y, z+3.5);
	if(IsPolice(PlayerInfo[playerid][Org])) SetPlayerPos(playerid, x, y, z+1);
	SendClientMessage(playerid, LIGHTBLUE, "* Sucesso! O Bloqueio foi criado.");
	return 1;
}
cmd:rbloqueios(playerid){
	if(PlayerInfo[playerid][Org] == 0) return 1;
	SendClientMessage(playerid, COR_COPOM, "* Bloqueios criados por voce foram destruidos.");
	for(new i = 1; i < MAX_BLOQUEIOS; i++){
		if(BloqueioInfo[i][OBjeto] != 0 && !isnull(BloqueioInfo[i][DonoBloqueio]) && !strcmp(nome(playerid), BloqueioInfo[i][DonoBloqueio])){
			DestroyDynamicObject(BloqueioInfo[i][OBjeto]);
			DestroyDynamic3DTextLabel(BloqueioInfo[i][TextoObjeto]);
			format(BloqueioInfo[i][DonoBloqueio], 24, "...");
			BloqueioInfo[i][OBjeto] = 0;
		}
	}
	return 1;
}
stock MaximoBloqueios(playerid){
	new cont;
	for(new i = 1; i < MAX_BLOQUEIOS; i++){
		if(BloqueioInfo[i][OBjeto] != 0 && !isnull(BloqueioInfo[i][DonoBloqueio]) && !strcmp(nome(playerid), BloqueioInfo[i][DonoBloqueio])){
			cont++;
			if(cont >= 3)
				return true;
		}
	}
	return false;
}
stock CriarBloqueio(playerid, bloqueio, Float: x, Float: y, Float: z, Float: rz){
	for(new i = 1; i < MAX_BLOQUEIOS; i++){
		if(BloqueioInfo[i][OBjeto] == 0){
			BloqueioInfo[i][OBjeto] = CreateDynamicObject(bloqueio,x,y,z-1, 0, 0, rz);// worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);
			new str[144], tempo[3];
			gettime(tempo[0], tempo[1], tempo[2]);
			format(str, sizeof str, "%s\n%s\n{ffffff}%d:%d", nome(playerid), OrgGm[ PlayerInfo[playerid][Org] ][OrgNome], tempo[0], tempo[1]);
			BloqueioInfo[i][TextoObjeto] = CreateDynamic3DTextLabel(str, -1, x,y,z-1, 2.0);//, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
			format(BloqueioInfo[i][DonoBloqueio], 24, nome(playerid));
			return i;
		}
	}
	return -1;
}
cmd:destruirbqs(playerid){
	if(PlayerInfo[playerid][Admin] < 4) return 1;
	new str[90];
	format(str, sizeof str, "%s destruiu todos os bloqueios do servidor", nome(playerid));
	SendClientMessageToAll(LIGHTBLUE, str);
	for(new i = 1; i < MAX_BLOQUEIOS; i++){
		if(BloqueioInfo[i][OBjeto] != 0){
			DestroyDynamicObject(BloqueioInfo[i][OBjeto]);
			DestroyDynamic3DTextLabel(BloqueioInfo[i][TextoObjeto]);
			format(BloqueioInfo[i][DonoBloqueio], 24, "...");
			BloqueioInfo[i][OBjeto] = 0;
		}
	}
	return 1;
}

function colocargas(veh, playerid, const nick[]){
	if(veh != INVALID_VEHICLE_ID && !strcmp(nome(playerid), nick)){
		new posto = GetPVarInt(playerid, "OPostoA");

		CarregandoCombustivel[veh] = true;
		Abastecendo[playerid] = false;
		TogglePlayerControllableEx(playerid, true);
		SendClientMessage(playerid, LIGHTBLUE, "* Caminhao carregado com combustivel, va ate a marca e de /dcombus.");
		
		SetPlayerCheckpoint(playerid, PostoInfo[posto][PostoX],PostoInfo[posto][PostoY],PostoInfo[posto][PostoZ], 5.0);
	}
	else{
		Abastecendo[playerid] = false;
		TogglePlayerControllableEx(playerid, true);
	}
	return 1;
}

stock PegarQuantiaItem(playerid, item){
	new cont;
  	for(new i; i<32; i++){
  		if(ItemInfo[playerid][i][Item] == item){
  			cont = ItemInfo[playerid][i][Quantia];
  			break;
  		}
  	}
  	return cont;
}
cmd:tpdeer(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 11) return 1;
	new i = strval(params);
	SetPlayerPos(playerid, DeerInfo[i][DeerX],DeerInfo[i][DeerY],DeerInfo[i][DeerZ]);
	return 1;
}
cmd:venderc(playerid){
	if(PlayerInfo[playerid][Emprego] != CACADOR) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar este comando.");
	if(!TrabalhandoEmprego[playerid][CACADOR]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta trabalhando.");
	if(!ISP(playerid, 3.0, -1631.19641, -2241.01196, 31.49619)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta na posicao.");
	if(Couros[playerid] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui Couros.");
	new str[144];
	format(str, sizeof str, "%s\n\n{fff000}Voce esta com %d Couros.\n{33aa33}Deseja Vende-los por %dR$?", nome(playerid), Couros[playerid], Couros[playerid]*290);
	ShowPlayerDialog(playerid, DIALOG_VENDER_COUROS, DIALOG_STYLE_MSGBOX, "{ff0000}# Vender Couros", str, "Ok", "Sair");
	return 1;
}
cmd:pegarcouro(playerid){
	if(PlayerInfo[playerid][Emprego] != CACADOR) return 1;
	if(!TrabalhandoEmprego[playerid][CACADOR]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta em modo de servico.");
	for(new i; i < MAX_VEADOS; i++){
		if(DeerInfo[i][DeerMorto] && ISP(playerid, 2.5, DeerInfo[i][DeerX], DeerInfo[i][DeerY], DeerInfo[i][DeerZ])){
			
			if(PegandoCouro[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta pegando couro.");
			
			PegandoCouro[playerid] = true;
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
			GameTextForPlayer(playerid, "~R~Pegando Couro...", 5000, 3);
			SetTimerEx("terminarCouro", 5000, false, "iis", playerid, i, nome(playerid));
			break;
		}
	}
	return 1;
}
function terminarCouro(playerid, veado, const nick[]){
	if(!strcmp(nome(playerid), nick)){
		if(IsValidDynamicObject(DeerInfo[veado][ODeer])){
			DestroyDynamicObject(DeerInfo[veado][ODeer]);
			DeerInfo[veado][DeerMorto] = false;
			DeerInfo[veado][DeerCriado] = false;
			SetTimer("CriarVeado", 30000, false);
			Couros[playerid]++;
			PC_EmulateCommand(playerid, "/anim");

			new str[144];
			format(str, sizeof str, "Voce pegou +1 couro e esta com um total de %d/6 Couros! Continue Cacando.",
				Couros[playerid]);
			SendClientMessage(playerid, COR_COPOM, str);
			PegandoCouro[playerid] = false;
		}
		else{
			PC_EmulateCommand(playerid, "/anim");
			PegandoCouro[playerid] = false;
			SendClientMessage(playerid, LIGHTBLUE, "* Voce nao conseguiu pegar o couro deste veado.");
		}
	}
	else{
		PegandoCouro[playerid] = false;
		PC_EmulateCommand(playerid, "/anim");
	}
	return 1;
}
public OnDynamicObjectMoved(objectid){ // aqui explode
	if(GetDynamicObjectModel(objectid) == 345){ // tentei definir com uma variavel Bool, mas como não sei o limite de DynamicObjects achei melhor deixar assim. certifique-se de que não há nenhum objeto com o mesmo id ( modelo ) no gamemode para ser movido!
		new Float: X, Float: Y, Float: Z;
		GetDynamicObjectPos(objectid, X, Y, Z);
		CreateExplosion(X, Y, Z, 10, 15.0);
		DestroyDynamicObject(objectid);
	}
	return 1;
}
public OnPlayerShootDynamicObject(playerid, weaponid, objectid, Float:x, Float:y, Float:z){
	if(weaponid == 34 && IsValidDynamicObject(objectid) && TrabalhandoEmprego[playerid][CACADOR]){
		for(new i; i < MAX_VEADOS; i++){
			if(objectid == DeerInfo[i][ODeer] && !DeerInfo[i][DeerMorto] && DeerInfo[i][DeerCriado]){
				new Float: X2, Float: Y2, Float: Z2;
				GetDynamicObjectPos(objectid, X2, Y2, Z2);
				if(GetPlayerDistanceFromPoint(playerid, X2, Y2, Z2) < 20.0){
					SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar a mais de 20m de distancia para abater um Veado!");
					KillTimer(TimerViadinho[i]);
					DestroirVeado(i);
					break;
				}
				else{				
					DeerInfo[i][DeerMorto] = true;
					new Float: X, Float: Y, Float: Z;
					GetDynamicObjectRot(objectid, X, Y, Z);
					new r = random(1);
					if(r == 0) MoveDynamicObject(objectid, X2, Y2, Z2+0.1 , 1.1, X-90, Y, Z);
					else if(r == 0) MoveDynamicObject(objectid, X2, Y2, Z2+0.1 , 1.1, X+90, Y, Z);
					//SetDynamicObjectRot(objectid, X-90, Y, Z);

					SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de abater um Veado! Va ate ele e de /pegarcouro.");
					KillTimer(TimerViadinho[i]);
					break;
				}
			}
		}
	}
	return 1;
}
fString(const txt[], {_,Bit,Text,Group,File,Float,Text3D,Int,Hex}:...)
{
    #pragma unused txt

    static
        slFormat = 0,
        slReturn = 0,
        slCount = 0,
        slSize = 180; // Update `slSize` if you need bigger string values to be returned accordingly. (for example querying, or such)

    #emit POP.pri
    #emit STOR.pri     slFormat
    #emit STACK        0
    #emit POP.pri
    #emit STOR.pri     slReturn
    #emit POP.pri
    #emit ADD.C        8
    #emit STOR.pri     slCount
    #emit PUSH         slSize
    #emit ADD
    #emit LOAD.I
    #emit PUSH.pri
    #emit PUSH         slCount
    #emit SYSREQ.C     format
    #emit PUSH         slReturn
    #emit PUSH         slFormat
    #emit RETN

    new
        lReturn[sizeof slSize];
    
    return lReturn;
}


stock PlayerVeh(playerid, veh){
	for(new i; i < MAXCONCE; i++){
		if(VehInfo[playerid][i][Carro] == veh)
			return true;
	}
	return false;
}
cmd:desmanchar(playerid){

	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(VeiculoConfiguracao[GetPlayerVehicleID(playerid)][Quebrado]) return SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo esta quebrado!");
	if(VeiculoConfiguracao[GetPlayerVehicleID(playerid)][Desmanchado]) return SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo ja foi desmanchado!");
	if(!ISP(playerid, 4.0, 2246.46240, -2159.46826, 13.50487)){
		SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta no Desmanche, marcado em seu mapa.");
		SetPlayerCheckpoint(playerid, 2246.46240, -2159.46826, 13.50487, 3.0);
		return 1;
	}
	else{
		new achado = -1, membros;
		if(PlayerInfo[playerid][Org]) membros = 3;
		if(IsPolice(PlayerInfo[playerid][Org]) || IsBandido(PlayerInfo[playerid][Org])) membros = 2;
		if(!MembrosPerto(playerid, membros)) return SendClientMessage(playerid, LIGHTBLUE, fString("* Voce precisa de %d membros perto.", membros));
		if(PlayerVeh(playerid, GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo e seu!");
		foreach(new i: Player){
			for(new car; car<MAXCONCE; car++){
			    if(GetPlayerVehicleID(playerid) == VehInfo[i][car][Carro] && IsPlayerInVehicle(playerid, VehInfo[i][car][Carro]))
			    	achado = GetPlayerVehicleID(playerid);
			}
		}
		if(achado == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar no veiculo de um outro jogador.");
		DesmancharVeiculo(GetPlayerVehicleID(playerid));
		SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+4);
		for(new i; i<MAX_CARRO_CONCE; i++)
		{
			if(carrosCompra[i][carroModel] == GetVehicleModel( GetPlayerVehicleID(playerid) )){
				new Float:conta = (0.03) * floatround(carrosCompra[i][carroPrice]);
				if(conta == 0.0) conta = 1000.0;
				GivePlayerCash(playerid, floatround(conta));
				new str[144];
				format(str, sizeof str, "Voce desmanchou este veiculo e ganhou %dR$!",
					floatround(conta));
				SendClientMessage(playerid, COR_COPOM, str);
				SendClientMessage(playerid, COR_COPOM, "* Furte a gasolina do veiculo usando /furtargasolina!");
				break;
			}
		}
	}
	SendClientMessageToAll(LIGHTBLUE, "* Um Veiculo acaba de ser desmanchado.");
	return 1;
}

stock DesmancharVeiculo(veh){
	if(IsValidVehicle(veh)){
		//SetVehicleIndividualTires(veh, TIRE_UNCHANGED, TIRE_UNCHANGED, TIRE_UNCHANGED, TIRE_UNCHANGED);
		VeiculoConfiguracao[veh][Quebrado] = true;
		VeiculoConfiguracao[veh][Desmanchado] = true;
		SetVehicleHealth(veh, 299);	
	}
	return veh;
}
stock IsComida(item){
	switch(item){
		case PIZZA, HAMBURGUER, COXINHA, PRATO_FEITO, FEIJOADA,BAURU: return true;
		default: return false;
	}
	return false;

}
stock AudioPMessage(playerid, rad, const str[])
{
    new Float:px, Float:py, Float:pz;
    GetPlayerPos(playerid, px, py, pz);
    new world = GetPlayerVirtualWorld(playerid);
    static const    translate_str1[] = "http://translate.google.kg/translate_tts?ie=UTF-8&q=",
                    translate_str2[] = "&tl=pt&prev=input";
    new stream[(sizeof(translate_str1)-1)+128+(sizeof(translate_str2)-1)+1];
    stream = translate_str1, strcat(stream, str), strcat(stream, translate_str2);
    PlayAudioStreamForPlayer(playerid, stream);
    return 1;
}

stock IsBebida(item){
	switch(item){
		case COCA_COLA, PEPSI, SUCO_MARACUJA, SUCO_LARANJA, AGUA, CERVEJA: return true;
		default: return false;
	}
	return false;
}
stock ConverterComida(comida){
	switch(comida){
		case PIZZA: return 8+3;
		case HAMBURGUER: return 6+3;
		case COXINHA: return 5+3;
		case PRATO_FEITO: return 10+3;
		case FEIJOADA: return 8+3;
		case BAURU: return 8+3;
		case COCA_COLA: return 6+3;
		case PEPSI: return 6+3;
		case SUCO_LARANJA: return 7+4;
		case SUCO_MARACUJA: return 7+4;
		case AGUA: return 15;
		case CERVEJA: return 12;
	}
	return 0;
}
stock Equipado(playerid){ //245
	switch( GetPlayerSkin(playerid) ){
		case 280, 281, 282, 283, 284, 285, 286, 287, 288, 
		300, 301, 302, 306, 307, 308, 309, 310, 311: return true;
		default: return false;
	}
	return false;
}
function LimparAnim(playerid){
	PC_EmulateCommand(playerid, "/anim");
	return 1;
}
stock AdicionarItemCasa(casa, item, quantia){
	for(new i; i<14; i++){
		if(InfoCasa[casa][Item][i] == item){
			if(InfoCasa[casa][Item][i] == item){
				InfoCasa[casa][Quantia][i] += quantia;
				return i;
			}
		}
		else{
			if(InfoCasa[casa][Item][i] == 0){
				InfoCasa[casa][Quantia][i] += quantia;
				InfoCasa[casa][Item][i] = item;
			
				return i;
			}
		}	
	}	
	return -1;
}

carregarBanco(playerid){
	new query[100], Cache: R;
	mysql_format(Dados, query, sizeof query, "SELECT * FROM `Banco` WHERE `Usuario` = '%e'", nome(playerid));
	R = mysql_query(Dados, query);
	new row = cache_num_rows();
	if(row){
		cache_get_value_name_int(0, "userbanco", BancoInfo[playerid][userbanco]);
		cache_get_value_name_int(0, "Dinheiro", BancoInfo[playerid][Dinheiro]);
		cache_get_value_name_int(0, "Bloqueada", BancoInfo[playerid][Bloqueada]);
	}
	if(cache_is_valid(R))cache_delete(R);
	//printf("banco carregado (%d)", BancoInfo[playerid][Dinheiro]); 
	return 1;
}
salvarBanco(playerid){
	new Query[144];
	mysql_format(Dados, Query, sizeof Query, "UPDATE `Banco` SET `Dinheiro` = '%d', `Bloqueada` = '%d' WHERE `Usuario` = '%s'",
		BancoInfo[playerid][Dinheiro], (BancoInfo[playerid][Bloqueada] ? (1) : (0)), nome(playerid));
	mysql_tquery(Dados, Query);
	return 1;
}
stock CriarContaBanco(playerid){
	new Query[200], Cache: R;
	mysql_format(Dados, Query, sizeof Query, "SELECT * FROM `Banco` WHERE `Usuario` = '%e'", nome(playerid));
	R = mysql_query(Dados, Query);
	new rows = cache_num_rows();
	//printf("total de rows nesta consulta %d, cache valido ? %d cache_results %d", rows, cache_is_valid(R) ? (1) : (0), cache_num_results());
	if(rows == 0){

		mysql_format(Dados, Query, sizeof Query, "INSERT INTO `Banco` (`Usuario`) VALUES ('%e')", nome(playerid));
		mysql_tquery(Dados, Query);
		
		mysql_format(Dados, Query, sizeof Query, "SELECT `userbanco` FROM `Banco` WHERE `Usuario` = '%e'", nome(playerid));
		mysql_tquery(Dados, Query, "SelectInfosBank", "i", playerid);

	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "Voce ja possui uma conta no banco.");

	if(cache_is_valid(R))cache_delete(R);
}
function SelectInfosBank(playerid){
	BancoInfo[playerid][userbanco] = cache_return_int(0, "userbanco");
	BancoInfo[playerid][Dinheiro] = PlayerInfo[playerid][Banco];

	new Query[180];
	format(Query, sizeof Query, "{ffffff}%s\n{ffffff}%dR$\n{ffffff}Bloqueada: %s\n{ffffff}Conta numero {33ccff}%04d",
		nome(playerid), BancoInfo[playerid][Dinheiro], BancoInfo[playerid][Bloqueada] ? ("Sim") : ("Nao"), BancoInfo[playerid][userbanco]);
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{33ccff}# Informacoes Da Conta:", Query, "Ok", #);
}
stock PossuiContaNumeroBanco(contaid){
	new Query[90], Cache: R;
	mysql_format(Dados, Query, sizeof Query, "SELECT `userbanco` FROM `Banco` WHERE `userbanco` = '%d'", contaid);
	R = mysql_query(Dados, Query);
	new rows = cache_num_rows();
	if(cache_is_valid(R) && rows)
		return true;

	if(cache_is_valid(R))cache_delete(R);
	return false;
}
stock PossuiContaBanco(playerid){
	new Query[90], Cache: R;
	mysql_format(Dados, Query, sizeof Query, "SELECT `Usuario` FROM `Banco` WHERE `Usuario` = '%e'", nome(playerid));
	R = mysql_query(Dados, Query);
	new rows = cache_num_rows();
	if(cache_is_valid(R) && rows)
		return true;

	if(cache_is_valid(R))cache_delete(R);
	return false;
}
stock IsBlindado(vehicleid){
	switch(GetVehicleModel(vehicleid)){
		case 427,432,528,601: return true;
	}
	return false;
}

cmd:menuempresa(playerid){
	foreach(new i: Empresas){
		if(ISP(playerid, 2.5, InfoEmpresa[i][EmpresaPos][0], InfoEmpresa[i][EmpresaPos][1], InfoEmpresa[i][EmpresaPos][2])){
			if(InfoEmpresa[i][EmpresaComprada] && !strcmp(InfoEmpresa[i][EmpresaDono], nome(playerid))){
				SetPVarInt(playerid, "SuaEmpresa", i);
				ShowPlayerDialog(playerid, DIALOG_OPCOES_EMPRESA, DIALOG_STYLE_LIST, InfoEmpresa[i][EmpresaNome], "Mudar Nome\nSacar Grana\nAumentar Lucro(90000$)\nTrocar Dono\n{ff0000}Vender Empresa", "Ok", "Sair");
				break;
			}
		}
	}
	return 1;
}
cmd:comprarempresa(playerid){
	foreach(new i: Empresas){
		if(ISP(playerid, 2.5, InfoEmpresa[i][EmpresaPos][0], InfoEmpresa[i][EmpresaPos][1], InfoEmpresa[i][EmpresaPos][2])){
			if(InfoEmpresa[i][EmpresaComprada]) return SendClientMessage(playerid, LIGHTBLUE, "Esta empresa ja foi comprada.");
			if(GetPlayerCash(playerid) < InfoEmpresa[i][EmpresaValor]) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao tem dinheiro suficiente.");
			if(!strcmp(InfoEmpresa[i][EmpresaDono], nome(playerid))) return SendClientMessage(playerid, LIGHTBLUE, "Voce ja e dono da empresa!");
			SetPVarInt(playerid, "Empresaselect", i);
			new str[144];
			format(str, sizeof str, "{ffffff}Esta empresa custa %dR$\nOs ganhos por hora sao %dR$.\nGostaria de comprar?",
				InfoEmpresa[i][EmpresaValor], InfoEmpresa[i][Ganhos]);
			ShowPlayerDialog(playerid, DIALOG_COMPRAR_EMPRESA, DIALOG_STYLE_MSGBOX, InfoEmpresa[i][EmpresaNome], str, "Comprar", "Sair");
			break;
		}
	}
	return 1;
}
cmd:criarempresa(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	new empresanome[32], valor, porcentagem;
	if(sscanf(params, "iis[32]", valor, porcentagem, empresanome)) return SendClientMessage(playerid, LIGHTBLUE, "/criarempresa [ valor ] [ ganhos por hora] [ nome da empresa ]");
	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x, y, z);

	CriarEmpresa(empresanome, valor, x, y, z, porcentagem);
	SendClientMessage(playerid, LIGHTBLUE, "Voce criou uma nova empresa!");

	return 1;
}
AtualizarTextEmpresa(id){
	if(InfoEmpresa[id][EmpresaCriada]){
		new str[255];
		if(!InfoEmpresa[id][EmpresaComprada]){
			format(str, sizeof str, TEXTO_EMPRESAAVENDA,id, InfoEmpresa[id][EmpresaNome], InfoEmpresa[id][EmpresaValor], InfoEmpresa[id][Ganhos]);
			if(!IsValidDynamic3DTextLabel(InfoEmpresa[id][EmpresaTexto])) InfoEmpresa[id][EmpresaTexto]= CreateDynamic3DTextLabel(str, -1, InfoEmpresa[id][EmpresaPos][0], InfoEmpresa[id][EmpresaPos][1], InfoEmpresa[id][EmpresaPos][2], 15.0);
			else UpdateDynamic3DTextLabelText(InfoEmpresa[id][EmpresaTexto], -1, str);
		}
		else{
			//TEXTO_EMPRESACOMPRADA "(%d)%s\n{33aa33}Valor Bruto Pago: %d\nPorcentagem De Ganhos: %d\nDono: %s"
			format(str, sizeof str, TEXTO_EMPRESACOMPRADA,id, InfoEmpresa[id][EmpresaNome], InfoEmpresa[id][EmpresaValor], InfoEmpresa[id][Ganhos],InfoEmpresa[id][EmpresaDono]);
			if(!IsValidDynamic3DTextLabel(InfoEmpresa[id][EmpresaTexto])) InfoEmpresa[id][EmpresaTexto] = CreateDynamic3DTextLabel(str, -1, InfoEmpresa[id][EmpresaPos][0], InfoEmpresa[id][EmpresaPos][1], InfoEmpresa[id][EmpresaPos][2], 15.0);			
			else UpdateDynamic3DTextLabelText(InfoEmpresa[id][EmpresaTexto], -1, str);
		}
		Iter_Add(Empresas, id);
		if(!IsValidDynamicPickup(InfoEmpresa[id][EmpresaPickup])) InfoEmpresa[id][EmpresaPickup] = CreateDynamicPickup(1274, 1, InfoEmpresa[id][EmpresaPos][0], InfoEmpresa[id][EmpresaPos][1], InfoEmpresa[id][EmpresaPos][2]);
	}
	return 1;
}
stock SalvarEmpresa(i){
	new str[299];
	new empc=InfoEmpresa[i][EmpresaComprada] ? ( 1 ) : (0);
	mysql_format(Dados, str, sizeof str, "UPDATE `Empresas` SET \
		`EmpresaValor` = '%d', `EmpresaNome` = '%s', `EmpresaComprada` = '%d', `EmpresaDono` = '%s', \
		`EmpresaPorcentagem` = '%d', `EmpresaX` = '%f', `EmpresaY` = '%f', `EmpresaZ` = '%f' WHERE `Empresaid` = '%d'",
		InfoEmpresa[i][EmpresaValor], InfoEmpresa[i][EmpresaNome], empc,InfoEmpresa[i][EmpresaDono],
		InfoEmpresa[i][Ganhos], InfoEmpresa[i][EmpresaPos][0], InfoEmpresa[i][EmpresaPos][1], InfoEmpresa[i][EmpresaPos][2], i);

	mysql_tquery(Dados, str);
	return 1;
}
stock SalvarEmpresas(){
	static Query[310];
	foreach(new i: Empresas){
		new empcomprada; 
		if(InfoEmpresa[i][EmpresaComprada]) 
			empcomprada = 1;
		else
			empcomprada = 0;
		mysql_format(Dados, Query, sizeof Query, "UPDATE `Empresas` SET `EmpresaValor` = '%d', `EmpresaNome` = '%s', `EmpresaComprada` = '%d', `EmpresaDono` = '%s', `EmpresaPorcentagem` = '%d', `EmpresaX` = '%f', `EmpresaY` = '%f', `EmpresaZ` = '%f' WHERE `Empresaid` = '%d'",InfoEmpresa[i][EmpresaValor], InfoEmpresa[i][EmpresaNome], empcomprada,InfoEmpresa[i][EmpresaDono],InfoEmpresa[i][Ganhos], InfoEmpresa[i][EmpresaPos][0], InfoEmpresa[i][EmpresaPos][1], InfoEmpresa[i][EmpresaPos][2], i);
		mysql_tquery(Dados, Query);
	}
	return 1;
}
stock ResetarEmpresa(empresa){
	InfoEmpresa[empresa][EmpresaComprada] = false;
	InfoEmpresa[empresa][EmpresaLucro] = 0;
	format(InfoEmpresa[empresa][EmpresaDono], 24, "Ninguem");	
	SalvarEmpresa(empresa);
	AtualizarTextEmpresa(empresa);
	return 1;
}
cmd:deletarempresa(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 9) return 1;
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/deletarempresa [id da empresa ]");
	new id = strval(params), i = strval(params);
	if(!Number(params)) return SendClientMessage(playerid, LIGHTBLUE, "Apenas numeros!");
	if(!InfoEmpresa[id][EmpresaCriada]) return SendClientMessage(playerid, LIGHTBLUE, "A Empresa nao foi criada!");
	InfoEmpresa[id][EmpresaCriada] = false;
	InfoEmpresa[id][EmpresaComprada] = false;
	InfoEmpresa[id][EmpresaLucro] = 0;
	InfoEmpresa[id][EmpresaValor] = 0;
	InfoEmpresa[id][Ganhos] = 0;
	format(InfoEmpresa[id][EmpresaDono], 24, "Ninguem");
	format(InfoEmpresa[id][EmpresaNome], 32, "");
	DestroyDynamic3DTextLabel(InfoEmpresa[i][EmpresaTexto]);
	DestroyDynamicPickup(InfoEmpresa[i][EmpresaPickup]);
	Iter_Remove(Empresas, i);
	new str[144];
	mysql_format(Dados, str, sizeof str, "DELETE FROM Empresas WHERE Empresaid = '%d'",
		i);
	mysql_tquery(Dados, str);
	SendClientMessage(playerid, VerdeSamp, "Empresa deletada com sucesso!");
	return 1;
}
stock CriarEmpresa(const Empresanome[], EmpresaValorr, Float:x, Float:y, Float:z, PorcentagemDaCompra){
	for(new i = 1; i < MAX_EMPRESAS; i++){
		if(!InfoEmpresa[i][EmpresaCriada]){
			InfoEmpresa[i][EmpresaCriada] = true;
			InfoEmpresa[i][EmpresaComprada] = false;
			InfoEmpresa[i][EmpresaLucro] = 0;
			InfoEmpresa[i][EmpresaValor] = EmpresaValorr;
			InfoEmpresa[i][Ganhos] = PorcentagemDaCompra;
			format(InfoEmpresa[i][EmpresaDono], 24, "Ninguem");
			format(InfoEmpresa[i][EmpresaNome], 32, Empresanome);
			new str[255];
			format(str, sizeof str, TEXTO_EMPRESAAVENDA,i, InfoEmpresa[i][EmpresaNome], InfoEmpresa[i][EmpresaValor], InfoEmpresa[i][Ganhos]);
			InfoEmpresa[i][EmpresaTexto] = CreateDynamic3DTextLabel(str, -1, x, y, z, 15.0);
			InfoEmpresa[i][EmpresaPickup] = CreateDynamicPickup(1274, 1, x, y, z);
			InfoEmpresa[i][EmpresaPos][0] = x;
			InfoEmpresa[i][EmpresaPos][1] = y;
			InfoEmpresa[i][EmpresaPos][2] = z;
			mysql_format(Dados, str, sizeof str, "INSERT INTO `Empresas` (`Empresaid`, `EmpresaValor`, `EmpresaNome`, `EmpresaPorcentagem`, `EmpresaX`, `EmpresaY`, `EmpresaZ`) VALUES ('%d', '%d', '%s', '%d', '%f', '%f', '%f')",
				i, InfoEmpresa[i][EmpresaValor],
				InfoEmpresa[i][EmpresaNome], InfoEmpresa[i][Ganhos], x,y,z);
			mysql_tquery(Dados, str);
			Iter_Add(Empresas, i);
			return i;
		}
	}
	return -1;
}
AumentoEmpresas(){
	new conta=0;
	foreach(new i: Empresas){
		if(InfoEmpresa[i][EmpresaComprada]){
			InfoEmpresa[i][EmpresaLucro] += InfoEmpresa[i][Ganhos];
			conta += InfoEmpresa[i][Ganhos];
		}
	}
	if(conta > 0)SendClientMessageToAll(LIGHTBLUE, "* Juntas, As empresas do servidor receberam um total de %dR$!", conta);
}
stock LogarJogador(playerid){
	race_check[playerid] ++;
	checkInAcessoriosDB(nome(playerid));
	CarregarConta(playerid, race_check[playerid]);
	LoadVehicle(playerid);
	CarregarHabilitacoes(playerid);
	PlayerInfo[playerid][Logado] = true;
    SetPlayerColor(playerid, -1);
    carregarAtendimento(playerid);
    JaRegistrado[playerid] = true;
    EsconderLogin(playerid);
    return 1;
}
MostrarConceTipo(playerid, tipo){
	veiculoslot[playerid] = tipo;

	SelectTextDraw(playerid, 0x33ccffff);
	new str[30];
	format(str, sizeof str, "%s", carrosCompra[tipo][carName]);
	PlayerTextDrawSetString(playerid, ConceMenu[playerid][4], str);

	format(str, sizeof str, "%s", TipoEconomia(carrosCompra[tipo][carroModel]));
	PlayerTextDrawSetString(playerid, ConceMenu[playerid][5], str);

	format(str, sizeof str, "~g~R$%d", carrosCompra[tipo][carroPrice]);
	PlayerTextDrawSetString(playerid, ConceMenu[playerid][6], str);

	format(str, sizeof str, "~y~ipva_R$%d", floatround(ModelFromIpva(carrosCompra[tipo][carroModel])));
	PlayerTextDrawSetString(playerid, ConceMenu[playerid][11], str);
	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][3], carrosCompra[tipo][carroModel]);
	for(new i; i < 20; i ++){
		PlayerTextDrawShow(playerid, ConceMenu[playerid][i]);
	}
	return 1;
}
MostrarConce(playerid){
	SelectTextDraw(playerid, 0x33ccffff);
	new str[30];
	format(str, sizeof str, "%s", carrosCompra[veiculoslot[playerid]][carName]);
	PlayerTextDrawSetString(playerid, ConceMenu[playerid][4], str);

	PlayerTextDrawSetPreviewModel(playerid, ConceMenu[playerid][3], carrosCompra[veiculoslot[playerid]][carroModel]);

	format(str, sizeof str, "%s", TipoEconomia(carrosCompra[veiculoslot[playerid]][carroModel]));
	PlayerTextDrawSetString(playerid, ConceMenu[playerid][5], str);

	format(str, sizeof str, "~g~R$%d", carrosCompra[veiculoslot[playerid]][carroPrice]);
	PlayerTextDrawSetString(playerid, ConceMenu[playerid][6], str);

	format(str, sizeof str, "~y~ipva_%d", floatround(ModelFromIpva(carrosCompra[veiculoslot[playerid]][carroModel])));
	PlayerTextDrawSetString(playerid, ConceMenu[playerid][11], str);
	for(new i; i < 20; i ++){
		PlayerTextDrawShow(playerid, ConceMenu[playerid][i]);
	}
	return 1;
}
FecharConce(playerid){
	for(new i; i < 20; i ++){
		PlayerTextDrawHide(playerid, ConceMenu[playerid][i]);
	}
	CancelSelectTextDraw(playerid);
	return 1;
}
TipoEconomia(modelo){
	new texto[18] = "~g~economico";
	switch(modelo){
		case 434, 556, 557, 406, 432, 522: texto = "~r~nao_economico";
		case 560, 451, 502, 503, 506, 541, 402, 411: texto = "~r~nao_economico";
		case 490, 528, 596, 597, 598, 599, 601, 407, 416, 420, 427, 433, 431, 437, 438: texto = "~g~economico";
		case 448, 461, 462, 463, 468, 471, 521, 581, 586: texto = "~g~economico";
	}
	return texto;
}
MostrarTelacarregamento(playerid){
	for(new i; i < 3; i++){
		PlayerTextDrawShow(playerid, TelaCarregar[playerid][i]);
	}
	TimerPlayer[playerid][3] = SetTimerEx("interpolar", 2500, false, "i", playerid);
}
stock Interval1(playerid, slotletra){
	new str[20] = "carregando...";
	strins(str, "~w~", slotletra+1);
	PlayerTextDrawSetString(playerid, TelaCarregar[playerid][3], str);
	PlayerTextDrawShow(playerid, TelaCarregar[playerid][3]);
	//f("%d", slotletra);
	if(slotletra == 10){
		for(new i; i < 8; i ++){
			PlayerTextDrawHide(playerid, TelaCarregar[playerid][i]);
		}
		SendClientMessage(playerid, LIGHTBLUE, "Carregamento completo.");
		TimerPlayer[playerid][3] = SetTimerEx("OnPlayerLogin", 5000, false, "i", playerid);
	}
	else{
		TimerPlayer[playerid][1] = SetTimerEx("Interval1", 1000, false, "ii", playerid, slotletra+1);
	}
	
	return 1;
}
MostrarAmmunation(playerid){
	new str[52];
	format(str, sizeof str, "%s",
		ArmaAmmunation[varAmmunation[playerid]][ArmaNome]);

	PlayerTextDrawSetString(playerid, AmmunationText[playerid][6], str);

	format(str, sizeof str, "%dR$",
		ArmaAmmunation[varAmmunation[playerid]][Valor]);

	PlayerTextDrawSetString(playerid, AmmunationText[playerid][7], str);

	PlayerTextDrawSetPreviewModel(playerid, AmmunationText[playerid][5], ArmaAmmunation[varAmmunation[playerid]][Model]);
	for(new i; i < 20; i++){
		PlayerTextDrawShow(playerid, AmmunationText[playerid][i]);
	}
	SelectTextDraw(playerid, 0x33ccffff);
	return 1;
}
stock ComprarItem(playerid, item, valor){
	ShowPlayerDialog(playerid, DIALOG_QUANTIACOMPRAR, 
		DIALOG_STYLE_INPUT, "", 
		fString("Digite a quantidade de %s que deseja comprar.\nValor: %dR$", InventarioName(item), valor),
		 "Ok", "Sair");
	CallLocalFunction("ComprarQuantiaItem", "iii", playerid, item, valor);
	// sistema n?o terminado ...
	return 1;
}
function ComprarQuantiaItem(playerid, &item, &valor){

	return 1;
}

function RegistrarJogador(playerid, const pass[]){
	InEdit[playerid] = true;
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce concluiu seu registro.");
	format(PlayerInfo[playerid][Nick], MAX_PLAYER_NAME, "%s", nome(playerid));
	format(PlayerInfo[playerid][Senha], MAX_PLAYER_SENHA, "%s", pass);
	
	new query[128];
	format(query, sizeof(query), "INSERT INTO `Contas` (`Admin`, `Nome`, `Senha`) VALUES ('0', '%s', '%s')",  nome(playerid), PlayerInfo[playerid][Senha]);
	mysql_query(Dados, query, false);


	// Obtém o userid recém-inserido
	new Cache:R;
	mysql_format(Dados, query, sizeof(query), "SELECT `userid` FROM `Contas` WHERE `Nome` = '%s'", nome(playerid));
	R = mysql_query(Dados, query);

	if (cache_is_valid(R)){
	    cache_get_value_name_int(0, "userid", PlayerInfo[playerid][IDFixo]);
	    cache_delete(R);
	}
	    
	checkInAcessoriosDB(nome(playerid));
	StartPlayerSkin(playerid);
    PlayerInfo[playerid][Logado] = true;

	SetPlayerColor(playerid, -1);
	//ShowPlayerDialog(playerid, DIALOG_GENERO, DIALOG_STYLE_LIST, "{33ccff}Escolha Seu Genero!", "{33ccff}Masculino\n{fff000}Feminino", "Ok", "Sair");
	PlayerInfo[playerid][HorasJogando] = gettime();
	EsconderLogin(playerid);
	SetPlayerHealth(playerid, 100);
	interpolarSkin(playerid);
	//SalvarConta(playerid);
	return 1;
}
function StartPlayerSkin(playerid){
	InEdit[playerid] = true;
	ActorPlayer[playerid] = CreateActor(40, 1164.6545,-1695.2615,23.1033,321.4510);
	SetActorVirtualWorld(ActorPlayer[playerid], playerid);
	SetPlayerVirtualWorld(playerid, playerid);
	UpdateStreamer(playerid);
	for(new i; i <3; i++){
		PlayerTextDrawShow(playerid, skinSelect[playerid][i]);
	}
	SelectTextDraw(playerid, 0x33ccff);
	SkinSelected[playerid] = 0;
	return 1;
}
stock UpdateStreamer(playerid){
	new Float:X, Float: Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	Streamer_UpdateEx(playerid, X,Y,Z);
	return 1;
	//, worldid = -1, interiorid = -1, type = -1, compensatedtime = -1, freezeplayer = 1)
}
MostrarDialogCaixa(playerid, tipocaixa = 1){

	if(!PossuiContaBanco(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "Voce precisa fazer uma conta no Banco antes!");
	if(tipocaixa == 1)
		ShowPlayerDialog(playerid, DIALOG_CAIXA, DIALOG_STYLE_LIST, fString("Conta numero %04d", BancoInfo[playerid][userbanco]), "{33ccff}Saque\n{33ccff}Deposito\n{33ccff}Extrato Bancario\n{33ccff}Sacar Salario\n{ff0000}Roubar", "Ok", "Sair");
	else
		ShowPlayerDialog(playerid, DIALOG_CAIXABANCO, DIALOG_STYLE_LIST, fString("Conta numero %04d", BancoInfo[playerid][userbanco]), "{33ccff}Deposito\n{33ccff}Saque\n{33ccff}Transferencia\n{33ccff}Sacar Salario\n{33ccff}Extrato Bancario\n{33ccff}Buscar Conta", "Ok", "Sair");
	return 1;
}
TerroristasOnline(){
	foreach(new i: Player){
		if(PlayerInfo[i][Org] == 18)
			return true;
	}
	return false;
}
stock strreplace(string[], find, replace)
{
    for(new i=0; string[i]; i++)
    {
        if(string[i] == find)
        {
            string[i] = replace;
        }
    }
} 
MostrarTextdrawHud(playerid){
	new string[40];
	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x, y, z);
	format(string, sizeof string, "%s", CoordZone(x, y, z));
	strreplace(string, ' ', '_');
	PlayerTextDrawSetString(playerid,Hud[playerid][0], string);

	for(new i; i < 8; i++){
		PlayerTextDrawShow(playerid, Hud[playerid][i]);
	}
	//Hud[playerid][2]
	return 1;
}
ShowDialogEquipar(playerid){
	if(IsPolice(PlayerInfo[playerid][Org])){
		ShowPlayerDialog(playerid,DIALOG_EQUIPAMENTOCORP, DIALOG_STYLE_LIST, "{fff000}Escolhendo Equipamento", "M4\nDesert\n9mm\nEscopeta\nCacetete\nParaquedas\nRPG\nSniper", "Ok", "Retorno");
	}
	else
		ShowPlayerDialog(playerid,DIALOG_EQUIPAMENTOORG, DIALOG_STYLE_LIST, "{fff000}Escolhendo Equipamento", "Ak\nDesert\n9mm\nEscopeta\nBastao\nRPG\nSniper", "Ok", "Retorno");
	
	return 1;
}
function FinalizarEnquete(){
	EnqueteCriada = false;
	new str[144];
	foreach(new i: Player){
		Votou[i] = false;
		SendClientMessage(i, Rosa, "RESULTADO DA VOTACAO:");
		SendClientMessage(Rosa, -1, "");
		format(str, 144, "Votos sim: %d", VotosSim);
		SendClientMessage(i, Rosa, str);
		format(str, 144, "Votos nao: %d", VotosNao);
		SendClientMessage(i, Rosa, str);
	}
	VotosNao = 0;
	VotosSim = 0;
}
stock ChecarApk(playerid){
	if(GetPVarInt(playerid, "NotAndroid")){
		new Cache: R, Query[400];
		mysql_format(Dados, Query, sizeof Query, "SELECT `Serial` FROM `ApkLiberado` WHERE `Serial` = '%s'", GetPlayerSerial(playerid));
		R = mysql_query(Dados, Query);
		new rows = cache_num_rows();
		if(!cache_is_valid(R) && !rows){
			GameTextForPlayer(playerid, "~R~TROQUE SEU APK!", 2000, 3);
			SendClientMessage(playerid, LIGHTBLUE, "Voce esta com um APK Desconhecido.");
			SetTimerEx("kickar", 1000, false, "i", playerid);
		}
		if(cache_is_valid(R))cache_delete(R);
	}
	return 1;
}
pegarID(&id){
	new uva = -1;
	foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	return uva;
}
IsPlayerInTerritorio(playerid){
	foreach(new i: Gangzoness)
		if(IsPlayerInGangZone(playerid, GzInfo[i][OGZ]))
			if(GzInfo[i][DonoGz] != 0)
				return GzInfo[i][DonoGz];
	return 0;
}
/*function AlterarSenha(id){
	new dest[BCRYPT_HASH_LENGTH];
	bcrypt_get_hash(dest);

	new Query[255];
	mysql_format(Dados, Query, sizeof Query, "UPDATE `Contas` SET `Senha` = '%s' WHERE `userid` = '%d'", id);
	mysql_tquery(Dados, Query);
	AdminMessage(ColorStaff(11), fString("Usuario %d teve a senha trocada por um Admin.", id));
}*/
function furtandogas(playerid, const nick[], gas, veh){
	if(!strcmp( nome(playerid), nick) || VeiculoInfo[veh][Gasolina] != 0){
		DiminuirItem(playerid, GALAO_VAZIO, 1);
		VeiculoInfo[veh][Gasolina] = 0;
		AdicionarItemN(playerid, GALAO_CHEIO, gas);
		SendClientMessage(playerid, LIGHTBLUE, fString("* Voce furtou %dL de gasolina.", gas));
		PC_EmulateCommand(playerid, "/anim");
		TogglePlayerControllableEx(playerid, true);
	}
	else{
		TogglePlayerControllableEx(playerid, true);
		PC_EmulateCommand(playerid, "/anim");
	}
	return 1;
}
NomeAcessorios(id){
	new name[30], bool: achou;
	for(new i; i <sizeof Acessorios; i++){
		if(id == Acessorios[i][AcessorioId]){
			achou = true;
			format(name, sizeof name, Acessorios[i][AcessorioNome]);
			break;
		}
	}
	return  (achou ? (name) : ("Desconhecido"));
}
NomeBone(boneid){
	new str[32] = "D.Bone";
	if( 0 <= boneid <= sizeof AttachmentBones){
		format(str, sizeof str, AttachmentBones[boneid]);
	}
	return str;
}
function enchendo(playerid, const nickname[]){
	if(!strcmp(nome(playerid), nickname)){
		if(!TemItem(playerid, GALAO_VAZIO)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui galoes vazios.");
		DiminuirItem(playerid, GALAO_VAZIO, 1);
		AdicionarItem(playerid, GALAO_CHEIO, 100);
		EnchendoGalao[playerid] = false;
		SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de colocar Gasolina em um galao.");
		TogglePlayerControllableEx(playerid, true);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		NaMao[playerid] = 0;
	}
	else{
		EnchendoGalao[playerid] = false;
		TogglePlayerControllableEx(playerid, true);
	}
	return 1;
}

cmd:vendermaconha(playerid, params[]){
	new id, quantia;
	if(sscanf(params, "ii", id, quantia)) return SendClientMessage(playerid, LIGHTBLUE, "INFO: /vendermaconha [id] [quantia]");
	pegarID(id);
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, LIGHTBLUE, "INFO: Este jogador nao esta conectado.");
	if(id == playerid) return SendClientMessage(playerid, LIGHTBLUE, "INFO: Voce nao pode vender maconha para voce mesmo.");
	if(quantia <= 0 || quantia > PegarQuantiaItem(playerid, MACONHA)) return SendClientMessage(playerid, LIGHTBLUE, "INFO: Voce nao tem tudo isso de maconha!");
	if(MochilaCheia(id)) return SendClientMessage(playerid, LIGHTBLUE, "INFO: A Mochila do jogador esta cheia.");
	if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "INFO: O jogador nao possui mochila.");
	if(DistanciaPlayers(playerid, id) > 2.0) return SendClientMessage(playerid, LIGHTBLUE, "INFO: Voce esta muito longe deste jogador. Aproxime-se!");
	DiminuirItem(playerid, MACONHA, quantia);
	AdicionarItem(id, MACONHA, quantia);
	ApplyAnimation(playerid,"DEALER","Dealer_Deal",4.1,0,0,0,0,0,SYNC_ALL);
	ApplyAnimation(id,"DEALER","Dealer_Deal",4.1,0,0,0,0,0,SYNC_ALL);
	MensagemLocal(15.0, playerid, Roxoeu,fString("* (%d)%s esta vendendo drogas para alguem...",PlayerInfo[playerid][IDFixo], nome(playerid)),true);
	SendClientMessage(id, LIGHTBLUE, "INFO: Voce acaba de comprar %d gramas de Maconha!", quantia);
	if(IsPlayerInTerritorio(playerid)){
		new org = IsPlayerInTerritorio(playerid);
		if(org != 0 && PlayerInfo[id][Org] != org){
			new Float: conta = (0.5 * float(quantia) );
			OrgInfo[ org ][OrgCofre] += floatround(conta);
			MessageOrg(org, VerdeSamp, fString("%s esta vendendo drogas em um de nossos territorios. A Org ganhou %fR$!", nome(playerid), floatround(conta)));
		}
	}
	return 1;
}
CheckArmaPeito(playerid){
	new weapon = GetPlayerWeapon(playerid), peito[2], obj;
	
	GetPlayerAttachedObject(playerid, 7, obj);
	GetPlayerWeaponData(playerid, 5, peito[0], peito[1]);
	if(peito[0] == weapon){
		
		if(IsPlayerAttachedObjectSlotUsed(playerid, 7) && obj == 355 || obj == 356){
			
			RemovePlayerAttachedObject(playerid, 7);
		}
	}
	else{
		if(peito[0] == 30 && peito[1] != 0 && !IsPlayerAttachedObjectSlotUsed(playerid, 7)){
			SetPlayerAttachedObject(playerid,7,355,1,0.166999,0.168999,-0.148000,174.200057,131.900146,2.000002,1.000000,1.000000,1.000000);
		
		}
		if(peito[0] == 31 && peito[1] != 0 && !IsPlayerAttachedObjectSlotUsed(playerid, 7)){
			SetPlayerAttachedObject(playerid,7,356,1,0.166999,0.168999,-0.148000,174.200057,131.900146,2.000002,1.000000,1.000000,1.000000);
			
		}
	}
}
function pegandomunicaoDEP(playerid, pickmunD){
	if(!IsPlayerInRangeOfPoint(playerid, 2.0, PosPickMunDep[pickmunD][0], PosPickMunDep[pickmunD][1], PosPickMunDep[pickmunD][2])){
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce saiu de perto da Caixa e nao pegou a municao.");
		ClearAnimations(playerid);
	}
	else{
		if(NaMao[playerid] == CAIXA){
			ClearAnimations(playerid);
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta com uma Caixa em Maos.");
		}
		else{
			ClearAnimations(playerid);
			SetPlayerAttachedObject(playerid,9,2040,1,0.000000,0.387999,-0.059000,84.800018,87.799995,0.599998,1.000000,1.000000,1.000000);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pegou uma caixa! Coloque-a no veiculo usando /colocarmun.");
			NaMao[playerid] = CAIXA;
			InfoPickAmmo[pickmunD][PickMunicao] --;
			UpdateDynamic3DTextLabelText(InfoPickAmmo[pickmunD][TextoPickMun], LIGHTBLUE, fString("Aperte 'Y' Para pegar municao.\n%d/10", InfoPickAmmo[pickmunD][PickMunicao]));
			SetPlayerAttachedObject(playerid,9,2040,1,0.000000,0.387999,-0.059000,84.800018,87.799995,0.599998,1.000000,1.000000,1.000000);
			return 1;
		}
	}
	return 1;
}
cmd:colocarmun(playerid){
	foreach(new i: Vehicles){
		new Float: X, Float: Y, Float: Z, Float: Ang;
		GetVehiclePos(i, X, Y, Z);
		if(!IsPlayerInRangeOfPoint(playerid, 3.9, X, Y, Z)) continue;
		GetVehicleZAngle(i, Ang);
		X = X + -3.0 * floatsin(-Ang, degrees);
	   	Y = Y + -3.0 * floatcos(-Ang, degrees);
	   	if(IsPlayerInRangeOfPoint(playerid, 3.9, X-1.0285, Y+1.0768, Z)){
			if(NaMao[playerid] != CAIXA) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao esta com uma caixa de municao nas maos.");
			if(CaminhaoCarregado[i] == 50) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este veiculo atingiu o maximo de municao transportavel possivel. 110/110.");
			NaMao[playerid] = 0;
			CaminhaoCarregado[i] += 1;
			ApplyAnimationEx(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
			MensagemLocal(25.0, playerid, Roxoeu, fString("* %s colocou uma caixa de municao no veiculo %s. Total: %d/110",nome(playerid), GetVehicleName(GetVehicleModel(i)), CaminhaoCarregado[i]));
			ChecarAnexagem(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
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
	GetPlayerAttachedObject(playerid, 6, obj);

	if(obj == 1550){
		CarregandoCF[playerid] = 0;
		RemovePlayerAttachedObject(playerid, 6);
	}
	return 1;
}
ContarCaixas(){
	new quantia = 0;
	for(new i; i < 11; i++){
		quantia += InfoPickAmmo[i][PickMunicao];
	}
	return quantia;	
}
forward mensagens();
public mensagens(){
	new r = random(sizeof MensagensAleatorias);
	SendClientMessageToAll(ColoursTable[random(sizeof ColoursTable)], MensagensAleatorias[r]);
}
forward recomporCaixas();
public recomporCaixas(){
	new bool: algum = false;
	KillTimer(timerRCx);
	if(ContarCaixas() < 110){
		for(new i; i < 11; i++){
			InfoPickAmmo[i][PickMunicao] = 10;
		}
		algum = true;
	}
	if(algum)
		SendClientMessageToAll(LIGHTBLUE, "* As caixas de municao do deposito foram enchidas novamente.");
	
	return 1;
}
forward cortarmad(playerid);
public cortarmad(playerid){
	ClearAnimations(playerid);
	Madeiras[playerid] ++;
	new str[128];
	format(str, sizeof(str), "%s\n\n{33ccff}Voce conseguiu cortar mais uma madeira, Total {ff0000}%d/10.",nome(playerid), Madeiras[playerid]);
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Aviso", str, "Ok", "");
	JaCortando[playerid] = false;
	ClearAnimations(playerid);
	new i = random(sizeof MadeirasPosicao);
	SetPlayerCheckpoint(playerid, MadeirasPosicao[i][0], MadeirasPosicao[i][1], MadeirasPosicao[i][2], 3.2);
	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);
	if(Madeiras[playerid] >= 10){
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce pegou todas as madeiras, Agora va entregar elas.");
		SetPlayerCheckpoint(playerid, -418.3577,-1763.3823,5.4784, 2.5);
	}
	return 1;
}
forward aparecerdl(playerid);
public aparecerdl(playerid){
	new str[144];
	format(str, sizeof str, "|INFO| Voce selecionou o veiculo %s.", GetVehicleName(VehInfo[playerid][GetPVarInt(playerid, "carid")][IDCarro]));
	SendClientMessage(playerid, Amarelo, str);
	ShowPlayerDialog(playerid, DIALOG_FUNCOES, DIALOG_STYLE_LIST, "{fff000}O Que deseja fazer?", "Estacionar\nLocalizar\nVender\nVender Para Jogador\nTrancar/Destrancar\nAbrir/Fechar Capo\nPorta Malas", "Ok", "Sair");
}
forward ligacao(playerid, ligador);
public ligacao(playerid, ligador){
	if(Tentativas[playerid] > 10){
		new str[144];
		format(str, sizeof str, "[Ligacao] %s nao atendeu a ligacao e ela caiu...", nome(ligador));
		SendClientMessage(playerid, Amarelo, str);

		format(str, sizeof str, "[Ligacao] Voce nao atendeu %s e a ligacao caiu...", nome(playerid));
		SendClientMessage(ligador, Amarelo, str);
		Discando[ligador] = -1;
		QueLigou[ligador] = false;
		Discando[playerid] = -1;
		KillTimer(TimerChamarLigacao[playerid]);
		Tentativas[playerid] = 0;
	}
	else{
	    Tentativas[playerid] ++;
	    new str[144];
	    format(str, sizeof str, "[Ligacao] Voce esta ligando para %s(+55 %d) [%d].", nome(ligador), ligador, Tentativas[playerid]);
		SendClientMessage(playerid, Amarelo, str);
		format(str, sizeof str, "[Ligacao] %s esta ligando para voce ! Digite /atender para atender ou /desligar para recusar a ligacao. [%d]", nome(playerid), Tentativas[playerid]);
 		SendClientMessage(ligador, Amarelo, str);
	}
}
forward IsPlayerOnline(const name[]);
public IsPlayerOnline(const name[])
{
    foreach(new i: Player){
        if(IsPlayerConnected(i) && strcmp(name,nome(i),true)==0){
        	return true;
        }
    }
    return false;
}
function GetPlayer_id(const nick[], &variable){
	foreach(new i: Player){
		if( ! strcmp(nick, nome(i))){
			variable = i;
			return true;
		}
	}
	return false;
}
forward fecharop(i);
public fecharop(i){
	MoveDynamicObject(InfoPortao[i][OPortao], InfoPortao[i][Px], InfoPortao[i][Py], InfoPortao[i][Pz], 7.0);
}
forward destruirporta(obj);
public destruirporta(obj){
	new Float:Pos[3];
	GetDynamicObjectPos(obj, Pos[0], Pos[1], Pos[2]);
	SetTimerEx("recporta", minutos(15), false, "i", obj);
	MoveDynamicObject(obj, Pos[0], Pos[1]-1.4, Pos[2], 3.0);
	CreateExplosion(Pos[0], Pos[1], Pos[2]-80, 6, 1.0);
 	for(new i; i<22; i++){
 		//X-1.0293-RdonPickups[random(sizeof(RdonPickups))][0], Y+1.0768+RdonPickups[random(sizeof(RdonPickups))][0]
	    CriarItemDrop(AreaRoubar[aX]-1.0293-RdonPickups[random(sizeof(RdonPickups))][0], AreaRoubar[aY]+1.0768+RdonPickups[random(sizeof(RdonPickups))][0], AreaRoubar[aZ], DINHEIRO_FLUTUANTE_BANDIDO, random(900));
	}
	SendClientMessageToAll(LIGHTBLUE, "Mais um roubo realizado com sucesso.");
	return 1;
}

forward CheckVip(playerid);
public CheckVip(playerid){
	if(PlayerInfo[playerid][Vip] >= 1){
	    if(PlayerInfo[playerid][TempoVip] - gettime() > 0){
	    	new str[96];
	    	format(str, sizeof str, "AVISO: voce ainda possui %s de tempo vip. Aproveite!", Convert(PlayerInfo[playerid][TempoVip] - gettime()));
	    	SendClientMessage(playerid, Amarelo, str);
		}
		else{
			PlayerInfo[playerid][Vip] = 0;
	    	PlayerInfo[playerid][TempoVip] = 0;
			new str[144];
			format(str, sizeof(str), "{fff000}%s\n\n{33ccff}O Seu vip acaba de expirar!\n Para continuar usando compre outro.", nome(playerid));
			ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{ff0000}Aviso Urgente", str, "Ok", "");
		}
	}
	return 1;
}
forward recporta(porta);
public recporta(porta){
	new Float:x, Float: y, Float: z;
	GetDynamicObjectPos(porta, x, y, z);
	Roubando = false;
	MoveDynamicObject(porta, x, y+1.4, z, 3.0);
}
forward VelocidadeAutoEscola(i);
public VelocidadeAutoEscola(i){
	if(EmTeste[i] && GetVehicleModel(GetPlayerVehicleID(i)) != 593){
        if(GetVehicleSpeed2(GetPlayerVehicleID(i)) > 65){  
	        AvisoAuto[i]++;
	        SendClientMessage(i, LIGHTBLUE, "* Va mais devagar! Seu veiculo esta muito rapido.");
	        if(AvisoAuto[i] >= 3){
	            FalharTeste(i);
	            SendClientMessage(i, LIGHTBLUE, "|INFO| Voce falhou no teste, teve muitos avisos.");
	            AvisoAuto[i] = 0;
			}
		}
	}
}
forward QuitarTeste(playerid);
public QuitarTeste(playerid){
	FalharTeste(playerid);
}
forward descongelarorg(playerid);
public descongelarorg(playerid){
 	TogglePlayerControllableEx(playerid, true);
	return 1;
}
forward mudarclima();
public mudarclima(){
	new hora, minuto, segundo;
	gettime(hora, minuto, segundo);
	SetWorldTime(hora+2);
	return 1;
}
forward tempoeclima();
public tempoeclima()
{
    new RandRain = random(22);
    new time, minuto, hora, segundo;// dia, mes, ano;
    gettime(hora, minuto, segundo);

    switch(hora)
    {
        case 17: time = 20;
        case 18: time = 21;
        case 19: time = 23;
        case 20,21,22,23: time = 0; 
        default: time = hora; 
    }
    switch(RandRain)
    {
        case 20:SetWeather(10);
        case 21:SetWeather(18);
        case 22:SetWeather(21);
        default:SetWeather(15);
    }
    SetWorldTime(time);
    return 1;
}
forward CheckPrisonStaff();
public CheckPrisonStaff(){
	foreach(new i: Player){
	    if(PlayerInfo[i][CadeiaStaff] > 0 && GetPlayerState(i) != PLAYER_STATE:6){
	        if(PlayerInfo[i][CadeiaStaff] < 3){
	            PlayerInfo[i][CadeiaStaff] = 0;
	            SpawnPlayer(i);
	            SetPlayerVirtualWorld(i, 0);
	            SetPlayerHealth(i, 100);
	            format(PlayerInfo[i][MotivoCadeia], 32, ".");
			}
			else{
			    PlayerInfo[i][CadeiaStaff] --;
			    SetPlayerVirtualWorld(i, 1);
			    SetPlayerHealth(i, 999);
			    if(!ISP(i, 87.0,228.8630,-2024.9109,149.0989)){
			        SetPlayerVirtualWorld(i, 1);
			        SetPlayerPosEx(i, 228.8630,-2024.9109,149.0989);
			        TogglePlayerControllableEx(i, false);
			        AvisosSair[i] += 1;
			        SetTimerEx("descongelar", 3000, false, "i", i);
			        if(AvisosSair[i] >= 5) return Kick(i);
				}
			}
		}
	}
	return 1;
}
forward CheckPrisonMilitar();
public CheckPrisonMilitar(){
	foreach(new i: Player){
	    if(PlayerInfo[i][Prisao] > 0 && GetPlayerState(i) != PLAYER_STATE:6){
	        if(PlayerInfo[i][Prisao] < 3){
	            PlayerInfo[i][Prisao] = 0;
	            SendClientMessage(i, LIGHTBLUE, "|INFO| Voce cumpriu a sua divida, esta solto.");
	            SetPlayerPos(i, 876.2717,2259.7966,10.9103);
	            SetPlayerVirtualWorld(i, 0);
	            SetPlayerHealth(i, 100);
			}
			else{
			    PlayerInfo[i][Prisao] --;
			    SetPlayerHealth(i, 999);
			    if(!ISP(i, 20.0, infoPrisoes[ PlayerInfo[i][TipoPrisao] ][PrisaoX], infoPrisoes[ PlayerInfo[i][TipoPrisao] ][PrisaoY], infoPrisoes[ PlayerInfo[i][TipoPrisao] ][PrisaoZ])){
			        SetPlayerVirtualWorld(i, 1);
			        SetPlayerPosEx(i, infoPrisoes[ PlayerInfo[i][TipoPrisao] ][PrisaoX], infoPrisoes[ PlayerInfo[i][TipoPrisao] ][PrisaoY], infoPrisoes[ PlayerInfo[i][TipoPrisao] ][PrisaoZ]);
			        TogglePlayerControllableEx(i, false);
			        AvisosSair[i] += 1;
			        SetTimerEx("descongelar", 3000, false, "i", i);
			        if(AvisosSair[i] >= 5) return Kick(i);
				}
			}
		}
	}
	return 1;
}
forward kickar(playerid);
public kickar(playerid){
	Kick(playerid);
}
forward descarregartd(playerid, carro);
public descarregartd(playerid, carro){
	TogglePlayerControllableEx(playerid, true);
	PlayerInfo[playerid][DinheiroPD] += 700;
	SendClientMessage(playerid, 0x33aa33ff, "|INFO| Voce descarregou as madeiras e ganhou +R$700 de PayDay, volte para pegar mais.");
	DescarregandoMadeiras[playerid] = false;
	MadeirasCarro[SpawnouEmprego[playerid]] = 0;
	GameTextForPlayer(playerid, "~B~Pay Day aumentado!", 2000, 3);
	return 1;
}
forward carregandomadeira(playerid, carro);
public carregandomadeira(playerid, carro){
	TogglePlayerControllableEx(playerid, true);
	MadeirasCarro[carro] = 6;
	MadeirasGlobal -= 6;
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce carregou as madeiras no veiculo, va ate a posicao para entregar.");
	SetPlayerCheckpoint(playerid,  -1114.63110, -1621.44092, 76.42254, 3.0);
}
forward pescando(playerid);
public pescando(playerid){
	new r = 1 + random(2);
	Peixes[playerid] += r;
	new str[90];
	format(str, 90, "{fff000}%s\n\n{ffffff}Voce conseguiu pescar %d peixes (%d/20).", nome(playerid), r, Peixes[playerid]);
	ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{ff0000}Aviso", str, "Ok", "Sair");
	Pescando[playerid] = false;
	TogglePlayerControllableEx(playerid, true);
	return 1;
}
forward bikespawn(veh);
public bikespawn(veh){
    BikeSpawn[veh] = true;
}
forward chamarspawn(playerid);
public chamarspawn(playerid){
	SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin],3585.6218,524.0502,1519.5316,360.0);
    TogglePlayerSpectating(playerid, false);
	SpawnPlayer(playerid);
	new str[144];
	foreach(new i: B_House){
		if(DonoDaCasa(playerid, i)){
			format(str, sizeof(str), "N. %d - %s.\n", i, CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]));
			ShowPlayerDialog(playerid, DIALOG_SPAWN_HOUSE, DIALOG_STYLE_LIST, "{ff0000}# Suas Casas", str, "Spawn", "Nao");
		}
	}
	return 1;
}
cmd:sim(playerid){
	if(!EnqueteCriada || Votou[playerid]) return 1;
	VotosSim++;
	Votou[playerid] = true;
	SendClientMessage(playerid, Rosa, "|Enquete| Voce votou sim, a favor.");
	new str[144];
	format(str, sizeof str, "%s votou a favor", nome(playerid));
	AdminMessage(Rosa, str);
	return 1;
}
cmd:nao(playerid){
	if(!EnqueteCriada || Votou[playerid]) return 1;

	VotosNao++;
	Votou[playerid] = true;
	SendClientMessage(playerid, Rosa, "|Enquete| Voce votou nao, contra.");
	new str[144];
	format(str, sizeof str, "%s votou contra", nome(playerid));
	AdminMessage(Rosa, str);
	return 1;
}
cmd:enquete(playerid, params[]){
	if(EnqueteCriada) return 1;

	if(PlayerInfo[playerid][Admin] >= 3){
		if(isnull(params)) return SendClientMessage(playerid, -1, "/enquete [ pergunta ]");
		foreach(new i: Player){
			SendClientMessage(i, Rosa, "");
			SendClientMessage(i, Rosa, "");
			SendClientMessage(i, Rosa, "===================== [ ENQUETE ADMIN ] =====================");
			SendClientMessage(i, Rosa, "");
			SendClientMessage(i, Rosa, params);
			SendClientMessage(i, Rosa, "Digite /sim ou /nao para votar.");
			SendClientMessage(i, Rosa, "");
			SendClientMessage(i, 0xfff000ff, "Enquete se finaliza em 30s.");
		}
		EnqueteCriada = true;
		SetTimer("FinalizarEnquete", 30000, false);
	}
	return 1;
}
cmd:trocarsenha(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 12) return 1;
	new user, senhas[24];
	if(sscanf(params, "is[24]", user, senhas)) return SendClientMessage(playerid, LIGHTBLUE, "/trocarsenha [ id fixo ] [ nova senha ]");
	//if(strlen(senha) >= 25) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou uma senha muito comprida.");
	if(user < 1 || isnull(senhas)) return SendClientMessage(playerid, LIGHTBLUE, "A Senha/conta nao pode ser nula!");
	//bcrypt_hash(playerid, "AlterarSenha", senha, BCRYPT_COST, "i", user);
	SendClientMessage(playerid, LIGHTBLUE, fString("Voce alterou a senha deste jogador para %s.", senhas));
	return 1;
}
cmd:macumbinha(playerid){
	if(PlayerInfo[playerid][Admin] < 10) return 1;

	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	GerarMacumba("joao", X,Y,Z-1);
	return 1;
}
cmd:tirarporte(playerid, params[]){
	if(!IsPolice(PlayerInfo[playerid][Org])) return 1;
	if(!Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar fardado.");
 	new achaste = -1;
	if(PlayerInfo[playerid][Org] == 11) achaste = playerid;
	if(PlayerInfo[playerid][Org] == 2)  achaste = playerid;
	if(achaste == -1) SendClientMessage(playerid, LIGHTBLUE, "* Apenas Policia Civil e Policia Federal podem retirar porte de arma!");
	if(PlayerInfo[playerid][Cargo] < 4) return SendClientMessage(playerid, LIGHTBLUE, "* Somente cargos a cima de 4 podem usar este comando.");
	new id = strval(params);
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/tirarporte [ id fixo ]");
	new achou = -1;
	foreach(new i: Player){
		if(PlayerInfo[i][IDFixo] == id){
			achou = i;
			id = i;
		}
	}
	if(id == playerid || achou == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode se setar Porte ou este ID Esta offline.");
	if(!PlayerInfo[id][Porte]) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador nao possui porte! use /darporte.");
	PlayerInfo[id][Porte] = false;
	SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de remover um Porte De Armas.");
	SendClientMessage(id, LIGHTBLUE, fString("* Voce teve o porte de armas removido por  %s", nome(playerid)));
	//MessageOrg(PlayerInfo[playerid][Org], LIGHTBLUE, fString("Aviso Org | %s deu um porte para %s e foi descontado 500$ do Cofre!", nome(playerid), nome(id)));
	return 1;
}
cmd:darporte(playerid, params[]){
	if(!IsPolice(PlayerInfo[playerid][Org])) return 1;
	if(!Equipado(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar fardado.");
 	new achaste = -1;
	if(PlayerInfo[playerid][Org] == 11) achaste = playerid;
	if(PlayerInfo[playerid][Org] == 2)  achaste = playerid;
	if(achaste == -1) SendClientMessage(playerid, LIGHTBLUE, "* Apenas Policia Civil e Policia Federal podem dar porte de arma!");
	if(PlayerInfo[playerid][Cargo] < 4) return SendClientMessage(playerid, LIGHTBLUE, "* Somente cargos a cima de 4 podem usar este comando.");
	new id = strval(params);
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/darporte [ id fixo ]");
	new achou = -1;
	foreach(new i: Player){
		if(PlayerInfo[i][IDFixo] == id){
			achou = i;
			id = i;
		}
	}
	if(id == playerid || achou == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode se setar Porte ou este ID Esta offline.");
	if(PlayerInfo[id][Porte]) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador ja possui porte! use /removerporte!");
	PlayerInfo[id][Porte] = true;
	SendClientMessage(playerid, LIGHTBLUE, "* Voce acaba de dar um Porte De Armas, foi removido do cofre 500$.");
	SendClientMessage(id, LIGHTBLUE, fString("* Voce recebeu um porte de armas do policial %s", nome(playerid)));
	OrgInfo[ PlayerInfo[playerid][Org] ][OrgCofre] -= 500;
	return 1;
}
cmd:explodir(playerid){
	if(!IsTerrorista(PlayerInfo[playerid][Org])) return SendClientMessage(playerid, LIGHTBLUE, "* Apenas terroristas podem usar este comando.");
	if(NaMao[playerid] != DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de uma DINAMITE na Mao!");
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	new str[144];
	format(str, sizeof str, "*(%s) Um Homem-Bomba se explodiu nas localidades de %s.", OrgGm[ PlayerInfo[playerid][Org] ][OrgNome],CoordZone(X, Y, Z));
	SendClientMessageToAll(LIGHTBLUE, str);
	CreateExplosion(X, Y, Z, 6, 20.0);
	foreach(new i: Player){
		if(ISP(i, 15.0, X, Y, Z)){
			ClearAnimations(i);
			PlayerInfo[i][Ferido] = true;
			CheckDeath(i);
		}
	}
	NaMao[playerid] = 0;
	return 1;
}
cmd:titulos(playerid){
	new str[50];
	format(str, sizeof str, "Titulo Atual: %s | %s", PlayerInfo[playerid][Titulo], PlayerInfo[playerid][TituloPersonalizado]);
	ShowPlayerDialog(playerid, DIALOG_TITULOS, 5, str, "Titulo\tRequisito\n\
		{ffffff}Sem Titulo\t-\n\
		{ff0000}Emprego\tPossuir Emprego\n\
		{ff00ab}Admin\tTag Admin\n\
		{fff000}VIP\tSer Vip\n\
		{33aa33}Milionario\t+ 1 Milhao\n\
		{f07b0f}Titulo Personalizado\t{f07b0f}5c", "Ok", "Retornar");
	return 1;
}
cmd:lmc(playerid){
	if(PlayerInfo[playerid][Admin] < 3) return SendClientMessage(playerid, LIGHTBLUE, "Voce nao pode usar este comando.");
	for(new i; i <50; i++){
		SendClientMessageToAll(-1, " ");
	}
	GameTextForAll("~R~Chat limpo por um Admin", 4000, 3);
	return 1;
}
cmd:acessorios(playerid){
	new str[255];
	strcat(str, "Parte\tSlot\n");
	for(new i; i <MAX_PLAYER_ATTACHED_OBJECTS; i++){
		if(ObjetoUsadoEmIndex(playerid, i)){
			new str2[50];
			format(str2, sizeof str2, "%s\t%s\n", NomeBone(ao[playerid][i][partebone]), NomeAcessorios(ao[playerid][i][modelindex]));
			strcat(str, str2);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_VER_ACCS, 5, "{fff000}Acessorios Disponiveis", str, "Ok", "Sair");
	return 1;
}
cmd:furtargasolina(playerid){
	if(!TemItem(playerid, GALAO_VAZIO)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem um galao vazio!");
	new check = -1;
	for(new i, j = MAX_VEHICLES; i != j; i++){
		new Float: pos[3];
		GetVehiclePos(i, pos[0], pos[1], pos[2]);
		//GetXYZOfVehiclePart(vehicleid, part, &Float:x, &Float:y, &Float:z, Float:offset = 0.5)
		GetXYZOfVehiclePart(i, VEHICLE_PART_TRASEIROESQUERDO, pos[0], pos[1], pos[2]);
		if(IsPlayerInRangeOfPoint(playerid, 1.1, pos[0], pos[1], pos[2]) && VeiculoConfiguracao[i][Desmanchado]){
			check = i;
			if(VeiculoInfo[i][Gasolina] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Este veiculo esta sem gasolina!");
			TogglePlayerControllableEx(playerid, false);
			ApplyAnimationEx(playerid, "SWORD", "SWORD_1",4.1,1,0,0,0,0);
			GameTextForPlayer(playerid, "~R~Roubando Gasolina...", 6000, 3);
			SetTimerEx("furtandogas", 5600, false, "isii", playerid, nome(playerid), VeiculoInfo[i][Gasolina], i);
			break;
		}
	}
	if(check == -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar no tanque de combustivel do veiculo e ele precisa estar desmanchado!");
	return 1;
}
cmd:enchergalao(playerid){
	if(EnchendoGalao[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta enchendo um galao!");
	for(new i = 1; i <sizeof PostoInfo; i++){
		if(ISP(playerid, 10.0, PostoInfo[i][PostoX], PostoInfo[i][PostoY], PostoInfo[i][PostoZ])){
			//if(!TemItem(playerid, GALAO_VAZIO)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao possui galoes vazios.");
			if(NaMao[playerid] != GALAO_VAZIO) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa pegar um Galao Vazio na mao.");
			EnchendoGalao[playerid] = true;
			SetTimerEx("enchendo", 5000, false, "is", playerid, nome(playerid));
			TogglePlayerControllableEx(playerid, false);
			GameTextForPlayer(playerid, "~B~Enchendo..", 4000, 3);
			break;
		}
	}	
	return 1;
}
cmd:dcombus(playerid){
	if(PlayerInfo[playerid][Emprego] != TRANSP_COMBUSTIVEL) return 1;
	if(!TrabalhandoEmprego[playerid][TRANSP_COMBUSTIVEL]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa dar /trabalhar!");
	if(SpawnouEmprego[playerid] == -1 || SpawnouEmprego[playerid] == INVALID_VEHICLE_ID) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa spawnar seu veiculo!");
	if(!IsPlayerInVehicle(playerid, SpawnouEmprego[playerid])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa estar em seu veiculo!");
	if(!CarregandoCombustivel [ SpawnouEmprego[playerid] ]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao carregou combustivel em seu caminhao!");
	new achado = -1;
	for(new i = 1; i <sizeof PostoInfo; i++){
		if(ISP(playerid, 10.0, PostoInfo[i][PostoX], PostoInfo[i][PostoY], PostoInfo[i][PostoZ]) && i == GetPVarInt(playerid, "OPostoA")){
			if(GetPVarInt(playerid, "DescarregandoCombus") == 1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta fazendo isso.");
			TogglePlayerControllableEx(playerid, false);
			SetPVarInt(playerid, "DescarregandoCombus", 1);
			achado = i;
			GameTextForPlayer(playerid, "~R~Descarregando Combustivel...", 6000, 3);
			SetTimerEx("combuposto", 6000, false, "iiis", SpawnouEmprego[playerid], playerid, i, nome(playerid));
			return i;
		}
		
	}
	if(achado == -1) SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta perto do posto que foi Marcado!");	
	return 1;
}
cmd:abastecer(playerid){
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	for(new i = 1; i <sizeof PostoInfo; i++){
		if(ISP(playerid, 10.0, PostoInfo[i][PostoX], PostoInfo[i][PostoY], PostoInfo[i][PostoZ])){
			SetPVarInt(playerid, "QPosto", i);
			ShowPlayerDialog(playerid, DIALOG_ABASTECER, DIALOG_STYLE_INPUT, "{33aa33}# Dialog Abastecer", "{33ccff}Digite a quantia que voce deseja abastecer.\n{33aa33}Valor da Gasolina: 5/L.", "Ok", "Sair");
		}
	}
	return 1;
}
cmd:criarsemente(playerid){
	if(ComponentesQuimicos[playerid] < 7) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa de 7 componentes para produzir 1 SEMENTE.");
	if(!ISP(playerid, 3.2, 2566.3037,2811.2964,10.8203)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao esta na Fabrica de Drogas.");
	if(GetPlayerCash(playerid) < 720) return SendClientMessage(playerid, LIGHTBLUE, "* Voce precisa ter no minimo 720$ para produzir a SEMENTE.");
	GivePlayerCash(playerid, -720);
	ComponentesQuimicos[playerid] = 0;
	GameTextForPlayer(playerid, "~R~Criando SEMENTE...", 12000, 3);
	SendClientMessage(playerid, VerdeSamp, "* Aguarde 1 minuto para a SEMENTE ser criada e nao saia de perto da mesa!.");
	IniciarProducao(nome(playerid), playerid);
	return 1;
}
stock IniciarProducao(const name[], playerid){
	SetTimerEx("ChegarSEMENTE", 60000, false, "si", name, playerid);
}
forward ChegarSEMENTE(const name[], id);
public ChegarSEMENTE(const name[], id){
	if(IsPlayerConnectedP(id)){
		if(!strcmp(name, nome(id))){
			if(ISP(id, 9.0, 2566.3037,2811.2964,10.8203)){
				AdicionarItem(id, SEMENTE, 1);
				SendClientMessage(id, LIGHTBLUE, "* Voce recebeu a SEMENTE que foi produzida na Maquina.");
			}
			else
				SendClientMessage(id, LIGHTBLUE, "* Voce nao estava perto da Mesa e nao recebeu a SEMENTE.");
		}
	}
}

stock GerarMaconha(playerid, Float: x, Float: y, Float: z){
	for(new i = 1; i <MAX_MACONHAS; i ++){
		if(MacPlant[i][AMaconha] == 0){
			MacPlant[i][macid] = i;
			MacPlant[i][MacPos][0] = x;
			MacPlant[i][MacPos][1] = y;
			MacPlant[i][MacPos][2] = z;
			format(MacPlant[i][DonoMac], 24, nome(playerid));
			new str[255];
			format(str, sizeof str, "{33aa33}Maconha De %s\n%d/250g",MacPlant[i][DonoMac], MacPlant[i][MacQuant]);
			MacPlant[i][TextoMaconha] = CreateDynamic3DTextLabel(str, -1,MacPlant[i][MacPos][0], MacPlant[i][MacPos][1],MacPlant[i][MacPos][2],30.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);//, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0
			MacPlant[i][AMaconha] = CreateDynamicObject(3409,MacPlant[i][MacPos][0], MacPlant[i][MacPos][1],MacPlant[i][MacPos][2]-1,0,0,0);
			mysql_format(Dados, str, sizeof str, "INSERT INTO `Maconhas` (`macid`,`MacQuant`,`MacX`,`MacY`,`MacZ`,`MacDono`) VALUES ('%d', '%d', '%f', '%f', '%f', '%s')",
				i, 0, MacPlant[i][MacPos][0], MacPlant[i][MacPos][1],MacPlant[i][MacPos][2]-1, MacPlant[i][DonoMac]);
			mysql_tquery(Dados, str);
			Iter_Add(MaconhasIterator, i);
			return i;
		}
	}
	return -1;
}
cmd:plantarsemente(playerid){
	if(!TemItem(playerid, SEMENTE)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem SEMENTEs para usar.");
	if(PlantandoSEMENTE[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta plantando uma SEMENTE.");
	for(new i = 1; i <MAX_MACONHAS; i++){
		if(ISP(playerid, 4.0, MacPlant[i][MacPos][0],MacPlant[i][MacPos][1],MacPlant[i][MacPos][2])) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta muito perto de outro Pe De Maconha.");
		PlantandoSEMENTE[playerid] = true;
		TogglePlayerControllableEx(playerid, false);
		ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
		new Float: X, Float: Y, Float: Z;
		GetPlayerPos(playerid, X, Y, Z);

		TimerPMac[playerid] = SetTimerEx("chmMc", 4000, false, "ifff", playerid, X, Y, Z);
		SendClientMessage(playerid, LIGHTBLUE, "* Sua maconha esta sendo plantada.");
		break;
	}
	return 1;
}
forward chmMc(playerid, Float: x, Float: y, Float: z);
public chmMc(playerid,  Float: x, Float: y, Float: z){
	if(PlantandoSEMENTE[playerid]){
		PlantandoSEMENTE[playerid] = false;
		GerarMaconha(playerid, x, y, z);
		TogglePlayerControllableEx(playerid, true);
		DiminuirItem(playerid, SEMENTE, 1);
		GameTextForPlayer(playerid, "~R~Maconha Plantada!", 2000, 3);
		PC_EmulateCommand(playerid, "/anim");
	}	
}
cmd:colherplanta(playerid){
	foreach(new i: MaconhasIterator){
		if(ISP(playerid, 3.5, MacPlant[i][MacPos][0],MacPlant[i][MacPos][1],MacPlant[i][MacPos][2])){
			if(MacPlant[i][MacQuant] >= 250){
				if(TimerMac[playerid] != -1) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja esta colhendo uma planta.");
				TimerMac[playerid] = SetTimerEx("puxarPlanta", 9000, false, "ii", playerid, i);
				TogglePlayerControllableEx(playerid, false);
				ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
				ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
				GameTextForPlayer(playerid, "~R~Colhendo Planta...", 9000, 3);
				return i;
			}
			else
				SendClientMessage(playerid, LIGHTBLUE, "* Esta planta nao esta com Gramas suficientes.");
		}
	}
	return 1;
}
forward puxarPlanta(playerid, i);
public puxarPlanta(playerid, i){
	if(!IsValidDynamicObject(MacPlant[i][AMaconha])){
		PC_EmulateCommand(playerid, "/anim");
		TogglePlayerControllableEx(playerid, true);
		TimerMac[playerid] = -1;
		SendClientMessage(playerid, LIGHTBLUE, "* Alguem ja colheu esta Maconha.");
	}
	else{
		DestroyDynamicObject(MacPlant[i][AMaconha]);
		TogglePlayerControllableEx(playerid, true);
		PC_EmulateCommand(playerid, "/anim");
		new str[144];
		format(str, sizeof str, "Voce conseguiu %dg de Maconha.",MacPlant[i][MacQuant] );
		SendClientMessage(playerid, VerdeSamp, str);
		AdicionarItem(playerid, MACONHA, MacPlant[i][MacQuant]);
		DestroyDynamicObject(MacPlant[i][AMaconha]);
		DestroyDynamic3DTextLabel(MacPlant[i][TextoMaconha]);
		format(MacPlant[i][DonoMac], 24, "NullPlay.!");
		MacPlant[i][MacQuant] = 0;
		MacPlant[i][AMaconha] = 0;
		TimerMac[playerid] = -1;
		mysql_format(Dados, str, sizeof str, "DELETE FROM `Maconhas` WHERE `macid` = '%d'", i);
		mysql_tquery(Dados, str);
		Iter_Remove(MaconhasIterator, i);
	}
	return 1;
}
cmd:pegarcomponente(playerid){
	if(ComponentesQuimicos[playerid] >= 7) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja tem o suficiente de componentes.");
	for(new i = 1; i < 6; i++){
		if(ISP(playerid, 2.8, MaconhaRecolher[i][MaconhaPosicaoX], MaconhaRecolher[i][MaconhaPosicaoY], MaconhaRecolher[i][MaconhaPosicaoZ])){
			if(gettime() - gettimeMaconha[i] < 60) return SendClientMessage(playerid, LIGHTBLUE, "Aguarde alguns segundos antes de pegar componentes aqui novamente.");
			gettimeMaconha[i] = gettime();
			TogglePlayerControllableEx(playerid, false);
			ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant",4.1,1,0,0,0,0);
			TimerColherMC[playerid] = SetTimerEx("cOlherComponenteMaconha", 20000, false, "i", playerid);
			GameTextForPlayer(playerid, "~R~Pegando Componentes...", 20000, 3);
			return i;
		}
	}
	return 1;
}
forward cOlherComponenteMaconha(playerid);
public cOlherComponenteMaconha(playerid){
	TogglePlayerControllableEx(playerid, true);
	ComponentesQuimicos[playerid] += 1;
	PC_EmulateCommand(playerid, "/anim");
	SendClientMessage(playerid, LIGHTBLUE, "* Voce conseguiu mais um componente.");
	return 1;
}
// final sistema de maconha
cmd:setarnivel(playerid, params[]){
	if(PlayerInfo[playerid][Admin] < 7) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar o comando.");
	new id, nivel;
	if(sscanf(params, "ii", id, nivel)) return SendClientMessage(playerid, LIGHTBLUE, "/setarnivel [ id ] [nivel]");
	if(nivel > 100) return SendClientMessage(playerid, LIGHTBLUE, "* Este nivel e muito alto.");
	if(nivel < 1) return SendClientMessage(playerid, LIGHTBLUE, "*Este nivel e invalido.");
	new uva = -1;
	foreach(new i: Player){
		if(id == PlayerInfo[i][IDFixo]){
			id = i;
			uva = i;
			break;
		}
	}
	if(uva == -1) return SendClientMessage(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
	if(IsPlayerConnectedP(id)){
		new str[144];
		format(str, sizeof str, "* %s setou nivel %d em voce.", nome(playerid), nivel);
		SendClientMessage(id, VerdeSamp, str);
		format(str, sizeof str, "* Voce setou nivel %d no jogador %s.", nivel, nome(id));
		SendClientMessage(playerid, VerdeSamp, str);
		PlayerInfo[id][Nivel] = nivel;
	}
	else{
		SendClientMessage(playerid, LIGHTBLUE, "* Este jogador esta offline!");
	}
	return 1;
}
IsPlayerConnectedP(playerid){
	if(PlayerInfo[playerid][Logado] && IsPlayerConnected(playerid))
		return true;
	return false;
}
cmd:animname(playerid){

    if (GetPlayerAnimationIndex(playerid))
    {
        new
            animLib[32],
            animName[32],
            msgText[128];

        GetAnimationName(GetPlayerAnimationIndex(playerid), animLib, sizeof animLib, animName, sizeof animName);
        format(msgText, sizeof msgText, "anim: %s %s", animLib, animName);
       	SendClientMessage(playerid, LIGHTBLUE, msgText);
    }
	return 1;
}
forward calllastpos(playerid);
public calllastpos(playerid){
	if(PlayerInfo[playerid][Px] != 0 && PlayerInfo[playerid][Py] !=0 && PlayerInfo[playerid][Pz] != 0){
		SetPlayerPos(playerid, PlayerInfo[playerid][Px], PlayerInfo[playerid][Py], PlayerInfo[playerid][Pz]);
		SetPlayerInterior(playerid, PlayerInfo[playerid][InteriorPlayer]);
		SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][VirtualWorld]);
		ApllyAnim(playerid, "PED", "KO_SKID_BACK", 4.1, 0, 0, 0, 1, 0, SYNC_ALL);
		SetTimerEx("animacao", 2000, false, "i", playerid);
	}
	return 1;
}

forward animacao(playerid);
public animacao(playerid){
	PC_EmulateCommand(playerid, "/anim");
}
forward terminarcarregar(playerid);
public terminarcarregar(playerid){
	CarregandoCaminhao[playerid] = false;
	TogglePlayerControllableEx(playerid, true);
	CaminhaoCarregado[SpawnouEmprego[playerid]] = 10;
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Caminhao carregado com sucesso. Va ate a marca para descarregar.");
	SetPlayerCheckpoint(playerid, -1722.4606,-117.3898,3.5489, 5.0);
	return 1;
}
forward terminardscrrg(playerid, i);
public terminardscrrg(playerid, i){ //cf descarregar
	ChecarAnexagem(playerid);
	ReabastecendoCaixa[playerid] = false;
	PlayerInfo[playerid][DinheiroPD] += 250;
	GameTextForPlayer(playerid, "~B~Pay Day aumentado!", 2000, 3);
	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    new str[144];
    format(str, sizeof str, "{33AA33}[B.{FFF000}B]{ffffff} {33ccff}O Caixa %d teve 10000R$ de dinheiro reposto.", i);
    SendClientMessageToAll(-1, str);
   	InfoCaixa[i][CaixaGrana] += 10000;
    SendClientMessage(playerid, Amarelo, "[Pay Day]: Voce ganhou R$250 por repor este caixa.");
    GameTextForPlayer(playerid, "~B~PayDay aumentado!", 3000, 3);
    new r = Iter_Random(B_Caixas);
	Caixaplayer[playerid] = r;
	SetPlayerCheckpoint(playerid, InfoCaixa[r][CaixaX], InfoCaixa[r][CaixaY], InfoCaixa[r][CaixaZ]-0.3, 3.5);
	return 1;
}
forward preparandobomba(playerid, caixa);
public preparandobomba(playerid, caixa){
	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);
	PlantandoCaixa[playerid] = false;
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Em 30 segundos o caixa vai explodir. Saia de perto.");
	InfoCaixa[caixa][SendoRoubado] = true;
	SetTimerEx("estourarcaixa", 35000, false, "i", caixa);
	new Query[90];
	format(Query, sizeof Query, "%s roub. caixa (%s)", nome(playerid), OrgGm[ PlayerInfo[playerid][Org] ][Sigla]);
	AdicionarLogs(Query);
	return 1;
}
forward estourarcaixa(caixa);
public estourarcaixa(caixa){
	if(InfoCaixa[caixa][CaixaQuebrado]) return 1;

	InfoCaixa[caixa][SendoRoubado] = false;
	InfoCaixa[caixa][CaixaQuebrado] = true;
	CreateExplosion(InfoCaixa[caixa][CaixaX], InfoCaixa[caixa][CaixaY], InfoCaixa[caixa][CaixaZ], 6, 15.0);
	new Float: xc, Float: xy, Float: zz;
	UpdateDynamic3DTextLabelText(InfoCaixa[caixa][CaixaTexto], -1, "{ff0000}Caixa Destruido por bandidos\n{ffffff}Chame uma autoridade.");


	new Float: Cx, Float: Cy;
	GetDynamicObjectPos(InfoCaixa[caixa][ObjetoCaixa], xc, xy, zz);
    CreateExplosion(xc, xy, zz, 10, 10.0);
    GetXYInFrontOfObject(InfoCaixa[caixa][ObjetoCaixa],xc,xy,2.0);
	for(new i; i<20; i++){
    	Cx = xc+(RdonPickups[random(sizeof(RdonPickups))][0]);
		Cy = xy-(RdonPickups[random(sizeof(RdonPickups))][0]);
	    CriarItemDrop(Cx, Cy, zz, DINHEIRO_FLUTUANTE_BANDIDO, 1000-(random(180)));
	}
	new Float: contaa = ((0.5) * InfoCaixa[caixa][CaixaGrana]);
	InfoCaixa[caixa][CaixaGrana] -= floatround(contaa);
	return 1;
}
forward repararcaixa(playerid, i);
public repararcaixa(playerid, i){
	if(!InfoCaixa[i][CaixaQuebrado]) return 1;
	InfoCaixa[i][CaixaQuebrado] = false;
	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);
	ReparandoCaixa[playerid] = false;
    new str[144];
 	format(str, sizeof(str), "{33ccff}Caixa Eletronico N. %d\nAperte 'Y'", i);
    UpdateDynamic3DTextLabelText(InfoCaixa[i][CaixaTexto], -1, str);

    format(str, sizeof str, "%s acaba de consertar um caixa.", OrgGm[PlayerInfo[playerid][Org]][OrgNome]);
    SendClientMessageToAll(LIGHTBLUE, str);
    new org = PlayerInfo[ playerid ][Org];
    OrgInfo[org][OrgCofre] += 10000;
    format(str, sizeof str, "Org | %s consertou um caixa e foi adicionado 10000$ no cofre.", nome(playerid));
    MessageOrg(PlayerInfo[playerid][Org], LIGHTBLUE, str);
	return 1;
}
forward controle(playerid);
public controle(playerid){
	TogglePlayerControllableEx(playerid, true);
	SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce foi descongelado.");
	return 1;
}
forward voltaravida(playerid);
public voltaravida(playerid){
	TogglePlayerSpectating(playerid, false);
	SpawnPlayer(playerid);
	return 1;
}
forward OnPlayerLogin(playerid);
public OnPlayerLogin(playerid){
	MostrarLogin(playerid);
}
stock interpolarSkin(playerid){
	TogglePlayerSpectating(playerid, true);
	InterpolateCameraPos(playerid, 1170.093505,-1687.497680,24.864450, 1168.202392,-1690.106933,23.134460, 1000, CAMERA_MOVE);
	InterpolateCameraLookAt(playerid, 1164.838012,-1693.568237,23.584445, 1164.838012,-1693.568237,22.834442, 1000, CAMERA_MOVE);
	return 1;
}

function interpolar(playerid){
	TogglePlayerSpectating(playerid, true);
	InterpolateCameraPos(playerid,1175.021728,-1727.896850,28.014461,1170.093505,-1687.497680,24.864450,5000,CAMERA_MOVE);
	InterpolateCameraLookAt(playerid,1164.837402,-1693.568359,23.574449,1164.838012,-1693.568237,23.584445,5000,CAMERA_MOVE);
	TimerPlayer[playerid][1] = SetTimerEx("fiminterpolar", 5500, false, "i", playerid);
	return 1;
}
function fiminterpolar(playerid){
	if(PlayerInfo[playerid][Logado]) return 1;

	for(new i; i < 3; i ++){
		PlayerTextDrawHide(playerid, TelaCarregar[playerid][i]);
	}

	
	//CriarLoginCEF(playerid);
	//if(!cef_player_has_plugin(playerid)){
	PlayerTextDrawSetString(playerid, LoginDraw[playerid][4], nome(playerid));

	for(new i; i < 10; i++){
		PlayerTextDrawShow(playerid, LoginDraw[playerid][i]);
	}
	KillTimer(TimerPlayer[playerid][1]);
	SelectTextDraw(playerid, 0xFAB847FF);

	return 1;
}
cmd:sobreviver(playerid){
	if(!PlayerInfo[playerid][Ferido]) return 1;
	new i = playerid;
	if(PlayerInfo[i][MomentoFerido] > 0 && (PlayerInfo[i][MomentoFerido] - gettime()) < 1 && GetPlayerState(i) != PLAYER_STATE:6){
		if(IsPlayerSpawned(i)){
			PlayerInfo[i][MomentoFerido] = -1;
			PlayerInfo[i][Ferido] = false;
			SendClientMessage(i, LIGHTBLUE, "* Voce conseguiu sobreviver aos ferimentos.");
			SetPlayerHealth(i, 40.0);
			PC_EmulateCommand(i, "anim");
		}
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, fString("Aguarde %s segundos para usar este comando!", Convert(PlayerInfo[i][MomentoFerido] - gettime())));
	return 1;
}
cmd:comprarskin(playerid, params[]){
	foreach(new i: MenusCriados){
	    if(IsPlayerInRangeOfPoint(playerid, 2.5, MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ]) && MenuInfo[i][MenuCriado]){
			if(MenuInfo[i][TipoCompra] == 6){
				new skin = strval(params);
				if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/comprarskin [ 0-311 ]");
				if(1 <= skin <= 311){
					if(GetPlayerCash(playerid) < 320) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
					if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
					if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao tem mochila.");
					GivePlayerCash(playerid, -320);
					AdicionarItemN(playerid, skin, 1);
					SendClientMessage(playerid, VerdeSamp, "* Voce acaba de comprar uma roupa nova, ela foi para sua mochila.");
				}
				else
					SendClientMessage(playerid, LIGHTBLUE, "/comprarskin [ 1-311 ]");
			}
		}
	}
	return 1;
}
cmd:membros(playerid){
	if(PlayerInfo[playerid][Org] == 0) return 1;
	SendClientMessage(playerid, 0xfff000ff, "|-|-|-|-|-|-|-|-|-| Membros online no momento |-|-|-|-|-|-|-|-|-|");
	new contar, str[50];
	foreach(new i: Player){
		if(PlayerInfo[i][Org] == PlayerInfo[playerid][Org]){
			contar++;
			format(str, sizeof str, "%s - %s", nome(i), CargoOrgPCargo(PlayerInfo[playerid][Org], PlayerInfo[i][Cargo]));
			SendClientMessage(playerid, VerdeSamp, str);
		}
	}
	format(str, sizeof str, "Total de %d Membros online.", contar);
	SendClientMessage(playerid, LIGHTBLUE, str);
	return 1;
}
cmd:demitiroff(playerid, params[]){
	if(PlayerInfo[playerid][Org] == 0) return 1;
	if(PlayerInfo[playerid][Cargo] != 10) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode usar o comando!");
	if(isnull(params)) return SendClientMessage(playerid, LIGHTBLUE, "/demitiroff [ nome do jogador ]");
	if(IsPlayerOnline(params)) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador esta online.");
	if(!strcmp(params, nome(playerid), true)) return SendClientMessage(playerid, LIGHTBLUE, "* Voce nao pode se demitir!");
	new Query[90], Cache: R;
	mysql_format(Dados, Query, sizeof Query, "SELECT `Org`, `Nome` FROM `Contas` WHERE `Nome` = '%e'", params);
	R = mysql_query(Dados, Query);
	new rows = cache_num_rows();
	if(cache_is_valid(R) && rows){
		if(cache_return_int(0, "Org") != PlayerInfo[playerid][Org]) return SendClientMessage(playerid, LIGHTBLUE, "* Este jogador nao e de sua org.");
		new str[144];
		mysql_format(Dados, str, sizeof str, "UPDATE `Contas` SET `Org` = '0', `Cargo` = '0' WHERE `Nome` = '%s'", params);
		mysql_tquery(Dados, str);
		SendClientMessage(playerid, VerdeSamp, "* Este jogador foi demitido com sucesso.");
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "* Este jogador nao existe ou voce digitou o nome errado.");

	if(cache_is_valid(R))cache_delete(R);
	return 1;
}
cmd:membrosoff(playerid){
	if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 9) return 1;
	if(TempoMembros[playerid] > gettime()) return SendClientMessage(playerid, LIGHTBLUE, "* Voce so pode usar este comando a cada 25s.");
	new str[174], Cache: R;
	mysql_format(Dados, str, sizeof str, "SELECT `UltimoLogin`, `Nome`, `Cargo` FROM `Contas` WHERE `Org` = '%d'", PlayerInfo[playerid][Org]);
	R = mysql_query(Dados, str);
	static Query[800];
	Query[0] = EOS;
	strcat(Query, "Membro\tCargo\tUltimo Login\n");

	new rows;
	cache_get_row_count(rows);
	if(rows){
		for(new i; i< rows; i++){
			new user[24], laslogin[32];
			new f[58];
			cache_get_value_name(i, "UltimoLogin", laslogin, 32);
			cache_get_value_name(i, "Nome", user, 24);
			
			format(f, sizeof f, "%s\t%s\t%s\n", user, CargoOrgPCargo(PlayerInfo[playerid][Org], cache_return_int(i, "Cargo")), laslogin);
			strcat(Query, f);
		}
		ShowPlayerDialog(playerid, DIALOG_INUTIL, 5, "{33ccff}Membros", Query, "Ok", #);
	}
	else
		SendClientMessage(playerid, LIGHTBLUE, "|INFO| Nenhum membro encontrado!");

	if(cache_is_valid(R))cache_delete(R);
	TempoMembros[playerid] = gettime() + 25;
	return 1;
}
cmd:meuinterior(playerid){
	new str[10];
	format(str, sizeof str, "i %d vw %d", GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	SendClientMessage(playerid, LIGHTBLUE, str);
	return 1;
}
stock EsconderInventario(playerid){
	SetPVarInt(playerid, "slot", -1);

	for(new i; i < 38; i++){
		PlayerTextDrawHide(playerid, DrawInv[playerid][i]);
	}
	CancelSelectTextDraw(playerid);

	MochilaTDAberta[playerid] = false;
	return 1;
}

stock MostrarMochila(playerid){
	SetPVarInt(playerid, "slot", -1);
	new str[20];

	PlayerTextDrawSetString(playerid, DrawInv[playerid][34], "Inventario: %s", nome(playerid));
	for(new i; i < 33; i++){
		PlayerTextDrawSetPreviewModel(playerid, DrawInv[playerid][i+1], ItemInfo[playerid][i][Item]);
	}
	for(new i; i < 38; i++){
		PlayerTextDrawShow(playerid, DrawInv[playerid][i]);
	}
	SelectTextDraw(playerid, 0x33ccff);
	return 1;
}
ConectarVIP(playerid){
	new vip = PlayerInfo[playerid][Vip];
	if(vip == 1){
		GameTextForAll("~n~~n~~n~~n~~n~~n~~n~~n~~p~~h~~h~VIP Platina %s~n~~G~online!", 3000, 3, nome(playerid));
	}
	if(vip == 2){
		GameTextForAll("~n~~n~~n~~n~~n~~n~~n~~n~~b~~h~~h~VIP Diamante %s~n~~G~online!", 3000, 3, nome(playerid));
	}
	if(vip == 3){
		GameTextForAll("~n~~n~~n~~n~~n~~n~~n~~n~~r~~h~MAGNATA Ruby %s~n~~G~online!", 4000, 3, nome(playerid));
	}
	return 1;
}
public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
	switch(errorid)
	{
		case CR_SERVER_GONE_ERROR:
		{
			printf("Conexao perdida com o servidor");
		}
		case ER_SYNTAX_ERROR:
		{
			printf("Algo de errado com a Sintaxe, %s",query);
		}
	}
	return 1;
}
CheckBike(playerid){
    if(BikePlayer[playerid] != -1){
	 	foreach(new i: Player){
			if(Nopm[i] == BikePlayer[playerid]){
				// voc??ª precisa fazer est??¡ fun??§??£o em um DestroyVehicleExEx tambem, para n??£o acontecer bugs...
				GameTextForPlayer(playerid, "* O Veiculo foi destruido e voce foi morto.", 2000, 3);
				SetPlayerHealth(i, 0);
				Nopm[i] = -1;
				PlayerTextDrawHide(playerid, telapreta[playerid][0]);
				TogglePlayerControllableEx(i, true);
			}
		}
        BikeSpawn[BikePlayer[playerid]] = false;
		DestroyVehicleEx(BikePlayer[playerid], "BIKE Rc");
		BikePlayer[playerid] = -1;
	}
}
VerFerimento(playerid){
	if(PlayerInfo[playerid][Ferido]){
		TogglePlayerControllableEx(playerid, false);
		SetPlayerInterior(playerid, PlayerInfo[playerid][DeathInterior]);
		SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][DeathVirtualWorld]);
		SetPlayerPos(playerid, PlayerInfo[playerid][DeathPos][0], PlayerInfo[playerid][DeathPos][1], PlayerInfo[playerid][DeathPos][2]);
		CheckDeath(playerid);
		SetPlayerHealth(playerid, 30);
	}
	return 1;
}
CheckOTeste(playerid){
	if(EmTeste[playerid]){
	    KillTimer(TimerTeste[playerid]);
 		DestroyVehicleEx(VeiculoHab[playerid], "Falha Carteira");
	    EmTeste[playerid] = false;
     	SetPlayerVirtualWorld(playerid, 0);
	    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce falhou no teste do veiculo.");
        SpawnPlayer(playerid);
	    DestroyDynamicCP(CheckCarro[playerid]);
	    DestroyDynamicCP(CheckMoto[playerid]);
	    AvisoAuto[playerid] = 0;
	    DestroyDynamicCP(CheckAviao[playerid]);

	}
}


public Float: DistVehicle(playerid, vehicleid){
	new Float: X, Float: Y, Float: Z;
	GetPlayerPos(playerid, X, Y, Z);
	new Float:distance = GetVehicleDistanceFromPoint(vehicleid, X,Y,Z);
	return distance;
}
/* -------------------------------- < Configuracao Macas > ------------------------------*/

MandarPraMaca(playerid){
	new r = random(sizeof InfoMacas);
	TogglePlayerControllableEx(playerid, false);
	SetPlayerPos(playerid, InfoMacas[r][MacaX], InfoMacas[r][MacaY],InfoMacas[r][MacaZ]);

	Internado[playerid] = true;
	ApplyAnimationEx(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0, SYNC_ALL);
	GameTextForPlayer(playerid, "~R~Sendo curado, Nao deslogue! Este procedimento não é salvo.", 9000, 3);
	TimerPlayer[playerid][6] = SetTimerEx("curarnego", 15000, false, "i", playerid);

	SendClientMessage(playerid, LIGHTBLUE, "* Voce esta recuperando seu Sangue perdido.");
	return 1;
}
ResetarPD(){
	new hora, minuto, segundo;
	gettime(hora, minuto, segundo);

	minuto = ( 60 - minuto );

	if(minuto == 0) minuto = 60;

	Tempopayday = gettime() + (60 * minuto) - segundo - 1;
}
AntiDeAMX()
{
    new a[][] =
    {
        "Unarmed (Fist)",
        "Brass K"
    };
    #pragma unused a
}
/*

Pagar organizações por Gz dominado.
será enviado 1000 ao cofre da organização por gangzone dominado.
O valor pode variar dependendo de qual gangzone a org possuí.

*/
WasteDeAMXersTime()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}
cmd:dominios(playerid){
	if(PlayerInfo[playerid][Org] > 0){
		new str[355] = "Zona\tRenda\tGZid\n", cont, contcofre, contcofre2;
		foreach(new i: Gangzoness){
			if(PlayerInfo[playerid][Org] == GzInfo[i][DonoGz]){
				new str2[45];

				format(str2, sizeof str2,"\
				%s\t%dR$\t%d\n",
				GzInfo[i][GZNome], contcofre2, i);
				
				strcat(str,str2);
				cont++;
			}
		}
		if(cont!=0){
			ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_TABLIST_HEADERS, "Gangzones do Servidor", str, "Ok", #);
			SendClientMessage(playerid, LIGHTBLUE, "* Sua organizacao possui %d zonas dominadas, gerando uma renda de %dR$ ao cofre.", cont, contcofre);
		}
		else
			SendClientMessage(playerid, LIGHTRED, "* Sua organizacao nao possui zonas dominadas.");
	}
	return 1;
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
public OnPlayerAirBreak(playerid)
{
    if(PlayerInfo[playerid][Admin] < 1 && !TrabalhoStaff[playerid]){
		AdminMessage(Rosa, fString("%s foi kickado por suspeita de Car Swing(Vehicle Hacks). Fique de olho.", nome(playerid)));
		Kick(playerid);   	
    }
	return 1;
}
public OnPlayerCarSwing(playerid, vehicleid){
	AdminMessage(Rosa, fString("%s foi kickado por suspeita de Car Swing(Vehicle Hacks). Fique de olho.", nome(playerid)));
	Kick(playerid);
	SetVehicleToRespawn(vehicleid);
	return 1;
}
public OnPlayerParticleSpam(playerid, vehicleid){
	AdminMessage(Rosa, fString("%s foi kickado por suspeita de Particle Spam(Vehicle Hacks). Fique de olho.", nome(playerid)));
	Kick(playerid);
	SetVehicleToRespawn(vehicleid);
	return 1;
}
public OnPlayerGodmode(playerid, gmtype){
	AdminMessage(Rosa, fString("%s foi kickado por suspeita de God Mode. Fique de olho.", nome(playerid)));
	Kick(playerid);
	return 1;
}
public OnPlayerFakeKill(playerid, spoofedid, spoofedreason, faketype){
	AdminMessage(Rosa, fString("%s foi kickado por suspeita de Fake Kill. Fique de olho.", nome(playerid)));
	Kick(playerid);
	return 1;
}

public OnPlayerGunCheat(playerid, weaponid, ammo, hacktype){
	if(hacktype != 1 || hacktype != 2){
		AdminMessage(Rosa, fString("%s foi kickado por suspeita de Gun Cheats."));
		Kick(playerid);
	}
	return 1;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
// sisteminha chato demais
public AfterCallMiniavs(playerid, const aviso_id){
	DeleteMiniavs(playerid);
	switch(aviso_id){ // dentro da case do switch, é executado o que vem após o fim do tempo que o aviso foi chamado
		
		case -1:{}
		
		case TUTORIAL_PARTE_UM:{
			CallMiniAviso(playerid, TUTORIAL_PARTE_DOIS, "Visite nosso discord:_Abreai/ZONAOESTERP");
		}
		case TUTORIAL_PARTE_DOIS:{
			CallMiniAviso(playerid, TUTORIAL_PARTE_TRES, "Respeite nossas regras,_nao desrespeite staffs.");
		}
		case TUTORIAL_PARTE_TRES:{
			CallMiniAviso(playerid, TUTORIAL_PARTE_QUATRO, "Va ao banco abrir uma conta.");
		}
		case TUTORIAL_PARTE_QUATRO:{
			CallMiniAviso(playerid, -1, "Você esta desempregado! Receba seu Auxilio desemprego_na Agencia do Trabalhador.");
		}

		default:{
			SendClientMessage(playerid, LIGHTRED, "* Um erro foi encontrado ao tentar mostrar um Mini Aviso. Informe o Scripter. Aviso id %d", aviso_id);
			DeleteMiniavs(playerid);
		}
	}
	return 1;
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
cmd:contrato(playerid, params[]){
	new alvo, sigla[7], valor;
	if(sscanf(params, "ds[7]d", alvo, sigla, valor)) return SendClientMessage(playerid, LIGHTBLUE, "/contrato [ id do alvo ] [ organização para cumprir (sigla)] [ valor ]");
	if(valor < 5000) return SendClientMessage(playerid, LIGHTRED, "Você não pode colocar um valor menor que 5000R$.");
	if(!SiglaExiste(sigla)) return SendClientMessage(playerid, LIGHTRED, "Esta Facção não existe ou você escreveu a sigla de uma Corporação. Para ver as fações existentes, use /orgs.");
	if(!IsPlayerConnectedP(pegarID(alvo))) return SendClientMessage(playerid, LIGHTRED, "Você digitou o id de um jogador offline.");
	if(alvo == PlayerInfo[playerid][IDFixo]) return SendClientMessage(playerid, LIGHTRED, "Voce não pode colocar seu próprio ID.");
	new facid = GetFacBySigla(sigla);
	if(facid == PlayerInfo[playerid][Org]) return SendClientMessage(playerid, LIGHTBLUE, "Você não pode colocar sua propria organização.");
	if(PlayerInfo[alvo][Org] == facid) return SendClientMessage(playerid, LIGHTRED, "Este jogador é desta facção.");
	CriarContrato(alvo, facid, valor, nome(playerid));
	SendClientMessage(playerid, LIGHTBLUE, "Você acaba de pagar para matar esta pessoa, o %s vai cumprir o contrato em breve.", sigla);
	SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+3);
	return 1;
}
cmd:menucontrato(playerid){
	if(IsBandido(PlayerInfo[playerid][Org]) || IsTerrorista(PlayerInfo[playerid][Org])){

		new resto[500] = "Contratante\tAlvo\tValor\tLocalizacao\n", cont = 0;


		foreach(new i: ContratosIT){
			cont++;
			new string[50];
			format(string, sizeof string, "%s\t%d\t%dR$\t%s\n", 
				Contrato[i][Contratante], Contrato[i][Alvo], Contrato[i][ValorAlvo], DistanciaContrato(playerid, Contrato[i][Alvo]));
			strcat(resto, string);

		}
		ShowPlayerDialog(playerid, DIALOG_INUTIL,5, "Contratos Existentes", resto , "Ok", #);//, OPEN_MP_TAGS:...)
	}
	return 1;
}
DistanciaContrato(playerid, contrato){
	new Float: dis = DistanciaPlayers(playerid, contrato), string[11];
	if(dis)
		format(string, sizeof string, "%.2fm", dis);
	else if(dis < 1)
		format(string, sizeof string, "%.2fm", dis);
	else
		format(string, sizeof string,"Offline!");
	return string;
}
CriarContrato(id, faccid, valor, contratante[]){
	for(new i; i <MAX_CONTRATOS; i++){

		if(Contrato[i][ContratoExistente]) continue;


		Contrato[i][ContratoExistente] = true;

		Contrato[i][Alvo] = id;

		Contrato[i][Faccao] = faccid;

		Contrato[i][ValorAlvo] = valor;

		format(Contrato[i][Contratante], 24, contratante);

		MessageOrg(faccid, LIGHTBLUE, "Um novo contrato foi criado para sua facção. Use /menucontrato para visualizar.");

		Iter_Add(ContratosIT, i);
		DB_ExecuteQuery(ContratosDb, "INSERT INTO `Contratos` (`Contratoid`, `Alvo`, `ValorAlvo`, `Contratante`, `Faccao`) VALUES ('%d', '%d', '%d', '%s', '%d')",
			i, id, valor, contratante, faccid);

		break;
	}
}
RemoverContrato(i){

	DB_ExecuteQuery(ContratosDb, "DELETE FROM Contratos WHERE Contratoid = '%d'", i);
	Contrato[i][ContratoExistente] = false;
	Contrato[i][Alvo] = -1;
	Contrato[i][Faccao] = 0;
	Contrato[i][ValorAlvo] = 0;
	Iter_Remove(ContratosIT, i);
	format(Contrato[i][Contratante], 24, "");
	return 1;
}
CheckContrato(playerid, killerid){
	
	if(playerid == killerid) return 1;

	foreach(new i: ContratosIT){
		if(PlayerInfo[playerid][IDFixo] == Contrato[i][Alvo]){ // se o id dele existir nos contratos...
			if(Contrato[i][Faccao] == PlayerInfo[killerid][Org]){
				new Float:parteorg = (float(Contrato[i][ValorAlvo]) * 0.4), Float:partejogador = (float(Contrato[i][ValorAlvo]) - parteorg), org = PlayerInfo[killerid][Org];
				OrgInfo[org][OrgCofre] = floatround(parteorg);
				GivePlayerCash(killerid, floatround(partejogador));
				SendClientMessage(killerid, LIGHTBLUE, "Você concluiu um contrato, você recebeu %dR$.", floatround(partejogador));
				SendClientMessage(playerid, LIGHTRED,"Você foi morto por uma facção, algúem colocou um preço em sua cabeça.");
				SendClientMessageToAll(LIGHTBLUE, "%s acaba de concluir um contrato de assasinato.", OrgGm[org][OrgNome]);
				RemoverContrato(i);
				break;
			}
			else{
				new Float:parteorg = (float(Contrato[i][ValorAlvo]) * 0.4), Float:partejogador = (float(Contrato[i][ValorAlvo]) - parteorg), org = PlayerInfo[killerid][Org];
				OrgInfo[org][OrgCofre] = floatround(parteorg);
				OrgInfo[OrgGm[Contrato[i][Faccao]][OrgNome]][OrgCofre] -= 5000;
				GivePlayerCash(killerid, floatround(partejogador)+1100);
				SendClientMessage(killerid, LIGHTBLUE, "Você roubou o contrate de outra facção, você recebeu %dR$.", floatround(partejogador)+1100);
				SendClientMessage(playerid, LIGHTRED,"Você foi morto por uma facção, algúem colocou um preço em sua cabeça.");
				SendClientMessageToAll(LIGHTBLUE, "%s roubou um contrato da facção %s.", OrgGm[org][OrgNome], OrgGm[Contrato[i][Faccao]][OrgNome]);	
				MessageOrg(Contrato[i][Faccao], LIGHTRED, fString("A Organização acaba de perder R$5000 por ter um contrato roubado."));
				RemoverContrato(i);		
				break;	
			}
		}
	}
	return 1;
}
GetFacBySigla(const sigla[]){
	new retorno = 0; 
	for(new i = 1; i != sizeof OrgGm; i ++){
		if(!strcmp(sigla, OrgGm[i][Sigla], true)){
			retorno = i;
			break;
		}
	}
	return retorno;
}
SiglaExiste(const sigla[]){
	new bool: retorno = false; 
	for(new i = 1;  i != sizeof OrgGm; i ++){
		if(!strcmp(sigla, OrgGm[i][Sigla], true)){
			if(IsPolice(i)) break;
			else{
				retorno = true;
			}
			break;
		}
	}
	return retorno;
}
ContinuarLogin(playerid, playernome[], playersenha[]){
	print("#LOGIN: Iniciando login do jogador.");
	new str[144], Cache: cache;
	mysql_format(Dados, str, 144, "SELECT * FROM `Contas` WHERE `Nome` = '%e'", playernome);
	cache = mysql_query(Dados, str);
	new rows = cache_num_rows();
	if(cache_is_valid(cache) && rows){
		print("#LOGIN: A Conta é existente.");
		new pass[32];
		cache_get_value_name(0, "Senha", pass);//, max_len = sizeof(destination)	
		new Cache:cachetwo;
		mysql_format(Dados, str, sizeof str, "SELECT MD5('%e')", playersenha);
		cachetwo = mysql_query(Dados, str);
		if(cache_is_valid(cachetwo)){ 
			new md5pass[32];
			cache_get_value_index(0, 0, md5pass);//, max_len = sizeof(destination))
			if(!strcmp(pass, md5pass)){
				print("#LOGIN: A Senha foi digitada corretamente.");
				format(PlayerInfo[playerid][Nick], MAX_PLAYER_NAME, playernome);

				PlayerInfo[playerid][HorasJogando] = gettime();
				SendClientMessage(playerid, VerdeSamp, "Senha corretamente digitada. Bom jogo!");
				LogarJogador(playerid);	
			
				
			}
			else{
				fiminterpolar(playerid);
				print("#LOGIN: A senha é digitada errada.");
				SendClientMessage(playerid, LIGHTRED, "|INFO| Senha incorreta! Digite novamente.");
				PlayerTextDrawSetString(playerid, LoginDraw[playerid][7], "senha");
				
				if(IsPlayerTextDrawVisible(playerid, LoginDraw[playerid][7]))
					PlayerTextDrawShow(playerid, LoginDraw[playerid][7]);
			}
		}
	}
	else{
		print("#LOGIN: Conta inexistente, o jogador inicia o processo de Registro.");
		new Cache:cachetwo, md5pass[32];
		mysql_format(Dados, str, sizeof str, "SELECT MD5('%e')", playersenha);
		cachetwo = mysql_query(Dados, str);
		if(cache_is_valid(cachetwo)){
			print("#LOGIN: Conta registrada com sucesso.");
			format(PlayerInfo[playerid][Nick], 24, playernome);
			cache_get_value_index(0, 0, md5pass, sizeof md5pass);
			RegistrarJogador(playerid, md5pass);
	
		}
	}
}
cmd:menualuguel(playerid)
{
	new str[255],str2[255], ct;
	strcat(str, "{33CCFF}ID\t {33CCFF}Veiculo\t {33CCFF}Distancia\n");
	for(new i; i<MAX_ALUGUEIS; i++)
	{
	    if(!isnull(InfoCAluguel[i][VeiculoDono])){
		    ct++;
			format(str2, sizeof(str2), "(%d)\t%s\t%s\n",i, GetVehicleName(InfoCAluguel[i][VeiculoModelo]),DistanciaVeh(playerid, InfoCAluguel[i][OVeiculo]));
			strcat(str, str2);
		}
	}
	if(ct == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem nenhum veiculo.");
	ShowPlayerDialog(playerid, DIALOG_CARMENU_ALUGUEL, 5, "{fff000}Menu Do Veiculo", str, "Ok", "Sair");
	return 1;
}
MeuCarroAlugado(playerid, veh){
	if(!strcmp(InfoCAluguel[veh][VeiculoDono], nome(playerid)))
		return true;
	return false;
}
ConfiguracaoAluguel(playerid, OPCAO_VEICULO, aluguelid = -1){
	static id;
	switch(OPCAO_VEICULO){
		case OPAL_DEFINIR:{
			id = aluguelid;
		}	
		case OPAL_TRANCAR:{
			if(!MeuCarroAlugado(playerid, id)){
				SendClientMessage(playerid, LIGHTRED, "Este veiculo nao e mais seu.");
			}
			else{


				if(VehOpcao(InfoCAluguel[id][OVeiculo], VEICULO_TRANCADO)){
					VehOpcao(InfoCAluguel[id][OVeiculo], DESTRANCAR_VEICULO);
					SendClientMessage(playerid, LIGHTBLUE, "Veiculo destrancado.");
				}
				else{
					VehOpcao(InfoCAluguel[id][OVeiculo], TRANCAR_VEICULO);
					SendClientMessage(playerid, LIGHTBLUE, "Veiculo trancado.");
				}
			}
			id = -1;
		}
		case OPAL_LOCALIZAR:{
			if(!MeuCarroAlugado(playerid, id)){
				SendClientMessage(playerid, LIGHTRED, "Este veiculo nao e mais seu.");
			}
			else{
				new Float: x, Float: y, Float:z;
				GetVehiclePos(InfoCAluguel[id][OVeiculo], x, y, z);
				SetPlayerCheckpoint(playerid,x, y, z, 4.5);
				SendClientMessage(playerid, LIGHTBLUE, "Veiculo localizado.");
			}
			id = -1;
		}
		case OPAL_ESTACIONAR:{
			if(!MeuCarroAlugado(playerid, id)){
				SendClientMessage(playerid, LIGHTRED, "Este veiculo nao e mais seu.");
			}
			else{
				new Float: x, Float: y, Float:z, Float:a,  i = id;
				GetVehiclePos(InfoCAluguel[id][OVeiculo], x, y, z);
				GetVehicleZAngle(InfoCAluguel[id][OVeiculo], a);
				InfoCAluguel[i][VeiculoPos][0] = x;
				InfoCAluguel[i][VeiculoPos][1] = y;
				InfoCAluguel[i][VeiculoPos][2] = z;
				InfoCAluguel[i][VeiculoPos][3] = a;

				DestroyVehicleEx(InfoCAluguel[i][OVeiculo], "");
				InfoCAluguel[i][OVeiculo] = CriarVeiculo("Veiculo de aluguel estacionado.", InfoCAluguel[i][VeiculoModelo], InfoCAluguel[i][VeiculoPos][0], InfoCAluguel[i][VeiculoPos][1], InfoCAluguel[i][VeiculoPos][2], InfoCAluguel[i][VeiculoPos][3], random(128), random(128), -1);
			}
			id = -1;
		}
	}
	return 1;
}
CriarVehAluguel(model, const dono[], horas = 1){
	
	for(new i; i < MAX_ALUGUEIS; i++){
		if(InfoCAluguel[i][VeiculoModelo] == 0){
			
			//1017.6545, -1330.4957, 12.9578, -90
			
			format(InfoCAluguel[i][VeiculoDono], 24, dono);

			InfoCAluguel[i][VeiculoPos][0] = 1017.6545;
			InfoCAluguel[i][VeiculoPos][1] = -1330.4957;
			InfoCAluguel[i][VeiculoPos][2] = 12.9578;
			InfoCAluguel[i][VeiculoPos][3] = -90;

			InfoCAluguel[i][VeiculoModelo] = model;			
			InfoCAluguel[i][TempoDeAluguel] = gettime() + (60 * 60 * horas); // 60s * 60 (que da 1hr) * horas
			InfoCAluguel[i][OVeiculo] = CriarVeiculo("Veiculo de aluguel Comprado!", InfoCAluguel[i][VeiculoModelo], InfoCAluguel[i][VeiculoPos][0], InfoCAluguel[i][VeiculoPos][1], InfoCAluguel[i][VeiculoPos][2], InfoCAluguel[i][VeiculoPos][3], random(128), random(128), -1);
		
			new string[370];
			mysql_format(Dados, string, sizeof string, "INSERT INTO `carrosalugados` (`Vid`, `VeiculoModelo`, `VeiculoX`, `VeiculoY`, `VeiculoZ`, `VeiculoA`, `HorasAlugado`, `Dono`) \
				VALUES ('%d', '%d', '%f', '%f', '%f', '%f', '%d', '%s')",
			i,InfoCAluguel[i][VeiculoModelo], InfoCAluguel[i][VeiculoPos][0], InfoCAluguel[i][VeiculoPos][1], InfoCAluguel[i][VeiculoPos][2], InfoCAluguel[i][VeiculoPos][3],
			InfoCAluguel[i][TempoDeAluguel], InfoCAluguel[i][VeiculoDono]);
	
			mysql_query(Dados, string, false);
			Iter_Add(CarroDeAluguel, i);
			return i;
		}
	}
	return -1;
}
DeletarVehAluguel(Vid){
	new string[50];
	mysql_format(Dados, string, sizeof string, "DELETE FROM `carrosalugados` WHERE `Vid` = '%d'", Vid);
	mysql_tquery(Dados, string);
	
	if(IsValidVehicle(InfoCAluguel[Vid][OVeiculo]))
		DestroyVehicleEx(InfoCAluguel[Vid][OVeiculo], "Veiculo destruido apos seu tempo de aluguel expirar.");
	
	new reset[VeiculoAluguelE];
	InfoCAluguel[Vid] = reset;
	return 1;
}
SalvarCarrosAlugados(){
	new string[255];
	foreach(new i: CarroDeAluguel){
		mysql_format(Dados, string, sizeof string, "UPDATE carrosalugados SET VeiculoModelo = '%d', VeiculoX = '%f', VeiculoY = '%f', VeiculoZ = '%f', VeiculoA = '%f' \
			WHERE Vid = '%d'",
			InfoCAluguel[i][VeiculoModelo], InfoCAluguel[i][VeiculoPos][0], InfoCAluguel[i][VeiculoPos][1], InfoCAluguel[i][VeiculoPos][2], InfoCAluguel[i][VeiculoPos][3], i);
		mysql_tquery(Dados, string);
	}
	return 1;
}
LojaAluguelCar(playerid){
	new bool: retorno = false;
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
		new pVeh = GetPlayerVehicleID(playerid);
		for(new i; i < sizeof CarroDaLoja; i++){
			if(pVeh == CarroDaLoja[i]){
				retorno = true;
				break;
			}
		}
	}
	return retorno;
}
GetValorCAluguel(vehicleid){
	for(new i; i < sizeof AluguelCarro; i++){
		if(vehicleid == AluguelCarro[i][VeiculoModelo])
			return AluguelCarro[i][VeiculoValor];
	}
	return -1;
}
RemoverJogadorDoCarro(playerid){
	SendClientMessage(playerid, LIGHTRED, "Nao ha nenhum veiculo disponivel para alugar.");
	RemovePlayerFromVehicle(playerid);
	return 1;
}
IniciarCAluguel(playerid, opcao_login, horas = 1){
	if(ContarCarrosDispo() < 1) return RemoverJogadorDoCarro(playerid);


	static valor, modelveh, horasc;
	switch(opcao_login){
		case OPCAO_INICIAR:{
			modelveh = GetVehicleModel(GetPlayerVehicleID(playerid));
			valor = GetValorCAluguel(modelveh);
			horasc = horas;
		}
		case OPCAO_CONCLUIR:{
			new car = CriarVehAluguel(modelveh, nome(playerid), horasc);
			PutPlayerInVehicle(playerid, InfoCAluguel[car][OVeiculo], 0);
			SendClientMessage(playerid, LIGHTBLUE, "Voce alugou este carro por %dR$ e por %s horas.", valor * horasc, Convert(InfoCAluguel[car][TempoDeAluguel] - gettime()));
			GivePlayerCash(playerid, - (horasc * GetValorCAluguel(modelveh)));
			SendClientMessage(playerid, LIGHTBLUE, "Digite /menualuguel para acessar mais informaoes.");
			valor = 0; 
			modelveh = 0;
		}	
		
	}
	AtualizarAluguelCarro();
	return 1;
}
AtualizarAluguelCarro(){
	new str[128];
	format(str, sizeof str, "{33ccff}Total de veiculos disponiveis para alugar:\n {ffffff}%d/50.", ContarCarrosDispo());
	UpdateDynamic3DTextLabelText(TextoAluguel, -1, str);
}
ContarCarrosDispo(){
	static contar = 50;
	foreach(new i: CarroDeAluguel){//TextoAluguel
		if(!isnull(InfoCAluguel[i][VeiculoDono])) contar--;
	}
	return contar;
}
function CheckVehicleAluguelTimer(){
	foreach(new j: CarroDeAluguel){
		if(InfoCAluguel[j][TempoDeAluguel] < gettime()){
			DeletarVehAluguel(j);
		}
	}
}
CheckVehHacker(playerid, Tipo){
	static tt = -1;

	switch(Tipo){
		case 1:{
			tt =	SetTimerEx("CheckVehHacker", 2000, false, "ii", playerid, 2);
		}
		case 2:{
			if(LojaAluguelCar(playerid)){
				AdminMessage(Rosa, fString("* %s foi kickado por uma possivel violacao de Anti vehicle Hacking.", nome(playerid)));
				Kick(playerid);
			}
		}
		case 3:{
			if(tt){
				KillTimer(tt);
				tt = -1;
			}
		}
	}
}
function Trigger(playerid, funcao){
	static contexto;
	if(funcao != SEM_OP){
		contexto = funcao;
	}
	else{
		switch(contexto){

			case RETORNAR_AJUDA:{
				PC_EmulateCommand(playerid, "/ajuda");
				contexto = SEM_OP;
			}
			case RESETAR_TRIGGER:contexto = SEM_OP;

		}
	}
	return 1;
}
GetLimiteGanhos(vip)
{
    switch (vip)
    {
        case 0: return 15000;
        case 1: return 23000;
        case 2: return 30000;
        case 3: return 50000;
    }
    return 15000;
}
function CheckPosInvalida(playerid){
	if(PlayerInfo[playerid][Px] == 0.0 || PlayerInfo[playerid][Py] == 0.0 || PlayerInfo[playerid][Pz] == 0.0){
		new r = random(sizeof spawnaleatorio);
		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin],spawnaleatorio[r][0],spawnaleatorio[r][1],spawnaleatorio[r][2], 0);
		Streamer_Update(playerid);
		return true;
	}
	else

	return false;
}
function AbrirMochilaDialog(playerid){
	new string[963];
	strcat(string, "Item\tQuantia\n");
	for(new i; i< 32; i++){
		if(ItemInfo[playerid][i][Item] != NADA ){
			new str[29];
			format(str, sizeof(str), "%s\t(%dx)\n", InventarioName(ItemInfo[playerid][i][Item]), ItemInfo[playerid][i][Quantia]);
			strcat(string, str);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_MOCHILA, DIALOG_STYLE:5, "{FFF000}Sua Mochila", string, "Select", "Sair");
	return 1;
}