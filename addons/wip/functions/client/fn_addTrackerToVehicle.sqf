params ["_vehicle", "_unit"];


[
		5, 
		[_vehicle, _unit], {
				_this params ["_args"];
				_args params ["_vehicle", "_unit"];

				
				[_vehicle,3,1,1,1,{
					params ["_unit","_target","_updateInterval"];
					private _reception = 1 - (_unit distance2D _target)/10000;
					_reception
				},-1,false] call grad_gpsTracker_fnc_openTitle;


				[_vehicle,false] call grad_gpsTracker_fnc_setTarget;


				private _trackerCount = player getVariable ['GRAD_stasi_trackerCount', 0];
				player setVariable ['GRAD_stasi_trackerCount', _trackerCount - 1];
				_vehicle setVariable ["GRAD_stasi_trackerAttached", true, true];

				hint "Added device to vehicle";

		},{
		
				hint "Aborted adding device";
		}, 
		"Attaching tracking device to vehicle",
		{true}, 
		["isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"]
] call ace_common_fnc_progressBar;