#!/bin/bash

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

leggoNTarget=$(cat /tmp/backemergNTarget)

pathName="$(cat /tmp/backemergPseudoOptions/$leggoNTarget)"

echo $pathName > /tmp/backemerg-fullName

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
	
		jar -xvf $leggoA

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
	
		jar -xvf $leggoA

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
	
		jar -xvf $leggoA

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
	
		jar -xvf $leggoA

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

exit

