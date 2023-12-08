-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 08 déc. 2023 à 09:10
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` int(20) NOT NULL,
  `Designiation` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `Designiation`, `image`) VALUES
(1, 'Guess 1875', 3000, 'watch', 'watch1.jpg'),
(2, 'Guest Watch', 2500, 'watch', 'watch2.jpg'),
(3, 'Panerai Watch', 3500, 'watch', 'watch3.jpg'),
(4, 'Nonos Watch', 1800, 'watch', 'watch4.jpg'),
(5, 'Levis', 1800, 'shirt', 'shirt1.jpg'),
(6, 'louis philippe t-shirt', 2500, 'shirt', 'shirt2.jpg'),
(7, 'Highlander t-shirt', 500, 'shirt', 'shirt3.jpg'),
(8, 'GUCCI White t-Shirt', 2300, 'shirt', 'shirt4.jpg'),
(9, 'Nike White Sneaker', 8000, 'shoes', 'shoe1.jpg'),
(10, 'Nike White Shoes', 7500, 'shoes', 'shoe2.jpg'),
(11, 'Nike Yellow Sneaker', 7000, 'shoes', 'shoe3.jpg'),
(12, 'Nike Brown Sneaker', 6000, 'shoes', 'shoe4.jpg'),
(13, 'Beats Headphone', 22500, 'headphone', 'sp1.jpg'),
(14, 'Zolo Headphone', 4500, 'headphone', 'sp2.jpg'),
(15, 'Sony Speaker', 10500, 'headphone', 'sp3.jpg'),
(16, 'Airpods', 15000, 'headphone', 'sp4.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone` int(10) NOT NULL,
  `registration_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email_id`, `first_name`, `last_name`, `phone`, `registration_time`, `password`) VALUES
(65, 'sharew5m123@gmail.com', 'reys', 'rudt', 0, '2019-03-18 13:46:33', 'e4f194cba29960e12d8b8f1bfedc972b'),
(66, 'sgah234@gmail.com', 'werty', 'erty', 0, '2019-03-18 13:55:46', 'e10adc3949ba59abbe56e057f20f883e'),
(67, 'sham1234@gmail.com', 'Sham', 'das', 0, '2019-03-19 07:37:46', 'e10adc3949ba59abbe56e057f20f883e'),
(68, 'moemenmustapha@gmail.com', 'moemen', 'mustapha', 0, '2023-11-29 21:38:44', '75fecea71f7a9be7c622526f76956570'),
(69, 'moemenmustapha6@gmail.com', 'moemen1', 'mustapha', 0, '2023-11-30 19:47:27', '5728a027d4830eccf4ede48264b5ed6d'),
(72, 'aminzghal@gmail.com', 'amin', 'zghal', 0, '2023-12-06 20:10:18', '30ae43ad1aa0a416699051b73a3dfcf6'),
(73, 'kat@gmail.com', 'aze', 'aze', 0, '2023-12-06 20:32:38', '7f33334d4c2f6dd6ffc701944cec2f1c'),
(74, 'aa@gmail.com', 'aa', 'aa', 0, '2023-12-06 20:44:53', '4124bc0a9335c27f086f24ba207a4912'),
(75, 'bb@gmail.com', 'bb', 'bb', 0, '2023-12-06 20:49:41', '21ad0bd836b90d08f4cf640b4c298e7c');

-- --------------------------------------------------------

--
-- Structure de la table `users_products`
--

CREATE TABLE `users_products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `status` enum('Added To Cart','Confirmed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `users_products`
--

INSERT INTO `users_products` (`id`, `user_id`, `item_id`, `status`) VALUES
(73, 75, 2, 'Added To Cart'),
(74, 75, 1, 'Added To Cart'),
(75, 75, 3, 'Added To Cart'),
(76, 75, 4, 'Added To Cart'),
(77, 68, 2, 'Confirmed'),
(78, 68, 3, 'Confirmed'),
(79, 68, 4, 'Confirmed'),
(80, 68, 1, 'Confirmed'),
(81, 68, 1, 'Confirmed'),
(82, 68, 1, 'Confirmed'),
(83, 68, 1, 'Confirmed'),
(84, 68, 1, 'Confirmed'),
(85, 68, 1, 'Added To Cart'),
(86, 68, 1, 'Added To Cart'),
(87, 68, 2, 'Added To Cart'),
(88, 68, 3, 'Added To Cart'),
(89, 68, 4, 'Added To Cart');

-- --------------------------------------------------------

--
-- Structure de la table `user_admins`
--

CREATE TABLE `user_admins` (
  `id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_admins`
--

INSERT INTO `user_admins` (`id`, `email_id`, `password`, `name`) VALUES
(1, 'moemenmustapha7@gmail.com', 'moemen', 'moemen');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users_products`
--
ALTER TABLE `users_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`item_id`);

--
-- Index pour la table `user_admins`
--
ALTER TABLE `user_admins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pour la table `users_products`
--
ALTER TABLE `users_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT pour la table `user_admins`
--
ALTER TABLE `user_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `users_products`
--
ALTER TABLE `users_products`
  ADD CONSTRAINT `users_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_products_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
