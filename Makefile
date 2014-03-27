template = dissertation_template.tex
jobname = thesis

latexfiles = \
	$(dissertation_template) \
	abstract.tex \
	introduction.tex \
	references.bib

output/$(jobname).pdf: $(latexfiles)
	mkdir -p output
	pdflatex -jobname $(jobname) -output-directory output $(template)
	cd output && cp ../references.bib . && bibtex $(jobname:.tex=)
	pdflatex -jobname $(jobname) -output-directory output $(template)
	pdflatex -jobname $(jobname) -output-directory output $(template)

.PHONY: clean
clean:
	rm -r output
