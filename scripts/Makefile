TARGETS=sme2smj-verb.bin sme2smj-adj.bin sme2smj-nomen.bin

all: $(TARGETS)

sme2smj-verb.bin: sme2smj-lexeme.xfst
	sed 's/!VERB_ONLY!//g' $< > verb.$<
	xfst -e "source verb.$<" -e "save stack $@" -stop
	rm -f verb.$<
sme2smj-adj.bin: sme2smj-lexeme.xfst
	sed 's/!ADJ_ONLY!//g' $< > adj.$<
	xfst -e "source adj.$<" -e "save stack $@" -stop
	rm -f adj.$<
sme2smj-nomen.bin: sme2smj-lexeme.xfst
	sed 's/!NOMEN_ONLY!//g' $< > nomen.$<
	xfst -e "source nomen.$<" -e "save stack $@" -stop
	rm -f nomen.$<

.deps/verb.tsv: conversiondata/verb-sme.csv conversiondata/verb-smj.csv .deps/.d
	@paste conversiondata/verb-sme.csv conversiondata/verb-smj.csv  > $@
.deps/adj.tsv: conversiondata/adj-sme.csv conversiondata/adj-smj.csv .deps/.d
	@paste conversiondata/adj-sme.csv conversiondata/adj-smj.csv  > $@
.deps/nomen.tsv: conversiondata/nomen-sme.csv conversiondata/nomen-smj.csv .deps/.d
	@paste conversiondata/nomen-sme.csv conversiondata/nomen-smj.csv  > $@

test-verb: sme2smj-verb.bin .deps/verb.tsv
	@< conversiondata/verb-sme.csv lookup -q $< | diff -b .deps/verb.tsv - |tee t/verb.results
test-adj: sme2smj-adj.bin .deps/adj.tsv
	@< conversiondata/adj-sme.csv lookup -q $< | diff -b .deps/adj.tsv - |tee t/adj.results
test-nomen: sme2smj-nomen.bin .deps/nomen.tsv
	@< conversiondata/nomen-sme.csv lookup -q $< | diff -b .deps/nomen.tsv - |tee t/nomen.results

test:   test-verb test-adj test-nomen
.PHONY: test-verb test-adj test-nomen


.deps/.d:
	@mkdir .deps
	@touch $@
.PRECIOUS: .deps/.d

clean:
	rm -rf .deps
	rm -f $(TARGETS)
