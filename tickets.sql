/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : tickets

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 03/07/2025 19:57:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`id_categoria`) USING BTREE,
  INDEX `departamento_id`(`id_departamento` ASC) USING BTREE,
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 'Equipos Informáticos', 1);
INSERT INTO `categorias` VALUES (2, 'Trámites Pagos', 4);
INSERT INTO `categorias` VALUES (3, 'Problemas de internet', 1);
INSERT INTO `categorias` VALUES (4, 'Nueva Categoria', 1);
INSERT INTO `categorias` VALUES (5, 'qwe', 1);
INSERT INTO `categorias` VALUES (8, 'Categoria 7', 1);
INSERT INTO `categorias` VALUES (9, 'Categoria 7 2.3', 1);
INSERT INTO `categorias` VALUES (10, 'eqweqweqwe', 4);
INSERT INTO `categorias` VALUES (11, 'eqweqweqwe', 4);

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos`  (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_departamento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES (1, 'Tecnologías de la Información');
INSERT INTO `departamentos` VALUES (4, 'Logística');
INSERT INTO `departamentos` VALUES (5, 'Mesa de Partes');
INSERT INTO `departamentos` VALUES (6, 'Almacen');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2025_07_03_054515_create_personal_access_tokens_table', 2);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'auth_token', 'dec793d3a843c2f3d00713a9d68b12f60721150fdfb368b137a33edc7470e438', '[\"*\"]', NULL, NULL, '2025-07-03 06:24:17', '2025-07-03 06:24:17');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'auth_token', '0bf22ff683934447b7100bc43209566ccacccc74027095685b642c0c29b32add', '[\"*\"]', NULL, NULL, '2025-07-03 06:25:48', '2025-07-03 06:25:48');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 1, 'auth_token', '79cfc332fe87e45236849532fcfb24578ac989ebb2404457bc4bd4dc77fc3b19', '[\"*\"]', '2025-07-03 23:10:39', NULL, '2025-07-03 07:13:50', '2025-07-03 23:10:39');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 1, 'auth_token', '9f8ddcc625bf85b94e29213e38b79c58585ae4d42ccb49a24919bbfff017406a', '[\"*\"]', NULL, NULL, '2025-07-03 07:45:42', '2025-07-03 07:45:42');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 1, 'auth_token', '71a920f34745feef93e509a9ef147beaf7009445422a7fcc0e8051663c0fa94d', '[\"*\"]', NULL, NULL, '2025-07-03 07:46:07', '2025-07-03 07:46:07');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\User', 1, 'auth_token', 'c520e09ce4f638a55176fb5d9e14bb453e52dc77268ea10376fdd5ba40b80c7e', '[\"*\"]', NULL, NULL, '2025-07-03 21:30:03', '2025-07-03 21:30:03');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\User', 1, 'auth_token', 'b025d0a46ef668fb5f43d995996948bd17d4c20ed3fcdedbc47d2e8979655f58', '[\"*\"]', NULL, NULL, '2025-07-03 23:25:01', '2025-07-03 23:25:01');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\User', 1, 'auth_token', '8dbad95666236299a55e9616c231ec98154463c67d9402fcf8fa9e5bdc77cb10', '[\"*\"]', NULL, NULL, '2025-07-03 23:33:20', '2025-07-03 23:33:20');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', 1, 'auth_token', '638a7f388660f398c590e8a6d4b60ccf260ed562cff6885f852542680e2f38cf', '[\"*\"]', '2025-07-03 23:37:13', NULL, '2025-07-03 23:33:29', '2025-07-03 23:37:13');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', 1, 'auth_token', '1671d065d85332023a3d08d5de49c4d850e1d9fe2670336fd24246eb01f327f9', '[\"*\"]', NULL, NULL, '2025-07-03 23:37:49', '2025-07-03 23:37:49');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', 1, 'auth_token', '17c757dbbd16d10e0ab43aa64c8155f3390c277a63fa57a097e9c5a95ccce109', '[\"*\"]', '2025-07-03 23:44:44', NULL, '2025-07-03 23:37:57', '2025-07-03 23:44:44');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', 1, 'auth_token', '93d3b621bdfb26d20ec587f645c7fb70a7de3796df10e75e550f8b51a6ed5a3d', '[\"*\"]', '2025-07-04 00:09:19', NULL, '2025-07-03 23:44:58', '2025-07-04 00:09:19');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\User', 1, 'auth_token', '7477d27029f6f5f0757a298742f2c5a643c88283250024db2da891979c08e373', '[\"*\"]', '2025-07-04 00:33:05', NULL, '2025-07-04 00:27:09', '2025-07-04 00:33:05');

-- ----------------------------
-- Table structure for personas
-- ----------------------------
DROP TABLE IF EXISTS `personas`;
CREATE TABLE `personas`  (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `nombres` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `apellido_paterno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `apellido_materno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `sexo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `domicilio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `celular` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `id_departamento` int NULL DEFAULT NULL,
  `dni` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_persona`) USING BTREE,
  UNIQUE INDEX `id_usuario`(`id_usuario` ASC) USING BTREE,
  UNIQUE INDEX `dni`(`dni` ASC) USING BTREE,
  INDEX `id_departamento`(`id_departamento` ASC) USING BTREE,
  CONSTRAINT `personas_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `personas_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personas
