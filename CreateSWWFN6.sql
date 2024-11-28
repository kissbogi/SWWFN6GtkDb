CREATE TABLE Gazdak(
  	gazda_id INT PRIMARY KEY,
  	nev VARCHAR(40) NOT NULL,
  	cim_iranyitoszam CHAR(4),
  	cim_varos VARCHAR(40),
  	cim_utca VARCHAR(50),
  	cim_hazszam VARCHAR(3),
  	telefonszam CHAR(11)
);

CREATE TABLE Allatok(
  	allat_id INT PRIMARY KEY,
  	nev VARCHAR(10) NOT NULL,
  	faj varchar(15),
  	kor INT CHECK(kor>=0),
  	gazda_id INT NOT NULL,
  	FOREIGN KEY(gazda_id) REFERENCES Gazdak(gazda_id)
  );


CREATE TABLE EgzotikusOrvos(
  	engedely_id INT PRIMARY KEY,
  	orvos_id INT NOT NULL,
  	elvegzes_eve INT,
  	FOREIGN KEY (orvos_id) REFERENCES Orvosok(orvos_id)
);


CREATE TABLE Orvosok(
  	orvos_id INT PRIMARY KEY,
  	nev VARCHAR(40) NOT NULL,
  	telefonszam CHAR(11)
);

CREATE TABLE Orvos_Szakterulet(
  	orvos_id INT,
  	szakterulet VARCHAR(20),
  	PRIMARY KEY (orvos_id, szakterulet),
  	FOREIGN KEY (orvos_id) REFERENCES Orvosok(orvos_id)
);

CREATE TABLE Vizsgalatok(
  	vizsgalat_id INT PRIMARY KEY,
  	datum DATE NOT NULL,
  	tipus VARCHAR(20), 
  	allat_id NOT NULL,
  	orvos_id NOT NULL,
  	FOREIGN KEY(allat_id) REFERENCES Allatok(allat_id),
  	FOREIGN KEY(orvos_id) REFERENCES Orvosok(orvos_id)
);

CREATE TABLE Vizsgalatok_Orvosok(
    vizsgalat_id INT NOT NULL,
    orvos_id INT NOT NULL,
    atlag_idotartam INT,         
    vizsgalat_koltseg INT, 
    PRIMARY KEY (vizsgalat_id, orvos_id),
    FOREIGN KEY (vizsgalat_id) REFERENCES Vizsgalatok(vizsgalat_id),
    FOREIGN KEY (orvos_id) REFERENCES Orvosok(orvos_id)
  );

CREATE TABLE Kezelesek(
  	kezeles_id INT PRIMARY KEY,
  	tipus VARCHAR(20),
  	datum DATE NOT NULL,
  	vizsgalat_id INT not NULL,
  	orvos_id INT NOT NULL,
  	FOREIGN KEY(vizsgalat_id) REFERENCES Vizsgalatok(vizsgalat_id),
  	FOREIGN KEY(orvos_id) REFERENCES Orvosok(orvos_id)
);
