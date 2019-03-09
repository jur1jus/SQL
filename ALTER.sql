CREATE SCHEMA AlterPaskaita;

USE AlterPaskaita;

CREATE TABLE Asmenys (
	Id int auto_increment,
    Vardas varchar(100),
    CONSTRAINT PK_AsmensId PRIMARY KEY (Id)
);

insert into asmenys (Vardas) VALUES ('Jonas');

ALTER TABLE asmenys ADD COLUMN Pavarde varchar(200) NOT NULL;

ALTER TABLE asmenys ADD COLUMN TEST varchar(200) NOT NULL;

describe asmenys;

ALTER TABLE asmenys DROP COLUMN TEST;

DROP TABLE Asmenys;


RENAME TABLE tblasmenys TO asmenys;

select * from asmenys;

ALTER TABLE asmenys CHANGE COLUMN Pavarde Pavardė varchar(200) NOT NULL;


CREATE TABLE Uzsakymai (
	Id int primary key auto_increment,
    AsmensId int,
    CONSTRAINT FK_Uzsakymai_AsmensId 
    FOREIGN KEY (AsmensId) REFERENCES asmenys(Id)
);

insert into Uzsakymai (AsmensId) VALUES (1);


ALTER TABLE Uzsakymai CHANGE COLUMN AsmensId Asmeny_AsmensId int;


