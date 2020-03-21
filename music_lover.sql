create extension if not exists pgcrypto;
CREATE EXTENSION if not exists pgjwt;

CREATE TABLE IF NOT EXISTS
users (
  email    TEXT PRIMARY KEY CHECK ( email ~* '^.+@.+\..+$' ),
  pass     TEXT NOT NULL CHECK (length(pass) < 256),
  role     NAME NOT NULL CHECK (length(role) < 256)
);

CREATE TABLE IF NOT EXISTS
artists (
  name TEXT PRIMARY KEY CHECK (length(name) < 256),
  mb_id UUID UNIQUE,
  date_formed DATE 
);

CREATE TABLE IF NOT EXISTS
sort_types (
  name TEXT PRIMARY KEY CHECK (length(name) < 256),
  description TEXT NOT NULL CHECK (length(description) < 512)
);

CREATE TABLE IF NOT EXISTS
sorts (
  artist_name TEXT NOT NULL REFERENCES artists(name),
  sort_type_name TEXT NOT NULL REFERENCES sort_types(name),
  ordinal INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS
rating_types (
  name TEXT PRIMARY KEY CHECK (length(name) < 256),
  description TEXT NOT NULL CHECK (length(description) < 512)
);

CREATE TABLE IF NOT EXISTS
ratings (
  artist_name TEXT NOT NULL REFERENCES artists(name),
  email TEXT NOT NULL REFERENCES users(email),
  rating_type_name TEXT NOT NULL REFERENCES rating_types(name),
  rating INTEGER NOT NULL,
  at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

ALTER TABLE ratings ADD CONSTRAINT ratings_pkey
PRIMARY KEY(artist_name, email, rating_type_name);

CREATE OR REPLACE FUNCTION
check_role_exists() RETURNS TRIGGER
  LANGUAGE plpgsql
  AS $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles AS r WHERE r.rolname = new.role) THEN
    RAISE foreign_key_violation USING message =
      'unknown role: ' || new.role;
    RETURN null;
  END IF;
  RETURN NEW;
END
$$;

DROP TRIGGER IF EXISTS ensure_user_role_exists ON users;
CREATE CONSTRAINT TRIGGER ensure_user_role_exists
  AFTER INSERT OR UPDATE ON users
  FOR EACH ROW
  EXECUTE PROCEDURE check_role_exists();

CREATE OR REPLACE FUNCTION
encrypt_pass() RETURNS TRIGGER
  LANGUAGE plpgsql
  AS $$
BEGIN
  IF tg_op = 'INSERT' OR new.pass <> old.pass THEN
    new.pass = crypt(new.pass, gen_salt('bf'));
  END IF;
  RETURN new;
END
$$;

DROP TRIGGER IF EXISTS encrypt_pass ON users;
CREATE TRIGGER encrypt_pass
  BEFORE INSERT OR UPDATE ON users
  FOR EACH ROW
  EXECUTE PROCEDURE encrypt_pass();

CREATE OR REPLACE FUNCTION
user_role(email text, pass text) RETURNS name
  LANGUAGE plpgsql
  AS $$
BEGIN
  RETURN (
  SELECT role FROM users
   WHERE users.email = user_role.email
     AND users.pass = crypt(user_role.pass, users.pass)
  );
END;
$$;

CREATE OR REPLACE FUNCTION
signup(email text, pass text) RETURNS VOID
AS $$
  INSERT INTO users (email, pass, role) VALUES
    (signup.email, signup.pass, 'music_lover');
$$ LANGUAGE sql;

DROP TYPE IF EXISTS jwt_claims CASCADE;
CREATE TYPE jwt_claims AS (role TEXT, email TEXT);

-- CREATE OR REPLACE FUNCTION
-- login(email TEXT, pass TEXT) RETURNS jwt_claims
--   LANGUAGE plpgsql
--   AS $$
-- DECLARE
--   _role NAME;
--   result JWT_CLAIMS; 
-- BEGIN
--   SELECT user_role(email, pass) INTO _role;
--   IF _role IS NULL THEN 
--     RAISE invalid_password USING message = 'invalid user or password';
--   END IF;
--   SELECT _role AS role, login.email AS email INTO result;
--   RETURN result;
-- END;
-- $$;

DROP TYPE IF EXISTS jwt_token CASCADE;
CREATE TYPE jwt_token AS (
  token text
);

-- 修改为发送token
create or replace function
login(email text, pass text) returns jwt_token as $$
declare
  _role name;
  result jwt_token;
begin
  -- check email and password
  select user_role(email, pass) into _role;
  if _role is null then
    raise invalid_password using message = 'invalid user or password';
  end if;

  select sign(
      row_to_json(r), 'iDYR4j2Qp3QT05kpd9oIcF2WPWEWVrI3'
    ) as token
    from (
      select _role as role, login.email as email,
         extract(epoch from now())::integer + 60*60 as exp
    ) r
    into result;
  return result;
end;
$$ language plpgsql security definer;

CREATE ROLE app_role NOINHERIT LOGIN PASSWORD 'change_this';
CREATE ROLE music_lover;
CREATE ROLE anon;

GRANT anon, music_lover TO app_role;

GRANT SELECT ON TABLE artists TO music_lover;
GRANT SELECT ON TABLE sort_types TO music_lover;
GRANT SELECT ON TABLE sorts TO music_lover;
GRANT SELECT ON TABLE rating_types TO music_lover;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE ratings TO music_lover;

GRANT SELECT, INSERT ON TABLE users TO anon;
GRANT EXECUTE ON FUNCTION
  login(text,text),
  signup(text, text)
  TO anon;