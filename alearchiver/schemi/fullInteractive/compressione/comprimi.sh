#!/bin/bash


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
echo " "
echo " "
echo " "
echo " "
echo " "

read -p "I file da comprimere devono avere almeno il permesso di lettura per l'utente $USER.




Scegli la tipologia di archivio tra le proposte:

1. tar

2. tar.xz

3. zip

4. jar

Digita il numero associato alla tua scelta e premi Enter.

:" kind


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
echo " "
echo " "
echo " "
echo " "
echo " "

read -p "Scegli il percorso di destinazione del file compresso:



alpha) lo stesso del relativo file non compresso;



beta) esprimi un nuovo percorso.



gamma) usa comodamente i percorsi di destinazione specificati in
       /tmp/valeNetrwDMarked




Digita il <<alpha>> o <<beta>> o <<gamma>> e premi Enter.

:" pathDestination




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
echo " "
echo " "
echo " "
echo " "
echo " "

read -p "Scegli come esprimere il percorso e il nome del/i file o della/e cartella/e da comprimere:

a) da file, eseguendo tale istanza alearchiver una sola volta.
	Il file deve contenere gli elementi da comprimere uno per riga.
       	e.g. 
	fornire il file /tmp/valeNetrw-SMarked 
	contenente gli elementi selezionati (remarked) con Vale-netrw,
       	è un'ottima scelta perché veloce, comoda, sicura.
       
b) manualmente eseguendo tale istanza alearchiver per ogni elemento da comprimere.

:" tipologiaPathName

if test $tipologiaPathName == "a"

then


read -p "Inserisci il percorso e il nome del file contenente gli elementi, 
uno per riga, da comprimere.

e.g.
/tmp/valeNetrw-SMarked

:" pathNameFileInput


rm -fr /tmp/alearchiver-pathNameFileInput-split

mkdir /tmp/alearchiver-pathNameFileInput-split

split -l1 $pathNameFileInput /tmp/alearchiver-pathNameFileInput-split/

for a in $(ls /tmp/alearchiver-pathNameFileInput-split/)

do

	leggoA="$(cat /tmp/alearchiver-pathNameFileInput-split/$a)"

echo $leggoA > /tmp/backemerg-fullName

rm -f /tmp/alearchiver-cimiceFolderOrFile-cartella

rm -f /tmp/alearchiver-cimiceFolderOrFile-file

file $leggoA > /tmp/alearchiver-dirOrFile-01

grep "directory" /tmp/alearchiver-dirOrFile-01 > /tmp/alearchiver-dirOrFile-02

stat --format %s /tmp/alearchiver-dirOrFile-02 > /tmp/alearchiver-dirOrFile-03

leggoBytes=$(cat /tmp/alearchiver-dirOrFile-03)

if test $leggoBytes -gt 0

then
	/usr/local/lib/backemerg/trattamentoCartelleValeNetrw.sh

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

if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd $percorsoIsolato

fi


sleep 1

#### testing ok
#echo $PWD
#echo "ho esegito cd $percorsoIsolato"
#read -p "mi sono spostato in /home/mart/test2" EnterNull


if test $pathDestination == "alpha"

then
	## testing ok
	#read -p "sto a riga 210 nel condizionale if test $pathDestination == alpha" EnterNull


	#### sono arrivato qui, devo comprimere [con l'archivio $kind] nella scelta <a> della destinazione

#	kind=1 -> tar
#	kind=2 -> tar.xz
#	kind=3 -> zip

	if test $kind == "1"

	then

		### testing ok cartelle
	#	read -p "sto a riga 208 nel condizionale if test $kind == tar" EnterNull

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -cvf $nomeCartella.tar $nomeCartella

  	        else

                tar -cvf $nomeFileSenzaEstensione.tar $nomeFile
	        
		fi

	fi


	if test $kind == "2"

	then
		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -c $nomeCartella | xz -e4 > $nomeCartella.tar.xz

	        else

	        tar -c $nomeFile | xz -e4 > $nomeFileSenzaEstensione.tar.xz

               fi
	fi

	if test $kind == "3"

	then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then
		
			zip -r $nomeCartella.zip $nomeCartella

		else

			zip -r $nomeFileSenzaEstensione.zip $nomeFile
		fi
	fi

		if test $kind == "4"

	then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then
		
			jar -cfv $nomeCartella.jar $nomeCartella

		else

			jar -cfv $nomeFileSenzaEstensione.jar $nomeFile
		fi
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

read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
$leggoA

