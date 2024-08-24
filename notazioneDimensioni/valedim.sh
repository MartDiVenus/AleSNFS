#!/bin/bash

## Notazione espressa scientificamente (notazione internazinale):
## virgola ogni migliaia di bytes, quindi ogni tre cifre.

### Script da usare in combinazione con ValeNetrw: [mf][fm]
## in quanto tale script stampa le dimensioni dei file selezionati
## con [mf][fm], quindi presenti nel file
## /tmp/valeNetrw-SMarked
#
#### Può essere usato sia da bash (scelta consigliata) in combinazione con ValeNetrw
### seleziona i file di cui stampare le dimensioni:
## [mf][fm]*
### esegui valeDim
## ~$> valedim
# alias
## ~$> /usr/local/bin/valedim
##
#### sia invocandolo da ValeNetrw: 
### seleziona i file di cui stampare le dimensioni:
## [mf][fm]*
### invoca il plugin NetrwBM
## [bm]
### Specifica l'eseguibile
## /usr/local/bin/valedim
### leggi le dimensioni di ogni singolo file selezionato:
## ~$> cat /tmp/ValeNetrw-BmOutput
##
## alias
## ~$> cat /tmp/outValedim
#
### leggi le dimensioni totali della somma di tutti i file selezionati:
## ~$> cat /tmp/ValeNetrw-BmSommaOutput
##
## alias
## ~$> cat /tmp/outSommaValedim


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

rm -f /tmp/outValedim

touch /tmp/outValedim

rm -f /tmp/outSommaValedim

touch /tmp/outSommaValedim


rm -f /tmp/ValeNetrw-BmOutput

touch /tmp/ValeNetrw-BmOutput

rm -f /tmp/ValeNetrw-BmSommaOutput

touch /tmp/ValeNetrw-BmSommaOutput

rm -fr /tmp/valedim*

leggo1=$(echo $1 > /tmp/inputValeDim01)

rileggoInput1="$(cat /tmp/inputValeDim01)"

if test $rileggoInput1 == "-h"

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
echo "
Name: Valedim"
echo "
Goal: To  print  size  of  a  file, in  diverse  units. "
echo " "
		echo "Version: backemerg-4.2.0"
		echo " "
echo "help				         			-h"
echo " "
echo "Whithout size options: full diverse units printing."
echo "bytes				 				-b"
echo "kilo bytes				 			-k"
echo "mega bytes 	  	 	 				-m"
echo "giga bytes				 			-g"
echo " "
echo "Usage:
valedim -option 
echo " "
echo "e.g."

valedim 

valedim -b 

valedim -k

valedim -m 

valedim -g

Output is written on stdout and in:
/tmp/outValedim			(single file or more files / addends of sum, ValeNetrw)
/tmp/ValeNetrw-BmOutput		(single file or more files / addends of sum, ValeNetrw [bm] command - valedim)
/tmp/outSommaValedim		(sum)
/tmp/ValeNetrw-BmSommaOutput	(sum, ValeNetrw [bm] command - valedim)



https://github.com/MartDiVenus/AleSNFS/notazioneDimensioni
https://youtu.be/wXrcPyFcFG0

Copyright:
Copyright (C) 2023.08.29 Mario Fantini (marfant7@gmail.com).
Bash copyright applies to its Mario Fantini's pseudo options usage.
GNU copyright applies to its Mario Fantini's GNU tools usage.
VIM copyright applies to its Mario Fantini's VIM tools usage.
And so on.
"

else

### Inserimenti VIM
## li,:
#
### Inserimenti SED
#
#	1
li,-1-byte () {
#		byte
sed 's/^\(.\{1\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-1-kilo () {
#		kilo
sed 's/^\(.\{1\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-1-mega () {
#		mega
sed 's/^\(.\{1\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-1-giga () {
#		giga
sed 's/^\(.\{1\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
##
}


