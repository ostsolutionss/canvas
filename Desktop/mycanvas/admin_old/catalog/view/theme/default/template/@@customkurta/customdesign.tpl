<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>index</title>
<!-- Bootstrap -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/smoothness/jquery-ui.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,400italic,700italic,600italic,300' rel='stylesheet' type='text/css'>
<link href="customdesign/css/bootstrap.css" rel="stylesheet">
<link href="customdesign/css/style.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,300italic,400italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="customdesign/js/bootstrap.min.js"></script> 
<script src="customdesign/js/custom.js"></script>
<script src="customdesign/lib/customdesign.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/customkurtajs/captureimg/html2canvas.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/customkurtajs/captureimg/jquery.plugin.html2canvas.js"></script>
<!-- mutilple upload -->
<link rel="stylesheet" media="all" href="customdesign/mutiple_image/style11.css" />
<script src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>




<!-- multiple upload -->

<?php             
                        $servername = DB_HOSTNAME;
                        $username   =  DB_USERNAME;
                        $password   = DB_PASSWORD;
                        $dbname     = DB_DATABASE;
                        $db_driver  = DB_DRIVER;
                $conn = new $db_driver($servername, $username, $password, $dbname);

                $sql = "SELECT  image FROM ".DB_PREFIX."product WHERE  product_id=$_GET[pro_id]";
                $result = $conn->query($sql);
                      while($row = $result->fetch_assoc()) {
                     $image = "image/".$row["image"];
                  }

                 $color= "Select * from `".DB_PREFIX."option_value` where option_id='28'";
                 $color_result = $conn->query($color);
                 

                         
?>
<style>
.left
{
    float:left; width :100%;
}
    #customize {
  color: red;
  cursor: pointer;
  float: left;
  font-size: 20px;
  padding-top: 20px;
  width: 100%;
}
.rgt {
  float: left;
  height: 80px;
  width: 100%;
}
.rgt > p {
  color: red;
}
.rgt > input {
  margin-left: 10px;
}
.rgt > span {
  margin-left: 11px;
}
.rgt > select {
  margin-left: 10px;
}
.chosecolor > select {
  margin-left: 10px;
}
.text
{
    border: 1px solid #000;
    cursor: pointer;
    display: inline-block;
    padding: 5px;

}
.cir_fill
{
  background: none repeat scroll 0 0 #000;
  border: 1px solid transparent;
  border-radius: 52%;
  color: #fff;
  margin-right: 9px;
  padding: 3px; cursor: pointer;
}
.cir
{
border: 1px solid ;
  border-radius: 52%;
  margin-right: 9px;
  padding: 3px; cursor: pointer;
}
.rct_fill
{
  background: none repeat scroll 0 0 #000;
  border: 1px solid transparent;
  color: #fff;
  margin-right: 9px;
  padding: 3px; cursor: pointer;
}
.rct
{
  border: 1px solid #000;
  margin-right: 9px;
  padding: 3px;
  text-align: center; cursor: pointer;
}
.shapes {
  float: left;
  height: 179px;
  margin-bottom: 13px;
  margin-top: 10px;
  width: 62%;
}
.shapes > p {
  color: red;
}
.shapes > button {
  float: left;
  height: 31px;
  margin-left: 10px;
  width: 24%;
}
.shapes > textarea {
  float: left;
  margin-left: 10px;
  margin-top: 13px;
  padding: 10px;
  width: 85%;
}
.or {
  float: left;
  height: 11px;
  margin-bottom: 13px;
  margin-top: 3px;
  width: 100%;
}
.images_upload
{
  float: left;
  height: 60px;
  margin-bottom: 13px;
  margin-top: 10px;
  width: 100%;
}
.shape.rectangle
{
  border: 1px solid transparent;
  background: #000;
  color: #fff;
  padding: 3px;  cursor: pointer;
}
.chosecolor
{
  float: left;
  width: 100%;
  height: 90px;
}
.chosecolor > span
{
  height: 20px;
  margin: 8px;
  padding: 11px 21px;
  width: 20px; cursor: pointer;
}
.choseprtn
{
  float: left;
  height: 115px;
  width: 100%;
}
.choseprtn img
{
  cursor: pointer;
}
.chrlimit
{
  background-color: #ededed;
  cursor: pointer;
  font-weight: 600;
  padding: 5px;
}
.canvasdiv {
  float: left;
  height: 310px;
  width: 35%;
}
.canvasright {
  float: left;
  margin-left: 2%;
  width: 49%;
}

