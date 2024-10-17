-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306:3306
-- Generation Time: Oct 17, 2024 at 05:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trashtech2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bin_levels`
--

CREATE TABLE `bin_levels` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `bin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `owner_names` text NOT NULL,
  `business_type` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `number_of_employees` int(11) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(15) NOT NULL,
  `company_code` varchar(10) NOT NULL,
  `terms_accepted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `company_name`, `company_address`, `contact_email`, `owner_names`, `business_type`, `phone_number`, `email_address`, `number_of_employees`, `contact_person_name`, `contact_person_phone`, `company_code`, `terms_accepted`, `created_at`) VALUES
(0, 'Bullshit Co.', 'Kwarto ni Jed, 19, Manuel Ave., Philippines', NULL, '[\"Camille O. Simbulan\"]', 'Sole Proprietorship', '09955034245', 'camille.olaliahf@gmail.com', 999, 'Camille O. Simbulan', '09955034245', '8226E900', 1, '2024-10-16 10:35:11'),
(1, 'Hello World', 'Villa Gloria angeles City Pampanga', NULL, '[\"Jed Simbulan\"]', 'Sole Proprietorship', '09624163425', 'jedbrionessimbulan@gmail.com', 15, 'Jed SImbulan', '09624163425', '5530FF37', 1, '2024-10-04 00:00:03'),
(3, 'Ratbu', 'angeles city', NULL, '[\"James Bituin\"]', 'Corporation', '+63 9166687708', 'anino.jamesharold@auf.edu.ph', 3, 'Lance Dabu', '+63 91223547913', '34C8E882', 1, '2024-10-07 06:38:44'),
(2, 'RiverSide', 'River Side USA', NULL, '[\"River\"]', 'Sole Proprietorship', '+638988898989', 'jedbrionessimbulan@gmail.com', 20, 'River Side', '+638988898989', '4EC5F34D', 1, '2024-10-04 08:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`) VALUES
(6, 'What is the Automated Recyclable Materials Segregator System?', 'The Automated Recyclable Materials Segregator System is an innovative technology designed to automatically sort recyclable materials based on their type. It uses advanced sensors and algorithms to identify and separate materials such as plastic, paper, metal, and glass.'),
(7, 'How does the system work?', 'The system operates by scanning materials as they pass through a conveyor belt. Sensors detect the material type, and the system uses flaps to sort each item into the appropriate bin.'),
(8, 'What are the main benefits of the Automated Recyclable Materials Segregator System?', 'The main benefits include increased efficiency in waste sorting, reduction in labor costs, improved accuracy in recycling processes, and the ability to process large volumes of materials quickly.'),
(9, 'How does the system contribute to waste management and recycling efforts?', 'By automating the sorting process, the system helps reduce contamination in recyclable streams, improves the quality of recycled materials, and supports sustainable waste management practices.'),
(10, 'Is the system customizable to different waste management needs?', 'Yes, the system is highly customizable and can be tailored to meet specific waste management requirements, including handling different types of materials, processing capacities, and integration with existing waste management infrastructure.');

-- --------------------------------------------------------

--
-- Table structure for table `glass_level`
--

