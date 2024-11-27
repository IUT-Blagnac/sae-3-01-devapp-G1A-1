--/////////////////////////////////////////////////////////////////////////////////////--
--                                   insert marque
--/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Marque(nomMarque) VALUES ('MSI');        -- Watercooling, Carte Mère, Boitier PC, Carte graphique, PC portable 
INSERT INTO Marque(nomMarque) VALUES ('Acer');       -- Carte graphique, PC portable
INSERT INTO Marque(nomMarque) VALUES ('Corsair');    -- Mémoire, Ventilateur boitier, Boitier PC
INSERT INTO Marque(nomMarque) VALUES ('Intel');      -- Processeur
INSERT INTO Marque(nomMarque) VALUES ('AMD');        -- Processeur
INSERT INTO Marque(nomMarque) VALUES ('Asus');       -- Carte Mère, Carte graphique, PC portable
INSERT INTO Marque(nomMarque) VALUES ('Razer');      -- Boitier PC
INSERT INTO Marque(nomMarque) VALUES ('NZXT');       -- Watercooling, 
INSERT INTO Marque(nomMarque) VALUES ('Cooler');     -- Watercooling, Ventilateur boitier, Boitier PC
INSERT INTO Marque(nomMarque) VALUES ('Kingston');   -- Mémoire
INSERT INTO Marque(nomMarque) VALUES ('Gigabyte');   -- Carte Mère, Carte graphique 
INSERT INTO Marque(nomMarque) VALUES ('Sapphire');   -- Carte graphique 

--/////////////////////////////////////////////////////////////////////////////////////--
--                                 insert categorie
--/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO categorie(nomTypeCategorie) VALUES ('Watercooling');   
INSERT INTO categorie(nomTypeCategorie) VALUES ('Carte Mère');   
INSERT INTO categorie(nomTypeCategorie) VALUES ('Boitier PC');   
INSERT INTO categorie(nomTypeCategorie) VALUES ('Carte graphique');   
INSERT INTO categorie(nomTypeCategorie) VALUES ('PC portable');   
INSERT INTO categorie(nomTypeCategorie) VALUES ('Mémoire');   
INSERT INTO categorie(nomTypeCategorie) VALUES ('Ventilateur boitier');   
INSERT INTO categorie(nomTypeCategorie) VALUES ('Processeur'); 

--/////////////////////////////////////////////////////////////////////////////////////--
--                                  insert Image
--/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Image(urlImage) VALUES ('carteGraphique.webp');
INSERT INTO Image(urlImage) VALUES ('carteGraphique2.webp'); 
INSERT INTO Image(urlImage) VALUES ('carteGraphique3.webp'); 
INSERT INTO Image(urlImage) VALUES ('pcBureautique.png'); 
INSERT INTO Image(urlImage) VALUES ('pcGaming.webp'); 
INSERT INTO Image(urlImage) VALUES ('pcGaming2.webp'); 
INSERT INTO Image(urlImage) VALUES ('pcGaming3.webp'); 
INSERT INTO Image(urlImage) VALUES ('pcGaming4.webp'); 
INSERT INTO Image(urlImage) VALUES ('processeurIntel.webp');    

--/////////////////////////////////////////////////////////////////////////////////////--
--                                 insert Produit                     
--/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Acer Intel Core i9-13900K - Processeur', 100);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'MSI MacBook Pro 16 - PC portable', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Corsair Corsair 4000D - Boitier PC', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Corsair HyperX Fury 8GB - Mémoire', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'MSI Z590 AORUS - Carte Mère', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'NZXT TUF Gaming X570 - Carte Mère', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'Acer XPS 13 - PC portable', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'MSI GTX 1660 Ti - Carte graphique', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Kingston Ripjaws V 32GB - Mémoire', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Acer Radeon RX 7900 XT - Carte graphique', 100);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'Asus MacBook Pro 16 - PC portable', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Razer Intel Core i7-12700K - Processeur', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'AMD NZXT Aer P - Ventilateur boitier', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Sapphire MasterBox Q300L - Boitier PC', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Corsair Corsair LL120 RGB - Ventilateur boitier', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (1, 'Corsair CoolerPro 120 - Watercooling', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Kingston Phanteks Eclipse P400A - Boitier PC', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (1, 'Acer HydroBoost 360 - Watercooling', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (1, 'Corsair XtremeFlow 240 - Watercooling', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'MSI Trident Z RGB 64GB - Mémoire', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Intel GeForce RTX 4080 - Carte graphique', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Asus Z490 Pro WiFi - Carte Mère', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'MSI Be Quiet! Pure Wings 2 - Ventilateur boitier', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Intel Z590 AORUS - Carte Mère', 100);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'Razer MacBook Pro 16 - PC portable', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Gigabyte Ripjaws V 32GB - Mémoire', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (1, 'MSI XtremeFlow 240 - Watercooling', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Kingston Corsair 4000D - Boitier PC', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (1, 'Kingston UltraCool 240 - Watercooling', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Sapphire ROG Strix B550 - Carte Mère', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Asus Corsair 4000D - Boitier PC', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Gigabyte HyperX Fury 8GB - Mémoire', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (1, 'Acer UltraCool 240 - Watercooling', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Razer Intel Core i9-13900K - Processeur', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (1, 'Sapphire XtremeFlow 240 - Watercooling', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'Kingston XPS 13 - PC portable', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'Corsair Predator Helios 300 - PC portable', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Kingston Z490 Pro WiFi - Carte Mère', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Acer Trident Z RGB 64GB - Mémoire', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Acer Corsair 4000D - Boitier PC', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Corsair NZXT Aer P - Ventilateur boitier', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Asus Be Quiet! Pure Wings 2 - Ventilateur boitier', 100);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'MSI ROG Zephyrus G14 - PC portable', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Acer AMD Ryzen 5 5600X - Processeur', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Gigabyte Corsair LL120 RGB - Ventilateur boitier', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Asus GeForce RTX 4080 - Carte graphique', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Sapphire Z590 AORUS - Carte Mère', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Corsair Phanteks Eclipse P400A - Boitier PC', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Sapphire Cooler Master MasterFan - Ventilateur boitier', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'NZXT Intel Core i7-12700K - Processeur', 200);