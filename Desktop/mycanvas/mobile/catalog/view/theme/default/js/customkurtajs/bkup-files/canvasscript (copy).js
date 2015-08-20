$(document).ready(function(){
//$(function(){

    
     /*   ---------------- CHANGE SHIRT PATTERN STARTS -------------       */
    
    
    /*
     * 
     *  IMAGE OBJECTS
     * 
     */
    
    var kimg = new Image();                 // Main Kurta image
    var kfab  = new Image();                 // Kurta fabric pattern
    var img2 = new Image();                 // Kurta Emb Image
    var img3 = new Image();                 // Kurta Digital Design image
    var img4 = new Image();                 // Kurta Block Print Image
    var img5 = new Image();                 // Kurta Screen Print Image
    var neckimg = new Image();              // Neck Image
    var btnimg = new Image();               // Neck Buttons image     
    var canvas2bg = new Image();            // Sleeves Canvas2 background image
    var sleevlngth = new Image();           // Sleeves Length Image
    var slevfab = new Image();              // Sleeves Fabric image 
    var slevembimg = new Image();           // Sleeves Emb image
    var slevbtn = new Image();
    
    
    /*
     * 
     *  Global Variables 
     * 
     */
    
    var pro_optionimg;                       // Dynamic selected Option image
    var optionid;                           // Option id                    
    var area;                               // Area of Shirt
    var areaclass;                          // Class Area
    var areapattrn;                         // Area Pattern 
    var faid;                               // Fabric Id
    
    var slevearea;                          // Gloabal variable for Sleeve border/pipping
    var sbcolor;                            // Global Variable for Sleeves border color
    var spcolor;                            // Global Variable for Sleeves Pipping color
    
    $("#proprice").val($("#totalprice").val());
    
    
    /*
     * 
     *  SCRIPT FOR FRONT KURTA CANVAS
     * 
     */
    
    
    kimg.onload=function()
    {
        pro_optionimg = $("#selectedoptionimg").val();
        optionid = $("#selectedoptionid").val();
        if(pro_optionimg !== '')
        {
            kfab.src="image/"+pro_optionimg;
            $("#selectedpattern").val(kfab.src);
            $("#pro_option").val(optionid);
        }
        start();
    }                               // For main image
     kimg.src="catalog/view/theme/default/image/shirt.png";
             
    
    $('.img1').click(function()                  // For kurta pattern image
     {  
        area  = $("#sarea").val();
        areapattrn= $("#areapattrn").val();
        
        var dynmcimg2= $(this).attr('src');  
        $("#selectedpattern").val(dynmcimg2);
        
        kfab.src=dynmcimg2; 
        
        var fabid= $(this).attr("alt");
        $("#pro_option").val(fabid);
        
        var fabcost = $("#fabprice"+fabid).text();
        var embprice =  $("#fabembtotal").val();
        if(embprice != '')
        {
             var embprice =  $("#fabembtotal").val();
        }
        else
        {
              var embprice= 0;
        }
        var orgprice = $("#originalprice").val();
        
        var total_price = parseInt(fabcost) + parseInt(orgprice) + parseInt(embprice);
         
         $("#totalprice").val(total_price); 
         $("#proprice").val(total_price);
         $("#fabtotal").val(fabcost);
         $("#fabembtotal").val(embprice);
         
         start(area,areapattrn);
      });
      
    $( ".sel-area" ).click(function()
    {     
            area = $(this).attr('alt');
            areaclass = $(this).attr('class').split(' ').pop();         // Get The last class name
            
            if(areaclass == 'digiarea')
            {
                  $("#digitalarea").val(area);
                  areapattrn= $("#digipattrn").val();
                  $(".digitalsection").show();
                  $("#shirtareas").hide();
                  $(".embsection").hide();
                  $(".blocksection").hide();
                  $(".screensection").hide(); 
            }
            if(areaclass == 'embarea')
            {
                  $("#embarea").val(area);
                  areapattrn= $("#embpattrn").val();
                  $("#shirtareas").hide();
                  $(".embsection").show();
                  $(".digitalsection").hide();
                  $(".blocksection").hide();
                  $(".screensection").hide();
            }
            if(areaclass == 'blockarea')
            {
                  $("#blockparea").val(area);
                  areapattrn= $("#blockpattrn").val();
                  $("#shirtareas").hide();
                  $(".embsection").hide();
                  $(".digitalsection").hide();
                  $(".blocksection").show();
                  $(".screensection").hide();
            }
            if(areaclass == 'screenparea')
            {
                  $("#screenarea").val(area);
                  areapattrn= $("#screenpattrn").val();
                  $("#shirtareas").hide();
                  $(".embsection").hide();
                  $(".digitalsection").hide();
                  $(".blocksection").hide();
                  $(".screensection").show();
            }
            
           
            
            
          //  start(area,areapattrn);
            
      }); 
    
     $(".digitalimg").click(function()           // For digital Designs
      {              
            var digi_img = $(this).attr('src');
            img3.src=digi_img;
            $("#digipattrn").val('digi');
            area = $("#digitalarea").val();
            
            if(area == '')
            {
                 area = 'Full';
            }
            else
            {
                 area = area;
            }
            
            var fabdigid= $(this).attr("id");
            
            var fabcost =  $("#fabtotal").val();
            if(fabcost != '')
            {
                 var fabcost =  $("#fabtotal").val();
            }
            else
            {
                 var fabcost = 0;
            }
            
            var digicost = $("#fabdigiprice"+fabdigid).text();
            var orgprice = $("#originalprice").val();

            var total_price = parseInt(fabcost) + parseInt(orgprice) + parseInt(digicost);
            
            $("#totalprice").val(total_price);
            $("#proprice").val(total_price);
            $("#fabtotal").val(fabcost);
            $("#fabembtotal").val(digicost);
            
            start(area,'digi');
        
      });
      
      $(".embimg").click(function()               // For Front Emb. design
      {                   
            var emb_img = $(this).attr('src');
            img2.src=emb_img;
            $("#embpattrn").val('emb');
            area = $("#embarea").val();
            
            if(area == '')
            {
                 area = 'Full';
            }
            else
            {
                 area = area;
            }
            
            var fabembid= $(this).attr("id");
            
            var fabcost =  $("#fabtotal").val();
            if(fabcost != '')
            {
                 var fabcost =  $("#fabtotal").val();
            }
            else
            {
                 var fabcost = 0;
            }
            
            var embcost = $("#fabembprice"+fabembid).text();
            var orgprice = $("#originalprice").val();

            var total_price = parseInt(fabcost) + parseInt(orgprice) + parseInt(embcost);
            
            $("#totalprice").val(total_price);
            $("#proprice").val(total_price);
            $("#fabtotal").val(fabcost);
            $("#fabembtotal").val(embcost);
            
            start(area,'emb');
      });
      
      $(".block").click(function()                // For Front Bock Print Designs
      {
            var emb_img = $(this).attr('src');
            img4.src=emb_img;
            $("#blockpattrn").val('block');
            area = $("#blockparea").val();
            
            
            if(area == '')
            {
                 area = 'Full';
            }
            else
            {
                 area = area;
            }
            
            var fabblockid= $(this).attr("id");
            
            var fabcost =  $("#fabtotal").val();
            if(fabcost != '')
            {
                 var fabcost =  $("#fabtotal").val();
            }
            else
            {
                 var fabcost = 0;
            }
            
            var blockcost = $("#fabblockprice"+fabblockid).text();
            var orgprice = $("#originalprice").val();

            var total_price = parseInt(fabcost) + parseInt(orgprice) + parseInt(blockcost);
            
            $("#totalprice").val(total_price);
            $("#proprice").val(total_price);
            $("#fabtotal").val(fabcost);
            $("#fabembtotal").val(blockcost);
            
            start(area,'block');
      });
      
      $(".screenp").click(function()                // For Front Bock Print Designs
      {
            var scren_img = $(this).attr('src');
            img5.src=scren_img;
            $("#screenpattrn").val('scren');
            area = $("#screenarea").val();
            
            
            if(area == '')
            {
                 area = 'Full';
            }
            else
            {
                 area = area;
            }
            
            var fabblockid= $(this).attr("id");
            
            var fabcost =  $("#fabtotal").val();
            if(fabcost != '')
            {
                 var fabcost =  $("#fabtotal").val();
            }
            else
            {
                 var fabcost = 0;
            }
            
            var blockcost = $("#fabscreenprice"+fabblockid).text();
            var orgprice = $("#originalprice").val();

            var total_price = parseInt(fabcost) + parseInt(orgprice) + parseInt(blockcost);
            
            $("#totalprice").val(total_price);
            $("#proprice").val(total_price);
            $("#fabtotal").val(fabcost);
            $("#fabembtotal").val(blockcost);
            
            start(area,'screen');
      });
      
      /*  -----------------    NECK  -------------------     */
   
      $(".neck-sec").click(function()             // For Neck Design Images
      {
            $(".necktitles").show('slow');
            areapattrn = $("#areapattrn").val();
            area = $("#sarea").val();

            var neckstyle = $(this).attr('src');
            neckimg.src=neckstyle; 
            $("#neckstyle").val(neckstyle);

            start(area,areapattrn);
        
      });
   
      $('.nbtns').click(function()               // For Neck Buttons 
      {  
       
            var dynmcbtn= $(this).attr('src');  
            btnimg.src=dynmcbtn; 
            areapattrn = $("#areapattrn").val();
            area = $("#sarea").val();
            start(area,areapattrn);
       
      });
    
    
     function start(area,type)                               // Start main Function for Kurta Front Opertaions
      {
        var canvas=document.getElementById("canvas");
        var ctx=canvas.getContext("2d");
        ctx.imageSmoothingEnabled = 'true';
        ctx.drawImage(kimg,0,0);
        ctx.globalCompositeOperation="source-atop";
        ctx.globalAlpha=.99; 
       
        if(kfab.src != '')
        {
            var pattern = ctx.createPattern(kfab, 'repeat');
            ctx.rect(0, 0, canvas.width, canvas.height);
            ctx.fillStyle = pattern;
            ctx.fill();
        }
        
        var pattern1;
        var rectangle = new Path2D();

        if(type == 'digi'&& area == 'Full')
        {
            pattern1 = ctx.createPattern(img3, 'repeat');
            rectangle.rect(0, 0, canvas.width, canvas.height);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);

        }
        if(type == 'digi'&& area == 'Middle')
        {
            pattern1 = ctx.createPattern(img3, 'repeat');
            rectangle.rect(50, 0, 70, 900);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);

        }
        if(type == 'digi'&& area == 'Body')
        {
            pattern1 = ctx.createPattern(img3, 'repeat');
            rectangle.rect(2, 2, 600, 110);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);

        }
        if(type == 'digi'&& area == 'Neck')
        {
            pattern1 = ctx.createPattern(img3, 'repeat');
            rectangle.rect(45, 0, 80, 100);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);

        }
        
        
        if(type == 'emb' && area == 'Full')  
        { 
            pattern1 = ctx.createPattern(img2, 'repeat');
            rectangle.rect(0, 0, canvas.width, canvas.height);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);
        }
        if(type == 'emb' && area == 'Middle')  
        { 
            pattern1 = ctx.createPattern(img2, 'repeat');
            rectangle.rect(50, 0, 70, 900);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);
        }
        if(type == 'emb' && area == 'Body')  
        { 
            pattern1 = ctx.createPattern(img2, 'repeat');
            rectangle.rect(2, 2, 600, 110);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);
        }
        if(type == 'emb' && area == 'Neck')  
        { 
            pattern1 = ctx.createPattern(img2, 'repeat');
            rectangle.rect(45, 0, 80, 100);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);
        }
        
        
        
        
        if(type == 'block' && area == 'Full')
        {
             pattern1 = ctx.createPattern(img4, 'repeat');
             rectangle.rect(0, 0, canvas.width, canvas.height);
             ctx.fillStyle = pattern1;
             ctx.fill(rectangle);

        }
        if(type == 'block' && area == 'Middle')
        {
             pattern1 = ctx.createPattern(img4, 'repeat');
             rectangle.rect(50, 0, 70, 900);
             ctx.fillStyle = pattern1;
             ctx.fill(rectangle);

        }
        if(type == 'block' && area == 'Body')
        {
             pattern1 = ctx.createPattern(img4, 'repeat');
             rectangle.rect(50, 0, 70, 900);
             ctx.fillStyle = pattern1;
             ctx.fill(rectangle);

        }
        if(type == 'block' && area == 'Neck')
        {
             pattern1 = ctx.createPattern(img4, 'repeat');
             rectangle.rect(45, 0, 80, 100);
             ctx.fillStyle = pattern1;
             ctx.fill(rectangle);

        }
        
        
        if(type == 'screen' && area == 'Full')
        {
             pattern1 = ctx.createPattern(img5, 'repeat');
             rectangle.rect(0, 0, canvas.width, canvas.height);
             ctx.fillStyle = pattern1;
             ctx.fill(rectangle);

        }
        
        if(type == 'screen' && area == 'Middle')
        {
            pattern1 = ctx.createPattern(img5, 'repeat');
            rectangle.rect(50, 0, 70, 900);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);


        }
        if(type == 'screen' && area == 'Body')  
        {  
            pattern1 = ctx.createPattern(img5, 'repeat');
            rectangle.rect(2, 2, 600, 110);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);

        }
        if(type == 'screen' && area == 'Neck')  
        {  
            pattern1 = ctx.createPattern(img5, 'repeat');
            rectangle.rect(45, 0, 80, 100);
            ctx.fillStyle = pattern1;
            ctx.fill(rectangle);
        }
        
         /*    DRAW NECK IMAGE ON CANVAS    */
          
         if(neckimg.src != '')
         {
             ctx.drawImage(neckimg, 35, 10, 105, 142);  
         }
         /*    DRAW NECK BUTTONS IMAGE ON CANVAS    */

         if(btnimg.src != '')
         {
            ctx.drawImage(btnimg, 80, 60, 15, 15);
            ctx.drawImage(btnimg, 80, 75, 15, 15);
            ctx.drawImage(btnimg, 80, 91, 15, 15);
         }
            
          var dataURL = canvas.toDataURL();
         $("#frnt_img_val").val(dataURL); 
    }
    
    
    /*
     * 
     *      MENUS CLICKS
     * 
     */
    
    
    $("#fabric").click(function(){
        $(".fabriccontainer").show();
        $(".frontcontainer").hide();
        $(".neckcontainer").hide();
        $(".sleevescontainer").hide();
        $(".backcontainer").hide();
        $(".bottomcontainer").hide();
    });
    $("#front").click(function(){
        $(".fabriccontainer").hide();
        $(".frontcontainer").show();
        $(".neckcontainer").hide();
        $(".sleevescontainer").hide();
        $(".backcontainer").hide();
        $(".bottomcontainer").hide();
    });
    $("#neck").click(function(){
        $(".fabriccontainer").hide();
        $(".frontcontainer").hide();
        $(".neckcontainer").show();
        $(".sleevescontainer").hide();
        $(".backcontainer").hide();
        $(".bottomcontainer").hide();
    });
    $("#sleeves").click(function(){
        $(".fabriccontainer").hide();
        $(".frontcontainer").hide();
        $(".neckcontainer").hide();
        $(".sleevescontainer").show();
        $(".backcontainer").hide();
        $(".bottomcontainer").hide();
    });
    $("#back").click(function(){
        $(".fabriccontainer").hide();
        $(".frontcontainer").hide();
        $(".neckcontainer").hide();
        $(".sleevescontainer").hide();
        $(".backcontainer").show();
        $(".bottomcontainer").hide();
    });
    $("#bottom").click(function(){
        $(".fabriccontainer").hide();
        $(".frontcontainer").hide();
        $(".neckcontainer").hide();
        $(".sleevescontainer").hide();
        $(".backcontainer").hide();
        $(".bottomcontainer").show();
    });
    
    /*  MAIN TOP MENU  ENDS HERE    */
    
    /*$("#frontarea").click(function(){
        $("#shirtareas").show();
        $(".embsection").hide();
        $(".digitalsection").hide();
        $(".blocksection").hide();
        $(".screensection").hide();
    });*/
    $("#frontdigital").click(function(){
        $("#shirtareas").show();
        $(".embsection").hide();
        $(".digitalsection").hide();
        $(".blocksection").hide();
        $(".screensection").hide();
        
        $(".sel-area").addClass("digiarea");            // Add Class to the area images
        $(".sel-area").removeClass("embarea").removeClass("blockarea").removeClass("screenparea");            // Remove Class to the area images
    
    });
    $("#frontemb").click(function(){
        $("#shirtareas").show();
        $(".embsection").hide();
        $(".digitalsection").hide();
        $(".blocksection").hide();
        $(".screensection").hide();
        
        $(".sel-area").addClass("embarea");            // Add Class to the area images
        $(".sel-area").removeClass("digiarea").removeClass("blockarea").removeClass("screenparea");            // Remove Class to the area images
    });
    $("#frontblock").click(function(){
        $("#shirtareas").show();
        $(".embsection").hide();
        $(".digitalsection").hide();
        $(".blocksection").hide();
        $(".screensection").hide();
        
        $(".sel-area").addClass("blockarea");            // Add Class to the area images
        $(".sel-area").removeClass("digiarea").removeClass("embarea").removeClass("screenparea");            // Remove Class to the area images
    });
    $("#frontscreenprint").click(function(){
        $("#shirtareas").show();
        $(".embsection").hide();
        $(".digitalsection").hide();
        $(".blocksection").hide();
        $(".screensection").hide(); 
        
        $(".sel-area").addClass("screenparea");            // Add Class to the area images
        $(".sel-area").removeClass("digiarea").removeClass("blockarea").removeClass("embarea");            // Remove Class to the area images
    });
    
    /*  FRONT SECTION ENDS HERE   */
    
    $("#neckstyle").click(function(){
        $(".nstylesection").show();
        $(".npippingsection").hide();
        $(".nbordersection").hide();
        $(".nbuttonsection").hide();
    });
    $("#neckpipping").click(function(){
        $(".nstylesection").hide();
        $(".npippingsection").show();
        $(".nbordersection").hide();
        $(".nbuttonsection").hide();
    });
    $("#neckborder").click(function(){
        $(".nstylesection").hide();
        $(".npippingsection").hide();
        $(".nbordersection").show();
        $(".nbuttonsection").hide();
    });
    $("#neckbuttons").click(function(){
        $(".nstylesection").hide();
        $(".npippingsection").hide();
        $(".nbordersection").hide();
        $(".nbuttonsection").show();
    });
    
   /*    NECK SECTION ENDS HERE   */
    
    $("#sleevlength").click(function(){
        $("#shirtsstyle").show();
        $(".slvfabric").hide();
        $(".sbordersection").hide();
        $(".sembsection").hide();
        $(".spippingsection").hide();
        $(".sbuttonsection").hide();
    });
    $("#sleevfabric").click(function(){
        $("#shirtsstyle").hide();
        $(".slvfabric").show();
        $(".sbordersection").hide();
        $(".sembsection").hide();
        $(".spippingsection").hide();
        $(".sbuttonsection").hide();
    });
    $("#sleevemb").click(function(){
        $("#shirtsstyle").hide();
        $(".slvfabric").hide();
        $(".sbordersection").hide();
        $(".sembsection").show();
        $(".spippingsection").hide();
        $(".sbuttonsection").hide();
    });
    $("#sleevborder").click(function(){
        $("#shirtsstyle").hide();
        $(".slvfabric").hide();
        $(".sbordersection").show();
        $(".sembsection").hide();
        $(".spippingsection").hide();
        $(".sbuttonsection").hide();
    });
    $("#sleevpiping").click(function(){
        $("#shirtsstyle").hide();
        $(".slvfabric").hide();
        $(".sbordersection").hide();
        $(".sembsection").hide();
        $(".spippingsection").show();
        $(".sbuttonsection").hide();
    });
    $("#sleevbuttons").click(function(){
        $("#shirtsstyle").hide();
        $(".slvfabric").hide();
        $(".sbordersection").hide();
        $(".sembsection").hide();
        $(".spippingsection").hide();
        $(".sbuttonsection").show();
    });
    
});    