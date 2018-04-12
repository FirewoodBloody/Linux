#!/bin/bash
read -p "请输入第一个整数：" z
read -p "请输入第二个整数：" x
read -p "请输入第三个整数：" c
if [ $z -eq $x ] || [ $z -eq $c ] || [ $x -eq $c ];then
	echo "请输入三个不想等的整数！！"
elif [ $z -ge 0 ] &> /dev/null ;then
	if [ $x -ge 0 ] &> /dev/null ;then
		if [ $c -ge 0 ] &> /dev/null ;then
			if [ $z -gt $x ];then
				v=$z
				z=$x
				x=$v
			fi
			if [ $z -gt $c ];then
				b=$z
                               	z=$c
                	       	c=$b
			fi
			if [ $x -gt $c ];then
				n=$x
				x=$c
				c=$n
			fi
			echo $z $x $c 
		else
			echo "神经病！！！会不会输整数！！！"
		fi
	else 
		echo "二货！！能不能输整数！！！"
	fi
else
	echo "撒比！不认识整数！！！"
fi
