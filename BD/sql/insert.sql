#/////////////////////////////////////////////////////////////////////////////////////--
#                            insert MethodePaiement
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO MethodePaiement (nomMethodePaiement) VALUES ('Paypal');
INSERT INTO MethodePaiement (nomMethodePaiement) VALUES ('Visa');
INSERT INTO MethodePaiement (nomMethodePaiement) VALUES ('MasterCard');
INSERT INTO MethodePaiement (nomMethodePaiement) VALUES ('Carte_AE');

#/////////////////////////////////////////////////////////////////////////////////////--
#                            insert payment
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Paypal (idCarte, email, mdp) VALUES (1, 'émilie.chauvin@gmail.com', 'émiliechauvin1974');
INSERT INTO Carte_EU (idCarte, numCarte, dateExp, nomProprietaire) VALUES (2, '123456789012345', '2027-11-03', 'Valentin');
INSERT INTO Carte_AE (idCarte, numCarte, dateExp, nomProprietaire) VALUES (3, '341234567890123', '2029-07-10', 'Leleu');

#/////////////////////////////////////////////////////////////////////////////////////--
#                                   insert Marque
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
INSERT INTO Marque (nomMarque) VALUES ('Gigabyte');   # Carte Mère,  
INSERT INTO Marque (nomMarque) VALUES ('Sapphire');   # Carte graphique

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Categorie
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
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('PC Gaming', 10);
INSERT INTO Categorie (nomCategorie, idCategoriePere) VALUES ('PC Bureautique', 10);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                  insert Image
#/////////////////////////////////////////////////////////////////////////////////////--

# --convention de nommage : (catégorie)_id(nombre)_(numéro de l'image(entre 1 est 3)).webp

INSERT INTO Image (nomImage) VALUES ('carteGraphique.webp');
INSERT INTO Image (nomImage) VALUES ('carteGraphique2.webp'); 
INSERT INTO Image (nomImage) VALUES ('carteGraphique3.webp'); 
INSERT INTO Image (nomImage) VALUES ('pcBureautique.png'); 
INSERT INTO Image (nomImage) VALUES ('pcGaming.webp'); 
INSERT INTO Image (nomImage) VALUES ('pcGaming2.pnd'); 
INSERT INTO Image (nomImage) VALUES ('pcGaming3.png'); 
INSERT INTO Image (nomImage) VALUES ('pcGaming4.webp'); 
INSERT INTO Image (nomImage) VALUES ('processeurIntel.webp');  

# --nouvelle image
INSERT INTO Image (nomImage) VALUES ('Watercooling_id33_1.webp');
INSERT INTO Image (nomImage) VALUES ('Watercooling_id33_2.webp');
INSERT INTO Image (nomImage) VALUES ('Watercooling_id33_3.webp');

INSERT INTO Image (nomImage) VALUES ('Processeur_id1_1.webp');
INSERT INTO Image (nomImage) VALUES ('Processeur_id1_2.webp');

INSERT INTO Image (nomImage) VALUES ('PC Monté_id52_1.webp');
INSERT INTO Image (nomImage) VALUES ('PC Monté_id52_2.webp');
INSERT INTO Image (nomImage) VALUES ('PC Monté_id52_3.webp');

<<<<<<< HEAD
INSERT INTO Image (nomImage) VALUES ('PC Monté_id57_1.webp');
INSERT INTO Image (nomImage) VALUES ('PC Monté_id57_2.webp');
INSERT INTO Image (nomImage) VALUES ('PC Monté_id57_3.webp');

INSERT INTO Image (nomImage) VALUES ('PC Portable_id7_1.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id7_2.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id7_3.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id7_4.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id7_5.webp');

INSERT INTO Image (nomImage) VALUES ('Boitier PC_id40_1.webp');
INSERT INTO Image (nomImage) VALUES ('Boitier PC_id40_2.webp');
INSERT INTO Image (nomImage) VALUES ('Boitier PC_id40_3.webp');
INSERT INTO Image (nomImage) VALUES ('Boitier PC_id40_4.webp');

INSERT INTO Image (nomImage) VALUES ('Watercooling_id18_1.webp');

INSERT INTO Image (nomImage) VALUES ('Processeur_id44_1.webp');
INSERT INTO Image (nomImage) VALUES ('Processeur_id44_2.webp');

INSERT INTO Image (nomImage) VALUES ('Ventilateur-boitier_id13_1.webp');
INSERT INTO Image (nomImage) VALUES ('Ventilateur-boitier_id13_2.webp');
INSERT INTO Image (nomImage) VALUES ('Ventilateur-boitier_id13_3.webp');
INSERT INTO Image (nomImage) VALUES ('Ventilateur-boitier_id13_4.webp');

INSERT INTO Image (nomImage) VALUES ('Ventilateur-boitier_id42_1.webp');
INSERT INTO Image (nomImage) VALUES ('Ventilateur-boitier_id42_2.webp');
INSERT INTO Image (nomImage) VALUES ('Ventilateur-boitier_id42_3.webp');
INSERT INTO Image (nomImage) VALUES ('Ventilateur-boitier_id42_4.webp');

INSERT INTO Image (nomImage) VALUES ('Boitier PC_id31_1.webp');
INSERT INTO Image (nomImage) VALUES ('Boitier PC_id31_2.webp');
INSERT INTO Image (nomImage) VALUES ('Boitier PC_id31_3.webp');
INSERT INTO Image (nomImage) VALUES ('Boitier PC_id31_4.webp');
INSERT INTO Image (nomImage) VALUES ('Boitier PC_id31_5.webp');

INSERT INTO Image (nomImage) VALUES ('carteGraphique_id46_1.webp');
INSERT INTO Image (nomImage) VALUES ('carteGraphique_id46_2.webp');
INSERT INTO Image (nomImage) VALUES ('carteGraphique_id46_3.webp');
INSERT INTO Image (nomImage) VALUES ('carteGraphique_id46_4.webp');
INSERT INTO Image (nomImage) VALUES ('carteGraphique_id46_5.webp');
INSERT INTO Image (nomImage) VALUES ('carteGraphique_id46_6.webp');

INSERT INTO Image (nomImage) VALUES ('PC Portable_id11_1.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id11_2.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id11_3.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id11_4.webp'); 
INSERT INTO Image (nomImage) VALUES ('PC Portable_id11_5.webp'); 

INSERT INTO Image (nomImage) VALUES ('PC Portable_id2_1.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id2_2.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id2_3.webp');
INSERT INTO Image (nomImage) VALUES ('PC Portable_id2_4.webp'); 
INSERT INTO Image (nomImage) VALUES ('PC Portable_id2_5.webp');

