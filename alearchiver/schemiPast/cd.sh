#!/bin/bash

rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

vim -c ":runtime! vimScript/backemerg/alearchiver/cd/CD01.vim" -c ":cal CD01#CD01()" /tmp/backemergRuffiano -c :q

kind="$(cat /tmp/backemergVimInputCD01)"

## testing ok
#read -p "leggi $kind pari al contenuto di /tmp/backemergVimInputCD01" EnterNull

#read -p "I file da comprimere devono avere almeno il permesso di lettura per l'utente $USER.


#Scegli la tipologia di archivio tra le proposte:

#1. tar

#2. tar.xz

#3. zip

#Digita il numero associato alla tua scelta e premi Enter.

#:" kind


destPathManuale="$(cat /tmp/backemergOptionD)"

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

## testing ok
#read -p "leggi /tmp/backemerg-percorsoIsolato" EnterNull

cd $percorsoIsolato

fi

	if test $kind == "1"

	then

			if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		            tar -cvf $destPathManuale/$nomeCartella.tar $nomeCartella

		            else
## testing ok
#read -p "dovrei essere qui
#tar -cvf $destPathManuale/$nomeFile.tar $nomeFile" EnterNull

			    tar -cvf $destPathManuale/$nomeFile.tar $nomeFile

			fi

	fi

	if test $kind == "2"
	
	then
		
		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -c $nomeCartella | xz -e4 > $destPathManuale/$nomeCartella.tar.xz

	        else
 
                tar -c $nomeFile | xz -e4 > $destPathManuale/$nomeFile.tar.xz
	
		fi

	fi

	if test $kind == "3"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

            else

	    zip -r $destPathManuale/$nomeFile.zip $nomeFile

	    fi

	fi

		if test $kind == "4"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

            else

	    jar -cfv $destPathManuale/$nomeFile.jar $nomeFile

	    fi

	fi


	cd ..


exit


