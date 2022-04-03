<?php
/** 
 * Script de contr�le et d'affichage du cas d'utilisation "Ajouter"
 * @package default
 * @todo  RAS
 */

// Initialise les ressources n�cessaires au fonctionnement de l'application

$repVues = './vues/';
require("./include/_bdGestionDonnees.lib.php");
require("./include/_gestionSession.lib.php");
require("./include/_utilitairesEtGestionErreurs.lib.php");
// d�marrage ou reprise de la session
initSession();
// initialement, aucune erreur ...
$tabErreurs = array();
  
if (count($_POST)==0)
{
  $etape = 1;
}
else
{
  $etape = 2;
  $unID     =  $_POST["id"];
  $unNom    =  $_POST["nom"];;
  $unPrenom =  $_POST["prenom"];    //Mdp = Mot de pass
  $uneVille =  $_POST["ville"];
  AjouterVisiteur($unID, $unNom, $unPrenom, $uneVille, $tabErreurs);
}

// Construction de la page Rechercher
// pour l'affichage (appel des vues)
include($repVues."entete.php") ;
include($repVues."menu.php") ;
include($repVues ."erreur.php");
include($repVues."vAjouterVisiteur.php") ;
include($repVues."pied.php") ;
?>
  
