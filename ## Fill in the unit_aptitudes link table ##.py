import psycopg2

# Connect to the database
conn = psycopg2.connect(
    dbname="W40k",
    user="postgres",
    password="antoine",
    host="localhost",
    port="5432"
)

# Create a cursor
cur = conn.cursor()

try:
    # Execute the SQL query
    cur.execute("""
        SELECT u.Unit_id, u.aptitudes, a.Aptitude_id
        FROM units u
        LEFT JOIN units_aptitudes a ON u.Aptitudes LIKE '%' || a.Aptitude_name || '%'
    """)

    # Fetch all rows
    rows = cur.fetchall()

    # Insert rows into the units_aptitudes_link table
    for row in rows:
        Unit_id, aptitudes, Aptitude_id = row
        if Aptitude_id:
            # If multiple rules found in weapon_type separated by " - ", duplicate rows
            parts = aptitudes.split(" - ")
            for part in parts:
                # Check if the combination already exists in units_aptitudes_link
                cur.execute("""
                    SELECT COUNT(*)
                    FROM units_aptitudes_link
                    WHERE Unit_id = %s AND Aptitude_id = %s
                """, (Unit_id, Aptitude_id))
                count = cur.fetchone()[0]
                if count == 0:
                    cur.execute("""
                        INSERT INTO units_aptitudes_link (Unit_id, Aptitude_id)
                        VALUES (%s, %s)
                    """, (Unit_id, Aptitude_id))
        else:
            print(f"Rule not found for: {aptitudes}")

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