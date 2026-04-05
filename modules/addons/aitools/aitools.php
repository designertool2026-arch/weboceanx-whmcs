<?php
if (!defined("WHMCS")) die("This file cannot be accessed directly");

function aitools_config() {
    return [
        "name" => "AI Tools & Credit System",
        "description" => "Manage AI tools and user credits.",
        "version" => "1.0",
        "author" => "Architect",
        "fields" => [
            "credit_cost" => ["FriendlyName" => "Credit Cost per AI Action", "Type" => "text", "Size" => "5", "Default" => "1"],
        ]
    ];
}

function aitools_activate() {
    $table = "tbl_ai_credits";
    $query = "CREATE TABLE IF NOT EXISTS `{$table}` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `userid` INT NOT NULL,
        `credits` INT NOT NULL DEFAULT 0,
        `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    )";
    full_query($query);
}

function aitools_deactivate() {
    // Keep data for now
}

function aitools_output($vars) {
    // Admin panel logic here
    echo "<h2>AI Tools Management</h2>";
    // ...
}
