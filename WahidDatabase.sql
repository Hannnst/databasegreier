
DROP SCHEMA IF EXISTS oblig2020 ;
CREATE SCHEMA IF NOT EXISTS oblig2020;


USE oblig2020;

CREATE TABLE Student(
Studentnr INT NOT NULL,
Fornavn VARCHAR ( 255),
Etternavn VARCHAR(255),
Epost VARCHAR (255),
Telefon VARCHAR(12),

CONSTRAINT Student_number PRIMARY KEY (Studentnr) 
);

CREATE TABLE Emne(
Emnekode VARCHAR (20) NOT NULL ,
Emnenavn VARCHAR(30),
Studiepoeng VARCHAR(12),

CONSTRAINT Emne_kode PRIMARY KEY (Emnekode)
);

CREATE TABLE Rom(
Romnr VARCHAR(8) NOT NULL,
Antallplasser VARCHAR (10),

CONSTRAINT Rom_number PRIMARY KEY(Romnr)
);

CREATE TABLE  Eksamen (
Emnekode VARCHAR (20) NOT NULL,
Dato DATE  NOT NULL,
Romnr VARCHAR(6)NOT NULL ,


CONSTRAINT Emne_Kode_dato  PRIMARY KEY (Emnekode, Dato),
CONSTRAINT Emnekode  FOREIGN KEY (Emnekode) REFERENCES Emne(Emnekode),
CONSTRAINT Romnr  FOREIGN KEY (Romnr) REFERENCES Rom(Romnr)

);





CREATE TABLE Eksamensresultat
(
Studentnr INT  NOT NULL,
Emnekode VARCHAR (20) NOT NULL ,
Dato DATE  NOT NULL,
Karakter VARCHAR (10),


CONSTRAINT Emne_Kode_dato_Studentnr_PK PRIMARY KEY  (Emnekode, Dato,Studentnr),

CONSTRAINT Dato_FK FOREIGN KEY  (Emnekode, Dato) REFERENCES Eksamen (Emnekode, Dato),
CONSTRAINT  Emnekode_Emne FOREIGN KEY (Emnekode) REFERENCES Emne (Emnekode),
CONSTRAINT Studentnr_FK FOREIGN KEY  (Studentnr) REFERENCES Student (Studentnr)

);










INSERT INTO Student  VALUES(1000,'wahid','rahmani','wahid@gmail.com','22349494');
INSERT INTO Student  VALUES(3000,'jabar','rahmani','Jabar@gmail.com','20202020');




INSERT INTO Emne Values('D100','database','D');
INSERT INTO Emne Values('P200','Python','C');




INSERT INTO Rom Values ('R200','24');
INSERT INTO Rom Values ('R300','50');



INSERT INTO Eksamen Values ('D100','2020-02-02','R200');
INSERT INTO Eksamen Values ('P200','2020-02-05','R300');








INSERT INTO Eksamensresultat  VALUES(1000,'D100','2020-02-02','D');
INSERT INTO Eksamensresultat  VALUES(3000,'P200','2020-02-05','C');






CREATE USER Eksamenssjef;


GRANT SELECT, INSERT, DELETE, UPDATE ON oblig2020.* TO Eksamenssjef;


Set Password for Eksamenssjef ='oblig2020';




Select * from Eksamensresultat;


Select * from Student;






