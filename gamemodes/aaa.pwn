#include <open.mp>
#include <cef>
#include <streamer>
#include <Pawn.CMD>
#include <sscanf2>
new DIALOG_LOGARADMIN = 1;
new PlayerBrowser[MAX_PLAYERS];
/* ============== Parte do CEF ==================*/
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    return 1;
}
forward CriarLoginCEF(playerid);
forward InitLoginPWN(playerid, const arguments[]);
forward OnLoginAdmin(playerid, const arguments[]);
forward CamposNulosPWN(playerid, const args[]);
forward LoginPWN(playerid, const nome[], const senha[]);
forward EleEsqueceuPWN(playerid);
forward OnCefInitialize(player_id, success);
forward OnCefBrowserCreated(player_id, browser_id, status_code);

public OnCefInitialize(player_id, success) {
    if (success == 1) {
        cef_subscribe("CamposNulosJS", "CamposNulosPWN");
        cef_subscribe("pwd:loginjs", "LoginPWN");
        cef_subscribe("login:InitLoginJS", "InitLoginPWN");
        SendClientMessage(player_id, -1,"CEF foi inicializado com sucesso.");
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
    new nome[MAX_PLAYER_NAME], senha[32];
    sscanf(arguments, "p<,>s[24]s[32]", nome, senha);
    SendClientMessage(playerid, -1, "%s | %s", nome, senha);

    return 1;
}
public EleEsqueceuPWN(playerid){
    SendClientMessage(playerid, -1, "Que pena! Volte quando lembrar.");
    EsconderLoginAdmin(playerid);
}
public OnLoginAdmin(playerid, const arguments[]){
    if(!strcmp(arguments, "algas")){
        new string[7];
        format(string, sizeof string, arguments);
        EsconderLoginAdmin(playerid);
        SendClientMessage(playerid, -1, "Senha digitada corretamente. %s %d", arguments[0], arguments[1]);
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
            return cef_load_url(playerid, PlayerBrowser[playerid], "http://177.54.146.232:7720/loginadmin.html");

        
        cef_create_browser(playerid, PlayerBrowser[playerid], "http://177.54.146.232:7720/loginadmin.html", false, true); //создаем браузер
        
    }
    return 1; 
}
cmd:loginadm(playerid) return CriarLoginAdmin(playerid);
cmd:pluginc(playerid){
    if(cef_player_has_plugin(playerid)){
        SendClientMessage(playerid, -1, "Certo");
        CriarLoginCEF(playerid);
    }
    else{
        SendClientMessage(playerid, -1, "Errado");
    }
    return 1;
}
public CriarLoginCEF(playerid){
    if(cef_player_has_plugin(playerid)){
        
        if(PlayerBrowser[playerid])
            return cef_load_url(playerid, PlayerBrowser[playerid], "http://177.54.146.232:7720/loginplayer.html");

        SendClientMessage(playerid, -1,"Aguarde a tela de login aparecer, isso pode levar alguns segundos...");        
        cef_create_browser(playerid, PlayerBrowser[playerid], "http://177.54.146.232:7720/loginplayer.html", false, true); //создаем браузер
        
    }
    return 1;   
}
public OnPlayerConnect(playerid){
    cef_focus_browser(playerid, PlayerBrowser[playerid], false);
    return 1;
}
public LoginPWN(playerid, const nome[], const senha[]){
    printf("%d, %s, %s", playerid, nome, senha);
    return 1;
}
public CamposNulosPWN(playerid, const args[]){
    if(!isnull(args))
        SendClientMessage(playerid, -1, "Seus campos estão nulos!");
    return 1;
}
EsconderLoginAdmin(playerid){
    cef_emit_event(playerid, "loginpage:resposta", CEFINT(1));
    cef_focus_browser(playerid, PlayerBrowser[playerid], false);
    return 1;
}