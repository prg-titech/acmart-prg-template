# Makefile for main.tex using acmart class
# This file is in public domain

all: main.pdf

main.pdf: main.tex
	pdflatex main.tex
	- bibtex main
	pdflatex main.tex
	pdflatex main.tex
	while (grep -q '^LaTeX Warning: Label(s) may have changed' main.log); \
	do pdflatex main.tex; done

clean:
	$(RM) *.log *.aux *.bbl *.blg *.toc *.out *.lof *.lot *.idx *.ind *.ilg *.gls *.glo

distclean: clean
	$(RM) main.pdf

.PHONY: all clean distclean
