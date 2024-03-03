CREATE TABLE Player (
	playerId INTEGER NOT NULL,
  	firstName VARCHAR(20),
  	lastName VARCHAR(20),
  	age INTEGER
  		CHECK (age > 0),
  	nationality VARCHAR(5),
  	position VARCHAR(10),

  	UNIQUE (playerId, firstName, lastName),
  	PRIMARY KEY (playerId)
);


CREATE TABLE PlayerStats (
  	PlayerStatsId INTEGER NOT NULL,
  	gamesPlayed INTEGER NOT NULL DEFAULT 0,
  	goals INTEGER NOT NULL DEFAULT 0,
  	assists INTEGER NOT NULL DEFAULT 0,
  	points INTEGER NOT NULL DEFAULT 0,
  	penaltyMinutes INTEGER NOT NULL DEFAULT 0,
  	plusMinus INTEGER NOT NULL DEFAULT 0,
  	season INTEGER NOT NULL,
  	playerId INTEGER NOT NULL,
  	teamId INTEGER NOT NULL DEFAULT 'N/A',
  	
  	PRIMARY KEY (playerStatsId),
  	FOREIGN KEY (playerId) REFERENCES Player(playerId)
  		ON DELETE CASCADE,
  	FOREIGN KEY (teamId) REFERENCES Team(teamId)
  		ON DELETE CASCADE
	
);

CREATE TABLE Arena (
	arenaId INTEGER NOT NULL,
  	arenaName VARCHAR(30),
  	builtYear INTEGER NOT NULL,
  	capacity INTEGER NOT NULL,
  	homeTown VARCHAR(20),
  	
  	UNIQUE (arenaId, arenaName),
  	PRIMARY KEY (arenaId)
);

CREATE TABLE Team (
	teamId INTEGER NOT NULL,
  	name VARCHAR(30),
  	homeTown VARCHAR(20),
  	founded INTEGER NOT NULL,
  	arenaId INTEGER NOT NULL,
  	homeJerseyColour VARCHAR(20),

  	UNIQUE (teamId, name),
  	PRIMARY KEY (teamId),
  	FOREIGN KEY (arenaID) REFERENCES Arena(arenaID)
  		ON DELETE CASCADE
);

CREATE TABLE TeamStats(
	teamStatsId INTEGER NOT NULL,
  	gamesPlayed INTEGER NOT NULL,
  	regTimeWins INTEGER NOT NULL,
  	otWins INTEGER NOT NULL,
  	regTimeLosses INTEGER NOT NULL,
  	otLosses INTEGER NOT NULL,
  	points INTEGER NOT NULL,
  	season INTEGER NOT NULL,
  	teamId INTEGER,
  
  	PRIMARY KEY (teamStatsId),
  	FOREIGN KEY (teamId) REFERENCES Team(teamId)
  		ON DELETE CASCADE
);

CREATE TABLE Referee (
	refereeId INTEGER NOT NULL,
  	firstName VARCHAR(20),
  	lastName VARCHAR(20),
  	number INTEGER NOT NULL,
  	role VARCHAR(20),
  
  	PRIMARY KEY (refereeId)
);

CREATE TABLE Linesman (
  	linesmanId INTEGER NOT NULL,
  	firstName VARCHAR(20),
  	lastName VARCHAR(20),
  	number INTEGER NOT NULL,
  	role VARCHAR(20),
  
  	PRIMARY KEY (linesmanId)
);