-- ----------------------------
INSERT INTO `personas` VALUES (1, 1, 'Aarón', 'Espinoza', 'Ilizarbe', 'M', NULL, NULL, 1, '70521117', NULL, NULL, NULL);
INSERT INTO `personas` VALUES (2, 2, 'Reyner Kevin', 'Cabezas', 'Porras', 'M', NULL, NULL, 1, '12312312', NULL, NULL, NULL);
INSERT INTO `personas` VALUES (3, 3, 'Carlos', 'Clausen', 'Perez', 'M', NULL, NULL, 4, '12312311', NULL, NULL, NULL);
INSERT INTO `personas` VALUES (5, 9, 'Aarón', 'Espinozas', 'Ilizarbe', 'M', 'San Miguel', '936060107', 1, '70521116', '1990-02-26', '2025-07-03 17:51:28', NULL);
INSERT INTO `personas` VALUES (6, 10, 'Aarón', 'Espinoza', 'Ilizarbe', 'M', 'San Miguel', '936060107', 1, '70521115', '1990-02-26', '2025-07-03 23:50:05', NULL);

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `prefijo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_rol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, 'admin', 'Administrador');
INSERT INTO `rol` VALUES (2, 'operador', 'Operador / Técnico');
INSERT INTO `rol` VALUES (3, 'usuario', 'Solicitante');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('3GNJyp7PKipw6KJXWmtocXbCvZylfsq6aDLom07h', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzNqeUZZeG5QY3JkdERVWklKRmRobUFPMDd5YTFWb1NqWXNGOUk4TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAxMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751521673);
INSERT INTO `sessions` VALUES ('8NlB6h3GBjghWE8Qn1YmkgKoj3KjLRFbEp58CsG8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMEcyaENmZ21hMU1qdDhEdVdESmNwOU15anl3MXJRT2ZwOFRGdVlpbCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdGlja2V0cy9hc2lnbmFkb3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTg6InJvbF9hY3Rpdm9fcHJlZmlqbyI7czo4OiJvcGVyYWRvciI7czoyMjoicm9sX2FjdGl2b19kZXNjcmlwY2lvbiI7czoxOToiT3BlcmFkb3IgLyBUw6ljbmljbyI7fQ==', 1751506267);
INSERT INTO `sessions` VALUES ('IMlm6Y6hZd2Shgx3OeEvwG27uQzxh4T8GfwY7ywn', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSkQxalpwT0pGNkpCQnhjQmVzVG9aY0VNZ0l5cG1FOXdmOW1KOVdXRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZXBhcnRhbWVudG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE4OiJyb2xfYWN0aXZvX3ByZWZpam8iO3M6NzoidXN1YXJpbyI7czoyMjoicm9sX2FjdGl2b19kZXNjcmlwY2lvbiI7czoxMToiU29saWNpdGFudGUiO30=', 1751506312);
INSERT INTO `sessions` VALUES ('UdC1tYxGTzwTVc98wca9Son7PYKlQS8OGlkLZSgZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT2hLTGtOa2ZkSU9ZaEdKQ1BzQTBPU2JaOEx3RXJTNlF6MGhabzdLMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWRpcmVjdC1nb29nbGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjU6InN0YXRlIjtzOjQwOiJNWWFOY0VPT3lFaHNqMnMwc0hDUDBFWU8ybmdDYkRPczZnUFlEUDdUIjt9', 1751503962);
INSERT INTO `sessions` VALUES ('WEpOPz0qPc7h3a9CuoDbeu5081Dr2JqSimNzAo8k', NULL, '127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnRmY29tS1pGd0JSY21CVnJFTlJoRGtKWkVDN0ZaNTVKa09EZ005ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZXBhcnRhbWVudG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751506281);
INSERT INTO `sessions` VALUES ('Zl4UqIFFdo0HwVgDZxDFVye9n3uQTUDbzeVWguZp', NULL, '127.0.0.1', 'PostmanRuntime/7.44.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDFtQ0dtb2I5eHY1MmV5RXpoaU5xTUkxdW9sZ2cycUNiRFJGWHlDdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZXBhcnRhbWVudG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751510036);

-- ----------------------------
-- Table structure for ticket_comentario
-- ----------------------------
DROP TABLE IF EXISTS `ticket_comentario`;
CREATE TABLE `ticket_comentario`  (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `texto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  `id_ticket` int NULL DEFAULT NULL,
  `id_usuario` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_comentario`) USING BTREE,
  INDEX `id_ticket`(`id_ticket` ASC) USING BTREE,
  INDEX `id_usuario`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `ticket_comentario_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_comentario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_comentario
