<?php
if (!defined("WHMCS")) die("This file cannot be accessed directly");

// AI API endpoints
$action = $_REQUEST['action'];
$userid = $_SESSION['uid'];

if (!$userid) die("Unauthorized");

$table = "tbl_ai_credits";
$credits = get_query_val($table, "credits", ["userid" => $userid]);

if ($credits <= 0) die("Insufficient credits");

// Perform AI action...
// Deduct credits
full_query("UPDATE `{$table}` SET `credits` = `credits` - 1 WHERE `userid` = {$userid}");

echo json_encode(["status" => "success", "message" => "Action performed"]);
