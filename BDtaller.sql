-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: taller
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL AUTO_INCREMENT,
  `Hora` varchar(11) DEFAULT NULL,
  `fechaAsignada` date DEFAULT NULL,
  `Estado` varchar(45) NOT NULL,
  `idVehiculo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idCita`),
  KEY `idusuario_idx` (`idUsuario`),
  KEY `idvehiculo_idx` (`idVehiculo`),
  CONSTRAINT `idusuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idvehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (5,'12:00 pm','2018-03-24','Asignada',5,14),(6,'12:00 pm','2018-03-31','Asignada',10,23),(7,'6:00 pm','2018-04-01','Asignada',5,14),(8,NULL,NULL,'Solicitada',7,14);
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idModelo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Tesla Model 3');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL AUTO_INCREMENT,
  `Herramientas` varchar(45) DEFAULT NULL,
  `Diagnostico` varchar(45) DEFAULT NULL,
  `Accesorios` varchar(45) DEFAULT NULL,
  `Llaves` varchar(45) DEFAULT NULL,
  `Desperfectos` varchar(45) DEFAULT NULL,
  `Gato` varchar(45) DEFAULT NULL,
  `Caucho` varchar(45) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `Vehiculo` int(11) NOT NULL,
  `Foto` mediumblob,
  PRIMARY KEY (`idOrden`),
  KEY `idusuario_idx` (`idUsuario`),
  KEY `vehiculo_idx` (`Vehiculo`),
  CONSTRAINT `usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vehiculoFK` FOREIGN KEY (`Vehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegios` (
  `idPrivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idPrivilegios`),
  UNIQUE KEY `idPrivilegios_UNIQUE` (`idPrivilegios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegios`
--

LOCK TABLES `privilegios` WRITE;
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruebafoto`
--

DROP TABLE IF EXISTS `pruebafoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pruebafoto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `foto` mediumblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruebafoto`
--

