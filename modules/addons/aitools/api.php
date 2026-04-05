<?php
/**
 * AI Tools API for WHMCS
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
 * Handle AI tool requests
 */
function aitools_api_handler($action, $params) {
    $userId = $_SESSION['uid'];
    if (!$userId) {
        return ['status' => 'error', 'message' => 'Unauthorized access. Please log in.'];
    }
    
    // Get user credits
    $userCredits = Capsule::table('tbl_ai_credits')->where('userid', $userId)->value('credits');
    $credits = $userCredits ? $userCredits : 0;
    
    // Define costs per action
    $costs = [
        'generate' => 5,
        'chat' => 2,
        'logo' => 10,
        'branding' => 25,
        'site' => 50,
        'image' => 8,
    ];
    
    $cost = isset($costs[$action]) ? $costs[$action] : 0;
    
    if ($credits < $cost) {
        return ['status' => 'error', 'message' => 'Insufficient credits. Please top up your account.'];
    }
    
    // Deduct credits
    Capsule::table('tbl_ai_credits')->where('userid', $userId)->decrement('credits', $cost);
    
    // Log activity
    logActivity("AI Tool Used: Action '{$action}' by User ID {$userId}. Cost: {$cost} credits.");
    
    // Perform AI generation (In a real app, call an AI service)
    // For now, return a success response with mock data
    return [
        'status' => 'success',
        'message' => 'AI generation successful.',
        'data' => [
            'action' => $action,
            'result' => 'Mock AI Result for ' . $action,
            'remaining_credits' => $credits - $cost,
        ]
    ];
}
