fun! CD01#CD01()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCD01

silent ! touch /tmp/backemergVimInputCD01

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/cd/cd01.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCD01'), 'b')

endfunction


call Input()

endfun


