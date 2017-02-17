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


# Philososphy
# Inputfile is: 
# sme<tab>smj<tab>pos
# the goal is to make a lexc file
# sme:smj # ; (not to forget the initial LEXICON Root
# and let xfst read that file

all: fst

lexc: ../bin/smesmj.lexc
../bin/smesmj.lexc: ../scripts/smesmjpairs.sh $(LEX)
	@echo
	@echo "*** Building $(notdir $@) using $(notdir $<) ***"
	@echo
	@$<

fst: ../bin/smesmj.fst
../bin/smesmj.fst: ../bin/smesmj.lexc
	@echo
	@echo "*** Calling xfst to compile lexc ***"
	@echo
	$(XFST) -e "read lexc < $<" \
			-e "save ../bin/smjsme.fst" \
			-e "invert net" \
			-e "save $@" \
			-stop

xml: ../bin/smesmj.xml
../bin/smesmj.xml: ../scripts/smesmj2xml.pl $(LEX)
	@echo
	@echo "*** Building $(notdir $@) ***" 
	@echo
	@echo "*** Using $(notdir $<) to convert to xml ***"
	@echo
	@perl $< $(wordlist 2, $(words $^), $^)
	@echo
	@echo "*** Done. ***"
	@echo

macdict: ../macdict/smesmj.xml
../macdict/smesmj.xml: ../bin/smesmj.xml ../scripts/smesmj2macdict.xsl
	@echo
	@echo "*** Building $(notdir $@) for MacOS X Dictionary ***" 
	@echo
	@echo "*** Note: We now use the xsltproc tool ***"
	@xsltproc $(lastword $^) $< > $@
	@cd ../macdict && make

clean:
	@rm -f ../bin/*.fst ../bin/*.lexc ../bin/*.xml
