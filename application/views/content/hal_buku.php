<!-- jquery script -->
<script>
	function buku_load(){
		$(function(){
			$.ajax({
				url : "<?php echo site_url('web/buku_load') ?>",
				beforeSend : function(){
					$("#loading").html('<div class="alert alert-success"><i class="fa fa-spinner fa-spin"></i> Memuat data buku ... </div>');
					$("load-buku").html();
				},
				success : function(msg){
					console.log(msg);
					$("#loading").html("");
					$("#load-buku").html(msg);
				}
			})
		})
	}

	buku_load();




</script>
<div id="hal_buku">
	<div class="navbar navbar-default">
			<span class="navbar-brand"><a href="<?php echo site_url('web') ?>"><i class="fa fa-arrow-left"></i></a> <?php echo $title ?></span>
	</div>	

	<div id="loading"></div>
	<div id="load-buku"></div>
	<div id="cari_buku"></div>
</div>

<div id="hal_detail" class="animated fadeInLeft"></div>