# Accessibilità e prestazioni — verifica locale

## Interventi

- Foto WebP: 13.392 byte contro 29.209 byte del JPEG (-54,2%); fallback JPEG mantenuto.
- Dimensioni 400 × 400 dichiarate, priorità alta, decodifica asincrona e testo alternativo.
- Nessun JavaScript, font remoto o immagine decorativa da scaricare: decorazioni in CSS.
- Corpo della biografia 17 px; etichette almeno 14 px; contatti con area alta almeno 48 px.
- Focus con contorno di 3 px, collegamento per saltare alla biografia, link sottolineati.
- Preferenza di movimento ridotto rispettata; stile per colori forzati e stampa.
- Sotto 400 px la testata non è fissa, per lasciare spazio ai contenuti su schermi stretti.

## Verifiche eseguite

- Browser locale: desktop 1280 px, tablet 900 px, smartphone 390 e 320 px, senza overflow orizzontale.
- Tastiera: Tab sul salto alla biografia, Invio con trasferimento del focus alla sezione;
  Tab successivi su email, telefono e LinkedIn. Nessuna email o chiamata avviata.
- Collegamento Contatti attivato con Invio: focus trasferito al pannello.
- Browser usa effettivamente il WebP; foto visibile e struttura accessibile con titoli e descrizione.
- Contrasti calcolati: testo principale 11,20:1; testo secondario sui colori estremi
  dello sfondo almeno 4,79:1; testo chiaro sul pannello 10,01:1; etichette 7,36:1.
- Risposte HTTP 200 per HTML, CSS e foto; risorse complessive 24.599 byte non compressi.
- HTML e CSS compressi con gzip: circa 3.911 byte; Nginx è già configurato per gzip.
- Lettura delle singole risorse dal server locale: 79 / 5 / 7 ms (HTML / CSS / WebP).

## Limiti

I tempi locali non rappresentano la rete mobile o Railway e non sono misure di
LCP, INP o CLS. Questi controlli non costituiscono una certificazione completa
WCAG. Lo zoom tramite scorciatoie non ha avuto effetto nel browser integrato:
resta da verificare al 200% in un browser standard, insieme a screen reader e
prestazioni di produzione. Nessun punteggio Lighthouse viene dichiarato.
