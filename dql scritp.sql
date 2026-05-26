

-- Consultar todos los clientes registrados
SELECT * FROM cliente;

-- Buscar cliente por documento
SELECT *
FROM cliente
WHERE numero_documento = 123456;

-- Consultar clientes registrados recientemente
SELECT *
FROM cliente
ORDER BY fecha_registro DESC;


-- Consultar todos los productos
SELECT * FROM producto;

-- Consultar productos por categoria
SELECT p.nombre_producto,
       c.nombre_categoria
FROM producto p
INNER JOIN categoria c
ON p.id_categoria = c.id
WHERE c.nombre_categoria = 'Casual';

-- Buscar producto por talla
SELECT *
FROM producto
WHERE talla = 'M';

-- Buscar producto por color
SELECT *
FROM producto
WHERE color = 'Negro';

-- Consultar pedidos registrados
SELECT * FROM factura;

-- Consultar pedidos de un cliente
SELECT f.id_factura,
       f.fecha,
       f.total,
       c.primer_nombre
FROM factura f
INNER JOIN cliente c
ON f.id_cliente = c.id
WHERE c.numero_documento = 123456;

-- Consultar detalle de pedidos
SELECT f.id_factura,
       p.nombre_producto,
       dp.cantidad,
       dp.subtotal
FROM detalle_pedido dp
INNER JOIN factura f
ON dp.id_factura = f.id_factura
INNER JOIN producto p
ON dp.id_producto = p.id;

-- Consultar pagos realizados
SELECT * FROM pago;

-- Consultar pagos por metodo
SELECT *
FROM pago
WHERE metodo_pago = 'Efectivo';

-- Consultar pagos realizados con tarjeta
SELECT *
FROM pago
WHERE metodo_pago = 'Tarjeta';

-- Consultar todas las ventas
SELECT * FROM factura;

-- Consultar total vendido
SELECT SUM(total) AS total_vendido
FROM factura;

-- Consultar producto mas vendido
SELECT p.nombre_producto,
       SUM(dp.cantidad) AS total_vendido
FROM detalle_pedido dp
INNER JOIN producto p
ON dp.id_producto = p.id
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC
LIMIT 1;

-- Consultar inventario disponible
SELECT p.nombre_producto,
       i.cantidad_disponible
FROM inventario i
INNER JOIN producto p
ON i.id_producto = p.id;

-- Consultar productos agotados
SELECT p.nombre_producto
FROM inventario i
INNER JOIN producto p
ON i.id_producto = p.id
WHERE i.cantidad_disponible = 0;

-- Consultar productos con bajo stock
SELECT p.nombre_producto,
       i.cantidad_disponible
FROM inventario i
INNER JOIN producto p
ON i.id_producto = p.id
WHERE i.cantidad_disponible <= i.cantidad_minima;

-- Consultar usuarios administradores
SELECT cu.login,
       ua.name
FROM user_authority ua
INNER JOIN customer_user cu
ON ua.id_customer_user = cu.id
WHERE ua.name = 'ROLE_ADMIN';

-- Consultar inicio de sesion de usuarios
SELECT login,
       email
FROM customer_user;

-- Consultar entregas realizadas
SELECT * FROM entrega;

-- Consultar pedidos entregados
SELECT *
FROM entrega
WHERE estado = 'Entregado';

-- Consultar pedidos pendientes
SELECT *
FROM entrega
WHERE estado = 'Pendiente';

select * from clientes;

select * 
from clientes
where documentos = ´1021675364´;

select nombre , apellido , correo 
from clientes 
order by  id_clintes desc;

-- Consultar todos los productos
SELECT * FROM productos;

-- Consultar productos por categoría
SELECT p.nombre,
       c.nombre AS categoria,
       p.precio,
       p.stock
FROM productos p
INNER JOIN categorias c
ON p.id_categoria = c.id_categoria;

-- Buscar productos por talla
SELECT *
FROM productos
WHERE talla = 'M';

-- Buscar productos por color
SELECT *
FROM productos
WHERE color = 'negro';

-- Consultar pedidos registrados
SELECT * FROM pedidos;

-- Consultar pedidos de un cliente
SELECT p.id_pedido,
       c.nombre,
       p.fecha
FROM pedidos p
INNER JOIN clientes c
ON p.id_cliente = c.id_cliente;

-- Consultar detalle de pedidos
SELECT dp.id_pedido,
       pr.nombre,
       dp.cantidad,
       dp.subtotal
FROM detalle_pedido dp
INNER JOIN productos pr
ON dp.id_producto = pr.id_producto;

-- Consultar pagos realizados
SELECT * FROM pagos;

-- Consultar pagos por método
SELECT metodo_pago,
       total
FROM pagos;

-- Consultar pagos realizados con tarjeta
SELECT *
FROM pagos
WHERE metodo_pago = 'Tarjeta';

-- Consultar todas las ventas
SELECT * FROM ventas;

-- Consultar total vendido
SELECT SUM(total) AS total_ventas
FROM ventas;

-- Consultar ventas por fecha
SELECT *
FROM ventas
WHERE fecha = '2026-05-20';

-- Consultar producto más vendido
SELECT p.nombre,
       SUM(dv.cantidad) AS total_vendido
FROM detalle_venta dv
INNER JOIN productos p
ON dv.id_producto = p.id_producto
GROUP BY p.nombre
ORDER BY total_vendido DESC;

-- Consultar inventario disponible
SELECT nombre,
       stock
FROM productos;

-- Consultar productos agotados
SELECT *
FROM productos
WHERE stock = 0;

-- Consultar productos con bajo stock
SELECT *
FROM productos
WHERE stock < 5;

-- Consultar usuarios registrados
SELECT * FROM usuarios;

-- Consultar usuarios administradores
SELECT *
FROM usuarios
WHERE rol = 'Administrador';

-- Consultar inicio de sesión de usuarios
SELECT usuario,
       contraseña
FROM usuarios;

-- Consultar entregas realizadas
SELECT * FROM entregas;

-- Consultar pedidos entregados
SELECT *
FROM entregas
WHERE estado = 'Entregado';

-- Consultar pedidos pendientes
SELECT *
FROM entregas
WHERE estado = 'Pendiente';



