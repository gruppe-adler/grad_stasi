#include "defines.hpp"

class rscCutSceneCam {
    duration = 1e+011;
    fadein = 0;
    idd = -1;
    onLoad = "uinamespace setvariable ['rscCutSceneCam',_this select 0];";
    onUnload = "uinamespace setvariable ['rscCutSceneCam',nil];";

    class Controls {
        
        
        class CamProgressBar: CutSceneCam_RscProgress {
            x = safezoneX;
            y = safezoneY + safezoneH - safezoneH/60;
            w = safeZoneW;
            h = safezoneH/60;
            idc = 2301;
            colorBar[] = {1,0,0,1};
        };

        class DismissButton:CutSceneCam_RscButton
        {    
            idc = 1000;
            type = 0;
            style = 2;
            x = safeZoneX + (safeZoneW/2) - 0.3 * 3 / 4; 
            y = safeZoneY + safeZoneH - 0.21;
            h = 0.2;
            w = 0.4;
            font = "EtelkaNarrowMediumPro";
            sizeEx = 0.05;
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            text = "Als MfS-Spitzel unterschreiben";
            tooltip = "Einknicken und sofort als Stasi respawnen";
        };

       
    };

    class ControlsBackground {
        class BG:CutSceneCam_RscPicture {
            w = safeZoneW;
            h = safezoneH;
            x = safezoneX;
            y = safezoneY;
            access = 0;
            colorBackground[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
            deletable = 0;
            fade = 0;
            fixedWidth = 0;
            font = "TahomaB";
            IDC = 2300;
            lineSpacing = 0;
            shadow = 0;
            sizeEx = 0;
            style = 48;
            text = "";
            tooltipColorBox[] = {1,1,1,1};
            tooltipColorShade[] = {0,0,0,0.65};
            tooltipColorText[] = {1,1,1,1};
            type = 0;
        };

        
    };
};