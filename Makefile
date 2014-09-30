MLCOMP ?= mlkit
TEST_MLBS:=$(shell ls -1 */test/*.mlb)
TEST_RESS:=$(TEST_MLBS:%.mlb=%.res)

all:
	@echo "Supported make targets are:"
	@echo "  1) make test"
	@echo "  2) make clean"

.PHONY: test
test: $(TEST_RESS)
	@cat $(TEST_RESS)

clean:
	find . -name MLB -type d | xargs rm -rf
	find . -name '*~' | xargs rm -f
	find . -name run | xargs rm -f
	find . -name 'run.html' | xargs rm -f
	find . -name '*.exe' | xargs rm -f
	find . -name '*.out' | xargs rm -f
	find . -name '*.res' | xargs rm -f

%.out: %.exe
	./$< > $@

%.exe: %.mlb
	$(MLCOMP) -output $@ $<

%.res: %.out
	@[[ `diff $< $<.ok` ]] && \
           (echo "Test $@: ***ERR***" > $@) || \
           (echo "Test $@: OK" > $@)
