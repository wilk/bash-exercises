#!/usr/bin/env bash

# dato un file testuale in input, monitorare il numero di righe: se questo sfora un limite dato, loggare sul log di sistema e terminare
# commands hint: cut, wc, cat, logger, sleep, while

#######################################################
LENGHT=`wc -l < $1`

echo "il file ha $LENGHT righe"

while [ $LENGHT -le 12  ]
do
    LENGHT=`wc -l < $1`
    sleep 2
done

logger -s "ora il file $1 è troppo grande, ha $LENGHT righe"
echo "ora il file è troppo grande, ha $LENGHT righe "
#######################################################

#######################################################
echo $1

#get number of line in the file
lines="$(cat $1 | wc -l)"

while [ 1 ]
do
    if [ $lines -gt 2 ]
    then
        echo "$1 has $lines lines"
        toPrint="$1 has $lines lines"
        logger -t $0 -s $toPrint
        exit
    fi

sleep 2
done
#######################################################

#######################################################
file=$1
echo "Monitoring $1"

end=0
while [ $end == 0 ]
do
    count="$(wc --lines $1 | cut -f 1 -d ' ')"
    echo $count

    if [ $count -gt 50 ]
    then
        logger "Maximum length reached!" -t "TEST"
        end=1
    fi

    sleep 1
done
#######################################################

#######################################################
#inserire controllo argomenti

if [ $# -gt 1 ]
then
    echo "usage sh fintoLogRotate.sh <logname>"
    exit
fi

#inserire controllo permesso lettura

if ! [ -r $1 -a -w $1 ]
then
    echo "user don't have read/write permission on $1"
    exit
fi

dimension=`wc -c < $1`

if [ $dimension -gt 1 ]
then
    mv $1 $1-`date +%Y%m%d`
fi

touch $1
#######################################################

#######################################################
if [ $# -ne 2 ]; then
        echo "Usage: $0 <FILE_PATH> <LIMIT>"
        exit
fi

while [ 1 ];
do
    LINE_NUM=`wc -l $1 | cut -d ' ' -f 1`
    echo "Line number: $LINE_NUM"

    if [ $LINE_NUM -gt $2 ]
    then
        MSG="File $1 longer than $2 lines"
        echo $MSG
        logger -t $0 $MSG
        exit
    fi

    sleep 1
done
#######################################################

#######################################################
check_text()
{
        if [ `file -i $1 | cut -d' ' -f2 | cut -d'/' -f1`=="text" ]
        then
                return 0
        else
                return 1
        fi
}

LIMIT=50

if [ $# -ne 1 ]
then
        echo "Wrong number of arguments"
        exit
fi

while [ 1 ]
do
        check_text $1
        if ! [ $? -eq 0 ]
        then
                echo "File not supported"
                exit
        fi

        LINE=`wc -l $1 | cut -d' ' -f1`
        if [ $LINE -gt $LIMIT ]
        then
                echo "The number of line is: $LINE"
                logger -t exercise2 -i -- -"The file $1 has a number of line greater than $LIMIT"
                exit
        fi
        sleep 1
done
#######################################################

#######################################################
echo "Nome file:"
read name
echo "Numero max di righe: "
read n

while [ 1 ]
do
cmd=`cat $name |wc -l`

if [ $cmd > $n ]
then
    log=`logger -s "Numero di righe maggiori di $n"`
    echo "overflow!"
    exit
else
    echo "ok!"
fi
done
#######################################################