CREATE TABLE `glass_level` (
  `id` int(11) NOT NULL,
  `level_cm` decimal(5,2) NOT NULL,
  `measured_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `glass_weight`
--

CREATE TABLE `glass_weight` (
  `id` int(11) NOT NULL,
  `weight_kg` decimal(7,3) NOT NULL,
  `measured_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `Material_category` varchar(255) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `weight` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metal_level`
--

CREATE TABLE `metal_level` (
  `id` int(11) NOT NULL,
  `level_cm` decimal(5,2) NOT NULL,
  `measured_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metal_weight`
--

CREATE TABLE `metal_weight` (
  `id` int(11) NOT NULL,
  `weight_kg` decimal(7,3) NOT NULL,
  `measured_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paper_level`
--

CREATE TABLE `paper_level` (
  `id` int(11) NOT NULL,
  `level_cm` decimal(5,2) NOT NULL,
  `measured_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paper_weight`
--

CREATE TABLE `paper_weight` (
  `id` int(11) NOT NULL,
  `weight_kg` decimal(7,3) NOT NULL,
  `measured_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plastic_level`
--

CREATE TABLE `plastic_level` (
  `id` int(11) NOT NULL,
  `level_cm` decimal(5,2) NOT NULL,
  `measured_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plastic_weight`
--

CREATE TABLE `plastic_weight` (
  `id` int(11) NOT NULL,
  `weight_kg` decimal(7,3) NOT NULL,
  `measured_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(100) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `verification_code` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`, `email`, `company_name`, `company_address`, `full_name`, `contact_number`, `verification_code`) VALUES
(6, 'Burat', '$2y$10$suk9zp8X16.dfftk.T54Q.0DZ8.hBESVCL2aBhea4.3c.UBhYbzNq', 'admin', '2024-10-07 08:05:11', 'mahabangulo@gmail.com', 'RiverSide', NULL, 'Burat', '+631212121212', NULL),
(7, 'Tarub', '$2y$10$HQo/ispgYEpJOldxLb4pq.slMbQzsODqleT5swKYJS.fRC7P75Uei', 'user', '2024-10-09 05:37:02', 'simbulan.josephderick@gmail.com', 'Ratbu', NULL, 'Tarub', '+631234567867', NULL),
(9, 'AaronBriones', '$2y$10$wl.JKQ./qWczEoVz21dtweHCIYBpy92Zq8UsxcpO5i45AV/qXphCK', 'admin', '2024-10-14 15:45:34', 'aaronbriones@gmail.com', 'RiverSide', NULL, 'Aaron Briones', '+639627637465', NULL),
(10, 'Hakdog', '$2y$10$iZn45aJbj4aznpj5v/Tj6.PteGraqgSBs4Mh7siV6g5YuaRTykOy2', 'user', '2024-10-14 16:36:02', 'hakdog@gmail.com', 'Ratbu', NULL, 'Hakdog', '+639958473625', NULL),
(11, 'Ratbu', '$2y$10$/I02PwXPTTQgoeyUJu1AnuuhiIEIXs5YUVkglFrL6sxwFwy82/rDa', 'admin', '2024-10-14 16:42:57', 'ratbu@gmail.com', 'Ratbu', NULL, 'Ratbu', '+631234567898', NULL),
(12, 'JedSimbulan', '$2y$10$dEXl7biXuZCUq95YGFJd5uT63Xcu10.RxKL70oR8ZXHPsBeTlrJRO', 'admin', '2024-10-14 16:44:48', 'jedbrionessimbulan@gmail.com', 'RiverSide', NULL, 'Jed Simbulan', '+639987654345', NULL),
(13, 'Bini Tae', '$2y$10$E52dmo3dLSM8DmytgVE4Zutvh9HaABkGdBKaUv3QYKimxX6zNoEh6', 'admin', '2024-10-16 10:38:52', 'camille.olaliahf@gmail.com', 'Bullshit Co.', NULL, 'Camille O. Simbulan', '+639955034245', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `waste_statistics`
--

CREATE TABLE `waste_statistics` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bin_levels`
--
ALTER TABLE `bin_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_name`),
  ADD UNIQUE KEY `company_code` (`company_code`),
  ADD UNIQUE KEY `company_code_2` (`company_code`),
  ADD UNIQUE KEY `company_name` (`company_name`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `glass_level`
--
ALTER TABLE `glass_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `glass_weight`
--
ALTER TABLE `glass_weight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `metal_level`
--
ALTER TABLE `metal_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metal_weight`
--
ALTER TABLE `metal_weight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paper_level`
--
ALTER TABLE `paper_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paper_weight`
--
ALTER TABLE `paper_weight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plastic_level`
--
ALTER TABLE `plastic_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plastic_weight`
--
ALTER TABLE `plastic_weight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username_3` (`username`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `waste_statistics`
--
ALTER TABLE `waste_statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_company_name` (`company_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bin_levels`
--
ALTER TABLE `bin_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `glass_level`
--
ALTER TABLE `glass_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glass_weight`
--
ALTER TABLE `glass_weight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metal_level`
--
ALTER TABLE `metal_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metal_weight`
--
ALTER TABLE `metal_weight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paper_level`
--
ALTER TABLE `paper_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paper_weight`
--
ALTER TABLE `paper_weight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plastic_level`
--
ALTER TABLE `plastic_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plastic_weight`
--
ALTER TABLE `plastic_weight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waste_statistics`
--
ALTER TABLE `waste_statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bin_levels`
--
ALTER TABLE `bin_levels`
  ADD CONSTRAINT `bin_levels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `waste_statistics`
--
ALTER TABLE `waste_statistics`
  ADD CONSTRAINT `fk_company_name` FOREIGN KEY (`company_name`) REFERENCES `companies` (`company_name`) ON DELETE CASCADE,
  ADD CONSTRAINT `waste_statistics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
