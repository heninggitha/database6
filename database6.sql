/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - penjualanproduk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`penjualanproduk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `penjualanproduk`;

/*Table structure for table `detailpenjualan` */

DROP TABLE IF EXISTS `detailpenjualan`;

CREATE TABLE `detailpenjualan` (
  `iddetail` int(11) NOT NULL AUTO_INCREMENT,
  `idpenjualan` int(11) DEFAULT NULL,
  `kodebarang` varchar(5) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` float NOT NULL,
  PRIMARY KEY (`iddetail`),
  KEY `idpenjualan` (`idpenjualan`),
  KEY `kodebarang` (`kodebarang`),
  CONSTRAINT `detailpenjualan_ibfk_1` FOREIGN KEY (`idpenjualan`) REFERENCES `penjualan` (`idpenjualan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailpenjualan_ibfk_2` FOREIGN KEY (`kodebarang`) REFERENCES `stokbarang` (`kodebarang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detailpenjualan` */

insert  into `detailpenjualan`(`iddetail`,`idpenjualan`,`kodebarang`,`jumlah`,`subtotal`) values 
(1,1,'B001',4,340000),
(2,2,'B002',1,120000),
(3,3,'B003',1,175000),
(4,4,'B004',1,250000),
(5,5,'B005',1,50000);

/*Table structure for table `kasir` */

DROP TABLE IF EXISTS `kasir`;

CREATE TABLE `kasir` (
  `idkasir` int(11) NOT NULL AUTO_INCREMENT,
  `namakasir` varchar(100) NOT NULL,
  `shift` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idkasir`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kasir` */

insert  into `kasir`(`idkasir`,`namakasir`,`shift`) values 
(1,'Rina Wati','Pagi'),
(2,'Joko Susilo','Siang'),
(3,'Sari Indah','Malam'),
(4,'Ahmad Fauzi','Pagi'),
(5,'Mega Putri','Siang');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `idmember` int(11) NOT NULL AUTO_INCREMENT,
  `namamember` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `notelp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idmember`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `member` */

insert  into `member`(`idmember`,`namamember`,`alamat`,`notelp`) values 
(1,'Andi Pratama','Jl. Merdeka No. 10','081234567890'),
(2,'Siti Aminah','Jl. Sudirman No. 45','085678901234'),
(3,'Budi Santoso','Jl. Ahmad Yani No. 12','087812345678'),
(4,'Dewi Lestari','Jl. Diponegoro No. 8','081987654321'),
(5,'Eko Prasetyo','Jl. Pahlawan No. 20','081345678901'),
(6,'Andi Pratama','Jl. Merdeka No. 10','081234567890'),
(7,'Siti Aminah','Jl. Sudirman No. 45','085678901234'),
(8,'Budi Santoso','Jl. Ahmad Yani No. 12','087812345678'),
(9,'Dewi Lestari','Jl. Diponegoro No. 8','081987654321'),
(10,'Eko Prasetyo','Jl. Pahlawan No. 20','081345678901');

/*Table structure for table `penjualan` */

DROP TABLE IF EXISTS `penjualan`;

CREATE TABLE `penjualan` (
  `idpenjualan` int(11) NOT NULL AUTO_INCREMENT,
  `tanggalpenjualan` datetime DEFAULT current_timestamp(),
  `idmember` int(11) DEFAULT NULL,
  `idkasir` int(11) DEFAULT NULL,
  `totalharga` float DEFAULT NULL,
  PRIMARY KEY (`idpenjualan`),
  KEY `idmember` (`idmember`),
  KEY `idkasir` (`idkasir`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`idmember`) REFERENCES `member` (`idmember`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`idkasir`) REFERENCES `kasir` (`idkasir`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `penjualan` */

insert  into `penjualan`(`idpenjualan`,`tanggalpenjualan`,`idmember`,`idkasir`,`totalharga`) values 
(1,'2026-11-09 09:31:30',1,1,340000),
(2,'2026-11-09 09:31:30',2,2,120000),
(3,'2026-11-09 09:31:30',3,3,175000),
(4,'2026-11-09 09:31:30',4,1,250000),
(5,'2026-11-09 09:31:30',5,4,50000);

/*Table structure for table `photoproduk` */

DROP TABLE IF EXISTS `photoproduk`;

CREATE TABLE `photoproduk` (
  `kodephoto` int(11) NOT NULL AUTO_INCREMENT,
  `filephoto` varchar(50) NOT NULL,
  `iscover` tinyint(1) DEFAULT 0,
  `kodebarang` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`kodephoto`),
  KEY `fk_photo_barang` (`kodebarang`),
  CONSTRAINT `fk_photo_barang` FOREIGN KEY (`kodebarang`) REFERENCES `stokbarang` (`kodebarang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `photoproduk` */

insert  into `photoproduk`(`kodephoto`,`filephoto`,`iscover`,`kodebarang`) values 
(1,'Kemeja Flano01.jpg',1,'B001'),
(2,'sneaker02.jpg',1,'B003'),
(3,'sneaker01.jpg',0,'B003'),
(4,'Celana Jeans01.jpg',1,'B002'),
(5,'Celana Jeans02.jpg',0,'B002'),
(6,'Celana Jeans03.jpg',0,'B002');

/*Table structure for table `stokbarang` */

DROP TABLE IF EXISTS `stokbarang`;

CREATE TABLE `stokbarang` (
  `kodebarang` varchar(5) NOT NULL,
  `namabarang` varchar(50) NOT NULL,
  `stok` float DEFAULT NULL,
  `hargabeli` float DEFAULT NULL,
  `hargajual` float DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`kodebarang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `stokbarang` */

insert  into `stokbarang`(`kodebarang`,`namabarang`,`stok`,`hargabeli`,`hargajual`,`deskripsi`) values 
('B001','Kemeja Flanel',56,73000,85000,'Kemeja flanel bahan katun'),
('B002','Celena Jeans',43,112500,120000,'Celana Jeans demin'),
('B003','Sepatu Sneaker',34,154000,175000,'Sepatu Sneaker casual'),
('B004','Jaket Bomber',20,200000,250000,'Jaket bomber tebal'),
('B005','Topi Baseball',40,35000,50000,'Topi casual katun');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
