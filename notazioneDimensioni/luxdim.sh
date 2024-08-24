#!/bin/bash

### Uso 
## e.g. per stampare le dimensioni in forma scientifica di 
## /usr/local/lib/pdflux/B/B3/3/LaTeX/02-guide/01-guida_ufficiale/LaTeX.pdf
##
## ~$> luxDim /usr/local/lib/pdflux/B/B3/3/LaTeX/02-guide/01-guida_ufficiale/LaTeX.pdf


## Notazione espressa scientificamente (notazione internazinale):
## virgola ogni migliaia di bytes, quindi ogni tre cifre.

rm -fr /tmp/backemerg*
rm -fr /tmp/luxdim*
rm -f /tmp/inputLux*

leggo1=$(echo $1 > /tmp/inputLuxDim01)

leggo2=$(echo $2 > /tmp/inputLuxDim02)

rm -f /tmp/outluxdim

touch /tmp/outluxdim


rileggoInput1="$(cat /tmp/inputLuxDim01)"

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
Name: Luxdim"
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
echo "target file	 						--f=<Value>"
echo "input file	 						--i=<Value>"
echo "Sum of file sizes						--i=<Value>"

echo " "
echo "Usage:
luxdim -option --f=<Value>"
echo " "
echo "e.g.:

luxdim --f=*

luxdim -b --f=*
...


luxdim --f=*.pdf

