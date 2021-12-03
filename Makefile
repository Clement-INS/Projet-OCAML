
build:
	@echo "\n==== COMPILING ====\n"
	ocamlbuild atest.native
	ocamlbuild ftest.native

format:
	ocp-indent --inplace src/ford/*
	ocp-indent --inplace src/argent/*

edit:
	code . -n

demo: build
	@echo "\n==== EXECUTING ====\n"
	./ftest.native ./graphs/graph1 1 2 ./graphs/outfile
	@echo "\n==== RESULT ==== (content of outfile) \n"
	@cat outfile

clean:
	-rm -rf _build/
	-rm ftest.native
	-rm atest.native
