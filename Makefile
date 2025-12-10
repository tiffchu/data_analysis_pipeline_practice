#author: Tiffany Chu
#date: Dec 10 2025

.PHONY: all wordCount plotCount report clean

all:
	make report

wordCount:
	python scripts/wordcount.py --input_file=data/isles.txt --output_file=results/isles.dat
	python scripts/wordcount.py --input_file=data/abyss.txt --output_file=results/abyss.dat
	python scripts/wordcount.py --input_file=data/last.txt --output_file=results/last.dat
	python scripts/wordcount.py --input_file=data/sierra.txt --output_file=results/sierra.dat

plotCount: 
	python scripts/plotcount.py --input_file=results/isles.dat --output_file=results/figure/isles.png
	python scripts/plotcount.py --input_file=results/abyss.dat --output_file=results/figure/abyss.png
	python scripts/plotcount.py --input_file=results/last.dat --output_file=results/figure/last.png
	python scripts/plotcount.py --input_file=results/sierra.dat --output_file=results/figure/sierra.png

report: wordCount plotCount
	quarto render report/count_report.qmd

clean:
	rm -rf results/*.dat
	rm -rf results/figure/*
