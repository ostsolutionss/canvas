<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="panel panel-default">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <a href="<?php echo $cancel ;?>" data-toggle="tooltip" title="Cancel" class="btn btn-default"><i class="fa fa-reply"></i></a>
                </div>
                <h1><?php echo $heading_title; ?></h1>
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
                                foreach($result as $results)
                                {
                                ?>
                                <tr>
                                     <?php if($results['name'] == "Pipping Colour")
                                     { ?>
                                            <td class="text-left"> <?php echo $results['name']; ?></td>
                                            <td style="text-align: center;">
                                                <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/neck_pippingcolor&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                            </td>
                                     <?php } ?>
                                     <?php if($results['name'] == "Border Colour")
                                     { ?>
                                            <td class="text-left"> <?php echo $results['name']; ?></td>
                                            <td style="text-align: center;">
                                                 <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/neck_bordercolor&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                            </td>
                                     <?php } ?>
                                     <?php if($results['name'] == "Design")
                                     { ?>
                                            <td class="text-left"> <?php echo $results['name']; ?>
                                            </td>
                                            <td style="text-align: center;">
                                                 <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/neck_design&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                            </td>
                                     <?php } ?>                                                                                                                          
                                     
                                     <?php if($results['name'] == "Buttons")
                                     { ?>
                                            <td class="text-left"> <?php echo $results['name']; ?></td>
                                            <td style="text-align: center;">
                                                       <a class="btn btn-primary" data-original-title="Edit" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/neck_button&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                            </td>
                                     <?php }
                                }
                                    ?>
                                </tr>                          
                            </table>
                        </div> 
                    </div>
             </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
