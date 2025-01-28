/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (id_usuario INT PRIMARY KEY AUTO_INCREMENT, nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(100) NOT NULL , email VARCHAR(100) NOT NULL , edad INT);


-- PASO 2
-- Tu código aquí
CREATE TABLE roles (id_rol INT PRIMARY KEY AUTO_INCREMENT,nombre_rol  VARCHAR(50) NOT NULL);


-- PASO 3
-- Tu código aquí
ALTER TABLE usuarios ADD COLUMN id_rol INT;

UPDATE usuarios SET id_rol=1 WHERE edad <26;
UPDATE usuarios SET id_rol=2 WHERE edad >26 AND apellido LIKE'G%';
UPDATE usuarios SET id_rol=3 WHERE edad BETWEEN 26 AND 32 AND id_rol IS NULL;
UPDATE usuarios SET id_rol=4 WHERE edad >26 AND id_rol IS NULL;

-- PASO 4
-- Tu código aquí
SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol 
FROM usuarios as u
INNER JOIN roles as r
ON u.id_rol = r.id_rol;


/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias (id_categoria INT PRIMARY KEY AUTO_INCREMENT,
 nombre_categoria VARCHAR(100) NOT NULL);

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD id_categoria INT;

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario IN (1, 5, 9, 13, 17);
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario IN (2, 7, 8 );
UPDATE usuarios SET id_categoria = 5 WHERE id_usuario IN (3, 6, 19 );
UPDATE usuarios SET id_categoria = 7 WHERE id_usuario IN (14, 18);

-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario,usuarios.nombre,usuarios.apellido, usuarios.email,
    usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
INNER JOIN  roles
ON usuarios.id_rol = roles.id_rol
LEFT JOIN categorias
ON usuarios.id_categoria = categorias.id_categoria;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT , id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- PASO 2
-- Tu código aquí


-- PASO 3
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email,
    usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
INNER JOIN roles ON usuarios.id_rol = roles.id_rol
INNER JOIN usuarios_categorias ON usuarios.id_usuario = usuarios_categorias.id_usuario
INNER JOIN categorias ON usuarios_categorias.id_categoria = categorias.id_categoria;
