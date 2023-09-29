/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `binh_luan` (
  `binh_luan_id` int NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` int DEFAULT NULL,
  `hinh_id` int DEFAULT NULL,
  `ngay_binh_luan` datetime DEFAULT NULL,
  `noi_dung` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`binh_luan_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hinh_anh` (
  `hinh_id` int NOT NULL AUTO_INCREMENT,
  `ten_hinh` varchar(200) DEFAULT NULL,
  `duong_dan` varchar(200) DEFAULT NULL,
  `mo_ta` varchar(200) DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  PRIMARY KEY (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `luu_anh` (
  `nguoi_dung_id` int NOT NULL,
  `hinh_id` int NOT NULL,
  `ngay_luu` datetime DEFAULT NULL,
  PRIMARY KEY (`nguoi_dung_id`,`hinh_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoi_dung` (
  `nguoi_dung_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `mat_khau` varchar(200) DEFAULT NULL,
  `ho_ten` varchar(200) DEFAULT NULL,
  `tuoi` int DEFAULT NULL,
  `anh_dai_dien` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(1, 1, 1, '2023-09-07 10:00:00', 'Comment 1 for Picture 1');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(2, 2, 2, '2023-09-07 11:30:00', 'Comment 2 for Picture 1');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(3, 3, 3, '2023-09-08 09:45:00', 'Comment 1 for Picture 2');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(4, 3, 4, '2023-09-08 12:15:00', 'Comment 2 for Picture 2'),
(45, 1, NULL, NULL, 'gdgdsfdsfđf'),
(46, 1, NULL, '2023-09-08 03:55:47', 'gdgdsfdsfđf'),
(47, 1, 2, '2023-09-08 03:56:29', 'gdgdsfdsfđf'),
(48, 1, 1, '2023-09-10 07:00:07', 'rewewrew'),
(49, NULL, 2, '2023-09-12 04:34:23', 'fdsfsd\ndfdsfdsfdsdfgdgfdgfdfddfgfdgfdgfdgfdgfd\n\n\n\n\n'),
(66, 4, 2, '2023-09-12 05:06:16', 'gđsdfdfdfđ'),
(67, 4, 3, '2023-09-12 05:30:22', 'fdsfdsfdsfds'),
(68, 4, 3, '2023-09-12 05:33:38', 'fdgfdgfd'),
(69, 4, 1, '2023-09-12 05:44:24', 'huhu'),
(70, 4, 1, '2023-09-12 05:54:36', 'fgfđsfdsgfdgfd'),
(71, 4, 6, '2023-09-12 11:04:38', 'hihi'),
(72, 4, 1, '2023-09-12 11:11:17', 'fdsfdfds'),
(73, 4, 1, '2023-09-12 11:11:22', 'fdsfdsfdsgdsgfdgfd'),
(74, 4, 1, '2023-09-12 11:24:23', 'dsdfdsfd'),
(75, 4, 6, '2023-09-13 10:29:05', 'sfsfs'),
(76, 4, 6, '2023-09-13 10:35:54', 'fsdfdsfds'),
(77, 4, 6, '2023-09-13 10:36:01', '243243244'),
(78, 4, 6, '2023-09-13 10:38:02', 'ểwr332r32'),
(79, 4, 6, '2023-09-13 10:38:23', ''),
(80, 4, 6, '2023-09-13 10:38:24', 'fewfewre'),
(81, 4, 6, '2023-09-13 10:38:28', '545645436546'),
(82, 4, 6, '2023-09-13 10:38:36', 'manocbu'),
(83, 4, 3, '2023-09-14 03:16:10', 'vdsfdsfdsfdsfdfđffd'),
(84, 4, 3, '2023-09-14 03:56:13', 'một hai ba bốn '),
(85, 4, 1, '2023-09-15 01:55:22', 'fdfdsfdsfdsfdsfds'),
(86, 1, 1, '2023-09-19 03:28:53', '1214'),
(87, 1, 1, '2023-09-29 03:50:58', 'test'),
(88, 1, 1, '2023-09-29 11:56:29', 'test');

INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(1, 'ch', 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MHwxfHNlYXJjaHwxMHx8Y2F0c3xlbnwwfHx8fDE2OTQyMjU4ODF8MA&ixlib=rb-4.0.3&q=80&w=1080', 'Description 1', 1);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(2, 'cho5', 'https://images.unsplash.com/photo-1535930891776-0c2dfb7fda1a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MHwxfHNlYXJjaHw2fHxkb2dzfGVufDB8fHx8MTY5NDIyNTg4MXww&ixlib=rb-4.0.3&q=80&w=1080', 'Description 2', 2);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(3, 'image3.jpg', 'https://images.unsplash.com/photo-1601042879364-f3947d3f9c16?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MHwxfHNlYXJjaHw1fHxUb2t5b3xlbnwwfHx8fDE2OTQyMjU4ODF8MA&ixlib=rb-4.0.3&q=80&w=1080', 'Description 3', 3);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(4, 'image4.jpg', 'https://images.unsplash.com/photo-1604999333679-b86d54738315?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MHwxfHNlYXJjaHw5fHxCYWxpfGVufDB8fHx8MTY5NDIyNTg4MXww&ixlib=rb-4.0.3&q=80&w=1080', 'Description 4', 1),
(5, 'image5.jpg', 'https://images.unsplash.com/photo-1484291470158-b8f8d608850d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MHwxfHNlYXJjaHw3fHxvY2VhbnxlbnwwfHx8fDE2OTQyMjU4ODF8MA&ixlib=rb-4.0.3&q=80&w=1080', 'Description 5', 2),
(6, 'image6.jpg', 'https://images.unsplash.com/photo-1587502537685-c9a38045c71a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MXwxfHNlYXJjaHwxfHxvY2VhbnxlbnwwfHx8fDE2OTQyMjU4ODF8MA&ixlib=rb-4.0.3&q=80&w=1080', 'Description 6', 3),
(7, 'image7.jpg', 'https://images.unsplash.com/photo-1468581264429-2548ef9eb732?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MHwxfHNlYXJjaHwxMHx8b2NlYW58ZW58MHx8fHwxNjk0MjI1ODgxfDA&ixlib=rb-4.0.3&q=80&w=1080', 'Description 7', 2),
(8, 'image8.jpg', 'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MHwxfHNlYXJjaHw3fHxUb2t5b3xlbnwwfHx8fDE2OTQyMjU4ODF8MA&ixlib=rb-4.0.3&q=80&w=1080', 'Description 8', 3),
(9, 'image9.jpg', 'https://images.unsplash.com/photo-1513553404607-988bf2703777?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTM2MzF8MHwxfHNlYXJjaHwyfHxvY2VhbnxlbnwwfHx8fDE2OTQyMjU4ODF8MA&ixlib=rb-4.0.3&q=80&w=1080', 'Description 9', 2),
(110, 'cho5', 'http://localhost:8080/public/img/1694776103623_dab87a164d707214b054364ab03b4b26.jpg', 'dfdgfdg', 2),
(111, 'cho1', 'http://localhost:8080/public/img/1694834610120_dab87a164d707214b054364ab03b4b26.jpg', 'dfdsfdsfvdgfgfhgfgr3r3243253', 2),
(112, 'cho2', 'http://localhost:8080/public/img/1694840524282_cho-samoyed-2-1024x683.jpg', '', 4),
(113, 'fdsfds', 'http://localhost:8080/public/img/1694840636664_tri-tue-nhan-tao-la-gi.jpg', 'gdsgdsgds', 4),
(114, 'cho5', 'http://localhost:8080/public/img/1694840640060_tri-tue-nhan-tao-la-gi.jpg', 'gdsgdsgds', 4),
(124, 'Nature Image 1', '/images/image1.jpg', 'Description 1', 1),
(125, 'Nature Image 2', '/images/image2.jpg', 'Description 2', 2),
(126, 'Nature Image 3', '/images/image3.jpg', 'Description 3', 3),
(127, 'Cityscape Image 1', '/images/image4.jpg', 'Description 4', 1),
(128, 'Cityscape Image 2', '/images/image5.jpg', 'Description 5', 2),
(129, 'Cityscape Image 3', '/images/image6.jpg', 'Description 6', 3),
(130, 'Portrait Image 1', '/images/image7.jpg', 'Description 7', 2),
(131, 'Portrait Image 2', '/images/image8.jpg', 'Description 8', 3),
(132, 'Portrait Image 3', '/images/image9.jpg', 'Description 9', 2),
(133, 'Exact Name', '/images/exact.jpg', 'Description 10', 2),
(134, 'fdffđffds', 'http://localhost:8080/public/img/1694948181254_chicken.jpg', 'fsdfdsfdsfds', 4),
(135, 'fdffđffds', 'http://localhost:8080/public/img/1694948181413_chicken.jpg', 'fsdfdsfdsfds', 4),
(136, 'fdffđffds', 'http://localhost:8080/public/img/1694948181568_chicken.jpg', 'fsdfdsfdsfds', 4),
(137, 'fdffđffds', 'http://localhost:8080/public/img/1694948181712_chicken.jpg', 'fsdfdsfdsfds', 4),
(138, 'fdffđffds', 'http://localhost:8080/public/img/1694948181888_chicken.jpg', 'fsdfdsfdsfds', 4),
(139, 'fdffđffds', 'http://localhost:8080/public/img/1694948182033_chicken.jpg', 'fsdfdsfdsfds', 4),
(140, 'fdffđffds', 'http://localhost:8080/public/img/1694948182184_chicken.jpg', 'fsdfdsfdsfds', 4),
(141, 'fdffđffds', 'http://localhost:8080/public/img/1694948182335_chicken.jpg', 'fsdfdsfdsfds', 4),
(142, 'fdffđffds', 'http://localhost:8080/public/img/1694948182492_chicken.jpg', 'fsdfdsfdsfds', 4),
(143, 'fdffđffds', 'http://localhost:8080/public/img/1694948182658_chicken.jpg', 'fsdfdsfdsfds', 4),
(144, 'fdffđffds', 'http://localhost:8080/public/img/1694948182807_chicken.jpg', 'fsdfdsfdsfds', 4),
(145, 'fdffđffds', 'http://localhost:8080/public/img/1694948182964_chicken.jpg', 'fsdfdsfdsfds', 4),
(146, 'fdffđffds', 'http://localhost:8080/public/img/1694948183107_chicken.jpg', 'fsdfdsfdsfds', 4),
(147, 'Hinh1.jpg', '/images/hinh1.jpg', 'Mô tả hình 1', 1),
(148, 'Hinh2.jpg', '/images/hinh2.jpg', 'Mô tả hình 2', 2),
(150, 'Hinh4.jpg', '/images/hinh4.jpg', 'Mô tả hình 4', 3),
(152, 'long1', 'http://localhost:8080/public/img/1695956053975_tim-hieu-giong-cho-samoyed-nguon-goc-dac-diem-cach-nuoi-bang-gia-202203291549425717.jpg', 'ffdsfdsf', 1),
(153, 'long1', 'http://localhost:8080/public/img/1695956203962_khoahoclaptrinh.jpg', 'ffdsfdsf', 1),
(154, 'long1', 'http://localhost:8080/public/img/1695960490370_khoahoclaptrinh.jpg', 'ffdsfdsf', 6),
(155, 'long1', 'http://localhost:8080/public/img/1695986560913_khoahoclaptrinh.jpg', 'ffdsfdsf', 6),
(156, 'long1', 'http://localhost:8080/public/img/1695988866880_fuhao.png', 'ffdsfdsf', 6);

INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(1, 1, '2023-09-19 04:08:04');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(1, 2, '2023-09-08 07:22:54');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(1, 4, '2023-09-29 11:45:45');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(1, 139, '2023-09-29 04:07:08'),
(4, 1, '2023-09-29 11:46:21'),
(4, 2, '2023-09-18 10:28:26'),
(4, 4, '2023-09-11 06:57:26'),
(4, 5, '2023-09-18 10:11:41'),
(4, 7, '2023-09-18 10:26:43'),
(4, 8, '2023-09-11 07:30:35'),
(4, 9, '2023-09-12 02:33:22'),
(4, 111, '2023-09-18 10:56:44'),
(4, 112, '2023-09-18 10:53:34'),
(4, 113, '2023-09-18 10:34:42'),
(4, 135, '2023-09-18 10:21:11'),
(4, 136, '2023-09-18 10:25:29'),
(4, 139, '2023-09-18 10:37:32'),
(4, 140, '2023-09-18 10:51:16'),
(4, 141, '2023-09-18 10:36:45'),
(4, 142, '2023-09-18 10:50:08'),
(4, 143, '2023-09-18 10:33:36'),
(4, 145, '2023-09-18 10:53:13'),
(6, 135, '2023-09-29 11:53:57'),
(6, 145, '2023-09-29 11:51:17');

INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(1, 'phanvana@gmail.com', '1245', 'phan văn a', 40, 'avatar1.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(2, 'user2@example.com', '$2b$10$UMGpPGczjdcaa9JC/Uua3uZvWB.xYlm1unExBoZ9cq9rt5jj67O2u', 'User Two', 29, 'avatar2.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(3, 'user3@example.com', 'password3', 'User Three', 28, 'avatar3.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(4, 'thanhlong123@gmail.com', '$2b$10$mJubS0VnjXqbYOsaRngnyuCvT.rZNREmV3FpBCTY0zrx0f.5LfV.a', 'Phan Thành Long', 27, NULL),
(5, 'phanvana@ll.com', '$2b$10$8.JnUoCCrh1TkMx3O7hGnuqBZymoCnHYXB2RGXrTyjCizDrw/ymVm', 'phan văn a', 40, NULL),
(6, 'dovand@gmaill.com', '$2b$10$tLrybzEkG0fRLoquK2.QTOqmbCCbZJqV33c/uVn2b9GXv9e6P80b.', 'do van D', 29, NULL),
(7, 'dovant@gmail.com', '$2b$10$6EeWQa/ksRoyQN0QAwdbMOHVN69wVGhd1YRKwpMVYy1DAeOfYQPLK', 'do vann t', 25, NULL),
(8, 'dovant1@gmail.com', '$2b$10$WYtVd8rMniZx50KHb32Bfu7D8f/vtpyecjlAnDSDaY/ENMyZ0DWPu', 'do vann t', NULL, NULL);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;