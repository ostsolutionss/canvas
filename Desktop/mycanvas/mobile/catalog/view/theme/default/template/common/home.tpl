<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title></title>
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,400italic,700italic,600italic,300' rel='stylesheet' type='text/css'>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/mobile/jquery.mobile-1.4.5.min.css">
		<script type="text/javascript" src="catalog/view/theme/default/js/mobile/swiper.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/mobile/jquery.mobile-1.4.5.min.js"></script><!-- 
    <link rel="stylesheet" href="css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/mobile/swiper.min.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/mobile/font-awesome.min.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/mobile/style.css">
	</head>
 
<body scroll="no">
		
		<div class="front-wrap-contaner">
				<div class="content">
					
				<div class="front-logo">
				
					<img src="<?php echo $base;?>catalog/view/theme/default/images/logo.png" alt="">
				
				</div>
				<div class="desc">
				<p>Lorem Ipsum is simply dummy text</p>
				</div>
				<div class="center-logo">
				<a href="#"><img src="<?php echo $base;?>catalog/view/theme/default/images/u773.png" alt=""></a>
				</div>
				<span>
				<a class="shop-now" href="index.php?route=product/category/products&path=65_66">Shop Now</a>
				</span>
				<?php if ($logged) { ?>
							<div class="register">
					<a href="index.php?route=account/account" title="" class="register">My Account</a>
				</div>
				<div class="forgot">
					<a href="index.php?route=account/logout" title="" class="forgot">Logout</a>
				</div>
				<?php } else{ ?>
							<div class="register">
					<a href="index.php?route=account/login" title="" class="register">Login</a>
				</div>
				<div class="forgot">
					<a href="index.php?route=account/register" title="" class="forgot">Register Now</a>
				</div>
				<?php }?>
			
				</div>
				<footer>
					<p class="copyright">Lorem Ipsum has been the industry's standard </p>	
				</footer>
		</div>
		
		<script type="text/javascript">
		$(function(){
			$("a").click(function(){
				var url = $(this).attr('href');
				window.location= url;
			});	
		});
		</script>
								
							</body>
						</html>