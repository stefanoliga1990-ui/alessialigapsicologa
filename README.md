# Alessia Liga Psicologa

Sito di presentazione statico in HTML e CSS. Il deployment principale usa Nginx
su Railway; il progetto Java/Spring Boot rimane disponibile per future API,
funzionalita applicative o accesso a un database.

## Struttura

- `src/main/resources/static/`: unica sorgente dei file pubblici, servita sia da
  Nginx sia da Spring. Qui saranno aggiunti CSS, immagini e le eventuali nuove pagine.
- `src/main/java/`, `src/test/java/`, `pom.xml`, `mvnw*`, `.mvn/`: backend Spring
  e strumenti Maven conservati. Non sono compilati o inclusi nel container statico.
- `nginx/default.conf.template`: configurazione del server, con porta da `PORT`.
- `Dockerfile`, `.dockerignore`: immagine statica e selezione dei file da includere.
- `railway.json`: build Docker, avvio predefinito dell'immagine e verifica HTTP su `/`.
- `.github/workflows/static-site.yml`: verifica del container a ogni push e pull request.

La pagina include foto, qualifica, biografia integrale, contatti attivi e footer.
Il layout usa tre colonne su desktop, due sotto 1100 px e una sotto 760 px.
Su smartphone il collegamento ai contatti rimane visibile nella testata.
CSS e immagine pubblica si trovano in `static/assets/`, senza dipendenze esterne.
Email e telefono usano collegamenti `mailto:` e `tel:`; LinkedIn rimanda al profilo fornito.
La biografia e la fotografia preliminari nella radice sono materiali di lavoro:
il container copia solo la cartella `static/`.
Tutto cio che viene inserito in `static/` e destinato alla pubblicazione.

## Aggiornare e ampliare il sito

- Modificare testi e recapiti in `src/main/resources/static/index.html`.
- Aggiungere futuri profili come nuovi elementi `li` nella lista `social-list`:
  il CSS gestisce automaticamente la disposizione responsive.
- Aggiungere sezioni con un titolo e un `id` univoco; le classi della pagina
  separano foto, biografia e contatti senza dipendere dal numero di paragrafi.
- Gestire colori e caratteri nel CSS condiviso `assets/css/style.css`.
- Per nuove pagine, aggiungere file HTML nella cartella `static/`, riutilizzare
  il foglio di stile e inserire i collegamenti nella testata quando necessari.

## Anteprima locale senza Java o Docker

Dalla radice del repository, con Python 3 installato:

```powershell
python -m http.server 8080 --bind 127.0.0.1 --directory src/main/resources/static
```

Aprire http://localhost:8080 e interrompere con Ctrl+C.
Questa anteprima mostra i contenuti ma non verifica la configurazione Nginx.

## Avvio e verifica con Docker

Con Docker installato e avviato:

```powershell
docker build -t alessialiga-static .
docker run --rm alessialiga-static nginx -t
docker run --rm -p 127.0.0.1:8080:8080 alessialiga-static
```

Aprire http://localhost:8080. Per verificare una porta diversa, come su Railway:

```powershell
docker run --rm -e PORT=9090 -p 127.0.0.1:8080:9090 alessialiga-static
```

Eseguire un container alla volta. La home deve rispondere con HTTP 200 e un
percorso inesistente con HTTP 404. L'entrypoint ufficiale Nginx genera la
configurazione sostituendo solo `PORT`, prima di avviare il server.
L'immagine segue il tag ufficiale `stable-alpine`: le nuove build possono
ricevere aggiornamenti della versione stabile di Nginx.

## Pubblicazione su Railway

Il repository contiene la configurazione per il prossimo deployment; la sola
modifica locale dei file non aggiorna il sito online.

Prima del primo deployment statico, verificare nel servizio Railway esistente:

1. Repository e branch di deploy corretti, con radice del servizio nella radice
   del repository e configurazione da `/railway.json`.
2. Build tramite il `Dockerfile` incluso. Rimuovere eventuali vecchi comandi
   personalizzati Maven/Java e variabili che selezionano un altro Dockerfile.
   `startCommand` e `preDeployCommand` sono azzerati nel file di configurazione
   per utilizzare l'entrypoint e il comando predefiniti dell'immagine.
3. Porta del dominio coerente con `PORT`. Se il dominio esistente punta a 8080,
   impostare `PORT=8080` nel servizio; altrimenti allineare i due valori.
   Nginx legge la variabile a ogni avvio.
4. Dopo il push sul branch collegato, controllare la build, l'esito del controllo
   HTTP su `/` e la risposta del dominio pubblico.

HTTPS e dominio sono gestiti da Railway; Nginx serve HTTP all'interno del servizio.
Le impostazioni remote, il dominio e il deployment non vengono modificati dai
comandi di anteprima locale.

Riferimenti: [Railway config as code](https://docs.railway.com/config-as-code/reference)
e [immagine ufficiale Nginx](https://hub.docker.com/_/nginx).

## Backend Spring conservato

Il progetto richiede JDK 17 o successivo, compatibile con le dipendenze nel POM.
Verificare che `JAVA_HOME` e `java -version` puntino al JDK scelto: Java 8 non basta.

```powershell
.\mvnw.cmd test
.\mvnw.cmd spring-boot:run
```

Su Linux/macOS usare `./mvnw`. Spring serve la stessa cartella statica sulla porta
8080, modificabile tramite `PORT`. Non avviare Spring e Nginx sulla stessa porta.
Il wrapper puo richiedere accesso a Internet per scaricare Maven e le dipendenze.

Quando saranno necessarie API o un database, si potra creare un servizio Spring
separato oppure cambiare il deployment per servire anche il sito tramite Spring.
Il Dockerfile attuale avvia esclusivamente Nginx: aggiungere codice Java non lo
rende automaticamente attivo in produzione. Il backend non include ancora
configurazioni database o API applicative.
