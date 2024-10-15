/*  ********************************
	Project Phase II
    
    Team 2: Andy Comfort, Caroline El Jazmi, and Evan Chard
    
    This SQL Script was tested on MySQL Workbench. To run, create a sleep health schema, load the file, and execute it.
	********************************
*/

-- ********************************
-- Part A
-- ********************************
-- Researcher Table: Store data about the researchers who recorded data
CREATE TABLE `RESEARCHER` (
  `Researcher_ID` int NOT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `Dept_Location` varchar(45) NOT NULL,
  PRIMARY KEY (`Researcher_ID`)
);

-- Person Table: Store general data about the person
CREATE TABLE `PERSON` (
  `Person_ID` int NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Age` int DEFAULT NULL,
  `Occupation` varchar(100) DEFAULT NULL,
  `Res_ID` int NOT NULL,
  PRIMARY KEY (`Person_ID`),
  KEY `person_ResID_fk_idx` (`Res_ID`),
  CONSTRAINT `person_ResID_fk` FOREIGN KEY (`Res_ID`) REFERENCES `RESEARCHER` (`Researcher_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `person_chk_1` CHECK ((`Age` > 0))
);

-- Health Table: Store basic health data related to the person
CREATE TABLE `HEALTH` (
  `Person_ID` int NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `BMI` varchar(25) DEFAULT NULL,
  `Heart_Rate` int DEFAULT NULL,
  `Systolic_BP` int DEFAULT NULL,
  `Diastolic_BP` int DEFAULT NULL,
  `Blood_Pressure` varchar(20) DEFAULT NULL,
  KEY `health_personID_fk_idx` (`Person_ID`),
  CONSTRAINT `health_personID_fk` FOREIGN KEY (`Person_ID`) REFERENCES `PERSON` (`Person_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `health_chk_1` CHECK ((`Heart_Rate` > 0))
);

-- Lifestyle Table: Store data about the person's lifestyle habits
CREATE TABLE `LIFESTYLE` (
  `Person_ID` int NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Stress_Level` int DEFAULT NULL,
  `Daily_Steps` int DEFAULT NULL,
  `Physical_Activity` int DEFAULT NULL,
  KEY `lifestyle_persID_fk` (`Person_ID`),
  CONSTRAINT `lifestyle_persID_fk` FOREIGN KEY (`Person_ID`) REFERENCES `PERSON` (`Person_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lifestyle_chk_1` CHECK (((`Stress_Level` >= 0) or (`Stress_Level` <= 10))),
  CONSTRAINT `lifestyle_chk_2` CHECK ((`Daily_Steps` >= 0)),
  CONSTRAINT `lifestyle_chk_3` CHECK (((`Physical_Activity` >= 0) or (`Physical_Activity` <= 1440)))
);

-- Sleep Table: Store data about the person's sleep habits
CREATE TABLE `SLEEP` (
  `Person_ID` int NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Sleep_Disorder` varchar(20) DEFAULT NULL,
  `Sleep_Duration` decimal(10,0) DEFAULT NULL,
  `Sleep_Quality` int DEFAULT NULL,
  KEY `sleep_personID_fk` (`Person_ID`),
  CONSTRAINT `sleep_personID_fk` FOREIGN KEY (`Person_ID`) REFERENCES `PERSON` (`Person_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sleep_chk_1` CHECK ((`Sleep_Duration` <= 24))
);

-- ********************************
-- Part B
-- ******************************** 

-- Data for researcher table
-- Summary: Store the researcher's ID, first and last name, and work location
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (750,'John','Montgomery','Seattle');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (751,'Emily','Caldwell','Seattle');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (752,'Michael','Delgado','Seattle');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (753,'Sarah','Sinclair','Dallas');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (754,'David','Donovan','Dallas');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (755,'Jennifer','Hamilton','Dallas');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (756,'Robert','Middleton','Miami');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (757,'Jessica','Chambers','Miami');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (758,'William','Blackwood','Miami');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (759,'Amy','MacKenzie','Boston');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (760,'Ezekiel','Brown','Boston');
INSERT INTO `researcher` (`Researcher_ID`,`First_Name`,`Last_Name`,`Dept_Location`) VALUES (761,'Xavier','Davis','Boston');

-- Data for person table
-- Summary: Store data about the person's ID, gender, age, occupation, and the ID of the researcher who recorded their data
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (1,'Male',40,'Software Engineer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (2,'Female',24,'Doctor',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (3,'Female',61,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (4,'Female',67,'Sales Representative',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (5,'Female',26,'Sales Representative',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (6,'Female',55,'Software Engineer',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (7,'Female',45,'Teacher',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (8,'Male',73,'Doctor',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (9,'Female',70,'Doctor',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (10,'Male',70,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (11,'Male',64,'Doctor',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (12,'Female',49,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (13,'Male',45,'Doctor',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (14,'Male',31,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (15,'Female',75,'Doctor',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (16,'Male',37,'Doctor',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (17,'Male',37,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (18,'Male',42,'Doctor',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (19,'Female',37,'Nurse',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (20,'Female',68,'Doctor',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (21,'Male',55,'Doctor',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (22,'Female',64,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (23,'Male',51,'Doctor',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (24,'Male',58,'Doctor',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (25,'Male',62,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (26,'Female',70,'Doctor',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (27,'Female',21,'Doctor',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (28,'Female',46,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (29,'Female',76,'Doctor',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (30,'Female',81,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (31,'Male',23,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (32,'Female',49,'Nurse',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (33,'Male',74,'Nurse',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (34,'Female',28,'Doctor',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (35,'Male',41,'Doctor',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (36,'Female',54,'Doctor',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (37,'Female',55,'Doctor',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (38,'Male',21,'Doctor',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (39,'Male',75,'Doctor',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (40,'Male',47,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (41,'Female',58,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (42,'Male',28,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (43,'Male',45,'Doctor',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (44,'Male',45,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (45,'Male',51,'Doctor',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (46,'Female',66,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (47,'Female',50,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (48,'Female',39,'Doctor',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (49,'Female',68,'Doctor',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (50,'Male',66,'Doctor',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (51,'Female',79,'Engineer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (52,'Male',20,'Engineer',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (53,'Female',68,'Doctor',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (54,'Male',79,'Doctor',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (55,'Female',55,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (56,'Male',35,'Doctor',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (57,'Male',76,'Doctor',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (58,'Female',54,'Doctor',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (59,'Female',29,'Doctor',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (60,'Female',60,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (61,'Female',44,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (62,'Female',49,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (63,'Female',78,'Doctor',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (64,'Female',70,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (65,'Female',57,'Doctor',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (66,'Female',44,'Doctor',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (67,'Male',54,'Accountant',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (68,'Female',74,'Doctor',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (69,'Male',58,'Scientist',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (70,'Female',65,'Scientist',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (71,'Male',20,'Doctor',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (72,'Male',68,'Doctor',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (73,'Male',80,'Doctor',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (74,'Male',44,'Doctor',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (75,'Male',22,'Doctor',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (76,'Male',48,'Doctor',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (77,'Male',82,'Doctor',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (78,'Male',22,'Doctor',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (79,'Male',60,'Doctor',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (80,'Male',53,'Doctor',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (81,'Male',33,'Scientist',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (82,'Male',56,'Scientist',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (83,'Female',63,'Teacher',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (84,'Male',60,'Teacher',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (85,'Female',46,'Software Engineer',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (86,'Male',59,'Accountant',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (87,'Male',78,'Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (88,'Female',68,'Engineer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (89,'Female',79,'Engineer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (90,'Female',72,'Engineer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (91,'Female',28,'Engineer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (92,'Female',20,'Engineer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (93,'Female',42,'Software Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (94,'Male',77,'Lawyer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (95,'Female',83,'Accountant',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (96,'Female',76,'Accountant',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (97,'Female',32,'Accountant',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (98,'Female',35,'Accountant',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (99,'Female',30,'Teacher',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (100,'Female',27,'Teacher',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (101,'Male',53,'Teacher',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (102,'Male',22,'Teacher',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (103,'Female',52,'Teacher',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (104,'Male',39,'Teacher',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (105,'Female',83,'Teacher',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (106,'Male',26,'Teacher',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (107,'Female',43,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (108,'Female',23,'Engineer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (109,'Male',52,'Engineer',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (110,'Male',66,'Lawyer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (111,'Female',48,'Accountant',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (112,'Male',25,'Lawyer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (113,'Male',82,'Accountant',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (114,'Female',31,'Lawyer',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (115,'Male',51,'Accountant',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (116,'Female',33,'Accountant',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (117,'Female',37,'Accountant',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (118,'Female',22,'Accountant',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (119,'Male',51,'Accountant',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (120,'Male',24,'Accountant',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (121,'Male',22,'Accountant',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (122,'Male',82,'Accountant',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (123,'Male',81,'Accountant',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (124,'Female',45,'Accountant',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (125,'Female',65,'Accountant',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (126,'Female',62,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (127,'Male',36,'Lawyer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (128,'Female',73,'Accountant',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (129,'Female',32,'Lawyer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (130,'Female',74,'Lawyer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (131,'Female',80,'Accountant',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (132,'Male',60,'Lawyer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (133,'Male',26,'Lawyer',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (134,'Male',61,'Accountant',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (135,'Female',72,'Lawyer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (136,'Male',56,'Lawyer',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (137,'Male',63,'Accountant',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (138,'Male',36,'Lawyer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (139,'Female',32,'Accountant',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (140,'Female',81,'Lawyer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (141,'Male',38,'Accountant',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (142,'Male',47,'Lawyer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (143,'Male',77,'Accountant',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (144,'Female',27,'Accountant',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (145,'Female',33,'Lawyer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (146,'Male',51,'Lawyer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (147,'Female',68,'Lawyer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (148,'Female',49,'Engineer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (149,'Male',31,'Lawyer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (150,'Male',35,'Accountant',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (151,'Male',75,'Accountant',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (152,'Female',28,'Lawyer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (153,'Female',26,'Lawyer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (154,'Female',27,'Lawyer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (155,'Female',57,'Lawyer',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (156,'Female',77,'Lawyer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (157,'Male',82,'Lawyer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (158,'Female',69,'Lawyer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (159,'Female',81,'Lawyer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (160,'Female',51,'Lawyer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (161,'Male',27,'Lawyer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (162,'Male',35,'Accountant',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (163,'Male',47,'Accountant',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (164,'Female',36,'Lawyer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (165,'Male',45,'Lawyer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (166,'Female',50,'Lawyer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (167,'Female',58,'Engineer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (168,'Male',68,'Lawyer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (169,'Male',62,'Lawyer',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (170,'Female',46,'Lawyer',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (171,'Male',71,'Lawyer',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (172,'Female',35,'Lawyer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (173,'Female',67,'Lawyer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (174,'Male',57,'Lawyer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (175,'Female',78,'Lawyer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (176,'Male',79,'Lawyer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (177,'Female',71,'Lawyer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (178,'Female',67,'Salesperson',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (179,'Female',63,'Lawyer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (180,'Female',33,'Lawyer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (181,'Female',69,'Lawyer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (182,'Male',55,'Lawyer',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (183,'Male',36,'Lawyer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (184,'Male',37,'Lawyer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (185,'Male',59,'Teacher',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (186,'Male',22,'Teacher',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (187,'Female',50,'Teacher',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (188,'Male',68,'Salesperson',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (189,'Male',75,'Teacher',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (190,'Female',42,'Salesperson',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (191,'Male',80,'Teacher',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (192,'Male',70,'Salesperson',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (193,'Male',84,'Salesperson',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (194,'Male',35,'Salesperson',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (195,'Male',25,'Salesperson',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (196,'Male',22,'Salesperson',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (197,'Female',48,'Salesperson',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (198,'Female',70,'Salesperson',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (199,'Female',57,'Salesperson',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (200,'Male',26,'Salesperson',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (201,'Female',78,'Salesperson',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (202,'Male',27,'Engineer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (203,'Male',70,'Engineer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (204,'Male',36,'Engineer',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (205,'Female',64,'Engineer',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (206,'Male',27,'Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (207,'Female',62,'Engineer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (208,'Male',81,'Engineer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (209,'Female',75,'Engineer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (210,'Male',74,'Engineer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (211,'Female',40,'Engineer',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (212,'Female',75,'Engineer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (213,'Female',36,'Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (214,'Female',28,'Engineer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (215,'Male',65,'Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (216,'Male',36,'Engineer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (217,'Male',73,'Engineer',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (218,'Female',69,'Engineer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (219,'Male',73,'Engineer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (220,'Male',34,'Salesperson',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (221,'Female',50,'Teacher',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (222,'Female',20,'Salesperson',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (223,'Male',55,'Salesperson',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (224,'Female',32,'Salesperson',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (225,'Male',67,'Teacher',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (226,'Female',27,'Salesperson',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (227,'Male',22,'Teacher',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (228,'Male',62,'Salesperson',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (229,'Female',80,'Teacher',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (230,'Male',35,'Salesperson',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (231,'Male',76,'Teacher',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (232,'Male',22,'Salesperson',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (233,'Female',26,'Teacher',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (234,'Female',79,'Salesperson',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (235,'Female',75,'Teacher',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (236,'Female',73,'Salesperson',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (237,'Male',29,'Salesperson',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (238,'Female',27,'Teacher',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (239,'Female',58,'Salesperson',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (240,'Male',35,'Salesperson',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (241,'Male',44,'Teacher',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (242,'Female',72,'Salesperson',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (243,'Male',35,'Salesperson',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (244,'Male',66,'Teacher',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (245,'Male',31,'Salesperson',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (246,'Female',81,'Teacher',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (247,'Female',62,'Salesperson',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (248,'Male',27,'Engineer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (249,'Female',73,'Salesperson',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (250,'Male',41,'Salesperson',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (251,'Female',37,'Teacher',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (252,'Female',42,'Teacher',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (253,'Female',70,'Teacher',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (254,'Male',71,'Teacher',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (255,'Male',65,'Teacher',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (256,'Female',47,'Teacher',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (257,'Female',49,'Teacher',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (258,'Male',82,'Teacher',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (259,'Female',22,'Teacher',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (260,'Male',45,'Teacher',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (261,'Female',23,'Teacher',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (262,'Male',37,'Teacher',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (263,'Female',66,'Teacher',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (264,'Female',52,'Manager',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (265,'Male',51,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (266,'Male',35,'Nurse',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (267,'Female',71,'Doctor',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (268,'Male',61,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (269,'Female',46,'Nurse',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (270,'Female',53,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (271,'Male',73,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (272,'Female',64,'Nurse',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (273,'Male',45,'Nurse',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (274,'Female',62,'Nurse',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (275,'Male',80,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (276,'Female',33,'Nurse',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (277,'Male',75,'Doctor',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (278,'Female',38,'Doctor',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (279,'Female',79,'Nurse',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (280,'Female',22,'Engineer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (281,'Female',50,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (282,'Male',66,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (283,'Female',66,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (284,'Male',37,'Nurse',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (285,'Female',69,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (286,'Male',76,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (287,'Male',67,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (288,'Female',81,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (289,'Female',39,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (290,'Female',55,'Nurse',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (291,'Female',84,'Nurse',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (292,'Female',54,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (293,'Male',74,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (294,'Male',75,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (295,'Female',84,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (296,'Male',47,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (297,'Female',64,'Nurse',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (298,'Male',20,'Nurse',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (299,'Male',67,'Engineer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (300,'Female',55,'Engineer',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (301,'Male',64,'Engineer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (302,'Male',77,'Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (303,'Female',20,'Nurse',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (304,'Female',71,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (305,'Female',33,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (306,'Female',82,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (307,'Female',44,'Accountant',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (308,'Female',61,'Accountant',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (309,'Female',59,'Accountant',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (310,'Male',65,'Accountant',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (311,'Male',83,'Accountant',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (312,'Male',44,'Accountant',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (313,'Female',66,'Engineer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (314,'Female',28,'Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (315,'Male',82,'Engineer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (316,'Male',56,'Engineer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (317,'Male',59,'Engineer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (318,'Male',29,'Engineer',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (319,'Female',54,'Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (320,'Female',78,'Engineer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (321,'Male',84,'Engineer',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (322,'Male',59,'Engineer',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (323,'Female',35,'Engineer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (324,'Female',37,'Engineer',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (325,'Male',60,'Engineer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (326,'Male',82,'Engineer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (327,'Female',44,'Engineer',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (328,'Male',55,'Engineer',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (329,'Female',21,'Engineer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (330,'Male',32,'Engineer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (331,'Female',51,'Engineer',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (332,'Male',47,'Engineer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (333,'Female',72,'Engineer',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (334,'Male',32,'Engineer',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (335,'Male',55,'Engineer',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (336,'Male',45,'Engineer',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (337,'Female',58,'Engineer',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (338,'Female',57,'Engineer',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (339,'Male',47,'Engineer',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (340,'Male',36,'Nurse',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (341,'Male',26,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (342,'Male',35,'Doctor',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (343,'Male',55,'Doctor',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (344,'Female',52,'Nurse',751);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (345,'Male',79,'Nurse',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (346,'Male',49,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (347,'Male',75,'Nurse',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (348,'Male',33,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (349,'Female',36,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (350,'Male',24,'Nurse',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (351,'Female',57,'Nurse',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (352,'Female',50,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (353,'Female',22,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (354,'Female',76,'Nurse',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (355,'Female',82,'Nurse',752);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (356,'Male',54,'Nurse',757);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (357,'Male',39,'Nurse',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (358,'Female',62,'Nurse',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (359,'Male',75,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (360,'Female',71,'Nurse',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (361,'Female',32,'Nurse',758);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (362,'Male',23,'Nurse',761);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (363,'Male',76,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (364,'Female',69,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (365,'Male',50,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (366,'Male',42,'Nurse',753);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (367,'Male',46,'Nurse',755);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (368,'Male',49,'Nurse',760);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (369,'Female',21,'Nurse',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (370,'Female',66,'Nurse',754);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (371,'Male',73,'Nurse',759);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (372,'Female',31,'Nurse',756);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (373,'Male',22,'Nurse',750);
INSERT INTO `person` (`Person_ID`,`Gender`,`Age`,`Occupation`,`Res_ID`) VALUES (374,'Female',42,'Nurse',751);

-- Data for health table
-- Summary: Store data about the person's ID, gender, BMI, heart rate, systolic blood pressure, diastolic blood pressure, and blood pressure category
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (1,'Male','Overweight',77,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (2,'Female','Normal',75,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (3,'Female','Normal',75,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (4,'Female','Obese',85,152,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (5,'Female','Obese',85,152,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (6,'Female','Obese',85,126,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (7,'Female','Obese',70,126,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (8,'Male','Normal',70,124,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (9,'Female','Normal',70,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (10,'Male','Normal',70,124,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (11,'Male','Normal',70,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (12,'Female','Normal',70,128,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (13,'Male','Normal',70,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (14,'Male','Normal',70,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (15,'Female','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (16,'Male','Normal',70,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (17,'Male','Normal',80,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (18,'Male','Normal',70,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (19,'Female','Normal',80,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (20,'Female','Normal',70,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (21,'Male','Normal',70,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (22,'Female','Normal',70,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (23,'Male','Normal',70,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (24,'Male','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (25,'Male','Normal',70,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (26,'Female','Normal',70,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (27,'Female','Normal',70,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (28,'Female','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (29,'Female','Normal',70,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (30,'Female','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (31,'Male','Normal',78,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (32,'Female','Normal',78,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (33,'Male','Normal',69,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (34,'Female','Normal',72,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (35,'Male','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (36,'Female','Normal',72,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (37,'Female','Normal',72,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (38,'Male','Normal',70,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (39,'Male','Normal',70,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (40,'Male','Normal',70,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (41,'Female','Normal',70,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (42,'Male','Normal',70,128,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (43,'Male','Normal',70,128,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (44,'Male','Normal',70,124,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (45,'Male','Normal',70,124,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (46,'Female','Normal',70,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (47,'Female','Normal',70,128,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (48,'Female','Normal',70,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (49,'Female','Normal',70,126,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (50,'Male','Normal',70,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (51,'Female','Normal',70,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (52,'Male','Normal',70,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (53,'Female','Normal',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (54,'Male','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (55,'Female','Normal',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (56,'Male','Normal',72,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (57,'Male','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (58,'Female','Normal',72,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (59,'Female','Normal',72,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (60,'Female','Normal',70,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (61,'Female','Normal',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (62,'Female','Normal',72,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (63,'Female','Normal',72,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (64,'Female','Normal',72,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (65,'Female','Normal',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (66,'Female','Normal',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (67,'Male','Normal',68,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (68,'Female','Normal',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (69,'Male','Overweight',76,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (70,'Female','Overweight',76,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (71,'Male','Normal',72,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (72,'Male','Normal',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (73,'Male','Normal',72,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (74,'Male','Normal',72,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (75,'Male','Normal',72,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (76,'Male','Normal',72,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (77,'Male','Normal',72,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (78,'Male','Normal',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (79,'Male','Normal',72,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (80,'Male','Normal',72,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (81,'Male','Overweight',81,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (82,'Male','Overweight',81,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (83,'Female','Overweight',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (84,'Male','Overweight',70,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (85,'Female','Normal',70,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (86,'Male','Normal',68,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (87,'Male','Normal',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (88,'Female','Normal',65,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (89,'Female','Normal',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (90,'Female','Normal',65,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (91,'Female','Normal',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (92,'Female','Normal',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (93,'Female','Normal',70,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (94,'Male','Obese',84,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (95,'Female','Normal',68,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (96,'Female','Normal',68,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (97,'Female','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (98,'Female','Normal',68,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (99,'Female','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (100,'Female','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (101,'Male','Normal',68,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (102,'Male','Normal',68,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (103,'Female','Normal',68,114,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (104,'Male','Overweight',74,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (105,'Female','Normal',68,116,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (106,'Male','Overweight',74,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (107,'Female','Overweight',77,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (108,'Female','Normal',68,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (109,'Male','Normal',68,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (110,'Male','Normal',68,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (111,'Female','Normal',68,114,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (112,'Male','Normal',68,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (113,'Male','Normal',68,114,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (114,'Female','Normal',68,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (115,'Male','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (116,'Female','Normal',68,118,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (117,'Female','Normal',68,114,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (118,'Female','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (119,'Male','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (120,'Male','Normal',68,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (121,'Male','Normal',68,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (122,'Male','Normal',68,116,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (123,'Male','Normal',68,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (124,'Female','Normal',68,116,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (125,'Female','Normal',68,118,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (126,'Female','Normal',70,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (127,'Male','Normal',68,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (128,'Female','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (129,'Female','Normal',68,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (130,'Female','Normal',68,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (131,'Female','Normal',68,118,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (132,'Male','Normal',68,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (133,'Male','Normal',68,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (134,'Male','Normal',68,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (135,'Female','Normal',68,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (136,'Male','Normal',68,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (137,'Male','Normal',68,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (138,'Male','Normal',68,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (139,'Female','Normal',68,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (140,'Female','Normal',68,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (141,'Male','Normal',68,118,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (142,'Male','Normal',68,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (143,'Male','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (144,'Female','Normal',68,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (145,'Female','Normal',68,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (146,'Male','Obese',84,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (147,'Female','Normal',68,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (148,'Female','Overweight',80,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (149,'Male','Normal',75,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (150,'Male','Normal',67,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (151,'Male','Normal',67,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (152,'Female','Normal',68,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (153,'Female','Normal',68,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (154,'Female','Normal',68,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (155,'Female','Normal',68,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (156,'Female','Normal',68,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (157,'Male','Normal',68,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (158,'Female','Normal',68,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (159,'Female','Normal',68,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (160,'Female','Normal',68,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (161,'Male','Normal',68,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (162,'Male','Normal',73,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (163,'Male','Normal',73,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (164,'Female','Normal',68,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (165,'Male','Normal',68,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (166,'Female','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (167,'Female','Normal',72,124,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (168,'Male','Overweight',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (169,'Male','Overweight',72,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (170,'Female','Normal',70,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (171,'Male','Normal',70,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (172,'Female','Normal',70,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (173,'Female','Normal',70,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (174,'Male','Normal',70,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (175,'Female','Normal',70,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (176,'Male','Normal',70,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (177,'Female','Normal',70,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (178,'Female','Overweight',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (179,'Female','Normal',70,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (180,'Female','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (181,'Female','Normal',70,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (182,'Male','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (183,'Male','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (184,'Male','Normal',70,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (185,'Male','Overweight',78,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (186,'Male','Overweight',78,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (187,'Female','Overweight',65,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (188,'Male','Overweight',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (189,'Male','Overweight',65,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (190,'Female','Overweight',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (191,'Male','Overweight',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (192,'Male','Overweight',72,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (193,'Male','Overweight',72,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (194,'Male','Overweight',72,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (195,'Male','Overweight',72,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (196,'Male','Overweight',72,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (197,'Female','Overweight',72,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (198,'Female','Overweight',72,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (199,'Female','Overweight',72,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (200,'Male','Overweight',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (201,'Female','Overweight',72,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (202,'Male','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (203,'Male','Normal',70,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (204,'Male','Normal',69,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (205,'Female','Overweight',68,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (206,'Male','Normal',70,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (207,'Female','Normal',70,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (208,'Male','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (209,'Female','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (210,'Male','Normal',70,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (211,'Female','Normal',70,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (212,'Female','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (213,'Female','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (214,'Female','Normal',70,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (215,'Male','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (216,'Male','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (217,'Male','Normal',70,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (218,'Female','Normal',70,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (219,'Male','Normal',70,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (220,'Male','Overweight',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (221,'Female','Overweight',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (222,'Female','Overweight',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (223,'Male','Overweight',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (224,'Female','Overweight',72,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (225,'Male','Overweight',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (226,'Female','Overweight',72,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (227,'Male','Overweight',65,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (228,'Male','Overweight',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (229,'Female','Overweight',65,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (230,'Male','Overweight',72,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (231,'Male','Overweight',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (232,'Male','Overweight',72,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (233,'Female','Overweight',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (234,'Female','Overweight',72,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (235,'Female','Overweight',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (236,'Female','Overweight',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (237,'Male','Overweight',72,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (238,'Female','Overweight',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (239,'Female','Overweight',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (240,'Male','Overweight',72,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (241,'Male','Overweight',65,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (242,'Female','Overweight',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (243,'Male','Overweight',72,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (244,'Male','Overweight',65,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (245,'Male','Overweight',72,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (246,'Female','Overweight',65,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (247,'Female','Overweight',72,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (248,'Male','Overweight',78,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (249,'Female','Overweight',72,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (250,'Male','Overweight',72,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (251,'Female','Overweight',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (252,'Female','Overweight',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (253,'Female','Overweight',65,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (254,'Male','Overweight',65,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (255,'Male','Overweight',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (256,'Female','Overweight',65,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (257,'Female','Overweight',65,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (258,'Male','Overweight',65,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (259,'Female','Overweight',65,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (260,'Male','Overweight',65,114,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (261,'Female','Overweight',65,118,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (262,'Male','Overweight',65,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (263,'Female','Overweight',65,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (264,'Female','Overweight',75,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (265,'Male','Obese',83,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (266,'Male','Overweight',75,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (267,'Female','Obese',83,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (268,'Male','Overweight',75,118,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (269,'Female','Overweight',75,156,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (270,'Female','Overweight',75,156,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (271,'Male','Overweight',75,156,102,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (272,'Female','Overweight',75,148,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (273,'Male','Overweight',75,142,102,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (274,'Female','Overweight',75,144,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (275,'Male','Overweight',75,142,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (276,'Female','Overweight',75,152,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (277,'Male','Obese',86,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (278,'Female','Obese',86,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (279,'Female','Overweight',75,144,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (280,'Female','Normal',65,138,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (281,'Female','Overweight',75,148,106,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (282,'Male','Overweight',75,156,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (283,'Female','Overweight',75,152,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (284,'Male','Overweight',75,148,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (285,'Female','Overweight',75,152,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (286,'Male','Overweight',75,148,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (287,'Male','Overweight',75,156,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (288,'Female','Overweight',75,148,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (289,'Female','Overweight',75,144,106,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (290,'Female','Overweight',75,144,102,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (291,'Female','Overweight',75,142,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (292,'Female','Overweight',75,152,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (293,'Male','Overweight',75,144,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (294,'Male','Overweight',75,148,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (295,'Female','Overweight',75,152,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (296,'Male','Overweight',75,144,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (297,'Female','Overweight',75,148,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (298,'Male','Overweight',75,156,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (299,'Male','Normal',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (300,'Female','Normal',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (301,'Male','Normal',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (302,'Male','Normal',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (303,'Female','Normal',72,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (304,'Female','Overweight',75,148,106,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (305,'Female','Overweight',75,142,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (306,'Female','Overweight',75,142,106,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (307,'Female','Overweight',72,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (308,'Female','Overweight',72,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (309,'Female','Overweight',72,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (310,'Male','Overweight',72,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (311,'Male','Overweight',72,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (312,'Male','Overweight',72,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (313,'Female','Normal',65,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (314,'Female','Normal',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (315,'Male','Normal',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (316,'Male','Normal',65,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (317,'Male','Normal',65,114,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (318,'Male','Normal',65,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (319,'Female','Normal',65,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (320,'Female','Normal',65,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (321,'Male','Normal',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (322,'Male','Normal',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (323,'Female','Normal',65,138,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (324,'Female','Normal',65,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (325,'Male','Normal',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (326,'Male','Normal',65,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (327,'Female','Normal',65,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (328,'Male','Normal',65,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (329,'Female','Normal',65,132,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (330,'Male','Normal',65,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (331,'Female','Normal',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (332,'Male','Normal',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (333,'Female','Normal',65,134,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (334,'Male','Normal',65,138,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (335,'Male','Normal',65,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (336,'Male','Normal',65,132,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (337,'Female','Normal',65,134,82,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (338,'Female','Normal',65,132,88,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (339,'Male','Normal',65,134,86,'Stage 1 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (340,'Male','Overweight',72,144,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (341,'Male','Overweight',72,142,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (342,'Male','Normal',65,116,78,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (343,'Male','Normal',65,118,76,'Normal');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (344,'Female','Overweight',68,148,106,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (345,'Male','Overweight',68,156,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (346,'Male','Obese',68,142,102,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (347,'Male','Obese',68,156,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (348,'Male','Obese',68,152,106,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (349,'Female','Obese',68,152,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (350,'Male','Obese',68,152,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (351,'Female','Obese',68,144,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (352,'Female','Obese',68,148,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (353,'Female','Obese',68,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (354,'Female','Obese',68,124,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (355,'Female','Overweight',68,128,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (356,'Male','Overweight',68,124,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (357,'Male','Overweight',68,128,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (358,'Female','Overweight',68,128,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (359,'Male','Overweight',68,124,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (360,'Female','Overweight',68,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (361,'Female','Overweight',68,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (362,'Male','Overweight',68,126,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (363,'Male','Overweight',68,128,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (364,'Female','Normal',68,126,76,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (365,'Male','Normal',68,126,78,'Elevated');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (366,'Male','Normal',68,156,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (367,'Male','Normal',68,142,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (368,'Male','Normal',68,156,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (369,'Female','Normal',68,142,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (370,'Female','Normal',68,148,98,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (371,'Male','Normal',68,156,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (372,'Female','Normal',68,152,102,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (373,'Male','Overweight',68,156,92,'Stage 2 HTN');
INSERT INTO `health` (`Person ID`,`Gender`,`BMI`,`Heart Rate`,`Systolic_BP`,`Diastolic_BP`,`Blood Pressure`) VALUES (374,'Female','Overweight',68,152,98,'Stage 2 HTN');

-- Data for lifestyle table
-- Summary: Store data about the person's ID, stress level, daily steps, and physical activity level
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (1,'Male',6,4200,42);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (2,'Female',8,10000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (3,'Female',8,10000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (4,'Female',8,3000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (5,'Female',8,3000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (6,'Female',8,3000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (7,'Female',7,3500,40);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (8,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (9,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (10,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (11,'Male',8,8000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (12,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (13,'Male',8,8000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (14,'Male',8,8000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (15,'Female',8,8000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (16,'Male',8,8000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (17,'Male',7,4000,40);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (18,'Male',8,8000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (19,'Female',7,4000,40);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (20,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (21,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (22,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (23,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (24,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (25,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (26,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (27,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (28,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (29,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (30,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (31,'Male',7,4100,35);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (32,'Female',7,4100,35);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (33,'Male',4,6800,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (34,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (35,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (36,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (37,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (38,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (39,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (40,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (41,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (42,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (43,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (44,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (45,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (46,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (47,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (48,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (49,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (50,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (51,'Female',3,8000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (52,'Male',3,8000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (53,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (54,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (55,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (56,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (57,'Male',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (58,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (59,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (60,'Female',6,8000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (61,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (62,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (63,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (64,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (65,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (66,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (67,'Male',6,7000,50);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (68,'Female',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (69,'Male',6,5500,50);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (70,'Female',6,5500,50);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (71,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (72,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (73,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (74,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (75,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (76,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (77,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (78,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (79,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (80,'Male',8,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (81,'Male',8,5200,32);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (82,'Male',8,5200,32);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (83,'Female',5,5600,40);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (84,'Male',5,5600,40);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (85,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (86,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (87,'Male',4,5000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (88,'Female',4,5000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (89,'Female',4,5000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (90,'Female',4,5000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (91,'Female',4,5000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (92,'Female',4,5000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (93,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (94,'Male',5,3300,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (95,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (96,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (97,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (98,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (99,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (100,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (101,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (102,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (103,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (104,'Male',7,4800,35);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (105,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (106,'Male',7,4800,35);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (107,'Female',6,4200,42);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (108,'Female',4,7000,70);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (109,'Male',4,7000,70);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (110,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (111,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (112,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (113,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (114,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (115,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (116,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (117,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (118,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (119,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (120,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (121,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (122,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (123,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (124,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (125,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (126,'Female',4,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (127,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (128,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (129,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (130,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (131,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (132,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (133,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (134,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (135,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (136,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (137,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (138,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (139,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (140,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (141,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (142,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (143,'Male',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (144,'Female',4,7000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (145,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (146,'Male',5,3300,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (147,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (148,'Female',7,4000,40);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (149,'Male',6,5500,50);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (150,'Male',3,7500,80);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (151,'Male',3,7500,80);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (152,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (153,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (154,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (155,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (156,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (157,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (158,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (159,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (160,'Female',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (161,'Male',5,8000,60);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (162,'Male',6,7300,55);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (163,'Male',6,7300,55);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (164,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (165,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (166,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (167,'Female',6,6200,70);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (168,'Male',6,6000,55);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (169,'Male',6,6000,55);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (170,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (171,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (172,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (173,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (174,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (175,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (176,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (177,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (178,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (179,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (180,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (181,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (182,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (183,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (184,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (185,'Male',7,5000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (186,'Male',7,5000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (187,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (188,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (189,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (190,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (191,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (192,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (193,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (194,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (195,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (196,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (197,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (198,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (199,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (200,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (201,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (202,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (203,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (204,'Male',7,6800,47);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (205,'Female',4,6800,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (206,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (207,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (208,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (209,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (210,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (211,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (212,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (213,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (214,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (215,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (216,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (217,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (218,'Female',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (219,'Male',5,8000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (220,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (221,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (222,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (223,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (224,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (225,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (226,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (227,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (228,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (229,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (230,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (231,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (232,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (233,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (234,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (235,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (236,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (237,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (238,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (239,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (240,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (241,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (242,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (243,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (244,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (245,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (246,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (247,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (248,'Male',7,5000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (249,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (250,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (251,'Female',6,6000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (252,'Female',6,6000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (253,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (254,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (255,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (256,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (257,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (258,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (259,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (260,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (261,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (262,'Male',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (263,'Female',4,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (264,'Female',5,5500,55);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (265,'Male',5,3500,65);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (266,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (267,'Female',5,3500,65);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (268,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (269,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (270,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (271,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (272,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (273,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (274,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (275,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (276,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (277,'Male',3,3700,85);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (278,'Female',3,3700,85);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (279,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (280,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (281,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (282,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (283,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (284,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (285,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (286,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (287,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (288,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (289,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (290,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (291,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (292,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (293,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (294,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (295,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (296,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (297,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (298,'Male',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (299,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (300,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (301,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (302,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (303,'Female',6,6000,55);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (304,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (305,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (306,'Female',8,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (307,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (308,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (309,'Female',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (310,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (311,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (312,'Male',7,6000,45);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (313,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (314,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (315,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (316,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (317,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (318,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (319,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (320,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (321,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (322,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (323,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (324,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (325,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (326,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (327,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (328,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (329,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (330,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (331,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (332,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (333,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (334,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (335,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (336,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (337,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (338,'Female',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (339,'Male',3,5000,30);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (340,'Male',4,5000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (341,'Male',4,5000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (342,'Male',3,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (343,'Male',3,10000,90);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (344,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (345,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (346,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (347,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (348,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (349,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (350,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (351,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (352,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (353,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (354,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (355,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (356,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (357,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (358,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (359,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (360,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (361,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (362,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (363,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (364,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (365,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (366,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (367,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (368,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (369,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (370,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (371,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (372,'Female',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (373,'Male',3,7000,75);
INSERT INTO `lifestyle` (`Person_ID`,`Gender`,`Stress_Level`,`Daily_Steps`,`Physical_Activity`) VALUES (374,'Female',3,7000,75);

-- Data for sleep table
-- Summary: Store data about the person's ID, gender, if they have a sleep disorder, sleep duration, and sleep quality
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (1,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (2,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (3,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (4,'Female','Sleep Apnea',6,4);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (5,'Female','Sleep Apnea',6,4);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (6,'Female','Insomnia',6,4);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (7,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (8,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (9,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (10,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (11,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (12,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (13,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (14,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (15,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (16,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (17,'Male','Sleep Apnea',7,5);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (18,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (19,'Female','Insomnia',7,5);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (20,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (21,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (22,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (23,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (24,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (25,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (26,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (27,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (28,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (29,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (30,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (31,'Male','Sleep Apnea',6,5);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (32,'Female','Insomnia',6,5);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (33,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (34,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (35,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (36,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (37,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (38,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (39,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (40,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (41,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (42,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (43,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (44,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (45,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (46,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (47,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (48,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (49,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (50,'Male','Sleep Apnea',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (51,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (52,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (53,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (54,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (55,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (56,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (57,'Male','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (58,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (59,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (60,'Female','None',8,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (61,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (62,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (63,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (64,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (65,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (66,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (67,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (68,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (69,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (70,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (71,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (72,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (73,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (74,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (75,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (76,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (77,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (78,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (79,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (80,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (81,'Male','Sleep Apnea',6,4);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (82,'Male','Sleep Apnea',6,4);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (83,'Female','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (84,'Male','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (85,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (86,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (87,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (88,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (89,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (90,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (91,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (92,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (93,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (94,'Male','Sleep Apnea',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (95,'Female','Insomnia',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (96,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (97,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (98,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (99,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (100,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (101,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (102,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (103,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (104,'Male','Sleep Apnea',7,5);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (105,'Female','Sleep Apnea',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (106,'Male','Insomnia',7,5);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (107,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (108,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (109,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (110,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (111,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (112,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (113,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (114,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (115,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (116,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (117,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (118,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (119,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (120,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (121,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (122,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (123,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (124,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (125,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (126,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (127,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (128,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (129,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (130,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (131,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (132,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (133,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (134,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (135,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (136,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (137,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (138,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (139,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (140,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (141,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (142,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (143,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (144,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (145,'Female','Sleep Apnea',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (146,'Male','Sleep Apnea',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (147,'Female','Insomnia',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (148,'Female','Insomnia',7,5);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (149,'Male','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (150,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (151,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (152,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (153,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (154,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (155,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (156,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (157,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (158,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (159,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (160,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (161,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (162,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (163,'Male','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (164,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (165,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (166,'Female','Insomnia',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (167,'Female','None',7,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (168,'Male','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (169,'Male','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (170,'Female','None',8,3);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (171,'Male','None',8,3);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (172,'Female','None',8,3);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (173,'Female','None',8,3);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (174,'Male','None',8,3);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (175,'Female','None',8,3);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (176,'Male','None',8,3);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (177,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (178,'Female','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (179,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (180,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (181,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (182,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (183,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (184,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (185,'Male','Sleep Apnea',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (186,'Male','Sleep Apnea',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (187,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (188,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (189,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (190,'Female','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (191,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (192,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (193,'Male','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (194,'Male','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (195,'Male','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (196,'Male','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (197,'Female','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (198,'Female','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (199,'Female','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (200,'Male','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (201,'Female','Insomnia',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (202,'Male','Insomnia',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (203,'Male','Insomnia',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (204,'Male','None',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (205,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (206,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (207,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (208,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (209,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (210,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (211,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (212,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (213,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (214,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (215,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (216,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (217,'Male','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (218,'Female','None',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (219,'Male','Sleep Apnea',8,8);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (220,'Male','Sleep Apnea',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (221,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (222,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (223,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (224,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (225,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (226,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (227,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (228,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (229,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (230,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (231,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (232,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (233,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (234,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (235,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (236,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (237,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (238,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (239,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (240,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (241,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (242,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (243,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (244,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (245,'Male','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (246,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (247,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (248,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (249,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (250,'Male','None',7,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (251,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (252,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (253,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (254,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (255,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (256,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (257,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (258,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (259,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (260,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (261,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (262,'Male','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (263,'Female','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (264,'Female','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (265,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (266,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (267,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (268,'Male','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (269,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (270,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (271,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (272,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (273,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (274,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (275,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (276,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (277,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (278,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (279,'Female','Insomnia',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (280,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (281,'Female','None',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (282,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (283,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (284,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (285,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (286,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (287,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (288,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (289,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (290,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (291,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (292,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (293,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (294,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (295,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (296,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (297,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (298,'Male','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (299,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (300,'Female','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (301,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (302,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (303,'Female','None',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (304,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (305,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (306,'Female','Sleep Apnea',6,6);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (307,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (308,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (309,'Female','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (310,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (311,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (312,'Male','Insomnia',7,7);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (313,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (314,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (315,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (316,'Male','Insomnia',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (317,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (318,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (319,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (320,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (321,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (322,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (323,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (324,'Female','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (325,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (326,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (327,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (328,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (329,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (330,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (331,'Female','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (332,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (333,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (334,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (335,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (336,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (337,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (338,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (339,'Male','None',9,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (340,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (341,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (342,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (343,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (344,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (345,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (346,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (347,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (348,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (349,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (350,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (351,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (352,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (353,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (354,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (355,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (356,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (357,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (358,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (359,'Male','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (360,'Female','None',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (361,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (362,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (363,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (364,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (365,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (366,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (367,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (368,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (369,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (370,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (371,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (372,'Female','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (373,'Male','Sleep Apnea',8,9);
INSERT INTO `sleep` (`Person_ID`,`Gender`,`Sleep_Disorder`,`Sleep_Duration`,`Sleep_Quality`) VALUES (374,'Female','Sleep Apnea',8,9);

-- ***************************
-- Part C
-- ***************************
-- ***************************
-- Query 1
-- Purpose: Getting insights on the health and lifestyle patterns of individuals in the database.
-- Summary: Combines information from the person, health, and lifestyle.
SELECT 
	p.Person_ID, 
	p.Gender, 
	p.Age, 
	p.Occupation, 
	h.BMI, 
	ls.Physical_Activity
FROM Person p
	JOIN Health h ON p.Person_ID = h.Person_ID
	JOIN Lifestyle ls ON p.Person_ID = ls.Person_ID;

-- ***************************
-- Query 2
-- Purpose: Analyzes the relationship between sleep health and physical activity for different genders.
-- Summary: Calculates average number of daily steps taken by individuals of both genders who have a sleep disorder.
SELECT 
	Gender, 
	ROUND(AVG(Daily_Steps)) 
		AS avg_steps
FROM Lifestyle
WHERE Person_ID 
	IN (SELECT Person_ID FROM Sleep WHERE Sleep_Disorder <> 'None')
GROUP BY Gender;

-- ***************************
-- Query 3
-- Purpose: Ability to see age groups by gender in the dataset with a high BMI and explore potential relationships.
-- Summary: Retrieves gender, and counts the number of individuals with a BMI that’s equal to overweight/obese
-- using the subquery. The alias is used to name the column for individuals with a BMI of Overweight or Obese.
SELECT 
	p.Gender, 
	p.Age,
	COUNT((SELECT h.Person_ID 
		FROM Health h 
        WHERE h.Person_ID = p.Person_ID AND (h.BMI = 'Overweight' OR h.BMI = 'Obese')))
			AS 'Unhealthy BMI Count'
FROM Person p
GROUP BY p.Gender, P.Age
ORDER BY p.Age ASC;

-- ***************************
-- Query 4
-- Purpose: Displays which researcher recorded which patient’s data at what location.
-- Summary: A table containing the details of each patient and the researcher who recorded their data.
SELECT *
FROM Person
	LEFT OUTER JOIN Researcher ON Person.Res_ID = Researcher.Researcher_ID
UNION
SELECT *
FROM Person
	RIGHT OUTER JOIN Researcher ON Person.Res_ID = Researcher.Researcher_ID
ORDER BY Res_ID;

-- ***************************
-- Query 5
-- Purpose: Combines information from two different health-related tables and gains insights onto a correlation between BMI and sleep quality.
-- Summary: Retrieves person id, gender of individuals who have a BMI is overweight or obese from the health table or have
-- a sleep quality less than 6 in the sleep table. The union operation combines the results of both queries.
SELECT 
	Person_ID, 
	Gender 
FROM Health WHERE BMI = 'Overweight' OR BMI = 'Obese'
UNION
SELECT 
	Person_ID, 
    Gender 
FROM Sleep WHERE Sleep_Quality < 6;

-- ***************************
-- Query 6
-- Purpose: Order the occupations separated by genders by the highest percentage with sleep disorders.
-- Summary: A table with each occupation matched with both genders showing the number of people with a sleep disorder,
-- the total number of males/females in that occupation, and the percentage of males/females in that occupation with a sleep disorder.
SELECT 
	Person.Gender, 
	Person.Occupation,
	SUM(IF(Sleep.Sleep_Disorder <> 'None', 1, 0))
		AS 'Number of People w/ Sleep Disorder',
	COUNT(Sleep.Person_ID)
		AS 'Total Number of People',
	CONCAT(ROUND(SUM(IF(Sleep.Sleep_Disorder <> 'None', 1, 0)) / COUNT(Sleep.Person_ID) * 100), '%')
		AS 'Percent w/ Sleep Disorder'
FROM Person 
	JOIN Sleep ON Person.Person_ID = Sleep.Person_ID
GROUP BY Person.Gender, Person.Occupation
ORDER BY ROUND(SUM(IF(Sleep.Sleep_Disorder <> 'None', 1, 0)) / COUNT(Sleep.Person_ID) * 100) DESC;

-- ***************************
-- Query 7
-- Purpose: Analyze gender, stress level, and blood pressure to see if there is an impact on the person’s sleep duration and quality.
-- Summary: A table separated by gender and blood pressure categories with the average stress level, sleep duration, and sleep quality displayed.
SELECT
	Person.Gender,
	Blood_Pressure AS 'Blood Pressure',
	ROUND(AVG(Stress_Level), 1) 
		AS 'Stress Level',
   	ROUND(AVG(Sleep_Duration), 1) 
		AS 'Sleep Duration (Hours)',
	ROUND(AVG(Sleep_Quality), 1) 
		AS 'Sleep Quality'
FROM Person
	JOIN Health ON Person.Person_ID = Health.Person_ID
	JOIN Lifestyle ON Person.Person_ID = Lifestyle.Person_ID
	JOIN Sleep ON Person.Person_ID = Sleep.Person_ID
GROUP BY Person.Gender, Blood_Pressure
ORDER BY AVG(Stress_Level) DESC;

-- ***************************
-- Query 8
-- Purpose: Determine if the physical activity level of each gender impacts their average sleep quality.
-- Summary: A table containing active and inactive rows for both genders and the group’s average sleep quality.
SELECT 
	Lifestyle.Gender,
	ROUND(AVG(Sleep_Quality), 2)
		AS 'Avg Sleep Quality',
	CASE
		WHEN Physical_Activity >= 60 THEN 'Active'
		ELSE 'Inactive'
	END AS 'Activity Status'
FROM Lifestyle
	JOIN Sleep ON Lifestyle.Person_ID = Sleep.Person_ID
GROUP BY 
	Lifestyle.Gender,
	CASE
		WHEN Physical_Activity >= 60 THEN 'Active'
		ELSE 'Inactive'
	END
ORDER BY Lifestyle.Gender;

-- ***************************
-- Query 9
-- Purpose: Identify individuals who experience high stress levels and have sleep disorders.
-- Summary: Filters results of peoples ID, gender, age, stress level, and sleep disorder. Includes 
-- individuals with a stress level higher than 7 and have a sleep disorder.
SELECT 
	p.Person_ID, 
	p.Gender, 
	p.Age, 
	l.Stress_Level, 
	s.Sleep_Disorder
FROM Person p
	JOIN Lifestyle l ON p.Person_ID = l.Person_ID
	JOIN Sleep s ON p.Person_ID = s.Person_ID
WHERE l.Stress_Level > 7 AND s.Sleep_Disorder <> 'None';

-- ***************************
-- Query 10
-- Purpose: Evaluate the sleep quality of people living in or around certain cities based on gender.
-- Summary: A table containing the average sleep quality of each gender in every city where data was recorded.
SELECT 
	Dept_Location, 
	Person.Gender, 
	ROUND(AVG(Sleep_Quality), 2)
		AS 'Avg Sleep Quality'
FROM Researcher, Person, Sleep
WHERE Researcher_ID = Person.Res_ID
	AND Person.Person_ID = Sleep.Person_ID
GROUP BY Dept_Location, Person.Gender;

-- ***************************
