DROP DATABASE IF EXISTS MLR6;

CREATE DATABASE IF NOT EXISTS MLR6;
USE MLR6;
# -----------------------------------------------------------------------------
#       TABLE : CARTE_AE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CARTE_AE
 (
   IDCARTE CHAR(32) NOT NULL  ,
   NUMCARTE CHAR(32) NULL  ,
   DATEEXP CHAR(32) NULL  ,
   NOMPROP CHAR(32) NULL  
   , PRIMARY KEY (IDCARTE) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : PAYPAL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PAYPAL
 (
   IDCARTE CHAR(32) NOT NULL  ,
   EMAIL CHAR(32) NULL  ,
   MDP CHAR(32) NULL  
   , PRIMARY KEY (IDCARTE) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : PROMOTION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROMOTION
 (
   IDPROMOTION CHAR(32) NOT NULL  ,
   PROMO CHAR(32) NULL  
   , PRIMARY KEY (IDPROMOTION) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : EMPLOYE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EMPLOYE
 (
   IDNUMEMPLOYE CHAR(32) NOT NULL  ,
   IDADRESSE CHAR(32) NOT NULL  ,
   NOM CHAR(32) NULL  ,
   PRENOM CHAR(32) NULL  ,
   EMAIL CHAR(32) NULL  ,
   TELEPHONE CHAR(32) NULL  ,
   ADMINISTRATEUR CHAR(32) NULL  
   , PRIMARY KEY (IDNUMEMPLOYE) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EMPLOYE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EMPLOYE_ADRESSEPOSTALE
     ON EMPLOYE (IDADRESSE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CATEGORIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORIE
 (
   IDCATEGORIE CHAR(32) NOT NULL  ,
   IDCATEGORIE_SOUS_CATEGORIE CHAR(32) NOT NULL  ,
   NOMCATEGORIE CHAR(32) NULL  
   , PRIMARY KEY (IDCATEGORIE) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CATEGORIE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CATEGORIE_CATEGORIE
     ON CATEGORIE (IDCATEGORIE_SOUS_CATEGORIE ASC);

# -----------------------------------------------------------------------------
#       TABLE : COMMANDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMANDE
 (
   IDCOMMANDE CHAR(32) NOT NULL  ,
   IDMETHODEPAIEMENT CHAR(32) NOT NULL  ,
   IDNUMCLI CHAR(32) NOT NULL  ,
   IDADRESSE CHAR(32) NOT NULL  ,
   DATECOMMANDE CHAR(32) NULL  ,
   ETPANIERACTUEL CHAR(32) NULL  
   , PRIMARY KEY (IDCOMMANDE) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COMMANDE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COMMANDE_METHODEPAIEMENT
     ON COMMANDE (IDMETHODEPAIEMENT ASC);

CREATE  INDEX I_FK_COMMANDE_CLIENT
     ON COMMANDE (IDNUMCLI ASC);

CREATE  INDEX I_FK_COMMANDE_ADRESSEPOSTALE
     ON COMMANDE (IDADRESSE ASC);

# -----------------------------------------------------------------------------
#       TABLE : IMAGE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS IMAGE
 (
   IDIMAGE CHAR(32) NOT NULL  ,
   IDNUMPRODUIT CHAR(32) NOT NULL  ,
   URLIMAGE CHAR(32) NULL  
   , PRIMARY KEY (IDIMAGE) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE IMAGE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_IMAGE_PRODUIT
     ON IMAGE (IDNUMPRODUIT ASC);

# -----------------------------------------------------------------------------
#       TABLE : CLIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
 (
   IDNUMCLI CHAR(32) NOT NULL  ,
   IDADRESSE CHAR(32) NOT NULL  ,
   NOM CHAR(32) NULL  ,
   PRENOM CHAR(32) NULL  ,
   EMAIL CHAR(32) NULL  ,
   TELEPHONE CHAR(32) NULL  
   , PRIMARY KEY (IDNUMCLI) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CLIENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CLIENT_ADRESSEPOSTALE
     ON CLIENT (IDADRESSE ASC);

# -----------------------------------------------------------------------------
#       TABLE : MARQUE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MARQUE
 (
   IDMARQUE CHAR(32) NOT NULL  ,
   NOMMARQUE CHAR(32) NULL  
   , PRIMARY KEY (IDMARQUE) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : INFOPAIEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INFOPAIEMENT
 (
   IDINFOPAIEMENT CHAR(32) NOT NULL  ,
   IDCARTE CHAR(32) NULL  ,
   IDMETHODEPAIEMENT CHAR(32) NOT NULL  ,
   IDNUMCLI CHAR(32) NOT NULL  
   , PRIMARY KEY (IDINFOPAIEMENT) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE INFOPAIEMENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_INFOPAIEMENT_PAYPAL
     ON INFOPAIEMENT (IDCARTE ASC);

CREATE  INDEX I_FK_INFOPAIEMENT_METHODEPAIEMENT
     ON INFOPAIEMENT (IDMETHODEPAIEMENT ASC);

CREATE  INDEX I_FK_INFOPAIEMENT_CLIENT
     ON INFOPAIEMENT (IDNUMCLI ASC);

# -----------------------------------------------------------------------------
#       TABLE : ADRESSEPOSTALE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADRESSEPOSTALE
 (
   IDADRESSE CHAR(32) NOT NULL  ,
   PAYS CHAR(32) NULL  ,
   VILLE CHAR(32) NULL  ,
   ADR CHAR(32) NULL  ,
   CODEPOSTAL CHAR(32) NULL  
   , PRIMARY KEY (IDADRESSE) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : METHODEPAIEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS METHODEPAIEMENT
 (
   IDMETHODEPAIEMENT CHAR(32) NOT NULL  ,
   NOMMETHODEPAIEMENT CHAR(32) NULL  
   , PRIMARY KEY (IDMETHODEPAIEMENT) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : PRODUIT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PRODUIT
 (
   IDNUMPRODUIT CHAR(32) NOT NULL  ,
   IDCATEGORIE CHAR(32) NOT NULL  ,
   IDPROMOTION CHAR(32) NULL  ,
   IDMARQUE CHAR(32) NULL  ,
   NOMPRODUIT CHAR(32) NULL  ,
   PRIXACTUEL CHAR(32) NULL  
   , PRIMARY KEY (IDNUMPRODUIT) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PRODUIT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PRODUIT_CATEGORIE
     ON PRODUIT (IDCATEGORIE ASC);

CREATE  INDEX I_FK_PRODUIT_PROMOTION
     ON PRODUIT (IDPROMOTION ASC);

CREATE  INDEX I_FK_PRODUIT_MARQUE
     ON PRODUIT (IDMARQUE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CARTE_EU
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CARTE_EU
 (
   IDCARTE CHAR(32) NOT NULL  ,
   NUMCARTE CHAR(32) NULL  ,
   DATEEXP CHAR(32) NULL  ,
   NOMPROP CHAR(32) NULL  
   , PRIMARY KEY (IDCARTE) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : AREGARDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AREGARDE
 (
   IDNUMPRODUIT CHAR(32) NOT NULL  ,
   IDNUMCLI CHAR(32) NOT NULL  ,
   DATECONSULTATION CHAR(32) NULL  
   , PRIMARY KEY (IDNUMPRODUIT,IDNUMCLI) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AREGARDE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AREGARDE_PRODUIT
     ON AREGARDE (IDNUMPRODUIT ASC);

CREATE  INDEX I_FK_AREGARDE_CLIENT
     ON AREGARDE (IDNUMCLI ASC);

# -----------------------------------------------------------------------------
#       TABLE : AVIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AVIS
 (
   IDNUMCLI CHAR(32) NOT NULL  ,
   IDNUMPRODUIT CHAR(32) NOT NULL  ,
   TXTAVIS CHAR(32) NULL  
   , PRIMARY KEY (IDNUMCLI,IDNUMPRODUIT) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AVIS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AVIS_CLIENT
     ON AVIS (IDNUMCLI ASC);

CREATE  INDEX I_FK_AVIS_PRODUIT
     ON AVIS (IDNUMPRODUIT ASC);

# -----------------------------------------------------------------------------
#       TABLE : ACOMMANDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ACOMMANDE
 (
   IDNUMPRODUIT CHAR(32) NOT NULL  ,
   IDCOMMANDE CHAR(32) NOT NULL  ,
   QTE CHAR(32) NULL  ,
   PRIX CHAR(32) NULL  
   , PRIMARY KEY (IDNUMPRODUIT,IDCOMMANDE) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ACOMMANDE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ACOMMANDE_PRODUIT
     ON ACOMMANDE (IDNUMPRODUIT ASC);

CREATE  INDEX I_FK_ACOMMANDE_COMMANDE
     ON ACOMMANDE (IDCOMMANDE ASC);

# -----------------------------------------------------------------------------
#       TABLE : COMPORTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMPORTE
 (
   IDNUMPRODUIT CHAR(32) NOT NULL  ,
   IDNUMPRODUIT_1 CHAR(32) NOT NULL  
   , PRIMARY KEY (IDNUMPRODUIT,IDNUMPRODUIT_1) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COMPORTE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COMPORTE_PRODUIT
     ON COMPORTE (IDNUMPRODUIT ASC);

CREATE  INDEX I_FK_COMPORTE_PRODUIT1
     ON COMPORTE (IDNUMPRODUIT_1 ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE EMPLOYE 
  ADD FOREIGN KEY FK_EMPLOYE_ADRESSEPOSTALE (IDADRESSE)
      REFERENCES ADRESSEPOSTALE (IDADRESSE) ;


ALTER TABLE CATEGORIE 
  ADD FOREIGN KEY FK_CATEGORIE_CATEGORIE (IDCATEGORIE_SOUS_CATEGORIE)
      REFERENCES CATEGORIE (IDCATEGORIE) ;


ALTER TABLE COMMANDE 
  ADD FOREIGN KEY FK_COMMANDE_METHODEPAIEMENT (IDMETHODEPAIEMENT)
      REFERENCES METHODEPAIEMENT (IDMETHODEPAIEMENT) ;


ALTER TABLE COMMANDE 
  ADD FOREIGN KEY FK_COMMANDE_CLIENT (IDNUMCLI)
      REFERENCES CLIENT (IDNUMCLI) ;


ALTER TABLE COMMANDE 
  ADD FOREIGN KEY FK_COMMANDE_ADRESSEPOSTALE (IDADRESSE)
      REFERENCES ADRESSEPOSTALE (IDADRESSE) ;


ALTER TABLE IMAGE 
  ADD FOREIGN KEY FK_IMAGE_PRODUIT (IDNUMPRODUIT)
      REFERENCES PRODUIT (IDNUMPRODUIT) ;


ALTER TABLE CLIENT 
  ADD FOREIGN KEY FK_CLIENT_ADRESSEPOSTALE (IDADRESSE)
      REFERENCES ADRESSEPOSTALE (IDADRESSE) ;


ALTER TABLE INFOPAIEMENT 
  ADD FOREIGN KEY FK_INFOPAIEMENT_PAYPAL (IDCARTE)
      REFERENCES PAYPAL (IDCARTE) ;


ALTER TABLE INFOPAIEMENT 
  ADD FOREIGN KEY FK_INFOPAIEMENT_METHODEPAIEMENT (IDMETHODEPAIEMENT)
      REFERENCES METHODEPAIEMENT (IDMETHODEPAIEMENT) ;


ALTER TABLE INFOPAIEMENT 
  ADD FOREIGN KEY FK_INFOPAIEMENT_CLIENT (IDNUMCLI)
      REFERENCES CLIENT (IDNUMCLI) ;


ALTER TABLE PRODUIT 
  ADD FOREIGN KEY FK_PRODUIT_CATEGORIE (IDCATEGORIE)
      REFERENCES CATEGORIE (IDCATEGORIE) ;


ALTER TABLE PRODUIT 
  ADD FOREIGN KEY FK_PRODUIT_PROMOTION (IDPROMOTION)
      REFERENCES PROMOTION (IDPROMOTION) ;


ALTER TABLE PRODUIT 
  ADD FOREIGN KEY FK_PRODUIT_MARQUE (IDMARQUE)
      REFERENCES MARQUE (IDMARQUE) ;


ALTER TABLE AREGARDE 
  ADD FOREIGN KEY FK_AREGARDE_PRODUIT (IDNUMPRODUIT)
      REFERENCES PRODUIT (IDNUMPRODUIT) ;


ALTER TABLE AREGARDE 
  ADD FOREIGN KEY FK_AREGARDE_CLIENT (IDNUMCLI)
      REFERENCES CLIENT (IDNUMCLI) ;


ALTER TABLE AVIS 
  ADD FOREIGN KEY FK_AVIS_CLIENT (IDNUMCLI)
      REFERENCES CLIENT (IDNUMCLI) ;


ALTER TABLE AVIS 
  ADD FOREIGN KEY FK_AVIS_PRODUIT (IDNUMPRODUIT)
      REFERENCES PRODUIT (IDNUMPRODUIT) ;


ALTER TABLE ACOMMANDE 
  ADD FOREIGN KEY FK_ACOMMANDE_PRODUIT (IDNUMPRODUIT)
      REFERENCES PRODUIT (IDNUMPRODUIT) ;


ALTER TABLE ACOMMANDE 
  ADD FOREIGN KEY FK_ACOMMANDE_COMMANDE (IDCOMMANDE)
      REFERENCES COMMANDE (IDCOMMANDE) ;


ALTER TABLE COMPORTE 
  ADD FOREIGN KEY FK_COMPORTE_PRODUIT (IDNUMPRODUIT)
      REFERENCES PRODUIT (IDNUMPRODUIT) ;


ALTER TABLE COMPORTE 
  ADD FOREIGN KEY FK_COMPORTE_PRODUIT1 (IDNUMPRODUIT_1)
      REFERENCES PRODUIT (IDNUMPRODUIT) ;

