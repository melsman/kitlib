all:
	@echo "No general build target"

.PHONY: test
test:
	make -C test

clean:
	rm -rf MLB *~ */*~ */MLB */run *.log run run.html */run.html
	make -C pickle/test clean
