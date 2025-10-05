# Come zippare per estrarre con percorso ricorsivo o meno


Premessa: In alearchiver di default impongo la prima opzione.


## I Modalità
Eseguendo

```
cd percorsoCartellaOFileDaZippare

zip -r nomeFile.zip nomeCartellaOFileDaZippare

```

ottieni nomeFile.zip che quando estratto restituirà solo
la cartella o il file, ossia senza percorso 'percorsoCartellaOFileDaZippare'
(ricorsivo).

## II modalità
Mentre eseguendo
```
zip -r nomeFile.zip percorsoCartellaOFileDaZippare/nomeCartellaOFileDaZippare
```
ottieni nomeFile.zip che quando estratto restituirà anche il percorso
'percorsoCartellaOFileDaZippare' (ricorsivo).


