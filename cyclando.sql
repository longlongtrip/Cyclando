-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 12:12 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cyclando`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalogo`
--

CREATE TABLE `catalogo` (
  `ID_Produto` int(11) NOT NULL,
  `Categoria` varchar(255) NOT NULL,
  `Produto` varchar(255) NOT NULL,
  `Preco_B2C` varchar(255) NOT NULL,
  `Preco_B2B` varchar(255) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `encomenda`
--

CREATE TABLE `encomenda` (
  `ID_Encomenda` int(11) NOT NULL,
  `ID_Orcamento` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Estado_Encomenda` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `formacao`
--

CREATE TABLE `formacao` (
  `ID_Formacao` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `formacao_user`
--

CREATE TABLE `formacao_user` (
  `ID` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `ID_Formacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `ID_User` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oficina`
--

CREATE TABLE `oficina` (
  `ID_Oficina` int(11) NOT NULL,
  `Data_Agendamento` date NOT NULL,
  `ID_Orcamento` int(11) NOT NULL,
  `Estado_Reparacao` varchar(255) NOT NULL,
  `Data_Prevista` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orcamento`
--

CREATE TABLE `orcamento` (
  `ID_Orcamento` int(11) NOT NULL,
  `Orcamento` varchar(255) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `ID_Produto` int(11) NOT NULL,
  `ID_Oficina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`ID_Produto`);

--
-- Indexes for table `encomenda`
--
ALTER TABLE `encomenda`
  ADD PRIMARY KEY (`ID_Encomenda`),
  ADD KEY `ID_Orcamento` (`ID_Orcamento`);

--
-- Indexes for table `formacao`
--
ALTER TABLE `formacao`
  ADD PRIMARY KEY (`ID_Formacao`);

--
-- Indexes for table `formacao_user`
--
ALTER TABLE `formacao_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_User` (`ID_User`,`ID_Formacao`),
  ADD KEY `ID_Formacao` (`ID_Formacao`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID_User`);

--
-- Indexes for table `oficina`
--
ALTER TABLE `oficina`
  ADD PRIMARY KEY (`ID_Oficina`),
  ADD KEY `ID_Orcamento` (`ID_Orcamento`);

--
-- Indexes for table `orcamento`
--
ALTER TABLE `orcamento`
  ADD PRIMARY KEY (`ID_Orcamento`),
  ADD KEY `ID_User` (`ID_User`,`ID_Produto`,`ID_Oficina`),
  ADD KEY `ID_Produto` (`ID_Produto`),
  ADD KEY `ID_Oficina` (`ID_Oficina`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `ID_Produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `encomenda`
--
ALTER TABLE `encomenda`
  MODIFY `ID_Encomenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formacao`
--
ALTER TABLE `formacao`
  MODIFY `ID_Formacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formacao_user`
--
ALTER TABLE `formacao_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `ID_User` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oficina`
--
ALTER TABLE `oficina`
  MODIFY `ID_Oficina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `ID_Orcamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `encomenda`
--
ALTER TABLE `encomenda`
  ADD CONSTRAINT `encomenda_ibfk_1` FOREIGN KEY (`ID_Orcamento`) REFERENCES `orcamento` (`ID_Orcamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `formacao_user`
--
ALTER TABLE `formacao_user`
  ADD CONSTRAINT `formacao_user_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `login` (`ID_User`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `formacao_user_ibfk_2` FOREIGN KEY (`ID_Formacao`) REFERENCES `formacao` (`ID_Formacao`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oficina`
--
ALTER TABLE `oficina`
  ADD CONSTRAINT `oficina_ibfk_1` FOREIGN KEY (`ID_Orcamento`) REFERENCES `orcamento` (`ID_Orcamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orcamento`
--
ALTER TABLE `orcamento`
  ADD CONSTRAINT `orcamento_ibfk_1` FOREIGN KEY (`ID_Produto`) REFERENCES `catalogo` (`ID_Produto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `orcamento_ibfk_2` FOREIGN KEY (`ID_Oficina`) REFERENCES `oficina` (`ID_Oficina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orcamento_ibfk_3` FOREIGN KEY (`ID_User`) REFERENCES `login` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
