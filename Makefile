MLCOMP ?= mlkit
TEST_MLBS:=$(shell ls -1 */test/*.mlb)
TEST_RESS:=$(TEST_MLBS:%.mlb=%.res)

.PHONY: all
all:
	@echo "Supported make targets are:"
	@echo "  1) make test    - execute unit tests"
	@echo "  2) make doc     - generate sigdoc documentation"
	@echo "  3) make clean   - remove generated files"


.PHONY: test
test: kitlib.out $(TEST_RESS)
	@cat $(TEST_RESS)

.PHONY: doc
doc:
	make -C doc

.PHONY: clean
clean:
	find . -name MLB -type d | xargs rm -rf
	find . -name '*~' | xargs rm -f
	find . -name run | xargs rm -f
	find . -name 'run.html' | xargs rm -f
	find . -name '*.exe' | xargs rm -f
	find . -name '*.out' | xargs rm -f
	find . -name '*.res' | xargs rm -f
	rm -rf doc/gen

%.out: %.exe
	./$< > $@

%.exe: %.mlb
	$(MLCOMP) -output $@ $<

%.res: %.out
	@[[ `diff $< $<.ok` ]] && \
           (echo "Test $@: ***ERR***" > $@) || \
           (echo "Test $@: OK" > $@)
