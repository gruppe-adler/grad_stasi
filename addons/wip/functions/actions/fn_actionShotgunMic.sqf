// ACTIVATE SHOTGUN MIC
private _shotgunMicOn = ["grad_stasi_shotgunMicOn", "Richtmikrofon AN", "", 
{
   	[_player] call GRAD_stasi_fnc_shotgunMic;
}, 
{
    (player getVariable ['GRAD_stasi_isStasi', false]) &&
    !(player getVariable ['GRAD_shotgunMicActive', false])
}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _shotgunMicOn] call ace_interact_menu_fnc_addActionToObject;


// DEACTIVATE SHOTGUN MIC
private _shotgunMicOff = ["grad_stasi_shotgunMicOff", "Richtmikrofon AUS", "", 
{
   	player setVariable ['GRAD_shotgunMicActive', false];
}, 
{
    (player getVariable ['GRAD_shotgunMicActive', false])
}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _shotgunMicOff] call ace_interact_menu_fnc_addActionToObject;