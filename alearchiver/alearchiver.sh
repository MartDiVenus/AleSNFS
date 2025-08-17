#!/bin/bash




rm -fr /tmp/backemergPseudoOptions

mkdir /tmp/backemergPseudoOptions

rm -fr /tmp/backemergPseudoOptionsSchemi

mkdir /tmp/backemergPseudoOptionsSchemi

### <-c> sta per <comprimere>; 
### <-d> sta per <destinazione del file compresso o del contenuto estratto.
### <-u> sta per <estrazione>.

### Siccome l'opzione <-c> non può esistere insieme alla <-u>, avrò al massimo
## due opzioni allo stesso tempo: <<<-c> e <-d>>> o <<<-u> e <-d>>>.

## Possibile opzione (-c o -ct o -ctx o -cz o -cj) -u o -d
leggo1="$(echo $1 > /tmp/backemergPseudoOptions/01)"

## Possibile opzione  (-c o -ct o -ctx o -cz o -cj) o -u o -d
leggo2="$(echo $2 > /tmp/backemergPseudoOptions/02)"

## Possibile opzione  (-c o -ct o -ctx o -cz o -cj) o -u o -d
leggo3="$(echo $3 > /tmp/backemergPseudoOptions/03)"

## Target: percorso e nome del file
leggo4="$(echo $4 >  /tmp/backemergPseudoOptions/04)"



rileggoInput1="$(cat /tmp/backemergPseudoOptions/01 2> /dev/null)"

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
	echo " "
	echo " "
		echo "Name: Alearchiver"
		echo "Goal: To compress and to extract Alessandra's photos too. "
		echo "Version: backemerg-4.2.0"
		echo " "
echo "help				         			-h"
echo " "
echo "Whithout options: full interactive mode."
echo "target file or target dir					--f='Value'"
echo "Compression				 			-c"
echo "tar compression				 			-ct"
echo "tar.xz compression 	  	 	 			-ctx"
echo "zip compression				 			-cz"
echo "jar compression				 			-cj"
echo "(rar, zip, tar, tar.xz, jar) Extraction	 			-u"
echo "compression path or extraction path	 			--d='Value'"
echo " "
echo "Usage:
alearchiver -option ... --option=<Value> --f=targetFile/Dir"
echo " "
echo "Condition #1: you have to not type the final </> to targetDir, of course:
e.g.
right: alearchiver --d=. -cz /home/user/list
wrong: alearchiver --d=. -cz /home/user/list/"
echo " "
echo "Usage examples:

~\$> alearchiver

~\$> alearchiver -c --f=*


~\$> alearchiver -c --f=*.pdf


~\$> alearchiver -c --f=a*


# Usage of wildcard *

~\$> ls spedizioni
spedizioni/spedizioni
~\$> alearchiver -cz --f=spe* --d=.

You can use * because folder has the same name of its file.

~\$> ls spedizioni
spedizioni/spedizioni.txt
~\$> alearchiver -cz --f=spedizioni --d=.

You can't use * because folder has not the same name of its file,
i.e. file has the extension.




~\$> alearchiver -c --f=b.txt
~\$> alearchiver -c --f=/tmp/b.txt

~\$> alearchiver -ct --f=b.txt
~\$> alearchiver -ct --f=/tmp/b.txt

~\$> alearchiver -ctx --f=b
~\$> ...

~\$> alearchiver -cz --f=b.txt
~\$> ...

~\$> alearchiver -cj --f=b
~\$> ...

~\$> alearchiver -u --f=b.txt
~\$> alearchiver -u --f=/tmp/b.txt

~\$> alearchiver -c --d=/home/user --f=b.txt
~\$> alearchiver --d=/home/user -c --f=b.txt
~\$> alearchiver --d=. -c --f=b.txt
~\$> alearchiver -c --d=. --f=b.txt

~\$> alearchiver -ct --d=/home/user --f=b.txt
~\$> alearchiver --d=/home/user -ct --f=b.txt
~\$> alearchiver --d=. -ct --f=/tmp/b.txt
...

