{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf400
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE TABLE `empresa` (\
  `id_empresa` VARCHAR(13),\
  `nombre` TINYTEXT,\
  `direcci\'f3n` TEXT,\
  `telefono` VARCHAR(15),\
  `pais` TINYTEXT,\
  `estado` TINYTEXT,\
  `ciudad` TINYTEXT,\
  `zip` INT(5),\
  PRIMARY KEY (`id_empresa`)\
);\
\
CREATE TABLE `privilegios` (\
  `id_privilegio` VARCHAR(15),\
  `nombre` VARCHAR(40),\
  PRIMARY KEY (`id_privilegio`)\
);\
\
CREATE TABLE `lote` (\
  `id_lote` INT(8),\
  `fechaIngreso` DATETIME,\
  `fechaPedido` DATETIME,\
  `fechaCaptura` DATETIME,\
  `PaquetePorCaja` INT(3),\
  `CajaPorLote` INT(3),\
  `CajasCompletas` INT(3),\
  `PaquetesSueltos` INT(3),\
  `pesoCaja` FLOAT(3,3),\
  `dimensionesCaja` FLOAT(5,3),\
  PRIMARY KEY (`id_lote`)\
);\
\
CREATE TABLE `cuenta` (\
  `id_cuenta` VARCHAR(13),\
  `nombre` TINYTEXT,\
  `saldo` FLOAT(12,4),\
  `tipo` TINYTEXT,\
  PRIMARY KEY (`id_cuenta`)\
);\
\
CREATE TABLE `venta` (\
  `id_venta` INT(10),\
  `id_paquete` VARCHAR(15),\
  `id_cliente` VARCHAR(13),\
  `fechaCaptura` DATETIME,\
  `fechaReal` DATETIME,\
  `cantidadPaquetes` INT(8),\
  `total` FLOAT(10,5),\
  PRIMARY KEY (`id_venta`),\
  KEY `FK` (`id_paquete`, `id_cliente`)\
);\
\
CREATE TABLE `privilegio_rol` (\
  `id_privilegio` VARCHAR(15),\
  `id_role` VARCHAR(15),\
  KEY `FK` (`id_privilegio`, `id_role`)\
);\
\
CREATE TABLE `usuario` (\
  `rfc` VARCHAR(12),\
  `nombre` TINYTEXT,\
  `email` TINYTEXT,\
  `direcci\'f3n` TINYTEXT,\
  `telefono` TINYTEXT,\
  PRIMARY KEY (`rfc`)\
);\
\
CREATE TABLE `almacena` (\
  `id_bodega` VARCHAR(13),\
  `id_lote` INT(8),\
  `idMovimiento` VARCHAR(10),\
  `fecha` DATETIME,\
  KEY `FK` (`id_bodega`, `id_lote`)\
);\
\
CREATE TABLE `cliente` (\
  `id_cliente` INT(10),\
  `nombre` TINYTEXT,\
  `empresa` TINYTEXT,\
  `telefono` VARCHAR(15),\
  `direccion` TINYTEXT,\
  `ciudad` TINYTEXT,\
  `email` TINYTEXT,\
  PRIMARY KEY (`id_cliente`)\
);\
\
CREATE TABLE `rol` (\
  `id_role` VARCHAR(15),\
  `nombre` VARCHAR(40),\
  PRIMARY KEY (`id_role`)\
);\
\
CREATE TABLE `bodega` (\
  `id_bodega` VARCHAR(13),\
  `nombre` TINYTEXT,\
  `telefono` VARCHAR(10),\
  `direccion` TEXT,\
  `pais` TINYTEXT,\
  `estado` TINYTEXT,\
  `ciudad` TINYTEXT,\
  `zip` INT(5),\
  PRIMARY KEY (`id_bodega`)\
);\
\
CREATE TABLE `usuario_rol` (\
  `rfc` VARCHAR(12),\
  `id_role` VARCHAR(15),\
  KEY `FK` (`rfc`, `id_role`)\
);\
\
CREATE TABLE `bodega_empresa` (\
  `id_bodega` VARCHAR(13),\
  `id_empresa` VARCHAR(13),\
  `fechaCaptura` DATETIME,\
  KEY `FK` (`id_bodega`, `id_empresa`)\
);\
\
CREATE TABLE `empresa_empleado` (\
  `id_empresa` VARCHAR(13),\
  `rfc` VARCHAR(12),\
  KEY `FK` (`id_empresa`, `rfc`)\
);\
\
CREATE TABLE `paquete` (\
  `id_paquete` VARCHAR(15),\
  `id_lote` INT(8),\
  `id_producto` VARCHAR(15),\
  `cantidadProducto` INT(10),\
  `precioPaquete` FLOAT(6,3),\
  `costoPaquete` FLOAT(6,3),\
  `estado` VARCHAR(15),\
  PRIMARY KEY (`id_paquete`),\
  KEY `FK` (`id_lote`, `id_producto`)\
);\
\
CREATE TABLE `producto` (\
  `id_producto` VARCHAR(15),\
  `id_categor\'eda` VARCHAR(15),\
  `nombre` TINYTEXT,\
  PRIMARY KEY (`id_producto`),\
  KEY `FK` (`id_categor\'eda`)\
);\
\
CREATE TABLE `categoria` (\
  `id_categoria` VARCHAR(15),\
  `nombre` TINYTEXT,\
  `descripcion` TEXT,\
  `numCaracteristicas` INT(2),\
  PRIMARY KEY (`id_categoria`)\
);\
\
CREATE TABLE `caracteristicas` (\
  `id_caracteristica` VARCHAR(15),\
  `id_categoria` VARCHAR(15),\
  `prioridad` INT(2),\
  `nombre` TINYTEXT,\
  `descripcion` TEXT,\
  PRIMARY KEY (`id_caracteristica`),\
  KEY `FK` (`id_categoria`)\
);\
\
CREATE TABLE `pago` (\
  `id_pago` INT(10),\
  `id_cliente` VARCHAR(13),\
  `id_cuenta` VARCHAR(13),\
  `fechaCaptura` DATETIME,\
  `fechaReal` DATETIME,\
  `monto` FLOAT(10,5),\
  PRIMARY KEY (`id_pago`),\
  KEY `FK` (`id_cliente`, `id_cuenta`)\
);\
\
CREATE TABLE `actualiza` (\
  `id_actualiza` INT(10),\
  `id_cuenta` VARCHAR(13),\
  `id_cuenta` VARCHAR(13),\
  `fechaCaptura` DATETIME,\
  `fechaReal` DATETIME,\
  `monto` FLOAT(10,5),\
  PRIMARY KEY (`id_actualiza`),\
  KEY `FK` (`id_cuenta`, `id_cuenta`)\
);\
\
CREATE TABLE `compra` (\
  `id_compra` INT(10),\
  `id_lote` INT(8),\
  `id_proveedor` VARCHAR(13),\
  `fechaCaptura` DATETIME,\
  `fechaReal` DATETIME,\
  `cantidadLote` INT(5),\
  `totalPorLote` FLOAT(10,5),\
  PRIMARY KEY (`id_compra`),\
  KEY `FK` (`id_lote`, `id_proveedor`)\
);\
\
CREATE TABLE `cobra` (\
  `id_proveedor` VARCHAR(13),\
  `rfc` VARCHAR(13),\
  `nombre` TINYTEXT,\
  `empresa` TINYTEXT,\
  `telefono` VARCHAR(15),\
  `direccion` TINYTEXT,\
  `ciudad` TINYTEXT,\
  `email` TINYTEXT,\
  PRIMARY KEY (`id_proveedor`)\
);\
\
CREATE TABLE `cobra` (\
  `id_pago` INT(10),\
  `id_proveedor` VARCHAR(13),\
  `id_cuenta` VARCHAR(13),\
  `fechaCaptura` DATETIME,\
  `fechaReal` DATETIME,\
  `monto` FLOAT(10,5),\
  PRIMARY KEY (`id_pago`),\
  KEY `FK` (`id_proveedor`, `id_cuenta`)\
);\
\
CREATE TABLE `aportacion` (\
  `id_aportacion` INT(8),\
  `rfc` VARCHAR(13),\
  `id_paquete` VARCHAR(15),\
  `costo` FLOAT(10,5),\
  `precio` FLOAT(10,5),\
  `utilidadPorcentaje` FLOAT(3,3),\
  PRIMARY KEY (`id_aportacion`),\
  KEY `FK` (`rfc`, `id_paquete`)\
);\
\
\
}