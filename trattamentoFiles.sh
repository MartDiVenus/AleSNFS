#!/bin/bash

## TrattamentoFiles.sh sceglie il primo file (tramite head -n1) individuato da *, invece
# trattamentoFilesSomma.sh considera tutti i file individuati da *.
#
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


for slash in {1}

do

if test $leggoCountSlash -eq 0

then

cat /tmp/backemerg-fullNameCleaned  > /tmp/backemerg-nomeFileIsolato0

grep "\*" /tmp/backemerg-nomeFileIsolato0 > /tmp/backemerg-nomeFileIsolato01

fileIsolato01=$(cat /tmp/backemerg-nomeFileIsolato01)

stat --format %s /tmp/backemerg-nomeFileIsolato01 > /tmp/backemerg-nomeFileIsolato01Bytes

wildBytes=$(cat /tmp/backemerg-nomeFileIsolato01Bytes)

if test $wildBytes -gt 0

then
	ls $fileIsolato01 | head -n1 > /tmp/backemerg-nomeFileIsolato

fileIsolato=$(cat /tmp/backemerg-nomeFileIsolato)

else

cp /tmp/backemerg-nomeFileIsolato0 /tmp/backemerg-nomeFileIsolato

fileIsolato=$(cat /tmp/backemerg-nomeFileIsolato)

fi


# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
cat /tmp/backemerg-nomeFileIsolato | sed 's/\./ /g' > /tmp/backemerg-nomeSenzaEstensionePre
## il I campo è il nome senza estensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/backemerg-nomeSenzaEstensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/backemerg-tipoEstensione



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


break

fi

if test $leggoCountSlash -eq 1

then


# dopo l'ultima /
# selezione il nome del file
cat /tmp/backemerg-fullNameCleaned |sed 's/.*\///' > /tmp/backemerg-nomeFileIsolato0

grep "\*" /tmp/backemerg-nomeFileIsolato0 > /tmp/backemerg-nomeFileIsolato01

fileIsolato01=$(cat /tmp/backemerg-nomeFileIsolato01)

stat --format %s /tmp/backemerg-nomeFileIsolato01 > /tmp/backemerg-nomeFileIsolato01Bytes

wildBytes=$(cat /tmp/backemerg-nomeFileIsolato01Bytes)

if test $wildBytes -gt 0

then
	ls $fileIsolato01 | head -n1 > /tmp/backemerg-nomeFileIsolato

fileIsolato=$(cat /tmp/backemerg-nomeFileIsolato)

else

cp /tmp/backemerg-nomeFileIsolato0 /tmp/backemerg-nomeFileIsolato

fileIsolato=$(cat /tmp/backemerg-nomeFileIsolato)

fi


# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
cat /tmp/backemerg-nomeFileIsolato | sed 's/\./ /g' > /tmp/backemerg-nomeSenzaEstensionePre
## il I campo è il nome senza estensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/backemerg-nomeSenzaEstensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/backemerg-tipoEstensione

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

else

	# il percorso è a sx della /

cat /tmp/backemerg-fullNameCleaned | cut -d/ -f1,"$numberOfColumn" > /tmp/backemerg-percorsoIsolato



fi

break

fi

if test $leggoCountSlash -gt 1

then

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
cat /tmp/backemerg-fullNameCleaned | sed 's/.*\///' > /tmp/backemerg-nomeFileIsolato0

grep "\*" /tmp/backemerg-nomeFileIsolato0 > /tmp/backemerg-nomeFileIsolato01

fileIsolato01=$(cat /tmp/backemerg-nomeFileIsolato01)

stat --format %s /tmp/backemerg-nomeFileIsolato01 > /tmp/backemerg-nomeFileIsolato01Bytes

wildBytes=$(cat /tmp/backemerg-nomeFileIsolato01Bytes)

if test $wildBytes -gt 0

then
	ls $fileIsolato01 | head -n1 > /tmp/backemerg-nomeFileIsolato

fileIsolato=$(cat /tmp/backemerg-nomeFileIsolato)

else

cp /tmp/backemerg-nomeFileIsolato0 /tmp/backemerg-nomeFileIsolato

fileIsolato=$(cat /tmp/backemerg-nomeFileIsolato)

fi

# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
#vi -s /usr/local/lib/backemerg/command-sost-pto /tmp/backemerg-nomeFileIsolato
cat /tmp/backemerg-nomeFileIsolato | sed 's/\./ /g' > /tmp/backemerg-nomeSenzaEstensionePre

## il I campo è il nome senza estensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/backemerg-nomeSenzaEstensione
cat /tmp/backemerg-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/backemerg-tipoEstensione

########## Percorso isolato
cat /tmp/backemerg-fullNameCleaned | sed 's/\/[^\/]*$//' > /tmp/backemerg-percorsoIsolato

fi

done

exit