-- ----------------------------
INSERT INTO `ticket_comentario` VALUES (13, 'Hola, puede darme más detalles del equipo', 1, 1, '2025-07-02 02:21:17');
INSERT INTO `ticket_comentario` VALUES (15, 'Le adjunto formato', 1, 1, '2025-07-02 02:22:52');
INSERT INTO `ticket_comentario` VALUES (16, 'otro', 1, 1, '2025-07-02 02:24:35');
INSERT INTO `ticket_comentario` VALUES (17, NULL, 1, 1, '2025-07-02 02:25:30');
INSERT INTO `ticket_comentario` VALUES (18, NULL, 1, 1, '2025-07-02 02:29:37');
INSERT INTO `ticket_comentario` VALUES (19, 'holi', 1, 2, '2025-07-02 02:36:34');
INSERT INTO `ticket_comentario` VALUES (20, 'putos', 4, 1, '2025-07-03 00:43:30');
INSERT INTO `ticket_comentario` VALUES (21, 'dfgdfgdfgd', 4, 1, '2025-07-03 00:43:59');
INSERT INTO `ticket_comentario` VALUES (22, 'comentario', 1, 1, '2025-07-04 00:08:45');
INSERT INTO `ticket_comentario` VALUES (23, 'comentario 2', 1, 1, '2025-07-04 00:09:19');

