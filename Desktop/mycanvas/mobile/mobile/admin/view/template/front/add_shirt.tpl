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
           <label class="col-sm-2 control-label" for="input-type"><?php echo $type; ?></label>
            <div class="col-sm-10">
             	<select name="type1"  class="form-control" >
               <option value="">Select</option>
               <option value="Front">Front</option>
           
               
               
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
                <option value="Full">Full</option>
                <option value="Middle">Middle</option>
                <option value="Body">Body</option>
               <option value="Neck">Neck</option>
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
                <option value="Digital">Digital</option>
                <option value="Embroidery">Embroidery</option>
                <option value="Block Print">Block Print</option>
               
              </select>
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
                    <!--<input type="file"  name="file[]" value="" placeholder="" id="input-limit" class="form-control" />-->
  
            </div>
         </div>
           

         
       <div class="form-group">
           <label class="col-sm-2 control-label" for="input-type"><?php echo $type; ?></label>
            <div class="col-sm-10">
             	<select name="type2"  class="form-control" >
                <option value="">Select</option>
                <option value="Front">Front</option>
              
               
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
                <option value="Full">Full</option>
                <option value="Middle">Middle</option>
                <option value="Body">Body</option>
               <option value="Neck">Neck</option>
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
                <option value="Digital">Digital</option>
                <option value="Embroidery">Embroidery</option>
                <option value="Block Print">Block Print</option>
               
              </select>
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
                    <!--<input type="file"  name="file[]" value="" placeholder="" id="input-limit" class="form-control" />-->
  
            </div>
              <div class="form-group">

            <div class="col-sm-12">
            <div id='apendfile'> </div>
            </div>
                </div>
    
 </div>         
   <input type="hidden" id="addcounter"  value="2" name="addcounter">         
      
<a  href='javascript:void(0);' onclick='add_more();' id="link" title="Add more">Add More</a>
       </form>    </div>
        
       <script>
           
           
           $(".uploadfile").blur(function()
                  {
                      
                     var i =$("#addcounter").val();
                    i++;
                     $("#addcounter").val(i); 
              
                      var fileid = $(this).attr("id");
                      var ext = $('#'+fileid).val().split('.').pop().toLowerCase();
                    if($.inArray(ext, ['jpg']) == -1) {
                        
                    }
                    else
                        {
                            alert('invalid extension!');
                        }
                   });
           
           
           
  function add_more() {
  
 var i =$("#addcounter").val();
 i++;
  $("#addcounter").val(i);
 //alert(i);
 
  var txt;
txt ="<div class=\"panel-body\">";
txt = txt + " <div class=\"form-group\">";
txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-type\"><?php echo $type; ?></label>";
txt = txt + "  <div class=\"col-sm-10\">";
txt = txt + "<select name=";
txt = txt + 'type'+i;
txt = txt + " class=\"form-control\" >";
txt = txt + "<option value=\"\">select</option>";
txt = txt + " <option value=\"Front\">Front</option>";
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
txt = txt + "<option value=\"Full\">Full</option>";
txt = txt + " <option value=\"Middle\">Middle</option>";
txt = txt + " <option value=\"Body\">Body</option>";
txt = txt + " <option value=\"Neck\">Neck</option>";
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
txt = txt + "<option value=\"Digital\">Digital</option>";
txt = txt + " <option value=\"Embroidery\">Embroidery</option>";
txt = txt + " <option value=\"Block Print\">Block Print</option>";
txt = txt + "  </select>";
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
     <!--<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>-->
       
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>

<style>
    .my_error {
    color: red;
    font-color: red;
    font-size: 15px;
    margin-bottom: 10px;
    margin-left: 20px;
}
    </style>