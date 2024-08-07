#!/bin/bash

### Author: Mario Fantini
## << Para >> sta per parameters



scrivo=$(echo $1 > /tmp/inputAsciiHex)



leggo="$(cat /tmp/inputAsciiHex)"


echo $leggo | od -A n -t x1 | tr -d '\n' | sed 's/0a/./g' | tr '.\n' '\n' | sed 's/$/0a/' | sed 's/^ *//'




exit