#canvas {
    /**/
    /*background: url("http://webastral.mybigcommerce.com/product_images/1234.png") repeat scroll 0 0 rgba(0, 0, 0, 0);*/
  /*background: url("<?php echo $image;?> ") repeat scroll 0 0 / 100% 100% rgba(0, 0, 0, 0);*/
  /*position: absolute;*/
  z-index: -9;
}
.choserotate
{
  float: left;
  width: 100%;
  height: 90px;
}
.choserotate > span
{
  height: 20px;
  margin: 8px;
  padding: 11px 21px;
  width: 20px; cursor: pointer;
}
.rot {
  border: 1px solid #000;
  cursor: pointer;
  margin-right: 9px;
  padding: 3px;
  text-align: center;
}



/* FOR  MObile */
<?php if($_GET['path']==74){ ?>
#shapecanvas {
    left: 23% !important;
    top: 76px !important;
    z-index: 999;
}
.upper-canvas {

  z-index: 999;
  left: 23% !important;
  top: 76px !important;

}
@media only screen and (max-width: 980px) {
  #shapecanvas {
   
  height: 543px !important;
  left: 17% !important;
  top: 167px !important;
  width: 66% !important;
  z-index: 999;
  border:1px solid red !important;
}
.upper-canvas {
    
    height: 543px !important;
    left: 17% !important;
    top: 167px !important;
    width: 66% !important;
    z-index: 999;
}
}
@media only screen and (max-width: 800px) {
  #shapecanvas {
    
  height: 543px !important;
  left: 17% !important;
  top: 167px !important;
  width: 66% !important;
  z-index: 999;
  border:1px solid red !important;
 
}
.upper-canvas {
    
    height: 543px !important;
    left: 17% !important;
    top: 167px !important;
    width: 66% !important;
    z-index: 999;
}
}
@media only screen and (max-width: 768px) {
  #shapecanvas {
    
  height: 543px !important;
  left: 17% !important;
  top: 167px !important;
  width: 66% !important;
  z-index: 999;
  border:1px solid red !important;
}
.upper-canvas {
    
    height: 543px !important;
    left: 17% !important;
    top: 167px !important;
    width: 66% !important;
    z-index: 999;
    border:1px solid yellow !important;
}
}
@media only screen and (max-width: 360px) {
  #shapecanvas {
  height: 200px !important;
  left: 20% !important;
  top: 72px !important;
  width: 59% !important;
  z-index: 999;
  
  
}
.upper-canvas {
  height: 200px !important;
  left: 20% !important;
  top: 72px !important;
  width: 59% !important;
  z-index: 999;
   
}
}

@media only screen and (max-width: 320px) {
  #shapecanvas {
  height: 170px !important;
  left: 20% !important;
  top: 64px !important;
  width: 58% !important;
  z-index: 999;
  
  
}
.upper-canvas {
  height: 170px !important;
  left: 20% !important;
  top: 64px !important;
  width: 58% !important;
  z-index: 999;
  
  
}
}


/* FOR MUG */

