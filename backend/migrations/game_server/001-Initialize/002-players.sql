DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'faction') THEN
        CREATE TYPE faction AS ENUM ('caldari', 'varnak', 'dawnhold');
    END IF;
END $$;

CREATE TABLE players (
    id UUID PRIMARY KEY NOT NULL,
    faction faction NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trigger_set_updated_at_players
BEFORE UPDATE ON players
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();