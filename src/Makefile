# This is a makefile that builds the sme-smj translation parser

# It is quite amateurish, but it will not be the final one.

LEXC = lexc #-utf8
XFST = xfst #-utf8

LEX = a_smesmj.csv \
	abbr_smesmj.csv	   \
	adv_smesmj.csv	   \
	cc_smesmj.csv	   \
	cs_smesmj.csv	   \
	n_smesmj.csv	   \
	num_smesmj.csv	   \
	p_smesmj.csv	   \
	pcle_smesmj.csv	   \
	po_smesmj.csv	   \
	pp_smesmj.csv	   \
	prep_smesmj.csv	   \
	pron_smesmj.csv	   \
	prop_smesmj.csv	   \
	v_smesmj.csv


# PhilososphY
# Inputfile is: 
# sme<tab>smj<tab>pos
# the goal is to make a lexc file
# sme:smj # ; (not to forget the initial LEXICON Root
# and let xfst read that file
# problem is, this looks more like a shell script than like a makefile

../bin/smesmj.fst: $(LEX) ../bin/smesmj.xml
	@echo
	@echo "*** Building smesmj.fst ***" 
	@echo
	@echo "*** Reading shellscript smesmjpairs.sh ***"
	@../scripts/smesmjpairs.sh
	@echo "*** Calling xfst to compile lexc ***"
	@printf "read lexc < ../bin/smesmj.lexc \n\
	save ../bin/smjsme.fst \n\
	invert net \n\
	save ../bin/smesmj.fst\n" > ../tmp/smesmj-lexc-script
	$(XFST) < ../tmp/smesmj-lexc-script

../bin/smesmj.xml: $(LEX) ../scripts/smesmj2xml.pl
	@echo
	@echo "*** Building $@ ***" 
	@echo
	@echo "*** Reading perlscript smesmj2xml.pl ***"
	@echo
	@echo "*** Calling perl to compile xml ***"
	@echo
	@perl ../scripts/smesmj2xml.pl
	@echo
	@echo "*** Done. ***"
	@echo


macdict: ../macdict/smesmj.xml
../macdict/smesmj.xml: ../bin/smesmj.xml ../scripts/smesmj2macdict.xsl
	@echo
	@echo "*** Building smesmj.xml for MacOS X Dictionary ***" 
	@echo
	@echo "*** Note: We now use the xsltproc tool ***"
	@xsltproc ../scripts/smesmj2macdict.xsl $< > $@
	@cd ../macdict && make


# Older makefile, for the lexc-based translation:
#smesmj.fst: ../bin/smesmj.fst
#../bin/smesmj.fst: ../bin/smesmj-inter.fst ../../../../gt/sme/bin/isme.fst \
#	../../../../gt/smj/bin/smj.save
#	@echo
#	@echo "*** Building smesmj.fst ***" 
#	@echo
#	@printf "read regex [ [@\"../../../../gt/sme/bin/isme.fst\" ] .o. \
#	[@\"../bin/smesmj-inter.fst\"] .o. [@\"../../../../gt/smj/bin/smj.save\"] ] ; \n\
#	save stack ../bin/smesmj.fst \n\
#	quit \n" > ../../tmp/smesmj-save-script
#	$(XFST) < ../../tmp/smesmj-save-script
#	@rm -rf ../../tmp/smesmj-save-script
#
#smesmj-inter.fst: ../bin/smesmj-inter.fst
#../bin/smesmj-inter.fst: smesmj-lex.txt  adj-smesmj-lex.txt adv-smesmj-lex.txt \
#	conjunction-smesmj-lex.txt interjection-smesmj-lex.txt noun-smesmj-lex.txt \
#	numeral-smesmj-lex.txt particle-smesmj-lex.txt pp-smesmj-lex.txt \
#	pronoun-smesmj-lex.txt subjunction-smesmj-lex.txt verb-smesmj-lex.txt
#	@echo
#	@echo "*** Building smesmj-inter.fst ***" 
#	@echo
#	@printf "compile-source smesmj-lex.txt  adj-smesmj-lex.txt adv-smesmj-lex.txt \
#	conjunction-smesmj-lex.txt interjection-smesmj-lex.txt noun-smesmj-lex.txt \
#	numeral-smesmj-lex.txt particle-smesmj-lex.txt pp-smesmj-lex.txt \
#	pronoun-smesmj-lex.txt subjunction-smesmj-lex.txt verb-smesmj-lex.txt \n\
#	source-to-result \n\
#	save-result ../bin/smesmj-inter.fst \n\
#	quit \n" > ../../tmp/smesmj-inter-save-script
#	$(LEXC) < ../../tmp/smesmj-inter-save-script
#	@rm -f ../../tmp/smesmj-inter-save-script


clean:
	@rm -f ../bin/*.fst ../bin/*.lexc
