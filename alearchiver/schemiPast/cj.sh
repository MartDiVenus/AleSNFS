#!/bin/bash


leggoNTarget=$(cat /tmp/backemergNTarget)

pathName="$(cat /tmp/backemergPseudoOptions/$leggoNTarget)"

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

sleep 1

rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

vim -c ":runtime! vimScript/backemerg/alearchiver/cj/CJ01.vim" -c ":cal CJ01#CJ01()" /tmp/backemergRuffiano -c :q

pathDestination="$(cat /tmp/backemergVimInputCJ01)"


#read -p "Scegli il percorso di destinazione del file compresso:



#alpha) lo stesso del relativo file non compresso;



#beta) esprimi un nuovo percorso.



#gamma) usa comodamente i percorsi di destinazione specificati in
#       /tmp/valeNetrwDMarked




#Digita il <<alpha>> o <<beta>> o <<gamma>> e premi Enter.

#:" pathDestination


if test $pathDestination == "alpha"

then

	        if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then
		
			jar -cfv $nomeCartella.jar $nomeCartella

		else

			jar -cfv $nomeFile.jar $nomeFile
		fi

fi

if test $pathDestination == "beta"

then
        ### devo comprimere [con l'archivio $kind] nella scelta <b> della destinazione
clear
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "

echo "Digita, senza la </> finale, il percorso di destinazione del file compresso
$leggoA

" > /usr/local/lib/backemerg/alearchiver/echoLines/c/cz02.txt

vim -c ":runtime! vimScript/backemerg/alearchiver/cj/CJ02.vim" -c ":cal CJ02#CJ02()" /tmp/backemergRuffiano -c :q

destPathManuale="$(cat /tmp/backemergVimInputCZ02)"


#read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
#$leggoA
#
#:" destPathManuale


                        if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	                  jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

                          else

	                  jar -cfv $destPathManuale/$nomeFile.jar $nomeFile

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

	                 jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

                         else

	                 jar -cfv $destPathManuale/$nomeFile.jar $nomeFile

	                 fi


done	
#### chiusura di pathDestinarion (riga 197)
fi

if [ -f /tmp/backemerg-percorsoIsolato ]; then

cd ..

fi

exit


