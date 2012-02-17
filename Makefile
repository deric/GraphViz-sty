LATEX = latex
PDFLATEX = pdflatex
PROJECT = example


all: $(PROJECT).pdf

$(PROJECT).pdf: *.tex
	$(PDFLATEX) -shell-escape $<

clean:
	rm -f *.log *.aux *.bbl *.blg *.lof *.lot *.dvi *.toc *.out *~ *.ps *.pdf
