{
  disko.devices = {
    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "defaults"
          "size=50%"
          "mode=755"
        ];
      };
    };
    disk = {
      main = {
        device = "/dev/disk/by-id/nvme-HP_SSD_FX900_Pro_512GB_HBSE33161500072";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1024M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                  "fmask=0077"
                  "dmask=0077"
                ];
              };
            };
            nix = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "xfs";
                mountpoint = "/nix";
                mountOptions = [
                  "defaults"
                  "noatime"
                  "nodiscard"
                ];
              };
            };
          };
        };
      };
      secondary = {
        device = "/dev/disk/by-id/nvme-HP_SSD_FX900_Pro_1TB_HBSE43172000235";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "xfs";
                mountpoint = "/mount/nvme2";
                mountOptions = [
                  "defaults"
                  "noatime"
                  "nodiscard"
                  "nofail"
                  "x-systemd.automount"
                  "x-systemd.device-timeout=5s"
                ];
              };
            };
          };
        };
      };
    };
  };
}
