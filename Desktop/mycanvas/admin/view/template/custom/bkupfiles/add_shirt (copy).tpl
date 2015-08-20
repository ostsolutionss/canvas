<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-popular" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/customdesign&token=<?php echo $token ;?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        if(!empty($_GET['msg'])){
        
        echo "image uploaded successfully";
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
           <label class="col-sm-2 control-label" for="input-type"><?php echo $type; ?></label>
            <div class="col-sm-10">
             	<select name="type1"  class="form-control" >
               <option value="">Select</option>
               <?php foreach($rsttype as $rsttypes){ ?>
                   <option value="<?php echo $rsttypes['name'];?>"><?php echo $rsttypes['name'];?>
                       <?php }?>
                   </option>
              
              </select>
              <?php if ($error_type) { ?>
              <div class="text-danger"><?php echo $error_type; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-area"><?php echo $area; ?></label>
            <div class="col-sm-10">
               	<select name="Area1"  class="form-control" >
                    <option value="">Select</option>
                    <?php foreach($rstarea as $rstareas){ ?><option value="<?php echo $rstareas['name'];?>"><?php echo $rstareas['name'];?></option><?php } ?>
                </select>
                <?php if ($error_area) { ?>
                <div class="text-danger"><?php echo $error_area; ?></div>
                <?php } ?>
            </div>
          </div>
          <div class="form-group">
                <label class="col-sm-2 control-label" for="input-design"><?php echo $design; ?></label>
                <div class="col-sm-10">
                    <select name="Design1"  class="form-control" >
                        <option value="">Select</option>
                        <?php foreach($rstdesign as $rstdesigns){ ?><option value="<?php echo  $rstdesigns['name'];?>"><?php echo $rstdesigns['name'];?></option><?php } ?>
                  </select>
                  <?php if ($error_design) { ?>
                        <div class="text-danger"><?php echo $error_design; ?></div>
                  <?php } ?>
                </div>
          </div>
          <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="price1" value="" placeholder="<?php echo $price; ?>" id="price1" class="form-control price" />
                  <?php if ($error_design) { ?>
                        <div class="text-danger"><?php echo $error_design; ?></div>
                  <?php } ?>
                </div>
          </div>
          <input type="hidden" name="hidden1" value="space">
           
          <div class="form-group">
            <label class="col-sm-2 control-label" ></label>
            <div class="col-sm-10">
              <input type="file" i name="file1" value="" placeholder="" id="file1" class="form-control uploadfile" />
            </div>
          </div>
          <div class="form-group">
                <label class="col-sm-2 control-label" for="input-type"><?php echo $type; ?></label>
                <div class="col-sm-10">
                     <select name="type2"  class="form-control" >
                        <option value="">Select</option>
                        <?php foreach($rsttype as $rsttypes){ ?><option value="<?php echo $rsttypes['name'];?>"><?php echo $rsttypes['name'];?><?php }?></option>
                     </select>
                   <?php if ($error_type) { ?>
                   <div class="text-danger"><?php echo $error_type; ?></div>
                   <?php } ?>
                </div>
          </div>
          <div class="form-group">
                <label class="col-sm-2 control-label" for="input-area"><?php echo $area; ?></label>
                <div class="col-sm-10">
                    <select name="Area2"  class="form-control" >
                        <option value="">Select</option>
                        <?php foreach($rstarea as $rstareas){ ?><option value="<?php echo $rstareas['name'];?>"><?php echo $rstareas['name'];?></option><?php } ?>
                    </select>
                  <?php if ($error_area) { ?>
                        <div class="text-danger"><?php echo $error_area; ?></div>
                  <?php } ?>
                </div>
          </div>
          <div class="form-group">
                <label class="col-sm-2 control-label" for="input-design"><?php echo $design; ?></label>
                <div class="col-sm-10">
                    <select name="Design2"  class="form-control" >
                        <option value="">Select</option>
                        <?php foreach($rstdesign as $rstdesigns){ ?><option value="<?php echo  $rstdesigns['name'];?>"><?php echo $rstdesigns['name'];?></option><?php } ?>
                    </select>
                  <?php if ($error_design) { ?>
                    <div class="text-danger"><?php echo $error_design; ?></div>
                  <?php } ?>
                </div>
          </div>
          <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="price2" value="" placeholder="<?php echo $price; ?>" id="price2" class="form-control price" />
                  <?php if ($error_design) { ?>
                  <div class="text-danger"><?php echo $error_design; ?></div>
                  <?php } ?>
                </div>
         </div>
    
    
         <input type="hidden" name="hidden2" value="space">
           
          <div class="form-group">
                <label class="col-sm-2 control-label" ></label>
                <div class="col-sm-10">
                  <input type="file"  name="file2" value="" placeholder=""  id="file2" class="form-control uploadfile" />
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <div id='apendfile'> </div>
                    </div>
                </div>
          </div>         
         <input type="hidden" id="addcounter"  value="2" name="addcounter">         
      
         <div class="form-group">
             <label class="col-sm-2 control-label"></label>
             <div class="col-sm-10">
            <a  href='javascript:void(0);' onclick='add_more();' id="link" class="addmore" title="Add more">Add More</a>
             </div>
         </div>
      </form>    
     </div>
        
<script>
$(".uploadfile").blur(function()
{
    
      var fileid = $(this).attr("id");
      var i =$("#"+fileid).val();
      var ext = $('#'+fileid).val().split('.').pop().toLowerCase();
      if((ext!= '') && ( $.inArray(ext, ['png']) != -1)) 
      {         
               $( ".errorfile" ).remove();         
      }
      else
      {
           $("#"+fileid).after("<span class='errorfile' style='color:red' > Invalid extension! Please upload '.PNG' Image</span>");
           setTimeout(function() 
           {
                 $( ".errorfile" ).hide('slow');
           },1000);
      }
});
           
$(".form-group .price").blur(function() 
{   
    
     var priceid = $(this).attr("id");
     var price = $("#"+priceid).val();
     
     if(isNaN(price))
      {
        $("#"+priceid).after("<span class='error' style='color:red' > Price must be an Integer.</span>");
        $("#"+priceid).css("border","1px dotted red");
        $("#"+priceid).css("color","red");
         setTimeout(function() 
         {
            $( ".error" ).hide('slow');
         },1000);
      }
      else
      {
          $( ".error" ).remove(  );
          $("#"+priceid).css("border","1px solid #cccccc");    
          $("#"+priceid).css("color","#555555");
      }
     
});      
           

function add_more() 
{
  
    var i =$("#addcounter").val();
    i++;
    $("#addcounter").val(i);
    var txt;
    txt ="<div class=\"panel-body\">";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-type\"><?php echo $type; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<select name=";
    txt = txt + 'type'+i;
    txt = txt + " class=\"form-control\" >";
    txt = txt + "<option value=\"\">select</option>";
    txt = txt +  "<?php foreach($rsttype as $rsttypes){ ?>";
    txt = txt +  "<option value=\"<?php  echo $rsttypes['name']; ?>\">";
    txt = txt +  "<?php  echo $rsttypes['name']; ?><?php } ?> ";
    txt = txt +  "<option >";
    txt = txt + "  </select>";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-area\"><?php echo $area; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<select name=";
    txt = txt + 'Area'+i;
    txt = txt + " class=\"form-control\" >";
    txt = txt + "<option value=\"\">select</option>";
    txt = txt +  "<?php foreach($rstarea as $rstareas){ ?>";
    txt = txt +  "<option value=\"<?php  echo $rstareas['name']; ?>\">";
    txt = txt +  "<?php  echo $rstareas['name']; ?><?php } ?> ";
    txt = txt +  "<option >";
    txt = txt + "  </select>";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-design\"><?php echo $design; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<select name=";
    txt = txt+'Design'+i;
    txt =txt+"  class=\"form-control\" >";
    txt = txt + "<option value=\"\">select</option>";
    txt = txt +  "<?php foreach($rstdesign as $rstdesigns){ ?>";
    txt = txt +  "<option value=\"<?php  echo $rstdesigns['name']; ?>\">";
    txt = txt +  "<?php  echo $rstdesigns['name']; ?><?php } ?> ";
    txt = txt +  "<option >";
    txt = txt + "  </select>";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-design\"><?php echo $price; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<input type=\"text\"  name=";
    txt = txt+'price'+i;
    txt =txt+" placeholder=\"price\" id=\"price"+i+"\" class=\"form-control price\" >";
    txt = txt + "</div>";
    txt = txt + "</div>";

    txt = txt + " <input type=\"hidden\" name=";
    txt = txt +'hidden'+i;
    txt = txt + " value=\"space\">";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-type\"><?php echo $type; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + " <input type=\"file\" name=\"file"+i+"\"  id=\"file"+i+"\" class=\"form-control uploadfile\">";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + "</div>";

    document.getElementById("apendfile").innerHTML += txt;
}
</script>
     
      </div>
    </div>
  </div>
</div>
<style>
    .my_error {
   color: #98FB98;
    font-color:#98FB98;
    font-size: 15px;
    margin-bottom: 10px;
    margin-left: 20px;
}
    </style>
<?php echo $footer; ?>

