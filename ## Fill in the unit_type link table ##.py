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
    cur.execute("""
        SELECT u.Unit_id, u.Unit_type, t.Types_id
        FROM public.units u
        LEFT JOIN public.types t ON u.unit_type LIKE '%' || t.types_name || '%'
    """)

    # Fetch all rows
    rows = cur.fetchall()

    # Insert rows into the units_type table
    for row in rows:
        Unit_id, Unit_type, Types_id = row
        if Types_id:
            # If multiple rules found in weapon_type separated by " - ", duplicate rows
            parts = Unit_type.split(" - ")
            for part in parts:
                # Check if the combination already exists in units_type
                cur.execute("""
                    SELECT COUNT(*)
                    FROM units_type
                    WHERE Unit_id = %s AND Types_id = %s
                """, (Unit_id, Types_id))
                count = cur.fetchone()[0]
                if count == 0:
                    cur.execute("""
                        INSERT INTO units_type (Unit_id, Types_id)
                        VALUES (%s, %s)
                    """, (Unit_id, Types_id))
        else:
            print(f"Rule not found for: {Unit_type}")

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