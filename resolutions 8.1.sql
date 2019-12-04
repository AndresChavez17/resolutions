-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2019 a las 22:46:07
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `resolutions`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTIVOS_CLI` ()  BEGIN
	SELECT * FROM CLIENTES WHERE ESTADOCLI = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_CLI` (`REGIDCLI` INT)  BEGIN
	SELECT * FROM CLIENTES WHERE IDCLI = REGIDCLI;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_EQ` (`REGIDEQ` INT)  BEGIN
	SELECT * FROM EQUIPOS WHERE IDEQ = REGIDEQ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_EST` (`REGIDEST` INT)  BEGIN
	SELECT * FROM ESTADOS WHERE IDEST = REGIDEST;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_PART` (`REGIDPART` INT)  BEGIN
	SELECT * FROM PARTES WHERE IDPART = REGIDPART;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_PER` (`REGIDPER` INT)  BEGIN
	SELECT * FROM PERSONAS WHERE IDPER = REGIDPER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_SER` (`REGIDSER` INT)  BEGIN
	SELECT * FROM SERVICIOS WHERE IDSER = REGIDSER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_USU` (`REGIDUSU` INT)  BEGIN
	SELECT * FROM USUARIOS WHERE IDUSU = REGIDUSU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DESHABILITAR_CLI` (`REGIDCLI` INT)  BEGIN
	UPDATE CLIENTES SET ESTADOCLI = 0 WHERE IDCLI = REGIDCLI;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DESHABILITAR_USU` (`REGIDUSU` INT)  BEGIN
	UPDATE USUARIOS SET ESTADOUSU = 0 WHERE IDUSU = REGIDUSU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_CLI` (`REGIDCLI` INT)  BEGIN
	DELETE FROM CLIENTES WHERE IDCLI = REGIDCLI;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_EQ` (`REGIDEQ` INT)  BEGIN
	DELETE FROM EQUIPOS WHERE IDEQ = REGIDEQ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_EST` (`REGIDEST` INT)  BEGIN
	DELETE FROM ESTADOS WHERE IDEST = REGIDEST;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PART` (`REGIDPART` INT)  BEGIN
	DELETE FROM PARTES WHERE IDPART = REGIDPART;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PER` (`REGIDPER` INT)  BEGIN
	DELETE FROM PERSONAS WHERE IDPER = REGIDPER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_SER` (`REGIDSER` INT)  BEGIN
	DELETE FROM SERVICIOS WHERE IDSER = REGIDSER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_USU` (`REGIDUSU` INT)  BEGIN
	DELETE FROM USUARIOS WHERE IDUSU = REGIDUSU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EQUIPOSCONSERVICIO` ()  BEGIN
	SELECT EQUIPOS.IDEQ, EQUIPOS.NOMBREEQ FROM SERVICIOS INNER JOIN EQUIPOS ON EQUIPOS.IDEQ = SERVICIOS.IDEQ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HABILITAR_CLI` (`REGIDCLI` INT)  BEGIN
	UPDATE CLIENTES SET ESTADOCLI = 1 WHERE IDCLI = REGIDCLI;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HABILITAR_USU` (`REGIDUSU` INT)  BEGIN
	UPDATE USUARIOS SET ESTADOUSU = 1 WHERE IDUSU = REGIDUSU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_CLI` ()  BEGIN
	SELECT * FROM CLIENTES;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_EQ` ()  BEGIN
	SELECT * FROM EQUIPOS;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_EST` ()  BEGIN
	SELECT * FROM ESTADOS;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PART` ()  BEGIN
	SELECT * FROM PARTES;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PER` ()  BEGIN
	SELECT * FROM PERSONAS;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_SER` ()  BEGIN
	SELECT * FROM SERVICIOS;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_USU` ()  BEGIN
	SELECT * FROM USUARIOS;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_CLI` (`REGIDCLI` INT, `REGNOMBRECLI` VARCHAR(50), `REGDIRECCIONCLI` VARCHAR(25), `REGTELEFONOCLI` VARCHAR(15), `REGCELULARCLI` VARCHAR(20))  BEGIN
	UPDATE CLIENTES SET NOMBRECLI = REGNOMBRECLI, DIRECCIONCLI = REGDIRECCIONCLI, TELEFONOCLI = REGTELEFONOCLI, CELULARCLI = REGCELULARCLI WHERE IDCLI = REGIDCLI;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_EQ` (`REGIDEQ` INT, `REGIDEQCLI` INT, `REGIDEQEST` INT, `REGNOMBREEQ` VARCHAR(50), `REGINVENTARIOEQ` VARCHAR(20), `REGMARCAEQ` VARCHAR(20), `REGSERIEEQ` INT, `REGUBICACIONEQ` VARCHAR(15))  BEGIN
	UPDATE EQUIPOS SET IDEQCLI = REGIDEQCLI, IDEQEST = REGIDEQEST, NOMBREEQ = REGNOMBREEQ, INVENTARIOEQ = REGINVENTARIOEQ, MARCAEQ = REGMARCAEQ, SERIEEQ = REGSERIEEQ, UBICACIONEQ = REGUBICACIONEQ WHERE IDEQ = REGIDEQ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_EST` (`REGIDEST` INT, `REGNOMBREEST` VARCHAR(15))  BEGIN
	UPDATE ESTADOS SET NOMBREEST = REGNOMBREEST WHERE IDEST = REGIDEST;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_PART` (`REGIDPART` INT, `REGIDEQ` INT, `REGIDEST` INT, `REGNOMBREPART` VARCHAR(50), `REGTIPOPART` VARCHAR(25), `REGCOMENTARIOPART` VARCHAR(50))  BEGIN
	UPDATE PARTES SET IDEQ = REGIDEQ, IDEST = REGIDEST, NOMBREPART = REGNOMBREPART, TIPOPART = REGTIPOPART, COMENTARIOPART = REGCOMENTARIOPART WHERE IDPART = REGIDPART;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_PER` (`REGIDPER` INT, `REGIDUSU` INT, `REGTIPOPER` INT, `REGNOMBREPER` VARCHAR(30), `REGAPELLIDOPER` VARCHAR(30), `REGTIPODOCUMENTOPER` VARCHAR(10), `REGIDENTIFICACIONPER` BIGINT, `REGCORREOPER` VARCHAR(25))  BEGIN
	UPDATE PERSONAS SET IDUSU = REGIDUSU, TIPOPER = REGTIPOPER, NOMREPER = REGNOMBREPER, APELLIDOPER = REGAPELLIDOPER, TIPODOCUMENTOPER = REGTIPODOCUMENTOPER, IDENTIFICACIONPER = REGIDENTIFICACIONPER, CORREOPER = REGCORREOPER WHERE IDPER = REGIDPER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_SER` (`REGIDSER` INT, `REGIDPER` INT, `REGIDEQ` INT, `REGFECHAINGRESOSER` DATE, `REGFECHAENTREGASER` DATE, `REGOBSERVACIONESSER` VARCHAR(70))  BEGIN
	UPDATE SERVICIOS SET IDPER = REGIDPER, IDEQ = REGIDEQ, FECHAINGRESOSER = REGFECHAINGRESOSER, FECHAENTREGASER = REGFECHAENTREGASER, OBSERVACIONESSER = REGOBSERVACIONESSER WHERE IDSER = REGIDSER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_USU` (`REGIDUSU` INT, `REGNOMBREUSU` VARCHAR(25), `REGCLAVEUSU` VARCHAR(35))  BEGIN
	UPDATE USUARIOS SET NOMBREUSU = REGNOMBREUSU, CLAVEUSU = REGCLAVEUSU WHERE IDUSU = REGIDUSU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_CLI` (`REGIDCLI` VARCHAR(50), `REGNOMBRECLI` VARCHAR(50), `REGDIRECCIONCLI` VARCHAR(25), `REGTELEFONOCLI` VARCHAR(15), `REGCELULARCLI` VARCHAR(20))  BEGIN
	INSERT INTO CLIENTES(IDCLI, NOMBRECLI, DIRECCIONCLI, TELEFONOCLI, CELULARCLI) VALUES (REGIDCLI, REGNOMBRECLI, REGDIRECCIONCLI, REGTELEFONOCLI, REGCELULARCLI);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_EQ` (`REGIDEQ` INT, `REGIDEQCLI` INT, `REGIDEQEST` INT, `REGNOMBREEQ` VARCHAR(50), `REGINVENTARIOEQ` VARCHAR(20), `REGMARCAEQ` VARCHAR(20), `REGSERIEEQ` INT, `REGUBICACIONEQ` VARCHAR(15))  BEGIN
	INSERT INTO EQUIPOS(IDEQ, IDEQCLI, IDEQEST, NOMBREEQ, INVENTARIOEQ, MARCAEQ, SERIEEQ, UBICACIONEQ) VALUES (REGIDEQ, REGIDEQCLI, REGIDEQEST, REGNOMBREEQ, REGINVENTARIOEQ, REGMARCAEQ, REGSERIEEQ, REGUBICACIONEQ);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_EST` (`REGNOMBREEST` VARCHAR(15))  BEGIN
	INSERT INTO ESTADOS(NOMBREEST) VALUES (REGNOMBREEST);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PART` (`REGIDPART` INT, `REGIDEQ` INT, `REGIDEST` INT, `REGNOMBREPART` VARCHAR(50), `REGTIPOPART` VARCHAR(25), `REGCOMENTARIOPART` VARCHAR(50))  BEGIN
	INSERT INTO PARTES(IDPART, IDEQ, IDEST, NOMBREPART, TIPOPART, COMENTARIOPART) VALUES (REGIDPART, REGIDEQ, REGIDEST, REGNOMBREPART, REGTIPOPART, REGCOMENTARIOPART);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PER` (`REGIDPER` INT, `REGIDUSU` INT, `REGTIPOPER` INT, `REGNOMBREPER` VARCHAR(30), `REGAPELLIDOPER` VARCHAR(30), `REGTIPODOCUMENTOPER` VARCHAR(10), `REGIDENTIFICACIONPER` BIGINT, `REGCORREOPER` VARCHAR(25))  BEGIN
	INSERT INTO PERSONAS(IDPER, IDUSU, TIPOPER, NOMBREPER, APELLIDOPER, TIPODOCUMENTOPER, IDENTIFICACIONPER, CORREOPER) VALUES (REGIDPER, REGIDUSU, REGTIPOPER, REGNOMBREPER, REGAPELLIDOPER, REGTIPODOCUMENTOPER, REGIDENTIFICACIONPER, REGCORREOPER);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_SER` (`REGIDPER` INT, `REGIDEQ` INT, `REGFECHAINGRESOSER` DATE, `REGFECHAENTREGASER` DATE, `REGOBSERVACIONESSER` VARCHAR(70))  BEGIN
	INSERT INTO SERVICIOS(IDPER, IDEQ, FECHAINGRESOSER, FECHAENTREGASER, OBSERVACIONESSER) VALUES (REGIDPER, REGIDEQ, REGFECHAINGRESOSER, REGFECHAENTREGASER, REGOBSERVACIONESSER);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USU` (`REGIDUSU` INT, `REGNOMBREUSU` VARCHAR(25), `REGCLAVEUSU` VARCHAR(35))  BEGIN
	INSERT INTO USUARIOS(IDUSU, NOMBREUSU, CLAVEUSU) VALUES (REGIDUSU, REGNOMBREUSU, REGCLAVEUSU);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VALIDAR_ACCESO` (`REGNOMBREUSU` VARCHAR(25), `REGCLAVEUSU` VARCHAR(35))  BEGIN
	SELECT * FROM USUARIOS WHERE NOMBREUSU = REGNOMBREUSU AND CLAVEUSU = REGCLAVEUSU AND ESTADOUSU = 1;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `DIAS_ESTADIA` (`ID` INT) RETURNS INT(11) BEGIN
