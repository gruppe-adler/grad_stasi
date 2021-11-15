private _micPoint = missionNamespace getVariable ["GRAD_stasi_micPoint", objNull];
if (isNull _micPoint) exitWith {};

if ((_this select 1) > 1 && (GRAD_STASI_MIC_CURRENT_DISTANCE < GRAD_STASI_MIC_MAX_DISTANCE)) then {
  GRAD_STASI_MIC_CURRENT_DISTANCE = GRAD_STASI_MIC_CURRENT_DISTANCE + 0.5;
};
if ((_this select 1) < -1 && (GRAD_STASI_MIC_CURRENT_DISTANCE > GRAD_STASI_MIC_MIN_DISTANCE)) then {
  GRAD_STASI_MIC_CURRENT_DISTANCE = GRAD_STASI_MIC_CURRENT_DISTANCE - 0.5;
};

systemChat str ("Focus at: " + str GRAD_STASI_MIC_CURRENT_DISTANCE);