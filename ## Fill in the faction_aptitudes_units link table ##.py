import pg8000

# Connect to the database
conn = pg8000.connect(
    user='postgres',
    password='Olic@hay87',
    host='localhost',
    port=5432,
    database='Personnal_datas'
)

# Create a cursor
cur = conn.cursor()

try:
    # Execute the SQL query to get unit_id and faction_id
    query = """
        SELECT u.Unit_id, u.faction_id
        FROM units u
    """
    cur.execute(query)
    units = cur.fetchall()

    # For each unit, get the corresponding aptitude_name from faction_aptitudes
    for unit in units:
        Unit_id, faction_id = unit

        # Get all aptitude_name for the given faction_id
        aptitude_query = """
            SELECT aptitude_name
            FROM faction_aptitudes
            WHERE faction_id = %s
        """
        cur.execute(aptitude_query, (faction_id,))
        aptitudes = [aptitude[0] for aptitude in cur.fetchall()]

        if aptitudes:
            # Concatenate aptitude names separated by ' - '
            aptitudes_str = ' - '.join(aptitudes)

            # Check if the combination already exists in units_faction_aptitudes_link
            check_query = """
                SELECT COUNT(*)
                FROM units_faction_aptitudes_link
                WHERE Unit_id = %s
            """
            cur.execute(check_query, (Unit_id,))
            count = cur.fetchone()[0]

            if count == 0:
                insert_query = """
                    INSERT INTO units_faction_aptitudes_link (Unit_id, Aptitudes_Name)
                    VALUES (%s, %s)
                """
                cur.execute(insert_query, (Unit_id, aptitudes_str))

    # Commit the transaction
    conn.commit()

    print("Data inserted successfully.")

except Exception as e:
    # Rollback the transaction in case of an error
    conn.rollback()
    print("Error:", e)
    raise

finally:
    # Close the cursor and connection
    cur.close()
    conn.close()
