params ["_light"];

private _flare = "#lightpoint" createVehicleLocal position _light;
_flare setLightBrightness 2;
_flare setLightAmbient [0.0, 0.0, 0.0];
_flare setLightColor [1.0, 1.0, 1.0];
_flare lightAttachObject [_light, [0,0,0]];
_flare setLightUseFlare true;
_flare setLightFlareSize 1.5;
_flare setLightFlareMaxDistance 50;