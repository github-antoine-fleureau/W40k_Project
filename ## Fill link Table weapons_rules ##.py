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
    cur.execute("""
        SELECT w.weapon_id, w.weapon_type, r.rule_id
        FROM weapons w
        LEFT JOIN special_rules r ON w.weapon_type LIKE '%' || r.Rule_name || '%'
    """)

    # Fetch all rows
    rows = cur.fetchall()

    # Insert rows into the weapons_rules table
    for row in rows:
        weapon_id, weapon_type, rule_id = row
        if rule_id:
            # If multiple rules found in weapon_type separated by " - ", duplicate rows
            parts = weapon_type.split(" - ")
            for part in parts:
                # Check if the combination already exists in weapons_rules
                cur.execute("""
                    SELECT COUNT(*)
                    FROM weapons_rules
                    WHERE weapon_id = %s AND rule_id = %s
                """, (weapon_id, rule_id))
                count = cur.fetchone()[0]
                if count == 0:
                    cur.execute("""
                        INSERT INTO weapons_rules (weapon_id, rule_id)
                        VALUES (%s, %s)
                    """, (weapon_id, rule_id))
        else:
            print(f"Rule not found for: {weapon_type}")

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
