TARGETS=sme2smj-V.bin sme2smj-A.bin sme2smj-N.bin

all: $(TARGETS)

sme2smj-V.bin: sme2smj-lexeme.xfst
	sed 's/!V_ONLY!//g' $< > V.$<
	xfst -e "source V.$<" -e "save stack $@" -stop
	rm -f V.$<
sme2smj-A.bin: sme2smj-lexeme.xfst
	sed 's/!A_ONLY!//g' $< > A.$<
	xfst -e "source A.$<" -e "save stack $@" -stop
	rm -f A.$<
sme2smj-N.bin: sme2smj-lexeme.xfst
	sed 's/!N_ONLY!//g' $< > N.$<
	xfst -e "source N.$<" -e "save stack $@" -stop
	rm -f N.$<

t/V.results: sme2smj-V.bin
	@< conversiondata/V-sme.csv lookup -q $< | paste - conversiondata/V-smj.csv | awk 'BEGIN{OFS=FS="\t"} $$2==$$3{$$3=""}{print}' > $@
	@echo "=== Mistakes in Vs ==="
	@awk 'BEGIN{print "SME SMJIFIED SMJ"} $$3{print}' $@ | column -t
t/A.results: sme2smj-A.bin
	@< conversiondata/A-sme.csv lookup -q $< | paste - conversiondata/A-smj.csv | awk 'BEGIN{OFS=FS="\t"} $$2==$$3{$$3=""}{print}' > $@
	@echo "=== Mistakes in As ==="
	@awk 'BEGIN{print "SME SMJIFIED SMJ"} $$3{print}' $@ | column -t
t/N.results: sme2smj-N.bin
	@< conversiondata/N-sme.csv lookup -q $< | paste - conversiondata/N-smj.csv | awk 'BEGIN{OFS=FS="\t"} $$2==$$3{$$3=""}{print}' > $@
	@echo "=== Mistakes in Ns ==="
	@awk 'BEGIN{print "SME SMJIFIED SMJ"} $$3{print}' $@ | column -t

test:   t/V.results t/A.results t/N.results
.PHONY: t/V.results t/A.results t/N.results

clean:
	rm -f $(TARGETS)
