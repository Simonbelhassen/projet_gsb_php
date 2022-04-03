<div class="container">

    <table class="table table-bordered table-striped table-condensed">
      <br>
      <legend>Liste Des Emprunts En Cours </legend>
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
    while($i < count($pasrestituter))
    { 
 ?>     
        <tr>
            <td><?php echo $pasrestituter[$i]['dateEmprunter']?></td>
            <td><?php echo $pasrestituter[$i]["dateRestituer"]?> PAS RENDU</td>
            <td><?php echo $pasrestituter[$i]["vis_matricule"]?></td>
            <td><?php echo $pasrestituter[$i]["idMateriel"]?></td>
          
        </tr>
<?php
        $i = $i + 1;
     }
?>       
       </tbody>       
     </table>    
  </div>

 