{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.hardware.steam-hardware;

in

{
  options.hardware.steam-hardware = {
    enable = mkOption {
      type = types.bool;
      default = false;
      # description = lib.mdDoc "Enable udev rules for Steam hardware such as the Steam Controller, other supported controllers and the HTC Vive";
      description = lib.mdDoc "Enable the Steam-Device udev rules for Hardware such ass all Steam/Valve hardware as well as selected third party controllers";
    };
  };

  config = mkIf cfg.enable {
    services.udev.packages = [
      pkgs.steam-devices
    ];

    # The uinput module needs to be loaded in order to trigger the udev rules
    # defined in the steam package for setting permissions on /dev/uinput.
    #
    # If the udev rules are not triggered, some controllers won't work with
    # steam.
    boot.kernelModules = [ "uinput" ];
  };
}
