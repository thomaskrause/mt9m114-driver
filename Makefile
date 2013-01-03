obj-m += mt9m114.o

all:
	make ARCH=i386 -C ../../../Kernel M=$(PWD) modules

clean:
	make -C ../../../Kernel M=$(PWD) clean
