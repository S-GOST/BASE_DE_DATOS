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

ALTER TABLE usuarios AUTO_INCREMENT = 2;

UPDATE servicios
SET ID_SERVICIOS = '5'
WHERE ID_SERVICIOS = 2;

DELETE FROM usuarios WHERE id_usuario = 2;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE usuarios;
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE usuarios AUTO_INCREMENT = 1;
