#!/bin/bash

rm -fr /tmp/alearchiver*

rm -fr /tmp/backemerg*


mkdir /tmp/backemergPseudoOptionsSchemi

### <-c> sta per <comprimere>; 
### <-d> sta per <destinazione del file compresso o del contenuto estratto.
### <-u> sta per <estrazione>.

echo ""$*"" > /tmp/alearchiver-options00

cat /tmp/alearchiver-options00 | sed 's/-/dirin/g' > /tmp/alearchiver-optionsAwk

awk '
{
    for (i = 1; i <= NF; i++) {
        if(NR == 1) {
            s[i] = $i;
        } else {
            s[i] = s[i] " " $i;
        }
    }
}
END {
    for (i = 1; s[i] != ""; i++) {
        print s[i];
    }
}' /tmp/alearchiver-optionsAwk > /tmp/alearchiver-options0

cat /tmp/alearchiver-options0  | sed 's/dirin/-/g' > /tmp/alearchiver-options



grep "^-h" /tmp/alearchiver-options > /tmp/alearchiver-optionsHelp00

stat --format %s /tmp/alearchiver-optionsHelp00 > /tmp/alearchiver-optionsHelp00Bytes

leggoBytes=$(cat /tmp/alearchiver-optionsHelp00Bytes)

#	read -p "testing loop" EnterNull
if test $leggoBytes -gt 0

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
echo
echo
echo
echo "zip compression				 			-cz"
echo
echo "zip encryption by interactive prompt
with double verification, password is not displayed
on stdout							     -cz -e"
echo
echo "zip encryption by interactive prompt
without double verification, password is not displayed
on stdout							     -cz -P -s"

echo
echo "zip encryption by interactive prompt
without double verification, password is displayed
on stdout							     -cz -P"

echo
echo "zip encryption supplying path and name
of password file						
						  -cz --p=passwordFilePathName"

						  
echo
echo "zip encryption supplying path and name
of password file, and destroying it at the end					
					-cz --p=passwordFilePathName -destroy"
						  
echo
echo
echo


echo "jar compression				 			-cj"
echo
echo
echo "(rar, zip, tar, tar.xz, jar) Extraction	 			-u"
echo "compression path or extraction path	 			--d='Value'"
echo " "

echo
echo
echo "Remove:								-remove
a) not compressed file or directory at the end, in case of compression
b) compressed file at the end, in case of decompression"
echo
echo
echo

echo
echo "zip decryption by interactive prompt
without double verification, password is not displayed
on stdout							     -u -P -s"

echo
echo "zip decryption by interactive prompt
without double verification, password is displayed
on stdout							     -u -P"

echo
echo "zip decryption supplying path and name
of password file						
						  -u --p=passwordFilePathName"

						  
echo
echo "zip decryption supplying path and name
of password file, and destroying it at the end					
					-u --p=passwordFilePathName -destroy"
						  
echo
echo
echo
echo "Usage:
ale -option ... --option=<Value> --f=targetFile/Dir"
echo " "
echo "Condition #1: you have to not type the final </> to targetDir, of course:
e.g.
right: ale --d=. -cz /home/user/list
wrong: ale --d=. -cz /home/user/list/"
echo " "
echo "Usage examples:

~\$> ale

~\$> ale -c --f=*


~\$> ale -c --f=*.pdf


~\$> ale -c --f=a*


# Usage of wildcard *

~\$> ls spedizioni
spedizioni/spedizioni
~\$> ale -cz --f=spe* --d=.

You can use * because folder has the same name of its file.

~\$> ls spedizioni
spedizioni/spedizioni.txt
~\$> ale -cz --f=spedizioni --d=.

You can't use * because folder has not the same name of its file,
i.e. file has the extension.




~\$> ale -c --f=b.txt
~\$> ale -c --f=/tmp/b.txt

~\$> ale -ct --f=b.txt
~\$> ale -ct --f=/tmp/b.txt

~\$> ale -ctx --f=b
~\$> ...

~\$> ale -cz --f=b.txt
~\$> ...

~\$> ale -cj --f=b
~\$> ...

~\$> ale -u --f=b.txt
~\$> ale -u --f=/tmp/b.txt

~\$> ale -c --d=/home/user --f=b.txt
~\$> ale --d=/home/user -c --f=b.txt
~\$> ale --d=. -c --f=b.txt
~\$> ale -c --d=. --f=b.txt

~\$> ale -ct --d=/home/user --f=b.txt
~\$> ale --d=/home/user -ct --f=b.txt
~\$> ale --d=. -ct --f=/tmp/b.txt
...

