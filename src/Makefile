# This is a makefile that builds the sme-smj translation parser

LEXC = lexc -utf8
XFST = xfst -utf8

smesmj.fst: ../bin/smesmj.fst
../bin/smesmj.fst: ../bin/smesmj-inter.fst ../../../../gt/sme/bin/isme.fst \
	../../../../gt/smj/bin/smj.save
	@echo
	@echo "*** Building smesmj.fst ***" 
	@echo
	@printf "read regex [ [@\"../../../../gt/sme/bin/isme.fst\" ] .o. \
	[@\"../bin/smesmj-inter.fst\"] .o. [@\"../../../../gt/smj/bin/smj.save\"] ] ; \n\
	save stack ../bin/smesmj.fst \n\
	quit \n" > ../../tmp/smesmj-save-script
	$(XFST) < ../../tmp/smesmj-save-script
	@rm -rf ../../tmp/smesmj-save-script

smesmj-inter.fst: ../bin/smesmj-inter.fst
../bin/smesmj-inter.fst: smesmj-lex.txt  adj-smesmj-lex.txt adv-smesmj-lex.txt \
	conjunction-smesmj-lex.txt interjection-smesmj-lex.txt noun-smesmj-lex.txt \
	numeral-smesmj-lex.txt particle-smesmj-lex.txt pp-smesmj-lex.txt \
	pronoun-smesmj-lex.txt subjunction-smesmj-lex.txt verb-smesmj-lex.txt
	@echo
	@echo "*** Building smesmj-inter.fst ***" 
	@echo
	@printf "compile-source smesmj-lex.txt  adj-smesmj-lex.txt adv-smesmj-lex.txt \
	conjunction-smesmj-lex.txt interjection-smesmj-lex.txt noun-smesmj-lex.txt \
	numeral-smesmj-lex.txt particle-smesmj-lex.txt pp-smesmj-lex.txt \
	pronoun-smesmj-lex.txt subjunction-smesmj-lex.txt verb-smesmj-lex.txt \n\
	source-to-result \n\
	save-result ../bin/smesmj-inter.fst \n\
	quit \n" > ../../tmp/smesmj-inter-save-script
	$(LEXC) < ../../tmp/smesmj-inter-save-script
	@rm -f ../../tmp/smesmj-inter-save-script

