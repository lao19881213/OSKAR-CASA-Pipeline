#!/bin/bash 


# the pip-installed mpi4py module in the virtual_env somehow does not work with the
# Magnus MPI environment, so we need to load the system mpi4py module, which means
# to load system python 2.7 module first to make sure everything is in 2.7

#source /HOME/ac_shao_tan_1/lbq/bashrc

DFMS_MON_HOST="sdp-dfms.ddns.net"
DFMS_MON_PORT="8098"
APP_ROOT="/BIGDATA/ac_shao_tan_1/OSKAR/daliuge-master/dfms/deploy/pawsey"
SID=$(date +"ska1_low_N"$1_"%Y-%m-%dT%H-%M-%S")
LOG_DIR=$APP_ROOT"/logs/"$SID
mkdir -p $LOG_DIR # to remove potential directory creation conflicts later
#FILENAME="/HOME/ac_shao_tan_1/lbq/dfms/dfms/deploy/tianhe/th_test.json"
GRAPH_DIR="/BIGDATA/ac_shao_tan_1/OSKAR/daliuge-logical-graphs/OSKAR_and_CASA_Pipelines/imaging.json"
CLUSTER="Tianhe2"
#mpirun -np 3 /HOME/ac_shao_tan_1/lbq/lib/python/bin/python $APP_ROOT"/start_dfms_th.py" -l $LOG_DIR -m $DFMS_MON_HOST -o $DFMS_MON_PORT -f $FILENAM
#mpirun -np 1 /HOME/ac_shao_tan_1/lbq/lib/python/bin/python $APP_ROOT"/start_dfms_th.py" -l $LOG_DIR -g $GRAPH_ID 

yhrun -n $1 -N $1 -p gpu /BIGDATA/ac_shao_tan_1/OSKAR/python/bin/python $APP_ROOT"/start_dfms_cluster.py" -l $LOG_DIR -L $GRAPH_DIR -d -c $CLUSTER -v 3
