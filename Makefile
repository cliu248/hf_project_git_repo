report.html: hf_report.Rmd code/04_render_report.R labeled_data tables figures
	Rscript code/04_render_report.R

labeled_data:
	Rscript code/01_make_data.R

tables:
	Rscript code/02_make_tables.R

figures:
	Rscript code/03_make_figures.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f hf_report.html