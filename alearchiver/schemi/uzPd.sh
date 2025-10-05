#!/bin/bash

echo $PWD > /tmp/backemerg-posnow

posnow=$(cat /tmp/backemerg-posnow)


destPathManuale="$(cat /tmp/backemergOptionD)"


pathName="$(cat /tmp/backemergNTarget)"

clear

	echo
	echo

	grep "^-s$" /tmp/alearchiver-options > /tmp/alearchiverS

	stat --format %s /tmp/alearchiverS > /tmp/alearchiverSBytes

	leggoBytes=$(cat /tmp/alearchiverSBytes)

if test $leggoBytes -gt 0

then

	echo "Digita la password per decifrare"

	read -s Password

else
	
	read -p "Digita la password per decifrare
" Password

fi

echo $pathName > /tmp/backemerg-fullName

/usr/local/lib/backemerg/trattamentoFiles.sh

leggoFileIsolato="$(cat /tmp/backemerg-nomeFileIsolato)"

## questo mi serve per togliere l'estensione
echo "$leggoFileIsolato" > /tmp/alearchiver-fileIsolatoSenzaEstensione

#leggoEstensione="$(cat /tmp/backemerg-estensione)"


	percorsoIsolato="$(cat /tmp/backemerg-percorsoIsolato)"

	cd $percorsoIsolato


file $pathName > /tmp/alearchiver-detectEstensione01

### Estensione
cat /tmp/alearchiver-detectEstensione01 | cut -d: -f2,2 > /tmp/alearchiver-detectEstensione02


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

		unzip -P $Password $leggoFileIsolato -d $destPathManuale
	
		Password="000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
	
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

		cd $posnow

	fi



	cd $posnow

grep "^-remove$" /tmp/alearchiver-options > /tmp/alearchiver-optionsRemove

stat --format %s /tmp/alearchiver-optionsRemove > /tmp/alearchiver-optionsRemoveBytes

leggoBytes=$(cat /tmp/alearchiver-optionsRemoveBytes)

if test $leggoBytes -gt 0

then
	        
	sudo rm $percorsoIsolato/$leggoFileIsolato

fi

exit

