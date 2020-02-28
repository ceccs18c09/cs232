pdftotext -layout result_s2.pdf

grep -A2 'CHN18CS' result_s2.txt > a.txt

tr '\n' ' ' < a.txt > a1.txt

sed 's/t//g' a1.txt > a2.txt

awk '{$1=$1;print}' a2.txt > a3.txt

sed 's/CHN/\nCHN/g' a3.txt > a4.txt

tr ',' ' ' < a4.txt > af.txt

sed -i 's/(O)/ 10/g' af.txt
sed -i 's/(A+)/ 9/g' af.txt
sed -i 's/(A)/ 8.5/g' af.txt
sed -i 's/(B+)/ 8/g' af.txt
sed -i 's/(B)/ 7/g' af.txt
sed -i 's/(C)/ 6/g' af.txt
sed -i 's/(P)/ 5/g' af.txt
sed -i 's/(F)/ 0/g' af.txt
sed -i 's/(FE)/ 0/g' af.txt
sed -i 's/(I)/ 0/g' af.txt
sed -i 's/(Absent)/ 0/g' af.txt

awk '{ print $1,$3,$5,$7,$9,$11,$13,$15,$17,$19 }' af.txt > gp.txt

awk '{
	total=0
	flag=0
	loss=0
	for(var =2;var <=NF;var++)
	{
		if($var == 0)
		{
			flag=1
			loss=loss+1
		}
		total+=$var
	}
	cg=total/9
	if(flag==0)
	{
		printf("%s %0.3f \n",$1,cg);
	}
	if(flag==1)
	{
		printf("%s Failed for %d subjects\n",$1,loss)
	}
}' gp.txt > sgp_s2.txt
join students.txt sgp_s2.txt > sgpf_s2.txt

rm a.txt a1.txt a2.txt a3.txt a4.txt af.txt gp.txt sgp_s2.txt result_s2.txt
