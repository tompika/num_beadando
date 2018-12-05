echo ""
echo "-------------------------------------------------------"
ioDir=io
echo "testing:       " ${ioDir}

exE=${1}
exeCutor=${2}
#echo ${2}
if (( $# != 2 ));
then
#  exE="./"${exE}
  exeCutor="./"
else
  exeCutor=${exeCutor}" "
fi
  
echo "executable:    " ${exE}
echo "executor:      " ${exeCutor}
echo "-------------------------------------------------------"
echo ""



  
ioN=$(ls ${ioDir}/in*|wc -w) #never parse ls  

for n in $(seq 1 ${ioN});
do
   inpuT=${ioDir}/in${n}
   outpuT=${ioDir}/out${n}
   ${exeCutor}${exE} < ${inpuT} > __otmP
   ./checker ${outpuT} __otmP
   reT="$?"
   if [ ${reT} -ne 0 ]
   then
	   echo "FAIL   in${n}"
   else
   	echo "OK     in${n}"
   fi
done
rm __otmP
echo ""
