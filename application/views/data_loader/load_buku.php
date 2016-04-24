<div class="typed-hero"></div>
<div>
	<div class="well well-sm">
		<div class="form-horizontal">
			<div class="form-group">
				<label for="" class="col-md-3 control-label">Cari Data Buku :</label>
				<div class="col-md-3">
					<select id="berdasarkan" class="form-control">
						<option value="">-- Cari Berdasarkan --</option>
						<option value="t_buku.judul">Judul</option>
						<option value="t_penerbit.penerbit">Penerbit</option>
						<option value="t_pengarang.pengarang">Pengarang</option>
						<option value="t_kategori.kategori">Kategori</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-3" id="choose">
					<input type="text" class="form-control" disabled>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-3" id="choose">
					<input type="button" class="btn btn-primary cari_buku" value="Cari buku">
				</div>
			</div>
		</div>
	</div> <p id="hi"></p>
	<p class="contoh"></p>
	<table class="table table-striped" id="buku_tabel">
		<thead>
			<tr>
				<th width="10">No</th>
				<th>Judul</th>
			</tr>
		</thead>
		<tbody>
			<?php
				if ($cek_data->num_rows() == 0) 
				{
					?>
					<tr>
						<td colspan="2" align="center"> Data tidak ditemukan </td>
					</tr>
					<?php
				}
				else
				{
					$no = 1;

					foreach ($cek_data->result() as $dat) {
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td>
								<?php echo $dat->judul ?>
								<br>
								<a class="detail_buku" kode="<?php echo $dat->kd_buku ?>"><span class="label label-warning">Detail Buku</span></a>
								<?php
									if ($dat->status == "tersedia") 
									{
										echo '<span class="dat-'.$dat->kd_buku.'"><a class="booking_buku label label-success" kode="'.$dat->kd_buku.'">Booking Buku</a></span>';
									}
									else
									{
										echo '<span class="label label-danger">'.$dat->status.'</span>';
									}
								?>
							</td>
						</tr>
						<?php
					}
				}
			?>
		</tbody>
	</table>
</div>

