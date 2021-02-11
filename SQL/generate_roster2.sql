# SQL Script that creates fake patient data
# Create the database parameters; ID, Name, Gender, Disease
CREATE DATABASE IF NOT EXISTS players;
USE players;

-- CREATE TABLE IF NOT EXISTS players_table ( ID smallint unsigned not null AUTO_INCREMENT, name varchar(200) not null, school varchar(200) not null, position varchar(200) not null, serve int, serve_reception int, dig int, set_a int, spike int, block_a int, total int, notes varchar(200), primary key (ID) );
CREATE TABLE IF NOT EXISTS players_table ( ID smallint unsigned not null AUTO_INCREMENT, name varchar(200) not null, school varchar(200) not null, position varchar(200) not null, serve int, serve_reception int, dig int, set_a int, spike int, block_a int, primary key (ID) );


# Create a loop function; Generates 100 Players
DELIMITER $$

USE players

CREATE PROCEDURE test_mysql_while_loop()
BEGIN
DECLARE id_int  INT;
DECLARE name_str  VARCHAR(255);
DECLARE school_str  VARCHAR(255);
DECLARE position_str  VARCHAR(255);
DECLARE serve_int  INT;
DECLARE serve_reception_int  INT;
DECLARE dig_int  INT;
DECLARE set_int  INT;
DECLARE spike_int  INT;
DECLARE block_int  INT;

SET id_int = 1;

WHILE id_int  <= 100 DO

SET name_str =  (select elt(0.5 + RAND() * 5, 'Hinata', 'Kageyama', 'Atsumu', 'Hoshiumi', 'Sakusa', 'Oikawa'));
set school_str = (select elt(0.5 + RAND() * 2, 'Opposite', 'Setter'));
SET position_str = (select elt(0.5 + RAND() * 6, 'nize', 'ur', 'bique', 'fam', 'why you', 'souka'));
SET serve_int = 8;
SET serve_reception_int = 8;
SET dig_int = 8;
SET set_int = 8;
SET spike_int = 8;
SET block_int = 8;

INSERT INTO players_table ( name, school, position, serve, serve_reception, dig, set_a, spike, block_a ) VALUES ( name_str, school_str, position_str, serve_int, serve_reception_int, dig_int, set_int, spike_int, block_int );
SET  id_int = id_int + 1; 
END WHILE;

SELECT * FROM players_table;
END$$

DELIMITER ;

# Call the loop/generate players function
USE players;

CALL test_mysql_while_loop();

-- # SQL Script that creates fake patient data
-- # Create the database parameters; ID, Name, Gender, Disease
-- CREATE DATABASE IF NOT EXISTS patients;
-- USE patients;

-- CREATE TABLE IF NOT EXISTS patient_table ( ID smallint unsigned not null AUTO_INCREMENT, name varchar(20) not null, gender varchar(20) not null, \
-- disease varchar(50) not null, primary key (ID) );


-- # Create a loop function; Generates 100 Patients
-- DELIMITER $$

-- USE patients

-- CREATE PROCEDURE test_mysql_while_loop()
-- BEGIN
-- DECLARE id_int  INT;
-- DECLARE name_str  VARCHAR(255);
-- DECLARE gender_str  VARCHAR(255);
-- DECLARE disease_str  VARCHAR(255);

-- SET id_int = 1;

-- WHILE id_int  <= 100 DO

-- SET name_str =  (select elt(0.5 + RAND() * 5, 'Hinata', 'Kageyama', 'Atsumu', 'Hoshiumi', 'Sakusa', 'Oikawa'));
-- set gender_str = (select elt(0.5 + RAND() * 2, 'Opposite', 'Setter'));
-- SET disease_str = (select elt(0.5 + RAND() * 6, 'nize', 'ur', 'bique', 'fam', 'why you', 'souka'));

-- INSERT INTO patient_table ( name, gender, disease ) VALUES ( name_str, gender_str, disease_str );
-- SET  id_int = id_int + 1;
-- END WHILE;

-- SELECT * FROM patient_table;
-- END$$

-- DELIMITER ;

-- # Call the loop/generate patients function
-- USE patients;

-- CALL test_mysql_while_loop();