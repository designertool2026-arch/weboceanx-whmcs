<?php
/**
 * AI Tools Addon Module for WHMCS
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

use WHMCS\Database\Capsule;

/**
 * Module configuration
 */
function aitools_config() {
    return [
        "name" => "AI Tools & Credits",
        "description" => "Manage AI tool access and user credits.",
        "version" => "1.0.0",
        "author" => "WebOceanX",
        "fields" => [
            "logo_cost" => [
                "FriendlyName" => "Logo Generator Cost",
                "Type" => "text",
                "Size" => "10",
                "Default" => "10",
                "Description" => "Credits per logo set",
            ],
            "name_cost" => [
                "FriendlyName" => "Name Generator Cost",
                "Type" => "text",
                "Size" => "10",
                "Default" => "5",
                "Description" => "Credits per generation",
            ],
            "branding_cost" => [
                "FriendlyName" => "Branding Generator Cost",
                "Type" => "text",
                "Size" => "10",
                "Default" => "25",
                "Description" => "Credits per brand kit",
            ],
            "site_cost" => [
                "FriendlyName" => "Site Builder Cost",
                "Type" => "text",
                "Size" => "10",
                "Default" => "50",
                "Description" => "Credits per website",
            ],
            "image_cost" => [
                "FriendlyName" => "Image Generator Cost",
                "Type" => "text",
                "Size" => "10",
                "Default" => "8",
                "Description" => "Credits per generation",
            ],
        ]
    ];
}

/**
 * Module activation
 */
function aitools_activate() {
    // Create database table
    try {
        if (!Capsule::schema()->hasTable('tbl_ai_credits')) {
            Capsule::schema()->create('tbl_ai_credits', function($table) {
                $table->increments('id');
                $table->integer('userid')->unique();
                $table->integer('credits')->default(0);
                $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
            });
        }
        
        return [
            'status' => 'success',
            'description' => 'AI Tools module activated and database table created successfully.'
        ];
    } catch (\Exception $e) {
        return [
            'status' => 'error',
            'description' => 'Unable to create table: ' . $e->getMessage()
        ];
    }
}

/**
 * Module deactivation
 */
function aitools_deactivate() {
    return [
        'status' => 'success',
        'description' => 'AI Tools module deactivated.'
    ];
}

/**
 * Admin area output
 */
function aitools_output($vars) {
    echo '<div class="alert alert-info">AI Tools Addon Module Admin Panel</div>';
    echo '<p>Manage user credits and tool costs from the module configuration.</p>';
    
    // List users and their credits
    echo '<table class="table table-striped">';
    echo '<thead><tr><th>User ID</th><th>Credits</th><th>Last Updated</th><th>Actions</th></tr></thead>';
    echo '<tbody>';
    echo '<tr><td>1</td><td>100</td><td>2026-04-05 10:00:00</td><td><button class="btn btn-sm btn-primary">Adjust</button></td></tr>';
    echo '</tbody>';
    echo '</table>';
}

/**
 * Client area output
 */
function aitools_clientarea($vars) {
    $action = isset($_GET['action']) ? $_GET['action'] : 'dashboard';
    
    // Handle AJAX credit deduction
    if ($action == 'deduct') {
        $userId = isset($_SESSION['uid']) ? $_SESSION['uid'] : 0;
        $amount = isset($_POST['amount']) ? (int)$_POST['amount'] : 0;
        
        if ($userId && $amount > 0) {
            $userCredits = Capsule::table('tbl_ai_credits')->where('userid', $userId)->first();
            
            if ($userCredits && $userCredits->credits >= $amount) {
                Capsule::table('tbl_ai_credits')->where('userid', $userId)->decrement('credits', $amount);
                echo json_encode(['status' => 'success', 'remaining' => $userCredits->credits - $amount]);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Insufficient credits']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
        exit;
    }
    
    $templateFile = 'aitools';
    $pageTitle = 'AI Tools Dashboard';
    
    switch($action) {
        case 'logo':
            $templateFile = 'ailogogenerator';
            $pageTitle = 'AI Logo Generator';
            break;
        case 'name':
            $templateFile = 'businessnamegenerator';
            $pageTitle = 'Business Name Generator';
            break;
        case 'branding':
            $templateFile = 'brandinggenerator';
            $pageTitle = 'AI Branding Generator';
            break;
        case 'site':
            $templateFile = 'aisitebuilder';
            $pageTitle = 'AI Site Builder';
            break;
        case 'image':
            $templateFile = 'aiimagegenerator';
            $pageTitle = 'AI Image Generator';
            break;
    }

    return [
        'pagetitle' => $pageTitle,
        'breadcrumb' => [
            'index.php?m=aitools' => 'AI Tools',
            'index.php?m=aitools&action=' . $action => $pageTitle
        ],
        'templatefile' => 'templates/' . $templateFile,
        'vars' => [
            'ai_credits' => 100, // This would be fetched from the database
        ],
    ];
}