~\$> ale -ctx --d=/home/user --f=b
~\$> ale --d=/home/user -ctx --f=b
~\$> ale --d=. -ctx --f=b
...

~\$\> ale -cz --d=/home/user --f=/tmp/b.txt
~\$\> ale --d=/home/user -cz --f=b.txt
~\$\> ale --d=. -cz --f=b.txt
...

~\$> ale -cz -e --f=/home/mart/test2 --d=.

~\$> ale -cz -P --f=/home/mart/test2 --d=.
~\$> ale -cz -P -s --f=/home/mart/test2 --d=.

~\$> ale -cz --p=/tmp/password --f=/home/mart/test2 --d=.
~\$> ale -cz --p=/tmp/password -destroy --f=/home/mart/test2 --d=.
...


~\$> ale -cj --d=/home/user --f=b
~\$> ale --d=/home/user -cj --f=b
~\$> ale --d=. -cj --f=b
...



~\$> ale -u --d=/tmp/B --f=b.txt.zip
~\$> ale --d=/tmp/B -u --f=b.txt.zip
~\$> ale --d=. -u --f=/tmp/b.txt.zip
...

~\$> ale -u -P --f=/home/mart/test2.zip --d=.
~\$> ale -u -P -s --f=/home/mart/test2.zip --d=.

~\$> ale -u --p=/tmp/password --f=/home/mart/test2.zip --d=.
~\$> ale -u --p=/tmp/password -destroy --f=/home/mart/test2.zip --d=.
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


	grep "^--f=" /tmp/alearchiver-options > /tmp/alearchiverTargetFileOp

	stat --format %s /tmp/alearchiverTargetFileOp > /tmp/alearchiverTargetFileBytes

	leggoBytes=$(cat /tmp/alearchiverTargetFileBytes)

	if test $leggoBytes -gt 0

	then

		cat /tmp/alearchiverTargetFileOp | sed 's/--f=//g' > /tmp/backemergNTarget

		## ok read -p "testing /tmp/backemergNTarget" EnterNull

	fi

if [ -f /tmp/backemergNTarget ]; then

grep "^--d=" /tmp/alearchiver-options > /tmp/alearchiverDest

	stat --format %s /tmp/alearchiverDest > /tmp/alearchiverDestBytes

	leggoBytes=$(cat /tmp/alearchiverDestBytes)

## test

#read -p "dovrei avere /tmp/backemergAlearchiver01 maggiore di 0 in bytes" EnterNull 

if test $leggoBytes -gt 0

then

	### schema 1: d 

echo "d" > /tmp/backemergPseudoOptionsSchemi/d

## testing ok
#read -p "leggi  /tmp/backemergPseudoOptionsSchemi/d" EnterNull

cat /tmp/alearchiverDest | sed 's/--d=//g' > /tmp/backemergOptionD

leggoOptionD="$(cat /tmp/backemergOptionD)"

if test $leggoOptionD == "."

then

	echo $PWD > /tmp/backemergOptionD

fi

## testing ok
#read -p "leggi  /tmp/backemergOptionD" EnterNull


fi

for compressione in {1}

do

grep "^-c$" /tmp/alearchiver-options > /tmp/alearchiverC

	stat --format %s /tmp/alearchiverC > /tmp/alearchiverCBytes

	leggoBytes=$(cat /tmp/alearchiverCBytes)

if test $leggoBytes -gt 0

then

	echo "c" > /tmp/backemergPseudoOptionsSchemi/c

	break
fi



grep "^-ct$" /tmp/alearchiver-options > /tmp/alearchiverCt

	stat --format %s /tmp/alearchiverCt > /tmp/alearchiverCtBytes

	leggoBytes=$(cat /tmp/alearchiverCtBytes)

if test $leggoBytes -gt 0

then

	echo "ct" > /tmp/backemergPseudoOptionsSchemi/ct

	break
fi


grep "^-ctx" /tmp/alearchiver-options > /tmp/alearchiverCtx

	stat --format %s /tmp/alearchiverCtx > /tmp/alearchiverCtxBytes

	leggoBytes=$(cat /tmp/alearchiverCtxBytes)

if test $leggoBytes -gt 0

then

	echo "ctx" > /tmp/backemergPseudoOptionsSchemi/ctx

	break
fi



grep "^-cz" /tmp/alearchiver-options > /tmp/alearchiverCz

	stat --format %s /tmp/alearchiverCz > /tmp/alearchiverCzBytes

	leggoBytes=$(cat /tmp/alearchiverCzBytes)