CREATE TABLE Game (
	gameId INTEGER NOT NULL,
  	result VARCHAR(20),
  	gameDay VARCHAR(20),
  	season INTEGER NOT NULL,
  	homeTeamId INTEGER NOT NULL,
  	awayTeamId INTEGER NOT NULL,
  	ref1Id INTEGER NOT NULL,
  	ref2Id INTEGER NOT NULL,
  	linesman1Id INTEGER NOT NULL,
  	linesman2Id INTEGER NOT NULL,  
	arenaId INTEGER NOT NULL,
  
  	PRIMARY KEY (gameId),
  	FOREIGN KEY (homeTeamId) REFERENCES Team(teamId)
  		ON DELETE CASCADE,
  	FOREIGN KEY (awayTeamId) REFERENCES Team(teamId)
  		ON DELETE CASCADE,
  	FOREIGN KEY (ref1Id) REFERENCES Referee(refereeId)
  		ON DELETE CASCADE,
  	FOREIGN KEY (ref2Id) REFERENCES Referee(refereeId)
  		ON DELETE CASCADE,
  	FOREIGN KEY (linesman1Id) REFERENCES Linesman(linesmanId)
  		ON DELETE CASCADE,
  	FOREIGN KEY (linesman2Id) REFERENCES Linesman(linesmanId)
  		ON DELETE CASCADE,
  	FOREIGN KEY (arenaId) REFERENCES Arena(arenaId)
  		ON DELETE CASCADE
);


CREATE TABLE PlayerGame (
	playerId INTEGER NOT NULL,
  	gameId INTEGER NOT NULL,
  	
  	PRIMARY KEY (playerId, gameId),
  	FOREIGN KEY (playerId) REFERENCES Player(playerId)
  		ON DELETE CASCADE,
  	FOREIGN KEY (gameId) REFERENCES Game(gameId)
  		ON DELETE CASCADE
);

CREATE INDEX team_index ON Team(name);


INSERT INTO PLAYER VALUES 
	(1, 'Ville', 'Meskanen', 28, 'FIN', 'RW'),
    (2, 'Antoine', 'Morand', 25, 'CAN', 'C/LW'),
    (3, 'Valtteri', 'Ojantakanen', 23,'FIN', 'LW'),
    (4, 'Joonas', 'Oden', 24, 'FIN', 'RW'),
    (5, 'Henri', 'Hietala', 23,' FIN', 'D'),
 	(6, 'Jori', 'Lehterä', 36, 'FIN', 'C'),
    (7, 'Juuso', 'Ikonen', 29, 'FIN', 'RW/LW'),
    (8, 'Veli-Matti', 'Savinainen', 38, 'FIN', 'LW'),
    (9, 'Valtteri', 'Kemiläinen', 32, 'FIN', 'D'),
    (10, 'Kristian', 'Kuusela', 41, 'FIN', 'RW'),
    (11, 'Petri', 'Kontiola', 39, 'FIN', 'C'),
    (12, 'Aku', 'Räty', 22, 'FIN', 'RW'),
    (13, 'Tommi', 'Tikka', 28, 'FIN', 'C'),
    (14, 'Otto', 'Latvala', 24, 'FIN', 'D'),
    (15, 'Eetu', 'Koivistoinen', 28, 'FIN', 'C'),
    (16, 'Ilari', 'Melart', 35, 'FIN', 'D'),
    (17, 'Micke-Max', 'Åsten', 31, 'FIN', 'C'),
    (18, 'Michael', 'Joly', 28, 'CAN', 'RW'),
    (19, 'Eetu', 'Liukas', 21, 'FIN', 'LW'),
    (20, 'Juuso', 'Hietanen', 38, 'FIN', 'D'),
    (21, 'Lukas', 'Jasek', 26, 'CZE', 'C'),
    (22, 'Teemu', 'Eronen', 33, 'FIN', 'D'),
    (23, 'Ben', 'Blood', 34, 'USA', 'D'),
    (24, 'Patrik', 'Puistola', 23, 'FIN', 'RW/LW'),
    (25, 'Liam', 'Kirk', 24, 'ENG', 'LW/C'),
    (26, 'Oliver Joakim', 'Larsen', 25, 'DEN', 'D'),
   	(27, 'Heikki', 'Liedes', 31, 'FIN', 'C'),
    (28, 'Linus', 'Andersson', 24, 'SWE', 'RW'),
    (29, 'Emil', 'Molin', 31, 'SWE', 'C/LW'),
    (30, 'Arttu', 'Ilomäki', 32, 'FIN', 'C'),
    (31, 'Anthony', 'Rech', 31, 'FRA', 'LW'),
    (32, 'Niklas', 'Arell', 33, 'SWE', 'D'),
    (33, 'Jerry', 'Turkulainen', 25, 'FIN', 'RW'),
    (34, 'Sami', 'Niku', 27, 'FIN', 'D'),
    (35, 'Reid', 'Gardiner', 28, 'CAN', 'RW'),
    (36, 'Roope', 'Talaja', 35, 'FIN', 'LW'),
    (37, 'Ian', 'McCoshen', 28, 'CAN', 'D'),
    (38, 'Rami', 'Määttä', 21, 'FIN', 'D'),
    (39, 'Thomas', 'Gregoire', 25, 'CAN', 'D'),
    (40, 'Julius', 'Mattila', 26, 'FIN', 'C'),
    (41, 'Tarmo', 'Reunanen', 25, 'FIN', 'D'),
    (42, 'Jaakko', 'Rissanen', 34, 'FIN', 'C'),
    (43, 'Lasse', 'Lappalainen', 34, 'FIN', 'D'),
    (44, 'Anton', 'Karlsson', 30, 'SWE', 'D'),
    (45, 'Simon', 'Hjalmarsson', 35, 'SWE', 'LW'),
    (46, 'Axel', 'Holmström', 27, 'SWE', 'C'),
    (47, 'Shaun', 'Heshka', 38, 'CAN', 'D'),
    (48, 'Teemu', 'Turunen', 28, 'FIN', 'LW'),
    (49, 'Ludwig', 'Byström', 29, 'SWE', 'D'),
    (50, 'Marko', 'Anttila', 38, 'FIN', 'RW');
    
    
    
