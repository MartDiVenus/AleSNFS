fun! C01#C01()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputC01

silent ! touch /tmp/backemergVimInputC01

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/c/c01.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputC01'), 'b')

endfunction


call Input()

endfun

