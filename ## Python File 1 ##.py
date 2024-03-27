## Python File 1 ##

import sqlite3

# Connexion à la base de données
conn = sqlite3.connect('votre_base_de_donnees.db')
cursor = conn.cursor()

# Fonction pour récupérer tous les noms uniques de weapons
def get_unique_weapon_names():
    cursor.execute("SELECT DISTINCT Weapon_name FROM weapons")
    return [row[0] for row in cursor.fetchall()]

# Fonction pour récupérer les weapon_id en fonction des weapon_name
def get_weapon_ids_by_names(names):
    weapon_ids = []
    for name in names:
        cursor.execute("SELECT Weapon_id FROM weapons WHERE Weapon_name = ?", (name,))
        result = cursor.fetchone()
        if result:
            weapon_ids.append(result[0])
    return weapon_ids

# Récupération de tous les noms uniques de weapons
unique_weapon_names = get_unique_weapon_names()

# Récupération des weapon_id
weapon_ids = get_weapon_ids_by_names(unique_weapon_names)

# Affichage des weapon_id
print("Weapon IDs correspondants aux noms de weapons uniques :")
print(weapon_ids)

# Fermeture de la connexion
conn.close()
