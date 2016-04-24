<blockquote><small>Berikut data  buku yang anda booking. Data otomatis dihapus jika sudah melewati tempo booking. </small></blockquote>
<table class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>No</th>
			<th>Judul</th>
		</tr>
	</thead>
	<tbody>
		<?php  

			$no = 1;

			if ($data_booking->num_rows() == 0) 
			{
				echo '<tr><td colspan="2" align="center">Data kosong ... </td></tr>';
			}
			else
			{
				foreach ($data_booking->result() as $d) 
				{
					?>
					<tr class="tr-<?php echo $d->id ?>">
						<td><?php echo $no++ ?></td>
						<td>
							<?php  
								echo $d->judul."<br> Tempo booking : ".$this->tgl_indo->tgl_db($d->tempo);
							?> 
							<br>
							<a class="label label-danger hapus_booking" kode='<?php echo $d->id ?>'><i class="fa fa-trash"></i> batalkan booking</a>
						</td>
					</tr>
					<?php
				}
			}
		?>
	</tbody>
</table>

<!-- jquery  -->
<script>
	
	$(function(){
		$(".hapus_booking").click(function(){
			var kode = $(this).attr('kode');

			$.ajax({
				url : "<?php echo site_url('web/hapus_booking') ?>",
				type : "POST",
				data : { id : kode },
				beforeSend : function(){
					$(".tr-"+kode).html('<td colspan="2" align="center" class="animated fadeInLeft">Menghapus data ... </td>');
				},
				success : function(){
					$(".tr-"+kode).html('<td colspan="2" align="center"> <i class="fa fa-check"></i> Data berhasil di hapus</td>');
					$(".tr-"+kode).delay(2000).fadeOut(1000);
				}

			})
		})
	})
</script>