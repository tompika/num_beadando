#!/bin/bash

echo ""
echo "-------------------------------------------------------"
proB=${1}
#proB=$(echo ${proB}|tr -d '/')
echo "testing:       " ${proB}

exE=${2}
#exE=$(echo ${2}|tr -d '.')
#exE=$(echo ${exE}|tr -d '/')
echo "executable:    " ${exE}
echo "-------------------------------------------------------"
echo ""

ioN=$(ls ${proB}/io/in*|wc -w)
for n in $(seq 1 ${ioN});
do
   inpuT=${proB}/io/in${n}
   outpuT=${proB}/io/out${n}
   ./${exE} < ${inpuT} > __otmP
   ./checker ${outpuT} __otmP
   reT="$?"
   if [ ${reT} -ne 0 ]
   then
	   echo "FAIL   ${n}"
   else
   	echo "OK     ${n}"
   fi
done
rm __otmP
echo ""
