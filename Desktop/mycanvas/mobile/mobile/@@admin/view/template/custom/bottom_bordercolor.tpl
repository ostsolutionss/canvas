<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-popular" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel ;?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
        <h1><?php echo $heading_title; ?></h1>
        <ul class="breadcrumb">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        </ul>
   </div>
  </div>
    <div class="my_error">
    <?php
        if(!empty($_GET['msg']) && $_GET['msg'] == "success" ){
        
        echo "Border color added successfully";
        }
        if(!empty($_GET['msg']) && $_GET['msg'] == "deletesuccess"){
        
        echo "Border color Deleted successfully";
        }
        ?>
       </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
       <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3> 
      </div>
      <div class="panel-body">
         <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-popular" class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $bordercolor; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="neckbordercolor1" value="" id="neckcolor1" class="form-control color" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $bordercolor; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="neckbordercolor2" value="" id="neckcolor2" class="form-control color" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $bordercolor; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="neckbordercolor3" value="" id="neckcolor3" class="form-control color" />
                </div>
            </div>
             <!--<div class="form-group">
               <p class="text-box" style="display: none;">
                   <label for="box1">Box <span class="box-number">1</span></label>
               </p>
               <label class="col-sm-2 control-label" ></label>
                   <div class="col-sm-10">
                    <a class="add-box addmore" href="javascript:void(0);">Add More</a> 
                   </div>
            </div>
          <input type="hidden" name="addcounter" id="addcounter" value="3" style="float:right;"/>-->
        </form>
          
          <div class="listing">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <th>Colour</th>
                        <th>Action</th>
                    </tr>
                    <?php 
                        foreach($bcolorlist as $bcolorlisting)
                        {
                        $borderid = $bcolorlisting['id'];
                    ?>
                    <tr>
                        <td style="height: 68px; text-align: center;">
                            <p>
                                <span style="background-color: <?php echo $bcolorlisting['bottom_border_color']; ?>; padding: 15px 60px 18px 0px; border-radius: 3px; border: 2px solid #dddddd;" ></span>
                            </p>
                        </td>
                        <td style="text-align: center;">
                            <a href="javascript:void(0);" id='removeborder<?php echo $borderid ; ?>' data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick='deleteborder("<?php echo $borderid ; ?>");'> <i class="fa fa-minus-circle"></i> </a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
              
                <div class="row">
                  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
                
          </div>
          
      </div>

      </div>
    </div>
  </div>
<script>
    function deleteborder(id)
  {
    
     var url = 'index.php?route=custom/bottom_bordercolor/deleteoptions&token=<?php echo $token; ?>';
     url += '&border=' + id;
     location = url;
    
  }
</script>
<style>
.my_error 
{
    color: #98FB98;
    font-color:#98FB98;
    font-size: 15px;
    margin-bottom: 10px;
    margin-left: 20px;
}
.table.table-striped.table-bordered.table-hover a {
  background-color: #f56b6b;
  border: 1px solid #f24545;
  border-radius: 4px;
  color: #fff;
  margin-right: 2px;
  padding: 10px 13px;
  text-align: center;
}
</style>
<?php echo $footer; ?>
