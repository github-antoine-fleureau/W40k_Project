import psycopg2

# Connect to the database
conn = psycopg2.connect(
    dbname="Personnal_datas",
    user="postgres",
    password="Olic@hay87",
    host="localhost",
    port="5432"
)

# Create a cursor
cur = conn.cursor()

try:
    # Execute the SQL query to get units and weapons information
    cur.execute("""
    SELECT u.Unit_id, u.Weapons, u.group_faction_id
    FROM units u
    """)

    # Fetch all rows
    rows = cur.fetchall()

    # Set to store unique (Unit_id, Weapon_id) pairs
    inserted_pairs = set()

    # Insert rows into the units_weapons table
    for row in rows:
        Unit_id, Weapons, group_faction_id = row

        # Split weapons string by " - " separator
        weapon_names = Weapons.split(" - ")
        
        # For each weapon name, try to find the corresponding Weapon_id(s)
        for weapon_name in weapon_names:
            weapon_found = False
            
            # First attempt: use partial matching with LIKE
            cur.execute("""
                SELECT Weapon_id
                FROM weapons
                WHERE Weapon_name LIKE %s AND group_faction_id = %s
            """, (f'%{weapon_name}%', group_faction_id))
            
            weapon_ids = cur.fetchall()

            # If no weapons are found with LIKE, try exact matching
            if not weapon_ids:
                cur.execute("""
                    SELECT Weapon_id
                    FROM weapons
                    WHERE Weapon_name = %s AND group_faction_id = %s
                """, (weapon_name.strip(), group_faction_id))
                
                weapon_ids = cur.fetchall()

            # Check if any weapon_id was found
            if weapon_ids:
                weapon_found = True
                # Insert each unique (Unit_id, Weapon_id) pair into the units_weapons table
                for weapon_id in weapon_ids:
                    pair = (Unit_id, weapon_id[0])  # Extract Weapon_id from the fetched result
                    if pair not in inserted_pairs:
                        cur.execute("""
                            INSERT INTO units_weapons (Unit_id, Weapon_id)
                            VALUES (%s, %s)
                        """, (Unit_id, weapon_id[0]))  # Extracting Weapon_id from the fetched result
                        inserted_pairs.add(pair)  # Add the pair to the set of inserted pairs

            # If no match was found, print a warning for this weapon
            if not weapon_found:
                print(f"Weapon not found for: {weapon_name}")

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
