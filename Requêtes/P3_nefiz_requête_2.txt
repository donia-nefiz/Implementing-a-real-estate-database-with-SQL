#2. Proportion des ventes d’appartements par le nombre de pièces :

/* 
1. Je calcule la proportion des ventes
2. Je joins la table vente à la table bien
3. Je filtre sur les appartements en appliquant un WHERE sur le TypLocal
4. Je regroupe les valeurs par le nombre de pièces en appliquant un GROUP BY sur le NbrPieces
5. Je formate l'affichage des nombres décimaux en appliquant un ROUND
*/

SELECT (Nbrpieces), COUNT(*) * 100.0 / (SELECT COUNT(*) FROM vente) AS "Proportion des ventes d’appartements par le nombre de pièces"
FROM vente
JOIN bien
ON vente.Id_bien=bien.Id_bien
WHERE TypLocal="Appartement"
GROUP BY NbrPieces;