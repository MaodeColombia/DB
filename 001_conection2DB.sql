-- iniciar MySQL del xampp https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821195416.png
-- o iniciar de Workbench
-- oinstalar MySQL desde 0, https://www.youtube.com/watch?v=j9MqyiStP9I
-- iniciar terminal de Windows PowerShell https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821200534.png
MySQL -u root -h localhost; --si el SGBD tuviese password el comando sentencia sería "MySQL -u root -h localhost -p<password>""
-- NOTE: ype 'help;' or '\h' for help. Type '\c' to clear the current input statement.
-- lo que se acaba de hacer es conectarse a un servidor de mysql (en este caso es la propia máquina, localhost)
-- tiene abierto un puerto específico 

/*
si se presenta el error
"mysql no se reconoce como un comando interno o externo", dos opciones 
1. agregar el PATH https://www.youtube.com/watch?v=QYFBiRIt5tM
2. en la linea de comandos ir hasta la carperta ..\MySQL server 8.0\bin
*/

show databases; 
-- NOTE: Commands end with ; or \g.
-- se ve la lista de las Bases de Datos - DB que están el servidor
-- La DB "information_schema" es la DB de MySQL que usa para ejecutar el SQL; NOTE: esto es lo que se llama recursividad
-- https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821202510.png
use test; 
-- comando use "ubica el puntero" en la DB test, de esta manera, a menos que se diga por comando algo diferente de aquí en adelante usará esta DB
-- y se confirma que el puntero está en "test" con el mensaje "Database changed"
-- https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821204210.png
show tables;
-- una vez dentro del "DB test" se requier saber el contenido, en este caso la DB no tiene tablas, esto se confirma con el mensaje "Empty set"
use test;
show tables;
-- ahora el puntero está sobre la "DB temp"

/*
NOTE: en caso que no se conociiera el puntero a qué DB está apuntando se usa el comando 
select database();
-- https://github.com/MaodeColombia/DB/blob/main/extra/image/20220821205226.png
*/

