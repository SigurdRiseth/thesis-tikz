ROOT  := $(CURDIR)
SRCS  := $(shell find figures -name '*.tex')
PDFS  := $(SRCS:.tex=.pdf)
DEPS  := $(shell find figures -name '*.csv' -o -name '*.png' -o -name '*.pdf' ! -name '*_fig.pdf')

all: $(PDFS)

# Run pdflatex from the figure's own directory so relative assets resolve.
# TEXINPUTS includes ROOT so \input{preamble} always finds preamble.tex.
%.pdf: %.tex preamble.tex $(DEPS)
	cd $(dir $<) && TEXINPUTS=$(ROOT): pdflatex -interaction=nonstopmode $(notdir $<)

clean:
	find figures -name '*.aux' -o -name '*.log' -o -name '*.synctex.gz' | xargs rm -f

distclean: clean
	find figures -name '*.pdf' | xargs rm -f

.PHONY: all clean distclean
