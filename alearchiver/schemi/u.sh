#!/bin/bash

################################

grep "*" /tmp/backemergNTarget > /tmp/alearchiverOneOrWildcard

stat --format %s /tmp/alearchiverOneOrWildcard > /tmp/alearchiverOneOrWildcardBytes

leggoBytes=$(cat /tmp/alearchiverOneOrWildcardBytes)

#### I if
if test ! $leggoBytes -gt 0

then

################################ INIZIO PARTE PRE OTTOBRE
rm -fr /tmp/Alearchiver 

mkdir /tmp/Alearchiver

rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

vim -c ":runtime! vimScript/backemerg/alearchiver/u/U01.vim" -c ":cal U01#U01()" /tmp/backemergRuffiano -c :q

pathDestination="$(cat /tmp/backemergVimInputU01)"

#read -p "I formati supportati sono: 
#rar, tar, tar.xz, zip.

#Per qualsiasi formato, i file compressi che originari sono cartelle,
#verranno estratti con la custodia.


#I file compressi devono avere il permesso in lettura almeno per l'utente $USER.


#Scegli il percorso di destinazione del file estratto:


#alpha) la stesso del relativo file compresso;



#beta) esprimi un nuovo percorso;



#gamma) usa comodamente i percorsi specificati in
      # /tmp/tmp/valeNetrw-DMarked



#delta) /tmp/Alearchiver    
       #[consigliato per la \"sola lettura\" e per non impegnare il disco].



#Digita <<alpha>> o <<beta>> o <<gamma>> o <<delta>>, e premi Enter.

#:" pathDestination

### annullato a ottobre leggoNTarget=$(cat /tmp/backemergNTarget)

pathName="$(cat /tmp/backemergNTarget)"

echo $pathName > /tmp/backemerg-fullName


### annullato a ottobre pathName="$(cat /tmp/backemergPseudoOptions/$leggoNTarget)"

/usr/local/lib/backemerg/trattamentoFiles.sh

leggoFileIsolato="$(cat /tmp/backemerg-nomeFileIsolato)"

## questo mi serve per togliere l'estensione
echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

#leggoEstensione="$(cat /tmp/backemerg-estensione)"

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

fi


file $pathName > /tmp/alearchiver-detectEstensione01

### Estensione
cat /tmp/alearchiver-detectEstensione01 | cut -d: -f2,2 > /tmp/alearchiver-detectEstensione02


if test $pathDestination == "alpha"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

	# testing o ok
	#read -p "dovrei essere in $PWD pari a $percorsoIsolato" EnterNull

fi

	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

	#	unzip $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione

	        unzip $leggoFileIsolato
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir $leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
	
		jar -xvf $leggoFileIsolato

	fi


if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi



if test $pathDestination == "beta"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi

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


echo "Digita, senza la </> finale, il percorso di destinazione del file estratto
$leggoA

" > /usr/local/lib/backemerg/alearchiver/echoLines/u/u02.txt

vim -c ":runtime! vimScript/backemerg/alearchiver/u/U02.vim" -c ":cal U02#U02()" /tmp/backemergRuffiano -c :q

destPathManuale="$(cat /tmp/backemergVimInputU02)"

#read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
#$leggoA
#
#:" destPathManuale

	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -C $destPathManuale -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C $destPathManuale -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d $destPathManuale
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd $destPathManuale
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi



if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi


if test $pathDestination == "gamma"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi


rm -fr /tmp/alearchiverSplitDMarked

mkdir /tmp/alearchiverSplitDMarked

split -l1 /tmp/valeNetrw-DMarked /tmp/alearchiverSplitDMarked/

for b in $(ls /tmp/alearchiverSplitDMarked)

do

