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

ALTER TABLE orden_servicio AUTO_INCREMENT = 1;
ALTER TABLE detalles_orden_servicio AUTO_INCREMENT = 1;
ALTER TABLE informe AUTO_INCREMENT = 1;
ALTER TABLE usuarios AUTO_INCREMENT = 3;
ALTER TABLE historial AUTO_INCREMENT = 1;

UPDATE servicios
SET ID_SERVICIOS = '5'
WHERE ID_SERVICIOS = 2;

DELETE FROM orden_servicio WHERE id_orden = 1;
DELETE FROM detalles_orden_servicio WHERE id_detalle = 1;
DELETE FROM usuarios WHERE id_usuario = 8;


SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE usuarios;
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE usuarios AUTO_INCREMENT = 1;