<?php } elseif($_GET['path']==69){ ?>
  #shapecanvas {
    left: 20% !important;
    top: 111px !important;
     height: 64% !important;
    z-index: 999;
}
.upper-canvas {

  z-index: 999;
   height: 64% !important;
  left: 20% !important;
  top: 111px !important;

}
@media only screen and (max-width: 980px) {
  #shapecanvas {
   
  height: 543px !important;
  left: 17% !important;
  top: 167px !important;
  width: 51% !important;
  z-index: 999;
  
}
.upper-canvas {
    
    height: 543px !important;
    left: 17% !important;
    top: 167px !important;
    width: 51% !important;
    z-index: 999;
}
}
@media only screen and (max-width: 800px) {
  #shapecanvas {
    
  height: 543px !important;
  left: 17% !important;
  top: 167px !important;
  width: 51% !important;
  z-index: 999;
 
}
.upper-canvas {
    
    height: 543px !important;
    left: 17% !important;
    top: 167px !important;
    width: 51% !important;
    z-index: 999;
}
}
@media only screen and (max-width: 768px) {
  #shapecanvas {
    
  height: 543px !important;
  left: 17% !important;
  top: 167px !important;
  width: 51% !important;
  z-index: 999;
  
}
.upper-canvas {
    
    height: 543px !important;
    left: 17% !important;
    top: 167px !important;
    width: 51% !important;
    z-index: 999;
}
}
@media only screen and (max-width: 360px) {
  #shapecanvas {
  height: 200px !important;
  left: 20% !important;
  top: 72px !important;
  width: 46% !important;
  z-index: 999;
  
}
.upper-canvas {
  height: 200px !important;
  left: 20% !important;
  top: 72px !important;
  width: 46% !important;
  z-index: 999;
}
}

@media only screen and (max-width: 320px) {
  #shapecanvas {
  height: 170px !important;
  left: 20% !important;
  top: 64px !important;
  width: 46% !important;
  z-index: 999;
  
}
.upper-canvas {
  height: 170px !important;
  left: 20% !important;
  top: 64px !important;
  width: 46% !important;
  z-index: 999;
  
}
}

/* FOR T SHIRT */
<?php } else { ?>
#shapecanvas {

  left: 27% !important;
z-index: 999;
  top: 188px !important;

}

.upper-canvas {

  z-index: 999;
  left: 27% !important;
  top: 188px !important;

}
@media only screen and (max-width: 980px) {
 #shapecanvas {
   
    height: 443px !important;
    left: 28% !important;
    top: 292px !important;
    width: 46% !important;
    z-index: 999;
}
.upper-canvas {
   
    height: 443px !important;
    left: 28%  !important;
    top: 292px !important;
    width: 46% !important;
    z-index: 999;
}
}
@media only screen and (max-width: 800px) {
 #shapecanvas {
   
    height: 443px !important;
    left: 28% !important;
    top: 292px !important;
    width: 46% !important;
    z-index: 999;
}
.upper-canvas {
   
    height: 443px !important;
    left: 28% !important;
    top: 292px !important;
    width: 46% !important;
    z-index: 999;
}
}

@media only screen and (max-width: 768px) {
 #shapecanvas {
    
    height: 443px !important;
    left: 28% !important;
    top: 292px !important;
    width: 46% !important;
    z-index: 999;
}
.upper-canvas {
   
    height: 443px !important;
    left: 28% !important;
    top: 292px !important;
    width: 46% !important;
    z-index: 999;
}
}

@media only screen and (max-width: 360px) {
  #shapecanvas {
  height: 173px !important;
  left: 30% !important;
  top: 121px !important;
  width: 42% !important;
  z-index: 999;
  
}
.upper-canvas {
    
    height: 173px !important;
    left: 30% !important;
    top: 121px !important;
    width: 42% !important;
    z-index: 999;
}
}

@media only screen and (max-width: 320px) {
 #shapecanvas {
    
    height: 147px !important;
    left: 30% !important;
    top: 99px !important;
    width: 42% !important;
    z-index: 999;
}
.upper-canvas {
  
  height: 147px !important;
  left: 30% !important;
  top: 99px !important;
  width: 42% !important;
  z-index: 999;
}
}


