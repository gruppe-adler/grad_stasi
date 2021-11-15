params ["_vehicle", "_chanceForSuccess", "_isRevealed"];

private _hasTracker = _vehicle getVariable ["GRAD_stasi_trackerAttached", false];
private _randomDice = random 1;

systemChat (str _randomDice + " vs " + str _chanceForSuccess + str _hasTracker + str _vehicle);

if ((_randomDice < _chanceForSuccess && _hasTracker) || _isRevealed) then {

	[_vehicle] spawn {
		params ["_vehicle"];
		private _result = ["Found a Device. Do you want to destroy it?", "Destroy Device", "Destroy", "Dont destroy"] call BIS_fnc_guiMessage;

		if (_result) then {
			_vehicle setVariable ["GRAD_stasi_trackerAttached", false, true];
			_vehicle setVariable ["GRAD_stasi_trackerRevealed", false, true];
			hintSilent "Succesfully destroyed Device.";
		} else {
			_vehicle setVariable ["GRAD_stasi_trackerRevealed", true, true];
			hintSilent "Left device undestroyed.";
		};
	};

} else {
	hintSilent "";
	["Finished search. No tracker found.", "", "OK", false] spawn BIS_fnc_guiMessage;
	
};