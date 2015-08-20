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
  margin: 12px 7px 0 0;
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
  width: 328px;
  height: 33px;
}
.front_container {
  margin-left: 17px;
}



/*  -----------------  NECK STYLING STARTS HERE ---------------------     */

.neck_container, .sleeves_container {
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

.sleevesdiv 
{
    float: left;
    height: auto;
    margin: 12px 7px 0 0;
    width: 80px;
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

/*  -----------------  SLEEVES STYLING ENDS HERE ---------------------     */
</style>

<script> 
$(function(){

      /*   ---------------- CHANGE SHIRT PATTERN STARTS -------------       */
    
    var img  = new Image();
    var img1 = new Image();
    var img2 = new Image();
    var img3 = new Image();
    var img4 = new Image();
    var neckimg = new Image();
    var btnimg = new Image();
    var sleevlngth = new Image();
    
    img.onload=function()
       {
            img1.onload=function()
            {
                start();
            } 
            img1.src="http://localhost/opencart/opencart/catalog/view/theme/default/image/23151.png";
       }
           
    $('.img1').click(function()
    {  
        var area  = $("#sarea").val();
        var areapattrn= $("#areapattrn").val();
        
        var dynmcimg2= $(this).attr('src');  
        $("#selectedpattern").val(dynmcimg2);
        img.src=dynmcimg2; 
         
        start(area,areapattrn);
    });
    
    $(".sel-area").click(function(){
        var area = $(this).attr('alt');
        $("#sarea").val(area);
        var areapattrn= $("#areapattrn").val();
        var faid = $(this).attr("id");
        $(".areatitles").attr('id', faid+'ID');
        $("#"+faid+'ID').show('slow');
        $("#iddd").val(faid);
        
        start(area,areapattrn);
   });
    
   $(".digitalimg").click(function(){
        var digi_img = $(this).attr('src');
        img3.src=digi_img;
        $("#areapattrn").val('digi');
        var area = $("#sarea").val();
        start(area,'digi');
        
   });
   $(".embimg").click(function(){
        var emb_img = $(this).attr('src');
        img2.src=emb_img;
        $("#areapattrn").val('emb');
        var area = $("#sarea").val();
        start(area,'emb');
   });
   $(".block").click(function(){
        var emb_img = $(this).attr('src');
        img4.src=emb_img;
        $("#areapattrn").val('block');
        var area = $("#sarea").val();
        start(area,'block');
   });
   
   /*  -----------------    NECK  -------------------     */
   
   $(".neck-sec").click(function(){
        $(".necktitles").show('slow');
        var type = $("#areapattrn").val();
        var area = $("#sarea").val();
        
        var neckstyle = $(this).attr('src');
        neckimg.src=neckstyle; 
        $("#neckstyle").val(neckstyle);
        
        start(area,type);
        
    });
   
    $('.nbtns').click(function()
    {  
       
        var dynmcbtn= $(this).attr('src');  
        btnimg.src=dynmcbtn; 
        var type = $("#areapattrn").val();
        var area = $("#sarea").val();
        start(area,type);
       
    });
    
    /* ------ SLEEVES ----------- */
    
    
    $(".sleeves-sec").click(function(){
        $(".sleevestitles").show('slow');
        var type = $("#areapattrn").val();
        var area = $("#sarea").val();
        
        var sleeve_length = $(this).attr('src');
        sleevlngth.src=sleeve_length; 
        $("#sleevelnth").val(sleeve_length);
        
       newsleve();
    });
    
    function start(area,type)
    {
        var canvas=document.getElementById("canvas");
        var ctx=canvas.getContext("2d");
        ctx.drawImage(img1,0,0);
        ctx.globalCompositeOperation="source-atop";
        ctx.globalAlpha=.99; 
        
        
            var pattern = ctx.createPattern(img, 'repeat');
            ctx.rect(0, 0, canvas.width, canvas.height);
            ctx.fillStyle = pattern;
            ctx.fill();
            
            
            
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
          
          if(neckimg != '')
              {
             ctx.drawImage(neckimg, 140, 70, 115, 162);  
             }
             /*    DRAW NECK BUTTONS IMAGE ON CANVAS    */
             
             if(btnimg != '')
             {
                ctx.drawImage(btnimg, 189, 133, 15, 15);
                ctx.drawImage(btnimg, 189, 148, 15, 15);
                ctx.drawImage(btnimg, 189, 162, 15, 15);
             }
         
             
              
         
         
         
    }
    
    function newsleve()
    {
        /*   DRAW SLEEVE LENGTH IMAGES  */
         
                var canvas2=document.getElementById("frontcanvas");
                var ctx2=canvas2.getContext("2d");
                ctx2.drawImage(sleevlngth, 50, 12, 320, 400); 
                ctx2.globalCompositeOperation="source-atop";
                ctx2.globalAlpha=.99; 
    }
  
    /*   ---------------- CHANGE SHIRT PATTERN ENDS HERE -------------       */

    /*    SCRIPT TO SHOW FABRIC ICONS      */
    
    $("#menuIcon_fabric").click(function(){
    
     
        $(".fabimgs").show('slow');
        $(".front_container").hide('slow');
        $(".neck_container").hide('slow');
        $(".sleeves_container").hide('slow');
    
    });
    
    /*    SCRIPT TO SHOW FABRIC ICONS ENDS HERE      */

    /*    SCRIPT TO SHOW FRONT CONTENT      */
    
    $("#menuIcon_front").click(function(){
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
    
    
    /*   ---------------- SCRIPT FOR THE FRONT OF THE SHIRT ----------       */
    
    $("#front_area").click(function(){
        $("#shirtareas").show('slow');
    });
    
/*    $(".sel-area").click(function(){
        
        
    }); */
    $("#digsection").click(function(){
        $(".digitalsection").show('slow');
    });
    $("#embsec").click(function(){
        $(".embsection").show('slow');
    });
    $("#blockesc").click(function(){
        $(".blocksection").show('slow');
    });
    
    /*   --------- SCRIPT FOR THE FRONT OF THE SHIRT ENDS HERE -------       */
    
    /*    SCRIPT TO SHOW FRONT CONTENT ENDS HERE     */
    

    /*    SCRIPT TO SHOW NECK CONTENT      */
    
    $("#menuIcon_neck").click(function(){
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
    
    
    /*   ---------------- SCRIPT FOR THE NECK OF THE SHIRT ----------       */
    
    $("#neck_style").click(function(){
        $("#shirtnstyle").show('slow');
    });
    
    
    
    $("#npcolor").click(function(){
        $(".npippingsection").show('slow');
    });
    $("#nbordercolor").click(function(){
        $(".nbordersection").show('slow');
    });
    $("#nbuttons").click(function(){
        $(".nbuttonsection").show('slow');
    });
    
    /*   --------- SCRIPT FOR THE NECK OF THE SHIRT ENDS HERE -------       */
    
    /*    SCRIPT TO SHOW NECK CONTENT ENDS HERE     */
    
    
    
    /*    SCRIPT TO SHOW SLEEVES CONTENT      */
    
    $("#menuItem_sleeve").click(function(){
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
    
    
    /*   ---------------- SCRIPT FOR THE SLEEVES OF THE SHIRT ----------       */
    
    
    $("#sleeves_length").click(function(){
        $("#shirtsstyle").show('slow');
    });
    
    
    $("#spcolor").click(function(){
        $(".spippingsection").show('slow');
    });
    $("#sbordercolor").click(function(){
        $(".sbordersection").show('slow');
    });
    $("#sbuttons").click(function(){
        $(".sbuttonsection").show('slow');
    });
    $("#sembrdry").click(function(){
        $(".sembsection").show('slow');
    });
    
    /*   --------- SCRIPT FOR THE SLEEVES OF THE SHIRT ENDS HERE -------       */
    
    /*    SCRIPT TO SHOW SLEEVES CONTENT ENDS HERE     */

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
                                    <span class="frontsections btnstyle" id="front_area">Area</span>
                                    <input type="hidden" name="area" id="sarea" value=""/>
                                    <div id="shirtareas" style="display:none;">
                                        <?php foreach($frontarea as $frontarea1){ ?>
                                        <span class="areasection">
                                            <p><img src="image/<?php echo $frontarea1['image']; ?>" alt="<?php echo $frontarea1['name']; ?>" id="<?php echo $frontarea1['name']; ?>" class="sel-area sel-area1" /><font><?php echo $frontarea1['name']; ?></font></p>
                                        </span>
                                        <?php } ?>
                                        
                                    </div>
                                </div>
                       
                        <div id="front_designs" >
                            <input type="hidden" name="areapattrn" id="areapattrn" value="" />
                                    <div class="areatitles" style="display:none;">
                                        
                                    <span class="frontsections btnstyle" id="digsection">Digital</span>
                                    <span class="frontsections btnstyle" id="embsec" >Emb</span>
                                    <span class="frontsections btnstyle" id="blockesc" >Block</span>
                                    </div>
                            <input type="hidden" name="iddd" value="" id="iddd" />
                            <input type="hidden" name="designsections" value="" id="designsections" />
                                <div class="frontdiv">
                                    
                                    <span class="digitalsection" style="display:none;">
                                        <?php
                                            foreach($fdigital as $fdigital1)
                                            {
                                        ?>
                                        <p><img class="digitalimg" id="" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /></p>
                                        <?php } ?>
                                        
                                    </span>
                                </div>
                                <div class="frontdiv">
                                    
                                    <span class="embsection" style="display:none;">
                                        <?php
                                            foreach($femb as $fembrodry)
                                            {
                                        ?>
                                        <p><img class="embimg" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  /></p>
                                        <?php } ?>
                                    </span>
                                </div>
                                <div class="frontdiv">
                                   
                                    <span class="blocksection" style="display:none;">
                                        <?php
                                            foreach($fblock as $fblockp)
                                            {
                                        ?>
                                        <p><img class="embimg" alt="<?php echo $fblockp['design']; ?>" src="<?php echo $fblockp['attached_image']; ?>" /></p>
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
                                        
                                        <?php foreach($neckstyle as $neckstyle1){ ?>
                                        <span class="nstylesection">
                                            <p><img src="<?php echo $neckstyle1['design_main_img']; ?>" alt="<?php echo $neckstyle1['design_name']; ?>" id="<?php echo $neckstyle1['design_name']; ?>" class="neck-sec" /><font><?php echo $neckstyle1['design_name']; ?></font></p>
                                        </span>
                                        <?php } ?>
                                        
                                    </div>
                             </div>
                       
                             <div id="neck_colorss" >
                                    <input type="hidden" name="npippingcolor" id="npippingcolor" value="" />
                                    <div class="necktitles" style="display:none;">
                                        
                                    <span class="necksections btnstyle" id="npcolor">Pipping</span>
                                    <span class="necksections btnstyle" id="nbordercolor" >Border</span>
                                    <span class="necksections btnstyle" id="nbuttons" >Buttons</span>
                                    </div>
                                    <input type="hidden" name="nbcolour" value="" id="nbcolour" />
                                    <input type="hidden" name="nbutns" value="" id="nbutns" />
                                    <div class="neckdiv">

                                        <span class="npippingsection" style="display:none;">
                                            <?php
                                                foreach($neckpipping as $neckpipping1)
                                                {
                                                $npcolour = $neckpipping1['neck_pipping_color'];
                                            ?>
                                            <p class="npcolor colorblock" id="" alt="" style="background-color:<?php echo $npcolour ?>;"></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    <div class="neckdiv">

                                        <span class="nbordersection" style="display:none;">
                                            <?php
                                                foreach($neckborder as $neckborder1)
                                                {
                                                $nbcolour = $neckborder1['neck_border_color'];
                                            ?>
                                            <p class="npbcolor colorblock" id="" alt="" style="background-color:<?php echo $nbcolour ?>;"></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    <div class="neckdiv">

                                        <span class="nbuttonsection" style="display:none;">
                                            <?php
                                                foreach($neckbuttons as $neckbuttons1)
                                                {
                                            ?>
                                            <p><img class="nbtns" src="<?php echo $neckbuttons1['neck_btnmain_img']; ?>" style="width:50px;" /></p>
                                            <?php } ?>
                                            <p><img class="nbtns" src="upload/neck/buttons/no-btn33.png" style="width:50px;border:1px solid #ccc; " /></p>
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
                                        
                                        <?php foreach($sleevelength as $sleevelength1){ ?>
                                        <span class="sleevessection">
                                            <p><img src="<?php echo $sleevelength1['attached_image']; ?>" alt="<?php echo $sleevelength1['length']; ?>" id="<?php echo $sleevelength1['length']; ?>" class="sleeves-sec" style="width:55px;"/><font><?php echo $sleevelength1['length']; ?></font></p>
                                        </span>
                                        <?php } ?>
                                        
                                    </div>
                             </div>
                       
                             <div id="sleeves_colorss" >
                                    <input type="hidden" name="npippingcolor" id="spippingcolor" value="" />
                                    <div class="sleevestitles" style="display:none;">
                                        
                                    <span class="sleevessections btnstyle" id="spcolor">Pipping</span>
                                    <span class="sleevessections btnstyle" id="sbordercolor" >Border</span>
                                    <span class="sleevessections btnstyle" id="sbuttons" >Buttons</span>
                                    <span class="sleevessections btnstyle" id="sembrdry" >Embroidery</span>
                                    </div>
                                    <input type="hidden" name="sbcolour" value="" id="sbcolour" />
                                    <input type="hidden" name="sbutns" value="" id="sbutns" />
                                    <input type="hidden" name="semb" value="" id="semb" />
                                    <div class="sleevesdiv">

                                        <span class="spippingsection" style="display:none;">
                                            <?php
                                                foreach($sleevepcolour as $sleevepcolour1)
                                                {
                                                $spcolour = $sleevepcolour1['pipping_color'];
                                            ?>
                                            <p class="spcolor colorblock" id="" alt="" style="background-color:<?php echo $spcolour ?>;"></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    <div class="sleevesdiv">

                                        <span class="sbordersection" style="display:none;">
                                            <?php
                                                foreach($sleevebcolour as $sleevebcolour1)
                                                {
                                                $sbcolour = $sleevebcolour1['border_color'];
                                            ?>
                                            <p class="spbcolor colorblock" id="" alt="" style="background-color:<?php echo $sbcolour ?>;"></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                                    <div class="sleevesdiv">

                                        <span class="sbuttonsection" style="display:none;">
                                            <?php
                                                foreach($sleevebutons as $sleevebutons1)
                                                {
                                            ?>
                                            <p><img class="sbtns" src="<?php echo $sleevebutons1['attached_image']; ?>" style="width : 25px;"/></p>
                                            <?php } ?>
                                            <p><img class="nbtns" src="upload/neck/buttons/no-btn33.png" style="width:25px;border:1px solid #ccc; " /></p>
                                        </span>
                                    </div>
                                    <div class="sleevesdiv">

                                        <span class="sembsection" style="display:none;">
                                            <?php
                                                foreach($sleevebutonsemb as $sleevebutonsemb1)
                                                {
                                                $slevemb = $sleevebutonsemb1['sleeve_emb_image'];
                                            ?>
                                           <p><img class="slevemb" src="<?php echo $slevemb; ?>" style="width : 100px;"/></p>
                                            <?php } ?>
                                        </span>
                                    </div>
                    </div>
       </div>  
      
      <!-- -------------------- SLEEVES SECTION OF KURTA ENDS HERE    ---------------------------- -->
                        
      
      
      
</div>
    

 </body>
        
<?php // echo $footer; ?>
