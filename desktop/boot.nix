{ pkgs, ... }: {
  boot = {
    consoleLogLevel = 5;
    enableContainers = false;
    initrd = {
      availableKernelModules = [
        "nvme"
        "usbhid"
      ];
      includeDefaultModules = false;
      kernelModules = [
        "amdgpu"
        "nvme"
        "xhci_pci"
        "xfs"
        "vfat"
      ];
      systemd = {
        enable = true;
      };
      verbose = false;
    };
    kernel = {
      sysctl = {
        "vm.max_map_count" = 2147483642;
      };
    };
    kernelModules = [ "kvm-amd" ];
    kernelPackages = pkgs.linuxPackages_cachyos-lto-znver4;
    kernelParams = [
      "amd_pstate=active"
      "mem_sleep_default=deep"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=notice"
      "systemd.show_status=auto"
      "udev.log_level=notice"
      "udev.log_priority=notice"
      "usbcore.quirks=1a2c:6b04:b,09da:9066:b"
      "nowatchdog"
      "nmi_watchdog=0"
    ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        configurationLimit = 3;
        editor = false;
        enable = true;
      };
      timeout = 1;
    };
    tmp = {
      tmpfsSize = "25%";
      useTmpfs = true;
    };
  };
}
