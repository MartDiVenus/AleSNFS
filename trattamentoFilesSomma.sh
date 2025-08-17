#!/bin/bash

#### trattamentoFilesSomma.sh serve a luxdim:
# 1. a stampare le dimensioni dei file selezionati, uno per volta, da * (wildcard);
# 2. all'opzione -s (somma) dei file selezionati, uno per volta, da * (wildcard);

## Mentre trattamentoFiles.sh agisce su un solo file forzando quando viene
# espresso * (wildcard), tuttavia selezionando il file individuato da *, appunto;
# quindi utile ma per uno scopo diverso.
# Infatti mi servo di entrambi gli script, per scopi differenti.

## !! a volte /tmp/backemerg-fullName viene creato con uno spazio finale,
## in /usr/local/lib/backemerg/filesCartelle/directSelect/1/perChiaveAlfanumerica/files/files.sh
## ho rimosso tale problema, ma per non perdere tempo nel correggere gli "infiniti" miei script
## che generano /tmp/backemerg-fullName---correggo qui in trattamentoFiles.sh. 
cat /tmp/backemerg-fullName | sed 's/ //g' > /tmp/backemerg-fullNameCleaned

cat /tmp/backemerg-fullNameCleaned | sed 's/\// /g' > /tmp/backemerg-sostSlashBlank

sed 's/[^ ]//g' /tmp/backemerg-sostSlashBlank | awk '{ print length }' > /tmp/backemerg-colC.txt

numberOfColumn=$(cat /tmp/backemerg-colC.txt)

sed 's/[^/]//g' /tmp/backemerg-fullNameCleaned | awk '{ print length }' > /tmp/backemerg-countSlash


leggoCountSlash=$(cat /tmp/backemerg-countSlash)


#read -p "18 testing" EnterNull

if test $leggoCountSlash -eq 0

then

cat /tmp/backemerg-fullNameCleaned  > /tmp/backemerg-nomeFileIsolato

# testing
#echo " "
#echo "nome file isolato"
#cat /tmp/backemerg-nomeFileIsolato


# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
cat /tmp/backemerg-nomeFileIsolato | sed 's/\./ /g' > /tmp/backemerg-nomeSenzaEstensionePre
## il I campo è il nome senza estensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/backemerg-nomeSenzaEstensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/backemerg-tipoEstensione


#read -p "43 testing" EnterNull


# testing
#echo " "
#echo "nome senza estensione"
#cat /tmp/backemerg-nomeSenzaEstensione

# testing
#echo " "

echo "$PWD" > /tmp/backemerg-percorsoIsolato
## ATTENZIONE!!!!!!!!!!!!!!!!
## per programmi come la copia diretta di files in backemerg, 
## occorre verificare:
## <if test "$leggoPercorsoIsolato" == "$PWD">>
## perché al posto di $PWD deve esserci la $path sorgente della copia.
## Lo stesso caso si presenta nella copia diretta di cartelle in backemerg,
## ma non occorre verificare con il condizionale $PWD perché verifico diversamente.
## Questo $PWD serve quando specifico file nella stessa posizione del terminale, e.g.
## luxdim --f=a.txt
## Quindi è corretto il codice di trattamentoFiles.sh, devi solo adeguare i codici
## che hanno bisogno delle proprie calibrazioni.

#read -p "testing trattamentoFiles 53" EnterNull
else

if test $leggoCountSlash -eq 1

then


# dopo l'ultima /
# selezione il nome del file
cat /tmp/backemerg-fullNameCleaned |sed 's/.*\///' > /tmp/backemerg-nomeFileIsolato
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/backemerg-nomeFileIsolato


# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
cat /tmp/backemerg-nomeFileIsolato | sed 's/\./ /g' > /tmp/backemerg-nomeSenzaEstensionePre
## il I campo è il nome senza estensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/backemerg-nomeSenzaEstensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/backemerg-tipoEstensione
#read -p "testing 80" EnterNull

# testing
#echo " "
#echo "nome senza estensione"
#cat /tmp/backemerg-nomeSenzaEstensione


### Percorso isolato


## prima dell'ultima / non funziona in caso di più /, quindi ricorro al nome del file
# cat /tmp/backemerg-fullNameCleaned |sed 's/\/.*//' > /tmp/backemerg-percorsoIsolato


## esprimendo il nome del file non funziona in caso di omonimia tra nome file e una cartella,
# e.g. prova/prova
# seleziono il percorso privo del nome del file
# nomeFile="$(cat /tmp/backemerg-nomeFileIsolato)"
## l'ultimo sed elimina l'ultima /, comodo per esprimere la variabile $pathIsolato in codici esterni
## isolandola da ciò che viene a dx, e.g. $pathIsolato/prova.txt
#cat /tmp/backemerg-fullNameCleaned  |sed 's/'$nomeFile'.*//'  | sed 's/\/$//g' > /tmp/backemerg-percorsoIsolato


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
#read -p "testing trattamentoFiles 124" EnterNull

# testing
#echo " "
#echo "percorso isolato è la radice del file system e.g. /b"
#cat /tmp/backemerg-percorsoIsolato

else

	# il percorso è a sx della /

