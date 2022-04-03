<?php

// MODIFs A FAIRE
// Ajouter en t�tes 
// Voir : jeu de caract�res � la connection

/** 
 * Se connecte au serveur de donn�es                     
 * Se connecte au serveur de donn�es � partir de valeurs
 * pr�d�finies de connexion (h�te, compte utilisateur et mot de passe). 
 * Retourne l'identifiant de connexion si succ�s obtenu, le bool�en false 
 * si probl�me de connexion.
 * @return resource identifiant de connexion
 */
function connecterServeurBD()
{
  $PARAM_hote = 'localhost'; // le chemin vers le serveur
  $PARAM_port = '3306';
  $PARAM_nom_bd = 'BDD-GSB'; // le nom de votre base de donn�es
  $PARAM_utilisateur = 'root'; // nom d'utilisateur pour se connecter
  $PARAM_mot_passe = 'root'; // mot de passe de l'utilisateur pour se connecter
  $connect = new PDO('mysql:host=' . $PARAM_hote . ';port=' . $PARAM_port . ';dbname=' . $PARAM_nom_bd, $PARAM_utilisateur, $PARAM_mot_passe);
  return $connect;

  //$hote = "localhost";
  // $login = "root";
  // $mdp = "";
  // return mysql_connect($hote, $login, $mdp);
}


/** 
 * Ferme la connexion au serveur de donn�es.
 * Ferme la connexion au serveur de donn�es identifi�e par l'identifiant de 
 * connexion $idCnx.
 * @param resource $idCnx identifiant de connexion
 * @return void  
 */
function deconnecterServeurBD($idCnx)
{
}

// FINIT
function listerVisiteur()
{
  $connexion = connecterServeurBD();

  $requete = "select vis_matricule, vis_nom, vis_prenom, vis_adresse, vis_cp, vis_ville from visiteur";

  $jeuResultat = $connexion->query($requete);

  $i = 0;
  $ligne = $jeuResultat->fetch();
  while ($ligne) 
  {
    $visiteur[$i]['vis_matricule']=$ligne['vis_matricule'];
    $visiteur[$i]['vis_nom']=$ligne['vis_nom'];
    $visiteur[$i]['vis_prenom']=$ligne['vis_prenom'];
    $visiteur[$i]['vis_adresse']=$ligne['vis_adresse'];
    $visiteur[$i]['vis_cp']=$ligne['vis_cp'];
    $visiteur[$i]['vis_ville']=$ligne['vis_ville'];
    $ligne = $jeuResultat->fetch();
    $i = $i + 1;
  }
  $jeuResultat->closeCursor();   // fermer le jeu de résultats

  return $visiteur;
}
// FINIT
function listerMateriel()
{
  $connexion = connecterServeurBD();

  $requete = "select * from materiel";

  $jeuResultat = $connexion->query($requete);

  $i = 0;
  $ligne = $jeuResultat->fetch();
  while ($ligne)
  {
    $materiel[$i]['Id'] = $ligne['Id'];
    $materiel[$i]['Marque'] = $ligne['Marque'];
    $materiel[$i]['Modele'] = $ligne['Modele'];
    $materiel[$i]['Dimension'] = $ligne['Dimension'];
    $ligne = $jeuResultat->fetch();
    $i = $i + 1;
  }
  $jeuResultat->closeCursor();   // fermer le jeu de résultats

  return $materiel;
}
// FINIT
function listerEmprunter()
{
    $connexion = connecterServeurBD();
   
    $requete="select dateEmprunter, dateRestituer, vis_matricule, idMateriel from emprunter where dateRestituer is not null";
    
    $jeuResultat=$connexion->query($requete); // on va chercher tous les membres de la table qu'on trie par ordre croissant
  
    $i = 0;
    $ligne = $jeuResultat->fetch();
    while($ligne)
    {
        $emprunt[$i]['dateEmprunter']=$ligne['dateEmprunter'];
        $emprunt[$i]['dateRestituer']=$ligne['dateRestituer'];
        $emprunt[$i]['vis_matricule']=$ligne['vis_matricule'];
        $emprunt[$i]['idMateriel']=$ligne['idMateriel'];
        $ligne=$jeuResultat->fetch();
        $i = $i + 1;
    }
    $jeuResultat->closeCursor();   // fermer le jeu de résultat
  
  return $emprunt;
}
// FINIT
function listerPasRestituer()
{
    $connexion = connecterServeurBD();
   
    $requete="select dateEmprunter, dateRestituer, vis_matricule, idMateriel from emprunter where dateRestituer is null";
    
    $jeuResultat=$connexion->query($requete); 
  
    $i = 0;
    $ligne = $jeuResultat->fetch();
    while($ligne)
    {
        $pasrestituter[$i]['dateEmprunter']=$ligne['dateEmprunter'];
        $pasrestituter[$i]['dateRestituer']=$ligne['dateRestituer'];
        $pasrestituter[$i]['vis_matricule']=$ligne['vis_matricule'];
        $pasrestituter[$i]['idMateriel']=$ligne['idMateriel'];
        $ligne=$jeuResultat->fetch();
        $i = $i + 1;
    }
    $jeuResultat->closeCursor();   
  
  return $pasrestituter;
}
// FINIT
function listerMaterielDisponible()
{
    $connexion = connecterServeurBD();
   
    $requete="SELECT `Id`, `Marque`, `Modele` FROM materiel WHERE Id not in (SELECT emprunter.idMateriel from emprunter where emprunter.dateRestituer is null)";
    
    $jeuResultat=$connexion->query($requete); // on va chercher tous les membres de la table qu'on trie par ordre croissant
  
    $i = 0;
    $ligne = $jeuResultat->fetch();
    while($ligne)
    {
        $matdispo[$i]['Id']=$ligne['Id'];
        $matdispo[$i]['Marque']=$ligne['Marque'];
        $matdispo[$i]['Modele']=$ligne['Modele'];
        $ligne=$jeuResultat->fetch();
        $i = $i + 1;
    }
    $jeuResultat->closeCursor();   // fermer le jeu de r�sultat
  
  return $matdispo;
}