~\$> alearchiver -ctx --d=/home/user --f=b
~\$> alearchiver --d=/home/user -ctx --f=b
~\$> alearchiver --d=. -ctx --f=b
...

~\$\> alearchiver -cz --d=/home/user --f=/tmp/b.txt
~\$\> alearchiver --d=/home/user -cz --f=b.txt
~\$\> alearchiver --d=. -cz --f=b.txt
...

~\$> alearchiver -cj --d=/home/user --f=b
~\$> alearchiver --d=/home/user -cj --f=b
~\$> alearchiver --d=. -cj --f=b
...

~\$> alearchiver -u --d=/tmp/B --f=b.txt
~\$> alearchiver --d=/tmp/B -u --f=b.txt
~\$> alearchiver --d=. -u --f=/tmp/b.txt
...


Author: Mario Fantini (marfant7@gmail.com)

Copyright:
Copyright (C) 2023.08.29 Mario Fantini (marfant7@gmail.com).
Bash copyright applies to its Mario Fantini's pseudo options usage.
GNU copyright applies to its Mario Fantini's GNU tools usage.
VIM copyright applies to its Mario Fantini's VIM usage.
And so on.
"

rm -fr /tmp/backemerg*

exit

fi

	for a in $(ls /tmp/backemergPseudoOptions/)

do
	stat --format %s /tmp/backemergPseudoOptions/$a > /tmp/backemergInputStat

leggoBytes=$(cat /tmp/backemergInputStat)

if test $leggoBytes -eq 1

then

	rm /tmp/backemergPseudoOptions/$a

fi

done

### Per sapere a quale input corrisponde il targetFile, ossia il file da comprimere
## o da estrarre, uso tale metodo con ls e tail; essendoci la condizione di esprimere
## il targetFile come ultimo input, allora esso sarà l'ultimo nell'elenco stampato da ls.
##	Avrei in alternativa al suddetto metodo dell'ordine, potuto sfruttare l'opzione
## <-fTargetFile> e usare <grep "^f" ...> come faccio con l'opzione <-dValue>; ma ho
## preferito variare nelle tecniche avendone tre: opzioni senza valore, opzioni con 
## valore, ordine degli input.

#ls -1 /tmp/backemergPseudoOptions/  | tail -n 1 > /tmp/backemergNTarget 

#leggoNTarget=$(cat /tmp/backemergNTarget)


for a in $(ls /tmp/backemergPseudoOptions/)

do

	grep "^--f=" /tmp/backemergPseudoOptions/$a > /tmp/alearchiverTargetFileOp

	stat --format %s /tmp/alearchiverTargetFileOp > /tmp/alearchiverTargetFileBytes

	leggoBytes=$(cat /tmp/alearchiverTargetFileBytes)

	if test $leggoBytes -gt 1

	then

		cat /tmp/backemergPseudoOptions/$a | sed 's/--f=//g' > /tmp/backemergNTarget

		## ok read -p "testing /tmp/backemergNTarget" EnterNull

	fi

done

if [ -f /tmp/backemergNTarget ]; then

	for a in $(ls /tmp/backemergPseudoOptions/)

do
	rileggoA="$(cat /tmp/backemergPseudoOptions/$a)"

## questo sarà letto da pseudoOpComprimi.sh o /pseudoOpEstrai.sh
#rileggo2="$(cat /tmp/backemergTarget)"

cat /tmp/backemergPseudoOptions/$a | grep "^--d="  > /tmp/backemergAlearchiver01

stat --format %s /tmp/backemergAlearchiver01 > /tmp/backemergAlearchiver01Stat


leggoBytes=$(cat /tmp/backemergAlearchiver01Stat)

## test

#read -p "dovrei avere /tmp/backemergAlearchiver01 maggiore di 0 in bytes" EnterNull 

if test $leggoBytes -gt 0

then

	### schema 1: d 

