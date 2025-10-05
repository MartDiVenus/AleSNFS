fun! U01#U01()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputU01

silent ! touch /tmp/backemergVimInputU01

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/u/u01.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputU01'), 'b')

endfunction


call Input()

endfun

