DO $$ 
DECLARE 
    r RECORD;
BEGIN
    -- Boucle sur toutes les tables du schéma 'public'
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP
        -- Suppression de chaque table
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;
END $$;