<?php } ?>
#image_capture {
  border: 1px solid;
  height: auto;
  width: 100% !important;
}
#image_capture > canvas {
  width: 100% !important;
}
.canvas-container {
  height: auto !important;
  width: 100% !important;
}
#shapecanvas:hover {
  border: 1px dotted;
}
.upper-canvas:hover {
  border: 1px dotted;
}
.shape.image {
  border: 1px solid #000;
cursor: pointer;
margin-left: 10px;
margin-right: 9px;
padding: 3px;
text-align: center;
}
.canvas-container{
  position:inherit !important;
}
#fontsize{
  width:60%;
}
.sscolor {
    width: 13% !important;
}
</style>

<script>

$(function(){
  //alert("cvcv");
    
    /*  ----------  CANVAS IMAGE AND CHANGE CANVAS IMAGE PATTERN  ----------   */
    var img1=new Image();

    var img=new Image();
    var sfab = new Image();

    img1.onload=function(){
            start();
        }
    img1.src="<?php echo $image; ?>";

    $('.img1').click(function(){  
        var img2= $(this).attr('src'); 
        var option_value_ids= $(this).attr('alt'); 
        $("#pro_option").val(option_value_ids);
        sfab.src=img2;
        start();
    });

    $('.button').click(function(){  
      $('#image_capture').html2canvas({
            onrendered: function (canvas) {
              //alert(canvas.toDataURL("image/png"));
                $('#frnt_img_val').val(canvas.toDataURL("image/png"));
            }
        });
        $(".button-cart1").hide(); 
      $(".button-cart").show();

    });
    
    function start(){
        var canvas=document.getElementById("canvas");
        var ctx=canvas.getContext("2d");
        ctx.drawImage(img1,0,0);

        ctx.globalCompositeOperation="source-atop";
        ctx.globalAlpha=.99; 
        

        
        if(sfab.src != '')
        {
            var pattern = ctx.createPattern(sfab, 'repeat');
            ctx.rect(0, 0, canvas.width, canvas.height);
            ctx.fillStyle = pattern;
            ctx.fill();
            
        }

        ctx.globalAlpha=.15; 
        ctx.drawImage(img1,0,0);
        ctx.drawImage(img1,0,0);

        var target = $('#image_capture');
        html2canvas(target, {
                onrendered: function(canvas) {
                var data = canvas.toDataURL();
                  $('#frnt_img_val').val(data);
            }
        });
  
    }
// call to SecondMoves
   SecondMoves();

}); // end $(function(){});
function SecondMoves(){
    // Your Fabric Canvas
    var canvas = new fabric.Canvas('shapecanvas');

        // Take the value from the textarea and send to the addText  function. 
        $('.add-text').on('click', function(e){
            e.preventDefault();
            var text = $('#filedset').val();
           addText(text);
        });
        
        // Change the text color. 
        $(".sscolor").change(function() {
            
            var fontcolor = $(".sscolor").val();
            var fontcolor_hash= "#"+fontcolor;
            $("#hid_textcolor").val(fontcolor_hash);
            // alert(fontcolor_hash);
            var obj = canvas.getActiveObject();
            if (!obj) return;
               obj.set({fill: fontcolor_hash});
               canvas.renderAll();
         });
        
        // Change the Text font family. 
        
        $("#textfont").change(function(){
            var fontControl = $("#textfont option:selected").val();
            $("#hid_textfont").val(fontControl);
            // alert(fontControl);
            var obj = canvas.getActiveObject();
             if (!obj) return;
                obj.set({fontFamily: fontControl});
                canvas.renderAll();
        });
        
        // Change Font Size. 
       $("#fontsize").click(function(){
            var fontControlsize = $("#fontsize").val();
            $("#sfontsize").val(fontControlsize);
            //alert(fontControlsize);
            var obj = canvas.getActiveObject();
            if (!obj) return;
            obj.set({fontSize: fontControlsize});
            canvas.renderAll();
      });

 $('#filedset').on('keyup' , function(){

    var activeObject = canvas.getActiveObject();
    if (activeObject && activeObject.type === 'text') {
        if (!this.value) {
            return false;
        }
        else {
            activeObject.setText(this.value);
            console.log(this.value);
        }
    }

    canvas.renderAll();

});

function addText(addtext) {

  var text = new fabric.Text(addtext, { 
   fontFamily: 'Arial',
  fontSize: 30,
  left: 100,
  top: 100,
  radius: 200,
  dir: -1,
  animation : 300,
  fill: '#965D24',
  textAlign: "left",
  originY: 'center',
  lineHeight: 2
        });
    canvas.add(text); 
    var target = $('#image_capture');
        html2canvas(target, {
                onrendered: function(canvas) {
                var data = canvas.toDataURL();
                //alert(data);
                  $('#frnt_img_val').val(data);
            }
        });
}

      
  }
  
