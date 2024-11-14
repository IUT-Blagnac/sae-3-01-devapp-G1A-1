DROP TABLE Avis;
DROP TABLE ARegarder;
DROP TABLE ACommande;
DROP TABLE Commande;
DROP TABLE MethodeEnregistrer;
DROP TABLE Client;
DROP TABLE Comporte;
DROP TABLE Image;
DROP TABLE Produit;
DROP TABLE MethodePaiement;
DROP TABLE Categorie;
DROP TABLE Employer;


CREATE TABLE Employe (
    idNumEmployer NUMBER(5),
    nom VARCHAR(25),
	prenom VARCHAR(15),
	idAdresse NUMBER(6),
	email VARCHAR(20),
	telephone CHAR(10),
    administrateur BOOLEAN,
    CONSTRAINT pk_Client PRIMARY KEY (idNumEmployer),
    CONSTRAINT fk_Employe_AdressePostale
		FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
)

CREATE TABLE Categorie (
    idCategorie NUMBER(3),
    nomTypeCategorie VARCHAR(30),
    idCategoriePere Number(3),
    CONSTRAINT pk_TypeCategorie PRIMARY KEY (idTypeCategorie),
    CONSTRAINT fk_Categorie_Categorie FOREIGN key (idCategoriePere) REFERENCES Categorie(idCategorie)
)

CREATE TABLE MethodePaiement(
    idMethodePaiement Number(6),
    nomMethodePaiement VARCHAR(20),
    CONSTRAINT pk_MethodePaiement PRIMARY KEY (MethodePaiement)
    CONSTRAINT ck_MethodePaiement CHECK MethodePaiement IN ("Paypal,Visa,MasterCard,Carte_AE")
)

CREATE TABLE Paypal (
    idcarte NUMBER(6),
    email VARCHAR(50),
    MDP VARCHAR(25),
    CONSTRAINT pk_Paypal PRIMARY KEY (idcarte)
)

CREATE TABLE Carte_EU (
    idcarte Number(6),
    numCarte Number(16),
    dateExp Number(4),
    nomProp Varchar(50),
    CONSTRAINT pk_Carte_EU PRIMARY KEY (idcarte)
)

CREATE TABLE Carte_AE (
    idcarte NUMBER(6),
    numCarte VARCHAR2(15),
    dateExp NUMBER(4),
    nomProp VARCHAR2(50),
    CONSTRAINT pk_Carte_AE PRIMARY KEY (idcarte),
    CONSTRAINT ck_numCarte CHECK numCarte IN LIKE ('34%', '37%')
);

CREATE TABLE Produit (
    idNumProduit NUMBER(6),
    idTypeCategorie NUMBER(3),
    nomProduit VARCHAR(50),
    prixActuel NUMBER(5),
    CONSTRAINT pk_Produit PRIMARY KEY (idNumProduit),
    CONSTRAINT fk_Produit_Categorie
		FOREIGN KEY (idTypeCategorie) REFERENCES Categorie(idTypeCategorie)
)

CREATE TABLE Image (
    idImage NUMBER(6),
    urlImage VARCHAR(100),
    CONSTRAINT pk_Image PRIMARY KEY (idImage)
)

CREATE TABLE Contien (
    idNumProduit NUMBER(6),
    idImage NUMBER(6),
    CONSTRAINT pk_Contien PRIMARY KEY (idNumProduit, idImage),
    CONSTRAINT fk_Contien_Produit 
        FOREIGN KEY (idNumProduit) REFERENCES Client(idNumProduit),
	CONSTRAINT fk_Contien_Immage 
		FOREIGN KEY (idImage) REFERENCES Immage(idImage)
)

CREATE TABLE Comporte (
    idNumProduit1 NUMBER(6),
    idNumProduit2 NUMBER(6),
    CONSTRAINT pk_Comporte PRIMARY KEY (idNumProduit1, idNumProduit2)
    CONSTRAINT fk_Comporte_Produit 
		FOREIGN KEY (idNumProduit1) REFERENCES Produit(idNumProduit),
	CONSTRAINT fk_Comporte_Produit 
		FOREIGN KEY (idNumProduit2) REFERENCES Produit(idNumProduit)
)

