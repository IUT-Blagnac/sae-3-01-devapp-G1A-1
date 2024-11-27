#/////////////////////////////////////////////////////////////////////////////////////--
#                                   insert marque
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Marque(nomMarque) VALUES ('MSI');        # Watercooling, Carte Mère, Boitier PC, Carte graphique, PC portable 
INSERT INTO Marque(nomMarque) VALUES ('Acer');       # Carte graphique, PC portable
INSERT INTO Marque(nomMarque) VALUES ('Corsair');    # Mémoire, Ventilateur boitier, Boitier PC
INSERT INTO Marque(nomMarque) VALUES ('Intel');      # Processeur
INSERT INTO Marque(nomMarque) VALUES ('AMD');        # Processeur
INSERT INTO Marque(nomMarque) VALUES ('Asus');       # Carte Mère, Carte graphique, PC portable
INSERT INTO Marque(nomMarque) VALUES ('Razer');      # Boitier PC
INSERT INTO Marque(nomMarque) VALUES ('NZXT');       # Watercooling, 
INSERT INTO Marque(nomMarque) VALUES ('Cooler');     # Watercooling, Ventilateur boitier, Boitier PC
INSERT INTO Marque(nomMarque) VALUES ('Kingston');   # Mémoire
INSERT INTO Marque(nomMarque) VALUES ('Gigabyte');   # Carte Mère, Carte graphique 
INSERT INTO Marque(nomMarque) VALUES ('Sapphire');   # Carte graphique 

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert categorie
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Categorie(nomCategorie) VALUES ('Composant');  
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('Watercooling', 1);   
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('Carte Mère', 1);   
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('Boitier PC', 1);   
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('Carte graphique', 1);  
INSERT INTO Categorie(nomCategorie) VALUES ('PC Portable');   
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('Mémoire', 1);   
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('Ventilateur boitier', 1);   
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('Processeur', 1);
INSERT INTO Categorie(nomCategorie) VALUES ('PC Monté'); 
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('PC Gaming', 9);
INSERT INTO Categorie(nomCategorie, idCategoriePere) VALUES ('PC Bureautique', 9);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                  insert Image
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Image(urlImage) VALUES ('carteGraphique.webp');
INSERT INTO Image(urlImage) VALUES ('carteGraphique2.webp'); 
INSERT INTO Image(urlImage) VALUES ('carteGraphique3.webp'); 
INSERT INTO Image(urlImage) VALUES ('pcBureautique.png'); 
INSERT INTO Image(urlImage) VALUES ('pcGaming.webp'); 
INSERT INTO Image(urlImage) VALUES ('pcGaming2.webp'); 
INSERT INTO Image(urlImage) VALUES ('pcGaming3.webp'); 
INSERT INTO Image(urlImage) VALUES ('pcGaming4.webp'); 
INSERT INTO Image(urlImage) VALUES ('processeurIntel.webp');    

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Produit                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (9, 'Acer Intel Core i9-13900K - Processeur', 100);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'MSI MacBook Pro 16 - PC portable', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Corsair Corsair 4000D - Boitier PC', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Corsair HyperX Fury 8GB - Mémoire', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'MSI Z590 AORUS - Carte Mère', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'NZXT TUF Gaming X570 - Carte Mère', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Acer XPS 13 - PC portable', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'MSI GTX 1660 Ti - Carte graphique', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Kingston Ripjaws V 32GB - Mémoire', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'Acer Radeon RX 7900 XT - Carte graphique', 100);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Asus MacBook Pro 16 - PC portable', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (9, 'Razer Intel Core i7-12700K - Processeur', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'AMD NZXT Aer P - Ventilateur boitier', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Sapphire MasterBox Q300L - Boitier PC', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Corsair Corsair LL120 RGB - Ventilateur boitier', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Corsair CoolerPro 120 - Watercooling', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Kingston Phanteks Eclipse P400A - Boitier PC', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Acer HydroBoost 360 - Watercooling', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Corsair XtremeFlow 240 - Watercooling', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'MSI Trident Z RGB 64GB - Mémoire', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'Intel GeForce RTX 4080 - Carte graphique', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Asus Z490 Pro WiFi - Carte Mère', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'MSI Be Quiet! Pure Wings 2 - Ventilateur boitier', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Intel Z590 AORUS - Carte Mère', 100);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Razer MacBook Pro 16 - PC portable', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Gigabyte Ripjaws V 32GB - Mémoire', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'MSI XtremeFlow 240 - Watercooling', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Kingston Corsair 4000D - Boitier PC', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Kingston UltraCool 240 - Watercooling', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Sapphire ROG Strix B550 - Carte Mère', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Asus Corsair 4000D - Boitier PC', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Gigabyte HyperX Fury 8GB - Mémoire', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Acer UltraCool 240 - Watercooling', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (9, 'Razer Intel Core i9-13900K - Processeur', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (2, 'Sapphire XtremeFlow 240 - Watercooling', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Kingston XPS 13 - PC portable', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'Corsair Predator Helios 300 - PC portable', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Kingston Z490 Pro WiFi - Carte Mère', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (7, 'Acer Trident Z RGB 64GB - Mémoire', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Acer Corsair 4000D - Boitier PC', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Corsair NZXT Aer P - Ventilateur boitier', 200);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Asus Be Quiet! Pure Wings 2 - Ventilateur boitier', 100);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (6, 'MSI ROG Zephyrus G14 - PC portable', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (9, 'Acer AMD Ryzen 5 5600X - Processeur', 400);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Gigabyte Corsair LL120 RGB - Ventilateur boitier', 300);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (5, 'Asus GeForce RTX 4080 - Carte graphique', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (3, 'Sapphire Z590 AORUS - Carte Mère', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (4, 'Corsair Phanteks Eclipse P400A - Boitier PC', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (8, 'Sapphire Cooler Master MasterFan - Ventilateur boitier', 500);
INSERT INTO Produit(idCategorie, nomProduit, prixActuel) VALUES (9, 'NZXT Intel Core i7-12700K - Processeur', 200);