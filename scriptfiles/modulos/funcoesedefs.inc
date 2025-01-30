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
#define MAX_PLAYER_SENHA 	32
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
#define MAX_GZS 			60
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
new VotosSim;
new VotosNao;
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
	Congelar(playerid, 1000);
	TogglePlayerControllable(playerid, toggle);
	return 1;
}
Congelar(playerid, tempovv){
	Controle[playerid] = false;
	TogglePlayerControllableEx(playerid, false);
	SetTimerEx("descongelar", tempovv, false, "i", playerid);
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
Sleep(seconds)
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