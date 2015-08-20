<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="panel panel-default">
<div class="page-header">
    <div class="container-fluid">
        <div class="pull-right">
        <a href="<?php echo $cancel ;?>" data-toggle="tooltip" title="Cancel" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
         
     
      <h1>Sleeves</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
   
  </div>
 <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i>Custom Styles</h3>
      </div>
 
     
     <div class="panel-body">
     <div class="table-responsive">
<table class="table table-bordered table-hover">
     <tr>
        <th>Name</th>
        <th style="text-align: center;">Action</th>
    </tr> 
<?php
foreach($result as $results){
?>
<tr>
        <?php if($results['name'] == "Length"){ ?>
        <td class="text-left"> <?php echo $results['name']; ?>
            </td>
        <td style="text-align: center;">
                <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/length&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a></td>
     <?php } ?>
<?php if($results['name'] == "Border color"){ ?>
        <td class="text-left"> <?php echo $results['name']; ?>
            </td>
        <td style="text-align: center;">
                <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/bordercolor&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a></td>
     <?php }?>
     <?php if($results['name'] == "Embroidery"){ ?>
        <td class="text-left"> <?php echo $results['name']; ?>
            </td>
        <td style="text-align: center;">
                <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/sleeve-emb&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a></td>
     <?php }?>                                                                                                                          
         <?php if($results['name'] == "Pipping color"){ ?>
        <td class="text-left"> <?php echo $results['name']; ?>
            </td>
        <td style="text-align: center;">
                <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/pippingcolor&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a></td>
     <?php }?>
 <?php if($results['name'] == "Buttons"){ ?>
        <td class="text-left"> <?php echo $results['name']; ?>
            </td>
        <td style="text-align: center;">
                <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/button&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a></td>
     <?php }?>


<?php
}

?>
</table>
</div> 
  </div>
     </div>
    </div>
    </div>
</div>
<?php echo $footer; ?>

