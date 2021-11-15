#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "tfar_core" };
        authors[] = { "Salbei", "nomisum"};
        VERSION_CONFIG;
    };
};
