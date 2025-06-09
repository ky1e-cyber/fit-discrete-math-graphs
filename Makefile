all: lectures.pdf

lectures.pdf: src/main.typ src/template.typ
	typst compile src/main.typ lectures.pdf

clean:
	rm -f *.pdf
