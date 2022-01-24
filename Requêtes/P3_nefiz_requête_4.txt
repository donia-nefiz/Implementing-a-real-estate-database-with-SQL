#4. Prix moyen du mètre carré d’une maison en Île-de-France :

/*
1. Je calcule le prix moyen du m² en appliquant un AVG sur la Valeur_Fonciere divisé par la SurfReel...
2. ... à l'aide d'une jointure entre les tables commune, bien et vente
3. Je filtre sur les maisons en appliquant un WHERE sur le TypLocal
4. J'ajoute un filtre avec un AND sur les CodeDept 75, 77, 78, 91, 92, 93, 94, 95
5. Je formate l'affichage du résultat en lui appliquant un ROUND
*/

SELECT ROUND(AVG(Valeur_Fonciere/SurfReel),2) AS "Prix moyen du mètre carré d’une maison en Île-de-France"
FROM vente
JOIN bien
ON vente.Id_bien=bien.Id_bien
JOIN commune
ON commune.Id_com=bien.Id_com
WHERE TypLocal="Maison"
AND CodeDept IN (75,77,78,91,92,93,94,95);