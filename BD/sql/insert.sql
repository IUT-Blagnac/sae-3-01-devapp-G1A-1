--/////////////////////////////////////////////////////////////////////////////////////--
--                                   insert marque                     
--/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'MSI');        -- Watercooling, Carte Mère, Boitier PC, Carte graphique, PC portable 
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Acer');       -- Carte graphique, PC portable
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Corsair');    -- Mémoire, Ventilateur boitier, Boitier PC
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Intel');      -- Processeur
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'AMD');        -- Processeur
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Asus');       -- Carte Mère, Carte graphique, PC portable
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Razer');      -- Boitier PC
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'NZXT');       -- Watercooling, 
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Cooler');     -- Watercooling, Ventilateur boitier, Boitier PC
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Kingston');   -- Mémoire
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Gigabyte');   -- Carte Mère, Carte graphique
INSERT INTO Marque(idMarque, nomMarque) VALUES (seq_id_Marque.NEXTVAL, 'Sapphire');   -- Carte graphique

--/////////////////////////////////////////////////////////////////////////////////////--
--                                 insert categorie                     
--/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'Watercooling');   
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'Carte Mère');   
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'Boitier PC');   
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'Carte graphique');   
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'PC portable');   
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'Mémoire');   
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'Ventilateur boitier');   
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'Processeur'); 

--/////////////////////////////////////////////////////////////////////////////////////--
--                                  insert image                     
--/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'carteGraphique.webp');
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'carteGraphique2.webp'); 
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'carteGraphique3.webp'); 
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'pcBureautique.png'); 
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'pcGaming.webp'); 
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'pcGaming2.webp'); 
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'pcGaming3.webp'); 
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'pcGaming4.webp'); 
INSERT INTO categorie(idCategorie, nomTypeCategorie) VALUES (seq_id_Categorie.NEXTVAL, 'processeurIntel.webp');  