cat /tmp/backemerg-fullNameCleaned | cut -d/ -f1,"$numberOfColumn" > /tmp/backemerg-percorsoIsolato

#read -p "testing trattamentoFiles 137" EnterNull

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



# dopo l'ultima /
# selezione il nome del file
cat /tmp/backemerg-fullNameCleaned | sed 's/.*\///' > /tmp/backemerg-nomeFileIsolato
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/backemerg-nomeFileIsolato
#read -p "testing 181" EnterNull

# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
#vi -s /usr/local/lib/backemerg/command-sost-pto /tmp/backemerg-nomeFileIsolato
cat /tmp/backemerg-nomeFileIsolato | sed 's/\./ /g' > /tmp/backemerg-nomeSenzaEstensionePre
#read -p "testing 187" EnterNull

## il I campo è il nome senza estensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/backemerg-nomeSenzaEstensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/backemerg-tipoEstensione

########## Percorso isolato
cat /tmp/backemerg-fullNameCleaned | sed 's/\/[^\/]*$//' > /tmp/backemerg-percorsoIsolato

#read -p "testing 205
#cat nomeFileIsolatoEchoed = $(cat /tmp/backemerg-nomeIsolatoDotEchoed)
#cat /tmp/backemerg-percorsoIsolato00 = $(cat /tmp/backemerg-percorsoIsolato00)
#" EnterNull

##<</home/mart/test3/a/>>
### OK 2024.05.04
#else

#cat /tmp/backemerg-fullName | sed 's/'$nomeFileIsolatoEchoed'//g' > /tmp/backemerg-percorsoIsolato00

#cat /tmp/backemerg-percorsoIsolato00 | sed 's/\/$//g' > /tmp/backemerg-percorsoIsolato

#fi
# dopo l'ultima /
# selezione il nome del file
#cat /tmp/backemerg-fullNameCleaned |sed 's/.*\///' > /tmp/backemerg-nomeFileIsolato
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/backemerg-nomeFileIsolato


# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
#cat /tmp/backemerg-nomeFileIsolato | sed 's/\./ /g' > /tmp/backemerg-nomeSenzaEstensionePre
## il I campo è il nome senza estensione
#cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/backemerg-nomeSenzaEstensione
#cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/backemerg-tipoEstensione


# testing
#echo " "
#echo "nome senza estensione"
#cat /tmp/backemerg-nomeSenzaEstensione


### Percorso isolato

## prima dell'ultima / non funziona in caso di più /, quindi ricorro al nome del file
# cat /tmp/backemerg-fullNameCleaned |sed 's/\/.*//' > /tmp/backemerg-percorsoIsolato


## esprimendo il nome del file non funziona in caso di omonimia tra nome file e una cartella,
# e.g. prova/prova
# seleziono il percorso privo del nome del file
# nomeFile="$(cat /tmp/backemerg-nomeFileIsolato)"
## l'ultimo sed elimina l'ultima /, comodo per esprimere la variabile $pathIsolato in codici esterni
## isolandola da ciò che viene a dx, e.g. $pathIsolato/prova.txt
#cat /tmp/backemerg-fullNameCleaned  |sed 's/'$nomeFile'.*//'  | sed 's/\/$//g' > /tmp/backemerg-percorsoIsolato


#cat /tmp/backemerg-fullNameCleaned | sed 's/\// /g' > /tmp/backemerg-sostSlashBlank

# e.g. a/b
# ho una slash e due colonne
# e.g. /a
# ho una slash  1 colonna

## In tal caso va numberOfColumn
#echo $numberOfColumn - 1| bc > /tmp/backemerg-nCampiMinusLast

#nColonneMinusLast=$(cat /tmp/backemerg-nCampiMinusLast)

# stampo i campi dal I al penultimo, sulla stessa linea (I tr)
#cat /tmp/backemerg-sostSlashBlank | awk -v inizio=1 -v fine=$nColonneMinusLast '{for(i=inizio;i<=fine;i++) print $i}' > /tmp/backemerg-pathBlanked
#cat /tmp/backemerg-sostSlashBlank | awk -v inizio=1 -v fine=$numberOfColumn '{for(i=inizio;i<=fine;i++) print $i}' > /tmp/backemerg-pathBlanked


## inserisco le / alla fine di ogni riga
#vim -c ":%s/$/\//g" /tmp/backemerg-pathBlanked -c :w -c :q
# read -p "sto a 143" EnterNull

## porto tutto sulla stella linea
#cat /tmp/backemerg-pathBlanked | tr -d '\n' > /tmp/backemerg-percorsoIsolato
# read -p "sto a 147" EnterNull

# read -p "sto a 152" EnterNull
## elimino l'ultima / perché è comodo scrivere in script esterni: $pathIsolato/bla 
#vim -c ":%s/\/$//g" /tmp/backemerg-percorsoIsolato -c :w -c :q
#read -p "testing trattamentoFiles 328" EnterNull

#read -p "testing 314" EnterNull

	# il percorso è a sx della /
# testing
#echo " "
#echo "percorso isolato e.g. a/b/C"
#cat /tmp/backemerg-percorsoIsolato

#fi
	# testing 
#	 read -p "sto a 90" EnterNull



fi

fi

exit

