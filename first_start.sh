#!/bin/bash

if [[ $1 == "-a" ]]; then
        for i in `cat ~/bin/first_start.txt`
         do
                wget $i
         done
elif [[ -z $1 ]]; then

if [[ ! -d ~/bin ]]
then
    mkdir ~/bin
fi

echo "Catching scripts"

cd ~/bin
wget --no-check-certificate https://raw.githubusercontent.com/Flashbang007/first_start/master/first_start.txt

for i in `cat ~/bin/first_start.txt`
do
    FROMGIT=$(echo $i | cut -d"/" -f7)
    select SCRIPT in "$(echo "download $FROMGIT")" no
    do
        if [[ $SCRIPT !=  no  ]]
        then
            if $(ls ~/bin | grep -Fxq "$FROMGIT")
            then
                rm ~/bin/$FROMGIT
            fi
            wget $i
        fi
        break
    done
done

chmod 744 ~/bin/*.sh
rm ~/bin/first_start.txt*

else
echo "first_start.sh -a for all scrips"
exit 1
fi

exit 0
