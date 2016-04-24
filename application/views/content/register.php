<!-- Javascript code -->
<script>
	$(function(){


		//batal register
		$("#batal_register").click(function(){
			$("#register").attr("style", "display:none");
			$("#login").removeAttr("style");
		})

		// induk validation
		$("#induk").blur(function(){
			var induktxt = $("#induk").val();

			if (induktxt == "") {
				$("#error_induk").html("");
			}
			else
			{
					$.ajax({
						url : "<?php echo site_url('auth/cek_nim') ?>",
						type : "POST",
						data : { nim  : induktxt },
						success : function(msg){
							if (msg == 1) {
								$("#error_induk").html("<span class = 'animated fadeInLeft text-danger'>NIM terdaftar!! Jangan gunakan induk yang sudah terdaftar. Coba Lagi</span>");
								$("#induk").focus();
							}
							else{
								$("#error_induk").html("");
							}
						}
					})
			}
		})

		//proses register
		$("#simpan_register").click(function(){

			// variable declare
			var nimtxt = $("#induk").val();
			var namatxt = $("#nama").val();
			var emailtxt = $("#email").val();
			var alamattxt = $("#alamat").val();
			var telptxt = $("#telp").val();
			var passwordtext = $("#pass").val();


			if (nimtxt == "" || namatxt == "" || emailtxt == "" || alamattxt == "" || telptxt == "") 
			{
				swal("Peringatan !!!", "Pastikan Form terisi semua.", "error");
			}
			else if (passwordtext == "") {
				swal("Peringatan !!!", "Pastikan Form terisi semua.", "error");
			}
			else
			{
				$.ajax ({
					url : "<?php echo site_url('auth/act_register') ?>",
					type : 'POST',
					data : {
						nim : nimtxt,
						nama : namatxt,
						email : emailtxt,
						alamat : alamattxt,
						telp : telptxt,
						password : passwordtext
					},
					beforeSend : function(){
						$("#register").html("<p class='animated fadeInDown'>Sedang memproses data ... </p>");
					},
					success : function(msg){
						$("#register").attr("style", "display:none");
						$("#success_register").addClass("animated fadeInLeft");
						$("#success_register").html(msg);
					}
				})
			}

		})

	})
</script>
<!-- end -->

<div class="container" style="margin-bottom : 50%">
	<h2 align="center">Lengkapi Data Diri</h2>
	<div class="panel panel-primary">
		<div class="panel-body">
			<blockquote><small>Syarat dan Ketentuan : <br>
		    	<ol>
		    		<li> Anggota adalah Mahasiswa aktif AMIK YMI Tegal.</li>
		    		<li> Isi data dengan lengkap pada form dibawah.</li>
		    		<li> Setelah pendaftaran. Akun tidak lagsung aktif dan bisa digunakan.</li>
		    		<li> Kami akan meninjau akun yang telah anda daftarkan terlebih dahulu. Jika dalam 2-3 hari anda tidak dapat login, silahkan datang ke petugas perpustakaan AMIK YMI Tegal.</li>
		    	</ol>
			</small></blockquote>
			<div class="form-horizontal">
				<div class="form-group">
					<label for="" class="col-md-3 control-label">NIM :</label>
					<div class="col-md-4">
						<input type="tel" id="induk" class="form-control" placeholder="Masukan NIM Anda">
						<div id="error_induk"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="" class="col-md-3 control-label">Nama :</label>
					<div class="col-md-4">
						<input type="text" class="form-control" id="nama" placeholder="Masukan Nama Lengkap Anda">
						<div id="error_nama"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="" class="col-md-3 control-label">Email :</label>
					<div class="col-md-3">
						<input type="text" id="email" class="form-control" placeholder="Masukan Email Valid Anda">
					</div>
					<div id="error_email"></div>
				</div>
				<div class="form-group">
					<label for="" class="col-md-3 control-label">Alamat :</label>
					<div class="col-md-4">
						<textarea id="alamat" rows="5" placeholder="Masukan Alamat Lengkap Anda" class="form-control"></textarea>
						<div id="error_alamat"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="" class="col-md-3 control-label">No / Telp</label>
					<div class="col-md-5">
						<input type="tel" class="form-control" id="telp" placeholder="Masukan Nomor Telp / HP Anda">
					</div>
				</div>
				<div class="form-group">
					<label for="" class="col-md-3 control-label">Password : </label>
					<div class="col-md-3">
						<input type="password" id="pass" class="form-control" placeholder="Masukan Password Anda">
						<div id="error_password"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="panel-footer">
			<button id="simpan_register" class="btn btn-primary"><i class="fa fa-save"></i> Registrasi</button>
			<button id="batal_register" class="btn btn-danger">Kembali ke menu Login </button>
		</div>
	</div>
</div>

<div id="p"></div>