#!/bin/bash
# initiate greeting and script
echo Hi $USER!
echo The Date is $(date)
while true
do
	echo =================================
	echo             MENU
	echo 1. Operating System Info
	echo 2. Network Info
	echo 3. User Info
	echo 4. File Operations
	echo 5. Find Files
	echo 6. Exit
	echo =================================
	echo -n  make a choice or press 6 to quit  
	read value 
	if [ $value == '6' ]
	then 
		echo Goodbye
		break
	
	else 
		case $value in
			1) 
				echo Please Make a Selection from the following:
				echo 1. Type of OS/distro
				echo 2. Free and Used Memory
				echo 3. Disk Usage
				echo 4. System Uptime
				echo -n enter selection now:
				read q1value
				case $q1value in
					1) echo $(lsb_release -a)
					;;
					2) echo $(free)
					;;
					3) echo $(du -h)
					;;
					4) echo  $(uptime)
					;;
				esac	
			;;
			2) 
				echo $(ifconfig)
			;;
		        3)
				echo $(w)
				# gives a truncated list of lasts
				echo $(last | head -n  10 )
			;;
			4)
				echo File Operations Menu
                                echo 1. Create a File
				echo 2. Delete a FIle
				echo 3. Create a Directory
				echo 4. Delete a Directory
				echo 5. Compress a File
				echo 6. Decompress Archive
				echo -n enter selection now: 
				read q4value
				case $q4value in
					1)
						echo -n enter a filename:
					        read fname1
						if [ -f $fname1 ]
						then 
							echo $fname1 exists.
							echo -n Overwrite? y/n
							read yna
							if [ $yna == 'y' ]
							then 
								echo $(cp -i $fname1 $fname1 )
							else 
								echo Ok
								break
							fi
						else 
							echo $(touch $fname1)
						fi
					;;
					2)
						echo -n enter a filename to delete
						read fname2
						echo $(rm $fname2)
					;;
					3)
						echo -n enter a directory name
						read fname3
						echo $(mkdir $fname3)
					;;
					4)
						echo -n enter a directory name to delete
						read fname4
						echo $(rmdir $fname4)
					;;
					5)
						echo -n enter a file to archive
						read fname5
						echo $(tar -cfz $fname5.tgz $fname5)
					;;
			 		6)
						echo -n enter an archive to unzip
						read fname6
						echo $(tar -xvf $fname6)
					;;
		 	       esac
			       ;;
		       5)
				echo Selection Menu: 
				echo 1. Find files of N days
				echo 2. Find Files By Extension
				echo -n make selection: 
				read fselection
				if [ $fselection == '1' ]
				then 
					echo -n enter number of days 
					read fdays
					echo $(find -type f -mtime $fdays)
				else
					echo -n enter an extenison 
					read fext
					echo $(find -type f -name "*".$fext)
				fi
			;;				

		esac
		
	fi
done
