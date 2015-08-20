<?php echo $header; ?>

        <!--       ________________        style Files      _________________     -->

        <link href="catalog/view/theme/default/stylesheet/customkurtacss/jquery.css" rel="stylesheet" type="text/css"> 
        <link href="catalog/view/theme/default/stylesheet/customkurtacss/MaYaDroupDown.css" rel="stylesheet" type="text/css">
        <link href="catalog/view/theme/default/stylesheet/customkurtacss/MayaPopup.css" rel="stylesheet" type="text/css">
        <link href="catalog/view/theme/default/stylesheet/customkurtacss/main.css" rel="stylesheet" type="text/css"> 
        <link href="catalog/view/theme/default/stylesheet/customkurtacss/style.css" rel="stylesheet" type="text/css">
        <link href="catalog/view/theme/default/stylesheet/customkurtacss/PRO-DESIGN.css" rel="stylesheet" type="text/css">

        <!--    ___________________         Script FIles    ___________________  -->
        
        
        <script type="text/javascript" src="catalog/view/theme/default/js/customkurtajs/jquery-1.js"></script> 
        <script type="text/javascript" src="catalog/view/theme/default/js/customkurtajs/VARABLE.js"></script> 
        <script type="text/javascript" src="catalog/view/theme/default/js/customkurtajs/JS-01.js"></script>
        
        
        <!-- __________________________ Capture Finial Product Script ___________ -->
      
        <script type="text/javascript" src="catalog/view/theme/default/js/customkurtajs/js/html2canvas.js"></script>
        <script type="text/javascript" src="catalog/view/theme/default/js/customkurtajs/js/jquery.plugin.html2canvas.js"></script>
        
         <!-- __________________________ Carousel slider Script ___________ -->
         
         <script src="catalog/view/theme/default/js/bxslider/jquery.bxslider.js"></script>
         <link href="catalog/view/theme/default/stylesheet/bxslider/jquery.bxslider.css" rel="stylesheet" />
         
         
        
        
        
<script>

    $(document).ready(function () {
    
        $("#subMenu-style").addClass( "transition05s subMenu-active" );
    
   
    
        /*   Script ot load all the fabric colors for fabric menu    */
         var fabric= 'fabric';
         $.post('style-ajax.php', {style:fabric}, 	
		function(fabdata)
		{	
                  $("#menuS-faric .menuS-slide ul").html(fabdata);
                  
                  $('.fab-menuS-list').bxSlider({   slideWidth: 200, 
                minSlides: 10,
                maxSlides: 10,
                slideMargin: 10  });
                  
		}); 
                
                
               /*   Script ot load all the fabric colors for fabric menu    */
    
    
                
    
    
        $("#fabric").click(function(){
         $("#subMenu-style").addClass( "transition05s subMenu-active" );
            $("#menuS-faric").show();
            $("#menuS-style").hide();
           
            $("#recent_fabric").val("white");
            $("#pro_color").val("white");
            
            $("#design-3D-front img").attr("src","catalog/view/theme/default/images/customslider/images/white/shirt/white.png");
        });
        
    });



function imageshow(color)
{
    $("#design-3D-front img").attr("src","catalog/view/theme/default/images/customslider/images/"+color+"/shirt/"+color+".png");
     $("#recent_fabric").val(color);
      $("#pro_color").val(color);
}

function stylechoose(style)
{

    $("#menuS-faric").hide();
    $("#menuS-style").show();
    
    $("#merge_images").show();
    var fab_color = $("#recent_fabric").val();

 if(style == 'style')
     {
 $("#design-3D-front img").attr("src","catalog/view/theme/default/images/customslider/images/"+fab_color+"/shirt/"+fab_color+"_body.png");
 
 style='sleeve';
 
     }
     else
         {
             
         }
 
 
 $.post('style-ajax.php', {style:style,color:fab_color}, 	
		function(data)
		{	
                  // alert(data);
                   $("#stylename").html(style);
                   $("#menuS-style .menuS-slide ul").html(data);
                   
                  
		});
}

function selectmainimg(smainimg,style,num)
{
     var fab_color = $("#recent_fabric").val();
    
     var totalfiles = $("#total_filescount").val();
    if(num == 0)
        {
         $("#design-3D-front").append("<img src='catalog/view/theme/default/images/customslider/images/"+fab_color+"/"+style+"/"+smainimg+"' />");
        }
    else
        {
            $("#design-3D-front").html("<img src='catalog/view/theme/default/images/customslider/images/"+fab_color+"/"+style+"/"+smainimg+"' />");
        }
}

    
    
