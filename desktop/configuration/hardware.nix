{ pkgs, ... }: {
  hardware = {
    amdgpu = {
      opencl = {
        enable = false;
      };
      initrd = {
        enable = true;
      };
      overdrive = {
        enable = true;
        ppfeaturemask = "0xfffd7fff";
      };
    };
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    cpu = {
      amd = {
        updateMicrocode = true;
      };
    };
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };
}
