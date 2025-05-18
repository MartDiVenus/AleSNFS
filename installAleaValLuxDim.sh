#!/bin/bash


## Copyright (C) 2019.04.07 Mario Fantini marfant7@gmail.com
## https://martlux.ns0.it:4000/cluster/securing/backemerg

## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You have received a copy of the GNU General Public License
## along with this program in 
## /usr/local/share/doc/backemerg/README/COPYING. 
## Aka see <https://www.gnu.org/licenses/>.

## This is only a fragment of backemerg.


sudo mkdir /usr/local/lib/backemerg 2> /dev/null

sudo cp -r * /usr/local/lib/backemerg

sudo cp /usr/local/lib/backemerg/alearchiver/alearchiver.sh /usr/local/bin/alearchiver

sudo chown -R $USER:$USER /usr/local/bin/alearchiver

sudo chmod a-xwr /usr/local/bin/alearchiver

sudo chmod o-xwr /usr/local/bin/alearchiver

sudo chmod ug+rx  /usr/local/bin/alearchiver


sudo cp /usr/local/lib/backemerg/notazioneDimensioni/luxdim.sh /usr/local/bin/luxdim

sudo chown -R $USER:$USER /usr/local/bin/luxdim

sudo chmod a-xwr /usr/local/bin/luxdim

sudo chmod o-xwr /usr/local/bin/luxdim

sudo chmod ug+rx  /usr/local/bin/luxdim


sudo cp /usr/local/lib/backemerg/notazioneDimensioni/valedim.sh /usr/local/bin/valedim

sudo chown -R $USER:$USER /usr/local/bin/valedim

sudo chmod a-xwr /usr/local/bin/valedim

sudo chmod o-xwr /usr/local/bin/valedim

sudo chmod ug+rx  /usr/local/bin/valedim



sudo chown -R $USER:$USER /usr/local/lib/backemerg


sudo chmod -R uga+xwr /usr/local/lib/backemerg

sleep 2

if [ ! -d /home/$USER/.vim/vimScript/ ]; then

mkdir /home/$USER/.vim/vimScript/

sudo chown -R $USER:$USER /home/$USER/.vim/vimScript/

sudo chmod -R uga+xrw /home/$USER/.vim/vimScript/

fi

mkdir /home/$USER/.vim/vimScript/backemerg

mkdir  /home/$USER/.vim/vimScript/backemerg/alearchiver


sudo cp -r /usr/local/lib/backemerg/alearchiver/vimScript/* /home/$USER/.vim/vimScript/backemerg/alearchiver

sudo chown -R $USER:$USER /home/$USER/.vim/vimScript/

sudo chmod -R uga+xr /home/$USER/.vim/vimScript/backemerg


echo -e "\033[35;40;5m\033[1m Installazione effettuata, riavvia il pc. \033[0m"


exit


