#5. Liste des 10 appartements les plus chers avec le département et le nombre de mètres carrés :

/*
1. Je sélectionne l'Id_bien, la SurfReel, le CodeDept et la Valeur_Fonciere...
2. 2. ... à l'aide d'une jointure entre les tables commune, bien et vente
3. Je filtre sur les appartements en appliquant un WHERE sur le typLocal
4. Je trie les valeurs par ordre décroissant en appliquant un ORDER BY sur la Valeur_Fonciere
5. Je limite le nombre de valeurs à 10 lignes en appliquant un LIMIT 10
*/

SELECT bien.Id_bien AS "Liste des 10 appartements les plus chers (1er semestre 2020)",
SurfReel AS "Nombre de m2",
CodeDept AS "Département"
FROM bien
JOIN commune
ON commune.Id_com=bien.Id_com
JOIN vente
ON bien.Id_bien=vente.Id_bien
WHERE TypLocal="Appartement"
ORDER BY Valeur_Fonciere desc
LIMIT 10;