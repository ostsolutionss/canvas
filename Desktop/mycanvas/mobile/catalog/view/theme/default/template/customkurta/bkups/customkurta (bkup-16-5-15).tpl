<?php //echo $header; ?>

    <!-- __________________________ SCRIPT TO SUPPORT HTML5 IN IE OLDER VERSIONS __________________________ -->

        <!--[if IE]><script type="text/javascript" src="catalog/view/theme/default/js/ielib/excanvas.js"></script><![endif]-->

    <!-- __________________________ SCRIPT TO SUPPORT HTML5 IN IE OLDER VERSIONS __________________________ -->
     <!--       ________________        style Files      _________________     -->
        
        <link href="catalog/view/theme/default/stylesheet/customkurtacss/newstyle.css" rel="stylesheet" type="text/css" media="all">
        
        <!--    ________________________  HTML5CANVAS SCRIPT & STYLE ________________________  -->
        
        <script src="http://code.jquery.com/jquery.min.js"></script>
        
<style>
.ui {
  border: 1px solid;
  bottom: 0;
  display: flex;
  flex-direction: column-reverse;
  height: 100%;
  left: 0;
  max-height: 100%;
  min-width: 650px;
  position: absolute;
  right: 0;
  top: 0;
  width: 45%;
  z-index: 15;
}
.viewport-fluid {
  background-color: #fff;
  border: 1px solid red;
  bottom: 0;
  left: 28%;
  margin: 0 auto;
  max-height: 567px;
  max-width: 439px;
  overflow: hidden;
  position: absolute;
  right: 0;
  top: 0;
  z-index: 5;
}

/*   CSS FOR FABRIC SECTION       */

.fabimgs .img1 {
  border: 1px solid #ccc;
  cursor: pointer;
  height: 50px;
  width: 50px;
}
.fabimgs {
  width: 100%;
  margin-left : 8px;
}

/*   CSS FOR FABRIC SECTION ENDS HERE      */

#frontcanvas
{
    position: absolute;
}
.rgt
{
    
    text-align: center;
}
.text
{
    cursor: pointer;
    display: inline-block;
    padding: 5px;
}
.imgdiv {
  float: left;
  width: 100%;
}
.img1 {
  cursor: pointer;
  height: 50px;
  width: 50px;
}
.front 
{
  float: left;
  width: 100%;
}
.btnstyle 
{
  background: none repeat scroll 0 0 #efefef;
  border: 1px solid #e2e2e2;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 4px;
  padding: 5px 11px;
  text-align: center;
  text-shadow: 1px 1px #ccc;
  box-shadow: 1px 1px #ccc;
}
.frontdiv 
{
  float: left;
  height: auto;
  margin: 12px 7px 0 18px;
  width: 70px;
}   
.frontdiv img 
{
  cursor: pointer;
  height: 50px;
  width: 50px;
  vertical-align: middle;
  border: 1px solid #ccc;
}
#shirtareas, #shirtnstyle, #shirtsstyle {
  margin-top: 23px;
}
#front_designs {
  margin-top: 12px;
}
.areatitles {
  width: 415px;
  height: 33px;
}
.front_container {
  margin-left: 17px;
}



/*  -----------------  NECK STYLING STARTS HERE ---------------------     */

.neck_container{
  margin-left: 17px;
}

.neckdiv {
  float: left;
  height: auto;
  margin: 12px 7px 0 0;
  width: 83px;
}
.colorblock
{
    border: 1px solid #ccc;
    height: 40px;
    padding: 5px;
    width: 40px;
}
.necktitles {
  margin-top: 13px;
  width: 383px;
}
.neck-sec {
  width: 50px;
  cursor: pointer;
}
.neckdiv p
{
    cursor:pointer;
}

/*  -----------------  NECK STYLING ENDS HERE ---------------------     */

/*  -----------------  SLEEVES STYLING STARTS HERE ---------------------     */

.sleevesdiv {
  float: left;
  height: auto;
  margin: 16px 7px 0 0;
  width: 67px;
}
.sleeves-sec
{
    width: 50px;
    cursor: pointer;
}
.sleevesdiv p
{
    cursor:pointer;
}
.sleevestitles {
  margin-top: 13px;
  width: 481px;
  margin-left: 12px;
}
.sleeves_container
{
    margin-left: 11px;
}
.sleevessections.btnstyle 
{
  font-size: 12px;
}
/*  -----------------  SLEEVES STYLING ENDS HERE ---------------------     */
</style>

