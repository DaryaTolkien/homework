<?php

function getAssocResult($sql){
    $db = mysqli_connect(HOST, USER, PASS, DB);
	mysqli_query($db, "SET NAMES 'utf8' COLLATE 'utf8_general_ci'");
    mysqli_query($db, "SET CHARACTER SET 'utf8'");
	$result = mysqli_query($db, $sql);
	$array_result = array();
	while($row = mysqli_fetch_assoc($result))
		$array_result[] = $row;

    mysqli_close($db);
	return $array_result;
}



function executeQuery($sql){
    $db = mysqli_connect(HOST, USER, PASS, DB);
	mysqli_query($db, "SET NAMES 'utf8' COLLATE 'utf8_general_ci'");
    mysqli_query($db, "SET CHARACTER SET 'utf8'");
	$result = mysqli_query($db, $sql);
    mysqli_close($db);
	return $result;
}

function getRowResult($sql, $db = null){
    $array_result = getAssocResult($sql, $db);

    if(isset($array_result[0]))
        $result = $array_result[0];
    else
        $result = [];

    return $result;
}

function getConnection(){
    $db = mysqli_connect(HOST, USER, PASS, DB);
    mysqli_query($db, "SET NAMES utf8");
    return $db;
}