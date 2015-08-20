<footer id="footer">
	<?php //echo $this->session->data['token'];?>
 <script type="text/javascript">
      $(function(){
          $('li#tools').append('<li><a href="http://localhost/mycanvas/admin/index.php?route=custom/customdesign/mycanvas&token=<?php if(!empty($footer_sesion)){echo $footer_sesion;}?>">Custom Products</a></li>'); 
      });
 </script>

	<?php echo $text_footer; ?><br /><?php echo $text_version; ?></footer></div>
</body></html>