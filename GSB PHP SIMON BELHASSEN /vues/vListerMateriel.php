<div class="container">

<table class="table table-bordered table-striped table-condensed">
  <br>
  <legend>Liste Matériel </legend>
  <thead>
    <tr>
      <th>Id</th>
      <th>Marque</th>
      <th>Modèle</th>
      <th>Dimension</th>
    </tr>
  </thead>
  <tbody>  
<?php
$i = 0;
while($i < count($materiel))
{ 
?>     
    <tr>
        <td align="center"><?php echo $materiel[$i]["Id"]?></td>
        <td><?php echo $materiel[$i]["Marque"]?></td>
        <td><?php echo $materiel[$i]["Modele"]?></td>
        <td align="right"><?php echo $materiel[$i]["Dimension"]?> pouces</td>
    </tr>
<?php
    $i = $i + 1;
 }
?>       
   </tbody>       
 </table>    
</div>