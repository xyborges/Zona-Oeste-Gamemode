new PlayerBrowser[MAX_PLAYERS];
/* ============== Parte do CEF ==================*/
forward InitLoginPWN(playerid, const arguments[]);
forward OnLoginAdmin(playerid, const arguments[]);
forward CamposNulosPWN(playerid, const args[]);
forward LoginPWN(playerid, const arguments[]);
forward EleEsqueceuPWN(playerid);
forward OnCefInitialize(player_id, success);
forward OnCefBrowserCreated(player_id, browser_id, status_code);

public OnCefInitialize(player_id, success) {
    if (success == 1) {
    	cef_subscribe("EleEsqueceuJS", "EleEsqueceuPWN");
      	cef_subscribe("CamposNulosJS", "CamposNulosPWN");
      	cef_subscribe("LoginJS", "LoginPWN");
      	cef_subscribe("login:InitLoginJS", "InitLoginPWN");
        cef_subscribe("loginpage:login", "OnLoginAdmin");
        SendClientMessage(player_id, LIGHTBLUE,"CEF foi inicializado com sucesso.");
        return;
    }

}
public OnCefBrowserCreated(player_id, browser_id, status_code) {
    if (browser_id == player_id) {
        if (status_code != 200) {
            return;
        }

    }
}
public InitLoginPWN(playerid, const arguments[]){
	SendClientMessage(playerid, LIGHTRED, "Logica de login iniciada.");
	return 1;
}
public EleEsqueceuPWN(playerid){
	SendClientMessage(playerid, LIGHTRED, "Que pena! Volte quando lembrar.");
	EsconderLoginAdmin(playerid);
}
public OnLoginAdmin(playerid, const arguments[]){
	if(!strcmp(arguments, "algas")){
		new string[7];
		format(string, sizeof string, arguments);
		EsconderLoginAdmin(playerid);
		SendClientMessage(playerid, -1, "Senha digitada corretamente.");
        OnDialogResponse(playerid, DIALOG_LOGARADMIN, true, 0, string);
	}
	else{
		EsconderLoginAdmin(playerid);
		SendClientMessage(playerid, -1, "Você não digitou a senha correta.");
	}
}
CriarLoginAdmin(playerid)
{

    if(cef_player_has_plugin(playerid)){
        
        if(PlayerBrowser[playerid])
            return cef_load_url(playerid, PlayerBrowser[playerid], "http://149.56.84.18:7720/loginadmin.html");

        
        cef_create_browser(playerid, PlayerBrowser[playerid], "http://149.56.84.18:7720/loginadmin.html", false, true); //создаем браузер
        
    }
    return 1; 
}
cmd:pluginc(playerid){
	if(cef_player_has_plugin(playerid)){
		SendClientMessage(playerid, LIGHTRED, "Certo");
		CriarLoginCEF(playerid);
	}
	else{
		SendClientMessage(playerid, LIGHTRED, "Errado");
	}
	return 1;
}
function CriarLoginCEF(playerid){
    if(cef_player_has_plugin(playerid)){
        
        /*if(PlayerBrowser[playerid])
            return cef_load_url(playerid, PlayerBrowser[playerid], "http://149.56.84.18:7720/loginplayer.html");*/

		SendClientMessage(playerid, LIGHTBLUE,"Aguarde a tela de login aparecer, isso pode levar alguns segundos...");        
        cef_create_browser(playerid, PlayerBrowser[playerid], "http://149.56.84.18:7720/loginplayer.html", false, true); //создаем браузер
        
    }
    return 1;	
}
public LoginPWN(playerid, const arguments[]){
	new nome[MAX_PLAYER_NAME], senha[MAX_PLAYER_SENHA];
	sscanf(arguments, "p<,>s[24]s[32]", nome, senha);//, const format[], ...)
	ContinuarLogin(playerid, nome, senha);
	return 1;
}
public CamposNulosPWN(playerid, const args[]){
	if(isnull(args))
		SendClientMessage(playerid, LIGHTRED, "Seus campos estão nulos!");
	return 1;
}
EsconderLoginAdmin(playerid){
    cef_emit_event(playerid, "loginpage:resposta", CEFINT(1));
    cef_focus_browser(playerid, PlayerBrowser[playerid], false);
    return 1;
}
FecharLogin(playerid){
	//cef_emit_event(playerid, "loginpage:resposta", CEFINT(1));
	//cef_focus_browser(playerid, PlayerBrowser[playerid], false);
	//cef_destroy_browser(playerid, PlayerBrowser[playerid]);
}
/* ============== Parte do CEF ==================*/
/*forward OnLoginAdmin(playerid, const arguments[]);
forward CamposNulosPWN(playerid, const args[]);
forward LoginPWN(playerid, const arguments[]);
forward EleEsqueceuPWN(playerid);
forward OnCefInitialize(player_id, success);
forward OnCefBrowserCreated(player_id, browser_id, status_code);

public OnCefInitialize(player_id, success) {
    if (success == 1) {
    	cef_subscribe("EleEsqueceuJS", "EleEsqueceuPWN");
      	cef_subscribe("CamposNulosJS", "CamposNulosPWN");
      	cef_subscribe("pwd:loginjs", "LoginPWN");
        cef_subscribe("loginpage:login", "OnLoginAdmin");
        SendClientMessage(player_id, LIGHTBLUE,"CEF foi inicializado com sucesso.");
        return;
    }

}
public OnCefBrowserCreated(player_id, browser_id, status_code) {
    if (browser_id == player_id) {
        if (status_code != 200) {
            return;
        }

    }
}
public EleEsqueceuPWN(playerid){
	SendClientMessage(playerid, LIGHTRED, "Que pena! Volte quando lembrar.");
	EsconderLoginAdmin(playerid);
}
public OnLoginAdmin(playerid, const arguments[]){
	if(!strcmp(arguments, "algas")){
		new string[7];
		format(string, sizeof string, arguments);
		EsconderLoginAdmin(playerid);
		SendClientMessage(playerid, -1, "Senha digitada corretamente.");
        OnDialogResponse(playerid, DIALOG_LOGARADMIN, true, 0, string);
	}
	else{
		EsconderLoginAdmin(playerid);
		SendClientMessage(playerid, -1, "Você não digitou a senha correta.");
	}
}
CriarLoginAdmin(playerid){

    if(cef_player_has_plugin(playerid)){
      
        cef_create_browser(playerid, PlayerBrowser[playerid], "http://149.56.84.18:7777/loginadmin.html", false, true); //создаем браузер
        
    }
    return 1; 
}
function CriarLoginCEF(playerid){
    if(cef_player_has_plugin(playerid)){
        
        if(PlayerBrowser[playerid])
            return cef_load_url(playerid, PlayerBrowser[playerid], "http://149.56.84.18:7720/loginplayer.html");

		SendClientMessage(playerid, LIGHTBLUE,"Aguarde a tela de login aparecer, isso pode levar alguns segundos...");        
        cef_create_browser(playerid, PlayerBrowser[playerid], "http://149.56.84.18:7777/loginplayer.html", false, true); //создаем браузер
        
    }
    return 1;	
}
public LoginPWN(playerid, const arguments[]){

	new nome[24], senha[32];
	sscanf(arguments, "p<,>s[24]s[32]", nome, senha);

	if(strlen(nome) > 24){
		SendClientMessage(playerid, LIGHTRED, "Você não pode digitar um nome tão grande assim.");
	}
	else if(isnull(nome) || isnull(senha)){
		SendClientMessage(playerid, LIGHTRED, "Voce precisa preencher todos os Campos.");
	}
	else{
		//, const format[], ...)
		ContinuarLogin(playerid, nome, senha);
	}
	return 1;
}
public CamposNulosPWN(playerid, const args[]){
	if(isnull(args))
		SendClientMessage(playerid, LIGHTRED, "Seus campos estão nulos!");
	return 1;
}
EsconderLoginAdmin(playerid){
    cef_emit_event(playerid, "loginpage:resposta", CEFINT(1));
    cef_focus_browser(playerid, PlayerBrowser[playerid], false);
    cef_destroy_browser(playerid, PlayerBrowser[playerid]);
    return 1;
}*/