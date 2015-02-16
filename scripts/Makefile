TARGETS=t/A.results t/V.results t/N.results

all: $(TARGETS)

sme2smj-%.bin: sme2smj-lexeme.xfst
	sed 's/!$*_ONLY!//g' $< > $*.$<
	xfst -e "source $*.$<" -e "save stack $@" -stop
	rm -f $*.$<

t/%.results: sme2smj-%.bin
	@< conversiondata/$*-sme.csv lookup -q $< | paste - conversiondata/$*-smj.csv | awk 'BEGIN{OFS=FS="\t"} $$2==$$3{$$3=""}{print}' > $@

test-%: t/%.results
	@echo "=== Mistakes in $*s ==="
	@awk 'BEGIN{print "SME SMJIFIED SMJ"} $$3{print}' $< | column -t

test:   test-V test-A test-N
.PHONY: test

clean:
	rm -f $(TARGETS)
