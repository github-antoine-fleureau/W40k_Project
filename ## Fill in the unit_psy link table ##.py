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
    # Fetch units with domains
    cur.execute("""
        SELECT Unit_id, domains
        FROM units
        WHERE domains IS NOT NULL
    """)
    units_with_domains = cur.fetchall()

    # Fetch domains
    cur.execute("""
        SELECT Domains_id, Domains
        FROM psychic_powers_domains
    """)
    domains = cur.fetchall()

    # Map domain names to domain IDs
    domain_map = {domain_name: domain_id for domain_id, domain_name in domains}

    # Check if the pair unit_id - domain_id already exists in units_psy
    def pair_exists(unit_id, domain_id):
        cur.execute("""
            SELECT COUNT(*)
            FROM units_psy
            WHERE Unit_id = %s AND Domains_id = %s
        """, (unit_id, domain_id))
        return cur.fetchone()[0] > 0

    # Insert rows into the units_psy table
    for unit_id, domains_str in units_with_domains:
        unit_domains = domains_str.split(" - ")
        for domain_name in unit_domains:
            domain_id = domain_map.get(domain_name)
            if domain_id and not pair_exists(unit_id, domain_id):
                cur.execute("""
                    INSERT INTO units_psy (Unit_id, Domains_id)
                    VALUES (%s, %s)
                """, (unit_id, domain_id))

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