CREATE TABLE Client(
    idNumCli NUMBER(5),
    nom VARCHAR(25),
	prenom VARCHAR(15),
    idAdresse NUMBER(6),
	email VARCHAR(20),
	telephone CHAR(10),
    CONSTRAINT pk_Client PRIMARY KEY (idNumCli),
    CONSTRAINT fk_Client_AdressePostale
		FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
)

--INSERT INTO Client VALUES (seq_id_client.NEXTVAL,'Gabin','Jean','3 rue t''as de beaux yeux tu sais, 31700 Blagnac','gabin@free.fr','0512345678','N',1);

CREATE TABLE infoPaiement (
    idNumCli NUMBER(5),  
    idcarte Number(6),
    idMethodePaiement NUMBER(6),
    CONSTRAINT pk_infoPaiement PRIMARY KEY (idNumCli, idcarte,idMethodePaiement),
    CONSTRAINT fk_infoPaiement_Client FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_infoPaiement_MethodePaiement FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement),
    CONSTRAINT fk_infoPaiement_Paypal FOREIGN KEY (idcarte) REFERENCES Paypal(idcarte),
    CONSTRAINT fk_infoPaiement_Carte_EU FOREIGN KEY (idcarte) REFERENCES Carte_EU(idcarte),
    CONSTRAINT fk_infoPaiement_Carte_AE FOREIGN KEY (idcarte) REFERENCES Carte_AE(idcarte)
)

CREATE TABLE Commande (
    idCommande NUMBER(6),
    idNumCli NUMBER(5),
    idAdresse NUMBER(6),
    idMethodePaiement NUMBER(6),
    dateCommande DATE,
    panierActuel BOOLEAN, -- Cette variable ne peut être vrai que pour une seule commande d'un client. Elle représente le panier actuel. 
                          -- Quand elle est fausse, elle représente des commandes déjà passées ce qui constitue l'historique de commande.
    CONSTRAINT pk_Commande PRIMARY KEY (idCommande),
    CONSTRAINT fk_Commande_Client
		FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_Commande_MethodePaiement
		FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement),
    CONSTRAINT fk_Commande_AdressePostale
		FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
)   

CREATE TABLE AdressePostale (
    idAdresse NUMBER(6),
    pays VARCHAR(30),
    ville VARCHAR(30),
    Adr VARCHAR(50),
    codePostal VARCHAR(10),
    CONSTRAINT pk_AdressePostale PRIMARY KEY (idAdresse)
)

CREATE TABLE ACommande (
    idCommande NUMBER(6),
    idNumProduit NUMBER(6),
    qte NUMBER(5),
    prixPayer NUMBER(5),
    CONSTRAINT pk_ACommande PRIMARY KEY (idCommande, idNumProduit),
    CONSTRAINT fk_ACommande_Commande
		FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
	CONSTRAINT fk_ACommande_Produit
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
)

CREATE TABLE ARegarde (
    idNumCli NUMBER(5),
    idNumProduit NUMBER(6),
    dateRegar DATE,
    CONSTRAINT pk_ARegarde PRIMARY KEY (idNumCli, idNumProduit),
    CONSTRAINT fk_ARegarde_Client 
        FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
	CONSTRAINT fk_ARegarde_Produit 
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
)

CREATE TABLE Avis (
    idNumCli NUMBER(6),
    idNumProduit NUMBER(6),
    txtAvis VARCHAR(500),
    idImage NUMBER(6),
    CONSTRAINT pk_Avis PRIMARY KEY (idNumCli, idNumProduit),
    CONSTRAINT fk_Avis_Client 
        FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
	CONSTRAINT fk_Avis_Produit 
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit),
    CONSTRAINT fk_Avis_Immage 
		FOREIGN KEY (idImage) REFERENCES Immage(idImage)
)
