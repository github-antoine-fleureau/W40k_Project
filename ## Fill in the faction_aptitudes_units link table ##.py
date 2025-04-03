import pg8000

# Connexion à la base de données
conn = pg8000.connect(
    user='postgres',
    password='Olic@hay87',
    host='localhost',
    port=5432,
    database='Personnal_datas'
)

# Création du curseur
cur = conn.cursor()

try:
    # Récupérer tous les unit_id et faction_id depuis la table units
    query = """
        SELECT unit_id, faction_id
        FROM units
    """
    cur.execute(query)
    units = cur.fetchall()

    # Parcourir chaque unité pour récupérer ses aptitudes de faction
    for unit in units:
        unit_id, faction_id = unit

        # Récupérer toutes les aptitudes sous forme de texte concaténé
        aptitude_query = """
            SELECT STRING_AGG(faction_aptitude_name, ' - ') AS aptitudes
            FROM faction_aptitudes
            WHERE faction_id = %s
        """
        cur.execute(aptitude_query, (faction_id,))
        aptitude_names = cur.fetchone()[0]  # Récupère la chaîne concaténée

        if aptitude_names:  # Vérifier si des aptitudes existent
            # Vérifier si l'unité est déjà présente dans la table cible
            check_query = """
                SELECT COUNT(*)
                FROM units_faction_aptitudes_link
                WHERE unit_id = %s
            """
            cur.execute(check_query, (unit_id,))
            count = cur.fetchone()[0]

            if count == 0:
                # Insérer si l'entrée n'existe pas
                insert_query = """
                    INSERT INTO units_faction_aptitudes_link (unit_id, aptitudes)
                    VALUES (%s, %s)
                """
                cur.execute(insert_query, (unit_id, aptitude_names))
            else:
                # Mettre à jour si l'entrée existe déjà
                update_query = """
                    UPDATE units_faction_aptitudes_link
                    SET aptitudes = %s
                    WHERE unit_id = %s
                """
                cur.execute(update_query, (aptitude_names, unit_id))

    # Valider les transactions
    conn.commit()
    print("Data inserted successfully.")

except Exception as e:
    # Annuler les transactions en cas d'erreur
    conn.rollback()
    print("Error:", e)
    raise

finally:
    # Fermer le curseur et la connexion
    cur.close()
    conn.close()