<script> 
$(function(){

      /*   ---------------- CHANGE SHIRT PATTERN STARTS -------------       */
      
    var img1 = new Image();                 // Main Kurta image
    var img  = new Image();                 // Kurta fabric pattern
    var img2 = new Image();                 // Kurta Emb Image
    var img3 = new Image();                 // Kurta Digital Design image
    var img4 = new Image();                 // Kurta Block Print Image
    var neckimg = new Image();              // Neck Image
    var btnimg = new Image();               // Neck Buttons image     
    var canvas2bg = new Image();            // Sleeves Canvas2 background image
    var sleevlngth = new Image();           // Sleeves Length Image
    var slevfab = new Image();              // Sleeves Fabric image 
    var slevembimg = new Image();           // Sleeves Emb image
    var slevbtn = new Image();
    
    
    var slevearea;                          // Gloabal variable for Sleeve border/pipping
    var sbcolor;                            // Global Variable for Sleeves border color
    var spcolor;                            // Global Variable for Sleeves Pipping color
    
   img1.onload=function()
            {
                start();
            }                               // For main image
             img1.src="http://localhost/opencart/opencart/catalog/view/theme/default/image/23151.png";
             
   $('.img1').click(function()                  // For kurta pattern image
    {  
        var area  = $("#sarea").val();
        var areapattrn= $("#areapattrn").val();
        
        var dynmcimg2= $(this).attr('src');  
        $("#selectedpattern").val(dynmcimg2);
        img.src=dynmcimg2; 
         
        start(area,areapattrn);
    });
    
   $(".sel-area").click(function()              // For front area selection
   {     
        var area = $(this).attr('alt');
        $("#sarea").val(area);
        var areapattrn= $("#areapattrn").val();
        var faid = $(this).attr("id");
        $(".areatitles").attr('id', faid+'ID');
        $("#"+faid+'ID').show('slow');
        $("#iddd").val(faid);
        
        start(area,areapattrn);
   });          
    
   $(".digitalimg").click(function()           // For digital Designs
   {              
        var digi_img = $(this).attr('src');
        img3.src=digi_img;
        $("#areapattrn").val('digi');
        var area = $("#sarea").val();
        start(area,'digi');
        
   });
   $(".embimg").click(function()               // For Front Emb. design
   {                   
        var emb_img = $(this).attr('src');
        img2.src=emb_img;
        $("#areapattrn").val('emb');
        var area = $("#sarea").val();
        start(area,'emb');
   });
   $(".block").click(function()                // For Front Bock Print Designs
   {
        var emb_img = $(this).attr('src');
        img4.src=emb_img;
        $("#areapattrn").val('block');
        var area = $("#sarea").val();
        start(area,'block');
   });
   
   /*  -----------------    NECK  -------------------     */
   
   $(".neck-sec").click(function()             // For Neck Design Images
   {
        $(".necktitles").show('slow');
        var type = $("#areapattrn").val();
        var area = $("#sarea").val();
        
        var neckstyle = $(this).attr('src');
        neckimg.src=neckstyle; 
        $("#neckstyle").val(neckstyle);
        
        start(area,type);
        
    });
   
    $('.nbtns').click(function()               // For Neck Buttons 
    {  
       
        var dynmcbtn= $(this).attr('src');  
        btnimg.src=dynmcbtn; 
        var type = $("#areapattrn").val();
        var area = $("#sarea").val();
        start(area,type);
       
    });
    
    /* ------ SLEEVES ----------- */
   
    $("#sleeves_length").click(function()       // For Sleeve canvas2 background image
    {
        $("#shirtsstyle").show('slow');
        canvas2bg.src = "http://localhost/opencart/opencart/catalog/view/theme/default/image/canvas2bg.png";
        slevearea= $("#scolorarea").val();
        sbcolor= $("#sbcolour").val();
        spcolor = $("#slepipecolor").val();
        newsleve(slevearea,sbcolor,spcolor);
    });
    
    
    $(".sleeves-sec").click(function()         // For Sleeve Images     
    {
        $(".sleevestitles").show('slow');
        
        var sleeve_length = $(this).attr('src');
        sleevlngth.src=sleeve_length; 
        
        slevfabric = $("#slevfab").val();
        if(slevfabric == '')
        {
             dynmcimg2 =  $("#selectedpattern").val();
              slevfab.src=dynmcimg2;
        }
        else
            {
                
            }
        
        
        $("#sleevelnth").val(sleeve_length);
        slevearea= $("#scolorarea").val();
        sbcolor= $("#sbcolour").val();
        spcolor = $("#slepipecolor").val();
        newsleve(slevearea,sbcolor,spcolor);
       
    });
    
    $(".slevfab").click(function()             // For Sleeve Fabric Images
    {
        var sfab = $(this).attr("src");
        $("#slevfab").val(sfab);
        
        slevfab.src = sfab;
        slevearea= $("#scolorarea").val();
        sbcolor= $("#sbcolour").val();
        spcolor = $("#slepipecolor").val();
        newsleve(slevearea,sbcolor,spcolor);
    });
    
    $(".slevemb").click(function()             // For Sleeve Emb Images
    {
    
        var slevemb = $(this).attr("src")
        slevembimg.src = slevemb;
        slevearea= $("#scolorarea").val();
        sbcolor= $("#sbcolour").val();
        spcolor = $("#slepipecolor").val();
        newsleve(slevearea,sbcolor,spcolor);
    });
    
    
    $(".spbcolor").click(function()             // For sleeve border  colour
    {            
        sbcolor = $(this).attr("id");
        slevearea = "border";
        $("#scolorarea").val(slevearea);
        $("#sbcolour").val(sbcolor);
        spcolor = $("#slepipecolor").val();
        newsleve(slevearea,sbcolor,spcolor);
        
    });
    
    $(".spcolor").click(function()             // For sleeve Pipping colour
    {            
        spcolor = $(this).attr("id");
        slevearea = "pippig";
        $("#scolorarea").val(slevearea);
        $("#slepipecolor").val(spcolor);
        sbcolor = $("#sbcolour").val();
        newsleve(slevearea,sbcolor,spcolor);
        
    });
    
    $(".sbtns").click(function(){
        slevearea= $("#scolorarea").val();
        sbcolor= $("#sbcolour").val();
        spcolor = $("#slepipecolor").val();
        var slvimg = $(this).attr("src");
        slevbtn.src = slvimg;
        newsleve(slevearea,sbcolor,spcolor);
    
    });
    
    function start(area,type)                               // Start main Function for ALl
    {
        var canvas=document.getElementById("canvas");
        var ctx=canvas.getContext("2d");
        ctx.drawImage(img1,0,0);
        ctx.globalCompositeOperation="source-atop";
        ctx.globalAlpha=.99; 
       // alert(img.src);
            
            if(img.src != '')
            {
                var pattern = ctx.createPattern(img, 'repeat');
                ctx.rect(0, 0, canvas.width, canvas.height);
                ctx.fillStyle = pattern;
                ctx.fill();
            }
            
            
            if(type == 'digi')
            {
                var pattern1 = ctx.createPattern(img3, 'repeat');
                
            }
            if(type == 'emb')
            {
                 var pattern1 = ctx.createPattern(img2, 'repeat');
                 
            }
            if(type == 'block')
            {
                 var pattern1 = ctx.createPattern(img4, 'repeat');
                 
            }
            
            if(area == 'Full')  
            { 
                var rectangle = new Path2D();
                rectangle.rect(0, 0, canvas.width, canvas.height);
            
            }
            if(area == 'Middle')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(160, 0, 80, 900);

            }
            if(area == 'Body')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(50, 50, 900, 150);

            }
            if(area == 'Neck')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(155, 0, 90, 150);
            }
            
            
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);
          
          
             /*    DRAW NECK IMAGE ON CANVAS    */
          
             if(neckimg.src != '')
             {
                 ctx.drawImage(neckimg, 140, 70, 115, 162);  
             }
             /*    DRAW NECK BUTTONS IMAGE ON CANVAS    */
             
             if(btnimg.src != '')
             {
                ctx.drawImage(btnimg, 189, 133, 15, 15);
                ctx.drawImage(btnimg, 189, 148, 15, 15);
                ctx.drawImage(btnimg, 189, 162, 15, 15);
             }
         
    }
    
    function newsleve(slevearea,sbcolor,spcolor)                    // Function to draw sleeves images
    {
       
                var canvas2=document.getElementById("frontcanvas");
                var ctx2=canvas2.getContext("2d");
                ctx2.drawImage(canvas2bg, 0, 0);                        // Canvas2 background image
                ctx2.globalCompositeOperation="destination-atop";
                ctx2.globalAlpha=.99; 
               
              
                if(sleevlngth.src != '')                                // Draw Sleeve Length Images
                {
               //  alert(sleevlngth.src);
                  ctx2.drawImage(sleevlngth, 50, 12, 320, 400);
                  ctx2.globalCompositeOperation="source-atop";
                  ctx2.globalAlpha=.99; 
                }
                 if(slevfab.src != '')                                   // Fill Sleeve Fabric and color patterns 
                {
                    var patternsfab = ctx2.createPattern(slevfab, 'repeat');
                    ctx2.rect(50, 12, 320, 400);
                    ctx2.fillStyle = patternsfab; 
                    ctx2.fill();
                   
                }
                if(sbcolor != '' || (sbcolor !== '' && spcolor != ''))                               // Fill sleeves Border Colour
                {
                    function Shape(x, y, w, h, fill) 
                    {
                        this.x = x;
                        this.y = y;
                        this.w = w;
                        this.h = h;
                        this.fill = fill;
                    }

                    var myRect = [];

                    myRect.push(new Shape(80, 175, 150, 35, sbcolor));
                    myRect.push(new Shape(200, 165, 150, 35, sbcolor));
                    for (var i in myRect)
                    {
                        oRec = myRect[i];
                        ctx2.fillStyle = oRec.fill;
                        ctx2.fillRect(oRec.x, oRec.y, oRec.w, oRec.h);
                       
                    }

                }
                
               
                if(slevembimg.src != '')                                     // Fill Sleeves emb. patterns
                {
                    var pattern = ctx2.createPattern(slevembimg, 'repeat');
                    ctx2.rect(50, 12, 320, 400);
                    ctx2.fillStyle = pattern;
                    ctx2.fill();
                }
                
                 if(spcolor != '' || (sbcolor !== '' && spcolor != ''))                            // Fill sleeves Pipping Colour
                {
                    function Shape(x, y, w, h, fill) 
                    {
                        this.x = x;
                        this.y = y;
                        this.w = w;
                        this.h = h;
                        this.fill = fill;
                    }

                    var myRect = [];

                    myRect.push(new Shape(80, 197, 150, 4, spcolor));
                    myRect.push(new Shape(200, 187, 150, 4, spcolor));
                    for (var i in myRect)
                    {
                        oRec = myRect[i];
                        ctx2.fillStyle = oRec.fill;
                        ctx2.fillRect(oRec.x, oRec.y, oRec.w, oRec.h);
                      
                    }

                }
                
                if(slevbtn.src != '')               // For sleeve btn images 
                {
                    ctx2.drawImage(slevbtn,82, 175, 15, 15 );
                    ctx2.drawImage(slevbtn,340, 162, 15, 15);
                }
    
    }
   
  
    /*   ---------------- CHANGE SHIRT PATTERN ENDS HERE -------------       */
    

    /*  ----------------   SCRIPT TO SHOW FABRIC ICONS   ----------------    */
    
    $("#menuIcon_fabric").click(function()              // Fabric Main Menu click
    {
    
     
        $(".fabimgs").show('slow');
        $(".front_container").hide('slow');
        $(".neck_container").hide('slow');
        $(".sleeves_container").hide('slow');
    
    });
    
    /*  -------------   SCRIPT TO SHOW FABRIC ICONS ENDS HERE  ---------     */
    
    

    /*   ---------------- SCRIPT FOR THE FRONT OF THE SHIRT ----------       */
    
    $("#menuIcon_front").click(function()               // Front main menu click
    {
        var fab = $("#selectedpattern").val();
        if(fab != '')
        {
            $(".front_container").show('slow');
            $(".fabimgs").hide('slow');
            $(".neck_container").hide('slow');
            $(".sleeves_container").hide('slow');
        }
        else
        {
            alert("Please Select alteast one fabric for kurta");
        }
    });
    
     $("#front_area").click(function()               // Shirt Front area
    {
        $("#shirtareas").show('slow');
    });
    
    $("#Digital").click(function()                  // Front Digital title click 
    {
        $(".digitalsection").show('slow');
    });
    
    $("#Embroidery").click(function()               // Front Embo. title click
    {
        $(".embsection").show('slow');
    });
   
    $("#bprint").click(function()                   // Front block print title click
    {
        $(".blocksection").show('slow');
    });
    
    /*   --------- SCRIPT FOR THE FRONT OF THE SHIRT ENDS HERE -------       */
    

    /*   ---------------- SCRIPT FOR THE NECK OF THE SHIRT ----------       */
    
    $("#menuIcon_neck").click(function()            // Neck Main Menu Click
    {
        var fab = $("#selectedpattern").val();
        if(fab != '')
        {
            $(".neck_container").show('slow');
            $(".fabimgs").hide('slow');
            $(".front_container").hide('slow');
            $(".sleeves_container").hide('slow');
        }
        else
        {
            alert("Please Select alteast one fabric for kurta");
        }
    });
    
    $("#neck_style").click(function()                   // Neck style click 
    {
        $("#shirtnstyle").show('slow');
    });
    
    $("#npcolor").click(function()                      // Neck Piping color click
    {
        $(".npippingsection").show('slow');
    });
    
    $("#nbordercolor").click(function()                 // Neck Border Click
    {
        $(".nbordersection").show('slow');
    });
    
    $("#nbuttons").click(function()                     // Neck Buttons Click
    {
        $(".nbuttonsection").show('slow');
    });
    
    /*   --------- SCRIPT FOR THE NECK OF THE SHIRT ENDS HERE -------       */
    
  
    
    
    /*   ---------------- SCRIPT FOR THE SLEEVES OF THE SHIRT ----------       */
    
    $("#menuItem_sleeve").click(function()              // Sleeves Main Menu click
    {
        var fab = $("#selectedpattern").val();
        if(fab != '')
        {
            $(".sleeves_container").show('slow');
            $(".neck_container").hide('slow');
            $(".fabimgs").hide('slow');
            $(".front_container").hide('slow');
        }
        else
        {
            alert("Please Select alteast one fabric for kurta");
        }
    });
    
    
   
    $("#slevfabric").click(function()                   // Sleeves Fabric title click
    {
        $(".slvfabric").show("slow");
    });
    
    $("#spcolor").click(function()                      // Sleeves pipping color title click
    {
        $(".spippingsection").show('slow');
    });
    
    $("#sbordercolor").click(function()                 // Sleeves Border color title click
    {
        $(".sbordersection").show('slow');
    });
    
    $("#sbuttons").click(function()                    // Sleeves buttons title click
    {
        $(".sbuttonsection").show('slow');
    });
    
    $("#sembrdry").click(function()                     // Sleeves Emb. title click
    {
        $(".sembsection").show('slow');
    });
    
    
    /*   --------- SCRIPT FOR THE SLEEVES OF THE SHIRT ENDS HERE -------       */
    
  

}); 
</script>


        
<body class="emerald page-emerald leftmenu" data-twttr-rendered="true">
    
     <form method="POST" enctype="multipart/form-data" action="finial_img.php" id="myForm">
                <input type="hidden" name="img_val" id="img_val" value="" />
                <input type="hidden" name="product_id" id="product_id" value="<?php echo $_GET['pro_id']; ?>" />
                <input type="hidden" name="pro_color" id="pro_color" value="white" />
                <input type="hidden" name="userid" id="userid" value="<?php //echo $_GET['link']; ?>" />
                <input type="hidden" name="categoryid" id="categoryid" value="<?php echo $_GET['path']; ?>" />
            </form>
          
     <div id="viewport" class="viewport-fluid landscape extreme">
                  
                  <!--     CANVAS  -->
                  <canvas id="canvas" width=436 height=567 style="background:url(catalog/view/theme/default/image/23151.png); position: absolute; z-index: 9;">
                </canvas>
                <canvas id="frontcanvas" width=436 height=567 style="z-index: 99;">
                </canvas>
                  <!--     CANVAS  -->
                  
              </div>

