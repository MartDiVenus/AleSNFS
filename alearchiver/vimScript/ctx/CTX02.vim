fun! CTX02#CTX02()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCTX02

silent ! touch /tmp/backemergVimInputCTX02

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/ctx/ctx02.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCTX02'), 'b')

endfunction


call Input()

endfun


