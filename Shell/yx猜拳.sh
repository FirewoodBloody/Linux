#!/bin/bash
#ppp用户错误输入循环变量
ppp=1			
#游戏循环变量
i=1
#游戏数组
auto_num=(石头 剪刀 布)
echo "欢迎来到石头剪刀布游戏！
      游戏规则 石头 剪刀 布"
#循环开始
while [ $i -le 3 ]
do
	echo "<<第$i局>>"						#显示第几局
	read -p "请输入 石头 剪刀 布 进行猜拳：" cai		#用户输入参数
	case $cai in 						#case条件判断
	石头)							#将用户输入的汉字转换成数字变量		
		echo "你选择的是:石头"
		num=0
		;;
	剪刀)
		echo "你选择的是:剪刀"
		num=1
		;;
	布)
		echo "你选择的是:布"
                num=2
		;;
	*)
		if  [ $ppp -le 2 ];then				#限制用户输入不符合规格（任意）字符的次数 
			echo "你的选择有误！请重新选择！！！"		#首次跳过本次循环
			let ppp++
			let i++
			echo
			echo
			continue
		else
			echo "你的输入次数上限！！！"		#错误次数上限时，退出脚本
			echo -n .;sleep 2;echo -n .;sleep 2;echo -n .;sleep 2;echo -n .;sleep 2;echo .
			exit 0
		fi
	esac



	echo ""
	autonum=$[RANDOM%3]					#定义电脑随机数字变量
	autocai=${auto_num[$autonum]}				#定义电脑随机出拳
								#定义电脑思考时间延迟，
	echo -n "电脑正在选择，请稍等.";sleep 0.5;echo -n .;sleep 0.5;echo -n .;sleep 0.5;echo -n .;sleep 0.5;echo . #屏幕每隔1秒输出1个点
	case $autonum in 					#判断电脑随机数变量与用户输入的转译数字变量关系
	0)							#当电脑随机随机变量数为0判断用户输入汉字的各种关系
		if [ $num -eq 0 ];then
			echo "电脑选择的是："$autocai
			echo "平局"
		elif [ $num -eq 1 ];then
			echo "电脑选择的是："$autocai
			echo "你输了"
		else
			echo "电脑选择的是："$autocai
			echo "你赢了"
		fi;;
	1)							#当电脑随机随机变量数为1判断用户输入汉字的各种关系
	        if [ $num -eq 0 ];then
                        echo "电脑选择的是："$autocai
                        echo "你赢了"
                elif [ $num -eq 1 ];then
                        echo "电脑选择的是："$autocai
                        echo "平局"
                else
                        echo "电脑选择的是："$autocai
                        echo "你输了"
                fi;;
	2)							#当电脑随机随机变量数为2判断用户输入汉字的各种关系
                if [ $num -eq 0 ];then
                        echo "电脑选择的是："$autocai
                        echo "你输了"
                elif [ $num -eq 1 ];then
                        echo "电脑选择的是："$autocai
                        echo "你赢了"
                else
                        echo "电脑选择的是："$autocai
                        echo "平局"
                fi;;
	esac
	echo 			#使每一局于下一局的间隔更宽
	echo
	let i++			#游戏循环次数
done
