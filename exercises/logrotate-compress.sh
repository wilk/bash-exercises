#!/usr/bin/env bash
# aggiungere l'opzione -c e --compress per utilizzare il tipo di compressore
# commands hint: case, bzip2, gz


#######################################################
#inserire controllo argomenti

if [ $# -gt 3 -o $# -le 0 ]
then
    echo "usage sh fintoLogRotate.sh <logname> <compression> <compression type>"
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
case $# in
1)
    mv $1 $1-`date +%Y%m%d`
;;
2)
    if [ $2 == "-c" -o $2 == "--compress" ]
    then
        mv $1 $1-`date +%Y%m%d`
        bzip2 $1-`date +%Y%m%d`
    else
        echo "option not allowed"
    fi
;;
3)
    if [ $3 == "bzip2" -o $3 == "gzip"  ]
    then

        mv $1 $1-`date +%Y%m%d`
        $3 $1-`date +%Y%m%d`
    else
        echo "only bzip2 and gzip compression allowed"
        exit
    fi
esac
fi
touch $1
exit
#######################################################

#######################################################
if [ "$#" -lt 1 ]
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

compression="none"
index=1

# search for -c | --compress argument
for arg in "$@"
do
    case $arg in
        "-c"|"--compress")
            # found! store compression type by looking at next argument
            echo "Compression parameter given"
            next=$((index+1))
            compression=${!next}
        ;;
    esac
    index=$((index+1))
done

# create name for backup file
backup=$1-`date +%Y%m%d`

case $compression in
    "bzip2"|"")
        # user gave "-c bzip2" compression type or just "-c"
        echo "Using bzip2 compression"
        bzip2 -c $1 > $backup.bz2
    ;;
    "gzip")
        # user gave "-c gzip" 
        echo "Using gzip compression"
        gzip -c $1 > $backup.gz
    ;;
    *)
        # user gave nothing or a bad compression type
        echo "Not using compression"
        mv $1 $backup
    ;;
esac

# create new empty file
echo '' > $1
#######################################################