<div id="ui" class="ui">
     <div id="menus" class="menus">
            <div class="menuBar level0" id="menu_mainMenu">
	<ul style="transition-timing-function: cubic-bezier(0.25, 0.46, 0.45, 0.94); -webkit-transition-timing-function: cubic-bezier(0.25, 0.46, 0.45, 0.94); transition-duration: 500ms; -webkit-transition-duration: 500ms; transform: translate(0px, 0px) translateZ(0px);">
        <li class="menuItem fabricChoice active" id="menuItem_fabric">
            <img class="menuIcon" id="menuIcon_fabric" src="catalog/view/theme/default/image/3.jpg">
		<span>Fabric</span>
		<div class="mod"></div>
	</li>
        <li class="menuItem fabricChoice active" id="menuItem_fabric">
            <img class="menuIcon" id="menuIcon_front" src="catalog/view/theme/default/image/frontimg.jpg">
		<span>Front</span>
		<div class="mod"></div>
	</li>
        <li class="menuItem fabricChoice active" id="menuItem_fabric">
            <img class="menuIcon" id="menuIcon_neck" src="catalog/view/theme/default/image/neck.jpg">
		<span>Neck</span>
		<div class="mod"></div>
	</li>
        <li class="menuItem " id="menuItem_sleeve">
            <img class="menuIcon" id="menuIcon_sleeve" src="catalog/view/theme/default/image/sleeves.jpg">
		<span>Sleeve</span>
		<div class="mod"></div>
	</li>
        <li class="menuItem " id="menuItem_collar">
            <img class="menuIcon" id="menuIcon_back" src="catalog/view/theme/default/image/back.jpg">
		<span>Back</span>
		<div class="mod"></div>
	</li>
        <li class="menuItem " id="menuItem_cuff">
            <img class="menuIcon" id="menuIcon_bottom" src="">
		<span>Bottom</span>
		<div class="mod"></div>
	</li>
        <li class="menuItem " id="menuItem_cuff">
            <img class="menuIcon" id="menuIcon_size" src="">
		<span>Size</span>
		<div class="mod"></div>
	</li>
        
        </ul>

