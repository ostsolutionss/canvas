<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-popular" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo HTTPS_SERVER; ?>index.php?route=custom/customdesign&token=<?php echo $token ;?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
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
        if(!empty($my_error)){
        
        echo $my_error;
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
                     <label class="col-sm-2 control-label" for="input-type"><?php echo $style; ?></label>
                     <div class="col-sm-10">
                         <select name="style1"  class="form-control" >
                            <option value="">Select</option>
                            <?php foreach($rststyle as $rststyles){ ?><option value="<?php echo $rststyles['name'];?>"><?php echo $rststyles['name'];?><?php }?> </option>
                         </select>
                        <?php if ($error_type) { ?>
                        <div class="text-danger"><?php echo $error_type; ?></div>
                        <?php } ?>
                     </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-area"><?php echo $border; ?></label>
                    <div class="col-sm-10">
                            <select name="border1"  class="form-control" >
                                <option value="">Select</option>
                                <?php foreach($rstborder as $rstborders){ ?><option value="<?php echo $rstborders['name'];?>"><?php echo $rstborders['name'];?></option><?php } ?>
                            </select>
                            <?php if ($error_area) { ?>
                                    <div class="text-danger"><?php echo $error_area; ?></div>
                            <?php } ?>
                    </div>
                </div>
            
                <div class="form-group">
                       <label class="col-sm-2 control-label" for="input-design"><?php echo $pipping; ?></label>
                       <div class="col-sm-10">
                            <select name="pipping1"  class="form-control" >
                            <option value="">Select</option>
                            <?php foreach($rstpipping as $rstpippings){ ?><option value="<?php echo $rstpippings['name'];?>"><?php echo $rstpippings['name'];?></option><?php } ?>
                             </select>
                            <?php if ($error_design) { ?>
                                <div class="text-danger"><?php echo $error_design; ?></div>
                            <?php } ?>
                       </div>
                </div>
            
                <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-design"><?php echo $buttons; ?></label>
                        <div class="col-sm-10">
                            <select name="buttons1"  class="form-control" >
                                <option value="">Select</option>
                                <?php foreach($rstbuttons as $rstbutton){ ?><option value="<?php echo $rstbutton['name'];?>"><?php echo $rstbutton['name'];?> </option><?php } ?>
                            </select>
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
                        <label class="col-sm-2 control-label" for="input-type"><?php echo $style; ?></label>
                        <div class="col-sm-10">
                            <select name="style2"  class="form-control" >
                                <option value="">Select</option>
                                <?php foreach($rststyle as $rststyles){ ?><option value="<?php echo $rststyles['name'];?>"><?php echo $rststyles['name'];?><?php }?></option>
                            </select>
                            <?php if ($error_type) { ?>
                                <div class="text-danger"><?php echo $error_type; ?></div>
                            <?php } ?>
                        </div>
                </div>
                <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-area"><?php echo $border; ?></label>
                        <div class="col-sm-10">
                            <select name="border2"  class="form-control" >
                                    <option value="">Select</option>
                                    <?php foreach($rstborder as $rstborders){ ?><option value="<?php echo $rstborders['name'];?>"><?php echo $rstborders['name'];?></option><?php } ?>
                            </select>
                            <?php if ($error_area) { ?>
                                    <div class="text-danger"><?php echo $error_area; ?></div>
                            <?php } ?>
                        </div>
                </div>
            
                <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-design"><?php echo $pipping; ?></label>
                        <div class="col-sm-10">
                            <select name="pipping2"  class="form-control" >
                                    <option value="">Select</option>
                                    <?php foreach($rstpipping as $rstpippings){ ?><option value="<?php echo $rstpippings['name'];?>"><?php echo $rstpippings['name'];?></option><?php } ?>
                            </select>
                            <?php if ($error_design) { ?>
                                    <div class="text-danger"><?php echo $error_design; ?></div>
                            <?php } ?>
                        </div>
                </div>
            
                <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-design"><?php echo $buttons; ?></label>
                        <div class="col-sm-10">
                            <select name="buttons2"  class="form-control" >
                                    <option value="">Select</option>
                                    <?php foreach($rstbuttons as $rstbutton){ ?><option value="<?php echo $rstbutton['name'];?>"><?php echo $rstbutton['name'];?></option><?php } ?>
                            </select>
                            <?php if ($error_design) { ?>
                                <div class="text-danger"><?php echo $error_design; ?></div>
                            <?php } ?>
                        </div>
                </div>
                <input type="hidden" name="hidden1" value="space">
           
                <div class="form-group">
                        <label class="col-sm-2 control-label" >Upload Image</label>
                        <div class="col-sm-10">
                                <input type="file" i name="file2" value="" placeholder="" id="file1" class="form-control uploadfile" />
                        </div>
               </div>
   
               <div class="form-group">
            <p class="text-box" style="display: none;">
                <label for="box1">Box <span class="box-number">1</span></label>
                <input type="text" value="" name="provider0" placeholder="URL (Web Address)" />

            </p>
            <label class="col-sm-2 control-label" ></label>
                <div class="col-sm-10">
                  <a class="add-box addmore" href="javascript:void(0);">Add More</a>
                </div>
       </div>
            <input type="hidden" name="addcounter" id="addcounter" value="2" style="float:right;"/>
        </form> 
      </div> 
 <script type="text/javascript" src="//code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
    
    /*  --- ADD MORE SCRIPT STARTS HERE ---    */
    
jQuery(document).ready(function($){

var length=$('.text-box').length =2;

$('.form-group .add-box').click(function(){
    var n = length + 1;
    length = n;
    var txt;
    txt ="<div class=\"panel-body\">";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-type\"><?php echo $style; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<select name=";
    txt = txt + 'style'+n;
    txt = txt + " class=\"form-control\" >";
    txt = txt + "<option value=\"\">select</option>";
    txt = txt +  "<?php foreach($rststyle as $rststyles){ ?>";
    txt = txt +  "<option value=\"<?php  echo $rststyles['name']; ?>\">";
    txt = txt +  "<?php  echo $rststyles['name']; ?><?php } ?> ";
    txt = txt +  "</option >";
    txt = txt + "  </select>";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-area\"><?php echo $border; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<select name=";
    txt = txt + 'border'+n;
    txt = txt + " class=\"form-control\" >";
    txt = txt + "<option value=\"\">select</option>";
    txt = txt +  "<?php foreach($rstborder as $rstborders){ ?>";
    txt = txt +  "<option value=\"<?php  echo  $rstborders['name']; ?>\">";
    txt = txt +  "<?php  echo  $rstborders['name']; ?><?php } ?> ";
    txt = txt +  "</option >";
    txt = txt + "  </select>";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-design\"><?php echo $pipping; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<select name=";
    txt = txt+'pipping'+n;
    txt =txt+"  class=\"form-control\" >";
    txt = txt + "<option value=\"\">select</option>";
    txt = txt +  "<?php foreach($rstpipping as $rstpippings){ ?>";
    txt = txt +  "<option value=\"<?php  echo $rstpippings['name']; ?>\">";
    txt = txt +  "<?php  echo  $rstpippings['name']; ?><?php } ?> ";
    txt = txt +  "</option >";
    txt = txt + "  </select>";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-design\"><?php echo $buttons; ?></label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + "<select name=";
    txt = txt+'buttons'+n;
    txt =txt+"  class=\"form-control\" >";
    txt = txt + "<option value=\"\">select</option>";
    txt = txt +  "<?php foreach($rstbuttons as $rstbutton){ ?>";
    txt = txt +  "<option value=\"<?php  echo $rstbutton['name']; ?>\">";
    txt = txt +  "<?php  echo $rstbutton['name']; ?><?php } ?> ";
    txt = txt +  "<option >";
    txt = txt + "  </select>";
    txt = txt + "</div>";
    txt = txt + "</div>";
    txt = txt + " <input type=\"hidden\" name=";
    txt = txt +'hidden'+n;
    txt = txt + " value=\"space\">";
    txt = txt + " <div class=\"form-group\">";
    txt = txt + " <label class=\"col-sm-2 control-label\" >Upload Image</label>";
    txt = txt + "  <div class=\"col-sm-10\">";
    txt = txt + " <input type=\"file\" name=\"file"+n+"\"  id=\"file"+n+"\" class=\"form-control uploadfile\">";
    txt = txt + "</div>";
    txt = txt + "</div>";
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

/*  --- ADD MORE SCRIPT ENDS HERE ---    */

/*  -- FORM VALIDATIONS ON ADD MORE FORM FILEDS STARTS HERE --    */

function start()
{ 
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

}

/*  -- FORM VALIDATIONS ON ADD MORE FORM FILEDS ENDS HERE --    */

/*  -- FORM VALIDATIONS STARTS HERE --    */

$(document).ready(function(){
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
}); 
 
/*  -- FORM VALIDATIONS ENDS HERE --    */
</script>       
       </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