INSERT INTO Image (nomImage) VALUES ('Carte Mère_id22_1.webp');
INSERT INTO Image (nomImage) VALUES ('Carte Mère_id22_2.webp');
INSERT INTO Image (nomImage) VALUES ('Carte Mère_id22_3.webp');
INSERT INTO Image (nomImage) VALUES ('Carte Mère_id22_4.webp'); 
INSERT INTO Image (nomImage) VALUES ('Carte Mère_id22_5.webp'); 

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

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Client                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp)  VALUES ('Chauvin', 'Émilie', 1, 'émilie.chauvin@gmail.com', '0402300326', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddc8fef0f8a975e9f5d');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Valentin', 'Véronique', 2, 'véronique.valentin@gmail.com', '0608039558', 'b4b147bc522828731f1a016bfa72c073e0c1e2a6d1e10217df3c3c2a6d4d3182');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Leleu', 'Benjamin', 3, 'benjamin.leleu@gmail.com', '0704815438', '3c59dc048e8850243be8079a5c74d079a9eb8e1a1316d59b9eb3b3c1cf98e7d5');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Marchand', 'Anaïs', 4, 'anaïs.marchand@gmail.com', '0403577725', 'e99a18c428cb38d5f260853678922e03abd83351d3d1f34e39dd6531fc2f21e7');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Lefèvre', 'Martine', 5, 'martine.lefèvre@gmail.com', '0533142540', '098f6bcd4621d373cade4e832627b4f6f5377d243ccd94f6a4678ab4de3d7b10');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Hebert', 'Stéphanie', 6, 'stéphanie.hebert@gmail.com', '0533032414', '3b5d5c3712955042212316173ccf37be80000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Didier', 'Noël', 7, 'noël.didier@gmail.com', '0404567464', '356a192b7913b04c54574d18c28d46e6395428ab000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Faivre', 'Élise', 8, 'élise.faivre@gmail.com', '0502318894', 'da4b9237bacccdf19c0760cab7aec4a8359010b0c1e07a093000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Rodriguez', 'Colette', 9, 'colette.rodriguez@gmail.com', '0533562203', '77de68daecd823babbb58edb1c8e14d7106e83bbb5ac2a7dd300000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Ribeiro', 'Olivier', 10, 'olivier.ribeiro@gmail.com', '0702500547', '1c383cd30b7c298ab50293adfecb7b18b1e683df4b00000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Diaz', 'Alfred', 11, 'alfred.diaz@gmail.com', '0633359636', '7c6a180b36896a0a8c02787eeafb0e4c395cb9e0b84b287000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Raymond', 'Antoine', 12, 'antoine.raymond@gmail.com', '0733222035', '4a8a08f09d37b73795649038408b5f33e5c68db80500000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Navarro', 'Gilles', 13, 'gilles.navarro@gmail.com', '0405081866', '827ccb0eea8a706c4c34a16891f84e7b00000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Gilbert', 'Lucy', 14, 'lucy.gilbert@gmail.com', '0604494855', 'e4da3b7fbbce2345d7772b0674a318d5c00000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Rousset', 'Frédéric', 15, 'frédéric.rousset@gmail.com', '0733021930', '8f14e45fceea167a5a36dedd4bea254300000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Blanc', 'Lucy', 16, 'lucy.blanc@gmail.com', '0704746188', 'c9f0f895fb98ab9159f51fd0297e236d000000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Boulanger', 'Alain', 17, 'alain.boulanger@gmail.com', '0504137188', '45c48cce2e2d7fbdea1afc51c7c6ad2600000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Dumont', 'Audrey', 18, 'audrey.dumont@gmail.com', '0433024683', 'd3d9446802a44259755d38e6d163e820000000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Marques', 'Honoré', 19, 'honoré.marques@gmail.com', '0633188249', '6512bd43d9caa6e02c990b0a82652dca00000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Bernier', 'Susan', 20, 'susan.bernier@gmail.com', '0401583814', 'c20ad4d76fe97759aa27a0c99bff671000000000000000000000000000000000');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Humbert', 'Tristan', 21, 'tristan.humbert@gmail.com', '0533022813', 'e99a18c428cb38d5f260853678922e03');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Gay', 'Vincent', 22, 'vincent.gay@gmail.com', '0733261084', '098f6bcd4621d373cade4e832627b4f6');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Brun', 'Nicole', 23, 'nicole.brun@gmail.com', '0733323040', '3b5d5c3712955042212316173ccf37be');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Michaud', 'Suzanne', 24, 'suzanne.michaud@gmail.com', '0603542165', '356a192b7913b04c54574d18c28d46e6395428ab');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Duhamel', 'Charles', 25, 'charles.duhamel@gmail.com', '0433223280', 'da4b9237bacccdf19c0760cab7aec4a8359010b0');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Pierre', 'Amélie', 26, 'amélie.pierre@gmail.com', '0533035141', '77de68daecd823babbb58edb1c8e14d7106e83bb');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Dupuis', 'Valérie', 27, 'valérie.dupuis@gmail.com', '0433059610', '1c383cd30b7c298ab50293adfecb7b18');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Clerc', 'Laetitia', 28, 'laetitia.clerc@gmail.com', '0633243357', '7c6a180b36896a0a8c02787eeafb0e4c');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Pires', 'Nath', 29, 'nath.pires@gmail.com', '0433024543', '4a8a08f09d37b73795649038408b5f33');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Lemaire', 'Frédérique', 30, 'frédérique.lemaire@gmail.com', '0733480666', '827ccb0eea8a706c4c34a16891f84e7b');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Maréchal', 'Renée', 31, 'renée.maréchal@gmail.com', '0503595668', 'e4da3b7fbbce2345d7772b0674a318d5');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Guibert', 'Nathalie', 32, 'nathalie.guibert@gmail.com', '0533438528', '8f14e45fceea167a5a36dedd4bea2543');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Lefèvre', 'Hortense', 33, 'hortense.lefèvre@gmail.com', '0433556204', 'c9f0f895fb98ab9159f51fd0297e236d');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Peron', 'Audrey', 34, 'audrey.peron@gmail.com', '0433372416', '45c48cce2e2d7fbdea1afc51c7c6ad26');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Brun', 'Étienne', 35, 'étienne.brun@gmail.com', '0433389756', 'd3d9446802a44259755d38e6d163e820');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Legros', 'Charlotte', 36, 'charlotte.legros@gmail.com', '0705086929', '6512bd43d9caa6e02c990b0a82652dca');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Techer', 'Gabrielle', 37, 'gabrielle.techer@gmail.com', '0504657017', 'c20ad4d76fe97759aa27a0c99bff6710');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Guillet', 'Xavier', 38, 'xavier.guillet@gmail.com', '0633035367', 'c51ce410c124a10e0db5e4b97fc2af39');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Pages', 'François', 39, 'françois.pages@gmail.com', '0533236071', 'aab3238922bcc25a6f606eb525ffdc56');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Gérard', 'Emmanuel', 40, 'emmanuel.gérard@gmail.com', '0602291448', '9bf31c7ff062936a96d3c8bd1f8f2ff3');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Ribeiro', 'Denise', 41, 'denise.ribeiro@gmail.com', '0403541167', 'c74d97b01eae257e44aa9d5bade97baf');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Bouvet', 'Michèle', 42, 'michèle.bouvet@gmail.com', '0433032017', '70efdf2ec9b086079795c442636b55fb');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Lebon', 'Laurent', 43, 'laurent.lebon@gmail.com', '0401601576', '6f4922f45568161a8cdf4ad2299f6d23');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Dupuy', 'Antoinette', 44, 'antoinette.dupuy@gmail.com', '0603524120', '1f0e3dad99908345f7439f8ffabdffc4');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Gonzalez', 'Élodie', 45, 'élodie.gonzalez@gmail.com', '0605580607', '98f13708210194c475687be6106a3b84');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Pierre', 'Virginie', 46, 'virginie.pierre@gmail.com', '0704578903', '3c59dc048e8850243be8079a5c74d079');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Deschamps', 'Adrienne', 47, 'adrienne.deschamps@gmail.com', '0503871703', 'b6d767d2f8ed5d21a44b0e5886680cb9');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Guichard', 'Christophe', 48, 'christophe.guichard@gmail.com', '0701734919', '37693cfc748049e45d87b8c7d8b9aacd');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Leclercq', 'Thibaut', 49, 'thibaut.leclercq@gmail.com', '0533024629', '1ff1de774005f8da13f42943881c655f');
INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES ('Gomez', 'Laetitia', 50, 'laetitia.gomez@gmail.com', '0733058275', '8e296a067a37563370ded05f5a3bf3ec');


