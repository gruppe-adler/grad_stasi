params ["_responses"];

private _returnCode = 0;
private _count = count _responses;

missionNamespace setVariable ["GRAD_stasi_interviewSelection", -1];

private _safeZoneRow = safeZoneH/30;

{
  private _ctrl = findDisplay 46 ctrlCreate ["RscButton", -1];
  _ctrl ctrlSetPosition [safeZoneX,safeZoneY-_safeZoneRow*_count,safezoneW,_safeZoneRow*_count];
  _ctrl ctrlCommit 0;
  _ctrl ctrlSetText (_x select 0);
  _ctrl setVariable ["GRAD_stasi_index", _forEachIndex];
  _ctrl ctrlAddEventHandler ["ButtonClick", {
      params ["_ctrl"];
      private _index = _ctrl getVariable ["GRAD_stasi_index", -1];
      missionNamespace setVariable ["GRAD_stasi_interviewSelection", _index];
  }];
} forEach _responses;

waituntil { missionNamespace getVariable ["GRAD_stasi_interviewSelection", -1] != -1 };

private _returnCode = missionNamespace getVariable ["GRAD_stasi_interviewSelection", -1];

_responses select _returnCode params ["_string", "_target"];

_target
