<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loading...</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #0a251c;
            color: #4ade80;
        }
        .loader {
            border: 8px solid #f3f3f3;
            border-top: 8px solid #4ade80;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            animation: spin 2s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="text-center">
        <div class="loader mb-4"></div>
        <h2 class="fw-bold">Preparing your cart...</h2>
    </div>
    <script>
        setTimeout(() => {
            window.location.href = '{$WEB_ROOT}/cart.php?a=view';
        }, 3000);
    </script>
</body>
</html>
