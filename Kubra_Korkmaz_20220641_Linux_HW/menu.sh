#!/bin/bash
#Author Kubra Korkmaz
#ID 20220641
#Date 10th of December in 2022
#******************************************************************
#******************************************************************
# Bash Menu Script Example
#*****************************************************************
 #take options from user
PS3='Please enter your choice: '
#options as array
options=("Do you want help?" "Do you want to see content of folder?" "Do you want to copy file?" "Create a file" "Create folder" 
"Archive" "Quit")
#switch case to check options
select opt in "${options[@]}"
do
    case $opt in
    #option one
        "Do you want help?") 
        #show which option chosen from user
            echo "you chose choice 1"
            #invoke help file
            ./help.sh 
            #end of option 1
            ;;
      #option two
        "Do you want to see content of folder?")
        #show which option chosen from user
            echo "you chose choice 2"
            #ask folder name from user
            echo "write folder name"
            #insert folder name to variable folder
            read folder
            #show content of folder with their permissions
            ls -l $folder
            #end of option two
            ;;
      #option three
        "Do you want to copy file?")
        #show which option chosen from user
            echo "you chose choice 3"
          #ask folder or file name and destination name from user
            echo "which folder or file do you want to copy and which destination? Please write respectively."
            #insert them into variables
            read name destination
            #checks file is exist or not
            if [[ !(-e $name)]] 
            then
            #if not, warn user
            echo this file $name is not exist!
            #checks destination is exist or not
            elif [[ !(-e $destination) ]] 
            then
            #if not, warn user
            echo this destination $destination is not exist
            #if both are exist then copy the file to destination
            else 
           #if file and destination have the same extension 
           #ask a permission from user to overwrite [y/n]
            cp -i $name $destination
            fi
            #end of option three
            ;;
      #option four
        "Create a file")
         #show which option chosen from user
            echo "you chose choise 4"
            #ask file name
            echo "what will you give a name to your file?"
            #insert it to variable
            read filename
            #create file
            touch $filename
            #give write, read, execute permissions to file
            chmod u+x $filename 
            #end of option 4
        ;;
        #option five
        "Create folder")
         #show which option chosen from user
            echo "you chose choise 5"
            #ask folder name
            echo "what will you give a name to your folder?"
            #insert folder name to variable
            read foldername
            #create folder
            mkdir $foldername  
        #end of option
        ;;
        #option six
        "Archive")
        #show which option chosen from user
        echo "you chose choise 6"
        #ask archive name and files name with spaces and extentions
        echo "wrtie archive name and files you want to compress"
        #insert them into variable
        read cmd 
        #create archive and and compress the files into the folder
        tar -cf $cmd
        #end of option
        ;;
        #option seven
        "Quit")
        #break the menu loop
            break
            ;;
        #invalid input
        *) echo "invalid option $REPLY";;
    #end of case
    esac
#end of menu
done
