# -*- coding: utf-8 -*-
"""Make images using CASA."""

import json
import os
import argparse
from os.path import isdir, join
from shutil import copyfile
import drivecasa


if __name__ == "__main__":
 
    parser = argparse.ArgumentParser(description='Simulation script.',
                                     epilog='')
    parser.add_argument('config', type=str, nargs='?', help='JSON config file.') 
    parser.add_argument('drop_uid', type=str, nargs='?', help='drop uid.')
    
    args = parser.parse_args()   
    
    casa = drivecasa.Casapy(working_dir=os.path.curdir,
                         casa_logfile=False,
                         timeout = 1200,
                         echo_to_stdout=False) 
    scatter_uid = args.drop_uid.split('/')
    scatter_id = scatter_uid[1] 

    casa.run_script(["config_file = '{}'".format(args.config)])
    casa.run_script(["ID = '{}'".format(scatter_id)])

    casa.run_script_from_file('/BIGDATA/ac_shao_tan_1/OSKAR/OSKAR_CASA/image.py')