echo "d" > /tmp/backemergPseudoOptionsSchemi/d

## testing ok
#read -p "leggi  /tmp/backemergPseudoOptionsSchemi/d" EnterNull

cat /tmp/backemergAlearchiver01 | sed 's/--d=//g' > /tmp/backemergOptionD

leggoOptionD="$(cat /tmp/backemergOptionD)"

if test $leggoOptionD == "."

then
	echo $PWD > /tmp/backemergOptionD
fi

## testing ok
#read -p "leggi  /tmp/backemergOptionD" EnterNull


fi


if test $rileggoA == "-c"

then

	echo "c" > /tmp/backemergPseudoOptionsSchemi/c
fi

if test $rileggoA == "-ct"

then

	echo "ct" > /tmp/backemergPseudoOptionsSchemi/ct
fi


if test $rileggoA == "-ctx"

then

	echo "ctx" > /tmp/backemergPseudoOptionsSchemi/ctx
fi

if test $rileggoA == "-cz"

then

	echo "cz" > /tmp/backemergPseudoOptionsSchemi/cz

fi

if test $rileggoA == "-cj"

then

	echo "cj" > /tmp/backemergPseudoOptionsSchemi/cj
fi


if test $rileggoA == "-u"

then
	echo "u" > /tmp/backemergPseudoOptionsSchemi/u

	## testing ok
	#read -p "dovrei avere /tmp/backemergPseudoOptionsSchemi/u" EnterNull

fi


done


#### Test ok
## read -p "sono arrivato qui" EnterNull




### Comparazione schemi

ls -1 /tmp/backemergPseudoOptionsSchemi/ > /tmp/backemergPseudoOptionsSchema

leggoSchema="$(cat /tmp/backemergPseudoOptionsSchema)"

## ok solo se lo specifico così
#/home/mart/test/c.sh

for b in $(ls /usr/local/lib/backemerg/alearchiver/schemiRiferimento/)

do

leggoSchemaRiferimento="$(cat /usr/local/lib/backemerg/alearchiver/schemiRiferimento/$b)"

comm -3 /tmp/backemergPseudoOptionsSchema /usr/local/lib/backemerg/alearchiver/schemiRiferimento/$b > /tmp/backemergComm

stat --format %s /tmp/backemergComm > /tmp/backemergSchemaCommBytes

leggoBytesCommSchema=$(cat /tmp/backemergSchemaCommBytes)


if test $leggoBytesCommSchema -eq 0

then
	## testing ok
	#read -p "testing 370
	#ls /usr/local/lib/backemerg/alearchiver/schemi/$b.sh
	#$(ls /usr/local/lib/backemerg/alearchiver/schemi/$b.sh)
	#" EnterNull
	
	/usr/local/lib/backemerg/alearchiver/schemi/$b.sh



	rm -r /tmp/alearchiver*

        rm -r /tmp/backemerg*

exit

fi

## metodo alternativo ma più congestionante
#if test $leggoSchemaRiferimento == $leggoSchema

#then

	### test ok
#	read -p "Ho scritto /usr/local/lib/backemerg/alearchiver/schemi/\$b.sh?
#/usr/local/lib/backemerg/alearchiver/schemi/$b.sh



#fi

done

else
	### full Interactive mode 

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

function ask1_user() {    

echo -e "Scegli la modalità di alearchiver: 

a) comprimi

b) estrai

"



read -e -p "Digita la lettera associata alla tua risposta e premi Enter.
:" choice

if [ "$choice" == "a" ]; then
  
   /usr/local/lib/backemerg/alearchiver/schemi/fullInteractive/compressione/comprimi.sh

elif [ "$choice" == "b" ]; then

     /usr/local/lib/backemerg/alearchiver/schemi/fullInteractive/estrazione/estrai.sh

else

    echo "Select a, b." && sleep 3
    clear && ask1_user

fi
}

ask1_user

fi



rm -fr /tmp/alearchiver*

#rm -fr /tmp/backemerg*


exit




