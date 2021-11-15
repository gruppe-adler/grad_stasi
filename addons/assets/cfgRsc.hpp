
class RscPicture;
class RscControlsGroup;

class RscInGameUI
{
    class RscUnitInfo;
    class RscWeaponZeroing: RscUnitInfo
    {
        class WeaponInfoControlsGroupLeft;
    };

   
    class GRAD_stasi_rscOptics_mic: RscWeaponZeroing
    {
        idd = 300;
        onLoad="['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call GRAD_stasi_fnc_handler_mic;";
        controls[] = {"CA_IGUI_elements_group"};
        class CA_IGUI_elements_group: RscControlsGroup
        {
            x="0 *      (0.01875 * SafezoneH) +         (SafezoneX + ((SafezoneW - SafezoneH) / 2))";
            y="0 *      (0.025 * SafezoneH) +       (SafezoneY)";
            w="53.5 *       (0.01875 * SafezoneH)";
            h="40 *         (0.025 * SafezoneH)";
            idc = 170;
            class VScrollbar
            {
                autoScrollSpeed = -1;
                autoScrollDelay = 5;
                autoScrollRewind = 0;
                color[] = {1,0,0,0};
                width = 0.001;
            };
            class HScrollbar
            {
                color[] = {1,0,0,0};
                height = 0.001;
            };
            class Controls
            {
                class RHS_pso_handler: RscPicture {idc=9978;};
            };
        };
    };
};