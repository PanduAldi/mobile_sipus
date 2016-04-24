<div id="hal_booking">
	<div class="navbar navbar-default">
			<span class="navbar-brand"><a href="<?php echo site_url('web') ?>"><i class="fa fa-arrow-left"></i></a> <?php echo $title ?></span>
	</div>	
	<div id="loading_booking"></div>	
	<div class="load_booking"></div>
</div>

<script>
	
	function load_booking()
	{
		$(function(){
			$.ajax({
				url : "<?php echo site_url('web/load_booking') ?>",
				beforeSend : function(){
					$("#loading_booking").html('<div class="alert alert-success">Sedang memuat data ... </div>');
				},
				success : function(msg){
					$("#loading_booking").html("");
					$(".load_booking").html(msg);
				}
			})
		})
	}

	load_booking();
</script>