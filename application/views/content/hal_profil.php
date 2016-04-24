<div class="hal_profil animated fadeInLeft">
	<div class="navbar navbar-default">
			<span class="navbar-brand"><a href="<?php echo site_url('web') ?>"><i class="fa fa-arrow-left"></i></a> <?php echo $title ?></span>
	</div>	
	<div class="well well-sm">
		<a href="<?php echo site_url('web/edit_profil/'.$profil->id_anggota) ?>" class="label label-success"><i class="fa fa-pencil"></i> Edit Profil</a>
		<a href="<?php echo site_url('web/ganti_pass/'.$profil->id_anggota) ?>" class="label label-warning"><i class="fa fa-key"></i> Ganti Password</a>
	</div>

	<div>
		<table class="table table-striped">
			<tr>
				<td><label for="" class="control-label">ID Anggota</label></td>
				<td><?php echo $profil->id_anggota ?></td>
			</tr>
			<tr>
				<td><label for="" class="control-label">NIM</label></td>
				<td><?php echo $profil->nim  ?></td>
			</tr>
			<tr>
				<td><label for="" class="control-label">Nama</label></td>
				<td><?php echo $profil->nama ?></td>
			</tr>
			<tr>
				<td><label for="" class="control-label">Email</label></td>
				<td><?php echo $profil->email ?></td>
			</tr>
			<tr>
				<td><label for="" class="control-label">Alamat</label></td>
				<td><?php echo $profil->alamat ?></td>
			</tr>
			<tr>
				<td><label for="" class="control-label">No. Telp / HP</label></td>
				<td><?php echo $profil->telp ?></td>
			</tr>
		</table>
	</div>
</div>