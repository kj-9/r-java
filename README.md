# Docker image of R with Java

A base image is [rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse) which includes R, tidyverse, and Rstudio server.

This images adds R packages below.
- rJava
- tabulizer
- log4r
- modules

## tags

Tags indicates R version.
For example, ```ghcr.io/kj-9/r-java:4.0.3``` has R version ```4.0.3```.

Currently, only some R versions are available. See [here](https://github.com/users/kj-9/packages/container/r-java/versions) to check out available tags(R versions).

# Usage

## Example of running Rstudio server
```sh
docker run \
    --workdir /home/rstudio \
    -v $(pwd):/home/rstudio \
    -e PASSWORD=YOURPASSWORD \
    -p 8787:8787 \
    ghcr.io/kj-9/r-java:latest
```
then access ```localhost:8787``` with your browser.
\*default user name is ```rstudio```.


## Example of running R script
```sh
docker run \
    -it \
    --rm \
    --entrypoint 'Rscript' \
    --workdir /home/rstudio \
    -v $(pwd):/home/rstudio \
    ghcr.io/kj-9/r-java:latest YOURSCRIPT.R
```
