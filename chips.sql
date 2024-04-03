-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 03 avr. 2024 à 23:51
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chips`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `summary`, `content`, `image_filename`, `created_at`) VALUES
(15, 'Chips tartiflette', 'Les chips de tartiflette fusionnent le croustillant des chips traditionnelles avec les saveurs riches et réconfortantes d\'une tartiflette, combinant pommes de terre, fromage reblochon fondant, lardons fumés.', '~ Chips de pomme de terre croustillantes\r\n~ Fromage Reblochon, tranché ou râpé\r\n~ Lardons fumés, précuits\r\n~ Oignons, émincés et sautés\r\n~ Crème fraîche\r\n~ Sel et poivre au goût\r\n~ Persil ou ciboulette', '03497917003380-d1c1-s01-66041952a0750.png', '2024-04-03 21:44:20'),
(16, 'Chips La bretonne', 'Les chips La Bretonne, croustillantes et savoureuses, célèbrent les saveurs de la Bretagne avec une touche de sel de mer, offrant une expérience gustative unique rappelant les côtes sauvages bretonnes.', '~ Pommes de terre fermes\r\n~ Sel de Guérande ou sel marin breton\r\n~ Algues séchées émiettées\r\n~ Beurre demi-sel', '893230-M1-S1-66041a23f009c.png', '2024-04-03 21:44:20'),
(17, 'Chips pesto Mozzarella', 'Des chips garnies de pesto et mozzarella, puis cuites au four jusqu\'à ce que le fromage soit fondu, créent une collation croustillante et savoureuse agrémentée de basilic frais.', '~ Chips nature ou de votre choix\r\n~ Pesto, vert ou rouge selon la préférence\r\n~ Mozzarella fraîche, tranchée ou en billes\r\n~ Tomates séchées ou fraîches coupées en petits morceaux\r\n~ Basilic frais pour garnir', '3497917002741-66041a67e18b2.png', '2024-04-03 21:44:20'),
(18, 'Chips Chevre piment', 'Les chips Chèvre Piment offrent un mariage audacieux entre la douceur du fromage de chèvre et le piquant du piment, créant ainsi une collation croustillante avec une explosion de saveurs qui éveille les papilles et apporte une touche épicée et onctueuse.', '~ Chips nature ou de votre choix\r\n~ Fromage de chèvre doux\r\n~ Poudre de piment ou flocons de piment rouge\r\n~ Miel\r\n~ Thym ou herbes de Provence pour saupoudrer', 'B2CD-66041a9932f23.png', '2024-04-03 21:44:20'),
(19, 'Chips Tomate Vinaigre', 'Les chips Tomate Vinaigre marient le goût acidulé du vinaigre avec la fraîcheur de la tomate, offrant une expérience gustative vive et rafraîchissante, où la tangente acide du vinaigre se mêle harmonieusement à la douceur légèrement sucrée de la tomate', '~ Chips de pomme de terre croustillantes\r\n~ Poudre de tomate ou tomates séchées\r\n~ Vinaigre de vin rouge ou de cidre\r\n~ Sel fin\r\n~ Ail en poudre\r\n~ Origan séché ou basilic pour une touche herbacée', 'tomates-sechees-vinaigre-balsamique-125gr-400px-big-66041ac509c0b.png', '2024-04-03 21:44:20'),
(20, 'Chips Chili Menthe', 'Les chips Chili Menthe offrent une combinaison surprenante de la chaleur du chili et de la fraîcheur de la menthe, créant une expérience gustative unique où le piquant énergisant du chili est adouci par une note rafraîchissante de menthe.', '~ Chips de pomme de terre croustillantes\r\n~ Poudre de chili ou flocons de chili séché\r\n~ Feuilles de menthe fraîche finement hachées\r\n~ Sel fin, pour ajuster selon le goût\r\n~ Zeste de citron ou de lime', 'chips-brets-chili-pointe-de-menthe-125g-66041bd3a518d.png', '2024-04-03 21:44:20'),
(21, 'Chips Indian Curry', 'Les chips Indian Curry captivent les papilles avec leur mélange riche et aromatique d\'épices de curry typiquement indiennes, offrant une explosion de saveurs exotiques et épicées qui emmènent instantanément dans un voyage gustatif au cœur de l\'Inde', '~ Chips de pomme de terre nature\r\n~ Poudre de curry indien\r\n~ Poudre de cumin\r\n~ Poudre de coriandre\r\n~ Curcuma en poudre\r\n~ Piment doux en poudre\r\n~ Sel fin\r\n~ Un filet de jus de citron', '883df15f26040c30d50d366881190373-125g-indian-curry-r-z-4115-66041bdd093ad.png', '2024-04-03 21:44:20'),
(22, 'Chips Poulet Tandoori', 'Les chips Poulet Tandoori combinent le croustillant des chips avec les arômes épicés et fumés du poulet tandoori, une spécialité indienne, offrant une expérience gustative intense où le goût profond des épices tandoori se mêle à la saveur réconfortante', '~ Chips de pomme de terre nature\r\n~ Poudre de tandoori\r\n~ Paprika doux\r\n~ Ail en poudre\r\n~ Poudre de gingembre\r\n~ Poudre d\'oignon\r\n~ Jus de citron\r\n~ Sel fin\r\n~ Coriandre moulue', 'CHIPS-POULET-TANDOORI-BRETS-66041beb032cc.png', '2024-04-03 21:44:20'),
(23, 'Chips La Paysanne', 'Les chips La Paysanne célèbrent les saveurs rustiques et authentiques de la campagne, avec un mélange subtil de pommes de terre soigneusement sélectionnées, assaisonnées d\'une touche de sel et d\'herbes de Provence, offrant une expérience gustative', '~ Chips de pomme de terre nature\r\n~ Herbes de Provence séchées\r\n~ Sel de mer fin\r\n~ Poivre noir fraîchement moulu\r\n~ Ail en poudre\r\n~ Un filet d\'huile d\'olive', '125G-Paysanne-RECTO-66041bf4549db.png', '2024-04-03 21:44:20'),
(24, 'Chips Sel et Vinaigre', 'Les chips Sel et Vinaigre offrent une harmonie parfaite entre la piquante acidité du vinaigre et la salinité cristalline du sel, créant une explosion de saveurs aigre-douces dans chaque croustillante bouchée, pour une collation classique et irrésistibleme', '~ Chips de pomme de terre nature\r\n~ Vinaigre de malt ou vinaigre blanc\r\n~ Sel fin\r\n~ Un soupçon de sucre', 'chips-sel-et-vinaigre-66041c02d8a33.png', '2024-04-03 21:44:20'),
(25, 'Chips Pili Pili', 'Les chips Pili Pili, avec leur saveur ardente et épicée, plongent les sens dans l\'intensité du piment pili-pili, offrant une expérience gustative audacieuse et enflammée qui éveille les papilles grâce à un piquant exotique, faisant de chaque bouchée crous', '~ Chips de pomme de terre nature\r\n~ Poudre de pili-pili\r\n~ Sel fin\r\n~ Ail en poudre\r\n~ Un filet de jus de citron ou de lime', '125g-Pili-Pili-495x400-66041c109f82b.png', '2024-04-03 21:44:20'),
(26, 'Chips Petit Oignons', 'Les chips Petit Oignons fusionnent la croustillance des chips avec le goût sucré et légèrement piquant des petits oignons, offrant une expérience gustative délicate et savoureuse qui équilibre subtilement la douceur des oignons caramelisés avec la salinit', '~ Chips de pomme de terre nature\r\n~ Poudre d\'oignon ou oignons séchés finement émincés\r\n~ Sel fin\r\n~ Poivre noir fraîchement moulu\r\n~ Persil séché ou ciboulette séchée', '2Q-66041c665c4ce.png', '2024-04-03 21:44:20'),
(27, 'Chips Cheddar Oignon de Roscoff', 'Les chips Cheddar Oignon de Roscoff marient l\'onctuosité du cheddar fondu avec le caractère sucré et légèrement piquant des oignons de Roscoff, une appellation d\'origine protégée célèbre pour sa saveur douce et unique. Cette combinaison crée une collation', '~ Chips de pomme de terre nature\r\n~ Cheddar affiné, râpé\r\n~ Oignon de Roscoff, finement haché et caramélisé\r\n~ Sel de mer fin\r\n~ Poivre noir fraîchement moulu\r\n~ Thym séché ou romarin', 'B2CD-66041d54524a7.png', '2024-04-03 21:44:20');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'Test@Test.com', '[]', '$2y$13$EcXFUJQuGOEmG6mL5ffIC.FacUMf6W2F5dxuThbDlq7L3gephLf2q'),
(2, 'Ziyad', '[]', '$2y$13$aNyIt528EfhUYZrpJpyElOFcAmbKzp3.mc9gJhcCNgUTVr7.crISa'),
(4, 'chaabi', '[]', '$2y$13$XaQO/aX90Wjo9139szSWgOGkArlAiBipDkwoGZqr0qyDMV.0.08Ry'),
(5, 'amelie', '[]', '$2y$13$x0ij9vSD1rCOfKeebccfrOf8DKvjKSMbwpstcp0M0qqtJf.jLOsgm');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
