CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    correo_electronico TEXT,
    telefono INTEGER
);

CREATE TABLE productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_producto TEXT,
    precio REAL,
    stock_disponible INTEGER
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_de_los_productos_comprados TEXT,
    nombre_del_cliente TEXT,
    fecha TEXT,
    total_de_la_compra NUMERIC
);

CREATE TABLE detalle_pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    subtotal NUMERIC,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);


INSERT INTO clientes (nombre, correo_electronico, telefono)
VALUES ("simon", "simonmedes@hotmail.com", 314877326);

INSERT INTO clientes (nombre, correo_electronico, telefono)
VALUES ("carlos", "caliche@hotmail.com", 317897176);


INSERT INTO productos (nombre_producto, precio, stock_disponible)
VALUES ("vodka", 90000, 30);

INSERT INTO productos (nombre_producto, precio, stock_disponible)
VALUES ("whisky", 180000, 25);

INSERT INTO productos (nombre_producto, precio, stock_disponible)
VALUES ("ginebra", 120000, 40);


INSERT INTO pedidos (nombre_de_los_productos_comprados, nombre_del_cliente, fecha, total_de_la_compra)
VALUES ("ginebra", "simon", "08/03/25", 120000);


INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad, subtotal)
VALUES (1, 3, 1, 120000);  -- Ejemplo de detalle de pedido para la ginebra


SELECT * FROM clientes;


SELECT p.id, p.nombre_de_los_productos_comprados, p.fecha, p.total_de_la_compra, c.nombre
FROM pedidos p
JOIN clientes c ON p.nombre_del_cliente = c.nombre;


SELECT dp.id_pedido, p.nombre_producto, dp.cantidad, dp.subtotal
FROM detalle_pedidos dp
JOIN productos p ON dp.id_producto = p.id;
