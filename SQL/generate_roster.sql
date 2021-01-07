CREATE DATABASE IF NOT EXISTS players;


USE players;

CREATE TABLE IF NOT EXISTS players_table ( ID smallint unsigned not null AUTO_INCREMENT, name varchar(20) not null, position varchar(20) not null, \
school varchar(50) not null, primary key (ID) );


DECLARE name_str  VARCHAR(255);
DECLARE position_str  VARCHAR(255);
DECLARE school_str  VARCHAR(255);


SET name_str =  'Hinata';
set position_str = 'M';
SET school_str = 'Opposite';

INSERT INTO players_table ( name, gender, disease ) VALUES ( name_str, position_str, school_str );
