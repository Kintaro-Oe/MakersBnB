CREATE DATABASE bnb;
\c bnb;
CREATE TABLE users (id serial PRIMARY KEY, first_name VARCHAR (30), surname VARCHAR (30), email VARCHAR (120), password VARCHAR (30));
CREATE TABLE properties (id serial PRIMARY KEY, user_id VARCHAR, property_name VARCHAR (60), price DECIMAL (6,2), available_dates DATE, description VARCHAR (240));
CREATE TABLE user_requests (user_request_id serial PRIMARY KEY, user_id VARCHAR);
CREATE TABLE property_requests (property_request_id serial PRIMARY KEY, property_id VARCHAR);
CREATE TABLE requests (id serial PRIMARY KEY, user_request_id INTEGER REFERENCES user_requests(user_request_id), property_id INTEGER REFERENCES property_requests(property_request_id), status VARCHAR (30));

CREATE DATABASE bnb_test;
\c bnb_test;
CREATE TABLE users (id serial PRIMARY KEY, first_name VARCHAR (30), surname VARCHAR (30), email VARCHAR (120), password VARCHAR (30));
CREATE TABLE properties (id serial PRIMARY KEY, user_id VARCHAR, property_name VARCHAR (60), price DECIMAL (6,2), available_dates DATE, description VARCHAR (240));
CREATE TABLE user_requests (user_request_id serial PRIMARY KEY, user_id VARCHAR);
CREATE TABLE property_requests (property_request_id serial PRIMARY KEY, property_id VARCHAR);
CREATE TABLE requests (id serial PRIMARY KEY, user_request_id INTEGER REFERENCES user_requests(user_request_id), property_id INTEGER REFERENCES property_requests(property_request_id), status VARCHAR (30));
