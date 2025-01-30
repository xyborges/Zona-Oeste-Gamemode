/*

Sistema de contratos de assasinato ( para facções )

- Contrato
- Contratante
- Alvo

Comando para pedir Contrato (/contrato)
	- Alvo
	- valor (acima de 5000R$ somente)
	- facção ( Sigla )

Menu com informações de pedidos de contratos (/menucontrato)
 	- Alvo
 	- valor
 	- Contratante

Menu com informações do pedido após ser aceito por um criminoso (/meuscontratos)
	- Alvo
	- valor
	- Localização
		- Distância em metros ou região do alvo?
		- comando para localizar por um breve tempo a posição do Alvo?

Complementos:

	- 40% do dinheiro do assasinato vai para a organização ( 40% 5000r$ = 2000R$)
	- máximo de três pedidos por assasino

*/

#define LIGHTRED 		 	0xff8080FF
#define LIGHTBLUE 	   	 	0x00C2ECFF
new DB:ContratosDb;
main(){
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
