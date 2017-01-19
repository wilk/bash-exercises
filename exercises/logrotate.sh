#!/usr/bin/env bash

# simulare il logrotate su un file
# commands hint: date, touch

#######################################################
if [ $# -ne 1 ]
then
        echo "Wrong number of arguments. File name expected."
        exit
fi

NEWNAME="$1-`date +%Y%m%d`"
mv $1 $NEWNAME
touch $1
#######################################################

#######################################################
if ! [ "$#" -eq 1 ]
then
    echo "Invalid argument list"
    exit 1
fi

if ! [ -w "$1" ]
then
    echo "Input file is not writable"
    exit 1
fi

file=$1
today=`date +%Y%m%d`
mv $1 $1-$today
touch $1
#######################################################

#######################################################
if [ $# -eq 1 ]; then
    SIZE_CHECK=0
    SIZE_LIMIT=0

elif [ $# -eq 2 ]; then
    SIZE_CHECK=1
    SIZE_LIMIT=$2
else
        echo "Usage: $0 <FILE_PATH> [FILE_SIZE in B]"
        exit
fi

FILE=$1

if ! [ -r $FILE ]; then echo "File can't be read"; exit 1; fi

if [ $SIZE_CHECK -a $(stat $FILE -c%s) -le $SIZE_LIMIT ]
then
    echo "Enabled size check - file size under limit"
    exit 0
fi

DATE=$(date "+%G%m%d")
DEST=$FILE-$DATE

mv $FILE $DEST
touch $FILE


echo "Input file $FILE --> $DEST"
#######################################################

#######################################################
#check argument number
if [ ! "$#" -eq 1 ]
then
    echo "wrong number of argument. Expected 1 argument"
    exit 1
fi

#get size of the input file
file_size=`wc -c < $1`
echo $file_size

MAX_SIZE=20

if [ "$file_size" -gt $MAX_SIZE ]
then
    date="$(date +"%Y%m%d")"
    newFileName="$1-$date"
    echo "newFileName is $newFileName"
    mv $1 $newFileName
    touch $1
    echo "created new file with $1 name"
else
    echo "file is not big enough"
fi
#######################################################

#######################################################
timestamp=`date +%Y%m%d`

stop=0
while [ $stop -eq 0 ]
do
    echo "Logrotate:  (1=yes/0=no) "
    read stop

done

mv $1  $1-$timestamp
touch $1
#######################################################

#######################################################
echo "inserisci input"
read input
echo "$input"
var=`date +%Y%m%d`
echo "$var"
b='-'
newname=" $input$b$var "
echo "$newname"

mv $input $newname
touch $input
#######################################################