RETURN (SELECT DATEDIFF(SERVICIOS.FECHAENTREGASER, SERVICIOS.FECHAINGRESOSER) FROM SERVICIOS WHERE IDSER = ID);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IDCLI` int(11) NOT NULL,
  `NOMBRECLI` varchar(50) COLLATE utf8_bin NOT NULL,
  `DIRECCIONCLI` varchar(25) COLLATE utf8_bin NOT NULL,
  `TELEFONOCLI` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `CELULARCLI` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ESTADOCLI` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IDCLI`, `NOMBRECLI`, `DIRECCIONCLI`, `TELEFONOCLI`, `CELULARCLI`, `ESTADOCLI`) VALUES
(1213456, 'Empresa Carolina', 'calle 45 #5-55', '', '4545411559', 1),
(1234567, 'Jardin Social El Nogal', 'Carrera 11 N° 183 A - 90', '6682598', '', 1),
(98851220, 'Empresa S.A', 'Calle 45 #2-39', '6852718', '', 1),
(1234567890, 'Entidad S.A.S', 'Calle 32 # 23', '63215896', '3204910058', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `IDEQ` int(11) NOT NULL,
  `IDCLI` int(11) NOT NULL,
  `IDEST` int(11) NOT NULL,
  `NOMBREEQ` varchar(50) COLLATE utf8_bin NOT NULL,
  `INVENTARIOEQ` varchar(20) COLLATE utf8_bin NOT NULL,
  `MARCAEQ` varchar(20) COLLATE utf8_bin NOT NULL,
  `SERIEEQ` int(11) NOT NULL,
  `UBICACIONEQ` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`IDEQ`, `IDCLI`, `IDEST`, `NOMBREEQ`, `INVENTARIOEQ`, `MARCAEQ`, `SERIEEQ`, `UBICACIONEQ`) VALUES
(1, 1234567890, 2, 'Nevera Vertical 17 pies', 'Refrigeración', 'Pana', 42519, 'Cocina'),
(2, 1234567890, 3, 'Nevera Nofros', 'Mixto', 'Haceb', 36775532, 'Cocina'),
(2020, 1234567890, 3, 'Nevera Vertical 10', 'Mixto', 'Abba', 201251, 'Habitacion');

--
-- Disparadores `equipos`
--
DELIMITER $$
CREATE TRIGGER `DESTRUIREQUIPO` BEFORE DELETE ON `equipos` FOR EACH ROW BEGIN
	DELETE FROM SERVICIOS WHERE SERVICIOS.IDEQ = OLD.IDEQ;
	DELETE FROM PARTES WHERE PARTES.IDEQ = OLD.IDEQ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `IDEST` int(11) NOT NULL,
  `NOMBREEST` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`IDEST`, `NOMBREEST`) VALUES
(1, 'Reparado'),
(2, 'En Reparación'),
(3, 'Por Reparar'),
(4, 'Bien'),
(5, 'Regular'),
(6, 'Mal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partes`
--

