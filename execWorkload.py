import sys
import os

arg_list = sys.argv

workload = arg_list[1]

if (workload == "LR"):
    cmd = "./LogisticRegression/bin/run.sh"
elif (workload == "SVD"):
    cmd = "./SVDPlusPlus/bin/run.sh"

os.system(cmd)
