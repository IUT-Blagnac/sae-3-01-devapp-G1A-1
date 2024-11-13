DROP TABLE Avis;
DROP TABLE ARegarder;
DROP TABLE ACommande;
DROP TABLE Commande;
DROP TABLE Client;
DROP TABLE Comporte;
DROP TABLE Image;
DROP TABLE Produit;
DROP TABLE MethodePayment;
DROP TABLE Categorie;
DROP TABLE Employer;

CREATE TABLE Employe {
    idNumEmployer NUMBER(5),
    nom VARCHAR(25),
	prenom VARCHAR(15),
	adressePostale VARCHAR(50),
	email VARCHAR(20),
	telephone CHAR(10),
    administrateur BOOLEAN,
    CONSTRAINT pk_Client PRIMARY KEY (idNumEmployer)
}

CREATE TABLE Categorie {
    idCategorie NUMBER(3),
    nomTypeCategorie VARCHAR(30),
    idCategoriePere Number(3),
    CONSTRAINT pk_TypeCategorie PRIMARY KEY (idTypeCategorie),
    CONSTRAINT fk_Categorie_Categorie FOREIGN key (idCategoriePere) REFERENCES Categorie(idCategorie)
}

CREATE TABLE MethodePayment {
    idMethodePayment NUMBER(6),
    methodePayment VARCHAR(15),
    CONSTRAINT pk_MethodePayment PRIMARY KEY (idMethodePayment)
}

CREATE TABLE Produit {
    idNumProduit NUMBER(6),
    idTypeCategorie NUMBER(3),
    nomProduit VARCHAR(50),
    prixActuel NUMBER(5),
    CONSTRAINT pk_Produit PRIMARY KEY (idNumProduit),
    CONSTRAINT fk_ Produit_Categorie
		FOREIGN KEY (idTypeCategorie) REFERENCES Categorie(idTypeCategorie)
}

CREATE TABLE Image {
    idNumProduit NUMBER(6),
    idImage NUMBER(6),
    urlImage VARCHAR(100),
    CONSTRAINT pk_Image PRIMARY KEY (idImage),
    CONSTRAINT fk_Image_Produit
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
}

CREATE TABLE Comporte {
    idNumProduit1 NUMBER(6),
    idNumProduit2 NUMBER(6),
    CONSTRAINT pk_Comporte PRIMARY KEY (idNumProduit1, idNumProduit2)
    CONSTRAINT fk_Comporte_Produit 
		FOREIGN KEY (idNumProduit1) REFERENCES Produit(idNumProduit),
	CONSTRAINT fk_Comporte_Produit 
		FOREIGN KEY (idNumProduit2) REFERENCES Produit(idNumProduit)
}

CREATE TABLE Client{
    idNumCli NUMBER(5),
    idCommande NUMBER(6),
    nom VARCHAR(25),
	prenom VARCHAR(15),
	adressePostale VARCHAR(50),
	email VARCHAR(20),
	telephone CHAR(10),
    CONSTRAINT pk_Client PRIMARY KEY (idNumCli)
}

--INSERT INTO Client VALUES (seq_id_client.NEXTVAL,'Gabin','Jean','3 rue t''as de beaux yeux tu sais, 31700 Blagnac','gabin@free.fr','0512345678','N',1);

CREATE TABLE Commande {
    idCommande NUMBER(6),
    idNumCli NUMBER(5),
    idMethodePayment NUMBER(6),
    dateCommande DATE,
    panierActuel BOOLEAN, -- Cette variable ne peut être vrai que pour une seule commande d'un client. Elle représente le panier actuel. 
                          -- Quand elle est fausse, elle représente des commandes déjà passées ce qui constitue l'historique de commande.
    CONSTRAINT pk_Commande PRIMARY KEY (idCommande),
    CONSTRAINT fk_Commande_Client
		FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_Commande_MethodePayment
		FOREIGN KEY (idMethodePayment) REFERENCES MethodePayment(idMethodePayment)
}   

CREATE TABLE ACommande {
    idCommande NUMBER(6),
    idNumProduit NUMBER(6),
    qte NUMBER(5),
    prixPayer NUMBER(5),
    CONSTRAINT pk_ACommande PRIMARY KEY (idCommande, idNumProduit)
    CONSTRAINT fk_Commande_Commande
		FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
	CONSTRAINT fk_ Commande_Produit
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
}

CREATE TABLE ARegarder {
    idNumCli NUMBER(5),
    idNumProduit NUMBER(6),
    dateRegar DATE,
    CONSTRAINT pk_ARegarder PRIMARY KEY (idNumCli, idNumProduit),
    CONSTRAINT fk_Avis_Client 
        FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
	CONSTRAINT fk_Comporte_Produit 
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
}

CREATE TABLE Avis {
    idNumCli NUMBER(6),
    idNumProduit NUMBER(6),
    tAvis VARCHAR(500),
    urlImage VARCHAR(100),
    CONSTRAINT pk_Avis PRIMARY KEY (idNumCli, idNumProduit),
    CONSTRAINT fk_Avis_Client 
        FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
	CONSTRAINT fk_Comporte_Produit 
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
}
