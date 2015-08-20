<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,400italic,700italic,600italic,300' rel='stylesheet' type='text/css'>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/default/stylesheet/uikit.min.css" rel="stylesheet" />
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- <script type="text/javascript" src="catalog/view/theme/default/js/mobile/swiper.min.js"></script> -->
<!-- <script type="text/javascript" src="catalog/view/theme/default/js/mobile/jquery.mobile-1.4.5.min.js"></script> -->
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!--<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />-->
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link href="catalog/view/theme/default/stylesheet/templatestyle.css" rel="stylesheet">
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
 <!-- mobile -->
 <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/mobile/jquery.mobile-1.4.5.min.css"><!-- 
    <link rel="stylesheet" href="css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/mobile/swiper.min.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/mobile/font-awesome.min.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/mobile/style.css">
 <!-- mobile -->       
</head>
<body scroll="no">
  <div class="wrap-contaner">
      <!-- ======================================================= header ================================================== -->
      <div class="container">
        <header>
          <div class="header-top">




          <div class="ui-grid-solo">
    <div class="ui-block-a">
    <div class="ui-bar ui-bar-a">
              <div class="logo">
               <a href="<?php echo $base;?>">
                  <img src="catalog/view/theme/default/images/logo.png" alt="">
                </a>
                                </div>
    <div class="search">
                  <a class="top-search" href="#">
                  <i class="fa fa-search"></i></a>
                </div>
                <div class="search-bar">
                  <input type="text" name="" value="" placeholder="Search">
                </div>

    </div></div>
   <!--  <div class="ui-block-b"><div class="ui-bar ui-bar-a">
                                 

    </div></div> -->
</div><!-- /grid-a -->



            <!-- <div class="row">
              <div class="col-xs-12">
                <div class="logo">
                  <img src="images/logo.png" alt="">
                </div>
                <div class="search">
                  <a class="top-search" href="#">
                  <i class="fa fa-search"></i></a>
                </div>
                <div class="search-bar">
                  <input type="text" name="" value="" placeholder="Search">
                </div>
              </div>
            </div> -->
          </div>
         </header>
      </div>
