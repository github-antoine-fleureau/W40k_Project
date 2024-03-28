import psycopg2

# Connexion à la base de données
conn = psycopg2.connect(
    dbname="PostgreSQL 16",
    user="postgres",
    password="Olicah@y87",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

# Fonction pour récupérer tous les noms uniques de weapons
def get_unique_weapon_names():
    cursor.execute("SELECT DISTINCT Weapon_name FROM weapons")
    return [row[0] for row in cursor.fetchall()]

# Fonction pour récupérer les weapon_id en fonction des weapon_name
def get_weapon_ids_by_names(names):
    weapon_ids = []
    for name in names:
        cursor.execute("SELECT Weapon_id FROM weapons WHERE Weapon_name = %s", (name,))
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
