#1. Nombre total d’appartements vendus au 1er semestre 2020 :

/* 
1. Je compte le nombre de ventes en appliquant un COUNT sur l'Id_vente
2. Je joins la table vente à la table bien
3. Je filtre sur les appartements en appliquant un WHERE sur le TypLocal
4. J'ajoute un filtre sur le 1er semestre 2020 avec un AND DatVente BETWEEN "AAAA-MM-JJ" AND "AAAA-MM-JJ" 
*/

SELECT COUNT(Id_vente) AS "Total des appartements vendus au 1er semestre 2020"
FROM vente
INNER JOIN bien 
ON vente.Id_bien=bien.Id_bien
WHERE TypLocal="Appartement"
AND DatVente BETWEEN "2020-01-01" and "2020-06-30";