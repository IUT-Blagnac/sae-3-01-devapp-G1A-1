#/////////////////////////////////////////////////////////////////////////////////////--
#                                   insert marque
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO MethodePaiement (nomMethodePaiement) VALUES ('Paypal');
INSERT INTO MethodePaiement (nomMethodePaiement) VALUES ('Visa');
INSERT INTO MethodePaiement (nomMethodePaiement) VALUES ('MasterCard');
INSERT INTO MethodePaiement (nomMethodePaiement) VALUES ('Carte_AE');

#/////////////////////////////////////////////////////////////////////////////////////--
#                                   insert marque
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Marque (nomMarque) VALUES ('MSI');        # Watercooling, Carte Mère, Boitier PC, Carte graphique, PC portable 
INSERT INTO Marque (nomMarque) VALUES ('Acer');       # Carte graphique, PC portable
INSERT INTO Marque (nomMarque) VALUES ('Corsair');    # Mémoire, Ventilateur boitier, Boitier PC
INSERT INTO Marque (nomMarque) VALUES ('Intel');      # Processeur
INSERT INTO Marque (nomMarque) VALUES ('AMD');        # Processeur
INSERT INTO Marque (nomMarque) VALUES ('Asus');       # Carte Mère, Carte graphique, PC portable
INSERT INTO Marque (nomMarque) VALUES ('Razer');      # Boitier PC
INSERT INTO Marque (nomMarque) VALUES ('NZXT');       # Watercooling, 
INSERT INTO Marque (nomMarque) VALUES ('Cooler');     # Watercooling, Ventilateur boitier, Boitier PC
INSERT INTO Marque (nomMarque) VALUES ('Kingston');   # Mémoire
INSERT INTO Marque (nomMarque) VALUES ('Gigabyte');   # Carte Mère, Carte graphique 
INSERT INTO Marque (nomMarque) VALUES ('Sapphire');   # Carte graphique 

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert categorie
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Categorie (nomCategorie) VALUES ('Composant');  
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('Watercooling', 1);   
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('Carte Mère', 1);   
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('Boitier PC', 1);   
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('Carte graphique', 1);  
INSERT INTO Categorie (nomCategorie) VALUES ('PC Portable');   
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('Mémoire', 1);   
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('Ventilateur boitier', 1);   
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('Processeur', 1);
INSERT INTO Categorie (nomCategorie) VALUES ('PC Monté');
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('PC Gaming', 9);
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('PC Bureautique', 9);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                  insert Image
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Image (urlImage) VALUES ('carteGraphique.webp');
INSERT INTO Image (urlImage) VALUES ('carteGraphique2.webp'); 
INSERT INTO Image (urlImage) VALUES ('carteGraphique3.webp'); 
INSERT INTO Image (urlImage) VALUES ('pcBureautique.png'); 
INSERT INTO Image (urlImage) VALUES ('pcGaming.webp'); 
INSERT INTO Image (urlImage) VALUES ('pcGaming2.webp'); 
INSERT INTO Image (urlImage) VALUES ('pcGaming3.webp'); 
INSERT INTO Image (urlImage) VALUES ('pcGaming4.webp'); 
INSERT INTO Image (urlImage) VALUES ('processeurIntel.webp');  

