#!/bin/bash

## ok testato anche con *, *.xxx, y*

echo $PWD > /tmp/backemerg-posnow

posnow=$(cat /tmp/backemerg-posnow)

rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

destPathManuale="$(cat /tmp/backemergOptionD)"

leggoNTarget=$(cat /tmp/backemergNTarget)

echo $leggoNTarget > /tmp/backemerg-fullName

rm -f /tmp/alearchiver-cimiceFolderOrFile-cartella

rm -f /tmp/alearchiver-cimiceFolderOrFile-file

file $leggoNTarget > /tmp/alearchiver-dirOrFile-01

grep "directory" /tmp/alearchiver-dirOrFile-01 > /tmp/alearchiver-dirOrFile-02

stat --format %s /tmp/alearchiver-dirOrFile-02 > /tmp/alearchiver-dirOrFile-03

leggoBytes=$(cat /tmp/alearchiver-dirOrFile-03)

if test $leggoBytes -gt 0

then
	/usr/local/lib/backemerg/trattamentoCartelle.sh

	echo "cartella" > /tmp/alearchiver-cimiceFolderOrFile-cartella

	nomeCartella="$(cat /tmp/backemerg-nomeCartellaIsolata)"


else

        /usr/local/lib/backemerg/trattamentoFiles.sh

	echo "file" > /tmp/alearchiver-cimiceFolderOrFile-file

nomeFile="$(cat /tmp/backemerg-nomeFileIsolato)"

nomeFileSenzaEstensione="$(cat /tmp/backemerg-nomeSenzaEstensione)"

fi

## mi sposto nel percorso, altrimenti avrei tutta struttura ricorsivamente riprodotta 
# nel file compresso, e risulterebbe assai noioso.

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd $percorsoIsolato


sleep 1


            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

            else

	    jar -cfv $destPathManuale/$nomeFileSenzaEstensione.jar $nomeFile

	    fi



	cd $posnow

grep "^-remove$" /tmp/alearchiver-options > /tmp/alearchiver-optionsRemove

stat --format %s /tmp/alearchiver-optionsRemove > /tmp/alearchiver-optionsRemoveBytes

leggoBytes=$(cat /tmp/alearchiver-optionsRemoveBytes)

if test $leggoBytes -gt 0

then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		sudo rm -r $percorsoIsolato/$nomeCartella

	        else

	        sudo rm $percorsoIsolato/$nomeFile

               fi

fi

exit


