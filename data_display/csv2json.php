<?php

function csvJSON() {
	// data.csv �����csv�ļ�
	$lines = array_map('str_getcsv', file('2010_mink_display.csv'));; 
			
	$result = array();
	$headers;

	if (count($lines) > 0) {
		$headers = $lines[0];
	}

	for($i=1; $i<count($lines); $i++) {
		$obj = $lines[$i];
		$result[] = array_combine($headers, $obj);
	}

	return json_encode($result);

}

// testData.js ΪҪд����ļ�
//$myfile = fopen("testData.js", "w") or die("Unable to open file!");
//fwrite($myfile, csvJSON());
//fclose($myfile);

echo csvJSON();

 // printf($content);

?>
