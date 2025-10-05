# Come zippare con password

zip usa l'algoritmo aes256, me ne sono accorto fornendo una stringa prodotta
da b2sum, troppo lunga. Accetta max una stringa prodotta da sha256sum.

Ci sono due modalità, la prima ('Modalità A')
 è quella più sicura e veloce per l'immissione di una password dal punto di vista
della digitazione in quanto si può ricorrere a due submodalità:
- Submodalità A.1: usare il copia/incolla o la selezione del mouse, ma 
verrebbe mostrata la password nel terminale;

- Submodalità A.2: lettura da variabile (più sicura quando la variabile
legge un file temporaneo o che sarà corrotto).


In ogni caso, non è possibile usare ```echo -e | zip ...``` o ```ecno -n | zip ...```.


La seconda modalità ('Modalità B') non mostra la password nel terminale, 
e la chiede interattivamente, senza che i caratteri vengano mostrati,
due volte per verificarla.

## Encrypt 

### Modalità A

#### Submodalità A.1

```
:~$ zip -P ok -r provaTest2.zip test2
  adding: test2/ (stored 0%)
  adding: test2/a.txt (stored 0%)

```

#### Submodalità A.2
:~$ echo "ok" > /tmp/password


:~$ leggoPass=$(cat /tmp/password)


:~$ zip -P $leggoPass -r provaTest2.zip test2
  adding: test2/ (stored 0%)
  adding: test2/a.txt (stored 0%)


### Modalità B

```
:~$ zip -e -r provaTest2.zip test2
Enter password:
Verify password:
  adding: home/mart/test2/ (stored 0%)
  adding: home/mart/test2/a.txt (stored 0%)
```

## Decrypt

### Modalità A

#### Submodalità A.1

```
:~$ unzip -P ok provaTest2.zip
```

#### Submodalità A.2
:~$ echo "ok" > /tmp/password


:~$ leggoPass=$(cat /tmp/password)


:~$ unzip -P $leggoPass provaTest2.zip


### Modalità B

```
:~$ unzip provaTest2.zip
[/home/mart/provaTest2.zip] test2/a.txt password:
 extracting: test2/a.txt

```




## help

```
man zip
man unzip
```
