# Makefile

URL = https://github.com/kdlucas/byte-unixbench/archive/
FILENAME = v5.1.3.tar.gz
DIRNAME = byte-unixbench-5.1.3/UnixBench

all: unixbench

unixbench:
	wget $(URL)$(FILENAME)
	tar xvzf $(FILENAME)
	cd $(DIRNAME); make

clean:
	rm -rf $(FILENAME) $(DIRNAME)
