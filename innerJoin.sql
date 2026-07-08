use sgost;

select * from usuarios;
select * from roles;
select * from categorias;
select * from orden_servicio;
select * from detalles_orden_servicio;
select * from tipo_documento;
select * from motos;
select * from servicios;
select * from productos;
select * from comprobante;
select * from informe;
select * from historial;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE usuarios;
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE usuarios AUTO_INCREMENT = 1;
