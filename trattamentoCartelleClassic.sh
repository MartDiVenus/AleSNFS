#!/bin/bash

cp /tmp/backemerg-fullName /tmp/backemerg-fullNameBackup


cat /tmp/backemerg-fullNameBackup | sed 's/\// /g' > /tmp/backemerg-sostSlashBlank

sed 's/[^ ]//g' /tmp/backemerg-sostSlashBlank | awk '{ print length }' > /tmp/backemerg-colC.txt

numberOfColumn=$(cat /tmp/backemerg-colC.txt)

sed 's/[^/]//g' /tmp/backemerg-fullName | awk '{ print length }' > /tmp/backemerg-countSlash


leggoCountSlash=$(cat /tmp/backemerg-countSlash)


#read -p "18 testing" EnterNull

if test $leggoCountSlash == 0

then

cat /tmp/backemerg-fullNameBackup  > /tmp/backemerg-nomeCartellaIsolata

# testing
#echo " "
#echo "nome cartella isolata"
#cat /tmp/backemerg-nomeCartellaIsolata

#read -p "43 testing" EnterNull



echo "$PWD" > /tmp/backemerg-percorsoIsolato

else

if test $leggoCountSlash == 1

then


# dopo l'ultima /
# selezione il nome del file
cat /tmp/backemerg-fullNameBackup |sed 's/.*\///' > /tmp/backemerg-nomeCartellaIsolata
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/backemerg-nomeCartellaIsolata


#read -p "testing 80" EnterNull



### Percorso isolato


## prima dell'ultima / non funziona in caso di più /, quindi ricorro al nome del file
# cat /tmp/backemerg-fullNameBackup |sed 's/\/.*//' > /tmp/backemerg-percorsoIsolato


## esprimendo il nome del file non funziona in caso di omonimia tra nome file e una cartella,
# e.g. prova/prova
# seleziono il percorso privo del nome del file
# nomeFile="$(cat /tmp/backemerg-nomeCartellaIsolata)"
## l'ultimo sed elimina l'ultima /, comodo per esprimere la variabile $pathIsolato in codici esterni
## isolandola da ciò che viene a dx, e.g. $pathIsolato/prova.txt
#cat /tmp/backemerg-fullNameBackup  |sed 's/'$nomeFile'.*//'  | sed 's/\/$//g' > /tmp/backemerg-percorsoIsolato


## devo capire se ho 
# e.g. a/b
# ho una slash e due colonne
# o e.g. /a
# ho una slash  1 colonna


## se eliminando il primo carattere, il numero di colonne cambia significa che lo spazio
# è all'inizio del file, quindi che il percorso è la radice del file system

cp /tmp/backemerg-sostSlashBlank /tmp/backemerg-sostSlashBlankRadix

vim -c ":1,1s/^.//g" /tmp/backemerg-sostSlashBlankRadix -c :w -c :q

sed 's/[^ ]//g' /tmp/backemerg-sostSlashBlankRadix | awk '{ print length }' > /tmp/backemerg-colCRadix.txt

	# qua 
numberOfColumnRadix=$(cat /tmp/backemerg-colCRadix.txt)

if test ! $numberOfColumn -eq $numberOfColumnRadix

then

	echo "/" > /tmp/backemerg-percorsoIsolato 
# testing
#echo " "
#echo "percorso isolato è la radice del file system e.g. /b"
#cat /tmp/backemerg-percorsoIsolato

else

	# il percorso è a sx della /

cat /tmp/backemerg-fullNameBackup | cut -d/ -f1,"$numberOfColumn" > /tmp/backemerg-percorsoIsolato

# testing
#echo " "
#echo "percorso isolato e.g. a/b"
#cat /tmp/backemerg-percorsoIsolato

fi
	# testing 
#	 read -p "sto a 90" EnterNull
else
	## significa che il numero di slash è maggiore di 1


	## devo capire di nuovo se ho 
# e.g. a/b/c
# ho due slash e tre colonne
# o e.g. /a/b/c
# ho tre slash e tre colonna


## se eliminando il primo carattere, il numero di colonne cambia significa che lo spazio
# è all'inizio del file, quindi che il percorso è la radice del file system

cp /tmp/backemerg-sostSlashBlank /tmp/backemerg-sostSlashBlankRadix

vim -c ":1,1s/^.//g" /tmp/backemerg-sostSlashBlankRadix -c :w -c :q

sed 's/[^ ]//g' /tmp/backemerg-sostSlashBlankRadix | awk '{ print length }' > /tmp/backemerg-colCRadix.txt

	# qua 
numberOfColumnRadix=$(cat /tmp/backemerg-colCRadix.txt)

if test ! $numberOfColumn -eq $numberOfColumnRadix

then

# dopo l'ultima /
# selezione il nome del file
cat /tmp/backemerg-fullNameBackup |sed 's/.*\///' > /tmp/backemerg-nomeCartellaIsolata
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/backemerg-nomeCartellaIsolata
#read -p "testing 181" EnterNull


### Percorso isolato

## prima dell'ultima / non funziona in caso di più /, quindi ricorro al nome del file
# cat /tmp/backemerg-fullNameBackup |sed 's/\/.*//' > /tmp/backemerg-percorsoIsolato


