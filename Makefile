all: scriptie.pdf

scriptie.pdf: scriptie.tex
	latexmk -pdf scriptie.tex

clean:
	latexmk -c scriptie.tex
	rm -f scriptie.pdf

.PHONY: clean
