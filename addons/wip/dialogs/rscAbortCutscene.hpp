// include in rsctitles
class RscButton
{
    access = 0;
    type = CT_BUTTON;
    style = ST_LEFT;
    x = 0; y = 0; w = 0.3; h = 0.1;
    text = "";
    font = "TahomaB";
    sizeEx = 0.04;
    colorText[] = {0,0,0,1};
    colorDisabled[] = {0.3,0.3,0.3,1};
    colorBackground[] = {0.6,0.6,0.6,1};
    colorBackgroundDisabled[] = {0.6,0.6,0.6,1};
    colorBackgroundActive[] = {1,0.5,0,1};
    offsetX = 0.004;
    offsetY = 0.004;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    colorFocused[] = {0,0,0,1};
    colorShadow[] = {0,0,0,1};
    shadow = 0;
    colorBorder[] = {0,0,0,1};
    borderSize = 0.008;
    soundEnter[] = {"",0.1,1};
    soundPush[] = {"",0.1,1};
    soundClick[] = {"",0.1,1};
    soundEscape[] = {"",0.1,1};
};

class rscAbortCutscene
{    
    idd = -1;
    duration = 999999; //show for 10 seconds
    class controls
    {
        class ExampleControl:RscButton
        {    
            idc = -1;
            type = 0;
            style = 2; //centre text
            x = safeZoneX + (safeZoneW/2) - 0.3 * 3 / 4; 
            y = safeZoneY + safeZoneH - 0.21;
            h = 0.2;
            w = 0.4; //w == h
            font = "EtelkaNarrowMediumPro";
            sizeEx = 0.2;
            colorBackground[] = {0,0,0,1}; //yellow background
            colorText[] = {1,1,1,1}; //blue text
            text = "MfS-Spitzelvertrag unterschreiben";
            tooltip = "Einknicken und sofort als Stasi respawnen";
        };
    };
};