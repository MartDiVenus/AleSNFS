#!/bin/bash

## ok testato anche con *, *.xxx, y*
rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

destPathManuale="$(cat /tmp/backemergOptionD)"

leggoNTarget=$(cat /tmp/backemergNTarget)

grep "*" /tmp/backemergNTarget > /tmp/alearchiverOneOrWildcard

stat --format %s /tmp/alearchiverOneOrWildcard > /tmp/alearchiverOneOrWildcardBytes

leggoBytes=$(cat /tmp/alearchiverOneOrWildcardBytes)

#### I if
if test ! $leggoBytes -gt 0

then

pathName="$(cat /tmp/backemergNTarget)"

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

nomeFileSenzaEstensione="$(cat /tmp/backemerg-nomeSenzaEstensione)"
fi

## mi sposto nel percorso, altrimenti avrei tutta struttura ricorsivamente riprodotta 
# nel file compresso, e risulterebbe assai noioso.

if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd $percorsoIsolato

fi


sleep 1

if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

    else

    zip -r $destPathManuale/$nomeFileSenzaEstensione.zip $nomeFile

fi

	cd ..


else

## ottobre inizio I parte: file selezionati con *. 	e.g. *.pdf OK vedi riga 871 alearchiver

grep "*\." /tmp/backemergNTarget > /tmp/alearchiverOneOrWildcardDot

stat --format %s /tmp/alearchiverOneOrWildcardDot > /tmp/alearchiverOneOrWildcardDotBytes

leggoBytes=$(cat /tmp/alearchiverOneOrWildcardDotBytes)

## II if 
if test $leggoBytes -gt 0

then

cp /tmp/backemergNTarget /tmp/alearchiverTargetFile

cat /tmp/alearchiverTargetFile | sed 's/*.*//g' > /tmp/alearchiverOneOrWildcardDotFolder

leggoWildcardDotFolder="$(cat /tmp/alearchiverOneOrWildcardDotFolder)"


cat /tmp/alearchiverTargetFile | sed 's/$leggoWildcardDotFolder//g' > /tmp/alearchiverTargetFileIsolato

cat /tmp/alearchiverTargetFileIsolato | cut -d. -f2,2 > /tmp/alearchiverOneOrWildcardEstensione

leggoEstensione="$(cat /tmp/alearchiverOneOrWildcardEstensione)"

stat --format %s /tmp/alearchiverOneOrWildcardDotFolder > /tmp/alearchiverOneOrWildcardDotFolderBytes

leggoBytes=$(cat /tmp/alearchiverOneOrWildcardDotFolderBytes)

if test $leggoBytes -gt 1

then

ls $leggoWildcardDotFolder*.$leggoEstensione > /tmp/alearchiverOneOrWildcardDotList

else

ls *.$leggoEstensione > /tmp/alearchiverOneOrWildcardDotList

fi

rm -fr /tmp/alearchiverOneOrWildcardDotSplit

mkdir /tmp/alearchiverOneOrWildcardDotSplit

split -l1 /tmp/alearchiverOneOrWildcardDotList /tmp/alearchiverOneOrWildcardDotSplit/


for c in $(ls /tmp/alearchiverOneOrWildcardDotSplit)

	## I do
do

pathName="$(cat /tmp/alearchiverOneOrWildcardDotSplit/$c)"

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

nomeFileSenzaEstensione="$(cat /tmp/backemerg-nomeSenzaEstensione)"
fi

## mi sposto nel percorso, altrimenti avrei tutta struttura ricorsivamente riprodotta 
# nel file compresso, e risulterebbe assai noioso.

if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd $percorsoIsolato

fi


sleep 1

if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

    else

    zip -r $destPathManuale/$nomeFileSenzaEstensione.zip $nomeFile

fi

	cd ..

done


