#! /bin/bash

echo "-Placing the firmware"
	cp gen/main_pru1_fw.out /lib/firmware/am335x-pru1-fw

echo "-Configuring pinmux"
	config-pin -a P8_45 pruout
	config-pin -q P8_45

echo "-Rebooting"
	
	echo "Rebooting pru-core 0"
	echo "4a334000.pru0" > /sys/bus/platform/drivers/pru-rproc/unbind 2>/dev/null
	echo "4a334000.pru0" > /sys/bus/platform/drivers/pru-rproc/bind
	
	echo "Rebooting pru-core 1"
	echo "4a338000.pru1"  > /sys/bus/platform/drivers/pru-rproc/unbind 2> /dev/null
	echo "4a338000.pru1" > /sys/bus/platform/drivers/pru-rproc/bind
	

echo "Done. TX loaded into the PRU"
