[] call GRAD_stasi_fnc_actionShotgunMic;


// define tracker count
player setVariable ['GRAD_stasi_trackerCount', 1];
// todo handle vehicles spawned at runtime
{
    if (_x isKindOf "Car_F") then {
        [_x] call GRAD_stasi_fnc_actionTrackingDevice;
    };
} forEach vehicles;