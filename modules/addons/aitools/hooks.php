<?php
/**
 * AI Tools Hooks for WHMCS
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
 * Add credits after payment
 */
add_hook('InvoicePaid', 1, function($vars) {
    $invoiceId = $vars['invoiceid'];
    
    // Get invoice details
    $invoice = Capsule::table('tblinvoices')->where('id', $invoiceId)->first();
    if (!$invoice) return;
    $userId = $invoice->userid;
    
    // Check if invoice contains AI credits product
    $items = Capsule::table('tblinvoiceitems')->where('invoiceid', $invoiceId)->get();
    
    foreach ($items as $item) {
        // Logic to determine if this item is for AI credits
        // We look for "AI Credits" in the description or a specific product ID
        if (strpos(strtolower($item->description), 'ai credits') !== false) {
            // Extract amount of credits from description (e.g., "100 AI Credits")
            preg_match('/(\d+)\s+ai credits/i', $item->description, $matches);
            $creditsToAdd = isset($matches[1]) ? (int)$matches[1] : 100;
            
            // Update or create user credits record
            $userCredits = Capsule::table('tbl_ai_credits')->where('userid', $userId)->first();
            
            if ($userCredits) {
                Capsule::table('tbl_ai_credits')->where('userid', $userId)->increment('credits', $creditsToAdd);
            } else {
                Capsule::table('tbl_ai_credits')->insert([
                    'userid' => $userId,
                    'credits' => $creditsToAdd,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);
            }
            
            logActivity("AI Credits Added: {$creditsToAdd} credits added to User ID {$userId} for Invoice #{$invoiceId}");
        }
    }
});

/**
 * Inject credits into client area templates
 */
add_hook('ClientAreaPage', 1, function($vars) {
    $userId = isset($_SESSION['uid']) ? $_SESSION['uid'] : 0;
    $credits = 0;
    
    if ($userId) {
        $userCredits = Capsule::table('tbl_ai_credits')->where('userid', $userId)->value('credits');
        $credits = $userCredits ? $userCredits : 0;
    }
    
    return [
        'ai_credits' => $credits,
        'ai_credits_pid' => 1, // Replace with actual product ID for credits
        'gemini_api_key' => getenv('GEMINI_API_KEY'),
    ];
});
