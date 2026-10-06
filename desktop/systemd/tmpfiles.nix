{ ... }: {
  systemd.tmpfiles = {
    rules = [
      "d /data 2775 root users -"
      "w /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference - - - - power"
    ];
  };
}