destPathManuale="$(cat /tmp/alearchiverSplitDMarked/$b)"


	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

        tar -C $destPathManuale -xvf $leggoFileIsolato
	
	fi

	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C $destPathManuale -xvf $leggoFileIsolato 
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then

		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d $destPathManuale	
	fi


	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		#### Dato che in /tmp/valeNetrw-DMarked stampo le directory con la </> finale,
		### comparirà la doppia </> tra $destPathManuale e $leggoFileIsolato
		### ma non fa niente. Non elimino la </> di sotto, nel caso in cui un giorno
		### volessi eliminare la </> finale in /tmp/valeNetrw-DMarked per altri motivi
		### [non legati a tale codice che ripeto non subisce alcun disturbo dalla 
		### doppia </>].
		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione
	fi

	### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd $destPathManuale
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi

done

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi


if test $pathDestination == "delta"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi

### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -C /tmp/Alearchiver -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C /tmp/Alearchiver -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d /tmp/Alearchiver
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd /tmp/Alearchiver/
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi



### Verifico se /tmp/Alearchiver (istanza delta) sia vuota
ls -l /tmp/Alearchiver | tail -n1 > /tmp/alearchiver-delEmpty

## è importante tail -n1 perché se fossero presenti altre cartelle [anche non vuote ma con file non vuoti]
## sotto la madre /tmp/Alearchiver, la madre risulterebbe ancora con <totale 0>;
## la madre non risulta con <totale 0> solo se conteniene file [anche vuoti].
grep "totale 0" /tmp/alearchiver-delEmpty > /tmp/alearchiver-delEmptyGrepped

stat --format %s /tmp/alearchiver-delEmptyGrepped > /tmp/alearchiver-delEmptyBytes

leggoBytes=$(cat /tmp/alearchiver-delEmptyBytes)

if test $leggoBytes -gt 0

then
	rm -r /tmp/Alearchiver
fi


################################################### FINE PARTE PRE OTTOBRE

else


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
read -p "Vuoi estrarre $pathName
Premi Enter per continuare" EnterNull
## ottobre inizio I parte: file selezionati con *. 	e.g. *.pdf OK vedi riga 871 alearchiver
rm -fr /tmp/Alearchiver 

mkdir /tmp/Alearchiver

rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

vim -c ":runtime! vimScript/backemerg/alearchiver/u/U01.vim" -c ":cal U01#U01()" /tmp/backemergRuffiano -c :q

pathDestination="$(cat /tmp/backemergVimInputU01)"


echo $pathName > /tmp/backemerg-fullName
############################ ripeto pre ottobre modificato in nuovo ottobre

/usr/local/lib/backemerg/trattamentoFiles.sh

leggoFileIsolato="$(cat /tmp/backemerg-nomeFileIsolato)"

## questo mi serve per togliere l'estensione
echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

#leggoEstensione="$(cat /tmp/backemerg-estensione)"

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

fi


file $pathName > /tmp/alearchiver-detectEstensione01

### Estensione
cat /tmp/alearchiver-detectEstensione01 | cut -d: -f2,2 > /tmp/alearchiver-detectEstensione02


if test $pathDestination == "alpha"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

	# testing o ok
	#read -p "dovrei essere in $PWD pari a $percorsoIsolato" EnterNull

fi

	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

	#	unzip $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione

	        unzip $leggoFileIsolato
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir $leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
	
		jar -xvf $leggoFileIsolato

	fi


if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi



if test $pathDestination == "beta"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi

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


echo "Digita, senza la </> finale, il percorso di destinazione del file estratto
$leggoA

" > /usr/local/lib/backemerg/alearchiver/echoLines/u/u02.txt

vim -c ":runtime! vimScript/backemerg/alearchiver/u/U02.vim" -c ":cal U02#U02()" /tmp/backemergRuffiano -c :q

destPathManuale="$(cat /tmp/backemergVimInputU02)"

#read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
#$leggoA
#
#:" destPathManuale

	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -C $destPathManuale -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C $destPathManuale -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d $destPathManuale
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd $destPathManuale
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi



if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi


if test $pathDestination == "gamma"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi


rm -fr /tmp/alearchiverSplitDMarked

