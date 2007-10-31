# This is a makefile that builds the sme-smj translation parser

# It is quite amateurish, but it will not be the final one.

LEXC = lexc -utf8
XFST = xfst -utf8

# PhilososphY
# Inputfile is: 
# sme<tab>smj<tab>pos
# the goal is to make a lexc file
# sme:smj # ; (not to forget the initial LEXICON Root
# and let xfst read that file
# problem is, this looks more like a shell script than like a makefile

../bin/smesmj.fst: smesmj.xml
	@echo
	@echo "*** Building smesmj.fst ***" 
	@echo
	@echo "*** Reading shellscript smesmjpairs.sh ***"
	@./smesmjpairs.sh
	@echo "*** Calling xfst to compile lexc ***"
	@printf "read lexc < ../bin/smesmj.lexc \n\
	save ../bin/smjsme.fst \n\
	invert net \n\
	save ../bin/smesmj.fst\n" > ../tmp/smesmj-lexc-script
	$(XFST) < ../tmp/smesmj-lexc-script



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

