TARGET=thesis
IMG=$(shell ls img/*)
TEX=platex
DVIPDF=dvipdfmx

.SUFFIXES: .tex .dvi .pdf #.bbl

all:$(TARGET).pdf
	open $(TARGET).pdf

$(TARGET).dvi: $(TARGET).tex $(IMG)

$(TARGET).pdf: $(TARGET).dvi

.tex.dvi:
	$(TEX) $<
	jbibtex $*
	$(TEX) $<
	$(TEX) $<

.tex.bbl:
	jbibtex $*

tar:
	tar cvzf $(TARGET).tar.gz $(TARGET).* img jgraduate.sty Makefile

.dvi.pdf:
	$(DVIPDF) $<

clean:
	rm -f $(TARGET).dvi $(TARGET).aux $(TARGET).log $(TARGET).bbl
	rm -f $(TARGET).pdf $(TARGET).tar.gz 
	rm -f *.pbm *.bmc
	rm -f *~