luxdim --f=/home/user/*.pdf

luxdim -m --f=*.pdf
...

luxdim -m --f=/home/user/*.pdf
...


luxdim  --f=a*
...

luxdim --f=/home/user/a*
...

luxdim -b --f=a*
...

luxdim -b --f=/home/user/a*
...


luxdim --f=/home/user/a.ps

luxdim -b --f=/tmp/a.txt
...

luxdim -k --f=/tmp/a.txt
...

luxdim -m --f=/home/user/b.pdf
...

luxdim -g --f=/home/user/c.iso
...


input file (e.g. 'list.txt') must have written one file for line;
e.g.
cat list.txt
a.txt
b.txt

luxdim --i=/home/usr/list.txt


Output is written on stdout and in:
/tmp/outluxdim			(single file)

/tmp/outIluxdim			(more files / addends of sum)

/tmp/outSommaIluxdim		(sum)




https://github.com/MartDiVenus/AleSNFS/notazioneDimensioni
https://youtu.be/wXrcPyFcFG0

Copyright:
Copyright (C) 2023.10.03 Mario Fantini (marfant7@gmail.com).
Bash copyright applies to its Mario Fantini's pseudo options usage.
GNU copyright applies to its Mario Fantini's GNU tools usage.
And so on.
"

rm -f /tmp/inputLux*

exit

fi



rm -fr /tmp/luxdim

### Ho sostituito, per le immissioni e alcune sostituzioni, VIM con SED perché il II
## è migliore di VIM per tale scopo. In alcuni casi (sistemi/pc)
## VIM potrebbe richiedere l'immissione manuale da parte dell'utente, eventualità da evitare
## ovviamente.
#
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

echo "1" > /tmp/luxdim01

echo "0.000,000,00" > /tmp/luxdimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

echo "0.000,00" > /tmp/luxdimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega

echo "0.00" > /tmp/luxdimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo
fi

### 10 bytes

if test $leggoNCifre -eq 2
then

echo "1" > /tmp/luxdim01

echo "0.000,000,0" > /tmp/luxdimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga


echo "0.000,0" > /tmp/luxdimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega


echo "0.0" > /tmp/luxdimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

fi

## 100 bytes
if test $leggoNCifre -eq 3
then

echo "1" > /tmp/luxdim01

echo "0.000,000," > /tmp/luxdimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

echo "0.000," > /tmp/luxdimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega

echo "0." > /tmp/luxdimPrefissoKilo

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


echo "4" > /tmp/luxdim04

echo "0.000,00" > /tmp/luxdimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga


echo "0.00" > /tmp/luxdimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega


echo "" > /tmp/luxdimPrefissoKilo

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


echo "5" > /tmp/luxdim05

echo "0.000,0" > /tmp/luxdimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

echo "0.0" > /tmp/luxdimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega

echo "" > /tmp/luxdimPrefissoKilo

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

echo "6" > /tmp/luxdim06

echo "0.000," > /tmp/luxdimPrefissoGiga

cp /tmp/backemerg-stat /tmp/backemerg-statGiga

echo "0." > /tmp/luxdimPrefissoMega

cp /tmp/backemerg-stat /tmp/backemerg-statMega

echo "" > /tmp/luxdimPrefissoKilo

cp /tmp/backemerg-stat /tmp/backemerg-statKilo

vi -c "%s/,/./" /tmp/backemerg-statKilo -c :w -c :q 


fi




### 1 MB o 10 MB 0 100 MB

## 1 MB
## e.g. 4580540

if test $leggoNCifre -eq 7

then

	echo "7" > /tmp/luxdim07

	echo "0.00" > /tmp/luxdimPrefissoGiga

echo "" > /tmp/luxdimPrefissoMega

echo "" > /tmp/luxdimPrefissoKilo

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
	echo "8" > /tmp/luxdim08

		echo "0.0" > /tmp/luxdimPrefissoGiga

echo "" > /tmp/luxdimPrefissoMega

echo "" > /tmp/luxdimPrefissoKilo


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
	echo "9" > /tmp/luxdim09

			echo "0." > /tmp/luxdimPrefissoGiga

echo "" > /tmp/luxdimPrefissoMega

echo "" > /tmp/luxdimPrefissoKilo

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
		echo "10" > /tmp/luxdim10

			echo "" > /tmp/luxdimPrefissoGiga

	echo "" > /tmp/luxdimPrefissoMega

	echo "" > /tmp/luxdimPrefissoKilo


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

		echo "11" > /tmp/luxdim1

			echo "" > /tmp/luxdimPrefissoGiga

echo "" > /tmp/luxdimPrefissoMega

echo "" > /tmp/luxdimPrefissoKilo

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
	echo "12" > /tmp/luxdim12

		echo "" > /tmp/luxdimPrefissoGiga

echo "" > /tmp/luxdimPrefissoMega

echo "" > /tmp/luxdimPrefissoKilo

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


mkdir /tmp/luxdim

cp /tmp/inputLuxDim01  /tmp/luxdim

cp /tmp/inputLuxDim02 /tmp/luxdim

for a in $(ls /tmp/luxdim)

do

	grep "^--f=" /tmp/luxdim/$a > /tmp/luxdimTargetFileOp

	stat --format %s /tmp/luxdimTargetFileOp > /tmp/luxdimTargetFileBytes

	leggoBytes=$(cat /tmp/luxdimTargetFileBytes)

	if test $leggoBytes -gt 1

	then

		cat /tmp/luxdim/$a | sed 's/--f=//g' > /tmp/luxdimTargetFile

		pathNameFile="$(cat /tmp/luxdimTargetFile)"

	fi

	grep "^--i=" /tmp/luxdim/$a > /tmp/luxdimTargetFileOp

	stat --format %s /tmp/luxdimTargetFileOp > /tmp/luxdimTargetFileBytes

	leggoBytes=$(cat /tmp/luxdimTargetFileBytes)

	if test $leggoBytes -gt 1

	then

		cat /tmp/luxdim/$a | sed 's/--i=//g' > /tmp/luxdimTargetFile

		pathNameFile="$(cat /tmp/luxdimTargetFile)"

		cp $pathNameFile /tmp/Iluxdim-IMarked

		/usr/local/lib/backemerg/notazioneDimensioni/iluxdim.sh

		exit

	fi

	grep "^-b" /tmp/luxdim/$a > /tmp/luxdimTargetFileOp

	stat --format %s /tmp/luxdimTargetFileOp > /tmp/luxdimTargetFileBytes

	leggoBytes=$(cat /tmp/luxdimTargetFileBytes)

	if test $leggoBytes -gt 1

	then

	option=$(cat /tmp/luxdim/$a)

		echo $option > /tmp/luxdimOption

	fi

	grep "^-k" /tmp/luxdim/$a > /tmp/luxdimTargetFileOp

	stat --format %s /tmp/luxdimTargetFileOp > /tmp/luxdimTargetFileBytes

	leggoBytes=$(cat /tmp/luxdimTargetFileBytes)

	if test $leggoBytes -gt 1

	then

	option=$(cat /tmp/luxdim/$a)

		echo $option > /tmp/luxdimOption

	fi

	grep "^-m" /tmp/luxdim/$a > /tmp/luxdimTargetFileOp

	stat --format %s /tmp/luxdimTargetFileOp > /tmp/luxdimTargetFileBytes

	leggoBytes=$(cat /tmp/luxdimTargetFileBytes)

	if test $leggoBytes -gt 1

	then

	option=$(cat /tmp/luxdim/$a)

		echo $option > /tmp/luxdimOption

	fi

	grep "^-g" /tmp/luxdim/$a > /tmp/luxdimTargetFileOp

	stat --format %s /tmp/luxdimTargetFileOp > /tmp/luxdimTargetFileBytes

	leggoBytes=$(cat /tmp/luxdimTargetFileBytes)

	if test $leggoBytes -gt 1

	then

	option=$(cat /tmp/luxdim/$a)

		echo $option > /tmp/luxdimOption

	fi



done


pathNameFile="$(cat /tmp/luxdimTargetFile)"

grep "*" /tmp/luxdimTargetFile > /tmp/luxdimOneOrWildcard

stat --format %s /tmp/luxdimOneOrWildcard > /tmp/luxdimOneOrWildcardBytes

leggoBytes=$(cat /tmp/luxdimOneOrWildcardBytes)

#### I if
if test ! $leggoBytes -gt 0

then

stat --format %s $pathNameFile > /tmp/backemerg-stat

wc -L /tmp/backemerg-stat | awk '$1 > 0 {print $1}' > /tmp/backemerg-wcL
##9

leggoNCifre=$(cat /tmp/backemerg-wcL)

cifre

### fine primo blocco cifre ()

if [ -f /tmp/luxdimOption ]; then 

	cat /tmp/luxdimOption | sed 's/-//g' > /tmp/luxdimOptionLess

leggoOptionLess="$(cat /tmp/luxdimOptionLess)"

if test $leggoOptionLess == "g"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoGiga)"
echo " "
echo "$pathNameFile"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"
echo " "
echo "$pathNameFile"  | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes" | tee -a /tmp/outluxdim &> /dev/null

fi

if test $leggoOptionLess == "m"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoMega)"
echo " "
echo "$pathNameFile"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
echo "$pathNameFile"  | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes" | tee -a /tmp/outluxdim &> /dev/null

fi

if test $leggoOptionLess == "k"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoKilo)"

echo " "
echo "$pathNameFile"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes"
echo " "

echo "$pathNameFile"  | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes" | tee -a /tmp/outluxdim &> /dev/null
fi

if test $leggoOptionLess == "b"

then

echo "$pathNameFile"
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
echo "$pathNameFile"  | tee -a /tmp/outluxdim &> /dev/null
echo "$(cat /tmp/backemerg-stat) bytes" | tee -a /tmp/outluxdim &> /dev/null
fi

else

	## default mode
echo " "
echo " "
echo "$pathNameFile"
echo " "
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
leggoPrefissoMega="$(cat /tmp/luxdimPrefissoKilo)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes"

echo " "
leggoPrefissoMega="$(cat /tmp/luxdimPrefissoMega)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoGiga)"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"

echo " "

echo "$pathNameFile
$(cat /tmp/backemerg-stat) bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes
$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes
" | tee -a /tmp/outluxdim &> /dev/null


fi

exit

fi


## file selezionati con *. 	e.g. *.pdf OK
grep "*\." /tmp/luxdimTargetFile > /tmp/luxdimOneOrWildcardDot

stat --format %s /tmp/luxdimOneOrWildcardDot > /tmp/luxdimOneOrWildcardDotBytes

leggoBytes=$(cat /tmp/luxdimOneOrWildcardDotBytes)

## II if 
if test $leggoBytes -gt 0

then

cat /tmp/luxdimTargetFile | sed 's/*.*//g' > /tmp/luxdimOneOrWildcardDotFolder

