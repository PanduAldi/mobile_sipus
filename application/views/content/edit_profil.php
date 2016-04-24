<div class="container">
	<div class="edit_content animated fadeInLeft">
		<blockquote>
			<?php echo $title ?>
			<a href="<?php echo site_url('web/profil') ?>" class="close btn btn-primary"><i class="fa fa-angle-double-left"></i> Kembali</a>
		</blockquote>
		<div class="form-horizontal">
			<div class="form-group">
				<label for="" class="col-md-3 cpntrol-label">Nama</label>
				<div class="col-md-3">
					<input type="text" id="nama" class="form-control" value="<?php echo $profil->nama ?>">
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-3 cpntrol-label">Email</label>
				<div class="col-md-3">
					<input type="text" id="email" class="form-control" value="<?php echo $profil->email ?>">
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-3 cpntrol-label">Alamat</label>
				<div class="col-md-3">
					<textarea id="alamat" class="form-control" rows="5"><?php echo $profil->alamat ?></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-3 cpntrol-label">No. Telp / HP</label>
				<div class="col-md-3">
					<input type="tel" id="telp" class="form-control" value="<?php echo $profil->telp ?>">
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-3 cpntrol-label"></label>
				<div class="col-md-3">
					<button class="btn btn-success btn-sm" id="edit">Edit Data</button>&nbsp;<span id="pesan"></span>
				</div>
			</div>		
		</div>
	</div>
</div>

<div class="keluar"></div>

<script>
	$(function(){
		
		$("#edit").click(function(){

			$.ajax({
				url : "<?php echo site_url('web/act_edit') ?>",
				type : "POST",
				data : {
					nama : $("#nama").val(),
					email : $("#email").val(),
					alamat : $("#alamat").val(),
					telp : $("#telp").val()
				},

				beforeSend : function(){
					$("#edit").html("Sedang memproses ...");
					$("#pesan").html("");
				},
				success : function(msg){
					$("#edit").html("Edit Data");
					$("#pesan").html("Semua perubahan telah disimpan");

					ex = msg.split("|");

					$("#nama").val(ex[0]);
					$("#email").val(ex[1]);
					$("#alamat").val(ex[2]);
					$("#telp").val(ex[3]);

				}
			})
		})
	})
</script>