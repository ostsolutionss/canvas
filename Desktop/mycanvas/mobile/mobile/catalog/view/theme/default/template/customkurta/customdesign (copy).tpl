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
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script id="imageTemplate" type="text/x-jquery-tmpl"> 
    <div class="imageholder">
    <figure>
      <img src="${filePath}" alt="${fileName}"/>

    </figure>
  </div>
</script>
<script src="customdesign/mutiple_image/modernizr.custom.js"></script>
<!-- <script src="customdesign/mutiple_image/script1.js"></script> -->
<script>
//position fixed
$(document).ready(function() {
  var windowHeight = $(window).height()-$('#header').outerHeight(true)-$('#footer').outerHeight(true)-100;
  $('#wrapper').css('minHeight', windowHeight);
});
</script>
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
                         
?>
<style>
    body{
        /* font-family: 'Dancing Script', cursive; */
    }
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
  background: url("<?php echo $image;?> ") repeat scroll 0 0 / 100% 100% rgba(0, 0, 0, 0);;
  /*position: absolute;*/
  z-index: -9;
}
/*#shapecanvas {
  left: 1.9%;
  position: absolute;
  width: 276px;
  z-index: 99;
  border:1px solid;
}*/
/*#shapecanvas {
    height: 288px;
    left: 1.6%;
    position: absolute;
    top: 18px;
    width: 281px;
    z-index: 99;
}*/
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
#shapecanvas {

  left: 52% !important;

  top: 154px !important;

}
#shapecanvas1 {

  left: 52% !important;

  top: 154px !important;

}
.upper-canvas {

  
  left: 52% !important;

  top: 154px !important;

}
#image_capture {
  border: 1px solid;
  height: 465px;
  width: 410px;
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
</style>
<script>
$(document).ready(function() {
  
  /*****************************
    Variables
  *****************************/
  var imgWidth = 180,
    imgHeight = 180,
    zindex = 0;
    dropzone = $('#droparea'),
    uploadBtn = $('#uploadbtn'),
    defaultUploadBtn = $('#upload');
    

  /*****************************
    Events Handler
  *****************************/
  dropzone.on('dragover', function() {
    //add hover class when drag over
    dropzone.addClass('hover');
    return false;
  });
  dropzone.on('dragleave', function() {
    //remove hover class when drag out
    dropzone.removeClass('hover');
    return false;
  });
  dropzone.on('drop', function(e) {
    //prevent browser from open the file when drop off
    e.stopPropagation();
    e.preventDefault();
    dropzone.removeClass('hover');
    
    //retrieve uploaded files data
    var files = e.originalEvent.dataTransfer.files;
    processFiles(files);

    return false;
  });
    
  uploadBtn.on('click', function(e) {
    e.stopPropagation();
    e.preventDefault();
    //trigger default file upload button
    defaultUploadBtn.click();
  });
  defaultUploadBtn.on('change', function() {
    //retrieve selected uploaded files data
    var files = $(this)[0].files;
    processFiles(files);
    
    return false;
  });
  
  
  /***************************** 
    internal functions
  *****************************/  
  //Bytes to KiloBytes conversion
  function convertToKBytes(number) {
    return (number / 1024).toFixed(1);
  }
  
  function compareWidthHeight(width, height) {
    var diff = [];
    if(width > height) {
      diff[0] = width - height;
      diff[1] = 0;
    } else {
      diff[0] = 0;
      diff[1] = height - width;
    }
    return diff;
  }
  
  
  function dataURItoBlob(dataURI) {

    // convert base64 to raw binary data held in a string
    // doesn't handle URLEncoded DataURIs
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
      byteString = atob(dataURI.split(',')[1]);
    else
      byteString = unescape(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]

    // write the bytes of the string to an ArrayBuffer
    var ab = new ArrayBuffer(byteString.length);
    var ia = new Uint8Array(ab);
    for (var i = 0; i < byteString.length; i++) {
      ia[i] = byteString.charCodeAt(i);
    }

    //Passing an ArrayBuffer to the Blob constructor appears to be deprecated, 
    //so convert ArrayBuffer to DataView
    var dataView = new DataView(ab);
    var blob = new Blob([dataView], {type: mimeString});

    return blob;
  }
  
  /***************************** 
    canvas filter function
  *****************************/  
  //Black & White image effect 
  //by Marco Lisci - http://badsharkco.com/
  var grayscale = function(context) {
    var imgd = context.getImageData(0, 0, imgWidth, imgHeight);
    var pix = imgd.data;
    for (var i = 0, n = pix.length; i < n; i += 4) {
      var grayscale = pix[i  ] * .3 + pix[i+1] * .59 + pix[i+2] * .11;
      pix[i  ] = grayscale;
      pix[i+1] = grayscale;
      pix[i+2] = grayscale;
    }
    context.putImageData(imgd, 0, 0);
  }
  
  //canvas-blur effect 
  //by Matt Riggott - http://www.flother.com/     
  var blurry = function(context, image, diff) {
    var i, x, y,
      blureffect = 4;
    
    context.globalAlpha = 0.1;
    for (i = 1; i <= blureffect; i++) {
      for (y = -blureffect/2; y <= blureffect/2; y++) {
        for (x = -blureffect/2; x <= blureffect/2; x++) {
          context.drawImage(image, diff[0]/2, diff[1]/2, image.width-diff[0], image.height-diff[1], x, y, imgWidth, imgHeight);
        }
      }
    }
    context.globalAlpha = 1.0;
  }

  //sepia image effect
  //by http://www.script-tutorials.com/html5-image-effects-sepia/
  var sepia = function(context) {
    // set of sepia colors
    var r = [0, 0, 0, 1, 1, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 12, 12, 12, 12, 13, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 17, 18, 19, 19, 20, 21, 22, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 39, 40, 41, 42, 44, 45, 47, 48, 49, 52, 54, 55, 57, 59, 60, 62, 65, 67, 69, 70, 72, 74, 77, 79, 81, 83, 86, 88, 90, 92, 94, 97, 99, 101, 103, 107, 109, 111, 112, 116, 118, 120, 124, 126, 127, 129, 133, 135, 136, 140, 142, 143, 145, 149, 150, 152, 155, 157, 159, 162, 163, 165, 167, 170, 171, 173, 176, 177, 178, 180, 183, 184, 185, 188, 189, 190, 192, 194, 195, 196, 198, 200, 201, 202, 203, 204, 206, 207, 208, 209, 211, 212, 213, 214, 215, 216, 218, 219, 219, 220, 221, 222, 223, 224, 225, 226, 227, 227, 228, 229, 229, 230, 231, 232, 232, 233, 234, 234, 235, 236, 236, 237, 238, 238, 239, 239, 240, 241, 241, 242, 242, 243, 244, 244, 245, 245, 245, 246, 247, 247, 248, 248, 249, 249, 249, 250, 251, 251, 252, 252, 252, 253, 254, 254, 254, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255],
        g = [0, 0, 1, 2, 2, 3, 5, 5, 6, 7, 8, 8, 10, 11, 11, 12, 13, 15, 15, 16, 17, 18, 18, 19, 21, 22, 22, 23, 24, 26, 26, 27, 28, 29, 31, 31, 32, 33, 34, 35, 35, 37, 38, 39, 40, 41, 43, 44, 44, 45, 46, 47, 48, 50, 51, 52, 53, 54, 56, 57, 58, 59, 60, 61, 63, 64, 65, 66, 67, 68, 69, 71, 72, 73, 74, 75, 76, 77, 79, 80, 81, 83, 84, 85, 86, 88, 89, 90, 92, 93, 94, 95, 96, 97, 100, 101, 102, 103, 105, 106, 107, 108, 109, 111, 113, 114, 115, 117, 118, 119, 120, 122, 123, 124, 126, 127, 128, 129, 131, 132, 133, 135, 136, 137, 138, 140, 141, 142, 144, 145, 146, 148, 149, 150, 151, 153, 154, 155, 157, 158, 159, 160, 162, 163, 164, 166, 167, 168, 169, 171, 172, 173, 174, 175, 176, 177, 178, 179, 181, 182, 183, 184, 186, 186, 187, 188, 189, 190, 192, 193, 194, 195, 195, 196, 197, 199, 200, 201, 202, 202, 203, 204, 205, 206, 207, 208, 208, 209, 210, 211, 212, 213, 214, 214, 215, 216, 217, 218, 219, 219, 220, 221, 222, 223, 223, 224, 225, 226, 226, 227, 228, 228, 229, 230, 231, 232, 232, 232, 233, 234, 235, 235, 236, 236, 237, 238, 238, 239, 239, 240, 240, 241, 242, 242, 242, 243, 244, 245, 245, 246, 246, 247, 247, 248, 249, 249, 249, 250, 251, 251, 252, 252, 252, 253, 254, 255],
        b = [53, 53, 53, 54, 54, 54, 55, 55, 55, 56, 57, 57, 57, 58, 58, 58, 59, 59, 59, 60, 61, 61, 61, 62, 62, 63, 63, 63, 64, 65, 65, 65, 66, 66, 67, 67, 67, 68, 69, 69, 69, 70, 70, 71, 71, 72, 73, 73, 73, 74, 74, 75, 75, 76, 77, 77, 78, 78, 79, 79, 80, 81, 81, 82, 82, 83, 83, 84, 85, 85, 86, 86, 87, 87, 88, 89, 89, 90, 90, 91, 91, 93, 93, 94, 94, 95, 95, 96, 97, 98, 98, 99, 99, 100, 101, 102, 102, 103, 104, 105, 105, 106, 106, 107, 108, 109, 109, 110, 111, 111, 112, 113, 114, 114, 115, 116, 117, 117, 118, 119, 119, 121, 121, 122, 122, 123, 124, 125, 126, 126, 127, 128, 129, 129, 130, 131, 132, 132, 133, 134, 134, 135, 136, 137, 137, 138, 139, 140, 140, 141, 142, 142, 143, 144, 145, 145, 146, 146, 148, 148, 149, 149, 150, 151, 152, 152, 153, 153, 154, 155, 156, 156, 157, 157, 158, 159, 160, 160, 161, 161, 162, 162, 163, 164, 164, 165, 165, 166, 166, 167, 168, 168, 169, 169, 170, 170, 171, 172, 172, 173, 173, 174, 174, 175, 176, 176, 177, 177, 177, 178, 178, 179, 180, 180, 181, 181, 181, 182, 182, 183, 184, 184, 184, 185, 185, 186, 186, 186, 187, 188, 188, 188, 189, 189, 189, 190, 190, 191, 191, 192, 192, 193, 193, 193, 194, 194, 194, 195, 196, 196, 196, 197, 197, 197, 198, 199];

    // noise value
    var noise = 20;

    var imgd = context.getImageData(0, 0, imgWidth, imgHeight);
    var pix = imgd.data;
    for (var i=0; i < pix.length; i+=4) {
          // change image colors
          pix[i] = r[pix[i]];
          pix[i+1] = g[pix[i+1]];
          pix[i+2] = b[pix[i+2]];

          // apply noise
          if (noise > 0) {
              var noise = Math.round(noise - Math.random() * noise);

              for(var j=0; j<3; j++){
                  var iPN = noise + pix[i+j];
                  pix[i+j] = (iPN > 255) ? 255 : iPN;
              }
          }
      }

      // put image data back to context
      context.putImageData(imgd, 0, 0);
  }
  
  
  
  /***************************** 
    Process FileList 
  *****************************/  
  var processFiles = function(files) {
    if(files && typeof FileReader !== "undefined") {
      //process each files only if browser is supported
      for(var i=0; i<files.length; i++) {
        readFile(files[i]);
      }
    } else {
      
    }
  }
  
  
  /***************************** 
    Read the File Object
  *****************************/  
  var readFile = function(file) {
    if( (/image/i).test(file.type) ) {
      //define FileReader object
      var reader = new FileReader();
      
      //init reader onload event handlers
      reader.onload = function(e) { 
        var image = $('<img/>')
        .load(function() {
          //when image fully loaded
          var newimageurl = getCanvasImage(this);
          createPreview(file, newimageurl);
          uploadToServer(file, dataURItoBlob(newimageurl));
        })
        .attr('src', e.target.result);  
      };
      
      //begin reader read operation
      reader.readAsDataURL(file);
      
      $('#err').text('');
    } else {
      //some message for wrong file format
      $('#err').text('*Selected file format not supported!');
    }
  }
  
  
  /***************************** 
    Get New Canvas Image URL
  *****************************/  
  var getCanvasImage = function(image) {
    //get selected effect
    var effect = $('input[name=effect]:checked').val();
    var croping = $('input[name=croping]:checked').val();
  
    //define canvas
    var canvas = document.createElement('canvas');
    canvas.width = imgWidth;
    canvas.height = imgHeight;
    var ctx = canvas.getContext('2d');
    
    //default resize variable
    var diff = [0, 0];
    if(croping == 'crop') {
      //get resized width and height
      diff = compareWidthHeight(image.width, image.height);
    }
    
    //draw canvas image 
    ctx.drawImage(image, diff[0]/2, diff[1]/2, image.width-diff[0], image.height-diff[1], 0, 0, imgWidth, imgHeight);
          
    //apply effects if any          
    if(effect == 'grayscale') {
      grayscale(ctx);
    } else if(effect == 'blurry') {
      blurry(ctx, image, diff);
    } else if(effect == 'sepia') {
      sepia(ctx);
    } else {}
    
    //convert canvas to jpeg url
    return canvas.toDataURL("image/jpeg");
  }
  
  
  /***************************** 
    Draw Image Preview
  *****************************/  
  var createPreview = function(file, newURL) {  
    //populate jQuery Template binding object
    var imageObj = {};
    imageObj.filePath = newURL;

    //alert(imageObj.filePath);
    imageObj.fileName = file.name.substr(0, file.name.lastIndexOf('.')); //subtract file extension
    imageObj.fileOriSize = convertToKBytes(file.size);
    imageObj.fileUploadSize = convertToKBytes(dataURItoBlob(newURL).size); //convert new image URL to blob to get file.size
          
    //extend filename
    var effect = $('input[name=effect]:checked').val();     
    if(effect == 'grayscale') {
      imageObj.fileName += " (Grayscale)";
    } else if(effect == 'blurry') {
      imageObj.fileName += " (Blurry)";
    }       
          
    //append new image through jQuery Template
    var randvalue = Math.floor(Math.random()*31)-15; 
    //alert(imageObj); //random number
    var img = $("#imageTemplate").tmpl(imageObj).prependTo("#result")
    .hide()
    .css({
      'Transform': 'scale(1) rotate('+randvalue+'deg)',
      'msTransform': 'scale(1) rotate('+randvalue+'deg)',
      'MozTransform': 'scale(1) rotate('+randvalue+'deg)',
      'webkitTransform': 'scale(1) rotate('+randvalue+'deg)',
      'OTransform': 'scale(1) rotate('+randvalue+'deg)',
      'z-index': zindex++
    })
    .show();
    
    if(isNaN(imageObj.fileUploadSize)) {
      $('.imageholder span').last().hide();
    }
 
Uploadcanvs(imageObj.filePath);


  }
  var imgsrc = new Image();
  var aa = new Image();
  aa.src = "/mycanvas/customdesign/images/canvas2bg.png";
 function Uploadcanvs(img){
    // Your Fabric Canvas
   
    imgsrc.src=img;
    abc();
  }

 /* function abc()
  {

   // var hey = aa.toDataURL("image/jpeg");
    //var canvas = document.getElementById('imgupload');
    var canvas = new fabric.Canvas('shapecanvas1');
    var ctx = canvas.getContext("2d");
   // ctx.drawImage(aa, 0, 0);
    ctx.globalCompositeOperation="source-aover";
    ctx.globalAlpha=.85;
    //alert(imgsrc.src);
    ctx.drawImage(imgsrc,0,0);
  }*/
  
  /****************************
    Upload Image to Server
  ****************************/
  var uploadToServer = function(oldFile, newFile) {
    // prepare FormData
    var formData = new FormData();  
    //we still have to use back old file
    //since new file doesn't contains original file data
    formData.append('filename', oldFile.name);
    formData.append('filetype', oldFile.type);
    formData.append('file', newFile); 
          
    //submit formData using $.ajax      
    $.ajax({
      url: 'customdesign/mutiple_image/upload.php',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function(data) {
        console.log(data);
      }
    }); 
  }
  
  
  //file upload via original byte sequence
  var processFileInIE = function(file) {

    var imageObj = {};
    var extension = ['jpg', 'jpeg', 'gif', 'png'];
    var filepath = file.value;
    if (filepath) {
      //get file name
      var startIndex = (filepath.indexOf('\\') >= 0 ? filepath.lastIndexOf('\\') : filepath.lastIndexOf('/'));
      var filedetail = filepath.substring(startIndex);
      if (filedetail.indexOf('\\') === 0 || filedetail.indexOf('/') === 0) {
        filedetail = filedetail.substring(1);
      }
      var filename = filedetail.substr(0, filedetail.lastIndexOf('.'));
      var fileext = filedetail.slice(filedetail.lastIndexOf(".")+1).toLowerCase();

      //check file extension
      if($.inArray(fileext, extension) > -1) {
        //append using template
        $('#err').text('');
        imageObj.filepath = filepath;
        imageObj.filename = filename;
        var randvalue = Math.floor(Math.random()*31)-15;
        $("#imageTemplate").tmpl(imageObj).prependTo( "#result" )
        .hide()
        .css({
          'Transform': 'scale(1) rotate('+randvalue+'deg)',
          'msTransform': 'scale(1) rotate('+randvalue+'deg)',
          'MozTransform': 'scale(1) rotate('+randvalue+'deg)',
          'webkitTransform': 'scale(1) rotate('+randvalue+'deg)',
          'oTransform': 'scale(1) rotate('+randvalue+'deg)',
          'z-index': zindex++
        })
        .show();
        $('#result').find('figcaption span').hide();
      } else {
        $('#err').text('*Selected file format not supported!');
      }
    }
  }
  
  /****************************
    Browser compatible text
  ****************************/
  if (typeof FileReader === "undefined") {
    //$('.extra').hide();
    $('#err').html('Hey! Your browser does not support <strong>HTML5 File API</strong> <br/>Try using Chrome or Firefox to have it works!');
  } else if (!Modernizr.draganddrop) {
    $('#err').html('Ops! Look like your browser does not support <strong>Drag and Drop API</strong>! <br/>Still, you are able to use \'<em>Select Files</em>\' button to upload file =)');
  } else {
    $('#err').text('');
  }
});
</script>
<script>

