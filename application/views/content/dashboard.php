<div id="hal_dashboard" class="animated fadeInLeft">
	<div class="navbar navbar-default">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">SIPUS MOBILE AMIK YMI Tegal V1.0</a>
		</div>
	</div>
	<div class="container">
		<div id="notifikasi">
<?php  
		foreach ($cek_booking as $c) 
		{
			$cek_tempo = $this->selisih_hari->selisih($c->tempo, date('Y-m-d'));
			
				
			if ($cek_tempo >= 0) 
			{
				$this->m_web->deleteData('t_booking', 'id', $c->id);
				$this->m_web->updateData('t_buku', array('status'=>'tersedia'), 'kd_buku', $c->kd_buku);
				echo '<div class="alert alert-danger"><i class="fa fa-exclamation"></i> Masa booking untuk kode buku '.$c->kd_buku.' sudah habis. Jika ingin membooking buku tersebut silahkan lakukan booking kembali dan pastikan menghubungi petugas perpustakaan sebelum masa/tempo booking berakhir.</div>';
			}
			else
			{
				echo "";
			}
			
		}

?>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-6" align="center">
				<a href="<?php echo site_url('web/buku') ?>">
					<span class="fa-stack fa-5x">
					  <i class="fa fa-square-o fa-stack-2x"></i>
					  <i class="fa fa-book fa-stack-1x"></i>
					</span>
					Katalog Buku
				</a>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-6" align="center">
				<a href="<?php echo site_url('web/booking') ?>">
					<span class="fa-stack fa-5x">
					  <i class="fa fa-square-o fa-stack-2x"></i>
					  <i class="fa fa-database fa-stack-1x"></i>
					</span>
					Data Booking
				</a>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-6" align="center">
				<a href="<?php echo site_url('web/profil') ?>">
					<span class="fa-stack fa-5x">
					  <i class="fa fa-square-o fa-stack-2x"></i>
					  <i class="fa fa-user fa-stack-1x"></i>
					</span>
					Profil Anda
				</a>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-6" align="center">
				<a id="tentang-modal">
					<span class="fa-stack fa-5x">
						<i class="fa fa-square-o fa-stack-2x"></i>
						<i class="fa fa-exclamation fa-stack-1x"></i>
					</span>
					Tentang Aplikasi
				</a>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-6" align="center">
				<a href="<?php echo site_url('web/logout') ?>">
					<span class="fa-stack fa-5x">
						<i class="fa fa-square-o fa-stack-2x"></i>
						<i class="fa fa-sign-out fa-stack-1x"></i>
					</span>
					Keluar
				</a>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-6" align="center"></div>
		</div>
	</div>	
</div>

<!-- jquery modal show -->
<script>
	$(function(){
		$("#tentang-modal").click(function(){
			$("#show-modal").modal("show");
		})

		$("#notifikasi").delay(10000).fadeOut(500);
	})
</script>
