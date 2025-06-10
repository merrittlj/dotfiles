#!/usr/local/bin/fish

function read_confirm
  while true
    read -l -P 'Do you want to continue? [y/N] ' confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

mount /dev/sdb1 /home/lucas/sdcard -o umask=000

if read_confirm
    umount sdcard
    eject /dev/sdb1
end