else

	cp /tmp/backemergNTarget /tmp/backemerg-fullNameBackup

	## deo sostituire <*> con <specialDirindindin>  perché awk non legge le linee
        # che iniziano con <*>.	
	cat /tmp/backemergNTarget | sed 's/*/specialDirindindin/g' > /tmp/backemerg-fullName

        /usr/local/lib/backemerg/trattamentoFiles.sh

	## devo capire se la chiave di selezione è * o e.g. *a
	
	leggoNomeFileIsolato0="$(cat /tmp/backemerg-nomeFileIsolato)"

	cat /tmp/backemerg-nomeFileIsolato | sed 's/specialDirindindin/*/g' > /tmp/backemerg-nomeFileIsolatoWild

	leggoNomeFileIsolato="$(cat /tmp/backemerg-nomeFileIsolatoWild)"

	## questo mi serve se ho e.g. *a, visto che se avessi solo * esiste
	# un espediente [cat /tmp/alearchiverOneOrWildcard | sed 's/*//g' > /tmp/alearchiverOneOrWildcardFolder]
	# che propongo solo per variare il codice, senza rifarmi 
	# sempre a trattamentoFiles.

	if test "$leggoNomeFileIsolato" == "*"

	then
        ## file selezionati solo con *  
	cat /tmp/alearchiverOneOrWildcard | sed 's/*//g' > /tmp/alearchiverOneOrWildcardFolder

	leggoWildcardFolder="$(cat /tmp/alearchiverOneOrWildcardFolder)"

	ls $leggoWildcardFolder > /tmp/alearchiverOneOrWildcardList

	rm -fr /tmp/alearchiverOneOrWildcardSplit

	mkdir /tmp/alearchiverOneOrWildcardSplit

	split -l1 /tmp/alearchiverOneOrWildcardList /tmp/alearchiverOneOrWildcardSplit/

	for c in $(ls /tmp/alearchiverOneOrWildcardSplit)

	do
		
		leggoC="$(cat /tmp/alearchiverOneOrWildcardSplit/$c)"

		pathName="$leggoWildcardFolder$leggoC"

###  ottobre III parte: devo chiudere con fi

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

nomeFileSenzaEstensione="$(cat /tmp/backemerg-nomeSenzaEstensione)"
fi

## mi sposto nel percorso, altrimenti avrei tutta struttura ricorsivamente riprodotta 
# nel file compresso, e risulterebbe assai noioso.

if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd $percorsoIsolato

fi


sleep 1

if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

    else

    zip -r $destPathManuale/$nomeFileSenzaEstensione.zip $nomeFile

fi

	cd ..

done

## quinta parte ottobre ricerca e.g. a*
else

	## Questa variabile $path mi serve se ho e.g. *a, visto che se avessi solo * esiste
	# un espediente [cat /tmp/alearchiverOneOrWildcard | sed 's/*//g' > /tmp/alearchiverOneOrWildcardFolder]
	# che propongo solo per variare il codice, senza rifarmi 
	# sempre a trattamentoFiles.

	if [ -f /tmp/backemerg-percorsoIsolato ]; then

		path="$(cat /tmp/backemerg-percorsoIsolato)"

		ls $path/$leggoNomeFileIsolato > /tmp/alearchiverOneOrWildcardList0

	else

	ls $leggoNomeFileIsolato > /tmp/alearchiverOneOrWildcardList0
	
	fi

	## ls con bla*, se esistono cartelle --- 
	# crea i due pti. a dx delle cartelle, e una linea vuota tra file e cartelle.
	cat /tmp/alearchiverOneOrWildcardList0 | sed 's/://g' | sed '/^$/d' > /tmp/alearchiverOneOrWildcardList

	rm -fr /tmp/alearchiverOneOrWildcardSplit

	mkdir /tmp/alearchiverOneOrWildcardSplit

	split -l1 /tmp/alearchiverOneOrWildcardList /tmp/alearchiverOneOrWildcardSplit/

	for c in $(ls /tmp/alearchiverOneOrWildcardSplit)

	do
		
		leggoC="$(cat /tmp/alearchiverOneOrWildcardSplit/$c)"

		pathName="$leggoWildcardFolder$leggoC"


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

nomeFileSenzaEstensione="$(cat /tmp/backemerg-nomeSenzaEstensione)"
fi

## mi sposto nel percorso, altrimenti avrei tutta struttura ricorsivamente riprodotta 
# nel file compresso, e risulterebbe assai noioso.

if [ -f /tmp/backemerg-percorsoIsolato ]; then

percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

cd $percorsoIsolato

fi


sleep 1


if [ -f /tmp/alearchiver-cimiceFolderOrFile-cartella ]; then

    zip -r $destPathManuale/$nomeCartella.zip $nomeCartella

    else

    zip -r $destPathManuale/$nomeFileSenzaEstensione.zip $nomeFile

fi

	cd ..

done

fi

fi

fi





exit



