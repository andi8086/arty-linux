#!/bin/bash
petalinux-package --boot --fpga ./project-spec/hw-description/main_wrapper.bit --u-boot --boot-script --offset 0x420000 --kernel --offset 0x421000 --flash-intf SPIx1 --force
