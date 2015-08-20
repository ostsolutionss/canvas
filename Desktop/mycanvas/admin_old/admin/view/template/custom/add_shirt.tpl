<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-popular" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        
        echo "image uploaded successfully";
        }
        if(!empty($_GET['msg']) && $_GET['msg'] == "deletesuccess"){
        
        echo "image Deleted successfully";
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
            <label class="col-sm-2 control-label" >Upload Image</label>
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
        <div class="form-group">
                <label class="col-sm-2 control-label" >Upload Image</label>
                <div class="col-sm-10">
                  <input type="file"  name="file2" value="" placeholder=""  id="file2" class="form-control uploadfile" />
                </div>
        </div>         
      <div class="form-group">
            <p class="text-box" style="display: none;">
                <label for="box1">Box <span class="box-number">1</span></label>
            </p>
            <label class="col-sm-2 control-label" ></label>
                <div class="col-sm-10">
                  <a class="add-box addmore" href="javascript:void(0);">Add More</a>
                </div>
            
       </div>
            <input type="hidden" name="addcounter" id="addcounter" value="2" style="float:right;"/>
       </form> 
          
          <div class="listing">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <th style="text-align: center;">Type</th>
                        <th style="text-align: center;">Area</th>
                        <th style="text-align: center;">Design</th>
                        <th style="text-align: center;">Price</th>
                        <th style="text-align: center;">Image</th>                        
                        <th style="text-align: center;">Action</th>
                    </tr>
                    <?php 
                        foreach($frontlist as $frontlisting)
                        {
                             $frontid = $frontlisting['id'];
                    ?>
                    <tr>
                         <td><?php echo $frontlisting['type']; ?></td>
                         <td><?php echo $frontlisting['area']; ?></td>
                         <td><?php echo $frontlisting['design']; ?></td>
                         <td><?php echo $frontlisting['price']; ?></td>
                         <td style="text-align: center;">
                            <img src="<?php echo $base.$frontlisting['attached_image']; ?>" class="customimg" style="width:80px; height:80px;" />
                        </td>
                        <td style="text-align: center;">
                            <a href="javascript:void(0);" id='removeborder<?php echo $frontid ; ?>' data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick='deletefront("<?php echo $frontid ; ?>");'> <i class="fa fa-minus-circle"></i> </a>
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
<script type="text/javascript" src="//code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
    
function deletefront(id)
{
     var url = 'index.php?route=custom/add_shirt/deleteoptions&token=<?php echo $token; ?>';
     url += '&front=' + id;
     location = url;
}
  
jQuery(document).ready(function($){
    var length=$('.text-box').length =2;

    $('.form-group .add-box').click(function(){
        var n = length + 1;
        length = n;
        var txt;
        txt ="<div class=\"panel-body\">";
txt = txt + " <div class=\"form-group\">";
txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-type\"><?php echo $type; ?></label>";
txt = txt + "  <div class=\"col-sm-10\">";
txt = txt + "<select name=";
txt = txt + 'type'+n;
txt = txt + " class=\"form-control\" >";
txt = txt + "<option value=\"\">select</option>";
txt = txt +  "<?php foreach($rsttype as $rsttypes){ ?>";
txt = txt +  "<option value=\"<?php  echo $rsttypes['name']; ?>\">";
txt = txt +  "<?php  echo $rsttypes['name']; ?><?php } ?> ";
txt = txt +  "</option >";
txt = txt + "  </select>";
txt = txt + "</div>";
txt = txt + "</div>";
txt = txt + " <div class=\"form-group\">";
txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-area\"><?php echo $area; ?></label>";
txt = txt + "  <div class=\"col-sm-10\">";
txt = txt + "<select name=";
txt = txt + 'Area'+n;
txt = txt + " class=\"form-control\" >";
txt = txt + "<option value=\"\">select</option>";
txt = txt +  "<?php foreach($rstarea as $rstareas){ ?>";
txt = txt +  "<option value=\"<?php  echo $rstareas['name']; ?>\">";
txt = txt +  "<?php  echo $rstareas['name']; ?><?php } ?> ";
txt = txt +  "</option >";
txt = txt + "  </select>";
txt = txt + "</div>";
txt = txt + "</div>";
txt = txt + " <div class=\"form-group\">";
txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-design\"><?php echo $design; ?></label>";
txt = txt + "  <div class=\"col-sm-10\">";
txt = txt + "<select name=";
txt = txt+'Design'+n;
txt =txt+"  class=\"form-control\" >";
txt = txt + "<option value=\"\">select</option>";
txt = txt +  "<?php foreach($rstdesign as $rstdesigns){ ?>";
txt = txt +  "<option value=\"<?php  echo $rstdesigns['name']; ?>\">";
txt = txt +  "<?php  echo $rstdesigns['name']; ?><?php } ?> ";
txt = txt +  "</option >";
txt = txt + "  </select>";
txt = txt + "</div>";
txt = txt + "</div>";
txt = txt + " <div class=\"form-group\">";
txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-design\"><?php echo $price; ?></label>";
txt = txt + "  <div class=\"col-sm-10\">";
txt = txt + "<input type='text'  name=\"price"+n+"\" placeholder='Price' id=\"price"+n+"\"  class='form-control price' value='' >";
txt = txt + "</div>";
txt = txt + "</div>";

txt = txt + " <input type=\"hidden\" name=";
txt = txt +'hidden'+n;
txt = txt + " value=\"space\">";
txt = txt + " <div class=\"form-group\">";
txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-type\">Upload Image</label>";
txt = txt + "  <div class=\"col-sm-10\">";
txt = txt + " <input type=\"file\" name=\"file"+n+"\"  id=\"file"+n+"\" class=\"form-control uploadfile\">";
txt = txt + "</div>";
txt = txt + "</div>";
/*txt = txt + " <div class=\"form-group\">";
txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-type\"></label>";
txt = txt + "  <div class=\"col-sm-10\">";
txt = txt + " <a href='#' class='remove-box'>Remove</a>";
txt = txt + "</div>";
txt = txt + "</div>"; */
txt = txt + "</div>";
        
        var box_html = $(txt);
        box_html.hide();
        $('.form-group p.text-box:last').before(box_html);
        box_html.fadeIn('slow');
        
        document.getElementById("addcounter").value= length;
        start();
        return false;
        
        
    });
});

$('.form-group').on('click', '.remove-box', function(){
   // $(this).parent().css( 'background-color', '#FF6C6C' );
    $(this).parent().fadeOut("slow", function() {
        $(this).remove();
        var newcount= document.getElementById("addcounter").value;
        var ncount=newcount-1;
        
        document.getElementById("addcounter").value=ncount;
        $('.box-number').each(function(index){
            $(this).text( index + 1 );
        });
    });
    return false;
});
</script>  
        
<script>
function start()
{ 
    $(".uploadfile").change(function()
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
    
    $(".price").blur(function() 
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
}

$(document).ready(function(){
$(".uploadfile").change(function()
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



$(".price").blur(function() 
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
 
 }); 
 

</script>

        </div>
    </div>
  </div>
<!-- </div> -->
<style>
    .my_error {
   color: green;
    font-color:#98FB98;
    font-size: 15px;
    margin-bottom: 10px;
    margin-left: 20px;
}
    </style>
<?php echo $footer; ?>

