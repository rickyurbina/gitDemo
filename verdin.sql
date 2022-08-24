-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 24, 2022 at 05:08 PM
-- Server version: 8.0.23
-- PHP Version: 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verdin`
--

-- --------------------------------------------------------

--
-- Table structure for table `asistencia`
--

CREATE TABLE `asistencia` (
  `id` int NOT NULL,
  `idSocio` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `asistencia`
--

INSERT INTO `asistencia` (`id`, `idSocio`, `fecha`) VALUES
(1, 5, '2021-12-18 10:15:18'),
(2, 10, '2022-05-12 12:02:52'),
(3, 1, '2022-05-12 14:13:47'),
(4, 1, '2022-06-01 21:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `nombre`) VALUES
(8, 'Generica');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int NOT NULL,
  `nombres` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipoCliente` int NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombres`, `apellidos`, `telefono`, `email`, `tipoCliente`, `fechaNacimiento`, `fechaRegistro`) VALUES
(1, 'Ricardo', 'Urbina', '6251221438', 'ricky@gmail.com', 1, '1975-11-05', '2021-12-08'),
(5, 'Melany', 'Urbina Garcia', '6251065030', 'mell@gmail.com', 2, '2005-03-03', '2021-12-10'),
(6, 'Monica', 'Garcia Arpero', '625', 'monica@gmail.com', 3, '1979-05-04', '2021-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `entradas`
--

CREATE TABLE `entradas` (
  `id` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `lote` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `medida` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `orden` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entradas`
--

INSERT INTO `entradas` (`id`, `idProducto`, `lote`, `cantidad`, `medida`, `costo`, `orden`) VALUES
(16, 35, '1', 1, 'Kgs', 1, 0),
(17, 33, '2', 2, 'Kgs', 2, 0),
(25, 34, '111', 1, 'Piezas', 12000, 2),
(26, 32, '222', 1, 'Piezas', 40000, 2),
(27, 35, '1', 1, 'Kgs', 1, 4),
(28, 34, '3', 3, 'Kgs', 3, 4),
(29, 35, '333', 100, 'Kgs', 11.7, 5),
(31, 33, '123', 123, 'Kgs', 123, 6),
(32, 32, '333', 333, 'Kgs', 333, 7);

-- --------------------------------------------------------

--
-- Table structure for table `entradasEnc`
--

