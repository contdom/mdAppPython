import sqlite3
from flask import Flask, render_template, request, redirect, url_for, jsonify

app = Flask(__name__)
DB_PATH = 'database/modello_dati.db'

def get_db_connection():
    """Stabilisce una connessione con il database SQLite."""
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row  # Permette di accedere alle colonne per nome
    return conn

@app.route('/')
def index():
    """Visualizza la tabella principale dei parametri e delle fasi."""
    conn = get_db_connection()

    # Query per elencare tutti i parametri
    parametri_db = conn.execute('SELECT id, nome_parametro, tipo FROM rfi_parametri ORDER BY nome_parametro').fetchall()

    # Query per elencare tutte le fasi
    fasi_db = conn.execute('SELECT id, rfi_fase FROM rfi_fase ORDER BY ordine').fetchall()
    
    conn.close()

    return render_template('index.html', parametri=parametri_db, fasi=fasi_db)

@app.route('/toggle_associazione', methods=['POST'])
def toggle_associazione():
    """Gestisce l'assegnazione o la rimozione di una fase a un parametro."""
    try:
        data = request.json
        parametro_id = data.get('parametro_id')
        fase_id = data.get('fase_id')
        is_checked = data.get('is_checked')

        # Per questa implementazione, usiamo un Pset di default (ad es. 'A01_Pset_Codifica' con id=1)
        pset_id = 1 
        
        conn = get_db_connection()
        with conn:
            if is_checked:
                # Inserisci l'associazione nella tabella di collegamento
                conn.execute('INSERT INTO rfi_pset_parametri (rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (?, ?, ?)',
                            (pset_id, parametro_id, fase_id))
            else:
                # Rimuovi l'associazione
                conn.execute('DELETE FROM rfi_pset_parametri WHERE rfi_pset_id = ? AND nome_parametro_id = ? AND rfi_fase_id = ?',
                             (pset_id, parametro_id, fase_id))
        return jsonify({'success': True})
    except sqlite3.IntegrityError:
        return jsonify({'success': False, 'message': 'L\'associazione esiste già.'})
    except Exception as e:
        return jsonify({'success': False, 'message': str(e)})
    finally:
        if 'conn' in locals() and conn:
            conn.close()

@app.route('/get_associazioni')
def get_associazioni():
    conn = get_db_connection()
    associazioni = conn.execute('SELECT rfi_pset_id, nome_parametro_id, rfi_fase_id FROM rfi_pset_parametri').fetchall()
    conn.close()
    return jsonify([dict(row) for row in associazioni])


if __name__ == '__main__':
    app.run(debug=True)