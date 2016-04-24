<!-- Jquery  -->
<script>
	
	//start jquery
	$(function(){

		//show login
		$("#lanjutkan").click(function(){
			$("#splash").addClass("animated fadeOutRight").delay(2000).attr("style", "display:none");

			$.ajax({
				url : "<?php echo site_url('auth/login') ?>",
				beforeSend : function(){
					$("#login").html("<p align='center'>Tunggu sebentar ...</p>");
				},
				success : function(msg){
					$("#login").addClass("animated fadeInLeft");
					$("#login").html(msg);
				}
			})
		})
	})
</script>
<!-- END -->
<div id="splash" align="center">
	<img src="<?php echo base_url() ?>assets/amik_logo.png" class="animated fadeInDown" width="200" height="200" alt="">
	<h2 class="animated fadeInLeft">SIPUS MOBILE AMIK YMI TEGAL</h2>
	<a id="lanjutkan" class="btn btn-warning">Klik Untuk Melanjutkan</a>
</div>

<div id="login"></div>
<div id="register"></div>
<div id="success_register"></div>