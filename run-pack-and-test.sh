#!/bin/sh
ENVIRONMENT_FILE=$1

source /root/.bashrc 

conda env create -f $ENVIRONMENT_FILE
conda pack -n $ENVIRONMENT_NAME --ignore-missing-files --output $HOME/$ENVIRONMENT_NAME.tar.gz

cp $HOME/$ENVIRONMENT_NAME.tar.gz /tmp/$ENVIRONMENT_NAME.tar.gz
mkdir /tmp/$ENVIRONMENT_NAME
tar -xvf /tmp/$ENVIRONMENT_NAME.tar.gz -C /tmp/$ENVIRONMENT_NAME
source /tmp/$ENVIRONMENT_NAME/bin/activate
bash /tmp/$ENVIRONMENT_NAME/bin/conda-unpack


# run tests
cd /tmp/project
pytest
