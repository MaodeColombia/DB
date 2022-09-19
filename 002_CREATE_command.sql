-- como se se ha estado usando la CL - Linea de Comandos, un comando que es util se este que sirve para borrar la pantalla en windows
system cls; 
-- https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821221621.png

/*
LECTURA RECOMENDADA:
InnoDB y MyISAM: El ying yang de MySQL ☯🐬
https://platzi.com/tutoriales/1272-sql-mysql/4484-innodb-y-myisam-el-ying-yang-de-mysql/
*/


CREATE DATABASE plataform_operation;
-- Comando CREATE, como su nombre lo dice crea, en este caso combinado con el comando DATABASE crea una base de datos, entonces en el servidor local se crea una DB con nombre "plataform_operation", se puede comprobar con el comando SHOW DATABASES;
SHOW DATABASES;
-- https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821223041.png



-- NOTE: si se usa el comando "IF NOT EXISTS" cuando se crea una DB, evitamos que se vuelva un error
CREATE DATABASE plataform_operation;
CREATE DATABASE IF NOT EXISTS plataform_operation;
-- https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821224141.png


SELECT DATABASE(); -- para conocer a dónde está el puntero
USE PLATAFORM_OPERATION; -- se mueve el puntero a la DB que se acaba de crear
--NOTE: notese que que el nombre de la DB cuando se creó "plataform_operation" fue con letras minusculas y aquí cuando se uso el nombre de la DB se uso con mayuscula sostenida, con esto se quiere dar a entender que MySQL "No es sensible a mayúsculas/minúsculas"
-- https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821225851.png


