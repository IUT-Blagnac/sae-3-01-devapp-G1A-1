-- Suppression des tables existantes
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

-- Création des tables
CREATE TABLE MethodePaiement (
    idMethodePaiement INT AUTO_INCREMENT,
    nomMethodePaiement VARCHAR(20) NOT NULL,
    PRIMARY KEY (idMethodePaiement),
    CHECK (nomMethodePaiement IN ('Paypal', 'Visa', 'MasterCard', 'Carte_AE'))
);

CREATE TABLE Paypal (
    idCarte INT AUTO_INCREMENT,
    email VARCHAR(320) NOT NULL,
    mdp VARCHAR(25) NOT NULL,
    PRIMARY KEY (idCarte)
);

CREATE TABLE Carte_EU (
    idCarte INT AUTO_INCREMENT,
    numCarte BIGINT NOT NULL,
    dateExp YEAR NOT NULL,
    nomProp VARCHAR(50) NOT NULL,
    PRIMARY KEY (idCarte)
);

CREATE TABLE Carte_AE (
    idCarte INT AUTO_INCREMENT,
    numCarte VARCHAR(15) NOT NULL,
    dateExp YEAR NOT NULL,
    nomProp VARCHAR(50) NOT NULL,
    PRIMARY KEY (idCarte),
    CHECK (numCarte LIKE '34%' OR numCarte LIKE '37%')
);

CREATE TABLE Image (
    idImage INT AUTO_INCREMENT,
    urlImage VARCHAR(100) NOT NULL,
    PRIMARY KEY (idImage)
);

CREATE TABLE Categorie (
    idCategorie INT AUTO_INCREMENT,
    nomCategorie VARCHAR(30) NOT NULL,
    idCategoriePere INT,
    PRIMARY KEY (idCategorie),
    FOREIGN KEY (idCategoriePere) REFERENCES Categorie(idCategorie)
);

CREATE TABLE Produit (
    idNumProduit INT AUTO_INCREMENT,
    idCategorie INT NOT NULL,
    nomProduit VARCHAR(50) NOT NULL,
    prixActuel DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idNumProduit),
    FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie)
);

CREATE TABLE Contient (
    idNumProduit INT NOT NULL,
    idImage INT NOT NULL,
    PRIMARY KEY (idNumProduit, idImage),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit),
    FOREIGN KEY (idImage) REFERENCES Image(idImage)
);

CREATE TABLE Comporte (
    idNumProduitComportant INT NOT NULL,
    idNumProduitComporte INT NOT NULL,
    PRIMARY KEY (idNumProduitComportant, idNumProduitComporte),
    FOREIGN KEY (idNumProduitComportant) REFERENCES Produit(idNumProduit),
    FOREIGN KEY (idNumProduitComporte) REFERENCES Produit(idNumProduit),
    CHECK (idNumProduitComportant != idNumProduitComporte)
);

CREATE TABLE AdressePostale (
    idAdresse INT AUTO_INCREMENT,
    pays VARCHAR(30) NOT NULL,
    ville VARCHAR(30) NOT NULL,
    adr VARCHAR(50) NOT NULL,
    codePostal VARCHAR(10) NOT NULL,
    PRIMARY KEY (idAdresse)
);

CREATE TABLE Employe (
    idNumEmploye INT AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(15) NOT NULL,
    idAdresse INT NOT NULL,
    email VARCHAR(320) NOT NULL,
    telephone CHAR(10),
    administrateur BOOLEAN NOT NULL,
    PRIMARY KEY (idNumEmploye),
    FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
);

CREATE TABLE Client (
    idNumCli INT AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(15) NOT NULL,
    idAdresse INT NOT NULL,
    email VARCHAR(320) NOT NULL,
    telephone CHAR(10),
    PRIMARY KEY (idNumCli),
    FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
);

CREATE TABLE infoPaiement (
    idNumCli INT NOT NULL,
    idCarte INT NOT NULL,
    idMethodePaiement INT NOT NULL,
    PRIMARY KEY (idNumCli, idCarte, idMethodePaiement),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement)
);

CREATE TABLE Commande (
    idCommande INT AUTO_INCREMENT,
    idNumCli INT NOT NULL,
    idAdresse INT NOT NULL,
    idMethodePaiement INT NOT NULL,
    dateCommande DATE NOT NULL,
    panierActuel BOOLEAN NOT NULL,
    PRIMARY KEY (idCommande),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement),
    FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
);

CREATE TABLE ACommande (
    idCommande INT NOT NULL,
    idNumProduit INT NOT NULL,
    qte INT NOT NULL,
    prix DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idCommande, idNumProduit),
    FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

CREATE TABLE ARegarde (
    idNumCli INT NOT NULL,
    idNumProduit INT NOT NULL,
    dateConsultation DATE NOT NULL,
    PRIMARY KEY (idNumCli, idNumProduit, dateConsultation),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

CREATE TABLE Avis (
    idNumCli INT NOT NULL,
    idNumProduit INT NOT NULL,
    txtAvis VARCHAR(500),
    idImage INT,
    PRIMARY KEY (idNumCli, idNumProduit),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit),
    FOREIGN KEY (idImage) REFERENCES Image(idImage)
);