if test $leggoBytes -gt 0

then

	
## encrypt o password
#

for encrypt in {1}

do

	grep "^-e" /tmp/alearchiver-options > /tmp/alearchiverCz-e

	stat --format %s /tmp/alearchiverCz-e > /tmp/alearchiverCz-eBytes

	leggoBytes=$(cat /tmp/alearchiverCz-eBytes)

if test $leggoBytes -gt 0

then

	echo "cze" > /tmp/backemergPseudoOptionsSchemi/cze

	break

fi

	grep "^--p=" /tmp/alearchiver-options > /tmp/alearchiverCz-p

	stat --format %s /tmp/alearchiverCz-p > /tmp/alearchiverCz-pBytes

	leggoBytes=$(cat /tmp/alearchiverCz-pBytes)


if test $leggoBytes -gt 0

then

	echo "czp" > /tmp/backemergPseudoOptionsSchemi/czp

	
		cat /tmp/alearchiverCz-p | sed 's/--p=//g' > /tmp/alearchiverPasswordFile01

	break

fi

	grep "^-P$" /tmp/alearchiver-options > /tmp/alearchiverCz-P

	stat --format %s /tmp/alearchiverCz-P > /tmp/alearchiverCz-PBytes

	leggoBytes=$(cat /tmp/alearchiverCz-PBytes)

if test $leggoBytes -gt 0

then

	echo "czP" > /tmp/backemergPseudoOptionsSchemi/czP

else

	echo "cz" > /tmp/backemergPseudoOptionsSchemi/cz


	break

fi

done


break

fi


grep "^-cj" /tmp/alearchiver-options > /tmp/alearchiverCj

	stat --format %s /tmp/alearchiverCj > /tmp/alearchiverCjBytes

	leggoBytes=$(cat /tmp/alearchiverCjBytes)

if test $leggoBytes -gt 0

then

	echo "cj" > /tmp/backemergPseudoOptionsSchemi/cj

	break
fi


done


grep "^-u" /tmp/alearchiver-options > /tmp/alearchiverU

	stat --format %s /tmp/alearchiverU > /tmp/alearchiverUBytes

	leggoBytes=$(cat /tmp/alearchiverUBytes)

if test $leggoBytes -gt 0

then

	for decrypt in {1}

	do

	grep "^--p=" /tmp/alearchiver-options > /tmp/alearchiverUz-p

	stat --format %s /tmp/alearchiverUz-p > /tmp/alearchiverUz-pBytes

	leggoBytes=$(cat /tmp/alearchiverUz-pBytes)


if test $leggoBytes -gt 0

then

	echo "uzp" > /tmp/backemergPseudoOptionsSchemi/uzp

	
		cat /tmp/alearchiverUz-p | sed 's/--p=//g' > /tmp/alearchiverPasswordFile01

	break

fi

	grep "^-P$" /tmp/alearchiver-options > /tmp/alearchiverUz-P

	stat --format %s /tmp/alearchiverUz-P > /tmp/alearchiverUz-PBytes

	leggoBytes=$(cat /tmp/alearchiverUz-PBytes)

if test $leggoBytes -gt 0

then

	echo "uzP" > /tmp/backemergPseudoOptionsSchemi/uzP

else

	echo "u" > /tmp/backemergPseudoOptionsSchemi/u


	break

fi

done

	## testing ok
	#read -p "dovrei avere /tmp/backemergPseudoOptionsSchemi/u" EnterNull

fi




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
	
#read -p "testing 457
#leggoSchemaRiferimento = $leggoSchemaRiferimento
#	" EnterNull

comm -3 /tmp/backemergPseudoOptionsSchema /usr/local/lib/backemerg/alearchiver/schemiRiferimento/$b > /tmp/backemergComm

stat --format %s /tmp/backemergComm > /tmp/backemergSchemaCommBytes

leggoBytesCommSchema=$(cat /tmp/backemergSchemaCommBytes)

#read -p "testing 467
#" EnterNull

if test $leggoBytesCommSchema -eq 0

then
	## testing ok
#	read -p "testing 472
#	ls /usr/local/lib/backemerg/alearchiver/schemi/$b.sh
#	$(ls /usr/local/lib/backemerg/alearchiver/schemi/$b.sh)
#	" EnterNull
	
	/usr/local/lib/backemerg/alearchiver/schemi/$b.sh

	rm -fr /tmp/alearchiver*

        rm -fr /tmp/backemerg*

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

rm -fr /tmp/backemerg*


exit




