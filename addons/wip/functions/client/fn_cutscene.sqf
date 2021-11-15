/*

execVM "grad-stasi/functions/client/fn_cutscene.sqf";

*/

private _cutsceneDuration = 200;

private _position_1 = getPos stasi_cutscene_cam_1;
private _position_2 = getPos stasi_cutscene_cam_2;

private _cam = "camera" camCreate _position_1;
_cam cameraeffect ["internal","back"];
cameraEffectEnableHUD false;
_cam camSetTarget stasi_cutscene_paper;
_cam camSetFov 0.45;
_cam camCommand "INERTIA ON";
_cam camCommit 0;


// ["BlackAndWhite", 0, false] call BIS_fnc_setPPeffectTemplate;

// black and white
private _ppcolor = ppEffectCreate ["colorCorrections", 2005];
_ppcolor ppEffectAdjust [1, 1.7, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
_ppcolor ppEffectCommit 0;
_ppcolor ppEffectEnable TRUE;

// grain
private _ppgrain = ppEffectCreate ["filmGrain", 2004];
_ppgrain ppEffectAdjust [1, 2.5, 3, 0.5, 1];
_ppgrain ppEffectCommit 0;
_ppgrain ppEffectEnable TRUE;

// chromatic abberation
private _ppchrom = ppEffectCreate ["ChromAberration",2003];
_ppchrom ppEffectAdjust [0.01, 0.01, true];
_ppchrom ppEffectCommit 0;
_ppchrom ppEffectEnable TRUE;

// camera overlay
/*
"cameraOverlay" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
private _display = uiNamespace getVariable ["RscTitleDisplayEmpty",displayNull];
private _background = _display ctrlCreate ["RscPicture",-1];
_background ctrlSetText "grad-stasi\data\campic.paa";
_background ctrlSetPosition [safezoneX,safezoneY,safeZoneW, safeZoneH];
_background ctrlCommit 0;
*/
("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];

createDialog "rscCutSceneCam";
setAperture 15;

stasi_cutscene_officer switchMove "InBaseMoves_table1";
stasi_cutscene_victim switchMove "acex_sitting_HubSittingChairB_move1";
stasi_cutscene_officer setRandomLip true;

stasi_cutscene_officer disableAI "ANIM";
stasi_cutscene_victim disableAI "ANIM";

{
    _x addEventHandler ["AnimDone", {
        params ["_unit", "_anim"];

        _unit switchMove _anim;

    }];
} forEach [stasi_cutscene_officer, stasi_cutscene_victim];



diwako_dui_main_toggled_off = true;


private _display = uinamespace getVariable "rscCutSceneCam";
private _progressBar = _display displayCtrl 2301;

private _button = _display displayCtrl 1000;
_button buttonSetAction ["missionNameSpace setVariable ['cutsceneOver', true];"];

private _begin = time;

[{
    params ["_args", "_handle"];
    _args params ["_progressBar", "_cutsceneDuration", "_begin"];

    _progressBar progressSetPosition (linearConversion [_begin, _begin + _cutsceneDuration, time, 0, 1, true]);
}, 0, [_progressBar, _cutsceneDuration, _begin]] call CBA_fnc_addPerFrameHandler;


private _introTextHeadline_content = "Aus Jürgen Fuchs: Vernehmungsprotokolle.";
private _introTextCopy_content = "Jürgen Fuchs saß 281 Tage in der Untersuchungshaftanstalt des Ministeriums für Staatssicherheit (MfS) in Berlin-Hohenschönhausen. Er sollte sich selbst belasten, er sollte seine Freunde verraten, er sollte sich von den zu Staatsfeinden abgestempelten Kritikern Wolf Biermann und Robert Havemann distanzieren. Trotz monatelanger Bemühungen konnte die für die Verfolgung des ,politischen Untergrundes' zuständige Hauptabteilung IX/2 des MfS keines dieser Ziele erreichen. Am Ende wurde Fuchs nach West-Berlin abgeschoben.";

// private _display = findDisplay 46;
private _introTextHeadline = _display ctrlCreate ["RscStructuredText", -1];
_introTextHeadline ctrlSetStructuredText parseText format [
    "<t color='#999999' size='2.1'>%1</t>",
    _introTextHeadline_content
];
_introTextHeadline ctrlSetPosition [
    safeZoneX+safeZoneW/60,
    safeZoneY+safeZoneH/30,
    safeZoneW,
    safeZoneH
];
_introTextHeadline ctrlsetFade 1;
_introTextHeadline ctrlCommit 0;

_introTextHeadline ctrlsetFade 0;
_introTextHeadline ctrlCommit 3;

uiSleep 5;
_introTextHeadline ctrlsetFade 1;
_introTextHeadline ctrlCommit 3;

uiSleep 3;

private _introTextCopy = _display ctrlCreate ["RscStructuredText", -1];
_introTextCopy ctrlSetStructuredText parseText format [
    "<t color='#999999' size='1'>%1</t>",
    _introTextCopy_content
];

_introTextCopy ctrlSetPosition [
    safeZoneX+safeZoneW/60,
    safeZoneY+safeZoneH/30,
    safeZoneW-safeZoneW/60,
    safeZoneH
];
_introTextCopy ctrlsetFade 1;
_introTextCopy ctrlCommit 0;

_introTextCopy ctrlsetFade 0;
_introTextCopy ctrlCommit 3;

uiSleep 15;
_introTextCopy ctrlsetFade 1;
_introTextCopy ctrlCommit 3;


waituntil {
    missionNameSpace getVariable ['cutsceneOver', false]
};


_ppcolor ppEffectEnable false;
ppEffectDestroy _ppcolor;

_ppgrain ppEffectEnable false;
ppEffectDestroy _ppgrain;

_ppchrom ppEffectEnable false;
ppEffectDestroy _ppchrom;

_cam cameraEffect ["terminate","back"];
camDestroy _cam;

("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["", "PLAIN"];
