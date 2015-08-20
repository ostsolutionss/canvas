$(document).ready(function(){
 
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
    var screnprint = new Image();                 // Kurta Screen Print Image
    var neckimg = new Image();              // Neck Image
    var btnimg = new Image();               // Neck Buttons image     
    var sleevesbase = new Image();            // Sleeves Canvas2 background image
    var sleevlngth = new Image();           // Sleeves Length Image
    var slevfab = new Image();              // Sleeves Fabric image 
    var slevembimg = new Image();           // Sleeves Emb image
    var slevbtn = new Image();
    var bodyimg = new Image();              // Kurta Body Image
    var neckptrnimg = new Image();          // Kurta Neck Image
    var middleimg = new Image();            // Kurta Middle Image
    var neckbase = new Image();             // Neck Base image
    var klayer = new Image();               // Kurta Layer Image
    var necklayer = new Image();            // Neck Layer Image
    var armlines = new Image();             // Sleeeves Lines Image
    
    bodyimg.src     = "catalog/view/theme/default/image/canvasimgs/shirt_body.png";        // Body Image Source
    klayer.src      = "catalog/view/theme/default/image/Line_shape.png";
    middleimg.src   = "catalog/view/theme/default/image/canvasimgs/shirt_middle.png";        // Neck Image Source
    neckbase.src    = "catalog/view/theme/default/image/canvas2bg.png";
    neckptrnimg.src = "catalog/view/theme/default/image/canvasimgs/shirt_neck.png";        // Neck Image Source
    necklayer.src   = "catalog/view/theme/default/image/canvasimgs/shirt_neck_lines.png";    // NEck Layer Image
    sleevesbase.src = "catalog/view/theme/default/image/canvas2bg.png";                       // SLEEVES BASE IMAGE
    
    //armlines.src="catalog/view/theme/default/image/arms_lines.png";
    
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
    
    var slevfabric;                         // Global Variable for Sleeves fabric
    var dynmcimg2; 
    
    
    $("#proprice").val($("#totalprice").val());
    
     
    /*
     * 
     *  SCRIPT FOR FRONT KURTA CANVAS
     * 
     */
    
    
    
    
    
    
    window.onload=function()
    {
        pro_optionimg = $("#selectedoptionimg").val();
        optionid = $("#selectedoptionid").val();
        if( pro_optionimg != '')
        {
            kfab.src="image/"+pro_optionimg;
            $("#selectedpattern").val(kfab.src);
            $("#pro_option").val(optionid);
        }
        
        start();
        
        var sleeve_length = $(".sleeves-sec").attr('itemid');
        sleevlngth.src=sleeve_length;
            
        var sleeve_outline = $(".sleeves-sec").attr('itemtype');    
        armlines.src = sleeve_outline ;    
            
        slevfabric = $("#slevfab").val();
        if(slevfabric == '')
        {
                 slevfab.src=$("#selectedpattern").val();
        }
        
        newsleve();
        
        kfab.src =  $("#selectedpattern").val();
         
        neckcanvass();
    }                               // For main image
    kimg.src="catalog/view/theme/default/image/Kurta_new.png";
             
    
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
         neckcanvass(area,areapattrn);
         
         slevfab.src = dynmcimg2;
         newsleve(slevearea,sbcolor,spcolor);
                  
      });
      
      $(".sel-area").click(function()              // For front area selection
      {     
            var area = $(this).attr('alt');
            $("#sarea").val(area);
            var areapattrn= $("#areapattrn").val();
            start(area,areapattrn);
            neckcanvass(area,areapattrn);
      });          
    
      $(".digitalimg").click(function()           // For digital Designs
      {              
            var digi_img = $(this).attr('src');
            img3.src=digi_img;
            $("#areapattrn").val('digi');
            var area = $("#sarea").val();
            
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
            
            var nofillclas= $(this).attr('class').split(' ').pop();         // Get The last class name
            
            if(nofillclas == 'nofill')
            {
                $(".digitalsection").show();
                $("#shirtareas").hide();
            }   
            else
            {
                $(".digitalsection").hide();
                $("#shirtareas").show();
            }
            neckcanvass(area,'digi');
            start(area,'digi');
           
      });
      $(".embimg").click(function()               // For Front Emb. design
      {                   
            var emb_img = $(this).attr('src');
            img2.src=emb_img;
            $("#areapattrn").val('emb');
            var area = $("#sarea").val();
            
            if(area == '')
            {
                area = 'Full';
            }
            else
            {
                area = area;
            }
            var nofillclas= $(this).attr('class').split(' ').pop();         // Get The last class name
            
            if(nofillclas == 'nofill')
            {
                $("#shirtareas").hide();
                $(".embsection").show();
            }   
            else
            {
                $("#shirtareas").show();
                $(".embsection").hide();
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
            
            neckcanvass(area,'emb');
            start(area,'emb');
      });
      $(".block").click(function()                // For Front Bock Print Designs
      {
            var emb_img = $(this).attr('src');
            img4.src=emb_img;
            $("#areapattrn").val('block');
            var area = $("#sarea").val();
            
            if(area == '')
            {
                area = 'Full';
            }
            else
            {
                area = area;
            }
            
            
            var nofillclas= $(this).attr('class').split(' ').pop();         // Get The last class name
            
            if(nofillclas == 'nofill')
            {
                $("#shirtareas").hide();
                $(".blocksection").show();
            }   
            else
            {
                $("#shirtareas").show();
                $(".blocksection").hide();
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
            
            neckcanvass(area,'block');
            start(area,'block');
      });   
      
      $(".screenp").click(function()                // For Front Bock Print Designs
      {
            var screen_img = $(this).attr('src');
            screnprint.src=screen_img;
            $("#areapattrn").val('screen');
            var area = $("#sarea").val();
            
            if(area == '')
            {
                area = 'Full';
            }
            else
            {
                area = area;
            }
            
            var nofillclas= $(this).attr('class').split(' ').pop();         // Get The last class name
            
            if(nofillclas == 'nofill')
            {
                $("#shirtareas").hide();
                $(".screensection").show();
            }   
            else
            {
                $("#shirtareas").show();
                $(".screensection").hide();
            }
            
            
            var fabscrenid= $(this).attr("id");
            
            var fabcost =  $("#fabtotal").val();
            if(fabcost != '')
            {
                 var fabcost =  $("#fabtotal").val();
            }
            else
            {
                 var fabcost = 0;
            }
            
            var screencost = $("#fabscreenprice"+fabscrenid).text();
            var orgprice = $("#originalprice").val();

            var total_price = parseInt(fabcost) + parseInt(orgprice) + parseInt(screencost);
            
            $("#totalprice").val(total_price);
            $("#proprice").val(total_price);
            $("#fabtotal").val(fabcost);
            $("#fabembtotal").val(screencost);
            
            neckcanvass(area,'screen');
            start(area,'screen');
      }); 
    
      
      /*  -----------------    NECK  -------------------     */
   
    $(".neck-sec").click(function()             // For Neck Design Images
    {
            areapattrn = $("#areapattrn").val();
            area = $("#sarea").val();

            var neckstyle = $(this).attr('itemid');
            neckptrnimg.src=neckstyle; 
            
            var neck_outline = $(this).attr("itemtype");
            necklayer.src=neck_outline;
            
            $("#neckstyle").val(neckstyle);
            neckcanvass(area,areapattrn);
        
      });
   
    $('.nbtns').click(function()               // For Neck Buttons 
    {  
       
            var dynmcbtn= $(this).attr('src');  
            btnimg.src=dynmcbtn; 
            areapattrn = $("#areapattrn").val();
            area = $("#sarea").val();
            neckcanvass(area,areapattrn);
       
      });
      
      
    /* ------ SLEEVES ----------- */
   
    
      $(".sleeves-sec").click(function()         // For Sleeve Images     
      {
            var sleeve_length = $(this).attr('itemid');
            sleevlngth.src=sleeve_length;

            var sleeve_outline = $(this).attr('itemtype');    
            armlines.src = sleeve_outline ; 

            slevfabric = $("#slevfab").val();
            if(slevfabric == '')
            {
                 dynmcimg2 =  $("#selectedpattern").val();
                  slevfab.src=dynmcimg2;
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
            if(type == 'screen')
            {
                 var pattern1 = ctx.createPattern(screnprint, 'repeat');
                 
            }
            
            if(area == 'Full')  
            { 
                var rectangle = new Path2D();
                rectangle.rect(0, 0, canvas.width, canvas.height);
                ctx.fillStyle = pattern1;
                ctx.fill(rectangle);
            }
            if(area == 'Middle')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(105, 0, 85, 900);
                ctx.fillStyle = pattern1;
                ctx.fill(rectangle);
            }
            if(area == 'Body')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(0, 0, 900, 150);
                ctx.fillStyle = pattern1;
                ctx.fill(rectangle);
            }
            if(area == 'Neck')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(105, 0, 85, 150);
                ctx.fillStyle = pattern1;
                ctx.fill(rectangle);
            }
            
            
            
        
            ctx.drawImage(klayer,0,0);
        
      
            var dataURL = canvas.toDataURL();
            $("#frnt_img_val").val(dataURL); 
    }
    
    
    function neckcanvass(area,type)
    {
        var neckcanvas = document.getElementById("neckcanvas");
        var ctxneck  = neckcanvas.getContext("2d");
        ctxneck.imageSmoothingEnabled = 'true';
        ctxneck.drawImage(neckbase,0,0);
        
        ctxneck.globalCompositeOperation="destination-atop";
        ctxneck.globalAlpha=.99;
        
        if(neckptrnimg.src != '')
        {
            ctxneck.drawImage(neckptrnimg,0,0);
            ctxneck.globalCompositeOperation="source-atop";
            ctxneck.globalAlpha=.99;
        }
        if(kfab.src != '')
        {
            var pattern = ctxneck.createPattern(kfab, 'repeat');
            ctxneck.rect(0, 0, neckcanvas.width, neckcanvas.height);
            ctxneck.fillStyle = pattern;
            ctxneck.fill();
        }
        if(type == 'digi' )
            {
                var pattern1 = ctxneck.createPattern(img3, 'repeat');
                
            }
            if(type == 'emb')
            {
                 var pattern1 = ctxneck.createPattern(img2, 'repeat');
                 
            }
            if(type == 'block')
            {
                 var pattern1 = ctxneck.createPattern(img4, 'repeat');
                 
            }
           
            if(type == 'screen')
            {
                 var pattern1 = ctxneck.createPattern(screnprint, 'repeat');
                 
            }
            
            if(area == 'Full')   
            { 
                var rectangle = new Path2D();
                rectangle.rect(0, 0, neckcanvas.width, neckcanvas.height);
                ctxneck.fillStyle = pattern1;
                ctxneck.fill(rectangle);
            }
            if(area == 'Middle')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(105, 0, 85, 900);
                ctxneck.fillStyle = pattern1;
                ctxneck.fill(rectangle);
            }
            if(area == 'Body')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(0, 0, 900, 150);
                ctxneck.fillStyle = pattern1;
                ctxneck.fill(rectangle);
            }
            if(area == 'Neck')  
            {  
                var rectangle = new Path2D();
                rectangle.rect(105, 0, 85, 150);
                ctxneck.fillStyle = pattern1;
                ctxneck.fill(rectangle);
            }
            
            
           
            ctxneck.drawImage(klayer,0,0);
        
            if(btnimg.src != '')
             {
                ctxneck.drawImage(btnimg, 53, 85, 15, 15);
                ctxneck.drawImage(btnimg, 53, 99, 15, 15);
                ctxneck.drawImage(btnimg, 53, 115, 15, 15);
             }

            ctxneck.drawImage(necklayer,0,0);
        
         /* $('.reset').click(function() {
               // alert("ho");
                ctxneck.clearRect(0, 0, neckcanvas.width, neckcanvas.height);
            }); */
        
        $('#frontcanvascontainer').html2canvas({
            onrendered: function (canvas) {
                $('#frnt_img_val').val(canvas.toDataURL("image/png"));
            }
        });
              
    }
    
    
    function newsleve(slevearea,sbcolor,spcolor)                    // Function to draw sleeves images
    {
            var sleevescanvas=document.getElementById("frontcanvas");
            var ctxsleeves=sleevescanvas.getContext("2d");
            ctxsleeves.imageSmoothingEnabled = 'true';
            ctxsleeves.drawImage(sleevesbase, 0, 0);                        // Canvas2 background image
            ctxsleeves.globalCompositeOperation="destination-atop";
            ctxsleeves.globalAlpha=.99; 

           // alert(sleevlngth.src);
            if(sleevlngth.src != '')                                // Draw Sleeve Length Images
            {
           //  alert(sleevlngth.src);
             //ctx2.drawImage(sleevlngth,12,0);
              ctxsleeves.drawImage(sleevlngth,0,0);
              ctxsleeves.globalCompositeOperation="source-atop";
              ctxsleeves.globalAlpha=.99; 
            }
             if(slevfab.src != '')                                   // Fill Sleeve Fabric and color patterns 
            {
                var patternsfab = ctxsleeves.createPattern(slevfab, 'repeat');
                ctxsleeves.rect(0,0,sleevescanvas.width,sleevescanvas.height);
                ctxsleeves.fillStyle = patternsfab; 
                ctxsleeves.fill();

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
                    ctxsleeves.fillStyle = oRec.fill;
                    ctxsleeves.fillRect(oRec.x, oRec.y, oRec.w, oRec.h);

                }

            }


            if(slevembimg.src != '')                                     // Fill Sleeves emb. patterns
            {
                var pattern = ctxsleeves.createPattern(slevembimg, 'repeat');
                ctxsleeves.rect(50, 12, 320, 400);
                ctxsleeves.fillStyle = pattern;
                ctxsleeves.fill();
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
                    ctxsleeves.fillStyle = oRec.fill;
                    ctxsleeves.fillRect(oRec.x, oRec.y, oRec.w, oRec.h);

                }

            }

            if(slevbtn.src != '')               // For sleeve btn images 
            {
                ctxsleeves.drawImage(slevbtn,82, 175, 15, 15 );
                ctxsleeves.drawImage(slevbtn,340, 162, 15, 15);
            }
            /*
            $('.reset').click(function() {
           // alert("ho");
                ctx2.clearRect(0, 0, canvas2.width, canvas2.height);
            });

            */
           
            ctxsleeves.drawImage(armlines, 0,0);
            
            $('#frontcanvascontainer').html2canvas({
                    onrendered: function (canvas) {
                        $('#frnt_img_val').val(canvas.toDataURL("image/png"));
                    }
            }); 
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
        $(".sel-area").addClass("digiarea");            // Add Class to the area images
        $(".sel-area").removeClass("embarea").removeClass("blockarea").removeClass("screenparea");            // Remove Class to the area images
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
    
    $("#frontdigital").click(function(){
        $("#shirtareas").hide();
        $(".embsection").hide();
        $(".digitalsection").show();
        $(".blocksection").hide();
        $(".screensection").hide();
        $(".sel-area").addClass("digiarea");            // Add Class to the area images
        $(".sel-area").removeClass("embarea").removeClass("blockarea").removeClass("screenparea");            // Remove Class to the area images
    
    });
    $("#frontemb").click(function(){
        $("#shirtareas").hide();
        $(".embsection").show();
        $(".digitalsection").hide();
        $(".blocksection").hide();
        $(".screensection").hide();
        $(".sel-area").addClass("embarea");            // Add Class to the area images
        $(".sel-area").removeClass("digiarea").removeClass("blockarea").removeClass("screenparea");            // Remove Class to the area images
    });
    $("#frontblock").click(function(){
        $("#shirtareas").hide();
        $(".embsection").hide();
        $(".digitalsection").hide();
        $(".blocksection").show();
        $(".screensection").hide();
        $(".sel-area").addClass("blockarea");            // Add Class to the area images
        $(".sel-area").removeClass("digiarea").removeClass("embarea").removeClass("screenparea");            // Remove Class to the area images
    });
    $("#frontscreenprint").click(function(){
        $("#shirtareas").hide();
        $(".embsection").hide();
        $(".digitalsection").hide();
        $(".blocksection").hide();
        $(".screensection").show(); 
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