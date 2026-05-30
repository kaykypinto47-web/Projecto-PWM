cd "C:\Users\Jamine\OneDrive\Desktop\Projecto-PWM.002\Projecto-PWM.002\API-NODE"cd "C:\Users\Jamine\OneDrive\Desktop\Projecto-PWM.002\Projecto-PWM.002\API-NODE"cd "C:\Users\Jamine\OneDrive\Desktop\Projecto-PWM.002\Projecto-PWM.002\API-NODE"-- MySQL schema for Projecto-PWM.002
-- Execute this file in XAMPP/MySQL to create the database and tables used by the project.

CREATE DATABASE IF NOT EXISTS `PortalDeVagas`
  DEFAULT CHARACTER SET = utf8mb4
  DEFAULT COLLATE = utf8mb4_unicode_ci;

USE `PortalDeVagas`;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha_hash` VARCHAR(255) NOT NULL,
  `tipo` ENUM('estudante','empresa','admin') NOT NULL DEFAULT 'estudante',
  `status` ENUM('Pendente','Aprovado','Rejeitado') NOT NULL DEFAULT 'Pendente',
  `telefone` VARCHAR(50) DEFAULT NULL,
  `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usuarios_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `Empresas` (
  `id_empresa` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_empresa` VARCHAR(255) NOT NULL,
  `setor_atividade` VARCHAR(255) DEFAULT NULL,
  `email_empresa` VARCHAR(255) DEFAULT NULL,
  `telefone_empresa` VARCHAR(50) DEFAULT NULL,
  `localidade` VARCHAR(255) DEFAULT NULL,
  `descricao_empresa` TEXT DEFAULT NULL,
  `data_registo` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `Estudantes` (
  `id_estudante` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_estudante` VARCHAR(255) NOT NULL,
  `email_estudante` VARCHAR(255) DEFAULT NULL,
  `telefone_estudante` VARCHAR(50) DEFAULT NULL,
  `area_estudo` VARCHAR(255) DEFAULT NULL,
  `ano_estudo` VARCHAR(50) DEFAULT NULL,
  `universidade` VARCHAR(255) DEFAULT NULL,
  `data_registo` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estudante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `Vagas` (
  `id_vaga` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `descricao` TEXT NOT NULL,
  `localidade` VARCHAR(255) DEFAULT NULL,
  `tipo_contrato` VARCHAR(100) NOT NULL,
  `salario` DECIMAL(12,2) DEFAULT 0,
  `competencias_requeridas` TEXT DEFAULT NULL,
  `data_publicacao` DATE NOT NULL,
  `data_deadline` DATE DEFAULT NULL,
  `status_vaga` VARCHAR(50) NOT NULL DEFAULT 'ativa',
  `id_empresa` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_vaga`),
  CONSTRAINT `fk_vagas_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `Empresas`(`id_empresa`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `Candidaturas` (
  `id_candidatura` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_estudante` INT UNSIGNED NOT NULL,
  `id_vaga` INT UNSIGNED NOT NULL,
  `data_candidatura` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_candidatura` VARCHAR(50) NOT NULL DEFAULT 'pendente',
  PRIMARY KEY (`id_candidatura`),
  CONSTRAINT `fk_candidaturas_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `Estudantes`(`id_estudante`) ON DELETE CASCADE,
  CONSTRAINT `fk_candidaturas_vaga` FOREIGN KEY (`id_vaga`) REFERENCES `Vagas`(`id_vaga`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