// FINIT
function AjouterMateriel($ref, $marque, $dimension, $modele,&$tabErr)
{
  // Ouvrir une connexion au serveur mysql en s'identifiant
  $connexion = connecterServeurBD();
    
  // Cr�er la requ�te d'ajout 
  $requete="insert into materiel"
  ."(id, marque, dimension, modele) values ('"
  .$ref."','"
  .$marque."','"
  .$dimension."','"
  .$modele."');";
  
  // Lancer la requ�te d'ajout 
  $ok=$connexion->query($requete); // on va chercher tous les membres de la table qu'on trie par ordre croissant
  
  // Si la requ�te a r�ussi
  if ($ok)
  {
    $message = "Le materiel a été correctement ajoutée";
    ajouterErreur($tabErr, $message);
    }
  else
  {
    $message = "Attention, l'ajout du materiel a échoué !!!";
    ajouterErreur($tabErr, $message);
  } 

}
// FINIT
function AjouterVisiteur($id, $nom, $prenom, $ville, &$tabErr)
{
  // Ouvrir une connexion au serveur mysql en s'identifiant
  $connexion = connecterServeurBD();
    
  // Cr�er la requ�te d'ajout 
  $requete="insert into visiteur"
  ."(VIS_MATRICULE, VIS_NOM, VIS_PRENOM, VIS_VILLE) values ('"
  .$id."','"
  .$nom."','"
  .$prenom."','"
  .$ville."');";
  
  // Lancer la requ�te d'ajout 
  $ok=$connexion->query($requete); // on va chercher tous les membres de la table qu'on trie par ordre croissant
  
  // Si la requ�te a r�ussi
  if ($ok)
  {
    $message = "Le visiteur a été correctement ajoutée";
    ajouterErreur($tabErr, $message);
    }
  else
  {
    $message = "Attention, l'ajout du visiteur a échoué !!!";
    ajouterErreur($tabErr, $message);
  } 
}
// FINIT
function AjouterEmprunt($dateEmprunter, $vis_matricule, $idMateriel,&$tabErr)
{
  // Ouvrir une connexion au serveur mysql en s'identifiant
  $connexion = connecterServeurBD();
    
  $requete="select dateEmprunter, vis_matricule, idMateriel from emprunter";
  $requete=$requete." where idMateriel != '".$idMateriel."' and dateRestituer is not null;";   
  // Cr�er la requ�te d'ajout 
  
  
  // Lancer la requ�te d'ajout 
  $ok=$connexion->query($requete); // on va chercher tous les membres de la table qu'on trie par ordre croissant
  
  $ligne = $ok->fetch();
  // Si la requ�te a r�ussi
  if ($ligne)
  {
        $requete="insert into emprunter"
        ."(dateEmprunter, vis_matricule, idMateriel) values ('"
        .$dateEmprunter."','"
        .$vis_matricule."','"
        .$idMateriel."');";
        $ok=$connexion->query($requete);

        $message = "L'emprunt a été correctement ajoutée";
        ajouterErreur($tabErr, $message);
    }
  else
  {
    $message = "Attention, l'ajout de l'emprunt a échoué !!";
    ajouterErreur($tabErr, $message);
  } 

}
// FINIT
function AjouterRestituer( $dateRestituer, $vis_matricule, $idMateriel,&$tabErr)
{
  
  $connexion = connecterServeurBD();
  $requete="select vis_matricule, idMateriel from emprunter";
  $requete=$requete." where vis_matricule = '".$vis_matricule."' and idMateriel = '".$idMateriel."' and dateRestituer is null;";   
  // Cr�er la requ�te d'ajout 
  $requete="update emprunter"
  ." set dateRestituer ='".$dateRestituer."'
  where idMateriel = '".$idMateriel."'
  and vis_matricule = '".$vis_matricule."';";          
 
  $ok=$connexion->query($requete); // on va chercher tous les membres de la table qu'on trie par ordre croissant


  
  // Si la requ�te a r�ussi
  if ($ok>=1)
  {
    $message = "Le matériel a été correctement restituer";
    ajouterErreur($tabErr, $message);
    }
  else
  {
    $message = "Attention, la réstitution de l'emprunt a échoué !";
    ajouterErreur($tabErr, $message);
  } 

}



