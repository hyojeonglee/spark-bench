#!/bin/bash

DIR=`dirname "$0"`
DIR=`cd "${DIR}/.."; pwd`



for workload in `cat $DIR/bin/applications.lst`; do
	if [[ $workload == \#* ]]; then
		continue
	fi
	echo -e "$Prepare  ${workload} ..."
    
	WORKLOAD=${DIR}/${workload}

	echo -e "Run ${workload}"
	echo -e "Exec script: $WORKLOAD/bin/run.sh"
	EXEC_CORES=$EXEC_CORES EXEC_MEMORY=$EXEC_MEMORY $WORKLOAD/bin/run.sh

	result=$?
	if [ $result -ne 0 ]
	then
	    echo -e "ERROR: ${workload} failed to run successfully."
            exit $result
	fi
done

echo "Run all done!"
