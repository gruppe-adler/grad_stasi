params ["_vehicle", "_unit"];


[5, [_vehicle, _unit], {
    _this params ["_args"];
	_args params ["_vehicle", "_unit"];

	_vehicle setVariable ['GRAD_stasi_trackerAttached', false, true];

	private _currentCount = _unit getVariable ['GRAD_stasi_trackerCount', 0];
	_unit setVariable ['GRAD_stasi_trackerCount', _currentCount + 1];

	hint "Removed device";

}, {
	hint "Aborted removing device";
}, 
	"Removing tracking device", 
	{true}, 
	["isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"]
] call ace_common_fnc_progressBar;