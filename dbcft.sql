-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2023 a las 18:10:35
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbcft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Codigo` varchar(45) NOT NULL,
  `FechaCreacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`ID`, `Nombre`, `Descripcion`, `Codigo`, `FechaCreacion`) VALUES
(1, 'Tecnologias Web', 'Modulo de Tecnologias Web', '6969', '2023-06-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas_asignadas`
--

CREATE TABLE `asignaturas_asignadas` (
  `ID` int(11) NOT NULL,
  `EstudiantesID` int(11) NOT NULL,
  `AsignaturasID` int(11) NOT NULL,
  `FechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas_asignadas`
--

INSERT INTO `asignaturas_asignadas` (`ID`, `EstudiantesID`, `AsignaturasID`, `FechaRegistro`) VALUES
(1, 1, 1, '2023-06-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Rut` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Edad` int(11) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`ID`, `Nombre`, `Apellido`, `Rut`, `Direccion`, `Email`, `Edad`, `FechaNacimiento`, `Password`) VALUES
(1, 'Bayron', 'Rojas', '21.312.178-2', 'Av. Las Brisas 2564', 'bayron.rojas.rojas@cftmail.cl', 19, '2003-06-06', '12345'),
(2, 'Carlos', 'Flores', '20.300.101-2', 'si', 'carlos.flores@cftmail.cl', 20, '2003-02-07', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `ID` int(11) NOT NULL,
  `Nota` float NOT NULL,
  `Ponderacion` float NOT NULL,
  `EstudiantesID` int(11) NOT NULL,
  `AsignaturasID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`ID`, `Nota`, `Ponderacion`, `EstudiantesID`, `AsignaturasID`) VALUES
(10, 70, 20, 1, 1),
(11, 60, 20, 1, 1),
(12, 7, 25, 2, 1),
(13, 70, 20, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `asignaturas_asignadas`
--
ALTER TABLE `asignaturas_asignadas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Estudiantes_has_Asignaturas_Asignaturas1_idx` (`AsignaturasID`),
  ADD KEY `fk_Estudiantes_has_Asignaturas_Estudiantes_idx` (`EstudiantesID`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Notas_Estudiantes1_idx` (`EstudiantesID`),
  ADD KEY `fk_Notas_Asignaturas1_idx` (`AsignaturasID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asignaturas_asignadas`
--
ALTER TABLE `asignaturas_asignadas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaturas_asignadas`
--
ALTER TABLE `asignaturas_asignadas`
  ADD CONSTRAINT `fk_Estudiantes_has_Asignaturas_Asignaturas1` FOREIGN KEY (`AsignaturasID`) REFERENCES `asignaturas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Estudiantes_has_Asignaturas_Estudiantes` FOREIGN KEY (`EstudiantesID`) REFERENCES `estudiantes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_Notas_Asignaturas1` FOREIGN KEY (`AsignaturasID`) REFERENCES `asignaturas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Notas_Estudiantes1` FOREIGN KEY (`EstudiantesID`) REFERENCES `estudiantes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
