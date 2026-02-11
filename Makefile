# alvo: depedencia1 depedencia2
#	 comando que gera o alvo das dependencias
.PHONY: clean all 

all: figuras/taxas_variacao.png

data/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py
results/npaises.txt: data/temperature-data.zip code/conta_paises.sh
	mkdir -p results
	bash code/conta_paises.sh > results/npaises.txt
results/variacao_temperatura.csv: code/variacao_temperatura.py data/temperature-data
	mkdir -p results 
	python code/variacao_temperatura.py > results/variacao_temperatura.csv
figuras/taxas_variacao.png: code/plota_dados.py results/variacao_temperatura.csv
	mkdir -p figuras
	python code/plota_dados.py > figuras/taxas_variacao.png
clean: 
	rm -r data results