leggoWildcardDotFolder="$(cat /tmp/luxdimOneOrWildcardDotFolder)"


cat /tmp/luxdimTargetFile | sed 's/$leggoWildcardDotFolder//g' > /tmp/luxdimTargetFileIsolato

cat /tmp/luxdimTargetFileIsolato | cut -d. -f2,2 > /tmp/luxdimOneOrWildcardEstensione

leggoEstensione="$(cat /tmp/luxdimOneOrWildcardEstensione)"

stat --format %s /tmp/luxdimOneOrWildcardDotFolder > /tmp/luxdimOneOrWildcardDotFolderBytes

leggoBytes=$(cat /tmp/luxdimOneOrWildcardDotFolderBytes)

if test $leggoBytes -gt 1

then

ls $leggoWildcardDotFolder*.$leggoEstensione > /tmp/luxdimOneOrWildcardDotList

else

ls *.$leggoEstensione > /tmp/luxdimOneOrWildcardDotList

fi

rm -fr /tmp/luxdimOneOrWildcardDotSplit

mkdir /tmp/luxdimOneOrWildcardDotSplit

split -l1 /tmp/luxdimOneOrWildcardDotList /tmp/luxdimOneOrWildcardDotSplit/


for c in $(ls /tmp/luxdimOneOrWildcardDotSplit)

	## I do
