fun! CZ01#CZ01()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCZ01

silent ! touch /tmp/backemergVimInputCZ01

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/cz/cz01.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCZ01'), 'b')

endfunction


call Input()

endfun