</script>
</head>
<body>
<div class="button"></div>
  <form method="POST" enctype="multipart/form-data" action="" id="myForm">
                <input type="hidden" name="frnt_img_val" id="frnt_img_val" value="" />
                <input type="hidden" name="back_img_val" id="back_img_val" value="" />
                <input type="hidden" name="product_id" id="product_id" value="<?php echo $_GET['pro_id']; ?>" />
                <input id="input-quantity" class="form-control" type="hidden" size="2" value="1" name="quantity">
                <input type="hidden" name="pro_option" id="pro_option" value="" />
                <input type="hidden" name="userid" id="userid" value="<?php echo $_GET['link']; ?>" />
                <input type="hidden" name="categoryid" id="categoryid" value="<?php echo $_GET['path']; ?>" />
                <input type="hidden" name="product_price" id="proprice" value="20" />
        </form>
<div class="middle">
  <div class="container">
    <div class="row">
      <div class="col-md-5" >
      <div class="middle_div"  id="canvas-container">
      
        
          <div id="image_capture">
            
          <canvas id="canvas" height="467" width="400"> </canvas>
          
          <?php if($_GET['path']==74){ ?>
           <canvas id="shapecanvas" height="337" width="274" > </canvas>
           <?php } else { ?>
           <canvas id="shapecanvas" height="278" width="233" > </canvas>
           <?php } ?>
          </div> 
               <input type="hidden" name="frnt_img_val" id="frnt_img_val" value="" />
          </div>
           <div class="slide">
          
          </div> 
        </div>
         <div class="col-md-7">
          <div class="tab_info">
            <div role="tabpanel"> 
              
              <!-- Nav tabs -->
              <ul class="nav nav-tabs" role="tablist">
           
                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"> <i class="fa fa-font"></i> <br>
                  <translate><span class="ng-scope"> Add text </span></translate>
                  </a></li>
             
              </ul>
              
              <!-- Tab panes -->
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                  <div class="panel panel-default ng-scope">
                    <div class="panel-body">
                    
                      <hr>
                      <div class="row">
                       <!--  <div class="col-md-12"> <strong translate=""><span class="ng-scope">Change color:</span></strong> </div> -->
                        <div class="col-md-12">
                         
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-md-12"> <strong translate=""><span class="ng-scope">Description:</span></strong> </div>
                        <div ng-bind-html="currentItem.product.description" class="col-md-12 ng-binding">
                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div role="tabpanel2" class="tab-pane" id="profile">
                  <div class="clip">
                    <div role="tabpanel"> 
                      
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#tab-1" aria-controls="home" role="tab" data-toggle="tab"> Clip Art </a></li>
                        <li role="presentation"><a href="#tab-2" aria-controls="profile" role="tab" data-toggle="tab"> Upload image </a></li>
                        <li role="presentation"><a href="#tab-3" aria-controls="messages" role="tab" data-toggle="tab"> My images </a></li>
                      </ul>
                      
                      <!-- Tab panes -->
                      <div class="tab-content">
                       
                        
                      </div>
                    </div>
                  </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="messages">
                  <div ng-hide="fontSelectionWindow" class="panel panel-default ng-scope">
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-md-12">
                          <p translate=""><span class="ng-scope">Enter your text below</span></p>
                          <textarea rows="4" id="filedset" ng-model="$parent.addText" class="form-control ng-pristine ng-untouched ng-valid"></textarea>
                        </div>
                      </div>
                      <br>
                      <div class="row">
                        <div class="col-md-6">
                          <p translate="" style="margin-bottom: 0;"><span class="ng-scope">Font Family</span></p>
                          
                          
                          <div class="btn-group"> 
                    
                            <input type="hidden" name="hid_textfont" value="" id="sfont" />
                <select id="textfont" name="textfont">
                   <option value="arial">Arial</option>
                   <option value="'Dancing Script', cursive">script monogram</option>
                   <option value="'Open Sans Condensed', sans-serif">Halvetica</option>
                   <option value="Times New Roman">Times</option>
                </select>
                           
                          </div>
                        </div>
