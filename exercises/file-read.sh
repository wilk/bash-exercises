#!/usr/bin/env bash

# dato un file in input, restituire una conferma se l'utente ha i permessi di lettura altrimenti una negazione
# commands hint: [ -r $file ], if

#######################################################
echo "insert the file path: "
read file

#check if the file is readable
if  [ -r "$file" ] ; then
    echo "'$file' is readable."
else
    echo "'$file' is not readable."
fi
#######################################################

#######################################################
if [ $# -ne 1 ]; then
    echo "Usage: $0 <FILE_PATH>"
    exit
fi

if [ -r $1 ]; then echo "File can be read"; else echo "ERROR: file can't be readL"; fi
#######################################################

#######################################################
if [ -r $1 ]; then
        /usr/bin/cat $1
else
        echo "the user cannot read the file"
fi
#######################################################

#######################################################
echo "inserisci nome file:"
read file
echo "$file"
if [ -r $file ]
then
echo "leggibile"
else
echo "non leggibile"
fi
#######################################################

#######################################################
echo "name file : "
read name

if [ -r $name ]
then
    echo "read!"
else
    echo "not read!"
fi
#######################################################