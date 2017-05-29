# Makefile

SUBDIRS := himeno stream fio
.PHONY: all $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

clean:
	$(MAKE) -C himeno clean
	$(MAKE) -C stream clean
	$(MAKE) -C fio clean

