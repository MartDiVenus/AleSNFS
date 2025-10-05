fun! CT02#CT02()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCT02

silent ! touch /tmp/backemergVimInputCT02

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/ct/ct02.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCT02'), 'b')

endfunction


call Input()

endfun


