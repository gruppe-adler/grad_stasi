private _micPoint = missionNamespace getVariable ["GRAD_stasi_micPoint", objNull];
if (isNull _micPoint) exitWith {};

private _currentDistance = missionNamespace getVariable ["GRAD_STASI_MIC_CURRENT_DISTANCE", 1];
private _maxDistance = missionNamespace getVariable ["GRAD_STASI_MIC_MAX_DISTANCE", 150];
private _minDistance = missionNamespace getVariable ["GRAD_STASI_MIC_MIN_DISTANCE", 1];

if ((_this select 1) > 1 && (_currentDistance < _maxDistance)) then {
    _currentDistance = _currentDistance + 0.5;
};
if ((_this select 1) < -1 && (_currentDistance > _minDistance)) then {
    _currentDistance = _currentDistance - 0.5;
};

missionNamespace setVariable ["GRAD_STASI_MIC_CURRENT_DISTANCE", _currentDistance];
systemChat str ("Focus at: " + str _currentDistance);