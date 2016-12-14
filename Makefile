all: resume.pdf

resume-verbose.pdf: resume.tex
	pdflatex $< >/dev/null
	mv resume.pdf $@
	rm -f *.{aux,log,out}

resume.pdf: resume-verbose.pdf
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@ $<
	rm $<

.PHONY: all
