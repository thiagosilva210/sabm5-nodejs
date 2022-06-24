CREATE DATABASE  IF NOT EXISTS `SABM5` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `SABM5`;
-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: SABM5
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `descricao` mediumtext,
  `fontes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES (8,'abacate','/images/abacate.jpg','frutas','Contribui para uma pele hidratada,  ajuda na formação de massa muscular, aumenta a hidratação e o brilho do cabelo e a regular o açúcar no sangue e aumenta a saciedade. Melhora o funcionamento do cérebro e a capacidade da memória. Previne contra doenças cardiovasculares. Muito calórica e possui muitas vitaminas como A, C, E, B1, B2, B3 e B6, além de possuir minerais como ferro magnésio e cálcio.','https://www.tuasaude.com/beneficios-do-abacate/'),(10,'melancia','/images/melancia.jpeg','frutas','Um fruto muito nutritivo, baixa calorias, rica em antioxidantes, atuam na prevenção de uma série de problemas de saúde como câncer, inflamações, doenças cardiovasculares entre outras. Estudos mostram que a melancia pode ajudar a proteger os rins e também melhorar alguns problemas relacionados ao sistema urinário. Aumenta a saciedade, ajudando desta forma a perder peso. Possui vitamina A e C, além de outros minerais fósforo, potássio e zinco.','https://www.mundoboaforma.com.br/beneficios-da-melancia/'),(14,'uva','/images/uvafruta.jpg','frutas','Boa para prevenir contra o câncer, útil para prevenção contra o câncer, melhora o intestino, principalmente, quando consumidas com cascas. Previne contra a anemia.  Além de melhorar a circulação e manter a saúde dos ossos. Possuem vitaminas B1, B2, B3, B6 ,C, A e B9, tendo também outros minerais como cálcio, ferro e potássio.','https://www.tuasaude.com/beneficios-da-uva/'),(15,'pera','/images/pera.jpg','frutas','Ajuda na saciedade, promove o controle dos níveis de glicose no sangue e evitando, assim, a resistência à insulina e a diabetes. É bom contra a prisão de ventre, fortalece o sistema imunológico, previne contra doenças cardiovasculares e contra a pressão alta. Possui vitamina C e outros minerais como potássio, cálcio e fósforo. ','https://www.tuasaude.com/beneficios-da-pera/'),(16,'Refrigerante','/images/guaranarefr.jpg','não recomendado','Há inúmeros malefícios com esta bebida, possui uma quantidade de açúcar acima do \r\n        recomendado por nutricionistas, costuma possuir acima de 10 colheres por lata.\r\n\r\n        Favorece o ganho de peso de uma forma não saudável, além de alguns corantes que existem dentro dele sejam\r\n        considerados potencialmente cancerígenos. \r\n\r\n        Compromete a nossa absorção de cálcio, por possuir um elevado teor de ácido fosfórico, este\r\n        limita a ação do nutriente que ajuda a fortalecer os ossos e os dentes.\r\n\r\n        Além de contribuir com a elevação da pressão arterial.\r\n','Ministério da Saúde, Instituto Nacional de Câncer (INCA) e British Medical Journal'),(17,'margarina','/images/margarina.jpg','não recomendado','A margarina é composta principalmente de uma base de óleo vegetal.\nOs óleos vegetais são predominantemente compostos por gorduras poli-insaturadas \nEsses tipos de gorduras são facilmente oxidadas \n (através do calor e da luz) e têm sido \n mostrados para causar\n Muitos problemas de saúde quando ingeridos.\n\n        \n\n\nSe você estiver usando margarina para cozinhar,\n fritar ou simplesmente aquecê-lo em geral,\n  você está aumentando a probabilidade de oxidar estes\n   ácidos graxos extremamente sensíveis. \n   No entanto, mesmo que você não esteja \n   aquecendo margarina, devido ao tratamento \nde aquecimento \nna fabricação processo, o dano já pode ser feito.\n\n\n        \n\n\n    os produtos de margarina são extremamente ricos \n    em gorduras prejudiciais, como gorduras poli-insaturadas\n    e gorduras trans. Gorduras trans são ácidos graxos \n    feitos pelo homem que são formados durante o processo\n    de hidrogenação.Hidrogenação torna  óleos vegetais\n    líquidos em gorduras sólidas. Essas gorduras\n    recém-formadas são altamente tóxicas e seu consumo está ligado \n    a problemas cardiovasculares\n','https://www.alexfergus.com/blog/11-reasons-to-avoid-margarine'),(18,'biscoitos e bolachas','/images/biscoito.jpg','não recomendado','\n    Há estudos relacionando certas substâncias ,que existem nos biscoitos, como tóxicas.\n    Substâncias estas, incluídas na lista de agentes cancerígenos pela \n    Agência Internacional para Pesquisa em Câncer (IARC)\n\na gordura hidrogenada, também presente nesse tipo de alimento, nada mais\n é que um processo de mudança na estrutura da gordura vegetal,\n e acaba sendo nociva ao corpo humano.\n Pois, além de aumentar triglicérides e colesterol total, \naumenta a inflamação no organismo acumulando toxinas em células de gordura visceral\n (uma das piores gorduras que temos, pois prejudica o funcionamento dos órgãos).\n\nApesar da “massa” ser digerida e eliminada, a inflamação causada por todos esses compostos artificiais \npode permanecer por anos e prejudicar a nossa saúde.','https://nutrisecrets.com.br/biscoito-ou-bolacha-nao-importa-eles-fazem-mal-para-o-organismo/'),(19,'macarrão instântaneo miojo','/images/miojo.jpg','não recomendado','Uma recente análise realizada pela Associação Brasileira de Defesa do Consumidor (Pro Teste) concluiu que a maioria das marcas utilizam mais sódio, nos temperos prontos, do que o recomendado para um dia inteiro. Vale lembrar que, de acordo com a Organização Mundial de Saúde (OMS), o consumo diário de sal não deve ultrapassar 4 gramas (equivalente a 1 colher de chá cheia) e o de sódio, 2 gramas. Além do excesso de substâncias nocivas à nossa saúde, o macarrão instantâneo possui quantidades generosas de gordura. Vale lembrar que o consumo de alimentos ricos em gordura e sódio contribui, e muito, para o aparecimento de doenças cardiovasculares.','https://www.unimedfortaleza.com.br/blog/alimentacao/conheca-os-maleficios-macarrao-instantaneo'),(21,'espinafre','/images/Espinafre.jpg','legumes','Excelente para aumentar a eficiência dos músculos , possui vitamina A, E, B6 e C entre diversas outras propriedades benéficas para o corpo.\r\nÉ rico em antioxidante, que ajudam a combater o envelhecimento precoce da pele, mantendo-a com aparência mais jovem e tonificada por mais tempo\r\n','https://www.mundoboaforma.com.br/beneficios-do-espinafre/'),(22,'cenoura','/images/cenoura.jpg','legumes','A cenoura é boa para uma melhor digestão,ajuda a prevenir o câncer e rica em antioxidantes. Possui vitamina A, B1 e C além de ter outras propriedades como o ferro, fósforo e potássio. Além disso, ajuda a aumentar a saciedade e possui baixas calorias.','https://www.tuasaude.com/beneficios-da-cenoura/'),(23,'frango','/images/frango.jpg','rico em proteínas','O frango tem diversos benfícios dentre os quais, melhora o sistema imunológico, equilibrando dos hormonios de cortisol, ajudando a saúde do coração e colabora na perda de peso pela sua saciedade.\r\nTem diversas vitaminas como  A, B12, C, D, E, e K, além de outros minerais como ferro e zinco.\r\nNutricionistas recomendam ,pois seu consumo melhora o seu bem estar.','https://www.naturalfoodseries.com/11-health-benefits-chicken/'),(24,'leite','/images/leite.jpg','rico em proteínas','Uma bebida que os seres humanos já consomem há milhares de anos, considerado um luxo no passado.Possui altas quantidades de vitamina B12, e uma excelente fonte de cálcio, além de possuir bastante proteína. Ajuda na saciedade e te dá mais energia. Uma fonte de gorduras boas e ajuda a manter o corpo hidratado.','https://www.naturalfoodseries.com/11-benefits-milk/'),(25,'berinjela','/images/berinjela.jpg','legumes','Ajuda a reduzir os níveis de colesterol ruim e os triglicerídeos, melhora a circulação sanguínea, poucas calorias, rica em fibras e ajuda a manter a saciedade. Possui as vitaminas A e C, além de outras propriedades potássio, fósforo, cálcio e magnésio. Também é boa para uma capcidade de memória melhor','https://www.tuasaude.com/berinjela/'),(26,'Queijo','/images/queijo.jpg','rico em proteínas','Ajuda os ossos, bom para a saúde do coração e uma grande fonte de proteína. Ajuda na saúde dos dentes e até a reduzir stress. É consumido pelos seres humanos por milhares de anos. Há vários tipos de queijo e a sua composição depende muito disso. O mozzarella, por exemplo, possui vitamina A e minerais como potássio e cálcio. Rico em zinco e por isso está associado com um fortalecimento do sistema imunológico.\r\n','https://www.naturalfoodseries.com/13-health-benefits-cheese/');
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('LSjYd91GM85pQT0fr_O-NktG9HQwaPYv',1654551463,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-06-06T21:37:42.224Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":1}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(155) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `isAdmin` tinyint(4) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'am@mail.com','','',0,'123'),(2,'am1@mail.com','f5cf8363ef8d380760713d9dd500c20575c22ae9eb7cb082954b2d9ed175ee94ae93663aa1107cfd75fc47fbc432107b3a799cfad559cb2093c3f328','8ce5ea52d2ef35813bc1942c4eac9c1457d0e76df2ab7f3a041765c3b6595a10',0,''),(3,'am3@mail.com','a106e9bc5db478291aa1d8bd818327db1c3b445bbb2e9596fc08eeac7ca20e358b1197a50989716c48a07d72abde6618cf2c761e4d8b2cb5a5067220','2ae10724064ab7a40c3ba9277a81a629d80e5d6d66cf5e2dfa5d0db025691aa2',0,'');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06 20:00:05
