forward RegistrarJogador(playerid);
public RegistrarJogador(playerid){	
	new dest[BCRYPT_HASH_LENGTH];
	bcrypt_get_hash(dest);
	new Query[255];
	format(Query, sizeof Query, "INSERT INTO Players (Nome, Senha) VALUES ('%q', '%q')", nome(playerid), dest);
	db_query(Database, Query);
	SendClientMessage(playerid, VERDE, "Sucesso! Voce foi registrado em nosso Banco de Dados.");
	CarregarDados(playerid);

	BCRYPT_HASH_LENGTH[0] = EOS;
	dest[0] = EOS;
	return 1;
}