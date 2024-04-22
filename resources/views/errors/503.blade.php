<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maintenance Mode</title>
    <!-- Thêm Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .maintenance-container {
            margin-top: 100px;
            text-align: center;
        }
        .maintenance-icon {
            font-size: 100px;
            color: #dc3545;
        }
        .maintenance-title {
            font-size: 36px;
            color: #dc3545;
            margin-top: 20px;
        }
        .maintenance-message {
            font-size: 18px;
            margin-top: 20px;
        }
        .btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #c82333;
        }
        .additional-info {
            margin-top: 50px;
            font-size: 16px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3 maintenance-container">
                <i class="fas fa-tools maintenance-icon"></i>
                <h1 class="maintenance-title">System Maintenance</h1>
                <p class="maintenance-message">We are currently undergoing maintenance. Please check back later.</p>
                <button class="btn">Go Back</button>
                <div class="additional-info">
                    <p><strong>Estimated Maintenance Time:</strong> 2 hours</p>
                    <p><strong>Contact Support:</strong> support@example.com</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Thêm Font Awesome CSS cho biểu tượng -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</body>
</html>
