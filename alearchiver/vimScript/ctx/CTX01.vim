fun! CTX01#CTX01()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCTX01

silent ! touch /tmp/backemergVimInputCTX01

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/ctx/ctx01.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCTX01'), 'b')

endfunction


call Input()

endfun

