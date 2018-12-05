# ez most nincsen belőve
input="../in"${2}
output="../out"${2}
${1} < ${input} > otmp
./checker ${output} otmp
ret="$?"
if [ $ret -ne 0 ]
then
	echo "diff ${output} aktualis_output"
	echo "------------------------------"
	diff ${output} otmp
else
	echo "OK"
fi
rm otmp