#include <a_samp>
#include <zcmd>
#include <sscanf2>

// MIREX RP - AURORA RP
#define SERVER_NAME "Mirex RP | Aurora RP"

new PlayerRUB[MAX_PLAYERS];
new PlayerUSD[MAX_PLAYERS];
new PlayerCitizenship[MAX_PLAYERS]; // 1=RU, 2=US, 3=Dual

public OnGameModeInit()
{
    SetGameModeText(SERVER_NAME);
    print("Mirex RP Aurora RP загружен!");
    return 1;
}

public OnPlayerConnect(playerid)
{
    PlayerRUB[playerid] = 50000;
    PlayerUSD[playerid] = 500;
    PlayerCitizenship[playerid] = 1;
    SetPlayerPos(playerid, 1480.0, -1720.0, 13.0);
    SendClientMessage(playerid, -1, "Добро пожаловать в Mirex RP - Aurora RP!");
    return 1;
}

CMD:stats(playerid)
{
    new str[300];
    format(str, sizeof(str), "RUB: %d | USD: %d | Гражданство: %s", PlayerRUB[playerid], PlayerUSD[playerid], PlayerCitizenship[playerid]==1?"Россия":"США");
    SendClientMessage(playerid, -1, str);
    return 1;
}

CMD:spb(playerid) { SetPlayerPos(playerid, 1480.0, -1720.0, 13.0); SendClientMessage(playerid, -1, "Вы в Санкт-Петербурге"); return 1; }
CMD:ny(playerid) { SetPlayerPos(playerid, -2200.0, 2300.0, 20.0); SendClientMessage(playerid, -1, "Вы в Нью-Йорке"); return 1; }

CMD:citizenship(playerid, params[])
{
    new id;
    if(sscanf(params, "i", id)) return SendClientMessage(playerid, -1, "/citizenship 1(RU) 2(US) 3(Dual)");
    PlayerCitizenship[playerid] = id;
    SendClientMessage(playerid, -1, "Гражданство обновлено");
    return 1;
}