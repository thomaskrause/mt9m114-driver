# A very simple makefile to build the driver outside the kernel source.
# Instructions:
# (1) Build the kernel using make ARCH=i386
# (2) Run make modules_prepare
# (3) Modify the paths below to point to your kernel dir
# (4) make.

obj-m += mt9m114.o


all:
	make ARCH=i386 -C ../../../Kernel M=$(PWD) modules

clean:
	make -C ../../../Kernel M=$(PWD) clean
