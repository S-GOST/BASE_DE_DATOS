use sgost;

select * from roles;
select * from tipo_documento;
select * from usuarios;
select * from motos;
select * from categorias;
select * from servicios;
select * from productos;
select * from orden_servicio;
select * from detalles_orden_servicio;
select * from informe;
select * from comprobante;
select * from historial;

UPDATE servicios
SET ID_SERVICIOS = '5'
WHERE ID_SERVICIOS = 2;

DELETE FROM orden_servicio WHERE id_orden = 1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE usuarios;
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE usuarios AUTO_INCREMENT = 1;
