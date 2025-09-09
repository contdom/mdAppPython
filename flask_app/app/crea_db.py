import sqlite3

# Nome del file di schema SQL
schema_file = 'database/modello_dati.sql'

# Nome del database da creare
db_file = 'database/modello_dati.db'

def crea_database():
    """Crea un database SQLite e vi popola le tabelle dallo schema SQL."""
    try:
        # Connessione al database (se non esiste, viene creato)
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()

        # Leggi i comandi SQL dallo schema
        with open(schema_file, 'r') as f:
            sql_script = f.read()

        # Esegui i comandi SQL
        cursor.executescript(sql_script)

        # Salva le modifiche e chiudi la connessione
        conn.commit()
        conn.close()
        
        print(f"Database '{db_file}' creato e popolato con successo!")
    except Exception as e:
        print(f"Errore durante la creazione del database: {e}")

if __name__ == '__main__':
    crea_database()