INSERT INTO PlayerStats VALUES
	(1, 60, 21, 13, 32, 14, -31, 2023, 1, 1),
    (2, 59, 4, 22, 26, 30, -19, 2023, 2, 1),
    (3, 60, 18, 14, 32, 28, 11, 2022, 1, 8),
    (4, 58, 20, 3, 23, 4, -17, 2023, 3, 1),
    (5, 33, 2, 8, 10, 8, -3, 2023, 4, 1),
    (6, 25, 1, 1, 2, 33, -7, 2023, 5, 1),
    (7, 59, 13, 4, 17, 10, -11, 2022, 3, 1),
    (8, 56, 11, 18, 29, 47, 9, 2022, 4, 3),
    (9, 25, 3, 3, 6, 14, -10, 2022, 5, 1),
    (10, 57, 11, 46, 57, 45, 5, 2023, 6, 2),
    (11, 18, 2, 6, 8, 2, 4, 2023, 7, 2),
    (12, 54, 17, 14, 44, 30, 6, 2023, 8, 2),
    (13, 43, 8, 34, 42, 22, -5, 2023, 9, 2),
    (14, 53, 4, 11, 15, 2, 9, 2023, 10, 2),
    (15, 59, 15, 28, 43, 8, 16, 2022, 10, 2),
    (16, 8, 3, 0, 3, 29, 0, 2022, 8, 2),
    (17, 55, 7, 8, 15, 6, -14, 2022, 7, 5),
    (18, 58, 12, 39, 51, 40, 0, 2023, 11, 3),
    (19, 53, 18, 24, 42, 10, 26, 2023, 12, 3),
    (20, 53, 17, 13, 30, 44, 8, 2023, 13, 3),
    (21, 54, 2, 7, 9, 16, 6, 2023, 14, 3),
    (22, 52, 8, 30, 38, 40, 1, 2022, 11, 3),
    (23, 56, 11, 11, 22, 34, 4, 2022, 12, 15),
    (24, 51, 7, 19, 26, 48, 3, 2022, 13, 5),
    (25, 56, 4, 5, 9, 18, 1, 2022, 14, 5),
    (26, 60, 20, 18, 38, 12, -5, 2023, 15, 4),
    (27, 59, 7, 16, 23, 73, -7, 2023, 16, 4),
    (28, 48, 3, 4, 7, 88, 5, 2023, 17, 4),
    (29, 60, 25, 39, 64, 18, 9, 2023, 18, 5),
    (30, 58, 14, 9, 23, 104, -3, 2023, 19, 5),
    (31, 47, 4, 14, 18, 14, 6, 2023, 20, 5),
    (32, 57, 18, 21, 39, 53, -4, 2023, 21, 6),
    (33, 57, 6, 26, 32, 45, 12, 2023, 22, 6),
    (34, 32, 9, 5, 5, 39, 4, 2023, 23, 6),
    (35, 60, 16, 24, 40, 12, -8, 2023, 24, 7),
    (36, 25, 7, 12, 19, 12, 5, 2023, 25, 7),
    (37, 36, 2, 17, 19, 12, 0, 2023, 26, 7),
    (38, 60, 20, 19, 39, 16, -12, 2023, 27, 8),
    (39, 59, 15, 23, 38, 8, 5, 2023, 28, 8),
    (40, 51, 11, 14, 25, 10, 3, 2023, 29, 8),
    (41, 58, 11, 18, 29, 18, -5, 2023, 30, 9),
    (42, 29, 7, 4, 11, 4, 6, 2023, 31, 9),
    (43, 55, 2, 9, 11, 51, 3, 2023, 32, 9),
    (44, 60, 12, 42, 54, 20, -3, 2023, 33, 10),
    (45, 54, 9, 33, 42, 26, 7, 2023, 34, 10),
    (46, 59, 27, 10, 37, 14, 12, 2023, 35, 10),
    (47, 51, 16, 15, 31, 28, -4, 2023, 36, 11),
    (48, 59, 7, 21, 28, 52, -11, 2023, 37, 11),
    (49, 60, 0, 4, 4, 24, 6, 2023, 38, 11),
    (50, 57, 13, 31, 44, 41, 23, 2023, 39, 12),
    (51, 58, 13, 24, 37, 14, 18, 2023, 40, 12),
    (52, 59, 10, 12, 22, 55, 3, 2023, 41, 12),
    (53, 57, 16, 34, 50, 26, 17, 2023, 42, 13),
    (54, 60, 12, 24, 36, 34, 1, 2023, 43, 13),
    (55, 49, 0, 7, 7, 41, -2, 2023, 44, 13),
    (56, 45, 12, 30, 42, 20, 3, 2023, 45, 14),
    (57, 49, 13, 27, 40, 16, 4, 2023, 46, 14),
    (58, 48, 3, 16, 19, 16, 3, 2023, 47, 14),
    (59, 56, 16, 25, 41, 18, 12, 2023, 48, 15),
    (60, 60, 6, 20, 26, 18, 5, 2023, 49, 15),
    (61, 58, 13, 4, 17, 18, -3, 2023, 50, 15),
    (62, 48, 15, 12, 27, 10, 2, 2021, 1, 3),
    (63, 29, 12, 8, 20, 24, 4, 2020, 1, 3),
    (64, 48, 24, 20, 44, 4, 3, 2018, 1, 3),
    (65, 44, 9, 11, 20, 4, -11, 2017, 1, 3),
    (66, 39, 6, 7, 13, 6, -6, 2016, 1, 3),
    (67, 10, 3, 0, 3, 0, -4, 2015, 1, 3);
    
    
    
    
    
