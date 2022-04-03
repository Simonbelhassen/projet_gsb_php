<div class="container">

    <table class="table table-bordered table-striped table-condensed">
      <br>
      <legend>Liste Materiel Dispo </legend>
      <thead>
        <tr>
          <th>Id</th>
          <th>Marque</th>
          <th>Modele</th>
     
        </tr>
      </thead>
      <tbody>  
<?php
    $i = 0;
    while($i < count($matdispo))
    { 
 ?>     
        <tr>
            <td><?php echo $matdispo[$i]['Id']?></td>
            <td><?php echo $matdispo[$i]["Marque"]?></td>
            <td><?php echo $matdispo[$i]["Modele"]?></td>
          
        </tr>
<?php
        $i = $i + 1;
     }
?>       
       </tbody>       
     </table>    
  </div>