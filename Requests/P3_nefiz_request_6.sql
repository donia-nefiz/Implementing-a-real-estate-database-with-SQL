#6. Taux d’évolution du nombre de ventes entre le premier et le second trimestre de 2020 :

/*
1. Je crée deux tables éphémères avec WITH :
	a. Je calcule le nombre de ventes au 1er trimestre 2020 en appliquant un COUNT sur l'Id_vente
		et en filtrant sur le 1er trimestre 2020 avec un WHERE DatVente BETWEEN "AAAA-MM-JJ" AND "AAAA-MM-JJ"
	b. Je calcule le nombre de ventes au 2ème trimestre 2020 en appliquant un COUNT sur l'Id_vente 
		et en filtrant sur le 2ème trimestre 2020 avec un WHERE DatVente BETWEEN "AAAA-MM-JJ" AND "AAAA-MM-JJ"
2. Je calcule le taux d'évolution du nombre de ventes entre le 1er et le 2ème trimestre 2020
3. Je formate le résultat final en lui appliquant un ROUND
*/

WITH 

Ventes_1er_trim AS (
	SELECT 
		COUNT(Id_vente) AS "Nbre_ventes_1er_trim"
		FROM dataimmo.vente
        WHERE DatVente BETWEEN "2020-01-01" AND "2020-03-31"
),
Ventes_2eme_trim AS (
	SELECT 
		COUNT(Id_vente) AS "Nbre_ventes_2eme_trim"
		FROM dataimmo.vente
        WHERE DatVente BETWEEN "2020-04-01" AND "2020-06-30"
)
SELECT
		((Nbre_ventes_2eme_trim - Nbre_ventes_1er_trim)/Nbre_ventes_2eme_trim)*100 AS "Taux d’évolution du nombre de ventes entre le premier et le second trimestre de 2020 (%)"
		FROM Ventes_2eme_trim,
        Ventes_1er_trim;