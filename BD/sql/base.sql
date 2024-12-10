DROP TABLE Avis;
DROP TABLE ARegarde;
DROP TABLE ACommande;
DROP TABLE Commande;
DROP TABLE infoPaiement;
DROP TABLE Client;
DROP TABLE Employe;
DROP TABLE AdressePostale;
DROP TABLE Comporte;
DROP TABLE Contient;
DROP TABLE Produit;
DROP TABLE Categorie;
DROP TABLE Image;
DROP TABLE Carte_AE;
DROP TABLE Carte_EU;
DROP TABLE Paypal;
DROP TABLE MethodePaiement;

CREATE TABLE MethodePaiement(
    idMethodePaiement Number(6),
    nomMethodePaiement VARCHAR(20),
    CONSTRAINT pk_MethodePaiement PRIMARY KEY (idMethodePaiement),
    CONSTRAINT ck_MethodePaiement CHECK MethodePaiement IN ("Paypal","Visa","MasterCard","Carte_AE")
);

CREATE TABLE Paypal (
    idCarte NUMBER(6),
    email VARCHAR(320),
    mdp VARCHAR(25),
    CONSTRAINT pk_Paypal PRIMARY KEY (idCarte)
);

CREATE TABLE Carte_EU (
    idCarte Number(6),
    numCarte Number(16),
    dateExp Number(4),
    nomProp Varchar(50),
    CONSTRAINT pk_Carte_EU PRIMARY KEY (idCarte)
);

CREATE TABLE Carte_AE (
    idCarte NUMBER(6),
    numCarte VARCHAR2(15),
    dateExp NUMBER(4),
    nomProp VARCHAR2(50),
    CONSTRAINT pk_Carte_AE PRIMARY KEY (idCarte),
    CONSTRAINT ck_Carte_AE_numCarte CHECK numCarte IN LIKE ('34%', '37%')
);

CREATE TABLE Image (
    idImage NUMBER(6),
    urlImage VARCHAR(100),
    CONSTRAINT pk_Image PRIMARY KEY (idImage)
);

CREATE TABLE Categorie (
    idCategorie NUMBER(3),
    nomCategorie VARCHAR(30),
    idCategoriePere Number(3),
    CONSTRAINT pk_Categorie PRIMARY KEY (idCategorie),
    CONSTRAINT fk_Categorie_Categorie FOREIGN key (idCategoriePere) REFERENCES Categorie(idCategorie)
);

CREATE TABLE Produit (
    idNumProduit NUMBER(6),
    idCategorie NUMBER(3),
    nomProduit VARCHAR(50),
    prixActuel NUMBER(5),
    CONSTRAINT pk_Produit PRIMARY KEY (idNumProduit),
    CONSTRAINT fk_Produit_Categorie
		FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie)
);

CREATE TABLE Contient (
    idNumProduit NUMBER(6),
    idImage NUMBER(6),
    CONSTRAINT pk_Contient PRIMARY KEY (idNumProduit, idImage),
    CONSTRAINT fk_Contient_Produit 
        FOREIGN KEY (idNumProduit) REFERENCES Client(idNumProduit),
	CONSTRAINT fk_Contient_Image 
		FOREIGN KEY (idImage) REFERENCES Image(idImage)
);

CREATE TABLE Comporte (
    idNumProduitComportant NUMBER(6),
    idNumProduitComporte NUMBER(6),
    CONSTRAINT pk_Comporte PRIMARY KEY (idNumProduitComportant, idNumProduitComporte)
    CONSTRAINT fk_Comporte_Produit 
		FOREIGN KEY (idNumProduitComportant) REFERENCES Produit(idNumProduit),
	CONSTRAINT fk_Comporte_Produit 
		FOREIGN KEY (idNumProduitComporte) REFERENCES Produit(idNumProduit),
    CONSTRAINT ck_Comporte_diff_produit CHECK idNumProduitComportant != idNumProduitComporte
);

CREATE TABLE AdressePostale (
    idAdresse NUMBER(6),
    pays VARCHAR(30),
    ville VARCHAR(30),
    Adr VARCHAR(50),
    codePostal VARCHAR(10),
    CONSTRAINT pk_AdressePostale PRIMARY KEY (idAdresse)
);

CREATE TABLE Employe (
    idNumEmploye NUMBER(5),
    nom VARCHAR(25),
	prenom VARCHAR(15),
	idAdresse NUMBER(6),
	email VARCHAR(320),
	telephone CHAR(10),
    administrateur BOOLEAN,
    CONSTRAINT pk_Employe PRIMARY KEY (idNumEmploye),
    CONSTRAINT fk_Employe_AdressePostale
		FOREIGN KEY (idAdresse) REFERENCES AdressePostale(idAdresse)
);

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
);

CREATE TABLE infoPaiement (
    idNumCli NUMBER(5),  
    idCarte Number(6),
    idMethodePaiement NUMBER(6),
    CONSTRAINT pk_infoPaiement PRIMARY KEY (idNumCli, idCarte,idMethodePaiement),
    CONSTRAINT fk_infoPaiement_Client FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
    CONSTRAINT fk_infoPaiement_MethodePaiement FOREIGN KEY (idMethodePaiement) REFERENCES MethodePaiement(idMethodePaiement),
    -- Ces contraintes ne sont pas possible. Nous aurons besoin d'un trigger pour vérifier que idCarte fait bien référence à l'une de ces tables
    -- Note : il faudra mettre à jour ce trigger lors de l'ajout de nouvelles tables
    -- CONSTRAINT fk_infoPaiement_Paypal FOREIGN KEY (idCarte) REFERENCES Paypal(idCarte),
    -- CONSTRAINT fk_infoPaiement_Carte_EU FOREIGN KEY (idCarte) REFERENCES Carte_EU(idCarte),
    -- CONSTRAINT fk_infoPaiement_Carte_AE FOREIGN KEY (idCarte) REFERENCES Carte_AE(idCarte)
);

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
);

CREATE TABLE ACommande (
    idCommande NUMBER(6),
    idNumProduit NUMBER(6),
    qte NUMBER(5),
    prix NUMBER(5),
    CONSTRAINT pk_ACommande PRIMARY KEY (idCommande, idNumProduit),
    CONSTRAINT fk_ACommande_Commande
		FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
	CONSTRAINT fk_ACommande_Produit
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

CREATE TABLE ARegarde (
    idNumCli NUMBER(5),
    idNumProduit NUMBER(6),
    dateConsultation DATE,
    CONSTRAINT pk_ARegarde PRIMARY KEY (idNumCli, idNumProduit, dateConsultation),
    CONSTRAINT fk_ARegarde_Client 
        FOREIGN KEY (idNumCli) REFERENCES Client(idNumCli),
	CONSTRAINT fk_ARegarde_Produit 
		FOREIGN KEY (idNumProduit) REFERENCES Produit(idNumProduit)
);

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
    CONSTRAINT fk_Avis_Image 
		FOREIGN KEY (idImage) REFERENCES Image(idImage)
);

--INSERT INTO Client VALUES (seq_id_client.NEXTVAL,'Gabin','Jean','3 rue t''as de beaux yeux tu sais, 31700 Blagnac','gabin@free.fr','0512345678','N',1);

