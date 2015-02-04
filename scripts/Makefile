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

t/verb.results: sme2smj-verb.bin
	@< conversiondata/verb-sme.csv lookup -q $< | paste - conversiondata/verb-smj.csv | awk 'BEGIN{OFS=FS="\t"} $$2==$$3{$$3=""}{print}' > $@
	@echo "=== Mistakes in verbs ==="
	@awk 'BEGIN{print "SME SMJIFIED SMJ"} $$3{print}' $@ | column -t
t/adj.results: sme2smj-adj.bin
	@< conversiondata/adj-sme.csv lookup -q $< | paste - conversiondata/adj-smj.csv | awk 'BEGIN{OFS=FS="\t"} $$2==$$3{$$3=""}{print}' > $@
	@echo "=== Mistakes in adjs ==="
	@awk 'BEGIN{print "SME SMJIFIED SMJ"} $$3{print}' $@ | column -t
t/nomen.results: sme2smj-nomen.bin
	@< conversiondata/nomen-sme.csv lookup -q $< | paste - conversiondata/nomen-smj.csv | awk 'BEGIN{OFS=FS="\t"} $$2==$$3{$$3=""}{print}' > $@
	@echo "=== Mistakes in nomens ==="
	@awk 'BEGIN{print "SME SMJIFIED SMJ"} $$3{print}' $@ | column -t

test:   t/verb.results t/adj.results t/nomen.results
.PHONY: t/verb.results t/adj.results t/nomen.results

clean:
	rm -f $(TARGETS)
