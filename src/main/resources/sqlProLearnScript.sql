drop schema if exists prolearn;
drop user if exists admin_1;

CREATE SCHEMA prolearn;

create user 'admin_1'@'%' identified by 'contra_1';
grant all privileges on prolearn.* to 'admin_1'@'%';
flush privileges;

/*creacion de tablas*/

CREATE TABLE prolearn.usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(250) NOT NULL,
    apellidos varchar(250) NOT NULL,
    email varchar(25) NOT NULL,
    password varchar(512) NOT NULL
    
    
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE prolearn.rol (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE prolearn.usuario_rol (
    usuario_id INT,
    rol_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (rol_id) REFERENCES rol(id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE prolearn.categorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria VARCHAR(255) NOT NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE prolearn.capitulo_padre (
  id_capitulo INT AUTO_INCREMENT PRIMARY KEY,
  nombre_capitulo VARCHAR(255) NOT NULL,
  numero_capitulo INT NOT NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE prolearn.capitulo_hijo (
  id_capitulo INT AUTO_INCREMENT PRIMARY KEY,
  id_capitulo_padre INT NOT NULL,
  nombre_capitulo VARCHAR(255) NOT NULL,
  video_capitulo varchar(1024),
  numero_capitulo INT NOT NULL,
  FOREIGN KEY (id_capitulo_padre) REFERENCES capitulo_padre(id_capitulo) ON DELETE NO ACTION
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE prolearn.cursos (
  id_curso INT AUTO_INCREMENT PRIMARY KEY,
  nombre_curso VARCHAR(250) NOT NULL,
  descrp_curso TEXT,
  estado_curso BOOLEAN,
  thumbnail_curso VARCHAR(1024),
  categoria_curso INT NOT NULL,
  FOREIGN KEY (categoria_curso) REFERENCES categorias(id_categoria)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE prolearn.capitulo_x_curso (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_curso INT NOT NULL,
  id_capitulo INT NOT NULL,
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
  FOREIGN KEY (id_capitulo) REFERENCES capitulo_hijo(id_capitulo) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


/*insercion de datos*/

INSERT INTO prolearn.rol(nombre)
values('ROLE_USER'),('ROLE_ADMIN');

INSERT INTO prolearn.usuarios (nombre, apellidos, email, password)
VALUES ('Juan', 'Perez', 'juan@example.com', '$2a$12$kmdtxMDZnpAz1vjlLBAUGu77/NU2hn0yFSHewvEJbvdNXckwteJHS');
 
INSERT INTO prolearn.usuarios (nombre, apellidos, email, password)
VALUES ('admin', 'admin', 'admin@prolearn.com', '$2a$12$kmdtxMDZnpAz1vjlLBAUGu77/NU2hn0yFSHewvEJbvdNXckwteJHS');

INSERT INTO prolearn.usuario_rol(usuario_id,rol_id)
values('1','1'),('2','2');



INSERT INTO prolearn.categorias (nombre_categoria) VALUES ('Idiomas'), ('Programacion'), ('Diseño');

INSERT INTO prolearn.capitulo_padre (nombre_capitulo, numero_capitulo) VALUES

/*Inserts de Padres Python */

('Introduccion', 1),
('Variables', 2),
('Operadores', 3),
('Salida y entradas de datos', 4),
('Operaciones aritmeticas', 5),

/*Inserts de Padres MySql */

('Crear Base de datos', 2),
('Conceptos básicos de MySQL', 3),
('Consultas SQL', 4),
('Funciones de agregación', 5),


/*Inserts de Padres JavaScript */

('Tipos de datos', 2),
('Capturas de datos', 3),
('Operadores', 4),
('Funciones', 5),

/*Inserts de Padres IA */

('Numpy', 2),
('Libreria Pandas', 3),
('Matplotlib', 4),
('Machine Learning in python', 5),

/*Inserts de Padres  Curso de AutoCad */

('Conocimientos Basicos', 2),
('Figuras', 3),
('Herramientas', 4),

/*Inserts de Padres Curso de Ingles */

('Conversaciones', 2),
('Numeros', 3),
('Mr y Ms', 4);

INSERT INTO prolearn.capitulo_hijo (id_capitulo_padre, nombre_capitulo, video_capitulo, numero_capitulo) VALUES

/*Inserts de Submodulos Python */
(1,'Lenguaje de Programacion', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%201%2F1.%20Programaci%C3%B3n%20en%20Python%20_%20Lenguaje%20de%20Programaci%C3%B3n%20Python.mp4?alt=media&token=d123f6a2-939a-42fd-a65d-f7ab73203ef3', 1),
(1,'Intalacion Python', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%201%2F2.%20Programaci%C3%B3n%20en%20Python%20_%20Descargar%20e%20instalar%20Python%20y%20PyCharm.mp4?alt=media&token=6548629f-35a3-499f-b994-012337add54c', 2),
(1,'Primer Codigo', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%201%2F3.%20Programaci%C3%B3n%20en%20Python%20_%20Hola%20mundo.mp4?alt=media&token=533887e8-b644-4f1a-8023-537a6c5e4ae4', 3),

(2, 'Asignacion de valores', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%202%2F4.%20Programaci%C3%B3n%20en%20Python%20_%20Asignaci%C3%B3n%20de%20valores.mp4?alt=media&token=f032282e-ddea-441f-8b9f-ca29280a29a6', 1),
(2, 'Comentarios', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%202%2F5.%20Programaci%C3%B3n%20en%20Python%20_%20Comentarios.mp4?alt=media&token=f31d21b4-d6cb-4858-b3ac-56238179ab86', 2),
(2, 'Operadores Aritmeticos', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%202%2F6.%20Programaci%C3%B3n%20en%20Python%20_%20Operadores%20Aritm%C3%A9ticos.mp4?alt=media&token=49ca0f5d-f062-4cd1-b2e5-0a2b31ad9475', 3),

(3,'Operadores Relacionales','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%203%2F7.%20Programaci%C3%B3n%20en%20Python%20_%20Operadores%20Relacionales.mp4?alt=media&token=a8043c71-3fea-4a54-a3fe-cd59ffed1448',1),
(3,'Operadores Logicos','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%203%2F8.%20Programaci%C3%B3n%20en%20Python%20_%20Operadores%20L%C3%B3gicos.mp4?alt=media&token=29dedaa1-8f4e-4279-b97e-407de2b8a0e3',2),
(3,'Operadores de asignacion','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%203%2F9.%20Programaci%C3%B3n%20en%20Python%20_%20Operadores%20de%20asignaci%C3%B3n.mp4?alt=media&token=c83c23d2-f29f-43e0-a920-ee658f20639c',3),

(4,'Salida de datos','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%204%2F10.%20Programaci%C3%B3n%20en%20Python%20_%20Salida%20de%20datos.mp4?alt=media&token=f360dd27-26c3-401b-b4ab-adb3cb462e0d',1),
(4,'Entrada de datos','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%204%2F11.%20Programaci%C3%B3n%20en%20Python%20_%20Entrada%20de%20datos.mp4?alt=media&token=ed0c5254-da88-48f0-abb7-3b254ed23c18',2),
(4,'Funciones Integradas', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%204%2F12.%20Programaci%C3%B3n%20en%20Python%20_%20Funciones%20integradas.mp4?alt=media&token=9950c0c8-cee3-4d9e-8d6e-638ca14d63d3',3),

(5,'Operacion Aritmetica','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%205%2F13.%20Programaci%C3%B3n%20en%20Python%20_%20Ejercicio%201%20%E2%80%93%20Operaci%C3%B3n%20aritm%C3%A9tica.mp4?alt=media&token=b8be2578-83a8-46c4-a978-b9c0ba765239',1),
(5,'Operacion con 3 Tipos de Operadores','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%205%2F14.%20Programaci%C3%B3n%20en%20Python%20_%20Ejercicio%202%20%E2%80%93%20Operaci%C3%B3n%20con%203%20tipos%20de%20operadores.mp4?alt=media&token=7aef2655-f952-4af7-a8f7-4564a7700115',2),
(5,'Intercambiar el valor de 2 variables','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%205%2F15.%20Programaci%C3%B3n%20en%20Python%20_%20Ejercicio%203%20%E2%80%93%20Intercambiar%20el%20valor%20de%202%20variables.mp4?alt=media&token=82424758-baa9-4344-bc9f-8687509adf1a',3),

/*Inserts de Submodulos MySql */
(1,'Que es MySql','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%201%2FCURSO%20RAPIDO%20de%20MYSQL%202020%20%23%201%20%F0%9F%9B%A2%EF%B8%8F%20QUE%20ES%20MYSQL%20INTRODUCCI%C3%93N).mp4?alt=media&token=bf21551e-44fe-47a7-9d49-466c4c685b12',1),
(1,'Instalacion','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%201%2FCURSO%20RAPIDO%20de%20MYSQL%202020%20%23%202%20%F0%9F%9B%A2%EF%B8%8FINSTALACI%C3%93N.mp4?alt=media&token=18006ff2-e4fa-4793-975d-769ef07f7de7',2),

(6,'Asignacion de valores', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%202%2F4.%20Programaci%C3%B3n%20en%20Python%20_%20Asignaci%C3%B3n%20de%20valores.mp4?alt=media&token=f032282e-ddea-441f-8b9f-ca29280a29a6', 1),
(6,'Comentarios', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%202%2F5.%20Programaci%C3%B3n%20en%20Python%20_%20Comentarios.mp4?alt=media&token=f31d21b4-d6cb-4858-b3ac-56238179ab86', 2),
(6,'Operadores Aritmeticos', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Python%2FCapitulo%202%2F6.%20Programaci%C3%B3n%20en%20Python%20_%20Operadores%20Aritm%C3%A9ticos.mp4?alt=media&token=49ca0f5d-f062-4cd1-b2e5-0a2b31ad9475', 3),

(7,'Backup (Exportar e Importar','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%203%2FCURSO%20RAPIDO%20DE%20MYSQL%202020%20%23%209%20%F0%9F%9B%A2%EF%B8%8F%20BACKUP%20(EXPORTAR%20E%20IMPORTAR%20DB).mp4?alt=media&token=880f76da-99db-476e-9806-8e2d7df1a388',1),
(7,'Insertar Datos','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%203%2FCURSO%20RAPIDO%20de%20MYSQL%202020%20%23%208%20%F0%9F%9B%A2%EF%B8%8F%20INSERTAR%20DATOS.mp4?alt=media&token=3b371701-12cc-4b6d-aced-4762d61d63ae',2),
(7,'Consultas SQL','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%203%2FCURSO%20R%C3%81PIDO%20DE%20MYSQL%202020%20%23%2010%20%F0%9F%9B%A2%EF%B8%8F%20CONSULTAS%20SQL%20(EL%20COMIENZO).mp4?alt=media&token=3aca7bcf-d6ec-4d21-a5c9-18b475526e5e',3),

(8,'Select y From','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%204%2FCURSO%20RAPIDO%20DE%20MYSQL%202020%20%23%2011%20%F0%9F%9B%A2%EF%B8%8F%20SELECT%20y%20FROM%20(consultas%20SQL).mp4?alt=media&token=9b2ad376-95d2-436f-ab07-666b8f4a51df',1),
(8,'Where','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%204%2FCURSO%20RAPIDO%20DE%20MYSQL%202020%20%23%2012%20%F0%9F%9B%A2%EF%B8%8F%20WHERE%20%20(consultas%20SQL).mp4?alt=media&token=784e0f1c-b3a4-4ee9-9477-2b82b0f90440',2),
(8,'Where usando LIKE','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%204%2FCURSO%20RAPIDO%20DE%20MYSQL%202020%20%23%2013%20%F0%9F%9B%A2%EF%B8%8F%20WHERE%20%20usando%20LIKE%20(consultas%20SQL).mp4?alt=media&token=eb52812d-7add-4c6c-a109-405e62aff654',3),

(9,'Where usando Between','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%205%2FCURSO%20RAPIDO%20DE%20MYSQL%202020%20%23%2014%20%F0%9F%9B%A2%EF%B8%8F%20WHERE%20usando%20BETWEEN%20%20(consultas%20SQL).mp4?alt=media&token=67ccf7b8-ec4a-473a-8c22-ba1671929d11',1),
(9,'Funciones agregadas','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%205%2FCURSO%20RAPIDO%20DE%20MYSQL%202020%20%23%2015%20%F0%9F%9B%A2%EF%B8%8F%20FUNCIONES%20%20agregadas%20(SUM%2C%20MIN%2C%20COUNT%2CMAX).mp4?alt=media&token=9955c3c6-b699-4230-b9a0-58f2f7034bd9',2),
(9,'Group By (consultas SQL)','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/MySql%2FCapitulo%205%2FCURSO%20RAPIDO%20DE%20MYSQL%202020%20%23%2015%20%F0%9F%9B%A2%EF%B8%8F%20FUNCIONES%20%20agregadas%20(SUM%2C%20MIN%2C%20COUNT%2CMAX).mp4?alt=media&token=9955c3c6-b699-4230-b9a0-58f2f7034bd9',3),

/*Inserts de Submodulos JavaScript */
(1,'Instalar Visual Studio','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%201%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20COMO%20INSTALAR%20VISUAL%20STUDIO%20CODE%20EN%20WINDOWS%2C%20(video%202).mp4?alt=media&token=78a24089-ccae-4f34-a974-10c652b8c398',1),
(1,'Introduccion','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%201%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20INTRODUCCION%2C%20(video%201).mp4?alt=media&token=47b88765-6aa5-45e6-8292-47138c1c7081',2),
(1,'Primer Codigo','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%201%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20PRIMER%20CODIGO%20JAVASCRIPT%20%2C%20(video%204).mp4?alt=media&token=e23895ca-1efa-458e-865e-14ab38320528',2),

(10,'Concatenacion','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%202%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20CONCATENACION%20(video%207).mp4?alt=media&token=c7bf5656-0229-4a20-ab26-4e771570a140',1),
(10,'Tipos de datos','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%202%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20TIPOS%20DE%20DATOS%20(video%206).mp4?alt=media&token=35dc5cc6-f78d-4cb5-872c-64c6a67a0817',2),
(10,'Variables','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%202%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20VARIABLES%20(video%205).mp4?alt=media&token=5ddc05cc-c5be-446a-b5f2-d24333d2fdc1',3),

(11,'Capturar datos del usuario','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%203%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20CAPTURAR%20DATOS%20DEL%20USUARIO%20(video%209).mp4?alt=media&token=1c4a96a0-430f-4407-82a6-e28d1a8591c2',1),
(11,'Comentarios','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%203%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20COMENTARIOS%20(video%208).mp4?alt=media&token=b3386e15-c413-4a9e-88b0-0a86dfbbfeb9',2),
(11,'Constantes','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%203%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20CONSTANTES%20%20(video%2010).mp4?alt=media&token=0df82fca-b1e1-41c6-bd0d-570b00b594ea',3),

(12,'Funciones Matematicas','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%204%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20FUNCIONES%20MATEMATICAS%20(video%2014).mp4?alt=media&token=b360a166-3dc9-4e47-9db0-cced08078439',1),
(12,'Operadores asignados','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%204%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20OPERADORES%20ASIGNACION%20%5BINCREMENTO%20Y%20DECREMENTO%20%5D(video%2012).mp4?alt=media&token=dee53d57-ad6b-4797-9281-eef78bfce757',2),
(12,'Operadores de comparacion','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%204%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20OPERADORES%20DE%20COMPARACION%20(video%2013).mp4?alt=media&token=b299bd7e-43df-4bd2-bb8d-551bb6e9ae88',3),

(13,'Cadenas de Texto','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%205%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20CADENAS%20DE%20TEXTO%20(video%2015).mp4?alt=media&token=fd8936ee-bda4-4e49-ba70-c27ed71119c0',1),
(13,'Condicionales','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%205%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20CONDICIONALES%20%5BIF-ELSE%5D%2C%20(video%2018).mp4?alt=media&token=7e2d8898-9868-4300-af72-f65e76f364c4',2),
(13,'Funciones String','https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/JavaScript%2FCapitulo%205%2FCurso%20completo%20de%20JavaScript%20desde%20cero%20_%20FUNCIONES%20STRING%20(video%2016).mp4?alt=media&token=a84f7b56-04a6-48b8-b01a-c91148ffe6ba',3),

/*Inserts de Submodulos IA */

(1, 'Machine Learning Python', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%201%2FINTRODUCCI%C3%93N%20AL%20CURSO_%20MACHINE%20LEARNING%20CON%20PYTHON%20_%20%230%20Curso%20Machine%20Learning%20con%20Python%20(1).mp4?alt=media&token=1fdc0f2f-96d0-45d8-8cef-c8dc6d42c616', 1),
(1, 'Ide Spyder', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%201%2FINTRODUCCI%C3%93N%20AL%20IDE%20SPYDER%20_%20%232%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=435c029d-6898-426e-bdd5-4099d50331ff', 2),
(1, 'Lenguajes para Machine Learning', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%201%2FLENGUAJES%20DE%20PROGRAMACI%C3%93N%20PARA%20MACHINE%20LEARNING%20_%20%231%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=75522dbb-7105-4535-aebe-e69f0deccf28', 3),

(14, 'Introduccion Numpy 1', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%202%2FINTRODUCCI%C3%93N%20A%20LA%20LIBRER%C3%8DA%20NUMPY%20DE%20PYTHON%20-%20PARTE%201%20_%20%233%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=4359bf78-9f04-43ca-99c4-9eac8d8ec461', 1),
(14, 'Introduccion Numpy 2', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%202%2FINTRODUCCI%C3%93N%20A%20LA%20LIBRER%C3%8DA%20NUMPY%20DE%20PYTHON%20-%20PARTE%202%20_%20%234%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=f8935bc4-c924-4689-8c3a-f4266354aba5', 2),

(15, 'Libreria Pandas 1', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%203%2FINTRODUCCI%C3%93N%20A%20LA%20LIBRER%C3%8DA%20PANDAS%20DE%20PYTHON%20-%20PARTE%201%20_%20%235%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=b4bf0407-4ff5-456b-ba4f-e1b533557f07', 1),
(15, 'Libreria Pandas 2', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%203%2FINTRODUCCI%C3%93N%20A%20LA%20LIBRER%C3%8DA%20PANDAS%20DE%20PYTHON%20-%20PARTE%202%20_%20%236%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=489d47c9-f2d6-4b2a-bb0f-a7f0e3c10804', 2),

(16, 'CSS Basics', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%204%2FINTRODUCCI%C3%93N%20DE%20LA%20LIBRER%C3%8DA%20MATPLOTLIB%20DE%20PYTHON%20-%20PARTE%201%20_%20%237%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=1a81c64a-33d5-4535-97ff-c083f0d72266', 1),
(16, 'CSS Selectors', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%204%2FINTRODUCCI%C3%93N%20DE%20LA%20LIBRER%C3%8DA%20MATPLOTLIB%20DE%20PYTHON%20-%20PARTE%202%20_%20%238%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=ae71e9dc-3d14-47bc-b660-7052db8a89bc', 2),

(17, 'Varianza en Machine Learning', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%205%2FBIAS%20Y%20VARIANZA%20EN%20MACHINE%20LEARNING%20_%20%2310%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=fd100d2c-ad95-4f60-9d83-5800809ec217', 1),
(17, 'Libreria Scikit', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ai%2FCapitulo%205%2FINTRODUCCI%C3%93N%20DE%20LA%20LIBRER%C3%8DA%20SCIKIT%20LEARN%20DE%20PYTHON%20_%20%239%20Curso%20Machine%20Learning%20con%20Python.mp4?alt=media&token=f9254f72-9961-407c-8f78-06ce6652a503', 2),

/*Inserts de Submodulos Curso de AutoCad */

(1, 'Interfaz y Configuracion', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%201%2F01.%20Interfaz%20y%20Configuraciones%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=55233266-93d6-4066-a54d-298d1f0241ae', 1),
(1, 'Unidades', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%201%2F02.%20Unidades%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=c654633d-9021-4535-8c75-11ad2a2c5a96', 2),
(1, 'Comandos', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%201%2F03.%20Comandos%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=89976e0a-ec25-453f-b8c9-cc00779a6583', 3),

(18, 'Formas de Selecion', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%202%2F04.%20Formas%20de%20Selecci%C3%B3n%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=149b4d12-a208-40ce-8d9a-89aa289f7ba3', 1),
(18, 'Atajos', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%202%2F05.%20Atajos%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=355e0483-cd02-4866-baba-658f407a165c', 2),
(18, 'Lineas', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%202%2F05.%20Atajos%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=355e0483-cd02-4866-baba-658f407a165c', 3),

(19, 'Polilinea', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%203%2F07.%20Polil%C3%ADnea%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=4572df02-467f-4ea4-ae77-8f7473263be8', 1),
(19, 'Rectangulos y Poligonos', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%203%2F08.%20Rect%C3%A1ngulos%20y%20Pol%C3%ADgonos%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=8612e452-9687-4955-989d-65c5a2eed7af', 2),
(19, 'Circulos y Arcos', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%203%2F09.%20C%C3%ADrculos%2C%20Arcos%20y%20Elipses%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=141175a0-0d28-40ee-a53f-1345ddb8315c', 3),

(20, 'Mover, Girar y Escalar', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%204%2F10.%20Mover%20%2C%20Girar%20%20y%20Escalar%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=72ce643d-71ae-4105-9e35-e294fc176ec7', 1),
(20, 'Recortar y Alargar', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%204%2F11.%20Recortar%20y%20Alargar%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=bb278516-4c08-429e-84bb-1a88fa73b1f7', 2),
(20, 'Desface', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Autocad%2FCapitulo%204%2F12.%20Desface%20_%20AutoCAD%202021%20_%20Conocimientos%20B%C3%A1sicos.mp4?alt=media&token=acc514b4-52e8-448b-9ceb-e62ce2973124', 3),

/*Inserts de Submodulos Curso de Ingles */

(1, 'Abcedario', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%201%2FEL%20ABECEDARIO%20EN%20INGL%C3%89S%20-%20LETRAS%20QUE%20CAUSAN%20CONFUSI%C3%93N.mp4?alt=media&token=d8d5325c-37dd-4ea3-85be-399f1aa66f16', 1),
(1, 'Abcedario 2', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%201%2FEL%20ABECEDARIO%20EN%20INGL%C3%89S%20-%20SPELLING%20WORDS.mp4?alt=media&token=e7450ac1-0bc2-48d6-8aad-17a69951112e', 2),
(1, 'Learn it', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%201%2FEL%20ABECEDARIO%20EN%20INGL%C3%89S%20_%20THE%20ALPHABET_%20APRENDE%20EL%20ALFABETO%20EN%20INGL%C3%89S.mp4?alt=media&token=0946f37f-2354-4054-a514-39cfbccf404a', 3),

(21, 'Conversacion', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%202%2FCONVERSACI%C3%93N%20EN%20INGL%C3%89S%20-%20CONOCIENDO%20A%20ALGUIEN%20POR%20PRIMERA%20VEZ.mp4?alt=media&token=2781eeee-e7ba-476b-b317-fdf7c6c874f6', 1),
(21, 'Mr y Ms', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%202%2FC%C3%93MO%20USAR%20MR.%20MRS.%20MS.%20MISS.mp4?alt=media&token=59805e88-55fe-4f06-a1af-44065988f008', 2),
(21, 'Entrevista de Trabajo', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%202%2FEL%20ABECEDARIO%20EN%20INGL%C3%89S%20-%20ENTREVISTAS%20DE%20TRABAJO.mp4?alt=media&token=d7e96937-d436-449c-a940-7cb9b4e9ac8e', 3),


(22, 'Guia de Estudio', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%203%2FC%C3%93MO%20USAR%20MR.%20MRS.%20MS.%20MISS%20SIR%20MAAM%20%2B%20GU%C3%8DA%20DE%20ESTUDIO.mp4?alt=media&token=6659e689-1883-420b-8e70-fa30b9a1bf48', 1),
(22, '0-10', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%203%2FLOS%20N%C3%9AMEROS%20EN%20INGL%C3%89S%20DEL%200%20AL%2010.mp4?alt=media&token=63bf226a-6cf0-4670-8426-0b33eeb19f9a', 2),
(22, 'Saludos y Despedidas', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%203%2FSALUDOS%20Y%20DESPEDIDAS%20EN%20INGL%C3%89S.mp4?alt=media&token=ffc45aad-7a79-4190-98c3-e49873df87ee', 3),

(23, '0-20', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%204%2FLOS%20N%C3%9AMEROS%20EN%20INGL%C3%89S%20DEL%200%20AL%2020.mp4?alt=media&token=d3a2aaf6-64d6-4716-b401-35a96a66f214', 1),
(23, 'Matematicas en Ingles', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%204%2FMATEM%C3%81TICAS%20EN%20INGL%C3%89S%20-%20S%C3%8DMBOLOS%20MATEM%C3%81TICOS%20EN%20INGL%C3%89S.mp4?alt=media&token=e1f7c369-731e-4bec-afd9-b109be1a6305', 2),
(23, 'Numeros de Telefono', 'https://firebasestorage.googleapis.com/v0/b/prolearn-1a8ca.appspot.com/o/Ingles%2FCapitulo%204%2FN%C3%9AMEROS%20TELEF%C3%93NICOS%20Y%20DIRECCIONES%20EN%20INGL%C3%89S.mp4?alt=media&token=5349881e-cbb3-4fa2-99b0-20e684e1dc1a', 3);

INSERT INTO prolearn.cursos (nombre_curso, descrp_curso, estado_curso, thumbnail_curso, categoria_curso) VALUES

/*Inserts de curso Python */
('Python', 'Python es un lenguaje de programación de alto nivel, interpretado y multiparadigma, creado en 1989 por Guido van Rossum y mantenido actualmente por la Python Software Foundation. Python es conocido por su sintaxis clara y fácil de leer, lo que lo hace ideal para principiantes y expertos por igual.',
 true, 'https://www.dongee.com/tutoriales/content/images/2023/01/que-es-python-1.png', 2),
 
 /*Inserts de curso MySql */
('MySql', 'MySQL es un sistema de gestión de bases de datos relacionales (RDBMS) de código abierto, ampliamente utilizado en el desarrollo de aplicaciones web, móviles y de escritorio. MySQL es conocido por su rendimiento, fiabilidad y facilidad de uso.',
 true, 'https://datascientest.com/en/wp-content/uploads/sites/9/2023/11/mysql.webp', 2),
 
  /*Inserts de curso JavaScript */
 ('JavaScript','JavaScript es un lenguaje de programación versátil utilizado para crear páginas web interactivas y aplicaciones web. Es un lenguaje de scripting de lado del cliente que se ejecuta en los navegadores web, lo que permite a los desarrolladores crear páginas web dinámicas y receptivas. JavaScript también se utiliza para la programación del lado del servidor, lo que lo convierte en un lenguaje de programación de pila completa. Con su flexibilidad, JavaScript se utiliza en diversas aplicaciones, como juegos, aplicaciones móviles y aplicaciones de IA. Las bibliotecas de JavaScript, como TensorFlow.js y Brain.js, facilitan a los desarrolladores la creación de aplicaciones de IA utilizando JavaScript.',true,'https://miro.medium.com/v2/resize:fit:1200/1*LyZcwuLWv2FArOumCxobpA.png',2),
 
   /*Inserts de curso AI */
('Curso de AI', 'La inteligencia artificial (IA) es un campo de la ciencia de la computación que se centra en la creación de máquinas inteligentes que pueden pensar y aprender como los humanos. La IA implica el desarrollo de algoritmos y modelos que pueden analizar datos, identificar patrones y tomar decisiones con una intervención mínima de humanos. Con la IA, las máquinas pueden realizar tareas que normalmente requieren inteligencia humana, como la percepción visual, el reconocimiento de voz y el procesamiento de lenguaje natural. La IA se utiliza en diversas aplicaciones, como la robótica, la atención médica, las finanzas y el transporte.', true,
 'https://www.tarlogic.com/wp-content/uploads/2023/09/riesgos-seguridad-IA-3.jpg', 1),

  /*Inserts de curso AutoCad */
('Curso de AutoCad', ' Este curso es una introducción al software de diseño asistido por computadora AutoCAD, utilizado para crear diseños detallados 2D y 3D. Los estudiantes aprenderán los conceptos básicos de AutoCAD, incluyendo cómo crear y modificar objetos, trabajar con capas, usar herramientas de dibujo y generar dibujos precisos. A través de ejercicios prácticos y ejemplos del mundo real, los estudiantes adquirirán las habilidades necesarias para producir dibujos técnicos y diseños para diversas industrias, como arquitectura, ingeniería y construcción.',
 true, 'https://www.flashforge-eu.com/image/cache/catalog/product/autodesk/autocad/autodesk_autocad-1280x720.jpg', 2),

  /*Inserts de curso Ingles */
('Curso de Ingles', 'Este curso está diseñado para ayudar a los estudiantes a mejorar sus habilidades de idioma inglés de manera comprehensiva y atractiva. A través de una variedad de lecciones interactivas, los estudiantes desarrollarán sus habilidades de lectura, escritura, habla y escucha. El curso cubrirá gramática, vocabulario, pronunciación y aspectos culturales del idioma inglés. Para el final del curso, los estudiantes tendrán la confianza y la competencia para comunicarse efectivamente en inglés en entornos personales y profesionales.',
 true, 'https://www.magisnet.com/wp-content/uploads/2020/11/inglés.jpg', 3);

INSERT INTO prolearn.capitulo_x_curso (id_curso, id_capitulo) VALUES

/*Inserts de capitulo_x_curso Python */

(1, 1),
(1, 2),
(1, 3),

(1, 4),
(1, 5),
(1, 6),

(1, 7),
(1, 8),
(1, 9),

(1, 10),
(1, 11),
(1, 12),

(1, 13),
(1, 14),
(1, 15),

/*Inserts de capitulo_x_curso MySql */

(2, 16),
(2, 17),

(2, 18),
(2, 19),
(2, 20),

(2, 21),
(2, 22),
(2, 23),

(2, 24),
(2, 25),
(2, 26),

(2, 27),
(2, 28),
(2, 29),

/*Inserts de capitulo_x_curso JavaScript */

(3, 30),
(3, 31),
(3, 32),

(3, 33),
(3, 34),
(3, 35),

(3, 36),
(3, 37),
(3, 38),

(3, 39),
(3, 40),
(3, 41),

(3, 42),
(3, 43),
(3, 44),

/*Inserts de capitulo_x_curso IA */

(4, 45),
(4, 46),
(4, 47),

(4, 48),
(4, 49),

(4, 50),
(4, 51),

(4, 52),
(4, 53),

(4, 54),
(4, 55),

/*Inserts de capitulo_x_curso AutoCad */

(5, 56),
(5, 57),
(5, 58),

(5, 59),
(5, 60),
(5, 61),

(5, 62),
(5, 63),
(5, 64),

(5, 65),
(5, 66),
(5, 67),

/*Inserts de capitulo_x_curso Ingles */

(6, 68),
(6, 69),
(6, 70),

(6, 71),
(6, 72),
(6, 73),

(6, 74),
(6, 75),
(6, 76),

(6, 77),
(6, 78),
(6, 79);