// FINIT
function supprimerMateriel($id, &$tabErr)
{
    $connexion = connecterServeurBD();
    
    $verif = $connexion->query(" select id from materiel where id='" . $id . "';");
    $materiel = $verif->fetch();
          
    if ($materiel) //existe 
    {
      $requete = "delete from materiel";
      $requete = $requete . " where id='" . $id . "';";
  
      // Lancer la requête supprimer
      $ok = $connexion->query($requete);
  
      // Si la requête a réussi
      if ($ok) {
        $message = "Le materiel a été correctement supprimé";
        ajouterErreur($tabErr, $message);
      } else {
        $message = "Attention, la suppression du materiel a échoué !";
      }
        ajouterErreur($tabErr, $message);
    } else // n'existe pas
    {
      $message = "Le materiel n'existe pas";
      ajouterErreur($tabErr, $message);
    }
}
// FINIT
function supprimerVisiteur($mat, &$tabErr)
{
  $connexion = connecterServeurBD();

  $verif = $connexion->query(" select vis_matricule from visiteur where vis_matricule='" . $mat . "';");
  $visiteur = $verif->fetch();

  if ($visiteur) //existe 
   {
      $requete = "delete from visiteur";
      $requete = $requete . " where vis_matricule='" . $mat . "';";

      // Lancer la requête supprimer
      $ok = $connexion->query($requete);

      // Si la requête a réussi
      if ($ok) 
      {
        $message = "Le visiteur a été correctement supprimé";
        ajouterErreur($tabErr, $message);
      } 
      else 
      {
        $message = "Attention, la suppression du visiteur a échoué !";
      }
        ajouterErreur($tabErr, $message);
    } 
  else // n'existe pas
  {
    $message = "Le visiteur n'existe pas";
    ajouterErreur($tabErr, $message);
  }
}


// EN COURS
function modifierVisiteur($unNom,$unPrenom,$unMail,$unMat,$tabErreurs)
{

}

// EN COURS
function modifierMateriel($ref, $marque, $dimension, $modele,&$tabErr)
{

}
