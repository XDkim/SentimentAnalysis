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

$query="SELECT * FROM Tweet";
$res=mysqli_query($db, $query);
if (!$res) {
	die('Error: ' . mysqli_error($db));
}
echo "success";
while ($row=mysqli_fetch_row($res)) {
	echo $row[1];
}
mysqli_close($db);
?>