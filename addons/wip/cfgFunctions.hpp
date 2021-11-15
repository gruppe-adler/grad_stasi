class GRAD_stasi {

    class actions {
        file = grad-stasi\functions\actions;

        class actionShotgunMic;
        class actionTrackingDevice;
    };

    class client_actions {
        file = grad-stasi\functions\client;

        class actions { postInit = 1;};
        class addTrackerToVehicle;
        class checkVehicleForTracker;
        class checkVehicleResult;
        class createShotgunMicInterface;
        class initValues { preInit = 1; };
        class interpretMouseWheel;
        class removeTrackerFromVehicle;
        class shotgunMic;
    };
    
};