#/////////////////////////////////////////////////////////////////////////////////////--
#                            insert infoPaiement
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO infoPaiement (idNumCli, idCarte, idMethodePaiement) VALUES (1, 1, 1);
INSERT INTO infoPaiement (idNumCli, idCarte, idMethodePaiement) VALUES (2, 2, 3);
INSERT INTO infoPaiement (idNumCli, idCarte, idMethodePaiement) VALUES (3, 3, 4);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Employe                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Raynaud', 'Marguerite', 'marguerite.raynaud@buildmypc.com', '0403572487', 'ef92b778bafe771e89245b89ecbc160a6e5b57a661d692ba39b2e9bd2f3fd91a', true);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Menard', 'René', 'rené.menard@buildmypc.com', '0433562360', 'fc7c4e60c1ec62f7c75b1c04b8d43011d4355a473f004d1c4d5cb71d04f3bc5d', false);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Godard', 'Nicolas', 'nicolas.godard@buildmypc.com', '0604279798', '8c6976e5b5410415bde908bd4dee15dfb16b6201e4e8a7001b5df7c43c8c741e', false);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Muller', 'Bertrand', 'bertrand.muller@buildmypc.com', '0402854194', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd14dfd79c3c7f9e1f5', true);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Thierry', 'Xavier', 'xavier.thierry@buildmypc.com', '0533034504', 'd8578edf8458ce06fbc5bb76a58c5ca4a6d22bf6b2c76f05c4ecca1d252b2955', false);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Lenoir', 'Clémence', 'clémence.lenoir@buildmypc.com', '0403444782', 'd41d8cd98f00b204e9800998ecf8427e', false);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Pires', 'Thérèse', 'thérèse.pires@buildmypc.com', '0633048266', '900150983cd24fb0d6963f7d28e17f72', false);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Gérard', 'Madeleine', 'madeleine.gérard@buildmypc.com', '0504868398', 'e99a18c428cb38d5f260853678922e03', true);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Monnier', 'Élise', 'élise.monnier@buildmypc.com', '0405086402', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441dc70e2b86f698a36b0ebc123', false);
INSERT INTO Employe (nom, prenom, email, telephone, mdp, administrateur) VALUES ('Dumas', 'Aurore', 'aurore.dumas@buildmypc.com', '0703710344', '6cb75f652a9b52798eb6cf2201057c73e0677b4d80dbd42d2ce9913df25d8a71', false);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Produit                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (9, 'Acer Intel Core i9-13900K', 599.99, 50, 'Processeur haut de gamme Intel Core i9', 2);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (6, 'MSI MacBook Pro 16', 2499.99, 25, 'PC portable haute performance pour professionnels', 1);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (4, 'Corsair Corsair 4000D', 89.99, 30, 'Boitier PC spacieux avec bonne ventilation', 3);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (7, 'Corsair HyperX Fury 8GB', 39.99, 60, 'Mémoire DDR4 de 8GB pour PC gamer', 3);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (3, 'MSI Z590 AORUS', 249.99, 15, 'Carte mère compatible Intel Z590', 1);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (3, 'NZXT TUF Gaming X570', 179.99, 45, 'Carte mère AMD X570 pour PC gamer', 8);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (6, 'Acer XPS 13', 1499.99, 20, 'PC portable léger et performant', 2);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (5, 'MSI GTX 1660 Ti', 299.99, 35, 'GTX 1660 Ti pour gaming', 1);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (7, 'Kingston Ripjaws V 32GB', 119.99, 80, 'Mémoire DDR4 32GB pour gaming', 10);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (5, 'Acer Radeon RX 7800 XT', 1299.99, 18, 'Haut de gamme Radeon RX 7800', 2);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (6, 'Asus MacBook Pro 16', 2499.99, 40, 'PC portable haute performance Asus', 6);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (9, 'Razer Intel Core i7-12700K', 399.99, 55, 'Processeur Intel Core i7-12700K', 7);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (8, 'AMD NZXT Aer P', 49.99, 25, 'Ventilateur boitier de 120mm pour refroidissement', 5);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (4, 'Sapphire MasterBox Q300L', 79.99, 22, 'Boitier PC compact et fonctionnel', 12);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (8, 'Corsair Corsair LL120 RGB', 59.99, 35, 'Ventilateur RGB de 120mm', 3);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (2, 'Corsair CoolerPro 120', 99.99, 50, 'Système de refroidissement liquide pour CPU', 9);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (4, 'Kingston Phanteks Eclipse P400A', 89.99, 65, 'Boitier PC avec panneaux en mesh et bonne ventilation', 10);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (2, 'Acer HydroBoost 360', 149.99, 15, 'Système de watercooling 360mm pour CPU', 2);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (2, 'Corsair XtremeFlow 240', 119.99, 25, 'Système de watercooling 240mm', 3);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (7, 'MSI Trident Z RGB 64GB', 249.99, 80, 'Mémoire DDR4 64GB pour gaming', 1);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (5, 'Intel GeForce RTX 4080', 1599.99, 12, 'Haut de gamme RTX 4080', 4);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (3, 'Asus Z490 Pro WiFi', 249.99, 30, 'Carte mère avec support WiFi et Intel Z490', 6);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (8, 'MSI Be Quiet! Pure Wings 2', 29.99, 45, 'Ventilateur PC silencieux de 120mm', 1);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (3, 'Intel Z590 AORUS', 349.99, 30, 'Carte mère Intel Z590 AORUS', 4);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (6, 'Razer MacBook Pro 16', 2499.99, 25, 'PC portable performant Razer', 7);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (7, 'Gigabyte Ripjaws V 32GB', 119.99, 75, 'Mémoire DDR4 32GB', 11);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (2, 'MSI XtremeFlow 240', 129.99, 40, 'Watercooling 240mm', 1);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (4, 'Kingston Corsair 4000D', 109.99, 25, 'Boitier PC de grande capacité', 10);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (2, 'Kingston UltraCool 240', 89.99, 60, 'Système de refroidissement liquide 240mm', 10);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (3, 'Sapphire ROG Strix B550', 179.99, 55, 'Carte mère AMD B550 ROG Strix', 12);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (4, 'Asus Corsair 4000D', 119.99, 65, 'Boitier PC solide avec bonne ventilation', 6);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (7, 'Gigabyte HyperX Fury 8GB', 39.99, 50, 'Mémoire DDR4 8GB pour PC', 11);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (2, 'Acer UltraCool 240', 99.99, 70, 'Système de watercooling 240mm', 2);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (9, 'Razer Intel Core i9-13900K', 599.99, 50, 'Processeur Intel Core i9-13900K', 7);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (2, 'Sapphire XtremeFlow 240', 119.99, 45, 'Watercooling 240mm', 12);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (6, 'Kingston XPS 13', 1599.99, 30, 'PC portable performant Kingston', 10);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (6, 'Corsair Predator Helios 300', 1699.99, 40, 'PC portable gaming Corsair', 3);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (3, 'Kingston Z490 Pro WiFi', 249.99, 30, 'Carte mère Kingston Z490 avec WiFi', 10);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (7, 'Acer Trident Z RGB 64GB', 249.99, 20, 'Mémoire DDR4 64GB pour PC gaming', 2);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (4, 'Acer Corsair 4000D', 99.99, 35, 'Boitier PC avec bonne gestion de l’airflow', 2);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (8, 'Corsair NZXT Aer P', 39.99, 25, 'Ventilateur PC efficace de 120mm', 3);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (8, 'Asus Be Quiet! Pure Wings 2', 19.99, 20, 'Ventilateur de boitier silencieux', 6);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (6, 'MSI ROG Zephyrus G14', 1499.99, 40, 'PC portable haute performance pour gaming', 1);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (9, 'Acer AMD Ryzen 5 5600X', 299.99, 50, 'Processeur AMD Ryzen 5 5600X', 2);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (8, 'Gigabyte Corsair LL120 RGB', 59.99, 15, 'Ventilateur RGB Corsair 120mm', 11);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (5, 'Asus GeForce RTX 4080', 1599.99, 30, 'Asus GeForce RTX 4080', 6);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (3, 'Sapphire Z590 AORUS', 329.99, 40, 'Carte mère Intel Z590 AORUS', 12);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (4, 'Corsair Phanteks Eclipse P400A', 99.99, 25, 'Boitier PC Phanteks Eclipse P400A', 3);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (8, 'Sapphire Cooler Master MasterFan', 49.99, 18, 'Ventilateur de boitier Cooler Master 120mm', 9);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (9, 'NZXT Intel Core i7-12700K', 399.99, 70, 'Processeur Intel Core i7-12700K', 8);

INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (11, 'PC Gamer RTX 4080 Beast', 2799.99, 30, 'Performance ultime avec carte graphique RTX 4080, processeur Intel i7, 32 Go de RAM et refroidissement liquide.', 4);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (11, 'HP Omen Envy Pro X', 1899.99, 50, 'Tour élégante et puissante avec processeur Intel i5, carte graphique RTX 3070 et SSD 1 To.', 4);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (11, 'Lenovo Legion Tower X', 1599.99, 40, 'Idéal pour les gamers : processeur Ryzen 7, carte graphique GTX 1660 Ti, 16 Go de RAM et design LED.', 5);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (11, 'PC Gamer RTX 4090 Mega Power', 3599.99, 20, 'Configuration ultra-haut de gamme avec carte graphique RTX 4090, processeur Intel i9, 64 Go de RAM et boîtier RGB premium.', 4);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (11, 'Dell Alienware Aurora', 2399.99, 15, 'Futuriste et puissant avec processeur Intel i7, carte graphique RTX 4080 et système de refroidissement avancé.', 5);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (11, 'Gigabyte Aorus Extreme', 2199.99, 55, 'Performance équilibrée avec processeur Ryzen 9, carte graphique RTX 4070, SSD 2 To et design compact.', 4);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (11, 'PC Gamer Ryzen 5 Shadow', 1299.99, 76, 'Tour silencieuse et efficace avec processeur Ryzen 5, carte graphique RTX 3060 et SSD 512 Go.', 5);
INSERT INTO Produit (idCategorie, nomProduit, prix, stock, descriptionProduit, idMarque) VALUES (11, 'MSI Infinite X 3D Max', 2499.99, 64, 'Pour les créateurs et gamers avec processeur Intel i7, carte graphique RTX 4080, 32 Go de RAM et système LED RGB.', 1);


