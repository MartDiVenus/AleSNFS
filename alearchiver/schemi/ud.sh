#!/bin/bash

echo $PWD > /tmp/backemerg-posnow

posnow=$(cat /tmp/backemerg-posnow)


destPathManuale="$(cat /tmp/backemergOptionD)"


pathName="$(cat /tmp/backemergNTarget)"

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

		cd $posnow

	fi



	cd $posnow

grep "^-remove$" /tmp/alearchiver-options > /tmp/alearchiver-optionsRemove

stat --format %s /tmp/alearchiver-optionsRemove > /tmp/alearchiver-optionsRemoveBytes

leggoBytes=$(cat /tmp/alearchiver-optionsRemoveBytes)

if test $leggoBytes -gt 0

then

#read -p "testing 134
#sudo rm \$percorsoIsolato/\$leggoFileIsolato
#sudo rm $percorsoIsolato/$leggoFileIsolato
#" EnterNull

# Non posso usare
# ~$> sudo rm -r $pathName
# in quanto se avessi fornito --f=*
# allora avrei
# ~$> sudo rm *
# e non andrebbe bene se ci fossero file non compressi nella stessa cartella
# del file compresso da decomprimere, perché verrebbero eliminati (grave).
#
	sudo rm $percorsoIsolato/$leggoFileIsolato

fi

exit

