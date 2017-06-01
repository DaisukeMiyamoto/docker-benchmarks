# Makefile

URL = https://github.com/kdlucas/byte-unixbench/archive/
FILENAME = v5.1.3.tar.gz
DIRNAME = byte-unixbench-5.1.3/UnixBench

all: unixbench

unixbench:
	wget $(URL)$(FILENAME)
	tar xvzf $(FILENAME)
	cd $(DIRNAME); \
	make; \
	wget http://storage.googleapis.com/google-code-attachments/byte-unixbench/issue-4/comment-1/fix-limitation.patch; \
	patch Run fix-limitation.patch

clean:
	rm -rf $(FILENAME) $(DIRNAME)
