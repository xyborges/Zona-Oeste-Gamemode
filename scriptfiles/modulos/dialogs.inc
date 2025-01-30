public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid){
		case DIALOG_ESCOLHER_OPCAO:{
			if(response){
				switch(listitem){
					case 0:{
						EsconderInventario(playerid);
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
					}
					case 1:{
						if(PlayerInfo[playerid][Admin] < 1) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este sistema ainda esta sendo desenvolvido!");
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
					PC_EmulateCommand(playerid, "menuempresa");
					SCM(playerid, LIGHTBLUE, "Nome invalido!");
					return 1;
				}
				if(!strcmp(nome(playerid), InfoEmpresa[empresa][EmpresaDono])){
					format(InfoEmpresa[empresa][EmpresaNome], 32, inputtext);
					AtualizarTextEmpresa(empresa);
					SCM(playerid, LIGHTBLUE, fString("Novo nome da empresa: %s", inputtext));
					PC_EmulateCommand(playerid, "menuempresa");
					SalvarEmpresa(empresa);
				}
			}
			else
				PC_EmulateCommand(playerid, "menuempresa");
		}
		case DIALOG_CONFIMARVENDAEMRPESA:{
			if(response){
				new empresa = GetPVarInt(playerid, "SuaEmpresa");
				if(!strcmp(nome(playerid), InfoEmpresa[empresa][EmpresaDono])){
					new Float: conta = (0.3) * float(InfoEmpresa[empresa][EmpresaValor]);
					GivePlayerCash(playerid, floatround(conta));
					SCM(playerid, LIGHTBLUE, fString("Voce acaba de vender sua empresa e ganhou %dR$ em cima dela.", floatround(conta)));
					ResetarEmpresa(empresa);		
				}
				else
					SCM(playerid, LIGHTBLUE, "Voce nao e o dono da empresa.");
			}
			else
				PC_EmulateCommand(playerid, "menuempresa");
		}
		case DIALOG_QUANTIACOMPRAR:{
			if(response){

			}
		}
		case DIALOG_OPCOES_EMPRESA:{
	// Mudar Nome\nAumentar Lucro(90000$)\nTrocar Dono\n{ff0000}Vender Empresa
			if(response){
				switch(listitem){
					case 0:{
						ShowPlayerDialog(playerid, DIALOG_TROCARNOMEEMPRESA, DIALOG_STYLE_INPUT, 
						"{33ccff}Troque o nome", "{fff000}Digite a seguir o nome da nova empresa!\n{ff0000}Limite de 25 caracteres.", "Ok", "Sair");
					}
					case 1:{
						new empresa = GetPVarInt(playerid, "SuaEmpresa");
						if(!strcmp(nome(playerid), InfoEmpresa[empresa][EmpresaDono])){
							if(InfoEmpresa[empresa][EmpresaLucro] < 1) return SCM(playerid, LIGHTBLUE, "A Empresa nao possui dinheiro.");
							GivePlayerCash(playerid, InfoEmpresa[empresa][EmpresaLucro]);
							SCM(playerid, VerdeSamp, fString("Voce sacou %dR$ do cofre da empresa.", InfoEmpresa[empresa][EmpresaLucro]));
							InfoEmpresa[empresa][EmpresaLucro] = 0;
							SalvarEmpresa(empresa);
							PC_EmulateCommand(playerid, "menuempresa");
						}
						else
							SCM(playerid, LIGHTBLUE, "Voce nao e o dono da empresa.");
						
					}
					case 2:{
						new empresa = GetPVarInt(playerid, "SuaEmpresa");
						if(GetPlayerCash(playerid) < 60000) return SCM(playerid, LIGHTBLUE, "Voce precisa de 60.000R$ para aumentar os ganhos da sua empresa.");
						if(PlayerInfo[playerid][Vip] == 0 && InfoEmpresa[empresa][Ganhos] >= 15000) return SCM(playerid, LIGHTBLUE, "O Maximo de ganhos desta empresa foi atingido. Compre vip para poder aumentar.");
						if(PlayerInfo[playerid][Vip] == 1 && InfoEmpresa[empresa][Ganhos] >= 23000) return SCM(playerid, LIGHTBLUE, "O Maximo de ganhos desta empresa foi atingido. Compre vip para poder aumentar.");
						if(PlayerInfo[playerid][Vip] == 2 && InfoEmpresa[empresa][Ganhos] >= 30000) return SCM(playerid, LIGHTBLUE, "O Maximo de ganhos desta empresa foi atingido. Compre vip para poder aumentar.");
						if(PlayerInfo[playerid][Vip] == 3 && InfoEmpresa[empresa][Ganhos] >= 50000) return SCM(playerid, LIGHTBLUE, "O Maximo de ganhos desta empresa foi atingido.");
						if(!strcmp(nome(playerid), InfoEmpresa[empresa][EmpresaDono])){
							GivePlayerCash(playerid, -90000);
							new Float: continha = (0.12 * InfoEmpresa[empresa][Ganhos]);
							InfoEmpresa[empresa][Ganhos] += floatround(continha);
							InfoEmpresa[empresa][EmpresaValor] += 25000;
							SCM(playerid, LIGHTBLUE, "Voce aumentou a porcentagem de ganhos da sua empresa em 12 por cento.");
							SendClientMessageToAll(LIGHTBLUE, "* A Empresa %s acaba de ter uma valorizacao de 25.000R$.", InfoEmpresa[empresa][EmpresaNome]);
							SalvarEmpresa(empresa);
							AtualizarTextEmpresa(empresa);

							return 1;
						}
						else
							SCM(playerid, LIGHTBLUE, "Voce nao e o dono desta empresa.");
					}
					case 3:{
						ShowPlayerDialog(playerid, DIALOG_ACHAR_NEGOEmpresa, DIALOG_STYLE_INPUT, "Jogadores", "Digite o id do jogador que deseja oferecer a empresa", "Ok", "Voltar");
					}
					case 4:{
						ShowPlayerDialog(playerid, DIALOG_CONFIMARVENDAEMRPESA, DIALOG_STYLE_MSGBOX, "{ff0000}AVISO", "{ff0000}Gostaria mesmo de vender sua empresa? esta acao e irreversivel.", "Sim", "Nao...");
					}
					default: SCM(playerid, LIGHTBLUE, "Ainda em desenvolvimento.");
				}
			}
		}
		case DIALOG_ACHAR_NEGOEmpresa:{
			if(!response) return PC_EmulateCommand(playerid, "menuempresa");
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
					SCM(playerid, LIGHTBLUE, "Nao encontrado.");
					PC_EmulateCommand(playerid, "menuempresa");
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
					SCM(playerid, LIGHTBLUE, "Este jogador ficou offline ou esta muito longe de voce.");
					PC_EmulateCommand(playerid, "menuempresa");
				}
				else{
					format(InfoEmpresa[empresa][EmpresaDono], MAX_PLAYER_NAME, nome(usuario));
					SCM(playerid, VerdeSamp, fString("Voce passou a posse da empresa para %s.", nome(usuario)));
					SCM(usuario, VerdeSamp, fString("A posse da empresa %s de %s foi passada para voce.", InfoEmpresa[empresa][EmpresaNome], nome(playerid)));
					AtualizarTextEmpresa(empresa);
					SCM(usuario, LIGHTBLUE, "Voce acaba de adquirir uma nova empresa.");
				}
			}
			else{
				PC_EmulateCommand(playerid, "menuempresa");
			}
		}
		case DIALOG_COMPRAR_EMPRESA:{
			if(response){
				new empresa = GetPVarInt(playerid, "Empresaselect");
				if(!InfoEmpresa[empresa][EmpresaCriada]){
					SetPVarInt(playerid, "Empresaselect", -1);
					SCM(playerid, LIGHTBLUE, "Esta empresa nao existe mais.");
					return 1;
				}
				if(InfoEmpresa[empresa][EmpresaComprada]){
					SetPVarInt(playerid, "Empresaselect", -1);
					SCM(playerid, LIGHTBLUE, "Alguem ja comprou esta empresa.");
					return 1;
				}
				else if(GetPlayerCash(playerid) < InfoEmpresa[empresa][EmpresaValor]){
					SetPVarInt(playerid, "Empresaselect", -1);
					SCM(playerid, LIGHTBLUE, "Voce nao possui dinheiro suficiente.");
					return 1;
				}
				else{
					InfoEmpresa[empresa][EmpresaComprada] = true;
					format(InfoEmpresa[empresa][EmpresaDono], MAX_PLAYER_NAME, nome(playerid));
					GivePlayerCash(playerid, -InfoEmpresa[empresa][EmpresaValor]);
					SCM(playerid, LIGHTBLUE, fString("Voce comprou a empresa %s", InfoEmpresa[empresa][EmpresaNome]));
					AtualizarTextEmpresa(empresa);	
				}
			}
		}
		case DIALOG_KICK: Kick(playerid);
		case DIALOG_CRIARCONTABANCO:{
			if(response){
				if(PossuiContaBanco(playerid)) return SCM(playerid, LIGHTBLUE, "Voce ja possui conta no banco!");
				CriarContaBanco(playerid);

			}
			else
				SCM(playerid, LIGHTBLUE, "Voce cancelou a criacao da conta.");
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
				if(MochilaCheia(playerid)) return SCM(playerid, LIGHTBLUE, "* Sua mochila esta cheia!");
				switch(listitem){
					case 0:{
						if(GetPlayerCash(playerid) < 30) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -30);
						AdicionarItem(playerid, PIZZA, 1);
						SCM(playerid, LIGHTBLUE, "Lanchonete > Voce comprou uma PIZZA!");
					}
					case 1:{
						if(GetPlayerCash(playerid) < 15) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -15);
						AdicionarItem(playerid, HAMBURGUER, 1);
						SCM(playerid, LIGHTBLUE, "Lanchonete > Voce comprou um HAMBURGUER!");
						
					}
					case 2:{
						if(GetPlayerCash(playerid) < 5) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -5);
						AdicionarItem(playerid, COXINHA, 1);
						SCM(playerid, LIGHTBLUE, "Lanchonete > Voce comprou uma COXINHA!");
					}
					case 3:{
						if(GetPlayerCash(playerid) < 18) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -18);
						AdicionarItem(playerid, PRATO_FEITO, 1);
						SCM(playerid, LIGHTBLUE, "Lanchonete > Voce comprou um Prato-Feito!");
					}
					case 4:{
						if(GetPlayerCash(playerid) < 15) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -15);
						AdicionarItem(playerid, FEIJOADA, 1);
						SCM(playerid, LIGHTBLUE, "Lanchonete > Voce comprou uma FEIJOADA!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 15);
					}
					case 5:{
						if(GetPlayerCash(playerid) < 6) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -6);
						AdicionarItem(playerid, BAURU, 1);
						SCM(playerid, LIGHTBLUE, "Lanchonete > Voce comprou um BAURU!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 6);
					}
				}
			}
		}
		case DIALOG_BEBIDAS:{
			if(response){
				switch(listitem){
					case 0:{
						if(GetPlayerCash(playerid) < 6) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -6);
						AdicionarItem(playerid, COCA_COLA, 1);
						SCM(playerid, LIGHTBLUE, "Bar > Voce comprou uma Coca-Cola!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 6);
					}
					case 1:{
						if(GetPlayerCash(playerid) < 6) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -6);
						AdicionarItem(playerid, PEPSI, 1);
						SCM(playerid, LIGHTBLUE, "Bar > Voce comprou uma PEPSI!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 6);
					}
					case 2:{
						if(GetPlayerCash(playerid) < 4) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -4);
						AdicionarItem(playerid, SUCO_LARANJA, 1);
						SCM(playerid, LIGHTBLUE, "Bar > Voce comprou um Suco De Laranja!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 4);
					}
					case 3:{
						if(GetPlayerCash(playerid) < 4) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -4);
						AdicionarItem(playerid, SUCO_MARACUJA, 1);
						SCM(playerid, LIGHTBLUE, "Bar > Voce comprou um Suco De Maracuja!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 4);
					}
					case 4:{
						if(GetPlayerCash(playerid) < 9) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -9);
						AdicionarItem(playerid, AGUA, 1);
						SCM(playerid, LIGHTBLUE, "Bar > Voce comprou uma Agua!");
						//(playerid, GetPVarInt(playerid, "Menuid"), 9);
					}
					case 5:{
						if(GetPlayerCash(playerid) < 12) return SCM(playerid, LIGHTBLUE, "* Voce nao possui dinheiro suficiente.");
						GivePlayerCash(playerid, -12);
						AdicionarItem(playerid, CERVEJA, 1);
						SCM(playerid, LIGHTBLUE, "Bar > Voce comprou uma Cerveja!");
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
				SCM(playerid, COR_COPOM, str);
				Couros[playerid] = 0;
				GameTextForPlayer(playerid, "~B~PayDay aumentado!", 3000, 3);
			}
		}
		case DIALOG_GENERO:{
			if(response){
				if(listitem == 0){	
					PlayerInfo[playerid][Genero] = MASCULINO;
					SCM(playerid, VerdeSamp, "Voce escolheu o genero Masculino.");
					SetPlayerSkin(playerid, PlayerInfo[playerid][Skin]);
				}
				if(listitem == 1){
					PlayerInfo[playerid][Genero] = FEMININO;
					SCM(playerid, VerdeSamp, "Voce escolheu o genero Feminino.");
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
							if(VehInfo[i][j][Apreendido]) return SCM(playerid, LIGHTBLUE, "* Este veiculo ja esta Apreendido.");
							new Float: x, Float: y, Float: z;
							GetVehiclePos(VehInfo[i][j][Carro], x, y, z);
							if(!ISP(playerid, 20.0, x, y, z)) return SCM(playerid, LIGHTBLUE, "* Voce precisa estar ate 20 metros do veiculo.");
							if(VehInfo[i][j][IPVA] >= conta){
								VehInfo[i][j][Apreendido] = true;
								new str2[90];
								format(str2, sizeof str2, "%s apreendeu seu veiculo com %dR$ De IPVA!", nome(playerid), VehInfo[i][j][IPVA]);
								SCM(i, LIGHTBLUE, str2);								
								DestroyVehicleEx(VehInfo[i][j][Carro], "Apreencao De Veiculo");
								achada = i;
								SCM(playerid, LIGHTBLUE, "* Voce apreendeu este veiculo com sucesso.");
								break;
							}
							else{
								SCM(playerid, LIGHTBLUE, "* Este veiculo possui muito pouco IPVA para ser pago para ser Apreendido.");
								break;
							}
						}
					}
				}
				if(achada == -1) return SCM(playerid, LIGHTBLUE, "* Esta placa nao foi achada na cidade ( Dono off possivelmente)");
			}
		}
		case DIALOG_TITULOS:{
			if(response){
				switch(listitem){
					case 0:{
						format(PlayerInfo[playerid][Titulo], 32, "");
						PC_EmulateCommand(playerid, "titulos");
						SCM(playerid, LIGHTBLUE, "* Voce tirou o seu titulo.");
					}
					case 1:{
						if(PlayerInfo[playerid][Emprego] != 0){
							format(PlayerInfo[playerid][Titulo], 32, "%s", EmpName(playerid));
							SCM(playerid, VerdeSamp, "SUCESSO! Voce alterou seu titulo para o nome do Emprego.");
							PC_EmulateCommand(playerid, "titulos");
						}
						else{
							SCM(playerid, LIGHTBLUE, "* Voce nao possui Emprego.");
							PC_EmulateCommand(playerid, "titulos");
						}
					}
					case 2:{
						if(PlayerInfo[playerid][Admin] != 0){
							format(PlayerInfo[playerid][Titulo], 32, "%s", StaffCargo(PlayerInfo[playerid][Admin]));
							SCM(playerid, VerdeSamp, "SUCESSO! Voce alterou seu titulo para Admin.");
							PC_EmulateCommand(playerid, "titulos");							
						}
						else{
							SCM(playerid, LIGHTBLUE, "* Voce nao e admin.");
							PC_EmulateCommand(playerid, "titulos");
						}
					}
					case 3:{
						if(PlayerInfo[playerid][Vip] != 0){
							format(PlayerInfo[playerid][Titulo], 32, "%s", Infosvip[PlayerInfo[playerid][Vip]][NomeVip]);
							SCM(playerid, VerdeSamp, "SUCESSO! Voce alterou seu titulo para VIP.");
							PC_EmulateCommand(playerid, "titulos");							
						}
						else{
							SCM(playerid, LIGHTBLUE, "* Voce nao e VIP.");
							PC_EmulateCommand(playerid, "titulos");
						}
					}
					case 4:{
						if(GetPlayerCash(playerid) >= 1000000 || BancoInfo[playerid][Dinheiro] >= 1000000 || (PlayerInfo[playerid][Vip] + GetPlayerCash(playerid)) >= 1000000){
							format(PlayerInfo[playerid][Titulo], 32, "{fff000}Milionario");// Infosvip[PlayerInfo[playerid][Vip]][NomeVip]);
							SCM(playerid, VerdeSamp, "SUCESSO! Voce alterou seu titulo para Milionario.");
							PC_EmulateCommand(playerid, "titulos");							
						}
						else{
							SCM(playerid, LIGHTBLUE, "* Voce nao e Milionario.");
							PC_EmulateCommand(playerid, "titulos");
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
								SCM(playerid, LIGHTBLUE, "* Voce nao possui Coins para editar um titulo personalizado.");
								PC_EmulateCommand(playerid, "titulos");
							}
						}
					}
				}
			}
		}
		case DIALOG_TITULOPERSONALIZADOE:{
			if(response){
				if(strlen(inputtext) > 90 || !strlen(inputtext)){
					PC_EmulateCommand(playerid, "titulos");
					SCM(playerid, LIGHTBLUE, "* Este titulo e muito grande ou nao tem tamanho.");
				}
				else{
					format(PlayerInfo[playerid][TituloPersonalizado], 90, "%s", inputtext);
					SCM(playerid, LIGHTBLUE, "* Sucesso! Voce editou seu Titulo.");
					new str[144];
					format(str, sizeof str, "%s editou seu titulo personalizado.", nome(playerid));
					SendClientMessageToAll(VerdeSamp, str);
					PC_EmulateCommand(playerid, "titulos");
					SalvarConta(playerid);
				}
			}
		}
		case DIALOG_TITULOPERSONALIZADO:{
			if(response){
				if(strlen(inputtext) > 90 || !strlen(inputtext) || PlayerInfo[playerid][Cash] < 5){
					PC_EmulateCommand(playerid, "titulos");
					SCM(playerid, LIGHTBLUE, "* Este titulo e muito grande, nao tem tamanho ou voce nao possui Coins suficientes.");
				}
				else{
					PlayerInfo[playerid][Cash] -= 5;
					format(PlayerInfo[playerid][TituloPersonalizado], 90, "%s", inputtext);
					SCM(playerid, LIGHTBLUE, "* Sucesso! Voce editou seu Titulo.");
					new str[144];
					format(str, sizeof str, "%s editou seu titulo personalizado.", nome(playerid));
					SendClientMessageToAll(VerdeSamp, str);
					PC_EmulateCommand(playerid, "titulos");
					SalvarConta(playerid);
				}
			}
		}
		case DIALOG_SETAR_DINHEIRO:{
			new usuario[MAX_PLAYER_NAME];
			GetPVarString(playerid, "Configurado", usuario, MAX_PLAYER_NAME);
			if(!response) return PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
			if(response){
				new valor = strval(inputtext);
				if(!Number(inputtext) || valor < 0){
					PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
					
					SCM(playerid, LIGHTBLUE, "* Este valor e invalido.");
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
						mysql_format(Dados, Query, sizeof Query, "SELECT `Nome` FROM `contas` WHERE `Nome` = '%s'", usuario);
						cache = mysql_query(Dados, Query);
						new rows = cache_num_rows();
						if(cache_is_valid(cache) && rows){
							mysql_format(Dados, Query, sizeof Query, "UPDATE `contas` SET `Dinheiro` = `Dinheiro` + `'%d'` WHERE `Nome` = '%s'",
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
						SCM(achou, Rosa, str);
						format(str, sizeof str, "Voce setou %dR$ para %s", valor, nome(achou));
						SCM(playerid, Rosa, str);
						PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
					}
				}
			}
		}
		case DIALOG_CONSULTARCONTA:{
			if(response || !response){
				new usuario[MAX_PLAYER_NAME];
				GetPVarString(playerid, "Configurado", usuario, MAX_PLAYER_NAME);
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
						new Query[90], Cache: R, str[144], usuario[MAX_PLAYER_NAME], LLogin[32];
						GetPVarString(playerid, "Configurado", usuario, MAX_PLAYER_NAME);
						mysql_format(Dados,Query, sizeof Query, "SELECT * FROM `contas` WHERE `Nome` = '%e'", usuario);
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
						new usuario[MAX_PLAYER_NAME];
						GetPVarString(playerid, "Configurado", usuario, MAX_PLAYER_NAME);
						new achado = -1;
						foreach(new i: Player){
							if(!strcmp(nome(i), usuario)){
								achado = i;
							}
						}
						if(achado != -1){
							PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
							SCM(playerid, LIGHTBLUE, "* Voce nao pode deletar a conta de um jogador online!");
						}
						else{
							new Query[99];
							mysql_format(Dados, Query, sizeof Query, "DELETE FROM `contas` WHERE `Nome` = '%e'",usuario);
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

						    SCM(playerid, LIGHTBLUE, "* A Conta do jogador foi deletada do servidor.");
						}
					}

					case 3:{
						new usuario[MAX_PLAYER_NAME];
						GetPVarString(playerid, "Configurado", usuario, MAX_PLAYER_NAME);
						new achado = -1;
						foreach(new i: Player){
							if(!strcmp(nome(i), usuario)){
								achado = i;
							}
						}
						if(achado != -1){
							PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
							SCM(playerid, LIGHTBLUE, "* Este jogador esta online, use /daradmin.");
						}
						else{
							new Query[99];
							mysql_format(Dados,Query, sizeof Query, "UPDATE `contas` SET `Admin` = '0' WHERE `Nome` = '%s'",usuario);
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
						mysql_format(Dados, Query, sizeof Query, "UPDATE `contas` SET `Cash` = `Cash` + '5' WHERE `Admin` > 0");	
						mysql_tquery(Dados, Query);
						format(Query, sizeof Query, "%s setou 5 Coins para todos os Staffs.", nome(playerid));
						AdminMessage(ColorStaff(11), Query);
						
						new usuario[MAX_PLAYER_NAME];
						GetPVarString(playerid, "Configurado", usuario, MAX_PLAYER_NAME);
						PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));
					}
					case 5:{
						foreach(new i: Player){
							if(PlayerInfo[i][Admin] != 0){
								GivePlayerCash(i, 5000);
							}
						}
						new Query[99];
						mysql_format(Dados, Query, sizeof Query, "UPDATE `contas` SET `Dinheiro` = `Dinheiro` + '5000' WHERE `Admin` > 0");	
						mysql_tquery(Dados, Query);
						format(Query, sizeof Query, "%s setou 5000$ para todos os Staffs.", nome(playerid));
						AdminMessage(ColorStaff(11), Query);
						new usuario[MAX_PLAYER_NAME];
						GetPVarString(playerid, "Configurado", usuario, MAX_PLAYER_NAME);
						PC_EmulateCommand(playerid, fString("menuscripterss %s", usuario));	
					}
					case 6:{
						new usuario[MAX_PLAYER_NAME];
						GetPVarString(playerid, "Configurado", usuario, MAX_PLAYER_NAME);
						new achado = -1;
						foreach(new i: Player){
							if(!strcmp(nome(i), usuario)){
								PlayerInfo[i][Admin] = 0;
								ResetPlayerCash(i);
								PlayerInfo[playerid][Cash] = 0;
								PlayerInfo[playerid][Vip] = 0;
								SCM(i, LIGHTBLUE, "* Voce teve alguns dados resetados por um Admin.");
								SCM(i, LIGHTBLUE, "* Voce teve alguns dados resetados por um Admin.");
								SCM(i, LIGHTBLUE, "* Voce teve alguns dados resetados por um Admin.");
								SCM(i, LIGHTBLUE, "* Voce teve alguns dados resetados por um Admin.");
							}
						}
						if(achado == -1){
							new Query[140];
							mysql_format(Dados, Query, sizeof Query, "UPDATE `contas` SET `Admin` = '0', `Cash` = '0', `Dinheiro` = '0', `Vip` = '0' WHERE `Nome` = '%s'",usuario);
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
					SCM(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
					PC_EmulateCommand(playerid, "menu");

				}
				else if(Acessorios[id][VipAcessorio] && PlayerInfo[playerid][Vip] == 0){
					SCM(playerid, LIGHTBLUE, "* Este acessorio e apenas para Vips.");
					PC_EmulateCommand(playerid, "menu");
				}
				else if(MochilaCheia(playerid)){
					SCM(playerid, LIGHTBLUE, "* Voce esta com a sua Mochila cheia.");
					PC_EmulateCommand(playerid, "menu");
				}
				else{
					GivePlayerCash(playerid, -Acessorios[id][AcessorioPreco]);
					AdicionarItem(playerid, Acessorios[id][AcessorioId], 1);
					SCM(playerid, LIGHTBLUE, "* Voce comprou um acessorio com Sucesso.");
					PC_EmulateCommand(playerid, "mochila");
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
						SCM(playerid, LIGHTBLUE, "* Editado com sucesso.");

						PC_EmulateCommand(playerid, "acessorios");
					}
				}
			}
		}
		case DIALOG_OPEDITAR:{
			if(!response) return PC_EmulateCommand(playerid, "acessorios");
			if(response){
				new acessorio = GetPVarInt(playerid, "AcesEdit");
				switch(listitem){
					case 0:{
						EditAttachedObject(playerid, acessorio);
						SCM(playerid, LIGHTBLUE, "* Voce comecou a editar este acessorio.");
					}
					case 1:{
						for(new i; i <14; i++){
							PlayerTextDrawShow(playerid, EditorAO[playerid][i]);
						}
						TipoEdicao[playerid] = 1;
						SelectTextDraw(playerid, Rosa);
						SCM(playerid, LIGHTBLUE, "* Voce comecou a editar este objeto.");
						SCM(playerid, COR_SCRIPTER, "Use /finalizaredicao para terminar a edicao.");
						SCM(playerid, COR_SCRIPTER, "Use /finalizaredicao para terminar a edicao.");
						SCM(playerid, COR_SCRIPTER, "Use /finalizaredicao para terminar a edicao.");
					}
				}
			}
		}
		case DIALOG_OPCOES_EDITAC:{
			if(!response) return PC_EmulateCommand(playerid, "acessorios");
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
						ShowPlayerDialog(playerid, DIALOG_SUBS_LOCAL,5, "{fff000}Escolhendo Local", grandestr, "Ok", "Retorno");
					}
					case 2:{
						if(MochilaCheia(playerid)){
							SCM(playerid, LIGHTBLUE, "* Sua Mochila esta cheia!");
							PC_EmulateCommand(playerid, "acessorios");
						}
						else if(PlayerInfo[playerid][Mochila] == 0){
							SCM(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						}
						else{
							AdicionarItem(playerid, ao[playerid][acessorio][modelindex], 1);
							RemovePlayerAttachedObjectEx(playerid, acessorio);
							SCM(playerid, LIGHTBLUE, "* Voce guardou este acessorio no Inventario.");
							PC_EmulateCommand(playerid, "mochila");
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
					SCM(playerid, LIGHTBLUE, "* Slot invalido para editar.");
					PC_EmulateCommand(playerid, "acessorios");
				}
			}
		}
		case DIALOG_ABASTECER:{
			if(response){
				new value = strval(inputtext), id = GetPVarInt(playerid, "QPosto");
				if(!Number(inputtext) || value < 1 || value > (GetPlayerCash(playerid) * 5) || value > 100 || (value + VeiculoInfo[GetPlayerVehicleID(playerid)][Gasolina]) > 100){
					PC_EmulateCommand(playerid, "abastecer");
					SCM(playerid, LIGHTBLUE, "* Voce digitou uma quantia invalida OU nao tem dinheiro suficiente para Reabastecer");
				}
				if(id == 14 && PlayerInfo[playerid][Emprego] != TAXISTA){
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao pode usar este posto de gasolina.");
					PC_EmulateCommand(playerid, "menu");
				}
				if(id != 14 && value > PostoI[id][CombustivelDisponivel]){
					PC_EmulateCommand(playerid, "menu");
					SCM(playerid, LIGHTBLUE, fString("* Este posto de gasolina tem somente %d Litros de combustivel.", PostoI[id][CombustivelDisponivel]));
				}
				else{
					if(VehOpcao(GetPlayerVehicleID(playerid), VEICULO_LIGADO)) return SCM(playerid, LIGHTBLUE, "* Voce precisa desligar o Motor!");
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
							PC_EmulateCommand(playerid, "menu");
							SCM(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente ou nao precisa de tratamento.");
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
					new conta = 20 * PlayerInfo[playerid][Vip], cont, id = GetPVarInt(playerid, "ListaIdHouse"), casa = DentroDeCasa[playerid];
					if(conta == 0) conta = 20;
		        	for(new i; i<conta; i++){
		        		if(ItemInfo[playerid][i][Item] != NADA){
				        	if(listitem == i){
				        		cont++;
								InfoCasa[casa][Quantia][id] = ItemInfo[playerid][listitem][Quantia];
								InfoCasa[casa][Item][id] = ItemInfo[playerid][listitem][Item];
								ItemInfo[playerid][listitem][Quantia] = 0;
								ItemInfo[playerid][listitem][Item] = NADA;
								SendClientMessage(playerid, LIGHTBLUE, "* O Item da sua mochila foi para a casa.");				
								PC_EmulateCommand(playerid, "cofrecasa");
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
							PC_EmulateCommand(playerid, "cofrecasa");
							//ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							if(InfoCasa[casa][Quantia][id] == 0 || InfoCasa[casa][Item][id] == 0){
								SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
								PC_EmulateCommand(playerid, "cofrecasa");
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
								PC_EmulateCommand(playerid, "cofrecasa");
								SendClientMessage(playerid, LIGHTBLUE, "* O Item foi para sua mochila.");
							}			
						}
					}
					case 1:{
						if(InfoCasa[casa][Quantia][id] == 0 || InfoCasa[casa][Item][id] == 0){
							SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
							PC_EmulateCommand(playerid, "cofrecasa");
							//ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							CriarItem(playerid, InfoCasa[casa][Item][id], InfoCasa[casa][Quantia][id]);
							InfoCasa[casa][Quantia][id] = 0;
							InfoCasa[casa][Item][id] = 0;
							PC_EmulateCommand(playerid, "cofrecasa");
							SendClientMessage(playerid, LIGHTBLUE, "* O Item foi descartado no chao.");	
						}
					}
					case 2:{
						if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa ter uma mochila.");
						if(InfoCasa[casa][Quantia][id] != 0 || InfoCasa[casa][Item][id] != 0){
							SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item nao invalido.");
							PC_EmulateCommand(playerid, "cofrecasa");
							//ShowPlayerDialog(playerid, DIALOG_PORTAMULA, DIALOG_STYLE_LIST, "{fff000}Porta Malas", "Pegar Item\nDescartar\nColocar Item","Ok", "Sair");
						}
						else{
							new str[600], str2[600];
							strcat(str, "{33ccff}Item\t{33ccff}Quantia\n");
							new conta = 20 * PlayerInfo[playerid][Vip];
							if(conta == 0) conta = 20;
							for(new i; i< conta; i++){
								if(ItemInfo[playerid][i][Item] != NADA){
								    format(str2, sizeof(str2), "{ffffff}%s\t(%dx)\n", InventarioName(ItemInfo[playerid][i][Item]), ItemInfo[playerid][i][Quantia]);
					     			strcat(str, str2);
								}
							}
							ShowPlayerDialog(playerid, DIALOG_SUBS_MOCHILA_CASA, 5, "{FFF000}Sua Mochila", str, "Select", "Sair");							
						}
					}
				}
			}
		}
		case DIALOG_TUNAR_OFICINA:{
			if(response){
				if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce precisa estar em seu veiculo.");
				switch(listitem){
					case 0:{
						new string[290] = "Roda\tPreco\n", str[25 + 6];
						for(new i; i < sizeof wheelcomponent; i++){
							format(str, sizeof str, "{33ccff}%s\t%dR$\n", wheelcomponent[i][wheelname], wheelcomponent[i][wheelprice]);
							strcat(string, str);
						}
						ShowPlayerDialog(playerid, DIALOG_BUY_WHEEL, 5,"Componentes disponiveis", string, "Ok", "voltar");
					}
					
					case 1:{
						new string[255] = "Escapamento\tPreco\n", str[40];
						for(new i; i < sizeof scapecomponent; i++){
							format(str, sizeof str, "{33ccff}%s\t%dR$\n", scapecomponent[i][scapename], scapecomponent[i][scapeprice]);
							strcat(string, str);
						}
						ShowPlayerDialog(playerid, DIALOG_BUY_SCAPE, 5,"Escapamentos", string, "Ok", "voltar");
					}
					case 2:{//spoilercomponent
						new string[255] = "Spoiler\tPreco\n", str[40];
						for(new i; i < sizeof spoilercomponent; i++){
							format(str, sizeof str, "{33ccff}%s\t%dR$\n", spoilercomponent[i][spoilername], spoilercomponent[i][spoilerprice]);
							strcat(string, str);
						}
						ShowPlayerDialog(playerid, DIALOG_BUY_SPOILER, 5,"Escapamentos", string, "Ok", "voltar");
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
					PC_EmulateCommand(playerid, "tunar");
				}
				if(!IsValidComponentForVehicle(VehInfo[playerid][carid][Carro], spoiler)){
					PC_EmulateCommand(playerid, "tunar");
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este Spoiler nao e compativel com seu veiculo.");
				}
				else{
					AddVehicleComponent(VehInfo[playerid][carid][Carro], spoilercomponent[spoiler][spoilerid]);
					GivePlayerCash(playerid, -spoilercomponent[spoiler][spoilerprice]);
					SendClientMessage(playerid, VerdeLeve, "|INFO| Voce comprou um Spoiler por %d$.", spoilercomponent[spoiler][spoilerprice]);
				}
			}
			else
				PC_EmulateCommand(playerid, "tunar");
		}
		case DIALOG_BUY_SCAPE:{
			if(response){
				new scapee = listitem, carid = GetPVarInt(playerid, "CARidV");

				if(GetPlayerCash(playerid) < scapecomponent[scapee][scapeprice]){
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente.");
					PC_EmulateCommand(playerid, "tunar");
				}
				if(!IsValidComponentForVehicle(VehInfo[playerid][carid][Carro], scapee)){
					PC_EmulateCommand(playerid, "tunar");
					SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este Escape nao e compativel com seu veiculo.");
				}
				else{
					AddVehicleComponent(VehInfo[playerid][carid][Carro], scapecomponent[scapee][scape]);
					GivePlayerCash(playerid, -scapecomponent[scapee][scapeprice]);
					SendClientMessage(playerid, VerdeLeve, "|INFO| Voce comprou um scape por %d$.", scapecomponent[scapee][scapeprice]);
				}
			}
			else
				PC_EmulateCommand(playerid, "tunar");
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
				PC_EmulateCommand(playerid, "tunar");
		}
		case DIALOG_SELECIONAR_COMPID:{
			if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce precisa estar em seu veiculo.");
			if(response){
				if(!Number(inputtext)){
					ShowPlayerDialog(playerid, DIALOG_SELECIONAR_COMPID, DIALOG_STYLE_INPUT, "{33ccff}# Componente Especifico", "{fff000}Pesquise no google 'Componentes ID Samp' para achar um componente.", "Comprar", "sair");
					SCM(playerid, LIGHTBLUE, "* Apenas numeros sao permitidos.");
					return 1;
				}
				else if(strval(inputtext) > 1193 || strval(inputtext) < 1000){
					ShowPlayerDialog(playerid, DIALOG_SELECIONAR_COMPID, DIALOG_STYLE_INPUT, "{33ccff}# Componente Especifico", "{fff000}Pesquise no google 'Componentes ID Samp' para achar um componente.", "Comprar", "sair");
					SCM(playerid, LIGHTBLUE, "* Apenas componentes entre 1000 e 1193.");		
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
						SCM(playerid, LIGHTBLUE, "* Este componente nao e valido para seu veiculo.");							
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
					SCM(playerid, LIGHTBLUE, "* Voce acaba de comprar este Componente.");
					salvarComponentes(playerid, GetPVarInt(playerid, "CARidV"));
					carregarComponentes(playerid, GetPVarInt(playerid, "CARidV"));
					vComponent[GetPlayerVehicleID(playerid)] = 0;
					ShowPlayerDialog(playerid, DIALOG_SELECIONAR_COMPID, DIALOG_STYLE_INPUT, "{33ccff}# Componente Especifico", "{fff000}Pesquise no google 'Componentes ID Samp' para achar um componente.", "Comprar", "Ok");
				}
				else{
					if(vComponent[GetPlayerVehicleID(playerid)] != 0){
						vComponent[GetPlayerVehicleID(playerid)] = 0;
						SCM(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
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
							SCM(playerid, LIGHTBLUE, "* Voce nao possui Organizacao.");
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
							SCM(playerid, LIGHTBLUE, "* Voce nao possui ultima posicao.");
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
							SCM(playerid, LIGHTBLUE, "* Voce nao tem residencias.");
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
					SCM(playerid, VerdeSamp, str);
					SalvarOrg(org);
					PC_EmulateCommand(playerid, "configurarsalario");
				}
				else{
					SCM(playerid, LIGHTBLUE, "* Este salario e invalido!");
					PC_EmulateCommand(playerid, "configurarsalario");
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

					SCM(playerid, LIGHTBLUE, str);
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
					ShowPlayerDialog(playerid, DIALOG_COMPRAR_CARRO_ORG,5,
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
					ShowPlayerDialog(playerid, DIALOG_COMPRAR_CARRO_ORG,5,
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
						if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 9) return SCM(playerid, LIGHTBLUE, "* Voce nao e lider ou nao esta em uma org.");
						new org = PlayerInfo[playerid][Org];
						if(EncomendasMafia[org][MaconhaEnc] > 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja encomendou drogas da mafia, nao pode fazer isso novamente ate elas chegarem.");
						ShowPlayerDialog(playerid, DIALOG_MACONHAS_MAFIA, 
							DIALOG_STYLE_INPUT, "{ff0000}# Comprando Drogas", "{33ccff}Digite no campo a baixo a quantia de Maconha para encomendar.\n\
							{33aa33}4${33ccff}/g, so podera encomendar uma vez, ate o dia de entrega chegar.", "Buy", "Return");
					}
					case 1:{
						if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 9) return SCM(playerid, LIGHTBLUE, "* Voce nao e lider ou nao esta em uma org.");
						new org = PlayerInfo[playerid][Org];
						if(EncomendasMafia[org][EquipamentosEnc] > 0) return SendClientMessage(playerid, LIGHTBLUE, "* Voce ja encomendou Equipamentos da mafia, nao pode fazer isso novamente ate elas chegarem.");
						ShowPlayerDialog(playerid, DIALOG_EQS_MAFIA, 
							DIALOG_STYLE_INPUT, "{ff0000}# Comprando Equipamentos", "{33ccff}Digite no campo a baixo a quantia de Equipamentos para encomendar.\n\
							{33aa33}60$ {33ccff}P. Kit, so podera encomendar uma vez, ate o dia de entrega chegar.", "Buy", "Return");
					}
					case 2:{
						if(PlayerInfo[playerid][Org] == 0 || PlayerInfo[playerid][Cargo] < 9) return SCM(playerid, LIGHTBLUE, "* Voce nao e lider ou nao esta em uma org.");
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
						SCM(playerid, LIGHTBLUE, "Nota -> Um Bonus de 800$ foi adicionado.");
						GivePlayerCash(playerid, 800);
					}
					format(str, sizeof str, "Sucesso! Voce converteu %d$ de grana roubada em %d$ de grana limpa!", PegarQuantiaItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO), floatround(conta));
					RemoverItem(playerid, DINHEIRO_FLUTUANTE_BANDIDO);
					GivePlayerCash(playerid, floatround(conta));
					SCM(playerid, COR_COPOM, str);

				}
				else{
					PC_EmulateCommand(playerid, "negociar");
					SCM(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
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
					SCM(playerid, LIGHTBLUE, "* Esta placa nao foi localizada no Banco de dados do Detran!");
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
						PC_EmulateCommand(playerid, "menu");
						DeletePVar(playerid, "selectCarIPVA");

					}
					else{
						AbrirSelecaoIpva(playerid);
						SCM(playerid, LIGHTBLUE, "* Este veiculo nao possui IPVA para ser pagou OU voce esta sem dinheiro.");
					}
				}
				else{
					PC_EmulateCommand(playerid, "menu");
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
				PC_EmulateCommand(playerid, "menu");
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
					SCM(playerid, LIGHTBLUE, "* Voce digitou um valor invalido.");
				}
				else{
					OrgInfo[org][OrgCofre] = strval(inputtext);
					new str[144];
					format(str, sizeof str, "Novo saldo da(o) %s: %dR$", OrgGm[org][OrgNome], strval(inputtext));
					SCM(playerid, LIGHTBLUE, str);
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
				SCM(playerid, LIGHTBLUE, "* Aguarde alguns segundos para a musica Tocar.");
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
                    				return SCM(playerid, LIGHTBLUE, "* O Tanque de gasolina deste veiculo esta cheio.");
                    			
                    			check = i;
                    			new str[144];
                    			format(str, sizeof str, "* %s reabasteceu de gasolina um veiculo.", nome(playerid));
                    			MensagemLocal(25.0, playerid, Roxoeu, str, false);
                    			VeiculoInfo[i][Gasolina] = 100;
                    			MecMenu[playerid][Gasolinas] --;
                    			break;
                    		}
                    	}	
                    	if(check == -1) return SCM(playerid, LIGHTBLUE, "* Voce nao esta perto de um veiculo ou nao esta na Roda esquerda de atras do veiculo.");					
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
					PC_EmulateCommand(playerid, "menuconserto");
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
						if(SendoCurado[playerid]) return SCM(playerid, LIGHTBLUE, "* Voce ja esta sendo curado.");
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
						PC_EmulateCommand(playerid, "menuvip");
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
			    PC_EmulateCommand(playerid, "menuvip");
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
		    if(!response) return PC_EmulateCommand(playerid, "menuvip");
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
			    mysql_format(Dados, Query, sizeof(Query), "SELECT `Nome` FROM `contas` WHERE `Nome` = '%e'", pegar);
			    R= mysql_query(Dados, Query);
			    new rows = cache_num_rows();
			    if(cache_is_valid(R) && rows) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este nome ja esta em uso.");
			    else{
				    PlayerInfo[playerid][Cash] -= 25;
				    SalvarConta(playerid);
				    mysql_format(Dados, Query, sizeof(Query), "UPDATE `Staff` SET `Nome` = '%s' WHERE `Nome` = '%s'", pegar, nome(playerid));
				    mysql_tquery(Dados, Query);

					ChecarLider(playerid, pegar);

				    mysql_format(Dados, Query, sizeof(Query), "UPDATE `contas` SET Nome` = '%s' WHERE `Nome` = '%s'", pegar, nome(playerid));
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
					PC_EmulateCommand(playerid, "menuvip");
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
					}
				}
			}
		}
		case DIALOG_AMMUNATION:{
		    if(response){
				if(GetPlayerCash(playerid) < ArmaAmmunation[listitem][Valor]){
				    PC_EmulateCommand(playerid, "menu");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro suficiente para comprar esta arma.");
				}
				else{
				    GivePlayerCash(playerid, -ArmaAmmunation[listitem][Valor]);
				    new str[144];
				    format(str, sizeof str,"[AmmuNation] Voce comprou a arma %s pelo valor de %dR$.", ArmaAmmunation[listitem][ArmaNome], ArmaAmmunation[listitem][Valor]); 
				    SendClientMessage(playerid, Amarelo, str);
				    GivePlayerWeapon(playerid, ArmaAmmunation[listitem][IDArma], ArmaAmmunation[listitem][QuantiaDar]);
				    PC_EmulateCommand(playerid, "menu");
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
				    PC_EmulateCommand(playerid, "menu");
				}
				else{
				    GivePlayerCash(playerid, -valor);
					BancoInfo[playerid][Dinheiro] += valor;
					new str[144];
					format(str, sizeof str, "{fff000}[B.{33aa33}B{fff000}]{ffffff} Voce depositou %dR$ na sua conta bancaria.", valor);
					SendClientMessage(playerid, -1,str);
                    PC_EmulateCommand(playerid, "menu");
				}
			}
			else
			    PC_EmulateCommand(playerid, "menu");
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
					PC_EmulateCommand(playerid, "menu");
				}
			}
			else
			    PC_EmulateCommand(playerid, "menu");
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
					new user[MAX_PLAYER_NAME];
					cache_get_value_name(0, "Usuario", user, MAX_PLAYER_NAME);
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
                if(!PossuiContaNumeroBanco(id)) return SCM(playerid, LIGHTBLUE, "Voce digitou uma conta de banco inexistente.");
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
		case DIALOG_CAIXABANCO:{//
			if(!PossuiContaBanco(playerid)) return SCM(playerid, LIGHTBLUE, "Crie uma conta no banco para usar o caixa!");
		    if(response){
		        switch(listitem){
		            case 0: ShowPlayerDialog(playerid, DIALOG_DEPOSITARBANCO, DIALOG_STYLE_INPUT, "{ff0000}Opcao Deposito", "{fff000}[B.{33AA33}B{fff000}]\n\nDigite o valor do deposito no campo a seguir.","Ok", "Sair");
                    case 1: ShowPlayerDialog(playerid, DIALOG_SACARBANCO, DIALOG_STYLE_INPUT, "{ff0000}Opcao Saque", "{fff000}[B.{33AA33}B{fff000}]\n\nDigite o valor do saque no campo a seguir.","Ok", "Sair");
					case 2: ShowPlayerDialog(playerid, DIALOG_TRANSFERIR, DIALOG_STYLE_INPUT, "{fff000}Opcao Transferencia","{fff000}[B.{33AA33}B{FFF000}]\n\nDigite o numero da conta no campo a baixo que voce deseja transferir o dinheiro.", "Select", "Sair");
					case 3:{
						if(PlayerInfo[playerid][DinheiroPD] < 1){
							SCM(playerid, LIGHTBLUE, "Voce nao tem dinheiro para receber.");
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
						if(MochilaCheia(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SCM(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						if(GetPlayerCash(playerid) < 1200) return SCM(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
						GivePlayerCash(playerid, -1200);
						AdicionarItem(playerid, LOCKPICK, 1);
						SCM(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um Lock Pick para quebrar trancas.");						
						PC_EmulateCommand(playerid, "menu");
					}
					case 3:{
						if(GetPlayerCash(playerid) < 1500) return SCM(playerid, LIGHTBLUE, "Voce nao tem dinheiro suficiente.");
						//if(PlayerInfo[playerid][Mochila] == 0) return SCM(playerid, LIGHTBLUE, "Voce nao possui mochila.");
						GivePlayerCash(playerid, -1500);
						SetPlayerArmour(playerid, 80);
						SCM(playerid, LIGHTBLUE, "Voce comprou um colete com 80 de protecao.");
						PC_EmulateCommand(playerid, "menu");
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
						PC_EmulateCommand(playerid, "menu");
					}
				}
			}
			else{
				PC_EmulateCommand(playerid, "menu");
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
			    		if(!Equipado(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce nao esta fardado.");
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
		        mysql_format(Dados, Query, sizeof(Query), "UPDATE `contas` SET `Org` = '0', `Cargo` = '0' WHERE `Org` = '%d' AND `Nome` != '%s'", PlayerInfo[playerid][Org], nome(playerid));
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
					SCM(playerid, LIGHTBLUE, "Falta menos de 10 segundos para voce receber o salario por PayDay. Aguarde!");
				}
				else if(InfoCaixa[GetPVarInt(playerid, "caixauso")][CaixaGrana] < PlayerInfo[playerid][DinheiroPD]){
					SCM(playerid, LIGHTBLUE, "Este caixa nao possui dinheiro para ser sacado. Procure outro!");
				}
				else{
					GivePlayerCash(playerid, PlayerInfo[playerid][DinheiroPD]);
					InfoCaixa[GetPVarInt(playerid, "caixauso")][CaixaGrana] -= PlayerInfo[playerid][DinheiroPD];
					PlayerInfo[playerid][DinheiroPD] = 0;
					SCM(playerid, VerdeSamp, "Voce sacou o dinheiro de seu trabalho.");
				}
			}
			else
				MostrarDialogCaixa(playerid);
		}
		case DIALOG_SACARSALARIOBANCO:{
			if(response){
				if( (Tempopayday - gettime()) < 10 ){
					SCM(playerid, LIGHTBLUE, "Falta menos de 10 segundos para voce receber o salario por PayDay. Aguarde!");
				}
				else{
					GivePlayerCash(playerid, PlayerInfo[playerid][DinheiroPD]);
					PlayerInfo[playerid][DinheiroPD] = 0;
					SCM(playerid, VerdeSamp, "Voce sacou o dinheiro de seu trabalho.");
				}
			}
			else
				MostrarDialogCaixa(playerid, 2);
		}
		case DIALOG_CAIXA:{
			if(!PossuiContaBanco(playerid)) return SCM(playerid, LIGHTBLUE, "Crie uma conta no banco para usar o caixa!");
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
							SCM(playerid, LIGHTBLUE, "Voce nao tem dinheiro para receber.");
							MostrarDialogCaixa(playerid);
						}
						else
							ShowPlayerDialog(playerid, DIALOG_SACARSALARIO, DIALOG_STYLE_MSGBOX, "{33ccff}# Salario", fString("{33ccff}%s, voce possui %dR$ para sacar de seu salario.\n{ff0000}Deseja Sacar?", nome(playerid), PlayerInfo[playerid][DinheiroPD]), "Sim", "Retornar");
					}
					case 4:{
					    if(NaMao[playerid] != DINAMITE) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa pegar a DINAMITE na mao.");
						if(InfoCaixa[GetPVarInt(playerid, "caixauso")][CaixaQuebrado]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este caixa esta quebrado.");
						if(PlantandoCaixa[playerid]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce ja esta plantando uma bomba.");
						if(Tempocaixa >= gettime()) return SCM(playerid, LIGHTBLUE, fString("* Aguarde %s para roubar um caixa.", Convert(Tempocaixa - gettime())));
						if(!MembrosPerto(playerid, 2)) return SCM(playerid, LIGHTBLUE, "* Voce precisa de mais um membro para roubar o caixa.");
						if(!PoliciaisOnline(3)) return SCM(playerid, LIGHTBLUE, "* Precisa de mais policiais online para fazer esta acao.");
						PC_EmulateCommand(playerid, "anim");
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
		    	if(TrabalhandoEmprego[playerid][PlayerInfo[playerid][Emprego]]) return SCM(playerid, LIGHTBLUE, "* Voce precisa sair do modo de trabalho.");
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
					    if(PlayerInfo[playerid][Nivel] < 8) return SCM(playerid, LIGHTBLUE, "* Voce precisa de no minimo nivel 8.");
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
						if(PlayerInfo[playerid][Nivel] < 2) return SCM(playerid, LIGHTBLUE, "* Voce precisa de no minimo nivel 3 para usar este emprego.");
						if(PlayerInfo[playerid][Emprego] != 0) return SCM(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						SetPlayerCheckpoint(playerid, -371.35501, -1436.94507, 25.65495, 2.0);
						SCM(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 7:{
						if(PlayerInfo[playerid][Emprego] != 0) return SCM(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						if(CarteiraInfo[playerid][Carro] == 0) return SCM(playerid, LIGHTBLUE, "|INFO| Voce nao possui carteira de Motorista.");
						SetPlayerCheckpoint(playerid, 595.9457,-1514.7836,15.4952, 2.3);
						SCM(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 8:{
						if(PlayerInfo[playerid][Emprego] != 0) return SCM(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						if(CarteiraInfo[playerid][Carro] == 0) return SCM(playerid, LIGHTBLUE, "|INFO| Voce nao possui carteira de Motorista.");
						if(PlayerInfo[playerid][Nivel] < 7) return SCM(playerid, LIGHTBLUE, "* Voce nao tem nivel 7 ou maior.");
						SetPlayerCheckpoint(playerid,  1183.25842, -1316.67725, 13.55144, 2.3);//medic
						SCM(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 9:{
						if(PlayerInfo[playerid][Emprego] != 0) return SCM(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						if(PlayerInfo[playerid][Nivel] < 2) return SCM(playerid, LIGHTBLUE, "* Voce nao tem nivel 2 ou maior.");
						SetPlayerCheckpoint(playerid,  -1644.03650, -2231.24292, 29.53947, 4.0);//cacadorE
						SCM(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 10:{
						if(PlayerInfo[playerid][Emprego] != 0) return SCM(playerid, LIGHTBLUE, "|INFO| Voce ja possui um emprego.");
						if(PlayerInfo[playerid][Nivel] < 9) return SCM(playerid, LIGHTBLUE, "* Voce nao tem nivel 9 ou maior.");
						if(CarteiraInfo[playerid][Carro] == 0) return SCM(playerid, LIGHTBLUE, "* Voce nao tem carteira de motorista!");

						SetPlayerCheckpoint(playerid,  -1046.7114, -585.7683, 32.2494, 4.0);//parte comb1
						SCM(playerid, LIGHTBLUE, "|INFO| O Emprego foi marcado em seu Mapa.");
					}
					case 11:{
					    if(PlayerInfo[playerid][Emprego] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao faz parte de nenhum emprego.");
						if(TrabalhandoEmprego[playerid][PlayerInfo[playerid][Emprego]]) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce precisa sair de trabalho para se demitir.");
						PlayerInfo[playerid][Emprego] = 0;
					    GivePlayerCash(playerid, -350);
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
				switch(listitem){
					case 0: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Comandos Uteis", "{33ccff}/carteira /mostrarcarteira /orgs /render /deitar /relatorio /mochila /pagar /anim /guardar ", "Ok", "");
					case 1:{
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Comandos Organizacoes", "{33ccff}[Corps]\n\n\
						/r /autuar /prender /rilegal /consultarplaca /ar /tabelamulta /tabelaau /multar /revistar /revistarmochila /algemar /d /repararcaixa\n\n{ff0000}[Faccoes]\n\n\
						/dinamitar /explodir /roubarcf /seq /descarregareqs /roubarcofre /roubarcf\n\n{33ccff}[Padroes]\n\n\
						/r /orgs /gov /dominar /demitir /demitirtodos /convidar", "ok", #);
					}
					case 2:{
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Pagina 2", "{33ccff}Comandos De Orgs/corps\n\
							/membros /tirarporte /darporte /membrosof /bloqueio \n/procurados /ativartaser /rbloqueios /medemitir /colocarsaco /configurarsalario /estoqueorg /convidar /promover /demitiroff", "Ok", #);
					}
				    case 3:{
				        switch(PlayerInfo[playerid][Emprego]){
				        	case PESCADOR: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Pescador", "{33ccff}/Jogarrede\n{33ccff}/dpeixes\n/{33ccff}/trabalhar\n{33aa33}Spawne o barco na frente de onde pega o emprego.", "Ok", "");
							case MADEIREIRO: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Madeireiro", "{33ccff}/carvore\n{33ccff}/dmadeiras\n{33ccff}/trabalhar\n{33ccff}Voce precisa ter 6 madeiras para poder entregalas.", "Ok", #);
							case TRANSPORTADORM: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Transportador De M.", "{33ccff}/carregarm\n/{33ccff}descarregarm\n/trabalhar\n{33ccff}Spawne o veiculo do lado da casa de madeira.", "Ok", #);
							case TRANSP_ARMA: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Transp. De Armas", "{33ccff}/carregarc\n{33ccff}/pegarcarga\n/{33ccff}descarregarc\n/trabalhar\n{33ccff}Spawne o veiculo na frente de onde pega o emprego.", "Ok", #);
							case CARRO_FORTE: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "{fff000}Emprego De Carro Forte", "{33ccff}/caixa\n{33ccff}/pegardinheiro\t/descarregar\\t/trabalhar\n{33aa33}Spawne o Caminhao na frente do Hq.\n{33ccff}Aperte 'Y' atras do carro forte para carrega-lo.", "Ok", #);
							case MECANICO: ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, "Emprego De Mecanico", "{33ccff}/chamados\t/trabalhar\t/menuconserto\t/mecmenu\t/meusItems\n{33aa33}Spawne o Caminhao dentro do Hq.", "Ok", #);
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
							"{FF0000}# Comandos Carros", "{33ccff}/portamala [abrir/fechar]\n{ff0000}OBS: Os Items podem ser roubados, sempre mantenha fechado!\n{33ccff}Para trocar a cor de um veiculo va ao mecanico.\n\
							{33ccff}/menucar\n/trancar", "Ok", #);
					}
					case 6:{
						ShowPlayerDialog(playerid, DIALOG_INUTIL, DIALOG_STYLE_MSGBOX, 
							"{FF0000}# Comandos Carros", "{33ccff}/plantarSEMENTE\n{33ccff}/colherplanta\n{33ccff}/pegarcomponente\n\
							{33ccff}/criarSEMENTE", "Ok", #);						
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
				    PC_EmulateCommand(playerid, "menu");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Digite o ID da roupa.");
				}
				new id = strval(inputtext);
				if(id == 217){
				    PC_EmulateCommand(playerid, "menu");
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
					PC_EmulateCommand(playerid, "menu");
				}
			}
		}
		case DIALOG_HABS:{
		    if(response){
		        switch(listitem){
			        case 0:{
			            if(GetPlayerCash(playerid) < 1700){
			                PC_EmulateCommand(playerid, "menu");
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
			                PC_EmulateCommand(playerid, "menu");
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
							PC_EmulateCommand(playerid, "menu");
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
				    	PC_EmulateCommand(playerid, "carteira");
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
                    	PC_EmulateCommand(playerid, "anim");
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
		    if(!response) return PC_EmulateCommand(playerid, "mochila");
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
			PC_EmulateCommand(playerid, "mochila");
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
					if(uva == -1) return SCM(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
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
						if(!PossuiContaBanco(playerid)) return SCM(playerid, LIGHTBLUE, "Crie uma conta no banco antes de usar este aplicativo!");
						new str[144];
						format(str, sizeof(str), "{fff000}[B.{33AA33}B]\n\n\
						{ffffff}Voce possui um total de %dR$ na conta do banco.\nDigite o numero da conta que deseja fazer a transferencia.", BancoInfo[playerid][Dinheiro]);
						ShowPlayerDialog(playerid, DIALOG_TRANSFERIR, DIALOG_STYLE_INPUT, "{fff000}Transferencia Bancaria", str, "Ok", "Sair");
					}
					case 4:{
						if(PlayerInfo[playerid][Nivel] <= 3) return SCM(playerid, LIGHTBLUE, "Voce precisa de nivel 4 ou superior para pedir um ataque terrorista.");

						if(PlayerInfo[playerid][Org] == 18) return SCM(playerid, LIGHTBLUE, "Voce nao pode pedir um ATAQUE TERRORISTA SENDO um TERRORISTA.");
						if(GetPlayerCash(playerid) < 300) return SCM(playerid, 0x808080FF, "Voce PRECISA de 300 REAIS para pedir um ATAQUE TERRORISTA.");
						SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+4);
						if(!TerroristasOnline()) return SCM(playerid, 0x808080FF, "Nao ha nenhum terrorista online.");
						new Float: X, Float: Y, Float: Z;
						GetPlayerPos(playerid, X, Y, Z);
						foreach(new i: Player){
							if(PlayerInfo[i][Org] == 18){
								SCM(i, 0x808080FF, fString("* %s acaba de pedir um Ataque Terrorista em %s(%s). Marcado em seu mapa.", nome(playerid), CoordZone(X, Y, Z), DistanciaJogador(i, playerid)));
								SetPlayerCheckpoint(i, X, Y, Z, 5.0);
							}
						}
						GivePlayerCash(playerid, -300);
						SCM(playerid, 0x808080FF, "Voce pediu um ATAQUE TERRORISTA nesta area. Os terroristas onlines foram AVISADOS.");
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
				            PC_EmulateCommand(playerid, "mochila");
				            SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce selecionou um item invalido.");
						}
						else{
							if(IsSkin(ItemInfo[playerid][slot][Item])){
							
								PlayerInfo[playerid][Skin] = ItemInfo[playerid][slot][Item];
								if(Pagina[playerid] == 1){
									ItemInfo[playerid][slot][Item] = GetPlayerSkin(playerid);
									PlayerTextDrawSetPreviewModel(playerid, PreviewTD[playerid][slot], GetPlayerSkin(playerid));
								}
								else{
									new Conta = Pagina[playerid] * 20;
									ItemInfo[playerid][slot][Item] = GetPlayerSkin(playerid);
									PlayerTextDrawSetPreviewModel(playerid, PreviewTD[playerid][(Conta-slot)], GetPlayerSkin(playerid));
								}
								AdicionarItemN(playerid, GetPlayerSkin(playerid), 1);
								SetPlayerSkin(playerid, ItemInfo[playerid][slot][Item]);
								DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);

								new stre[144];
								format(stre, sizeof stre, "%s colocou uma %s nova.", nome(playerid), rdr[random(12)]);
								MensagemLocal(25.0, playerid, Roxoeu, stre, false);
							

								PC_EmulateCommand(playerid, "mochila");
							}
							else if(IsAcessorio(ItemInfo[playerid][slot][Item])){
								if(LotSlots(playerid)){
									SCM(playerid, LIGHTBLUE, "* Voce esta lotado de Acessorios.");
								}
								else{
									new d = GetLivreSlot(playerid);
									if(d != -1){
										ao[playerid][d][partebone] = 1;
										RemovePlayerAttachedObjectEx(playerid, d);

										SetPlayerAttachedObjectEx(playerid, d, ItemInfo[playerid][slot][Item], 1);//, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);						
										SCM(playerid, LIGHTBLUE, "* Adicionado com sucesso, ele esta escondido na parte da Coluna.");
										DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);
										PC_EmulateCommand(playerid, "mochila");
									}
									else{
										PC_EmulateCommand(playerid, "mochila");
										SetPVarInt(playerid, "ModelSetA", -1);
										SCM(playerid, LIGHTBLUE, "* Voce esta com os Slots de acessorios no maximo!");
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
									    	SCM(playerid, LIGHTBLUE,"* A um acessorio sendo usado no lugar do CAPACETE.");
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
											SCM(playerid, LIGHTBLUE, "* A um acessorio sendo usado no lugar do CAPACETE.");
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
										PC_EmulateCommand(playerid, "mochila");
										SCM(playerid, LIGHTBLUE, "* Use /plantarSEMENTE para plantar esta SEMENTE.");
									}
									case DINHEIRO_FLUTUANTE_BANDIDO:{
										SCM(playerid, LIGHTBLUE, "* Voce deve limpar este dinheiro com a Mafia.");
										PC_EmulateCommand(playerid, "mochila");
									}
									case DINHEIRO_FLUTUANTE:{
										if(ItemInfo[playerid][slot][Item] == DINHEIRO_FLUTUANTE){
											GivePlayerCash(playerid, ItemInfo[playerid][slot][Quantia]);
											new srt[98];
											format(srt, sizeof srt, "{33aa33}|INFO| Voce pegou %dR$ de sua mochila.", ItemInfo[playerid][slot][Quantia]);
											SendClientMessage(playerid, -1, srt);
										    ItemInfo[playerid][slot][Quantia] = 0;
										    ItemInfo[playerid][slot][Item] = NADA;
										    PC_EmulateCommand(playerid, "mochila");
										}
									}
									case DILDO_ROXO..TEC9:{
									    GivePlayerWeapon(playerid, IdDoItem(ItemInfo[playerid][slot][Item]), ItemInfo[playerid][slot][Quantia]);
									    new str[120];
									    format(str, sizeof str, "|INFO| Voce pegou uma arma com %d Municoes da mochila.", ItemInfo[playerid][slot][Quantia]);
									    SendClientMessage(playerid, LIGHTBLUE, str);
									    ItemInfo[playerid][slot][Quantia] = 0;
									    ItemInfo[playerid][slot][Item] = NADA;
									}
									case GALAO_CHEIO:{
										if(MochilaCheia(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce esta com a mochila Cheia!");
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
				                    	if(ItemInfo[playerid][slot][Quantia] > 100) return SCM(playerid, LIGHTBLUE, "* Muita gasolina !");
				                    	if( ( ItemInfo[playerid][slot][Quantia] + VeiculoInfo[check][Gasolina]) > 100) return SCM(playerid, LIGHTBLUE, "* Voce esta tentando abastecer um tanque com muita gasolina.");
				                    	if(check == -1) return SCM(playerid, LIGHTBLUE, "* Voce nao esta no tanque de nenhum veiculo ou voce esta tentando abastecer mais do que o tanque pode suportar!");
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
											SCM(playerid, COR_COPOM, str);
											PlayerInfo[playerid][Sede] -= diminuir;
											if(PlayerInfo[playerid][Sede] < 0) PlayerInfo[playerid][Sede] = 0;
											ApplyAnimationEx(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
											MostrarFomeSede(playerid);
											SetTimerEx("LimparAnim", 3000, false, "i", playerid);
										}
										if(IsComida(ItemInfo[playerid][slot][Item])){
										    ApplyAnimationEx(playerid, "FOOD", "EAT_Burger", 3.0, 1, 0, 0, 0, 0, SYNC_ALL);
											format(str, sizeof str, "Voce acaba de ingerir uma comida, sua fome diminuiu %d porcento.", diminuir);
											SCM(playerid, COR_COPOM, str);
											PlayerInfo[playerid][Fome] -= diminuir;
											if(PlayerInfo[playerid][Fome] < 0) PlayerInfo[playerid][Fome] = 0;
											MostrarFomeSede(playerid);
											SetTimerEx("LimparAnim", 3000, false, "i", playerid);
										
										}
										DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);
										PC_EmulateCommand(playerid, "mochila");
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
												if(VeiculoDoJogador(playerid, i))return SCM(playerid, LIGHTBLUE, "* Voce nao pode fazer isso com seu proprio veiculo.");
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
															SCM(player, Roxoeu, str);
														}
													}
													break;
												}
												else{
													SCM(playerid, LIGHTBLUE, "* Este veiculo nao esta trancado.");
													break;
												}
											}
										}
										if(veh == -1) return SCM(playerid, LIGHTBLUE, "* Voce precisa estar perto de algum veiculo.");
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
				            PC_EmulateCommand(playerid, "mochila");
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
								PC_EmulateCommand(playerid, "mochila");
								SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
							}
							else{
								ShowPlayerDialog(playerid, DIALOG_SEPARAR_ITEM, DIALOG_STYLE_INPUT, "{fff000}# Separar Items", "{33ccff}Digite a quantia que voce deseja separar deste item.", "Ok", "Sair");
							}
						}
					}
				}
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
									SCM(playerid, LIGHTBLUE, "* Voce esta lotado de Acessorios.");
								}
								else{
									new d = GetLivreSlot(playerid);
									if(d != -1){
										ao[playerid][d][partebone] = 1;
										RemovePlayerAttachedObjectEx(playerid, d);

										SetPlayerAttachedObjectEx(playerid, d, ItemInfo[playerid][slot][Item], 1);//, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);						
										SCM(playerid, LIGHTBLUE, "* Adicionado com sucesso, ele esta escondido na parte da Coluna.");
										DiminuirItem(playerid, ItemInfo[playerid][slot][Item], 1);
										MostrarMochila(playerid);
									}
									else{
										MostrarMochila(playerid);
										SetPVarInt(playerid, "ModelSetA", -1);
										SCM(playerid, LIGHTBLUE, "* Voce esta com os Slots de acessorios no maximo!");
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
									    	SCM(playerid, LIGHTBLUE,"* A um acessorio sendo usado no lugar do CAPACETE.");
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
											SCM(playerid, LIGHTBLUE, "* A um acessorio sendo usado no lugar do CAPACETE.");
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
										SCM(playerid, LIGHTBLUE, "* Use /plantarSEMENTE para plantar esta SEMENTE.");
									}
									case DINHEIRO_FLUTUANTE_BANDIDO:{
										SCM(playerid, LIGHTBLUE, "* Voce deve limpar este dinheiro com a Mafia.");
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
										if(MochilaCheia(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce esta com a mochila Cheia!");
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
				                    	if(ItemInfo[playerid][slot][Quantia] > 100) return SCM(playerid, LIGHTBLUE, "* Muita gasolina !");
				                    	if( ( ItemInfo[playerid][slot][Quantia] + VeiculoInfo[check][Gasolina]) > 100) return SCM(playerid, LIGHTBLUE, "* Voce esta tentando abastecer um tanque com muita gasolina.");
				                    	if(check == -1) return SCM(playerid, LIGHTBLUE, "* Voce nao esta no tanque de nenhum veiculo ou voce esta tentando abastecer mais do que o tanque pode suportar!");
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
											SCM(playerid, COR_COPOM, str);
											PlayerInfo[playerid][Sede] -= diminuir;
											if(PlayerInfo[playerid][Sede] < 0) PlayerInfo[playerid][Sede] = 0;
											ApplyAnimationEx(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, SYNC_ALL);
											MostrarFomeSede(playerid);
											SetTimerEx("LimparAnim", 3000, false, "i", playerid);
										}
										if(IsComida(ItemInfo[playerid][slot][Item])){
										    ApplyAnimationEx(playerid, "FOOD", "EAT_Burger", 3.0, 1, 0, 0, 0, 0, SYNC_ALL);
											format(str, sizeof str, "Voce acaba de ingerir uma comida, sua fome diminuiu %d porcento.", diminuir);
											SCM(playerid, COR_COPOM, str);
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
												if(VeiculoDoJogador(playerid, i))return SCM(playerid, LIGHTBLUE, "* Voce nao pode fazer isso com seu proprio veiculo.");
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
															SCM(player, Roxoeu, str);

														}
													}
													EsconderInventario(playerid);
													break;
												}
												else{
													SCM(playerid, LIGHTBLUE, "* Este veiculo nao esta trancado.");
													break;
												}
											}
										}

										if(veh == -1) return SCM(playerid, LIGHTBLUE, "* Voce precisa estar perto de algum veiculo.");
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
				            PC_EmulateCommand(playerid, "mochila");
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
								PC_EmulateCommand(playerid, "mochila");
								SendClientMessage(playerid, LIGHTBLUE, "* Voce selecionou um item invalido.");
							}
							else{
								ShowPlayerDialog(playerid, DIALOG_SEPARAR_ITEM, DIALOG_STYLE_INPUT, "{fff000}# Separar Items", "{33ccff}Digite a quantia que voce deseja separar deste item.", "Ok", "Sair");
							}
						}
					}
				}
			}
		}
		case DIALOG_SEPARAR_ITEM:{
			if(response){
				new slot = GetPVarInt(playerid, "slot");
				if(strval(inputtext) >= ItemInfo[playerid][slot][Quantia] || !Number(inputtext) || strval(inputtext) < 1){
					ShowPlayerDialog(playerid, DIALOG_SEPARAR_ITEM, DIALOG_STYLE_INPUT, "{fff000}# Separar Items", "{33ccff}Digite a quantia que voce deseja separar deste item.", "Ok", "Sair");
					SCM(playerid, LIGHTBLUE, "* Voce digitou um valor Invalido.");
				}
				else{
					if(!MochilaCheia(playerid)){
						AdicionarItemN(playerid, ItemInfo[playerid][slot][Item], strval(inputtext));
						ItemInfo[playerid][slot][Quantia] -= strval(inputtext);
						SCM(playerid, LIGHTBLUE, "* Item separado com sucesso.");
						PC_EmulateCommand(playerid, "mochila");
					}
					else{
						SCM(playerid, LIGHTBLUE, "* Sua mochila esta cheia.");
						PC_EmulateCommand(playerid, "mochila");
					}
				}
			}
			else{
				PC_EmulateCommand(playerid, "mochila");
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
				PC_EmulateCommand(playerid, "mochila");
		}
		case DIALOG_QUANTIADROP:{
			if(response){
				new slot = GetPVarInt(playerid, "slot"), quantia = strval(inputtext);
				if(!Number(inputtext) || !strlen(inputtext) || quantia >= ItemInfo[playerid][slot][Quantia]){
					PC_EmulateCommand(playerid, "mochila");
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
		    		new conta = 20 * PlayerInfo[playerid][Vip];
					if(conta == 0) conta = 20;
		        	for(new i; i<conta; i++){
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
						PC_EmulateCommand(playerid, "menu");
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
					    PC_EmulateCommand(playerid, "menu");
					    //(playerid, GetPVarInt(playerid, "Menuid"), 1000);
					}
					case 2:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
					    if(GetPlayerCash(playerid) < 10) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
					    GivePlayerCash(playerid, -10);
					    AdicionarItem(playerid, CREDITOS, 10);
					    SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de recarregar 10 CREDITOS.");
					    PC_EmulateCommand(playerid, "menu");
					    //(playerid, GetPVarInt(playerid, "Menuid"), 10);
					}
					case 3:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
					    if(GetPlayerCash(playerid) < 25) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
					    GivePlayerCash(playerid, -25);
					    AdicionarItem(playerid, CHIP, 1);
					    SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um CHIP da vivo.");
					    PC_EmulateCommand(playerid, "menu");
					    //(playerid, GetPVarInt(playerid, "Menuid"), 25);
					}
					case 4:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
					    if(GetPlayerCash(playerid) < 170) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
					    GivePlayerCash(playerid, -170);
					    AdicionarItem(playerid, CAPACETE, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um CAPACETE.");
						PC_EmulateCommand(playerid, "menu");
						//(playerid, GetPVarInt(playerid, "Menuid"), 170);
					}
					case 5:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
						if(GetPlayerCash(playerid) < 200) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
						GivePlayerCash(playerid, -200);
						AdicionarItem(playerid, RADINHO, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um RADINHO.");
						PC_EmulateCommand(playerid, "menu");
						//(playerid, GetPVarInt(playerid, "Menuid"), 200);
					}
					case 6:{
						if(MochilaCheia(playerid)) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Sua mochila esta totalmente cheia.");
					    if(PlayerInfo[playerid][Mochila] == 0) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem uma mochila.");
						if(GetPlayerCash(playerid) < 25) return SendClientMessage(playerid, LIGHTBLUE, "|INFO| Voce nao tem dinheiro.");
						GivePlayerCash(playerid, -25);
						AdicionarItem(playerid, LEITE, 1);
						SendClientMessage(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um LEITE.");
						PC_EmulateCommand(playerid, "menu");			
						//(playerid, GetPVarInt(playerid, "Menuid"), 25);			
					}
					case 7:{
						if(MochilaCheia(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SCM(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						if(GetPlayerCash(playerid) < 500) return SCM(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
						GivePlayerCash(playerid, -500);
						AdicionarItem(playerid, MP3, 1);
						SCM(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um MP3.");
						PC_EmulateCommand(playerid, "menu");
						//(playerid, GetPVarInt(playerid, "Menuid"), 500);
					}
					case 8:{
						if(MochilaCheia(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SCM(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						if(GetPlayerCash(playerid) < 50) return SCM(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
						GivePlayerCash(playerid, -50);
						AdicionarItem(playerid, GALAO_VAZIO, 1);
						SCM(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar um Galao Vazio.");
						PC_EmulateCommand(playerid, "menu");	
						//(playerid, GetPVarInt(playerid, "Menuid"), 50);					
					}
					case 9:{
						if(MochilaCheia(playerid)) return SCM(playerid, LIGHTBLUE, "* Voce esta com a Mochila cheia.");
						if(PlayerInfo[playerid][Mochila] == 0) return SCM(playerid, LIGHTBLUE, "* Voce nao possui Mochila.");
						if(GetPlayerCash(playerid) < 40) return SCM(playerid, LIGHTBLUE, "* Voce nao tem dinheiro suficiente.");
						GivePlayerCash(playerid, -40);
						AdicionarItem(playerid, REDE, 1);
						SCM(playerid, -1, "{33aa33}|INFO| Voce acaba de comprar uma rede de Pesca.");						PC_EmulateCommand(playerid, "menu");	
						//(playerid, GetPVarInt(playerid, "Menuid"), 50);					
					}
					case 10:{
						if(PlayerInfo[playerid][Emprego] != LEITEIRO) return SCM(playerid, LIGHTBLUE, "* Voce nao pode vender LEITEs.");
						if(!TrabalhandoEmprego[playerid][LEITEIRO]) return SCM(playerid, LIGHTBLUE, "* Voce precisa estar trabalhando para vender LEITE!");
						//if(!ISP(playerid, 3.0, -377.46396, -1449.73047, 25.64083)) return SCM(playerid, LIGHTBLUE, "* Voce nao esta perto do Eric Do LEITE Morno para vender os LEITEs.");
						if(LEITEs[playerid] < 1) return SCM(playerid, LIGHTBLUE, "* Voce nao tem LEITEs para vender!");
						new str[60];
						format(str, sizeof str, "Voce vendeu %dL de LEITE por {33aa33}%dR$", LEITEs[playerid], 20*LEITEs[playerid]);
						SCM(playerid, LIGHTBLUE, str);
						LEITEs[playerid] = 0;
						GameTextForPlayer(playerid, "~B~PayDay aumentado!", 3000, 3);
						PC_EmulateCommand(playerid, "menu");
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
					format(OrgInfo[PlayerInfo[playerid][Org]][OrgLider], MAX_PLAYER_NAME, "Ninguem");
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
				if(strcmp(InfoCasa[idcasa][Dono], nome(dono), false, MAX_PLAYER_NAME)){
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
				format(InfoCasa[idcasa][Dono], MAX_PLAYER_NAME, nome(playerid));
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
		case DIALOG_INUTIL: return 1;
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
						if(PlayerInfo[playerid][Cargo] != 10) return SCM(playerid, LIGHTBLUE, "Somente lideres podem pegar Maconha.");
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
				if(OrgInfo[PlayerInfo[playerid][Org]][Equipamentos] < 1) return SCM(playerid, LIGHTBLUE, "* Organizacao sem equipamentos!");

			
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
						if(PlayerInfo[playerid][Org] != 18) return SCM(playerid, LIGHTBLUE, "Somente TERRORISTAS podem pegar esta arma.");
						GivePlayerWeapon(playerid, WEAPON_ROCKETLAUNCHER, 1);
					}
					case 6:{
						if(PlayerInfo[playerid][Org] != 18) return SCM(playerid, LIGHTBLUE, "Somente TERRORISTAS podem pegar esta arma.");
						GivePlayerWeapon(playerid, WEAPON_SNIPER, 3);
					}
				}
			}
		}
		case DIALOG_EQUIPAMENTOCORP:{
			if(response){
				if(OrgInfo[PlayerInfo[playerid][Org]][OrgCofre] < 250) return SCM(playerid, LIGHTBLUE, "* Corporacao sem dinheiro no Cofre!");

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
						SCM(playerid, LIGHTBLUE, "* Use /ativartaser para usar esta pistola como arma de choque.");
					} 
					case 3: GivePlayerWeapon(playerid, WEAPON_SHOTGUN, 20);
					case 4: GivePlayerWeapon(playerid, WEAPON_NITESTICK, 1);
					case 5:{							
						GivePlayerWeapon(playerid, WEAPON_PARACHUTE, 1);
					}
					case 6:{
						if(PlayerInfo[playerid][Org] != 12) return SCM(playerid, LIGHTBLUE, "Somente MEMBROS do EXERCITO podem pegar esta arma.");
						GivePlayerWeapon(playerid, WEAPON_ROCKETLAUNCHER, 1);
					}
					case 7:{
						if(PlayerInfo[playerid][Org] == 11 || PlayerInfo[playerid][Org] == 12 || PlayerInfo[playerid][Org] == 3){
							GivePlayerWeapon(playerid, WEAPON_SNIPER, 3);
						}
						else
							SCM(playerid, LIGHTBLUE, "Sua organizacao NAO PODE utilizar SNIPER.");
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

		            if(VeiculoConfiguracao[VehInfo[playerid][idd][Carro]][Quebrado] || VeiculoConfiguracao[VehInfo[playerid][idd][Carro]][Desmanchado]) return SCM(playerid, LIGHTBLUE, "* Este veiculo esta quebrado! Voce nao pode estacionar.");
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
					PC_EmulateCommand(playerid, "portamala abrir");
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
				    PC_EmulateCommand(playerid, "menucar");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| Este jogador esta offline.");
					DeletePVar(playerid, "negonegociar");
				}
				else if(MaximoVeiculos(quem)){
				    PC_EmulateCommand(playerid, "menucar");
				    SendClientMessage(playerid, LIGHTBLUE, "|INFO| O Jogador possui o maximo de veiculos.");
				    DeletePVar(playerid, "negonegociar");
				}
				else if(GetPlayerCash(quem) < valor){
				    PC_EmulateCommand(playerid, "menucar");
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
							PutPlayerInVehicle(playerid, VehInfo[playerid][i][Carro], 0);
							
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
						PutPlayerInVehicle(playerid, VehInfo[playerid][i][Carro], 0);
						new Query[179], Cache:R;
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
								new string[600], conta = 20 * PlayerInfo[playerid][Vip];//, carro = GetPVarInt(playerid, "Malas");
								if(conta == 0) conta = 20;
								strcat(string, "Item\tQuantia\n");
								for(new i; i< conta; i++){
									format(string, sizeof string, "%s%s\t%d\n", string, InventarioName(VeiculoConfiguracao[carro][Item][i]), VeiculoConfiguracao[carro][Quantia][i]);
								}
								ShowPlayerDialog(playerid, DIALOG_PORTAMALAS_PLAYER, 5, "{ff0000}# Items Atuais", string, "Ok", "Retornar");
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
							new string[600], conta = 20 * PlayerInfo[playerid][Vip];//, carro = GetPVarInt(playerid, "Malas");
							VeiculoConfiguracao[carro][Quantia][item] = 0;
							VeiculoConfiguracao[carro][Item][item] = NADA;
							if(conta == 0) conta = 20;
							strcat(string, "Item\tQuantia\n");
							for(new i; i< conta; i++){
								format(string, sizeof string, "%s%s\t%d\n",string, InventarioName(VeiculoConfiguracao[carro][Item][i]), VeiculoConfiguracao[carro][Quantia][i]);
								ShowPlayerDialog(playerid, DIALOG_PORTAMALAS_PLAYER, 5, "{ff0000}# Items Atuais", string, "Ok", "Retornar");
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
							new conta = 20 * PlayerInfo[playerid][Vip];
							if(conta == 0) conta = 20;
							for(new i; i< conta; i++){
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
					new conta = 20 * PlayerInfo[playerid][Vip], cont, item = GetPVarInt(playerid, "slotPm"), carro = GetPVarInt(playerid, "Malas");
					if(conta == 0) conta = 20;
		        	for(new i; i<conta; i++){
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
								for(new m; m< conta; m++){
									format(string, sizeof string, "%s%s\t%d\n",string,InventarioName(VeiculoConfiguracao[carro][Item][m]), VeiculoConfiguracao[carro][Quantia][m]);
									ShowPlayerDialog(playerid, DIALOG_PORTAMALAS_PLAYER, 5, "{ff0000}# Items Atuais", string, "Ok", "Retornar");
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
						new conta = 20 * PlayerInfo[playerid][Vip], carro = GetPVarInt(playerid, "Malas");
						if(conta == 0) conta = 20;
						new string[600];
						strcat(string, "Item\tQuantia\n");
						for(new i; i< conta; i++){
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
						SCM(playerid, LIGHTBLUE, " Jogador nao esta em seu porta-malas.");
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
			if(uva == -1) return SCM(playerid, LIGHTBLUE, "Voce digitou um ID Invalido.");
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
	}
	if(dialogid == DIALOG_EDITAR){
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
	if(dialogid == DIALOG_SALVAROB)
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
	return 1;
}