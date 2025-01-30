// variáveis

#define MAX_ALUGUEIS 50
new Iterator:CarroDeAluguel<MAX_ALUGUEIS>;

main(){
	//mysql_query(MySQL:handle, const query[], bool:use_cache = true)

	mysql_tquery(Dados, "CREATE TABLE IF NOT EXISTS CarrosAlugados (Vid int PRIMARY KEY,\
		Dono varchar(24) NOT NULL,\
		VeiculoModelo int DEFAULT 0,\
		VeiculoX double DEFAULT 0.0,\
		VeiculoY double DEFAULT 0.0,\
		VeiculoZ double DEFAULT 0.0,\
		VeiculoA double DEFAULT 0.0);");
}

enum VeiculoAluguelE{
	OVeiculo,
	VeiculoModelo,
	VeiculoDono[MAX_PLAYER_NAME],
	Float:VeiculoPos[4]
}
new InfoAluguel[MAX_ALUGUEIS][VeiculoAluguelE];

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
// funções -----------
SalvarAlugueis(){
	new string[255];
	foreach(new i: CarroDeAluguel){
		mysql_format(Dados, string, sizeof string, "UPDATE CarrosAlugados SET VeiculoModelo = '%d', VeiculoX = '%f', VeiculoY = '%f', VeiculoZ = '%f', VeiculoA = '%f' \
			WHERE Vid = '%d'",
			InfoAluguel[i][VeiculoModelo], InfoAluguel[i][VeiculoPos][0], InfoAluguel[i][VeiculoPos][1], InfoAluguel[i][VeiculoPos][2], InfoAluguel[i][VeiculoPos][3], i);
		mysql_tquery(Dados, string);
	}
	return 1;
}
DeletarVehAluguel(Vid){
	new string[50];
	mysql_format(Dados, string, sizeof string, "DELETE FROM CarrosAlugados WHERE Vid = '%d'", Vid);
	mysql_tquery(Dados, string);
	DestroyVehicle(InfoAluguel[i][OVeiculo]);
	new reset[VeiculoAluguelE];
	InfoAluguel[Vid] = reset;
	return 1;
}
CarregarAlugueis(){
	new string[128], Cache: c, i;
	mysql_format(Dados, string, sizeof string, "SELECT * FROM CarrosAlugados");
	c = mysql_tquery(Dados, string);
	for(new i; i < cache_num_rows(c); i++){
		cache_get_value_name_float(i, "VeiculoX", InfoAluguel[i][VeiculoPos][0]);
		cache_get_value_name_float(i, "VeiculoY", InfoAluguel[i][VeiculoPos][1]);
		cache_get_value_name_float(i, "VeiculoZ", InfoAluguel[i][VeiculoPos][2]);
		cache_get_value_name_float(i, "VeiculoA", InfoAluguel[i][VeiculoPos][3]);
		cache_get_value_name(i, "Dono", InfoAluguel[i][VeiculoDono]);
		cache_get_value_name_float(i, "VeiculoModelo", InfoAluguel[i][VeiculoModelo]);
		InfoAluguel[i][OVeiculo] = CreateVehicle(InfoAluguel[i][VeiculoModelo], InfoAluguel[i][VeiculoPos][0], InfoAluguel[i][VeiculoPos][1], InfoAluguel[i][VeiculoPos][2], InfoAluguel[i][VeiculoPos][3], random(128), random(128), -1);//, bool:addSiren = false)
	}
	if(cache_is_valid(c)) cache_delete(c);
	return 1;
}