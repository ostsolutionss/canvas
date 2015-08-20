<?php echo $header; ?><?php echo $column_left; 
 $servername = DB_HOSTNAME;
                        $username =  DB_USERNAME;
                        $password = DB_PASSWORD;
                        $dbname = DB_DATABASE;
                        $db_driver = DB_DRIVER;

// Create connection
                $conn = new $db_driver($servername, $username, $password, $dbname);
?>
 <div id="content">
    <div class="panel panel-default">
        <div class="page-header">
            <div class="container-fluid">
              <h1>Custom Kurtas</h1>
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
                                        <?php if($results['name'] == "Front")
                                        { ?>
                                        <td class="text-left"> <?php echo $results['name']; ?></td>
                                        <td style="text-align: center;">
                                            <a class="btn btn-primary" data-original-title="Edit" style="text-align:right;" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/add_shirt&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                        </td>
                                        <?php } ?>
                                        <?php if($results['name'] == "Neck"){ ?>
                                        <td class="text-left"> <?php echo $results['name']; ?></td>
                                        <td style="text-align: center;">
                                            <a class="btn btn-primary" data-original-title="Edit" style="text-align:right;" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/neck&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                        </td>
                                        <?php }?>
                                        <?php if($results['name'] == "Back"){ ?>
                                        <td class="text-left"> <?php echo $results['name']; ?></td>
                                        <td style="text-align: center;">
                                            <a class="btn btn-primary" data-original-title="Edit" style="text-align:right;" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/back&option_id=<?php echo $results['option_id']; ?>&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                        </td>
                                        <?php }?>
                                        <?php if($results['name'] == "Bottom"){ ?>
                                        <td class="text-left"> <?php echo $results['name']; ?></td>
                                        <td style="text-align: center;">
                                           <a class="btn btn-primary" data-original-title="Edit" style="text-align:right;" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/bottom&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                        </td>
                                        <?php }?>
                                        <?php if($results['name'] == "Sleeves"){ ?>
                                        <td class="text-left"> <?php echo $results['name']; ?></td>
                                        <td style="text-align: center;">
                                            <a class="btn btn-primary" data-original-title="Edit" style="text-align:right;" href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/sleeves&token=<?php echo $token ;?>"><i title="Edit" class="fa fa-pencil"></i></a>
                                        </td>
                                        <?php } ?>
                                        
                                </tr>
                              <?php } ?>
                            </table>
                        </div> 
                    </div>
            </div>
        </div>
    </div>
</div> 
<?php echo $footer; ?>