## esprimendo il nome del file non funziona in caso di omonimia tra nome file e una cartella,
# e.g. prova/prova
# seleziono il percorso privo del nome del file
# nomeFile="$(cat /tmp/backemerg-nomeCartellaIsolata)"
## l'ultimo sed elimina l'ultima /, comodo per esprimere la variabile $pathIsolato in codici esterni
## isolandola da ciò che viene a dx, e.g. $pathIsolato/prova.txt
#cat /tmp/backemerg-fullNameBackup  |sed 's/'$nomeFile'.*//'  | sed 's/\/$//g' > /tmp/backemerg-percorsoIsolato


cat /tmp/backemerg-fullNameBackup | sed 's/\// /g' > /tmp/backemerg-sostSlashBlank

# e.g. a/b
# ho una slash e due colonne
# e.g. /a
# ho una slash  1 colonna

echo $numberOfColumn - 1| bc > /tmp/backemerg-nCampiMinusLast

nColonneMinusLast=$(cat /tmp/backemerg-nCampiMinusLast)

# stampo i campi dal I al penultimo, sulla stessa linea (I tr)
cat /tmp/backemerg-sostSlashBlank | awk -v inizio=1 -v fine=$nColonneMinusLast '{for(i=inizio;i<=fine;i++) print $i}' > /tmp/backemerg-pathBlanked

## inserisco le / alla fine di ogni riga
vim -c ":%s/$/\//g" /tmp/backemerg-pathBlanked -c :w -c :q
# read -p "sto a 143" EnterNull

## porto tutto sulla stella linea
cat /tmp/backemerg-pathBlanked | tr -d '\n' > /tmp/backemerg-percorsoIsolato
# read -p "sto a 147" EnterNull

## inserisco all'inizio la /
vim -c ":%s/^/\//g" /tmp/backemerg-percorsoIsolato -c :w -c :q

# read -p "sto a 152" EnterNull
## elimino l'ultima / perché è comodo scrivere in script esterni: $pathIsolato/bla 
vim -c ":%s/\/$//g" /tmp/backemerg-percorsoIsolato -c :w -c :q

	# testing 
#	read -p "sto a 157" EnterNull

# testing
# echo " "
# echo "percorso isolato e.g. /home/mart/test7"
# cat /tmp/backemerg-percorsoIsolato


# testing
#echo " "
#echo "percorso isolato è la radice del file system e.g. /b"
#cat /tmp/backemerg-percorsoIsolato

### OK 2024.05.04
else

# dopo l'ultima /
# selezione il nome del file
cat /tmp/backemerg-fullNameBackup |sed 's/.*\///' > /tmp/backemerg-nomeCartellaIsolata
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/backemerg-nomeCartellaIsolata


### Percorso isolato

## prima dell'ultima / non funziona in caso di più /, quindi ricorro al nome del file
# cat /tmp/backemerg-fullNameBackup |sed 's/\/.*//' > /tmp/backemerg-percorsoIsolato


## esprimendo il nome del file non funziona in caso di omonimia tra nome file e una cartella,
# e.g. prova/prova
# seleziono il percorso privo del nome del file
# nomeFile="$(cat /tmp/backemerg-nomeCartellaIsolata)"
## l'ultimo sed elimina l'ultima /, comodo per esprimere la variabile $pathIsolato in codici esterni
## isolandola da ciò che viene a dx, e.g. $pathIsolato/prova.txt
#cat /tmp/backemerg-fullNameBackup  |sed 's/'$nomeFile'.*//'  | sed 's/\/$//g' > /tmp/backemerg-percorsoIsolato


cat /tmp/backemerg-fullNameBackup | sed 's/\// /g' > /tmp/backemerg-sostSlashBlank

# e.g. a/b
# ho una slash e due colonne
# e.g. /a
# ho una slash  1 colonna

## In tal caso va numberOfColumn
#echo $numberOfColumn - 1| bc > /tmp/backemerg-nCampiMinusLast

#nColonneMinusLast=$(cat /tmp/backemerg-nCampiMinusLast)

# stampo i campi dal I al penultimo, sulla stessa linea (I tr)
#cat /tmp/backemerg-sostSlashBlank | awk -v inizio=1 -v fine=$nColonneMinusLast '{for(i=inizio;i<=fine;i++) print $i}' > /tmp/backemerg-pathBlanked
cat /tmp/backemerg-sostSlashBlank | awk -v inizio=1 -v fine=$numberOfColumn '{for(i=inizio;i<=fine;i++) print $i}' > /tmp/backemerg-pathBlanked


## inserisco le / alla fine di ogni riga
vim -c ":%s/$/\//g" /tmp/backemerg-pathBlanked -c :w -c :q
# read -p "sto a 143" EnterNull

## porto tutto sulla stella linea
cat /tmp/backemerg-pathBlanked | tr -d '\n' > /tmp/backemerg-percorsoIsolato
# read -p "sto a 147" EnterNull

# read -p "sto a 152" EnterNull
## elimino l'ultima / perché è comodo scrivere in script esterni: $pathIsolato/bla 
vim -c ":%s/\/$//g" /tmp/backemerg-percorsoIsolato -c :w -c :q

#read -p "testing 314" EnterNull

	# il percorso è a sx della /
# testing
#echo " "
#echo "percorso isolato e.g. a/b/C"
#cat /tmp/backemerg-percorsoIsolato

fi
	# testing 
#	 read -p "sto a 90" EnterNull



fi

fi

exit