:" destPathManuale




	if test $kind == "1"

	then

			if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		            tar -cvf $destPathManuale/$nomeCartella.tar $nomeCartella

		            else

			    tar -cvf $destPathManuale/$nomeFileSenzaEstensione.tar $nomeFile

			fi

	fi

	if test $kind == "2"
	
	then
		
		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -c $nomeCartella | xz -e4 > $destPathManuale/$nomeCartella.tar.xz

	        else
 
                tar -c $nomeFile | xz -e4 > $destPathManuale/$nomeFileSenzaEstensione.tar.xz
	
		fi

	fi

	if test $kind == "3"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

            else

	    zip -r $destPathManuale/$nomeFileSenzaEstensione.zip $nomeFile

	    fi

	fi

		if test $kind == "4"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

            else

	    jar -cfv $destPathManuale/$nomeFileSenzaEstensione.jar $nomeFile

	    fi

	fi


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

			    tar -cvf $destPathManuale/$nomeFileSenzaEstensione.tar $nomeFile

			fi

	fi

	if test $kind == "2"
	
	then
		
		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -c $nomeCartella | xz -e4 > $destPathManuale/$nomeCartella.tar.xz

	        else
 
                tar -c $nomeFile | xz -e4 > $destPathManuale/$nomeFileSenzaEstensione.tar.xz
	
		fi

	fi

	if test $kind == "3"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

            else

	    zip -r $destPathManuale/$nomeFileSenzaEstensione.zip $nomeFile

	    fi

	fi

		if test $kind == "4"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

            else

	    jar -cfv $destPathManuale/$nomeFileSenzaEstensione.jar $nomeFile

	    fi

	fi


done	
#### chiusura di pathDestinarion (riga 197)
fi


if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"


cd ..

fi

done



else 

read -p "Inserisci il percorso e il nome del file o della cartella da comprimere.
:" pathName


echo $pathName > /tmp/backemerg-fullName

rm -f /tmp/alearchiver-cimiceFolderOrFile-cartella

rm -f /tmp/alearchiver-cimiceFolderOrFile-file

file $pathName > /tmp/alearchiver-dirOrFile-01

grep "directory" /tmp/alearchiver-dirOrFile-01 > /tmp/alearchiver-dirOrFile-02

stat --format %s /tmp/alearchiver-dirOrFile-02 > /tmp/alearchiver-dirOrFile-03

leggoBytes=$(cat /tmp/alearchiver-dirOrFile-03)

if test $leggoBytes -gt 0

then
	/usr/local/lib/backemerg/trattamentoCartelleClassic.sh

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

if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd $percorsoIsolato

fi



if test $pathDestination == "alpha"

then

	if test $kind == "1"

	then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -cvf $nomeCartella.tar $nomeCartella

  	        else

                tar -cvf $nomeFileSenzaEstensione.tar $nomeFile
	        
		fi

	fi


	if test $kind == "2"

	then
		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -c $nomeCartella | xz -e4 > $nomeCartella.tar.xz

	        else

	        tar -c $nomeFile | xz -e4 > $nomeFileSenzaEstensione.tar.xz

               fi
	fi

	if test $kind == "3"

	then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then
		
			zip -r $nomeCartella.zip $nomeCartella

		else

			zip -r $nomeFileSenzaEstensione.zip $nomeFile
		fi
	fi

		if test $kind == "4"

	then

		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then
		
			jar -cfv $nomeCartella.jar $nomeCartella

		else

			jar -cfv $nomeFileSenzaEstensione.jar $nomeFile
		fi
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

read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
$leggoA

:" destPathManuale


	if test $kind == "1"

	then

			if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		            tar -cvf $destPathManuale/$nomeCartella.tar $nomeCartella

		            else

			    tar -cvf $destPathManuale/$nomeFileSenzaEstensione.tar $nomeFile

			fi

	fi

	if test $kind == "2"
	
	then
		
		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -c $nomeCartella | xz -e4 > $destPathManuale/$nomeCartella.tar.xz

	        else
 
                tar -c $nomeFile | xz -e4 > $destPathManuale/$nomeFileSenzaEstensione.tar.xz
	
		fi

	fi

	if test $kind == "3"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

            else

	    zip -r $destPathManuale/$nomeFileSenzaEstensione.zip $nomeFile

	    fi

	fi

		if test $kind == "4"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

            else

	    jar -cfv $destPathManuale/$nomeFileSenzaEstensione.jar $nomeFile

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

			    tar -cvf $destPathManuale/$nomeFileSenzaEstensione.tar $nomeFile

			fi

	fi

	if test $kind == "2"
	
	then
		
		if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

		tar -c $nomeCartella | xz -e4 > $destPathManuale/$nomeCartella.tar.xz

	        else
 
                tar -c $nomeFile | xz -e4 > $destPathManuale/$nomeFileSenzaEstensione.tar.xz
	
		fi

	fi

	if test $kind == "3"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

            else

	    zip -r $destPathManuale/$nomeFileSenzaEstensione.zip $nomeFile

	    fi

	fi

		if test $kind == "4"
	
	then

            if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

	    jar -cfv $destPathManuale/$nomeCartella.jar $nomeCartella

            else

	    jar -cfv $destPathManuale/$nomeFileSenzaEstensione.jar $nomeFile

	    fi

	fi


done	
#### chiusura di pathDestinarion (riga 197)
fi


if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd ..

fi


## chiusura tipologiaPathName riga 134
fi

rm -fr /tmp/alearchiver*

rm -fr /tmp/backemerg*

exit


