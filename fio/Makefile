# Makefile

URL = http://brick.kernel.dk/snaps/
FILENAME = fio-2.2.4.tar.gz
DIRNAME = fio-2.2.4

all: fio

fio:
	wget $(URL)$(FILENAME)
	tar xvzf $(FILENAME)
	cd $(DIRNAME); ./configure; make

clean:
	rm -rf $(FILENAME) $(DIRNAME)
