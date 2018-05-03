#!/bin/bash
year=`date +%Y`
month=`date +%m`
day=`date +%d`
week=`date +%A`
hour=`date +%H`
minute=`date +%M`
second=`date +%S`
weeks=("星期一" "星期二" "星期三" "星期四" "星期五" "星期六" "星期日")
case $week in 
星期一)
	i=0;;
星期二)
	i=1;;
星期三)
	i=2;;
星期四)
	i=3;;
星期五)
	i=4;;
星期六)
	i=5;;
星期日)
	i=6
esac
second_judeg(){
	if [ $second -eq 60 ];then
		second=00
		let minute++
	fi
}
monute_judeg(){
	if [ $minute -eq 60 ];then
		minute=00
		let hour++
	fi
}
hour_judeg(){
	if [ $hour -eq 24 ];then
		hour=00
		let day++
		let i++
	fi
}
week_judeg(){
	if [ $i -eq 7 ];then
		i=0
	fi
}
day_judeg(){
	case $month in
	1|3|5|7|8|10|12)
		if [ $day -eq 31 ];then
			day=01
			let month++
		fi;;
	4|6|9|11)
		if [ $day -eq 30 ];then
			day=01
			let month++
		fi;;
	2)
		if [ $(($year%100)) -ne 0 ]&&[ $(($year%4)) -eq 0 ]||[ $(($year%400)) -eq 0 ];then
			if [ $day -eq 29 ];then
				day=01
				let month++
			fi
		elif [ $day -eq 28 ];then
			day=01
			let month++
		fi
	esac
}
month_judeg(){
	if [ $month -eq 12 ];then
		month=1
		let year++
	fi
}
echo -e "\033[35mPartyTime:\033[0m"
tput sc
echo -ne "\033[10;30H\033[1;31m$year-$month-$day $week $hour:$minute:$second\033[0m"
while :
do 
	let second++
	second_judeg;monute_judeg;hour_judeg
	week_judeg
	day_judeg;month_judeg
	tput rc
	sleep 0.995
	tput ed
	echo -ne "\033[10;30H\033[1;31m"
	printf "%04d-%02d-%02d" $year $month $day  
	echo -en " ${weeks[$i]} " 
	printf "%02d:%02d:%02d" $hour $minute $second
	echo -ne "\033[0m"
done
