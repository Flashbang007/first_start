#!/bin/bash -x

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
rm ~/bin/first_start.txt

exit 0