CREATE TABLE `entradasEnc` (
  `orden` int NOT NULL,
  `idProveedor` int NOT NULL,
  `concepto` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entradasEnc`
--

INSERT INTO `entradasEnc` (`orden`, `idProveedor`, `concepto`, `fecha`) VALUES
(2, 7, 'entrada', '2022-08-16'),
(3, 8, 'entrada', '2022-08-15'),
(4, 8, 'entrada', '2022-08-15'),
(5, 7, 'entrada', '2022-08-17'),
(6, 8, 'entrada', '2022-08-17'),
(7, 7, 'saldo', '2022-08-17');

-- --------------------------------------------------------

--
-- Table structure for table `eqType`
--

CREATE TABLE `eqType` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `eqType`
--

INSERT INTO `eqType` (`id`, `nombre`) VALUES
(3, 'Abarrotes'),
(4, 'Verduras'),
(5, 'Plasticos'),
(8, 'Frutas');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `idProducto` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `eqType` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'yard',
  `dayPrice` int NOT NULL,
  `weekPrice` int NOT NULL,
  `monthPrice` int NOT NULL,
  `features` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `disponibilidad` double DEFAULT NULL,
  `medida` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`idProducto`, `name`, `brand`, `eqType`, `status`, `dayPrice`, `weekPrice`, `monthPrice`, `features`, `image`, `disponibilidad`, `medida`) VALUES
(32, 'Retroescabadora', 'CAT', 'Tractor', 'out', 200, 700, 2500, '[{\"id\":1656633980976,\"feature\":\"motor\",\"featureValue\":\"5000\"},{\"id\":1656633992609,\"feature\":\"Capacidad\",\"featureValue\":\"5000\"},{\"id\":1656634040674,\"feature\":\"horas\",\"featureValue\":\"200\"}]', 'uploads/products/918f8d26683c84118b9a8ab925dd52e0triumph.jpeg', 445, NULL),
(33, 'F400', 'GENIE', 'Tractor', 'yard', 100, 500, 2500, '[]', 'uploads/products/a4d3b944c1a68dd74683b5b01de1c3c384248.png', 125, NULL),
(34, 'Retro', 'Kubota', 'Cargadores', 'yard', 150, 600, 3000, '[]', 'uploads/products/1e35ea761c6eb8ec482022afd2862cdd119642.jpeg', 4, NULL),
(35, 'Manzana Golden', 'CAT', 'Frutas', 'yard', 20, 15, 10, '[]', '', 102, 'Kg');

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `nombre`, `direccion`, `telefono`, `email`, `fechaRegistro`) VALUES
(7, 'Super Sandra Abarrotes Mayoreo y Medio mayoreo de la sierra tarahumara S.A. ', 'Rep. de colombia #158 CTM Ciudad Cuauhtemoc Chihuahua Mexico ', '6251112233', 'contacto@supersandra.com', '2022-08-02'),
(8, 'Al Super Cuauhtemoc', 'Conocida', '6251234455', 'alsuper@gmail.com', '2022-08-03');

-- --------------------------------------------------------

--
-- Table structure for table `salidas`
--

CREATE TABLE `salidas` (
  `id` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` double NOT NULL,
  `medida` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `lote` int DEFAULT NULL,
  `idCliente` int NOT NULL,
  `precio` double NOT NULL,
  `pedido` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salidas`
--

INSERT INTO `salidas` (`id`, `idProducto`, `cantidad`, `medida`, `lote`, `idCliente`, `precio`, `pedido`) VALUES
(8, 35, 13, 'Kgs', 11, 1, 50, 1),
(9, 34, 1, 'Kgs', 22, 1, 5000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salidasEnc`
--

CREATE TABLE `salidasEnc` (
  `id` int NOT NULL,
  `idCliente` int NOT NULL,
  `fecha` date NOT NULL,
  `pedido` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salidasEnc`
--

INSERT INTO `salidasEnc` (`id`, `idCliente`, `fecha`, `pedido`) VALUES
(10, 1, '2022-08-18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `socios`
--

CREATE TABLE `socios` (
  `idSocio` int NOT NULL,
  `nombres` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipoSocio` int NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fechaRegistro` date NOT NULL,
  `fechaUltimoPago` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `socios`
--

INSERT INTO `socios` (`idSocio`, `nombres`, `apellidos`, `telefono`, `email`, `password`, `tipoSocio`, `fechaNacimiento`, `fechaRegistro`, `fechaUltimoPago`) VALUES
(1, 'Ricardo', 'Urbina', '6251221438', 'ricky@gmail.com', '', 1, '1975-11-05', '2021-12-08', '2022-06-01 21:47:13'),
(11, 'Juan', 'Perez', '6251234455', 'juan@gmail.com', '$2y$10$kqNQ5t.qPXBIAyKDkSLHc.slSyGKcSiF9kTNtq0sfVQOvr2GvZaIW', 1, '2022-07-06', '2022-07-06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nombres` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nickName` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `permisos` varchar(13) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nombres`, `apellidos`, `nickName`, `email`, `telefono`, `permisos`, `password`) VALUES
(15, 'Melany Fernanda', 'Urbina Garcia', 'Mell', 'mell@gmail.com', '6251065030', 'Administrador', '909090');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombres` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nickName` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `personal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci COMMENT 'Informacion personal del usuario que sera mostrada en el perfil de usuario',
  `titulo` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Titulo que tiene en la empresa. ej. Gerente, Agente de ventas, etc',
  `permisos` varchar(13) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'El tipo de acceso que tiene en el sistema ej. Administrador, usuario, etc',
  `foto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `estado` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Activo / Inactivo',
  `ultimoLogin` datetime DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `sociales` text CHARACTER SET utf8 COLLATE utf8_spanish_ci COMMENT 'Los diferentes links a las redes sociales del usuario para ser contactado por los clientes.  En formato JSON'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `nickName`, `telefono`, `email`, `password`, `personal`, `titulo`, `permisos`, `foto`, `estado`, `ultimoLogin`, `fechaNac`, `sociales`) VALUES
