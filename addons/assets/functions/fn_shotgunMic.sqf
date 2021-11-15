params ["_unit"];

player setVariable ["GRAD_shotgunMicActive", true];

// debug
private _debugObject = "Sign_Sphere10cm_F" createVehicleLocal (position player);
private _objectCache = objNull;

missionNamespace setVariable ["GRAD_stasi_micPoint", _debugObject];

[] call GRAD_stasi_fnc_createShotgunMicInterface;

private _mouseWheelEH = (findDisplay 46) displayAddEventHandler [
      "MouseZChanged",
      "_this call GRAD_stasi_fnc_interpretMouseWheel"
];



[{
	params ["_args", "_handle"];
	_args params ["_debugObject", "_objectCache", "_mouseWheelEH"];

	if (!(player getVariable ["GRAD_shotgunMicActive", false])) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		_unit setVariable ["TF_fnc_position", TFAR_fnc_defaultPositionCoordinates];
		missionNamespace setVariable ["GRAD_stasi_micPoint", objNull];
		deleteVehicle _debugObject;
		(findDisplay 46) displayRemoveEventHandler ["MouseZChanged",_mouseWheelEH];
		// reset volume
		// player setVariable ["tf_globalVolume", 1];
	};

	// max range 150
	private _humanEye = positionCameraToWorld [0,0,0];
	private _aimVector = ((getCameraViewDirection player) vectorMultiply GRAD_STASI_MIC_CURRENT_DISTANCE);
	private _eyeTargetInRange = _humanEye vectorAdd _aimVector;

	private _earDropTarget = [0,0,0];


	/*
	private _objectTarget =  lineIntersectsSurfaces [
		AGLtoASL _humanEye, AGLtoASL _eyeTargetInRange, player];
	*/

	// private _isObjectTarget = count _objectTarget > 0;

	private _cursorObject = cursorObject;
	private _objectCache = missionNamespace getVariable ["GRAD_stasi_shotgunMicObjectCache", objNull];
	if (_cursorObject isKindOf "Man" && 
		_cursorObject distance player < GRAD_STASI_MIC_CURRENT_DISTANCE
		) then {
		private _objectCache = missionNamespace setVariable ["GRAD_stasi_shotgunMicObjectCache", cursorObject];
		if (random 2 > 1.9) then {
			playSound (selectRandom [
				"GRAD_stasi_staticDetect1",
				"GRAD_stasi_staticDetect2",
				"GRAD_stasi_staticDetect3",
				"GRAD_stasi_staticDetect4"
			]);
		};
	} else {
		_objectCache = _cursorObject;
	};

	_earDropTarget = _eyeTargetInRange;

	/*
	if (!_isObjectTarget) then {

		_earDropTarget = _eyeTargetInRange;
		
		systemChat "out of range, limiting distance to " + str GRAD_STASI_MIC_CURRENT_DISTANCE;
	} else {
		_earDropTarget = ASLtoAGL (_objectTarget select 0 select 0);
		systemChat str _earDropTarget;
	};
	*/

	// reduce volume with distance
	// player setVariable ["tf_globalVolume", 1-((player distance _earDropTarget)/50)];

	// systemChat ("target in " + str (_earDropTarget distance player) + " m");

	private _fakePosition = [_earDropTarget, (positionCameraToWorld [0,0,1]) vectorDiff _earDropTarget];
	player setVariable ["TF_fnc_fakePosition", _fakePosition];
	player setVariable ["TF_fnc_position", {player getVariable ["TF_fnc_fakePosition", nil]}];
	_debugObject setPos _earDropTarget;
	

}, 0, [_debugObject, _objectCache, _mouseWheelEH]] call CBA_fnc_addPerFrameHandler;





[{
	params ["_args", "_handle"];
	_args params ["_staticNoise"];

	if (!(player getVariable ["GRAD_shotgunMicActive", false])) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};	

	playSound "GRAD_stasi_static";
	
}, 15, [_staticNoise]] call CBA_fnc_addPerFrameHandler;