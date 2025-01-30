new DB:Mafia;
new DB:ContratosDb;
new MySQL:Dados;
new bool:mysql_terminou = false;
static const host[22] = "177.54.147.212";
static const database[24] = "joaob1_3687";
static const login[24] = "joaob1_3687";
static const senha[21] =  "";

function CarregarMafia(){
	new str[144];
	for(new org; org < sizeof OrgGm; org++){
		for(new j; j < 3; j++){
			new DBResult: R;
			format(str, sizeof str, "SELECT * FROM `Mafia` WHERE `TempoEntrega%d` AND `orgid` = '%d'", j, org);
			R = DB_ExecuteQuery(Mafia, str);
			if(DB_GetRowCount(R)){
				new id = DB_GetFieldIntByName(R, "orgid"); // encid
				if(DB_GetFieldIntByName(R, "Equipamentos") > 0) EncomendasMafia[id][EquipamentosEnc] = DB_GetFieldIntByName(R, "Equipamentos");
				
				if(DB_GetFieldIntByName(R, "Drogas") > 0) EncomendasMafia[id][MaconhaEnc] = DB_GetFieldIntByName(R, "Drogas");
				
				if(DB_GetFieldIntByName(R, "VeiculoModel") > 0) EncomendasMafia[id][VeiculosModel] = DB_GetFieldIntByName(R, "VeiculoModel");

				if(DB_GetFieldIntByName(R, "TempoEntrega0") > 0){ 
					EncomendasMafia[id][TempoEnc][0] = DB_GetFieldIntByName(R, "TempoEntrega0");
					encMafia[id][0][Encid] = DB_GetFieldIntByName(R, "encid");
				}
				if(DB_GetFieldIntByName(R, "TempoEntrega1") > 0){
					EncomendasMafia[id][TempoEnc][1] = DB_GetFieldIntByName(R, "TempoEntrega1");
					encMafia[id][1][Encid] = DB_GetFieldIntByName(R, "encid");	
				}
				if(DB_GetFieldIntByName(R, "TempoEntrega2") > 0){
					EncomendasMafia[id][TempoEnc][2] = DB_GetFieldIntByName(R, "TempoEntrega2");
					encMafia[id][2][Encid] = DB_GetFieldIntByName(R, "encid");
				}
				DB_SelectNextRow(R);
			}
			////printf("Equipamentos %d 7", EncomendasMafia[6][EquipamentosEnc]);
			DB_FreeResultSet(R);
		}
	}
}
SalvarMafia(){
	for(new i; i<sizeof OrgGm; i++){
		if(i == 0) continue;
		DB_FreeResultSet(DB_ExecuteQuery(Mafia, "UPDATE `Mafia` SET `TempoEntrega0` = '%d', `Drogas` = '%d' WHERE `orgid` = '%d' AND `encid` = '%d'", EncomendasMafia[i][TempoEnc][0], EncomendasMafia[i][MaconhaEnc], i, encMafia[i][0][Encid]));

		DB_FreeResultSet(DB_ExecuteQuery(Mafia, "UPDATE `Mafia` SET `TempoEntrega1` = '%d', `Equipamentos` = '%d' WHERE `orgid` = '%d' AND `encid` = '%d'",EncomendasMafia[i][TempoEnc][1], EncomendasMafia[i][EquipamentosEnc], i, encMafia[i][1][Encid]));
		
		DB_FreeResultSet(DB_ExecuteQuery(Mafia, "UPDATE `Mafia` SET `TempoEntrega2` = '%d', VeiculoModel` = '%d' WHERE `orgid `= '%d' AND `encid` = '%d'",EncomendasMafia[i][TempoEnc][2], EncomendasMafia[i][VeiculosModel], i, encMafia[i][2][Encid]));
		
	}
	return 1;
}
LoadContratos(){
	new DBResult: R = DB_ExecuteQuery(ContratosDb, "SELECT * FROM Contratos");

	if(DB_GetRowCount(R)){
		for(new i; i <DB_GetRowCount(R); i++){

			Contrato[i][ValorAlvo] = DB_GetFieldIntByName(R, "ValorAlvo");
			Contrato[i][Alvo] = DB_GetFieldIntByName(R, "Alvo");
			DB_GetFieldStringByName(R,"Contratante", Contrato[i][Contratante], 24);
			Contrato[i][Faccao] = DB_GetFieldIntByName(R, "Faccao");
			Contrato[i][ContratoExistente] = true;
			Iter_Add(ContratosIT, i);

		}
	}
	DB_FreeResultSet(R);
}
function LoadCasas(){
		new rows = cache_num_rows();
	   	for(new j; j < rows; j++){
	   		new i;
	   		cache_get_value_name_int(j, "Casaid", i);

	        InfoCasa[i][CasaCriada] = true;
	        InfoCasa[i][casaid] = i;

	        cache_get_value_name_int(j, "CasaComprada", InfoCasa[i][CasaComprada]);

	        cache_get_value_name_float(j, "CasaX", InfoCasa[i][CasaX]);
	        cache_get_value_name_float(j, "CasaY", InfoCasa[i][CasaY]);
	        cache_get_value_name_float(j, "CasaZ", InfoCasa[i][CasaZ]);
	        cache_get_value_name_float(j, "SaidaX", InfoCasa[i][SaidaX]);
	        cache_get_value_name_float(j, "SaidaY", InfoCasa[i][SaidaY]);
	        cache_get_value_name_float(j, "SaidaZ", InfoCasa[i][SaidaZ]);

	        cache_get_value_name_int(j, "Interior", InfoCasa[i][Interior]);
	        cache_get_value_name(j,"Dono", InfoCasa[i][Dono], 24);
	        
	        cache_get_value_name_int(j, "Aluguel", InfoCasa[i][Aluguel]);
	        cache_get_value_name_int(j, "PrecoCasa", InfoCasa[i][PrecoCasa]);
	        cache_get_value_name_int(j, "Trancada", InfoCasa[i][Trancada]);
	        cache_get_value_name_int(j, "CasaVip", InfoCasa[i][CasaVip]);

			InfoCasa[i][CasaCriada] = true;
			Iter_Add(B_House, i);

			new str[190];
			for(new d; d < 60; d++){
				new Query[20];
				format(Query, sizeof Query, "Item%d", d);
				cache_get_value_name_int(j, Query, InfoCasa[i][Item][d]);
				format(Query, sizeof Query, "Quantia%d", d);
				cache_get_value_name_int(j, Query, InfoCasa[i][Quantia][d]);

			}
			InfoCasa[i][PickCasa] = CreateDynamicPickup(19522, 1, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]);
			if(InfoCasa[i][CasaComprada] == 0){
				
				if(InfoCasa[i][CasaVip] > 0)
					format(str, sizeof(str), TEXTO_AVENDAV, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
				else	
					format(str, sizeof(str), TEXTO_AVENDA, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
	            
	            InfoCasa[i][CasaLabel] = CreateDynamic3DTextLabel(str, -1, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ], 3.0);
				//print(str);
			}
			else{
			    if(InfoCasa[i][PrecoCasa] > 0){
			        if(InfoCasa[i][CasaVip] > 0)
				        format(str, sizeof(str), TEXTO_AVENDAV, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
	                else
	                	format(str, sizeof(str), TEXTO_AVENDA, i, InfoCasa[i][Dono], InfoCasa[i][PrecoCasa], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]), InfoCasa[i][Aluguel]);
	                InfoCasa[i][CasaLabel] = CreateDynamic3DTextLabel(str, -1, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ], 3.0);
					//print(str);
				}
				else{
					if(InfoCasa[i][CasaVip] > 0)
				        format(str, sizeof(str), TEXTO_COMPRADOV, i, InfoCasa[i][Dono], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]),InfoCasa[i][Aluguel]);
					else
						format(str, sizeof(str), TEXTO_COMPRADO, i, InfoCasa[i][Dono], CoordZone(InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ]),InfoCasa[i][Aluguel]);

			        InfoCasa[i][CasaLabel] = CreateDynamic3DTextLabel(str, -1, InfoCasa[i][CasaX], InfoCasa[i][CasaY], InfoCasa[i][CasaZ], 3.0);
				}
			}
			AlterarCasaIcon(i);
		}
		return 1;
}
CarregarMenus(){
	new Cache:R = mysql_query(Dados, "SELECT * FROM `Menus`"); 
	if(cache_is_valid(R)){
		new rows;
		cache_get_row_count(rows);
		for(new f; f<rows; f++){
			new i = cache_return_int(f, "Menuid");
		    MenuInfo[i][MenuX] = cache_return_float(f, "MenuX");	
	   		MenuInfo[i][MenuY] = cache_return_float(f, "MenuY");
		    MenuInfo[i][MenuZ] = cache_return_float(f, "MenuZ");
		    MenuInfo[i][MVW] = cache_return_int(f, "MVW");
		    MenuInfo[i][TipoCompra] = cache_return_int(f, "TipoCompra");
			MenuInfo[i][MenuCriado] = true;	
			new str[92];
	        format(str, sizeof(str), "{60a478}%d - %s\n{ffffff}Aperte 'Y'\n",i, GetTypeLoja(i));
			MenuInfo[i][CompraLabel] = CreateDynamic3DTextLabel(str,-1, MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ], 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, MenuInfo[i][MVW]);
			MenuInfo[i][PickMenu]= CreateDynamicPickup(1239, 1, MenuInfo[i][MenuX], MenuInfo[i][MenuY], MenuInfo[i][MenuZ], MenuInfo[i][MVW]);
		    Iter_Add(MenusCriados, i);
		}
	}
	if(cache_is_valid(R))cache_delete(R);
}
CarregarCarrosAlugados(){
	new string[128], Cache: c;
	mysql_format(Dados, string, sizeof string, "SELECT * FROM `carrosalugados`");
	c = mysql_query(Dados, string);
	if(cache_is_valid(c)){
		for(new i; i < cache_num_rows(); i++){
			
			new j; // declaro a variável para atribuir o valor do ID do veiculo depois
						
			cache_get_value_name_int(i, "Vid", j);// aqui se atribui o valor do id
			//essa anotação foi feita dia 03/01/2025 kk
			cache_get_value_name_int(i, "HorasAlugado", InfoCAluguel[j][TempoDeAluguel]);

			// deleta o veiculo caso o tempo ja tenha sido expirado!
			if(InfoCAluguel[j][TempoDeAluguel] < gettime()){
				DeletarVehAluguel(j);
			}
			else{
				cache_get_value_name_float(i, "VeiculoX", InfoCAluguel[j][VeiculoPos][0]);
				cache_get_value_name_float(i, "VeiculoY", InfoCAluguel[j][VeiculoPos][1]);
				cache_get_value_name_float(i, "VeiculoZ", InfoCAluguel[j][VeiculoPos][2]);
				cache_get_value_name_float(i, "VeiculoA", InfoCAluguel[j][VeiculoPos][3]);
				cache_get_value_name(i, "Dono", InfoCAluguel[j][VeiculoDono]);
			
				cache_get_value_name_int(i, "VeiculoModelo", InfoCAluguel[j][VeiculoModelo]);
				InfoCAluguel[j][OVeiculo] = CriarVeiculo("Veiculo Aluguel Carregado", InfoCAluguel[j][VeiculoModelo], InfoCAluguel[j][VeiculoPos][0], InfoCAluguel[j][VeiculoPos][1], InfoCAluguel[j][VeiculoPos][2], InfoCAluguel[j][VeiculoPos][3], random(128), random(128), -1);//, bool:addSiren = false)
				Iter_Add(CarroDeAluguel, j);
			}
		}
	}

	AtualizarAluguelCarro();
	if(cache_is_valid(c)) cache_delete(c);
	return 1;
}
function CarregarGaragens(){
		new rows;
		cache_get_row_count(rows);

	   	for(new f; f < rows; f++){
	   		new i;
	   		cache_get_value_name_int(f, "Garagemid", i);
	   		cache_get_value_name_float(f, "GaragemX", GaragemInfo[i][GaragemX]);
	   		cache_get_value_name_float(f, "GaragemY", GaragemInfo[i][GaragemY]);
	   		cache_get_value_name_float(f, "GaragemZ", GaragemInfo[i][GaragemZ]);
	   		cache_get_value_name(f, "GaragemDono", GaragemInfo[i][GaragemDono], 24);
	   		cache_get_value_name_int(f, "GaragemPreco", GaragemInfo[i][GaragemPreco]);
	   		cache_get_value_name_int(f, "GaragemComprada", GaragemInfo[i][GaragemComprada] );
	   		cache_get_value_name_int(f, "GaragemTrancada", GaragemInfo[i][GaragemTrancada] );
	       	Iter_Add(GaragensIterator, i);
	       	
	       	new str[160];
	       	if(GaragemInfo[i][GaragemComprada])
	       		format(str, sizeof(str), TEXTO_GARAGEMCOMPRADA, i, GaragemInfo[i][GaragemDono], CoordZone(GaragemInfo[i][GaragemX],GaragemInfo[i][GaragemY],GaragemInfo[i][GaragemZ]));        	
	       	else
	       		format(str, sizeof(str), TEXTO_GARAGEMAVENDA, i, GaragemInfo[i][GaragemDono],GaragemInfo[i][GaragemPreco], CoordZone(GaragemInfo[i][GaragemX],GaragemInfo[i][GaragemY],GaragemInfo[i][GaragemZ]));
			
	       	GaragemInfo[i][GaragemTexto] = CreateDynamic3DTextLabel(str, -1,GaragemInfo[i][GaragemX],GaragemInfo[i][GaragemY],GaragemInfo[i][GaragemZ] ,10.0);//, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
		}
		
		return 1;
}
function CarregarInteriores(){
	new rows, interiores;
	cache_get_row_count(rows);
	if(rows){
		for(new d; d < rows; d++){
			new i = cache_return_int(d, "VirtualWorld");
			IntInfo[i][Vw] = i;
			cache_get_value_name(d, "NomeInterior", IntInfo[i][NomeInterior], 30);
			IntInfo[i][Interior] = cache_return_int(d, "Interiorid");
			IntInfo[i][TipoIcon] = cache_return_int(d, "TipoIcon");
			IntInfo[i][IntX] = cache_return_float(d, "IntX");
			IntInfo[i][IntY] = cache_return_float(d, "IntY");
			IntInfo[i][IntZ] = cache_return_float(d, "IntZ");
			IntInfo[i][IntsX] = cache_return_float(d, "IntsX");
			IntInfo[i][IntsY] = cache_return_float(d, "IntsY");
			IntInfo[i][IntsZ] = cache_return_float(d, "IntsZ");
			IntInfo[i][InteriorCriado] = true;

			IntInfo[i][Vw] = i;
			new stru[90];
			format(stru, sizeof(stru), "{60a478}%s\n{ffffff}Aperte 'F' para entrar.\n", IntInfo[i][NomeInterior]);
			IntInfo[i][LabelEntrada] = CreateDynamic3DTextLabel(stru, -1, IntInfo[i][IntX],IntInfo[i][IntY],IntInfo[i][IntZ],30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
			IntInfo[i][PickEntrada] = CreateDynamicPickup(19607, 1, IntInfo[i][IntX],IntInfo[i][IntY],IntInfo[i][IntZ]);
				
			format(stru, sizeof(stru), "{60a478}%s\n{ffffff}Aperte 'F' para sair.\n", IntInfo[i][NomeInterior]);
			IntInfo[i][LabelSaida] = CreateDynamic3DTextLabel(stru, -1, IntInfo[i][IntsX],IntInfo[i][IntsY],IntInfo[i][IntsZ],30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0 ,i);
			IntInfo[i][PickSaida] = CreateDynamicPickup(19607, 1, IntInfo[i][IntsX],IntInfo[i][IntsY],IntInfo[i][IntsZ], i);
			Iter_Add(B_Interiores, i);
		    IntInfo[i][Icone] = CreateDynamicMapIcon(IntInfo[i][IntX],IntInfo[i][IntY],IntInfo[i][IntZ], IntInfo[i][TipoIcon], -1, 0, 0, -1);
			
			interiores++;
		}
	}
	printf("Database: total de %d interiores criados!", interiores);
	
	return 1;
}
function CarregarMaconha(){
	new rows;
	cache_get_row_count(rows);
	if(cache_num_rows() > 0){
		
		for(new i; i < rows; i++){
			new idm;
			cache_get_value_name_int(i, "macid", idm);
			cache_get_value_name_int(i, "MacQuant", MacPlant[idm][MacQuant]);

			cache_get_value_name_float(i, "MacX", MacPlant[idm][MacPos][0]);
			cache_get_value_name_float(i, "MacY", MacPlant[idm][MacPos][1]);
			cache_get_value_name_float(i, "MacZ", MacPlant[idm][MacPos][2]);

			cache_get_value_name(i, "MacDono", MacPlant[idm][DonoMac], 24);//3409
			MacPlant[idm][AMaconha] = CreateDynamicObject(3409,MacPlant[idm][MacPos][0], MacPlant[idm][MacPos][1],MacPlant[idm][MacPos][2],0,0,0);
			new str[90];
			format(str, sizeof str, "{33aa33}Maconha De %s\n%d/250g",MacPlant[idm][DonoMac], MacPlant[idm][MacQuant]);
			MacPlant[idm][TextoMaconha] = CreateDynamic3DTextLabel(str, -1,MacPlant[idm][MacPos][0], MacPlant[idm][MacPos][1],MacPlant[idm][MacPos][2],30.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);//, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
			Iter_Add(MaconhasIterator, idm);
		}
		TimerMaconha = SetTimer("checkMac", minutos(4), true);
	}

}
function ObjectDBLoad(){
	new rows, objetoscriados=0, string[90];
	TextoGerado = true;
	cache_get_row_count(rows);
	
	if(rows > 0){
		for(new f; f<rows; f++){
		   	new i;
		   	cache_get_value_name_int(f, "Objetoid", i);
		   	ObjetoInfo[i][PIDF] = i;
		   	ObjetoInfo[i][ObjetoCriado] = true;

		    cache_get_value_name_float(f, "ObX", ObjetoInfo[i][ObX] );
		    cache_get_value_name_float(f, "ObY", ObjetoInfo[i][ObY] );
		    cache_get_value_name_float(f, "ObZ", ObjetoInfo[i][ObZ] );
		    cache_get_value_name_float(f, "RotX", ObjetoInfo[i][RotX] );
		    cache_get_value_name_float(f, "RotY", ObjetoInfo[i][RotY] );
		    cache_get_value_name_float(f, "RotZ", ObjetoInfo[i][RotZ] );
		    cache_get_value_name_int(f, "ObjetoModel", ObjetoInfo[i][ObjetoModel]);
		    ObjetoInfo[i][Objeto] = CreateDynamicObject(ObjetoInfo[i][ObjetoModel], ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ],
																							  ObjetoInfo[i][RotX], ObjetoInfo[i][RotY],ObjetoInfo[i][RotZ]);
			
			if(TextoGerado){																			  					 
				format(string, sizeof(string), "{aa33aa}Objeto {ffffff}%d (%d)", ObjetoInfo[i][PIDF], ObjetoInfo[i][ObjetoModel]);
				ObjetoInfo[i][Texto] = CreateDynamic3DTextLabel(string, -1, ObjetoInfo[i][ObX], ObjetoInfo[i][ObY], ObjetoInfo[i][ObZ]-0.3, 5.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
				objetoscriados++;
			}
		}
		printf("Database: total de %d objetos Criados!", objetoscriados);		
	}
	return 1;
}
function CarregarMoradores(){
	new rows, totalm;
	cache_get_row_count(rows);
	if(rows){
		for(new i; i < rows; i++){
			new idcasa = cache_return_int(i, "Casaid");

			for(new c; c < 4; c++){
				new str[17];
				format(str, sizeof str, "AluguelNome%d", c);
				cache_get_value_name(i, str, InfoAluguel[idcasa][c][AluguelNome], 24);
			}
			totalm++;
		}
	}
	return printf("Database: total de %d casas carregadas com moradores.", totalm);
}
function LoadOrgs(){
	new row, totalorg;
	cache_get_row_count(row);
	if(row){
		for(new i; i < row; i++){
			new id = cache_return_int(i, "OrgId");
			OrgInfo[id][OrgId] = id;
			OrgInfo[id][OrgSpawn][0] = cache_return_float(i, "OrgSpawnX");
			OrgInfo[id][OrgSpawn][1] = cache_return_float(i, "OrgSpawnY");
			OrgInfo[id][OrgSpawn][2] = cache_return_float(i, "OrgSpawnZ");
			OrgInfo[id][OrgSpawn][3] = cache_return_float(i, "OrgSpawnA");

			OrgInfo[id][OrgCofre] = cache_return_int(i, "OrgCofre");
			OrgInfo[id][VehCor] = cache_return_int(i, "VehCor");
			OrgInfo[id][MaconhaOrg] = cache_return_int(i, "Maconha");
			OrgInfo[id][Equipamentos] = cache_return_int(i, "Equipamentos");

			OrgInfo[id][OrgPickPos][0] = cache_return_float(i, "OrgPickPosX");
			OrgInfo[id][OrgPickPos][1] = cache_return_float(i, "OrgPickPosY");
			OrgInfo[id][OrgPickPos][2] = cache_return_float(i, "OrgPickPosZ");
			OrgInfo[id][OrgVw] = cache_return_int(i, "OrgVw");
			OrgInfo[id][OrgInterior] = cache_return_int(i, "OrgInterior");

			new disponibilidade = cache_return_int(i, "PickDisponivel");
			OrgInfo[id][PickDisponivel] = (disponibilidade == 1 ? (true) : (false));
			
			OrgInfo[id][Vagas] = cache_return_int(i, "Vagas");
			OrgInfo[id][OrgCriada] = true;
			////////printf("org %d foi criada com sucesso (%s)", id, OrgInfo[id][OrgNome]);
			cache_get_value_name(i, "OrgLider", OrgInfo[id][OrgLider], 24);
			if(OrgInfo[id][PickDisponivel]){
				OrgInfo[id][Pick] = CreateDynamicPickup(2485, 1, OrgInfo[id][OrgPickPos][0],OrgInfo[id][OrgPickPos][1],OrgInfo[id][OrgPickPos][2]);
				OrgInfo[id][TextoPick] = CreateDynamic3DTextLabel("{33CCFF}Pickup Organizacao\nAperte 'Y' Para acessar", -1, OrgInfo[id][OrgPickPos][0],OrgInfo[id][OrgPickPos][1],OrgInfo[id][OrgPickPos][2], 25.0);// 
			}
			for(new cargos = 1; cargos != 10; cargos++){
				new str[22];
				format(str, sizeof str, "SalarioCargo%d", cargos);
				OrgInfo[id][SalarioCargo][cargos] = cache_return_int(i, str);
			}
			for(new car; car<12; car++){
				new str[26];
				format(str, sizeof str, "VeiculoModelo%d", car);
				OrgVeiculo[id][car][VeiculoModelo] = cache_return_int(i, str);

				format(str, sizeof str, "VeiculoSpawnX%d", car);
				OrgVeiculo[id][car][VeiculoSpawn][0] = cache_return_float(i, str);

				format(str, sizeof str, "VeiculoSpawnY%d", car);
				OrgVeiculo[id][car][VeiculoSpawn][1] = cache_return_float(i, str);

				format(str, sizeof str, "VeiculoSpawnZ%d", car);
				OrgVeiculo[id][car][VeiculoSpawn][2] = cache_return_float(i, str);

				format(str, sizeof str, "VeiculoSpawnA%d", car);
				OrgVeiculo[id][car][VeiculoSpawn][3] = cache_return_float(i, str);

				
			}
			totalorg++;
		}
	}
	return printf("Database: total de %d orgs carregadas!", totalorg);
}
function LoadALLCofres(){
	new rows, tcofre=0;
	cache_get_row_count(rows);
	if(rows > 0){
		for(new i; i<rows; i++){
			new id = cache_return_int(i, "cofreid");
			cache_get_value_name(i, "CofreName", CofreInfo[id][CofreName], 32);
			CofreInfo[id][CofreMoney] = cache_return_int(i, "CofreMoney");
			CofreInfo[id][InteriorCofre] = cache_return_int(i, "CofreInterior");
			CofreInfo[id][VWCofre] = cache_return_int(i, "VWCofre");
			CofreInfo[id][CofrePos][0] = cache_return_float(i, "CofreX");
			CofreInfo[id][CofrePos][1] = cache_return_float(i, "CofreY");
			CofreInfo[id][CofrePos][2] = cache_return_float(i, "CofreZ");
			CofreInfo[id][OCofre] = CreateDynamicObject(CofreNormal, cache_return_float(i, "CofreX"), cache_return_float(i, "CofreY"), cache_return_float(i, "CofreZ"),
		 	cache_return_float(i, "CofreRx"),cache_return_float(i, "CofreRy"),cache_return_float(i, "CofreRz"), CofreInfo[id][VWCofre], CofreInfo[id][InteriorCofre]);
		 	new str[144];
		 	format(str, sizeof str, "(%d)%s\n\n{33ccff}use /roubarcofre",id, CofreInfo[id][CofreName]);
		 	CofreInfo[id][CofreTexto] = CreateDynamic3DTextLabel(str, -1, cache_return_float(i, "CofreX"), cache_return_float(i, "CofreY"), cache_return_float(i, "CofreZ"), 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, CofreInfo[id][VWCofre], CofreInfo[id][InteriorCofre]);		
			Iter_Add(B_Cofres, id);
			tcofre++;
		}

	}
	return printf("Database: total de %d cofres criados!", tcofre);
}
function CarregarEmpresas(){
	new rows, empresas=0;
	cache_get_row_count(rows);

	if(!rows) return 1;

	for(new i; i < rows; i++){
		new id = cache_return_int(i, "Empresaid");
		InfoEmpresa[id][EmpresaCriada] = true;
		InfoEmpresa[id][EmpresaValor] = cache_return_int(i, "EmpresaValor");
		InfoEmpresa[id][Ganhos] = cache_return_int(i, "EmpresaPorcentagem");
		InfoEmpresa[id][EmpresaComprada] = cache_return_int(i, "EmpresaComprada") ? (true) : (false);
		cache_get_value_name(i, "EmpresaNome", InfoEmpresa[id][EmpresaNome], 32);
		cache_get_value_name(i, "EmpresaDono", InfoEmpresa[id][EmpresaDono], 24);
		InfoEmpresa[id][EmpresaPos][0] = cache_return_float(i, "EmpresaX");
		InfoEmpresa[id][EmpresaPos][1] = cache_return_float(i, "EmpresaY");
		InfoEmpresa[id][EmpresaPos][2] = cache_return_float(i, "EmpresaZ");
		new str[400];
		if(!InfoEmpresa[id][EmpresaComprada]){
			format(str, sizeof str, TEXTO_EMPRESAAVENDA,id, InfoEmpresa[id][EmpresaNome], InfoEmpresa[id][EmpresaValor], InfoEmpresa[id][Ganhos]);
			InfoEmpresa[id][EmpresaTexto] = CreateDynamic3DTextLabel(str, -1, InfoEmpresa[id][EmpresaPos][0], InfoEmpresa[id][EmpresaPos][1], InfoEmpresa[id][EmpresaPos][2], 15.0);
		}
		else{
			//TEXTO_EMPRESACOMPRADA "(%d)%s\n{33aa33}Valor Bruto Pago: %d\nPorcentagem De Ganhos: %d\nDono: %s"
			format(str, sizeof str, TEXTO_EMPRESACOMPRADA,id, InfoEmpresa[id][EmpresaNome], InfoEmpresa[id][EmpresaValor], InfoEmpresa[id][Ganhos],InfoEmpresa[id][EmpresaDono]);
			InfoEmpresa[id][EmpresaTexto] = CreateDynamic3DTextLabel(str, -1, InfoEmpresa[id][EmpresaPos][0], InfoEmpresa[id][EmpresaPos][1], InfoEmpresa[id][EmpresaPos][2], 15.0);			
		}
		Iter_Add(Empresas, id);
		InfoEmpresa[id][EmpresaPickup] = CreateDynamicPickup(1274, 1, InfoEmpresa[id][EmpresaPos][0], InfoEmpresa[id][EmpresaPos][1], InfoEmpresa[id][EmpresaPos][2]);
		
		empresas++;
	}
	return printf("Database: total de %d empresas criadas!", empresas);
}
function CarregarCaixas(){
	new rows, caixasc=0;
	cache_get_row_count(rows);

	if(!rows) return 1;

	for(new f; f<rows; f++){
		new i = cache_return_int(f, "caixaid");
		InfoCaixa[i][CaixaCriado] = true;
		InfoCaixa[i][CaixaQuebrado] = false;
	    InfoCaixa[i][CaixaX] = cache_return_int(f, "CaixaX");
	    InfoCaixa[i][CaixaY] = cache_return_float(f, "CaixaY");
	    InfoCaixa[i][CaixaZ] = cache_return_float(f, "CaixaZ");
	    InfoCaixa[i][CaixaRX] = cache_return_float(f, "CaixaRX");
	    InfoCaixa[i][CaixaRY] = cache_return_float(f, "CaixaRY");	
	    InfoCaixa[i][CaixaRZ] = cache_return_float(f, "CaixaRZ");
	    InfoCaixa[i][CaixaGrana] = cache_return_int(f, "CaixaGrana");
		InfoCaixa[i][ObjetoCaixa] = CreateDynamicObject(19324, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ], InfoCaixa[i][CaixaRX],InfoCaixa[i][CaixaRY],InfoCaixa[i][CaixaRZ]);
	    new str[60];
	    format(str, sizeof(str), "{33ccff}Caixa Eletronico N. %d\nAperte 'Y'", i);
	    InfoCaixa[i][CaixaTexto] = CreateDynamic3DTextLabel(str, -1, InfoCaixa[i][CaixaX], InfoCaixa[i][CaixaY], InfoCaixa[i][CaixaZ], 15.0);
		Iter_Add(B_Caixas, i);
		caixasc ++;
	}
	return printf("Database: total de %d caixas carregados!", caixasc);
}
function CarregarLocais(){
 	new rows, locals=0;
 	cache_get_row_count(rows);

 	if(!rows) return 1;

	for(new f; f<rows; f++){
		new i = cache_return_int(f, "gpsid");
		GpsInfo[i][gpsid] = i;
		GpsInfo[i][LocalX] = cache_return_float(f, "LocalX");
		GpsInfo[i][LocalY] = cache_return_float(f, "LocalY");
		GpsInfo[i][LocalZ] = cache_return_float(f, "LocalZ");
		GpsInfo[i][LocalTipo] = cache_return_int(f, "LocalTipo");
		cache_get_value_name(f, "LocalName", GpsInfo[i][LocalName], 32);
		
		GpsInfo[i][LocalCriado] = true;
		locals++;
	}
	return printf("Database: total de %d locais carregados!", locals);
}
function ConectarPortoes(){
	new rows, portoes=0;
	cache_get_row_count(rows);

	if(!rows) return 1;

	for(new i; i<rows; i++){
	    new id = cache_return_int(i, "PortaoID");
		InfoPortao[id][Px] = cache_return_int(i, "Px");
		InfoPortao[id][Py] = cache_return_int(i, "Py");
		InfoPortao[id][Pz] = cache_return_int(i, "Pz");

		InfoPortao[id][Pxr] = cache_return_int(i, "Pxr");
		InfoPortao[id][Pyr] = cache_return_int(i, "Pyr");
		InfoPortao[id][Pzr] = cache_return_int(i, "Pzr");
		InfoPortao[id][PortaoID] = id;

		InfoPortao[id][PortaoCriado] = true;
		InfoPortao[id][OPortao] = CreateDynamicObject(980, InfoPortao[id][Px], InfoPortao[id][Py], InfoPortao[id][Pz], InfoPortao[id][Pxr], InfoPortao[id][Pyr], InfoPortao[id][Pzr]);
		new str[87];
		cache_get_value_name(i, "Dono", InfoPortao[id][DonoPortao], 24);
		cache_get_value_name(i, "Senha", InfoPortao[id][SenhaPortao], 32);
       	format(str, sizeof(str), "%s\n%s{33ccff}ID %d\n%s", InfoPortao[id][DonoPortao], InfoPortao[id][PortaoID], CoordZone(InfoPortao[id][Px], InfoPortao[id][Py], InfoPortao[id][Pz]));
       	InfoPortao[id][PortaoText] = CreateDynamic3DTextLabel(str, -1,InfoPortao[id][Px], InfoPortao[id][Py], InfoPortao[id][Pz], 30.0);
		Iter_Add(B_Portao, id);
		//////////printf("Portao ID %d(%s) foi criado. (%d)", i, InfoPortao[id][DonoPortao],InfoPortao[id][OPortao]);
		
	}
	return printf("Database: total de %d portoes criados!", portoes);
}
function CarregarGzs(){
	new totalgz;
	new row = cache_num_rows();
	if(!row)
		return printf("#GANGZONES Total de '%d' (NENHUM) gangzones criadas!", 0);
	
	for(new id; id < row; id++){
	    cache_get_value_name_float(id, "Gzx", GzInfo[id][Gzx]);
	    cache_get_value_name_float(id, "Gzy", GzInfo[id][Gzy]);
	    cache_get_value_name_float(id, "Gzxx", GzInfo[id][Gzxx]);
	    cache_get_value_name_float(id, "Gzyy", GzInfo[id][Gzyy]);
		GzInfo[id][gzid] = id;
		cache_get_value_name(id, "GZNome", GzInfo[id][GZNome], 32);
		cache_get_value_name_int(id, "DonoGz", GzInfo[id][DonoGz]);
		GzInfo[id][OGZ] = GangZoneCreate(GzInfo[id][Gzx], GzInfo[id][Gzy], GzInfo[id][Gzxx], GzInfo[id][Gzyy]);
		Iter_Add(Gangzoness, id);
		
		totalgz++;			
	}
	
	
	return printf("#GANGZONES Total de '%d' (%d rows) gangzones criadas!", totalgz, row);
}
forward Iniciardatabases();
public Iniciardatabases(){
	mysql_log(ALL);
	Dados = mysql_connect(host, login, senha, database);
	if(mysql_errno() == 0){
		printf("Database MYSQL '%s' foi carregada com sucesso.", database);
	}
	else{
		printf("Database MYSQL '%s' obteve falha na conexão!", database);
	}

	Mafia = DB_Open("Mafia.db");
	ContratosDb = DB_Open("Contratos.db");

}
forward CarregarDadosdoDB();
public CarregarDadosdoDB(){
	LoadContratos();
 	CarregarMenus();
 	CarregarMafia();
	CarregarCarrosAlugados(); 
	// LoadCasas

	mysql_pquery(Dados, "SELECT * FROM `Casas`;", "LoadCasas");
	mysql_tquery(Dados, "SELECT * FROM `Garagens`;", "CarregarGaragens");
	mysql_tquery(Dados, "SELECT * FROM `Interiores`;", "CarregarInteriores");
	mysql_tquery(Dados, "SELECT * FROM `Maconhas`;", "CarregarMaconha");
	mysql_pquery(Dados, "SELECT * FROM `Casas`;", "CarregarMoradores");
	mysql_pquery(Dados, "SELECT * FROM `Orgs`;", "LoadOrgs");
	mysql_tquery(Dados, "SELECT * FROM `Objetos`;", "ObjectDBLoad");
	mysql_tquery(Dados, "SELECT * FROM `Cofres`;", "LoadALLCofres");
	mysql_tquery(Dados, "SELECT * FROM `Empresas`;", "CarregarEmpresas");
	mysql_tquery(Dados, "SELECT * FROM `Caixas`;", "CarregarCaixas");
	mysql_pquery(Dados, "SELECT * FROM `Gps`;", "CarregarLocais");
	mysql_tquery(Dados, "SELECT * FROM `Portoes`;", "ConectarPortoes");
	mysql_tquery(Dados, "SELECT * FROM `Gangzones`;", "CarregarGzs");

	mysql_terminou = true;
}
function CloseDbs(){
	mysql_close(Dados);

	Dados = MySQL: 0;

    DB_Close(Mafia);
    Mafia = DB:0;
    
    DB_Close(ContratosDb);
    ContratosDb = DB:0;
    return 1;
}
//backup de querys
	/*mysql_tquery(Dados, "CREATE TABLE IF NOT EXISTS carrosalugados (Vid int PRIMARY KEY,\
		Dono varchar(24) NOT NULL,\
		VeiculoModelo int DEFAULT 0,\
		VeiculoX double DEFAULT 0.0,\
		VeiculoY double DEFAULT 0.0,\
		VeiculoZ double DEFAULT 0.0,\
		VeiculoA double DEFAULT 0.0,\
		HorasAlugado int DEFAULT 0);");*/
	/*DB_ExecuteQuery(ContratosDb, "CREATE TABLE IF NOT EXISTS Contratos (\
		Contratoid INT PRIMARY KEY DEFAULT 0,\
		Alvo INT DEFAULT 0, \
		ValorAlvo INT DEFAULT 0, \
		Contratante TEXT DEFAULT '', \
		Faccao INT DEFAULT 0);");*/
	
	/*DB_ExecuteQuery(Mafia, "CREATE TABLE Mafia (\
	Equipamentos	INTEGER DEFAULT 0,\
	Drogas	INTEGER DEFAULT 0,\
	VeiculoModel	INTEGER DEFAULT 0,\
	orgid	INTEGER DEFAULT 0,\
	TempoEntrega0	INTEGER DEFAULT 0,\
	TempoEntrega1	INTEGER DEFAULT 0,\
	TempoEntrega2	INTEGER DEFAULT 0,\
	encid	INTEGER DEFAULT 0)");*/