CREATE TABLE `partes` (
  `IDPART` int(11) NOT NULL,
  `IDEQ` int(11) NOT NULL,
  `IDEST` int(11) NOT NULL,
  `NOMBREPART` varchar(50) COLLATE utf8_bin NOT NULL,
  `TIPOPART` varchar(25) COLLATE utf8_bin NOT NULL,
  `COMENTARIOPART` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `partes`
--

INSERT INTO `partes` (`IDPART`, `IDEQ`, `IDEST`, `NOMBREPART`, `TIPOPART`, `COMENTARIOPART`) VALUES
(1, 1, 4, 'Control de temperatura', 'Mecanica', 'Todo bien'),
(2, 2, 5, 'Motor', 'Mecanica', 'Buen estado'),
(3012, 2020, 5, 'Luces', 'Terminacion', 'No hay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `IDPER` int(11) NOT NULL,
  `IDUSU` int(11) NOT NULL,
  `TIPOPER` int(11) NOT NULL,
  `NOMBREPER` varchar(30) COLLATE utf8_bin NOT NULL,
  `APELLIDOPER` varchar(30) COLLATE utf8_bin NOT NULL,
  `TIPODOCUMENTOPER` varchar(10) COLLATE utf8_bin NOT NULL,
  `IDENTIFICACIONPER` bigint(20) NOT NULL,
  `CORREOPER` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`IDPER`, `IDUSU`, `TIPOPER`, `NOMBREPER`, `APELLIDOPER`, `TIPODOCUMENTOPER`, `IDENTIFICACIONPER`, `CORREOPER`) VALUES
(1, 1, 1, 'Gabriel', 'Garcia', 'C.C', 123456789, 'gabi@yopmail.com'),
(2, 2, 0, 'Guillermo', 'Correa', 'C.C', 987654321, 'guib@misena.com'),
(3, 3, 0, 'Juanita Antonia', 'Lopez', 'C.C', 4345345, 'jc.1000218962@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `IDSER` int(11) NOT NULL,
  `IDPER` int(11) NOT NULL,
  `IDEQ` int(11) NOT NULL,
  `FECHAINGRESOSER` date NOT NULL,
  `FECHAENTREGASER` date DEFAULT NULL,
  `OBSERVACIONESSER` varchar(70) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`IDSER`, `IDPER`, `IDEQ`, `FECHAINGRESOSER`, `FECHAENTREGASER`, `OBSERVACIONESSER`) VALUES
(1, 1, 1, '2019-09-10', '2019-11-21', 'Ninguna'),
(3, 1, 2, '2019-07-10', '2020-01-21', 'Rota'),
(4, 2, 2020, '2019-11-14', '2019-11-21', 'Se le hizo arreglo en las luces');

--
-- Disparadores `servicios`
--
DELIMITER $$
CREATE TRIGGER `FECHASERVICIOS` BEFORE UPDATE ON `servicios` FOR EACH ROW BEGIN
	IF(NEW.FECHAENTREGASER < NEW.FECHAINGRESOSER)
		THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La fecha de ingreso no puede ser mayor que la fecha de entrega';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PREVENIRMASSERVICIOS` BEFORE INSERT ON `servicios` FOR EACH ROW BEGIN
	IF(SELECT IDEQ FROM SERVICIOS WHERE SERVICIOS.IDEQ = NEW.IDEQ)
		THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El equipo ya tiene un servicio';
	ELSEIF(NEW.FECHAENTREGASER < NEW.FECHAINGRESOSER)
		THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La fecha de ingreso no puede ser mayor que la fecha de entrega';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDUSU` int(11) NOT NULL,
  `NOMBREUSU` varchar(25) COLLATE utf8_bin NOT NULL,
  `CLAVEUSU` varchar(35) COLLATE utf8_bin NOT NULL,
  `ESTADOUSU` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDUSU`, `NOMBREUSU`, `CLAVEUSU`, `ESTADOUSU`) VALUES
(1, 'Gabriel', '1234', 1),
(2, 'Guillermo', 'abcd', 1),
(3, 'juanita', 'a6baj38kgc', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_equipo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_equipo` (
`IDEQ` int(11)
,`EQUIPO` varchar(50)
,`ESTADO` varchar(15)
,`INVENTARIO` varchar(20)
,`MARCA` varchar(20)
,`SERIE` int(11)
,`UBICACION` varchar(15)
,`CLIENTE` varchar(50)
,`DIRECCION` varchar(25)
,`IDSER` int(11)
,`INGRESO` date
,`ENTREGA` date
,`OBSERVACIONES` varchar(70)
,`EMPLEADONOM` varchar(30)
,`EMPLEADOPER` varchar(30)
,`IDENTIFICACIONPER` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_equipo`
--
DROP TABLE IF EXISTS `vista_equipo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_equipo`  AS  select `equipos`.`IDEQ` AS `IDEQ`,`equipos`.`NOMBREEQ` AS `EQUIPO`,`estados`.`NOMBREEST` AS `ESTADO`,`equipos`.`INVENTARIOEQ` AS `INVENTARIO`,`equipos`.`MARCAEQ` AS `MARCA`,`equipos`.`SERIEEQ` AS `SERIE`,`equipos`.`UBICACIONEQ` AS `UBICACION`,`clientes`.`NOMBRECLI` AS `CLIENTE`,`clientes`.`DIRECCIONCLI` AS `DIRECCION`,`servicios`.`IDSER` AS `IDSER`,`servicios`.`FECHAINGRESOSER` AS `INGRESO`,`servicios`.`FECHAENTREGASER` AS `ENTREGA`,`servicios`.`OBSERVACIONESSER` AS `OBSERVACIONES`,`personas`.`NOMBREPER` AS `EMPLEADONOM`,`personas`.`APELLIDOPER` AS `EMPLEADOPER`,`personas`.`IDENTIFICACIONPER` AS `IDENTIFICACIONPER` from ((((`equipos` join `clientes` on((`equipos`.`IDCLI` = `clientes`.`IDCLI`))) join `estados` on((`estados`.`IDEST` = `equipos`.`IDEST`))) join `servicios` on((`servicios`.`IDEQ` = `equipos`.`IDEQ`))) join `personas` on((`personas`.`IDPER` = `servicios`.`IDPER`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IDCLI`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`IDEQ`),
  ADD KEY `FK_EQUIPO_CLIENTE` (`IDCLI`),
  ADD KEY `FK_EQUIPO_ESTADO` (`IDEST`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`IDEST`);

--
-- Indices de la tabla `partes`
--
ALTER TABLE `partes`
  ADD PRIMARY KEY (`IDPART`),
  ADD KEY `FK_PARTE_EQUIPO` (`IDEQ`),
  ADD KEY `FK_PARTE_ESTADO` (`IDEST`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`IDPER`),
  ADD UNIQUE KEY `IDENTIFICACIONPER` (`IDENTIFICACIONPER`),
  ADD UNIQUE KEY `CORREOPER` (`CORREOPER`),
  ADD KEY `FK_PERSONA_USUARIO` (`IDUSU`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`IDSER`),
  ADD KEY `FK_SERVICIO_PERSONA` (`IDPER`),
  ADD KEY `FK_SERVICIO_EQUIPO` (`IDEQ`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDUSU`),
  ADD UNIQUE KEY `NOMBREUSU` (`NOMBREUSU`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `IDCLI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234567891;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `IDEQ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2021;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `IDEST` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `partes`
--
ALTER TABLE `partes`
  MODIFY `IDPART` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3013;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `IDPER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `IDSER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDUSU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `FK_EQUIPO_CLIENTE` FOREIGN KEY (`IDCLI`) REFERENCES `clientes` (`IDCLI`),
  ADD CONSTRAINT `FK_EQUIPO_ESTADO` FOREIGN KEY (`IDEST`) REFERENCES `estados` (`IDEST`);

--
-- Filtros para la tabla `partes`
--
ALTER TABLE `partes`
  ADD CONSTRAINT `FK_PARTE_EQUIPO` FOREIGN KEY (`IDEQ`) REFERENCES `equipos` (`IDEQ`),
  ADD CONSTRAINT `FK_PARTE_ESTADO` FOREIGN KEY (`IDEST`) REFERENCES `estados` (`IDEST`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `FK_PERSONA_USUARIO` FOREIGN KEY (`IDUSU`) REFERENCES `usuarios` (`IDUSU`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `FK_SERVICIO_EQUIPO` FOREIGN KEY (`IDEQ`) REFERENCES `equipos` (`IDEQ`),
  ADD CONSTRAINT `FK_SERVICIO_PERSONA` FOREIGN KEY (`IDPER`) REFERENCES `personas` (`IDPER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
