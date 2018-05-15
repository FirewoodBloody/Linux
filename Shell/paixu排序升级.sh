#!/bin/bahs
read -p "请输入第一个数字:" num1
read -p "请输入第二个数字:" num2
read -p "请输入第三个数字:" num3
if [ -n $num1 ] && [ -n $num2 ] && [ -n $num3 ] &> /dev/null;then
	if [ $num1 -ge 0 ]&> /dev/null && [ $num2 -ge 0 ]&> /dev/null && [ $num3 -ge 0 ] &> /dev/null;then
		if [ $num1 -ne $num2 ] && [ $num1 -ne $num3 ] && [ $num2 -ne $num3 ] &> /dev/null;then
			if [ $num1 -gt $num2 ];then
				num=$num1
				num1=$num2
				num2=$num 
			fi
			if [ $num1 -gt $num3 ];then
				num=$num1
				num1=$num3
				num3=$num
				
			fi
			if [ $num2 -gt $num3 ];then
				num=$num2
				num2=$num3
				num3=$num				
			fi
				echo $num1 $num2 $num3
		else
			echo "请你输入三个不相等的参数！！！"
		fi
	else
		echo "请你输入正确的参数！！！"
	fi
else
	echo "请你输入参数！！！"
fi

