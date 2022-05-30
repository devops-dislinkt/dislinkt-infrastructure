#! /bin/bash
<<COMMENT
mongoimport is a tool for importing data into mongodb.
Into database users we add collection users and documents are defined in user_data.json.
For each user, username = password + '123', e.g.(username: nikola, password: nikola123)

--host param is the name of the mongodb (in our case, mongodb service is called auth-server-db in docker-compose.yaml)

--drop param will remove the whole collection before importing the data
--mode=upsert can be used instead of --drop. This will just update existing keys.
COMMENT

mongoimport --host auth-server-db --authenticationDatabase admin \
--db users --collection users \
--username root --password password \
--type json --mode=upsert \
--file data/users_data.json --jsonArray