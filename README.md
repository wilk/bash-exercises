# bash-exercises
Some linux (CentOS) bash exercises

1. chiedere all'utente due valori e sommarli (example)
2. simulare il logrotate su un file (achived)
3. aggiungere l'opzione -c e --compress per utilizzare il tipo di compressore (achived)
4. aggiungere l'opzione -a e --archive per archiviare il file
5. dato un file in input, restituire una conferma se l'utente ha i permessi di lettura altrimenti una negazione (achived)
6. dato un file da copiare e un file contenente una lista di utenti, copiare nella home di ogni utente il file (con ssh)
7. definire un nuovo cronjob dato un programma di backup (anche un semplice cp) e un path da backuppare: il cron deve essere eseguito quotidianamente
8. fare uno script che generi automaticamente una shared lib data in input
9. dato un file testuale in input, monitorare il numero di righe: se questo sfora un limite dato, loggare sul log di sistema e terminare (achived)
10. creare un diario di bordo: ogni qualvolta l'utente inserisce una frase, una nuova riga con tanto di data deve essere inserita nel file. Alla fine l'utente può specificare una frase per chiudere il diario e archiviare il giorno.
11. dato un file, scoprire con cosa è stato compresso e utilizzare il decompressore relativo per decomprimerlo; se il compressore non è riconosciuto, segnalarlo all'utente
12. generare un uid generico di 6 cifre ogni qualvolta viene lanciato il comando
13. genere un archivio (tar) di tutti i file presenti nella home dell'utente modificati nell'ultima ora
14. dato il nome di un processo e un intervallo espresso in secondi, verificare se tale processo è attivo: nel caso non lo sia più, notificare l'utente

# intermediate
1. listare tutti i file, uno per volta, maggiori di 100KB e chiedercte se comprimere o rimuovere il file visualizzato, passando poi al successivo. loggare in un file a parte tutti i file rimossi.
2. dato un file CSV, il cui separatore è definito dall'utente, mostrare ogni riga come una lista campi chiavi:valore, la cui chiave è il campo della prima riga mentre il valore la riga corrente
3. creare una newsletter: leggere mensilmente da un file la newsletter e mandarla a tutti gli indirizzi presenti in un altro file
4. creare un generatore di password random che generi password di 9 caratteri, contenenti A-Z,a-z,0-9 (achived)
