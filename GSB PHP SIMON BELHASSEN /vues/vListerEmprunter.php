<div class="container">

    <table class="table table-bordered table-striped table-condensed">
      <br>
      <legend>Historique Des Emprunts Réaliser </legend>
      <thead>
        <tr>
          <th>Date Emprunter</th>
          <th>Date Restitution</th>
          <th>ID Visiteur</th>
          <th>ID Materiel </th>
     
        </tr>
      </thead>
      <tbody>  
<?php
    $i = 0;
    while($i < count($emprunt))
    { 
 ?>     
        <tr>
            <td><?php echo $emprunt[$i]['dateEmprunter']?></td>
            <td><?php echo $emprunt[$i]['dateRestituer']?></td>
            <td><?php echo $emprunt[$i]["vis_matricule"]?></td>
            <td><?php echo $emprunt[$i]["idMateriel"]?></td>
          
        </tr>
<?php
        $i = $i + 1;
     }
?>       
       </tbody>       
     </table>    
  </div>