CREATE DATABASE IF NOT EXISTS players;


USE players;

CREATE TABLE IF NOT EXISTS players_table ( ID smallint unsigned not null AUTO_INCREMENT, name varchar(200) not null, position varchar(200) not null, school varchar(200) not null, serve int, serve_reception int, dig int, set_a int, spike int, block_a int, total int, notes varchar(200) primary key (ID) );


DECLARE name_str  VARCHAR(200);
DECLARE position_str  VARCHAR(200);
DECLARE school_str  VARCHAR(200);
DECLARE serve_int  INT;
DECLARE serve_reception_int  INT;
DECLARE dig_int  INT;
DECLARE set_int  INT;
DECLARE spike_int  INT;
DECLARE block_int  INT;
DECLARE total_int  INT;
DECLARE notes_str  VARCHAR(200);

SET name_str =  'Kageyama';
SET position_str = 'Opposite';
SET school_str = 'Karasuno';
SET serve_int = 10;
SET serve_reception_int = 7;
SET dig_int = 8;
SET spike_int = 10;
SET set_int = 10;
SET block_int = 8;
SET total_int = 53;
SET notes_str = 'he nice';

INSERT INTO players_table ( name, position, school, serve, serve_reception, dig, spike, set_a, block_a, total, notes) VALUES ( name_str, position_str, school_str \
, serve_int, serve_reception_int, dig_int, spike_int, set_int, block_int, total_int, notes_str);

-- # SQL Script that creates fake player data
-- # Create the database parameters; ID, Name, Position, School
-- CREATE DATABASE IF NOT EXISTS players;
-- USE players;

-- CREATE TABLE IF NOT EXISTS players_table ( ID smallint unsigned not null AUTO_INCREMENT, name varchar(20) not null, position varchar(20) not null, \
-- school varchar(50) not null, primary key (ID) );


-- # Create a loop function; Generates 100 players
-- DELIMITER $$

-- USE players

-- CREATE PROCEDURE test_mysql_while_loop()
-- BEGIN
-- DECLARE id_int  INT;
-- DECLARE name_str  VARCHAR(255);
-- DECLARE position_str  VARCHAR(255);
-- DECLARE school_str  VARCHAR(255);

-- SET id_int = 1;

-- WHILE id_int  <= 100 DO

-- SET name_str =  (select elt(0.5 + RAND() * 5, 'Hinata', 'Kageyama', 'Atsumu', 'Hoshiumi', 'Sakusa', 'Oikawa'));
-- set position_str = (select elt(0.5 + RAND() * 2, 'Opposite', 'Setter'));
-- SET school_str = (select elt(0.5 + RAND() * 6, 'nize', 'ur', 'bique', 'fam', 'why you', 'souka'));


-- SET  id_int = id_int + 1; 
-- END WHILE;

-- SELECT * FROM ;
-- END$$

-- DELIMITER ;

-- # Call the loop/generate players function
-- USE players;

-- CALL test_mysql_while_loop();