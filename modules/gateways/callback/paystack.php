<?php
/**
 * Paystack Webhook Handler for WHMCS
 * 
 * @package    WHMCS
 * @author     WebOceanX
 * @copyright  Copyright (c) 2026 WebOceanX
 * @license    MIT
 * @version    1.0.0
 */

// Require libraries needed for gateway module functions.
require_once __DIR__ . '/../../../init.php';
require_once __DIR__ . '/../../../includes/gatewayfunctions.php';
require_once __DIR__ . '/../../../includes/invoicefunctions.php';

use WHMCS\Database\Capsule;

// Detect module name from filename.
$gatewayModuleName = basename(__FILE__, '.php');

// Fetch gateway configuration parameters.
$gatewayParams = getGatewayVariables($gatewayModuleName);

// Die if module is not active.
if (!$gatewayParams['type']) {
    die("Module Not Activated");
}

// Retrieve data from Paystack webhook
$input = @file_get_contents("php://input");
$event = json_decode($input);

if (!$event || !isset($event->event)) {
    die("Invalid Event");
}

// Verify signature
$paystackSignature = $_SERVER['HTTP_X_PAYSTACK_SIGNATURE'];
$secretKey = $gatewayParams['secretKey'];

if ($paystackSignature !== hash_hmac('sha512', $input, $secretKey)) {
    die("Invalid Signature");
}

// Only handle charge.success event
if ($event->event == 'charge.success') {
    $data = $event->data;
    $invoiceId = $data->metadata->invoice_id;
    $transactionId = $data->reference;
    $paymentAmount = $data->amount / 100;
    $paymentCurrency = $data->currency;

    // Validate invoice ID
    $invoiceId = checkCbInvoiceID($invoiceId, $gatewayParams['name']);

    // Check if transaction has already been processed
    checkCbTransID($transactionId);

    // Log transaction
    logTransaction($gatewayParams['name'], $input, "Success");

    // Add payment to invoice
    addInvoicePayment(
        $invoiceId,
        $transactionId,
        $paymentAmount,
        0, // Fee
        $gatewayModuleName
    );

    echo "Payment Processed Successfully";
} else {
    echo "Event Ignored";
}