INSERT INTO Arena VALUES
	(1, 'Kisapuisto', 1972, 4820, 'Lappeenranta'),
    (2, 'Nokia Arena', 2021, 13455, 'Tampere'),
    (3, 'Oulun Energia Areena', 1975, 6485, 'Oulu'),
    (4, 'Vaasan Sähkö Areena', 1971, 5200, 'Vaasa'),
    (5, 'Olvi Areena', 1979, 5300, 'Kuopio'),
    (6, 'Kivikylän Areena', 1970, 5400, 'Rauma'),
    (7, 'Isomäen jäähalli', 1971, 6150, 'Pori'),
    (8, 'LähiTapiola Areena', 1982, 4437, 'Jyväskylä'),
    (9, 'Gatorate Center', 1990, 11820, 'Turku'),
    (10, 'Lumon Areena', 1982, 6200, 'Kouvola'),
    (11, 'Ikioma Areena', 1982, 4200, 'Mikkeli'),
    (12, 'Isku Areena', 1973, 5371, 'Lahti'),
    (13, 'Pohjantähti Areena', 1979, 5360, 'Hämeenlinna'),
    (14, 'Helsingin jäähalli', 1966, 8200, 'Helsinki');


INSERT INTO Team VALUES 
  	(1, 'SaiPa', 'Lappeenranta', 1948, 1, 'yellow'),
    (2, 'Tappara', 'Tampere', 1932, 2, 'blue'),
	(3, 'Ilves', 'Tampere', 1931, 2, 'green'),
    (4, 'IFK', 'Helsinki', 1897, 14, 'red'),
    (5, 'HPK', 'Hämeenlinna', 1929, 4, 'orange'),
    (6, 'Pelicans', 'Lahti', 1996, 5, 'black'),
    (7, 'Jukurit', 'Mikkeli', 1970, 11, 'blue'),
    (8, 'KooKoo', 'Kouvola', 1965, 10, 'black'),
    (9, 'TPS', 'Turku', 1922, 9, 'black'),
    (10, 'JYP', 'Jyväskylä', 1923, 8, 'black'),
    (11, 'Ässät', 'Pori', 1967, 7, 'red'),
    (12, 'Lukko', 'Rauma', 1936, 6, 'blue'),
    (13, 'KalPa', 'Kuopio', 1929, 5, 'yellow'),
    (14, 'Sport', 'Vaasa', 1962, 4, 'red'),
    (15, 'Kärpät', 'Oulu', 1946, 3, 'black');
    

    
