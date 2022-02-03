<?php
  $file = "test.txt"

  if (file_exists($file)) {
  	$deleted = unlink($file);
  	if ($deleted) {
  	  echo 'File ' . $file . ' was deleted!';
  	}
  }
?>
