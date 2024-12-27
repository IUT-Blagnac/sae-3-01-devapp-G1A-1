<?php
session_start();
include("include/connect.inc.php");
    if (isset($_POST['nom']) && ($_POST['prenom']) && ($_POST['pays']) && ($_POST['cdpostal']) && ($_POST['ville']) &&($_POST['adr']) && ($_POST['numtel']) && ($_POST['mail']) && ($_POST['mdp'])){
        try{
            $nom=htmlspecialchars($_POST['nom']);

            $prenom=htmlspecialchars($_POST['prenom']);

            $pays=htmlspecialchars($_POST['pays']);

            $cdpostal=htmlspecialchars($_POST['cdpostal']);

            $ville=htmlspecialchars($_POST['ville']);

            $adr=htmlspecialchars($_POST['adr']);

            $numtel=htmlspecialchars($_POST['numtel']);
            if(!preg_match("/^[+]/", $numtel)){
                header('location: formCreation.php?Erreur=Ftel&tel='.$numtel);
            }

            $mail=htmlspecialchars($_POST['mail']);
            if(!preg_match('/^[a-zA-Z0-9._-]+@+[a-zA-Z0-9._-]{2,}\.[a-z]{2,4}$/',$mail)){
                header('location: formCreation.php?Erreur=Fmail');
            }

            $mdp=htmlspecialchars($_POST['mdp']);
            if(!preg_match('/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*[?§!£$%+#=()\[\]\{\}\-\.\;]).{8,}$/',$mdp)){
                header('location: formCreation.php?Erreur=Fmdp');
            }

            $mdpH = hash('sha256', $mdp);
            $reqDept1 = $conn->prepare("INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES (:idpays,:idville,:idadr,:cdpostal)");
            $reqDept1->bindParam(':idpays', $pays);
            $reqDept1->bindParam(':idville', $ville);
            $reqDept1->bindParam(':idadr', $adr);
            $reqDept1->bindParam(':cdpostal', $cdpostal);
            if($reqDept1->execute()){
                $adr = $conn->lastInsertId();        
                if (!empty($adr)) {
                        $reqDept2 = $conn->prepare("INSERT INTO Client (nom, prenom, idAdresse, email, telephone, mdp) VALUES (:idnom, :idprenom, :idAdresse, :idmail, :idnumtel, :idmdp)");
                        $reqDept2->bindParam(':idnom', $nom);
                        $reqDept2->bindParam(':idprenom', $prenom);
                        $reqDept2->bindParam(':idAdresse', $adr);
                        $reqDept2->bindParam(':idmail', $mail);
                        $reqDept2->bindParam(':idnumtel', $numtel);
                        $reqDept2->bindParam(':idmdp', $mdpH);
                        $reqDept2->execute();
                        $insertID = $conn->lastInsertId();
                        $reqDept3 = $conn->prepare("INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (:id, true);");
                        $reqDept3->bindParam(':id',$insertID, PDO::PARAM_INT);
                        $reqDept3->execute();
                        $_SESSION['login'] = 'OK';
                        $_SESSION['prenom'] = $prenom;
                        $_SESSION['idClient'] = $insertID;
                }
            }
            if (isset($_POST["remember"])) {
                setcookie('cBuildMyPC', $_POST['mail'], time() + 60 * 5);
            }
            header('location: index.php');
        }
        catch(Exception $e){
            $conn->rollBack();
            header('location: formCreation.php?Erreur=FmailEXI&Err='.$insertID.'&Er='.$e);
        }
        } 
        else{
            header(header: 'location: FormConnexion.php?msgErreur=Erreur%20d%27Identification...%20Recommencez');
    }