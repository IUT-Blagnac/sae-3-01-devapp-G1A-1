CREATE TABLE Marque (
    idMarque INT PRIMARY KEY AUTO_INCREMENT,
    nomMarque VARCHAR(20) NOT NULL
);

CREATE TABLE Promotion (
    idPromotion INT PRIMARY KEY AUTO_INCREMENT,
    nomPromotion VARCHAR(20) NOT NULL,
    pourcentageReduction INT NOT NULL,
    CHECK(pourcentageReduction > 0 AND pourcentageReduction < 100)
);

CREATE TABLE MethodePaiement (
    idMethodePaiement INT PRIMARY KEY AUTO_INCREMENT,
    nomMethodePaiement VARCHAR(20) NOT NULL,
    CHECK(nomMethodePaiement IN ("Paypal","Visa","MasterCard","Carte_AE"))
);

CREATE TABLE Paypal (
    idCarte INT PRIMARY KEY,
    email VARCHAR(320) NOT NULL,
    mdp VARCHAR(25) NOT NULL
);

CREATE TABLE Carte_EU (
    idCarte INT PRIMARY KEY,
    numCarte CHAR(15) NOT NULL,
    dateExp DATE NOT NULL,
    nomProprietaire VARCHAR(50) NOT NULL
);

CREATE TABLE Carte_AE (
    idCarte INT PRIMARY KEY,
    numCarte CHAR(15) NOT NULL,
    dateExp DATE NOT NULL,
    nomProprietaire VARCHAR(50) NOT NULL,
    CHECK (numCarte LIKE ('34%') OR numCarte LIKE ('37%'))
);

CREATE TABLE Image (
    idImage INT PRIMARY KEY AUTO_INCREMENT,
    nomImage VARCHAR(100) NOT NULL
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
    prix DECIMAL(10, 2) NOT NULL,
    descriptionProduit VARCHAR(5000) NOT NULL,
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
    FOREIGN KEY (idNumProduitComporte) REFERENCES Produit(idNumProduit),
    CHECK(idNumProduitComportant != idNumProduitComporte)
);

CREATE TABLE AdressePostale (
    idAdresse INT PRIMARY KEY AUTO_INCREMENT,
    pays VARCHAR(30) NOT NULL,
    ville VARCHAR(60) NOT NULL,
    numNomRue VARCHAR(50) NOT NULL,
    codePostal VARCHAR(10) NOT NULL
);

CREATE TABLE Employe (
    idNumEmploye INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(15) NOT NULL,
    email VARCHAR(320) NOT NULL,
    telephone CHAR(10),
    administrateur BOOLEAN NOT NULL
);

CREATE TABLE Client (
    idNumCli INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(15) NOT NULL,
    idAdresse INT,
    email VARCHAR(320) NOT NULL,
    telephone CHAR(13),
    mdp VARCHAR(300) NOT NULL,
    FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
);

CREATE TABLE infoPaiement (
    idInfoPaiement INT PRIMARY KEY AUTO_INCREMENT,
    idNumCli INT NOT NULL,
    idCarte INT NOT NULL,
    idMethodePaiement INT NOT NULL,
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement)
);

CREATE TABLE Commande (
    idCommande INT PRIMARY KEY AUTO_INCREMENT,
    idNumCli INT,
    idAdresse INT,
    idMethodePaiement INT,
    dateCommande DATE,
    estPanierActuel BOOLEAN NOT NULL,
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse),
    FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement)
);

CREATE TABLE ACommande (
    idCommande INT,
    idNumProduit INT,
    qte INT,
    prixAchat DECIMAL(10, 2),
    PRIMARY KEY (idCommande, idNumProduit),
    FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit),
    CHECK(prixAchat > 0 AND qte > 0)
);

CREATE TABLE AConsulte (
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
    idNumEmploye INT,
    txtAvis VARCHAR(500) NOT NULL,
    txtReponse VARCHAR(500),
    idImage INT,
    PRIMARY KEY (idNumCli, idNumProduit),
    FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit),
    FOREIGN KEY (idNumEmploye) REFERENCES Employe(idNumEmploye),
    FOREIGN KEY (idImage) REFERENCES Image(idImage)
);