INSERT INTO TeamStats VALUES 
	(1, 60, 33, 6, 16, 5, 116, 2023, 2),
    (2, 60, 32, 7, 17, 4, 114, 2023, 3),
    (3, 60, 28, 8, 19, 5, 105, 2023, 12),
    (4, 60, 30, 4, 21, 5, 103, 2023, 6),
    (5, 60, 28, 5, 19, 8, 102, 2023, 13),
    (6, 60, 24, 8, 19, 9, 97, 2023, 4),
    (7, 60, 24, 7, 19, 10, 96, 2023, 15),
    (8, 60, 25, 5, 24, 6, 91, 2023, 11),
    (9, 60, 21, 10, 21, 8, 91, 2023, 9),
    (10, 60, 19, 11, 25, 5, 84, 2023, 8),
    (11, 60, 24, 5, 30, 1, 83, 2023, 7),
    (12, 60, 17, 9, 20, 14, 83, 2023, 5),
    (13, 60, 17, 9, 29, 5, 74, 2023, 10),
    (14, 60, 16, 3, 32, 9, 63, 2023, 14),
    (15, 60, 8, 7, 35, 10, 48, 2023, 1),
    (16, 60, 31, 9, 16, 4, 115, 2022, 2),
    (17, 60, 31, 8, 16, 4, 113, 2022, 7),
    (18, 60, 28, 10, 15, 7, 111, 2022, 3),
    (19, 60, 29, 6, 22, 3, 102, 2022, 9),
    (20, 59, 27, 5, 19, 8, 99, 2022, 4),
    (21, 60, 24, 7, 20, 9, 95, 2022, 15),
    (22, 60, 24, 9, 22, 5, 95, 2022, 5),
    (23, 60, 25, 5, 21, 9, 94, 2022, 8),
    (24, 60, 25, 4, 21, 10, 93, 2022, 6),
    (25, 58, 24, 5, 22, 7, 89, 2022, 12),
    (26, 60, 19, 9, 19, 13, 88, 2022, 13),
    (27, 59, 18, 8, 26, 7, 77, 2022, 14),
    (28, 60, 14, 8, 34, 4,62, 2022, 10),
    (29, 60, 15, 3, 25, 7, 58, 2022, 1),
    (30, 60, 11, 7, 36, 6, 53, 2022, 11);
    
INSERT INTO Referee VALUES 
	(1, 'Kristian', 'Vikman', 26, 'Referee'),
    (2, 'Riku', 'Brander', 19, 'Referee'),
    (3, 'Petri', 'Lindqvist', 14, 'Referee'),
    (4, 'Stefan', 'Fonselius', 21, 'Referee'),
    (5, 'Timo', 'Ruuska', 10, 'Referee'),
    (6, 'Aleksi', 'Rantala', 25, 'Referee');
    
