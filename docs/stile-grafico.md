# Direzione grafica

## Carattere della pagina

Professionale, accogliente e contemporaneo. Impaginazione ariosa, gerarchia chiara
e decorazioni minime. La fotografia personale guida il tono della pagina:
avorio e salvia accompagnano i suoi colori caldi e il viola dell'abbigliamento.
La palette è una scelta progettuale, non uno standard del settore psicologico.

## Palette

| Ruolo | Colore | Utilizzo |
| --- | --- | --- |
| Sfondo principale | `#FAF8F4` avorio | Fondo della pagina |
| Superficie secondaria | `#EAF0E9` salvia chiarissimo | Pannello Contatti |
| Testo principale | `#293C35` verde antracite | Nome, titoli e biografia |
| Testo secondario | `#53645D` grigio verde | Qualifica e informazioni di supporto |
| Accento | `#456454` verde salvia scuro | Link, focus e azioni |
| Bordi decorativi | `#D8E0D8` | Separatori e contorni non funzionali |
| Testo su accento | `#FFFFFF` bianco | Eventuali pulsanti pieni |

Usare i colori chiari come superfici e i colori scuri per il testo.
I bordi chiari non devono essere l'unico segnale per identificare un controllo.
I link reali avranno sottolineatura e focus visibile, non solo una variazione di colore.

## Tipografia

- Nome e titoli: `Georgia, "Times New Roman", serif`, per una presenza editoriale sobria.
- Biografia, qualifica e contatti: `system-ui, -apple-system, "Segoe UI", sans-serif`.
- Nessun caricamento di font da servizi esterni nella prima versione.
- Nome: circa 48 px su desktop e 36 px su mobile, con dimensione fluida.
- Corpo: 17–18 px, interlinea 1.7; qualifica: almeno 16 px.
- Biografia allineata a sinistra, senza giustificazione, con paragrafi separati.

## Impaginazione proposta

Su schermi ampi, contenitore centrato largo al massimo 1240 px, margini generosi
e tre colonne di circa 260 px / spazio restante / 260 px, con intervalli di 40 px.

1. Sinistra: fotografia, in un riquadro quadrato con angoli arrotondati di 20 px.
2. Centro: nome, qualifica completa, titolo "Biografia professionale" e quattro paragrafi.
3. Destra: pannello salvia "Contatti", con email, telefono e profili in elenco verticale.

Sotto circa 1100 px passare a due colonne: foto e biografia, con il pannello
Contatti a tutta larghezza sotto. Sotto circa 760 px usare una singola colonna,
con ordine foto, nome e qualifica, biografia, contatti. Margini laterali di almeno 20 px.
Verificare questi punti di passaggio sul contenuto reale durante l'implementazione.

Per questa prima pagina non serve una barra di navigazione vuota. Il footer
sarà discreto, con il nome e le informazioni professionali effettivamente disponibili.

## Trattamento della foto

L'immagine fornita è quadrata, 400 × 400 px. Mantenerne l'inquadratura e i colori
originali, senza ritocchi al volto o filtri cromatici. Occupa il 90% della colonna
su desktop e non supera 288 px su mobile, evitando ingrandimenti eccessivi.
La risoluzione è utilizzabile per la bozza; un originale più grande potrà migliorare
la nitidezza sui display ad alta densità, senza bloccare il lavoro attuale.

## Dettagli e interazioni

- Angoli morbidi e ombre appena percettibili, senza effetto schede sovrapposte.
- Icone semplici solo a supporto di etichette testuali leggibili.
- Nessuna animazione continua o carosello.
- Contatti mock non interattivi e chiaramente indicati come provvisori.
- Con i dati definitivi, email e telefono diventeranno azioni dirette.
- Non inserire un invito a prenotare finché non saranno definite le modalità di contatto.

## Ambito di questo step

Il layout è implementato in `src/main/resources/static/index.html` e
`src/main/resources/static/assets/css/style.css`, con le tre disposizioni previste.
La testata mobile mantiene visibile un collegamento alla sezione Contatti.
Sono presenti un collegamento per saltare alla biografia, focus visibile,
dimensioni esplicite della fotografia e rispetto della preferenza di movimento ridotto.
La biografia approvata e i placeholder sono raccolti in `docs/contenuti.md`.
Sono stati verificati integrità dei contenuti, risorse HTTP e destinazioni delle
ancore; il collaudo visivo su browser e dispositivi resta da eseguire.
