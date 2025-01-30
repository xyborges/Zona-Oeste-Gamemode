-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/12/2023 às 22:54
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `joaob_2526`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acessorios`
--

CREATE TABLE `acessorios` (
  `Nome` varchar(25) NOT NULL,
  `ao_x0` float DEFAULT NULL,
  `ao_x1` float DEFAULT NULL,
  `ao_x2` float DEFAULT NULL,
  `ao_x3` float DEFAULT NULL,
  `ao_x4` float DEFAULT NULL,
  `ao_x5` float DEFAULT NULL,
  `ao_x6` float DEFAULT NULL,
  `ao_x7` float DEFAULT NULL,
  `ao_x8` float DEFAULT NULL,
  `ao_x9` float DEFAULT NULL,
  `ao_y0` float DEFAULT NULL,
  `ao_y1` float DEFAULT NULL,
  `ao_y2` float DEFAULT NULL,
  `ao_y3` float DEFAULT NULL,
  `ao_y4` float DEFAULT NULL,
  `ao_y5` float DEFAULT NULL,
  `ao_y6` float DEFAULT NULL,
  `ao_y7` float DEFAULT NULL,
  `ao_y8` float DEFAULT NULL,
  `ao_y9` float DEFAULT NULL,
  `ao_z0` float DEFAULT NULL,
  `ao_z1` float DEFAULT NULL,
  `ao_z2` float DEFAULT NULL,
  `ao_z3` float DEFAULT NULL,
  `ao_z4` float DEFAULT NULL,
  `ao_z5` float DEFAULT NULL,
  `ao_z6` float DEFAULT NULL,
  `ao_z7` float DEFAULT NULL,
  `ao_z8` float DEFAULT NULL,
  `ao_z9` float DEFAULT NULL,
  `ao_rx0` float DEFAULT NULL,
  `ao_rx1` float DEFAULT NULL,
  `ao_rx2` float DEFAULT NULL,
  `ao_rx3` float DEFAULT NULL,
  `ao_rx4` float DEFAULT NULL,
  `ao_rx5` float DEFAULT NULL,
  `ao_rx6` float DEFAULT NULL,
  `ao_rx7` float DEFAULT NULL,
  `ao_rx8` float DEFAULT NULL,
  `ao_rx9` float DEFAULT NULL,
  `ao_ry0` float DEFAULT NULL,
  `ao_ry1` float DEFAULT NULL,
  `ao_ry2` float DEFAULT NULL,
  `ao_ry3` float DEFAULT NULL,
  `ao_ry4` float DEFAULT NULL,
  `ao_ry5` float DEFAULT NULL,
  `ao_ry6` float DEFAULT NULL,
  `ao_ry7` float DEFAULT NULL,
  `ao_ry8` float DEFAULT NULL,
  `ao_ry9` float DEFAULT NULL,
  `ao_rz0` float DEFAULT NULL,
  `ao_rz1` float DEFAULT NULL,
  `ao_rz2` float DEFAULT NULL,
  `ao_rz3` float DEFAULT NULL,
  `ao_rz4` float DEFAULT NULL,
  `ao_rz5` float DEFAULT NULL,
  `ao_rz6` float DEFAULT NULL,
  `ao_rz7` float DEFAULT NULL,
  `ao_rz8` float DEFAULT NULL,
  `ao_rz9` float DEFAULT NULL,
  `ao_sx0` float DEFAULT NULL,
  `ao_sx1` float DEFAULT NULL,
  `ao_sx2` float DEFAULT NULL,
  `ao_sx3` float DEFAULT NULL,
  `ao_sx4` float DEFAULT NULL,
  `ao_sx5` float DEFAULT NULL,
  `ao_sx6` float DEFAULT NULL,
  `ao_sx7` float DEFAULT NULL,
  `ao_sx8` float DEFAULT NULL,
  `ao_sx9` float DEFAULT NULL,
  `ao_sy0` float DEFAULT NULL,
  `ao_sy1` float DEFAULT NULL,
  `ao_sy2` float DEFAULT NULL,
  `ao_sy3` float DEFAULT NULL,
  `ao_sy4` float DEFAULT NULL,
  `ao_sy5` float DEFAULT NULL,
  `ao_sy6` float DEFAULT NULL,
  `ao_sy7` float DEFAULT NULL,
  `ao_sy8` float DEFAULT NULL,
  `ao_sy9` float DEFAULT NULL,
  `ao_sz0` float DEFAULT NULL,
  `ao_sz1` float DEFAULT NULL,
  `ao_sz2` float DEFAULT NULL,
  `ao_sz3` float DEFAULT NULL,
  `ao_sz4` float DEFAULT NULL,
  `ao_sz5` float DEFAULT NULL,
  `ao_sz6` float DEFAULT NULL,
  `ao_sz7` float DEFAULT NULL,
  `ao_sz8` float DEFAULT NULL,
  `ao_sz9` float DEFAULT NULL,
  `Acessorio0` int(11) DEFAULT NULL,
  `Acessorio1` int(11) DEFAULT NULL,
  `Acessorio2` int(11) DEFAULT NULL,
  `Acessorio3` int(11) DEFAULT NULL,
  `Acessorio4` int(11) DEFAULT NULL,
  `Acessorio5` int(11) DEFAULT NULL,
  `Acessorio6` int(11) DEFAULT NULL,
  `Acessorio7` int(11) DEFAULT NULL,
  `Acessorio8` int(11) DEFAULT NULL,
  `Acessorio9` int(11) DEFAULT NULL,
  `partebone0` int(11) DEFAULT NULL,
  `partebone1` int(11) DEFAULT NULL,
  `partebone2` int(11) DEFAULT NULL,
  `partebone3` int(11) DEFAULT NULL,
  `partebone4` int(11) DEFAULT NULL,
  `partebone5` int(11) DEFAULT NULL,
  `partebone6` int(11) DEFAULT NULL,
  `partebone7` int(11) DEFAULT NULL,
  `partebone8` int(11) DEFAULT NULL,
  `partebone9` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banco`
--