INSERT INTO Linesman VALUES
    (1, 'Samuli', 'Niskanen', 41, 'Linseman'),
    (2, 'Jusi', 'Niko', 74, 'Linesman'),
    (3, 'Juho-Pekka', 'Inkinen', 77, 'Linesman'),
    (4, 'Joni', 'Pekkala', 72, 'Linesman'),
    (5, 'Jussi', 'Thomann', 37, 'Linesman'),
    (6, 'Santeri', 'Puhakka', 50, 'Linesman');
     

INSERT INTO Game VALUES 
	(1, '1-6', '16.10.2022', 2023, 1, 2, 3, 5, 1, 4, 1),
    (2, '2-3 OT', '16.10.2022', 2023, 3, 4, 1, 4, 2, 5, 2),
    (3, '5-2', '16.10.2022', 2023, 5, 6, 2, 6, 3, 6, 13),
    (4, '2-0', '19.10.2022', 2023, 7, 8, 1, 2, 1, 2, 11),
    (5, '4-2', '19.10.2022', 2023, 9, 10, 3, 4, 3, 4, 9),
    (6, '1-3', '19.10.2022', 2023, 11, 12, 5, 6, 5, 6, 6),
    (7, '3-0', '02.12.2022', 2023, 13, 14, 1, 3, 1, 3, 5),
    (8, '8-1', '02.12.2022', 2023, 15, 1, 4, 6, 4, 6, 3),
    (9, '4-2', '02.12.2022', 2023, 2, 3, 2, 5, 2, 5, 2),
    (10, '3-1', '06.12.2022', 2023, 4, 5, 1, 2, 1, 2, 14),
    (11, '2-5', '06.12.2022', 2023, 6, 7, 3, 4, 3, 4, 12),
    (12, '5-3', '06.12.2022', 2023, 8, 9, 5, 6, 5, 6, 10),
    (13, '1-0', '10.01.2023', 2023, 10, 11, 1, 3, 1, 3, 8),
    (14, '5-4 OT', '10.01.2023', 2023, 12, 13, 2, 4, 2, 4, 6),
    (15, '2-6', '10.01.2023', 2023, 14, 15, 5, 6, 5, 6, 4);
    
    
INSERT INTO PlayerGame VALUES
	(1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),
    (11, 2),
    (12, 2),
    (13, 2),
    (14, 2),
    (15, 2),
    (16, 2),
    (17, 2),
    (18, 3),
    (19, 3),
    (20, 3),
    (21, 3),
    (22, 3),
    (23, 3),
    (24, 4),
    (25, 4),
    (26, 4),
    (27, 4),
    (28, 4),
    (29, 4),
    (30, 5),
    (31, 5),
    (32, 5),
    (33, 5),
    (34, 5),
    (35, 5),
    (36, 5),
    (36, 6),
    (37, 6),
    (38, 6),
    (39, 6),
    (40, 6),
    (41, 6),
    (42, 7),
    (43, 7),
    (44, 7),
    (45, 7),
    (46, 7),
    (47, 7),
    (48, 8),
    (49, 8),
    (50, 8),
    (1, 8),
    (2, 8),
    (3, 8),
    (4, 8),
    (5, 8),
    (6, 9),
    (7, 9),
    (8, 9),
    (9, 9),
    (10, 9),
    (11, 9),
    (12, 9),
    (13, 9),
    (14, 9),
    (15, 10),
    (16, 10),
    (17, 10),
    (18, 10),
    (19, 10),
    (20, 10),
    (21, 11),
    (22, 11),
    (23, 11),
    (24, 11),
    (25, 11),
    (26, 11),
    (27, 12),
    (28, 12),
    (29, 12),
    (30, 12),
    (31, 12),
    (32, 12),
    (33, 13),
    (34, 13),
    (35, 13),
    (36, 13),
    (37, 13),
    (38, 13),
    (39, 14),
    (40, 14),
    (41, 14),
    (42, 14),
    (43, 14),
    (44, 14),
    (45, 15),
    (46, 15),
    (47, 15),
    (48, 15),
    (49, 15),
    (50, 15);
    
  /* Query 1: This query will show each team in Liiga and their arena name, built year and capacity. The table is ordered from the most historic team to the most recently founded.
 */  
  SELECT Team.name AS Name, Team.founded AS Founded, Team.homeTown AS Location, Arena.arenaName AS Arena, Arena.builtYear AS Built, Arena.capacity AS Capacity FROM Team
  INNER JOIN Arena ON Team.arenaId = Arena.arenaId
  ORDER BY Team.founded ASC;
 
 
 /*  Query 2: This query will show up the regular season league table in Liiga season 2022-23. Also there is a change to find out the league table in season 2021-2022 if you just change the season to 2022.             
*/
  SELECT ROW_NUMBER() OVER (ORDER BY TeamStats.points DESC) AS Rank, Team.name AS Team, TeamStats.season AS Season, TeamStats.gamesPlayed AS GP, TeamStats.regTimeWins AS W, TeamStats.regTimeLosses AS L, TeamStats.otWins AS OTW, TeamStats.otLosses AS OTL, TeamStats.points AS P FROM TeamStats
  INNER JOIN Team ON TeamStats.teamId = Team.teamId
  WHERE TeamStats.season = 2023
  ORDER BY TeamStats.points DESC,
  TeamStats.regTimeWins DESC,
  TeamStats.otWins;