#/////////////////////////////////////////////////////////////////////////////////////--
#                              insert Commande passé                   
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (4, 4, 3, '2024-09-06', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (25, 25, 2, '2024-04-04', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (19, 19, 3, '2024-03-15', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (11, 11, 3, '2024-08-15', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (7, 7, 1, '2024-05-10', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (43, 43, 2, '2024-10-19', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (28, 28, 1, '2024-04-22', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (2, 2, 3, '2024-04-22', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (20, 20, 3, '2024-03-04', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (24, 24, 2, '2024-02-10', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (37, 37, 2, '2024-09-27', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (16, 16, 1, '2024-11-11', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (32, 32, 3, '2024-09-07', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 1, '2023-12-29', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (19, 19, 3, '2024-05-09', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (41, 41, 1, '2023-12-19', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (24, 24, 3, '2024-07-20', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (3, 3, 1, '2023-12-26', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (12, 12, 1, '2023-12-30', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (23, 23, 3, '2024-05-11', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (15, 15, 2, '2024-08-31', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (40, 40, 1, '2024-06-24', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (4, 4, 3, '2024-05-24', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (46, 46, 3, '2024-10-20', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 1, '2024-02-08', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (5, 5, 2, '2024-08-23', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (17, 17, 2, '2024-10-31', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 3, '2024-07-08', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (4, 4, 2, '2024-07-31', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (29, 29, 2, '2024-07-14', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (21, 21, 2, '2024-10-05', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (6, 6, 3, '2024-06-08', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (9, 9, 2, '2023-12-07', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (13, 13, 2, '2023-12-31', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (14, 14, 2, '2024-05-05', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 3, '2024-06-06', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (32, 32, 3, '2024-01-22', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (7, 7, 3, '2024-06-20', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (5, 5, 2, '2024-03-30', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (9, 9, 3, '2024-09-06', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (17, 17, 2, '2024-08-04', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (43, 43, 2, '2024-06-25', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (42, 42, 3, '2024-04-29', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (45, 45, 1, '2024-07-11', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (11, 11, 1, '2024-11-20', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (20, 20, 2, '2024-07-08', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (33, 33, 1, '2024-06-13', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (24, 24, 2, '2024-06-20', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (17, 17, 1, '2024-09-24', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (50, 50, 1, '2024-05-07', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 2, '2024-01-23', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (4, 4, 3, '2024-07-07', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (21, 21, 3, '2024-11-10', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (3, 3, 2, '2024-04-30', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (17, 17, 1, '2024-01-03', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (41, 41, 2, '2024-03-03', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (6, 6, 1, '2024-02-23', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (41, 41, 1, '2024-10-30', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (37, 37, 1, '2024-01-10', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (10, 10, 3, '2024-05-19', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 1, '2024-11-28', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 3, '2023-12-23', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (3, 3, 1, '2024-06-07', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 3, '2024-04-27', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 1, '2024-09-08', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (25, 25, 3, '2024-06-11', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (12, 12, 1, '2024-03-23', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (19, 19, 1, '2024-03-24', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (11, 11, 3, '2024-06-09', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (46, 46, 1, '2024-11-10', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 3, '2024-10-20', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 3, '2024-07-09', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (10, 10, 2, '2024-09-02', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (12, 12, 1, '2024-03-31', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (10, 10, 1, '2023-12-19', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 1, '2024-02-22', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (33, 33, 2, '2024-07-02', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (7, 7, 3, '2024-08-14', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (23, 23, 2, '2024-06-21', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (48, 48, 3, '2024-02-04', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 2, '2024-05-30', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (33, 33, 2, '2024-01-26', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (36, 36, 1, '2024-09-25', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (20, 20, 3, '2024-04-06', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (24, 24, 3, '2024-02-23', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 1, '2024-05-07', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 3, '2024-04-29', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (7, 7, 3, '2024-02-21', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (48, 48, 3, '2024-11-02', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (35, 35, 1, '2024-10-03', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (10, 10, 3, '2024-11-04', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (15, 15, 2, '2024-03-14', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (27, 27, 1, '2024-06-06', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (42, 42, 1, '2024-06-27', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (1, 1, 2, '2024-05-16', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (22, 22, 2, '2024-08-25', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (22, 22, 1, '2024-03-05', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (15, 15, 2, '2024-08-02', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (1, 1, 3, '2024-02-17', false);
INSERT INTO Commande (idNumCli, idAdresse, idMethodePaiement, dateCommande, estPanierActuel) VALUES (38, 38, 1, '2024-09-06', false);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Commande                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (1, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (2, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (3, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (4, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (5, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (6, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (7, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (8, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (9, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (10, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (11, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (12, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (13, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (14, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (15, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (16, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (17, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (18, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (19, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (20, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (21, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (22, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (23, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (24, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (25, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (26, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (27, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (28, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (29, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (30, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (31, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (32, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (33, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (34, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (35, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (36, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (37, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (38, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (39, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (40, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (41, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (42, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (43, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (44, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (45, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (46, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (47, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (48, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (49, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (50, true);

# test
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (51, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (76, true);
INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (75, true);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert ACommande                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 50, 4, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 9, 1, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 4, 3, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 43, 3, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 23, 4, 29.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 16, 4, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 30, 2, 179.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 2, 2, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (31, 17, 4, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (33, 43, 2, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (33, 12, 1, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (33, 29, 3, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (33, 44, 4, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (24, 3, 3, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (24, 38, 1, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (24, 4, 1, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (1, 16, 4, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (1, 31, 1, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (1, 3, 1, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (1, 5, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (1, 1, 2, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (17, 48, 3, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (17, 5, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (17, 22, 1, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (17, 31, 1, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (17, 14, 3, 79.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (17, 17, 3, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (41, 24, 3, 349.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (41, 44, 1, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (41, 22, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (41, 38, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (41, 36, 4, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (41, 15, 3, 59.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 5, 1, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 33, 1, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 47, 4, 329.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 8, 2, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 49, 4, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 38, 1, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 7, 4, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 44, 1, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (38, 17, 4, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (39, 10, 3, 1299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (39, 19, 5, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (39, 5, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (39, 40, 3, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (39, 34, 2, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (29, 37, 2, 1699.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (29, 7, 3, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (29, 11, 3, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (29, 50, 3, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (29, 30, 2, 179.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (29, 35, 1, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (29, 28, 1, 109.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 41, 2, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 12, 1, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 32, 1, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 50, 3, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 25, 3, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 38, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 11, 2, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 44, 1, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (18, 49, 2, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (44, 29, 2, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (44, 41, 4, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (44, 26, 1, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (40, 30, 2, 179.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (40, 6, 1, 179.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (40, 21, 3, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (40, 15, 4, 59.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (40, 36, 4, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (40, 14, 4, 79.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (15, 46, 1, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (15, 23, 4, 29.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (15, 40, 1, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (15, 34, 2, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (48, 39, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (48, 18, 2, 149.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (30, 12, 3, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (30, 8, 4, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (30, 43, 1, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (30, 18, 1, 149.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (26, 12, 3, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (26, 31, 3, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (26, 49, 4, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (26, 19, 4, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (26, 33, 3, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (47, 8, 3, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (47, 16, 4, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (47, 42, 4, 19.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (47, 2, 3, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (47, 44, 1, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (47, 29, 3, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (47, 41, 2, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (47, 46, 4, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (5, 34, 1, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (5, 39, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (5, 3, 4, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (25, 3, 1, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (25, 41, 2, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (22, 20, 6, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (22, 11, 1, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (22, 14, 1, 79.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (22, 19, 1, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (34, 37, 1, 1699.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (34, 23, 2, 29.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (34, 43, 3, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (34, 31, 1, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (34, 46, 4, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (34, 16, 1, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (34, 44, 4, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (10, 13, 4, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (10, 27, 3, 129.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (36, 23, 4, 29.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (36, 13, 1, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (36, 41, 2, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (36, 20, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (36, 48, 1, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (36, 15, 3, 59.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (36, 37, 2, 1699.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (36, 45, 3, 59.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (14, 17, 2, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (14, 2, 1, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (14, 28, 4, 109.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (14, 27, 1, 129.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (14, 31, 3, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (14, 19, 3, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (14, 15, 4, 59.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (32, 48, 2, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (32, 39, 1, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (13, 9, 4, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (13, 2, 1, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (13, 10, 2, 1299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (13, 43, 4, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (13, 33, 2, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (23, 5, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (23, 4, 4, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (23, 43, 1, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (23, 24, 4, 349.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (4, 38, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (4, 46, 3, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (42, 17, 4, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (42, 37, 3, 1699.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 39, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 23, 2, 29.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 11, 1, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 27, 2, 129.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 5, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 22, 5, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 37, 2, 1699.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 8, 1, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 43, 4, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (35, 17, 4, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (16, 44, 3, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (46, 26, 3, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (46, 12, 2, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (46, 44, 4, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 40, 2, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 3, 3, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 50, 4, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 5, 1, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 29, 3, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 32, 1, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 42, 1, 19.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 43, 2, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 39, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (49, 1, 4, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (37, 22, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (37, 39, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (37, 21, 2, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (37, 33, 4, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (50, 12, 3, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (50, 7, 3, 1499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (50, 4, 1, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (50, 40, 1, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (50, 1, 2, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (2, 21, 4, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (2, 4, 1, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (2, 24, 2, 349.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (2, 47, 1, 329.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (8, 22, 1, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (8, 40, 1, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (21, 10, 1, 1299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (21, 12, 1, 399.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (21, 38, 4, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (21, 15, 1, 59.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (3, 24, 2, 349.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (3, 36, 1, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (3, 35, 3, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (3, 22, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (3, 27, 3, 129.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (11, 21, 3, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (11, 37, 3, 1699.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (11, 28, 4, 109.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (11, 48, 1, 99.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (11, 19, 2, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (11, 46, 3, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (12, 34, 1, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (12, 20, 1, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (12, 14, 2, 79.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (12, 38, 4, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (12, 26, 1, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (12, 8, 4, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (12, 37, 3, 1699.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (12, 3, 3, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (20, 49, 4, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (20, 28, 3, 109.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (20, 35, 3, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (20, 10, 2, 1299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (20, 23, 4, 29.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (7, 32, 3, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (7, 47, 3, 329.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (7, 26, 4, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (7, 19, 2, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (7, 13, 3, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (28, 24, 3, 349.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (28, 32, 4, 39.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (28, 31, 4, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (28, 44, 2, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (28, 29, 2, 89.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (27, 30, 2, 179.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (27, 10, 4, 1299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (27, 20, 3, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (27, 44, 4, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (19, 27, 1, 129.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (19, 34, 1, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (19, 25, 1, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (19, 13, 4, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (19, 49, 1, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (19, 8, 2, 299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (19, 11, 2, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (43, 37, 3, 1699.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (43, 2, 4, 2499.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (6, 21, 3, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (6, 13, 1, 49.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (6, 35, 4, 119.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (6, 18, 3, 149.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (9, 18, 2, 149.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (9, 38, 2, 249.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (9, 10, 2, 1299.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (9, 36, 4, 1599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (45, 24, 2, 349.99);

# test insert

INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (172, 1, 1, 599.99);
INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (172, 56, 1, 2199.99);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                   insert Avis               
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (18, 10, 3, 3, 'La  Acer Radeon RX 7900 XT est-elle compatible avec un PC gamer classique ?', 'Oui, cette  est compatible avec la plupart des configurations gamer modernes. Assurez-vous d’avoir une alimentation suffisante.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (42, 17, 5, 2, 'Le boitier Kingston Phanteks Eclipse P400A est-il adapté pour les cartes mères ATX ?', 'Oui, il est compatible avec les cartes mères ATX, micro-ATX, et mini-ITX.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (12, 39, 1, 4, 'La souris Logitech G502 Hero est-elle compatible avec macOS ?', 'Oui, elle est compatible avec macOS, bien que certaines fonctionnalités puissent nécessiter le logiciel Logitech G Hub.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (27, 25, 1, 2, 'Le clavier mécanique Razer BlackWidow est-il résistant aux éclaboussures ?', 'Oui, il est conçu pour résister aux éclaboussures et aux poussières légères.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (8, 4, 1, 5, 'Produit de bonne qualité, fonctionne parfaitement.', 'Merci pour votre avis, nous sommes heureux que le produit vous satisfasse.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (40, 42, 4, 5, 'Livraison rapide, très satisfait de mon achat.', 'Nous sommes ravis que votre expérience d’achat ait été positive.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (2, 25, 3, 3, 'Design élégant et finition impeccable.', 'Nous vous remercions pour votre retour. Le design est effectivement un de nos points forts.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (31, 39, 2, 2, 'Bon rapport qualité-prix, je recommande.', 'Merci pour votre recommandation, cela nous motive à continuer à offrir des produits de qualité.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (24, 14, 4, 2, 'Produit reçu dans un emballage impeccable.', 'Nous sommes heureux de savoir que l’emballage a répondu à vos attentes.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (47, 47, 5, 5, 'Fonctionne parfaitement, rien à redire.', 'Merci pour votre avis positif, nous apprécions votre retour.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (23, 31, 2, 3, 'Très facile à utiliser, satisfait.', 'Nous sommes ravis d’apprendre que le produit est facile à utiliser et vous satisfait.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (18, 2, 1, 3, 'Superbe produit, conforme à la description.', 'Merci pour votre retour, nous nous efforçons de fournir des produits fidèles à leur description.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (42, 42, 3, 2, 'Produit de qualité moyenne, pourrait être amélioré.', 'Nous prenons en compte vos remarques pour améliorer nos produits.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (29, 4, 3, 5, 'Très bon produit, je recommande vivement.', 'Merci pour votre recommandation, cela nous fait très plaisir.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (15, 4, 3, 4, 'Produit pratique et performant.', 'Nous sommes heureux que le produit réponde à vos attentes.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (38, 22, 1, 3, 'Très satisfait, conforme à mes attentes.', 'Votre satisfaction est notre priorité, merci pour votre avis.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (16, 49, 5, 5, 'Produit robuste et bien conçu.', 'Merci pour votre retour, nous sommes ravis que la qualité vous plaise.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (8, 26, 5, 4, 'Fonctionne bien, très content.', 'Nous sommes ravis que le produit fonctionne à votre convenance.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (29, 49,4, 4, 'Qualité supérieure, je suis ravi.', 'Nous sommes heureux que la qualité du produit vous ait convaincu.');
INSERT INTO Avis (idNumCli, idNumProduit, idNumEmploye, note, txtAvis, txtReponse) VALUES (25, 27, 3, 3, 'Bon produit, service client très réactif.', 'Merci pour votre retour, nous sommes ravis que notre service client ait pu répondre à vos attentes.');

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Comporte               
#/////////////////////////////////////////////////////////////////////////////////////--

# pc 1 #
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (51, 46); # 
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (51, 50); # Processeur
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (51, 29); # refroidissement
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (51, 3);  # boitier
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (51, 9);  # Mémoire

# pc 2 #
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (52, 10);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (52, 12);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (52, 16);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (52, 17);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (52, 20);

# pc 3 #
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (53, 21);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (53, 50);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (53, 13);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (53, 40);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (53, 4);

# pc 4 #
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (54, 21);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (54, 1);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (54, 12);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (54, 28);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (54, 32);

# pc 5 #
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (55, 8);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (55, 34);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (55, 13);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (55, 14);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (55, 26);

# pc 6 #
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (56, 10);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (56, 44);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (56, 12);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (56, 48);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (56, 39);

# pc 7 #
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (57, 46);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (57, 34);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (57, 29);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (57, 40);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (57, 20);

# pc 8 #
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (58, 21);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (58, 50);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (58, 13);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (58, 17);
INSERT INTO Comporte (idNumProduitComportant, idNumProduitComporte) VALUES (58, 4);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Contient               
#/////////////////////////////////////////////////////////////////////////////////////--

-- idProduit 1 : processeur 
INSERT INTO Contient (idNumProduit, idImage) VALUES (1, 13);
INSERT INTO Contient (idNumProduit, idImage) VALUES (1, 14);
INSERT INTO Contient (idNumProduit, idImage) VALUES (1, );

-- idProduit 2 : PC portable
INSERT INTO Contient (idNumProduit, idImage) VALUES (2, 57);
INSERT INTO Contient (idNumProduit, idImage) VALUES (2, 58);
INSERT INTO Contient (idNumProduit, idImage) VALUES (2, 59);
INSERT INTO Contient (idNumProduit, idImage) VALUES (2, 60);
INSERT INTO Contient (idNumProduit, idImage) VALUES (2, 61);

-- idProduit 3 : Boitier PC
INSERT INTO Contient (idNumProduit, idImage) VALUES (3, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (3, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (3, );

-- idProduit 4 : Mémoire
INSERT INTO Contient (idNumProduit, idImage) VALUES (4, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (4, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (4, );

-- idProduit 5 : Carte mère
INSERT INTO Contient (idNumProduit, idImage) VALUES (5, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (5, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (5, );

-- idProduit 6 : Carte mère
INSERT INTO Contient (idNumProduit, idImage) VALUES (6, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (6, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (6, );

-- idProduit 7 : PC portable
INSERT INTO Contient (idNumProduit, idImage) VALUES (7, 21);
INSERT INTO Contient (idNumProduit, idImage) VALUES (7, 22);
INSERT INTO Contient (idNumProduit, idImage) VALUES (7, 23);
INSERT INTO Contient (idNumProduit, idImage) VALUES (7, 24);
INSERT INTO Contient (idNumProduit, idImage) VALUES (7, 25);

-- idProduit 8 : Carte graphique
INSERT INTO Contient (idNumProduit, idImage) VALUES (8, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (8, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (8, );

-- idProduit 9 : Mémoire
INSERT INTO Contient (idNumProduit, idImage) VALUES (9, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (9, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (9, );

-- idProduit 10 : Carte graphique
INSERT INTO Contient (idNumProduit, idImage) VALUES (10, 3);
INSERT INTO Contient (idNumProduit, idImage) VALUES (10, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (10, );

-- idProduit 11 : PC portable
INSERT INTO Contient (idNumProduit, idImage) VALUES (11, 52);
INSERT INTO Contient (idNumProduit, idImage) VALUES (11, 53);
INSERT INTO Contient (idNumProduit, idImage) VALUES (11, 54);
INSERT INTO Contient (idNumProduit, idImage) VALUES (11, 55);
INSERT INTO Contient (idNumProduit, idImage) VALUES (11, 56);

-- idProduit 12 : Processeur
INSERT INTO Contient (idNumProduit, idImage) VALUES (12, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (12, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (12, );

-- idProduit 13 : Ventilateur
INSERT INTO Contient (idNumProduit, idImage) VALUES (13, 33);
INSERT INTO Contient (idNumProduit, idImage) VALUES (13, 34);
INSERT INTO Contient (idNumProduit, idImage) VALUES (13, 35);
INSERT INTO Contient (idNumProduit, idImage) VALUES (13, 36);

-- idProduit 14 : Boitier PC
INSERT INTO Contient (idNumProduit, idImage) VALUES (14, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (14, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (14, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (14, );

-- idProduit 15 : Ventilateur
INSERT INTO Contient (idNumProduit, idImage) VALUES (15, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (15, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (15, );

-- idProduit 16 : watercooling
INSERT INTO Contient (idNumProduit, idImage) VALUES (16, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (16, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (16, );

-- idProduit 17 : Boitier PC
INSERT INTO Contient (idNumProduit, idImage) VALUES (17, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (17, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (17, );

-- idProduit 18 : watercooling
INSERT INTO Contient (idNumProduit, idImage) VALUES (18, 30);
INSERT INTO Contient (idNumProduit, idImage) VALUES (18, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (18, );

-- idProduit 19 : watercooling
INSERT INTO Contient (idNumProduit, idImage) VALUES (19, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (19, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (19, );

-- idProduit 20 : Mémoire
INSERT INTO Contient (idNumProduit, idImage) VALUES (20, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (20, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (20, );

-- idProduit 21 : Carte graphique
INSERT INTO Contient (idNumProduit, idImage) VALUES (21, 2);
INSERT INTO Contient (idNumProduit, idImage) VALUES (21, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (21, );

-- idProduit 22 : Carte mère
INSERT INTO Contient (idNumProduit, idImage) VALUES (22, 62);
INSERT INTO Contient (idNumProduit, idImage) VALUES (22, 63);
INSERT INTO Contient (idNumProduit, idImage) VALUES (22, 64);
INSERT INTO Contient (idNumProduit, idImage) VALUES (22, 65);
INSERT INTO Contient (idNumProduit, idImage) VALUES (22, 66);

-- idProduit 23 : Ventilateur
INSERT INTO Contient (idNumProduit, idImage) VALUES (23, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (23, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (23, );

-- idProduit 24 : Carte mère
INSERT INTO Contient (idNumProduit, idImage) VALUES (24, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (24, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (24, );

-- idProduit 25 : PC portable
INSERT INTO Contient (idNumProduit, idImage) VALUES (25, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (25, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (25, );

-- idProduit 26 : Mémoire
INSERT INTO Contient (idNumProduit, idImage) VALUES (26, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (26, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (26, );

-- idProduit 27 : Watercooling
INSERT INTO Contient (idNumProduit, idImage) VALUES (27, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (27, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (27, );

-- idProduit 28 : Boitier PC
INSERT INTO Contient (idNumProduit, idImage) VALUES (28, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (28, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (28, );

-- idProduit 29 : Watercooling
INSERT INTO Contient (idNumProduit, idImage) VALUES (29, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (29, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (29, );

-- idProduit 30 : Carte mère
INSERT INTO Contient (idNumProduit, idImage) VALUES (30, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (30, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (30, );

-- idProduit 31 : Boitier PC
INSERT INTO Contient (idNumProduit, idImage) VALUES (31, 41);
INSERT INTO Contient (idNumProduit, idImage) VALUES (31, 42);
INSERT INTO Contient (idNumProduit, idImage) VALUES (31, 43);
INSERT INTO Contient (idNumProduit, idImage) VALUES (31, 44);
INSERT INTO Contient (idNumProduit, idImage) VALUES (31, 45);

-- idProduit 32 : Mémoire
INSERT INTO Contient (idNumProduit, idImage) VALUES (32, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (32, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (32, );

-- idProduit 33 : watercooling
INSERT INTO Contient (idNumProduit, idImage) VALUES (33, 10);
INSERT INTO Contient (idNumProduit, idImage) VALUES (33, 11);
INSERT INTO Contient (idNumProduit, idImage) VALUES (33, 12);

-- idProduit 34 : Processeur
INSERT INTO Contient (idNumProduit, idImage) VALUES (34, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (34, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (34, );

-- idProduit 35 : Watercooling
INSERT INTO Contient (idNumProduit, idImage) VALUES (35, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (35, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (35, );

-- idProduit 36 : PC portable
INSERT INTO Contient (idNumProduit, idImage) VALUES (36, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (36, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (36, );

-- idProduit 37 : PC portable
INSERT INTO Contient (idNumProduit, idImage) VALUES (37, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (37, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (37, );

-- idProduit 38 : Carte mère
INSERT INTO Contient (idNumProduit, idImage) VALUES (38, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (38, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (38, );

-- idProduit 39 : Mémoire
INSERT INTO Contient (idNumProduit, idImage) VALUES (39, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (39, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (39, );

-- idProduit 40 : Boitier PC
INSERT INTO Contient (idNumProduit, idImage) VALUES (40, 26);
INSERT INTO Contient (idNumProduit, idImage) VALUES (40, 27);
INSERT INTO Contient (idNumProduit, idImage) VALUES (40, 28);
INSERT INTO Contient (idNumProduit, idImage) VALUES (40, 29);

-- idProduit 41 : Ventilateur
INSERT INTO Contient (idNumProduit, idImage) VALUES (41, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (41, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (41, );

-- idProduit 42 : Ventilateur
INSERT INTO Contient (idNumProduit, idImage) VALUES (42, 37);
INSERT INTO Contient (idNumProduit, idImage) VALUES (42, 38);
INSERT INTO Contient (idNumProduit, idImage) VALUES (42, 39);
INSERT INTO Contient (idNumProduit, idImage) VALUES (42, 40);

-- idProduit 43 : PC portable
INSERT INTO Contient (idNumProduit, idImage) VALUES (43, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (43, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (43, );

-- idProduit 44 : Processeur
INSERT INTO Contient (idNumProduit, idImage) VALUES (44, 31);
INSERT INTO Contient (idNumProduit, idImage) VALUES (44, 32);
INSERT INTO Contient (idNumProduit, idImage) VALUES (44, );

-- idProduit 45 : Ventilateur
INSERT INTO Contient (idNumProduit, idImage) VALUES (45, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (45, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (45, );

-- idProduit 46 : Carte graphique
INSERT INTO Contient (idNumProduit, idImage) VALUES (46, 46);
INSERT INTO Contient (idNumProduit, idImage) VALUES (46, 47);
INSERT INTO Contient (idNumProduit, idImage) VALUES (46, 48);
INSERT INTO Contient (idNumProduit, idImage) VALUES (46, 49);
INSERT INTO Contient (idNumProduit, idImage) VALUES (46, 50);
INSERT INTO Contient (idNumProduit, idImage) VALUES (46, 51);

-- idProduit 47 : Carte mère
INSERT INTO Contient (idNumProduit, idImage) VALUES (47, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (47, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (47, );

-- idProduit 48 : Boitier PC
INSERT INTO Contient (idNumProduit, idImage) VALUES (48, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (48, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (48, );

-- idProduit 49 : Ventilateur
INSERT INTO Contient (idNumProduit, idImage) VALUES (49, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (49, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (49, );

-- idProduit 50 : Processeur
INSERT INTO Contient (idNumProduit, idImage) VALUES (50, 9);
INSERT INTO Contient (idNumProduit, idImage) VALUES (50, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (50, );

-- idProduit 51 : PC Monté
INSERT INTO Contient (idNumProduit, idImage) VALUES (51, 8);
INSERT INTO Contient (idNumProduit, idImage) VALUES (51, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (51, );

-- idProduit 52 : PC Monté
INSERT INTO Contient (idNumProduit, idImage) VALUES (52, 15);
INSERT INTO Contient (idNumProduit, idImage) VALUES (52, 16);
INSERT INTO Contient (idNumProduit, idImage) VALUES (52, 17);

-- idProduit 53 : PC Monté
INSERT INTO Contient (idNumProduit, idImage) VALUES (53, 4);
INSERT INTO Contient (idNumProduit, idImage) VALUES (53, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (53, );

-- idProduit 54 : PC Monté
INSERT INTO Contient (idNumProduit, idImage) VALUES (54, 5);
INSERT INTO Contient (idNumProduit, idImage) VALUES (54, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (54, );

-- idProduit 55 : PC Monté
INSERT INTO Contient (idNumProduit, idImage) VALUES (55, 7);
INSERT INTO Contient (idNumProduit, idImage) VALUES (55, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (55, );

-- idProduit 56 : PC Monté
INSERT INTO Contient (idNumProduit, idImage) VALUES (56, 6);
INSERT INTO Contient (idNumProduit, idImage) VALUES (56, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (56, );

-- idProduit 57 : PC Monté
INSERT INTO Contient (idNumProduit, idImage) VALUES (57, 18);
INSERT INTO Contient (idNumProduit, idImage) VALUES (57, 19);
INSERT INTO Contient (idNumProduit, idImage) VALUES (57, 20);

-- idProduit 58 : PC Monté
INSERT INTO Contient (idNumProduit, idImage) VALUES (58, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (58, );
INSERT INTO Contient (idNumProduit, idImage) VALUES (58, );

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert Promotion               
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Promotion (nomPromotion, pourcentageReduction) VALUES ('test', 20);

#/////////////////////////////////////////////////////////////////////////////////////--
#                                 insert EnPromo               
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO EnPromo (idNumProduit, idPromotion) VALUES (1, 1);