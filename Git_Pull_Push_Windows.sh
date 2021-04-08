#!/bin/sh
#!/bin/bash

printf '%s\n' "Git pull, add, commit and push"
read -p "Do you want to update your Typora Dokument [y/n]: " tri

#echo "Input is " $tri

function Git_update(){
		echo "Git_update starts now"
		#git pull --rebase origin master: origin/master
		git pull --rebase origin master
		git add -A 
		git commit -m "Typora update"
		git push origin master
		git gc
		echo -e "Git_update finished now\n"
}

if [ $tri = y ]
	then
		echo "The process start now"
		#currentDir=$PWD
		#cd e: 
		#cd E:/Typora/Typora
		echo -e "The current Working directory is $PWD\n" 
		
		Git_update
		
		echo "The process finished"
		
elif [ $tri = n ]
	then
		echo "Input is n, this process breaks down"

else
	echo "Input is weather y nor n, this process breaks down"

fi


