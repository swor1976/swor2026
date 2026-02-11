# alvo: depedencia1 depedencia2
#	 comando que gera o alvo das dependencias
.PHONY: clean
data/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py
results/npaises.txt: data/temperature-data.zip code/conta_paises.sh
	mkdir -p results
	bash code/conta_paises.sh > results/npaises.txt
clean: 
	rm -r data results
