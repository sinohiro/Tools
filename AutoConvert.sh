#!/bin/bash
#echo -e ${files%.*} '\e[1;35m <-files \e[m' <-デバック用テンプレ
IFS_bak=$IFS
IFS=$'\n'

echo "Welcome to AutoMovieConverter V2.0"
echo "\e[1;33m Caution!! This script requires ffmpeg \e[m"
echo "You can do the following"
echo "mkv to mp4\n"

Chekcount=`ls -1 | wc -l`

for ChekDIR in chekcount;do
	if [ ! -e ./Convert ]; then
		mkdir Convert
		echo "Create_ConvertDirectory"
	fi
	if [ ! -e ./Converted ]; then
		mkdir Converted
		echo "Create_ConvertedDirectory"
	fi
done

ConvertDIR="./Convert"
ConvertedDIR="./Converted"

files=`ls -v1 ${ConvertDIR}`
after_files=`ls -v1 $ConvertedDIR`

for filename in ${files[@]};do
	checkmachcount=`ls -1 ./Convert | wc -l`
	for Chekmach in $checkmachcount;do
		echo -e $filename '\e[1;35m <-filename \e[m'
		chekmachname=`echo ${filename} | sed 's/\.[^\.]*$//'`
		echo -e $chekmachname '\e[1;35m chekmachname \e[m'
		if [ -e ./Converted/${chekmachname}.* ] ; then
			mach_file=1
			break
		else
			mach_file=0
			if [ ${filename##*.} = "mkv" ]; then
				support_check=1
			else
				support_check=0
			fi
		fi
	done

	if [ ${mach_file} -eq 0 ] && [ ${support_check} -eq 1 ]; then
		echo -e ${filename} '\e[1;33m Convert_Start... \e[m'
		ffmpeg -i ${ConvertDIR}/${filename} -c:v libx264 -crf 18 -c:a aac ${ConvertedDIR}/${filename%.*}.mp4

		before_time=`ffprobe ${ConvertDIR}/${filename}  -hide_banner -show_entries format=duration | grep -e \[0-9] | awk -F '[^0-9]+' '{for(i=1;i<=NF;i++){if($i!="")print $i}}' | awk 'NR==1'`
		after_time=`ffprobe ${ConvertedDIR}/${filename%.*}.mp4  -hide_banner -show_entries format=duration | grep -e \[0-9] | awk -F '[^0-9]+' '{for(i=1;i<=NF;i++){if($i!="")print $i}}' | awk 'NR==1'`

		echo -e ${before_time} '\e[1;35m before_time \e[m'
		echo -e ${after_time} '\e[1;35m after_time \e[m'

		if [ $before_time == $after_time ]; then
			echo -e ${filename} '\e[1;33m Remove_ConvertData... \e[m'
			sleep 1
			rm ${ConvertDIR}/${filename}
			echo -e ${filename%.*}.mp4 '\e[1;32m Convert_complete \e[m'
			sleep 1
		else
			echo -e ${filename} '\e[1;31m Convert_Error...ffmpegError \e[m'
			echo -e ${filename} '\e[1;33m Remove_Unfinished_Data... \e[m'
			rm ${ConvertedDIR}/${filename%.*}.mp4
			sleep 2
		fi

	elif [ ${mach_file} -eq 1 ]; then
		echo -e ${filename} '\e[1;31m Convert_Error...Already_Converted \e[m'
		echo -e ${filename} '\e[1;33m Convert_Skip \e[m'"\n"
		sleep 2
	elif [ ${support_check} -eq 0 ]; then
		echo -e ${filename} '\e[1;31m Convert_Error...Format_Not_Supported \e[m'
		echo -e ${filename} '\e[1;33m Convert_Skip \e[m'"\n"
		sleep 2
	else
		echo -e ${filename} '\e[1;31m Convert_Error...Exception occured \e[m'
	fi
done

IFS=$IFS_bak
