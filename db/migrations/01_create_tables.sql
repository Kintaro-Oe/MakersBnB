CREATE DATABASE bnb;
\c bnb;
CREATE TABLE users (id serial PRIMARY KEY, first_name VARCHAR (30), surname VARCHAR (30), email VARCHAR (120), password VARCHAR (30));
CREATE DATABASE bnb_test;
\c bnb_test;
CREATE TABLE users (id serial PRIMARY KEY, first_name VARCHAR (30), surname VARCHAR (30), email VARCHAR (120), password VARCHAR (30));