/* Query 3: This query shows regular season games that were played in 02.12.2022. The query will show the date of the game, home and away teams, the result, the venue where the game was played (home team's arena and city) as well as the referees and linesman who took part in the game. Taking the WHERE Game.gameDay condition off all games that are stored in the database are stored (it has been taken into account that no same refs or linesman nor teams can be in two games at the same date)
*/

SELECT Game.gameDay AS Date, HomeTeam.name AS Home, AwayTeam.name AS Away, Game.result as Result, Arena.arenaName || ', ' || Arena.homeTown AS Venue, Ref1.firstName || ' ' || Ref1.lastName || ', ' || Ref2.firstName || ' ' || Ref2.lastName AS Referees, Lin1.firstName || ' ' || Lin1.lastName || ', ' || Lin2.firstName || ' ' || Lin2.lastName AS Linesmen FROM Game
  INNER JOIN Team AS HomeTeam ON Game.homeTeamId = HomeTeam.teamId
  INNER JOIN Team AS AwayTeam ON Game.awayTeamId = AwayTeam.teamId
  INNER JOIN Arena ON HomeTeam.arenaId = Arena.arenaId
  INNER JOIN Referee AS Ref1 ON Game.ref1Id = Ref1.refereeId
  INNER JOIN Referee AS Ref2 ON Game.ref2Id = Ref2.refereeId
  INNER JOIN Linesman AS Lin1 ON Game.linesman1Id = Lin1.linesmanId
  INNER JOIN Linesman AS Lin2 ON Game.linesman2Id = Lin2.linesmanId
  WHERE Game.gameDay = '02.12.2022';

/* Query 4: This query shows all player stats in season 2022-23 ordered by points. If total points are the same, the one who has more goals is above.
*/
SELECT ROW_NUMBER() OVER (ORDER BY PlayerStats.points DESC, PlayerStats.goals DESC) AS Rank, Player.firstName || ' ' || Player.lastName AS Name, PlayerStats.season AS Season, Team.name AS Team, Player.position AS POS, PlayerStats.gamesPlayed AS GP, PlayerStats.goals AS G, PlayerStats.assists AS A, PlayerStats.points AS P, PlayerStats.penaltyMinutes AS PM, PlayerStats.plusMinus AS '+/-' FROM Player 
  INNER JOIN PlayerStats ON Player.playerId = PlayerStats.playerId
  INNER JOIN Team ON PlayerStats.teamId = Team.teamId
  WHERE  PlayerStats.season = 2023 
  ORDER BY PlayerStats.points DESC,
  PlayerStats.goals DESC;