-- ----------------------------
-- Table structure for ticket_comentario_archivos
-- ----------------------------
DROP TABLE IF EXISTS `ticket_comentario_archivos`;
CREATE TABLE `ticket_comentario_archivos`  (
  `id_archivo` int NOT NULL AUTO_INCREMENT,
  `id_comentario` int NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `extension` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_archivo`) USING BTREE,
  INDEX `id_comentario`(`id_comentario` ASC) USING BTREE,
  CONSTRAINT `ticket_comentario_archivos_ibfk_1` FOREIGN KEY (`id_comentario`) REFERENCES `ticket_comentario` (`id_comentario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_comentario_archivos
-- ----------------------------
INSERT INTO `ticket_comentario_archivos` VALUES (6, 15, 'transferencia (3)', '210408c8-2784-4e3b-847c-56752ae91e35', 'pdf');
INSERT INTO `ticket_comentario_archivos` VALUES (7, 16, 'record_de_notas', '9feb5517-7a71-42e6-8411-4f5907dce7db', 'pdf');
INSERT INTO `ticket_comentario_archivos` VALUES (8, 18, 'GACETA 127_2025', '15b0bd41-16da-4880-9274-e4d6bf82a980', 'pdf');
INSERT INTO `ticket_comentario_archivos` VALUES (9, 20, 'transferencia (3)', '493decf6-7320-47fa-987c-008393510981', 'pdf');
INSERT INTO `ticket_comentario_archivos` VALUES (10, 21, 'transferencia (3)', '510aacb9-2560-4c65-9943-47bb583b8463', 'pdf');

-- ----------------------------
-- Table structure for ticket_derivacion
-- ----------------------------
DROP TABLE IF EXISTS `ticket_derivacion`;
CREATE TABLE `ticket_derivacion`  (
  `id_derivacion` int NOT NULL AUTO_INCREMENT,
  `id_ticket` int NULL DEFAULT NULL,
  `id_departamento_origen` int NULL DEFAULT NULL,
  `id_usuario_origen` int NULL DEFAULT NULL,
  `id_categoria_origen` int NULL DEFAULT NULL,
  `id_departamento_destino` int NULL DEFAULT NULL,
  `id_usuario_destino` int NULL DEFAULT NULL,
  `id_categoria_destino` int NULL DEFAULT NULL,
  `motivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_derivacion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_derivacion
-- ----------------------------
INSERT INTO `ticket_derivacion` VALUES (1, 1, 1, 1, 2, 4, NULL, NULL, 'Derivado porque sí', '2025-07-01 02:26:16');

-- ----------------------------
-- Table structure for ticket_seguimiento
-- ----------------------------
DROP TABLE IF EXISTS `ticket_seguimiento`;
CREATE TABLE `ticket_seguimiento`  (
  `id_seguimiento` int NOT NULL AUTO_INCREMENT,
  `id_ticket` int NULL DEFAULT NULL,
  `id_usuario` bigint UNSIGNED NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `comentario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_seguimiento`) USING BTREE,
  INDEX `id_ticket`(`id_ticket` ASC) USING BTREE,
  INDEX `id_usuario`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `ticket_seguimiento_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_seguimiento_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_seguimiento
-- ----------------------------
INSERT INTO `ticket_seguimiento` VALUES (1, 1, 1, 'E', 'Ticket asignado a técnico', '2025-06-28 22:14:19');
INSERT INTO `ticket_seguimiento` VALUES (3, 2, 1, 'E', 'Ticket asignado a Técnico', '2025-07-03 00:11:22');
INSERT INTO `ticket_seguimiento` VALUES (4, 2, 1, 'E', 'Ticket asignado a Técnico', '2025-07-03 00:21:42');
INSERT INTO `ticket_seguimiento` VALUES (5, 2, 1, 'E', 'Ticket asignado a Técnico', '2025-07-03 00:22:12');
INSERT INTO `ticket_seguimiento` VALUES (6, 1, 1, 'E', 'Ticket asignado a Técnico', '2025-07-03 00:23:01');
INSERT INTO `ticket_seguimiento` VALUES (7, 4, 1, 'P', 'Ticket creado', '2025-07-03 00:40:31');
INSERT INTO `ticket_seguimiento` VALUES (8, 4, 2, 'E', 'Ticket asignado a Técnico', '2025-07-03 00:42:46');
INSERT INTO `ticket_seguimiento` VALUES (9, 4, 2, 'R', 'Ticket Resuelto', '2025-07-03 00:46:49');
INSERT INTO `ticket_seguimiento` VALUES (10, 5, 1, 'P', 'Ticket Registrado', '2025-07-03 08:58:15');
INSERT INTO `ticket_seguimiento` VALUES (11, 6, 1, 'P', 'Ticket Registrado', '2025-07-03 08:58:58');
INSERT INTO `ticket_seguimiento` VALUES (12, 6, 1, 'E', 'Ticket asignado a Técnico', '2025-07-03 09:20:58');
INSERT INTO `ticket_seguimiento` VALUES (13, 6, 1, 'R', 'Ticket Resuelto', '2025-07-03 09:23:05');
INSERT INTO `ticket_seguimiento` VALUES (14, 6, 1, 'E', 'Ticket Reabierto', '2025-07-03 09:26:08');
INSERT INTO `ticket_seguimiento` VALUES (15, 6, 1, 'C', 'Ticket Cerrado', '2025-07-03 09:28:29');
INSERT INTO `ticket_seguimiento` VALUES (16, 7, 1, 'P', 'Ticket Registrado', '2025-07-03 20:17:52');
INSERT INTO `ticket_seguimiento` VALUES (17, 8, 1, 'P', 'Ticket Registrado', '2025-07-03 20:18:49');
INSERT INTO `ticket_seguimiento` VALUES (18, 2, 1, 'E', 'Ticket asignado a Técnico', '2025-07-03 20:59:10');
INSERT INTO `ticket_seguimiento` VALUES (19, 2, 1, 'R', 'Ticket Resuelto', '2025-07-03 20:59:43');
INSERT INTO `ticket_seguimiento` VALUES (20, 2, 1, 'R', 'Ticket Resuelto', '2025-07-03 21:00:31');
INSERT INTO `ticket_seguimiento` VALUES (21, 2, 1, 'E', 'Ticket Reabierto', '2025-07-03 21:06:25');
INSERT INTO `ticket_seguimiento` VALUES (22, 2, 1, 'C', 'Ticket Cerrado', '2025-07-03 21:13:08');

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets`  (
  `id_ticket` int NOT NULL AUTO_INCREMENT,
  `asunto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `prioridad` int NULL DEFAULT NULL,
  `id_usuario_solicita` bigint UNSIGNED NULL DEFAULT NULL,
  `id_usuario_atiende` bigint UNSIGNED NULL DEFAULT NULL,
  `id_categoria` int NULL DEFAULT NULL,
  `id_departamento` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_ticket`) USING BTREE,
  INDEX `id_categoria`(`id_categoria` ASC) USING BTREE,
  INDEX `id_departamento`(`id_departamento` ASC) USING BTREE,
  INDEX `id_usuario_solicita`(`id_usuario_solicita` ASC) USING BTREE,
  INDEX `id_usuario_atiende`(`id_usuario_atiende` ASC) USING BTREE,
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`id_usuario_solicita`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`id_usuario_atiende`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES (1, 'Mi pc está fallando', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corporis similique earum neque praesentium quae in consequuntur sequi sunt, magni iste mollitia officiis! Architecto quis incidunt officia soluta, nisi sed expedita!', 'E', 4, 2, 1, 1, 1, '2025-06-28 13:34:43', '2025-07-03 00:23:01');
INSERT INTO `tickets` VALUES (2, 'Se reinicia mi tablet', 'Se reinicia', 'C', 4, 9, 1, 1, 1, '2025-06-28 13:34:43', '2025-07-03 21:13:08');
INSERT INTO `tickets` VALUES (3, 'No me depositan', 'MI pago está atardado 3 meses pipipip', 'P', 4, 2, NULL, 2, 4, '2025-06-28 13:34:43', NULL);
INSERT INTO `tickets` VALUES (4, 'PUTOS', 'PUTOS TODOS', 'R', NULL, 1, 2, 3, 1, '2025-07-03 00:40:31', '2025-07-03 00:46:49');
INSERT INTO `tickets` VALUES (5, 'Deploy', 'Lorem ipsum', 'P', NULL, 1, NULL, 1, 1, '2025-07-03 08:58:15', '2025-07-03 08:58:15');
INSERT INTO `tickets` VALUES (6, 'Deploy 2', 'Lorem ipsum', 'C', 1, 2, 1, 1, 1, '2025-07-03 08:58:58', '2025-07-03 09:28:29');
INSERT INTO `tickets` VALUES (7, 'Probando api', 'Con postman', 'P', 2, 1, NULL, 1, 1, '2025-07-03 20:17:52', '2025-07-03 20:17:52');
INSERT INTO `tickets` VALUES (8, 'Probando api 2', 'Con postman', 'P', 2, 1, NULL, 1, 1, '2025-07-03 20:18:49', '2025-07-03 20:18:49');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Aaron Espinoza', 'aaronespinozadr@gmail.com', NULL, '$2y$12$CjCUXmhEm8liuFQZOAf.Puy7.9edtRT3N6hGiGl4nPPhXdxf0WLnO', NULL, '2025-06-26 23:45:26', '2025-07-03 23:48:21');
INSERT INTO `users` VALUES (2, 'Reyner Cabezas', 'rcabezasporras@gmail.com', NULL, '$2y$12$CjCUXmhEm8liuFQZOAf.Puy7.9edtRT3N6hGiGl4nPPhXdxf0WLnO', NULL, '2025-06-26 23:45:26', '2025-07-03 00:38:20');
INSERT INTO `users` VALUES (3, 'Carlos Clausen', 'carlos123@gmail.com', NULL, '$2y$12$CjCUXmhEm8liuFQZOAf.Puy7.9edtRT3N6hGiGl4nPPhXdxf0WLnO', NULL, '2025-06-26 23:45:26', '2025-07-02 03:49:18');
INSERT INTO `users` VALUES (9, 'Aarón Espinozas', 'theadrei99@gmail.com', NULL, '$2y$12$CjCUXmhEm8liuFQZOAf.Puy7.9edtRT3N6hGiGl4nPPhXdxf0WLnO', NULL, '2025-07-03 17:35:10', '2025-07-03 17:51:28');
INSERT INTO `users` VALUES (10, 'Aarón Espinoza', 'theadrei91@gmail.com', NULL, '$2y$12$n22s//dg8hBobtfpDduATuw6yO6PXe7Y7MCwScDGnkvDjOLADVyGu', NULL, '2025-07-03 23:50:05', '2025-07-03 23:50:05');

-- ----------------------------
-- Table structure for usuarios_roles
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_roles`;
CREATE TABLE `usuarios_roles`  (
  `id_usuario` bigint UNSIGNED NULL DEFAULT NULL,
  `id_rol` int NULL DEFAULT NULL,
  INDEX `id_rol`(`id_rol` ASC) USING BTREE,
  INDEX `id_usuario`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `usuarios_roles_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuarios_roles_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios_roles
-- ----------------------------
INSERT INTO `usuarios_roles` VALUES (1, 1);
INSERT INTO `usuarios_roles` VALUES (2, 1);
INSERT INTO `usuarios_roles` VALUES (1, 2);
INSERT INTO `usuarios_roles` VALUES (1, 3);
INSERT INTO `usuarios_roles` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
