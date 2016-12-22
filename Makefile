all: resume.pdf

verb = resume-verbose.pdf

resume.pdf: resume.tex
	pdflatex $< >/dev/null
	mv $@ ${verb}
	rm -f *.{aux,log,out}
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@ ${verb}
	rm ${verb}

.PHONY: all
