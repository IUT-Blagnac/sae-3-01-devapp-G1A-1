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
#                                 insert Commande                     
#/////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO Commande (idNumCli) VALUES ('1', 'true');
INSERT INTO Commande (idNumCli) VALUES ('2', 'true');
INSERT INTO Commande (idNumCli) VALUES ('3', 'true');
INSERT INTO Commande (idNumCli) VALUES ('4', 'true');
INSERT INTO Commande (idNumCli) VALUES ('5', 'true');
INSERT INTO Commande (idNumCli) VALUES ('6', 'true');
INSERT INTO Commande (idNumCli) VALUES ('7', 'true');
INSERT INTO Commande (idNumCli) VALUES ('8', 'true');
INSERT INTO Commande (idNumCli) VALUES ('9', 'true');
INSERT INTO Commande (idNumCli) VALUES ('10', 'true');
INSERT INTO Commande (idNumCli) VALUES ('11', 'true');
INSERT INTO Commande (idNumCli) VALUES ('12', 'true');
INSERT INTO Commande (idNumCli) VALUES ('13', 'true');
INSERT INTO Commande (idNumCli) VALUES ('14', 'true');
INSERT INTO Commande (idNumCli) VALUES ('15', 'true');
INSERT INTO Commande (idNumCli) VALUES ('16', 'true');
INSERT INTO Commande (idNumCli) VALUES ('17', 'true');
INSERT INTO Commande (idNumCli) VALUES ('18', 'true');
INSERT INTO Commande (idNumCli) VALUES ('19', 'true');
INSERT INTO Commande (idNumCli) VALUES ('20', 'true');
INSERT INTO Commande (idNumCli) VALUES ('21', 'true');
INSERT INTO Commande (idNumCli) VALUES ('22', 'true');
INSERT INTO Commande (idNumCli) VALUES ('23', 'true');
INSERT INTO Commande (idNumCli) VALUES ('24', 'true');
INSERT INTO Commande (idNumCli) VALUES ('25', 'true');
INSERT INTO Commande (idNumCli) VALUES ('26', 'true');
INSERT INTO Commande (idNumCli) VALUES ('27', 'true');
INSERT INTO Commande (idNumCli) VALUES ('28', 'true');
INSERT INTO Commande (idNumCli) VALUES ('29', 'true');
INSERT INTO Commande (idNumCli) VALUES ('30', 'true');
INSERT INTO Commande (idNumCli) VALUES ('31', 'true');
INSERT INTO Commande (idNumCli) VALUES ('32', 'true');
INSERT INTO Commande (idNumCli) VALUES ('33', 'true');
INSERT INTO Commande (idNumCli) VALUES ('34', 'true');
INSERT INTO Commande (idNumCli) VALUES ('35', 'true');
INSERT INTO Commande (idNumCli) VALUES ('36', 'true');
INSERT INTO Commande (idNumCli) VALUES ('37', 'true');
INSERT INTO Commande (idNumCli) VALUES ('38', 'true');
INSERT INTO Commande (idNumCli) VALUES ('39', 'true');
INSERT INTO Commande (idNumCli) VALUES ('40', 'true');
INSERT INTO Commande (idNumCli) VALUES ('41', 'true');
INSERT INTO Commande (idNumCli) VALUES ('42', 'true');
INSERT INTO Commande (idNumCli) VALUES ('43', 'true');
INSERT INTO Commande (idNumCli) VALUES ('44', 'true');
INSERT INTO Commande (idNumCli) VALUES ('45', 'true');
INSERT INTO Commande (idNumCli) VALUES ('46', 'true');
INSERT INTO Commande (idNumCli) VALUES ('47', 'true');
INSERT INTO Commande (idNumCli) VALUES ('48', 'true');
INSERT INTO Commande (idNumCli) VALUES ('49', 'true');
INSERT INTO Commande (idNumCli) VALUES ('50', 'true');

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