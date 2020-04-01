clear
sum=0
ch="y"
echo "Enter two numbers:"
read num1
read num2
while [ $ch = "y" ]
do
echo "1.Addition"
echo "2.Subtraction"
echo "3.Multiplication"
echo "4.Division"
echo "5.Modulus"
echo "Enter your choice"
read choice
case $choice in
    1)sum=`expr $num1 + $num2`
     echo "Sum ="$sum;;
        2)sum=`expr $num1 - $num2`
     echo "Differnce = "$sum;;
    3)sum=`expr $num1 \* $num2`
     echo "Product = "$sum;;
    4)sum=`expr $num1 / $num2`
     echo "Quotient = "$sum;;
    5)sum=`expr $num1 % $num2`
      echo "Remainder = "$sum;;
    *)echo "Invalid choice";;
esac
echo "Press y to continue:"
read ch
if [ $ch != "y" ]
then
    exit
fi
done    
