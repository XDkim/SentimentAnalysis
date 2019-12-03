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
	if($target == 'Donald Trump') {
		echo '<h1 style="font-size: 400%; color:#002868"> DONALD TRUMP </h1>
			<div style="margin: 0 auto; width:30%; margin:0 auto;">
			<div style="width:100%">
			<div style="width:400px; height:250px">
			<img style="width:170px; height:200px; display:inline-block; float:left" src="./images/donaldimage.jpeg">
			<div style="width:200px;display:inline-block; float:right">
			<h1 style="font-size: 150%; color:#002868"> TOTAL TWEETS </h1>
			<h2 style="color:#bf0a30"> 34920 </h2>
			<h1 style="font-size: 150%; color:#002868"> AVG SENTIMENT</h1>
			<h2 style="color:#bf0a30"> 0 </h2>
			</div>
			</div>
			</div>
			</div>';
	} 
	else if($target == 'Joe Walsh') {
		echo '<h1 style="font-size: 400%; color:#002868"> JOE WALSH </h1>
			<div style="margin: 0 auto; width:30%; margin:0 auto;">
			<div style="width:100%">
			<div style="width:400px; height:250px">
			<img style="width:170px; height:200px; display:inline-block; float:left" src="./images/walshimage.jpeg">
			<div style="width:200px;display:inline-block; float:right">

			<h1 style="font-size: 150%; color:#002868"> TOTAL TWEETS </h1>
			<h2 style="color:#bf0a30"> 892 </h2>
			<h1 style="font-size: 150%; color:#002868"> AVG SENTIMENT</h1>
			<h2 style="color:#bf0a30"> 0.2 </h2>

			</div>
			</div>
			</div>
			</div>';
	}
	if($target == 'Mark Sanford') {
		echo '<h1 style="font-size: 400%; color:#002868"> MARK SANFORD </h1>
			<div style="margin: 0 auto; width:30%; margin:0 auto;">
			<div style="width:100%">
			<div style="width:400px; height:250px">
			<img style="width:170px; height:200px; display:inline-block; float:left" src="./images/sanfordimage.jpg">
			<div style="width:200px;display:inline-block; float:right">
			<h1 style="font-size: 150%; color:#002868"> TOTAL TWEETS </h1>
			<h2 style="color:#bf0a30"> 205 </h2>
			<h1 style="font-size: 150%; color:#002868"> AVG SENTIMENT</h1>
			<h2 style="color:#bf0a30"> 0.5 </h2>			   </div>
			</div>
			</div>
			</div>';
	}
	else if($target == 'Bernie Sanders') {
		echo '<h1 style="font-size: 400%; color:#002868"> BERNIE SANDERS </h1>
			<div style="margin: 0 auto; width:30%; margin:0 auto;">
			<div style="width:100%">
			<div style="width:400px; height:250px">
			<img style="width:170px; height:200px; display:inline-block; float:left" src="./images/bernieimage.png">
			<div style="width:200px;display:inline-block; float:right">

			<h1 style="font-size: 150%; color:#002868"> TOTAL TWEETS </h1>
			<h2 style="color:#bf0a30"> 3035 </h2>
			<h1 style="font-size: 150%; color:#002868"> AVG SENTIMENT</h1>
			<h2 style="color:#bf0a30"> 0.4 </h2>
			</div>
			</div>
			</div>
			</div>';
	}
	else if($target == 'Andrew Yang') {
		echo '<h1 style="font-size: 400%; color:#002868"> ANDREW YANG </h1>
			<div style="margin: 0 auto; width:30%; margin:0 auto;">
			<div style="width:100%">
			<div style="width:400px; height:250px">
			<img style="width:170px; height:200px; display:inline-block; float:left" src="./images/yangimage.jpg">
			<div style="width:200px;display:inline-block; float:right">
			<h1 style="font-size: 150%; color:#002868"> TOTAL TWEETS </h1>
			<h2 style="color:#bf0a30"> 2105 </h2>
			<h1 style="font-size: 150%; color:#002868"> AVG SENTIMENT</h1>
			<h2 style="color:#bf0a30"> 0.4 </h2>

			</div>
			</div>
			</div>
			</div>';
	} 
	else if($target == 'Elizabeth Warren') {
		echo '<h1 style="font-size: 400%; color:#002868"> ELIZABETH WARREN </h1>
			<div style="margin: 0 auto; width:30%; margin:0 auto;">
			<div style="width:100%">
			<div style="width:400px; height:250px">
			<img style="width:170px; height:200px; display:inline-block; float:left" src="./images/warrenimage.jpg">
			<div style="width:200px;display:inline-block; float:right">

			<h1 style="font-size: 150%; color:#002868"> TOTAL TWEETS </h1>
			<h2 style="color:#bf0a30"> 428 </h2>
			<h1 style="font-size: 150%; color:#002868"> AVG SENTIMENT</h1>
			<h2 style="color:#bf0a30"> 0.5 </h2>

			</div>
			</div>
			</div>
			</div>';
	} else if($target == 'Joe Biden') {
		echo '<h1 style="font-size: 400%; color:#002868"> JOE BIDEN </h1>
			<div style="margin: 0 auto; width:30%; margin:0 auto;">
			<div style="width:100%">
			<div style="width:400px; height:250px">
			<img style="width:170px; height:200px; display:inline-block; float:left" src="./images/bidenimage.jpg">
			<div style="width:200px;display:inline-block; float:right">

			<h1 style="font-size: 150%; color:#002868"> TOTAL TWEETS </h1>
			<h2 style="color:#bf0a30"> 492 </h2>
			<h1 style="font-size: 150%; color:#002868"> AVG SENTIMENT</h1>
			<h2 style="color:#bf0a30"> 0.7 </h2>

			</div>
			</div>
			</div>
			</div>';
	}

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
