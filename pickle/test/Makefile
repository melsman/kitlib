
MLCOMP ?= mlton

all: pickletest.res
	@cat $^

pickletest.exe: pickletest.mlb
	$(MLCOMP) -output pickletest.exe pickletest.mlb

pickletest.out: pickletest.exe
	@echo "Running test: $*..."
	./pickletest.exe > pickletest.out

pickletest.res: pickletest.ok pickletest.out 
	@[[ `diff $^` ]] && \
           (echo "***Test failed: $@***") > $@ || \
           (echo "Test succeeded: $@") > $@

clean:
	rm -rf MLB *~ *.out *.res *.exe 
