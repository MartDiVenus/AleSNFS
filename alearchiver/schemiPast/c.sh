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

vim -c ":runtime! vimScript/backemerg/alearchiver/c/C01.vim" -c ":cal C01#C01()" /tmp/backemergRuffiano -c :q

kind="$(cat /tmp/backemergVimInputC01)"


#read -p "I file da comprimere devono avere almeno il permesso di lettura per l'utente $USER.

#Scegli la tipologia di archivio tra le proposte:

#1. tar

#2. tar.xz

#3. zip

#Digita il numero associato alla tua scelta e premi Enter.

#:" kind



vim -c ":runtime! vimScript/backemerg/alearchiver/c/C02.vim" -c ":cal C02#C02()" /tmp/backemergRuffiano -c :q

pathDestination="$(cat /tmp/backemergVimInputC02)"



	### test ok
	#read -p "sta leggendo kind pari a $kind" EnetrNull

	#read -p "sta leggendo pathDestination pari a $pathDestination" EnetrNull

#read -p "Scegli il percorso di destinazione del file compresso:



#alpha) lo stesso del relativo file non compresso;



#beta) esprimi un nuovo percorso.



#gamma) usa comodamente i percorsi di destinazione specificati in
#       /tmp/valeNetrwDMarked




#Digita il <<alpha>> o <<beta>> o <<gamma>> e premi Enter.

#:" pathDestination



if test $pathDestination == "alpha"

then



	if test $kind == "1"

	then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -cvf $nomeCartella.tar $nomeCartella

  	        else

                tar -cvf $nomeFile.tar $nomeFile
	        
		fi

	fi

	if test $kind == "2"

	then
		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -c $nomeCartella | xz -e4 > $nomeCartella.tar.xz

	        else

	        tar -c $nomeFile | xz -e4 > $nomeFile.tar.xz

               fi
	fi

	if test $kind == "3"

	then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then
		
			zip -r $nomeCartella.zip $nomeCartella

		else

			zip -r $nomeFile.zip $nomeFile
		fi
	fi

		if test $kind == "4"

	then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then
		
			jar -cfv $nomeCartella.jar $nomeCartella

		else

			jar -cfv $nomeFile.jar $nomeFile
		fi
	fi


fi



if test $pathDestination == "beta"

then
        ### devo comprimere [con l'archivio $kind] nella scelta <b> della destinazione

echo "Digita, senza la </> finale, il percorso di destinazione del file compresso
$pathName" > /usr/local/lib/backemerg/alearchiver/echoLines/c/c03.txt

vim -c ":runtime! vimScript/backemerg/alearchiver/c/C03.vim" -c ":cal C03#C03()" /tmp/backemergRuffiano -c :q

destPathManuale="$(cat /tmp/backemergVimInputC03)"

#read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
#$leggoA
#
#:" destPathManuale


	if test $kind == "1"

	then

			if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		            tar -cvf $destPathManuale/$nomeCartella.tar $nomeCartella

		            else

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

	if test $kind == "1"

	then

			if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		            tar -cvf $destPathManuale/$nomeCartella.tar $nomeCartella

		            else

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

done	
#### chiusura di pathDestinarion (riga 197)
fi

if [ -f /tmp/backemerg-percorsoIsolato ]; then

cd ..

fi





exit



