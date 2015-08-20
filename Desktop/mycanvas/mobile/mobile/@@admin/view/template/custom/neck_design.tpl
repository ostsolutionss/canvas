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
                    <label class="col-sm-2 control-label" >Design Name</label>
                    <div class="col-sm-10">
                      <input type="text"  name="designname1" value="" placeholder="Enter Design Name" id="designname1" class="form-control" />
                    </div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Upload Icon</label>
                    <div class="col-sm-10">
                      <input type="file"  name="designfile1" value="" placeholder="" id="designfile1" class="form-control uploadfile" />
                    </div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Upload Canvas Base Image</label>
                    <div class="col-sm-10">
                      <input type="file"  name="can_base1" value="" placeholder="" id="can_base1" class="form-control uploadfile" />
                    </div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Upload Canvas Outline Image</label>
                    <div class="col-sm-10">
                      <input type="file"  name="canvas_outline1" value="" placeholder="" id="canvas_outline1" class="form-control uploadfile" />
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
                        <th>Title</th>
                        <th>Neck Icon</th>
                        <th>Neck Canvas Base</th>
                        <th>Neck Canvas Outline</th>
                        <th>Action</th>
                    </tr>
                    <?php 
                        foreach($listdesign as $designlisting)
                        {
                            $ndesignid = $designlisting['id'];
                    ?>
                    <tr>
                        <td> <?php echo $designlisting['design_name']; ?></td>
                        <td>
                            <img src="<?php echo $base.$designlisting['design_icon']; ?>" class="customimg"/>
                        </td>
                        <td>
                            <img src="<?php echo $base.$designlisting['design_canvas_base']; ?>" class="customimg" />
                        </td>
                        <td>
                            <img src="<?php echo $base.$designlisting['design_canvs_outline']; ?>" class="customimg" />
                        </td>
                        <td style="text-align: center;">
                            <a href="javascript:void(0);" id='removeborder<?php echo $ndesignid ; ?>' data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick='deletendesign("<?php echo $ndesignid ; ?>");'> <i class="fa fa-minus-circle"></i> </a>
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
    
function deletendesign(id)
  {
    
     var url = 'index.php?route=custom/neck_design/deleteoptions&token=<?php echo $token; ?>';
     url += '&design=' + id;
     location = url;
    
  }    
    
    /*  --- ADD MORE SCRIPT STARTS HERE ---    */
    
jQuery(document).ready(function($){

var length=$('.text-box').length =1;

$('.form-group .add-box').click(function(){
    var n = length + 1;
    length = n;
    var txt;
    txt ="<div class=\"panel-body\">";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" >Design Name</label>";
    txt = txt + " <div class=\"col-sm-10\">";
    txt = txt + " <input type=\"text\"  name=\"designname"+n+"\" value=\"\" placeholder=\"Enter Design Name\" id=\"designname"+n+"\" class=\"form-control\" />";
    txt = txt + " </div>";
    txt = txt + " </div>";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-type\">Upload Image</label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<input type=\"file\" name=\"designfile"+n+"\"  id=\"designfile"+n+"\" class=\"form-control uploadfile\">";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + "</div>";
        
        var box_html = $(txt);
        box_html.hide();
        $('.form-group p.text-box:last').before(box_html);
        box_html.fadeIn('slow');
        
        document.getElementById("addcounter").value= length;
        validate();
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

/*  --- ADD MORE SCRIPT ENDS HERE ---    */

/*  -- FORM VALIDATIONS ON ADD MORE FORM FILEDS STARTS HERE --    */

function validate()
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

}

/*  -- FORM VALIDATIONS ON ADD MORE FORM FILEDS ENDS HERE --    */

/*  -- FORM VALIDATIONS STARTS HERE --    */

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
}); 
 
/*  -- FORM VALIDATIONS ENDS HERE --    */
</script>
    
      </div>
    </div>
  </div>
<style>
.my_error
{
    color: #98FB98;
    font-color:#98FB98;
    font-size: 15px;
    margin-bottom: 10px;
    margin-left: 20px;
}
.customimg
{
    background-color: #f1f1f1;
}
</style>
<?php echo $footer; ?>

