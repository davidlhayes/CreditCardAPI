CREATE DATABASE creditcards;
\c creditcards;
CREATE TABLE charges (id SERIAL PRIMARY KEY, accountid integer, name varchar(255), vendor varchar(255), transdate timestamp, amount real);
