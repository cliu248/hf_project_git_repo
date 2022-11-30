FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libfontconfig1-dev

RUN mkdir /hf_project_git_repo
WORKDIR /hf_project_git_repo
RUN mkdir data
RUN mkdir code
RUN mkdir output 
RUN mkdir -p renv
RUN mkdir report

COPY README.md .
COPY .gitignore . 
COPY Makefile .
COPY data data 
COPY code code 
COPY hf_report.Rmd .
COPY .Rprofile .
COPY renv.lock .
COPY renv/activate.R renv
COPY renv/settings.dcf renv

ENV RENV_VERSION 0.16.0
RUN R -e "install.packages('remotes',repos=c(CRAN='https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
RUN Rscript -e "renv::restore(prompt=FALSE)"

CMD make && mv hf_report.html report
