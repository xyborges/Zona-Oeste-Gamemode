#include <open.mp>
#include <a_mysql>
static MySQL:Dados;
/*new host[21] = "149.56.84.18";
new database[24] = "joaob_2526";
new login[24] = "borges";
new senha[17] =  "";*/
public OnGameModeInit(){
	ligarmysql();
	return 1;
}
stock ligarmysql(){
	mysql_log(ALL);
	Dados = mysql_connect("149.56.84.18", "BorgesAll", "@5h", "joaob_2526");
	if(mysql_errno() == 0){
		printf("Database MYSQL foi carregada com sucesso.");
	}
	else{
		print("-=======================================================-");
		printf("Database MYSQL obteve falha na conexão!");
		print("-=======================================================-");
		mysql_close(Dados);
	}
	return 1;
}