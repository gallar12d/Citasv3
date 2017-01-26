-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2017 a las 18:14:30
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliaciones`
--

CREATE TABLE `afiliaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo_empresa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `afiliaciones`
--

INSERT INTO `afiliaciones` (`id`, `codigo_empresa`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'Emsanar', NULL, NULL),
(2, '2', 'Asmet Salud', NULL, NULL),
(3, '3', 'Confamiliar', NULL, NULL),
(4, '4', 'SaludCoop', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendadoctores`
--

CREATE TABLE `agendadoctores` (
  `id` int(10) UNSIGNED NOT NULL,
  `start` datetime NOT NULL,
  `medico_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendamientos`
--

CREATE TABLE `agendamientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Amazonas', NULL, NULL),
(2, 'Antioquia', NULL, NULL),
(3, 'Arauca', NULL, NULL),
(4, 'Atlántico', NULL, NULL),
(5, 'Bolívar', NULL, NULL),
(6, 'Boyacá', NULL, NULL),
(7, 'Caldas', NULL, NULL),
(8, 'Caquetá', NULL, NULL),
(9, 'Casanare', NULL, NULL),
(10, 'Cauca', NULL, NULL),
(11, 'Cesar', NULL, NULL),
(12, 'Chocó', NULL, NULL),
(13, 'Córdoba', NULL, NULL),
(14, 'Cundinamarca', NULL, NULL),
(15, 'Güainia', NULL, NULL),
(16, 'Guaviare', NULL, NULL),
(17, 'Huila', NULL, NULL),
(18, 'La Guajira', NULL, NULL),
(19, 'Magdalena', NULL, NULL),
(20, 'Meta', NULL, NULL),
(21, 'Nariño', NULL, NULL),
(22, 'Norte de Santander', NULL, NULL),
(23, 'Putumayo', NULL, NULL),
(24, 'Quindio', NULL, NULL),
(25, 'Risaralda', NULL, NULL),
(26, 'San Andrés y Providencia', NULL, NULL),
(27, 'Santander', NULL, NULL),
(28, 'Sucre', NULL, NULL),
(29, 'Tolima', NULL, NULL),
(30, 'Valle del Cauca', NULL, NULL),
(31, 'Vaupés', NULL, NULL),
(32, 'Vichada', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ruc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `created_at`, `updated_at`, `descripcion`) VALUES
(1, 'Médico General', '2016-11-19 20:55:50', '2016-11-19 20:55:50', 'Médico General '),
(2, 'Odontología', '2016-11-19 20:56:08', '2016-11-19 20:56:08', 'Odontología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarioreserva`
--

CREATE TABLE `horarioreserva` (
  `id` int(11) NOT NULL,
  `tipoid` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `identificacion` int(11) NOT NULL,
  `eps` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `idhorario` int(11) NOT NULL,
  `fechareserva` date NOT NULL,
  `horareserva` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `diasemana` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipoatencion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `semana` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `primerdia` int(11) NOT NULL,
  `ultimodia` int(11) NOT NULL,
  `horario` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `medico_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infocitas`
--

CREATE TABLE `infocitas` (
  `id` int(11) NOT NULL,
  `tipoid` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `numid` int(200) NOT NULL,
  `nombres` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(200) NOT NULL,
  `fecha_hizo_reserva` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `infocitas`
--

INSERT INTO `infocitas` (`id`, `tipoid`, `numid`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_hizo_reserva`) VALUES
(1, 'cedula', 333333, 'diego', 'gallardo', 'guarangal', 444444, '2016-11-23'),
(2, 'cedula', 333333, 'diego', 'gallardo', 'guarangal', 444444, '2016-11-23'),
(3, 'cedula', 333333, 'diego', 'gallardo', 'guarangal', 444444, '2016-11-23'),
(4, 'cedula', 1081594157, 'diego', 'gallardo', 'guarangal', 345245, '2016-11-23'),
(5, 'cedula', 1081594157, 'diego', 'gallardo', 'guarangal', 2234525, '2016-11-24'),
(6, 'cedula', 2345234, 'dasfasd', 'asdfadf', 'afdasdf', 352345, '2016-11-25'),
(7, 'cedula', 11111, 'diego', 'gallardo', 'guarangal32534565', 34523234, '2016-11-25'),
(8, 'cedula', 1081594157, 'diego', 'gallardo', 'guarangal', 234523453, '2016-11-30'),
(9, 'cedula', 10810000, 'diego', 'gallardo', 'guarangal', 234234, '2016-11-30'),
(10, 'cedula', 19, 'diego', 'gallardo', 'guarangal', 245234, '2016-11-30'),
(11, 'cedula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 2345245, '2016-11-30'),
(12, 'cedula', 63465, 'sdfgsdf', 'sdfgs', 'gsdfgs', 4563, '2016-11-30'),
(13, 'cedula', 1081594157, 'diego', 'galardo', 'guarangal', 245234, '2016-11-30'),
(14, 'ti', 123456, 'Diego', 'Gallardo', 'Guarangal ', 34524524, '2017-01-18'),
(15, 'cedula', 23452345, 'diego', 'gallardo', 'guarangal', 45234, '2017-01-19'),
(16, 'cedula', 5245235, 'fsaf', 'sadfadf', 'asdf', 35, '2017-01-19'),
(17, 'cedula', 101010101, 'Diego', 'Gallardo', 'Guarangal', 5634, '2017-01-19'),
(18, 'cédula', 123456, 'sdfasdf', 'adsfa', 'sadfa', 2345235, '2017-01-20'),
(19, 'cédula', 12121212, 'ddddddd', 'aaaaaaaa', 'fffffff', 11111111, '2017-01-20'),
(20, 'cédula', 2345, 'qre', 'qwer', 'qwr', 3452, '2017-01-20'),
(21, 'cédula', 41234, 'qewr', 'qewr', 'qwer', 1423, '2017-01-20'),
(22, 'cédula', 2345, 'rqw', 'qwer', 'rqe', 245, '2017-01-20'),
(23, 'cédula', 41234, 'qwerqe', 'asdf', 'asdf', 3259689, '2017-01-20'),
(24, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-20'),
(25, 'cédula', 1081594157, 'diego', 'gallado', 'guarangal', 34523, '2017-01-20'),
(26, 'cédula', 23452345, 'asdfa', 'asdfasaf', 'asdf', 235, '2017-01-20'),
(27, 'cédula', 234234, 'qwerqe', 'asdfa', 'asdfa', 3259689, '2017-01-21'),
(28, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 23452345, '2017-01-21'),
(29, 'cédula', 1081594157, 'diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-21'),
(30, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-21'),
(31, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-21'),
(32, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-21'),
(33, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-21'),
(34, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-21'),
(35, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-24'),
(36, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-24'),
(37, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-24'),
(38, 'cédula', 1081594157, 'Diego', 'Gallardo', 'Guarangal', 3259689, '2017-01-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `Nombres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Identificacion` int(11) NOT NULL,
  `departamento_id` int(10) UNSIGNED NOT NULL,
  `municipio_id` int(10) UNSIGNED NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Celular` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `Nombres`, `Apellidos`, `Identificacion`, `departamento_id`, `municipio_id`, `Fecha_nac`, `Celular`, `email`, `Direccion`, `imagen`) VALUES
(1, 'Diego Hernán', 'Gallardo López', 2147483647, 21, 750, '2016-11-16', 42452, 'algo@gmail.com', 'algo', 'thumbnails/oYeocTqAtKzsBVDH9XQ6tXpbVeDOFT.png'),
(2, 'Juan', 'Perez', 453453, 16, 635, '2016-11-22', 34643745, 'algo@gmail.com', 'algo', 'thumbnails/X8jWOIopMz5D4PP51tctpj3tEvjTHL.png'),
(3, 'Harold', 'ordonez', 2147483647, 21, 750, '2016-12-08', 35235245, 'fadf@fasd.com', 'guarangal', 'thumbnails/cX3l4jFstnTJhHecEvkLypr4cFen0D.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_especialidad`
--

CREATE TABLE `medico_especialidad` (
  `id` int(10) UNSIGNED NOT NULL,
  `medico_id` int(10) UNSIGNED NOT NULL,
  `especialidad_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `medico_especialidad`
--

INSERT INTO `medico_especialidad` (`id`, `medico_id`, `especialidad_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, NULL, NULL, 0),
(2, 1, 2, NULL, NULL, 0),
(3, 2, 1, NULL, NULL, 0),
(4, 2, 2, NULL, NULL, 0),
(5, 3, 1, NULL, NULL, 0),
(6, 3, 2, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_10_31_162633_scaffoldinterfaces', 1),
('2016_03_12_191413_entrust_setup_tables', 1),
('2016_09_25_181429_create_departamentos_table', 1),
('2016_09_25_181753_create_municipios_table', 1),
('2016_09_27_121022_empresas', 1),
('2016_10_05_205751_create_profesores_table', 1),
('2016_10_05_231353_create_afiliaciones_table', 1),
('2016_10_05_231701_create_paciente_table', 1),
('2016_10_11_154827_create_especialidades_table', 1),
('2016_10_11_155636_add_descripcion_table_especialidades', 1),
('2016_10_13_115742_medicos', 1),
('2016_10_15_061403_create_medico_especialidad_table', 1),
('2016_10_15_154439_add_status_table_medico_especialidaad', 1),
('2016_10_15_181644_create_images_table', 1),
('2016_10_15_205032_add_imagen_table_medico', 1),
('2016_10_18_143749_create_agendamientos_table', 1),
('2016_10_18_174521_create_agendadoctores_table', 1),
('2016_10_18_175335_add_medico_id_table_agendamedico', 1),
('2016_10_19_215546_create_horarios_table', 1),
('2016_10_20_202921_create_usuarios_table', 1),
('2016_10_20_202924_add_image_table_usuarios', 1),
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_10_31_162633_scaffoldinterfaces', 1),
('2016_03_12_191413_entrust_setup_tables', 1),
('2016_09_25_181429_create_departamentos_table', 1),
('2016_09_25_181753_create_municipios_table', 1),
('2016_09_27_121022_empresas', 1),
('2016_10_05_205751_create_profesores_table', 1),
('2016_10_05_231353_create_afiliaciones_table', 1),
('2016_10_05_231701_create_paciente_table', 1),
('2016_10_11_154827_create_especialidades_table', 1),
('2016_10_11_155636_add_descripcion_table_especialidades', 1),
('2016_10_13_115742_medicos', 1),
('2016_10_15_061403_create_medico_especialidad_table', 1),
('2016_10_15_154439_add_status_table_medico_especialidaad', 1),
('2016_10_15_181644_create_images_table', 1),
('2016_10_15_205032_add_imagen_table_medico', 1),
('2016_10_18_143749_create_agendamientos_table', 1),
('2016_10_18_174521_create_agendadoctores_table', 1),
('2016_10_18_175335_add_medico_id_table_agendamedico', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departamento_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `nombre`, `departamento_id`, `created_at`, `updated_at`) VALUES
(1, 'Leticia', 1, NULL, NULL),
(2, 'Puerto Nariño', 1, NULL, NULL),
(3, 'Abejorral', 2, NULL, NULL),
(4, 'Abriaquí', 2, NULL, NULL),
(5, 'Alejandria', 2, NULL, NULL),
(6, 'Amagá', 2, NULL, NULL),
(7, 'Amalfi', 2, NULL, NULL),
(8, 'Andes', 2, NULL, NULL),
(9, 'Angelópolis', 2, NULL, NULL),
(10, 'Angostura', 2, NULL, NULL),
(11, 'Anorí', 2, NULL, NULL),
(12, 'Anzá', 2, NULL, NULL),
(13, 'Apartadó', 2, NULL, NULL),
(14, 'Arboletes', 2, NULL, NULL),
(15, 'Argelia', 2, NULL, NULL),
(16, 'Armenia', 2, NULL, NULL),
(17, 'Barbosa', 2, NULL, NULL),
(18, 'Bello', 2, NULL, NULL),
(19, 'Belmira', 2, NULL, NULL),
(20, 'Betania', 2, NULL, NULL),
(21, 'Betulia', 2, NULL, NULL),
(22, 'Bolívar', 2, NULL, NULL),
(23, 'Briceño', 2, NULL, NULL),
(24, 'Burítica', 2, NULL, NULL),
(25, 'Caicedo', 2, NULL, NULL),
(26, 'Caldas', 2, NULL, NULL),
(27, 'Campamento', 2, NULL, NULL),
(28, 'Caracolí', 2, NULL, NULL),
(29, 'Caramanta', 2, NULL, NULL),
(30, 'Carepa', 2, NULL, NULL),
(31, 'Carmen de Viboral', 2, NULL, NULL),
(32, 'Carolina', 2, NULL, NULL),
(33, 'Caucasia', 2, NULL, NULL),
(34, 'Cañasgordas', 2, NULL, NULL),
(35, 'Chigorodó', 2, NULL, NULL),
(36, 'Cisneros', 2, NULL, NULL),
(37, 'Cocorná', 2, NULL, NULL),
(38, 'Concepción', 2, NULL, NULL),
(39, 'Concordia', 2, NULL, NULL),
(40, 'Copacabana', 2, NULL, NULL),
(41, 'Cáceres', 2, NULL, NULL),
(42, 'Dabeiba', 2, NULL, NULL),
(43, 'Don Matías', 2, NULL, NULL),
(44, 'Ebéjico', 2, NULL, NULL),
(45, 'El Bagre', 2, NULL, NULL),
(46, 'Entrerríos', 2, NULL, NULL),
(47, 'Envigado', 2, NULL, NULL),
(48, 'Fredonia', 2, NULL, NULL),
(49, 'Frontino', 2, NULL, NULL),
(50, 'Giraldo', 2, NULL, NULL),
(51, 'Girardota', 2, NULL, NULL),
(52, 'Granada', 2, NULL, NULL),
(53, 'Guadalupe', 2, NULL, NULL),
(54, 'Guarne', 2, NULL, NULL),
(55, 'Guatapé', 2, NULL, NULL),
(56, 'Gómez Plata', 2, NULL, NULL),
(57, 'Heliconia', 2, NULL, NULL),
(58, 'Hispania', 2, NULL, NULL),
(59, 'Itagüí', 2, NULL, NULL),
(60, 'Ituango', 2, NULL, NULL),
(61, 'Jardín', 2, NULL, NULL),
(62, 'Jericó', 2, NULL, NULL),
(63, 'La Ceja', 2, NULL, NULL),
(64, 'La Estrella', 2, NULL, NULL),
(65, 'La Pintada', 2, NULL, NULL),
(66, 'La Unión', 2, NULL, NULL),
(67, 'Liborina', 2, NULL, NULL),
(68, 'Maceo', 2, NULL, NULL),
(69, 'Marinilla', 2, NULL, NULL),
(70, 'Medellín', 2, NULL, NULL),
(71, 'Montebello', 2, NULL, NULL),
(72, 'Murindó', 2, NULL, NULL),
(73, 'Mutatá', 2, NULL, NULL),
(74, 'Nariño', 2, NULL, NULL),
(75, 'Nechí', 2, NULL, NULL),
(76, 'Necoclí', 2, NULL, NULL),
(77, 'Olaya', 2, NULL, NULL),
(78, 'Peque', 2, NULL, NULL),
(79, 'Peñol', 2, NULL, NULL),
(80, 'Pueblorrico', 2, NULL, NULL),
(81, 'Puerto Berrío', 2, NULL, NULL),
(82, 'Puerto Nare', 2, NULL, NULL),
(83, 'Puerto Triunfo', 2, NULL, NULL),
(84, 'Remedios', 2, NULL, NULL),
(85, 'Retiro', 2, NULL, NULL),
(86, 'Ríonegro', 2, NULL, NULL),
(87, 'Sabanalarga', 2, NULL, NULL),
(88, 'Sabaneta', 2, NULL, NULL),
(89, 'Salgar', 2, NULL, NULL),
(90, 'San Andrés de Cuerquía', 2, NULL, NULL),
(91, 'San Carlos', 2, NULL, NULL),
(92, 'San Francisco', 2, NULL, NULL),
(93, 'San Jerónimo', 2, NULL, NULL),
(94, 'San José de Montaña', 2, NULL, NULL),
(95, 'San Juan de Urabá', 2, NULL, NULL),
(96, 'San Luís', 2, NULL, NULL),
(97, 'San Pedro', 2, NULL, NULL),
(98, 'San Pedro de Urabá', 2, NULL, NULL),
(99, 'San Rafael', 2, NULL, NULL),
(100, 'San Roque', 2, NULL, NULL),
(101, 'San Vicente', 2, NULL, NULL),
(102, 'Santa Bárbara', 2, NULL, NULL),
(103, 'Santa Fé de Antioquia', 2, NULL, NULL),
(104, 'Santa Rosa de Osos', 2, NULL, NULL),
(105, 'Santo Domingo', 2, NULL, NULL),
(106, 'Santuario', 2, NULL, NULL),
(107, 'Segovia', 2, NULL, NULL),
(108, 'Sonsón', 2, NULL, NULL),
(109, 'Sopetrán', 2, NULL, NULL),
(110, 'Tarazá', 2, NULL, NULL),
(111, 'Tarso', 2, NULL, NULL),
(112, 'Titiribí', 2, NULL, NULL),
(113, 'Toledo', 2, NULL, NULL),
(114, 'Turbo', 2, NULL, NULL),
(115, 'Támesis', 2, NULL, NULL),
(116, 'Uramita', 2, NULL, NULL),
(117, 'Urrao', 2, NULL, NULL),
(118, 'Valdivia', 2, NULL, NULL),
(119, 'Valparaiso', 2, NULL, NULL),
(120, 'Vegachí', 2, NULL, NULL),
(121, 'Venecia', 2, NULL, NULL),
(122, 'Vigía del Fuerte', 2, NULL, NULL),
(123, 'Yalí', 2, NULL, NULL),
(124, 'Yarumal', 2, NULL, NULL),
(125, 'Yolombó', 2, NULL, NULL),
(126, 'Yondó (Casabe)', 2, NULL, NULL),
(127, 'Zaragoza', 2, NULL, NULL),
(128, 'Arauca', 3, NULL, NULL),
(129, 'Arauquita', 3, NULL, NULL),
(130, 'Cravo Norte', 3, NULL, NULL),
(131, 'Fortúl', 3, NULL, NULL),
(132, 'Puerto Rondón', 3, NULL, NULL),
(133, 'Saravena', 3, NULL, NULL),
(134, 'Tame', 3, NULL, NULL),
(135, 'Baranoa', 4, NULL, NULL),
(136, 'Barranquilla', 4, NULL, NULL),
(137, 'Campo de la Cruz', 4, NULL, NULL),
(138, 'Candelaria', 4, NULL, NULL),
(139, 'Galapa', 4, NULL, NULL),
(140, 'Juan de Acosta', 4, NULL, NULL),
(141, 'Luruaco', 4, NULL, NULL),
(142, 'Malambo', 4, NULL, NULL),
(143, 'Manatí', 4, NULL, NULL),
(144, 'Palmar de Varela', 4, NULL, NULL),
(145, 'Piojo', 4, NULL, NULL),
(146, 'Polonuevo', 4, NULL, NULL),
(147, 'Ponedera', 4, NULL, NULL),
(148, 'Puerto Colombia', 4, NULL, NULL),
(149, 'Repelón', 4, NULL, NULL),
(150, 'Sabanagrande', 4, NULL, NULL),
(151, 'Sabanalarga', 4, NULL, NULL),
(152, 'Santa Lucía', 4, NULL, NULL),
(153, 'Santo Tomás', 4, NULL, NULL),
(154, 'Soledad', 4, NULL, NULL),
(155, 'Suan', 4, NULL, NULL),
(156, 'Tubará', 4, NULL, NULL),
(157, 'Usiacuri', 4, NULL, NULL),
(158, 'Achí', 5, NULL, NULL),
(159, 'Altos del Rosario', 5, NULL, NULL),
(160, 'Arenal', 5, NULL, NULL),
(161, 'Arjona', 5, NULL, NULL),
(162, 'Arroyohondo', 5, NULL, NULL),
(163, 'Barranco de Loba', 5, NULL, NULL),
(164, 'Calamar', 5, NULL, NULL),
(165, 'Cantagallo', 5, NULL, NULL),
(166, 'Cartagena', 5, NULL, NULL),
(167, 'Cicuco', 5, NULL, NULL),
(168, 'Clemencia', 5, NULL, NULL),
(169, 'Córdoba', 5, NULL, NULL),
(170, 'El Carmen de Bolívar', 5, NULL, NULL),
(171, 'El Guamo', 5, NULL, NULL),
(172, 'El Peñon', 5, NULL, NULL),
(173, 'Hatillo de Loba', 5, NULL, NULL),
(174, 'Magangué', 5, NULL, NULL),
(175, 'Mahates', 5, NULL, NULL),
(176, 'Margarita', 5, NULL, NULL),
(177, 'María la Baja', 5, NULL, NULL),
(178, 'Mompós', 5, NULL, NULL),
(179, 'Montecristo', 5, NULL, NULL),
(180, 'Morales', 5, NULL, NULL),
(181, 'Norosí', 5, NULL, NULL),
(182, 'Pinillos', 5, NULL, NULL),
(183, 'Regidor', 5, NULL, NULL),
(184, 'Río Viejo', 5, NULL, NULL),
(185, 'San Cristobal', 5, NULL, NULL),
(186, 'San Estanislao', 5, NULL, NULL),
(187, 'San Fernando', 5, NULL, NULL),
(188, 'San Jacinto', 5, NULL, NULL),
(189, 'San Jacinto del Cauca', 5, NULL, NULL),
(190, 'San Juan de Nepomuceno', 5, NULL, NULL),
(191, 'San Martín de Loba', 5, NULL, NULL),
(192, 'San Pablo', 5, NULL, NULL),
(193, 'Santa Catalina', 5, NULL, NULL),
(194, 'Santa Rosa ', 5, NULL, NULL),
(195, 'Santa Rosa del Sur', 5, NULL, NULL),
(196, 'Simití', 5, NULL, NULL),
(197, 'Soplaviento', 5, NULL, NULL),
(198, 'Talaigua Nuevo', 5, NULL, NULL),
(199, 'Tiquisio (Puerto Rico)', 5, NULL, NULL),
(200, 'Turbaco', 5, NULL, NULL),
(201, 'Turbaná', 5, NULL, NULL),
(202, 'Villanueva', 5, NULL, NULL),
(203, 'Zambrano', 5, NULL, NULL),
(204, 'Almeida', 6, NULL, NULL),
(205, 'Aquitania', 6, NULL, NULL),
(206, 'Arcabuco', 6, NULL, NULL),
(207, 'Belén', 6, NULL, NULL),
(208, 'Berbeo', 6, NULL, NULL),
(209, 'Beteitiva', 6, NULL, NULL),
(210, 'Boavita', 6, NULL, NULL),
(211, 'Boyacá', 6, NULL, NULL),
(212, 'Briceño', 6, NULL, NULL),
(213, 'Buenavista', 6, NULL, NULL),
(214, 'Busbanza', 6, NULL, NULL),
(215, 'Caldas', 6, NULL, NULL),
(216, 'Campohermoso', 6, NULL, NULL),
(217, 'Cerinza', 6, NULL, NULL),
(218, 'Chinavita', 6, NULL, NULL),
(219, 'Chiquinquirá', 6, NULL, NULL),
(220, 'Chiscas', 6, NULL, NULL),
(221, 'Chita', 6, NULL, NULL),
(222, 'Chitaraque', 6, NULL, NULL),
(223, 'Chivatá', 6, NULL, NULL),
(224, 'Chíquiza', 6, NULL, NULL),
(225, 'Chívor', 6, NULL, NULL),
(226, 'Ciénaga', 6, NULL, NULL),
(227, 'Coper', 6, NULL, NULL),
(228, 'Corrales', 6, NULL, NULL),
(229, 'Covarachía', 6, NULL, NULL),
(230, 'Cubará', 6, NULL, NULL),
(231, 'Cucaita', 6, NULL, NULL),
(232, 'Cuitiva', 6, NULL, NULL),
(233, 'Cómbita', 6, NULL, NULL),
(234, 'Duitama', 6, NULL, NULL),
(235, 'El Cocuy', 6, NULL, NULL),
(236, 'El Espino', 6, NULL, NULL),
(237, 'Firavitoba', 6, NULL, NULL),
(238, 'Floresta', 6, NULL, NULL),
(239, 'Gachantivá', 6, NULL, NULL),
(240, 'Garagoa', 6, NULL, NULL),
(241, 'Guacamayas', 6, NULL, NULL),
(242, 'Guateque', 6, NULL, NULL),
(243, 'Guayatá', 6, NULL, NULL),
(244, 'Guicán', 6, NULL, NULL),
(245, 'Gámeza', 6, NULL, NULL),
(246, 'Izá', 6, NULL, NULL),
(247, 'Jenesano', 6, NULL, NULL),
(248, 'Jericó', 6, NULL, NULL),
(249, 'La Capilla', 6, NULL, NULL),
(250, 'La Uvita', 6, NULL, NULL),
(251, 'La Victoria', 6, NULL, NULL),
(252, 'Labranzagrande', 6, NULL, NULL),
(253, 'Macanal', 6, NULL, NULL),
(254, 'Maripí', 6, NULL, NULL),
(255, 'Miraflores', 6, NULL, NULL),
(256, 'Mongua', 6, NULL, NULL),
(257, 'Monguí', 6, NULL, NULL),
(258, 'Moniquirá', 6, NULL, NULL),
(259, 'Motavita', 6, NULL, NULL),
(260, 'Muzo', 6, NULL, NULL),
(261, 'Nobsa', 6, NULL, NULL),
(262, 'Nuevo Colón', 6, NULL, NULL),
(263, 'Oicatá', 6, NULL, NULL),
(264, 'Otanche', 6, NULL, NULL),
(265, 'Pachavita', 6, NULL, NULL),
(266, 'Paipa', 6, NULL, NULL),
(267, 'Pajarito', 6, NULL, NULL),
(268, 'Panqueba', 6, NULL, NULL),
(269, 'Pauna', 6, NULL, NULL),
(270, 'Paya', 6, NULL, NULL),
(271, 'Paz de Río', 6, NULL, NULL),
(272, 'Pesca', 6, NULL, NULL),
(273, 'Pisva', 6, NULL, NULL),
(274, 'Puerto Boyacá', 6, NULL, NULL),
(275, 'Páez', 6, NULL, NULL),
(276, 'Quipama', 6, NULL, NULL),
(277, 'Ramiriquí', 6, NULL, NULL),
(278, 'Rondón', 6, NULL, NULL),
(279, 'Ráquira', 6, NULL, NULL),
(280, 'Saboyá', 6, NULL, NULL),
(281, 'Samacá', 6, NULL, NULL),
(282, 'San Eduardo', 6, NULL, NULL),
(283, 'San José de Pare', 6, NULL, NULL),
(284, 'San Luís de Gaceno', 6, NULL, NULL),
(285, 'San Mateo', 6, NULL, NULL),
(286, 'San Miguel de Sema', 6, NULL, NULL),
(287, 'San Pablo de Borbur', 6, NULL, NULL),
(288, 'Santa María', 6, NULL, NULL),
(289, 'Santa Rosa de Viterbo', 6, NULL, NULL),
(290, 'Santa Sofía', 6, NULL, NULL),
(291, 'Santana', 6, NULL, NULL),
(292, 'Sativanorte', 6, NULL, NULL),
(293, 'Sativasur', 6, NULL, NULL),
(294, 'Siachoque', 6, NULL, NULL),
(295, 'Soatá', 6, NULL, NULL),
(296, 'Socha', 6, NULL, NULL),
(297, 'Socotá', 6, NULL, NULL),
(298, 'Sogamoso', 6, NULL, NULL),
(299, 'Somondoco', 6, NULL, NULL),
(300, 'Sora', 6, NULL, NULL),
(301, 'Soracá', 6, NULL, NULL),
(302, 'Sotaquirá', 6, NULL, NULL),
(303, 'Susacón', 6, NULL, NULL),
(304, 'Sutamarchán', 6, NULL, NULL),
(305, 'Sutatenza', 6, NULL, NULL),
(306, 'Sáchica', 6, NULL, NULL),
(307, 'Tasco', 6, NULL, NULL),
(308, 'Tenza', 6, NULL, NULL),
(309, 'Tibaná', 6, NULL, NULL),
(310, 'Tibasosa', 6, NULL, NULL),
(311, 'Tinjacá', 6, NULL, NULL),
(312, 'Tipacoque', 6, NULL, NULL),
(313, 'Toca', 6, NULL, NULL),
(314, 'Toguí', 6, NULL, NULL),
(315, 'Topagá', 6, NULL, NULL),
(316, 'Tota', 6, NULL, NULL),
(317, 'Tunja', 6, NULL, NULL),
(318, 'Tunungua', 6, NULL, NULL),
(319, 'Turmequé', 6, NULL, NULL),
(320, 'Tuta', 6, NULL, NULL),
(321, 'Tutasá', 6, NULL, NULL),
(322, 'Ventaquemada', 6, NULL, NULL),
(323, 'Villa de Leiva', 6, NULL, NULL),
(324, 'Viracachá', 6, NULL, NULL),
(325, 'Zetaquirá', 6, NULL, NULL),
(326, 'Úmbita', 6, NULL, NULL),
(327, 'Aguadas', 7, NULL, NULL),
(328, 'Anserma', 7, NULL, NULL),
(329, 'Aranzazu', 7, NULL, NULL),
(330, 'Belalcázar', 7, NULL, NULL),
(331, 'Chinchiná', 7, NULL, NULL),
(332, 'Filadelfia', 7, NULL, NULL),
(333, 'La Dorada', 7, NULL, NULL),
(334, 'La Merced', 7, NULL, NULL),
(335, 'La Victoria', 7, NULL, NULL),
(336, 'Manizales', 7, NULL, NULL),
(337, 'Manzanares', 7, NULL, NULL),
(338, 'Marmato', 7, NULL, NULL),
(339, 'Marquetalia', 7, NULL, NULL),
(340, 'Marulanda', 7, NULL, NULL),
(341, 'Neira', 7, NULL, NULL),
(342, 'Norcasia', 7, NULL, NULL),
(343, 'Palestina', 7, NULL, NULL),
(344, 'Pensilvania', 7, NULL, NULL),
(345, 'Pácora', 7, NULL, NULL),
(346, 'Risaralda', 7, NULL, NULL),
(347, 'Río Sucio', 7, NULL, NULL),
(348, 'Salamina', 7, NULL, NULL),
(349, 'Samaná', 7, NULL, NULL),
(350, 'San José', 7, NULL, NULL),
(351, 'Supía', 7, NULL, NULL),
(352, 'Villamaría', 7, NULL, NULL),
(353, 'Viterbo', 7, NULL, NULL),
(354, 'Albania', 8, NULL, NULL),
(355, 'Belén de los Andaquíes', 8, NULL, NULL),
(356, 'Cartagena del Chairá', 8, NULL, NULL),
(357, 'Curillo', 8, NULL, NULL),
(358, 'El Doncello', 8, NULL, NULL),
(359, 'El Paujil', 8, NULL, NULL),
(360, 'Florencia', 8, NULL, NULL),
(361, 'La Montañita', 8, NULL, NULL),
(362, 'Milán', 8, NULL, NULL),
(363, 'Morelia', 8, NULL, NULL),
(364, 'Puerto Rico', 8, NULL, NULL),
(365, 'San José del Fragua', 8, NULL, NULL),
(366, 'San Vicente del Caguán', 8, NULL, NULL),
(367, 'Solano', 8, NULL, NULL),
(368, 'Solita', 8, NULL, NULL),
(369, 'Valparaiso', 8, NULL, NULL),
(370, 'Aguazul', 9, NULL, NULL),
(371, 'Chámeza', 9, NULL, NULL),
(372, 'Hato Corozal', 9, NULL, NULL),
(373, 'La Salina', 9, NULL, NULL),
(374, 'Maní', 9, NULL, NULL),
(375, 'Monterrey', 9, NULL, NULL),
(376, 'Nunchía', 9, NULL, NULL),
(377, 'Orocué', 9, NULL, NULL),
(378, 'Paz de Ariporo', 9, NULL, NULL),
(379, 'Pore', 9, NULL, NULL),
(380, 'Recetor', 9, NULL, NULL),
(381, 'Sabanalarga', 9, NULL, NULL),
(382, 'San Luís de Palenque', 9, NULL, NULL),
(383, 'Sácama', 9, NULL, NULL),
(384, 'Tauramena', 9, NULL, NULL),
(385, 'Trinidad', 9, NULL, NULL),
(386, 'Támara', 9, NULL, NULL),
(387, 'Villanueva', 9, NULL, NULL),
(388, 'Yopal', 9, NULL, NULL),
(389, 'Almaguer', 10, NULL, NULL),
(390, 'Argelia', 10, NULL, NULL),
(391, 'Balboa', 10, NULL, NULL),
(392, 'Bolívar', 10, NULL, NULL),
(393, 'Buenos Aires', 10, NULL, NULL),
(394, 'Cajibío', 10, NULL, NULL),
(395, 'Caldono', 10, NULL, NULL),
(396, 'Caloto', 10, NULL, NULL),
(397, 'Corinto', 10, NULL, NULL),
(398, 'El Tambo', 10, NULL, NULL),
(399, 'Florencia', 10, NULL, NULL),
(400, 'Guachené', 10, NULL, NULL),
(401, 'Guapí', 10, NULL, NULL),
(402, 'Inzá', 10, NULL, NULL),
(403, 'Jambaló', 10, NULL, NULL),
(404, 'La Sierra', 10, NULL, NULL),
(405, 'La Vega', 10, NULL, NULL),
(406, 'López (Micay)', 10, NULL, NULL),
(407, 'Mercaderes', 10, NULL, NULL),
(408, 'Miranda', 10, NULL, NULL),
(409, 'Morales', 10, NULL, NULL),
(410, 'Padilla', 10, NULL, NULL),
(411, 'Patía (El Bordo)', 10, NULL, NULL),
(412, 'Piamonte', 10, NULL, NULL),
(413, 'Piendamó', 10, NULL, NULL),
(414, 'Popayán', 10, NULL, NULL),
(415, 'Puerto Tejada', 10, NULL, NULL),
(416, 'Puracé (Coconuco)', 10, NULL, NULL),
(417, 'Páez (Belalcazar)', 10, NULL, NULL),
(418, 'Rosas', 10, NULL, NULL),
(419, 'San Sebastián', 10, NULL, NULL),
(420, 'Santa Rosa', 10, NULL, NULL),
(421, 'Santander de Quilichao', 10, NULL, NULL),
(422, 'Silvia', 10, NULL, NULL),
(423, 'Sotara (Paispamba)', 10, NULL, NULL),
(424, 'Sucre', 10, NULL, NULL),
(425, 'Suárez', 10, NULL, NULL),
(426, 'Timbiquí', 10, NULL, NULL),
(427, 'Timbío', 10, NULL, NULL),
(428, 'Toribío', 10, NULL, NULL),
(429, 'Totoró', 10, NULL, NULL),
(430, 'Villa Rica', 10, NULL, NULL),
(431, 'Aguachica', 11, NULL, NULL),
(432, 'Agustín Codazzi', 11, NULL, NULL),
(433, 'Astrea', 11, NULL, NULL),
(434, 'Becerríl', 11, NULL, NULL),
(435, 'Bosconia', 11, NULL, NULL),
(436, 'Chimichagua', 11, NULL, NULL),
(437, 'Chiriguaná', 11, NULL, NULL),
(438, 'Curumaní', 11, NULL, NULL),
(439, 'El Copey', 11, NULL, NULL),
(440, 'El Paso', 11, NULL, NULL),
(441, 'Gamarra', 11, NULL, NULL),
(442, 'Gonzalez', 11, NULL, NULL),
(443, 'La Gloria', 11, NULL, NULL),
(444, 'La Jagua de Ibirico', 11, NULL, NULL),
(445, 'La Paz (Robles)', 11, NULL, NULL),
(446, 'Manaure Balcón del Cesar', 11, NULL, NULL),
(447, 'Pailitas', 11, NULL, NULL),
(448, 'Pelaya', 11, NULL, NULL),
(449, 'Pueblo Bello', 11, NULL, NULL),
(450, 'Río de oro', 11, NULL, NULL),
(451, 'San Alberto', 11, NULL, NULL),
(452, 'San Diego', 11, NULL, NULL),
(453, 'San Martín', 11, NULL, NULL),
(454, 'Tamalameque', 11, NULL, NULL),
(455, 'Valledupar', 11, NULL, NULL),
(456, 'Acandí', 12, NULL, NULL),
(457, 'Alto Baudó (Pie de Pato)', 12, NULL, NULL),
(458, 'Atrato (Yuto)', 12, NULL, NULL),
(459, 'Bagadó', 12, NULL, NULL),
(460, 'Bahía Solano (Mútis)', 12, NULL, NULL),
(461, 'Bajo Baudó (Pizarro)', 12, NULL, NULL),
(462, 'Belén de Bajirá', 12, NULL, NULL),
(463, 'Bojayá (Bellavista)', 12, NULL, NULL),
(464, 'Cantón de San Pablo', 12, NULL, NULL),
(465, 'Carmen del Darién (CURBARADÓ)', 12, NULL, NULL),
(466, 'Condoto', 12, NULL, NULL),
(467, 'Cértegui', 12, NULL, NULL),
(468, 'El Carmen de Atrato', 12, NULL, NULL),
(469, 'Istmina', 12, NULL, NULL),
(470, 'Juradó', 12, NULL, NULL),
(471, 'Lloró', 12, NULL, NULL),
(472, 'Medio Atrato', 12, NULL, NULL),
(473, 'Medio Baudó', 12, NULL, NULL),
(474, 'Medio San Juan (ANDAGOYA)', 12, NULL, NULL),
(475, 'Novita', 12, NULL, NULL),
(476, 'Nuquí', 12, NULL, NULL),
(477, 'Quibdó', 12, NULL, NULL),
(478, 'Río Iró', 12, NULL, NULL),
(479, 'Río Quito', 12, NULL, NULL),
(480, 'Ríosucio', 12, NULL, NULL),
(481, 'San José del Palmar', 12, NULL, NULL),
(482, 'Santa Genoveva de Docorodó', 12, NULL, NULL),
(483, 'Sipí', 12, NULL, NULL),
(484, 'Tadó', 12, NULL, NULL),
(485, 'Unguía', 12, NULL, NULL),
(486, 'Unión Panamericana (ÁNIMAS)', 12, NULL, NULL),
(487, 'Ayapel', 13, NULL, NULL),
(488, 'Buenavista', 13, NULL, NULL),
(489, 'Canalete', 13, NULL, NULL),
(490, 'Cereté', 13, NULL, NULL),
(491, 'Chimá', 13, NULL, NULL),
(492, 'Chinú', 13, NULL, NULL),
(493, 'Ciénaga de Oro', 13, NULL, NULL),
(494, 'Cotorra', 13, NULL, NULL),
(495, 'La Apartada y La Frontera', 13, NULL, NULL),
(496, 'Lorica', 13, NULL, NULL),
(497, 'Los Córdobas', 13, NULL, NULL),
(498, 'Momil', 13, NULL, NULL),
(499, 'Montelíbano', 13, NULL, NULL),
(500, 'Monteria', 13, NULL, NULL),
(501, 'Moñitos', 13, NULL, NULL),
(502, 'Planeta Rica', 13, NULL, NULL),
(503, 'Pueblo Nuevo', 13, NULL, NULL),
(504, 'Puerto Escondido', 13, NULL, NULL),
(505, 'Puerto Libertador', 13, NULL, NULL),
(506, 'Purísima', 13, NULL, NULL),
(507, 'Sahagún', 13, NULL, NULL),
(508, 'San Andrés Sotavento', 13, NULL, NULL),
(509, 'San Antero', 13, NULL, NULL),
(510, 'San Bernardo del Viento', 13, NULL, NULL),
(511, 'San Carlos', 13, NULL, NULL),
(512, 'San José de Uré', 13, NULL, NULL),
(513, 'San Pelayo', 13, NULL, NULL),
(514, 'Tierralta', 13, NULL, NULL),
(515, 'Tuchín', 13, NULL, NULL),
(516, 'Valencia', 13, NULL, NULL),
(517, 'Agua de Dios', 14, NULL, NULL),
(518, 'Albán', 14, NULL, NULL),
(519, 'Anapoima', 14, NULL, NULL),
(520, 'Anolaima', 14, NULL, NULL),
(521, 'Apulo', 14, NULL, NULL),
(522, 'Arbeláez', 14, NULL, NULL),
(523, 'Beltrán', 14, NULL, NULL),
(524, 'Bituima', 14, NULL, NULL),
(525, 'Bogotá D.C.', 14, NULL, NULL),
(526, 'Bojacá', 14, NULL, NULL),
(527, 'Cabrera', 14, NULL, NULL),
(528, 'Cachipay', 14, NULL, NULL),
(529, 'Cajicá', 14, NULL, NULL),
(530, 'Caparrapí', 14, NULL, NULL),
(531, 'Carmen de Carupa', 14, NULL, NULL),
(532, 'Chaguaní', 14, NULL, NULL),
(533, 'Chipaque', 14, NULL, NULL),
(534, 'Choachí', 14, NULL, NULL),
(535, 'Chocontá', 14, NULL, NULL),
(536, 'Chía', 14, NULL, NULL),
(537, 'Cogua', 14, NULL, NULL),
(538, 'Cota', 14, NULL, NULL),
(539, 'Cucunubá', 14, NULL, NULL),
(540, 'Cáqueza', 14, NULL, NULL),
(541, 'El Colegio', 14, NULL, NULL),
(542, 'El Peñón', 14, NULL, NULL),
(543, 'El Rosal', 14, NULL, NULL),
(544, 'Facatativá', 14, NULL, NULL),
(545, 'Fosca', 14, NULL, NULL),
(546, 'Funza', 14, NULL, NULL),
(547, 'Fusagasugá', 14, NULL, NULL),
(548, 'Fómeque', 14, NULL, NULL),
(549, 'Fúquene', 14, NULL, NULL),
(550, 'Gachalá', 14, NULL, NULL),
(551, 'Gachancipá', 14, NULL, NULL),
(552, 'Gachetá', 14, NULL, NULL),
(553, 'Gama', 14, NULL, NULL),
(554, 'Girardot', 14, NULL, NULL),
(555, 'Granada', 14, NULL, NULL),
(556, 'Guachetá', 14, NULL, NULL),
(557, 'Guaduas', 14, NULL, NULL),
(558, 'Guasca', 14, NULL, NULL),
(559, 'Guataquí', 14, NULL, NULL),
(560, 'Guatavita', 14, NULL, NULL),
(561, 'Guayabal de Siquima', 14, NULL, NULL),
(562, 'Guayabetal', 14, NULL, NULL),
(563, 'Gutiérrez', 14, NULL, NULL),
(564, 'Jerusalén', 14, NULL, NULL),
(565, 'Junín', 14, NULL, NULL),
(566, 'La Calera', 14, NULL, NULL),
(567, 'La Mesa', 14, NULL, NULL),
(568, 'La Palma', 14, NULL, NULL),
(569, 'La Peña', 14, NULL, NULL),
(570, 'La Vega', 14, NULL, NULL),
(571, 'Lenguazaque', 14, NULL, NULL),
(572, 'Machetá', 14, NULL, NULL),
(573, 'Madrid', 14, NULL, NULL),
(574, 'Manta', 14, NULL, NULL),
(575, 'Medina', 14, NULL, NULL),
(576, 'Mosquera', 14, NULL, NULL),
(577, 'Nariño', 14, NULL, NULL),
(578, 'Nemocón', 14, NULL, NULL),
(579, 'Nilo', 14, NULL, NULL),
(580, 'Nimaima', 14, NULL, NULL),
(581, 'Nocaima', 14, NULL, NULL),
(582, 'Pacho', 14, NULL, NULL),
(583, 'Paime', 14, NULL, NULL),
(584, 'Pandi', 14, NULL, NULL),
(585, 'Paratebueno', 14, NULL, NULL),
(586, 'Pasca', 14, NULL, NULL),
(587, 'Puerto Salgar', 14, NULL, NULL),
(588, 'Pulí', 14, NULL, NULL),
(589, 'Quebradanegra', 14, NULL, NULL),
(590, 'Quetame', 14, NULL, NULL),
(591, 'Quipile', 14, NULL, NULL),
(592, 'Ricaurte', 14, NULL, NULL),
(593, 'San Antonio de Tequendama', 14, NULL, NULL),
(594, 'San Bernardo', 14, NULL, NULL),
(595, 'San Cayetano', 14, NULL, NULL),
(596, 'San Francisco', 14, NULL, NULL),
(597, 'San Juan de Río Seco', 14, NULL, NULL),
(598, 'Sasaima', 14, NULL, NULL),
(599, 'Sesquilé', 14, NULL, NULL),
(600, 'Sibaté', 14, NULL, NULL),
(601, 'Silvania', 14, NULL, NULL),
(602, 'Simijaca', 14, NULL, NULL),
(603, 'Soacha', 14, NULL, NULL),
(604, 'Sopó', 14, NULL, NULL),
(605, 'Subachoque', 14, NULL, NULL),
(606, 'Suesca', 14, NULL, NULL),
(607, 'Supatá', 14, NULL, NULL),
(608, 'Susa', 14, NULL, NULL),
(609, 'Sutatausa', 14, NULL, NULL),
(610, 'Tabio', 14, NULL, NULL),
(611, 'Tausa', 14, NULL, NULL),
(612, 'Tena', 14, NULL, NULL),
(613, 'Tenjo', 14, NULL, NULL),
(614, 'Tibacuy', 14, NULL, NULL),
(615, 'Tibirita', 14, NULL, NULL),
(616, 'Tocaima', 14, NULL, NULL),
(617, 'Tocancipá', 14, NULL, NULL),
(618, 'Topaipí', 14, NULL, NULL),
(619, 'Ubalá', 14, NULL, NULL),
(620, 'Ubaque', 14, NULL, NULL),
(621, 'Ubaté', 14, NULL, NULL),
(622, 'Une', 14, NULL, NULL),
(623, 'Venecia (Ospina Pérez)', 14, NULL, NULL),
(624, 'Vergara', 14, NULL, NULL),
(625, 'Viani', 14, NULL, NULL),
(626, 'Villagómez', 14, NULL, NULL),
(627, 'Villapinzón', 14, NULL, NULL),
(628, 'Villeta', 14, NULL, NULL),
(629, 'Viotá', 14, NULL, NULL),
(630, 'Yacopí', 14, NULL, NULL),
(631, 'Zipacón', 14, NULL, NULL),
(632, 'Zipaquirá', 14, NULL, NULL),
(633, 'Útica', 14, NULL, NULL),
(634, 'Inírida', 15, NULL, NULL),
(635, 'Calamar', 16, NULL, NULL),
(636, 'El Retorno', 16, NULL, NULL),
(637, 'Miraflores', 16, NULL, NULL),
(638, 'San José del Guaviare', 16, NULL, NULL),
(639, 'Acevedo', 17, NULL, NULL),
(640, 'Agrado', 17, NULL, NULL),
(641, 'Aipe', 17, NULL, NULL),
(642, 'Algeciras', 17, NULL, NULL),
(643, 'Altamira', 17, NULL, NULL),
(644, 'Baraya', 17, NULL, NULL),
(645, 'Campoalegre', 17, NULL, NULL),
(646, 'Colombia', 17, NULL, NULL),
(647, 'Elías', 17, NULL, NULL),
(648, 'Garzón', 17, NULL, NULL),
(649, 'Gigante', 17, NULL, NULL),
(650, 'Guadalupe', 17, NULL, NULL),
(651, 'Hobo', 17, NULL, NULL),
(652, 'Isnos', 17, NULL, NULL),
(653, 'La Argentina', 17, NULL, NULL),
(654, 'La Plata', 17, NULL, NULL),
(655, 'Neiva', 17, NULL, NULL),
(656, 'Nátaga', 17, NULL, NULL),
(657, 'Oporapa', 17, NULL, NULL),
(658, 'Paicol', 17, NULL, NULL),
(659, 'Palermo', 17, NULL, NULL),
(660, 'Palestina', 17, NULL, NULL),
(661, 'Pital', 17, NULL, NULL),
(662, 'Pitalito', 17, NULL, NULL),
(663, 'Rivera', 17, NULL, NULL),
(664, 'Saladoblanco', 17, NULL, NULL),
(665, 'San Agustín', 17, NULL, NULL),
(666, 'Santa María', 17, NULL, NULL),
(667, 'Suaza', 17, NULL, NULL),
(668, 'Tarqui', 17, NULL, NULL),
(669, 'Tello', 17, NULL, NULL),
(670, 'Teruel', 17, NULL, NULL),
(671, 'Tesalia', 17, NULL, NULL),
(672, 'Timaná', 17, NULL, NULL),
(673, 'Villavieja', 17, NULL, NULL),
(674, 'Yaguará', 17, NULL, NULL),
(675, 'Íquira', 17, NULL, NULL),
(676, 'Albania', 18, NULL, NULL),
(677, 'Barrancas', 18, NULL, NULL),
(678, 'Dibulla', 18, NULL, NULL),
(679, 'Distracción', 18, NULL, NULL),
(680, 'El Molino', 18, NULL, NULL),
(681, 'Fonseca', 18, NULL, NULL),
(682, 'Hatonuevo', 18, NULL, NULL),
(683, 'La Jagua del Pilar', 18, NULL, NULL),
(684, 'Maicao', 18, NULL, NULL),
(685, 'Manaure', 18, NULL, NULL),
(686, 'Riohacha', 18, NULL, NULL),
(687, 'San Juan del Cesar', 18, NULL, NULL),
(688, 'Uribia', 18, NULL, NULL),
(689, 'Urumita', 18, NULL, NULL),
(690, 'Villanueva', 18, NULL, NULL),
(691, 'Algarrobo', 19, NULL, NULL),
(692, 'Aracataca', 19, NULL, NULL),
(693, 'Ariguaní (El Difícil)', 19, NULL, NULL),
(694, 'Cerro San Antonio', 19, NULL, NULL),
(695, 'Chivolo', 19, NULL, NULL),
(696, 'Ciénaga', 19, NULL, NULL),
(697, 'Concordia', 19, NULL, NULL),
(698, 'El Banco', 19, NULL, NULL),
(699, 'El Piñon', 19, NULL, NULL),
(700, 'El Retén', 19, NULL, NULL),
(701, 'Fundación', 19, NULL, NULL),
(702, 'Guamal', 19, NULL, NULL),
(703, 'Nueva Granada', 19, NULL, NULL),
(704, 'Pedraza', 19, NULL, NULL),
(705, 'Pijiño', 19, NULL, NULL),
(706, 'Pivijay', 19, NULL, NULL),
(707, 'Plato', 19, NULL, NULL),
(708, 'Puebloviejo', 19, NULL, NULL),
(709, 'Remolino', 19, NULL, NULL),
(710, 'Sabanas de San Angel (SAN ANGEL)', 19, NULL, NULL),
(711, 'Salamina', 19, NULL, NULL),
(712, 'San Sebastián de Buenavista', 19, NULL, NULL),
(713, 'San Zenón', 19, NULL, NULL),
(714, 'Santa Ana', 19, NULL, NULL),
(715, 'Santa Bárbara de Pinto', 19, NULL, NULL),
(716, 'Santa Marta', 19, NULL, NULL),
(717, 'Sitionuevo', 19, NULL, NULL),
(718, 'Tenerife', 19, NULL, NULL),
(719, 'Zapayán (PUNTA DE PIEDRAS)', 19, NULL, NULL),
(720, 'Zona Bananera (PRADO - SEVILLA)', 19, NULL, NULL),
(721, 'Acacías', 20, NULL, NULL),
(722, 'Barranca de Upía', 20, NULL, NULL),
(723, 'Cabuyaro', 20, NULL, NULL),
(724, 'Castilla la Nueva', 20, NULL, NULL),
(725, 'Cubarral', 20, NULL, NULL),
(726, 'Cumaral', 20, NULL, NULL),
(727, 'El Calvario', 20, NULL, NULL),
(728, 'El Castillo', 20, NULL, NULL),
(729, 'El Dorado', 20, NULL, NULL),
(730, 'Fuente de Oro', 20, NULL, NULL),
(731, 'Granada', 20, NULL, NULL),
(732, 'Guamal', 20, NULL, NULL),
(733, 'La Macarena', 20, NULL, NULL),
(734, 'Lejanías', 20, NULL, NULL),
(735, 'Mapiripan', 20, NULL, NULL),
(736, 'Mesetas', 20, NULL, NULL),
(737, 'Puerto Concordia', 20, NULL, NULL),
(738, 'Puerto Gaitán', 20, NULL, NULL),
(739, 'Puerto Lleras', 20, NULL, NULL),
(740, 'Puerto López', 20, NULL, NULL),
(741, 'Puerto Rico', 20, NULL, NULL),
(742, 'Restrepo', 20, NULL, NULL),
(743, 'San Carlos de Guaroa', 20, NULL, NULL),
(744, 'San Juan de Arama', 20, NULL, NULL),
(745, 'San Juanito', 20, NULL, NULL),
(746, 'San Martín', 20, NULL, NULL),
(747, 'Uribe', 20, NULL, NULL),
(748, 'Villavicencio', 20, NULL, NULL),
(749, 'Vista Hermosa', 20, NULL, NULL),
(750, 'Albán (San José)', 21, NULL, NULL),
(751, 'Aldana', 21, NULL, NULL),
(752, 'Ancuya', 21, NULL, NULL),
(753, 'Arboleda (Berruecos)', 21, NULL, NULL),
(754, 'Barbacoas', 21, NULL, NULL),
(755, 'Belén', 21, NULL, NULL),
(756, 'Buesaco', 21, NULL, NULL),
(757, 'Chachaguí', 21, NULL, NULL),
(758, 'Colón (Génova)', 21, NULL, NULL),
(759, 'Consaca', 21, NULL, NULL),
(760, 'Contadero', 21, NULL, NULL),
(761, 'Cuaspud (Carlosama)', 21, NULL, NULL),
(762, 'Cumbal', 21, NULL, NULL),
(763, 'Cumbitara', 21, NULL, NULL),
(764, 'Córdoba', 21, NULL, NULL),
(765, 'El Charco', 21, NULL, NULL),
(766, 'El Peñol', 21, NULL, NULL),
(767, 'El Rosario', 21, NULL, NULL),
(768, 'El Tablón de Gómez', 21, NULL, NULL),
(769, 'El Tambo', 21, NULL, NULL),
(770, 'Francisco Pizarro', 21, NULL, NULL),
(771, 'Funes', 21, NULL, NULL),
(772, 'Guachavés', 21, NULL, NULL),
(773, 'Guachucal', 21, NULL, NULL),
(774, 'Guaitarilla', 21, NULL, NULL),
(775, 'Gualmatán', 21, NULL, NULL),
(776, 'Iles', 21, NULL, NULL),
(777, 'Imúes', 21, NULL, NULL),
(778, 'Ipiales', 21, NULL, NULL),
(779, 'La Cruz', 21, NULL, NULL),
(780, 'La Florida', 21, NULL, NULL),
(781, 'La Llanada', 21, NULL, NULL),
(782, 'La Tola', 21, NULL, NULL),
(783, 'La Unión', 21, NULL, NULL),
(784, 'Leiva', 21, NULL, NULL),
(785, 'Linares', 21, NULL, NULL),
(786, 'Magüi (Payán)', 21, NULL, NULL),
(787, 'Mallama (Piedrancha)', 21, NULL, NULL),
(788, 'Mosquera', 21, NULL, NULL),
(789, 'Nariño', 21, NULL, NULL),
(790, 'Olaya Herrera', 21, NULL, NULL),
(791, 'Ospina', 21, NULL, NULL),
(792, 'Policarpa', 21, NULL, NULL),
(793, 'Potosí', 21, NULL, NULL),
(794, 'Providencia', 21, NULL, NULL),
(795, 'Puerres', 21, NULL, NULL),
(796, 'Pupiales', 21, NULL, NULL),
(797, 'Ricaurte', 21, NULL, NULL),
(798, 'Roberto Payán (San José)', 21, NULL, NULL),
(799, 'Samaniego', 21, NULL, NULL),
(800, 'San Bernardo', 21, NULL, NULL),
(801, 'San Juan de Pasto', 21, NULL, NULL),
(802, 'San Lorenzo', 21, NULL, NULL),
(803, 'San Pablo', 21, NULL, NULL),
(804, 'San Pedro de Cartago', 21, NULL, NULL),
(805, 'Sandoná', 21, NULL, NULL),
(806, 'Santa Bárbara (Iscuandé)', 21, NULL, NULL),
(807, 'Sapuyes', 21, NULL, NULL),
(808, 'Sotomayor (Los Andes)', 21, NULL, NULL),
(809, 'Taminango', 21, NULL, NULL),
(810, 'Tangua', 21, NULL, NULL),
(811, 'Tumaco', 21, NULL, NULL),
(812, 'Túquerres', 21, NULL, NULL),
(813, 'Yacuanquer', 21, NULL, NULL),
(814, 'Arboledas', 22, NULL, NULL),
(815, 'Bochalema', 22, NULL, NULL),
(816, 'Bucarasica', 22, NULL, NULL),
(817, 'Chinácota', 22, NULL, NULL),
(818, 'Chitagá', 22, NULL, NULL),
(819, 'Convención', 22, NULL, NULL),
(820, 'Cucutilla', 22, NULL, NULL),
(821, 'Cáchira', 22, NULL, NULL),
(822, 'Cácota', 22, NULL, NULL),
(823, 'Cúcuta', 22, NULL, NULL),
(824, 'Durania', 22, NULL, NULL),
(825, 'El Carmen', 22, NULL, NULL),
(826, 'El Tarra', 22, NULL, NULL),
(827, 'El Zulia', 22, NULL, NULL),
(828, 'Gramalote', 22, NULL, NULL),
(829, 'Hacarí', 22, NULL, NULL),
(830, 'Herrán', 22, NULL, NULL),
(831, 'La Esperanza', 22, NULL, NULL),
(832, 'La Playa', 22, NULL, NULL),
(833, 'Labateca', 22, NULL, NULL),
(834, 'Los Patios', 22, NULL, NULL),
(835, 'Lourdes', 22, NULL, NULL),
(836, 'Mutiscua', 22, NULL, NULL),
(837, 'Ocaña', 22, NULL, NULL),
(838, 'Pamplona', 22, NULL, NULL),
(839, 'Pamplonita', 22, NULL, NULL),
(840, 'Puerto Santander', 22, NULL, NULL),
(841, 'Ragonvalia', 22, NULL, NULL),
(842, 'Salazar', 22, NULL, NULL),
(843, 'San Calixto', 22, NULL, NULL),
(844, 'San Cayetano', 22, NULL, NULL),
(845, 'Santiago', 22, NULL, NULL),
(846, 'Sardinata', 22, NULL, NULL),
(847, 'Silos', 22, NULL, NULL),
(848, 'Teorama', 22, NULL, NULL),
(849, 'Tibú', 22, NULL, NULL),
(850, 'Toledo', 22, NULL, NULL),
(851, 'Villa Caro', 22, NULL, NULL),
(852, 'Villa del Rosario', 22, NULL, NULL),
(853, 'Ábrego', 22, NULL, NULL),
(854, 'Colón', 23, NULL, NULL),
(855, 'Mocoa', 23, NULL, NULL),
(856, 'Orito', 23, NULL, NULL),
(857, 'Puerto Asís', 23, NULL, NULL),
(858, 'Puerto Caicedo', 23, NULL, NULL),
(859, 'Puerto Guzmán', 23, NULL, NULL),
(860, 'Puerto Leguízamo', 23, NULL, NULL),
(861, 'San Francisco', 23, NULL, NULL),
(862, 'San Miguel', 23, NULL, NULL),
(863, 'Santiago', 23, NULL, NULL),
(864, 'Sibundoy', 23, NULL, NULL),
(865, 'Valle del Guamuez', 23, NULL, NULL),
(866, 'Villagarzón', 23, NULL, NULL),
(867, 'Armenia', 24, NULL, NULL),
(868, 'Buenavista', 24, NULL, NULL),
(869, 'Calarcá', 24, NULL, NULL),
(870, 'Circasia', 24, NULL, NULL),
(871, 'Cordobá', 24, NULL, NULL),
(872, 'Filandia', 24, NULL, NULL),
(873, 'Génova', 24, NULL, NULL),
(874, 'La Tebaida', 24, NULL, NULL),
(875, 'Montenegro', 24, NULL, NULL),
(876, 'Pijao', 24, NULL, NULL),
(877, 'Quimbaya', 24, NULL, NULL),
(878, 'Salento', 24, NULL, NULL),
(879, 'Apía', 25, NULL, NULL),
(880, 'Balboa', 25, NULL, NULL),
(881, 'Belén de Umbría', 25, NULL, NULL),
(882, 'Dos Quebradas', 25, NULL, NULL),
(883, 'Guática', 25, NULL, NULL),
(884, 'La Celia', 25, NULL, NULL),
(885, 'La Virginia', 25, NULL, NULL),
(886, 'Marsella', 25, NULL, NULL),
(887, 'Mistrató', 25, NULL, NULL),
(888, 'Pereira', 25, NULL, NULL),
(889, 'Pueblo Rico', 25, NULL, NULL),
(890, 'Quinchía', 25, NULL, NULL),
(891, 'Santa Rosa de Cabal', 25, NULL, NULL),
(892, 'Santuario', 25, NULL, NULL),
(893, 'Providencia', 26, NULL, NULL),
(894, 'Aguada', 27, NULL, NULL),
(895, 'Albania', 27, NULL, NULL),
(896, 'Aratoca', 27, NULL, NULL),
(897, 'Barbosa', 27, NULL, NULL),
(898, 'Barichara', 27, NULL, NULL),
(899, 'Barrancabermeja', 27, NULL, NULL),
(900, 'Betulia', 27, NULL, NULL),
(901, 'Bolívar', 27, NULL, NULL),
(902, 'Bucaramanga', 27, NULL, NULL),
(903, 'Cabrera', 27, NULL, NULL),
(904, 'California', 27, NULL, NULL),
(905, 'Capitanejo', 27, NULL, NULL),
(906, 'Carcasí', 27, NULL, NULL),
(907, 'Cepita', 27, NULL, NULL),
(908, 'Cerrito', 27, NULL, NULL),
(909, 'Charalá', 27, NULL, NULL),
(910, 'Charta', 27, NULL, NULL),
(911, 'Chima', 27, NULL, NULL),
(912, 'Chipatá', 27, NULL, NULL),
(913, 'Cimitarra', 27, NULL, NULL),
(914, 'Concepción', 27, NULL, NULL),
(915, 'Confines', 27, NULL, NULL),
(916, 'Contratación', 27, NULL, NULL),
(917, 'Coromoro', 27, NULL, NULL),
(918, 'Curití', 27, NULL, NULL),
(919, 'El Carmen', 27, NULL, NULL),
(920, 'El Guacamayo', 27, NULL, NULL),
(921, 'El Peñon', 27, NULL, NULL),
(922, 'El Playón', 27, NULL, NULL),
(923, 'Encino', 27, NULL, NULL),
(924, 'Enciso', 27, NULL, NULL),
(925, 'Floridablanca', 27, NULL, NULL),
(926, 'Florián', 27, NULL, NULL),
(927, 'Galán', 27, NULL, NULL),
(928, 'Girón', 27, NULL, NULL),
(929, 'Guaca', 27, NULL, NULL),
(930, 'Guadalupe', 27, NULL, NULL),
(931, 'Guapota', 27, NULL, NULL),
(932, 'Guavatá', 27, NULL, NULL),
(933, 'Guepsa', 27, NULL, NULL),
(934, 'Gámbita', 27, NULL, NULL),
(935, 'Hato', 27, NULL, NULL),
(936, 'Jesús María', 27, NULL, NULL),
(937, 'Jordán', 27, NULL, NULL),
(938, 'La Belleza', 27, NULL, NULL),
(939, 'La Paz', 27, NULL, NULL),
(940, 'Landázuri', 27, NULL, NULL),
(941, 'Lebrija', 27, NULL, NULL),
(942, 'Los Santos', 27, NULL, NULL),
(943, 'Macaravita', 27, NULL, NULL),
(944, 'Matanza', 27, NULL, NULL),
(945, 'Mogotes', 27, NULL, NULL),
(946, 'Molagavita', 27, NULL, NULL),
(947, 'Málaga', 27, NULL, NULL),
(948, 'Ocamonte', 27, NULL, NULL),
(949, 'Oiba', 27, NULL, NULL),
(950, 'Onzaga', 27, NULL, NULL),
(951, 'Palmar', 27, NULL, NULL),
(952, 'Palmas del Socorro', 27, NULL, NULL),
(953, 'Pie de Cuesta', 27, NULL, NULL),
(954, 'Pinchote', 27, NULL, NULL),
(955, 'Puente Nacional', 27, NULL, NULL),
(956, 'Puerto Parra', 27, NULL, NULL),
(957, 'Puerto Wilches', 27, NULL, NULL),
(958, 'Páramo', 27, NULL, NULL),
(959, 'Rio Negro', 27, NULL, NULL),
(960, 'Sabana de Torres', 27, NULL, NULL),
(961, 'San Andrés', 27, NULL, NULL),
(962, 'San Benito', 27, NULL, NULL),
(963, 'San Gíl', 27, NULL, NULL),
(964, 'San Joaquín', 27, NULL, NULL),
(965, 'San José de Miranda', 27, NULL, NULL),
(966, 'San Miguel', 27, NULL, NULL),
(967, 'San Vicente del Chucurí', 27, NULL, NULL),
(968, 'Santa Bárbara', 27, NULL, NULL),
(969, 'Santa Helena del Opón', 27, NULL, NULL),
(970, 'Simacota', 27, NULL, NULL),
(971, 'Socorro', 27, NULL, NULL),
(972, 'Suaita', 27, NULL, NULL),
(973, 'Sucre', 27, NULL, NULL),
(974, 'Suratá', 27, NULL, NULL),
(975, 'Tona', 27, NULL, NULL),
(976, 'Valle de San José', 27, NULL, NULL),
(977, 'Vetas', 27, NULL, NULL),
(978, 'Villanueva', 27, NULL, NULL),
(979, 'Vélez', 27, NULL, NULL),
(980, 'Zapatoca', 27, NULL, NULL),
(981, 'Buenavista', 28, NULL, NULL),
(982, 'Caimito', 28, NULL, NULL),
(983, 'Chalán', 28, NULL, NULL),
(984, 'Colosó (Ricaurte)', 28, NULL, NULL),
(985, 'Corozal', 28, NULL, NULL),
(986, 'Coveñas', 28, NULL, NULL),
(987, 'El Roble', 28, NULL, NULL),
(988, 'Galeras (Nueva Granada)', 28, NULL, NULL),
(989, 'Guaranda', 28, NULL, NULL),
(990, 'La Unión', 28, NULL, NULL),
(991, 'Los Palmitos', 28, NULL, NULL),
(992, 'Majagual', 28, NULL, NULL),
(993, 'Morroa', 28, NULL, NULL),
(994, 'Ovejas', 28, NULL, NULL),
(995, 'Palmito', 28, NULL, NULL),
(996, 'Sampués', 28, NULL, NULL),
(997, 'San Benito Abad', 28, NULL, NULL),
(998, 'San Juan de Betulia', 28, NULL, NULL),
(999, 'San Marcos', 28, NULL, NULL),
(1000, 'San Onofre', 28, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_identificacion` int(11) NOT NULL,
  `no_identificacion` int(11) NOT NULL,
  `fecha_nac` date NOT NULL,
  `genero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departamento_id` int(10) UNSIGNED NOT NULL,
  `municipio_id` int(10) UNSIGNED NOT NULL,
  `afiliacion_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', 'db2b30c9b9fe0e222f34fd085220762a732854e01050be827355d0593eb3349c', '2017-01-18 04:42:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ver-home', 'Ver Home', 'Ver home3', '2017-01-25 22:27:28', '2017-01-25 22:27:28'),
(2, 'role-create', 'Create Role', 'Create New Role', '2017-01-25 22:27:28', '2017-01-25 22:27:28'),
(3, 'role-edit', 'Edit Role', 'Edit Role', '2017-01-25 22:27:28', '2017-01-25 22:27:28'),
(4, 'role-delete', 'Delete Role', 'Delete Role', '2017-01-25 22:27:28', '2017-01-25 22:27:28'),
(5, 'item-list', 'Display Item Listing', 'See only Listing Of Item', '2017-01-25 22:27:28', '2017-01-25 22:27:28'),
(6, 'item-create', 'Create Item', 'Create New Item', '2017-01-25 22:27:28', '2017-01-25 22:27:28'),
(7, 'item-edit', 'Edit Item', 'Edit Item', '2017-01-25 22:27:28', '2017-01-25 22:27:28'),
(8, 'item-delete', 'Delete Item', 'Delete Item', '2017-01-25 22:27:28', '2017-01-25 22:27:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `codigo_ingreso` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identificacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departamento_id` int(10) UNSIGNED NOT NULL,
  `municipio_id` int(10) UNSIGNED NOT NULL,
  `sexo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `profesion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `especialidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scaffoldinterfaces`
--

CREATE TABLE `scaffoldinterfaces` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `views` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `empresa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `genero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `password`, `name`, `apellidos`, `dni`, `email`, `direccion`, `telefono`, `foto`, `empresa`, `cargo`, `genero`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'admin@gmail.com', '$2y$10$S/zZQoyGvMVZDZlj4UaiQeYJV9Fx8rLXOmE3inkQZrTSXQdO0VT0W', 'diego', 'gallardo', '', 'admin@gmail.com', '', '', '', '', '', '', 'zHqHrfskk3KoOiQbrENGG8ld2ggQLwcpxQErRRMBLe7dI0RhJPxSEMSRL2TO', NULL, '2017-01-21 06:40:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `afiliaciones`
--
ALTER TABLE `afiliaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `agendadoctores`
--
ALTER TABLE `agendadoctores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agendadoctores_medico_id_foreign` (`medico_id`);

--
-- Indices de la tabla `agendamientos`
--
ALTER TABLE `agendamientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarioreserva`
--
ALTER TABLE `horarioreserva`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_medico_id_foreign` (`medico_id`);

--
-- Indices de la tabla `infocitas`
--
ALTER TABLE `infocitas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicos_departamento_id_foreign` (`departamento_id`),
  ADD KEY `medicos_municipio_id_foreign` (`municipio_id`);

--
-- Indices de la tabla `medico_especialidad`
--
ALTER TABLE `medico_especialidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medico_especialidad_medico_id_foreign` (`medico_id`),
  ADD KEY `medico_especialidad_especialidad_id_foreign` (`especialidad_id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipios_departamento_id_foreign` (`departamento_id`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_departamento_id_foreign` (`departamento_id`),
  ADD KEY `paciente_municipio_id_foreign` (`municipio_id`),
  ADD KEY `paciente_afiliacion_id_foreign` (`afiliacion_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profesores_departamento_id_foreign` (`departamento_id`),
  ADD KEY `profesores_municipio_id_foreign` (`municipio_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `scaffoldinterfaces`
--
ALTER TABLE `scaffoldinterfaces`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD UNIQUE KEY `users_dni_unique` (`dni`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `afiliaciones`
--
ALTER TABLE `afiliaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `agendadoctores`
--
ALTER TABLE `agendadoctores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `agendamientos`
--
ALTER TABLE `agendamientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `medico_especialidad`
--
ALTER TABLE `medico_especialidad`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `scaffoldinterfaces`
--
ALTER TABLE `scaffoldinterfaces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
