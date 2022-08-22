-- como se se ha estado usando la CL - Linea de Comandos, un comando que es util se este que sirve para borrar la pantalla
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