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
                    <input type="text" name="bordercolor1" value="" placeholder="<?php echo $bordercolor; ?>" id="color1" class="form-control color" />
                    <?php if ($error_design) { ?>
                    <div class="text-danger"><?php echo $error_design; ?></div>
                    <?php } ?>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $bordercolor; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="bordercolor2" value="" placeholder="<?php echo $bordercolor; ?>" id="color2" class="form-control color" />
                    <?php if ($error_design) { ?>
                    <div class="text-danger"><?php echo $error_design; ?></div>
                    <?php } ?>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $bordercolor; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="bordercolor3" value="" placeholder="<?php echo $bordercolor; ?>" id="color3" class="form-control color" />
                    <?php if ($error_design) { ?>
                    <div class="text-danger"><?php echo $error_design; ?></div>
                    <?php } ?>
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
                        foreach($bordercoloulist as $borderlist)
                        {
                            $lengthid = $borderlist['id'];
                    ?>
                    <tr>
                        <td style="height: 68px; text-align: center;">
                            <p>
                                <span style="background-color: <?php echo $borderlist['border_color']; ?>; padding: 15px 60px 18px 0px; border-radius: 3px; border: 2px solid #dddddd;" ></span>
                            </p>
                        </td>
                        <td style="text-align: center;">
                            <a href="javascript:void(0);" id='removeborder<?php echo $lengthid ; ?>' data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick='deletecolor("<?php echo $lengthid ; ?>");'> <i class="fa fa-minus-circle"></i> </a>
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
    
  function deletecolor(id)
  {
    
     var url = 'index.php?route=custom/bordercolor/deleteoptions&token=<?php echo $token; ?>';
     url += '&border=' + id;
     location = url;
    
  }
    
jQuery(document).ready(function($){
    var length=$('.text-box').length =1;

    $('.form-group .add-box').click(function(){
        var n = length + 1;
        length = n;
        var txt;
        txt ="<div class=\"panel-body\">";
        txt = txt + " <div class=\"form-group\">";
        txt = txt + " <label class=\"col-sm-2 control-label\" for=\"input-name\"><?php echo $bordercolor; ?></label>";
        txt = txt + "  <div class=\"col-sm-10\">";
        txt = txt + "<input type=\"text\" name=\"bordercolor"+n+"\" value=\"\" placeholder=\"<?php echo $bordercolor; ?>\" id=\"color"+n+"\" class=\"form-control color\" />";
        txt = txt + "</div>";
        txt = txt + "</div>";
        txt = txt + "</div>";
        
        var box_html = $(txt);
        box_html.hide();
        $('.form-group p.text-box:last').before(box_html);
        box_html.fadeIn('slow');
        
        document.getElementById("addcounter").value= length;
        var id= "color"+n;
        start(id);
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
function start(id)
{ 
   /* (function($) { */
    $(".color").click(function(o) {
        // var colorPicker = $(this);
      //  var colorPickerInput = $(this).children('input');
        $(this).ColorPicker({
                livePreview: true,
                color: '#0000ff',
                onShow: function (colpkr) {
                    $(colpkr).fadeIn(500);
                    return false;
                },
                onHide: function (colpkr) {
                    $(colpkr).fadeOut(500);
                    return false;
                },
                onClick: function (hsb, hex, rgb) {
                    $(colorPickerInput).val('#' + hex);
                }
            });
    });
/* }) (jQuery) */
}

 

</script>

      </div>
    </div>
  </div>
<!--</div> -->
<?php echo $footer; ?>

<style>
    .my_error {
   color: #98FB98;
    font-color:#98FB98;
    font-size: 15px;
    margin-bottom: 10px;
    margin-left: 20px;
}
    </style>