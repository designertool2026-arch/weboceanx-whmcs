<?php
if (!defined("WHMCS")) die("This file cannot be accessed directly");

add_hook("InvoicePaid", 1, function($vars) {
    $invoiceid = $vars['invoiceid'];
    $invoice = localAPI("GetInvoice", ["invoiceid" => $invoiceid], "admin");
    $userid = $invoice['userid'];
    $amount = $invoice['total'];

    // Logic to add credits based on payment amount
    // Example: 1 credit per 1 unit of currency
    $credits_to_add = floor($amount);

    $table = "tbl_ai_credits";
    $exists = get_query_val($table, "id", ["userid" => $userid]);

    if ($exists) {
        full_query("UPDATE `{$table}` SET `credits` = `credits` + {$credits_to_add} WHERE `userid` = {$userid}");
    } else {
        full_query("INSERT INTO `{$table}` (`userid`, `credits`) VALUES ({$userid}, {$credits_to_add})");
    }
    
    logActivity("Added {$credits_to_add} AI credits to user {$userid} for invoice {$invoiceid}");
});
