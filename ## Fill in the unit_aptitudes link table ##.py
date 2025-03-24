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
    # Execute the SQL query
    query = """
        SELECT u.Unit_id, u.aptitudes, a.Aptitude_id
        FROM units u
        LEFT JOIN units_aptitudes a ON u.Aptitudes LIKE '%' || a.Aptitude_name || '%'
    """
    cur.execute(query)
    rows = cur.fetchall()

    # Insert rows into the units_aptitudes_link table
    for row in rows:
        Unit_id, aptitudes, Aptitude_id = row
        print(f"Unit_id: {Unit_id}, aptitudes: {aptitudes}, Aptitude_id: {Aptitude_id}")  # Debugging line
        if Aptitude_id:
            # If multiple rules found in weapon_type separated by " - ", duplicate rows
            parts = aptitudes.split(" - ")
            for part in parts:
                # Check if the combination already exists in units_aptitudes_link
                check_query = """
                    SELECT COUNT(*)
                    FROM units_aptitudes_link
                    WHERE Unit_id = %s AND Aptitude_id = %s
                """
                cur.execute(check_query, (Unit_id, Aptitude_id))
                count = cur.fetchone()[0]
                if count == 0:
                    insert_query = """
                        INSERT INTO units_aptitudes_link (Unit_id, Aptitude_id)
                        VALUES (%s, %s)
                    """
                    cur.execute(insert_query, (Unit_id, Aptitude_id))
        else:
            print(f"Rule not found for: {aptitudes}")

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