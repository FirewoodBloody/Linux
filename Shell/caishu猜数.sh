#!/bin/bash
num=$[RANDOM%101]
#使用Linux内置的环境变量随机出一个100以内的整数(除法取余)
echo -n -e "计算机正在生成随机数,请稍等\033[32m.\033[0m";sleep 1;echo -n -e "\033[32m.\033[0m";sleep 1;echo -n -e "\033[32m.\033[0m";sleep 1;echo -n -e "\033[32m.\033[0m";sleep 1;echo -e "\033[32m.\033[0m \n"
while :
do
	echo -e "计算机以随机生成一个\033[45;32m100\033[0m以内随机数,你来猜猜看!!!"
	read -p "请输入你猜想的数字:" sssd
		if [ $sssd -ge 0 ] &> /dev/null ;then 
			if [ $sssd -eq $num ];then
				echo "\033[32m恭喜您,猜对了!!!\033[0m"
				exit 0
			elif [ $sssd -gt $num ];then
				echo "抱歉,您猜大了!!!"
			elif [ $sssd -lt $num ];then
				echo "抱歉,您猜小了!!!"
			fi
		else
			echo
			echo -e "\033[47;31m您输入的参数有误!!!\033[0m"
			echo "请您输入一个整数!!!"
		fi
			echo
			echo	
done
