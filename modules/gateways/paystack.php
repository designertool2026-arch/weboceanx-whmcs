<?php
/**
 * Paystack Payment Gateway for WHMCS
 * 
 * @package    WHMCS
 * @author     WebOceanX
 * @copyright  Copyright (c) 2026 WebOceanX
 * @license    MIT
 * @version    1.0.0
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

/**
 * Define gateway configuration
 */
function paystack_config() {
    return [
        "FriendlyName" => [
            "Type" => "System",
            "Value" => "Paystack (Mobile Money & Cards)",
        ],
        "publicKey" => [
            "FriendlyName" => "Public Key",
            "Type" => "text",
            "Size" => "40",
            "Default" => "",
            "Description" => "Enter your Paystack Public Key here",
        ],
        "secretKey" => [
            "FriendlyName" => "Secret Key",
            "Type" => "password",
            "Size" => "40",
            "Default" => "",
            "Description" => "Enter your Paystack Secret Key here",
        ],
        "testMode" => [
            "FriendlyName" => "Test Mode",
            "Type" => "yesno",
            "Description" => "Tick to enable test mode",
        ],
    ];
}

/**
 * Payment link generation
 */
function paystack_link($params) {
    // Gateway Configuration Parameters
    $publicKey = $params['publicKey'];
    
    // Invoice Parameters
    $invoiceId = $params['invoiceid'];
    $description = $params["description"];
    $amount = $params['amount'];
    $currencyCode = $params['currency'];

    // Client Parameters
    $firstname = $params['clientdetails']['firstname'];
    $lastname = $params['clientdetails']['lastname'];
    $email = $params['clientdetails']['email'];
    $address1 = $params['clientdetails']['address1'];
    $city = $params['clientdetails']['city'];
    $state = $params['clientdetails']['state'];
    $postcode = $params['clientdetails']['postcode'];
    $country = $params['clientdetails']['country'];
    $phone = $params['clientdetails']['phonenumber'];

    // System Parameters
    $companyName = $params['companyname'];
    $systemUrl = $params['systemurl'];
    $returnUrl = $params['returnurl'];
    $langPayNow = $params['langpaynow'];
    $moduleName = $params['paymentmethod'];

    $code = '<form action="' . $systemUrl . 'modules/gateways/paystack/pay.php" method="POST">
        <input type="hidden" name="email" value="' . $email . '" />
        <input type="hidden" name="amount" value="' . ($amount * 100) . '" />
        <input type="hidden" name="currency" value="' . $currencyCode . '" />
        <input type="hidden" name="invoiceid" value="' . $invoiceId . '" />
        <input type="hidden" name="public_key" value="' . $publicKey . '" />
        <input type="hidden" name="return_url" value="' . $returnUrl . '" />
        <button type="submit" class="btn btn-success rounded-pill px-4 fw-bold">' . $langPayNow . '</button>
    </form>';

    return $code;
}
