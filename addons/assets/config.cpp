#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {"ACE_envelope_small","ACE_envelope_big"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { QMAINPATCH};
        authors[] = { "Salbei"};
        VERSION_CONFIG;
    };
};

#include <CfgWeapons.hpp>
