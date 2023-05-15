DROP DATABASE IF EXISTS ARTMUSEUM;
CREATE DATABASE ARTMUSEUM; 
USE ARTMUSEUM;

DROP TABLE IF EXISTS ARTIST;
CREATE TABLE ARTIST (
	Artist_Name			varchar(60),
	Date_Born			int,
    Date_Died 			int,
    Country_of_Origin 	varchar(60),
    Epoch 				varchar(60),
    Main_style 			varchar(60),
    Artist_Description 	varchar(60),
	primary key (Artist_Name)

);

DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT (
	Id_no				int not null AUTO_INCREMENT,
	Title				varchar(100),
	Artist				varchar(50),
	Art_Description		varchar(60),
    Year_Made 			int,
	Country_Culture_of_Origin 	varchar(50),
	Epoch				varchar(50),
	primary key (Id_no),
	foreign key (Artist) references ARTIST(Artist_Name)
	
);

DROP TABLE IF EXISTS PAINTING;
CREATE TABLE PAINTING (
	Id_no				int not null AUTO_INCREMENT,
	Paint_Type			varchar(30),
	Drawn_on			varchar(60),
	Style				varchar(30),
	primary key (Id_no),
	foreign key (Id_no) references ART_OBJECT(Id_no)
	
);

DROP TABLE IF EXISTS SCULPTURE;
CREATE TABLE SCULPTURE (
	Id_no				int not null AUTO_INCREMENT,
	Material			varchar(60),
	Height_cm			int,
	Weight_kg			int,
	Style				varchar(60),
	primary key (Id_no),
	foreign key (Id_no) references ART_OBJECT(Id_no)
	
);

DROP TABLE IF EXISTS OTHER;
CREATE TABLE OTHER (
	Id_no				int not null AUTO_INCREMENT,
	Art_Type			varchar(60),
	Style				varchar(60),
	primary key (Id_no),
	foreign key (Id_no) references ART_OBJECT(Id_no)
	ON UPDATE CASCADE
);


DROP TABLE IF EXISTS PERMANENT_COLLECTION;
CREATE TABLE PERMANENT_COLLECTION (
	Id_no				int not null AUTO_INCREMENT,
	Collection_Status	varchar(60),
    Cost 				float,
    Date_acquired 		varchar(60),
	primary key (Id_no),
	foreign key (Id_no) references ART_OBJECT(Id_no)
	
);
DROP TABLE IF EXISTS COLLECTIONS;
CREATE TABLE COLLECTIONS (
	Collection_Name 	varchar(100),
    Collection_Type 	varchar(100),
    Collection_Description varchar(100),
    Cl_Address 			varchar(60),
    Phone 				varchar(60),
    Contact_person 		varchar(60), 
	primary key (Collection_Name)
	
);
DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED (
	Id_no				int not null AUTO_INCREMENT,
	Collection_Borrowed	varchar(60),
    Date_borrowed 		varchar(60),
    Date_returned 		varchar(60),
	primary key (Id_no),
	foreign key (Id_no) references ART_OBJECT(Id_no),
	foreign key (Collection_Borrowed) references COLLECTIONS(Collection_Name)
	
);


DROP TABLE IF EXISTS EXHIBITIONS;
CREATE TABLE EXHIBITIONS (
	Id_no				int not null AUTO_INCREMENT,
	Exhibitions_name	varchar(100),
    Start_date 			varchar(40),
    End_date 			varchar(40), 
	primary key (Id_no),
	foreign key (Id_no) references ART_OBJECT(Id_no)
	
);

-- Adding Artists
INSERT INTO ARTIST(Artist_Name, Date_Born, Date_Died, Country_of_Origin, Epoch, Main_style, Artist_Description)
VALUES 
('Nicholas Hilliard', 1567, 1619, 'England', 'Renaissance', 'Potraits', 'Conservative'),
('Isaac Oliver', 1565, 1617, 'England', 'Renaissance', 'Potraits', 'Naturalist'),
('Unknown', NUll, NUll, NUll, NUll, NUll, NUll),
('Pablo Picasso', 1881, 1973, 'Spain', 'African Influenced', 'Paintings', 'Surrealism'),
('Philip Peter', 1567, 1619, 'Italian', 'Early Modern', 'Paintings', 'Surrealist'),
('Sebastiano Mainardi', 1403, 1490, 'Italy', 'Italian', 'Paintings', 'Naturalist'),
('Jean Joseph', 1710, 1767, 'France', 'Portraits', 'Paintings', 'Surrealist'),
('Lorch Melchior', 1513, 1578, 'France', 'Portraits', 'Paintings', 'Naturalist'),
('Rafaello Santi', 1487, 1535, 'Italy', 'Portraits', 'Paintings', 'Naturalist'),
('Mihr Ali', 1767, 1805, 'Iran', 'Modern Iranian', 'Paintings', 'Surrealist');

