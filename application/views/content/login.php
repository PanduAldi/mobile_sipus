<script>
	$(function(){

		// act login
		$("#masuk").click(function(){

			var nimtxt = $("#nim").val();
			var passtxt = $("#password").val();

			if (nimtxt == "" && passtxt == "") 
			{
				swal("Peringatan!!!", "NIM dan Password Harus di Isi Semua", "error");
			}
			else
			{
				$.ajax({
					url : "<?php echo site_url('auth/act_login') ?>",
					type : "POST",
					data : { nim : nimtxt, password : passtxt },
					beforeSend : function(){
						$("#masuk").html("Memproses data ...");
					},
					success : function(msg){
						if (msg == 1)
						{
							swal("Sukses", "Login berhasil.. Klik OK untuk melanjutkan", "success");
							location.href = "<?php echo site_url('web') ?>";
						}
						else if(msg == 2)
						{
							swal("Gagal", "Akun anda belum diaktivasi. Silahkan hubungi petugas perpustkaan jika dalam 2-3 hari belum diaktivasi.", "error");
							$("#nim").val("");
							$("#password").val("");
							$("#nim").focus();
							$("#masuk").html('<i class="fa fa-sign-in"></i> Masuk');
						}	
						else if (msg == 3)
						{
							swal("Gagal", "NIM atau Password anda salah. Silahkan ulangi kembali ..!!", "error");
							$("#nim").val("");
							$("#password").val("");
							$("#nim").focus();
							$("#masuk").html('<i class="fa fa-sign-in"></i> Masuk');
						}
					}
				})
			}
		})

		//show form register
		$("#form_reg").click(function(){
			$("#login").attr("style", "display:none");
			$.ajax({
				url : "<?php echo site_url('auth/register') ?>",
				beforeSend : function(){
					$("#register").html("<p align='center'>Tunggu sebentar ...</p>")
				},
				success : function(msg){
					$("#register").addClass("animated fadeInLeft").html(msg);
					$("#register").removeAttr("style");
				}
			});
		})
	})
</script>

<!-- panel login -->
<h2 align="center">Silahkan Login Terlebih Dahulu</h2>
<div class="container">
	<div class="panel panel-success">
		<div class="panel-body">
			<input type="tel" id="nim" class="form-control" placeholder="Masukan NIM anda"><br>
			<input type="password" id="password" class="form-control" placeholder="Masukan Password anda">
		</div>
		<div class="panel-footer">
			<button id="masuk" class="btn btn-primary"><i class="fa fa-sign-in"></i> Masuk</button>
			<small>Belum mendaftar ?? <a id="form_reg">Klik disini</a></small>
		</div>	
	</div>
</div>



