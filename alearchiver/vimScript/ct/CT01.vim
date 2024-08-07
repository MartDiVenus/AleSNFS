fun! CT01#CT01()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCT01

silent ! touch /tmp/backemergVimInputCT01

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/ct/ct01.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCT01'), 'b')

endfunction


call Input()

endfun

