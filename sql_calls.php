<?php
require "dbutil.php";
$db = dbutil::loginConnection();
$stmt = $db->stmt_init();

// if($candidate_tweet_query->prepare("") or die (mysqli_error($db))) {
// 	$candidate_tweet_query->bind_param("s", strtolower($_POST[""]));

// }
if (mysqli_connect_errno()) {
	echo("Can't connect to server: " .mysqli_connect_error());
	return null;
}

//$query="SELECT text, sentiment_score FROM Tweet WHERE id IN (SELECT id FROM tweets WHERE USERNAME = (SELECT username FROM Candidate where candidate_name = ?))";
$query="SELECT DISTINCT text, sentiment_score FROM Tweet NATURAL JOIN tweets NATURAL JOIN Candidate WHERE candidate_name=?";
//$res=mysqli_query($db, $query);
if ($stmt->prepare($query) or die(mysqli_error($db))) { //prepared statement
	$target = $_GET['candidate'];
	echo $target;
	$stmt->bind_param("s", $target);
	$stmt->execute();
	//$stmt->store_result();
	$stmt->bind_result($text, $sentiment_score);
}
// echo $_GET["cand"];

//echo $text;

//echo $_GET['candidate'];
	while($stmt->fetch()) {
		echo '<div class="card"><div class="card-body">'.$text.'</div></div>';

	}
// if (!$res) {
// 	die('Error: ' . mysqli_error($db));
// }
   // if(!$stmt) { 
	  //  die('Error: ' . mysqli_error($db)); 
   // }
// while ($row=mysqli_fetch_row($res)) {
// 	echo $row[1];
// }
	$stmt->close();
	mysqli_close($db);
?>