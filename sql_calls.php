<?php
require "dbutil.php";
$db = dbutil::loginConnection();
$stmt = $db->stmt_init();

if (mysqli_connect_errno()) {
	echo("Can't connect to server: " .mysqli_connect_error());
	return null;
}

$query="SELECT DISTINCT text, sentiment_score FROM Tweet NATURAL JOIN tweets NATURAL JOIN Candidate WHERE candidate_name=?";

if ($stmt->prepare($query) or die(mysqli_error($db))) { //prepared statement
	$target = $_GET['candidate'];
	echo $target;
	$stmt->bind_param("s", $target);
	$stmt->execute();
	$stmt->bind_result($text, $sentiment_score);
}

while($stmt->fetch()) {
	echo '<div class="card"><div class="card-body">'.$text.'</div>
	<div> '.$sentiment_score.' </div>
	</div>';

}
$stmt->close();
mysqli_close($db);
?>
