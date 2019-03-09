CREATE schema parduotuve;
use parduotuve;

CREATE TABLE Kvitai (
	Id int primary key auto_increment,
    Data date,
    Serija varchar(8),
    Numeris int,
    MoketinaSuma double,
    Graza double
);

CREATE TABLE Prekes (
	Id int primary key auto_increment,
    Pavadinimas varchar(500),
    Kaina double,
    KainaPvm double,
    MatVnt int
);

CREATE TABLE CekioPrekes
(
	Id int primary key auto_increment,
    KvitoId int NOT NULL,
    PrekesId int NOT NULL,
    Kiekis double,
    CONSTRAINT Kvitai_KvitoId FOREIGN KEY (KvitoId) REFERENCES Kvitai(Id),
    CONSTRAINT Prekes_PrekesId FOREIGN KEY (PrekesId) REFERENCES Prekes(Id)
);

insert into kvitai (Data, Serija, Numeris)
VALUES 
('2019-02-28', '288/3158', 100000),
('2019-03-01', '288/6526', 100001),
('2019-03-01', '288/2148', 100002),
('2019-03-01', '289/9871', 100003),
('2019-03-02', '289/7457', 100004);


SELECT Data, COUNT(1) AS 'Kvitu skaicius'
FROM kvitai
GROUP BY Data;

UPDATE Kvitai SET MoketinaSuma = 25.89 WHERE Id = 1;
UPDATE Kvitai SET MoketinaSuma = 14.15 WHERE Id = 2;
UPDATE Kvitai SET MoketinaSuma = 22.89 WHERE Id = 3;
UPDATE Kvitai SET MoketinaSuma = 34.78 WHERE Id = 4;
UPDATE Kvitai SET MoketinaSuma = 15.02 WHERE Id = 5;

SELECT Data, SUM(MoketinaSuma) AS 'Suma'
FROM kvitai
GROUP BY Data;

SELECT Data, ROUND(AVG(MoketinaSuma), 2) AS 'Vidurkis'
FROM kvitai
GROUP BY Data



