DROP TABLE IF EXISTS Avis;
DROP TABLE IF EXISTS ARegarde;
DROP TABLE IF EXISTS ACommande;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS infoPaiement;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Employe;
DROP TABLE IF EXISTS AdressePostale;
DROP TABLE IF EXISTS Comporte;
DROP TABLE IF EXISTS Contient;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Categorie;
DROP TABLE IF EXISTS Image;
DROP TABLE IF EXISTS Carte_AE;
DROP TABLE IF EXISTS Carte_EU;
DROP TABLE IF EXISTS Paypal;
DROP TABLE IF EXISTS MethodePaiement;
DROP TABLE IF EXISTS Promotion;
DROP TABLE IF EXISTS Marque;

CREATE TABLE Marque (
    idMarque INT PRIMARY KEY AUTO_INCREMENT,
    nomMarque VARCHAR(20) NOT NULL
);

CREATE TABLE Promotion (
    idPromotion INT PRIMARY KEY AUTO_INCREMENT,
    nomPromotion VARCHAR(20) NOT NULL,
    pourcentageReduction INT NOT NULL
);

CREATE TABLE MethodePaiement (
    idMethodePaiement INT PRIMARY KEY AUTO_INCREMENT,
    nomMethodePaiement VARCHAR(20) NOT NULL
);

CREATE TABLE Paypal (
    idCarte INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(320) NOT NULL,
    mdp VARCHAR(25) NOT NULL
);

CREATE TABLE Carte_EU (
    idCarte INT PRIMARY KEY AUTO_INCREMENT,
    numCarte BIGINT NOT NULL,
    dateExp INT NOT NULL,
    nomProp VARCHAR(50) NOT NULL
);

CREATE TABLE Carte_AE (
    idCarte INT PRIMARY KEY AUTO_INCREMENT,
    numCarte VARCHAR(15) NOT NULL,
    dateExp INT NOT NULL,
    nomProp VARCHAR(50) NOT NULL
);

CREATE TABLE Image (
    idImage INT PRIMARY KEY AUTO_INCREMENT,
    urlImage VARCHAR(100) NOT NULL
);

CREATE TABLE Categorie (
    idCategorie INT PRIMARY KEY AUTO_INCREMENT,
    nomCategorie VARCHAR(30) NOT NULL,
    idCategoriePere INT,
    FOREIGN KEY (idCategoriePere) REFERENCES Categorie(idCategorie)
);

CREATE TABLE Produit (
    idNumProduit INT PRIMARY KEY AUTO_INCREMENT,
    idCategorie INT,
    nomProduit VARCHAR(50) NOT NULL,
    prixActuel DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie)
);

CREATE TABLE Contient (
    idNumProduit INT,
    idImage INT,
    PRIMARY KEY (idNumProduit, idImage),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit),
    FOREIGN KEY (idImage) REFERENCES Image(idImage)
);

CREATE TABLE Comporte (
    idNumProduitComportant INT,
    idNumProduitComporte INT,
    PRIMARY KEY (idNumProduitComportant, idNumProduitComporte),
    FOREIGN KEY (idNumProduitComportant) REFERENCES Produit(idNumProduit),
    FOREIGN KEY (idNumProduitComporte) REFERENCES Produit(idNumProduit)
);

CREATE TABLE AdressePostale (
    idAdresse INT PRIMARY KEY AUTO_INCREMENT,
    pays VARCHAR(30) NOT NULL,
    ville VARCHAR(30) NOT NULL,
    Adr VARCHAR(50) NOT NULL,
    codePostal VARCHAR(10) NOT NULL
);

CREATE TABLE Employe (
    idNumEmploye INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(15) NOT NULL,
    idAdresse INT,
    email VARCHAR(320) NOT NULL,
    telephone CHAR(10),
    administrateur TINYINT(1) NOT NULL,
    FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
);

CREATE TABLE Client (
    idNumCli INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(15) NOT NULL,
    idAdresse INT,
    email VARCHAR(320) NOT NULL,
    telephone CHAR(10),
    FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
);

CREATE TABLE infoPaiement (
    idNumCli INT,
    idCarte INT,
    idMethodePaiement INT,
    PRIMARY KEY (idNumCli, idCarte, idMethodePaiement),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement)
);

CREATE TABLE Commande (
    idCommande INT PRIMARY KEY AUTO_INCREMENT,
    idNumCli INT,
    idAdresse INT,
    idMethodePaiement INT,
    dateCommande DATE NOT NULL,
    etPanierActuel TINYINT(1),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse),
    FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement)
);

CREATE TABLE ACommande (
    idCommande INT,
    idNumProduit INT,
    qte INT,
    prix DECIMAL(10, 2),
    PRIMARY KEY (idCommande, idNumProduit),
    FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

CREATE TABLE ARegarde (
    idNumCli INT,
    idNumProduit INT,
    dateConsultation DATE,
    PRIMARY KEY (idNumCli, idNumProduit, dateConsultation),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

CREATE TABLE Avis (
    idNumCli INT,
    idNumProduit INT,
    txtAvis VARCHAR(500),
    idImage INT,
    PRIMARY KEY (idNumCli, idNumProduit),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit),
    FOREIGN KEY (idImage) REFERENCES Image(idImage)
);
