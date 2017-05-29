# Makefile

SUBDIRS := himeno stream
.PHONY: all $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

clean:
	$(MAKE) -C himeno clean
	$(MAKE) -C stream clean
