#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { QMAINPATCH};
        authors[] = { "Salbei", "nomisum"};
        VERSION_CONFIG;
    };
};

#include <CfgRsc.hpp>
#include <CfgMagazines.hpp>
#include <CfgWeapons.hpp>
