CREATE TABLE Commune (
                Id_com INT AUTO_INCREMENT NOT NULL,
                CodeDept VARCHAR(3) NOT NULL,
                CodPost INT NOT NULL,
                CodCom INT NOT NULL,
                Commune VARCHAR(50) NOT NULL,
                PRIMARY KEY (Id_com)
);


CREATE TABLE Bien (
                Id_bien INT AUTO_INCREMENT NOT NULL,
                TypLocal VARCHAR(20) NOT NULL,
                AdPost VARCHAR(50) NOT NULL,
                NbrPieces INT NOT NULL,
                SurfCar DOUBLE PRECISIONS NOT NULL,
                SurfReel INT NOT NULL,
                SurfTer INT NOT NULL,
                NatCult VARCHAR(10),
                NatCultSpe VARCHAR(10),
                Id_com INT NOT NULL,
                PRIMARY KEY (Id_bien)
);


CREATE TABLE Vente (
                Id_vente INT AUTO_INCREMENT NOT NULL,
                Valeur_Fonciere DECIMAL,
                DatVente DATE NOT NULL,
                Commentaire VARCHAR(500),
                Id_bien INT NOT NULL,
                PRIMARY KEY (Id_vente)
);


ALTER TABLE Bien ADD CONSTRAINT commune_local_fk
FOREIGN KEY (Id_com)
REFERENCES Commune (Id_com)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Vente ADD CONSTRAINT bien_vente_fk
FOREIGN KEY (Id_bien)
REFERENCES Bien (Id_bien)
ON DELETE NO ACTION
ON UPDATE NO ACTION;