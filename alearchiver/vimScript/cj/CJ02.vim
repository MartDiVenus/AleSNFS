fun! CJ02#CJ02()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCJ02

silent ! touch /tmp/backemergVimInputCJ02

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/cj/cj02.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCJ02'), 'b')

endfunction


call Input()

endfun


