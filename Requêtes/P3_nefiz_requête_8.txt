#8. Différence en pourcentage du prix au mètre carré entre un appartement de 2 pièces et un appartement de 3 pièces :

/*
1. Je crée deux tables éphémères avec WITH :
	a. Je calcule le prix du m² pour un appartement 2 pièces en apliquant un AVG de la Valeur_Foncière divisé par la SurfReel, 
		je filtre sur les appartements avec un WHERE sur le TypLocal AND Nbrpieces = 2
	b. Je calcule le prix du m² pour un appartement 3 pièces en apliquant un AVG de la Valeur_Foncière divisé par la SurfReel, 
		je filtre sur les appartements avec un WHERE sur le TypLocal AND Nbrpieces = 3
2. Je calcule la différence en pourcentage du prix du m² pour un appartement de 2 pièces et un appartement de 3 pièces
3. Et je formate le résultat final en lui appliquant un ROUND
*/

WITH

Prix_m2_2p AS(
SELECT AVG((Valeur_Fonciere) / (SurfReel)) AS "2p"
		FROM vente
		JOIN bien
		ON vente.Id_bien=bien.Id_bien
		JOIN commune
		ON commune.Id_com=bien.Id_com
		WHERE TypLocal="Appartement"
		AND NbrPieces=2
),

Prix_m2_3p AS(
SELECT AVG((Valeur_Fonciere) / (SurfReel)) AS "3p"
		FROM vente
		JOIN bien
		ON vente.Id_bien=bien.Id_bien
		JOIN commune
		ON commune.Id_com=bien.Id_com
		WHERE TypLocal="Appartement"
		AND NbrPieces=3
)
SELECT	
		((3p-2p)/2p)*100 AS "Différence en pourcentage du prix au mètre carré entre un appartement de 2 pièces et un appartement de 3 pièces"
		FROM Prix_m2_3p,
        Prix_m2_2p;