</div>
        </div>
     <!-- -------------------- FABRIC SECTION OF KURTA STARTS HERE  ---------------------------- -->
    
     <div class="fabimgs" style="display:none;">
         <input type="hidden" name="selectedpattern" id="selectedpattern" value="" />
        <?php 
        foreach($option_values as $option_valuess)
        { ?>
            <img src="image/<?php echo $option_valuess['image']; ?>" style="width:50px; height: 50px;" class="img1">
        <?php
        } ?>	
    </div> 
     
     <!-- -------------------- FABRIC SECTION OF KURTA ENDS HERE  ---------------------------- -->
     
     <!-- -------------------- FRONT SECTION OF KURTA STARTS HERE ---------------------------- -->
      
     <div class="front_container" style="display:none;">
                                <div class="frontdiv">
                                    <span class="frontsections btnstyle" id="front_area">
                                        <?php 
                                        foreach($karea as $karea1 )
                                        {
                                            echo $karea1['name'];
                                        } ?>
                                    </span>
                                    <input type="hidden" name="area" id="sarea" value=""/>
                                    <div id="shirtareas" style="display:none;">
                                        <?php foreach($frontarea as $frontarea1){ 
                                        ?>
                                        <span class="areasection">
                                            <p><img src="image/<?php echo $frontarea1['image']; ?>" alt="<?php echo $frontarea1['name']; ?>" id="<?php echo $frontarea1['name']; ?>" class="sel-area sel-area1" /><font><?php echo $frontarea1['name']; ?></font></p>
                                        </span>
                                        <?php } ?>
                                        
                                    </div>
                                </div>
                       
                        <div id="front_designs" >
                            <input type="hidden" name="areapattrn" id="areapattrn" value="" />
                                    <div class="areatitles" style="display:none;">
                                    <?php
                                    foreach($kdesign as $kdesign1)
                                    {
                                        if($kdesign1['name'] == 'Block Print')
                                        {   
                                            $id = 'bprint'; 
                                        }
                                        else
                                        {
                                            $id = $kdesign1['name'];
                                        }
                                        
                                        ?>
                                         <span class="frontsections btnstyle" id="<?php echo $id; ?>"><?php echo $kdesign1['name']; ?></span>
                                    <?php }
                                    
                                    ?>
                                        <!--
                                        
                                    <span class="frontsections btnstyle" id="digsection">Digital</span>
                                    <span class="frontsections btnstyle" id="embsec" >Emb</span>
                                    <span class="frontsections btnstyle" id="blockesc" >Block</span> -->
                                    </div>
                            <input type="hidden" name="iddd" value="" id="iddd" />
                            <input type="hidden" name="designsections" value="" id="designsections" />
                               <div class="frontdiv">
                                    
                                    <span class="embsection" style="display:none;">
                                        <?php
                                        if($femb != '')
                                        {
                                        
                                            foreach($femb as $fembrodry)
                                            {
                                        ?>
                                        <p><img class="embimg" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  /></p>
                                        <?php } ?>
                                        <p><img class="embimg" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  /></p>
                                        <?php } ?>
                                    </span>
                                </div>
                             <div class="frontdiv">
                                    
                                    <span class="digitalsection" style="display:none;">
                                        <?php
                                        if($fdigital != '')
                                        {
                                            foreach($fdigital as $fdigital1)
                                            {
                                        ?>
                                        <p><img class="digitalimg" id="" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /></p>
                                        <?php } ?>
                                        <p><img class="digitalimg" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  /></p>
                                        <?php } ?>
                                    </span>
                                </div>
                                <div class="frontdiv">
                                   
                                    <span class="blocksection" style="display:none;">
                                        <?php
                                        if($fblock != '')
                                        {
                                            foreach($fblock as $fblockp)
                                            {
                                        ?>
                                        <p><img class="embimg" alt="<?php echo $fblockp['design']; ?>" src="<?php echo $fblockp['attached_image']; ?>" /></p>
                                        <?php } ?>
                                        <p><img class="embimg" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  /></p>
                                        <?php } ?>
                                    </span>
                                </div>
                    </div>
       </div>
      
     <!-- -------------------- FRONT SECTION OF KURTA ENDS HERE   ---------------------------- -->
     
     <!-- -------------------- NECK SECTION OF KURTA STARTS HERE  ---------------------------- -->
                      
     <div class="neck_container" style="display:none;">
                            
                             <div class="neckdiv">
                                    <span class="necksections btnstyle" id="neck_style">Style</span>
                                    <input type="hidden" name="neckstyle" id="neckstyle" value=""/>
                                    <div id="shirtnstyle" style="display:none;">
                                        <span class="nstylesection">
                                        <?php
                                        if($neckstyle != '')
                                        {
                                        foreach($neckstyle as $neckstyle1){ ?>
                                            <p><img src="<?php echo $neckstyle1['design_main_img']; ?>" alt="<?php echo $neckstyle1['design_name']; ?>" id="<?php echo $neckstyle1['design_name']; ?>" class="neck-sec" /><font><?php echo $neckstyle1['design_name']; ?></font></p>
                                        <?php } ?>
                                        <p><img style="border:1px soild #ccc;" src="upload/no-fill/no-fill-patrn.png" alt="no-fill-patrn" id="no-fill" class="neck-sec" /><font>no-fill</font></p>
                                         <?php } ?>
                                        </span>
                                        
                                    </div>
                             </div>
                       
                             <div id="neck_colorss" >
                                    <input type="hidden" name="npippingcolor" id="npippingcolor" value="" />
                                    <div class="necktitles" style="display:none;">
                                   <?php 
                                    foreach($neckoptions as $neckoptions1)
                                    {
                                        if($neckoptions1['name'] == 'Pipping Colour')
                                        {
                                            $id = 'npcolor';
                                            ?>
                                            <span class="necksections btnstyle" id="<?php echo $id; ?>">Pipping</span>
                                        <?php
                                        }
                                        if($neckoptions1['name'] == 'Border Colour')
                                        {
                                            $id = 'nbordercolor';
                                            ?>
                                            <span class="necksections btnstyle" id="<?php echo $id; ?>">Border</span>
                                        <?php
                                        }
                                        if($neckoptions1['name'] == 'Buttons')
                                        {
                                            $id = 'nbuttons';
                                            ?>
                                            <span class="necksections btnstyle" id="<?php echo $id; ?>">Buttons</span>
                                        <?php
                                        }
                                   ?> 
                                   
                                     <?php } ?>   
                                   <!-- <span class="necksections btnstyle" id="npcolor">Pipping</span>
                                    <span class="necksections btnstyle" id="nbordercolor" >Border</span>
                                    <span class="necksections btnstyle" id="nbuttons" >Buttons</span> -->
                                    
                                    
                                    </div>
                                    <input type="hidden" name="nbcolour" value="" id="nbcolour" />
                                    <input type="hidden" name="nbutns" value="" id="nbutns" />
                                    <div class="neckdiv">

                                        <span class="npippingsection" style="display:none;">
                                            <?php
                                            if($neckpipping != '')
                                            {
                                                foreach($neckpipping as $neckpipping1)
                                                {
                                                $npcolour = $neckpipping1['neck_pipping_color'];
                                            ?>
                                            <p class="npcolor colorblock" id="" alt="" style="background-color:<?php echo $npcolour ?>;"></p>
                                            <?php } ?>
                                            <p class="npcolor colorblock" id="" alt="" style="background-color:transparent;"></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    <div class="neckdiv">

                                        <span class="nbordersection" style="display:none;">
                                            <?php
                                            if($neckborder != '')
                                            {
                                                foreach($neckborder as $neckborder1)
                                                {
                                                $nbcolour = $neckborder1['neck_border_color'];
                                            ?>
                                            <p class="npbcolor colorblock" id="" alt="" style="background-color:<?php echo $nbcolour ?>;"></p>
                                            <?php } ?>
                                            <p class="npbcolor colorblock" id="" alt="" style="background-color:transparent;"></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    <div class="neckdiv">

                                        <span class="nbuttonsection" style="display:none;">
                                            <?php
                                            if($neckbuttons != '')
                                            {
                                                foreach($neckbuttons as $neckbuttons1)
                                                {
                                            ?>
                                            <p><img class="nbtns" src="<?php echo $neckbuttons1['neck_btnmain_img']; ?>" style="width:50px;" /></p>
                                            <?php } ?>
                                            <p><img class="nbtns" src="upload/neck/buttons/no-btn33.png" style="width:50px;border:1px solid #ccc; " /></p>
                                            <?php } ?>
                                         </span>
                                    </div>
                    </div>
                            
       </div>               
                    
                        
      <!-- -------------------- NECK SECTION OF KURTA ENDS HERE    ------------------------------- -->
      
      
      <!-- -------------------- SLEEVES SECTION OF KURTA STARTS HERE  ---------------------------- -->
      
      
       <div class="sleeves_container" style="display:none;">
                             <div class="sleevesdiv">
                                    <span class="sleevessections btnstyle" id="sleeves_length">Length</span>
                                    <input type="hidden" name="sleevelnth" id="sleevelnth" value=""/>
                                    <div id="shirtsstyle" style="display:none;">
                                        
                                        <?php 
                                        if($sleevelength != '')
                                        {
                                        foreach($sleevelength as $sleevelength1){ ?>
                                        <span class="sleevessection">
                                            <p><img src="<?php echo $sleevelength1['attached_image']; ?>" alt="<?php echo $sleevelength1['length']; ?>" id="<?php echo $sleevelength1['length']; ?>" class="sleeves-sec" style="width:55px;"/><font><?php echo $sleevelength1['length']; ?></font></p>
                                        </span>
                                        <?php } } ?>
                                        
                                    </div>
                             </div>
                       
                             <div id="sleeves_colorss" >
                                    <input type="hidden" name="slevfab" value="" id="slevfab" />
                                    <input type="hidden" name="semb" value="" id="semb" />
                                    <input type="hidden" name= "scolorarea" id="scolorarea" value="" />
                                    <input type="hidden" name="sbcolour" value="" id="sbcolour" />
                                    <input type="hidden" name="slepipecolor" id="slepipecolor" value="" />
                                    <input type="hidden" name="sbutns" value="" id="sbutns" />
                                    
                                    <div class="sleevestitles" style="display:none;">
                                        <span class="sleevessections btnstyle" id="slevfabric" >Fabric </span>
                                    <?php    
                                      foreach($sleeveoptions as $sleeveoptions1)
                                      {
                                      
                                        if($sleeveoptions1['name'] == 'Pipping color')
                                        {
                                            $id = 'spcolor';
                                        ?>
                                        <span class="sleevessections btnstyle" id="<?php echo $id;  ?>">Pipping</span>
                                        <?php 
                                        }
                                        if($sleeveoptions1['name'] == 'Border color')
                                        {
                                        $id = "sbordercolor";
                                        ?>
                                         <span class="sleevessections btnstyle" id="<?php echo $id;  ?>">Border</span>
                                        <?php 
                                        }
                                        if($sleeveoptions1['name'] == 'Buttons')
                                        {
                                        $id = 'sbuttons';
                                        ?>
                                        <span class="sleevessections btnstyle" id="<?php echo $id;  ?>" >Buttons</span>
                                        <?php 
                                        }
                                        if($sleeveoptions1['name'] == 'Embroidery')
                                        {
                                            $id ='sembrdry';
                                        ?>
                                        <span class="sleevessections btnstyle" id="<?php echo $id;  ?>" >Embroidery</span>
                                        <?php 
                                        }
                                      
                                      }
                                    ?>    
                                    
                                    </div>
                                    
                                    <div class="sleevesdiv">
                                        <span class="slvfabric" style="display:none; margin-left: 15px;">
                                        <?php 
                                        if($option_values != '')
                                        {
                                       foreach($option_values as $option_valuess)
                                       { ?>
                                           <p><img src="image/<?php echo $option_valuess['image']; ?>" style="width:50px; height: 50px;" class="slevfab" /><//p>
                                       <?php
                                       } ?>
                                        <?php } ?>
                                        </span>
                                    </div>
                                    <div class="sleevesdiv">

                                        <span class="sbordersection" style="display:none; margin-left: 15px;">
                                            <?php
                                            if($sleevebcolour != '')
                                            {
                                                foreach($sleevebcolour as $sleevebcolour1)
                                                {
                                                $sbcolour = $sleevebcolour1['border_color'];
                                            ?>
                                            <p class="spbcolor colorblock" id="<?php echo $sbcolour ?>"  style="background-color:<?php echo $sbcolour ?>;"></p>
                                            <?php } ?>
                                            <p class="spbcolor colorblock" id="transparent"  style="background-color: transparent;"></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    
                                    <div class="sleevesdiv">

                                        <span class="sembsection" style="display:none;">
                                            <?php
                                            if($sleevebutonsemb != '')
                                            {
                                                foreach($sleevebutonsemb as $sleevebutonsemb1)
                                                {
                                                $slevemb = $sleevebutonsemb1['sleeve_emb_image'];
                                            ?>
                                           <p><img class="slevemb" src="<?php echo $slevemb; ?>" style="width : 100px;"/></p>
                                            <?php } ?>
                                            <p><img style="width:50px; height: 50px;border:1px solid #ccc; " class="slevemb" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  /></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    
                                    <div class="sleevesdiv">

                                        
                                        <span class="spippingsection" style="display:none; margin-left: 47px;">
                                            <?php
                                            if($sleevepcolour != '')
                                            {
                                                foreach($sleevepcolour as $sleevepcolour1)
                                                {
                                                $spcolour = $sleevepcolour1['pipping_color'];
                                            ?>
                                            <p class="spcolor colorblock" id="<?php echo $spcolour ?>" style="background-color:<?php echo $spcolour ?>;"></p>
                                            <?php } ?>
                                            <p class="spcolor colorblock" id="transparent" style="background-color:transparent;"></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    
                                    <div class="sleevesdiv">

                                        <span class="sbuttonsection" style="display:none; margin-left: 66%;">
                                            <?php
                                            if($sleevebutons != '')
                                            {
                                                foreach($sleevebutons as $sleevebutons1)
                                                {
                                            ?>
                                            <p><img class="sbtns" src="<?php echo $sleevebutons1['attached_image']; ?>" style="width : 25px;"/></p>
                                            <?php } ?>
                                            <p><img class="sbtns" src="upload/neck/buttons/no-btn33.png" style="width:25px;border:1px solid #ccc; " /></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    
                    </div>
       </div>  
      
      <!-- -------------------- SLEEVES SECTION OF KURTA ENDS HERE    ---------------------------- -->
                        
      
      
      
</div>
    

 </body>
        
<?php // echo $footer; ?>
