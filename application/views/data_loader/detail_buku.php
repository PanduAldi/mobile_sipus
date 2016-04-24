<div>
	<div class="navbar navbar-default">
			<span class="navbar-brand"><a id='back_buku'><i class="fa fa-arrow-left"></i></a> <?php echo "Detail Buku" ?></span>
	</div>	
	<table class="table table-striped">
		<tr>
			<td><label for="" class="control-label">Kode Buku  </label></td>
			<td><?php echo $detail->kd_buku ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">Judul  </label></td>
			<td><?php echo $detail->judul ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">Penerbit  </label></td>
			<td><?php echo $detail->penerbit ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">Pengarang  </label></td>
			<td><?php echo $detail->pengarang ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">Kategori  </label></td>
			<td><?php echo $detail->kategori ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">Tahun  </label></td>
			<td><?php echo $detail->tahun ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">ISBN  </label></td>
			<td><?php echo $detail->isbn ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">Jumlah Buku  </label></td>
			<td><?php echo $detail->jumlah_buku ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">Rak  </label></td>
			<td><?php echo $detail->rak ?></td>
		</tr>
		<tr>
			<td><label for="" class="control-label">Buku Baru  </label></td>
			<td><?php echo $detail->most_new ?></td>
		</tr>

	</table>
</div>

<script>
	$(function(){
		$("#back_buku").click(function(){
			$(this).addClass("animated fadeOutRight");
			$("#hal_detail").attr("style", "display:none");
			$("#hal_buku").removeAttr("style");
		});
	})
</script>