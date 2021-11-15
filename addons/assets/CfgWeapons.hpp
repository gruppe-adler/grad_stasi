
class cfgWeapons {

    /*extern*/ class SlotInfo;
    class PointerSlot;
    class ItemCore;
    class InventoryItem_Base_F;
    class InventoryMuzzleItem_Base_F;
    class InventoryOpticsItem_Base_F;
    class InventoryFlashLightItem_Base_F;    
    
    /*extern*/ class Pistol_Base_F;


    class GRAD_mic: Pistol_Base_F
    {
        author = "nomisum";
        scope = 2;

        magazines[] = {"GRAD_mic_dummyMag"};

        displayName = "Directional Mic";
        displaynameShort = "Handheld Mic";
        descriptionShort = "Handheld Mic";

        model = "grad_stasi\addons\assets\data\models\mic.p3d";
        picture="grad_stasi\addons\assets\data\textures\mic.paa";
        UiPicture="grad_stasi\addons\assets\data\textures\mic.paa";

        /* anim from RDS - todo replace with custom one */
        handAnim[]= {"OFP2_ManSkeleton","grad_stasi\addons\assets\anims\GRAD_stasi_mic.rtm"};

        optics=0;
        weaponInfoType = "GRAD_stasi_rscOptics_mic";

        distanceZoomMin = 50;
        distanceZoomMax = 50;

        class FlashLight
        {
            color[] = {180,150,120};
            ambient[] = {9,7.5,6};
            intensity = 23;
            size = 1;
            innerAngle = 20;
            outerAngle = 120;
            coneFadeCoef = 55;
            position = "flashlight_dir";
            direction = "flashlight_pos";
            useFlare = 1;
            flareSize = 0.4;
            flareMaxDistance = "100.0f";
            dayLight = 1;
            class Attenuation
            {
                start = 0.5;
                constant = 0;
                linear = 0;
                quadratic = 1;
                hardLimitStart = 20;
                hardLimitEnd = 30;
            };
            scale[] = {0};
        };

        sounds[] = {"StandardSound"};
        class BaseSoundModeType
        {
            weaponSoundEffect = "DefaultRifle";
            closure1[] = {"",1.03514,1,10};
            soundClosure[] = {"closure1",1};
        };
        class StandardSound: BaseSoundModeType
        {
            begin1[] = {"A3\Sounds_F_Kart\Weapons\starting_pistol_1",1,1,700};
            soundBegin[] = {"begin1",1};
        };
        class GunParticles{};

        class WeaponSlotsInfo
        {
            mass=27;
            holsterScale = 0;
            class PointerSlot: PointerSlot {
                compatibleItems[] = {"GRAD_stasi_switch"};
            };
        };
    };    


    class acc_flashlight;
    class GRAD_stasi_switch : acc_flashlight
    {
        author = "nomisum";
        scope = 2;

        displayName = Switch;
        descriptionShort = Switch;

        picture = "\A3\Weapons_F\Data\clear_empty.paa"; //- turned off for now
        model = "\A3\Weapons_f\empty";

        class ItemInfo : InventoryFlashLightItem_Base_F
        {
            mass = 2;
            class Pointer {};
            class FlashLight {};
        };
        inertia = 0.0;
    };

};
