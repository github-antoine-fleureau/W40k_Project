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
        SELECT u.Unit_id, u.Special_rules, r.rule_id
        FROM units u
        LEFT JOIN special_rules r ON u.Special_rules LIKE '%' || r.Rule_name || '%'
    """)

    # Fetch all rows
    rows = cur.fetchall()

    # Insert rows into the units_rules table
    for row in rows:
        Unit_id, Special_rules, rule_id = row
        if rule_id:
            # If multiple rules found in weapon_type separated by " - ", duplicate rows
            parts = Special_rules.split(" - ")
            for part in parts:
                # Check if the combination already exists in units_rules
                cur.execute("""
                    SELECT COUNT(*)
                    FROM units_rules
                    WHERE Unit_id = %s AND rule_id = %s
                """, (Unit_id, rule_id))
                count = cur.fetchone()[0]
                if count == 0:
                    cur.execute("""
                        INSERT INTO units_rules (Unit_id, rule_id)
                        VALUES (%s, %s)
                    """, (Unit_id, rule_id))
        else:
            print(f"Rule not found for: {Special_rules}")

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