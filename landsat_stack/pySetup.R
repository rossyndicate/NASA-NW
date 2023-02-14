# a verbose version of this script exists in the pySetup.Rmd file

library('reticulate')
library('tidyverse')
try(install_miniconda())
py_install(c('earthengine-api', 'pandas', 'geopandas'))

#grab your current WD
dir = file.path(py_env_dir, 'landsat_stack')

#create a conda environment named 'apienv' with the packages you need
conda_create(envname = file.path(py_env_dir, 'env'),
             packages = c('earthengine-api', 'pandas', 'geopandas'))
Sys.setenv(RETICULATE_PYTHON = file.path(py_env_dir, 'env/bin/python/'))
use_condaenv(file.path(py_env_dir, "env/"))
#print the configuration
py_config()

#check install
py_install(packages = c('earthengine-api', 'pandas', 'geopandas'), envname = file.path(py_env_dir, 'env/'))
