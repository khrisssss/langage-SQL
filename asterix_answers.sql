USE asterix_db;

SELECT NumPotion, LibPotion, Formule, ConstituantPrincipal
FROM potion ;

SELECT NomCateg
FROM categorie
WHERE NbPoints = 3;

SELECT NomVillage
FROM village
WHERE NbHuttes > 35;

SELECT NumTrophee
FROM trophee
WHERE DatePrise BETWEEN '2052-05-01' AND '2052-06-30';

SELECT Nom
FROM habitant
WHERE Nom LIKE 'A%' AND Nom LIKE '%r%';

SELECT DISTINCT NumHab
FROM absorber
WHERE NumPotion IN (1, 3, 4);


SELECT trophee.NumTrophee, trophee.DatePrise, categorie.NomCateg, habitant.Nom
FROM trophee
JOIN categorie ON trophee.CodeCat = categorie.CodeCat
JOIN habitant ON trophee.NumPreneur = habitant.NumHab;

SELECT habitant.Nom
FROM habitant
JOIN village ON habitant.NumVillage = village.NumVillage
WHERE village.NomVillage = 'Aquilona';


SELECT DISTINCT habitant.Nom
FROM habitant
JOIN trophee ON habitant.NumHab = trophee.NumPreneur
JOIN categorie ON trophee.CodeCat = categorie.CodeCat
WHERE categorie.NomCateg = 'Bouclier de Légat';

SELECT potion.LibPotion, potion.Formule, potion.ConstituantPrincipal
FROM potion
JOIN fabriquer ON potion.NumPotion = fabriquer.NumPotion
JOIN habitant ON fabriquer.NumHab = habitant.NumHab
WHERE habitant.Nom = 'Panoramix';


SELECT DISTINCT potion.LibPotion
FROM potion
JOIN absorber ON potion.NumPotion = absorber.NumPotion
JOIN habitant ON absorber.NumHab = habitant.NumHab
WHERE habitant.Nom = 'Homéopatix';

SELECT DISTINCT habitant.Nom
FROM habitant
JOIN absorber ON habitant.NumHab = absorber.NumHab
JOIN fabriquer ON absorber.NumPotion = fabriquer.NumPotion
WHERE fabriquer.NumHab = 3;


SELECT DISTINCT buveur.Nom
FROM habitant AS buveur
JOIN absorber ON buveur.NumHab = absorber.NumHab
JOIN fabriquer ON absorber.NumPotion = fabriquer.NumPotion
JOIN habitant AS fabricant ON fabriquer.NumHab = fabricant.NumHab
WHERE fabricant.Nom = 'Amnésix';

SELECT Nom
FROM habitant
WHERE NumQualite IS NULL;

SELECT habitant.Nom
FROM habitant
JOIN absorber ON habitant.NumHab = absorber.NumHab
JOIN potion ON absorber.NumPotion = potion.NumPotion
WHERE potion.LibPotion = 'Potion magique n°1' 
AND absorber.DateA BETWEEN '2052-02-01' AND '2052-02-29';

SELECT Nom, Age
FROM habitant
ORDER BY Nom ASC;

SELECT resserre.NomResserre, village.NomVillage
FROM resserre
JOIN village ON resserre.NumVillage = village.NumVillage 
ORDER BY resserre.Superficie DESC;

SELECT COUNT(*) 
FROM habitant
WHERE NumVillage = 5;

SELECT SUM(categorie.NbPoints)
FROM habitant
JOIN trophee ON habitant.NumHab = trophee.NumPreneur
JOIN categorie ON trophee.CodeCat = categorie.CodeCat
WHERE habitant.Nom = 'Goudurix';

SELECT MIN(DatePrise)
FROM trophee;v

SELECT SUM(absorber.Quantite)
FROM absorber
JOIN potion ON absorber.NumPotion = potion.NumPotion
WHERE potion.LibPotion = 'Potion magique n°2';

SELECT MAX(Superficie)
FROM resserre;

SELECT village.NomVillage, COUNT(*)
FROM village
JOIN habitant ON village.NumVillage = habitant.NumVillage
GROUP BY village.NomVillage;

SELECT habitant.Nom, COUNT(trophee.NumTrophee)
FROM habitant
JOIN trophee ON habitant.NumHab = trophee.NumPreneur
GROUP BY habitant.Nom;


SELECT AVG(NbPoints) 
FROM categorie;


SELECT MAX(LENGTH(Nom))
FROM habitant;

SELECT province.NomProvince, AVG(habitant.Age)
FROM habitant
JOIN village ON habitant.NumVillage = village.NumVillage
JOIN province ON village.NumProvince = province.NumProvince
GROUP BY province.NomProvince;


SELECT habitant.Nom, COUNT(DISTINCT absorber.NumPotion)
FROM habitant
JOIN absorber ON habitant.NumHab = absorber.NumHab
GROUP BY habitant.Nom;


SELECT DISTINCT habitant.Nom
FROM habitant
JOIN absorber ON habitant.NumHab = absorber.NumHab
JOIN potion ON absorber.NumPotion = potion.NumPotion
WHERE potion.LibPotion = 'Potion Zen' 
AND absorber.Quantite > 2;

SELECT habitant.Nom
FROM habitant
LEFT JOIN absorber ON habitant.NumHab = absorber.NumHab
WHERE absorber.NumHab IS NULL;




