<?php
// user_logs.php
include 'db_connection.php';
session_start();

if (!isset($_SESSION['username']) || $_SESSION['role'] != 'admin') {
    header("Location: login.php");
    exit();
}

// Fetch user logs for super admin
$sql = "SELECT users.username, user_logs.action, user_logs.timestamp 
        FROM user_logs 
        JOIN users ON user_logs.user_id = users.id 
        ORDER BY user_logs.timestamp DESC";
$result = $conn->query($sql);

$page_title = "User Logs Page";
$page_content = '
    <style>
        /* General styling for the body */
        body {
            margin: 0;
            padding: 0;
            font-family: \'Arial\', sans-serif;
            background-color: #f4f4f9;
            display: flex;
        }

        /* Sidebar styling */
        .sidebar {
            width: 220px;
            background-color: #343a40;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            padding: 20px;
            overflow-y: auto;
        }

        /* Content area styling */
        .content {
            margin-left: 240px; /* Space for the sidebar */
            padding: 20px;
            width: calc(100% - 240px); /* Ensure the content area adjusts to the remaining width */
            background: linear-gradient(135deg, #D187F5, #FFFFFF);
            height: 100vh;
            overflow-y: auto; /* Make the content scrollable */
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        /* Header inside content */
        h1 {
            margin-top: 0;
        }
    </style>

    <div class="content">
        <h1>User Logs</h1>
        <table>
            <tr>
                <th>Username</th>
                <th>Action</th>
                <th>Date and Time (PHT)</th>
            </tr>';

while ($row = $result->fetch_assoc()) {
    $date = new DateTime($row['timestamp'], new DateTimeZone('UTC'));
    $date->setTimezone(new DateTimeZone('Asia/Manila'));
    $formatted_date = $date->format('Y-m-d H:i:s');

    $page_content .= '
            <tr>
                <td>' . $row['username'] . '</td>
                <td>' . $row['action'] . '</td>
                <td>' . $formatted_date . '</td>
            </tr>';
}

$page_content .= '
        </table>
    </div>
';

include 'template.php';
?>
