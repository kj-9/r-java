FROM rocker/tidyverse:4.0.2

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
    log4r