mkdir /tmp/alearchiverSplitDMarked

split -l1 /tmp/valeNetrw-DMarked /tmp/alearchiverSplitDMarked/

for b in $(ls /tmp/alearchiverSplitDMarked)

do

destPathManuale="$(cat /tmp/alearchiverSplitDMarked/$b)"


	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

        tar -C $destPathManuale -xvf $leggoFileIsolato
	
	fi

	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C $destPathManuale -xvf $leggoFileIsolato 
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then

		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d $destPathManuale	
	fi


	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		#### Dato che in /tmp/valeNetrw-DMarked stampo le directory con la </> finale,
		### comparirà la doppia </> tra $destPathManuale e $leggoFileIsolato
		### ma non fa niente. Non elimino la </> di sotto, nel caso in cui un giorno
		### volessi eliminare la </> finale in /tmp/valeNetrw-DMarked per altri motivi
		### [non legati a tale codice che ripeto non subisce alcun disturbo dalla 
		### doppia </>].
		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione
	fi

	### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd $destPathManuale
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi

done

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi


if test $pathDestination == "delta"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi

### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -C /tmp/Alearchiver -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C /tmp/Alearchiver -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d /tmp/Alearchiver
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd /tmp/Alearchiver/
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi



### Verifico se /tmp/Alearchiver (istanza delta) sia vuota
ls -l /tmp/Alearchiver | tail -n1 > /tmp/alearchiver-delEmpty

## è importante tail -n1 perché se fossero presenti altre cartelle [anche non vuote ma con file non vuoti]
## sotto la madre /tmp/Alearchiver, la madre risulterebbe ancora con <totale 0>;
## la madre non risulta con <totale 0> solo se conteniene file [anche vuoti].
grep "totale 0" /tmp/alearchiver-delEmpty > /tmp/alearchiver-delEmptyGrepped

stat --format %s /tmp/alearchiver-delEmptyGrepped > /tmp/alearchiver-delEmptyBytes

leggoBytes=$(cat /tmp/alearchiver-delEmptyBytes)

if test $leggoBytes -gt 0

then
	rm -r /tmp/Alearchiver
fi


#### chiudo il done di *.
done

else
	
#### ultimo caso di *
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
read -p "Vuoi estrarre $pathName
Premi Enter per continuare" EnterNull
## ottobre inizio I parte: file selezionati con *. 	e.g. *.pdf OK vedi riga 871 alearchiver
rm -fr /tmp/Alearchiver 

mkdir /tmp/Alearchiver

rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

vim -c ":runtime! vimScript/backemerg/alearchiver/u/U01.vim" -c ":cal U01#U01()" /tmp/backemergRuffiano -c :q

pathDestination="$(cat /tmp/backemergVimInputU01)"
		

echo $pathName > /tmp/backemerg-fullName


### annullato a ottobre pathName="$(cat /tmp/backemergPseudoOptions/$leggoNTarget)"

/usr/local/lib/backemerg/trattamentoFiles.sh

leggoFileIsolato="$(cat /tmp/backemerg-nomeFileIsolato)"

## questo mi serve per togliere l'estensione
echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

#leggoEstensione="$(cat /tmp/backemerg-estensione)"

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

fi


file $pathName > /tmp/alearchiver-detectEstensione01

### Estensione
cat /tmp/alearchiver-detectEstensione01 | cut -d: -f2,2 > /tmp/alearchiver-detectEstensione02


if test $pathDestination == "alpha"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

	# testing o ok
	#read -p "dovrei essere in $PWD pari a $percorsoIsolato" EnterNull

fi

	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

	#	unzip $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione

	        unzip $leggoFileIsolato
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir $leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
	
		jar -xvf $leggoFileIsolato

	fi


if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi



if test $pathDestination == "beta"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi

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


echo "Digita, senza la </> finale, il percorso di destinazione del file estratto
$leggoA

" > /usr/local/lib/backemerg/alearchiver/echoLines/u/u02.txt

