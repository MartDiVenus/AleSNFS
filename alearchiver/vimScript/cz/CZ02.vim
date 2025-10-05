fun! CZ02#CZ02()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCZ02

silent ! touch /tmp/backemergVimInputCZ02

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/cz/cz02.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCZ02'), 'b')

endfunction


call Input()

endfun