#	2
li,-2-byte () {
#		byte
sed 's/^\(.\{2\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-2-kilo () {
#		kilo
sed 's/^\(.\{2\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-2-mega () {
#		mega
sed 's/^\(.\{2\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-2-giga () {
#		giga
sed 's/^\(.\{2\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	3
li,-3-byte () {
#		byte
sed 's/^\(.\{3\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-3-kilo () {
#		kilo
sed 's/^\(.\{3\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-3-mega () {
#		mega
sed 's/^\(.\{3\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-3-giga () {
#		giga
sed 's/^\(.\{3\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	5
li,-5-byte () {
#		byte
sed 's/^\(.\{5\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-5-kilo () {
#		kilo
sed 's/^\(.\{5\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-5-mega () {
#		mega
sed 's/^\(.\{5\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-5-giga () {
#		giga
sed 's/^\(.\{5\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	6
li,-6-byte () {
#		byte
sed 's/^\(.\{6\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-6-kilo () {
#		kilo
sed 's/^\(.\{6\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-6-mega () {
#		mega
sed 's/^\(.\{6\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-6-giga () {
#		giga
sed 's/^\(.\{6\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	7
li,-7-byte () {
#		byte
sed 's/^\(.\{7\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-7-kilo () {
#		kilo
sed 's/^\(.\{7\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-7-mega () {
#		mega
sed 's/^\(.\{7\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-7-giga () {
#		giga
sed 's/^\(.\{7\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	9
li,-9-byte () {
#		byte
sed 's/^\(.\{9\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-9-kilo () {
#		kilo
sed 's/^\(.\{9\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-9-mega () {
#		mega
sed 's/^\(.\{9\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-9-giga () {
#		giga
sed 's/^\(.\{9\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	10
li,-10-byte () {
#		byte
sed 's/^\(.\{10\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-10-kilo () {
#		kilo
sed 's/^\(.\{10\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-10-mega () {
#		mega
sed 's/^\(.\{10\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-10-giga () {
#		giga
sed 's/^\(.\{10\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	11
li,-11-byte () {
#		byte
sed 's/^\(.\{11\}\)/\1,/' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li,-11-kilo () {
#		kilo
sed 's/^\(.\{11\}\)/\1,/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li,-11-mega () {
#		mega
sed 's/^\(.\{11\}\)/\1,/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li,-11-giga () {
#		giga
sed 's/^\(.\{11\}\)/\1,/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}



### Inserimenti VIM
## li.:
#
### Inserimenti SED

#	5
li.-5-byte () {
#		byte
sed 's/^\(.\{5\}\)/\1./' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li.-5-kilo () {
#		kilo
sed 's/^\(.\{5\}\)/\1./' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li.-5-mega () {
#		mega
sed 's/^\(.\{5\}\)/\1./' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li.-5-giga () {
#		giga
sed 's/^\(.\{5\}\)/\1./' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	6
li.-6-byte () {
#		byte
sed 's/^\(.\{6\}\)/\1./' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li.-6-kilo () {
#		kilo
sed 's/^\(.\{6\}\)/\1./' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li.-6-mega () {
#		mega
sed 's/^\(.\{6\}\)/\1./' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li.-6-giga () {
#		giga
sed 's/^\(.\{6\}\)/\1./' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	7
li.-7-byte () {
#		byte
sed 's/^\(.\{7\}\)/\1./' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li.-7-kilo () {
#		kilo
sed 's/^\(.\{7\}\)/\1./' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li.-7-mega () {
#		mega
sed 's/^\(.\{7\}\)/\1./' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li.-7-giga () {
#		giga
sed 's/^\(.\{7\}\)/\1./' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}


#	10
li.-10-byte () {
#		byte
sed 's/^\(.\{10\}\)/\1./' /tmp/backemerg-stat > /tmp/backemerg-stat01
cp /tmp/backemerg-stat01 /tmp/backemerg-stat
}

li.-10-kilo () {
#		kilo
sed 's/^\(.\{10\}\)/\1./' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
cp /tmp/backemerg-statKilo01 /tmp/backemerg-statKilo
}

li.-10-mega () {
#		mega
sed 's/^\(.\{10\}\)/\1./' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
cp /tmp/backemerg-statMega01 /tmp/backemerg-statMega
}

li.-10-giga () {
#		giga
sed 's/^\(.\{10\}\)/\1./' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
cp /tmp/backemerg-statGiga01 /tmp/backemerg-statGiga
}



## Sostituzioni VIM 
## lr.:
#
## Sostituzioni	SED
#	5
lr.-5-byte () {
#		byte
sed 's/^\(.\{5\}\)/\1dirin/' /tmp/backemerg-stat > /tmp/backemerg-stat01
sed 's/dirin.//g' /tmp/backemerg-stat01 > /tmp/backemerg-stat02
sed 's/^\(.\{5\}\)/\1./' /tmp/backemerg-stat02 > /tmp/backemerg-stat
}

lr.-5-kilo () {
#		kilo
sed 's/^\(.\{5\}\)/\1dirin/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
sed 's/dirin.//g' /tmp/backemerg-statKilo01 > /tmp/backemerg-statKilo02
sed 's/^\(.\{5\}\)/\1./' /tmp/backemerg-statKilo02 > /tmp/backemerg-statKilo
}

lr.-5-mega () {
#		mega
sed 's/^\(.\{5\}\)/\1dirin/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
sed 's/dirin.//g' /tmp/backemerg-statMega01 > /tmp/backemerg-statMega02
sed 's/^\(.\{5\}\)/\1./' /tmp/backemerg-statMega02 > /tmp/backemerg-statMega
}

lr.-5-giga () {
#		giga
sed 's/^\(.\{5\}\)/\1dirin/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
sed 's/dirin.//g' /tmp/backemerg-statGiga01 > /tmp/backemerg-statGiga02
sed 's/^\(.\{5\}\)/\1./' /tmp/backemerg-statGiga02 > /tmp/backemerg-statGiga
}


#	9
lr.-9-byte () {
#		byte
sed 's/^\(.\{9\}\)/\1dirin/' /tmp/backemerg-stat > /tmp/backemerg-stat01
sed 's/dirin.//g' /tmp/backemerg-stat01 > /tmp/backemerg-stat02
sed 's/^\(.\{9\}\)/\1./' /tmp/backemerg-stat02 > /tmp/backemerg-stat
}

lr.-9-kilo () {
#		kilo
sed 's/^\(.\{9\}\)/\1dirin/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
sed 's/dirin.//g' /tmp/backemerg-statKilo01 > /tmp/backemerg-statKilo02
sed 's/^\(.\{9\}\)/\1./' /tmp/backemerg-statKilo02 > /tmp/backemerg-statKilo
}

lr.-9-mega () {
#		mega
sed 's/^\(.\{9\}\)/\1dirin/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
sed 's/dirin.//g' /tmp/backemerg-statMega01 > /tmp/backemerg-statMega02
sed 's/^\(.\{9\}\)/\1./' /tmp/backemerg-statMega02 > /tmp/backemerg-statMega
}

lr.-9-giga () {
#		giga
sed 's/^\(.\{9\}\)/\1dirin/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
sed 's/dirin.//g' /tmp/backemerg-statGiga01 > /tmp/backemerg-statGiga02
sed 's/^\(.\{9\}\)/\1./' /tmp/backemerg-statGiga02 > /tmp/backemerg-statGiga
}



### Sostistuzioni VIM
## lr,:
#
### Sostituzioni SED
#	7
lr,-7-byte () {
#		byte
sed 's/^\(.\{7\}\)/\1dirin/' /tmp/backemerg-stat > /tmp/backemerg-stat01
sed 's/dirin.//g' /tmp/backemerg-stat01 > /tmp/backemerg-stat02
sed 's/^\(.\{7\}\)/\1,/' /tmp/backemerg-stat02 > /tmp/backemerg-stat
}

lr,-7-kilo () {
#		kilo
sed 's/^\(.\{7\}\)/\1dirin/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
sed 's/dirin.//g' /tmp/backemerg-statKilo01 > /tmp/backemerg-statKilo02
sed 's/^\(.\{7\}\)/\1,/' /tmp/backemerg-statKilo02 > /tmp/backemerg-statKilo
}

lr,-7-mega () {
#		mega
sed 's/^\(.\{7\}\)/\1dirin/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
sed 's/dirin.//g' /tmp/backemerg-statMega01 > /tmp/backemerg-statMega02
sed 's/^\(.\{7\}\)/\1,/' /tmp/backemerg-statMega02 > /tmp/backemerg-statMega
}

lr,-7-giga () {
#		giga
sed 's/^\(.\{7\}\)/\1dirin/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
sed 's/dirin.//g' /tmp/backemerg-statGiga01 > /tmp/backemerg-statGiga02
sed 's/^\(.\{7\}\)/\1,/' /tmp/backemerg-statGiga02 > /tmp/backemerg-statGiga
}


#	10
lr,-10-byte () {
#		byte
sed 's/^\(.\{10\}\)/\1dirin/' /tmp/backemerg-stat > /tmp/backemerg-stat01
sed 's/dirin.//g' /tmp/backemerg-stat01 > /tmp/backemerg-stat02
sed 's/^\(.\{10\}\)/\1,/' /tmp/backemerg-stat02 > /tmp/backemerg-stat
}

lr,-10-kilo () {
#		kilo
sed 's/^\(.\{10\}\)/\1dirin/' /tmp/backemerg-statKilo > /tmp/backemerg-statKilo01
sed 's/dirin.//g' /tmp/backemerg-statKilo01 > /tmp/backemerg-statKilo02
sed 's/^\(.\{10\}\)/\1,/' /tmp/backemerg-statKilo02 > /tmp/backemerg-statKilo
}

lr,-10-mega () {
#		mega
sed 's/^\(.\{10\}\)/\1dirin/' /tmp/backemerg-statMega > /tmp/backemerg-statMega01
sed 's/dirin.//g' /tmp/backemerg-statMega01 > /tmp/backemerg-statMega02
sed 's/^\(.\{10\}\)/\1,/' /tmp/backemerg-statMega02 > /tmp/backemerg-statMega
}

lr,-10-giga () {
#		giga
sed 's/^\(.\{10\}\)/\1dirin/' /tmp/backemerg-statGiga > /tmp/backemerg-statGiga01
sed 's/dirin.//g' /tmp/backemerg-statGiga01 > /tmp/backemerg-statGiga02
sed 's/^\(.\{10\}\)/\1,/' /tmp/backemerg-statGiga02 > /tmp/backemerg-statGiga
}



### Va subito dopo: 	leggoNCifre=$(cat /tmp/backemerg-wcL)

cifre () {
#### I if
#### Manualmente la virgola si appone da dx verso sx, ma per il codice 
### uso un espediente e procedo al contrario.

### 1 bytes
if test $leggoNCifre -eq 1
then

echo "1" > /tmp/valedim01

echo "0.000,000,00" > /tmp/valedimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

echo "0.000,00" > /tmp/valedimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega

echo "0.00" > /tmp/valedimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo
fi

### 10 bytes

if test $leggoNCifre -eq 2
then

echo "1" > /tmp/valedim01

echo "0.000,000,0" > /tmp/valedimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga


echo "0.000,0" > /tmp/valedimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega


echo "0.0" > /tmp/valedimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

fi

## 100 bytes
if test $leggoNCifre -eq 3
then

echo "1" > /tmp/valedim01

echo "0.000,000," > /tmp/valedimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

echo "0.000," > /tmp/valedimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega

echo "0." > /tmp/valedimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

fi


### 1 KB o 10 KB o 100 KB

## 1 KB
## e.g. 1540
if test $leggoNCifre -eq 4

then
## e.g. 1,540
#echo "1G1li,
#ZZ
#" > /tmp/backemerg-command1

#vi -s /tmp/backemerg-command1 /tmp/backemerg-stat 

li,-1-byte


echo "4" > /tmp/valedim04

echo "0.000,00" > /tmp/valedimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga


echo "0.00" > /tmp/valedimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega


echo "" > /tmp/valedimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

vi -c "%s/,/./" /tmp/backemerg-statKilo -c :w -c :q

fi

## 10 KB
## e.g. 80540

if test $leggoNCifre -eq 5

then
## 80,540

#echo "1G2li,
#ZZ
#" > /tmp/backemerg-command1

#vi -s /tmp/backemerg-command1 /tmp/backemerg-stat 

li,-2-byte


echo "5" > /tmp/valedim05

echo "0.000,0" > /tmp/valedimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

echo "0.0" > /tmp/valedimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega

echo "" > /tmp/valedimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

vi -c "%s/,/./" /tmp/backemerg-statKilo -c :w -c :q 


fi

## 100 KB
## e.g. 580540

if test $leggoNCifre -eq 6

then

## 580,540

#echo "1G3li,
#ZZ
#" > /tmp/backemerg-command1

#vi -s /tmp/backemerg-command1 /tmp/backemerg-stat 

li,-3-byte

echo "6" > /tmp/valedim06

echo "0.000," > /tmp/valedimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

echo "0." > /tmp/valedimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega

echo "" > /tmp/valedimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

vi -c "%s/,/./" /tmp/backemerg-statKilo -c :w -c :q 


fi




### 1 MB o 10 MB 0 100 MB

## 1 MB
## e.g. 4580540

if test $leggoNCifre -eq 7

then

	echo "7" > /tmp/valedim07

	echo "0.00" > /tmp/valedimPrefissoGiga

echo "" > /tmp/valedimPrefissoMega

echo "" > /tmp/valedimPrefissoKilo

## e.g. 4,580540

#echo "1G1li,
#ZZ
#" > command2

#vi -s command2 /tmp/backemerg-stat 

li,-1-byte

cp /tmp/backemerg-stat /tmp/backemerg-statMega

vi -c "%s/,/./" /tmp/backemerg-statMega -c :w -c :q

## modifica notazione 16 maggio

li,-5-mega

## fine modifica notazione 16 maggio

## e.g. 4,580,540

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

#echo "1G5li.
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statKilo

li.-5-kilo


#echo "1G5li,
#ZZ
#" > command2

#vi -s command2 /tmp/backemerg-stat

li,-5-byte

cp /tmp/backemerg-stat /tmp/backemerg-statGiga


fi

## 10 MB
## e.g. 84580540
if test $leggoNCifre -eq 8

then
	echo "8" > /tmp/valedim08

		echo "0.0" > /tmp/valedimPrefissoGiga

echo "" > /tmp/valedimPrefissoMega

echo "" > /tmp/valedimPrefissoKilo


## 84,580540
#echo "1G2li,
#ZZ
#" > command2

#vi -s command2 /tmp/backemerg-stat 

li,-2-byte

cp /tmp/backemerg-stat /tmp/backemerg-statMega

vi -c "%s/,/./" /tmp/backemerg-statMega -c :w -c :q

## modifica notazione 16 maggio

li,-6-mega

## fine modifica notazione 16 maggio

## 84,580,540

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

#echo "1G6li.
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statKilo

li.-6-kilo


#echo "1G6li,
#ZZ
#" > command2

#vi -s command2 /tmp/backemerg-stat 

li,-6-byte

cp /tmp/backemerg-stat /tmp/backemerg-statGiga


fi

## 100 MB
## e.g. 184580540
if test $leggoNCifre -eq 9

then
	echo "9" > /tmp/valedim09

			echo "0." > /tmp/valedimPrefissoGiga

echo "" > /tmp/valedimPrefissoMega

echo "" > /tmp/valedimPrefissoKilo

## 184,580540
#echo "1G3li,
#ZZ
#" > command2

#vi -s command2 /tmp/backemerg-stat 

li,-3-byte

cp /tmp/backemerg-stat /tmp/backemerg-statMega

## 184,580540

vi -c "%s/,/./" /tmp/backemerg-statMega -c :w -c :q

## 184.580,540

#echo "1G7li,
#ZZ
#" > command2

#vi -s command2 /tmp/backemerg-statMega

li,-7-mega

cp /tmp/backemerg-stat /tmp/backemerg-statKilo


#echo "1G7li.
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statKilo

li.-7-kilo


### devo considerare la virgola apposta prima
## 184,580,540
#echo "1G7li,
#ZZ
#" > command2

#vi -s command2 /tmp/backemerg-stat 

li,-7-byte

cp /tmp/backemerg-stat /tmp/backemerg-statGiga


fi

### 1 GB o 10 GB o 100 GB
	### 1 GB o 10 GB o 100 GB

	## 1 GB
	## e.g. 2184580540

	if test $leggoNCifre -eq 10

	then
		echo "10" > /tmp/valedim10

			echo "" > /tmp/valedimPrefissoGiga

	echo "" > /tmp/valedimPrefissoMega

	echo "" > /tmp/valedimPrefissoKilo


	## e.g. 2,184580540

	#echo "1G1li,
	#ZZ
	#" > command3

	#vi -s command3 /tmp/backemerg-stat 

	li,-1-byte


		## e.g. 2,184,580540

	# echo "1G5li,
	#ZZ
	#" > command3

	#vi -s command3 /tmp/backemerg-stat

	li,-5-byte


		## e.g. 2,184,580,540

	#		 echo "1G9li,
	#ZZ
	#" > command3

	#vi -s command3 /tmp/backemerg-stat

	li,-9-byte

	cp /tmp/backemerg-stat /tmp/backemerg-statKilo


	
#echo "1G9lr.
#ZZ
#	" > command3
#
#	vi -s command3 /tmp/backemerg-statKilo

	lr.-9-kilo

	cp /tmp/backemerg-stat /tmp/backemerg-statMega



		## e.g. da 2,184,580,540 a 2,184.580,540 
#echo "1G5lr.
#ZZ
#" > command3

#	vi -s command3 /tmp/backemerg-statMega

	lr.-5-mega

	cp /tmp/backemerg-stat /tmp/backemerg-statGiga

	vi -c "1s/,/./" /tmp/backemerg-statGiga -c :w -c :q

	fi

## 10 GB
## e.g. 32184580540

if test $leggoNCifre -eq 11

then

		echo "11" > /tmp/valedim1

			echo "" > /tmp/valedimPrefissoGiga

echo "" > /tmp/valedimPrefissoMega

echo "" > /tmp/valedimPrefissoKilo

## 32,184580540

#echo "1G2li,
#ZZ
#" > command3

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

#vi -s command3 /tmp/backemerg-statGiga 

li,-2-giga

vi -c "%s/,/./" /tmp/backemerg-statGiga -c :w -c :q

## 32.184,580540

#echo "1G6li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statGiga

li,-6-giga


## 32.184,580,540

#echo "1G10li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statGiga

li,-10-giga


## 32,184580540
cp /tmp/backemerg-stat /tmp/backemerg-statMega

#echo "1G2li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statMega 

li,-2-mega


## 32,184.580540
#echo "1G6li.
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statMega 

li.-6-mega


## 32,184.580,540

#echo "1G10li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statMega 

li,-10-mega

cp /tmp/backemerg-stat /tmp/backemerg-statKilo
## 32,184580540

#echo "1G2li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statKilo

li,-2-kilo


## 32,184,580540
#echo "1G6li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statKilo

li,-6-kilo


## 32,184,580.540
#echo "1G10li.
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statKilo

li.-10-kilo


## 32,184,580,540

cp /tmp/backemerg-statKilo /tmp/backemerg-stat

#echo "1G10lr,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-stat

lr,-10-byte

fi

## 100 GB
## e.g. 432184580540

if test $leggoNCifre -eq 12

then
	echo "12" > /tmp/valedim12

		echo "" > /tmp/valedimPrefissoGiga

echo "" > /tmp/valedimPrefissoMega

echo "" > /tmp/valedimPrefissoKilo

## 432,184580540 in 432.184580540

#echo "1G3li,
#ZZ
#" > command3

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

#vi -s command3 /tmp/backemerg-statGiga 

li,-3-giga

vi -c "%s/,/./" /tmp/backemerg-statGiga -c :w -c :q

## 432.184,580540

#echo "1G7li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statGiga 

li,-7-giga


## 432.184,580,540

#echo "1G11li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statGiga 

li,-11-giga


## 432,184580540
cp /tmp/backemerg-stat /tmp/backemerg-statMega

#echo "1G3li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statMega

li,-3-mega


## 432,184.580540

#echo "1G7li.
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statMega

li.-7-mega


## 432,184.580,540

#echo "1G11li,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statMega

li,-11-mega


## da 432,184.580,540 a 432,184,580,540
cp /tmp/backemerg-statMega /tmp/backemerg-statKilo

#echo "1G7lr,
#ZZ
#" > command3

#vi -s command3 /tmp/backemerg-statKilo

lr,-7-kilo

fi

}

echo "Dimensioni di ogni singolo file selezionato:"

echo $rileggoInput1 > /tmp/valedimOption

cp /tmp/valeNetrw-SMarked /tmp/valeNetrw-SMarkedAstat

rm -fr /tmp/backemerg-splitDim

mkdir /tmp/backemerg-splitDim

split -l1 /tmp/valeNetrw-SMarkedAstat /tmp/backemerg-splitDim/

for a in $(ls /tmp/backemerg-splitDim/)

do

pathNameFile="$(cat /tmp/backemerg-splitDim/$a)"


stat --format %s $pathNameFile > /tmp/backemerg-stat

wc -L /tmp/backemerg-stat | awk '$1 > 0 {print $1}' > /tmp/backemerg-wcL
##9
	### inizio modifica somma 16 maggio 2024
	echo "$(cat /tmp/backemerg-stat)"  >> /tmp/valedimSomma

leggoNCifre=$(cat /tmp/backemerg-wcL)

cifre

stat --format %s /tmp/valedimOption > /tmp/valedimOptionBytes

leggoBytes=$(cat /tmp/valedimOptionBytes)

if test $leggoBytes -gt 1

then

	### fine modifica (a) somma 16 maggio 2024
	cat /tmp/valedimOption | sed 's/-//g' > /tmp/valedimOptionLess

leggoOptionLess="$(cat /tmp/valedimOptionLess)"

if test $leggoOptionLess == "g"

then

	leggoPrefissoGiga="$(cat /tmp/valedimPrefissoGiga)"
echo " "
echo "$pathNameFile"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"
echo " "

echo "$pathNameFile"  | tee -a /tmp/outValedim &> /dev/null
echo "$pathNameFile"  | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null

echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes" | tee -a /tmp/outValedim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes" | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null

fi

if test $leggoOptionLess == "m"

then

	leggoPrefissoGiga="$(cat /tmp/valedimPrefissoMega)"
echo " "
echo "$pathNameFile"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes"
echo " "

echo "$pathNameFile"  | tee -a /tmp/outValedim &> /dev/null
echo "$pathNameFile"  | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null


echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes" | tee -a /tmp/outValedim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes" | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null
fi

if test $leggoOptionLess == "k"

then

	leggoPrefissoGiga="$(cat /tmp/valedimPrefissoKilo)"

echo " "
echo "$pathNameFile"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes"
echo " "

echo "$pathNameFile"  | tee -a /tmp/outValedim &> /dev/null
echo "$pathNameFile"  | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null

echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes" | tee -a /tmp/outValedim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes" | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null
fi

if test $leggoOptionLess == "b"

then

echo "$pathNameFile"
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "

echo "$pathNameFile"  | tee -a /tmp/outValedim &> /dev/null
echo "$pathNameFile"  | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null

echo "$(cat /tmp/backemerg-stat) bytes" | tee -a /tmp/outValedim &> /dev/null
echo "$(cat /tmp/backemerg-stat) bytes" | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null
fi

else

	## default mode
echo " "
echo " "
echo "$pathNameFile"
echo " "
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
leggoPrefissoMega="$(cat /tmp/valedimPrefissoKilo)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes"

echo " "
leggoPrefissoMega="$(cat /tmp/valedimPrefissoMega)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
leggoPrefissoGiga="$(cat /tmp/valedimPrefissoGiga)"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"

echo " "

echo "$pathNameFile
$(cat /tmp/backemerg-stat) bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes
$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes
" | tee -a /tmp/outValedim &> /dev/null

echo "$pathNameFile
$(cat /tmp/backemerg-stat) bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes
$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes
" | tee -a /tmp/ValeNetrw-BmOutput &> /dev/null

fi


done


### Hai /tmp/ValeNetrw-BmOutput, verrà stampato alla fine o letto da luxdim.




#^^^^^^^^^^^^^^^^^^^^ SOMMA DELLE DIMENSIONI
awk '{ nlines++;  print nlines }' /tmp/valedimSomma | tail -n1 > /tmp/valedimSommaNLines

nLines=$(cat /tmp/valedimSommaNLines)

if test $nLines -gt 1

then

echo " "
echo "Somma totale delle dimensioni di tutti i file selezionati:"

mkdir /tmp/valedimSommaSplit

split -l1 /tmp/valedimSomma /tmp/valedimSommaSplit/

declare -i var=0

for a in $(ls /tmp/valedimSommaSplit)

do
	var=var+1

	if test $var -eq 1
	then


	addendo=$(cat /tmp/valedimSommaSplit/$a)
	

echo $addendo > /tmp/valedimSommaInizialeRe

else

	partenza=$(cat /tmp/valedimSommaInizialeRe)

	addendo=$(cat /tmp/valedimSommaSplit/$a)

	somma=$(echo $partenza + $addendo | bc)

	echo $somma > /tmp/valedimSommaInizialeRe

	echo $somma > /tmp/valedimSommaTotale

	fi
done

cat /tmp/valedimSommaTotale > /tmp/backemerg-stat

wc -L /tmp/backemerg-stat | awk '$1 > 0 {print $1}' > /tmp/backemerg-wcL
##9

leggoNCifre=$(cat /tmp/backemerg-wcL)

cifre

stat --format %s /tmp/valedimOption > /tmp/valedimOptionBytes

leggoBytes=$(cat /tmp/valedimOptionBytes)

if test $leggoBytes -gt 1

then

	cat /tmp/valedimOption | sed 's/-//g' > /tmp/valedimOptionLess

leggoOptionLess="$(cat /tmp/valedimOptionLess)"

if test $leggoOptionLess == "g"

then

	leggoPrefissoGiga="$(cat /tmp/valedimPrefissoGiga)"
echo " "
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"
echo " "

echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes" | tee -a /tmp/outSommaValedim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes" | tee -a /tmp/ValeNetrw-BmSommaOutput &> /dev/null

fi

if test $leggoOptionLess == "m"

then

	leggoPrefissoGiga="$(cat /tmp/valedimPrefissoMega)"
echo " "
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes"
echo " "

echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes" | tee -a /tmp/outSommaValedim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes" | tee -a /tmp/ValeNetrw-BmSommaOutput &> /dev/null
fi

if test $leggoOptionLess == "k"

then

	leggoPrefissoGiga="$(cat /tmp/valedimPrefissoKilo)"

echo " "
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes"
echo " "

echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes" | tee -a /tmp/outSommaValedim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes" | tee -a /tmp/ValeNetrw-BmSommaOutput &> /dev/null
fi

if test $leggoOptionLess == "b"

then

echo "$(cat /tmp/backemerg-stat) bytes"
echo " "

echo "$(cat /tmp/backemerg-stat) bytes" | tee -a /tmp/outSommaValedim &> /dev/null
echo "$(cat /tmp/backemerg-stat) bytes" | tee -a /tmp/ValeNetrw-BmSommaOutput &> /dev/null
fi

else

	## default mode
echo " "
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
leggoPrefissoMega="$(cat /tmp/valedimPrefissoKilo)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes"

echo " "
leggoPrefissoMega="$(cat /tmp/valedimPrefissoMega)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
leggoPrefissoGiga="$(cat /tmp/valedimPrefissoGiga)"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"

echo " "

echo "$(cat /tmp/backemerg-stat) bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes
$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes
" | tee -a /tmp/outSommaValedim &> /dev/null

echo "$(cat /tmp/backemerg-stat) bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes
$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes
" | tee -a /tmp/ValeNetrw-BmSommaOutput &> /dev/null

fi

fi

fi

rm -fr /tmp/backemerg*

exit