CREATE TABLE `banco` (
  `Usuario` varchar(25) DEFAULT '',
  `Dinheiro` int(11) DEFAULT 0,
  `Bloqueada` int(11) DEFAULT 0,
  `userbanco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `banco`
--

INSERT INTO `banco` (`Usuario`, `Dinheiro`, `Bloqueada`, `userbanco`) VALUES
('Joao_Borges', 20000, 0, 2),
('Beck', 0, 0, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `banidos`
--

CREATE TABLE `banidos` (
  `Nome` text DEFAULT NULL,
  `Ip` text DEFAULT NULL,
  `Motivo` text DEFAULT NULL,
  `Staff` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `caixas`
--

CREATE TABLE `caixas` (
  `caixaid` int(11) NOT NULL DEFAULT 0,
  `CaixaX` float DEFAULT 0,
  `CaixaY` float DEFAULT 0,
  `CaixaZ` float DEFAULT 0,
  `CaixaRX` float DEFAULT 0,
  `CaixaRY` float DEFAULT 0,
  `CaixaRZ` float DEFAULT 0,
  `CaixaGrana` int(11) DEFAULT 5000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `caixas`
--

INSERT INTO `caixas` (`caixaid`, `CaixaX`, `CaixaY`, `CaixaZ`, `CaixaRX`, `CaixaRY`, `CaixaRZ`, `CaixaGrana`) VALUES
(0, 1163, -1699.34, 14.0519, 0, 0, 0, 5000),
(1, 2233, -1673.59, 14.7755, 0, 0, -15, 5000),
(2, 2116, -1130.6, 25.0769, 0, 0, 175.5, 5000),
(3, 1638, -1171.73, 23.9719, 0, 0, -88.8, 5000),
(4, 1623, -1171.81, 23.9698, 0, 0, -88.8, 5000),
(5, 1333, -1293.79, 13.4269, 0, 0, -178, 5000),
(6, 1130, -1158.92, 23.6981, 0, 0, -88.3, 5000),
(7, 1982, -1112.06, 25.6734, 0, 0, 0, 5000),
(8, 2081, -1333, 23.8844, 0, 0, 0, 5000),
(9, 2446, -1902.12, 13.4497, 0, 0, -92.6, 5000),
(10, 1971, -1793.55, 13.3969, 0, 0, 0, 5000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrosalugados`
--

CREATE TABLE `carrosalugados` (
  `Vid` int(11) NOT NULL,
  `Dono` varchar(24) NOT NULL,
  `VeiculoModelo` int(11) DEFAULT 0,
  `VeiculoX` double DEFAULT 0,
  `VeiculoY` double DEFAULT 0,
  `VeiculoZ` double DEFAULT 0,
  `VeiculoA` double DEFAULT 0,
  `HorasAlugado` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `casas`
--

CREATE TABLE `casas` (
  `Casaid` int(11) DEFAULT 0,
  `CasaX` float DEFAULT 0,
  `CasaY` float DEFAULT 0,
  `CasaZ` float DEFAULT 0,
  `SaidaX` float DEFAULT 0,
  `SaidaY` float DEFAULT 0,
  `SaidaZ` float DEFAULT 0,
  `Interior` int(11) DEFAULT 0,
  `Dono` text DEFAULT NULL,
  `Aluguel` int(11) DEFAULT 0,
  `CasaVip` int(11) DEFAULT 0,
  `AluguelNome0` varchar(25) DEFAULT 'Ninguem',
  `AluguelNome1` varchar(25) DEFAULT 'Ninguem',
  `AluguelNome2` varchar(25) DEFAULT 'Ninguem',
  `AluguelNome3` varchar(25) DEFAULT 'Ninguem',
  `PrecoCasa` int(11) DEFAULT 0,
  `CasaComprada` int(11) DEFAULT 0,
  `Trancada` int(11) DEFAULT 0,
  `Item0` int(11) DEFAULT 0,
  `Quantia0` int(11) DEFAULT 0,
  `Item1` int(11) DEFAULT 0,
  `Quantia1` int(11) DEFAULT 0,
  `Item2` int(11) DEFAULT 0,
  `Quantia2` int(11) DEFAULT 0,
  `Item3` int(11) DEFAULT 0,
  `Quantia3` int(11) DEFAULT 0,
  `Item4` int(11) DEFAULT 0,
  `Quantia4` int(11) DEFAULT 0,
  `Item5` int(11) DEFAULT 0,
  `Quantia5` int(11) DEFAULT 0,
  `Item6` int(11) DEFAULT 0,
  `Quantia6` int(11) DEFAULT 0,
  `Item7` int(11) DEFAULT 0,
  `Quantia7` int(11) DEFAULT 0,
  `Item8` int(11) DEFAULT 0,
  `Quantia8` int(11) DEFAULT 0,
  `Item9` int(11) DEFAULT 0,
  `Quantia9` int(11) DEFAULT 0,
  `Item10` int(11) DEFAULT 0,
  `Quantia10` int(11) DEFAULT 0,
  `Item11` int(11) DEFAULT 0,
  `Quantia11` int(11) DEFAULT 0,
  `Item12` int(11) DEFAULT 0,
  `Quantia12` int(11) DEFAULT 0,
  `Item13` int(11) DEFAULT 0,
  `Quantia13` int(11) DEFAULT 0,
  `Item14` int(11) DEFAULT 0,
  `Quantia14` int(11) DEFAULT 0,
  `Item15` int(11) DEFAULT 0,
  `Quantia15` int(11) DEFAULT 0,
  `Item16` int(11) DEFAULT 0,
  `Quantia16` int(11) DEFAULT 0,
  `Item17` int(11) DEFAULT 0,
  `Quantia17` int(11) DEFAULT 0,
  `Item18` int(11) DEFAULT 0,
  `Quantia18` int(11) DEFAULT 0,
  `Item19` int(11) DEFAULT 0,
  `Quantia19` int(11) DEFAULT 0,
  `Item20` int(11) DEFAULT 0,
  `Quantia20` int(11) DEFAULT 0,
  `Item21` int(11) DEFAULT 0,
  `Quantia21` int(11) DEFAULT 0,
  `Item22` int(11) DEFAULT 0,
  `Quantia22` int(11) DEFAULT 0,
  `Item23` int(11) DEFAULT 0,
  `Quantia23` int(11) DEFAULT 0,
  `Item24` int(11) DEFAULT 0,
  `Quantia24` int(11) DEFAULT 0,
  `Item25` int(11) DEFAULT 0,
  `Quantia25` int(11) DEFAULT 0,
  `Item26` int(11) DEFAULT 0,
  `Quantia26` int(11) DEFAULT 0,
  `Item27` int(11) DEFAULT 0,
  `Quantia27` int(11) DEFAULT 0,
  `Item28` int(11) DEFAULT 0,
  `Quantia28` int(11) DEFAULT 0,
  `Item29` int(11) DEFAULT 0,
  `Quantia29` int(11) DEFAULT 0,
  `Item30` int(11) DEFAULT 0,
  `Quantia30` int(11) DEFAULT 0,
  `Item31` int(11) DEFAULT 0,
  `Quantia31` int(11) DEFAULT 0,
  `Item32` int(11) DEFAULT 0,
  `Quantia32` int(11) DEFAULT 0,
  `Item33` int(11) DEFAULT 0,
  `Quantia33` int(11) DEFAULT 0,
  `Item34` int(11) DEFAULT 0,
  `Quantia34` int(11) DEFAULT 0,
  `Item35` int(11) DEFAULT 0,
  `Quantia35` int(11) DEFAULT 0,
  `Item36` int(11) DEFAULT 0,
  `Quantia36` int(11) DEFAULT 0,
  `Item37` int(11) DEFAULT 0,
  `Quantia37` int(11) DEFAULT 0,
  `Item38` int(11) DEFAULT 0,
  `Quantia38` int(11) DEFAULT 0,
  `Item39` int(11) DEFAULT 0,
  `Quantia39` int(11) DEFAULT 0,
  `Item40` int(11) DEFAULT 0,
  `Quantia40` int(11) DEFAULT 0,
  `Item41` int(11) DEFAULT 0,
  `Quantia41` int(11) DEFAULT 0,
  `Item42` int(11) DEFAULT 0,
  `Quantia42` int(11) DEFAULT 0,
  `Item43` int(11) DEFAULT 0,
  `Quantia43` int(11) DEFAULT 0,
  `Item44` int(11) DEFAULT 0,
  `Quantia44` int(11) DEFAULT 0,
  `Item45` int(11) DEFAULT 0,
  `Quantia45` int(11) DEFAULT 0,
  `Item46` int(11) DEFAULT 0,
  `Quantia46` int(11) DEFAULT 0,
  `Item47` int(11) DEFAULT 0,
  `Quantia47` int(11) DEFAULT 0,
  `Item48` int(11) DEFAULT 0,
  `Quantia48` int(11) DEFAULT 0,
  `Item49` int(11) DEFAULT 0,
  `Quantia49` int(11) DEFAULT 0,
  `Item50` int(11) DEFAULT 0,
  `Quantia50` int(11) DEFAULT 0,
  `Item51` int(11) DEFAULT 0,
  `Quantia51` int(11) DEFAULT 0,
  `Item52` int(11) DEFAULT 0,
  `Quantia52` int(11) DEFAULT 0,
  `Item53` int(11) DEFAULT 0,
  `Quantia53` int(11) DEFAULT 0,
  `Item54` int(11) DEFAULT 0,
  `Quantia54` int(11) DEFAULT 0,
  `Item55` int(11) DEFAULT 0,
  `Quantia55` int(11) DEFAULT 0,
  `Item56` int(11) DEFAULT 0,
  `Quantia56` int(11) DEFAULT 0,
  `Item57` int(11) DEFAULT 0,
  `Quantia57` int(11) DEFAULT 0,
  `Item58` int(11) DEFAULT 0,
  `Quantia58` int(11) DEFAULT 0,
  `Item59` int(11) DEFAULT 0,
  `Quantia59` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `casas`
--

INSERT INTO `casas` (`Casaid`, `CasaX`, `CasaY`, `CasaZ`, `SaidaX`, `SaidaY`, `SaidaZ`, `Interior`, `Dono`, `Aluguel`, `CasaVip`, `AluguelNome0`, `AluguelNome1`, `AluguelNome2`, `AluguelNome3`, `PrecoCasa`, `CasaComprada`, `Trancada`, `Item0`, `Quantia0`, `Item1`, `Quantia1`, `Item2`, `Quantia2`, `Item3`, `Quantia3`, `Item4`, `Quantia4`, `Item5`, `Quantia5`, `Item6`, `Quantia6`, `Item7`, `Quantia7`, `Item8`, `Quantia8`, `Item9`, `Quantia9`, `Item10`, `Quantia10`, `Item11`, `Quantia11`, `Item12`, `Quantia12`, `Item13`, `Quantia13`, `Item14`, `Quantia14`, `Item15`, `Quantia15`, `Item16`, `Quantia16`, `Item17`, `Quantia17`, `Item18`, `Quantia18`, `Item19`, `Quantia19`, `Item20`, `Quantia20`, `Item21`, `Quantia21`, `Item22`, `Quantia22`, `Item23`, `Quantia23`, `Item24`, `Quantia24`, `Item25`, `Quantia25`, `Item26`, `Quantia26`, `Item27`, `Quantia27`, `Item28`, `Quantia28`, `Item29`, `Quantia29`, `Item30`, `Quantia30`, `Item31`, `Quantia31`, `Item32`, `Quantia32`, `Item33`, `Quantia33`, `Item34`, `Quantia34`, `Item35`, `Quantia35`, `Item36`, `Quantia36`, `Item37`, `Quantia37`, `Item38`, `Quantia38`, `Item39`, `Quantia39`, `Item40`, `Quantia40`, `Item41`, `Quantia41`, `Item42`, `Quantia42`, `Item43`, `Quantia43`, `Item44`, `Quantia44`, `Item45`, `Quantia45`, `Item46`, `Quantia46`, `Item47`, `Quantia47`, `Item48`, `Quantia48`, `Item49`, `Quantia49`, `Item50`, `Quantia50`, `Item51`, `Quantia51`, `Item52`, `Quantia52`, `Item53`, `Quantia53`, `Item54`, `Quantia54`, `Item55`, `Quantia55`, `Item56`, `Quantia56`, `Item57`, `Quantia57`, `Item58`, `Quantia58`, `Item59`, `Quantia59`) VALUES
(0, 795.053, -1692.03, 14.4633, 2333.03, -1073.96, 1049.02, 6, 'Ninguem', 0, 0, 'Ninguem', 'Ninguem', 'Ninguem', 'Ninguem', 50000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, -2312.46, -1624.57, 483.962, 2748.02, -2467.84, 1030.59, 0, 'Ninguem', 0, 0, 'Ninguem', 'Ninguem', 'Ninguem', 'Ninguem', 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 795.053, -1692.03, 14.4633, 2333.03, -1073.96, 1049.02, 6, 'Ninguem', 0, 0, 'Ninguem', 'Ninguem', 'Ninguem', 'Ninguem', 50000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, -2312.46, -1624.57, 483.962, 2748.02, -2467.84, 1030.59, 0, 'Ninguem', 0, 0, 'Ninguem', 'Ninguem', 'Ninguem', 'Ninguem', 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conce`
--

CREATE TABLE `conce` (
  `vehid` int(11) DEFAULT 0,
  `Nome` varchar(25) DEFAULT NULL,
  `Veiculo` int(11) DEFAULT 0,
  `X` double DEFAULT 0,
  `Y` double DEFAULT 0,
  `Z` double DEFAULT 0,
  `Rotacao` double DEFAULT 0,
  `Cor1` int(11) DEFAULT 0,
  `Cor2` int(11) DEFAULT 0,
  `Placa` text DEFAULT NULL,
  `Pneu1` int(11) DEFAULT 0,
  `Pneu2` int(11) DEFAULT 0,
  `Pneu3` int(11) DEFAULT 0,
  `Pneu4` int(11) DEFAULT 0,
  `Desmanchado` int(11) DEFAULT 0,
  `Quebrado` int(11) DEFAULT 0,
  `IPVA` int(11) DEFAULT 0,
  `Gasolina` int(11) DEFAULT 0,
  `Apreendido` int(11) DEFAULT 0,
  `VehVw` int(11) DEFAULT 0,
  `KMR` double DEFAULT 0,
  `Componente0` int(11) DEFAULT 0,
  `Componente1` int(11) DEFAULT 0,
  `Componente2` int(11) DEFAULT 0,
  `Componente3` int(11) DEFAULT 0,
  `Componente4` int(11) DEFAULT 0,
  `Componente5` int(11) DEFAULT 0,
  `Componente6` int(11) DEFAULT 0,
  `Componente7` int(11) DEFAULT 0,
  `Componente8` int(11) DEFAULT 0,
  `Componente9` int(11) DEFAULT 0,
  `Componente10` int(11) DEFAULT 0,
  `Componente11` int(11) DEFAULT 0,
  `Componente12` int(11) DEFAULT 0,
  `Item0` int(11) DEFAULT 18631,
  `Quantia0` int(11) DEFAULT 0,
  `Item1` int(11) DEFAULT 18631,
  `Quantia1` int(11) DEFAULT 0,
  `Item2` int(11) DEFAULT 18631,
  `Quantia2` int(11) DEFAULT 0,
  `Item3` int(11) DEFAULT 18631,
  `Quantia3` int(11) DEFAULT 0,
  `Item4` int(11) DEFAULT 18631,
  `Quantia4` int(11) DEFAULT 0,
  `Item5` int(11) DEFAULT 18631,
  `Quantia5` int(11) DEFAULT 0,
  `Item6` int(11) DEFAULT 18631,
  `Quantia6` int(11) DEFAULT 0,
  `Item7` int(11) DEFAULT 18631,
  `Quantia7` int(11) DEFAULT 0,
  `Item8` int(11) DEFAULT 18631,
  `Quantia8` int(11) DEFAULT 0,
  `Item9` int(11) DEFAULT 18631,
  `Quantia9` int(11) DEFAULT 0,
  `Item10` int(11) DEFAULT 18631,
  `Quantia10` int(11) DEFAULT 0,
  `Item11` int(11) DEFAULT 18631,
  `Quantia11` int(11) DEFAULT 0,
  `Item12` int(11) DEFAULT 18631,
  `Quantia12` int(11) DEFAULT 0,
  `Item13` int(11) DEFAULT 18631,
  `Quantia13` int(11) DEFAULT 0,
  `Item14` int(11) DEFAULT 18631,
  `Quantia14` int(11) DEFAULT 0,
  `Item15` int(11) DEFAULT 18631,
  `Quantia15` int(11) DEFAULT 0,
  `Item16` int(11) DEFAULT 18631,
  `Quantia16` int(11) DEFAULT 0,
  `Item17` int(11) DEFAULT 18631,
  `Quantia17` int(11) DEFAULT 0,
  `Item18` int(11) DEFAULT 18631,
  `Quantia18` int(11) DEFAULT 0,
  `Item19` int(11) DEFAULT 18631,
  `Quantia19` int(11) DEFAULT 0,
  `Item20` int(11) DEFAULT 18631,
  `Quantia20` int(11) DEFAULT 0,
  `Item21` int(11) DEFAULT 18631,
  `Quantia21` int(11) DEFAULT 0,
  `Item22` int(11) DEFAULT 18631,
  `Quantia22` int(11) DEFAULT 0,
  `Item23` int(11) DEFAULT 18631,
  `Quantia23` int(11) DEFAULT 0,
  `Item24` int(11) DEFAULT 18631,
  `Quantia24` int(11) DEFAULT 0,
  `Item25` int(11) DEFAULT 18631,
  `Quantia25` int(11) DEFAULT 0,
  `Item26` int(11) DEFAULT 18631,
  `Quantia26` int(11) DEFAULT 0,
  `Item27` int(11) DEFAULT 18631,
  `Quantia27` int(11) DEFAULT 0,
  `Item28` int(11) DEFAULT 18631,
  `Quantia28` int(11) DEFAULT 0,
  `Item29` int(11) DEFAULT 18631,
  `Quantia29` int(11) DEFAULT 0,
  `Item30` int(11) DEFAULT 18631,
  `Quantia30` int(11) DEFAULT 0,
  `Item31` int(11) DEFAULT 18631,
  `Quantia31` int(11) DEFAULT 0,
  `Item32` int(11) DEFAULT 18631,
  `Quantia32` int(11) DEFAULT 0,
  `Item33` int(11) DEFAULT 18631,
  `Quantia33` int(11) DEFAULT 0,
  `Item34` int(11) DEFAULT 18631,
  `Quantia34` int(11) DEFAULT 0,
  `Item35` int(11) DEFAULT 18631,
  `Quantia35` int(11) DEFAULT 0,
  `Item36` int(11) DEFAULT 18631,
  `Quantia36` int(11) DEFAULT 0,
  `Item37` int(11) DEFAULT 18631,
  `Quantia37` int(11) DEFAULT 0,
  `Item38` int(11) DEFAULT 18631,
  `Quantia38` int(11) DEFAULT 0,
  `Item39` int(11) DEFAULT 18631,
  `Quantia39` int(11) DEFAULT 0,
  `Item40` int(11) DEFAULT 18631,
  `Quantia40` int(11) DEFAULT 0,
  `Item41` int(11) DEFAULT 18631,
  `Quantia41` int(11) DEFAULT 0,
  `Item42` int(11) DEFAULT 18631,
  `Quantia42` int(11) DEFAULT 0,
  `Item43` int(11) DEFAULT 18631,
  `Quantia43` int(11) DEFAULT 0,
  `Item44` int(11) DEFAULT 18631,
  `Quantia44` int(11) DEFAULT 0,
  `Item45` int(11) DEFAULT 18631,
  `Quantia45` int(11) DEFAULT 0,
  `Item46` int(11) DEFAULT 18631,
  `Quantia46` int(11) DEFAULT 0,
  `Item47` int(11) DEFAULT 18631,
  `Quantia47` int(11) DEFAULT 0,
  `Item48` int(11) DEFAULT 18631,
  `Quantia48` int(11) DEFAULT 0,
  `Item49` int(11) DEFAULT 18631,
  `Quantia49` int(11) DEFAULT 0,
  `Item50` int(11) DEFAULT 18631,
  `Quantia50` int(11) DEFAULT 0,
  `Item51` int(11) DEFAULT 18631,
  `Quantia51` int(11) DEFAULT 0,
  `Item52` int(11) DEFAULT 18631,
  `Quantia52` int(11) DEFAULT 0,
  `Item53` int(11) DEFAULT 18631,
  `Quantia53` int(11) DEFAULT 0,
  `Item54` int(11) DEFAULT 18631,
  `Quantia54` int(11) DEFAULT 0,
  `Item55` int(11) DEFAULT 18631,
  `Quantia55` int(11) DEFAULT 0,
  `Item56` int(11) DEFAULT 18631,
  `Quantia56` int(11) DEFAULT 0,
  `Item57` int(11) DEFAULT 18631,
  `Quantia57` int(11) DEFAULT 0,
  `Item58` int(11) DEFAULT 18631,
  `Quantia58` int(11) DEFAULT 0,
  `Item59` int(11) DEFAULT 18631,
  `Quantia59` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conce`
--

INSERT INTO `conce` (`vehid`, `Nome`, `Veiculo`, `X`, `Y`, `Z`, `Rotacao`, `Cor1`, `Cor2`, `Placa`, `Pneu1`, `Pneu2`, `Pneu3`, `Pneu4`, `Desmanchado`, `Quebrado`, `IPVA`, `Gasolina`, `Apreendido`, `VehVw`, `KMR`, `Componente0`, `Componente1`, `Componente2`, `Componente3`, `Componente4`, `Componente5`, `Componente6`, `Componente7`, `Componente8`, `Componente9`, `Componente10`, `Componente11`, `Componente12`, `Item0`, `Quantia0`, `Item1`, `Quantia1`, `Item2`, `Quantia2`, `Item3`, `Quantia3`, `Item4`, `Quantia4`, `Item5`, `Quantia5`, `Item6`, `Quantia6`, `Item7`, `Quantia7`, `Item8`, `Quantia8`, `Item9`, `Quantia9`, `Item10`, `Quantia10`, `Item11`, `Quantia11`, `Item12`, `Quantia12`, `Item13`, `Quantia13`, `Item14`, `Quantia14`, `Item15`, `Quantia15`, `Item16`, `Quantia16`, `Item17`, `Quantia17`, `Item18`, `Quantia18`, `Item19`, `Quantia19`, `Item20`, `Quantia20`, `Item21`, `Quantia21`, `Item22`, `Quantia22`, `Item23`, `Quantia23`, `Item24`, `Quantia24`, `Item25`, `Quantia25`, `Item26`, `Quantia26`, `Item27`, `Quantia27`, `Item28`, `Quantia28`, `Item29`, `Quantia29`, `Item30`, `Quantia30`, `Item31`, `Quantia31`, `Item32`, `Quantia32`, `Item33`, `Quantia33`, `Item34`, `Quantia34`, `Item35`, `Quantia35`, `Item36`, `Quantia36`, `Item37`, `Quantia37`, `Item38`, `Quantia38`, `Item39`, `Quantia39`, `Item40`, `Quantia40`, `Item41`, `Quantia41`, `Item42`, `Quantia42`, `Item43`, `Quantia43`, `Item44`, `Quantia44`, `Item45`, `Quantia45`, `Item46`, `Quantia46`, `Item47`, `Quantia47`, `Item48`, `Quantia48`, `Item49`, `Quantia49`, `Item50`, `Quantia50`, `Item51`, `Quantia51`, `Item52`, `Quantia52`, `Item53`, `Quantia53`, `Item54`, `Quantia54`, `Item55`, `Quantia55`, `Item56`, `Quantia56`, `Item57`, `Quantia57`, `Item58`, `Quantia58`, `Item59`, `Quantia59`) VALUES
(0, 'Joao_Borges', 410, 2242.081787, -1237.699097, 56.645603, 358.213165, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0.549318, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 'Joao_Borges', 541, 938.950745, -1773.159546, 24.305351, 73.734879, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 98, 0, 0, 32914.976563, 0, 0, 0, 0, 0, 0, 0, 1084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas`
--

CREATE TABLE `contas` (
  `userid` int(11) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `Skin` int(11) DEFAULT NULL,
  `TipoPrisao` int(11) DEFAULT NULL,
  `Genero` int(11) DEFAULT NULL,
  `Trabalho` int(11) DEFAULT NULL,
  `DinheiroPD` int(11) DEFAULT NULL,
  `Admin` int(11) DEFAULT NULL,
  `Fome` int(11) DEFAULT NULL,
  `Sede` int(11) DEFAULT NULL,
  `VoipMutado` int(11) DEFAULT NULL,
  `VezesPreso` int(11) DEFAULT NULL,
  `Org` int(11) DEFAULT NULL,
  `Cargo` int(11) DEFAULT NULL,
  `Nivel` int(11) DEFAULT NULL,
  `DeathX` float DEFAULT NULL,
  `DeathY` float DEFAULT NULL,
  `DeathZ` float DEFAULT NULL,
  `DeathInterior` int(11) DEFAULT NULL,
  `DeathVirtualWorld` int(11) DEFAULT NULL,
  `Ferido` int(11) DEFAULT NULL,
  `Xp` int(11) DEFAULT NULL,
  `Vip` int(11) DEFAULT NULL,
  `TempoVip` int(11) DEFAULT NULL,
  `Prisao` int(11) DEFAULT NULL,
  `Cash` int(11) DEFAULT NULL,
  `Px` float DEFAULT NULL,
  `Py` float DEFAULT NULL,
  `Pz` float DEFAULT NULL,
  `Interior` int(11) DEFAULT NULL,
  `VirtualWorld` int(11) DEFAULT NULL,
  `CadeiaStaff` int(11) DEFAULT NULL,
  `HorasJogadas` int(11) DEFAULT NULL,
  `Procurado` int(11) DEFAULT NULL,
  `Dinheiro` int(20) DEFAULT 0,
  `MotivoCadeia` varchar(32) DEFAULT NULL,
  `TituloPersonalizado` varchar(90) DEFAULT NULL,
  `Titulo` varchar(90) DEFAULT NULL,
  `UltimoLogin` varchar(32) DEFAULT NULL,
  `Ip` varchar(16) DEFAULT NULL,
  `Senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contas`
--

INSERT INTO `contas` (`userid`, `Nome`, `Skin`, `TipoPrisao`, `Genero`, `Trabalho`, `DinheiroPD`, `Admin`, `Fome`, `Sede`, `VoipMutado`, `VezesPreso`, `Org`, `Cargo`, `Nivel`, `DeathX`, `DeathY`, `DeathZ`, `DeathInterior`, `DeathVirtualWorld`, `Ferido`, `Xp`, `Vip`, `TempoVip`, `Prisao`, `Cash`, `Px`, `Py`, `Pz`, `Interior`, `VirtualWorld`, `CadeiaStaff`, `HorasJogadas`, `Procurado`, `Dinheiro`, `MotivoCadeia`, `TituloPersonalizado`, `Titulo`, `UltimoLogin`, `Ip`, `Senha`) VALUES
(1, 'Joao_Borges', 15, 0, 1, 0, 0, 11, 100, 100, 0, 0, 6, 10, 99, 1887.29, -2044.94, 13.654, 0, 0, 0, 21, 3, 1703467170, 0, 75, 1123.14, -1753.65, 13.576, 0, 0, 0, 0, 18, 124395, '', '', '', '20/12/2023 as 13:34', '138.94.170.75', 'removi'),
(8, 'Edkun2', 26, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1161.29, -1753.75, 13.607, 0, 0, 0, 0, 0, 0, '', '', '', '20/9/2023 as 17:38', '177.13.176.183', 'f34ca95ad1161dccb19ce894f8fa912'),
(9, 'Beck', 40, 0, 1, 6, 0, 11, 14, 19, 0, 0, 16, 10, 6, 1099.95, -949.469, 42.643, 0, 0, 0, 7, 0, 0, 0, 12, 809.213, -1658.58, 13.383, 0, 0, 0, 0, 14, 5692, '', '', '{0006FF}Desenvolvedor', '19/12/2023 as 19:29', '187.62.83.125', '01245249dfe9f508adee1293481ecd5'),
(10, 'Uel777', 15, 0, 1, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1413.13, -1600.22, 14.354, 0, 0, 0, 0, 0, 0, '', '', '', '22/9/2023 as 19:48', '131.0.206.91', '82df20ba28ef6e6c31564ec41e6a04b'),
(11, 'PEDRO_ZLPP', 26, 0, 1, 0, 0, 11, 4, 7, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3, 1695653870, 0, 16, 2252.95, -1656.36, 15.284, 0, 0, 0, 0, 0, 2105, '', '', '', '24/9/2023 as 12:16', '131.0.224.93', '19f44dbc11966b412cb191b36e506ff'),
(12, 'PEDRO_ZLPPP', 40, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3585.57, 548.125, 1519.53, 0, 0, 0, 0, 0, 500, '', '', '', '24/9/2023 as 11:45', '131.0.224.93', '7f7c54fb0ae2910f0e1d5d8c042a110'),
(14, 'Pamonhaon', 40, 0, 0, 0, 0, 0, 9, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3585.58, 548.125, 1226.27, 0, 0, 0, 0, 0, 570, '', '', '', '28/9/2023 as 20:35', '127.0.0.1', 'c965492a50b519451be98427ea60397'),
(15, 'joaotestes', 15, 0, 1, 0, 0, 1, 5, 7, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 961.711, -1780.62, 14.611, 0, 0, 0, 0, 0, -99999429, '', '', '', '2/10/2023 as 16:29', '138.94.170.118', 'cb42e130d1471239a27fca6228094f0'),
(16, 'joaotestesh', 40, 0, 1, 0, 0, 1, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1150.04, -1752.66, 13.595, 0, 0, 0, 0, 0, 500, '', '', '', '3/10/2023 as 12:12', '138.94.170.118', 'cb42e130d1471239a27fca6228094f0'),
(17, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 'c965492a50b519451be98427ea60397'),
(18, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '3691308f2a4c2f6983f2880d32e29c8'),
(19, 'Joao_Borgesdoisf', 15, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1153.05, -1752.21, 13.589, 0, 0, 0, 0, 0, 500, '', '', '', '17/10/2023 as 13:46', '138.94.170.77', 'c965492a50b519451be98427ea60397'),
(20, 'Joao_Bg', 40, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168.35, -1692.81, 22.234, 0, 0, 0, 0, 0, 500, '', '', '', '17/10/2023 as 13:54', '138.94.170.77', 'c965492a50b519451be98427ea60397'),
(22, 'Joao_Bg2', 40, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1170.99, -1699.6, 22.234, 0, 0, 0, 0, 0, 500, '', '', '', '17/10/2023 as 14:4', '138.94.170.77', 'c965492a50b519451be98427ea60397'),
(23, 'Joao_Bg2ffg', 40, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168.2, -1690.11, 23.134, 0, 0, 0, 0, 0, 500, '', '', '', '17/10/2023 as 14:5', '138.94.170.77', 'c965492a50b519451be98427ea60397'),
(24, 'Joao_Bg2ffgs', 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168.2, -1690.11, 23.135, 0, 0, 0, 0, 0, 500, '', '', '', '17/10/2023 as 14:6', '138.94.170.77', 'e97752fff31c71ec88a0e6ca761fa62'),
(25, 'Joao_Bg2ffgsv', 40, 0, 1, 0, 0, 0, 8, 10, 0, 0, 0, 0, 0, 1155.05, -1740.79, 13.404, 0, 0, 0, 0, 0, 0, 0, 0, 1155.05, -1740.79, 13.404, 0, 0, 0, 0, 0, 500, '', '', '', '17/10/2023 as 15:40', '138.94.170.77', 'de3ec0aa2234aa1e3ee275bbc715c6c'),
(26, 'zFynn.', 40, 0, 1, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 251.021, -1606.06, 33.889, 0, 0, 0, 0, 0, 0, 0, 0, 1463.4, -1353.49, 281.278, 0, 0, 0, 0, 0, 500, '', '', '', '25/10/2023 as 11:49', '138.99.41.49', '5a96b0d01b1156686ed6448a1cf82ad'),
(27, 'ZonaOeste', 12, 0, 1, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1723.15, -989.748, 37.1, 0, 0, 0, 0, 0, 500, '', '', '', '23/10/2023 as 13:10', '187.62.83.103', 'b980d09466586b3ac55e0715c9d3e6d'),
(28, 'Zezin', 26, 0, 1, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2506.18, -1508.72, 23.829, 0, 0, 0, 0, 0, 500, '', '', '', '23/10/2023 as 13:21', '187.62.83.103', '698dc19d489c4e4db73e28a713eab07'),
(29, 'Zero', 15, 0, 1, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1193.11, -1312.88, 13.398, 0, 0, 0, 0, 0, 500, '', '', '', '23/10/2023 as 14:54', '187.62.83.103', '01245249dfe9f508adee1293481ecd5'),
(30, 'Joao_Borgesjrjr', 26, 0, 2, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 2425.69, -1744.41, 22.767, 0, 0, 0, 0, 0, 0, 0, 0, 3585.5, 547.848, 1519.53, 0, 0, 0, 0, 0, 500, '', '', '', '23/10/2023 as 15:50', '138.94.170.76', '21140bc58be4e647b5da29ad2ef7a90'),
(31, 'Teste', 12, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1215.97, -1707.65, 13.383, 0, 0, 0, 0, 0, 500, '', '', '', '24/10/2023 as 10:5', '187.62.83.103', '01245249dfe9f508adee1293481ecd5'),
(32, 'Joao_Borgeskkkk', 26, 0, 1, 0, 0, 0, 9, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1162.07, -1735.67, 13.773, 0, 0, 0, 0, 0, 500, '', '', '', '27/10/2023 as 17:50', '138.94.170.114', '21140bc58be4e647b5da29ad2ef7a90'),
(33, 'Joao_Fake', 40, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1156, -1736.34, 13.577, 0, 0, 0, 0, 0, 500, '', '', '', '28/10/2023 as 11:16', '138.94.170.116', 'c965492a50b519451be98427ea60397'),
(34, 'yMarKin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168.2, -1690.1, 23.136, 0, 0, 0, 0, 0, 0, '', '', '', '30/10/2023 as 11:41', '138.99.41.51', '5a96b0d01b1156686ed6448a1cf82ad'),
(35, 'Fawkes', 26, 0, 1, 0, 0, 0, 3, 4, 0, 0, 0, 0, 1, 390.769, 173.771, 10.561, 0, 0, 0, 0, 0, 0, 0, 0, 1177.45, -1735.02, 13.641, 0, 0, 0, 0, 0, 570, '', '', '', '31/10/2023 as 22:10', '187.19.242.96', '970d2bee901e9e53b8b40bbc026790e'),
(36, 'nobodymi_', 12, 0, 1, 0, 0, 0, 8, 11, 0, 0, 0, 0, 1, 1940.71, -1771.34, 13.547, 0, 0, 0, 0, 0, 0, 0, 0, 1296.07, -1642.96, 13.383, 0, 0, 0, 0, 0, 10000569, '', '', '', '1/11/2023 as 23:18', '200.138.129.208', 'd586b0473cc83cf5fb911cfdc5b878a'),
(37, 'Joao_2dois', 12, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1157.61, -1741.84, 13.398, 0, 0, 0, 0, 0, 500, '', '', '', '1/11/2023 as 23:0', '138.94.170.77', '21140bc58be4e647b5da29ad2ef7a90'),
(38, 'asdasd', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168.2, -1690.11, 23.135, 0, 0, 0, 0, 0, 0, '', '', '', '11/11/2023 as 23:38', '138.94.170.68', 'd41d8cd98f00b204e9800998ecf8427'),
(44, 'Jaumbundinha', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168.2, -1690.1, 23.136, 0, 0, 0, 0, 0, 0, '', '', '', '16/11/2023 as 11:41', '138.94.170.74', '8de1bf73885e7c7b278e4a11ff65ce7'),
(45, 'leo36', 26, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3532.39, 525.75, -1.83, 0, 0, 0, 0, 0, 500, '', '', '', '18/11/2023 as 19:43', '190.92.25.121', '4edfc493d520c8a37bb5ff5bdc6fbd0'),
(46, 'Carlos_Augusto', 26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1152.59, -1757.54, 13.651, 0, 0, 0, 0, 0, 500, '', '', '', '24/11/2023 as 17:36', '138.94.170.119', '21140bc58be4e647b5da29ad2ef7a90'),
(47, 'Rian_Lourete', 15, 0, 1, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3585.58, 548.125, 1216.52, 0, 0, 0, 0, 0, 500, '', '', '', '24/11/2023 as 17:47', '187.120.47.255', 'cb2b28afc2cc836b33eb7ed86f99e65'),
(48, 'Absolute_', 15, 0, 1, 0, 0, 0, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1164.81, -1696.17, 22.234, 0, 0, 0, 0, 0, 500, '', '', '', '12/12/2023 as 10:27', '138.99.42.25', '5a96b0d01b1156686ed6448a1cf82ad'),
(49, 'Jaum_Chupetinha', 12, 0, 2, 0, 0, 0, 4, 7, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1840.39, -1430.69, 13.563, 0, 0, 0, 0, 0, 570, '', '', '', '11/12/2023 as 13:49', '177.223.21.219', '783660c2b880e2c239fd81f6659f16a'),
(50, 'Ramon_Slow', 15, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191.82, -1712.68, 13.383, 0, 0, 0, 0, 0, 500, '', '', '', '25/11/2023 as 13:59', '189.38.44.241', '2b9cdebb444dbb2fe8380860104f057'),
(51, '[Mr]Sanchez', 26, 0, 1, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -76.233, -557.957, 3.495, 0, 0, 0, 0, 0, 500, '', '', '', '2/12/2023 as 18:40', '2.83.168.14', '6253e1406b64bbe6ba7b00ac0bf8125'),
(52, 'bartolo_simpson', 15, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1136.19, -1714.78, 13.66, 0, 0, 0, 0, 0, 500, '', '', '', '4/12/2023 as 20:26', '181.89.206.126', '9ef709492f5b4731b35743da0759cb8'),
(53, 'Feelipe', 15, 0, 1, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1868.08, -1474.63, 13.543, 0, 0, 0, 0, 0, 500, '', '', '', '8/12/2023 as 12:56', '138.99.42.25', '58a43ba0d3097548ed402d0d463159b'),
(54, 'Igor_Costa', 40, 0, 1, 0, 0, 0, 7, 9, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -118.14, -1120.34, 2.821, 0, 0, 0, 0, 0, -430, '', '', '', '12/12/2023 as 16:3', '177.152.147.21', '350e5986dd1112a69a49c1a1f788c54'),
(55, 'teste1515', 15, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 519.816, -1590.07, 15.626, 0, 0, 0, 0, 0, 500, '', '', '', '14/12/2023 as 19:15', '187.62.80.203', '827ccb0eea8a706c4c34a16891f84e7'),
(56, 'teste151515', 40, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 628.201, -1515.39, 14.864, 0, 0, 0, 0, 0, 500, '', '', '', '14/12/2023 as 19:16', '187.62.80.203', '827ccb0eea8a706c4c34a16891f84e7'),
(57, 'zenyx', 12, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1099.23, -1633.38, 13.608, 0, 0, 0, 0, 0, 570, '', '', '', '15/12/2023 as 21:1', '179.189.94.192', 'df780a97b7d6a8f779f14728bccd3c4'),
(58, 'Felipezwn', 26, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1210.94, -1732.75, 12.071, 0, 0, 0, 0, 0, 500, '', '', '', '16/12/2023 as 23:7', '138.99.42.25', '58a43ba0d3097548ed402d0d463159b'),
(59, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '827ccb0eea8a706c4c34a16891f84e7'),
(60, 'Borges_Android', 15, 0, 1, 0, 0, 0, 4, 7, 0, 0, 0, 0, 10, 1498.88, 721.977, -48.893, 0, 0, 0, 1, 0, 0, 0, 0, 1170.94, -1721.07, 13.675, 0, 0, 0, 0, 0, 465, '', '', '', '20/12/2023 as 10:23', '138.94.170.75', 'c965492a50b519451be98427ea60397'),
(61, 'teste1362', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168.2, -1690.11, 23.135, 0, 2, 0, 0, 0, 0, '', '', '', '18/12/2023 as 19:29', '187.62.83.125', '827ccb0eea8a706c4c34a16891f84e7');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

CREATE TABLE `empresas` (
  `Empresaid` int(11) NOT NULL,
  `EmpresaValor` int(11) DEFAULT NULL,
  `EmpresaNome` text DEFAULT NULL,
  `EmpresaComprada` int(11) DEFAULT 0,
  `EmpresaDono` text DEFAULT NULL,
  `EmpresaPorcentagem` int(11) DEFAULT NULL,
  `EmpresaX` float DEFAULT NULL,
  `EmpresaY` float DEFAULT NULL,
  `EmpresaZ` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `empresas`
--

INSERT INTO `empresas` (`Empresaid`, `EmpresaValor`, `EmpresaNome`, `EmpresaComprada`, `EmpresaDono`, `EmpresaPorcentagem`, `EmpresaX`, `EmpresaY`, `EmpresaZ`) VALUES
(1, 30000, 'Uber', 0, NULL, 4000, 619.693, -1497.89, 14.8465),
(2, 25000, 'Mecanica ', 0, NULL, 800, 1840.5, -1429.65, 13.5625),
(3, 45000, 'Estacionamento', 0, NULL, 1000, 1071.64, -1780.85, 13.6097);

-- --------------------------------------------------------

--
-- Estrutura para tabela `gangzones`
--

CREATE TABLE `gangzones` (
  `gzid` int(11) NOT NULL,
  `Gzx` float DEFAULT NULL,
  `Gzy` float DEFAULT NULL,
  `Gzxx` float DEFAULT NULL,
  `Gzyy` float DEFAULT NULL,
  `DonoGz` int(11) DEFAULT 0,
  `GZNome` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gangzones`
--

INSERT INTO `gangzones` (`gzid`, `Gzx`, `Gzy`, `Gzxx`, `Gzyy`, `DonoGz`, `GZNome`) VALUES
(2, 1978, -1077.5, 2590, -930.5, 0, 'Favelinha'),
(3, 1860, -1245.5, 2057, -1145.5, 0, 'Parque Uniao'),
(4, 1860, -1145.5, 1978, -977.5, 0, 'Vila dos Pelados'),
(5, 2157, -1207.5, 2252, -1077.5, 0, 'Motel Jefferson'),
(6, 2057, -1207.5, 2157, -1077.5, 0, 'Conce. Jefferson'),
(7, 2062, -1377.5, 2257, -1212.5, 0, 'Vila Isabel'),
(8, 1978, -1145.5, 2057, -1077.5, 0, 'R. da Facada'),
(9, 1860, -1342.5, 2062, -1249.5, 0, 'Urbano'),
(10, 2252, -1172.5, 2590, -1077.5, 0, 'Mirante Baixo'),
(11, 1860, -1482.5, 2062, -1342.5, 0, 'Pista das Relações'),
(12, 2257, -1377.5, 2351, -1177.5, 0, 'Trilho'),
(13, 2062, -1482.5, 2351, -1377.5, 0, 'Palmital'),
(14, 2357, -1377.5, 2457, -1258.5, 0, 'Restrito'),
(15, 2357, -1258.5, 2503, -1177.5, 0, 'Puteiro'),
(16, 1685, -1954.5, 1814, -1854.5, 0, 'Estacao'),
(17, 1814, -1954.5, 1954, -1854.5, 0, 'Ilhados'),
(18, 1814, -2054.5, 1954, -1954.5, 0, 'Restrito'),
(19, 1954, -1954.5, 2094, -1854.5, 6, 'Esgoto'),
(20, 1954, -2054.5, 2094, -1954.5, 0, 'Reciclagem'),
(21, 1814, -1854.5, 1954, -1754.5, 0, 'Tulio'),
(22, 1954, -1854.5, 2094, -1754.5, 0, 'Interbairros'),
(23, 2218, -1975.48, 2410, -1875.48, 0, 'Restrito'),
(24, 2094, -2054.5, 2214, -1954.5, 0, 'Lixao'),
(25, 2094, -1954.5, 2214, -1854.5, 0, 'Divisa'),
(26, 2094, -1854.5, 2213, -1754.5, 6, 'Centro'),
(27, 2218, -1871.48, 2428, -1749.48, 0, 'Cohab'),
(28, 1685, -2054.5, 1814, -1954.5, 0, 'Despacho'),
(29, 1685, -2154.48, 1954, -2054.48, 0, 'Vila Esperanca'),
(30, 1954, -2154.5, 2214, -2054.5, 0, 'Deposito'),
(31, 1954, -1750.5, 2095, -1488.5, 1, 'Bairro Cosmos'),
(32, 1813, -1750.5, 1954, -1488.5, 0, 'Alhambra'),
(33, 2357, -1488.5, 2457, -1377.5, 0, 'Lava Car'),
(34, 2357, -1553.5, 2457, -1488.5, 0, 'Comercio'),
(35, 2218, -1553.5, 2351, -1482.5, 0, 'Quadra'),
(36, 2095, -1750.5, 2213, -1488.5, 1, 'Cohab 2'),
(37, 2457, -1436.5, 2557, -1258.5, 0, 'Cohab 3'),
(38, 2503, -1258.5, 2709, -1177.5, 0, 'Brejo'),
(39, 2457, -1553.5, 2557, -1436.5, 0, 'Nemo'),
(40, 2557, -1358.5, 2709, -1258.5, 0, 'Descida 1'),
(41, 2557, -1459.5, 2709, -1358.5, 0, 'Descida 2'),
(42, 2557, -1553.5, 2709, -1459.5, 0, 'Descida 3'),
(43, 2716, -1631.5, 2876, -1033.5, 0, 'Beira-Mar'),
(44, 2218, -1636.47, 2708, -1560.47, 0, 'Ponte'),
(45, 2218, -1749.48, 2318, -1636.48, 0, 'Acesso 2'),
(46, 2316, -1749.48, 2427, -1636.48, 0, 'Acesso 1'),
(47, 2219, -2152.48, 2410, -1975.48, 0, 'Fabricas'),
(48, 2590, -1172.5, 2710, -1033.5, 0, 'Mirante Alto'),
(49, 2428, -1871.48, 2537, -1749.48, 0, 'Fundos'),
(50, 2410, -2038.48, 2608, -1875.48, 0, 'Jardim da Paz'),
(51, 2608, -2152.48, 2869, -1875.48, 0, 'Acacias'),
(52, 2537, -1871.47, 2629, -1636.47, 0, 'Esgotao'),
(53, 2629, -1871.47, 2869, -1636.47, 0, 'Maracana'),
(54, 2427, -1749.48, 2537, -1636.48, 0, 'Groove'),
(55, 2410, -2152.47, 2608, -2038.47, 0, 'Deposito 2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `garagens`
--

CREATE TABLE `garagens` (
  `Garagemid` int(11) NOT NULL DEFAULT 0,
  `GaragemX` double DEFAULT 0,
  `GaragemY` double DEFAULT 0,
  `GaragemZ` double DEFAULT 0,
  `GaragemDono` varchar(25) DEFAULT NULL,
  `GaragemPreco` int(11) DEFAULT 0,
  `GaragemComprada` int(11) DEFAULT 0,
  `GaragemTrancada` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gps`
--

CREATE TABLE `gps` (
  `gpsid` int(11) NOT NULL DEFAULT 0,
  `LocalName` varchar(255) DEFAULT NULL,
  `LocalX` double DEFAULT 0,
  `LocalY` double DEFAULT 0,
  `LocalZ` double DEFAULT 0,
  `LocalTipo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gps`
--

INSERT INTO `gps` (`gpsid`, `LocalName`, `LocalX`, `LocalY`, `LocalZ`, `LocalTipo`) VALUES
(0, 'Mecanica', 1838.349976, -1425.123535, 13.5625, 3),
(1, 'Agencia Geral', 1214.077637, -1748.145996, 13.594746, 1),
(2, 'Ammunation Spawn', 875.733887, -1565.032471, 13.533446, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `habs`
--

CREATE TABLE `habs` (
  `Nome` varchar(25) NOT NULL,
  `Carro` int(11) DEFAULT 0,
  `Moto` int(11) DEFAULT 0,
  `Aviao` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `interiores`
--

CREATE TABLE `interiores` (
  `NomeInterior` varchar(50) DEFAULT NULL,
  `Interiorid` int(11) DEFAULT 0,
  `VirtualWorld` int(11) DEFAULT 0,
  `IntX` double DEFAULT 0,
  `IntY` double DEFAULT 0,
  `IntZ` double DEFAULT 0,
  `IntsX` double DEFAULT 0,
  `IntsY` double DEFAULT 0,
  `IntsZ` double DEFAULT 0,
  `TipoIcon` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `interiores`
--

INSERT INTO `interiores` (`NomeInterior`, `Interiorid`, `VirtualWorld`, `IntX`, `IntY`, `IntZ`, `IntsX`, `IntsY`, `IntsZ`, `TipoIcon`) VALUES
('Pizzaria', 9, 8, 2105.488037, -1806.52478, 13.554688, 364.341705, -11.589783, 1001.851563, 29),
('Mercado do Posto', 10, 9, 1928.581421, -1776.190796, 13.546875, 2425.689453, -1744.413574, 313.741394, 17),
('trt', 0, 7, 197.408157, -1812.563965, 4.472631, 1523.219238, 1506.832886, 10.8861, 19),
('Carro Forte', 0, 6, 1712.983032, 913.081848, 10.820312, -987.073914, 1480.575195, 1336.199951, 52),
('Hospital', 0, 10, 1172.079102, -1323.678711, 15.403473, -925.611328, 396.478088, 1400.188843, 22),
('Binco', 0, 2, 2244.289795, -1665.538452, 15.476562, 1538.604248, 1555.734619, 10.925, 45),
('Banco ZonaOeste', 0, 11, 1462.52771, -1021.136597, 24.074345, 304.702911, 1329.634399, 2023.838013, 52),
('Mercado Negro', 0, 13, 2048.971191, -1781.546387, 13.546875, 1078.981689, 937.389221, 1604.866333, 0),
('Pizzaria', 9, 8, 2105.488037, -1806.52478, 13.554688, 364.341705, -11.589783, 1001.851563, 29),
('Mercado do Posto', 10, 9, 1928.581421, -1776.190796, 13.546875, 2425.689453, -1744.413574, 313.741394, 17),
('trt', 0, 7, 197.408157, -1812.563965, 4.472631, 1523.219238, 1506.832886, 10.8861, 19),
('Carro Forte', 0, 6, 1712.983032, 913.081848, 10.820312, -987.073914, 1480.575195, 1336.199951, 52),
('Hospital', 0, 10, 1172.079102, -1323.678711, 15.403473, -925.611328, 396.478088, 1400.188843, 22),
('Binco', 0, 2, 2244.289795, -1665.538452, 15.476562, 1538.604248, 1555.734619, 10.925, 45),
('Banco ZonaOeste', 0, 11, 1462.52771, -1021.136597, 24.074345, 304.702911, 1329.634399, 2023.838013, 52),
('Mercado Negro', 0, 13, 2048.971191, -1781.546387, 13.546875, 1078.981689, 937.389221, 1604.866333, 0),
('Concessionaria LS', 1, 1, 2131.822754, -1151.324585, 24.060066, -2253.993408, 3399.657227, 734.374084, 55),
('Agencia Geral', 10, 3, 1214.005371, -1748.391968, 13.594728, 1504.849487, 728.721985, -48.890999, 40),
('24/7', 10, 4, 1099.233276, -1633.381714, 13.608364, -2997.445068, 2650.840332, 1239.81543, 17),
('Loja de Roupas', 14, 5, 1099.303223, -1604.960693, 13.604721, 452.270508, 501.454987, 1001.449524, 45),
('Ammunation', 0, 12, 875.630981, -1565.058228, 13.533401, 2860.820557, 800.394714, 801.785278, 18),
('BAEP', 4, 14, 992.546814, -1505.821777, 14.640301, 251.067993, -23.911699, 1501.016846, 30),
('Cluckin Bell LS', 9, 15, 928.696838, -1352.982544, 13.34375, 364.982422, -11.836104, 1001.851563, 29);

-- --------------------------------------------------------

--
-- Estrutura para tabela `maconhas`
--

CREATE TABLE `maconhas` (
  `macid` int(11) NOT NULL,
  `MacX` float DEFAULT NULL,
  `MacY` float DEFAULT NULL,
  `MacZ` float DEFAULT NULL,
  `MacDono` varchar(25) DEFAULT NULL,
  `MacQuant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `menus`
--

CREATE TABLE `menus` (
  `Menuid` int(11) DEFAULT 0,
  `MenuX` float DEFAULT 0,
  `MenuY` float DEFAULT 0,
  `MenuZ` float DEFAULT 0,
  `TipoCompra` int(11) DEFAULT 0,
  `EmpresaMenu` int(11) DEFAULT 0,
  `MVW` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `menus`
--

INSERT INTO `menus` (`Menuid`, `MenuX`, `MenuY`, `MenuZ`, `TipoCompra`, `EmpresaMenu`, `MVW`) VALUES
(0, 367.908, -6.01653, 1001.85, 4, 0, 8),
(1, 2465.02, -1896.53, 14.016, 8, 0, 0),
(3, 362.604, 173.605, 1008.38, 3, 0, 1),
(4, 1543.66, 1550.26, 11.0538, 11, 0, 2),
(5, 1538.85, 1547.37, 10.925, 6, 0, 2),
(6, 1321.25, -893.94, 39.5781, 1, 0, 0),
(7, 1325.08, -893.789, 39.5781, 13, 0, 0),
(8, 1316.12, -894.018, 39.5781, 4, 0, 0),
(9, 1312.58, -894.116, 39.5781, 13, 0, 0),
(10, 1089.87, 949.329, 1600.99, 7, 0, 13),
(11, 1930.2, -1782.37, 13.5469, 1, 0, 0),
(0, 367.908, -6.01653, 1001.85, 4, 0, 8),
(1, 2465.02, -1896.53, 14.016, 8, 0, 0),
(3, 362.604, 173.605, 1008.38, 3, 0, 1),
(4, 1543.66, 1550.26, 11.0538, 11, 0, 2),
(5, 1538.85, 1547.37, 10.925, 6, 0, 2),
(6, 1321.25, -893.94, 39.5781, 1, 0, 0),
(7, 1325.08, -893.789, 39.5781, 13, 0, 0),
(8, 1316.12, -894.018, 39.5781, 4, 0, 0),
(9, 1312.58, -894.116, 39.5781, 13, 0, 0),
(10, 1089.87, 949.329, 1600.99, 7, 0, 13),
(11, 1930.2, -1782.37, 13.5469, 1, 0, 0),
(2, 1506.71, 711.542, -48.9141, 3, 0, 3),
(12, 1503.17, 711.541, -48.9141, 9, 0, 3),
(14, 2860.36, 789.035, 801.785, 8, 0, 12),
(15, 368.394, -6.39933, 1001.85, 4, 0, 15),
(16, 370.953, -6.90564, 1001.86, 13, 0, 15),
(13, 1505.57, 723.123, -48.891, 1, 0, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mochilas`
--

CREATE TABLE `mochilas` (
  `userid` int(11) NOT NULL,
  `TemMochila` int(11) DEFAULT 0,
  `Item0` int(11) DEFAULT 0,
  `Quantia0` int(11) DEFAULT 0,
  `Item1` int(11) DEFAULT 0,
  `Quantia1` int(11) DEFAULT 0,
  `Item2` int(11) DEFAULT 0,
  `Quantia2` int(11) DEFAULT 0,
  `Item3` int(11) DEFAULT 0,
  `Quantia3` int(11) DEFAULT 0,
  `Item4` int(11) DEFAULT 0,
  `Quantia4` int(11) DEFAULT 0,
  `Item5` int(11) DEFAULT 0,
  `Quantia5` int(11) DEFAULT 0,
  `Item6` int(11) DEFAULT 0,
  `Quantia6` int(11) DEFAULT 0,
  `Item7` int(11) DEFAULT 0,
  `Quantia7` int(11) DEFAULT 0,
  `Item8` int(11) DEFAULT 0,
  `Quantia8` int(11) DEFAULT 0,
  `Item9` int(11) DEFAULT 0,
  `Quantia9` int(11) DEFAULT 0,
  `Item10` int(11) DEFAULT 0,
  `Quantia10` int(11) DEFAULT 0,
  `Item11` int(11) DEFAULT 0,
  `Quantia11` int(11) DEFAULT 0,
  `Item12` int(11) DEFAULT 0,
  `Quantia12` int(11) DEFAULT 0,
  `Item13` int(11) DEFAULT 0,
  `Quantia13` int(11) DEFAULT 0,
  `Item14` int(11) DEFAULT 0,
  `Quantia14` int(11) DEFAULT 0,
  `Item15` int(11) DEFAULT 0,
  `Quantia15` int(11) DEFAULT 0,
  `Item16` int(11) DEFAULT 0,
  `Quantia16` int(11) DEFAULT 0,
  `Item17` int(11) DEFAULT 0,
  `Quantia17` int(11) DEFAULT 0,
  `Item18` int(11) DEFAULT 0,
  `Quantia18` int(11) DEFAULT 0,
  `Item19` int(11) DEFAULT 0,
  `Quantia19` int(11) DEFAULT 0,
  `Item20` int(11) DEFAULT 0,
  `Quantia20` int(11) DEFAULT 0,
  `Item21` int(11) DEFAULT 0,
  `Quantia21` int(11) DEFAULT 0,
  `Item22` int(11) DEFAULT 0,
  `Quantia22` int(11) DEFAULT 0,
  `Item23` int(11) DEFAULT 0,
  `Quantia23` int(11) DEFAULT 0,
  `Item24` int(11) DEFAULT 0,
  `Quantia24` int(11) DEFAULT 0,
  `Item25` int(11) DEFAULT 0,
  `Quantia25` int(11) DEFAULT 0,
  `Item26` int(11) DEFAULT 0,
  `Quantia26` int(11) DEFAULT 0,
  `Item27` int(11) DEFAULT 0,
  `Quantia27` int(11) DEFAULT 0,
  `Item28` int(11) DEFAULT 0,
  `Quantia28` int(11) DEFAULT 0,
  `Item29` int(11) DEFAULT 0,
  `Quantia29` int(11) DEFAULT 0,
  `Item30` int(11) DEFAULT 0,
  `Quantia30` int(11) DEFAULT 0,
  `Item31` int(11) DEFAULT 0,
  `Quantia31` int(11) DEFAULT 0,
  `Item32` int(11) DEFAULT 0,
  `Quantia32` int(11) DEFAULT 0,
  `Item33` int(11) DEFAULT 0,
  `Quantia33` int(11) DEFAULT 0,
  `Item34` int(11) DEFAULT 0,
  `Quantia34` int(11) DEFAULT 0,
  `Item35` int(11) DEFAULT 0,
  `Quantia35` int(11) DEFAULT 0,
  `Item36` int(11) DEFAULT 0,
  `Quantia36` int(11) DEFAULT 0,
  `Item37` int(11) DEFAULT 0,
  `Quantia37` int(11) DEFAULT 0,
  `Item38` int(11) DEFAULT 0,
  `Quantia38` int(11) DEFAULT 0,
  `Item39` int(11) DEFAULT 0,
  `Quantia39` int(11) DEFAULT 0,
  `Item40` int(11) DEFAULT 0,
  `Quantia40` int(11) DEFAULT 0,
  `Item41` int(11) DEFAULT 0,
  `Quantia41` int(11) DEFAULT 0,
  `Item42` int(11) DEFAULT 0,
  `Quantia42` int(11) DEFAULT 0,
  `Item43` int(11) DEFAULT 0,
  `Quantia43` int(11) DEFAULT 0,
  `Item44` int(11) DEFAULT 0,
  `Quantia44` int(11) DEFAULT 0,
  `KitReparo` int(11) DEFAULT 0,
  `Tintas` int(11) DEFAULT 0,
  `KitRodas` int(11) DEFAULT 0,
  `Gasolinas` int(11) DEFAULT 0,
  `Item45` int(11) DEFAULT 0,
  `Quantia45` int(11) DEFAULT 0,
  `Item46` int(11) DEFAULT 0,
  `Quantia46` int(11) DEFAULT 0,
  `Item47` int(11) DEFAULT 0,
  `Quantia47` int(11) DEFAULT 0,
  `Item48` int(11) DEFAULT 0,
  `Quantia48` int(11) DEFAULT 0,
  `Item49` int(11) DEFAULT 0,
  `Quantia49` int(11) DEFAULT 0,
  `Item50` int(11) DEFAULT 0,
  `Quantia50` int(11) DEFAULT 0,
  `Item51` int(11) DEFAULT 0,
  `Quantia51` int(11) DEFAULT 0,
  `Item52` int(11) DEFAULT 0,
  `Quantia52` int(11) DEFAULT 0,
  `Item53` int(11) DEFAULT 0,
  `Quantia53` int(11) DEFAULT 0,
  `Item54` int(11) DEFAULT 0,
  `Quantia54` int(11) DEFAULT 0,
  `Item55` int(11) DEFAULT 0,
  `Quantia55` int(11) DEFAULT 0,
  `Item56` int(11) DEFAULT 0,
  `Quantia56` int(11) DEFAULT 0,
  `Item57` int(11) DEFAULT 0,
  `Quantia57` int(11) DEFAULT 0,
  `Item58` int(11) DEFAULT 0,
  `Quantia58` int(11) DEFAULT 0,
  `Item59` int(11) DEFAULT 0,
  `Quantia59` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mochilas`
--

INSERT INTO `mochilas` (`userid`, `TemMochila`, `Item0`, `Quantia0`, `Item1`, `Quantia1`, `Item2`, `Quantia2`, `Item3`, `Quantia3`, `Item4`, `Quantia4`, `Item5`, `Quantia5`, `Item6`, `Quantia6`, `Item7`, `Quantia7`, `Item8`, `Quantia8`, `Item9`, `Quantia9`, `Item10`, `Quantia10`, `Item11`, `Quantia11`, `Item12`, `Quantia12`, `Item13`, `Quantia13`, `Item14`, `Quantia14`, `Item15`, `Quantia15`, `Item16`, `Quantia16`, `Item17`, `Quantia17`, `Item18`, `Quantia18`, `Item19`, `Quantia19`, `Item20`, `Quantia20`, `Item21`, `Quantia21`, `Item22`, `Quantia22`, `Item23`, `Quantia23`, `Item24`, `Quantia24`, `Item25`, `Quantia25`, `Item26`, `Quantia26`, `Item27`, `Quantia27`, `Item28`, `Quantia28`, `Item29`, `Quantia29`, `Item30`, `Quantia30`, `Item31`, `Quantia31`, `Item32`, `Quantia32`, `Item33`, `Quantia33`, `Item34`, `Quantia34`, `Item35`, `Quantia35`, `Item36`, `Quantia36`, `Item37`, `Quantia37`, `Item38`, `Quantia38`, `Item39`, `Quantia39`, `Item40`, `Quantia40`, `Item41`, `Quantia41`, `Item42`, `Quantia42`, `Item43`, `Quantia43`, `Item44`, `Quantia44`, `KitReparo`, `Tintas`, `KitRodas`, `Gasolinas`, `Item45`, `Quantia45`, `Item46`, `Quantia46`, `Item47`, `Quantia47`, `Item48`, `Quantia48`, `Item49`, `Quantia49`, `Item50`, `Quantia50`, `Item51`, `Quantia51`, `Item52`, `Quantia52`, `Item53`, `Quantia53`, `Item54`, `Quantia54`, `Item55`, `Quantia55`, `Item56`, `Quantia56`, `Item57`, `Quantia57`, `Item58`, `Quantia58`, `Item59`, `Quantia59`) VALUES
(1, 1, 512, 1, 19473, 25, 434, 1, 568, 1, 23, 1, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 1, 0, 0, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0),
(9, 1, 18866, 2, 19621, 100, 434, 1, 560, 1, 1654, 1, 1484, 4, 19580, 1, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 0, 0, 0, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0),
(11, 1, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 0, 0, 0, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0, 18631, 0),
(60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `objetos`
--

CREATE TABLE `objetos` (
  `Objetoid` int(11) NOT NULL,
  `ObX` float DEFAULT NULL,
  `ObY` float DEFAULT NULL,
  `ObZ` float DEFAULT NULL,
  `RotX` float DEFAULT NULL,
  `RotY` float DEFAULT NULL,
  `RotZ` float DEFAULT NULL,
  `ObjetoModel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `objetos`
--

INSERT INTO `objetos` (`Objetoid`, `ObX`, `ObY`, `ObZ`, `RotX`, `RotY`, `RotZ`, `ObjetoModel`) VALUES
(1, -450.995, -1727.57, 8.13498, 12.2, 0, 96.5, 1292),
(2, -449.435, -1730.98, 7.48546, 0, 0, 0, 1300);

-- --------------------------------------------------------

--
-- Estrutura para tabela `orgs`
--

CREATE TABLE `orgs` (
  `OrgId` int(2) DEFAULT NULL,
  `OrgNome` varchar(27) DEFAULT NULL,
  `OrgLider` varchar(11) DEFAULT NULL,
  `Vagas` int(2) DEFAULT NULL,
  `EstiloOrg` int(1) DEFAULT NULL,
  `HexColor` varchar(6) DEFAULT NULL,
  `OrgCriada` int(1) DEFAULT NULL,
  `OrgCofre` int(10) DEFAULT NULL,
  `OrgInterior` int(1) DEFAULT NULL,
  `OrgVw` int(2) DEFAULT NULL,
  `PickDisponivel` int(1) DEFAULT NULL,
  `OrgSpawnX` decimal(10,6) DEFAULT NULL,
  `OrgSpawnY` decimal(11,6) DEFAULT NULL,
  `OrgSpawnZ` decimal(10,6) DEFAULT NULL,
  `OrgSpawnA` decimal(9,6) DEFAULT NULL,
  `OrgPickPosX` decimal(11,6) DEFAULT NULL,
  `OrgPickPosY` decimal(11,6) DEFAULT NULL,
  `OrgPickPosZ` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnX0` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnY0` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnZ0` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA0` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnX1` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnY1` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnZ1` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA1` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnX2` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnY2` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnZ2` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA2` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnX3` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnY3` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnZ3` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA3` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnX4` decimal(10,6) DEFAULT NULL,
  `VeiculoSpawnY4` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnZ4` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA4` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnX5` decimal(10,6) DEFAULT NULL,
  `VeiculoSpawnY5` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnZ5` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA5` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnX6` decimal(10,6) DEFAULT NULL,
  `VeiculoSpawnY6` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnZ6` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA6` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnX7` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnY7` decimal(11,6) DEFAULT NULL,
  `VeiculoSpawnZ7` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA7` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnX8` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnY8` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnZ8` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnA8` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnX9` decimal(9,6) DEFAULT NULL,
  `VeiculoSpawnY9` decimal(10,6) DEFAULT NULL,
  `VeiculoSpawnZ9` decimal(8,6) DEFAULT NULL,
  `VeiculoSpawnA9` decimal(7,6) DEFAULT NULL,
  `VeiculoSpawnX10` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnY10` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnZ10` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnA10` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnX11` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnY11` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnZ11` decimal(2,1) DEFAULT NULL,
  `VeiculoSpawnA11` decimal(2,1) DEFAULT NULL,
  `VeiculoModelo0` int(3) DEFAULT NULL,
  `VeiculoModelo1` int(3) DEFAULT NULL,
  `VeiculoModelo2` int(3) DEFAULT NULL,
  `VeiculoModelo3` int(3) DEFAULT NULL,
  `VeiculoModelo4` int(3) DEFAULT NULL,
  `VeiculoModelo5` int(3) DEFAULT NULL,
  `VeiculoModelo6` int(3) DEFAULT NULL,
  `VeiculoModelo7` int(3) DEFAULT NULL,
  `VeiculoModelo8` int(3) DEFAULT NULL,
  `VeiculoModelo9` int(3) DEFAULT NULL,
  `VeiculoModelo10` int(1) DEFAULT NULL,
  `VeiculoModelo11` int(1) DEFAULT NULL,
  `VehCor` int(3) DEFAULT NULL,
  `Maconha` int(6) DEFAULT NULL,
  `Equipamentos` int(4) DEFAULT NULL,
  `Cofre` int(1) DEFAULT NULL,
  `OrgCor` int(1) DEFAULT NULL,
  `Sigla` varchar(4) DEFAULT NULL,
  `SalarioCargo0` int(1) DEFAULT NULL,
  `SalarioCargo1` int(5) DEFAULT NULL,
  `SalarioCargo2` int(5) DEFAULT NULL,
  `SalarioCargo3` int(5) DEFAULT NULL,
  `SalarioCargo4` int(5) DEFAULT NULL,
  `SalarioCargo5` int(5) DEFAULT NULL,
  `SalarioCargo6` int(5) DEFAULT NULL,
  `SalarioCargo7` int(5) DEFAULT NULL,
  `SalarioCargo8` int(5) DEFAULT NULL,
  `SalarioCargo9` int(5) DEFAULT NULL,
  `SalarioCargo10` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `orgs`
--

INSERT INTO `orgs` (`OrgId`, `OrgNome`, `OrgLider`, `Vagas`, `EstiloOrg`, `HexColor`, `OrgCriada`, `OrgCofre`, `OrgInterior`, `OrgVw`, `PickDisponivel`, `OrgSpawnX`, `OrgSpawnY`, `OrgSpawnZ`, `OrgSpawnA`, `OrgPickPosX`, `OrgPickPosY`, `OrgPickPosZ`, `VeiculoSpawnX0`, `VeiculoSpawnY0`, `VeiculoSpawnZ0`, `VeiculoSpawnA0`, `VeiculoSpawnX1`, `VeiculoSpawnY1`, `VeiculoSpawnZ1`, `VeiculoSpawnA1`, `VeiculoSpawnX2`, `VeiculoSpawnY2`, `VeiculoSpawnZ2`, `VeiculoSpawnA2`, `VeiculoSpawnX3`, `VeiculoSpawnY3`, `VeiculoSpawnZ3`, `VeiculoSpawnA3`, `VeiculoSpawnX4`, `VeiculoSpawnY4`, `VeiculoSpawnZ4`, `VeiculoSpawnA4`, `VeiculoSpawnX5`, `VeiculoSpawnY5`, `VeiculoSpawnZ5`, `VeiculoSpawnA5`, `VeiculoSpawnX6`, `VeiculoSpawnY6`, `VeiculoSpawnZ6`, `VeiculoSpawnA6`, `VeiculoSpawnX7`, `VeiculoSpawnY7`, `VeiculoSpawnZ7`, `VeiculoSpawnA7`, `VeiculoSpawnX8`, `VeiculoSpawnY8`, `VeiculoSpawnZ8`, `VeiculoSpawnA8`, `VeiculoSpawnX9`, `VeiculoSpawnY9`, `VeiculoSpawnZ9`, `VeiculoSpawnA9`, `VeiculoSpawnX10`, `VeiculoSpawnY10`, `VeiculoSpawnZ10`, `VeiculoSpawnA10`, `VeiculoSpawnX11`, `VeiculoSpawnY11`, `VeiculoSpawnZ11`, `VeiculoSpawnA11`, `VeiculoModelo0`, `VeiculoModelo1`, `VeiculoModelo2`, `VeiculoModelo3`, `VeiculoModelo4`, `VeiculoModelo5`, `VeiculoModelo6`, `VeiculoModelo7`, `VeiculoModelo8`, `VeiculoModelo9`, `VeiculoModelo10`, `VeiculoModelo11`, `VehCor`, `Maconha`, `Equipamentos`, `Cofre`, `OrgCor`, `Sigla`, `SalarioCargo0`, `SalarioCargo1`, `SalarioCargo2`, `SalarioCargo3`, `SalarioCargo4`, `SalarioCargo5`, `SalarioCargo6`, `SalarioCargo7`, `SalarioCargo8`, `SalarioCargo9`, `SalarioCargo10`) VALUES
(1, 'Policia Militar', 'Ninguem', 30, 1, '33ccff', 1, 532500, 6, 19, 1, 246.993942, 69.835449, 1003.640625, 181.817383, 1528.042603, -1691.911621, 6.225193, 1528.222534, -1687.725830, 5.890625, 260.251190, 1545.666504, -1684.246460, 5.890625, 91.886688, 1544.394897, -1675.926270, 5.890625, 93.788918, 1544.594482, -1668.096069, 5.890625, 87.329033, 1538.623535, -1646.770264, 5.890625, 182.228271, 1563.866089, -1657.037354, 28.395603, 91.017410, 1603.614868, -1627.649902, 13.500737, 88.837273, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 523, 596, 599, 427, 437, 497, 481, 0, 0, 0, 0, 0, 135, 0, 0, 0, 1, 'PM', 0, 1000, 1200, 1400, 1500, 1600, 1700, 1800, 1900, 4800, 5000),
(2, 'Policia Civil', 'Ninguem', 19, 1, '00388B', 1, 100000, 6, 31, 1, 246.405319, 70.079971, 1003.640625, 185.171738, 894.374878, -1204.242065, 16.976564, 903.801453, -1205.655884, 16.976564, 177.182755, 899.494080, -1205.353027, 16.976564, 179.109558, 869.193481, -1205.398926, 16.976564, 180.783356, 867.382935, -1245.491943, 14.930233, 268.878082, 885.733887, -1286.715332, 23.086107, 0.592813, 908.373291, -1205.683350, 16.976564, 191.338501, 911.283142, -1206.494263, 16.976564, 184.469025, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 596, 599, 489, 437, 497, 426, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1, 'PC', 0, 4000, 2000, 2500, 2500, 2700, 2870, 3000, 3200, 4000, 5000),
(3, 'Bope', 'Ninguem', 17, 1, '33ccff', 1, 97750, 6, 32, 1, 246.257355, 69.150925, 1003.640625, 182.747879, 1225.197144, -1646.685669, 11.796875, 1217.038574, -1673.150391, 11.796875, 358.555573, 1222.998413, -1672.314453, 11.796875, 355.082703, 1229.427856, -1672.607300, 11.796875, 357.695465, 1215.755615, -1646.882813, 11.796875, 280.236206, 1257.525024, -1679.013672, 34.804688, 63.147945, 1218.363037, -1649.375732, 11.796875, 274.662170, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 490, 427, 528, 599, 548, 481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'BOPE', 0, 4000, 4000, 4000, 5000, 5000, 5000, 5000, 5000, 4300, 5000),
(4, 'Comando Vermelho', 'Ninguem', 28, 2, 'FF0000', 1, 1231378186, 0, 20, 1, 1674.926636, -1469.266968, 3002.841309, 357.519409, -194.790848, -1106.018188, 3.027590, -84.259239, -1123.883057, 3.937767, 266.005005, -188.184021, -1112.562744, 3.839174, 68.570366, -192.203354, -1117.162476, 3.762557, 255.528595, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 548, 468, 560, 466, 412, 426, 427, 0, 0, 0, 0, 0, 0, 125194, 6148, 0, 1, 'CV', 0, 150, 250, 350, 450, 550, 650, 750, 850, 5000, 5000),
(5, 'Terceiro Comando Puro', 'Ninguem', 29, 2, '00ff00', 1, 0, 0, 15, 1, 1675.753784, -1471.778198, 3002.841309, 358.878815, -903.356140, -461.756744, 25.753654, -895.067749, -461.472717, 24.832762, 261.659241, -885.202698, -463.836456, 23.704767, 264.054565, -878.406982, -464.283966, 23.086014, 264.391449, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 458, 560, 581, 579, 412, 468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'TCP', 0, 1, 1, 50, 50, 250, 500, 500, 500, 500, 5000),
(6, 'Milicia', 'Joao_Borges', 25, 2, '33ccff', 1, 1341000, 0, 0, 1, 1881.533691, -2025.584351, 13.390604, 29.043634, -2676.613037, -484.159851, 23.319113, -2679.710938, -478.054657, 24.752949, 276.684509, -2678.367920, -448.921051, 29.430840, 7.139626, -2678.157959, -439.744415, 30.433680, 2.811463, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 458, 0, 410, 468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'MLC', 0, 1000, 200, 300, 400, 500, 600, 700, 3900, 4500, 5000),
(7, 'Primeiro Comando Da Capital', 'Ninguem', 29, 2, 'ffff00', 1, 0, 0, 17, 1, 1675.898071, -1472.359009, 3002.841309, 358.376953, 444.830139, 58.320415, 11.871437, 413.559326, 26.036137, 7.994976, 32.292412, 418.821075, 29.687502, 8.419981, 30.880264, 416.483337, 27.293806, 8.200177, 32.509609, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 458, 445, 445, 560, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 1, 'PCC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 5000),
(8, 'Familia Do Norte', 'Ninguem', 21, 2, 'b000ff', 1, 954600, 0, 16, 1, 1675.978516, -1472.280151, 3002.841309, 359.560760, 759.669128, 378.825165, 23.171877, 751.101196, 383.294922, 23.171877, 276.635468, 787.561584, 387.002350, 21.636845, 280.754547, 761.860962, 384.160767, 23.171877, 276.005524, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 9036, 0, 1, 'FDN', 0, 50, 50, 50, 50, 50, 50, 50, 1000, 1000, 1000),
(9, 'ROTAM', 'Ninguem', 30, 1, '11160', 1, 100000, 6, 35, 1, 249.136078, 70.204018, 1003.640625, 176.909607, 2261.325195, 2448.367188, 3.531250, 2268.584717, 2431.794922, 3.273437, 358.524353, 2277.360352, 2431.050781, 3.273437, 0.791547, 2259.897705, 2431.633301, 3.273437, 4.254086, 2346.959961, 2422.312256, 10.820302, 174.960190, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 596, 599, 490, 481, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1, 'RTM', 0, 1200, 1200, 1200, 1200, 1200, 1500, 1500, 1900, 1900, 4000),
(10, 'PRF', 'Ninguem', 30, 1, 'F4FF00', 1, 75000, 6, 18, 1, 246.388779, 69.994621, 1003.640625, 185.525742, -121.711647, -1360.766968, 2.875000, 1726.299683, 540.479431, 27.195740, 253.300644, -133.834564, -1357.630859, 2.875000, 346.664124, -125.054771, -1343.451416, 2.875000, 165.827332, 1728.347046, 539.918152, 27.187376, 252.299774, 1718.976563, 517.040466, 28.612310, 162.380127, 1764.269653, 551.369873, 33.719238, 159.680359, 1747.847656, 551.210632, 26.113010, 62.596413, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 523, 598, 599, 554, 437, 497, 481, 560, 0, 0, 0, 0, 228, 0, 0, 0, 1, 'PRF', 0, 2000, 2000, 2200, 2200, 2200, 2500, 2500, 2600, 3500, 5000),
(11, 'Policia Federal', 'Ninguem', 30, 1, 'FF7200', 1, 100000, 6, 12, 1, 246.337906, 69.733223, 1003.640625, 181.706970, 310.555969, -1515.320313, 24.921877, 293.544861, -1512.961792, 24.593750, 242.078369, 300.257111, -1504.281616, 24.593750, 237.482986, 287.147430, -1521.871704, 24.593750, 231.370590, 317.951233, -1506.494507, 76.539063, 235.968079, 358.260712, -1491.082397, 35.250286, 125.162117, 0.000000, 0.000000, 0.000000, 0.000000, 287.605682, -1522.115723, 24.593750, 238.932053, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 596, 599, 489, 497, 481, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1, 'PF', 0, 1000, 1000, 1300, 1200, 1000, 1400, 1500, 1600, 1700, 5000),
(12, 'Exercito Brasileiro', 'Ninguem', 16, 1, '1A7939', 1, 100000, 0, 0, 1, 263.865692, 1838.765137, 4.705037, 172.632782, 215.902481, 1921.463379, 17.640623, 210.973511, 1919.781982, 17.640623, 176.884598, 199.863068, 1902.581787, 17.640623, 358.267303, 229.615524, 1910.107788, 17.640623, 90.700714, 301.999725, 1961.019653, 17.640623, 181.310898, 282.400726, 1846.734131, 20.405005, 359.739044, 311.587677, 1960.181641, 17.640623, 181.310898, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 248.094223, 1927.996948, 17.648058, 2.707684, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 470, 437, 432, 520, 548, 476, 427, 490, 528, 497, 0, 0, 4, 0, 0, 0, 1, 'EB', 0, 600, 900, 1000, 1200, 1700, 2500, 2900, 3800, 4500, 5000),
(13, 'Okaida', 'Ninguem', 30, 2, '00fbff', 1, 542000, 0, 22, 1, 1675.631348, -1468.156982, 3002.841309, 356.345276, 2645.264404, -2033.536255, 13.554039, 2645.099121, -2026.552612, 13.546875, 1.151139, 2653.287354, -2033.905518, 13.546875, 81.819443, 2646.601807, -2006.659668, 13.382802, 266.487823, 2651.916992, -2042.313721, 13.550000, 8.574826, 2646.912354, -2000.955444, 13.382802, 273.116455, 2635.035889, -2002.912476, 13.549954, 268.337250, 2652.241211, -2006.879883, 13.382802, 268.383575, 127.386070, -1739.936768, 17.169209, 156.784348, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 458, 560, 468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 135, 0, 0, 0, 1, 'OKD', 0, 500, 500, 500, 500, 500, 500, 700, 1000, 2500, 0),
(14, 'ROTA', 'Ninguem', 25, 1, '11160', 1, 100000, 6, 23, 1, 249.406403, 70.717903, 1003.640625, 169.277878, 976.287842, -1518.860229, 14.310185, 957.939453, -1512.317383, 13.788344, 268.739075, 621.044189, -611.197632, 17.226564, 271.928864, 621.621582, -605.306274, 17.226564, 274.306244, 633.313171, -589.361816, 16.335938, 269.155975, 660.620483, -585.292664, 16.335938, 97.971123, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 596, 599, 490, 481, 497, 523, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1, 'ROTA', 0, 600, 1000, 1600, 1800, 2000, 2400, 2600, 3000, 5000, 5000),
(15, 'Amigos Dos Amigos', 'Ninguem', 29, 2, '', 1, 100000, 0, 33, 1, 1669.770386, -1466.349243, 3002.841309, 270.621765, 1293.096924, 166.021286, 20.460938, 1290.903442, 142.108994, 20.460360, 12.691651, 1287.645264, 207.087509, 19.812967, 152.812241, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 426, 560, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'ADA', 0, 100, 700, 700, 750, 750, 800, 800, 800, 1000, 5000),
(16, 'Forca Tatica', 'Beck', 30, 1, '11160', 1, 100000, 0, 0, 1, 2953.572998, -726.277588, 11.830533, 177.652390, 1254.711304, -105.822830, 38.903553, 1252.375977, -98.816193, 38.506386, 162.525742, 2924.923340, -748.444702, 11.012248, 267.495972, 1249.246216, -101.268623, 38.986614, 216.055649, 2958.177490, -738.073547, 11.012248, 88.443222, 1241.480225, -106.312103, 39.014099, 217.550613, 2936.323730, -726.279663, 11.012248, 183.454468, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 596, 599, 490, 481, 523, 497, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1, 'FT', 0, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000),
(17, 'Tropa De Choque', 'Ninguem', 27, 1, '33ccff', 1, 100000, 4, 14, 1, 239.841248, -8.745537, 1501.010254, 359.177643, -1595.775146, 678.797974, -5.242187, -1600.437622, 694.078979, -5.242187, 176.814758, -1608.441284, 693.472961, -5.242187, 183.185562, -1616.648560, 692.057556, -5.242187, 175.670700, -1593.089355, 651.806580, 7.187500, 354.708771, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 490, 427, 528, 481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'CHQ', 0, 10000, 10000, 11000, 12000, 13000, 14000, 15000, 16000, 18000, 0),
(18, 'Taliban', 'Ninguem', 28, 0, 'FFFFFF', 0, 100000, 0, 0, 1, 1105.902466, -299.735596, 74.539063, 83.347618, 1096.019409, -306.264893, 73.992195, 1086.335571, -296.396271, 73.992195, 178.917709, 1103.222290, -306.720459, 73.992195, 90.086502, 1101.950684, -306.753510, 73.992195, 89.132591, 1077.868896, -299.782898, 73.992195, 174.227951, 1106.602905, -339.621674, 75.625183, 91.072823, 1090.214844, -327.633362, 73.992195, 87.652893, 1079.835083, -335.081085, 73.992195, 87.978767, 988.482300, -335.247284, 75.073303, 68.218529, 0.0, 0.0, 0.0, 0.0, 0.000000, 0.000000, 0.000000, 0.000000, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 476, 560, 470, 432, 548, 573, 511, 592, 0, 0, 0, 0, 35, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, 3000, 0, 0, 0, 4999, 5000)


-- --------------------------------------------------------

--
-- Estrutura para tabela `portoes`
--

CREATE TABLE `portoes` (
  `PortaoID` int(11) NOT NULL,
  `Dono` text DEFAULT NULL,
  `Senha` text DEFAULT NULL,
  `Px` float DEFAULT NULL,
  `Py` float DEFAULT NULL,
  `Pz` float DEFAULT NULL,
  `Pxr` float DEFAULT NULL,
  `Pyr` float DEFAULT NULL,
  `Pzr` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `staff`
--

CREATE TABLE `staff` (
  `Nome` text DEFAULT NULL,
  `Atendidos` int(11) DEFAULT 0,
  `Nota` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `staff`
--

INSERT INTO `staff` (`Nome`, `Atendidos`, `Nota`) VALUES
('Joao_Borges', 0, 0),
('Joao_Borges', 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acessorios`
--
ALTER TABLE `acessorios`
  ADD PRIMARY KEY (`Nome`);

--
-- Índices de tabela `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`userbanco`);

--
-- Índices de tabela `caixas`
--
ALTER TABLE `caixas`
  ADD PRIMARY KEY (`caixaid`);

--
-- Índices de tabela `carrosalugados`
--
ALTER TABLE `carrosalugados`
  ADD PRIMARY KEY (`Vid`);

--
-- Índices de tabela `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`userid`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`Empresaid`);

--
-- Índices de tabela `gangzones`
--
ALTER TABLE `gangzones`
  ADD PRIMARY KEY (`gzid`);

--
-- Índices de tabela `garagens`
--
ALTER TABLE `garagens`
  ADD PRIMARY KEY (`Garagemid`);

--
-- Índices de tabela `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`gpsid`);

--
-- Índices de tabela `habs`
--
ALTER TABLE `habs`
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `maconhas`
--
ALTER TABLE `maconhas`
  ADD PRIMARY KEY (`macid`);

--
-- Índices de tabela `mochilas`
--
ALTER TABLE `mochilas`
  ADD PRIMARY KEY (`userid`);

--
-- Índices de tabela `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`Objetoid`);

--
-- Índices de tabela `portoes`
--
ALTER TABLE `portoes`
  ADD PRIMARY KEY (`PortaoID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `banco`
--
ALTER TABLE `banco`
  MODIFY `userbanco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `contas`
--
ALTER TABLE `contas`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `mochilas`
--
ALTER TABLE `mochilas`
  ADD CONSTRAINT `Mochilas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `contas` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
