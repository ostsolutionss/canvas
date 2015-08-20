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
</head>
<body class="<?php echo $class; ?>">
<header>
            <div class="head2">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="cart">
                                <ul class="loginheader">
                                    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><img src="catalog/view/theme/default/image/images/login_icon.png" alt=""/></a>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                          <?php if ($logged) { ?>
                                          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                          <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                          <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                          <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                          <?php } else { ?>
                                          <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                          <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                          <?php } ?>
                                        </ul>
                                    </li>
                                    <li id="wishlist-total"><a href="<?php echo $wishlist; ?>"  title="<?php echo $text_wishlist; ?>"> <img src="catalog/view/theme/default/image/images/hart_icon.png" alt=""/>  </a><font><?php echo $text_wishlist; ?></font></li>
                                    <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"> <img src="catalog/view/theme/default/image/images/cart_icon.png" alt=""/> </a><font><?php echo $text_items; ?></font></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row headrow2">
                        <div class="col-md-2">
                            <div class="logo">
                                <a href="<?php echo $home; ?>"> <img src="catalog/view/theme/default/image/images/logo_img.png" alt=""/> </a>
                            </div>
                        </div>
                        <ul class="">
                             <li><a href="index.php?route=account/register">Register</a></li>
                             <li><a href="index.php?route=account/login">Login</a></li>
                             <li><a href="index.php?route=product/category&path=65_66">Shop</a></li>
                        </ul>
                        <!-- <div class="col-md-2 search_next_2">
                            <div class="search_next">
                                <ul>
                                    <li class="">
                                        <?php echo $search; ?>
                                    </li>
                                </ul>
                    </div>
                    <div class="search">
                        <ul class="loginheader">
                            <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><img src="catalog/view/theme/default/image/images/login_icon.png" alt=""/></a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                  <?php if ($logged) { ?>
                                  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                  <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                  <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                  <?php } else { ?>
                                  <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                  <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                  <?php } ?>
                                </ul>
                            </li>
                            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"> <img src="catalog/view/theme/default/image/images/hart_icon.png" alt=""/>  </a><font><?php echo $text_wishlist; ?></font></li>
                            <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"> <img src="catalog/view/theme/default/image/images/cart_icon.png" alt=""/></a><font><?php echo $text_items; ?></font> </li>
                            <li> <img class="top-search" src="catalog/view/theme/default/image/images/search_img.png" alt="">
                                <div class="search-bar">
                                    <?php echo $search; ?>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>-->
           <!--      <div class="col-md-8">
                    <div class="navigation">
                        <nav class="uk-navbar">
                            <ul class="uk-navbar-nav uk-hidden-small">
                                 <?php if ($categories) { ?>
                                <?php foreach ($categories as $category) { ?>
                                <?php if ($category['children']) { ?>
                                <li class="uk-parent" data-uk-dropdown>
                                    <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
                                        <?php echo $category['name']; ?><i class="uk-icon-caret-down"></i>
                                    </a>
                                  <div class="uk-dropdown uk-dropdown-navbar">
                                    <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                      <ul class="uk-nav uk-nav-navbar">
                                        <?php foreach ($children as $child) { ?>
                                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                        <?php } ?>
                                      </ul>
                                      <?php } ?>
                                  </div>
                                </li>
                                <?php } else { ?>
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                                <?php } ?>
                                <?php } ?>
                                <?php } ?>
                                <li><a href="index.php?route=information/contact">CONTACT</a></li>
                             </ul>
                            
                            <a href="#offcanvas" class="uk-navbar-toggle uk-visible-small" data-uk-offcanvas></a>
                        </nav>
                    </div>
                </div> -->
                <!-- <div class="col-md-2 search_next_3">
                    <div class="search_next">
                        <ul>
                            <li class=""> 
                                <?php echo $search; ?>
                            </li>
                        </ul>
                    </div> --> 
           <!--  <div class="search">
                <ul class="loginheader">
                    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><img src="catalog/view/theme/default/image/images/login_icon.png" alt=""/></a>
                        <ul class="dropdown-menu dropdown-menu-right">
                          <?php if ($logged) { ?>
                          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                          <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                          <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                          <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                          <?php } else { ?>
                          <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                          <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                          <?php } ?>
                        </ul>
                    </li>
                    <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"> <img src="catalog/view/theme/default/image/images/hart_icon.png" alt=""/> </a><font><?php echo $text_wishlist; ?></font>  </li>
                    <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><img src="catalog/view/theme/default/image/images/cart_icon.png" alt=""/></a><font><?php echo $text_items; ?></font>  </li>
                    <li> <img class="top-search" src="catalog/view/theme/default/image/images/search_img.png" alt="">
                        <div class="search-bar">
                            <?php echo $search; ?>
                        </div>
                    </li>
                </ul>
            </div> -->
        </div>
    </div>
</div>
</div>
</header>
<div class="clearfix"></div>
