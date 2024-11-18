    CREATE TABLE Auto (
  	rendszam char(7) PRIMARY KEY NOT NULL,
  	tipus varchar(25) NOT NULL,
  	szin varchar(15),
  	kor int(11),
  	ar int(11),
  	tulaj int(11)
  );
  
CREATE TABLE Tulajdonos (
  	Ekód char(3) PRIMARY KEY NOT NULL,
  	Név char (15) NOT NULL,
  	Cím char(10),
  	Telefon int(10)
  );
  
  
  