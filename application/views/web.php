<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>WEb</title>
</head>
<body>
	<?php echo $this->session->userdata('nama') ?>
	<div align=center>
		<table>
			<thead>
				<tr>
					<th>Kode buku</th>
					<th>Judul Buku</th>
				</tr>
			</thead>
			<tbody>
	
				<?php foreach ($web as $d): ?>
					<tr>
						<td><?php echo $d->kd_buku ?></td>
						<td><?php echo $d->judul ?></td>
					</tr>
				<?php endforeach ?>
			</tbody>
			</table>
	</div>
	<a href="<?php echo site_url('web/logout') ?>">Logout</a>
</body>
</html>	