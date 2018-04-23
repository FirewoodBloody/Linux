#!bin/bash
i=0
while :
do
	read -p "请输入你要记录的数组或输入Esc推出："  nume
	if [ $nume == Esc ];then
		break
	else
		name[$i]=$nume
		let i++
	fi
done
echo "总计数量${#name[*]}"
echo  ${name[@]}
