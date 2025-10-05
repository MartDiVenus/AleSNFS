fun! C03#C03()

function! Input()

silent ! sudo rm -f /tmp/backemergVimInputC03

silent ! touch /tmp/backemergVimInputC03

let s:lines = readfile('/usr/local/lib/backemerg/alearchiver/echoLines/c/c03.txt')


for s:line in s:lines
	echo s:line
endfor


"let favoriteInput = input("\n Digita il numero associato alla tua risposta: ")
let favoriteInput = input("\n:")

call writefile(split(favoriteInput, "\n", 1), glob('/tmp/backemergVimInputC03'), 'b')

endfunction


call Input()

endfun



