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
ALTER TABLE historial AUTO_INCREMENT = 7;
DELETE FROM motos WHERE id_moto = 3;
DELETE FROM categorias WHERE ID_CATEGORIA = 11;
DELETE FROM productos WHERE ID_PRODUCTOS = 4;


SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE usuarios;
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE usuarios AUTO_INCREMENT = 1;