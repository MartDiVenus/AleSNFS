fun! U02#U02()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputU02

silent ! touch /tmp/backemergVimInputU02

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/u/u02.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputU02'), 'b')

endfunction


call Input()

endfun