do
	pathNameFileWildcardDot="$(cat /tmp/luxdimOneOrWildcardDotSplit/$c)"

	stat --format %s $pathNameFileWildcardDot > /tmp/backemerg-stat

	wc -L /tmp/backemerg-stat | awk '$1 > 0 {print $1}' > /tmp/backemerg-wcL
##9

	leggoNCifre=$(cat /tmp/backemerg-wcL)

cifre

### fine secondo blocco cifre ()

if [ -f /tmp/luxdimOption ]; then

	cat /tmp/luxdimOption | sed 's/-//g' > /tmp/luxdimOptionLess

leggoOptionLess="$(cat /tmp/luxdimOptionLess)"

if test $leggoOptionLess == "g"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoGiga)"
echo " "
echo "$pathNameFileWildcardDot"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"
echo " "
echo "$pathNameFileWildcardDot" | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes" | tee -a /tmp/outluxdim &> /dev/null

fi

if test $leggoOptionLess == "m"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoMega)"
echo " "
echo "$pathNameFileWildcardDot"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
echo "$pathNameFileWildcardDot" | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes" | tee -a /tmp/outluxdim &> /dev/null

fi

if test $leggoOptionLess == "k"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoKilo)"

echo " "
echo "$pathNameFileWildcardDot"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes"
echo " "
echo "$pathNameFileWildcardDot" | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes" | tee -a /tmp/outluxdim &> /dev/null
fi

if test $leggoOptionLess == "b"

then

echo "$pathNameFileWildcardDot"
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
echo "$pathNameFileWildcardDot" | tee -a /tmp/outluxdim &> /dev/null
echo "$(cat /tmp/backemerg-stat) bytes" | tee -a /tmp/outluxdim &> /dev/null
fi

else

	## default mode
echo " "
echo " "
echo "$pathNameFileWildcardDot"
echo " "
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
leggoPrefissoMega="$(cat /tmp/luxdimPrefissoKilo)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes"

echo " "
leggoPrefissoMega="$(cat /tmp/luxdimPrefissoMega)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoGiga)"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"

echo " "

echo "$pathNameFileWildcardDot
$(cat /tmp/backemerg-stat) bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes
$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes
" | tee -a /tmp/outluxdim &> /dev/null

		## file selezionato con *.estensione
	fi

	## II if chiuso

done

