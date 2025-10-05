Per l'opzione -remove:

a) Nelle compressioni non posso usare il veloce
```
 ~$> sudo rm -r $leggoNTarget
```
 in quanto se avessi fornito ```--f=*```
 allora avrei
```
 ~$> sudo rm -r *
```
e non andrebbe bene se ci fossero directory o file non compressi nella stessa cartella
del file o della directory da comprimere, perché verrebbero eliminati (grave).


b) Nelle estrazioni non posso usare
```
~$> sudo rm -r $pathName
```

in quanto se avessi fornito --f=*
allora avrei
```
 ~$> sudo rm *
```
e non andrebbe bene se ci fossero file non compressi nella stessa cartella
del file compresso da decomprimere, perché verrebbero eliminati (grave).