/* Query 5: This query shows the selected team's player stats in season 2022-23 ordered by points. If total points are the same, the one who has more goals is above. This uses index team_index because the index makes the query faster as it orders players by team and HPK players are found instantly.
*/
SELECT ROW_NUMBER() OVER (ORDER BY PlayerStats.points DESC, PlayerStats.goals DESC) AS Rank, Player.firstName || ' ' || Player.lastName AS Name, PlayerStats.season AS Season, Team.name AS Team, Player.position AS POS, PlayerStats.gamesPlayed AS GP, PlayerStats.goals AS G, PlayerStats.assists AS A, PlayerStats.points AS P, PlayerStats.penaltyMinutes AS PM, PlayerStats.plusMinus AS '+/-' FROM Player 
  INNER JOIN PlayerStats ON Player.playerId = PlayerStats.playerId
  INNER JOIN Team ON PlayerStats.teamId = Team.teamId
  WHERE  PlayerStats.season = 2023 AND Team.name = 'HPK'
  ORDER BY PlayerStats.points DESC,
  PlayerStats.goals DESC;

/*
Query 6: This query will show the chosen player's statistical history of all seasons that are stored in the database. In this example, Ville Meskanen's history is shown in ascending order that the current season is the latest.
*/
  SELECT Player.firstName || ' ' || Player.lastName AS Name, PlayerStats.season AS Season, Team.name AS Team, PlayerStats.gamesPlayed AS GP,
  PlayerStats.goals AS G, PlayerStats.assists AS A, PlayerStats.points AS P, PlayerStats.penaltyMinutes AS PM, PlayerStats.plusMinus AS '+/-'
  FROM Player
  INNER JOIN PlayerStats On Player.playerId = PlayerStats.playerId
  INNER JOIN Team ON PlayerStats.teamId = Team.teamId
  WHERE Player.lastName = 'Meskanen'
  ORDER BY PlayerStats.season ASC
  ;
  
 
/*
Query 7: This query will show career stats from chosen player that combines every seasons statistics into career stats. In this example the career stats of Ville Meskanen is shown.
*/
 
 
SELECT Player.firstName || ' ' || Player.lastName AS 'Career stats for', SUM(PlayerStats.gamesPlayed) AS GP, SUM(PlayerStats.goals) AS G, SUM(PlayerStats.assists) AS S, SUM(PlayerStats.points) AS P, SUM(PlayerStats.penaltyMinutes) AS PM, SUM(PlayerStats.plusMinus) AS '+/-' FROM Player
INNER JOIN PlayerStats ON Player.playerId = PlayerStats.playerId
WHERE Player.lastName = 'Meskanen';
  
 
 /* Query 8: This is m:n query as many players can attend many games and many games can have many players. This query will show the player that took part on their respective games in 02.12.2022. This will show in which team the player played in the game as well as information of the specific game.
 */
 
 SELECT Game.gameDay AS Date, HomeTeam.name AS Home, AwayTeam.name AS Away, 
    Game.result AS Result,
    (SELECT GROUP_CONCAT(Player.firstName || ' ' || Player.lastName) FROM Player
     INNER JOIN PlayerGame ON Player.playerId = PlayerGame.playerId
     INNER JOIN PlayerStats ON PlayerGame.playerId = PlayerStats.playerId
     WHERE PlayerGame.gameId = Game.gameId 
       AND PlayerStats.teamId = HomeTeam.teamId
       AND PlayerStats.season = 2023) AS 'Home Players',
    (SELECT GROUP_CONCAT(Player.firstName || ' ' || Player.lastName)
     FROM Player
     INNER JOIN PlayerGame ON Player.playerId = PlayerGame.playerId
     INNER JOIN PlayerStats ON PlayerGame.playerId = PlayerStats.playerId
     WHERE PlayerGame.gameId = Game.gameId 
       AND PlayerStats.teamId = AwayTeam.teamId
       AND PlayerStats.season = 2023) AS 'Away Players'
FROM Game
INNER JOIN Team AS HomeTeam ON Game.homeTeamId = HomeTeam.teamId
INNER JOIN Team AS AwayTeam ON Game.awayTeamId = AwayTeam.teamId
WHERE Game.gameDay = '02.12.2022'
ORDER BY Game.gameId;