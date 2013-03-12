#!/bin/bash -eux

if [ -e /home/vagrant/.vbox_version ]
then
    mkdir /tmp/vbox
    VER=$(cat /home/vagrant/.vbox_version)
    wget http://download.virtualbox.org/virtualbox/$VER/VBoxGuestAdditions_$VER.iso
    mount -o loop VBoxGuestAdditions_$VER.iso /tmp/vbox
    sh /tmp/vbox/VBoxLinuxAdditions.run
    umount /tmp/vbox
    rmdir /tmp/vbox
    rm VBoxGuestAdditions_*.iso
elif [ -e /home/vagrant/.vmfusion_version ]
then
    mkdir /tmp/vmfusion-iso
    mount -o loop linux.iso /tmp/vmfusion-iso

    mkdir /tmp/vmfusion
    tar zxf /tmp/vmfusion-iso/VMwareTools-*.tar.gz -C /tmp/vmfusion
    /tmp/vmfusion/vmware-tools-distrib/vmware-install.pl -d

    umount /tmp/vmfusion-iso
    rm -rf /tmp/vmfusion-iso /tmp/vmfusion
fi
