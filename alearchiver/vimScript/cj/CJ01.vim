fun! CJ01#CJ01()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputCJ01

silent ! touch /tmp/backemergVimInputCJ01

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/cj/cj01.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputCJ01'), 'b')

endfunction


call Input()

endfun

