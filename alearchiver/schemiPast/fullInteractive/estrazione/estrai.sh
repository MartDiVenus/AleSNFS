#!/bin/bash


rm -fr /tmp/Alearchiver 

mkdir /tmp/Alearchiver


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


read -p "I formati supportati sono: 
rar, tar, tar.xz, zip, jar.

Per qualsiasi formato, i file compressi che originari sono cartelle,
verranno estratti con la custodia.


I file compressi devono avere il permesso in lettura almeno per l'utente $USER.






Scegli il percorso di destinazione del file estratto:


alpha) la stesso del relativo file compresso;



beta) esprimi un nuovo percorso;



gamma) usa comodamente i percorsi specificati in
       /tmp/tmp/valeNetrw-DMarked



delta) /tmp/Alearchiver    
       [consigliato per la \"sola lettura\" e per non impegnare il disco].



Digita <<alpha>> o <<beta>> o <<gamma>> o <<delta>>, e premi Enter.

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

read -p "Scegli come esprimere il percorso e il nome del/i file da estrarre:

a) da file, eseguendo tale istanza alearchiver una sola volta.
	Il file deve contenere gli elementi da estrarre uno per riga.
       	e.g. 
	fornire il file /tmp/valeNetrw-SMarked 
	contenente gli elementi selezionati (remarked) con Vale-netrw,
       	è un'ottima scelta perché veloce, comoda, sicura.
       
b) manualmente eseguendo tale istanza alearchiver per ogni elemento da estrarre.

:" tipologiaPathName

if test $tipologiaPathName == "a"

then


read -p "Inserisci il percorso e il nome del file contenente gli elementi, 
uno per riga, da estrarre.

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



/usr/local/lib/backemerg/trattamentoFiles.sh

leggoFileIsolato="$(cat /tmp/backemerg-nomeFileIsolato)"

## questo mi serve per togliere l'estensione
echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione


#leggoEstensione="$(cat /tmp/backemerg-estensione)"

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

	cd $percorsoIsolato
fi


file $leggoA > /tmp/alearchiver-detectEstensione01

### Estensione
cat /tmp/alearchiver-detectEstensione01 | cut -d: -f2,2 > /tmp/alearchiver-detectEstensione02


if test $pathDestination == "alpha"

then

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

		#unzip $leggoFileIsolato -d $leggoFileIsolatoSenzaEstensione

                unzip $leggoFileIsolato 
	fi

	### Caso rar
	grep "RAR" /tmp/alearchiver-detectEstensione02 > /tmp/alearchiver-detectEstensione03

        stat --format %s /tmp/alearchiver-detectEstensione03 > /tmp/alearchiver-detectEstensioneBytes
	
	leggoBytes=$(cat /tmp/alearchiver-detectEstensioneBytes)

        if test $leggoBytes -gt 0

	then
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
read -p "Digita, senza la </> finale, il percorso di destinazione del file estratto
$leggoA

:" destPathManuale


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

		mkdir $destPathManuale/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d $destPathManuale/$leggoFileIsolatoSenzaEstensione

	## senza custodia
	#	unrar x $leggoFileIsolato -d $destPathManuale
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

	## senza custodia
	#	unrar x $leggoFileIsolato -d $destPathManuale

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
		vi -c ":%s/\.rar//" /tmp/alearchiver-fileIsolatoSenzaEstensione -c :w -c :q

		leggoFileIsolatoSenzaEstensione="$(cat /tmp/alearchiver-fileIsolatoSenzaEstensione)"

		mkdir /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione

		unrar x $leggoFileIsolato -d /tmp/Alearchiver/$leggoFileIsolatoSenzaEstensione

		## senza custodia
		# unrar x $leggoFileIsolato -d /tmp/alearchiver
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


fi

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..
fi

done



else 

read -p "Inserisci il percorso e il nome del file da estrarre.

:" pathName


echo $pathName > /tmp/backemerg-fullName

/usr/local/lib/backemerg/trattamentoFiles.sh

leggoFileIsolato="$(cat /tmp/backemerg-nomeFileIsolato)"

## questo mi serve per togliere l'estensione
echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

#leggoEstensione="$(cat /tmp/backemerg-estensione)"

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

	cd $percorsoIsolato
fi

file $pathName > /tmp/alearchiver-detectEstensione01

### Estensione
cat /tmp/alearchiver-detectEstensione01 | cut -d: -f2,2 > /tmp/alearchiver-detectEstensione02


if test $pathDestination == "alpha"

then

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
	
		jar -xvf $pathName

	fi

if [ -f /tmp/backemerg-percorsoIsolato ]; then

	cd ..
fi

fi



if test $pathDestination == "beta"

then

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

### sono arrivato qui

## tar -C /home/mart/test2 -xvf importFigure.tar
## tar -C $destPathManuale -xvf $leggoFileIsolato
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


rm -fr /tmp/alearchiver*

rm -fr /tmp/backemerg*


exit