else

	cp /tmp/luxdimTargetFile /tmp/backemerg-fullNameBackup

	## deo sostituire <*> con <specialDirindindin>  perché awk non legge le linee
        # che iniziano con <*>.	
	cat /tmp/luxdimTargetFile | sed 's/*/specialDirindindin/g' > /tmp/backemerg-fullName

        /usr/local/lib/backemerg/trattamentoFiles.sh

	## devo capire se la chiave di selezione è * o e.g. *a
	
	leggoNomeFileIsolato0="$(cat /tmp/backemerg-nomeFileIsolato)"

	cat /tmp/backemerg-nomeFileIsolato | sed 's/specialDirindindin/*/g' > /tmp/backemerg-nomeFileIsolatoWild

	leggoNomeFileIsolato="$(cat /tmp/backemerg-nomeFileIsolatoWild)"

	## questo mi serve se ho e.g. *a, visto che se avessi solo * esiste
	# un espediente [cat /tmp/luxdimOneOrWildcard | sed 's/*//g' > /tmp/luxdimOneOrWildcardFolder]
	# che propongo solo per variare il codice, senza rifarmi 
	# sempre a trattamentoFiles.

	if test "$leggoNomeFileIsolato" == "*"

	then

        ## file selezionati solo con *  
	cat /tmp/luxdimOneOrWildcard | sed 's/*//g' > /tmp/luxdimOneOrWildcardFolder

	leggoWildcardFolder="$(cat /tmp/luxdimOneOrWildcardFolder)"

	ls $leggoWildcardFolder > /tmp/luxdimOneOrWildcardList

	rm -fr /tmp/luxdimOneOrWildcardSplit

	mkdir /tmp/luxdimOneOrWildcardSplit

	split -l1 /tmp/luxdimOneOrWildcardList /tmp/luxdimOneOrWildcardSplit/

	for c in $(ls /tmp/luxdimOneOrWildcardSplit)

	do
		
		leggoC="$(cat /tmp/luxdimOneOrWildcardSplit/$c)"

		pathNameFileWildcard="$leggoWildcardFolder$leggoC"

	#	file $pathNameFileWildcard > /tmp/luxdimFileOrDir00

	#	grep "directory" /tmp/luxdimFileOrDir00 > /tmp/luxdimFileOrDir01
	
		stat --format %s $pathNameFileWildcard > /tmp/backemerg-stat

		wc -L /tmp/backemerg-stat | awk '$1 > 0 {print $1}' > /tmp/backemerg-wcL
##9

		leggoNCifre=$(cat /tmp/backemerg-wcL)

		cifre

		### fine terzo blocco cifre ()

if [ -f /tmp/luxdimOption ]; then

	cat /tmp/luxdimOption | sed 's/-//g' > /tmp/luxdimOptionLess

leggoOptionLess="$(cat /tmp/luxdimOptionLess)"

if test $leggoOptionLess == "g"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoGiga)"
echo " "
echo "$pathNameFileWildcard"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"
echo " "
echo "$pathNameFileWildcard"  | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes" | tee -a /tmp/outluxdim &> /dev/null

fi

if test $leggoOptionLess == "m"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoMega)"
echo " "
echo "$pathNameFileWildcard"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
echo "$pathNameFileWildcard"  | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes" | tee -a /tmp/outluxdim &> /dev/null

fi

if test $leggoOptionLess == "k"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoKilo)"

echo " "
echo "$pathNameFileWildcard"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes"
echo " "
echo "$pathNameFileWildcard"  | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes" | tee -a /tmp/outluxdim &> /dev/null
fi

if test $leggoOptionLess == "b"

then

echo "$pathNameFileWildcard"
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
echo "$pathNameFileWildcard"  | tee -a /tmp/outluxdim &> /dev/null
echo "$(cat /tmp/backemerg-stat) bytes" | tee -a /tmp/outluxdim &> /dev/null
fi

else

	## default mode
echo " "
echo " "
echo "$pathNameFileWildcard"
echo " "
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
leggoPrefissoMega="$(cat /tmp/luxdimPrefissoKilo)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes"

echo " "
leggoPrefissoMega="$(cat /tmp/luxdimPrefissoMega)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoGiga)"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"

echo " "

