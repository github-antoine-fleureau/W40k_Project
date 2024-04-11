import psycopg2

# Connect to the database
conn = psycopg2.connect(
    dbname="postgres",
    user="postgres",
    password="Olicah@y87",
    host="localhost",
    port="5432"
)

# Create a cursor
cur = conn.cursor()

try:
    # Execute the SQL query
    cur.execute(r"""
    SELECT u.Unit_id, u.Weapons, w.Weapon_id, u.group_faction_id
    FROM units u
    LEFT JOIN weapons w ON 
        u.Weapons LIKE '%' || substring(w.Weapon_name from '^(.*?)(?= )') || '%' 
        AND u.group_faction_id = w.group_faction_id
    """)


    # Fetch all rows
    rows = cur.fetchall()

    # Set to store unique (Unit_id, Weapon_id) pairs
    inserted_pairs = set()

    # Insert rows into the units_weapons table
    for row in rows:
        Unit_id, Weapons, Weapon_id, group_faction_id = row
        if Weapon_id:
            # Split weapons string by " - " separator
            weapon_names = Weapons.split(" - ")
            for weapon_name in weapon_names:
                # Query the weapon_id for each weapon name
                cur.execute("""
                    SELECT Weapon_id
                    FROM weapons
                    WHERE Weapon_name LIKE %s AND group_faction_id = %s
                """, (f'%{weapon_name}%', group_faction_id))
                weapon_ids = cur.fetchall()
                # Insert each unique (Unit_id, Weapon_id) pair into the units_weapons table
                for weapon_id in weapon_ids:
                    pair = (Unit_id, weapon_id[0])  # Extracting Weapon_id from the fetched result
                    if pair not in inserted_pairs:
                        cur.execute("""
                            INSERT INTO units_weapons (Unit_id, Weapon_id)
                            VALUES (%s, %s)
                        """, (Unit_id, weapon_id[0]))  # Extracting Weapon_id from the fetched result
                        inserted_pairs.add(pair)  # Add the pair to the set of inserted pairs
        else:
            print(f"Weapon not found for: {Weapons}")

    # Commit the transaction
    conn.commit()

    print("Data inserted successfully.")

except Exception as e:
    # Rollback the transaction in case of an error
    conn.rollback()
    print("Error:", e)

finally:
    # Close the cursor and connection
    cur.close()
    conn.close()