(13, 'Ricardo', 'Urbina Najera', 'Rick', '6251221438', 'r@gmail.com', '$2y$10$4NxyweuG8QF71A7ch6zvleuaxTz2MFeeWaiN8Z6NF.B/9AVge/GAe', '', 'Gerente', 'administrador', 'assets/images/faces/1.jpg', '1', '0000-00-00 00:00:00', '1991-09-27', '{\"Facebook\":\"\",\"Twitter\":\"\",\"LinkedIn\":\"\"}'),
(33, 'Jesus', 'Baray', 'Jesus', '6251221414', 'jesus@gmail.com', '$2y$10$.Jg7KOUhlZPRC.e7wVTzk.bCZGE0/GAPOpMbNUSPOCwcXA2qpjVcm', NULL, NULL, 'administrador', NULL, '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_token`
--

CREATE TABLE `usuarios_token` (
  `TokenId` int NOT NULL,
  `UsuarioId` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Token` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Estado` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuarios_token`
--

INSERT INTO `usuarios_token` (`TokenId`, `UsuarioId`, `Token`, `Estado`, `Fecha`) VALUES
(800, '13', 'b23f313fdeaa52289e0249800c88d51a', 'Activo', '2022-06-28 03:56:00'),
(801, '13', 'b0a295d7dcb8db6998c5675af9315a9b', 'Activo', '2022-06-30 23:32:00'),
(802, '33', '0200d59a778560340c39a8332815ba7d', 'Activo', '2022-06-30 23:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int NOT NULL,
  `idCliente` int NOT NULL,
  `productos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `total` double NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`idVenta`, `idCliente`, `productos`, `total`, `fecha`) VALUES
(1, 1, '[{\"idProducto\":\"5\",\"nombreProducto\":\"Proteina Mass Tech Extreme 2000\",\"cantidad\":1,\"precio\":1100}]', 1100, '2022-04-25'),
(2, 6, '[{\"idProducto\":\"5\",\"nombreProducto\":\"Proteina Mass Tech Extreme 2000\",\"cantidad\":1,\"precio\":1100}]', 4400, '2022-04-25'),
(3, 1, '[{\"idProducto\":\"5\",\"nombreProducto\":\"Proteina Mass Tech Extreme 2000\",\"cantidad\":1,\"precio\":1100}]', 1100, '2022-05-12'),
(4, 10, '[{\"idProducto\":\"5\",\"nombreProducto\":\"Proteina Mass Tech Extreme 2000\",\"cantidad\":1,\"precio\":1100}]', 1100, '2022-05-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indexes for table `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entradasEnc`
--
ALTER TABLE `entradasEnc`
  ADD PRIMARY KEY (`orden`);

--
-- Indexes for table `eqType`
--
ALTER TABLE `eqType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indexes for table `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salidasEnc`
--
ALTER TABLE `salidasEnc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`idSocio`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usuarios_token`
--
ALTER TABLE `usuarios_token`
  ADD PRIMARY KEY (`TokenId`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `eqType`
--
ALTER TABLE `eqType`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salidasEnc`
--
ALTER TABLE `salidasEnc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `socios`
--
ALTER TABLE `socios`
  MODIFY `idSocio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `usuarios_token`
--
ALTER TABLE `usuarios_token`
  MODIFY `TokenId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
