-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2017 a las 20:19:56
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `subastas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atriculos`
--

CREATE TABLE `atriculos` (
  `idArticulo` smallint(5) UNSIGNED NOT NULL,
  `descripcionCorta` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_spanish_ci,
  `idCategoria` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `idCaracteristica` tinyint(3) UNSIGNED NOT NULL,
  `idCategoria` tinyint(3) UNSIGNED NOT NULL,
  `denominacion` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracyart`
--

CREATE TABLE `caracyart` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `idArticulo` smallint(5) UNSIGNED NOT NULL,
  `idCaracteristica` tinyint(3) UNSIGNED NOT NULL,
  `valor` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` tinyint(3) UNSIGNED NOT NULL,
  `denominacion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(40) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido1` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido2` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nif` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `valorPositivas` smallint(5) UNSIGNED DEFAULT NULL,
  `valorNegativas` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografias`
--

CREATE TABLE `fotografias` (
  `idFotografia` int(10) UNSIGNED NOT NULL,
  `idArticulo` smallint(5) UNSIGNED NOT NULL,
  `fotografia` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pujas`
--

CREATE TABLE `pujas` (
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idArticulo` smallint(5) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `importe` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subastas`
--

CREATE TABLE `subastas` (
  `idSubasta` int(10) UNSIGNED NOT NULL,
  `idCliente` int(10) UNSIGNED DEFAULT NULL,
  `idArticulo` smallint(5) UNSIGNED NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `importeSalida` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ultimoAcceso` datetime NOT NULL,
  `tipoAcceso` set('a','u') COLLATE utf8mb4_spanish_ci NOT NULL,
  `bloqueado` set('s','n') COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atriculos`
--
ALTER TABLE `atriculos`
  ADD PRIMARY KEY (`idArticulo`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`idCaracteristica`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `caracyart`
--
ALTER TABLE `caracyart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idArticulo` (`idArticulo`),
  ADD KEY `idCaracteristica` (`idCaracteristica`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  ADD PRIMARY KEY (`idFotografia`),
  ADD KEY `idArticulo` (`idArticulo`);

--
-- Indices de la tabla `pujas`
--
ALTER TABLE `pujas`
  ADD PRIMARY KEY (`idCliente`,`idArticulo`,`fecha`,`importe`),
  ADD KEY `idArticulo` (`idArticulo`);

--
-- Indices de la tabla `subastas`
--
ALTER TABLE `subastas`
  ADD PRIMARY KEY (`idSubasta`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idArticulo` (`idArticulo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracyart`
--
ALTER TABLE `caracyart`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  MODIFY `idFotografia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `atriculos`
--
ALTER TABLE `atriculos`
  ADD CONSTRAINT `atriculos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD CONSTRAINT `caracteristicas_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `caracyart`
--
ALTER TABLE `caracyart`
  ADD CONSTRAINT `caracyart_ibfk_1` FOREIGN KEY (`idArticulo`) REFERENCES `atriculos` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `caracyart_ibfk_2` FOREIGN KEY (`idCaracteristica`) REFERENCES `caracteristicas` (`idCaracteristica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fotografias`
--
ALTER TABLE `fotografias`
  ADD CONSTRAINT `fotografias_ibfk_1` FOREIGN KEY (`idArticulo`) REFERENCES `atriculos` (`idArticulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pujas`
--
ALTER TABLE `pujas`
  ADD CONSTRAINT `pujas_ibfk_1` FOREIGN KEY (`idArticulo`) REFERENCES `atriculos` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pujas_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `subastas`
--
ALTER TABLE `subastas`
  ADD CONSTRAINT `subastas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `subastas_ibfk_2` FOREIGN KEY (`idArticulo`) REFERENCES `atriculos` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
