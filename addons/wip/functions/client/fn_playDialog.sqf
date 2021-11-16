/*

*/

private _database = execVM "grad-stasi\dialogs\textArray.sqf";

private _statementSelector = 0;
private _responseSelector = 0;

while {true} do {

    private _statement = _database select _statementSelector select 0;
    private _responses = _database select _statementSelector select 1;

    _statement params ["_string", "_target"];

    systemChat _string;
    _statementSelector = _target;

    // todo player chooses response

    private _responseSelector = [_responses] spawn GRAD_stasi_fnc_getResponse;
    waituntil {scriptDone _responseSelector};

    _responses select _responseSelector params ["_string", "_target"];

    systemChat _string;
    _statementSelector _target;

    sleep 5;
};
