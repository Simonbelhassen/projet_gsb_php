<div class="container">

<table class="table table-bordered table-striped table-condensed">
  <br>
  <legend>Liste Visiteur </legend>
  <thead>
    <tr>
      <th>Id</th>
      <th>Nom</th>
      <th>Prénom</th>
      <th>Address</th>
      <th>Code Postal</th>
      <th>Ville</th>
    </tr>
  </thead>
  <tbody>  
<?php
$i = 0;
while($i < count($visiteur))
{ 
?>     
    <tr>
        <td><?php echo $visiteur[$i]["vis_matricule"]?></td>
        <td><?php echo $visiteur[$i]["vis_nom"]?></td>
        <td><?php echo $visiteur[$i]["vis_prenom"]?></td>
        <td><?php echo $visiteur[$i]["vis_adresse"]?></td>
        <td><?php echo $visiteur[$i]["vis_cp"]?></td>
        <td><?php echo $visiteur[$i]["vis_ville"]?></td>
    </tr>
<?php
    $i = $i + 1;
 }
?>       
   </tbody>       
 </table>    
</div>