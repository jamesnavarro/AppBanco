-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-05-2022 a las 13:07:36
-- Versión del servidor: 10.5.15-MariaDB-cll-lve
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `softmed1_banco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `id` int(11) NOT NULL,
  `nombre_banco` varchar(255) NOT NULL,
  `tipo_banco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id`, `nombre_banco`, `tipo_banco`) VALUES
(1, 'Banco Nexos', 1),
(2, 'Bancolombia', 0),
(3, 'Banco de Bogota', 0),
(4, 'Banco Davivienda', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` int(11) NOT NULL,
  `tipo` varchar(3) NOT NULL,
  `celular` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `ultimo_ingreso` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `cedula`, `tipo`, `celular`, `email`, `pass`, `token`, `ultimo_ingreso`) VALUES
(1, 'James', 'Navarro', 72280699, 'CC', '3108265814', 'jamesjnb@hotmail.com', '202cb962ac59075b964b07152d234b70', '120220508171400', '2022-05-08 17:14:00'),
(2, 'Greys', 'Martinez', 1044424256, 'cc', '3146644438', 'jg_1220@hotmail.com', '202cb962ac59075b964b07152d234b70', '220220508064831', '2022-05-08 06:48:31'),
(3, 'Mara', 'Martinez', 1044424257, 'CC', '3101234567', 'jamesjnb@hotmail.com', '202cb962ac59075b964b07152d234b70', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL,
  `numero` varchar(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `saldo` int(11) NOT NULL,
  `ultimo_reg` datetime NOT NULL,
  `banco_id` int(11) NOT NULL,
  `tipo_tarjeta` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id`, `numero`, `cliente_id`, `estado`, `fecha_registro`, `saldo`, `ultimo_reg`, `banco_id`, `tipo_tarjeta`) VALUES
(1, '12345678901', 1, '0', '2022-05-06 10:35:29', 758000, '2022-05-08 17:18:01', 1, 'Ahorro'),
(2, '11111111111', 2, '0', '2022-05-01 10:30:05', 242000, '2022-05-08 17:17:28', 1, 'Ahorro'),
(3, '22222222222', 1, '0', '2022-05-06 10:35:29', 12000000, '2022-05-07 20:49:54', 1, 'Credito'),
(4, '33333333333', 3, '0', '2022-03-01 20:31:17', 0, '0000-00-00 00:00:00', 2, 'Debito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_asociadas`
--

CREATE TABLE `cuentas_asociadas` (
  `id` int(11) NOT NULL,
  `cliente_id` varchar(11) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cuenta_tercero` varchar(11) NOT NULL,
  `banco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentas_asociadas`
--

INSERT INTO `cuentas_asociadas` (`id`, `cliente_id`, `alias`, `fecha_registro`, `cuenta_tercero`, `banco_id`) VALUES
(1, '1', 'greys', '2022-05-08 01:29:05', '11111111111', 1),
(2, '1', 'carlos', '2022-05-08 01:55:33', '11111111112', 1),
(3, '2', 'James Navarro', '2022-05-08 16:15:34', '12345678901', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `link_pagos`
--

CREATE TABLE `link_pagos` (
  `id` int(11) NOT NULL,
  `referencia` varchar(255) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `valor_referencia` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `link_pagos`
--

INSERT INTO `link_pagos` (`id`, `referencia`, `cliente_id`, `valor_referencia`, `estado`) VALUES
(18, '12345678901', 1, 50000, 0),
(22, '11111111111', 2, 7000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `cuenta_numero` varchar(11) NOT NULL,
  `cuenta_destino` varchar(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `tipo_mov` varchar(10) NOT NULL,
  `valor_mov` int(11) NOT NULL,
  `saldo_actual` int(11) NOT NULL,
  `banco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `cuenta_numero`, `cuenta_destino`, `fecha_reg`, `tipo_mov`, `valor_mov`, `saldo_actual`, `banco_id`) VALUES
(15, '11111111111', '12345678901', '2022-05-08 06:02:19', 'Out', 30000, 1000000, 1),
(16, '12345678901', '11111111111', '2022-05-08 06:02:20', 'In', 30000, 970000, 1),
(17, '12345678901', '11111111111', '2022-05-08 06:09:37', 'Out', 30000, 1000000, 1),
(18, '11111111111', '12345678901', '2022-05-08 06:09:37', 'In', 30000, 0, 1),
(19, '12345678901', '11111111111', '2022-05-08 06:10:24', 'Out', 70000, 970000, 1),
(20, '11111111111', '12345678901', '2022-05-08 06:10:24', 'In', 70000, 30000, 1),
(21, '12345678901', '11111111111', '2022-05-08 15:19:33', 'Out', 50000, 900000, 1),
(22, '11111111111', '12345678901', '2022-05-08 15:19:33', 'In', 50000, 100000, 1),
(23, '12345678901', '11111111111', '2022-05-08 15:27:25', 'Out', 50000, 850000, 1),
(24, '11111111111', '12345678901', '2022-05-08 15:27:25', 'In', 50000, 150000, 1),
(25, '12345678901', '11111111111', '2022-05-08 15:36:26', 'Out', 10000, 800000, 1),
(26, '11111111111', '12345678901', '2022-05-08 15:36:26', 'In', 10000, 200000, 1),
(27, '12345678901', '11111111111', '2022-05-08 15:38:06', 'Out', 20000, 790000, 1),
(28, '11111111111', '12345678901', '2022-05-08 15:38:06', 'In', 20000, 210000, 1),
(29, '11111111111', '12345678901', '2022-05-08 16:42:34', 'Out', 20000, 230000, 1),
(30, '12345678901', '11111111111', '2022-05-08 16:42:34', 'In', 20000, 230000, 1),
(31, '11111111111', '12345678901', '2022-05-08 16:47:39', 'Out', 40000, 230000, 1),
(32, '12345678901', '11111111111', '2022-05-08 16:47:39', 'In', 40000, 230000, 1),
(33, '12345678901', '11111111111', '2022-05-08 17:16:40', 'Out', 5000, 770000, 1),
(34, '11111111111', '12345678901', '2022-05-08 17:16:40', 'In', 5000, 230000, 1),
(35, '12345678901', '11111111111', '2022-05-08 17:17:28', 'Out', 7000, 765000, 1),
(36, '11111111111', '12345678901', '2022-05-08 17:17:28', 'In', 7000, 235000, 1),
(37, '12345678901', '11111111111', '2022-05-08 17:18:01', 'Out', 5000, 758000, 1),
(38, '11111111111', '12345678901', '2022-05-08 17:18:01', 'In', 5000, 758000, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banco_id` (`banco_id`);

--
-- Indices de la tabla `cuentas_asociadas`
--
ALTER TABLE `cuentas_asociadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `link_pagos`
--
ALTER TABLE `link_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuenta_id` (`cuenta_numero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cuentas_asociadas`
--
ALTER TABLE `cuentas_asociadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `link_pagos`
--
ALTER TABLE `link_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
