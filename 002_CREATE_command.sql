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


CREATE TABLE books IF NOT EXISTS(
    book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    author ,
    title VARCHAR(100) NOT NULL,
    year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    cover_url VARCHAR(500),
    price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    sellable TINYINT(1) DEFAULT 1,
    description TEXT
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
    2.
    3. Curso completo de MySQL en YouTube
    https://youtube.com/playlist?list=PLIygiKpYTC_4KmkW7AKH87nDWtb29jHvN
*/