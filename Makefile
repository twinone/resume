all: resume.pdf clean
clean:
	rm -f resume.out resume.log resume.aux


verb = resume-verbose.pdf

resume.pdf: resume.tex
	pdflatex $< >/dev/null
	mv $@ ${verb}
	rm -f *.{aux,log,out}
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@ ${verb}
	rm ${verb}

.PHONY: all
