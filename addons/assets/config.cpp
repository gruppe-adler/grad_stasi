#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {};
        authors[] = { "Salbei", "nomisum"};
    };
};

#include <cfgRsc.hpp>
#include <cfgMagazines.hpp>
#include <cfgWeapons.hpp>
#include <cfgFunctions.hpp>
#include <cfgSounds.hpp>
