sme2smjify.bin: sme2smj-lexeme.xfst
	xfst -e "source $<" -e "save stack $@" -stop


.deps/verb.tsv: conversiondata/verb-sme.csv conversiondata/verb-smj.csv .deps/.d
	@paste conversiondata/verb-sme.csv conversiondata/verb-smj.csv  > $@

test-verb: sme2smjify.bin .deps/verb.tsv
	< conversiondata/verb-sme.csv lookup -q $< | diff -b .deps/verb.tsv -

.PHONY: test-verb


.deps/.d:
	@mkdir .deps
	@touch $@
.PRECIOUS: .deps/.d
