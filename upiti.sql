--1 Izlistaj sve automobile koji su trenutno iznajmljeni:

SELECT 
      Automobil.marka
FROM Automobil
JOIN Najam ON Automobil.ID_Automobila = Najam.ID_Automobila
WHERE CURRENT_DATE BETWEEN Najam.DatumPocetkaNajma AND Najam.DatumZavrsetkaNajma;


--2  Pronađi sve automobile određene kategorije:

SELECT *
FROM Automobil
WHERE ID_Automobila
 IN (SELECT ID_Automobila FeROM KategorijaAutomobila
  WHERE NazivKategorije = 'Sportski Automobil');

--3 Pronađi klijente koji su iznajmili najskuplje automobile

SELECT Klijent.ime
FROM Klijent
JOIN Najam ON Klijent.ID_Klijenta = Najam.ID_Klijenta
JOIN Automobil ON Najam.ID_Klijenta = Automobil.ID_Automobila
WHERE Najam.UkupnaCijena = (
    SELECT MAX(UkupnaCijena)
    FROM Najam
);