<!-- font color -->
       <div class="col-md-6">
                          <p translate="" style="margin-bottom: 0;"><span class="ng-scope">Font Color</span></p>
                          

                          <input type="hidden" name="hid_textcolor"  value="#66ff00" id="hid_textcolor" />
                            <script type="text/javascript" src="customdesign/js/jscolor2.js"></script>
                             <input class="sscolor" value="">
                            
                          </div>
                        </div>
<!-- font color -->

                        <div class="col-md-6">
                          <div class="size">
                            <div class="size_left">
                              <p> Font size : </p>
                             </div>
                           
                              <input type="hidden" name="sfontsize" value="" id="sfontsize" />
                              <input type="range" id="fontsize" name="fontsize" min="12" max="100"/>
                            <p style="margin-bottom:0;">&nbsp;</p>
                            <a translate=""  class="btn btn-primary pull-right add-text" href=""><span class="ng-scope">Add text</span></a> </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="settings">
                  <div class="panel panel-default ng-scope">
                    <div class="panel-body">
                       <div class="row">
                        <div class="col-md-12"> <strong translate=""><span class="ng-scope">Change color:</span></strong> </div>
                        <div class="col-md-12">
                          <div class="color-picker"> 
                            <?php 
                           // echo "<pre>";print_r($option_values); 
                            foreach($option_values as $color_row) {
                                $new_image =  str_replace(".","-50x50.",$color_row['image']);
                                echo "<a href='javascript:void(0)'><span>";
                                echo "<img class='img1' src='http://localhost/mycanvas/image/cache/".$new_image."' height='17' width='17' alt='".$color_row['option_value_id']."'>";
                                echo "</span></a>&nbsp;&nbsp;";

                            }
                            /*while($color_row = $color_result->fetch_assoc()) {
                                $new_image =  str_replace(".","-50x50.",$color_row['image']);
                                echo "<a href='javascript:void(0)'><span>";
                                echo "<img class='img1' src='http://localhost/mycanvas/image/cache/".$new_image."' height='17' width='17'>";
                                echo "</span></a>&nbsp;&nbsp;";
                             }*/
                             ?>
                            
                            
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        
                        <div class="col-xs-5 pull-right btn btn-primary button-cart1" style="width:85px" > <a href="javascript:void(0);" id="button-cart1" data-loading-text="Loading..." style="position:relative;right:12px"> Are you done? </a> </div>
                        <div class="col-xs-5 pull-right button-cart" style="display:none" > <a href="javascript:void(0);" id="button-cart" data-loading-text="Loading..."> <img src="catalog/view/theme/default/image/images/add_btn.jpg" alt="" align=""/> </a> </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>
<script type="text/javascript"><!--
$(document).ready(function(){
  $('#button-cart1').on('click', function() {
  $(".button").trigger("click");
  

});

$('#button-cart').on('click', function() {
   
  /* var hey = $('#frnt_img_val').val();*/
  var ss1  = $('#myForm input[type=\'hidden\']');
/*  alert(hey);*/
 
    $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#myForm input[type=\'hidden\']'),
    dataType: 'json',
    success: function(json) {
  
      if (json['success']) {
                      
                             window.location.replace("<?php echo $base; ?>index.php?route=customkurta/kurtaview");
                        }
    }
  });
     
});

});
//--></script>

</body>
</html>