vim -c ":runtime! vimScript/backemerg/alearchiver/u/U02.vim" -c ":cal U02#U02()" /tmp/backemergRuffiano -c :q

destPathManuale="$(cat /tmp/backemergVimInputU02)"

#read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
#$leggoA
#
#:" destPathManuale

	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -C $destPathManuale -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C $destPathManuale -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d $destPathManuale
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd $destPathManuale
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi



if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi


if test $pathDestination == "gamma"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi


rm -fr /tmp/alearchiverSplitDMarked

mkdir /tmp/alearchiverSplitDMarked

split -l1 /tmp/valeNetrw-DMarked /tmp/alearchiverSplitDMarked/

for b in $(ls /tmp/alearchiverSplitDMarked)

do

destPathManuale="$(cat /tmp/alearchiverSplitDMarked/$b)"


	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

        tar -C $destPathManuale -xvf $leggoFileIsolato
	
	fi

	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C $destPathManuale -xvf $leggoFileIsolato 
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then

		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d $destPathManuale	
	fi


	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		#### Dato che in /tmp/valeNetrw-DMarked stampo le directory con la </> finale,
		### comparirà la doppia </> tra $destPathManuale e $leggoFileIsolato
		### ma non fa niente. Non elimino la </> di sotto, nel caso in cui un giorno
		### volessi eliminare la </> finale in /tmp/valeNetrw-DMarked per altri motivi
		### [non legati a tale codice che ripeto non subisce alcun disturbo dalla 
		### doppia </>].
		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione
	fi

	### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd $destPathManuale
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi

done

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi


if test $pathDestination == "delta"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi

### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -C /tmp/Alearchiver -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C /tmp/Alearchiver -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d /tmp/Alearchiver
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd /tmp/Alearchiver/
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi



### Verifico se /tmp/Alearchiver (istanza delta) sia vuota
ls -l /tmp/Alearchiver | tail -n1 > /tmp/alearchiver-delEmpty

## è importante tail -n1 perché se fossero presenti altre cartelle [anche non vuote ma con file non vuoti]
## sotto la madre /tmp/Alearchiver, la madre risulterebbe ancora con <totale 0>;
## la madre non risulta con <totale 0> solo se conteniene file [anche vuoti].
grep "totale 0" /tmp/alearchiver-delEmpty > /tmp/alearchiver-delEmptyGrepped

stat --format %s /tmp/alearchiver-delEmptyGrepped > /tmp/alearchiver-delEmptyBytes

leggoBytes=$(cat /tmp/alearchiver-delEmptyBytes)

if test $leggoBytes -gt 0

then
	rm -r /tmp/Alearchiver
fi

done

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


		###### fine passata

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
read -p "Vuoi estrarre $pathName
Premi Enter per continuare" EnterNull
## ottobre inizio I parte: file selezionati con *. 	e.g. *.pdf OK vedi riga 871 alearchiver
rm -fr /tmp/Alearchiver 

mkdir /tmp/Alearchiver

rm -f /tmp/backemergRuffiano

touch /tmp/backemergRuffiano

vim -c ":runtime! vimScript/backemerg/alearchiver/u/U01.vim" -c ":cal U01#U01()" /tmp/backemergRuffiano -c :q

pathDestination="$(cat /tmp/backemergVimInputU01)"
		

echo $pathName > /tmp/backemerg-fullName


### annullato a ottobre pathName="$(cat /tmp/backemergPseudoOptions/$leggoNTarget)"

/usr/local/lib/backemerg/trattamentoFiles.sh

leggoFileIsolato="$(cat /tmp/backemerg-nomeFileIsolato)"

## questo mi serve per togliere l'estensione
echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

#leggoEstensione="$(cat /tmp/backemerg-estensione)"

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

fi


file $pathName > /tmp/alearchiver-detectEstensione01

### Estensione
cat /tmp/alearchiver-detectEstensione01 | cut -d: -f2,2 > /tmp/alearchiver-detectEstensione02