$(function(){
    
    /*  ----------  CANVAS IMAGE AND CHANGE CANVAS IMAGE PATTERN  ----------   */
    var img1=new Image();
    var img=new Image();
    var uploadimg = new Image();
    img.onload=function(){

        img1.onload=function(){
            start();
        }
        img1.src="<?php echo $image;?>";
    }
    $('.img1').click(function(){  
        var img2= $(this).attr('src');  
        img.src=img2;
    });

    $('.button').click(function(){  
      $('#image_capture').html2canvas({
            onrendered: function (canvas) {
              alert(canvas.toDataURL("image/png"));
                $('#frnt_img_val').val(canvas.toDataURL("image/png"));
            }
        }); 
    });
    
    function start(){
      alert("cxcxc");
        var canvas=document.getElementById("canvas");
        var ctx=canvas.getContext("2d");
        ctx.drawImage(img1,0,0);
        ctx.globalCompositeOperation="source-atop";
        ctx.globalAlpha=.85;
        var pattern = ctx.createPattern(img, 'repeat');
        ctx.rect(0, 0, canvas.width, canvas.height);
        ctx.fillStyle = pattern;
        ctx.fill();
        ctx.globalAlpha=.15;
        var target = $('#image_capture');
        html2canvas(target, {
                onrendered: function(canvas) {
                var data = canvas.toDataURL();
                //alert(data);
                  $('#frnt_img_val').val(data);
            }
        });
        //alert(dataURL);
    }
// call to SecondMoves
   SecondMoves();
   // call to SecondMoves
    //SecondMovesimages();
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
        
        // Change the Background Color of the text. 
        $("#textbackground").change(function() {
        //  alert("textbackground");
          var bkcolor = $(".scolor").val();
          var bkcolor_hash= "#"+bkcolor;
            $("#hid_textbackground").val(bkcolor_hash);
          var obj = canvas.getActiveObject();
          if (!obj) return;
              obj.setTextBackgroundColor(bkcolor_hash);
              canvas.renderAll();
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
         
        // Change the text Line Height 
        
        $("#lineheight").click(function(){
            var fontlineheight = $("#lineheight").val();
            $("#slineheight").val(fontlineheight);
            //alert(fontControlsize);
            var obj = canvas.getActiveObject();
            if (!obj) return;
             obj.set({lineHeight: fontlineheight});
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
        
        // Change the Font Weight. 
       $("#fontweight").change(function(){
          var fontweights = $("#fontweight option:selected").val();
          $("#hid_fontweight").val(fontweights);
          // alert(fontweights);
          var obj = canvas.getActiveObject();
          if (!obj) return;
            obj.set({fontWeight: fontweights});
            canvas.renderAll();
       });
        
        // Change the Font Weight. 
       $("#text-dec").change(function(){
        var fonttextdec = $("#text-dec option:selected").val();
         $("#hid_text-dec").val(fonttextdec);
            // alert(fontControl);
         var obj = canvas.getActiveObject();
        if (!obj) return;
            obj.set({textDecoration: fonttextdec});
            canvas.renderAll();
        });
        
// Watches the keyup event handler in your textarea and updates the selected text node on canvas while you are typing. Creates a nice effect. 
// with whats being typed. 

 $('#filedset').on('keyup' , function(){

    var activeObject = canvas.getActiveObject();

     // We do a check to make sure there is an active canvas object, and see if it's text. 
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

/*$('#frontcanvascontainer').html2canvas({
            onrendered: function (canvas) {
                $('#frnt_img_val').val(canvas.toDataURL("image/png"));
            }
        }); */

});

// Function to add the text, just pass in a text string you want to add to the canvas. 
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
    // Center The New Text on the canvas or position it wherever
    canvas.centerObject(text);
/*var dataURL = canvas.toDataURL();
        $("#frnt_img_val").val(dataURL);
        alert(dataURL); */
        $('#image_capture').html2canvas({
            onrendered: function (canvas) {
              alert(canvas.toDataURL("image/png"));
                $('#frnt_img_val').val(canvas.toDataURL("image/png"));
                 alert(dataURL);
            }
        }); 
    
}

      
  }
  
</script>
</head>
<body>
<div class="button">Click me Plz</div>
  <form method="POST" enctype="multipart/form-data" action="" id="myForm">
             
                <input type="hidden" name="back_img_val" id="back_img_val" value="" />
                <input type="hidden" name="product_id" id="product_id" value="<?php echo $_GET['pro_id']; ?>" />
                <input id="input-quantity" class="form-control" type="hidden" size="2" value="1" name="quantity">
                <input type="hidden" name="pro_option" id="pro_option" value="43" />
                <input type="hidden" name="userid" id="userid" value="<?php echo $_GET['link']; ?>" />
                <input type="hidden" name="categoryid" id="categoryid" value="<?php echo $_GET['path']; ?>" />
                <input type="hidden" name="product_price" id="proprice" value="20" />
        </form>
<div class="middle">
  <div class="container">
    <div class="row">
      <div class="middle_div"  id="canvas-container">
        <p> <a href="#"> My cart <img src="images/arw_icon.png" alt=""/> </a> <br>
          <font> 1 item(s) - £0.00 </font> </p>
        <div class="col-md-5" >
          <div id="image_capture">
          <canvas id="canvas" height="467" width="400"> </canvas>
            <!-- <div class="shirt_icon"> <a href="#"> <img src="images/plus_icon.jpg" alt=""/> </a> <a href="#"> <img src="images/mines_icon.jpg" alt=""/> </a> </div> -->
            <div id="bd-wrapper">
                 <canvas id="shapecanvas" height="278" width="233" > </canvas>
                  <!-- <canvas id="shapecanvas1" height="278" width="233" style="left: 103px; top: 154px;"> </canvas> -->
            </div>
          </div> 
             <input type="hidden" name="frnt_img_val" id="frnt_img_val" value="" /> 
          </div>
           <div class="slide">
            <!-- <ul>
              <li><a href="#"> <img src="images/tshirt_slide.jpg" alt=""/> </a></li>
              <li><a href="#"> <img src="images/tshirt_slide2.jpg" alt=""/> </a></li>
              <li><a href="#"> <img src="images/tshirt_slide3.jpg" alt=""/> </a></li>
              <li><a href="#"> <img src="images/tshirt_slide4.jpg" alt=""/> </a></li>
            </ul> -->
          </div> 
        </div>
         <div class="col-md-7">
          <div class="tab_info">
            <div role="tabpanel"> 
              
              <!-- Nav tabs -->
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class=""><a href="#home" aria-controls="home" role="tab" data-toggle="tab"> <i class="fa fa-scissors"></i> <br>
                  <translate><span class="ng-scope"> Switch product </span></translate>
                  </a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"> <i class="fa fa-camera"></i> <br>
                  <translate><span class="ng-scope"> Add image </span></translate>
                  </a></li>
                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"> <i class="fa fa-font"></i> <br>
                  <translate><span class="ng-scope"> Add text </span></translate>
                  </a></li>
                <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"> <i class="fa fa-shopping-cart"></i> <br>
                  <translate><span class="ng-scope"> Buy now </span></translate>
                  </a></li>
              </ul>
              
              <!-- Tab panes -->
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                  <div class="panel panel-default ng-scope">
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-xs-4 text-center"> <br>
                          <a class="text-center" href=""> <img src="images/image.php.png" alt=""/> </a> </div>
                        <div class="col-xs-8 breadcrumb_top">
                          <ol class="breadcrumb">
                            <li><a href="#" class="ng-binding">T-Shirts</a></li>
                            <li class="active ng-binding">Men’s Premium T-Shirt</li>
                          </ol>
                          <h4 class="ng-binding">Men’s Premium T-Shirt</h4>
                          <a ui-sref="app.product.browser" class="btn btn-default btn-block" href="#/product/browser"><i class="fa fa-angle-double-right"></i> Change product</a> <br>
                          <span>
                          <translate><span class="ng-scope">from</span></translate>
                          <strong class="ng-binding">£12.90</strong><span class="normal">/each</span></span> </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-md-12"> <strong translate=""><span class="ng-scope">Change color:</span></strong> </div>
                        <div class="col-md-12">
                          <div class="color-picker"> 
                            
                            <!-- ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(255, 255, 255);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(0, 0, 0);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(194, 3, 41);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(48, 52, 66);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(70, 60, 38);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(30, 150, 88);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(246, 188, 26);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(203, 203, 203);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(69, 74, 134);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(100, 49, 112);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --><a ng-click="setSelectedVariant(variant)" class="color-selector ng-scope" ng-repeat="variant in currentItem.product.variants" ng-class="{active: currentItem.variant == variant}" href=""> 
                            <!-- ngRepeat: (key, hex) in variant.colors --><span ng-style="{ 'background' :hex, 'margin-left' : key*8 }" style="display: block; width: 16px; height: 16px; margin-left: 0px; float: left; background: none repeat scroll 0% 0% rgb(250, 104, 7);" ng-repeat="(key, hex) in variant.colors" class="ng-scope"></span><!-- end ngRepeat: (key, hex) in variant.colors --> 
                            </a><!-- end ngRepeat: variant in currentItem.product.variants --> 
                            
                          </div>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-md-12"> <strong translate=""><span class="ng-scope">Description:</span></strong> </div>
                        <div ng-bind-html="currentItem.product.description" class="col-md-12 ng-binding">
                          <p>Fruit of the Loom Super Premium T-Shirt</p>
                          <ul>
                            <li>Guaranteed to perform at 60°C wash</li>
                            <li>Crew neck with cotton/Lycra&reg; rib</li>
                            <li>Self-fabric shoulder to shoulder taping</li>
                            <li>Produced using Belcoro&reg; yarn for a cleaner, more stable print area</li>
                            <li>Fine knit gauge for enhanced printability</li>
                          </ul>
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
                        <div role="tabpanel" class="tab-pane active" id="tab-1">
                          <div class="graphic">
                            <p> Select a graphic
                              <select class="styled" name="c">
                                <option value="1">Animals</option>
                                <option value="2">Animals 2</option>
                                <option value="2">Animals 3</option>
                                <option value="2">Animals 4</option>
                              </select>
                            </p>
                            <ul>
                              <li>
                                <div class="one"> <a href="#"> <img src="images/grup_img.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img2.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img3.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img4.jpg" alt=""/> </a> </div>
                              </li>
                              <li>
                                <div class="one"> <a href="#"> <img src="images/grup_img.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img2.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img3.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img4.jpg" alt=""/> </a> </div>
                              </li>
                              <li>
                                <div class="one"> <a href="#"> <img src="images/grup_img.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img2.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img3.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img4.jpg" alt=""/> </a> </div>
                              </li>
                              <li>
                                <div class="one"> <a href="#"> <img src="images/grup_img.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img2.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img3.jpg" alt=""/> </a> </div>
                                <div class="one"> <a href="#"> <img src="images/grup_img4.jpg" alt=""/> </a> </div>
                              </li>
                            </ul>
                          </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab-2">
                          <!-- <div id="droparea">
                                    <div class="dropareainner">
                                      <p class="dropfiletext">Drop files here</p>
                                      <p>or</p>
                                      <p><input id="uploadbtn" class="uploadbtn" type="button" value="Select Files"/></p>
                                      
                                      <p id="err">Wait there! You must ENABLE Javascript to have this works!</p>
                                    </div>
                                    <input id="upload" type="file" multiple />
                                  </div> -->

                                  <div id="result">
                                    
                                  </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab-3">
                          <div class="drop">
                            <h4> You have no uploads. </h4>
                            <h3> <i class="fa fa-plus-circle"></i> </h3>
                            <h2> <a href="#"> Click here </a> to upload a new image </h2>
                          </div>
                        </div>
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
                          
                          <!-- Split button -->
                          <div class="btn-group"> 
                            <!--<button style="background: #fff; width: 87%; height: 36px;" class="btn btn-default" type="button"> <img src="images/Alpha-Echo.png" alt=""/> 
    </button>-->
                            <input type="hidden" name="hid_textfont" value="" id="sfont" />
                <select id="textfont" name="textfont">
                   <option value="arial">Arial</option>
                   <option value="'Dancing Script', cursive">script monogram</option>
                   <option value="'Open Sans Condensed', sans-serif">Halvetica</option>
                   <option value="Times New Roman">Times</option>
                </select>
                            <!--<button ng-click="showFontSelector()" data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"> <span class="caret"></span> <span translate="" class="sr-only"><span class="ng-scope">Toggle Dropdown</span></span> </button>--> 
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
                             <!--  <span aria-disabled="false" class="ui-spinner ui-widget ui-widget-content ui-corner-all">
                              <input role="spinbutton" autocomplete="off" aria-valuenow="0" aria-valuemin="0" ui-spinner="{min: 0, mouseWheel:false}" ng-model="currentItem.quantities[size]" ng-change="reCalculatePrice()" class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input">
                              <a tabindex="-1" class="ui-spinner-button ui-spinner-up ui-corner-tr"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a tabindex="-1" class="ui-spinner-button ui-spinner-down ui-corner-br"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span>  --></div>
                            <!-- <div class="size_right"> <font> Color : </font>
                              <select class="styled" name="b">
                                <option value="1"> 1 </option>
                                <option value="1"> 2 </option>
                                <option value="1"> 3 </option>
                                <option value="1"> 4 </option>
                                <option value="1"> 5 </option>
                              </select>
                            </div> -->
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
                      <div class="row"> <br>
                        <div class="col-xs-4 text-center"> <a class="text-center"> <img src="images/image.php.png" alt=""/> </a> </div>
                        <div class="col-xs-8 breadcrumb_top">
                          <ol class="breadcrumb">
                            <li><a class="ng-binding">T-Shirts</a></li>
                            <li class="active ng-binding">Men’s Premium T-Shirt</li>
                          </ol>
                          <h4 class="ng-binding">Men’s Premium T-Shirt</h4>
                          <h6 class="capitalize ng-binding">white</h6>
                          <p class="ng-binding">Screen print: </p>
                          <span><strong class="ng-binding">£12.90</strong><span class="normal"> per item</span></span> </div>
                      </div>
                      <br>
                      <div class="text-center"> 
                        <!-- ngRepeat: size in currentItem.product.sizes -->
                        <div ng-repeat="size in currentItem.product.sizes" class="col-xs-2 sizes_width">
                          <h5 class="ng-binding">S</h5>
                          <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                          <input class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input" ng-change="reCalculatePrice()" ng-model="currentItem.quantities[size]" ui-spinner="{min: 0, mouseWheel:false}" aria-valuemin="0" aria-valuenow="0" autocomplete="off" role="spinbutton">
                          <a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span> </div>
                        <!-- end ngRepeat: size in currentItem.product.sizes -->
                        <div ng-repeat="size in currentItem.product.sizes" class="col-xs-2 sizes_width">
                          <h5 class="ng-binding">M</h5>
                          <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                          <input class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input" ng-change="reCalculatePrice()" ng-model="currentItem.quantities[size]" ui-spinner="{min: 0, mouseWheel:false}" aria-valuemin="0" aria-valuenow="0" autocomplete="off" role="spinbutton">
                          <a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span> </div>
                        <!-- end ngRepeat: size in currentItem.product.sizes -->
                        <div ng-repeat="size in currentItem.product.sizes" class="col-xs-2 sizes_width">
                          <h5 class="ng-binding">L</h5>
                          <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                          <input class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input" ng-change="reCalculatePrice()" ng-model="currentItem.quantities[size]" ui-spinner="{min: 0, mouseWheel:false}" aria-valuemin="0" aria-valuenow="0" autocomplete="off" role="spinbutton">
                          <a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span> </div>
                        <!-- end ngRepeat: size in currentItem.product.sizes -->
                        <div ng-repeat="size in currentItem.product.sizes" class="col-xs-2 sizes_width">
                          <h5 class="ng-binding">XL</h5>
                          <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                          <input class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input" ng-change="reCalculatePrice()" ng-model="currentItem.quantities[size]" ui-spinner="{min: 0, mouseWheel:false}" aria-valuemin="0" aria-valuenow="0" autocomplete="off" role="spinbutton">
                          <a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span> </div>
                        <!-- end ngRepeat: size in currentItem.product.sizes -->
                        <div ng-repeat="size in currentItem.product.sizes" class="col-xs-2 sizes_width">
                          <h5 class="ng-binding">XXL</h5>
                          <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                          <input class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input" ng-change="reCalculatePrice()" ng-model="currentItem.quantities[size]" ui-spinner="{min: 0, mouseWheel:false}" aria-valuemin="0" aria-valuenow="0" autocomplete="off" role="spinbutton">
                          <a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span> </div>
                        <!-- end ngRepeat: size in currentItem.product.sizes -->
                        <div ng-repeat="size in currentItem.product.sizes" class="col-xs-2 sizes_width">
                          <h5 class="ng-binding">3XL</h5>
                          <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                          <input class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input" ng-change="reCalculatePrice()" ng-model="currentItem.quantities[size]" ui-spinner="{min: 0, mouseWheel:false}" aria-valuemin="0" aria-valuenow="0" autocomplete="off" role="spinbutton">
                          <a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span> </div>
                        <!-- end ngRepeat: size in currentItem.product.sizes -->
                        <div ng-repeat="size in currentItem.product.sizes" class="col-xs-2 sizes_width">
                          <h5 class="ng-binding">4XL</h5>
                          <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                          <input class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input" ng-change="reCalculatePrice()" ng-model="currentItem.quantities[size]" ui-spinner="{min: 0, mouseWheel:false}" aria-valuemin="0" aria-valuenow="0" autocomplete="off" role="spinbutton">
                          <a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span> </div>
                        <!-- end ngRepeat: size in currentItem.product.sizes -->
                        <div ng-repeat="size in currentItem.product.sizes" class="col-xs-2 sizes_width">
                          <h5 class="ng-binding">5XL</h5>
                          <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                          <input class="ng-spinner text-center ng-pristine ng-untouched ng-valid ui-spinner-input" ng-change="reCalculatePrice()" ng-model="currentItem.quantities[size]" ui-spinner="{min: 0, mouseWheel:false}" aria-valuemin="0" aria-valuenow="0" autocomplete="off" role="spinbutton">
                          <a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-n"></span></a><a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span class="ui-icon ui-icon-triangle-1-s"></span></a></span> </div>
                        <!-- end ngRepeat: size in currentItem.product.sizes --> 
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-xs-5 pull-right text-center total">
                          <div class="total_txt"> <strong translate=""><span class="ng-scope">Total price:</span></strong> <strong style="margin-left: 15px;font-size: 24px; margin-bottom: 10px;" class="ng-binding">£0.00</strong> </div>
                        </div>
                      </div>
                      <br>
                      <div class="row">
                        <div class="col-xs-5 pull-right"> <a href="javascript:void(0);" id="button-cart" data-loading-text="Loading..."> <img src="catalog/view/theme/default/image/images/add_btn.jpg" alt="" align=""/> </a> </div>
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
$('#button-cart').on('click', function() {
  var ss1  = $('#myForm input[type=\'hidden\']');
  alert(ss1);
  alert("hey");
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