-- Adding Art Objects
INSERT INTO ART_OBJECT (Id_no, Title, Artist, Art_Description, Year_Made, Country_Culture_of_Origin, Epoch)
VALUES 
(12341, 'Elizabeth I', 'Nicholas Hilliard', 'Portrait of Elizabeth I', 1599, 'England', 'Early Modern'),
(12342, 'A Party in the Open Air', 'Isaac Oliver', 'Gathering for an open-air party.', 1595, 'Denmark', NULL),
(23451, 'John the Evangelist', 'Unknown', 'Man in a cloak holding a goblet.', 1505, NULL, NULL),
(23452, 'The Absinthe Glass', 'Pablo Picasso', 'Abstract Face', 1914, 'France', NULL),
(34561, 'Churn', 'Unknown', 'Vase', 1845, 'America', 'Realistic'),
(34562, 'Bowl', 'Unknown', 'Brown bowl', 1500, 'First Nations', NULL),
(45671, 'Vue dun port', 'Philip Peter', 'Inscription illisile à la craie sur cadre', 1600, 'Italy','Modern'),
(45672, 'Vierge adorant lEnfant', 'Sebastiano Mainardi', 'Vierge, Enfant Jésus et saint Jean', 1450, 'Italy', NULL),
(45673, 'Verdure avec un combat de coqs', 'Jean Joseph', 'Verdure portant au second plan', 1730,'France','Early Modern'),
(45674, 'Portrait dAlbert Dürer', 'Lorch Melchior', 'Signé du monogramme', 1550, 'France', 'Naturalism'),
(45675, 'Balthazar Castiglione', 'Rafaello Santi', 'Portrait de Baldassare Castiglione', 1514, 'Italy', 'Naturalism'),
(45676, 'Portrait de Fath Ali Shah', 'Mihr Ali', NULL, 1800, 'Iran','Modern Iranian');

-- Adding Paintings
INSERT INTO PAINTING (Id_no, Paint_Type, Drawn_on, Style)
VALUES 
(12341, 'Oil', 1599, 'Portrait'),
(12342, 'Water Colour and Body Colour', '1590-1595', 'Scene');

-- Adding Sculptures
INSERT INTO SCULPTURE (Id_no, Material, Height_cm, Weight_kg, Style)
VALUES 
(23451, 'Terracotta', 48, NULL, "Full body Sculpture"),
(23452, 'Bronze', 23, NULL, "Abstract Sculpture");

-- Adding Other
INSERT INTO OTHER (Id_no, Art_Type, Style)
VALUES 
(34561, 'Pottery', "Stoneware"),
(34562, 'Pottery', 'Earthenware');

-- Adding Exhibitions
INSERT INTO EXHIBITIONS(Id_no, Exhibitions_name, Start_date, End_date)
VALUES
(12341, 'The Tudors: Art and Majesty in Renaissance England',  'October 10, 2022', 'January 8, 2023'),
(12342, 'The Tudors: Art and Majesty in Renaissance England',  'October 10, 2022', 'January 8, 2023'),
(23451, 'The Tudors: Art and Majesty in Renaissance England',  'October 10, 2022', 'January 8, 2023'),
(23452, 'Cubism and the Trompe l Oeil Tradition', 'October 20,2022', 'January 22 2023'),
(34561,'Hear Me Now: The Black Potters of Old Edgefield, South Carolina', "September 9, 2022", "Febrary 5,2023"),
(34562,'Hear Me Now: The Black Potters of Old Edgefield, South Carolina', "September 9, 2022", "Febrary 5,2023");

-- Adding Collections
INSERT INTO COLLECTIONS (Collection_Name, Collection_Type, Cl_Address, Phone, Contact_person)
VALUES 
('National Museums Recovery', 'Museum', 'Rue Jean Bullant, 95440 Écouen, France', '3313438385', 'Jean Bullant'),
('The Art of Portraiture', 'Museum', 'Les Granges de Port-Royal, 78114 Magny-les-Hameaux, France', '3313930727', 'Chloe Monet');

-- Adding Borrowed Collections
INSERT INTO BORROWED (Id_no, Collection_Borrowed, Date_borrowed, Date_returned)
VALUES 
(45671, 'National Museums Recovery', 'October 17, 2011', 'January 8, 2015'),
(45672, 'National Museums Recovery', 'January 4, 2010', 'December 23, 2016'),
(45673, 'National Museums Recovery', 'March 20, 2004', 'February 7, 2008'),
(45674, 'The Art of Portraiture', 'August 31, 2009', 'September 27, 2014'),
(45675, 'The Art of Portraiture', 'December 11, 2017', 'October 10, 2022'),
(45676, 'The Art of Portraiture', 'May 29, 2020', 'April 24, 2021');

-- Adding Permanent Collections
INSERT INTO PERMANENT_COLLECTION (Id_no, Collection_Status, Cost, Date_acquired)
VALUES
(12341, "On Display", 230000.00, "March 19, 1992"),
(12342, "On Display",200000.00, "February 3, 2000"),
(23451,"On Display", 185000.00,"September 17, 1985"),
(23452, "On Display",190000.00, "July 27, 2007"),
(34561, "On Display", 130000.00,"October 5, 2003"),
(34562, "On Display", 145000.00, "June 19, 2013");



/* guest role */

DROP ROLE IF EXISTS read_access@localhost; 
CREATE ROLE read_access@localhost;
GRANT Select ON artmuseum.* TO read_access@localhost; 

DROP USER IF EXISTS Guest@localhost; 
CREATE USER Guest@localhost;
GRANT read_access@localhost TO Guest@localhost;
SET DEFAULT ROLE ALL TO Guest@localhost;