if test $pathDestination == "alpha"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

	# testing o ok
	#read -p "dovrei essere in $PWD pari a $percorsoIsolato" EnterNull

fi

	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

	#	unzip $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione

	        unzip $leggoFileIsolato
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir $leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
	
		jar -xvf $leggoFileIsolato

	fi


if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi



if test $pathDestination == "beta"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi

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


echo "Digita, senza la </> finale, il percorso di destinazione del file estratto
$leggoA

" > /usr/local/lib/backemerg/alearchiver/echoLines/u/u02.txt

vim -c ":runtime! vimScript/backemerg/alearchiver/u/U02.vim" -c ":cal U02#U02()" /tmp/backemergRuffiano -c :q

destPathManuale="$(cat /tmp/backemergVimInputU02)"

#read -p "Digita, senza la </> finale, il percorso di destinazione del file compresso
#$leggoA
#
#:" destPathManuale

	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -C $destPathManuale -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C $destPathManuale -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d $destPathManuale
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd $destPathManuale
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi



if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi


if test $pathDestination == "gamma"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi


rm -fr /tmp/alearchiverSplitDMarked

mkdir /tmp/alearchiverSplitDMarked

split -l1 /tmp/valeNetrw-DMarked /tmp/alearchiverSplitDMarked/

for b in $(ls /tmp/alearchiverSplitDMarked)

do

destPathManuale="$(cat /tmp/alearchiverSplitDMarked/$b)"


	### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

        tar -C $destPathManuale -xvf $leggoFileIsolato
	
	fi

	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C $destPathManuale -xvf $leggoFileIsolato 
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then

		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d $destPathManuale	
	fi


	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		#### Dato che in /tmp/valeNetrw-DMarked stampo le directory con la </> finale,
		### comparirà la doppia </> tra $destPathManuale e $leggoFileIsolato
		### ma non fa niente. Non elimino la </> di sotto, nel caso in cui un giorno
		### volessi eliminare la </> finale in /tmp/valeNetrw-DMarked per altri motivi
		### [non legati a tale codice che ripeto non subisce alcun disturbo dalla 
		### doppia </>].
		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione
	fi

	### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd $destPathManuale
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi

done

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi


if test $pathDestination == "delta"

then

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd $percorsoIsolato

fi

### Caso tar
	grep "tar" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then
		tar -C /tmp/Alearchiver -xvf $leggoFileIsolato
	fi


	### Caso tar.xz
	grep "XZ" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

	if test $leggoBytes -gt 0

	then

		tar -C /tmp/Alearchiver -xvf $leggoFileIsolato
	fi

	### Caso zip
	grep "Zip" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
               
		vi -c ":%s/\.zip//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		unzip $leggoFileIsolato -d /tmp/Alearchiver
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione
	fi

		### Caso jar
	grep "JAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
		cd /tmp/Alearchiver/
	
		jar -xvf $leggoFileIsolato

		cd ..

	fi

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..

fi

fi



### Verifico se /tmp/Alearchiver (istanza delta) sia vuota
ls -l /tmp/Alearchiver | tail -n1 > /tmp/alearchiver-delEmpty

## è importante tail -n1 perché se fossero presenti altre cartelle [anche non vuote ma con file non vuoti]
## sotto la madre /tmp/Alearchiver, la madre risulterebbe ancora con <totale 0>;
## la madre non risulta con <totale 0> solo se conteniene file [anche vuoti].
grep "totale 0" /tmp/alearchiver-delEmpty > /tmp/alearchiver-delEmptyGrepped

stat --format %s /tmp/alearchiver-delEmptyGrepped > /tmp/alearchiver-delEmptyBytes

leggoBytes=$(cat /tmp/alearchiver-delEmptyBytes)

if test $leggoBytes -gt 0

then
	rm -r /tmp/Alearchiver
fi

done


fi

fi

fi




exit

