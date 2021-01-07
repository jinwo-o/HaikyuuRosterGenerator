-- CREATE DATABASE IF NOT EXISTS players;


-- USE players;

-- CREATE TABLE IF NOT EXISTS players_table ( ID smallint unsigned not null AUTO_INCREMENT, name varchar(20) not null, position varchar(20) not null, \
-- school varchar(50) not null, primary key (ID) );


-- DECLARE name_str  VARCHAR(255);
-- DECLARE position_str  VARCHAR(255);
-- DECLARE school_str  VARCHAR(255);


-- SET name_str =  'Hinata';
-- set position_str = 'M';
-- SET school_str = 'Opposite';

-- INSERT INTO players_table ( name, gender, disease ) VALUES ( name_str, position_str, school_str );

# SQL Script that creates fake player data
# Create the database parameters; ID, Name, Gender, Disease
CREATE DATABASE IF NOT EXISTS players;
USE players;

CREATE TABLE IF NOT EXISTS player_table ( ID smallint unsigned not null AUTO_INCREMENT, name varchar(20) not null, position varchar(20) not null, \
school varchar(50) not null, primary key (ID) );


# Create a loop function; Generates 100 players
DELIMITER $$

USE players

CREATE PROCEDURE test_mysql_while_loop()
BEGIN
DECLARE id_int  INT;
DECLARE name_str  VARCHAR(255);
DECLARE position_str  VARCHAR(255);
DECLARE school_str  VARCHAR(255);

SET id_int = 1;

WHILE id_int  <= 100 DO

SET name_str =  (select elt(0.5 + RAND() * 5, 'Hinata', 'Kageyama', 'Atsumu', 'Hoshiumi', 'Sakusa', 'Oikawa'));
set position_str = (select elt(0.5 + RAND() * 2, 'Opposite', 'Setter'));
SET school_str = (select elt(0.5 + RAND() * 6, 'nize', 'ur', 'bique', 'fam', 'why you', 'souka'));

INSERT INTO player_table ( name, gender, disease ) VALUES ( name_str, position_str, school_str );
SET  id_int = id_int + 1; 
END WHILE;

SELECT * FROM player_table;
END$$

DELIMITER ;

# Call the loop/generate players function
USE players;

CALL test_mysql_while_loop();
