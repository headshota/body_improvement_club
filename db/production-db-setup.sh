#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER body_improvement_club WITH PASSWORD '$BODY_IMPROVEMENT_CLUB_DATABASE_PASSWORD';

    CREATE DATABASE body_improvement_club_production OWNER body_improvement_club;
    CREATE DATABASE body_improvement_club_production_cache OWNER body_improvement_club;
    CREATE DATABASE body_improvement_club_production_queue OWNER body_improvement_club;
    CREATE DATABASE body_improvement_club_production_cable OWNER body_improvement_club;
EOSQL
