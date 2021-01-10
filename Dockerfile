ARG R_VERSION=${R_VERSION}

FROM rocker/tidyverse:${R_VERSION}

# Install depencendcies
RUN apt-get update \
   && apt-get upgrade -y \
   && apt-get install -y \
   # for rJava
   default-jre \
   # for V8
   libv8-dev 

# install rstan
RUN mkdir -p $HOME/.R/ \
   && echo "\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC\nCXX14=g++" >> $HOME/.R/Makevars \
   && install2.r --error \
   --deps TRUE \
   rstan \
   # install R packages
   rJava \
   tabulizer \
   log4r \
   modules \
   pointblank \
   styler \
   prophet

# update R packages and cleanup 
RUN Rscript -e "update.packages(ask=FALSE)" \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/ \
   && rm -rf /tmp/downloaded_packages/ /tmp/*.rds