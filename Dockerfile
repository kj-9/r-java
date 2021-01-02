ARG R_VERSION=${R_VERSION}

FROM rocker/tidyverse:${R_VERSION}

# Install java, rJava and other R packages
RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/ \
   && install2.r --error \
   --deps TRUE \
   rJava \
   tabulizer \
   log4r \
   modules \
   pointblank \
   styler \
   && Rscript  -e "update.packages(ask=FALSE)"