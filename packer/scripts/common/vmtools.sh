#!/bin/bash

if [ -f /home/vagrant/.vbox_version ]; then
    mkdir /tmp/vbox
    VER=$(cat /home/vagrant/.vbox_version)
    mount -o loop /home/vagrant/VBoxGuestAdditions_$VER.iso /tmp/vbox 
    sh /tmp/vbox/VBoxLinuxAdditions.run
    umount /tmp/vbox
    rmdir /tmp/vbox
    rm /home/vagrant/*.iso
fi

if [ -f /home/vagrant/vmware_tools.iso ]; then
    echo "Installing VMWare Tools"
    #Set Linux-specific paths and ISO filename
    home_dir="/home/vagrant"
    iso_name="vmware_tools.iso"
    mount_point="/tmp/vmware-tools"
    #Run install, unmount ISO and remove it
    mkdir ${mount_point}
    cd ${home_dir}
    /bin/mount -o loop ${iso_name} ${mount_point}
    tar zxf ${mount_point}/*.tar.gz && cd vmware-tools-distrib && ./vmware-install.pl --default
    /bin/umount ${mount_point}
    /bin/rm -rf ${home_dir}/${iso_name} ${home_dir}/vmware-tools-distrib
    rmdir ${mount_point}
fi
