-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2019 a las 05:53:24
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_tienda_videojuegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombres` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `imagen` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombres`, `apellidos`, `correo`, `telefono`, `fechaRegistro`, `imagen`) VALUES
(1, 'Lovecraft', 'Howard Phillips', 'lovecraft.H.P@gmail.com', '994881581', '2019-10-22 23:16:57', 'buyers/buyer1.jpg'),
(2, 'Edgar ', 'Allan Poe', 'edgarPoe@gmail.com', '994881582', '2019-10-22 23:16:57', 'buyers/buyer2.jpg'),
(3, 'John Ronald', 'Reuel Tolkien', 'johnTolkien@gmail.com', '994881583', '2019-10-22 23:17:29', 'buyers/buyer3.jpg'),
(4, 'William', 'Shakespeare', 'williamShakespeare@gmail.com', '994881583', '2019-10-22 23:20:06', 'buyers/buyer4.jpg'),
(5, 'Charles ', 'Dickens', 'charlesDickens@gmail.com', '994881584', '2019-10-22 23:20:06', 'buyers/buyer5.jpg'),
(6, 'Mark ', 'Twain', 'markTwain@gmail.com', '994881585', '2019-10-22 23:21:38', 'buyers/buyer6.jpg'),
(7, 'Joanne ', 'Rowling', 'J.K.Rowling@gmail.com', '994881586', '2019-10-22 23:21:38', 'buyers/buyer7.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idComentario` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idVideojuego` int(11) NOT NULL,
  `comentarios` varchar(200) NOT NULL,
  `calificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idComentario`, `idCliente`, `idVideojuego`, `comentarios`, `calificacion`) VALUES
(1, 1, 1, 'El mejor juego remasterizado de la PS4.', 100),
(2, 2, 1, 'El mejor juego jamas remasterizado de la PS4.', 80),
(3, 7, 1, 'Gran juego de la PS4.', 60),
(4, 4, 1, 'Gran juego para recordar la famosa PS1.', 100),
(5, 5, 1, 'Quede encantando con este gran juego.', 80),
(6, 7, 2, 'Vaya pasado de juego de Ps4!!', 80),
(7, 5, 2, 'Vaya nostalgia me hizo pasar este juego.', 80),
(8, 4, 2, 'Amo el juego clásico de Spyro!!', 100),
(9, 1, 2, 'Estuvo bueno este juego, pero no el mejor que hay para PS4.', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `id` int(11) NOT NULL,
  `idVideojuego` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fechaRegistroVenta` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`id`, `idVideojuego`, `idCliente`, `fechaRegistroVenta`) VALUES
(1, 1, 1, '2019-10-28'),
(2, 2, 4, '2019-10-22'),
(3, 4, 3, '2019-10-24'),
(4, 2, 2, '2019-10-15'),
(5, 5, 5, '2019-10-19'),
(6, 3, 1, '2019-11-08'),
(7, 1, 3, '2019-11-08'),
(8, 3, 6, '2019-11-08'),
(9, 3, 2, '2019-11-08'),
(10, 5, 1, '2019-11-08'),
(11, 2, 3, '2019-11-08'),
(12, 4, 2, '2019-11-08'),
(13, 1, 6, '2019-11-08'),
(14, 4, 4, '2019-11-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego`
--

CREATE TABLE `videojuego` (
  `idVideojuego` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `genero` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `clasificacion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `desarrolladora` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `imagengrande` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `videojuego`
--

INSERT INTO `videojuego` (`idVideojuego`, `nombre`, `descripcion`, `genero`, `clasificacion`, `precio`, `desarrolladora`, `imagengrande`) VALUES
(1, 'Crash Bandicoot', 'Crash Bandicoot regresa mass encantador, fascinante y listo para bailar con la coleccion del juego N. Sane Trilogy. Vive una vez mas tus momentos favoritos de Crash en toda su gloria.', 'Videojuego de plataformas', 'Kids to Adults', '120', 'Naughty Dog', 'imagenes/videojuego1.jpeg'),
(2, 'Spyro the Dragon', 'Spyro esta de vuelta en Spyro Reignited Trilogy, con las mismas llamaradas, la misma actitud ardiente, ahora intensificadas en HD. Reaviva el fuego con los tres juegos originales: Spyro the Dragon.', 'Videojuego de plataformas', 'Everyone', '100', 'Insomniac Games ', 'imagenes/videojuego2.jpg'),
(3, 'Borderlands ', 'Se trata de una remasterizacion del juego que inicio la saga en 2009 en PS3, Xbox 360 y PC, y que hasta ahora no habia llegado a las actuales consolas. Esta edicion incluye el juego base, un shooter.', 'Videojuego de plataformas', 'Mature 17+', '100', 'Telltale Games', 'imagenes/videojuego3.jpg'),
(4, 'Kingdom Hearts III', 'Seguira siendo el protagonista y deberemos librar una nueva lucha para mantener el poder de la luz lidiando contra el malvado Maestro Xehanort. ', 'Videojuego de plataformas', 'Kids to Adults', '160', ' Square Enix', 'imagenes/videojuego4.jpg'),
(5, 'Star Wars Jedi: Fallen Order', 'Una aventura de dimensiones galacticas te espera en STAR WARS Jedi: Fallen Order, un nuevo titulo de accion y aventura en tercera persona creado por Respawn Entertainment. ', 'Videojuego de plataformas', 'Everyone', '180', 'Respawn Entertainment', 'imagenes/videojuego5.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `comentarios_fk_cliente` (`idCliente`),
  ADD KEY `comentarios_fk_videojuego` (`idVideojuego`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalleVenta_fk_cliente` (`idCliente`),
  ADD KEY `detalleVenta_fk_videojuego` (`idVideojuego`);

--
-- Indices de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD PRIMARY KEY (`idVideojuego`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  MODIFY `idVideojuego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_fk_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `comentarios_fk_videojuego` FOREIGN KEY (`idVideojuego`) REFERENCES `videojuego` (`idVideojuego`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleVenta_fk_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `detalleVenta_fk_videojuego` FOREIGN KEY (`idVideojuego`) REFERENCES `videojuego` (`idVideojuego`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
