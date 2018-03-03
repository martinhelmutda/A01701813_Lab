--phpMyAdmin SQL Dump\
-- version 4.7.7\
-- https://www.phpmyadmin.net/\
--\
-- Servidor: localhost:8889\
-- Tiempo de generaci\'f3n: 03-03-2018 a las 05:47:03\
-- Versi\'f3n del servidor: 5.6.38\
-- Versi\'f3n de PHP: 7.2.1\
\
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";\
SET time_zone = "+00:00";\
\
--\
-- Base de datos: `ejemplo`\
--\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `producto`\
--\
\
CREATE TABLE `producto` (\
  `id` int(11) NOT NULL,\
  `nombre` varchar(11) NOT NULL,\
  `descripcion` text NOT NULL,\
  `atributos` varchar(11) NOT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
--\
-- Volcado de datos para la tabla `producto`\
--\
\
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `atributos`) VALUES\
(1, 'Mazorca', 'La mejor mazorca de los 4 mares circundantes', 'dulce, creo'),\
(3, 'Esquite', 'Sabroso elote desgranado y sumergido en caldo saludable y 100% org\'e1nico', 'blanco'),\
(4, 'Vasolote', 'El exquisitos sabor de un esquite puesto en un c\'f3modo vaso. Agr\'e9gale lo que quieras.', 'blanco'),\
(5, 'Elote Asado', 'El elote tradicional asado con amor. Nada mejor que disfrutarlo con chile y lim\'f3n', 'Blanco'),\
(6, 'Dulce Asado', 'Elote amarillo, importado con el mayor de los cuidados. Se ha preparado con un asado que permite extraer todo el sabor posible del elote', 'Dulce'),\
(7, 'Desgranado', 'El t\'edpico elote en grano, sin caldo, ideal para los que disfrutan cada grano de sabor', 'Blanco'),\
(8, 'Tatemado', 'El poco conocido, pero no menos importante elote tatemado, granos asados para disfrutar en cualquier momento. ', 'Blanco');\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `usuarios`\
--\
\
CREATE TABLE `usuarios` (\
  `id` int(11) NOT NULL,\
  `usuario` varchar(40) NOT NULL,\
  `passwd` varchar(40) NOT NULL,\
  `fecha_crea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
--\
-- Volcado de datos para la tabla `usuarios`\
--\
\
INSERT INTO `usuarios` (`id`, `usuario`, `passwd`, `fecha_crea`) VALUES\
(1, 'martin', 'martin', '2018-03-03 01:38:54'),\
(2, 'robleManzano', 'paralelepipedo', '2018-03-03 01:38:54');\
\
--\
-- \'cdndices para tablas volcadas\
--\
\
--\
-- Indices de la tabla `producto`\
--\
ALTER TABLE `producto`\
  ADD PRIMARY KEY (`id`);\
\
--\
-- Indices de la tabla `usuarios`\
--\
ALTER TABLE `usuarios`\
  ADD PRIMARY KEY (`id`);\
\
--\
-- AUTO_INCREMENT de las tablas volcadas\
--\
\
--\
-- AUTO_INCREMENT de la tabla `producto`\
--\
ALTER TABLE `producto`\
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;\
\
--\
-- AUTO_INCREMENT de la tabla `usuarios`\
--\
ALTER TABLE `usuarios`\
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;}