#/////////////////////////////////////////////////////////////////////////////////////--
#                            insert AdressePostale                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Brunet-sur-Lagarde', '63 boulevard Odette Petitjean', '65909');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Guibert', '69 chemin André Gillet', '65174');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Morenodan', '746 chemin Alexandria Hervé', '45236');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Sainte Émilie', '396 avenue de Sauvage', '43339');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Robert', '75 rue Emmanuelle Lecomte', '72254');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Valentin', '40 chemin Launay', '49721');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Sainte Marianneboeuf', '76 avenue de Charles', '54942');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Antoine', '336 chemin François Collin', '24491');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Bouchetdan', '91 rue Poulain', '83568');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Chauvet-la-Forêt', '79 rue Gilles Monnier', '51437');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Laroche', '36 rue Teixeira', '97637');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Alves-sur-Pruvost', '469 boulevard Aimé François', '61429');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Benard-sur-Raymond', '72 avenue de Barre', '97388');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Hubert', '85 rue Boutin', '60145');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Saint Jules', '456 boulevard Becker', '28523');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Mathieunec', '92 avenue Pauline Rocher', '40364');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Saint LéonBourg', '19 boulevard Gilbert', '35137');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'LeclercqVille', '12 avenue Isaac Roussel', '20719');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Sainte Odettedan', '88 boulevard Émilie Bouchet', '78330');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Sainte Michelleboeuf', '73 avenue Thibaut Marion', '27713');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Pineau', '23 chemin Céline Legros', '97349');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Caron', '56 avenue de Perez', '56893');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Saint Margaud', '99 rue Roux', '93812');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'MorelVille', '65 rue Mallet', '74928');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Moreno', '11 boulevard Véronique Torres', '86209');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Lefèvre', '134 rue Charlotte Charles', '72977');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Leconte-sur-Robin', '55 rue Gaillard', '62679');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Masse-sur-Weber', '20 boulevard Alphonse Lévêque', '03122');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Chevallier-sur-Hubert', '9 chemin Céline Faivre', '80755');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'GeorgesVille', '602 rue de Mendès', '52476');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Jeandan', '670 rue Roger Robin', '62762');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Arnac-la-Poste', '1 Rue du Huit Mai 1945', '87160');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Ruiz', '48 chemin Lopez', '05506');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Gautier', '3 chemin Maurice', '31895');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Sainte Daniel', '404 boulevard Leleu', '89359');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Vincentboeuf', '16 avenue de Antoine', '31544');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Sainte JulieVille', '8 chemin Sylvie Henry', '65167');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Roche', '781 rue de Blondel', '77812');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Mallet', '481 rue Thierry Guyon', '38546');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Leduc-sur-Mer', '38 avenue Emmanuel Courtois', '14395');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Klein', '79 rue Paul Charles', '13982');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Marie', '69 rue Henri Huet', '33657');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Lemaire', '38 rue Navarro', '12663');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Dupuy-sur-Morel', '23 rue Henri Lacombe', '06150');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Saint Océane-sur-Mer', '9 chemin Hamon', '93163');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Guillot', '892 rue de Neveu', '86687');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Antoine', '89 rue de Maury', '90570');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Brunet', '79 boulevard Gillet', '47132');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Sainte Isaac', '6 rue Eugène Gauthier', '23307');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('Wales', 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', '13 Cil Y Graig', 'LL61');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Saint Adèle-les-Bains', '87 chemin de Jean', '54460');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Coste-sur-Guillaume', '3 rue Bernard Lecomte', '08968');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Saint Anne', '3 rue de Costa', '70510');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Guillot-les-Bains', '63 rue Lucie Roy', '81952');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Marynec', '73 rue Jules Collin', '32379');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Cousin', '95 rue Mathilde Joubert', '83862');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'De Oliveira-les-Bains', '82 rue de Legrand', '27330');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Sainte Paulettenec', '78 rue Delattre', '83416');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Jacob-sur-Coste', '9 chemin Luc Becker', '48688');
INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES ('France', 'Maillet-sur-Mer', '2 rue Berthelot', '30518');

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Client                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Chauvin', 'Émilie', 1, 'émilie.chauvin@gmail.com', '0402300326');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Valentin', 'Véronique', 2, 'véronique.valentin@gmail.com', '0608039558');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Leleu', 'Benjamin', 3, 'benjamin.leleu@gmail.com', '0704815438');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Marchand', 'Anaïs', 4, 'anaïs.marchand@gmail.com', '0403577725');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Lefèvre', 'Martine', 5, 'martine.lefèvre@gmail.com', '0533142540');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Hebert', 'Stéphanie', 6, 'stéphanie.hebert@gmail.com', '0533032414');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Didier', 'Noël', 7, 'noël.didier@gmail.com', '0404567464');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Faivre', 'Élise', 8, 'élise.faivre@gmail.com', '0502318894');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Rodriguez', 'Colette', 9, 'colette.rodriguez@gmail.com', '0533562203');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Ribeiro', 'Olivier', 10, 'olivier.ribeiro@gmail.com', '0702500547');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Diaz', 'Alfred', 11, 'alfred.diaz@gmail.com', '0633359636');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Raymond', 'Antoine', 12, 'antoine.raymond@gmail.com', '0733222035');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Navarro', 'Gilles', 13, 'gilles.navarro@gmail.com', '0405081866');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Gilbert', 'Lucy', 14, 'lucy.gilbert@gmail.com', '0604494855');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Rousset', 'Frédéric', 15, 'frédéric.rousset@gmail.com', '0733021930');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Blanc', 'Lucy', 16, 'lucy.blanc@gmail.com', '0704746188');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Boulanger', 'Alain', 17, 'alain.boulanger@gmail.com', '0504137188');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Dumont', 'Audrey', 18, 'audrey.dumont@gmail.com', '0433024683');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Marques', 'Honoré', 19, 'honoré.marques@gmail.com', '0633188249');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Bernier', 'Susan', 20, 'susan.bernier@gmail.com', '0401583814');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Humbert', 'Tristan', 21, 'tristan.humbert@gmail.com', '0533022813');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Gay', 'Vincent', 22, 'vincent.gay@gmail.com', '0733261084');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Brun', 'Nicole', 23, 'nicole.brun@gmail.com', '0733323040');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Michaud', 'Suzanne', 24, 'suzanne.michaud@gmail.com', '0603542165');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Duhamel', 'Charles', 25, 'charles.duhamel@gmail.com', '0433223280');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Pierre', 'Amélie', 26, 'amélie.pierre@gmail.com', '0533035141');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Dupuis', 'Valérie', 27, 'valérie.dupuis@gmail.com', '0433059610');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Clerc', 'Laetitia', 28, 'laetitia.clerc@gmail.com', '0633243357');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Pires', 'Nath', 29, 'nath.pires@gmail.com', '0433024543');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Lemaire', 'Frédérique', 30, 'frédérique.lemaire@gmail.com', '0733480666');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Maréchal', 'Renée', 31, 'renée.maréchal@gmail.com', '0503595668');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Guibert', 'Nathalie', 32, 'nathalie.guibert@gmail.com', '0533438528');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Lefèvre', 'Hortense', 33, 'hortense.lefèvre@gmail.com', '0433556204');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Peron', 'Audrey', 34, 'audrey.peron@gmail.com', '0433372416');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Brun', 'Étienne', 35, 'étienne.brun@gmail.com', '0433389756');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Legros', 'Charlotte', 36, 'charlotte.legros@gmail.com', '0705086929');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Techer', 'Gabrielle', 37, 'gabrielle.techer@gmail.com', '0504657017');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Guillet', 'Xavier', 38, 'xavier.guillet@gmail.com', '0633035367');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Pages', 'François', 39, 'françois.pages@gmail.com', '0533236071');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Gérard', 'Emmanuel', 40, 'emmanuel.gérard@gmail.com', '0602291448');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Ribeiro', 'Denise', 41, 'denise.ribeiro@gmail.com', '0403541167');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Bouvet', 'Michèle', 42, 'michèle.bouvet@gmail.com', '0433032017');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Lebon', 'Laurent', 43, 'laurent.lebon@gmail.com', '0401601576');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Dupuy', 'Antoinette', 44, 'antoinette.dupuy@gmail.com', '0603524120');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Gonzalez', 'Élodie', 45, 'élodie.gonzalez@gmail.com', '0605580607');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Pierre', 'Virginie', 46, 'virginie.pierre@gmail.com', '0704578903');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Deschamps', 'Adrienne', 47, 'adrienne.deschamps@gmail.com', '0503871703');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Guichard', 'Christophe', 48, 'christophe.guichard@gmail.com', '0701734919');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Leclercq', 'Thibaut', 49, 'thibaut.leclercq@gmail.com', '0533024629');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone) VALUES ('Gomez', 'Laetitia', 50, 'laetitia.gomez@gmail.com', '0733058275');

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Employer                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Raynaud', 'Marguerite', 51, 'marguerite.raynaud@gmail.com', '0403572487', true);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Menard', 'René', 52, 'rené.menard@gmail.com', '0433562360', false);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Godard', 'Nicolas', 53, 'nicolas.godard@gmail.com', '0604279798', false);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Muller', 'Bertrand', 54, 'bertrand.muller@gmail.com', '0402854194', true);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Thierry', 'Xavier', 55, 'xavier.thierry@gmail.com', '0533034504', false);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Lenoir', 'Clémence', 56, 'clémence.lenoir@gmail.com', '0403444782', false);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Pires', 'Thérèse', 57, 'thérèse.pires@gmail.com', '0633048266', false);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Gérard', 'Madeleine', 58, 'madeleine.gérard@gmail.com', '0504868398', true);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Monnier', 'Élise', 59, 'élise.monnier@gmail.com', '0405086402', false);
INSERT INTO Employe (nom, prenom, idAdresse, email, telephone, administrateur) VALUES ('Dumas', 'Aurore', 60, 'aurore.dumas@gmail.com', '0703710344', false);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Produit                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (9, 'Acer Intel Core i9-13900K - Processeur', 100);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (6, 'MSI MacBook Pro 16 - PC portable', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (4, 'Corsair Corsair 4000D - Boitier PC', 200);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (7, 'Corsair HyperX Fury 8GB - Mémoire', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (3, 'MSI Z590 AORUS - Carte Mère', 200);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (3, 'NZXT TUF Gaming X570 - Carte Mère', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (6, 'Acer XPS 13 - PC portable', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (5, 'MSI GTX 1660 Ti - Carte graphique', 200);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (7, 'Kingston Ripjaws V 32GB - Mémoire', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (5, 'Acer Radeon RX 7900 XT - Carte graphique', 100);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (6, 'Asus MacBook Pro 16 - PC portable', 200);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (9, 'Razer Intel Core i7-12700K - Processeur', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (8, 'AMD NZXT Aer P - Ventilateur boitier', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (4, 'Sapphire MasterBox Q300L - Boitier PC', 200);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (8, 'Corsair Corsair LL120 RGB - Ventilateur boitier', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (2, 'Corsair CoolerPro 120 - Watercooling', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (4, 'Kingston Phanteks Eclipse P400A - Boitier PC', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (2, 'Acer HydroBoost 360 - Watercooling', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (2, 'Corsair XtremeFlow 240 - Watercooling', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (7, 'MSI Trident Z RGB 64GB - Mémoire', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (5, 'Intel GeForce RTX 4080 - Carte graphique', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (3, 'Asus Z490 Pro WiFi - Carte Mère', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (8, 'MSI Be Quiet! Pure Wings 2 - Ventilateur boitier', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (3, 'Intel Z590 AORUS - Carte Mère', 100);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (6, 'Razer MacBook Pro 16 - PC portable', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (7, 'Gigabyte Ripjaws V 32GB - Mémoire', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (2, 'MSI XtremeFlow 240 - Watercooling', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (4, 'Kingston Corsair 4000D - Boitier PC', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (2, 'Kingston UltraCool 240 - Watercooling', 200);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (3, 'Sapphire ROG Strix B550 - Carte Mère', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (4, 'Asus Corsair 4000D - Boitier PC', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (7, 'Gigabyte HyperX Fury 8GB - Mémoire', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (2, 'Acer UltraCool 240 - Watercooling', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (9, 'Razer Intel Core i9-13900K - Processeur', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (2, 'Sapphire XtremeFlow 240 - Watercooling', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (6, 'Kingston XPS 13 - PC portable', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (6, 'Corsair Predator Helios 300 - PC portable', 200);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (3, 'Kingston Z490 Pro WiFi - Carte Mère', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (7, 'Acer Trident Z RGB 64GB - Mémoire', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (4, 'Acer Corsair 4000D - Boitier PC', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (8, 'Corsair NZXT Aer P - Ventilateur boitier', 200);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (8, 'Asus Be Quiet! Pure Wings 2 - Ventilateur boitier', 100);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (6, 'MSI ROG Zephyrus G14 - PC portable', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (9, 'Acer AMD Ryzen 5 5600X - Processeur', 400);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (8, 'Gigabyte Corsair LL120 RGB - Ventilateur boitier', 300);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (5, 'Asus GeForce RTX 4080 - Carte graphique', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (3, 'Sapphire Z590 AORUS - Carte Mère', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (4, 'Corsair Phanteks Eclipse P400A - Boitier PC', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (8, 'Sapphire Cooler Master MasterFan - Ventilateur boitier', 500);
INSERT INTO Produit (idCategorie, nomProduit, prixActuel) VALUES (9, 'NZXT Intel Core i7-12700K - Processeur', 200);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Commande                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Commande (idNumCli) VALUES (1, 'true');
INSERT INTO Commande (idNumCli) VALUES (2, 'true');
INSERT INTO Commande (idNumCli) VALUES (3, 'true');
INSERT INTO Commande (idNumCli) VALUES (4, 'true');
INSERT INTO Commande (idNumCli) VALUES (5, 'true');
INSERT INTO Commande (idNumCli) VALUES (6, 'true');
INSERT INTO Commande (idNumCli) VALUES (7, 'true');
INSERT INTO Commande (idNumCli) VALUES (8, 'true');
INSERT INTO Commande (idNumCli) VALUES (9, 'true');
INSERT INTO Commande (idNumCli) VALUES (10, 'true');
INSERT INTO Commande (idNumCli) VALUES (11, 'true');
INSERT INTO Commande (idNumCli) VALUES (12, 'true');
INSERT INTO Commande (idNumCli) VALUES (13, 'true');
INSERT INTO Commande (idNumCli) VALUES (14, 'true');
INSERT INTO Commande (idNumCli) VALUES (15, 'true');
INSERT INTO Commande (idNumCli) VALUES (16, 'true');
INSERT INTO Commande (idNumCli) VALUES (17, 'true');
INSERT INTO Commande (idNumCli) VALUES (18, 'true');
INSERT INTO Commande (idNumCli) VALUES (19, 'true');
INSERT INTO Commande (idNumCli) VALUES (20, 'true');
INSERT INTO Commande (idNumCli) VALUES (21, 'true');
INSERT INTO Commande (idNumCli) VALUES (22, 'true');
INSERT INTO Commande (idNumCli) VALUES (23, 'true');
INSERT INTO Commande (idNumCli) VALUES (24, 'true');
INSERT INTO Commande (idNumCli) VALUES (25, 'true');
INSERT INTO Commande (idNumCli) VALUES (26, 'true');
INSERT INTO Commande (idNumCli) VALUES (27, 'true');
INSERT INTO Commande (idNumCli) VALUES (28, 'true');
INSERT INTO Commande (idNumCli) VALUES (29, 'true');
INSERT INTO Commande (idNumCli) VALUES (30, 'true');
INSERT INTO Commande (idNumCli) VALUES (31, 'true');
INSERT INTO Commande (idNumCli) VALUES (32, 'true');
INSERT INTO Commande (idNumCli) VALUES (33, 'true');
INSERT INTO Commande (idNumCli) VALUES (34, 'true');
INSERT INTO Commande (idNumCli) VALUES (35, 'true');
INSERT INTO Commande (idNumCli) VALUES (36, 'true');
INSERT INTO Commande (idNumCli) VALUES (37, 'true');
INSERT INTO Commande (idNumCli) VALUES (38, 'true');
INSERT INTO Commande (idNumCli) VALUES (39, 'true');
INSERT INTO Commande (idNumCli) VALUES (40, 'true');
INSERT INTO Commande (idNumCli) VALUES (41, 'true');
INSERT INTO Commande (idNumCli) VALUES (42, 'true');
INSERT INTO Commande (idNumCli) VALUES (43, 'true');
INSERT INTO Commande (idNumCli) VALUES (44, 'true');
INSERT INTO Commande (idNumCli) VALUES (45, 'true');
INSERT INTO Commande (idNumCli) VALUES (46, 'true');
INSERT INTO Commande (idNumCli) VALUES (47, 'true');
INSERT INTO Commande (idNumCli) VALUES (48, 'true');
INSERT INTO Commande (idNumCli) VALUES (49, 'true');
INSERT INTO Commande (idNumCli) VALUES (50, 'true');

#/////////////////////////////////////////////////////////////////////////////////////--
#                              insert Commande passé                   
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (4, 4, 3, '2024-09-06', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (25, 25, 2, '2024-04-04', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (19, 19, 3, '2024-03-15', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (11, 11, 3, '2024-08-15', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (7, 7, 1, '2024-05-10', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (43, 43, 2, '2024-10-19', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (28, 28, 1, '2024-04-22', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (2, 2, 3, '2024-04-22', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (20, 20, 3, '2024-03-04', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (24, 24, 2, '2024-02-10', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (37, 37, 2, '2024-09-27', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (16, 16, 1, '2024-11-11', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (32, 32, 3, '2024-09-07', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 1, '2023-12-29', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (19, 19, 3, '2024-05-09', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (41, 41, 1, '2023-12-19', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (24, 24, 3, '2024-07-20', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (3, 3, 1, '2023-12-26', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (12, 12, 1, '2023-12-30', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (23, 23, 3, '2024-05-11', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (15, 15, 2, '2024-08-31', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (40, 40, 1, '2024-06-24', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (4, 4, 3, '2024-05-24', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (46, 46, 3, '2024-10-20', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 1, '2024-02-08', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (5, 5, 2, '2024-08-23', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (17, 17, 2, '2024-10-31', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 3, '2024-07-08', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (4, 4, 2, '2024-07-31', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (29, 29, 2, '2024-07-14', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (21, 21, 2, '2024-10-05', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (6, 6, 3, '2024-06-08', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (9, 9, 2, '2023-12-07', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (13, 13, 2, '2023-12-31', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (14, 14, 2, '2024-05-05', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 3, '2024-06-06', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (32, 32, 3, '2024-01-22', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (7, 7, 3, '2024-06-20', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (5, 5, 2, '2024-03-30', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (9, 9, 3, '2024-09-06', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (17, 17, 2, '2024-08-04', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (43, 43, 2, '2024-06-25', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (42, 42, 3, '2024-04-29', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (45, 45, 1, '2024-07-11', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (11, 11, 1, '2024-11-20', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (20, 20, 2, '2024-07-08', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (33, 33, 1, '2024-06-13', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (24, 24, 2, '2024-06-20', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (17, 17, 1, '2024-09-24', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (50, 50, 1, '2024-05-07', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 2, '2024-01-23', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (4, 4, 3, '2024-07-07', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (21, 21, 3, '2024-11-10', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (3, 3, 2, '2024-04-30', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (17, 17, 1, '2024-01-03', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (41, 41, 2, '2024-03-03', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (6, 6, 1, '2024-02-23', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (41, 41, 1, '2024-10-30', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (37, 37, 1, '2024-01-10', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (10, 10, 3, '2024-05-19', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 1, '2024-11-28', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 3, '2023-12-23', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (3, 3, 1, '2024-06-07', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 3, '2024-04-27', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 1, '2024-09-08', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (25, 25, 3, '2024-06-11', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (12, 12, 1, '2024-03-23', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (19, 19, 1, '2024-03-24', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (11, 11, 3, '2024-06-09', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (46, 46, 1, '2024-11-10', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 3, '2024-10-20', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 3, '2024-07-09', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (10, 10, 2, '2024-09-02', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (12, 12, 1, '2024-03-31', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (10, 10, 1, '2023-12-19', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 1, '2024-02-22', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (33, 33, 2, '2024-07-02', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (7, 7, 3, '2024-08-14', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (23, 23, 2, '2024-06-21', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (48, 48, 3, '2024-02-04', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 2, '2024-05-30', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (33, 33, 2, '2024-01-26', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 1, '2024-09-25', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (20, 20, 3, '2024-04-06', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (24, 24, 3, '2024-02-23', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 1, '2024-05-07', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 3, '2024-04-29', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (7, 7, 3, '2024-02-21', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (48, 48, 3, '2024-11-02', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 1, '2024-10-03', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (10, 10, 3, '2024-11-04', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (15, 15, 2, '2024-03-14', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 1, '2024-06-06', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (42, 42, 1, '2024-06-27', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (1, 1, 2, '2024-05-16', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (22, 22, 2, '2024-08-25', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (22, 22, 1, '2024-03-05', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (15, 15, 2, '2024-08-02', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (1, 1, 3, '2024-02-17', 'false');
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (38, 38, 1, '2024-09-06', 'false');

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert ACommande                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (5, 45, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (5, 21, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (5, 19, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (5, 50, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (5, 31, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (5, 12, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (30, 34, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (30, 20, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (30, 11, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (30, 18, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (18, 8, 4, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (18, 28, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (18, 11, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (18, 47, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (18, 40, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (16, 34, 5, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (16, 38, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (16, 36, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (16, 44, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (16, 23, 6, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (16, 6, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (47, 32, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (47, 8, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (47, 38, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (47, 36, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (13, 7, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (13, 28, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (32, 10, 2, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (32, 34, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (32, 41, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (31, 34, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (31, 46, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (31, 28, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (31, 4, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (22, 33, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (22, 40, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (22, 30, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (22, 21, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (22, 27, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (10, 48, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (10, 49, 7, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (10, 35, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (10, 2, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (10, 22, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (10, 16, 6, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (10, 44, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (36, 37, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (36, 26, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (36, 43, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (36, 32, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (36, 6, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (36, 14, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (36, 30, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (3, 41, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (3, 22, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (3, 18, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (3, 4, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (3, 23, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (3, 43, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (3, 45, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (3, 50, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (41, 50, 4, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (41, 11, 4, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (41, 22, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (41, 47, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (41, 42, 3, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (41, 7, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (14, 14, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (14, 36, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (14, 18, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (14, 19, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (14, 2, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (14, 3, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (14, 44, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (50, 49, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (50, 21, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (50, 4, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (50, 12, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (50, 33, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (24, 3, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (24, 5, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (24, 11, 4, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (24, 20, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (24, 19, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (24, 8, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (24, 27, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 14, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 49, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 9, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 45, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 8, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 47, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 7, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 15, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 29, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (45, 21, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (48, 11, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (48, 44, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (48, 4, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (48, 46, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (33, 48, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (33, 41, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (33, 38, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (33, 50, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (33, 28, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (33, 26, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (33, 45, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (33, 34, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (46, 33, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (46, 25, 5, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (46, 21, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (4, 25, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (4, 27, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (4, 17, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (4, 38, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (4, 4, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (4, 33, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (28, 49, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (28, 30, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (28, 28, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (28, 17, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (28, 5, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (17, 49, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (17, 39, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (17, 3, 4, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (17, 38, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (17, 32, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (17, 27, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (12, 22, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (12, 18, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (12, 33, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (12, 6, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (25, 9, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (25, 4, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (25, 43, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (25, 39, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (25, 2, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (37, 26, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (37, 27, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (37, 22, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (37, 34, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (37, 5, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (29, 27, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (29, 46, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (29, 24, 3, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (29, 18, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (29, 23, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (29, 36, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (42, 45, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (42, 21, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (42, 26, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (42, 23, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (42, 39, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (42, 43, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (23, 22, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (23, 26, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (23, 49, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (23, 7, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (23, 20, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (2, 47, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (2, 10, 2, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (2, 36, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (44, 48, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (44, 1, 2, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (44, 41, 4, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (20, 16, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (20, 17, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (20, 43, 4, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (20, 20, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (40, 36, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (40, 3, 4, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (8, 41, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (8, 30, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (8, 27, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (19, 47, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (19, 18, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (19, 2, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (19, 22, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (9, 20, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (9, 41, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (9, 2, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (9, 3, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (9, 24, 3, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (9, 1, 4, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (9, 43, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (43, 20, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (43, 6, 6, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (43, 23, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (27, 8, 4, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (27, 18, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (27, 25, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (27, 1, 1, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (27, 28, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (27, 50, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (35, 49, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (35, 44, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (35, 18, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (35, 14, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (35, 5, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (35, 20, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (21, 43, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (21, 22, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (7, 45, 3, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (7, 4, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (7, 12, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (7, 22, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (7, 31, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (7, 49, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (7, 17, 2, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (7, 35, 4, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (38, 10, 3, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (38, 11, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (38, 8, 2, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (6, 22, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (6, 1, 2, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (6, 48, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (6, 36, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (26, 6, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (26, 48, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (26, 2, 1, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (26, 4, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (26, 5, 3, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (26, 24, 1, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (15, 4, 4, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (15, 5, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (15, 15, 8, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (1, 46, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (1, 19, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (1, 8, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (1, 43, 3, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (34, 24, 1, 100);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (11, 18, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (11, 44, 1, 400);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (11, 47, 1, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (39, 29, 1, 200);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (39, 32, 2, 300);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (39, 36, 2, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (39, 49, 3, 500);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prix) VALUES (39, 5, 1, 200);
PS C:\Users\titou\OneDrive\Bureau\py> 