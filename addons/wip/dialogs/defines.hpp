#define GRID_X          (pixelW * pixelGridBase)
#define GRID_Y          (pixelH * pixelGridBase)

#define MAIN_W          (GRID_X * 20)
#define MAIN_H          (GRID_Y * 12)
#define MAIN_X          (safeZoneX + safeZoneW - MAIN_W * 1.15)
#define MAIN_Y          (safeZoneY + safeZoneH - MAIN_H * 2)

#define FRAME_TB_H      (GRID_Y * 1)
#define FRAME_LR_W      (GRID_X * 1)

#define PIP_W           (MAIN_W - 0.5 * FRAME_LR_W)
#define PIP_H           (MAIN_H - 0.5 * FRAME_TB_H)
#define PIP_X           (MAIN_X + (MAIN_W - PIP_W)/2)
#define PIP_Y           (MAIN_Y + (MAIN_H - PIP_H)/2)

#define CutsceneCam_CT_STATIC       0
#define CutsceneCam_CT_BUTTON 1
#define CutsceneCam_ST_CENTER 2
#define CutsceneCam_ST_PICTURE      0x30


class CutSceneCam_RscPicture
{
    access = 0;
    type = CutsceneCam_CT_STATIC;
    idc = -1;
    style = CutsceneCam_ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
};

class CutSceneCam_RscButton
{
    access = 0;
       type = CutsceneCam_CT_BUTTON;
       text = "";
       colorText[] = {1,1,1,1};
       colorDisabled[] = {1,1,1,0.85};
       colorBackground[] = {0,0,0,1};
       colorBackgroundDisabled[] = {0,0,0,0};
       colorBackgroundActive[] = {1,1,1,0.85};
       colorFocused[] = {1,1,1,1};
       colorShadow[] = {0.023529,0,0.0313725,1};
       colorBorder[] = {0.023529,0,0.0313725,1};
       soundEnter[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEnter", 0.09, 1};
       soundPush[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundPush", 0.0, 0};
       soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
       soundEscape[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEscape", 0.09, 1};
       style = 2;
       x = 0;
       y = 0;
       w = 0.055589;
       h = 0.039216;
       shadow = 0;
       font = "EtelkaNarrowMediumPro";
       sizeEx = 0.03921;
       offsetX = 0.000;
       offsetY = 0.000;
       offsetPressedX = 0.00;
       offsetPressedY = 0.002;
       borderSize = 0;
};


class CutsceneCam_RscProgress
{
    type = 8;
    style = 0;
    colorFrame[] = {0,0,0,0};
    colorBar[] = {1,0,0,1};
    texture = "#(argb,8,8,3)color(1,1,1,1)";
    w = 1;
    h = 0.03;
};