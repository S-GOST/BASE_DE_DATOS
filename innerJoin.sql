use sgost;

/* Todas las ordenes a cargo */

SELECT o.ID_ORDEN_SERVICIO, c.Nombre AS Clientes, t.Nombre AS Tecnicos, a.Nombre AS Administradores, o.Estado
FROM orden_servicio o
JOIN clientes c ON o.ID_CLIENTES = c.ID_CLIENTES
JOIN tecnicos t ON o.ID_TECNICOS = t.ID_TECNICOS
JOIN administradores a ON o.ID_ADMINISTRADOR = a.ID_ADMINISTRADOR;

/* Cantidad de ordenes atendidas por cada tecnico */

select t.Nombre, COUNT(o.ID_ORDEN_SERVICIO) AS TotalOrdenes
from tecnicos t 
join orden_servicio o ON t.ID_TECNICOS = o.ID_TECNICOS
GROUP BY t.Nombre 
ORDER BY TotalOrdenes DESC;

/* Productos con precio mayor al promedio */

select * from productos
where precio >(select avg(precio) from productos);

/* Servicios mas caros */

select * from servicios
where precio = (select max(precio)from servicios);

/* Cantidad de ordenes por estado */ 

select o.ID_ORDEN_SERVICIO, Estado
from orden_servicio o
group by Estado;

/* Total de productos usados por cada orden */

select o.ID_ORDEN_SERVICIO, SUM(d.ID_PRODUCTOS) AS TotalProductos
from orden_servicio o
join detalles_orden_servicio d on o.ID_ORDEN_SERVICIO = d.ID_ORDEN_SERVICIO
GROUP BY o.ID_ORDEN_SERVICIO;

/* Total de servicios usados por cada orden */

select o.ID_ORDEN_SERVICIO, SUM(d.ID_SERVICIOS) AS TotalServicios
from orden_servicio o
join detalles_orden_servicio d on o.ID_ORDEN_SERVICIO = d.ID_ORDEN_SERVICIO
GROUP BY o.ID_ORDEN_SERVICIO;

/*Ver detalles de cada orden*/

select d.ID_DETALLES_ORDEN_SERVICIO, o.ID_ORDEN_SERVICIO
from detalles_orden_servicio d
join orden_servicio o on o.ID_ORDEN_SERVICIO = d.ID_ORDEN_SERVICIO;

/* Ver comprobante por cada informe */

select c.ID_COMPROBANTE, i.ID_INFORME, c.Monto
FROM comprobante c 
JOIN informe i  ON i.ID_INFORME = c.ID_INFORME;

/* Ver ordenes con su informe y comprobante */
select o.ID_ORDEN_SERVICIO, c.Nombre as Cliente, i.Descripcion as Informe, co.Monto as Comprobante, o.Estado
from orden_servicio o 
join clientes c on o.ID_CLIENTES = c.ID_CLIENTES
join detalles_orden_servicio d on o.ID_ORDEN_SERVICIO = d.ID_ORDEN_SERVICIO
join informe i on i.ID_DETALLES_ORDEN_SERVICIO = d.ID_DETALLES_ORDEN_SERVICIO
join comprobante co on co.ID_INFORME = d.ID_ORDEN_SERVICIO;

/*Orden por cada cliente*/

select o.ID_ORDEN_SERVICIO, c.Nombre as clientes 
from orden_servicio o
join clientes c on o.ID_CLIENTES = c.ID_CLIENTES;
/*Motos por cada cliente con marca y placa*/

select o.ID_MOTOS, m.Marca, m.Placa
from clientes c 
join orden_servicio o ON c.ID_CLIENTES = o.ID_CLIENTES
join motos m ON o.ID_MOTOS = m.ID_MOTOS;

/* Cuantas ordenes se han entregado */
select count(*) as OrdenesEntregadas
from informe
where Estado = 'Lista para entrega';

/* datos insertados nuevanmente */

ALTER TABLE clientes
ADD COLUMN usuario VARCHAR(100) UNIQUE AFTER Nombre,
ADD COLUMN contrasena VARCHAR(255) AFTER usuario;


select * from administradores;
select * from clientes;
select * from tecnicos;
select * from motos;
select * from servicios;
select * from productos;
select * from detalles_orden_servicio;
select * from orden_servicio;
select * from informe;
select * from comprobante;
select * from historial;

/* Datos insertados */
delete from administradores where ID_ADMINISTRADOR = 'ADM2';
delete from tecnicos where ID_TECNICOS = 'TEC1';
insert into administradores(Nombre,Correo,Contrasena,Telefono)values('Alejo','Alejopxxx@gmail.com','5469871','325586787');
insert into clientes(Ubicacion,Nombre,TipoDocumento,Correo,Telefono)values('Cundinamarca','Bok','Cedula de ciudadania','Terryxxx@gmail.com','300586787');
insert into tecnicos(Nombre,Correo,Contrasena,Telefono)values('Santiago','Santiagoxxx@gmail.com','5471256','312425462');
insert into motos(ID_CLIENTES,Placa,Modelo,Marca,Recorrido)values('4','LMT564','390','DUKE','900000KM');
insert into servicios(Nombre,Categoria,Garantia,Estado,Precio)values('Diagnosticos motor ','Diagnosticos','-','Disponible','600000');
insert into productos(Categoria,Marca,Nombre,Garantia,Precio,Cantidad,Estado)values('Accesorios Electricos','Minda','Direccionales','10','150000','15','Disponibles');
insert into orden_servicio(ID_CLIENTES,ID_ADMINISTRADOR,ID_TECNICOS,ID_MOTOS,Fecha_inicio,Fecha_estimada,Fecha_fin,Estado)values('4','1','3','3','2025-11-05 14:42:00','2025-11-15 15:20:00','2025-11-20 13:10:00','Finalizada');
insert into detalles_orden_servicio(ID_ORDEN_SERVICIO,ID_SERVICIOS,ID_PRODUCTOS,Garantia,Estado,Precio)values('3','3','1','15','Finalizada','600000');
insert into informe(ID_DETALLES_ORDEN_SERVICIO,ID_ADMINISTRADOR,ID_TECNICOS,Descripcion,Fecha,Estado)values('3','1','3','En espera de repuestos','2025-11-25','Pendiente');
insert into comprobante(ID_COMPROBANTE,ID_INFORME,ID_CLIENTES,ID_ADMINISTRADOR,Monto,Fecha,Estado_pago)values('COM3','INF3','CLI3','ADM2','6000000','2025-01-10','Pagado');
insert into historial(ID_HISTORIAL,ID_ORDEN_SERVICIO,ID_COMPROBANTE,ID_INFORME,ID_TECNICOS,ID_CLIENTES,Descripcion,Fecha_registro)values('HI3','ORD3','COM3','INF3','TEC3','CLI3','Informe orden servicio 3','2025-05-10 17:45:00');
update comprobante
set ID_COMPROBANTE = 'COM1'
where ID_COMPROBANTE = '';

UPDATE tecnicos
SET contrasena = '789'
WHERE ID_TECNICOS = 'TEC1';

UPDATE administradores 
SET contrasena = '$2y$12$KhPINZBURPa1BunW6gOBuuFQpjK6WJHcXZGeVNxJ4T6UX/dwCrj8u'
WHERE usuario = 'admi2';

