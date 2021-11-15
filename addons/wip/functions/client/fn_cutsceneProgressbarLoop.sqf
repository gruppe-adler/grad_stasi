params ["_area"];

private _progressBar = execVM "grad-stasi\functions\client\cutsceneProgressbarCreate.sqf";
private _minDistance = 0;
private _maxDistance = 5;

_handle = [{
    params ["_args", "_handle"];
    _args params ["_minDistance", "_maxDistance", "_area", "_progressBar"];

    private _distance = player distance _area;
    private _color = [_distance] call GRAD_pilotCam_fnc_getColorForDistance;
    
    _progressBar progressSetPosition (linearConversion 
        [_minDistance, _maxDistance, _distance, 0, 1, true]
    );
    _progressBar ctrlSetTextColor _color;
    _progressBar ctrlCommit 0;

}, 0.05, [_minDistance, _maxDistance, _area, _progressBar]] call CBA_fnc_addPerFrameHandler;

[_handle, _progressBar]