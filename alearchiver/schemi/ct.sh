#!/bin/bash

## ok testato anche con *, *.xxx, y*.

echo $PWD > /tmp/backemerg-posnow

posnow=$(cat /tmp/backemerg-posnow)

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

rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

vim -c ":runtime! vimScript/backemerg/alearchiver/c/C02.vim" -c ":cal C02#C02()" /tmp/backemergRuffiano -c :q

pathDestination="$(cat /tmp/backemergVimInputC02)"

if test $pathDestination == "alpha"

then

if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	tar -cvf $nomeCartella.tar $nomeCartella

        else

        tar -cvf $nomeFileSenzaEstensione.tar $nomeFile
	        
fi

	
fi



if test $pathDestination == "beta"

then

echo "Digita, senza la </> finale, il percorso di destinazione del file compresso
$pathName" > /usr/local/lib/backemerg/alearchiver/echoLines/c/c03.txt

vim -c ":runtime! vimScript/backemerg/alearchiver/c/C03.vim" -c ":cal C03#C03()" /tmp/backemergRuffiano -c :q

destPathManuale="$(cat /tmp/backemergVimInputC03)"

#read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
#$leggoA
#
#:" destPathManuale

if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	tar -cvf $destPathManuale/$nomeCartella.tar $nomeCartella

        else

        tar -cvf $destPathManuale/$nomeFileSenzaEstensione.tar $nomeFile
	        
fi


## chiusura pathDestination (riga 380)	
fi

	if test $pathDestination == "gamma"

then

rm -fr /tmp/alearchiverSplitDMarked

mkdir /tmp/alearchiverSplitDMarked

split -l1 /tmp/valeNetrw-DMarked /tmp/alearchiverSplitDMarked/

for b in $(ls /tmp/alearchiverSplitDMarked)

do

destPathManuale="$(cat /tmp/alearchiverSplitDMarked/$b)"


if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	tar -cvf $destPathManuale/$nomeCartella.tar $nomeCartella

        else

        tar -cvf $destPathManuale/$nomeFileSenzaEstensione.tar $nomeFile
	        
fi
 

done	
#### chiusura di pathDestinarion (riga 197)
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

