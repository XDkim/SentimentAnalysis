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

//$query="SELECT * FROM Tweet";
//$res=mysqli_query($db, $query);
$stmt = $db -> prepare("SELECT * FROM Candidate where candidate_name=?"); //prepared statement
// echo $_GET["cand"];
$cand = !empty($_GET["cand"]);
$stmt->bind_param("ssdis", $candidate_name, $party_name, $avg_sentiment_score, $total_tweets, $username);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($username);

while($stmt->fetch())
{
    echo $username;
}



// if (!$res) {
// 	die('Error: ' . mysqli_error($db));
// }
   if(!$stmt) { 
	   die('Error: ' . mysqli_error($db)); 
   }
echo "success";
// while ($row=mysqli_fetch_row($res)) {
// 	echo $row[1];
// }
mysqli_close($db);
?>