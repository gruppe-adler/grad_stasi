/*

    manages ace actions for adding, removing and detecting tracking devices

    server only
*/

params ["_vehicle"];

private _addTrackingDevice = ["grad_stasi_addTrackingDevice", "Peilsender anbringen", "", 
{
    [_target, _player] call GRAD_stasi_fnc_addTrackerToVehicle;
}, 
{
    _player getVariable ['GRAD_stasi_isStasi', false] && 
    {_player getVariable ['GRAD_stasi_trackerCount', 0] > 0}
}] call ace_interact_menu_fnc_createAction;


private _removeTrackingDevice = ["grad_stasi_removeTrackingDevice", "Peilsender anbringen", "", 
{
    [_target, _player] call GRAD_stasi_fnc_removeTrackerFromVehicle;
}, 
{
    _player getVariable ['GRAD_stasi_isStasi', false] && 
    {_player getVariable ['GRAD_stasi_trackerCount', 0] == 0 && _target getVariable ['GRAD_stasi_trackerAttached', false]}
}] call ace_interact_menu_fnc_createAction;


private _checkForDevices = ["grad_stasi_checkForDevices", "Check Vehicle for strange Devices", "", 
{
    [_target] call GRAD_stasi_fnc_checkVehicleForTracker;
}, 
{
    !(_player getVariable ['GRAD_stasi_isStasi', false])
}] call ace_interact_menu_fnc_createAction;



// add actions
[_vehicle, 0, ["ACE_MainActions"], _addTrackingDevice] call ace_interact_menu_fnc_addActionToObject;
[_vehicle, 0, ["ACE_MainActions"], _removeTrackingDevice] call ace_interact_menu_fnc_addActionToObject;
[_vehicle, 0, ["ACE_MainActions"], _checkForDevices] call ace_interact_menu_fnc_addActionToObject;