</script>
<style>
    #mainContainer .mainContainer-Layout #mainContainer-Img3D img {
  border: 0 none;
  left: 0;
  margin: 0;
  position: absolute;
  right: 0;
  top: 0; padding: 15px; border: 1px solid #ccc;
}
#mainContainer .mainContainer-Layout #mainContainer-Img3D
 {
  display: block;
  margin-top: 30px;
  max-width: 400px;
  min-height: 460px;
  position: relative;
 
}
#menu {
  /*background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
  border-color: #2a2a2a; 
  margin-top: 28px;*/
  min-height: 40px; height:auto !important;
}
#menu #menuMain {
  background: none repeat scroll 0 0 rgba(5, 49, 71, 0.3);
  font-size: 84%;
  height: 220px;
  letter-spacing: 0.2px;
  max-width: 155px;
  text-transform: uppercase;
}
#menu #subMenu {
  font-size: 90%;
  height: 260px;
  overflow: hidden;
  position: relative;
  text-transform: capitalize;
  white-space: nowrap;
  width: 49%;
}
#menu #subMenu #subMenu-style {
  top: 38px;
}
.menuS-list img {
  border: 1px solid #ccc;
  box-shadow: 0 0 2px 0 #ccc;
  margin-top: 15px !important;
}
.custom_slider {
  width: 86%;
}
    </style>
    

        <div class="container custom_slider" >
            <form method="POST" enctype="multipart/form-data" action="finial_img.php" id="myForm">
                <input type="hidden" name="img_val" id="img_val" value="" />
                <input type="hidden" name="product_id" id="product_id" value="<?php echo $_GET['pro_id']; ?>" />
                <input type="hidden" name="pro_color" id="pro_color" value="white" />
                <input type="hidden" name="userid" id="userid" value="<?php echo $_GET['link']; ?>" />
                <input type="hidden" name="categoryid" id="categoryid" value="<?php echo $_GET['path']; ?>" />
            </form>
          
                       <div style="height: 865px; transform: translateX(0px); background: none repeat scroll 0 0 rgba(0, 0, 0, 0);border-color: #2a2a2a; margin-top: 28px; color: #fff;" id="menu"  class="custommainmenu clear floatL w30 ofh transition1s">
                <div id="menuMain" class="floatL">
                    <br />
                    <ul>
                        <li class="active" id="menu-fabric" style="margin-top: 4px">
                            <span>1. </span><span data-lang="fabric" id="fabric">Fabric</span>
                        </li>
                        <li id="menu-style" onclick="stylechoose('style');" ><span>2. </span><span data-lang="style" id="style" >Style</span></li>
                   
                    </ul>
               </div>
                           <ul id="subMenu" class="floatL">
    
    <li>
        <ul id="subMenu-style" class="transition05s">
            <li id="subMenu-list-sleeve" class="transition05s"  onclick="stylechoose('sleeve');"><span data-run="number">2.1</span><span data-lang="sleeve" id="sleeve">Sleeve</span></li>
            <li id="subMenu-list-botton" class="transition05s" onclick="stylechoose('button');"><span data-run="number">2.2</span><span data-lang="botton" id="botton" >button</span></li>
            <li id="subMenu-list-collar" class="transition05s" onclick="stylechoose('collar');"><span data-run="number">2.3</span><span data-lang="collar" id="collar" >Collar</span></li>
            <li id="subMenu-list-cuff" class="transition05s" onclick="stylechoose('cuffs');"><span data-run="number">2.4</span><span data-lang="cuffs" id="cuffs" >Cuffs</span></li>
            <li id="subMenu-list-pocket" class="transition05s" onclick="stylechoose('pockets');"><span data-run="number">2.5</span><span data-lang="pockets" id="pockets" >Pockets</span></li>
        </ul>
    </li>
    
    
</ul>

<button id="btnCloseProDesignMain" style="display: none">buttn close Pro design</button>            </div>
            <div style="transition: all 0s ease 0s;" id="mainContainer" class="floatL w70">
                <div id="tag-design" class="mainContainer-Layout" style="display: block;">
                   
                    <div style="transform: translateX(0px);" id="mainContainer-Img3D" class="floatL w50 transition1s">
                        
                        <ul>
                            <li id="design-3D-front" class="design-3D-view-tab" style="display: block;"><!-- IMG FRONT -->
                                <img style="" src="catalog/view/theme/default/images/customslider/images/white/shirt/white.png"></li>
                            <li style="display: none;" id="design-3D-back" class="design-3D-view-tab"><!-- IMG BACK -->
                               <!-- <img style="" src="">-->
                            </li>
                        </ul>
                    </div>
                   
                    <div style="transform: translateX(0px);" id="mainContainer-MenuS" class="clear w100 transition1s">
                        <ul id="menuS-Layout" class="transition1s">
    <li style="display: list-item;" id="menuS-faric" class="menuS-tab">
        <div class="menuS-title"><arrow class="arrow"></arrow><span data-lang="choose-your-fabric">Choose your Fabric</span> : 
            <span style="display: inline;" class="page-of"> </span></div>
        <div class="menuS-slide">
            <ul class="menuS-list fab-menuS-list" >
                <!-- FABRIC LIST ITEM -->
               </ul>
             <input type="hidden" name="selected_fabric" id="recent_fabric" value="white" />
        </div>
    </li>
    <li style="display: none;" id="menuS-style" class="menuS-tab">
        <div class="menuS-title"><arrow class="arrow"></arrow><span data-lang="">Choose your Style</span> : <span id="stylename"></span>
            <span style="display: inline;" class="page-of"> </span></div>
        <div class="menuS-slide">
            <ul style="transform: translateX(0px); transition: all 0.5s ease 0s;" class="menuS-list " data-main="style"><!-- LIST ITEM STYLE --></ul>
        </div>
    </li>
 
   
   
</ul>                    </div>
                </div>
                <input type="button" name="mergeimages" id="merge_images" value="Proceed Next" onclick="capture();" style="display: none;" />
            </div>
      
        </div>
     <!-- _________________________ BXSLIDER _______________________________ -->
         
    
    <!--  _______________ SCRIPT FOR FINIAL PRODUCT IMAGE CAPTURE __________________________   -->
        <script type="text/javascript">
	function capture() {
		$('#design-3D-front').html2canvas({
			onrendered: function (canvas) {
                //Set hidden field's value to image data (base-64 string)
				$('#img_val').val(canvas.toDataURL("image/png"));
                //Submit the form manually
				document.getElementById("myForm").submit();
			}
		});
	}
        </script>
       
        
    <!--  _______________ SCRIPT FOR FINIAL PRODUCT IMAGE CAPTURE ENDS HERE __________________________   -->

        <script src="catalog/view/theme/default/js/customkurtajs/MayaPopup.js" type="text/javascript"></script>
        
         
   
            
        
<?php echo $footer; ?>
