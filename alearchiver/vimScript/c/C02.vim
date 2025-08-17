fun! C02#C02()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputC02

silent ! touch /tmp/backemergVimInputC02

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/c/c02.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputC02'), 'b')

endfunction


call Input()

endfun


