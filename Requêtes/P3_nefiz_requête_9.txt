#9. Les moyennes de valeurs foncières pour le top 3 des communes des départements 6, 13, 33, 59 et 69 :

/*
1. Je crée une table éphémère avec WITH :
	a. Je calcule la moyenne des Valeur_Foncière par Commune et CodeDept
	b. Je réalise un top 3 des communes ayant les Valeurs_Foncière moyennes 
    les plus élevées pour les départements 6, 13, 33, 59, 69
2. Je sélectionne la valeur_moyenne de mon top 3 calculé dans ma table éphémère,
les CodeDept (6, 13, 33, 59, 69), les Commune associées ainsi que leur classement
3. Et je formate la valeur_moyenne de ma table rankvaleurcommune en lui appliquant un ROUND
*/

WITH

rankvaleurcommune AS(
SELECT 
		CodeDept,
		Commune,
		ROUND(AVG(Valeur_Fonciere),2) AS "valeur_moyenne",
		RANK() OVER (PARTITION BY CodeDept ORDER BY AVG(Valeur_Fonciere) DESC) AS ranking
	FROM commune
	JOIN bien
    ON commune.Id_com=bien.Id_com
	JOIN vente 
    ON bien.Id_bien=vente.Id_bien
	WHERE CodeDept IN (6, 13, 33, 59, 69)
	GROUP BY CodeDept, Commune
)
SELECT
	CodeDept AS "Département",
	Commune AS "Commune",
    valeur_moyenne AS "Moyenne des valeurs foncières",
	ranking AS "Classement"
FROM rankvaleurcommune
WHERE ranking < 4