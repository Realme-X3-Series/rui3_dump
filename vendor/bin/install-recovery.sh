#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:fd5b0880a64ae87ef7f066a70177e705b59a2564; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:d45fe8044dfc048cd833a34bf55c70871c0a411a \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:fd5b0880a64ae87ef7f066a70177e705b59a2564 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
