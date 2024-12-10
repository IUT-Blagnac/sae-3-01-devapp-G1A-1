DROP TABLE IF EXISTS Avis;
DROP TABLE IF EXISTS ARegarde;
DROP TABLE IF EXISTS ACommande;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS MethodeEnregistrer;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Comporte;
DROP TABLE IF EXISTS Image;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS MethodePaiement;
DROP TABLE IF EXISTS Categorie;
DROP TABLE IF EXISTS Employe;

CREATE TABLE Employe (
    idNumEmployer INT(5),
    nom VARCHAR(25),
    prenom VARCHAR(15),
    adressePostale VARCHAR(50),
    email VARCHAR(20),
    telephone CHAR(10),
    administrateur TINYINT(1),
    CONSTRAINT pk_Employe PRIMARY KEY (idNumEmployer)
);

CREATE TABLE Categorie (
    idCategorie INT(3),
    nomTypeCategorie VARCHAR(30),
    idCategoriePere INT(3),
    CONSTRAINT pk_Categorie PRIMARY KEY (idCategorie),
    CONSTRAINT fk_Categorie_Categorie FOREIGN KEY (idCategoriePere) REFERENCES Categorie(idCategorie)
);

CREATE TABLE MethodePaiement (
    idMethodePaiement INT(6),
    nomMethodePaiement VARCHAR(20),
    CONSTRAINT pk_MethodePaiement PRIMARY KEY (idMethodePaiement),
    CONSTRAINT ck_MethodePaiement CHECK (nomMethodePaiement IN ('Paypal', 'Visa', 'Mastercard', 'Carte_AE'))
);

CREATE TABLE Paypal (
    idcarte INT(6),
    email VARCHAR(50),
    MDP VARCHAR(25),
    CONSTRAINT pk_Paypal PRIMARY KEY (idcarte)
);

CREATE TABLE Carte_EU (
    idcarte INT(6),
    numCarte BIGINT(16),
    dateExp INT(4),
    nomProp VARCHAR(50),
    CONSTRAINT pk_Carte_EU PRIMARY KEY (idcarte)
);

CREATE TABLE Carte_AE (
    idcarte INT(6),
    numCarte BIGINT(15),
    dateExp INT(4),
    nomProp VARCHAR(50),
    CONSTRAINT pk_Carte_AE PRIMARY KEY (idcarte)
    /* Note: MySQL cannot enforce pattern matching in CHECK constraints directly. */
);

CREATE TABLE Produit (
    idNumProduit INT(6),
    idTypeCategorie INT(3),
    nomProduit VARCHAR(50),
    prixActuel INT(5),
    CONSTRAINT pk_Produit PRIMARY KEY (idNumProduit),
    CONSTRAINT fk_Produit_Categorie FOREIGN KEY (idTypeCategorie) REFERENCES Categorie(idCategorie)
);

CREATE TABLE Image (
    idNumProduit INT(6),
    idImage INT(6),
    urlImage VARCHAR(100),
    CONSTRAINT pk_Image PRIMARY KEY (idImage),
    CONSTRAINT fk_Image_Produit FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

CREATE TABLE Comporte (
    idNumProduit1 INT(6),
    idNumProduit2 INT(6),
    CONSTRAINT pk_Comporte PRIMARY KEY (idNumProduit1, idNumProduit2),
    CONSTRAINT fk_Comporte_Produit1 FOREIGN KEY (idNumProduit1) REFERENCES Produit(idNumProduit),
    CONSTRAINT fk_Comporte_Produit2 FOREIGN KEY (idNumProduit2) REFERENCES Produit(idNumProduit)
);

CREATE TABLE Client (
    idNumCli INT(5),
    nom VARCHAR(25),
    prenom VARCHAR(15),
    adressePostale VARCHAR(50),
    email VARCHAR(20),
    telephone CHAR(10),
    CONSTRAINT pk_Client PRIMARY KEY (idNumCli)
);

CREATE TABLE infoPaiement (
    idNumCli INT(5),
    idcarte INT(6),
    idMethodePaiement INT(6),
    CONSTRAINT pk_infoPaiement PRIMARY KEY (idNumCli, idcarte, idMethodePaiement),
    CONSTRAINT fk_infoPaiement_Client FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_infoPaiement_MethodePaiement FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement),
    CONSTRAINT fk_infoPaiement_Paypal FOREIGN KEY (idcarte) REFERENCES Paypal(idcarte),
    CONSTRAINT fk_infoPaiement_Carte_EU FOREIGN KEY (idcarte) REFERENCES Carte_EU(idcarte),
    CONSTRAINT fk_infoPaiement_Carte_AE FOREIGN KEY (idcarte) REFERENCES Carte_AE(idcarte)
);

CREATE TABLE MethodeEnregistrer (
    idNumCli INT(5),
    idMethodePaiement INT(6),
    CONSTRAINT pk_MethodeEnregistrer PRIMARY KEY (idNumCli, idMethodePaiement),
    CONSTRAINT fk_MethodeEnregistrer_Client FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_MethodeEnregistrer_MethodePaiement FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement)
);

CREATE TABLE Commande (
    idCommande INT(6),
    idNumCli INT(5),
    idMethodePaiement INT(6),
    dateCommande DATE,
    panierActuel TINYINT(1),
    CONSTRAINT pk_Commande PRIMARY KEY (idCommande),
    CONSTRAINT fk_Commande_Client FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_Commande_MethodePaiement FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement)
);

CREATE TABLE ACommande (
    idCommande INT(6),
    idNumProduit INT(6),
    qte INT(5),
    prixPayer INT(5),
    CONSTRAINT pk_ACommande PRIMARY KEY (idCommande, idNumProduit),
    CONSTRAINT fk_ACommande_Commande FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
    CONSTRAINT fk_ACommande_Produit FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

CREATE TABLE ARegarde (
    idNumCli INT(5),
    idNumProduit INT(6),
    dateRegar DATE,
    CONSTRAINT pk_ARegarde PRIMARY KEY (idNumCli, idNumProduit),
    CONSTRAINT fk_ARegarde_Client FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_ARegarde_Produit FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

CREATE TABLE Avis (
    idNumCli INT(5),
    idNumProduit INT(6),
    tAvis VARCHAR(500),
    urlImage VARCHAR(100),
    CONSTRAINT pk_Avis PRIMARY KEY (idNumCli, idNumProduit),
    CONSTRAINT fk_Avis_Client FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_Avis_Produit FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);
