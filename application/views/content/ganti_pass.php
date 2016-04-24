<div class="container">
	<div class="edit_content animated fadeInLeft">
		<blockquote>
			<?php echo $title ?>
			<a href="<?php echo site_url('web/profil') ?>" class="close btn btn-primary"><i class="fa fa-angle-double-left"></i> Kembali</a>
		</blockquote>
		<div class="pesan"></div>
		<div class="form-horizontal">
			<div class="form-group error_form">
				<label for="" class="col-md-3 cpntrol-label">Password Baru</label>
				<div class="col-md-3">
					<input type="password" id="new" class="form-control" placeholder="Masukan password baru">
				</div>
			</div>
			<div class="form-group error_form">
				<label for="" class="col-md-3 cpntrol-label">Ulangi Password</label>
				<div class="col-md-3">
					<input type="password" id="conf" class="form-control" placeholder='Masukan password baru sekali lagi'>
					<div class="error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-3 control-label"></label>
				<div class="col-md-3">
					<button class="btn btn-success" id="simpan">Simpan</button>&nbsp;
					
				</div>
			</div>	
		</div>
	</div>
</div>

<script>
	$(function(){
	
		//cek password lama
		$("#simpan").click(function(){

			var baru = $("#new").val();
			var conf = $("#conf").val();

			if (baru == "" || conf == "")
			{
				$(".error_form").addClass("has-error");
				$(".error").html('<span class="text-danger animated fadeInLeft">Form harus di isi semua. Coba lagi!!</span>');
			}
			else if (baru !== conf) 
			{
				$(".error_form").addClass("has-error");
				$(".error").html('<span class="text-danger animated fadeInLeft">Password tidak sama. coba lagi!!</span>');
			}
			else
			{
				$(".error_form").removeClass("has-error");
				$.ajax({
					url : "",
					type : "POST",
					data : { baru : baru, ganti : true },
					beforeSend : function(){
						$("#simpan").html("Sedang memproses data...");
					},
					success : function(){
						$("#simpan").html("Simpan");
						$(".pesan").html('<div class="alert alert-success">Password berhasil di ganti.</div>');
						$(".pesan").delay(3000).fadeOut(500);
					}
				})
			}
		})
			
	})
</script>