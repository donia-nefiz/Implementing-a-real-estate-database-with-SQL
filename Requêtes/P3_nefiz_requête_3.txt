#3. Liste des 10 départements où le prix du mètre carré est le plus élevé :

/*
1. Je calcule le prix moyen du m² à l'aide de la colonne Valeur_Fonciere et SurfReel...
2. ... à l'aide d'une jointure entre les tables commune, bien et vente
3. Je regroupe les valeurs par département en appliquant un GROUP BY sur le CodeDept
4. Je trie les valeurs par ordre décroissant en appliquant un ORDER BY sur le prix moyen du m² DESC
5. Je limite le nombre de valeurs à 10 lignes en appliquant un LIMIT 10
*/

SELECT CodeDept AS "Liste des 10 départements où le prix du m² est le plus élevé",
(SUM(Valeur_Fonciere) / SUM(SurfReel)) AS "Prix moyen du m²"
FROM commune
JOIN bien
ON commune.Id_com=bien.Id_com
JOIN vente
ON bien.Id_bien=vente.Id_bien
GROUP BY CodeDept
ORDER BY SUM(Valeur_Fonciere) / SUM(SurfReel) desc
LIMIT 10;