<!-- Jquery script -->
<script>

	$(function(){

		//detail buku
		$(".detail_buku").click(function(){
			var kode = $(this).attr("kode");

			//hidden data buku
			$("#hal_buku").attr("style", "display:none");
			$("#hal_detail").removeAttr("style");

			$.ajax({
				url : "<?php echo site_url('web/detail_buku') ?>",
				type : "POST",
				data : { kd_buku : kode },
				beforeSend: function()
				{
					$("#hal_detail").html('<div class="alert alert-info"><center> <i class="fa fa-spinner fa-spin"></i> Memuat data ...</center></div>');
				},
				success : function(msg)
				{
					$("#hal_detail").html(msg);
				}
			})
		})



		$("#data_table").dataTable({
			"info" : false
		});

		// booking buku
		$(".booking_buku").click(function(){

			var kode = $(this).attr('kode');

			$.ajax({
				url : "<?php echo site_url('web/proses_booking') ?>",
				type : "POST",
				data : {kd_buku : kode},
				beforeSend : function(){
					$(".dat-"+kode).html('<span class="label label-primary"><i class="fa fa-spinner fa-spin"></i> Cek data ketersediaan buku...</span>')
				},
				success : function(msg){
					ex = msg.split("|");

					var cek = ex[0];

					if (cek == 0)
					{
						swal('Peringatan', 'Anda tidak boleh booking buku lebih dari 2, hapus salah satu dari daftar booking anda dan lakukan transaksi booking kembali.', 'error');
						$(".dat-"+kode).html('<a class="booking_buku label label-success" kode="'+kode+'">Booking Buku</a>');
					}
					else if(cek == 1)
					{
						swal('Sukses', 'Booking tersimpan. Booking akan otomatis dibatalkan jika anda tidak menghubungi petugas perpustkaan untuk peminjaman buku sampai dengan '+ex[1]+'.', 'success');
						$(".dat-"+kode).html('<span class="label label-danger">sudah dibooking</span>');
					}
					else if (cek == 2) 
					{
						swal('Maaf', 'Buku yang akan anda booking sudah dipinjam terlebih dulu oleh anggota lain.', 'error');
						$(".dat-"+kode).html('<span class="label label-danger">sedang dipinjam</span>');
					}
					else if (cek == 3) 
					{
						swal('Maaf', 'Buku sudah di booking terlebih dulu oleh anggota lain', 'error');
						$(".dat-"+kode).html('<span class="label label-danger">sudah dibooking</span>');
					}

				}
			})
		})


		// cari berdasarkan
		$("#berdasarkan").change(function(){

			var berdasarkan = $(this).val();

			if (berdasarkan == "t_buku.judul")
			{
				$("#choose").html('<input type="text" id="judul" class="form-control" placeholder="Masukan Judul Buku" />');
			}

			else if(berdasarkan == "t_penerbit.penerbit")
			{
				$.ajax({
					url : "<?php echo site_url('web/pilih_pencarian') ?>",
					type : "POST",
					data : { kunci : "t_penerbit", isi : "t_penerbit.kd_penerbit = t_buku.kd_penerbit", urut : "t_penerbit.kd_penerbit", nama : "penerbit"},
					beforeSend : function(){
						$("#choose").html("Mencari data Penerbit... ");
					},
					success : function(msg)
					{
						$("#choose").html(msg);
					}
				})
			}
			else if(berdasarkan == "t_pengarang.pengarang")
			{
				$.ajax({
					url : "<?php echo site_url('web/pilih_pencarian') ?>",
					type : "POST",
					data : { kunci : "t_pengarang", isi : "t_pengarang.kd_pengarang = t_buku.kd_pengarang", urut : "t_pengarang.kd_pengarang", nama: "pengarang"},
					beforeSend : function(){
						$("#choose").html("Mencari data Pengarang...");
					},
					success : function(msg)
					{
						$("#choose").html(msg);
					}
				})
			}
			else if(berdasarkan == "t_kategori.kategori")
			{
				$.ajax({
					url : "<?php echo site_url('web/pilih_pencarian') ?>",
					type : "POST",
					data : { kunci : "t_kategori", isi : "t_kategori.kd_kategori = t_buku.kd_kategori", urut : "t_kategori.kd_kategori", nama : "kategori"},
					beforeSend : function(){
						$("#choose").html("Mencari data Kategori...");
					},
					success : function(msg)
					{
						$("#choose").html(msg);
					}
				})
			}
			else
			{
				$("#choose").html('<input type="text" class="form-control" disabled/>');
			}
		})

		$(".cari_buku").click(function(){

			var berdasarkan = $("#berdasarkan").val();

			if (berdasarkan == "")
			{
				swal("Peringatan", "Form pencarian berdasarkan harus dipilih terlebih dahulu..", "error");
			}
			else
			{
				var judul = $("#judul").val();
				var penerbit = $("#penerbit").val();
				var pengarang = $("#pengarang").val();
				var kategori = $("#kategori").val();

				if (judul == "")
				{
					swal("Peringatan", "Judul harus di isi", "error");
				}
				else
				{
					$.ajax({
						url : "<?php echo site_url('web/cari_berdasarkan') ?>",
						type : "POST",
						data : { key : berdasarkan, value : judul},
						beforeSend : function(){
							$("")
						}

					})
				}

				if (penerbit == "")
				{
					swal("Peringatan", "Pilih penerbit terlebih dahulu .. ", "error");
				}
				else
				{
					$.ajax({
						url : "<?php echo site_url('web/cari_berdasarkan') ?>",
						type : "POST",
						data : {key : berdasarkan, value : penerbit},
						beforeSend : function (){
							$("#hi").html('Tunggu...');
						},
						success : function(msg){
							$("#hi").html(msg);
						}
					})
				}

				if (pengarang == "")
				{
					swal("Peringatan", "Pilih pengarang terlebih dahulu ...", "error");
				}
				else
				{
					$("#hi").html(pengarang);
				}

				if (kategori == "")
				{
					swal("Peringatan", "Pilih Kategori terlebih dahulu ...", "error");
				}
				else
				{
					$("#hi").html(kategori);
				}
			}
		})


	})

</script>