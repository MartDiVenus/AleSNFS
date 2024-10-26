#!/bin/bash

leggoNTarget=$(cat /tmp/backemergNTarget)

pathName="$(cat /tmp/backemergPseudoOptions/$leggoNTarget)"

destPathManuale="$(cat /tmp/backemergOptionD)"

echo $pathName > /tmp/backemerg-fullName

rm -f /tmp/alearchiver-cimiceFolderOrFile-cartella

rm -f /tmp/alearchiver-cimiceFolderOrFile-file

file $pathName > /tmp/alearchiver-dirOrFile-01

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
fi

## mi sposto nel percorso, altrimenti avrei tutta struttura ricorsivamente riprodotta 
# nel file compresso, e risulterebbe assai noioso.

if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd $percorsoIsolato

fi

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

            else

	    jar -cfv $destPathManuale/$nomeFile.jar $nomeFile

	    fi

	cd ..

exit


