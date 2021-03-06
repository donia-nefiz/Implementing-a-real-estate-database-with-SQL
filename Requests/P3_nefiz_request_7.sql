#7. Liste des communes où le nombre de ventes a augmenté d'au moins 20% entre le premier et le second trimestre de 2020 :

/*
1. Je crée deux tables éphémères avec WITH :
	a. Je calcule le nombre de ventes par commune au 1er trimestre 2020 en appliquant un COUNT sur l'Id_vente, 
		je filtre sur le 1er trimestre 2020 avec un WHERE DatVente BETWEEN "AAAA-MM-JJ" AND "AAAA-MM-JJ" 
		et je regroupe les valeurs par Id_com avec un GROUP BY Id_com
	b. Je calcule le nombre de ventes par commune au 2ème trimestre 2020 en appliquant un COUNT sur l'Id_vente, 
		je filtre sur le 2ème trimestre 2020 avec un WHERE DatVente BETWEEN "AAAA-MM-JJ" AND "AAAA-MM-JJ" 
		et je regroupe les valeurs par Id_com avec un GROUP BY Id_com
2. Je calcule le taux d'évolution du nombre de ventes entre le 1er et le 2ème trimestre 2020
3. Je filtre sur les communes ayant un taux supérieur ou égal à 20%
4. Je regroupe les valeurs par Commune
5. Et je formate le résultat final en lui appliquant un ROUND
*/

WITH

Ventes_1er_trim AS (
	SELECT
        Commune,
        COUNT(Id_vente) AS "Nbre_ventes_1er_trim"
		FROM vente
        JOIN bien
        ON vente.Id_bien=bien.Id_bien
        JOIN commune
        ON bien.Id_com=commune.Id_com
        WHERE DatVente BETWEEN "2020-01-01" AND "2020-03-31"
		GROUP BY Commune
),

Ventes_2eme_trim AS (
	SELECT
        Commune,
        COUNT(Id_vente) AS "Nbre_ventes_2eme_trim"
		FROM vente
        JOIN bien
        ON vente.Id_bien=bien.Id_bien
        JOIN commune
        ON bien.Id_com=commune.Id_com
        WHERE DatVente BETWEEN "2020-04-01" AND "2020-06-30"
        GROUP BY Commune
)
	SELECT
        commune.Commune,
		((Nbre_ventes_2eme_trim - Nbre_ventes_1er_trim)/Nbre_ventes_2eme_trim)*100 AS "Taux_evol_1er_2eme_trim_2020"
		FROM Ventes_1er_trim,
        Ventes_2eme_trim
        JOIN commune
        ON Ventes_2eme_trim.Id_com=commune.Id_com
        WHERE ((Nbre_ventes_2eme_trim - Nbre_ventes_1er_trim)/Nbre_ventes_2eme_trim)*100 >= 20
        GROUP BY Commune;