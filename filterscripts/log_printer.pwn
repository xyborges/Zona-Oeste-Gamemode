#define FILTERSCRIPT
#include <open.mp>
#include <file>
new timer;
new tempo;
forward servidoronline();
public servidoronline(){
	static tempo2;
	if(tempo2 >= 0){
		tempo = GetTickCount() - tempo2;
	}
	else
		tempo2 = GetTickCount();

	new string[128], dia, mes, ano, hora, minuto, segundo;


	gettime(hora, minuto, segundo);
	getdate(ano, mes, dia);

	format(string, sizeof string, "LOG_PRINTER: Servidor Online. %d/%d/%d | %02d:%02d:%02d.  Ticks: %d\r\n", dia,mes, ano, hora, minuto, segundo, tempo);
	printf(string);
	new File:handle = fopen("log_printer.txt");
	fwrite(handle, string);
	fclose(handle);
	return 1;
}
public OnFilterScriptInit(){
	timer = SetTimer("servidoronline", 10000, true);
	return 1;
}
public OnFilterScriptExit(){
	KillTimer(timer);
	return 1;
}
