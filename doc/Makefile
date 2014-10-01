
# the below files are relative to the gen subdirectory
SIGS:=$(shell ls -1 ../*/*.sig)
IMPL:=$(shell ls -1 ../*/*.sml)
SIGS:=$(SIGS:%=../%)
IMPL:=$(IMPL:%=../%)

.PHONY: gen
gen:
	rm -rf gen
	mkdir gen
	(cd gen; /Users/mael/gits/sigdoc/sigdoc -sigs $(SIGS) -impl $(IMPL))
	cp /Users/mael/gits/sigdoc/lib/* gen/
