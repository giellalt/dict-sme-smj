sme2smjify.bin: sme2smj-lexeme.xfst
	xfst -e "source $<" -e "save stack $@" -stop

test-verb: sme2smjify.bin
	< conversiondata/verb-sme.csv lookup -q $< | cut -f2 | diff conversiondata/verb-smj.csv -

.PHONY: test
