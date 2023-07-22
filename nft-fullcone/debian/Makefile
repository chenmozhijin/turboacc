# 
# apt update -y
# apt upgrade -y
# apt install --reinstall linux-headers-$(uname -r) -y
# apt install build-essential autoconf autogen libtool pkg-config libgmp3-dev bison flex libreadline-dev git libedit-dev libmnl-dev make dkms -y
# apt autoremove -y
#

obj-m += nft_fullcone.o

nft_fullcone-y := ../src/nft_ext_fullcone.o ../src/nf_nat_fullcone.o

KVERSION = $(shell uname -r)

all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

install:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules_install
	depmod -A
	modprobe nft_fullcone

uninstall:
	rmmod nft_fullcone || echo "Please remove all nft rules with fullcone and run [rmmod nft_fullcone] manually" 
	rm -f /lib/modules/$(KVERSION)/extra/nft_fullcone.ko && depmod -A

clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
