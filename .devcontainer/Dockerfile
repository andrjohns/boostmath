FROM debian:sid-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get install -y tzdata locales
RUN dpkg-reconfigure locales
RUN echo "LC_ALL=en_GB.UTF-8" >> /etc/environment
RUN echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_GB.UTF-8" > /etc/locale.conf
RUN locale-gen en_GB.UTF-8

ENV LC_CTYPE="en_GB.UTF-8"
ENV LC_TIME="en_GB.UTF-8"
ENV LC_MESSAGES="en_GB.UTF-8"
ENV LC_MONETARY="en_GB.UTF-8"
ENV LC_PAPER="en_GB.UTF-8"
ENV LC_MEASUREMENT="en_GB.UTF-8"
ENV LC_COLLATE="en_GB.UTF-8"
ENV LC_ALL="en_GB.UTF-8"

RUN apt-get update && apt-get install -y --no-install-recommends r-base-dev r-cran-devtools r-cran-tinytest \
    r-cran-v8 clangd git wget curl nodejs qpdf texlive-latex-recommended tidy texlive-fonts-extra
RUN Rscript -e "install.packages(c('BH', 'cpp11'))"
RUN echo "Sys.setenv(MAKEFLAGS=paste0('-j', parallel::detectCores()))" > ~/.Rprofile
