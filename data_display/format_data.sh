#!/bin/bash
#***********************************************#
#创建时间:      20170401                        #
#author:        panhao@myhexin.com              #
#***********************************************#
#格式化数据：用于转换数据为需要显示的数据

root=$(cd $(dirname $0);pwd)

year=$1
sourcepath=${root}/data
datapath=${root}
targetFile=${datapath}/${year}_mink_display.csv
>${targetFile}
echo "xdate,yType,error_sum" >> ${targetFile}


for file in `ls ${sourcepath}/ | grep ${year}`
do
	echo $file
	TYPE=`echo ${file} | cut -d "_" -f 3`
	echo ${TYPE}
	sed '1d' ${sourcepath}/${file} | awk -F "," 'BEGIN{
		OFS=","
	}
	{
		print $1 "," "'${TYPE}'" "," $3 
	}' >> ${targetFile}
done

exit
