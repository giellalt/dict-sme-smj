sme2smjify.bin: sme2smj-lexeme.xfst
	xfst -e "source $<" -e "save stack $@" -stop


.deps/verb.tsv: conversiondata/verb-sme.csv conversiondata/verb-smj.csv .deps/.d
	@paste conversiondata/verb-sme.csv conversiondata/verb-smj.csv  > $@
.deps/adj.tsv: conversiondata/adj-sme.csv conversiondata/adj-smj.csv .deps/.d
	@paste conversiondata/adj-sme.csv conversiondata/adj-smj.csv  > $@
.deps/nomen.tsv: conversiondata/nomen-sme.csv conversiondata/nomen-smj.csv .deps/.d
	@paste conversiondata/nomen-sme.csv conversiondata/nomen-smj.csv  > $@

test-verb: sme2smjify.bin .deps/verb.tsv
	@< conversiondata/verb-sme.csv lookup -q $< | diff -b .deps/verb.tsv - |tee t/verb.results
test-adj: sme2smjify.bin .deps/adj.tsv
	@< conversiondata/adj-sme.csv lookup -q $< | diff -b .deps/adj.tsv - |tee t/adj.results
test-nomen: sme2smjify.bin .deps/nomen.tsv
	@< conversiondata/nomen-sme.csv lookup -q $< | diff -b .deps/nomen.tsv - |tee t/nomen.results

test:   test-verb test-adj test-nomen
.PHONY: test-verb test-adj test-nomen


.deps/.d:
	@mkdir .deps
	@touch $@
.PRECIOUS: .deps/.d
