#!/bin/bash
echo -e "\033[32m<<欢迎来到猜拳游戏>>\033[0m
	游戏规则：
		用户与电脑分别选择 
			\033[35m<石头> <剪刀> <布>\033[0m"
i=1;y=0;s=0;p=0;xz=1
auto_num=(石头 剪刀 布)
secho(){
	echo -ne "\033[35m.\033[0m";sleep 1;echo -ne "\033[35m.\033[0m";sleep 1;echo -ne "\033[35m.\033[0m";sleep 1;echo -ne "\033[35m.\033[0m";sleep 1;echo -e "\033[35m.\033[0m"
}
while :
do
  echo "<<第$i局>>"
  read -p "请选择<石头> <剪刀> <布> 进行猜拳：" cai
  case $cai in
  石头)
	echo "你选择的是：石头"
	num=0;;
  剪刀)
	echo ""
	num=1;;
  布)
	echo ""
	num=2;;
  *)
	if [ $xz -le 2 ];then
		echo -e "\033[33m您的选择有误，请重新选择！！！\033[0m"
		let xz++
		let i++
		echo
		echo
		continue
	else
		echo -e "\033[31m你的输入错误次数上限！！！\033[0m"
		secho
		exit
	fi
 esac
 autonum=$[RANDOM%3]
 autocai=${auto_num[$autonum]}
 echo -n "电脑正在选择，请稍等";secho
 echo "电脑选择的是：$autocai"
 case $autonum in 
 0)
	if [ $num -eq 0 ];then
		echo "平局"
		let p++
	elif [ $num -eq 1 ];then
		echo "你输了"
		let s++
	else
		echo "你赢了"
		let y++
	fi;;
 1)
	if [ $num -eq 0 ];then
                echo "你赢了"
        	let y++
	elif [ $num -eq 1 ];then
                echo "平局"
		let p++
        else
                echo "你输了"
		let s++
        fi;;

 2)
	if [ $num -eq 0 ];then
                echo "你输了"
        	let s++
	elif [ $num -eq 1 ];then
                echo "你赢了"
        	let y++
	else
                echo "平局"
		let p++
	fi

esac
echo
echo
let i++
if [ $y -eq 2 ];then
	echo -n "正在计算最终战绩，请稍等";secho
	echo "战绩：电脑胜 $s 场><输 $y 场><平局 $p 场"
	echo "战绩：玩家胜 $y 场><输 $s 场><平局 $p 场"
	echo -e "\033[32m你赢了！！！\033[0m"
	exit
elif [ $s -eq 2 ];then
	echo -n "正在计算最终战绩，请稍等";secho
        echo "战绩：电脑胜 $s 场><输 $y 场><平局 $p 场"
        echo "战绩：玩家胜 $y 场><输 $s 场><平局 $p 场"
        echo -e "\033[31m你输了！！！\033[0m"
	exit
fi
done