CREATE TABLE IF NOT EXISTS books(
    `book_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `author` INTEGER UNSIGNED,
    `title` VARCHAR(100) NOT NULL,
    `year` INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    `language` VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    `cover_url` VARCHAR(500),
    `price` DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    `sellable` TINYINT(1) DEFAULT 1,
    `copies` INTEGER NOT NULL DEFAULT 1,
    `description` TEXT
);
/*
INTEGER         tipo entero
UNSIGNED        entero sin signo
PRIMARY         llave primaria de la tabla
AUTO_INCREMENT  llave autoincremental
https://github.com/MaodeColombia/DB/blob/main/extra/image/20220822004247.png

se tiene que UNSIGNED describe a INTEGER como tambien AUTO_INCREMENT describe a PRIMARY
    https://github.com/MaodeColombia/DB/blob/main/extra/image/20220822004847.png
    https://github.com/MaodeColombia/DB/blob/main/extra/image/20220822005047.png

eventualmente se podría dejar que el INTEGER sea positivo y negativo
    https://github.com/MaodeColombia/DB/blob/main/extra/image/20220822005347.png

NOTE: una buena práctica de Bases de Datos es:
- El sustantivo en plural
- El sustantivo en ingles
*/

/*
NOTE:
    TODA TABLA SIN EXCEPCION ALGUNA DEBE TENER UN "ID"
    con el ID se identifica de manera única cualquier tupla en una tabla
*/

/*
AUTO_INCREMENT:
    Esta opción incrementa de uno en uno el número de registro, independientemente de los registros que por alguna razón se hayan borrado; el número más grande de este campo no representa la cantidad de registros que tiene la tabla

NOT NULL
    SQL no permite que esté vacio este dato, a sea que SQL no genera el registro cuando no se registre información en este campo

DEFAULT
    SQL de manera predeterminada rellena este dato con la información que se registre delante del comando DEFAULT

COMMENT
    Agrea un comentario al campo, esto solo lo ve el desarrollador de la Base de Datos.

Cuando se requiera hacer uso de imagenes, nunca se almacenan en esta area, se agrega la url de la imagen.

DOUBLE
    Este atributo se usa para poder usar números con decimales, en el caso del ejemplo sedefine el uso de hasta 6 cifras para la parte entera y 2 cifras para la parte decimal.

TINYINT
    Es un tipo de entero que puede ir de 0 a 255 cuando se usa como Unsigned o va de -128 a 127
    https://dev.mysql.com/doc/refman/8.0/en/integer-types.html

    "TINYINT(1) es sinónimos de bool o boolean, un valor cero se considera falso, los valores distintos de cero, verdadero."
    https://dev.mysql.com/doc/refman/8.0/en/other-vendor-data-types.html
    
TEXT
    Tiene una longitud de 65535 caracteres.
    https://desarrolloweb.com/articulos/1054.php#cadena
    https://www.tutorialesprogramacionya.com/mysqlya/temarios/descripcion.php?inicio=42&cod=78&punto=59
*/

/*
OBSERVACIONES FINALES
    1. A pesar que en el lenguaje SQL es insensible a mayúsculas/minúsculas, una buena práctica de programación es escribir en MAYÚSCULA SOSTENIDA todas las palabras reservadas del SQL y el resto como nombre de campos, de tablas, de bases de datos escribir en minúscula sostenida. 
    2. también es una buena práctica definir explicitamente nombres de los campo con el acento grave `, su ASCII es alt+96 (no acento agudo ´ alt+239), tampoco confundir con comilla simple ' alt+39; no debería pasar nunca, que se use una palabra reservada de SQL como nombre de cualquier objeto, como por ejemplo year YEAR
    3. Curso completo de MySQL en YouTube
    https://youtube.com/playlist?list=PLIygiKpYTC_4KmkW7AKH87nDWtb29jHvN
*/


CREATE TABLE IF NOT EXISTS authors(
    `author_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `nationality` VARCHAR(3)
);

/*
Proporciona información sobre las columnas de una tabla, DESCRIBE es un sinónimo para SHOW COLUMNS FROM
https://conclase.net/mysql/curso/sqlsen/DESCRIBE 
*/
DESCRIBE authors;
/*
El comando muestra lo siguiente
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| author_id   | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name        | varchar(100)     | NO   |     | NULL    |                |
| nationality | varchar(3)       | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+
*/


DESCRIBE books;
/*
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| book_id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| author      | int(10) unsigned | YES  |     | NULL    |                |
| title       | varchar(100)     | NO   |     | NULL    |                |
| year        | int(10) unsigned | NO   |     | 1900    |                |
| language    | varchar(2)       | NO   |     | es      |                |
| cover_url   | varchar(500)     | YES  |     | NULL    |                |
| price       | double(6,2)      | NO   |     | 10.00   |                |
| sellable    | tinyint(1)       | YES  |     | 1       |                |
| copies      | int(11)          | NO   |     | 1       |                |
| description | text             | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+
*/

SHOW FULL COLUMNS FROM books;
/*
+-------------+------------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+
| Field       | Type             | Collation          | Null | Key | Default | Extra          | Privileges                      | Comment            |
+-------------+------------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+
| book_id     | int(10) unsigned | NULL               | NO   | PRI | NULL    | auto_increment | select,insert,update,references |                    |
| author      | int(10) unsigned | NULL               | YES  |     | NULL    |                | select,insert,update,references |                    |
| title       | varchar(100)     | utf8mb4_general_ci | NO   |     | NULL    |                | select,insert,update,references |                    |
| year        | int(10) unsigned | NULL               | NO   |     | 1900    |                | select,insert,update,references |                    |
| language    | varchar(2)       | utf8mb4_general_ci | NO   |     | es      |                | select,insert,update,references | ISO 639-1 Language |
| cover_url   | varchar(500)     | utf8mb4_general_ci | YES  |     | NULL    |                | select,insert,update,references |                    |
| price       | double(6,2)      | NULL               | NO   |     | 10.00   |                | select,insert,update,references |                    |
| sellable    | tinyint(1)       | NULL               | YES  |     | 1       |                | select,insert,update,references |                    |
| copies      | int(11)          | NULL               | NO   |     | 1       |                | select,insert,update,references |                    |
| description | text             | utf8mb4_general_ci | YES  |     | NULL    |                | select,insert,update,references |                    |
+-------------+------------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+
*/


/*
para introducir a la tabla books el campo `copies` despues del campo `sellable`
*/
ALTER TABLE books ADD `copies` INTEGER NOT NULL DEFAULT 1 AFTER `sellable`
/*
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| book_id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| author      | int(10) unsigned | YES  |     | NULL    |                |
| title       | varchar(100)     | NO   |     | NULL    |                |
| year        | int(10) unsigned | NO   |     | 1900    |                |
| language    | varchar(2)       | NO   |     | es      |                |
| cover_url   | varchar(500)     | YES  |     | NULL    |                |
| price       | double(6,2)      | NO   |     | 10.00   |                |
| sellable    | tinyint(1)       | YES  |     | 1       |                |
| copies      | int(11)          | NO   |     | 1       |                |
| description | text             | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+
*/


CREATE TABLE clients (
    `client_id` INTEGER  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `birthday` DATETIME,
    `gender` ENUM('M','F','ND'),
    `active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* 
ENUM
    https://blogprog.gonzalolopez.es/articulos/tipo-de-dato-enum-en-mysql.html
    El tipo de dato enum en mysql representa una enumeración. Puede tener un máximo de 65535 valores distintos y es una cadena cuyo valor se elige de una lista enumerada de valores permitidos que se especifica al definir el campo y puede ser una cadena vacía e incluso null. Dicha lista de valores comienza en 1 no como los arrays en los lenguajes de programación que comienzan en 0.

    Este tipo de dato hay que usarlo cuando en una base de datos se define un tipo, por ejemplo, tenemos un sitio web con diferentes tipos de usuario y va a ser muy limitado pues lo ideal es definir un campo "tipo_usuario" de tipo enum o definir unas categrías en una tienda, etc...
    El tipo de dato enum en MySQL es más eficiente que el tipo varchar.
    Código de creación de la tabla y de inserción / modificación:
*/


/* Diferentes formas de ingresar registros en una tabla */
/* Opción 1 */
INSERT INTO authors (author_id,name,nationality) VALUES ('','Juan Rulfo','MEX');

/* Opción 2 */
INSERT INTO authors (name,nationality) VALUES ('Gabriel García Márquez','COL');

/* Opción 3 */
INSERT INTO authors VALUES ('','Juan Gabriel Vásquez','COL')

/* Opción 4
todo en un solo comando*/
INSERT INTO authors (name,nationality)
VALUES ('Julio Cortázar','ARG'),
('Isabel Allende','CHI'),
('Octavio Paz','MEX'),
('Juan Carlos Onetti','URU');


SELECT * FROM authors;
/* 
    Este Query muestra todos los registros de authors
*/

DELETE FROM authors;
/*
DELETE
    En este caso se usa para borrar todos los registros de la tabla authors
*/