echo "$pathNameFileWildcard
$(cat /tmp/backemerg-stat) bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes
$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes
" | tee -a /tmp/outluxdim &> /dev/null


			## file selezionato con * con con *.estensione

		fi
	## directory


	done

	else

	## Questa variabile $path mi serve se ho e.g. *a, visto che se avessi solo * esiste
	# un espediente [cat /tmp/luxdimOneOrWildcard | sed 's/*//g' > /tmp/luxdimOneOrWildcardFolder]
	# che propongo solo per variare il codice, senza rifarmi 
	# sempre a trattamentoFiles.

	if [ -f /tmp/backemerg-percorsoIsolato ]; then

		path="$(cat /tmp/backemerg-percorsoIsolato)"

		ls $path/$leggoNomeFileIsolato > /tmp/luxdimOneOrWildcardList0

	else

	ls $leggoNomeFileIsolato > /tmp/luxdimOneOrWildcardList0
	
	fi

	## ls con bla*, se esistono cartelle --- 
	# crea i due pti. a dx delle cartelle, e una linea vuota tra file e cartelle.
	cat /tmp/luxdimOneOrWildcardList0 | sed 's/://g' | sed '/^$/d' > /tmp/luxdimOneOrWildcardList

	rm -fr /tmp/luxdimOneOrWildcardSplit

	mkdir /tmp/luxdimOneOrWildcardSplit

	split -l1 /tmp/luxdimOneOrWildcardList /tmp/luxdimOneOrWildcardSplit/

	for c in $(ls /tmp/luxdimOneOrWildcardSplit)

	do
		
		leggoC="$(cat /tmp/luxdimOneOrWildcardSplit/$c)"

		pathNameFileWildcard="$leggoWildcardFolder$leggoC"

	#	file $pathNameFileWildcard > /tmp/luxdimFileOrDir00

	#	grep "directory" /tmp/luxdimFileOrDir00 > /tmp/luxdimFileOrDir01
	
		stat --format %s $pathNameFileWildcard > /tmp/backemerg-stat

		wc -L /tmp/backemerg-stat | awk '$1 > 0 {print $1}' > /tmp/backemerg-wcL
##9

		leggoNCifre=$(cat /tmp/backemerg-wcL)

cifre 

### fine quarto blocco cifre ()

if [ -f /tmp/luxdimOption ]; then

	cat /tmp/luxdimOption | sed 's/-//g' > /tmp/luxdimOptionLess

leggoOptionLess="$(cat /tmp/luxdimOptionLess)"

if test $leggoOptionLess == "g"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoGiga)"
echo " "
echo "$pathNameFileWildcard"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"
echo " "
echo "$pathNameFileWildcard" | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes" | tee -a /tmp/outluxdim &> /dev/null

fi

if test $leggoOptionLess == "m"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoMega)"
echo " "
echo "$pathNameFileWildcard"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
echo "$pathNameFileWildcard" | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statMega) mega bytes" | tee -a /tmp/outluxdim &> /dev/null

fi

if test $leggoOptionLess == "k"

then

	leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoKilo)"

echo " "
echo "$pathNameFileWildcard"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes"
echo " "
echo "$pathNameFileWildcard" | tee -a /tmp/outluxdim &> /dev/null
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statKilo) kilo bytes" | tee -a /tmp/outluxdim &> /dev/null
fi

if test $leggoOptionLess == "b"

then

echo "$pathNameFileWildcard"
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
echo "$pathNameFileWildcard" | tee -a /tmp/outluxdim &> /dev/null
echo "$(cat /tmp/backemerg-stat) bytes" | tee -a /tmp/outluxdim &> /dev/null
fi

else

	## default mode
echo " "
echo " "
echo "$pathNameFileWildcard"
echo " "
echo "$(cat /tmp/backemerg-stat) bytes"
echo " "
leggoPrefissoMega="$(cat /tmp/luxdimPrefissoKilo)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes"

echo " "
leggoPrefissoMega="$(cat /tmp/luxdimPrefissoMega)"
echo "$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes"
echo " "
leggoPrefissoGiga="$(cat /tmp/luxdimPrefissoGiga)"
echo "$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes"

echo " "

echo "$pathNameFileWildcard
$(cat /tmp/backemerg-stat) bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statKilo) kilo bytes
$leggoPrefissoMega$(cat /tmp/backemerg-statMega) mega bytes
$leggoPrefissoGiga$(cat /tmp/backemerg-statGiga) giga bytes
" | tee -a /tmp/outluxdim &> /dev/null

			## file selezionato con * con con *.estensione

		fi
	## directory


	done


	fi


	## I if chiuso
fi
	

rm -fr /tmp/backemerg*
rm -fr /tmp/luxdim*
rm -f /tmp/inputLux*

exit