LOCK TABLES `pruebafoto` WRITE;
/*!40000 ALTER TABLE `pruebafoto` DISABLE KEYS */;
INSERT INTO `pruebafoto` VALUES (1,NULL),(2,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n		\n\Z\'!%\".\"%()+,+\Z /3/*2\'*+*ÿ\Û\0C\r=)#)==================================================ÿ\Â\0\0\ã{\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0ô^žuG3“Q¨r\\\ÄM\Ã\á4|$M¬\à\à\ä\Ð\\4i (*n\Z	‚F  8.Q¨4NO†¡ÁÀ\È\à\ærˆŽ\ZÀÁÀ À¨@\á p  ˆ¸P\àPp Jœ’\ãcZzn	\Æ0\\\n4iP\áðr#*†è`²%­L)ÄÀ€ÀÀ€€\ÐPh@Ap\ÔJ>¦\àzm´\ä\Ô\ÅMÀ\ÔÆ›\é`\Í-ˆ`\Ä%p‰@\ìP˜J\ÅDŽgjAPcžCC˜€€\Ð@©\Ú&šz©SQ2¥À\á¹2PFœ†¥µP\ã`4©Ž1\êm3s	\Ì@Ž‘Ã•P3nZol°pcOI‰¥\"\Ü\È6‹0kYH\ç¨Š2*\Òj k\"h¦Œ\ÒZ%—%\åÊ­\Â\Üu6ùœˆŠ\Ô`ñF5–‡!ÈŽ”‰ð˜&K$4-+Ik\Ï\æ\åGŠ0!SB\Ò\Z3€ù«H¦4úN¹K™¥ ‚²Tr&zM@\ã’2d¥CÀ@…¸[mIP\áp*p1\0‰\Z\Æ\Ñ1«\éJ9R“&tÜ…_\çt‡^b÷\r\Èô8\Ös¤…\Õ;ó¡©\ä\Õ)A„I*lVd\ÄC„À˜`\Ó\\\Ç4€ŒDO$£cP¦—8=„Lñ>&6\Ù\ÜK¢h\ÕÕº\ÑO§-{\åwólµ\à$T«K9%«h¹þÞ¡ù5<C*—‹5n09—\Ä\ìü\îß¨\ÙR”\Âj/Aª¬\æ\ã¤\æŽ£@(Ø¡0(s>w\ä59ºý#©ž…n\ïn\ê>\ï6‚ù-k-vd\èóW\ÐM\ák\éØ•K\Ëú%¿W¯\â\"†\Ê\êP6@¶“mµ;\\\è~~\×\å¹\è\Ú¦\Æh„Ü˜eA\Â “\ÑM\Ú:Çšñ\Øu7\"«µ³×ºw\ëƒ\Ý\á\ç4ó¦xy„ŸM:\Ù\ÖŒ1;©\ï\Þb{?< \Ê*V	%¦\Û–¹®kT\ç¦o›º\ÏD¥o„\ÐQ!„\æD‰©‘.àªŠœ»ŠLl\äô#¾4¦\êõ\çŸDSQŽ™o\'m\Åžh—\ç%yö‡0™z«\Ïôô\Ó\éQöü› >¼Ÿ_\Ä+Njž#PPH -;g>…+‡l\Ü\Ý7s\"\"q\Æˆ ‘\"°U—R8\ìJc@Ke»H«|­ó¶w£\Ù\'M\ÃwJü¸qöF{‘¦\Ä\é³^\ÇWcð\êgGE&ž%Ž¼;.o\Ðh\ïÈOC6\ÍC\Ç1SQ’™\r\ÝTÛ¹&MDFWMœ\ç°\ÎÖ—\'\"\Z«+Mndý§.Ž\Z\ÉO_¯b\ëz’õbr·_-¯ˆ#¤c\Ñ#N™)\æ¶øfù~Î£®­÷\æ?Le\è¬\å\ÊI\ÎI\Î÷+rD0O¨{‰ª¼\ì«`Yª\ì0«Ã’i\Î!CME\n&Í«{^\É;ð†i\×\å\ë³\Ù\â\é¹~„l}	\\¸¦—‘U•‹ôEUqŒ\Ëý¢ö\èsµ«…_+„\Õ@O£\"\Î\ÅsJðy\r@†Œ©hr‰ŒŠ0:ðr U`¼\àñò\Â\Í\n\"%\Ê5c[õ[\Ø\Æ1¬š\éñm&mø	žš\î?¬\ã7“\ÃajµY²\ÆEY\Zhº1d\é&½j´Dp^F—¯óðc\Ø3c¹\Ü\Ï)+š\"šÓ…¤!\äs”°V´u\çC-?;0¨\"UŠ¯VÚ£GY;øþ\Ó\è;qQG\ë#	Y\È\rM´4B\Ött³«K\r&¾jlOD:\'xz7Ÿñ›Ÿ_\Â\çÉµY\\}b9ý\Æs{„Zòµ¤¨\Äuš\ÔH\â2=*þr\çÌ…T3Í­sWýl¡8OÊ«m®\Üyñ¼þõ\æ~³B\Â\"¥)…\Â_=#.SP\ë‡)\×ò7o)2õ4˜}©\Úö¸\Ç_)w\Í`õÌ¹~€Vpcc\ê‰\Íô9z¾>®\0«jåŠ¹\äxŒ£DŸ½ðt:f¡3$\ÇiŽ³µafiiv\Òð\\=›¬½i^fWS–ðFa\Ç:	Ê…w²\â;>F\æù-™~>±|\ßdWF®_3µò&|b>#\ë’Þ±ª\Ã\è1ù\ëœ\ß\å\ãrU-U(I\ÎEŽ‹`ú\Í\î\Ña¤@\nœž˜\ÙwD‰\È\n˜\Â\ÆôcNJ®\ã/CF»Ìž¨R‹­åžˆfŒ(œa»¾CÒ¦ý\ç\ÍPHSp}£óôJ\èÔº\ÒU5ÓŒ/†s;ecO\ÓñP<\ê‘=¨lT5,—{¬ý\äú2\Ì\ÓÁ\ZU´h»³hD1R$1õ>S¤e\îa¡\îs\í»\Ï\Ó+/B$h§«¢Á\\¸\Þ\ï‘÷¤Ê¥šš\ÊTƒ\Í\ï;“\é\\w\ÏA\èüañ¹Yz\ä=ú!¯	6òiµ\â=¦­Dr\ÃG ºõ¿\'¿°¥Pc\Ð\ZŸT\ìSµ\04\"@`8\ÑN\ç¤b®j\ZD\ì\ãª\Ï/N\Ö=“C—g\Ë{òv\ra•Q\Ô\årô,8¾½Ã£\ëùZ\í|¯I³!\Í\ë\Ï*)®_¯•M§;;,\Å|-gª\ã¦i\Æ\r\çw–\Û«ŽŒ\r@€\à@ #V	¨*3¼ÿ\0\\ð·­F‹	\ÛA—}v\Þo\ÐzgŸ\Îõ®<\Ä~mšn·øòý\ß=G£\Ð\Øq\Òd\ÝF~c~wvy3E´qË¥\Ê\ÂWu–¾Ï›Ñ¦RNÀ*:q-3D Ñ¸\Z(\Æ B†‚\na†!\Ã?S‹\Òp\×-HS§”—º¥ó e£¯U\Éõtfù1R\Í\Ë4ðqS®¤\îù¥\ß\ç|û—h“P”S9-\ÇTFžƒ:\Øg¯­a²\çPõ`*s´\àx\ÉÁÈ‘@#\ÒAH›Á™©À\\S\ÜúSY4yCž‹Ü½\Òg¤·$_oŸžIY£†\ÞP™\ä°\Ö˜\î\\2P™©\Úx\åG¹ðöj±\Õý|\Ñ‡j\Ú]\É‚ppLˆ\0Qˆ.‚6¤EÁ\\*ax&ø\ÒCAƒƒƒX¢p<|d\Âáš\ÖZz\îÃ®E³€©e1AT8Ž!H@«if™(179jš¶¡Â¾–N\åF\nb‰\ìx8Vi\è¥\Û\Ëh\Ì\Ç]\ÎZ]*EOF14ZdŽpx8B$8>DHJeb(«\'`œ¨œ8)if*k\éŠ‰‘Š\Ö]ô]\Âr\Â`CS œ\é\ÆR\Ë6\æñ9@f\n\"fC-­#$MFL‡Á\0TMf\Ð-LIë“¯’F\Âs`™a#|!\Ó\r\Éc¢¨\Æ\"¥¢D\n“œ¨ðQZ‚‡ÿ\Ä\03\0\0\0\0!\"1#2AQ3Ba$4CR%bÿ\Ú\0\0	\0ñ\ëÇ¯¼zñ\ë¤\ê\0µ\Òž¥®³¨Ÿ¶¼lþ<lŸ\ÚR\ÍxOøñ¼g¨QÎ½¹\Ï\ï5\Ë÷×€¹ûxg÷ñ+þ\"£\Åÿ\0ó*ÿ\0(ÿ\0\ç\ÅÇƒJ8×‡øˆD\Ï\íÿ\0{}{m{Xþ}¯ùöÓ¯mþ}·ùš\ß\Äûoó\í\æ5(-xKR’×„µ\nž9ˆ…Lþ\Þ	ý\ç\Ç#÷ˆ™ˆãˆs\Ç\í\Ïø\çü|\Ïñ\Ûüs®u÷\×]u\×\Z\ë\Z\ë\Z\ë\Z‘\×X\×X\×]u\×Mu\×X\×\Z\ã\\¯\Z\ã\\ž?\Ï\Z\ã\\F¾5\Ä\Zø\×¯q\Z\ãýÁøŠ£ûW?¦r	´EôO\Þ}ú9\ât6«”ñ‚YG\"en¸ó\ËbýY\×Q?fùS1Ï–&\"cDk\êFv}qi32^\á3òŒýµ\æ5\ä‰þ\ÞóûGcþ`§÷Ž\Ñüv\âL9);5‚&Mö³Ô«G1¥\îz\Ç?5c=PŠ B\Î\àJ¾]Û\î(.¦m¢<]\0\É\Õ0\ìDYŒp>\åV\ê¼bTþš×]5\Ó]5\Ó]5\Ò?‚¾¢#ù\é¡ \é33\Ìs\0Sñ*˜˜\×H\â~¨Wi\ãP‰„G\ï¨DD|£‰ý¿´\êW}tˆý\âC‰\Ñ1£2ûˆ‡:\ÛR¸™‰\ÓIUÇ³\nrF%~Lºu\\³\'y3È¿ñK­PÌ¸lÜ˜ó‘²	š*\ÐÉ™Ó«‘´`\à“=‹´)rŽG\Å\Ô#GOˆ\î:œ\ÄÁLH”Cÿ\0‘DER\äýktdn|´rWBU²\n³=d f51?ÌŒ\Ï\ï\Òc÷\ëþe|\êW\Z\é¨˜\ÐA—\Ó1	2‚….f&FD\ÈO3¡!Ÿý‡e+>¤ø½V?S\â\Âˆ\0~¢€\\\è€þ\ØOÿ\0:/ŸÁun8kFx€†$¾4\Ë.€ˆN”¦µ\ÞK.kc¿\Ð\Ä¶N\ë2˜D\Äp!©_1<h§¨L.Y\rˆ2 a\È\È$[<4d<sZ%A„O ð„\ÌA}|¥M\íÉ²\nÄb\çBÎ³\Ì\Ä\ÙWižD\âNuS&\åG‰‚p\ç†&r•\æ?.?/žÈŒ½n\Ý]\njž=Î‘\ÇÛ¦§t¨>\ZM\Ïd,7‚±^\Þ],ùq\îW.fz\ëþ•„<¡òq4\å¶\Ï\ÈR\Õp\" \ÑYñeq\Ø\ë*\äF1‘T$\ëUz\Ç1’i”Äˆ¶å“™b‚D„L8˜\ädùˆˆ’c g†i\'ý(‚5÷R¦&|„\rk°e®ƒ\Ä|HD\Éi¬\Ç(r¸\\ø \ÇôŒH\Ìó xu‰eo\Ê!&Wdª´Å€–D,Xš\Ó32•LÄ‚Šx1\×ií¢\ä´GØ @Ndg‚X”—:†šŠ><\çð=\á‘RH\í<Œ\'½vC*ËºxÏ»Ÿ\Ý\Ã%%\â\à…p¥{\æ¶ „ß“\ë	»ŒL6\è.·\Ä\Ôbù–5µ\Û9\èM‡öž\Ü\ÐCË““ó”\Ì\È2:Dõ$ƒ\"c¢¨¶~˜\Ñ\Ó`Ž´\È)U¥\â\Êñ#1	$ZÌŠ!v `E3]\Â_R\ì.!|3KTJÇ¹V]q‰#)Ÿ—¯\à{B\ê\ÉX-\0šYzRfXe2	ˆ|\ÄK\ÐE\ã\Ñ\Äù\'ˆz \ây‚\\ŸQ™|r™(\Ò\Çþ0\ÄDAF„`\ã‚×„»~‚L”O1\àƒã®„&\n`DL§\ã\Û\ÌüøcŸ¦d\'Ÿ‰0‘J9/\â,ƒ€IE,XœCPÉŽ&UB\Þk?\Ç\ÄÄ‰%$\Ó\åU@\æ Œ¼423.uZÃ„¡™»ô*‘v°\íÖ”¬¢¢\Ï|\äHzªü\î{\Î/¯)ü¢Ô·~*Ó¸þ¾A{\Û+\ÚA\í\Ò÷$E¸\Êgþ\Çû¯\ê±þ\ìX}\ì†÷ù‹Jõ\nC\íq>¡\ÉG—\ê%nc\Ü)[\ç\nó\ä­/pc\íLJ¬ª\ÝSpŒ1\è‘W15ÿ\0O%%f¿–_\æ	ˆ\àŸ\0³\î:eú°d\'¤0\ã\ÆViÄ¢F$SLˆ;2b†q\îb3\'\Ù<\ÈhPvbJa\Ê%/ó‰‰ŽB|0;	~Ý„x‰‰fu\í¹ù…\àw…k\â\ÊùZ\î\È\ÜPJ1÷|˜\æ‡\Û\ÈÝ©%\"\Ü~\ã\'9µ•‘§5\àž¤6­‰ó1\ïV>’fÍ—fw(%m*ñ\ç³{«#¶nw° Á*9÷\r\ÜH\\]\n‘¸˜\r°šH\Ú)$M‚\Å\åkD	A¤|>d\ÎF›!«y$†~³\ÇPnJ\èTªjôþñu“¸[\äq\ïd+·d\Ó6“‘¹\Õm§r\å·\n…j\Ç5Ò««QBOË­‚¼u\éÏ•·+\äjˆ„XýDB.t–&-·&rBuW–\ÈW\äD¿È°\Ç\ËmN°õ‹\Ê\Ëˆ9ùšõ\ÊÊ­\ÓFf9Š÷\ê[\æP\éwŠ9\í\îkvr«N$\Z\ÃWy˜0by\ã\Ý\ÏfGaùs0Ø›‹‰\ãšyJC“e¬¦6¼Ð¿bV,½E ,?.¢Z¶\á\ÛB\Ìþ—«€½jç¯Š¦WºöE\Ö\Ù.s·FMX\ZC™¬!a\î\ÌYM\Ü\â\éÐ­6«[\Å<®nfdŸªJr\0û„\Í\Ù\n)\0¯\Þ4\0Šr-e°6ªùê…ªñ\\\ÖÄ›±JŸ‰\ÊN34«¬¶w\ÚUó4ƒxZ\ây§Rœ\åm;‡\ÚCq÷I,\Ö>\ÌWÊ \Ý>b™ˆ¸p0%©‡…šò±¦¬TË¢û·&\ß1±6)\î\\}\Ó­\'n³Ø˜ª\ÈI\'«W_\È\Æ\r¢\Ø(]v¿\Ûÿ\0B0p\Ä\Í{Xi6\Ê\ÂeL\ä¤ý\Ë\æ¦Yr1.°™ôA-ðp¡b\Ñ.>‘dru\ÕqJ‰ ¸²\Òl»ß“¼¸ú\î\Èf”\Ù\ÆyÖgV\nQ´\Ú\ï»Z\ÕeÜ¶œ†Vj\Ç\Ó*\énX\ÝfW\Ú\Ð^x—¥P*±›{*ñ(^±ûW$À”˜^·a\à³\n°\ÚÎ†$²9K¨P\Ù\ÄLM¦N¶ö9ym\ÅJ‰\Í\Ò\nyÛµ•­I±E\Â\Ëo\ß1YÙ­#-­my*n£57V23r¥e– \â#XR\ÅU\Ø÷Bµ¥”—tó\ZÁd\ÓsP\äf~†v\í&Õ·»‡\Å8\Ç~Œu\È+%µ±ù\à›\Ø&û\ÛXû\Þ\Ëp*^<AT°«–\'ª\ÆÍ«–ê˜¢À~%.)#\Ól\Ú%D%Ef\ÂLû8›q£Õ§\í@ \nZH>“+\Ô4«\Õ!\'1®|÷\Ça.\ä\á\ÖÅª\ÆV®·;%{•V†\âpûƒ4»“Q¸èŒ†@\Äd,«4¹x˜½©e\àŸŒNJ¬\äm\\¥‰\Û8¶×Ç›²\\\å \ÚQú\ÜD G%\Ø\ä	wÞ\è<ò†ß‹I1Ã¿úø\ë{uP5r\á´o¯¢Ý£…¨ež¯—Á­™\È*ùŽ×œ]¶\×k\ßIe=r¦\èt\Ò\È\Æ™9xdªx§R™ 1ñÆºÄ]OJ—ÿ\0jqö2Xù\"®š\ì\É\Øtû–\Ã\Ü1,­“±Y\â\Ð/\îšd\Â\Ä\æ,\â\ß\r“0\ÆnŒtWÉ§9ˆ\Êl\Ç÷¡n¦]\ëepv\Ù\Ì2ší¾¸SRO¬jRÂª%¡\Ã6Ë© •ø\â¼~NxÊƒ¬—Š…º.\Ö8\ÌRÁ\íü X™\ÕûeŽ²»„JÛ¹2IR¯œÈ…v)—,òcT¿C³þ¿Š\Óô\Ç)D¦%´vþj¥nI9lp\Ð\Ú×®\åG››p4mM\Ð\é\Ìi6+,À¬%©Û™|Ä•\ã(fjG5\ÞYk5\ç­\Ê\È\È\r¸ŸÍ¹eqLD\ÌN‘š\È z¼¥\Ü\Û-Œ]·Z\Ü\ÆRLZn\î?\âòY»oKIÀge6\ê®\ít¨”\êg”\ÆEÖƒ!´²\'‚#h\æyŽ¸‰\Û{Œ&a8…m]\È\á\Z?\Ù{›ŸÌ¼0_\Ô\Ü\éõ³þ®\âM¦g\ë\Ü\êô\Ã\Öa¹\äzY‚‚\åÙŠ^Ÿ\í\ê\Ñ\ÂòA´p\ÌD\×~R–À\Ù\è!!©K\'K\Û\Ì\Ü\Ú	Cq™!\Än,{–Q³\ri%Õ˜a\Ñ\Ñ~ª3\Z¸\ß3Fj\ë¹ß·eÅŽW\â2—\ÆnF\Ýe²!\0$lK\nŽ«†@bn\ê¶#f{©\Üg\ÔV|3t(’\ï\Ì3\ÂdJ=KYF	\nP\Ïp´.…\ä3õ\Ø\î¾±¢µ\Ë*$»1\ãr‰\Ï\ÑrC\ÊD»P´&®\×;Š&R·\ÇP_±‘\âxr—q\ã«\Z\áJI‡7œÛ¢ßŒV\ÄE™#¡\Ä\ÒG\ÆÕœ0aYŽT\Î\"Á\ÌMV2YU½+\È\ÚW\Éi\Î\ÐÅªju&\Ç4òR¼”}K6Ý„O¨¦Ê¬Oük\æ6\Ò0L\Ô[t}¦/\ØìŒ»ƒõBó\åÜ\Èc?­[ª<n\ÔÙªð\â›\î\\8VEo¯¡cyWqth¦l&Jû\Ë\rY†˜‹-\ÆŠ\Ã\åu1´¢Œ£¿¢’]vX¼±¨«µ-r\åYš\Ù9ƒ\ÆVˆO\á\Ñ%:–ý\Ä›S1õŒP\Ðñ\ëtd£ŽQ‹1‘tÛ›\ÑbôP:¶Áu\ÈÇ¹—†¼}\ÉržR\Õ\åoª8v¯ªýMúx¬‚*§\Äy‰]K¼\ÌMŒsý\Z\È\â.*¡Ei£\ç¢>K5‚õSù8Y‰„H?è¬•\Å/\Ä/÷4\Ùÿ\0g\í(»þ¾E¸lŠ\×,\ný¿x\Ò\î9Sô6¾ãº˜\ã±å±—\'þu†\'ðŒ£\Î\Ôs\ï(\Ës>\Úûnå©„ÀnK1_Ž,ÿ\0ô+2™ž&—žE¨\ÏO^¤Egò\ç\ÙJ/˜»\Ê\Ù,F_…eS‘Àdpð·¡ÁU.²ep\ì\ÃÀ¬\é\Ç°œ\ÕQ6u,±\Ó\ÇŸZ½†•ûj\Í\ÊÐ¬‰‘R\0²\î\Èõ“E\Ý=B)µ”\ÅQ™Ám6fª¦<jÚ \Ò\Æ\\&O\æq3\Ï\Äj9\ã\æfc	p±\â|_xyVBú#…\Ø\ã\â\äW¥G|¶’©`®1#*bª\Û»\çà¸Ÿô\ç\\\ê‰>Meò\à–{\ë\'Gp€Z§zk{ý¾YJ6\ì×³MÄ›*™	Ÿ‘]»iþ‚\Ë#­\Ê\Ñuj):„VRÿ\0ë©‹ˆùY\Ìk±üH\Ùh\Ï\êNP—ú¤/†ûv–\Þ\ÏTmm\âªcrÜ›mõí‹°†4²õr WpÛŠ\æD‚‘/\r¸°ñ`p÷Ÿv\Ú\Â(‘(Šf\Û=\ÜÀ@«CŒ‰6\í þV\ê‘¶û\\=\ÑQ–óµŽ5[o¿k\î´+\'­Í‡<]œ¸\Êl—-’\0a\Ï\Ó+GX\âbj‰þ¡šŸO\Ó>Ùƒó1+/´Œ\Ä\êc\â5÷ˆ9)K-h\"!š¯š¦qÅ„\ßÌ‡2C\nÍ­‡À[M\Ðdõ?ô§h©\ÜU>~®F*ª,jYÁX¹S†\Îm\ìŠ-Q\ÉQÝ›‘u­\ZqN^\á\Ã].TR›ÿ\0\ÓŠ/\ÖKûI\ß^IŽ$¦c\â$§ù/ó31üCOŽ\"\0\ÄÈ‡¸52:–\Zõ}Á¶F\áQ:bÊ•ªA‡]™\ÉG+o{øJØ´³,š\ÉF<\à÷g\ÆE®\ÃÁ\èX¿@Ú”î©ª|nŠ\Æn]w.ž\å«c% \Ë/§’F6\Æ9+\Þz¼ƒ…9’\\n\"\èŒ\Ä‚^ôAuˆ8Ÿ¼\Ìü\Ë±úŸ¼DG\Ä\ÌüN \æ>\Ú\Ê\å~ó\Ü\Ë[ˆ¯±¯:8›„Œ\Æ\ÜdM4/ƒ\Ô<„øžu·7µ\Ìm\Õ\Æ\é»}ùµ%òÊŠ¯q\ÜF\Í^\Z\Îk»J\Üjžr-`\ÛL6\Íewº…kq9Š\â—Ù W1úo:H¶ÁH\ÖS–\Å|Xcr\Ô\ÌÃ²ÅžÃ¯\ì\Ó\ÏUaÈ£-É”v)\\zÇ±ž\Ó\Ü^\×4ºýv~7s\r_\"\Ë\ìd;\'7×ªk\Çiþö2XtÃ¸\\žB‰0ˆ\Æ\"d¤–¦V\'ò«\ÔF¸+96|N·•S=®û ýóO\Ø\ÛYŠ\á\ê-\Ìnwmcwõ…“³“\È2\nd YWI\ÌYLp\é\Õv}ˆ­F\ÜLªOÀ™•Éôb\â|‘?11õi\èˆ.\Ð]&#\í\àž~\'1nnd˜Q4Q¥,4\ì^dPV\ÙC•üZ²\Ê\r¬Qá®Ÿ€Uj`Cˆž\ÐÂ™úcñ¤DvZˆ™…2®e\É\0\ìE\ÆXnJ\Õ\ÚyFª2•[”§“\ÄF\Z¨\åw\ë\ã\Ëµ*IÛ¼yµ‹ð>F*¡\Èò¾	¹ô\áð{z®K/¤\Ûc¶‹\Ù_~\rÅŠŒJ\ÅS\Õ?N95\å™r‰¾Ÿ\Ø`žq¦Yš\íò4\n\ÐÔº\É=]z‚\Ó‘\ÇÓ·‘s\ëSšµ\ÚF\Èl\"Â¤\Z±8)j­™\\¯Rý©\ç·\î×¹\\0[†÷¨[˜C\ZyQ²\ä>Z¦QÝŽAñeUwV2\èÀY‰\Ç\ã\í\Çj–[ˆ»R`†‘´¯\Õ*\Í!ƒ\Ò\ÈB\éÙ‰ö\Í:_21#ú€\Ç\ÛD.~‹\ÂIÇ½¾L*B\ÆeaÙ¸\Ø>Ù›Z¸ˆœ.Iõ\×`—\ÆNw«6½\ÕEY00„²V&¶’Ë˜\ÐY	™­rÈ+\Ö(±Ÿ\\ž>»fN¹˜^­úL2v¸8œŸÁC_‘g½\Ëó&†k³`dd\Ðc&a”\Èü¬.*\îKù“…KN½Kkª¶Š ¼†exªk\êU°û}\ÛxªlŠ‘\Ùx\Ä[\Í\Ô5\Õ\äp[•y<}•¾3V\Æ/V5i˜ô\×i®ƒC\Âùó7ôAJŸ\Ë\ç0{Š\âs\ÇCªÈ­k\Öó\Ø\Ö3¤9&³{?u$\æ„³ˆÊ¤\æ,\ãƒp\ÆH+†*\È\ä1Àû¸×’\Ö\Ú\ÎýIˆf‘¼(]!÷€\Ã[\Ê[^ W\ÌÀZ²©ˆY†Dn$‚»F}­Œšÿ\0ü›‹(Û£ù·Y¦l»ôœòx»^œØŒ¾Õ¬‰n7n«»\Øü¨W>qF§\ë\Ë®buó«Vb­idÊš\ÛwA$×­¸×¬mY¥±|ýeöYOå±“=f\'A\\s+Uv,Z`\Þ‡ß˜+vš=D¬eG\Ú0¾—\rN#¸ašPy²›l‚LPÁûG\Ð\Äõ}›.h(5ð]pc³HªÔ¿½\ÝÊ¥½µ*½’%óZ¹7\ë\"\\Œ›*µjŠŠBÀyÄ–+@[©3\0L’\Êw.8jý\Ó\ív$\Ô\î“]\Ìzq‚Ê®Y\Ó#\è\ÆEI—b¯\åvžc\Édq\ä‰ã‘…•Š\Ç\Ý,F\çÈª _(\ÜôšQZ\åk“\Â(†Oa;H&cì¯®Ú‰(É	\ËXÄµ66\Ý\æ\Æ/(‹.Š6sØ¼C½û5D«®Íˆ?­\Ñ	\×<N ¹emy¬À\ã\ì\È\ä\Åñ«\ãNþ0\Ñk0˜\ÌOq˜ûDG?1\Ç3\Ä\ç\Â/c‡,+®ö\Âd×Œœ¥…GX\È?),‰‹…OÇµ¼&|6\â¼c\Üge\Âú¬\äòw3–ð»µ.¹_½{\Èsq\ÙÄ·\ë3µ7\r;r\åU\Ä\ã¯×•\Ó*ˆiKŠŒ­wÄ’Ô‹Ä‰&Wh \äLE!$M×‡v0S†OŽ­”,˜s)v9\ì‰`²ü®V)Ee\Zb \Ã\Zgºž\Ü`Ø‰ƒFg\Ó,NQls±yH.*	˜[™}±˜\ÃNKh(ýºH—1ª™\ì•9ˆ\Ñ\ÞË‰ˆ\ÈTÁC7aIeÍŒ\ë\Ò\ê\Ùz½=M™\ÇQ\Ç\Ú=ñ³°\ÉFU8\Ý\ß~½‰¾\åL–ç«¬e‰ Ÿ˜²\ÈMs9Õ‚Ÿ\ë‹s›\Å\Ô\ÞK¢3Osfv\îs!”¬y\rÄ­­”“r\Ç(½¡’<W¾‹ŠCL™§K&8\ne˜m\ìTi~“À.I\×e\í,tA_\ÈNC`bK…\Ög©\Ø\ê¡\ã\Ä\ã-ú•\ÂT\ÝË¹²	•¬Vk#GwmŸ™\Â\\\ÄR¬g\Ò@\ØD¬TÅ´½1–‚\ÛYK€\ÐQŸ,\Ä­u¾\\~u¬g´G0©„‘³ògÉ¤Õˆ\âL4(\Ü:¹Hv­\íž\ã“JÙj˜dv\Õ@\È{\Æ1žP˜:¾80+Fk	Š\Õ\åb\ÉL§•ô\ëne%Œ±[)è½®„\Ü6S/²s¸Q\í‘Å²±Ds¬{f¦A.×£›Æ¶?e\ä‘t\éXp\Ó\ÊØ€\Ã\îS³¶*nCVfø¿\"÷„\ãûaõñ\Â\Ép6\Âv\',^µŽ’\"kcn\á\ã\ï1\Äqú\ÄGö\'²‰ð8\ëˆ}%\Ã\Ù\Ì<eZ\ÜÛ¦®×¬x·«7óY\"™³lq\êdF:°O6/-x Ÿ¸Þ®™ÿ\0J2ò@öc—\Ç2qr\Èò\×\Åî¬¾\Èñ<\'«·€\Å9š‘j…ªrŽ\ÜHe+°\åK—\ÃZ@Îˆ7Á­R‘¿ig\"\Ã)\È\Ìt]¤\Õ‘=\Ö+Jy¯]†¸.†\Ø\ë\0JŠ\ê>;©´9‰”‹*9gÉ©«²¡]¶,£\ÜD\ÛòY¨U€H½¹Š\æC\Ú%¥¸=<Áe\ÔCbŽo\ÑO\Z\Å\ØL¥\æ6U\ÕFr•\í\Ý\êld¬frô¶^þ\ß\Û6î¿¿’uF\Ù\ã\î\r…B÷xÅ…kgõª¶fiD\Æ/);³/õe‹wß“|o3†\×ÿ\0zU‰ü\Ú¾q\\ò\Ì_ûû’\ì<‡ªVŸ\\\ÑF™\æÈ®YK‡Mƒ2?“8˜™ˆ\ä¹û”|rR2\\‰L\Çq2\Ö	e#Ä„‹$¢yg¦y\ÙT–+¹#.E\r÷B0´‹r*.•1o‚‡.©yŒùm6v\"ñ­%`„ŽIwŽf]\ã)òX\Zò\à²š\â˜(¤ø:±\ÌA2»:HÍ‹VªŠI/r)–S^ÁW°\á\'m\Þ_\"[W;\ÆFÌ¡\È\Ègª\Ü¾wFÑ­š\Û\ï«\Z\ÌQ\Ê\í\Ë%O+V\Ý\Â8™2sb&{‘7´ð:‘™ùtŸ\ã\Ç<ñ\ÇY\×]uŸ‰Ž5\ÄL}\â8q¨Žu×ŸBçŸˆ\Ì\Ìq©\\\Äk§\ï\ZŸ\â\"8\â5Ì‡Ž§o\'bAo\Òü¶NÀžh0\Û~–\Z5*‹fa³™u*PI\"°\Ä5œ$|GŽÕ¢¨ª¶³\Â,¨DM	1!-y:˜ñ\\,L\Ç\æ\ê¦|c3\í\Ë@ \å¢\Ç\×rÈ \ÙKDLœ^U‰Žôµg6\"&,·(™%DÍšó$\Ä.õT€,m2Ä€€^\n\ï®\Êö‘™ô\Óee›%^­Ci¹Œ~QÞˆ\åU0J\È\á|\ìù:º\ï§‰X\Æw<\ÌvÇ¢\äÉ±E?1V#ö$OÌŒx¦g\â%\Ç:…s?hOó>™øˆ®SaQs\ÇX_\í3À\äò|{}OK·‚ˆ}JÞ’©g“\ÊG¤óy|G¥Ub¼\Ù\Í#S‘­D	Ä‘.¤>AX—·x„@\Ë\nc\ØCl\ÙaLV¯À\Ë\È\ÄB\ìvdy®¹˜’‚p\ÂlHL\Ä@X€\ÄH`0x‚c90ƒy#\Ô\Í2\ÈW†L[\\2¸…¹v;’Àa\Â\ä\ä\ä@\ám%I”ô™ˆö„\åB5\ç\"`\Ý1o™üø–‡V’\í\Êl²Eª\×&`Ã­1ƒ°l\Èp$\Ð\ÐS]\êPM^KÓ½‰–aoz1††È©\Ñè¯”£\Úf¿ð¤‡|ôz&\×Aš3\Íô>\Ê\Þ,\Ôú-fW\Èf\Ù\è\Í\å\È\Ã2¨ô•\Ì)\ÌUô«›]“³j±‘\Ú\ìJU\Å\\oˆ+²D‚‘AK\Ö\ËAibXP–(fjû$>$˜®-Š÷;‘(¼kªÌ«¬d\'‘	\áS†ž\×\Ò\ÓVµ-k:uÔ·­i!tˆ0¤$še+‰™d@ƒ8‚a)‘#ù\Ò(d3\éYHÅ“ R\ÈeM2± E!1¦\0¦»P\Õ\04H`T\\uA‘Z1)¾0˜>\Û\æ\ìO’\ÒW\ì\Äú\ãù»•«Z\ÑEt‚Ü‘VDb\ÄS‡½‰WYÆ°‚¿q\Ñ\ÓC¸†¬”q²UÆ±K»y&»\n\ÅWy¤–,¥qŒ9÷DJ†\ÅSò\éOq¹½\Ý²Ç+½³‹°\âeP“\ÓUz!A a\"õ÷‰šÀœ2£)/™§2ä¨›\"R¾²\ZC¥DR5”\ÄyHj0\Û–\É4\ëaI¶Ã²\"\Ïÿ\Ä\0;\0\0\0\0\0\0!1A 2Qa‘\"0q¡±\ÑBÁ\áðR’#34@CSÿ\Ú\0?\0…\n(\ã`¨*\n‚ ­Vª\n\ÊVR ¨YT(P¡B…•¨P²¬«*Ê²¬«*Ê²¬«)P ¨*R²•¨Ž2§Œ©R¥J•*T©\ã*Tð•<%J•*TõeJ•*xÊ•™f0Y‚\Ì`¤)R`¤)\êÊ•*T•%J•< ¬ŽB™]]]\Z4\ÑaPTn…B…•BŽZ¢\ÑB\r•Ñ¡L,Y-ow\ìH Eƒ’-#\Ø\ÂeA¨´,«)YHYJ\ÊPb\ÈU•dA« YB@pž®¼\'Ù–J4\Ê+\",<a4 5Eªh[-øˆ\n!‹VP‡ZxGQ\Ö=I\êOPˆP‹;–R¦`³\"\åf‚2µA\Ü!;\Ñ\ÑH\ïY›Þ³õ˜r+0\ïR‰…¿V:ƒ‰\á±”T(Dk§%\ÂhU+\Z\Õuˆ(\Û\ÚQÿ\0«ROpþ¦aôû,\'û\âPÅ­FÔ¾‰¸µ—\ê¥ôL¼Âª\î2û\Ä}\åv\ÕÛšƒ«\á4X\ìµ[Ï—Ÿ\Ý~CO\Å~GDn>h\áV­\Þ<ÿ\0”l,\Ç6ùÿ\0(\ÙÙ\Ô<ÿ\0”m­†\Ïh\Û\Ñ\åPy„m\Û\ÉÀ£@„i¸r\ëG±\ÙJž¨p;ð†óE£’”;(\ïT,\ßX\È\Ðw£ski¥1\Ýü•\Î!^±‡;O’.*S{¤©…F\â¥g¦\â‚\Âñjxƒ}\ä\ß#ü¬^\Ú\â\É\ÒKÚ<«o+7‚Î³,\ÊTŽk?rj\rœSoÒ ”!\âZV\ÊT•™\Ë1A\Å	PŒ™Ž¸p\æ‚ˆ	 N©\Ð…0²•°\ÍX\ëÜ®±\n•ýQ£{‘9D©\â\Ý5\îEO=\ÌpsL°ûºXµ©§W´4?p±\Ù\Õ4\Ýð=\árP¡ýB$jš\â\ÝB¥pÓ£‚#˜\ÙH*a(R€P¶RTU€ðP¾dtDIDB£`\ê¬;oh\Ê{u†]š®p?\Ý\íª\Òí°O\ì€\àÑªv\à8\á÷¯³®*·\â;Â¿´§‰Ú‡\Ó\ßpeR›©¸µ\ÂG©\Í¨P²•S¬XSÇ¢\ÐˆQ\ÂBžxÂˆS—dó%j§U€\'t\ÚbD«I`0tMq\æj7b„R\ÊÞ¯m€üO\Ãö•6¾\ã÷•WðÃ·¥S\Ì}¾\Éø\í#ØŸq•ZJz=¤{Á\n4XfoK‰0\Ö\ï\ßð\n\Ï°-\È\ã\ïU0[\Z”\Ë0<F\ê\êÎ¥sIü¾c½~\Ä:\'ú+ÎŽ\Û\ß\ÝñXþ\ÒsHj7º(ñ€‰D…*x9¼\Ó^B¥ZtDÎ¡I(\ì¡¥JÊ™^ª\è\Ê\rAQ§š °7P©™U\ÅALšq<¥Q\Äêš€Tdò\Ðþ\Å6£‚m\É„.i‘®ŠžW\í(€\áV\Â,«v\é‰ð\Óè®¿»5©\Ó\Ä\ëæ›‡â´»ÿ\0·òŸŒ_Y´6\áƒ\Þyùh¯¯j_T|\Ú­2~/mýn\Ð\Ðýþ+ü<üôO/²~t\ÝÀó_”\Üsa5ÿ\0¥\"¨\Ý%\ç˜_”<n†F\å4ù{G5\è,FÁ‹\ÐX6\Ñ\ËNˆ°óB“·±\Í\Ö4EÁ;¢!B\Ð d\ê‰L„YU*B¬õ|¦žJ˜…&ftS¬\Â×¹\0ª—\ìµ~W´\í¡\ä¬ñQ¤t€Ÿô¦\ÞGh&\ÜSw5^»h\Ó5°WWo*\æ;‡\ÙX`\rŒ÷>_r«þ·ªOFKc\â¶}‡V\éhñ\Ìm#û\âŽ,G¤Ss#\ÂG˜T¯-®üo\âmMû„ü5‡²a:Æ³;%9µ\Û`?%4y‚ß˜B–nÃƒ¾IÔœ\Þ\ÓO\×\èƒXí‘¢¢ Ü\Ô,¤nA¯\å?T\ë9\ìR›©\î©\æ³Z Â–¢‹Ej`•Vã¢¦\\½.¶lÙŠ°»\Ût]9YÔ…VÝ•\Ú•=”\êtŽ2GÁhVP¯©=ôaš\ë²\Ã(ú;zG7S\ßÜ›t\Îz*nh¥\n­†Z\×2ö	\ï\Øù„pº´\í«9¾\Ö=~k¦\Ähöé‡Žö˜>E3·œµ	a\îpžÉµPK`\êTŸ¸U0\ên\ì¯F¯K°\ä\ç»j\ÔÁM\Øqo\ÕtoKdx}e\'£l9#nS¨\ê\ZlC¹\rý4\êb!ú\Ï5qa\Z±–˜w\à5*$©R­¤¸€¯]£Z¶V•\ZÁÈ‘¸D©@¦;Dƒ!\n!¤jº(Ø¦Ô¨\Þršù\êcO};B\æ\0N›‰M}Z.\Ì\ÒZ|4Vøý\å=:0¨~  ÷T|þŠ•v\ÕnjN\åv\á>Õ®\Ùr\Ã\ê’¸ˆ¨AƒôFGh\"j4\Âu²\å\Ð\ìS@©29+\Ûv:H:¨2ZPi”k\n¶\Ë:\Ì8[’¢¼’ðJ:ž•zJ\r(”J”\× \äƒrD\éÀ—#s\Ñ	q…O¦\ã\r¨’§\\;C\Â\â‹k\Òu7lB­nZz\n\ã^G‘ñ\n­3Må§’’k‹™†x\Ñ[\ã×”tq;ù…oø†\ÝúT§\Ì~\n\Í*\âi¸8x*\Ü\Â5 O\Ã÷\Ù\n\ä\ß8þT¼÷Ÿ\Ù¸\î\äiŽk£gr,gr-j|®©\ä©!7dw•&Q\0<!Bcœ\Ã!\\Tm@\Ò7Q<0ªƒ£-<Šm\á £ny\'R{PA„ƒ‘:)W×¢Úœó;*µŸYÙždð²\Ä\êP9_«~ž\åmtÚd«\ÛÒ¸nJ‚B\ÄðŠ\ÍnfzÀs\æ=ý\è¶VB€;&‰ \×\Í0|®1V‡hŸ˜ý\å[\ãVÕ½W§\Ç\ï²qU¼£K¶\èO\ÆhŽÌ”ükü[óNÅ« \'b\Ï\êFê£·qF«\Ï4N…5¾ªsL¦²wE€\î qž\n\Âi\Z…ÿ\0ûZ§\Öo%\é5\èöþt\Ëún\Ñ\âYJ®­2ŸjF\É\Ìswpk‘:,\Êþ¹¯\\»\Ðqä°«Î‰ýŽ‡\äS*HYÀ\Ý²­‡[\Õú`üŠ«€\Ú8ú®->Tÿ\0\Ãuw§Px¤ª˜%óvh>\ã÷O\Ã\î\ÛÚ¤|§è…µbrµ†}\Åaø/DEkO!\È{û\Ö\'ˆt##;_D\ç%J(˜@’\ì¢U\\ÀJ$l\âS¥j (PD„t\ÝL¦Tu3™¦<Z»72©\ã\rwl&›ZûDù\'X‘­7yÿ\0Vº£\Ú<\Ó1<C\Ä \Ú5»%:\Ñ\Í\Ù–\î‰Uje¦\çx\0 al‚°¸5\èµ\Ä\ë\ÏÞša ðt)Ï¤\ßV£‡\Å:Ú›µ¦|“…j{^”ñ\Ú^—;ª· 4‘º©Q\Õ\\\íøüV‡•·3ƒ4lˆ)‡H(“ºBŽÁÍ‘i‘•ˆ\ÙQ\Ä+R\ÐKJòL­ip5\"|tN°ZfM\Ýµ$\ÜE§Jþû‘4jTÂ¼¤\æ\ÑwtÜ¸§¬9\Ôþ(*\î\ë\Ñ\éf\ç\ÉT¸¨÷J·ºvh%2ö»?Tû×§\éQ¾I\Îc»=\Å]Pƒ\Ò7\ã\Â8|Pó@\"U¨™¨Va\É9ðš\ä^6Rz\ÒT­x²K)ð•\Úô»T±·mU²™k\\A1\ïN·aÕ‡\Ëûûªù\Å\'6wPy-ü0\Ç\åºoŽˆ+¹\éj\å[U®\á@P8\ÜR\è\Ý#cÔžò“ƒœ#eJL4 ž$¢Â€…ðö2T([¢Ày#LòDÆ\ÅJfZS1J‘Ÿ‰\Ì\èµ\ã`\Ò\ëª`w„i®\êôT‹“Ý˜“À\Êc\Ü\Ã!Úƒp…ñ\æ\ÕoMõÙ¢}³p¯C5+¤\å?º\ç`|£\êº3\Ìüþ\È1£Ÿû­;§Þ†nHˆ\ä\×ò}Ö…	Q\ã\ì‚*T©[¢ÀQ¦y\"\Ò7\ê‘\áa&\á‘Þ¤µM7úµD„ü#˜\Íû¦\à¶?\å?ùš%wÌ¯\Él\Ç\æS0«ù’žÄ±ŠTe”µw\É\noy\é*\êO/¿\ÙT\äºs]\åRnÚ®›¸#UÇšž\ä&\Õ\ï[\ì -{ö £O¹F\è:pµ¸}µAU›„\Ï\Ä.Ú£AM\Å\ì\êv™\åV¥…]g\ÌõO£dv(ú\'Q¶\åõpýÑ§D~£þ\Ç\î‹iýŽÿ\0o\áÿ\0«¼ÿ\0„\æ\Ó:\ZŽLm\Zn\Ì\'\Å:ä‚5žw(’wêž¥\'\ÝTµx•*W¹e%O\àˆˆŽ3\í%Jž¬ %6™; 2ˆ\n\ÙHS\íg„G	\ã”.\Åd+!Ycu¯*zš \nÊ²¦\Ó\Ê…¢€Šü#\Âz°hY\èüWFº5‘t~+£+£(0sYZ\Ü7D\nPqY–iS\ì\Ô<\ÜOÓ.H(\â8ˆmÄ®JT\é\Ä\íÔ•ÿ\Ä\03\0\0\0\0\0\0\0\0!1 AQ\"a02Bq‘@R¡±Á#bð\Ñÿ\Ú\0?\0²\Ë,²û­‹E¢Ñ±h´Z-Ye–Ye–Ycf£Q¨\Ôj5\ZEš‹,²\ËE–j.\Ê+ºŠ(®\Ê+ï¨¬¨¢Š+\îM\Ðhf–icL£K4²™O*e2™L¢Š(¢Š++-jF¤Yeÿ\0e—•–Y}›÷9Q¬slRešž[eÀ÷,R/+,L±2û66\Ê\ËÉ±\ÈlM–jF¤6‹C’,²\ÍF£S53[\Í\ì‹/*)n¸9\É,Š\Ër\Ë-\Z‘¨O±»\Ø\Öj˜÷\ä{eú	\É\Z¬R®1\ÈYò5’É»CY#9\ÙcÝˆ{±o\ÝE›d¤Ye¬´\ß&”…\Z4š]zÂ£‘ÆŠ,Rbmø74¿BŒ½\ZM%\n\ÆÇ’,\äo:¢\Å\Èù,l¼¬{••‰‰\åh²\Äòl²J\ÑLRHJr\Ý!`\ÍòÏ³\Ë\ßù:-pÎž\"\à\êMr/ˆ\Ä\\kŸ£\íX‡\Ú1\Ö\Åôu&ÿ\0/ö57\Ì±IþVhO\Ù\Ó~š\ç\'—’•\r÷\'“]–\ÉBPü,\Ùòji\Òdf\ï‘\ãM::\Ûn,Hµ³\éÂœ·–\È\ÃÁŒU–¼\Z†ö!²³W\ÐmKi˜N?2\à\Ãq{4*£Y\Ô,¶je\Å\ì\Ñ?†‹\Þ-lÆ²\ÛÈ´›d\Ú516ò¼\ì²ó¡\ÂUQcµ\É=†\ÕpF7Á+\à\ÃÁQ\ß\ÉË¡¦\É\'Áöd¸¢€­\Ñ-ˆbZ\Z²;šK¢Ç•ŠTJ6O\Ê)®Je	VT6)–¤jE£R5#R5H\à·Ç²6¶´FüÃ—„CJ\\P¦ŸONì¼¨\æD!;Y\Î\nJ‹p–\äejÐ•e.6ø\ÊN™¨\Ô)–™(ƒ|\r\Érjbo\Ùl·\ì·Ù¾[±¿dR|¡=t8	\\\Åù’\'-[¼ù¥y¡|G´,X¿$]»1\\\ÅÐ‡ñ~N¦\"wdq\á¨Æü\Æôº}\Í\'\ÉH¤8¢šðJ$\á{2Xn%vVTmT$†RÃ¶ø:‘òIú$Ÿ*{‘•í’«ÜžZ¸³\ç\\1c5ø±`\ÅO|”\ä¸cÄ“¯À°õ=ˆÿ\0ÇµzŒHita\â5³:ñ:\è\ë¡c#¬Ž²:§Q¿&¯¨˜Ÿ\Ô\ä\Ò<(²_|2X8‘E3UŽ[Ð˜¤\ïbš(T†\Í[\Z\ÑL¦S$ˆ\ìu\"Y©\"×³‘\Â,X-ñ\"]Hr¶#|Ši‹q$¢bü[\â\Ãc\ÏM\ÉY)\Æk}Ž-r†²þ…Ñ³Je´jf¶,C¨,AM>7üÈ–\ëbx2OSb’%p6ù&ôÐšc·\äÔ\ÆQ=Rx£x4škƒT‘\Ök”,h\Õ,‡†¼R‹%ŒÓ¦V·hU[f§%\Ã5û_\èù_‘Ä¥À\Ó.‹±–&¼”™¥\ZJe´,G\ä\ÛÁmn‡Ï™<7\îö\Z¢[­¹]‘Š“.¶H¢ö0W/,Hêˆ»\\S45\Ã4—\"Æ‹\äQ„·C\ÂþV%5\äK²	9+°\æ¶\ÝÁ‡‡$\énIV\ÍQ©®¢ò‹L\Ñ\èù—\"•ðYf\Å¡›NŸ>có!µVEÂ‡(H’¯<œph4±s	mDU]ž	*“Y2ò¾\Ç\Í-=…‹5\É{gROhŽX‹‘b_%‰“Á\r7‡\Çþ\ä\Â\ÅX‘R\\2qkt%j™?‡Ã—øi®7%G•De!M¦\'F¡H\ÔY±\È\Ý\á;ð>H«ä­„\ÛÙš\ë+,j\Ì%V~¹b­\Í\Ã41ª\ç¶û!‡©Š)q”ð”–\Ä^Ÿ–Y\àaGM\Ãdüx¿k\Ñ	\ÑÔn9¦[l/›b¥\ÆÄ°&¸\ÜBŒŸ\ÃgLP46t™¡‡ô16›\Øm\Ð\Ú\à_¦[g¸\äò\Æka+\ÝÑ©>M|\r®·9XžVa\ÇL{1°õ+B\Åq\Ùð&šµ’n<f¹Bøˆ>W÷&óBœ9R-r\ä¿sm¹‡,¢Ÿ¡_\ÐIòM\Å1-®²ŒuÊ¬øˆ¨\âµ®í—¥\ÓŠ{š\à¼\Ë\ÊË£\Î“\ä\è®b8K\È\ÑB“ðj¾P\ápKK+#»K)=\É$-òÅ…23”]‹/‘J/†=‹ör~§\Ê-$x9\ä¥\àIú\ZfË–\'\Z\Ú\ÍO\Ñ\áˆüvíªØºG£\å,²Š\ÊÓ°¦Ÿ’ójÇ†¼\ÃcÖ¼\ZÐ›\\1\ÊùCŠðCñ,´\ïc\à[eŽ¸cšY=LŠUTNŠ6\àb!?\ÜnüŠ„¿\ên½!»Ub‰ñLV\Z$¹_Å‘ƒ{£Cõ•vR4”²Œ\Ú:‹È¤Ÿ\r_$°¢Çƒ\èq’-y#V«>y~2\ÅWži^OrJŸn¯löò%|!Å®v#(E\ß?û\êcO\\\Ü\Ç\ìŒSBŒj™¥oBýr¬«²ŠE\æ±\Z\ÚÅŠ¼‰§\Æn	Ð„\ÕnR\ËÁ?\ÂË§L‚¶$Rò&¨•>G‡¤½Ž\r\ÈBMìŽ•x\Ù±¸¯_½ÿ\0ƒ©\á»\Û\Ûýÿ\0ò?S§h”5?”–rŠ­\Ð\ÊLþ™\ß\Ü\ÑE)\Éy“\ã6!VXŸ…”ˆ\ì\ìR—49´<VuYÕ‘Ô˜¤Ï‡øy\ânöF&,`ºxcwÉ¨¶n\Í?SJ\Çù\'ƒ\è\ã“|¬¬¯\îkµM¡bûBið$5YIZ¡\á±\á¿D\\¡\ÃhXø«È±ñ|ÿ\0c\Ï\Òý±\åü‹ö3þD,v¿\"\'‰5\\\ZJ_u¦\è©gY?¼¢²¡:b•—}”Q]ôQE.\Ç$¹\'Š—z³|¨\à¾\Û/º²¼©f¦\Ñ\ÔúHXŠw\Â.O\Çmw¶\ç\âO¡,i^\Èw\'»4³r\ÞoøŠ+²²S’òu\Õú_¡\Õ^Žªôu~‡Uz:¨xÀ\ç6[~rþ¥¿93J4Q§7ü\nÉ¼›\Ü5\Ù\ä]Ë·ÿ\Ä\0I\0\0\0\0!1AQ\"aq‘¡#2BR±Áb\Ñ\áðSr‚’ 03¢²\Âñ$Ccs“£EPTƒ\Òÿ\Ú\0\0\n?\0ÿ\0H\ÑöúO\ÐhÑ£F|\ë\çôŠÒ¡B‡\Ð>‚j<þþ€ÿ\0R~‘\ïôþ\È\Ô? §§ó\Å1ôÚˆ=4\ÓÔŠ_S¤x5.:fˆóSKIþaR:PzZ‰ä¹¢¾hP>µó£C\èš4j[\0~ø«—‡3mf=â¸„^¬}¦®\ç¨õ«—R@­c¨†?Ê–\çFA§Þ±û\ÃøP>JO\éH\ÓÈ˜>\ÇýTPúÆ§\Â**\äEyÔŸ ž§\è\Ç\Ñxš\Zõ#\èÎ¢½ª 74Zv\ïPSX¼¨‘pôQ€\ÑÓ­3´nN\ÔG\êh	\æF#cÖ¢G:  ¿kœDTFØ©\ÄÖ€ñŒQ¶v\"p})A\æ`Wj€\çW1F\Ûþ;ù\Z?A£Gýji4CT|\Ñ ušQþ!H¡qV\Çø„~uh\ê\Û\ë?:6Dø\ÍF(+y\Ðc\à&€ñ#ò­´	\Íc‰kP`ôHŽ<¨´u\ëF0qËB\ÅGAX\ëCW2F\Õ\Ý\Üã—•j\î(\Ä6\Ç\éR6\ÍI<ú\nŒKT“\ÝUñ£Õ¼<*Kqü\è7Z\Éñ¨1 f»P6\Ôr=y\Ó/‘šg\'aJ÷¨\Ú\'®GÊ’\à•3K\Ì$a}*I1¦\Ð\Ó»Ñº\Ú\ïxùŠ¶]Nb\é¥[\áA?iW>\æ®qOø®I\Ö?À\éÅ±\ÝùP`fK4Áõ \È~ø@gÎ‚\ë‚¦U\'iÁô¢S\ÎE[QÐƒ4s#sQ¤D%AÛ¤Ô“÷@“A%ŒjlM}““\Ë4AÞ††\î\æ¥L‰\èyTWxò\ëG?„HnN\ãþ´þ*Ù£ù\Zrz\â»À\Éb7¨\ÇZ&I+9òù\Ñ\Ôùbk‘PIñ™©š’htJ­2H\Å\æµG\âED\ç­O\éCÒŠžªht\Ô~Ž\êý§·­oöµ\rü\éUv+|‡\ëB •‚|\ÄÖ¾²9ù\Ðfs•\éDOSµv¦\Ù\Ôu÷@\é\çOl\í¥q\'5\Çm.	2<b•LÁYzi?Æ„\Å\ã\ÌQuˆ\nE;$Q`F`\È˜1À\ë\ïDúWJ‘£jpX…;ÿ\0BŸ9û&ˆô\ÛÂµ\ÏCƒD\0ƒS\à7¢\Ç\Î#Ê¹\ÄMwI\ç½§aDjÜŸÒ†9\ÍP\Ò\Ø0j@ü(ž‚ ‘$õ&£Ò¼£y©at\Ã\ÌP\Ô:V\Æ×¡\åS\Ì\Åó ~U¤Žqó£\0j[eõiõ¤žF\ä^¥¨^A±*TŸJ\n\Ó3;Q+Í•g©ç±­g™«@¶#]#7\ÞT3´\n¾r¸ý\ìhQ°G˜õ@ß\\%\ïÿ\0\\Kw5vnx‹ 4`Á*:¿\Äc\ìÛ¾·°$ü¨±‚ 1L=-tùSúÜŠÿ\0\æþtG•\Óüiÿ\0÷Ð¸?»?¥8\Óú\nì˜?¨®øè—‚·±\ÇÎ»\'c…º4–òœI¬ük½$\r\á¦)\ìoZAûSÖŠÁ‚L{\ÐumŒmDÚ» V8\"¤œQ$øQb<kK\îJ.\íœUqH\ÚF\ÕbÃg fˆ€EH\ëK\í\\=­Q­\Û\Ò\ÚöRýŸ\ç]²¹%u\Þsÿ\0Z~\å«c²´m\È$ÆŸ:¸\åOuV[\ÒE¶”Á·¤©\'óõ¦à¯‘$!‘´@1\ïó®\Ðk®ƒ\0Œr4¦\ÙPöYL©8;PLK\å¼y:M:–2¨`·‡(\ÈH\ë]–±©^ù\Ö\äy\ä\Õ\Ã\å\0\Zf¼ñ¨L\É;\ËÞ\r„´,¨UfQõ™b3\Ï5p\\Œ’¡”\nOŠ\Ø_º\ÌE\Åº\Ç#\È<\r;ZÕ \ê]/iÿ\0ŽG¡\Øü«²Yú\Ù&~,r\ë@ù n¼Æ£\0@’Iòd+	C4þUbóF\ÇRþ†­]¹m´²\Ú$\é>qp\àio³l¸Þ®[~hHý\r\\dnËˆ>\Û\Z{“\Ý-û†‚·\ÝõÇ•^\à8•2\Ü?w>q‘L\årP!ýzR«\àvd±>µn\â…IB m2`T\Æ\ÔIÒº€öŸ/J6\âb-Á™ˆ\Û\ÓÒ†€€¤ü¨i‚Ab\\3£y¥p\ÃQ¤(Àýh\\\"T B	\Ì\íWw:A\'Þ”O:²$óqšj\ÉO]©\Þ)£ñŒÖ¢?	§‘´=\é®A´§S2\Î=O?V¸\"\ã»¡ASB\êH‘¨H§…^\à8{÷Uûs§LÁ$ñ;t¦\ã¬Y(VEQ™ï™‘Š½\Úöa—HÐ \ËN<·¡\ÅñJ\ß\í[í“°™ñ‚z\nd]Áo¶|‡\Ýó\ßÆf—$,\á\Îù\ëÊ‰»8H\Øy‘\Æ%\Õûvnh…\'|AÁ\ëA£{W-¬G„s©ýœ7žE~\Ïû\Å}©´\Ûˆ]D¹\Î\Ó\Ô\Ó\\XM\Ý\'\Ó5\Ä\Î4,±=LÊ¸\Åé‹´0\â”\î®Gû§\ZLF+´±uuÙ¸\Ã\í.\Ð|F\ÄQK.ŒÖ€û®\è>Ç…¥ ‘\È‘¦¸\Û\"Œ5Ã™\ç-?%›„—\nÀd\æ\r\0\ë³	Æ»¡\Ãj<34\nƒ÷¨vŠÁŒ\àõ¥b{¯lõS¸ùƒW>1ð\Ôûû^¶¿¼FN9\äx\nP½œ5» ³“#&0w;t¦.²H]	\Ï#¨È¥$\\\Ú5x£=&ƒ[c«M¶ˆ;\æiN“\îôrÎ†Ÿ²\Çy3ƒž½)‹¹ªc¬\æ \Ò\Úy\Ò`	û3\Ï>”‚øh+±\0tq\çJ\å€I\n™ÀþZW,C¦:\ížQ]­\Ò\0‚Nv¥y:qr=\'­#’	\ï\\Òª|KE:™µ\Ð\ÚVzžž4¿¾«\Þ*ð0A+´øŸ,\ÕÀ‰\ì÷§A?‰Bˆ\È901V¯(\Ú\â-\çVAT ú\ZWºÅ‘Ý’H˜1œb\\¼xvkfõ½ “·‰‰‘\Ë*\â]eE«™##\Ç?Ð¥8Qn\Ð\Z}y\æI\Ä!W´	j\æVr\Ýft©$“Ô“’|\ê\ßw‡“¢\â’ \Ã\0w‰\ÍX¼F\Â\Ýõ“\ä7¤\án\Ú]j¼Kvbé•v|\ÍC#dˆ¢¬+G½w®\ÜK3\à%›ó_jaj\ã3\Ü\Ò`Àþ”E»W™Rrtòù})R\×ú¬]s\Íí„ž€}*e è¸‡¤só§š°\Ù\Ô\ìEVWKO3\×\Ø}\n‚\ZK0Q±\ækV®\á\ÛÏ—Œ\×y3\é@]¶43Éœs\ß w\ÜóŠ\Ø\â3ò¢\\‡#Ê™­$r!—ûË¸óŠ^ûP†Ï\ØøŠ{T­	“\ã\â<EvWuµ<±¶òdH\'8¯®¹0”s…\'\çú\ÑB\Âu‹!\'œõÞ‡h\ä©h\ÆþûxÕ´3¨¹r}@Š\Ø\ä[I\Þ0(\Û/²[Y Ldý\ßz`\Ìs\ÚùjŸj	n%˜\\ò3\ä*ý\Ëw&\×\\\â•H\ÞPL\ï9ÿ\0­Z±e	›·\Ïfƒ:c°cœWci­jCeûgsˆ€£~u\ÅqœC\ê~-û;\ÈnZK\ÄE\\N(j¸\Ñy\âÜ\ZT’pI¥q\0Uet\àF0zR\Ã\à™Ÿ\ÅÓ¥=òJK“©\ç#¥3›Z±e@g#|“‘\ç&¸~#Ž[zÝ¶\ï*¬‘¨A\"4‘\ê1W­Y\â ›u	•\Æ:#ûÂ—BLÓ°¥a\àf®\Û\È\Õ\Ãq#ÿ\06ÈŸqž\É;·{þR?Zn“·`Çº“\\7\Æsû=\àNÀm¿*\â,]±m{Sd\ÎCgŸ*\íq/	©Ô¾©ˆ-´x\×\rq\í$¥\Ý@ù©A\ê´|\ê~#Á·\ÅI\Í\Û{%\ß=”ú\Z\êf\ËGšŸù\ÑVSO#\Ó\è‘S\Ì\nc#ðšhh\É#rÝ½\ÌF| T¨\Øt v%Aóñ§{·t†¹q\å°3œ|\éšÞ®ö€\ëó \Æ;®0\Èz©\å_´ü:\ãwn\Çvz0û­\ã±ùU¾\ê€ö+9\íŸ1\Ö1É¯[KfÛ†a\æ1ýu§»qŒ’&}rþtš­\Ér\Ùh\è¸\Éõ\Å~\Ñv\Ø	3\åª7\ÎÂ„:ý…Æ‘\éÿ\0ZµqÅ«]©\Ó…û\Ç9¦p­ •r\áLg—¾õ\Æ\×”K6õ›¦; \ìq\çz?øƒ\ÛW[= P·b»•\í9ŽUÄ­­*D\"¯ ª0£Â¬_pÑ¢\í¶ ˆÜƒˆñ¥¶úf\ä]R„(€§VH;¦D\ÅY¶÷\Ñm³\Ç{@\È@\ã\Ãj%\Û\'¼\ä0=+€kC¤¼\ÄôÓz7\\)úÕ¾O(Yù“8¦{¦`Ýœ\"yŸÖ\Ù\ìm\Úh–vˆ\r€œy\ÐÕµ¦ˆÿ\0ðöú/=µ\Õ\Ú.?H‘ù\Óðdw_‡½Áº¸={’\'\ØP\âSx&O±\Í2\"¿#L ImI¥´€$“\'¦6ó\ëY\ëW\nm¡Îµö2(X\0†k@¶Hç¤ˆ«I3=°~QBó\Î\Ê ŸžiF¡\Ó(e0L<\én\ÜŽ&\Í\Ë`obŠgfRAô£w‚\â]\á\î\ÊG÷”\È>\"–\ß\ÇIb;®?{¡ñ¡p~\íôY\É<R~•\Â\Ú\Î$\ë\\\r¶\æ\rðß•pœ8\é-•p\ë\Ô*¹¥+Ã–üÚ¸övBÿ\0\Ìk\âN\äÇ½|Q\ÇDkkÿ\0)¯.4/\äµñ\Ë\ÖCY»ñ\ÈÃ¡\Zr*ó²\ì\ÏÄ¼ò‘Wm¤\0x\ÛhºZ~‰Sþú\ÜûÀ\Ì\r…pü`+Ý¹eû\È\'\"2b\0\çW\ìñ6Á\n5	\'33\Ò9I«WšB8I2=$ó«wÕ‰\ÒYVD\Îü\Î\ÂFhð¡PöA5¤“œø@W8Û¢\áMW6\È‘;dŸ§âˆ­¯\rB1“\ÌùÐ„%ZÞ‚\'À™\ÏÊ›´#.X\Î\Û\ã$gó­iH  I\Ä_¥;%µ\í6‘©N\Ñ$`òŽ´ªf4F7œ\ÑF\è£R\Ýq€À.:\çÞƒ\É\Ç/(¥÷u.1*O©m1=\åü.c\ä}kˆ\ÌM\Î\Ï\å3ò¡\Úv…û`Ç¼¤GÞ¬£\É`\rY\'ÿ\0PR\ÝC\äÂ—üVŽŸ\åV®qÔ»­»¥gu’|«Š·Ø‚úž\Ã(9\ê.t\Â7(f€\'“`\×uD\Ñ.\ÊB(\å\Ð\n/ŒX&@ó®‹[\ãQÎ¯j$@`DNü\Æ\Õ\Åp\Ènö¶\à/-†?jƒ\rD®Œƒ p÷F£þ†ö®p÷?\Õ(\Þ\Æ\r7®in@«Ê¸ŽžD\ê\ÕÀüA|~­þQ\\oûÀ‰ú~uÃ¹;+6†öhùMZE+y0¦¦b£\×\è[ˆwW\0ƒG†;öOß´}W\Ò*\Û[\ÙM\á\ÛY>Mö“ú\Í\\øk\ÝÌ¤Þ·tm¹3 ò«\r\Ã\èfk¼; ³©‰™œ€WU‹V\ÕVI\Z\ÚtÔ°\Æ<\ëOjKö7P¸#0A§˜®³k\'Ib	C8 y\È5e8d·(-2É‘ mŸ_•:‹£´=˜%Jm+;\ç\Û=)\ï^\Õ H	‰¢\Í {\ÐÇ‰Uí®”\äD0\è1 Ç¥q¼^ŒvÀ½°\ß\áƒ\"yQ,V	+S\Ä6*\ÆÀvp9\çÒ¦!‰\Þ\"½q{ b[`}§Ú»N\Zã§\Éz|¨#áŽ“*\ÝO\éAý\ã\ÏÊ®7Ž^¶G0\ßô¡ttº³>¿Î›\n4Þ²ðTõÇ•86\î»=$yÕ›þ\"\'ø\Ó\Û?\æ?\ã]°*\Ð}mø\Ä(¡ý\áA‡P~–k_\Ù\\\ï§ùZGÊ­ƒøøW6O°”ÿ\0v“ýŸdþtŸšŠ7\í&\ç\n\Âò\ã¢Hõ¦:S¯¬\×h½5E\"±\Ý\Â\é>\ëü*\í‰ÿ\0\Ã-©O¦?*³Ä\í8sÙ¿\Ëÿ\0\æ®ð\ÏýŸ¦?\Ì?P(=¾WO¨\Å[¸\âY ‡Àš#É¨ú\Ðe;ƒiJœ·\rs(\Þ]ˆ«¶®Z\Í\Ë÷íŽ¿¼¾>ôœ=\âÀŽ&\ÒÀ\Õ\Õ\Ð@o1Ÿ:‘nÖŽ\ÒùkW\0RI\Ø\Ç^sÒ®ð\ä\Â\è¸{N\Ð@	Àð=5“\Ã\0­nÒ€†L‰2`:n\'„¼¡’\Í\ä%\ÑÀºŽ\0™;WQt\Â3ñ	îŒ·(\Æj\Ñ\Ð;6´e¢Åº‰ƒ¾<sµv\ÄöE¸9\ZµeQõµ„·&ð\Ë¶ÀyÑr\âb$lq@\ã»\nI91>Xþ…Cv…I\Ü\Äb|:QUìµ¿€\ëò4x{Df\Ò(\'L\'<±ú\Ò\Þ\Ü\á¯\rœL\àAÈŠ\å\0t¬ž”…\â(Œ\nVó­o\×h¿…\ÌþtŒ?vT\ÓZ\'“‰Ž±:“ùS\Úa\ëV\Ýxÿ\0DÛ¸+‚F’HŒ\âgÓpÿ\0ósö®\Ý\0u,¿Zžl Sü>\å\Ã\îp\×Gi\Ï@xzš³Å ¹¤-¼j\ã\Îqö\î.\è\â\ri=E1„™ù\Zµw\Æ4š»Ã±\Üj‘Jñ\Ú\ZIô\Øû\n¾\Äz}z\Ô\Ñ-qÌ¥É‚\ê),\Ý_öÖ”\àÄ¾§*G\ào˜u¸g²\'Ÿ—QV?b»)v\Ù:‚18(w\ïc8#}©´Zu\Úp@gØ²ò3\Èú\Ò^DYf\Õ	\Ø4\Ç.CqÖ—‰¶mµ –Ø·dL¬\é\"\ï·\È\Å\'~kHkŠÏª[TÁ\ß\'—:DºNU¬h rTb)	ižgÃ–}\é–\é?jÚ¨\Ðs´x²\åÛ¾Ë©@2\0+§,x\Ñr¼^¡\ß×¤@\Ì\åŠ8\á;5\'™7\Ï@X\ã8$½i\àd\ìÑ‚À#\rš»\Ãn\'…\á\îY-8\n\æG&b„xÖ‡\\W­|¦£Ö1}¦ö£\ëXú$Aƒ—\0üKŸqOl\Æ\ë‘Ib\ß&r&¬¹ü2+C|\ÐCIVs\ÌR\'f\Z\Õ\Æ\î\ÜS?k\ZC\ÄX$ñ<\ni\ß}BDA\Ü§øC\ÚRÝ…\ëÝ‘i\æ Ž»“¥¿i\á8·K¢\0Î“˜>§Î®po\Ö\ÓJÿ\0•¿ˆ«W$\'C{\äM2·\áuƒ\ìkI\è~óú\rj‘Ð‰­\"9ŠY\Ú\Í7ˆo²@f#\ì0ñ‘µzù\á\Çf.½±¥„AY	\Ï#i,q¥\Ùl†@u€DœL‘ý\n	\ÄðšE\ÛZbÜ³¬1	®\Ñ]£\Õuƒ\0×\ÌwŽùˆf¬\\:F¦º\ë«W=ó¼ˆ;V²\è”Ò”#\0©ˆó¤ ñµ2-\Õ\Òtø:Ö—¸.v\Ñß–\Ô^Ý·-j\Çl‹ü*\ÜUx‡Rt\çsµ]°ŸÕ¢\ïH%-ž\îü°6#Î‚WH$\çzyWt)#RL\ZKŸ\Ü\Ð\Å\\¶ß¾\"kŸZ\çX\är\"–<iX\ÅA\é?H7|M=ë¯°¿€®\r.ÿ\0e\Ú\ÉÂš\ç1¬A|/#A•„£uðú[‹\ê¯Zv\Í\Ûg—‰\È\Ä\î9\Òñü%¢\àp­õ|_¯\Z”jŽ\Ô`@¤Wm~\Í_…¸%`Lˆó\É\Û|¥ë½‡`,{„X™™µ|>\åƒ,Ÿ[:_«J° ?^Fb®_\Ê„¼Vå´œ3<£œûŠQÃ´­Ö°OÕ°’F–\Þ4\Ã8\ÞD»\Ú›\ÞS‘\író.\âÚ–8Ú¸^ÿ\0[Š¶§\ÚIùU‰¬Û¹sô\ç\\wz-”¶>l\ÕÅ‘É›‰ŸøR‘T·\Ä_¹\×.|\"ß€\á÷\ÍZN \Ä-¦:8…ü0~\Ëô\Øˆ\r7\×5’\\ÉYr£\åÎ ¶\0\î‰\ÔjŽy\Ô=µ´¢\Þ]\Å\Õ\Ä b0FÀ\È\ê*\í«\Öí”µ\Ù93€\'‘/\ÄN\Ô\î\ÌK\ÒrNdƒ±ð\åHO)Yš°<\îúR»! \ã\Ë\"šØ‚‡ƒùE^f\á¯[½¥\ÚFxt«cŠ\ãxv]Œ+Y*§½$|\è\Ù\ãx!\ÚðlR\Õ~\ã\Û`ven^•DÑ¨’N\ry\ÉG\å\Ò7z,?ó\ëZA\ÜcAI?øMj[Ã¡0}¶ù\ÑSÑ±@\Ì\n¢²y\Z#P<k¸§B_÷‹€€	\"vXöõ®.\Òý¾Ð§ÙŽf2¾fƒ]*B»gPñ\ëqDpŒ\Ý\äŸö-\Ôg\ìœybcq[\Ôxšn+Z…cx\ë,£‘\Æ6\Å\Ö\Ë=€öÊ•qhù—K¨\ç;Æ´\'\çOÅ›®·qü9r]~Ë†GÔ¬6`±Bô4¶ˆÜ²„ó:^\ÙÏ­|?þ\Î|]n^µd­\î#ˆq±Õ™ó\ßÃ•?\rÀœ;³}eÿ\0<ý|°1E8dm80\×_ð/\êy¹û6¨N…b–\×\ÈFO‰’jõ\ÏÞ¼\Îg\Ú|6\Ñ-pŒ{½Y\í¾\'\Ä=‹!S‡@\ÌA\æyøem\Ú\á-\\º--ÀnFtdc&¸\î1®¨{}›\Â\ÄfØ˜\ÇJøÿ\0‘p1öf?•pöµñ(\Úx[d3A“8Z\î2\ã[¶\Ç\'ª:÷µHö\Ì\Û[eF\Z	”yš\Ñl±¶Tˆ$\Æñ\ÏÎ’\ë§\Ö\"\Æu\0G¿¨ñ«­n\ãj\Z\'0\ÆFgz½mI€\no\Îdy\Ô-Á…{’0<±D ûÚ¼<1L»l\Èß¤þ\\©•/Z6˜A8\"9ôšý‹‹ø{ö›\í\ÜK “¤¤™6«\ß\áx{\í\Äþ\Õ\Ä7	*N¥€Ãœ\ÆI\çL\Ô\Z[€}\ä:Oð¤8ÿ\0\Ä=›]½l\Û½\ÙòaƒLVd0\È÷Ê‹¨\ßVG½`ÿ\0ˆPBy)ý\r÷†õ¨ó€õÚ¤%¶`€­VÐ›Ž:…úW\×^¸\Â\Ãö\0Ý‡‰2<\ëN\×l\ã\ÛheoY*y:K<_\n\êœ}‹bKe.¨ü,AhaûÀV \é¦\å³&A·QEÀÙºŽF¼ühŠÃ­Z¶H\Ê\ri=P\Ñuð3@Ÿ(4A­+ÌžT–8~övP–0»ê¹oµ<\ç¤S\"‘\Öy\Ñó®?‰aûª\'\×Q¯ˆ^Q™.D«¶VÕ·Nó’^\Èq\'q“Äšaw‹\n·o]¹’¡µD\r\ä€w\å\\I&\Ü~\ÏÃˆP$˜$œ\É$\í\Ì\×\Ä	\Ë\ßf?\Ýc†±\Â\Û:\Ò\Üf# ˜÷ûÂ‡iy\r\æ˜9yrO£Q“o@“™I\Ò\Ù3]¯\0f$}\Ã@\ÞdLU¦°šUô¶’\Ö\Úx%†9DðÁ‰¶M¦l;¨ˆ\Î<7\Í8\'p¯*\æ5êˆždNkµý\ÖPÀŸ8ñ¡i˜\ÊÁ*\'¬\n@FƒmLžbc5f\ÇƒC\ËKª3°#\ËÃ¥qcd£Ô¬\×d\Å\Ë,¿˜«¤\r\áMqEbÀ{\ÄSÙ¸¦Cb|FÕ¬uC ûmò«aúº›mþeÇ½-\ËlfUù¬MAñó¢|\Èaüi9©\Í	\ØZ»ƒ\èjZi”e8f\ÏI ~´xŽ/ƒ\à\Ð\nÅ’\Ï$\rD’GV8j^\Ó\â_~™³\r¤\Û ûz	ñ‰3p=“0\î \'K$}°\È\Z*\êLŸ<{Wx3\àF~\ïñ¥´÷XžÑ˜€£y5\ÂñIpJ\Ý\áo\Ó\ç SÑ³K?‰pk–\ÍY8¤n?‡X\á]\Ô\Õ²iÄº}:E¢AŽý«b=®\ZÁ\"\Ù2?È±ó¦fV»n\âÒ¸þ1+Hÿ\0•ZˆŽ¾@ÿ\0y€ùW\ÃøEm­ðˆUó¯ˆq\×6VUÁ\'Ð˜ñšP[¼AW I\æ&}–´Ùµ!UVfò\Ø~U­8›r¥‰\îžö#ñd³W-ß·{\\;{zþ±H0wüè±ºQ8cv\Ù:\Ôf\0\æ4È\ä+‹{Rt·g¸Ÿ1L§¨øŒÔ€\ÔFýMs\0*!Ç„\Ô\Ëv¶Z	ó?ÂŠ\\{cº9\àÒµ)RF7\å\Ök¿:˜)‘\ç\nºÚŒ\é$}˜“\Þ>]iUO{K‘¼t\É4x{­\ÖoÄžšL•püM½´^›\ÒrÊ¯X·ý®H|˜H©ñ§¶\ÝU \Òq\n?´^÷¸\Í\\\á\Ìn;\ÃåŸ•[\â<·¨¦}\Ö\Ïó©ci€\Æf(\ç†\å°úÅ®M°¼WÃ¾ \ÚRö2\Ç\Ùõ\Ðø8Kk|p¥­²%ôÈƒlÁ¢I;\âv«œ_u\rÄ¸V•\æW \êw>¦\Ûq\×g“j1þ\íóG¸#ô£º´>®\â•-°\Ï:\á˜Gi\Å|\ÕÇˆ¸‹ó¥¹Ù¶k 8œ0œüªk W¥Dg>U\Æ\â–\Ï–›N¶ •»\æ`ƒ\â\'p¢\Zø«³>z›ô¯†ðƒ§\rdÏº¬|\ëŒuþ\ÊÅ¶\á’+Ž\ãnœvþþŠ&=j\ß€@n\Ä?\Äò}«[\Ø`\éeX\Ý\È\ê:y\ne²nÙ¼…–;kj\Ó\"H\Þi\îp·0:\Ì ŸA(}[hD±yY\È##=g3]¯d;M+x}‘—\ïŒyRq=[½¥\Æ”AõÈŒ\Èð7]˜\Ég¹q˜ù>†B‚hKxÊ´–\Çh›\ê\æ\"˜ÜDG§•Û†¯õÖq&\0ÿ\0ÒŠ¤D³\rü\è\ÛKf\'\\ù\ZÔ i\ZT	\ÃÆn˜ÔŒr\é<š†“1\ã@\\U¥˜\n\á¬@“\ÄpWt°ô	\Ï1Vø\Åõ\\BöoŽü\â¯p\Èv¸VPù0\Ç\Ï\è ŽtÎ£\î\Ü\ï:3Í­™\Çù\Ð{|E‹ŠŸ\ï\rü©\â¶ø\à]‘b	\ë*`Ô½\Þ&\Ó|D\ß`	V\'»\ÞÜ…6Áõc&\ï\Âxv6x»Ag*Î€’³÷B•1\ÔW\Õ7\Ä\î=µ0™ŒrÁ h²Iñ©ñk b»\Î`z\Ð.\à…€0\ÎLZ\á¬*õOtjL`}ž‘´\×Áoñwm¨Rx¤FPy4(ƒ\àk\àllŽñr	\Èú\×ÁY5¤|J\Øl	À4G(YX2±\ÃN\Ç~\àš{´ð\å\è\'³u!”‘\æ±\ë\\IAö™8m#Ý T°\Ü]\â\Ð|­†5gˆp~\í£{\æ\Ì?*t\å\'B/²‰ùÕ¥n\Í\Î]>U\ÄmöRÜª *õ\ï†\\o«{‚nXÄ¹˜\ê9\×üE«A\n‹\à\ê\'HSb…¥f×¥­–rŒˆ0\"E¤Î•Y2øå•=M¨šC°>[{bŸ»°iA:Æ\'œ*Õ¤ˆ\é±\É\ÏJbX\å¢\'õ {§H\Ú\ç	 ú;Ò‚ )i™\Ä\än*Ò¬#s\àM\\bqþ\Â2ó®À)\ÈGQ§9\ëZBÆ˜CYÏµ^\Ôuj‚#ôü\êÓ®\Ë)-¾\Ä\ç4Q¶Òªx@5\ÄˆgpTsa“¸®­É`˜J\Å%®!„ö\Ü3@ûAD©Ÿ*³\Ä\rÅ›\Ý\Ö>L$P+Šµk~\Ô[,‡üCH ¶OÁ¡<\×\"ó À\Ò?\Åÿ\0Zý³Œ\r“z\â\ÚTf;‚\Ø\r»\ãP¹b\âþ\Íñ¾\n\â\ê\â%ã‘œ²:QMMr\í\Ä\Ø+’\Ø¦E%öTûP¹lˆ`N\ÕÄ­³\èÄ©õ \Õ\æf2\Å\î\äŸ\Zc\çz§ÿ\0\Úkÿ\0”ÿ\0\ZFÚ®=¦•T\r¤\0)¬ðóþ\Ú2\ß\Ýüöó \Üyÿ\0m\Ä«²<ó\ÍüyW|“»95§«\\h:°:…:¿*½|ôû\"­!\ä\Í-B‘˜\Ç\åDÀºw¦´\éœõ\Æ*ý•c\Û6¥?\á`EY½m˜¿bQ\Ô\r\ÈQ#o*f\êv«p‘•lŒó\Ç\çHTŽ\î¦Pc–\àšWr lO¹Û¥;i’¡n‰ho¿ŒÐ±»}uýDO<«…\Æ\n\\°œ\ÆEi\æÝµ]ùs\Ïñ«Ž\äeZ\áÏˆúU¾V@£¡À¤ŽwðŸz\Æw\ëúRlAŒ\Í)-+¤ýN\Ô\Ö\×J´¶p<ºQ‘\0´‰`w“4 \"ÃŸy\ÍZúµ™›\ì0L™#zµl.Z\Û4\çy÷¨¶¦w2<‘\ïJˆDk\Ø\Æ\ã\Â|üªÕ¾+ñÙ¶¶˜ú¨\0Ÿ9¤¼~®ý²6A\ØQ·f\ïp\ËKº`\à‰\å5al\Þÿ\0\éÖ˜Z#h™À\Ó>\Íc‹`x„\íEÕ¶g\"3‚z\×z\á\Éùš–YÊ”ÿ\0y?‡ð¥þ\Î+‹\áU²V\Û\àû\Z{ƒÿ\05¿:\àn…·ü+\à\ï\ç\Ã%|ùXþð²v\Ã\n\àÜŠÚÎ“„Wn#q\Ð^•f\Ù\',F£ó«Š:)\Ò>T\Ìx\ÍmÊ³G\Ëz\ç\Ög1Aƒ	¢»ÜŒmO•™Ûª\Ýt\ìö(Cy\ï\éVH\ëƒÿ\0-\È\ç%¥‹yÇ•7l0J‘1?Æ´	\Þ#\È\ïòÖ´¯{Q$\"ySLmDM±\ã\'\0\Ç\çF\Ó%fYD\çm«LI\ÌÑ¹¨J\êI\Ä\ä@‰l\Ï<r\çI¤	\Îþ})JFüýED™\î®Iòšuq#\Ê7ŸJ¹­\È&\è\\’18ŠF\"\n›£i;@\ßmüh5\éXž\ä\â9ŽŸ*6\ï$\å~ø·\ÏÊµ«0¤p<h*œvL2q°—\Ö\Ã\Î##aAZ\à\Õ\Ã\Ý$\Ü\Ð\Ó! f\Æ?¦´¬\âQ¿º\ÛÎü*´5§¿úŒš“[u©Ši&3Òš\"<\\\â¯N‹jXü¶§øw™b!®¸‰…\0ø˜¤±›jù$õ\'98ö\é]©üj>\Ä	 ;ˆNAð\æ&wjD“,>\Ç#\Ìþž4†\0@\Ädô8þ±F\Ùc\0du5I`còŠcm¹\Ôü\ÎôO|ž¦‰X\É¯!ýzP0I\0n±Ìš\0\05bs\Ëú\éR¦T\È\é\Ó?\ÔÒ¨l€\Æ9Dz:³¥J\Þ{M5¼€A0N3½C©\ßÐ¥w’I¾\ÇJ¢ô,¿\Úú° õ\0G^™×®)’î‘¼\É\ÌyU\Ý%´’VFsò¡nÚŒRq˜\Îý7¡iYdiî°ž’})o\Ûl:\ÝUu³M\Ã^#?±3(\'û°V=*\í¦V\ZmÞ³¬‘?ºG\åÊ¸¬$¢\å³<„\ß\Âk€¸Á)u²z}šø_\Ã\Ë\0aË³ÁýÐµñ_Š^	öxnl[-ý\ç$Ç¥H\'½\ëP£Bˆñ¢G,}ETy\àŠ\â8¡\Õ,±_óD\nµÂƒ‚\×/)+3H“½\\´\Üôð¤ã¨œûU·¶A*- \ÖFb¨\Þ9\ÅqOlž\èP-¨“\0\ZŸ\\?…ƒ]6\Æ…~gnKfum>\' 	¤¹ 3m\ÉÁƒÊ™ð±$sE¶fg\"Z\Êùó m\ê\ßYyˆó \ê[WfÙ˜1$Ì˜«Œf	F‰tþ½)\Üiûd\à&91ùS÷L1˜Ú¤h!Š˜ó4\æ{\Äü t\ÌPA\Ìƒ¾?/•Œ	ƒŸúÖ®\ì3»$LyQ¼ hÖ«\"G->~4³‘(‘Ï™#Ò¡s÷ô‘\Ìcž\æ„\Ê\ê\0wŽ6òñ5\ÞQ†fNŽ±@.¡¡†s\Úd~u \Ä\át¸\ç=GõÖ\Ç\Ó(\îŽg<þt‹¤\r\Öÿ\0QZ\á\ï»&gÀ\Æ\ßÊ‹¤è¹á·Ž*ó\ÈÇ•:iƒ\í98Qž¾q˜dºž\é1ˆö?Ñ¨\ïB®©:†\'\âvñ›W­\\K€8S3’Fc­Z¶\Ñ=­‘¡¼{«l\×l+\×5«\âB‘·­?9\ì\Õh‡†\îð¦T ¸«.ˆý•ƒzX\ÍpŠH2{rk„f’4\0\'ž\ÙÞ¸tŸ`\ØùÕ°\Ø\î¯=U\Åñ6H\Ïb«lŸyš½{J/Ä±`OH&6\ê+‚±mTª›V@s\ç¬G½5´ …\Ñ\'ž\ÅyzQ¸`@¨9\ë]¡¹\Zmµ\Ì~R•XB\n‰Ð§H\é mLWPb;BHa´dŒU\ÛWB\åjr\Ï/*´A\Ót‰<Œ¼úûU¾P\Í\Ð\Ú\Ï301ÓžyFx’ŸwK#\Ì\Ç\åR\ä9“\á\0cÊ+\é\Õ\Ý‘™4Š¢\á\0\æiUF¨\n\">\×ð¢f\à|Dš3\Ú<þ\Ì\ïC¹p…ð\Åw˜Á$OJ\rhBF$	ý(,\Ý\nt\âEY‚“\áGIB\Ärœ	ù\Ñ\Z–;O\çšÐªV\â$É¨b$ð(5D\ç`\r\ZKg90?SF\ZA\Î\àAH# ÿ\0]\ë¼F—\è\ÂH\Ûjg´mƒ\Zˆ#}ˆÈ¤	nâª€6™Ï¥@0 [\Ò÷‰‘¤F\ä~@P\ëm‰\Ò&f$tô ñpI209\ïA‚I\åA?2hž\æ¬c3ü«^—#\ÄÔ±H™ò¥\Òn#H\È\nO\è(´jÎ¢>\È\Æ\ÕqÂ–`\Éƒ•«L\ÈJ‰Sšf¹¨eŒ\Æ_:­\åAˆŒE9Y;±\é5#X\Ì`QV€*H\Æ:T\\R\Ð\Ð$W\ÚY?×¥mI9¨\Õe‰Œ)\å\ëRJ\'œù\Ñ×¨® \Ä\Æ1Z\Ê÷Aa& sõ4\ÊÁ8Š €<«ÿ\Ù'),(3,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n		\n\Z\'!%\".\"%()+,+\Z /3/*2\'*+*ÿ\Û\0C\r=)#)==================================================ÿ\Â\0\0\ã{\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0ô^žuG3“Q¨r\\\ÄM\Ã\á4|$M¬\à\à\ä\Ð\\4i (*n\Z	‚F  8.Q¨4NO†¡ÁÀ\È\à\ærˆŽ\ZÀÁÀ À¨@\á p  ˆ¸P\àPp Jœ’\ãcZzn	\Æ0\\\n4iP\áðr#*†è`²%­L)ÄÀ€ÀÀ€€\ÐPh@Ap\ÔJ>¦\àzm´\ä\Ô\ÅMÀ\ÔÆ›\é`\Í-ˆ`\Ä%p‰@\ìP˜J\ÅDŽgjAPcžCC˜€€\Ð@©\Ú&šz©SQ2¥À\á¹2PFœ†¥µP\ã`4©Ž1\êm3s	\Ì@Ž‘Ã•P3nZol°pcOI‰¥\"\Ü\È6‹0kYH\ç¨Š2*\Òj k\"h¦Œ\ÒZ%—%\åÊ­\Â\Üu6ùœˆŠ\Ô`ñF5–‡!ÈŽ”‰ð˜&K$4-+Ik\Ï\æ\åGŠ0!SB\Ò\Z3€ù«H¦4úN¹K™¥ ‚²Tr&zM@\ã’2d¥CÀ@…¸[mIP\áp*p1\0‰\Z\Æ\Ñ1«\éJ9R“&tÜ…_\çt‡^b÷\r\Èô8\Ös¤…\Õ;ó¡©\ä\Õ)A„I*lVd\ÄC„À˜`\Ó\\\Ç4€ŒDO$£cP¦—8=„Lñ>&6\Ù\ÜK¢h\ÕÕº\ÑO§-{\åwólµ\à$T«K9%«h¹þÞ¡ù5<C*—‹5n09—\Ä\ìü\îß¨\ÙR”\Âj/Aª¬\æ\ã¤\æŽ£@(Ø¡0(s>w\ä59ºý#©ž…n\ïn\ê>\ï6‚ù-k-vd\èóW\ÐM\ák\éØ•K\Ëú%¿W¯\â\"†\Ê\êP6@¶“mµ;\\\è~~\×\å¹\è\Ú¦\Æh„Ü˜eA\Â “\ÑM\Ú:Çšñ\Øu7\"«µ³×ºw\ëƒ\Ý\á\ç4ó¦xy„ŸM:\Ù\ÖŒ1;©\ï\Þb{?< \Ê*V	%¦\Û–¹®kT\ç¦o›º\ÏD¥o„\ÐQ!„\æD‰©‘.àªŠœ»ŠLl\äô#¾4¦\êõ\çŸDSQŽ™o\'m\Åžh—\ç%yö‡0™z«\Ïôô\Ó\éQöü› >¼Ÿ_\Ä+Njž#PPH -;g>…+‡l\Ü\Ý7s\"\"q\Æˆ ‘\"°U—R8\ìJc@Ke»H«|­ó¶w£\Ù\'M\ÃwJü¸qöF{‘¦\Ä\é³^\ÇWcð\êgGE&ž%Ž¼;.o\Ðh\ïÈOC6\ÍC\Ç1SQ’™\r\ÝTÛ¹&MDFWMœ\ç°\ÎÖ—\'\"\Z«+Mndý§.Ž\Z\ÉO_¯b\ëz’õbr·_-¯ˆ#¤c\Ñ#N™)\æ¶øfù~Î£®­÷\æ?Le\è¬\å\ÊI\ÎI\Î÷+rD0O¨{‰ª¼\ì«`Yª\ì0«Ã’i\Î!CME\n&Í«{^\É;ð†i\×\å\ë³\Ù\â\é¹~„l}	\\¸¦—‘U•‹ôEUqŒ\Ëý¢ö\èsµ«…_+„\Õ@O£\"\Î\ÅsJðy\r@†Œ©hr‰ŒŠ0:ðr U`¼\àñò\Â\Í\n\"%\Ê5c[õ[\Ø\Æ1¬š\éñm&mø	žš\î?¬\ã7“\ÃajµY²\ÆEY\Zhº1d\é&½j´Dp^F—¯óðc\Ø3c¹\Ü\Ï)+š\"šÓ…¤!\äs”°V´u\çC-?;0¨\"UŠ¯VÚ£GY;øþ\Ó\è;qQG\ë#	Y\È\rM´4B\Ött³«K\r&¾jlOD:\'xz7Ÿñ›Ÿ_\Â\çÉµY\\}b9ý\Æs{„Zòµ¤¨\Äuš\ÔH\â2=*þr\çÌ…T3Í­sWýl¡8OÊ«m®\Üyñ¼þõ\æ~³B\Â\"¥)…\Â_=#.SP\ë‡)\×ò7o)2õ4˜}©\Úö¸\Ç_)w\Í`õÌ¹~€Vpcc\ê‰\Íô9z¾>®\0«jåŠ¹\äxŒ£DŸ½ðt:f¡3$\ÇiŽ³µafiiv\Òð\\=›¬½i^fWS–ðFa\Ç:	Ê…w²\â;>F\æù-™~>±|\ßdWF®_3µò&|b>#\ë’Þ±ª\Ã\è1ù\ëœ\ß\å\ãrU-U(I\ÎEŽ‹`ú\Í\î\Ña¤@\nœž˜\ÙwD‰\È\n˜\Â\ÆôcNJ®\ã/CF»Ìž¨R‹­åžˆfŒ(œa»¾CÒ¦ý\ç\ÍPHSp}£óôJ\èÔº\ÒU5ÓŒ/†s;ecO\ÓñP<\ê‘=¨lT5,—{¬ý\äú2\Ì\ÓÁ\ZU´h»³hD1R$1õ>S¤e\îa¡\îs\í»\Ï\Ó+/B$h§«¢Á\\¸\Þ\ï‘÷¤Ê¥šš\ÊTƒ\Í\ï;“\é\\w\ÏA\èüañ¹Yz\ä=ú!¯	6òiµ\â=¦­Dr\ÃG ºõ¿\'¿°¥Pc\Ð\ZŸT\ìSµ\04\"@`8\ÑN\ç¤b®j\ZD\ì\ãª\Ï/N\Ö=“C—g\Ë{òv\ra•Q\Ô\årô,8¾½Ã£\ëùZ\í|¯I³!\Í\ë\Ï*)®_¯•M§;;,\Å|-gª\ã¦i\Æ\r\çw–\Û«ŽŒ\r@€\à@ #V	¨*3¼ÿ\0\\ð·­F‹	\ÛA—}v\Þo\ÐzgŸ\Îõ®<\Ä~mšn·øòý\ß=G£\Ð\Øq\Òd\ÝF~c~wvy3E´qË¥\Ê\ÂWu–¾Ï›Ñ¦RNÀ*:q-3D Ñ¸\Z(\Æ B†‚\na†!\Ã?S‹\Òp\×-HS§”—º¥ó e£¯U\Éõtfù1R\Í\Ë4ðqS®¤\îù¥\ß\ç|û—h“P”S9-\ÇTFžƒ:\Øg¯­a²\çPõ`*s´\àx\ÉÁÈ‘@#\ÒAH›Á™©À\\S\ÜúSY4yCž‹Ü½\Òg¤·$_oŸžIY£†\ÞP™\ä°\Ö˜\î\\2P™©\Úx\åG¹ðöj±\Õý|\Ñ‡j\Ú]\É‚ppLˆ\0Qˆ.‚6¤EÁ\\*ax&ø\ÒCAƒƒƒX¢p<|d\Âáš\ÖZz\îÃ®E³€©e1AT8Ž!H@«if™(179jš¶¡Â¾–N\åF\nb‰\ìx8Vi\è¥\Û\Ëh\Ì\Ç]\ÎZ]*EOF14ZdŽpx8B$8>DHJeb(«\'`œ¨œ8)if*k\éŠ‰‘Š\Ö]ô]\Âr\Â`CS œ\é\ÆR\Ë6\æñ9@f\n\"fC-­#$MFL‡Á\0TMf\Ð-LIë“¯’F\Âs`™a#|!\Ó\r\Éc¢¨\Æ\"¥¢D\n“œ¨ðQZ‚‡ÿ\Ä\03\0\0\0\0!\"1#2AQ3Ba$4CR%bÿ\Ú\0\0	\0ñ\ëÇ¯¼zñ\ë¤\ê\0µ\Òž¥®³¨Ÿ¶¼lþ<lŸ\ÚR\ÍxOøñ¼g¨QÎ½¹\Ï\ï5\Ë÷×€¹ûxg÷ñ+þ\"£\Åÿ\0ó*ÿ\0(ÿ\0\ç\ÅÇƒJ8×‡øˆD\Ï\íÿ\0{}{m{Xþ}¯ùöÓ¯mþ}·ùš\ß\Äûoó\í\æ5(-xKR’×„µ\nž9ˆ…Lþ\Þ	ý\ç\Ç#÷ˆ™ˆãˆs\Ç\í\Ïø\çü|\Ïñ\Ûüs®u÷\×]u\×\Z\ë\Z\ë\Z\ë\Z‘\×X\×X\×]u\×Mu\×X\×\Z\ã\\¯\Z\ã\\ž?\Ï\Z\ã\\F¾5\Ä\Zø\×¯q\Z\ãýÁøŠ£ûW?¦r	´EôO\Þ}ú9\ât6«”ñ‚YG\"en¸ó\ËbýY\×Q?fùS1Ï–&\"cDk\êFv}qi32^\á3òŒýµ\æ5\ä‰þ\ÞóûGcþ`§÷Ž\Ñüv\âL9);5‚&Mö³Ô«G1¥\îz\Ç?5c=PŠ B\Î\àJ¾]Û\î(.¦m¢<]\0\É\Õ0\ìDYŒp>\åV\ê¼bTþš×]5\Ó]5\Ó]5\Ò?‚¾¢#ù\é¡ \é33\Ìs\0Sñ*˜˜\×H\â~¨Wi\ãP‰„G\ï¨DD|£‰ý¿´\êW}tˆý\âC‰\Ñ1£2ûˆ‡:\ÛR¸™‰\ÓIUÇ³\nrF%~Lºu\\³\'y3È¿ñK­PÌ¸lÜ˜ó‘²	š*\ÐÉ™Ó«‘´`\à“=‹´)rŽG\Å\Ô#GOˆ\î:œ\ÄÁLH”Cÿ\0‘DER\äýktdn|´rWBU²\n³=d f51?ÌŒ\Ï\ï\Òc÷\ëþe|\êW\Z\é¨˜\ÐA—\Ó1	2‚….f&FD\ÈO3¡!Ÿý‡e+>¤ø½V?S\â\Âˆ\0~¢€\\\è€þ\ØOÿ\0:/ŸÁun8kFx€†$¾4\Ë.€ˆN”¦µ\ÞK.kc¿\Ð\Ä¶N\ë2˜D\Äp!©_1<h§¨L.Y\rˆ2 a\È\È$[<4d<sZ%A„O ð„\ÌA}|¥M\íÉ²\nÄb\çBÎ³\Ì\Ä\ÙWižD\âNuS&\åG‰‚p\ç†&r•\æ?.?/žÈŒ½n\Ý]\njž=Î‘\ÇÛ¦§t¨>\ZM\Ïd,7‚±^\Þ],ùq\îW.fz\ëþ•„<¡òq4\å¶\Ï\ÈR\Õp\" \ÑYñeq\Ø\ë*\äF1‘T$\ëUz\Ç1’i”Äˆ¶å“™b‚D„L8˜\ädùˆˆ’c g†i\'ý(‚5÷R¦&|„\rk°e®ƒ\Ä|HD\Éi¬\Ç(r¸\\ø \ÇôŒH\Ìó xu‰eo\Ê!&Wdª´Å€–D,Xš\Ó32•LÄ‚Šx1\×ií¢\ä´GØ @Ndg‚X”—:†šŠ><\çð=\á‘RH\í<Œ\'½vC*ËºxÏ»Ÿ\Ý\Ã%%\â\à…p¥{\æ¶ „ß“\ë	»ŒL6\è.·\Ä\Ôbù–5µ\Û9\èM‡öž\Ü\ÐCË““ó”\Ì\È2:Dõ$ƒ\"c¢¨¶~˜\Ñ\Ó`Ž´\È)U¥\â\Êñ#1	$ZÌŠ!v `E3]\Â_R\ì.!|3KTJÇ¹V]q‰#)Ÿ—¯\à{B\ê\ÉX-\0šYzRfXe2	ˆ|\ÄK\ÐE\ã\Ñ\Äù\'ˆz \ây‚\\ŸQ™|r™(\Ò\Çþ0\ÄDAF„`\ã‚×„»~‚L”O1\àƒã®„&\n`DL§\ã\Û\ÌüøcŸ¦d\'Ÿ‰0‘J9/\â,ƒ€IE,XœCPÉŽ&UB\Þk?\Ç\ÄÄ‰%$\Ó\åU@\æ Œ¼423.uZÃ„¡™»ô*‘v°\íÖ”¬¢¢\Ï|\äHzªü\î{\Î/¯)ü¢Ô·~*Ó¸þ¾A{\Û+\ÚA\í\Ò÷$E¸\Êgþ\Çû¯\ê±þ\ìX}\ì†÷ù‹Jõ\nC\íq>¡\ÉG—\ê%nc\Ü)[\ç\nó\ä­/pc\íLJ¬ª\ÝSpŒ1\è‘W15ÿ\0O%%f¿–_\æ	ˆ\àŸ\0³\î:eú°d\'¤0\ã\ÆViÄ¢F$SLˆ;2b†q\îb3\'\Ù<\ÈhPvbJa\Ê%/ó‰‰ŽB|0;	~Ý„x‰‰fu\í¹ù…\àw…k\â\ÊùZ\î\È\ÜPJ1÷|˜\æ‡\Û\ÈÝ©%\"\Ü~\ã\'9µ•‘§5\àž¤6­‰ó1\ïV>’fÍ—fw(%m*ñ\ç³{«#¶nw° Á*9÷\r\ÜH\\]\n‘¸˜\r°šH\Ú)$M‚\Å\åkD	A¤|>d\ÎF›!«y$†~³\ÇPnJ\èTªjôþñu“¸[\äq\ïd+·d\Ó6“‘¹\Õm§r\å·\n…j\Ç5Ò««QBOË­‚¼u\éÏ•·+\äjˆ„XýDB.t–&-·&rBuW–\ÈW\äD¿È°\Ç\ËmN°õ‹\Ê\Ëˆ9ùšõ\ÊÊ­\ÓFf9Š÷\ê[\æP\éwŠ9\í\îkvr«N$\Z\ÃWy˜0by\ã\Ý\ÏfGaùs0Ø›‹‰\ãšyJC“e¬¦6¼Ð¿bV,½E ,?.¢Z¶\á\ÛB\Ìþ—«€½jç¯Š¦WºöE\Ö\Ù.s·FMX\ZC™¬!a\î\ÌYM\Ü\â\éÐ­6«[\Å<®nfdŸªJr\0û„\Í\Ù\n)\0¯\Þ4\0Šr-e°6ªùê…ªñ\\\ÖÄ›±JŸ‰\ÊN34«¬¶w\ÚUó4ƒxZ\ây§Rœ\åm;‡\ÚCq÷I,\Ö>\ÌWÊ \Ý>b™ˆ¸p0%©‡…šò±¦¬TË¢û·&\ß1±6)\î\\}\Ó­\'n³Ø˜ª\ÈI\'«W_\È\Æ\r¢\Ø(]v¿\Ûÿ\0B0p\Ä\Í{Xi6\Ê\ÂeL\ä¤ý\Ë\æ¦Yr1.°™ôA-ðp¡b\Ñ.>‘dru\ÕqJ‰ ¸²\Òl»ß“¼¸ú\î\Èf”\Ù\ÆyÖgV\nQ´\Ú\ï»Z\ÕeÜ¶œ†Vj\Ç\Ó*\énX\ÝfW\Ú\Ð^x—¥P*±›{*ñ(^±ûW$À”˜^·a\à³\n°\ÚÎ†$²9K¨P\Ù\ÄLM¦N¶ö9ym\ÅJ‰\Í\Ò\nyÛµ•­I±E\Â\Ëo\ß1YÙ­#-­my*n£57V23r¥e– \â#XR\ÅU\Ø÷Bµ¥”—tó\ZÁd\ÓsP\äf~†v\í&Õ·»‡\Å8\Ç~Œu\È+%µ±ù\à›\Ø&û\ÛXû\Þ\Ëp*^<AT°«–\'ª\ÆÍ«–ê˜¢À~%.)#\Ól\Ú%D%Ef\ÂLû8›q£Õ§\í@ \nZH>“+\Ô4«\Õ!\'1®|÷\Ça.\ä\á\ÖÅª\ÆV®·;%{•V†\âpûƒ4»“Q¸èŒ†@\Äd,«4¹x˜½©e\àŸŒNJ¬\äm\\¥‰\Û8¶×Ç›²\\\å \ÚQú\ÜD G%\Ø\ä	wÞ\è<ò†ß‹I1Ã¿úø\ë{uP5r\á´o¯¢Ý£…¨ež¯—Á­™\È*ùŽ×œ]¶\×k\ßIe=r¦\èt\Ò\È\Æ™9xdªx§R™ 1ñÆºÄ]OJ—ÿ\0jqö2Xù\"®š\ì\É\Øtû–\Ã\Ü1,­“±Y\â\Ð/\îšd\Â\Ä\æ,\â\ß\r“0\ÆnŒtWÉ§9ˆ\Êl\Ç÷¡n¦]\ëepv\Ù\Ì2ší¾¸SRO¬jRÂª%¡\Ã6Ë© •ø\â¼~NxÊƒ¬—Š…º.\Ö8\ÌRÁ\íü X™\ÕûeŽ²»„JÛ¹2IR¯œÈ…v)—,òcT¿C³þ¿Š\Óô\Ç)D¦%´vþj¥nI9lp\Ð\Ú×®\åG››p4mM\Ð\é\Ìi6+,À¬%©Û™|Ä•\ã(fjG5\ÞYk5\ç­\Ê\È\È\r¸ŸÍ¹eqLD\ÌN‘š\È z¼¥\Ü\Û-Œ]·Z\Ü\ÆRLZn\î?\âòY»oKIÀge6\ê®\ít¨”\êg”\ÆEÖƒ!´²\'‚#h\æyŽ¸‰\Û{Œ&a8…m]\È\á\Z?\Ù{›ŸÌ¼0_\Ô\Ü\éõ³þ®\âM¦g\ë\Ü\êô\Ã\Öa¹\äzY‚‚\åÙŠ^Ÿ\í\ê\Ñ\ÂòA´p\ÌD\×~R–À\Ù\è!!©K\'K\Û\Ì\Ü\Ú	Cq™!\Än,{–Q³\ri%Õ˜a\Ñ\Ñ~ª3\Z¸\ß3Fj\ë¹ß·eÅŽW\â2—\ÆnF\Ýe²!\0$lK\nŽ«†@bn\ê¶#f{©\Üg\ÔV|3t(’\ï\Ì3\ÂdJ=KYF	\nP\Ïp´.…\ä3õ\Ø\î¾±¢µ\Ë*$»1\ãr‰\Ï\ÑrC\ÊD»P´&®\×;Š&R·\ÇP_±‘\âxr—q\ã«\Z\áJI‡7œÛ¢ßŒV\ÄE™#¡\Ä\ÒG\ÆÕœ0aYŽT\Î\"Á\ÌMV2YU½+\È\ÚW\Éi\Î\ÐÅªju&\Ç4òR¼”}K6Ý„O¨¦Ê¬Oük\æ6\Ò0L\Ô[t}¦/\ØìŒ»ƒõBó\åÜ\Èc?­[ª<n\ÔÙªð\â›\î\\8VEo¯¡cyWqth¦l&Jû\Ë\rY†˜‹-\ÆŠ\Ã\åu1´¢Œ£¿¢’]vX¼±¨«µ-r\åYš\Ù9ƒ\ÆVˆO\á\Ñ%:–ý\Ä›S1õŒP\Ðñ\ëtd£ŽQ‹1‘tÛ›\ÑbôP:¶Áu\ÈÇ¹—†¼}\ÉržR\Õ\åoª8v¯ªýMúx¬‚*§\Äy‰]K¼\ÌMŒsý\Z\È\â.*¡Ei£\ç¢>K5‚õSù8Y‰„H?è¬•\Å/\Ä/÷4\Ùÿ\0g\í(»þ¾E¸lŠ\×,\ný¿x\Ò\î9Sô6¾ãº˜\ã±å±—\'þu†\'ðŒ£\Î\Ôs\ï(\Ës>\Úûnå©„ÀnK1_Ž,ÿ\0ô+2™ž&—žE¨\ÏO^¤Egò\ç\ÙJ/˜»\Ê\Ù,F_…eS‘Àdpð·¡ÁU.²ep\ì\ÃÀ¬\é\Ç°œ\ÕQ6u,±\Ó\ÇŸZ½†•ûj\Í\ÊÐ¬‰‘R\0²\î\Èõ“E\Ý=B)µ”\ÅQ™Ám6fª¦<jÚ \Ò\Æ\\&O\æq3\Ï\Äj9\ã\æfc	p±\â|_xyVBú#…\Ø\ã\â\äW¥G|¶’©`®1#*bª\Û»\çà¸Ÿô\ç\\\ê‰>Meò\à–{\ë\'Gp€Z§zk{ý¾YJ6\ì×³MÄ›*™	Ÿ‘]»iþ‚\Ë#­\Ê\Ñuj):„VRÿ\0ë©‹ˆùY\Ìk±üH\Ùh\Ï\êNP—ú¤/†ûv–\Þ\ÏTmm\âªcrÜ›mõí‹°†4²õr WpÛŠ\æD‚‘/\r¸°ñ`p÷Ÿv\Ú\Â(‘(Šf\Û=\ÜÀ@«CŒ‰6\í þV\ê‘¶û\\=\ÑQ–óµŽ5[o¿k\î´+\'­Í‡<]œ¸\Êl—-’\0a\Ï\Ó+GX\âbj‰þ¡šŸO\Ó>Ùƒó1+/´Œ\Ä\êc\â5÷ˆ9)K-h\"!š¯š¦qÅ„\ßÌ‡2C\nÍ­‡À[M\Ðdõ?ô§h©\ÜU>~®F*ª,jYÁX¹S†\Îm\ìŠ-Q\ÉQÝ›‘u­\ZqN^\á\Ã].TR›ÿ\0\ÓŠ/\ÖKûI\ß^IŽ$¦c\â$§ù/ó31üCOŽ\"\0\ÄÈ‡¸52:–\Zõ}Á¶F\áQ:bÊ•ªA‡]™\ÉG+o{øJØ´³,š\ÉF<\à÷g\ÆE®\ÃÁ\èX¿@Ú”î©ª|nŠ\Æn]w.ž\å«c% \Ë/§’F6\Æ9+\Þz¼ƒ…9’\\n\"\èŒ\Ä‚^ôAuˆ8Ÿ¼\Ìü\Ë±úŸ¼DG\Ä\ÌüN \æ>\Ú\Ê\å~ó\Ü\Ë[ˆ¯±¯:8›„Œ\Æ\ÜdM4/ƒ\Ô<„øžu·7µ\Ìm\Õ\Æ\é»}ùµ%òÊŠ¯q\ÜF\Í^\Z\Îk»J\Üjžr-`\ÛL6\Íewº…kq9Š\â—Ù W1úo:H¶ÁH\ÖS–\Å|Xcr\Ô\ÌÃ²ÅžÃ¯\ì\Ó\ÏUaÈ£-É”v)\\zÇ±ž\Ó\Ü^\×4ºýv~7s\r_\"\Ë\ìd;\'7×ªk\Çiþö2XtÃ¸\\žB‰0ˆ\Æ\"d¤–¦V\'ò«\ÔF¸+96|N·•S=®û ýóO\Ø\ÛYŠ\á\ê-\Ìnwmcwõ…“³“\È2\nd YWI\ÌYLp\é\Õv}ˆ­F\ÜLªOÀ™•Éôb\â|‘?11õi\èˆ.\Ð]&#\í\àž~\'1nnd˜Q4Q¥,4\ì^dPV\ÙC•üZ²\Ê\r¬Qá®Ÿ€Uj`Cˆž\ÐÂ™úcñ¤DvZˆ™…2®e\É\0\ìE\ÆXnJ\Õ\ÚyFª2•[”§“\ÄF\Z¨\åw\ë\ã\Ëµ*IÛ¼yµ‹ð>F*¡\Èò¾	¹ô\áð{z®K/¤\Ûc¶‹\Ù_~\rÅŠŒJ\ÅS\Õ?N95\å™r‰¾Ÿ\Ø`žq¦Yš\íò4\n\ÐÔº\É=]z‚\Ó‘\ÇÓ·‘s\ëSšµ\ÚF\Èl\"Â¤\Z±8)j­™\\¯Rý©\ç·\î×¹\\0[†÷¨[˜C\ZyQ²\ä>Z¦QÝŽAñeUwV2\èÀY‰\Ç\ã\í\Çj–[ˆ»R`†‘´¯\Õ*\Í!ƒ\Ò\ÈB\éÙ‰ö\Í:_21#ú€\Ç\ÛD.~‹\ÂIÇ½¾L*B\ÆeaÙ¸\Ø>Ù›Z¸ˆœ.Iõ\×`—\ÆNw«6½\ÕEY00„²V&¶’Ë˜\ÐY	™­rÈ+\Ö(±Ÿ\\ž>»fN¹˜^­úL2v¸8œŸÁC_‘g½\Ëó&†k³`dd\Ðc&a”\Èü¬.*\îKù“…KN½Kkª¶Š ¼†exªk\êU°û}\ÛxªlŠ‘\Ùx\Ä[\Í\Ô5\Õ\äp[•y<}•¾3V\Æ/V5i˜ô\×i®ƒC\Âùó7ôAJŸ\Ë\ç0{Š\âs\ÇCªÈ­k\Öó\Ø\Ö3¤9&³{?u$\æ„³ˆÊ¤\æ,\ãƒp\ÆH+†*\È\ä1Àû¸×’\Ö\Ú\ÎýIˆf‘¼(]!÷€\Ã[\Ê[^ W\ÌÀZ²©ˆY†Dn$‚»F}­Œšÿ\0ü›‹(Û£ù·Y¦l»ôœòx»^œØŒ¾Õ¬‰n7n«»\Øü¨W>qF§\ë\Ë®buó«Vb­idÊš\ÛwA$×­¸×¬mY¥±|ýeöYOå±“=f\'A\\s+Uv,Z`\Þ‡ß˜+vš=D¬eG\Ú0¾—\rN#¸ašPy²›l‚LPÁûG\Ð\Äõ}›.h(5ð]pc³HªÔ¿½\ÝÊ¥½µ*½’%óZ¹7\ë\"\\Œ›*µjŠŠBÀyÄ–+@[©3\0L’\Êw.8jý\Ó\ív$\Ô\î“]\Ìzq‚Ê®Y\Ó#\è\ÆEI—b¯\åvžc\Édq\ä‰ã‘…•Š\Ç\Ý,F\çÈª _(\ÜôšQZ\åk“\Â(†Oa;H&cì¯®Ú‰(É	\ËXÄµ66\Ý\æ\Æ/(‹.Š6sØ¼C½û5D«®Íˆ?­\Ñ	\×<N ¹emy¬À\ã\ì\È\ä\Åñ«\ãNþ0\Ñk0˜\ÌOq˜ûDG?1\Ç3\Ä\ç\Â/c‡,+®ö\Âd×Œœ¥…GX\È?),‰‹…OÇµ¼&|6\â¼c\Üge\Âú¬\äòw3–ð»µ.¹_½{\Èsq\ÙÄ·\ë3µ7\r;r\åU\Ä\ã¯×•\Ó*ˆiKŠŒ­wÄ’Ô‹Ä‰&Wh \äLE!$M×‡v0S†OŽ­”,˜s)v9\ì‰`²ü®V)Ee\Zb \Ã\Zgºž\Ü`Ø‰ƒFg\Ó,NQls±yH.*	˜[™}±˜\ÃNKh(ýºH—1ª™\ì•9ˆ\Ñ\ÞË‰ˆ\ÈTÁC7aIeÍŒ\ë\Ò\ê\Ùz½=M™\ÇQ\Ç\Ú=ñ³°\ÉFU8\Ý\ß~½‰¾\åL–ç«¬e‰ Ÿ˜²\ÈMs9Õ‚Ÿ\ë‹s›\Å\Ô\ÞK¢3Osfv\îs!”¬y\rÄ­­”“r\Ç(½¡’<W¾‹ŠCL™§K&8\ne˜m\ìTi~“À.I\×e\í,tA_\ÈNC`bK…\Ög©\Ø\ê¡\ã\Ä\ã-ú•\ÂT\ÝË¹²	•¬Vk#GwmŸ™\Â\\\ÄR¬g\Ò@\ØD¬TÅ´½1–‚\ÛYK€\ÐQŸ,\Ä­u¾\\~u¬g´G0©„‘³ògÉ¤Õˆ\âL4(\Ü:¹Hv­\íž\ã“JÙj˜dv\Õ@\È{\Æ1žP˜:¾80+Fk	Š\Õ\åb\ÉL§•ô\ëne%Œ±[)è½®„\Ü6S/²s¸Q\í‘Å²±Ds¬{f¦A.×£›Æ¶?e\ä‘t\éXp\Ó\ÊØ€\Ã\îS³¶*nCVfø¿\"÷„\ãûaõñ\Â\Ép6\Âv\',^µŽ’\"kcn\á\ã\ï1\Äqú\ÄGö\'²‰ð8\ëˆ}%\Ã\Ù\Ì<eZ\ÜÛ¦®×¬x·«7óY\"™³lq\êdF:°O6/-x Ÿ¸Þ®™ÿ\0J2ò@öc—\Ç2qr\Èò\×\Åî¬¾\Èñ<\'«·€\Å9š‘j…ªrŽ\ÜHe+°\åK—\ÃZ@Îˆ7Á­R‘¿ig\"\Ã)\È\Ìt]¤\Õ‘=\Ö+Jy¯]†¸.†\Ø\ë\0JŠ\ê>;©´9‰”‹*9gÉ©«²¡]¶,£\ÜD\ÛòY¨U€H½¹Š\æC\Ú%¥¸=<Áe\ÔCbŽo\ÑO\Z\Å\ØL¥\æ6U\ÕFr•\í\Ý\êld¬frô¶^þ\ß\Û6î¿¿’uF\Ù\ã\î\r…B÷xÅ…kgõª¶fiD\Æ/);³/õe‹wß“|o3†\×ÿ\0zU‰ü\Ú¾q\\ò\Ì_ûû’\ì<‡ªVŸ\\\ÑF™\æÈ®YK‡Mƒ2?“8˜™ˆ\ä¹û”|rR2\\‰L\Çq2\Ö	e#Ä„‹$¢yg¦y\ÙT–+¹#.E\r÷B0´‹r*.•1o‚‡.©yŒùm6v\"ñ­%`„ŽIwŽf]\ã)òX\Zò\à²š\â˜(¤ø:±\ÌA2»:HÍ‹VªŠI/r)–S^ÁW°\á\'m\Þ_\"[W;\ÆFÌ¡\È\Ègª\Ü¾wFÑ­š\Û\ï«\Z\ÌQ\Ê\í\Ë%O+V\Ý\Â8™2sb&{‘7´ð:‘™ùtŸ\ã\Ç<ñ\ÇY\×]uŸ‰Ž5\ÄL}\â8q¨Žu×ŸBçŸˆ\Ì\Ìq©\\\Äk§\ï\ZŸ\â\"8\â5Ì‡Ž§o\'bAo\Òü¶NÀžh0\Û~–\Z5*‹fa³™u*PI\"°\Ä5œ$|GŽÕ¢¨ª¶³\Â,¨DM	1!-y:˜ñ\\,L\Ç\æ\ê¦|c3\í\Ë@ \å¢\Ç\×rÈ \ÙKDLœ^U‰Žôµg6\"&,·(™%DÍšó$\Ä.õT€,m2Ä€€^\n\ï®\Êö‘™ô\Óee›%^­Ci¹Œ~QÞˆ\åU0J\È\á|\ìù:º\ï§‰X\Æw<\ÌvÇ¢\äÉ±E?1V#ö$OÌŒx¦g\â%\Ç:…s?hOó>™øˆ®SaQs\ÇX_\í3À\äò|{}OK·‚ˆ}JÞ’©g“\ÊG¤óy|G¥Ub¼\Ù\Í#S‘­D	Ä‘.¤>AX—·x„@\Ë\nc\ØCl\ÙaLV¯À\Ë\È\ÄB\ìvdy®¹˜’‚p\ÂlHL\Ä@X€\ÄH`0x‚c90ƒy#\Ô\Í2\ÈW†L[\\2¸…¹v;’Àa\Â\ä\ä\ä@\ám%I”ô™ˆö„\åB5\ç\"`\Ý1o™üø–‡V’\í\Êl²Eª\×&`Ã­1ƒ°l\Èp$\Ð\ÐS]\êPM^KÓ½‰–aoz1††È©\Ñè¯”£\Úf¿ð¤‡|ôz&\×Aš3\Íô>\Ê\Þ,\Ôú-fW\Èf\Ù\è\Í\å\È\Ã2¨ô•\Ì)\ÌUô«›]“³j±‘\Ú\ìJU\Å\\oˆ+²D‚‘AK\Ö\ËAibXP–(fjû$>$˜®-Š÷;‘(¼kªÌ«¬d\'‘	\áS†ž\×\Ò\ÓVµ-k:uÔ·­i!tˆ0¤$še+‰™d@ƒ8‚a)‘#ù\Ò(d3\éYHÅ“ R\ÈeM2± E!1¦\0¦»P\Õ\04H`T\\uA‘Z1)¾0˜>\Û\æ\ìO’\ÒW\ì\Äú\ãù»•«Z\ÑEt‚Ü‘VDb\ÄS‡½‰WYÆ°‚¿q\Ñ\ÓC¸†¬”q²UÆ±K»y&»\n\ÅWy¤–,¥qŒ9÷DJ†\ÅSò\éOq¹½\Ý²Ç+½³‹°\âeP“\ÓUz!A a\"õ÷‰šÀœ2£)/™§2ä¨›\"R¾²\ZC¥DR5”\ÄyHj0\Û–\É4\ëaI¶Ã²\"\Ïÿ\Ä\0;\0\0\0\0\0\0!1A 2Qa‘\"0q¡±\ÑBÁ\áðR’#34@CSÿ\Ú\0?\0…\n(\ã`¨*\n‚ ­Vª\n\ÊVR ¨YT(P¡B…•¨P²¬«*Ê²¬«*Ê²¬«)P ¨*R²•¨Ž2§Œ©R¥J•*T©\ã*Tð•<%J•*TõeJ•*xÊ•™f0Y‚\Ì`¤)R`¤)\êÊ•*T•%J•< ¬ŽB™]]]\Z4\ÑaPTn…B…•BŽZ¢\ÑB\r•Ñ¡L,Y-ow\ìH Eƒ’-#\Ø\ÂeA¨´,«)YHYJ\ÊPb\ÈU•dA« YB@pž®¼\'Ù–J4\Ê+\",<a4 5Eªh[-øˆ\n!‹VP‡ZxGQ\Ö=I\êOPˆP‹;–R¦`³\"\åf‚2µA\Ü!;\Ñ\ÑH\ïY›Þ³õ˜r+0\ïR‰…¿V:ƒ‰\á±”T(Dk§%\ÂhU+\Z\Õuˆ(\Û\ÚQÿ\0«ROpþ¦aôû,\'û\âPÅ­FÔ¾‰¸µ—\ê¥ôL¼Âª\î2û\Ä}\åv\ÕÛšƒ«\á4X\ìµ[Ï—Ÿ\Ý~CO\Å~GDn>h\áV­\Þ<ÿ\0”l,\Ç6ùÿ\0(\ÙÙ\Ô<ÿ\0”m­†\Ïh\Û\Ñ\åPy„m\Û\ÉÀ£@„i¸r\ëG±\ÙJž¨p;ð†óE£’”;(\ïT,\ßX\È\Ðw£ski¥1\Ýü•\Î!^±‡;O’.*S{¤©…F\â¥g¦\â‚\Âñjxƒ}\ä\ß#ü¬^\Ú\â\É\ÒKÚ<«o+7‚Î³,\ÊTŽk?rj\rœSoÒ ”!\âZV\ÊT•™\Ë1A\Å	PŒ™Ž¸p\æ‚ˆ	 N©\Ð…0²•°\ÍX\ëÜ®±\n•ýQ£{‘9D©\â\Ý5\îEO=\ÌpsL°ûºXµ©§W´4?p±\Ù\Õ4\Ýð=\árP¡ýB$jš\â\ÝB¥pÓ£‚#˜\ÙH*a(R€P¶RTU€ðP¾dtDIDB£`\ê¬;oh\Ê{u†]š®p?\Ý\íª\Òí°O\ì€\àÑªv\à8\á÷¯³®*·\â;Â¿´§‰Ú‡\Ó\ßpeR›©¸µ\ÂG©\Í¨P²•S¬XSÇ¢\ÐˆQ\ÂBžxÂˆS—dó%j§U€\'t\ÚbD«I`0tMq\æj7b„R\ÊÞ¯m€üO\Ãö•6¾\ã÷•WðÃ·¥S\Ì}¾\Éø\í#ØŸq•ZJz=¤{Á\n4XfoK‰0\Ö\ï\ßð\n\Ï°-\È\ã\ïU0[\Z”\Ë0<F\ê\êÎ¥sIü¾c½~\Ä:\'ú+ÎŽ\Û\ß\ÝñXþ\ÒsHj7º(ñ€‰D…*x9¼\Ó^B¥ZtDÎ¡I(\ì¡¥JÊ™^ª\è\Ê\rAQ§š °7P©™U\ÅALšq<¥Q\Äêš€Tdò\Ðþ\Å6£‚m\É„.i‘®ŠžW\í(€\áV\Â,«v\é‰ð\Óè®¿»5©\Ó\Ä\ëæ›‡â´»ÿ\0·òŸŒ_Y´6\áƒ\Þyùh¯¯j_T|\Ú­2~/mýn\Ð\Ðýþ+ü<üôO/²~t\ÝÀó_”\Üsa5ÿ\0¥\"¨\Ý%\ç˜_”<n†F\å4ù{G5\è,FÁ‹\ÐX6\Ñ\ËNˆ°óB“·±\Í\Ö4EÁ;¢!B\Ð d\ê‰L„YU*B¬õ|¦žJ˜…&ftS¬\Â×¹\0ª—\ìµ~W´\í¡\ä¬ñQ¤t€Ÿô¦\ÞGh&\ÜSw5^»h\Ó5°WWo*\æ;‡\ÙX`\rŒ÷>_r«þ·ªOFKc\â¶}‡V\éhñ\Ìm#û\âŽ,G¤Ss#\ÂG˜T¯-®üo\âmMû„ü5‡²a:Æ³;%9µ\Û`?%4y‚ß˜B–nÃƒ¾IÔœ\Þ\ÓO\×\èƒXí‘¢¢ Ü\Ô,¤nA¯\å?T\ë9\ìR›©\î©\æ³Z Â–¢‹Ej`•Vã¢¦\\½.¶lÙŠ°»\Ût]9YÔ…VÝ•\Ú•=”\êtŽ2GÁhVP¯©=ôaš\ë²\Ã(ú;zG7S\ßÜ›t\Îz*nh¥\n­†Z\×2ö	\ï\Øù„pº´\í«9¾\Ö=~k¦\Ähöé‡Žö˜>E3·œµ	a\îpžÉµPK`\êTŸ¸U0\ên\ì¯F¯K°\ä\ç»j\ÔÁM\Øqo\ÕtoKdx}e\'£l9#nS¨\ê\ZlC¹\rý4\êb!ú\Ï5qa\Z±–˜w\à5*$©R­¤¸€¯]£Z¶V•\ZÁÈ‘¸D©@¦;Dƒ!\n!¤jº(Ø¦Ô¨\Þršù\êcO};B\æ\0N›‰M}Z.\Ì\ÒZ|4Vøý\å=:0¨~  ÷T|þŠ•v\ÕnjN\åv\á>Õ®\Ùr\Ã\ê’¸ˆ¨AƒôFGh\"j4\Âu²\å\Ð\ìS@©29+\Ûv:H:¨2ZPi”k\n¶\Ë:\Ì8[’¢¼’ðJ:ž•zJ\r(”J”\× \äƒrD\éÀ—#s\Ñ	q…O¦\ã\r¨’§\\;C\Â\â‹k\Òu7lB­nZz\n\ã^G‘ñ\n­3Må§’’k‹™†x\Ñ[\ã×”tq;ù…oø†\ÝúT§\Ì~\n\Í*\âi¸8x*\Ü\Â5 O\Ã÷\Ù\n\ä\ß8þT¼÷Ÿ\Ù¸\î\äiŽk£gr,gr-j|®©\ä©!7dw•&Q\0<!Bcœ\Ã!\\Tm@\Ò7Q<0ªƒ£-<Šm\á £ny\'R{PA„ƒ‘:)W×¢Úœó;*µŸYÙždð²\Ä\êP9_«~ž\åmtÚd«\ÛÒ¸nJ‚B\ÄðŠ\ÍnfzÀs\æ=ý\è¶VB€;&‰ \×\Í0|®1V‡hŸ˜ý\å[\ãVÕ½W§\Ç\ï²qU¼£K¶\èO\ÆhŽÌ”ükü[óNÅ« \'b\Ï\êFê£·qF«\Ï4N…5¾ªsL¦²wE€\î qž\n\Âi\Z…ÿ\0ûZ§\Öo%\é5\èöþt\Ëún\Ñ\âYJ®­2ŸjF\É\Ìswpk‘:,\Êþ¹¯\\»\Ðqä°«Î‰ýŽ‡\äS*HYÀ\Ý²­‡[\Õú`üŠ«€\Ú8ú®->Tÿ\0\Ãuw§Px¤ª˜%óvh>\ã÷O\Ã\î\ÛÚ¤|§è…µbrµ†}\Åaø/DEkO!\È{û\Ö\'ˆt##;_D\ç%J(˜@’\ì¢U\\ÀJ$l\âS¥j (PD„t\ÝL¦Tu3™¦<Z»72©\ã\rwl&›ZûDù\'X‘­7yÿ\0Vº£\Ú<\Ó1<C\Ä \Ú5»%:\Ñ\Í\Ù–\î‰Uje¦\çx\0 al‚°¸5\èµ\Ä\ë\ÏÞša ðt)Ï¤\ßV£‡\Å:Ú›µ¦|“…j{^”ñ\Ú^—;ª· 4‘º©Q\Õ\\\íøüV‡•·3ƒ4lˆ)‡H(“ºBŽÁÍ‘i‘•ˆ\ÙQ\Ä+R\ÐKJòL­ip5\"|tN°ZfM\Ýµ$\ÜE§Jþû‘4jTÂ¼¤\æ\ÑwtÜ¸§¬9\Ôþ(*\î\ë\Ñ\éf\ç\ÉT¸¨÷J·ºvh%2ö»?Tû×§\éQ¾I\Îc»=\Å]Pƒ\Ò7\ã\Â8|Pó@\"U¨™¨Va\É9ðš\ä^6Rz\ÒT­x²K)ð•\Úô»T±·mU²™k\\A1\ïN·aÕ‡\Ëûûªù\Å\'6wPy-ü0\Ç\åºoŽˆ+¹\éj\å[U®\á@P8\ÜR\è\Ý#cÔžò“ƒœ#eJL4 ž$¢Â€…ðö2T([¢Ày#LòDÆ\ÅJfZS1J‘Ÿ‰\Ì\èµ\ã`\Ò\ëª`w„i®\êôT‹“Ý˜“À\Êc\Ü\Ã!Úƒp…ñ\æ\ÕoMõÙ¢}³p¯C5+¤\å?º\ç`|£\êº3\Ìüþ\È1£Ÿû­;§Þ†nHˆ\ä\×ò}Ö…	Q\ã\ì‚*T©[¢ÀQ¦y\"\Ò7\ê‘\áa&\á‘Þ¤µM7úµD„ü#˜\Íû¦\à¶?\å?ùš%wÌ¯\Él\Ç\æS0«ù’žÄ±ŠTe”µw\É\noy\é*\êO/¿\ÙT\äºs]\åRnÚ®›¸#UÇšž\ä&\Õ\ï[\ì -{ö £O¹F\è:pµ¸}µAU›„\Ï\Ä.Ú£AM\Å\ì\êv™\åV¥…]g\ÌõO£dv(ú\'Q¶\åõpýÑ§D~£þ\Ç\î‹iýŽÿ\0o\áÿ\0«¼ÿ\0„\æ\Ó:\ZŽLm\Zn\Ì\'\Å:ä‚5žw(’wêž¥\'\ÝTµx•*W¹e%O\àˆˆŽ3\í%Jž¬ %6™; 2ˆ\n\ÙHS\íg„G	\ã”.\Åd+!Ycu¯*zš \nÊ²¦\Ó\Ê…¢€Šü#\Âz°hY\èüWFº5‘t~+£+£(0sYZ\Ü7D\nPqY–iS\ì\Ô<\ÜOÓ.H(\â8ˆmÄ®JT\é\Ä\íÔ•ÿ\Ä\03\0\0\0\0\0\0\0\0!1 AQ\"a02Bq‘@R¡±Á#bð\Ñÿ\Ú\0?\0²\Ë,²û­‹E¢Ñ±h´Z-Ye–Ye–Ycf£Q¨\Ôj5\ZEš‹,²\ËE–j.\Ê+ºŠ(®\Ê+ï¨¬¨¢Š+\îM\Ðhf–icL£K4²™O*e2™L¢Š(¢Š++-jF¤Yeÿ\0e—•–Y}›÷9Q¬slRešž[eÀ÷,R/+,L±2û66\Ê\ËÉ±\ÈlM–jF¤6‹C’,²\ÍF£S53[\Í\ì‹/*)n¸9\É,Š\Ër\Ë-\Z‘¨O±»\Ø\Öj˜÷\ä{eú	\É\Z¬R®1\ÈYò5’É»CY#9\ÙcÝˆ{±o\ÝE›d¤Ye¬´\ß&”…\Z4š]zÂ£‘ÆŠ,Rbmø74¿BŒ½\ZM%\n\ÆÇ’,\äo:¢\Å\Èù,l¼¬{••‰‰\åh²\Äòl²J\ÑLRHJr\Ý!`\ÍòÏ³\Ë\ßù:-pÎž\"\à\êMr/ˆ\Ä\\kŸ£\íX‡\Ú1\Ö\Åôu&ÿ\0/ö57\Ì±IþVhO\Ù\Ó~š\ç\'—’•\r÷\'“]–\ÉBPü,\Ùòji\Òdf\ï‘\ãM::\Ûn,Hµ³\éÂœ·–\È\ÃÁŒU–¼\Z†ö!²³W\ÐmKi˜N?2\à\Ãq{4*£Y\Ô,¶je\Å\ì\Ñ?†‹\Þ-lÆ²\ÛÈ´›d\Ú516ò¼\ì²ó¡\ÂUQcµ\É=†\ÕpF7Á+\à\ÃÁQ\ß\ÉË¡¦\É\'Áöd¸¢€­\Ñ-ˆbZ\Z²;šK¢Ç•ŠTJ6O\Ê)®Je	VT6)–¤jE£R5#R5H\à·Ç²6¶´FüÃ—„CJ\\P¦ŸONì¼¨\æD!;Y\Î\nJ‹p–\äejÐ•e.6ø\ÊN™¨\Ô)–™(ƒ|\r\Érjbo\Ùl·\ì·Ù¾[±¿dR|¡=t8	\\\Åù’\'-[¼ù¥y¡|G´,X¿$]»1\\\ÅÐ‡ñ~N¦\"wdq\á¨Æü\Æôº}\Í\'\ÉH¤8¢šðJ$\á{2Xn%vVTmT$†RÃ¶ø:‘òIú$Ÿ*{‘•í’«ÜžZ¸³\ç\\1c5ø±`\ÅO|”\ä¸cÄ“¯À°õ=ˆÿ\0ÇµzŒHita\â5³:ñ:\è\ë¡c#¬Ž²:§Q¿&¯¨˜Ÿ\Ô\ä\Ò<(²_|2X8‘E3UŽ[Ð˜¤\ïbš(T†\Í[\Z\ÑL¦S$ˆ\ìu\"Y©\"×³‘\Â,X-ñ\"]Hr¶#|Ši‹q$¢bü[\â\Ãc\ÏM\ÉY)\Æk}Ž-r†²þ…Ñ³Je´jf¶,C¨,AM>7üÈ–\ëbx2OSb’%p6ù&ôÐšc·\äÔ\ÆQ=Rx£x4škƒT‘\Ök”,h\Õ,‡†¼R‹%ŒÓ¦V·hU[f§%\Ã5û_\èù_‘Ä¥À\Ó.‹±–&¼”™¥\ZJe´,G\ä\ÛÁmn‡Ï™<7\îö\Z¢[­¹]‘Š“.¶H¢ö0W/,Hêˆ»\\S45\Ã4—\"Æ‹\äQ„·C\ÂþV%5\äK²	9+°\æ¶\ÝÁ‡‡$\énIV\ÍQ©®¢ò‹L\Ñ\èù—\"•ðYf\Å¡›NŸ>có!µVEÂ‡(H’¯<œph4±s	mDU]ž	*“Y2ò¾\Ç\Í-=…‹5\É{gROhŽX‹‘b_%‰“Á\r7‡\Çþ\ä\Â\ÅX‘R\\2qkt%j™?‡Ã—øi®7%G•De!M¦\'F¡H\ÔY±\È\Ý\á;ð>H«ä­„\ÛÙš\ë+,j\Ì%V~¹b­\Í\Ã41ª\ç¶û!‡©Š)q”ð”–\Ä^Ÿ–Y\àaGM\Ãdüx¿k\Ñ	\ÑÔn9¦[l/›b¥\ÆÄ°&¸\ÜBŒŸ\ÃgLP46t™¡‡ô16›\Øm\Ð\Ú\à_¦[g¸\äò\Æka+\ÝÑ©>M|\r®·9XžVa\ÇL{1°õ+B\Åq\Ùð&šµ’n<f¹Bøˆ>W÷&óBœ9R-r\ä¿sm¹‡,¢Ÿ¡_\ÐIòM\Å1-®²ŒuÊ¬øˆ¨\âµ®í—¥\ÓŠ{š\à¼\Ë\ÊË£\Î“\ä\è®b8K\È\ÑB“ðj¾P\ápKK+#»K)=\É$-òÅ…23”]‹/‘J/†=‹ör~§\Ê-$x9\ä¥\àIú\ZfË–\'\Z\Ú\ÍO\Ñ\áˆüvíªØºG£\å,²Š\ÊÓ°¦Ÿ’ójÇ†¼\ÃcÖ¼\ZÐ›\\1\ÊùCŠðCñ,´\ïc\à[eŽ¸cšY=LŠUTNŠ6\àb!?\ÜnüŠ„¿\ên½!»Ub‰ñLV\Z$¹_Å‘ƒ{£Cõ•vR4”²Œ\Ú:‹È¤Ÿ\r_$°¢Çƒ\èq’-y#V«>y~2\ÅWži^OrJŸn¯löò%|!Å®v#(E\ß?û\êcO\\\Ü\Ç\ìŒSBŒj™¥oBýr¬«²ŠE\æ±\Z\ÚÅŠ¼‰§\Æn	Ð„\ÕnR\ËÁ?\ÂË§L‚¶$Rò&¨•>G‡¤½Ž\r\ÈBMìŽ•x\Ù±¸¯_½ÿ\0ƒ©\á»\Û\Ûýÿ\0ò?S§h”5?”–rŠ­\Ð\ÊLþ™\ß\Ü\ÑE)\Éy“\ã6!VXŸ…”ˆ\ì\ìR—49´<VuYÕ‘Ô˜¤Ï‡øy\ânöF&,`ºxcwÉ¨¶n\Í?SJ\Çù\'ƒ\è\ã“|¬¬¯\îkµM¡bûBið$5YIZ¡\á±\á¿D\\¡\ÃhXø«È±ñ|ÿ\0c\Ï\Òý±\åü‹ö3þD,v¿\"\'‰5\\\ZJ_u¦\è©gY?¼¢²¡:b•—}”Q]ôQE.\Ç$¹\'Š—z³|¨\à¾\Û/º²¼©f¦\Ñ\ÔúHXŠw\Â.O\Çmw¶\ç\âO¡,i^\Èw\'»4³r\ÞoøŠ+²²S’òu\Õú_¡\Õ^Žªôu~‡Uz:¨xÀ\ç6[~rþ¥¿93J4Q§7ü\nÉ¼›\Ü5\Ù\ä]Ë·ÿ\Ä\0I\0\0\0\0!1AQ\"aq‘¡#2BR±Áb\Ñ\áðSr‚’ 03¢²\Âñ$Ccs“£EPTƒ\Òÿ\Ú\0\0\n?\0ÿ\0H\ÑöúO\ÐhÑ£F|\ë\çôŠÒ¡B‡\Ð>‚j<þþ€ÿ\0R~‘\ïôþ\È\Ô? §§ó\Å1ôÚˆ=4\ÓÔŠ_S¤x5.:fˆóSKIþaR:PzZ‰ä¹¢¾hP>µó£C\èš4j[\0~ø«—‡3mf=â¸„^¬}¦®\ç¨õ«—R@­c¨†?Ê–\çFA§Þ±û\ÃøP>JO\éH\ÓÈ˜>\ÇýTPúÆ§\Â**\äEyÔŸ ž§\è\Ç\Ñxš\Zõ#\èÎ¢½ª 74Zv\ïPSX¼¨‘pôQ€\ÑÓ­3´nN\ÔG\êh	\æF#cÖ¢G:  ¿kœDTFØ©\ÄÖ€ñŒQ¶v\"p})A\æ`Wj€\çW1F\Ûþ;ù\Z?A£Gýji4CT|\Ñ ušQþ!H¡qV\Çø„~uh\ê\Û\ë?:6Dø\ÍF(+y\Ðc\à&€ñ#ò­´	\Íc‰kP`ôHŽ<¨´u\ëF0qËB\ÅGAX\ëCW2F\Õ\Ý\Üã—•j\î(\Ä6\Ç\éR6\ÍI<ú\nŒKT“\ÝUñ£Õ¼<*Kqü\è7Z\Éñ¨1 f»P6\Ôr=y\Ó/‘šg\'aJ÷¨\Ú\'®GÊ’\à•3K\Ì$a}*I1¦\Ð\Ó»Ñº\Ú\ïxùŠ¶]Nb\é¥[\áA?iW>\æ®qOø®I\Ö?À\éÅ±\ÝùP`fK4Áõ \È~ø@gÎ‚\ë‚¦U\'iÁô¢S\ÎE[QÐƒ4s#sQ¤D%AÛ¤Ô“÷@“A%ŒjlM}““\Ë4AÞ††\î\æ¥L‰\èyTWxò\ëG?„HnN\ãþ´þ*Ù£ù\Zrz\â»À\Éb7¨\ÇZ&I+9òù\Ñ\Ôùbk‘PIñ™©š’htJ­2H\Å\æµG\âED\ç­O\éCÒŠžªht\Ô~Ž\êý§·­oöµ\rü\éUv+|‡\ëB •‚|\ÄÖ¾²9ù\Ðfs•\éDOSµv¦\Ù\Ôu÷@\é\çOl\í¥q\'5\Çm.	2<b•LÁYzi?Æ„\Å\ã\ÌQuˆ\nE;$Q`F`\È˜1À\ë\ïDúWJ‘£jpX…;ÿ\0BŸ9û&ˆô\ÛÂµ\ÏCƒD\0ƒS\à7¢\Ç\Î#Ê¹\ÄMwI\ç½§aDjÜŸÒ†9\ÍP\Ò\Ø0j@ü(ž‚ ‘$õ&£Ò¼£y©at\Ã\ÌP\Ô:V\Æ×¡\åS\Ì\Åó ~U¤Žqó£\0j[eõiõ¤žF\ä^¥¨^A±*TŸJ\n\Ó3;Q+Í•g©ç±­g™«@¶#]#7\ÞT3´\n¾r¸ý\ìhQ°G˜õ@ß\\%\ïÿ\0\\Kw5vnx‹ 4`Á*:¿\Äc\ìÛ¾·°$ü¨±‚ 1L=-tùSúÜŠÿ\0\æþtG•\Óüiÿ\0÷Ð¸?»?¥8\Óú\nì˜?¨®øè—‚·±\ÇÎ»\'c…º4–òœI¬ük½$\r\á¦)\ìoZAûSÖŠÁ‚L{\ÐumŒmDÚ» V8\"¤œQ$øQb<kK\îJ.\íœUqH\ÚF\ÕbÃg fˆ€EH\ëK\í\\=­Q­\Û\Ò\ÚöRýŸ\ç]²¹%u\Þsÿ\0Z~\å«c²´m\È$ÆŸ:¸\åOuV[\ÒE¶”Á·¤©\'óõ¦à¯‘$!‘´@1\ïó®\Ðk®ƒ\0Œr4¦\ÙPöYL©8;PLK\å¼y:M:–2¨`·‡(\ÈH\ë]–±©^ù\Ö\äy\ä\Õ\Ã\å\0\Zf¼ñ¨L\É;\ËÞ\r„´,¨UfQõ™b3\Ï5p\\Œ’¡”\nOŠ\Ø_º\ÌE\Åº\Ç#\È<\r;ZÕ \ê]/iÿ\0ŽG¡\Øü«²Yú\Ù&~,r\ë@ù n¼Æ£\0@’Iòd+	C4þUbóF\ÇRþ†­]¹m´²\Ú$\é>qp\àio³l¸Þ®[~hHý\r\\dnËˆ>\Û\Z{“\Ý-û†‚·\ÝõÇ•^\à8•2\Ü?w>q‘L\årP!ýzR«\àvd±>µn\â…IB m2`T\Æ\ÔIÒº€öŸ/J6\âb-Á™ˆ\Û\ÓÒ†€€¤ü¨i‚Ab\\3£y¥p\ÃQ¤(Àýh\\\"T B	\Ì\íWw:A\'Þ”O:²$óqšj\ÉO]©\Þ)£ñŒÖ¢?	§‘´=\é®A´§S2\Î=O?V¸\"\ã»¡ASB\êH‘¨H§…^\à8{÷Uûs§LÁ$ñ;t¦\ã¬Y(VEQ™ï™‘Š½\Úöa—HÐ \ËN<·¡\ÅñJ\ß\í[í“°™ñ‚z\nd]Áo¶|‡\Ýó\ßÆf—$,\á\Îù\ëÊ‰»8H\Øy‘\Æ%\Õûvnh…\'|AÁ\ëA£{W-¬G„s©ýœ7žE~\Ïû\Å}©´\Ûˆ]D¹\Î\Ó\Ô\Ó\\XM\Ý\'\Ó5\Ä\Î4,±=LÊ¸\Åé‹´0\â”\î®Gû§\ZLF+´±uuÙ¸\Ã\í.\Ð|F\ÄQK.ŒÖ€û®\è>Ç…¥ ‘\È‘¦¸\Û\"Œ5Ã™\ç-?%›„—\nÀd\æ\r\0\ë³	Æ»¡\Ãj<34\nƒ÷¨vŠÁŒ\àõ¥b{¯lõS¸ùƒW>1ð\Ôûû^¶¿¼FN9\äx\nP½œ5» ³“#&0w;t¦.²H]	\Ï#¨È¥$\\\Ú5x£=&ƒ[c«M¶ˆ;\æiN“\îôrÎ†Ÿ²\Çy3ƒž½)‹¹ªc¬\æ \Ò\Úy\Ò`	û3\Ï>”‚øh+±\0tq\çJ\å€I\n™ÀþZW,C¦:\ížQ]­\Ò\0‚Nv¥y:qr=\'­#’	\ï\\Òª|KE:™µ\Ð\ÚVzžž4¿¾«\Þ*ð0A+´øŸ,\ÕÀ‰\ì÷§A?‰Bˆ\È901V¯(\Ú\â-\çVAT ú\ZWºÅ‘Ý’H˜1œb\\¼xvkfõ½ “·‰‰‘\Ë*\â]eE«™##\Ç?Ð¥8Qn\Ð\Z}y\æI\Ä!W´	j\æVr\Ýft©$“Ô“’|\ê\ßw‡“¢\â’ \Ã\0w‰\ÍX¼F\Â\Ýõ“\ä7¤\án\Ú]j¼Kvbé•v|\ÍC#dˆ¢¬+G½w®\ÜK3\à%›ó_jaj\ã3\Ü\Ò`Àþ”E»W™Rrtòù})R\×ú¬]s\Íí„ž€}*e è¸‡¤só§š°\Ù\Ô\ìEVWKO3\×\Ø}\n‚\ZK0Q±\ækV®\á\ÛÏ—Œ\×y3\é@]¶43Éœs\ß w\ÜóŠ\Ø\â3ò¢\\‡#Ê™­$r!—ûË¸óŠ^ûP†Ï\ØøŠ{T­	“\ã\â<EvWuµ<±¶òdH\'8¯®¹0”s…\'\çú\ÑB\Âu‹!\'œõÞ‡h\ä©h\ÆþûxÕ´3¨¹r}@Š\Ø\ä[I\Þ0(\Û/²[Y Ldý\ßz`\Ìs\ÚùjŸj	n%˜\\ò3\ä*ý\Ëw&\×\\\â•H\ÞPL\ï9ÿ\0­Z±e	›·\Ïfƒ:c°cœWci­jCeûgsˆ€£~u\ÅqœC\ê~-û;\ÈnZK\ÄE\\N(j¸\Ñy\âÜ\ZT’pI¥q\0Uet\àF0zR\Ã\à™Ÿ\ÅÓ¥=òJK“©\ç#¥3›Z±e@g#|“‘\ç&¸~#Ž[zÝ¶\ï*¬‘¨A\"4‘\ê1W­Y\â ›u	•\Æ:#ûÂ—BLÓ°¥a\àf®\Û\È\Õ\Ãq#ÿ\06ÈŸqž\É;·{þR?Zn“·`Çº“\\7\Æsû=\àNÀm¿*\â,]±m{Sd\ÎCgŸ*\íq/	©Ô¾©ˆ-´x\×\rq\í$¥\Ý@ù©A\ê´|\ê~#Á·\ÅI\Í\Û{%\ß=”ú\Z\êf\ËGšŸù\ÑVSO#\Ó\è‘S\Ì\nc#ðšhh\É#rÝ½\ÌF| T¨\Øt v%Aóñ§{·t†¹q\å°3œ|\éšÞ®ö€\ëó \Æ;®0\Èz©\å_´ü:\ãwn\Çvz0û­\ã±ùU¾\ê€ö+9\íŸ1\Ö1É¯[KfÛ†a\æ1ýu§»qŒ’&}rþtš­\Ér\Ùh\è¸\Éõ\Å~\Ñv\Ø	3\åª7\ÎÂ„:ý…Æ‘\éÿ\0ZµqÅ«]©\Ó…û\Ç9¦p­ •r\áLg—¾õ\Æ\×”K6õ›¦; \ìq\çz?øƒ\ÛW[= P·b»•\í9ŽUÄ­­*D\"¯ ª0£Â¬_pÑ¢\í¶ ˆÜƒˆñ¥¶úf\ä]R„(€§VH;¦D\ÅY¶÷\Ñm³\Ç{@\È@\ã\Ãj%\Û\'¼\ä0=+€kC¤¼\ÄôÓz7\\)úÕ¾O(Yù“8¦{¦`Ýœ\"yŸÖ\Ù\ìm\Úh–vˆ\r€œy\ÐÕµ¦ˆÿ\0ðöú/=µ\Õ\Ú.?H‘ù\Óðdw_‡½Áº¸={’\'\ØP\âSx&O±\Í2\"¿#L ImI¥´€$“\'¦6ó\ëY\ëW\nm¡Îµö2(X\0†k@¶Hç¤ˆ«I3=°~QBó\Î\Ê ŸžiF¡\Ó(e0L<\én\ÜŽ&\Í\Ë`obŠgfRAô£w‚\â]\á\î\ÊG÷”\È>\"–\ß\ÇIb;®?{¡ñ¡p~\íôY\É<R~•\Â\Ú\Î$\ë\\\r¶\æ\rðß•pœ8\é-•p\ë\Ô*¹¥+Ã–üÚ¸övBÿ\0\Ìk\âN\äÇ½|Q\ÇDkkÿ\0)¯.4/\äµñ\Ë\ÖCY»ñ\ÈÃ¡\Zr*ó²\ì\ÏÄ¼ò‘Wm¤\0x\ÛhºZ~‰Sþú\ÜûÀ\Ì\r…pü`+Ý¹eû\È\'\"2b\0\çW\ìñ6Á\n5	\'33\Ò9I«WšB8I2=$ó«wÕ‰\ÒYVD\Îü\Î\ÂFhð¡PöA5¤“œø@W8Û¢\áMW6\È‘;dŸ§âˆ­¯\rB1“\ÌùÐ„%ZÞ‚\'À™\ÏÊ›´#.X\Î\Û\ã$gó­iH  I\Ä_¥;%µ\í6‘©N\Ñ$`òŽ´ªf4F7œ\ÑF\è£R\Ýq€À.:\çÞƒ\É\Ç/(¥÷u.1*O©m1=\åü.c\ä}kˆ\ÌM\Î\Ï\å3ò¡\Úv…û`Ç¼¤GÞ¬£\É`\rY\'ÿ\0PR\ÝC\äÂ—üVŽŸ\åV®qÔ»­»¥gu’|«Š·Ø‚úž\Ã(9\ê.t\Â7(f€\'“`\×uD\Ñ.\ÊB(\å\Ð\n/ŒX&@ó®‹[\ãQÎ¯j$@`DNü\Æ\Õ\Åp\Ènö¶\à/-†?jƒ\rD®Œƒ p÷F£þ†ö®p÷?\Õ(\Þ\Æ\r7®in@«Ê¸ŽžD\ê\ÕÀüA|~­þQ\\oûÀ‰ú~uÃ¹;+6†öhùMZE+y0¦¦b£\×\è[ˆwW\0ƒG†;öOß´}W\Ò*\Û[\ÙM\á\ÛY>Mö“ú\Í\\øk\ÝÌ¤Þ·tm¹3 ò«\r\Ã\èfk¼; ³©‰™œ€WU‹V\ÕVI\Z\ÚtÔ°\Æ<\ëOjKö7P¸#0A§˜®³k\'Ib	C8 y\È5e8d·(-2É‘ mŸ_•:‹£´=˜%Jm+;\ç\Û=)\ï^\Õ H	‰¢\Í {\ÐÇ‰Uí®”\äD0\è1 Ç¥q¼^ŒvÀ½°\ß\áƒ\"yQ,V	+S\Ä6*\ÆÀvp9\çÒ¦!‰\Þ\"½q{ b[`}§Ú»N\Zã§\Éz|¨#áŽ“*\ÝO\éAý\ã\ÏÊ®7Ž^¶G0\ßô¡ttº³>¿Î›\n4Þ²ðTõÇ•86\î»=$yÕ›þ\"\'ø\Ó\Û?\æ?\ã]°*\Ð}mø\Ä(¡ý\áA‡P~–k_\Ù\\\ï§ùZGÊ­ƒøøW6O°”ÿ\0v“ýŸdþtŸšŠ7\í&\ç\n\Âò\ã¢Hõ¦:S¯¬\×h½5E\"±\Ý\Â\é>\ëü*\í‰ÿ\0\Ã-©O¦?*³Ä\í8sÙ¿\Ëÿ\0\æ®ð\ÏýŸ¦?\Ì?P(=¾WO¨\Å[¸\âY ‡Àš#É¨ú\Ðe;ƒiJœ·\rs(\Þ]ˆ«¶®Z\Í\Ë÷íŽ¿¼¾>ôœ=\âÀŽ&\ÒÀ\Õ\Õ\Ð@o1Ÿ:‘nÖŽ\ÒùkW\0RI\Ø\Ç^sÒ®ð\ä\Â\è¸{N\Ð@	Àð=5“\Ã\0­nÒ€†L‰2`:n\'„¼¡’\Í\ä%\ÑÀºŽ\0™;WQt\Â3ñ	îŒ·(\Æj\Ñ\Ð;6´e¢Åº‰ƒ¾<sµv\ÄöE¸9\ZµeQõµ„·&ð\Ë¶ÀyÑr\âb$lq@\ã»\nI91>Xþ…Cv…I\Ü\Äb|:QUìµ¿€\ëò4x{Df\Ò(\'L\'<±ú\Ò\Þ\Ü\á¯\rœL\àAÈŠ\å\0t¬ž”…\â(Œ\nVó­o\×h¿…\ÌþtŒ?vT\ÓZ\'“‰Ž±:“ùS\Úa\ëV\Ýxÿ\0DÛ¸+‚F’HŒ\âgÓpÿ\0ósö®\Ý\0u,¿Zžl Sü>\å\Ã\îp\×Gi\Ï@xzš³Å ¹¤-¼j\ã\Îqö\î.\è\â\ri=E1„™ù\Zµw\Æ4š»Ã±\Üj‘Jñ\Ú\ZIô\Øû\n¾\Äz}z\Ô\Ñ-qÌ¥É‚\ê),\Ý_öÖ”\àÄ¾§*G\ào˜u¸g²\'Ÿ—QV?b»)v\Ù:‚18(w\ïc8#}©´Zu\Úp@gØ²ò3\Èú\Ò^DYf\Õ	\Ø4\Ç.CqÖ—‰¶mµ –Ø·dL¬\é\"\ï·\È\Å\'~kHkŠÏª[TÁ\ß\'—:DºNU¬h rTb)	ižgÃ–}\é–\é?jÚ¨\Ðs´x²\åÛ¾Ë©@2\0+§,x\Ñr¼^¡\ß×¤@\Ì\åŠ8\á;5\'™7\Ï@X\ã8$½i\àd\ìÑ‚À#\rš»\Ãn\'…\á\îY-8\n\æG&b„xÖ‡\\W­|¦£Ö1}¦ö£\ëXú$Aƒ—\0üKŸqOl\Æ\ë‘Ib\ß&r&¬¹ü2+C|\ÐCIVs\ÌR\'f\Z\Õ\Æ\î\ÜS?k\ZC\ÄX$ñ<\ni\ß}BDA\Ü§øC\ÚRÝ…\ëÝ‘i\æ Ž»“¥¿i\á8·K¢\0Î“˜>§Î®po\Ö\ÓJÿ\0•¿ˆ«W$\'C{\äM2·\áuƒ\ìkI\è~óú\rj‘Ð‰­\"9ŠY\Ú\Í7ˆo²@f#\ì0ñ‘µzù\á\Çf.½±¥„AY	\Ï#i,q¥\Ùl†@u€DœL‘ý\n	\ÄðšE\ÛZbÜ³¬1	®\Ñ]£\Õuƒ\0×\ÌwŽùˆf¬\\:F¦º\ë«W=ó¼ˆ;V²\è”Ò”#\0©ˆó¤ ñµ2-\Õ\Òtø:Ö—¸.v\Ñß–\Ô^Ý·-j\Çl‹ü*\ÜUx‡Rt\çsµ]°ŸÕ¢\ïH%-ž\îü°6#Î‚WH$\çzyWt)#RL\ZKŸ\Ü\Ð\Å\\¶ß¾\"kŸZ\çX\är\"–<iX\ÅA\é?H7|M=ë¯°¿€®\r.ÿ\0e\Ú\ÉÂš\ç1¬A|/#A•„£uðú[‹\ê¯Zv\Í\Ûg—‰\È\Ä\î9\Òñü%¢\àp­õ|_¯\Z”jŽ\Ô`@¤Wm~\Í_…¸%`Lˆó\É\Û|¥ë½‡`,{„X™™µ|>\åƒ,Ÿ[:_«J° ?^Fb®_\Ê„¼Vå´œ3<£œûŠQÃ´­Ö°OÕ°’F–\Þ4\Ã8\ÞD»\Ú›\ÞS‘\író.\âÚ–8Ú¸^ÿ\0[Š¶§\ÚIùU‰¬Û¹sô\ç\\wz-”¶>l\ÕÅ‘É›‰ŸøR‘T·\Ä_¹\×.|\"ß€\á÷\ÍZN \Ä-¦:8…ü0~\Ëô\Øˆ\r7\×5’\\ÉYr£\åÎ ¶\0\î‰\ÔjŽy\Ô=µ´¢\Þ]\Å\Õ\Ä b0FÀ\È\ê*\í«\Öí”µ\Ù93€\'‘/\ÄN\Ô\î\ÌK\ÒrNdƒ±ð\åHO)Yš°<\îúR»! \ã\Ë\"šØ‚‡ƒùE^f\á¯[½¥\ÚFxt«cŠ\ãxv]Œ+Y*§½$|\è\Ù\ãx!\ÚðlR\Õ~\ã\Û`ven^•DÑ¨’N\ry\ÉG\å\Ò7z,?ó\ëZA\ÜcAI?øMj[Ã¡0}¶ù\ÑSÑ±@\Ì\n¢²y\Z#P<k¸§B_÷‹€€	\"vXöõ®.\Òý¾Ð§ÙŽf2¾fƒ]*B»gPñ\ëqDpŒ\Ý\äŸö-\Ôg\ìœybcq[\Ôxšn+Z…cx\ë,£‘\Æ6\Å\Ö\Ë=€öÊ•qhù—K¨\ç;Æ´\'\çOÅ›®·qü9r]~Ë†GÔ¬6`±Bô4¶ˆÜ²„ó:^\ÙÏ­|?þ\Î|]n^µd­\î#ˆq±Õ™ó\ßÃ•?\rÀœ;³}eÿ\0<ý|°1E8dm80\×_ð/\êy¹û6¨N…b–\×\ÈFO‰’jõ\ÏÞ¼\Îg\Ú|6\Ñ-pŒ{½Y\í¾\'\Ä=‹!S‡@\ÌA\æyøem\Ú\á-\\º--ÀnFtdc&¸\î1®¨{}›\Â\ÄfØ˜\ÇJøÿ\0‘p1öf?•pöµñ(\Úx[d3A“8Z\î2\ã[¶\Ç\'ª:÷µHö\Ì\Û[eF\Z	”yš\Ñl±¶Tˆ$\Æñ\ÏÎ’\ë§\Ö\"\Æu\0G¿¨ñ«­n\ãj\Z\'0\ÆFgz½mI€\no\Îdy\Ô-Á…{’0<±D ûÚ¼<1L»l\Èß¤þ\\©•/Z6˜A8\"9ôšý‹‹ø{ö›\í\ÜK “¤¤™6«\ß\áx{\í\Äþ\Õ\Ä7	*N¥€Ãœ\ÆI\çL\Ô\Z[€}\ä:Oð¤8ÿ\0\Ä=›]½l\Û½\ÙòaƒLVd0\È÷Ê‹¨\ßVG½`ÿ\0ˆPBy)ý\r÷†õ¨ó€õÚ¤%¶`€­VÐ›Ž:…úW\×^¸\Â\Ãö\0Ý‡‰2<\ëN\×l\ã\ÛheoY*y:K<_\n\êœ}‹bKe.¨ü,AhaûÀV \é¦\å³&A·QEÀÙºŽF¼ühŠÃ­Z¶H\Ê\ri=P\Ñuð3@Ÿ(4A­+ÌžT–8~övP–0»ê¹oµ<\ç¤S\"‘\Öy\Ñó®?‰aûª\'\×Q¯ˆ^Q™.D«¶VÕ·Nó’^\Èq\'q“Äšaw‹\n·o]¹’¡µD\r\ä€w\å\\I&\Ü~\ÏÃˆP$˜$œ\É$\í\Ì\×\Ä	\Ë\ßf?\Ýc†±\Â\Û:\Ò\Üf# ˜÷ûÂ‡iy\r\æ˜9yrO£Q“o@“™I\Ò\Ù3]¯\0f$}\Ã@\ÞdLU¦°šUô¶’\Ö\Úx%†9DðÁ‰¶M¦l;¨ˆ\Î<7\Í8\'p¯*\æ5êˆždNkµý\ÖPÀŸ8ñ¡i˜\ÊÁ*\'¬\n@FƒmLžbc5f\ÇƒC\ËKª3°#\ËÃ¥qcd£Ô¬\×d\Å\Ë,¿˜«¤\r\áMqEbÀ{\ÄSÙ¸¦Cb|FÕ¬uC ûmò«aúº›mþeÇ½-\ËlfUù¬MAñó¢|\Èaüi9©\Í	\ØZ»ƒ\èjZi”e8f\ÏI ~´xŽ/ƒ\à\Ð\nÅ’\Ï$\rD’GV8j^\Ó\â_~™³\r¤\Û ûz	ñ‰3p=“0\î \'K$}°\È\Z*\êLŸ<{Wx3\àF~\ïñ¥´÷XžÑ˜€£y5\ÂñIpJ\Ý\áo\Ó\ç SÑ³K?‰pk–\ÍY8¤n?‡X\á]\Ô\Õ²iÄº}:E¢AŽý«b=®\ZÁ\"\Ù2?È±ó¦fV»n\âÒ¸þ1+Hÿ\0•ZˆŽ¾@ÿ\0y€ùW\ÃøEm­ðˆUó¯ˆq\×6VUÁ\'Ð˜ñšP[¼AW I\æ&}–´Ùµ!UVfò\Ø~U­8›r¥‰\îžö#ñd³W-ß·{\\;{zþ±H0wüè±ºQ8cv\Ù:\Ôf\0\æ4È\ä+‹{Rt·g¸Ÿ1L§¨øŒÔ€\ÔFýMs\0*!Ç„\Ô\Ëv¶Z	ó?ÂŠ\\{cº9\àÒµ)RF7\å\Ök¿:˜)‘\ç\nºÚŒ\é$}˜“\Þ>]iUO{K‘¼t\É4x{­\ÖoÄžšL•püM½´^›\ÒrÊ¯X·ý®H|˜H©ñ§¶\ÝU \Òq\n?´^÷¸\Í\\\á\Ìn;\ÃåŸ•[\â<·¨¦}\Ö\Ïó©ci€\Æf(\ç†\å°úÅ®M°¼WÃ¾ \ÚRö2\Ç\Ùõ\Ðø8Kk|p¥­²%ôÈƒlÁ¢I;\âv«œ_u\rÄ¸V•\æW \êw>¦\Ûq\×g“j1þ\íóG¸#ô£º´>®\â•-°\Ï:\á˜Gi\Å|\ÕÇˆ¸‹ó¥¹Ù¶k 8œ0œüªk W¥Dg>U\Æ\â–\Ï–›N¶ •»\æ`ƒ\â\'p¢\Zø«³>z›ô¯†ðƒ§\rdÏº¬|\ëŒuþ\ÊÅ¶\á’+Ž\ãnœvþþŠ&=j\ß€@n\Ä?\Äò}«[\Ø`\éeX\Ý\È\ê:y\ne²nÙ¼…–;kj\Ó\"H\Þi\îp·0:\Ì ŸA(}[hD±yY\È##=g3]¯d;M+x}‘—\ïŒyRq=[½¥\Æ”AõÈŒ\Èð7]˜\Ég¹q˜ù>†B‚hKxÊ´–\Çh›\ê\æ\"˜ÜDG§•Û†¯õÖq&\0ÿ\0ÒŠ¤D³\rü\è\ÛKf\'\\ù\ZÔ i\ZT	\ÃÆn˜ÔŒr\é<š†“1\ã@\\U¥˜\n\á¬@“\ÄpWt°ô	\Ï1Vø\Åõ\\BöoŽü\â¯p\Èv¸VPù0\Ç\Ï\è ŽtÎ£\î\Ü\ï:3Í­™\Çù\Ð{|E‹ŠŸ\ï\rü©\â¶ø\à]‘b	\ë*`Ô½\Þ&\Ó|D\ß`	V\'»\ÞÜ…6Áõc&\ï\Âxv6x»Ag*Î€’³÷B•1\ÔW\Õ7\Ä\î=µ0™ŒrÁ h²Iñ©ñk b»\Î`z\Ð.\à…€0\ÎLZ\á¬*õOtjL`}ž‘´\×Áoñwm¨Rx¤FPy4(ƒ\àk\àllŽñr	\Èú\×ÁY5¤|J\Øl	À4G(YX2±\ÃN\Ç~\àš{´ð\å\è\'³u!”‘\æ±\ë\\IAö™8m#Ý T°\Ü]\â\Ð|­†5gˆp~\í£{\æ\Ì?*t\å\'B/²‰ùÕ¥n\Í\Î]>U\ÄmöRÜª *õ\ï†\\o«{‚nXÄ¹˜\ê9\×üE«A\n‹\à\ê\'HSb…¥f×¥­–rŒˆ0\"E¤Î•Y2øå•=M¨šC°>[{bŸ»°iA:Æ\'œ*Õ¤ˆ\é±\É\ÏJbX\å¢\'õ {§H\Ú\ç	 ú;Ò‚ )i™\Ä\än*Ò¬#s\àM\\bqþ\Â2ó®À)\ÈGQ§9\ëZBÆ˜CYÏµ^\Ôuj‚#ôü\êÓ®\Ë)-¾\Ä\ç4Q¶Òªx@5\ÄˆgpTsa“¸®­É`˜J\Å%®!„ö\Ü3@ûAD©Ÿ*³\Ä\rÅ›\Ý\Ö>L$P+Šµk~\Ô[,‡üCH ¶OÁ¡<\×\"ó À\Ò?\Åÿ\0Zý³Œ\r“z\â\ÚTf;‚\Ø\r»\ãP¹b\âþ\Íñ¾\n\â\ê\â%ã‘œ²:QMMr\í\Ä\Ø+’\Ø¦E%öTûP¹lˆ`N\ÕÄ­³\èÄ©õ \Õ\æf2\Å\î\äŸ\Zc\çz§ÿ\0\Úkÿ\0”ÿ\0\ZFÚ®=¦•T\r¤\0)¬ðóþ\Ú2\ß\Ýüöó \Üyÿ\0m\Ä«²<ó\ÍüyW|“»95§«\\h:°:…:¿*½|ôû\"­!\ä\Í-B‘˜\Ç\åDÀºw¦´\éœõ\Æ*ý•c\Û6¥?\á`EY½m˜¿bQ\Ô\r\ÈQ#o*f\êv«p‘•lŒó\Ç\çHTŽ\î¦Pc–\àšWr lO¹Û¥;i’¡n‰ho¿ŒÐ±»}uýDO<«…\Æ\n\\°œ\ÆEi\æÝµ]ùs\Ïñ«Ž\äeZ\áÏˆúU¾V@£¡À¤ŽwðŸz\Æw\ëúRlAŒ\Í)-+¤ýN\Ô\Ö\×J´¶p<ºQ‘\0´‰`w“4 \"ÃŸy\ÍZúµ™›\ì0L™#zµl.Z\Û4\çy÷¨¶¦w2<‘\ïJˆDk\Ø\Æ\ã\Â|üªÕ¾+ñÙ¶¶˜ú¨\0Ÿ9¤¼~®ý²6A\ØQ·f\ïp\ËKº`\à‰\å5al\Þÿ\0\éÖ˜Z#h™À\Ó>\Íc‹`x„\íEÕ¶g\"3‚z\×z\á\Éùš–YÊ”ÿ\0y?‡ð¥þ\Î+‹\áU²V\Û\àû\Z{ƒÿ\05¿:\àn…·ü+\à\ï\ç\Ã%|ùXþð²v\Ã\n\àÜŠÚÎ“„Wn#q\Ð^•f\Ù\',F£ó«Š:)\Ò>T\Ìx\ÍmÊ³G\Ëz\ç\Ög1Aƒ	¢»ÜŒmO•™Ûª\Ýt\ìö(Cy\ï\éVH\ëƒÿ\0-\È\ç%¥‹yÇ•7l0J‘1?Æ´	\Þ#\È\ïòÖ´¯{Q$\"ySLmDM±\ã\'\0\Ç\çF\Ó%fYD\çm«LI\ÌÑ¹¨J\êI\Ä\ä@‰l\Ï<r\çI¤	\Îþ})JFüýED™\î®Iòšuq#\Ê7ŸJ¹­\È&\è\\’18ŠF\"\n›£i;@\ßmüh5\éXž\ä\â9ŽŸ*6\ï$\å~ø·\ÏÊµ«0¤p<h*œvL2q°—\Ö\Ã\Î##aAZ\à\Õ\Ã\Ý$\Ü\Ð\Ó! f\Æ?¦´¬\âQ¿º\ÛÎü*´5§¿úŒš“[u©Ši&3Òš\"<\\\â¯N‹jXü¶§øw™b!®¸‰…\0ø˜¤±›jù$õ\'98ö\é]©üj>\Ä	 ;ˆNAð\æ&wjD“,>\Ç#\Ìþž4†\0@\Ädô8þ±F\Ùc\0du5I`còŠcm¹\Ôü\ÎôO|ž¦‰X\É¯!ýzP0I\0n±Ìš\0\05bs\Ëú\éR¦T\È\é\Ó?\ÔÒ¨l€\Æ9Dz:³¥J\Þ{M5¼€A0N3½C©\ßÐ¥w’I¾\ÇJ¢ô,¿\Úú° õ\0G^™×®)’î‘¼\É\ÌyU\Ý%´’VFsò¡nÚŒRq˜\Îý7¡iYdiî°ž’})o\Ûl:\ÝUu³M\Ã^#?±3(\'û°V=*\í¦V\ZmÞ³¬‘?ºG\åÊ¸¬$¢\å³<„\ß\Âk€¸Á)u²z}šø_\Ã\Ë\0aË³ÁýÐµñ_Š^	öxnl[-ý\ç$Ç¥H\'½\ëP£Bˆñ¢G,}ETy\àŠ\â8¡\Õ,±_óD\nµÂƒ‚\×/)+3H“½\\´\Üôð¤ã¨œûU·¶A*- \ÖFb¨\Þ9\ÅqOlž\èP-¨“\0\ZŸ\\?…ƒ]6\Æ…~gnKfum>\' 	¤¹ 3m\ÉÁƒÊ™ð±$sE¶fg\"Z\Êùó m\ê\ßYyˆó \ê[WfÙ˜1$Ì˜«Œf	F‰tþ½)\Üiûd\à&91ùS÷L1˜Ú¤h!Š˜ó4\æ{\Äü t\ÌPA\Ìƒ¾?/•Œ	ƒŸúÖ®\ì3»$LyQ¼ hÖ«\"G->~4³‘(‘Ï™#Ò¡s÷ô‘\Ìcž\æ„\Ê\ê\0wŽ6òñ5\ÞQ†fNŽ±@.¡¡†s\Úd~u \Ä\át¸\ç=GõÖ\Ç\Ó(\îŽg<þt‹¤\r\Öÿ\0QZ\á\ï»&gÀ\Æ\ßÊ‹¤è¹á·Ž*ó\ÈÇ•:iƒ\í98Qž¾q˜dºž\é1ˆö?Ñ¨\ïB®©:†\'\âvñ›W­\\K€8S3’Fc­Z¶\Ñ=­‘¡¼{«l\×l+\×5«\âB‘·­?9\ì\Õh‡†\îð¦T ¸«.ˆý•ƒzX\ÍpŠH2{rk„f’4\0\'ž\ÙÞ¸tŸ`\ØùÕ°\Ø\î¯=U\Åñ6H\Ïb«lŸyš½{J/Ä±`OH&6\ê+‚±mTª›V@s\ç¬G½5´ …\Ñ\'ž\ÅyzQ¸`@¨9\ë]¡¹\Zmµ\Ì~R•XB\n‰Ð§H\é mLWPb;BHa´dŒU\ÛWB\åjr\Ï/*´A\Ót‰<Œ¼úûU¾P\Í\Ð\Ú\Ï301ÓžyFx’ŸwK#\Ì\Ç\åR\ä9“\á\0cÊ+\é\Õ\Ý‘™4Š¢\á\0\æiUF¨\n\">\×ð¢f\à|Dš3\Ú<þ\Ì\ïC¹p…ð\Åw˜Á$OJ\rhBF$	ý(,\Ý\nt\âEY‚“\áGIB\Ärœ	ù\Ñ\Z–;O\çšÐªV\â$É¨b$ð(5D\ç`\r\ZKg90?SF\ZA\Î\àAH# ÿ\0]\ë¼F—\è\ÂH\Ûjg´mƒ\Zˆ#}ˆÈ¤	nâª€6™Ï¥@0 [\Ò÷‰‘¤F\ä~@P\ëm‰\Ò&f$tô ñpI209\ïA‚I\åA?2hž\æ¬c3ü«^—#\ÄÔ±H™ò¥\Òn#H\È\nO\è(´jÎ¢>\È\Æ\ÕqÂ–`\Éƒ•«L\ÈJ‰Sšf¹¨eŒ\Æ_:­\åAˆŒE9Y;±\é5#X\Ì`QV€*H\Æ:T\\R\Ð\Ð$W\ÚY?×¥mI9¨\Õe‰Œ)\å\ëRJ\'œù\Ñ×¨® \Ä\Æ1Z\Ê÷Aa& sõ4\ÊÁ8Š €<«ÿ\Ù');
/*!40000 ALTER TABLE `pruebafoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuesto`
--

DROP TABLE IF EXISTS `repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repuesto` (
  `idRepuesto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(160) NOT NULL,
  `Serial` varchar(45) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idRepuesto`),
  UNIQUE KEY `idRepuesto_UNIQUE` (`idRepuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuesto`
--

LOCK TABLES `repuesto` WRITE;
/*!40000 ALTER TABLE `repuesto` DISABLE KEYS */;
INSERT INTO `repuesto` VALUES (1,'BujÃ­a ','K12023NASLDASF923N',10,'Camioneta');
/*!40000 ALTER TABLE `repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `ContraseÃ±a` varchar(100) NOT NULL,
  `Rol` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'Bob','El Constructor','bobconstruye@gmail.com','$2a$10$QJGuD10cPlhu1/BE69h69.WQ.Rt1fxpv/6XuR7IGNLczqwIkAIYr.',1),(3,'Ousmane','DembelÃ©','dembele11@gmail.com','$2a$10$Jvd6OzMezB4DM2aBxW.DUeT9K2BRW0EKSp.7gi9NuNkpMmhccw8LK',1),(4,'Rafael','Matienzo','mainframe@ibm.com','$2a$10$K5G.QchVlBLBsEE5s3cRceMxUAkbC5mYx8F69y.Dhep0Xpg2/t6IW',1),(7,'Lewis','Hamilton','lhamilton@yahoo.com','$2a$10$rdvLIgrhxnJKGZWCr5ll7ufS4HYNzumuqSvqvrsynXiEg56w056yK',1),(11,'Luis','SuÃ¡rez','lsuarez9@gmail.com','$2a$10$ZAkDpycKptHBsBpJJstYp.vAvZVy01HeXqHPZnoBDEPv0DLa8atWO',1),(12,'Phillipe','Coutinho','pcoutinho@gmail.com','$2a$10$XOwkR9lZ9Nbtpn5rOb7L6eXN/hWjRM/QS96vSmFkc1gBCK8ZcpTEK',4),(13,'ToÃ±o','El Amable','tamable@gmail.com','$2a$10$dZANy3BVR96HLDw03vFFwuLIXGDuZTrOuTm8qwSUHiLZuSDWVPvDy',2),(14,'Soyun','Cliente','cliente@gmail.com','$2a$10$hylGYzPP2m73ygvWXmImYuLStLxPZS/RgKOvE3qfMZsVZ/KPtWVuW',1),(16,'YoSoy','MecÃ¡nico','mecanico@gmail.com','$2a$10$YwjcQh6S7B3FU/zgWMYaL.g64aax.GcKD6as4DMJqeajsbudafwhK',2),(22,'SeÃ±or','Gerente','gerente@gmail.com','$2a$10$nD0a66MmNjum0L1RBCqDyumVWH85Aa9/UR/Bpb7AgO1Q1eUYgNt1m',3),(23,'Kevin','Salamanca','kevinsalamanca26@gmail.com','$2a$10$ohlDU/2nKOMWUXH8LKtKL.BdxQ6tToyq.kXDPF4Eih/qSVmS2MjvC',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tiene_privilegios`
--

DROP TABLE IF EXISTS `usuario_tiene_privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_tiene_privilegios` (
  `idPrivilegio` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idPrivilegio`,`idUsuario`),
  KEY `fk_privilegios_has_usuario_usuario1_idx` (`idUsuario`),
  KEY `fk_privilegios_has_usuario_privilegios1_idx` (`idPrivilegio`),
  CONSTRAINT `a` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegios` (`idPrivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `b` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tiene_privilegios`
--

LOCK TABLES `usuario_tiene_privilegios` WRITE;
/*!40000 ALTER TABLE `usuario_tiene_privilegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_tiene_privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `Serial` varchar(60) NOT NULL,
  `fechaRegistro` date NOT NULL,
  `Placa` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Year` int(11) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  UNIQUE KEY `vehiculo_UNIQUE` (`idVehiculo`),
  UNIQUE KEY `Placa_UNIQUE` (`Placa`),
  KEY `usuario_tiene_vehiculo_idx` (`idUsuario`),
  CONSTRAINT `usuario_tiene_vehiculo` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (5,'EMNKR420R5U0273','2018-02-22','L4A-O32','Lamborghini Aventador LP700-4',2012,'Desactivado',14),(6,'EMN6300R5U0273','2018-03-09','J21-KL2','Tesla Model 3',2018,'Activo',12),(7,'ETK945WISM41WR','2018-03-10','NN4-IL1','Toyota Corolla',2006,'Activo',14),(9,'EMNKR420R5U0273','2018-03-11','MAP-90Q','Mazda 7',2009,'Activo',16),(10,'EMN6300R5U0IR21','2018-03-29','H25-MP4','Mazda 7',2010,'Activo',23);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo_tiene_repuesto`
--

DROP TABLE IF EXISTS `vehiculo_tiene_repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo_tiene_repuesto` (
  `idVehiculo` int(11) NOT NULL,
  `idRepuesto` int(11) NOT NULL,
  KEY `vehiculo_idx` (`idVehiculo`),
  KEY `repuesto_idx` (`idRepuesto`),
  CONSTRAINT `repuesto` FOREIGN KEY (`idRepuesto`) REFERENCES `repuesto` (`idRepuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo_tiene_repuesto`
--

LOCK TABLES `vehiculo_tiene_repuesto` WRITE;
/*!40000 ALTER TABLE `vehiculo_tiene_repuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo_tiene_repuesto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-29 18:47:33
