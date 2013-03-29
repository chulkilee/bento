#!/bin/bash -aux
rm -rf /etc/udev/rules.d/70-persistent-net.rules
sed -i -e '/^HWADDR=.\+/d' /etc/sysconfig/network-scripts/ifcfg-eth0
